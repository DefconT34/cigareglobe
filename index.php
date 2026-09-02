<?php
// ════════════════════════════════════════════════════════
// index.php — Point d'entrée multilingue
// ────────────────────────────────────────────────────────
// Sert index.html en adaptant tout ce qu'un moteur de recherche lit
// AVANT d'exécuter le JavaScript : l'attribut lang, le sens de lecture,
// le titre, la description, l'URL canonique et les liens hreflang.
//
// Sans cela, les six langues n'existent pas pour l'indexation : le
// marquage est identique pour tout le monde et la langue ne vit que
// dans le navigateur.
//
//   /            → français   (racine, langue par défaut)
//   /en/  /es/…  → réécrit ici par .htaccess vers ?lang=xx
//
// index.html reste la source unique du balisage : ce fichier n'y
// substitue que l'en-tête. Aucune duplication à maintenir.
// ════════════════════════════════════════════════════════

require_once __DIR__ . '/backend/config.php';
require_once __DIR__ . '/backend/langues.php';

define('I18N_CHECK_INCLUDE', true);
require_once __DIR__ . '/tools/i18n_check.php';   // i18n_parse()

// Les langues SERVIES, cochées depuis l'administration (migration 019).
// RTL et LOCALES restent sur les langues connues : ce sont des
// propriétés de la langue, pas du réglage.
$LANGUES = langues_actives();
const RTL     = ['ar'];
const LOCALES = ['fr' => 'fr_FR', 'en' => 'en_US', 'es' => 'es_ES',
                 'de' => 'de_DE', 'zh' => 'zh_CN', 'ar' => 'ar_SA'];

// Une langue désactivée retombe sur le français, exactement comme une
// langue inconnue : /de/ continue de répondre, en français, plutôt que
// de renvoyer une 404 sur une URL qu'un moteur a pu indexer.
$lang = strtolower(trim((string)($_GET['lang'] ?? 'fr')));
if (!in_array($lang, $LANGUES, true)) $lang = 'fr';
$dir = in_array($lang, RTL, true) ? 'rtl' : 'ltr';

// La reecriture d'URL fonctionne-t-elle ? .htaccess pose PRETTY=1 sur
// ses regles ; sans mod_rewrite (php -S en developpement) le temoin est
// absent. Le front s'en sert pour choisir entre « /en/ » et
// « ?lang=en » : construire des liens /en/ sur un serveur qui ne les
// reecrit pas menerait le visiteur nulle part.
$pretty = !empty($_SERVER['PRETTY']) || !empty($_SERVER['REDIRECT_PRETTY']);

/** Racine publique, sans barre finale. */
function racine(): string {
    if (defined('SITE_URL') && SITE_URL) return rtrim(SITE_URL, '/');
    $s = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') ? 'https' : 'http';
    return $s . '://' . ($_SERVER['HTTP_HOST'] ?? 'thecigarodyssey.com');
}

/**
 * Résumé d'un texte, coupé sur une fin de phrase quand il y en a une.
 *
 * Le Markdown restreint des messages est retiré : « **65 %** » dans une
 * carte d'aperçu se lit comme une coquille. Le rendu HTML n'est pas
 * réutilisé ici — une description est du texte nu.
 */
function extrait_texte(string $brut, int $max = 300): string {
    $t = preg_replace('/[`*>\[\]()#]/u', ' ', $brut);
    $t = trim(preg_replace('/\s+/u', ' ', $t));
    if (mb_strlen($t) <= $max) return $t;
    $court = mb_substr($t, 0, $max);
    $coupe = mb_strrpos($court, '. ');
    return ($coupe !== false && $coupe > $max / 2.5)
        ? mb_substr($court, 0, $coupe + 1)
        : rtrim($court, " \t\n\r\0\x0B,;:—-") . '…';
}

/** URL publique d'une langue : la racine pour le français, /xx/ sinon. */
function url_langue(string $l): string {
    return racine() . ($l === 'fr' ? '/' : '/' . $l . '/');
}

/**
 * Chaînes de référencement, par langue.
 *
 * i18n.js pèse plus de 200 Ko : l'analyser à chaque requête coûtait
 * l'essentiel du temps de réponse de cette page. Seules trois clés sont
 * utilisées ici — on les met en cache, régénérées dès que i18n.js
 * change (comparaison de la date de modification).
 */
