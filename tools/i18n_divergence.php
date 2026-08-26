<?php
// ════════════════════════════════════════════════════════
// tools/i18n_divergence.php — Une traduction dit-elle ce que dit sa source ?
// ────────────────────────────────────────────────────────
// `i18n_fraicheur` compare l'EMPREINTE de la source à celle qui a été
// scellée. Il répond à « le français a-t-il bougé depuis ? », et il
// affiche 100 %. Il ne répond pas à « la traduction dit-elle la même
// chose ? », et personne ne le faisait.
//
// Cet outil pose la seconde question, par deux mesures qui ne demandent
// pas de lire les six langues.
//
//   php tools/i18n_divergence.php            # rapport
//   php tools/i18n_divergence.php --figer    # enregistre l'existant
//
// ── 1. LE VOLUME, RAPPORTÉ À SA PROPRE LANGUE ───────────
//
// Comparer des longueurs brutes entre le chinois et l'allemand n'a aucun
// sens : le chinois écrit la même chose en trois fois moins de signes.
// La mesure de référence est donc le RAPPORT MÉDIAN de chaque langue au
// français, établi sur les 118 fiches :
//
//     en 0.96   es 0.95   de 1.00   zh 0.30   ar 0.71
//
// Une fiche s'écarte quand son rapport s'éloigne de plus du double, ou
// de moins de la moitié, de la médiane de SA langue. Le chinois à 0.30
// est normal ; à 0.11, il manque les deux tiers du texte.
//
// ── 2. LES FAITS QUE LA SOURCE NE CONTIENT PAS ──────────
//
// Une date est le fait le plus vérifiable d'un texte, et le plus facile
// à comparer entre écritures : 2014 s'écrit 2014 en arabe comme en
// chinois. Une traduction qui porte une année absente du français
// AFFIRME quelque chose que sa source ne dit pas.
//
// C'est ainsi qu'a été trouvée la fiche Oliva : l'arabe disait « puis
// vint le Melanio en 2014 pour la prolonger », quand ni le français ni
// l'anglais ne mentionnent ce cigare. 2014 est l'année où il a été primé
// par la presse — la catégorie que les migrations 057, 058 et 077 ont
// passé des semaines à retirer, réapparue par la porte de la traduction.
//
// ── POURQUOI L'ANGLAIS EST TRAITÉ À PART ────────────────
//
// Sur 40 fiches, `history_en` n'est pas une traduction du français mais
// un texte autonome, plus long — 63 066 caractères d'écart au total, et
// aucune phrase partagée d'une fiche à l'autre : ce n'est ni du
// remplissage ni du copié-collé. Y chercher des dates absentes du
// français n'a pas de sens tant que ce déséquilibre n'est pas tranché
// (le promouvoir dans les six langues, ou le ramener au français —
// décision éditoriale, pas technique).
//
// Ces fiches sont donc EXCLUES du contrôle des faits pour la langue
// concernée, et signalées comme telles. Le contrôle ne prétend pas
// couvrir ce qu'il ne couvre pas.
// ════════════════════════════════════════════════════════

if (PHP_SAPI !== 'cli') { http_response_code(404); exit; }

require_once __DIR__ . '/../backend/config.php';
require_once __DIR__ . '/i18n_contenu_plan.php';

$db = getDB();

const LANGUES = ['en', 'es', 'de', 'zh', 'ar'];

/** Rapport de longueur au-delà (ou en deçà) duquel on signale. */
const FACTEUR = 2.0;

/**
 * Les années plausibles pour ce domaine.
 *
 * ── POURQUOI PAS \b ─────────────────────────────────────
 *
 * La première version écrivait « \b(1[5-9]\d\d|20[0-2]\d)\b ». En
 * UTF-8, PCRE fonde \b sur \w, qui reste ASCII : la frontière de mot
 * suppose une espace ou une ponctuation latine.
 *
 * Le chinois n'en met pas. Dans « 创立于1893年 », le chiffre est collé
 * aux idéogrammes, et le motif ne voyait RIEN — testé : zéro
 * correspondance là où « founded in 1893. » en donne une.
 *
 * La colonne chinoise échappait donc entièrement au contrôle des faits,
 * et le rapport affichait la même chose que si elle était saine.
 * L'arabe passait, lui, parce qu'il sépare le chiffre par une espace :
 * c'est ce hasard qui a laissé sortir la fiche Oliva et son « Melanio
 * en 2014 », en donnant l'illusion que les six langues étaient lues.
 *
 * Les délimiteurs sont désormais des assertions sur le CHIFFRE lui-même,
 * qui ne dépendent d'aucune écriture.
 */
