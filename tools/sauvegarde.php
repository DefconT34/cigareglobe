<?php
// ════════════════════════════════════════════════════════
// tools/sauvegarde.php — Ce que Git ne portera jamais
// ────────────────────────────────────────────────────────
// POURQUOI CET OUTIL EXISTE
//
// `sql/contenu.sql` a mis l'atlas dans le dépôt. Deux choses n'y
// entreront jamais, et c'est délibéré :
//
//   uploads/            4 315 fichiers, 27 Mo — les images
//   20 tables           ce qui appartient aux gens : comptes, avis,
//                       messages, contributions, journal de modération
//
// Les premières parce qu'un dépôt n'est pas un entrepôt d'images ; les
// secondes parce que des données personnelles ne se versionnent pas —
// un dépôt garde tout, pour toujours, y compris ce qu'un membre a
// demandé d'effacer.
//
// Elles n'existent donc qu'à un seul endroit. Cet outil en fait une
// copie datée, refermée dans une archive, à déposer ailleurs.
//
// LA LISTE DES TABLES N'EST PAS RECOPIÉE
// Elle est LUE dans contenu_dump.php (`CONTENU_EXCLUES`). Les deux
// outils se partagent exactement le contenu de la base : ce que l'un
// verse dans Git, l'autre le laisse ; ce que l'un exclut, l'autre le
// sauvegarde. Une liste recopiée aurait fini par diverger, et la
// divergence se serait vue le jour de la restauration — c'est-à-dire le
// pire jour possible.
//
// CE QUI N'Y EST PAS, ET POURQUOI
// Le `.env`. Une restauration en a besoin, mais cette archive est faite
// pour être copiée ailleurs : mot de passe de la base et clé
// d'administration n'ont rien à faire dans un fichier qui voyage. Ils
// se rangent dans un gestionnaire de mots de passe, séparément.
//
// USAGE
//   php tools/sauvegarde.php                     archive datée
//   php tools/sauvegarde.php --vers D:\copies    ailleurs que par défaut
//   php tools/sauvegarde.php --garder 7          rotation (défaut : 7)
//   php tools/sauvegarde.php --verifier <fich>   ouvre et compte
//
// Code de sortie : 0 si l'archive est écrite ET relue, 1 sinon.
// ════════════════════════════════════════════════════════

if (PHP_SAPI !== 'cli' && !defined('SAUVEGARDE_INCLUDE')) { http_response_code(404); exit; }

// Charge les listes sans lancer l'outil. Le `defined` permet a un
// appelant qui l'a deja fait — la campagne de tests — de nous inclure.
defined('CONTENU_DUMP_INCLUDE') || define('CONTENU_DUMP_INCLUDE', true);
require_once __DIR__ . '/contenu_dump.php';    // apporte aussi backend/config.php

const SAUV_RACINE = __DIR__ . '/..';

/** Les tables à sauvegarder : exactement celles que Git ne porte pas. */
function sauv_tables(): array {
    return array_keys(CONTENU_EXCLUES);
}

