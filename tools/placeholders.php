<?php
// ════════════════════════════════════════════════════════
// placeholders.php — La carte qui tient lieu de photographie
// ────────────────────────────────────────────────────────
// CE QUE CE FICHIER FAIT, ET CE QU'IL NE FERA JAMAIS.
//
// Quatre cent huit fiches sont publiées ; UNE SEULE porte une vraie
// photographie — la façade du lounge d'Abidjan, prise sur place. Les
// quatre cent quarante autres images sont des cartes générées.
//
// On ne peut pas faire autrement, et c'est délibéré. Aller chercher des
// photographies ailleurs sur le Web serait s'approprier le travail de
// quelqu'un ; en fabriquer serait inventer l'apparence de lieux réels —
// exactement le défaut que les migrations 143 à 155 ont passé treize
// chantiers à retirer. Une fiche qui montre une devanture qui n'existe
// pas ment plus efficacement qu'une fiche qui se trompe d'adresse.
//
// La carte, elle, ne prétend rien. Elle porte le nom, la ville, le pays
// et une marque graphique. Elle se lit au premier coup d'œil comme une
// illustration, jamais comme une photo, et c'est sa qualité première.
//
// CE QUI CHANGE ICI. Les cartes existantes étaient dessinées avec la
// police bitmap de GD — cinq pixels de haut, crénelée, texte rouge sur
// fond bleu marine dont le contraste passe à peine. Celle-ci emploie
// une vraie police vectorielle quand le serveur en a une, la palette du
// site (or sur presque-noir), et un cigare dessiné plutôt qu'un
// rectangle.
//
// USAGE
//   php tools/placeholders.php --autotest        les cas construits
//   php tools/placeholders.php --fiche=47        une carte, pour voir
//   php tools/placeholders.php --tout            toutes celles qui en ont besoin
//   php tools/placeholders.php --tout --forcer   même celles déjà à jour
//
// ⚠ À LANCER SUR LE SERVEUR AUSSI. `uploads/` est exclu du déploiement
//   (voir .cpanel.yml) : les octets ne voyagent pas avec le code. Les
//   LIGNES de `lounge_photos`, elles, sont versionnées et arrivent par
//   le dump. Les deux moitiés doivent être faites des deux côtés.
// ════════════════════════════════════════════════════════

if (PHP_SAPI !== 'cli' && !defined('PLACEHOLDERS_INCLUDE')) { http_response_code(404); exit; }

require_once __DIR__ . '/../backend/config.php';

const PH_RACINE  = __DIR__ . '/../uploads/lounges';
const PH_L       = 800;   // largeur de la carte
const PH_H       = 533;   // hauteur — proportion 3:2, celle des cartes existantes
const PH_MINI_L  = 400;
const PH_MINI_H  = 267;

/** La palette du site : or sur presque-noir (voir legal.php, widgets). */
const PH_OR      = '#C9A227';
const PH_OR_PALE = '#8A7B5A';
const PH_FOND_H  = '#14110C';   // haut du dégradé
const PH_FOND_B  = '#0B0906';   // bas
const PH_BRAISE  = '#E2662A';

/**
 * Une police vectorielle utilisable, ou null.
 *
 * AUCUNE POLICE N'EST LIVRÉE AVEC LE PROJET, et c'est un choix : une
 * fonte est un binaire sous licence, qu'on ne verse pas dans un dépôt
 * sans lire ce qu'elle autorise. On prend donc ce que la machine a.
 *
 * L'ordre compte : les fontes des serveurs Linux d'abord, parce que
 * c'est là que l'outil tourne pour de bon ; celles de Windows ensuite,
 * pour que le développement ressemble au résultat.
 */
function ph_police(): ?string {
    static $trouvee = false, $chemin = null;
    if ($trouvee) return $chemin;
    $trouvee = true;
    foreach ([
        __DIR__ . '/../assets/fonts/atlas.ttf',              // si un jour on en verse une
        '/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf',
        '/usr/share/fonts/dejavu/DejaVuSans-Bold.ttf',
        '/usr/share/fonts/truetype/liberation/LiberationSans-Bold.ttf',
        '/usr/share/fonts/liberation/LiberationSans-Bold.ttf',
        '/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf',
        '/usr/share/fonts/dejavu/DejaVuSans.ttf',
        'C:/Windows/Fonts/seguisb.ttf',
        'C:/Windows/Fonts/segoeui.ttf',
        'C:/Windows/Fonts/arial.ttf',
    ] as $f) {
        if (is_file($f)) return $chemin = $f;
    }
    return null;
}

