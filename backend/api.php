<?php
// ════════════════════════════════════════════════════════
// api.php — API REST CigarOdyssey
// Compatible PHP 8.0+ (cPanel/OVH/Infomaniak)
// ════════════════════════════════════════════════════════

require_once __DIR__ . '/config.php';

// ── Headers ───────────────────────────────────────────────
header('Access-Control-Allow-Origin: '  . ALLOWED_ORIGIN);
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');
header('Content-Type: application/json; charset=utf-8');

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(204);
    exit;
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

try {
    if     ($action === 'list'    && $method === 'GET')  { action_list(); }
    elseif ($action === 'all'     && $method === 'GET')  { action_all(); }
    elseif ($action === 'submit'  && $method === 'POST') { action_submit(); }
    elseif ($action === 'vote'    && $method === 'POST') { action_vote(); }
    elseif ($action === 'rate'    && $method === 'POST') { action_rate(); }
    elseif ($action === 'my_ratings' && $method === 'GET') { action_my_ratings(); }
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
    $db = getDB();

    // Anti-spam : max 3 contributions par IP par 24h
    $spam = $db->prepare(
        "SELECT COUNT(*) FROM contributions
         WHERE contributor_ip = ? AND created_at > DATE_SUB(NOW(), INTERVAL 24 HOUR)"
    );
    $spam->execute([$ip]);
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

    // Insertion
    $stmt = $db->prepare(
        "INSERT INTO contributions
         (country_id, country_name, name, city, type, phone, description, source_url, contributor_email, contributor_ip)
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
    );
    $stmt->execute([
        clean($body['country_id'],    50),
        clean($body['country_name'], 100),
        clean($body['name'],         200),
        clean($body['city'],         200),
        clean($body['type'] ?? 'Cave à Cigares', 100),
        clean($body['phone']       ?? '', 50),
        clean($body['description'], 2000),
        clean($body['source_url']  ?? '', 500),
        clean($body['email']       ?? '', 200),
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
function action_rate(): void {
    $db = getDB();

    $body      = json_decode(file_get_contents('php://input'), true) ?? [];
    $lounge_id = isset($body['id'])     ? (int)$body['id']     : 0;
    $rating    = isset($body['rating']) ? (int)$body['rating'] : 0;

    if ($lounge_id <= 0 || $rating < 1 || $rating > 5) {
        json_out(['error' => 'Paramètres invalides (id requis, rating 1-5)'], 400);
    }

    // Vérifier que le lounge existe
    $check = $db->prepare('SELECT id FROM lounges WHERE id = ? AND is_verified = 1');
    $check->execute([$lounge_id]);
    if (!$check->fetch()) {
        json_out(['error' => 'Lounge introuvable'], 404);
    }

    // IP du votant (IPv4 + IPv6 supportés)
    $ip = $_SERVER['HTTP_X_FORWARDED_FOR']
        ?? $_SERVER['HTTP_X_REAL_IP']
        ?? $_SERVER['REMOTE_ADDR']
        ?? '0.0.0.0';
    // Normaliser : prendre la première IP en cas de liste
    $ip = trim(explode(',', $ip)[0]);
    $ip = substr($ip, 0, 45);

    // INSERT ou UPDATE du vote — try/catch si table lounge_ratings absente
    try {
        $stmt = $db->prepare(
            'INSERT INTO lounge_ratings (lounge_id, voter_ip, rating)
             VALUES (?, ?, ?)
             ON DUPLICATE KEY UPDATE rating = VALUES(rating), rated_at = NOW()'
        );
        $stmt->execute([$lounge_id, $ip, $rating]);

        // Recalculer la moyenne depuis les votes
        $avg = $db->prepare(
            'SELECT ROUND(AVG(rating), 2) AS avg_rating, COUNT(*) AS total
             FROM lounge_ratings WHERE lounge_id = ?'
        );
        $avg->execute([$lounge_id]);
        $stats     = $avg->fetch();
        $new_avg   = (float)($stats['avg_rating'] ?? 0);
        $new_count = (int)  ($stats['total']      ?? 0);

        // Mettre à jour lounges si la colonne rating existe
        try {
            $db->prepare('UPDATE lounges SET rating = ?, rating_count = ? WHERE id = ?')
               ->execute([$new_avg, $new_count, $lounge_id]);
        } catch (Throwable $e) {
            // Colonne rating absente — noter quand même via lounge_ratings
        }

        json_out([
            'rating'       => round($new_avg, 1),
            'rating_count' => $new_count,
            'my_rating'    => $rating,
        ]);

    } catch (Throwable $e) {
        // Table lounge_ratings absente → retourner la note locale sans persister
        json_out([
            'rating'       => (float)$rating,
            'rating_count' => 1,
            'my_rating'    => $rating,
            'warning'      => 'Table lounge_ratings manquante — importer cigar-rating-system.sql',
        ]);
    }
}

/**
 * GET ?action=my_ratings&ip=auto
 * Retourne les notes données par cette IP : { "42": 4, "17": 5 }
 */
function action_my_ratings(): void {
    $db = getDB();

    $ip = $_SERVER['HTTP_X_FORWARDED_FOR']
        ?? $_SERVER['HTTP_X_REAL_IP']
        ?? $_SERVER['REMOTE_ADDR']
        ?? '0.0.0.0';
    $ip = trim(explode(',', $ip)[0]);
    $ip = substr($ip, 0, 45);

    $stmt = $db->prepare(
        'SELECT lounge_id, rating FROM lounge_ratings WHERE voter_ip = ?'
    );
    $stmt->execute([$ip]);

    $ratings = [];
    foreach ($stmt->fetchAll() as $row) {
        $ratings[(int)$row['lounge_id']] = (int)$row['rating'];
    }

    header('Cache-Control: no-store'); // personnel → jamais mis en cache
    json_out(['ratings' => $ratings, 'ip' => substr($ip, 0, 10) . '…']);
}