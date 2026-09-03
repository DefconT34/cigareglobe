<?php
// ════════════════════════════════════════════════════════
// etablissements.php — Ce qu'on peut vérifier sans y aller
// ────────────────────────────────────────────────────────
//   php tools/etablissements.php              l'audit complet
//   php tools/etablissements.php --pays=usa   un pays
//   php tools/etablissements.php --autotest   les cas construits
//
// CE QUE CET OUTIL NE FAIT PAS, ET QU'IL NE FAUT PAS LUI DEMANDER.
// Il ne vérifie pas qu'un établissement EXISTE. Personne ne peut le
// faire depuis un dépôt de code : il faudrait appeler, ou y aller.
//
// Il vérifie la COHÉRENCE — et c'est loin d'être vide, parce qu'une
// fiche fabriquée laisse presque toujours une trace mécanique :
//
//   · un indicatif téléphonique qui appartient à un autre pays ;
//   · une suite de chiffres qu'aucun opérateur n'attribue (1234, 4567,
//     6789, une même touche répétée) ;
//   · une affiliation officielle que le droit rend impossible.
//
// Une trace n'est pas une preuve : chaque signalement dit ce qui cloche
// et laisse trancher. Un hôtel peut publier son numéro de réservation
// international, et ce serait un faux positif. Mais quinze numéros en
// « 4567 » ne sont pas quinze coïncidences.
// ════════════════════════════════════════════════════════

if (PHP_SAPI !== 'cli' && !defined('ETAB_INCLUDE')) { http_response_code(404); exit; }
require_once __DIR__ . '/../backend/config.php';

/**
 * L'indicatif attendu par pays, en chiffres nus.
 *
 * POURQUOI CERTAINS EN ONT QUATRE. Le plan de numérotation nord-américain
 * (+1) couvre les États-Unis, le Canada et une douzaine d'îles : s'en
 * tenir à « 1 » ferait passer un numéro de Miami pour antillais. Pour
 * ceux-là, l'indicatif régional fait partie du repère.
 *
 * Les États-Unis et le Canada gardent « 1 » seul : ils ont des centaines
 * d'indicatifs régionaux, et les distinguer l'un de l'autre n'est pas
 * l'objet de ce contrôle.
 */
const ETAB_INDICATIF = [
    'albania'=>'355','andorra'=>'376','argentina'=>'54','armenia'=>'374','aruba'=>'297',
    'australia'=>'61','austria'=>'43','azerbaijan'=>'994','bahrain'=>'973','barbados'=>'1246',
    'belgium'=>'32','benin'=>'229','botswana'=>'267','brazil'=>'55','bulgaria'=>'359',
    'burkina'=>'226','cambodia'=>'855','cameroon'=>'237','canada'=>'1','caymanisles'=>'1345',
    'chile'=>'56','china'=>'86','colombia'=>'57','costarica'=>'506','croatia'=>'385',
    'cuba'=>'53','cyprus'=>'357','czech'=>'420','dominican'=>'1809','ecuador'=>'593',
    'egypt'=>'20','ethiopia'=>'251','france'=>'33','germany'=>'49','ghana'=>'233',
    'gibraltar'=>'350','greece'=>'30','guatemala'=>'502','guinea'=>'224','honduras'=>'504',
    'hongkong'=>'852','india'=>'91','indonesia'=>'62','iran'=>'98','israel'=>'972',
    'italy'=>'39','ivorycoast'=>'225','jamaica'=>'1876','japan'=>'81','kenya'=>'254',
    // Macao est entre dans l'atlas avec la migration 138, quand trois
    // etablissements macanais ont ete sortis de Hong Kong. Sans cette
    // ligne, la creation du pays AVEUGLAIT le controle sur ses fiches :
    // « pays hors table » se lit comme « rien a signaler ».
    'macau'=>'853',
    'kuwait'=>'965','lebanon'=>'961','luxembourg'=>'352','malaysia'=>'60','mali'=>'223',
    'mexico'=>'52','monaco'=>'377','morocco'=>'212','netherlands'=>'31','nicaragua'=>'505',
    'nigeria'=>'234','oman'=>'968','panama'=>'507','paraguay'=>'595','peru'=>'51',
    'philippines'=>'63','poland'=>'48','portugal'=>'351','qatar'=>'974','romania'=>'40',
    'russia'=>'7','saudiarabia'=>'966','senegal'=>'221','serbia'=>'381','singapore'=>'65',
    'southafrica'=>'27','southkorea'=>'82','spain'=>'34','stkitts'=>'1869','stmartin'=>'590',
    'switzerland'=>'41','taiwan'=>'886','tanzania'=>'255','thailand'=>'66','togo'=>'228',
    'turkey'=>'90','uae'=>'971','uk'=>'44','ukraine'=>'380','usa'=>'1',
    'venezuela'=>'58','vietnam'=>'84',
    // Quelques pays de l'atlas sans établissement téléphoné à ce jour.
    'jordan'=>'962','malta'=>'356','sweden'=>'46','norway'=>'47','denmark'=>'45',
    'finland'=>'358','ireland'=>'353','iceland'=>'354','estonia'=>'372','latvia'=>'371',
    'lithuania'=>'370','slovakia'=>'421','slovenia'=>'386','hungary'=>'36','greece2'=>'30',
    'newzealand'=>'64','uruguay'=>'598','bolivia'=>'591','bahamas'=>'1242','bermuda'=>'1441',
    'canaries'=>'34','italy2'=>'39',
];

