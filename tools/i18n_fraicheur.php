<?php
// ════════════════════════════════════════════════════════
// tools/i18n_fraicheur.php — Une traduction est-elle encore à jour ?
// ────────────────────────────────────────────────────────
// Une colonne « champ_xx » ne sait dire que « pleine » ou « vide ».
// Elle ne sait pas de QUEL français elle est la traduction. Deux angles
// morts en découlaient :
//
//   - du charabia comptait pour traduit, puisque la colonne est pleine ;
//   - corriger un texte français laissait ses cinq traductions décrire
//     l'ancien, sans que rien ne le signale.
//
// La table translation_status (migration 009) retient l'empreinte du
// français au moment de la traduction. Le reste se déduit.
//
//   php tools/i18n_fraicheur.php              # rapport
//   php tools/i18n_fraicheur.php --sceller    # état de référence initial
//   php tools/i18n_fraicheur.php --perimees   # export des périmées
//   php tools/i18n_fraicheur.php --relu <fichier.json>   # marquer relu
//
// Cette table n'est jamais lue par le site : c'est un instrument, pas un
// chemin d'exécution. Les colonnes restent la source servie.
// ════════════════════════════════════════════════════════

if (PHP_SAPI !== 'cli') { http_response_code(404); exit; }

require_once __DIR__ . '/../backend/config.php';
require_once __DIR__ . '/i18n_contenu_plan.php';

$db = getDB();

/**
 * Parcourt toutes les traductions existantes et rend, pour chacune,
 * l'etat compare a l'empreinte enregistree.
 *
 * @return array<int,array{t:string,k:string,c:string,l:string,src:string,etat:string}>
 */
