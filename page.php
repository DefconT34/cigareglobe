<?php
// ════════════════════════════════════════════════════════
// page.php — Le contenu, servi par le serveur
// ────────────────────────────────────────────────────────
// Une page par pays, par établissement et par maison, dans les six
// langues, plus l'atlas qui les relie. Six cent quarante adresses là où
// le plan de site en annonçait seize.
//
// CE QUE CETTE PAGE N'EST PAS : l'application. Pas de globe, pas de
// canvas, pas de panneaux. Elle sert du texte et des liens — ce qu'un
// robot lit, et ce qu'une connexion faible peut charger. Le bouton
// « voir sur le globe » renvoie vers l'application, à l'endroit exact
// (?country=cuba, ?lounge=42, ?brand=Cohiba : deeplinks.js les connaît
// déjà, rien à inventer côté client).
//
// LE PORTAIL D'ÂGE Y EST AUSSI, et c'est la loi qui le veut : ces pages
// sont des portes d'entrée depuis un moteur de recherche, souvent la
// PREMIÈRE page vue du site. Une porte d'entrée sans portail serait un
// contournement. Le même agegate.js est réemployé — une seule
// implémentation, avec les quatre chaînes dont il a besoin rendues
// ici plutôt que 200 Ko de dictionnaire chargés pour rien.
//
// UNE ADRESSE INTROUVABLE REND UN VRAI 404. Répondre 200 sur une page
// « rien ici » est ce que les moteurs appellent un soft 404 : ils
// l'indexent, puis dévaluent le site entier pour cause de pages vides.
// ════════════════════════════════════════════════════════

require_once __DIR__ . '/backend/pages_lib.php';

define('I18N_CHECK_INCLUDE', true);
require_once __DIR__ . '/tools/i18n_check.php';

const PAGE_RTL     = ['ar'];
const PAGE_LOCALES = ['fr'=>'fr_FR','en'=>'en_US','es'=>'es_ES','de'=>'de_DE','zh'=>'zh_CN','ar'=>'ar_SA'];

$LANGUES = langues_actives();
$lang = strtolower(trim((string)($_GET['lang'] ?? 'fr')));
if (!in_array($lang, $LANGUES, true)) $lang = 'fr';
$dir  = in_array($lang, PAGE_RTL, true) ? 'rtl' : 'ltr';

/**
 * Les libellés, mis en cache.
 *
 * i18n.js pèse plus de 200 Ko : l'analyser à chaque requête coûterait
 * l'essentiel du temps de réponse. Même mécanique qu'index.php, avec un
 * jeu de clés plus large — et régénéré dès que i18n.js change.
 */
function page_libelles(): array {
    $src   = __DIR__ . '/assets/js/i18n.js';
    $cache = __DIR__ . '/backend/cache/page_i18n.json';
    if (is_file($cache) && filemtime($cache) >= filemtime($src)) {
        $d = json_decode((string)file_get_contents($cache), true);
        if (is_array($d) && isset($d['fr'])) return $d;
    }
    $garde = ['seo_title','pg_atlas_t','pg_atlas_d','pg_globe','pg_fonde','pg_adresses',
              'pg_producteurs','pg_pays_caves','s_production','f_harvest','f_climate','f_soil',
              's_regions','s_varieties','s_tabacaleras','revenue_label','s_iconic',
              'gamme_depth_title','lounge_section_of','stat_countries','stat_brands',
              's_key_info','s_factories','zones_title','no_lounge_title','s_sommelier',
              'contrib_city_lbl','contrib_phone_lbl','contrib_type_lbl',
              'age_titre','age_texte','age_oui','age_non','age_sante','age_legal',
              'age_refus_titre','age_refus_texte','age_retour'];
    $out = [];
    foreach (i18n_parse($src) as $l => $paires) {
        foreach ($garde as $k) if (isset($paires[$k])) $out[$l][$k] = $paires[$k];
    }
    if (!is_dir(dirname($cache))) @mkdir(dirname($cache), 0755, true);
    @file_put_contents($cache, json_encode($out, JSON_UNESCAPED_UNICODE));
    return $out;
}
$LIB = page_libelles();
function L(string $k): string { global $LIB, $lang; return $LIB[$lang][$k] ?? $LIB['fr'][$k] ?? $k; }
function e(?string $s): string { return htmlspecialchars((string)$s, ENT_QUOTES, 'UTF-8'); }

