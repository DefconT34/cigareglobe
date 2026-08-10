<?php
// ════════════════════════════════════════════════════════
// image_lib.php — Réception d'une image téléversée
// ────────────────────────────────────────────────────────
// UNE seule chaîne pour tout le site : les photos d'établissement
// (photos.php, réservées à l'administration) et les images des messages
// de la communauté (forum.php, ouvertes à tout membre vérifié). Deux
// pipelines auraient signifié deux endroits à auditer, et un seul des
// deux corrigé le jour où l'on trouve une faille.
//
// LE RÉ-ENCODAGE EST OBLIGATOIRE, et c'est le cœur du dispositif.
// L'image n'est jamais copiée : elle est décodée puis RECONSTRUITE par
// GD. Cela règle trois problèmes d'un seul geste :
//
//   · les EXIF disparaissent — donc les coordonnées GPS que le
//     téléphone glisse dans chaque photo, et le numéro de série de
//     l'appareil. Personne ne devrait publier l'adresse de son domicile
//     en montrant sa cave ;
//   · un fichier « polyglotte » (une image valide qui est aussi du code)
//     ne survit pas à la reconstruction ;
//   · la taille est bornée pour de bon, pas seulement à l'affichage.
//
// L'ancien code retombait sur `move_uploaded_file()` — une copie brute —
// quand GD manquait ou échouait. Tant que seule l'administration
// téléversait, le risque restait théorique. Il cesse de l'être dès que
// n'importe quel membre peut le faire : on REFUSE désormais l'image
// plutôt que de la stocker sans l'avoir reconstruite.
// ════════════════════════════════════════════════════════

const IMG_TAILLE_MAX   = 5 * 1024 * 1024;   // 5 Mo
const IMG_DIMENSION_MAX = 1600;             // côté le plus long
const IMG_VIGNETTE_W   = 400;
const IMG_VIGNETTE_H   = 300;

/** Les trois formats acceptés. Tout le reste est refusé, extension comprise. */
function image_types(): array {
    return ['image/jpeg', 'image/png', 'image/webp'];
}

/**
 * Type réel du fichier, lu dans son CONTENU — jamais dans son nom.
 * Une extension est une déclaration de l'expéditeur, pas une preuve.
 */
function image_mime(string $chemin): string {
    if (function_exists('finfo_open')) {
        $fi = finfo_open(FILEINFO_MIME_TYPE);
        $m  = finfo_file($fi, $chemin);
        finfo_close($fi);
        if ($m) return $m;
    }
    $fp = @fopen($chemin, 'rb');
    if (!$fp) return '';
    $tete = fread($fp, 12);
    fclose($fp);
    if (substr($tete, 0, 2) === "\xFF\xD8")                  return 'image/jpeg';
    if (substr($tete, 0, 8) === "\x89PNG\r\n\x1A\n")         return 'image/png';
    if (substr($tete, 0, 4) === 'RIFF' && substr($tete, 8, 4) === 'WEBP') return 'image/webp';
    return '';
}

/**
 * Vérifie une entrée de $_FILES avant tout traitement.
 * @return array|null [code, message] à rendre, ou null si le fichier est recevable
 */
function image_verifier(?array $file): ?array {
    if (!$file || !isset($file['tmp_name'])) {
        return ['file_missing', 'Aucun fichier reçu.'];
    }
    if (($file['error'] ?? UPLOAD_ERR_NO_FILE) !== UPLOAD_ERR_OK) {
        $e = (int)$file['error'];
        if ($e === UPLOAD_ERR_INI_SIZE || $e === UPLOAD_ERR_FORM_SIZE) {
            return ['file_too_big', 'Image trop lourde (5 Mo au plus).'];
        }
        return ['upload_failed', 'Le transfert a échoué.'];
    }
    if (($file['size'] ?? 0) > IMG_TAILLE_MAX) {
        return ['file_too_big', 'Image trop lourde (5 Mo au plus).'];
    }
    // is_uploaded_file : la seule garantie que le chemin vient bien d'un
    // téléversement HTTP et non d'un paramètre fabriqué.
    if (!is_uploaded_file($file['tmp_name'])) {
        return ['file_invalid', 'Fichier invalide.'];
    }
    if (!in_array(image_mime($file['tmp_name']), image_types(), true)) {
        return ['file_type', 'Formats acceptés : JPEG, PNG, WebP.'];
    }
    return null;
}


