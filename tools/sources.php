<?php
// ════════════════════════════════════════════════════════
// sources.php — Les sources citées existent-elles ?
// ────────────────────────────────────────────────────────
//   php tools/sources.php              l'état
//   php tools/sources.php --verifier   compare au sceau (code 1 si dérive)
//   php tools/sources.php --figer      enregistre l'état comme référence
//   php tools/sources.php --autotest   les cas construits
//
// CE QUI A OUVERT CE CHANTIER. En cherchant le site officiel de trois
// établissements d'Abidjan, deux des domaines cités dans leur colonne
// `source` se sont révélés ne pas exister : `golfabidjan.ci` ne résout
// pas, `bocachicaabidjan.com` rend 404. Le contrôle systématique a
// trouvé VINGT-HUIT domaines inexistants, cités par SOIXANTE-QUINZE
// fiches sur 498 — dont quarante-huit pour le seul `lcdh-locator.com`.
//
// La doctrine du projet est « aucune note sans source ». Une source qui
// n'existe pas est pire qu'une source absente : elle donne l'apparence
// de la vérification. C'est ce que cet outil mesure.
//
// CE QU'IL NE DIT PAS. Qu'un domaine n'existe pas ne prouve pas que
// l'établissement n'existe pas — une Casa del Habano est bien réelle,
// même citée depuis un domaine inventé. L'outil mesure la traçabilité,
// pas la véracité.
//
// POURQUOI LE DNS ET NON UNE REQUÊTE HTTP. Mesuré : depuis cette
// machine, `ethiopianairlines.com`, `thebreakers.com` et
// `serenahotels.com` rendent tous « 000 » en HTTPS, y compris avec un
// en-tête de navigateur — ils sont pourtant bien réels. Un contrôle
// HTTP aurait donc accusé quarante-six domaines au lieu de vingt-huit,
// et l'accusation aurait été fausse une fois sur trois. Le DNS, lui,
// distingue « ce domaine n'existe pas » de « ce site me refuse ».
// ════════════════════════════════════════════════════════

require_once __DIR__ . '/../backend/config.php';

const SOURCES_SCEAU = __DIR__ . '/../sql/sources_domaines.json';

/**
 * Les domaines nommés dans un champ `source`.
 *
 * Le champ est du TEXTE LIBRE : « cigarjournal.com Golden Band Awards
 * 2021 », « baab.ci, Facebook », « fourni par l'établissement », « PDF
 * officiel Habanos S.A. ». On en tire les noms de domaine et rien
 * d'autre — une mention qui n'en contient aucun n'est pas une faute,
 * c'est une source non électronique.
 */
function sources_domaines_du_champ(string $champ): array {
    $out = [];
    // Un domaine : des étiquettes séparées par des points, une extension
    // de deux lettres au moins, éventuellement composée (.co.uk, .com.py).
    if (preg_match_all('~\b((?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z]{2,})\b~i', $champ, $m)) {
        foreach ($m[1] as $d) {
            $d = strtolower(rtrim($d, '.'));
            // « S.A. » et « Habanos S.A. » ne sont pas des domaines : on
            // écarte ce dont la dernière étiquette n'est pas une vraie
            // extension plausible (au moins deux lettres, et pas un mot
            // isolé de une lettre avant le point).
            $bouts = explode('.', $d);
            if (count($bouts) < 2) continue;
            if (strlen(end($bouts)) < 2) continue;
            if (strlen($bouts[0]) < 2) continue;
            $out[$d] = true;
        }
    }
    return array_keys($out);
}

/** Le domaine existe-t-il ? A ou AAAA suffit. */
function sources_resout(string $domaine): bool {
    return @checkdnsrr($domaine, 'A') || @checkdnsrr($domaine, 'AAAA');
}

/** Tous les domaines cités, et les fiches qui les citent. */
function sources_inventaire(PDO $db): array {
    $inv = [];
    foreach ($db->query("SELECT id, source FROM lounges WHERE source <> ''")->fetchAll(PDO::FETCH_ASSOC) as $r) {
        foreach (sources_domaines_du_champ((string)$r['source']) as $d) {
            $inv[$d][] = (int)$r['id'];
        }
    }
    ksort($inv);
    return $inv;
}

/** Le sceau versionné, ou null s'il n'existe pas encore. */
function sources_sceau(): ?array {
    if (!is_file(SOURCES_SCEAU)) return null;
    $d = json_decode((string)file_get_contents(SOURCES_SCEAU), true);
    return is_array($d) && isset($d['domaines']) ? $d : null;
}

/**
 * L'écart entre ce que la base cite et ce que le sceau connaît.
 *
 * DEUX DÉRIVES, ET ELLES N'ONT PAS LE MÊME SENS :
 *   · un domaine cité que le sceau ignore — une source est apparue sans
 *     que personne ne l'ait regardée. C'est ce qu'on veut attraper ;
 *   · un domaine scellé « résout » qui ne résout plus — le domaine est
 *     tombé depuis. Ce n'est pas une faute de saisie, mais la fiche
 *     renvoie désormais dans le vide.
 */
