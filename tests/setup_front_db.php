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


// ── Rendez-vous (V2) ─────────────────────────────────────
// DEUX rendez-vous : un a venir, un passe. C'est ce qui rend la bascule
// « a venir / archives » verifiable — avec un seul, les deux etats
// afficheraient la meme chose et le parcours ne dirait rien.
//
// Celui a venir est rattache a un ETABLISSEMENT de l'atlas : c'est ce
// qui met « Prochain rendez-vous » sur sa fiche et pose son marqueur sur
// le globe.
$secEvt = (int)$pdo->query("SELECT id FROM forum_sections WHERE is_events = 1 LIMIT 1")->fetchColumn();
// Un etablissement de l'ATLAS, pas celui du jeu minimal : son pays
// doit exister sur le globe, sans quoi le parcours qui ouvre sa fiche
// n'a nulle part ou cliquer.
$lounge = (int)$pdo->query("SELECT l.id FROM lounges l
                            JOIN lounge_countries c ON c.id = l.country_id
                            WHERE l.is_verified = 1 ORDER BY l.id LIMIT 1")->fetchColumn();
if ($secEvt) {
    $pdo->exec("INSERT INTO forum_topics (id, section_id, user_id, title, slug, lang, posts_count, last_post_at)
                VALUES (910, $secEvt, 900, 'Degustation de rentree', 'degustation-de-rentree', 'fr', 1, NOW()),
                       (911, $secEvt, 900, 'Soiree du printemps dernier', 'soiree-du-printemps-dernier', 'fr', 1, NOW())");
    $pdo->exec("INSERT INTO forum_posts (topic_id, user_id, body) VALUES
        (910, 900, 'On ouvre trois **Behike** et une serie de robustos nicaraguayens.'),
        (911, 900, 'Merci a tous, c etait une belle soiree.')");
    $pdo->prepare(
        "INSERT INTO forum_events (topic_id, starts_at, timezone, kind, lounge_id, place_label, lat, lon, capacity, status)
         VALUES (910, DATE_ADD(UTC_TIMESTAMP(), INTERVAL 20 DAY), 'Europe/Paris', 'degustation', ?, 'Cave du Rhone, Geneve', 46.2044, 6.1432, 12, 'upcoming'),
                (911, DATE_SUB(UTC_TIMESTAMP(), INTERVAL 40 DAY), 'Europe/Paris', 'rencontre', NULL, 'Bar du Nord, Lille', 50.6292, 3.0573, NULL, 'past')"
    )->execute([$lounge ?: null]);
    // L'organisateur vient, par construction.
    $pdo->exec("INSERT INTO forum_attendance (topic_id, user_id, state, rank_no) VALUES (910, 900, 'going', 1)");
}


// ── Un sujet ANCRE sur une fiche de l'atlas ──────────────
// Sans lui, le bouton « En discuter » n'aurait jamais de compte a
// afficher, et le parcours qui le verifie ne dirait rien : il passerait
// aussi bien si le compte ne s'affichait jamais.
$secEtab = (int)$pdo->query("SELECT id FROM forum_sections WHERE slug = 'etablissements' LIMIT 1")->fetchColumn();
if ($secEtab && $lounge) {
    $pdo->exec("INSERT INTO forum_topics
                  (id, section_id, user_id, title, slug, lang, ref_type, ref_id, posts_count, last_post_at)
                VALUES (920, $secEtab, 900, 'Le fumoir est-il ventile ?', 'le-fumoir-est-il-ventile',
                        'fr', 'lounge', '$lounge', 1, NOW())");
    $pdo->exec("INSERT INTO forum_posts (topic_id, user_id, body) VALUES
        (920, 900, 'Quelqu un y est passe recemment ? Je cherche un endroit ou l on peut rester deux heures.')");
}
// Et une maison, pour la fiche de marque.
$secMaisons = (int)$pdo->query("SELECT id FROM forum_sections WHERE slug = 'maisons' LIMIT 1")->fetchColumn();
if ($secMaisons) {
    $pdo->exec("INSERT INTO forum_topics
                  (id, section_id, user_id, title, slug, lang, ref_type, ref_id, posts_count, last_post_at)
                VALUES (921, $secMaisons, 900, 'Le Siglo VI vaut-il son prix ?', 'le-siglo-vi-vaut-il-son-prix',
                        'fr', 'brand', 'Cohiba', 1, NOW())");
    $pdo->exec("INSERT INTO forum_posts (topic_id, user_id, body) VALUES
        (921, 900, 'La question se pose depuis la derniere hausse.')");
}


// ── Images d'un message ──────────────────────────────────
// Deux vignettes sous le premier message du sujet francais. Les
// fichiers sont VRAIMENT ecrits sur le disque : un parcours qui verifie
// l'affichage d'une image ne dit rien si l'image n'existe pas — le
// navigateur montrerait une icone cassee et le selecteur passerait
// quand meme.
$dirImg = PROJECT_ROOT . '/uploads/forum/e2e/';
if (!is_dir($dirImg)) @mkdir($dirImg, 0755, true);
if (extension_loaded('gd')) {
    $premier = (int)$pdo->query('SELECT id FROM forum_posts WHERE topic_id = 900 ORDER BY id LIMIT 1')->fetchColumn();
    foreach ([['a', 200, 60, 40], ['b', 60, 140, 200]] as [$n, $r, $v, $b]) {
        foreach ([['t_' . $n . '.jpg', 900, 600], ['thumb_t_' . $n . '.jpg', 400, 300]] as [$f, $w, $h]) {
            $im = imagecreatetruecolor($w, $h);
            imagefilledrectangle($im, 0, 0, $w, $h, imagecolorallocate($im, $r, $v, $b));
            imagejpeg($im, $dirImg . $f, 85);
            imagedestroy($im);
        }
        if ($premier) {
            $pdo->prepare('INSERT INTO forum_post_images (post_id, user_id, file, w, h) VALUES (?, 900, ?, 900, 600)')
                ->execute([$premier, 'e2e/t_' . $n . '.jpg']);
        }
    }
}

$compte = function (string $t) use ($pdo): int {
    return (int)$pdo->query("SELECT COUNT(*) FROM `$t`")->fetchColumn();
};

tprint('Base de test prete : ' . test_db_name());
tprint(sprintf('  %d pays producteurs · %d marches · %d pays a lounges · %d etablissements · %d marques',
    $compte('producer_countries'), $compte('markets'),
    $compte('lounge_countries'), $compte('lounges'), $compte('brands')));
