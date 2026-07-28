-- ═══════════════════════════════════════════════════════════════════
-- Migration 004 — Modération des avis : signalements
-- ───────────────────────────────────────────────────────────────────
-- Prérequis : migrations 001 (users) et 002 (reviews).
-- Un membre ne peut signaler un avis qu'une seule fois. Un avis signalé
-- reste visible jusqu'à décision d'un modérateur (statut 'removed') :
-- sans cela, un seul signalement suffirait à masquer n'importe quel avis.
-- ═══════════════════════════════════════════════════════════════════

SET NAMES utf8mb4;

CREATE TABLE IF NOT EXISTS review_flags (
  id         INT UNSIGNED NOT NULL AUTO_INCREMENT,
  review_id  INT UNSIGNED NOT NULL,
  user_id    INT UNSIGNED NOT NULL,
  reason     VARCHAR(255) DEFAULT NULL,
  created_at TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uq_flag_review_user (review_id, user_id),
  KEY idx_flag_review (review_id),
  CONSTRAINT fk_flag_review FOREIGN KEY (review_id) REFERENCES reviews(id) ON DELETE CASCADE,
  CONSTRAINT fk_flag_user   FOREIGN KEY (user_id)   REFERENCES users(id)   ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
