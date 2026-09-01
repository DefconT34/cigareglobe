<?php
// ════════════════════════════════════════════════════════
// auth_lib.php — Helpers partagés : session, CSRF, utilisateur
// courant, limitation de débit. Utilisé par auth.php et (Étape B)
// account.php.
// ════════════════════════════════════════════════════════

require_once __DIR__ . '/config.php';
require_once __DIR__ . '/langues.php';

// ── Session sécurisée ─────────────────────────────────────
function auth_session_start(): void {
    if (session_status() === PHP_SESSION_ACTIVE) return;
    $https = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off')
          || (($_SERVER['HTTP_X_FORWARDED_PROTO'] ?? '') === 'https');
    session_set_cookie_params([
        'lifetime' => 0,
        'path'     => '/',
        'httponly' => true,
        'secure'   => $https,
        'samesite' => 'Lax',
    ]);
    session_name('CGSESS');
    session_start();
}

// ── Sortie JSON ───────────────────────────────────────────
function respond(array $data, int $code = 200): void {
    http_response_code($code);
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode($data, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    exit;
}

// ── IP client ─────────────────────────────────────────────
/**
 * Adresse du visiteur — celle sur laquelle reposent TOUS les plafonds :
 * tentatives de connexion (`auth_attempts`), quota journalier de
 * contributions, cadences du forum, `uploader_ip` des photos.
 *
 * CE QUI N'ALLAIT PAS. Cette fonction lisait `CF-Connecting-IP`, puis
 * `X-Forwarded-For`, puis `X-Real-IP`, et ne retombait sur
 * `REMOTE_ADDR` qu'en dernier recours. Or ces trois en-tetes sont
 * ecrits par L'APPELANT. Servi en direct — ce qui est le cas sur
 * o2switch —, le site prenait donc pour argent comptant une valeur que
 * l'attaquant choisissait : un `X-Forwarded-For` different a chaque
 * requete, et il n'existait plus aucune limite de debit sur le site.
 * Le plafond etait la, visible dans le code, et ne pouvait rien.
 *
 * LA REGLE. `REMOTE_ADDR` est la seule adresse que le serveur constate
 * lui-meme ; c'est donc la reponse par defaut. Les en-tetes ne sont lus
 * que si `REMOTE_ADDR` figure dans TRUSTED_PROXIES — c'est-a-dire s'ils
 * ont ete poses par une machine dont on a declare qu'elle avait le
 * droit de parler au nom du visiteur.
 */
function client_ip(): string {
    $remote = trim((string)($_SERVER['REMOTE_ADDR'] ?? ''));
    if ($remote === '') return '0.0.0.0';

    $proxies = proxies_de_confiance();
    if (!$proxies || !ip_dans_plages($remote, $proxies)) {
        return substr($remote, 0, 45);
    }

    // Cloudflare pose une adresse unique, deja demelee.
    $cf = trim((string)($_SERVER['HTTP_CF_CONNECTING_IP'] ?? ''));
    if ($cf !== '' && filter_var($cf, FILTER_VALIDATE_IP)) return substr($cf, 0, 45);

    // X-Forwarded-For s'ecrit « client, proxy1, proxy2 » : chaque relais
    // AJOUTE a droite. On remonte donc DEPUIS LA DROITE en sautant les
    // maillons connus, et le premier inconnu est le visiteur.
    //
    // Prendre le premier element a gauche — ce que faisait l'ancienne
    // version — revient a laisser le visiteur ecrire sa propre adresse
    // meme derriere un vrai proxy : il lui suffit d'envoyer l'en-tete,
    // auquel le proxy ajoute la sienne a la suite.
    $xff = trim((string)($_SERVER['HTTP_X_FORWARDED_FOR'] ?? ''));
    if ($xff !== '') {
        $chaine = array_map('trim', explode(',', $xff));
        for ($i = count($chaine) - 1; $i >= 0; $i--) {
            if (!filter_var($chaine[$i], FILTER_VALIDATE_IP))   continue;
            if (ip_dans_plages($chaine[$i], $proxies))          continue;
            return substr($chaine[$i], 0, 45);
        }
    }

    $real = trim((string)($_SERVER['HTTP_X_REAL_IP'] ?? ''));
    if ($real !== '' && filter_var($real, FILTER_VALIDATE_IP)) return substr($real, 0, 45);

    // Proxy declare mais aucun en-tete exploitable : l'adresse constatee
    // reste la seule verite disponible.
    return substr($remote, 0, 45);
}

/** Plages declarees dans TRUSTED_PROXIES, decoupees une seule fois. */
function proxies_de_confiance(): array {
    static $liste = null;
    if ($liste === null) {
        $brut  = defined('TRUSTED_PROXIES') ? (string)TRUSTED_PROXIES : '';
        $liste = array_values(array_filter(array_map('trim', explode(',', $brut)), 'strlen'));
    }
    return $liste;
}

/** L'adresse tombe-t-elle dans l'une des plages ? */
function ip_dans_plages(string $ip, array $plages): bool {
    foreach ($plages as $p) {
        if (ip_dans_plage($ip, $p)) return true;
    }
    return false;
}

/**
 * Appartenance a une plage, notee en CIDR (`10.0.0.0/8`) ou en adresse
 * nue (egalite stricte). Compare les adresses sous forme BINAIRE :
 * comparer des chaines ferait entrer « 10.0.0.10 » dans « 10.0.0.1 »,
 * et une plage IPv4 ne peut pas contenir une adresse IPv6 — les deux
 * n'ont meme pas la meme longueur une fois converties.
 */
function ip_dans_plage(string $ip, string $plage): bool {
    if (!str_contains($plage, '/')) return $ip === $plage;

    [$reseau, $bits] = explode('/', $plage, 2);
    $a = @inet_pton($ip);
    $b = @inet_pton($reseau);
    if ($a === false || $b === false || strlen($a) !== strlen($b)) return false;

    $bits = (int)$bits;
    if ($bits < 0 || $bits > strlen($a) * 8) return false;

    $octets = intdiv($bits, 8);
    $reste  = $bits % 8;
    if ($octets > 0 && substr($a, 0, $octets) !== substr($b, 0, $octets)) return false;
    if ($reste === 0) return true;

    $masque = chr((0xFF << (8 - $reste)) & 0xFF);
    return ($a[$octets] & $masque) === ($b[$octets] & $masque);
}

// ── Corps JSON de la requête ──────────────────────────────
function json_body(): array {
    $raw = file_get_contents('php://input');
    $b   = json_decode($raw, true);
    return is_array($b) ? $b : [];
}

// ── CSRF ──────────────────────────────────────────────────
function csrf_get(): string {
    if (empty($_SESSION['csrf'])) {
        $_SESSION['csrf'] = bin2hex(random_bytes(32));
    }
    return $_SESSION['csrf'];
}

function csrf_verify(): void {
    $sent = $_SERVER['HTTP_X_CSRF_TOKEN'] ?? ($_POST['_csrf'] ?? '');
    if (empty($_SESSION['csrf']) || !is_string($sent) || !hash_equals($_SESSION['csrf'], $sent)) {
        respond(err('csrf_invalid', 'Jeton CSRF invalide ou expiré. Rechargez la page.'), 419);
    }
}

// ── Utilisateur courant ───────────────────────────────────
function current_user(PDO $db): ?array {
    if (empty($_SESSION['uid'])) return null;
    $stmt = $db->prepare(
        "SELECT id, email, display_name, role, email_verified, avatar_url, bio, lang,
                notify_forum, status, created_at, last_login_at
         FROM users WHERE id = ? AND status = 'active'"
    );
    $stmt->execute([(int)$_SESSION['uid']]);
    $u = $stmt->fetch();
    return $u ?: null;
}

/** Renvoie l'utilisateur ou coupe avec 401. */
function require_auth(PDO $db): array {
    $u = current_user($db);
    if (!$u) respond(err('auth_required', 'Authentification requise'), 401);
    return $u;
}

/**
 * Portée d'administration de la requête : 'admin', 'moderator', ou null.
 *
 * Trois voies mènent à l'administration, et elles ne donnent pas les
 * mêmes droits :
 *  - session ouverte avec ADMIN_KEY depuis admin.php ......... 'admin'
 *  - clé transmise par EN-TÊTE X-Admin-Key .................... 'admin'
 *  - compte connecté de rôle admin ............................ 'admin'
 *  - compte connecté de rôle moderator .................... 'moderator'
 *
 * La clé n'est jamais acceptée depuis l'URL : elle fuirait dans les logs
 * du serveur, l'historique du navigateur et l'en-tête Referer.
 *
 * POURQUOI DISTINGUER. Jusqu'ici `moderator` valait `admin` partout :
 * le rôle ouvrait la suppression définitive des photos, l'export complet
 * et le réglage des langues. Un rôle aussi large ne se confie à
 * personne — et de fait personne ne le portait, le seul compte qui
 * l'avait étant « La Régie », dont le hachage de mot de passe est « * »
 * et ne peut donc jamais valider. Séparer la portée est précisément ce
 * qui rend le rôle donnable.
 */
function admin_scope(?PDO $db = null): ?string {
    if (!empty($_SESSION['admin'])) return 'admin';

    $hdr = $_SERVER['HTTP_X_ADMIN_KEY'] ?? '';
    if ($hdr !== '' && defined('ADMIN_KEY') && ADMIN_KEY !== '' && hash_equals(ADMIN_KEY, $hdr)) {
        return 'admin';
    }
    if ($db) {
        $u = current_user($db);
        if ($u && $u['role'] === 'admin')     return 'admin';
        if ($u && $u['role'] === 'moderator') return 'moderator';
    }
    return null;
}

/**
 * Domaines fermés à la portée « moderator ». La valeur sert de motif
 * dans le refus : un modérateur qui bute sur une porte doit lire
 * pourquoi, pas un 403 muet.
 *
 * Ce qui est ici a un point commun : l'irréversible (suppression d'un
 * fichier), le global (les langues servies, l'export de toute la base)
 * et le méta (donner des droits). La modération courante — approuver,
 * rejeter, retirer, masquer — n'y figure pas : c'est le métier.
 */
const PORTEE_ADMIN_SEULEMENT = [
    'langues'         => 'le réglage des langues servies',
    'membres'         => 'la liste des comptes et l’attribution des rôles',
    'export'          => 'l’export de tous les établissements',
    'photo_supprimer' => 'la suppression définitive d’une photo',
];

/** Cette portée peut-elle agir sur ce domaine ? */
function portee_autorise(?string $scope, string $domaine): bool {
    if ($scope === null)    return false;
    if ($scope === 'admin') return true;
    return !isset(PORTEE_ADMIN_SEULEMENT[$domaine]);
}

/**
 * La requête peut-elle modérer ? Réponse par oui ou non, pour les
 * endroits qui n'ont pas besoin de savoir jusqu'où — admin_scope()
 * répond à cette seconde question.
 */
function is_admin_request(?PDO $db = null): bool {
    return admin_scope($db) !== null;
}

/** Jeton CSRF dédié aux formulaires de l'interface d'administration. */
function admin_csrf(): string {
    if (empty($_SESSION['admin_csrf'])) $_SESSION['admin_csrf'] = bin2hex(random_bytes(32));
    return $_SESSION['admin_csrf'];
}

function admin_csrf_valid(?string $sent): bool {
    return !empty($_SESSION['admin_csrf']) && is_string($sent)
        && hash_equals($_SESSION['admin_csrf'], $sent);
}

/** Version publique d'un utilisateur (jamais password_hash). */
function user_public(array $u): array {
    return [
        'id'             => (int)$u['id'],
        'email'          => $u['email'],
        'display_name'   => $u['display_name'],
        'role'           => $u['role'],
        'email_verified' => (bool)$u['email_verified'],
        'avatar_url'     => $u['avatar_url'] ?? null,
        'bio'            => $u['bio'] ?? null,
        'lang'           => $u['lang'] ?? null,
        // Migration 020. Absente d'une base pas encore migree : on
        // repond « oui », qui est la valeur par defaut de la colonne.
        'notify_forum'   => !array_key_exists('notify_forum', $u) || (bool)$u['notify_forum'],
    ];
}

// ── Limitation de débit (anti-brute-force) ────────────────
function rate_limit(PDO $db, string $action, int $max, int $windowSec): void {
    $ip = client_ip();
    try {
        $c = $db->prepare(
            "SELECT COUNT(*) FROM auth_attempts
             WHERE ip = ? AND action = ? AND created_at > DATE_SUB(NOW(), INTERVAL ? SECOND)"
        );
        $c->execute([$ip, $action, $windowSec]);
        if ((int)$c->fetchColumn() >= $max) {
            respond(err('rate_limited', 'Trop de tentatives. Réessayez dans quelques minutes.'), 429);
        }
        $db->prepare("INSERT INTO auth_attempts (ip, action) VALUES (?, ?)")->execute([$ip, $action]);
    } catch (Throwable $e) {
        // Table absente → ne pas bloquer l'utilisateur légitime
    }
}

// ── Validations ───────────────────────────────────────────
function valid_email(string $e): bool {
    return (bool)filter_var($e, FILTER_VALIDATE_EMAIL) && strlen($e) <= 190;
}

/** Mot de passe : au moins 8 caractères. Retourne un message d'erreur ou ''. */
function password_error(string $p): string {
    if (strlen($p) < 8)   return 'Le mot de passe doit contenir au moins 8 caractères.';
    if (strlen($p) > 200) return 'Mot de passe trop long.';
    return '';
}

// ── Langue de correspondance ──────────────────────────────
/**
 * Les langues que le site SAIT parler — celles dont i18n.js contient un
 * dictionnaire. Une valeur hors liste est ignorée.
 *
 * À ne pas confondre avec langues_actives() (backend/langues.php) : la
 * liste de celles effectivement proposées, réglée depuis
 * l'administration. On valide ce qu'on LIT sur la liste ci-dessous — un
 * message écrit dans une langue depuis fermée doit rester lisible — et
 * ce qu'on ÉCRIT sur langues_actives().
 */
function langues_site(): array {
    return langues_connues();
}

/**
 * Langue à retenir pour un nouveau compte.
 *
 * Cascade à trois niveaux, du plus fiable au plus général :
 *
 *   1. la langue dans laquelle la personne NAVIGUAIT en s'inscrivant.
 *      Ce n'est pas une déduction mais un choix — elle a cliqué son
 *      drapeau, ou est arrivée par /de/ ;
 *   2. l'en-tête Accept-Language du navigateur, envoyé gratuitement par
 *      tous, et qui reflète la langue du système ;
 *   3. le français.
 *
 * Déduire la langue du PAYS a été écarté : ce n'est pas une fonction
 * (Cameroun, Suisse, Belgique, Singapour en ont plusieurs), et obtenir
 * le pays aurait demandé une base GeoIP — la dépendance payante qu'on
 * voulait éviter. Voir migration 014.
 */
function langue_demandee(?string $souhaitee = null): string {
    // Un compte qui se crée écrit : on n'y inscrit qu'une langue servie.
    $ok = langues_actives();
    $l  = strtolower(trim((string)$souhaitee));
    if (in_array($l, $ok, true)) return $l;

    // Accept-Language : « fr-CH,fr;q=0.9,en;q=0.8 ». On ne garde que le
    // code primaire de chaque entrée, dans l'ordre d'arrivee — les
    // navigateurs les listent deja par preference decroissante.
    $hdr = (string)($_SERVER['HTTP_ACCEPT_LANGUAGE'] ?? '');
    foreach (explode(',', $hdr) as $morceau) {
        $code = strtolower(trim(explode('-', explode(';', $morceau)[0])[0]));
        if (in_array($code, $ok, true)) return $code;
    }
    return 'fr';
}

// ── URL du site (pour les liens email) ────────────────────
function site_url(): string {
    if (defined('SITE_URL') && SITE_URL) return rtrim(SITE_URL, '/');
    $scheme = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') ? 'https' : 'http';
    return $scheme . '://' . ($_SERVER['HTTP_HOST'] ?? 'thecigarodyssey.com');
}
