<?php
// ════════════════════════════════════════════════════════
// admin.php — Interface de modération CigarOdyssey
// Accès : votre-site.com/backend/admin.php puis saisie de la clé
// d'administration (ADMIN_KEY). L'authentification est portée par la
// session : la clé ne transite jamais par l'URL.
// ════════════════════════════════════════════════════════

require_once __DIR__ . '/config.php';
require_once __DIR__ . '/auth_lib.php';
require_once __DIR__ . '/moderation_lib.php';
require_once __DIR__ . '/forum_lib.php';

auth_session_start();   // meme session que le reste du site (cookie CGSESS)

// La base est ouverte AVANT la porte : c'est elle qui sait qu'un compte
// connecté porte le rôle de modérateur. Sans elle, la porte ne connaît
// que la clé — et c'est exactement ce qui rendait le rôle inutilisable.
// L'echec est tolere : la page de connexion doit rester affichable
// quand la base ne repond pas.
try { $db = getDB(); } catch (Throwable $e) { $db = null; }

// ── Deconnexion ───────────────────────────────────────────
if (isset($_GET['logout'])) {
    unset($_SESSION['admin'], $_SESSION['admin_csrf']);
    // Un modérateur tient ses droits de son COMPTE, pas de la clé :
    // effacer la session d'administration ne le déconnecte de rien, et
    // le renvoyer ici le ferait rentrer aussitôt — « Déconnexion »
    // aurait l'air en panne. On le ramène au site, où se trouve la
    // déconnexion qui le concerne.
    header('Location: ' . (admin_scope($db) !== null ? '/' : strtok($_SERVER['REQUEST_URI'], '?')));
    exit;
}

// ── Connexion : la cle transite uniquement en POST ────────
$login_error = false;
if (isset($_POST['login_key'])) {
    if (ADMIN_KEY !== '' && hash_equals(ADMIN_KEY, (string)$_POST['login_key'])) {
        session_regenerate_id(true);
        $_SESSION['admin'] = true;
        admin_csrf();
        // Redirection : evite le renvoi du formulaire et laisse une URL propre
        header('Location: ' . strtok($_SERVER['REQUEST_URI'], '?'));
        exit;
    }
    $login_error = true;
}

// Portée, et non plus simple oui/non : 'admin' (clé, ou compte de rôle
// admin) ou 'moderator' (compte de rôle moderator). Voir auth_lib.php.
$scope  = admin_scope($db);
$authed = $scope !== null;