/** #RRGGBB → [r, g, b]. Tolère l'absence de dièse ; refuse le reste. */
function ph_rvb(string $hex): ?array {
    $h = ltrim(trim($hex), '#');
    if (!preg_match('/^[0-9a-fA-F]{6}$/', $h)) return null;
    return [hexdec(substr($h,0,2)), hexdec(substr($h,2,2)), hexdec(substr($h,4,2))];
}

/**
 * La largeur d'un texte, en pixels, pour une police et un corps donnés.
 * Renvoie null si la mesure est impossible — pas de police vectorielle.
 */
function ph_largeur(string $texte, float $corps, ?string $police): ?int {
    if ($police === null || $texte === '') return $texte === '' ? 0 : null;
    $b = @imagettfbbox($corps, 0, $police, $texte);
    return $b === false ? null : (int)abs($b[2] - $b[0]);
}

/**
 * Découpe un nom en au plus $max lignes tenant dans $largeur pixels.
 *
 * TROIS CAS, ET LE TROISIÈME EST CELUI QU'ON OUBLIE.
 *   · le nom tient : une ligne ;
 *   · il se coupe aux espaces : deux lignes ;
 *   · c'est UN SEUL MOT trop long — « Zigarrenfachgeschäft » — et
 *     aucune coupure aux espaces ne le sauvera. On tronque, avec une
 *     ellipse, plutôt que de le laisser déborder de la carte.
 *
 * Sans police vectorielle, on estime à 0,52 corps par caractère : la
 * carte sera moins jolie mais restera lisible.
 */
function ph_couper(string $texte, float $corps, ?string $police, int $largeur, int $max = 2): array {
    $texte = trim(preg_replace('/\s+/u', ' ', $texte));
    if ($texte === '') return [];

    $mesure = function (string $s) use ($corps, $police): int {
        $l = ph_largeur($s, $corps, $police);
        return $l ?? (int)round(mb_strlen($s) * $corps * 0.52);
    };

    $lignes = []; $courante = '';
    foreach (explode(' ', $texte) as $mot) {
        $essai = $courante === '' ? $mot : $courante . ' ' . $mot;
        if ($mesure($essai) <= $largeur) { $courante = $essai; continue; }
        if ($courante !== '') { $lignes[] = $courante; $courante = $mot; }
        else                  { $lignes[] = $mot;      $courante = ''; }
        if (count($lignes) >= $max) { $courante = ''; break; }
    }
    if ($courante !== '' && count($lignes) < $max) $lignes[] = $courante;

    // La dernière ligne peut encore déborder : mot unique, ou coupure
    // impossible. On la raccourcit caractère par caractère.
    $i = count($lignes) - 1;
    if ($i >= 0 && $mesure($lignes[$i]) > $largeur) {
        $s = $lignes[$i];
        while ($s !== '' && $mesure($s . '…') > $largeur) $s = mb_substr($s, 0, mb_strlen($s) - 1);
        $lignes[$i] = $s === '' ? '…' : $s . '…';
    }
    return $lignes;
}

/**
 * La ville, ou rien si elle est déjà dite ailleurs sur la carte.
 *
 * DEUX REDONDANCES, TROUVÉES EN REGARDANT LES CARTES SERVIES.
 *
 * La première : cent quatre-vingts fiches sur quatre cent huit
 * s'appellent « X — Ville ». La carte affichait « Le Cadre VIP —
 * Bamako », puis « Bamako » juste en dessous.
 *
 * La seconde : quinze fiches sont dans un ÉTAT-VILLE — Hong Kong,
 * Singapour. Leur ville et leur pays portent le même mot, et la carte
 * l'écrivait deux fois, une fois en clair et une fois en capitales
 * espacées. C'est la ligne de ville qui saute : le pays est l'ancre
 * graphique du bas, il reste.
 *
 * CONTRE-EXEMPLE À NE PAS CASSER : « La Casa del Habano — Kowloon » est
 * à Hong Kong. Le nom porte le QUARTIER — sans la seconde règle, la
 * ville resterait affichée en double du pays. Et « Le Cadre VIP —
 * Bamako » est au Mali : la ville saute par la première règle, le pays
 * reste, et il apprend quelque chose.
 */
