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

auth_session_start();

cors_headers(true);
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, X-CSRF-Token');

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') { http_response_code(204); exit; }

$action = $_GET['action'] ?? '';
$method = $_SERVER['REQUEST_METHOD'];
$db     = getDB();

// Les POST modifiant l'état exigent un CSRF valide
$POST_ACTIONS = ['register','login','logout','forgot','reset','resend'];
if (in_array($action, $POST_ACTIONS, true)) {
    if ($method !== 'POST') respond(['error' => 'Méthode non autorisée'], 405);
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
        default:         respond(['error' => 'Action inconnue'], 404);
    }
} catch (Throwable $e) {
    respond(['error' => 'Erreur serveur'], 500);
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

    if (!valid_email($email))         respond(['error' => 'Adresse email invalide.'], 400);
    if ($name === '' || mb_strlen($name) > 80) respond(['error' => 'Nom d\'affichage requis (max 80 caractères).'], 400);
    if ($err = password_error($pass)) respond(['error' => $err], 400);

    // Email déjà utilisé ?
    $chk = $db->prepare("SELECT id FROM users WHERE email = ?");
    $chk->execute([$email]);
    if ($chk->fetch()) respond(['error' => 'Un compte existe déjà avec cet email.'], 409);

    $hash = password_hash($pass, PASSWORD_DEFAULT);
    $ins  = $db->prepare(
        "INSERT INTO users (email, password_hash, display_name) VALUES (?, ?, ?)"
    );
    $ins->execute([$email, $hash, mb_substr($name, 0, 80)]);
    $uid = (int)$db->lastInsertId();

    // Connexion immédiate (email non vérifié → gating à la contribution, Étape B)
    session_regenerate_id(true);
    $_SESSION['uid'] = $uid;

    send_verification_email($db, $uid, $email, $name);

    $u = current_user($db);
    respond(['success' => true, 'user' => user_public($u), 'csrf' => csrf_get()], 201);
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
        respond(['error' => 'Email ou mot de passe incorrect.'], 401);
    }
    if ($u['status'] !== 'active') {
        respond(['error' => 'Ce compte est suspendu.'], 403);
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
    if (!$token) respond(['error' => 'Jeton manquant.'], 400);

    $hash = hash('sha256', $token);
    $stmt = $db->prepare(
        "SELECT id, user_id FROM email_tokens
         WHERE token_hash = ? AND type = 'reset' AND used_at IS NULL AND expires_at > NOW()
         LIMIT 1"
    );
    $stmt->execute([$hash]);
    $row = $stmt->fetch();
    if (!$row) respond(['error' => 'Lien invalide ou expiré.'], 400);

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

function send_verification_email(PDO $db, int $uid, string $email, string $name): void {
    $token = create_token($db, $uid, 'verify', 86400); // 24h
    $url   = site_url() . '/backend/auth.php?action=verify&token=' . $token;
    send_email($email, 'Confirmez votre adresse email',
        email_template(
            'Bienvenue, ' . $name . ' !',
            'Merci de rejoindre CigarOdyssey. Confirmez votre adresse email pour pouvoir contribuer et noter les établissements. Ce lien expire dans 24 heures.',
            'Confirmer mon email', $url
        ));
}