// ── Page de connexion ─────────────────────────────────────
if (!$authed) { ?><!DOCTYPE html>
<html lang="fr"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>CigarOdyssey — Admin</title>
<link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet">
<style>
*{box-sizing:border-box;margin:0;padding:0}
body{background:#0A0603;min-height:100vh;display:flex;align-items:center;justify-content:center;font-family:'DM Sans',sans-serif}
.login-wrap{width:380px;padding:48px 40px;background:#100C07;border:1px solid rgba(201,162,39,.2);border-radius:12px;box-shadow:0 32px 80px rgba(0,0,0,.6)}
.login-logo{text-align:center;margin-bottom:32px}
.login-logo .mark{font-size:40px;display:block;margin-bottom:12px}
.login-logo h1{font-family:'Cinzel',serif;font-size:18px;color:#C9A227;letter-spacing:.2em}
.login-logo p{font-size:11px;color:#6B5030;margin-top:4px;letter-spacing:.12em}
label{display:block;font-size:11px;letter-spacing:.12em;color:#6B5030;margin-bottom:6px;text-transform:uppercase}
input[type=password]{width:100%;padding:12px 14px;background:#0A0603;border:1px solid rgba(201,162,39,.2);border-radius:6px;color:#E0C88A;font-size:14px;outline:none;transition:border-color .2s;margin-bottom:20px}
input[type=password]:focus{border-color:#C9A227}
button{width:100%;padding:13px;background:#C9A227;border:none;border-radius:6px;font-family:'Cinzel',serif;font-size:12px;font-weight:600;letter-spacing:.15em;cursor:pointer;color:#0A0603;transition:background .2s}
button:hover{background:#E8C040}
.login-err{background:rgba(207,94,94,.1);border:1px solid rgba(207,94,94,.3);border-radius:6px;padding:10px 14px;font-size:12px;color:#CF5E5E;margin-bottom:16px;text-align:center}
</style></head><body>
<div class="login-wrap">
  <div class="login-logo">
    <span class="mark">🥃</span>
    <h1>CIGAR ODYSSEY</h1>
    <p>ADMINISTRATION</p>
  </div>
  <?php if ($login_error): ?>
  <div class="login-err">Clé incorrecte</div>
  <?php endif; ?>
  <form method="POST">
    <label>Clé d'administration</label>
    <input type="password" name="login_key" placeholder="••••••••••••" autofocus autocomplete="current-password">
    <button type="submit">Accéder →</button>
  </form>
</div>
</body></html><?php exit; }

// ── Auth OK — initialisation ──────────────────────────────
$msg  = ['type'=>'','text'=>''];
$moi  = current_user($db);   // null si l'accès vient de la clé

// Domaine requis par chaque action et par chaque onglet. UNE seule
// liste, lue par la garde des POST et par le menu : sans cela, les deux
// finissent par diverger et le menu propose ce que la garde refuse.
// Tout ce qui n'y figure pas relève de la modération courante, ouverte
// aux deux portées.
$DOMAINE_ACTION = ['langues_save' => 'langues', 'role_set' => 'membres'];
$DOMAINE_ONGLET = ['langues' => 'langues', 'membres' => 'membres'];

// Actions POST
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action'])) {
    if (!admin_csrf_valid($_POST['csrf'] ?? null)) {
        http_response_code(419);
        exit('Jeton de securite invalide ou expire. Rechargez la page.');
    }
    $id     = (int)($_POST['id'] ?? 0);
    $action = $_POST['action'];

    // Le menu MASQUE ce qu'une portée ne peut pas faire ; cette garde le
    // REFUSE. Un menu n'est pas une serrure — une requête POST se forge
    // à la main en trois secondes, et c'est ici qu'elle bute.
    $domaine = $DOMAINE_ACTION[$action] ?? 'moderation';
    if (!portee_autorise($scope, $domaine)) {
        http_response_code(403);
        exit('Refusé : ' . (PORTEE_ADMIN_SEULEMENT[$domaine] ?? $domaine)
             . " n'est pas ouvert à la modération.");
    }

    // ── Compléter une adresse ────────────────────────────
    // CE QUE CET ÉCRAN NE TOUCHE PAS : la description. Elle porte 2 500
    // traductions scellées (translation_status), et la modifier ici les
    // rendrait toutes périmées en silence. Les descriptions passent par
    // la chaîne de traduction, qui sait resceller. Ici, uniquement ce
    // qui n'a pas de langue — horaires, site, Instagram, coordonnées,
    // téléphone : 65 des 100 points du barème, et ceux qui sont à zéro.
    if ($action === 'adresse_save') {
        require_once __DIR__ . '/completude_lib.php';
        $champs = [];
        foreach (['hours', 'website', 'instagram', 'phone'] as $c) {
            $champs[$c] = trim((string)($_POST[$c] ?? '')) ?: null;
        }
        // Un site sans schéma est un lien mort : « exemple.com » dans un
        // href mène à /admin/exemple.com. On complète plutôt que de
        // refuser — la personne a tapé ce qu'elle voulait dire.
        if ($champs['website'] !== null && !preg_match('#^https?://#i', $champs['website'])) {
            $champs['website'] = 'https://' . ltrim($champs['website'], '/');
        }
        if ($champs['website'] !== null && !filter_var($champs['website'], FILTER_VALIDATE_URL)) {
            $champs['website'] = null;
        }
        // L'arobase est du décor : on stocke le compte, le front fabrique
        // l'adresse. Le garder produisait instagram.com/@nom, qui est 404.
        if ($champs['instagram'] !== null) {
            $champs['instagram'] = ltrim($champs['instagram'], '@');
            if (!preg_match('/^[A-Za-z0-9._]{1,30}$/', $champs['instagram'])) $champs['instagram'] = null;
        }

        $lat = trim((string)($_POST['lat'] ?? ''));
        $lon = trim((string)($_POST['lon'] ?? ''));
        // Les deux, ou aucune. Et jamais (0,0) : voir completude_lib.
        $coordsOk = completude_coord_valide($lat, $lon);
        $champs['lat'] = $coordsOk ? (float)$lat : null;
        $champs['lon'] = $coordsOk ? (float)$lon : null;

        $sql = 'UPDATE lounges SET ' . implode(', ', array_map(fn($c) => "`$c` = ?", array_keys($champs)))
             . ', updated_at = NOW() WHERE id = ?';
        $db->prepare($sql)->execute([...array_values($champs), $id]);

        $rempli = array_keys(array_filter($champs, fn($v) => $v !== null && $v !== ''));
        journaliser($db, 'adresse_completee', 'lounge', $id, implode(',', $rempli));
        $refus = ($lat !== '' || $lon !== '') && !$coordsOk;
        $msg = $refus
            ? ['type' => 'warn', 'text' => 'Adresse enregistrée, mais les coordonnées ont été écartées : '
                . 'il faut les deux, dans les bornes, et (0,0) n’est pas une position.']
            : ['type' => 'ok', 'text' => 'Adresse #' . $id . ' enregistrée.'];
    }

    if ($action === 'langues_save') {
        // Pas de $id : le réglage porte sur le site, pas sur une ligne.
        // Les cases décochées n'arrivent pas dans $_POST — c'est bien la
        // liste des COCHÉES qu'on enregistre, et langues_definir() écrit
        // les six lignes.
        $choix = array_map('strval', (array)($_POST['langues'] ?? []));
        $act = langues_definir($db, $choix);
        $off = array_diff(langues_connues(), $act);
        $msg = ['type' => $off ? 'warn' : 'ok',
                'text' => 'Langues servies : ' . strtoupper(implode(', ', $act))
                        . ($off ? ' — fermées : ' . strtoupper(implode(', ', $off)) : '')
                        . '.'];
    } elseif ($id && $action === 'approve') {
        // Traitement partagé (moderation_lib) : publication + promotion
        // eventuelle de l'auteur en contributeur de confiance.
        approve_contribution($db, $id);
        $msg = ['type'=>'ok','text'=>"Contribution #{$id} approuvée et ajoutée aux lounges."];
    } elseif ($id && $action === 'review_publish') {
        set_review_status($db, $id, 'published');
        $msg = ['type'=>'ok','text'=>"Avis #{$id} rétabli."];
    } elseif ($id && $action === 'review_remove') {
        set_review_status($db, $id, 'removed');
        $msg = ['type'=>'warn','text'=>"Avis #{$id} retiré et exclu de la note."];
    } elseif ($id && $action === 'forum_publish') {
        forum_moderer($db, $id, 'publier', (int)(current_user($db)['id'] ?? 0));
        $msg = ['type'=>'ok','text'=>"Message #{$id} rétabli."];
    } elseif ($id && $action === 'forum_remove') {
        forum_moderer($db, $id, 'retirer', (int)(current_user($db)['id'] ?? 0));
        $msg = ['type'=>'warn','text'=>"Message #{$id} retiré."];
    } elseif ($id && ($action === 'forum_lock' || $action === 'forum_unlock')) {
        $db->prepare("UPDATE forum_topics SET status = ? WHERE id = ? AND status <> 'removed'")
           ->execute([$action === 'forum_lock' ? 'locked' : 'open', $id]);
        $msg = ['type'=>'ok','text'=>"Sujet #{$id} " . ($action === 'forum_lock' ? 'fermé' : 'rouvert') . "."];
    } elseif ($id && $action === 'reject') {
        // Traitement partagé avec api.php, et journalisé : un rejet est
        // la décision la plus contestable de toutes.
        reject_contribution($db, $id);
        $msg = ['type'=>'warn','text'=>"Contribution #{$id} rejetée."];
    } elseif ($id && $action === 'role_set') {
        $msg = changer_role($db, $id, (string)($_POST['role'] ?? ''));
    } elseif ($id && ($action === 'sugg_traite' || $action === 'sugg_rouvrir')) {
        // Une remarque LUE n'est pas une remarque TRAITÉE. Deux états
        // valent mieux qu'une pile qu'on relit sans fin, et le retour en
        // arrière évite de perdre ce qu'on a classé trop vite.
        $db->prepare('UPDATE suggestions SET traite = ? WHERE id = ?')
           ->execute([$action === 'sugg_traite' ? 1 : 0, $id]);
        $msg = ['type' => 'ok', 'text' => "Suggestion #{$id} "
              . ($action === 'sugg_traite' ? 'classée comme traitée.' : 'rouverte.')];
    } elseif ($id && $action === 'sugg_supprimer') {
        $db->prepare('DELETE FROM suggestions WHERE id = ?')->execute([$id]);
        journaliser($db, 'suggestion_supprimer', 'suggestion', $id);
        $msg = ['type' => 'warn', 'text' => "Suggestion #{$id} supprimée."];
    }
}

// Données
$tab  = $_GET['tab'] ?? 'dashboard';

// Un onglet fermé à la portée ne renvoie pas une page vide : il ramène
// au tableau de bord en DISANT pourquoi. Un refus muet se lit comme une
// panne, et c'est ainsi qu'on finit par distribuer la clé.
if (isset($DOMAINE_ONGLET[$tab]) && !portee_autorise($scope, $DOMAINE_ONGLET[$tab])) {
    $msg = ['type' => 'warn',
            'text' => 'Réservé à l’administration : ' . PORTEE_ADMIN_SEULEMENT[$DOMAINE_ONGLET[$tab]] . '.'];
    $tab = 'dashboard';
}

$filter_status = in_array($tab, ['pending','approved','rejected','all']) ? $tab : 'pending';

$where_contrib = match($filter_status) {
    'pending'  => "WHERE status='pending'",
    'approved' => "WHERE status='approved'",
    'rejected' => "WHERE status='rejected'",
    default    => ''
};

if (in_array($tab, ['pending','approved','rejected','all'])) {
    $rows = $db->query("SELECT *, (votes_up-votes_down) AS score FROM contributions $where_contrib ORDER BY score DESC, created_at DESC LIMIT 200")->fetchAll();
} else {
    $rows = [];
}

$stats_raw = $db->query("SELECT status, COUNT(*) AS n FROM contributions GROUP BY status")->fetchAll();
$stats     = array_column($stats_raw, 'n', 'status');
$total_lounges = (int)$db->query("SELECT COUNT(*) FROM lounges WHERE is_verified=1")->fetchColumn();
$total_photos  = 0;
try { $total_photos = (int)$db->query("SELECT COUNT(*) FROM lounge_photos WHERE is_approved=1")->fetchColumn(); } catch(Exception $e){}
$total_countries = (int)$db->query("SELECT COUNT(DISTINCT country_id) FROM lounges WHERE is_verified=1")->fetchColumn();

// Avis (moderation) — signales en tete
$reviews_rows  = [];
$flagged_count = 0;
try {
    $flagged_count = (int)$db->query("SELECT COUNT(*) FROM reviews WHERE status='flagged'")->fetchColumn();
} catch (Throwable $e) {}
if ($tab === 'reviews') {
    try {
        $reviews_rows = $db->query(
            "SELECT r.id, r.rating, r.title, r.body, r.status, r.created_at,
                    u.display_name, l.name AS lounge_name, l.country_id,
                    (SELECT COUNT(*) FROM review_flags f WHERE f.review_id = r.id) AS flags
             FROM reviews r
             JOIN users u ON u.id = r.user_id
             LEFT JOIN lounges l ON l.id = r.lounge_id
             ORDER BY (r.status = 'flagged') DESC, flags DESC, r.updated_at DESC
             LIMIT 200"
        )->fetchAll();
    } catch (Throwable $e) { $reviews_rows = []; }
}

// Communaute — messages signales en tete. Meme mecanique que les avis :
// c'est forum_moderer() qui decide, ici comme dans forum.php.
$forum_rows    = [];
$forum_flagged = 0;
try {
    $forum_flagged = (int)$db->query(
        "SELECT COUNT(DISTINCT f.post_id) FROM forum_flags f WHERE f.resolved_at IS NULL"
    )->fetchColumn();
} catch (Throwable $e) {}
if ($tab === 'forum') {
    try {
        $forum_rows = $db->query(
            "SELECT p.id, p.body, p.status, p.created_at,
                    t.id AS topic_id, t.title AS topic_title, t.status AS topic_status,
                    s.slug AS section, u.display_name,
                    (SELECT COUNT(*) FROM forum_flags f
                      WHERE f.post_id = p.id AND f.resolved_at IS NULL) AS flags
             FROM forum_posts p
             JOIN forum_topics t ON t.id = p.topic_id
             JOIN forum_sections s ON s.id = t.section_id
             LEFT JOIN users u ON u.id = p.user_id
             ORDER BY flags DESC, (p.status = 'flagged') DESC, p.created_at DESC
             LIMIT 200"
        )->fetchAll();
    } catch (Throwable $e) { $forum_rows = []; }
}

// Langues — l'état du réglage, et de quoi le décider : ce que
// fermer une langue rendrait invisible. Les comptes gardent leur
// préférence, les messages leur code ; rien n'est perdu, mais un
// lecteur peut l'être.
$lang_actives = langues_actives();
$lang_stats   = ['users' => [], 'topics' => []];
if ($tab === 'langues') {
    try {
        foreach ($db->query("SELECT lang, COUNT(*) n FROM users GROUP BY lang")->fetchAll() as $r) {
            $lang_stats['users'][(string)$r['lang']] = (int)$r['n'];
        }
        foreach ($db->query("SELECT lang, COUNT(*) n FROM forum_topics
                             WHERE status <> 'removed' GROUP BY lang")->fetchAll() as $r) {
            $lang_stats['topics'][(string)$r['lang']] = (int)$r['n'];
        }
    } catch (Throwable $e) {}
}

// ── La vie du site ───────────────────────────────────────
// Combien de monde, et depuis quand. Tout se lit dans des colonnes qui
// existent déjà — `users.created_at`, `email_verified`, `last_login_at`.
// AUCUNE ÉCRITURE NOUVELLE, aucun suivi de présence : compter les
// visiteurs « en ligne » supposerait d'écrire en base à chaque requête,
// ce qui coûte cher pour un chiffre qu'on regarde une fois par semaine.
// Les actifs sur sept jours en disent davantage, et ne coûtent rien.
//
// `verifies_en_attente` n'est pas décoratif : un compte qui reste non
// vérifié plus de 24 h est le symptôme d'un email de confirmation qui
// n'arrive pas — la panne exacte qui a laissé un membre inerte sans que
// rien ne le signale.
$vie = ['membres' => 0, 'verifies' => 0, 'attente' => 0, 'semaine' => 0,
        'actifs_7j' => 0, 'avis' => 0, 'messages' => 0];
try {
    $vie = array_merge($vie, (array)$db->query(
        "SELECT COUNT(*) AS membres,
                SUM(email_verified = 1) AS verifies,
                SUM(email_verified = 0 AND created_at < NOW() - INTERVAL 1 DAY) AS attente,
                SUM(created_at > NOW() - INTERVAL 7 DAY) AS semaine,
                SUM(last_login_at > NOW() - INTERVAL 7 DAY) AS actifs_7j
           FROM users"
    )->fetch(PDO::FETCH_ASSOC));
    $vie['avis']     = (int)$db->query("SELECT COUNT(*) FROM reviews WHERE status <> 'removed'")->fetchColumn();
    $vie['messages'] = (int)$db->query("SELECT COUNT(*) FROM forum_posts WHERE status = 'published'")->fetchColumn();
} catch (Throwable $e) {}
$vie = array_map('intval', $vie);

// Membres — les comptes et leurs rôles (portée « admin » uniquement,
// l'onglet a déjà été refusé plus haut à la modération).
$membres_rows = [];
if ($tab === 'membres') {
    try {
        $membres_rows = $db->query(
            "SELECT u.id, u.display_name, u.email, u.role, u.status, u.lang,
                    u.email_verified, u.created_at, u.last_login_at, u.password_hash,
                    (SELECT COUNT(*) FROM contributions c
                      WHERE c.user_id = u.id AND c.status = 'approved') AS contribs,
                    (SELECT COUNT(*) FROM forum_posts p
                      WHERE p.user_id = u.id AND p.status = 'published') AS messages
             FROM users u
             ORDER BY FIELD(u.role,'admin','moderator','trusted','member'), u.created_at
             LIMIT 500"
        )->fetchAll();
    } catch (Throwable $e) { $membres_rows = []; }
}

// Suggestions — les remarques envoyées sans compte. Ouvertes aux deux
// portées : lire ce que disent les visiteurs relève de la modération
// autant que de l'administration.
$sugg_rows = [];
$sugg_neuves = 0;
try {
    $sugg_neuves = (int)$db->query("SELECT COUNT(*) FROM suggestions WHERE traite = 0")->fetchColumn();
} catch (Throwable $e) {}
// ── Adresses : ce qui manque, et par où commencer ────────
// Le tri par NOMBRE d'adresses n'est pas un détail d'affichage : une
// page de pays qui porte vingt-quatre fiches complètes vaut mieux que
// vingt-quatre pays qui en portent une. On finit un pays avant le
// suivant. Voir backend/completude_lib.php pour le barème.
$adr_rows = []; $adr_pays = []; $adr_global = null; $adr_sel = null;
if ($tab === 'adresses') {
    require_once __DIR__ . '/completude_lib.php';
    try {
        $adr_global = completude_globale($db);
        $adr_pays   = completude_par_pays($db);
        $adr_sel    = trim((string)($_GET['pays'] ?? ''));
        if ($adr_sel === '' || !isset($adr_pays[$adr_sel])) {
            $adr_sel = $adr_pays ? array_key_first($adr_pays) : null;
        }
        if ($adr_sel !== null) $adr_rows = completude_fiches($db, $adr_sel);
    } catch (Throwable $e) { $adr_rows = []; }
}

if ($tab === 'suggestions') {
    try {
        // Le membre est joint quand il y en a un. `LEFT JOIN` et non
        // `JOIN` : les remarques envoyées sous l'ancien régime — sans
        // compte — restent, et disparaîtraient d'une jointure stricte.
        $sugg_rows = $db->query(
            "SELECT s.*, u.display_name AS auteur, u.email AS auteur_email
               FROM suggestions s
          LEFT JOIN users u ON u.id = s.user_id
           ORDER BY s.traite ASC, s.created_at DESC LIMIT 200"
        )->fetchAll();
    } catch (Throwable $e) { $sugg_rows = []; }   // migration 132 non jouée
}

// Journal — lisible par les DEUX portées, délibérément. Un journal que
// le modérateur ne verrait pas serait une surveillance ; celui-ci est un
// registre, et il vaut mieux qu'il sache qu'il est tenu.
$journal_rows = [];
$journal_n    = 0;
if ($tab === 'journal') {
    try {
        $journal_rows = $db->query(
            "SELECT * FROM moderation_log ORDER BY created_at DESC, id DESC LIMIT 200"
        )->fetchAll();
        $journal_n = (int)$db->query("SELECT COUNT(*) FROM moderation_log")->fetchColumn();
    } catch (Throwable $e) { $journal_rows = []; }   // migration 130 non jouée
}

// Photos
$photos_data       = [];
$photos_lounges    = [];
$selected_lounge_id = (int)($_GET['lounge_id'] ?? 0);
$photo_search      = trim($_GET['search'] ?? '');

if ($tab === 'photos') {
    // Recherche lounges — utilise ? au lieu de :q répété (plus compatible PDO)
    if ($photo_search) {
        $q    = '%' . $photo_search . '%';
        $stmt = $db->prepare(
            "SELECT id, country_id, name, city FROM lounges
              WHERE is_verified=1
                AND (name LIKE ? OR city LIKE ? OR country_id LIKE ?)
              ORDER BY country_id, name LIMIT 100"
        );
        $stmt->execute([$q, $q, $q]);
    } else {
        $stmt = $db->prepare(
            "SELECT id, country_id, name, city FROM lounges
              WHERE is_verified=1
              ORDER BY country_id, name LIMIT 100"
        );
        $stmt->execute();
    }
    $photos_lounges = $stmt->fetchAll();

    // Réinitialiser la sélection si le lounge n'est pas dans les résultats filtrés
    if ($selected_lounge_id && $photo_search) {
        $ids_visible = array_column($photos_lounges, 'id');
        if (!in_array((string)$selected_lounge_id, $ids_visible)
         && !in_array($selected_lounge_id, $ids_visible)) {
            $selected_lounge_id = 0;  // désélectionner si hors résultats
        }
    }

    // Charger les photos du lounge sélectionné
    if ($selected_lounge_id) {
        try {
            $stmt2 = $db->prepare(
                "SELECT * FROM lounge_photos
                  WHERE lounge_id = ?
                  ORDER BY is_primary DESC, sort_order ASC"
            );
            $stmt2->execute([$selected_lounge_id]);
            $photos_data = $stmt2->fetchAll();
        } catch (Exception $e) {
            $photos_data = [];  // table absente ou erreur → ne pas crasher
        }
    }
}

// Lounges récents pour dashboard
$recent_lounges = $db->query("SELECT name, city, country_id, created_at FROM lounges WHERE is_verified=1 ORDER BY created_at DESC LIMIT 8")->fetchAll();
?><!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>CigarOdyssey — Administration</title>
<link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600;700&family=DM+Mono:wght@300;400&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet">
<style>
/* ══════════════════════════════════════════════════════
   RESET & BASE
══════════════════════════════════════════════════════ */
*{box-sizing:border-box;margin:0;padding:0}
:root,[data-theme="dark"]{
  --bg0:#080503;--bg1:#0E0A06;--bg2:#15100A;--bg3:#1C160E;--bg4:#241C12;
  --border:rgba(201,162,39,.12);--border-hover:rgba(201,162,39,.35);
  --gold:#C9A227;--gold-l:#E8C040;--gold-dim:rgba(201,162,39,.15);
  --text:#E8D5A0;--text2:#9A8060;--text3:#5A4830;
  --green:#4A9B5A;--green-bg:rgba(74,155,90,.1);--green-border:rgba(74,155,90,.25);
  --amber:#C97A27;--amber-bg:rgba(201,122,39,.1);--amber-border:rgba(201,122,39,.25);
  --red:#9B4A4A;--red-bg:rgba(155,74,74,.1);--red-border:rgba(155,74,74,.25);
  --sidebar:220px;--header:56px;
}
/* ── LIGHT ── */
[data-theme="light"]{
  --bg0:#F5F0E8;--bg1:#FDFAF4;--bg2:#FFFFFF;--bg3:#F0EBE0;--bg4:#E8E0D0;
  --border:rgba(139,100,0,.14);--border-hover:rgba(139,100,0,.4);
  --gold:#7A5800;--gold-l:#A07800;--gold-dim:rgba(139,100,0,.1);
  --text:#2A1F10;--text2:#6B5530;--text3:#A08858;
  --green:#2E6B38;--green-bg:rgba(46,107,56,.08);--green-border:rgba(46,107,56,.2);
  --amber:#8B5010;--amber-bg:rgba(139,80,16,.08);--amber-border:rgba(139,80,16,.2);
  --red:#6B2020;--red-bg:rgba(107,32,32,.08);--red-border:rgba(107,32,32,.2);
}
/* ── MIDNIGHT ── */
[data-theme="midnight"]{
  --bg0:#02040C;--bg1:#050810;--bg2:#080D18;--bg3:#0C1220;--bg4:#101828;
  --border:rgba(80,130,255,.12);--border-hover:rgba(80,130,255,.35);
  --gold:#6080E8;--gold-l:#88A0FF;--gold-dim:rgba(80,120,240,.15);
  --text:#C8D8F8;--text2:#6878A8;--text3:#3848A0;
  --green:#3A7A9B;--green-bg:rgba(58,122,155,.1);--green-border:rgba(58,122,155,.25);
  --amber:#5070D0;--amber-bg:rgba(80,112,208,.1);--amber-border:rgba(80,112,208,.25);
  --red:#7A4A8A;--red-bg:rgba(122,74,138,.1);--red-border:rgba(122,74,138,.25);
}
/* ── EMERALD ── */
[data-theme="emerald"]{
  --bg0:#020A04;--bg1:#050F07;--bg2:#08150A;--bg3:#0C1C0E;--bg4:#102414;
  --border:rgba(60,180,80,.12);--border-hover:rgba(60,180,80,.35);
  --gold:#C9A227;--gold-l:#E8C040;--gold-dim:rgba(201,162,39,.15);
  --text:#D8F0DC;--text2:#5A9868;--text3:#2A5835;
  --green:#3A9B5A;--green-bg:rgba(58,155,90,.1);--green-border:rgba(58,155,90,.25);
  --amber:#C97A27;--amber-bg:rgba(201,122,39,.1);--amber-border:rgba(201,122,39,.25);
  --red:#8B3A3A;--red-bg:rgba(139,58,58,.1);--red-border:rgba(139,58,58,.25);
}
/* ── BORDEAUX ── */
[data-theme="bordeaux"]{
  --bg0:#080205;--bg1:#0E0508;--bg2:#15080C;--bg3:#1C0C12;--bg4:#241018;
  --border:rgba(180,60,80,.12);--border-hover:rgba(180,60,80,.35);
  --gold:#D4A040;--gold-l:#F0C060;--gold-dim:rgba(212,160,64,.15);
  --text:#F0D0D8;--text2:#A06070;--text3:#603040;
  --green:#5A8A4A;--green-bg:rgba(90,138,74,.1);--green-border:rgba(90,138,74,.25);
  --amber:#C06030;--amber-bg:rgba(192,96,48,.1);--amber-border:rgba(192,96,48,.25);
  --red:#A04050;--red-bg:rgba(160,64,80,.1);--red-border:rgba(160,64,80,.25);
}
html,body{height:100%;overflow:hidden}
body{background:var(--bg0);color:var(--text);font-family:'DM Sans',sans-serif;font-size:13px;line-height:1.5}

/* ══════════════════════════════════════════════════════
   LAYOUT
══════════════════════════════════════════════════════ */
.layout{display:grid;grid-template-columns:var(--sidebar) 1fr;grid-template-rows:var(--header) 1fr;height:100vh;overflow:hidden}

/* ══════════════════════════════════════════════════════
   HEADER
══════════════════════════════════════════════════════ */
.header{
  grid-column:1/-1;
  display:flex;align-items:center;gap:16px;
  padding:0 20px 0 0;
  background:var(--bg1);
  border-bottom:1px solid var(--border);
  position:relative;z-index:20;
}
.header-brand{
  width:var(--sidebar);padding:0 20px;
  display:flex;align-items:center;gap:10px;
  border-right:1px solid var(--border);height:100%;flex-shrink:0;
}
.header-brand .logo{font-size:22px}
.header-brand .name{font-family:'Cinzel',serif;font-size:12px;color:var(--gold);letter-spacing:.2em}
.header-brand .sub{font-size:9px;color:var(--text3);letter-spacing:.15em;text-transform:uppercase}
.header-stats{display:flex;gap:1px;margin-left:4px}
.hstat{padding:6px 16px;border-right:1px solid var(--border);text-align:center}
.hstat-n{font-family:'Cinzel',serif;font-size:16px;color:var(--gold);font-weight:600}
.hstat-l{font-size:9px;color:var(--text3);letter-spacing:.1em;text-transform:uppercase;margin-top:1px}
.header-right{margin-left:auto;display:flex;align-items:center;gap:10px}
.btn-export{padding:7px 16px;background:var(--gold-dim);border:1px solid var(--border-hover);border-radius:5px;color:var(--gold);font-size:11px;font-family:'Cinzel',serif;letter-spacing:.1em;text-decoration:none;transition:.2s;white-space:nowrap}
.btn-export:hover{background:var(--gold);color:var(--bg0)}
.admin-badge{font-size:10px;color:var(--text3);letter-spacing:.08em}

/* ══════════════════════════════════════════════════════
   SIDEBAR
══════════════════════════════════════════════════════ */
.sidebar{
  background:var(--bg1);
  border-right:1px solid var(--border);
  padding:12px 0;
  overflow-y:auto;
  display:flex;flex-direction:column;gap:2px;
}
.sidebar::-webkit-scrollbar{width:4px}
.sidebar::-webkit-scrollbar-track{background:transparent}
.sidebar::-webkit-scrollbar-thumb{background:var(--bg4);border-radius:2px}

.nav-section{padding:16px 16px 6px;font-size:9px;letter-spacing:.2em;color:var(--text3);text-transform:uppercase;font-family:'DM Mono',monospace}
.nav-item{
  display:flex;align-items:center;gap:10px;
  padding:9px 16px;margin:0 8px;
  border-radius:6px;cursor:pointer;
  text-decoration:none;color:var(--text2);
  font-size:12px;transition:.15s;
  border:1px solid transparent;
}
.nav-item:hover{color:var(--text);background:var(--bg3)}
.nav-item.active{color:var(--gold);background:var(--gold-dim);border-color:var(--border)}
.nav-item .ni-icon{font-size:15px;flex-shrink:0;width:20px;text-align:center}
.nav-item .ni-label{flex:1}
.nav-badge{
  min-width:18px;height:18px;border-radius:9px;
  font-size:10px;font-weight:700;padding:0 6px;
  display:flex;align-items:center;justify-content:center;
}
.nb-amber{background:var(--amber-bg);color:var(--amber);border:1px solid var(--amber-border)}
.nb-green{background:var(--green-bg);color:var(--green);border:1px solid var(--green-border)}
.nb-red{background:var(--red-bg);color:var(--red);border:1px solid var(--red-border)}
.nb-dim{background:var(--bg4);color:var(--text3)}

.sidebar-footer{margin-top:auto;padding:12px 16px;border-top:1px solid var(--border)}
.sf-key{font-size:9px;color:var(--text3);letter-spacing:.08em;font-family:'DM Mono',monospace;word-break:break-all}

/* ══════════════════════════════════════════════════════
   MAIN CONTENT
══════════════════════════════════════════════════════ */
.main{overflow:hidden;background:var(--bg0);display:flex;flex-direction:column}
.main::-webkit-scrollbar{width:6px}
.main::-webkit-scrollbar-track{background:transparent}
.main::-webkit-scrollbar-thumb{background:var(--bg3);border-radius:3px}

.page-header{
  padding:20px 24px 16px;
  border-bottom:1px solid var(--border);
  display:flex;align-items:center;gap:12px;
  background:var(--bg1);position:sticky;top:0;z-index:10;
}
.page-title{font-family:'Cinzel',serif;font-size:15px;color:var(--text);flex:1}
.page-subtitle{font-size:11px;color:var(--text3);margin-top:2px}

/* Notification flash */
.flash{
  margin:0;padding:12px 24px;
  font-size:12px;display:flex;align-items:center;gap:8px;
  border-bottom:1px solid var(--border);
}
.flash.ok{background:var(--green-bg);color:#6DBB7A;border-left:3px solid var(--green)}
.flash.warn{background:var(--amber-bg);color:#E8A060;border-left:3px solid var(--amber)}
.flash.err{background:var(--red-bg);color:#CF7070;border-left:3px solid var(--red)}

/* ══════════════════════════════════════════════════════
   DASHBOARD
══════════════════════════════════════════════════════ */
.dashboard{padding:24px}
.kpi-grid{display:grid;grid-template-columns:repeat(4,1fr);gap:12px;margin-bottom:24px}
.kpi{
  background:var(--bg2);border:1px solid var(--border);
  border-radius:8px;padding:18px 20px;
  display:flex;flex-direction:column;gap:4px;
  transition:border-color .2s;
}
.kpi:hover{border-color:var(--border-hover)}
.kpi-label{font-size:9px;letter-spacing:.2em;text-transform:uppercase;color:var(--text3);font-family:'DM Mono',monospace}
.kpi-value{font-family:'Cinzel',serif;font-size:28px;font-weight:600;color:var(--gold);line-height:1}
.kpi-sub{font-size:10px;color:var(--text3)}
.kpi-accent{border-left:3px solid var(--amber)}
.kpi-green{border-left:3px solid var(--green)}

.dash-grid{display:grid;grid-template-columns:1fr 1fr;gap:16px}
.dash-card{background:var(--bg2);border:1px solid var(--border);border-radius:8px;overflow:hidden}
.dash-card-head{padding:14px 18px;border-bottom:1px solid var(--border);display:flex;align-items:center;gap:8px}
.dash-card-title{font-family:'Cinzel',serif;font-size:11px;letter-spacing:.15em;color:var(--text2)}
.dash-card-count{margin-left:auto;font-size:10px;color:var(--text3);font-family:'DM Mono',monospace}
.dash-card-body{padding:8px 0}

.pending-row{padding:10px 18px;display:flex;align-items:center;gap:10px;border-bottom:1px solid var(--border);transition:.12s}
.pending-row:last-child{border-bottom:none}
.pending-row:hover{background:var(--bg3)}
.pr-score{width:28px;height:28px;border-radius:6px;display:flex;align-items:center;justify-content:center;font-size:11px;font-weight:700;flex-shrink:0}
.pr-info{flex:1;min-width:0}
.pr-name{font-size:12px;color:var(--text);font-weight:500;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}
.pr-meta{font-size:10px;color:var(--text3);margin-top:1px}
.pr-actions{display:flex;gap:4px;flex-shrink:0}

.recent-row{padding:9px 18px;display:flex;align-items:center;gap:10px;border-bottom:1px solid var(--border)}
.recent-row:last-child{border-bottom:none}
.recent-flag{font-size:16px;flex-shrink:0}
.recent-info{flex:1;min-width:0}
.recent-name{font-size:12px;color:var(--text);white-space:nowrap;overflow:hidden;text-overflow:ellipsis}
.recent-meta{font-size:10px;color:var(--text3)}
.recent-date{font-size:10px;color:var(--text3);font-family:'DM Mono',monospace;flex-shrink:0}

/* ══════════════════════════════════════════════════════
   CONTRIBUTIONS TABLE
══════════════════════════════════════════════════════ */
.contrib-wrap{padding:0}
.contrib-filters{padding:12px 24px;border-bottom:1px solid var(--border);display:flex;align-items:center;gap:10px;background:var(--bg1)}
.filter-info{font-size:11px;color:var(--text3);margin-left:auto;font-family:'DM Mono',monospace}

.table-scroll{overflow-x:auto;overflow-y:auto;flex:1;min-height:0}
.contrib-table{width:100%;border-collapse:collapse;min-width:800px}
.contrib-table thead tr{background:var(--bg2);position:sticky;top:0;z-index:5}
.contrib-table th{padding:10px 16px;text-align:left;font-size:9px;letter-spacing:.2em;text-transform:uppercase;color:var(--text3);font-family:'DM Mono',monospace;border-bottom:1px solid var(--border);white-space:nowrap;font-weight:400}
.contrib-table td{padding:12px 16px;border-bottom:1px solid var(--border);vertical-align:top}
.contrib-table tbody tr{transition:.1s}
.contrib-table tbody tr:hover td{background:var(--bg2)}
.contrib-table tbody tr:last-child td{border-bottom:none}

.ct-name{font-size:13px;color:var(--text);font-weight:500;margin-bottom:2px}
.ct-city{font-size:11px;color:var(--text3)}
.ct-type{display:inline-block;padding:2px 8px;border-radius:10px;font-size:9px;letter-spacing:.06em;background:var(--bg4);color:var(--text2);margin-top:4px;border:1px solid var(--border)}
.ct-desc{font-size:11px;color:var(--text3);line-height:1.5;max-width:300px;margin-top:4px}
.ct-src a{font-size:10px;color:var(--gold);text-decoration:none}
.ct-src a:hover{text-decoration:underline}
.ct-ip{font-size:10px;color:var(--text3);margin-top:2px;font-family:'DM Mono',monospace}

.score-pill{display:inline-flex;align-items:center;gap:5px;padding:4px 8px;border-radius:10px;font-size:11px;font-weight:700}
.sp-pos{background:var(--green-bg);color:var(--green);border:1px solid var(--green-border)}
.sp-neg{background:var(--red-bg);color:var(--red);border:1px solid var(--red-border)}
.sp-neu{background:var(--bg4);color:var(--text3);border:1px solid var(--border)}

.status-pill{padding:3px 10px;border-radius:10px;font-size:9px;letter-spacing:.08em;font-weight:700;text-transform:uppercase}
.stp-pending{background:var(--amber-bg);color:var(--amber);border:1px solid var(--amber-border)}
.stp-approved{background:var(--green-bg);color:var(--green);border:1px solid var(--green-border)}
.stp-rejected{background:var(--red-bg);color:var(--red);border:1px solid var(--red-border)}

.action-btn{
  padding:5px 12px;border-radius:5px;font-size:11px;cursor:pointer;
  font-family:'DM Sans',sans-serif;transition:.15s;border:1px solid;
  white-space:nowrap;
}
.ab-approve{background:var(--green-bg);color:var(--green);border-color:var(--green-border)}
.ab-approve:hover{background:var(--green);color:#0E0A06}
.ab-reject{background:var(--red-bg);color:var(--red);border-color:var(--red-border)}
.ab-reject:hover{background:var(--red);color:#E8D5A0}
.action-row{display:flex;gap:5px;flex-wrap:wrap}

.empty-state{padding:80px;text-align:center;color:var(--text3)}
.empty-icon{font-size:48px;margin-bottom:12px;opacity:.4}
.empty-text{font-family:'Cinzel',serif;font-size:12px;letter-spacing:.15em}

/* ══════════════════════════════════════════════════════
   PHOTOS TAB
══════════════════════════════════════════════════════ */
.photos-layout{display:grid;grid-template-columns:280px 1fr;height:calc(100vh - var(--header));overflow:hidden}
.photos-sidebar{background:var(--bg1);border-right:1px solid var(--border);overflow-y:auto;display:flex;flex-direction:column}
.photos-sidebar::-webkit-scrollbar{width:4px}
.photos-sidebar::-webkit-scrollbar-thumb{background:var(--bg4);border-radius:2px}

.ps-search{padding:12px;border-bottom:1px solid var(--border);position:sticky;top:0;background:var(--bg1);z-index:2}
.ps-search input{
  width:100%;padding:8px 12px;
  background:var(--bg0);border:1px solid var(--border);
  border-radius:6px;color:var(--text);font-size:12px;outline:none;
  transition:border-color .2s;
}
.ps-search input:focus{border-color:var(--gold)}
.ps-search input::placeholder{color:var(--text3)}

.lounge-item{
  padding:10px 16px;border-bottom:1px solid rgba(201,162,39,.06);
  cursor:pointer;text-decoration:none;display:block;
  transition:.12s;border-left:3px solid transparent;
}
.lounge-item:hover{background:var(--bg3);border-left-color:rgba(201,162,39,.3)}
.lounge-item.active{background:var(--gold-dim);border-left-color:var(--gold)}
.li-name{font-size:12px;color:var(--text);font-weight:500}
.li-meta{font-size:10px;color:var(--text3);margin-top:2px;font-family:'DM Mono',monospace}
.li-count{float:right;font-size:10px;color:var(--gold);font-family:'DM Mono',monospace}

.photos-main{overflow-y:auto;padding:24px;background:var(--bg0)}
.photos-main::-webkit-scrollbar{width:6px}
.photos-main::-webkit-scrollbar-thumb{background:var(--bg3);border-radius:3px}

.pm-header{display:flex;align-items:center;gap:12px;margin-bottom:20px}
.pm-title{font-family:'Cinzel',serif;font-size:14px;color:var(--text)}
.pm-meta{font-size:11px;color:var(--text3)}
.pm-quota{padding:4px 12px;border-radius:10px;font-size:11px;border:1px solid var(--border);color:var(--text3);font-family:'DM Mono',monospace;margin-left:auto}
.pm-quota.full{border-color:var(--red-border);color:var(--red)}

/* Upload zone */
.upload-zone{
  border:2px dashed var(--border);border-radius:8px;
  padding:28px;text-align:center;cursor:pointer;
  transition:.2s;position:relative;margin-bottom:16px;
  background:var(--bg1);
}
.upload-zone input[type=file]{position:absolute;inset:0;opacity:0;cursor:pointer;width:100%;height:100%}
.upload-zone:hover,.upload-zone.drag-over{border-color:var(--gold);background:var(--gold-dim)}
.uz-icon{font-size:28px;margin-bottom:8px;opacity:.6}
.uz-text{color:var(--text3);font-size:12px;line-height:1.7}
.uz-text strong{color:var(--gold)}

.upload-form{background:var(--bg2);border:1px solid var(--border);border-radius:8px;padding:16px;margin-bottom:20px;display:none;flex-direction:column;gap:10px}
.uf-file-info{display:flex;align-items:center;gap:8px;padding:8px 12px;background:var(--bg3);border-radius:5px;font-size:11px;color:var(--text2)}
.uf-file-icon{font-size:18px}
.uf-preview{width:60px;height:40px;object-fit:cover;border-radius:4px;flex-shrink:0}
.uf-input{
  width:100%;padding:9px 12px;background:var(--bg0);border:1px solid var(--border);
  border-radius:5px;color:var(--text);font-size:12px;font-family:'DM Sans',sans-serif;outline:none;
}
.uf-input:focus{border-color:var(--gold)}
.uf-check{display:flex;align-items:center;gap:8px;font-size:12px;color:var(--text2);cursor:pointer}
.uf-check input{accent-color:var(--gold);width:14px;height:14px;cursor:pointer}
.uf-actions{display:flex;gap:8px;align-items:center}
.btn-primary{padding:8px 20px;background:var(--gold);border:none;border-radius:5px;color:var(--bg0);font-size:12px;font-family:'Cinzel',serif;letter-spacing:.1em;cursor:pointer;transition:.2s}
.btn-primary:hover{background:var(--gold-l)}
.btn-primary:disabled{opacity:.4;cursor:default}
.btn-ghost{padding:8px 14px;background:transparent;border:1px solid var(--border);border-radius:5px;color:var(--text2);font-size:12px;cursor:pointer;transition:.2s}
.btn-ghost:hover{border-color:var(--border-hover);color:var(--text)}
.upload-status{font-size:11px;color:var(--text3);font-family:'DM Mono',monospace}
.progress-track{height:3px;background:var(--bg4);border-radius:2px;overflow:hidden;display:none;margin-top:4px}
.progress-fill{height:100%;background:var(--gold);border-radius:2px;transition:width .3s;width:0%}

/* Photos grid */
.photos-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(160px,1fr));gap:10px}
.photo-card{background:var(--bg2);border:1px solid var(--border);border-radius:8px;overflow:hidden;transition:.15s;position:relative}
.photo-card:hover{border-color:var(--border-hover);transform:translateY(-1px)}
.photo-card.primary{border-color:var(--gold);box-shadow:0 0 0 1px rgba(201,162,39,.3)}
.pc-badge{position:absolute;top:6px;left:6px;background:var(--gold);color:var(--bg0);font-size:8px;padding:2px 7px;border-radius:8px;font-weight:700;letter-spacing:.08em;z-index:1}
.pc-pending-badge{position:absolute;top:6px;right:6px;background:var(--amber-bg);color:var(--amber);border:1px solid var(--amber-border);font-size:8px;padding:2px 6px;border-radius:6px}
.pc-thumb{width:100%;aspect-ratio:3/2;object-fit:cover;display:block;cursor:zoom-in}
.pc-body{padding:8px 10px}
.pc-caption{font-size:11px;color:var(--text2);white-space:nowrap;overflow:hidden;text-overflow:ellipsis}
.pc-date{font-size:9px;color:var(--text3);margin-top:2px;font-family:'DM Mono',monospace}
.pc-actions{display:flex;gap:4px;padding:6px 8px;border-top:1px solid var(--border)}
.pca-btn{flex:1;padding:5px 4px;border:1px solid var(--border);border-radius:4px;background:transparent;color:var(--text3);font-size:10px;cursor:pointer;text-align:center;transition:.15s}
.pca-btn:hover{border-color:var(--gold);color:var(--gold)}
.pca-del:hover{border-color:var(--red-border)!important;color:var(--red)!important}

.no-selection{display:flex;flex-direction:column;align-items:center;justify-content:center;height:100%;min-height:400px;text-align:center;color:var(--text3)}
.ns-icon{font-size:56px;opacity:.2;margin-bottom:16px}
.ns-text{font-family:'Cinzel',serif;font-size:12px;letter-spacing:.15em;margin-bottom:6px}
.ns-sub{font-size:11px;opacity:.6}

.no-photos{text-align:center;padding:40px;color:var(--text3)}
.np-icon{font-size:36px;opacity:.3;margin-bottom:10px}
.np-text{font-size:11px;letter-spacing:.1em}

/* ══════════════════════════════════════════════════════
   MISC
══════════════════════════════════════════════════════ */
.divider{height:1px;background:var(--border);margin:4px 8px}

@keyframes fadeIn{from{opacity:0;transform:translateY(4px)}to{opacity:1;transform:translateY(0)}}
.main > *{animation:fadeIn .2s ease}

/* ── Thème switcher ── */
html{transition:background .25s,color .25s}
.theme-switcher{display:flex;gap:3px;padding:6px 12px;border-left:1px solid var(--border)}
.theme-btn{
  width:22px;height:22px;border-radius:50%;border:2px solid transparent;
  cursor:pointer;transition:transform .15s,border-color .15s;
  position:relative;outline:none;
}
.theme-btn:hover{transform:scale(1.15)}
.theme-btn.active{border-color:var(--text)!important}
.theme-btn[data-t="dark"]    {background:#1C160E}
.theme-btn[data-t="light"]   {background:#F0EBE0}
.theme-btn[data-t="midnight"]{background:#080D18}
.theme-btn[data-t="emerald"] {background:#0C1C0E}
.theme-btn[data-t="bordeaux"]{background:#180810}
.theme-btn::after{content:attr(title);position:absolute;bottom:-22px;left:50%;transform:translateX(-50%);
  background:var(--bg3);color:var(--text2);font-size:9px;padding:2px 6px;border-radius:3px;
  white-space:nowrap;opacity:0;pointer-events:none;transition:opacity .15s;letter-spacing:.05em}
.theme-btn:hover::after{opacity:1}

/* ── Adresses : l'ecran de saisie ──
   Une ligne = un formulaire. On remplit, on enregistre, on passe a la
   suivante — c'est le geste qu'on repete cinquante fois, et tout le
   reste de cet ecran lui est subordonne. */
.adr-jauge{height:6px;background:var(--bg3);border-radius:3px;overflow:hidden;margin-top:5px}
.adr-jauge i{display:block;height:100%;background:var(--gold)}
.adr-champs{display:grid;grid-template-columns:repeat(6,1fr);gap:8px;margin-bottom:6px}
.adr-pays{display:flex;flex-wrap:wrap;gap:6px;margin-bottom:18px}
.adr-pays a{padding:5px 11px;border:1px solid var(--border);border-radius:14px;font-size:11px;
  color:var(--text2);text-decoration:none;white-space:nowrap}
.adr-pays a:hover{border-color:var(--gold);color:var(--gold)}
.adr-pays a.on{background:var(--gold-dim);border-color:var(--gold);color:var(--gold)}
.adr-pays a b{font-weight:400;opacity:.6;margin-left:5px}
.adr-ligne{border-bottom:1px solid var(--border);padding:13px 0}
.adr-tete{display:flex;align-items:baseline;gap:10px;margin-bottom:9px}
.adr-tete .adr-nom{font-weight:600;color:var(--text);flex:1}
.adr-note{font-family:'Cinzel',serif;font-size:11px;color:var(--gold);white-space:nowrap}
.adr-manque{font-size:10.5px;color:var(--text2)}
.adr-ligne input{width:100%;box-sizing:border-box;padding:7px 9px;font-size:12px;
  background:var(--bg3);border:1px solid var(--border);border-radius:4px;color:var(--text);outline:none}
.adr-ligne input:focus{border-color:var(--gold)}
.adr-ligne label{font-size:9px;letter-spacing:.1em;margin-bottom:3px}
.adr-ligne button{width:auto;padding:7px 16px;font-size:11px}
.adr-bilan{display:grid;grid-template-columns:repeat(auto-fit,minmax(140px,1fr));gap:10px;margin-bottom:20px}
.adr-bilan div{background:var(--bg2);border:1px solid var(--border);border-radius:6px;padding:10px 12px}
.adr-bilan b{display:block;font-family:'Cinzel',serif;font-size:17px;color:var(--gold)}
.adr-bilan span{font-size:10.5px;color:var(--text2)}
@media(max-width:900px){.adr-champs{grid-template-columns:repeat(2,1fr)}}
</style>
</head>
<body>
<div class="layout">

<!-- ══════════════════ HEADER ══════════════════════════ -->
<header class="header">
  <div class="header-brand">
    <span class="logo">🥃</span>
    <div>
      <div class="name">CIGAR ODYSSEY</div>
      <div class="sub">Administration</div>
    </div>
  </div>

  <div class="header-stats">
    <div class="hstat">
      <div class="hstat-n"><?= $total_lounges ?></div>
      <div class="hstat-l">Lounges</div>
    </div>
    <div class="hstat">
      <div class="hstat-n"><?= $total_countries ?></div>
      <div class="hstat-l">Pays</div>
    </div>
    <div class="hstat">
      <div class="hstat-n"><?= $total_photos ?></div>
      <div class="hstat-l">Photos</div>
    </div>
    <div class="hstat">
      <div class="hstat-n"><?= $vie['membres'] ?></div>
      <div class="hstat-l">Membres</div>
    </div>
    <div class="hstat">
      <div class="hstat-n"><?= (int)($stats['pending'] ?? 0) ?></div>
      <div class="hstat-l">En attente</div>
    </div>
  </div>

  <div class="header-right">
    <div class="theme-switcher" title="Changer de thème">
      <button class="theme-btn" data-t="dark"     title="Sombre"   onclick="setTheme('dark')"></button>
      <button class="theme-btn" data-t="light"    title="Clair"    onclick="setTheme('light')"></button>
      <button class="theme-btn" data-t="midnight" title="Minuit"   onclick="setTheme('midnight')"></button>
      <button class="theme-btn" data-t="emerald"  title="Emerald"  onclick="setTheme('emerald')"></button>
      <button class="theme-btn" data-t="bordeaux" title="Bordeaux" onclick="setTheme('bordeaux')"></button>
    </div>
    <?php if (portee_autorise($scope, 'export')): ?>
    <a href="api.php?action=export" class="btn-export">⬇ Exporter</a>
    <?php endif; ?>
    <span class="admin-badge" title="<?= $scope === 'admin'
          ? 'Portée complète' : 'Portée de modération : ' . implode(', ', PORTEE_ADMIN_SEULEMENT) . ' restent fermés' ?>">
      <?= $scope === 'admin' ? 'Admin' : 'Modérateur' ?><?php
      // Le nom À CÔTÉ du rôle : un journal d'audit n'a de sens que si
      // chacun sait sous quelle identité il agit au moment où il agit.
      if ($moi): ?> · <?= htmlspecialchars($moi['display_name']) ?><?php endif; ?>
    </span>
    <a href="?logout=1" class="admin-badge" style="text-decoration:none">
      <?= $moi ? 'Retour au site' : 'Déconnexion' ?></a>
  </div>
</header>

<!-- ══════════════════ SIDEBAR ═════════════════════════ -->
<nav class="sidebar">
  <div class="nav-section">Navigation</div>

  <a class="nav-item <?= $tab==='dashboard' ? 'active' : '' ?>"
     href="?tab=dashboard">
    <span class="ni-icon">◈</span>
    <span class="ni-label">Tableau de bord</span>
  </a>

  <div class="divider"></div>
  <div class="nav-section">Contributions</div>

  <a class="nav-item <?= $tab==='pending' ? 'active' : '' ?>"
     href="?tab=pending">
    <span class="ni-icon">⏳</span>
    <span class="ni-label">En attente</span>
    <?php if ($stats['pending'] ?? 0): ?>
    <span class="nav-badge nb-amber"><?= $stats['pending'] ?></span>
    <?php endif; ?>
  </a>

  <a class="nav-item <?= $tab==='approved' ? 'active' : '' ?>"
     href="?tab=approved">
    <span class="ni-icon">✓</span>
    <span class="ni-label">Approuvées</span>
    <?php if ($stats['approved'] ?? 0): ?>
    <span class="nav-badge nb-green"><?= $stats['approved'] ?></span>
    <?php endif; ?>
  </a>

  <a class="nav-item <?= $tab==='rejected' ? 'active' : '' ?>"
     href="?tab=rejected">
    <span class="ni-icon">✕</span>
    <span class="ni-label">Rejetées</span>
    <?php if ($stats['rejected'] ?? 0): ?>
    <span class="nav-badge nb-red"><?= $stats['rejected'] ?></span>
    <?php endif; ?>
  </a>

  <a class="nav-item <?= $tab==='all' ? 'active' : '' ?>"
     href="?tab=all">
    <span class="ni-icon">≡</span>
    <span class="ni-label">Toutes</span>
    <span class="nav-badge nb-dim"><?= array_sum($stats) ?></span>
  </a>

  <div class="divider"></div>
  <div class="nav-section">Contenu</div>

  <a class="nav-item <?= $tab==='adresses' ? 'active' : '' ?>"
     href="?tab=adresses">
    <span class="ni-icon">◉</span>
    <span class="ni-label">Adresses</span>
    <?php if (($adr_global['moyenne'] ?? null) !== null): ?>
    <span class="nav-badge nb-dim"><?= (int)$adr_global['moyenne'] ?>%</span>
    <?php endif; ?>
  </a>

  <a class="nav-item <?= $tab==='photos' ? 'active' : '' ?>"
     href="?tab=photos">
    <span class="ni-icon">◻</span>
    <span class="ni-label">Photos lounges</span>
    <?php if ($total_photos): ?>
    <span class="nav-badge nb-dim"><?= $total_photos ?></span>
    <?php endif; ?>
  </a>

  <a class="nav-item <?= $tab==='reviews' ? 'active' : '' ?>"
     href="?tab=reviews">
    <span class="ni-icon">&#9998;</span>
    <span class="ni-label">Avis</span>
    <?php if ($flagged_count): ?>
    <span class="nav-badge nb-red"><?= $flagged_count ?></span>
    <?php endif; ?>
  </a>

  <a class="nav-item <?= $tab==='forum' ? 'active' : '' ?>"
     href="?tab=forum">
    <span class="ni-icon">&#128172;</span>
    <span class="ni-label">Communaute</span>
    <?php if ($forum_flagged): ?>
    <span class="nav-badge nb-red"><?= $forum_flagged ?></span>
    <?php endif; ?>
  </a>

  <a class="nav-item <?= $tab==='suggestions' ? 'active' : '' ?>"
     href="?tab=suggestions">
    <span class="ni-icon">&#128172;</span>
    <span class="ni-label">Suggestions</span>
    <?php if ($sugg_neuves): ?>
    <span class="nav-badge nb-amber"><?= $sugg_neuves ?></span>
    <?php endif; ?>
  </a>

  <div class="divider"></div>
  <div class="nav-section">Registre</div>

  <!-- Ouvert aux deux portées : voir le commentaire du chargement. -->
  <a class="nav-item <?= $tab==='journal' ? 'active' : '' ?>"
     href="?tab=journal">
    <span class="ni-icon">&#9998;</span>
    <span class="ni-label">Journal</span>
  </a>

  <?php if (portee_autorise($scope, 'membres')): ?>
  <a class="nav-item <?= $tab==='membres' ? 'active' : '' ?>"
     href="?tab=membres">
    <span class="ni-icon">&#128100;</span>
    <span class="ni-label">Membres</span>
  </a>
  <?php endif; ?>

  <?php if (portee_autorise($scope, 'langues')): ?>
  <a class="nav-item <?= $tab==='langues' ? 'active' : '' ?>"
     href="?tab=langues">
    <span class="ni-icon">&#127760;</span>
    <span class="ni-label">Langues</span>
    <span class="nav-badge"><?= count($lang_actives) ?>/<?= count(langues_connues()) ?></span>
  </a>
  <?php endif; ?>

  <div class="sidebar-footer">
    <div class="sf-key">
      <?php if ($moi): ?>
        Connecté comme <?= htmlspecialchars($moi['display_name']) ?> ·
        <?= $scope === 'admin' ? 'portée complète' : 'portée de modération' ?> ·
        <a href="/" style="color:inherit">retour au site</a>
      <?php else: ?>
        Session administrateur active · <a href="?logout=1" style="color:inherit">Se déconnecter</a>
      <?php endif; ?>
    </div>
  </div>
</nav>

<!-- ══════════════════ MAIN ════════════════════════════ -->
<main class="main">

<?php if ($msg['text']): ?>
<div class="flash <?= $msg['type'] ?>">
  <?= $msg['type']==='ok' ? '✓' : ($msg['type']==='warn' ? '⚠' : '✕') ?>
  <?= htmlspecialchars($msg['text']) ?>
</div>
<?php endif; ?>

<!-- ── DASHBOARD ────────────────────────────────────── -->
<?php if ($tab === 'dashboard'): ?>
<div class="page-header">
  <div>
    <div class="page-title">Tableau de bord</div>
    <div class="page-subtitle">Vue d'ensemble de CigarOdyssey</div>
  </div>
</div>
<div class="dashboard" style="overflow-y:auto;flex:1;">

  <div class="kpi-grid">
    <div class="kpi kpi-accent">
      <div class="kpi-label">Lounges vérifiés</div>
      <div class="kpi-value"><?= $total_lounges ?></div>
      <div class="kpi-sub"><?= $total_countries ?> pays couverts</div>
    </div>
    <div class="kpi">
      <div class="kpi-label">Photos</div>
      <div class="kpi-value"><?= $total_photos ?></div>
      <div class="kpi-sub">Approuvées</div>
    </div>
    <div class="kpi kpi-green">
      <div class="kpi-label">Contributions</div>
      <div class="kpi-value"><?= array_sum($stats) ?></div>
      <div class="kpi-sub"><?= ($stats['approved']??0) ?> approuvées · <?= ($stats['pending']??0) ?> en attente</div>
    </div>
    <!-- La vie du site. Les deux tuiles qui manquaient : on savait
         combien d'etablissements, pas combien de monde. -->
    <div class="kpi">
      <div class="kpi-label">Membres</div>
      <div class="kpi-value"><?= $vie['membres'] ?></div>
      <div class="kpi-sub">
        <?= $vie['verifies'] ?> vérifié<?= $vie['verifies'] > 1 ? 's' : '' ?>
        <?php if ($vie['semaine']): ?> · <?= $vie['semaine'] ?> cette semaine<?php endif; ?>
      </div>
    </div>
    <div class="kpi">
      <div class="kpi-label">Actifs</div>
      <div class="kpi-value"><?= $vie['actifs_7j'] ?></div>
      <div class="kpi-sub">Connectés ces 7 jours</div>
    </div>
    <div class="kpi">
      <div class="kpi-label">Ils ont écrit</div>
      <div class="kpi-value"><?= $vie['avis'] + $vie['messages'] ?></div>
      <div class="kpi-sub"><?= $vie['avis'] ?> avis · <?= $vie['messages'] ?> messages</div>
    </div>
    <?php if ($vie['attente'] > 0): ?>
    <!-- Ne s'affiche QUE s'il y a lieu. Un compte non verifie apres 24 h
         n'est pas forcement un abandon : c'est le symptome d'un email de
         confirmation qui n'arrive pas — la panne qui a laisse un membre
         inerte sans que rien ne le signale. -->
    <div class="kpi">
      <div class="kpi-label">Inscriptions bloquées</div>
      <div class="kpi-value" style="color:var(--amber)"><?= $vie['attente'] ?></div>
      <div class="kpi-sub">Non vérifiées après 24 h — l’email arrive-t-il ?</div>
    </div>
    <?php endif; ?>

    <div class="kpi">
      <div class="kpi-label">À modérer</div>
      <div class="kpi-value" style="color:<?= ($stats['pending']??0) > 0 ? 'var(--amber)' : 'var(--green)' ?>">
        <?= $stats['pending'] ?? 0 ?>
      </div>
      <div class="kpi-sub">Contribution<?= (($stats['pending']??0)>1)?'s':'' ?> en attente</div>
    </div>
  </div>

  <div class="dash-grid">
    <!-- Contributions à valider -->
    <div class="dash-card">
      <div class="dash-card-head">
        <span style="font-size:14px">⏳</span>
        <span class="dash-card-title">En attente de modération</span>
        <span class="dash-card-count"><?= $stats['pending'] ?? 0 ?> élément(s)</span>
      </div>
      <div class="dash-card-body">
        <?php
        $pending_preview = $db->query("SELECT *, (votes_up-votes_down) AS score FROM contributions WHERE status='pending' ORDER BY score DESC, created_at DESC LIMIT 5")->fetchAll();
        if (empty($pending_preview)):
        ?>
        <div style="padding:24px;text-align:center;color:var(--text3);font-size:11px">
          ✓ Aucune contribution en attente
        </div>
        <?php else: foreach ($pending_preview as $r): ?>
        <div class="pending-row">
          <div class="pr-score <?= ($r['score']??0)>=0 ? 'sp-pos' : 'sp-neg' ?>" style="font-size:11px;font-weight:700;padding:4px 6px;border-radius:5px;
            <?= ($r['score']??0)>=0 ? 'background:var(--green-bg);color:var(--green)' : 'background:var(--red-bg);color:var(--red)' ?>">
            <?= ($r['score']??0) >= 0 ? '+' : '' ?><?= $r['score']??0 ?>
          </div>
          <div class="pr-info">
            <div class="pr-name"><?= htmlspecialchars($r['name']) ?></div>
            <div class="pr-meta">📍 <?= htmlspecialchars($r['city']) ?> · <?= htmlspecialchars($r['country_id']) ?></div>
          </div>
          <div class="pr-actions">
            <form method="POST" style="display:inline">
              <input type="hidden" name="csrf" value="<?= htmlspecialchars(admin_csrf()) ?>">
              <input type="hidden" name="id" value="<?= $r['id'] ?>">
              <button class="action-btn ab-approve" name="action" value="approve">✓</button>
            </form>
            <form method="POST" style="display:inline">
              <input type="hidden" name="csrf" value="<?= htmlspecialchars(admin_csrf()) ?>">
              <input type="hidden" name="id" value="<?= $r['id'] ?>">
              <button class="action-btn ab-reject" name="action" value="reject">✕</button>
            </form>
          </div>
        </div>
        <?php endforeach; endif; ?>
      </div>
    </div>

    <!-- Lounges récents -->
    <div class="dash-card">
      <div class="dash-card-head">
        <span style="font-size:14px">🥃</span>
        <span class="dash-card-title">Lounges récemment ajoutés</span>
        <span class="dash-card-count"><?= count($recent_lounges) ?> derniers</span>
      </div>
      <div class="dash-card-body">
        <?php foreach ($recent_lounges as $l): ?>
        <div class="recent-row">
          <div class="recent-info">
            <div class="recent-name"><?= htmlspecialchars($l['name']) ?></div>
            <div class="recent-meta">📍 <?= htmlspecialchars($l['city']) ?> · <?= htmlspecialchars($l['country_id']) ?></div>
          </div>
          <div class="recent-date"><?= date('d/m/y', strtotime($l['created_at'])) ?></div>
        </div>
        <?php endforeach; ?>
      </div>
    </div>
  </div>
</div>

<!-- ── CONTRIBUTIONS ────────────────────────────────── -->
<div style="display:flex;flex-direction:column;flex:1;overflow:hidden;min-height:0">
<?php elseif (in_array($tab, ['pending','approved','rejected','all'])): ?>
<div class="page-header">
  <div>
    <div class="page-title">
      <?= match($tab){ 'pending'=>'En attente', 'approved'=>'Approuvées', 'rejected'=>'Rejetées', default=>'Toutes les contributions' } ?>
    </div>
    <div class="page-subtitle"><?= count($rows) ?> contribution(s) · triées par score</div>
  </div>
</div>

<?php if (empty($rows)): ?>
<div class="empty-state">
  <div class="empty-icon">◈</div>
  <div class="empty-text">Aucune contribution</div>
</div>
<?php else: ?>
<div class="table-scroll"><table class="contrib-table">
  <thead>
    <tr>
      <th>Établissement</th>
      <th>Pays</th>
      <th>Description</th>
      <th>Source</th>
      <th>Score</th>
      <th>Statut</th>
      <th>Actions</th>
    </tr>
  </thead>
  <tbody>
  <?php foreach ($rows as $r): ?>
  <tr>
    <td>
      <div class="ct-name"><?= htmlspecialchars($r['name']) ?></div>
      <div class="ct-city">📍 <?= htmlspecialchars($r['city']) ?></div>
      <div class="ct-type"><?= htmlspecialchars($r['type']) ?></div>
      <?php if ($r['phone'] ?? ''): ?>
      <div class="ct-city" style="margin-top:3px">📞 <?= htmlspecialchars($r['phone']) ?></div>
      <?php endif; ?>
    </td>
    <td style="white-space:nowrap">
      <div style="font-size:12px;color:var(--text)"><?= htmlspecialchars($r['country_name'] ?? '') ?></div>
      <div class="ct-ip"><?= htmlspecialchars($r['country_id'] ?? '') ?></div>
    </td>
    <td>
      <div class="ct-desc"><?= htmlspecialchars(mb_substr($r['description'],0,140)) ?>…</div>
    </td>
    <td>
      <?php if ($r['source_url'] ?? ''): ?>
      <div class="ct-src"><a href="<?= htmlspecialchars($r['source_url']) ?>" target="_blank" rel="noopener">🔗 Source</a></div>
      <?php endif; ?>
      <div class="ct-ip">👤 <?= htmlspecialchars(substr($r['contributor_ip']??'',0,15)) ?></div>
      <div class="ct-ip"><?= date('d/m/y', strtotime($r['created_at'])) ?></div>
    </td>
    <td style="white-space:nowrap">
      <span class="score-pill <?= ($r['score']??0)>0 ? 'sp-pos' : (($r['score']??0)<0 ? 'sp-neg' : 'sp-neu') ?>">
        👍 <?= $r['votes_up']??0 ?> &nbsp; 👎 <?= $r['votes_down']??0 ?>
      </span>
    </td>
    <td>
      <span class="status-pill stp-<?= $r['status'] ?>">
        <?= match($r['status']){'pending'=>'En attente','approved'=>'Approuvée','rejected'=>'Rejetée',default=>$r['status']} ?>
      </span>
    </td>
    <td>
      <?php if ($r['status'] === 'pending'): ?>
      <div class="action-row">
        <form method="POST">
          <input type="hidden" name="csrf" value="<?= htmlspecialchars(admin_csrf()) ?>">
          <input type="hidden" name="id"  value="<?= $r['id'] ?>">
          <button class="action-btn ab-approve" name="action" value="approve">✓ Approuver</button>
        </form>
        <form method="POST">
          <input type="hidden" name="csrf" value="<?= htmlspecialchars(admin_csrf()) ?>">
          <input type="hidden" name="id"  value="<?= $r['id'] ?>">
          <button class="action-btn ab-reject" name="action" value="reject">✕ Rejeter</button>
        </form>
      </div>
      <?php else: ?>
      <span style="font-size:11px;color:var(--text3)">—</span>
      <?php endif; ?>
    </td>
  </tr>
  <?php endforeach; ?>
  </tbody>
</table></div>
<?php endif; ?>

</div>
<!-- ── PHOTOS ───────────────────────────────────────── -->
<!-- ── ADRESSES ─────────────────────────────────────── -->
<?php elseif ($tab === 'adresses'): ?>
<div class="page-header">
  <div>
    <div class="page-title">Adresses</div>
    <div class="page-subtitle">
      Ce qui manque aux fiches, et par où commencer. Les descriptions ne sont
      <strong>pas</strong> modifiables ici : elles portent 2 500 traductions scellées,
      et les changer d’ici les périmerait en silence.
    </div>
  </div>
</div>

<?php if (!$adr_global || !$adr_global['n']): ?>
<div class="empty-state">
  <div class="empty-icon">◉</div>
  <div class="empty-text">Aucune adresse en base</div>
</div>
<?php else: ?>

<div class="adr-bilan">
  <div><b><?= (int)$adr_global['moyenne'] ?>%</b><span>complétude moyenne · <?= (int)$adr_global['n'] ?> adresses</span></div>
  <div><b><?= (int)$adr_global['completes'] ?></b><span>fiches complètes</span></div>
  <?php foreach (COMPLETUDE_BAREME as $ch => $poids):
        $n = $adr_global['champs'][$ch] ?? 0; ?>
  <div>
    <b><?= (int)round($n * 100 / max(1, $adr_global['n'])) ?>%</b>
    <span><?= htmlspecialchars(COMPLETUDE_NOMS[$ch]) ?> · pèse <?= $poids ?></span>
    <div class="adr-jauge"><i style="width:<?= (int)round($n * 100 / max(1, $adr_global['n'])) ?>%"></i></div>
  </div>
  <?php endforeach; ?>
</div>

<!-- Par NOMBRE d'adresses decroissant : on finit un pays avant le
     suivant. Une page de pays qui porte vingt-quatre fiches completes
     vaut mieux que vingt-quatre pays qui en portent une. -->
<div class="adr-pays">
  <?php foreach ($adr_pays as $p): ?>
  <a href="?tab=adresses&amp;pays=<?= urlencode($p['pays']) ?>"
     class="<?= $p['pays'] === $adr_sel ? 'on' : '' ?>">
    <?= htmlspecialchars($p['pays']) ?><b><?= (int)$p['n'] ?> · <?= (int)$p['moyenne'] ?>%</b>
  </a>
  <?php endforeach; ?>
</div>

<?php foreach ($adr_rows as $f): ?>
<form method="post" class="adr-ligne">
  <input type="hidden" name="csrf" value="<?= htmlspecialchars(admin_csrf()) ?>">
  <input type="hidden" name="action" value="adresse_save">
  <input type="hidden" name="id" value="<?= (int)$f['id'] ?>">
  <div class="adr-tete">
    <span class="adr-nom"><?= htmlspecialchars($f['name']) ?></span>
    <span class="ct-city"><?= htmlspecialchars((string)$f['city']) ?></span>
    <span class="adr-note"><?= (int)$f['score'] ?>%</span>
  </div>
  <?php if ($f['manque']): ?>
  <div class="adr-manque">à compléter :
    <?= htmlspecialchars(implode(', ', array_map(fn($c) => COMPLETUDE_NOMS[$c], $f['manque']))) ?></div>
  <?php endif; ?>
  <div class="adr-champs" style="margin-top:8px">
    <div><label>Horaires</label>
      <input name="hours" value="<?= htmlspecialchars((string)$f['hours']) ?>" placeholder="10h–22h, fermé dim."></div>
    <div><label>Site web</label>
      <input name="website" value="<?= htmlspecialchars((string)$f['website']) ?>" placeholder="exemple.com"></div>
    <div><label>Instagram</label>
      <input name="instagram" value="<?= htmlspecialchars((string)$f['instagram']) ?>" placeholder="sans @"></div>
    <div><label>Téléphone</label>
      <input name="phone" value="<?= htmlspecialchars((string)$f['phone']) ?>"></div>
    <div><label>Latitude</label>
      <input name="lat" value="<?= htmlspecialchars((string)$f['lat']) ?>" placeholder="5.3200"></div>
    <div><label>Longitude</label>
      <input name="lon" value="<?= htmlspecialchars((string)$f['lon']) ?>" placeholder="-4.0200"></div>
  </div>
  <button type="submit">Enregistrer</button>
  <span class="adr-manque" style="margin-left:10px">
    <a href="https://www.google.com/maps/search/?api=1&amp;query=<?= urlencode($f['name'] . ', ' . $f['city']) ?>"
       target="_blank" rel="noopener noreferrer" style="color:var(--text2)">chercher sur Maps ↗</a>
  </span>
</form>
<?php endforeach; ?>
<?php endif; ?>

<?php elseif ($tab === 'photos'): ?>
<div class="photos-layout">

  <!-- Sidebar lounges -->
  <div class="photos-sidebar">
    <form class="ps-search" method="GET" id="loungeSearchForm">
      <input type="hidden" name="csrf" value="<?= htmlspecialchars(admin_csrf()) ?>">
      <input type="hidden" name="tab" value="photos">
      <!-- lounge_id intentionnellement absent : reset la sélection à chaque recherche -->
      <input type="text" name="search" value="<?= htmlspecialchars($photo_search) ?>"
             placeholder="🔍 Lounge, ville, pays…"
             autocomplete="off" spellcheck="false">
    </form>

    <?php if (empty($photos_lounges)): ?>
    <div style="padding:24px;text-align:center;font-size:11px;color:var(--text3)">
      <?= $photo_search ? 'Aucun résultat pour "'.htmlspecialchars($photo_search).'"' : 'Aucun lounge en base' ?>
    </div>
    <?php else: foreach ($photos_lounges as $l):
      $photo_count = 0;
      try {
        $pc = $db->prepare("SELECT COUNT(*) FROM lounge_photos WHERE lounge_id=? AND is_approved=1");
        $pc->execute([$l['id']]);
        $photo_count = (int)$pc->fetchColumn();
      } catch(Exception $e){}
    ?>
    <a class="lounge-item <?= $selected_lounge_id===(int)$l['id'] ? 'active' : '' ?>"
       href="?tab=photos&lounge_id=<?= $l['id'] ?>&search=<?= urlencode($photo_search) ?>">
      <?php if ($photo_count): ?>
      <span class="li-count"><?= $photo_count ?>📷</span>
      <?php endif; ?>
      <div class="li-name"><?= htmlspecialchars($l['name']) ?></div>
      <div class="li-meta"><?= htmlspecialchars($l['country_id']) ?> · <?= htmlspecialchars($l['city']) ?></div>
    </a>
    <?php endforeach; endif; ?>
  </div>

  <!-- Contenu photos -->
  <div class="photos-main">
    <?php if (!$selected_lounge_id): ?>
    <div class="no-selection">
      <div class="ns-icon">◻</div>
      <div class="ns-text">Sélectionnez un lounge</div>
      <div class="ns-sub">Recherchez dans la liste à gauche</div>
    </div>

    <?php else:
      $sel = null;
      foreach ($photos_lounges as $l) { if ((int)$l['id']===$selected_lounge_id){ $sel=$l; break; } }
      if (!$sel) {
        $stmp=$db->prepare("SELECT id,country_id,name,city FROM lounges WHERE id=?");
        $stmp->execute([$selected_lounge_id]); $sel=$stmp->fetch();
      }
      $count_photos = count($photos_data);
      $can_upload   = $count_photos < 10;
    ?>

    <div class="pm-header">
      <div>
        <div class="pm-title"><?= $sel ? htmlspecialchars($sel['name']) : 'Lounge #'.$selected_lounge_id ?></div>
        <?php if ($sel): ?>
        <div class="pm-meta">📍 <?= htmlspecialchars($sel['city']) ?> · <?= htmlspecialchars($sel['country_id']) ?></div>
        <?php endif; ?>
      </div>
      <div class="pm-quota <?= !$can_upload ? 'full' : '' ?>"><?= $count_photos ?> / 10 photos</div>
    </div>

    <!-- Zone upload -->
    <?php if ($can_upload): ?>
    <div class="upload-zone" id="dropZone">
      <input type="file" id="photoFile" accept="image/jpeg,image/png,image/webp" multiple>
      <div class="uz-icon">📸</div>
      <div class="uz-text">
        <strong>Cliquez ou glissez une photo ici</strong><br>
        JPG · PNG · WebP — Max 5 MB — <?= 10-$count_photos ?> emplacement(s) libre(s)
      </div>
    </div>

    <div class="upload-form" id="uploadForm">
      <div class="uf-file-info" id="fileInfo">
        <span class="uf-file-icon">📄</span>
        <span id="fileName">—</span>
        <img class="uf-preview" id="filePreview" src="" alt="" style="display:none">
      </div>
      <input class="uf-input" type="text" id="photoCaption" placeholder="Légende — ex: Walk-in humidor 120m², fumoir principal…">
      <label class="uf-check">
        <input type="checkbox" id="photoIsPrimary">
        Définir comme photo principale (hero)
      </label>
      <div class="uf-actions">
        <button class="btn-primary" id="btnUpload" onclick="doUpload()">⬆ Uploader</button>
        <button class="btn-ghost" onclick="cancelUpload()">Annuler</button>
        <span class="upload-status" id="uploadStatus"></span>
      </div>
      <div class="progress-track" id="progressTrack">
        <div class="progress-fill" id="progressFill"></div>
      </div>
    </div>
    <?php else: ?>
    <div style="padding:12px 16px;background:var(--amber-bg);border:1px solid var(--amber-border);border-radius:6px;font-size:12px;color:var(--amber);margin-bottom:20px">
      ⚠ Quota de 10 photos atteint. Supprimez une photo pour en ajouter.
    </div>
    <?php endif; ?>

    <!-- Galerie -->
    <?php if (empty($photos_data)): ?>
    <div class="no-photos">
      <div class="np-icon">📷</div>
      <div class="np-text">Aucune photo — ajoutez la première</div>
    </div>
    <?php else: ?>
    <div class="photos-grid" id="photosGrid">
      <?php foreach ($photos_data as $p): ?>
      <div class="photo-card <?= $p['is_primary'] ? 'primary' : '' ?>" id="pc-<?= $p['id'] ?>">
        <?php if ($p['is_primary']): ?><div class="pc-badge">PRINCIPALE</div><?php endif; ?>
        <?php if (!$p['is_approved']): ?><div class="pc-pending-badge">⏳</div><?php endif; ?>
        <img class="pc-thumb"
             src="/uploads/lounges/<?= $selected_lounge_id ?>/thumb_<?= htmlspecialchars($p['filename']) ?>"
             alt="<?= htmlspecialchars($p['caption'] ?? '') ?>"
             onclick="expandPhoto('/uploads/lounges/<?= $selected_lounge_id ?>/<?= htmlspecialchars($p['filename']) ?>')"
             onerror="this.closest('.photo-card').style.opacity='.4'">
        <div class="pc-body">
          <div class="pc-caption"><?= htmlspecialchars($p['caption'] ?: '(sans légende)') ?></div>
          <div class="pc-date"><?= date('d/m/y H:i', strtotime($p['created_at'])) ?></div>
        </div>
        <div class="pc-actions">
          <?php if (!$p['is_primary']): ?>
          <button class="pca-btn" onclick="photoAction(<?= $p['id'] ?>,'primary')" title="Définir principale">⭐</button>
          <?php endif; ?>
          <?php if (!$p['is_approved']): ?>
          <button class="pca-btn" onclick="photoAction(<?= $p['id'] ?>,'approve')" title="Approuver">✓</button>
          <?php else: ?>
          <!-- Le retrait réversible : la photo quitte le site, le
               fichier reste. C'est le geste proportionné, et le seul
               dont dispose un modérateur. -->
          <button class="pca-btn" onclick="photoAction(<?= $p['id'] ?>,'hide')" title="Masquer — retire du site sans supprimer le fichier">◎</button>
          <?php endif; ?>
          <?php if (portee_autorise($scope, 'photo_supprimer')): ?>
          <button class="pca-btn pca-del" onclick="photoDelete(<?= $p['id'] ?>,<?= $selected_lounge_id ?>)" title="Supprimer définitivement le fichier">🗑</button>
          <?php endif; ?>
        </div>
      </div>
      <?php endforeach; ?>
    </div>
    <?php endif; ?>

    <?php endif; // selected_lounge_id ?>
  </div>
</div>

<!-- ── AVIS ───────────────────────────────── -->
<?php elseif ($tab === 'reviews'): ?>
<div class="page-header">
  <div>
    <div class="page-title">Avis des membres</div>
    <div class="page-subtitle">
      <?= count($reviews_rows) ?> avis · signalés en tête ·
      « Retirer » masque l’avis et l’exclut de la note du lounge
    </div>
  </div>
</div>

<?php if (empty($reviews_rows)): ?>
<div class="empty-state">
  <div class="empty-icon">◈</div>
  <div class="empty-text">Aucun avis pour l’instant</div>
</div>
<?php else: ?>
<div class="table-scroll"><table class="contrib-table">
  <thead>
    <tr>
      <th>Auteur</th>
      <th>Établissement</th>
      <th>Note</th>
      <th>Avis</th>
      <th>Signalements</th>
      <th>Statut</th>
      <th>Actions</th>
    </tr>
  </thead>
  <tbody>
  <?php foreach ($reviews_rows as $rv): $rt = (int)$rv['rating']; ?>
  <tr>
    <td style="white-space:nowrap">
      <div class="ct-name"><?= htmlspecialchars($rv['display_name']) ?></div>
      <div class="ct-city"><?= date('d/m/y', strtotime($rv['created_at'])) ?></div>
    </td>
    <td>
      <div class="ct-name"><?= htmlspecialchars($rv['lounge_name'] ?? '—') ?></div>
      <div class="ct-city"><?= htmlspecialchars($rv['country_id'] ?? '') ?></div>
    </td>
    <td style="white-space:nowrap;color:#C9A227"><?= str_repeat('★', $rt) . str_repeat('☆', 5 - $rt) ?></td>
    <td>
      <?php if ($rv['title']): ?><div class="ct-name"><?= htmlspecialchars($rv['title']) ?></div><?php endif; ?>
      <div class="ct-city" style="white-space:normal"><?= nl2br(htmlspecialchars(mb_substr((string)$rv['body'], 0, 400))) ?></div>
    </td>
    <td style="text-align:center">
      <?php if ((int)$rv['flags'] > 0): ?>
      <span class="nav-badge nb-red"><?= (int)$rv['flags'] ?></span>
      <?php else: ?>
      <span style="font-size:11px;color:var(--text3)">—</span>
      <?php endif; ?>
    </td>
    <td>
      <span class="status-pill stp-<?= $rv['status'] === 'published' ? 'approved' : ($rv['status'] === 'flagged' ? 'pending' : 'rejected') ?>">
        <?= match($rv['status']){'published'=>'Publié','flagged'=>'Signalé','removed'=>'Retiré',default=>$rv['status']} ?>
      </span>
    </td>
    <td>
      <div class="action-row">
        <?php if ($rv['status'] !== 'removed'): ?>
        <form method="POST">
          <input type="hidden" name="csrf" value="<?= htmlspecialchars(admin_csrf()) ?>">
          <input type="hidden" name="id"  value="<?= (int)$rv['id'] ?>">
          <button class="action-btn ab-reject" name="action" value="review_remove">✕ Retirer</button>
        </form>
        <?php endif; ?>
        <?php if ($rv['status'] !== 'published'): ?>
        <form method="POST">
          <input type="hidden" name="csrf" value="<?= htmlspecialchars(admin_csrf()) ?>">
          <input type="hidden" name="id"  value="<?= (int)$rv['id'] ?>">
          <button class="action-btn ab-approve" name="action" value="review_publish">✓ Publier</button>
        </form>
        <?php endif; ?>
      </div>
    </td>
  </tr>
  <?php endforeach; ?>
  </tbody>
</table></div>
<?php endif; ?>

<?php elseif ($tab === 'forum'): ?>
<div class="page-header">
  <div>
    <div class="page-title">Communaute</div>
    <div class="page-subtitle">
      <?= count($forum_rows) ?> message(s) · les plus signales en tete ·
      trois signalements distincts masquent deja un message sans attendre
    </div>
  </div>
</div>

<?php if (empty($forum_rows)): ?>
<div class="empty-state">
  <div class="empty-icon">&#9670;</div>
  <div class="empty-text">Aucun message pour l'instant</div>
</div>
<?php else: ?>
<div class="table-scroll"><table class="contrib-table">
  <thead>
    <tr>
      <th>Auteur</th>
      <th>Sujet</th>
      <th>Message</th>
      <th>Signalements</th>
      <th>Statut</th>
      <th>Actions</th>
    </tr>
  </thead>
  <tbody>
  <?php foreach ($forum_rows as $fp): ?>
  <tr>
    <td style="white-space:nowrap">
      <div class="ct-name"><?= htmlspecialchars($fp['display_name'] ?? 'Membre supprime') ?></div>
      <div class="ct-city"><?= date('d/m/y', strtotime($fp['created_at'])) ?></div>
    </td>
    <td>
      <div class="ct-name"><?= htmlspecialchars($fp['topic_title']) ?></div>
      <div class="ct-city"><?= htmlspecialchars($fp['section']) ?>
        <?= $fp['topic_status'] === 'locked' ? ' · ferme' : '' ?></div>
    </td>
    <td>
      <div class="ct-city" style="white-space:normal">
        <?= htmlspecialchars(forum_extrait($fp['body'], 400)) ?>
      </div>
    </td>
    <td style="text-align:center">
      <?php if ((int)$fp['flags'] > 0): ?>
      <span class="nav-badge nb-red"><?= (int)$fp['flags'] ?></span>
      <?php else: ?>
      <span style="font-size:11px;color:var(--text3)">&mdash;</span>
      <?php endif; ?>
    </td>
    <td>
      <span class="status-pill stp-<?= $fp['status'] === 'published' ? 'approved' : ($fp['status'] === 'flagged' ? 'pending' : 'rejected') ?>">
        <?= match($fp['status']){'published'=>'Publie','flagged'=>'Signale','removed'=>'Retire',default=>$fp['status']} ?>
      </span>
    </td>
    <td>
      <div class="action-row">
        <?php if ($fp['status'] !== 'removed'): ?>
        <form method="POST">
          <input type="hidden" name="csrf" value="<?= htmlspecialchars(admin_csrf()) ?>">
          <input type="hidden" name="id"  value="<?= (int)$fp['id'] ?>">
          <button class="action-btn ab-reject" name="action" value="forum_remove">&#10007; Retirer</button>
        </form>
        <?php endif; ?>
        <?php if ($fp['status'] !== 'published'): ?>
        <form method="POST">
          <input type="hidden" name="csrf" value="<?= htmlspecialchars(admin_csrf()) ?>">
          <input type="hidden" name="id"  value="<?= (int)$fp['id'] ?>">
          <button class="action-btn ab-approve" name="action" value="forum_publish">&#10003; Publier</button>
        </form>
        <?php endif; ?>
        <form method="POST">
          <input type="hidden" name="csrf" value="<?= htmlspecialchars(admin_csrf()) ?>">
          <input type="hidden" name="id"  value="<?= (int)$fp['topic_id'] ?>">
          <button class="action-btn" name="action"
                  value="<?= $fp['topic_status'] === 'locked' ? 'forum_unlock' : 'forum_lock' ?>">
            <?= $fp['topic_status'] === 'locked' ? 'Rouvrir le sujet' : 'Fermer le sujet' ?>
          </button>
        </form>
      </div>
    </td>
  </tr>
  <?php endforeach; ?>
  </tbody>
</table></div>
<?php endif; ?>

<!-- ── LANGUES ──────────────────────────────────────── -->
<!-- ── MEMBRES ────────────────────────────────────────── -->
<?php elseif ($tab === 'membres'): ?>
<div class="page-header">
  <div>
    <div class="page-title">Membres</div>
    <div class="page-subtitle">
      <?= count($membres_rows) ?> comptes · « contributeur de confiance » s’obtient tout seul
      après <?= defined('TRUSTED_AFTER_APPROVED') ? (int)TRUSTED_AFTER_APPROVED : 'N' ?>
      contributions approuvées — c’est « modérateur » qui se décide ici.
      Le rôle <strong>admin</strong> ne s’attribue pas depuis cet écran : il vaut la clé.
    </div>
  </div>
</div>

<?php if (empty($membres_rows)): ?>
<div class="empty-state">
  <div class="empty-icon">◈</div>
  <div class="empty-text">Aucun compte</div>
</div>
<?php else: ?>
<div class="table-scroll"><table class="contrib-table">
  <thead>
    <tr>
      <th>Compte</th>
      <th>Rôle</th>
      <th style="text-align:center">Contributions</th>
      <th style="text-align:center">Messages</th>
      <th>Dernière visite</th>
      <th>Attribuer</th>
    </tr>
  </thead>
  <tbody>
  <?php foreach ($membres_rows as $m):
        // Deux comptes ne se modifient pas — voir changer_role() pour
        // le pourquoi de chacun. L'écran le dit plutôt que de proposer
        // un bouton qui serait refusé.
        $fige = $m['role'] === 'admin' || $m['password_hash'] === '*';
  ?>
  <tr>
    <td>
      <div class="ct-name"><?= htmlspecialchars($m['display_name']) ?></div>
      <div class="ct-city">
        <?= htmlspecialchars($m['email']) ?>
        <?= $m['email_verified'] ? '' : ' · <span style="color:var(--amber)">email non vérifié</span>' ?>
      </div>
    </td>
    <td style="white-space:nowrap">
      <span class="status-pill stp-<?= in_array($m['role'], ['admin','moderator'], true) ? 'approved'
            : ($m['role'] === 'trusted' ? 'pending' : 'rejected') ?>">
        <?= ROLES_ATTRIBUABLES[$m['role']] ?? 'Administrateur' ?>
      </span>
      <?php if ($m['status'] !== 'active'): ?>
      <div class="ct-city" style="color:var(--red)">compte suspendu</div>
      <?php endif; ?>
    </td>
    <td style="text-align:center"><span class="ct-city"><?= (int)$m['contribs'] ?></span></td>
    <td style="text-align:center"><span class="ct-city"><?= (int)$m['messages'] ?></span></td>
    <td>
      <div class="ct-city">
        <?= $m['last_login_at'] ? date('d/m/y', strtotime($m['last_login_at'])) : 'jamais' ?>
        · inscrit le <?= date('d/m/y', strtotime($m['created_at'])) ?>
      </div>
    </td>
    <td>
      <?php if ($fige): ?>
        <span class="ct-city"><?= $m['role'] === 'admin'
          ? 'administrateur — se change avec la clé'
          : 'compte de signature — rôle figé' ?></span>
      <?php else: ?>
      <form method="POST" class="action-row" style="gap:6px">
        <input type="hidden" name="csrf" value="<?= htmlspecialchars(admin_csrf()) ?>">
        <input type="hidden" name="id"   value="<?= (int)$m['id'] ?>">
        <select name="role" style="padding:5px 8px;background:var(--bg3);border:1px solid var(--border);
                       border-radius:5px;color:var(--text);font-size:11px">
          <?php foreach (ROLES_ATTRIBUABLES as $cle => $lib): ?>
          <option value="<?= $cle ?>" <?= $m['role'] === $cle ? 'selected' : '' ?>><?= $lib ?></option>
          <?php endforeach; ?>
        </select>
        <button class="action-btn ab-approve" name="action" value="role_set">Appliquer</button>
      </form>
      <?php endif; ?>
    </td>
  </tr>
  <?php endforeach; ?>
  </tbody>
</table></div>

<div class="ct-city" style="margin-top:18px;line-height:1.7;max-width:62em">
  <strong>Ce que « modérateur » ouvre — et ce qu'il n'ouvre pas.</strong><br>
  · Ouvert : contributions, avis, photos et messages de la communauté — approuver,
    rejeter, retirer, masquer. Ce sont les gestes réversibles.<br>
  · Fermé : <?= htmlspecialchars(implode(' · ', PORTEE_ADMIN_SEULEMENT)) ?>.<br>
  · Chaque décision est inscrite au <a href="?tab=journal" style="color:var(--gold)">journal</a>,
    sous le nom du compte. C'est ce qui permet de confier le rôle sans le regretter.
</div>
<?php endif; ?>

<!-- ── SUGGESTIONS ────────────────────────────────────── -->
<?php elseif ($tab === 'suggestions'): ?>
<div class="page-header">
  <div>
    <div class="page-title">Suggestions</div>
    <div class="page-subtitle">
      <?= count($sugg_rows) ?> reçue<?= count($sugg_rows) > 1 ? 's' : '' ?> ·
      envoyées depuis un <strong>compte vérifié</strong> — vous pouvez donc répondre.
      Les remarques antérieures au changement de règle, envoyées sans compte, sont
      conservées et signalées comme telles. Les non traitées sont en tête.
    </div>
  </div>
</div>

<?php if (empty($sugg_rows)): ?>
<div class="empty-state">
  <div class="empty-icon">◈</div>
  <div class="empty-text">Aucune remarque pour l’instant</div>
  <div class="ct-city" style="margin-top:8px">
    Le bouton 💬 est en bas à droite de chaque page du site.
  </div>
</div>
<?php else: ?>
<div class="table-scroll"><table class="contrib-table">
  <thead>
    <tr>
      <th style="width:110px">Reçue</th>
      <th>Remarque</th>
      <th style="width:150px">Contexte</th>
      <th style="width:170px">Répondre</th>
      <th style="width:190px">Actions</th>
    </tr>
  </thead>
  <tbody>
  <?php foreach ($sugg_rows as $s): ?>
  <tr<?= $s['traite'] ? ' style="opacity:.55"' : '' ?>>
    <td style="white-space:nowrap">
      <div class="ct-name"><?= date('d/m/y', strtotime($s['created_at'])) ?></div>
      <div class="ct-city"><?= date('H:i', strtotime($s['created_at'])) ?></div>
    </td>
    <td>
      <div class="ct-city" style="white-space:pre-wrap;color:var(--text)">
        <?= htmlspecialchars($s['texte']) ?>
      </div>
    </td>
    <td>
      <div class="ct-city">
        <?= $s['page'] ? htmlspecialchars($s['page']) : '—' ?>
        <?= $s['lang'] ? '<br>' . strtoupper(htmlspecialchars($s['lang'])) : '' ?>
      </div>
    </td>
    <td>
      <?php
        // Trois cas, dans cet ordre : un membre (le régime actuel), une
        // adresse laissée volontairement sous l'ancien, rien du tout.
        // Le compte supprimé retombe sur le deuxième ou le troisième —
        // la clé étrangère est en ON DELETE SET NULL, la remarque reste.
        $adr = $s['auteur_email'] ?: ($s['email'] ?: '');
      ?>
      <?php if (!empty($s['auteur'])): ?>
        <div class="ct-name"><?= htmlspecialchars($s['auteur']) ?></div>
        <?php if ($adr): ?>
        <a href="mailto:<?= htmlspecialchars($adr) ?>" class="ct-city"
           style="color:var(--gold);word-break:break-all"><?= htmlspecialchars($adr) ?></a>
        <?php endif; ?>
      <?php elseif ($adr): ?>
        <a href="mailto:<?= htmlspecialchars($adr) ?>" class="ct-city"
           style="color:var(--gold);word-break:break-all"><?= htmlspecialchars($adr) ?></a>
        <div class="ct-city" style="opacity:.6">sans compte (ancien régime)</div>
      <?php else: ?>
        <span class="ct-city">anonyme (ancien régime)</span>
      <?php endif; ?>
    </td>
    <td>
      <div class="action-row">
        <form method="POST">
          <input type="hidden" name="csrf" value="<?= htmlspecialchars(admin_csrf()) ?>">
          <input type="hidden" name="id"   value="<?= (int)$s['id'] ?>">
          <?php if (!$s['traite']): ?>
          <button class="action-btn ab-approve" name="action" value="sugg_traite">✓ Traitée</button>
          <?php else: ?>
          <button class="action-btn" name="action" value="sugg_rouvrir">↺ Rouvrir</button>
          <?php endif; ?>
        </form>
        <form method="POST" onsubmit="return confirm('Supprimer definitivement cette remarque ?')">
          <input type="hidden" name="csrf" value="<?= htmlspecialchars(admin_csrf()) ?>">
          <input type="hidden" name="id"   value="<?= (int)$s['id'] ?>">
          <button class="action-btn ab-reject" name="action" value="sugg_supprimer">✕</button>
        </form>
      </div>
    </td>
  </tr>
  <?php endforeach; ?>
  </tbody>
</table></div>

<div class="ct-city" style="margin-top:18px;line-height:1.7;max-width:62em">
  <strong>Ce que la boîte accepte, et ce qu’elle refuse.</strong><br>
  · Trois envois par heure et par adresse — comptés sur les envois RÉELS :
    une erreur de saisie ne consomme pas le quota.<br>
  · <strong>Aucun lien</strong> dans le texte. C’est ce qui coupe l’essentiel du
    spam automatique, et un retour d’essai n’en a pas besoin.<br>
  · Un champ leurre, invisible, que les robots remplissent et les humains non.<br>
  · L’adresse est facultative : sans elle, le message arrive quand même.
</div>
<?php endif; ?>

<!-- ── JOURNAL ────────────────────────────────────────── -->
<?php elseif ($tab === 'journal'): ?>
<?php
  $ACT = [
    'contribution_approuver'           => 'Contribution approuvée',
    'contribution_rejeter'             => 'Contribution rejetée',
    'contribution_publication_directe' => 'Publication directe',
    'avis_retirer'    => 'Avis retiré',      'avis_retablir'   => 'Avis rétabli',
    'message_retirer' => 'Message retiré',   'message_retablir'=> 'Message rétabli',
    'photo_approuver' => 'Photo approuvée',  'photo_masquer'   => 'Photo masquée',
    'photo_supprimer' => 'Photo supprimée',  'role_attribuer'  => 'Rôle attribué',
  ];
?>
<div class="page-header">
  <div>
    <div class="page-title">Journal de modération</div>
    <div class="page-subtitle">
      <?= $journal_n ?> décision<?= $journal_n > 1 ? 's' : '' ?> · les 200 dernières ·
      le nom est figé au moment de l’acte, il survit au renommage du compte
    </div>
  </div>
</div>

<?php if (empty($journal_rows)): ?>
<div class="empty-state">
  <div class="empty-icon">◈</div>
  <div class="empty-text">Aucune décision journalisée</div>
  <div class="ct-city" style="margin-top:8px">
    Le journal part de la migration 130 : les décisions antérieures n’y sont pas.
  </div>
</div>
<?php else: ?>
<div class="table-scroll"><table class="contrib-table">
  <thead>
    <tr>
      <th>Quand</th>
      <th>Qui</th>
      <th>Quoi</th>
      <th>Sur</th>
      <th>Détail</th>
    </tr>
  </thead>
  <tbody>
  <?php foreach ($journal_rows as $j): ?>
  <tr>
    <td style="white-space:nowrap">
      <div class="ct-name"><?= date('d/m/y', strtotime($j['created_at'])) ?></div>
      <div class="ct-city"><?= date('H:i', strtotime($j['created_at'])) ?></div>
    </td>
    <td style="white-space:nowrap">
      <div class="ct-name"><?= htmlspecialchars($j['acteur_nom']) ?></div>
      <div class="ct-city"><?= match($j['portee']){
        'admin' => 'administration', 'moderator' => 'modération', default => 'automatique' } ?></div>
    </td>
    <td><span class="ct-name"><?= htmlspecialchars($ACT[$j['action']] ?? $j['action']) ?></span></td>
    <td style="white-space:nowrap">
      <span class="ct-city"><?= htmlspecialchars($j['cible_type']) ?> #<?= (int)$j['cible_id'] ?></span>
    </td>
    <td><span class="ct-city" style="white-space:normal"><?= htmlspecialchars((string)($j['detail'] ?? '—')) ?></span></td>
  </tr>
  <?php endforeach; ?>
  </tbody>
</table></div>
<?php endif; ?>

<?php elseif ($tab === 'langues'): ?>
<?php
  $LANG_NOMS = ['fr' => 'Français', 'en' => 'English', 'es' => 'Español',
                'de' => 'Deutsch',  'zh' => '中文',    'ar' => 'العربية'];
  $LANG_URLS = ['fr' => '/', 'en' => '/en/', 'es' => '/es/',
                'de' => '/de/', 'zh' => '/zh/', 'ar' => '/ar/'];
?>
<div class="page-header">
  <div>
    <div class="page-title">Langues</div>
    <div class="page-subtitle">
      Ce que le site propose. Décocher une langue retire son drapeau de l'en-tête et du menu,
      la sort du plan de site et des liens hreflang, et cesse de l'offrir à l'écriture d'un message.
      <strong>Aucun contenu n'est supprimé</strong> : les messages gardent leur langue et
      réapparaissent tels quels si on la rouvre.
    </div>
  </div>
</div>

<form method="POST" style="overflow-y:auto;flex:1;padding-right:4px">
  <input type="hidden" name="csrf" value="<?= htmlspecialchars(admin_csrf()) ?>">
  <div class="table-scroll"><table class="contrib-table">
    <thead>
      <tr>
        <th style="width:70px">Servie</th>
        <th>Langue</th>
        <th>Adresse</th>
        <th style="text-align:center">Comptes</th>
        <th style="text-align:center">Sujets</th>
      </tr>
    </thead>
    <tbody>
    <?php foreach (langues_connues() as $l): $on = in_array($l, $lang_actives, true); ?>
    <tr>
      <td style="text-align:center">
        <?php if ($l === 'fr'): ?>
          <!-- Le français est le repli de toute traduction manquante :
               le fermer laisserait indéfini ce qu'on sert à qui n'a
               aucune des autres. La case est verrouillée et le champ
               caché la renvoie quand même — langues_normaliser() le
               réimposerait de toute façon, mais un formulaire qui
               ment sur ce qu'il envoie est un piège. -->
          <input type="checkbox" checked disabled
                 title="Le français est la langue de repli : il ne peut pas être fermé">
          <input type="hidden" name="langues[]" value="fr">
        <?php else: ?>
          <input type="checkbox" name="langues[]" value="<?= $l ?>" <?= $on ? 'checked' : '' ?>
                 style="width:16px;height:16px;accent-color:#C9A227;cursor:pointer">
        <?php endif; ?>
      </td>
      <td>
        <div class="ct-name"><?= htmlspecialchars($LANG_NOMS[$l]) ?></div>
        <div class="ct-city"><?= strtoupper($l) ?><?= $l === 'fr' ? ' · repli, toujours servi' : '' ?></div>
      </td>
      <td>
        <span class="ct-city"><?= $on ? htmlspecialchars($LANG_URLS[$l]) : '— rendue en français' ?></span>
      </td>
      <td style="text-align:center">
        <span class="ct-city"><?= (int)($lang_stats['users'][$l] ?? 0) ?></span>
      </td>
      <td style="text-align:center">
        <span class="ct-city"><?= (int)($lang_stats['topics'][$l] ?? 0) ?></span>
      </td>
    </tr>
    <?php endforeach; ?>
    </tbody>
  </table></div>

  <div class="action-row" style="margin-top:18px">
    <button class="action-btn ab-approve" name="action" value="langues_save">&#10003; Enregistrer</button>
  </div>

  <div class="ct-city" style="margin-top:18px;line-height:1.7;max-width:62em">
    <strong>Ce qu'il faut savoir avant de fermer une langue.</strong><br>
    · Une adresse déjà indexée (<code>/de/</code>) continue de répondre — en français.
      Elle ne renvoie pas d'erreur, mais sa traduction disparaît des moteurs.<br>
    · Les comptes ayant choisi cette langue la gardent en base ; leurs courriels
      repassent au français tant qu'elle est fermée.<br>
    · Les sujets déjà écrits restent lisibles, avec leur étiquette de langue, et le
      filtre « toutes les langues » les affiche toujours.<br>
    · Ajouter une <em>septième</em> langue ne se règle pas ici : il y faut son dictionnaire
      dans <code>assets/js/i18n.js</code>. Cette page ne coche que ce que le site sait déjà dire.
  </div>
</form>
<?php endif; ?>

</main>
</div><!-- /layout -->

<script>
var PHOTOS_API = '<?= rtrim(dirname($_SERVER["SCRIPT_NAME"]), "/") ?>/photos.php';
var LOUNGE_ID  = <?= $selected_lounge_id ?>;
var _file      = null;

// ── Drag & Drop ───────────────────────────────────────
var dz = document.getElementById('dropZone');
if (dz) {
  dz.addEventListener('dragover',  function(e){e.preventDefault();dz.classList.add('drag-over')});
  dz.addEventListener('dragleave', function(){dz.classList.remove('drag-over')});
  dz.addEventListener('drop', function(e){
    e.preventDefault();dz.classList.remove('drag-over');
    if(e.dataTransfer.files[0]) fileSelect(e.dataTransfer.files[0]);
  });
  document.getElementById('photoFile').addEventListener('change',function(){
    if(this.files[0]) fileSelect(this.files[0]);
  });
}

function fileSelect(f) {
  if(!f.type.match(/^image\//)){alert('Format non supporté (JPG, PNG, WebP)');return}
  if(f.size>5*1024*1024){alert('Fichier trop lourd (max 5 MB)');return}
  _file = f;
  document.getElementById('uploadForm').style.display='flex';
  document.getElementById('fileName').textContent = f.name+' ('+Math.round(f.size/1024)+'KB)';
  // Prévisualisation
  var reader = new FileReader();
  reader.onload = function(e){
    var prev = document.getElementById('filePreview');
    prev.src = e.target.result;
    prev.style.display = 'block';
  };
  reader.readAsDataURL(f);
}

function cancelUpload(){
  _file=null;
  document.getElementById('uploadForm').style.display='none';
  document.getElementById('photoFile').value='';
  document.getElementById('filePreview').style.display='none';
  document.getElementById('uploadStatus').textContent='';
}

function doUpload(){
  if(!_file){alert('Sélectionnez une photo');return}
  var fd=new FormData();
  fd.append('photo',_file);
  fd.append('lounge_id',LOUNGE_ID);
  fd.append('caption',document.getElementById('photoCaption').value);
  fd.append('is_primary',document.getElementById('photoIsPrimary').checked?'1':'0');

  var btn=document.getElementById('btnUpload');
  var track=document.getElementById('progressTrack');
  var fill=document.getElementById('progressFill');
  var status=document.getElementById('uploadStatus');

  btn.disabled=true; btn.textContent='⬆ En cours…';
  track.style.display='block'; fill.style.width='0%';

  var xhr=new XMLHttpRequest();
  xhr.open('POST',PHOTOS_API+'?action=upload');
  xhr.upload.onprogress=function(e){if(e.lengthComputable)fill.style.width=Math.round(e.loaded/e.total*100)+'%'};
  xhr.onload=function(){
    btn.disabled=false; btn.textContent='⬆ Uploader';
    try{
      var d=JSON.parse(xhr.responseText);
      if(d.success){
        status.style.color='#4A9B5A';
        status.textContent='✓ Uploadée avec succès';
        fill.style.background='#4A9B5A';
        // Délai légèrement plus long pour Safari (écriture disque + cache)
        setTimeout(function(){
          var url='?tab=photos&lounge_id='+LOUNGE_ID+'&_='+Date.now();
          location.href=url;
        },1200);
      }else{
        status.style.color='#9B4A4A';
        status.textContent='✕ '+( d.error||'Erreur');
        fill.style.background='#9B4A4A';
      }
    }catch(e){status.style.color='#9B4A4A';status.textContent='✕ Réponse invalide'}
  };
  xhr.onerror=function(){btn.disabled=false;btn.textContent='⬆ Uploader';status.textContent='✕ Erreur réseau'};
  xhr.send(fd);
}

function photoAction(id,action){
  var fd=new FormData();fd.append('photo_id',id);
  fetch(PHOTOS_API+'?action='+action,{method:'POST',body:fd})
  .then(function(r){return r.json()})
  .then(function(d){if(d.success)location.reload();else alert('Erreur: '+(d.error||'inconnue'))});
}

function photoDelete(id,lid){
  if(!confirm('Supprimer définitivement cette photo ?'))return;
  var fd=new FormData();fd.append('photo_id',id);
  fetch(PHOTOS_API+'?action=delete',{method:'POST',body:fd})
  .then(function(r){return r.json()})
  .then(function(d){
    if(d.success){
      var el=document.getElementById('pc-'+id);
      if(el){el.style.opacity='0';el.style.transform='scale(.95)';el.style.transition='.25s';
        setTimeout(function(){el.remove()},250);}
    }else alert('Erreur: '+(d.error||'inconnue'));
  });
}

function expandPhoto(url){
  var lb=document.createElement('div');
  lb.style.cssText='position:fixed;inset:0;background:rgba(0,0,0,.94);z-index:9999;display:flex;align-items:center;justify-content:center;cursor:zoom-out;backdrop-filter:blur(8px)';
  lb.innerHTML='<img src="'+url+'" style="max-width:92vw;max-height:92vh;border-radius:8px;object-fit:contain;box-shadow:0 24px 80px rgba(0,0,0,.8)">';
  lb.onclick=function(){document.body.removeChild(lb)};
  document.addEventListener('keydown',function esc(e){if(e.key==='Escape'){document.body.removeChild(lb);document.removeEventListener('keydown',esc)}});
  document.body.appendChild(lb);
}

// Auto-submit search en photos
var psInput=document.querySelector('.ps-search input[name=search]');
if(psInput){
  // Soumettre après 400ms de pause — reset la sélection de lounge
  var _t;
  psInput.addEventListener('input',function(){
    clearTimeout(_t);
    _t=setTimeout(function(){ psInput.closest('form').submit(); },400);
  });
  // Effacer avec Escape
  psInput.addEventListener('keydown',function(e){
    if(e.key==='Escape'){ psInput.value=''; psInput.closest('form').submit(); }
    if(e.key==='Enter'){ e.preventDefault(); psInput.closest('form').submit(); }
  });
}

// ── Thèmes ────────────────────────────────────────────
var THEMES = ['dark','light','midnight','emerald','bordeaux'];

function setTheme(t) {
  if (!THEMES.includes(t)) t = 'dark';
  document.documentElement.setAttribute('data-theme', t);
  localStorage.setItem('cigarodyssey_admin_theme', t);
  // Mettre à jour le bouton actif
  document.querySelectorAll('.theme-btn').forEach(function(b) {
    b.classList.toggle('active', b.dataset.t === t);
  });
}

// Appliquer le thème sauvegardé au chargement
(function() {
  var saved = localStorage.getItem('cigarodyssey_admin_theme') || 'light';
  setTheme(saved);
})();
</script>
</body>
</html>