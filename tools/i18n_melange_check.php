<?php
// ════════════════════════════════════════════════════════
// tools/i18n_melange_check.php — Une phrase anglaise déguisée
// ────────────────────────────────────────────────────────
// LE DÉFAUT. La colonne `gamme_es` de Montecristo disait :
//
//   « Spanish regional edition, Supremos format (54 x 185mm). One of
//     el más codiciado cigars among European coleccionistas.
//     Producción anual inferior a 5.000 cajas. »
//
// Ce n'est ni de l'anglais ni de l'espagnol : c'est une phrase ANGLAISE
// dans laquelle quelques mots ont été remplacés par leur équivalent
// espagnol. Même chaîne de substitution qu'aux migrations 095 et 125.
//
// ── POURQUOI LES TROIS AUTRES CONTRÔLES NE LE VOIENT PAS ─
//
// `i18n_fraicheur` compte les cases pleines : celle-ci l'était, et elle
//   était scellée sur le bon français.
// `i18n_langue_check` cherche des mots-outils anglais d'une liste fixe
//   — the, and, with, from… Cette phrase n'en contient aucun. Elle dit
//   « One of », « among », qui n'y figurent pas, et il y en aura
//   toujours un de plus : courir après les formes ne marche pas.
// `i18n_lexique_degustation` cherche du vocabulaire de dégustation.
//   « edition », « format », « collectors » n'en sont pas.
//
// ── LA MESURE : QUI L'EMPORTE DANS LA PHRASE ────────────
//
// On ne cherche donc plus des mots précis, mais un RAPPORT DE FORCE.
// Dans une phrase espagnole, les mots-outils espagnols dominent ; dans
// une phrase anglaise maquillée, ce sont les anglais, quels que soient
// les mots pleins traduits par-dessus.
//
// Chaque phrase d'une colonne latine est donc pesée : combien de
// mots-outils anglais, combien de la langue attendue. Une phrase qui
// porte au moins DEUX mots-outils anglais et pas plus de mots-outils
// de sa propre langue est une phrase anglaise déguisée.
//
// Les homographes sont retirés langue par langue, comme dans
// `i18n_langue_check` : « was » est allemand, « has » et « son » sont
// espagnols. Un compteur qui les additionne mesure autre chose que ce
// qu'il croit.
//
// ── LE CHINOIS ET L'ARABE N'EN ONT PAS BESOIN ───────────
//
// `i18n_langue_check` exige déjà la présence de l'écriture attendue :
// une colonne chinoise sans han est signalée sans compter un seul mot.
// Ce contrôle ne porte donc que sur les colonnes en alphabet latin.
//
// ── LE TÉMOIN, ET LES CAS CONSTRUITS ────────────────────
//
// Le français sert de témoin : mesuré sur lui, le détecteur doit être
// muet. Et comme la base est propre depuis la refonte des périmées, un
// contrôle qui ne trouve rien ne prouve rien : douze cas construits —
// dont la phrase Montecristo d'origine — sont vérifiés à chaque
// passage. Si le détecteur cesse de les voir, il échoue.
//
//   php tools/i18n_melange_check.php
//   php tools/i18n_melange_check.php --details
// ════════════════════════════════════════════════════════

if (PHP_SAPI !== 'cli') { http_response_code(404); exit; }

require_once __DIR__ . '/../backend/config.php';
require_once __DIR__ . '/i18n_contenu_plan.php';

/** Les langues à alphabet latin, plus le français en témoin. */
const LANGUES_LATINES = ['fr', 'es', 'de'];

/**
 * Mots-outils anglais. Volontairement communs et nombreux : c'est leur
 * DENSITÉ qui parle, pas leur présence.
 */
const OUTILS_EN = ['the', 'of', 'and', 'in', 'on', 'for', 'with', 'from', 'to', 'at',
    'by', 'as', 'is', 'are', 'was', 'were', 'be', 'been', 'has', 'have', 'had',
    'it', 'its', 'this', 'that', 'these', 'those', 'their', 'they', 'them',
    'one', 'among', 'between', 'over', 'under', 'than', 'when', 'which', 'while',
    'into', 'after', 'before', 'most', 'more', 'both', 'each', 'other', 'such',
    'only', 'also', 'about', 'through', 'during', 'since', 'until', 'without',
    'within', 'across', 'around', 'above', 'below', 'where', 'all', 'any',
    'many', 'some', 'very', 'can', 'will', 'would', 'should', 'could'];

