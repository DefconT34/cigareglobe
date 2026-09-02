<?php
// ════════════════════════════════════════════════════════
// auth.php — API d'authentification CigarOdyssey (Étape A)
// ────────────────────────────────────────────────────────
// Actions :
//   GET  ?action=me         → { user|null, csrf }
//   POST ?action=register   { email, password, display_name }
//   GET  ?action=verify&token=…   (lien email → redirige vers le site)
//   POST ?action=login      { email, password }
//   POST ?action=logout
//   POST ?action=forgot     { email }
//   POST ?action=reset      { token, password }
//   POST ?action=resend     (renvoi de vérification, connecté)
// Toutes les requêtes POST exigent l'en-tête X-CSRF-Token
// (obtenu via GET ?action=me).
// ════════════════════════════════════════════════════════

require_once __DIR__ . '/auth_lib.php';
require_once __DIR__ . '/mailer.php';
// journaliser() : un email de vérification qui ne part pas est un fait
// qui doit se relire, pas un silence.
require_once __DIR__ . '/moderation_lib.php';

auth_session_start();

cors_headers(true);
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, X-CSRF-Token');

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') { http_response_code(204); exit; }

$action = $_GET['action'] ?? '';
$method = $_SERVER['REQUEST_METHOD'];
$db     = getDB();

// Les POST modifiant l'état exigent un CSRF valide
$POST_ACTIONS = ['register','login','logout','forgot','reset','resend','delete_account'];
if (in_array($action, $POST_ACTIONS, true)) {
    if ($method !== 'POST') respond(err('method_not_allowed', 'Méthode non autorisée'), 405);
    csrf_verify();
}

try {
    switch ($action) {
        case 'me':       action_me($db);       break;
        case 'register': action_register($db); break;
        case 'verify':   action_verify($db);   break;
        case 'login':    action_login($db);    break;
        case 'logout':   action_logout();      break;
        case 'forgot':   action_forgot($db);   break;
        case 'reset':    action_reset($db);    break;
        case 'resend':   action_resend($db);   break;
        case 'delete_account': action_delete_account($db); break;
        default:         respond(err('unknown_action', 'Action inconnue'), 404);
    }
} catch (Throwable $e) {
    respond(err('server_error', 'Erreur serveur'), 500);
}

// ════════════════════════════════════════════════════════
// GET me — état de session + jeton CSRF
// ════════════════════════════════════════════════════════
function action_me(PDO $db): void {
    $u = current_user($db);
    respond([
        'user' => $u ? user_public($u) : null,
        'csrf' => csrf_get(),
    ]);
}

// ════════════════════════════════════════════════════════
// POST register
// ════════════════════════════════════════════════════════
function action_register(PDO $db): void {
    rate_limit($db, 'register', 5, 3600);

    $b     = json_body();
    $email = strtolower(trim($b['email'] ?? ''));
    $pass  = (string)($b['password'] ?? '');
    $name  = trim($b['display_name'] ?? '');

    if (!valid_email($email))         respond(err('email_invalid', 'Adresse email invalide.'), 400);
    if ($name === '' || mb_strlen($name) > 80) respond(err('name_required', 'Nom d\'affichage requis (max 80 caractères).'), 400);
    if ($err = password_error($pass)) respond(['error' => $err], 400);

    // Email déjà utilisé ?
    $chk = $db->prepare("SELECT id FROM users WHERE email = ?");
    $chk->execute([$email]);
    if ($chk->fetch()) respond(err('email_taken', 'Un compte existe déjà avec cet email.'), 409);

    // Langue de correspondance (migration 014) : celle du site au moment
    // de l'inscription, sinon celle du navigateur, sinon le français.
    $lang = langue_demandee($b['lang'] ?? null);

    $hash = password_hash($pass, PASSWORD_DEFAULT);
    $ins  = $db->prepare(
        "INSERT INTO users (email, password_hash, display_name, lang) VALUES (?, ?, ?, ?)"
    );
    $ins->execute([$email, $hash, mb_substr($name, 0, 80), $lang]);
    $uid = (int)$db->lastInsertId();

    // Connexion immédiate (email non vérifié → gating à la contribution, Étape B)
    session_regenerate_id(true);
    $_SESSION['uid'] = $uid;

    // `last_login_at` dès l'inscription : la personne EST connectée, et
    // c'est bien sa dernière visite. Sans cette ligne, elle restait
    // « jamais venue » tant qu'elle ne se déconnectait pas pour se
    // reconnecter — et le compte « membres actifs » ignorait justement
    // les nouveaux venus, c'est-à-dire les plus actifs.
    $db->prepare('UPDATE users SET last_login_at = NOW() WHERE id = ?')->execute([$uid]);

    $email_parti = send_verification_email($db, $uid, $email, $name);

    $u = current_user($db);
    // `email_envoye` DIT LA VÉRITÉ au front. Sans lui, l'interface
    // annonçait « vérifiez vos emails » même quand aucun n'était parti :
    // un message faux, qui envoie la personne fouiller ses indésirables
    // pendant que le vrai problème est chez nous. Le compte est bien
    // créé — d'où le 201 — mais il faut le dire autrement.
    respond(['success' => true, 'user' => user_public($u),
             'email_envoye' => $email_parti, 'csrf' => csrf_get()], 201);
}

