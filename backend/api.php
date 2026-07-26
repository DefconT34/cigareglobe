<?php
// ════════════════════════════════════════════════════════
// api.php — API REST CigarOdyssey
// Compatible PHP 8.0+ (cPanel/OVH/Infomaniak)
// ════════════════════════════════════════════════════════

require_once __DIR__ . '/config.php';
require_once __DIR__ . '/auth_lib.php';

auth_session_start();

// ── Headers ───────────────────────────────────────────────
header('Access-Control-Allow-Origin: '  . ALLOWED_ORIGIN);
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, X-CSRF-Token');
header('Access-Control-Allow-Credentials: true');
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
    $key = $_SERVER['HTTP_X_ADMIN_KEY'] ?? ($_GET['admin_key'] ?? '');
    return strlen($key) > 0 && hash_equals(ADMIN_KEY, $key);
}

function clean(string $s, int $max = 500): string {
    return mb_substr(trim(strip_tags($s)), 0, $max);
}

// ── Routing ───────────────────────────────────────────────
$action = clean($_GET['action'] ?? '', 30);
$method = $_SERVER['REQUEST_METHOD'];

// Les actions qui écrivent au nom de l'utilisateur exigent un jeton CSRF
$CSRF_ACTIONS = ['submit','rate','review','review_delete'];
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
    elseif ($action === 'my_ratings'     && $method === 'GET') { action_my_ratings(); }
    elseif ($action === 'my_contributions' && $method === 'GET') { action_my_contributions(); }
    elseif ($action === 'approve' && $method === 'POST') { action_approve(); }
    elseif ($action === 'reject'  && $method === 'POST') { action_reject(); }
    elseif ($action === 'export'  && $method === 'GET')  { action_export(); }
    elseif ($action === 'stats'   && $method === 'GET')  { action_stats(); }
    else   { json_out(['error' => 'Action inconnue'], 404); }
} catch (Throwable $e) {
    json_out(['error' => 'Erreur serveur'], 500);
}

// ════════════════════════════════════════════════════════
// GET list — contributions d'un pays
// ════════════════════════════════════════════════════════
function action_list(): void {
    $country = clean($_GET['country'] ?? '', 50);
    if (!$country) json_out(['error' => 'Paramètre country requis'], 400);

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
    if (!is_admin()) json_out(['error' => 'Accès refusé'], 403);

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

    // Anti-spam : max 3 contributions par compte par 24h
    $spam = $db->prepare(
        "SELECT COUNT(*) FROM contributions
         WHERE user_id = ? AND created_at > DATE_SUB(NOW(), INTERVAL 24 HOUR)"
    );
    $spam->execute([$user['id']]);
    if ((int)$spam->fetchColumn() >= 3) {
        json_out(['error' => 'Limite atteinte : 3 contributions par jour maximum.'], 429);
    }

    // Anti-doublon : même nom + même pays déjà signalé
    $dup = $db->prepare(
        "SELECT id FROM contributions
         WHERE country_id = ? AND name = ? AND status != 'rejected' LIMIT 1"
    );
    $dup->execute([clean($body['country_id'],50), clean($body['name'],200)]);
    if ($dup->fetch()) {
        json_out(['error' => 'Cet établissement a déjà été signalé pour ce pays.'], 409);
    }

    // Insertion (attribuée au compte)
    $stmt = $db->prepare(
        "INSERT INTO contributions
         (user_id, country_id, country_name, name, city, type, phone, description, source_url, contributor_email, contributor_ip)
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
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
    ]);

    $id = (int)$db->lastInsertId();

    // Notification email (si configuré)
    if (ADMIN_EMAIL !== 'votre@email.com') {
        $subject = '[CigarOdyssey] Nouvelle contribution : ' . $body['name'];
        $text    = "Pays : {$body['country_name']}\n"
                 . "Nom  : {$body['name']}\n"
                 . "Ville: {$body['city']}\n"
                 . "Type : " . ($body['type'] ?? '') . "\n"
                 . "Desc : " . mb_substr($body['description'],0,300) . "\n\n"
                 . "Valider sur : https://{$_SERVER['HTTP_HOST']}/backend/admin.php\n";
        @mail(ADMIN_EMAIL, $subject, $text,
              'From: noreply@' . ($_SERVER['HTTP_HOST'] ?? 'cigarworld.com'));
    }

    json_out(['success' => true, 'id' => $id]);
}

