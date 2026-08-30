<?php
// ════════════════════════════════════════════════════════
// tools/contenu_dump.php — Verser le contenu de l'atlas dans Git
// ────────────────────────────────────────────────────────
// POURQUOI CET OUTIL EXISTE
//
// `sql/README.md` décrivait l'installation ainsi : importer
// `schema.sql`, « puis importer les données (dump séparé, non
// versionné) ». Ce dump n'existait pas.
//
// Mesuré, en construisant une base vierge à partir du seul dépôt :
// 29 des 31 tables peuplées revenaient VIDES. La même requête
// `data.php?action=globe` renvoyait tout l'atlas sur la base réelle et
// cinq tableaux vides depuis Git. La page d'accueil répondait 200 :
// un site en ligne, mis en page, et creux.
//
// Les 500 établissements, 118 marques, 16 fiches pays, 41 zones et 30
// feuilles n'existaient qu'à un seul endroit — le MySQL du poste de
// développement. Aucune migration ne les insère : elles sont
// antérieures au dépôt.
//
// CE QUI EST VERSÉ, ET CE QUI NE L'EST PAS
//
// Le contenu ÉDITORIAL et les données de RÉFÉRENCE, c'est-à-dire ce
// qu'un déploiement neuf doit trouver pour ne pas être vide.
//
// Rien de ce qui appartient aux gens : ni comptes, ni emails, ni avis,
// ni favoris, ni messages, ni contributions, ni journal de modération.
// Ces tables-là ne se versionnent pas — elles se sauvegardent, ce qui
// n'est pas le même geste et n'obéit pas aux mêmes règles.
//
// USAGE
//   php tools/contenu_dump.php              écrit sql/contenu.sql
//   php tools/contenu_dump.php --verifier   ne l'écrit pas ; sort en 1
//                                           si le fichier ne décrit plus
//                                           la base
// ════════════════════════════════════════════════════════

if (PHP_SAPI !== 'cli' && !defined('CONTENU_DUMP_INCLUDE')) { http_response_code(404); exit; }

require_once __DIR__ . '/../backend/config.php';

/**
 * Contenu éditorial et données de référence. L'ordre suit celui des
 * dépendances : `lounge_photos` référence `lounges`, `production_zones`
 * référence `producer_countries`. Importer dans cet ordre évite d'avoir
 * à désactiver les clés étrangères.
 */
const CONTENU_TABLES = [
    // L'atlas
    'producer_countries', 'producer_geo', 'production_zones',
    'markets', 'habanos_presence', 'brands',
    'feuilles', 'aromes', 'lexique',
    // Les établissements
    'lounge_countries', 'lounges', 'lounge_photos',
    // Les traductions du contenu, et leurs scellés
    'content_translations', 'translation_status',
    // Réglages et données de référence
    'site_languages', 'forum_sections', 'forum_tags',
];

/**
 * Tables délibérément ABSENTES, avec la raison. Cette liste n'est pas
 * décorative : le contrôle `--verifier` s'assure que toute table de la
 * base figure dans l'une des deux listes. Une table ajoutée demain et
 * oubliée ici ferait échouer le contrôle plutôt que de disparaître en
 * silence du déploiement — ce qui est exactement l'accident que cet
 * outil répare.
 */
const CONTENU_EXCLUES = [
    'users'            => 'comptes',
    'email_tokens'     => 'jetons de vérification et de réinitialisation',
    'auth_attempts'    => 'limitation de débit, sans valeur au-delà de l’heure',
    'contributions'    => 'propositions des membres',
    'approved_lounges' => 'trace des approbations',
    'reviews'          => 'avis des membres',
    'review_flags'     => 'signalements d’avis',
    'lounge_ratings'   => 'notes des membres',
    'favorites'        => 'listes privées',
    'votes'            => 'votes sur les contributions',
    'moderation_log'   => 'journal de modération',
    'forum_topics'     => 'discussions',
    'forum_posts'      => 'messages',
    'forum_post_images'=> 'images des messages',
    'forum_flags'      => 'signalements du forum',
    'forum_follows'    => 'suivis de sujets',
    'forum_reactions'  => 'réactions',
    'forum_events'     => 'rendez-vous',
    'forum_attendance' => 'inscriptions aux rendez-vous',
    'forum_topic_tags' => 'étiquettes posées sur les discussions',
];

const CONTENU_FICHIER = __DIR__ . '/../sql/contenu.sql';

/**
 * mysqldump. Même raison que dans rejeu_migrations.php : le PATH du
 * poste ne porte pas forcément les binaires de WAMP.
 */
function contenu_binaire(string $nom): string {
    $env = getenv('MYSQL_BIN');
    if ($env && is_file(rtrim($env, '\\/') . DIRECTORY_SEPARATOR . $nom . '.exe')) {
        return rtrim($env, '\\/') . DIRECTORY_SEPARATOR . $nom . '.exe';
    }
    foreach (glob('C:/wamp64/bin/mysql/*/bin/' . $nom . '.exe') ?: [] as $c) return $c;
    foreach (['/usr/bin/', '/usr/local/bin/'] as $d) {
        if (is_file($d . $nom)) return $d . $nom;
    }
    return $nom;   // au PATH de se débrouiller
}

