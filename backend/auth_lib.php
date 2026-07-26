<?php
// ════════════════════════════════════════════════════════
// auth_lib.php — Helpers partagés : session, CSRF, utilisateur
// courant, limitation de débit. Utilisé par auth.php et (Étape B)
// account.php.
// ════════════════════════════════════════════════════════

require_once __DIR__ . '/config.php';

// ── Session sécurisée ─────────────────────────────────────
function auth_session_start(): void {
    if (session_status() === PHP_SESSION_ACTIVE) return;
    $https = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off')
          || (($_SERVER['HTTP_X_FORWARDED_PROTO'] ?? '') === 'https');
    session_set_cookie_params([
        'lifetime' => 0,
        'path'     => '/',
        'httponly' => true,
        'secure'   => $https,
        'samesite' => 'Lax',
    ]);
    session_name('CGSESS');
    session_start();
}

// ── Sortie JSON ───────────────────────────────────────────
function respond(array $data, int $code = 200): void {
    http_response_code($code);
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode($data, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    exit;
}

// ── IP client ─────────────────────────────────────────────
function client_ip(): string {
    foreach (['HTTP_CF_CONNECTING_IP','HTTP_X_FORWARDED_FOR','HTTP_X_REAL_IP','REMOTE_ADDR'] as $k) {
        if (!empty($_SERVER[$k])) return substr(trim(explode(',', $_SERVER[$k])[0]), 0, 45);
    }
    return '0.0.0.0';
}

// ── Corps JSON de la requête ──────────────────────────────
function json_body(): array {
    $raw = file_get_contents('php://input');
    $b   = json_decode($raw, true);
    return is_array($b) ? $b : [];
}

// ── CSRF ──────────────────────────────────────────────────
function csrf_get(): string {
    if (empty($_SESSION['csrf'])) {
        $_SESSION['csrf'] = bin2hex(random_bytes(32));
    }
    return $_SESSION['csrf'];
}

function csrf_verify(): void {
    $sent = $_SERVER['HTTP_X_CSRF_TOKEN'] ?? ($_POST['_csrf'] ?? '');
    if (empty($_SESSION['csrf']) || !is_string($sent) || !hash_equals($_SESSION['csrf'], $sent)) {
        respond(['error' => 'Jeton CSRF invalide ou expiré. Rechargez la page.'], 419);
    }
}

// ── Utilisateur courant ───────────────────────────────────
function current_user(PDO $db): ?array {
    if (empty($_SESSION['uid'])) return null;
    $stmt = $db->prepare(
        "SELECT id, email, display_name, role, email_verified, avatar_url, bio, status, created_at, last_login_at
         FROM users WHERE id = ? AND status = 'active'"
    );
    $stmt->execute([(int)$_SESSION['uid']]);
    $u = $stmt->fetch();
    return $u ?: null;
}

/** Renvoie l'utilisateur ou coupe avec 401. */
function require_auth(PDO $db): array {
    $u = current_user($db);
    if (!$u) respond(['error' => 'Authentification requise'], 401);
    return $u;
}

/** Version publique d'un utilisateur (jamais password_hash). */
function user_public(array $u): array {
    return [
        'id'             => (int)$u['id'],
        'email'          => $u['email'],
        'display_name'   => $u['display_name'],
        'role'           => $u['role'],
        'email_verified' => (bool)$u['email_verified'],
        'avatar_url'     => $u['avatar_url'] ?? null,
        'bio'            => $u['bio'] ?? null,
    ];
}

// ── Limitation de débit (anti-brute-force) ────────────────
function rate_limit(PDO $db, string $action, int $max, int $windowSec): void {
    $ip = client_ip();
    try {
        $c = $db->prepare(
            "SELECT COUNT(*) FROM auth_attempts
             WHERE ip = ? AND action = ? AND created_at > DATE_SUB(NOW(), INTERVAL ? SECOND)"
        );
        $c->execute([$ip, $action, $windowSec]);
        if ((int)$c->fetchColumn() >= $max) {
            respond(['error' => 'Trop de tentatives. Réessayez dans quelques minutes.'], 429);
        }
        $db->prepare("INSERT INTO auth_attempts (ip, action) VALUES (?, ?)")->execute([$ip, $action]);
    } catch (Throwable $e) {
        // Table absente → ne pas bloquer l'utilisateur légitime
    }
}

// ── Validations ───────────────────────────────────────────
function valid_email(string $e): bool {
    return (bool)filter_var($e, FILTER_VALIDATE_EMAIL) && strlen($e) <= 190;
}

/** Mot de passe : au moins 8 caractères. Retourne un message d'erreur ou ''. */
function password_error(string $p): string {
    if (strlen($p) < 8)   return 'Le mot de passe doit contenir au moins 8 caractères.';
    if (strlen($p) > 200) return 'Mot de passe trop long.';
    return '';
}

// ── URL du site (pour les liens email) ────────────────────
function site_url(): string {
    if (defined('SITE_URL') && SITE_URL) return rtrim(SITE_URL, '/');
    $scheme = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') ? 'https' : 'http';
    return $scheme . '://' . ($_SERVER['HTTP_HOST'] ?? 'cigareglobe.com');
}
