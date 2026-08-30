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
 * LES PÉRIMÉES, ET NON PLUS SEULEMENT LES VIDES
 * ---------------------------------------------
 * `--lister` ne sort que les colonnes VIDES. La refonte des 175
 * traductions périmées — celles dont le français a été réécrit depuis —
 * a demandé le même échafaudage, et il a été refait à la main onze fois
 * dans un répertoire temporaire. Il vit ici désormais.
 *
 *   --perimees [n]     les segments dont la traduction décrit un français
 *                      qui a changé, LES PLUS COURTS D'ABORD, limités à n
 *   --fiche "Nom" [col] un segment précis, périmé ou non
 *
 * Les deux sortent la forme que `--coudre` attend, avec la liste des
 * langues réellement à refaire : une fiche dont seul l'arabe est périmé
 * ne redemande pas les cinq.
 *
 * TROIS PIÈGES, PAYÉS PENDANT LA REFONTE
 * --------------------------------------
 * 1. UNE MARQUE N'EST PAS UN SEGMENT. Montecristo a deux entrées
 *    périmées, `history` et `gamme`. Un échafaudage indexé par NOM DE
 *    MARQUE appariait le texte d'histoire avec la source de la gamme et
 *    s'apprêtait à écrire du texte brut dans une colonne JSON. La clé
 *    est donc (marque, colonne), ici comme dans `--lister`.
 * 2. UNE TRADUCTION DÉJÀ IMPORTÉE N'EST PLUS PÉRIMÉE. La corriger ne
 *    passe donc plus par `--perimees` : c'est à cela que sert `--fiche`.
 * 3. UNE COLONNE JSON N'EST PAS UN TEXTE. `--coudre` refuse déjà un
 *    JSON invalide ; pour une gamme, partir du français décodé et ne
 *    remplacer que `name` et `story` évite que la structure dérive.
 *
 * USAGE
 *   php tools/i18n_lot.php --lister "A.J. Fernandez,Aganorsa Leaf" > lot.json
 *   php tools/i18n_lot.php --perimees 4 > lot.json
 *   php tools/i18n_lot.php --fiche "Cohiba" pairings > lot.json
 *   php tools/i18n_lot.php --reste                 # ce qui manque encore
 *   php tools/i18n_lot.php --coudre lot.json trad.json > seg.json
 *   php tools/i18n_contenu.php --importer seg.json --forcer
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

/**
 * L'empreinte scellée de chaque traduction, par marque et par champ.
 * Même calcul que `empreinte_source()` : sha1 du français rogné.
 */
