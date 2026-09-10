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
              'age_refus_titre','age_refus_texte','age_retour',
              // La fiche de marque servait le NOM des lignes et rien
              // d'autre : ni cape, ni force, ni accords, alors que la
              // base les porte pour 117 maisons sur 118.
              'bm_pairings','bm_celebrities','bm_limited','gam_force','gam_cape',
              'force_light','force_light_medium','force_medium','force_medium_full','force_full',
              // Le rang de production et la macro-région : deux colonnes
              // que la page de pays SÉLECTIONNAIT sans jamais les rendre.
              'tier_major','tier_notable','tier_emerging',
              // D'où vient la fiche, et quand elle ne vient de nulle part.
              'pg_source','pg_source_reserve',
              // Cinq contenus qui n'avaient aucune adresse : les
              // feuilles, le lexique, les arômes, les marchés, et la
              // présence d'Habanos sur les pages de pays.
              'pg_feuilles_t','pg_feuilles_d','pg_lexique_t','pg_lexique_d',
              'pg_aromes_t','pg_aromes_d','pg_marches_t','pg_marches_d',
              'fe_emploi','fe_feuille','fe_genese','fe_culture','fe_caracteres',
              'fe_notes','fe_pairings','fe_cigares',
              'mkt_consumption','mkt_share','mkt_trend','mkt_lex_volume','mkt_world_rank',
              's_habanos','hab_no_rep','hab_founded','hab_ownership','hab_hq',
              'hab_revenue','hab_employees','hab_factories','hab_official_brands',
              'hab_distribution','hab_festival','hab_certifications',
              // Les données générales : huit champs par pays, servis par
              // aucune page avant la migration 169.
              'lex_general','lex_capital','lex_population','lex_area','lex_currency',
              'lex_language','lex_timezone','lex_gdp','lex_independence'];
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

/**
 * La même liste, mais À L'INTÉRIEUR d'un bloc déjà ouvert.
 *
 * Le bloc Habanos porte quatre listes sous un seul titre de section.
 * bloc_liste() ouvre sa propre `<section class="pg-bloc">` : l'employer
 * ici imbriquerait quatre sections dans une cinquième, toutes de même
 * classe, et le style comme la structure du document s'en trouveraient
 * faux. Un sous-titre suffit.
 */
