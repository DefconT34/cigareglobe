<?php
// ════════════════════════════════════════════════════════
// tools/prevol.php — Le site est-il en état de partir ?
// ────────────────────────────────────────────────────────
// POURQUOI CET OUTIL EXISTE
//
// Le `.env` du poste de développement porte les valeurs du poste de
// développement. C'est normal. Ce qui ne l'est pas, c'est que rien
// n'empêchait de mettre en ligne avec elles.
//
// Relevé sur cette machine avant d'écrire ce fichier :
//
//   MAIL_LOG_ONLY  true            aucun email ne part
//   SITE_URL       127.0.0.1:8099  les liens des emails ne mènent nulle part
//   ALLOWED_ORIGIN *               n'importe quelle origine lit l'API
//   ADMIN_EMAIL    dev@example.com
//
// Le premier suffit à tuer le site sans rien casser de visible : sans
// email de vérification, personne ne confirme son adresse, donc
// personne n'écrit un avis, ne propose un établissement ni ne poste un
// message. La page s'affiche, le globe tourne, et l'espace
// communautaire est mort-né. On le découvrirait par le message d'un
// visiteur, des semaines plus tard — la même façon dont les tuiles
// CARTO se sont éteintes.
//
// UN CONTRÔLE QUI NE SE PROUVE PAS NE VAUT RIEN
// Lancé sur cette machine, ce script DOIT crier : c'est un poste de
// développement. Il ne peut donc pas se vérifier lui-même en passant
// au vert. `--autotest` le confronte à des environnements CONSTRUITS —
// un complet, un vide, et un piégé sur chaque défaut connu — et vérifie
// que chaque constat se lève quand il faut, et se tait sinon. C'est ce
// que la campagne de tests lance.
//
// USAGE
//   php tools/prevol.php            l'environnement courant
//   php tools/prevol.php --autotest les cas construits (0 = conformes)
//
// Code de sortie : 0 si aucun blocage, 1 sinon.
// ════════════════════════════════════════════════════════

if (PHP_SAPI !== 'cli' && !defined('PREVOL_INCLUDE')) { http_response_code(404); exit; }

require_once __DIR__ . '/../backend/config.php';

const PREVOL_RACINE = __DIR__ . '/..';

/** Un constat. `bloquant` empêche le décollage ; `avertissement` non. */
function prevol_constat(string $niveau, string $sujet, string $dit, string $remede = ''): array {
    return ['niveau' => $niveau, 'sujet' => $sujet, 'dit' => $dit, 'remede' => $remede];
}

/**
 * Les valeurs qui décident. Rassemblées ici, et NON lues directement
 * dans les contrôles : c'est ce qui permet de leur présenter un
 * environnement construit, et donc de les éprouver.
 *
 * Les constantes conditionnelles de config.php (APP_DEBUG, MAIL_LOG_ONLY,
 * SITE_URL) ne sont définies que lorsqu'elles valent quelque chose —
 * d'où les `defined()`.
 */
function prevol_environnement(): array {
    return [
        'site_url'       => defined('SITE_URL') ? SITE_URL : '',
        'allowed_origin' => defined('ALLOWED_ORIGIN') ? (string)ALLOWED_ORIGIN : '',
        'app_debug'      => defined('APP_DEBUG') && APP_DEBUG,
        'mail_log_only'  => defined('MAIL_LOG_ONLY') && MAIL_LOG_ONLY,
        'mail_driver'    => defined('MAIL_DRIVER') ? (string)MAIL_DRIVER : '',
        'mail_api_key'   => defined('MAIL_API_KEY') ? (string)MAIL_API_KEY : '',
        'mail_from'      => defined('MAIL_FROM') ? (string)MAIL_FROM : '',
        'admin_email'    => (string)ADMIN_EMAIL,
        'admin_key'      => (string)ADMIN_KEY,
        'db_pass'        => (string)DB_PASS,
        'db_user'        => (string)DB_USER,
        // Ce qui ne vient pas du .env mais décide autant.
        'legal_a_trous'  => str_contains(
            (string)@file_get_contents(PREVOL_RACINE . '/legal.php'), 'À COMPLÉTER'),
        'contenu_present'=> is_file(PREVOL_RACINE . '/sql/contenu.sql'),
        'env_ignore'     => prevol_env_hors_depot(),
    ];
}