/** Un numéro ramené à ses seuls chiffres. */
function etab_chiffres(string $tel): string {
    return preg_replace('/\D/', '', $tel);
}

/**
 * L'indicatif du numéro correspond-il au pays ?
 *
 * Rend null quand on ne sait pas (pas de numéro, pays hors table) —
 * « je ne sais pas » et « c'est faux » ne se confondent pas.
 */
function etab_indicatif_coherent(string $pays, string $tel): ?bool {
    $attendu = ETAB_INDICATIF[$pays] ?? null;
    $n = etab_chiffres($tel);
    if ($attendu === null || $n === '') return null;
    // Un numéro écrit sans indicatif ne dit rien : on ne le compte ni
    // pour ni contre. C'est le format local, pas une erreur de pays.
    if (!str_starts_with(trim($tel), '+')) return null;
    if (str_starts_with($n, $attendu)) return true;

    // LE PLAN NORD-AMERICAIN S'ECRIT DES DEUX FACONS. La Barbade est
    // +1 246, et se note aussi bien « +246 » : le « 1 » est le code du
    // PLAN, pas du pays. Sans cette tolerance, le controle accusait
    // trois fiches justes — Barbade, Caimans, Jamaique — et un controle
    // qui crie au loup finit par etre ignore.
    if (strlen($attendu) === 4 && $attendu[0] === '1') {
        return str_starts_with($n, substr($attendu, 1));
    }
    return false;
}

/**
 * Le numéro porte-t-il une marque de fabrication ?
 *
 * Trois motifs, tous absents des vrais plans de numérotation :
 *   · une suite croissante ou décroissante de quatre chiffres ou plus ;
 *   · une même touche répétée cinq fois ou plus ;
 *   · un groupe de deux répété quatre fois (0101010101).
 *
 * QUATRE et non trois : « 123 » se rencontre dans de vrais numéros, et
 * un seuil trop bas aurait accusé des fiches justes. Mesuré sur le
 * corpus avant de fixer le seuil.
 */
