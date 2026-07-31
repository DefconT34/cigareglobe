-- ═══════════════════════════════════════════════════════════════════
-- Migration 005 — Retrait de la table country_polygons
-- ───────────────────────────────────────────────────────────────────
-- Les contours des pays producteurs provenaient de polygones saisis à la
-- main (9 à 28 points par pays), sources de plusieurs erreurs : le
-- contour dominicain couvrait Haïti, l'Indonésie était amputée de sa
-- moitié orientale, le sud du Cameroun et de la Floride manquaient.
--
-- Ils sont désormais tracés à partir de la carte du monde déjà chargée
-- par le front (assets/data/countries-110m.json) : frontières exactes,
-- archipels compris, et aucun polygone à maintenir en base. Plus aucun
-- code n'interroge cette table.
--
-- Aucune autre table n'en dépend (sa seule clé étrangère pointait *vers*
-- producer_countries). Les polygones restent consultables dans
-- l'historique Git : assets/js/data.polys.js, avant le commit 5539858.
-- ═══════════════════════════════════════════════════════════════════

DROP TABLE IF EXISTS country_polygons;
