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
 * Inscrit une décision au journal de modération (migration 130).
 *
 * L'AUTEUR N'EST PAS UN PARAMÈTRE : il est lu de la session courante.
 * Un appelant ne peut donc pas signer au nom d'un autre, et c'est cette
 * impossibilité qui fait la valeur d'un journal d'audit. Le nom est
 * copié dans la ligne, pas seulement référencé : voir le pourquoi dans
 * l'en-tête de la migration.
 *
 * Sans session d'administration, la ligne est attribuée au système :
 * c'est le cas des chemins automatiques — vote communautaire atteignant
 * le seuil, publication directe d'un contributeur de confiance. Le
 * compte connecté, s'il y en a un, est tout de même nommé : « publié
 * directement par Alice » est plus utile que « publié ».
 *
 * Un échec d'écriture ne fait JAMAIS échouer la décision. Mieux vaut
 * une décision non journalisée qu'une modération bloquée par une table
 * absente ; l'échec part dans error_log, où il reste visible.
 */
function journaliser(PDO $db, string $action, string $cible_type, int $cible_id, string $detail = ''): void {
    $scope = admin_scope($db);
    $u     = current_user($db);

    $acteur_id  = $u ? (int)$u['id'] : null;
    $acteur_nom = $u ? (string)$u['display_name']
                     : ($scope === 'admin' ? "clé d'administration" : 'automatique');

    try {
        $db->prepare(
            "INSERT INTO moderation_log
               (acteur_id, acteur_nom, portee, action, cible_type, cible_id, detail)
             VALUES (?,?,?,?,?,?,?)"
        )->execute([$acteur_id, mb_substr($acteur_nom, 0, 80), $scope ?? 'systeme',
                    $action, $cible_type, $cible_id,
                    $detail === '' ? null : mb_substr($detail, 0, 255)]);
    } catch (Throwable $e) {
        error_log('[moderation] journal non ecrit (' . $action . ' ' . $cible_type
                  . '#' . $cible_id . ') : ' . $e->getMessage());
    }
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

    // Journalisé sur la TRANSITION seulement, comme la notification : une
    // approbation rejouée ne doit pas laisser croire à deux décisions.
    // `$notifier` distingue les deux chemins sans auteur humain — la
    // publication directe d'un contributeur de confiance ne notifie pas.
    if ($transition) {
        journaliser($db, $notifier ? 'contribution_approuver' : 'contribution_publication_directe',
            'contribution', $id, $row['name'] . ' — ' . $row['city']);
    }

    if (!empty($row['user_id'])) maybe_promote_contributor($db, (int)$row['user_id']);
    return true;
}

/**
 * Rejette une contribution. Point de passage unique : admin.php et
 * api.php écrivaient chacun leur UPDATE, et aucun des deux ne laissait
 * de trace. Un rejet est pourtant la décision la plus contestable de
 * toutes — c'est celle dont on voudra relire l'auteur.
 *
 * Le garde `status <> 'rejected'` évite de journaliser un rejet rejoué.
 */
function reject_contribution(PDO $db, int $id, string $motif = ''): bool {
    $n = $db->prepare("SELECT name, city FROM contributions WHERE id = ?");
    $n->execute([$id]);
    $row = $n->fetch();
    if (!$row) return false;

    $st = $db->prepare("UPDATE contributions SET status='rejected' WHERE id=? AND status<>'rejected'");
    $st->execute([$id]);
    if ($st->rowCount() > 0) {
        journaliser($db, 'contribution_rejeter', 'contribution', $id,
            trim($row['name'] . ' — ' . $row['city'] . ($motif !== '' ? ' · ' . $motif : '')));
    }
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

/** Rôles attribuables depuis l'écran des membres, et leur libellé. */
const ROLES_ATTRIBUABLES = [
    'member'    => 'Membre',
    'trusted'   => 'Contributeur de confiance',
    'moderator' => 'Modérateur',
];

/**
 * Attribue un rôle à un compte. Jusqu'ici, nommer un modérateur
 * demandait un UPDATE à la main dans la base — ce qui revenait à ne
 * jamais en nommer.
 *
 * Trois refus, et chacun protège une chose différente :
 *
 *  - `admin` NE S'ATTRIBUE PAS ici. Le rôle admin vaut la clé ; le
 *    donner par un formulaire ferait de l'écran de modération un chemin
 *    vers l'administration complète. La clé reste la seule porte, et
 *    elle se confie en connaissance de cause.
 *  - un compte DÉJÀ admin ne se modifie pas ici — la même règle lue à
 *    l'envers : cette page ne sert pas à retirer ses droits à
 *    l'administrateur en titre.
 *  - « La Régie » (hachage de mot de passe « * », donc inconnectable)
 *    signe les messages épinglés du forum. Lui changer de rôle ne
 *    donnerait de pouvoir à personne, mais modifierait l'affichage de
 *    ses messages sans que quiconque l'ait voulu.
 *
 * @return array{type:string,text:string} message prêt pour l'écran.
 */
function changer_role(PDO $db, int $user_id, string $role): array {
    if (!isset(ROLES_ATTRIBUABLES[$role])) {
        return ['type' => 'err', 'text' => 'Rôle inconnu : ' . htmlspecialchars($role)
            . ' — le rôle « admin » ne s’attribue pas depuis cet écran.'];
    }

    $q = $db->prepare("SELECT display_name, role, password_hash FROM users WHERE id = ?");
    $q->execute([$user_id]);
    $u = $q->fetch();
    if (!$u) return ['type' => 'err', 'text' => "Compte #{$user_id} introuvable."];

    if ($u['role'] === 'admin') {
        return ['type' => 'err', 'text' => $u['display_name']
            . ' est administrateur : son rôle ne se change pas depuis cet écran.'];
    }
    if ($u['password_hash'] === '*') {
        return ['type' => 'err', 'text' => $u['display_name']
            . ' est un compte de signature, sans connexion possible. Son rôle est figé.'];
    }
    if ($u['role'] === $role) {
        return ['type' => 'warn', 'text' => $u['display_name'] . ' est déjà '
            . mb_strtolower(ROLES_ATTRIBUABLES[$role]) . '.'];
    }

    $db->prepare("UPDATE users SET role = ? WHERE id = ? AND role <> 'admin'")
       ->execute([$role, $user_id]);
    journaliser($db, 'role_attribuer', 'compte', $user_id,
        $u['display_name'] . ' : ' . $u['role'] . ' → ' . $role);

    return ['type' => 'ok', 'text' => $u['display_name'] . ' est désormais '
        . mb_strtolower(ROLES_ATTRIBUABLES[$role]) . '.'];
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
    $r = $db->prepare("SELECT lounge_id, status FROM reviews WHERE id = ?");
    $r->execute([$review_id]);
    $avis = $r->fetch();
    if (!$avis) return false;
    $lounge_id = (int)$avis['lounge_id'];

    $db->prepare("UPDATE reviews SET status = ? WHERE id = ?")->execute([$status, $review_id]);
    recompute_lounge_rating($db, $lounge_id);

    // Le passage à 'flagged' vient des lecteurs, pas d'un modérateur :
    // il est déjà compté dans review_flags et n'est pas une décision.
    // Seuls le retrait et le rétablissement en sont.
    if ($avis['status'] !== $status && $status !== 'flagged') {
        journaliser($db, $status === 'removed' ? 'avis_retirer' : 'avis_retablir',
            'avis', $review_id, 'était : ' . $avis['status']);
    }
    return true;
}
