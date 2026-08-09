-- ═══════════════════════════════════════════════════════════════════
-- Migration 017 — Espace communautaire, V2 : les événements
-- ───────────────────────────────────────────────────────────────────
-- Cadrage §6 de docs/communaute.md.
--
-- UN ÉVÉNEMENT EST UN SUJET, il n'en possède pas un. D'où `topic_id` en
-- clé PRIMAIRE plutôt qu'un `id` propre : la table ne fait qu'ajouter
-- des champs structurés à une discussion qui existe déjà. La
-- conséquence est celle qu'on cherchait — la préparation d'une
-- dégustation se discute dans le fil du sujet, et il n'y a pas un
-- second système de commentaires à écrire, à modérer et à traduire.
--
-- L'HEURE EST STOCKÉE EN UTC, le fuseau du LIEU à côté. Les deux sont
-- nécessaires et aucun ne remplace l'autre :
--
--   · l'UTC seul ne dit pas à quelle heure locale la rencontre commence.
--     « 19 h à La Havane » n'est pas une information dérivable d'un
--     instant sans savoir où l'on se trouve ;
--   · le fuseau seul ne permet pas de trier ni de comparer deux
--     événements sur deux continents ;
--   · une heure locale « nue » se décale d'une heure deux fois par an,
--     et le décalage n'arrive pas le même jour partout.
--
-- On garde donc l'instant (UTC) pour l'ordre et les rappels, et le
-- fuseau pour l'affichage. `Intl.DateTimeFormat` fait le reste côté
-- front, sans table de correspondance à maintenir.
--
-- PAS DE BILLETTERIE. Aucun champ de prix, aucun état de paiement : le
-- site n'encaisse rien (§10). Un lien vers la billetterie de
-- l'organisateur se met dans la description, comme n'importe quel lien.
-- ═══════════════════════════════════════════════════════════════════

-- La rubrique qui accueille les événements. Reportée de la migration
-- 015, où la colonne aurait été à zéro partout — du poids mort.
ALTER TABLE forum_sections
  ADD COLUMN is_events TINYINT(1) NOT NULL DEFAULT 0
      COMMENT 'La rubrique affiche un agenda plutot qu''une liste de sujets';

UPDATE forum_sections SET is_events = 1 WHERE slug = 'rencontres';

-- ── L'événement ────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS forum_events (
  topic_id      INT UNSIGNED NOT NULL,
  starts_at     DATETIME     NOT NULL COMMENT 'Instant de debut, en UTC',
  ends_at       DATETIME     NULL     COMMENT 'Instant de fin, en UTC',
  timezone      VARCHAR(64)  NOT NULL DEFAULT 'Europe/Paris'
                COMMENT 'Fuseau du LIEU : c''est lui qui donne l''heure affichee',
  kind          ENUM('degustation','rencontre','artisan','salon','enligne')
                NOT NULL DEFAULT 'rencontre',
  -- Le lieu : soit un etablissement de l'atlas (recommande, il porte
  -- deja son adresse et ses coordonnees), soit une adresse libre.
  lounge_id     INT UNSIGNED NULL,
  place_label   VARCHAR(160) NULL,
  lat           DECIMAL(9,6) NULL,
  lon           DECIMAL(9,6) NULL,
  capacity      SMALLINT UNSIGNED NULL COMMENT 'NULL = sans limite',
  status        ENUM('upcoming','past','cancelled') NOT NULL DEFAULT 'upcoming',
  cancel_reason VARCHAR(300) NULL,
  created_at    TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at    TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (topic_id),
  KEY idx_forum_events_when (starts_at, status),
  KEY idx_forum_events_lounge (lounge_id, starts_at),
  CONSTRAINT fk_forum_events_topic  FOREIGN KEY (topic_id)  REFERENCES forum_topics (id) ON DELETE CASCADE,
  CONSTRAINT fk_forum_events_lounge FOREIGN KEY (lounge_id) REFERENCES lounges (id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ── Les participants ───────────────────────────────────────────────
-- `rank_no` porte l'ordre d'inscription. La liste d'attente n'est pas
-- un état de plus : elle se DÉDUIT de cet ordre et de la capacité. Un
-- état stocké se désynchroniserait à la première annulation — celui qui
-- se désiste au milieu de la liste ferait remonter tout le monde, et il
-- faudrait réécrire chaque ligne pour le refléter.
CREATE TABLE IF NOT EXISTS forum_attendance (
  topic_id   INT UNSIGNED NOT NULL,
  user_id    INT UNSIGNED NOT NULL,
  state      ENUM('interested','going','cancelled') NOT NULL DEFAULT 'going',
  rank_no    INT UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Ordre d''inscription : sert la liste d''attente',
  reminded_at DATETIME NULL COMMENT 'Rappel J-2 envoye : garantit qu''il ne part qu''une fois',
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (topic_id, user_id),
  KEY idx_forum_attendance_user (user_id),
  KEY idx_forum_attendance_rank (topic_id, state, rank_no),
  CONSTRAINT fk_forum_att_topic FOREIGN KEY (topic_id) REFERENCES forum_events (topic_id) ON DELETE CASCADE,
  CONSTRAINT fk_forum_att_user  FOREIGN KEY (user_id)  REFERENCES users (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
