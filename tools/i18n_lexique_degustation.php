<?php
// ════════════════════════════════════════════════════════
// tools/i18n_lexique_degustation.php — Les mots pleins restés en anglais
// ────────────────────────────────────────────────────────
// LE DÉFAUT, ET POURQUOI LES DEUX AUTRES CONTRÔLES LE MANQUENT.
//
// La migration 123 a trouvé, dans une phrase espagnole par ailleurs
// correcte : « Notas de TOAST, CASHEW, WHITE pimienta ». Trois mots
// anglais au milieu d'un texte espagnol — et personne ne le voyait :
//
//   `i18n_fraicheur` compte les cases pleines. Celle-ci l'est, et elle
//     est même scellée sur le bon français.
//   `i18n_langue_check` cherche des MOTS-OUTILS (the, and, with…) parce
//     qu'ils signalent une phrase anglaise entière. Ici la phrase est
//     espagnole : il n'y a aucun mot-outil anglais à compter.
//   Le détecteur réversible de la migration 095 cherche un mot ABÎMÉ
//     par une substitution. Ces mots-là sont intacts, juste pas traduits.
//
// Ce contrôle prend le problème par l'autre bout : non plus la
// grammaire, mais le VOCABULAIRE. Un lexique de dégustation dont chaque
// entrée est un mot anglais qui n'existe pas dans la langue visée.
//
// ── CE QUI REND LA MESURE DÉLICATE ──────────────────────
//
// Un mot pleinement anglais ici peut être un mot légitime là :
//
//   `Toast` et `Cashew` sont des SUBSTANTIFS ALLEMANDS courants ;
//   `chocolate` s'écrit à l'identique en espagnol ;
//   `aroma` est commun à l'espagnol, à l'allemand et à l'anglais.
//
// Chaque langue reçoit donc le lexique amputé de ce qui lui appartient.
// Même principe que les marqueurs par langue de `i18n_langue_check`, et
// même raison : un compteur qui additionne des mots légitimes ne mesure
// pas ce qu'il croit.
//
// Les COULEURS sont le cas le plus glissant. « white pepper » est un
// défaut ; « CAO Black », « Black Label », « Perdomo White » sont des
// noms de produits. Elles ne sont donc cherchées qu'ACCOLÉES à un nom de
// dégustation — c'est la paire qui accuse, jamais la couleur seule.
//
// ── LE TÉMOIN ───────────────────────────────────────────
//
// Mesuré sur le FRANÇAIS, ce lexique doit être quasi muet. S'il monte,
// c'est lui qui est faux, pas les données — le français dit « notes de
// toast » et « cacao », et ces deux-là sont précisément le genre de
// piège que le témoin révèle.
//
//   php tools/i18n_lexique_degustation.php              # le compte
//   php tools/i18n_lexique_degustation.php --details    # et les extraits
// ════════════════════════════════════════════════════════

if (PHP_SAPI !== 'cli') { http_response_code(404); exit; }

require_once __DIR__ . '/../backend/config.php';
require_once __DIR__ . '/i18n_contenu_plan.php';

/**
 * Le lexique. Uniquement des mots dont l'équivalent existe et diffère
 * dans les quatre langues cibles — sans quoi on compterait du bruit.
 */
const LEXIQUE = [
    // Matières et arômes
    'leather', 'cocoa', 'cedar', 'oak', 'walnut', 'hazelnut', 'almond',
    'honey', 'coffee', 'vanilla', 'cinnamon', 'nutmeg', 'clove', 'cloves',
    'ginger', 'pepper', 'cashew', 'toast', 'chocolate', 'tobacco',
    'caramel', 'butter', 'cherry', 'raisin', 'pear', 'apple',
    // Qualificatifs
    'earthy', 'woody', 'spicy', 'nutty', 'smoky', 'creamy', 'buttery',
    'velvety', 'silky', 'peppery', 'sweetness', 'bitterness',
    'roasted', 'toasted', 'smooth', 'balanced',
    // Métier
    'flavor', 'flavour', 'palate', 'draw', 'ash', 'strength',
];

