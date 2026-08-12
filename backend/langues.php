<?php
// ════════════════════════════════════════════════════════
// langues.php — Quelles langues le site sert-il ?
// ────────────────────────────────────────────────────────
// Deux listes, qu'il ne faut pas confondre :
//
//   langues_connues()  — les langues dont assets/js/i18n.js contient un
//                        dictionnaire. C'est une propriété du CODE ; y
//                        ajouter une entrée sans traduire ne servirait
//                        qu'une page vide. Cette liste ne bouge qu'avec
//                        une mise en ligne.
//
//   langues_actives()  — celles effectivement PROPOSÉES, cochées depuis
//                        l'administration (table site_languages,
//                        migration 019). Sous-ensemble de la première.
//
// Le français appartient toujours aux deux : c'est le repli de chaque
// traduction manquante, du serveur au front. Le décocher rendrait
// indéfini le contenu servi à qui n'a aucune des autres.
//
// ── Pourquoi un fichier de cache et non une requête ──────
// index.php répond sans toucher à la base ; c'est délibéré, et sa page
// mise en cache dépend de la liste. Une requête SQL par visite l'aurait
// défait pour un réglage qui change deux fois par an. La liste est donc
// recopiée dans cache/langues.json à chaque enregistrement, et lue là.
// Sa DATE DE MODIFICATION entre dans l'empreinte du cache de page :
// cocher une langue invalide les pages sans code supplémentaire — le
// même mécanisme que pour un CSS modifié.
//
// La base reste la référence : si le fichier manque (déploiement
// neuf, cache vidé), on la relit et on le réécrit.
// ════════════════════════════════════════════════════════

require_once __DIR__ . '/config.php';

/**
 * Fichier de cache de la liste active.
 *
 * Le nom de la BASE entre dans le nom du fichier : le serveur de test
 * et le serveur de développement tournent sur le même arbre de
 * fichiers, donc le même dossier de cache. Sans cette distinction, un
 * réglage fait à la main dans l'administration décidait de ce que les
 * tests observent — et l'inverse.
 */
function langues_fichier(): string {
    $base = preg_replace('/[^A-Za-z0-9_]/', '_', (string)DB_NAME);
    return __DIR__ . '/cache/langues_' . $base . '.json';
}

/**
 * Les langues dont le site possède les traductions, dans l'ordre
 * d'affichage. Le français en tête : c'est le repli.
 */
function langues_connues(): array {
    return ['fr', 'en', 'es', 'de', 'zh', 'ar'];
}

/**
 * Ramène une liste quelconque à des codes connus, ordonnés, sans
 * doublon, français compris d'office.
 */
function langues_normaliser(array $codes): array {
    $demande = array_map(fn($c) => strtolower(trim((string)$c)), $codes);
    $out = array_values(array_filter(
        langues_connues(),
        fn($l) => $l === 'fr' || in_array($l, $demande, true)
    ));
    return $out;
}

/** Les langues servies aux visiteurs. */
function langues_actives(): array {
    static $memo = null;
    if ($memo !== null) return $memo;

    $f = langues_fichier();
    if (is_file($f)) {
        $d = json_decode((string)file_get_contents($f), true);
        if (is_array($d)) return $memo = langues_normaliser($d);
    }
    return $memo = langues_recharger();
}

/**
 * Relit la base et réécrit le fichier de cache.
 *
 * Base injoignable ou table absente (avant la migration 019) : on sert
 * les six. Fermer le site parce qu'une table manque serait une panne
 * bien plus grave que le réglage qu'elle porte.
 */
function langues_recharger(): array {
    $codes = langues_connues();
    try {
        $rows = getDB()->query("SELECT code FROM site_languages WHERE is_active = 1")
                       ->fetchAll(PDO::FETCH_COLUMN);
        if ($rows) $codes = $rows;
    } catch (Throwable $e) {
        // On garde les six.
    }
    $codes = langues_normaliser($codes);
    $f = langues_fichier();
    if (!is_dir(dirname($f))) @mkdir(dirname($f), 0755, true);
    @file_put_contents($f, json_encode($codes));
    return $codes;
}

/**
 * Langue d'un contenu qu'on écrit MAINTENANT.
 *
 * Distincte de la lecture : un message déjà publié dans une langue
 * depuis fermée reste lisible et gardera son code, mais on n'en écrit
 * plus de nouveau dedans. Le repli sert à la langue du compte, qui a pu
 * être choisie avant la fermeture.
 */
function langue_ecriture(?string $demandee, ?string $repli = null): string {
    $actives = langues_actives();
    foreach ([$demandee, $repli] as $c) {
        $c = strtolower(trim((string)$c));
        if (in_array($c, $actives, true)) return $c;
    }
    return 'fr';
}

/**
 * Enregistre la sélection de l'administration.
 *
 * Écrit les six lignes à chaque fois plutôt que les seules cochées :
 * une langue absente de la table serait indistinguable d'une langue
 * ajoutée au code après coup, et se retrouverait active par le repli
 * de langues_recharger().
 */
function langues_definir(PDO $db, array $codes): array {
    $actives = langues_normaliser($codes);
    $q = $db->prepare(
        "INSERT INTO site_languages (code, is_active) VALUES (?, ?)
         ON DUPLICATE KEY UPDATE is_active = VALUES(is_active)"
    );
    foreach (langues_connues() as $l) {
        $q->execute([$l, in_array($l, $actives, true) ? 1 : 0]);
    }
    $f = langues_fichier();
    if (!is_dir(dirname($f))) @mkdir(dirname($f), 0755, true);
    @file_put_contents($f, json_encode($actives));
    langues_purger_pages();
    return $actives;
}

/**
 * Jette les pages d'accueil en cache.
 *
 * index.php compare la date de sa page mise en cache à celle de ses
 * sources, dont ce réglage — mais filemtime() a la SECONDE pour unité.
 * Enregistrer et servir dans la même seconde laissait passer la page
 * précédente, avec ses six drapeaux. Un cas rare, sauf au moment
 * précis où l'on vérifie que le réglage marche.
 *
 * On efface donc plutôt que de dater : la page suivante se reconstruit.
 * C'est six fichiers, et l'occasion se présente deux fois par an.
 */
function langues_purger_pages(): void {
    foreach (glob(__DIR__ . '/cache/page_*.html') ?: [] as $p) @unlink($p);
}
