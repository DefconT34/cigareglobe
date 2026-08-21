<?php
// ════════════════════════════════════════════════════════
// data.php — API de données statiques CigarOdyssey
// Remplace tous les fichiers data.*.js
// ════════════════════════════════════════════════════════
// Endpoints :
//   GET ?action=globe          → données légères pour le globe (COUNTRIES + MARKETS + LOUNGE_COUNTRIES)
//   GET ?action=country&id=X   → détail complet d'un pays producteur
//   GET ?action=lounges&id=X   → établissements d'un pays
//   GET ?action=brand&name=X   → détail d'une marque
//   GET ?action=feuille&id=X   → détail d'une feuille
//   GET ?action=market&id=X    → détail d'un marché
//   GET ?action=all            → tout d'un coup (fallback)
// ════════════════════════════════════════════════════════

require_once __DIR__ . '/config.php';

// Les details techniques (message SQL, fichier, ligne) partent dans le
// journal du serveur, jamais dans la reponse : ils renseigneraient un
// attaquant sur le schema et l'arborescence. APP_DEBUG=true les reaffiche
// en developpement uniquement.
set_exception_handler(function(Throwable $e) {
    error_log('[data.php] ' . $e->getMessage() . ' @ ' . $e->getFile() . ':' . $e->getLine());
    http_response_code(500);
    header('Content-Type: application/json; charset=utf-8');
    $out = err('server_error', 'Erreur serveur.');
    if (defined('APP_DEBUG') && APP_DEBUG) {
        $out['debug'] = $e->getMessage() . ' @ ' . basename($e->getFile()) . ':' . $e->getLine();
    }
    echo json_encode($out);
    exit;
});

cors_headers(false);
header('Access-Control-Allow-Methods: GET, OPTIONS');
header('Content-Type: application/json; charset=utf-8');
// Le cache est pose par jout(), au moment de la reponse : les donnees
// dependent de la langue demandee et ne peuvent pas etre figees une
// heure comme elles l'etaient ici.

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') { http_response_code(204); exit; }

function jout(mixed $d): void {
    // La reponse depend du parametre « lang ». Sans en-tete explicite,
    // le navigateur applique sa propre heuristique — et le .htaccess
    // pose meme un Expires de 5 minutes sur le JSON : une reponse
    // francaise pouvait etre resservie apres un changement de langue,
    // ou une correction de contenu rester invisible.
    //
    // « no-cache » n'interdit pas la mise en cache : il impose la
    // revalidation a chaque usage, ce qui est exactement le besoin ici.
    header('Cache-Control: no-cache');
    // Second argument a false : header() REMPLACE par defaut, ce qui
    // effacait le « Vary: Origin » pose par cors_headers() — un cache
    // aurait pu servir la reponse d'une origine a une autre.
    header('Vary: Accept-Encoding', false);
    echo json_encode($d, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK);
    exit;
}

function parse_json_field(mixed $v): mixed {
    if (is_array($v) || is_null($v)) return $v;
    $decoded = json_decode($v, true);
    return ($decoded !== null) ? $decoded : $v;
}

function row_parse(array $row, array $json_fields): array {
    foreach ($json_fields as $f) {
        if (isset($row[$f])) $row[$f] = parse_json_field($row[$f]);
    }
    return $row;
}

$db     = getDB();
$action = trim($_GET['action'] ?? 'globe');

try {
    match ($action) {
        'globe'   => action_globe($db),
        'country' => action_country($db),
        'lounges'     => action_lounges($db),
        'lounges_all' => action_lounges_all($db),
        'brand'   => action_brand($db),
        'feuille' => action_feuille($db),
        'market'  => action_market($db),
        'all'     => action_all($db),
        default   => (function(){ http_response_code(404); jout(err('unknown_action', 'Action inconnue')); })(),
    };
} catch (Throwable $e) {
    error_log('[data.php] ' . $e->getMessage() . ' @ ' . $e->getFile() . ':' . $e->getLine());
    http_response_code(500);
    $out = err('server_error', 'Erreur serveur.');
    if (defined('APP_DEBUG') && APP_DEBUG) $out['debug'] = $e->getMessage();
    jout($out);
}


