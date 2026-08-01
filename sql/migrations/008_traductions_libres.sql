-- ═══════════════════════════════════════════════════════════════════
-- Migration 008 — Dictionnaire de traductions libres
-- ───────────────────────────────────────────────────────────────────
-- La migration 007 a doublé les colonnes scalaires. Elle ne pouvait
-- rien pour le texte libre enfermé DANS des colonnes JSON :
--
--   producer_countries.brands      → [{name, desc, iconic}, …]
--   habanos_presence.factories     → [{name, city, marques[]}, …]
--   habanos_presence.certifications, .distributeurs
--
-- Doubler ces colonnes reviendrait à maintenir cinq copies d'une
-- structure — et à retraduire un texte identique autant de fois qu'il
-- apparaît. On indexe donc sur le TEXTE SOURCE : une phrase ne se
-- traduit qu'une fois, où qu'elle apparaisse.
--
-- Le même dictionnaire servira à tout futur texte libre, sans nouvelle
-- migration.
--
-- La clé primaire porte sur une empreinte : MySQL limite la longueur
-- indexable, et les sources vont de deux mots à une phrase entière.
-- ═══════════════════════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS content_translations (
    source_hash  CHAR(40)     NOT NULL COMMENT 'sha1 du texte source',
    lang         CHAR(2)      NOT NULL,
    source_text  TEXT         NOT NULL COMMENT 'conservé pour la relecture',
    target_text  TEXT         NOT NULL,
    updated_at   TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP
                              ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (source_hash, lang)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
