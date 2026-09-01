<?php
// ════════════════════════════════════════════════════════
// tools/deployer.php — Poser et mettre à jour le site en ligne
// ────────────────────────────────────────────────────────
// À LANCER SUR LE SERVEUR, jamais depuis le poste de développement.
//
// POURQUOI CET OUTIL PLUTÔT QU'UNE LISTE DE COMMANDES
//
// La procédure tient en six commandes (docs/deploiement.md). Une seule
// d'entre elles est irréversible, et c'est la première :
//
//   mysql … < sql/schema.sql
//
// `schema.sql` commence par des `DROP TABLE IF EXISTS`. Lancé par
// réflexe sur une base qui vit déjà, il efface les comptes, les avis,
// les messages et le journal de modération — tout ce que le dépôt ne
// porte pas, et donc tout ce qui ne se récupère pas d'un `git pull`.
//
// C'est la faute que personne ne commet en écrivant la procédure, et
// que tout le monde finit par commettre en la rejouant à six mois
// d'intervalle. D'où le garde-fou central de ce fichier : l'installation
// REFUSE de s'exécuter sur une base non vide.
//
// USAGE
//   php tools/deployer.php                met à jour le code, puis contrôle
//   php tools/deployer.php --installer    première pose : base + contenu
//   php tools/deployer.php --controler    contrôle seul, ne touche à rien
//   php tools/deployer.php --autotest     éprouve les garde-fous
//
// Code de sortie : 0 si le site est en état, 1 sinon.
// ════════════════════════════════════════════════════════

if (PHP_SAPI !== 'cli' && !defined('DEPLOYER_INCLUDE')) { http_response_code(404); exit; }

const DEPLOYER_RACINE = __DIR__ . '/..';

/** Fichiers SQL de la première pose, dans l'ordre des dépendances. */
const DEPLOYER_POSE = [
    'sql/schema.sql'                        => 'les tables',
    'sql/contenu.sql'                       => 'l’atlas : 500 établissements, 118 marques',
    'sql/migrations/016_forum_amorce.sql'   => 'les sujets d’amorce du forum',
];

/**
 * L'installation est-elle permise ? Renvoie la raison du refus, ou null.
 *
 * LE SEUL VRAI GARDE-FOU DE CE FICHIER. Une base qui porte déjà des
 * tables est une base qui vit : y rejouer `schema.sql` détruirait des
 * données qu'aucun dépôt ne peut rendre.
 *
 * Le compte de tables est le bon critère, et non le compte de lignes :
 * une base fraîchement créée mais déjà structurée par une pose
 * interrompue doit elle aussi bloquer — on ne devine pas ce qu'une pose
 * à moitié faite a laissé derrière elle.
 */
function deployer_refus_installation(int $tables, string $base): ?string {
    if ($base === '') {
        return "DB_NAME est vide : créez le `.env` avant d'installer la base.";
    }
    if ($tables > 0) {
        return "la base « $base » porte déjà $tables table(s).\n"
             . "  `sql/schema.sql` commence par des DROP TABLE : l'installation\n"
             . "  effacerait les comptes, les avis, les messages et le journal.\n"
             . "  Pour une mise à jour, lancez sans --installer.";
    }
    return null;
}

/** Exécute une commande et renvoie [code, sortie]. */
function deployer_executer(string $cmd): array {
    $sortie = [];
    $code   = 0;
    exec($cmd . ' 2>&1', $sortie, $code);
    return [$code, implode("\n", $sortie)];
}

/** Le client mysql, avec les accès du `.env` — jamais sur la ligne de commande. */
function deployer_importer(string $fichier): array {
    // --defaults-file : le mot de passe ne doit pas apparaître dans la
    // liste des processus, où n'importe quel utilisateur du serveur
    // mutualisé pourrait le lire.
    $conf = tempnam(sys_get_temp_dir(), 'cgmy');
    chmod($conf, 0600);
    file_put_contents($conf, "[client]\nhost=" . DB_HOST . "\nport=" . DB_PORT
        . "\nuser=" . DB_USER . "\npassword=\"" . DB_PASS . "\"\n");

    [$code, $out] = deployer_executer(sprintf(
        'mysql --defaults-file=%s --default-character-set=utf8mb4 %s < %s',
        escapeshellarg($conf), escapeshellarg(DB_NAME),
        escapeshellarg(DEPLOYER_RACINE . '/' . $fichier)));

    @unlink($conf);
    return [$code, $out];
}

/** Nombre de tables de la base. -1 si la base est injoignable. */
function deployer_compter_tables(): int {
    try {
        return (int)getDB()->query(
            'SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = DATABASE()'
        )->fetchColumn();
    } catch (Throwable $e) {
        return -1;
    }
}

/** Ce qui ne vient pas du dépôt et doit pourtant être là. */
function deployer_hors_depot(): array {
    $constats = [];

    $img = glob(DEPLOYER_RACINE . '/uploads/lounges/*', GLOB_ONLYDIR) ?: [];
    $constats[] = ['uploads/', count($img) > 0,
        count($img) . ' dossier(s) d’établissement',
        'Le dossier n’est pas dans le dépôt : transférez-le, sinon les fiches '
      . 'montreront des cadres vides sans qu’aucune erreur ne le signale.'];

    $constats[] = ['.env', is_file(DEPLOYER_RACINE . '/.env'),
        'présent', 'À créer sur place — voir docs/deploiement.md.'];

    $constats[] = ['.htaccess', is_file(DEPLOYER_RACINE . '/.htaccess'),
        'présent', 'Sans lui : pas de CSP, pas de HSTS, pas d’URL par langue.'];

    return $constats;
}