// Colonnes des fiches d'etablissement. Le schema est fige et versionne
// (sql/schema.sql) : plus besoin d'un DESCRIBE a chaque requete pour
// deviner les colonnes disponibles.
/** Colonne de description selon la langue demandee, avec repli sur le francais. */
function lounge_desc_col(): string {
    // Tableau local : une constante declaree ici ne serait pas encore
    // definie au moment ou le routeur (plus haut) appelle ces fonctions.
    $lang = in_array($_GET['lang'] ?? '', ['en','es','de','zh','ar'], true) ? $_GET['lang'] : 'fr';
    return $lang === 'fr'
        ? 'description AS `desc`'
        : "COALESCE(NULLIF(description_{$lang}, ''), description) AS `desc`";
}

/**
 * Langue demandee, validee. Le francais est la langue de reference :
 * c'est lui qui est stocke dans la colonne sans suffixe.
 */
function langue_courante(): string {
    $l = $_GET['lang'] ?? '';
    return in_array($l, ['en','es','de','zh','ar'], true) ? $l : 'fr';
}

/**
 * Applique la langue courante a une ligne : pour chaque champ traduisible,
 * la colonne « champ_xx » remplace « champ » si elle est renseignee, puis
 * toutes les colonnes de langue sont retirees de la reponse.
 *
 * Le repli est volontaire : une traduction absente laisse le francais
 * plutot qu'un vide, ce qui permet de remplir le contenu progressivement.
 */
function traduire(array $ligne, array $champs): array {
    $lang = langue_courante();
    foreach ($champs as $champ) {
        if ($lang !== 'fr') {
            $col = $champ . '_' . $lang;
            if (isset($ligne[$col]) && $ligne[$col] !== '') $ligne[$champ] = $ligne[$col];
        }
        foreach (['en','es','de','zh','ar'] as $l) unset($ligne[$champ . '_' . $l]);
    }
    return $ligne;
}

/**
 * Champs traduisibles, par table.
 *
 * Une fonction plutot qu'une constante : le routage de ce fichier
 * s'execute avant les declarations qui le suivent, et « const » n'est
 * pas remontee comme le sont les fonctions.
 */
function champs_traduits(string $table): array {
    return [
        'producer_countries' => ['region','production','rev_detail','harvest','climate','soil','notes'],
        'markets'            => ['consumption','cigars','trend','note'],
        'production_zones'   => ['note'],
        'habanos_presence'   => ['status','ownership','description','festival'],
        'brands'             => ['history','gamme','celebrities','pairings'],
        // Doit rester d'accord avec tools/i18n_contenu_plan.php : deux
        // listes du meme fait, et c'est le piege documente au lot 5.
        // tests/run.php compare desormais les deux.
        'feuilles'           => ['genese','culture','caracteres','notes','pairings'],
    ][$table] ?? [];
}

/**
 * Dictionnaire de traductions libres, charge une fois par requete.
 *
 * Indexe sur le texte source et non sur une colonne : le meme libelle
 * peut apparaitre dans plusieurs tables et plusieurs structures JSON,
 * il ne se traduit qu'une fois. Voir la migration 008.
 */
function dictionnaire_libre(PDO $db): array {
    static $dico = null;
    if ($dico !== null) return $dico;

    $lang = langue_courante();
    $dico = [];
    if ($lang === 'fr') return $dico;

    try {
        $st = $db->prepare('SELECT source_hash, target_text FROM content_translations WHERE lang = ?');
        $st->execute([$lang]);
        foreach ($st as $r) $dico[$r['source_hash']] = $r['target_text'];
    } catch (Throwable $e) {
        // Table absente (base pas encore migree) : on sert le francais.
        error_log('[data.php] dictionnaire libre indisponible : ' . $e->getMessage());
    }
    return $dico;
}

/**
 * Traduit le texte libre d'une valeur, en descendant dans les tableaux
 * et les objets. Une chaine sans entree au dictionnaire est laissee
 * telle quelle — le francais reste, plutot qu'un vide.
 *
 * Les cles ne sont jamais traduites, seulement les valeurs : « name »
 * doit rester « name » pour le front.
 */
