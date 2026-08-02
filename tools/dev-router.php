<?php
// ════════════════════════════════════════════════════════
// tools/dev-router.php — Routeur du serveur de développement
// ────────────────────────────────────────────────────────
// « php -S » IGNORE le .htaccess. Sans routeur, il sert donc en clair
// tout ce qu'Apache refuse — a commencer par .env, qui porte les acces
// MySQL, les cles d'API et la cle d'administration. Tant que le serveur
// n'ecoute que sur 127.0.0.1 la faille reste theorique ; des qu'on
// l'ouvre au reseau local pour tester sur mobile, elle ne l'est plus.
//
//   php -S 0.0.0.0:8099 -t . tools/dev-router.php
//
// Ce routeur rejoue les deux comportements d'Apache dont depend le site :
// les interdictions, et les URL par langue. Le reste est laisse au
// serveur integre (return false), qui sert les fichiers tel quel.
//
// Il n'a rien a faire en production : la, c'est Apache et le .htaccess.
// ════════════════════════════════════════════════════════

$chemin = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH) ?? '/';
$chemin = rawurldecode($chemin);

// ── Interdictions (miroir du .htaccess) ───────────────────
// Un segment commencant par un point : .env, .git, .htaccess…
// Les extensions de sauvegarde et les journaux, qui trainent parfois a
// cote des fichiers servis.
$segments = explode('/', trim($chemin, '/'));
$interdit = false;
foreach ($segments as $s) {
    if ($s !== '' && $s[0] === '.') { $interdit = true; break; }
}
if (!$interdit && preg_match('/\.(bak|log|sql|ini|sh)$/i', $chemin)) $interdit = true;
// tests/ et tools/ se defendent deja seuls (garde PHP_SAPI), mais leurs
// fichiers non-PHP, eux, seraient servis.
if (!$interdit && preg_match('#^/(tests|tools|node_modules)/#i', $chemin)) $interdit = true;

if ($interdit) {
    http_response_code(403);
    header('Content-Type: text/plain; charset=utf-8');
    echo "403 — interdit par tools/dev-router.php (miroir du .htaccess)\n";
    return true;
}

// ── URL par langue ────────────────────────────────────────
// /en/ → index.php?lang=en, comme la regle mod_rewrite. Sans cela le
// selecteur de langue retombe sur ?lang=xx, et on ne teste jamais les
// vraies URL sur mobile.
if (preg_match('#^/(en|es|de|zh|ar)/?$#', $chemin, $m)) {
    $_GET['lang'] = $m[1];
    $_SERVER['REDIRECT_PRETTY'] = '1';   // lu par index.php
    require __DIR__ . '/../index.php';
    return true;
}
if ($chemin === '/sitemap.xml') {
    require __DIR__ . '/../sitemap.php';
    return true;
}
if ($chemin === '/' || $chemin === '') {
    $_GET['lang'] = $_GET['lang'] ?? 'fr';
    $_SERVER['REDIRECT_PRETTY'] = '1';
    require __DIR__ . '/../index.php';
    return true;
}

// Tout le reste : au serveur integre.
return false;