/**
 * Le titre d'onglet : le sujet, puis le nom du site.
 *
 * DEUX PIÈGES, MESURÉS SUR UNE VRAIE FICHE. Le suffixe complet
 * (« CigarOdyssey — L'atlas mondial du cigare premium ») mange à lui
 * seul les soixante caractères qu'affiche un moteur ; et le NOM d'un
 * établissement porte souvent déjà sa rue, si bien qu'y rajouter la
 * ville donnait « Cigarro CI — Rue du Dr Blanchard Zone 4 — Abidjan,
 * Zone 4 — Rue du Docteur Blanchard — CigarOdyssey — … ». Cent trente
 * caractères, dont la moitié répétés.
 */
const PAGE_TITRE_MAX = 45;              // 45 + « — CigarOdyssey » = 60

function page_titre(string $sujet, string $complement = ''): string {
    $max = PAGE_TITRE_MAX;
    $sujet = trim($sujet);
    // La ville ne s'ajoute QUE si elle apporte quelque chose et qu'elle
    // tient. Tronquer un titre pour y loger la moitié d'une ville — le
    // premier essai rendait « … — Ab… » — n'aide personne : le nom
    // entier vaut mieux qu'un nom coupé suivi d'un fragment.
    $c = trim($complement);
    if ($c !== '') {
        $premier = trim(explode(',', $c)[0]);
        if ($premier !== '' && mb_stripos($sujet, $premier) === false
            && mb_strlen($sujet) + mb_strlen($premier) + 3 <= $max) {
            $sujet .= ' — ' . $premier;
        }
    }
    if (mb_strlen($sujet) > $max) $sujet = rtrim(mb_substr($sujet, 0, $max - 1), " \t,;:—-") . '…';
    return $sujet . ' — CigarOdyssey';
}

$type = (string)($_GET['type'] ?? 'atlas');
$id   = trim((string)($_GET['id'] ?? ''));

$db = null;
try { $db = getDB(); } catch (Throwable $ex) { $db = null; }

// ── Résolution ───────────────────────────────────────────
$titre = $desc = $h1 = ''; $corps = ''; $slug = ''; $filAriane = []; $jsonld = null;
$lienGlobe = '';

/** Un bloc de texte, seulement s'il y a du texte. */
function bloc(string $titre, ?string $texte): string {
    $texte = trim((string)$texte);
    if ($texte === '') return '';
    return '<section class="pg-bloc"><h2>' . e($titre) . '</h2><p>' . nl2br(e($texte)) . '</p></section>';
}

/**
 * Une liste, rendue en puces.
 *
 * `regions`, `varieties` et `tabacaleras` sont des TABLEAUX JSON en
 * base, pas des chaînes séparées par des virgules. Les découper sur la
 * virgule affichait `["Vuelta Abajo"` — crochet et guillemets compris —
 * et coupait au milieu de tout nom qui en contient une. On décode
 * d'abord, on ne retombe sur le découpage que pour les colonnes qui
 * n'ont jamais été du JSON.
 */
function bloc_liste(string $titre, ?string $brut): string {
    $brut = trim((string)$brut);
    if ($brut === '') return '';
    $j = json_decode($brut, true);
    if (is_array($j)) {
        $items = [];
        foreach ($j as $v) {
            $n = is_array($v) ? (string)($v['name'] ?? '') : (string)$v;
            if (trim($n) !== '') $items[] = trim($n);
        }
    } else {
        $items = array_filter(array_map('trim', preg_split('/\s*[,;]\s*/u', $brut)));
    }
    if (!$items) return '';
    $h = '<section class="pg-bloc"><h2>' . e($titre) . '</h2><ul class="pg-puces">';
    foreach ($items as $i) $h .= '<li>' . e($i) . '</li>';
    return $h . '</ul></section>';
}

