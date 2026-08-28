<?php
// ════════════════════════════════════════════════════════
// tools/rejeu_migrations.php — Les migrations passent-elles sur une base neuve ?
// ────────────────────────────────────────────────────────
// Une migration qui a tourné une fois, sur la base du jour où elle a été
// écrite, ne prouve rien pour la suivante : la base applicative a déjà
// tout absorbé, et personne ne rejoue jamais la série depuis le début.
// C'est pourtant ce qui arrivera à un déploiement neuf.
//
// Ce contrôle prend une COPIE de la base applicative, y rejoue les
// migrations d'un intervalle, et compte ce qui est refusé.
//
//   php tools/rejeu_migrations.php                 # 001 -> derniere
//   php tools/rejeu_migrations.php --de 89         # 089 -> derniere
//   php tools/rejeu_migrations.php --de 89 --a 124
//   php tools/rejeu_migrations.php --garder        # ne pas supprimer la copie
//
// LA BASE APPLICATIVE N'EST JAMAIS ÉCRITE. Elle est lue par mysqldump,
// et tout se joue sur la copie, dont le nom porte le suffixe « _rejeu ».
// Le script refuse de travailler si la cible et la source se confondent.
//
// Ce que le rejeu ne dit PAS : que les migrations sont idempotentes. Il
// les rejoue sur une base qui les a déjà reçues, donc un `UPDATE` qui ne
// change plus rien passe pour une réussite. Ce qu'il attrape, et qui est
// arrivé : une instruction devenue invalide parce qu'une migration
// ultérieure a renommé sa colonne, un fichier ajouté hors séquence, un
// `JSON_SET` visant un index qui n'existe plus.
// ════════════════════════════════════════════════════════

if (PHP_SAPI !== 'cli') { http_response_code(404); exit; }

require_once __DIR__ . '/../backend/config.php';

// Valeur REQUISE (« de: ») et non optionnelle (« de:: ») : un paramètre
// long à valeur optionnelle n'accepte que la forme collée « --de=89 » et
// ignore silencieusement « --de 89 » — l'intervalle demandé passait alors
// à la trappe, et la série entière était rejouée sans le dire.
$opt = getopt('', ['de:', 'a:', 'base:', 'garder']);
$de     = isset($opt['de']) ? (int)$opt['de'] : 1;
$a      = isset($opt['a'])  ? (int)$opt['a']  : PHP_INT_MAX;
$garder = array_key_exists('garder', $opt);
$cible  = $opt['base'] ?? (DB_NAME . '_rejeu');

if (DB_NAME === '') {
    fwrite(STDERR, "DB_NAME absent — renseigner le .env.\n");
    exit(2);
}
if (strcasecmp($cible, DB_NAME) === 0) {
    fwrite(STDERR, "La copie porterait le nom de la base applicative. Refus.\n");
    exit(2);
}

/**
 * Le client MySQL et mysqldump.
 *
 * Même raison que pour l'interpréteur PHP dans playwright.config.js : le
 * PATH du poste de développement ne porte pas forcément ceux de WAMP.
 * MYSQL_BIN prime, puis les emplacements usuels, puis le PATH.
 */
function binaire(string $nom): string {
    if ($dir = getenv('MYSQL_BIN')) {
        $p = rtrim($dir, "\\/") . DIRECTORY_SEPARATOR . $nom . '.exe';
        if (is_file($p)) return $p;
    }
    foreach (glob('C:/wamp64/bin/mysql/*/bin/' . $nom . '.exe') ?: [] as $p) return $p;
    foreach (glob('C:/xampp/mysql/bin/' . $nom . '.exe') ?: [] as $p) return $p;
    return $nom;   // Linux, ou binaire déjà dans le PATH
}

$mysql     = binaire('mysql');
$mysqldump = binaire('mysqldump');

// Le mot de passe passe par l'environnement : sur la ligne de commande il
// serait lisible par tout processus listant les arguments.
putenv('MYSQL_PWD=' . DB_PASS);

$hote = ['-h', DB_HOST, '-P', DB_PORT, '-u', DB_USER, '--default-character-set=utf8mb4'];

/** Lance une commande et rend [code de sortie, sortie standard + erreurs]. */
function lancer(array $argv): array {
    $cmd = implode(' ', array_map('escapeshellarg', $argv)) . ' 2>&1';
    exec($cmd, $lignes, $code);
    return [$code, implode("\n", $lignes)];
}