/** mysqldump des tables personnelles. Renvoie le SQL, n'écrit aucun fichier durable. */
function sauv_dump_sql(): string {
    $tmp = tempnam(sys_get_temp_dir(), 'cgsauv');

    // --result-file, jamais une redirection : sous PowerShell « > »
    // écrit en UTF-16 et le fichier devient illisible par mysql.
    $cmd = sprintf(
        '%s --host=%s --port=%s --user=%s %s --default-character-set=utf8mb4 '
        . '--no-create-info --complete-insert --skip-extended-insert '
        . '--skip-comments --no-tablespaces --result-file=%s %s %s',
        escapeshellarg(contenu_binaire('mysqldump')),
        escapeshellarg(DB_HOST), escapeshellarg((string)DB_PORT), escapeshellarg(DB_USER),
        DB_PASS !== '' ? '--password=' . escapeshellarg(DB_PASS) : '',
        escapeshellarg($tmp), escapeshellarg(DB_NAME),
        implode(' ', array_map('escapeshellarg', sauv_tables()))
    );
    $sortie = []; $code = 0;
    exec($cmd . ' 2>&1', $sortie, $code);
    if ($code !== 0) {
        @unlink($tmp);
        fwrite(STDERR, "mysqldump a échoué :\n  " . implode("\n  ", $sortie) . "\n");
        exit(2);
    }
    $sql = (string)file_get_contents($tmp);
    @unlink($tmp);

    $entete = "-- Sauvegarde des donnees personnelles — " . date('c') . "\n"
            . "-- Base : " . DB_NAME . "\n"
            . "-- S'importe APRES sql/schema.sql, et de preference apres\n"
            . "-- sql/contenu.sql : les avis et les messages referencent des\n"
            . "-- etablissements et des rubriques qui doivent exister d'abord.\n"
            . "-- Tables (" . count(sauv_tables()) . ") : " . implode(', ', sauv_tables()) . "\n\n";
    return $entete . $sql;
}

/**
 * La destination est-elle dangereuse ? Renvoie la raison, ou null.
 *
 * DEUX DANGERS, ET J'AI FAILLI N'EN VOIR QU'UN.
 *
 * Le premier est évident : une archive de données personnelles déposée
 * dans un dépôt Git y reste pour toujours, jusque dans l'historique —
 * y compris ce qu'un membre a demandé d'effacer.
 *
 * Le second est pire, et c'est celui que la première version de cette
 * fonction laissait passer. Elle ne regardait que Git : « ignoré, donc
 * sûr ». Mise à l'épreuve en visant `docs/`, elle a écrit sans broncher
 * 5 Mo de comptes et de messages dans l'arborescence servie par Apache —
 * téléchargeables à `/docs/cigarodyssey-<date>.zip` par quiconque devine
 * le nom. Le `.gitignore` du projet porte `*.zip` : le fichier était
 * effectivement invisible pour Git, et parfaitement visible pour le Web.
 *
 * Être hors de Git ne suffit donc pas. Le critère qui compte d'abord est
 * d'être hors de la RACINE SERVIE.
 */
function sauv_destination_risquee(string $chemin): ?string {
    $dossier = dirname($chemin);
    $reel    = realpath($dossier);
    $racine  = realpath(SAUV_RACINE);

    // 1. Hors de ce qu'un serveur web peut servir.
    if ($reel !== false && $racine !== false
        && (str_starts_with($reel . DIRECTORY_SEPARATOR, $racine . DIRECTORY_SEPARATOR))) {
        return "« $chemin » est SOUS LA RACINE DU SITE : le serveur web le servirait.";
    }

    // 2. Hors de tout dépôt qui le suivrait.
    $sortie = []; $code = 0;
    exec('git -C ' . escapeshellarg($dossier) . ' rev-parse --show-toplevel 2>&1', $sortie, $code);
    if ($code !== 0) return null;             // pas un dépôt : rien à craindre de Git
    $depot = trim((string)($sortie[0] ?? ''));

    $rien = []; $ignore = 0;
    exec('git -C ' . escapeshellarg($dossier) . ' check-ignore -q '
         . escapeshellarg($chemin) . ' 2>&1', $rien, $ignore);
    if ($ignore === 0) return null;           // ignoré : la destination est sûre

    return "« $chemin » est dans le dépôt « $depot » et n'y est pas ignoré.";
}

/** Tous les fichiers d'uploads/, en chemins relatifs à la racine du projet. */
function sauv_fichiers_uploads(): array {
    $base = realpath(SAUV_RACINE . '/uploads');
    if ($base === false) return [];
    $liste = [];
    $it = new RecursiveIteratorIterator(
        new RecursiveDirectoryIterator($base, FilesystemIterator::SKIP_DOTS));
    foreach ($it as $f) {
        if (!$f->isFile()) continue;
        $liste[] = 'uploads/' . str_replace('\\', '/', substr($f->getPathname(), strlen($base) + 1));
    }
    sort($liste);
    return $liste;
}