/**
 * Ce que chaque langue possède en propre, et qu'il faut donc retirer de
 * la liste anglaise avant de compter.
 *
 *   « was » est allemand (ce que), « in » et « an » aussi ;
 *   « has » est espagnol (tu as), « son » et « a » également ;
 *   « on », « of » n'existent dans aucune des deux — ils restent.
 */
const HOMOGRAPHES = [
    'fr' => ['as', 'a', 'the', 'on', 'or', 'car', 'son', 'ont', 'and'],
    'es' => ['has', 'son', 'a', 'de', 'con', 'una', 'no', 'in', 'as'],
    'de' => ['was', 'in', 'an', 'so', 'man', 'war', 'will', 'her', 'die', 'den', 'am', 'all'],
];

/** Mots-outils propres à chaque langue attendue. */
const OUTILS_LANGUE = [
    'fr' => ['le', 'la', 'les', 'des', 'du', 'de', 'un', 'une', 'et', 'ou', 'qui',
             'que', 'dans', 'pour', 'par', 'sur', 'avec', 'sans', 'est', 'sont',
             'plus', 'cette', 'ce', 'ses', 'son', 'leur', 'aux', 'au'],
    'es' => ['el', 'la', 'los', 'las', 'un', 'una', 'de', 'del', 'y', 'o', 'que',
             'en', 'para', 'por', 'con', 'sin', 'es', 'son', 'más', 'esta', 'este',
             'sus', 'su', 'al', 'lo', 'se', 'como', 'pero'],
    'de' => ['der', 'die', 'das', 'den', 'dem', 'ein', 'eine', 'einer', 'und', 'oder',
             'in', 'im', 'auf', 'für', 'von', 'mit', 'ohne', 'ist', 'sind', 'auch',
             'nicht', 'als', 'aus', 'zu', 'sich', 'dass', 'wie'],
];

const SEUIL_EN = 2;

/** Seuil de la seconde regle : de l'anglais pur, sans un mot de la langue. */
const SEUIL_PUR = 3;

/** En dessous, une valeur est un NOM, pas une phrase. */
const LONGUEUR_MINIMALE = 40;

/**
 * Retire les noms propres d'une phrase avant de compter.
 *
 * PREMIER PASSAGE, TROIS FAUX POSITIFS, TOUS DES NOMS :
 *   « Eye of the Shark », « Daughters of the Wind »  — des vitoles ;
 *   « Habano Man of the Year 2004 »                  — une distinction ;
 *   « Davidoff Best Partner of the Year EMEA 2021 »  — une autre.
 *
 * Un nom propre anglais dans une colonne espagnole est correct : il ne
 * se traduit pas. Ce qui accuse, c'est la GRAMMAIRE anglaise autour.
 *
 * Une suite de mots capitalises relies par des mots-outils minuscules
 * est donc retiree : « Man of the Year » part, « nombrada por an engine
 * part » reste.
 */
// Le connecteur peut compter PLUSIEURS mots : « Man OF THE Year »,
// « Symphony OF THE Seas ». La premiere version n'en acceptait qu'un, et
// laissait donc passer trois noms sur quatre.
const LIAISON = '(?:of|the|and|de|del|di|du|von|der|van|the)';

function sans_noms_propres(string $phrase): string {
    $mot  = '\p{Lu}[\p{L}\x{2019}\'\-]*';
    $lien = '(?:[\s\-]+' . LIAISON . ')*[\s\-]+';
    return (string)preg_replace('/' . $mot . '(?:' . $lien . $mot . ')+/u', ' ', $phrase);
}

/** Les mots d'un texte, en minuscules, sans ponctuation. */
function mots(string $t): array {
    preg_match_all('/[\p{L}\x{2019}\']+/u', mb_strtolower($t), $m);
    return $m[0];
}

/** Découpe en phrases. Les points des abréviations sont rares ici. */
function phrases(string $t): array {
    $p = preg_split('/(?<=[.!?])\s+|\n+/u', $t, -1, PREG_SPLIT_NO_EMPTY);
    return $p ?: [];
}

/**
 * La phrase est-elle de l'anglais deguise ?
 * @return array{0:int,1:int} [mots-outils anglais, mots-outils de la langue]
 */
function pesee(string $phrase, string $langue): array {
    $exclus = array_flip(HOMOGRAPHES[$langue] ?? []);
    $en     = array_flip(array_diff(OUTILS_EN, array_keys($exclus)));
    $propre = array_flip(OUTILS_LANGUE[$langue] ?? []);

    $nEn = 0; $nPropre = 0;
    foreach (mots($phrase) as $mot) {
        if (isset($en[$mot]))     $nEn++;
        if (isset($propre[$mot])) $nPropre++;
    }
    return [$nEn, $nPropre];
}

