<?php
// ════════════════════════════════════════════════════════
// completude_lib.php — Ce qui manque à une fiche, et combien
// ────────────────────────────────────────────────────────
// LE CONSTAT. Cinq cents établissements, et sur les cinq cents :
//
//   horaires      0        « c'est ouvert ? » — sans réponse
//   site web      0
//   Instagram     0        (5 adresses traînent dans les descriptions)
//   coordonnées   0        donc ni distance, ni « autour de moi »
//   description   95 caractères de médiane ; 318 fiches sous 120
//
// L'application SAIT DÉJÀ afficher tout cela : horaires, site, Instagram,
// distance, itinéraire (voir la carte d'établissement dans app.js). Le
// rendu attend les données, pas l'inverse. Ce qui manque n'est donc pas
// du code d'affichage — c'est de la saisie, et de quoi la piloter.
//
// CE FICHIER NE DEVINE RIEN. On a cherché : les 419 `maps_url` sont des
// liens de RECHERCHE Google fabriqués depuis le nom et la ville, sans
// aucune coordonnée dedans ; les descriptions ne portent que cinq
// comptes Instagram et quatre horaires. Il n'y avait rien à extraire.
// Un score se calcule, il ne s'invente pas — et une donnée absente le
// reste jusqu'à ce qu'un humain la relève.
//
// POURQUOI UNE SEULE DÉFINITION. Le tableau de bord, l'outil en ligne de
// commande et la campagne lisent tous les trois ce fichier. Trois barèmes
// auraient fini par diverger, et « 62 % » n'aurait plus voulu dire la
// même chose selon l'écran qui l'affiche.
// ════════════════════════════════════════════════════════

require_once __DIR__ . '/config.php';

/**
 * Le barème.
 *
 * Les poids ne sont pas décoratifs : ils disent l'ordre dans lequel
 * remplir. Ils suivent les questions qu'un visiteur se pose, dans
 * l'ordre où il se les pose — d'abord « c'est ouvert ? », ensuite « où
 * exactement ? », et seulement après « à quoi ça ressemble ».
 *
 * Le téléphone pèse peu parce qu'il est déjà là sur 465 fiches : lui
 * donner du poids aurait gonflé le score sans rien apprendre.
 */
const COMPLETUDE_BAREME = [
    'hours'       => 25,   // la première question posée à un annuaire de lieux
    'coords'      => 20,   // débloque distance et « autour de moi »
    'description' => 20,   // au moins 200 caractères — voir plus bas
    'photo'       => 15,   // un lieu sans image ne se choisit pas
    'website'     => 15,
    'phone'       => 5,
];

/** En deçà, une description ne renseigne pas : elle occupe la place. */
const COMPLETUDE_DESC_MIN = 200;

/**
 * Ce qui manque à une fiche, et son score sur cent.
 *
 * `$fiche` porte les colonnes de `lounges`, plus `photos_reelles` (le
 * nombre de photos qui ne sont pas des remplaçantes). L'appelant les
 * fournit ; cette fonction ne touche pas la base, ce qui la rend
 * éprouvable sur des cas construits.
 */
function completude_fiche(array $fiche): array {
    $a = [];
    $a['hours']       = trim((string)($fiche['hours']   ?? '')) !== '';
    $a['website']     = trim((string)($fiche['website'] ?? '')) !== '';
    $a['phone']       = trim((string)($fiche['phone']   ?? '')) !== '';
    // Les DEUX coordonnées, ou aucune : une latitude seule ne place rien
    // sur une carte, et compter une demi-position pour un demi-point
    // ferait passer pour à moitié faite une fiche inutilisable.
    $a['coords']      = ($fiche['lat'] ?? null) !== null && ($fiche['lon'] ?? null) !== null
                     && $fiche['lat'] !== '' && $fiche['lon'] !== '';
    $a['description'] = mb_strlen(trim((string)($fiche['description'] ?? ''))) >= COMPLETUDE_DESC_MIN;
    $a['photo']       = (int)($fiche['photos_reelles'] ?? 0) > 0;

    $score = 0; $manque = [];
    foreach (COMPLETUDE_BAREME as $champ => $poids) {
        if ($a[$champ]) $score += $poids; else $manque[] = $champ;
    }
    return ['score' => $score, 'manque' => $manque, 'acquis' => $a];
}

/** Le libellé humain d'un champ manquant. */
const COMPLETUDE_NOMS = [
    'hours'       => 'horaires',
    'coords'      => 'coordonnées',
    'description' => 'description courte',
    'photo'       => 'photo réelle',
    'website'     => 'site web',
    'phone'       => 'téléphone',
];

