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

/**
 * Les rubriques, avec le nombre de sujets VISIBLES.
 *
 * Le compte suit le filtre de langue. Sans cela, une rubrique annonçait
 * « 2 sujets » à un lecteur anglophone qui, une fois entré, n'en
 * trouvait qu'un : le compte portait sur toutes les langues, la liste
 * non. Un chiffre qui ne correspond pas à ce qu'on va voir est pire
 * qu'une absence de chiffre.
 *
 * @param string[]|null $langs null = toutes les langues
 */
function forum_sections(PDO $db, ?array $langs = null): array {
    $filtre = '';
    $args   = [];
    if ($langs) {
        $in = implode(',', array_fill(0, count($langs), '?'));
        $filtre = " AND t.lang IN ($in)";
        // La condition apparaît DEUX fois dans la requête : les
        // paramètres sont donc fournis deux fois, dans l'ordre.
        $args = array_merge($langs, $langs);
    }
    $stmt = $db->prepare(
        "SELECT s.id, s.slug, s.icon, s.is_events,
                (SELECT COUNT(*) FROM forum_topics t
                  WHERE t.section_id = s.id AND t.status <> 'removed'$filtre) AS topics,
                (SELECT MAX(t.last_post_at) FROM forum_topics t
                  WHERE t.section_id = s.id AND t.status <> 'removed'$filtre) AS last_post_at
         FROM forum_sections s ORDER BY s.position, s.id"
    );
    $stmt->execute($args);
    $rows = $stmt->fetchAll();
    return array_map(fn($r) => [
        'id'     => (int)$r['id'],
        'slug'   => $r['slug'],
        'icon'   => $r['icon'],
        'topics' => (int)$r['topics'],
        'events' => (bool)$r['is_events'],
        'last_post_at' => $r['last_post_at'],
    ], $rows);
}

// ════════════════════════════════════════════════════════
// ÉVÉNEMENTS (V2)
// ════════════════════════════════════════════════════════
// Un événement EST un sujet muni de champs structurés : la discussion
// de préparation est le fil du sujet. Voir §6 de docs/communaute.md.

/** Au-delà, on annonce une intention, pas un rendez-vous. */
const FORUM_EVT_MOIS_MAX = 12;

/** Les cinq natures de rendez-vous. Toute autre valeur retombe ici. */
function forum_evt_natures(): array {
    return ['degustation', 'rencontre', 'artisan', 'salon', 'enligne'];
}

/**
 * Convertit « 2026-09-12 19:30 » + fuseau du lieu en instant UTC.
 *
 * La saisie est LOCALE au lieu, le stockage est en UTC : c'est ce qui
 * permet de trier deux rendez-vous sur deux continents et d'envoyer un
 * rappel à la bonne heure. La conversion passe par DateTimeZone, jamais
 * par un décalage en dur — un décalage fixe se trompe deux fois par an,
 * et pas le même jour d'un pays à l'autre.
 *
 * @return string|null 'Y-m-d H:i:s' en UTC, ou null si la saisie est inexploitable
 */
function forum_evt_utc(string $local, string $tz): ?string {
    if (trim($local) === '') return null;
    try {
        $zone = new DateTimeZone($tz);
        $d = new DateTime(str_replace('T', ' ', trim($local)), $zone);
        $d->setTimezone(new DateTimeZone('UTC'));
        return $d->format('Y-m-d H:i:s');
    } catch (Throwable $e) {
        return null;
    }
}

/** Le fuseau existe-t-il vraiment ? Une chaîne inventée fausserait tout. */
function forum_evt_fuseau_valide(string $tz): bool {
    try { new DateTimeZone($tz); return true; } catch (Throwable $e) { return false; }
}

/**
 * Vérifie une saisie d'événement.
 * @return array|null [code, message] à rendre en 400, ou null si tout va bien
 */
function forum_evt_valider(string $debutUtc, ?string $finUtc, int $mois = FORUM_EVT_MOIS_MAX): ?array {
    $maintenant = new DateTime('now', new DateTimeZone('UTC'));
    $debut = new DateTime($debutUtc, new DateTimeZone('UTC'));

    if ($debut <= $maintenant) {
        return ['evt_passe', 'La date de début doit être à venir.'];
    }
    $limite = (clone $maintenant)->modify("+$mois months");
    if ($debut > $limite) {
        return ['evt_trop_loin', 'Un rendez-vous s\'annonce au plus douze mois à l\'avance.'];
    }
    if ($finUtc !== null && new DateTime($finUtc, new DateTimeZone('UTC')) <= $debut) {
        return ['evt_fin_avant_debut', 'La fin doit suivre le début.'];
    }
    return null;
}

