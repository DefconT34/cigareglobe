<?php
// CigarOdyssey — Diagnostic rapide
// Déposer dans /backend/, ouvrir dans navigateur, SUPPRIMER après
header('Content-Type: text/plain; charset=utf-8');

echo "=== DIAGNOSTIC SERVEUR ===\n\n";

// PHP
echo "PHP version : " . PHP_VERSION . "\n";
echo "OS          : " . PHP_OS . "\n\n";

// Extensions critiques
$exts = ['gd','pdo','pdo_mysql','curl','json','mbstring'];
echo "Extensions :\n";
foreach ($exts as $e) {
    echo "  " . (extension_loaded($e) ? "✓" : "✗") . " $e\n";
}

// GD détail
if (extension_loaded('gd')) {
    $gd = gd_info();
    echo "  GD JPEG  : " . ($gd['JPEG Support']  ? "✓" : "✗") . "\n";
    echo "  GD PNG   : " . ($gd['PNG Support']   ? "✓" : "✗") . "\n";
    echo "  GD WebP  : " . (isset($gd['WebP Support']) && $gd['WebP Support'] ? "✓" : "✗") . "\n";
}

// Téléchargement HTTP
echo "\nHTTP :\n";
echo "  allow_url_fopen : " . (ini_get('allow_url_fopen') ? "✓ ON" : "✗ OFF") . "\n";
echo "  curl_init       : " . (function_exists('curl_init') ? "✓ disponible" : "✗ absent") . "\n";

// Test cURL sur Wikimedia
if (function_exists('curl_init')) {
    $url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Shanghai_Bund_1.jpg/400px-Shanghai_Bund_1.jpg';
    $ch = curl_init($url);
    curl_setopt_array($ch, [
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_TIMEOUT        => 15,
        CURLOPT_USERAGENT      => 'CigarOdyssey/1.0',
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_SSL_VERIFYPEER => false,
    ]);
    $data = curl_exec($ch);
    $code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    $cerr = curl_error($ch);
    curl_close($ch);
    echo "  Test cURL Wikimedia : HTTP $code — " . strlen($data ?: '') . " bytes";
    if ($cerr) echo " — ERREUR: $cerr";
    echo "\n";

    // Test GD sur l'image téléchargée
    if ($data && strlen($data) > 1000 && extension_loaded('gd')) {
        $img = @imagecreatefromstring($data);
        echo "  Test GD decode      : " . ($img ? "✓ " . imagesx($img) . "×" . imagesy($img) . "px" : "✗ ÉCHEC") . "\n";
        if ($img) imagedestroy($img);
    }
}

// Filesystem
echo "\nFilesystem :\n";
$uploads = dirname(__DIR__) . '/uploads/lounges/';
echo "  /uploads/lounges/ existe   : " . (is_dir($uploads)     ? "✓" : "✗") . "\n";
echo "  /uploads/lounges/ writable : " . (is_writable($uploads) ? "✓" : "✗ PROBLÈME") . "\n";

// Test écriture réelle
$test_file = $uploads . 'test_write_' . time() . '.txt';
$wrote = @file_put_contents($test_file, 'test');
echo "  Test écriture fichier      : " . ($wrote !== false ? "✓ OK" : "✗ ÉCHEC") . "\n";
if ($wrote !== false) @unlink($test_file);

// DB + table
echo "\nBase de données :\n";
try {
    require_once __DIR__ . '/config.php';
    $db = getDB();
    echo "  Connexion DB : ✓\n";
    $tables = ['lounges','lounge_photos','brands'];
    foreach ($tables as $t) {
        try {
            $n = $db->query("SELECT COUNT(*) FROM $t")->fetchColumn();
            echo "  Table $t : ✓ ($n lignes)\n";
        } catch (Throwable $e) {
            echo "  Table $t : ✗ ABSENTE\n";
        }
    }
    // ADMIN_KEY
    echo "  ADMIN_KEY défini : " . (defined('ADMIN_KEY') && ADMIN_KEY ? "✓ (" . strlen(ADMIN_KEY) . " chars)" : "✗ NON défini") . "\n";
} catch (Throwable $e) {
    echo "  Connexion DB : ✗ " . $e->getMessage() . "\n";
}

echo "\n⚠️  Supprimer diag.php après lecture !\n";