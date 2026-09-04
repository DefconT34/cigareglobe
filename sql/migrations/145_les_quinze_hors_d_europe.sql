-- ════════════════════════════════════════════════════════
-- 145 — Les quinze fiches hors d'Europe dont la source n'existait pas
-- ────────────────────────────────────────────────────────
-- Suite et fin du chantier ouvert par la migration 142. Les vingt-huit
-- fiches dont le domaine cité ne résout nulle part ont été reprises une
-- par une : Bertie (143), les douze européennes (144), et ici les
-- quinze dernières.
--
-- ── UNE DIFFICULTÉ NOUVELLE ──────────────────────────────
-- En Europe, la plupart de ces fiches nommaient un COMMERCE, et il
-- suffisait de constater qu'aucun n'existait. Ici, la plupart nomment
-- un salon DANS un lieu qui, lui, existe pour de bon : le Dubai Creek
-- Golf & Yacht Club, l'Abeno Harukas, le Burning Tree Club, le Bristol
-- de Panamá, l'Arusha Hotel de 1894.
--
-- La question n'est donc plus « ce lieu existe-t-il » — il existe —
-- mais « ce salon existe-t-il DANS ce lieu ». C'est plus lent à
-- établir, et plus facile à laisser passer : la fiche s'appuie sur un
-- nom véritable, et le lecteur qui reconnaît le club croit reconnaître
-- le reste.
--
-- La réponse vient de la liste des points de restauration que chaque
-- établissement publie lui-même. Aucune n'y était.
--
--   #1391 Dubai Creek Golf & Yacht Club — « Cigar Terrace »
--         → le club a QD's (chicha en terrasse), Boardwalk, Cielo Sky
--           Lounge, Casa de Tapas, Jones the Grocer. Pas de terrasse
--           cigares — et la chicha n'est pas le cigare.
--   #1428 Abeno Harukas — « Sky Lounge Cigars », Osaka
--         → le 58e étage est le SKY GARDEN 300, café et bar.
--   #1505 Burning Tree — « Cigar Bar », Bethesda
--         → le club s'appelle Burning Tree CLUB, pas Country Club, et
--           il est au 8600 Burdette Rd, pas au 10901 Bradley Blvd.
--   #1172 The Bristol, Panamá — « Churchill Bar »
--         → l'hôtel a Salsipuedes et le B Bar. Il sert bien des cigares
--           roulés à la main, mais pas dans un « Churchill Bar ».
--   #836  The Arusha Hotel — « Hemingway Bar »
--         → l'hôtel est réel, fondé en 1894, aujourd'hui Four Points by
--           Sheraton. Son bar est le HATARI Bar — du film tourné à
--           Arusha en 1962. « Hemingway » sonne juste et n'existe pas.
--   #810  Masa Square, Gaborone — « Cigar & Whisky Lounge »
--         → Protea by Marriott : bar à gin en terrasse, lounge Absolut
--           & Elyx, Don Carlos, Carlitos Cafe.
--   #1116 Hotel Granados Park, Asunción — « Cigar Lounge »
--         → Restaurant Bongo, Lobby Bar, sushi, piscine en terrasse.
--
-- ── UN NOM EMPRUNTÉ À UNE VRAIE MAISON ───────────────────
--   #433 « Pacific Cigar Company — Vancouver ». La Pacific Cigar
--        Company existe : c'est le distributeur Habanos pour
--        l'Asie-Pacifique, basé à Hong Kong. Elle n'a pas de boutique
--        au 905 West Georgia. Vancouver a City Cigar Emporium,
--        2000 Cigars, Revolucion.
--   #427 « Market Cigars — Pike Place », Seattle. La boutique de Pike
--        Place est le MARKET TOBACCO PATCH, au 1906 — la fiche disait
--        1918, douze numéros plus loin, sous un autre nom.
--   #423 « Havana Social — Dallas ». Le Havana Social Club existe, au
--        3030 Olive St à Victory Park, et non au 3699 McKinney Ave —
--        et il est donné fermé.
--
-- ── ET QUATRE QUE RIEN N'ATTESTE ─────────────────────────
--   #195  Boquete Cigar Experience, Chiriquí
--   #435  Havana Club — Ottawa, 50 Rideau Street
--         → Ottawa a Havana CASTLE Cigars (841 Bank St) et l'Ottawa
--           Cigar Emporium (110B Clarence St)
--   #1190 Golf Club d'Abidjan — Club House Cigares, Bingerville
--         → le club d'Abidjan est l'Ivoire Golf Club
--   #1576 Cigar Museum Santiago — Sala Degustación
--         → Santiago a le MUSEO DEL TABACO, calle 16 de Agosto, face au
--           parc Duarte ; et La Aurora a un lounge à sa manufacture
--
-- ── LA SEULE QUI RESTE, ET SA RÉSERVE ────────────────────
-- #828 The Wheatbaker, Lagos. L'hôtel est réel, au 4 Onitolo (Lawrence)
-- Road à Ikoyi, et les fiches de réservation lui prêtent « un bar pour
-- les vins et les cigares ».
--
-- MAIS SON PROPRE SITE N'EN DIT RIEN : thewheatbakerlagos.com ne
-- mentionne que The GrillRoom. La source primaire est donc MUETTE, et
-- ce sont des comparateurs qui attestent — c'est-à-dire des listes
-- d'équipements dérivées des données de l'hôtel, mais pas l'hôtel.
--
-- On la garde publiée, parce que deux sources indépendantes valent
-- mieux que rien et qu'un bar à cigares dans un hôtel d'affaires n'a
-- rien d'invraisemblable. Mais le champ `source` dit exactement ce qui
-- l'atteste, et ce qui ne l'atteste pas. Une fiche qu'on garde sous
-- réserve doit porter sa réserve, sans quoi la réserve se perd et il ne
-- reste que la fiche.
--
-- L'adresse et le téléphone sont repris du site de l'hôtel, lui.
--
-- ── LE BILAN DU CHANTIER 142-145 ─────────────────────────
-- Vingt-huit fiches, vingt-quatre dépubliées, trois corrigées, une
-- gardée sous réserve. C'est beaucoup, et c'est le chiffre qui compte :
-- ces vingt-huit-là avaient toutes pour source unique un domaine
-- inventé. Le contrôle qui les avait groupées ne s'était pas trompé.
--
-- Après cette migration :
--   php tools/contenu_dump.php
--   php tools/sources.php --figer
--   php tools/i18n_dump.php > sql/traductions.sql
-- ════════════════════════════════════════════════════════