// ════════════════════════════════════════════════════════
// GET verify — lien cliqué dans l'email
// ════════════════════════════════════════════════════════
function action_verify(PDO $db): void {
    $token = $_GET['token'] ?? '';
    $dest  = site_url();

    if (!$token) { header('Location: ' . $dest . '/?verify=missing'); exit; }
    $hash = hash('sha256', $token);

    $stmt = $db->prepare(
        "SELECT id, user_id FROM email_tokens
         WHERE token_hash = ? AND type = 'verify' AND used_at IS NULL AND expires_at > NOW()
         LIMIT 1"
    );
    $stmt->execute([$hash]);
    $row = $stmt->fetch();

    if (!$row) { header('Location: ' . $dest . '/?verify=invalid'); exit; }

    $db->prepare("UPDATE users SET email_verified = 1 WHERE id = ?")->execute([$row['user_id']]);
    $db->prepare("UPDATE email_tokens SET used_at = NOW() WHERE id = ?")->execute([$row['id']]);

    header('Location: ' . $dest . '/?verify=ok');
    exit;
}

// ════════════════════════════════════════════════════════
// POST login
// ════════════════════════════════════════════════════════
function action_login(PDO $db): void {
    rate_limit($db, 'login', 10, 900);

    $b     = json_body();
    $email = strtolower(trim($b['email'] ?? ''));
    $pass  = (string)($b['password'] ?? '');

    $stmt = $db->prepare("SELECT * FROM users WHERE email = ? LIMIT 1");
    $stmt->execute([$email]);
    $u = $stmt->fetch();

    // Message générique (ne pas révéler si l'email existe)
    if (!$u || !password_verify($pass, $u['password_hash'])) {
        respond(err('credentials_invalid', 'Email ou mot de passe incorrect.'), 401);
    }
    if ($u['status'] !== 'active') {
        respond(err('account_suspended', 'Ce compte est suspendu.'), 403);
    }

    // Ré-hachage si l'algorithme par défaut a changé
    if (password_needs_rehash($u['password_hash'], PASSWORD_DEFAULT)) {
        $nh = password_hash($pass, PASSWORD_DEFAULT);
        $db->prepare("UPDATE users SET password_hash = ? WHERE id = ?")->execute([$nh, $u['id']]);
    }

    session_regenerate_id(true);
    $_SESSION['uid'] = (int)$u['id'];
    $db->prepare("UPDATE users SET last_login_at = NOW() WHERE id = ?")->execute([$u['id']]);

    respond(['success' => true, 'user' => user_public($u), 'csrf' => csrf_get()]);
}

