-- ════════════════════════════════════════════════════════
-- 151 — Thaïlande, Vietnam, et la fin du bloc des affiliations
-- ────────────────────────────────────────────────────────
-- Dernières six fiches des vingt-huit que la migration 141 avait
-- relabellées « affiliation officielle affirmée sans source externe ».
-- Le distributeur de la région est Pacific Cigar Co. pour la Thaïlande
-- et Golden Phoenix pour le Vietnam ; Habanos S.A. tient une page par
-- établissement.
--
-- ── DEUX QUE L'ATLAS AVAIT DÉJÀ JUSTE ────────────────────
-- #136 Bangkok, Mandarin Oriental, 48 Oriental Avenue, et #140 Hô Chi
-- Minh-Ville, 74b Hai Ba Trung, ouverte en août 2021 — toutes deux
-- correspondent au registre officiel, adresse et téléphone compris.
--
-- ── LE COHIBA ATMOSPHERE N'EST PAS AU BANYAN TREE ────────
-- #137 le plaçait « Banyan Tree Hotel, 21/100 South Sathon Rd ».
-- Habanos S.A. le situe 63/3 SOI RUAMDEE 3, PLOENCHIT ROAD, Lumpini,
-- Pathumwan — un autre quartier de Bangkok, et pas dans un hôtel.
--
-- Le téléphone est effacé : +66 2 679 1200 est celui du Banyan Tree,
-- c'est-à-dire d'un établissement sans rapport. Même distinction qu'à la
-- migration 150 — on garde un numéro quand seule l'adresse précise était
-- fausse, on l'efface quand c'est le LIEU ENTIER qui l'était.
--
-- ── CHIANG MAI EXISTE, ET L'ADRESSE SE PRÉCISE ───────────
-- #2497 disait « Nimman Road, Maya Lifestyle Shopping Center ».
-- L'établissement est réel — Habanos S.A. lui consacre une page — mais
-- il est au 1/5 SOI 9, NIMMANHEMIN ROAD, Tumbon Sutep : la bonne rue,
-- pas le centre commercial. Le téléphone est conservé : même
-- établissement, adresse affinée.
--
-- ── HANOÏ EST UN DOUBLON, ET D'UN AUTRE ÉCHELON ──────────
-- #2503 « La Casa del Habano — Hanoi (Sofitel Metropole) » désigne le
-- 15 Ngo Quyen Street — c'est-à-dire exactement la fiche #141, le bar à
-- cigares du Sofitel Legend Metropole, sourcée par l'hôtel lui-même.
-- Même adresse, même téléphone, comptés deux fois.
--
-- Et l'échelon est faux : le Vietnam a UNE La Casa del Habano, à Hô Chi
-- Minh-Ville. Hanoï a reçu un HABANOS SPECIALIST, annoncé par Habanos
-- S.A. comme « the first Habanos Specialist store in Hanoi » et
-- deuxième boutique du pays, ouverte par Golden Phoenix. Ce n'est pas
-- le bar d'un hôtel, et ce n'est pas une Casa del Habano.
--
-- ── DA NANG, PATTAYA, PHUKET ─────────────────────────────
-- Aucune trace. Le Vietnam a deux adresses officielles, la Thaïlande
-- trois ; ni Da Nang, ni Pattaya, ni Phuket n'en font partie.
--
-- ── DEUX ADRESSES RÉELLES QUI MANQUENT ───────────────────
-- La recherche en a fait apparaître deux que l'atlas ignore, et dont on
-- n'a pas l'adresse postale complète :
--
--   · La Casa del Habano Sindhorn Kempinski, à Bangkok, quartier
--     Langsuan — une SECONDE Casa del Habano dans la ville
--   · le Habanos Specialist de Hanoï, exploité par Avanti Group
--
-- Elles vont au journal sous « a_documenter », comme les quatre Habanos
-- Points de la migration 147. Les inscrire sans adresse produirait la
-- maigreur que ce chantier retire.
--
-- ── FIN DU BLOC ──────────────────────────────────────────
-- Vingt-huit fiches revendiquaient une affiliation officielle sans
-- source externe. Résultat : neuf corrigées, dix-huit dépubliées, une
-- ajoutée (le Cohiba Atmosphere de Kota Damansara).
--
-- Le motif est le même sur sept pays : le réseau a UNE ou DEUX adresses
-- dans le pays, l'atlas en affichait quatre ou cinq. L'import du 22 mars
-- a pris une enseigne réelle et l'a répliquée sur les grandes villes.
-- C'est l'erreur qu'un lecteur ne peut pas voir : chaque fiche est
-- plausible seule, c'est leur NOMBRE qui ne l'est pas.
--
-- Après cette migration :
--   php tools/contenu_dump.php
--   php tools/sources.php --figer
--   php tools/i18n_dump.php > sql/traductions.sql
-- ════════════════════════════════════════════════════════

