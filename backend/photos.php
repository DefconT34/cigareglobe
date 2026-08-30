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
    echo json_encode(err('server_error', 'Erreur serveur.'));
    exit;
});
set_exception_handler(function($e) {
    http_response_code(500);
    header('Content-Type: application/json; charset=utf-8');
    error_log('[photos.php] ' . $e->getMessage());
    echo json_encode(err('server_error', 'Erreur serveur.'));
    exit;
});

require_once __DIR__ . '/config.php';
require_once __DIR__ . '/image_lib.php';
require_once __DIR__ . '/auth_lib.php';
// journaliser() : approuver, masquer et supprimer une photo sont des
// décisions de modération, et s'inscrivent au journal commun.
require_once __DIR__ . '/moderation_lib.php';

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
// Passe par cors_headers() comme les autres points d'entree : l'envoi
// de photos s'appuie sur la session, et l'ancien « * » code en dur
// ignorait ALLOWED_ORIGIN.
cors_headers(true);
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, X-CSRF-Token');

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
        case 'hide':    action_hide($db);    break;
        default: jout(['error' => 'Action inconnue: ' . $action], 404);
    }
} catch (PDOException $e) {
    error_log('[photos.php] SQL ' . $e->getMessage());
    jout(err('db_error', 'Erreur base de données.'), 500);
} catch (Throwable $e) {
    error_log('[photos.php] ' . $e->getMessage());
    jout(err('server_error', 'Erreur serveur.'), 500);
}

// ════════════════════════════════════════════════════════
// UPLOAD
// ════════════════════════════════════════════════════════
function action_upload(PDO $db): never {
    if (!is_admin()) jout(err('forbidden', 'Non autorisé'), 403);

    $lounge_id  = (int)($_POST['lounge_id'] ?? 0);
    $caption    = trim(strip_tags($_POST['caption']    ?? ''));
    $is_primary = !empty($_POST['is_primary']) && $_POST['is_primary'] !== '0';

    if (!$lounge_id) jout(err('id_required', 'lounge_id manquant'), 400);

    // Vérifier que le lounge existe
    $chk = $db->prepare("SELECT id FROM lounges WHERE id = ? AND is_verified = 1");
    $chk->execute([$lounge_id]);
    if (!$chk->fetch()) jout(['error' => 'Lounge introuvable (id=' . $lounge_id . ')'], 404);

    // Vérifier quota
    $cnt = $db->prepare("SELECT COUNT(*) FROM lounge_photos WHERE lounge_id = ?");
    $cnt->execute([$lounge_id]);
    if ((int)$cnt->fetchColumn() >= MAX_PER_LOUNGE) {
        jout(err('photo_quota', 'Quota atteint (10 photos max par lounge)'), 429);
    }

    // Vérifier fichier uploadé
    if (!isset($_FILES['photo'])) {
        jout(err('file_missing', 'Aucun fichier reçu (clé "photo" manquante)'), 400);
    }

    $file = $_FILES['photo'];

    // Verification et ecriture : une seule chaine pour tout le site
    // (backend/image_lib.php). Elle RECONSTRUIT l'image au lieu de la
    // copier — ce qui supprime les EXIF et neutralise les fichiers
    // polyglottes — et refuse desormais tout ce qu'elle ne sait pas
    // decoder. L'ancien repli `move_uploaded_file()` copiait le fichier
    // brut quand GD manquait : acceptable tant que seule l'administration
    // televersait, plus du tout depuis que la communaute le peut.
    if ($stop = image_verifier($file)) jout(err($stop[0], $stop[1]), 400);

    $tmp = $file['tmp_name'];

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

    // Toujours .jpg en sortie — Safari refuse une image dont l'extension
    // ne correspond pas au contenu reel.
    $filename = uniqid('p', true) . '.jpg';
    $dest     = $dir . $filename;
    $thumb    = $dir . 'thumb_' . $filename;

    if ($stop = image_ecrire($tmp, $dest, $thumb)) jout(err($stop[0], $stop[1]), 415);

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
    // Portée « admin » exigée : la suppression efface les fichiers du
    // disque, et rien ne les ramène. Un modérateur dispose de `hide`,
    // qui retire la photo du site sans la détruire — c'est le geste
    // proportionné pour une image déplacée. Voir PORTEE_ADMIN_SEULEMENT.
    if (!portee_autorise(admin_scope($db), 'photo_supprimer')) {
        jout(err('forbidden', 'La suppression définitive est réservée à '
            . "l'administration. Utilisez « masquer »."), 403);
    }

    $photo_id = (int)($_POST['photo_id'] ?? 0);
    if (!$photo_id) jout(err('id_required', 'photo_id requis'), 400);

    $row = $db->prepare("SELECT lounge_id, filename FROM lounge_photos WHERE id = ?");
    $row->execute([$photo_id]);
    $photo = $row->fetch();
    if (!$photo) jout(err('not_found_photo', 'Photo introuvable'), 404);

    // Supprimer les fichiers
    $dir = UPLOAD_DIR . $photo['lounge_id'] . '/';
    foreach ([$dir . $photo['filename'], $dir . 'thumb_' . $photo['filename']] as $f) {
        if (file_exists($f)) @unlink($f);
    }

    $db->prepare("DELETE FROM lounge_photos WHERE id = ?")->execute([$photo_id]);
    // Journalisé APRÈS coup, avec le nom de fichier : la ligne détruite
    // ne peut plus rien dire d'elle-même.
    journaliser($db, 'photo_supprimer', 'photo', $photo_id,
        'lounge #' . $photo['lounge_id'] . ' · ' . $photo['filename']);
    jout(['success' => true]);
}