/**
 * Le lieu : un établissement de l'atlas, ou une adresse libre.
 *
 * Un lounge référencé est préféré — il porte déjà son adresse et ses
 * coordonnées, et c'est lui qui fait apparaître le rendez-vous sur sa
 * fiche. L'adresse libre reste possible : tout ne se passe pas dans un
 * établissement du catalogue.
 *
 * @return array [lounge_id, place_label, lat, lon]
 */
function forum_evt_lieu(PDO $db, $lounge_id, $label, $lat, $lon): array {
    $lounge_id = (int)$lounge_id;
    if ($lounge_id > 0) {
        $q = $db->prepare('SELECT name, city, lat, lon FROM lounges WHERE id = ? AND is_verified = 1');
        $q->execute([$lounge_id]);
        if ($l = $q->fetch()) {
            return [
                $lounge_id,
                trim($l['name'] . ($l['city'] ? ' · ' . $l['city'] : '')),
                $l['lat'] !== null ? (float)$l['lat'] : null,
                $l['lon'] !== null ? (float)$l['lon'] : null,
            ];
        }
    }
    // Coordonnées libres : mêmes garde-fous que les contributions —
    // hors plage ou (0,0), on ne garde rien plutôt que de poser un
    // marqueur au large du golfe de Guinée.
    $lat = is_numeric($lat) ? (float)$lat : null;
    $lon = is_numeric($lon) ? (float)$lon : null;
    if ($lat === null || $lon === null || abs($lat) > 90 || abs($lon) > 180
        || ($lat === 0.0 && $lon === 0.0)) {
        $lat = $lon = null;
    }
    return [null, mb_substr(trim((string)$label), 0, 160) ?: null, $lat, $lon];
}

/**
 * Places prises et liste d'attente.
 *
 * La liste d'attente se DÉDUIT de l'ordre d'inscription et de la
 * capacité ; elle n'est pas un état stocké. Un état se
 * désynchroniserait dès le premier désistement — celui qui se retire au
 * milieu fait remonter tout le monde, et il faudrait réécrire chaque
 * ligne pour le refléter.
 */
function forum_evt_participation(PDO $db, int $topic_id, ?int $capacity, ?int $user_id = null): array {
    $q = $db->prepare(
        "SELECT user_id, rank_no FROM forum_attendance
         WHERE topic_id = ? AND state = 'going' ORDER BY rank_no, user_id"
    );
    $q->execute([$topic_id]);
    $venants = $q->fetchAll();

    $q = $db->prepare("SELECT COUNT(*) FROM forum_attendance WHERE topic_id = ? AND state = 'interested'");
    $q->execute([$topic_id]);
    $curieux = (int)$q->fetchColumn();

    $place = null;      // rang de l'utilisateur courant parmi les « je viens »
    foreach ($venants as $i => $v) {
        if ($user_id && (int)$v['user_id'] === $user_id) { $place = $i + 1; break; }
    }

    $total = count($venants);
    $attente = ($place !== null && $capacity !== null && $place > $capacity);
    return [
        'going'       => $total,
        'interested'  => $curieux,
        'capacity'    => $capacity,
        'full'        => $capacity !== null && $total >= $capacity,
        // Rang au-delà de la capacité : la personne est sur liste d'attente.
        'waiting'     => $attente,
        'waiting_pos' => $attente ? $place - $capacity : null,
    ];
}

/** L'état de participation d'un membre, ou null s'il ne s'est pas prononcé. */
function forum_evt_mon_etat(PDO $db, int $topic_id, int $user_id): ?string {
    $q = $db->prepare('SELECT state FROM forum_attendance WHERE topic_id = ? AND user_id = ?');
    $q->execute([$topic_id, $user_id]);
    $s = $q->fetchColumn();
    return $s === false ? null : $s;
}

/**
 * Bascule la participation d'un membre.
 * `rank_no` n'est attribué qu'à la PREMIÈRE inscription : se désister
 * puis revenir fait perdre sa place, ce qui est la règle qu'attendent
 * ceux qui patientent derrière.
 */
