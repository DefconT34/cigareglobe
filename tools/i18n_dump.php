<?php
// ════════════════════════════════════════════════════════
// tools/i18n_dump.php — Export versionnable des traductions
// ────────────────────────────────────────────────────────
// Les traductions du contenu vivent en base, et la base n'est pas dans
// Git : `sql/schema.sql` ne porte que la structure, le contenu se
// sauvegarde hors depot. Des milliers de traductions ne pouvaient donc
// survivre qu'a une sauvegarde manuelle.
//
// Ce script les extrait seules — colonnes « champ_xx » et dictionnaire
// `content_translations` — sous forme d'instructions rejouables :
//
//   php tools/i18n_dump.php > sql/traductions.sql
//
// Aucune donnee personnelle : ni comptes, ni avis, ni adresses IP.
//
// Les UPDATE portent sur la CLE PRIMAIRE, pas sur le texte source. Le
// francais de reference est amene a etre corrige ; s'y accrocher aurait
// rendu le fichier caduc au premier ajustement.
// ════════════════════════════════════════════════════════

if (PHP_SAPI !== 'cli') { http_response_code(404); exit; }

require_once __DIR__ . '/../backend/config.php';
require_once __DIR__ . '/i18n_contenu_plan.php';

$db = getDB();

// cles_primaires() et colonnes_de() vivent dans i18n_contenu_plan.php.

echo "-- CigarOdyssey — traductions du contenu\n";
echo "-- Genere par tools/i18n_dump.php le " . date('Y-m-d') . "\n";
echo "-- Rejouable : chaque instruction ecrase la valeur existante.\n";
echo "SET NAMES utf8mb4;\n\n";

$total = 0;
foreach (plan_contenu() as $table => $champs) {
    $pk   = cles_primaires($db, $table);
    $cols = colonnes_de($db, $table);
    if (!$pk) { fwrite(STDERR, "  ignore (pas de cle primaire) : $table\n"); continue; }

    $traduites = [];
    foreach ($champs as $champ) {
        foreach (LANGUES_CIBLES as $l) {
            if (in_array($champ . '_' . $l, $cols, true)) $traduites[] = $champ . '_' . $l;
        }
    }
    if (!$traduites) continue;

    echo "-- ── $table " . str_repeat('─', max(0, 50 - strlen($table))) . "\n";
    $sel   = array_merge($pk, $traduites);
    $ordre = '`' . implode('`, `', $pk) . '`';
    $q = $db->query('SELECT `' . implode('`, `', $sel) . "` FROM `$table` ORDER BY $ordre");
    foreach ($q as $r) {
        $sets = [];
        foreach ($traduites as $col) {
            if ($r[$col] === null || $r[$col] === '') continue;
            $sets[] = "`$col` = " . $db->quote($r[$col]);
        }
        if (!$sets) continue;
        $total += count($sets);
        // Toutes les colonnes de la cle : sur `aromes`, « WHERE famille =
        // 'cacao' » designe DEUX lignes et recopierait la glose de
        // l'accord sur celle de la note.
        $ou = [];
        foreach ($pk as $c) $ou[] = "`$c` = " . $db->quote((string)$r[$c]);
        echo "UPDATE `$table` SET " . implode(', ', $sets)
           . ' WHERE ' . implode(' AND ', $ou) . ";\n";
    }
    echo "\n";
}

// ── Dictionnaire de texte libre (migration 008) ───────────
echo "-- ── content_translations " . str_repeat('─', 30) . "\n";
try {
    $q = $db->query('SELECT source_hash, lang, source_text, target_text
                     FROM content_translations ORDER BY source_hash, lang');
    foreach ($q as $r) {
        $total++;
        echo "INSERT INTO content_translations (source_hash, lang, source_text, target_text) VALUES ("
           . $db->quote($r['source_hash']) . ', ' . $db->quote($r['lang']) . ', '
           . $db->quote($r['source_text']) . ', ' . $db->quote($r['target_text'])
           . ") ON DUPLICATE KEY UPDATE target_text = VALUES(target_text);\n";
    }
} catch (Throwable $e) {
    fwrite(STDERR, "  content_translations absente : " . $e->getMessage() . "\n");
}

// ── Fraicheur (migration 009) ─────────────────────────────
// Sans elle, une restauration rendrait toutes les traductions
// « non scellees » : on saurait de nouveau qu'elles existent, plus de
// quel francais elles sont issues.
echo "\n-- ── translation_status " . str_repeat('─', 31) . "\n";
try {
    $q = $db->query('SELECT entite, entite_id, champ, lang, source_hash, statut
                     FROM translation_status ORDER BY entite, entite_id, champ, lang');
    foreach ($q as $r) {
        $total++;
        echo "INSERT INTO translation_status (entite, entite_id, champ, lang, source_hash, statut) VALUES ("
           . $db->quote($r['entite']) . ', ' . $db->quote($r['entite_id']) . ', '
           . $db->quote($r['champ']) . ', ' . $db->quote($r['lang']) . ', '
           . $db->quote($r['source_hash']) . ', ' . $db->quote($r['statut'])
           . ") ON DUPLICATE KEY UPDATE source_hash = VALUES(source_hash), statut = VALUES(statut);\n";
    }
} catch (Throwable $e) {
    fwrite(STDERR, "  translation_status absente : " . $e->getMessage() . "\n");
}

fwrite(STDERR, "$total traduction(s) exportee(s)\n");
