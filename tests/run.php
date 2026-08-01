<?php
// Ligne de commande uniquement : ce harnais reconstruit la base de test.
if (PHP_SAPI !== 'cli') { http_response_code(404); exit; }
// ════════════════════════════════════════════════════════
// tests/run.php — Tests de fumee de l'API CigarOdyssey
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

tprint('CigarOdyssey — tests de fumee de l\'API');
tprint('Base de test : ' . test_db_name());

setup_test_database();
$base = start_server();
tprint('Serveur       : ' . $base);

register_shutdown_function('stop_server');

// Le journal des emails du mode DEV est partage avec l'application et
// s'accumule d'une session a l'autre : on note sa taille pour ne lire
// que ce que CE lancement y ajoute, sinon un jeton perime d'une session
// precedente serait pris pour celui d'Alice.
$MAIL_LOG    = PROJECT_ROOT . '/backend/cache/mail_outbox.log';
$MAIL_OFFSET = is_file($MAIL_LOG) ? filesize($MAIL_LOG) : 0;

/** Dernier jeton d'un type donne emis depuis le debut du lancement. */
function last_token(string $type): string {
    global $MAIL_LOG, $MAIL_OFFSET;
    if (!is_file($MAIL_LOG)) return '';
    $fresh = (string)@file_get_contents($MAIL_LOG, false, null, $MAIL_OFFSET);
    $re = $type === 'verify'
        ? '/action=verify&(?:amp;)?token=([a-f0-9]{64})/'
        : '/[?&]reset=([a-f0-9]{64})/';
    return preg_match_all($re, $fresh, $m) ? end($m[1]) : '';
}

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
$token = last_token('verify');
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
section('Donnees de l\'atlas');

$r = http('GET', $base . '/backend/data.php?action=globe', ['jar' => $anon]);
eq('globe : reponse valide', 200, $r['status']);
check('globe : structure attendue', isset($r['json']['countries'], $r['json']['markets'], $r['json']['lounge_countries']));

$r = http('GET', $base . '/backend/data.php?action=lounges&id=testland', ['jar' => $anon]);
eq('lounges : etablissement du pays renvoye', 1, count($r['json']['static']));
eq('lounges : champs enrichis presents', true, array_key_exists('maps_url', $r['json']['static'][0]));

$r = http('GET', $base . '/backend/data.php?action=lounges&id=testland&lang=en', ['jar' => $anon]);
eq('lounges : repli sur le francais si traduction absente', 'Lounge de test', $r['json']['static'][0]['name']);

$r = http('GET', $base . '/backend/data.php?action=lounges_all', ['jar' => $anon]);
check('lounges_all : regroupement par pays', isset($r['json']['lounges']['testland']));

$r = http('GET', $base . '/backend/data.php?action=inconnue', ['jar' => $anon]);
eq('action inconnue : refus', 404, $r['status']);

// ════════════════════════════════════════════════════════
section('Acces d\'administration');

$r = http('GET', $base . '/backend/api.php?action=export&admin_key=test-admin-key', ['jar' => $anon]);
eq('cle d\'administration refusee depuis l\'URL', 403, $r['status']);

$r = http('GET', $base . '/backend/api.php?action=export',
          ['jar' => $anon, 'headers' => ['X-Admin-Key: test-admin-key']]);
eq('cle d\'administration acceptee par en-tete', 200, $r['status']);

$r = http('GET', $base . '/backend/admin.php?tab=reviews', ['jar' => $anon]);
check('administration : page de connexion pour un visiteur', str_contains($r['body'], "Clé d'administration"));

// ════════════════════════════════════════════════════════
section('Emails');

require_once PROJECT_ROOT . '/backend/mailer.php';

// La suite tourne avec MAIL_LOG_ONLY=true : aucun message ne doit partir.
eq('pilote : MAIL_LOG_ONLY force le mode journal', 'log', mail_driver());

$html = email_template('Bienvenue, Alice !', 'Confirmez votre adresse.',
                       'Confirmer mon email', 'https://exemple.test/?verify=abc123',
                       'Lien valable 24 heures.');
$text = mail_text_from_html($html);