function sous_liste(string $titre, ?string $brut): string {
    $entier = bloc_liste($titre, $brut);
    if ($entier === '') return '';
    $ul = substr($entier, (int)strpos($entier, '<ul'), -strlen('</section>'));
    return '<h3 class="pg-sous">' . e($titre) . '</h3>' . $ul;
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

    // LES LIENS COMPTENT AUTANT QUE LES PAGES — c'est écrit en tête de
    // pages_lib.php, et ces quatre-là seraient orphelines sans ce bloc.
    // Le plan de site fait connaître une adresse ; c'est un lien qui lui
    // donne du poids et qui fait revenir un robot. Placé AVANT les
    // listes de pays, parce qu'une page atteignable en un saut depuis le
    // haut de l'atlas n'est pas au même rang qu'une page citée après
    // cent dix-neuf maisons.
    $corps .= '<nav class="pg-portes">';
    foreach ([['feuilles', 'pg_feuilles_t', 'pg_feuilles_d'],
              ['lexique',  'pg_lexique_t',  'pg_lexique_d'],
              ['aromes',   'pg_aromes_t',   'pg_aromes_d'],
              ['marches',  'pg_marches_t',  'pg_marches_d']] as [$t3, $kt, $kd]) {
        $corps .= '<a href="' . e(page_url($t3, '', $lang)) . '">'
                . '<strong>' . e(L($kt)) . '</strong>'
                . '<span>' . e(page_extrait(L($kd), 90)) . '</span></a>';
    }
    $corps .= '</nav>';

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
        // QUATRE COLONNES ÉTAIENT SÉLECTIONNÉES SANS ÊTRE RENDUES.
        // `flag` l'est délibérément — voir la note ci-dessus. Les trois
        // autres, non : le rang de production, la macro-région et,
        // surtout, ce que le chiffre d'affaires MESURE.
        // SANS LIBELLÉ, ET C'EST VOULU. « ★ PRODUCTION MAJEURE » se
        // décrit tout seul ; le coiffer d'un « Informations clés »
        // n'ajoute rien. Quant à la macro-région — « Caraïbes » —, la
        // seule clé disponible est « Régions », déjà employée plus bas
        // pour les régions de CULTURE (Vuelta Abajo, Partido…). Deux
        // blocs du même nom disant deux choses différentes seraient pires
        // que pas de libellé du tout.
        $bandeau = [];
        if (($p['tier'] ?? '') !== '') {
            $cle = 'tier_' . strtolower((string)$p['tier']);
            $lib = L($cle);
            if ($lib !== $cle) $bandeau[] = $lib;
        }
        if (trim((string)($p['region'] ?? '')) !== '') $bandeau[] = trim((string)$p['region']);
        if ($bandeau) {
            $corps .= '<p class="pg-rang">' . e(implode(' · ', $bandeau)) . '</p>';
        }

        // ── LES DONNÉES GÉNÉRALES ───────────────────────────
        // Huit champs par pays, dix-sept pays, cent trente-six valeurs —
        // et aucune page serveur ne les rendait. Elles viennent AVANT le
        // tabac, comme dans l'application : on situe le pays, puis on
        // parle de ce qu'il cultive.
        //
        // Trois d'entre elles portent des mots et passent par les
        // colonnes traduites de la migration 169. Les cinq autres sont
        // des noms propres et des nombres, servis tels quels.
        if (!empty($p['geo'])) {
            $g = $p['geo'];
            $gf = [];
            foreach ([[L('lex_capital'), $g['capital']], [L('lex_population'), $g['population']],
                      [L('lex_area'), $g['area']],       [L('lex_currency'), $g['currency']],
                      [L('lex_language'), $g['language']], [L('lex_timezone'), $g['timezone']],
                      [L('lex_gdp'), $g['gdp']],         [L('lex_independence'), $g['independent']]] as [$k, $v]) {
                // UN TIRET N'EST PAS UNE VALEUR. Le PIB des Canaries est
                // stocké « — » : c'est un marqueur d'absence, hérité de
                // l'application, qui l'affiche pour tenir sa grille. Une
                // page servie n'a pas de grille à tenir, et « PIB : — »
                // coifferait le vide d'un libellé — exactement ce que le
                // cliquet des trous déclarés interdit deux blocs plus bas.
                if (in_array(trim((string)$v), ['', '—', '–', '-', 'N/A'], true)) continue;
                $gf[] = [$k, (string)$v];
            }
            if ($gf) {
                $corps .= '<section class="pg-bloc"><h2>' . e(L('lex_general')) . '</h2><dl class="pg-faits">';
                foreach ($gf as [$k, $v]) $corps .= '<dt>' . e($k) . '</dt><dd>' . e($v) . '</dd>';
                $corps .= '</dl></section>';
            }
        }

        $corps .= bloc(L('s_production'),   $p['production']   ?? null);

        // LE CHIFFRE D'AFFAIRES NE SE SERT PAS SEUL. « 0,58 M$ (2024) »
        // ne dit pas ce qu'on a compté ; `rev_detail` le dit —
        // « exportations de cigares et cigarillos (douanes
        // brésiliennes) ». Le champ existait, traduit, pour les seize
        // pays producteurs, et n'atteignait aucun lecteur.
        //
        // Les Canaries ont un rev_detail SANS revenue : le bloc se rend
        // donc dès que l'un des deux est là, sinon la seule fiche qui
        // n'a que l'explication perdrait aussi l'explication.
        $rev = trim((string)($p['revenue'] ?? ''));
        $det = trim((string)($p['rev_detail'] ?? ''));
        if ($rev !== '' || $det !== '') {
            $corps .= '<section class="pg-bloc"><h2>' . e(L('revenue_label')) . '</h2>';
            if ($rev !== '') $corps .= '<p class="pg-chiffre">' . e($rev) . '</p>';
            if ($det !== '') $corps .= '<p class="pg-source-chiffre">' . nl2br(e($det)) . '</p>';
            $corps .= '</section>';
        }
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
        // ── LA PRÉSENCE D'HABANOS ───────────────────────────
        // Douze pays en portent une, et aucune n'atteignait le serveur :
        // statut, actionnariat, siège, manufactures, distributeurs,
        // festival, certifications. C'est le plus gros des cinq contenus
        // muets — quatre mille caractères de description à eux seuls.
        //
        // `present` DISTINGUE DEUX CHOSES QU'IL NE FAUT PAS CONFONDRE :
        // quatre pays ont une représentation Habanos, huit n'en ont pas
        // et sont là pour une autre raison — le Brésil pour la Mata
        // Fina, l'Équateur pour ses capes. Le statut le dit en toutes
        // lettres, et le libellé `hab_no_rep` existe pour les seconds.
        if ($hab = page_habanos($db, (string)$p['id'], $lang)) {
            $corps .= '<section class="pg-bloc"><h2>' . e(L('s_habanos')) . '</h2>';
            if (trim((string)$hab['status']) !== '') {
                $corps .= '<p class="pg-rang">' . e((string)$hab['status']) . '</p>';
            } elseif (!(int)$hab['present']) {
                $corps .= '<p class="pg-rang">' . e(L('hab_no_rep')) . '</p>';
            }
            if (trim((string)$hab['description']) !== '') {
                $corps .= '<p>' . nl2br(e((string)$hab['description'])) . '</p>';
            }

            $hf = [];
            foreach ([[L('hab_founded'), $hab['founded']], [L('hab_ownership'), $hab['ownership']],
                      [L('hab_hq'), $hab['hq']],           [L('hab_revenue'), $hab['revenue']],
                      [L('hab_employees'), $hab['employees']],
                      [L('hab_festival'), $hab['festival']]] as [$k, $v]) {
                if (trim((string)$v) !== '') $hf[] = [$k, (string)$v];
            }
            if ($hf) {
                $corps .= '<dl class="pg-faits">';
                foreach ($hf as [$k, $v]) $corps .= '<dt>' . e($k) . '</dt><dd>' . e($v) . '</dd>';
                $corps .= '</dl>';
            }

            // Les manufactures portent un objet par entrée — nom, ville,
            // année, marques — là où les trois autres listes ne portent
            // que des chaînes. bloc_liste() ne garderait que le nom.
            $us = json_decode((string)$hab['factories'], true);
            if (is_array($us) && $us) {
                $corps .= '<h3 class="pg-sous">' . e(L('hab_factories')) . '</h3><ul class="pg-modules">';
                foreach ($us as $u) {
                    if (!is_array($u) || trim((string)($u['name'] ?? '')) === '') continue;
                    $meta = array_filter([trim((string)($u['city'] ?? '')), trim((string)($u['founded'] ?? ''))]);
                    $corps .= '<li><h3>' . e((string)$u['name']) . '</h3>';
                    if ($meta) $corps .= '<p class="pg-mod-meta">' . e(implode(' · ', $meta)) . '</p>';
                    $mq = $u['marques'] ?? null;
                    if (is_array($mq) && $mq) {
                        $corps .= '<p class="pg-mod-vit">' . e(implode(' · ', array_map('strval', $mq))) . '</p>';
                    }
                    $corps .= '</li>';
                }
                $corps .= '</ul>';
            }

            $corps .= sous_liste(L('hab_official_brands'), $hab['marques_officielles'] ?? null)
                    . sous_liste(L('hab_certifications'),  $hab['certifications'] ?? null);

            $ds = json_decode((string)$hab['distributeurs'], true);
            if (is_array($ds) && $ds) {
                $corps .= '<h3 class="pg-sous">' . e(L('hab_distribution')) . '</h3><dl class="pg-faits">';
                foreach ($ds as $d) {
                    if (!is_array($d)) continue;
                    $ou = trim((string)($d['pays'] ?? ''));
                    $qui = trim((string)($d['distributeur'] ?? ''));
                    if ($qui === '') continue;
                    $corps .= '<dt>' . e($ou !== '' ? $ou : '—') . '</dt><dd>' . e($qui) . '</dd>';
                }
                $corps .= '</dl>';
            }
            $corps .= '</section>';
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
        // Les liens sortants. Le lien de carte est CONSTRUIT ici, depuis
        // ce que la fiche porte à cet instant — coordonnées si elle en a,
        // nom et ville sinon. La colonne `maps_url` n'est plus lue : elle
        // gardait un lien fabriqué à la saisie, que les corrections de nom
        // et d'adresse laissaient en arrière. Voir backend/carte_lib.php.
        $liens = [];
        if (trim((string)$c['website']) !== '') {
            $liens[] = '<a href="' . e($c['website']) . '" rel="nofollow noopener" target="_blank">'
                     . e(preg_replace('#^https?://(www\.)?#i', '', $c['website'])) . ' ↗</a>';
        }
        if (trim((string)$c['instagram']) !== '') {
            $liens[] = '<a href="https://instagram.com/' . e(ltrim((string)$c['instagram'], '@'))
                     . '" rel="nofollow noopener" target="_blank">@' . e(ltrim((string)$c['instagram'], '@')) . ' ↗</a>';
        }
        $carte = carte_lien((string)$c['name'], (string)$c['city'], $c['lat'], $c['lon']);
        if ($carte !== null) {
            $liens[] = '<a href="' . e($carte) . '" rel="nofollow noopener" target="_blank">Google Maps ↗</a>';
        }
        if ($liens) $corps .= '<p class="pg-lien-ext">' . implode(' · ', $liens) . '</p>';

        // ── D'OÙ VIENT CETTE FICHE ──────────────────────────
        // La colonne `source` était SÉLECTIONNÉE et rendue nulle part.
        // 407 fiches sur 408 en portent une — 9 377 caractères qui
        // n'atteignaient aucun lecteur. Tout le chantier des quatre
        // blocs s'est mené au nom de « aucune fiche sans source » ;
        // servir la fiche en taisant sa source rend cette règle
        // invérifiable par celui à qui elle est destinée.
        //
        // DEUX CAS, ET ILS NE SE RENDENT PAS PAREIL.
        //
        // 1. UNE CITATION — « habanos.com officiel 2024 », « PDF
        //    officiel Habanos S.A. », « cigarjournal.com ». Elle se rend
        //    TELLE QUELLE, dans toutes les langues, comme une référence
        //    bibliographique : on ne traduit pas une référence. Le mot
        //    « officiel » qui suit un domaine dans une trentaine de
        //    valeurs est un qualificatif de la citation, pas une phrase.
        //    Une seule valeur sur 173 est de la prose sans domaine
        //    (#2524, Alvear Palace) : elle est VRAIE, et lui fabriquer
        //    un domaine pour faire propre serait exactement la faute que
        //    ce chantier a passé quatre blocs à défaire.
        //
        // 2. « à vérifier — … » — CE N'EST PAS UNE SOURCE, c'est son
        //    absence. Dix-huit fiches publiées en portent une, posée
        //    délibérément par la migration 155 : quinze salons d'hôtel
        //    d'Afrique de l'Ouest et trois autres qu'on ne peut ni
        //    confirmer ni démentir, gardés pour ne pas faire disparaître
        //    de l'atlas ce qui est seulement moins indexé. Cette
        //    décision tenait sur une phrase — « le champ `source` dit
        //    désormais exactement l'état ». Il ne le disait à personne.
        //    On rend donc la RÉSERVE, traduite, et non la note française
        //    qui la détaille : le lecteur allemand doit lire « nicht
        //    bestätigte Angabe », pas une phrase française.
        $src = trim((string)($c['source'] ?? ''));
        if ($src !== '') {
            $reserve = (bool)preg_match('/^\s*(à|a)\s+v[ée]rifier\b/iu', $src);
            $corps .= $reserve
                ? '<p class="pg-reserve">⚠ ' . e(L('pg_source_reserve')) . '</p>'
                : '<p class="pg-source">' . e(L('pg_source')) . ' : ' . e($src) . '</p>';
        }

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
        // L'HISTOIRE N'A PAS DE TITRE, et n'en veut pas : c'est le
        // chapô de la fiche. Elle passait par bloc('') — qui posait un
        // « <h2></h2> » VIDE sur les cent vingt maisons. Un titre de
        // niveau deux sans texte n'est pas invisible : un lecteur
        // d'écran l'annonce, et il ouvre une section qui ne dit pas de
        // quoi elle parle. La fiche d'établissement rendait déjà son
        // texte en `pg-chapo` sans titre ; on fait pareil.
        if (trim((string)$m['history']) !== '') {
            $corps .= '<section class="pg-bloc"><p class="pg-chapo">'
                    . nl2br(e((string)$m['history'])) . '</p></section>';
        }

        // LA GAMME, ENTIÈRE. Elle ne servait que les NOMS des lignes :
        // « le reste appartient à la fiche de l'application », disait
        // le commentaire. Cela laissait la cape, la force, les vitoles
        // et le texte de chaque module hors de la page indexable —
        // 279 modules sur 117 maisons, invisibles pour qui n'exécute
        // pas JavaScript. La donnée existait, la page ne la servait pas.
        $gamme = json_decode((string)$m['gamme'], true);
        if (is_array($gamme) && $gamme) {
            $corps .= '<section class="pg-bloc"><h2>' . e(L('gamme_depth_title')) . '</h2>'
                    . '<ul class="pg-modules">';
            foreach ($gamme as $g) {
                if (!is_array($g)) { $g = ['name' => (string)$g]; }
                $nom = trim((string)($g['name'] ?? ''));
                if ($nom === '') continue;
                $corps .= '<li><h3>' . e($nom) . '</h3>';

                // Cape et force sur une même ligne. La force est stockée
                // en anglais (« Medium-Full ») et se traduit par une clé
                // dédiée ; à défaut, on rend la valeur telle quelle
                // plutôt que rien.
                $meta = [];
                if (trim((string)($g['wrapper'] ?? '')) !== '') {
                    $meta[] = '<span><b>' . e(L('gam_cape')) . '</b> ' . e($g['wrapper']) . '</span>';
                }
                if (trim((string)($g['force'] ?? '')) !== '') {
                    $cle = 'force_' . strtolower(str_replace('-', '_', (string)$g['force']));
                    $lib = L($cle);
                    $meta[] = '<span><b>' . e(L('gam_force')) . '</b> '
                            . e($lib === $cle ? $g['force'] : $lib) . '</span>';
                }
                if ($meta) $corps .= '<p class="pg-mod-meta">' . implode(' · ', $meta) . '</p>';

                if (trim((string)($g['story'] ?? '')) !== '') {
                    $corps .= '<p>' . nl2br(e($g['story'])) . '</p>';
                }
                $vit = array_filter(array_map('strval', (array)($g['vitolas'] ?? [])),
                                    fn($v) => trim($v) !== '');
                if ($vit) {
                    $corps .= '<p class="pg-mod-vit">' . e(implode(' · ', $vit)) . '</p>';
                }
                $corps .= '</li>';
            }
            $corps .= '</ul></section>';
        }

        // LES ACCORDS. Le champ était SÉLECTIONNÉ par la requête et
        // n'était affiché nulle part — 117 maisons en portent.
        $acc = json_decode((string)$m['pairings'], true);
        if (is_array($acc) && $acc) {
            $corps .= '<section class="pg-bloc"><h2>' . e(L('bm_pairings')) . '</h2><ul class="pg-modules">';
            foreach ($acc as $a) {
                if (!is_array($a)) continue;
                $nom = trim((string)($a['name'] ?? ''));
                if ($nom === '') continue;
                $corps .= '<li><h3>' . e($nom) . '</h3>';
                if (trim((string)($a['type'] ?? '')) !== '') {
                    $corps .= '<p class="pg-mod-meta"><span>' . e($a['type']) . '</span></p>';
                }
                if (trim((string)($a['notes'] ?? '')) !== '') {
                    $corps .= '<p>' . nl2br(e($a['notes'])) . '</p>';
                }
                $corps .= '</li>';
            }
            $corps .= '</ul></section>';
        }

        // LES FIGURES ASSOCIÉES (48 maisons).
        $cel = json_decode((string)$m['celebrities'], true);
        if (is_array($cel) && $cel) {
            $corps .= '<section class="pg-bloc"><h2>' . e(L('bm_celebrities')) . '</h2><ul class="pg-modules">';
            foreach ($cel as $c) {
                if (!is_array($c)) continue;
                $nom = trim((string)($c['name'] ?? ''));
                if ($nom === '') continue;
                $corps .= '<li><h3>' . e($nom) . '</h3>';
                if (trim((string)($c['anecdote'] ?? '')) !== '') {
                    $corps .= '<p>' . nl2br(e($c['anecdote'])) . '</p>';
                }
                $corps .= '</li>';
            }
            $corps .= '</ul></section>';
        }

        // LES ÉDITIONS LIMITÉES (42 maisons) : une liste de noms
        // propres, sans texte et sans traduction.
        $eds = json_decode((string)$m['limited_eds'], true);
        if (is_array($eds) && $eds) {
            $lignes = array_filter(array_map(
                fn($x) => is_array($x) ? trim((string)($x['name'] ?? '')) : trim((string)$x), $eds));
            if ($lignes) {
                $corps .= '<section class="pg-bloc"><h2>' . e(L('bm_limited')) . '</h2><ul class="pg-grille">';
                foreach ($lignes as $l) $corps .= '<li><span>' . e($l) . '</span></li>';
                $corps .= '</ul></section>';
            }
        }
        // ── D'OÙ VIENT CETTE FICHE ──────────────────────────
        // Même bloc que sur la fiche d'établissement, et pour la même
        // raison : la doctrine du projet est « aucune fiche sans
        // source », et servir la fiche en taisant sa source rend cette
        // règle invérifiable par celui à qui elle est destinée.
        //
        // ELLE ÉTAIT VÉRIFIABLE POUR LES CAVES ET INVISIBLE POUR LES
        // MAISONS. `lounges.source` existe depuis toujours ; `brands`
        // n'avait pas de colonne du tout avant la migration 195 — alors
        // que les maisons sont ce que l'atlas écrit le plus.
        //
        // CENT CINQ MAISONS SUR 182 N'EN ONT PAS, et le bloc ne s'écrit
        // simplement pas pour elles. C'est voulu : leur source n'a
        // jamais été enregistrée, et en fabriquer une pour faire propre
        // serait exactement la faute que `tools/sources.php` a été écrit
        // pour attraper. Le trou se lit dans cet outil, pas en prose
        // vague au bas d'une fiche.
        //
        // La réserve « à vérifier » garde le sens qu'elle a chez les
        // caves : ce n'est pas une source, c'est son absence déclarée,
        // et on rend la mention TRADUITE plutôt que la note française.
        $src = trim((string)($m['source'] ?? ''));
        if ($src !== '') {
            $reserve = (bool)preg_match('/^\s*(à|a)\s+v[ée]rifier\b/iu', $src);
            $corps .= $reserve
                ? '<p class="pg-reserve">⚠ ' . e(L('pg_source_reserve')) . '</p>'
                : '<p class="pg-source">' . e(L('pg_source')) . ' : ' . e($src) . '</p>';
        }

        if ($m['country_id'] && $m['pays_nom']) {
            $corps .= '<p class="pg-retour"><a href="' . e(page_url('pays', $m['country_id'], $lang)) . '">'
                    . e($m['pays_nom']) . ' →</a></p>';
        }
    }

// ══ CINQ CONTENUS QUI N'AVAIENT AUCUNE ADRESSE ═══════════
// Les feuilles, le lexique, les arômes, les marchés et la présence
// d'Habanos vivaient en base, traduits en six langues, et n'étaient
// servis que par l'application JavaScript. Rien ne les exposait : ni
// adresse, ni lien, ni plan de site. Un robot ne pouvait pas les
// atteindre, et un lecteur sans JavaScript non plus.

} elseif ($type === 'feuilles') {
    $titre = page_titre(L('pg_feuilles_t'));
    $desc  = L('pg_feuilles_d');
    $h1    = L('pg_feuilles_t');
    $filAriane = [[L('pg_atlas_t'), page_url('atlas', '', $lang)]];
    $corps .= '<p class="pg-chapo">' . e(L('pg_feuilles_d')) . '</p>';

    // GROUPÉES PAR PAYS, parce qu'une feuille est d'abord un terroir.
    // Une liste alphabétique de trente noms ne dirait rien ; « Brésil :
    // Mata Fina, Mata Norte, Arapiraca » dit tout de suite pourquoi ces
    // trois-là se ressemblent.
    $parPays = [];
    foreach (page_feuilles_liste($db, $lang) as $f) {
        $parPays[(string)$f['pays_nom']][] = $f;
    }
    foreach ($parPays as $paysNom => $liste) {
        $corps .= '<section class="pg-bloc"><h2>' . e(trim((string)$liste[0]['pays_drapeau'] . ' ' . $paysNom))
                . ' <span class="pg-n">' . count($liste) . '</span></h2><ul class="pg-modules">';
        foreach ($liste as $f) {
            $corps .= '<li><h3><a href="' . e(page_url('feuille', (string)$f['id'], $lang)) . '">'
                    . e((string)$f['name']) . '</a></h3>';
            if (trim((string)$f['emploi']) !== '') {
                $corps .= '<p class="pg-mod-meta"><b>' . e(L('fe_emploi')) . '</b> ' . e((string)$f['emploi']) . '</p>';
            }
            if (trim((string)$f['caracteres']) !== '') {
                $corps .= '<p>' . e(page_extrait((string)$f['caracteres'], 150)) . '</p>';
            }
            $corps .= '</li>';
        }
        $corps .= '</ul></section>';
    }

} elseif ($type === 'feuille') {
    $f = page_feuille($db, $id, $lang);
    if ($f) {
        $slug  = (string)$f['id'];
        $h1    = (string)$f['name'];
        $titre = page_titre((string)$f['name'], (string)$f['pays_nom']);
        $desc  = page_extrait((string)$f['caracteres']) ?: ($f['name'] . ' — ' . $f['pays_nom']);
        $filAriane = [[L('pg_atlas_t'), page_url('atlas', '', $lang)],
                      [L('pg_feuilles_t'), page_url('feuilles', '', $lang)]];

        $bandeau = [];
        if (trim((string)$f['emploi']) !== '')   $bandeau[] = trim((string)$f['emploi']);
        if (trim((string)$f['pays_nom']) !== '') $bandeau[] = trim((string)$f['pays_nom']);
        if ($bandeau) $corps .= '<p class="pg-rang">' . e(implode(' · ', $bandeau)) . '</p>';

        $corps .= bloc(L('fe_genese'),     $f['genese']     ?? null);
        $corps .= bloc(L('fe_culture'),    $f['culture']    ?? null);
        $corps .= bloc(L('fe_caracteres'), $f['caracteres'] ?? null);
        $corps .= bloc_liste(L('fe_notes'),    $f['notes']    ?? null);
        $corps .= bloc_liste(L('fe_pairings'), $f['pairings'] ?? null);

        if ($f['cigares']) {
            $corps .= '<section class="pg-bloc"><h2>' . e(L('fe_cigares')) . '</h2><ul class="pg-modules">';
            foreach ($f['cigares'] as $c) {
                $corps .= '<li><h3>' . e($c['name']) . '</h3>'
                        . ($c['desc'] !== '' ? '<p>' . e($c['desc']) . '</p>' : '') . '</li>';
            }
            $corps .= '</ul></section>';
        }
        if ($f['country_id'] && $f['pays_nom']) {
            $corps .= '<p class="pg-retour"><a href="' . e(page_url('pays', (string)$f['country_id'], $lang)) . '">'
                    . e(trim((string)$f['pays_drapeau'] . ' ' . $f['pays_nom'])) . ' →</a></p>';
        }
    }

} elseif ($type === 'lexique') {
    $titre = page_titre(L('pg_lexique_t'));
    $desc  = L('pg_lexique_d');
    $h1    = L('pg_lexique_t');
    $filAriane = [[L('pg_atlas_t'), page_url('atlas', '', $lang)]];
    $corps .= '<p class="pg-chapo">' . e(L('pg_lexique_d')) . '</p>';

    // UNE SEULE PAGE POUR VINGT TERMES, et c'est un choix. Une
    // définition de deux phrases ne fait pas une page : vingt adresses
    // maigres se seraient concurrencées entre elles. Un glossaire d'une
    // traite se lit, se cherche au clavier, et tient en une adresse. Les
    // ancres permettent d'en viser un seul.
    $corps .= '<dl class="pg-lex">';
    foreach (page_lexique_liste($db, $lang) as $t) {
        $var = array_filter(array_map('trim', explode('|', (string)$t['variantes'])));
        $corps .= '<dt id="' . e('lex-' . (string)$t['id']) . '">' . e((string)$t['terme']);
        if ($var) $corps .= ' <span class="pg-lex-var">' . e(implode(' · ', $var)) . '</span>';
        $corps .= '</dt><dd>' . nl2br(e((string)$t['definition'])) . '</dd>';
    }
    $corps .= '</dl>';

} elseif ($type === 'aromes') {
    $titre = page_titre(L('pg_aromes_t'));
    $desc  = L('pg_aromes_d');
    $h1    = L('pg_aromes_t');
    $filAriane = [[L('pg_atlas_t'), page_url('atlas', '', $lang)]];
    $corps .= '<p class="pg-chapo">' . e(L('pg_aromes_d')) . '</p>';

    // DEUX CHOSES DIFFÉRENTES SOUS UNE MÊME TABLE : `contexte` distingue
    // ce qu'on TROUVE dans un cigare (note) de ce qu'on lui PROPOSE
    // (accord). Les mélanger ferait croire qu'on boit du cuir.
    $parContexte = ['note' => [], 'accord' => []];
    foreach (page_aromes_liste($db, $lang) as $a) {
        $c = (string)$a['contexte'];
        if (!isset($parContexte[$c])) $parContexte[$c] = [];
        $parContexte[$c][] = $a;
    }
    foreach ([['note', L('fe_notes')], ['accord', L('fe_pairings')]] as [$cle, $lib]) {
        if (empty($parContexte[$cle])) continue;
        $corps .= '<section class="pg-bloc"><h2>' . e($lib)
                . ' <span class="pg-n">' . count($parContexte[$cle]) . '</span></h2><ul class="pg-modules">';
        foreach ($parContexte[$cle] as $a) {
            $corps .= '<li><h3>' . e(ucfirst((string)$a['famille'])) . '</h3>'
                    . '<p>' . nl2br(e((string)$a['texte'])) . '</p></li>';
        }
        $corps .= '</ul></section>';
    }

} elseif ($type === 'marches') {
    $titre = page_titre(L('pg_marches_t'));
    $desc  = L('pg_marches_d');
    $h1    = L('pg_marches_t');
    $filAriane = [[L('pg_atlas_t'), page_url('atlas', '', $lang)]];
    $corps .= '<p class="pg-chapo">' . e(L('pg_marches_d')) . '</p>';

    foreach (page_marches_liste($db, $lang) as $m) {
        $corps .= '<section class="pg-bloc"><h2>' . e(trim((string)$m['flag'] . ' ' . $m['name']));
        if ((int)$m['rank_num'] > 0) {
            $corps .= ' <span class="pg-n">' . e(L('mkt_world_rank')) . ' ' . (int)$m['rank_num'] . '</span>';
        }
        $corps .= '</h2>';

        $faits = [];
        foreach ([[L('mkt_consumption'), $m['consumption']], [L('mkt_lex_volume'), $m['cigars']],
                  [L('mkt_share'), $m['share']],             [L('mkt_trend'), $m['trend']]] as [$k, $v]) {
            if (trim((string)$v) !== '') $faits[] = [$k, (string)$v];
        }
        if ($faits) {
            $corps .= '<dl class="pg-faits">';
            foreach ($faits as [$k, $v]) $corps .= '<dt>' . e($k) . '</dt><dd>' . e($v) . '</dd>';
            $corps .= '</dl>';
        }
        if (trim((string)$m['note']) !== '') $corps .= '<p>' . nl2br(e((string)$m['note'])) . '</p>';

        $tb = json_decode((string)$m['top_brands'], true);
        if (is_array($tb) && $tb) {
            $corps .= '<p class="pg-mod-vit">' . e(implode(' · ', array_map('strval', $tb))) . '</p>';
        }
        $corps .= '</section>';
    }
}

