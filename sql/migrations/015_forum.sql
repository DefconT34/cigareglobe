-- ═══════════════════════════════════════════════════════════════════
-- Migration 015 — Espace communautaire, V1 : les discussions
-- ───────────────────────────────────────────────────────────────────
-- Cadrage complet dans docs/communaute.md. Cette migration ne pose que
-- ce que la V1 utilise : sujets, réponses, étiquettes, signalements.
-- Les événements (forum_events, forum_attendance) viendront avec la V2 ;
-- poser leurs tables maintenant serait du poids mort.
--
-- TROIS CHOIX QUI SE VOIENT DANS LE SCHÉMA
--
--   1. LES LIBELLÉS DES RUBRIQUES NE SONT PAS EN BASE. Seul le `slug`
--      l'est. Une rubrique est un élément d'INTERFACE — une liste fixe,
--      décidée éditorialement, qui ne change qu'avec une migration —
--      pas du contenu saisi par quelqu'un. Elle suit donc la règle du
--      projet : l'interface vit dans i18n.js (clés `forum_sec_<slug>`),
--      traduite côté front. Aucune colonne de langue, aucun appel à
--      content_translations, et le serveur ne traduit toujours pas.
--
--   2. user_id EST NULLABLE, avec ON DELETE SET NULL. C'est l'inverse
--      des avis (fk_reviews_user CASCADE), et c'est voulu : effacer les
--      messages d'un compte supprimé trouerait des conversations
--      entières et rendrait la suite incompréhensible. Le message reste,
--      signé « Membre supprimé ». Le droit à l'effacement est satisfait
--      par l'anonymisation, la lisibilité de l'archive aussi.
--
--   3. posts_count ET last_post_at SONT DÉNORMALISÉS. Une liste de
--      rubrique affiche vingt sujets ; les recalculer ferait vingt
--      COUNT(*) et vingt MAX() par affichage. Ils sont tenus à jour à
--      l'écriture, dans la même transaction que le message.
--
-- La langue est une propriété du SUJET (`lang`), pas du site : c'est ce
-- qui permet le filtre du §9 du cahier des charges. Un forum multilingue
-- sans ce champ se fragmente en six communautés qui ne se voient pas.
-- ═══════════════════════════════════════════════════════════════════