/** Exécute du SQL sur une base, sans passer par un fichier. */
function sql(string $base, string $requete): array {
    global $mysql, $hote;
    return lancer(array_merge([$mysql], $hote, array_filter([$base]), ['-e', $requete]));
}

echo "CigarOdyssey — rejeu des migrations sur une base neuve\n\n";
printf("  source : %s (lecture seule)\n  copie  : %s\n\n", DB_NAME, $cible);

// ── 1. Copie de la base applicative ───────────────────────
$dump = sys_get_temp_dir() . DIRECTORY_SEPARATOR . 'rejeu_' . getmypid() . '.sql';

// --result-file plutôt qu'une redirection : sous Windows, « > » d'un
// interpréteur de commandes peut réencoder la sortie (PowerShell écrit en
// UTF-16), et le client MySQL refuse alors les octets nuls du fichier.
[$code, $sortie] = lancer(array_merge([$mysqldump], $hote, [
    '--single-transaction', '--routines', '--no-tablespaces',
    '--result-file=' . $dump, DB_NAME,
]));
if ($code !== 0) {
    fwrite(STDERR, "mysqldump a échoué :\n$sortie\n");
    exit(2);
}
printf("  dump : %.1f Mo\n", filesize($dump) / 1048576);

$menage = function () use (&$dump, $cible, $garder) {
    if (is_file($dump)) @unlink($dump);
    if (!$garder) sql('', "DROP DATABASE IF EXISTS `$cible`;");
};
// Une interruption ne doit pas laisser traîner une base ni un dump.
register_shutdown_function($menage);

// Une instruction par appel, et jamais de saut de ligne dans « -e » :
// sous Windows, cmd.exe coupe l'argument au premier retour à la ligne et
// n'exécute que le début — la base n'était alors pas créée, et l'échec
// n'apparaissait qu'à l'import.
foreach (["DROP DATABASE IF EXISTS `$cible`;",
          "CREATE DATABASE `$cible` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"] as $q) {
    [$code, $sortie] = sql('', $q);
    if ($code !== 0) { fwrite(STDERR, "Création de $cible refusée :\n$sortie\n"); exit(2); }
}

[$code, $sortie] = sql($cible, 'source ' . str_replace('\\', '/', $dump));
if ($code !== 0) { fwrite(STDERR, "Import du dump refusé :\n$sortie\n"); exit(2); }

// ── 2. Rejeu ──────────────────────────────────────────────
$fichiers = [];
foreach (glob(__DIR__ . '/../sql/migrations/*.sql') ?: [] as $p) {
    if (!preg_match('/^(\d{3})_/', basename($p), $m)) continue;
    $n = (int)$m[1];
    if ($n >= $de && $n <= $a) $fichiers[$n] = $p;
}
ksort($fichiers);

if (!$fichiers) { fwrite(STDERR, "Aucune migration dans l'intervalle demandé.\n"); exit(2); }
printf("  fichiers : %d (%s -> %s)\n\n", count($fichiers),
       basename(reset($fichiers)), basename(end($fichiers)));

$instructions = 0;
$refus = [];
foreach ($fichiers as $p) {
    // Comptage indicatif : les instructions se terminent par « ; » en fin
    // de ligne. Les commentaires « -- » sont écartés, le reste ne l'est
    // pas — un « ; » final à l'intérieur d'une chaîne serait compté.
    $txt = (string)file_get_contents($p);
    $nu  = preg_replace('/^\s*--.*$/m', '', $txt);
    $instructions += preg_match_all('/;\s*$/m', $nu);

    [$code, $sortie] = sql($cible, 'source ' . str_replace('\\', '/', $p));
    if ($code !== 0 || stripos($sortie, 'ERROR') !== false) {
        $refus[] = basename($p) . ' : ' . trim($sortie);
    }
}

// ── 3. Verdict ────────────────────────────────────────────
printf("  %d instruction(s) rejouée(s)\n", $instructions);
if ($refus) {
    echo "\n  " . count($refus) . " fichier(s) en échec :\n";
    foreach ($refus as $r) echo "    $r\n";
} else {
    echo "  Aucune instruction refusée.\n";
}

if ($garder) echo "\n  La copie `$cible` est conservée (--garder).\n";
echo "\n";
exit($refus ? 1 : 0);
