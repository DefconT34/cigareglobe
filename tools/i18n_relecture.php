<?php
// ════════════════════════════════════════════════════════
// i18n_relecture.php — La relecture des traductions, lot par lot
// ────────────────────────────────────────────────────────
//   php tools/i18n_relecture.php --exporter --lang=en --entites=feuilles,production_zones [--champs=notes] [--limite=200] [--sortie=lot.json]
//   php tools/i18n_relecture.php --importer=relu.json --migration=234 [--relecteur="expert-traduction (agent)"]
//   php tools/i18n_relecture.php --figer                       le cliquet : sql/i18n_relues.json, les relues ne reculent pas
//   php tools/i18n_relecture.php --autotest
//
// CE QUE CET OUTIL FAIT. 9 220 traductions vivent en base, toutes au
// statut « machine » : aucune n'a jamais ete relue par quelqu'un qui
// parle la langue. Ce chantier les relit LOT PAR LOT — une langue, une
// ou deux tables a la fois — et chaque lot devient une migration :
//
//   1. --exporter sort un lot : pour chaque texte, le francais, la
//      traduction en place, et l'EMPREINTE du francais au moment de
//      l'export. Seules sortent les traductions au statut « machine »,
//      non vides, et A JOUR (empreinte scellee = francais actuel) : on
//      ne relit pas une traduction d'un texte qui a change depuis.
//   2. Le relecteur (l'agent expert-traduction, ou une personne) rend un
//      fichier de verdicts : pour chaque cle, « ok » ou « corrige » avec
//      le texte corrige et un motif d'une ligne.
//   3. --importer transforme les verdicts en migration SQL : les textes
//      corriges sont ecrits, et toutes les traductions relues — corrigees
//      ou validees — passent au statut « relu », avec le NOM DU
//      RELECTEUR dans la colonne `relecteur` (posee par la migration 234).
//      Un verdict dont l'empreinte ne correspond plus au francais actuel
//      est REFUSE : le texte a bouge entre l'export et l'import.
//
// POURQUOI UNE MIGRATION ET PAS UN UPDATE DIRECT. `i18n_fraicheur.php
// --relu` ecrit dans la base ; il faudrait le rejouer sur le serveur
// avec le meme fichier, sans trace. La migration porte les textes
// corriges, le nom du relecteur, le journal, et le SELECT de controle —
// et elle se relit dans un an.
// ════════════════════════════════════════════════════════

if (PHP_SAPI !== 'cli') { http_response_code(404); exit; }
require_once __DIR__ . '/../backend/config.php';
require_once __DIR__ . '/i18n_contenu_plan.php';

const RELECTURE_MAX = 400;

/** Une option --nom=valeur, ou null. */
function opt(array $argv, string $nom, ?string $defaut = null): ?string {
    foreach ($argv as $a) {
        if (str_starts_with($a, "--$nom=")) return substr($a, strlen($nom) + 3);
    }
    return $defaut;
}

/** Echappement SQL d'une chaine, comme les generateurs de migration. */
function sq(string $s): string {
    return "'" . str_replace(["\\", "'"], ["\\\\", "''"], $s) . "'";
}

/** Le WHERE d'une ligne : cle simple ou composee (aromes : famille + contexte). */
function ou_ligne(array $pk, string $id): string {
    $vals = explode('|', $id);
    $parts = [];
    foreach ($pk as $k => $col) $parts[] = "`$col` = " . sq($vals[$k] ?? '');
    return implode(' AND ', $parts);
}

/**
 * Les mots qu'une relecture ne doit pas introduire : les superlatifs
 * bannis en chinois et en arabe (regle de l'atlas), et le cyrillique
 * partout. Rend la liste des infractions, vide si tout va bien.
 */
function infractions(string $lang, string $texte): array {
    $inf = [];
    $bannis = ['zh' => ['最', '第一'], 'ar' => ['أفضل', 'أكثر', 'أندر', 'أشهر']];
    foreach ($bannis[$lang] ?? [] as $mot) if (mb_strpos($texte, $mot) !== false) $inf[] = "superlatif $mot";
    if (preg_match('/[\x{0400}-\x{04FF}]/u', $texte)) $inf[] = 'cyrillique';
    return $inf;
}

