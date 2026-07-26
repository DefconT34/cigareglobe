<?php
// ════════════════════════════════════════════════════════════════════
// CigarOdyssey — Photo Seed v4 LOCAL (placeholders GD)
// Génère les images localement via GD — aucun téléchargement externe
//
// USAGE :
//   ?key=KEY                      → dry-run : liste ce qui sera fait
//   ?key=KEY&run=1                → tous les lounges sans photo
//   ?key=KEY&run=1&country=france → seulement un pays
//   ?key=KEY&run=1&lounge_id=42   → seulement un lounge
//   ?key=KEY&run=1&limit=20       → max N lounges
//   ?key=KEY&stats                → statistiques couverture
// ════════════════════════════════════════════════════════════════════
ini_set('display_errors', 1);
error_reporting(E_ALL);
set_time_limit(300);

require_once __DIR__ . '/config.php';

$key = $_GET['key'] ?? '';
if (!defined('ADMIN_KEY') || !hash_equals(ADMIN_KEY, $key)) {
    http_response_code(403); echo "Non autorisé — ?key=ADMIN_KEY requis"; exit;
}

header('Content-Type: text/plain; charset=utf-8');
ob_implicit_flush(true); if (ob_get_level()) ob_end_flush();

$RUN       = !empty($_GET['run']);
$COUNTRY   = trim($_GET['country']   ?? '');
$LOUNGE_ID = (int)($_GET['lounge_id'] ?? 0);
$LIMIT     = (int)($_GET['limit']    ?? 0);
$STATS     = !empty($_GET['stats']);

define('UPLOAD_BASE', dirname(__DIR__) . '/uploads/lounges/');
define('IMG_W',   800); define('IMG_H',   533);
define('THUMB_W', 400); define('THUMB_H', 267);

$db = getDB();