/**
 * Deux regles, deux defauts distincts.
 *
 * A — LE MELANGE. Une phrase anglaise ou quelques mots ont ete
 *   remplaces : les mots-outils anglais tiennent tete a ceux de la
 *   langue attendue, une fois les noms propres retires. C'est le cas
 *   Montecristo, et celui de CAO trouve au premier passage.
 *
 * B — L'ANGLAIS PUR. Une phrase entiere restee en anglais dans une
 *   colonne qui ne l'est pas : trois mots-outils anglais et AUCUN de la
 *   langue attendue. Les noms propres ne sont pas retires ici — une
 *   phrase qui n'a rien de sa propre langue est suspecte quelle que
 *   soit sa ponctuation. C'est ainsi qu'est sortie la fiche de Nancy.
 *
 * @return string '' si la phrase est saine, sinon la regle declenchee
 */
function suspecte(string $phrase, string $langue): string {
    if (mb_strlen(trim($phrase)) < LONGUEUR_MINIMALE) return '';

    [$enBrut, $propre] = pesee($phrase, $langue);
    if ($enBrut >= SEUIL_PUR && $propre === 0) return 'anglais pur';

    [$enNet, $propreNet] = pesee(sans_noms_propres($phrase), $langue);
    if ($enNet >= SEUIL_EN && $enNet >= $propreNet) return 'melange';

    return '';
}

// ── Les cas construits ──────────────────────────────────
//
// Une base propre ne prouve pas qu'un detecteur fonctionne. Ceux-ci
// sont verifies a chaque passage : les six premiers doivent se
// declencher, les six suivants doivent rester muets.
const CAS_DECLENCHENT = [
    // La phrase d'origine, Montecristo gamme_es avant la refonte.
    ['es', 'One of el más codiciado cigars among European coleccionistas.'],
    ['es', 'The natural pairing — both productos share the same Cuban soil.'],
    ['de', 'Notes of toast, cashew and white Pfeffer, with a long finish.'],
    ['es', 'It is one of the most buscados puros among collectors of Europa.'],
];

// ── DEUX CHOSES QUE CE CONTROLE NE PEUT PAS VOIR ────────
//
// Elles sont ecrites ici plutot que passees sous silence : un controle
// qui ne dit pas ou il s'arrete laisse croire qu'il couvre tout.
//
// 1. UNE PHRASE SANS MOT-OUTIL.
//    « Spanish regional edition, Supremos format (54 x 185mm). » est de
//    l'anglais pur et ne contient AUCUN mot-outil, dans aucune langue.
//    Une regle de rapport ne peut rien en dire. Dans le cas reel, c'est
//    la phrase VOISINE — « One of el más codiciado cigars among… » — qui
//    trahit la valeur, et la valeur entiere part a la correction.
//
// 2. UNE PHRASE MOITIE-MOITIE.
//    « The house was founded in 1875 by Inocencio Álvarez, ein
//    Hersteller aus Havanna » compte deux mots-outils anglais contre
//    trois allemands. Le rapport ne bascule pas, et c'est voulu :
//    abaisser le seuil pour l'attraper ferait sortir toutes les phrases
//    allemandes citant un titre anglais.
//
// 3. L'ALLEMAND CAPITALISE SES SUBSTANTIFS.
//    Le retrait des noms propres s'appuie sur la majuscule. En
//    allemand, elle ne signale rien : « die Holznoten of the Behike »
//    ressemble mot pour mot a « Man of the Year », et le fragment
//    anglais part avec le faux nom. La fiche Cohiba portait exactement
//    cela — trouvee au premier passage, avant que le retrait des noms
//    ne soit elargi aux liaisons doubles, et corrigee a la main.
//
//    C'est la troisieme fois de la journee que la capitalisation
//    allemande met un motif en defaut, apres `wrapper`/`blend` dans le
//    lexique de degustation et `meistverkaufte` dans les rangs.
const CAS_MUETS = [
    ['es', 'Es el Montecristo por excelencia: el que se regala, el que se comparte.'],
    ['es', 'Producción anual inferior a 5.000 cajas.'],
    ['de', 'Die Serie G nimmt im Katalog von Oliva eine genaue Stelle ein.'],
    ['de', 'Das Deckblatt ist kamerunisch — eine Wahl, die zu den Ansprüchen passt.'],
    // Des noms propres anglais dans une phrase francaise : « Cigars Gone
    // Loud », « pleased as Punch », « Strangers in the Night ». Ils ne
    // doivent pas suffire.
    ['fr', 'Le repositionnement autour de « Cigars Gone Loud » était un calcul commercial.'],
    ['fr', 'On a dit que la satisfaction d\'une commande était l\'un des sens de « pleased as Punch ».'],
];

