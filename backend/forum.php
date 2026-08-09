<?php
// ════════════════════════════════════════════════════════
// forum.php — API de l'espace communautaire
// ────────────────────────────────────────────────────────
//   GET  ?action=sections                          rubriques + compteurs
//   GET  ?action=topics&section=…&lang=…&tag=…&page=…
//   GET  ?action=topic&id=42[&page=…]              sujet + messages
//   GET  ?action=tags[&q=…]                        autocomplétion
//   GET  ?action=agenda[&passes=1][&lang=…]        rendez-vous à venir / archives
//   GET  ?action=lounge_events&id=42               rendez-vous d'un établissement
//   GET  ?action=mod_queue                         file de modération (admin)
//   POST ?action=topic_create                      { section, title, body, lang, tags[] }
//   POST ?action=post_create                       { topic_id, body, quote_post_id }
//   POST ?action=post_edit                         { id, body }
//   POST ?action=post_delete                       { id }
//   POST ?action=flag                              { post_id, reason, note }
//   POST ?action=react                             { post_id }        (bascule)
//   POST ?action=follow                            { topic_id }       (bascule)
//   POST ?action=topic_solved                      { topic_id, post_id }
//   POST ?action=moderate                          { post_id, decision } (admin)
//   POST ?action=topic_state                       { topic_id, lock, pin } (admin)
//   POST ?action=event_create                      { title, body, starts_local, timezone… }
//   POST ?action=event_update                      { topic_id, … }
//   POST ?action=event_cancel                      { topic_id, reason }
//   POST ?action=attend                            { topic_id, state }
//
// Le serveur ne traduit pas : les erreurs sortent en CODE stable, que le
// front traduit par tErr(). Seuls les libellés des rubriques font
// exception — ils ne sont pas ici, mais dans i18n.js (clé
// « forum_sec_<slug> »), car une rubrique est de l'interface.
// ════════════════════════════════════════════════════════

require_once __DIR__ . '/config.php';
require_once __DIR__ . '/auth_lib.php';
require_once __DIR__ . '/forum_lib.php';
require_once __DIR__ . '/mailer.php';

auth_session_start();

cors_headers(true);
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, X-CSRF-Token');
header('Content-Type: application/json; charset=utf-8');
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') { http_response_code(204); exit; }

const FORUM_PAR_PAGE  = 20;
const FORUM_MSG_PAGE  = 50;