check('alternative texte : plus aucune balise', !preg_match('/<[a-z\/]/i', $text));
check('alternative texte : le lien reste exploitable', str_contains($text, 'https://exemple.test/?verify=abc123'));
check('alternative texte : le libelle du bouton precede son URL',
      str_contains($text, 'Confirmer mon email : https://exemple.test/?verify=abc123'));
check('alternative texte : entites HTML decodees', !str_contains($text, '&#039;') && !str_contains($text, '&amp;'));

// Repli mail() : le message doit etre un multipart texte + HTML valide.
[$mh, $mb] = mail_build_mime('Confirmez votre adresse email', $html, $text);
preg_match('/boundary="([^"]+)"/', $mh, $m);
check('MIME : frontiere declaree dans les en-tetes', !empty($m[1]));
eq('MIME : deux parties et une cloture', 3, substr_count($mb, '--' . ($m[1] ?? 'x')));
check('MIME : partie texte presente', str_contains($mb, 'Content-Type: text/plain; charset=UTF-8'));
check('MIME : partie HTML presente', str_contains($mb, 'Content-Type: text/html; charset=UTF-8'));
check('MIME : en-tetes Date et Message-ID', str_contains($mh, 'Date: ') && str_contains($mh, 'Message-ID: <'));
eq('MIME : sujet accentue encode en RFC 2047',
   '=?UTF-8?B?' . base64_encode('Réinitialisation') . '?=', _mail_encode_header('Réinitialisation'));
eq('MIME : sujet ASCII laisse tel quel', 'Welcome', _mail_encode_header('Welcome'));

// Un pilote HTTP sans cle d'API doit retomber sur mail() plutot que
// d'echouer en silence. Verifie dans un sous-processus, les constantes
// de configuration etant deja figees dans celui-ci.
check('pilote : brevo sans cle d\'API retombe sur mail()',
      probe_mail_driver(['MAIL_DRIVER' => 'brevo', 'MAIL_API_KEY' => '']) === 'mail');
check('pilote : brevo avec cle d\'API est retenu',
      probe_mail_driver(['MAIL_DRIVER' => 'brevo', 'MAIL_API_KEY' => 'xkeysib-test-000000000000']) === 'brevo');
check('pilote : valeur inconnue ramenee a mail()',
      probe_mail_driver(['MAIL_DRIVER' => 'fantaisie']) === 'mail');

// ════════════════════════════════════════════════════════
section('CORS');

/** Valeur d'un en-tete de reponse (derniere occurrence), '' si absent. */
function entete(string $brut, string $nom): string {
    $v = '';
    foreach (explode("\n", $brut) as $l) {
        if (stripos($l, $nom . ':') === 0) $v = trim(substr($l, strlen($nom) + 1));
    }
    return $v;
}

// Le serveur principal tourne en ALLOWED_ORIGIN=* (developpement).
$r = http('GET', $base . '/backend/data.php?action=globe',
          ['jar' => $anon, 'headers' => ['Origin: https://exemple-tiers.test']]);
eq('developpement : toute origine est acceptee', '*', entete($r['headers'], 'Access-Control-Allow-Origin'));

// Second serveur, CORS restreint : c'est la configuration de production.
$PERMIS  = 'https://cigarodyssey.com,https://www.cigarodyssey.com';
$restr   = start_server(['ALLOWED_ORIGIN' => $PERMIS]);

$r = http('GET', $restr . '/backend/data.php?action=globe',
          ['jar' => $anon, 'headers' => ['Origin: https://cigarodyssey.com']]);
eq('production : le domaine declare est autorise',
   'https://cigarodyssey.com', entete($r['headers'], 'Access-Control-Allow-Origin'));
check('production : la reponse varie selon l\'origine',
      stripos(entete($r['headers'], 'Vary'), 'origin') !== false);

$r = http('GET', $restr . '/backend/data.php?action=globe',
          ['jar' => $anon, 'headers' => ['Origin: https://www.cigarodyssey.com']]);
eq('production : le sous-domaine www est autorise separement',
   'https://www.cigarodyssey.com', entete($r['headers'], 'Access-Control-Allow-Origin'));

