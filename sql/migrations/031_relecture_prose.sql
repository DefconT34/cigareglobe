-- ════════════════════════════════════════════════════════
-- 031 — Lot 5 de la relecture : la prose des fiches pays
-- ────────────────────────────────────────────────────────
-- 162 valeurs : climat, sol, récolte, notes, et les trois listes
-- (tabacaleras, régions, variétés). Elles ne se vérifient pas ligne à
-- ligne. Ce qu'on y cherche est ce que le plan annonçait : les endroits
-- où la prose AFFIRME UN FAIT PRÉCIS — un rang mondial, une date, une
-- paternité — pour traiter ceux-là comme le lot 1.
--
-- ── LA MOITIÉ DES DÉFAUTS VENAIT DES LOTS PRÉCÉDENTS ────
--
-- C'est la découverte de ce lot, et elle est inconfortable : SEPT
-- affirmations retirées ou corrigées en R1 et R4 avaient survécu ici,
-- dans un autre champ de la même fiche.
--
--   « Premier exportateur mondial en valeur » avait été retiré de
--   rev_detail par la migration 028, faute de source. Il vivait toujours
--   dans notes, à quinze lignes de là.
--
--   « Lombok » avait été retiré des zones par la migration 030 — c'est
--   du Virginia pour cigarettes. Il restait dans regions ET dans
--   varieties.
--
--   « Jamastran Valley » avait été francisé en zone. Pas dans regions.
--
-- Une correction ne suit pas la donnée : elle suit le CHAMP. Tant qu'un
-- même fait est écrit à trois endroits, le corriger une fois n'en
-- corrige qu'un tiers, et les deux autres continuent de s'afficher sur
-- la même page. C'est la vraie leçon de la relecture, et elle vaut pour
-- tout ce qui viendra après.
--
-- ── TROIS ERREURS DE FAIT INÉDITES ──────────────────────
--
--   CUBA, « Sol volcanique rouge ». La Vuelta Abajo n'est pas
--   volcanique : ses terres sont des débris calcaires érodés du relief
--   voisin, recouverts de limons apportés par les cours d'eau, formés
--   au Quaternaire. Elles sont rouges et riches en fer, d'où la
--   confusion — mais Cuba n'a pratiquement pas de volcanisme. L'erreur
--   est répandue et se lisait ici comme une donnée.
--
--   CAMEROUN, « BAT Cameroun ». British American Tobacco Cameroun fait
--   des CIGARETTES. La cape camerounaise a été tenue par le monopole
--   français SEITA jusqu'à son retrait de l'Afrique centrale en 1993,
--   et elle est négociée depuis plus de cent vingt ans par la maison
--   M. Meerapfel & Söhne — la même que la migration 026 avait déjà
--   croisée. « SCTC » n'a pu être rattaché à rien.
--
--   PHILIPPINES, « Burley · Virginia ». Ce sont des tabacs à
--   CIGARETTES, exactement la faute de Lombok au lot précédent. Ce qui
--   fait le cigare philippin est la feuille native de la vallée de
--   Cagayan.
--
-- ── CINQ SUPERLATIFS ────────────────────────────────────
--
-- Même traitement qu'au lot 4 : « meilleur X du monde » énoncé au
-- présent de l'indicatif se lit comme une mesure. Ces notes disent
-- désormais la réputation, qui est vraie, plutôt que le classement, qui
-- n'existe pas. Le plan citait « Mata Fina — meilleur wrapper Maduro du
-- monde » comme l'exemple type de l'opinion assumée : elle est
-- conservée, mais elle s'annonce comme telle.
-- ════════════════════════════════════════════════════════

-- ── Les rangs mondiaux que R1 avait déjà retirés ailleurs ──

--   Le rang dominicain n'a aucune source publique : personne ne publie
--   de classement mondial en valeur. Reste ce qui se vérifie.
UPDATE producer_countries SET
    notes = 'Santiago et la vallée du Cibao concentrent les plus grandes manufactures du pays.'
