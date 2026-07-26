<?php
// ════════════════════════════════════════════════════════
// cigar-debug.php — Diagnostic Cigar World
// USAGE : uploadez dans /backend/, ouvrez dans le navigateur
// SUPPRIMEZ ce fichier après diagnostic !
// ════════════════════════════════════════════════════════

// Afficher TOUTES les erreurs PHP
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

header('Content-Type: text/html; charset=utf-8');
?>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="utf-8">
<title>🔍 Cigar World — Diagnostic</title>
<style>
  body { font-family: monospace; background: #111; color: #eee; padding: 20px; }
  h2   { color: #c9a227; border-bottom: 1px solid #333; padding-bottom: 6px; }
  .ok  { color: #5ecf5e; } .err { color: #ff6b6b; } .warn { color: #ffd766; }
  .box { background: #1a1a1a; border: 1px solid #333; border-radius: 4px; padding: 12px; margin: 8px 0; }
  pre  { margin: 0; white-space: pre-wrap; word-break: break-all; }
</style>
</head>
<body>

<h2>🔍 Cigar World — Diagnostic serveur</h2>

<?php
// ── 1. Version PHP ───────────────────────────────────────
echo '<h2>1. Version PHP</h2><div class="box">';
$ver = phpversion();
$ok  = version_compare($ver, '7.4.0', '>=');
echo '<pre class="' . ($ok ? 'ok' : 'err') . '">';
echo 'PHP ' . $ver . ($ok ? ' ✓ Compatible' : ' ✗ Trop ancien — PHP 7.4+ requis');
echo '</pre></div>';

// ── 2. Extensions requises ───────────────────────────────
echo '<h2>2. Extensions PHP requises</h2><div class="box">';
$required = ['pdo', 'pdo_mysql', 'json', 'mbstring'];
foreach ($required as $ext) {
    $loaded = extension_loaded($ext);
    echo '<pre class="' . ($loaded ? 'ok' : 'err') . '">';
    echo ($loaded ? '✓ ' : '✗ ') . $ext . ($loaded ? ' — OK' : ' — MANQUANTE');
    echo '</pre>';
}
echo '</div>';

// ── 3. Fichier config.php ────────────────────────────────
echo '<h2>3. Fichier config.php</h2><div class="box">';
$config_path = __DIR__ . '/config.php';
if (!file_exists($config_path)) {
    echo '<pre class="err">✗ config.php introuvable dans ' . __DIR__ . '</pre>';
} else {
    echo '<pre class="ok">✓ config.php trouvé</pre>';
    // Load it safely
    try {
        require_once $config_path;
        echo '<pre class="ok">✓ config.php chargé sans erreur</pre>';

        // Check placeholders
        $checks = [
            'DB_NAME'     => defined('DB_NAME')     ? DB_NAME     : null,
            'DB_USER'     => defined('DB_USER')     ? DB_USER     : null,
            'DB_HOST'     => defined('DB_HOST')     ? DB_HOST     : null,
            'ADMIN_KEY'   => defined('ADMIN_KEY')   ? ADMIN_KEY   : null,
            'ADMIN_EMAIL' => defined('ADMIN_EMAIL') ? ADMIN_EMAIL : null,
        ];
        foreach ($checks as $k => $v) {
            if ($v === null) {
                echo '<pre class="err">✗ ' . $k . ' non défini</pre>';
            } elseif (strpos($v, 'votrelogin') !== false || strpos($v, 'CHANGEZ') !== false || strpos($v, 'VotreMotDePasse') !== false) {
                echo '<pre class="warn">⚠ ' . $k . ' = "' . htmlspecialchars($v) . '" — PLACEHOLDER non remplacé !</pre>';
            } else {
                $display = in_array($k, ['DB_USER','ADMIN_EMAIL']) ? htmlspecialchars($v) : str_repeat('*', min(strlen($v), 8));
                echo '<pre class="ok">✓ ' . $k . ' = ' . $display . '</pre>';
            }
        }
    } catch (Throwable $e) {
        echo '<pre class="err">✗ Erreur dans config.php : ' . htmlspecialchars($e->getMessage()) . '</pre>';
    }
}
echo '</div>';

// ── 4. Connexion MySQL ───────────────────────────────────
echo '<h2>4. Connexion MySQL</h2><div class="box">';
if (!defined('DB_HOST')) {
    echo '<pre class="err">✗ config.php non chargé — impossible de tester la connexion</pre>';
} else {
    try {
        $dsn = sprintf('mysql:host=%s;port=%s;dbname=%s;charset=utf8mb4',
            DB_HOST, defined('DB_PORT') ? DB_PORT : '3306', DB_NAME);
        $pdo = new PDO($dsn, DB_USER, DB_PASS, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
        echo '<pre class="ok">✓ Connexion MySQL réussie !</pre>';
        echo '<pre class="ok">  Hôte : ' . DB_HOST . '</pre>';
        echo '<pre class="ok">  Base : ' . DB_NAME . '</pre>';

        // ── 5. Tables ────────────────────────────────────
        echo '</div><h2>5. Tables MySQL</h2><div class="box">';
        $tables_needed = [
            'producer_countries','producer_geo','production_zones',
            'country_polygons','brands','habanos_presence',
            'markets','lounge_countries','lounges',
            'contributions','votes','approved_lounges'
        ];
        $existing = $pdo->query("SHOW TABLES")->fetchAll(PDO::FETCH_COLUMN);
        foreach ($tables_needed as $t) {
            $found = in_array($t, $existing);
            echo '<pre class="' . ($found ? 'ok' : 'err') . '">';
            if ($found) {
                $count = $pdo->query("SELECT COUNT(*) FROM `$t`")->fetchColumn();
                echo '✓ ' . $t . ' — ' . $count . ' lignes';
            } else {
                echo '✗ ' . $t . ' — TABLE MANQUANTE';
            }
            echo '</pre>';
        }

        // ── 6. Test API data.php ──────────────────────────
        echo '</div><h2>6. Test requête API (lounges/mali)</h2><div class="box">';
        try {
            $stmt = $pdo->prepare("SELECT COUNT(*) FROM lounges WHERE country_id = ?");
            $stmt->execute(['mali']);
            $n = $stmt->fetchColumn();
            echo '<pre class="' . ($n > 0 ? 'ok' : 'warn') . '">';
            echo $n > 0
                ? '✓ ' . $n . ' lounges trouvés pour "mali"'
                : '⚠ 0 lounges pour "mali" — normal si le pays n\'est pas dans la base';
            echo '</pre>';

            // Test the action that was failing
            $stmt2 = $pdo->prepare(
                "SELECT name,city,type,phone,price,description AS `desc`,source
                 FROM lounges WHERE country_id = ? AND is_verified = 1 ORDER BY id"
            );
            $stmt2->execute(['mali']);
            $rows = $stmt2->fetchAll();
            echo '<pre class="ok">✓ Requête lounges exécutée sans erreur (' . count($rows) . ' résultats)</pre>';
        } catch (Throwable $e) {
            echo '<pre class="err">✗ Erreur requête : ' . htmlspecialchars($e->getMessage()) . '</pre>';
        }

    } catch (PDOException $e) {
        echo '<pre class="err">✗ CONNEXION ÉCHOUÉE :</pre>';
        echo '<pre class="err">' . htmlspecialchars($e->getMessage()) . '</pre>';
        echo '<pre class="warn">';
        echo "\nCauses fréquentes :\n";
        echo "  • DB_NAME/DB_USER/DB_PASS incorrects dans config.php\n";
        echo "  • Sur OVH : DB_HOST n'est pas 'localhost' mais 'nomlogin.mysql.db'\n";
        echo "  • L'utilisateur MySQL n'a pas les droits sur cette base\n";
        echo '</pre>';
    }
}
echo '</div>';

// ── 7. Permissions fichiers ──────────────────────────────
echo '<h2>7. Fichiers backend</h2><div class="box">';
$files = ['config.php','data.php','api.php','admin.php','.htaccess'];
foreach ($files as $f) {
    $path = __DIR__ . '/' . $f;
    if (file_exists($path)) {
        $perms = substr(sprintf('%o', fileperms($path)), -4);
        echo '<pre class="ok">✓ ' . $f . ' — permissions ' . $perms . '</pre>';
    } else {
        echo '<pre class="' . ($f === '.htaccess' ? 'warn' : 'err') . '">';
        echo ($f === '.htaccess' ? '⚠' : '✗') . ' ' . $f . ' — introuvable';
        echo '</pre>';
    }
}
echo '</div>';

echo '<div class="box"><pre class="warn">⚠ SUPPRIMEZ ce fichier après diagnostic : rm backend/cigar-debug.php</pre></div>';
?>
</body>
</html>