const ANNEES = '/(?<!\d)(1[5-9]\d\d|20[0-2]\d)(?!\d)/u';

/** Texte utile d'une valeur, JSON compris. */
function texte_utile(string $brut): string {
    $x = ltrim($brut);
    if ($x === '' || ($x[0] !== '[' && $x[0] !== '{')) return $brut;
    $j = json_decode($brut, true);
    if (!is_array($j)) return '';
    $f = [];
    array_walk_recursive($j, function ($v) use (&$f) { if (is_string($v)) $f[] = $v; });
    return implode("\n", $f);
}

// ── Les médianes, recalculées à chaque passage ──────────
//
// Elles ne sont pas écrites en dur : si le corpus change, la référence
// doit changer avec lui. Une constante figée mentirait dès la première
// campagne de traduction.
$echantillon = [];
foreach (plan_contenu() as $table => $champs) {
    foreach ($champs as $champ) {
        foreach (LANGUES as $l) {
            try { $q = $db->query("SELECT `$champ` fr, `{$champ}_$l` tr FROM `$table`"); }
            catch (Throwable $e) { continue; }
            foreach ($q as $r) {
                $fr = mb_strlen(trim(texte_utile((string)$r['fr'])));
                $tr = mb_strlen(trim(texte_utile((string)$r['tr'])));
                if ($fr < 40 || $tr < 10) continue;
                $echantillon[$l][] = $tr / $fr;
            }
        }
    }
}
$mediane = [];
foreach ($echantillon as $l => $v) { sort($v); $mediane[$l] = $v[intdiv(count($v), 2)] ?: 1.0; }

// ── Le relevé ───────────────────────────────────────────
$volumes = [];   // « table.champ|clé|langue » => facteur d'écart
$faits   = [];   // idem => années ajoutées

// Les traductions que `i18n_fraicheur` sait périmées, sous la même clé.
// Voir plus bas pourquoi le contrôle des faits les écarte.
$enAttente = [];
foreach (json_decode((string)@file_get_contents(__DIR__ . '/i18n_attente_baseline.json'), true) ?: [] as $k) {
    $enAttente[$k] = true;
}

foreach (plan_contenu() as $table => $champs) {
    $cle = null;
    foreach (['name', 'id'] as $c) {
        try { $db->query("SELECT `$c` FROM `$table` LIMIT 0"); $cle = $c; break; }
        catch (Throwable $e) { }
    }
    if ($cle === null) continue;

    foreach ($champs as $champ) {
        foreach (LANGUES as $l) {
            if (!isset($mediane[$l])) continue;
            try { $q = $db->query("SELECT `$cle` k, `$champ` fr, `{$champ}_$l` tr FROM `$table`"); }
            catch (Throwable $e) { continue; }

            foreach ($q as $r) {
                $fr = trim(texte_utile((string)$r['fr']));
                $tr = trim(texte_utile((string)$r['tr']));
                if (mb_strlen($fr) < 40 || mb_strlen($tr) < 10) continue;
                $id = "$table.$champ|{$r['k']}|$l";

                $k = (mb_strlen($tr) / mb_strlen($fr)) / $mediane[$l];
                $diverge = $k > FACTEUR || $k < 1 / FACTEUR;
                if ($diverge) $volumes[$id] = round($k, 2);

                // ── CE QU'ON ÉCARTE, ET CE QU'ON N'ÉCARTE SURTOUT PAS
                //
                // Sur un texte AUTONOME — plus long que sa source — les
                // dates supplémentaires sont la conséquence du volume,
                // pas un défaut distinct : les 40 essais anglais en
                // portent des dizaines, et les signaler noierait le
                // reste.
                //
                // Mais une traduction plus COURTE qui invente une date
                // est plus suspecte, pas moins. La première version de
                // ce contrôle écartait les deux cas — et masquait ainsi
                // la fiche Oliva, dont l'arabe fait le tiers du français
                // et affirme pourtant un « Melanio en 2014 » que la
                // source ne mentionne pas. C'est-à-dire exactement la
                // trouvaille qui a fait écrire cet outil.
                if ($k > FACTEUR) continue;

                // ── NE PAS CONFONDRE INVENTÉ ET PÉRIMÉ ──────────
                //
                // Deux causes produisent la même trace, et une seule est
                // un défaut :
                //
                //   la traduction AFFIRME un fait que sa source n'a
                //     jamais eu — Oliva et son « Melanio en 2014 » ;
                //   la traduction est PÉRIMÉE et garde une date que le
                //     français a perdue en étant réécrit — Café Crème et
                //     son « 1904 », après la promotion de la migration
                //     107.
                //
                // Le second cas n'est pas une invention : c'est une
                // traduction à refaire, déjà nommée dans le cliquet de
                // `i18n_fraicheur`. Les mélanger noierait le signal qui a
                // fait écrire cet outil sous les traces de la campagne
                // de promotion elle-même.
                if (isset($enAttente[$id])) continue;

                preg_match_all(ANNEES, $fr, $a);
                preg_match_all(ANNEES, $tr, $b);

                // ── LES DÉCENNIES S'ÉCRIVENT AUTREMENT SELON LA LANGUE
                //
                // Le français dit « les années 80 ». L'anglais dit « in
                // the 1980s », l'allemand « der 1990er-Jahre ». Même
                // fait, autre écriture — et le motif ne voyait que la
                // forme longue, donc signalait une invention là où il
                // n'y avait qu'une convention typographique.
                //
                // Deux fiches en faisaient les frais : Café Crème
                // (« années 80 » / « the 1980s ») et Macanudo
                // (« années 90 » / « the 1990s », « der 1990er »).
                //
                // On complète donc l'ensemble français : « années NN »
                // vaut 19NN et 20NN. Permissif de ce côté, ce qui
                // n'affaiblit pas la détection d'un fait réellement
                // inventé — celui-ci porte une année précise que le
                // français ne contient sous aucune forme.
                $connues = $a[1];
                if (preg_match_all('/ann[ée]es\s+(\d{2})(?!\d)/iu', $fr, $d)) {
                    foreach ($d[1] as $dd) { $connues[] = "19$dd"; $connues[] = "20$dd"; }
                }

                $ajoutees = array_values(array_unique(array_diff($b[1], $connues)));
                if ($ajoutees) { sort($ajoutees); $faits[$id] = implode(', ', $ajoutees); }
            }
        }
    }
}