/** Le slug d'un nom de migration : minuscules, sans accent, tirets bas. */
function slug_migration(string $s): string {
    $s = iconv('UTF-8', 'ASCII//TRANSLIT', $s) ?: $s;
    $s = strtolower(preg_replace('/[^A-Za-z0-9]+/', '_', $s));
    return trim($s, '_');
}

/* ── Les cas construits ────────────────────────────────── */
function relecture_autotest(): int {
    $echecs = 0;
    $dire = function (bool $ok, string $titre) use (&$echecs) {
        if (!$ok) $echecs++;
        printf("  [%s] %s\n", $ok ? 'ok' : 'KO', $titre);
    };
    $dire(sq("l'été") === "'l''été'", 'sq : l apostrophe est doublee');
    $dire(ou_ligne(['id'], 'cuba') === "`id` = 'cuba'", 'ou_ligne : cle simple');
    $dire(ou_ligne(['famille', 'contexte'], 'cacao|note') === "`famille` = 'cacao' AND `contexte` = 'note'", 'ou_ligne : cle composee');
    $dire(infractions('zh', '这是最好的') === ['superlatif 最'], 'infractions : 最 en chinois');
    $dire(infractions('ar', 'أكثر من مئة') === ['superlatif أكثر'], 'infractions : أكثر en arabe');
    $dire(infractions('en', 'Москва') === ['cyrillique'], 'infractions : cyrillique en anglais');
    $dire(infractions('en', 'A plain sentence.') === [], 'infractions : rien a redire');
    $dire(slug_migration("Relecture anglaise — pays et feuilles") === 'relecture_anglaise_pays_et_feuilles', 'slug : accents et tirets');
    printf("\n  %d cas, %d echec(s)\n", 8, $echecs);
    return $echecs === 0 ? 0 : 1;
}

if (in_array('--autotest', $argv, true)) exit(relecture_autotest());

$db = getDB();

// ── Exporter un lot ──────────────────────────────────────
if (in_array('--exporter', $argv, true)) {
    $lang = opt($argv, 'lang');
    if (!$lang || !in_array($lang, LANGUES_CIBLES, true)) { fwrite(STDERR, "ABANDON : --lang=en|es|de|zh|ar\n"); exit(2); }
    $entites = array_filter(explode(',', (string)opt($argv, 'entites', '')));
    $champsVoulus = array_filter(explode(',', (string)opt($argv, 'champs', '')));
    $limite = (int)opt($argv, 'limite', (string)RELECTURE_MAX);
    $sortie = opt($argv, 'sortie');
    if (!$entites) { fwrite(STDERR, "ABANDON : --entites=table,table\n"); exit(2); }

    $statuts = [];
    foreach ($db->query("SELECT entite, entite_id, champ, source_hash, statut FROM translation_status WHERE lang = " . $db->quote($lang)) as $r) {
        $statuts[$r['entite'] . '|' . $r['entite_id'] . '|' . $r['champ']] = [$r['source_hash'], $r['statut']];
    }
    $items = []; $ignores = ['perimee' => 0, 'relue' => 0, 'vide' => 0, 'non-scellee' => 0];
    foreach (plan_contenu() as $table => $champs) {
        if (!in_array($table, $entites, true)) continue;
        $pk = cles_primaires($db, $table);
        $cols = colonnes_de($db, $table);
        foreach ($champs as $champ) {
            if ($champsVoulus && !in_array($champ, $champsVoulus, true)) continue;
            if (!in_array("{$champ}_{$lang}", $cols, true)) continue;
            $sel = '`' . implode('`, `', $pk) . "`, `$champ` src, `{$champ}_{$lang}` trad";
            foreach ($db->query("SELECT $sel FROM `$table` WHERE `$champ` IS NOT NULL AND `$champ` <> '' ORDER BY " . implode(', ', array_map(fn($c) => "`$c`", $pk))) as $r) {
                $id = identite_ligne($pk, $r);
                $ref = $statuts["$table|$id|$champ"] ?? null;
                $h = empreinte_source((string)$r['src']);
                if (trim((string)$r['trad']) === '')     { $ignores['vide']++; continue; }
                if ($ref === null)                        { $ignores['non-scellee']++; continue; }
                if ($ref[1] === 'relu')                   { $ignores['relue']++; continue; }
                if ($ref[0] !== $h)                       { $ignores['perimee']++; continue; }
                $items[] = ['cle' => "$table|$id|$champ|$lang", 'entite' => $table, 'id' => $id, 'champ' => $champ,
                            'fr' => $r['src'], 'trad' => $r['trad'], 'empreinte' => $h];
                if (count($items) >= $limite) break 3;
            }
        }
    }
    $lot = ['lang' => $lang, 'date' => date('Y-m-d'), 'entites' => array_values($entites), 'nb' => count($items),
            'caracteres_fr' => array_sum(array_map(fn($i) => mb_strlen($i['fr']), $items)), 'items' => $items];
    $json = json_encode($lot, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES) . "\n";
    if ($sortie) { file_put_contents($sortie, $json); fwrite(STDERR, "Lot ecrit : $sortie\n"); }
    else echo $json;
    fwrite(STDERR, sprintf("%d texte(s) a relire en %s (%s caracteres de francais) ; ignores : %d perimes, %d deja relus, %d vides, %d non scelles.\n",
        count($items), $lang, number_format($lot['caracteres_fr'], 0, ',', ' '), $ignores['perimee'], $ignores['relue'], $ignores['vide'], $ignores['non-scellee']));
    exit(0);
}