-- ── Bangkok : le Cohiba Atmosphere, à sa vraie adresse ───
UPDATE `lounges` SET
  `city`   = 'Bangkok — 63/3 Soi Ruamdee 3, Ploenchit Road, Lumpini, Pathumwan, 10330',
  `phone`  = NULL,
  `source` = 'habanos.com — fiche officielle Cohiba Atmosphere Bangkok',

  `description`    = 'Salon Cohiba Atmosphere de Bangkok, dans le quartier de Lumpini. Le plus haut échelon du réseau Habanos : la sélection d''une Casa del Habano, avec le service d''un salon et une cuisine.',

  `description_en` = 'Cohiba Atmosphere lounge in Bangkok, in the Lumpini district. The highest tier of the Habanos network: the selection of a Casa del Habano, with the service of a lounge and a kitchen.',

  `description_es` = 'Salón Cohiba Atmosphere de Bangkok, en el barrio de Lumpini. El nivel más alto de la red Habanos: la selección de una Casa del Habano, con el servicio de un salón y una cocina.',

  `description_de` = 'Cohiba-Atmosphere-Lounge in Bangkok, im Viertel Lumpini. Die höchste Stufe des Habanos-Netzes: die Auswahl einer Casa del Habano, mit dem Service einer Lounge und einer Küche.',

  `description_zh` = '曼谷伦披尼区的高希霸 Atmosphere 雪茄吧。哈伯纳斯体系中的最高一级：具备 Casa del Habano 的选品，另配备完整的休息厅与厨房服务。',

  `description_ar` = 'صالة كوهيبا أتموسفير في بانكوك، بحي لومبيني. أعلى مراتب شبكة هابانوس: تشكيلة «كاسا ديل هابانو» مع خدمة صالة كاملة ومطبخ.',

  `updated_at` = NOW()
 WHERE `id` = 137 AND `country_id` = 'thailand';

UPDATE `translation_status`
   SET `source_hash` = (SELECT SHA1(`description`) FROM `lounges` WHERE `id` = 137),
       `statut` = 'machine', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '137' AND `champ` = 'description';

