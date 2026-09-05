<?php
// ════════════════════════════════════════════════════════
// pages_lib.php — Les adresses du contenu, et ce qu'on y sert
// ────────────────────────────────────────────────────────
// LE CONSTAT QUI A OUVERT CE CHANTIER. Le plan de site annonçait seize
// adresses : six pages d'accueil et dix fils de discussion. Cinq cents
// établissements, cent dix-huit maisons et cent huit pays n'y étaient
// pas. Le HTML brut de la page d'accueil — ce que lit un robot qui
// n'exécute pas JavaScript — contenait UN SEUL lien, et le seul <h1> du
// site était « Avez-vous 18 ans ou plus ? ».
//
// Autrement dit : tout le contenu était inatteignable pour qui ne
// connaissait pas déjà l'adresse du site.
//
// POURQUOI DE VRAIES PAGES ET NON DU RENDU DANS LA COQUILLE. On pouvait
// injecter le texte dans index.html et laisser l'application le
// recouvrir. Deux raisons de ne pas le faire : un texte que le
// JavaScript efface au démarrage disparaît du DOM que Google indexe, et
// un texte qu'on laisse sous un calque plein écran est un texte caché.
// Une page servie par le serveur, lisible sans JavaScript, ne pose
// aucune de ces deux questions — et rend le site consultable sur une
// connexion qui ne charge pas 500 Ko de scripts.
//
// LES LIENS COMPTENT AUTANT QUE LES PAGES. Un plan de site fait
// connaître des adresses ; ce sont les liens qui leur donnent du poids
// et qui font revenir les robots. D'où l'atlas, qui relie tout en un
// saut, et les renvois croisés pays ↔ établissement ↔ maison.
// ════════════════════════════════════════════════════════

require_once __DIR__ . '/config.php';
require_once __DIR__ . '/langues.php';
defined('CARTE_INCLUDE') || define('CARTE_INCLUDE', true);
require_once __DIR__ . '/carte_lib.php';

/** Les segments d'adresse, en français : le site a une langue d'origine. */
const PAGE_SEGMENTS = ['pays' => 'pays', 'cave' => 'cave', 'marque' => 'marque'];

/**
 * Un nom propre réduit à une adresse.
 *
 * « Partagás » et « Por Larrañaga » doivent donner « partagas » et
 * « por-larranaga » : une adresse qui porte des accents se recopie mal,
 * se partage mal, et s'encode différemment selon le client. La
 * translittération est FAITE À LA MAIN plutôt que confiée à iconv :
 * celui-ci dépend de la locale du système, et rendait « ? » là où le
 * serveur de production n'avait pas la bonne.
 */
function page_slug(string $s): string {
    $s = strtr($s, [
        'à'=>'a','â'=>'a','ä'=>'a','á'=>'a','ã'=>'a','å'=>'a','ç'=>'c',
        'é'=>'e','è'=>'e','ê'=>'e','ë'=>'e','í'=>'i','ì'=>'i','î'=>'i','ï'=>'i',
        'ñ'=>'n','ó'=>'o','ò'=>'o','ô'=>'o','ö'=>'o','õ'=>'o','ø'=>'o',
        'ú'=>'u','ù'=>'u','û'=>'u','ü'=>'u','ý'=>'y','ÿ'=>'y','ß'=>'ss','æ'=>'ae','œ'=>'oe',
    ]);
    $s = mb_strtolower($s, 'UTF-8');
    $s = preg_replace('/[^a-z0-9]+/u', '-', $s);
    return trim((string)$s, '-');
}

/** Racine publique, sans barre finale. */
function page_racine(): string {
    if (defined('SITE_URL') && SITE_URL) return rtrim(SITE_URL, '/');
    $s = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') ? 'https' : 'http';
    return $s . '://' . ($_SERVER['HTTP_HOST'] ?? 'thecigarodyssey.com');
}

/** Le préfixe de langue : rien pour le français, /xx sinon. */
function page_prefixe(string $lang): string {
    return $lang === 'fr' ? '' : '/' . $lang;
}

/**
 * L'adresse canonique d'une page.
 *
 * Une seule fabrique, employée par les pages ET par le plan de site :
 * deux fabriques auraient fini par diverger d'une barre finale, et un
 * plan qui annonce une adresse que la page ne revendique pas fait
 * exactement le contraire de ce qu'on attend de lui.
 */
function page_url(string $type, string $slug, string $lang = 'fr'): string {
    $p = page_racine() . page_prefixe($lang);
    if ($type === 'atlas') return $p . '/atlas';
    if ($type === 'accueil') return $p . '/';
    return $p . '/' . PAGE_SEGMENTS[$type] . '/' . $slug;
}

/**
 * Colonne traduite, avec repli sur le français.
 *
 * Le nom est construit depuis la liste FERMÉE des langues connues,
 * jamais depuis l'entrée : aucune injection possible.
 */
function page_col(string $base, string $lang): string {
    if ($lang === 'fr' || !in_array($lang, langues_connues(), true)) return "`$base`";
    return "COALESCE(NULLIF(`{$base}_{$lang}`, ''), `$base`)";
}

