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
// Le perimetre traduisible est partage avec i18n_dump.php : deux copies
// finiraient par diverger, et la sauvegarde laisserait alors filer des
// colonnes pourtant traduites.
require_once __DIR__ . '/i18n_contenu_plan.php';

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

/**
 * La chaine est-elle de la prose, ou un nom propre ?
 *
 * Les tableaux « marques » melangent les deux : « Acid »,
 * « Alec Bradley Prensado » cotoient « Wrapper Cameroon Shade exporte
 * mondialement ». On ne retient que ce qui se lit comme une phrase —
 * un mot outil francais ou un accent, et au moins trois mots.
 *
 * La cle « pays » fait exception : ce sont des noms de regions, courts
 * mais bel et bien traduisibles (« Europe », « Moyen-Orient »).
 */
function est_prose(string $v, ?string $cle): bool {
    if ($cle === 'pays') return true;

    // Decoupe sur tout ce qui n'est pas une lettre : pas de regex, donc
    // pas de sequence d'echappement a transporter. Une precedente
    // version utilisait une limite de mot mal echappee, devenue un
    // caractere de controle — la regex ne correspondait jamais et des
    // phrases entieres passaient pour des noms propres.
    $mots = preg_split('/[^\p{L}\p{N}]+/u', mb_strtolower($v), -1, PREG_SPLIT_NO_EMPTY);
    if (count($mots) < 3) return false;

    // Cinq mots ou plus : c'est une phrase, quels que soient les mots.
    //
    // Sans cette regle, « Pas d'usine : elle choisit son rouleur selon
    // l'assemblage » etait classee NOM PROPRE — aucun mot de la liste
    // ci-dessous, aucun accent — et n'a jamais ete proposee a la
    // traduction. En silence : l'export ne la montrait pas, donc rien
    // ne signalait qu'elle manquait. Les listes fermees echouent
    // toujours ainsi, sur l'exemple qu'on n'avait pas prevu.
    //
    // Le seuil protege ce que la liste protegeait : « Vuelta Abajo »,
    // « Connecticut Shade », « Habanos S.A. » tiennent en deux a
    // quatre mots.
    if (count($mots) >= 5) return true;

    $outils = ['de','du','des','le','la','les','un','une','avec','pour','en','et',
               'au','aux','sur','dans','par','sans','plus','depuis','monde',
               'mondial','mondiale','historique','ce','cette'];
    foreach ($mots as $m) {
        if (in_array($m, $outils, true)) return true;
    }
    return (bool)preg_match('/[àâäéèêëîïôöùûüç]/u', $v);
}

