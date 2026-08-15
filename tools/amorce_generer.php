<?php
/**
 * amorce_generer.php — fabrique assets/js/data.amorce.js depuis la base.
 *
 * POURQUOI CET OUTIL EXISTE
 * -------------------------
 * Le front embarquait SIX copies statiques du contenu (data.inline.js,
 * data.countries.js, data.markets.js, data.geo.js, data.zones.js,
 * data.habanos.js), chacune faisant un `var X = [...]` non gardé : la
 * dernière chargée écrasait toutes les autres, y compris ce que l'API
 * avait pu déjà écrire. Elles dataient d'avant les migrations 021→024 —
 * huit marques cubaines au lieu de vingt-sept, aucun drapeau `cape` — et
 * rien n'indiquait au visiteur laquelle des deux versions il lisait.
 *
 * Le remède retenu : n'embarquer QUE ce qu'il faut pour dessiner le
 * globe — identifiants, noms, drapeaux, coordonnées. On ne peut pas
 * afficher une donnée périmée qu'on n'embarque pas. Tout le reste
 * (marques, chiffres, zones, fiche pratique) vient de l'API, et les
 * panneaux attendent qu'elle réponde plutôt que de montrer un ancien
 * état.
 *
 * USAGE
 *   php tools/amorce_generer.php              écrit le fichier
 *   php tools/amorce_generer.php --verifier   ne l'écrit pas ; sort en 1
 *                                             s'il ne correspond plus à
 *                                             la base (tests, CI)
 *
 * À REJOUER après toute migration qui ajoute, retire ou déplace un pays,
 * un marché ou un pays à lounges. Pas besoin après un ajout de marque :
 * les marques ne sont plus embarquées, c'est tout l'intérêt.
 */
declare(strict_types=1);

require_once __DIR__ . '/../backend/config.php';

const CIBLE = __DIR__ . '/../assets/js/data.amorce.js';

/** Les champs que le globe lit vraiment — vérifiés un par un dans
 *  globe.js, app.js, a11y-globe.js et explorer.js. Tout le reste est du
 *  contenu de panneau, donc du ressort de l'API. */
const CHAMPS_PAYS    = ['id', 'name', 'flag', 'lat', 'lon', 'region', 'tier', 'color'];
const CHAMPS_MARCHE  = ['id', 'name', 'flag', 'lat', 'lon', 'rank', 'color'];
const CHAMPS_LOUNGE  = ['id', 'name', 'flag', 'lat', 'lon', 'color'];

function garder(array $ligne, array $champs): array {
    $out = [];
    foreach ($champs as $c) {
        $v = $ligne[$c] ?? null;
        if (in_array($c, ['lat', 'lon'], true))      $v = round((float)$v, 4);
        elseif ($c === 'rank')                        $v = (int)$v;
        $out[$c] = $v;
    }
    // Marque d'amorçage : les panneaux s'en servent pour savoir qu'ils
    // tiennent une ébauche et doivent attendre la base avant d'afficher
    // quoi que ce soit d'autre que le nom et le drapeau.
    $out['amorce'] = 1;
    return $out;
}

$db = getDB();

$pays = array_map(
    fn($r) => garder($r, CHAMPS_PAYS),
    $db->query('SELECT id, name, flag, lat, lon, region, tier, color
                  FROM producer_countries ORDER BY name')->fetchAll(PDO::FETCH_ASSOC)
);
$marches = array_map(
    fn($r) => garder($r, CHAMPS_MARCHE),
    $db->query('SELECT id, name, flag, lat, lon, rank_num AS `rank`, color
                  FROM markets ORDER BY rank_num')->fetchAll(PDO::FETCH_ASSOC)
);
$lounges = array_map(
    fn($r) => garder($r, CHAMPS_LOUNGE),
    $db->query('SELECT id, name, flag, lat, lon, color
                  FROM lounge_countries ORDER BY name')->fetchAll(PDO::FETCH_ASSOC)
);

$j = fn($v) => json_encode($v, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);

$contenu = <<<JS
/* data.amorce.js — GÉNÉRÉ, NE PAS MODIFIER À LA MAIN */
// Régénérer : php tools/amorce_generer.php
// Vérifier  : php tools/amorce_generer.php --verifier
//
// Le strict nécessaire pour DESSINER LE GLOBE : identifiants, noms,
// drapeaux, coordonnées. Rien d'autre. Les marques, les chiffres, les
// zones et la fiche pratique viennent de l'API — les embarquer ici,
// c'est se condamner à afficher un jour un état périmé sans le savoir.
//
// Chaque entrée porte `amorce:1`. Les panneaux le lisent pour savoir
// qu'ils tiennent une ébauche : ils attendent alors la base au lieu
// d'afficher un contenu qu'ils n'ont pas.

var COUNTRIES        = {$j($pays)};
var MARKETS          = {$j($marches)};
var LOUNGE_COUNTRIES = {$j($lounges)};

// Remplis par l'API (data.loader.js) — jamais embarqués.
var GEO_INFO     = {};
var ZONES        = {};
var LOUNGES      = {};
var BRANDS_DB    = {};
var HABANOS_DATA = {};

window.CG_AMORCE = true;

JS;

if (in_array('--verifier', $argv, true)) {
    $actuel = is_file(CIBLE) ? file_get_contents(CIBLE) : '';
    // Comparaison insensible aux fins de ligne : Git normalise, pas nous.
    $n = fn($s) => str_replace("\r\n", "\n", $s);
    if ($n($actuel) === $n($contenu)) {
        echo "OK   data.amorce.js correspond a la base.\n";
        exit(0);
    }
    fwrite(STDERR,
        "ECHEC  data.amorce.js ne correspond plus a la base.\n" .
        "       Un pays, un marche ou un pays a lounges a bouge.\n" .
        "       Rejouer : php tools/amorce_generer.php\n");
    exit(1);
}

file_put_contents(CIBLE, $contenu);
printf("data.amorce.js ecrit : %d pays, %d marches, %d pays a lounges (%d octets).\n",
    count($pays), count($marches), count($lounges), strlen($contenu));
