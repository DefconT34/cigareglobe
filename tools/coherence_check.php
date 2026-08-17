<?php
// ════════════════════════════════════════════════════════
// tools/coherence_check.php — Le même fait, écrit à plusieurs endroits
// ────────────────────────────────────────────────────────
// C'est la panne centrale du lot R5, et elle a coûté sept corrections.
//
// Une correction ne suit pas la donnée : elle suit le CHAMP. Quand un
// même fait est écrit à trois endroits, le corriger une fois n'en
// corrige qu'un tiers, et les deux autres continuent de s'afficher sur
// la même page :
//
//   « Premier exportateur mondial en valeur » a été retiré de
//   rev_detail par la migration 028, faute de source. Il a survécu dans
//   notes jusqu'à la migration 031.
//
//   « Lombok » a été retiré des zones par la migration 030 — c'est du
//   Virginia pour cigarettes. Il est resté dans regions ET varieties.
//
//   « Jamastran Valley » a été francisé en zone, pas dans regions.
//
// Rien ne pouvait le voir : chaque champ était juste vis-à-vis de
// lui-même. Cet outil regarde ce qui doit concorder ENTRE les champs.
//
//   php tools/coherence_check.php
//
// Sortie 1 dès qu'une incohérence subsiste. Appelé par tests/run.php.
// ════════════════════════════════════════════════════════

if (PHP_SAPI !== 'cli') { http_response_code(404); exit; }

require_once __DIR__ . '/../backend/config.php';

$db = getDB();
$defauts = [];

// ── 1. La liste des régions doit suivre la carte ─────────
//
// `producer_countries.regions` nomme les régions de culture ;
// `production_zones` les pose sur le globe. Les deux décrivent la même
// chose et divergeaient sur neuf pays sur quinze.

/** Rend une chaîne comparable : sans accents, sans ponctuation, en bas de casse. */
function empreinte_nom(string $s): string {
    $s = (string)iconv('UTF-8', 'ASCII//TRANSLIT//IGNORE', $s);
    return (string)preg_replace('/[^a-z0-9]/', '', strtolower($s));
}

$zones = [];
foreach ($db->query('SELECT country_id, name FROM production_zones') as $z) {
    $zones[$z['country_id']][] = $z['name'];
}

foreach ($db->query('SELECT id, regions FROM producer_countries ORDER BY id') as $c) {
    $listees = json_decode((string)$c['regions'], true);
    if (!is_array($listees)) $listees = [];
    $posees  = $zones[$c['id']] ?? [];

    // Un pays sans zone posée n'est pas en faute : les trois pays de la
    // migration 027 assument des fiches incomplètes plutôt que
    // remplies au jugé.
    if (!$listees && !$posees) continue;

    $l = array_map('empreinte_nom', $listees);
    $p = array_map('empreinte_nom', $posees);

    foreach (array_diff($l, $p) as $i => $_) {
        $defauts[] = sprintf('%s : « %s » est listee dans regions mais n\'est posee sur aucune zone',
                             $c['id'], $listees[$i]);
    }
    foreach (array_diff($p, $l) as $i => $_) {
        $defauts[] = sprintf('%s : la zone « %s » n\'est pas listee dans regions',
                             $c['id'], $posees[$i]);
    }
}

// ── 2. Les rangs mondiaux que la relecture a bannis ──────
//
// R1, R4 et R5 ont retire tous les classements mondiaux non sources :
// personne ne publie de production mondiale de cigares, ni de
// classement d'exportateurs en valeur. La regle retenue est d'ecrire la
// REPUTATION, qui est vraie, plutot que le RANG, qui n'existe pas —
// « la terre a tabac la plus reputee au monde » et non « la meilleure
// terre a tabac du monde ».
//
// Ces tournures reviennent naturellement sous la plume. Sans garde-fou
// elles reviendront, et il faudra les rechercher a la main une
// quatrieme fois.
const TOURNURES_BANNIES = [
    '/\bmeilleur[es]?\b/iu'                         => 'superlatif de qualite — dire la reputation',
    '/\bpremi(?:er|ere)\s+(?:producteur|exportateur|fournisseur)\b/iu'
                                                    => 'rang mondial non publie',
    '/\b(?:1er|premier)\s+mondial\b/iu'             => 'rang mondial non publie',
    '/\ble\s+plus\s+(?:utilise|vendu|produit)\b/iu' => 'classement non mesure',
];

$aBalayer = [
    'producer_countries' => ['id',   ['notes', 'climate', 'soil', 'production', 'rev_detail']],
    'production_zones'   => ['id',   ['note']],
];

foreach ($aBalayer as $table => [$cle, $champs]) {
    $sel = implode(', ', array_map(fn($c) => "`$c`", array_merge([$cle], $champs)));
    foreach ($db->query("SELECT $sel FROM `$table`") as $r) {
        foreach ($champs as $champ) {
            $v = (string)($r[$champ] ?? '');
            if ($v === '') continue;
            // Comparer sans accents : « réputé » et « repute » doivent
            // se valoir, sans quoi le motif rate une valeur sur deux.
            $plat = (string)iconv('UTF-8', 'ASCII//TRANSLIT//IGNORE', $v);
            foreach (TOURNURES_BANNIES as $motif => $pourquoi) {
                if (preg_match($motif, $plat)) {
                    $defauts[] = sprintf('%s#%s.%s : « %s » — %s',
                                         $table, $r[$cle], $champ, $v, $pourquoi);
                }
            }
        }
    }
}

// ── Rapport ──────────────────────────────────────────────

echo "CigarOdyssey — coherence entre champs\n\n";

if (!$defauts) {
    echo "  Les listes de regions suivent les zones posees sur le globe.\n";
    echo "  Aucun rang mondial non source n'est reapparu.\n";
    exit(0);
}

foreach ($defauts as $d) echo "  ECHEC  $d\n";
printf("\n%d incoherence(s). Voir docs/relecture.md, lot 5.\n", count($defauts));
exit(1);
