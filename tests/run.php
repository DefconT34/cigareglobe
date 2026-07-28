<?php
// ════════════════════════════════════════════════════════
// tests/run.php — Tests de fumee de l'API CigarGlobe
// ────────────────────────────────────────────────────────
// Verifie les comportements essentiels : authentification, protection
// CSRF, gating des contributions, avis et moderation, favoris, profil,
// et acces d'administration. S'execute contre une base DEDIEE, recreee a
// chaque lancement ; la base applicative n'est jamais modifiee.
//
//   php tests/run.php
//
// Code de sortie : 0 si tout passe, 1 sinon (utilisable en CI).
// ════════════════════════════════════════════════════════

require_once __DIR__ . '/bootstrap.php';

tprint('CigarGlobe — tests de fumee de l\'API');
tprint('Base de test : ' . test_db_name());

setup_test_database();
$base = start_server();
tprint('Serveur       : ' . $base);

register_shutdown_function('stop_server');

$alice = new_client('alice');   // membre principal
$bob   = new_client('bob');     // second membre (signalements)
$anon  = new_client('anon');    // visiteur non connecte

// ════════════════════════════════════════════════════════
section('Authentification');

$r = http('GET', $base . '/backend/auth.php?action=me', ['jar' => $alice]);
eq('me : visiteur anonyme, pas d\'utilisateur', null, $r['json']['user']);
check('me : fournit un jeton CSRF', !empty($r['json']['csrf']));

$r = post_json($base, $alice, '/backend/auth.php?action=register',
               ['email' => 'alice@test.local', 'password' => 'court', 'display_name' => 'Alice']);
eq('inscription : mot de passe trop court refuse', 400, $r['status']);

$r = post_json($base, $alice, '/backend/auth.php?action=register',
               ['email' => 'alice@test.local', 'password' => 'motdepasse8', 'display_name' => 'Alice']);
eq('inscription : creation du compte', 201, $r['status']);
eq('inscription : email non verifie au depart', false, $r['json']['user']['email_verified']);

$r = post_json($base, $bob, '/backend/auth.php?action=register',
               ['email' => 'alice@test.local', 'password' => 'motdepasse8', 'display_name' => 'Sosie']);
eq('inscription : email deja utilise refuse', 409, $r['status']);

// Verification de l'email par le lien recu (journal des emails en mode DEV)
$log = PROJECT_ROOT . '/backend/cache/mail_outbox.log';
$token = '';
if (is_file($log) && preg_match('/action=verify&(?:amp;)?token=([a-f0-9]{64})/', file_get_contents($log), $m)) {
    $token = $m[1];
}
check('verification : jeton present dans l\'email envoye', $token !== '');
if ($token !== '') {
    $r = http('GET', $base . '/backend/auth.php?action=verify&token=' . $token, ['jar' => $alice]);
    eq('verification : redirection apres validation', 302, $r['status']);
    $r = http('GET', $base . '/backend/auth.php?action=me', ['jar' => $alice]);
    eq('verification : compte desormais verifie', true, $r['json']['user']['email_verified']);
}

$r = http('POST', $base . '/backend/auth.php?action=login',
          ['jar' => $anon, 'json' => ['email' => 'alice@test.local', 'password' => 'motdepasse8']]);
eq('CSRF : connexion sans jeton refusee', 419, $r['status']);

$r = post_json($base, $anon, '/backend/auth.php?action=login',
               ['email' => 'alice@test.local', 'password' => 'mauvais']);
eq('connexion : mot de passe errone refuse', 401, $r['status']);

$r = post_json($base, $alice, '/backend/auth.php?action=logout', []);
eq('deconnexion : succes', 200, $r['status']);
$r = http('GET', $base . '/backend/auth.php?action=me', ['jar' => $alice]);
eq('deconnexion : session effectivement fermee', null, $r['json']['user']);

$r = post_json($base, $alice, '/backend/auth.php?action=login',
               ['email' => 'alice@test.local', 'password' => 'motdepasse8']);
eq('connexion : identifiants valides acceptes', 200, $r['status']);

// ════════════════════════════════════════════════════════
section('Contributions');