/**
 * Écrit l'archive. Renvoie [chemin, nombre d'entrées].
 *
 * L'archive porte sa date dans son nom : deux sauvegardes du même jour
 * s'écrasent, ce qui est voulu — on veut des jours distincts, pas des
 * minutes.
 */
function sauv_ecrire(string $dossier): array {
    if (!is_dir($dossier) && !mkdir($dossier, 0700, true)) {
        fwrite(STDERR, "Impossible de créer $dossier\n");
        exit(2);
    }
    $chemin = rtrim($dossier, '\\/') . DIRECTORY_SEPARATOR
            . 'cigarodyssey-' . date('Y-m-d') . '.zip';

    if ($raison = sauv_destination_risquee($chemin)) {
        fwrite(STDERR, "Refus : $raison\n"
            . "  Cette archive contient des comptes, des adresses et des messages.\n"
            . "  Elle se dépose hors du site et hors de tout dépôt : --vers <chemin>\n");
        exit(2);
    }

    $zip = new ZipArchive();
    if ($zip->open($chemin, ZipArchive::CREATE | ZipArchive::OVERWRITE) !== true) {
        fwrite(STDERR, "Impossible d'ouvrir $chemin en écriture\n");
        exit(2);
    }

    $zip->addFromString('donnees-personnelles.sql', sauv_dump_sql());

    $fichiers = sauv_fichiers_uploads();
    foreach ($fichiers as $rel) {
        $zip->addFile(SAUV_RACINE . '/' . $rel, $rel);
    }

    // Un mode d'emploi DANS l'archive. Une sauvegarde se retrouve des
    // mois plus tard, souvent par quelqu'un qui ne l'a pas faite.
    $zip->addFromString('LISEZ-MOI.txt', sauv_notice(count($fichiers)));

    if (!$zip->close()) {
        fwrite(STDERR, "L'écriture de l'archive a échoué\n");
        exit(2);
    }
    return [$chemin, count($fichiers) + 2];
}

function sauv_notice(int $nbFichiers): string {
    return "CigarOdyssey — sauvegarde du " . date('d/m/Y') . "\n"
        . str_repeat('=', 46) . "\n\n"
        . "CE QUE CONTIENT CETTE ARCHIVE\n"
        . "  donnees-personnelles.sql   " . count(sauv_tables()) . " tables\n"
        . "  uploads/                   $nbFichiers fichiers\n\n"
        . "C'est tout ce que le depot Git ne porte PAS. Le reste du site —\n"
        . "code, structure de la base, contenu de l'atlas, traductions —\n"
        . "vit dans le depot, et se remonte de la :\n\n"
        . "  mysql -u <user> -p <base> < sql/schema.sql\n"
        . "  mysql -u <user> -p <base> < sql/contenu.sql\n"
        . "  mysql -u <user> -p <base> < donnees-personnelles.sql\n"
        . "  puis copier uploads/ a la racine du site\n\n"
        . "L'ORDRE COMPTE : les avis et les messages referencent des\n"
        . "etablissements et des rubriques qui doivent exister d'abord.\n\n"
        . "CE QUI N'Y EST PAS\n"
        . "  Le .env — mot de passe de la base et cle d'administration.\n"
        . "  Cette archive est faite pour voyager ; eux non. Ils se rangent\n"
        . "  dans un gestionnaire de mots de passe, separement.\n";
}

/**
 * Relit une archive et rend compte. Une sauvegarde qu'on n'a jamais
 * rouverte est une espérance, pas une sauvegarde.
 */