// ── MODE STATS ───────────────────────────────────────────────────────
if ($STATS) {
    echo "=== STATS PHOTOS ===\n\n";
    $total   = $db->query("SELECT COUNT(*) FROM lounges WHERE is_verified=1")->fetchColumn();
    $with    = $db->query("SELECT COUNT(DISTINCT lounge_id) FROM lounge_photos WHERE is_approved=1")->fetchColumn();
    echo "Total   : $total\nAvec    : $with (" . round($with/max(1,$total)*100) . "%)\nSans    : " . ($total-$with) . "\n\n";
    $rows = $db->query("
        SELECT l.country_id, COUNT(*) t,
               SUM(CASE WHEN p.lounge_id IS NOT NULL THEN 1 ELSE 0 END) w
        FROM lounges l
        LEFT JOIN (SELECT DISTINCT lounge_id FROM lounge_photos WHERE is_approved=1) p ON p.lounge_id=l.id
        WHERE l.is_verified=1 GROUP BY l.country_id ORDER BY t DESC
    ")->fetchAll(PDO::FETCH_ASSOC);
    foreach ($rows as $r) {
        $m = $r['t'] - $r['w'];
        if ($m == 0) continue;
        printf("  %-22s %3d total  %3d photos  %3d manquent\n", $r['country_id'], $r['t'], $r['w'], $m);
    }
    exit;
}

// ── COULEURS PAR PAYS ────────────────────────────────────────────────
// [R, G, B fond, R, G, B texte clair, texte label ville]
$COUNTRY_COLORS = [
    // Afrique
    'ivorycoast'  => [[34,85,34],   [255,220,100], 'Côte d\'Ivoire'],
    'morocco'     => [[180,30,30],  [255,200,100], 'Maroc'],
    'egypt'       => [[180,140,30], [255,255,255], 'Égypte'],
    'southafrica' => [[0,100,60],   [255,220,80],  'Afrique du Sud'],
    'kenya'       => [[180,30,30],  [255,200,80],  'Kenya'],
    'nigeria'     => [[0,130,60],   [255,255,255], 'Nigeria'],
    'ghana'       => [[180,100,0],  [255,220,80],  'Ghana'],
    'ethiopia'    => [[0,100,60],   [255,220,80],  'Éthiopie'],
    'tanzania'    => [[30,100,160], [255,220,80],  'Tanzanie'],
    'cameroon'    => [[0,120,0],    [255,220,80],  'Cameroun'],
    'senegal'     => [[30,100,160], [255,220,80],  'Sénégal'],
    'mali'        => [[160,100,0],  [255,220,80],  'Mali'],
    'botswana'    => [[30,100,160], [255,220,80],  'Botswana'],
    'angola'      => [[160,30,30],  [255,220,80],  'Angola'],
    'mozambique'  => [[30,120,60],  [255,220,80],  'Mozambique'],
    'zimbabwe'    => [[30,100,50],  [255,220,80],  'Zimbabwe'],
    'rwanda'      => [[30,100,160], [255,220,80],  'Rwanda'],
    'madagascar'  => [[160,30,100], [255,220,80],  'Madagascar'],
    'mauritius'   => [[30,120,160], [255,220,80],  'Maurice'],
    // Europe
    'france'      => [[20,50,140],  [255,210,50],  'France'],
    'uk'          => [[20,40,120],  [220,50,50],   'United Kingdom'],
    'germany'     => [[30,30,30],   [220,50,50],   'Deutschland'],
    'switzerland' => [[180,30,30],  [255,255,255], 'Schweiz'],
    'italy'       => [[30,120,30],  [220,50,50],   'Italia'],
    'spain'       => [[180,60,30],  [255,210,50],  'España'],
    'portugal'    => [[30,100,30],  [220,50,50],   'Portugal'],
    'belgium'     => [[30,30,30],   [220,50,50],   'Belgique'],
    'netherlands' => [[200,80,20],  [30,50,140],   'Nederland'],
    'sweden'      => [[30,80,160],  [255,210,50],  'Sverige'],
    'denmark'     => [[180,30,30],  [255,255,255], 'Danmark'],
    'norway'      => [[180,30,30],  [30,80,160],   'Norge'],
    'austria'     => [[180,30,30],  [255,255,255], 'Österreich'],
    'czech'       => [[30,50,140],  [180,30,30],   'Czech Republic'],
    'poland'      => [[180,30,30],  [255,255,255], 'Polska'],
    'hungary'     => [[180,30,30],  [30,80,30],    'Magyarország'],
    'greece'      => [[30,100,180], [255,255,255], 'Ελλάδα'],
    'turkey'      => [[180,30,30],  [255,210,50],  'Türkiye'],
    'russia'      => [[30,50,140],  [220,50,50],   'Россия'],
    'ukraine'     => [[30,100,180], [255,210,50],  'Україна'],
    'luxembourg'  => [[30,50,140],  [220,50,50],   'Luxembourg'],
    'andorra'     => [[30,50,140],  [220,50,50],   'Andorra'],
    'romania'     => [[30,50,140],  [255,210,50],  'România'],
    'bulgaria'    => [[30,50,140],  [255,255,255], 'България'],
    'serbia'      => [[180,30,30],  [30,50,140],   'Srbija'],
    'croatia'     => [[180,30,30],  [30,100,180],  'Hrvatska'],
    'cyprus'      => [[160,100,0],  [255,255,255], 'Κύπρος'],
    // Amériques
    'usa'         => [[30,50,140],  [220,50,50],   'United States'],
    'canada'      => [[180,30,30],  [255,255,255], 'Canada'],
    'brazil'      => [[30,120,50],  [255,210,50],  'Brasil'],
    'mexico'      => [[30,120,50],  [220,50,50],   'México'],
    'argentina'   => [[30,100,180], [255,255,255], 'Argentina'],
    'colombia'    => [[255,200,0],  [30,100,180],  'Colombia'],
    'peru'        => [[180,30,30],  [255,255,255], 'Perú'],
    'chile'       => [[30,50,140],  [220,50,50],   'Chile'],
    'venezuela'   => [[255,200,0],  [30,120,50],   'Venezuela'],
    'cuba'        => [[30,50,140],  [220,50,50],   'Cuba'],
    'dominicanrepublic'=>[[30,50,140],[220,50,50],'Dominican Rep.'],
    'nicaragua'   => [[30,120,50],  [30,50,140],   'Nicaragua'],
    'honduras'    => [[30,100,180], [255,255,255], 'Honduras'],
    'costarica'   => [[30,100,180], [220,50,50],   'Costa Rica'],
    'panama'      => [[30,50,140],  [220,50,50],   'Panamá'],
    'ecuador'     => [[255,200,0],  [30,50,140],   'Ecuador'],
    'guatemala'   => [[30,100,180], [255,255,255], 'Guatemala'],
    'paraguay'    => [[30,50,140],  [220,50,50],   'Paraguay'],
    'jamaica'     => [[255,200,0],  [30,50,140],   'Jamaica'],
    'aruba'       => [[30,130,190], [255,200,0],   'Aruba'],
    'barbados'    => [[30,50,140],  [255,200,50],  'Barbados'],
    'stkitts'     => [[30,120,50],  [255,200,50],  'St. Kitts'],
    'stmartin'    => [[220,50,50],  [30,50,140],   'Saint-Martin'],
    'caymanisles' => [[30,100,30],  [30,50,140],   'Cayman Islands'],
    // Asie-Pacifique
    'japan'       => [[180,30,30],  [255,255,255], 'Japan'],
    'china'       => [[180,30,30],  [255,200,0],   'China'],
    'hongkong'    => [[180,30,30],  [255,255,255], 'Hong Kong'],
    'singapore'   => [[180,30,30],  [255,255,255], 'Singapore'],
    'taiwan'      => [[30,50,140],  [220,50,50],   'Taiwan'],
    'southkorea'  => [[30,50,140],  [220,50,50],   'Korea'],
    'thailand'    => [[30,50,140],  [220,50,50],   'Thailand'],
    'malaysia'    => [[30,50,140],  [220,50,50],   'Malaysia'],
    'indonesia'   => [[180,30,30],  [255,255,255], 'Indonesia'],
    'australia'   => [[30,50,140],  [220,50,50],   'Australia'],
    'newzealand'  => [[30,50,140],  [255,255,255], 'New Zealand'],
    'india'       => [[200,80,20],  [30,120,50],   'India'],
    'philippines' => [[30,50,140],  [220,50,50],   'Philippines'],
    'vietnam'     => [[180,30,30],  [255,200,0],   'Vietnam'],
    'cambodia'    => [[30,50,140],  [220,30,30],   'Cambodia'],
    'myanmar'     => [[255,200,0],  [30,120,50],   'Myanmar'],
    // Moyen-Orient
    'uae'         => [[30,50,140],  [255,255,255], 'UAE'],
    'qatar'       => [[180,30,60],  [255,255,255], 'Qatar'],
    'saudiarabia' => [[30,120,50],  [255,255,255], 'Saudi Arabia'],
    'kuwait'      => [[30,120,50],  [180,30,30],   'Kuwait'],
    'bahrain'     => [[180,30,30],  [255,255,255], 'Bahrain'],
    'oman'        => [[30,120,50],  [255,255,255], 'Oman'],
    'lebanon'     => [[180,30,30],  [30,120,50],   'Lebanon'],
    'israel'      => [[30,50,140],  [255,255,255], 'Israel'],
    'jordan'      => [[180,30,30],  [30,50,140],   'Jordan'],
    'iran'        => [[30,120,50],  [255,255,255], 'Iran'],
    'armenia'     => [[220,50,50],  [30,50,140],   'Armenia'],
    'azerbaijan'  => [[30,130,190], [220,50,50],   'Azerbaijan'],
    'kazakhstan'  => [[30,130,190], [255,200,0],   'Kazakhstan'],
    // Amérique centrale
    'albania'     => [[220,50,50],  [30,30,30],    'Albania'],
    'gibraltar'   => [[180,30,30],  [255,255,255], 'Gibraltar'],
    'srilanka'    => [[180,30,30],  [255,200,0],   'Sri Lanka'],
    'pakistan'    => [[30,120,50],  [255,255,255], 'Pakistan'],
];

// ── GÉNÉRATION IMAGE GD ──────────────────────────────────────────────
function generate_placeholder(string $lounge_name, string $city, string $country_id, array $COUNTRY_COLORS, string $full_path, string $thumb_path): bool {

    if (!extension_loaded('gd')) return false;

    // Couleurs
    $cfg    = $COUNTRY_COLORS[$country_id] ?? [[40,40,80],[255,220,100],''];
    [$bg, $fg, $country_label] = $cfg;

    // ── Image principale (800×533) ────────────────────────────────────
    $img = imagecreatetruecolor(IMG_W, IMG_H);

    // Fond dégradé simulé : fond + bande sombre en bas
    $c_bg     = imagecolorallocate($img, $bg[0], $bg[1], $bg[2]);
    $c_dark   = imagecolorallocate($img, max(0,$bg[0]-40), max(0,$bg[1]-40), max(0,$bg[2]-40));
    $c_text   = imagecolorallocate($img, $fg[0], $fg[1], $fg[2]);
    $c_subtle = imagecolorallocate($img, min(255,$fg[0]+60), min(255,$fg[1]+60), min(255,$fg[2]+60));
    $c_white  = imagecolorallocate($img, 255, 255, 255);
    $c_black  = imagecolorallocate($img, 0, 0, 0);

    // Remplir fond
    imagefilledrectangle($img, 0, 0, IMG_W-1, IMG_H-1, $c_bg);

    // Bande sombre en bas (1/3)
    $band_y = (int)(IMG_H * 0.62);
    imagefilledrectangle($img, 0, $band_y, IMG_W-1, IMG_H-1, $c_dark);

    // Ligne de séparation
    imagesetthickness($img, 2);
    imageline($img, 0, $band_y, IMG_W, $band_y, $c_text);

    // Icône cigare stylisée (rectangle arrondi au centre-haut)
    $cx = IMG_W / 2; $cy = (int)(IMG_H * 0.30);
    // Corps du cigare
    imagesetthickness($img, 1);
    $cig_w = 200; $cig_h = 16;
    imagefilledrectangle($img, (int)($cx - $cig_w/2), $cy - $cig_h/2,
                               (int)($cx + $cig_w/2), $cy + $cig_h/2, $c_text);
    // Bague (bande au tiers)
    $band_x = (int)($cx - $cig_w/2 + $cig_w/3);
    $c_band = imagecolorallocate($img, min(255,$fg[0]+80), min(255,$fg[1]+80), min(255,$fg[2]+80));
    imagefilledrectangle($img, $band_x, $cy - $cig_h/2 - 3, $band_x + 18, $cy + $cig_h/2 + 3, $c_band);
    // Tip incandescent
    $tip_x = (int)($cx + $cig_w/2);
    $c_ember = imagecolorallocate($img, 255, 120, 30);
    imagefilledellipse($img, $tip_x + 6, $cy, 10, 10, $c_ember);

    // Texte : nom du lounge (grande police)
    $font = 5; // police GD intégrée max
    $name_short = $lounge_name;
    // Tronquer si trop long
    if (strlen($name_short) > 38) {
        $name_short = substr($name_short, 0, 35) . '...';
    }
    // Supprimer la partie après " — " pour garder seulement le nom principal
    $name_display = preg_replace('/\s*—.*$/', '', $name_short);
    if (strlen($name_display) > 38) $name_display = substr($name_display, 0, 35) . '...';

    // Centrer le texte
    $fw = imagefontwidth($font); $fh = imagefontheight($font);
    $tx = max(10, (int)(IMG_W/2 - strlen($name_display)*$fw/2));
    $ty = (int)(IMG_H * 0.50);
    imagestring($img, $font, $tx, $ty, $name_display, $c_text);

    // Sous-titre : ville
    $city_short = explode(',', $city)[0];
    $city_short = preg_replace('/\s*—.*$/', '', $city_short);
    if (strlen($city_short) > 45) $city_short = substr($city_short, 0, 42) . '...';
    $font2 = 4;
    $fw2 = imagefontwidth($font2);
    $tx2 = max(10, (int)(IMG_W/2 - strlen($city_short)*$fw2/2));
    imagestring($img, $font2, $tx2, $ty + $fh + 8, $city_short, $c_subtle);

    // Label pays en bas
    $font3 = 3;
    $fw3 = imagefontwidth($font3);
    $country_str = strtoupper($country_label ?: $country_id);
    $tx3 = max(10, (int)(IMG_W/2 - strlen($country_str)*$fw3/2));
    imagestring($img, $font3, $tx3, $band_y + 12, $country_str, $c_text);

    // Watermark discret "CigarOdyssey" en bas droite
    $wm = 'CigarOdyssey';
    $wm_x = IMG_W - strlen($wm)*imagefontwidth(2) - 10;
    $c_wm = imagecolorallocate($img, min(255,$bg[0]+60), min(255,$bg[1]+60), min(255,$bg[2]+60));
    imagestring($img, 2, $wm_x, IMG_H - 18, $wm, $c_wm);

    // Sauvegarder full
    $ok1 = imagejpeg($img, $full_path, 85);
    imagedestroy($img);

    // ── Thumbnail (400×267) ───────────────────────────────────────────
    $img2 = imagecreatetruecolor(THUMB_W, THUMB_H);
    $full_img = @imagecreatefromjpeg($full_path);
    if ($full_img) {
        imagecopyresampled($img2, $full_img, 0, 0, 0, 0, THUMB_W, THUMB_H, IMG_W, IMG_H);
        imagedestroy($full_img);
    } else {
        // Régénérer le thumb directement
        $c_bg2 = imagecolorallocate($img2, $bg[0], $bg[1], $bg[2]);
        imagefilledrectangle($img2, 0, 0, THUMB_W-1, THUMB_H-1, $c_bg2);
        $c_t2 = imagecolorallocate($img2, $fg[0], $fg[1], $fg[2]);
        imagestring($img2, 4, 10, (int)(THUMB_H/2 - 8), substr($name_display, 0, 28), $c_t2);
    }
    $ok2 = imagejpeg($img2, $thumb_path, 82);
    imagedestroy($img2);

    return $ok1 && $ok2;
}

// ── CHARGEMENT LOUNGES DB ─────────────────────────────────────────────
echo "=== CigarOdyssey Photo Seed v4 — Placeholders locaux ===\n";
echo ($RUN ? "MODE : EXÉCUTION\n" : "MODE : DRY-RUN (ajoutez &run=1 pour exécuter)\n");
if ($COUNTRY)   echo "Filtre pays   : $COUNTRY\n";
if ($LOUNGE_ID) echo "Filtre lounge : #$LOUNGE_ID\n";
if ($LIMIT)     echo "Limite        : $LIMIT\n";
echo "\n";

// Vérification GD
if (!extension_loaded('gd')) {
    echo "✗ Extension GD absente — impossible de générer des images\n"; exit;
}
echo "✓ GD disponible\n";

// Vérification uploads dir
if (!is_dir(UPLOAD_BASE)) @mkdir(UPLOAD_BASE, 0755, true);
if (!is_writable(UPLOAD_BASE)) { echo "✗ /uploads/lounges/ non accessible en écriture\n"; exit; }
echo "✓ /uploads/lounges/ accessible\n\n";

// Requête
$sql_q = "SELECT l.id, l.country_id, l.name, l.city, l.type,
                 COUNT(p.id) AS photo_count
          FROM lounges l
          LEFT JOIN lounge_photos p ON p.lounge_id=l.id AND p.is_approved=1
          WHERE l.is_verified=1";
$params = [];
if ($LOUNGE_ID) { $sql_q .= " AND l.id=?";           $params[] = $LOUNGE_ID; }
elseif ($COUNTRY){ $sql_q .= " AND l.country_id=?";  $params[] = $COUNTRY;   }
$sql_q .= " GROUP BY l.id HAVING photo_count=0 ORDER BY l.country_id, l.name";
if ($LIMIT) $sql_q .= " LIMIT " . (int)$LIMIT;

$st = $db->prepare($sql_q); $st->execute($params);
$lounges = $st->fetchAll(PDO::FETCH_ASSOC);

echo "Lounges sans photo : " . count($lounges) . "\n\n";
if (!$lounges) { echo "✅ Tous les lounges ont déjà une photo !\n→ ?stats pour les statistiques.\n"; exit; }

// ── BOUCLE ────────────────────────────────────────────────────────────
$ok = $err = $skip = 0;

foreach ($lounges as $lounge) {
    $lid     = (int)$lounge['id'];
    $country = $lounge['country_id'];
    $name    = $lounge['name'];
    $city    = $lounge['city'];

    $caption = $name . ' — ' . explode(',', $city)[0];

    if (!$RUN) {
        printf("  [%-14s] %-45s  →  placeholder GD\n", $country, mb_substr($name,0,45));
        continue;
    }

    echo "🏪 [$country] $name (id=$lid)\n";

    // Dossier
    $dir = UPLOAD_BASE . $lid . '/';
    if (!is_dir($dir) && !@mkdir($dir, 0755, true)) {
        echo "   ✗ mkdir échoué\n\n"; $err++; continue;
    }

    // Nom de fichier basé sur le lounge_id (unique, stable)
    $fn    = 'placeholder_' . $lid . '.jpg';
    $tfn   = 'thumb_' . $fn;
    $dfull = $dir . $fn;
    $dthm  = $dir . $tfn;

    // Déjà en DB ?
    $chk = $db->prepare("SELECT id FROM lounge_photos WHERE lounge_id=? AND filename=? LIMIT 1");
    $chk->execute([$lid, $fn]);
    if ($chk->fetch()) { echo "   ⏭  Déjà présent\n\n"; $skip++; continue; }

    // Générer l'image
    echo "   🎨 Génération placeholder... ";
    if (!generate_placeholder($name, $city, $country, $COUNTRY_COLORS, $dfull, $dthm)) {
        echo "ÉCHEC GD\n\n"; $err++; continue;
    }
    echo "✓ — ";

    // INSERT DB
    $ins = $db->prepare("INSERT INTO lounge_photos
        (lounge_id, filename, caption, is_primary, is_approved, uploaded_by, sort_order)
        VALUES (?,?,?,1,1,'admin',0)");
    $ins->execute([$lid, $fn, $caption]);
    echo "DB ✓\n\n";
    $ok++;
}

echo "══════════════════════════════════\n";
if ($RUN) {
    echo "✅ Générées  : $ok\n⏭  Ignorées  : $skip\n❌ Erreurs   : $err\n";
    echo "\n→ ?stats pour voir la couverture\n";
} else {
    echo count($lounges) . " lounges à traiter.\n";
    echo "Ajoutez &run=1 pour exécuter.\n";
    echo "Ou &run=1&country=france pour commencer par un pays.\n";
}
echo "\n⚠️  Supprimer ce fichier après usage !\n";