function seo_strings(string $source): array {
    $cache = __DIR__ . '/backend/cache/seo_i18n.json';
    if (is_file($cache) && filemtime($cache) >= filemtime($source)) {
        $d = json_decode((string)file_get_contents($cache), true);
        if (is_array($d) && isset($d['fr'])) return $d;
    }
    $tout = i18n_parse($source);
    $garde = ['seo_title', 'seo_description', 'seo_image_alt'];
    $out = [];
    foreach ($tout as $l => $paires) {
        foreach ($garde as $k) if (isset($paires[$k])) $out[$l][$k] = $paires[$k];
    }
    if (!is_dir(dirname($cache))) @mkdir(dirname($cache), 0755, true);
    @file_put_contents($cache, json_encode($out, JSON_UNESCAPED_UNICODE));
    return $out;
}

$trad = seo_strings(__DIR__ . '/assets/js/i18n.js');
/** Traduction d'une clé, avec repli sur le français. */
function tr(string $cle): string {
    global $trad, $lang;
    return $trad[$lang][$cle] ?? $trad['fr'][$cle] ?? '';
}

$titre  = tr('seo_title');
$desc   = tr('seo_description');
$altImg = tr('seo_image_alt');
$urlIci = url_langue($lang);
$image  = racine() . '/og-image.jpg';