function etab_motif_fabrique(string $tel): ?string {
    $n = etab_chiffres($tel);
    if (strlen($n) < 6) return null;
    if (preg_match('/(\d)\1{4,}/', $n, $m))        return 'chiffre répété : ' . $m[0];
    // PAS D'ANCRE EN DÉBUT DE CHAÎNE : le motif suit l'indicatif, il
    // n'est donc jamais en position zéro. Ancré, ce contrôle laissait
    // passer « +225 0101010101 », le numéro fictif qui l'avait inspiré.
    if (preg_match('/(\d\d)\1{3,}/', $n, $m))      return 'motif répété : '   . $m[0];
    for ($i = 0; $i + 3 < strlen($n); $i++) {
        $suite = true; $desc = true;
        for ($j = 0; $j < 3; $j++) {
            if ((int)$n[$i+$j+1] !== (int)$n[$i+$j] + 1) $suite = false;
            if ((int)$n[$i+$j+1] !== (int)$n[$i+$j] - 1) $desc  = false;
        }
        if ($suite || $desc) return 'suite : ' . substr($n, $i, 4);
    }
    return null;
}

/**
 * Une affiliation officielle Habanos est-elle possible dans ce pays ?
 *
 * La Casa del Habano et Cohiba Atmosphere sont des réseaux franchisés
 * par Habanos S.A. : ils ne vendent QUE des cigares cubains. Or leur
 * vente reste interdite aux États-Unis — l'embargo de 1962 n'a jamais
 * été levé, et l'autorisation d'importation personnelle accordée sous
 * Obama a été supprimée le 24 septembre 2020.
 *
 * Ce n'est pas une question de vraisemblance : c'est une impossibilité
 * de droit. Et l'erreur n'est pas anodine — elle prête à un commerce
 * réel une affiliation officielle qu'il n'a pas.
 */
const ETAB_SANS_HABANOS = ['usa'];

function etab_affiliation_impossible(string $pays, string $type, string $nom): ?string {
    if (!in_array($pays, ETAB_SANS_HABANOS, true)) return null;
    $t = $type . ' ' . $nom;
    foreach (['Casa del Habano' => 'La Casa del Habano',
              'Cohiba Atmosphere' => 'Cohiba Atmosphere',
              'Habanos Specialist' => 'Habanos Specialist'] as $motif => $nomReseau) {
        if (stripos($t, $motif) !== false) {
            return $nomReseau . ' : réseau Habanos, impossible sous embargo';
        }
    }
    return null;
}

/* ── Les cas construits ──────────────────────────────────
   Une base propre ne prouve pas qu'un détecteur fonctionne. Chaque
   contrôle reçoit des cas dont on connaît d'avance la réponse, y
   compris ceux qu'il doit LAISSER PASSER — un contrôle qui accuse tout
   ne mesure rien. */
