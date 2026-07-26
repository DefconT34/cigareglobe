-- ═══════════════════════════════════════════════════════════════════
-- Migration 002 — Étape B : contributions attribuées + avis (reviews)
-- ───────────────────────────────────────────────────────────────────
-- Prérequis : migration 001 (table users) déjà exécutée.
-- À exécuter une fois. NB : MySQL ne supporte pas ADD COLUMN IF NOT
-- EXISTS — si la colonne existe déjà, ignorer l'erreur correspondante.
-- ═══════════════════════════════════════════════════════════════════

SET NAMES utf8mb4;

-- ── Rattacher les contributions à un compte ─────────────────────────
-- user_id NULL = ancienne contribution anonyme (avant comptes).
ALTER TABLE contributions
  ADD COLUMN user_id INT UNSIGNED NULL AFTER id;
ALTER TABLE contributions
  ADD KEY idx_contrib_user (user_id);

-- ── Avis vérifiés (remplacent la notation par IP) ───────────────────
-- Un avis par utilisateur et par établissement (note obligatoire,
-- titre/texte optionnels). La moyenne de lounges.rating se recalcule
-- désormais depuis cette table.
CREATE TABLE IF NOT EXISTS reviews (
  id         INT UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id    INT UNSIGNED NOT NULL,
  lounge_id  INT UNSIGNED NOT NULL,
  rating     TINYINT UNSIGNED NOT NULL,            -- 1..5
  title      VARCHAR(120) DEFAULT NULL,
  body       TEXT         DEFAULT NULL,
  status     ENUM('published','flagged','removed') NOT NULL DEFAULT 'published',
  created_at TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uq_reviews_user_lounge (user_id, lounge_id),
  KEY idx_reviews_lounge (lounge_id),
  CONSTRAINT fk_reviews_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