// ════════════════════════════════════════════════════════
// COMPRESSION : CHOISIR LA QUALITÉ, PLUTÔT QUE LA FIXER
// ════════════════════════════════════════════════════════
// Une qualité JPEG figée — 86, disons — traite de la même façon deux
// images qui n'ont rien à voir. Sur une photo de cave prise au flash,
// pleine de grain et de détail, 86 laisse des artefacts visibles autour
// des bagues. Sur une macro de cendre grise sur fond sombre, 86 pèse
// quatre fois le nécessaire pour un résultat que personne ne distingue
// de l'original.
//
// On mesure donc, au lieu de deviner. Pour chaque image :
//
//   1. on l'encode à une qualité candidate ;
//   2. on la relit et on compare à l'image d'origine ;
//   3. on garde la qualité la PLUS BASSE dont l'écart reste sous le
//      seuil — c'est-à-dire le fichier le plus léger que l'œil ne
//      distingue pas.
//
// La comparaison se fait au PSNR, en décibels. Ce n'est pas la mesure
// parfaite — elle ignore la façon dont l'œil pardonne le bruit et
// déteste le lissage — mais elle se calcule en PHP pur, sans
// dépendance, et elle sépare très bien « intact » de « abîmé » :
//
//     ≥ 44 dB   indiscernable de l'original
//     40–44     excellent, il faut chercher pour voir
//     36–40     bon, artefacts visibles sur les aplats
//     < 34      le bloc JPEG se voit
//
// La cible est donc posée à 44 dB pour l'image du message et 38 pour la
// vignette, qu'on ne regarde jamais de près.
//
// LE COÛT. Une recherche dichotomique sur l'échelle des qualités
// demande trois à quatre encodages au lieu d'un. Sur un téléversement
// — une opération déjà lente, dominée par le réseau — c'est invisible ;
// le relevé figure dans le message de commit.

/** L'échelle explorée sous la référence. On ne monte jamais au-dessus. */
const IMG_QUALITES = [58, 66, 74, 80, 86];
const IMG_PSNR_IMAGE    = 44.0;   // image du message : indiscernable
const IMG_PSNR_VIGNETTE = 38.0;   // vignette : on ne la regarde pas de près

/**
 * Écart entre deux images, en décibels (PSNR).
 *
 * Échantillonné sur une grille d'environ 40 000 points plutôt que sur
 * tous les pixels : au-delà, la valeur ne bouge plus de façon utile et
 * le calcul en PHP pur coûterait dix fois plus cher. Un million de
 * `imagecolorat` par essai serait le seul endroit vraiment lent de la
 * chaîne.
 *
 * @return float décibels ; INF si les deux images sont identiques
 */
function image_psnr($a, $b): float {
    $w = imagesx($a); $h = imagesy($a);
    if ($w !== imagesx($b) || $h !== imagesy($b)) return 0.0;

    $pas = max(1, (int)round(sqrt(($w * $h) / 40000)));
    $somme = 0.0; $n = 0;
    for ($y = 0; $y < $h; $y += $pas) {
        for ($x = 0; $x < $w; $x += $pas) {
            $p = imagecolorat($a, $x, $y);
            $q = imagecolorat($b, $x, $y);
            if ($p === $q) { $n += 3; continue; }
            $dr = (($p >> 16) & 255) - (($q >> 16) & 255);
            $dg = (($p >> 8)  & 255) - (($q >> 8)  & 255);
            $db = ( $p        & 255) - ( $q        & 255);
            $somme += $dr * $dr + $dg * $dg + $db * $db;
            $n += 3;
        }
    }
    if ($n === 0) return 0.0;
    $eqm = $somme / $n;
    if ($eqm <= 0.0) return INF;                 // aucune perte mesurable
    return 10 * log10((255 * 255) / $eqm);
}

/**
 * Encode en mémoire à une qualité donnée.
 * @return array [octets, image relue] — l'appelant détruit la seconde
 */
function image_essai($img, int $q): array {
    ob_start();
    imagejpeg($img, null, $q);
    $bin = ob_get_clean();
    return [$bin, @imagecreatefromstring($bin)];
}