function forum_evt_participer(PDO $db, int $topic_id, int $user_id, string $etat): void {
    $etats = ['interested', 'going', 'cancelled'];
    if (!in_array($etat, $etats, true)) $etat = 'going';

    $q = $db->prepare('SELECT state, rank_no FROM forum_attendance WHERE topic_id = ? AND user_id = ?');
    $q->execute([$topic_id, $user_id]);
    $existant = $q->fetch();

    if ($existant) {
        $rang = (int)$existant['rank_no'];
        // Un rang de 0 signale une inscription qui n'était pas « going » :
        // on lui en donne un au moment où elle le devient.
        if ($etat === 'going' && $rang === 0) $rang = forum_evt_rang_suivant($db, $topic_id);
        $db->prepare('UPDATE forum_attendance SET state = ?, rank_no = ? WHERE topic_id = ? AND user_id = ?')
           ->execute([$etat, $rang, $topic_id, $user_id]);
        return;
    }
    $db->prepare('INSERT INTO forum_attendance (topic_id, user_id, state, rank_no) VALUES (?, ?, ?, ?)')
       ->execute([$topic_id, $user_id, $etat, $etat === 'going' ? forum_evt_rang_suivant($db, $topic_id) : 0]);
}

function forum_evt_rang_suivant(PDO $db, int $topic_id): int {
    $q = $db->prepare('SELECT COALESCE(MAX(rank_no), 0) + 1 FROM forum_attendance WHERE topic_id = ?');
    $q->execute([$topic_id]);
    return (int)$q->fetchColumn();
}

/**
 * Fait passer en « past » les événements dont la date est dépassée.
 *
 * Appelé à la lecture plutôt que par une tâche planifiée : un statut
 * qui dépend d'une horloge doit se rattraper tout seul, sinon un cron
 * oublié laisse un agenda plein de rendez-vous d'avant-hier annoncés
 * comme « à venir ». Quatre heures de battement quand la fin n'est pas
 * précisée : une dégustation ne se termine pas à la minute annoncée.
 */
function forum_evt_perimer(PDO $db): void {
    $db->exec(
        "UPDATE forum_events SET status = 'past'
         WHERE status = 'upcoming'
           AND COALESCE(ends_at, DATE_ADD(starts_at, INTERVAL 4 HOUR)) < UTC_TIMESTAMP()"
    );
}

/**
 * L'agenda : à venir d'abord, puis les archives.
 * @param string[]|null $langs filtre de langue, null = toutes
 */
function forum_evt_agenda(PDO $db, ?array $langs = null, bool $passes = false, int $limite = 40): array {
    forum_evt_perimer($db);

    $where = ["t.status <> 'removed'"];
    $args  = [];
    $where[] = $passes ? "e.status <> 'upcoming'" : "e.status = 'upcoming'";
    if ($langs) {
        $where[] = 't.lang IN (' . implode(',', array_fill(0, count($langs), '?')) . ')';
        foreach ($langs as $l) $args[] = $l;
    }
    $ordre = $passes ? 'e.starts_at DESC' : 'e.starts_at ASC';
    $limite = max(1, min(100, $limite));

    $stmt = $db->prepare(
        "SELECT e.*, t.title, t.slug, t.lang, t.posts_count,
                u.display_name, u.avatar_url, u.role,
                l.name AS lounge_name, l.country_id
         FROM forum_events e
         JOIN forum_topics t ON t.id = e.topic_id
         LEFT JOIN users u   ON u.id = t.user_id
         LEFT JOIN lounges l ON l.id = e.lounge_id
         WHERE " . implode(' AND ', $where) . "
         ORDER BY $ordre LIMIT $limite"
    );
    $stmt->execute($args);
    return array_map('forum_evt_format', $stmt->fetchAll());
}

/** Met un enregistrement d'événement en forme pour le front. */
function forum_evt_format(array $r): array {
    return [
        'topic_id'   => (int)$r['topic_id'],
        'title'      => $r['title'] ?? null,
        'lang'       => $r['lang'] ?? null,
        'posts'      => isset($r['posts_count']) ? (int)$r['posts_count'] : null,
        // L'instant part en UTC, marqué comme tel : c'est au navigateur
        // de l'afficher dans le fuseau du LIEU, que voici.
        'starts_at'  => str_replace(' ', 'T', $r['starts_at']) . 'Z',
        'ends_at'    => $r['ends_at'] ? str_replace(' ', 'T', $r['ends_at']) . 'Z' : null,
        'timezone'   => $r['timezone'],
        'kind'       => $r['kind'],
        'status'     => $r['status'],
        'cancel_reason' => $r['cancel_reason'],
        'capacity'   => $r['capacity'] !== null ? (int)$r['capacity'] : null,
        'lounge_id'  => $r['lounge_id'] !== null ? (int)$r['lounge_id'] : null,
        'place'      => $r['lounge_name'] ?? $r['place_label'],
        'country'    => $r['country_id'] ?? null,
        'lat'        => $r['lat'] !== null ? (float)$r['lat'] : null,
        'lon'        => $r['lon'] !== null ? (float)$r['lon'] : null,
        'author'     => isset($r['display_name']) ? forum_auteur($r) : null,
    ];
}