// ── Aperçu propre à une marque (?brand=Cohiba) ────────────
// Partager l'histoire d'une maison doit ressembler à partager un
// ARTICLE, pas un lien vers un site. Or la carte d'aperçu est la
// première impression : elle arrive avant le clic, et jusqu'ici tous
// les liens partagés se ressemblaient — même titre, même résumé.
//
// Les balises ne peuvent pas être posées par le JavaScript : les robots
// de WhatsApp, LinkedIn ou Slack lisent le HTML brut, sans l'exécuter.
// C'est donc au serveur de les écrire, ici, avant l'envoi.
//
// La description suit la langue demandée (colonnes history_xx de la
// migration 007), avec repli sur le français comme partout ailleurs.
$marque = trim((string)($_GET['brand'] ?? ''));
$marqueOk = null;
if ($marque !== '' && mb_strlen($marque) <= 100) {
    try {
        require_once __DIR__ . '/backend/config.php';
        $db  = getDB();
        $col = $lang === 'fr' ? 'history' : 'history_' . $lang;
        // Nom de colonne construit depuis une liste fermée (langues_connues()),
        // jamais depuis l'entrée : aucune injection possible.
        $q = $db->prepare("SELECT name, founded, COALESCE(NULLIF(`$col`, ''), history) AS histoire
                           FROM brands WHERE name = ? LIMIT 1");
        $q->execute([$marque]);
        $marqueOk = $q->fetch(PDO::FETCH_ASSOC) ?: null;
    } catch (Throwable $e) {
        // Base injoignable : on sert l'aperçu générique plutôt que rien.
        $marqueOk = null;
    }
}
if ($marqueOk) {
    $titre  = $marqueOk['name'] . ' — ' . tr('seo_title');
    // Un résumé, pas un début de phrase coupé net : on s'arrête à la fin
    // d'une phrase quand il y en a une dans les 300 premiers caractères.
    $h = trim(preg_replace('/\s+/u', ' ', (string)$marqueOk['histoire']));
    $extrait = mb_substr($h, 0, 300);
    if (mb_strlen($h) > 300) {
        // On ne coupe QUE sur une vraie fin de phrase. Le tiret cadratin
        // avait été admis au départ : il abrégeait au milieu d'une
        // incise, et « +1 » ne gardait alors que l'espace qui le
        // précède — le résumé finissait sans ponctuation du tout.
        $coupe = mb_strrpos($extrait, '. ');
        $extrait = ($coupe !== false && $coupe > 120)
            ? mb_substr($extrait, 0, $coupe + 1)      // le point est conservé
            : rtrim($extrait, " \t\n\r\0\x0B,;:—-") . '…';
    }
    $desc   = $extrait;
    $altImg = $marqueOk['name'];
    $urlIci = url_langue($lang) . '?brand=' . rawurlencode($marqueOk['name']);
}

// ── Aperçu d'une discussion (?sujet=42) ───────────────────
// L'espace communautaire vit dans un calque JavaScript : les moteurs
// n'en voyaient RIEN, et le plan de site n'annonçait que six pages
// d'accueil. Or les discussions sont le seul contenu qui grandit sans
// qu'on l'écrive — les laisser invisibles, c'est écrire dans le vide.
//
// Même mécanique que pour une marque, et pour la même raison : les
// robots de WhatsApp, LinkedIn ou Google lisent le HTML brut sans
// l'exécuter. Le front, lui, ouvre déjà le fil sur « ?sujet= ».
//
// Un sujet n'existe QUE dans sa langue : on sert donc la page dans
// cette langue, quelle que soit celle demandée. Servir un fil espagnol
// dans une coquille allemande n'aurait trompé que le robot.
$sujetId = (int)($_GET['sujet'] ?? 0);
$sujetOk = null;
if ($sujetId > 0) {
    try {
        $db = $db ?? getDB();
        $q = $db->prepare(
            "SELECT t.id, t.title, t.lang, t.created_at,
                    (SELECT p.body FROM forum_posts p
                      WHERE p.topic_id = t.id AND p.status = 'published'
                      ORDER BY p.id ASC LIMIT 1) AS premier
             FROM forum_topics t
             WHERE t.id = ? AND t.status <> 'removed' LIMIT 1"
        );
        $q->execute([$sujetId]);
        $sujetOk = $q->fetch(PDO::FETCH_ASSOC) ?: null;
    } catch (Throwable $e) {
        $sujetOk = null;      // base injoignable : aperçu générique
    }
}
if ($sujetOk) {
    if (in_array($sujetOk['lang'], $LANGUES, true)) {
        $lang = $sujetOk['lang'];
        $dir  = in_array($lang, RTL, true) ? 'rtl' : 'ltr';
    }
    $titre  = $sujetOk['title'] . ' — ' . tr('seo_title');
    $desc   = extrait_texte((string)$sujetOk['premier'], 300);
    $altImg = $sujetOk['title'];
    $urlIci = url_langue($lang) . '?sujet=' . $sujetOk['id'];
}

// ── Une adresse de contenu a UNE page canonique ───────────
// L'application écrit « ?country=cuba » dans la barre d'adresse dès
// qu'un panneau s'ouvre (voir majUrl dans deeplinks.js), et ces adresses
// se partagent. Elles montrent le même contenu que /pays/cuba, qui est
// la page servie par le serveur : sans canonique, un moteur voit deux
// adresses pour un seul pays et partage le crédit entre les deux.
//
// La canonique désigne la PAGE, jamais l'application : c'est elle qui
// porte le texte, les liens et les six traductions.
//
// Et alors PAS d'alternates ici : la page canonique déclare les siens.
// En déclarer d'autres depuis une adresse qui ne se revendique pas
// canonique reviendrait à annoncer six traductions de la coquille.
require_once __DIR__ . '/backend/pages_lib.php';
$canonEntite = null;
if (($v = trim((string)($_GET['country'] ?? ''))) !== '' && preg_match('/^[a-z0-9-]{1,60}$/', $v)) {
    // VÉRIFIÉ EN BASE, et pas seulement par une expression régulière :
    // la valeur entre dans la clé du cache plus bas, et un identifiant
    // simplement « bien formé » aurait permis de faire écrire autant de
    // fichiers qu'on veut avec ?country=aaaa, aaab, aaac…
    try {
        $q = ($db ?? $db = getDB())->prepare(
            "SELECT 1 FROM producer_countries WHERE id = ?
             UNION SELECT 1 FROM lounge_countries WHERE id = ? LIMIT 1");
        $q->execute([$v, $v]);
        if ($q->fetchColumn()) $canonEntite = page_url('pays', $v, $lang);
    } catch (Throwable $e) { /* base injoignable : canonique générique */ }
} elseif ($marqueOk) {
    $canonEntite = page_url('marque', page_slug($marqueOk['name']), $lang);
} elseif (($v = (int)($_GET['lounge'] ?? 0)) > 0) {
    try {
        $q = ($db ?? getDB())->prepare("SELECT name FROM lounges WHERE id = ? LIMIT 1");
        $q->execute([$v]);
        if ($n = $q->fetchColumn()) $canonEntite = page_url('cave', $v . '-' . page_slug((string)$n), $lang);
    } catch (Throwable $e) { /* base injoignable : canonique générique */ }
}
if ($canonEntite) $urlIci = $canonEntite;

// ── Liens alternatifs ─────────────────────────────────────
// x-default désigne la version servie à un visiteur dont la langue
// n'est couverte par aucune des six : ici la racine française.
//
// UN SUJET N'A PAS D'ALTERNATIVES : il est écrit dans une langue, par
// une personne, et le serveur ne traduit pas. Lui déclarer six hreflang
// reviendrait à annoncer six traductions dont cinq n'existent pas —
// exactement le contenu dupliqué que hreflang sert à éviter.
$alternates = '';
if (!$sujetOk && !$canonEntite) {
    foreach ($LANGUES as $l) {
        $alternates .= '  <link rel="alternate" hreflang="' . $l . '" href="' . url_langue($l) . "\">\n";
    }
    $alternates .= '  <link rel="alternate" hreflang="x-default" href="' . url_langue('fr') . "\">\n";
    foreach ($LANGUES as $l) {
        if ($l === $lang) continue;
        $alternates .= '  <meta property="og:locale:alternate" content="' . LOCALES[$l] . "\">\n";
    }
}

// ── Assemblage ────────────────────────────────────────────
// La page rendue ne depend que de la langue et des deux fichiers
// sources. On la met en cache : sans cela, chaque visite refaisait la
// dizaine de substitutions et la relecture d'index.html, pour un
// resultat strictement identique.
$gabarit = __DIR__ . '/index.html';
$i18njs  = __DIR__ . '/assets/js/i18n.js';
// L'empreinte couvre TOUS les fichiers statiques, pas seulement le
// gabarit : les URL servies portent désormais leur date de modification
// (voir plus bas). Sans cela, modifier globe.js ne changerait pas la
// page mise en cache, donc pas le « ?v= », et le cache-busting ne
// busterait rien. Deux globs et quelques stat() par requête — négligeable
// devant la lecture d'index.html qu'ils évitent.
$empreinte = max(filemtime($gabarit), filemtime($i18njs));
foreach (array_merge(glob(__DIR__ . '/assets/js/*.js') ?: [],
                     glob(__DIR__ . '/assets/css/*.css') ?: []) as $f) {
    $empreinte = max($empreinte, filemtime($f));
}
// Le réglage des langues entre dans l'empreinte par la date du fichier
// qui le porte : cocher une langue dans l'administration périme les
// pages en cache au même titre qu'une feuille de style modifiée. Sans
// cela, le réglage n'aurait d'effet qu'au bout de la durée du cache.
if (is_file(langues_fichier())) $empreinte = max($empreinte, filemtime(langues_fichier()));
// L'hote entre dans la cle : les URL canoniques et hreflang en
// dependent, un site joignable par plusieurs noms servirait sinon
// des canoniques errones depuis le cache.
// La MARQUE entre dans la clé : sans elle, la première page servie avec
// un aperçu de marque serait rendue à tous les visiteurs suivants, quel
// que soit leur lien. Le nom retenu vient de la BASE, jamais de l'URL —
// une marque inconnue retombe sur la page générique et sa clé, ce qui
// interdit à un tiers de créer des fichiers de cache à volonté.
// La canonique d'entité entre AUSSI dans la clé : sans elle, la
// première page servie sur ?country=cuba serait rendue à tous les
// visiteurs suivants, avec la canonique de Cuba — soit exactement le
// contraire de ce que la canonique doit faire. Elle est construite
// depuis la BASE, jamais depuis l'URL : une entité inconnue retombe sur
// la page générique et sa clé, ce qui interdit à un tiers de créer des
// fichiers de cache à volonté.
$pageCache = __DIR__ . '/backend/cache/page_' . $lang . '_'
           . substr(sha1(racine() . '|' . (int)$pretty
                    . '|' . ($marqueOk['name'] ?? '')
                    . '|' . (int)($sujetOk['id'] ?? 0)
                    . '|' . (string)$canonEntite), 0, 12) . '.html';

if (is_file($pageCache) && filemtime($pageCache) >= $empreinte) {
    header('Content-Type: text/html; charset=utf-8');
    cache_public(300);
    readfile($pageCache);
    exit;
}

$html = file_get_contents($gabarit);

// Les chemins relatifs se résoudraient sous /en/ : on les ancre à la racine.
//
// Et on y accroche la DATE DE MODIFICATION du fichier. Le `.htaccess`
// demande aux navigateurs de garder les JS et CSS **une semaine** ; sans
// cela, un visiteur déjà venu conserve l'ancien script pendant sept
// jours après une mise en ligne. Un correctif urgent ne l'atteindrait
// pas. Avec « ?v=… », l'URL change quand le fichier change : le cache
// est contourné le jour même, et reste long le reste du temps — ce qui
// est exactement ce qu'on veut d'un cache.
//
// Par fichier, et non un numéro de version global : modifier une seule
// feuille de style ne doit pas faire retélécharger les 520 Ko.
//
// C'est le seul bénéfice concret qu'apporterait une migration Vite/ESM,
// obtenu ici en quelques lignes et sans étape de build — le déploiement
// reste une copie de fichiers (voir C1b dans docs/roadmap.md).
$html = preg_replace_callback(
    '#\b(href|src)="assets/([^"?]+)"#',
    function (array $m): string {
        $chemin = __DIR__ . '/assets/' . $m[2];
        // Fichier absent : on ancre quand même, mais sans version — une
        // empreinte inventée ne désignerait rien.
        $v = is_file($chemin) ? '?v=' . dechex(filemtime($chemin)) : '';
        return $m[1] . '="/assets/' . $m[2] . $v . '"';
    },
    $html
);
// Le manifeste garde son URL nue : certains outils PWA n'acceptent pas
// de chaîne de requête, et il ne change presque jamais.
$html = str_replace('href="manifest.json"', 'href="/manifest.json"', $html);

// ── Sélecteur de langue : ne montrer que ce qui est servi ─
// Les six drapeaux sont écrits dans index.html, qui reste la source
// unique du balisage. Plutôt que d'y ajouter une boucle PHP — et donc
// une seconde version du gabarit à maintenir —, on retire ici les
// boutons des langues décochées, en-tête et menu mobile compris.
//
// Le retrait est indispensable, pas cosmétique : un bouton laissé
// visible mènerait à /de/, que le serveur rendrait en français.
$inactives = array_diff(langues_connues(), $LANGUES);
if ($inactives) {
    $html = preg_replace(
        '#<button class="m?lang-btn[^"]*"\s+data-lang="(?:' . implode('|', $inactives) . ')"[^>]*>.*?</button>\s*#u',
        '',
        $html
    );
}
$e = fn(string $s): string => htmlspecialchars($s, ENT_QUOTES, 'UTF-8');

$remplacements = [
    // data-langs : la liste servie, pour le front. forum.js propose une
    // langue à chaque message écrit et n'a aucun autre moyen de savoir
    // laquelle est fermée — un attribut lu au démarrage, pas une requête
    // de plus au chargement.
    '<html lang="fr" data-theme="light" dir="ltr">'
        => '<html lang="' . $lang . '" data-theme="light" dir="' . $dir . '"'
         . ' data-langs="' . $e(implode(',', $LANGUES)) . '"'
         . ($pretty ? ' data-pretty-urls="1"' : '') . '>',
    '<title>CigarOdyssey — The World\'s Premium Cigar Atlas</title>'
        => '<title>' . $e($titre) . '</title>',
    '<meta name="description" content="CigarOdyssey — The World\'s Premium Cigar Atlas">'
        => '<meta name="description" content="' . $e($desc) . '">',
    '<link rel="canonical" href="https://thecigarodyssey.com/">'
        => '<link rel="canonical" href="' . $e($urlIci) . "\">\n" . $alternates,
    '<meta property="og:locale" content="fr_FR">'
        => '<meta property="og:locale" content="' . LOCALES[$lang] . '">',
    '<meta property="og:url" content="https://thecigarodyssey.com/">'
        => '<meta property="og:url" content="' . $e($urlIci) . '">',
    // Une discussion est un ÉCRIT daté, signé, qui ne change plus :
    // « article » le dit, « website » désigne le site entier. Les
    // agrégateurs et les cartes d'aperçu s'en servent pour choisir leur
    // mise en page.
    '<meta property="og:type" content="website">'
        => '<meta property="og:type" content="' . ($sujetOk ? 'article' : 'website') . '">',
];
foreach ([['og:title', $titre], ['twitter:title', $titre],
          ['og:description', $desc], ['twitter:description', $desc],
          ['og:image:alt', $altImg]] as [$prop, $val]) {
    $attr = str_starts_with($prop, 'og:') ? 'property' : 'name';
    $remplacements['<meta ' . $attr . '="' . $prop . '" content="'] = null;   // marqueur
    $html = preg_replace(
        '/<meta ' . $attr . '="' . preg_quote($prop, '/') . '" content="[^"]*">/',
        '<meta ' . $attr . '="' . $prop . '" content="' . $e($val) . '">',
        $html, 1
    );
}
foreach ($remplacements as $de => $vers) {
    if ($vers !== null) $html = str_replace($de, $vers, $html);
}

// Données structurées : URL et description de la langue servie.
$html = preg_replace_callback(
    '/<script type="application\/ld\+json">(.*?)<\/script>/s',
    function ($m) use ($urlIci, $desc, $lang) {
        $d = json_decode($m[1], true);
        if (!is_array($d)) return $m[0];
        $d['url']         = $urlIci;
        $d['description'] = $desc;
        $d['inLanguage']  = $lang;
        return '<script type="application/ld+json">'
             . json_encode($d, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES)
             . '</script>';
    },
    $html, 1
);

if (!is_dir(dirname($pageCache))) @mkdir(dirname($pageCache), 0755, true);
@file_put_contents($pageCache, $html);

header('Content-Type: text/html; charset=utf-8');
// La langue dépend de l'URL, pas d'un cookie : les caches peuvent servir
// la même réponse à tout le monde pour une URL donnée.
cache_public(300);
echo $html;
