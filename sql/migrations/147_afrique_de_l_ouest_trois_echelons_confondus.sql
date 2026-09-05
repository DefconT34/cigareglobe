-- ════════════════════════════════════════════════════════
-- 147 — Afrique de l'Ouest : trois échelons Habanos confondus en un seul
-- ────────────────────────────────────────────────────────
-- Cinq fiches d'Afrique de l'Ouest revendiquaient « La Casa del Habano
-- Officielle » sans source externe : Dakar, Lomé, Cotonou, Conakry,
-- Ouagadougou. Habanos S.A. et son distributeur exclusif pour l'Afrique
-- — Phoenicia Trading T.A.A. (Chypre) — publient eux-mêmes ce qu'ils
-- accordent, et cela règle les cinq.
--
-- ── LA CONFUSION DE FOND ─────────────────────────────────
-- Le réseau Habanos a TROIS échelons, du plus exigeant au plus léger :
--
--   La Casa del Habano   franchise complète, environ 140 dans le monde
--   Habanos Specialist   boutique spécialisée agréée
--   Habanos Point        point de vente agréé, souvent dans un hôtel
--
-- L'import du 22 mars les a tous appelés « La Casa del Habano ». Ce
-- n'est pas une nuance de vocabulaire : c'est prêter à un commerce une
-- franchise qu'il n'a pas obtenue, et les trois échelons ne
-- s'obtiennent pas au même prix ni aux mêmes conditions. La migration
-- 136 avait déjà corrigé une confusion du même ordre.
--
-- ── CE QUE LE RÉSEAU DIT DE L'AFRIQUE DE L'OUEST ─────────
-- Habanos S.A. a annoncé « La Casa del Habano Togo » comme LA PREMIÈRE
-- La Casa del Habano d'Afrique de l'Ouest, desservant toute la région.
-- Une seule, donc, et elle est à Lomé.
--
--   #2542 LOMÉ — RÉELLE, mais mal située. Le nom complet est « La Casa
--         del Habano Togo / The Smoking Gorilla », exploitée par LCDC –
--         LCDT La Casa de Cigares, à B6 Immeuble Marina, à côté de
--         Total Marina, BP 1003 — et non avenue du 24 Janvier au
--         quartier Tokoin. Ouverte du lundi au samedi, 9h à minuit.
--
--   #2536 DAKAR — RÉELLE, mais d'un autre échelon et sous un autre nom.
--         Habanos S.A. l'annonce comme HABANOS SPECIALIST « El
--         Fumador », 40 rue Jules Ferry : soixante mètres carrés, dont
--         douze de cave. Ni « La Casa del Habano », ni les Almadies.
--
--   #2545 COTONOU — le Bénin n'a pas de Casa del Habano. Il a TROIS
--         Habanos Points, accordés par Phoenicia : le bar à cigares du
--         Best Western (2013), l'hôtel Imprévu (2017) et le Golden
--         Tulip Le Diplomate (2017). La fiche ne désigne aucun des
--         trois — ni par le nom, ni par l'adresse.
--
--   #2548 CONAKRY — la Guinée n'a pas de Casa del Habano. Elle a un
--         Habanos Point, « 68 Mark Avenue », boutique privée du centre
--         de Conakry, accordé en 2017.
--
--   #2551 OUAGADOUGOU — rien. Aucun échelon du réseau n'est annoncé au
--         Burkina Faso.
--
-- ── POURQUOI ON N'AJOUTE PAS LES QUATRE POINTS ───────────
-- Les trois Habanos Points de Cotonou et celui de Conakry sont réels et
-- sourcés — mais on n'a d'eux qu'un nom d'hôtel et une ville. Les
-- inscrire sans adresse produirait exactement la maigreur qu'on passe
-- ce chantier à retirer : une fiche qui affirme sans situer. Ils sont
-- consignés au JOURNAL, nommés et datés, pour qu'un prochain chantier
-- les reprenne avec leurs adresses.
--
-- ── TÉLÉPHONES ──────────────────────────────────────────
-- Celui de Lomé est effacé : la fiche en portait un que rien n'atteste.
-- Celui de Dakar est remplacé par celui que la boutique publie.
--
-- Après cette migration :
--   php tools/contenu_dump.php
--   php tools/sources.php --figer
--   php tools/i18n_dump.php > sql/traductions.sql
-- ════════════════════════════════════════════════════════

-- ── Lomé : la seule Casa del Habano d'Afrique de l'Ouest ─
UPDATE `lounges` SET
  `name`    = 'La Casa del Habano Togo — The Smoking Gorilla',
  `city`    = 'Lomé — B6 Immeuble Marina, à côté de Total Marina, BP 1003',
  `type`    = 'La Casa del Habano Officielle',
  `phone`   = NULL,
  `hours`   = 'Lun–Sam 9h–0h',
  `source`  = 'habanos.com — annonce officielle « Welcome La Casa del Habano Togo in África »',

  `description`    = 'Première La Casa del Habano d''Afrique de l''Ouest, exploitée par LCDC – LCDT La Casa de Cigares. Cave accessible réunissant le portefeuille Habanos et les séries réservées à la franchise.',

  `description_en` = 'First La Casa del Habano in West Africa, run by LCDC – LCDT La Casa de Cigares. Walk-in humidor carrying the Habanos portfolio and the series reserved for the franchise.',

  `description_es` = 'Primera La Casa del Habano de África Occidental, gestionada por LCDC – LCDT La Casa de Cigares. Humidor accesible con la cartera Habanos y las series reservadas a la franquicia.',

  `description_de` = 'Erste La Casa del Habano Westafrikas, betrieben von LCDC – LCDT La Casa de Cigares. Begehbarer Humidor mit dem Habanos-Portfolio und den der Franchise vorbehaltenen Serien.',

  `description_zh` = '西非首家 La Casa del Habano，由 LCDC – LCDT La Casa de Cigares 经营。设步入式恒湿雪茄柜，陈列哈伯纳斯全系列及franchise专属产品。',

  `description_ar` = 'أوّل «لا كاسا ديل هابانو» في غرب أفريقيا، تديرها LCDC – LCDT La Casa de Cigares. مستودع ترطيب يمكن دخوله يضمّ تشكيلة هابانوس والسلاسل المخصّصة للامتياز.',

  `updated_at` = NOW()
 WHERE `id` = 2542 AND `country_id` = 'togo';