if ($db === null) {
    http_response_code(503);
    $titre = 'Service momentanément indisponible';
    $h1 = $titre;
    $corps = '<p class="pg-vide">La base de données ne répond pas. Réessayez dans un instant.</p>';
} elseif ($type === 'atlas') {
    $slug = '';
    $titre = page_titre(L('pg_atlas_t'));
    $desc  = L('pg_atlas_d');
    $h1    = L('pg_atlas_t');
    $lienGlobe = page_racine() . page_prefixe($lang) . '/';

    $pays = page_pays_liste($db);
    $prod = array_values(array_filter($pays, fn($p) => (int)$p['producteur'] === 1));
    $autr = array_values(array_filter($pays, fn($p) => (int)$p['producteur'] !== 1));

    $corps .= '<p class="pg-chapo">' . e(L('pg_atlas_d')) . '</p>';
    foreach ([[L('pg_producteurs'), $prod], [L('pg_pays_caves'), $autr]] as [$t2, $liste]) {
        if (!$liste) continue;
        $corps .= '<section class="pg-bloc"><h2>' . e($t2) . ' <span class="pg-n">' . count($liste) . '</span></h2><ul class="pg-grille">';
        foreach ($liste as $p) {
            $corps .= '<li><a href="' . e(page_url('pays', $p['id'], $lang)) . '">'
                    . '<span class="pg-dr">' . e($p['flag']) . '</span> ' . e($p['name'])
                    . ((int)$p['caves'] > 0 ? ' <span class="pg-n">' . (int)$p['caves'] . '</span>' : '')
                    . '</a></li>';
        }
        $corps .= '</ul></section>';
    }
    $marques = page_marques_liste($db);
    $corps .= '<section class="pg-bloc"><h2>' . e(L('stat_brands')) . ' <span class="pg-n">' . count($marques) . '</span></h2><ul class="pg-grille">';
    foreach ($marques as $m) {
        $corps .= '<li><a href="' . e(page_url('marque', page_slug($m['name']), $lang)) . '">'
                . e($m['name']) . ($m['founded'] ? ' <span class="pg-n">' . e($m['founded']) . '</span>' : '')
                . '</a></li>';
    }
    $corps .= '</ul></section>';

} elseif ($type === 'pays') {
    $p = preg_match('/^[a-z0-9-]{1,60}$/', $id) ? page_pays($db, $id, $lang) : null;
    if ($p) {
        $slug = $p['id'];
        $h1    = $p['name'];
        $titre = page_titre($p['name']);
        $desc  = page_extrait((string)($p['production'] ?? '')) ?:
                 (L('lounge_section_of') . ' ' . $p['name'] . ' — ' . count($p['caves']) . ' ' . L('pg_adresses'));
        $filAriane = [[L('pg_atlas_t'), page_url('atlas', '', $lang)]];
        $lienGlobe = page_racine() . page_prefixe($lang) . '/?country=' . rawurlencode($p['id']);

        // Pas de grand drapeau isolé : Windows ne compose pas les
        // emoji de drapeau, et « CU » en 38 px sous le titre se lit
        // comme une coquille. Les petits, en tête de lien, restent —
        // ils sont accompagnés du nom du pays.
        $corps .= bloc(L('s_production'),   $p['production']   ?? null);
        $corps .= bloc(L('revenue_label'),  $p['revenue']      ?? null);
        $corps .= bloc(L('f_harvest'),      $p['harvest']      ?? null);
        $corps .= bloc(L('f_climate'),      $p['climate']      ?? null);
        $corps .= bloc(L('f_soil'),         $p['soil']         ?? null);
        $corps .= bloc_liste(L('s_regions'),      $p['regions']     ?? null);
        $corps .= bloc_liste(L('s_varieties'),    $p['varieties']   ?? null);
        $corps .= bloc_liste(L('s_tabacaleras'),  $p['tabacaleras'] ?? null);
        $corps .= bloc(L('s_sommelier'),    $p['notes']        ?? null);

        if ($p['zones']) {
            $corps .= '<section class="pg-bloc"><h2>' . e(L('zones_title')) . '</h2><ul class="pg-puces">';
            foreach ($p['zones'] as $z) {
                $corps .= '<li><strong>' . e($z['name']) . '</strong>'
                        . ($z['note'] ? ' — ' . e($z['note']) : '') . '</li>';
            }
            $corps .= '</ul></section>';
        }
        if ($p['marques']) {
            $corps .= '<section class="pg-bloc"><h2>' . e(L('s_iconic')) . ' <span class="pg-n">' . count($p['marques']) . '</span></h2><ul class="pg-grille">';
            foreach ($p['marques'] as $m) {
                $corps .= '<li><a href="' . e(page_url('marque', page_slug($m['name']), $lang)) . '">'
                        . e($m['name']) . '</a></li>';
            }
            $corps .= '</ul></section>';
        }
        // Les établissements, AVEC leur description : c'est ce qui fait
        // la substance d'une page de pays non producteur, qui n'a aucun
        // texte propre en base. Une liste de noms nus serait une page
        // vide aux yeux d'un moteur comme d'un lecteur.
        $corps .= '<section class="pg-bloc"><h2>' . e(L('lounge_section_of') . ' ' . $p['name'])
                . ' <span class="pg-n">' . count($p['caves']) . '</span></h2>';
        if (!$p['caves']) {
            $corps .= '<p class="pg-vide">' . e(L('no_lounge_title')) . '</p>';
        } else {
            $corps .= '<ul class="pg-cartes">';
            foreach ($p['caves'] as $c) {
                $corps .= '<li><a href="' . e(page_url('cave', $c['id'] . '-' . page_slug($c['name']), $lang)) . '">'
                        . '<strong>' . e($c['name']) . '</strong>'
                        . ($c['city'] ? ' <span class="pg-ville">' . e($c['city']) . '</span>' : '')
                        . '</a>'
                        . ($c['description'] ? '<p>' . e(page_extrait((string)$c['description'], 220)) . '</p>' : '')
                        . '</li>';
            }
            $corps .= '</ul>';
        }
        $corps .= '</section>';
    }

} elseif ($type === 'cave') {
    $num = (int)preg_replace('/\D.*$/', '', $id);
    $c = $num > 0 ? page_cave($db, $num, $lang) : null;
    if ($c) {
        $slug = $c['id'] . '-' . page_slug($c['name']);
        $h1    = $c['name'];
        $titre = page_titre($c['name'], (string)$c['city']);
        $desc  = page_extrait((string)$c['description']) ?: ($c['name'] . ' — ' . $c['city']);
        $filAriane = [[L('pg_atlas_t'), page_url('atlas', '', $lang)],
                      [$c['pays_nom'], page_url('pays', $c['country_id'], $lang)]];
        $lienGlobe = page_racine() . page_prefixe($lang) . '/?lounge=' . (int)$c['id'];

        $faits = [];
        if ($c['city'])  $faits[] = [L('contrib_city_lbl'),  $c['city']];
        if ($c['type'])  $faits[] = [L('contrib_type_lbl'),  $c['type']];
        if ($c['phone']) $faits[] = [L('contrib_phone_lbl'), $c['phone']];
        if ($c['price']) $faits[] = ['€', $c['price']];
        if ($c['hours']) $faits[] = ['⌚', $c['hours']];
        if ($faits) {
            $corps .= '<section class="pg-bloc"><h2>' . e(L('s_key_info')) . '</h2><dl class="pg-faits">';
            foreach ($faits as [$k, $v]) $corps .= '<dt>' . e($k) . '</dt><dd>' . e($v) . '</dd>';
            $corps .= '</dl></section>';
        }
        if (trim((string)$c['description']) !== '') {
            $corps .= '<section class="pg-bloc"><p class="pg-chapo">' . nl2br(e($c['description'])) . '</p></section>';
        }
        // Les liens sortants. Le lien de carte est construit depuis les
        // COORDONNÉES quand elles existent : `maps_url` n'est qu'une
        // RECHERCHE Google fabriquée depuis le nom et la ville, qui peut
        // tomber à côté — une position, elle, désigne le lieu.
        $liens = [];
        if (trim((string)$c['website']) !== '') {
            $liens[] = '<a href="' . e($c['website']) . '" rel="nofollow noopener" target="_blank">'
                     . e(preg_replace('#^https?://(www\.)?#i', '', $c['website'])) . ' ↗</a>';
        }
        if (trim((string)$c['instagram']) !== '') {
            $liens[] = '<a href="https://instagram.com/' . e(ltrim((string)$c['instagram'], '@'))
                     . '" rel="nofollow noopener" target="_blank">@' . e(ltrim((string)$c['instagram'], '@')) . ' ↗</a>';
        }
        if ($c['lat'] !== null && $c['lon'] !== null) {
            $liens[] = '<a href="https://www.google.com/maps/search/?api=1&query='
                     . e($c['lat'] . ',' . $c['lon'])
                     . '" rel="nofollow noopener" target="_blank">Google Maps ↗</a>';
        } elseif ($c['maps_url']) {
            $liens[] = '<a href="' . e($c['maps_url']) . '" rel="nofollow noopener" target="_blank">Google Maps ↗</a>';
        }
        if ($liens) $corps .= '<p class="pg-lien-ext">' . implode(' · ', $liens) . '</p>';
        $corps .= '<p class="pg-retour"><a href="' . e(page_url('pays', $c['country_id'], $lang)) . '">'
                . e($c['pays_drapeau'] . ' ' . L('lounge_section_of') . ' ' . $c['pays_nom']) . ' →</a></p>';

        // Donnees structurees : un etablissement est un LIEU, et c'est
        // ce que Google attend pour l'afficher autrement qu'en lien bleu.
        $jsonld = array_filter([
            '@context' => 'https://schema.org', '@type' => 'Store',
            'name' => $c['name'], 'description' => page_extrait((string)$c['description'], 300),
            'telephone' => $c['phone'] ?: null,
            'address' => array_filter(['@type' => 'PostalAddress',
                'addressLocality' => $c['city'] ?: null, 'addressCountry' => $c['pays_nom']]),
            // La position n'est declaree QUE si elle existe : un geo a
            // zero placerait l'etablissement dans le golfe de Guinee, et
            // Google le croirait.
            'geo' => ($c['lat'] !== null && $c['lon'] !== null)
                ? ['@type' => 'GeoCoordinates', 'latitude' => (float)$c['lat'], 'longitude' => (float)$c['lon']]
                : null,
            'openingHours' => $c['hours'] ?: null,
            'sameAs' => trim((string)$c['website']) !== '' ? [$c['website']] : null,
            'url' => page_url('cave', $slug, $lang),
        ]);
    }

} elseif ($type === 'marque') {
    $m = preg_match('/^[a-z0-9-]{1,80}$/', $id) ? page_marque($db, $id, $lang) : null;
    if ($m) {
        $slug = page_slug($m['name']);
        $h1    = $m['name'];
        $titre = page_titre($m['name']);
        $desc  = page_extrait((string)$m['history']) ?: $m['name'];
        $filAriane = [[L('pg_atlas_t'), page_url('atlas', '', $lang)]];
        if ($m['pays_nom']) $filAriane[] = [$m['pays_nom'], page_url('pays', $m['country_id'], $lang)];
        $lienGlobe = page_racine() . page_prefixe($lang) . '/?brand=' . rawurlencode($m['name']);

        $faits = [];
        if ($m['founded']) $faits[] = [L('pg_fonde'), $m['founded']];
        if ($m['factory']) $faits[] = [L('s_factories'), $m['factory']];
        if ($m['pays_nom']) $faits[] = [L('stat_countries'), $m['pays_nom']];
        if ($faits) {
            $corps .= '<dl class="pg-faits">';
            foreach ($faits as [$k, $v]) $corps .= '<dt>' . e($k) . '</dt><dd>' . e($v) . '</dd>';
            $corps .= '</dl>';
        }
        $corps .= bloc('', $m['history']);
        // La gamme est un tableau JSON de {name,...} : on n'en sert que
        // les noms, le reste appartient a la fiche de l'application.
        $gamme = json_decode((string)$m['gamme'], true);
        if (is_array($gamme) && $gamme) {
            $corps .= '<section class="pg-bloc"><h2>' . e(L('gamme_depth_title')) . '</h2><ul class="pg-grille">';
            foreach ($gamme as $g) {
                $nom = is_array($g) ? ($g['name'] ?? '') : (string)$g;
                if ($nom !== '') $corps .= '<li><span>' . e($nom) . '</span></li>';
            }
            $corps .= '</ul></section>';
        }
        if ($m['country_id'] && $m['pays_nom']) {
            $corps .= '<p class="pg-retour"><a href="' . e(page_url('pays', $m['country_id'], $lang)) . '">'
                    . e($m['pays_nom']) . ' →</a></p>';
        }
    }
}