$r = http('GET', $restr . '/backend/data.php?action=globe',
          ['jar' => $anon, 'headers' => ['Origin: https://cigarodyssey.com.attaquant.test']]);
eq('production : une origine qui prefixe le domaine est refusee',
   '', entete($r['headers'], 'Access-Control-Allow-Origin'));

$r = http('GET', $restr . '/backend/data.php?action=globe',
          ['jar' => $anon, 'headers' => ['Origin: http://cigarodyssey.com']]);
eq('production : le meme domaine en clair est refuse',
   '', entete($r['headers'], 'Access-Control-Allow-Origin'));

$r = http('GET', $restr . '/backend/data.php?action=globe',
          ['jar' => $anon, 'headers' => ['Origin: https://exemple-tiers.test']]);
eq('production : une origine tierce repart sans autorisation',
   '', entete($r['headers'], 'Access-Control-Allow-Origin'));

// Requetes authentifiees : « * » et les cookies sont incompatibles.
$r = http('GET', $restr . '/backend/auth.php?action=me',
          ['jar' => $anon, 'headers' => ['Origin: https://cigarodyssey.com']]);
eq('production : credentials autorises pour le domaine declare',
   'true', entete($r['headers'], 'Access-Control-Allow-Credentials'));
eq('production : jamais « * » avec des credentials',
   'https://cigarodyssey.com', entete($r['headers'], 'Access-Control-Allow-Origin'));

$r = http('GET', $restr . '/backend/auth.php?action=me',
          ['jar' => $anon, 'headers' => ['Origin: https://exemple-tiers.test']]);
eq('production : pas de credentials pour une origine tierce',
   '', entete($r['headers'], 'Access-Control-Allow-Credentials'));

// photos.php codait « * » en dur, hors de cors_headers().
$r = http('GET', $restr . '/backend/photos.php?action=list&lounge_id=1',
          ['jar' => $anon, 'headers' => ['Origin: https://exemple-tiers.test']]);
eq('production : photos.php respecte aussi la liste',
   '', entete($r['headers'], 'Access-Control-Allow-Origin'));

// ════════════════════════════════════════════════════════
section('Traductions');

// Le controle vit dans tools/i18n_check.php pour rester lancable seul ;
// la constante empeche son bloc « ligne de commande » de s'executer ici.
define('I18N_CHECK_INCLUDE', true);
require_once PROJECT_ROOT . '/tools/i18n_check.php';

$trad = i18n_parse(PROJECT_ROOT . '/assets/js/i18n.js');

check('i18n : les six langues sont declarees',
      count(array_intersect(['fr','en','es','de','zh','ar'], array_keys($trad))) === 6,
      'trouvees : ' . implode(', ', array_keys($trad)));
check('i18n : le francais sert de reference', !empty($trad['fr']));

foreach (i18n_ecarts($trad) as $langue => $e) {
    eq("i18n : $langue ne manque aucune cle", [], $e['manquantes']);
    eq("i18n : $langue n'a pas de cle orpheline", [], $e['en_trop']);
}

report_and_exit();

/**
 * Pilote retenu pour un environnement donne. Les constantes de
 * configuration etant figees a la premiere inclusion, chaque variante
 * se mesure dans un processus separe ; l'environnement est transmis a
 * proc_open plutot qu'a travers le shell, dont la syntaxe differe
 * entre Windows et POSIX.
 */
function probe_mail_driver(array $vars): string {
    $env = array_merge([
        'MAIL_LOG_ONLY' => 'false',
        'SystemRoot'    => getenv('SystemRoot') ?: '',
        'PATH'          => getenv('PATH') ?: '',
    ], $vars);
    $cmd = sprintf('%s -d xdebug.mode=off %s',
                   escapeshellarg(PHP_BINARY),
                   escapeshellarg(PROJECT_ROOT . '/tests/probe_mail_driver.php'));
    $pipes = [];
    $proc = proc_open($cmd, [1 => ['pipe', 'w'], 2 => ['pipe', 'w']], $pipes, PROJECT_ROOT, $env);
    if (!is_resource($proc)) return '';
    $out = stream_get_contents($pipes[1]);
    fclose($pipes[1]); fclose($pipes[2]);
    proc_close($proc);
    return trim((string)$out);
}
