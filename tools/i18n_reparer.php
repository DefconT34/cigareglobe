<?php
// ════════════════════════════════════════════════════════
// tools/i18n_reparer.php — Réparer la corruption des traductions
// ────────────────────────────────────────────────────────
// Un script de traduction defaillant a laisse deux traces distinctes
// dans le contenu, colonnes francaises comprises :
//
//   1. SUBSTITUTION MOT A MOT — du francais dans lequel des mots ont ete
//      remplaces un a un par leur equivalent anglais, sans toucher a la
//      syntaxe : « Cave historic », « truffes and grands cigares »,
//      « présente since le début », « Foundede en 1870 ». Reparable :
//      on remet les mots francais.
//
//   2. TRONCATURE A L'APOSTROPHE — le texte s'arrete net sur « d' » ou
//      « de l' ». Le script decoupait sur l'apostrophe. Ce qui suivait
//      est perdu, et aucun traitement ne le ramenera : ces valeurs sont
//      signalees, jamais « reparees » par une invention.
//
//   php tools/i18n_reparer.php              # simulation, rien n'est ecrit
//   php tools/i18n_reparer.php --appliquer  # ecrit
//   php tools/i18n_reparer.php --perdues    # liste ce qui est irrecuperable
//
// La substitution n'est inversee que dans une valeur RECONNUE FRANCAISE :
// « and » est legitime dans une colonne anglaise, et le confondre avec
// l'artefact abimerait des traductions correctes.
// ════════════════════════════════════════════════════════

if (PHP_SAPI !== 'cli') { http_response_code(404); exit; }

require_once __DIR__ . '/../backend/config.php';
require_once __DIR__ . '/i18n_contenu_plan.php';

/** Mots parachutes par le script fautif, et leur original francais. */
function substitutions(): array {
    return [
        '/\bFoundede\b/u'            => 'Fondée',
        '/\bfoundede\b/u'            => 'fondée',
        '/\bofficia[l]{2}es\b/iu'    => 'officielles',
        '/\bofficia[l]{2}e\b/iu'     => 'officielle',
        '/\bhistoric\b/u'            => 'historique',
        '/\bHistoric\b/u'            => 'Historique',
        '/ and /u'                   => ' et ',
        '/\bsince (le|la|les|l\')/u' => 'depuis $1',
        '/\bsince (\d)/u'            => 'depuis $1',
        '/\bluxury\b/u'              => 'luxe',
        '/\breferences\b/u'          => 'références',
    ];
}

/**
 * La valeur est-elle du francais ? Sinon on n'y touche pas.
 *
 * Un simple accent ne suffit pas : « Bolívar is the cigar… Founded in
 * 1902 and named… » est de l'anglais parfaitement correct, et y
 * remplacer « and » par « et » abimerait une traduction juste. On exige
 * donc que les mots outils francais dominent nettement les anglais.
 */
function est_francais(string $v): bool {
    $mots = preg_split('/[^\p{L}\']+/u', mb_strtolower($v), -1, PREG_SPLIT_NO_EMPTY);
    $fr = ['de','la','le','les','du','des','dans','avec','pour','sur','une','un',
           'au','aux','par','est','sont','qui','plus','cette','ses','son','leur',
           'depuis','entre','sans','vers','chez'];
    $en = ['the','of','in','is','was','that','this','has','have','with','from',
           'to','for','as','it','its','their','which','were','been','are'];
    $nFr = 0; $nEn = 0;
    foreach ($mots as $m) {
        if (in_array($m, $fr, true)) $nFr++;
        elseif (in_array($m, $en, true)) $nEn++;
    }
    // Deux portes : une phrase longue doit montrer du francais en nombre ;
    // une valeur courte (« La Casa del Habano officialle du Botswana »)
    // n'en a pas trois, mais l'absence totale de mot outil anglais suffit
    // a ecarter le risque de toucher a de l'anglais correct.
    return ($nFr >= 3 && $nFr > 2 * $nEn) || ($nFr >= 1 && $nEn === 0);
}

/** Texte ampute par le decoupage sur l'apostrophe. */
function est_tronque(string $v): bool {
    return (bool)preg_match('/(\b[ldsnjt]\'|\bde l\'|\bd\')\s*$/u', $v);
}

$appliquer = in_array('--appliquer', $argv, true);
$perdues   = in_array('--perdues', $argv, true);
// Vide les traductions tronquees pour qu'elles ressortent a l'export.
// Jamais la colonne source : elle, il faut la reecrire a la main, et
// l'effacer ferait disparaitre le peu qui subsiste.
$vider     = in_array('--vider-tronquees', $argv, true);

$db = getDB();
$repare = 0; $vues = 0; $tronquees = [];
$exemples = [];

foreach (plan_contenu() as $table => $champs) {
    $cols = [];
    $pk = null;
    foreach ($db->query("DESCRIBE `$table`") as $c) {
        $cols[] = $c['Field'];
        if ($c['Key'] === 'PRI') $pk = $pk ?? $c['Field'];
    }
    if (!$pk) continue;

    foreach ($champs as $champ) {
        foreach (array_merge([''], LANGUES_CIBLES) as $l) {
            $col = $champ . ($l ? '_' . $l : '');
            if (!in_array($col, $cols, true)) continue;

            $q = $db->query("SELECT `$pk` k, `$col` v FROM `$table`
                             WHERE `$col` IS NOT NULL AND `$col` <> ''");
            $st = $db->prepare("UPDATE `$table` SET `$col` = ? WHERE `$pk` = ?");

            foreach ($q as $r) {
                $v = $r['v'];
                $vues++;

                if (est_tronque($v)) {
                    $tronquees[] = ['t' => $table, 'c' => $col, 'k' => $r['k'], 'v' => $v];
                    if ($vider && $l !== '') {
                        $db->prepare("UPDATE `$table` SET `$col` = NULL WHERE `$pk` = ?")
                           ->execute([$r['k']]);
                        continue;
                    }
                }
                if (!est_francais($v)) continue;

                $neuf = $v;
                foreach (substitutions() as $motif => $remplacement) {
                    $neuf = preg_replace($motif, $remplacement, $neuf);
                }
                if ($neuf === $v) continue;

                $repare++;
                if (count($exemples) < 6) {
                    $exemples[] = ['c' => $col, 'av' => $v, 'ap' => $neuf];
                }
                if ($appliquer) $st->execute([$neuf, $r['k']]);
            }
        }
    }
}

if ($perdues) {
    printf("%d valeur(s) tronquee(s) a l'apostrophe — contenu perdu, a reecrire :\n\n",
           count($tronquees));
    foreach ($tronquees as $t) {
        printf("  %-20s %-18s %-6s  %s\n", $t['t'], $t['c'], $t['k'], $t['v']);
    }
    exit(0);
}

printf("%d valeur(s) examinee(s)\n", $vues);
printf("%d valeur(s) %s\n", $repare, $appliquer ? 'reparee(s)' : 'reparable(s) [simulation]');
printf("%d valeur(s) tronquee(s) — irrecuperables (voir --perdues)\n\n", count($tronquees));

foreach ($exemples as $e) {
    echo "  [", $e['c'], "]\n";
    echo "   avant : ", mb_substr($e['av'], 0, 96), "\n";
    echo "   apres : ", mb_substr($e['ap'], 0, 96), "\n\n";
}
if (!$appliquer) echo "Rien n'a ete ecrit. Relancer avec --appliquer.\n";