/**
 * Les prochains rendez-vous d'un établissement.
 * C'est ce qui met « Prochaine rencontre le … » sur sa fiche, et ce qui
 * relie la communauté à l'atlas plutôt que d'en faire une île.
 */
function forum_evt_par_lounge(PDO $db, array $lounge_ids): array {
    if (!$lounge_ids) return [];
    forum_evt_perimer($db);
    $in = implode(',', array_fill(0, count($lounge_ids), '?'));
    $stmt = $db->prepare(
        "SELECT e.*, t.title, t.slug, t.lang, l.name AS lounge_name, l.country_id
         FROM forum_events e
         JOIN forum_topics t ON t.id = e.topic_id
         LEFT JOIN lounges l ON l.id = e.lounge_id
         WHERE e.lounge_id IN ($in) AND e.status = 'upcoming' AND t.status <> 'removed'
         ORDER BY e.starts_at"
    );
    $stmt->execute($lounge_ids);
    $out = [];
    foreach ($stmt->fetchAll() as $r) {
        $out[(int)$r['lounge_id']][] = forum_evt_format($r);
    }
    return $out;
}

// ════════════════════════════════════════════════════════
// NOTIFICATIONS DES RENDEZ-VOUS
// ════════════════════════════════════════════════════════
// Deux emails, et deux seulement : le rappel à J-2 et l'annulation.
// Aucun des deux ne se coupe depuis le profil — ils portent une
// information que l'inscrit ne peut pas deviner, alors qu'il a bloqué
// une soirée.
//
// C'est ici l'exception assumée à la règle F2 (« le serveur ne traduit
// pas ») : un email n'a pas de front pour le faire à sa place. Les
// textes viennent de mail_i18n(), comme pour l'approbation.

require_once __DIR__ . '/mailer.php';

/** La date d'un rendez-vous, écrite dans la langue et le fuseau du lieu. */
function forum_evt_date_lisible(string $utc, string $tz, string $lang = 'fr'): string {
    try {
        $d = new DateTime($utc, new DateTimeZone('UTC'));
        $d->setTimezone(new DateTimeZone($tz));
        if (class_exists('IntlDateFormatter')) {
            $f = new IntlDateFormatter($lang, IntlDateFormatter::FULL, IntlDateFormatter::SHORT,
                                       $tz, IntlDateFormatter::GREGORIAN);
            $s = $f->format($d);
            if ($s !== false) return $s;
        }
        // Sans l'extension intl (fréquent en mutualisé), un format ISO
        // reste juste et lisible partout — mieux qu'un mois en anglais
        // dans un email allemand.
        return $d->format('Y-m-d H:i') . ' (' . $tz . ')';
    } catch (Throwable $e) {
        return $utc . ' UTC';
    }
}

/** Les inscrits d'un rendez-vous, avec leur langue de correspondance. */
function forum_evt_inscrits(PDO $db, int $topic_id, bool $seulement_a_prevenir = false): array {
    $sql = "SELECT a.user_id, u.email, u.display_name, u.lang
            FROM forum_attendance a JOIN users u ON u.id = a.user_id
            WHERE a.topic_id = ? AND a.state = 'going' AND u.status = 'active'";
    if ($seulement_a_prevenir) $sql .= ' AND a.reminded_at IS NULL';
    $q = $db->prepare($sql . ' ORDER BY a.rank_no');
    $q->execute([$topic_id]);
    return $q->fetchAll();
}

/** Le titre, la date et le lieu d'un rendez-vous, pour un email. */
function forum_evt_resume(PDO $db, int $topic_id): ?array {
    $q = $db->prepare(
        'SELECT e.starts_at, e.timezone, e.place_label, t.title, l.name AS lounge_name
         FROM forum_events e JOIN forum_topics t ON t.id = e.topic_id
         LEFT JOIN lounges l ON l.id = e.lounge_id
         WHERE e.topic_id = ?'
    );
    $q->execute([$topic_id]);
    $r = $q->fetch();
    return $r ?: null;
}

