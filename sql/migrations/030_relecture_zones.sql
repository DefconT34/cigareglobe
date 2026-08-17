-- ════════════════════════════════════════════════════════
-- 030 — Lot 4 de la relecture : les zones de production
-- ────────────────────────────────────────────────────────
-- Le plan annonçait 37 zones ; `027` en a ajouté quatre, elles sont 41.
-- Le lot 0 avait déjà validé leur GÉOMÉTRIE : chaque point tombe bien
-- dans le pays qu'il prétend désigner, et `tools/coords_check.php` le
-- rejoue à chaque campagne.
--
-- Ce lot montre la limite de ce contrôle. Les trois zones camerounaises
-- tombaient toutes dans le Cameroun — et toutes les trois étaient à
-- cinq cents kilomètres de l'endroit où pousse la cape. Un point peut
-- être dans le bon pays et au mauvais endroit ; aucune vérification
-- automatique ne dira jamais cela.
--
-- ── QUATRE ERREURS DE FAIT ──────────────────────────────
--
--   CAMEROUN, trois zones sur trois. Mont Cameroun, Mungo et Wouri sont
--   la côte volcanique du Sud-Ouest et du Littoral — la région de
--   Douala et des bananeraies. La cape camerounaise pousse à l'EST,
--   autour de Batouri, et la zone se prolonge en Centrafrique où se
--   trouvent les usines de traitement (Gamboula, Berbérati, Abba).
--   Elle est cultivée EN PLEIN SOLEIL, sans toile — ce qui est
--   remarquable pour une cape — sur des terres si riches qu'elles ne
--   demandent pas d'engrais. Rien de volcanique.
--   Batouri est le seul lieu camerounais que les sources nomment : les
--   deux autres zones sont retirées plutôt que déplacées au jugé.
--   L'erreur débordait sur la fiche pays — `soil`, `regions` et
--   `varieties` la répétaient, cette dernière annonçant même un
--   « Cameroon Shade » pour un tabac de plein soleil.
--
--   RÉP. DOMINICAINE, La Romana. La note disait « Plantation Arturo
--   Fuente ». La Romana, c'est TABACALERA DE GARCÍA, ouverte en 1971,
--   la plus grande manufacture du pays — Montecristo, Romeo y Julieta,
--   H. Upmann. Arturo Fuente est à Santiago, à deux cents kilomètres,
--   et son domaine Chateau de la Fuente n'est pas davantage à La
--   Romana. C'est le genre d'erreur qu'un lecteur averti voit tout de
--   suite, et qui décrédibilise le reste de la fiche.
--
--   INDONÉSIE, Lombok. Lombok produit du VIRGINIA pour les cigarettes
--   d'american blend. Ce n'est pas du tabac à cigare et cela n'a rien à
--   faire dans cet atlas. Les trois centres historiques du tabac à
--   cigare indonésien sont Deli (Sumatra), Besuki (Java Est) et
--   KLATEN (Java Centre) — c'est ce dernier qui prend la place.
--
--   NICARAGUA, Condega. « Haute altitude » : Condega est à 560 m, soit
--   la PLUS BASSE des trois vallées, quand Estelí est à 844 m. Ce qui
--   la distingue est son sol rocailleux, qui donne une feuille plus
--   fine et moins robuste.
--
-- ── LES OPINIONS, QUI RESTENT DES OPINIONS ──────────────
--
-- Le plan prévoyait ce cas : « Meilleure terre à tabac au monde » n'est
-- pas un fait, c'est un jugement — à garder ou à reformuler, pas à
-- sourcer. Quatre notes affirmaient un superlatif au présent de
-- l'indicatif, ce qui les faisait lire comme des mesures. Elles disent
-- désormais la réputation, qui est vraie, plutôt que le classement, qui
-- n'existe pas.
--
-- ── DEUX FAUTES DE LANGUE ───────────────────────────────
--
-- « Jamastran Valley » et « Microclimate » : de l'anglais dans une
-- colonne française, comme « Panama City » au lot 2.
-- ════════════════════════════════════════════════════════

-- ── Cameroun : la zone à cape est à l'Est ────────────────

UPDATE production_zones SET
    name = 'Batouri',
    lat  = 4.4333,
    lon  = 14.3667,
    note = 'Zone à cape de l''Est, prolongée en Centrafrique'
WHERE id = 19;

DELETE FROM production_zones WHERE id IN (20, 21);

-- Les empreintes de traduction des deux notes disparues ne pointent
-- plus sur rien. Elles ne gênent pas — i18n_fraicheur.php part des
-- lignes de la table, pas de celles du suivi — mais autant ne pas
-- laisser de gravats.
DELETE FROM translation_status
 WHERE entite = 'production_zones' AND entite_id IN ('20', '21');

-- La même erreur, sur la fiche pays elle-même.
UPDATE producer_countries SET
    soil      = 'Terres riches de l''Est, cultivées sans engrais',
    regions   = '["Batouri","Région de l''Est"]',
    varieties = '["Sun-grown","Semence Sumatra"]'
WHERE id = 'cameroon';

-- ── Rép. dominicaine : qui roule à La Romana ─────────────

UPDATE production_zones SET
    note = 'Tabacalera de García, la plus grande manufacture du pays'
WHERE id = 11;

-- ── Indonésie : du cigare, pas de la cigarette ───────────

UPDATE production_zones SET
    name = 'Klaten, Java Centre',
    lat  = -7.7000,
    lon  = 110.6000,
    note = 'Centre historique du tabac à cigare'
WHERE id = 30;

UPDATE production_zones SET
    note = 'Cape et tripe de plein soleil, région de Jember'
WHERE id = 29;

-- ── Nicaragua : les altitudes à l'endroit ────────────────

UPDATE production_zones SET note = 'Vallée à 844 m, tabac puissant'  WHERE id = 5;
UPDATE production_zones SET note = 'Sol rocailleux, feuille plus fine' WHERE id = 7;

-- ── Les superlatifs deviennent des réputations ───────────

UPDATE production_zones SET note = 'La terre à tabac la plus réputée au monde' WHERE id = 1;
UPDATE production_zones SET note = 'Terres noires, référence du Maduro'        WHERE id = 31;
UPDATE production_zones SET note = 'Berceau du shade wrapper'                  WHERE id = 25;

-- ── Deux mots d'anglais ──────────────────────────────────

UPDATE production_zones SET
    name = 'Vallée de Jamastrán',
    note = 'Corojo réputé hors de Cuba'
WHERE id = 13;

UPDATE production_zones SET note = 'Microclimat d''altitude' WHERE id = 34;
