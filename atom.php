<?php
// ═════════════════════════════════════════════════
// atom.php — Les nouvelles fiches, en flux Atom
// ─────────────────────────────────────────────────
// Sert /atom.xml (voir .htaccess). Une raison de revenir qui ne demande
// ni compte, ni adresse électronique, ni tiers : un lecteur de flux
// suffit. C'est le seul moyen de dire « il y a du neuf » à qui ne
// repasse pas tout seul, sans lettre (qui demanderait une base de
// destinataires, donc le RGPD et un avis juridique d'abord).
//
// Les trente maisons les plus récemment ajoutées à l'atlas. Rien de
// commercial : un nom, un extrait de son histoire, le lien de la fiche.
// ═════════════════════════════════════════════════

require_once __DIR__ . '/backend/config.php';
require_once __DIR__ . '/backend/pages_lib.php';

$base = defined('SITE_URL') && SITE_URL
      ? rtrim(SITE_URL, '/')
      : ((!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') ? 'https' : 'http')
        . '://' . ($_SERVER['HTTP_HOST'] ?? 'thecigarodyssey.com');

$x = fn(string $s): string => htmlspecialchars($s, ENT_XML1 | ENT_QUOTES, 'UTF-8');

$lignes = [];
try {
    $lignes = getDB()->query(
        "SELECT name, history, created_at FROM brands
          WHERE history IS NOT NULL AND history <> ''
          ORDER BY created_at DESC, name LIMIT 30")->fetchAll();
} catch (Throwable $e) {
    // Une base injoignable donne un flux vide, pas une erreur : le lecteur réessaiera.
}

$maj = $lignes ? max(array_map(fn($r) => strtotime((string)$r['created_at']) ?: 0, $lignes)) : time();

header('Content-Type: application/atom+xml; charset=utf-8');
// Un lecteur de flux interroge souvent : une copie de cinq minutes suffit.
cache_public(300);
echo '<?xml version="1.0" encoding="UTF-8"?>' . "\n";
echo '<feed xmlns="http://www.w3.org/2005/Atom" xml:lang="fr">' . "\n";
echo '  <title>CigarOdyssey — nouvelles fiches</title>' . "\n";
echo '  <subtitle>Les maisons récemment ajoutées à l\'atlas mondial du cigare premium</subtitle>' . "\n";
echo '  <id>' . $x($base . '/atom.xml') . "</id>\n";
echo '  <link rel="self" type="application/atom+xml" href="' . $x($base . '/atom.xml') . "\"/>\n";
echo '  <link rel="alternate" type="text/html" href="' . $x($base . '/') . "\"/>\n";
echo '  <updated>' . date('c', $maj) . "</updated>\n";

foreach ($lignes as $r) {
    $url = page_url('marque', page_slug((string)$r['name']), 'fr');   // déjà absolue
    echo "  <entry>\n";
    echo '    <title>' . $x('Nouvelle fiche : ' . $r['name']) . "</title>\n";
    echo '    <id>' . $x($url) . "</id>\n";
    echo '    <link rel="alternate" type="text/html" href="' . $x($url) . "\"/>\n";
    echo '    <updated>' . date('c', strtotime((string)$r['created_at']) ?: $maj) . "</updated>\n";
    echo '    <summary>' . $x(page_extrait((string)$r['history'], 280)) . "</summary>\n";
    echo "  </entry>\n";
}
echo "</feed>\n";