function traduire_libre(PDO $db, mixed $valeur): mixed {
    $dico = dictionnaire_libre($db);
    if (!$dico) return $valeur;

    if (is_string($valeur)) {
        $h = sha1(trim($valeur));
        return $dico[$h] ?? $valeur;
    }
    if (is_array($valeur)) {
        foreach ($valeur as $k => $v) $valeur[$k] = traduire_libre($db, $v);
    }
    return $valeur;
}

/**
 * Champs JSON dont le CONTENU est du texte libre traduisible.
 *
 * Volontairement absents : tabacaleras, regions, varieties, top_brands
 * et marques_officielles — noms propres et toponymes, qui ne se
 * traduisent pas.
 */
function champs_libres(string $table): array {
    return [
        'producer_countries' => ['brands'],
        'habanos_presence'   => ['factories', 'certifications', 'distributeurs'],
    ][$table] ?? [];
}

/**
 * Colonnes SCALAIRES traduites par le dictionnaire plutot que par une
 * colonne « champ_en ». Ces valeurs sont rares et formulaires (« La
 * Havane, Cuba ») : le dictionnaire, indexe sur le texte source, evite
 * d'ajouter cinq colonnes par champ.
 */
function champs_libres_scalaires(string $table): array {
    return [
        'habanos_presence' => ['founded', 'hq'],
    ][$table] ?? [];
}

/** Raccourci : traduit une ligne selon la table dont elle provient. */
function traduire_table(array $ligne, string $table, ?PDO $db = null): array {
    $ligne = traduire($ligne, champs_traduits($table));
    if ($db) {
        $libres = array_merge(champs_libres($table), champs_libres_scalaires($table));
        foreach ($libres as $champ) {
            if (isset($ligne[$champ])) $ligne[$champ] = traduire_libre($db, $ligne[$champ]);
        }
    }
    return $ligne;
}

/** Colonnes enrichies communes aux deux endpoints. */
function lounge_extra_cols(): string {
    // lat/lon (migration 012) : NULL sur la quasi-totalite des fiches
    // aujourd'hui. Le front n'affiche la distance que lorsqu'elles
    // existent — jamais d'approximation par le pays.
    return ', hours, maps_url, website, instagram, lat, lon'
         . ', ROUND(COALESCE(rating, 0), 1) AS rating, COALESCE(rating_count, 0) AS rating_count';
}

// ── Tous les lounges groupés par pays (pour l'Explorer) ──
function action_lounges_all(PDO $db): void {
    $desc_col_all = lounge_desc_col();
    $extra        = lounge_extra_cols();

    // ── Requête principale ───────────────────────────────
    $order = "COALESCE(rating, 0) DESC, name ASC";
    $stmt  = $db->query(
        "SELECT country_id, id, name, city, type, phone, price,
                " . $desc_col_all . ", source" . $extra . "
         FROM lounges
         WHERE is_verified = 1
         ORDER BY country_id, " . $order
    );
    $rows = $stmt->fetchAll();

    $grouped = [];
    foreach ($rows as $r) {
        $cid = $r['country_id']; unset($r['country_id']);
        $r['id']           = (int)$r['id'];
        $r['rating']       = $r['rating'] ? (float)$r['rating'] : null;
        $r['rating_count'] = (int)($r['rating_count'] ?? 0);
        $grouped[$cid][] = $r;
    }

    // ── Contributions communautaires (optionnel) ─────────
    try {
        // Les contributions communautaires n'ont pas ces champs enrichis :
        // on les aligne à NULL pour obtenir la même forme que les fiches vérifiées.
        $comm_extra = ', NULL AS hours, NULL AS maps_url, NULL AS website, NULL AS instagram';
        $comm = $db->query(
            "SELECT country_id, name, city, type, phone,
                    '' AS price, description AS `desc`, source_url AS source" . $comm_extra . ",
                    NULL AS rating, 0 AS rating_count
             FROM approved_lounges
             WHERE status = 'approved'
             ORDER BY country_id, approved_at DESC"
        );
        foreach ($comm->fetchAll() as $r) {
            $cid = $r['country_id']; unset($r['country_id']);
            $r['id'] = null;
            $grouped[$cid][] = $r;
        }
    } catch (Throwable $e) {
        // Table approved_lounges absente ou colonnes manquantes — ignorer
    }

    header('Cache-Control: public, max-age=120');
    jout(['lounges' => $grouped, 'total' => count($rows)]);
}