function ph_ville(string $nom, string $ville, string $pays = ''): string {
    $ville = trim($ville);
    if ($ville === '') return '';
    if (mb_stripos($nom, $ville) !== false) return '';
    if ($pays !== '' && mb_strtolower($ville) === mb_strtolower(trim($pays))) return '';
    return $ville;
}

/** Le nom de fichier d'une carte. Volontairement rigide : voir ph_est_carte(). */
function ph_nom(int $id, bool $mini = false): string {
    return ($mini ? 'thumb_placeholder_' : 'placeholder_') . $id . '.jpg';
}

/**
 * Ce fichier est-il une carte engendrée, qu'on a le droit d'écraser ?
 *
 * LE SEUL CONTRÔLE QUI COMPTE DANS CE FICHIER. Une vraie photographie
 * envoyée par quelqu'un ne se régénère pas : elle se perd. Le motif est
 * donc ancré des deux bouts et n'accepte que la forme exacte que cet
 * outil produit — `placeholder_47.jpg`. Les fichiers téléversés portent
 * un nom haché (`p69bb32…jpg`) et ne peuvent pas y ressembler.
 */
function ph_est_carte(string $fichier): bool {
    return (bool)preg_match('/^(thumb_)?placeholder_\d+\.jpg$/', basename($fichier));
}

// ════════════════════════════════════════════════════════
// LE DESSIN
// ════════════════════════════════════════════════════════

/** Dégradé vertical, du haut vers le bas. */
function ph_fond($im, int $l, int $h): void {
    [$r1,$g1,$b1] = ph_rvb(PH_FOND_H);
    [$r2,$g2,$b2] = ph_rvb(PH_FOND_B);
    for ($y = 0; $y < $h; $y++) {
        $t = $y / max(1, $h - 1);
        $c = imagecolorallocate($im,
            (int)round($r1 + ($r2-$r1)*$t),
            (int)round($g1 + ($g2-$g1)*$t),
            (int)round($b1 + ($b2-$b1)*$t));
        imageline($im, 0, $y, $l, $y, $c);
    }
}

/**
 * Le cigare : corps légèrement conique, bague, braise allumée.
 *
 * L'ancienne carte dessinait un rectangle rouge avec un carré rose au
 * milieu. Celui-ci a une cape plus claire vers la tête, une bague dorée
 * et une braise dont la lueur décroît — de quoi le reconnaître.
 */
function ph_cigare($im, int $cx, int $cy, int $long, int $ep): void {
    $cape  = imagecolorallocate($im, 0x5A, 0x3A, 0x22);
    $clair = imagecolorallocate($im, 0x7A, 0x51, 0x30);
    [$ro,$go,$bo] = ph_rvb(PH_OR);
    $or    = imagecolorallocate($im, $ro, $go, $bo);
    [$rb,$gb,$bb] = ph_rvb(PH_BRAISE);

    $x0  = $cx - intdiv($long, 2);
    $x1  = $cx + intdiv($long, 2);
    $ht  = max(3, (int)round($ep * 0.38));   // demi-épaisseur à la tête
    $hp  = intdiv($ep, 2);                   // demi-épaisseur au pied

    // PAS DE HALO. Deux essais l'ont montré : empilée sur un fond
    // presque noir, une lueur orange semi-transparente vire au brun et
    // le cigare prend l'allure d'une cuillère. À cette taille, une
    // silhouette nette dit « cigare » mieux qu'un effet.

    // Corps : conique, plus fin vers la tête.
    imagefilledpolygon($im, [
        $x0, $cy - $ht,  $x1, $cy - $hp,
        $x1, $cy + $hp,  $x0, $cy + $ht,
    ], $cape);

    // Cape éclairée sur le tiers supérieur : c'est ce qui donne le galbe.
    imagefilledpolygon($im, [
        $x0, $cy - $ht,
        $x1, $cy - $hp,
        $x1, $cy - intdiv($hp, 3),
        $x0, $cy - intdiv($ht, 3),
    ], $clair);

    // Bague, au quart depuis la tête, légèrement plus haute que le corps.
    $bx = $x0 + intdiv($long, 4);
    $bl = max(7, intdiv($ep, 2));
    imagefilledrectangle($im, $bx, $cy - $hp - 1, $bx + $bl, $cy + $hp + 1, $or);

    // Le pied : une tranche de cendre, puis le cœur incandescent. Deux
    // ellipses étroites, à peine plus hautes que le corps — de quoi
    // lire « allumé » sans que la braise prenne toute la place.
    $cendre = imagecolorallocate($im, 0x9B, 0x93, 0x88);
    imagefilledellipse($im, $x1, $cy, max(4, intdiv($ep,3)), $ep + 1, $cendre);
    $coeur = imagecolorallocate($im, $rb, $gb, $bb);
    imagefilledellipse($im, $x1, $cy, max(3, intdiv($ep,4)), (int)round($ep*0.66), $coeur);
}

