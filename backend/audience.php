<?php
// ════════════════════════════════════════════════════════
// backend/audience.php — Savoir si quelqu'un vient
// ────────────────────────────────────────────────────────
// Une mesure de PREMIÈRE MAIN : pas de cookie, pas de tiers, pas de
// bannière de consentement. Le portique d'âge de ce site a fixé la
// doctrine — « pas une ligne de plus dans une bannière » — et un
// mouchard tiers l'aurait défaite pour compter des visiteurs qu'on
// n'a pas encore.
//
// ── LA RÈGLE ABSOLUE DE CE FICHIER ──────────────────────
// IL NE DOIT JAMAIS FAIRE ÉCHOUER UNE PAGE. Une mesure qui casse le
// site qu'elle mesure est pire que pas de mesure du tout : tout est
// enveloppé, et le moindre incident est avalé en silence. Une fiche
// doit se servir même si la table `audience` n'existe pas.
//
// ── CE QU'ON N'ENREGISTRE PAS ───────────────────────────
// Aucune adresse IP, aucun user-agent complet, aucun cookie. Du
// référent, on ne garde que le DOMAINE : `google.com`, jamais l'URL de
// recherche, qui porterait la requête de quelqu'un.
// ════════════════════════════════════════════════════════

require_once __DIR__ . '/config.php';
require_once __DIR__ . '/auth_lib.php';   // client_ip()

/**
 * Le domaine d'un référent, et rien d'autre.
 *
 * Une URL de résultats de recherche contient la requête tapée — donc
 * potentiellement un nom, une adresse, une intention. On la jette.
 * Le domaine seul répond à la question posée : d'où viennent-ils ?
 */
function audience_domaine(?string $referent): ?string {
    $referent = trim((string)$referent);
    if ($referent === '') return null;
    $hote = parse_url($referent, PHP_URL_HOST);
    if (!is_string($hote) || $hote === '') return null;
    $hote = strtolower(preg_replace('/^www\./', '', $hote));
    // Un référent interne n'apprend rien sur l'acquisition.
    $moi = strtolower(preg_replace('/^www\./', '',
        (string)parse_url((string)env('SITE_URL', ''), PHP_URL_HOST)));
    if ($moi !== '' && $hote === $moi) return null;
    return mb_substr($hote, 0, 120);
}

/**
 * Robot ou personne ?
 *
 * SANS CE PARTAGE, LES CHIFFRES MENTENT. Un site neuf reçoit surtout
 * des explorateurs : Googlebot, Bingbot, les aspirateurs SEO, les
 * aperçus de messagerie. Les compter avec les lecteurs donnerait une
 * courbe flatteuse et fausse.
 *
 * La détection est volontairement grossière — un robot qui se déguise
 * passera. On ne cherche pas à les attraper tous : on cherche à ne pas
 * confondre la moitié du trafic avec un public.
 */
function audience_robot(?string $ua): bool {
    $ua = strtolower(trim((string)$ua));
    if ($ua === '') return true;   // pas d'agent : pas un navigateur
    static $motifs = [
        'bot', 'crawl', 'spider', 'slurp', 'archiver', 'monitor', 'preview',
        'facebookexternalhit', 'whatsapp', 'telegram', 'discord', 'skype',
        'headless', 'phantom', 'curl/', 'wget', 'python-requests', 'httpx',
        'go-http-client', 'java/', 'okhttp', 'scrapy', 'ahrefs', 'semrush',
        'mj12', 'dotbot', 'petalbot', 'dataprovider', 'lighthouse',
    ];
    foreach ($motifs as $m) if (str_contains($ua, $m)) return true;
    return false;
}

/**
 * Douze caractères qui distinguent sans identifier.
 *
 * Le sel dérive d'ADMIN_KEY ET DE LA DATE. Trois conséquences, et ce
 * sont elles qui rendent le procédé acceptable :
 *
 *   · irréversible : on ne remonte pas à l'IP depuis l'empreinte ;
 *   · non corrélable : le sel change à minuit, donc deux jours ne se
 *     recoupent pas — on ne suit personne dans le temps ;
 *   · inutile volée : sans ADMIN_KEY, la table ne dit rien.
 *
 * Sans ADMIN_KEY, on rend null : mieux vaut compter des pages sans
 * pouvoir compter des personnes que fabriquer une empreinte prévisible.
 */
function audience_empreinte(string $ip, string $ua, string $jour): ?string {
    $cle = (string)ADMIN_KEY;
    if ($cle === '') return null;
    return substr(hash('sha256', hash('sha256', $cle . '|' . $jour) . '|' . $ip . '|' . $ua), 0, 12);
}

/**
 * Noter une vue. N'échoue jamais, ne parle jamais.
 */