// ── Introuvable ──────────────────────────────────────────
if ($h1 === '') {
    http_response_code(404);
    $titre = page_titre('404');
    $h1    = '404';
    $desc  = '';
    $corps = '<p class="pg-vide">'
           . '<a href="' . e(page_url('atlas', '', $lang)) . '">' . e(L('pg_atlas_t')) . ' →</a></p>';
    $noindex = true;
}

$urlIci = ($type === 'atlas') ? page_url('atlas', '', $lang) : page_url($type, $slug, $lang);
$racine = page_racine();

// Le .htaccess garde le HTML UNE HEURE dans le navigateur
// (ExpiresByType text/html). Pour ces pages c'est trop : une fiche
// corrigée resterait invisible une heure à qui vient de la lire, et une
// erreur 404 resterait mémorisée alors que la page peut naître dans la
// minute.
//
// Reprendre la main demande de poser Cache-Control ET Expires :
// mod_expires n'écrase pas le premier, il AJOUTE le sien à côté — d'où
// « max-age=300,max-age=3600 », deux directives contradictoires dans un
// même en-tête. Il s'abstient en revanche lorsqu'un Expires est déjà
// là. Voir cache_public() dans backend/config.php.
header('Content-Type: text/html; charset=utf-8');
if (empty($noindex)) { cache_public(300); } else { cache_jamais(); }