-- ── Lagos : gardée, corrigée, et sa réserve écrite ───────
UPDATE `lounges` SET
  `city`    = 'Lagos — The Wheatbaker, 4 Onitolo (Lawrence) Road, off Gerrard Road, Ikoyi',
  `phone`   = '+234 916 435 9466',
  `website` = 'https://thewheatbakerlagos.com/',
  `source`  = 'thewheatbakerlagos.com pour l''hôtel — le bar à cigares n''est attesté que par les fiches de réservation',

  `description`    = 'Hôtel de charme d''Ikoyi, quartier d''affaires de Lagos, exploité par Legacy Hotels and Resorts. Restaurant The GrillRoom ; les fiches de réservation lui prêtent un bar où l''on sert vins et cigares, que le site de l''hôtel ne mentionne pas.',

  `description_en` = 'Boutique hotel in Ikoyi, the business district of Lagos, run by Legacy Hotels and Resorts. The GrillRoom restaurant; booking listings credit it with a bar serving wines and cigars, which the hotel''s own site does not mention.',

  `description_es` = 'Hotel boutique de Ikoyi, el distrito de negocios de Lagos, gestionado por Legacy Hotels and Resorts. Restaurante The GrillRoom; las fichas de reserva le atribuyen un bar donde se sirven vinos y puros, que la web del hotel no menciona.',

  `description_de` = 'Boutiquehotel in Ikoyi, dem Geschäftsviertel von Lagos, betrieben von Legacy Hotels and Resorts. Restaurant The GrillRoom; Buchungsportale schreiben ihm eine Bar mit Weinen und Zigarren zu, die die eigene Website des Hauses nicht erwähnt.',

  `description_zh` = '位于拉各斯商务区伊科伊的精品酒店，由 Legacy Hotels and Resorts 经营。设 The GrillRoom 餐厅；订房平台称其设有供应葡萄酒与雪茄的酒吧，酒店官网未提及此项。',

  `description_ar` = 'فندق بوتيك في حي إيكويي، منطقة الأعمال في لاغوس، تديره Legacy Hotels and Resorts. مطعم The GrillRoom؛ وتنسب إليه مواقع الحجز بارًا يقدّم النبيذ والسيجار، وهو ما لا يذكره موقع الفندق نفسه.',

  `updated_at` = NOW()
 WHERE `id` = 828 AND `country_id` = 'nigeria';