function sources_ecarts(array $inventaire, array $sceau): array {
    $connus   = $sceau['domaines'];
    $nouveaux = array_values(array_diff(array_keys($inventaire), array_keys($connus)));
    $disparus = array_values(array_diff(array_keys($connus), array_keys($inventaire)));
    return ['nouveaux' => $nouveaux, 'plus_cites' => $disparus];
}

/** Combien de fiches citent au moins un domaine marqué inexistant. */
function sources_fiches_sans_source(array $inventaire, array $sceau): array {
    $ids = [];
    foreach ($sceau['domaines'] as $d => $etat) {
        if (($etat['dns'] ?? '') !== 'inexistant') continue;
        foreach ($inventaire[$d] ?? [] as $id) $ids[$id] = true;
    }
    return array_keys($ids);
}

/* ── Les cas construits ──────────────────────────────────
   On éprouve l'EXTRACTION, pas le DNS : un test qui interroge le réseau
   échoue le jour où le réseau tousse, et n'aurait alors rien mesuré du
   code. */
function sources_autotest(): int {
    $cas = [
        ['cigarjournal.com Golden Band Awards 2021', ['cigarjournal.com']],
        ['baab.ci, Facebook',                        ['baab.ci']],
        ['baab.ci, bocachicaabidjan.com',            ['baab.ci', 'bocachicaabidjan.com']],
        ['TripAdvisor, avis vérifiés',               []],
        ['fourni par l\'établissement',              []],
        // « S.A. » ressemble a un domaine et n'en est pas : c'est le
        // faux positif qui aurait sali l'inventaire de 107 fiches.
        ['PDF officiel Habanos S.A.',                []],
        ['hotel-lutetia.com',                        ['hotel-lutetia.com']],
        ['thebristol.com.pa',                        ['thebristol.com.pa']],
        ['jjfox.co.uk officiel',                     ['jjfox.co.uk']],
        // La casse ne fait pas deux domaines.
        ['Davidoff.com et DAVIDOFF.COM',             ['davidoff.com']],
        ['',                                          []],
    ];
    $echecs = 0;
    foreach ($cas as [$champ, $attendu]) {
        $got = sources_domaines_du_champ($champ);
        sort($got); sort($attendu);
        if ($got !== $attendu) {
            $echecs++;
            printf("  [KO] %-42s -> %s (attendu %s)\n",
                   mb_strimwidth($champ, 0, 42, '…'), json_encode($got), json_encode($attendu));
        } else {
            printf("  [ok] %-42s -> %s\n", mb_strimwidth($champ, 0, 42, '…'),
                   $got ? implode(',', $got) : '—');
        }
    }
    // CONTRE-EPREUVE DU CONTROLE DNS lui-meme : sans elle, une fonction
    // qui rendrait toujours `true` passerait pour un controle.
    if (!sources_resout('google.com')) { $echecs++; echo "  [KO] google.com devrait resoudre\n"; }
    else                               { echo "  [ok] un domaine reel resout\n"; }
    if (sources_resout('domaine-qui-ne-peut-pas-exister-9f3a2b.invalid')) {
        $echecs++; echo "  [KO] un domaine impossible ne devrait pas resoudre\n";
    } else { echo "  [ok] un domaine impossible ne resout pas\n"; }

    // CONTRE-EPREUVE DE LA COMPARAISON AU SCEAU. Un controle qui vient
    // d'etre fige rend toujours « rien a signaler » : c'est le moment ou
    // il ressemble le plus a un controle qui ne controle rien. On lui
    // soumet donc un inventaire ou l'on SAIT ce qu'il doit trouver.
    $sceauFactice = ['domaines' => [
        'connu-vivant.test' => ['dns' => 'resout',     'fiches' => 2],
        'connu-mort.test'   => ['dns' => 'inexistant', 'fiches' => 1],
        'plus-cite.test'    => ['dns' => 'resout',     'fiches' => 1],
    ]];
    $invFactice = [
        'connu-vivant.test' => [10, 11],
        'connu-mort.test'   => [12],
        'apparu.test'       => [13],          // absent du sceau
    ];
    $e = sources_ecarts($invFactice, $sceauFactice);
    if ($e['nouveaux'] !== ['apparu.test']) {
        $echecs++; printf("  [KO] nouveau domaine non repere : %s\n", json_encode($e['nouveaux']));
    } else { echo "  [ok] un domaine apparu hors sceau est repere\n"; }
    if ($e['plus_cite'] ?? $e['plus_cites'] ?? null) {
        $ok = ($e['plus_cites'] === ['plus-cite.test']);
        if (!$ok) { $echecs++; printf("  [KO] domaine plus cite : %s\n", json_encode($e['plus_cites'])); }
        else      { echo "  [ok] un domaine qui n'est plus cite est vu\n"; }
    } else { $echecs++; echo "  [KO] le domaine plus cite n'est pas vu\n"; }

    $sans = sources_fiches_sans_source($invFactice, $sceauFactice);
    if ($sans !== [12]) {
        $echecs++; printf("  [KO] fiches sans source traçable : %s (attendu [12])\n", json_encode($sans));
    } else { echo "  [ok] seule la fiche citant un domaine mort est comptee\n"; }

    printf("\n%s\n", $echecs ? "$echecs echec(s)" : 'Tous les cas construits passent.');
    return $echecs ? 1 : 0;
}

