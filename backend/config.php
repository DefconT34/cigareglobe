<?php
// ════════════════════════════════════════════════════════
// config.php — Configuration CigarOdyssey
// ────────────────────────────────────────────────────────
// Ce fichier ne contient AUCUN secret : il lit les accès depuis
// le fichier .env (à la racine du projet, ignoré par Git).
// Modèle : .env.example → copier vers .env et renseigner.
// ════════════════════════════════════════════════════════

// ── Chargeur .env minimal ─────────────────────────────────
(function () {
    $path = __DIR__ . '/../.env';
    if (!is_file($path)) return;
    foreach (file($path, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES) as $line) {
        $line = trim($line);
        if ($line === '' || $line[0] === '#') continue;
        $pos = strpos($line, '=');
        if ($pos === false) continue;
        $k = trim(substr($line, 0, $pos));
        $v = trim(substr($line, $pos + 1));
        // Retirer les guillemets englobants
        if (strlen($v) >= 2 && ($v[0] === '"' || $v[0] === "'") && substr($v, -1) === $v[0]) {
            $v = substr($v, 1, -1);
        }
        // Une variable d'environnement réelle est prioritaire sur le .env
        // (convention dotenv). Permet par exemple de viser une base de test :
        //   DB_NAME=cigarodyssey_test php tests/run.php
        if (getenv($k) !== false) continue;
        $_ENV[$k] = $v;
        putenv("$k=$v");
    }
})();

function env(string $key, ?string $default = null): ?string {
    $v = $_ENV[$key] ?? getenv($key);
    return ($v === false || $v === null || $v === '') ? $default : $v;
}

// ── Base de données ───────────────────────────────────────
define('DB_HOST',    env('DB_HOST', 'localhost'));
define('DB_PORT',    env('DB_PORT', '3306'));
define('DB_NAME',    env('DB_NAME', ''));
define('DB_USER',    env('DB_USER', ''));
define('DB_PASS',    env('DB_PASS', ''));
define('DB_CHARSET', env('DB_CHARSET', 'utf8mb4'));

// ── Seuils de vote ────────────────────────────────────────
define('VOTES_TO_APPROVE', (int)env('VOTES_TO_APPROVE', '3'));
define('VOTES_TO_REJECT',  (int)env('VOTES_TO_REJECT',  '3'));

// Nombre de contributions approuvées à partir duquel un membre devient
// « contributeur de confiance » (ses ajouts sont ensuite publiés directement).
define('TRUSTED_AFTER_APPROVED', (int)env('TRUSTED_AFTER_APPROVED', '5'));

// ── Administration ────────────────────────────────────────
define('ADMIN_KEY',   env('ADMIN_KEY', ''));
define('ADMIN_EMAIL', env('ADMIN_EMAIL', 'vous@example.com'));

// ── Proxys de confiance ───────────────────────────────────
// Adresses ou plages CIDR des machines autorisees a DIRE quelle est
// l'adresse du visiteur (X-Forwarded-For, X-Real-IP, CF-Connecting-IP).
// Separees par des virgules.
//
// VIDE PAR DEFAUT, ET C'EST LE BON REGLAGE quand le site est servi en
// direct : sans reverse-proxy devant, ces en-tetes ne peuvent venir que
// du visiteur lui-meme, donc de quelqu'un qui choisit ce qu'il y ecrit.
// Voir client_ip() dans auth_lib.php pour ce que cela changeait.
//
// A renseigner UNIQUEMENT si un proxy est reellement en place — par
// exemple les plages de Cloudflare, ou '127.0.0.1' derriere un nginx
// local. Une valeur trop large rouvre exactement le trou qu'elle ferme.
define('TRUSTED_PROXIES', (string)env('TRUSTED_PROXIES', ''));

// ── Diagnostic ────────────────────────────────────────────
// true = les messages d'erreur techniques sont renvoyes au client.
// A n'activer QU'EN DEVELOPPEMENT.
if (strtolower((string)env('APP_DEBUG', 'false')) === 'true') define('APP_DEBUG', true);

// ── CORS ──────────────────────────────────────────────────
// Une ou plusieurs origines separees par des virgules, ou « * ».
// En production, le domaine nu et le sous-domaine www sont DEUX
// origines distinctes : declarer les deux si les deux repondent.
define('ALLOWED_ORIGIN', env('ALLOWED_ORIGIN', '*'));

