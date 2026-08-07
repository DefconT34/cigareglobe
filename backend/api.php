<?php
// ════════════════════════════════════════════════════════
// api.php — API REST CigarOdyssey
// Compatible PHP 8.0+ (cPanel/OVH/Infomaniak)
// ════════════════════════════════════════════════════════

require_once __DIR__ . '/config.php';
require_once __DIR__ . '/auth_lib.php';
require_once __DIR__ . '/moderation_lib.php';
require_once __DIR__ . '/mailer.php';

auth_session_start();

// ── Headers ───────────────────────────────────────────────
cors_headers(true);
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, X-CSRF-Token');
header('Content-Type: application/json; charset=utf-8');

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(204);
    exit;
}

// ── Auth : exige un compte avec email vérifié ─────────────
function require_verified(PDO $db): array {
    $u = require_auth($db);            // 401 si non connecté
    if (!$u['email_verified']) {
        respond(['error' => 'Vérifiez votre email pour contribuer ou noter.', 'need_verify' => true], 403);
    }
    return $u;
}

// ── Helpers ───────────────────────────────────────────────
function json_out(array $data, int $code = 200): void {
    http_response_code($code);
    echo json_encode($data, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    exit;
}

function get_ip(): string {
    foreach (['HTTP_CF_CONNECTING_IP','HTTP_X_FORWARDED_FOR','HTTP_X_REAL_IP','REMOTE_ADDR'] as $key) {
        if (!empty($_SERVER[$key])) {
            return trim(explode(',', $_SERVER[$key])[0]);
        }
    }
    return '0.0.0.0';
}

function is_admin(): bool {
    // Session d'administration, role moderator/admin, ou en-tete X-Admin-Key.
    // Le parametre d'URL admin_key n'est plus accepte : il fuitait dans les
    // logs du serveur, l'historique du navigateur et l'en-tete Referer.
    return is_admin_request(getDB());
}

function clean(string $s, int $max = 500): string {
    return mb_substr(trim(strip_tags($s)), 0, $max);
}

// ── Routing ───────────────────────────────────────────────
$action = clean($_GET['action'] ?? '', 30);
$method = $_SERVER['REQUEST_METHOD'];

// Les actions qui écrivent au nom de l'utilisateur exigent un jeton CSRF
$CSRF_ACTIONS = ['submit','rate','review','review_delete','review_flag','fav_toggle','profile_update'];
if (in_array($action, $CSRF_ACTIONS, true) && $method === 'POST') {
    csrf_verify();
}

try {
    if     ($action === 'list'    && $method === 'GET')  { action_list(); }
    elseif ($action === 'all'     && $method === 'GET')  { action_all(); }
    elseif ($action === 'submit'  && $method === 'POST') { action_submit(); }
    elseif ($action === 'vote'    && $method === 'POST') { action_vote(); }
    elseif ($action === 'rate'    && $method === 'POST') { action_rate(); }
    elseif ($action === 'review'  && $method === 'POST') { action_review(); }
    elseif ($action === 'review_delete' && $method === 'POST') { action_review_delete(); }
    elseif ($action === 'reviews' && $method === 'GET')  { action_reviews(); }
    elseif ($action === 'review_flag' && $method === 'POST') { action_review_flag(); }
    elseif ($action === 'my_ratings'     && $method === 'GET') { action_my_ratings(); }
    elseif ($action === 'my_contributions' && $method === 'GET') { action_my_contributions(); }
    elseif ($action === 'fav_toggle' && $method === 'POST') { action_fav_toggle(); }
    elseif ($action === 'fav_states' && $method === 'GET')  { action_fav_states(); }
    elseif ($action === 'fav_list'   && $method === 'GET')  { action_fav_list(); }
    elseif ($action === 'profile'        && $method === 'GET')  { action_profile(); }
    elseif ($action === 'profile_update' && $method === 'POST') { action_profile_update(); }
    elseif ($action === 'approve' && $method === 'POST') { action_approve(); }
    elseif ($action === 'reject'  && $method === 'POST') { action_reject(); }
    elseif ($action === 'export'  && $method === 'GET')  { action_export(); }
    elseif ($action === 'stats'   && $method === 'GET')  { action_stats(); }
    else   { json_out(err('unknown_action', 'Action inconnue'), 404); }
} catch (Throwable $e) {
    json_out(err('server_error', 'Erreur serveur'), 500);
}

// ════════════════════════════════════════════════════════
// GET list — contributions d'un pays
// ════════════════════════════════════════════════════════
function action_list(): void {
    $country = clean($_GET['country'] ?? '', 50);
    if (!$country) json_out(err('country_required', 'Paramètre country requis'), 400);

    $db   = getDB();
    $ip   = get_ip();

    $stmt = $db->prepare(
        "SELECT id, name, city, type, phone, description, source_url,
                votes_up, votes_down, status, created_at
         FROM contributions
         WHERE country_id = :cid AND status IN ('pending','approved')
         ORDER BY votes_up DESC, created_at DESC
         LIMIT 50"
    );
    $stmt->execute([':cid' => $country]);
    $rows = $stmt->fetchAll();

    // Ajouter le vote de l'utilisateur actuel
    foreach ($rows as &$row) {
        $v = $db->prepare("SELECT vote FROM votes WHERE contribution_id = ? AND voter_ip = ?");
        $v->execute([$row['id'], $ip]);
        $row['my_vote'] = (int)($v->fetchColumn() ?: 0);
        $row['votes_up']   = (int)$row['votes_up'];
        $row['votes_down'] = (int)$row['votes_down'];
    }

    json_out(['contributions' => $rows, 'count' => count($rows)]);
}

// ════════════════════════════════════════════════════════
// GET all — toutes les contributions (admin)
// ════════════════════════════════════════════════════════
function action_all(): void {
    if (!is_admin()) json_out(err('forbidden', 'Accès refusé'), 403);

    $status = clean($_GET['status'] ?? 'pending', 20);
    if (!in_array($status, ['pending','approved','rejected','all'])) $status = 'pending';

    $db   = getDB();
    $sql  = "SELECT *, (votes_up - votes_down) AS score_net FROM contributions";
    if ($status !== 'all') $sql .= " WHERE status = :status";
    $sql .= " ORDER BY score_net DESC, created_at DESC LIMIT 500";

    $stmt = $db->prepare($sql);
    $status !== 'all' ? $stmt->execute([':status' => $status]) : $stmt->execute();

    json_out(['contributions' => $stmt->fetchAll()]);
}

// ════════════════════════════════════════════════════════
// POST submit — soumettre une contribution
// ════════════════════════════════════════════════════════
function action_submit(): void {
    $db   = getDB();
    $user = require_verified($db);      // compte + email vérifié obligatoires

    $raw  = file_get_contents('php://input');
    $body = json_decode($raw, true) ?? [];
    if (empty($body)) $body = $_POST;

    // Champs requis
    foreach (['country_id','country_name','name','city','description'] as $f) {
        if (empty(trim($body[$f] ?? ''))) {
            json_out(['error' => "Champ manquant : $f"], 400);
        }
    }

    $ip = get_ip();

    // Anti-spam : quota journalier par compte. Les contributeurs de
    // confiance (ajouts publiés sans modération) bénéficient d'un plafond
    // relevé — les brider à 3/jour viderait le statut de son intérêt.
    $daily_cap = is_trusted_role($user['role']) ? 20 : 3;
    $spam = $db->prepare(
        "SELECT COUNT(*) FROM contributions
         WHERE user_id = ? AND created_at > DATE_SUB(NOW(), INTERVAL 24 HOUR)"
    );
    $spam->execute([$user['id']]);
    if ((int)$spam->fetchColumn() >= $daily_cap) {
        json_out(['error' => 'Limite atteinte : ' . $daily_cap . ' contributions par jour maximum.'], 429);
    }

    // Anti-doublon : même nom + même pays déjà signalé
    $dup = $db->prepare(
        "SELECT id FROM contributions
         WHERE country_id = ? AND name = ? AND status != 'rejected' LIMIT 1"
    );
    $dup->execute([clean($body['country_id'],50), clean($body['name'],200)]);
    if ($dup->fetch()) {
        json_out(err('already_reported', 'Cet établissement a déjà été signalé pour ce pays.'), 409);
    }

    // Position relevée sur place (migration 011) — facultative.
    //
    // Elle vient du client : on ne lui fait pas confiance. Hors plage,
    // non numérique ou absente, on stocke NULL plutôt que de refuser
    // l'envoi — une coordonnée douteuse ne doit pas faire perdre un
    // signalement par ailleurs valable. Le couple est tout ou rien :
    // une latitude sans longitude ne désigne rien.
    $lat = $lon = null;
    if (isset($body['lat'], $body['lon']) && is_numeric($body['lat']) && is_numeric($body['lon'])) {
        $la = (float)$body['lat'];
        $lo = (float)$body['lon'];
        // (0, 0) est au large du golfe de Guinée : c'est la signature
        // d'un capteur muet, pas d'un établissement.
        if ($la >= -90 && $la <= 90 && $lo >= -180 && $lo <= 180
            && !($la === 0.0 && $lo === 0.0)) {
            $lat = round($la, 7);
            $lon = round($lo, 7);
        }
    }

    // Insertion (attribuée au compte)
    $stmt = $db->prepare(
        "INSERT INTO contributions
         (user_id, country_id, country_name, name, city, type, phone, description, source_url, contributor_email, contributor_ip, lat, lon)
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
    );
    $stmt->execute([
        (int)$user['id'],
        clean($body['country_id'],    50),
        clean($body['country_name'], 100),
        clean($body['name'],         200),
        clean($body['city'],         200),
        clean($body['type'] ?? 'Cave à Cigares', 100),
        clean($body['phone']       ?? '', 50),
        clean($body['description'], 2000),
        clean($body['source_url']  ?? '', 500),
        $user['email'],
        $ip,
        $lat,
        $lon,
    ]);

    $id = (int)$db->lastInsertId();

    // Contributeur de confiance : publication immédiate, sans file de modération
    $auto_approved = false;
    if (is_trusted_role($user['role'])) {
        $auto_approved = approve_contribution($db, $id);
    }

    // Notification à l'administration. Passe par send_email() : l'appel
    // direct à mail() contournait le mode journal du développement et
    // pouvait bloquer la requête sur un délai SMTP.
    if (ADMIN_EMAIL !== '' && ADMIN_EMAIL !== 'vous@example.com' && ADMIN_EMAIL !== 'votre@email.com') {
        $esc     = fn($s) => htmlspecialchars((string)$s, ENT_QUOTES, 'UTF-8');
        $subject = '[CigarOdyssey] ' . ($auto_approved ? 'Contribution publiée (confiance)' : 'Nouvelle contribution')
                 . ' : ' . $body['name'];
        $html = '<p><strong>' . $esc($body['name']) . '</strong><br>'
              . $esc($body['city']) . ' — ' . $esc($body['country_name']) . '<br>'
              . $esc($body['type'] ?? '') . '</p>'
              . '<p>' . nl2br($esc(mb_substr($body['description'], 0, 300))) . '</p>'
              . '<p><a href="' . $esc(site_url() . '/backend/admin.php') . '">Ouvrir la modération</a></p>';
        send_email(ADMIN_EMAIL, $subject, $html);
    }

    json_out(['success' => true, 'id' => $id, 'auto_approved' => $auto_approved]);
}

// ════════════════════════════════════════════════════════
// POST vote — voter pour une contribution
// ════════════════════════════════════════════════════════
function action_vote(): void {
    $body = json_decode(file_get_contents('php://input'), true) ?? [];
    $id   = (int)($body['id']   ?? 0);
    $vote = (int)($body['vote'] ?? 0);

    if (!$id || !in_array($vote, [1, -1])) {
        json_out(err('params_invalid', 'Paramètres invalides'), 400);
    }

    $ip = get_ip();
    $db = getDB();

    // Contribution existe et est en attente ?
    $c = $db->prepare("SELECT id, votes_up, votes_down FROM contributions WHERE id = ? AND status = 'pending'");
    $c->execute([$id]);
    $contrib = $c->fetch();
    if (!$contrib) json_out(err('not_found_contribution', 'Contribution introuvable ou déjà traitée'), 404);

    // Vote existant ?
    $prev_stmt = $db->prepare("SELECT vote FROM votes WHERE contribution_id = ? AND voter_ip = ?");
    $prev_stmt->execute([$id, $ip]);
    $prev = $prev_stmt->fetchColumn();

    if ($prev !== false) {
        $prev = (int)$prev;
        if ($prev === $vote) json_out(err('already_voted', 'Vous avez déjà voté de cette façon'), 409);

        // Changer de vote
        $db->prepare("UPDATE votes SET vote = ? WHERE contribution_id = ? AND voter_ip = ?")->execute([$vote, $id, $ip]);
        if ($vote === 1) {
            $db->prepare("UPDATE contributions SET votes_up = votes_up+1, votes_down = votes_down-1 WHERE id = ?")->execute([$id]);
        } else {
            $db->prepare("UPDATE contributions SET votes_up = votes_up-1, votes_down = votes_down+1 WHERE id = ?")->execute([$id]);
        }
    } else {
        // Nouveau vote
        $db->prepare("INSERT INTO votes (contribution_id, voter_ip, vote) VALUES (?,?,?)")->execute([$id, $ip, $vote]);
        if ($vote === 1) {
            $db->prepare("UPDATE contributions SET votes_up = votes_up+1 WHERE id = ?")->execute([$id]);
        } else {
            $db->prepare("UPDATE contributions SET votes_down = votes_down+1 WHERE id = ?")->execute([$id]);
        }
    }

    // Nouveaux compteurs
    $counts_stmt = $db->prepare("SELECT votes_up, votes_down FROM contributions WHERE id = ?");
    $counts_stmt->execute([$id]);
    $counts = $counts_stmt->fetch();
    $up   = (int)$counts['votes_up'];
    $down = (int)$counts['votes_down'];

    // Auto-approbation (seuil = 3)
    $approved = false;
    if ($up >= VOTES_TO_APPROVE) {
        approve_contribution($db, $id);
        $approved = true;
    }

    // Auto-rejet (seuil = 3)
    $rejected = false;
    if ($down >= VOTES_TO_REJECT) {
        $db->prepare("UPDATE contributions SET status='rejected' WHERE id=?")->execute([$id]);
        $rejected = true;
    }

    json_out([
        'success'    => true,
        'votes_up'   => $up,
        'votes_down' => $down,
        'approved'   => $approved,
        'rejected'   => $rejected,
        'my_vote'    => $vote,
    ]);
}

// ════════════════════════════════════════════════════════
// APPROBATION & CONTRIBUTEURS DE CONFIANCE
// ════════════════════════════════════════════════════════

// ════════════════════════════════════════════════════════
// POST approve / reject — modération manuelle (admin)
// ════════════════════════════════════════════════════════
function action_approve(): void {
    if (!is_admin()) json_out(err('forbidden', 'Accès refusé'), 403);
    $id = (int)($_GET['id'] ?? 0);
    if (!$id) json_out(err('id_required', 'id manquant'), 400);

    approve_contribution(getDB(), $id);
    json_out(['success' => true]);
}

function action_reject(): void {
    if (!is_admin()) json_out(err('forbidden', 'Accès refusé'), 403);
    $id = (int)($_GET['id'] ?? 0);
    if (!$id) json_out(err('id_required', 'id manquant'), 400);
    getDB()->prepare("UPDATE contributions SET status='rejected' WHERE id=?")->execute([$id]);
    json_out(['success' => true]);
}

// ════════════════════════════════════════════════════════
// GET stats — statistiques publiques
// ════════════════════════════════════════════════════════
function action_stats(): void {
    $db = getDB();
    $total    = $db->query("SELECT COUNT(*) FROM contributions WHERE status='pending'")->fetchColumn();
    $approved = $db->query("SELECT COUNT(*) FROM contributions WHERE status='approved'")->fetchColumn();
    json_out(['pending' => (int)$total, 'approved' => (int)$approved]);
}

// ════════════════════════════════════════════════════════
// GET export — générer le JS des approuvés (admin)
// ════════════════════════════════════════════════════════
function action_export(): void {
    if (!is_admin()) json_out(err('forbidden', 'Accès refusé'), 403);

    $db   = getDB();
    $rows = $db->query(
        "SELECT * FROM approved_lounges ORDER BY country_id, approved_at"
    )->fetchAll();

    // Grouper par pays
    $byCountry = [];
    foreach ($rows as $r) $byCountry[$r['country_id']][] = $r;

    $js  = "// ═══════════════════════════════════════════════════\n";
    $js .= "// Établissements approuvés — exporté le " . date('Y-m-d H:i') . "\n";
    $js .= "// Copiez ces entrées dans data.lounges.js\n";
    $js .= "// ═══════════════════════════════════════════════════\n\n";

    foreach ($byCountry as $cid => $lounges) {
        $js .= "  // ── $cid (" . count($lounges) . " nouveaux) ──\n";
        foreach ($lounges as $l) {
            $name  = str_replace('"', '\\"', $l['name']);
            $city  = str_replace('"', '\\"', $l['city']);
            $type  = str_replace('"', '\\"', $l['type']);
            $phone = str_replace('"', '\\"', $l['phone'] ?? '');
            $desc  = str_replace('"', '\\"', $l['description']);
            $src   = $l['source_url'] ? ' (Source: ' . str_replace('"','\\"',$l['source_url']) . ')' : ' (Source: contribution communauté)';

            $js .= "  { name:\"$name\", city:\"$city\", type:\"$type\",\n";
            $js .= "    phone:\"$phone\", price:\"€€€\",\n";
            $js .= "    desc:\"$desc$src\" },\n";
        }
        $js .= "\n";
    }

    header('Content-Type: text/plain; charset=utf-8');
    header('Content-Disposition: attachment; filename="lounges_approved_' . date('Ymd_Hi') . '.js"');
    echo $js;
    exit;
}

// ════════════════════════════════════════════════════════════
// NOTATION DES LOUNGES
// ════════════════════════════════════════════════════════════

/**
 * POST ?action=rate
 * Body JSON : { "id": 42, "rating": 4 }
 * Retourne  : { "rating": 4.2, "rating_count": 15, "my_rating": 4 }
 */
// Vérifie qu'un lounge existe et est publié.
function assert_lounge(PDO $db, int $lounge_id): void {
    $check = $db->prepare('SELECT id FROM lounges WHERE id = ? AND is_verified = 1');
    $check->execute([$lounge_id]);
    if (!$check->fetch()) json_out(err('not_found_lounge', 'Lounge introuvable'), 404);
}

function action_rate(): void {
    $db   = getDB();
    $user = require_verified($db);      // compte + email vérifié

    $body      = json_decode(file_get_contents('php://input'), true) ?? [];
    $lounge_id = (int)($body['id']     ?? 0);
    $rating    = (int)($body['rating'] ?? 0);
    if ($lounge_id <= 0 || $rating < 1 || $rating > 5) {
        json_out(err('params_invalid', 'Paramètres invalides (id requis, rating 1-5)'), 400);
    }
    assert_lounge($db, $lounge_id);

    // Upsert de la note seule (préserve un éventuel avis texte existant)
    $db->prepare(
        "INSERT INTO reviews (user_id, lounge_id, rating) VALUES (?, ?, ?)
         ON DUPLICATE KEY UPDATE rating = VALUES(rating), updated_at = NOW()"
    )->execute([$user['id'], $lounge_id, $rating]);

    $stats = recompute_lounge_rating($db, $lounge_id);
    json_out(['rating' => $stats['rating'], 'rating_count' => $stats['rating_count'], 'my_rating' => $rating]);
}

/**
 * POST ?action=review — avis complet (note + titre + texte)
 * Body : { id, rating, title?, body? }
 */
function action_review(): void {
    $db   = getDB();
    $user = require_verified($db);

    $body      = json_decode(file_get_contents('php://input'), true) ?? [];
    $lounge_id = (int)($body['id']     ?? 0);
    $rating    = (int)($body['rating'] ?? 0);
    $title     = clean($body['title'] ?? '', 120);
    $text      = clean($body['body']  ?? '', 2000);
    if ($lounge_id <= 0 || $rating < 1 || $rating > 5) {
        json_out(err('rating_required', 'Une note (1-5) est requise.'), 400);
    }
    assert_lounge($db, $lounge_id);

    $db->prepare(
        "INSERT INTO reviews (user_id, lounge_id, rating, title, body) VALUES (?, ?, ?, ?, ?)
         ON DUPLICATE KEY UPDATE rating = VALUES(rating), title = VALUES(title),
                                 body = VALUES(body), updated_at = NOW()"
    )->execute([$user['id'], $lounge_id, $rating, $title ?: null, $text ?: null]);

    $stats = recompute_lounge_rating($db, $lounge_id);
    json_out(['success' => true, 'rating' => $stats['rating'], 'rating_count' => $stats['rating_count'], 'my_rating' => $rating]);
}

/** POST ?action=review_delete — Body : { id } (lounge_id) */
function action_review_delete(): void {
    $db   = getDB();
    $user = require_verified($db);
    $body = json_decode(file_get_contents('php://input'), true) ?? [];
    $lounge_id = (int)($body['id'] ?? 0);
    if ($lounge_id <= 0) json_out(err('id_required', 'id requis'), 400);

    $db->prepare("DELETE FROM reviews WHERE user_id = ? AND lounge_id = ?")
       ->execute([$user['id'], $lounge_id]);
    $stats = recompute_lounge_rating($db, $lounge_id);
    json_out(['success' => true, 'rating' => $stats['rating'], 'rating_count' => $stats['rating_count']]);
}

/** GET ?action=reviews&id=42 — avis texte publics d'un lounge */
function action_reviews(): void {
    $db = getDB();
    $lounge_id = (int)($_GET['id'] ?? 0);
    if ($lounge_id <= 0) json_out(err('id_required', 'id requis'), 400);
    $me = current_user($db);

    // Les avis signalés restent visibles tant qu'un modérateur ne les a
    // pas retirés : un simple signalement ne doit pas suffire à masquer.
    $stmt = $db->prepare(
        "SELECT r.id, r.user_id, r.rating, r.title, r.body, r.created_at, u.display_name
         FROM reviews r JOIN users u ON u.id = r.user_id
         WHERE r.lounge_id = ? AND r.status <> 'removed'
               AND r.body IS NOT NULL AND r.body <> ''
         ORDER BY r.updated_at DESC LIMIT 50"
    );
    $stmt->execute([$lounge_id]);

    $rows = array_map(function ($r) use ($me) {
        $r['id']   = (int)$r['id'];
        $r['mine'] = $me && (int)$r['user_id'] === (int)$me['id'];
        unset($r['user_id']);                       // pas d'exposition inutile
        return $r;
    }, $stmt->fetchAll());

    json_out(['reviews' => $rows, 'can_flag' => (bool)$me]);
}

/**
 * POST ?action=review_flag — Body : { id, reason? }
 * Signale un avis. L'avis passe en 'flagged' (toujours visible) et
 * remonte dans la file de modération.
 */
function action_review_flag(): void {
    $db   = getDB();
    $user = require_verified($db);

    $body      = json_decode(file_get_contents('php://input'), true) ?? [];
    $review_id = (int)($body['id'] ?? 0);
    $reason    = clean($body['reason'] ?? '', 255);
    if ($review_id <= 0) json_out(err('id_required', 'id requis'), 400);

    $r = $db->prepare("SELECT user_id, status FROM reviews WHERE id = ?");
    $r->execute([$review_id]);
    $review = $r->fetch();
    if (!$review) json_out(err('not_found_review', 'Avis introuvable'), 404);
    if ((int)$review['user_id'] === (int)$user['id']) {
        json_out(err('own_review', 'Vous ne pouvez pas signaler votre propre avis.'), 400);
    }

    $db->prepare("INSERT IGNORE INTO review_flags (review_id, user_id, reason) VALUES (?,?,?)")
       ->execute([$review_id, $user['id'], $reason ?: null]);

    if ($review['status'] === 'published') {
        $db->prepare("UPDATE reviews SET status = 'flagged' WHERE id = ?")->execute([$review_id]);
    }

    $c = $db->prepare("SELECT COUNT(*) FROM review_flags WHERE review_id = ?");
    $c->execute([$review_id]);
    json_out(['success' => true, 'flags' => (int)$c->fetchColumn()]);
}

/**
 * GET ?action=my_ratings&ip=auto
 * Retourne les notes données par cette IP : { "42": 4, "17": 5 }
 */
function action_my_ratings(): void {
    $db = getDB();
    $u  = current_user($db);            // pas d'erreur si déconnecté

    $ratings = [];
    if ($u) {
        $stmt = $db->prepare('SELECT lounge_id, rating FROM reviews WHERE user_id = ?');
        $stmt->execute([$u['id']]);
        foreach ($stmt->fetchAll() as $row) {
            $ratings[(int)$row['lounge_id']] = (int)$row['rating'];
        }
    }
    header('Cache-Control: no-store'); // personnel → jamais mis en cache
    json_out(['ratings' => $ratings]);
}

/** GET ?action=my_contributions — contributions du compte connecté */
function action_my_contributions(): void {
    $db = getDB();
    $u  = require_auth($db);

    $stmt = $db->prepare(
        "SELECT id, country_id, country_name, name, city, type, status,
                votes_up, votes_down, created_at
         FROM contributions WHERE user_id = ? ORDER BY created_at DESC LIMIT 200"
    );
    $stmt->execute([$u['id']]);
    header('Cache-Control: no-store');
    json_out(['contributions' => $stmt->fetchAll()]);
}

// ════════════════════════════════════════════════════════════
// FAVORIS & LISTES
// ════════════════════════════════════════════════════════════

/** POST ?action=fav_toggle — Body : { target_type, target_id, list, on } */
function action_fav_toggle(): void {
    $db   = getDB();
    $user = require_verified($db);

    $body = json_decode(file_get_contents('php://input'), true) ?? [];
    $type = (($body['target_type'] ?? '') === 'country') ? 'country' : 'lounge';
    $tid  = clean((string)($body['target_id'] ?? ''), 50);
    $list = in_array($body['list'] ?? '', ['to_visit','visited','favorite'], true) ? $body['list'] : '';
    $on   = !empty($body['on']);
    if ($tid === '' || $list === '') json_out(err('params_invalid', 'Paramètres invalides'), 400);

    if ($type === 'lounge') {
        $c = $db->prepare('SELECT id FROM lounges WHERE id = ? AND is_verified = 1');
        $c->execute([(int)$tid]);
        if (!$c->fetch()) json_out(err('not_found_lounge', 'Lounge introuvable'), 404);
    }

    if ($on) {
        $db->prepare("INSERT IGNORE INTO favorites (user_id, target_type, target_id, list) VALUES (?, ?, ?, ?)")
           ->execute([$user['id'], $type, $tid, $list]);
    } else {
        $db->prepare("DELETE FROM favorites WHERE user_id = ? AND target_type = ? AND target_id = ? AND list = ?")
           ->execute([$user['id'], $type, $tid, $list]);
    }

    $q = $db->prepare("SELECT list FROM favorites WHERE user_id = ? AND target_type = ? AND target_id = ?");
    $q->execute([$user['id'], $type, $tid]);
    json_out(['success' => true, 'lists' => array_column($q->fetchAll(), 'list')]);
}

/** GET ?action=fav_states — état des favoris du compte (léger, pour enrichir l'UI) */
function action_fav_states(): void {
    $db = getDB();
    $u  = current_user($db);
    $out = ['lounge' => (object)[], 'country' => (object)[]];
    if ($u) {
        $acc = ['lounge' => [], 'country' => []];
        $q = $db->prepare("SELECT target_type, target_id, list FROM favorites WHERE user_id = ?");
        $q->execute([$u['id']]);
        foreach ($q->fetchAll() as $r) {
            $acc[$r['target_type']][$r['target_id']][] = $r['list'];
        }
        $out = ['lounge' => $acc['lounge'] ?: (object)[], 'country' => $acc['country'] ?: (object)[]];
    }
    header('Cache-Control: no-store');
    json_out(['favorites' => $out]);
}

/** GET ?action=fav_list — favoris du compte, enrichis (nom du lounge) */
function action_fav_list(): void {
    $db = getDB();
    $u  = require_auth($db);
    $q = $db->prepare(
        "SELECT f.list, f.target_type, f.target_id, f.created_at,
                l.name AS lounge_name, l.city AS lounge_city, l.country_id AS lounge_country
         FROM favorites f
         LEFT JOIN lounges l ON f.target_type = 'lounge' AND l.id = f.target_id
         WHERE f.user_id = ?
         ORDER BY f.list, f.created_at DESC"
    );
    $q->execute([$u['id']]);
    header('Cache-Control: no-store');
    json_out(['items' => $q->fetchAll()]);
}

// ════════════════════════════════════════════════════════════
// PROFIL & PASSEPORT (Étape D)
// ════════════════════════════════════════════════════════════

// Badges dérivés de l'activité du membre.
function compute_badges(array $s, ?string $role = null): array {
    $b = [];
    if ($role === 'moderator' || $role === 'admin') $b[] = ['icon' => '🛡️', 'label' => 'Modérateur'];
    elseif ($role === 'trusted')                    $b[] = ['icon' => '⭐', 'label' => 'Contributeur de confiance'];
    if ($s['contributions_approved'] >= 1)  $b[] = ['icon' => '✒️', 'label' => 'Contributeur'];
    if ($s['contributions_approved'] >= 5)  $b[] = ['icon' => '🏅', 'label' => 'Contributeur confirmé'];
    if ($s['reviews_count'] >= 1)           $b[] = ['icon' => '📝', 'label' => 'Critique'];
    if ($s['reviews_count'] >= 10)          $b[] = ['icon' => '🎖️', 'label' => 'Critique aguerri'];
    if ($s['countries_visited'] >= 3)       $b[] = ['icon' => '🌍', 'label' => 'Globe-trotter'];
    if ($s['countries_visited'] >= 10)      $b[] = ['icon' => '✈️', 'label' => 'Grand voyageur'];
    return $b;
}

/**
 * GET ?action=profile            → profil du compte connecté (privé)
 * GET ?action=profile&user=42    → profil public d'un membre
 * Retourne : profile, stats, passport (codes pays), badges
 */
function action_profile(): void {
    $db  = getDB();
    $uid = (int)($_GET['user'] ?? 0);

    if ($uid > 0) {
        $stmt = $db->prepare("SELECT id, display_name, avatar_url, bio, role, created_at
                              FROM users WHERE id = ? AND status = 'active'");
        $stmt->execute([$uid]);
        $u = $stmt->fetch();
        if (!$u) json_out(err('not_found_profile', 'Profil introuvable'), 404);
    } else {
        $u   = require_auth($db);
        $uid = (int)$u['id'];
    }

    // Statistiques
    $ct = $db->prepare("SELECT COUNT(*) FROM contributions WHERE user_id = ?");
    $ct->execute([$uid]); $contribTotal = (int)$ct->fetchColumn();
    $ca = $db->prepare("SELECT COUNT(*) FROM contributions WHERE user_id = ? AND status = 'approved'");
    $ca->execute([$uid]); $contribApproved = (int)$ca->fetchColumn();
    $rv = $db->prepare("SELECT COUNT(*) FROM reviews WHERE user_id = ?");
    $rv->execute([$uid]); $reviews = (int)$rv->fetchColumn();

    // Passeport : pays « visités » (favoris pays + pays des lounges visités)
    $passport = [];
    try {
        // COLLATE explicite : favorites.target_id et lounges.country_id
        // peuvent avoir des collations différentes → sans ça, l'UNION échoue.
        $pass = $db->prepare(
            "SELECT DISTINCT c FROM (
                 SELECT target_id COLLATE utf8mb4_unicode_ci AS c FROM favorites
                 WHERE user_id = ? AND list = 'visited' AND target_type = 'country'
                 UNION
                 SELECT l.country_id COLLATE utf8mb4_unicode_ci AS c FROM favorites f
                 JOIN lounges l ON l.id = f.target_id
                 WHERE f.user_id = ? AND f.list = 'visited' AND f.target_type = 'lounge'
             ) t WHERE c IS NOT NULL AND c <> ''"
        );
        $pass->execute([$uid, $uid]);
        $passport = array_column($pass->fetchAll(), 'c');
    } catch (Throwable $e) { /* tables favoris/lounges absentes — passeport vide */ }

    $stats = [
        'contributions_total'    => $contribTotal,
        'contributions_approved' => $contribApproved,
        'reviews_count'          => $reviews,
        'countries_visited'      => count($passport),
    ];

    json_out([
        'profile' => [
            'id'           => (int)$u['id'],
            'display_name' => $u['display_name'],
            'avatar_url'   => $u['avatar_url'] ?? null,
            'bio'          => $u['bio'] ?? null,
            'role'         => $u['role'],
            'created_at'   => $u['created_at'],
        ],
        'stats'    => $stats,
        'passport' => $passport,
        'badges'   => compute_badges($stats, $u['role']),
    ]);
}

/** POST ?action=profile_update — Body : { display_name, bio, avatar } */
function action_profile_update(): void {
    $db = getDB();
    $u  = require_auth($db);

    $body   = json_decode(file_get_contents('php://input'), true) ?? [];
    $name   = clean($body['display_name'] ?? '', 80);
    $bio    = clean($body['bio']    ?? '', 500);
    $avatar = clean($body['avatar'] ?? '', 16);   // emoji ou courte chaîne
    if ($name === '') json_out(err('name_required', 'Nom d\'affichage requis.'), 400);

    $db->prepare("UPDATE users SET display_name = ?, bio = ?, avatar_url = ? WHERE id = ?")
       ->execute([$name, $bio ?: null, $avatar ?: null, $u['id']]);

    json_out(['success' => true, 'user' => user_public(current_user($db))]);
}