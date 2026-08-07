-- ═══════════════════════════════════════════════════════════════════
-- Migration 011 — Coordonnées des contributions
-- ───────────────────────────────────────────────────────────────────
-- « Signaler un établissement » ne demandait qu'une adresse en texte
-- libre. Un contributeur qui se trouve SUR PLACE connaît pourtant la
-- position exacte : son téléphone la lui donne au mètre près.
--
-- Deux colonnes suffisent, et elles sont NULL par défaut : la
-- géolocalisation est une faveur, pas une condition. Un signalement
-- envoyé depuis un ordinateur de bureau reste parfaitement valable.
--
-- DECIMAL(10,7) et non FLOAT : sept décimales valent ~1 cm, et un
-- décimal ne dérive pas à l'arrondi comme un flottant binaire. C'est
-- déjà le type retenu pour `lounge_countries.lat/lon`.
--
-- `approved_lounges` reçoit les mêmes colonnes : sans cela la position
-- serait recueillie puis perdue à l'approbation, ce qui est pire que de
-- ne pas la demander.
-- ═══════════════════════════════════════════════════════════════════

ALTER TABLE contributions
  ADD COLUMN lat DECIMAL(10,7) NULL DEFAULT NULL COMMENT 'Position relevée sur place, si le contributeur l a partagée',
  ADD COLUMN lon DECIMAL(10,7) NULL DEFAULT NULL;

ALTER TABLE approved_lounges
  ADD COLUMN lat DECIMAL(10,7) NULL DEFAULT NULL,
  ADD COLUMN lon DECIMAL(10,7) NULL DEFAULT NULL;