/**
 * Prévient les inscrits qu'un rendez-vous est annulé.
 * @return int nombre d'emails partis
 */
function forum_evt_prevenir_annulation(PDO $db, int $topic_id, string $motif = ''): int {
    $e = forum_evt_resume($db, $topic_id);
    if (!$e) return 0;
    $url = site_url() . '/?sujet=' . $topic_id;
    $n = 0;

    foreach (forum_evt_inscrits($db, $topic_id) as $p) {
        $lang = (string)($p['lang'] ?: 'fr');
        // Le motif est facultatif : sans lui, la phrase doit rester
        // correcte — d'où l'espace final plutôt qu'une phrase à trous.
        $corps = mail_t('evt_annul_corps', $lang, [
            'titre' => $e['title'],
            'date'  => forum_evt_date_lisible($e['starts_at'], $e['timezone'], $lang),
            'motif' => $motif !== '' ? '« ' . $motif . ' » ' : '',
        ]);
        try {
            if (send_email($p['email'],
                    mail_t('evt_annul_sujet', $lang, ['titre' => $e['title']]),
                    email_template(mail_t('evt_annul_titre', $lang), $corps,
                                   mail_t('evt_rappel_bouton', $lang), $url,
                                   mail_t('evt_pied', $lang)))) {
                $n++;
            }
        } catch (Throwable $ex) {
            // Une annulation ne doit jamais échouer parce qu'un email
            // n'est pas parti : le rendez-vous EST annulé en base.
            error_log('[forum] annulation non notifiee (#' . $topic_id . ') : ' . $ex->getMessage());
        }
    }
    return $n;
}

/**
 * Rappels à J-2, pour tous les rendez-vous concernés.
 *
 * `reminded_at` garantit qu'un rappel ne part qu'UNE fois : sans lui,
 * un cron lancé toutes les heures enverrait vingt-quatre emails par
 * inscrit et par jour. C'est le genre de détail qui fait classer un
 * domaine en spam pour de bon.
 *
 * @return array [rendez-vous traités, emails partis]
 */
function forum_evt_rappels(PDO $db, int $jours = 2): array {
    forum_evt_perimer($db);
    $q = $db->prepare(
        "SELECT topic_id FROM forum_events
         WHERE status = 'upcoming'
           AND starts_at BETWEEN UTC_TIMESTAMP() AND DATE_ADD(UTC_TIMESTAMP(), INTERVAL ? DAY)"
    );
    $q->execute([$jours]);
    $ids = $q->fetchAll(PDO::FETCH_COLUMN);

    $evts = 0; $mails = 0;
    foreach ($ids as $tid) {
        $tid = (int)$tid;
        $e = forum_evt_resume($db, $tid);
        $inscrits = forum_evt_inscrits($db, $tid, true);
        if (!$e || !$inscrits) continue;
        $evts++;
        $url = site_url() . '/?sujet=' . $tid;

        foreach ($inscrits as $p) {
            $lang = (string)($p['lang'] ?: 'fr');
            $corps = mail_t('evt_rappel_corps', $lang, [
                'titre' => $e['title'],
                'date'  => forum_evt_date_lisible($e['starts_at'], $e['timezone'], $lang),
                'lieu'  => $e['lounge_name'] ?: ($e['place_label'] ?: '—'),
            ]);
            try {
                if (send_email($p['email'],
                        mail_t('evt_rappel_sujet', $lang, ['titre' => $e['title']]),
                        email_template(mail_t('evt_rappel_titre', $lang), $corps,
                                       mail_t('evt_rappel_bouton', $lang), $url,
                                       mail_t('evt_pied', $lang)))) {
                    $mails++;
                }
            } catch (Throwable $ex) {
                error_log('[forum] rappel non envoye (#' . $tid . ') : ' . $ex->getMessage());
                continue;   // on ne marque PAS : le prochain passage réessaiera
            }
            $db->prepare('UPDATE forum_attendance SET reminded_at = UTC_TIMESTAMP()
                          WHERE topic_id = ? AND user_id = ?')
               ->execute([$tid, (int)$p['user_id']]);
        }
    }
    return [$evts, $mails];
}