// Le bloc `<h1>` du portail d'age est devenu un `<p>` dans index.html :
// le seul titre de niveau 1 de chaque page etait « Avez-vous 18 ans ou
// plus ? ». Ici, le portail est rendu avec la meme regle.
?><!DOCTYPE html>
<html lang="<?= e($lang) ?>" data-theme="light" dir="<?= e($dir) ?>">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><?= e($titre) ?></title>
<meta name="description" content="<?= e($desc) ?>">
<?php if (!empty($noindex)): ?><meta name="robots" content="noindex">
<?php else: ?><link rel="canonical" href="<?= e($urlIci) ?>">
<?php foreach ($LANGUES as $l): ?>
<link rel="alternate" hreflang="<?= e($l) ?>" href="<?= e($type === 'atlas' ? page_url('atlas','',$l) : page_url($type, $slug, $l)) ?>">
<?php endforeach; ?>
<link rel="alternate" hreflang="x-default" href="<?= e($type === 'atlas' ? page_url('atlas','','fr') : page_url($type, $slug, 'fr')) ?>">
<meta property="og:type" content="article">
<meta property="og:site_name" content="CigarOdyssey">
<meta property="og:locale" content="<?= e(PAGE_LOCALES[$lang]) ?>">
<meta property="og:url" content="<?= e($urlIci) ?>">
<meta property="og:title" content="<?= e($titre) ?>">
<meta property="og:description" content="<?= e($desc) ?>">
<meta property="og:image" content="<?= e($racine) ?>/og-image.jpg">
<meta name="twitter:card" content="summary_large_image">
<?php endif; ?>
<link rel="icon" type="image/svg+xml" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🥃</text></svg>">
<link rel="stylesheet" href="<?= e(page_actif('assets/css/themes.css')) ?>">
<link rel="stylesheet" href="<?= e(page_actif('assets/css/page.css')) ?>">
<link rel="stylesheet" href="<?= e(page_actif('assets/css/agegate.css')) ?>">
<script>try{if(localStorage.getItem('cg_age18')==='1')document.documentElement.className+=' age-ok';}catch(e){document.documentElement.className+=' age-ok';}</script>
<?php if ($jsonld): ?>
<script type="application/ld+json"><?= json_encode($jsonld, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES) ?></script>
<?php endif; ?>
</head>
<body class="pg-body">

