<?php
// ═════════════════════════════════════════════════
// backend/boot.php — « Le site a démarré chez le visiteur »
// ─────────────────────────────────────────────────
// La mesure d'audience compte les pages PHP SERVIES. Or le document peut
// répondre 200 pendant que ses scripts reviennent en 429 : page sans style,
// bloquée sur « Connexion à la base de données… » (audit du 9 octobre 2026).
// Le serveur ne le voit pas, la mesure non plus.
//
// Le front appelle donc ce point UNE FOIS, quand le globe a ses données et que
// l'écran de chargement s'efface (animation.js, _initDOM). Rapporté aux vues de
// l'accueil, le nombre de `boot_ok` dit quelle part des visiteurs voit
// réellement le site : c'est le chiffre à surveiller avant toute annonce.
//
// Même règle que audience.php : jamais d'erreur, jamais de réponse utile.
// ═════════════════════════════════════════════════

require_once __DIR__ . '/audience.php';

cache_jamais();
try {
    $lang = (string)($_GET['lang'] ?? 'fr');
    audience_noter(getDB(), 'boot_ok', '/', preg_match('/^[a-z]{2}$/', $lang) ? $lang : 'fr');
} catch (Throwable $e) {
    // La mesure ne casse rien.
}
http_response_code(204);