$ref = __DIR__ . '/i18n_divergence_baseline.json';

if (in_array('--figer', $argv, true)) {
    ksort($volumes); ksort($faits);
    file_put_contents($ref, json_encode(['volumes' => $volumes, 'faits' => $faits],
        JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES));
    printf("%d ecart(s) de volume et %d fait(s) ajoute(s) enregistre(s) dans %s\n",
           count($volumes), count($faits), basename($ref));
    exit(0);
}

$connu   = json_decode((string)@file_get_contents($ref), true) ?: ['volumes' => [], 'faits' => []];
$nvVol   = array_diff_key($volumes, $connu['volumes'] ?? []);
$nvFaits = array_diff_key($faits,   $connu['faits']   ?? []);

echo "CigarOdyssey — une traduction dit-elle ce que dit sa source ?\n\n";
echo "  rapport median de chaque langue au francais (recalcule) :\n    ";
foreach ($mediane as $l => $m) printf("%s %.2f   ", $l, $m);
echo "\n\n";
printf("  %d ecart(s) de volume au-dela d'un facteur %.0f\n", count($volumes), FACTEUR);

// ── LE DÉTAIL PAR LANGUE, SANS QUOI LA CAMPAGNE EST ILLISIBLE
//
// La promotion vers le français (migrations 101 et suivantes) fait
// MONTER ce total avant de le faire descendre : une fiche promue retire
// un écart en anglais et en crée quatre, en attente de traduction.
// -1 + 4 = +3 par fiche. Un total qui grimpe n'est donc pas une
// régression, et seul le détail par langue permet de le voir :
// l'anglais doit décroître de 40 vers 0, les quatre autres monter puis
// redescendre.
$parLangue = [];
foreach ($volumes as $id => $k) {
    $l = substr($id, strrpos($id, '|') + 1);
    $parLangue[$l] = ($parLangue[$l] ?? 0) + 1;
}
ksort($parLangue);
echo "    dont ";
foreach ($parLangue as $l => $n) printf("%s %d   ", $l, $n);
echo "\n";
printf("  %d traduction(s) portant une annee absente du francais\n", count($faits));
if ($connu['volumes'] ?? []) {
    printf("  (%d volume(s) et %d fait(s) connus et au cliquet)\n",
           count($connu['volumes']), count($connu['faits'] ?? []));
}

if (!$nvVol && !$nvFaits) {
    echo "\n  Rien de nouveau.\n";
    exit(0);
}

echo "\n";
foreach ($nvFaits as $id => $ans)
    echo "  ECHEC  $id : la traduction affirme l'annee $ans, absente du francais\n";
foreach ($nvVol as $id => $k)
    echo "  ECHEC  $id : volume a x$k de la mediane de sa langue\n";

printf("\n%d nouveau(x) ecart(s). Traduire, corriger, ou justifier via --figer.\n",
       count($nvVol) + count($nvFaits));
exit(1);
