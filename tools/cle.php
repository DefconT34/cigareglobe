<?php
// ════════════════════════════════════════════════════════
// tools/cle.php — Engendrer la clé d'administration
// ────────────────────────────────────────────────────────
// POURQUOI UN OUTIL POUR TROIS LIGNES
//
// `ADMIN_KEY` ouvre TOUT : le réglage des langues, l'écran des membres
// et l'attribution des rôles, l'export de tous les établissements, la
// suppression définitive des photos. C'est la seule chose du site qui
// n'a ni second facteur ni journal d'échecs.
//
// Une clé choisie à la main est une clé courte, mémorisable, et donc
// devinable. Celle-ci vient de random_bytes() — le générateur
// cryptographique du système, pas rand().
//
// ELLE NE S'AFFICHE PAS QUAND ON LA POSE
// `--poser` l'écrit directement dans le `.env` et n'en montre qu'une
// empreinte. Un secret qui passe par un terminal se retrouve dans
// l'historique du shell, dans les journaux de session, et dans tout ce
// qui enregistre l'écran. Quand personne n'a besoin de le LIRE, il n'y
// a aucune raison de l'écrire quelque part.
//
// USAGE
//   php tools/cle.php            affiche une clé neuve (à copier)
//   php tools/cle.php --poser    l'écrit dans .env, sans l'afficher
//
// Sur le serveur, la première forme : on copie la clé dans son
// gestionnaire de mots de passe, puis dans le `.env` de production.
// ════════════════════════════════════════════════════════

if (PHP_SAPI !== 'cli' && !defined('CLE_INCLUDE')) { http_response_code(404); exit; }

const CLE_OCTETS  = 24;                       // 24 octets → 48 caractères hex
const CLE_FICHIER = __DIR__ . '/../.env';

/** Une clé neuve. 48 caractères hexadécimaux, soit 192 bits d'entropie. */
function cle_engendrer(): string {
    return bin2hex(random_bytes(CLE_OCTETS));
}

/**
 * Empreinte courte d'un secret, pour pouvoir en PARLER sans le dire.
 * Sert à vérifier que la clé du `.env` est bien celle du gestionnaire
 * de mots de passe, sans afficher ni l'une ni l'autre.
 */
function cle_empreinte(string $cle): string {
    return substr(hash('sha256', $cle), 0, 12);
}

/**
 * Remplace la valeur d'ADMIN_KEY dans le `.env`, en place.
 *
 * Le reste du fichier n'est pas réécrit : commentaires, ordre des
 * lignes et valeurs voisines restent tels quels. Un `.env` réengendré
 * perdrait les commentaires qui expliquent pourquoi telle valeur est là.
 *
 * @return array{0:bool,1:string} succès, et message
 */
function cle_poser(string $chemin, string $cle): array {
    if (!is_file($chemin)) return [false, "$chemin est introuvable."];

    $lignes = file($chemin, FILE_IGNORE_NEW_LINES);
    if ($lignes === false) return [false, "$chemin est illisible."];

    $trouve = false;
    foreach ($lignes as $i => $l) {
        if (preg_match('/^\s*ADMIN_KEY\s*=/', $l)) {
            $lignes[$i] = 'ADMIN_KEY=' . $cle;
            $trouve = true;
            break;                            // la première fait foi, comme le chargeur
        }
    }
    if (!$trouve) $lignes[] = 'ADMIN_KEY=' . $cle;

    // Écriture atomique : un `.env` tronqué par une coupure au mauvais
    // moment laisserait le site sans accès d'administration.
    $tmp = $chemin . '.tmp';
    if (file_put_contents($tmp, implode("\n", $lignes) . "\n") === false) {
        return [false, "écriture impossible dans $tmp"];
    }
    if (!rename($tmp, $chemin)) {
        @unlink($tmp);
        return [false, "remplacement impossible de $chemin"];
    }
    return [true, $trouve ? 'ADMIN_KEY remplacée' : 'ADMIN_KEY ajoutée'];
}

// ── Ligne de commande ────────────────────────────────────
if (PHP_SAPI === 'cli' && !defined('CLE_INCLUDE')) {
    $cle = cle_engendrer();

    if (!in_array('--poser', $argv, true)) {
        echo $cle, "\n";
        fwrite(STDERR, "\n" . str_repeat('─', 58) . "\n"
            . "  " . strlen($cle) . " caracteres. A ranger dans un gestionnaire de mots\n"
            . "  de passe AVANT de la coller dans le .env : elle ne se\n"
            . "  retrouve pas, elle se remplace.\n"
            . "  Empreinte : " . cle_empreinte($cle) . "\n"
            . str_repeat('─', 58) . "\n");
        exit(0);
    }

    [$ok, $msg] = cle_poser(CLE_FICHIER, $cle);
    if (!$ok) { fwrite(STDERR, "Echec : $msg\n"); exit(1); }

    printf("%s dans %s\n", $msg, realpath(CLE_FICHIER));
    printf("  longueur  %d caracteres\n", strlen($cle));
    printf("  empreinte %s\n", cle_empreinte($cle));
    echo   "  La cle elle-meme n'est pas affichee. Pour la lire :\n"
         . "    Select-String -Path .env -Pattern '^ADMIN_KEY='\n";
    exit(0);
}
