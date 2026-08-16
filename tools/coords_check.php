<?php
/**
 * coords_check.php — chaque point tombe-t-il dans le pays qu'il désigne ?
 *
 * POURQUOI CET OUTIL EXISTE
 * -------------------------
 * L'audit E4 a testé 152 points en 2023 et corrigé deux erreurs (Israël,
 * Semi Vuelta, migration 006). Il n'a laissé AUCUN outil. Résultat : la
 * migration 027 a ajouté trois pays producteurs et quatre zones de
 * production que personne n'a jamais vérifiés, et rien ne le signalait.
 *
 * Un audit fait une fois et jamais rejoué n'est pas un audit, c'est une
 * photo. Celui-ci est rejouable, et `tests/run.php` l'appelle.
 *
 * COMMENT
 * -------
 * Les contours viennent de `assets/data/countries-110m.json` — le même
 * fichier que le front dessine (E3), donc aucune source à maintenir en
 * plus. C'est du TopoJSON quantifié : le décodage (arcs, deltas,
 * transform) est fait ici, en une centaine de lignes.
 *
 * Le pays attendu se déduit du DRAPEAU, jamais d'un identifiant maison :
 * un émoji de drapeau est composé de deux lettres régionales, donc d'un
 * code ISO à deux lettres. `data.fetes.js` fait déjà exactement ça côté
 * front — même règle des deux côtés.
 *
 * CE QUE L'OUTIL TOLÈRE, ET POURQUOI
 * ----------------------------------
 * La carte 110m est très simplifiée : un point côtier légitime peut
 * tomber quelques kilomètres à côté du polygone. On accepte donc un
 * point situé HORS de son pays s'il en est à moins d'un degré et qu'il
 * ne tombe dans aucun autre. En revanche, un point qui atterrit dans un
 * AUTRE pays est toujours une erreur — c'est le cas d'Israël en 2023.
 *
 * La carte ne contient que 177 pays : les micro-États et territoires
 * (Monaco, Hong Kong, Gibraltar, Saint-Martin…) en sont absents. Ils
 * sont comptés « hors carte », pas en échec — on ne peut pas vérifier
 * avec un fond de carte qui les ignore.
 *
 * Cas voisin et plus retors : un pays PRÉSENT sur la carte dont une
 * partie du territoire n'est pas dessinée. Le polygone « Spain » du fond
 * 110m ne couvre que la péninsule ; les Canaries, trop petites, en sont
 * absentes. Le point est juste, la carte est grossière. Ces cas sont
 * listés nommément dans SANS_FOND ci-dessous, avec leur raison — une
 * exception par entité, jamais une catégorie entière : si les
 * coordonnées de Cuba dérivent un jour, l'outil le dira quand même.
 *
 * Un outil qui échoue toujours finit ignoré. Celui-ci dit ce qu'il ne
 * peut pas vérifier, et échoue seulement sur ce qu'il peut.
 *
 * USAGE
 *   php tools/coords_check.php            résumé + anomalies
 *   php tools/coords_check.php --details  toutes les lignes
 *   sortie 0 si rien ne cloche, 1 sinon
 */
declare(strict_types=1);

require_once __DIR__ . '/../backend/config.php';

const CARTE     = __DIR__ . '/../assets/data/countries-110m.json';
const TOLERANCE = 1.0;   // degrés — marge de simplification côtière

/** ISO 3166-1 alpha-2 → numérique, pour les 93 codes présents en base.
 *  Donnée de référence, pas une estimation. */
const ISO_NUM = [
    'AD'=>20,'AE'=>784,'AL'=>8,'AM'=>51,'AR'=>32,'AT'=>40,'AU'=>36,'AW'=>533,
    'AZ'=>31,'BB'=>52,'BE'=>56,'BF'=>854,'BG'=>100,'BH'=>48,'BJ'=>204,'BR'=>76,
    'BW'=>72,'CA'=>124,'CH'=>756,'CI'=>384,'CL'=>152,'CM'=>120,'CN'=>156,
    'CO'=>170,'CR'=>188,'CU'=>192,'CY'=>196,'CZ'=>203,'DE'=>276,'DO'=>214,
    'EC'=>218,'EG'=>818,'ES'=>724,'ET'=>231,'FR'=>250,'GB'=>826,'GH'=>288,
    'GI'=>292,'GN'=>324,'GR'=>300,'GT'=>320,'HK'=>344,'HN'=>340,'HR'=>191,
    'ID'=>360,'IL'=>376,'IN'=>356,'IR'=>364,'IT'=>380,'JM'=>388,'JP'=>392,
    'KE'=>404,'KH'=>116,'KN'=>659,'KR'=>410,'KW'=>414,'KY'=>136,'LB'=>422,
    'LU'=>442,'MA'=>504,'MC'=>492,'MF'=>663,'ML'=>466,'MX'=>484,'MY'=>458,
    'NG'=>566,'NI'=>558,'NL'=>528,'OM'=>512,'PA'=>591,'PE'=>604,'PH'=>608,
    'PL'=>616,'PT'=>620,'PY'=>600,'QA'=>634,'RO'=>642,'RS'=>688,'RU'=>643,
    'SA'=>682,'SG'=>702,'SN'=>686,'TG'=>768,'TH'=>764,'TR'=>792,'TW'=>158,
    'TZ'=>834,'UA'=>804,'US'=>840,'VE'=>862,'VN'=>704,'ZA'=>710,
];

