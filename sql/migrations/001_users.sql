-- ═══════════════════════════════════════════════════════════════════
-- Migration 001 — Espace client : comptes utilisateurs (Étape A)
-- ───────────────────────────────────────────────────────────────────
-- À exécuter une fois sur la base (phpMyAdmin → Importer, ou mysql CLI).
-- Idempotent : CREATE TABLE IF NOT EXISTS.
-- ═══════════════════════════════════════════════════════════════════

SET NAMES utf8mb4;

-- ── Comptes ─────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS users (
  id             INT UNSIGNED NOT NULL AUTO_INCREMENT,
  email          VARCHAR(190) NOT NULL,
  password_hash  VARCHAR(255) NOT NULL,
  display_name   VARCHAR(80)  NOT NULL,
  role           ENUM('member','trusted','moderator','admin') NOT NULL DEFAULT 'member',
  email_verified TINYINT(1)   NOT NULL DEFAULT 0,
  avatar_url     VARCHAR(500) DEFAULT NULL,
  bio            VARCHAR(500) DEFAULT NULL,
  status         ENUM('active','suspended') NOT NULL DEFAULT 'active',
  created_at     TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  last_login_at  DATETIME     DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uq_users_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ── Jetons email (vérification + réinitialisation) ──────────────────
-- On stocke le SHA-256 du jeton, jamais le jeton brut (envoyé par email).
CREATE TABLE IF NOT EXISTS email_tokens (
  id         INT UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id    INT UNSIGNED NOT NULL,
  token_hash CHAR(64)     NOT NULL,
  type       ENUM('verify','reset') NOT NULL,
  expires_at DATETIME     NOT NULL,
  used_at    DATETIME     DEFAULT NULL,
  created_at TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY idx_et_user (user_id),
  KEY idx_et_token (token_hash),
  CONSTRAINT fk_et_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ── Tentatives (limitation de débit anti-brute-force) ───────────────
CREATE TABLE IF NOT EXISTS auth_attempts (
  id         INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ip         VARCHAR(45)  NOT NULL,
  action     VARCHAR(20)  NOT NULL,   -- 'login' | 'register' | 'forgot'
  created_at TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY idx_aa_ip_action_time (ip, action, created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