-- ── Chiang Mai : la bonne rue, pas le centre commercial ──
UPDATE `lounges` SET
  `city`   = 'Chiang Mai — 1/5 Soi 9, Nimmanhemin Road, Tumbon Sutep, Muang, 50200',
  `source` = 'habanos.com — fiche officielle La Casa del Habano Chiangmai',

  `description`    = 'La Casa del Habano de Chiang Mai, dans la rue Nimmanhemin. Sélection de havanes et cave de single malts. Approvisionnée par Pacific Cigar, distributeur d''Habanos pour l''Asie-Pacifique.',

  `description_en` = 'La Casa del Habano in Chiang Mai, on Nimmanhemin Road. Selection of Havanas and a single malt list. Supplied by Pacific Cigar, the Habanos distributor for Asia-Pacific.',

  `description_es` = 'La Casa del Habano de Chiang Mai, en la calle Nimmanhemin. Selección de habanos y carta de single malts. Abastecida por Pacific Cigar, distribuidor de Habanos para Asia-Pacífico.',

  `description_de` = 'La Casa del Habano in Chiang Mai, an der Nimmanhemin Road. Auswahl an Havannas und eine Single-Malt-Karte. Beliefert von Pacific Cigar, dem Habanos-Distributor für Asien-Pazifik.',

  `description_zh` = '清迈的 La Casa del Habano，位于尼曼路。备有哈瓦那雪茄选品与单一麦芽威士忌酒单。由亚太区哈伯纳斯经销商 Pacific Cigar 供货。',

  `description_ar` = '«لا كاسا ديل هابانو» في شيانغ ماي، بشارع نيمانهيمين. تشكيلة من سيجار هافانا وقائمة ويسكي سينغل مولت. يزوّدها Pacific Cigar، موزّع هابانوس لآسيا والمحيط الهادئ.',

  `updated_at` = NOW()
 WHERE `id` = 2497 AND `country_id` = 'thailand';

UPDATE `translation_status`
   SET `source_hash` = (SELECT SHA1(`description`) FROM `lounges` WHERE `id` = 2497),
       `statut` = 'machine', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2497' AND `champ` = 'description';

-- ── Hanoï : le doublon du Metropole ──────────────────────
UPDATE `lounges`
   SET `is_verified` = 0,
       `source`      = 'RETIRÉ — même adresse que la fiche 141 ; et Hanoï a un Habanos Specialist, pas une Casa del Habano',
       `updated_at`  = NOW()
 WHERE `id` = 2503 AND `country_id` = 'vietnam';

-- ── Les trois villes que le réseau n'a pas ───────────────
UPDATE `lounges`
   SET `is_verified` = 0,
       `source`      = 'RETIRÉ — cette ville ne figure pas parmi les adresses du réseau dans ce pays',
       `updated_at`  = NOW()
 WHERE `id` IN (2499, 2502, 2506);

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 151','systeme','fiche_corrigee','lounge',137,'Cohiba Atmosphere Bangkok est 63/3 Soi Ruamdee 3, Ploenchit Road, Lumpini — pas au Banyan Tree ; telephone du Banyan Tree efface ; source habanos.com'),
  (NULL,'migration 151','systeme','fiche_corrigee','lounge',2497,'Chiang Mai est 1/5 Soi 9 Nimmanhemin Road, pas au Maya Lifestyle ; meme etablissement, adresse affinee ; source habanos.com'),
  (NULL,'migration 151','systeme','lounge_retire','lounge',2503,'15 Ngo Quyen est deja la fiche 141, le bar du Sofitel Metropole ; et Hanoi a un Habanos Specialist, pas une Casa del Habano'),
  (NULL,'migration 151','systeme','lounge_retire','lounge',2499,'Davidoff n est pas atteste au Central Festival de Phuket'),
  (NULL,'migration 151','systeme','lounge_retire','lounge',2502,'aucune adresse du reseau a Pattaya'),
  (NULL,'migration 151','systeme','lounge_retire','lounge',2506,'aucune adresse du reseau a Da Nang ; le Vietnam a Ho Chi Minh-Ville et Hanoi'),
  (NULL,'migration 151','systeme','a_documenter','lounge',0,'La Casa del Habano Sindhorn Kempinski, Bangkok, quartier Langsuan — seconde Casa del Habano de la ville, adresse postale a relever'),
  (NULL,'migration 151','systeme','a_documenter','lounge',0,'Habanos Specialist de Hanoi, exploite par Avanti Group, distributeur Golden Phoenix — adresse postale a relever'),
  (NULL,'migration 151','systeme','bloc_clos','lounge',0,'fin du bloc « affiliation officielle affirmee sans source externe » : 28 fiches, 9 corrigees, 18 depubliees, 1 ajoutee');
