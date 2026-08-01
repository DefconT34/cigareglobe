<?php
// ════════════════════════════════════════════════════════
// tools/i18n_check.php — Controle des traductions
// ────────────────────────────────────────────────────────
// Verifie assets/js/i18n.js : toutes les langues portent-elles les
// memes cles, et quelles valeurs sont restees en francais ?
//
//   php tools/i18n_check.php            resume
//   php tools/i18n_check.php --details  liste les valeurs suspectes
//
// Code de sortie : 0 si les cles sont a parite, 1 sinon. Une valeur
// identique au francais n'est PAS une erreur — beaucoup de termes ne se
// traduisent pas (noms propres, mots communs a deux langues) : elles
// sont signalees, jamais bloquantes.
//
// Appele aussi par tests/run.php : la parite est verifiee a chaque
// lancement de la suite, sans navigateur.
// ════════════════════════════════════════════════════════

if (PHP_SAPI !== 'cli' && !defined('I18N_CHECK_INCLUDE')) { http_response_code(404); exit; }

/**
 * Extrait les traductions de i18n.js : ['fr' => ['cle' => 'valeur', …], …].
 *
 * Le fichier n'est pas du JSON — on repere les blocs de langue par leur
 * indentation (« <lang>: { » a deux espaces, fermé par « }, ») plutot
 * que par des numeros de ligne, qui bougeraient a la moindre edition.
 */
function i18n_parse(string $chemin): array {
    $lignes = explode("\n", file_get_contents($chemin));
    $out = [];
    $langue = null;

    foreach ($lignes as $l) {
        if ($langue === null) {
            if (preg_match('/^  ([a-z]{2})\s*:\s*\{\s*$/', $l, $m)) {
                $langue = $m[1];
                $out[$langue] = [];
            }
            continue;
        }
        if (preg_match('/^  \},?\s*$/', $l)) { $langue = null; continue; }

        // Plusieurs paires peuvent partager une ligne (« a:'x', b:'y', »).
        if (preg_match_all('/([A-Za-z_][A-Za-z0-9_]*)\s*:\s*(["\'])(.*?)(?<!\\\\)\2/', $l, $m, PREG_SET_ORDER)) {
            // Les valeurs sont des litteraux JavaScript : leurs
            // echappements doivent etre rendus, sinon une apostrophe
            // ressortirait precedee de sa barre oblique.
            foreach ($m as $x) {
                $out[$langue][$x[1]] = stripcslashes($x[3]);
            }
        }
    }
    return $out;
}

/**
 * Ecarts de cles entre le francais et chaque autre langue.
 * Retourne ['en' => ['manquantes' => [...], 'en_trop' => [...]], …].
 */
function i18n_ecarts(array $trad): array {
    $ref = array_keys($trad['fr'] ?? []);
    $out = [];
    foreach ($trad as $l => $paires) {
        if ($l === 'fr') continue;
        $out[$l] = [
            'manquantes' => array_values(array_diff($ref, array_keys($paires))),
            'en_trop'    => array_values(array_diff(array_keys($paires), $ref)),
        ];
    }
    return $out;
}

/** Valeurs identiques au francais (signal, pas erreur). */
function i18n_identiques(array $trad, string $langue): array {
    $out = [];
    foreach ($trad['fr'] ?? [] as $k => $v) {
        if (mb_strlen($v) <= 2) continue;
        if (($trad[$langue][$k] ?? null) === $v) $out[$k] = $v;
    }
    return $out;
}

/**
 * Couverture des traductions en base : pour chaque colonne « _xx », la
 * part de lignes remplies parmi celles qui ont une source francaise.
 * Sert de compteur d'avancement au lot F4 (voir docs/i18n.md).
 */