/** Entités dont le territoire N'EST PAS dessiné par le fond 110m, alors
 *  que leur pays de rattachement y figure. Le point est bon, la carte
 *  ne le couvre pas — on ne peut donc rien vérifier.
 *
 *  Une entrée par identifiant, avec sa raison. Ne jamais élargir à une
 *  catégorie : c'est ainsi qu'un contrôle cesse de contrôler. */
const SANS_FOND = [
    'canaries' => 'archipel absent du fond 110m — le polygone « Spain » ne couvre que la péninsule',
];

/** « 🇨🇺 » → « CU ». Deux indicateurs régionaux, rien d'autre. */
function iso_du_drapeau(string $flag): string {
    $out = '';
    foreach (preg_split('//u', $flag, -1, PREG_SPLIT_NO_EMPTY) ?: [] as $ch) {
        $cp = mb_ord($ch, 'UTF-8');
        if ($cp >= 0x1F1E6 && $cp <= 0x1F1FF) $out .= chr($cp - 0x1F1E6 + 65);
    }
    return $out;
}

// ── Décodage TopoJSON ───────────────────────────────────
// Les arcs sont quantifiés : premier point absolu, suite en deltas.
// Un indice négatif désigne l'arc ~i parcouru à l'envers.

function charger_carte(): array {
    $topo = json_decode((string)file_get_contents(CARTE), true);
    if (!is_array($topo)) { fwrite(STDERR, "ABANDON : carte illisible.\n"); exit(2); }

    [$sx, $sy] = $topo['transform']['scale'];
    [$tx, $ty] = $topo['transform']['translate'];

    $arcs = [];
    foreach ($topo['arcs'] as $arc) {
        $x = 0; $y = 0; $pts = [];
        foreach ($arc as [$dx, $dy]) {
            $x += $dx; $y += $dy;
            $pts[] = [$x * $sx + $tx, $y * $sy + $ty];
        }
        $arcs[] = $pts;
    }

    $ring = function (array $indices) use ($arcs): array {
        $ring = [];
        foreach ($indices as $i) {
            $a = $i < 0 ? array_reverse($arcs[~$i]) : $arcs[$i];
            // Le premier point d'un arc suivant répète le dernier du précédent.
            if ($ring) array_shift($a);
            foreach ($a as $p) $ring[] = $p;
        }
        return $ring;
    };

    $pays = [];
    foreach ($topo['objects']['countries']['geometries'] as $g) {
        $polys = [];
        if ($g['type'] === 'Polygon') {
            $polys[] = array_map($ring, $g['arcs']);
        } elseif ($g['type'] === 'MultiPolygon') {
            foreach ($g['arcs'] as $poly) $polys[] = array_map($ring, $poly);
        } else {
            continue;
        }
        $pays[] = [
            'num'   => (int)($g['id'] ?? 0),
            'nom'   => $g['properties']['name'] ?? '?',
            'polys' => $polys,
        ];
    }
    return $pays;
}

/** Lancer de rayon, règle pair-impair : les trous comptent aussi. */
function dans_anneau(float $lon, float $lat, array $ring): bool {
    $dedans = false; $n = count($ring);
    for ($i = 0, $j = $n - 1; $i < $n; $j = $i++) {
        [$xi, $yi] = $ring[$i];
        [$xj, $yj] = $ring[$j];
        if (($yi > $lat) !== ($yj > $lat)
            && $lon < ($xj - $xi) * ($lat - $yi) / (($yj - $yi) ?: 1e-12) + $xi) {
            $dedans = !$dedans;
        }
    }
    return $dedans;
}

function dans_pays(float $lon, float $lat, array $pays): bool {
    foreach ($pays['polys'] as $poly) {
        $dedans = false;
        foreach ($poly as $k => $ring) {
            if (dans_anneau($lon, $lat, $ring)) $dedans = $k === 0 ? true : !$dedans;
        }
        if ($dedans) return true;
    }
    return false;
}

/** Distance en degrés au bord le plus proche — sert à juger d'un point côtier. */
function distance_au_pays(float $lon, float $lat, array $pays): float {
    $min = INF;
    foreach ($pays['polys'] as $poly) {
        foreach ($poly as $ring) {
            $n = count($ring);
            for ($i = 0, $j = $n - 1; $i < $n; $j = $i++) {
                [$x1, $y1] = $ring[$j]; [$x2, $y2] = $ring[$i];
                $dx = $x2 - $x1; $dy = $y2 - $y1;
                $l2 = $dx * $dx + $dy * $dy;
                $t  = $l2 > 0 ? max(0.0, min(1.0, (($lon - $x1) * $dx + ($lat - $y1) * $dy) / $l2)) : 0.0;
                $px = $x1 + $t * $dx; $py = $y1 + $t * $dy;
                $d  = sqrt(($lon - $px) ** 2 + ($lat - $py) ** 2);
                if ($d < $min) $min = $d;
            }
        }
    }
    return $min;
}