// ════════════════════════════════════════════════════════
// AUTOTEST — le garde-fou se prouve
// ════════════════════════════════════════════════════════
function deployer_autotest(): int {
    $cas = [
        // [tables, base,        doit refuser, libellé]
        [0,  'cigar_prod', false, 'base vide : installation permise'],
        [1,  'cigar_prod', true,  'une seule table suffit à refuser'],
        [37, 'cigar_prod', true,  'base complete : refus'],
        [0,  '',           true,  'DB_NAME absent : refus'],
        [37, '',           true,  'ni base ni vide : refus'],
    ];
    $echecs = 0;
    foreach ($cas as [$t, $b, $refuse, $libelle]) {
        $r = deployer_refus_installation($t, $b);
        if (($r !== null) !== $refuse) {
            printf("  ECHEC  %-42s attendu %s, obtenu %s\n", $libelle,
                   $refuse ? 'refus' : 'accord', $r === null ? 'accord' : 'refus');
            $echecs++;
        }
    }
    // Le message doit NOMMER le danger : un refus qui ne dit pas
    // pourquoi se contourne au lieu de se comprendre.
    $msg = (string)deployer_refus_installation(37, 'cigar_prod');
    foreach (['DROP TABLE', 'effacerait', '--installer'] as $attendu) {
        if (!str_contains($msg, $attendu)) {
            printf("  ECHEC  le refus ne mentionne pas « %s »\n", $attendu);
            $echecs++;
        }
    }
    printf("deployer --autotest : %d cas, %d echec(s)\n", count($cas) + 3, $echecs);
    return $echecs === 0 ? 0 : 1;
}

// ── Ligne de commande ────────────────────────────────────
if (PHP_SAPI === 'cli' && !defined('DEPLOYER_INCLUDE')) {
    if (in_array('--autotest', $argv, true)) {
        require_once DEPLOYER_RACINE . '/backend/config.php';
        exit(deployer_autotest());
    }

    require_once DEPLOYER_RACINE . '/backend/config.php';

    $installer = in_array('--installer', $argv, true);
    $controler = in_array('--controler', $argv, true);

    echo "CigarOdyssey — deploiement\n";
    echo '  racine : ' . realpath(DEPLOYER_RACINE) . "\n";
    echo '  base   : ' . (DB_NAME ?: '(non configuree)') . "\n\n";

    // ── Le code ──────────────────────────────────────────
    if (!$controler && !$installer) {
        echo "Mise a jour du code\n";
        [$c, $out] = deployer_executer('git -C ' . escapeshellarg(DEPLOYER_RACINE) . ' pull --ff-only');
        echo '  ' . str_replace("\n", "\n  ", trim($out)) . "\n";
        if ($c !== 0) {
            echo "\n  Echec du git pull. Rien d'autre n'a ete tente.\n";
            exit(1);
        }
        echo "\n";
    }

    // ── La base, une seule fois ──────────────────────────
    if ($installer) {
        echo "Installation de la base\n";
        $tables = deployer_compter_tables();
        if ($tables < 0) {
            echo "  Base injoignable — verifiez les acces du .env.\n";
            exit(1);
        }
        if ($raison = deployer_refus_installation($tables, DB_NAME)) {
            echo "  REFUS : $raison\n";
            exit(1);
        }
        foreach (DEPLOYER_POSE as $fichier => $quoi) {
            printf('  %-38s %s', $fichier, $quoi);
            [$c, $out] = deployer_importer($fichier);
            echo $c === 0 ? "  OK\n" : "  ECHEC\n    " . trim($out) . "\n";
            if ($c !== 0) exit(1);
        }
        printf("  %d table(s) en place.\n\n", deployer_compter_tables());
    }

    // ── Ce qui ne vient pas du depot ─────────────────────
    echo "Ce que le depot ne porte pas\n";
    $manque = 0;
    foreach (deployer_hors_depot() as [$quoi, $ok, $detail, $remede]) {
        printf("  %-12s %s\n", $quoi, $ok ? $detail : 'MANQUANT');
        if (!$ok) { echo '                 → ' . $remede . "\n"; $manque++; }
    }
    echo "\n";

    // ── Le verdict ───────────────────────────────────────
    echo "Controle avant ouverture\n";
    [$c, $out] = deployer_executer(sprintf('%s %s',
        escapeshellarg(PHP_BINARY), escapeshellarg(DEPLOYER_RACINE . '/tools/prevol.php')));
    echo '  ' . str_replace("\n", "\n  ", trim($out)) . "\n\n";

    if ($c === 0 && $manque === 0) {
        echo "Le site est en etat. Reste la tache planifiee :\n";
        echo '  php ' . realpath(DEPLOYER_RACINE) . "/tools/forum_rappels.php  (une fois par jour)\n";
        exit(0);
    }
    echo "Ne pas ouvrir au public en l'etat.\n";
    exit(1);
}