/** Liste des origines autorisees, normalisees (sans barre finale). */
function allowed_origins(): array {
    static $liste = null;
    if ($liste !== null) return $liste;
    $liste = [];
    foreach (explode(',', (string)ALLOWED_ORIGIN) as $o) {
        $o = rtrim(trim($o), '/');
        if ($o !== '') $liste[] = $o;
    }
    return $liste;
}

/**
 * En-tetes CORS.
 *
 * Deux regles tiennent tout le reste :
 *
 *  - « Allow-Origin: * » et « Allow-Credentials: true » ne peuvent pas
 *    coexister : les navigateurs rejettent la reponse. Les requetes
 *    porteuses de cookies exigent donc une origine nommee.
 *  - une origine n'est renvoyee que si elle figure dans la liste, apres
 *    comparaison exacte. Refleter l'Origin recue sans la verifier
 *    reviendrait a autoriser n'importe quel site a lire des reponses
 *    authentifiees au nom du visiteur.
 *
 * Origine inconnue : aucun en-tete Allow-Origin. Le navigateur bloque
 * la lecture, ce qui est le comportement voulu.
 */
function cors_headers(bool $with_credentials = false): void {
    $origin  = rtrim($_SERVER['HTTP_ORIGIN'] ?? '', '/');
    $permis  = allowed_origins();
    $ouvert  = in_array('*', $permis, true);

    // La reponse depend de l'origine appelante : les caches doivent le
    // savoir, y compris quand aucune origine n'est finalement autorisee.
    if (!$ouvert || $with_credentials) header('Vary: Origin');

    if ($ouvert) {
        // Developpement. Le front et l'API etant servis ensemble, on
        // renvoie l'origine appelante quand un cookie est necessaire —
        // uniquement si elle correspond a l'hote courant.
        if ($with_credentials && $origin !== '') {
            $host = $_SERVER['HTTP_HOST'] ?? '';
            if ($host !== '' && parse_url($origin, PHP_URL_HOST) === explode(':', $host)[0]) {
                header('Access-Control-Allow-Origin: ' . $origin);
                header('Access-Control-Allow-Credentials: true');
                return;
            }
        }
        header('Access-Control-Allow-Origin: *');
        return;
    }

    if ($origin !== '' && in_array($origin, $permis, true)) {
        header('Access-Control-Allow-Origin: ' . $origin);
        if ($with_credentials) header('Access-Control-Allow-Credentials: true');
        return;
    }

    // Requete sans en-tete Origin (navigation directe, appel serveur a
    // serveur, meme origine) : rien a declarer, la reponse part telle
    // quelle. Une origine etrangere, elle, repart sans autorisation.
    if ($origin === '' && !$with_credentials) {
        header('Access-Control-Allow-Origin: ' . $permis[0]);
    }
}

// ── Espace client / emails ────────────────────────────────
if (env('SITE_URL') !== null)       define('SITE_URL',       env('SITE_URL'));
define('MAIL_FROM',      env('MAIL_FROM', 'noreply@thecigarodyssey.com'));
define('MAIL_FROM_NAME', env('MAIL_FROM_NAME', 'CigarOdyssey'));
if (strtolower((string)env('MAIL_LOG_ONLY', 'false')) === 'true') define('MAIL_LOG_ONLY', true);
if (strtolower((string)env('MAIL_DEBUG',    'false')) === 'true') define('MAIL_DEBUG', true);

// Transport : log | mail | brevo | mailgun | resend (voir docs/emails.md).
// Les pilotes HTTP signent en DKIM et portent la reputation d'envoi ;
// mail() reste le repli et n'est pas recommande en production.
define('MAIL_DRIVER',    strtolower((string)env('MAIL_DRIVER', 'mail')));
define('MAIL_API_KEY',   (string)env('MAIL_API_KEY', ''));
define('MAIL_REPLY_TO',  (string)env('MAIL_REPLY_TO', ''));
define('MAILGUN_DOMAIN', (string)env('MAILGUN_DOMAIN', ''));
define('MAILGUN_HOST',   (string)env('MAILGUN_HOST', 'api.mailgun.net'));
define('MAIL_TIMEOUT',   (int)env('MAIL_TIMEOUT', 10));

