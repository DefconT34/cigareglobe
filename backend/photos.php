<?php
// ════════════════════════════════════════════════════════
// photos.php — API Upload & gestion des photos lounges
// CigarOdyssey
// ════════════════════════════════════════════════════════

// Capturer TOUTES les erreurs PHP avant tout output
ini_set('display_errors', 0);
error_reporting(E_ALL);
set_error_handler(function($errno, $errstr, $errfile, $errline) {
    http_response_code(500);
    header('Content-Type: application/json; charset=utf-8');
    error_log("[photos.php] $errstr @ $errfile:$errline");
    echo json_encode(['error' => 'Erreur serveur.']);
    exit;
});
set_exception_handler(function($e) {
    http_response_code(500);
    header('Content-Type: application/json; charset=utf-8');
    error_log('[photos.php] ' . $e->getMessage());
    echo json_encode(['error' => 'Erreur serveur.']);
    exit;
});

require_once __DIR__ . '/config.php';
require_once __DIR__ . '/auth_lib.php';

auth_session_start();   // reconnait la session d'administration

// ── Constantes ────────────────────────────────────────────
define('UPLOAD_DIR',     dirname(__DIR__) . '/uploads/lounges/');
define('UPLOAD_URL',     '/uploads/lounges/');
define('MAX_FILE_SIZE',  5 * 1024 * 1024);
define('MAX_DIMENSION',  1200);
define('THUMB_W',        400);
define('THUMB_H',        267);
define('MAX_PER_LOUNGE', 10);

// ADMIN_KEY est défini dans config.php — pas de redéfinition

// ── Headers JSON ──────────────────────────────────────────
header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(204);
    exit;
}