/** Chaines libres distinctes trouvees dans les colonnes JSON. */
function segments_libres(PDO $db): array {
    $out = [];
    $recolte = function ($v, $cle = null) use (&$recolte, &$out) {
        if (is_string($v)) {
            $v = trim($v);
            if ($v !== '' && mb_strlen($v) > 3
                && !in_array($cle, cles_non_traduites(), true)
                && est_prose($v, $cle)) {
                $out[$v] = true;
            }
            return;
        }
        if (is_array($v)) foreach ($v as $k => $x) $recolte($x, is_string($k) ? $k : $cle);
    };
    foreach (plan_libre() as $table => $champs) {
        foreach ($champs as $champ) {
            foreach ($db->query("SELECT `$champ` v FROM `$table` WHERE `$champ` IS NOT NULL") as $r) {
                $recolte(json_decode($r['v'], true));
            }
        }
    }
    foreach (plan_libre_scalaire() as $table => $champs) {
        foreach ($champs as $champ) {
            foreach ($db->query("SELECT `$champ` v FROM `$table`
                                 WHERE `$champ` IS NOT NULL AND `$champ` <> ''") as $r) {
                $out[trim($r['v'])] = true;
            }
        }
    }
    $liste = array_keys($out);
    sort($liste);
    return $liste;
}

$db  = getDB();
$plan = plan_contenu();

// ── Texte libre des colonnes JSON (migration 008) ─────────
if (in_array('--exporter-libre', $argv, true)) {
    $faits = [];
    foreach ($db->query('SELECT source_hash, lang FROM content_translations') as $r) {
        $faits[$r['source_hash']][$r['lang']] = true;
    }
    $out = [];
    foreach (segments_libres($db) as $src) {
        $h = sha1($src);
        $manque = [];
        foreach (LANGUES_CIBLES as $l) if (empty($faits[$h][$l])) $manque[$l] = '';
        if ($manque) $out[$src] = $manque;
    }
    echo json_encode($out, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES), "
";
    exit(0);
}

$posLibre = array_search('--importer-libre', $argv, true);
if ($posLibre !== false) {
    $fichier = $argv[$posLibre + 1] ?? '';
    if (!is_file($fichier)) { fwrite(STDERR, "ABANDON : $fichier introuvable
"); exit(2); }
    $data = json_decode(file_get_contents($fichier), true);
    if (!is_array($data)) { fwrite(STDERR, "ABANDON : JSON invalide.
"); exit(2); }

    $st = $db->prepare(
        'INSERT INTO content_translations (source_hash, lang, source_text, target_text)
         VALUES (?, ?, ?, ?)
         ON DUPLICATE KEY UPDATE target_text = VALUES(target_text)'
    );
    $n = 0;
    foreach ($data as $src => $trads) {
        foreach ($trads as $l => $txt) {
            if (!in_array($l, LANGUES_CIBLES, true)) continue;
            $txt = trim((string)$txt);
            if ($txt === '') continue;
            $st->execute([sha1($src), $l, $src, $txt]);
            $n++;
        }
    }
    printf("%d traduction(s) libre(s) enregistree(s).
", $n);
    exit(0);
}

// ── Propagation ───────────────────────────────────────────
//
// LE TROU QUE CECI BOUCHE. `segments()` regroupe PAR VALEUR FRANCAISE
// et prend `MAX(champ_lang)` : il suffit qu'UNE ligne porte la
// traduction pour que la valeur passe pour traduite. Les autres lignes
// qui portent le meme francais restent vides, et l'export ne les
// propose jamais — elles sont invisibles.
//
// C'est arrive avec la migration 027 : la Jamaique et le Costa Rica
// heritent de « Caraibes » et « Amerique Centrale », deja traduits
// ailleurs. L'export ne proposait rien, l'etat affichait 100 %, et
// l'API rendait du francais dans les six langues.
//
// La traduction est par VALEUR, le stockage par LIGNE : il manquait
// l'etape qui recopie l'une sur l'autre. Aucune traduction nouvelle
// n'est produite ici — on ne fait que distribuer ce qu'on sait deja.
if (in_array('--propager', $argv, true)) {
    $n = 0;
    foreach ($plan as $table => $champs) {
        $cols = [];
        foreach ($db->query("DESCRIBE `$table`") as $c) $cols[] = $c['Field'];
        foreach ($champs as $champ) {
            if (!in_array($champ, $cols, true)) continue;
            foreach (LANGUES_CIBLES as $l) {
                $c = $champ . '_' . $l;
                if (!in_array($c, $cols, true)) continue;
                // « [] » compte pour vide : un tableau JSON vide est
                // plein pour un compteur et vide a l'ecran. La lecon
                // des colonnes `gamme_*` de la campagne F4b.
                $sql = "UPDATE `$table` t
                        JOIN (SELECT `$champ` src, MAX(`$c`) v FROM `$table`
                               WHERE `$c` IS NOT NULL AND `$c` <> '' AND `$c` <> '[]'
                               GROUP BY `$champ`) k ON k.src = t.`$champ`
                          SET t.`$c` = k.v
                        WHERE t.`$champ` IS NOT NULL AND t.`$champ` <> ''
                          AND (t.`$c` IS NULL OR t.`$c` = '' OR t.`$c` = '[]')";
                $st = $db->prepare($sql);
                $st->execute();
                if ($st->rowCount()) {
                    printf("  %-20s %-14s %s : %d ligne(s)\n", $table, $champ, $l, $st->rowCount());
                    $n += $st->rowCount();
                }
            }
        }
    }
    printf("%d traduction(s) recopiee(s) sur des lignes qui partagent le meme francais.\n", $n);
    exit(0);
}

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

    $ecrits = 0; $ignores = 0; $scelles = 0;
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

                // Retenir de QUEL francais cette traduction est issue.
                // Sans cela la table de fraicheur serait perimee des le
                // premier lot importe, et ne saurait plus rien dire.
                //
                // rowCount() vaut 0 dans DEUX cas opposes : rien n'a ete
                // ecrit, ou la valeur ecrite etait deja la (MySQL ne
                // compte pas une reecriture a l'identique). Sous --forcer
                // le second cas est le bon : la base porte le texte
                // voulu, il faut le sceller. Sans --forcer, 0 signifie
                // que la colonne etait deja remplie par AUTRE CHOSE — et
                // sceller la mentirait.
                if ($forcer || $st->rowCount() > 0) {
                    $scelles += sceller($db, $table, $champ, $l, $src);
                }
            }
        }
    }
    printf("%d ligne(s) mise(s) a jour, %d traduction(s) vide(s) ignoree(s), %d empreinte(s) posee(s).\n",
           $ecrits, $ignores, $scelles);
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