/** Qualité de référence : celle qui était appliquée à tout, sans mesure. */
const IMG_QUALITE_REF = 86;

/**
 * Cherche la qualité la plus basse qui reste sous le seuil de perte.
 *
 * ON COMMENCE PAR LA RÉFÉRENCE (86), et ce n'est pas un détail : c'est
 * ce qui rend l'algorithme incapable d'empirer les choses.
 *
 * Le PSNR punit le BRUIT, que l'œil pardonne très bien. Sur une photo
 * au grain marqué — un capteur de téléphone dans un lounge sombre — il
 * plafonne vers 25 dB quelle que soit la qualité : la cible de 44 dB
 * est hors d'atteinte. Une recherche naïve conclurait « il faut monter »
 * et retiendrait 92, soit un fichier 30 % PLUS LOURD qu'avant pour un
 * résultat que personne ne distingue. Mesuré, avant correction :
 *
 *     photo texturée : 630 ko à q=86  ->  818 ko à q=92   (+30 %)
 *
 * En testant 86 d'abord, ce cas se reconnaît au premier essai : si la
 * cible n'y est pas atteinte, elle ne le sera pas plus bas, et on garde
 * la référence. L'image coûteuse devient donc aussi la plus rapide à
 * traiter — un seul encodage.
 *
 * Et par ceinture : on ne retient un candidat que s'il est réellement
 * plus léger. Le poids ne peut pas augmenter, quelle que soit l'image.
 *
 * @return array [qualité retenue, octets encodés, PSNR obtenu]
 */
function image_qualite_adaptative($img, float $cible): array {
    [$binRef, $reluRef] = image_essai($img, IMG_QUALITE_REF);
    $psnrRef = $reluRef ? image_psnr($img, $reluRef) : 0.0;
    if ($reluRef) imagedestroy($reluRef);

    // Cible inatteignable a la reference : elle le sera encore moins en
    // dessous. On s'arrete la — c'est le cas des images bruitees.
    if ($psnrRef < $cible) return [IMG_QUALITE_REF, $binRef, $psnrRef];

    // La cible est atteinte : reste a trouver JUSQU'OU l'on peut
    // descendre. Dichotomie sur les qualites inferieures a la reference.
    $qs = array_values(array_filter(IMG_QUALITES, fn($q) => $q < IMG_QUALITE_REF));
    $lo = 0; $hi = count($qs) - 1;
    $meilleur = null;
    while ($lo <= $hi) {
        $mid = (int)(($lo + $hi) / 2);
        [$bin, $relu] = image_essai($img, $qs[$mid]);
        $psnr = $relu ? image_psnr($img, $relu) : 0.0;
        if ($relu) imagedestroy($relu);

        if ($psnr >= $cible) { $meilleur = [$qs[$mid], $bin, $psnr]; $hi = $mid - 1; }
        else                 { $lo = $mid + 1; }
    }

    // Ceinture : un candidat plus lourd que la reference n'en est pas un.
    if ($meilleur && strlen($meilleur[1]) < strlen($binRef)) return $meilleur;
    return [IMG_QUALITE_REF, $binRef, $psnrRef];
}

// ÉCARTÉ : la réduction par paliers successifs. C'est un conseil qu'on
// lit partout, et il vaut pour `imagecopyresized` — qui prend un pixel
// sur n et produit du moirage. `imagecopyresampled`, lui, moyenne déjà
// la zone source. Mesuré sur une image photographique, aux facteurs 2,
// 4 et 8 : l'écart de poids est de +0,00 %, +0,09 % et -0,15 %.
// Autrement dit rien. Le code a donc été retiré plutôt que gardé « au
// cas où » avec une justification que la mesure contredit.

/**
 * Écrit une image au format JPEG, à la qualité juste nécessaire.
 * Progressif : même contenu, quelques pour cent de moins, et une image
 * qui s'affiche en entier tout de suite plutôt que ligne à ligne.
 */
function image_ecrire_optimisee($img, string $chemin, float $cible): bool {
    imageinterlace($img, true);
    [, $bin, ] = image_qualite_adaptative($img, $cible);
    return $bin !== '' && file_put_contents($chemin, $bin) !== false;
}

