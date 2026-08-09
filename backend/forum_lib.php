<?php
// ════════════════════════════════════════════════════════
// forum_lib.php — Logique de l'espace communautaire
// ────────────────────────────────────────────────────────
// Tout ce qui n'est pas du transport HTTP vit ici : mise en forme des
// messages, étiquettes, plafonds anti-abus, seuil de masquage. Les
// endpoints (forum.php) et l'écran de modération (admin.php) s'appuient
// dessus, et les tests l'appellent directement.
//
// Cahier des charges : docs/communaute.md
// ════════════════════════════════════════════════════════

require_once __DIR__ . '/config.php';
require_once __DIR__ . '/auth_lib.php';

// ── Plafonds ────────────────────────────────────────────
// Les valeurs viennent du §8 du cahier des charges. Un contributeur de
// confiance les voit triplés : il a déjà fait ses preuves ailleurs sur
// le site, et c'est le même seuil qui lui ouvre la publication directe
// des établissements.
const FORUM_SUJETS_JOUR   = 3;
const FORUM_MESSAGES_JOUR = 30;
const FORUM_DELAI_S       = 30;    // entre deux messages du même compte
const FORUM_SEUIL_FLAGS   = 3;     // signalements distincts → masquage
const FORUM_LIENS_APRES   = 5;     // pas de lien externe avant N messages
const FORUM_EDIT_MINUTES  = 30;

/** Un contributeur de confiance (ou plus) écrit sans les mêmes freins. */
function forum_de_confiance(array $u): bool {
    return in_array($u['role'] ?? 'member', ['trusted', 'moderator', 'admin'], true);
}

// ════════════════════════════════════════════════════════
// MISE EN FORME
// ════════════════════════════════════════════════════════

/**
 * Rend un message en HTML sûr.
 *
 * L'ORDRE EST LA SÉCURITÉ : on échappe TOUT d'abord, puis on réintroduit
 * une poignée de balises choisies. L'inverse — mettre en forme puis
 * essayer de nettoyer — est la façon dont on écrit une faille XSS ; c'est
 * exactement le défaut corrigé en A3, et on ne le refait pas ici.
 *
 * Le message est stocké BRUT en base. Ce qui est stocké échappé ne peut
 * plus être ré-analysé, ni ré-échappé correctement le jour où le rendu
 * change — et un texte doublement échappé finit toujours par s'afficher
 * avec ses « &amp;amp; ».
 *
 * Vocabulaire accepté : **gras**, *italique*, `code`, > citation,
 * listes à puces, [texte](url) en http(s) seulement, paragraphes.
 */