/* ── Ligne de commande ─────────────────────────────────────
   La constante permet à la campagne d'inclure ce fichier pour ses
   fonctions SANS déclencher l'outil — même garde que i18n_check.php.
   Sans elle, un `require` depuis les tests lançait l'état complet puis
   sortait, emportant la campagne avec lui. */
if (PHP_SAPI !== 'cli' && !defined('SOURCES_INCLUDE')) { http_response_code(404); exit; }
if (defined('SOURCES_INCLUDE')) return;

$opts = getopt('', ['verifier', 'figer', 'autotest']);
if (isset($opts['autotest'])) exit(sources_autotest());

$db  = getDB();
$inv = sources_inventaire($db);

// ── Figer ────────────────────────────────────────────────
if (isset($opts['figer'])) {
    $dom = [];
    foreach ($inv as $d => $ids) {
        $dom[$d] = ['dns' => sources_resout($d) ? 'resout' : 'inexistant', 'fiches' => count($ids)];
        printf("  %-34s %-11s %3d fiche(s)\n", $d, $dom[$d]['dns'], count($ids));
    }
    file_put_contents(SOURCES_SCEAU, json_encode(
        ['fige_le' => date('Y-m-d'), 'domaines' => $dom],
        JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE) . "\n");
    printf("\nSceau écrit : %s (%d domaines)\n", basename(SOURCES_SCEAU), count($dom));
    exit(0);
}

$sceau = sources_sceau();

// ── Vérifier ─────────────────────────────────────────────
if (isset($opts['verifier'])) {
    if (!$sceau) { fwrite(STDERR, "Aucun sceau. Lancer --figer d'abord.\n"); exit(1); }
    $e = sources_ecarts($inv, $sceau);
    $code = 0;
    if ($e['nouveaux']) {
        $code = 1;
        echo "Domaines cités que le sceau ignore — à regarder puis figer :\n";
        foreach ($e['nouveaux'] as $d) {
            printf("  %-34s %-11s %d fiche(s)\n", $d,
                   sources_resout($d) ? 'resout' : 'INEXISTANT', count($inv[$d]));
        }
    }
    // Un domaine scellé « résout » qui ne résout plus : la fiche renvoie
    // désormais dans le vide, sans que rien ne l'ait dit.
    $tombes = [];
    foreach ($sceau['domaines'] as $d => $etat) {
        if (($etat['dns'] ?? '') === 'resout' && isset($inv[$d]) && !sources_resout($d)) $tombes[] = $d;
    }
    if ($tombes) { $code = 1; echo "\nDomaines tombés depuis le sceau :\n";
                   foreach ($tombes as $d) printf("  %s (%d fiches)\n", $d, count($inv[$d])); }
    if ($code === 0) printf("Les %d domaines cités sont tous au sceau, et rien n'est tombé.\n", count($inv));
    exit($code);
}

// ── État ─────────────────────────────────────────────────
printf("\nSOURCES CITÉES — %d domaines, %d fiches\n", count($inv),
       (int)$db->query("SELECT COUNT(*) FROM lounges WHERE source <> ''")->fetchColumn());
echo str_repeat('═', 62), "\n";
if (!$sceau) { echo "Aucun sceau. Lancer --figer pour en établir un.\n"; exit(0); }

$sans = sources_fiches_sans_source($inv, $sceau);
$morts = array_filter($sceau['domaines'], fn($e) => ($e['dns'] ?? '') === 'inexistant');
printf("  domaines inexistants : %d sur %d\n", count($morts), count($sceau['domaines']));
printf("  fiches concernées    : %d\n\n", count($sans));
uasort($morts, fn($a, $b) => $b['fiches'] <=> $a['fiches']);
foreach ($morts as $d => $e) printf("  %-34s %3d fiche(s)\n", $d, $e['fiches']);
echo "\nUn domaine inexistant ne dit rien de l'établissement : il dit que\n";
echo "la fiche n'est pas traçable. Voir tools/sources.php pour la nuance.\n\n";
