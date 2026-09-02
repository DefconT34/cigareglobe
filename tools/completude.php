<?php
// ════════════════════════════════════════════════════════
// completude.php — Où en sont les fiches, et par quoi commencer
// ────────────────────────────────────────────────────────
//   php tools/completude.php              état général + plan de travail
//   php tools/completude.php --pays=france   la feuille de route d'un pays
//   php tools/completude.php --quota=80      un plan plus large
//   php tools/completude.php --autotest      les cas construits
//
// CE QUE CET OUTIL N'EST PAS : un remplisseur. Il ne devine ni horaire
// ni coordonnée — on a cherché, il n'y avait rien à extraire (voir
// backend/completude_lib.php). Il dit ce qui manque, où, et dans quel
// ordre s'y prendre. La saisie se fait dans l'administration, onglet
// Adresses.
// ════════════════════════════════════════════════════════

// Sous PowerShell, cp1252 fait echouer l'affichage des accents.
if (PHP_SAPI === 'cli' && function_exists('stream_set_write_buffer')) {
    @stream_set_write_buffer(STDOUT, 0);
}
if (PHP_SAPI === 'cli') { @ini_set('default_charset', 'UTF-8'); }

require_once __DIR__ . '/../backend/completude_lib.php';

/* ── Les cas construits ──────────────────────────────────
   Une base propre ne prouve pas qu'un barème fonctionne : il faut lui
   soumettre des fiches dont on connaît d'avance la note. */
function comp_autotest(): int {
    $cas = [
        // [libelle, fiche, score attendu, champs manquants attendus]
        ['fiche vide', [], 0, ['hours','coords','description','photo','website','phone']],
        ['fiche complete', [
            'hours' => '10h-22h', 'website' => 'https://x.test', 'phone' => '+225 00',
            'lat' => '5.32', 'lon' => '-4.02',
            'description' => str_repeat('a', COMPLETUDE_DESC_MIN), 'photos_reelles' => 2,
        ], 100, []],
        // UNE LATITUDE SEULE NE PLACE RIEN. Compter une demi-position
        // ferait passer pour a moitie faite une fiche inutilisable.
        ['latitude seule', ['lat' => '5.32'], 0, ['hours','coords','description','photo','website','phone']],
        // La description est prise a UN caractere pres : c'est le seul
        // critere du bareme qui soit un seuil, donc le seul ou une
        // inegalite mal ecrite passerait inapercue.
        ['description a la limite basse',
         ['description' => str_repeat('a', COMPLETUDE_DESC_MIN - 1)], 0,
         ['hours','coords','description','photo','website','phone']],
        ['description tout juste suffisante',
         ['description' => str_repeat('a', COMPLETUDE_DESC_MIN)], 20,
         ['hours','coords','photo','website','phone']],
        // Les espaces ne sont pas du contenu.
        ['champs remplis d\'espaces', ['hours' => '   ', 'website' => "\t", 'phone' => ' '], 0,
         ['hours','coords','description','photo','website','phone']],
        // Une photo de remplacement n'est pas une photo : le comptage se
        // fait en amont, mais zero doit valoir zero.
        ['aucune photo reelle', ['photos_reelles' => 0], 0,
         ['hours','coords','description','photo','website','phone']],
        ['horaires seuls', ['hours' => '10h-22h'], 25, ['coords','description','photo','website','phone']],
    ];

    $echecs = 0;
    foreach ($cas as [$titre, $fiche, $attendu, $manqueAttendu]) {
        $r = completude_fiche($fiche);
        $okScore  = $r['score'] === $attendu;
        $okManque = $r['manque'] === $manqueAttendu;
        if (!$okScore || !$okManque) {
            $echecs++;
            printf("  [KO] %-38s score %d (attendu %d)\n", $titre, $r['score'], $attendu);
            if (!$okManque) printf("       manque : %s\n       attendu : %s\n",
                implode(',', $r['manque']), implode(',', $manqueAttendu));
        } else {
            printf("  [ok] %-38s %d/100\n", $titre, $r['score']);
        }
    }

    // Les coordonnees. Le zero exact est le piege : c'est ce que rend un
    // champ vide mal converti, et (0,0) tombe dans le golfe de Guinee —
    // une fiche s'y retrouverait SITUEE alors qu'elle ne l'est pas.
    $coords = [
        ['Abidjan',            '5.3200',  '-4.0200', true],
        ['pole sud',           '-90',     '0',       true],
        ['zero exact refuse',  '0',       '0',       false],
        ['zero approche refuse','0.00001','0.00002', false],
        ['latitude hors bornes','91',     '10',      false],
        ['longitude hors bornes','10',    '181',     false],
        ['vide',               '',        '',        false],
        ['texte',              'nord',    'ouest',   false],
        ['null',               null,      null,      false],
    ];
    foreach ($coords as [$t, $la, $lo, $att]) {
        $got = completude_coord_valide($la, $lo);
        if ($got !== $att) { $echecs++; printf("  [KO] coord %-26s %s\n", $t, var_export($got, true)); }
        else               { printf("  [ok] coord %-26s %s\n", $t, $att ? 'acceptee' : 'refusee'); }
    }

    // Le bareme fait bien cent. Sans ce controle, ajouter un critere
    // sans retoucher les poids rendrait des scores au-dessus de 100.
    $somme = array_sum(COMPLETUDE_BAREME);
    if ($somme !== 100) { $echecs++; printf("  [KO] le bareme totalise %d, pas 100\n", $somme); }
    else                { printf("  [ok] %-38s %d\n", 'le bareme totalise cent', $somme); }

    // Chaque critere a son libelle : un plan de travail qui afficherait
    // « photo » au lieu de « photo reelle » se lit mal, mais un critere
    // SANS libelle afficherait une clef nue.
    $sansNom = array_diff(array_keys(COMPLETUDE_BAREME), array_keys(COMPLETUDE_NOMS));
    if ($sansNom) { $echecs++; printf("  [KO] criteres sans libelle : %s\n", implode(', ', $sansNom)); }
    else          { printf("  [ok] %-38s\n", 'chaque critere a son libelle'); }

    printf("\n%s\n", $echecs ? "$echecs echec(s)" : 'Tous les cas construits passent.');
    return $echecs ? 1 : 0;
}

