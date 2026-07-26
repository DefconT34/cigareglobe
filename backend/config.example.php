<?php
// ════════════════════════════════════════════════════════
// config.example.php — MODÈLE de configuration CigarGlobe
// ────────────────────────────────────────────────────────
// COPIEZ ce fichier vers config.php et renseignez vos vraies
// valeurs. config.php est ignoré par Git (ne jamais committer
// les secrets). Compatible cPanel (OVH, Infomaniak, o2switch…).
// ════════════════════════════════════════════════════════

// ── Base de données ───────────────────────────────────────
define('DB_HOST',    'localhost');
define('DB_PORT',    '3306');
define('DB_NAME',    'prefixe_cigare');    // ← préfixe_nombase
define('DB_USER',    'prefixe_cigare');    // ← préfixe_utilisateur
define('DB_PASS',    'CHANGEZ_MOI');       // ← mot de passe MySQL
define('DB_CHARSET', 'utf8mb4');

// ── Seuils de vote ────────────────────────────────────────
define('VOTES_TO_APPROVE', 3);  // 3 votes positifs = validation automatique
define('VOTES_TO_REJECT',  3);  // 3 votes négatifs = rejet automatique

// ── Administration ────────────────────────────────────────
// Générez une clé solide : https://www.random.org/passwords/
define('ADMIN_KEY',   'CHANGEZ_MOI_CLE_ALEATOIRE_LONGUE');

// Email de réception des notifications de contributions
define('ADMIN_EMAIL', 'vous@example.com');

// ── CORS ──────────────────────────────────────────────────
// URL exacte du site (sans slash final), ou '*' (moins sûr).
// En production, préférez le domaine réel à '*'.
define('ALLOWED_ORIGIN', 'https://cigareglobe.com');

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