/* ── Les pays ────────────────────────────────────────────
   Un pays producteur et un pays à établissements portent le MÊME
   identifiant quand ils sont le même pays (brazil, cameroon, usa…) :
   une seule page les réunit, sinon Cuba aurait deux adresses pour un
   seul pays, et chacune aurait la moitié du contenu. */

/**
 * `is_verified` VAUT AUSSI POUR LES PAGES SERVIES.
 *
 * L'application filtre dessus depuis toujours (voir data.php) ; ces
 * pages-ci ne le faisaient pas. Tant qu'aucune fiche n'était marquée
 * non vérifiée, la différence ne se voyait pas — mais elle aurait
 * publié, sur les pages que Google indexe, précisément ce que la
 * modération avait retiré de l'application. Un retrait qui ne retire
 * qu'à moitié est le pire des deux mondes : invisible à celui qui l'a
 * décidé, visible à tous les autres.
 */
const PAGE_FICHE_PUBLIABLE = 'is_verified = 1';

/** Tous les pays ayant une page, producteurs et pays à établissements. */
function page_pays_liste(PDO $db): array {
    $ok = PAGE_FICHE_PUBLIABLE;
    $q = $db->query(
        "SELECT c.id, c.name, c.flag, 1 AS producteur,
                (SELECT COUNT(*) FROM lounges l WHERE l.country_id = c.id AND l.$ok) AS caves
           FROM producer_countries c
         UNION
         SELECT lc.id, lc.name, lc.flag, 0 AS producteur,
                (SELECT COUNT(*) FROM lounges l WHERE l.country_id = lc.id AND l.$ok) AS caves
           FROM lounge_countries lc
          WHERE lc.id NOT IN (SELECT id FROM producer_countries)
         ORDER BY name"
    );
    return $q->fetchAll(PDO::FETCH_ASSOC);
}

