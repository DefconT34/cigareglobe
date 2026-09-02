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
require_once __DIR__ . '/backend/langues.php';
require_once __DIR__ . '/backend/pages_lib.php';

// Seules les langues SERVIES entrent au plan. Déclarer une version
// qu'index.php rend en français ferait annoncer six traductions dont
// certaines sont le même texte : c'est du contenu dupliqué, et le
// hreflang qui l'accompagne ment.
$LANGUES_PLAN = langues_actives();

$base = defined('SITE_URL') && SITE_URL
      ? rtrim(SITE_URL, '/')
      : ((!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') ? 'https' : 'http')
        . '://' . ($_SERVER['HTTP_HOST'] ?? 'thecigarodyssey.com');

$url = fn(string $l): string => $base . ($l === 'fr' ? '/' : '/' . $l . '/');

header('Content-Type: application/xml; charset=utf-8');
echo '<?xml version="1.0" encoding="UTF-8"?>' . "\n";
echo '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"' . "\n";
echo '        xmlns:xhtml="http://www.w3.org/1999/xhtml">' . "\n";

foreach ($LANGUES_PLAN as $l) {
    echo "  <url>\n";
    echo '    <loc>' . htmlspecialchars($url($l), ENT_XML1) . "</loc>\n";
    foreach ($LANGUES_PLAN as $alt) {
        printf("    <xhtml:link rel=\"alternate\" hreflang=\"%s\" href=\"%s\"/>\n",
               $alt, htmlspecialchars($url($alt), ENT_XML1));
    }
    printf("    <xhtml:link rel=\"alternate\" hreflang=\"x-default\" href=\"%s\"/>\n",
           htmlspecialchars($url('fr'), ENT_XML1));
    echo "    <changefreq>weekly</changefreq>\n";
    echo '    <priority>' . ($l === 'fr' ? '1.0' : '0.9') . "</priority>\n";
    echo "  </url>\n";
}
// ── L'atlas et tout ce qu'il relie ───────────────────────
// LE CONSTAT QUI A OUVERT CE CHANTIER : ce plan annonçait SEIZE
// adresses. Cinq cents établissements, cent dix-huit maisons et cent
// huit pays n'y figuraient pas — ils n'existaient que dans le
// JavaScript, donc pour personne d'autre que ceux qui connaissaient
// déjà le site.
//
// Ici, CHAQUE entité est déclarée dans les six langues, et les six
// versions se désignent mutuellement par xhtml:link : c'est ce qui dit
// à un moteur qu'il s'agit d'une traduction et non d'un doublon. Le
// contenu l'est réellement — les colonnes `_en`, `_es`… existent pour
// les descriptions, les histoires et les fiches de pays.
//
// Contrairement aux discussions plus bas, qui n'ont qu'une langue.
try {
    $db  = $db ?? getDB();
    $inv = page_inventaire($db);

    // L'atlas d'abord : c'est le seul lien qui mène aux six cent
    // quarante autres. Un plan de site fait connaître des adresses ;
    // ce sont les LIENS qui leur donnent du poids.
    $entrees = [['atlas', '', null, '0.8']];
    foreach (['pays' => '0.7', 'marque' => '0.6', 'cave' => '0.5'] as $type => $prio) {
        foreach ($inv[$type] as $e) $entrees[] = [$type, $e['slug'], $e['maj'], $prio];
    }

    foreach ($entrees as [$type, $slug, $maj, $prio]) {
        echo "  <url>\n";
        echo '    <loc>' . htmlspecialchars(page_url($type, $slug, 'fr'), ENT_XML1) . "</loc>\n";
        foreach ($LANGUES_PLAN as $alt) {
            printf("    <xhtml:link rel=\"alternate\" hreflang=\"%s\" href=\"%s\"/>\n",
                   $alt, htmlspecialchars(page_url($type, $slug, $alt), ENT_XML1));
        }
        printf("    <xhtml:link rel=\"alternate\" hreflang=\"x-default\" href=\"%s\"/>\n",
               htmlspecialchars(page_url($type, $slug, 'fr'), ENT_XML1));
        if ($maj) {
            echo '    <lastmod>' . htmlspecialchars(date('Y-m-d', strtotime((string)$maj)), ENT_XML1) . "</lastmod>\n";
        }
        echo "    <changefreq>monthly</changefreq>\n";
        echo '    <priority>' . $prio . "</priority>\n";
        echo "  </url>\n";
    }
} catch (Throwable $e) {
    // Base injoignable : le plan garde ses pages d'accueil. Un plan
    // amputé vaut mieux qu'un XML tronqué au milieu d'une balise.
}

// ── Les discussions ──────────────────────────────────────
// Elles sont le seul contenu qui grandit sans qu'on l'écrive, et elles
// vivaient dans un calque JavaScript : le plan de site n'annonçait que
// six pages d'accueil pour un atlas et un espace communautaire entiers.
// index.php sert désormais leurs balises (?sujet=…) ; restait à dire
// aux moteurs qu'elles existent.
//
// AUCUN xhtml:link ici : un sujet est écrit dans une langue, par une
// personne, et le serveur ne traduit pas. Lui déclarer six alternatives
// annoncerait cinq traductions qui n'existent pas.
//
// `lastmod` vient de la dernière réponse : un fil qui vit se réindexe,
// un fil clos ne coûte rien.
try {
    $db = getDB();
    $q = $db->query(
        "SELECT t.id, t.lang, COALESCE(t.last_post_at, t.created_at) AS maj
         FROM forum_topics t
         WHERE t.status <> 'removed'
         ORDER BY maj DESC
         LIMIT 5000"
    );
    foreach ($q->fetchAll(PDO::FETCH_ASSOC) as $t) {
        // Un sujet écrit dans une langue fermée n'est plus servi dans
        // cette langue : il sort du plan plutôt que d'y figurer sous une
        // adresse qui répondrait en français.
        if (!in_array($t['lang'], $LANGUES_PLAN, true)) continue;
        $loc = $url($t['lang']) . '?sujet=' . (int)$t['id'];
        echo "  <url>\n";
        echo '    <loc>' . htmlspecialchars($loc, ENT_XML1) . "</loc>\n";
        if ($t['maj']) {
            echo '    <lastmod>' . htmlspecialchars(
                date('Y-m-d', strtotime((string)$t['maj'])), ENT_XML1) . "</lastmod>\n";
        }
        echo "    <changefreq>weekly</changefreq>\n";
        echo "    <priority>0.5</priority>\n";
        echo "  </url>\n";
    }
} catch (Throwable $e) {
    // Base injoignable : le plan garde ses pages d'accueil. Un plan
    // amputé vaut mieux qu'un XML tronqué au milieu d'une balise.
}

echo "</urlset>\n";