function etab_autotest(): int {
    $echecs = 0;
    $dire = function (bool $ok, string $titre, string $detail = '') use (&$echecs) {
        if (!$ok) $echecs++;
        printf("  [%s] %-52s %s\n", $ok ? 'ok' : 'KO', $titre, $detail);
    };

    // ── L'indicatif ─────────────────────────────────────
    $cas = [
        ['france',     '+33 1 30 43 36 00',  true,  'la France en +33'],
        ['ivorycoast', '+225 07 04 05 70 70', true, 'la Côte d\'Ivoire en +225'],
        ['ukraine',    '+38 044 492 7448',   true,  'l\'Ukraine ecrite +38 0xx'],
        ['usa',        '+1 202 338 5100',    true,  'les Etats-Unis en +1'],
        ['jamaica',    '+1 876 953 2650',    true,  'la Jamaique en +1 876'],
        ['jamaica',    '+876 633 2211',      true,  'la Jamaique ecrite sans le 1'],
        ['barbados',   '+246 621 0621',      true,  'la Barbade ecrite sans le 1'],
        ['caymanisles','+345 946 4666',      true,  'les Caimans ecrites sans le 1'],
        // Les erreurs REELLES trouvees dans le corpus.
        ['ecuador',    '+511 368 1572',      false, 'un numero peruvien en Equateur'],
        ['nicaragua',  '+1 305 649 4982',    false, 'un numero de Miami au Nicaragua'],
        ['jamaica',    '+1 877 956 7625',    false, 'un numero vert americain en Jamaique'],
        ['france',     '+34 91 431 05 28',   false, 'un numero espagnol en France'],
    ];
    foreach ($cas as [$p, $t, $att, $titre]) {
        $dire(etab_indicatif_coherent($p, $t) === $att, 'indicatif : ' . $titre);
    }
    // « Je ne sais pas » n'est pas « c'est faux ».
    $dire(etab_indicatif_coherent('france', '01 30 43 36 00') === null,
          'indicatif : un numero sans + ne dit rien');
    $dire(etab_indicatif_coherent('paysinconnu', '+33 1 2') === null,
          'indicatif : un pays hors table ne dit rien');
    $dire(etab_indicatif_coherent('france', '') === null,
          'indicatif : pas de numero, pas d\'avis');

    // ── Les motifs de fabrication ───────────────────────
    $fab = [
        ['+225 0101010101',   true,  'motif a deux chiffres repete'],
        ['+39 051 234 567',   true,  'suite croissante 2345'],
        ['+504 2235 6789',    true,  'suite croissante 6789'],
        ['+374 10 543 210',   true,  'suite decroissante 5432'],
        ['+212 660 44 44 44', true,  'meme chiffre six fois'],
        // Ceux qu'il doit laisser tranquilles.
        ['+33 1 30 43 36 00', false, 'un vrai numero francais'],
        ['+225 27 22 51 05 09', false, 'un vrai numero ivoirien'],
        ['+1 212 751 9060',   false, 'un vrai numero new-yorkais'],
        ['+81 3 3476 3000',   false, 'trois zeros ne sont pas une suite'],
        ['+34 91 431 05 28',  false, 'un vrai numero espagnol'],
    ];
    foreach ($fab as [$t, $att, $titre]) {
        $dire((etab_motif_fabrique($t) !== null) === $att, 'fabrication : ' . $titre,
              (string)etab_motif_fabrique($t));
    }

    // ── L'affiliation ───────────────────────────────────
    $dire(etab_affiliation_impossible('usa', 'La Casa del Habano Officielle', 'X') !== null,
          'affiliation : une Casa del Habano aux Etats-Unis');
    $dire(etab_affiliation_impossible('usa', 'Cohiba Atmosphere Officiel', 'X') !== null,
          'affiliation : un Cohiba Atmosphere aux Etats-Unis');
    $dire(etab_affiliation_impossible('usa', 'Cigar Lounge', 'Casa de Montecristo') === null,
          'affiliation : Casa de Montecristo seul ne suffit pas');
    $dire(etab_affiliation_impossible('cuba', 'La Casa del Habano Officielle', 'X') === null,
          'affiliation : la meme a Cuba est normale');
    $dire(etab_affiliation_impossible('france', 'La Casa del Habano Officielle', 'X') === null,
          'affiliation : et en France aussi');

    printf("\n%s\n", $echecs ? "$echecs echec(s)" : 'Tous les cas construits passent.');
    return $echecs ? 1 : 0;
}