/** Un pays et tout ce qui s'y rattache, dans la langue demandée. */
function page_pays(PDO $db, string $id, string $lang): ?array {
    $champs = [];
    foreach (['region','production','rev_detail','harvest','climate','soil','notes'] as $c) {
        $champs[] = page_col($c, $lang) . " AS `$c`";
    }
    $q = $db->prepare("SELECT id, name, flag, tier, revenue, tabacaleras, regions, varieties, "
                    . implode(', ', $champs) . " FROM producer_countries WHERE id = ? LIMIT 1");
    $q->execute([$id]);
    $pays = $q->fetch(PDO::FETCH_ASSOC) ?: null;

    if (!$pays) {
        $q = $db->prepare("SELECT id, name, flag, NULL tier FROM lounge_countries WHERE id = ? LIMIT 1");
        $q->execute([$id]);
        $pays = $q->fetch(PDO::FETCH_ASSOC) ?: null;
    }
    if (!$pays) return null;

    $q = $db->prepare("SELECT id, name, city, type, description AS desc_fr, "
                    . page_col('description', $lang) . " AS description
                       FROM lounges WHERE country_id = ? AND " . PAGE_FICHE_PUBLIABLE . "
                       ORDER BY city, name");
    $q->execute([$id]);
    $pays['caves'] = $q->fetchAll(PDO::FETCH_ASSOC);

    $q = $db->prepare("SELECT name, founded FROM brands WHERE country_id = ? ORDER BY name");
    $q->execute([$id]);
    $pays['marques'] = $q->fetchAll(PDO::FETCH_ASSOC);

    $q = $db->prepare("SELECT name, " . page_col('note', $lang) . " AS note
                       FROM production_zones WHERE country_id = ? ORDER BY name");
    $q->execute([$id]);
    $pays['zones'] = $q->fetchAll(PDO::FETCH_ASSOC);

    return $pays;
}

/* ── Les établissements ──────────────────────────────────── */

function page_cave(PDO $db, int $id, string $lang): ?array {
    // `maps_url` N'EST PLUS LUE : la migration 149 l'a vidée sur les 508
    // fiches, et le lien se construit au rendu (backend/carte_lib.php).
    // La sélectionner encore ne rapportait que NULL.
    //
    // `rating` / `rating_count` restent SÉLECTIONNÉES ET NON RENDUES, et
    // c'est délibéré : trois fiches sur 408 portent une note, toutes à
    // 5,0, chacune sur UN seul vote. Afficher « ★ 5,0 » sur ces trois-là
    // laisserait croire à un classement là où il n'y a qu'une voix. Le
    // jour où le nombre de votes le permettra, c'est ici que ça se rend.
    $q = $db->prepare("SELECT l.id, l.name, l.city, l.type, l.phone, l.price, l.hours,
                              l.website, l.instagram, l.lat, l.lon,
                              l.rating, l.rating_count, l.source,
                              " . page_col('description', $lang) . " AS description,
                              l.country_id, COALESCE(pc.name, lc.name) AS pays_nom,
                              COALESCE(pc.flag, lc.flag) AS pays_drapeau
                         FROM lounges l
                    LEFT JOIN lounge_countries   lc ON lc.id = l.country_id
                    LEFT JOIN producer_countries pc ON pc.id = l.country_id
                        WHERE l.id = ? AND l." . PAGE_FICHE_PUBLIABLE . " LIMIT 1");
    $q->execute([$id]);
    return $q->fetch(PDO::FETCH_ASSOC) ?: null;
}

/* ── Les maisons ─────────────────────────────────────────
   `brands` n'a pas d'identifiant : sa clé est le NOM. L'adresse porte
   donc un slug, qu'on compare en PHP sur les cent dix-huit noms plutôt
   que d'ajouter une colonne — et surtout plutôt que de fabriquer le
   slug en SQL, où la translittération dépendrait de la collation. */

function page_marque(PDO $db, string $slug, string $lang): ?array {
    foreach ($db->query("SELECT name FROM brands")->fetchAll(PDO::FETCH_COLUMN) as $nom) {
        if (page_slug($nom) !== $slug) continue;
        // `limited_eds` n'a pas de colonnes traduites : c'est une liste
        // de noms propres d'éditions, qui ne se traduisent pas.
        $q = $db->prepare("SELECT b.name, b.founded, b.factory, b.country_id, b.limited_eds,
                                  " . page_col('history', $lang) . "     AS history,
                                  " . page_col('gamme', $lang) . "       AS gamme,
                                  " . page_col('pairings', $lang) . "    AS pairings,
                                  " . page_col('celebrities', $lang) . " AS celebrities,
                                  COALESCE(pc.name, lc.name) AS pays_nom
                             FROM brands b
                        LEFT JOIN producer_countries pc ON pc.id = b.country_id
                        LEFT JOIN lounge_countries   lc ON lc.id = b.country_id
                            WHERE b.name = ? LIMIT 1");
        $q->execute([$nom]);
        return $q->fetch(PDO::FETCH_ASSOC) ?: null;
    }
    return null;
}

function page_marques_liste(PDO $db): array {
    return $db->query("SELECT name, country_id, founded FROM brands ORDER BY name")
              ->fetchAll(PDO::FETCH_ASSOC);
}

/**
 * L'inventaire complet des adresses, pour le plan de site.
 *
 * Une seule requête par famille : le plan est demandé par des robots,
 * parfois plusieurs fois par jour, et cinq cents requêtes unitaires
 * l'auraient rendu coûteux à servir.
 */
function page_inventaire(PDO $db): array {
    $out = ['pays' => [], 'cave' => [], 'marque' => []];
    foreach (page_pays_liste($db) as $p) {
        $out['pays'][] = ['slug' => $p['id'], 'maj' => null];
    }
    foreach ($db->query("SELECT id, name, updated_at FROM lounges
                          WHERE " . PAGE_FICHE_PUBLIABLE . " ORDER BY id")
                ->fetchAll(PDO::FETCH_ASSOC) as $l) {
        $out['cave'][] = ['slug' => $l['id'] . '-' . page_slug($l['name']), 'maj' => $l['updated_at']];
    }
    foreach ($db->query("SELECT name, updated_at FROM brands ORDER BY name")
                ->fetchAll(PDO::FETCH_ASSOC) as $b) {
        $out['marque'][] = ['slug' => page_slug($b['name']), 'maj' => $b['updated_at']];
    }
    return $out;
}

/**
 * L'adresse d'un fichier statique, avec sa date de modification.
 *
 * Le `.htaccess` demande aux navigateurs de garder les JS et CSS UNE
 * SEMAINE. Sans « ?v= », un correctif de mise en page n'atteindrait pas
 * avant sept jours un visiteur déjà venu — et ce n'est pas une
 * supposition : la première correction de page.css n'a rien changé à
 * l'écran tant que ce paramètre a manqué. index.php fait de même pour
 * la coquille de l'application ; ici, pour les pages servies.
 */
function page_actif(string $relatif): string {
    $chemin = dirname(__DIR__) . '/' . ltrim($relatif, '/');
    $v = is_file($chemin) ? '?v=' . dechex(filemtime($chemin)) : '';
    return '/' . ltrim($relatif, '/') . $v;
}

/**
 * Le texte d'une description, coupé sur une fin de phrase.
 *
 * Repris d'index.php, où il servait déjà aux cartes de partage. Une
 * description meta tronquée au milieu d'un mot est ce que Google
 * affiche tel quel dans ses résultats.
 */
function page_extrait(string $brut, int $max = 160): string {
    $t = trim(preg_replace('/\s+/u', ' ', strip_tags($brut)));
    if (mb_strlen($t) <= $max) return $t;
    $court = mb_substr($t, 0, $max);
    $coupe = mb_strrpos($court, '. ');
    return ($coupe !== false && $coupe > $max / 2.5)
        ? mb_substr($court, 0, $coupe + 1)
        : rtrim($court, " \t\n\r\0\x0B,;:—-") . '…';
}