/** Écrit une ligne centrée. Renvoie la hauteur consommée. */
function ph_ligne($im, string $texte, float $corps, ?string $police, int $cx, int $y, array $rvb): int {
    if ($texte === '') return 0;
    $c = imagecolorallocate($im, $rvb[0], $rvb[1], $rvb[2]);
    if ($police !== null) {
        $b = imagettfbbox($corps, 0, $police, $texte);
        $x = $cx - (int)round(abs($b[2] - $b[0]) / 2);
        imagettftext($im, $corps, 0, $x, $y, $c, $police, $texte);
        return (int)round($corps * 1.45);
    }
    // Repli : police bitmap. Moins beau, toujours lisible.
    $f = 5;
    $x = $cx - intdiv(imagefontwidth($f) * mb_strlen($texte), 2);
    imagestring($im, $f, $x, $y - imagefontheight($f), $texte, $c);
    return imagefontheight($f) + 8;
}

/** Fabrique la carte d'une fiche. Renvoie la ressource GD. */
function ph_carte(array $fiche, int $l = PH_L, int $h = PH_H) {
    $police = ph_police();
    $im = imagecreatetruecolor($l, $h);
    imagealphablending($im, true);
    ph_fond($im, $l, $h);

    $k  = $l / PH_L;                 // facteur d'échelle, pour la vignette
    $cx = intdiv($l, 2);

    ph_cigare($im, $cx, (int)round($h * 0.30), (int)round(300*$k), (int)round(22*$k));

    $marge = (int)round(70 * $k);
    $y = (int)round($h * 0.56);

    foreach (ph_couper((string)$fiche['name'], 30*$k, $police, $l - 2*$marge, 2) as $ligne) {
        $y += ph_ligne($im, $ligne, 30*$k, $police, $cx, $y, ph_rvb(PH_OR));
    }
    $y += (int)round(6 * $k);
    $ville = ph_ville((string)$fiche['name'], (string)$fiche['ville'], (string)$fiche['pays']);
    foreach (ph_couper($ville, 17*$k, $police, $l - 2*$marge, 1) as $ligne) {
        $y += ph_ligne($im, $ligne, 17*$k, $police, $cx, $y, ph_rvb(PH_OR_PALE));
    }

    // Filet et pays, en bas.
    [$ro,$go,$bo] = ph_rvb(PH_OR);
    $filet = imagecolorallocatealpha($im, $ro, $go, $bo, 100);
    $yf = (int)round($h * 0.845);
    imageline($im, $cx - (int)round(90*$k), $yf, $cx + (int)round(90*$k), $yf, $filet);

    $pays = mb_strtoupper((string)$fiche['pays']);
    ph_ligne($im, implode(' ', preg_split('//u', $pays, -1, PREG_SPLIT_NO_EMPTY)),
             13*$k, $police, $cx, $yf + (int)round(30*$k), ph_rvb(PH_OR_PALE));

    // Signature discrète, alignée à droite PAR MESURE. Un décalage fixe
    // depuis le bord marchait à 800 px et rognait le « y » à 400 : la
    // vignette n'est pas la carte en plus petit, c'est un autre dessin.
    $sig  = imagecolorallocatealpha($im, $ro, $go, $bo, 105);
    $mot  = 'CigarOdyssey';
    $marg = (int)round(18 * $k);
    if ($police !== null) {
        $corps = 10 * $k;
        $larg  = ph_largeur($mot, $corps, $police) ?? (int)round(70 * $k);
        imagettftext($im, $corps, 0, $l - $larg - $marg, $h - $marg, $sig, $police, $mot);
    } else {
        $larg = imagefontwidth(2) * strlen($mot);
        imagestring($im, 2, $l - $larg - $marg, $h - $marg - imagefontheight(2), $mot, $sig);
    }
    return $im;
}