// ── Importer des verdicts : la migration ─────────────────
$fichier = opt($argv, 'importer');
if ($fichier !== null) {
    if (!is_file($fichier)) { fwrite(STDERR, "ABANDON : $fichier introuvable\n"); exit(2); }
    $d = json_decode((string)file_get_contents($fichier), true);
    if (!is_array($d) || empty($d['verdicts']) || empty($d['lang'])) { fwrite(STDERR, "ABANDON : le fichier doit porter lang et verdicts[]\n"); exit(2); }
    $num = opt($argv, 'migration');
    if (!$num || !preg_match('/^\d{3}$/', $num)) { fwrite(STDERR, "ABANDON : --migration=NNN\n"); exit(2); }
    $lang = $d['lang'];
    $relecteur = opt($argv, 'relecteur', (string)($d['relecteur'] ?? 'expert-traduction (agent)'));
    $titre = (string)($d['titre'] ?? "Relecture $lang");
    $lotFichier = opt($argv, 'lot');   // le lot exporte, pour retrouver l'empreinte quand le verdict ne la porte pas
    $empreintes = [];
    if ($lotFichier && is_file($lotFichier)) {
        $lot = json_decode((string)file_get_contents($lotFichier), true);
        foreach ($lot['items'] ?? [] as $it) $empreintes[$it['cle']] = $it['empreinte'];
    }

    $out = []; $o = function (string $s) use (&$out) { $out[] = $s; };
    $corriges = 0; $valides = 0; $refuses = []; $parEntite = [];
    $o("-- ════════════════════════════════════════════════════════");
    $o("-- $num — $titre");
    $o("-- ────────────────────────────────────────────────────────");
    $o("-- Relecture des traductions en $lang par : $relecteur.");
    $o("-- Fichier de verdicts : " . basename($fichier) . " ; generee par tools/i18n_relecture.php le " . date('Y-m-d') . ".");
    $o("-- Un texte « corrige » est reecrit ; tout texte relu passe au statut « relu »,");
    $o("-- avec le nom du relecteur. L'empreinte du francais est verifiee dans le WHERE :");
    $o("-- un francais qui a change depuis l'export ne se laisse pas declarer relu.");
    $o("-- ════════════════════════════════════════════════════════");
    $o("");
    foreach ($d['verdicts'] as $v) {
        $cle = (string)($v['cle'] ?? '');
        // une cle composee (aromes : famille|contexte) contient elle-meme des « | » : on lit depuis la fin
        $p = explode('|', $cle);
        if (count($p) < 4) { $refuses[] = "$cle : cle illisible"; continue; }
        $l = array_pop($p); $champ = array_pop($p); $table = array_shift($p); $id = implode('|', $p);
        if ($l !== $lang) { $refuses[] = "$cle : langue $l dans un lot $lang"; continue; }
        if (!isset(plan_contenu()[$table]) || !in_array($champ, plan_contenu()[$table], true)) { $refuses[] = "$cle : hors plan"; continue; }
        $pk = cles_primaires($db, $table);
        // le francais actuel, et son empreinte
        $st = $db->prepare("SELECT `$champ` src FROM `$table` WHERE " . ou_ligne($pk, $id));
        $st->execute();
        $src = $st->fetchColumn();
        if ($src === false) { $refuses[] = "$cle : ligne introuvable"; continue; }
        $h = empreinte_source((string)$src);
        $attendue = (string)($v['empreinte'] ?? ($empreintes[$cle] ?? $h));
        if ($attendue !== $h) { $refuses[] = "$cle : le francais a change depuis l'export"; continue; }
        $verdict = (string)($v['verdict'] ?? '');
        if ($verdict === 'corrige') {
            $texte = (string)($v['texte'] ?? '');
            if (trim($texte) === '') { $refuses[] = "$cle : corrige sans texte"; continue; }
            $inf = infractions($lang, $texte);
            if ($inf) { $refuses[] = "$cle : " . implode(', ', $inf); continue; }
            $o("-- $cle — " . str_replace(["\r", "\n"], ' ', (string)($v['motif'] ?? '')));
            $o("UPDATE `$table` SET `{$champ}_{$lang}` = " . sq($texte) . "\n WHERE " . ou_ligne($pk, $id) . " AND SHA1(TRIM(`$champ`)) = " . sq($h) . ";");
            $corriges++;
        } elseif ($verdict === 'ok') {
            $valides++;
        } else { $refuses[] = "$cle : verdict « $verdict » inconnu"; continue; }
        $o("UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = " . sq($relecteur) . ", `maj` = NOW()\n WHERE `entite` = " . sq($table) . " AND `entite_id` = " . sq($id) . " AND `champ` = " . sq($champ) . " AND `lang` = " . sq($lang) . " AND `source_hash` = " . sq($h) . ";");
        $parEntite[$table] = ($parEntite[$table] ?? 0) + 1;
    }
    $total = $corriges + $valides;
    $o("");
    $o("DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration $num';");
    $detail = sprintf("Relecture %s par %s : %d traduction(s) relue(s) — %d corrigee(s), %d validee(s) telles quelles ; %s", $lang, $relecteur, $total, $corriges, $valides,
                      implode(', ', array_map(fn($t, $n) => "$t $n", array_keys($parEntite), $parEntite)));
    $o("INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)\nVALUES (NULL, 'migration $num', 'systeme', 'traductions_relues', 'systeme', 0, " . sq($detail) . ");");
    $o("");
    $o("SELECT");
    $o("  (SELECT COUNT(*) FROM `translation_status` WHERE `lang` = " . sq($lang) . " AND `statut` = 'relu' AND `relecteur` = " . sq($relecteur) . ") >= $total AS relues,");
    $o("  (SELECT COUNT(*) FROM `translation_status` WHERE `statut` = 'relu' AND (`relecteur` IS NULL OR `relecteur` = '')) = 0 AS chaque_relecture_a_son_relecteur;");
    $o("SELECT `lang`, SUM(`statut` = 'relu') AS relues, COUNT(*) AS total FROM `translation_status` GROUP BY `lang`;");

    $chemin = __DIR__ . "/../sql/migrations/{$num}_" . slug_migration($titre) . ".sql";
    file_put_contents($chemin, implode("\n", $out) . "\n");
    printf("Migration ecrite : %s\n  %d relue(s) : %d corrigee(s), %d validee(s) ; %d refusee(s).\n", $chemin, $total, $corriges, $valides, count($refuses));
    foreach ($refuses as $r) echo "  REFUS  $r\n";
    exit($refuses ? 1 : 0);
}

// ── Figer le cliquet : les relues ne reculent pas ────────
if (in_array('--figer', $argv, true)) {
    $parLang = [];
    foreach ($db->query("SELECT lang, COUNT(*) n FROM translation_status WHERE statut = 'relu' GROUP BY lang ORDER BY lang") as $r) $parLang[$r['lang']] = (int)$r['n'];
    $sceau = ['date' => date('Y-m-d'), 'relues' => array_sum($parLang), 'par_langue' => $parLang];
    file_put_contents(__DIR__ . '/../sql/i18n_relues.json', json_encode($sceau, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE) . "\n");
    printf("Sceau écrit : sql/i18n_relues.json — %d relue(s)\n", $sceau['relues']);
    exit(0);
}

fwrite(STDERR, "Usage : --exporter --lang=.. --entites=.. | --importer=verdicts.json --migration=NNN [--lot=lot.json] | --figer | --autotest\n");
exit(2);