function inventaire(PDO $db): array {
    $connu = [];
    try {
        $q = $db->query('SELECT entite, entite_id, champ, lang, source_hash, statut
                         FROM translation_status');
        foreach ($q as $r) {
            $connu[$r['entite'] . '|' . $r['entite_id'] . '|' . $r['champ'] . '|' . $r['lang']]
                = [$r['source_hash'], $r['statut']];
        }
    } catch (Throwable $e) {
        fwrite(STDERR, "translation_status absente — appliquer la migration 009.\n");
        exit(2);
    }

    $out = [];
    foreach (plan_contenu() as $table => $champs) {
        $pk = cles_primaires($db, $table);
        if (!$pk) continue;
        $cols = colonnes_de($db, $table);

        foreach ($champs as $champ) {
            $traduites = array_values(array_filter(LANGUES_CIBLES,
                fn($l) => in_array($champ . '_' . $l, $cols, true)));
            if (!$traduites) continue;

            $sel = '`' . implode('`, `', $pk) . "`, `$champ` src";
            foreach ($traduites as $l) $sel .= ", `{$champ}_{$l}` `$l`";
            $q = $db->query("SELECT $sel FROM `$table`
                             WHERE `$champ` IS NOT NULL AND `$champ` <> ''");

            foreach ($q as $r) {
                $h  = empreinte_source($r['src']);
                $id = identite_ligne($pk, $r);
                foreach ($traduites as $l) {
                    $vide = trim((string)$r[$l]) === '';
                    $cle  = "$table|$id|$champ|$l";
                    $ref  = $connu[$cle] ?? null;

                    if ($vide)                   $etat = 'manquante';
                    elseif ($ref === null)       $etat = 'non-scellee';
                    elseif ($ref[0] !== $h)      $etat = 'perimee';
                    elseif ($ref[1] === 'relu')  $etat = 'relue';
                    else                         $etat = 'a-jour';

                    $out[] = ['t' => $table, 'k' => $id, 'c' => $champ,
                              'l' => $l, 'src' => $r['src'], 'etat' => $etat];
                }
            }
        }
    }
    return $out;
}

// ── Sceller : poser l'etat de reference ───────────────────
if (in_array('--sceller', $argv, true)) {
    $st = $db->prepare(
        'INSERT INTO translation_status
             (entite, entite_id, champ, lang, source_hash, statut)
         VALUES (?, ?, ?, ?, ?, ?)
         ON DUPLICATE KEY UPDATE source_hash = VALUES(source_hash)'
    );
    $n = 0;
    foreach (inventaire($db) as $e) {
        // On ne scelle QUE ce qui est deja traduit. Une case vide n'a
        // pas d'empreinte a retenir : elle est manquante, point.
        if ($e['etat'] === 'manquante') continue;
        $st->execute([$e['t'], $e['k'], $e['c'], $e['l'],
                      empreinte_source($e['src']), 'machine']);
        $n++;
    }
    printf("%d traduction(s) scellee(s) sur le francais actuel.\n", $n);
    echo "Statut « machine » : rien n'est declare relu tant qu'un humain ne l'a pas dit.\n";
    exit(0);
}

// ── Marquer comme relu ────────────────────────────────────
$posRelu = array_search('--relu', $argv, true);
if ($posRelu !== false) {
    $f = $argv[$posRelu + 1] ?? '';
    if (!is_file($f)) { fwrite(STDERR, "ABANDON : $f introuvable\n"); exit(2); }
    $d = json_decode(file_get_contents($f), true);
    if (!is_array($d)) { fwrite(STDERR, "ABANDON : JSON invalide.\n"); exit(2); }
    $st = $db->prepare("UPDATE translation_status SET statut = 'relu'
                        WHERE entite = ? AND entite_id = ? AND champ = ? AND lang = ?");
    $n = 0;
    foreach ($d as $e) {
        $st->execute([$e['entite'], $e['entite_id'], $e['champ'], $e['lang']]);
        $n += $st->rowCount();
    }
    printf("%d traduction(s) marquee(s) relue(s).\n", $n);
    exit(0);
}

// ── Export des perimees ───────────────────────────────────
if (in_array('--perimees', $argv, true)) {
    $out = [];
    foreach (inventaire($db) as $e) {
        if ($e['etat'] !== 'perimee') continue;
        $out[$e['t'] . '.' . $e['c']][$e['src']][$e['l']] = '';
    }
    echo json_encode($out, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES), "\n";
    echo "\n"; // separateur, le compte part sur stderr
    fwrite(STDERR, count($out) . " champ(s) concerne(s). Reappliquer via i18n_contenu.php --importer --forcer.\n");
    exit(0);
}

// ── Rapport (defaut) ──────────────────────────────────────
$inv = inventaire($db);
$parEtat = ['relue' => 0, 'a-jour' => 0, 'perimee' => 0, 'non-scellee' => 0, 'manquante' => 0];
$parTable = [];
foreach ($inv as $e) {
    $parEtat[$e['etat']]++;
    $parTable[$e['t']][$e['etat']] = ($parTable[$e['t']][$e['etat']] ?? 0) + 1;
}

echo "CigarOdyssey — fraicheur des traductions\n\n";
printf("  %-13s %5d  verifiee par un humain\n",       'relue',       $parEtat['relue']);
printf("  %-13s %5d  traduite depuis le francais actuel\n", 'a jour', $parEtat['a-jour']);
printf("  %-13s %5d  le francais a change depuis\n",  'perimee',     $parEtat['perimee']);
printf("  %-13s %5d  presente, origine inconnue\n",   'non scellee', $parEtat['non-scellee']);
printf("  %-13s %5d  case vide\n\n",                  'manquante',   $parEtat['manquante']);

foreach ($parTable as $t => $c) {
    printf("  %-20s", $t);
    foreach (['relue','a-jour','perimee','non-scellee','manquante'] as $e) {
        if (!empty($c[$e])) printf(" %s:%d", $e, $c[$e]);
    }
    echo "\n";
}

// Fraicheur et qualite sont deux axes distincts, et les confondre serait
// refaire l'erreur que cet outil corrige. « a jour » ne dit qu'une chose :
// le francais n'a pas bouge depuis. La valeur peut parfaitement etre du
// charabia — c'est le cas de plusieurs centaines d'entre elles. Seul
// « relue » engage quelqu'un.
$total = count($inv);
// ON ARRONDIT VERS LE BAS, PAS AU PLUS PROCHE.
//
// Avec round(), 6905 sur 6925 s'affichait « 100 % » alors que vingt
// traductions etaient perimees. Un compteur qui annonce la perfection
// tant qu'il reste moins d'un demi-pourcent de defauts est precisement
// ce que ce depot passe son temps a debusquer ailleurs. 100 % ne doit
// s'afficher que si le compte est exact.
printf("\n%d / %d a jour (%d%%) — le francais n'a pas bouge depuis\n",
       $parEtat['a-jour'] + $parEtat['relue'], $total,
       $total ? (int)floor(100 * ($parEtat['a-jour'] + $parEtat['relue']) / $total) : 0);
printf("%d / %d relues (%d%%) — seul chiffre qui engage quelqu'un\n",
       $parEtat['relue'], $total, $total ? round(100 * $parEtat['relue'] / $total) : 0);

if ($parEtat['non-scellee']) {
    echo "\nDes traductions n'ont pas d'empreinte : php tools/i18n_fraicheur.php --sceller\n";
}
if ($parEtat['perimee']) {
    echo "Des traductions decrivent un francais qui a change :\n";
    echo "  php tools/i18n_fraicheur.php --perimees > perimees.json\n";
}
if ($parEtat['manquante']) {
    echo "Des cases sont vides face a un francais rempli :\n";
    echo "  php tools/i18n_contenu.php --propager   (si le francais est deja traduit ailleurs)\n";
    echo "  php tools/i18n_contenu.php --exporter   (sinon)\n";
}

// CE RAPPORT SORT EN ERREUR quand quelque chose cloche, et c'est le
// coeur de E6.
//
// Cet outil existait depuis la migration 009 et n'a JAMAIS ete lance :
// il sortait toujours en 0, donc rien ne pouvait s'en servir. La
// migration 026 a corrige dix textes francais en laissant dix
// traductions decrire l'ancien ; il aurait suffi de l'appeler pour le
// voir. Un controle sans code de sortie n'est pas un controle, c'est
// une page qu'on ne lit pas.
//
// Il est desormais appele par tests/run.php. Le compteur « relue »
// n'entre pas dans le verdict : personne n'a jamais relu, et faire
// echouer la campagne sur ce chiffre la rendrait rouge en permanence —
// c'est-a-dire inutile.
// ── LES PÉRIMÉES ASSUMÉES : UN CLIQUET, PAS UN SCEAU ────
//
// La promotion vers le français (migrations 101 et suivantes) réécrit
// délibérément la colonne source de 40 fiches. Les quatre traductions
// deviennent alors périmées — c'est EXACT, et c'est le but : la dette
// était invisible, elle devient comptée.
//
// Deux mauvaises réponses, et une bonne.
//
//   Resceller (--sceller) déclarerait ces traductions « à jour » sans
//   qu'une seule ait été retraduite. C'est le mensonge exact que la
//   migration 095 a mis au jour : une fiche entièrement en français dans
//   sa colonne anglaise paraissait fraîche.
//
//   Laisser le test rouge en permanence le rendrait inutile — la même
//   raison pour laquelle le compteur « relue » n'entre pas au verdict.
//
//   On NOMME donc les périmées connues dans un fichier de référence.
//   Elles restent périmées, elles sont comptées et listées, et toute
//   NOUVELLE péremption échoue. Le stock ne peut que descendre, à mesure
//   que les traductions sont refaites.
//
//   php tools/i18n_fraicheur.php --figer-attente
$refAttente = __DIR__ . '/i18n_attente_baseline.json';
$perimees = [];
foreach (inventaire($db) as $e) {
    if ($e['etat'] === 'perimee') $perimees["{$e['t']}.{$e['c']}|{$e['k']}|{$e['l']}"] = true;
}
ksort($perimees);

if (in_array('--figer-attente', $argv, true)) {
    file_put_contents($refAttente, json_encode(array_keys($perimees),
        JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES));
    printf("%d traduction(s) en attente enregistree(s) dans %s\n",
           count($perimees), basename($refAttente));
    exit(0);
}

$attendues = [];
foreach (json_decode((string)@file_get_contents($refAttente), true) ?: [] as $k) $attendues[$k] = true;
$nouvellesPerimees = array_diff_key($perimees, $attendues);
$retraduites       = array_diff_key($attendues, $perimees);

if ($attendues) {
    printf("\n  %d traduction(s) perimee(s) CONNUES : la source a ete reecrite,\n"
         . "    la traduction reste a faire. Elles ne sont pas scellees.\n", count($attendues));
    if ($retraduites) printf("  %d retraduite(s) depuis — penser a --figer-attente\n", count($retraduites));
}
foreach ($nouvellesPerimees as $k => $_) echo "  ECHEC  nouvelle perimee : $k\n";

$defauts = count($nouvellesPerimees) + $parEtat['non-scellee'] + $parEtat['manquante'];
exit($defauts > 0 ? 1 : 0);