<header class="pg-hdr">
  <a class="pg-marque" href="<?= e($racine . page_prefixe($lang)) ?>/">CIGAR <span>ODYSSEY</span></a>
  <nav class="pg-langues" aria-label="Langues">
<?php foreach ($LANGUES as $l): if ($l === $lang) continue; ?>
    <a href="<?= e($type === 'atlas' ? page_url('atlas','',$l) : page_url($type, $slug, $l)) ?>" hreflang="<?= e($l) ?>"><?= e(strtoupper($l)) ?></a>
<?php endforeach; ?>
  </nav>
</header>

<main class="pg-main">
<?php if ($filAriane): ?>
  <nav class="pg-fil" aria-label="Fil d'Ariane">
<?php foreach ($filAriane as [$nom, $href]): ?><a href="<?= e($href) ?>"><?= e($nom) ?></a> <span>/</span> <?php endforeach; ?>
  </nav>
<?php endif; ?>
  <h1><?= e($h1) ?></h1>
<?= $corps ?>
<?php if ($lienGlobe): ?>
  <p class="pg-globe"><a href="<?= e($lienGlobe) ?>"><?= e(L('pg_globe')) ?> →</a></p>
<?php endif; ?>
</main>

<footer class="pg-pied">
  <p><?= e(L('age_sante')) ?></p>
  <p><a href="/legal.php"><?= e(L('age_legal')) ?></a> · <a href="<?= e(page_url('atlas','',$lang)) ?>"><?= e(L('pg_atlas_t')) ?></a></p>
