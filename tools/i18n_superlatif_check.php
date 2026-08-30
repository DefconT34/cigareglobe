<?php
// ════════════════════════════════════════════════════════
// tools/i18n_superlatif_check.php — Un rang que la source ne fait pas
// ────────────────────────────────────────────────────────
// LE DÉFAUT. La fiche Atabey disait, du Cohiba Behike :
//
//   fr  « le cigare dont le prix a marqué une RUPTURE pour l'industrie
//         cubaine »
//   es  « el cigarro MÁS CARO JAMÁS LANZADO por la industria cubana »
//   de  « der TEUERSTEN Zigarre, die die kubanische Industrie JE
//         herausbrachte »
//   zh  « 古巴烟草业推出过的最昂贵的雪茄 »
//   ar  « أغلى سيجار أطلقته الصناعة الكوبية يوماً »
//
// Quatre langues sur six affirment un classement que ni le français ni
// l'anglais ne portent. « Marquer une rupture » est un constat ; « le
// plus cher jamais lancé » demande une source que personne n'a.
//
// ── POURQUOI marques_check NE POUVAIT PAS LE VOIR ───────
//
// Son détecteur de rangs cherche le MONDE — « du monde », « der Welt »,
// « في العالم », 世界/全球. Ici la borne est l'INDUSTRIE CUBAINE, un
// ensemble nommé, et c'est précisément la forme qu'il tient pour
// inoffensive : « le plus puissant des grands cubains », « la plus
// grande manufacture de République dominicaine » sont des bornes que la
// SOURCE assume.
//
// La différence n'est pas dans la borne, elle est dans l'origine. Ici le
// superlatif n'existe QUE dans la traduction. Aucun contrôle ne
// comparait, jusqu'ici, ce qu'une traduction affirme à ce que son
// français affirme.
//
// ── LA MESURE : UN ÉCART, PAS UNE PRÉSENCE ──────────────
//
// On ne cherche donc pas des superlatifs — il y en a partout, et
// légitimement. On compte ceux de la traduction, ceux du français, et
// on ne regarde que l'ÉCART. Une traduction qui en porte plus que sa
// source affirme quelque chose en plus.
//
// Le seuil n'est pas choisi au jugé : `--mesure` sort la distribution
// des écarts sur tout le corpus, et il se lit dessus.
//
//   php tools/i18n_superlatif_check.php            # controler
//   php tools/i18n_superlatif_check.php --mesure   # la distribution
//   php tools/i18n_superlatif_check.php --details
//   php tools/i18n_superlatif_check.php --figer    # reecrire le cliquet
// ════════════════════════════════════════════════════════

if (PHP_SAPI !== 'cli') { http_response_code(404); exit; }

require_once __DIR__ . '/../backend/config.php';
require_once __DIR__ . '/i18n_contenu_plan.php';

// L'ANGLAIS EST HORS PÉRIMÈTRE, POUR LA MÊME RAISON QUE DANS
// `i18n_divergence` : sur quarante fiches, `history_en` n'est pas une
// traduction du français mais un texte autonome et plus long. Y compter
// les superlatifs « en trop » reviendrait à reprocher à un texte de ne
// pas être la traduction qu'il n'est pas.
const LANGUES = ['es', 'de', 'zh', 'ar'];

/**
 * Les marques du superlatif, langue par langue.
 *
 * Volontairement resserrées sur la forme ABSOLUE ou RELATIVE explicite.
 * Un comparatif — « plus corsé que » — n'est pas un classement et n'a
 * rien à faire ici.
 *
 * L'allemand exige un article devant le superlatif en -ste : sans lui,
 * « bestimmten », « bestätigte » et la moitié du dictionnaire entrent.
 * C'est la même leçon qu'aux motifs de rangs de `marques_check`.
 */