/** Le `.env` est-il tenu hors du dépôt ? Un secret versionné est un secret perdu. */
function prevol_env_hors_depot(): bool {
    $code = 0; $sortie = [];
    exec('git -C ' . escapeshellarg(PREVOL_RACINE) . ' check-ignore -q .env 2>&1', $sortie, $code);
    return $code === 0;   // 0 = ignoré, donc hors du dépôt
}

/**
 * Les contrôles. Fonction PURE : même environnement, mêmes constats.
 * C'est cette pureté qui rend `--autotest` possible.
 *
 * @return array<int,array> constats, dans l'ordre de gravité d'apparition
 */
function prevol_controles(array $e): array {
    $c = [];

    // ── Ce qui tue le site en silence ────────────────────
    if ($e['mail_log_only']) {
        $c[] = prevol_constat('bloquant', 'MAIL_LOG_ONLY',
            'Aucun email ne partirait. Sans email de vérification, personne ne '
          . 'confirme son adresse — donc aucun avis, aucune contribution, aucun message.',
            'MAIL_LOG_ONLY=false');
    }
    $url = $e['site_url'];
    if ($url === '') {
        $c[] = prevol_constat('bloquant', 'SITE_URL',
            'Non renseignée : les liens des emails seraient construits sur l’hôte '
          . 'de la requête, donc sur ce que l’appelant a écrit.',
            'SITE_URL=https://votre-domaine');
    } elseif (preg_match('#^https?://(localhost|127\.|0\.0\.0\.0|192\.168\.|10\.)#i', $url)) {
        $c[] = prevol_constat('bloquant', 'SITE_URL',
            'Adresse locale (' . $url . ') : chaque email enverrait le lecteur chez lui.',
            'SITE_URL=https://votre-domaine');
    } elseif (!str_starts_with($url, 'https://')) {
        $c[] = prevol_constat('bloquant', 'SITE_URL',
            'En clair (' . $url . ') alors que le site impose HTTPS et déclare HSTS.',
            'SITE_URL=https://…');
    }

    // ── Ce qui ouvre une porte ───────────────────────────
    if ($e['app_debug']) {
        $c[] = prevol_constat('bloquant', 'APP_DEBUG',
            'Les messages d’erreur techniques partiraient au client : schéma de la '
          . 'base et arborescence des fichiers.',
            'APP_DEBUG=false');
    }
    if (trim($e['allowed_origin']) === '*') {
        $c[] = prevol_constat('bloquant', 'ALLOWED_ORIGIN',
            'Toute origine peut lire l’API depuis un navigateur, avec les cookies de session.',
            'ALLOWED_ORIGIN=https://votre-domaine,https://www.votre-domaine');
    }
    if ($e['admin_key'] === '') {
        $c[] = prevol_constat('bloquant', 'ADMIN_KEY',
            'Vide : l’écran d’administration ne peut plus s’ouvrir par la clé.',
            'ADMIN_KEY=<au moins 32 caractères aléatoires>');
    } elseif (strlen($e['admin_key']) < 32) {
        $c[] = prevol_constat('avertissement', 'ADMIN_KEY',
            'Courte (' . strlen($e['admin_key']) . ' caractères). Elle ouvre TOUT : '
          . 'langues, membres, export, suppression définitive.',
            'Au moins 32 caractères aléatoires.');
    }
    if ($e['db_pass'] === '') {
        $c[] = prevol_constat('bloquant', 'DB_PASS',
            'Compte de base de données sans mot de passe (' . $e['db_user'] . ').',
            'Un compte dédié, avec mot de passe, limité à cette base.');
    }
    if (!$e['env_ignore']) {
        $c[] = prevol_constat('bloquant', '.env',
            'Le fichier n’est pas ignoré par Git : les secrets partiraient dans le dépôt.',
            'Ajouter .env au .gitignore, puis roter tout ce qu’il contenait.');
    }

    // ── Ce qui trahit un réglage non repris ──────────────
    foreach ([['admin_email', 'ADMIN_EMAIL'], ['mail_from', 'MAIL_FROM']] as [$cle, $nom]) {
        $v = strtolower(trim($e[$cle]));
        if ($v === '' || str_contains($v, 'example.com') || str_contains($v, 'votre')
            || str_contains($v, 'dev@') || str_contains($v, 'test.local')) {
            $c[] = prevol_constat('bloquant', $nom,
                'Valeur d’exemple ou de développement (' . ($e[$cle] ?: 'vide') . ').',
                $nom . '=une adresse réelle du domaine');
        }
    }
    if ($e['mail_driver'] !== '' && $e['mail_driver'] !== 'mail' && $e['mail_api_key'] === '') {
        $c[] = prevol_constat('bloquant', 'MAIL_API_KEY',
            'Le pilote « ' . $e['mail_driver'] . ' » est choisi mais sa clé est vide : '
          . 'chaque envoi échouerait.',
            'MAIL_API_KEY=<la clé du prestataire>');
    }

    // ── Ce qui manque au dossier ─────────────────────────
    if ($e['legal_a_trous']) {
        $c[] = prevol_constat('bloquant', 'legal.php',
            'Les mentions légales portent encore des blocs « À COMPLÉTER » : identité, '
          . 'statut, adresse, hébergeur. Un document d’apparence complète mais faux vaut '
          . 'moins que pas de document.',
            'Renseigner les blocs, puis relancer ce contrôle.');
    }
    if (!$e['contenu_present']) {
        $c[] = prevol_constat('bloquant', 'sql/contenu.sql',
            'Absent : une base neuve serait vide. Le site répondrait 200 sur une page creuse.',
            'php tools/contenu_dump.php');
    }

    // ── Ce qu'on ne peut que rappeler ────────────────────
    // Aucun de ces points ne se lit dans un fichier : ils ne bloquent
    // donc pas, mais les taire reviendrait à laisser croire que le
    // contrôle couvre tout.
    $c[] = prevol_constat('rappel', 'cron',
        'tools/forum_rappels.php doit tourner une fois par jour, sinon aucun rappel '
      . 'de rendez-vous ne part.', 'Une ligne quotidienne au cPanel — voir docs/emails.md.');
    $c[] = prevol_constat('rappel', 'sauvegarde',
        'uploads/ et les tables personnelles ne sont dans aucun dépôt, par construction.',
        'Une copie hors de cette machine, avant la première visite.');
    $c[] = prevol_constat('rappel', 'DNS',
        'SPF, DKIM et DMARC décident si les emails arrivent ou tombent en indésirable.',
        'php tools/mail_doctor.php');

    return $c;
}

