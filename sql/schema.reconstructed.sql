-- ═══════════════════════════════════════════════════════════════════
-- CigarGlobe — schéma RECONSTRUIT depuis le code PHP (data/api/photos/admin)
-- ───────────────────────────────────────────────────────────────────
-- ⚠ PROVISOIRE : les noms de tables/colonnes sont exacts (tirés des requêtes),
-- mais les TYPES sont estimés. À remplacer par un vrai `mysqldump --no-data`
-- dès que possible (voir sql/README.md). Sert de documentation de travail.
-- Charset attendu : utf8mb4 / utf8mb4_unicode_ci
-- ═══════════════════════════════════════════════════════════════════

SET NAMES utf8mb4;

-- ── Pays producteurs ────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS producer_countries (
  id          VARCHAR(50)  NOT NULL,
  name        VARCHAR(120) NOT NULL,
  flag        VARCHAR(16),
  lat         DECIMAL(9,6),
  lon         DECIMAL(9,6),
  region      VARCHAR(80),
  tier        VARCHAR(40),
  color       VARCHAR(16),
  production  VARCHAR(255),
  revenue     VARCHAR(255),
  rev_detail  TEXT,
  harvest     VARCHAR(255),
  climate     VARCHAR(255),
  soil        VARCHAR(255),
  tabacaleras JSON,
  regions     JSON,
  varieties   JSON,
  notes       TEXT,
  brands      JSON,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ── Données géographiques d'un pays producteur ──────────────────────
CREATE TABLE IF NOT EXISTS producer_geo (
  country_id  VARCHAR(50) NOT NULL,
  capital     VARCHAR(120),
  population  VARCHAR(60),
  area        VARCHAR(60),
  currency    VARCHAR(60),
  language    VARCHAR(120),
  coords      VARCHAR(80),
  timezone    VARCHAR(60),
  gdp         VARCHAR(80),
  independent VARCHAR(60),
  PRIMARY KEY (country_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ── Zones de production (points sur le globe) ───────────────────────
CREATE TABLE IF NOT EXISTS production_zones (
  id         INT UNSIGNED NOT NULL AUTO_INCREMENT,
  country_id VARCHAR(50)  NOT NULL,
  name       VARCHAR(120),
  lat        DECIMAL(9,6),
  lon        DECIMAL(9,6),
  note       TEXT,
  color      VARCHAR(16),
  PRIMARY KEY (id),
  KEY idx_pz_country (country_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ── Polygones (contours pays) ───────────────────────────────────────
CREATE TABLE IF NOT EXISTS country_polygons (
  country_id VARCHAR(50) NOT NULL,
  points     LONGTEXT,   -- JSON (tableau de coordonnées)
  PRIMARY KEY (country_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ── Marchés mondiaux ────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS markets (
  id          VARCHAR(50)  NOT NULL,
  name        VARCHAR(120) NOT NULL,
  flag        VARCHAR(16),
  lat         DECIMAL(9,6),
  lon         DECIMAL(9,6),
  rank_num    INT,
  consumption VARCHAR(120),
  cigars      VARCHAR(120),
  share       VARCHAR(60),
  trend       VARCHAR(60),
  top_brands  JSON,
  note        TEXT,
  color       VARCHAR(16),
  PRIMARY KEY (id),
  KEY idx_markets_rank (rank_num)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ── Pays disposant de lounges (marqueurs) ───────────────────────────
CREATE TABLE IF NOT EXISTS lounge_countries (
  id    VARCHAR(50)  NOT NULL,
  name  VARCHAR(120) NOT NULL,
  flag  VARCHAR(16),
  lat   DECIMAL(9,6),
  lon   DECIMAL(9,6),
  color VARCHAR(16),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ── Lounges / établissements (données vérifiées) ────────────────────
CREATE TABLE IF NOT EXISTS lounges (
  id             INT UNSIGNED NOT NULL AUTO_INCREMENT,
  country_id     VARCHAR(50)  NOT NULL,
  name           VARCHAR(200) NOT NULL,
  city           VARCHAR(200),
  type           VARCHAR(100),
  phone          VARCHAR(50),
  price          VARCHAR(20),
  description    TEXT,
  description_en TEXT,
  description_es TEXT,
  description_de TEXT,
  description_zh TEXT,
  description_ar TEXT,
  source         VARCHAR(500),
  hours          VARCHAR(255),
  maps_url       VARCHAR(500),
  website        VARCHAR(500),
  instagram      VARCHAR(255),
  rating         DECIMAL(3,2) DEFAULT 0,
  rating_count   INT UNSIGNED DEFAULT 0,
  is_verified    TINYINT(1)   NOT NULL DEFAULT 0,
  PRIMARY KEY (id),
  KEY idx_lounges_country (country_id),
  KEY idx_lounges_verified (is_verified)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ── Photos de lounges ───────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS lounge_photos (
  id          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  lounge_id   INT UNSIGNED NOT NULL,
  filename    VARCHAR(255) NOT NULL,
  caption     VARCHAR(255),
  is_primary  TINYINT(1) NOT NULL DEFAULT 0,
  is_approved TINYINT(1) NOT NULL DEFAULT 1,
  uploaded_by VARCHAR(50)  DEFAULT 'admin',
  uploader_ip VARCHAR(45),
  sort_order  INT NOT NULL DEFAULT 0,
  created_at  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY idx_lp_lounge (lounge_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ── Notes des lounges (1 vote par IP) ───────────────────────────────
CREATE TABLE IF NOT EXISTS lounge_ratings (
  id        INT UNSIGNED NOT NULL AUTO_INCREMENT,
  lounge_id INT UNSIGNED NOT NULL,
  voter_ip  VARCHAR(45)  NOT NULL,
  rating    TINYINT UNSIGNED NOT NULL,   -- 1..5
  rated_at  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uq_lr_lounge_ip (lounge_id, voter_ip)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ── Marques / maisons ───────────────────────────────────────────────
-- Champs multilingues : *_en, *_es, *_de, *_zh, *_ar (fallback sur FR)
CREATE TABLE IF NOT EXISTS brands (
  name           VARCHAR(120) NOT NULL,
  country_id     VARCHAR(50),
  founded        VARCHAR(60),
  history        TEXT,
  history_en TEXT, history_es TEXT, history_de TEXT, history_zh TEXT, history_ar TEXT,
  gamme          JSON,
  gamme_en TEXT, gamme_es TEXT, gamme_de TEXT, gamme_zh TEXT, gamme_ar TEXT,
  scores         JSON,
  celebrities    JSON,
  celebrities_en TEXT, celebrities_es TEXT, celebrities_de TEXT, celebrities_zh TEXT, celebrities_ar TEXT,
  pairings       JSON,
  pairings_en TEXT, pairings_es TEXT, pairings_de TEXT, pairings_zh TEXT, pairings_ar TEXT,
  limited_eds    JSON,
  -- colonnes legacy tolérées par le code :
  notes_en TEXT, notes_es TEXT, notes_de TEXT, notes_zh TEXT, notes_ar TEXT,
  PRIMARY KEY (name),
  KEY idx_brands_country (country_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ── Présence Habanos par pays ───────────────────────────────────────
CREATE TABLE IF NOT EXISTS habanos_presence (
  country_id          VARCHAR(50) NOT NULL,
  present             TINYINT(1) NOT NULL DEFAULT 0,
  status_color        VARCHAR(16),
  factories           JSON,
  marques_officielles JSON,
  distributeurs       JSON,
  certifications      JSON,
  PRIMARY KEY (country_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ── Contributions communautaires (avant validation) ─────────────────
CREATE TABLE IF NOT EXISTS contributions (
  id                INT UNSIGNED NOT NULL AUTO_INCREMENT,
  country_id        VARCHAR(50)  NOT NULL,
  country_name      VARCHAR(100),
  name              VARCHAR(200) NOT NULL,
  city              VARCHAR(200),
  type              VARCHAR(100),
  phone             VARCHAR(50),
  description       TEXT,
  source_url        VARCHAR(500),
  contributor_email VARCHAR(200),
  contributor_ip    VARCHAR(45),
  votes_up          INT NOT NULL DEFAULT 0,
  votes_down        INT NOT NULL DEFAULT 0,
  status            ENUM('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  created_at        TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  approved_at       TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id),
  KEY idx_contrib_country (country_id),
  KEY idx_contrib_status (status),
  KEY idx_contrib_ip (contributor_ip)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ── Votes sur contributions (1 par IP) ──────────────────────────────
CREATE TABLE IF NOT EXISTS votes (
  id              INT UNSIGNED NOT NULL AUTO_INCREMENT,
  contribution_id INT UNSIGNED NOT NULL,
  voter_ip        VARCHAR(45)  NOT NULL,
  vote            TINYINT NOT NULL,   -- 1 ou -1
  PRIMARY KEY (id),
  UNIQUE KEY uq_votes_contrib_ip (contribution_id, voter_ip)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ── Lounges validés par la communauté ───────────────────────────────
CREATE TABLE IF NOT EXISTS approved_lounges (
  id              INT UNSIGNED NOT NULL AUTO_INCREMENT,
  contribution_id INT UNSIGNED NOT NULL,
  country_id      VARCHAR(50)  NOT NULL,
  country_name    VARCHAR(100),
  name            VARCHAR(200) NOT NULL,
  city            VARCHAR(200),
  type            VARCHAR(100),
  phone           VARCHAR(50),
  description     TEXT,
  source_url      VARCHAR(500),
  status          VARCHAR(20) NOT NULL DEFAULT 'approved',
  approved_at     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uq_al_contribution (contribution_id),
  KEY idx_al_country (country_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