$contrib = ['country_id' => 'testland', 'country_name' => 'Testland',
            'name' => 'Nouveau lounge', 'city' => 'Ville',
            'description' => 'Un etablissement propose par un membre.'];

$r = post_json($base, $anon, '/backend/api.php?action=submit', $contrib);
eq('soumission : refusee sans compte', 401, $r['status']);

// Bob s'inscrit mais ne verifie pas son email
post_json($base, $bob, '/backend/auth.php?action=register',
          ['email' => 'bob@test.local', 'password' => 'motdepasse8', 'display_name' => 'Bob']);
$r = post_json($base, $bob, '/backend/api.php?action=submit', $contrib);
eq('soumission : refusee tant que l\'email n\'est pas verifie', 403, $r['status']);
eq('soumission : le refus invite a verifier l\'email', true, $r['json']['need_verify']);

$r = post_json($base, $alice, '/backend/api.php?action=submit', $contrib);
eq('soumission : acceptee pour un compte verifie', 200, $r['status']);
eq('soumission : pas de publication directe pour un membre', false, $r['json']['auto_approved']);

$r = post_json($base, $alice, '/backend/api.php?action=submit', $contrib);
eq('soumission : doublon refuse', 409, $r['status']);

$r = http('GET', $base . '/backend/api.php?action=my_contributions', ['jar' => $alice]);
eq('mes contributions : la contribution est rattachee au compte', 1, count($r['json']['contributions']));
eq('mes contributions : en attente de moderation', 'pending', $r['json']['contributions'][0]['status']);

$row = test_pdo()->query("SELECT contributor_email FROM contributions LIMIT 1")->fetch();
eq('soumission : email pris sur le compte, pas sur le formulaire', 'alice@test.local', $row['contributor_email']);

// ════════════════════════════════════════════════════════
section('Avis et moderation');

$r = post_json($base, $alice, '/backend/api.php?action=review',
               ['id' => 1, 'rating' => 5, 'title' => 'Excellent', 'body' => 'Tres bonne adresse.']);
eq('avis : publication', 200, $r['status']);
eq('avis : note moyenne du lounge recalculee', 5, $r['json']['rating']);

$r = post_json($base, $alice, '/backend/api.php?action=review',
               ['id' => 1, 'rating' => 3, 'body' => 'Avis revise.']);
eq('avis : un seul avis par membre (mise a jour)', 3, $r['json']['rating']);
eq('avis : le compte d\'avis reste a 1', 1, (int)$r['json']['rating_count']);

$r  = http('GET', $base . '/backend/api.php?action=reviews&id=1', ['jar' => $anon]);
eq('avis : visible publiquement', 1, count($r['json']['reviews']));
$rid = (int)$r['json']['reviews'][0]['id'];

$r = post_json($base, $alice, '/backend/api.php?action=review_flag', ['id' => $rid]);
eq('signalement : impossible sur son propre avis', 400, $r['status']);

force_verified('bob@test.local');
$r = post_json($base, $bob, '/backend/api.php?action=review_flag', ['id' => $rid, 'reason' => 'test']);
eq('signalement : enregistre', 1, $r['json']['flags']);
$r = post_json($base, $bob, '/backend/api.php?action=review_flag', ['id' => $rid]);
eq('signalement : pas de doublon pour un meme membre', 1, $r['json']['flags']);

$r = http('GET', $base . '/backend/api.php?action=reviews&id=1', ['jar' => $anon]);
eq('signalement : l\'avis reste visible avant decision', 1, count($r['json']['reviews']));

// Moderation : retrait puis retablissement via l'interface d'administration
$admin = new_client('admin');
$r = http('POST', $base . '/backend/admin.php', ['jar' => $admin, 'form' => ['login_key' => 'test-admin-key']]);
eq('administration : connexion par formulaire', 302, $r['status']);

$page = http('GET', $base . '/backend/admin.php?tab=reviews', ['jar' => $admin]);
preg_match('/name="csrf" value="([a-f0-9]{64})"/', $page['body'], $m);
$acsrf = $m[1] ?? '';
check('administration : jeton CSRF present dans les formulaires', $acsrf !== '');

