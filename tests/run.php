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

// « Derniere visite » doit valoir quelque chose des l'inscription : la
// personne EST connectee. Sans cela, elle restait « jamais venue » tant
// qu'elle ne se deconnectait pas pour se reconnecter — et le compte des
// membres actifs ignorait justement les nouveaux venus, c'est-a-dire
// les plus actifs. Constate a l'ecran sur un compte connecte.
check('inscription : la derniere visite est horodatee',
      test_pdo()->query("SELECT last_login_at FROM users WHERE email='alice@test.local'")
                ->fetchColumn() !== null);

// La reponse DIT si l'email est reellement parti. Sans ce drapeau,
// l'interface annoncait « verifiez vos emails » meme quand l'envoi
// avait echoue — une cle d'API invalide, et la personne cherchait dans
// ses indesirables un message qui n'existait pas.
check('inscription : la reponse dit si l\'email est parti',
      array_key_exists('email_envoye', $r['json'] ?? []));
eq('inscription : ici il part (pilote « log »)', true, $r['json']['email_envoye'] ?? null);

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

// ── Position relevee sur place (migration 011) ───────────
// Elle vient du client : elle doit etre validee, et jamais bloquer un
// signalement par ailleurs valable. Chaque cas est envoye sous un nom
// distinct, l'anti-doublon refusant deux fois le meme.
$coord = function (string $nom, $lat, $lon) use ($base, $alice, $contrib) {
    // Le quota est de 3 envois par 24 h pour un membre ordinaire, et ce
    // bloc en fait six. On antidate les precedents plutot que de
    // promouvoir Alice : la promotion changerait le chemin teste, les
    // contributeurs de confiance etant publies sans moderation.
    test_pdo()->exec("UPDATE contributions
                         SET created_at = DATE_SUB(NOW(), INTERVAL 48 HOUR)");
    $c = array_merge($contrib, ['name' => $nom, 'country_id' => 'coordland', 'country_name' => 'Coordland']);
    if ($lat !== null) $c['lat'] = $lat;
    if ($lon !== null) $c['lon'] = $lon;
    $r = post_json($base, $alice, '/backend/api.php?action=submit', $c);
    if ($r['status'] !== 200) return ['http' => $r['status']];
    $q = test_pdo()->prepare('SELECT lat, lon FROM contributions WHERE name = ?');
    $q->execute([$nom]);
    return $q->fetch(PDO::FETCH_ASSOC) ?: [];
};

$p = $coord('Havane centre', 23.1136, -82.3666);
eq('position : une coordonnee valable est enregistree', '23.1136000', $p['lat']);
eq('position : longitude enregistree',                  '-82.3666000', $p['lon']);

$p = $coord('Hors plage', 191.5, -82.3);
eq('position : latitude hors plage ignoree, envoi accepte', null, $p['lat']);

$p = $coord('Capteur muet', 0, 0);
eq('position : le point (0,0) est un capteur muet, pas un lieu', null, $p['lat']);

$p = $coord('Latitude seule', 23.1136, null);
eq('position : une latitude sans longitude ne designe rien', null, $p['lat']);

$p = $coord('Texte a la place', 'ici', 'la-bas');
eq('position : valeur non numerique ignoree', null, $p['lat']);

$p = $coord('Sans position', null, null);
eq('position : absente, le signalement passe quand meme', null, $p['lat']);

// La position doit survivre a l'approbation : la recueillir puis la
// perdre serait pire que de ne pas la demander.
$idPos = (int)test_pdo()->query("SELECT id FROM contributions WHERE name = 'Havane centre'")->fetchColumn();
require_once PROJECT_ROOT . '/backend/moderation_lib.php';
// Le contributeur doit etre prevenu : on releve la taille du journal
// des emails avant l'approbation pour ne lire que ce qu'elle ajoute.
$MAIL_AV = is_file($MAIL_LOG) ? filesize($MAIL_LOG) : 0;
approve_contribution(test_pdo(), $idPos);
$q = test_pdo()->prepare('SELECT lat, lon FROM approved_lounges WHERE contribution_id = ?');
$q->execute([$idPos]);
$ap = $q->fetch(PDO::FETCH_ASSOC) ?: [];
eq('position : conservee a l\'approbation', '23.1136000', $ap['lat'] ?? null);
// -- L'approbation cree un vrai etablissement (migration 013) --
// Le defaut d'origine : l'approbation n'ecrivait que dans
// `approved_lounges`, servie par une requete filtrant sur une colonne
// `status` inexistante. L'erreur SQL etait avalee par un catch, la
// liste revenait vide, et l'etablissement n'apparaissait JAMAIS sur le
// site. Le moderateur voyait « Approuve », le visiteur ne voyait rien.
$l = test_pdo()->prepare('SELECT country_id, lat, is_verified FROM lounges WHERE contribution_id = ?');
$l->execute([$idPos]);
$fiche = $l->fetch(PDO::FETCH_ASSOC) ?: [];
eq('approbation : une ligne est creee dans lounges', 'coordland', $fiche['country_id'] ?? null);
eq('approbation : la fiche est servie (is_verified)', '1', (string)($fiche['is_verified'] ?? ''));
eq('approbation : la position suit jusqu\'au catalogue', '23.1136000', $fiche['lat'] ?? null);

// Le point qui compte vraiment : l'API la sert.
$r = http('GET', $base . '/backend/data.php?action=lounges&id=coordland&lang=fr');
$noms = array_column($r['json']['static'] ?? [], 'name');
eq('approbation : l\'etablissement apparait sur le site', true, in_array('Havane centre', $noms, true));

// Notification du contributeur : c'est le moment ou l'on remercie
// quelqu'un, et jusqu'ici rien ne partait.
$mail = (string)@file_get_contents($MAIL_LOG, false, null, $MAIL_AV);
check('approbation : le contributeur est prevenu par email',
      str_contains($mail, 'alice@test.local') && str_contains($mail, 'en ligne'));
check('approbation : l\'email pointe la fiche creee',
      (bool)preg_match('/[?&]lounge=[0-9]+/', $mail));

// Langue de correspondance (migration 014). Alice s'est inscrite sans
// preciser de langue et sans Accept-Language : elle est donc en
// francais, et l'email doit l'etre aussi.
$lg = test_pdo()->query("SELECT lang FROM users WHERE email = 'alice@test.local'")->fetchColumn();
eq('langue : renseignee a l\'inscription', 'fr', $lg);
check('langue : l\'email suit la langue du compte',
      str_contains($mail, 'etablissement est en ligne') || str_contains($mail, 'tablissement est en ligne'));
$MAIL_AV2 = is_file($MAIL_LOG) ? filesize($MAIL_LOG) : 0;

// Rejouer l'approbation ne doit pas dupliquer la fiche.
approve_contribution(test_pdo(), $idPos);
$n = test_pdo()->prepare('SELECT COUNT(*) FROM lounges WHERE contribution_id = ?');
$n->execute([$idPos]);
eq('approbation : rejouee, elle ne duplique pas', 1, (int)$n->fetchColumn());
eq('approbation : rejouee, elle ne renotifie pas', 0,
   strlen((string)@file_get_contents($MAIL_LOG, false, null, $MAIL_AV2)));

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

// ── Langue de correspondance dans le profil (migration 014) ──
// Le piege : langue_demandee() retombe TOUJOURS sur une langue valable
// (Accept-Language, puis francais). C'est juste a l'inscription, faux
// ici — envoyer une valeur inconnue remettait le compte en francais,
// ecrasant une preference deliberee.
$lireLang = function () {
    return test_pdo()->query("SELECT lang FROM users WHERE email = 'alice@test.local'")->fetchColumn();
};
$majLang = function ($v) use ($base, $alice) {
    return post_json($base, $alice, '/backend/api.php?action=profile_update',
                     ['display_name' => 'Alice B.', 'bio' => '', 'avatar' => '', 'lang' => $v]);
};

$majLang('ar');
eq('profil : une langue valable est enregistree', 'ar', $lireLang());
$majLang('klingon');
eq('profil : une langue inconnue ne change rien', 'ar', $lireLang());
$majLang('');
eq('profil : une langue vide ne change rien', 'ar', $lireLang());
$r = post_json($base, $alice, '/backend/api.php?action=profile_update',
               ['display_name' => 'Alice B.', 'bio' => '', 'avatar' => '']);
eq('profil : langue absente du corps, valeur conservee', 'ar', $lireLang());
eq('profil : la langue est renvoyee au client', 'ar', $r['json']['user']['lang'] ?? null);
$majLang('fr');

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

// « all » servait le globe SEUL. Il capturait la sortie de action_globe
// par ob_start(), mais jout() termine le script : la capture ne rendait
// jamais la main, et le bloc qui ajoute brands/habanos etait mort. La
// reponse restant un JSON valide, rien ne le signalait.
$r = http('GET', $base . '/backend/data.php?action=all', ['jar' => $anon]);
eq('all : reponse valide', 200, $r['status']);
check('all : porte le globe', isset($r['json']['countries'], $r['json']['markets']));
check('all : porte AUSSI les marques', !empty($r['json']['brands']));
check('all : porte AUSSI la presence Habanos', array_key_exists('habanos', $r['json']));

$r = http('GET', $base . '/backend/data.php?action=inconnue', ['jar' => $anon]);
eq('action inconnue : refus', 404, $r['status']);

// ── La fiche d'une feuille ───────────────────────────────
//
// Six pays de l'atlas vendent de la FEUILLE et non des cigares. Leur
// fiche n'en disait qu'une liste de noms ; la table `feuilles` leur
// donne l'equivalent de ce qu'une maison a depuis toujours.
$r = http('GET', $base . '/backend/data.php?action=feuille&id=feuille-de-test', ['jar' => $anon]);
eq('feuille : reponse valide', 200, $r['status']);
$f = $r['json']['feuille'] ?? [];
eq('feuille : porte son nom', 'Feuille de test', $f['name'] ?? null);
check('feuille : porte sa genese', !empty($f['genese']));
check('feuille : notes et accords sont des tableaux',
      is_array($f['notes'] ?? null) && is_array($f['pairings'] ?? null));

// La liste des cigares qui portent la feuille n'est PAS stockee : elle
// se derive des entrees `cape: true` de la fiche pays. Si elle revenait
// vide, c'est que la derivation est cassee — et rien d'autre ne le
// dirait, puisqu'une liste vide s'affiche simplement comme un bloc
// masque.
check('feuille : les cigares qui la portent sont derives de la fiche pays',
      in_array('Cigare a cape de test', $f['cigares'] ?? [], true));

// ── Les illustrations des notes et des accords ───────────
//
// La famille d'illustration est choisie par le SERVEUR, sur le
// francais, parce que le front recoit « 咖啡 » ou « قهوة » selon la
// langue et n'y reconnaitrait pas un cafe.
//
// Deux proprietes a tenir, et aucune ne se voit a l'oeil :
//   - un tableau d'icones AUSSI LONG que sa liste, sinon les icones se
//     decalent d'un cran et illustrent la note d'a cote ;
//   - le MEME choix quelle que soit la langue — c'est tout l'interet de
//     le calculer avant traduction.
check('feuille : autant d\'icones que de notes',
      count($f['notes'] ?? []) === count($f['notes_icones'] ?? [null]));
check('feuille : autant d\'icones que d\'accords',
      count($f['pairings'] ?? []) === count($f['pairings_icones'] ?? [null]));

$r2 = http('GET', $base . '/backend/data.php?action=feuille&id=feuille-de-test&lang=zh', ['jar' => $anon]);
eq('feuille : les icones ne dependent pas de la langue',
   $f['notes_icones'] ?? null, $r2['json']['feuille']['notes_icones'] ?? null);

// ── Le glossaire, et pourquoi il a deux entrees par famille ──
//
// « Terre » ne dit rien a qui ne pratique pas. La fiche joint donc une
// phrase par famille employee — et SEULEMENT celles-la : servir les
// vingt gloses a chaque fiche ferait grossir la reponse pour rien.
$glo = $f['glossaire'] ?? [];
check('feuille : le glossaire est servi avec la fiche', $glo !== []);
check('feuille : glose la famille terre en note', !empty($glo['note|terre']));
check('feuille : ne sert pas les familles absentes de la fiche',
      !isset($glo['note|foin'], $glo['accord|vin']));

$glo2 = $r2['json']['feuille']['glossaire'] ?? [];
check('feuille : le glossaire suit la langue demandee',
      !empty($glo2['note|terre']) && $glo2['note|terre'] !== ($glo['note|terre'] ?? null));
eq('feuille : les memes familles glosees dans toutes les langues',
   array_keys($glo), array_keys($glo2));

// LE PIEGE QUE CECI TIENT. `aromes` a pour cle (famille, contexte). Un
// outil qui identifie une ligne par sa premiere colonne de cle confond
// les deux « cacao » — c'est arrive au dump des traductions, qui
// recopiait la glose de l'accord sur celle de la note. Les deux textes
// restent lisibles, le compte reste juste : seul l'ecran ment.
//
// ET C'EST EN LANGUE QUE CA SE VOIT. Le dump ne reecrit que les colonnes
// traduites : le francais sort indemne d'une corruption qui a deja
// mange les cinq autres. Un controle pose sur le francais aurait donc
// repondu OK sur une base fausse — verifie, et c'est ce qu'il faisait.
foreach (['fr' => $glo, 'zh' => $glo2] as $lg => $g) {
    check("feuille [$lg] : cacao ne dit pas la meme chose en note et en accord",
          !empty($g['note|cacao']) && !empty($g['accord|cacao'])
          && $g['note|cacao'] !== $g['accord|cacao']);
}

// ── L'emploi de la feuille suit la langue ────────────────
//
// « Cape », « Tripe et sous-cape » : le sous-titre de la fiche, et le
// seul mot qui dise a quoi la feuille sert. Il s'affichait en francais
// dans les six langues, parce que `emploi` n'etait declare dans aucun
// des deux plans de traduction.
//
// LE COMPTEUR NE POUVAIT PAS LE VOIR. i18n_fraicheur annoncait 100 %,
// ce qui etait vrai des champs DECLARES et muet sur celui qui ne l'etait
// pas. Un champ hors perimetre n'est pas « manquant » : il est absent.
// Maintenant qu'il est declare, une dixieme valeur saisie plus tard
// remontera d'elle-meme comme manquante.
check('feuille : porte son emploi', !empty($f['emploi']));
$emplois = [];
foreach (['fr', 'en', 'de'] as $lg) {
    $rr = http('GET', $base . '/backend/data.php?action=feuille&id=feuille-de-test&lang=' . $lg,
               ['jar' => $anon]);
    $emplois[$lg] = $rr['json']['feuille']['emploi'] ?? null;
}
check('feuille : l\'emploi est traduit, pas servi en francais partout',
      $emplois['fr'] !== null && $emplois['en'] !== null
      && $emplois['fr'] !== $emplois['en'] && $emplois['en'] !== $emplois['de']);

$r = http('GET', $base . '/backend/data.php?action=feuille&id=inconnue', ['jar' => $anon]);
eq('feuille inconnue : refus', 404, $r['status']);

// La fiche pays annonce ses feuilles documentees : sans cela, aucune
// etiquette de « Varietes » ne devient cliquable.
$r = http('GET', $base . '/backend/data.php?action=country&id=testland', ['jar' => $anon]);
check('pays : annonce ses feuilles documentees',
      !empty($r['json']['feuilles']) && ($r['json']['feuilles'][0]['id'] ?? '') === 'feuille-de-test');

// ── Deux listes du meme fait ─────────────────────────────
//
// Les champs traduisibles sont declares DEUX FOIS : dans
// backend/data.php (ce que le serveur substitue) et dans
// tools/i18n_contenu_plan.php (ce que l'outillage exporte). Une table
// ajoutee d'un cote seulement se traduit sans jamais s'afficher
// traduite, ou l'inverse — et rien ne le dit.
//
// C'est le motif du lot 5, applique a du code plutot qu'a du contenu.
{
    $srcApi  = (string)@file_get_contents(PROJECT_ROOT . '/backend/data.php');
    $srcPlan = (string)@file_get_contents(PROJECT_ROOT . '/tools/i18n_contenu_plan.php');
    $tables = function (string $src): array {
        preg_match_all("/'([a-z_]+)'\s*=>\s*\[('[a-z_]+'(?:\s*,\s*'[a-z_]+')*)\]/", $src, $m, PREG_SET_ORDER);
        $out = [];
        foreach ($m as $x) {
            preg_match_all("/'([a-z_]+)'/", $x[2], $c);
            $champs = $c[1]; sort($champs);
            $out[$x[1]] = $champs;
        }
        return $out;
    };
    $a = $tables($srcApi);
    $b = $tables($srcPlan);
    $communes = array_intersect(array_keys($a), array_keys($b));
    $divergentes = [];
    foreach ($communes as $t) if ($a[$t] !== $b[$t]) $divergentes[] = $t;
    check('i18n : le serveur et l\'outillage listent les memes champs traduisibles',
          $divergentes === [], implode(', ', $divergentes));
    check('i18n : la table des feuilles est declaree des deux cotes',
          isset($a['feuilles'], $b['feuilles']));
}

// ════════════════════════════════════════════════════════
section('Espace communautaire');

// Le delai anti-robot (30 s entre deux messages) ferait echouer tout ce
// qui suit : on recule les messages deja ecrits entre deux etapes,
// comme on le fait pour le plafond de contributions. Le delai lui-meme
// est verifie explicitement plus bas.
$recule = function (int $minutes = 5): void {
    test_pdo()->exec("UPDATE forum_posts SET created_at = DATE_SUB(created_at, INTERVAL $minutes MINUTE)");
};

$r = http('GET', $base . '/backend/forum.php?action=sections', ['jar' => $anon]);
eq('forum : les rubriques sont publiques', 200, $r['status']);
eq('forum : huit rubriques', 8, count($r['json']['sections']));
check('forum : les rubriques n\'ont PAS de libelle en base (i18n cote front)',
      !array_key_exists('label', $r['json']['sections'][0]));

$r = post_json($base, $anon, '/backend/forum.php?action=topic_create',
               ['section' => 'cigares', 'title' => 'Un titre valable', 'body' => str_repeat('a', 30)]);
eq('forum : ecrire exige un compte', 401, $r['status']);

$r = post_json($base, $alice, '/backend/forum.php?action=topic_create',
               ['section' => 'cigares', 'title' => 'court', 'body' => str_repeat('a', 30)]);
eq('forum : titre trop court refuse', 400, $r['status']);

$r = post_json($base, $alice, '/backend/forum.php?action=topic_create',
               ['section' => 'inexistante', 'title' => 'Un titre valable', 'body' => str_repeat('a', 30)]);
eq('forum : rubrique inconnue refusee', 400, $r['status']);

// ── Le sujet de reference ────────────────────────────────
$r = post_json($base, $alice, '/backend/forum.php?action=topic_create', [
    'section' => 'conservation',
    'title'   => 'Hygrometrie : 70 % ou 65 % ?',
    'body'    => "Je cherche le bon reglage.\n\n- 65 % pour les robustos\n- 70 % pour les doubles coronas",
    'lang'    => 'fr',
    'tags'    => ['Hygrométrie', 'cave', 'Hygrométrie'],   // doublon volontaire
]);
eq('forum : sujet cree', 201, $r['status']);
$t_fr = (int)$r['json']['id'];
eq('forum : le fragment d\'URL replie les accents', 'hygrometrie-70-ou-65', $r['json']['slug']);

$r = http('GET', $base . "/backend/forum.php?action=topic&id=$t_fr", ['jar' => $anon]);
eq('forum : sujet lisible par un visiteur', 200, $r['status']);
eq('forum : le sujet porte son premier message', 1, count($r['json']['posts']));
eq('forum : les etiquettes en double sont fusionnees', 2, count($r['json']['topic']['tags']));
check('forum : la liste Markdown est rendue',
      str_contains($r['json']['posts'][0]['html'], '<li>65 % pour les robustos</li>'));

// ── XSS : la lecon d'A3, verifiee dans les deux sens ─────
$recule();
$r = post_json($base, $alice, '/backend/forum.php?action=post_create', [
    'topic_id' => $t_fr,
    'body'     => 'Attention <script>alert(1)</script> et [piege](javascript:alert(1))',
]);
eq('forum : reponse publiee', 201, $r['status']);
check('forum : la balise script est echappee', str_contains($r['json']['html'], '&lt;script&gt;'));
check('forum : aucune balise script ne sort', !str_contains($r['json']['html'], '<script>'));
check('forum : un lien javascript: n\'est pas transforme en lien',
      !str_contains($r['json']['html'], '<a href="javascript'));

$brut = test_pdo()->query("SELECT body FROM forum_posts ORDER BY id DESC LIMIT 1")->fetchColumn();
check('forum : le message est stocke BRUT, jamais echappe en base',
      str_contains($brut, '<script>'));

// ── Le filtre de langue ──────────────────────────────────
$recule();
$r = post_json($base, $alice, '/backend/forum.php?action=topic_create', [
    'section' => 'conservation',
    'title'   => 'Humidor seasoning for beginners',
    'body'    => 'How long should I season a new humidor before filling it?',
    'lang'    => 'en',
]);
eq('forum : sujet en anglais cree', 201, $r['status']);

$r = http('GET', $base . '/backend/forum.php?action=topics&section=conservation&lang=fr', ['jar' => $anon]);
eq('forum : filtre sur une langue', 1, count($r['json']['topics']));
eq('forum : c\'est bien le sujet francais', 'fr', $r['json']['topics'][0]['lang']);

$r = http('GET', $base . '/backend/forum.php?action=topics&section=conservation&lang=fr,en', ['jar' => $anon]);
eq('forum : filtre sur deux langues', 2, count($r['json']['topics']));

$r = http('GET', $base . '/backend/forum.php?action=topics&section=conservation&lang=all', ['jar' => $anon]);
eq('forum : « all » ne filtre pas', 2, count($r['json']['topics']));

// Le compte affiche en tete de rubrique suit le MEME filtre que la
// liste. Sans cela, une rubrique annoncait « 2 sujets » a un lecteur
// anglophone qui, une fois entre, n'en trouvait qu'un.
$compteur = function (array $sections, string $slug): int {
    foreach ($sections as $s) if ($s['slug'] === $slug) return (int)$s['topics'];
    return -1;
};
$r = http('GET', $base . '/backend/forum.php?action=sections&lang=fr', ['jar' => $anon]);
eq('forum : le compte de la rubrique suit le filtre', 1, $compteur($r['json']['sections'], 'conservation'));
$r = http('GET', $base . '/backend/forum.php?action=sections&lang=fr,en', ['jar' => $anon]);
eq('forum : deux langues, deux sujets comptes', 2, $compteur($r['json']['sections'], 'conservation'));
$r = http('GET', $base . '/backend/forum.php?action=sections', ['jar' => $anon]);
eq('forum : sans filtre, tout est compte', 2, $compteur($r['json']['sections'], 'conservation'));

// ── Activite recente ─────────────────────────────────────
// Elle voyage dans la MEME reponse que les rubriques : c'est le premier
// ecran de l'espace, et deux requetes pour un ecran se paient chez un
// hebergeur mutualise qui n'en traite qu'une a la fois.
check('forum : l\'activite recente accompagne les rubriques',
      isset($r['json']['recent']) && is_array($r['json']['recent']));
check('forum : elle est bornee', count($r['json']['recent']) <= 5);

// Le sujet le plus recemment actif vient en tete. Le sujet francais a
// recu la derniere reponse : c'est lui qu'on doit lire en premier.
//
// Les deux sujets ont ete crees dans la MEME SECONDE, et l'assertion
// dependait donc d'une egalite que la base tranchait comme elle
// voulait — elle passait par chance. On ecarte explicitement le sujet
// anglais d'une minute : « le plus recent » a alors un sens.
test_pdo()->exec("UPDATE forum_topics SET last_post_at = DATE_SUB(last_post_at, INTERVAL 1 MINUTE)
                  WHERE lang = 'en'");
$r = http('GET', $base . '/backend/forum.php?action=sections', ['jar' => $anon]);
$dernier = $r['json']['recent'][0] ?? [];
eq('forum : le plus recent est en tete', $t_fr, (int)($dernier['id'] ?? 0));

// MEME filtre de langue que le reste : une activite qu'on ne peut pas
// lire n'est pas une activite.
$r = http('GET', $base . '/backend/forum.php?action=sections&lang=en', ['jar' => $anon]);
$langs = array_column($r['json']['recent'], 'lang');
eq('forum : l\'activite recente suit le filtre de langue', ['en'], array_values(array_unique($langs)));

// CONTRE-EPREUVE : sans filtre, le sujet francais y est de nouveau.
$r = http('GET', $base . '/backend/forum.php?action=sections&lang=all', ['jar' => $anon]);
check('forum : « toutes les langues » les ramene',
      in_array('fr', array_column($r['json']['recent'], 'lang'), true));

// Une langue inconnue est ignoree en silence : un parametre bricole ne
// doit ni faire echouer la page, ni servir de levier d'injection.
$r = http('GET', $base . '/backend/forum.php?action=topics&section=conservation&lang=klingon', ['jar' => $anon]);
eq('forum : langue inconnue ignoree, rien ne casse', 200, $r['status']);
$r = http('GET', $base . "/backend/forum.php?action=topics&lang=fr'+OR+1=1--", ['jar' => $anon]);
eq('forum : une injection dans le filtre ne rend pas tout', 200, $r['status']);

// ── Etiquettes ───────────────────────────────────────────
$r = http('GET', $base . '/backend/forum.php?action=topics&tag=hygrometrie', ['jar' => $anon]);
eq('forum : recherche par etiquette', 1, count($r['json']['topics']));

$r = http('GET', $base . '/backend/forum.php?action=tags', ['jar' => $anon]);
eq('forum : une etiquette vue une seule fois n\'est pas proposee', 0, count($r['json']['tags']));

// ── Plafonds ─────────────────────────────────────────────
// Delai entre deux messages : ici on NE recule PAS, c'est le point.
$r = post_json($base, $alice, '/backend/forum.php?action=post_create',
               ['topic_id' => $t_fr, 'body' => 'Une reponse immediate.']);
eq('forum : deux messages coup sur coup refuses', 429, $r['status']);
eq('forum : le refus porte un code stable', 'forum_trop_vite', $r['json']['code']);

$recule();
$r = post_json($base, $alice, '/backend/forum.php?action=post_create',
               ['topic_id' => $t_fr, 'body' => 'Voir https://exemple.fr pour la methode.']);
eq('forum : pas de lien externe pour un compte neuf', 429, $r['status']);
eq('forum : code du blocage des liens', 'forum_liens_bloques', $r['json']['code']);

// Contre-epreuve : le meme message passe pour un contributeur de confiance.
test_pdo()->exec("UPDATE users SET role = 'trusted' WHERE email = 'alice@test.local'");
$r = post_json($base, $alice, '/backend/forum.php?action=post_create',
               ['topic_id' => $t_fr, 'body' => 'Voir https://exemple.fr pour la methode.']);
eq('forum : le contributeur de confiance peut poser un lien', 201, $r['status']);
test_pdo()->exec("UPDATE users SET role = 'member' WHERE email = 'alice@test.local'");

// ── Signalements : le seuil masque sans attendre ─────────
// Le message vise est celui de BOB : on ne signale pas le sien, et il
// faut donc trois comptes distincts en plus de l'auteur.
$r = post_json($base, $bob, '/backend/forum.php?action=post_create',
               ['topic_id' => $t_fr, 'body' => 'Achetez des cigares pas chers chez moi.']);
eq('forum : message a signaler publie', 201, $r['status']);
$cible = (int)$r['json']['id'];

// Deux comptes de plus. Le plafond d'inscriptions par IP est vide entre
// chacun : toutes ces requetes viennent de 127.0.0.1, et sans cela la
// deuxieme inscription repartait en « rate_limited » — puis la section
// « Codes d'erreur », plus loin, echouait a son tour sans rapport
// apparent avec le forum.
foreach (['carol' => 'Carol', 'dave' => 'Dave'] as $nom => $affiche) {
    test_pdo()->exec("DELETE FROM auth_attempts");
    ${$nom} = new_client($nom);
    $r = post_json($base, ${$nom}, '/backend/auth.php?action=register',
                   ['email' => "$nom@test.local", 'password' => 'motdepasse8', 'display_name' => $affiche]);
    eq("forum : compte $affiche cree pour les signalements", 201, $r['status']);
    force_verified("$nom@test.local");
}
test_pdo()->exec("DELETE FROM auth_attempts");

$r = post_json($base, $bob, '/backend/forum.php?action=flag', ['post_id' => $cible]);
eq('forum : on ne signale pas son propre message', 400, $r['status']);

$r = post_json($base, $alice, '/backend/forum.php?action=flag', ['post_id' => $cible, 'reason' => 'ad']);
eq('forum : premier signalement', 1, $r['json']['flags']);
eq('forum : un signalement ne masque pas', false, $r['json']['hidden']);
$r = post_json($base, $alice, '/backend/forum.php?action=flag', ['post_id' => $cible]);
eq('forum : pas de doublon pour un meme membre', 1, $r['json']['flags']);

$r = post_json($base, $carol, '/backend/forum.php?action=flag', ['post_id' => $cible]);
eq('forum : deuxieme signalement', 2, $r['json']['flags']);
$r = post_json($base, $dave, '/backend/forum.php?action=flag', ['post_id' => $cible]);
eq('forum : troisieme signalement, masquage automatique', true, $r['json']['hidden']);

$r = http('GET', $base . "/backend/forum.php?action=topic&id=$t_fr", ['jar' => $anon]);
$masque = null;
foreach ($r['json']['posts'] as $p) if ((int)$p['id'] === $cible) $masque = $p;
check('forum : le message masque reste dans le fil', $masque !== null);
eq('forum : mais son contenu n\'est plus servi', '', $masque['html']);

// ── Moderation ───────────────────────────────────────────
$r = http('GET', $base . '/backend/forum.php?action=mod_queue', ['jar' => $bob]);
eq('forum : la file de moderation n\'est pas publique', 403, $r['status']);

$r = http('GET', $base . '/backend/forum.php?action=mod_queue',
          ['jar' => $anon, 'headers' => ['X-Admin-Key: test-admin-key']]);
eq('forum : file de moderation accessible a l\'administration', 200, $r['status']);
eq('forum : le message signale y figure', 1, count($r['json']['queue']));
eq('forum : avec ses trois signalements', 3, $r['json']['queue'][0]['flags']);

$r = post_json($base, $anon, '/backend/forum.php?action=moderate',
               ['post_id' => $cible, 'decision' => 'publier'],
               ['X-Admin-Key: test-admin-key']);
eq('forum : decision de publication', 200, $r['status']);
$r = http('GET', $base . "/backend/forum.php?action=topic&id=$t_fr", ['jar' => $anon]);
foreach ($r['json']['posts'] as $p) if ((int)$p['id'] === $cible) $masque = $p;
check('forum : le message retabli redevient lisible', $masque['html'] !== '');

// ── Verrouillage ─────────────────────────────────────────
post_json($base, $anon, '/backend/forum.php?action=topic_state',
          ['topic_id' => $t_fr, 'lock' => true], ['X-Admin-Key: test-admin-key']);
$recule();
$r = post_json($base, $alice, '/backend/forum.php?action=post_create',
               ['topic_id' => $t_fr, 'body' => 'Encore un mot.']);
eq('forum : on ne repond pas dans un sujet ferme', 403, $r['status']);
post_json($base, $anon, '/backend/forum.php?action=topic_state',
          ['topic_id' => $t_fr, 'lock' => false], ['X-Admin-Key: test-admin-key']);

// ── Edition ──────────────────────────────────────────────
$r = http('GET', $base . "/backend/forum.php?action=topic&id=$t_fr", ['jar' => $alice]);
$mien = (int)$r['json']['posts'][0]['id'];
check('forum : l\'auteur recoit le texte source de son message', $r['json']['posts'][0]['raw'] !== null);

$r = post_json($base, $bob, '/backend/forum.php?action=post_edit',
               ['id' => $mien, 'body' => 'Detourne.']);
eq('forum : on ne modifie pas le message d\'un autre', 403, $r['status']);

$r = post_json($base, $alice, '/backend/forum.php?action=post_edit',
               ['id' => $mien, 'body' => 'Je cherche le **bon** reglage.']);
eq('forum : l\'auteur modifie son message', 200, $r['status']);

test_pdo()->exec("UPDATE forum_posts SET created_at = DATE_SUB(NOW(), INTERVAL 2 HOUR) WHERE id = $mien");
$r = post_json($base, $alice, '/backend/forum.php?action=post_edit',
               ['id' => $mien, 'body' => 'Trop tard.']);
eq('forum : passe le delai, le message est fige', 403, $r['status']);

// ── Suppression : une pierre tombale, pas un trou ───────
$r = post_json($base, $alice, '/backend/forum.php?action=post_delete', ['id' => $mien]);
eq('forum : retrait par l\'auteur', 200, $r['status']);
eq('forum : la ligne demeure en base',
   1, (int)test_pdo()->query("SELECT COUNT(*) FROM forum_posts WHERE id = $mien AND status = 'removed'")->fetchColumn());


// ── Rendez-vous (V2) ─────────────────────────────────────
$r = http('GET', $base . '/backend/forum.php?action=agenda', ['jar' => $anon]);
eq('forum : l\'agenda est public', 200, $r['status']);
eq('forum : agenda vide au depart', 0, count($r['json']['events']));

// Organiser demande le statut de confiance : c'est la seule action du
// forum ainsi reservee, et un rendez-vous physique annonce par un compte
// de trois minutes est le principal vecteur d'abus d'un tel espace.
$evt = [
    'title' => 'Degustation de rentree a Geneve',
    'body'  => 'On se retrouve pour une serie de robustos nicaraguayens.',
    'starts_local' => '2027-01-15T19:30',
    'timezone' => 'Europe/Paris',
    'kind' => 'degustation',
    'place_label' => 'Cave du Rhone, Geneve',
];
$r = post_json($base, $alice, '/backend/forum.php?action=event_create', $evt);
eq('forum : un simple membre n\'organise pas', 403, $r['status']);
eq('forum : le refus porte un code stable', 'evt_confiance_requise', $r['json']['code']);

test_pdo()->exec("UPDATE users SET role = 'trusted' WHERE email = 'alice@test.local'");

$r = post_json($base, $alice, '/backend/forum.php?action=event_create', $evt);
eq('forum : le contributeur de confiance organise', 201, $r['status']);
$e_id = (int)$r['json']['id'];

// L'HEURE EST STOCKEE EN UTC. Paris est a UTC+1 en janvier : 19 h 30
// locales font 18 h 30 UTC. C'est la conversion qui permet de trier
// deux rendez-vous sur deux continents et d'envoyer un rappel a l'heure.
$utc = test_pdo()->query("SELECT starts_at FROM forum_events WHERE topic_id = $e_id")->fetchColumn();
eq('forum : l\'heure est convertie en UTC (Paris, hiver)', '2027-01-15 18:30:00', $utc);

// CONTRE-EPREUVE, dans le meme fuseau : en juillet Paris passe a UTC+2,
// et 19 h 30 locales font 17 h 30 UTC. Un decalage fixe en dur donnerait
// la meme reponse aux deux dates — et se tromperait d'une heure la
// moitie de l'annee.
$r = post_json($base, $alice, '/backend/forum.php?action=event_create',
    array_merge($evt, ['title' => 'Soiree d\'ete au bord du lac', 'starts_local' => '2027-07-15T19:30']));
eq('forum : deuxieme rendez-vous cree', 201, $r['status']);
$e_ete = (int)$r['json']['id'];
$utc2 = test_pdo()->query("SELECT starts_at FROM forum_events WHERE topic_id = $e_ete")->fetchColumn();
eq('forum : le meme fuseau, l\'autre saison (Paris, ete)', '2027-07-15 17:30:00', $utc2);

// Garde-fous de saisie
$r = post_json($base, $alice, '/backend/forum.php?action=event_create',
    array_merge($evt, ['starts_local' => '2020-01-01T19:30']));
eq('forum : une date passee est refusee', 'evt_passe', $r['json']['code']);

$r = post_json($base, $alice, '/backend/forum.php?action=event_create',
    array_merge($evt, ['starts_local' => '2035-01-01T19:30']));
eq('forum : au-dela de douze mois, refus', 'evt_trop_loin', $r['json']['code']);

$r = post_json($base, $alice, '/backend/forum.php?action=event_create',
    array_merge($evt, ['timezone' => 'Mars/Olympus_Mons']));
eq('forum : fuseau inconnu refuse', 'evt_fuseau', $r['json']['code']);

$r = post_json($base, $alice, '/backend/forum.php?action=event_create',
    array_merge($evt, ['place_label' => '']));
eq('forum : un rendez-vous sans lieu n\'en est pas un', 'evt_lieu_requis', $r['json']['code']);

// L'organisateur vient, par construction : un agenda qui annonce
// « 0 inscrit » a un rendez-vous qui a un hote serait absurde.
$r = http('GET', $base . "/backend/forum.php?action=topic&id=$e_id", ['jar' => $anon]);
check('forum : le fil porte la fiche du rendez-vous', !empty($r['json']['event']));
eq('forum : l\'organisateur est compte present', 1, $r['json']['event']['attendance']['going']);
eq('forum : le fuseau du lieu accompagne l\'instant', 'Europe/Paris', $r['json']['event']['timezone']);

// ── Participation et liste d'attente ─────────────────────
test_pdo()->exec("UPDATE forum_events SET capacity = 1 WHERE topic_id = $e_id");

$r = post_json($base, $bob, '/backend/forum.php?action=attend', ['topic_id' => $e_id, 'state' => 'going']);
eq('forum : inscription enregistree', 200, $r['status']);
eq('forum : deux presents', 2, $r['json']['attendance']['going']);
// Une place, deux inscrits : le second patiente — et on lui dit son
// RANG. « Complet » sans plus laisse croire qu'il n'y a rien a esperer.
eq('forum : le second est sur liste d\'attente', true, $r['json']['attendance']['waiting']);
eq('forum : et connait son rang', 1, $r['json']['attendance']['waiting_pos']);

$r = post_json($base, $carol, '/backend/forum.php?action=attend', ['topic_id' => $e_id, 'state' => 'interested']);
eq('forum : « interesse » ne prend pas de place', 2, $r['json']['attendance']['going']);
eq('forum : mais se compte a part', 1, $r['json']['attendance']['interested']);

$r = post_json($base, $bob, '/backend/forum.php?action=attend', ['topic_id' => $e_id, 'state' => 'cancelled']);
eq('forum : un desistement libere la place', 1, $r['json']['attendance']['going']);

// ── Annulation ───────────────────────────────────────────
post_json($base, $bob, '/backend/forum.php?action=attend', ['topic_id' => $e_ete, 'state' => 'going']);
$avant = is_file(PROJECT_ROOT . '/backend/cache/mail_outbox.log')
       ? filesize(PROJECT_ROOT . '/backend/cache/mail_outbox.log') : 0;

$r = post_json($base, $carol, '/backend/forum.php?action=event_cancel',
               ['topic_id' => $e_ete, 'reason' => 'Salle indisponible']);
eq('forum : on n\'annule pas le rendez-vous d\'un autre', 403, $r['status']);

$r = post_json($base, $alice, '/backend/forum.php?action=event_cancel',
               ['topic_id' => $e_ete, 'reason' => 'Salle indisponible']);
eq('forum : l\'organisateur annule', 200, $r['status']);
// Les inscrits sont prevenus : ils ont bloque une soiree, et cette
// information-la ne se devine pas.
check('forum : les inscrits sont prevenus par email', (int)$r['json']['notified'] >= 1);

$journal = (string)@file_get_contents(PROJECT_ROOT . '/backend/cache/mail_outbox.log', false, null, $avant);
check('forum : l\'email d\'annulation porte le motif', str_contains($journal, 'Salle indisponible'));

$r = post_json($base, $bob, '/backend/forum.php?action=attend', ['topic_id' => $e_ete, 'state' => 'going']);
eq('forum : on ne s\'inscrit plus a un rendez-vous annule', 403, $r['status']);
eq('forum : code du rendez-vous fige', 'evt_fige', $r['json']['code']);

$r = http('GET', $base . '/backend/forum.php?action=agenda', ['jar' => $anon]);
eq('forum : l\'annule quitte l\'agenda a venir', 1, count($r['json']['events']));
$r = http('GET', $base . '/backend/forum.php?action=agenda&passes=1', ['jar' => $anon]);
eq('forum : mais reste dans les archives', 1, count($r['json']['events']));

// ── Peremption automatique ───────────────────────────────
// Un statut qui depend d'une horloge doit se rattraper tout seul :
// sinon un cron oublie laisse un agenda plein de rendez-vous
// d'avant-hier annonces comme « a venir ».
test_pdo()->exec("UPDATE forum_events SET starts_at = DATE_SUB(UTC_TIMESTAMP(), INTERVAL 3 DAY),
                                          ends_at = NULL, status = 'upcoming' WHERE topic_id = $e_id");
$r = http('GET', $base . '/backend/forum.php?action=agenda', ['jar' => $anon]);
eq('forum : un rendez-vous depasse quitte l\'agenda sans tache planifiee', 0, count($r['json']['events']));
eq('forum : et passe en archive',
   'past', test_pdo()->query("SELECT status FROM forum_events WHERE topic_id = $e_id")->fetchColumn());

test_pdo()->exec("UPDATE users SET role = 'member' WHERE email = 'alice@test.local'");


// ── Images dans les messages ─────────────────────────────
// La chaine RECONSTRUIT chaque image au lieu de la copier
// (backend/image_lib.php). Ces verifications portent sur ce que cette
// reconstruction garantit, pas sur le fait qu'un fichier soit arrive.
$tmpimg = function (int $w, int $h, string $fmt = 'png'): string {
    $f  = sys_get_temp_dir() . '/cg_' . uniqid('', true) . '.' . $fmt;
    $im = imagecreatetruecolor($w, $h);
    imagefilledrectangle($im, 0, 0, $w, $h, imagecolorallocate($im, 180, 40, 40));
    $fmt === 'png' ? imagepng($im, $f) : imagejpeg($im, $f);
    imagedestroy($im);
    return $f;
};
$envoyer = function (string $jar, string $chemin, string $type = 'image/png') use ($base) {
    return http('POST', $base . '/backend/forum.php?action=post_image', [
        'jar' => $jar,
        'multipart' => ['image' => ['file' => $chemin, 'type' => $type, 'name' => basename($chemin)]],
        'headers' => ['X-CSRF-Token: ' . csrf($base, $jar)],
    ]);
};

$grande = $tmpimg(2400, 1000);
$r = $envoyer($alice, $grande);
eq('images : televersement accepte', 201, $r['status']);
$img1 = (int)($r['json']['image']['id'] ?? 0);
check('images : un identifiant est rendu', $img1 > 0);
// Bornee a 1600 px sur le cote le plus long : l'image est REECRITE, pas
// seulement affichee plus petite.
eq('images : la dimension est bornee a la reecriture', 1600, (int)$r['json']['image']['w']);

// ── Ce qui ne doit PAS entrer ────────────────────────────
$faux = sys_get_temp_dir() . '/cg_faux.jpg';
file_put_contents($faux, '<' . '?php echo "charge utile"; ?' . '>');
$r = $envoyer($alice, $faux, 'image/jpeg');
eq('images : un fichier PHP renomme .jpg est refuse', 400, $r['status']);
check('images : le refus porte un code stable',
      in_array($r['json']['code'] ?? '', ['file_type', 'image_indechiffrable'], true));

// CONTRE-EPREUVE, et c'est la plus importante : un POLYGLOTTE, vraie
// image suivie de code. Il passe la detection de type — c'est bien un
// JPEG — et doit donc etre accepte, mais RECONSTRUIT : la charge utile
// ne survit pas.
$poly = $tmpimg(80, 60, 'jpg');
file_put_contents($poly, '<' . '?php echo "charge utile"; ?' . '>', FILE_APPEND);
check('images : le polyglotte porte bien sa charge avant envoi',
      str_contains((string)file_get_contents($poly), 'charge utile'));
$r = $envoyer($alice, $poly, 'image/jpeg');
eq('images : le polyglotte est accepte comme image', 201, $r['status']);
$fichier = PROJECT_ROOT . ($r['json']['image']['url'] ?? '');
check('images : et la charge utile a disparu du fichier stocke',
      is_file($fichier) && !str_contains((string)file_get_contents($fichier), 'charge utile'));

// Les EXIF partent avec le reste : un telephone ecrit la position GPS
// dans chaque photo, et personne ne devrait publier son adresse en
// montrant sa cave.
$exif = $tmpimg(200, 150, 'jpg');
$brut = file_get_contents($exif);
$charge = "Exif\0\0" . str_repeat('GPS-48.8566,2.3522;', 8);
file_put_contents($exif, substr($brut, 0, 2)
    . "\xFF\xE1" . pack('n', strlen($charge) + 2) . $charge . substr($brut, 2));
check('images : les coordonnees GPS sont bien dans le fichier envoye',
      str_contains((string)file_get_contents($exif), '48.8566'));
$r = $envoyer($alice, $exif, 'image/jpeg');
$fichier = PROJECT_ROOT . ($r['json']['image']['url'] ?? '');
check('images : elles ne sont plus dans le fichier stocke',
      is_file($fichier) && !str_contains((string)file_get_contents($fichier), '48.8566'));

// ── Rattachement a un message ────────────────────────────
$i2 = (int)($envoyer($alice, $tmpimg(300, 300))['json']['image']['id'] ?? 0);
$i3 = (int)($envoyer($alice, $tmpimg(300, 300))['json']['image']['id'] ?? 0);
$i4 = (int)($envoyer($alice, $tmpimg(300, 300))['json']['image']['id'] ?? 0);

$recule();
$r = post_json($base, $alice, '/backend/forum.php?action=post_create',
               ['topic_id' => $t_fr, 'body' => 'Voici trois photos de la cave.',
                'images' => [$img1, $i2, $i3, $i4]]);
eq('images : message avec pieces jointes publie', 201, $r['status']);
$msg_img = (int)$r['json']['id'];
eq('images : trois au plus par message', 3,
   (int)test_pdo()->query("SELECT COUNT(*) FROM forum_post_images WHERE post_id = $msg_img")->fetchColumn());

$r = http('GET', $base . "/backend/forum.php?action=topic&id=$t_fr", ['jar' => $anon]);
$porteur = null;
foreach ($r['json']['posts'] as $p) if ((int)$p['id'] === $msg_img) $porteur = $p;
eq('images : servies avec le message', 3, count($porteur['images']));
check('images : chacune a sa vignette',
      !empty($porteur['images'][0]['thumb']) && $porteur['images'][0]['thumb'] !== $porteur['images'][0]['url']);

// On ne s'approprie pas la photo d'un autre en devinant son identifiant.
$i5 = (int)($envoyer($alice, $tmpimg(120, 120))['json']['image']['id'] ?? 0);
$r = post_json($base, $bob, '/backend/forum.php?action=post_create',
               ['topic_id' => $t_fr, 'body' => 'Je prends la photo du voisin.', 'images' => [$i5]]);
eq('images : message de Bob publie', 201, $r['status']);
eq('images : mais l\'image d\'Alice ne le suit pas', 0,
   (int)test_pdo()->query("SELECT COUNT(*) FROM forum_post_images WHERE post_id = " . (int)$r['json']['id'])->fetchColumn());

// ── Le seuil de signalement tombe a 2 ────────────────────
// Un paragraphe deplace se lit et s'oublie ; une image choquante fait
// ses degats en cinq secondes. Deux signalements suffisent donc.
$r = post_json($base, $carol, '/backend/forum.php?action=flag', ['post_id' => $msg_img]);
eq('images : premier signalement, pas de masquage', false, $r['json']['hidden']);
$r = post_json($base, $dave, '/backend/forum.php?action=flag', ['post_id' => $msg_img]);
eq('images : deux signalements suffisent pour un message illustre', true, $r['json']['hidden']);

$r = http('GET', $base . "/backend/forum.php?action=topic&id=$t_fr", ['jar' => $anon]);
foreach ($r['json']['posts'] as $p) if ((int)$p['id'] === $msg_img) $porteur = $p;
eq('images : le message masque ne sert plus ses images', 0, count($porteur['images']));

// ── Purge des orphelines ─────────────────────────────────
// Televerser sans jamais publier ne doit pas laisser de fichiers.
$orph = (int)($envoyer($alice, $tmpimg(90, 90))['json']['image']['id'] ?? 0);
test_pdo()->exec("UPDATE forum_post_images SET created_at = DATE_SUB(NOW(), INTERVAL 30 HOUR) WHERE id = $orph");
$envoyer($alice, $tmpimg(90, 90));      // le televersement suivant ramasse
eq('images : une image jamais publiee est effacee au bout de 24 h', 0,
   (int)test_pdo()->query("SELECT COUNT(*) FROM forum_post_images WHERE id = $orph")->fetchColumn());

$r = post_json($base, $anon, '/backend/forum.php?action=post_image', []);
eq('images : televerser exige un compte', 401, $r['status']);


// ── Compression : la qualite est CHOISIE, pas fixee ──────
// Deux proprietes, et la seconde est la garantie autour de laquelle
// l'algorithme est construit.
require_once PROJECT_ROOT . '/backend/image_lib.php';

if (extension_loaded('gd')) {
    // 1. Une image DOUCE (aplats, degrade) : la qualite descend, le
    //    poids avec, et la perte reste sous le seuil.
    // 1600 px de large, comme une photo reelle apres bornage : c'est a
    // cette taille que le choix se joue. A 800 px, la meme image tombe
    // pile sur le seuil et l'algorithme garde la reference — ce serait
    // un test au bord de la falaise, qui basculerait au moindre reglage.
    $douce = imagecreatetruecolor(1600, 1200);
    for ($y = 0; $y < 1200; $y++) {
        imageline($douce, 0, $y, 1600, $y,
                  imagecolorallocate($douce, 30 + (int)(80 * $y / 1200), 20, 15));
    }
    imagefilledellipse($douce, 640, 600, 800, 480, imagecolorallocate($douce, 201, 162, 39));

    ob_start(); imagejpeg($douce, null, 86); $ref = ob_get_clean();
    [$q, $bin, $psnr] = image_qualite_adaptative($douce, IMG_PSNR_IMAGE);

    check('compression : une image douce descend sous la qualite de reference',
          $q < IMG_QUALITE_REF, "qualite retenue : $q");
    check('compression : et pese moins lourd',
          strlen($bin) < strlen($ref),
          sprintf('%d o contre %d o', strlen($bin), strlen($ref)));
    check('compression : la perte reste sous le seuil vise',
          $psnr >= IMG_PSNR_IMAGE, sprintf('PSNR %.1f dB', $psnr));
    imagedestroy($douce);

    // 2. Une image BRUITEE : le PSNR y plafonne tres bas quelle que soit
    //    la qualite — l'oeil pardonne le grain, la mesure non. Une
    //    recherche naive conclurait « il faut monter » et rendrait un
    //    fichier PLUS LOURD qu'avant. Releve avant correction :
    //    630 ko a q=86 contre 818 ko a q=92, soit +30 %.
    mt_srand(11);
    $bruit = imagecreatetruecolor(500, 400);
    for ($y = 0; $y < 400; $y++) for ($x = 0; $x < 500; $x++) {
        $b = max(0, min(255, 120 + mt_rand(-70, 70)));
        imagesetpixel($bruit, $x, $y, imagecolorallocate($bruit, $b, $b, $b));
    }
    ob_start(); imagejpeg($bruit, null, 86); $refB = ob_get_clean();
    [$qB, $binB, $psnrB] = image_qualite_adaptative($bruit, IMG_PSNR_IMAGE);

    check('compression : sur une image bruitee, la cible est hors d\'atteinte',
          $psnrB < IMG_PSNR_IMAGE, sprintf('PSNR %.1f dB', $psnrB));
    eq('compression : on garde alors la qualite de reference', IMG_QUALITE_REF, $qB);
    check('compression : et le fichier n\'est JAMAIS plus lourd qu\'avant',
          strlen($binB) <= strlen($refB),
          sprintf('%d o contre %d o', strlen($binB), strlen($refB)));
    imagedestroy($bruit);
} else {
    check('compression : GD absent, verifications ignorees', true);
}

$r = http('GET', $base . '/backend/forum.php?action=inconnue', ['jar' => $anon]);
eq('forum : action inconnue refusee', 404, $r['status']);

// ════════════════════════════════════════════════════════
section('Acces d\'administration');

$r = http('GET', $base . '/backend/api.php?action=export&admin_key=test-admin-key', ['jar' => $anon]);
eq('cle d\'administration refusee depuis l\'URL', 403, $r['status']);

$r = http('GET', $base . '/backend/api.php?action=export',
          ['jar' => $anon, 'headers' => ['X-Admin-Key: test-admin-key']]);
eq('cle d\'administration acceptee par en-tete', 200, $r['status']);

$r = http('GET', $base . '/backend/admin.php?tab=reviews', ['jar' => $anon]);
check('administration : page de connexion pour un visiteur', str_contains($r['body'], "Clé d'administration"));

// L'onglet Communaute reprend la mecanique des avis : c'est
// forum_moderer() qui decide, ici comme dans forum.php.
$r = http('GET', $base . '/backend/admin.php?tab=forum', ['jar' => $admin]);
eq('administration : onglet Communaute servi', 200, $r['status']);
check('administration : le sujet du forum y figure',
      str_contains($r['body'], 'Hygrometrie'));
check('administration : le message signale y figure aussi',
      str_contains($r['body'], 'Achetez des cigares'));

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

/**
 * Valeur d'un en-tete de reponse, '' si absent.
 *
 * Les occurrences multiples sont jointes par une virgule, comme le veut
 * HTTP : « Vary: Origin » suivi de « Vary: Accept-Encoding » equivaut a
 * « Vary: Origin, Accept-Encoding ». Ne retenir que la derniere faisait
 * echouer un controle pourtant satisfait.
 */
function entete(string $brut, string $nom): string {
    $vals = [];
    foreach (explode("\n", $brut) as $l) {
        if (stripos($l, $nom . ':') === 0) $vals[] = trim(substr($l, strlen($nom) + 1));
    }
    return implode(', ', $vals);
}

// Le serveur principal tourne en ALLOWED_ORIGIN=* (developpement).
$r = http('GET', $base . '/backend/data.php?action=globe',
          ['jar' => $anon, 'headers' => ['Origin: https://exemple-tiers.test']]);
eq('developpement : toute origine est acceptee', '*', entete($r['headers'], 'Access-Control-Allow-Origin'));

// Second serveur, CORS restreint : c'est la configuration de production.
$PERMIS  = 'https://thecigarodyssey.com,https://www.thecigarodyssey.com';
$restr   = start_server(['ALLOWED_ORIGIN' => $PERMIS]);

$r = http('GET', $restr . '/backend/data.php?action=globe',
          ['jar' => $anon, 'headers' => ['Origin: https://thecigarodyssey.com']]);
eq('production : le domaine declare est autorise',
   'https://thecigarodyssey.com', entete($r['headers'], 'Access-Control-Allow-Origin'));
check('production : la reponse varie selon l\'origine',
      stripos(entete($r['headers'], 'Vary'), 'origin') !== false);

$r = http('GET', $restr . '/backend/data.php?action=globe',
          ['jar' => $anon, 'headers' => ['Origin: https://www.thecigarodyssey.com']]);
eq('production : le sous-domaine www est autorise separement',
   'https://www.thecigarodyssey.com', entete($r['headers'], 'Access-Control-Allow-Origin'));

$r = http('GET', $restr . '/backend/data.php?action=globe',
          ['jar' => $anon, 'headers' => ['Origin: https://thecigarodyssey.com.attaquant.test']]);
eq('production : une origine qui prefixe le domaine est refusee',
   '', entete($r['headers'], 'Access-Control-Allow-Origin'));

$r = http('GET', $restr . '/backend/data.php?action=globe',
          ['jar' => $anon, 'headers' => ['Origin: http://thecigarodyssey.com']]);
eq('production : le meme domaine en clair est refuse',
   '', entete($r['headers'], 'Access-Control-Allow-Origin'));

$r = http('GET', $restr . '/backend/data.php?action=globe',
          ['jar' => $anon, 'headers' => ['Origin: https://exemple-tiers.test']]);
eq('production : une origine tierce repart sans autorisation',
   '', entete($r['headers'], 'Access-Control-Allow-Origin'));

// Requetes authentifiees : « * » et les cookies sont incompatibles.
$r = http('GET', $restr . '/backend/auth.php?action=me',
          ['jar' => $anon, 'headers' => ['Origin: https://thecigarodyssey.com']]);
eq('production : credentials autorises pour le domaine declare',
   'true', entete($r['headers'], 'Access-Control-Allow-Credentials'));
eq('production : jamais « * » avec des credentials',
   'https://thecigarodyssey.com', entete($r['headers'], 'Access-Control-Allow-Origin'));

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
section('Ancrage sur l\'atlas');

// Un sujet peut etre attache a un etablissement, une maison ou un pays.
// C'est ce qu'aucun forum generique ne peut faire : ce site a l'atlas.
//
// Ce bloc vient APRES les plafonds du forum, et non au milieu : il
// ouvre deux sujets de plus au nom d'Alice, ce qui la faisait passer le
// seuil des cinq messages — et le test « pas de lien externe pour un
// compte neuf » ne mesurait plus rien.
$vieillirF = function (): void {
    test_pdo()->exec("UPDATE forum_posts  SET created_at = DATE_SUB(created_at, INTERVAL 2 DAY)");
    test_pdo()->exec("UPDATE forum_topics SET created_at = DATE_SUB(created_at, INTERVAL 2 DAY)");
};
$vieillirF();
$r = post_json($base, $alice, '/backend/forum.php?action=topic_create', [
    'section'  => 'etablissements',
    'title'    => 'Une soiree au Lounge de test',
    'body'     => 'Quelqu\'un connait leur cave a cigares ? J\'y passe le mois prochain.',
    'lang'     => 'fr',
    'ref_type' => 'lounge',
    'ref_id'   => '1',
]);
eq('ancrage : sujet attache a un etablissement', 201, $r['status']);
$t_ancre = (int)$r['json']['id'];

$r = http('GET', $base . "/backend/forum.php?action=topic&id=$t_ancre", ['jar' => $anon]);
eq('ancrage : le sujet renvoie vers sa fiche', 'lounge', $r['json']['topic']['ref']['type'] ?? '');
// L'identifiant seul ne suffit pas : l'atlas ouvre un etablissement par
// le PAYS qui le contient, et le front n'a aucun moyen de le deviner.
eq('ancrage : le pays accompagne la reference', 'testland', $r['json']['topic']['ref']['country'] ?? '');
eq('ancrage : le libelle aussi', 'Lounge de test', $r['json']['topic']['ref']['label'] ?? '');

$r = http('GET', $base . '/backend/forum.php?action=topics&ref_type=lounge&ref_id=1&lang=all', ['jar' => $anon]);
eq('ancrage : la fiche retrouve ses discussions', 1, count($r['json']['topics']));
eq('ancrage : et c\'est le bon sujet', $t_ancre, (int)$r['json']['topics'][0]['id']);

// ── Le compte sur le bouton « En discuter » ──────────────
// Le bouton ne disait pas ce qu'il y avait derriere : on cliquait pour
// decouvrir le vide, ou pour rater une conversation en cours.
$r = http('GET', $base . '/backend/forum.php?action=ref_counts&type=lounge&ids=1,999&lang=all',
          ['jar' => $anon]);
eq('compte : la fiche annonce sa discussion', 1, (int)($r['json']['counts']['1'] ?? 0));
// Les fiches sans discussion sont ABSENTES plutot que portees a zero :
// le front n'affiche rien dans ce cas.
check('compte : une fiche sans discussion n\'est pas listee',
      !array_key_exists('999', $r['json']['counts']));

// MEME filtre de langue que la liste qui s'ouvrira : annoncer « 2 »
// puis n'en montrer qu'une est pire que ne rien annoncer.
$r = http('GET', $base . '/backend/forum.php?action=ref_counts&type=lounge&ids=1&lang=en',
          ['jar' => $anon]);
check('compte : il suit le filtre de langue',
      !array_key_exists('1', $r['json']['counts']));

// Un type inconnu est refuse : la table lue depend de ce parametre.
$r = http('GET', $base . '/backend/forum.php?action=ref_counts&type=fantaisie&ids=1', ['jar' => $anon]);
eq('compte : un type de reference inconnu est refuse', 400, $r['status']);

// Un sujet retire ne se compte plus.
test_pdo()->exec("UPDATE forum_topics SET status = 'removed' WHERE id = $t_ancre");
$r = http('GET', $base . '/backend/forum.php?action=ref_counts&type=lounge&ids=1&lang=all', ['jar' => $anon]);
check('compte : un sujet retire ne se compte plus',
      !array_key_exists('1', $r['json']['counts']));
test_pdo()->exec("UPDATE forum_topics SET status = 'open' WHERE id = $t_ancre");

// CONTRE-EPREUVE : une autre reference ne rend pas ce sujet.
$r = http('GET', $base . '/backend/forum.php?action=topics&ref_type=lounge&ref_id=999&lang=all', ['jar' => $anon]);
eq('ancrage : une fiche sans discussion en rend zero', 0, count($r['json']['topics']));

// Une reference INVENTEE n'est pas gravee : on lit sur ce qui existe.
$vieillirF();
$r = post_json($base, $alice, '/backend/forum.php?action=topic_create', [
    'section'  => 'etablissements',
    'title'    => 'Un sujet a la reference fantaisiste',
    'body'     => 'La reference envoyee ne designe aucun etablissement connu.',
    'lang'     => 'fr',
    'ref_type' => 'lounge',
    'ref_id'   => '424242',
]);
eq('ancrage : le sujet passe quand meme', 201, $r['status']);
$r = http('GET', $base . '/backend/forum.php?action=topic&id=' . (int)$r['json']['id'], ['jar' => $anon]);
eq('ancrage : mais la reference inconnue est rejetee', null, $r['json']['topic']['ref']);

// ════════════════════════════════════════════════════════
section('Suivre un sujet');

// La table `forum_follows` et le point d'API existaient depuis le
// premier jour sans qu'aucun bouton ne les appelle : la table ne s\'est
// jamais remplie, et rien n'est jamais parti. On ecrivait, et on
// n'apprenait qu\'on avait recu une reponse qu\'en revenant verifier.

/** Le drapeau de notification d'un suiveur, ou \'absent'. */
$suiviEtat = function (int $tid, string $email) {
    $q = test_pdo()->prepare(
        'SELECT f.notified_at FROM forum_follows f
         JOIN users u ON u.id = f.user_id
         WHERE f.topic_id = ? AND u.email = ?'
    );
    $q->execute([$tid, $email]);
    $r = $q->fetch(PDO::FETCH_NUM);
    return $r === false ? 'absent' : ($r[0] === null ? 'arme' : 'prevenu');
};

$vieillirF();
$r = post_json($base, $alice, '/backend/forum.php?action=topic_create', [
    'section' => 'debutants',
    'title'   => 'Par quel module commencer ?',
    'body'    => 'Je debute et je ne sais pas quel format essayer en premier.',
    'lang'    => 'fr',
]);
eq('suivi : sujet ouvert', 201, $r['status']);
$t_suivi = (int)$r['json']['id'];

// On suit ce qu'on ouvre : personne ne pense a cocher « prevenez-moi »
// avant d'avoir pose sa question, et la reponse est la raison meme
// d'avoir ecrit.
eq('suivi : l\'auteur suit son sujet d\'office', 'arme', $suiviEtat($t_suivi, 'alice@test.local'));

// ── Une reponse previent le suiveur ──────────────────────
$vieillirF();
$r = post_json($base, $bob, '/backend/forum.php?action=post_create',
               ['topic_id' => $t_suivi, 'body' => 'Commence par un robusto, c\'est le format le plus indulgent.']);
eq('suivi : reponse publiee', 201, $r['status']);
eq('suivi : le suiveur est prevenu', 1, (int)($r['json']['notified'] ?? -1));
eq('suivi : et le drapeau est pose', 'prevenu', $suiviEtat($t_suivi, 'alice@test.local'));
// Repondre, c'est vouloir la suite.
eq('suivi : celui qui repond suit a son tour', 'arme', $suiviEtat($t_suivi, 'bob@test.local'));

$journal = (string)@file_get_contents($MAIL_LOG);
check('suivi : l\'email annonce une reponse',
      str_contains($journal, 'Nouvelle réponse : Par quel module commencer ?'));
check('suivi : il porte un extrait du message',
      str_contains($journal, 'robusto'));

// ── Le garde-fou contre l'avalanche ──────────────────────
// Un fil anime enverrait vingt courriels dans l'apres-midi, et le
// premier reflexe serait de tout couper — donc de ne plus revenir.
$vieillirF();
$r = post_json($base, $bob, '/backend/forum.php?action=post_create',
               ['topic_id' => $t_suivi, 'body' => 'Et evite les formats fins pour commencer.']);
eq('suivi : pas de second email avant d\'etre revenu lire', 0, (int)($r['json']['notified'] ?? -1));

// Ouvrir le sujet vaut « je suis revenu lire » : la notification se
// rearme. « Revenue lire » se constate, il n'y a pas a l\'estimer au
// temps ecoule.
$r = http('GET', $base . "/backend/forum.php?action=topic&id=$t_suivi", ['jar' => $alice]);
eq('suivi : le sujet annonce que je le suis', true, $r['json']['topic']['following']);
eq('suivi : la lecture rearme la notification', 'arme', $suiviEtat($t_suivi, 'alice@test.local'));

$vieillirF();
$r = post_json($base, $bob, '/backend/forum.php?action=post_create',
               ['topic_id' => $t_suivi, 'body' => 'Un dernier mot sur la conservation avant de te lancer.']);
eq('suivi : revenue lire, elle est de nouveau prevenue', 1, (int)($r['json']['notified'] ?? -1));

// ── Le reglage du profil ─────────────────────────────────
$r = post_json($base, $alice, '/backend/api.php?action=profile_update',
               ['display_name' => 'Alice', 'notify_forum' => false]);
eq('suivi : le reglage est enregistre', false, $r['json']['user']['notify_forum']);
http('GET', $base . "/backend/forum.php?action=topic&id=$t_suivi", ['jar' => $alice]);   // relu

$vieillirF();
$r = post_json($base, $bob, '/backend/forum.php?action=post_create',
               ['topic_id' => $t_suivi, 'body' => 'Message qui ne doit declencher aucun envoi.']);
eq('suivi : reglage coupe, aucun email', 0, (int)($r['json']['notified'] ?? -1));

// CONTRE-EPREUVE : rallume, et l'email repart.
post_json($base, $alice, '/backend/api.php?action=profile_update',
          ['display_name' => 'Alice', 'notify_forum' => true]);
$vieillirF();
$r = post_json($base, $bob, '/backend/forum.php?action=post_create',
               ['topic_id' => $t_suivi, 'body' => 'Message qui doit de nouveau declencher un envoi.']);
eq('suivi : rallume, l\'email repart', 1, (int)($r['json']['notified'] ?? -1));

// ── On n'annonce a personne son propre message ───────────
// Bob suit le sujet depuis sa premiere reponse : s'il etait compte, le
// chiffre serait 2.
$r = http('GET', $base . "/backend/forum.php?action=topic&id=$t_suivi", ['jar' => $alice]);
$vieillirF();
$r = post_json($base, $alice, '/backend/forum.php?action=post_create',
               ['topic_id' => $t_suivi, 'body' => 'Merci, je vais essayer le robusto en premier.']);
eq('suivi : l\'auteur du message n\'est jamais prevenu', 1, (int)($r['json']['notified'] ?? -1));

// ── Se retirer ───────────────────────────────────────────
$r = post_json($base, $alice, '/backend/forum.php?action=follow', ['topic_id' => $t_suivi]);
eq('suivi : on se retire d\'un clic', false, $r['json']['following']);
eq('suivi : la ligne disparait', 'absent', $suiviEtat($t_suivi, 'alice@test.local'));
$vieillirF();
$r = post_json($base, $bob, '/backend/forum.php?action=post_create',
               ['topic_id' => $t_suivi, 'body' => 'Plus personne ne suit ce fil du cote d\'Alice.']);
eq('suivi : retiree, elle ne recoit plus rien', 0, (int)($r['json']['notified'] ?? -1));

// ════════════════════════════════════════════════════════
section('Referencement des discussions');

// L'espace communautaire vit dans un calque JavaScript : les moteurs
// n'en voyaient RIEN, et le plan de site n'annoncait que six pages
// d'accueil. Or les discussions sont le seul contenu qui grandit sans
// qu'on l'ecrive.
$page = http('GET', $base . "/?sujet=$t_suivi", ['jar' => $anon]);
eq('seo : la page du sujet repond', 200, $page['status']);
check('seo : le titre du sujet est dans la balise title',
      str_contains($page['body'], '<title>Par quel module commencer ?'));
check('seo : la description reprend le premier message',
      str_contains($page['body'], 'quel format essayer en premier'));
check('seo : la canonique designe le sujet',
      (bool)preg_match('#<link rel="canonical" href="[^"]*\?sujet=' . $t_suivi . '"#', $page['body']));
// Une discussion est un ECRIT date, signe, qui ne change plus.
check('seo : le type Open Graph est « article »',
      str_contains($page['body'], '<meta property="og:type" content="article">'));
// Un sujet est ecrit dans UNE langue : lui declarer six hreflang
// annoncerait cinq traductions qui n'existent pas.
check('seo : aucun lien alternatif pour un sujet',
      !str_contains($page['body'], 'hreflang='));

// CONTRE-EPREUVE : la page d'accueil, elle, les porte tous.
$page = http('GET', $base . '/', ['jar' => $anon]);
check('seo : la page d\'accueil garde ses hreflang',
      str_contains($page['body'], 'hreflang="es"'));

// Un sujet retire ne doit pas laisser une page indexable derriere lui.
$page = http('GET', $base . '/?sujet=999999', ['jar' => $anon]);
check('seo : un sujet inconnu retombe sur la page generique',
      !str_contains($page['body'], '<meta property="og:type" content="article">'));

$plan = http('GET', $base . '/sitemap.php', ['jar' => $anon]);
check('seo : le plan de site annonce le sujet',
      str_contains($plan['body'], '?sujet=' . $t_suivi . '</loc>'));
check('seo : avec sa date de derniere reponse',
      (bool)preg_match('#<lastmod>\d{4}-\d{2}-\d{2}</lastmod>#', $plan['body']));

// ════════════════════════════════════════════════════════
section('Une seule recherche');

// Il y avait trois entrees : la loupe de l'en-tete, l'Explorer, et la
// communaute avec sa propre navigation. Le reste de l'index vit deja
// dans le navigateur ; seules les discussions manquaient.
$r = http('GET', $base . '/backend/forum.php?action=search&q=module&lang=all', ['jar' => $anon]);
eq('recherche : la requete aboutit', 200, $r['status']);
$titres = array_column($r['json']['topics'], 'title');
check('recherche : le sujet est trouve par son titre',
      in_array('Par quel module commencer ?', $titres, true));

// Une saisie d'un seul caractere ne balaie pas la table.
$r = http('GET', $base . '/backend/forum.php?action=search&q=a&lang=all', ['jar' => $anon]);
eq('recherche : une lettre seule ne cherche rien', 0, count($r['json']['topics']));

// Le filtre de langue vaut ici comme ailleurs : le sujet anglais
// « Humidor seasoning for beginners » n'a pas sa place dans une
// recherche limitee au francais.
$r = http('GET', $base . '/backend/forum.php?action=search&q=seasoning&lang=fr', ['jar' => $anon]);
eq('recherche : le filtre de langue ecarte le sujet anglais', 0, count($r['json']['topics']));
$r = http('GET', $base . '/backend/forum.php?action=search&q=seasoning&lang=all', ['jar' => $anon]);
eq('recherche : sans filtre, il revient', 1, count($r['json']['topics']));

// Les jokers de LIKE sont des CARACTERES, pas des operateurs : sans
// neutralisation, « % » seul aurait rendu tous les sujets du site.
$r = http('GET', $base . '/backend/forum.php?action=search&q=%25%25&lang=all', ['jar' => $anon]);
eq('recherche : un joker saisi ne rend pas tout', 0, count($r['json']['topics']));

// Un sujet retire ne se retrouve pas par la recherche. Le terme est
// choisi pour ne designer QUE ce sujet : « soiree » se retrouve dans
// les titres de rendez-vous des sections precedentes.
test_pdo()->exec("UPDATE forum_topics SET status = 'removed' WHERE id = $t_ancre");
$r = http('GET', $base . '/backend/forum.php?action=search&q=Lounge+de+test&lang=all', ['jar' => $anon]);
eq('recherche : un sujet retire disparait', 0, count($r['json']['topics']));
test_pdo()->exec("UPDATE forum_topics SET status = 'open' WHERE id = $t_ancre");
$r = http('GET', $base . '/backend/forum.php?action=search&q=Lounge+de+test&lang=all', ['jar' => $anon]);
eq('recherche : retabli, il revient', 1, count($r['json']['topics']));

// ════════════════════════════════════════════════════════
section('Langues servies');

// Le reglage (migration 019) decide de ce que le site PROPOSE. Il ne
// decide de rien de ce qui est deja ecrit : c'est la moitie du test.

// Un sujet en allemand, ecrit pendant que la langue est ouverte.
$vieillirF();
$r = post_json($base, $alice, '/backend/forum.php?action=topic_create', [
    'section' => 'conservation',
    'title'   => 'Lagerung im Humidor',
    'body'    => 'Wie lange sollte ein neuer Humidor vorbereitet werden?',
    'lang'    => 'de',
]);
eq('langues : sujet allemand cree pendant que la langue est ouverte', 201, $r['status']);

$page = http('GET', $base . '/', ['jar' => $anon]);
check('langues : la page annonce les six langues au front',
      str_contains($page['body'], 'data-langs="fr,en,es,de,zh,ar"'));
$page = http('GET', $base . '/?lang=de', ['jar' => $anon]);
check('langues : l\'allemand est servi en allemand',
      str_contains($page['body'], '<html lang="de"'));
check('langues : son drapeau est dans l\'en-tete',
      str_contains($page['body'], 'data-lang="de"'));

// ── Fermeture de l'allemand ──────────────────────────────
$page  = http('GET', $base . '/backend/admin.php?tab=langues', ['jar' => $admin]);
preg_match('/name="csrf" value="([a-f0-9]{64})"/', $page['body'], $m);
$lcsrf = $m[1] ?? '';
check('langues : l\'onglet d\'administration s\'affiche', $lcsrf !== '');

$r = http('POST', $base . '/backend/admin.php', ['jar' => $admin, 'form' => [
    'action'  => 'langues_save',
    'csrf'    => $lcsrf,
    'langues' => ['fr', 'en', 'es', 'zh', 'ar'],
]]);
eq('langues : enregistrement accepte', 200, $r['status']);

$page = http('GET', $base . '/?lang=de', ['jar' => $anon]);
check('langues : une langue fermee retombe sur le francais',
      str_contains($page['body'], '<html lang="fr"'));
check('langues : son drapeau disparait de l\'en-tete',
      !str_contains($page['body'], 'data-lang="de"'));
check('langues : elle n\'est plus annoncee au front',
      str_contains($page['body'], 'data-langs="fr,en,es,zh,ar"'));
check('langues : plus de lien hreflang vers elle',
      !str_contains($page['body'], 'hreflang="de"'));
check('langues : les autres langues restent declarees',
      str_contains($page['body'], 'hreflang="es"'));

$plan = http('GET', $base . '/sitemap.php', ['jar' => $anon]);
check('langues : le plan de site ne l\'annonce plus', !str_contains($plan['body'], '/de/'));
check('langues : le plan garde les autres', str_contains($plan['body'], '/es/'));

// Ce qui etait ecrit reste ecrit.
$r = http('GET', $base . '/backend/forum.php?action=topics&section=conservation&lang=all',
          ['jar' => $anon]);
$de = null;
foreach ($r['json']['topics'] as $t) if ($t['lang'] === 'de') $de = $t;
check('langues : le sujet allemand reste lisible apres la fermeture', $de !== null);

// Mais on n'ecrit plus dedans : la langue demandee n'est plus servie,
// on retombe sur celle du compte.
$vieillirF();
$r = post_json($base, $alice, '/backend/forum.php?action=topic_create', [
    'section' => 'conservation',
    'title'   => 'Noch ein Versuch auf Deutsch',
    'body'    => 'Dieser Beitrag darf nicht mehr auf Deutsch gespeichert werden.',
    'lang'    => 'de',
]);
eq('langues : sujet cree malgre la langue fermee', 201, $r['status']);
$apres = (int)$r['json']['id'];
$stocke = test_pdo()->query("SELECT lang FROM forum_topics WHERE id = $apres")->fetchColumn();
eq('langues : il n\'est plus enregistre dans la langue fermee', 'fr', $stocke);

// ── Le francais n'est pas fermable ───────────────────────
// C'est le repli de toute traduction manquante : le decocher laisserait
// indefini ce qu'on sert a qui n'a aucune des autres.
$r = http('POST', $base . '/backend/admin.php', ['jar' => $admin, 'form' => [
    'action' => 'langues_save', 'csrf' => $lcsrf, 'langues' => ['en'],
]]);
$page = http('GET', $base . '/', ['jar' => $anon]);
check('langues : le francais survit a une tentative de fermeture',
      str_contains($page['body'], 'data-langs="fr,en"'));

// ── Contre-epreuve : rouvrir rend tout ───────────────────
$r = http('POST', $base . '/backend/admin.php', ['jar' => $admin, 'form' => [
    'action' => 'langues_save', 'csrf' => $lcsrf,
    'langues' => ['fr', 'en', 'es', 'de', 'zh', 'ar'],
]]);
$page = http('GET', $base . '/?lang=de', ['jar' => $anon]);
check('langues : rouverte, la langue est de nouveau servie',
      str_contains($page['body'], '<html lang="de"'));
check('langues : et son drapeau revient',
      str_contains($page['body'], 'data-lang="de"'));

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

// ════════════════════════════════════════════════════════
section('Codes d\'erreur');

// Le serveur ne traduit pas : il renvoie un CODE stable que le front
// traduit (voir err() dans backend/config.php et tErr() dans i18n.js).
$r = http('POST', $base . '/backend/auth.php?action=login',
          ['jar' => $anon, 'json' => ['email' => 'x@y.z', 'password' => 'zzz']]);
eq('CSRF : la reponse porte un code', 'csrf_invalid', $r['json']['code'] ?? null);
check('CSRF : le message francais reste present, comme repli',
      !empty($r['json']['error']));

$r = post_json($base, $anon, '/backend/auth.php?action=login',
               ['email' => 'inconnu@test.local', 'password' => 'mauvais123']);
eq('identifiants errones : code stable', 'credentials_invalid', $r['json']['code'] ?? null);

$r = post_json($base, $anon, '/backend/auth.php?action=register',
               ['email' => 'alice@test.local', 'password' => 'motdepasse8', 'display_name' => 'Sosie']);
eq('email deja pris : code stable', 'email_taken', $r['json']['code'] ?? null);

$r = http('GET', $base . '/backend/api.php?action=my_contributions', ['jar' => $anon]);
eq('non connecte : code stable', 'auth_required', $r['json']['code'] ?? null);

$r = http('GET', $base . '/backend/data.php?action=country&id=inexistant', ['jar' => $anon]);
eq('pays introuvable : code stable', 'not_found_country', $r['json']['code'] ?? null);

$r = http('GET', $base . '/backend/data.php?action=inconnue', ['jar' => $anon]);
eq('action inconnue : code stable', 'unknown_action', $r['json']['code'] ?? null);

// Chaque code emis par le back doit avoir sa traduction, sinon le front
// afficherait le message francais quelle que soit la langue.
$codes = [];
foreach (glob(PROJECT_ROOT . '/backend/*.php') as $f) {
    if (preg_match_all("/err\('([a-z_]+)'/", file_get_contents($f), $m)) {
        foreach ($m[1] as $c) $codes[$c] = true;
    }
}
check('au moins vingt codes distincts sont definis', count($codes) >= 20,
      count($codes) . ' trouve(s)');

$trad = i18n_parse(PROJECT_ROOT . '/assets/js/i18n.js');
$sansTraduction = [];
foreach (array_keys($codes) as $c) {
    if (!isset($trad['fr']['err_' . $c])) $sansTraduction[] = $c;
}
eq('chaque code a sa traduction francaise', [], $sansTraduction);

$manquantes = [];
foreach (['en', 'es', 'de', 'zh', 'ar'] as $l) {
    foreach (array_keys($codes) as $c) {
        if (!isset($trad[$l]['err_' . $c])) $manquantes[] = "$l/$c";
    }
}
eq('chaque code est traduit dans les cinq autres langues', [], $manquantes);

// ════════════════════════════════════════════════════════
section('Le droit a l\'effacement');

// On pouvait s'inscrire et pas s'effacer : auth.php exposait register,
// login, logout, forgot, reset, resend — et rien pour partir.
//
// CE QUE CE BLOC SURVEILLE VRAIMENT. Un DELETE sur `users` a l'air de
// suffire : onze tables portent une cle etrangere qui suit. Mais
// `contributions` n'en porte AUCUNE, et garde `contributor_email` et
// `contributor_ip`. Un effacement qui laisse derriere lui l'adresse
// electronique de celui qui demandait a etre oublie est pire qu'un
// effacement absent : il donne la conscience tranquille.

test_pdo()->exec("DELETE FROM auth_attempts");
$partant = new_client('partant');
$r = post_json($base, $partant, '/backend/auth.php?action=register',
               ['email' => 'partant@test.local', 'password' => 'motdepasse8',
                'display_name' => 'Le Partant']);
eq('effacement : compte cree', 201, $r['status']);
force_verified('partant@test.local');
$r = post_json($base, $partant, '/backend/auth.php?action=login',
               ['email' => 'partant@test.local', 'password' => 'motdepasse8']);
eq('effacement : compte connecte', 200, $r['status']);
$pid = (int)test_pdo()->query("SELECT id FROM users WHERE email='partant@test.local'")->fetchColumn();

// On lui donne quelque chose a laisser derriere lui, dans chacune des
// trois categories : ce qui doit disparaitre, ce qui doit rester
// anonymise, et ce que rien ne suivrait tout seul.
test_pdo()->exec("INSERT INTO reviews (user_id, lounge_id, rating, title, body, status)
                  VALUES ($pid, 1, 4, 'Un avis', 'Le corps de l avis.', 'published')");
test_pdo()->exec("INSERT INTO favorites (user_id, target_type, target_id, list)
                  VALUES ($pid, 'lounge', 1, 'wishlist')");
test_pdo()->exec("INSERT INTO contributions
                  (id, user_id, country_id, country_name, name, city, description,
                   contributor_email, contributor_ip, status)
                  VALUES (950, $pid, 'testland', 'Testland', 'Le Legs', 'Ville',
                          'Une contribution que son auteur laisse derriere lui.',
                          'partant@test.local', '203.0.113.55', 'pending')");
$t_id = (int)test_pdo()->query("SELECT id FROM forum_topics ORDER BY id LIMIT 1")->fetchColumn();
test_pdo()->exec("INSERT INTO forum_posts (topic_id, user_id, body, status)
                  VALUES ($t_id, $pid, 'Un message qui doit survivre au depart.', 'published')");
$msg_id = (int)test_pdo()->lastInsertId();

// ── Le mot de passe est redemande ────────────────────────
// Une session ouverte sur un poste partage ne doit pas suffire : aucun
// autre geste du site n'est irreversible, celui-ci l'est.
$r = post_json($base, $partant, '/backend/auth.php?action=delete_account', []);
eq('effacement : refuse sans mot de passe', 403, $r['status']);
$r = post_json($base, $partant, '/backend/auth.php?action=delete_account',
               ['password' => 'ce-n-est-pas-le-bon']);
eq('effacement : refuse avec un mauvais mot de passe', 403, $r['status']);
eq('effacement : le code est stable', 'credentials_invalid', $r['json']['code'] ?? null);
eq('effacement : et le compte est toujours la', 1,
   (int)test_pdo()->query("SELECT COUNT(*) FROM users WHERE id = $pid")->fetchColumn());

// Un visiteur non connecte ne supprime le compte de personne.
$r = post_json($base, $anon, '/backend/auth.php?action=delete_account',
               ['password' => 'motdepasse8']);
eq('effacement : un visiteur anonyme est econduit', 401, $r['status']);

// ── L'effacement lui-meme ────────────────────────────────
$r = post_json($base, $partant, '/backend/auth.php?action=delete_account',
               ['password' => 'motdepasse8']);
eq('effacement : accepte avec le bon mot de passe', 200, $r['status']);

$compte = fn(string $sql) => (int)test_pdo()->query($sql)->fetchColumn();

eq('effacement : le compte a disparu', 0, $compte("SELECT COUNT(*) FROM users WHERE id = $pid"));
eq('effacement : ses avis avec lui',   0, $compte("SELECT COUNT(*) FROM reviews WHERE user_id = $pid"));
eq('effacement : ses listes aussi',    0, $compte("SELECT COUNT(*) FROM favorites WHERE user_id = $pid"));
eq('effacement : et ses jetons',       0, $compte("SELECT COUNT(*) FROM email_tokens WHERE user_id = $pid"));

// Le message RESTE, sans auteur : l'effacer rendrait incomprehensibles
// les reponses qu'il a recues. C'est la regle posee avec le forum.
eq('effacement : son message reste lisible', 1,
   $compte("SELECT COUNT(*) FROM forum_posts WHERE id = $msg_id"));
eq('effacement : mais il n\'a plus d\'auteur', 1,
   $compte("SELECT COUNT(*) FROM forum_posts WHERE id = $msg_id AND user_id IS NULL"));

// LE CAS QUI COMPTE. `contributions` ne porte aucune cle etrangere : un
// DELETE seul aurait laisse l'adresse electronique et l'adresse IP.
$c = test_pdo()->query("SELECT user_id, contributor_email, contributor_ip, name
                        FROM contributions WHERE id = 950")->fetch(PDO::FETCH_ASSOC);
check('effacement : la contribution survit — ce n\'est pas une donnee personnelle',
      $c && $c['name'] === 'Le Legs');
// Lecture directe, sans `??` : l'operateur de coalescence traite null
// comme une absence et rendrait donc la valeur de repli au moment
// PRECIS ou l'effacement a fonctionne. Le test aurait echoue sur un
// code juste — et, pire, serait passe sur un code qui n'efface rien.
eq('effacement : son auteur est detache',   null, $c['user_id']);
eq('effacement : son email est efface',     null, $c['contributor_email']);
eq('effacement : son adresse IP aussi',     null, $c['contributor_ip']);

// Rien ne doit plus designer ce compte, nulle part.
$restes = [];
foreach (['reviews', 'favorites', 'email_tokens', 'review_flags', 'forum_follows',
          'forum_reactions', 'forum_attendance', 'contributions'] as $t) {
    $n = $compte("SELECT COUNT(*) FROM `$t` WHERE user_id = $pid");
    if ($n > 0) $restes[] = "$t ($n)";
}
eq('effacement : plus une seule ligne ne le designe', [], $restes);

// ── L'administrateur ne se supprime pas ainsi ────────────
// Il se retrouverait dehors sans que personne puisse le faire rentrer.
test_pdo()->exec("DELETE FROM auth_attempts");
$chef = new_client('chef');
post_json($base, $chef, '/backend/auth.php?action=register',
          ['email' => 'chef@test.local', 'password' => 'motdepasse8', 'display_name' => 'Le Chef']);
force_verified('chef@test.local');
test_pdo()->exec("UPDATE users SET role = 'admin' WHERE email = 'chef@test.local'");
post_json($base, $chef, '/backend/auth.php?action=login',
          ['email' => 'chef@test.local', 'password' => 'motdepasse8']);
$r = post_json($base, $chef, '/backend/auth.php?action=delete_account',
               ['password' => 'motdepasse8']);
eq('effacement : un administrateur est refuse', 403, $r['status']);
eq('effacement : avec un code qui le dit', 'admin_undeletable', $r['json']['code'] ?? null);
eq('effacement : et il est toujours la', 1,
   $compte("SELECT COUNT(*) FROM users WHERE email = 'chef@test.local'"));
test_pdo()->exec("DELETE FROM users WHERE email = 'chef@test.local'");
test_pdo()->exec("DELETE FROM auth_attempts");

// ════════════════════════════════════════════════════════
section('L\'adresse du visiteur');

// CE QUE CE BLOC PROUVE
// client_ip() lisait CF-Connecting-IP, puis X-Forwarded-For, puis
// X-Real-IP, et ne retombait sur REMOTE_ADDR qu'en dernier. Ces trois
// en-tetes sont ecrits par l'APPELANT. Servi en direct — ce qui est le
// cas sur un mutualise —, le site retenait donc une adresse choisie par
// celui qu'il cherchait a brider. Un en-tete different a chaque requete,
// et plus aucun plafond ne mordait : ni les connexions, ni les
// contributions, ni les cadences du forum. Le compteur tournait, sur une
// colonne qui ne designait personne.

require_once PROJECT_ROOT . '/backend/auth_lib.php';

// ── Les plages, en cas construits ────────────────────────
// Une comparaison de chaines ferait entrer « 10.0.0.10 » dans
// « 10.0.0.1 », et laisserait une plage IPv6 contenir une IPv4.
$plages = [
    ['192.168.1.42', '192.168.1.0/24', true,  'IPv4 dans son /24'],
    ['192.168.2.42', '192.168.1.0/24', false, 'IPv4 hors de son /24'],
    ['10.0.0.1',     '10.0.0.1',       true,  'adresse nue, egalite'],
    ['10.0.0.10',    '10.0.0.1',       false, 'adresse nue : 10 n\'est pas 1'],
    ['127.0.0.1',    '127.0.0.0/8',    true,  'boucle locale'],
    ['128.0.0.1',    '127.0.0.0/8',    false, 'juste au-dela du /8'],
    ['10.0.0.5',     '10.0.0.0/0',     true,  'un /0 prend tout'],
    ['192.168.1.1',  '192.168.1.0/33', false, 'masque impossible refuse'],
    ['2001:db8::1',  '2001:db8::/32',  true,  'IPv6 dans son /32'],
    ['2001:db9::1',  '2001:db8::/32',  false, 'IPv6 hors de son /32'],
    ['192.168.1.1',  '2001:db8::/32',  false, 'une plage IPv6 ne contient pas une IPv4'],
    ['pas-une-ip',   '192.168.1.0/24', false, 'une saisie qui n\'est pas une adresse'],
];
foreach ($plages as [$ip, $plage, $attendu, $libelle]) {
    eq("plage : $libelle", $attendu, ip_dans_plage($ip, $plage));
}

// ── Servi en direct : l'en-tete forge ne sert a rien ─────
// Douze tentatives, douze fausses adresses, trois en-tetes a chaque
// fois. Le plafond des connexions est de 10 par quart d'heure.
test_pdo()->exec("DELETE FROM auth_attempts");
$forgeur  = new_client('forgeur');
$bornee_a = 0;
for ($i = 1; $i <= 12; $i++) {
    $r = post_json($base, $forgeur, '/backend/auth.php?action=login',
        ['email' => 'inconnu@test.local', 'password' => 'mauvais123'],
        ['X-Forwarded-For: 203.0.113.' . $i,
         'X-Real-IP: 198.51.100.' . $i,
         'CF-Connecting-IP: 192.0.2.' . $i]);
    if ($r['status'] === 429) { $bornee_a = $i; break; }
}
eq('adresse : le plafond mord malgre les fausses adresses', 11, $bornee_a);
eq('adresse : une seule adresse a ete retenue', 1,
   (int)test_pdo()->query("SELECT COUNT(DISTINCT ip) FROM auth_attempts WHERE action='login'")->fetchColumn());
eq('adresse : celle que le serveur constate lui-meme', '127.0.0.1',
   test_pdo()->query("SELECT ip FROM auth_attempts WHERE action='login' LIMIT 1")->fetchColumn());

// ── CONTRE-EPREUVE : derriere un proxy DECLARE ───────────
// Refuser un en-tete ne prouve pas qu'on sait le lire. Un second
// serveur, avec TRUSTED_PROXIES=127.0.0.1, doit au contraire l'honorer —
// sinon un site reellement derriere un reverse-proxy verrait tous ses
// visiteurs partager un seul et meme compteur.
test_pdo()->exec("DELETE FROM auth_attempts");
$derriere = start_server(['TRUSTED_PROXIES' => '127.0.0.1']);
$relaye   = new_client('relaye');
for ($i = 1; $i <= 12; $i++) {
    $r = post_json($derriere, $relaye, '/backend/auth.php?action=login',
        ['email' => 'inconnu@test.local', 'password' => 'mauvais123'],
        ['X-Forwarded-For: 203.0.113.' . $i]);
    if ($r['status'] === 429) break;
}
$vues = (int)test_pdo()->query("SELECT COUNT(DISTINCT ip) FROM auth_attempts WHERE action='login'")->fetchColumn();
check('adresse : derriere un proxy declare, chaque visiteur a son compteur',
      $vues >= 10, "$vues adresses distinctes retenues");

// La chaine se lit DEPUIS LA DROITE. Chaque relais ajoute a droite :
// « 1.2.3.4, 198.51.100.77 » se lit « le visiteur pretend venir de
// 1.2.3.4, et le proxy a constate 198.51.100.77 ». Lire a gauche —
// l'ancien comportement — retenait la valeur forgee jusque DERRIERE un
// vrai proxy, ce qui laissait le trou ouvert la meme ou l'en-tete est
// legitime.
$derniere = fn() => test_pdo()->query(
    "SELECT ip FROM auth_attempts WHERE action='login' ORDER BY id DESC LIMIT 1")->fetchColumn();

test_pdo()->exec("DELETE FROM auth_attempts");
post_json($derriere, $relaye, '/backend/auth.php?action=login',
    ['email' => 'inconnu@test.local', 'password' => 'mauvais123'],
    ['X-Forwarded-For: 1.2.3.4, 198.51.100.77']);
eq('adresse : la valeur forgee a gauche est ignoree', '198.51.100.77', $derniere());

test_pdo()->exec("DELETE FROM auth_attempts");
post_json($derriere, $relaye, '/backend/auth.php?action=login',
    ['email' => 'inconnu@test.local', 'password' => 'mauvais123'],
    ['X-Forwarded-For: 203.0.113.7, 127.0.0.1']);
eq('adresse : les maillons connus sont sautes', '203.0.113.7', $derniere());

// Le compteur des connexions repart a zero : les sections suivantes
// s'authentifient depuis la meme adresse que celle qu'on vient de
// saturer.
test_pdo()->exec("DELETE FROM auth_attempts");

// ════════════════════════════════════════════════════════
section('Portee de la moderation');

// CE QUE CE BLOC PROUVE
// Le role `moderator` existait dans le code depuis l'espace
// communautaire, et il etait INUTILISABLE : admin.php interrogeait la
// porte sans passer la base, donc le chemin du role n'etait jamais
// emprunte, et aucun ecran ne savait nommer un moderateur. Le seul
// compte qui portait le role — « La Regie » — a « * » pour hachage de
// mot de passe et ne peut pas se connecter. Zero test mentionnait ce
// role. Les verifications qui suivent tiennent les deux bouts : la
// porte s'ouvre, et elle ne s'ouvre pas trop grand.

// Un compte DEDIE : promouvoir Alice ou Bob ferait porter leurs
// plafonds et leurs signalements par un moderateur, et les sections
// suivantes liraient des chiffres qu'elles n'ont pas ecrits.
test_pdo()->exec("DELETE FROM auth_attempts");
$mireille = new_client('mireille');
$r = post_json($base, $mireille, '/backend/auth.php?action=register',
               ['email' => 'mireille@test.local', 'password' => 'motdepasse8',
                'display_name' => 'Mireille']);
eq('moderation : compte cree', 201, $r['status']);
force_verified('mireille@test.local');
$r = post_json($base, $mireille, '/backend/auth.php?action=login',
               ['email' => 'mireille@test.local', 'password' => 'motdepasse8']);
eq('moderation : compte connecte', 200, $r['status']);
$mid = (int)test_pdo()->query("SELECT id FROM users WHERE email='mireille@test.local'")->fetchColumn();

// Deux comptes que l'ecran des membres doit refuser de toucher.
test_pdo()->exec(
    "INSERT INTO users (email, password_hash, display_name, role, email_verified)
     VALUES ('regie@test.local', '*', 'La Regie', 'moderator', 1),
            ('patron@test.local', 'x', 'Le Patron', 'admin', 1)"
);
$rid = (int)test_pdo()->query("SELECT id FROM users WHERE email='regie@test.local'")->fetchColumn();
$pid = (int)test_pdo()->query("SELECT id FROM users WHERE email='patron@test.local'")->fetchColumn();

// Une contribution en attente : elle sert de cible, et sa presence fait
// rendre a l'onglet « En attente » un formulaire dont on lit le jeton.
test_pdo()->exec(
    "INSERT INTO contributions (id, country_id, country_name, name, city, description, status)
     VALUES (900, 'testland', 'Testland', 'Le Fumoir du Test', 'Ville',
             'Une description assez longue pour tenir lieu de contribution.', 'pending'),
            (901, 'testland', 'Testland', 'Le Faux Fumoir', 'Ville',
             'Une seconde contribution, celle qui sera rejetee.', 'pending')"
);

// ── Avant nomination : la porte est fermee ───────────────
$r = http('GET', $base . '/backend/admin.php', ['jar' => $mireille]);
check('moderation : un simple membre ne voit que le formulaire de cle',
      str_contains($r['body'], 'name="login_key"'));

// ── Nommer, depuis l'ecran des membres ───────────────────
// Par HTTP et non par un UPDATE : c'est justement le chemin qui
// n'existait pas.
$admincli = new_client('admincli');
$CLE = ['X-Admin-Key: test-admin-key'];
$r = http('GET', $base . '/backend/admin.php?tab=membres', ['jar' => $admincli, 'headers' => $CLE]);
eq('moderation : l\'ecran des membres s\'ouvre a l\'administration', 200, $r['status']);
preg_match('/name="csrf" value="([a-f0-9]{64})"/', $r['body'], $m);
$acsrf = $m[1] ?? '';
check('moderation : jeton d\'administration obtenu', $acsrf !== '');

$poste_admin = fn(array $f) => http('POST', $base . '/backend/admin.php',
    ['jar' => $admincli, 'headers' => $CLE, 'form' => array_merge(['csrf' => $acsrf], $f)]);

$r = $poste_admin(['id' => $mid, 'action' => 'role_set', 'role' => 'moderator']);
eq('moderation : nomination acceptee', 200, $r['status']);
eq('moderation : le role est ecrit en base', 'moderator',
   test_pdo()->query("SELECT role FROM users WHERE id = $mid")->fetchColumn());

// Les trois refus de changer_role(), chacun protegeant autre chose.
$r = $poste_admin(['id' => $mid, 'action' => 'role_set', 'role' => 'admin']);
check('moderation : le role admin ne s\'attribue pas depuis l\'ecran',
      str_contains($r['body'], 'ne s') && str_contains($r['body'], 'attribue pas'));
eq('moderation : et le compte n\'a pas bouge', 'moderator',
   test_pdo()->query("SELECT role FROM users WHERE id = $mid")->fetchColumn());

$r = $poste_admin(['id' => $pid, 'action' => 'role_set', 'role' => 'member']);
eq('moderation : un administrateur ne se retrograde pas ici', 'admin',
   test_pdo()->query("SELECT role FROM users WHERE id = $pid")->fetchColumn());

$r = $poste_admin(['id' => $rid, 'action' => 'role_set', 'role' => 'member']);
eq('moderation : le compte de signature garde son role', 'moderator',
   test_pdo()->query("SELECT role FROM users WHERE id = $rid")->fetchColumn());

// ── La porte s'ouvre, et pas plus grand ──────────────────
$r = http('GET', $base . '/backend/admin.php', ['jar' => $mireille]);
check('moderation : la moderatrice entre dans l\'ecran',
      !str_contains($r['body'], 'name="login_key"'));
check('moderation : elle agit sous son nom', str_contains($r['body'], 'Mireille'));
check('moderation : le menu ne propose pas les langues',
      !str_contains($r['body'], 'tab=langues'));
check('moderation : ni l\'ecran des membres',
      !str_contains($r['body'], 'tab=membres'));
check('moderation : le journal, lui, est propose',
      str_contains($r['body'], 'tab=journal'));
check('moderation : pas de bouton d\'export',
      !str_contains($r['body'], 'action=export'));

// Contre-epreuve : la cle voit ce que la moderation ne voit pas.
$r = http('GET', $base . '/backend/admin.php', ['jar' => $admincli, 'headers' => $CLE]);
check('administration : le menu propose bien les langues',
      str_contains($r['body'], 'tab=langues'));
check('administration : et l\'ecran des membres',
      str_contains($r['body'], 'tab=membres'));

// ── UN MENU N'EST PAS UNE SERRURE ────────────────────────
// Le cas construit : la requete est forgee a la main, avec un jeton
// CSRF parfaitement valide. C'est exactement ce que ferait quelqu'un
// qui a lu le code — et c'est la seule verification qui compte.
$r = http('GET', $base . '/backend/admin.php?tab=pending', ['jar' => $mireille]);
preg_match('/name="csrf" value="([a-f0-9]{64})"/', $r['body'], $m);
$mcsrf = $m[1] ?? '';
check('moderation : jeton de moderation obtenu', $mcsrf !== '');

$poste_mod = fn(array $f) => http('POST', $base . '/backend/admin.php',
    ['jar' => $mireille, 'form' => array_merge(['csrf' => $mcsrf], $f)]);

$avant_langues = (int)test_pdo()->query("SELECT COUNT(*) FROM site_languages WHERE is_active = 1")->fetchColumn();
$r = $poste_mod(['action' => 'langues_save', 'langues' => ['fr']]);
eq('moderation : le reglage des langues est refuse malgre un jeton valide', 403, $r['status']);
eq('moderation : et rien n\'a ete ecrit', $avant_langues,
   (int)test_pdo()->query("SELECT COUNT(*) FROM site_languages WHERE is_active = 1")->fetchColumn());

$r = $poste_mod(['id' => $mid, 'action' => 'role_set', 'role' => 'member']);
eq('moderation : un moderateur ne se donne pas de droits', 403, $r['status']);
eq('moderation : son role est intact', 'moderator',
   test_pdo()->query("SELECT role FROM users WHERE id = $mid")->fetchColumn());

// Un onglet ferme ramene au tableau de bord EN LE DISANT : un refus
// muet se lit comme une panne, et c'est ainsi qu'on finit par
// distribuer la cle.
$r = http('GET', $base . '/backend/admin.php?tab=langues', ['jar' => $mireille]);
check('moderation : l\'onglet ferme explique le refus',
      str_contains($r['body'], 'le r&eacute;glage des langues servies')
   || str_contains($r['body'], 'le réglage des langues servies'));

// ── L'irreversible reste a l'administration ──────────────
test_pdo()->exec(
    "INSERT INTO lounge_photos (id, lounge_id, filename, is_approved, is_primary)
     VALUES (900, 1, 'photo-de-test.jpg', 1, 1)"
);
$photo = fn(string $jar, string $act, array $h = []) => http('POST',
    $base . '/backend/photos.php?action=' . $act,
    ['jar' => $jar, 'headers' => $h, 'form' => ['photo_id' => 900]]);

$r = $photo($mireille, 'delete');
eq('moderation : la suppression definitive est refusee', 403, $r['status']);
eq('moderation : la ligne est toujours la', 1,
   (int)test_pdo()->query("SELECT COUNT(*) FROM lounge_photos WHERE id = 900")->fetchColumn());

// Le geste proportionne existe, sinon le refus ci-dessus laisserait un
// moderateur sans reponse devant une image deplacee.
$r = $photo($mireille, 'hide');
eq('moderation : le masquage est permis', 200, $r['status']);
$ph = test_pdo()->query("SELECT is_approved, is_primary FROM lounge_photos WHERE id = 900")->fetch(PDO::FETCH_ASSOC);
eq('moderation : la photo quitte le site', 0, (int)$ph['is_approved']);
eq('moderation : et cesse d\'etre la principale', 0, (int)$ph['is_primary']);

$r = $photo($admincli, 'delete', $CLE);
eq('administration : la suppression definitive, elle, passe', 200, $r['status']);

$r = http('GET', $base . '/backend/api.php?action=export', ['jar' => $mireille]);
eq('moderation : l\'export complet est refuse', 403, $r['status']);
$r = http('GET', $base . '/backend/api.php?action=export', ['jar' => $admincli, 'headers' => $CLE]);
eq('administration : l\'export est autorise', 200, $r['status']);

// ════════════════════════════════════════════════════════
section('Journal de moderation');

// « Toute decision est journalisee avec son auteur et son motif. Un
// moderateur doit pouvoir etre audite » — docs/communaute.md §8. Une
// seule trace existait jusqu'ici : forum_flags.resolved_by.

/** Lignes du journal pour une cible. */
$journal = function (string $type, int $id): array {
    $q = test_pdo()->prepare(
        "SELECT * FROM moderation_log WHERE cible_type = ? AND cible_id = ? ORDER BY id"
    );
    $q->execute([$type, $id]);
    return $q->fetchAll(PDO::FETCH_ASSOC);
};

$r = $poste_mod(['id' => 900, 'action' => 'approve']);
eq('journal : la contribution est approuvee', 200, $r['status']);
$lignes = $journal('contribution', 900);
eq('journal : une ligne, une seule', 1, count($lignes));
eq('journal : signee du nom de la moderatrice', 'Mireille', $lignes[0]['acteur_nom'] ?? '');
eq('journal : avec sa portee', 'moderator', $lignes[0]['portee'] ?? '');
eq('journal : et l\'acte', 'contribution_approuver', $lignes[0]['action'] ?? '');
check('journal : le detail nomme l\'etablissement',
      str_contains((string)($lignes[0]['detail'] ?? ''), 'Le Fumoir du Test'));

// Rejouee, la decision ne s'inscrit pas deux fois : sinon le journal
// ferait croire a deux moderateurs successifs sur le meme dossier.
$poste_mod(['id' => 900, 'action' => 'approve']);
eq('journal : une approbation rejouee n\'ajoute rien', 1, count($journal('contribution', 900)));

$r = $poste_mod(['id' => 901, 'action' => 'reject']);
eq('journal : le rejet aussi laisse une trace', 'contribution_rejeter',
   $journal('contribution', 901)[0]['action'] ?? '');
$poste_mod(['id' => 901, 'action' => 'reject']);
eq('journal : un rejet rejoue n\'ajoute rien', 1, count($journal('contribution', 901)));

eq('journal : la nomination est inscrite', 'role_attribuer',
   $journal('compte', $mid)[0]['action'] ?? '');
eq('journal : les refus, non', 1, count($journal('compte', $mid)));
eq('journal : la photo masquee est inscrite', 'photo_masquer',
   $journal('photo', 900)[0]['action'] ?? '');
eq('journal : sa suppression aussi', 'photo_supprimer',
   $journal('photo', 900)[1]['action'] ?? '');

// LE CHEMIN SANS MODERATEUR. Un contributeur de confiance publie
// directement : personne ne decide, et le journal doit le dire — c'est
// la reponse a « pourquoi cette fiche est-elle en ligne ? ».
test_pdo()->exec("UPDATE users SET role = 'trusted' WHERE email = 'alice@test.local'");
$r = post_json($base, $alice, '/backend/api.php?action=submit', [
    'country_id' => 'testland', 'country_name' => 'Testland',
    'name' => 'La Cave Directe', 'city' => 'Ville',
    'description' => 'Publiee sans passer par la file de moderation.',
]);
check('journal : la contribution de confiance est acceptee', in_array($r['status'], [200, 201], true));
$cid = (int)test_pdo()->query(
    "SELECT id FROM contributions WHERE name = 'La Cave Directe'")->fetchColumn();
$l = $journal('contribution', $cid)[0] ?? [];
eq('journal : l\'acte dit qu\'aucun moderateur n\'est passe',
   'contribution_publication_directe', $l['action'] ?? '');
eq('journal : la portee est celle du systeme', 'systeme', $l['portee'] ?? '');
eq('journal : mais l\'auteur est nomme', 'Alice', $l['acteur_nom'] ?? '');
test_pdo()->exec("UPDATE users SET role = 'member' WHERE email = 'alice@test.local'");

// Le journal se lit depuis les deux portees : le cacher au moderateur
// en ferait une surveillance plutot qu'un registre.
$r = http('GET', $base . '/backend/admin.php?tab=journal', ['jar' => $mireille]);
check('journal : la moderatrice lit le registre ou elle figure',
      str_contains($r['body'], 'Mireille') && str_contains($r['body'], 'Journal'));

// Menage : les fiches nees des approbations ci-dessus ne doivent pas
// fausser les comptes d'etablissements des sections suivantes.
test_pdo()->exec("DELETE FROM lounges WHERE contribution_id IN (900, 901, $cid)");
test_pdo()->exec("DELETE FROM approved_lounges WHERE contribution_id IN (900, 901, $cid)");

// ════════════════════════════════════════════════════════
// ════════════════════════════════════════════════════════
section('Le lieu d\'un rendez-vous');

// Ce bloc vient EN DERNIER : creer un rendez-vous sur un
// etablissement ancre aussi son sujet dessus (ref_type = lounge). Pose
// plus haut, il faussait le compte de discussions de la fiche et le
// nombre de rendez-vous a venir — trois sections plus loin, sans que
// rien ne relie l'echec a sa cause.
// Organiser demande le statut de confiance, et Alice l'a perdu depuis :
// la section des plafonds la remet en simple membre pour verifier le
// blocage des liens externes.
test_pdo()->exec("UPDATE users SET role = 'trusted' WHERE email = 'alice@test.local'");

// -- Le lieu pris dans l'atlas ---------------------------
// Choisir un etablissement de la base donne son nom, sa ville ET ses
// coordonnees — donc le losange sur le globe, que personne ne
// saisirait a la main. Le texte libre envoye a cote est IGNORE : deux
// sources pour un meme lieu finiraient par se contredire.
$r = post_json($base, $alice, '/backend/forum.php?action=event_create',
    array_merge($evt, ['title' => 'Rendez-vous au Lounge de test',
                       'starts_local' => '2027-03-10T19:00',
                       'lounge_id' => 1, 'place_label' => 'Une saisie qui doit etre ignoree']));
eq('forum : rendez-vous ancre sur un etablissement', 201, $r['status']);
$e_lieu = (int)$r['json']['id'];
$lieu = test_pdo()->query(
    "SELECT lounge_id, place_label FROM forum_events WHERE topic_id = $e_lieu"
)->fetch(PDO::FETCH_ASSOC);
eq('forum : l\'etablissement est enregistre', 1, (int)$lieu['lounge_id']);
eq('forum : le libelle vient de la base, pas de la saisie',
   'Lounge de test · Ville', $lieu['place_label']);

// Un etablissement inconnu ne fabrique pas un lieu : on retombe sur le
// texte libre, qui reste la seule chose que l'on sache.
$r = post_json($base, $alice, '/backend/forum.php?action=event_create',
    array_merge($evt, ['title' => 'Rendez-vous a un etablissement inconnu',
                       'starts_local' => '2027-03-11T19:00',
                       'lounge_id' => 999999, 'place_label' => 'Chez Marcel, Lyon']));
eq('forum : rendez-vous cree malgre l\'etablissement inconnu', 201, $r['status']);
$lieu = test_pdo()->query(
    "SELECT lounge_id, place_label FROM forum_events WHERE topic_id = " . (int)$r['json']['id']
)->fetch(PDO::FETCH_ASSOC);
eq('forum : aucun etablissement retenu', null, $lieu['lounge_id']);
eq('forum : le texte libre prend le relais', 'Chez Marcel, Lyon', $lieu['place_label']);

test_pdo()->exec("UPDATE users SET role = 'member' WHERE email = 'alice@test.local'");

// ════════════════════════════════════════════════════════
section('Aucune traduction ne decrit un francais perime');

// Une colonne « champ_xx » ne sait dire que « pleine » ou « vide » :
// elle ignore de QUEL francais elle est la traduction. Corriger un
// texte laisse donc ses cinq traductions decrire l'ancien, et
// `i18n_lot.php --reste` les compte comme completes — le compteur
// affiche 100 % pendant que la fiche traduite dit autre chose.
//
// C'est arrive avec la migration 026 : dix articles corriges, dix
// traductions devenues fausses et invisibles.
//
// L'instrument existait pourtant depuis la migration 009
// (translation_status + i18n_fraicheur.php). Il n'a jamais servi parce
// qu'il sortait toujours en 0 : rien ne pouvait s'en servir, personne
// ne le lancait. Il a maintenant un code de sortie, et cette section
// l'appelle a chaque campagne.
{
    $cmd = sprintf('%s -d xdebug.mode=off %s',
                   escapeshellarg(PHP_BINARY),
                   escapeshellarg(PROJECT_ROOT . '/tools/i18n_fraicheur.php'));
    $pipes = [];
    $proc = proc_open($cmd, [1 => ['pipe', 'w'], 2 => ['pipe', 'w']], $pipes, PROJECT_ROOT);
    if (is_resource($proc)) {
        $sortie = stream_get_contents($pipes[1]) . stream_get_contents($pipes[2]);
        fclose($pipes[1]); fclose($pipes[2]);
        $code = proc_close($proc);
        if ($code !== 0) echo "\n" . $sortie . "\n";
        eq('traductions : aucune perimee, aucune manquante, aucune non scellee', 0, $code);
    } else {
        check('traductions : controle de fraicheur lancable', false);
    }
}

// ════════════════════════════════════════════════════════
section('Chaque point tombe dans son pays');

// L'audit E4 avait teste 152 points en 2023 et corrige deux erreurs
// (Israel, Semi Vuelta). Il n'a laisse AUCUN outil : la migration 027 a
// ajoute trois pays et quatre zones que personne n'a verifies, et rien
// ne le disait. Un audit fait une fois et jamais rejoue n'est pas un
// audit, c'est une photo.
//
// Le controle porte sur la BASE APPLICATIVE — c'est la que vit le
// contenu reel, et c'est lui qu'on publie. Il compare chaque
// coordonnee au fond de carte que le front dessine deja.
{
    $cmd = sprintf('%s -d xdebug.mode=off %s',
                   escapeshellarg(PHP_BINARY),
                   escapeshellarg(PROJECT_ROOT . '/tools/coords_check.php'));
    $pipes = [];
    $proc = proc_open($cmd, [1 => ['pipe', 'w'], 2 => ['pipe', 'w']], $pipes, PROJECT_ROOT);
    if (is_resource($proc)) {
        $sortie = stream_get_contents($pipes[1]) . stream_get_contents($pipes[2]);
        fclose($pipes[1]); fclose($pipes[2]);
        $code = proc_close($proc);
        // Le detail va a l'ecran seulement en cas d'echec : sinon la
        // campagne noie ses 335 lignes sous un rapport de geographie.
        if ($code !== 0) echo "\n" . $sortie . "\n";
        eq('coordonnees : aucun point ne se trompe de pays', 0, $code);
    } else {
        check('coordonnees : controle lancable', false);
    }
}

// ════════════════════════════════════════════════════════
section('Les chiffres dates n\'ont pas trop vieilli');

// Le lot R2 a trouve QUATORZE PIB perimes sur quatorze, plusieurs de 30
// a 48 %, tous marques « (2022) ». Personne ne les avait regardes en
// quatre ans, et rien ne pouvait le dire : une valeur fausse par
// vieillissement ressemble exactement a une valeur juste.
//
// Les corriger a la main aurait rendez-vous avec la meme panne en 2029.
// tools/geo_banquemondiale.php les tient desormais depuis l'API de la
// Banque mondiale, et son mode --verifier tourne HORS LIGNE : il ne
// regarde que l'annee inscrite dans la valeur. Une campagne ne doit pas
// dependre du reseau.
{
    $cmd = sprintf('%s -d xdebug.mode=off %s --verifier',
                   escapeshellarg(PHP_BINARY),
                   escapeshellarg(PROJECT_ROOT . '/tools/geo_banquemondiale.php'));
    $pipes = [];
    $proc = proc_open($cmd, [1 => ['pipe', 'w'], 2 => ['pipe', 'w']], $pipes, PROJECT_ROOT);
    if (is_resource($proc)) {
        $sortie = stream_get_contents($pipes[1]) . stream_get_contents($pipes[2]);
        fclose($pipes[1]); fclose($pipes[2]);
        $code = proc_close($proc);
        if ($code !== 0) echo "\n" . $sortie . "\n";
        eq('fiches pays : population et PIB portent une annee recente', 0, $code);
    } else {
        check('fiches pays : controle de fraicheur lancable', false);
    }
}

// ════════════════════════════════════════════════════════
section('Le meme fait dit la meme chose partout');

// Panne centrale du lot R5, et la plus couteuse de la relecture : une
// correction ne suit pas la donnee, elle suit le CHAMP.
//
// « Premier exportateur mondial en valeur » a ete retire de rev_detail
// par la migration 028 faute de source — et a survecu dans notes.
// « Lombok » a ete retire des zones par la 030 — et est reste dans
// regions ET varieties. « Jamastran Valley » a ete francise en zone,
// pas dans regions. Sept fois la meme mecanique.
//
// Rien ne pouvait le voir : chaque champ etait juste vis-a-vis de
// lui-meme. Ce controle regarde ce qui doit concorder ENTRE les
// champs, et refuse le retour des rangs mondiaux non sources.
{
    $cmd = sprintf('%s -d xdebug.mode=off %s',
                   escapeshellarg(PHP_BINARY),
                   escapeshellarg(PROJECT_ROOT . '/tools/coherence_check.php'));
    $pipes = [];
    $proc = proc_open($cmd, [1 => ['pipe', 'w'], 2 => ['pipe', 'w']], $pipes, PROJECT_ROOT);
    if (is_resource($proc)) {
        $sortie = stream_get_contents($pipes[1]) . stream_get_contents($pipes[2]);
        fclose($pipes[1]); fclose($pipes[2]);
        $code = proc_close($proc);
        if ($code !== 0) echo "\n" . $sortie . "\n";
        eq('fiches pays : regions, zones et superlatifs concordent', 0, $code);
    } else {
        check('fiches pays : controle de coherence lancable', false);
    }
}

// ════════════════════════════════════════════════════════
section('Le lexique du metier');

// Signale par un lecteur : « moho azul, qu'est-ce que c'est ? ». Le
// releve qui a suivi a trouve vingt-six termes de fabrication employes
// dans la prose sans qu'aucune phrase ne les explique.
//
// Ce qui peut se casser en silence :
//   — la table videe ou absente : la fiche se sert quand meme, avec un
//     bloc vide, ce qui ressemble a une fiche dont aucun terme n'est
//     reconnu (le piege documente pour `aromes` dans bootstrap.php) ;
//   — la detection faite sur la LANGUE SERVIE au lieu du francais :
//     elle marcherait en francais et nulle part ailleurs.
{
    $r = http('GET', $base . '/backend/data.php?action=brand&name='
                   . rawurlencode('Marque de test'), ['jar' => $anon]);
    $termes = $r['json']['brand']['lexique'] ?? null;
    check('lexique : la fiche marque en porte', is_array($termes) && count($termes) > 0);

    if (is_array($termes) && $termes) {
        $ids = array_column($termes, 'id');
        check('lexique : les termes employes sont reconnus',
              in_array('vitole', $ids, true) || in_array('cape', $ids, true));
        check('lexique : chaque entree porte terme ET definition',
              count(array_filter($termes, fn($x) => !empty($x['terme']) && !empty($x['definition'])))
              === count($termes));
        // Le plafond de six : sans lui, « cape » et « tripe » etant
        // partout, le bloc deviendrait un pave identique sur 118 fiches.
        check('lexique : six entrees au plus', count($termes) <= 6);
    }

    // LA detection se fait sur le francais, la restitution dans la langue
    // demandee. Un lexique qui disparait hors du francais serait le
    // symptome d'une detection faite apres traduction.
    $rd = http('GET', $base . '/backend/data.php?action=brand&name='
                    . rawurlencode('Marque de test') . '&lang=de', ['jar' => $anon]);
    $termesDe = $rd['json']['brand']['lexique'] ?? [];
    eq('lexique : autant de termes en allemand qu\'en francais',
       count($termes ?? []), count($termesDe));
    if ($termesDe) {
        $capeDe = null;
        foreach ($termesDe as $x) if ($x['id'] === 'cape') $capeDe = $x;
        if ($capeDe) {
            eq('lexique : le terme lui-meme est traduit', 'Deckblatt', $capeDe['terme']);
            check('lexique : la definition aussi',
                  str_contains($capeDe['definition'], 'Blatt'));
        }
    }
}

section('Les fiches de marques n\'affirment rien d\'invérifiable');

// L'inventaire des 116 maisons avait trouve 61 notes chiffrees attribuees
// a une source nommee — avec annee et vitole precises — dont aucune
// n'etait verifiable, et huit anecdotes mettant une phrase entre
// guillemets dans la bouche d'une personne reelle, dont une seule etait
// authentique.
//
// Les migrations 057 et 058 ont traite l'existant. Ce controle empeche le
// stock de se reconstituer : il exige `source_url` sur toute note, refuse
// toute parole pretee hors liste explicite, et verifie que les six
// colonnes de chaque tableau portent le meme nombre d'entrees — c'est ce
// dernier point qui avait trouve deux anecdotes invisibles hors du
// francais, la ou le controle du contenu avait echoue.
// ── Le contenu versé dans Git décrit-il encore la base ? ─
// `sql/contenu.sql` est ce qu'un déploiement neuf trouvera. S'il prend
// du retard, l'écart ne se voit nulle part : la base de développement a
// tout, et le fichier n'est lu que le jour de la mise en ligne. Ce
// contrôle le compare a la base a chaque campagne.
//
// Il LIT la base applicative (mysqldump), il ne l'écrit pas.
{
    $cmd = sprintf('%s -d xdebug.mode=off %s --verifier',
                   escapeshellarg(PHP_BINARY),
                   escapeshellarg(PROJECT_ROOT . '/tools/contenu_dump.php'));
    $pipes = [];
    $proc = proc_open($cmd, [1 => ['pipe', 'w'], 2 => ['pipe', 'w']], $pipes, PROJECT_ROOT);
    if (is_resource($proc)) {
        $sortie = stream_get_contents($pipes[1]) . stream_get_contents($pipes[2]);
        fclose($pipes[1]); fclose($pipes[2]);
        $code = proc_close($proc);
        if ($code !== 0) echo "\n" . $sortie . "\n";
        eq('deploiement : sql/contenu.sql decrit toujours la base', 0, $code);
    } else {
        check('deploiement : contenu_dump lancable', false);
    }
}

// ── Ce qui protege la production part-il avec le code ? ─
// Un fichier de protection qui n'est pas dans le depot ne protege que
// le poste ou il a ete ecrit. C'est arrive : `uploads/lounges/.htaccess`
// a ete corrige ici, et `.gitignore` l'excluait — la version reparee
// n'aurait jamais atteint la production, et rien ne l'aurait dit.
{
    $suivis = [];
    $code = 0;
    exec('git -C ' . escapeshellarg(PROJECT_ROOT) . ' ls-files 2>&1', $suivis, $code);
    if ($code !== 0) {
        check('depot : git interrogeable', false, implode(' ', array_slice($suivis, 0, 2)));
    } else {
        foreach (['.htaccess', 'uploads/.htaccess', 'uploads/lounges/.htaccess',
                  'robots.txt', 'legal.php', 'sql/schema.sql', 'sql/contenu.sql'] as $f) {
            check("depot : $f est suivi", in_array($f, $suivis, true));
        }
        // Le pendant : les images des membres n'ont RIEN a faire dans le
        // depot. Une exception trop large les y ferait entrer par
        // milliers, sans que personne s'en apercoive avant le premier
        // clone.
        $images = array_filter($suivis, fn($f) => str_starts_with($f, 'uploads/lounges/')
                                              && !str_ends_with($f, '.htaccess'));
        eq('depot : aucune image de membre versionnee', [], array_values($images));
    }
}

// ── Rien de personnel dans ce qui part en depot ─────────
// `sql/contenu.sql` est destine a un depot public ou partage, donc a
// etre lu par des gens qu'on ne choisit pas — et un depot garde tout,
// pour toujours.
//
// Le cas qui a motive ce controle n'etait pas theorique : une adresse IP
// publique reelle y a dormi depuis la creation du fichier, dans
// `lounge_photos.uploader_ip`. Le classement se faisait par TABLE, alors
// que c'est la COLONNE qui decide. Trouve en relisant avant le premier
// `push`, pas en ecrivant.
{
    $contenu = (string)@file_get_contents(PROJECT_ROOT . '/sql/contenu.sql');
    check('depot : sql/contenu.sql existe', $contenu !== '');

    // La liste des tables exclues est LUE dans l'outil, jamais recopiee :
    // recopiee, elle cesserait un jour de decrire ce que l'outil fait.
    defined('CONTENU_DUMP_INCLUDE') || define('CONTENU_DUMP_INCLUDE', true);
    require_once PROJECT_ROOT . '/tools/contenu_dump.php';
    define('CONTENU_EXCLUES_POUR_TEST', CONTENU_EXCLUES);

    // Adresses IPv4 entre quotes SQL. Les nombres nus (coordonnees,
    // annees, dimensions) ne ressemblent pas a cela.
    preg_match_all("/'((?:[0-9]{1,3}\.){3}[0-9]{1,3})'/", $contenu, $ip);
    eq('depot : aucune adresse IP dans le contenu verse', [], array_unique($ip[1]));

    // Les adresses electroniques, elles, ne se jugent PAS a leur forme.
    // La premiere version de ce controle refusait tout ce qui n'etait
    // pas du domaine du site, et accusait « bali@lacasadelhabano.id » —
    // le contact de La Casa del Habano a Legian. C'est precisement le
    // contenu qu'un atlas d'etablissements existe pour porter.
    //
    // Ce qui se verifie n'est donc pas le texte mais la PROVENANCE :
    // aucune table exclue ne doit apparaitre dans le fichier. Les
    // adresses de membres vivent dans `users` et `contributions` ; si
    // ces tables n'y sont pas, aucune ne peut s'y trouver.
    $intruses = [];
    foreach (array_keys(CONTENU_EXCLUES_POUR_TEST) as $t) {
        if (str_contains($contenu, "INSERT INTO `$t`")) $intruses[] = $t;
    }
    eq('depot : aucune table personnelle dans le contenu verse', [], $intruses);

    // Et aucun haché de mot de passe : `users` est hors du fichier, mais
    // une table ajoutee demain pourrait en porter un.
    check('depot : aucun hache de mot de passe', !str_contains($contenu, '$2y$'));
}

// ── Ou une sauvegarde a-t-elle le droit d'atterrir ? ────
// L'archive porte des comptes, des adresses et des messages. Deux
// endroits lui sont interdits, et j'ai failli n'en voir qu'un : un
// depot (elle y resterait pour toujours) et LA RACINE SERVIE.
//
// Le second est celui qui a manque a la premiere version du garde-fou.
// Mise a l'epreuve en visant docs/, elle a ecrit 5 Mo de donnees
// personnelles dans l'arborescence d'Apache — telechargeables par
// quiconque devine le nom. Le .gitignore du projet porte `*.zip` : le
// fichier etait invisible pour Git, et parfaitement visible pour le Web.
// « Hors de Git » ne suffit pas.
{
    define('SAUVEGARDE_INCLUDE', true);
    require_once PROJECT_ROOT . '/tools/sauvegarde.php';

    $cas = [
        [PROJECT_ROOT . '/docs',       true,  'un sous-dossier du site'],
        [PROJECT_ROOT,                 true,  'la racine du site elle-meme'],
        [PROJECT_ROOT . '/uploads',    true,  'le dossier meme qu\'elle sauvegarde'],
        [sys_get_temp_dir(),           false, 'un dossier temporaire, hors du site'],
        // Un chemin qui COMMENCE comme la racine sans etre dedans. Sans
        // separateur dans la comparaison, « …/cigareglobe-copie » serait
        // pris pour « …/cigareglobe » et refuse a tort.
        [PROJECT_ROOT . '-ailleurs',   false, 'un voisin au nom ressemblant'],
    ];
    foreach ($cas as [$dossier, $refuse, $libelle]) {
        $raison = sauv_destination_risquee(rtrim($dossier, '\\/')
                  . DIRECTORY_SEPARATOR . 'cigarodyssey-2000-01-01.zip');
        check('sauvegarde : ' . ($refuse ? 'refuse ' : 'accepte ') . $libelle,
              $refuse ? $raison !== null : $raison === null,
              (string)$raison);
    }
}

// ── La cle d'administration ─────────────────────────────
// Elle ouvre TOUT : langues, membres, roles, export, suppression
// definitive. Elle n'a ni second facteur ni journal d'echecs. Ce qui la
// fabrique merite donc d'etre eprouve — sur un fichier temporaire, et
// non sur le .env du poste.
{
    define('CLE_INCLUDE', true);
    require_once PROJECT_ROOT . '/tools/cle.php';

    $a = cle_engendrer();
    $b = cle_engendrer();
    eq('cle : 48 caracteres hexadecimaux', 48, strlen($a));
    check('cle : rien que du 0-9a-f', (bool)preg_match('/^[0-9a-f]{48}$/', $a));
    check('cle : deux tirages differents', $a !== $b);
    check('cle : l\'empreinte ne revele pas la cle',
          !str_contains(cle_empreinte($a), substr($a, 0, 6)));

    // Poser la cle ne doit RIEN abimer d'autre. Un .env reengendre
    // perdrait les commentaires qui disent pourquoi telle valeur est la.
    $tmp = tempnam(sys_get_temp_dir(), 'cgenv');
    file_put_contents($tmp, "# un commentaire\nDB_NAME=base\nADMIN_KEY=courte\nSITE_URL=https://exemple\n");
    [$ok, ] = cle_poser($tmp, $a);
    $apres = (string)file_get_contents($tmp);
    check('cle : la pose reussit', $ok);
    check('cle : la nouvelle valeur est ecrite', str_contains($apres, 'ADMIN_KEY=' . $a));
    check('cle : l\'ancienne a disparu',        !str_contains($apres, 'ADMIN_KEY=courte'));
    check('cle : le commentaire survit',         str_contains($apres, '# un commentaire'));
    check('cle : les voisines survivent',
          str_contains($apres, 'DB_NAME=base') && str_contains($apres, 'SITE_URL=https://exemple'));
    eq('cle : une seule ligne ADMIN_KEY', 1, substr_count($apres, 'ADMIN_KEY='));

    // Absente du fichier, elle doit etre AJOUTEE et non perdue en
    // silence : un .env sans ADMIN_KEY ferme l'administration.
    file_put_contents($tmp, "DB_NAME=base\n");
    cle_poser($tmp, $b);
    check('cle : ajoutee si le fichier n\'en portait pas',
          str_contains((string)file_get_contents($tmp), 'ADMIN_KEY=' . $b));
    @unlink($tmp);

    [$ko, $msg] = cle_poser(sys_get_temp_dir() . '/cg-inexistant-' . mt_rand() . '.env', $a);
    check('cle : un fichier absent est refuse, pas cree', $ko === false, $msg);
}

// ── Le deploiement ne doit pas pouvoir effacer la base ──
// `sql/schema.sql` commence par des DROP TABLE. Rejoue par reflexe sur
// une base qui vit, il emporte les comptes, les avis, les messages et
// le journal — c est-a-dire tout ce que le depot ne porte pas, et donc
// tout ce qu un `git pull` ne rendra jamais.
{
    $cmd = sprintf('%s -d xdebug.mode=off %s --autotest',
                   escapeshellarg(PHP_BINARY),
                   escapeshellarg(PROJECT_ROOT . '/tools/deployer.php'));
    $pipes = [];
    $proc = proc_open($cmd, [1 => ['pipe', 'w'], 2 => ['pipe', 'w']], $pipes, PROJECT_ROOT);
    if (is_resource($proc)) {
        $sortie = stream_get_contents($pipes[1]) . stream_get_contents($pipes[2]);
        fclose($pipes[1]); fclose($pipes[2]);
        $code = proc_close($proc);
        if ($code !== 0) echo "\n" . $sortie . "\n";
        eq('deploiement : les 8 cas construits du garde-fou tiennent', 0, $code);
    } else {
        check('deploiement : autotest lancable', false);
    }
}

// ── La visite se rafraichit, mais pas a chaque requete ──
// Une session dure tant qu'on ne se deconnecte pas : sans
// rafraichissement, quelqu'un connecte depuis trois mois n'aurait
// qu'une seule « derniere visite » et passerait pour inactif. Mais
// ecrire a CHAQUE appel couterait un UPDATE sur toute la navigation.
{
    // Antidatee de deux jours : la prochaine requete doit la rafraichir.
    test_pdo()->exec("UPDATE users SET last_login_at = NOW() - INTERVAL 2 DAY
                       WHERE email = 'alice@test.local'");
    http('GET', $base . '/backend/auth.php?action=me', ['jar' => $alice]);
    $apres = test_pdo()->query("SELECT last_login_at FROM users WHERE email='alice@test.local'")->fetchColumn();
    check('visite : une session ancienne est rafraichie',
          strtotime((string)$apres) > time() - 300, (string)$apres);

    // Fraiche : la requete suivante ne doit RIEN reecrire.
    $fige = date('Y-m-d H:i:s', time() - 3600);
    test_pdo()->prepare("UPDATE users SET last_login_at = ? WHERE email = 'alice@test.local'")
              ->execute([$fige]);
    http('GET', $base . '/backend/auth.php?action=me', ['jar' => $alice]);
    eq('visite : une visite du jour n\'est pas reecrite', $fige,
       test_pdo()->query("SELECT last_login_at FROM users WHERE email='alice@test.local'")->fetchColumn());
}

// ════════════════════════════════════════════════════════
section('La boite a suggestions');

// Elle est PUBLIQUE et SANS COMPTE : exiger inscription puis
// verification d'email avant de signaler un defaut, c'est n'en
// recueillir aucun. Un formulaire anonyme est donc un aimant a spam, et
// ce sont ses freins qu'il faut eprouver.
{
    test_pdo()->exec("DELETE FROM auth_attempts");
    test_pdo()->exec("DELETE FROM suggestions");
    $visiteur = new_client('visiteur');
    $envoi = fn(array $corps) => post_json($base, $visiteur, '/backend/suggestion.php', $corps);

    // ── Ce qui est refuse ────────────────────────────────
    $r = $envoi(['texte' => 'bug']);
    eq('suggestion : trop courte, refusee', 400, $r['status']);
    eq('suggestion : avec un code stable', 'suggestion_courte', $r['json']['code'] ?? null);

    $r = $envoi(['texte' => 'Allez voir https://exemple.com pour comprendre le probleme.']);
    eq('suggestion : un lien la fait refuser', 400, $r['status']);
    eq('suggestion : le refus du lien porte son code', 'suggestion_lien', $r['json']['code'] ?? null);

    $r = $envoi(['texte' => str_repeat('a', 4001)]);
    eq('suggestion : trop longue, refusee', 400, $r['status']);

    $r = $envoi(['texte' => 'Une remarque parfaitement valable et assez longue.',
                 'email' => 'pas-une-adresse']);
    eq('suggestion : une adresse invalide est refusee', 400, $r['status']);

    // Le leurre : on repond « success » sans rien ecrire. Dire au robot
    // qu'il est repere lui apprendrait a contourner le champ.
    $r = $envoi(['texte' => 'Un robot remplit tous les champs qu il trouve.', 'site' => 'x']);
    eq('suggestion : le leurre repond success', 201, $r['status']);
    eq('suggestion : mais n\'ecrit rien', 0,
       (int)test_pdo()->query("SELECT COUNT(*) FROM suggestions")->fetchColumn());

    // ── LES ERREURS DE SAISIE NE COUTENT PAS DE QUOTA ────
    // Le plafond etait pose AVANT les validations : trois messages trop
    // courts bloquaient une heure, sur des tentatives legitimes qui
    // n'avaient rien ecrit. Constate au premier essai du formulaire, ou
    // le quatrieme envoi — valide, celui-la — s'est fait refuser.
    $r = $envoi(['texte' => 'Le globe tourne trop vite sur mobile, on ne vise rien.',
                 'email' => 'lecteur@exemple.fr', 'page' => '/fr/', 'lang' => 'fr']);
    eq('suggestion : apres cinq refus, un envoi valide passe', 201, $r['status']);

    $s = test_pdo()->query("SELECT * FROM suggestions ORDER BY id DESC LIMIT 1")->fetch(PDO::FETCH_ASSOC);
    eq('suggestion : le texte est garde',     'Le globe tourne trop vite sur mobile, on ne vise rien.', $s['texte']);
    eq('suggestion : l\'adresse aussi',       'lecteur@exemple.fr', $s['email']);
    // Le contexte, que personne ne pense a donner : « ca ne marche pas »
    // sans savoir ou est inexploitable.
    eq('suggestion : la page est retenue',    '/fr/', $s['page']);
    eq('suggestion : la langue aussi',        'fr',   $s['lang']);
    eq('suggestion : elle arrive non traitee', 0,     (int)$s['traite']);

    // Une langue inconnue ne doit pas entrer telle quelle en base.
    $envoi(['texte' => 'Une remarque avec une langue inventee par l appelant.', 'lang' => 'xx']);
    eq('suggestion : une langue inconnue est ecartee', null,
       test_pdo()->query("SELECT lang FROM suggestions ORDER BY id DESC LIMIT 1")->fetchColumn() ?: null);

    // ── Le plafond, lui, compte les envois REELS ─────────
    $envoi(['texte' => 'Un troisieme envoi valide, celui-ci doit encore passer.']);
    $r = $envoi(['texte' => 'Le quatrieme doit buter sur le plafond horaire.']);
    eq('suggestion : trois envois par heure, le quatrieme refuse', 429, $r['status']);

    // Sans jeton CSRF, rien ne passe — meme sans compte.
    $r = http('POST', $base . '/backend/suggestion.php',
              ['jar' => $visiteur, 'json' => ['texte' => 'Une remarque sans jeton de securite.']]);
    eq('suggestion : le jeton CSRF reste exige', 419, $r['status']);

    test_pdo()->exec("DELETE FROM suggestions");
    test_pdo()->exec("DELETE FROM auth_attempts");
}

// ════════════════════════════════════════════════════════
section('Le didacticiel');

// CE QUE CE BLOC SURVEILLE VRAIMENT. Une visite guidee ne tombe pas en
// panne bruyamment : elle continue de s'ouvrir, et designe du vide.
// Renommer #accountBtn en #compteBtn ne casse RIEN de visible — sauf la
// fleche qui pointait dessus, et personne ne s'en apercoit avant qu'un
// visiteur le signale. D'ou une verification qui relie les selecteurs
// du didacticiel aux identifiants qui existent pour de bon.
{
    $tuto = file_get_contents(PROJECT_ROOT . '/assets/js/tutoriel.js');
    $html = file_get_contents(PROJECT_ROOT . '/index.html');
    $css  = file_get_contents(PROJECT_ROOT . '/assets/css/account.css');

    check('didacticiel : le module est charge par la page',
          str_contains($html, 'assets/js/tutoriel.js'));

    // L'ORDRE COMPTE. Les boutons 🔍 et 🗺 sont poses par leurs modules ;
    // charge avant eux, le didacticiel ne trouverait que le globe et se
    // tairait (moins de deux etapes = pas de visite).
    $rang = fn(string $f) => strpos($html, "assets/js/$f");
    check('didacticiel : elle est chargee apres les modules qui posent les boutons',
          $rang('tutoriel.js') > $rang('explorer.js') &&
          $rang('tutoriel.js') > $rang('search.js'));

    check('didacticiel : le portail d\'age la declenche',
          str_contains(file_get_contents(PROJECT_ROOT . '/assets/js/agegate.js'),
                       'tutoriel.apresPortail'));

    check('didacticiel : elle est rejouable depuis le menu mobile',
          str_contains($html, 'id="mm-tuto"'));

    // ── Les identifiants existants ──────────────────────
    // Deux sources : le HTML, et les modules qui creent leurs boutons
    // a la volee (search.js et explorer.js posent #search-btn et
    // #explorer-btn). Ne regarder que le HTML accuserait a tort.
    $ids = [];
    if (preg_match_all('/\bid="([A-Za-z0-9_-]+)"/', $html, $m)) {
        foreach ($m[1] as $i) $ids[$i] = true;
    }
    foreach (glob(PROJECT_ROOT . '/assets/js/*.js') as $f) {
        if (preg_match_all("/\.id\s*=\s*'([A-Za-z0-9_-]+)'/", file_get_contents($f), $m)) {
            foreach ($m[1] as $i) $ids[$i] = true;
        }
    }
    check('didacticiel : le releve des identifiants a bien trouve la page',
          count($ids) > 40, count($ids) . ' identifiant(s)');

    // ── Chaque cible designe quelque chose ──────────────
    preg_match_all("/cibles:\s*\[([^\]]+)\]/", $tuto, $m);
    $cibles = [];
    foreach ($m[1] as $liste) {
        if (preg_match_all("/'#([A-Za-z0-9_-]+)'/", $liste, $mm)) {
            foreach ($mm[1] as $c) $cibles[] = $c;
        }
    }
    check('didacticiel : au moins six cibles sont declarees', count($cibles) >= 6,
          count($cibles) . ' trouvee(s)');

    $orphelines = array_values(array_filter($cibles, fn($c) => !isset($ids[$c])));
    eq('didacticiel : aucune cible ne pointe un element inexistant', [], $orphelines);

    // CONTRE-EPREUVE. Le controle ci-dessus ne vaut que s'il sait dire
    // non : une cible inventee doit etre reperee. Sans elle, un releve
    // d'identifiants trop large validerait n'importe quoi.
    check('didacticiel : une cible inventee serait bien reperee',
          !isset($ids['bouton-qui-nexiste-pas']));

    // ── Chaque etape a ses deux textes ──────────────────
    preg_match_all("/cle:\s*'(tuto_[a-z]+)'/", $tuto, $m);
    $etapes = array_unique($m[1]);
    check('didacticiel : six etapes sont declarees', count($etapes) === 6,
          implode(', ', $etapes));

    $trad = i18n_parse(PROJECT_ROOT . '/assets/js/i18n.js');
    $sansTexte = [];
    foreach ($etapes as $e) {
        foreach (['_t', '_d'] as $suffixe) {
            if (empty($trad['fr'][$e . $suffixe])) $sansTexte[] = $e . $suffixe;
        }
    }
    eq('didacticiel : chaque etape a son titre et son texte', [], $sansTexte);

    // Les libelles de navigation, sans lesquels la bulle aurait des
    // boutons vides. La parite i18n couvre ensuite les cinq autres langues.
    $sansLibelle = [];
    foreach (['tuto_suivant', 'tuto_passer', 'tuto_terminer', 'tuto_etape',
              'tuto_revoir', 'tuto_aide'] as $k) {
        if (empty($trad['fr'][$k])) $sansLibelle[] = $k;
    }
    eq('didacticiel : les libelles de navigation sont traduits', [], $sansLibelle);

    // Le compteur d'etapes se remplit a l'execution : sans ses deux
    // marques, il annoncerait « Etape {n} sur {total} » tel quel.
    check('didacticiel : le compteur porte ses deux marques',
          str_contains($trad['fr']['tuto_etape'], '{n}') &&
          str_contains($trad['fr']['tuto_etape'], '{total}'));

    // ── Elle ne s'impose pas ────────────────────────────
    check('didacticiel : une adresse avec parametres l\'ecarte',
          str_contains($tuto, 'window.location.search.length > 1'));
    check('didacticiel : elle ne se montre qu\'une fois',
          str_contains($tuto, "'cg_tuto'") && str_contains($tuto, 'marquerVu'));
    check('didacticiel : passer vaut avoir vu',
          preg_match('/function fermer\(\)\s*\{\s*(\/\/[^\n]*\n\s*)*marquerVu\(\);/', $tuto) === 1);

    // ── La legende des reperes ──────────────────────────
    // Le site n'a AUCUNE legende : celle du bas de page a disparu, seul
    // son CSS a survecu (.bbar / .legend dans components.css, que plus
    // rien ne remplit). La derniere etape est donc le seul endroit qui
    // explique pourquoi un pays porte une pastille et un autre un
    // triangle. Ses quatre lignes doivent exister — et etre DESSINEES,
    // car « triangle violet » se cherche encore une fois l'ecran revenu.
    $sansLegende = [];
    foreach (['prod', 'mixte', 'lounge', 'marche'] as $l) {
        if (empty($trad['fr']['tuto_leg_' . $l]))       $sansLegende[] = "texte $l";
        if (!str_contains($css, '.tuto-m-' . $l))       $sansLegende[] = "marque $l";
    }
    eq('didacticiel : les quatre reperes ont texte et marque dessinee', [], $sansLegende);

    // Les teintes de la legende sont celles de la BASE, pas des
    // approximations : une legende qui ment est pire qu'une absente.
    $teintes = [];
    foreach (['#C0401A', '#B8860B', '#3D6B4A', '#8B2BE2'] as $c) {
        if (!str_contains($css, $c)) $teintes[] = $c;
    }
    eq('didacticiel : la legende reprend les teintes du globe', [], $teintes);
}

// ════════════════════════════════════════════════════════
section('Les onglets sans pays choisi');

// CE QUE CE BLOC SURVEILLE. Sur mobile, Infos / Marques / Lounges se
// touchent AVANT d'avoir choisi un pays — c'est meme le geste naturel.
// On y trouvait un bandeau gris, une croix, et une page blanche : pas
// « vide », casse. Rien ne disait qu'il manquait un choix, ni ou le
// faire.
{
    $vide = file_get_contents(PROJECT_ROOT . '/assets/js/panneau-vide.js');
    $html = file_get_contents(PROJECT_ROOT . '/index.html');
    $app  = file_get_contents(PROJECT_ROOT . '/assets/js/app.js');

    check('onglets vides : le module est charge par la page',
          str_contains($html, 'assets/js/panneau-vide.js'));
    check('onglets vides : la bascule d\'onglet l\'appelle',
          str_contains($app, 'window.panneauVide(tab)'));

    // Les identifiants vises doivent exister : renommer #lexBody ne
    // casserait rien de visible — sauf cet ecran, qui se remplirait
    // dans le vide.
    $ids = [];
    if (preg_match_all('/\bid="([A-Za-z0-9_-]+)"/', $html, $m)) {
        foreach ($m[1] as $i) $ids[$i] = true;
    }
    preg_match_all("/(?:aside|corps):\s*'([A-Za-z0-9_-]+)'/", $vide, $m);
    check('onglets vides : six identifiants sont vises', count($m[1]) === 6,
          implode(', ', $m[1]));
    $orphelins = array_values(array_filter($m[1], fn($c) => !isset($ids[$c])));
    eq('onglets vides : aucun ne pointe un element inexistant', [], $orphelins);

    // UN ECRAN QUI EXPLIQUE SANS OFFRIR DE SORTIE laisse exactement ou
    // l'on etait. Le bouton doit ramener au globe, la ou le choix se fait.
    check('onglets vides : l\'ecran offre le geste qui repare',
          str_contains($vide, "switchMobileTab('globe')"));

    // Trois messages distincts : on ne cherche pas un lounge comme on
    // cherche une manufacture. Un texte unique aurait suffi a « ne pas
    // etre vide » sans rien apprendre.
    $trad = i18n_parse(PROJECT_ROOT . '/assets/js/i18n.js');
    $manque = [];
    foreach (['vide_titre', 'vide_lex', 'vide_panel', 'vide_lounge', 'vide_action'] as $k) {
        if (empty($trad['fr'][$k])) $manque[] = $k;
    }
    eq('onglets vides : les cinq libelles sont traduits', [], $manque);
    // Le panneau reste ouvert pendant qu'on change de langue depuis le
    // menu : sans data-i18n, son texte resterait dans l'ancienne.
    check('onglets vides : le texte suit un changement de langue',
          str_contains($vide, 'data-i18n="vide_titre"') &&
          str_contains($vide, 'data-i18n="vide_action"'));
    check('onglets vides : les trois messages different',
          count(array_unique([$trad['fr']['vide_lex'], $trad['fr']['vide_panel'],
                              $trad['fr']['vide_lounge']])) === 3);

    // Le bandeau se replie faute de drapeau et de nom a montrer, MAIS
    // la croix reste : c'est la seule sortie du panneau pour qui n'a pas
    // compris la barre du bas.
    $css = file_get_contents(PROJECT_ROOT . '/assets/css/components.css');
    check('onglets vides : le bandeau se replie', str_contains($css, '.est-vide .lex-banner'));
    check('onglets vides : la croix de fermeture n\'est pas masquee',
          !preg_match('/\.est-vide[^{]*\.(lex-close|panel-close)/', $css) &&
          !str_contains($css, '.est-vide #lexClose'));
}

// ── Un envoi rate laisse-t-il une trace ? ───────────────
// Le cas construit : on force un pilote HTTP avec une cle invalide, et
// on verifie que l'echec est DIT — au journal, et a la personne. C'est
// exactement ce qui s'est produit en production, et que rien ne
// signalait : compte cree, « verifiez vos emails », aucun email.
{
    $srv = start_server(['MAIL_LOG_ONLY' => 'false', 'MAIL_DRIVER' => 'brevo',
                         'MAIL_API_KEY' => 'xkeysib-invalide-pour-le-test']);
    test_pdo()->exec("DELETE FROM auth_attempts");
    $cli = new_client('mailrate');
    $r = post_json($srv, $cli, '/backend/auth.php?action=register',
                   ['email' => 'sansmail@test.local', 'password' => 'motdepasse8',
                    'display_name' => 'Sans Mail']);

    eq('envoi rate : le compte est quand meme cree', 201, $r['status']);
    eq('envoi rate : et la reponse ne le cache pas', false, $r['json']['email_envoye'] ?? null);

    $uid = (int)test_pdo()->query("SELECT id FROM users WHERE email='sansmail@test.local'")->fetchColumn();
    $j = test_pdo()->query("SELECT action, detail FROM moderation_log
                            WHERE cible_type='compte' AND cible_id=$uid
                              AND action='email_verification_echoue'")->fetch(PDO::FETCH_ASSOC);
    check('envoi rate : le journal le retient', (bool)$j);
    // Le detail doit porter la REPONSE DU PRESTATAIRE. « echec » tout
    // court aurait laisse chercher une heure ; « HTTP 401 » designe la
    // cause en une minute.
    check('envoi rate : avec la raison, pas juste « echec »',
          $j && (str_contains($j['detail'], 'brevo') || str_contains($j['detail'], 'HTTP')),
          (string)($j['detail'] ?? ''));

    test_pdo()->exec("DELETE FROM users WHERE email='sansmail@test.local'");
    test_pdo()->exec("DELETE FROM auth_attempts");
}

// ── Le controle d'avant-vol se prouve-t-il ? ────────────
// prevol.php ne peut pas etre lance tel quel ici : sur un poste de
// developpement il DOIT crier, c'est son travail. On eprouve donc ses
// controles sur des environnements construits — un propre, et un piege
// par defaut connu. Deux echecs possibles, et le second compte autant
// que le premier : ne pas voir un defaut, ou crier sur un reglage sain.
{
    $cmd = sprintf('%s -d xdebug.mode=off %s --autotest',
                   escapeshellarg(PHP_BINARY),
                   escapeshellarg(PROJECT_ROOT . '/tools/prevol.php'));
    $pipes = [];
    $proc = proc_open($cmd, [1 => ['pipe', 'w'], 2 => ['pipe', 'w']], $pipes, PROJECT_ROOT);
    if (is_resource($proc)) {
        $sortie = stream_get_contents($pipes[1]) . stream_get_contents($pipes[2]);
        fclose($pipes[1]); fclose($pipes[2]);
        $code = proc_close($proc);
        if ($code !== 0) echo "\n" . $sortie . "\n";
        eq('avant-vol : les 17 cas construits restent conformes', 0, $code);
    } else {
        check('avant-vol : autotest lancable', false);
    }
}

// ── Ce que la racine web ne doit pas servir ─────────────
// Ces regles ne s'eprouvent que sous Apache — `php -S` ignore le
// .htaccess. Le controle lit donc le FICHIER, et verifie que les regles
// qui ont ete mesurees a l'ecran y sont toujours.
//
// Ce qu'elles ferment, et pourquoi ca comptait : `<FilesMatch "^\.">`
// ne filtre que les NOMS DE FICHIERS. Dans « /.git/config » le nom est
// « config » — Apache servait donc l'historique complet du depot des
// lors qu'on deployait par `git clone` dans la racine web, ce qui est
// justement la methode la plus commode.
{
    /**
     * Le contenu d'un fichier de configuration, SANS ses commentaires.
     *
     * Troisieme occurrence du meme piege dans ce projet : un controle
     * qui cherche un marqueur dans tout un fichier finit par le trouver
     * dans le commentaire qui explique pourquoi il ne doit pas y etre.
     * Deja vu avec `includeSubDomains` (HSTS) et « A COMPLETER »
     * (legal.php). Un fichier bien commente contient necessairement les
     * mots de ce qu'il refuse.
     */
    $sans_commentaires = function (string $chemin): string {
        $lignes = array_filter(
            explode("\n", (string)@file_get_contents($chemin)),
            fn($l) => !str_starts_with(ltrim($l), '#')
        );
        return implode("\n", $lignes);
    };

    $ht = $sans_commentaires(PROJECT_ROOT . '/.htaccess');

    check('racine web : les dossiers caches sont fermes',
          (bool)preg_match('/RewriteRule\s+"\(\^\|\/\)\\\\\.\(\?!well-known/', $ht));
    check('racine web : .well-known reste ouvert au renouvellement TLS',
          str_contains($ht, 'well-known'));
    check('racine web : sql/ et docs/ sont fermes',
          (bool)preg_match('/RewriteRule\s+"\^\(sql\|docs\)\//', $ht));

    // mod_alias n'est pas charge partout : `RedirectMatch` faisait
    // repondre 500 a TOUT le site, page d'accueil comprise — Apache
    // rejette le fichier entier, pas la seule ligne fautive. La regle
    // doit donc passer par mod_rewrite, deja employe pour les langues.
    check('racine web : la regle passe par mod_rewrite, eprouvable',
          !str_contains($ht, 'RedirectMatch'));

    // Les deux dossiers qui portent leur propre .htaccess : sans eux,
    // tools/cle.php et tests/run.php seraient servis en clair.
    foreach (['tests', 'tools', 'uploads', 'uploads/lounges'] as $d) {
        check("racine web : $d/.htaccess est present",
              is_file(PROJECT_ROOT . '/' . $d . '/.htaccess'));
    }
}

// ── L'en-tete qui engage un an ──────────────────────────
{
    $ht = (string)file_get_contents(PROJECT_ROOT . '/.htaccess');
    check('production : HSTS declare', str_contains($ht, 'Strict-Transport-Security'));
    check('production : HSTS conditionne au TLS',
          preg_match('/%\{HTTPS\}\s*==\s*\'on\'/', $ht) === 1);
    // Ces deux options ne se retirent pas : includeSubDomains engage des
    // sous-domaines qui n'existent pas encore, preload s'inscrit dans
    // les navigateurs eux-memes. Les ajouter doit CASSER ce controle,
    // pour que ce soit une decision et non un reflexe.
    //
    // On lit la DIRECTIVE, pas le fichier : le commentaire au-dessus
    // nomme justement ces deux options pour dire pourquoi elles sont
    // absentes, et un simple str_contains() sur le tout accusait donc
    // l'explication elle-meme.
    preg_match_all('/^[^#\n]*Strict-Transport-Security[^\n]*$/m', $ht, $m);
    $directive = implode("\n", $m[0]);
    check('production : la directive HSTS est bien la', $directive !== '');
    check('production : ni includeSubDomains ni preload sans decision explicite',
          !str_contains($directive, 'includeSubDomains') && !str_contains($directive, 'preload'));
}

// Le detecteur de paroles pretees a echoue CINQ fois : verbe apres la
// citation, incise, citation courte, apostrophe d'elision prise pour un
// guillemet, verbe absent de la liste. Un passage vert sur le corpus du
// jour ne dit rien de sa sante — il dit qu'il n'y a pas de defaut
// aujourd'hui. `--autotest` le confronte aux douze cas qu'il a deja
// rates ou sur lesquels il s'est deja trompe.
{
    $cmd = sprintf('%s -d xdebug.mode=off %s --autotest',
                   escapeshellarg(PHP_BINARY),
                   escapeshellarg(PROJECT_ROOT . '/tools/marques_check.php'));
    $pipes = [];
    $proc = proc_open($cmd, [1 => ['pipe', 'w'], 2 => ['pipe', 'w']], $pipes, PROJECT_ROOT);
    if (is_resource($proc)) {
        $sortie = stream_get_contents($pipes[1]) . stream_get_contents($pipes[2]);
        fclose($pipes[1]); fclose($pipes[2]);
        $code = proc_close($proc);
        if ($code !== 0) echo "\n" . $sortie . "\n";
        eq('parole pretee : les 12 cas construits restent conformes', 0, $code);
    } else {
        check('parole pretee : autotest lancable', false);
    }
}

{
    $cmd = sprintf('%s -d xdebug.mode=off %s',
                   escapeshellarg(PHP_BINARY),
                   escapeshellarg(PROJECT_ROOT . '/tools/marques_check.php'));
    $pipes = [];
    $proc = proc_open($cmd, [1 => ['pipe', 'w'], 2 => ['pipe', 'w']], $pipes, PROJECT_ROOT);
    if (is_resource($proc)) {
        $sortie = stream_get_contents($pipes[1]) . stream_get_contents($pipes[2]);
        fclose($pipes[1]); fclose($pipes[2]);
        $code = proc_close($proc);
        if ($code !== 0) echo "\n" . $sortie . "\n";
        eq('marques : aucune note sans source, aucune parole pretee', 0, $code);
    } else {
        check('marques : controle lancable', false);
    }
}

// Des colonnes espagnoles, allemandes, chinoises et arabes contiennent de
// l'ANGLAIS — le texte anglais entier, recopie tel quel dans les quatre
// langues. `i18n_fraicheur` ne pouvait pas le voir : une case remplie
// d'anglais est remplie, et scellee sur le bon francais. La traduction
// existe, elle est juste dans la mauvaise langue.
//
// 691 elements sont concernes, pour ~131 000 caracteres a retraduire :
// c'est un chantier de plusieurs passes. Le controle fonctionne donc au
// CLIQUET — il echoue si un element NOUVEAU apparait, et le compte ne
// peut que descendre.
{
    $cmd = sprintf('%s -d xdebug.mode=off %s',
                   escapeshellarg(PHP_BINARY),
                   escapeshellarg(PROJECT_ROOT . '/tools/i18n_langue_check.php'));
    $pipes = [];
    $proc = proc_open($cmd, [1 => ['pipe', 'w'], 2 => ['pipe', 'w']], $pipes, PROJECT_ROOT);
    if (is_resource($proc)) {
        $sortie = stream_get_contents($pipes[1]) . stream_get_contents($pipes[2]);
        fclose($pipes[1]); fclose($pipes[2]);
        $code = proc_close($proc);
        if ($code !== 0) echo "\n" . $sortie . "\n";
        eq('traductions : aucune nouvelle colonne remplie d\'anglais', 0, $code);
    } else {
        check('traductions : controle de langue lancable', false);
    }
}

// ── Une phrase anglaise deguisee en traduction ──────────
//
// Le controle precedent cherche des MOTS-OUTILS anglais d'une liste
// fixe. La colonne `gamme_es` de Montecristo disait « One of el más
// codiciado cigars among European coleccionistas » : pas un seul mot de
// cette liste, et il y en aura toujours un de plus.
//
// `i18n_melange_check` ne cherche plus des mots precis mais un RAPPORT
// DE FORCE, phrase par phrase : quand les mots-outils anglais tiennent
// tete a ceux de la langue attendue, la phrase est de l'anglais
// maquille. Zero est la seule valeur acceptable — ce n'est pas un
// chantier a etaler, et la base y est depuis la migration 127.
//
// Le controle verifie aussi ses propres cas construits a chaque
// passage : une base propre ne prouve pas qu'un detecteur fonctionne.
{
    $cmd = sprintf('%s -d xdebug.mode=off %s',
                   escapeshellarg(PHP_BINARY),
                   escapeshellarg(PROJECT_ROOT . '/tools/i18n_melange_check.php'));
    $pipes = [];
    $proc = proc_open($cmd, [1 => ['pipe', 'w'], 2 => ['pipe', 'w']], $pipes, PROJECT_ROOT);
    if (is_resource($proc)) {
        $sortie = stream_get_contents($pipes[1]) . stream_get_contents($pipes[2]);
        fclose($pipes[1]); fclose($pipes[2]);
        $code = proc_close($proc);
        if ($code !== 0) echo "\n" . $sortie . "\n";
        eq('traductions : aucune phrase anglaise deguisee', 0, $code);
    } else {
        check('traductions : controle de melange lancable', false);
    }
}

// ── Une traduction affirme-t-elle un rang que sa source ne fait pas ?
//
// La fiche Atabey disait, du Cohiba Behike : « le cigare dont le prix a
// marque une RUPTURE pour l'industrie cubaine » en francais, et « el
// cigarro MAS CARO JAMAS LANZADO » en espagnol. Quatre langues sur six
// affirmaient un classement que la source ne fait pas.
//
// Le detecteur de rangs de `marques_check` ne pouvait pas le voir : il
// cherche le MONDE, et la borne etait ici l'industrie cubaine — la forme
// meme qu'il tient pour inoffensive quand la SOURCE l'assume.
//
// `i18n_superlatif_check` compare donc les superlatifs d'une traduction
// a ceux de son francais, et ne regarde que l'ECART. Cliquet : il echoue
// si un ecart NOUVEAU apparait.
{
    $cmd = sprintf('%s -d xdebug.mode=off %s',
                   escapeshellarg(PHP_BINARY),
                   escapeshellarg(PROJECT_ROOT . '/tools/i18n_superlatif_check.php'));
    $pipes = [];
    $proc = proc_open($cmd, [1 => ['pipe', 'w'], 2 => ['pipe', 'w']], $pipes, PROJECT_ROOT);
    if (is_resource($proc)) {
        $sortie = stream_get_contents($pipes[1]) . stream_get_contents($pipes[2]);
        fclose($pipes[1]); fclose($pipes[2]);
        $code = proc_close($proc);
        if ($code !== 0) echo "\n" . $sortie . "\n";
        eq('traductions : aucun rang que la source ne fait pas', 0, $code);
    } else {
        check('traductions : controle des superlatifs lancable', false);
    }
}

// ── Une traduction dit-elle ce que dit sa source ? ──────
//
// `i18n_fraicheur` repond a « le francais a-t-il bouge depuis ? » et
// affiche 100 %. Il ne repond pas a « la traduction dit-elle la meme
// chose ? », et personne ne le faisait.
//
// `i18n_divergence` pose la seconde question par deux mesures qui ne
// demandent pas de lire les six langues : le VOLUME rapporte a la
// mediane de chaque langue, et les DATES qu'une traduction affirme sans
// que sa source les contienne.
//
// C'est ainsi qu'ont ete trouvees la note de presse arabe d'Alec Bradley
// — revue, rang et points, dans une langue seulement — et le « Melanio
// en 2014 » d'Oliva, un cigare qu'aucune autre colonne ne mentionne.
//
// Au CLIQUET lui aussi : 248 ecarts de volume connus, dont les 40 fiches
// ou `history_en` est un texte autonome. Le compte ne peut que descendre.
{
    $cmd = sprintf('%s -d xdebug.mode=off %s',
                   escapeshellarg(PHP_BINARY),
                   escapeshellarg(PROJECT_ROOT . '/tools/i18n_divergence.php'));
    $pipes = [];
    $proc = proc_open($cmd, [1 => ['pipe', 'w'], 2 => ['pipe', 'w']], $pipes, PROJECT_ROOT);
    if (is_resource($proc)) {
        $sortie = stream_get_contents($pipes[1]) . stream_get_contents($pipes[2]);
        fclose($pipes[1]); fclose($pipes[2]);
        $code = proc_close($proc);
        if ($code !== 0) echo "\n" . $sortie . "\n";
        eq('traductions : aucun fait nouveau affirme hors de la source', 0, $code);
    } else {
        check('traductions : controle de divergence lancable', false);
    }
}

// ════════════════════════════════════════════════════════
section('La campagne n\'a rien touche hors de sa base');

// Un test qui ecrit dans la base APPLICATIVE ne se voit pas : il passe,
// et c'est le site de developpement qui change de comportement des
// heures plus tard. C'est arrive — la campagne a ferme quatre langues
// sur le vrai site, et le defaut ne s'est vu qu'en ouvrant la page.
//
// Ce controle final compare l'etat de la base applicative a ce qu'il
// doit etre : les six langues servies. Il ne repare rien, il ALERTE —
// une reparation automatique masquerait la fuite au lieu de la dire.
try {
    $app = new PDO(
        sprintf('mysql:host=%s;port=%s;dbname=%s;charset=utf8mb4', DB_HOST, DB_PORT, DB_NAME),
        DB_USER, DB_PASS,
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC]
    );
    $fermees = $app->query("SELECT code FROM site_languages WHERE is_active = 0")
                   ->fetchAll(PDO::FETCH_COLUMN);
    eq('base applicative : aucune langue fermee par la campagne', [], $fermees);
} catch (Throwable $e) {
    // Table absente : base applicative pas encore migree, rien a dire.
    check('base applicative : controle possible', true);
}

report_and_exit();

/**
 * Pilote retenu pour un environnement donne. Les constantes de
 * configuration etant figees a la premiere inclusion, chaque variante se
 * mesure dans un processus separe.
 *
 * LES VALEURS PASSENT PAR LES ARGUMENTS, PAS PAR L'ENVIRONNEMENT.
 * Une variable d'environnement VIDE ne traverse pas proc_open de facon
 * fiable sous Windows : la sonde retombait alors sur le `.env` du poste
 * et mesurait la configuration du developpeur au lieu du cas construit.
 * Le defaut est reste invisible tant que ce `.env` portait une
 * MAIL_API_KEY vide — c'est-a-dire tant que le hasard donnait la bonne
 * reponse. Il s'est revele le jour ou une vraie cle y a ete posee.
 */
function probe_mail_driver(array $vars): string {
    $cmd = sprintf('%s -d xdebug.mode=off %s %s %s',
                   escapeshellarg(PHP_BINARY),
                   escapeshellarg(PROJECT_ROOT . '/tests/probe_mail_driver.php'),
                   escapeshellarg((string)($vars['MAIL_DRIVER']  ?? '')),
                   escapeshellarg((string)($vars['MAIL_API_KEY'] ?? '')));
    $env = ['SystemRoot' => getenv('SystemRoot') ?: '', 'PATH' => getenv('PATH') ?: ''];
    $pipes = [];
    $proc = proc_open($cmd, [1 => ['pipe', 'w'], 2 => ['pipe', 'w']], $pipes, PROJECT_ROOT, $env);
    if (!is_resource($proc)) return '';
    $out = stream_get_contents($pipes[1]);
    fclose($pipes[1]); fclose($pipes[2]);
    proc_close($proc);
    return trim((string)$out);
}
