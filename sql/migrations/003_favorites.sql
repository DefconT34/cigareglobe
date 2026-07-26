-- ═══════════════════════════════════════════════════════════════════
-- Migration 003 — Étape C : favoris & listes
-- ───────────────────────────────────────────────────────────────────
-- Prérequis : migration 001 (users). À exécuter une fois.
-- Schéma unifié target_type + target_id : gère aussi bien les lounges
-- (target_id = id numérique en texte) que les pays (target_id = country_id).
-- Une entrée par (utilisateur, cible, liste).
-- ═══════════════════════════════════════════════════════════════════

SET NAMES utf8mb4;

CREATE TABLE IF NOT EXISTS favorites (
  id          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id     INT UNSIGNED NOT NULL,
  target_type ENUM('lounge','country') NOT NULL,
  target_id   VARCHAR(50)  NOT NULL,
  list        ENUM('to_visit','visited','favorite') NOT NULL DEFAULT 'favorite',
  created_at  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uq_fav (user_id, target_type, target_id, list),
  KEY idx_fav_user (user_id),
  KEY idx_fav_target (target_type, target_id),
  CONSTRAINT fk_fav_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