$r = http('POST', $base . '/backend/admin.php',
          ['jar' => $admin, 'form' => ['id' => $rid, 'action' => 'review_remove', 'csrf' => 'faux']]);
eq('administration : action refusee sans jeton valide', 419, $r['status']);

http('POST', $base . '/backend/admin.php',
     ['jar' => $admin, 'form' => ['id' => $rid, 'action' => 'review_remove', 'csrf' => $acsrf]]);
$r = http('GET', $base . '/backend/api.php?action=reviews&id=1', ['jar' => $anon]);
eq('moderation : avis retire, masque au public', 0, count($r['json']['reviews']));
$row = test_pdo()->query("SELECT rating_count FROM lounges WHERE id = 1")->fetch();
eq('moderation : avis retire exclu de la note', 0, (int)$row['rating_count']);

http('POST', $base . '/backend/admin.php',
     ['jar' => $admin, 'form' => ['id' => $rid, 'action' => 'review_publish', 'csrf' => $acsrf]]);
$r = http('GET', $base . '/backend/api.php?action=reviews&id=1', ['jar' => $anon]);
eq('moderation : avis retabli', 1, count($r['json']['reviews']));

// ════════════════════════════════════════════════════════
section('Favoris et listes');

$r = post_json($base, $alice, '/backend/api.php?action=fav_toggle',
               ['target_type' => 'lounge', 'target_id' => '1', 'list' => 'to_visit', 'on' => true]);
eq('favoris : ajout a une liste', ['to_visit'], $r['json']['lists']);

$r = post_json($base, $alice, '/backend/api.php?action=fav_toggle',
               ['target_type' => 'lounge', 'target_id' => '1', 'list' => 'visited', 'on' => true]);
eq('favoris : plusieurs listes pour une meme cible', 2, count($r['json']['lists']));

$r = http('GET', $base . '/backend/api.php?action=fav_states', ['jar' => $alice]);
eq('favoris : etat renvoye pour l\'interface', 2, count($r['json']['favorites']['lounge']['1']));

$r = http('GET', $base . '/backend/api.php?action=fav_list', ['jar' => $alice]);
eq('favoris : liste enrichie du nom de l\'etablissement', 'Lounge de test', $r['json']['items'][0]['lounge_name']);

$r = post_json($base, $alice, '/backend/api.php?action=fav_toggle',
               ['target_type' => 'lounge', 'target_id' => '1', 'list' => 'to_visit', 'on' => false]);
eq('favoris : retrait d\'une liste', ['visited'], $r['json']['lists']);

// ════════════════════════════════════════════════════════
section('Profil et passeport');

$r = http('GET', $base . '/backend/api.php?action=profile', ['jar' => $alice]);
eq('profil : avis comptabilise', 1, $r['json']['stats']['reviews_count']);
eq('profil : passeport alimente par les lieux visites', ['testland'], $r['json']['passport']);

$r = post_json($base, $alice, '/backend/api.php?action=profile_update',
               ['display_name' => 'Alice B.', 'bio' => 'Amatrice de cigares.', 'avatar' => 'AB']);
eq('profil : mise a jour', 'Alice B.', $r['json']['user']['display_name']);

$r = http('GET', $base . '/backend/api.php?action=profile', ['jar' => $anon]);
eq('profil : consultation refusee sans compte ni identifiant', 401, $r['status']);

// ════════════════════════════════════════════════════════
section('Acces d\'administration');

$r = http('GET', $base . '/backend/api.php?action=export&admin_key=test-admin-key', ['jar' => $anon]);
eq('cle d\'administration refusee depuis l\'URL', 403, $r['status']);

$r = http('GET', $base . '/backend/api.php?action=export',
          ['jar' => $anon, 'headers' => ['X-Admin-Key: test-admin-key']]);
eq('cle d\'administration acceptee par en-tete', 200, $r['status']);

$r = http('GET', $base . '/backend/admin.php?tab=reviews', ['jar' => $anon]);
check('administration : page de connexion pour un visiteur', str_contains($r['body'], "Clé d'administration"));

report_and_exit();