function audience_noter(?PDO $db, string $type, string $chemin, string $lang): void {
    if (!$db instanceof PDO) return;
    try {
        // Les requêtes de contrôle et les préchargements ne sont pas des
        // visites : on ne compte que ce qu'un lecteur demande vraiment.
        $methode = strtoupper((string)($_SERVER['REQUEST_METHOD'] ?? 'GET'));
        if ($methode !== 'GET') return;
        $but = strtolower((string)($_SERVER['HTTP_SEC_PURPOSE'] ?? $_SERVER['HTTP_PURPOSE'] ?? ''));
        if (str_contains($but, 'prefetch') || str_contains($but, 'preview')) return;

        $ua   = (string)($_SERVER['HTTP_USER_AGENT'] ?? '');
        $jour = date('Y-m-d');
        $ip   = function_exists('client_ip') ? client_ip() : '';

        $q = $db->prepare(
            "INSERT INTO `audience`
                (`vu_le`, `jour`, `type`, `chemin`, `lang`, `referent`, `robot`, `empreinte`)
             VALUES (NOW(), ?, ?, ?, ?, ?, ?, ?)");
        $q->execute([
            $jour,
            mb_substr($type, 0, 24),
            mb_substr($chemin, 0, 255),
            mb_substr($lang, 0, 2),
            audience_domaine($_SERVER['HTTP_REFERER'] ?? null),
            audience_robot($ua) ? 1 : 0,
            audience_empreinte($ip, $ua, $jour),
        ]);
    } catch (Throwable $e) {
        // Silence volontaire. Voir l'en-tête : la mesure ne casse pas
        // la page qu'elle mesure.
    }
}

// ════════════════════════════════════════════════════════
// LA LECTURE — une seule implémentation, deux affichages
// ────────────────────────────────────────────────────────
// Ces fonctions servent À LA FOIS `tools/audience.php` (le terminal) et
// l'onglet Audience de `backend/admin.php` (le navigateur).
//
// POURQUOI PAS DEUX JEUX DE REQUÊTES. Ce dépôt s'interdit les doubles
// implémentations depuis longtemps — une seule fabrique d'adresses, un
// seul portique d'âge — et pour une raison précise : deux fabriques
// finissent toujours par diverger. Ici, la divergence donnerait deux
// chiffres différents pour la même question, sans qu'on sache lequel
// croire. C'est pire que pas de mesure.
//
// ⚠ LA FENÊTRE EST INSÉRÉE DANS LE SQL, ET C'EST VOULU. Un paramètre
// lié dans `INTERVAL ? DAY` ne se comporte pas pareil sur MySQL et sur
// MariaDB : la première version de ce rapport mourait sur le serveur
// après avoir imprimé son en-tête, sans un mot. La valeur passe donc
// par audience_jours(), qui la borne et la convertit en entier — rien
// de ce qui vient de l'extérieur n'atteint la requête.
// ════════════════════════════════════════════════════════

/** Une fenêtre de lecture sûre : entre 1 et 365 jours, toujours entière. */
function audience_jours(mixed $n): int {
    return max(1, min(365, (int)$n));
}

/** La table existe-t-elle ? Une base d'avant la migration 203 n'en a pas. */
function audience_prete(?PDO $db): bool {
    if (!$db instanceof PDO) return false;
    try { $db->query("SELECT 1 FROM `audience` LIMIT 1"); return true; }
    catch (Throwable $e) { return false; }
}

/** Les quatre chiffres du haut. */
function audience_resume(PDO $db, int $jours): array {
    $j = audience_jours($jours);
    $h = $db->query(
        "SELECT COUNT(*) AS vues,
                COUNT(DISTINCT `empreinte`) AS visiteurs,
                COUNT(DISTINCT `jour`) AS jours_actifs
           FROM `audience`
          WHERE `robot` = 0 AND `jour` >= (CURDATE() - INTERVAL $j DAY)")
        ->fetch(PDO::FETCH_ASSOC) ?: [];
    $robots = (int)$db->query(
        "SELECT COUNT(*) FROM `audience`
          WHERE `robot` = 1 AND `jour` >= (CURDATE() - INTERVAL $j DAY)")->fetchColumn();
    return [
        'vues'         => (int)($h['vues'] ?? 0),
        'visiteurs'    => (int)($h['visiteurs'] ?? 0),
        'jours_actifs' => (int)($h['jours_actifs'] ?? 0),
        'robots'       => $robots,
    ];
}

/**
 * Un classement : pages, référents, langues, ou ce que lisent les robots.
 *
 * Le nom de la vue vient d'une LISTE FERMÉE, jamais de l'appelant : ni
 * l'URL de l'administration ni la ligne de commande n'écrivent de SQL.
 */
function audience_classement(PDO $db, int $jours, string $quoi, int $limite = 12): array {
    $j = audience_jours($jours);
    $l = max(1, min(100, $limite));
    $vues = [
        'pages'     => ["CONCAT(`type`, ' · ', `chemin`)", 0],
        'referents' => ["COALESCE(`referent`, '(acces direct ou inconnu)')", 0],
        'langues'   => ["`lang`", 0],
        'robots'    => ["CONCAT(`type`, ' · ', `chemin`)", 1],
    ];
    if (!isset($vues[$quoi])) return [];
    [$expr, $robot] = $vues[$quoi];
    $q = $db->query(
        "SELECT $expr AS k, COUNT(*) AS n
           FROM `audience`
          WHERE `robot` = $robot AND `jour` >= (CURDATE() - INTERVAL $j DAY)
       GROUP BY k ORDER BY n DESC, k ASC LIMIT $l");
    return $q->fetchAll(PDO::FETCH_ASSOC);
}