// ════════════════════════════════════════════════════════
// POST logout
// ════════════════════════════════════════════════════════
function action_logout(): void {
    $_SESSION = [];
    if (ini_get('session.use_cookies')) {
        $p = session_get_cookie_params();
        setcookie(session_name(), '', time() - 42000, $p['path'], $p['domain'], $p['secure'], $p['httponly']);
    }
    session_destroy();
    respond(['success' => true]);
}

// ════════════════════════════════════════════════════════
// POST delete_account — le droit à l'effacement (RGPD art. 17)
// ────────────────────────────────────────────────────────
// On pouvait s'inscrire et pas s'effacer. C'était la seule porte du
// site qui n'existait que dans un sens.
//
// CE QUI DISPARAÎT, CE QUI RESTE
// Le compte, ses jetons, ses favoris, ses avis, ses notes, ses
// signalements, ses inscriptions et réactions : effacés par les clés
// étrangères (ON DELETE CASCADE), sans une ligne de code ici.
//
// Ses messages, sujets et images RESTENT, sous « Membre supprimé »
// (ON DELETE SET NULL) : effacer au milieu d'un échange rend la suite
// incompréhensible pour ceux qui y ont répondu. C'est la règle posée
// avec le forum, et elle vaut toujours.
//
// Deux tables demandent du travail à la main, et c'est là qu'était le
// piège : `contributions` ne porte AUCUNE clé étrangère vers `users`.
// Un simple DELETE aurait donc laissé derrière lui `contributor_email`
// et `contributor_ip` — l'adresse électronique et l'adresse IP de
// quelqu'un qui vient précisément de demander à être oublié.
// ════════════════════════════════════════════════════════
function action_delete_account(PDO $db): void {
    $u = require_auth($db);
    rate_limit($db, 'delete_account', 5, 3600);

    $body = json_decode((string)file_get_contents('php://input'), true) ?? [];
    $mdp  = (string)($body['password'] ?? '');

    // LE MOT DE PASSE EST REDEMANDÉ. Une session volée — ou simplement
    // laissée ouverte sur un poste partagé — ne doit pas pouvoir
    // effacer un compte. Aucun autre geste du site n'est irréversible ;
    // celui-ci l'est.
    $h = $db->prepare('SELECT password_hash FROM users WHERE id = ?');
    $h->execute([(int)$u['id']]);
    $hash = (string)$h->fetchColumn();
    if ($mdp === '' || !password_verify($mdp, $hash)) {
        respond(err('credentials_invalid', 'Mot de passe incorrect.'), 403);
    }

    // Un administrateur ne s'efface pas par ce chemin : il se
    // retrouverait dehors sans que personne puisse le faire rentrer, et
    // le site perdrait son dernier accès. Sa demande passe par la clé
    // d'administration, en connaissance de cause.
    if (($u['role'] ?? '') === 'admin') {
        respond(err('admin_undeletable',
            "Un compte administrateur ne se supprime pas depuis cet écran."), 403);
    }

    // Prévenir AVANT d'effacer : dans une seconde, l'adresse n'existera
    // plus. Et si quelqu'un d'autre était derrière ce geste, le message
    // arrive chez la personne concernée.
    $adieu = $u['email'];
    $nom   = $u['display_name'];
    $lang  = (string)($u['lang'] ?: 'fr');

    $db->beginTransaction();
    try {
        // 1. Les contributions : aucune clé étrangère ne les suivrait.
        // On garde l'établissement proposé — ce n'est pas une donnée
        // personnelle, et une fiche approuvée vit dans l'atlas — mais
        // on retire tout ce qui désigne son auteur.
        $db->prepare(
            "UPDATE contributions
                SET user_id = NULL, contributor_email = NULL, contributor_ip = NULL
              WHERE user_id = ?"
        )->execute([(int)$u['id']]);

        // 2. Le journal de modération. Ses lignes ne portent pas de clé
        // étrangère, à dessein : un journal d'audit doit survivre au
        // compte qu'il documente.
        //
        // D'où l'arbitrage, qui n'est pas évident et mérite d'être écrit :
        // les décisions prises AU TITRE D'UN RÔLE (portée `admin` ou
        // `moderator`) gardent leur signature — on ne confie pas un
        // pouvoir qu'on ne peut plus relire, et quitter le site
        // n'efface pas ce qu'on y a décidé pour les autres. Le reste,
        // qu'aucune responsabilité n'accompagne — la publication
        // directe d'un contributeur de confiance —, est anonymisé.
        $db->prepare(
            "UPDATE moderation_log
                SET acteur_id = NULL, acteur_nom = 'compte supprimé'
              WHERE acteur_id = ? AND portee = 'systeme'"
        )->execute([(int)$u['id']]);
        $db->prepare("UPDATE moderation_log SET acteur_id = NULL WHERE acteur_id = ?")
           ->execute([(int)$u['id']]);

        // 3. Le compte. Les clés étrangères font le reste — et c'est
        // pour cela qu'on ne les recopie pas ici : une liste recopiée
        // finit toujours par diverger du schéma.
        $db->prepare('DELETE FROM users WHERE id = ?')->execute([(int)$u['id']]);
        $db->commit();
    } catch (Throwable $e) {
        $db->rollBack();
        error_log('[auth] suppression de compte #' . $u['id'] . ' : ' . $e->getMessage());
        respond(err('server_error', 'La suppression a échoué. Rien n’a été modifié.'), 500);
    }

    // L'échec d'un envoi ne rattrape pas une suppression déjà faite.
    try {
        send_email($adieu, mail_t('adieu_sujet', $lang),
            email_template(
                mail_t('adieu_titre', $lang, ['nom' => $nom]),
                mail_t('adieu_corps', $lang),
                '', '', mail_t('adieu_pied', $lang)));
    } catch (Throwable $e) {
        error_log('[auth] adieu non envoye : ' . $e->getMessage());
    }

    action_logout();   // détruit la session et répond success
}

