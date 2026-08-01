<?php
// Ligne de commande uniquement : ce harnais reconstruit la base de test.
if (PHP_SAPI !== 'cli') { http_response_code(404); exit; }
// ════════════════════════════════════════════════════════
// tests/bootstrap.php — Harnais de test (sans dépendance)
// ────────────────────────────────────────────────────────
// Fournit : création d'une base de test isolée, démarrage d'un serveur
// PHP éphémère pointant dessus, client HTTP avec cookies, assertions.
// Sortie volontairement en ASCII : les consoles Windows (cp1252) ne
// rendent pas correctement les symboles Unicode.
// ════════════════════════════════════════════════════════

define('PROJECT_ROOT', dirname(__DIR__));
require_once PROJECT_ROOT . '/backend/config.php';   // charge le .env

// ── Compteurs et rapport ─────────────────────────────────
$GLOBALS['t_pass']  = 0;
$GLOBALS['t_fail']  = 0;
$GLOBALS['t_fails'] = [];

function tprint(string $s = ''): void { fwrite(STDOUT, $s . PHP_EOL); }

function section(string $title): void { tprint(''); tprint('== ' . $title . ' =='); }

function check(string $label, bool $ok, string $detail = ''): void {
    if ($ok) {
        $GLOBALS['t_pass']++;
        tprint('  [OK]   ' . $label);
    } else {
        $GLOBALS['t_fail']++;
        $GLOBALS['t_fails'][] = $label;
        tprint('  [FAIL] ' . $label . ($detail !== '' ? '  -> ' . $detail : ''));
    }
}

/** Egalite stricte, avec report de la valeur obtenue en cas d'echec. */
function eq(string $label, $expected, $actual): void {
    check($label, $expected === $actual,
          'attendu ' . json_encode($expected, JSON_UNESCAPED_UNICODE) .
          ', obtenu ' . json_encode($actual, JSON_UNESCAPED_UNICODE));
}

function report_and_exit(): void {
    tprint('');
    tprint(str_repeat('-', 52));
    tprint(sprintf('  %d reussite(s), %d echec(s)', $GLOBALS['t_pass'], $GLOBALS['t_fail']));
    if ($GLOBALS['t_fail'] > 0) {
        tprint('  Echecs :');
        foreach ($GLOBALS['t_fails'] as $f) tprint('    - ' . $f);
    }
    tprint(str_repeat('-', 52));
    exit($GLOBALS['t_fail'] > 0 ? 1 : 0);
}

// ── Base de test isolee ──────────────────────────────────
function test_db_name(): string {
    return getenv('TEST_DB') ?: (DB_NAME !== '' ? DB_NAME . '_test' : 'cigarodyssey_test');
}

/** Connexion au serveur MySQL sans base selectionnee. */
function server_pdo(): PDO {
    return new PDO(
        sprintf('mysql:host=%s;port=%s;charset=utf8mb4', DB_HOST, DB_PORT),
        DB_USER, DB_PASS,
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC]
    );
}

/**
 * (Re)cree la base de test a partir de sql/schema.sql, puis applique un
 * jeu de donnees minimal. La base de production n'est jamais touchee.
 */
function setup_test_database(): PDO {
    $name = test_db_name();
    if ($name === DB_NAME) {
        tprint('ABANDON : la base de test porte le meme nom que la base applicative.');
        exit(2);
    }

    $pdo = server_pdo();
    $pdo->exec("DROP DATABASE IF EXISTS `$name`");
    $pdo->exec("CREATE DATABASE `$name` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci");
    $pdo->exec("USE `$name`");

    // Le dump liste les tables par ordre alphabetique : une cle etrangere
    // peut donc referencer une table pas encore creee. On suspend les
    // controles le temps de l'import.
    $pdo->exec('SET FOREIGN_KEY_CHECKS = 0');
    $sql = file_get_contents(PROJECT_ROOT . '/sql/schema.sql');
    // Normaliser les fins de ligne AVANT de decouper : un dump produit
    // sous Windows se termine par ";\r\n", et le decoupage sur ";\n"
    // renvoyait alors le fichier entier en un seul morceau — morceau qui
    // commence par une directive /*! et se faisait donc ignorer. Zero
    // table creee, et l'echec ne se voyait qu'au premier INSERT.
    $sql = str_replace(["\r\n", "\r"], "\n", $sql);
    foreach (explode(";\n", $sql) as $stmt) {
        $stmt = trim($stmt);
        // Ignorer les directives de session du dump (/*!40101 ... */)
        if ($stmt === '' || str_starts_with($stmt, '/*!')) continue;
        $pdo->exec($stmt);
    }
    $pdo->exec('SET FOREIGN_KEY_CHECKS = 1');

    // Jeu minimal : un etablissement publie, cible des avis et favoris
    $pdo->exec(
        "INSERT INTO lounges (id, country_id, name, city, type, is_verified)
         VALUES (1, 'testland', 'Lounge de test', 'Ville', 'Cave & Lounge', 1)"
    );
    return $pdo;
}

/** Connexion a la base de test (pour les verifications et raccourcis). */
function test_pdo(): PDO {
    static $pdo = null;
    if ($pdo === null) {
        $pdo = new PDO(
            sprintf('mysql:host=%s;port=%s;dbname=%s;charset=utf8mb4', DB_HOST, DB_PORT, test_db_name()),
            DB_USER, DB_PASS,
            [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC]
        );
    }
    return $pdo;
}

// ── Serveur PHP ephemere ─────────────────────────────────
$GLOBALS['t_server']  = null;
$GLOBALS['t_servers'] = [];