function sauv_verifier(string $chemin): int {
    if (!is_file($chemin)) { fwrite(STDERR, "Introuvable : $chemin\n"); return 1; }

    $zip = new ZipArchive();
    if ($zip->open($chemin) !== true) { fwrite(STDERR, "Archive illisible : $chemin\n"); return 1; }

    $sql = $zip->getFromName('donnees-personnelles.sql');
    $entrees = $zip->numFiles;
    $images  = 0;
    for ($i = 0; $i < $entrees; $i++) {
        if (str_starts_with((string)$zip->getNameIndex($i), 'uploads/')) $images++;
    }
    $zip->close();

    if ($sql === false) { fwrite(STDERR, "Le dump SQL manque dans l'archive.\n"); return 1; }

    $inserts = substr_count($sql, 'INSERT INTO');
    printf("  archive   %s (%.1f Mo)\n", basename($chemin), filesize($chemin) / 1048576);
    printf("  SQL       %d instruction(s) INSERT\n", $inserts);
    printf("  fichiers  %d\n", $images);

    // Confrontation à la base VIVANTE : une archive qui compte moins de
    // lignes que la base a manqué quelque chose. Plus, c'est qu'elle a
    // vieilli — ce n'est pas une faute, mais il faut le dire.
    $vivant = 0;
    foreach (sauv_tables() as $t) {
        try { $vivant += (int)getDB()->query("SELECT COUNT(*) FROM `$t`")->fetchColumn(); }
        catch (Throwable $e) { /* table absente : le dump n'en aura pas non plus */ }
    }
    $disque = count(sauv_fichiers_uploads());
    printf("  en base   %d ligne(s), %d fichier(s) sur le disque\n", $vivant, $disque);

    if ($inserts < $vivant) {
        fwrite(STDERR, "  ⚠ l'archive porte MOINS de lignes que la base : elle a vieilli.\n");
        return 1;
    }
    if ($images < $disque) {
        fwrite(STDERR, "  ⚠ l'archive porte MOINS de fichiers que le disque.\n");
        return 1;
    }
    echo "  archive relue et coherente avec la base.\n";
    return 0;
}

/** Ne garder que les N archives les plus récentes. */
function sauv_rotation(string $dossier, int $garder): array {
    $vues = glob(rtrim($dossier, '\\/') . DIRECTORY_SEPARATOR . 'cigarodyssey-*.zip') ?: [];
    rsort($vues);                       // le nom porte la date : l'ordre alphabétique suffit
    $trop = array_slice($vues, $garder);
    foreach ($trop as $f) @unlink($f);
    return $trop;
}

// ── Ligne de commande ────────────────────────────────────
if (PHP_SAPI === 'cli' && !defined('SAUVEGARDE_INCLUDE')) {
    $opt      = getopt('', ['vers:', 'garder:', 'verifier:']);
    // Par défaut HORS du dépôt : une sauvegarde rangée dans le dossier
    // qu'elle sauvegarde ne survit pas à ce qui emporte ce dossier.
    $dossier  = $opt['vers'] ?? dirname(realpath(SAUV_RACINE)) . DIRECTORY_SEPARATOR . 'cigarodyssey-sauvegardes';
    $garder   = isset($opt['garder']) ? max(1, (int)$opt['garder']) : 7;

    if (isset($opt['verifier'])) exit(sauv_verifier((string)$opt['verifier']));

    echo "CigarOdyssey — sauvegarde de ce que Git ne porte pas\n";
    [$chemin, $entrees] = sauv_ecrire($dossier);
    printf("  ecrite    %s\n", $chemin);
    printf("  entrees   %d\n", $entrees);

    // On la RELIT immédiatement. Une archive annoncée sans avoir été
    // rouverte est une promesse, pas une sauvegarde.
    $code = sauv_verifier($chemin);

    $retirees = sauv_rotation($dossier, $garder);
    if ($retirees) printf("  rotation  %d archive(s) plus ancienne(s) retiree(s)\n", count($retirees));

    exit($code);
}
