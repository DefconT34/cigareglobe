-- ════════════════════════════════════════════════════════
-- 084 — Deux marques ajoutées, deux marques invisibles
-- ────────────────────────────────────────────────────────
-- Les migrations 081 et 082 ont inséré Casdagli et Capitol dans la table
-- `brands`. Elles étaient trouvables par la recherche et par leur URL,
-- et leur fiche répondait 200.
--
-- Mais la liste des marques d'un pays ne vient PAS de `brands` : elle
-- vient du JSON `producer_countries.brands`, une seconde adresse pour le
-- même fait. Aucune des deux n'y figurait. Le chemin le plus naturel —
-- ouvrir le pays sur le globe, lire ses maisons — ne les montrait pas.
--
-- C'est exactement le défaut de la migration 021, « les onze articles
-- que personne ne pouvait ouvrir », et celui du lot des marques
-- orphelines. Il se reproduit parce que la donnée a deux domiciles et
-- qu'insérer dans l'un n'inscrit rien dans l'autre.
--
-- ── CE QUE J'AI VÉRIFIÉ AVANT DE CORRIGER ───────────────
--
-- Le balayage complet ne trouve que ces deux-là : les 116 autres marques
-- figurent bien dans la fiche de leur pays. Le corpus existant est
-- cohérent — c'est mon insertion qui était incomplète, pas le modèle.
--
-- `coherence_check` est étendu pour que ce trou ne puisse plus passer :
-- il vérifiait déjà qu'un article listé a une fiche, il vérifie
-- désormais l'inverse.
--
-- ── LES DESCRIPTIONS ────────────────────────────────────
--
-- Une ligne chacune, dans le registre des autres : ce qui distingue la
-- maison, pas ce qu'elle proclame. Pour Capitol, je n'ai que le pays —
-- la description le dit et s'arrête là.
-- ════════════════════════════════════════════════════════

UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$',
  JSON_OBJECT('name', 'Casdagli',
              'desc', 'Maison britannique sans champs, roulée au Costa Rica',
              'iconic', false))
WHERE `id` = 'costarica'
  AND JSON_SEARCH(`brands`, 'one', 'Casdagli') IS NULL;

UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$',
  JSON_OBJECT('name', 'Capitol',
              'desc', 'Maison nicaraguayenne, encore peu documentée ici',
              'iconic', false))
WHERE `id` = 'nicaragua'
  AND JSON_SEARCH(`brands`, 'one', 'Capitol') IS NULL;
