<?php
// ════════════════════════════════════════════════════════
// auth_lib.php — Helpers partagés : session, CSRF, utilisateur
// courant, limitation de débit. Utilisé par auth.php et (Étape B)
// account.php.
// ════════════════════════════════════════════════════════

require_once __DIR__ . '/config.php';
require_once __DIR__ . '/langues.php';

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
        respond(err('csrf_invalid', 'Jeton CSRF invalide ou expiré. Rechargez la page.'), 419);
    }
}

// ── Utilisateur courant ───────────────────────────────────
function current_user(PDO $db): ?array {
    if (empty($_SESSION['uid'])) return null;
    $stmt = $db->prepare(
        "SELECT id, email, display_name, role, email_verified, avatar_url, bio, lang, status, created_at, last_login_at
         FROM users WHERE id = ? AND status = 'active'"
    );
    $stmt->execute([(int)$_SESSION['uid']]);
    $u = $stmt->fetch();
    return $u ?: null;
}

/** Renvoie l'utilisateur ou coupe avec 401. */
function require_auth(PDO $db): array {
    $u = current_user($db);
    if (!$u) respond(err('auth_required', 'Authentification requise'), 401);
    return $u;
}

/**
 * Droits d'administration de la requête courante. Trois voies :
 *  - session admin ouverte depuis admin.php ;
 *  - compte connecté ayant le rôle moderator/admin ;
 *  - clé d'administration transmise par EN-TÊTE (X-Admin-Key).
 * La clé n'est jamais acceptée depuis l'URL : elle fuirait dans les logs
 * du serveur, l'historique du navigateur et l'en-tête Referer.
 */
function is_admin_request(?PDO $db = null): bool {
    if (!empty($_SESSION['admin'])) return true;

    $hdr = $_SERVER['HTTP_X_ADMIN_KEY'] ?? '';
    if ($hdr !== '' && defined('ADMIN_KEY') && ADMIN_KEY !== '' && hash_equals(ADMIN_KEY, $hdr)) {
        return true;
    }
    if ($db) {
        $u = current_user($db);
        if ($u && in_array($u['role'], ['moderator', 'admin'], true)) return true;
    }
    return false;
}

/** Jeton CSRF dédié aux formulaires de l'interface d'administration. */
function admin_csrf(): string {
    if (empty($_SESSION['admin_csrf'])) $_SESSION['admin_csrf'] = bin2hex(random_bytes(32));
    return $_SESSION['admin_csrf'];
}

function admin_csrf_valid(?string $sent): bool {
    return !empty($_SESSION['admin_csrf']) && is_string($sent)
        && hash_equals($_SESSION['admin_csrf'], $sent);
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
        'lang'           => $u['lang'] ?? null,
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
            respond(err('rate_limited', 'Trop de tentatives. Réessayez dans quelques minutes.'), 429);
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

// ── Langue de correspondance ──────────────────────────────
/**
 * Les langues que le site SAIT parler — celles dont i18n.js contient un
 * dictionnaire. Une valeur hors liste est ignorée.
 *
 * À ne pas confondre avec langues_actives() (backend/langues.php) : la
 * liste de celles effectivement proposées, réglée depuis
 * l'administration. On valide ce qu'on LIT sur la liste ci-dessous — un
 * message écrit dans une langue depuis fermée doit rester lisible — et
 * ce qu'on ÉCRIT sur langues_actives().
 */
function langues_site(): array {
    return langues_connues();
}

/**
 * Langue à retenir pour un nouveau compte.
 *
 * Cascade à trois niveaux, du plus fiable au plus général :
 *
 *   1. la langue dans laquelle la personne NAVIGUAIT en s'inscrivant.
 *      Ce n'est pas une déduction mais un choix — elle a cliqué son
 *      drapeau, ou est arrivée par /de/ ;
 *   2. l'en-tête Accept-Language du navigateur, envoyé gratuitement par
 *      tous, et qui reflète la langue du système ;
 *   3. le français.
 *
 * Déduire la langue du PAYS a été écarté : ce n'est pas une fonction
 * (Cameroun, Suisse, Belgique, Singapour en ont plusieurs), et obtenir
 * le pays aurait demandé une base GeoIP — la dépendance payante qu'on
 * voulait éviter. Voir migration 014.
 */
function langue_demandee(?string $souhaitee = null): string {
    // Un compte qui se crée écrit : on n'y inscrit qu'une langue servie.
    $ok = langues_actives();
    $l  = strtolower(trim((string)$souhaitee));
    if (in_array($l, $ok, true)) return $l;

    // Accept-Language : « fr-CH,fr;q=0.9,en;q=0.8 ». On ne garde que le
    // code primaire de chaque entrée, dans l'ordre d'arrivee — les
    // navigateurs les listent deja par preference decroissante.
    $hdr = (string)($_SERVER['HTTP_ACCEPT_LANGUAGE'] ?? '');
    foreach (explode(',', $hdr) as $morceau) {
        $code = strtolower(trim(explode('-', explode(';', $morceau)[0])[0]));
        if (in_array($code, $ok, true)) return $code;
    }
    return 'fr';
}

// ── URL du site (pour les liens email) ────────────────────
function site_url(): string {
    if (defined('SITE_URL') && SITE_URL) return rtrim(SITE_URL, '/');
    $scheme = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') ? 'https' : 'http';
    return $scheme . '://' . ($_SERVER['HTTP_HOST'] ?? 'cigarodyssey.com');
}
