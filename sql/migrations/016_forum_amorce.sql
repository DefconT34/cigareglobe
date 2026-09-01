-- ═══════════════════════════════════════════════════════════════════
-- Migration 016 — Amorce du forum : un sujet d'accueil par rubrique
-- ───────────────────────────────────────────────────────────────────
-- « Un forum vide se vide plus vite qu'il ne se remplit »
-- (docs/communaute.md, §14). Une rubrique à zéro sujet ne dit pas
-- « soyez le premier », elle dit « personne ne vient ici ». Le premier
-- visiteur repart, et le suivant trouve la même chose.
--
-- Ces sujets sont donc des AMORCES, pas de la décoration :
--
--   · une QUESTION OUVERTE, à laquelle n'importe quel amateur peut
--     répondre en trois lignes. « Présentez-vous » n'appelle rien ;
--     « à quel taux tenez-vous votre cave ? » appelle un chiffre, puis
--     une raison, puis un désaccord ;
--   · AUCUNE fausse réponse. Un dialogue fabriqué se repère, et il
--     décrédibilise tout le reste. Les fils partent à un message ;
--   · signés d'un compte DÉDIÉ, « La Régie ». Ni le compte de
--     l'exploitant, ni un faux membre : ces messages viennent du site,
--     et le lecteur doit pouvoir le voir.
--
-- LE COMPTE NE PERMET PAS DE SE CONNECTER. Son empreinte de mot de
-- passe est « * », qui n'est pas un hachage valide : password_verify()
-- échoue toujours, quel que soit le mot de passe présenté. Un compte de
-- service capable de se connecter est un compte de service dont il faut
-- garder le secret ; celui-ci n'a pas de secret à garder.
--
-- DEUX SUJETS EN ANGLAIS. Le filtre de langue montre par défaut « la
-- langue d'affichage + l'anglais » : un visiteur anglophone ne voit donc
-- QUE l'anglais. Sans ces deux fils, il trouverait le forum vide — ce
-- que cette migration existe précisément pour éviter.
--
-- Idempotente : rejouée, elle ne duplique rien.
-- ═══════════════════════════════════════════════════════════════════

INSERT IGNORE INTO users (email, password_hash, display_name, role, email_verified, lang)
VALUES ('regie@thecigarodyssey.com', '*', 'La Régie', 'moderator', 1, 'fr');

SET @uid = (SELECT id FROM users WHERE email = 'regie@thecigarodyssey.com');

-- ── La Régie : le mode d'emploi, épinglé ───────────────────────────
INSERT INTO forum_topics (section_id, user_id, title, slug, lang, is_pinned, posts_count, last_post_at)
SELECT s.id, @uid,
       'Bienvenue — comment fonctionne cet espace',
       'bienvenue-comment-fonctionne-cet-espace', 'fr', 1, 1, NOW()
FROM forum_sections s
WHERE s.slug = 'regie'
  AND NOT EXISTS (SELECT 1 FROM forum_topics t WHERE t.section_id = s.id AND t.user_id = @uid);
INSERT INTO forum_posts (topic_id, user_id, body)
SELECT t.id, @uid,
'Cet espace est celui des amateurs, pas celui d''une marque.

**Ce qu''on y fait** : on parle cigares, conservation, dégustation, adresses et maisons. On se donne rendez-vous. On pose des questions de débutant sans se faire reprendre.

**Ce qu''on n''y fait pas** : aucune vente, aucune petite annonce, aucun échange entre membres. Le cigare est un produit du tabac, l''espace est réservé aux personnes majeures, et rien ici n''est sponsorisé.

**Les langues.** Chaque sujet porte la sienne. Par défaut vous voyez la vôtre et l''anglais ; le sélecteur en haut de rubrique ouvre les six.

