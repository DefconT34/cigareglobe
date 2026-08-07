-- ═══════════════════════════════════════════════════════════════════
-- Migration 012 — Coordonnées des établissements
-- ───────────────────────────────────────────────────────────────────
-- Pour afficher « à 3,2 km de vous » sur une fiche d'établissement, il
-- faut savoir où il est. Or `lounges` ne portait aucune coordonnée :
--
--   499 établissements, 0 avec position
--   419 avec `maps_url`, mais ce sont des URL de RECHERCHE Google par
--       nom et adresse (…/maps/search/?api=1&query=Zino%20Cigares…),
--       pas des points. On n'en extrait rien.
--
-- D'où ces deux colonnes, NULL par défaut. Elles resteront vides au
-- lendemain de cette migration, et c'est assumé : la distance ne
-- s'affiche que pour un établissement qui a réellement une position.
-- Afficher les coordonnées du PAYS à la place aurait donné la même
-- distance aux 31 établissements américains, présentée comme celle du
-- lounge — un chiffre faux vaut moins que pas de chiffre.
--
-- Elles se rempliront par les contributions géolocalisées (migration
-- 011) : un contributeur sur place transmet la position, elle suit
-- jusqu'à `approved_lounges`, et de là jusqu'ici.
--
-- L'ITINÉRAIRE, lui, fonctionne sans coordonnées : Google Maps résout
-- une destination en texte. Il est donc proposé sur toutes les fiches
-- dès aujourd'hui.
--
-- DECIMAL(10,7) : même type que `contributions.lat/lon` et
-- `lounge_countries`, sept décimales valant ~1 cm.
-- ═══════════════════════════════════════════════════════════════════

ALTER TABLE lounges
  ADD COLUMN lat DECIMAL(10,7) NULL DEFAULT NULL COMMENT 'Position exacte, si connue (contribution geolocalisee)',
  ADD COLUMN lon DECIMAL(10,7) NULL DEFAULT NULL;