// ════════════════════════════════════════════════════════
// AUTOTEST — les cas construits
// ────────────────────────────────────────────────────────
// Un environnement de référence PROPRE, puis une variante par défaut
// connu. On vérifie que le sujet attendu se lève, et — aussi important —
// que l'environnement propre ne lève RIEN. Un contrôle qui crie sur tout
// ne dit pas plus qu'un contrôle muet.
// ════════════════════════════════════════════════════════
function prevol_env_propre(): array {
    return [
        'site_url'        => 'https://thecigarodyssey.com',
        'allowed_origin'  => 'https://thecigarodyssey.com,https://www.thecigarodyssey.com',
        'app_debug'       => false,
        'mail_log_only'   => false,
        'mail_driver'     => 'brevo',
        'mail_api_key'    => 'xkeysib-quelque-chose',
        'mail_from'       => 'noreply@thecigarodyssey.com',
        'admin_email'     => 'contact@thecigarodyssey.com',
        'admin_key'       => str_repeat('a', 40),
        'db_pass'         => 'un-mot-de-passe',
        'db_user'         => 'cigar',
        'legal_a_trous'   => false,
        'contenu_present' => true,
        'env_ignore'      => true,
    ];
}

function prevol_autotest(): int {
    $cas = [
        ['propre',          [],                                        null],
        ['emails muets',    ['mail_log_only' => true],                 'MAIL_LOG_ONLY'],
        ['url locale',      ['site_url' => 'http://127.0.0.1:8099'],   'SITE_URL'],
        ['url en clair',    ['site_url' => 'http://thecigarodyssey.com'], 'SITE_URL'],
        ['url absente',     ['site_url' => ''],                        'SITE_URL'],
        ['debug ouvert',    ['app_debug' => true],                     'APP_DEBUG'],
        ['cors ouvert',     ['allowed_origin' => '*'],                 'ALLOWED_ORIGIN'],
        ['cle vide',        ['admin_key' => ''],                       'ADMIN_KEY'],
        ['cle courte',      ['admin_key' => 'abc123'],                 'ADMIN_KEY'],
        ['base sans passe', ['db_pass' => ''],                         'DB_PASS'],
        ['env versionne',   ['env_ignore' => false],                   '.env'],
        ['email d exemple', ['admin_email' => 'vous@example.com'],     'ADMIN_EMAIL'],
        ['email de dev',    ['admin_email' => 'dev@example.com'],      'ADMIN_EMAIL'],
        ['expediteur faux', ['mail_from' => 'noreply@votre-domaine'],  'MAIL_FROM'],
        ['pilote sans cle', ['mail_api_key' => ''],                    'MAIL_API_KEY'],
        ['mentions a trous',['legal_a_trous' => true],                 'legal.php'],
        ['contenu absent',  ['contenu_present' => false],              'sql/contenu.sql'],
    ];

    $echecs = 0;
    foreach ($cas as [$nom, $variante, $attendu]) {
        $constats = prevol_controles(array_merge(prevol_env_propre(), $variante));
        $graves   = array_values(array_filter($constats,
            fn($x) => $x['niveau'] === 'bloquant' || $x['niveau'] === 'avertissement'));
        $sujets   = array_column($graves, 'sujet');

        if ($attendu === null) {
            if ($graves) {
                printf("  ECHEC  %-18s l'environnement propre leve : %s\n",
                       $nom, implode(', ', $sujets));
                $echecs++;
            }
            continue;
        }
        if (!in_array($attendu, $sujets, true)) {
            printf("  ECHEC  %-18s %s attendu, obtenu : %s\n",
                   $nom, $attendu, $sujets ? implode(', ', $sujets) : 'rien');
            $echecs++;
        } elseif (count($sujets) > 1) {
            // Un défaut, un constat. Deux constats pour une variante
            // veut dire qu'un contrôle déborde sur le terrain d'un autre.
            printf("  ECHEC  %-18s %s attendu SEUL, obtenu : %s\n",
                   $nom, $attendu, implode(', ', $sujets));
            $echecs++;
        }
    }

    printf("prevol --autotest : %d cas, %d echec(s)\n", count($cas), $echecs);
    return $echecs === 0 ? 0 : 1;
}

