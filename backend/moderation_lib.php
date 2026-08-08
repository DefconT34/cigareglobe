<?php
// ════════════════════════════════════════════════════════
// moderation_lib.php — Logique de modération partagée
// ────────────────────────────────────────────────────────
// Utilisé par api.php (vote communautaire, publication directe) et par
// admin.php (modération manuelle) : un seul traitement pour tous les
// chemins d'approbation, y compris la promotion des contributeurs.
// ════════════════════════════════════════════════════════

require_once __DIR__ . '/config.php';
// send_email() : admin.php n'incluait pas le mailer, et la notification
// d'approbation part d'ici, quel que soit le chemin d'approbation.
require_once __DIR__ . '/mailer.php';
// site_url() y vit : le lien de l'email doit pointer le site public,
// pas l'hote de la requete. api.php et admin.php l'incluaient deja,
// mais ce fichier doit tenir seul — il est aussi appele par les tests.
require_once __DIR__ . '/auth_lib.php';

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
/**
 * @param bool $notifier Prevenir l'auteur par email. Faux pour la
 *        publication directe d'un contributeur de confiance : il vient de
 *        cliquer « Envoyer », l'interface le lui a deja dit, et un email
 *        arrivant dans la seconde ferait mecanique plutot qu'attentionne.
 */
function approve_contribution(PDO $db, int $id, bool $notifier = true): bool {
    $stmt = $db->prepare("SELECT * FROM contributions WHERE id = ?");
    $stmt->execute([$id]);
    $row = $stmt->fetch();
    if (!$row) return false;

    // Une approbation rejouee ne renotifie rien : meme garde-fou que
    // pour l'insertion, l'email etant bien plus visible qu'une ligne.
    $transition = $row['status'] !== 'approved';
    if ($transition) {
        $db->prepare("UPDATE contributions SET status='approved', approved_at=NOW() WHERE id=?")->execute([$id]);
    }
    $db->prepare(
        // lat/lon suivent la contribution : recueillir une position sur
        // place puis la perdre a l'approbation serait pire que de ne pas
        // la demander (migration 011).
        "INSERT IGNORE INTO approved_lounges
         (contribution_id, country_id, country_name, name, city, type, phone, description, source_url, lat, lon)
         VALUES (?,?,?,?,?,?,?,?,?,?,?)"
    )->execute([$id, $row['country_id'], $row['country_name'],
        $row['name'], $row['city'], $row['type'],
        $row['phone'], $row['description'], $row['source_url'],
        $row['lat'] ?? null, $row['lon'] ?? null]);

    // ── L'etablissement entre au catalogue ────────────────
    // Une approbation cree une VRAIE ligne dans `lounges`. Auparavant
    // elle n'atteignait que `approved_lounges`, servie par une requete
    // filtrant sur une colonne `status` inexistante : l'erreur etait
    // avalee, et l'etablissement n'apparaissait jamais sur le site.
    //
    // En passant par `lounges`, la fiche gagne notation, avis, favoris,
    // photos et colonnes de traduction — tout ce dont les fiches
    // « communautaires » etaient privees.
    $ins = $db->prepare(
        "INSERT IGNORE INTO lounges
           (contribution_id, country_id, name, city, type, phone, description, source, lat, lon, is_verified)
         VALUES (?,?,?,?,?,?,?,?,?,?,1)"
    );
    $ins->execute([$id, $row['country_id'], $row['name'], $row['city'], $row['type'],
                   $row['phone'], $row['description'], $row['source_url'],
                   $row['lat'] ?? null, $row['lon'] ?? null]);

    // Zero ligne inseree = un etablissement de ce nom existe deja dans ce
    // pays (contrainte uq_country_name), ou l'approbation est rejouee.
    // On le JOURNALISE : c'est exactement ce genre de silence qui a
    // rendu le defaut precedent invisible pendant des mois.
    if ($ins->rowCount() === 0) {
        error_log(sprintf('[moderation] contribution #%d approuvee sans creer de fiche : '
            . '« %s » existe deja dans %s, ou approbation rejouee.',
            $id, $row['name'], $row['country_id']));
    }

    if ($notifier && $transition) notifier_contributeur($db, $row);

    if (!empty($row['user_id'])) maybe_promote_contributor($db, (int)$row['user_id']);
    return true;
}

/**
 * Previent l'auteur que son etablissement est en ligne.
 *
 * Jusqu'ici une contribution approuvee ne disait rien a celui qui
 * l'avait proposee : il devait retourner voir son espace membre pour le
 * decouvrir. C'est pourtant le moment ou l'on tient a le remercier.
 *
 * Le lien ouvre la fiche elle-meme (?lounge=<id>), pas la page
 * d'accueil : le contributeur veut VOIR son ajout, pas le chercher.
 *
 * L'email est en francais, comme les autres du site. Les traduire
 * suppose de connaitre la langue du compte, que `users` ne stocke pas.
 */
function notifier_contributeur(PDO $db, array $row): void {
    $email = trim((string)($row['contributor_email'] ?? ''));
    if ($email === '' || !filter_var($email, FILTER_VALIDATE_EMAIL)) return;

    // Nom d'usage ET langue de correspondance, en une seule requête.
    // La langue vient de `users.lang` (migration 014) : celle dans
    // laquelle la personne naviguait en s'inscrivant. Un compte
    // antérieur à la migration n'en a pas — repli sur le français.
    $nom = ''; $lang = 'fr';
    if (!empty($row['user_id'])) {
        $u = $db->prepare('SELECT display_name, lang FROM users WHERE id = ?');
        $u->execute([(int)$row['user_id']]);
        if ($c = $u->fetch(PDO::FETCH_ASSOC)) {
            $nom  = trim((string)$c['display_name']);
            $lang = (string)($c['lang'] ?: 'fr');
        }
    }

    // Identifiant de la fiche creee, pour un lien qui l'ouvre directement.
    $f = $db->prepare('SELECT id FROM lounges WHERE contribution_id = ?');
    $f->execute([(int)$row['id']]);
    $loungeId = (int)$f->fetchColumn();
    $url = site_url() . ($loungeId ? '/?lounge=' . $loungeId : '/');

    // Les textes viennent de mail_i18n() — le seul endroit où PHP
    // traduit, et une exception assumée à la règle du lot F2. Un email
    // n'a pas de front pour le faire à sa place. Voir mailer.php.
    $titre = $nom !== ''
        ? mail_t('appr_titre_nom', $lang, ['nom' => $nom])
        : mail_t('appr_titre', $lang);
    $intro = mail_t('appr_corps', $lang, [
        'lieu'  => $row['name'],
        'ville' => $row['city'],
        'pays'  => $row['country_name'],
    ]);

    // Un échec d'envoi ne doit jamais faire échouer l'approbation :
    // l'établissement est publié, c'est l'essentiel.
    try {
        send_email($email, mail_t('appr_sujet', $lang) . ' — ' . $row['name'],
            email_template($titre, $intro, mail_t('appr_bouton', $lang), $url,
                mail_t('appr_pied', $lang)));
    } catch (Throwable $e) {
        error_log('[moderation] notification non envoyee (#' . $row['id'] . ') : ' . $e->getMessage());
    }
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