// ── Helpers ───────────────────────────────────────────────
function jout(array $data, int $code = 200): never {
    http_response_code($code);
    echo json_encode($data, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    exit;
}

function get_ip(): string {
    return $_SERVER['HTTP_X_FORWARDED_FOR']
        ?? $_SERVER['HTTP_X_REAL_IP']
        ?? $_SERVER['REMOTE_ADDR']
        ?? '0.0.0.0';
}

function is_admin(): bool {
    // Session d'administration, role moderator/admin, ou en-tete X-Admin-Key.
    // La cle n'est plus acceptee depuis l'URL (fuite logs/historique/Referer).
    return is_admin_request(getDB());
}

// ── Routing ───────────────────────────────────────────────
// action peut venir de GET ou POST selon l'appelant
$action = trim($_GET['action'] ?? $_POST['action'] ?? '');
$db     = getDB();

try {
    switch ($action) {
        case 'upload':  action_upload($db); break;
        case 'list':    action_list($db);   break;
        case 'delete':  action_delete($db); break;
        case 'primary': action_primary($db); break;
        case 'approve': action_approve($db); break;
        default: jout(['error' => 'Action inconnue: ' . $action], 404);
    }
} catch (PDOException $e) {
    error_log('[photos.php] SQL ' . $e->getMessage());
    jout(['error' => 'Erreur base de données.'], 500);
} catch (Throwable $e) {
    error_log('[photos.php] ' . $e->getMessage());
    jout(['error' => 'Erreur serveur.'], 500);
}

// ════════════════════════════════════════════════════════
// UPLOAD
// ════════════════════════════════════════════════════════
function action_upload(PDO $db): never {
    if (!is_admin()) jout(['error' => 'Non autorisé'], 403);

    $lounge_id  = (int)($_POST['lounge_id'] ?? 0);
    $caption    = trim(strip_tags($_POST['caption']    ?? ''));
    $is_primary = !empty($_POST['is_primary']) && $_POST['is_primary'] !== '0';

    if (!$lounge_id) jout(['error' => 'lounge_id manquant'], 400);

    // Vérifier que le lounge existe
    $chk = $db->prepare("SELECT id FROM lounges WHERE id = ? AND is_verified = 1");
    $chk->execute([$lounge_id]);
    if (!$chk->fetch()) jout(['error' => 'Lounge introuvable (id=' . $lounge_id . ')'], 404);

    // Vérifier quota
    $cnt = $db->prepare("SELECT COUNT(*) FROM lounge_photos WHERE lounge_id = ?");
    $cnt->execute([$lounge_id]);
    if ((int)$cnt->fetchColumn() >= MAX_PER_LOUNGE) {
        jout(['error' => 'Quota atteint (10 photos max par lounge)'], 429);
    }

    // Vérifier fichier uploadé
    if (!isset($_FILES['photo'])) {
        jout(['error' => 'Aucun fichier reçu (clé "photo" manquante)'], 400);
    }

    $file = $_FILES['photo'];

    if ($file['error'] !== UPLOAD_ERR_OK) {
        $errors = [
            UPLOAD_ERR_INI_SIZE   => 'Fichier dépasse upload_max_filesize (php.ini)',
            UPLOAD_ERR_FORM_SIZE  => 'Fichier dépasse MAX_FILE_SIZE du formulaire',
            UPLOAD_ERR_PARTIAL    => 'Upload partiel',
            UPLOAD_ERR_NO_FILE    => 'Aucun fichier envoyé',
            UPLOAD_ERR_NO_TMP_DIR => 'Dossier temporaire absent',
            UPLOAD_ERR_CANT_WRITE => 'Impossible d\'écrire sur le disque',
            UPLOAD_ERR_EXTENSION  => 'Upload bloqué par une extension PHP',
        ];
        jout(['error' => $errors[$file['error']] ?? 'Erreur upload #' . $file['error']], 400);
    }

    if ($file['size'] > MAX_FILE_SIZE) {
        jout(['error' => 'Fichier trop lourd (max 5 MB, reçu ' . round($file['size']/1024/1024, 1) . ' MB)'], 413);
    }

    $tmp = $file['tmp_name'];
    if (!is_uploaded_file($tmp)) {
        jout(['error' => 'Fichier invalide (sécurité)'], 400);
    }

    // Vérification MIME réelle
    $mime = '';
    if (function_exists('finfo_open')) {
        $fi   = finfo_open(FILEINFO_MIME_TYPE);
        $mime = finfo_file($fi, $tmp);
        finfo_close($fi);
    } else {
        // Fallback : lire les magic bytes
        $fp   = fopen($tmp, 'rb');
        $head = fread($fp, 12);
        fclose($fp);
        if (substr($head, 0, 2) === "\xFF\xD8") $mime = 'image/jpeg';
        elseif (substr($head, 0, 8) === "\x89PNG\r\n\x1A\n") $mime = 'image/png';
        elseif (substr($head, 0, 4) === 'RIFF' && substr($head, 8, 4) === 'WEBP') $mime = 'image/webp';
    }

    if (!in_array($mime, ['image/jpeg', 'image/png', 'image/webp'])) {
        jout(['error' => 'Format non supporté (détecté: ' . $mime . '). Utilisez JPG, PNG ou WebP.'], 415);
    }

    // Créer le dossier de destination
    $dir = UPLOAD_DIR . $lounge_id . '/';
    if (!is_dir($dir)) {
        if (!mkdir($dir, 0755, true)) {
            jout(['error' => 'Impossible de créer le dossier uploads/lounges/' . $lounge_id . '/ — vérifiez les permissions'], 500);
        }
    }
    if (!is_writable($dir)) {
        jout(['error' => 'Dossier uploads/lounges/' . $lounge_id . '/ non accessible en écriture'], 500);
    }

    // Nom de fichier
    // Toujours .jpg en sortie — imagejpeg() produit du JPEG quelle que soit la source
    // Safari refuse les images dont l'extension ne correspond pas au contenu réel
    $filename = uniqid('p', true) . '.jpg';
    $dest     = $dir . $filename;
    $thumb    = $dir . 'thumb_' . $filename;

    // Traitement image avec GD
    if (extension_loaded('gd')) {
        $img = match($mime) {
            'image/png'  => @imagecreatefrompng($tmp),
            'image/webp' => @imagecreatefromwebp($tmp),
            default      => @imagecreatefromjpeg($tmp),
        };

        if (!$img) {
            // GD ne peut pas lire → copie directe
            if (!move_uploaded_file($tmp, $dest)) {
                jout(['error' => 'Échec de la copie du fichier'], 500);
            }
            copy($dest, $thumb);
        } else {
            $ow = imagesx($img);
            $oh = imagesy($img);

            // Image principale — redimensionner si trop grande
            if ($ow > MAX_DIMENSION || $oh > MAX_DIMENSION) {
                $ratio   = $ow > $oh ? MAX_DIMENSION / $ow : MAX_DIMENSION / $oh;
                $nw      = max(1, (int)($ow * $ratio));
                $nh      = max(1, (int)($oh * $ratio));
                $resized = imagecreatetruecolor($nw, $nh);
                imagecopyresampled($resized, $img, 0, 0, 0, 0, $nw, $nh, $ow, $oh);
                imagejpeg($resized, $dest, 88);
                imagedestroy($resized);
            } else {
                imagejpeg($img, $dest, 88);
            }

            // Thumbnail crop centré
            $ratio_t = max(THUMB_W / $ow, THUMB_H / $oh);
            $tw      = max(1, (int)($ow * $ratio_t));
            $th      = max(1, (int)($oh * $ratio_t));
            $scaled  = imagecreatetruecolor($tw, $th);
            imagecopyresampled($scaled, $img, 0, 0, 0, 0, $tw, $th, $ow, $oh);
            $cropped = imagecreatetruecolor(THUMB_W, THUMB_H);
            $cx      = max(0, (int)(($tw - THUMB_W) / 2));
            $cy      = max(0, (int)(($th - THUMB_H) / 2));
            imagecopy($cropped, $scaled, 0, 0, $cx, $cy, THUMB_W, THUMB_H);
            imagejpeg($cropped, $thumb, 82);

            imagedestroy($img);
            imagedestroy($scaled);
            imagedestroy($cropped);
        }
    } else {
        // Pas de GD — copie directe (extension .jpg déjà forcée)
        if (!move_uploaded_file($tmp, $dest)) {
            jout(['error' => 'Échec move_uploaded_file — vérifiez les permissions'], 500);
        }
        copy($dest, $thumb);
    }

    if (!file_exists($dest)) {
        jout(['error' => 'Fichier introuvable après copie — vérifiez les permissions du dossier'], 500);
    }

    // Photo principale ?
    $hp = $db->prepare("SELECT COUNT(*) FROM lounge_photos WHERE lounge_id = ? AND is_primary = 1");
    $hp->execute([$lounge_id]);
    $first         = (int)$hp->fetchColumn() === 0;
    $set_primary   = $first || $is_primary;

    if ($set_primary) {
        $db->prepare("UPDATE lounge_photos SET is_primary = 0 WHERE lounge_id = ?")->execute([$lounge_id]);
    }

    // Calcul sort_order sans sous-requête sur même table
    $so_stmt = $db->prepare("SELECT COALESCE(MAX(sort_order), 0) + 1 FROM lounge_photos WHERE lounge_id = ?");
    $so_stmt->execute([$lounge_id]);
    $sort_order = (int)$so_stmt->fetchColumn();

    // INSERT
    $ins = $db->prepare(
        "INSERT INTO lounge_photos
         (lounge_id, filename, caption, is_primary, is_approved, uploaded_by, uploader_ip, sort_order)
         VALUES (?, ?, ?, ?, 1, 'admin', ?, ?)"
    );
    $ins->execute([
        $lounge_id,
        $filename,
        $caption ?: null,
        $set_primary ? 1 : 0,
        get_ip(),
        $sort_order,
    ]);

    $photo_id = (int)$db->lastInsertId();

    jout([
        'success'    => true,
        'photo_id'   => $photo_id,
        'url'        => UPLOAD_URL . $lounge_id . '/' . $filename,
        'thumb'      => UPLOAD_URL . $lounge_id . '/thumb_' . $filename,
        'is_primary' => $set_primary,
        'message'    => 'Photo ajoutée avec succès',
    ]);
}

// ════════════════════════════════════════════════════════
// LIST
// ════════════════════════════════════════════════════════
function action_list(PDO $db): never {
    $lounge_id   = (int)($_GET['lounge_id']   ?? 0);
    $country_id  = trim($_GET['country_id']   ?? '');
    $lounge_name = trim($_GET['lounge_name']  ?? '');

    // Fallback : chercher l'id via country_id + name
    if (!$lounge_id && $country_id && $lounge_name) {
        $find = $db->prepare("SELECT id FROM lounges WHERE country_id=? AND name=? AND is_verified=1 LIMIT 1");
        $find->execute([$country_id, $lounge_name]);
        $row = $find->fetch();
        if ($row) $lounge_id = (int)$row['id'];
    }

    if (!$lounge_id) jout(['photos' => [], 'total' => 0]);

    $show_all = is_admin();
    $sql = "SELECT id, filename, caption, is_primary, is_approved, sort_order, created_at
            FROM lounge_photos WHERE lounge_id = ?" .
           ($show_all ? '' : ' AND is_approved = 1') .
           " ORDER BY is_primary DESC, sort_order ASC";

    $stmt = $db->prepare($sql);
    $stmt->execute([$lounge_id]);
    $photos = $stmt->fetchAll();

    $base = UPLOAD_URL . $lounge_id . '/';
    foreach ($photos as &$p) {
        $p['url']         = $base . $p['filename'];
        $p['thumb']       = $base . 'thumb_' . $p['filename'];
        $p['is_primary']  = (bool)$p['is_primary'];
        $p['is_approved'] = (bool)$p['is_approved'];
    }

    jout(['photos' => $photos, 'total' => count($photos)]);
}

// ════════════════════════════════════════════════════════
// DELETE
// ════════════════════════════════════════════════════════
function action_delete(PDO $db): never {
    if (!is_admin()) jout(['error' => 'Non autorisé'], 403);

    $photo_id = (int)($_POST['photo_id'] ?? 0);
    if (!$photo_id) jout(['error' => 'photo_id requis'], 400);

    $row = $db->prepare("SELECT lounge_id, filename FROM lounge_photos WHERE id = ?");
    $row->execute([$photo_id]);
    $photo = $row->fetch();
    if (!$photo) jout(['error' => 'Photo introuvable'], 404);

    // Supprimer les fichiers
    $dir = UPLOAD_DIR . $photo['lounge_id'] . '/';
    foreach ([$dir . $photo['filename'], $dir . 'thumb_' . $photo['filename']] as $f) {
        if (file_exists($f)) @unlink($f);
    }

    $db->prepare("DELETE FROM lounge_photos WHERE id = ?")->execute([$photo_id]);
    jout(['success' => true]);
}

// ════════════════════════════════════════════════════════
// PRIMARY
// ════════════════════════════════════════════════════════
function action_primary(PDO $db): never {
    if (!is_admin()) jout(['error' => 'Non autorisé'], 403);

    $photo_id = (int)($_POST['photo_id'] ?? 0);
    if (!$photo_id) jout(['error' => 'photo_id requis'], 400);

    $row = $db->prepare("SELECT lounge_id FROM lounge_photos WHERE id = ?");
    $row->execute([$photo_id]);
    $photo = $row->fetch();
    if (!$photo) jout(['error' => 'Photo introuvable'], 404);

    $db->prepare("UPDATE lounge_photos SET is_primary = 0 WHERE lounge_id = ?")->execute([$photo['lounge_id']]);
    $db->prepare("UPDATE lounge_photos SET is_primary = 1 WHERE id = ?")->execute([$photo_id]);
    jout(['success' => true]);
}

// ════════════════════════════════════════════════════════
// APPROVE (modération photos communautaires)
// ════════════════════════════════════════════════════════
function action_approve(PDO $db): never {
    if (!is_admin()) jout(['error' => 'Non autorisé'], 403);

    $photo_id = (int)($_POST['photo_id'] ?? 0);
    if (!$photo_id) jout(['error' => 'photo_id requis'], 400);

    $db->prepare("UPDATE lounge_photos SET is_approved = 1 WHERE id = ?")->execute([$photo_id]);
    jout(['success' => true]);
}