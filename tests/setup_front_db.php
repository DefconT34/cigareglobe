<?php
// ════════════════════════════════════════════════════════
// tests/setup_front_db.php — Prepare la base des tests de bout en bout
// ────────────────────────────────────────────────────────
// Reconstruit la base de test a partir de sql/schema.sql (comme la suite
// PHP), puis y charge tests/fixtures/atlas.sql : sans pays ni marches,
// data.php renvoie des tableaux vides et le globe s'affiche nu.
//
// Appele automatiquement par playwright.config.js avant la campagne.
// La base applicative n'est jamais touchee.
//
//   php tests/setup_front_db.php
// ════════════════════════════════════════════════════════

if (PHP_SAPI !== 'cli') { http_response_code(404); exit; }

require_once __DIR__ . '/bootstrap.php';

$pdo = setup_test_database();

$fixture = __DIR__ . '/fixtures/atlas.sql';
if (!is_file($fixture)) {
    tprint("ABANDON : $fixture introuvable (php tests/fixtures/make-atlas.php).");
    exit(2);
}

// Le fichier est execute d'un bloc plutot que decoupe sur « ; » : les
// historiques de marques contiennent des points-virgules et des sauts
// de ligne, qu'un decoupage naif casserait. Les lignes de commentaire
// sont retirees, MySQL enchainant sans peine le reste.
$sql = preg_replace('/^--.*$/m', '', file_get_contents($fixture));
$pdo->exec("SET FOREIGN_KEY_CHECKS = 0;\n" . $sql . "\nSET FOREIGN_KEY_CHECKS = 1;");

$compte = function (string $t) use ($pdo): int {
    return (int)$pdo->query("SELECT COUNT(*) FROM `$t`")->fetchColumn();
};

tprint('Base de test prete : ' . test_db_name());
tprint(sprintf('  %d pays producteurs · %d marches · %d pays a lounges · %d etablissements · %d marques',
    $compte('producer_countries'), $compte('markets'),
    $compte('lounge_countries'), $compte('lounges'), $compte('brands')));