function free_port(): int {
    $s = stream_socket_server('tcp://127.0.0.1:0', $errno, $errstr);
    if (!$s) { tprint('Impossible de reserver un port.'); exit(2); }
    $name = stream_socket_get_name($s, false);
    fclose($s);
    return (int)substr($name, strrpos($name, ':') + 1);
}

/**
 * Demarre le serveur integre sur la base de test. Les variables
 * d'environnement priment sur le .env (voir backend/config.php).
 */
function start_server(array $extra = []): string {
    $port = free_port();
    // L'environnement est transmis explicitement : en integration continue
    // il n'y a pas de fichier .env, le serveur doit donc recevoir les acces.
    $env  = [
        'DB_HOST'       => DB_HOST,
        'DB_PORT'       => DB_PORT,
        'DB_USER'       => DB_USER,
        'DB_PASS'       => DB_PASS,
        'DB_NAME'       => test_db_name(),
        'MAIL_LOG_ONLY' => 'true',      // aucun email reel ; jetons lisibles dans le journal
        'APP_DEBUG'     => 'false',
        'ADMIN_KEY'     => 'test-admin-key',
        'SystemRoot'    => getenv('SystemRoot') ?: '',   // requis par PHP sous Windows
        'PATH'          => getenv('PATH') ?: '',
    ];
    $env = array_merge($env, $extra);
    $cmd = sprintf('%s -d xdebug.mode=off -S 127.0.0.1:%d -t %s',
                   escapeshellarg(PHP_BINARY), $port, escapeshellarg(PROJECT_ROOT));

    $pipes = [];
    $proc = proc_open($cmd, [1 => ['file', tempnam(sys_get_temp_dir(), 'cgsrv'), 'w'],
                             2 => ['file', tempnam(sys_get_temp_dir(), 'cgsrv'), 'w']],
                      $pipes, PROJECT_ROOT, $env);
    if (!is_resource($proc)) { tprint('Impossible de demarrer le serveur de test.'); exit(2); }
    // Tous les serveurs lances sont arretes a la sortie, pas seulement
    // le dernier : sinon un processus PHP resterait a ecouter.
    $GLOBALS['t_servers'][] = $proc;
    $GLOBALS['t_server']    = $proc;

    $base = "http://127.0.0.1:$port";
    for ($i = 0; $i < 60; $i++) {          // attente active, 6 s max
        usleep(100000);
        $r = @http('GET', $base . '/backend/data.php?action=globe');
        if ($r['status'] > 0) return $base;
    }
    tprint('Le serveur de test ne repond pas.');
    stop_server();
    exit(2);
}

function stop_server(): void {
    foreach (($GLOBALS['t_servers'] ?? []) as $p) {
        if (is_resource($p)) proc_terminate($p);
    }
    $GLOBALS['t_servers'] = [];
}

// ── Client HTTP ──────────────────────────────────────────
/**
 * Requete HTTP. $opts : json (array), headers (array), jar (fichier de
 * cookies pour simuler un navigateur persistant), follow (bool).
 */
function http(string $method, string $url, array $opts = []): array {
    $ch = curl_init($url);
    $headers = $opts['headers'] ?? [];

    curl_setopt_array($ch, [
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_CUSTOMREQUEST  => $method,
        CURLOPT_TIMEOUT        => 15,
        CURLOPT_FOLLOWLOCATION => (bool)($opts['follow'] ?? false),
        CURLOPT_HEADER         => true,
    ]);
    if (isset($opts['json'])) {
        $headers[] = 'Content-Type: application/json';
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($opts['json'], JSON_UNESCAPED_UNICODE));
    } elseif (isset($opts['form'])) {
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($opts['form']));
    }
    if (!empty($opts['jar'])) {
        curl_setopt($ch, CURLOPT_COOKIEJAR,  $opts['jar']);
        curl_setopt($ch, CURLOPT_COOKIEFILE, $opts['jar']);
    }
    if ($headers) curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

    $raw    = curl_exec($ch);
    $status = (int)curl_getinfo($ch, CURLINFO_HTTP_CODE);
    $hsize  = (int)curl_getinfo($ch, CURLINFO_HEADER_SIZE);
    curl_close($ch);

    $head = $raw === false ? '' : substr($raw, 0, $hsize);
    $body = $raw === false ? '' : substr($raw, $hsize);
    return ['status' => $status, 'headers' => $head, 'body' => $body,
            'json' => json_decode($body, true)];
}

// ── Aides applicatives ───────────────────────────────────
function new_client(string $tag): string {
    $jar = tempnam(sys_get_temp_dir(), 'cgjar_' . $tag . '_');
    @unlink($jar);                       // curl cree le fichier lui-meme
    return $jar;
}

/** Jeton CSRF courant de la session (via auth.php?action=me). */
function csrf(string $base, string $jar): string {
    $r = http('GET', $base . '/backend/auth.php?action=me', ['jar' => $jar]);
    return $r['json']['csrf'] ?? '';
}

/** POST JSON authentifie par la session, avec jeton CSRF. */
function post_json(string $base, string $jar, string $path, array $body): array {
    return http('POST', $base . $path, [
        'jar' => $jar, 'json' => $body,
        'headers' => ['X-CSRF-Token: ' . csrf($base, $jar)],
    ]);
}

/** Marque un compte comme verifie (raccourci ; le flux complet est teste a part). */
function force_verified(string $email): void {
    test_pdo()->prepare("UPDATE users SET email_verified = 1 WHERE email = ?")->execute([$email]);
}