**La mise en forme.** `**gras**`, `*italique*`, `> citation`, `- liste`, et [texte](https://thecigarodyssey.com) pour un lien. Les liens externes s''ouvrent après quelques messages — c''est ce qui tient le spam à distance.

**Un problème ?** Le drapeau sous chaque message. Trois signalements suffisent à le masquer le temps qu''un modérateur regarde.'
FROM forum_topics t WHERE t.slug = 'bienvenue-comment-fonctionne-cet-espace'
  AND NOT EXISTS (SELECT 1 FROM forum_posts p WHERE p.topic_id = t.id);

-- ── Les cigares ────────────────────────────────────────────────────
INSERT INTO forum_topics (section_id, user_id, title, slug, lang, posts_count, last_post_at)
SELECT s.id, @uid, 'Quel cigare vous a fait basculer ?', 'quel-cigare-vous-a-fait-basculer', 'fr', 1, NOW()
FROM forum_sections s WHERE s.slug = 'cigares'
  AND NOT EXISTS (SELECT 1 FROM forum_topics t WHERE t.section_id = s.id AND t.user_id = @uid AND t.lang = 'fr');
INSERT INTO forum_posts (topic_id, user_id, body)
SELECT t.id, @uid,
'Il y a souvent un cigare précis après lequel on ne fume plus pareil. Pas forcément le meilleur, ni le plus cher : celui où l''on a compris ce qu''on cherchait.

Le vôtre, c''était lequel — et dans quelles circonstances ?'
FROM forum_topics t WHERE t.slug = 'quel-cigare-vous-a-fait-basculer'
  AND NOT EXISTS (SELECT 1 FROM forum_posts p WHERE p.topic_id = t.id);

INSERT INTO forum_topics (section_id, user_id, title, slug, lang, posts_count, last_post_at)
SELECT s.id, @uid, 'The cigar that made it click', 'the-cigar-that-made-it-click', 'en', 1, NOW()
FROM forum_sections s WHERE s.slug = 'cigares'
  AND NOT EXISTS (SELECT 1 FROM forum_topics t WHERE t.section_id = s.id AND t.user_id = @uid AND t.lang = 'en');
INSERT INTO forum_posts (topic_id, user_id, body)
SELECT t.id, @uid,
'There is usually one cigar after which nothing tastes the same. Not the best one, not the most expensive — the one where it finally made sense.

Which was yours, and where were you smoking it?'
FROM forum_topics t WHERE t.slug = 'the-cigar-that-made-it-click'
  AND NOT EXISTS (SELECT 1 FROM forum_posts p WHERE p.topic_id = t.id);

-- ── Conservation & cave ────────────────────────────────────────────
INSERT INTO forum_topics (section_id, user_id, title, slug, lang, posts_count, last_post_at)
SELECT s.id, @uid, 'À quel taux tenez-vous votre cave ?', 'a-quel-taux-tenez-vous-votre-cave', 'fr', 1, NOW()
FROM forum_sections s WHERE s.slug = 'conservation'
  AND NOT EXISTS (SELECT 1 FROM forum_topics t WHERE t.section_id = s.id AND t.user_id = @uid AND t.lang = 'fr');
INSERT INTO forum_posts (topic_id, user_id, body)
SELECT t.id, @uid,
'Le chiffre varie d''un amateur à l''autre, et chacun a ses raisons.

- **65 %** : tirage plus franc, combustion régulière
- **70 %** : la référence classique, plus indulgente sur les gros modules

Votre réglage, et pourquoi celui-là ? Précisez le climat où vous vivez : ce n''est pas le même sujet à Oslo et à Singapour.'
FROM forum_topics t WHERE t.slug = 'a-quel-taux-tenez-vous-votre-cave'
  AND NOT EXISTS (SELECT 1 FROM forum_posts p WHERE p.topic_id = t.id);

INSERT INTO forum_topics (section_id, user_id, title, slug, lang, posts_count, last_post_at)
SELECT s.id, @uid, 'What humidity do you keep your humidor at?', 'what-humidity-do-you-keep-your-humidor-at', 'en', 1, NOW()
FROM forum_sections s WHERE s.slug = 'conservation'
  AND NOT EXISTS (SELECT 1 FROM forum_topics t WHERE t.section_id = s.id AND t.user_id = @uid AND t.lang = 'en');
INSERT INTO forum_posts (topic_id, user_id, body)
SELECT t.id, @uid,
'Everyone settles on a number, and everyone has a reason for it.

- **65 %** — a cleaner draw, steadier burn
- **70 %** — the classic setting, more forgiving on thick ring gauges

What do you run, and why? Do mention your climate: this is not the same question in Oslo and in Singapore.'
FROM forum_topics t WHERE t.slug = 'what-humidity-do-you-keep-your-humidor-at'
  AND NOT EXISTS (SELECT 1 FROM forum_posts p WHERE p.topic_id = t.id);

-- ── Dégustation & accords ──────────────────────────────────────────
INSERT INTO forum_topics (section_id, user_id, title, slug, lang, posts_count, last_post_at)
SELECT s.id, @uid, 'Les accords qui fonctionnent vraiment', 'les-accords-qui-fonctionnent-vraiment', 'fr', 1, NOW()
FROM forum_sections s WHERE s.slug = 'degustation'
  AND NOT EXISTS (SELECT 1 FROM forum_topics t WHERE t.section_id = s.id AND t.user_id = @uid);
INSERT INTO forum_posts (topic_id, user_id, body)
SELECT t.id, @uid,
'On lit partout que le rhum va avec tout. À l''usage, c''est plus fin que ça — et parfois franchement faux.

Donnez un accord précis : le cigare, ce qu''il y avait dans le verre, et ce que ça a donné. Les ratés nous intéressent autant que les réussites.'
FROM forum_topics t WHERE t.slug = 'les-accords-qui-fonctionnent-vraiment'
  AND NOT EXISTS (SELECT 1 FROM forum_posts p WHERE p.topic_id = t.id);

-- ── Établissements & voyages ───────────────────────────────────────
INSERT INTO forum_topics (section_id, user_id, title, slug, lang, posts_count, last_post_at)
SELECT s.id, @uid, 'Le lounge où vous revenez toujours', 'le-lounge-ou-vous-revenez-toujours', 'fr', 1, NOW()
FROM forum_sections s WHERE s.slug = 'etablissements'
  AND NOT EXISTS (SELECT 1 FROM forum_topics t WHERE t.section_id = s.id AND t.user_id = @uid);
INSERT INTO forum_posts (topic_id, user_id, body)
SELECT t.id, @uid,
'Une bonne adresse tient rarement à sa cave. C''est souvent l''accueil, les fauteuils, ou quelqu''un derrière le comptoir qui sait de quoi il parle.

Quelle est la vôtre, dans quelle ville — et qu''est-ce qui vous y ramène ? Si elle n''est pas encore sur le globe, signalez-la : elle y sera.'
FROM forum_topics t WHERE t.slug = 'le-lounge-ou-vous-revenez-toujours'
  AND NOT EXISTS (SELECT 1 FROM forum_posts p WHERE p.topic_id = t.id);

-- ── Maisons & manufactures ─────────────────────────────────────────
INSERT INTO forum_topics (section_id, user_id, title, slug, lang, posts_count, last_post_at)
SELECT s.id, @uid, 'La maison que vous défendez, et pourquoi', 'la-maison-que-vous-defendez-et-pourquoi', 'fr', 1, NOW()
FROM forum_sections s WHERE s.slug = 'maisons'
  AND NOT EXISTS (SELECT 1 FROM forum_topics t WHERE t.section_id = s.id AND t.user_id = @uid);
INSERT INTO forum_posts (topic_id, user_id, body)
SELECT t.id, @uid,
'Chacun a une maison qu''il défend un peu plus que de raison — parfois contre l''avis général.

La vôtre, et l''argument que vous sortez quand on la critique ? Les histoires de manufacture et les gammes oubliées sont les bienvenues.'
FROM forum_topics t WHERE t.slug = 'la-maison-que-vous-defendez-et-pourquoi'
  AND NOT EXISTS (SELECT 1 FROM forum_posts p WHERE p.topic_id = t.id);

-- ── Rencontres & dégustations ──────────────────────────────────────
INSERT INTO forum_topics (section_id, user_id, title, slug, lang, posts_count, last_post_at)
SELECT s.id, @uid, 'Où êtes-vous ? Retrouvons-nous par région', 'ou-etes-vous-retrouvons-nous-par-region', 'fr', 1, NOW()
FROM forum_sections s WHERE s.slug = 'rencontres'
  AND NOT EXISTS (SELECT 1 FROM forum_topics t WHERE t.section_id = s.id AND t.user_id = @uid);
INSERT INTO forum_posts (topic_id, user_id, body)
SELECT t.id, @uid,
'Fumer seul se fait très bien. À plusieurs, c''est autre chose.

Dites votre ville ou votre région : quand plusieurs personnes se répondent depuis le même coin, une dégustation se monte toute seule.

> Les rendez-vous s''organisent ici à la main pour l''instant. Une fiche d''événement — date, lieu, participants — arrivera dans une prochaine version.'
FROM forum_topics t WHERE t.slug = 'ou-etes-vous-retrouvons-nous-par-region'
  AND NOT EXISTS (SELECT 1 FROM forum_posts p WHERE p.topic_id = t.id);

-- ── Débutants ──────────────────────────────────────────────────────
INSERT INTO forum_topics (section_id, user_id, title, slug, lang, posts_count, last_post_at)
SELECT s.id, @uid, 'Vos questions de débutant, ici, sans jugement', 'vos-questions-de-debutant-ici-sans-jugement', 'fr', 1, NOW()
FROM forum_sections s WHERE s.slug = 'debutants'
  AND NOT EXISTS (SELECT 1 FROM forum_topics t WHERE t.section_id = s.id AND t.user_id = @uid);
INSERT INTO forum_posts (topic_id, user_id, body)
SELECT t.id, @uid,
'Couper ou percer ? Combien de temps ça dure ? Faut-il rallumer ? Pourquoi ça tire d''un seul côté ?

Aucune question n''est trop simple ici, et personne ne se moquera. Ceux qui répondent ont tous posé les mêmes il y a quelques années.'
FROM forum_topics t WHERE t.slug = 'vos-questions-de-debutant-ici-sans-jugement'
  AND NOT EXISTS (SELECT 1 FROM forum_posts p WHERE p.topic_id = t.id);

-- ── Étiquettes de départ ───────────────────────────────────────────
-- Trois usages sont nécessaires pour qu'une étiquette soit proposée en
-- autocomplétion : celles-ci restent sous le seuil, et c'est voulu.
-- L'amorce ouvre la conversation, elle ne décide pas du vocabulaire.
INSERT IGNORE INTO forum_tags (slug, label) VALUES
  ('hygrometrie', 'hygrométrie'),
  ('debuter',     'débuter'),
  ('accords',     'accords'),
  ('adresses',    'adresses');

INSERT IGNORE INTO forum_topic_tags (topic_id, tag_id)
SELECT t.id, g.id FROM forum_topics t, forum_tags g
WHERE (t.slug = 'a-quel-taux-tenez-vous-votre-cave'          AND g.slug = 'hygrometrie')
   OR (t.slug = 'what-humidity-do-you-keep-your-humidor-at'  AND g.slug = 'hygrometrie')
   OR (t.slug = 'vos-questions-de-debutant-ici-sans-jugement' AND g.slug = 'debuter')
   OR (t.slug = 'les-accords-qui-fonctionnent-vraiment'      AND g.slug = 'accords')
   OR (t.slug = 'le-lounge-ou-vous-revenez-toujours'         AND g.slug = 'adresses');

UPDATE forum_tags g SET g.uses_count =
  (SELECT COUNT(*) FROM forum_topic_tags tt WHERE tt.tag_id = g.id);

-- Les compteurs dénormalisés, calculés une fois pour toutes.
UPDATE forum_topics t SET
  t.posts_count  = (SELECT COUNT(*) FROM forum_posts p WHERE p.topic_id = t.id AND p.status <> 'removed'),
  t.last_post_at = (SELECT MAX(p.created_at) FROM forum_posts p WHERE p.topic_id = t.id AND p.status <> 'removed');
