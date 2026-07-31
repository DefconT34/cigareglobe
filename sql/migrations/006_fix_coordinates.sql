-- ═══════════════════════════════════════════════════════════════════
-- Migration 006 — Correction de deux coordonnées erronées
-- ───────────────────────────────────────────────────────────────────
-- Audit géométrique de l'ensemble des points du globe (12 producteurs,
-- 10 marchés, 93 pays à lounges, 37 zones de production) par test
-- d'appartenance au polygone du pays (ray casting sur les frontières
-- réelles de assets/data/countries-110m.json).
--
-- Deux points tombaient hors de leur pays :
--
--  1. Israël (31.5, 35.0) → le point tombait en Cisjordanie, soit dans
--     le polygone « Palestine » de la carte de référence, à 52 km du
--     centroïde officiel du pays. Corrigé en (31.2, 34.9), nord du
--     Néguev, à l'intérieur d'Israël.
--
--  2. Semi Vuelta, Cuba (22.4, -83.0) → le point tombait en mer, dans
--     le golfe de Batabanó, à 39 km de la côte. La région se situe au
--     nord-est de Vuelta Abajo, vers Consolación del Sur. Corrigé en
--     (22.6, -83.2).
--
-- Points signalés mais NON corrigés (artefacts de résolution, pas des
-- erreurs) : Aruba, Bahreïn, Barbade, Caïmans, St-Martin, St-Kitts,
-- Lombok et Ilocos Norte sont exacts à moins de 15 km de leur valeur
-- de référence — ils apparaissent « en mer » uniquement parce que ces
-- îles sont absentes ou généralisées dans la carte 110m. Le centroïde
-- officiel des Philippines (12.8797, 121.774) est lui réellement en
-- mer de Sibuyan, entre les îles : c'est la convention retenue pour
-- l'archipel, conservée telle quelle.
-- ═══════════════════════════════════════════════════════════════════

UPDATE lounge_countries
   SET lat = 31.2, lon = 34.9
 WHERE id = 'israel';

UPDATE production_zones
   SET lat = 22.6, lon = -83.2
 WHERE country_id = 'cuba' AND name = 'Semi Vuelta';
