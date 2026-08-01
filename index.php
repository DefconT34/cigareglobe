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

define('I18N_CHECK_INCLUDE', true);
require_once __DIR__ . '/tools/i18n_check.php';   // i18n_parse()

const LANGUES = ['fr', 'en', 'es', 'de', 'zh', 'ar'];
const RTL     = ['ar'];
const LOCALES = ['fr' => 'fr_FR', 'en' => 'en_US', 'es' => 'es_ES',
                 'de' => 'de_DE', 'zh' => 'zh_CN', 'ar' => 'ar_SA'];

$lang = strtolower(trim((string)($_GET['lang'] ?? 'fr')));
if (!in_array($lang, LANGUES, true)) $lang = 'fr';
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
    return $s . '://' . ($_SERVER['HTTP_HOST'] ?? 'cigarodyssey.com');
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

// ── Liens alternatifs ─────────────────────────────────────
// x-default désigne la version servie à un visiteur dont la langue
// n'est couverte par aucune des six : ici la racine française.
$alternates = '';
foreach (LANGUES as $l) {
    $alternates .= '  <link rel="alternate" hreflang="' . $l . '" href="' . url_langue($l) . "\">\n";
}
$alternates .= '  <link rel="alternate" hreflang="x-default" href="' . url_langue('fr') . "\">\n";
foreach (LANGUES as $l) {
    if ($l === $lang) continue;
    $alternates .= '  <meta property="og:locale:alternate" content="' . LOCALES[$l] . "\">\n";
}

// ── Assemblage ────────────────────────────────────────────
// La page rendue ne depend que de la langue et des deux fichiers
// sources. On la met en cache : sans cela, chaque visite refaisait la
// dizaine de substitutions et la relecture d'index.html, pour un
// resultat strictement identique.
$gabarit = __DIR__ . '/index.html';
$i18njs  = __DIR__ . '/assets/js/i18n.js';
$empreinte = max(filemtime($gabarit), filemtime($i18njs));
// L'hote entre dans la cle : les URL canoniques et hreflang en
// dependent, un site joignable par plusieurs noms servirait sinon
// des canoniques errones depuis le cache.
$pageCache = __DIR__ . '/backend/cache/page_' . $lang . '_'
           . substr(sha1(racine() . '|' . (int)$pretty), 0, 12) . '.html';

if (is_file($pageCache) && filemtime($pageCache) >= $empreinte) {
    header('Content-Type: text/html; charset=utf-8');
    header('Cache-Control: public, max-age=300');
    readfile($pageCache);
    exit;
}

$html = file_get_contents($gabarit);

// Les chemins relatifs se résoudraient sous /en/ : on les ancre à la racine.
$html = str_replace(
    ['href="assets/', 'src="assets/', 'href="manifest.json"'],
    ['href="/assets/', 'src="/assets/', 'href="/manifest.json"'],
    $html
);

$e = fn(string $s): string => htmlspecialchars($s, ENT_QUOTES, 'UTF-8');

$remplacements = [
    '<html lang="fr" data-theme="light" dir="ltr">'
        => '<html lang="' . $lang . '" data-theme="light" dir="' . $dir . '"'
         . ($pretty ? ' data-pretty-urls="1"' : '') . '>',
    '<title>CigarOdyssey — The World\'s Premium Cigar Atlas</title>'
        => '<title>' . $e($titre) . '</title>',
    '<meta name="description" content="CigarOdyssey — The World\'s Premium Cigar Atlas">'
        => '<meta name="description" content="' . $e($desc) . '">',
    '<link rel="canonical" href="https://cigarodyssey.com/">'
        => '<link rel="canonical" href="' . $e($urlIci) . "\">\n" . $alternates,
    '<meta property="og:locale" content="fr_FR">'
        => '<meta property="og:locale" content="' . LOCALES[$lang] . '">',
    '<meta property="og:url" content="https://cigarodyssey.com/">'
        => '<meta property="og:url" content="' . $e($urlIci) . '">',
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
header('Cache-Control: public, max-age=300');
echo $html;