WHERE id = 'dominican';

--   L'Équateur : on garde la cause, on lâche le rang. Sa domination
--   tient à la couverture nuageuse permanente, qui remplace les toiles.
UPDATE producer_countries SET
    notes = 'La couverture nuageuse permanente y remplace les toiles d''ombrage.'
WHERE id = 'ecuador';

--   Le Nicaragua : « premier producteur mondial en volume » ne se
--   déduit d'aucune statistique. Ce qui est compté, ce sont les
--   importations américaines — 253 des 430 millions de cigares premium
--   entrés aux États-Unis en 2024 (Cigar Association of America).
UPDATE producer_countries SET
    notes = 'Près de six cigares premium sur dix importés aux États-Unis viennent d''ici.'
WHERE id = 'nicaragua';

-- ── Les superlatifs deviennent des réputations ───────────

UPDATE producer_countries SET
    notes = 'Mata Fina — l''un des maduros les plus réputés au monde.'
WHERE id = 'brazil';

UPDATE producer_countries SET
    notes = 'Jamastrán — le Corojo le plus réputé hors de Cuba.'
WHERE id = 'honduras';

UPDATE producer_countries SET
    notes = 'San Andrés — la référence du wrapper maduro.'
WHERE id = 'mexico';

UPDATE producer_countries SET
    notes = 'Connecticut Shade — le berceau du wrapper d''ombre.'
WHERE id = 'usa';

UPDATE producer_countries SET
    notes = 'Deli Sumatra — wrapper très répandu en Europe.'
WHERE id = 'indonesia';

-- ── Cuba : des terres rouges, pas volcaniques ────────────

UPDATE producer_countries SET
    soil = 'Terres rouges sur calcaire érodé et limons'
WHERE id = 'cuba';

-- ── Cameroun : qui négocie vraiment cette cape ───────────

UPDATE producer_countries SET
    tabacaleras = '["M. Meerapfel & Söhne","SEITA (jusqu''en 1993)"]'
WHERE id = 'cameroon';

-- ── Brésil : Suerdieck a fermé en 2000 (migration 026) ───
-- La maison figurait parmi les producteurs actuels du pays alors que
-- 026 avait déjà corrigé son article de marque. Elle reste nommée —
-- elle compte dans l'histoire du Mata Fina — mais datée.

UPDATE producer_countries SET
    tabacaleras = '["Dannemann","Suerdieck (fermée en 2000)"]'
WHERE id = 'brazil';

-- ── Philippines : du tabac à cigare, pas à cigarette ─────

UPDATE producer_countries SET
    varieties = '["Tabac natif de Cagayan"]'
WHERE id = 'philippines';

-- ── Les listes que R4 avait laissées derrière lui ────────

UPDATE producer_countries SET
    regions = '["Vallée de Jamastrán","Talanga","Danlí"]'
WHERE id = 'honduras';

UPDATE producer_countries SET
    regions   = '["Deli (Sumatra Nord)","Besuki (Java Est)","Klaten (Java Centre)"]',
    varieties = '["Deli Sumatra","Besuki"]'
WHERE id = 'indonesia';

-- ── Les deux dernières listes qui ne suivaient pas la carte ──
-- Une fois les sept premières corrigées, la comparaison systématique de
-- `regions` avec les zones réellement posées sur le globe n'en laissait
-- que deux : « Région de l'Est » est un descriptif et non un lieu,
-- « Volcán Barú » est un volcan et non une région de culture — le lot 4
-- avait déjà retiré son altitude inventée.
--
-- Cette comparaison est désormais tenue par tools/coherence_check.php,
-- appelé par la campagne : c'est le seul moyen d'empêcher la panne
-- centrale de ce lot de revenir.

UPDATE producer_countries SET regions = '["Batouri"]'            WHERE id = 'cameroon';
UPDATE producer_countries SET regions = '["Chiriquí","Boquete"]' WHERE id = 'panama';
