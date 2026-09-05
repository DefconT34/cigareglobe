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
    // Les rubriques du forum sont des donnees de REFERENCE : sans elles,
    // aucun sujet ne peut exister, et celle qui porte l'agenda ne se
    // reconnait qu'a son drapeau `is_events`. On rejoue donc TOUTES les
    // instructions des migrations qui touchent forum_sections, dans
    // l'ordre des fichiers, plutot que d'en recopier une liste ici : une
    // liste recopiee finit toujours par diverger de celle qui part en
    // production. C'est ce qui manquait quand la migration 017 a pose
    // `is_events` — la table etait peuplee, le drapeau non, et creer un
    // rendez-vous repondait 500 sans rien dire de plus.
    //
    // Meme raison pour site_languages (migration 019) : sans ses six
    // lignes, langues_actives() retombe sur les six langues connues et
    // le test « fermer une langue » ne verrait aucune difference.
    //
    // Et pour aromes (migration 051) : ce sont les phrases qui expliquent
    // « Terre » ou « Cuir » a qui ne pratique pas. Sans elles la fiche
    // d'une feuille se sert quand meme — avec un glossaire vide, ce qui
    // ressemble trait pour trait a une fiche dont les libelles ne
    // tombent dans aucune famille.
    // Et pour `lexique` (migration 083) : ce sont les mots du metier —
    // vitole, torcedor, ligero — que la prose emploie sans les
    // expliquer. Sans la table, la fiche se sert avec un lexique vide,
    // ce qui ressemble trait pour trait a une fiche dont aucun terme
    // n'est reconnu. Meme piege que `aromes` ci-dessus.
    $reference = 'forum_sections|site_languages|aromes|lexique';
    $migrations = glob(PROJECT_ROOT . '/sql/migrations/*.sql') ?: [];
    sort($migrations);
    foreach ($migrations as $f) {
        $sql = (string)@file_get_contents($f);
        // Le point-virgule cherche est celui qui FERME l'instruction,
        // c'est-a-dire celui qui termine une ligne. « [^;]*; » coupait
        // a l'interieur d'une chaine des que le texte francais en
        // contenait un — « un vieux rhum prolonge la fumee ; un blanc la
        // tranche » suffisait a produire une instruction tronquee.
        if (preg_match_all('/(?:INSERT(?: IGNORE)? INTO|UPDATE)\s+`?(?:' . $reference . ')`?\b.*?;\s*$/sim', $sql, $m)) {
            foreach ($m[0] as $stmt) $pdo->exec($stmt);
        }
    }
    // Les migrations ne portent que le francais : les cinq autres langues
    // vivent dans sql/traductions.sql. La campagne n'en a besoin que pour
    // `aromes` — c'est la seule table dont un test compare deux langues.
    // On rejoue donc ces lignes-la, et pas le fichier entier : y verser
    // 739 UPDATE ferait passer pour traduites des tables que d'autres
    // tests attendent en repli francais.
    $trad = (string)@file_get_contents(PROJECT_ROOT . '/sql/traductions.sql');
    if (preg_match_all('/^UPDATE `(?:aromes|lexique)` .*;$/mi', $trad, $m)) {
        foreach ($m[0] as $stmt) $pdo->exec($stmt);
    }
    // Le cache de langues.php est un FICHIER : une base de test refaite
    // ne l'efface pas. Un reglage laisse par un test precedent (ou par
    // l'administration de developpement, si la base porte le meme nom)
    // decrirait alors une liste que la base ne dit plus.
    @unlink(PROJECT_ROOT . '/backend/cache/langues_'
            . preg_replace('/[^A-Za-z0-9_]/', '_', $name) . '.json');
    // Une marque, pour que « action=all » ait quelque chose a porter.
    // Sans elle, la reponse restait vide de marques et l'on ne pouvait
    // pas distinguer « le bloc n'est jamais atteint » de « il n'y a rien
    // a servir » — c'est precisement le defaut qui etait passe inapercu.
    // L'histoire emploie DELIBEREMENT des mots du lexique — cape,
    // vitole, torcedor. Sans eux, le bloc « les mots de cette fiche »
    // reste vide et le test ne distinguerait pas « la detection ne
    // marche pas » de « il n'y avait rien a detecter ». C'est le meme
    // raisonnement que la marque elle-meme, deux lignes plus haut.
    // Et une traduction ALLEMANDE, sans aucun de ces mots francais.
    //
    // Sans elle le test du lexique ne pouvait pas echouer : `traduire`
    // retombe sur le francais quand la colonne allemande est vide, donc
    // une detection faite APRES traduction lisait encore « cape » et
    // rendait le meme resultat. Verifie en introduisant le defaut : les
    // sept assertions restaient vertes.
    //
    // Avec un allemand reel, une detection mal placee rend zero terme et
    // la parite entre les deux langues casse. C'est la difference entre
    // mesurer une presence et mesurer la propriete voulue.
    // LA GAMME N'EST PLUS VIDE, et c'est necessaire depuis que la fiche
    // de marque sert autre chose que des noms. Avec `gamme = '[]'` la
    // page rendait un bloc absent, et un test qui cherche la cape ou la
    // force passerait aussi bien sur un rendu casse que sur un rendu
    // juste — il ne mesurerait que le vide.
    //
    // Les quatre champs sont peuples parce que la page en tire quatre
    // sections distinctes : gamme, accords, figures, editions limitees.
    $pdo->exec(
        "INSERT INTO brands (name, country_id, founded, history, history_de,
                             gamme, pairings, celebrities, limited_eds)
         VALUES ('Marque de test', 'testland', '1900',
                 'Histoire de test : une cape posee par un torcedor, sur une vitole courte.',
                 'Testgeschichte: ein Deckblatt, von einem Roller aufgelegt, auf einem kurzen Format.',
                 '[{\"name\":\"Module de test\",\"color\":\"#8B4513\",\"force\":\"Medium-Full\",\"wrapper\":\"Cape de test\",\"vitolas\":[\"Corona\",\"Robusto\"],\"story\":\"Recit du module de test.\"}]',
                 '[{\"type\":\"Spiritueux\",\"name\":\"Accord de test\",\"notes\":\"Note d accord de test.\"}]',
                 '[{\"name\":\"Figure de test\",\"anecdote\":\"Anecdote de test.\"}]',
                 '[\"Edition limitee de test\"]')"
    );

    // Une feuille, pour la meme raison que la marque ci-dessus.
    //
    // La campagne API ne charge PAS tests/fixtures/atlas.sql — c'est le
    // decor des parcours Playwright. Elle construit son propre jeu
    // minimal, et une table ajoutee au schema y arrive donc VIDE. Les
    // premiers tests de la fiche feuille rendaient 404 sans que rien
    // n'explique pourquoi : une table vide ne ressemble pas a une table
    // manquante.
    //
    // Le pays d'abord : `feuilles.country_id` est une cle etrangere, et
    // « testland » n'existait jusqu'ici que du cote des etablissements.
    //
    // La liste `cape` sert la derivation des cigares qui portent la
    // feuille — elle n'est pas stockee sur la feuille elle-meme.
    $pdo->exec(
        "INSERT INTO producer_countries (id, name, flag, lat, lon, region, tier, color, varieties, brands)
         -- SIX chiffres, pas trois : le globe concatene « 55 » au code
         -- pour obtenir l'alpha, et « #888 » devenait « #88855 » — une
         -- couleur invalide. Le canvas levait alors une SyntaxError qui
         -- faisait tomber NEUF parcours, dont des tests de mobile sans
         -- rapport apparent avec les feuilles.
         --
         -- Ce jeu minimal sert AUSSI les parcours Playwright :
         -- setup_front_db.php appelle cette fonction avant de charger
         -- le decor. Une graine de la campagne API se retrouve donc
         -- dessinee sur le globe.
         VALUES ('testland', 'Testland', '🏳', 0, 0, 'Nulle part', 'emerging', '#888888',
                 '[\"Feuille de test\"]',
                 '[{\"name\":\"Cigare a cape de test\",\"desc\":\"Porte la feuille\",\"cape\":true,\"iconic\":false}]')"
    );
    $pdo->exec(
        "INSERT INTO feuilles (id, name, country_id, emploi, genese, culture, caracteres, notes, pairings)
         VALUES ('feuille-de-test', 'Feuille de test', 'testland', 'Cape',
                 'Genese de test', 'Culture de test', 'Caracteres de test',
                 -- Des libelles REELS, pas « Note de test » : les icones et
                 -- le glossaire se choisissent sur le francais, et une
                 -- graine inventee ne declencherait ni l'un ni l'autre.
                 -- « Cacao » en note et « Chocolat noir » en accord font
                 -- expres la meme famille dans les deux contextes — c'est
                 -- la seule paire qui distingue une glose juste d'une
                 -- glose recopiee de l'autre cote.
                 '[\"Terre\", \"Cacao\"]', '[\"Chocolat noir\"]')"
    );

    // `feuilles.emploi` est un vocabulaire ferme de neuf valeurs, traduit
    // par la migration 055 en UPDATE indexes SUR LA VALEUR — pas sur un
    // identifiant de fiche. Les rejouer traduit donc aussi la graine, qui
    // porte « Cape » comme onze fiches reelles.
    //
    // APRES l'insertion, evidemment : place avec les autres rejeux de
    // reference, plus haut, ils mettaient a jour une table encore vide et
    // n'ecrivaient rien. Le test tombait alors sur un emploi francais dans
    // les six langues — exactement le defaut qu'il surveille.
    //
    // On ne prend que les UPDATE : ajouter `feuilles` au rejeu de
    // reference emporterait aussi les INSERT des trente fiches reelles, et
    // la base de test cesserait d'etre minimale.
    foreach (glob(PROJECT_ROOT . '/sql/migrations/*.sql') ?: [] as $f) {
        $sql = (string)@file_get_contents($f);
        if (preg_match_all('/UPDATE\s+`?feuilles`?\s+SET\s+`?emploi_.*?;\s*$/sim', $sql, $m)) {
            foreach ($m[0] as $stmt) $pdo->exec($stmt);
        }
    }
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
    // bypass_shell est INDISPENSABLE sous Windows. Sans lui, proc_open
    // lance « cmd.exe /c php -S … » : le descripteur rendu designe le
    // cmd.exe, pas le serveur. proc_terminate() tuait donc l'enveloppe
    // en laissant php.exe ecouter pour toujours.
    //
    // Consequence mesuree : 133 serveurs de test orphelins accumules,
    // le plus ancien datant du 7 aout. Et comme un processus Windows
    // herite des descripteurs de son parent, chacun gardait ouverte la
    // sortie standard de la campagne qui l'avait cree — si bien qu'un
    // « php tests/run.php | grep … » ne rendait JAMAIS la main : le
    // tube n'atteignait pas sa fin de flux. Ce qu'on avait mis sur le
    // compte d'un tampon de grep etait cette fuite.
    $proc = proc_open($cmd, [1 => ['file', tempnam(sys_get_temp_dir(), 'cgsrv'), 'w'],
                             2 => ['file', tempnam(sys_get_temp_dir(), 'cgsrv'), 'w']],
                      $pipes, PROJECT_ROOT, $env, ['bypass_shell' => true]);
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
        if (!is_resource($p)) continue;
        // Ceinture ET bretelles : bypass_shell fait deja pointer le
        // descripteur sur le bon processus, mais une campagne qui
        // laisse un serveur derriere elle est invisible jusqu'a ce
        // qu'on en compte cent trente-trois. On verifie donc qu'il est
        // bien mort, et on insiste sinon.
        $etat = proc_get_status($p);
        proc_terminate($p);
        proc_close($p);
        if (!empty($etat['pid']) && stripos(PHP_OS_FAMILY, 'Windows') === 0) {
            @exec(sprintf('taskkill /F /T /PID %d 2>NUL', (int)$etat['pid']));
        }
    }
    $GLOBALS['t_servers'] = [];
    $GLOBALS['t_server']  = null;
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
    } elseif (isset($opts['multipart'])) {
        // Televersement de fichier : cURL pose lui-meme la frontiere
        // multipart. Ne PAS ajouter de Content-Type a la main — une
        // frontiere ecrite par nous ne correspondrait pas au corps.
        $champs = [];
        foreach ($opts['multipart'] as $k => $v) {
            $champs[$k] = (is_array($v) && isset($v['file']))
                ? new CURLFile($v['file'], $v['type'] ?? 'application/octet-stream', $v['name'] ?? basename($v['file']))
                : $v;
        }
        curl_setopt($ch, CURLOPT_POSTFIELDS, $champs);
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
function post_json(string $base, string $jar, string $path, array $body, array $headers = []): array {
    return http('POST', $base . $path, [
        'jar' => $jar, 'json' => $body,
        'headers' => array_merge(['X-CSRF-Token: ' . csrf($base, $jar)], $headers),
    ]);
}

/** Marque un compte comme verifie (raccourci ; le flux complet est teste a part). */
function force_verified(string $email): void {
    test_pdo()->prepare("UPDATE users SET email_verified = 1 WHERE email = ?")->execute([$email]);
}
