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

// ── Jeu du forum ─────────────────────────────────────────
// DEUX sujets, dans DEUX langues : c'est ce qui rend le filtre de
// langue verifiable. Avec un seul sujet, un parcours qui bascule le
// filtre afficherait la meme chose dans les deux cas et ne dirait rien.
// Le message porte du Markdown restreint, pour que le parcours voie le
// rendu du serveur et pas seulement une chaine.
$pdo->exec(
    "INSERT INTO users (id, email, password_hash, display_name, email_verified)
     VALUES (900, 'forum@test.local', 'x', 'Aficionado', 1)
     ON DUPLICATE KEY UPDATE display_name = VALUES(display_name)"
);
$sec = (int)$pdo->query("SELECT id FROM forum_sections WHERE slug = 'conservation'")->fetchColumn();
if ($sec) {
    $pdo->exec("INSERT INTO forum_topics (id, section_id, user_id, title, slug, lang, posts_count, last_post_at)
                VALUES (900, $sec, 900, 'Hygrometrie : 70 % ou 65 % ?', 'hygrometrie-70-ou-65', 'fr', 2, NOW()),
                       (901, $sec, 900, 'Curado del humidor nuevo', 'curado-del-humidor-nuevo', 'es', 1, NOW())");
    $pdo->exec("INSERT INTO forum_posts (topic_id, user_id, body) VALUES
        (900, 900, 'Je cherche le bon reglage.\n\n- **65 %** pour les robustos\n- 70 % pour les doubles coronas\n\n> Un cigare trop humide tire mal.'),
        (900, 900, 'A 65 % toute l annee, jamais de probleme.'),
        (901, 900, 'Cuanto tiempo hay que curar un humidor nuevo?')");
    foreach (['hygrometrie' => 900, 'cave' => 900] as $slug => $tid) {
        $pdo->prepare('INSERT IGNORE INTO forum_tags (slug, label, uses_count) VALUES (?, ?, 1)')->execute([$slug, $slug]);
        $gid = (int)$pdo->query('SELECT id FROM forum_tags WHERE slug = ' . $pdo->quote($slug))->fetchColumn();
        $pdo->prepare('INSERT IGNORE INTO forum_topic_tags VALUES (?, ?)')->execute([$tid, $gid]);
    }
}

$compte = function (string $t) use ($pdo): int {
    return (int)$pdo->query("SELECT COUNT(*) FROM `$t`")->fetchColumn();
};

tprint('Base de test prete : ' . test_db_name());
tprint(sprintf('  %d pays producteurs · %d marches · %d pays a lounges · %d etablissements · %d marques',
    $compte('producer_countries'), $compte('markets'),
    $compte('lounge_countries'), $compte('lounges'), $compte('brands')));