// ── Globe : données légères pour l'affichage initial ────
//
// $rendre = true : renvoie le tableau au lieu de l'émettre. C'est
// « action=all » qui en a besoin, pour y ajouter les marques.
// Il capturait auparavant la sortie par ob_start() — mais jout()
// termine le script (exit), si bien que la capture ne rendait jamais la
// main : `action=all` répondait le globe seul, et le bloc qui ajoutait
// `brands` et `habanos` n'était jamais atteint. Silencieux, puisque la
// réponse restait un JSON valide.
function action_globe(PDO $db, bool $rendre = false): ?array {
    // Pays producteurs (sans notes longues, sans brands détail)
    $countries = $db->query(
        // SELECT * et non une liste figee : traduire_table() a besoin des
        // colonnes de langue, qu'une enumeration explicite laissait de
        // cote — la reponse revenait alors toujours en francais.
        "SELECT * FROM producer_countries ORDER BY name"
    )->fetchAll();
    $json_c = ['tabacaleras','regions','varieties','brands'];
    $countries = array_map(
        fn($r) => traduire_table(row_parse($r, $json_c), 'producer_countries', $db),
        $countries
    );

    // Zones de production (toutes)
    $zones_raw = $db->query("SELECT * FROM production_zones")->fetchAll();
    $zones = [];
    foreach ($zones_raw as $z) {
        $cid = $z['country_id']; unset($z['country_id']);
        $zones[$cid][] = traduire_table($z, 'production_zones');
    }

    // Les contours des pays producteurs proviennent desormais de la carte
    // du monde (assets/data/countries-110m.json), deja chargee par le front :
    // frontieres exactes, et plus de polygones a maintenir en base.
    // La table country_polygons n'est donc plus interrogee.

    // Marchés
    $markets = $db->query(
        "SELECT *, rank_num AS `rank` FROM markets ORDER BY rank_num"
    )->fetchAll();
    $markets = array_map(
        fn($r) => traduire_table(row_parse($r, ['top_brands']), 'markets'),
        $markets
    );
    // rename top_brands → topBrands for JS compat
    $markets = array_map(function($m) {
        $m['topBrands'] = $m['top_brands']; unset($m['top_brands']);
        $m['rank'] = (int)$m['rank'];
        return $m;
    }, $markets);

    // Pays lounges (triangles violets)
    $lounge_countries = $db->query(
        "SELECT id,name,flag,lat,lon,color FROM lounge_countries ORDER BY name"
    )->fetchAll();

    // Geo info (pour le panel lexique)
    $geo_raw = $db->query("SELECT * FROM producer_geo")->fetchAll();
    $geo = [];
    foreach ($geo_raw as $g) {
        $cid = $g['country_id']; unset($g['country_id']);
        // rename to match JS keys
        $geo[$cid] = [
            'capital'     => $g['capital'],
            'pop'         => $g['population'],
            'area'        => $g['area'],
            'currency'    => $g['currency'],
            'language'    => $g['language'],
            'timezone'    => $g['timezone'],
            'gdp'         => $g['gdp'],
            'independent' => $g['independent'],
        ];
    }

    $payload = [
        'countries'        => $countries,
        'zones'            => $zones,
        'markets'          => $markets,
        'lounge_countries' => $lounge_countries,
        'geo'              => $geo,
    ];
    if ($rendre) return $payload;
    jout($payload);
    return null;
}