function fout(array $data, int $code = 200): void {
    http_response_code($code);
    echo json_encode($data, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    exit;
}

function fbody(): array {
    return json_decode(file_get_contents('php://input'), true) ?? [];
}

/** Compte vérifié : écrire engage une identité, comme pour les avis. */
function forum_membre(PDO $db): array {
    $u = require_auth($db);
    if (!$u['email_verified']) {
        fout(err('email_not_verified', 'Vérifiez votre email pour participer.', ['need_verify' => true]), 403);
    }
    return $u;
}

$action = trim($_GET['action'] ?? '');
$method = $_SERVER['REQUEST_METHOD'];

// Toute écriture au nom de l'utilisateur exige le jeton CSRF.
$ECRITURES = ['topic_create','post_create','post_edit','post_delete','flag',
              'react','follow','topic_solved','moderate','topic_state',
              'event_create','event_update','event_cancel','attend'];
if (in_array($action, $ECRITURES, true) && $method === 'POST') csrf_verify();

try {
    $db = getDB();
    match (true) {
        $action === 'sections'     && $method === 'GET'  => a_sections($db),
        $action === 'topics'       && $method === 'GET'  => a_topics($db),
        $action === 'topic'        && $method === 'GET'  => a_topic($db),
        $action === 'tags'         && $method === 'GET'  => a_tags($db),
        $action === 'agenda'       && $method === 'GET'  => a_agenda($db),
        $action === 'lounge_events'&& $method === 'GET'  => a_lounge_events($db),
        $action === 'mod_queue'    && $method === 'GET'  => a_mod_queue($db),
        $action === 'topic_create' && $method === 'POST' => a_topic_create($db),
        $action === 'post_create'  && $method === 'POST' => a_post_create($db),
        $action === 'post_edit'    && $method === 'POST' => a_post_edit($db),
        $action === 'post_delete'  && $method === 'POST' => a_post_delete($db),
        $action === 'flag'         && $method === 'POST' => a_flag($db),
        $action === 'react'        && $method === 'POST' => a_react($db),
        $action === 'follow'       && $method === 'POST' => a_follow($db),
        $action === 'topic_solved' && $method === 'POST' => a_topic_solved($db),
        $action === 'moderate'     && $method === 'POST' => a_moderate($db),
        $action === 'topic_state'  && $method === 'POST' => a_topic_state($db),
        $action === 'event_create' && $method === 'POST' => a_event_create($db),
        $action === 'event_update' && $method === 'POST' => a_event_update($db),
        $action === 'event_cancel' && $method === 'POST' => a_event_cancel($db),
        $action === 'attend'       && $method === 'POST' => a_attend($db),
        default => fout(err('unknown_action', 'Action inconnue'), 404),
    };
} catch (Throwable $e) {
    error_log('[forum] ' . $e->getMessage());
    fout(err('server_error', 'Erreur serveur'), 500);
}

// ════════════════════════════════════════════════════════
// LECTURE
// ════════════════════════════════════════════════════════

function a_sections(PDO $db): void {
    // Le compte de sujets suit le meme filtre que la liste : annoncer
    // « 2 sujets » puis n'en montrer qu'un est pire que ne rien annoncer.
    fout(['sections' => forum_sections($db, forum_langues_demandees())]);
}

/**
 * Liste des sujets.
 *
 * LE FILTRE DE LANGUE. Le site parle six langues et le serveur ne
 * traduit pas : sans filtre, chaque rubrique deviendrait un empilement
 * où cinq lecteurs sur six ne comprennent rien. `lang` accepte une liste
 * (« fr,en ») ou « all ». Le front l'alimente par défaut avec la langue
 * d'affichage plus l'anglais — les autres restent à un clic.
 */
function a_topics(PDO $db): void {
    $section = trim($_GET['section'] ?? '');
    $tag     = forum_tag_slug($_GET['tag'] ?? '');
    $page    = max(1, (int)($_GET['page'] ?? 1));
    $offset  = ($page - 1) * FORUM_PAR_PAGE;

    $where = ["t.status <> 'removed'"];
    $args  = [];

    if ($section !== '') {
        $where[] = 's.slug = ?';
        $args[]  = $section;
    }

    $langs = forum_langues_demandees();
    if ($langs !== null) {
        $where[] = 't.lang IN (' . implode(',', array_fill(0, count($langs), '?')) . ')';
        foreach ($langs as $l) $args[] = $l;
    }

    $join = '';
    if ($tag !== '') {
        $join   = 'JOIN forum_topic_tags tt ON tt.topic_id = t.id
                   JOIN forum_tags g ON g.id = tt.tag_id AND g.slug = ?';
        array_unshift($args, $tag);
    }

    $sql = "SELECT SQL_CALC_FOUND_ROWS
                   t.id, t.title, t.slug, t.lang, t.is_pinned, t.posts_count,
                   t.views, t.last_post_at, t.created_at, t.ref_type, t.ref_id,
                   s.slug AS section, s.icon,
                   u.display_name, u.avatar_url, u.role
            FROM forum_topics t
            JOIN forum_sections s ON s.id = t.section_id
            $join
            LEFT JOIN users u ON u.id = t.user_id
            WHERE " . implode(' AND ', $where) . "
            ORDER BY t.is_pinned DESC, COALESCE(t.last_post_at, t.created_at) DESC
            LIMIT " . FORUM_PAR_PAGE . " OFFSET $offset";
    $stmt = $db->prepare($sql);
    $stmt->execute($args);
    $rows  = $stmt->fetchAll();
    $total = (int)$db->query('SELECT FOUND_ROWS()')->fetchColumn();

    $ids  = array_map(fn($r) => (int)$r['id'], $rows);
    $tags = forum_tags_de($db, $ids);

    fout([
        'topics' => array_map(fn($r) => [
            'id'       => (int)$r['id'],
            'title'    => $r['title'],
            'slug'     => $r['slug'],
            'lang'     => $r['lang'],
            'section'  => $r['section'],
            'icon'     => $r['icon'],
            'pinned'   => (bool)$r['is_pinned'],
            'posts'    => (int)$r['posts_count'],
            'views'    => (int)$r['views'],
            'last_post_at' => $r['last_post_at'],
            'created_at'   => $r['created_at'],
            'ref'      => $r['ref_type'] ? ['type' => $r['ref_type'], 'id' => $r['ref_id']] : null,
            'author'   => forum_auteur($r),
            'tags'     => $tags[(int)$r['id']] ?? [],
        ], $rows),
        'total' => $total,
        'page'  => $page,
        'pages' => (int)ceil($total / FORUM_PAR_PAGE),
    ]);
}

/**
 * Langues demandées, ou null pour « toutes ».
 * Une valeur hors des six langues du site est ignorée en silence : un
 * paramètre bricolé ne doit ni faire échouer la page, ni servir de
 * levier d'injection.
 */
function forum_langues_demandees(): ?array {
    $brut = trim($_GET['lang'] ?? '');
    if ($brut === '' || $brut === 'all') return null;
    $ok = array_values(array_intersect(
        array_map('trim', explode(',', $brut)),
        langues_site()
    ));
    return $ok ?: null;
}

function a_topic(PDO $db): void {
    $id   = (int)($_GET['id'] ?? 0);
    $page = max(1, (int)($_GET['page'] ?? 1));
    if ($id <= 0) fout(err('id_required', 'id requis'), 400);

    $stmt = $db->prepare(
        "SELECT t.*, s.slug AS section, s.icon, u.display_name, u.avatar_url, u.role
         FROM forum_topics t
         JOIN forum_sections s ON s.id = t.section_id
         LEFT JOIN users u ON u.id = t.user_id
         WHERE t.id = ? AND t.status <> 'removed'"
    );
    $stmt->execute([$id]);
    $t = $stmt->fetch();
    if (!$t) fout(err('topic_not_found', 'Sujet introuvable'), 404);

    // Le compteur de vues n'est pas critique : on l'incrémente sans
    // transaction et sans se soucier des rechargements.
    $db->prepare('UPDATE forum_topics SET views = views + 1 WHERE id = ?')->execute([$id]);

    $me = current_user($db);
    $offset = ($page - 1) * FORUM_MSG_PAGE;
    $stmt = $db->prepare(
        "SELECT p.id, p.user_id, p.body, p.status, p.quote_post_id, p.edited_at, p.created_at,
                u.display_name, u.avatar_url, u.role,
                (SELECT COUNT(*) FROM forum_reactions r WHERE r.post_id = p.id) AS likes
         FROM forum_posts p
         LEFT JOIN users u ON u.id = p.user_id
         WHERE p.topic_id = ? AND p.status <> 'removed'
         ORDER BY p.id LIMIT " . FORUM_MSG_PAGE . " OFFSET $offset"
    );
    $stmt->execute([$id]);

    $posts = array_map(function ($p) use ($me) {
        $masque = $p['status'] === 'flagged';
        return [
            'id'      => (int)$p['id'],
            // Un message signalé est masqué, pas effacé : le fil reste
            // lisible, et la décision du modérateur reste réversible.
            'html'    => $masque ? '' : forum_rendu($p['body']),
            'raw'     => (!$masque && $me && (int)$p['user_id'] === (int)$me['id']) ? $p['body'] : null,
            'hidden'  => $masque,
            'quote'   => $p['quote_post_id'] ? (int)$p['quote_post_id'] : null,
            'likes'   => (int)$p['likes'],
            'edited_at'  => $p['edited_at'],
            'created_at' => $p['created_at'],
            'author'  => forum_auteur($p),
            'mine'    => $me && (int)$p['user_id'] === (int)$me['id'],
        ];
    }, $stmt->fetchAll());

    // Un evenement EST un sujet : sa fiche voyage avec le fil, plutot
    // que dans un second appel que le front devrait synchroniser.
    $evt = null;
    $qe = $db->prepare('SELECT e.*, l.name AS lounge_name, l.country_id
                        FROM forum_events e LEFT JOIN lounges l ON l.id = e.lounge_id
                        WHERE e.topic_id = ?');
    $qe->execute([$id]);
    if ($row = $qe->fetch()) {
        forum_evt_perimer($db);
        $evt = forum_evt_format($row);
        $cap = $row['capacity'] !== null ? (int)$row['capacity'] : null;
        $evt['attendance'] = forum_evt_participation($db, $id, $cap, $me ? (int)$me['id'] : null);
        $evt['my_state']   = $me ? forum_evt_mon_etat($db, $id, (int)$me['id']) : null;
    }

    $tags = forum_tags_de($db, [$id]);
    fout([
        'event' => $evt,
        'topic' => [
            'id'      => (int)$t['id'],
            'title'   => $t['title'],
            'slug'    => $t['slug'],
            'lang'    => $t['lang'],
            'section' => $t['section'],
            'icon'    => $t['icon'],
            'locked'  => $t['status'] === 'locked',
            'pinned'  => (bool)$t['is_pinned'],
            'solved_post_id' => $t['solved_post_id'] ? (int)$t['solved_post_id'] : null,
            'views'   => (int)$t['views'],
            'ref'     => $t['ref_type'] ? ['type' => $t['ref_type'], 'id' => $t['ref_id']] : null,
            'created_at' => $t['created_at'],
            'author'  => forum_auteur($t),
            'tags'    => $tags[$id] ?? [],
            'mine'    => $me && (int)$t['user_id'] === (int)$me['id'],
        ],
        'posts' => $posts,
        'page'  => $page,
        'pages' => (int)ceil(max(1, (int)$t['posts_count']) / FORUM_MSG_PAGE),
    ]);
}

/**
 * Étiquettes proposées à la saisie.
 * Sous trois usages, une étiquette n'est PAS proposée : sinon le champ
 * se remplit des fautes de frappe du premier jour, que chacun reprend
 * ensuite en cliquant.
 */
function a_tags(PDO $db): void {
    $q = trim($_GET['q'] ?? '');
    if ($q !== '') {
        $stmt = $db->prepare(
            "SELECT slug, label, uses_count FROM forum_tags
             WHERE uses_count >= 3 AND (slug LIKE ? OR label LIKE ?)
             ORDER BY uses_count DESC, label LIMIT 10"
        );
        $like = '%' . str_replace(['%', '_'], ['\%', '\_'], $q) . '%';
        $stmt->execute([$like, $like]);
    } else {
        $stmt = $db->query(
            "SELECT slug, label, uses_count FROM forum_tags
             WHERE uses_count >= 3 ORDER BY uses_count DESC, label LIMIT 20"
        );
    }
    fout(['tags' => array_map(fn($r) => [
        'slug' => $r['slug'], 'label' => $r['label'], 'uses' => (int)$r['uses_count'],
    ], $stmt->fetchAll())]);
}

// ════════════════════════════════════════════════════════
// ÉCRITURE
// ════════════════════════════════════════════════════════

function a_topic_create(PDO $db): void {
    $u = forum_membre($db);
    $b = fbody();

    $section = trim($b['section'] ?? '');
    $title   = trim(strip_tags($b['title'] ?? ''));
    $body    = trim($b['body'] ?? '');
    $lang    = in_array($b['lang'] ?? '', langues_site(), true) ? $b['lang'] : ($u['lang'] ?: 'fr');

    if (mb_strlen($title) < 8)   fout(err('title_too_short', 'Un titre d\'au moins 8 caractères est requis.'), 400);
    if (mb_strlen($body)  < 20)  fout(err('body_too_short',  'Le message doit faire au moins 20 caractères.'), 400);
    $title = mb_substr($title, 0, 140);
    $body  = mb_substr($body, 0, 20000);

    $q = $db->prepare('SELECT id FROM forum_sections WHERE slug = ?');
    $q->execute([$section]);
    $section_id = (int)$q->fetchColumn();
    if (!$section_id) fout(err('section_not_found', 'Rubrique inconnue'), 400);

    if ($stop = forum_plafond($db, $u, true, $body)) fout(err($stop[0], $stop[1]), 429);

    // Sujet et premier message forment un tout : si le message échoue,
    // un sujet vide resterait à jamais en tête de rubrique.
    $db->beginTransaction();
    try {
        $ref = forum_ref_valide($db, $b['ref_type'] ?? null, $b['ref_id'] ?? null);
        $db->prepare(
            'INSERT INTO forum_topics (section_id, user_id, title, slug, lang, ref_type, ref_id)
             VALUES (?, ?, ?, ?, ?, ?, ?)'
        )->execute([$section_id, $u['id'], $title, forum_slug($title), $lang, $ref[0], $ref[1]]);
        $topic_id = (int)$db->lastInsertId();

        $db->prepare('INSERT INTO forum_posts (topic_id, user_id, body) VALUES (?, ?, ?)')
           ->execute([$topic_id, $u['id'], $body]);

        forum_tags_appliquer($db, $topic_id, is_array($b['tags'] ?? null) ? $b['tags'] : []);
        forum_topic_recompte($db, $topic_id);
        $db->commit();
    } catch (Throwable $e) {
        $db->rollBack();
        throw $e;
    }

    fout(['success' => true, 'id' => $topic_id, 'slug' => forum_slug($title)], 201);
}

/** Un ancrage n'est accepté que s'il désigne une entité qui existe. */
function forum_ref_valide(PDO $db, ?string $type, ?string $id): array {
    if (!$type || !$id) return [null, null];
    $table = match ($type) {
        'lounge'  => 'lounges',
        'brand'   => 'brands',
        'country' => 'producer_countries',
        default   => null,
    };
    if (!$table) return [null, null];
    $col = $type === 'lounge' ? 'id' : ($type === 'brand' ? 'name' : 'id');
    $q = $db->prepare("SELECT 1 FROM `$table` WHERE `$col` = ? LIMIT 1");
    $q->execute([$id]);
    return $q->fetchColumn() ? [$type, mb_substr($id, 0, 80)] : [null, null];
}

function a_post_create(PDO $db): void {
    $u = forum_membre($db);
    $b = fbody();
    $topic_id = (int)($b['topic_id'] ?? 0);
    $body     = trim($b['body'] ?? '');
    if ($topic_id <= 0)        fout(err('id_required', 'id requis'), 400);
    if (mb_strlen($body) < 2)  fout(err('body_too_short', 'Message vide.'), 400);
    $body = mb_substr($body, 0, 20000);

    $q = $db->prepare("SELECT status FROM forum_topics WHERE id = ?");
    $q->execute([$topic_id]);
    $statut = $q->fetchColumn();
    if (!$statut)                                     fout(err('topic_not_found', 'Sujet introuvable'), 404);
    if (in_array($statut, ['locked', 'removed'], true)) fout(err('topic_locked', 'Ce sujet est fermé.'), 403);

    if ($stop = forum_plafond($db, $u, false, $body)) fout(err($stop[0], $stop[1]), 429);

    $quote = (int)($b['quote_post_id'] ?? 0) ?: null;
    $db->prepare('INSERT INTO forum_posts (topic_id, user_id, body, quote_post_id) VALUES (?, ?, ?, ?)')
       ->execute([$topic_id, $u['id'], $body, $quote]);
    $id = (int)$db->lastInsertId();
    forum_topic_recompte($db, $topic_id);

    fout(['success' => true, 'id' => $id, 'html' => forum_rendu($body)], 201);
}

function a_post_edit(PDO $db): void {
    $u = forum_membre($db);
    $b = fbody();
    $id   = (int)($b['id'] ?? 0);
    $body = trim($b['body'] ?? '');
    if ($id <= 0 || mb_strlen($body) < 2) fout(err('body_too_short', 'Message vide.'), 400);

    $q = $db->prepare('SELECT user_id, TIMESTAMPDIFF(MINUTE, created_at, NOW()) AS age FROM forum_posts WHERE id = ?');
    $q->execute([$id]);
    $p = $q->fetch();
    if (!$p) fout(err('post_not_found', 'Message introuvable'), 404);

    $moderateur = in_array($u['role'], ['moderator', 'admin'], true);
    if ((int)$p['user_id'] !== (int)$u['id'] && !$moderateur) {
        fout(err('forbidden', 'Action non autorisée'), 403);
    }
    // Passé la demi-heure, un message a été lu et cité : le corriger
    // silencieusement réécrirait la conversation des autres.
    if (!$moderateur && (int)$p['age'] > FORUM_EDIT_MINUTES) {
        fout(err('forum_edit_expire', 'Le délai de modification est dépassé.'), 403);
    }

    $db->prepare('UPDATE forum_posts SET body = ?, edited_at = NOW() WHERE id = ?')
       ->execute([mb_substr($body, 0, 20000), $id]);
    fout(['success' => true, 'html' => forum_rendu($body)]);
}

/**
 * Retrait par l'auteur.
 * Le message devient une pierre tombale plutôt que de disparaître :
 * effacer au milieu d'un échange rend la suite incompréhensible.
 */
function a_post_delete(PDO $db): void {
    $u = forum_membre($db);
    $id = (int)(fbody()['id'] ?? 0);
    if ($id <= 0) fout(err('id_required', 'id requis'), 400);

    $q = $db->prepare('SELECT user_id, topic_id FROM forum_posts WHERE id = ?');
    $q->execute([$id]);
    $p = $q->fetch();
    if (!$p) fout(err('post_not_found', 'Message introuvable'), 404);
    if ((int)$p['user_id'] !== (int)$u['id'] && !in_array($u['role'], ['moderator','admin'], true)) {
        fout(err('forbidden', 'Action non autorisée'), 403);
    }

    $db->prepare("UPDATE forum_posts SET status = 'removed' WHERE id = ?")->execute([$id]);
    forum_topic_recompte($db, (int)$p['topic_id']);
    fout(['success' => true]);
}

function a_flag(PDO $db): void {
    $u = forum_membre($db);
    $b = fbody();
    $post_id = (int)($b['post_id'] ?? 0);
    if ($post_id <= 0) fout(err('id_required', 'id requis'), 400);

    $q = $db->prepare('SELECT user_id FROM forum_posts WHERE id = ?');
    $q->execute([$post_id]);
    $auteur = $q->fetchColumn();
    if ($auteur === false) fout(err('post_not_found', 'Message introuvable'), 404);
    // Se signaler soi-même n'aurait qu'un usage : approcher seul le
    // seuil de masquage. Même règle que pour les avis.
    if ((int)$auteur === (int)$u['id']) fout(err('flag_own', 'On ne signale pas son propre message.'), 400);

    [$n, $masque] = forum_signaler($db, $post_id, (int)$u['id'], (string)($b['reason'] ?? 'other'), (string)($b['note'] ?? ''));
    fout(['success' => true, 'flags' => $n, 'hidden' => $masque]);
}

function a_react(PDO $db): void {
    $u = forum_membre($db);
    $post_id = (int)(fbody()['post_id'] ?? 0);
    if ($post_id <= 0) fout(err('id_required', 'id requis'), 400);

    $q = $db->prepare('SELECT 1 FROM forum_reactions WHERE post_id = ? AND user_id = ?');
    $q->execute([$post_id, $u['id']]);
    if ($q->fetchColumn()) {
        $db->prepare('DELETE FROM forum_reactions WHERE post_id = ? AND user_id = ?')->execute([$post_id, $u['id']]);
        $actif = false;
    } else {
        $db->prepare('INSERT IGNORE INTO forum_reactions (post_id, user_id) VALUES (?, ?)')->execute([$post_id, $u['id']]);
        $actif = true;
    }
    $q = $db->prepare('SELECT COUNT(*) FROM forum_reactions WHERE post_id = ?');
    $q->execute([$post_id]);
    fout(['success' => true, 'active' => $actif, 'likes' => (int)$q->fetchColumn()]);
}

function a_follow(PDO $db): void {
    $u = forum_membre($db);
    $topic_id = (int)(fbody()['topic_id'] ?? 0);
    if ($topic_id <= 0) fout(err('id_required', 'id requis'), 400);

    $q = $db->prepare('SELECT 1 FROM forum_follows WHERE topic_id = ? AND user_id = ?');
    $q->execute([$topic_id, $u['id']]);
    if ($q->fetchColumn()) {
        $db->prepare('DELETE FROM forum_follows WHERE topic_id = ? AND user_id = ?')->execute([$topic_id, $u['id']]);
        fout(['success' => true, 'following' => false]);
    }
    $db->prepare('INSERT IGNORE INTO forum_follows (topic_id, user_id) VALUES (?, ?)')->execute([$topic_id, $u['id']]);
    fout(['success' => true, 'following' => true]);
}

/** L'auteur du sujet désigne la réponse qui l'a résolu. */
function a_topic_solved(PDO $db): void {
    $u = forum_membre($db);
    $b = fbody();
    $topic_id = (int)($b['topic_id'] ?? 0);
    $post_id  = (int)($b['post_id'] ?? 0) ?: null;

    $q = $db->prepare('SELECT user_id FROM forum_topics WHERE id = ?');
    $q->execute([$topic_id]);
    $auteur = $q->fetchColumn();
    if ($auteur === false) fout(err('topic_not_found', 'Sujet introuvable'), 404);
    if ((int)$auteur !== (int)$u['id'] && !in_array($u['role'], ['moderator','admin'], true)) {
        fout(err('forbidden', 'Action non autorisée'), 403);
    }
    if ($post_id) {
        $q = $db->prepare('SELECT 1 FROM forum_posts WHERE id = ? AND topic_id = ?');
        $q->execute([$post_id, $topic_id]);
        if (!$q->fetchColumn()) fout(err('post_not_found', 'Message introuvable'), 404);
    }
    $db->prepare('UPDATE forum_topics SET solved_post_id = ? WHERE id = ?')->execute([$post_id, $topic_id]);
    fout(['success' => true, 'solved_post_id' => $post_id]);
}

// ════════════════════════════════════════════════════════
// MODÉRATION
// ════════════════════════════════════════════════════════

function forum_moderateur(PDO $db): array {
    if (!is_admin_request($db)) fout(err('forbidden', 'Action non autorisée'), 403);
    return current_user($db) ?? ['id' => 0, 'role' => 'admin'];
}

function a_mod_queue(PDO $db): void {
    forum_moderateur($db);
    $rows = $db->query(
        "SELECT p.id, p.body, p.status, p.created_at, p.topic_id,
                t.title AS topic_title,
                u.display_name,
                COUNT(f.id) AS flags,
                GROUP_CONCAT(DISTINCT f.reason) AS reasons
         FROM forum_flags f
         JOIN forum_posts p  ON p.id = f.post_id
         JOIN forum_topics t ON t.id = p.topic_id
         LEFT JOIN users u   ON u.id = p.user_id
         WHERE f.resolved_at IS NULL
         GROUP BY p.id, p.body, p.status, p.created_at, p.topic_id, t.title, u.display_name
         ORDER BY flags DESC, p.created_at"
    )->fetchAll();

    fout(['queue' => array_map(fn($r) => [
        'post_id' => (int)$r['id'],
        'topic_id'=> (int)$r['topic_id'],
        'topic'   => $r['topic_title'],
        'author'  => $r['display_name'],
        'extrait' => forum_extrait($r['body'], 300),
        'status'  => $r['status'],
        'flags'   => (int)$r['flags'],
        'reasons' => explode(',', (string)$r['reasons']),
        'created_at' => $r['created_at'],
    ], $rows)]);
}

function a_moderate(PDO $db): void {
    $mod = forum_moderateur($db);
    $b = fbody();
    $post_id  = (int)($b['post_id'] ?? 0);
    $decision = ($b['decision'] ?? '') === 'retirer' ? 'retirer' : 'publier';
    if ($post_id <= 0) fout(err('id_required', 'id requis'), 400);

    forum_moderer($db, $post_id, $decision, (int)($mod['id'] ?? 0));
    fout(['success' => true, 'decision' => $decision]);
}

function a_topic_state(PDO $db): void {
    forum_moderateur($db);
    $b = fbody();
    $topic_id = (int)($b['topic_id'] ?? 0);
    if ($topic_id <= 0) fout(err('id_required', 'id requis'), 400);

    if (array_key_exists('lock', $b)) {
        $db->prepare("UPDATE forum_topics SET status = ? WHERE id = ? AND status <> 'removed'")
           ->execute([$b['lock'] ? 'locked' : 'open', $topic_id]);
    }
    if (array_key_exists('pin', $b)) {
        $db->prepare('UPDATE forum_topics SET is_pinned = ? WHERE id = ?')
           ->execute([$b['pin'] ? 1 : 0, $topic_id]);
    }
    if (!empty($b['remove'])) {
        $db->prepare("UPDATE forum_topics SET status = 'removed' WHERE id = ?")->execute([$topic_id]);
    }
    fout(['success' => true]);
}

// ════════════════════════════════════════════════════════
// ÉVÉNEMENTS (V2)
// ════════════════════════════════════════════════════════

/**
 * Créer un rendez-vous demande le statut de CONFIANCE.
 *
 * C'est la seule action du forum ainsi réservée, et pour une raison
 * précise : un rendez-vous physique annoncé par un compte de trois
 * minutes est le principal vecteur d'abus d'un espace comme celui-ci.
 * Le seuil existe déjà (N contributions validées), et un modérateur
 * peut l'accorder à la demande.
 */
function forum_organisateur(PDO $db): array {
    $u = forum_membre($db);
    if (!forum_de_confiance($u)) {
        fout(err('evt_confiance_requise',
                 'Organiser un rendez-vous demande le statut de contributeur de confiance.'), 403);
    }
    return $u;
}

/** GET ?action=agenda[&passes=1][&lang=…] */
function a_agenda(PDO $db): void {
    $passes = !empty($_GET['passes']);
    $evts   = forum_evt_agenda($db, forum_langues_demandees(), $passes);

    // La participation de CHACUN, en une requête par événement plutôt
    // qu'une par ligne affichée : l'agenda tient en une page.
    $me = current_user($db);
    foreach ($evts as &$e) {
        $e['attendance'] = forum_evt_participation($db, $e['topic_id'], $e['capacity'], $me ? (int)$me['id'] : null);
        $e['my_state']   = $me ? forum_evt_mon_etat($db, $e['topic_id'], (int)$me['id']) : null;
    }
    unset($e);
    fout(['events' => $evts, 'past' => $passes]);
}

/**
 * GET ?action=lounge_events&id=42  ou  &ids=1,2,3
 *
 * La forme au pluriel existe pour le panneau d'un pays : il affiche
 * jusqu'a vingt etablissements, et vingt requetes sur un serveur qui
 * n'en traite qu'une a la fois transformeraient l'ouverture du panneau
 * en attente visible.
 */
function a_lounge_events(PDO $db): void {
    $ids = [];
    foreach (explode(',', (string)($_GET['ids'] ?? $_GET['id'] ?? '')) as $v) {
        $v = (int)trim($v);
        if ($v > 0) $ids[] = $v;
    }
    $ids = array_slice(array_unique($ids), 0, 60);
    if (!$ids) fout(err('id_required', 'id requis'), 400);

    $parLounge = forum_evt_par_lounge($db, $ids);
    // Une seule cle : la forme au singulier reste servie telle quelle,
    // pour que l'appelant n'ait pas a distinguer les deux cas.
    fout([
        'events'    => count($ids) === 1 ? ($parLounge[$ids[0]] ?? []) : [],
        'by_lounge' => $parLounge,
    ]);
}

/**
 * POST ?action=event_create
 * { title, body, lang, starts_local, ends_local, timezone, kind,
 *   lounge_id | place_label + lat/lon, capacity, tags[] }
 */
function a_event_create(PDO $db): void {
    $u = forum_organisateur($db);
    $b = fbody();

    $title = trim(strip_tags($b['title'] ?? ''));
    $body  = trim($b['body'] ?? '');
    if (mb_strlen($title) < 8)  fout(err('title_too_short', 'Un titre d\'au moins 8 caractères est requis.'), 400);
    if (mb_strlen($body)  < 20) fout(err('body_too_short',  'Le message doit faire au moins 20 caractères.'), 400);

    $tz = (string)($b['timezone'] ?? 'Europe/Paris');
    if (!forum_evt_fuseau_valide($tz)) fout(err('evt_fuseau', 'Fuseau horaire inconnu.'), 400);

    $debut = forum_evt_utc((string)($b['starts_local'] ?? ''), $tz);
    if (!$debut) fout(err('evt_date_requise', 'Une date et une heure de début sont requises.'), 400);
    $fin = isset($b['ends_local']) && trim((string)$b['ends_local']) !== ''
         ? forum_evt_utc((string)$b['ends_local'], $tz) : null;

    if ($stop = forum_evt_valider($debut, $fin)) fout(err($stop[0], $stop[1]), 400);
    if ($stop = forum_plafond($db, $u, true, $body)) fout(err($stop[0], $stop[1]), 429);

    $kind = in_array($b['kind'] ?? '', forum_evt_natures(), true) ? $b['kind'] : 'rencontre';
    $cap  = isset($b['capacity']) && (int)$b['capacity'] > 0 ? min(9999, (int)$b['capacity']) : null;
    [$loungeId, $label, $lat, $lon] = forum_evt_lieu(
        $db, $b['lounge_id'] ?? 0, $b['place_label'] ?? '', $b['lat'] ?? null, $b['lon'] ?? null
    );
    if (!$loungeId && !$label) fout(err('evt_lieu_requis', 'Indiquez un lieu.'), 400);

    $lang = in_array($b['lang'] ?? '', langues_site(), true) ? $b['lang'] : ($u['lang'] ?: 'fr');

    // Sujet, message et événement forment un tout : à défaut, un sujet
    // sans date resterait en tête de l'agenda sans jamais s'y afficher.
    $db->beginTransaction();
    try {
        $sid = (int)$db->query("SELECT id FROM forum_sections WHERE is_events = 1 ORDER BY position LIMIT 1")->fetchColumn();
        if (!$sid) throw new RuntimeException('aucune rubrique d\'evenements');

        $db->prepare('INSERT INTO forum_topics (section_id, user_id, title, slug, lang, ref_type, ref_id)
                      VALUES (?, ?, ?, ?, ?, ?, ?)')
           ->execute([$sid, $u['id'], mb_substr($title, 0, 140), forum_slug($title), $lang,
                      $loungeId ? 'lounge' : null, $loungeId ? (string)$loungeId : null]);
        $tid = (int)$db->lastInsertId();

        $db->prepare('INSERT INTO forum_posts (topic_id, user_id, body) VALUES (?, ?, ?)')
           ->execute([$tid, $u['id'], mb_substr($body, 0, 20000)]);

        $db->prepare('INSERT INTO forum_events
                      (topic_id, starts_at, ends_at, timezone, kind, lounge_id, place_label, lat, lon, capacity)
                      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)')
           ->execute([$tid, $debut, $fin, $tz, $kind, $loungeId, $label, $lat, $lon, $cap]);

        // L'organisateur vient, par construction. Le dire évite l'agenda
        // qui annonce « 0 participant » à un rendez-vous qui a un hôte.
        forum_evt_participer($db, $tid, (int)$u['id'], 'going');

        forum_tags_appliquer($db, $tid, is_array($b['tags'] ?? null) ? $b['tags'] : []);
        forum_topic_recompte($db, $tid);
        $db->commit();
    } catch (Throwable $e) {
        $db->rollBack();
        throw $e;
    }
    fout(['success' => true, 'id' => $tid], 201);
}

/** L'organisateur, ou un modérateur. */
function forum_evt_maitre(PDO $db, int $topic_id): array {
    $u = forum_membre($db);
    $q = $db->prepare('SELECT user_id FROM forum_topics WHERE id = ?');
    $q->execute([$topic_id]);
    $auteur = $q->fetchColumn();
    if ($auteur === false) fout(err('topic_not_found', 'Sujet introuvable'), 404);
    if ((int)$auteur !== (int)$u['id'] && !in_array($u['role'], ['moderator', 'admin'], true)) {
        fout(err('forbidden', 'Action non autorisée'), 403);
    }
    return $u;
}

/** POST ?action=event_update — modifiable jusqu'au début, pas après. */
function a_event_update(PDO $db): void {
    $b   = fbody();
    $tid = (int)($b['topic_id'] ?? 0);
    if ($tid <= 0) fout(err('id_required', 'id requis'), 400);
    forum_evt_maitre($db, $tid);

    $q = $db->prepare('SELECT * FROM forum_events WHERE topic_id = ?');
    $q->execute([$tid]);
    $e = $q->fetch();
    if (!$e) fout(err('evt_not_found', 'Rendez-vous introuvable'), 404);
    if ($e['status'] !== 'upcoming') {
        // Une archive ne se réécrit pas : ceux qui sont venus l'ont vue
        // telle qu'elle était.
        fout(err('evt_fige', 'Ce rendez-vous est passé ou annulé.'), 403);
    }

    $tz = (string)($b['timezone'] ?? $e['timezone']);
    if (!forum_evt_fuseau_valide($tz)) fout(err('evt_fuseau', 'Fuseau horaire inconnu.'), 400);

    $debut = isset($b['starts_local']) && trim((string)$b['starts_local']) !== ''
           ? forum_evt_utc((string)$b['starts_local'], $tz) : $e['starts_at'];
    if (!$debut) fout(err('evt_date_requise', 'Date de début invalide.'), 400);
    $fin = array_key_exists('ends_local', $b)
         ? (trim((string)$b['ends_local']) !== '' ? forum_evt_utc((string)$b['ends_local'], $tz) : null)
         : $e['ends_at'];

    if ($stop = forum_evt_valider($debut, $fin)) fout(err($stop[0], $stop[1]), 400);

    $kind = in_array($b['kind'] ?? '', forum_evt_natures(), true) ? $b['kind'] : $e['kind'];
    $cap  = array_key_exists('capacity', $b)
          ? ((int)$b['capacity'] > 0 ? min(9999, (int)$b['capacity']) : null)
          : ($e['capacity'] !== null ? (int)$e['capacity'] : null);

    [$loungeId, $label, $lat, $lon] = array_key_exists('lounge_id', $b) || array_key_exists('place_label', $b)
        ? forum_evt_lieu($db, $b['lounge_id'] ?? 0, $b['place_label'] ?? '', $b['lat'] ?? null, $b['lon'] ?? null)
        : [$e['lounge_id'], $e['place_label'], $e['lat'], $e['lon']];

    $db->prepare('UPDATE forum_events SET starts_at = ?, ends_at = ?, timezone = ?, kind = ?,
                         lounge_id = ?, place_label = ?, lat = ?, lon = ?, capacity = ?
                  WHERE topic_id = ?')
       ->execute([$debut, $fin, $tz, $kind, $loungeId, $label, $lat, $lon, $cap, $tid]);

    fout(['success' => true]);
}

/**
 * POST ?action=event_cancel — { topic_id, reason }
 *
 * Annuler N'EFFACE PAS. Le rendez-vous reste visible, barré, avec son
 * motif : quelqu'un qui avait bloqué sa soirée doit pouvoir comprendre
 * ce qui s'est passé, et le fil de discussion reste ouvert.
 *
 * Les inscrits sont prévenus par email, sans possibilité de couper
 * cette notification-là : elle porte une information qu'ils ne peuvent
 * pas deviner.
 */
function a_event_cancel(PDO $db): void {
    $b   = fbody();
    $tid = (int)($b['topic_id'] ?? 0);
    if ($tid <= 0) fout(err('id_required', 'id requis'), 400);
    forum_evt_maitre($db, $tid);

    $motif = mb_substr(trim((string)($b['reason'] ?? '')), 0, 300);
    $db->prepare("UPDATE forum_events SET status = 'cancelled', cancel_reason = ? WHERE topic_id = ?")
       ->execute([$motif ?: null, $tid]);

    $prevenus = forum_evt_prevenir_annulation($db, $tid, $motif);
    fout(['success' => true, 'notified' => $prevenus]);
}

/** POST ?action=attend — { topic_id, state } */
function a_attend(PDO $db): void {
    $u   = forum_membre($db);
    $b   = fbody();
    $tid = (int)($b['topic_id'] ?? 0);
    if ($tid <= 0) fout(err('id_required', 'id requis'), 400);

    $q = $db->prepare('SELECT status, capacity FROM forum_events WHERE topic_id = ?');
    $q->execute([$tid]);
    $e = $q->fetch();
    if (!$e) fout(err('evt_not_found', 'Rendez-vous introuvable'), 404);
    if ($e['status'] !== 'upcoming') fout(err('evt_fige', 'Ce rendez-vous est passé ou annulé.'), 403);

    $etat = (string)($b['state'] ?? 'going');
    forum_evt_participer($db, $tid, (int)$u['id'], $etat);

    $cap = $e['capacity'] !== null ? (int)$e['capacity'] : null;
    fout([
        'success'    => true,
        'my_state'   => forum_evt_mon_etat($db, $tid, (int)$u['id']),
        'attendance' => forum_evt_participation($db, $tid, $cap, (int)$u['id']),
    ]);
}
