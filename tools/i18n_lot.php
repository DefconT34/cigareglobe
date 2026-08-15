<?php
/**
 * i18n_lot.php — traduire les articles de marque par lots sûrs.
 *
 * POURQUOI PAS `--exporter` DIRECTEMENT
 * ------------------------------------
 * `i18n_contenu.php --exporter` sort un objet dont les CLÉS sont les
 * textes français eux-mêmes. Pour le remplir, il faut donc les recopier
 * — des articles de deux mille signes, avec apostrophes typographiques,
 * tirets cadratins et guillemets français. Une seule différence
 * invisible et le segment n'est jamais retrouvé : la traduction part
 * dans le vide sans que rien ne le signale.
 *
 * Cet outil coupe le problème en deux :
 *
 *   --lister "Nom, Nom, ..."   sort un TABLEAU ORDONNÉ des segments
 *                              français d'un lot de marques
 *   --coudre lot.json trad.json > segments.json
 *                              recoud les traductions aux sources PAR
 *                              POSITION, et produit le fichier que
 *                              `i18n_contenu.php --importer` attend
 *
 * On n'écrit donc jamais une clé française à la main. Le fichier de
 * traduction n'est qu'une liste, dans le même ordre, et --coudre refuse
 * de travailler si les longueurs diffèrent.
 *
 * USAGE
 *   php tools/i18n_lot.php --lister "A.J. Fernandez,Aganorsa Leaf" > lot.json
 *   php tools/i18n_lot.php --reste                 # ce qui manque encore
 *   php tools/i18n_lot.php --coudre lot.json trad.json > seg.json
 *   php tools/i18n_contenu.php --importer seg.json
 */
declare(strict_types=1);

require_once __DIR__ . '/../backend/config.php';

const COLONNES = ['history', 'gamme', 'pairings'];
const LANGUES  = ['en', 'es', 'de', 'zh', 'ar'];

/** Une marque est « à faire » si l'une de ses colonnes traduisibles est
 *  remplie en français mais vide dans au moins une langue. */
function marques_incompletes(PDO $db): array {
    $out = [];
    foreach ($db->query('SELECT * FROM brands ORDER BY name') as $r) {
        foreach (COLONNES as $c) {
            $fr = trim((string)$r[$c]);
            if ($fr === '' || $fr === '[]') continue;
            foreach (LANGUES as $l) {
                $v = trim((string)($r[$c . '_' . $l] ?? ''));
                if ($v === '' || $v === '[]') { $out[$r['name']] = true; break 2; }
            }
        }
    }
    return array_keys($out);
}

$db = getDB();

// ── --reste : ce qu'il reste à traduire ─────────────────
if (in_array('--reste', $argv, true)) {
    $noms = marques_incompletes($db);
    printf("%d marque(s) incomplete(s) :\n", count($noms));
    foreach ($noms as $n) echo "  $n\n";
    exit(count($noms) ? 1 : 0);
}

// ── --lister : les segments français d'un lot ───────────
$i = array_search('--lister', $argv, true);
if ($i !== false) {
    $noms = array_values(array_filter(array_map('trim', explode(',', $argv[$i + 1] ?? ''))));
    if (!$noms) { fwrite(STDERR, "ABANDON : aucune marque.\n"); exit(2); }

    $in = implode(',', array_fill(0, count($noms), '?'));
    $st = $db->prepare("SELECT * FROM brands WHERE name IN ($in) ORDER BY FIELD(name, $in)");
    $st->execute(array_merge($noms, $noms));
    $rows = $st->fetchAll(PDO::FETCH_ASSOC);

    $vus = array_column($rows, 'name');
    foreach ($noms as $n) {
        if (!in_array($n, $vus, true)) { fwrite(STDERR, "ABANDON : marque introuvable — $n\n"); exit(2); }
    }

    $lot = [];
    foreach ($rows as $r) {
        foreach (COLONNES as $c) {
            $fr = trim((string)$r[$c]);
            if ($fr === '' || $fr === '[]') continue;
            // Déjà complète dans les cinq langues : on ne la ressort pas.
            $manque = false;
            foreach (LANGUES as $l) {
                $v = trim((string)($r[$c . '_' . $l] ?? ''));
                if ($v === '' || $v === '[]') { $manque = true; break; }
            }
            if (!$manque) continue;
            $lot[] = ['marque' => $r['name'], 'colonne' => $c, 'source' => $r[$c]];
        }
    }
    echo json_encode($lot, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES), "\n";
    fwrite(STDERR, sprintf("%d segment(s), %d caracteres source.\n",
        count($lot), array_sum(array_map(fn($s) => mb_strlen($s['source']), $lot))));
    exit(0);
}

// ── --coudre : traductions + sources → fichier d'import ─
$i = array_search('--coudre', $argv, true);
if ($i !== false) {
    $lot  = json_decode((string)file_get_contents($argv[$i + 1] ?? ''), true);
    $trad = json_decode((string)file_get_contents($argv[$i + 2] ?? ''), true);
    if (!is_array($lot) || !is_array($trad)) {
        fwrite(STDERR, "ABANDON : JSON illisible.\n"); exit(2);
    }
    if (count($lot) !== count($trad)) {
        fwrite(STDERR, sprintf("ABANDON : %d segments, %d traductions. Le recoud par position\n" .
            "         exige des listes de meme longueur — sinon tout decale.\n",
            count($lot), count($trad)));
        exit(2);
    }

    $out = [];
    foreach ($lot as $k => $seg) {
        $t = $trad[$k];
        foreach (LANGUES as $l) {
            if (!isset($t[$l]) || trim((string)$t[$l]) === '') {
                fwrite(STDERR, sprintf("ABANDON : segment %d (%s / %s) — langue %s vide.\n",
                    $k, $seg['marque'], $seg['colonne'], $l));
                exit(2);
            }
        }
        // Une colonne JSON doit rester du JSON valide APRÈS traduction.
        // Sans cette garde, une virgule oubliée dans une gamme traduite
        // vide la section pour cette langue-là, en silence.
        if (in_array($seg['colonne'], ['gamme', 'pairings'], true)) {
            foreach (LANGUES as $l) {
                if (json_decode($t[$l], true) === null) {
                    fwrite(STDERR, sprintf("ABANDON : segment %d (%s / %s / %s) n'est pas du JSON valide.\n",
                        $k, $seg['marque'], $seg['colonne'], $l));
                    exit(2);
                }
            }
        }
        $cle = 'brands.' . $seg['colonne'];
        $out[$cle][$seg['source']] = array_intersect_key($t, array_flip(LANGUES));
    }
    echo json_encode($out, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES), "\n";
    fwrite(STDERR, sprintf("%d segment(s) recousu(s).\n", count($lot)));
    exit(0);
}

fwrite(STDERR, "Usage : --lister \"Nom,Nom\" | --reste | --coudre lot.json trad.json\n");
exit(2);