/**
 * Ce que chaque langue possède en propre, et qu'il faut donc lui
 * retirer. Vérifié mot à mot, pas supposé.
 */
const EMPRUNTS = [
    // L'allemand capitalise ses substantifs, mais un texte peut les
    // écrire en minuscules : on retire le mot entier plutôt que de
    // parier sur la casse.
    'de' => ['toast', 'cashew', 'butter', 'caramel', 'ash', 'clove'],
    // « chocolate », « caramel », « pera »… : identiques ou quasi.
    'es' => ['chocolate', 'caramel', 'cedar'],
    // Le chinois et l'arabe n'empruntent aucun de ces mots en alphabet
    // latin : le lexique s'y applique entier.
    'zh' => [],
    'ar' => [],
    // Le témoin. Le français dit « toast », « caramel », « beurre »…
    'fr' => ['toast', 'caramel', 'cherry', 'draw', 'ash', 'pear'],
];

/** Les couleurs n'accusent qu'accolées à un nom de dégustation. */
const PAIRES = '/(?<![\p{L}])(white|black|red|green|dark)\s+'
             . '(pepper|pimienta|Pfeffer|chocolate|cocoa|cacao|tea|tabaco|Tabak|fruit|fruta)(?![\p{L}])/iu';

function motif(string $langue): string {
    $mots = array_diff(LEXIQUE, EMPRUNTS[$langue] ?? []);
    return '/(?<![\p{L}])(' . implode('|', $mots) . ')(?![\p{L}])/iu';
}

/**
 * Le mot trouvé appartient-il à un NOM PROPRE ?
 *
 * C'est le seul faux positif que le témoin français ait produit, et il
 * en a produit seize d'un coup : « Selected Tobacco » (la maison),
 * « Charter Oak » et « Pierrot Vanilla » (des produits), « Brooklyn
 * Black Chocolate Stout » (une bière), « Macallan Sherry Oak » (un
 * whisky), « Tobacco Valley » (un lieu), « Smooth Jazz » (un genre).
 *
 * Aucun n'est une traduction manquante : un nom propre ne se traduit
 * pas, et le laisser en anglais est la seule chose correcte à faire.
 *
 * DEUX SIGNES, et il suffit d'un :
 *   le mot lui-même porte une majuscule sans être en début de phrase ;
 *   le mot qui le précède en porte une.
 *
 * La réserve du début de phrase est indispensable : « Coffee, leather
 * and cedar » ouvrant une note de dégustation est un vrai défaut, et sa
 * majuscule n'est due qu'à la ponctuation.
 */
function nom_propre(string $t, int $pos, string $mot): bool {
    $avant = mb_substr($t, 0, mb_strlen(substr($t, 0, $pos)));

    if (preg_match('/(\p{L}+)[\s\-]*$/u', $avant, $m)
        && preg_match('/^\p{Lu}/u', $m[1])) return true;

    if (preg_match('/^\p{Lu}/u', $mot)) {
        // Le mot SUIVANT porte aussi une majuscule : « Tobacco Valley »,
        // « Charter Oak ». Deux majuscules d'affilée ne s'expliquent pas
        // par la ponctuation, et les guillemets qui entourent souvent ces
        // noms trompaient la règle du début de phrase.
        $apres = mb_substr($t, mb_strlen(substr($t, 0, $pos)) + mb_strlen($mot));
        if (preg_match('/^[\s\-]*(\p{Lu}\p{L}+)/u', $apres)) return true;

        // Début de texte ou suite d'une ponctuation forte : la majuscule
        // s'explique autrement que par un nom propre.
        return !preg_match('/(^|[.!?:;—–\-]|[«"(\[])\s*$/u', $avant);
    }
    return false;
}

/**
 * Des expressions figées que l'on garde en anglais dans toutes les
 * langues, parce qu'elles nomment autre chose qu'un goût. « smooth
 * jazz » est un genre musical, pas une note de dégustation.
 */
const EXPRESSIONS = '/(?<![\p{L}])(smooth jazz|coffee shop|coffee break)(?![\p{L}])/iu';

