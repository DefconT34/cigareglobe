<?php
// cache.php — Cache fichier JSON pour data.php
// Réduit les appels MySQL de 90% sur l'action ?action=globe
// ════════════════════════════════════════════════════════

define('CACHE_DIR',  __DIR__ . '/cache/');
define('CACHE_TTL',  300);  // 5 minutes

function cache_get(string $key): ?string {
    $file = CACHE_DIR . md5($key) . '.json';
    if (!file_exists($file)) return null;
    if (time() - filemtime($file) > CACHE_TTL) { unlink($file); return null; }
    return file_get_contents($file) ?: null;
}

function cache_set(string $key, string $data): void {
    if (!is_dir(CACHE_DIR)) mkdir(CACHE_DIR, 0755, true);
    file_put_contents(CACHE_DIR . md5($key) . '.json', $data, LOCK_EX);
}

function cache_bust(string $prefix = ''): void {
    if (!is_dir(CACHE_DIR)) return;
    foreach (glob(CACHE_DIR . '*.json') as $f) {
        if (!$prefix || strpos(file_get_contents($f), $prefix) !== false) unlink($f);
    }
}