// ════════════════════════════════════════════════════════
// POST forgot — demande de réinitialisation
// ════════════════════════════════════════════════════════
function action_forgot(PDO $db): void {
    rate_limit($db, 'forgot', 5, 3600);

    $b     = json_body();
    $email = strtolower(trim($b['email'] ?? ''));

    // Toujours répondre succès (ne pas révéler l'existence de l'email)
    if (valid_email($email)) {
        $stmt = $db->prepare("SELECT id, display_name FROM users WHERE email = ? LIMIT 1");
        $stmt->execute([$email]);
        if ($u = $stmt->fetch()) {
            $token = create_token($db, (int)$u['id'], 'reset', 3600); // 1h
            $url   = site_url() . '/backend/auth.php?action=reset_form&token=' . $token;
            // NB : reset_form n'existe pas côté backend — le lien pointe vers le
            // front qui ouvre la modale. On envoie donc l'URL front :
            $url   = site_url() . '/?reset=' . $token;
            send_email($email, 'Réinitialisation de votre mot de passe',
                email_template(
                    'Réinitialisation du mot de passe',
                    'Vous avez demandé à réinitialiser votre mot de passe CigarOdyssey. Ce lien expire dans 1 heure.',
                    'Choisir un nouveau mot de passe', $url,
                    'Si vous n\'êtes pas à l\'origine de cette demande, ignorez cet email.'
                ));
        }
    }
    respond(['success' => true, 'message' => 'Si un compte existe, un email a été envoyé.']);
}