/* ── Ligne de commande ─────────────────────────────────── */
if (PHP_SAPI === 'cli' && !defined('ETAB_INCLUDE')) {
    if (PHP_SAPI === 'cli') @ini_set('default_charset', 'UTF-8');
    $opt = getopt('', ['pays::', 'autotest', 'figer', 'verifier']);
    if (isset($opt['autotest'])) exit(etab_autotest());

    $db  = getDB();
    $sql = "SELECT id, country_id, name, city, type, phone, source
              FROM lounges WHERE is_verified = 1";
    $args = [];
    if (isset($opt['pays']) && $opt['pays'] !== false) { $sql .= " AND country_id = ?"; $args[] = $opt['pays']; }
    $q = $db->prepare($sql . " ORDER BY country_id, name");
    $q->execute($args);
    $L = $q->fetchAll(PDO::FETCH_ASSOC);

    $ind = []; $fab = []; $aff = []; $sansTel = 0; $horsTable = [];
    foreach ($L as $l) {
        $tel = trim((string)$l['phone']);
        if ($tel === '') $sansTel++;
        if (!isset(ETAB_INDICATIF[$l['country_id']])) $horsTable[$l['country_id']] = true;

        if (etab_indicatif_coherent($l['country_id'], $tel) === false) $ind[] = $l;
        if ($tel !== '' && etab_motif_fabrique($tel) !== null)         $fab[] = $l;
        $a = etab_affiliation_impossible($l['country_id'], (string)$l['type'], (string)$l['name']);
        if ($a !== null) { $l['motif'] = $a; $aff[] = $l; }
    }

    // -- Le cliquet ---------------------------------------
    // Ces chiffres ne doivent que DESCENDRE. Une fiche ajoutee demain
    // avec un numero en « 4567 » ferait remonter le compteur, et la
    // campagne le dirait — sans quoi on aurait corrige quarante-six
    // fiches pour en laisser entrer quarante-sept.
    $sceau  = __DIR__ . '/../sql/etablissements_audit.json';
    $compte = ['indicatif' => count($ind), 'fabrique' => count($fab), 'affiliation' => count($aff)];

    if (isset($opt['figer'])) {
        file_put_contents($sceau, json_encode($compte, JSON_PRETTY_PRINT) . "\n");
        printf("Sceau ecrit : %s\n", json_encode($compte));
        exit(0);
    }
    if (isset($opt['verifier'])) {
        $ref = is_file($sceau) ? json_decode((string)file_get_contents($sceau), true) : null;
        if (!is_array($ref)) { fwrite(STDERR, "Aucun sceau. Lancer --figer.\n"); exit(1); }
        $monte = [];
        foreach ($compte as $k => $v) {
            if ($v > (int)($ref[$k] ?? 0)) $monte[] = $k . ' : ' . (int)($ref[$k] ?? 0) . ' -> ' . $v;
        }
        if ($monte) {
            fwrite(STDERR, "Des anomalies sont APPARUES :\n  " . implode("\n  ", $monte) . "\n");
            exit(1);
        }
        printf("Aucune anomalie nouvelle (%s).\n", json_encode($compte));
        exit(0);
    }

    printf("\nÉTABLISSEMENTS — %d fiches publiables\n", count($L));
    echo str_repeat('═', 76), "\n";
    printf("  sans téléphone            %3d\n", $sansTel);
    printf("  indicatif d'un autre pays %3d\n", count($ind));
    printf("  numéro fabriqué           %3d\n", count($fab));
    printf("  affiliation impossible    %3d\n", count($aff));
    if ($horsTable) printf("  pays hors table (non contrôlés) : %s\n", implode(', ', array_keys($horsTable)));

    if ($aff) {
        echo "\nAFFILIATION IMPOSSIBLE\n", str_repeat('─', 76), "\n";
        echo "Une affiliation officielle prêtée à un commerce réel qui ne l'a pas.\n\n";
        foreach ($aff as $l)
            printf("  #%-5d %-14s %-38s\n         %s\n         %s\n",
                   $l['id'], $l['country_id'], mb_strimwidth($l['name'], 0, 38, '…'),
                   $l['type'], $l['motif']);
    }
    if ($ind) {
        echo "\nINDICATIF D'UN AUTRE PAYS\n", str_repeat('─', 76), "\n";
        foreach ($ind as $l)
            printf("  #%-5d %-14s %-32s %-20s attendu +%s\n",
                   $l['id'], $l['country_id'], mb_strimwidth($l['name'], 0, 32, '…'),
                   $l['phone'], ETAB_INDICATIF[$l['country_id']]);
    }
    if ($fab) {
        echo "\nNUMÉRO FABRIQUÉ\n", str_repeat('─', 76), "\n";
        foreach ($fab as $l)
            printf("  #%-5d %-14s %-32s %-20s %s\n",
                   $l['id'], $l['country_id'], mb_strimwidth($l['name'], 0, 32, '…'),
                   $l['phone'], etab_motif_fabrique((string)$l['phone']));
    }
    echo "\n";
    exit(($ind || $fab || $aff) ? 1 : 0);
}
