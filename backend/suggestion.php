<?php
// ════════════════════════════════════════════════════════
// suggestion.php — Recueillir les remarques, d'un membre
// ────────────────────────────────────────────────────────
// LE RÉGIME A CHANGÉ, ET LE COMMENTAIRE AVEC LUI. Cette boîte avait été
// faite SANS compte, à dessein : exiger une inscription puis une
// vérification d'email avant de pouvoir signaler un défaut, c'est n'en
// recueillir presque aucun — la personne qui vient de repérer une
// coquille ferme l'onglet plutôt que de s'inscrire.
//
// Le propriétaire du site a tranché dans l'autre sens. Ce qu'on perd :
// le retour du visiteur de passage, qui est justement celui qu'on ne
// peut obtenir autrement. Ce qu'on gagne : un interlocuteur
// identifiable, à qui l'on peut répondre.
//
// LE COMPTE DOIT ÊTRE VÉRIFIÉ, comme pour le forum et les avis
// (forum_membre dans forum.php). Un compte dont l'adresse n'a jamais
// été confirmée n'identifie personne : il s'ouvre en dix secondes avec
// une adresse inventée, et n'aurait donc rien apporté par rapport à
// l'anonymat qu'on vient de retirer.
//
// Ancien commentaire, conservé parce qu'il dit ce qui a été échangé :
//
// UN FORMULAIRE PUBLIC ANONYME EST UN AIMANT À SPAM. Trois freins,
// aucun ne gêne un visiteur de bonne foi :
//
//   plafond     3 envois par heure et par adresse IP — la vraie, celle
//               que le serveur constate (voir client_ip)
//   liens       AUCUN lien accepté. C'est ce qui coupe l'essentiel du
//               spam automatique, et un retour d'essai n'en a pas
//               besoin. Même doctrine que les cinq premiers messages du
//               forum.
//   longueurs   10 caractères au minimum — « test » n'est pas une
//               remarque — et 4 000 au plus.
//
// L'adresse électronique est FACULTATIVE. Elle ne sert qu'à répondre.
// L'exiger rendrait la boîte non anonyme, et la remplirait moins.
// ════════════════════════════════════════════════════════

require_once __DIR__ . '/config.php';
require_once __DIR__ . '/auth_lib.php';

auth_session_start();

header('Content-Type: application/json; charset=utf-8');
cors_headers(true);
header('Access-Control-Allow-Methods: POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, X-CSRF-Token');

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') { http_response_code(204); exit; }
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    respond(err('method_not_allowed', 'Méthode non autorisée'), 405);
}

csrf_verify();

$db = getDB();

/**
 * Un membre, et son adresse confirmée.
 *
 * Même règle que `forum_membre()` dans forum.php et que les avis :
 * écrire sur ce site engage une identité. `require_auth` rend 401 pour
 * qui n'est pas connecté, et le front sait ouvrir la fenêtre de
 * connexion sur ce code.
 */
$moi = require_auth($db);
if (empty($moi['email_verified'])) {
    respond(err('email_not_verified', 'Vérifiez votre email pour envoyer une remarque.',
                ['need_verify' => true]), 403);
}

const SUGG_MIN = 10;
const SUGG_MAX = 4000;

/**
 * Le texte contient-il un lien ?
 *
 * On cherche large — « http », « www. », et tout ce qui ressemble à un
 * domaine suivi d'une extension. Un faux positif est possible (« va sur
 * exemple.com ») et c'est assumé : le message dit pourquoi, et la
 * personne reformule. Laisser passer les liens, c'est recevoir dix
 * publicités par jour dans une boîte qu'on ne lira plus.
 */
function suggestion_contient_lien(string $t): bool {
    return (bool)preg_match('~(https?://|www\.|\b[a-z0-9-]+\.(com|net|org|ru|io|xyz|top|shop|info|biz)\b)~i', $t);
}

$body  = json_body();
$texte = trim((string)($body['texte'] ?? ''));
$page  = trim((string)($body['page']  ?? ''));
// L'ADRESSE NE VIENT PLUS DU FORMULAIRE. On la tient du compte, et un
// champ libre permettrait d'en déclarer une autre que la sienne — ce
// qui ferait dire à la fiche « écrit par X, joignable chez Y », sans
// qu'aucun des deux ne soit vérifié.
$email = (string)($moi['email'] ?? '');

// Champ leurre : invisible pour un humain, rempli par les robots qui
// remplissent tout. Coûte trois lignes, arrête beaucoup.
if (trim((string)($body['site'] ?? '')) !== '') {
    respond(['success' => true], 201);   // on ne dit pas au robot qu'il est repéré
}

if (mb_strlen($texte) < SUGG_MIN) {
    respond(err('suggestion_courte', 'Dites-nous un peu plus — au moins ' . SUGG_MIN . ' caractères.'), 400);
}
if (mb_strlen($texte) > SUGG_MAX) {
    respond(err('suggestion_longue', 'Message trop long (' . SUGG_MAX . ' caractères au plus).'), 400);
}
if (suggestion_contient_lien($texte)) {
    respond(err('suggestion_lien', 'Les liens ne sont pas acceptés ici. Décrivez plutôt où vous étiez sur le site.'), 400);
}
// LE PLAFOND VIENT APRÈS LES VALIDATIONS, et c'est délibéré.
//
// Placé avant, il se consommait sur les erreurs de saisie : trois
// messages trop courts, et la personne était bloquée une heure — sur
// des tentatives légitimes, qui n'ont rien écrit en base. Mesuré au
// premier essai du formulaire, où le quatrième envoi, valide celui-là,
// s'est fait refuser.
//
// Ici, seuls les envois RÉELS comptent. Une rafale de requêtes mal
// formées ne coûte rien : aucune écriture, et le jeton CSRF ferme déjà
// la porte aux robots les plus simples.
// LE PLAFOND PORTE SUR LE MEMBRE, ET PLUS SUR L'ADRESSE IP.
//
// `rate_limit()` compte par client_ip(). C'était le seul repère
// possible tant que la boîte était anonyme ; ce n'en est plus un
// maintenant qu'il faut un compte, et c'en était un mauvais : deux
// personnes derrière la même box — un couple, un bureau, un café —
// consommaient le même quota, tandis qu'un seul compte le contournait
// en changeant de réseau.
//
// On compte donc les envois DU MEMBRE sur l'heure écoulée. Le premier
// jet gardait les deux plafonds tout en écrivant ce commentaire : il
// aurait continué à pénaliser le voisin.
$q = $db->prepare("SELECT COUNT(*) FROM suggestions
                    WHERE user_id = ? AND created_at > (NOW() - INTERVAL 1 HOUR)");
$q->execute([(int)$moi['id']]);
if ((int)$q->fetchColumn() >= 3) {
    respond(err('rate_limited', 'Trois remarques par heure : revenez un peu plus tard.'), 429);
}

$db->prepare(
    "INSERT INTO suggestions (user_id, texte, email, page, lang, ip) VALUES (?,?,?,?,?,?)"
)->execute([
    (int)$moi['id'],
    $texte,
    $email !== '' ? $email : null,
    mb_substr($page, 0, 300) ?: null,
    // La langue n'est retenue que si le site la connaît : une valeur
    // venue du client ne doit pas entrer telle quelle en base.
    in_array((string)($body['lang'] ?? ''), langues_connues(), true)
        ? (string)$body['lang'] : null,
    client_ip(),
]);

respond(['success' => true, 'id' => (int)$db->lastInsertId()], 201);
