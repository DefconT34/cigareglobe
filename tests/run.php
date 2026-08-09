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
