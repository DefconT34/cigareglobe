<?php
// ════════════════════════════════════════════════════════
// suggestion.php — Recueillir les remarques, sans compte
// ────────────────────────────────────────────────────────
// Le site est en ligne mais en phase d'essai. Ce qu'il faut recueillir
// maintenant vient de gens qui n'ont pas de compte et n'en veulent pas :
// exiger une inscription puis une vérification d'email avant de pouvoir
// signaler un défaut, c'est n'en recueillir aucun.
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

$db = getDB();

$body  = json_body();
$texte = trim((string)($body['texte'] ?? ''));
$email = trim((string)($body['email'] ?? ''));
$page  = trim((string)($body['page']  ?? ''));

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
if ($email !== '' && !valid_email($email)) {
    respond(err('email_invalid', 'Adresse email invalide.'), 400);
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
rate_limit($db, 'suggestion', 3, 3600);

$db->prepare(
    "INSERT INTO suggestions (texte, email, page, lang, ip) VALUES (?,?,?,?,?)"
)->execute([
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