/** Écrit la carte et sa vignette. Renvoie [chemin, chemin_mini]. */
function ph_ecrire(array $fiche): array {
    $id  = (int)$fiche['id'];
    $dir = PH_RACINE . '/' . $id;
    if (!is_dir($dir) && !mkdir($dir, 0755, true)) {
        throw new RuntimeException("dossier impossible : $dir");
    }
    $p1 = $dir . '/' . ph_nom($id);
    $p2 = $dir . '/' . ph_nom($id, true);

    $im = ph_carte($fiche, PH_L, PH_H);
    imagejpeg($im, $p1, 86);
    imagedestroy($im);

    $im = ph_carte($fiche, PH_MINI_L, PH_MINI_H);
    imagejpeg($im, $p2, 84);
    imagedestroy($im);

    return [$p1, $p2];
}

/** Les fiches dont la photo principale est une carte engendrée. */
function ph_fiches(PDO $db, ?int $un = null): array {
    $where = $un ? 'AND l.id = ' . (int)$un : '';
    $sql = "SELECT l.id, l.name, l.city AS ville, c.name AS pays, p.filename
              FROM lounges l
              JOIN lounge_countries c ON c.id = l.country_id
              LEFT JOIN lounge_photos p ON p.lounge_id = l.id AND p.is_primary = 1
             WHERE l.is_verified = 1 $where
             ORDER BY l.id";
    $out = [];
    foreach ($db->query($sql) as $r) {
        // Une vraie photographie ne se regenere pas.
        if ($r['filename'] !== null && !ph_est_carte((string)$r['filename'])) continue;
        // La ville porte « Ville — adresse » : la carte n'affiche que la ville.
        $r['ville'] = trim(explode('—', (string)$r['ville'])[0]);
        $out[] = $r;
    }
    return $out;
}