/**
 * Corps d'une reponse d'erreur : un CODE stable et un message francais.
 *
 * Le serveur ne traduit pas. Le front lit le code et cherche la cle
 * « err_<code> » dans i18n.js ; a defaut, il affiche le message tel
 * quel. Les traductions restent ainsi dans un seul fichier, et ajouter
 * une langue ne demande aucune modification du back.
 *
 * Le message reste indispensable : il sert de repli, il documente le
 * code a la lecture, et il reste lisible pour un appel direct a l'API.
 *
 *   respond(err('email_taken', 'Un compte existe deja avec cet email.'), 409);
 */
function err(string $code, string $message, array $extra = []): array {
    return array_merge(['error' => $message, 'code' => $code], $extra);
}

// ── Connexion PDO ─────────────────────────────────────────
function getDB(): PDO {
    static $pdo = null;
    if ($pdo !== null) return $pdo;

    $dsn = sprintf(
        'mysql:host=%s;port=%s;dbname=%s;charset=%s',
        DB_HOST, DB_PORT, DB_NAME, DB_CHARSET
    );

    try {
        $pdo = new PDO($dsn, DB_USER, DB_PASS, [
            PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES   => false,
            PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8mb4 COLLATE utf8mb4_unicode_ci",
        ]);
    } catch (PDOException $e) {
        http_response_code(500);
        header('Content-Type: application/json');
        echo json_encode(['error' => 'Connexion base de données impossible.']);
        exit;
    }

    return $pdo;
}

/* ════════════════════════════════════════════════════════
 * La politique de cache d'une réponse
 * ────────────────────────────────────────────────────────
 * CE QUE CES TROIS FONCTIONS RÉPARENT. `mod_expires`, dans le
 * `.htaccess`, pose sa propre durée par type de contenu. Il ne REMPLACE
 * pas celle de l'application : il AJOUTE la sienne. Mesuré en
 * production, une page servie par PHP répondait
 *
 *     Cache-Control: public, max-age=300,max-age=3600
 *
 * deux directives contradictoires dans un même en-tête, où la seconde
 * vient d'Apache et la première de l'intention du code. Selon le cache
 * qui la lit, une correction restait invisible cinq minutes ou une
 * heure. Le JSON du globe portait de même « no-cache, max-age=300 ».
 *
 * LA SORTIE N'EST PAS DE RETIRER LA RÈGLE D'APACHE — elle sert aux
 * fichiers statiques, qui n'ont personne pour parler à leur place, et
 * `.htaccess` a déjà mis ce site à terre une fois. C'est que
 * `mod_expires` S'ABSTIENT lorsque la réponse porte déjà un `Expires`.
 * Vérifié plutôt que supposé : `admin.php`, qui ouvre une session PHP
 * (laquelle pose `Expires: Thu, 19 Nov 1981`), n'a jamais reçu de
 * `max-age` surnuméraire. Les points authentifiés étaient donc déjà
 * protégés ; seules les réponses publiques ne l'étaient pas.
 *
 * Poser les deux en-têtes ensemble est donc la condition pour que le
 * code garde la main. D'où ces fonctions : pour qu'on ne puisse plus
 * poser l'un en oubliant l'autre.
 * ════════════════════════════════════════════════════════ */

/** Une date HTTP, telle que la veut la RFC 9110 (toujours en GMT). */
function cache_date(int $horodatage): string {
    return gmdate('D, d M Y H:i:s', $horodatage) . ' GMT';
}

/** Réponse publique, réutilisable telle quelle pendant N secondes. */
function cache_public(int $secondes): void {
    header('Cache-Control: public, max-age=' . $secondes);
    header('Expires: ' . cache_date(time() + $secondes));
}

/**
 * Réponse mise en cache mais revalidée à chaque usage.
 *
 * « no-cache » n'interdit pas de garder : il impose de redemander. Le
 * bon réglage pour une réponse qui dépend d'un paramètre (la langue) et
 * qu'on veut voir changer dès qu'elle change.
 */
function cache_revalider(): void {
    header('Cache-Control: no-cache');
    header('Expires: ' . cache_date(0));
}

/** Réponse qu'aucun cache ne doit garder. */
function cache_jamais(): void {
    header('Cache-Control: no-store');
    header('Expires: ' . cache_date(0));
}