/**
 * Les fiches, avec leur score.
 *
 * UNE SEULE REQUÊTE, et le compte de photos réelles en sous-requête :
 * cinq cents requêtes unitaires auraient rendu le tableau de bord
 * inutilisable. Le repère d'une photo de remplacement est son nom de
 * fichier — c'est la convention posée quand elles ont été versées.
 */
function completude_fiches(PDO $db, ?string $pays = null): array {
    $sql = "SELECT l.id, l.name, l.city, l.country_id, l.hours, l.website,
                   l.instagram, l.phone, l.lat, l.lon, l.description,
                   (SELECT COUNT(*) FROM lounge_photos p
                     WHERE p.lounge_id = l.id AND p.filename NOT LIKE 'placeholder%%') AS photos_reelles
              FROM lounges l";
    $args = [];
    if ($pays !== null) { $sql .= " WHERE l.country_id = ?"; $args[] = $pays; }
    $sql .= " ORDER BY l.country_id, l.name";

    $q = $db->prepare(str_replace('%%', '%', $sql));
    $q->execute($args);
    $out = [];
    foreach ($q->fetchAll(PDO::FETCH_ASSOC) as $l) {
        $out[] = $l + completude_fiche($l);
    }
    return $out;
}

/** L'état par pays : combien d'adresses, quel score moyen. */
function completude_par_pays(PDO $db): array {
    $par = [];
    foreach (completude_fiches($db) as $f) {
        $c = $f['country_id'];
        $par[$c] ??= ['pays' => $c, 'n' => 0, 'total' => 0, 'completes' => 0];
        $par[$c]['n']++;
        $par[$c]['total'] += $f['score'];
        if ($f['score'] === 100) $par[$c]['completes']++;
    }
    foreach ($par as &$p) $p['moyenne'] = (int)round($p['total'] / max(1, $p['n']));
    unset($p);
    // Par NOMBRE D'ADRESSES décroissant, et non par score croissant.
    // C'est le choix de fond de ce chantier : une page de pays qui porte
    // vingt-quatre fiches complètes vaut mieux que vingt-quatre pays
    // portant chacun une fiche complète. On approfondit un pays entier
    // avant de passer au suivant.
    uasort($par, fn($a, $b) => $b['n'] <=> $a['n']);
    return $par;
}

/**
 * Le plan de travail : les pays à faire d'abord, jusqu'à N adresses.
 *
 * On s'arrête au premier pays qui fait dépasser le quota — sans le
 * couper. Faire dix-huit fiches sur vingt-quatre laisse une page à
 * moitié faite, ce qui est le résultat qu'on cherche justement à éviter.
 */
function completude_plan(PDO $db, int $quota = 50): array {
    $plan = []; $cumul = 0;
    foreach (completude_par_pays($db) as $p) {
        if ($cumul >= $quota) break;
        if ($p['moyenne'] === 100) continue;     // rien à y faire
        $plan[] = $p;
        $cumul += $p['n'];
    }
    return ['pays' => $plan, 'adresses' => $cumul];
}

/** Le score du corpus entier, sur cent. */
function completude_globale(PDO $db): array {
    $f = completude_fiches($db);
    if (!$f) return ['n' => 0, 'moyenne' => 0, 'completes' => 0, 'champs' => []];
    $champs = [];
    foreach (array_keys(COMPLETUDE_BAREME) as $c) {
        $champs[$c] = count(array_filter($f, fn($x) => $x['acquis'][$c]));
    }
    return [
        'n'         => count($f),
        'moyenne'   => (int)round(array_sum(array_column($f, 'score')) / count($f)),
        'completes' => count(array_filter($f, fn($x) => $x['score'] === 100)),
        'champs'    => $champs,
    ];
}

/**
 * Une coordonnée est-elle plausible ?
 *
 * Le zéro exact est REFUSÉ : c'est la valeur que rend un champ vide mal
 * converti, et le point (0, 0) est au milieu du golfe de Guinée. Une
 * fiche qui s'y retrouverait passerait pour située alors qu'elle ne
 * l'est pas — pire qu'une fiche sans coordonnées, qui se voit.
 */
function completude_coord_valide(?string $lat, ?string $lon): bool {
    if ($lat === null || $lon === null || trim($lat) === '' || trim($lon) === '') return false;
    if (!is_numeric($lat) || !is_numeric($lon)) return false;
    $la = (float)$lat; $lo = (float)$lon;
    if ($la < -90 || $la > 90 || $lo < -180 || $lo > 180) return false;
    return !(abs($la) < 0.0001 && abs($lo) < 0.0001);
}