// ════════════════════════════════════════════════════════
// AUTOTEST — les cas construits
// ════════════════════════════════════════════════════════
function ph_autotest(): int {
    $echecs = 0;
    $dire = function (bool $ok, string $titre, string $obtenu = '') use (&$echecs) {
        printf("  [%s] %s%s\n", $ok ? 'ok' : 'KO', $titre, $ok || $obtenu === '' ? '' : "  ($obtenu)");
        if (!$ok) $echecs++;
    };

    // ── Ce qu'on a le droit d'ecraser ───────────────────
    $dire(ph_est_carte('placeholder_47.jpg'),        'carte : le nom engendre est reconnu');
    $dire(ph_est_carte('thumb_placeholder_47.jpg'),  'carte : la vignette aussi');
    // CONTRE-EPREUVES : chacune est une VRAIE photo qu'on effacerait.
    $dire(!ph_est_carte('p69bb321188fc44.85625998.jpg'), 'carte : un fichier televerse est protege');
    $dire(!ph_est_carte('placeholder.jpg'),          'carte : sans numero, ce n est pas la notre');
    $dire(!ph_est_carte('placeholder_47.png'),       'carte : autre extension, on ne touche pas');
    $dire(!ph_est_carte('mon_placeholder_47.jpg'),   'carte : le motif est ancre au debut');
    $dire(!ph_est_carte('placeholder_47.jpg.exe'),   'carte : et a la fin');

    // ── La couleur ──────────────────────────────────────
    $dire(ph_rvb('#C9A227') === [201,162,39], 'couleur : #RRGGBB');
    $dire(ph_rvb('C9A227')  === [201,162,39], 'couleur : sans diese');
    $dire(ph_rvb('#C9A2')   === null,         'couleur : trop courte, refusee');
    $dire(ph_rvb('#GGGGGG') === null,         'couleur : hors hexadecimal, refusee');

    // ── La coupure du texte ─────────────────────────────
    $police = ph_police();
    $c = ph_couper('Sautter of Mayfair', 30, $police, 660, 2);
    $dire(count($c) === 1 && $c[0] === 'Sautter of Mayfair', 'coupure : un nom court tient sur une ligne', implode(' | ', $c));

    $c = ph_couper('La Casa del Habano — Buenos Aires (Palermo) et sa cave', 30, $police, 400, 2);
    $dire(count($c) === 2, 'coupure : un nom long prend deux lignes', implode(' | ', $c));

    // Le cas qu'on oublie : un seul mot, plus large que la carte.
    $c = ph_couper('Zigarrenfachgeschaeftinhaberversammlung', 30, $police, 200, 2);
    $dire(count($c) === 1 && str_ends_with($c[0], '…'),
          'coupure : un mot unique trop long est tronque', implode(' | ', $c));

    $dire(ph_couper('   ', 30, $police, 400, 2) === [], 'coupure : rien a couper, rien a ecrire');

    // ── La ville, quand le nom la dit deja ──────────────
    $dire(ph_ville('Le Cadre VIP — Bamako', 'Bamako') === '',
          'ville : retiree si le nom la porte deja');
    // CONTRE-EPREUVE : le nom porte le QUARTIER, la ville reste utile.
    $dire(ph_ville('La Casa del Habano — Kowloon', 'Hong Kong') === 'Hong Kong',
          'ville : gardee quand le nom dit autre chose');
    $dire(ph_ville('Cave de BAMAKO', 'Bamako') === '',
          'ville : la casse ne compte pas');
    $dire(ph_ville('Cave sans ville', '  ') === '',
          'ville : rien a afficher, rien a comparer');
    // L ETAT-VILLE : ville et pays portent le meme mot. C est la ligne
    // de ville qui saute, le pays est l ancre du bas.
    $dire(ph_ville('Davidoff — ION Orchard', 'Singapour', 'Singapour') === '',
          'ville : etat-ville, la ville ne double pas le pays');
    $dire(ph_ville('La Casa del Habano — Kowloon', 'Hong Kong', 'Hong Kong') === '',
          'ville : Kowloon a Hong Kong, la ville doublait le pays');
    // CONTRE-EPREUVE : Bamako n est pas le Mali. La ville saute par la
    // premiere regle, mais le pays apprend quelque chose et reste.
    $dire(ph_ville('Cave centrale', 'Bamako', 'Mali') === 'Bamako',
          'ville : ville et pays distincts, on garde la ville');
    $dire(ph_couper("Deux   espaces\tet\nsauts", 30, $police, 900, 2) === ['Deux espaces et sauts'],
          'coupure : les blancs sont normalises');

    // ── Le dessin lui-meme ──────────────────────────────
    // On ne juge pas le gout ; on verifie qu'une image sort, aux bonnes
    // dimensions, et qu'elle n'est pas uniforme — une carte toute noire
    // passerait tous les tests precedents.
    $fiche = ['id' => 999999, 'name' => 'Cave de Test', 'ville' => 'Testville', 'pays' => 'Testland'];
    $im = ph_carte($fiche, PH_L, PH_H);
    $dire(imagesx($im) === PH_L && imagesy($im) === PH_H, 'dessin : dimensions attendues');

    $couleurs = [];
    for ($x = 0; $x < PH_L; $x += 7) for ($y = 0; $y < PH_H; $y += 7) {
        $couleurs[imagecolorat($im, $x, $y)] = true;
    }
    $dire(count($couleurs) > 20, 'dessin : la carte n est pas unie', count($couleurs) . ' teintes');
    imagedestroy($im);

    $im = ph_carte($fiche, PH_MINI_L, PH_MINI_H);
    $dire(imagesx($im) === PH_MINI_L && imagesy($im) === PH_MINI_H, 'dessin : la vignette suit l echelle');
    imagedestroy($im);

    printf("placeholders --autotest : %d cas, %d echec(s)%s\n", 26, $echecs,
           $police === null ? "  [sans police vectorielle : repli bitmap]" : '');
    return $echecs === 0 ? 0 : 1;
}

// ════════════════════════════════════════════════════════
// LIGNE DE COMMANDE
// ════════════════════════════════════════════════════════
if (PHP_SAPI === 'cli' && !defined('PLACEHOLDERS_INCLUDE')) {
    $opt = getopt('', ['autotest', 'tout', 'forcer', 'fiche:']);
    if (isset($opt['autotest'])) exit(ph_autotest());

    if (!extension_loaded('gd')) { fwrite(STDERR, "GD absent : rien a faire.\n"); exit(2); }
    printf("Police : %s\n", ph_police() ?? 'AUCUNE — repli bitmap, cartes moins lisibles');

    $db = getDB();
    $un = isset($opt['fiche']) ? (int)$opt['fiche'] : null;
    if ($un === null && !isset($opt['tout'])) {
        fwrite(STDERR, "Rien de demande. --fiche=<id>, --tout, ou --autotest.\n"); exit(1);
    }

    $fiches = ph_fiches($db, $un);
    if (!$fiches) { echo "Aucune fiche a traiter.\n"; exit(0); }

    $n = 0;
    foreach ($fiches as $f) {
        [$p1, ] = ph_ecrire($f);
        $n++;
        if ($un !== null) printf("  %s\n", $p1);
    }
    printf("%d carte(s) ecrite(s), vignettes comprises.\n", $n);
    exit(0);
}