$echecsTemoins = [];
foreach (CAS_DECLENCHENT as [$l, $p]) {
    if (suspecte($p, $l) === '') $echecsTemoins[] = "aurait du se declencher ($l) : $p";
}
foreach (CAS_MUETS as [$l, $p]) {
    if (suspecte($p, $l) !== '') {
        [$e, $o] = pesee($p, $l);
        $echecsTemoins[] = "faux positif ($l, $e en / $o $l) : $p";
    }
}

// ── Le balayage ─────────────────────────────────────────
$db = getDB();
$details = in_array('--details', $argv, true);

$trouves = [];
$parLangue = [];
foreach (plan_contenu() as $table => $champs) {
    $cle = null;
    foreach (['name', 'id'] as $c) {
        try { $db->query("SELECT `$c` FROM `$table` LIMIT 0"); $cle = $c; break; }
        catch (Throwable $e) { }
    }
    if ($cle === null) continue;

    foreach ($champs as $ch) {
        foreach (LANGUES_LATINES as $l) {
            $col = $l === 'fr' ? $ch : $ch . '_' . $l;
            try { $q = $db->query("SELECT `$cle` k, `$col` v FROM `$table`
                                    WHERE `$col` IS NOT NULL AND `$col` <> '' AND `$col` <> '[]'"); }
            catch (Throwable $e) { continue; }

            foreach ($q as $r) {
                // Les colonnes JSON portent des cles anglaises (`story`,
                // `notes`) : on descend aux feuilles, on ne lit que les
                // valeurs.
                $textes = [];
                $j = json_decode((string)$r['v'], true);
                if (is_array($j)) {
                    array_walk_recursive($j, function ($x) use (&$textes) {
                        if (is_string($x)) $textes[] = $x;
                    });
                } else {
                    $textes[] = (string)$r['v'];
                }

                foreach ($textes as $t) {
                    foreach (phrases($t) as $p) {
                        $regle = suspecte($p, $l);
                        if ($regle === '') continue;
                        [$e, $o] = pesee($p, $l);
                        $parLangue[$l] = ($parLangue[$l] ?? 0) + 1;
                        $trouves[] = sprintf("  %s.%s (%s) #%s — %s, %d mot(s) anglais / %d %s\n      « %s »",
                            $table, $ch, $l, $r['k'], $regle, $e, $o, $l,
                            mb_substr(preg_replace('/\s+/u', ' ', $p), 0, 140));
                    }
                }
            }
        }
    }
}

echo "CigarOdyssey — une phrase anglaise deguisee en traduction\n\n";

if ($echecsTemoins) {
    echo "  LE DETECTEUR NE TIENT PLUS SES CAS CONSTRUITS :\n";
    foreach ($echecsTemoins as $e) echo "    ECHEC  $e\n";
    echo "\n";
} else {
    printf("  %d cas construits verifies : %d se declenchent, %d restent muets.\n\n",
           count(CAS_DECLENCHENT) + count(CAS_MUETS),
           count(CAS_DECLENCHENT), count(CAS_MUETS));
}

$temoin = $parLangue['fr'] ?? 0;
printf("  temoin francais : %d phrase(s)", $temoin);
echo $temoin > 3 ? "   <<< TROP HAUT, le detecteur est suspect\n" : "   (bas, le detecteur tient)\n";

$total = 0;
foreach (['es', 'de'] as $l) {
    printf("  %s : %d phrase(s)\n", $l, $parLangue[$l] ?? 0);
    $total += $parLangue[$l] ?? 0;
}

printf("\n  %d phrase(s) ou l'anglais l'emporte dans une colonne qui n'est pas la sienne.\n", $total);

if ($details && $trouves) {
    echo "\n  ── Extraits ──\n";
    foreach ($trouves as $t) echo "$t\n";
}

// Zero est la seule valeur acceptable : la base est propre depuis la
// refonte des perimees, et ce defaut n'est pas un chantier a etaler.
if ($echecsTemoins || $total > 0) {
    if (!$details && $trouves) {
        echo "\n";
        foreach (array_slice($trouves, 0, 10) as $t) echo "$t\n";
    }
    exit(1);
}
echo "\n  Aucune phrase suspecte.\n";
exit(0);