function i18n_couverture_base(PDO $db): array {
    $out = [];
    foreach ($db->query('SHOW TABLES') as $r) {
        $t = array_values($r)[0];
        $cols = [];
        foreach ($db->query("DESCRIBE `$t`") as $c) $cols[] = $c['Field'];

        foreach ($cols as $c) {
            if (!preg_match('/^(.*)_(en|es|de|zh|ar)$/', $c, $m)) continue;
            $source = $m[1];
            if (!in_array($source, $cols, true)) {         // colonne orpheline
                $out[$t][$source][$m[2]] = null;
                continue;
            }
            $base = (int)$db->query(
                "SELECT COUNT(*) FROM `$t` WHERE `$source` IS NOT NULL AND `$source` <> ''"
            )->fetchColumn();
            $trad = (int)$db->query(
                "SELECT COUNT(*) FROM `$t` WHERE `$source` IS NOT NULL AND `$source` <> ''
                   AND `$c` IS NOT NULL AND `$c` <> ''"
            )->fetchColumn();
            $out[$t][$source][$m[2]] = ['source' => $base, 'traduit' => $trad];
        }
    }
    return $out;
}

// ── Exécution en ligne de commande ────────────────────────
if (PHP_SAPI === 'cli' && !defined('I18N_CHECK_INCLUDE')) {
    $fichier = dirname(__DIR__) . '/assets/js/i18n.js';
    $details = in_array('--details', $argv, true);
    $contenu = in_array('--contenu', $argv, true);

    $trad = i18n_parse($fichier);
    if (!isset($trad['fr'])) {
        fwrite(STDERR, "ABANDON : bloc « fr » introuvable dans $fichier\n");
        exit(2);
    }

    echo "CigarOdyssey — controle des traductions\n\n";
    printf("Langues : %s\n", implode(', ', array_keys($trad)));
    printf("Cles de reference (fr) : %d\n\n", count($trad['fr']));

    $ecarts  = i18n_ecarts($trad);
    $bloquant = 0;

    foreach ($ecarts as $l => $e) {
        $ident = i18n_identiques($trad, $l);
        $etat  = ($e['manquantes'] || $e['en_trop']) ? 'ECHEC' : ' OK  ';
        printf("%s %-3s %4d cles · %d manquante(s) · %d en trop · %d identique(s) au fr\n",
               $etat, $l, count($trad[$l]), count($e['manquantes']), count($e['en_trop']), count($ident));

        if ($e['manquantes']) { $bloquant++; echo "        manquantes : " . implode(', ', $e['manquantes']) . "\n"; }
        if ($e['en_trop'])    { $bloquant++; echo "        en trop    : " . implode(', ', $e['en_trop']) . "\n"; }

        if ($details && $ident) {
            foreach ($ident as $k => $v) printf("        ~ %-24s %s\n", $k, mb_substr($v, 0, 50));
        }
    }

    echo "\n";
    if ($bloquant === 0) {
        echo "Parite des cles : OK.\n";
        echo "Les valeurs identiques au francais sont signalees a titre indicatif —\n";
        echo "beaucoup de termes ne se traduisent pas. « --details » pour les lister.\n";
    } else {
        echo "Parite des cles : $bloquant ecart(s) a corriger.\n";
    }

    // ── Contenu en base (facultatif : demande une connexion) ──
    if ($contenu) {
        require_once dirname(__DIR__) . '/backend/config.php';
        echo "\n── Contenu en base ─────────────────────────────────\n";
        $cov = i18n_couverture_base(getDB());
        if (!$cov) { echo "Aucune colonne de traduction trouvee.\n"; }
        foreach ($cov as $table => $colonnes) {
            echo "$table\n";
            foreach ($colonnes as $source => $langues) {
                $ligne = [];
                foreach ($langues as $l => $d) {
                    $ligne[] = $d === null
                        ? "$l:orpheline"
                        : sprintf('%s:%d%%', $l, $d['source'] ? round(100 * $d['traduit'] / $d['source']) : 0);
                }
                $ref = reset($langues);
                printf("   %-16s %4s source  %s\n",
                       $source, $ref === null ? '—' : $ref['source'], implode('  ', $ligne));
            }
        }
        echo "\nUne colonne « orpheline » n'a pas de source francaise :\n";
        echo "elle est a supprimer, pas a traduire (voir docs/i18n.md).\n";
    }

    exit($bloquant > 0 ? 1 : 0);
}