/**
 * Décode, redimensionne et RÉÉCRIT l'image en JPEG, plus sa vignette.
 *
 * Sortie toujours en .jpg : Safari refuse une image dont l'extension ne
 * correspond pas au contenu, et un seul format en sortie simplifie tout
 * le reste — service, cache, suppression.
 *
 * @return array|null [code, message] en cas d'échec, ou null si tout est écrit
 */
function image_ecrire(string $source, string $dest, ?string $vignette = null): ?array {
    if (!extension_loaded('gd')) {
        // Sans GD, pas de reconstruction possible — donc pas d'image.
        // Refuser est le seul comportement sûr : voir l'en-tête.
        error_log('[image] extension GD absente : televersement refuse');
        return ['image_indechiffrable', 'Image illisible.'];
    }
    $mime = image_mime($source);
    $img  = match ($mime) {
        'image/png'  => @imagecreatefrompng($source),
        'image/webp' => @imagecreatefromwebp($source),
        'image/jpeg' => @imagecreatefromjpeg($source),
        default      => false,
    };
    // Un fichier qui passe la detection MIME mais que GD ne sait pas
    // decoder est precisement le cas suspect : on s'arrete la.
    if (!$img) return ['image_indechiffrable', 'Image illisible.'];

    $ow = imagesx($img);
    $oh = imagesy($img);
    if ($ow < 1 || $oh < 1) { imagedestroy($img); return ['image_indechiffrable', 'Image illisible.']; }

    // La transparence du PNG devient noire en JPEG : on pose un fond
    // blanc, faute de quoi un logo transparent sort en pavé sombre.
    $aplat = function ($src, $w, $h) {
        $out = imagecreatetruecolor($w, $h);
        imagefilledrectangle($out, 0, 0, $w, $h, imagecolorallocate($out, 255, 255, 255));
        return $out;
    };

    // ── L'image du message ───────────────────────────────
    if ($ow > IMG_DIMENSION_MAX || $oh > IMG_DIMENSION_MAX) {
        $r   = $ow > $oh ? IMG_DIMENSION_MAX / $ow : IMG_DIMENSION_MAX / $oh;
        $nw  = max(1, (int)($ow * $r));
        $nh  = max(1, (int)($oh * $r));
        $red = $aplat($img, $nw, $nh);
        imagecopyresampled($red, $img, 0, 0, 0, 0, $nw, $nh, $ow, $oh);
    } else {
        // Meme sans reduction, on repasse par un fond blanc : la
        // transparence du PNG deviendrait noire en JPEG, et un logo
        // transparent sortirait en pave sombre.
        $red = $aplat($img, $ow, $oh);
        imagecopy($red, $img, 0, 0, 0, 0, $ow, $oh);
    }
    $ok = image_ecrire_optimisee($red, $dest, IMG_PSNR_IMAGE);
    imagedestroy($red);

    if ($ok && $vignette) {
        // Recadrage centré : une grille de vignettes irrégulières se lit
        // beaucoup moins bien qu'une grille au format constant.
        $r     = max(IMG_VIGNETTE_W / $ow, IMG_VIGNETTE_H / $oh);
        $tw    = max(1, (int)($ow * $r));
        $th    = max(1, (int)($oh * $r));
        $mis   = $aplat($img, $tw, $th);
        imagecopyresampled($mis, $img, 0, 0, 0, 0, $tw, $th, $ow, $oh);
        $coupe = $aplat($img, IMG_VIGNETTE_W, IMG_VIGNETTE_H);
        imagecopy($coupe, $mis, 0, 0,
                  max(0, (int)((imagesx($mis) - IMG_VIGNETTE_W) / 2)),
                  max(0, (int)((imagesy($mis) - IMG_VIGNETTE_H) / 2)),
                  IMG_VIGNETTE_W, IMG_VIGNETTE_H);
        image_ecrire_optimisee($coupe, $vignette, IMG_PSNR_VIGNETTE);
        imagedestroy($mis);
        imagedestroy($coupe);
    }
    imagedestroy($img);

    if (!$ok || !is_file($dest)) return ['upload_failed', 'Échec de l\'écriture.'];
    return null;
}

/** Dimensions d'une image déjà écrite, pour les stocker avec elle. */
function image_dimensions(string $chemin): array {
    $t = @getimagesize($chemin);
    return $t ? [(int)$t[0], (int)$t[1]] : [0, 0];
}
