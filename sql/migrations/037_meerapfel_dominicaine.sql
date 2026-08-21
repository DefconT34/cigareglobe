-- ════════════════════════════════════════════════════════
-- 037 — Meerapfel manquait là où ses cigares sont roulés
-- ────────────────────────────────────────────────────────
-- La migration 026 avait corrigé l'article : Meerapfel n'est pas « la
-- première maison camerounaise », elle négocie la cape du Cameroun et
-- fait ROULER SES CIGARES EN RÉPUBLIQUE DOMINICAINE. Son champ
-- `factory` le dit depuis : « Cape sélectionnée au Cameroun, cigares
-- roulés en Rép. dominicaine ».
--
-- Mais la fiche dominicaine ne la listait pas. Encore le motif du lot 5 :
-- LA CORRECTION A SUIVI LE CHAMP, PAS LA DONNÉE. L'article a été
-- corrigé, le rattachement est resté à moitié fait.
--
-- ── CE QUI N'EST PAS EN CAUSE ───────────────────────────
--
-- Sa présence au Cameroun est JUSTE et ne bouge pas. La migration 023
-- avait construit exactement cette distinction : les entrées portant
-- `cape: true` forment une troisième section, sous une note qui
-- explique qu'elles sont là pour leur cape et non pour leur roulage.
-- Les quatre entrées camerounaises la portent, et celle de Meerapfel
-- dit même « roulé ailleurs ».
--
-- Il manquait l'autre moitié : la fiche du pays où l'on roule.
--
-- ── ET C'EST LE SEUL CAS ────────────────────────────────
--
-- Les neuf entrées `cape` de l'atlas ont été confrontées à la fiche de
-- leur pays de roulage. Huit sont des DÉCLINAISONS dont la maison mère
-- y figure déjà :
--
--   Arturo Fuente Maduro, Arturo Fuente Hemingway  → « Arturo Fuente »
--   Oliva Serie G, Oliva Connecticut Reserve       → « Oliva »
--   Perdomo Ecuador                                → « Perdomo »
--   CAO Cameroon, CAO Black                        → « CAO »
--
-- Meerapfel est la seule MAISON à part entière du lot, et la seule
-- absente. `tools/marques_check.php` apprend à voir ce cas : ses trois
-- contrôles passaient au vert, parce qu'aucun ne demandait si une
-- marque est trouvable là où elle est fabriquée.
--
-- ── SOURCE ──────────────────────────────────────────────
--
-- Cigar Aficionado, sur le lancement de la gamme : « The cigars are
-- rolled in the Dominican Republic », la maison refusant de nommer
-- l'atelier. Les cavistes les classent en cigares dominicains.
--
-- Le descriptif répond à celui du Cameroun — « roulé ailleurs » d'un
-- côté, « cape venue du Cameroun » de l'autre — pour que le lecteur
-- puisse suivre le fil d'une fiche à l'autre.
--
-- `country_id` n'est PAS touché. Aucune des deux valeurs ne serait
-- juste : la maison est une famille de négociants européens, ni
-- camerounaise ni dominicaine. `factory`, lui, dit exactement les deux
-- choses et il est affiché.
-- ════════════════════════════════════════════════════════

-- JSON_SEARCH garantit l'idempotence : rejouer cette migration
-- n'ajoutera pas un doublon.
UPDATE producer_countries
   SET brands = JSON_ARRAY_APPEND(
         brands, '$',
         CAST('{"desc":"Cape venue du Cameroun, cigares roulés ici","name":"Meerapfel","iconic":false}' AS JSON))
 WHERE id = 'dominican'
   AND JSON_SEARCH(brands, 'one', 'Meerapfel') IS NULL;
