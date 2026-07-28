<?php
// ════════════════════════════════════════════════════════
// moderation_lib.php — Logique de modération partagée
// ────────────────────────────────────────────────────────
// Utilisé par api.php (vote communautaire, publication directe) et par
// admin.php (modération manuelle) : un seul traitement pour tous les
// chemins d'approbation, y compris la promotion des contributeurs.
// ════════════════════════════════════════════════════════

require_once __DIR__ . '/config.php';

/** Rôles dont les contributions sont publiées sans modération. */
function is_trusted_role(?string $role): bool {
    return in_array((string)$role, ['trusted', 'moderator', 'admin'], true);
}

/**
 * Promeut un membre en « contributeur de confiance » dès qu'il atteint
 * TRUSTED_AFTER_APPROVED contributions approuvées. Ses ajouts suivants
 * sont publiés sans passer par la file de modération.
 * Ne modifie jamais un rôle moderator/admin.
 */
function maybe_promote_contributor(PDO $db, int $user_id): bool {
    $u = $db->prepare("SELECT role FROM users WHERE id = ?");
    $u->execute([$user_id]);
    if ($u->fetchColumn() !== 'member') return false;

    $c = $db->prepare("SELECT COUNT(*) FROM contributions WHERE user_id = ? AND status = 'approved'");
    $c->execute([$user_id]);
    if ((int)$c->fetchColumn() < TRUSTED_AFTER_APPROVED) return false;

    $db->prepare("UPDATE users SET role = 'trusted' WHERE id = ? AND role = 'member'")->execute([$user_id]);
    return true;
}

/**
 * Approuve une contribution : publication dans approved_lounges, puis
 * évaluation d'une promotion de son auteur. Traitement commun aux trois
 * chemins d'approbation (vote communautaire, modération admin,
 * publication directe d'un contributeur de confiance).
 */
function approve_contribution(PDO $db, int $id): bool {
    $stmt = $db->prepare("SELECT * FROM contributions WHERE id = ?");
    $stmt->execute([$id]);
    $row = $stmt->fetch();
    if (!$row) return false;

    if ($row['status'] !== 'approved') {
        $db->prepare("UPDATE contributions SET status='approved', approved_at=NOW() WHERE id=?")->execute([$id]);
    }
    $db->prepare(
        "INSERT IGNORE INTO approved_lounges
         (contribution_id, country_id, country_name, name, city, type, phone, description, source_url)
         VALUES (?,?,?,?,?,?,?,?,?)"
    )->execute([$id, $row['country_id'], $row['country_name'],
        $row['name'], $row['city'], $row['type'],
        $row['phone'], $row['description'], $row['source_url']]);

    if (!empty($row['user_id'])) maybe_promote_contributor($db, (int)$row['user_id']);
    return true;
}

/**
 * Recalcule la note moyenne d'un lounge depuis les avis retenus.
 * Les avis retirés par la modération sont exclus ; les avis signalés
 * restent comptés tant qu'un modérateur ne les a pas retirés.
 */
function recompute_lounge_rating(PDO $db, int $lounge_id): array {
    $avg = $db->prepare(
        "SELECT ROUND(AVG(rating), 2) AS avg_rating, COUNT(*) AS total
         FROM reviews WHERE lounge_id = ? AND status <> 'removed'"
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

/**
 * Change le statut d'un avis (published / flagged / removed) et met à
 * jour la note du lounge concerné.
 */
function set_review_status(PDO $db, int $review_id, string $status): bool {
    if (!in_array($status, ['published', 'flagged', 'removed'], true)) return false;
    $r = $db->prepare("SELECT lounge_id FROM reviews WHERE id = ?");
    $r->execute([$review_id]);
    $lounge_id = $r->fetchColumn();
    if ($lounge_id === false) return false;

    $db->prepare("UPDATE reviews SET status = ? WHERE id = ?")->execute([$status, $review_id]);
    recompute_lounge_rating($db, (int)$lounge_id);
    return true;
}