// ── Ligne de commande ────────────────────────────────────
if (PHP_SAPI === 'cli' && !defined('PREVOL_INCLUDE')) {
    if (in_array('--autotest', $argv, true)) exit(prevol_autotest());

    $constats = prevol_controles(prevol_environnement());
    $par = ['bloquant' => [], 'avertissement' => [], 'rappel' => []];
    foreach ($constats as $c) $par[$c['niveau']][] = $c;

    echo "CigarOdyssey — controle avant mise en ligne\n";
    echo "  base : " . DB_NAME . "\n\n";

    foreach (['bloquant' => 'BLOQUANT', 'avertissement' => 'AVERTISSEMENT',
              'rappel' => 'A NE PAS OUBLIER'] as $n => $titre) {
        if (!$par[$n]) continue;
        echo $titre . "\n";
        foreach ($par[$n] as $c) {
            printf("  %-16s %s\n", $c['sujet'], wordwrap($c['dit'], 60, "\n" . str_repeat(' ', 19)));
            if ($c['remede']) printf("  %-16s → %s\n", '', $c['remede']);
            echo "\n";
        }
    }

    $n = count($par['bloquant']);
    echo $n === 0
        ? "Aucun blocage. Le reste est affaire de decision.\n"
        : "$n point(s) bloquant(s) : ne pas mettre en ligne en l'etat.\n";
    exit($n === 0 ? 0 : 1);
}
