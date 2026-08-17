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

// ── 3. Le repli de la base contre ce que l'ecran affiche ─
//
// Devise et fuseau sont ecrits DEUX FOIS : dans `producer_geo`, qui ne
// sert que de repli, et dans `data.pays.js`, qui est ce que le visiteur
// voit. Rien ne les reliait.
//
// C'est ainsi que les Canaries ont affiche l'heure de Madrid : la table
// du front est indexee par code ISO, ce code est deduit du DRAPEAU, et
// l'archipel arbore celui de l'Espagne. Il heritait donc de
// Europe/Madrid — une heure de trop toute l'annee. La base, elle,
// disait « UTC+0 », c'est-a-dire juste. Le repli avait raison et
// l'ecran avait tort, et personne ne pouvait le voir sans comparer les
// deux copies.

/** Lit PAYS_INFOS et TERRITOIRES_INFOS depuis le fichier du front. */
function tables_du_front(string $chemin): array {
    $js = (string)@file_get_contents($chemin);
    $out = ['pays' => [], 'territoires' => []];
    // ISO: ['XXX', 'aa,bb', 'Zone/IANA']
    if (preg_match_all('/^\s{2}([A-Z]{2}):\s*\[\'([A-Z]{3})\',\s*\'([a-z,]+)\',\s*\'([^\']+)\'\]/m',
                       $js, $m, PREG_SET_ORDER)) {
        foreach ($m as $x) $out['pays'][$x[1]] = [$x[2], $x[3], $x[4]];
    }
    if (preg_match_all('/^\s{2}([a-z]+):\s*\[\'([A-Z]{3})\',\s*\'([a-z,]+)\',\s*\'([^\']+)\'\]/m',
                       $js, $m, PREG_SET_ORDER)) {
        foreach ($m as $x) $out['territoires'][$x[1]] = [$x[2], $x[3], $x[4]];
    }
    return $out;
}

/**
 * Decalage STANDARD d'une zone IANA, en heures — celui HORS heure d'ete.
 *
 * Premiere version : on prenait les decalages de janvier ET de juillet
 * et on acceptait l'un ou l'autre, pour ne pas faire echouer Cuba six
 * mois par an. C'etait trop laxiste, et la contre-epreuve l'a montre —
 * « UTC+1 » injecte sur les Canaries passait sans bruit, puisque c'est
 * leur decalage d'ete. Un controle qui accepte les deux reponses ne
 * verifie rien.
 *
 * Ce qu'une fiche annonce est le decalage standard : « UTC−5 » pour
 * Cuba, « UTC+0 » pour les Canaries. On le lit sur le drapeau isdst des
 * transitions plutot que de le deviner par la saison — l'hemisphere sud
 * inverse janvier et juillet.
 */
function decalage_standard(string $zone): ?int {
    try { $tz = new DateTimeZone($zone); } catch (Throwable $e) { return null; }
    $debut = (new DateTime('2026-01-01', new DateTimeZone('UTC')))->getTimestamp();
    $fin   = (new DateTime('2027-01-01', new DateTimeZone('UTC')))->getTimestamp();
    foreach ($tz->getTransitions($debut, $fin) as $t) {
        if (empty($t['isdst'])) return (int)($t['offset'] / 3600);
    }
    // Zone sans transition sur la periode : son decalage est constant.
    return (int)((new DateTime('2026-01-15', $tz))->getOffset() / 3600);
}

// L'identifiant de fiche ne porte pas son code ISO : il se deduit du
// drapeau, comme dans le front. On refait ici le meme calcul, sur les
// indicateurs regionaux de l'emoji.
function iso_depuis_drapeau(string $drapeau): string {
    $cps = [];
    foreach (preg_split('//u', $drapeau, -1, PREG_SPLIT_NO_EMPTY) ?: [] as $c) {
        $n = mb_ord($c, 'UTF-8');
        if ($n >= 0x1F1E6 && $n <= 0x1F1FF) $cps[] = chr($n - 0x1F1E6 + ord('A'));
    }
    return count($cps) === 2 ? implode('', $cps) : '';
}

$front = tables_du_front(__DIR__ . '/../assets/js/data.pays.js');
if (!$front['pays']) {
    $defauts[] = 'data.pays.js : aucune ligne lisible — le motif de lecture a-t-il change ?';
} else {
    $q = $db->query('SELECT g.country_id, g.currency, g.timezone, c.flag
                     FROM producer_geo g JOIN producer_countries c ON c.id = g.country_id
                     ORDER BY g.country_id');
    foreach ($q as $r) {
        $id = $r['country_id'];
        // Le territoire l'emporte sur le drapeau : c'est tout l'objet
        // de TERRITOIRES_INFOS.
        $d = $front['territoires'][$id] ?? ($front['pays'][iso_depuis_drapeau((string)$r['flag'])] ?? null);
        if (!$d) continue;   // pays hors table : le repli sert vraiment, rien a comparer

        // Devise : comparer les codes ISO, pas les libelles.
        if (preg_match_all('/\(([A-Z]{3})\)/', (string)$r['currency'], $mm) && $mm[1]) {
            if (!in_array($d[0], $mm[1], true)) {
                $defauts[] = sprintf('%s : la base dit « %s », l\'ecran affiche %s',
                                     $id, $r['currency'], $d[0]);
            }
        } else {
            $defauts[] = sprintf('%s : « %s » ne porte aucun code ISO 4217',
                                 $id, $r['currency']);
        }

        // Fuseau : le premier decalage annonce est celui de la capitale.
        if (preg_match('/UTC\s*([+\x{2212}\-])\s*(\d{1,2})/u', (string)$r['timezone'], $mm)) {
            $signe = ($mm[1] === '+') ? 1 : -1;
            $attendu = decalage_standard($d[2]);
            if ($attendu !== null && $signe * (int)$mm[2] !== $attendu) {
                $defauts[] = sprintf('%s : la base dit « %s », %s est a UTC%+d hors heure d\'ete',
                                     $id, $r['timezone'], $d[2], $attendu);
            }
        }
    }
}

// ── Rapport ──────────────────────────────────────────────

echo "CigarOdyssey — coherence entre champs\n\n";

if (!$defauts) {
    echo "  Les listes de regions suivent les zones posees sur le globe.\n";
    echo "  Aucun rang mondial non source n'est reapparu.\n";
    echo "  Le repli de la base dit la meme devise et le meme fuseau que l'ecran.\n";
    exit(0);
}

foreach ($defauts as $d) echo "  ECHEC  $d\n";
printf("\n%d incoherence(s). Voir docs/relecture.md, lot 5.\n", count($defauts));
exit(1);