function scellements(PDO $db): array {
    $out = [];
    try {
        $q = $db->query("SELECT entite_id, champ, lang, source_hash FROM translation_status
                          WHERE entite = 'brands'");
        foreach ($q as $r) $out[$r['entite_id']][$r['champ']][$r['lang']] = $r['source_hash'];
    } catch (Throwable $e) {
        fwrite(STDERR, "translation_status absente — appliquer la migration 009.\n");
        exit(2);
    }
    return $out;
}

/** Les langues d'un segment qui restent à refaire. */
function langues_a_refaire(array $ligne, string $champ, array $scelle): array {
    $h = sha1(trim((string)$ligne[$champ]));
    $out = [];
    foreach (LANGUES as $l) {
        $v  = trim((string)($ligne[$champ . '_' . $l] ?? ''));
        $hs = $scelle[$ligne['name']][$champ][$l] ?? null;
        // Vide, jamais scellée, ou scellée sur un français qui a changé.
        if ($v === '' || $v === '[]' || $hs === null || $hs !== $h) $out[] = $l;
    }
    return $out;
}

// ── --perimees : ce que la refonte doit reprendre ───────
$i = array_search('--perimees', $argv, true);
if ($i !== false) {
    $max    = ctype_digit((string)($argv[$i + 1] ?? '')) ? (int)$argv[$i + 1] : 0;
    $scelle = scellements($db);

    $lot = [];
    foreach ($db->query('SELECT * FROM brands ORDER BY name') as $r) {
        foreach (COLONNES as $c) {
            $fr = trim((string)$r[$c]);
            if ($fr === '' || $fr === '[]') continue;
            $langs = langues_a_refaire($r, $c, $scelle);
            if ($langs) $lot[] = ['marque' => $r['name'], 'colonne' => $c,
                                  'langues' => $langs, 'source' => $r[$c]];
        }
    }
    // Les plus courts d'abord : un lot se choisit par la taille, et les
    // onze lots de la refonte ont tous ete pris dans cet ordre.
    usort($lot, fn($a, $b) => mb_strlen($a['source']) <=> mb_strlen($b['source']));
    if ($max > 0) $lot = array_slice($lot, 0, $max);

    echo json_encode($lot, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES), "\n";
    fwrite(STDERR, sprintf("%d segment(s), %d traduction(s), %d caracteres source.\n",
        count($lot),
        array_sum(array_map(fn($s) => count($s['langues']), $lot)),
        array_sum(array_map(fn($s) => mb_strlen($s['source']), $lot))));
    exit(0);
}

// ── --fiche : un segment precis, perime ou non ──────────
//
// Une traduction qui vient d'etre importee est scellee : elle ne figure
// plus dans --perimees. La corriger demande donc de reconstituer sa cle
// depuis la base, ce que fait cette entree.
$i = array_search('--fiche', $argv, true);
if ($i !== false) {
    $nom = (string)($argv[$i + 1] ?? '');
    $col = (string)($argv[$i + 2] ?? '');
    $st  = $db->prepare('SELECT * FROM brands WHERE name = ?');
    $st->execute([$nom]);
    $r = $st->fetch(PDO::FETCH_ASSOC);
    if (!$r) { fwrite(STDERR, "ABANDON : marque introuvable — $nom\n"); exit(2); }

    $colonnes = $col !== '' ? [$col] : COLONNES;
    $scelle   = scellements($db);
    $lot = [];
    foreach ($colonnes as $c) {
        if (!array_key_exists($c, $r)) { fwrite(STDERR, "ABANDON : colonne inconnue — $c\n"); exit(2); }
        $fr = trim((string)$r[$c]);
        if ($fr === '' || $fr === '[]') continue;
        // Perimee ou non : on veut pouvoir corriger une traduction juste
        // scellee. Les langues a refaire sont donnees a titre indicatif.
        $langs = langues_a_refaire($r, $c, $scelle) ?: LANGUES;
        $lot[] = ['marque' => $r['name'], 'colonne' => $c,
                  'langues' => $langs, 'source' => $r[$c]];
    }
    if (!$lot) { fwrite(STDERR, "ABANDON : aucune colonne traduisible remplie.\n"); exit(2); }

    echo json_encode($lot, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES), "\n";
    fwrite(STDERR, sprintf("%d segment(s) pour %s.\n", count($lot), $nom));
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
        // Les langues attendues sont celles que le segment demande : une
        // fiche dont seul l'arabe est perime ne reclame pas les cinq.
        // Sans « langues », on exige les cinq, comme avant.
        $attendues = $seg['langues'] ?? LANGUES;
        foreach ($attendues as $l) {
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
            foreach ($attendues as $l) {
                if (json_decode($t[$l], true) === null) {
                    fwrite(STDERR, sprintf("ABANDON : segment %d (%s / %s / %s) n'est pas du JSON valide.\n",
                        $k, $seg['marque'], $seg['colonne'], $l));
                    exit(2);
                }
            }
            // La STRUCTURE doit survivre a la traduction : meme nombre
            // d'entrees que le francais. Une gamme qui perd un module
            // s'affiche amputee sans que rien ne le signale.
            $nFr = count(json_decode($seg['source'], true) ?: []);
            foreach ($attendues as $l) {
                $n = count(json_decode($t[$l], true) ?: []);
                if ($n !== $nFr) {
                    fwrite(STDERR, sprintf("ABANDON : segment %d (%s / %s / %s) — %d entrees contre %d en francais.\n",
                        $k, $seg['marque'], $seg['colonne'], $l, $n, $nFr));
                    exit(2);
                }
            }
        }
        $cle = 'brands.' . $seg['colonne'];
        $out[$cle][$seg['source']] = array_intersect_key($t, array_flip($attendues));
    }
    echo json_encode($out, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES), "\n";
    fwrite(STDERR, sprintf("%d segment(s) recousu(s).\n", count($lot)));
    exit(0);
}

fwrite(STDERR, "Usage : --lister \"Nom,Nom\" | --perimees [n] | --fiche \"Nom\" [colonne]\n"
             . "        | --reste | --coudre lot.json trad.json\n");
exit(2);