UPDATE `translation_status`
   SET `source_hash` = (SELECT SHA1(`description`) FROM `lounges` WHERE `id` = 2542),
       `statut` = 'machine', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2542' AND `champ` = 'description';

-- ── Dakar : Habanos Specialist, et non Casa del Habano ───
UPDATE `lounges` SET
  `name`    = 'El Fumador — Dakar',
  `city`    = 'Dakar — 40 rue Jules Ferry',
  `type`    = 'Habanos Specialist',
  `phone`   = '+221 33 823 9556',
  `source`  = 'habanos.com — annonce officielle « Habanos Specialist El Fumador in Senegal »',

  `description`    = 'Boutique spécialisée agréée par Habanos, au centre de Dakar : soixante mètres carrés, dont une douzaine de cave accessible. Approvisionnement par Phoenicia Trading, distributeur exclusif pour l''Afrique.',

  `description_en` = 'Habanos-approved specialist shop in central Dakar: sixty square metres, of which a dozen are walk-in humidor. Supplied by Phoenicia Trading, the exclusive distributor for Africa.',

  `description_es` = 'Tienda especializada autorizada por Habanos, en el centro de Dakar: sesenta metros cuadrados, de los que una docena son humidor accesible. Suministro de Phoenicia Trading, distribuidor exclusivo para África.',

  `description_de` = 'Von Habanos autorisiertes Fachgeschäft im Zentrum von Dakar: sechzig Quadratmeter, davon rund zwölf begehbarer Humidor. Beliefert von Phoenicia Trading, dem Exklusivdistributor für Afrika.',

  `description_zh` = '哈伯纳斯授权的专门店，位于达喀尔市中心：面积六十平方米，其中约十二平方米为步入式恒湿柜。由非洲独家经销商 Phoenicia Trading 供货。',

  `description_ar` = 'متجر متخصّص معتمد من هابانوس في وسط داكار: ستّون مترًا مربعًا، منها نحو اثني عشر مستودعَ ترطيب يمكن دخوله. التوريد عبر Phoenicia Trading، الموزّع الحصري لأفريقيا.',

  `updated_at` = NOW()
 WHERE `id` = 2536 AND `country_id` = 'senegal';

UPDATE `translation_status`
   SET `source_hash` = (SELECT SHA1(`description`) FROM `lounges` WHERE `id` = 2536),
       `statut` = 'machine', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2536' AND `champ` = 'description';

-- ── Les trois qui n'ont pas de Casa del Habano ───────────
UPDATE `lounges`
   SET `is_verified` = 0,
       `source`      = 'RETIRÉ — ce pays n''a pas de La Casa del Habano ; le réseau y a un autre échelon, ou rien',
       `updated_at`  = NOW()
 WHERE `id` IN (2545, 2548, 2551);

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 147','systeme','fiche_corrigee','lounge',2542,'La Casa del Habano Togo / The Smoking Gorilla, B6 Immeuble Marina pres de Total Marina — premiere LCDH d Afrique de l Ouest ; source habanos.com'),
  (NULL,'migration 147','systeme','fiche_corrigee','lounge',2536,'Dakar est un HABANOS SPECIALIST nomme El Fumador, 40 rue Jules Ferry — pas une Casa del Habano aux Almadies ; source habanos.com'),
  (NULL,'migration 147','systeme','lounge_retire','lounge',2545,'le Benin n a pas de Casa del Habano'),
  (NULL,'migration 147','systeme','lounge_retire','lounge',2548,'la Guinee n a pas de Casa del Habano'),
  (NULL,'migration 147','systeme','lounge_retire','lounge',2551,'aucun echelon du reseau Habanos n est annonce au Burkina Faso'),
  -- Les quatre Habanos Points reels, consignes pour un prochain
  -- chantier : on n a d eux qu un nom d hotel et une ville.
  (NULL,'migration 147','systeme','a_documenter','lounge',0,'Habanos Point a documenter : bar a cigares du Best Western, Cotonou, accorde 2013 (Phoenicia)'),
  (NULL,'migration 147','systeme','a_documenter','lounge',0,'Habanos Point a documenter : hotel Imprevu, Cotonou, accorde 2017 (Phoenicia)'),
  (NULL,'migration 147','systeme','a_documenter','lounge',0,'Habanos Point a documenter : Golden Tulip Le Diplomate, Cotonou, accorde 2017 (Phoenicia)'),
  (NULL,'migration 147','systeme','a_documenter','lounge',0,'Habanos Point a documenter : 68 Mark Avenue, centre de Conakry, accorde 2017 (Phoenicia)');