// ── Country : détail complet d'un pays producteur ────────
function action_country(PDO $db): void {
    $id = trim($_GET['id'] ?? '');
    if (!$id) { http_response_code(400); jout(err('id_required', 'id requis')); }

    $c = $db->prepare("SELECT * FROM producer_countries WHERE id = ?");
    $c->execute([$id]);
    $country = $c->fetch();
    if (!$country) { http_response_code(404); jout(err('not_found_country', 'Pays introuvable')); }
    $country = traduire_table(row_parse($country, ['tabacaleras','regions','varieties','brands']), 'producer_countries', $db);

    $g = $db->prepare("SELECT * FROM producer_geo WHERE country_id = ?");
    $g->execute([$id]);
    $geo_row = $g->fetch() ?: [];
    $geo = $geo_row ? [
        'capital'=>$geo_row['capital'], 'pop'=>$geo_row['population'],
        'area'=>$geo_row['area'], 'currency'=>$geo_row['currency'],
        'language'=>$geo_row['language'],
        'timezone'=>$geo_row['timezone'], 'gdp'=>$geo_row['gdp'],
        'independent'=>$geo_row['independent'],
    ] : [];

    $z = $db->prepare("SELECT * FROM production_zones WHERE country_id = ? ORDER BY id");
    $z->execute([$id]);
    $zones = array_map(function ($x) { unset($x['country_id']); return traduire_table($x, 'production_zones'); },
                       $z->fetchAll());

    $h = $db->prepare("SELECT * FROM habanos_presence WHERE country_id = ?");
    $h->execute([$id]);
    $hab_row = $h->fetch();
    $habanos = null;
    if ($hab_row) {
        $habanos = traduire_table(row_parse($hab_row, ['factories','marques_officielles','distributeurs','certifications']), 'habanos_presence', $db);
        $habanos['present'] = (bool)$habanos['present'];
        unset($habanos['country_id']);
        // rename keys for JS compat
        $habanos['statusColor']         = $habanos['status_color'];
        $habanos['marques_officielles'] = $habanos['marques_officielles'];
        unset($habanos['status_color']);
    }

    // Les feuilles documentees de ce pays — juste id et nom. La fiche
    // en a besoin pour savoir QUELLES etiquettes de « Varietes » sont
    // cliquables : les autres restent de simples mots, et c'est voulu
    // tant que le contenu se remplit par lots.
    $lf = $db->prepare("SELECT id, name FROM feuilles WHERE country_id = ? ORDER BY name");
    $lf->execute([$id]);
    $feuilles = $lf->fetchAll(PDO::FETCH_ASSOC);

    jout([
        'country'  => $country,
        'geo'      => $geo,
        'zones'    => $zones,
        'habanos'  => $habanos,
        'feuilles' => $feuilles,
    ]);
}

// ── Lounges : établissements d'un pays ────────────────────
function action_lounges(PDO $db): void {
    $id = trim($_GET['id'] ?? '');
    if (!$id) { http_response_code(400); jout(err('id_required', 'id requis')); }

    $desc_col = lounge_desc_col();
    $extra    = lounge_extra_cols();


    $stmt = $db->prepare(
        "SELECT id, name, city, type, phone, price,
                {$desc_col}, source" . $extra . "
         FROM lounges
         WHERE country_id = ? AND is_verified = 1
         ORDER BY name ASC"
    );
    $stmt->execute([$id]);
    $static = array_map(function($r) {
        $r['id']           = (int)$r['id'];
        $r['rating']       = $r['rating'] ? (float)$r['rating'] : null;
        $r['rating_count'] = (int)($r['rating_count'] ?? 0);
        return $r;
    }, $stmt->fetchAll());

    // Plus de bloc « community » : depuis la migration 013, une
    // approbation cree une vraie ligne dans `lounges`, donc deja
    // presente ci-dessus. La requete precedente filtrait sur une colonne
    // `status` que `approved_lounges` n'a jamais eue ; l'erreur SQL etait
    // avalee par un catch pose pour tolerer l'absence de la table, et la
    // liste revenait vide EN SILENCE — les etablissements approuves
    // n'apparaissaient jamais sur le site.
    //
    // La cle `community` est conservee, vide : les deux chargeurs du
    // front font « (data.static||[]).concat(data.community||[]) », et un
    // navigateur servant encore l'ancien script ne doit pas trebucher.
    jout([
        'static'    => $static,
        'community' => [],
        'total'     => count($static),
    ]);
}
function action_brand(PDO $db): void {
    $name = trim($_GET['name'] ?? '');
    if (!$name) { http_response_code(400); jout(err('name_required_param', 'name requis')); }

    $stmt = $db->prepare("SELECT * FROM brands WHERE name = ?");
    $stmt->execute([$name]);
    $brand = $stmt->fetch();
    if (!$brand) { http_response_code(404); jout(err('not_found_brand', 'Marque introuvable')); }
    // Langue et nettoyage des colonnes multilingues : meme traitement que
    // pour les autres tables de l'atlas.
    $brand = traduire_table($brand, 'brands');
    // Colonnes legacy à nettoyer aussi
    foreach (['notes_en','notes_es','notes_de','notes_zh','notes_ar'] as $col) {
        unset($brand[$col]);
    }
    $brand = row_parse($brand, ['gamme','scores','celebrities','pairings','limited_eds']);
    // JS compat: country_id → country
    $brand['country'] = $brand['country_id'];
    unset($brand['country_id']);

    jout(['brand' => $brand]);
}