UPDATE `translation_status`
   SET `source_hash` = (SELECT SHA1(`description`) FROM `lounges` WHERE `id` = 828),
       `statut`      = 'machine', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '828' AND `champ` = 'description';

-- ── Le lieu existe, le salon nommé non ───────────────────
UPDATE `lounges`
   SET `is_verified` = 0,
       `source`      = 'RETIRÉ — le lieu existe, le salon que la fiche nomme n''y figure pas',
       `updated_at`  = NOW()
 WHERE `id` IN (810, 836, 1116, 1172, 1391, 1428, 1505);

-- ── Un nom emprunté à une maison réelle, ailleurs ────────
UPDATE `lounges`
   SET `is_verified` = 0,
       `source`      = 'RETIRÉ — nom d''une maison réelle, à une adresse qui n''est pas la sienne',
       `updated_at`  = NOW()
 WHERE `id` IN (423, 427, 433);

-- ── Rien nulle part ──────────────────────────────────────
UPDATE `lounges`
   SET `is_verified` = 0,
       `source`      = 'RETIRÉ — aucune trace de cet établissement, et le domaine cité n''existe pas',
       `updated_at`  = NOW()
 WHERE `id` IN (195, 435, 1190, 1576);

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 145','systeme','fiche_corrigee','lounge',828,'adresse et telephone repris du site de l hotel ; bar a cigares atteste par les comparateurs seulement, reserve ecrite au champ source'),
  (NULL,'migration 145','systeme','lounge_retire','lounge',1391,'Dubai Creek a QD s, Boardwalk, Cielo, Casa de Tapas ; aucune terrasse cigares (la chicha n est pas le cigare)'),
  (NULL,'migration 145','systeme','lounge_retire','lounge',1428,'le 58e etage d Abeno Harukas est le Sky Garden 300, cafe et bar'),
  (NULL,'migration 145','systeme','lounge_retire','lounge',1505,'le club s appelle Burning Tree Club, au 8600 Burdette Rd et non 10901 Bradley Blvd ; aucun bar a cigares atteste'),
  (NULL,'migration 145','systeme','lounge_retire','lounge',1172,'le Bristol de Panama a Salsipuedes et le B Bar ; il sert des cigares mais n a pas de Churchill Bar'),
  (NULL,'migration 145','systeme','lounge_retire','lounge',836,'l Arusha Hotel (1894, Four Points by Sheraton) a le Hatari Bar, pas de Hemingway Bar'),
  (NULL,'migration 145','systeme','lounge_retire','lounge',810,'Protea Masa Square a un bar a gin en terrasse et le lounge Absolut & Elyx ; pas de salon cigares'),
  (NULL,'migration 145','systeme','lounge_retire','lounge',1116,'Granados Park a le Restaurant Bongo et le Lobby Bar ; pas de salon cigares'),
  (NULL,'migration 145','systeme','lounge_retire','lounge',433,'la Pacific Cigar Company est le distributeur Habanos Asie-Pacifique, base a Hong Kong ; pas de boutique 905 West Georgia a Vancouver'),
  (NULL,'migration 145','systeme','lounge_retire','lounge',427,'la boutique de Pike Place est le Market Tobacco Patch au 1906, pas Market Cigars au 1918'),
  (NULL,'migration 145','systeme','lounge_retire','lounge',423,'le Havana Social Club est au 3030 Olive St a Victory Park, pas 3699 McKinney Ave, et il est donne ferme'),
  (NULL,'migration 145','systeme','lounge_retire','lounge',195,'aucune trace d un Boquete Cigar Experience a Chiriqui'),
  (NULL,'migration 145','systeme','lounge_retire','lounge',435,'aucune trace 50 Rideau Street ; Ottawa a Havana Castle Cigars et l Ottawa Cigar Emporium'),
  (NULL,'migration 145','systeme','lounge_retire','lounge',1190,'aucune trace a Bingerville ; le club d Abidjan est l Ivoire Golf Club'),
  (NULL,'migration 145','systeme','lounge_retire','lounge',1576,'Santiago a le Museo del Tabaco calle 16 de Agosto, pas un Cigar Museum avenue Estrella Sadhala');