// ════════════════════════════════════════════════════════
// PRIMARY
// ════════════════════════════════════════════════════════
function action_primary(PDO $db): never {
    if (!is_admin()) jout(err('forbidden', 'Non autorisé'), 403);

    $photo_id = (int)($_POST['photo_id'] ?? 0);
    if (!$photo_id) jout(err('id_required', 'photo_id requis'), 400);

    $row = $db->prepare("SELECT lounge_id FROM lounge_photos WHERE id = ?");
    $row->execute([$photo_id]);
    $photo = $row->fetch();
    if (!$photo) jout(err('not_found_photo', 'Photo introuvable'), 404);

    $db->prepare("UPDATE lounge_photos SET is_primary = 0 WHERE lounge_id = ?")->execute([$photo['lounge_id']]);
    $db->prepare("UPDATE lounge_photos SET is_primary = 1 WHERE id = ?")->execute([$photo_id]);
    jout(['success' => true]);
}

// ════════════════════════════════════════════════════════
// APPROVE (modération photos communautaires)
// ════════════════════════════════════════════════════════
function action_approve(PDO $db): never {
    if (!is_admin()) jout(err('forbidden', 'Non autorisé'), 403);

    $photo_id = (int)($_POST['photo_id'] ?? 0);
    if (!$photo_id) jout(err('id_required', 'photo_id requis'), 400);

    $db->prepare("UPDATE lounge_photos SET is_approved = 1 WHERE id = ?")->execute([$photo_id]);
    journaliser($db, 'photo_approuver', 'photo', $photo_id);
    jout(['success' => true]);
}

// ════════════════════════════════════════════════════════
// HIDE — le retrait réversible
// ────────────────────────────────────────────────────────
// Le pendant d'`approve`, qui n'existait pas : une photo approuvée ne
// pouvait que rester ou être détruite. Un modérateur avait donc le
// choix entre laisser une image déplacée en ligne et effacer un fichier
// pour toujours. `hide` la retire du site en la gardant sur le disque —
// une décision qu'on peut relire, discuter, et annuler d'un clic.
// ════════════════════════════════════════════════════════
function action_hide(PDO $db): never {
    if (!is_admin()) jout(err('forbidden', 'Non autorisé'), 403);

    $photo_id = (int)($_POST['photo_id'] ?? 0);
    if (!$photo_id) jout(err('id_required', 'photo_id requis'), 400);

    // is_primary retombe avec l'approbation : une photo masquée qui
    // resterait « principale » laisserait la fiche pointer une image que
    // le site ne sert plus.
    $db->prepare("UPDATE lounge_photos SET is_approved = 0, is_primary = 0 WHERE id = ?")
       ->execute([$photo_id]);
    journaliser($db, 'photo_masquer', 'photo', $photo_id);
    jout(['success' => true]);
}