// ── QUATRE CORRECTIONS, PAYÉES AU PREMIER PASSAGE ───────
//
// Le premier jet signalait 47 valeurs. Presque toutes étaient du bruit,
// et chaque langue mentait à sa façon :
//
//   fr  « l’une des plus improbables » n'était PAS compté : le motif ne
//       connaissait que l'apostrophe droite, et le corpus emploie la
//       typographique. Le français sous-comptait donc, et l'écart avec
//       ses traductions se creusait tout seul. C'était le défaut le plus
//       grave : il fabriquait des faux positifs par dizaines.
//   de  « der GolfKÜSTE » pris pour un superlatif. Les noms allemands en
//       -ste portent une MAJUSCULE, les adjectifs non : la casse tranche.
//       Et « die meisten » est un quantificateur — « la plupart ».
//   zh  最初 signifie « au début », pas « le plus ». De même 最下部,
//       positionnel, et 最大强度, technique.
//   ar  أكثر من est un COMPARATIF — « plus que ». Le superlatif ne prend
//       pas de complément en من.
const SUPERLATIFS = [
 // LE FRANÇAIS DOIT ÊTRE AUSSI RICHE QUE LES AUTRES, sans quoi il
 // sous-compte et l'écart se creuse tout seul. Trois formes manquaient
 // au premier jet, et chacune fabriquait ses faux positifs :
 //   « DES meilleurs tabacs » (partitif), « les MIEUX payées »
 //   (superlatif d'adverbe), « le PREMIER lector » (rang temporel, que
 //   le chinois rend par 第一).
 // QUATRE FORMES DE PLUS, TROUVÉES AU TROISIÈME PASSAGE. Chacune
 // fabriquait ses propres faux positifs, parce que le chinois les rend
 // toutes par 最 :
 //   « DU plus haut niveau »        → 最高水准
 //   « L'UNE DES PREMIÈRES maisons » → 最早
 //   « de force MINIMALE »          → 最小
 //   « des MOINS racontées »        → 最少
 'fr' => '/(?:le|la|les|du|des|l[\x27\x{2019}]un|l[\x27\x{2019}]une)\s+(?:des\s+)?(?:plus|moins)\s+\p{L}+'
       . '|\b(?:des|les|le|la)\s+meilleur\w*|\b(?:le|la|les)\s+mieux\s+\p{L}+'
       . '|\b(?:le|la|les|des|ses|leurs?|au|aux|l[\x27\x{2019}]un|l[\x27\x{2019}]une)\s+(?:des\s+)?premi[èe]r\w*'
       . '|\b(?:maximal|minimal|optimal|ultime|supr[êe]m)\w*'
       . '|\bjamais\s+(?:produit|lanc[ée]|fait|vu)\w*/iu',
 'en' => '/\bthe\s+(?:most|best|largest|oldest|finest|rarest|greatest|highest|strongest)\b'
       . '|\bone\s+of\s+the\s+(?:most|best|largest|oldest|finest|rarest)\b'
       . '|\bever\s+(?:made|produced|released|launched|sold)\b/i',
 'es' => '/(?:el|la|los|las)\s+m[áa]s\s+\p{L}+|\b(?:el|la)\s+mejor\b|\buno\s+de\s+los\s+m[áa]s\b'
       . '|\bjam[áa]s\s+(?:lanzad|produci|hech)\w*/iu',
 // Adjectif en minuscule exigé, et « die meisten » écarté.
 'de' => '/\b(?:der|die|das|dem|den)\s+(?:\p{Ll}+\s+)?\p{Ll}{3,}st(?:e|en|er)\b(?<!meisten)'
       . '|\bam\s+\p{Ll}+sten\b|\bmeistverkauft\w*|\bteuerst\w*|\bältest\w*|\bgrößt\w*/u',
 // 最初 « au début », 最后 « le dernier », 最下/最上 positionnels : aucun
 // n'est un rang. 最后半小时 est « la dernière demi-heure », et le
 // premier jet la comptait comme une prétention.
 'zh' => '/最(?!初|下|上|后)\p{Han}{1,3}|第一(?!次)|之最/u',
 'ar' => '/(?<![\p{L}])(?:أكثر|أفضل|أكبر|أقدم|أغلى|أشهر|أعلى|أندر|أقوى)(?![\p{L}])(?!\s*من\b)/u',
];

