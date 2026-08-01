<?php
// ════════════════════════════════════════════════════════
// sitemap.php — Plan de site multilingue
// ────────────────────────────────────────────────────────
// Sert /sitemap.xml (voir .htaccess). Genere plutot qu'ecrit a la main :
// le domaine vient de SITE_URL, et les six versions d'une meme page se
// declarent mutuellement par xhtml:link — c'est ce qui indique aux
// moteurs qu'il s'agit de traductions et non de contenus distincts.
// ════════════════════════════════════════════════════════

require_once __DIR__ . '/backend/config.php';

const LANGUES_PLAN = ['fr', 'en', 'es', 'de', 'zh', 'ar'];

$base = defined('SITE_URL') && SITE_URL
      ? rtrim(SITE_URL, '/')
      : ((!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') ? 'https' : 'http')
        . '://' . ($_SERVER['HTTP_HOST'] ?? 'cigarodyssey.com');

$url = fn(string $l): string => $base . ($l === 'fr' ? '/' : '/' . $l . '/');

header('Content-Type: application/xml; charset=utf-8');
echo '<?xml version="1.0" encoding="UTF-8"?>' . "\n";
echo '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"' . "\n";
echo '        xmlns:xhtml="http://www.w3.org/1999/xhtml">' . "\n";

foreach (LANGUES_PLAN as $l) {
    echo "  <url>\n";
    echo '    <loc>' . htmlspecialchars($url($l), ENT_XML1) . "</loc>\n";
    foreach (LANGUES_PLAN as $alt) {
        printf("    <xhtml:link rel=\"alternate\" hreflang=\"%s\" href=\"%s\"/>\n",
               $alt, htmlspecialchars($url($alt), ENT_XML1));
    }
    printf("    <xhtml:link rel=\"alternate\" hreflang=\"x-default\" href=\"%s\"/>\n",
           htmlspecialchars($url('fr'), ENT_XML1));
    echo "    <changefreq>weekly</changefreq>\n";
    echo '    <priority>' . ($l === 'fr' ? '1.0' : '0.9') . "</priority>\n";
    echo "  </url>\n";
}
echo "</urlset>\n";