// ════════════════════════════════════════════════════════
// POST vote — voter pour une contribution
// ════════════════════════════════════════════════════════
function action_vote(): void {
    $body = json_decode(file_get_contents('php://input'), true) ?? [];
    $id   = (int)($body['id']   ?? 0);
    $vote = (int)($body['vote'] ?? 0);

    if (!$id || !in_array($vote, [1, -1])) {
        json_out(['error' => 'Paramètres invalides'], 400);
    }

    $ip = get_ip();
    $db = getDB();

    // Contribution existe et est en attente ?
    $c = $db->prepare("SELECT id, votes_up, votes_down FROM contributions WHERE id = ? AND status = 'pending'");
    $c->execute([$id]);
    $contrib = $c->fetch();
    if (!$contrib) json_out(['error' => 'Contribution introuvable ou déjà traitée'], 404);

    // Vote existant ?
    $prev_stmt = $db->prepare("SELECT vote FROM votes WHERE contribution_id = ? AND voter_ip = ?");
    $prev_stmt->execute([$id, $ip]);
    $prev = $prev_stmt->fetchColumn();

    if ($prev !== false) {
        $prev = (int)$prev;
        if ($prev === $vote) json_out(['error' => 'Vous avez déjà voté de cette façon'], 409);

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
        $db->prepare("UPDATE contributions SET status='approved', approved_at=NOW() WHERE id=?")->execute([$id]);

        $full = $db->prepare("SELECT * FROM contributions WHERE id=?");
        $full->execute([$id]);
        $row = $full->fetch();

        $db->prepare(
            "INSERT IGNORE INTO approved_lounges
             (contribution_id, country_id, country_name, name, city, type, phone, description, source_url)
             VALUES (?,?,?,?,?,?,?,?,?)"
        )->execute([$id, $row['country_id'], $row['country_name'],
            $row['name'], $row['city'], $row['type'],
            $row['phone'], $row['description'], $row['source_url']]);

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
// POST approve / reject — modération manuelle (admin)
// ════════════════════════════════════════════════════════
function action_approve(): void {
    if (!is_admin()) json_out(['error' => 'Accès refusé'], 403);
    $id = (int)($_GET['id'] ?? 0);
    if (!$id) json_out(['error' => 'id manquant'], 400);

    $db = getDB();
    $db->prepare("UPDATE contributions SET status='approved', approved_at=NOW() WHERE id=?")->execute([$id]);

    $full = $db->prepare("SELECT * FROM contributions WHERE id=?");
    $full->execute([$id]);
    $row = $full->fetch();
    if ($row) {
        $db->prepare(
            "INSERT IGNORE INTO approved_lounges
             (contribution_id, country_id, country_name, name, city, type, phone, description, source_url)
             VALUES (?,?,?,?,?,?,?,?,?)"
        )->execute([$id, $row['country_id'], $row['country_name'],
            $row['name'], $row['city'], $row['type'],
            $row['phone'], $row['description'], $row['source_url']]);
    }
    json_out(['success' => true]);
}

function action_reject(): void {
    if (!is_admin()) json_out(['error' => 'Accès refusé'], 403);
    $id = (int)($_GET['id'] ?? 0);
    if (!$id) json_out(['error' => 'id manquant'], 400);
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
    if (!is_admin()) json_out(['error' => 'Accès refusé'], 403);

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
// Recalcule et enregistre la note moyenne d'un lounge depuis les avis.
function recompute_lounge_rating(PDO $db, int $lounge_id): array {
    $avg = $db->prepare(
        "SELECT ROUND(AVG(rating), 2) AS avg_rating, COUNT(*) AS total
         FROM reviews WHERE lounge_id = ? AND status = 'published'"
    );
    $avg->execute([$lounge_id]);
    $s = $avg->fetch();
    $new_avg   = (float)($s['avg_rating'] ?? 0);
    $new_count = (int)  ($s['total']      ?? 0);
    try {
        $db->prepare('UPDATE lounges SET rating = ?, rating_count = ? WHERE id = ?')
           ->execute([$new_avg, $new_count, $lounge_id]);
    } catch (Throwable $e) { /* colonnes rating absentes — ignorer */ }
    return ['rating' => round($new_avg, 1), 'rating_count' => $new_count];
}

// Vérifie qu'un lounge existe et est publié.
function assert_lounge(PDO $db, int $lounge_id): void {
    $check = $db->prepare('SELECT id FROM lounges WHERE id = ? AND is_verified = 1');
    $check->execute([$lounge_id]);
    if (!$check->fetch()) json_out(['error' => 'Lounge introuvable'], 404);
}

function action_rate(): void {
    $db   = getDB();
    $user = require_verified($db);      // compte + email vérifié

    $body      = json_decode(file_get_contents('php://input'), true) ?? [];
    $lounge_id = (int)($body['id']     ?? 0);
    $rating    = (int)($body['rating'] ?? 0);
    if ($lounge_id <= 0 || $rating < 1 || $rating > 5) {
        json_out(['error' => 'Paramètres invalides (id requis, rating 1-5)'], 400);
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
        json_out(['error' => 'Une note (1-5) est requise.'], 400);
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
    if ($lounge_id <= 0) json_out(['error' => 'id requis'], 400);

    $db->prepare("DELETE FROM reviews WHERE user_id = ? AND lounge_id = ?")
       ->execute([$user['id'], $lounge_id]);
    $stats = recompute_lounge_rating($db, $lounge_id);
    json_out(['success' => true, 'rating' => $stats['rating'], 'rating_count' => $stats['rating_count']]);
}

/** GET ?action=reviews&id=42 — avis texte publics d'un lounge */
function action_reviews(): void {
    $db = getDB();
    $lounge_id = (int)($_GET['id'] ?? 0);
    if ($lounge_id <= 0) json_out(['error' => 'id requis'], 400);

    $stmt = $db->prepare(
        "SELECT r.rating, r.title, r.body, r.created_at, u.display_name
         FROM reviews r JOIN users u ON u.id = r.user_id
         WHERE r.lounge_id = ? AND r.status = 'published'
               AND r.body IS NOT NULL AND r.body <> ''
         ORDER BY r.updated_at DESC LIMIT 50"
    );
    $stmt->execute([$lounge_id]);
    json_out(['reviews' => $stmt->fetchAll()]);
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