<?php
// ════════════════════════════════════════════════════════
// tools/i18n_json.php — Integrite des colonnes JSON traduites
// ────────────────────────────────────────────────────────
// `brands.gamme` n'est pas du texte : c'est un tableau JSON dont seul
// « story » se traduit. « name » et « color » sont des donnees de
// structure, et « color » un code hexadecimal qui doit etre reporte tel
// quel. Les compteurs d'avancement ne voient rien de tout cela : ils ne
// savent dire que plein ou vide.
//
// C'est ainsi que 55 valeurs valant « [] » — un tableau JSON vide — ont
// compte pour traduites pendant des mois. Elles n'etaient pas vides au
// sens de la colonne, donc l'export les ignorait ; mais traduire()
// preferant toute valeur non vide au francais, la section « gamme » de
// onze marques s'affichait VIDE dans les six langues sauf le francais.
//
//   php tools/i18n_json.php        # code de sortie 1 si anomalie
//
// Les libelles traduits ne sont PAS des anomalies : trois d'entre eux
// sont eux-memes traduits dans la source (« No.4 — Le Classique »), et
// « Serie D » s'ecrit sans accent hors du francais. Ils sont listes a
// part, pour relecture.
// ════════════════════════════════════════════════════════

if (PHP_SAPI !== 'cli') { http_response_code(404); exit; }

require_once __DIR__ . '/../backend/config.php';
require_once __DIR__ . '/i18n_contenu_plan.php';

/** Colonnes JSON de `brands`, par table. */
function champs_json(): array {
    return ['brands' => ['gamme']];
}

$db = getDB();
$vues = 0; $pb = []; $info = [];

foreach (champs_json() as $table => $champs) {
    foreach ($champs as $champ) {
        $cols = implode(', ', array_map(fn($l) => "`{$champ}_{$l}`", LANGUES_CIBLES));
        $q = $db->query("SELECT name, `$champ`, $cols FROM `$table`
                         WHERE `$champ` IS NOT NULL AND `$champ` <> ''");
        foreach ($q as $r) {
            $src = json_decode($r[$champ], true);
            if (!is_array($src)) { $pb[] = "{$r['name']} : source $champ illisible"; continue; }

            foreach (LANGUES_CIBLES as $l) {
                $v = (string)($r[$champ . '_' . $l] ?? '');
                if ($v === '') continue;
                $vues++;

                $a = json_decode($v, true);
                if (!is_array($a)) { $pb[] = "{$r['name']} / {$champ}_{$l} : JSON invalide"; continue; }
                if (count($a) !== count($src)) {
                    $pb[] = sprintf('%s / %s_%s : %d element(s) pour %d',
                                    $r['name'], $champ, $l, count($a), count($src));
                    continue;
                }
                foreach ($src as $k => $it) {
                    if (array_key_exists('color', $it) && ($a[$k]['color'] ?? null) !== $it['color']) {
                        $pb[] = sprintf('%s / %s_%s [%d] : color « %s » ≠ « %s »',
                                        $r['name'], $champ, $l, $k, $a[$k]['color'] ?? '∅', $it['color']);
                    }
                    if (array_key_exists('story', $it) && ($a[$k]['story'] ?? '') === '') {
                        $pb[] = sprintf('%s / %s_%s [%d] : story absente', $r['name'], $champ, $l, $k);
                    }
                    if (!array_key_exists('name', $it)) continue;
                    if (($a[$k]['name'] ?? '') === '') {
                        $pb[] = sprintf('%s / %s_%s [%d] : name absent', $r['name'], $champ, $l, $k);
                    } elseif ($a[$k]['name'] !== $it['name']) {
                        $info[] = sprintf('%s / %s_%s [%d] : « %s » (fr : « %s »)',
                                          $r['name'], $champ, $l, $k, $a[$k]['name'], $it['name']);
                    }
                }
            }
        }
    }
}

printf("%d valeur(s) JSON examinee(s), %d anomalie(s), %d libelle(s) traduit(s).\n",
       $vues, count($pb), count($info));
foreach ($pb as $p)   echo "  - $p\n";
foreach ($info as $p) echo "  . $p\n";
exit($pb ? 1 : 0);