/**
 * Detail d'une feuille — le pendant de action_brand pour les pays qui
 * vendent du tabac et non des cigares.
 *
 * La liste des cigares qui la portent N'EST PAS stockee : elle se
 * derive des entrees `cape: true` de la fiche du pays, qui existent
 * depuis la migration 023. Stocker ce qu'on peut deriver, c'est offrir
 * une occasion de diverger — le lot 2 a supprime `producer_geo.coords`
 * pour exactement cette raison.
 */
function action_feuille(PDO $db): void {
    $id = trim($_GET['id'] ?? '');
    if (!$id) { http_response_code(400); jout(err('id_required_param', 'id requis')); }

    $stmt = $db->prepare("SELECT * FROM feuilles WHERE id = ?");
    $stmt->execute([$id]);
    $f = $stmt->fetch();
    if (!$f) { http_response_code(404); jout(err('not_found_leaf', 'Feuille introuvable')); }

    $f = traduire_table($f, 'feuilles');
    $f = row_parse($f, ['notes', 'pairings']);

    $q = $db->prepare("SELECT brands FROM producer_countries WHERE id = ?");
    $q->execute([$f['country_id']]);
    $portees = [];
    foreach (json_decode((string)$q->fetchColumn(), true) ?: [] as $b) {
        if (!empty($b['cape']) && !empty($b['name'])) $portees[] = $b['name'];
    }
    $f['cigares'] = $portees;

    jout(['feuille' => $f]);
}

// ── Market : détail d'un marché ──────────────────────────
function action_market(PDO $db): void {
    $id = trim($_GET['id'] ?? '');
    if (!$id) { http_response_code(400); jout(err('id_required', 'id requis')); }

    $stmt = $db->prepare("SELECT * FROM markets WHERE id = ?");
    $stmt->execute([$id]);
    $m = $stmt->fetch();
    if (!$m) { http_response_code(404); jout(err('not_found_market', 'Marché introuvable')); }
    $m = traduire_table(row_parse($m, ['top_brands']), 'markets');
    $m['topBrands'] = $m['top_brands']; unset($m['top_brands']);
    $m['rank'] = (int)$m['rank_num']; unset($m['rank_num']);

    jout(['market' => $m]);
}

// ── All : tout en un seul appel (fallback / preload) ─────
function action_all(PDO $db): void {
    // Le globe, puis les marques par-dessus.
    $globe = action_globe($db, true);

    $brands_raw = $db->query("SELECT name,country_id AS country,founded,history,gamme FROM brands")->fetchAll();
    $brands = [];
    foreach ($brands_raw as $b) {
        $b['gamme'] = parse_json_field($b['gamme']);
        $brands[$b['name']] = $b;
    }

    $habanos_raw = array_map(fn($h) => traduire_table($h, 'habanos_presence', $db),
                             $db->query("SELECT * FROM habanos_presence")->fetchAll());
    $habanos = [];
    foreach ($habanos_raw as $h) {
        $cid = $h['country_id']; unset($h['country_id']);
        $h = row_parse($h, ['factories','marques_officielles','distributeurs','certifications']);
        $h['present'] = (bool)$h['present'];
        $h['statusColor'] = $h['status_color']; unset($h['status_color']);
        $habanos[$cid] = $h;
    }

    echo json_encode(array_merge($globe, [
        'brands'  => $brands,
        'habanos' => $habanos,
    ]), JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK);
    exit;
}