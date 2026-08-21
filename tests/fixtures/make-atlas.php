<?php
// ════════════════════════════════════════════════════════
// tests/fixtures/make-atlas.php — Genere tests/fixtures/atlas.sql
// ────────────────────────────────────────────────────────
// Les tests de bout en bout ont besoin d'un atlas peuple : sans pays ni
// marches, data.php renvoie des tableaux vides et le globe s'affiche
// nu. On exporte donc les tables de reference (petites et stables) plus
// un echantillon d'etablissements, dans un fichier versionne que la
// base de test recharge a chaque lancement — y compris en integration
// continue, ou la base applicative n'existe pas.
//
//   php tests/fixtures/make-atlas.php
//
// A relancer apres toute evolution du schema ou des donnees de
// reference (cf. sql/README.md, meme discipline que schema.sql).
// ════════════════════════════════════════════════════════

if (PHP_SAPI !== 'cli') { http_response_code(404); exit; }

require_once __DIR__ . '/../../backend/config.php';

// Tables exportees integralement : donnees de reference de l'atlas,
// petites et stables. `brands` en est exclue — ses historiques et
// gammes multilingues pesent 718 Ko a elles seules, sans rien apporter
// de plus aux tests qu'une poignee de marques.
// Cette liste est FIGEE : une table ajoutee au schema n'y entre pas
// toute seule. `feuilles` a bien ete creee dans la base de test — le
// schema versionne la porte — mais elle y est restee VIDE, et les tests
// de la fiche feuille rendaient 404 sans que rien n'explique pourquoi.
// Une table vide ne ressemble pas a une table manquante.
$completes = [
    'producer_countries', 'producer_geo', 'production_zones',
    'markets', 'lounge_countries', 'habanos_presence', 'feuilles',
];
// Etablissements : un echantillon suffit a exercer panneaux et Explorer.
$echantillon = 40;
// Marques : celles que la fiche Cuba met en avant, cible du test de
// la modale de marque.
$marques = 6;

$db  = getDB();
$out = "-- Genere par tests/fixtures/make-atlas.php — NE PAS EDITER A LA MAIN\n"
     . "-- Donnees de reference de l'atlas + echantillon d'etablissements,\n"
     . "-- rechargees dans la base de test avant les tests de bout en bout.\n\n"
     . "SET FOREIGN_KEY_CHECKS = 0;\n\n";

function insertions(PDO $db, string $table, string $sql, array $args = []): string {
    $stmt = $db->prepare($sql);
    $stmt->execute($args);
    $lignes = $stmt->fetchAll(PDO::FETCH_ASSOC);
    if (!$lignes) return "-- $table : aucune ligne\n\n";

    $cols = array_keys($lignes[0]);
    $txt  = "-- $table (" . count($lignes) . " lignes)\n"
          . 'INSERT INTO `' . $table . '` (`' . implode('`, `', $cols) . "`) VALUES\n";
    $vals = [];
    foreach ($lignes as $l) {
        $v = array_map(function ($x) use ($db) {
            return $x === null ? 'NULL' : $db->quote((string)$x);
        }, array_values($l));
        $vals[] = '  (' . implode(', ', $v) . ')';
    }
    return $txt . implode(",\n", $vals) . ";\n\n";
}

foreach ($completes as $t) {
    $out .= insertions($db, $t, "SELECT * FROM `$t`");
}

// `brands` a pour cle primaire son nom, pas un identifiant numerique.
// Les quatre marques emblematiques affichees en cartes sur la fiche
// Cuba : ce sont elles que le test de la modale de marque ouvre.
$out .= insertions($db, 'brands',
    "SELECT * FROM brands WHERE name IN (?, ?, ?, ?) ORDER BY name",
    ['Cohiba', 'Montecristo', 'Partagás', 'Romeo y Julieta']);

// Etablissements publies, repartis sur les pays les mieux garnis, puis
// tries par identifiant pour que le fichier reste stable d'un export a
// l'autre.
$out .= insertions($db, 'lounges',
    "SELECT * FROM lounges
      WHERE id IN (SELECT id FROM (
            SELECT id FROM lounges WHERE is_verified = 1 ORDER BY country_id, id LIMIT $echantillon
      ) AS t)
      ORDER BY id");

$out .= "SET FOREIGN_KEY_CHECKS = 1;\n";

$cible = __DIR__ . '/atlas.sql';
file_put_contents($cible, $out);
printf("%s ecrit (%.1f Ko)\n", $cible, strlen($out) / 1024);
