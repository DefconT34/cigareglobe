<?php
// ════════════════════════════════════════════════════════
// tools/audience.php — Est-ce que quelqu'un vient ?
// ────────────────────────────────────────────────────────
//   php tools/audience.php                 les trente derniers jours
//   php tools/audience.php --jours 7
//   php tools/audience.php --robots        le détail des explorateurs
//   php tools/audience.php --autotest      les cas construits
//
// À LANCER SUR LE SERVEUR : c'est là que vit la base servie. Lancé sur
// le poste de développement, il ne dira que ce qu'on y a soi-même
// cliqué.
//
// ── CE QUE CE RAPPORT NE DIT PAS, ET IL LE DIT ──────────
// 1. LES PAGES SERVIES DEPUIS UN CACHE NE SONT PAS COMPTÉES. Le
//    `.htaccess` pose une heure sur le HTML, l'hébergeur répond
//    `max-age=300`. La première visite de chacun est vue ; les
//    relectures dans l'heure ne le sont pas. Les nombres sont un
//    PLANCHER.
// 2. LES ROBOTS SONT SÉPARÉS, PAS SUPPRIMÉS. Un site neuf reçoit
//    surtout des explorateurs ; les mêler aux lecteurs donnerait une
//    courbe flatteuse et fausse.
// 3. « Visiteurs » est une approximation quotidienne, jamais un suivi :
//    l'empreinte change à minuit, personne n'est suivi d'un jour sur
//    l'autre.
// ════════════════════════════════════════════════════════

if (PHP_SAPI !== 'cli') { http_response_code(404); exit; }

require_once __DIR__ . '/../backend/config.php';
require_once __DIR__ . '/../backend/audience.php';

/**
 * Le rapport tient sur une fenêtre glissante.
 *
 * ⚠ LA VALEUR EST INSÉRÉE DANS LE SQL, ET C'EST VOULU. Un paramètre lié
 * dans `INTERVAL ? DAY` ne se comporte pas pareil sur MySQL et sur
 * MariaDB — le serveur tourne sous MariaDB, la machine de
 * développement sous MySQL, et la première version de ce rapport
 * mourait sur le serveur APRÈS avoir imprimé son en-tête, sans un mot,
 * `display_errors` étant coupé en production.
 *
 * C'est la même famille de piège que les fonctions `JSON_*`, que les
 * migrations de ce dépôt s'interdisent depuis la 179 pour exactement
 * cette raison.
 *
 * L'insertion est sûre : la valeur est bornée entre 1 et 365 et
 * convertie en entier ci-dessous. Rien de ce qui vient de la ligne de
 * commande n'atteint la requête.
 */
function audience_fenetre(array $argv): int {
    $i = array_search('--jours', $argv, true);
    $n = ($i !== false && isset($argv[$i + 1])) ? (int)$argv[$i + 1] : 30;
    return max(1, min(365, $n));
}

/**
 * Les cas construits.
 *
 * Ils éprouvent les trois décisions qui font mentir un rapport
 * d'audience quand elles sont mal prises : ce qu'on garde d'un
 * référent, ce qu'on appelle un robot, et ce qu'on peut remonter d'une
 * empreinte.
 */
function audience_autotest(): int {
    $echecs = 0;
    $dit = function (string $nom, bool $ok, string $obtenu = '') use (&$echecs) {
        if ($ok) { printf("  [ok] %s\n", $nom); return; }
        printf("  ECHEC %s %s\n", $nom, $obtenu); $echecs++;
    };

    // ── Le référent : le domaine, et RIEN d'autre ────────
    // UNE URL DE RECHERCHE PORTE LA REQUÊTE TAPÉE. La garder, ce serait
    // stocker ce que quelqu'un cherchait — un nom, une adresse, une
    // maladie. On ne garde que l'hôte.
    $dit('referent : le domaine est retenu',
         audience_domaine('https://www.google.com/search?q=cigare+padron') === 'google.com',
         (string)audience_domaine('https://www.google.com/search?q=cigare+padron'));
    $dit('referent : la requete tapee est jetee',
         !str_contains((string)audience_domaine('https://google.com/search?q=secret'), 'secret'));
    $dit('referent : le www est retire',
         audience_domaine('https://www.reddit.com/r/cigars') === 'reddit.com');
    $dit('referent : un referent vide ne donne rien',
         audience_domaine('') === null && audience_domaine(null) === null);
    $dit('referent : une chaine qui n est pas une URL non plus',
         audience_domaine('bonjour') === null);

    // ── Les robots ───────────────────────────────────────
    foreach (['Googlebot/2.1', 'Mozilla/5.0 (compatible; bingbot/2.0)', 'curl/8.4.0',
              'python-requests/2.31', 'facebookexternalhit/1.1', 'AhrefsBot/7.0',
              'HeadlessChrome/120'] as $ua) {
        $dit('robot reconnu : ' . mb_substr($ua, 0, 28), audience_robot($ua));
    }
    // CONTRE-ÉPREUVES : de vrais navigateurs, qu'une règle trop gourmande
    // classerait en robots — et le rapport ne montrerait plus personne.
    foreach (['Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0 Safari/537.36',
              'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 Version/17.0 Mobile/15E148 Safari/604.1',
              'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Gecko/20100101 Firefox/121.0'] as $ua) {
        $dit('personne, pas robot : ' . mb_substr($ua, 0, 22), !audience_robot($ua));
    }
    $dit('robot : un agent vide compte comme robot', audience_robot(''));

    // ── L'empreinte ──────────────────────────────────────
    $j1 = '2026-09-10'; $j2 = '2026-09-11';
    $a = audience_empreinte('1.2.3.4', 'UA', $j1);
    $b = audience_empreinte('1.2.3.4', 'UA', $j1);
    $c = audience_empreinte('1.2.3.5', 'UA', $j1);
    $d = audience_empreinte('1.2.3.4', 'UA', $j2);
    if (ADMIN_KEY === '') {
        $dit('empreinte : sans ADMIN_KEY, on ne fabrique rien', $a === null);
    } else {
        $dit('empreinte : stable dans la journee', $a === $b);
        $dit('empreinte : deux visiteurs different', $a !== $c);
        // LA PROPRIÉTÉ QUI REND LE PROCÉDÉ ACCEPTABLE : le même visiteur
        // n'est PAS reconnaissable demain. Sans elle, on suivrait des
        // personnes dans le temps, ce qui est exactement ce qu'on refuse.
        $dit('empreinte : le meme visiteur est illisible le lendemain', $a !== $d);
        $dit('empreinte : douze caracteres, pas plus', strlen((string)$a) === 12);
        $dit('empreinte : l adresse n y est pas lisible',
             !str_contains((string)$a, '1.2.3') && (string)$a !== '1.2.3.4');
    }
    printf("\naudience --autotest : %d echec(s)\n", $echecs);
    return $echecs === 0 ? 0 : 1;
}

