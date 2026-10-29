<?php
// ═════════════════════════════════════════════════
// backend/bundle.php — les modules JS de l'accueil en UNE requête
// ─────────────────────────────────────────────────
// L'accueil demandait ~32 fichiers JS d'un coup ; chez o2switch une rafale
// peut revenir en 429 (page sans style, bloquée sur « Connexion… », audit du
// 9 octobre 2026). index.php remplace donc les balises <script src="assets/js/…">
// par une seule, qui pointe ici. Les fichiers restent sources de vérité (pas
// de build, les outils qui lisent i18n.js comme texte n'y voient rien) : ce
// point d'entrée les concatène, dans l'ordre d'index.html, et se laisse
// cacher un an (l'URL porte l'empreinte des fichiers).
//
// Différence assumée avec des scripts séparés : une exception levée au
// niveau supérieur d'un module arrête aussi les modules suivants.
// ═════════════════════════════════════════════════

/** Noms des modules chargés par un gabarit, dans l'ordre du document. */
function bundle_liste(string $html): array {
    preg_match_all('#<script src="/?assets/js/([A-Za-z0-9._-]+\.js)(?:\?v=[0-9a-f]+)?"></script>#', $html, $m);
    return $m[1];
}

/** Empreinte du paquet : change dès qu'un module change, est ajouté ou déplacé. */
function bundle_empreinte(array $noms): string {
    $s = '';
    foreach ($noms as $n) $s .= $n . ':' . (int)@filemtime(dirname(__DIR__) . '/assets/js/' . $n) . ';';
    return substr(md5($s), 0, 10);
}

if (realpath($_SERVER['SCRIPT_FILENAME'] ?? '') === __FILE__) {
    $noms = bundle_liste((string)file_get_contents(dirname(__DIR__) . '/index.html'));
    $etag = '"' . bundle_empreinte($noms) . '"';
    require_once __DIR__ . '/config.php';
    header('Content-Type: application/javascript; charset=utf-8');
    cache_public(31536000);   // l'URL porte l'empreinte : un an
    header('ETag: ' . $etag);
    if (($_SERVER['HTTP_IF_NONE_MATCH'] ?? '') === $etag) { http_response_code(304); exit; }
    foreach ($noms as $n) {
        echo "\n/* $n */\n", file_get_contents(dirname(__DIR__) . '/assets/js/' . $n), "\n;\n";
    }
}