/* ── Ligne de commande ───────────────────────────────────── */
if (PHP_SAPI !== 'cli') { http_response_code(404); exit; }

$opts  = getopt('', ['pays::', 'quota::', 'autotest']);
if (isset($opts['autotest'])) exit(comp_autotest());

$db = getDB();

if (isset($opts['pays']) && $opts['pays'] !== false) {
    $pays   = (string)$opts['pays'];
    $fiches = completude_fiches($db, $pays);
    if (!$fiches) { fwrite(STDERR, "Aucune adresse pour « $pays ».\n"); exit(1); }

    printf("\n%s — %d adresse(s)\n", strtoupper($pays), count($fiches));
    echo str_repeat('─', 78), "\n";
    printf("%-4s %-34s %5s  %s\n", 'id', 'nom', 'score', 'a completer');
    echo str_repeat('─', 78), "\n";
    foreach ($fiches as $f) {
        $noms = array_map(fn($c) => COMPLETUDE_NOMS[$c], $f['manque']);
        printf("%-4d %-34s %4d%%  %s\n",
               $f['id'], mb_strimwidth($f['name'], 0, 34, '…'), $f['score'],
               $noms ? implode(', ', $noms) : '— rien');
    }
    $moy = (int)round(array_sum(array_column($fiches, 'score')) / count($fiches));
    echo str_repeat('─', 78), "\n";
    printf("moyenne %d%%  ·  saisie dans l'administration, onglet Adresses\n\n", $moy);
    exit(0);
}

// ── État général ────────────────────────────────────────
$g = completude_globale($db);
printf("\nCOMPLÉTUDE DES FICHES — %d adresses\n", $g['n']);
echo str_repeat('═', 62), "\n";
printf("  moyenne          %d%%\n", $g['moyenne']);
printf("  fiches completes %d\n\n", $g['completes']);
foreach (COMPLETUDE_BAREME as $champ => $poids) {
    $n = $g['champs'][$champ] ?? 0;
    printf("  %-20s %4d / %-4d  %3d%%   (pese %d)\n",
           COMPLETUDE_NOMS[$champ], $n, $g['n'],
           $g['n'] ? (int)round($n * 100 / $g['n']) : 0, $poids);
}

$quota = isset($opts['quota']) && $opts['quota'] !== false ? max(1, (int)$opts['quota']) : 50;
$plan  = completude_plan($db, $quota);
printf("\nPAR OÙ COMMENCER — %d adresses dans %d pays\n", $plan['adresses'], count($plan['pays']));
echo str_repeat('═', 62), "\n";
echo "Un pays entier avant de passer au suivant : une page qui porte\n";
echo "vingt fiches completes vaut mieux que vingt pages qui en portent une.\n\n";
printf("%-16s %5s %9s %s\n", 'pays', 'n', 'moyenne', 'commande');
echo str_repeat('─', 62), "\n";
foreach ($plan['pays'] as $p) {
    printf("%-16s %5d %8d%%  php tools/completude.php --pays=%s\n",
           $p['pays'], $p['n'], $p['moyenne'], $p['pays']);
}
echo "\n";
