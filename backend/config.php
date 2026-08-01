<?php
// ════════════════════════════════════════════════════════
// config.php — Configuration CigarOdyssey
// ────────────────────────────────────────────────────────
// Ce fichier ne contient AUCUN secret : il lit les accès depuis
// le fichier .env (à la racine du projet, ignoré par Git).
// Modèle : .env.example → copier vers .env et renseigner.
// ════════════════════════════════════════════════════════

// ── Chargeur .env minimal ─────────────────────────────────
(function () {
    $path = __DIR__ . '/../.env';
    if (!is_file($path)) return;
    foreach (file($path, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES) as $line) {
        $line = trim($line);
        if ($line === '' || $line[0] === '#') continue;
        $pos = strpos($line, '=');
        if ($pos === false) continue;
        $k = trim(substr($line, 0, $pos));
        $v = trim(substr($line, $pos + 1));
        // Retirer les guillemets englobants
        if (strlen($v) >= 2 && ($v[0] === '"' || $v[0] === "'") && substr($v, -1) === $v[0]) {
            $v = substr($v, 1, -1);
        }
        // Une variable d'environnement réelle est prioritaire sur le .env
        // (convention dotenv). Permet par exemple de viser une base de test :
        //   DB_NAME=cigarodyssey_test php tests/run.php
        if (getenv($k) !== false) continue;
        $_ENV[$k] = $v;
        putenv("$k=$v");
    }
})();

function env(string $key, ?string $default = null): ?string {
    $v = $_ENV[$key] ?? getenv($key);
    return ($v === false || $v === null || $v === '') ? $default : $v;
}

// ── Base de données ───────────────────────────────────────
define('DB_HOST',    env('DB_HOST', 'localhost'));
define('DB_PORT',    env('DB_PORT', '3306'));
define('DB_NAME',    env('DB_NAME', ''));
define('DB_USER',    env('DB_USER', ''));
define('DB_PASS',    env('DB_PASS', ''));
define('DB_CHARSET', env('DB_CHARSET', 'utf8mb4'));

// ── Seuils de vote ────────────────────────────────────────
define('VOTES_TO_APPROVE', (int)env('VOTES_TO_APPROVE', '3'));
define('VOTES_TO_REJECT',  (int)env('VOTES_TO_REJECT',  '3'));

// Nombre de contributions approuvées à partir duquel un membre devient
// « contributeur de confiance » (ses ajouts sont ensuite publiés directement).
define('TRUSTED_AFTER_APPROVED', (int)env('TRUSTED_AFTER_APPROVED', '5'));

// ── Administration ────────────────────────────────────────
define('ADMIN_KEY',   env('ADMIN_KEY', ''));
define('ADMIN_EMAIL', env('ADMIN_EMAIL', 'vous@example.com'));

// ── Diagnostic ────────────────────────────────────────────
// true = les messages d'erreur techniques sont renvoyes au client.
// A n'activer QU'EN DEVELOPPEMENT.
if (strtolower((string)env('APP_DEBUG', 'false')) === 'true') define('APP_DEBUG', true);

// ── CORS ──────────────────────────────────────────────────
define('ALLOWED_ORIGIN', env('ALLOWED_ORIGIN', '*'));

/**
 * En-tetes CORS. Le couple « Allow-Origin: * » + « Allow-Credentials:
 * true » est invalide (les navigateurs le rejettent) et dangereux s'il
 * etait remplace par un reflet de l'Origin : on n'autorise donc les
 * requetes avec cookies que sur une origine explicitement declaree.
 */
function cors_headers(bool $with_credentials = false): void {
    $origin = $_SERVER['HTTP_ORIGIN'] ?? '';
    if (ALLOWED_ORIGIN === '*') {
        if ($with_credentials && $origin !== '') {
            // Meme origine (front et API servis ensemble) : on renvoie
            // l'origine appelante, sinon le cookie de session est ignore.
            $host = $_SERVER['HTTP_HOST'] ?? '';
            if ($host !== '' && parse_url($origin, PHP_URL_HOST) === explode(':', $host)[0]) {
                header('Access-Control-Allow-Origin: ' . $origin);
                header('Vary: Origin');
                header('Access-Control-Allow-Credentials: true');
                return;
            }
        }
        header('Access-Control-Allow-Origin: *');
        return;
    }
    header('Access-Control-Allow-Origin: ' . ALLOWED_ORIGIN);
    header('Vary: Origin');
    if ($with_credentials) header('Access-Control-Allow-Credentials: true');
}

// ── Espace client / emails ────────────────────────────────
if (env('SITE_URL') !== null)       define('SITE_URL',       env('SITE_URL'));
define('MAIL_FROM',      env('MAIL_FROM', 'noreply@cigarodyssey.com'));
define('MAIL_FROM_NAME', env('MAIL_FROM_NAME', 'CigarOdyssey'));
if (strtolower((string)env('MAIL_LOG_ONLY', 'false')) === 'true') define('MAIL_LOG_ONLY', true);
if (strtolower((string)env('MAIL_DEBUG',    'false')) === 'true') define('MAIL_DEBUG', true);

// Transport : log | mail | brevo | mailgun | resend (voir docs/emails.md).
// Les pilotes HTTP signent en DKIM et portent la reputation d'envoi ;
// mail() reste le repli et n'est pas recommande en production.
define('MAIL_DRIVER',    strtolower((string)env('MAIL_DRIVER', 'mail')));
define('MAIL_API_KEY',   (string)env('MAIL_API_KEY', ''));
define('MAIL_REPLY_TO',  (string)env('MAIL_REPLY_TO', ''));
define('MAILGUN_DOMAIN', (string)env('MAILGUN_DOMAIN', ''));
define('MAILGUN_HOST',   (string)env('MAILGUN_HOST', 'api.mailgun.net'));
define('MAIL_TIMEOUT',   (int)env('MAIL_TIMEOUT', 10));

// ── Connexion PDO ─────────────────────────────────────────
function getDB(): PDO {
    static $pdo = null;
    if ($pdo !== null) return $pdo;

    $dsn = sprintf(
        'mysql:host=%s;port=%s;dbname=%s;charset=%s',
        DB_HOST, DB_PORT, DB_NAME, DB_CHARSET
    );

    try {
        $pdo = new PDO($dsn, DB_USER, DB_PASS, [
            PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES   => false,
            PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8mb4 COLLATE utf8mb4_unicode_ci",
        ]);
    } catch (PDOException $e) {
        http_response_code(500);
        header('Content-Type: application/json');
        echo json_encode(['error' => 'Connexion base de données impossible.']);
        exit;
    }

    return $pdo;
}