function compte(string $texte, string $langue): int {
    $m = [];
    return preg_match_all(SUPERLATIFS[$langue], $texte, $m);
}

/** Texte utile d'une valeur, JSON compris. */
function feuilles(string $brut): string {
    $x = ltrim($brut);
    if ($x === '' || ($x[0] !== '[' && $x[0] !== '{')) return $brut;
    $j = json_decode($brut, true);
    if (!is_array($j)) return '';
    $f = [];
    array_walk_recursive($j, function ($v) use (&$f) { if (is_string($v)) $f[] = $v; });
    return implode("\n", $f);
}

// ── POURQUOI UN SEUL SUFFIT, ET DONC POURQUOI UN CLIQUET ─
//
// Le premier reglage exigeait DEUX superlatifs de plus que la source :
// la distribution montrait un decrochage net apres +1, et le seuil de 2
// ramenait le corpus a zero apres quatre passes d'affinage.
//
// Il laissait pourtant passer le defaut qui a motive ce controle.
// L'allemand d'Atabey n'en portait qu'UN : « der teuersten Zigarre, die
// die kubanische Industrie je herausbrachte ». Un seul superlatif
// invente est un rang invente.
//
// Le seuil descend donc a 1, et le controle fonctionne au CLIQUET,
// comme les rangs mondiaux de `marques_check` : les ecarts connus sont
// enregistres, et il echoue si un NOUVEAU apparait. Le compte ne peut
// que descendre.
//
// Les 122 ecarts de +1 du corpus sont, pour l'essentiel, des
// asymetries de langue : le chinois rend par 最 ce que le francais dit
// autrement. Les inscrire au cliquet ne les absout pas — ils attendent
// une relecture par un locuteur, comme le reste.
const SEUIL = 1;

// ── LES CAS CONSTRUITS ──────────────────────────────────
//
// Le corpus est propre depuis la migration 129 : un controle qui ne
// trouve rien ne prouve rien. Ces paires sont verifiees a chaque
// passage, et ce sont les phrases REELLES d'Atabey avant correction.
const CAS = [
 // [langue, francais, traduction, doit se declencher]
 ['es', 'le cigare dont le prix a marqué une rupture pour l\'industrie cubaine',
        'el cigarro más caro jamás lanzado por la industria cubana', true],
 ['de', 'le cigare dont le prix a marqué une rupture pour l\'industrie cubaine',
        'der teuersten Zigarre, die die kubanische Industrie je herausbrachte', true],
 ['zh', 'le cigare dont le prix a marqué une rupture pour l\'industrie cubaine',
        '那是古巴烟草业推出过的最昂贵的雪茄', true],
 ['ar', 'le cigare dont le prix a marqué une rupture pour l\'industrie cubaine',
        'أغلى سيجار أطلقته الصناعة الكوبية يوماً', true],
 // Et ce qui ne doit PAS se declencher : la source porte le rang.
 ['es', 'la région la plus prestigieuse de Cuba', 'la región más prestigiosa de Cuba', false],
 ['de', 'la plus grande manufacture indépendante de République dominicaine',
        'die größte unabhängige Zigarrenmanufaktur der Dominikanischen Republik', false],
 ['zh', 'les premiers habitants de Cuba', '古巴最早居民', false],
 ['zh', 'la dernière demi-heure', '最后半小时', false],
 ['ar', 'plus de trois mille boîtes', 'أكثر من ثلاثة آلاف علبة', false],
];

$echecsTemoins = [];
foreach (CAS as [$l, $fr, $tr, $doit]) {
    $d = compte($tr, $l) - compte($fr, 'fr');
    $tire = $d >= SEUIL;
    if ($tire !== $doit) {
        $echecsTemoins[] = sprintf('%s (ecart %+d, attendu %s) : %s',
            $l, $d, $doit ? 'declenchement' : 'silence', mb_substr($tr, 0, 60));
    }
}

$db      = getDB();
$mesure  = in_array('--mesure', $argv, true);
$details = in_array('--details', $argv, true);