// ── Les points à contrôler ──────────────────────────────

$db     = getDB();
$carte  = charger_carte();
$parNum = [];
foreach ($carte as $p) $parNum[$p['num']] = $p;

$points = [];
foreach ([
    ['producer_countries', 'pays producteur'],
    ['markets',            'marché'],
    ['lounge_countries',   'pays à lounges'],
] as [$table, $genre]) {
    foreach ($db->query("SELECT id, name, flag, lat, lon FROM `$table`") as $r) {
        $points[] = ['genre' => $genre, 'cle' => $r['id'], 'libelle' => $r['name'],
                     'iso' => iso_du_drapeau($r['flag']),
                     'lat' => (float)$r['lat'], 'lon' => (float)$r['lon']];
    }
}
// Les zones héritent du drapeau de leur pays : c'est bien le pays
// producteur qu'elles doivent désigner.
foreach ($db->query(
    'SELECT z.country_id, z.name, z.lat, z.lon, c.flag, c.name AS pays
       FROM production_zones z JOIN producer_countries c ON c.id = z.country_id') as $r) {
    $points[] = ['genre' => 'zone', 'cle' => $r['country_id'], 'libelle' => $r['pays'] . ' / ' . $r['name'],
                 'iso' => iso_du_drapeau($r['flag']),
                 'lat' => (float)$r['lat'], 'lon' => (float)$r['lon']];
}

// ── Contrôle ────────────────────────────────────────────

$details = in_array('--details', $argv, true);
$ok = $cote = $hors = $sansFond = 0;
$anomalies = [];

foreach ($points as $pt) {
    if (isset(SANS_FOND[$pt['cle']])) {
        $sansFond++;
        if ($details) printf("  ~    %-16s %-34s %s\n", $pt['genre'], $pt['libelle'], SANS_FOND[$pt['cle']]);
        continue;
    }

    $num = ISO_NUM[$pt['iso']] ?? null;

    if ($num === null || !isset($parNum[$num])) {
        $hors++;
        if ($details) printf("  ~    %-16s %-34s %s\n", $pt['genre'], $pt['libelle'],
            $pt['iso'] === '' ? 'aucun drapeau ISO' : 'hors carte (' . $pt['iso'] . ')');
        continue;
    }

    $attendu = $parNum[$num];

    if (dans_pays($pt['lon'], $pt['lat'], $attendu)) {
        $ok++;
        if ($details) printf("  OK   %-16s %-34s %s\n", $pt['genre'], $pt['libelle'], $attendu['nom']);
        continue;
    }

    // Hors du polygone attendu : tombe-t-il chez quelqu'un d'autre ?
    $intrus = null;
    foreach ($carte as $autre) {
        if ($autre['num'] === $attendu['num']) continue;
        if (dans_pays($pt['lon'], $pt['lat'], $autre)) { $intrus = $autre['nom']; break; }
    }

    if ($intrus !== null) {
        $anomalies[] = sprintf('%-16s %-34s tombe en %s, pas en %s',
            $pt['genre'], $pt['libelle'], $intrus, $attendu['nom']);
        continue;
    }

    $d = distance_au_pays($pt['lon'], $pt['lat'], $attendu);
    if ($d <= TOLERANCE) {
        $cote++;
        if ($details) printf("  ~    %-16s %-34s à %.2f° de la côte de %s\n",
            $pt['genre'], $pt['libelle'], $d, $attendu['nom']);
    } else {
        $anomalies[] = sprintf('%-16s %-34s en pleine mer, à %.2f° de %s',
            $pt['genre'], $pt['libelle'], $d, $attendu['nom']);
    }
}

echo "\n";
printf("%d point(s) contrôlé(s) sur %d pays de la carte\n", count($points), count($carte));
printf("  OK   %d dans leur pays\n", $ok);
printf("  ~    %d en marge côtière (≤ %.1f°, simplification de la carte 110m)\n", $cote, TOLERANCE);
printf("  ~    %d hors carte (micro-États et territoires absents du fond)\n", $hors);
printf("  ~    %d invérifiable(s) — territoire non dessiné par le fond 110m :\n", $sansFond);
foreach (SANS_FOND as $cle => $raison) printf("         %s : %s\n", $cle, $raison);
echo "──────────────────────────────────────────────────────────\n";
if (!$anomalies) {
    echo "  Aucun point ne se trompe de pays.\n";
    exit(0);
}
printf("  %d ANOMALIE(S) :\n", count($anomalies));
foreach ($anomalies as $a) echo "    · $a\n";
exit(1);