// ── La mesure ────────────────────────────────────────────
// POSÉE ICI, ET PAS PLUS HAUT. À ce point la résolution est faite : on
// sait si la page existe. Compter avant, ce serait compter les 404 et
// les adresses tapées au hasard comme des visites.
//
// Elle ne compte donc QUE les pages réellement servies, et le fait
// sans cookie, sans tiers et sans conserver d'adresse IP — voir
// backend/audience.php, qui ne peut pas faire échouer cette page.
if ($h1 !== '') {
    require_once __DIR__ . '/backend/audience.php';
    audience_noter($db, $type, $type . '/' . $id, $lang);
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

// LE TYPE VIENT DE L'ADRESSE, donc de l'extérieur. Les règles de
// réécriture n'en laissent passer que six, mais page.php répond AUSSI
// en direct (/page.php?type=…), et un type inconnu ferait chercher une
// clé absente de PAGE_SEGMENTS. On retombe alors sur l'atlas, qui est
// la page que le 404 propose de toute façon.
$connu  = isset(PAGE_INDEX[$type]) || isset(PAGE_SEGMENTS[$type]);
$urlIci = $connu ? page_url($type, $slug, $lang) : page_url('atlas', '', $lang);
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
<?php if (defined('VERIF_GOOGLE') && VERIF_GOOGLE !== ''): ?>
<meta name="google-site-verification" content="<?= e(VERIF_GOOGLE) ?>">
<?php endif; if (defined('VERIF_BING') && VERIF_BING !== ''): ?>
<meta name="msvalidate.01" content="<?= e(VERIF_BING) ?>">
<?php endif; ?>
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
<?php
// ── LA VIGNETTE, ET SEULEMENT SI ELLE EXISTE ────────────
// Cette balise pointait vers `/og-image.jpg` sur les 738 pages du site.
// CE FICHIER N'EXISTE PAS — il rend 404 en production. Chaque lien
// partagé sur WhatsApp, LinkedIn ou X affichait donc une carte sans
// image, depuis toujours, sans que rien ne puisse le signaler : une
// balise qui pointe dans le vide est une balise valide.
//
// On sert maintenant la carte de la fiche, et on ne déclare RIEN quand
// il n'y a pas de fichier — `uploads/` n'étant pas déployé, une carte
// engendrée ici peut parfaitement manquer là-bas.
$vignette = page_vignette(array_filter([
    $type === 'marque' && $h1 !== '' ? page_vignette_nom('marque', $h1) : null,
    $type === 'pays'   && $id !== '' ? page_vignette_nom('pays', $id)   : null,
    $type === 'cave'   && !empty($c['photo']) ? 'uploads/lounges/' . (int)($c['id'] ?? 0) . '/' . $c['photo'] : null,
    'uploads/og/defaut.jpg',
]));
if ($vignette !== null): ?>
<meta property="og:image" content="<?= e($racine . $vignette) ?>">
<meta name="twitter:image" content="<?= e($racine . $vignette) ?>">
<meta name="twitter:card" content="summary_large_image">
<?php else: ?>
<meta name="twitter:card" content="summary">
<?php endif; ?>
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