if (in_array('--autotest', $argv, true)) exit(audience_autotest());

// ── Le rapport ───────────────────────────────────────────
$jours = audience_fenetre($argv);
try { $db = getDB(); } catch (Throwable $e) {
    echo "Base injoignable : " . $e->getMessage() . "\n"; exit(1);
}
try { $db->query("SELECT 1 FROM `audience` LIMIT 1"); } catch (Throwable $e) {
    echo "La table `audience` n'existe pas : jouer sql/migrations/203_la_mesure_daudience.sql\n";
    exit(1);
}

printf("CigarOdyssey — audience, %d derniers jours\n", $jours);
printf("  base : %s\n\n", DB_NAME);

$p = $db->query(
    "SELECT COUNT(*) AS vues,
            COUNT(DISTINCT `empreinte`) AS visiteurs,
            COUNT(DISTINCT `jour`) AS jours_actifs
       FROM `audience`
      WHERE `robot` = 0 AND `jour` >= (CURDATE() - INTERVAL $jours DAY)");
$h = $p->fetch(PDO::FETCH_ASSOC);

$p2 = $db->query("SELECT COUNT(*) FROM `audience`
                     WHERE `robot` = 1 AND `jour` >= (CURDATE() - INTERVAL $jours DAY)");
$robots = (int)$p2->fetchColumn();

// LE CAS QU'IL FAUT NOMMER : zéro. Un rapport qui affiche « 0 » sans
// rien dire laisse croire à une panne de l'outil.
if ((int)$h['vues'] === 0 && $robots === 0) {
    echo "  Aucune vue enregistree sur la periode.\n\n";
    echo "  Ce n'est pas forcement une absence de visiteurs :\n";
    echo "   · la migration 203 vient peut-etre d'etre jouee ;\n";
    echo "   · ou cet outil tourne sur la base de DEVELOPPEMENT, alors\n";
    echo "     que les visiteurs, eux, arrivent sur le serveur.\n\n";
    exit(0);
}

printf("  %-22s %6d\n", 'pages vues', (int)$h['vues']);
printf("  %-22s %6d\n", 'visiteurs distincts', (int)$h['visiteurs']);
printf("  %-22s %6d\n", 'jours avec au moins 1', (int)$h['jours_actifs']);
printf("  %-22s %6d   (comptes a part, jamais melanges)\n", 'passages de robots', $robots);
echo "\n";

$sections = [
    'PAGES LES PLUS VUES' => "SELECT CONCAT(`type`, ' · ', `chemin`) AS k, COUNT(*) n
                                FROM `audience` WHERE `robot`=0 AND `jour` >= (CURDATE() - INTERVAL $jours DAY)
                            GROUP BY k ORDER BY n DESC LIMIT 12",
    'D\'OU ILS VIENNENT'  => "SELECT COALESCE(`referent`, '(acces direct ou inconnu)') AS k, COUNT(*) n
                                FROM `audience` WHERE `robot`=0 AND `jour` >= (CURDATE() - INTERVAL $jours DAY)
                            GROUP BY k ORDER BY n DESC LIMIT 10",
    'LANGUES'             => "SELECT `lang` AS k, COUNT(*) n
                                FROM `audience` WHERE `robot`=0 AND `jour` >= (CURDATE() - INTERVAL $jours DAY)
                            GROUP BY k ORDER BY n DESC",
];
foreach ($sections as $titre => $sql) {
    $q = $db->query($sql);
    $lignes = $q->fetchAll(PDO::FETCH_ASSOC);
    if (!$lignes) continue;
    echo $titre . "\n";
    foreach ($lignes as $l) printf("  %-52s %5d\n", mb_substr((string)$l['k'], 0, 52), (int)$l['n']);
    echo "\n";
}

if (in_array('--robots', $argv, true)) {
    $q = $db->query("SELECT CONCAT(`type`,' · ',`chemin`) AS k, COUNT(*) n
                       FROM `audience` WHERE `robot`=1 AND `jour` >= (CURDATE() - INTERVAL $jours DAY)
                   GROUP BY k ORDER BY n DESC LIMIT 15");
    echo "CE QUE LES EXPLORATEURS ONT LU\n";
    foreach ($q as $l) printf("  %-52s %5d\n", mb_substr((string)$l['k'], 0, 52), (int)$l['n']);
    echo "\n";
}

echo "Ces nombres sont un PLANCHER : une page servie depuis un cache\n";
echo "n'atteint pas PHP et n'est pas comptee. Le HTML est cache une\n";
echo "heure par le .htaccess, cinq minutes par l'hebergeur.\n";