</footer>

<div id="agegate" role="dialog" aria-modal="true" aria-labelledby="ag-titre">
  <div class="ag-box">
    <div class="ag-ey">CIGAR ODYSSEY</div>
    <p class="ag-titre" id="ag-titre"><?= e(L('age_titre')) ?></p>
    <p class="ag-txt"><?= e(L('age_texte')) ?></p>
    <div class="ag-btns">
      <button class="ag-oui" id="agOui"><?= e(L('age_oui')) ?></button>
      <button class="ag-non" id="agNon"><?= e(L('age_non')) ?></button>
    </div>
    <p class="ag-sante"><?= e(L('age_sante')) ?></p>
    <p class="ag-legal"><a href="/legal.php"><?= e(L('age_legal')) ?></a></p>
  </div>
</div>

<!-- agegate.js appelle t() sur quatre cles, et seulement au refus. On
     les rend ici plutot que de charger les 200 Ko d'i18n.js : une seule
     implementation du portail, sans le poids du dictionnaire. -->
<script>
window.t = (function (d) { return function (k) { return d[k] || k; }; })(<?= json_encode([
    'age_refus_titre' => L('age_refus_titre'),
    'age_refus_texte' => L('age_refus_texte'),
    'age_retour'      => L('age_retour'),
    'age_sante'       => L('age_sante'),
], JSON_UNESCAPED_UNICODE) ?>);
</script>
<script src="<?= e(page_actif('assets/js/agegate.js')) ?>"></script>
</body>
</html>
