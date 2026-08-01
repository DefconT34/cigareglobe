<?php
// ════════════════════════════════════════════════════════
// tools/i18n_contenu.php — Traductions du contenu de l'atlas
// ────────────────────────────────────────────────────────
// Le contenu des fiches (pays, marches, zones, Habanos) vit en base et
// non dans i18n.js. Ce script fait le va-et-vient :
//
//   php tools/i18n_contenu.php --exporter > segments.json
//       Ecrit les valeurs francaises DISTINCTES encore sans traduction,
//       avec un emplacement vide par langue. Distinctes : « Tropical
//       humide » revient sur plusieurs pays, il ne se traduit qu'une fois.
//
//   php tools/i18n_contenu.php --importer segments.json
//       Applique le fichier rempli a toutes les lignes concernees.
//       Idempotent : relancable sans risque, une valeur deja traduite
//       n'est pas rejouee sauf --forcer.
//
//   php tools/i18n_contenu.php --etat
//       Avancement par table et par langue.
//
// La correspondance colonne source -> colonnes de langue suit la
// convention « champ » / « champ_en ». Voir la migration 007.
// ════════════════════════════════════════════════════════

if (PHP_SAPI !== 'cli') { http_response_code(404); exit; }

require_once __DIR__ . '/../backend/config.php';

const LANGUES_CIBLES = ['en', 'es', 'de', 'zh', 'ar'];

/** Champs traduisibles, par table — miroir de data.php. */
function plan_contenu(): array {
    return [
        'producer_countries' => ['region','production','rev_detail','harvest','climate','soil','notes'],
        'markets'            => ['consumption','cigars','trend','note'],
        'production_zones'   => ['note'],
        'habanos_presence'   => ['status','ownership','description','festival'],
        'brands'             => ['history','gamme','celebrities','pairings'],
        'lounges'            => ['description'],
    ];
}

/** Valeurs francaises distinctes d'une colonne, avec leur etat de traduction. */
function segments(PDO $db, string $table, string $champ): array {
    $cols = [];
    foreach ($db->query("DESCRIBE `$table`") as $c) $cols[] = $c['Field'];
    if (!in_array($champ, $cols, true)) return [];

    $existantes = array_values(array_filter(LANGUES_CIBLES,
        fn($l) => in_array($champ . '_' . $l, $cols, true)));
    if (!$existantes) return [];

    $sel = ["`$champ` AS src"];
    foreach ($existantes as $l) $sel[] = "MAX(`{$champ}_{$l}`) AS `$l`";
    $q = $db->query("SELECT " . implode(', ', $sel) . " FROM `$table`
                     WHERE `$champ` IS NOT NULL AND `$champ` <> ''
                     GROUP BY `$champ` ORDER BY `$champ`");
    return $q->fetchAll(PDO::FETCH_ASSOC);
}

$db  = getDB();
$plan = plan_contenu();

// ── Export ────────────────────────────────────────────────
if (in_array('--exporter', $argv, true)) {
    $tout = in_array('--tout', $argv, true);
    $out  = [];
    foreach ($plan as $table => $champs) {
        foreach ($champs as $champ) {
            foreach (segments($db, $table, $champ) as $s) {
                $src = $s['src'];
                $manque = [];
                foreach (LANGUES_CIBLES as $l) {
                    if (!array_key_exists($l, $s)) continue;
                    if ($tout || $s[$l] === null || $s[$l] === '') $manque[$l] = $s[$l] ?? '';
                }
                if (!$manque) continue;
                $cle = $table . '.' . $champ;
                $out[$cle][$src] = $manque;
            }
        }
    }
    echo json_encode($out, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES), "\n";
    exit(0);
}

// ── Import ────────────────────────────────────────────────
$posImport = array_search('--importer', $argv, true);
if ($posImport !== false) {
    $fichier = $argv[$posImport + 1] ?? '';
    if (!is_file($fichier)) {
        fwrite(STDERR, "ABANDON : fichier introuvable — $fichier\n");
        exit(2);
    }
    $forcer = in_array('--forcer', $argv, true);
    $data = json_decode(file_get_contents($fichier), true);
    if (!is_array($data)) { fwrite(STDERR, "ABANDON : JSON invalide.\n"); exit(2); }

    $ecrits = 0; $ignores = 0;
    foreach ($data as $cle => $valeurs) {
        [$table, $champ] = array_pad(explode('.', $cle, 2), 2, '');
        if (!isset(plan_contenu()[$table]) || !in_array($champ, plan_contenu()[$table], true)) {
            fwrite(STDERR, "  ignore (hors plan) : $cle\n");
            continue;
        }
        foreach ($valeurs as $src => $trads) {
            foreach ($trads as $l => $txt) {
                if (!in_array($l, LANGUES_CIBLES, true)) continue;
                $txt = trim((string)$txt);
                if ($txt === '') { $ignores++; continue; }
                $col = $champ . '_' . $l;
                $sql = "UPDATE `$table` SET `$col` = ? WHERE `$champ` = ?"
                     . ($forcer ? '' : " AND (`$col` IS NULL OR `$col` = '')");
                $st = $db->prepare($sql);
                $st->execute([$txt, $src]);
                $ecrits += $st->rowCount();
            }
        }
    }
    printf("%d ligne(s) mise(s) a jour, %d traduction(s) vide(s) ignoree(s).\n", $ecrits, $ignores);
    exit(0);
}

// ── Etat (defaut) ─────────────────────────────────────────
echo "CigarOdyssey — traductions du contenu\n\n";
$totalSeg = $totalFait = 0;
foreach ($plan as $table => $champs) {
    $lignes = [];
    foreach ($champs as $champ) {
        $segs = segments($db, $table, $champ);
        if (!$segs) continue;
        $n = count($segs);
        $part = [];
        foreach (LANGUES_CIBLES as $l) {
            if (!array_key_exists($l, $segs[0])) continue;
            $ok = 0;
            foreach ($segs as $s) if (($s[$l] ?? '') !== '') $ok++;
            $part[] = sprintf('%s:%d%%', $l, $n ? round(100 * $ok / $n) : 0);
            $totalSeg += $n; $totalFait += $ok;
        }
        $lignes[] = sprintf("   %-14s %3d distinct(s)  %s", $champ, $n, implode('  ', $part));
    }
    if ($lignes) { echo "$table\n" . implode("\n", $lignes) . "\n"; }
}
printf("\nAvancement global : %d / %d (%d%%)\n",
       $totalFait, $totalSeg, $totalSeg ? round(100 * $totalFait / $totalSeg) : 0);
echo "\nExporter ce qui manque :  php tools/i18n_contenu.php --exporter > segments.json\n";
echo "Reappliquer un fichier :  php tools/i18n_contenu.php --importer segments.json\n";