-- ── Rubriques : liste fermée, courte, ordonnée ──────────────────────
CREATE TABLE IF NOT EXISTS forum_sections (
  id         TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  slug       VARCHAR(40)  NOT NULL COMMENT 'Clé i18n : forum_sec_<slug>',
  icon       VARCHAR(8)   NOT NULL DEFAULT '',
  position   TINYINT UNSIGNED NOT NULL DEFAULT 0,
  created_at TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uq_forum_sections_slug (slug)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ── Sujets ─────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS forum_topics (
  id           INT UNSIGNED NOT NULL AUTO_INCREMENT,
  section_id   TINYINT UNSIGNED NOT NULL,
  user_id      INT UNSIGNED NULL,
  title        VARCHAR(140) NOT NULL,
  slug         VARCHAR(160) NOT NULL COMMENT 'URL lisible ; l''unicité vient de l''id qui la suit',
  lang         VARCHAR(5)   NOT NULL DEFAULT 'fr' COMMENT 'Langue d''écriture, sert au filtre',
  -- Ancrage sur l'atlas : un sujet peut porter sur une entité du site,
  -- et la fiche correspondante affiche ses discussions en retour.
  ref_type     ENUM('lounge','brand','country') NULL,
  ref_id       VARCHAR(80)  NULL,
  status       ENUM('open','locked','flagged','removed') NOT NULL DEFAULT 'open',
  is_pinned    TINYINT(1)   NOT NULL DEFAULT 0,
  solved_post_id INT UNSIGNED NULL,
  views        INT UNSIGNED NOT NULL DEFAULT 0,
  posts_count  INT UNSIGNED NOT NULL DEFAULT 0,
  last_post_at TIMESTAMP    NULL DEFAULT NULL,
  created_at   TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at   TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY idx_forum_topics_section (section_id, is_pinned, last_post_at),
  KEY idx_forum_topics_lang    (lang),
  KEY idx_forum_topics_ref     (ref_type, ref_id),
  KEY idx_forum_topics_user    (user_id),
  CONSTRAINT fk_forum_topics_section FOREIGN KEY (section_id) REFERENCES forum_sections (id),
  CONSTRAINT fk_forum_topics_user    FOREIGN KEY (user_id)    REFERENCES users (id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ── Messages ───────────────────────────────────────────────────────
-- Fil PLAT : pas d'arborescence, une citation optionnelle suffit. Les
-- réponses imbriquées deviennent illisibles au-delà de deux niveaux.
CREATE TABLE IF NOT EXISTS forum_posts (
  id            INT UNSIGNED NOT NULL AUTO_INCREMENT,
  topic_id      INT UNSIGNED NOT NULL,
  user_id       INT UNSIGNED NULL,
  body          TEXT NOT NULL COMMENT 'Markdown restreint, stocké BRUT ; le rendu échappe',
  quote_post_id INT UNSIGNED NULL,
  status        ENUM('published','flagged','removed') NOT NULL DEFAULT 'published',
  edited_at     DATETIME NULL DEFAULT NULL,
  created_at    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY idx_forum_posts_topic (topic_id, created_at),
  KEY idx_forum_posts_user  (user_id, created_at),
  CONSTRAINT fk_forum_posts_topic FOREIGN KEY (topic_id) REFERENCES forum_topics (id) ON DELETE CASCADE,
  CONSTRAINT fk_forum_posts_user  FOREIGN KEY (user_id)  REFERENCES users (id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ── Étiquettes : libres, plates, gouvernées par l'usage ────────────
CREATE TABLE IF NOT EXISTS forum_tags (
  id         INT UNSIGNED NOT NULL AUTO_INCREMENT,
  slug       VARCHAR(50) NOT NULL,
  label      VARCHAR(50) NOT NULL COMMENT 'Première graphie rencontrée, pour l''affichage',
  uses_count INT UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Sous 3, non proposée en autocomplétion',
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uq_forum_tags_slug (slug)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS forum_topic_tags (
  topic_id INT UNSIGNED NOT NULL,
  tag_id   INT UNSIGNED NOT NULL,
  PRIMARY KEY (topic_id, tag_id),
  KEY idx_forum_topic_tags_tag (tag_id),
  CONSTRAINT fk_ftt_topic FOREIGN KEY (topic_id) REFERENCES forum_topics (id) ON DELETE CASCADE,
  CONSTRAINT fk_ftt_tag   FOREIGN KEY (tag_id)   REFERENCES forum_tags (id)   ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ── Signalements ───────────────────────────────────────────────────
-- Même modèle que review_flags : un signalement par personne et par
-- message, et un seuil qui masque sans attendre un modérateur.
CREATE TABLE IF NOT EXISTS forum_flags (
  id          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  post_id     INT UNSIGNED NOT NULL,
  user_id     INT UNSIGNED NULL,
  reason      ENUM('offtopic','ad','abuse','wrong','other') NOT NULL DEFAULT 'other',
  note        VARCHAR(300) NULL,
  created_at  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  resolved_at DATETIME NULL DEFAULT NULL,
  resolved_by INT UNSIGNED NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uq_forum_flags_post_user (post_id, user_id),
  KEY idx_forum_flags_open (resolved_at),
  CONSTRAINT fk_forum_flags_post FOREIGN KEY (post_id) REFERENCES forum_posts (id) ON DELETE CASCADE,
  CONSTRAINT fk_forum_flags_user FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ── « 👍 utile » ───────────────────────────────────────────────────
-- UNE seule réaction, volontairement. Un jeu d'émojis transforme le
-- compteur en bruit ; un signal unique remonte les bonnes réponses.
CREATE TABLE IF NOT EXISTS forum_reactions (
  post_id    INT UNSIGNED NOT NULL,
  user_id    INT UNSIGNED NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (post_id, user_id),
  CONSTRAINT fk_forum_react_post FOREIGN KEY (post_id) REFERENCES forum_posts (id) ON DELETE CASCADE,
  CONSTRAINT fk_forum_react_user FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ── Suivi d'un sujet ───────────────────────────────────────────────
-- Sans usage en V1 (les notifications sont l'étape 4) mais posée ici :
-- suivre un sujet est un geste qu'on veut enregistrer dès l'ouverture,
-- sinon les premiers mois de discussions n'auront personne à prévenir.
CREATE TABLE IF NOT EXISTS forum_follows (
  topic_id   INT UNSIGNED NOT NULL,
  user_id    INT UNSIGNED NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (topic_id, user_id),
  CONSTRAINT fk_forum_follows_topic FOREIGN KEY (topic_id) REFERENCES forum_topics (id) ON DELETE CASCADE,
  CONSTRAINT fk_forum_follows_user  FOREIGN KEY (user_id)  REFERENCES users (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ── Les huit rubriques ─────────────────────────────────────────────
-- Assez pour orienter, assez peu pour que chacune vive. « Rencontres »
-- ouvre en V1 comme rubrique de discussion ordinaire — on s'y donne
-- rendez-vous à la main — et gagnera ses champs structurés en V2.
INSERT IGNORE INTO forum_sections (slug, icon, position) VALUES
  ('cigares',      '🚬', 1),
  ('conservation', '💧', 2),
  ('degustation',  '🥃', 3),
  ('etablissements','🏛', 4),
  ('maisons',      '🏭', 5),
  ('rencontres',   '📅', 6),
  ('debutants',    '🌱', 7),
  ('regie',        '⚙',  8);