// ════════════════════════════════════════════════════════
// POST reset — application du nouveau mot de passe
// ════════════════════════════════════════════════════════
function action_reset(PDO $db): void {
    $b     = json_body();
    $token = (string)($b['token'] ?? '');
    $pass  = (string)($b['password'] ?? '');

    if ($err = password_error($pass)) respond(['error' => $err], 400);
    if (!$token) respond(err('token_missing', 'Jeton manquant.'), 400);

    $hash = hash('sha256', $token);
    $stmt = $db->prepare(
        "SELECT id, user_id FROM email_tokens
         WHERE token_hash = ? AND type = 'reset' AND used_at IS NULL AND expires_at > NOW()
         LIMIT 1"
    );
    $stmt->execute([$hash]);
    $row = $stmt->fetch();
    if (!$row) respond(err('token_invalid', 'Lien invalide ou expiré.'), 400);

    $nh = password_hash($pass, PASSWORD_DEFAULT);
    $db->prepare("UPDATE users SET password_hash = ? WHERE id = ?")->execute([$nh, $row['user_id']]);
    $db->prepare("UPDATE email_tokens SET used_at = NOW() WHERE id = ?")->execute([$row['id']]);
    // Invalider les autres jetons reset en attente
    $db->prepare("UPDATE email_tokens SET used_at = NOW() WHERE user_id = ? AND type = 'reset' AND used_at IS NULL")
       ->execute([$row['user_id']]);

    respond(['success' => true, 'message' => 'Mot de passe mis à jour. Vous pouvez vous connecter.']);
}

// ════════════════════════════════════════════════════════
// POST resend — renvoi de l'email de vérification
// ════════════════════════════════════════════════════════
function action_resend(PDO $db): void {
    $u = require_auth($db);
    if ($u['email_verified']) respond(['success' => true, 'message' => 'Email déjà vérifié.']);
    rate_limit($db, 'forgot', 5, 3600); // partage le quota "email sortant"
    send_verification_email($db, (int)$u['id'], $u['email'], $u['display_name']);
    respond(['success' => true, 'message' => 'Email de vérification renvoyé.']);
}

// ── Helpers internes ──────────────────────────────────────
function create_token(PDO $db, int $uid, string $type, int $ttlSec): string {
    $token = bin2hex(random_bytes(32));
    $db->prepare(
        "INSERT INTO email_tokens (user_id, token_hash, type, expires_at)
         VALUES (?, ?, ?, DATE_ADD(NOW(), INTERVAL ? SECOND))"
    )->execute([$uid, hash('sha256', $token), $type, $ttlSec]);
    return $token;
}

/**
 * Envoie l'email de confirmation. Renvoie FAUX si l'envoi a échoué.
 *
 * CE QUE CE `bool` A COÛTÉ AVANT D'EXISTER. La fonction ne renvoyait
 * rien, et personne ne regardait. Le jour où la clé d'API de Brevo est
 * devenue invalide, l'envoi a échoué en silence : le compte était créé,
 * l'interface annonçait « vérifiez vos emails », et il n'y avait pas
 * d'email. Ni le membre, ni l'administration ne pouvaient le savoir.
 *
 * Découvert parce que l'inscription était la nôtre et qu'on attendait
 * le message. Un visiteur, lui, aurait conclu que le site est cassé —
 * et serait parti sans rien dire.
 *
 * L'échec est désormais journalisé avec la réponse exacte du
 * prestataire, et rendu à l'appelant, qui en informe la personne.
 */
function send_verification_email(PDO $db, int $uid, string $email, string $name): bool {
    $token = create_token($db, $uid, 'verify', 86400); // 24h
    $url   = site_url() . '/backend/auth.php?action=verify&token=' . $token;
    $ok = send_email($email, 'Confirmez votre adresse email',
        email_template(
            'Bienvenue, ' . $name . ' !',
            'Merci de rejoindre CigarOdyssey. Confirmez votre adresse email pour pouvoir contribuer et noter les établissements. Ce lien expire dans 24 heures.',
            'Confirmer mon email', $url
        ));

    if (!$ok) {
        // Au journal de modération : c'est là qu'on relit ce qui s'est
        // passé sur le site, et l'écran d'administration le montre.
        // `mail_last_error()` porte la réponse du prestataire — « HTTP
        // 401 : Key not found » aurait suffi à trouver la cause en une
        // minute au lieu d'une heure.
        journaliser($db, 'email_verification_echoue', 'compte', $uid,
            mail_last_error() ?: 'raison inconnue');
        error_log('[auth] email de verification non envoye (#' . $uid . ') : ' . mail_last_error());
    }
    return $ok;
}