function forum_rendu(string $brut): string {
    $t = htmlspecialchars($brut, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8');
    $t = str_replace(["\r\n", "\r"], "\n", $t);

    // Le code littéral se pose AVANT le reste et sort du jeu : sans quoi
    // « `**` » serait mis en gras au lieu d'être montré.
    $codes = [];
    $t = preg_replace_callback('/`([^`\n]{1,200})`/', function ($m) use (&$codes) {
        $codes[] = '<code>' . $m[1] . '</code>';
        return "\0CODE" . (count($codes) - 1) . "\0";
    }, $t);

    // Liens : le schéma est vérifié, pas deviné. javascript:, data: et
    // consorts n'ont aucune raison d'apparaître dans un message.
    $t = preg_replace_callback(
        '/\[([^\]\n]{1,120})\]\((https?:\/\/[^\s)]{1,300})\)/i',
        fn($m) => '<a href="' . $m[2] . '" rel="nofollow noopener ugc" target="_blank">' . $m[1] . '</a>',
        $t
    );

    $t = preg_replace('/\*\*([^*\n]{1,200})\*\*/', '<strong>$1</strong>', $t);
    $t = preg_replace('/(?<!\*)\*([^*\n]{1,200})\*(?!\*)/', '<em>$1</em>', $t);

    // Blocs, en UNE passe. Un premier découpage en lignes suivi d'un
    // regroupement en paragraphes laissait du texte nu à côté d'une
    // citation (« <blockquote>…</blockquote>suite ») : le paragraphe
    // était considéré comme déjà balisé parce qu'il COMMENÇAIT par une
    // balise. On accumule donc les trois natures de bloc au fil des
    // lignes, et chacune se referme quand la suivante change.
    $out  = [];
    $para = [];                 // lignes du paragraphe en cours
    $liste = [];                // items de la liste en cours
    $cite  = [];                // lignes de la citation en cours

    $fermerPara  = function () use (&$para, &$out) {
        if ($para) { $out[] = '<p>' . implode('<br>', $para) . '</p>'; $para = []; }
    };
    $fermerListe = function () use (&$liste, &$out) {
        if ($liste) { $out[] = '<ul><li>' . implode('</li><li>', $liste) . '</li></ul>'; $liste = []; }
    };
    $fermerCite  = function () use (&$cite, &$out) {
        if ($cite) { $out[] = '<blockquote>' . implode('<br>', $cite) . '</blockquote>'; $cite = []; }
    };

    foreach (explode("\n", $t) as $l) {
        $l = rtrim($l);
        if (trim($l) === '') { $fermerPara(); $fermerListe(); $fermerCite(); continue; }

        if (preg_match('/^\s*[-*]\s+(.*)$/', $l, $m)) {
            $fermerPara(); $fermerCite();
            $liste[] = $m[1];
        } elseif (preg_match('/^\s*&gt;\s?(.*)$/', $l, $m)) {
            $fermerPara(); $fermerListe();
            $cite[] = $m[1];
        } else {
            $fermerListe(); $fermerCite();
            $para[] = $l;
        }
    }
    $fermerPara(); $fermerListe(); $fermerCite();
    $t = implode('', $out);

    foreach ($codes as $i => $c) $t = str_replace("\0CODE$i\0", $c, $t);
    return $t;
}

/** Extrait de texte nu, pour les listes et les balises Open Graph. */
function forum_extrait(string $brut, int $max = 160): string {
    $t = preg_replace('/[`*>\[\]()#]/u', '', $brut);
    $t = trim(preg_replace('/\s+/u', ' ', $t));
    return mb_strlen($t) > $max ? mb_substr($t, 0, $max - 1) . '…' : $t;
}

/** Le message contient-il un lien externe ? (plafond des comptes neufs) */
function forum_a_un_lien(string $brut): bool {
    return (bool)preg_match('#(https?://|www\.)#i', $brut);
}

// ════════════════════════════════════════════════════════
// ADRESSES LISIBLES
// ════════════════════════════════════════════════════════

/**
 * Replie les accents sur l'ASCII.
 *
 * `iconv('ASCII//TRANSLIT')` ne rend pas la même chose partout : sous
 * Windows il produit « hygrom'etrie » — l'accent devient une apostrophe
 * AVANT la lettre — là où glibc rend « hygrometrie ». Le fragment d'URL
 * sortait donc « hygrom-etrie » sur le poste de développement et
 * « hygrometrie » sur le serveur : deux adresses pour un même sujet.
 * Les signes que TRANSLIT insère sont donc retirés derrière lui.
 */
function forum_sans_accents(string $s): string {
    if (function_exists('iconv')) {
        $conv = @iconv('UTF-8', 'ASCII//TRANSLIT//IGNORE', $s);
        if ($conv !== false) $s = $conv;
    }
    return preg_replace('/[\'`^"~]/', '', $s);
}

/**
 * Fabrique un fragment d'URL à partir d'un titre.
 *
 * L'unicité ne vient PAS d'ici : l'adresse d'un sujet porte son id
 * (« …/hygrometrie-70-ou-65-12 »). Deux sujets homonymes sont donc
 * possibles, et c'est très bien — imposer l'unicité obligerait à
 * suffixer « -2 », « -3 », et à interroger la base à chaque titre.
 */
function forum_slug(string $titre, int $max = 60): string {
    $s = forum_sans_accents($titre);
    $s = strtolower($s);
    $s = preg_replace('/[^a-z0-9]+/', '-', $s);
    $s = trim($s, '-');
    if ($s === '') $s = 'sujet';
    return mb_substr($s, 0, $max);
}

// ════════════════════════════════════════════════════════
// ÉTIQUETTES
// ════════════════════════════════════════════════════════

/**
 * Normalise une étiquette saisie.
 * Les accents sont CONSERVÉS : « dégustation » et « degustation »
 * doivent se rejoindre, mais l'affichage garde la graphie française.
 * On les replie donc pour la clé, en gardant le libellé d'origine.
 */
function forum_tag_slug(string $brut): string {
    $s = mb_strtolower(trim($brut), 'UTF-8');
    $s = preg_replace('/\s+/u', '-', $s);
    $s = strtolower(forum_sans_accents($s));
    $s = preg_replace('/[^a-z0-9-]+/', '', $s);
    $s = preg_replace('/-{2,}/', '-', trim($s, '-'));
    return mb_substr($s, 0, 50);
}

/**
 * Rattache jusqu'à 5 étiquettes à un sujet, en les créant au besoin.
 * @param string[] $labels saisies brutes
 * @return string[] slugs retenus
 */
function forum_tags_appliquer(PDO $db, int $topic_id, array $labels): array {
    $vus = [];
    foreach ($labels as $brut) {
        if (count($vus) >= 5) break;
        $slug = forum_tag_slug((string)$brut);
        if ($slug === '' || isset($vus[$slug])) continue;
        $vus[$slug] = trim((string)$brut);
    }
    if (!$vus) return [];

    foreach ($vus as $slug => $label) {
        $db->prepare("INSERT INTO forum_tags (slug, label) VALUES (?, ?)
                      ON DUPLICATE KEY UPDATE id = LAST_INSERT_ID(id)")
           ->execute([$slug, mb_substr($label, 0, 50)]);
        $tag_id = (int)$db->lastInsertId();
        $db->prepare("INSERT IGNORE INTO forum_topic_tags (topic_id, tag_id) VALUES (?, ?)")
           ->execute([$topic_id, $tag_id]);
        // uses_count sert au seuil d'autocomplétion : on le recalcule
        // plutôt que de l'incrémenter, pour qu'un sujet supprimé le
        // fasse redescendre.
        $db->prepare("UPDATE forum_tags SET uses_count =
                        (SELECT COUNT(*) FROM forum_topic_tags WHERE tag_id = ?) WHERE id = ?")
           ->execute([$tag_id, $tag_id]);
    }
    return array_keys($vus);
}

/** Étiquettes d'un lot de sujets, en UNE requête (pas une par sujet). */
function forum_tags_de(PDO $db, array $topic_ids): array {
    if (!$topic_ids) return [];
    $in = implode(',', array_fill(0, count($topic_ids), '?'));
    $stmt = $db->prepare(
        "SELECT tt.topic_id, t.slug, t.label
         FROM forum_topic_tags tt JOIN forum_tags t ON t.id = tt.tag_id
         WHERE tt.topic_id IN ($in) ORDER BY t.label"
    );
    $stmt->execute($topic_ids);
    $out = [];
    foreach ($stmt->fetchAll() as $r) {
        $out[(int)$r['topic_id']][] = ['slug' => $r['slug'], 'label' => $r['label']];
    }
    return $out;
}

// ════════════════════════════════════════════════════════
// PLAFONDS
// ════════════════════════════════════════════════════════

/**
 * Vérifie qu'un compte a le droit d'écrire maintenant.
 * @return array|null null si tout va bien, sinon [code, message] à rendre en 429
 */
function forum_plafond(PDO $db, array $u, bool $nouveau_sujet, string $corps): ?array {
    $facteur = forum_de_confiance($u) ? 3 : 1;

    // Délai entre deux messages : la première digue contre le robot qui
    // vide un dictionnaire de spam dans un fil.
    $dernier = $db->prepare(
        "SELECT UNIX_TIMESTAMP(created_at) FROM forum_posts
         WHERE user_id = ? ORDER BY id DESC LIMIT 1"
    );
    $dernier->execute([$u['id']]);
    $ts = (int)$dernier->fetchColumn();
    if ($ts && (time() - $ts) < FORUM_DELAI_S && !forum_de_confiance($u)) {
        return ['forum_trop_vite', 'Patientez quelques secondes avant de publier à nouveau.'];
    }

    $q = $db->prepare(
        "SELECT COUNT(*) FROM forum_posts
         WHERE user_id = ? AND created_at > DATE_SUB(NOW(), INTERVAL 1 DAY)"
    );
    $q->execute([$u['id']]);
    if ((int)$q->fetchColumn() >= FORUM_MESSAGES_JOUR * $facteur) {
        return ['forum_plafond_messages', 'Vous avez atteint le nombre de messages autorisés pour aujourd\'hui.'];
    }

    if ($nouveau_sujet) {
        $q = $db->prepare(
            "SELECT COUNT(*) FROM forum_topics
             WHERE user_id = ? AND created_at > DATE_SUB(NOW(), INTERVAL 1 DAY)"
        );
        $q->execute([$u['id']]);
        if ((int)$q->fetchColumn() >= FORUM_SUJETS_JOUR * $facteur) {
            return ['forum_plafond_sujets', 'Vous avez ouvert assez de sujets pour aujourd\'hui.'];
        }
    }

    // Pas de lien externe tant que le compte n'a pas écrit N messages.
    // Trois lignes qui coupent l'essentiel du spam : un spammeur vient
    // poser un lien, pas participer cinq fois d'abord.
    if (forum_a_un_lien($corps) && !forum_de_confiance($u)) {
        $q = $db->prepare("SELECT COUNT(*) FROM forum_posts WHERE user_id = ?");
        $q->execute([$u['id']]);
        if ((int)$q->fetchColumn() < FORUM_LIENS_APRES) {
            return ['forum_liens_bloques', 'Les liens externes sont ouverts après quelques messages.'];
        }
    }
    return null;
}

// ════════════════════════════════════════════════════════
// COMPTEURS ET SIGNALEMENTS
// ════════════════════════════════════════════════════════

/** Recalcule les compteurs dénormalisés d'un sujet. */
function forum_topic_recompte(PDO $db, int $topic_id): void {
    $db->prepare(
        "UPDATE forum_topics t SET
           t.posts_count  = (SELECT COUNT(*)   FROM forum_posts p WHERE p.topic_id = t.id AND p.status <> 'removed'),
           t.last_post_at = (SELECT MAX(p.created_at) FROM forum_posts p WHERE p.topic_id = t.id AND p.status <> 'removed')
         WHERE t.id = ?"
    )->execute([$topic_id]);
}

/**
 * Enregistre un signalement et masque le message au seuil.
 *
 * Le masquage automatique n'est pas une commodité : sans lui, un contenu
 * problématique reste affiché jusqu'à ce qu'un modérateur se réveille,
 * ce qui peut être une nuit entière. Trois personnes distinctes, c'est
 * assez pour douter, et `flagged` reste réversible.
 *
 * @return array [signalements, masqué]
 */
function forum_signaler(PDO $db, int $post_id, int $user_id, string $reason, string $note = ''): array {
    $reasons = ['offtopic', 'ad', 'abuse', 'wrong', 'other'];
    if (!in_array($reason, $reasons, true)) $reason = 'other';

    $db->prepare("INSERT IGNORE INTO forum_flags (post_id, user_id, reason, note) VALUES (?, ?, ?, ?)")
       ->execute([$post_id, $user_id, $reason, mb_substr($note, 0, 300) ?: null]);

    $q = $db->prepare("SELECT COUNT(*) FROM forum_flags WHERE post_id = ? AND resolved_at IS NULL");
    $q->execute([$post_id]);
    $n = (int)$q->fetchColumn();

    $masque = false;
    if ($n >= FORUM_SEUIL_FLAGS) {
        $db->prepare("UPDATE forum_posts SET status = 'flagged' WHERE id = ? AND status = 'published'")
           ->execute([$post_id]);
        $masque = true;
    }
    return [$n, $masque];
}

/**
 * Décision d'un modérateur sur un message signalé.
 * @param string $decision 'publier' | 'retirer'
 */
function forum_moderer(PDO $db, int $post_id, string $decision, int $moderator_id): bool {
    $statut = $decision === 'retirer' ? 'removed' : 'published';
    $ok = $db->prepare("UPDATE forum_posts SET status = ? WHERE id = ?")
             ->execute([$statut, $post_id]);
    $db->prepare("UPDATE forum_flags SET resolved_at = NOW(), resolved_by = ?
                  WHERE post_id = ? AND resolved_at IS NULL")
       ->execute([$moderator_id, $post_id]);

    $q = $db->prepare("SELECT topic_id FROM forum_posts WHERE id = ?");
    $q->execute([$post_id]);
    if ($tid = (int)$q->fetchColumn()) forum_topic_recompte($db, $tid);
    return (bool)$ok;
}

// ════════════════════════════════════════════════════════
// LECTURE
// ════════════════════════════════════════════════════════

/** Nom à afficher pour un message : « Membre supprimé » si le compte n'est plus. */
function forum_auteur(?array $row): array {
    return [
        'name'   => $row['display_name'] ?? null,
        'avatar' => $row['avatar_url'] ?? null,
        'role'   => $row['role'] ?? null,
    ];
}

/** Les rubriques, avec le nombre de sujets visibles. */
function forum_sections(PDO $db): array {
    $rows = $db->query(
        "SELECT s.id, s.slug, s.icon,
                (SELECT COUNT(*) FROM forum_topics t
                  WHERE t.section_id = s.id AND t.status <> 'removed') AS topics,
                (SELECT MAX(t.last_post_at) FROM forum_topics t
                  WHERE t.section_id = s.id AND t.status <> 'removed') AS last_post_at
         FROM forum_sections s ORDER BY s.position, s.id"
    )->fetchAll();
    return array_map(fn($r) => [
        'id'     => (int)$r['id'],
        'slug'   => $r['slug'],
        'icon'   => $r['icon'],
        'topics' => (int)$r['topics'],
        'last_post_at' => $r['last_post_at'],
    ], $rows);
}
