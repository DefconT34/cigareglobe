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

    $ok = true;
    if ($ow > IMG_DIMENSION_MAX || $oh > IMG_DIMENSION_MAX) {
        $r  = $ow > $oh ? IMG_DIMENSION_MAX / $ow : IMG_DIMENSION_MAX / $oh;
        $nw = max(1, (int)($ow * $r));
        $nh = max(1, (int)($oh * $r));
        $red = $aplat($img, $nw, $nh);
        imagecopyresampled($red, $img, 0, 0, 0, 0, $nw, $nh, $ow, $oh);
        $ok = imagejpeg($red, $dest, 86);
        imagedestroy($red);
    } else {
        $plat = $aplat($img, $ow, $oh);
        imagecopy($plat, $img, 0, 0, 0, 0, $ow, $oh);
        $ok = imagejpeg($plat, $dest, 86);
        imagedestroy($plat);
    }

    if ($ok && $vignette) {
        // Recadrage centré : une grille de vignettes irrégulières se lit
        // beaucoup moins bien qu'une grille au format constant.
        $r  = max(IMG_VIGNETTE_W / $ow, IMG_VIGNETTE_H / $oh);
        $tw = max(1, (int)($ow * $r));
        $th = max(1, (int)($oh * $r));
        $mis = $aplat($img, $tw, $th);
        imagecopyresampled($mis, $img, 0, 0, 0, 0, $tw, $th, $ow, $oh);
        $coupe = $aplat($img, IMG_VIGNETTE_W, IMG_VIGNETTE_H);
        imagecopy($coupe, $mis, 0, 0,
                  max(0, (int)(($tw - IMG_VIGNETTE_W) / 2)),
                  max(0, (int)(($th - IMG_VIGNETTE_H) / 2)),
                  IMG_VIGNETTE_W, IMG_VIGNETTE_H);
        imagejpeg($coupe, $vignette, 80);
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