$ecarts = [];      // cle -> [langue, ecart, extrait]
$distribution = [];

foreach (plan_contenu() as $table => $champs) {
    $cle = null;
    foreach (['name', 'id'] as $c) {
        try { $db->query("SELECT `$c` FROM `$table` LIMIT 0"); $cle = $c; break; }
        catch (Throwable $e) { }
    }
    if ($cle === null) continue;

    foreach ($champs as $ch) {
        $cols = ["`$cle` k", "`$ch` fr"];
        foreach (LANGUES as $l) $cols[] = "`{$ch}_{$l}` `$l`";
        try { $q = $db->query('SELECT ' . implode(', ', $cols) . " FROM `$table`
                                WHERE `$ch` IS NOT NULL AND `$ch` <> '' AND `$ch` <> '[]'"); }
        catch (Throwable $e) { continue; }

        foreach ($q as $r) {
            $nFr = compte(feuilles((string)$r['fr']), 'fr');
            foreach (LANGUES as $l) {
                $v = (string)($r[$l] ?? '');
                if (trim($v) === '' || trim($v) === '[]') continue;
                $n = compte(feuilles($v), $l);
                $d = $n - $nFr;
                if ($d <= 0) { $distribution[0] = ($distribution[0] ?? 0) + 1; continue; }
                $distribution[$d] = ($distribution[$d] ?? 0) + 1;
                if ($d < SEUIL) continue;

                preg_match(SUPERLATIFS[$l], feuilles($v), $m);
                $ecarts["$table.$ch|{$r['k']}|$l"] =
                    sprintf('%d contre %d — « %s »', $n, $nFr, mb_substr($m[0] ?? '', 0, 40));
            }
        }
    }
}

if ($mesure) {
    echo "CigarOdyssey — distribution des ecarts de superlatif\n\n";
    ksort($distribution);
    $total = array_sum($distribution);
    foreach ($distribution as $d => $n) {
        printf("  ecart %+d : %5d valeur(s)  %5.2f%%  %s\n", $d, $n, 100 * $n / $total,
               str_repeat('#', (int)min(60, round(60 * $n / max($distribution)))));
    }
    printf("\n  %d valeurs comparees\n", $total);
    exit(0);
}

$ref = __DIR__ . '/i18n_superlatif_baseline.json';

if (in_array('--figer', $argv, true)) {
    ksort($ecarts);
    file_put_contents($ref, json_encode($ecarts, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES));
    printf("%d ecart(s) enregistre(s) dans %s\n", count($ecarts), basename($ref));
    exit(0);
}

$connus   = json_decode((string)@file_get_contents($ref), true) ?: [];
$nouveaux = array_diff_key($ecarts, $connus);
$regles   = array_diff_key($connus, $ecarts);

echo "CigarOdyssey — une traduction affirme-t-elle un rang que sa source ne fait pas ?\n\n";

if ($echecsTemoins) {
    echo "  LE DETECTEUR NE TIENT PLUS SES CAS CONSTRUITS :\n";
    foreach ($echecsTemoins as $e) echo "    ECHEC  $e\n";
    echo "\n";
} else {
    printf("  %d cas construits verifies : les quatre phrases d'Atabey se\n"
         . "  declenchent, les cinq formes legitimes restent muettes.\n\n", count(CAS));
}

printf("  %d ecart(s) d'au moins %d superlatif(s)", count($ecarts), SEUIL);
printf("%s\n", $regles ? sprintf(" — %d regle(s), penser a --figer", count($regles)) : '');

if ($details) {
    foreach ($ecarts as $k => $v) echo "    $k : $v\n";
}

if (!$nouveaux && !$echecsTemoins) {
    echo "\n  Rien de nouveau.\n";
    exit(0);
}
if ($echecsTemoins && !$nouveaux) exit(1);
echo "\n";
foreach ($nouveaux as $k => $v) echo "  ECHEC  $k : $v\n";
printf("\n%d nouvel(s) ecart(s). Retirer le superlatif, ou justifier via --figer.\n", count($nouveaux));
exit(1);