/**
 * Les textes portés par une valeur de colonne.
 *
 * Les colonnes JSON (gamme, pairings, celebrities) portent des CLÉS en
 * anglais — `story`, `notes`, `format`. Les compter reviendrait à
 * accuser la structure du document plutôt que son contenu : on descend
 * donc jusqu'aux feuilles, et on ne lit que les valeurs.
 *
 * @return array<int,string>
 */
function textes_de(string $v): array {
    $j = json_decode($v, true);
    if (!is_array($j)) return [$v];
    $out = [];
    array_walk_recursive($j, function ($x) use (&$out) { if (is_string($x)) $out[] = $x; });
    return $out;
}

$db = getDB();
$details = in_array('--details', $argv, true);

$parLangue = [];   // langue → nombre de valeurs fautives
$parMot    = [];   // mot    → occurrences
$extraits  = [];

foreach (plan_contenu() as $table => $champs) {
    $cle = null;
    foreach (['name', 'id'] as $c) {
        try { $db->query("SELECT `$c` FROM `$table` LIMIT 0"); $cle = $c; break; }
        catch (Throwable $e) { }
    }
    if ($cle === null) continue;

    foreach ($champs as $ch) {
        foreach (['fr', 'es', 'de', 'zh', 'ar'] as $l) {
            $col = $l === 'fr' ? $ch : $ch . '_' . $l;
            try { $q = $db->query("SELECT `$cle` k, `$col` v FROM `$table`
                                    WHERE `$col` IS NOT NULL AND `$col` <> '' AND `$col` <> '[]'"); }
            catch (Throwable $e) { continue; }

            foreach ($q as $r) {
                foreach (textes_de((string)$r['v']) as $t) {
                    // Les expressions figées sont retirées du texte avant
                    // l'examen : leurs mots ne doivent compter ni seuls ni
                    // en paire.
                    $t = preg_replace(EXPRESSIONS, '…', $t);
                    $trouves = [];
                    if (preg_match_all(motif($l), $t, $m, PREG_OFFSET_CAPTURE)) {
                        foreach ($m[1] as [$mot, $pos]) {
                            if (!nom_propre($t, $pos, $mot)) $trouves[] = $mot;
                        }
                    }
                    if (preg_match_all(PAIRES, $t, $m2, PREG_OFFSET_CAPTURE)) {
                        foreach ($m2[0] as [$p, $pos]) {
                            if (!nom_propre($t, $pos, $p)) $trouves[] = trim($p);
                        }
                    }
                    if (!$trouves) continue;

                    $parLangue[$l] = ($parLangue[$l] ?? 0) + 1;
                    foreach ($trouves as $mot) {
                        $mot = mb_strtolower($mot);
                        $parMot[$mot] = ($parMot[$mot] ?? 0) + 1;
                    }
                    if (count($extraits) < 400) {
                        $extraits[] = sprintf("  %s.%s (%s) #%s : %s\n      « %s »",
                            $table, $ch, $l, $r['k'],
                            implode(', ', array_unique($trouves)),
                            mb_substr(preg_replace('/\s+/u', ' ', $t), 0, 150));
                    }
                }
            }
        }
    }
}

echo "CigarOdyssey — le vocabulaire de degustation reste-t-il en anglais ?\n\n";

$temoin = $parLangue['fr'] ?? 0;
printf("  temoin francais : %d valeur(s) declencheraient le lexique", $temoin);
echo $temoin > 20 ? "   <<< TROP HAUT, le lexique est suspect\n" : "   (bas, le lexique tient)\n\n";

$total = 0;
foreach (['es', 'de', 'zh', 'ar'] as $l) {
    printf("  %s : %4d valeur(s)\n", $l, $parLangue[$l] ?? 0);
    $total += $parLangue[$l] ?? 0;
}
printf("\n  %d valeur(s) portent au moins un mot anglais non traduit.\n", $total);

arsort($parMot);
echo "\n  Les mots les plus frequents :\n";
foreach (array_slice($parMot, 0, 15, true) as $mot => $n) printf("    %-14s %d\n", $mot, $n);

if ($details) {
    echo "\n  ── Extraits ──\n";
    foreach ($extraits as $e) echo "$e\n";
}
echo "\n";