/** L'en-tête du fichier : ce qu'il contient, et ce qu'il ne contient pas. */
function contenu_entete(): string {
    $e = "-- ════════════════════════════════════════════════════════\n"
       . "-- sql/contenu.sql — Le contenu de l'atlas\n"
       . "-- ────────────────────────────────────────────────────────\n"
       . "-- ENGENDRÉ par tools/contenu_dump.php — ne pas modifier à la main.\n"
       . "--\n"
       . "-- S'importe APRÈS sql/schema.sql, qui crée les tables :\n"
       . "--   mysql -u <user> -p <base> < sql/schema.sql\n"
       . "--   mysql -u <user> -p <base> < sql/contenu.sql\n"
       . "--\n"
       . "-- Les fichiers d'images vivent dans uploads/ et ne sont PAS ici :\n"
       . "-- `lounge_photos` en porte les noms, pas les octets. Copier le\n"
       . "-- dossier à côté, sans quoi les fiches montreront des cadres vides.\n"
       . "--\n"
       . "-- CE QUI N'EST DÉLIBÉRÉMENT PAS VERSÉ — ce qui appartient aux\n"
       . "-- gens. Ces tables se sauvegardent, elles ne se versionnent pas :\n";
    foreach (CONTENU_EXCLUES as $t => $raison) {
        $e .= sprintf("--   %-19s %s\n", $t, $raison);
    }
    return $e . "-- ════════════════════════════════════════════════════════\n\n";
}

/** Engendre le contenu du fichier. Renvoie la chaîne, n'écrit rien. */
function contenu_engendrer(): string {
    $tmp = tempnam(sys_get_temp_dir(), 'cgdump');

    // --result-file, JAMAIS une redirection : sous PowerShell, « > »
    // écrit en UTF-16 et le fichier devient illisible par mysql.
    // --skip-comments retire l'horodatage, qui ferait de chaque
    // régénération une modification même à contenu identique.
    $cmd = sprintf(
        '%s --host=%s --port=%s --user=%s %s --default-character-set=utf8mb4 '
        . '--no-create-info --complete-insert --skip-extended-insert '
        . '--skip-comments --no-tablespaces --result-file=%s %s %s',
        escapeshellarg(contenu_binaire('mysqldump')),
        escapeshellarg(DB_HOST), escapeshellarg((string)DB_PORT),
        escapeshellarg(DB_USER),
        DB_PASS !== '' ? '--password=' . escapeshellarg(DB_PASS) : '',
        escapeshellarg($tmp),
        escapeshellarg(DB_NAME),
        implode(' ', array_map('escapeshellarg', CONTENU_TABLES))
    );

    $sortie = [];
    $code   = 0;
    exec($cmd . ' 2>&1', $sortie, $code);
    if ($code !== 0) {
        @unlink($tmp);
        fwrite(STDERR, "mysqldump a échoué :\n  " . implode("\n  ", $sortie) . "\n");
        exit(2);
    }

    $corps = (string)file_get_contents($tmp);
    @unlink($tmp);

    // Les directives de session du dump (/*!40101 …*/) sont conservées :
    // elles posent le jeu de caractères, et un contenu à accents importé
    // sous latin1 arriverait en mojibake sans qu'aucune erreur ne le dise.
    return contenu_entete() . $corps;
}

/**
 * Aucune table ne doit manquer aux deux listes. C'est le garde-fou :
 * une table ajoutée demain sortirait sinon du déploiement en silence.
 * @return string[] les noms non classés
 */
function contenu_tables_non_classees(PDO $db): array {
    $toutes = $db->query('SHOW TABLES')->fetchAll(PDO::FETCH_COLUMN);
    $connues = array_merge(CONTENU_TABLES, array_keys(CONTENU_EXCLUES));
    return array_values(array_diff($toutes, $connues));
}

// ── Ligne de commande ────────────────────────────────────
if (PHP_SAPI === 'cli' && !defined('CONTENU_DUMP_INCLUDE')) {
    $verifier = in_array('--verifier', $argv, true);

    $orphelines = contenu_tables_non_classees(getDB());
    if ($orphelines) {
        fwrite(STDERR, "Tables ni versées ni exclues : " . implode(', ', $orphelines)
            . "\nAjoutez-les à CONTENU_TABLES ou à CONTENU_EXCLUES (avec la raison).\n");
        exit(1);
    }

    $neuf = contenu_engendrer();

    if ($verifier) {
        $ancien = is_file(CONTENU_FICHIER) ? (string)file_get_contents(CONTENU_FICHIER) : '';
        if ($ancien === $neuf) {
            printf("sql/contenu.sql décrit la base (%s, %.1f Mo)\n",
                   DB_NAME, strlen($neuf) / 1048576);
            exit(0);
        }
        fwrite(STDERR, "sql/contenu.sql ne décrit plus la base.\n"
            . "  fichier : " . number_format(strlen($ancien)) . " octets\n"
            . "  base    : " . number_format(strlen($neuf))   . " octets\n"
            . "Rejouer : php tools/contenu_dump.php\n");
        exit(1);
    }

    file_put_contents(CONTENU_FICHIER, $neuf);
    printf("sql/contenu.sql écrit — %d tables, %.1f Mo\n",
           count(CONTENU_TABLES), strlen($neuf) / 1048576);
}
