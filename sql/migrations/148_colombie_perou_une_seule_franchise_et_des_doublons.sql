-- ════════════════════════════════════════════════════════
-- 148 — Colombie et Pérou : une seule franchise, et des doublons
-- ────────────────────────────────────────────────────────
-- Suite du chantier ouvert par la migration 146. Le réseau publie ses
-- ouvertures ; il suffit de le lire.
--
-- ── LA COLOMBIE N'A QU'UNE CASA DEL HABANO, ET ELLE EST NEUVE ─
-- Le réseau a annoncé « the first La Casa del Habano franchise in
-- Colombia » ouverte à Bogotá le 28 DÉCEMBRE 2025, quartier Quinta
-- Camacho, exploitée par Caribe Imports S.A.S., distributeur exclusif
-- d'Habanos en Colombie depuis 2012.
--
-- « La première » est une date autant qu'un rang : avant cette
-- ouverture, il n'y avait AUCUNE franchise dans le pays. Or l'atlas en
-- affichait cinq, toutes ailleurs — Usaquén, Medellín, Barranquilla et
-- deux à Carthagène.
--
-- #747 est corrigée plutôt que retirée : elle était déjà à Bogotá, et
-- l'adresse publique /cave/747-… reste la même. Elle reçoit la vraie
-- adresse, Calle 70 No. 10a-25.
--
-- ⚠ UNE TENSION QU'ON N'EFFACE PAS. Des annuaires de voyage listent un
-- commerce nommé « La Casa del Habano » à Carthagène, avec des avis
-- antérieurs à 2025. Deux lectures possibles : une enseigne qui porte
-- le nom sans la franchise, ou une fiche d'annuaire mal tenue. Aucune
-- des deux n'autorise à écrire « La Casa del Habano Officielle », qui
-- est une affirmation sur un contrat. Les fiches sont dépubliées, et la
-- tension est consignée au journal plutôt que tranchée sans preuve.
--
-- ── LE PÉROU EN A DEUX, ET L'ATLAS LES AVAIT DÉJÀ ────────
-- Habanos S.A. tient des pages pour « La Casa del Habano Lima – La
-- Encalada » et pour la boutique du centre commercial. L'atlas les
-- porte depuis longtemps, sourcées :
--
--   #161  Lima (Larcomar), Malecón de la Reserva 610, Miraflores
--   #162  Lima (La Encalada), Ave. La Encalada 1601
--
-- #2532 « La Casa del Habano — Miraflores, Av. Larco 770 » est donc un
-- TROISIÈME exemplaire du même quartier : Larcomar est à Miraflores, et
-- c'est déjà la fiche #161. Un doublon posé à cent mètres de l'original.
--
-- ── DEUX DAVIDOFF QUE RIEN N'ATTESTE ─────────────────────
-- #2520 Cali (Chipichape) et #2534 Lima (Jockey Plaza). Les centres
-- commerciaux existent et publient leurs enseignes ; Davidoff n'y
-- figure pas. Les Davidoff colombiens attestés sont ailleurs, et
-- l'atlas les a déjà : #160 Bogotá El Retiro et #748 Medellín El
-- Poblado, sourcé davidoff.com.
--
-- ── DEUX FICHES HORS DU LOT DE CE CHANTIER ───────────────
-- #747 et #749 appartiennent au bloc « réseau La Casa del Habano, liste
-- officielle non retrouvée » (migration 135), pas aux vingt-huit du
-- présent chantier. On les traite quand même : la preuve qui règle
-- #2518, #2519 et #2522 les règle aussi, et publier les unes en
-- retirant les autres sur la même preuve serait incohérent.
--
-- Après cette migration :
--   php tools/contenu_dump.php
--   php tools/sources.php --figer
--   php tools/i18n_dump.php > sql/traductions.sql
-- ════════════════════════════════════════════════════════

-- ── Bogotá : la fiche rendue à la vraie franchise ────────
UPDATE `lounges` SET
  `name`    = 'La Casa del Habano — Bogotá (Quinta Camacho)',
  `city`    = 'Bogotá — Calle 70 No. 10a-25, Quinta Camacho',
  `type`    = 'La Casa del Habano Officielle',
  `phone`   = '+57 311 718 3211',
  `source`  = 'lacasadelhabano.com — annonce « First La Casa del Habano franchise in Colombia »',

  `description`    = 'Première franchise La Casa del Habano de Colombie, ouverte en décembre 2025 dans le quartier patrimonial de Quinta Camacho, à Bogotá. Cave climatisée, salon Montecristo au rez-de-chaussée, salons privés Cohiba et Romeo y Julieta à l''étage. Exploitée par Caribe Imports, distributeur d''Habanos dans le pays depuis 2012.',

  `description_en` = 'First La Casa del Habano franchise in Colombia, opened in December 2025 in the heritage district of Quinta Camacho, Bogotá. Climate-controlled humidor, Montecristo lounge on the ground floor, private Cohiba and Romeo y Julieta lounges upstairs. Run by Caribe Imports, the country''s Habanos distributor since 2012.',

  `description_es` = 'Primera franquicia La Casa del Habano de Colombia, abierta en diciembre de 2025 en el barrio patrimonial de Quinta Camacho, en Bogotá. Humidor climatizado, salón Montecristo en la planta baja, salones privados Cohiba y Romeo y Julieta en el piso superior. Operada por Caribe Imports, distribuidor de Habanos en el país desde 2012.',

  `description_de` = 'Erste La Casa del Habano-Franchise Kolumbiens, eröffnet im Dezember 2025 im denkmalgeschützten Viertel Quinta Camacho in Bogotá. Klimatisierter Humidor, Montecristo-Lounge im Erdgeschoss, private Cohiba- und Romeo-y-Julieta-Lounges im Obergeschoss. Betrieben von Caribe Imports, seit 2012 Habanos-Distributor des Landes.',

  `description_zh` = '哥伦比亚首家 La Casa del Habano 特许店，2025 年 12 月开业，位于波哥大历史街区金塔卡马乔。设恒温恒湿雪茄柜，一层为蒙特克里斯托厅，二层设高希霸与罗密欧与朱丽叶私人包厢。由 2012 年起担任该国哈伯纳斯经销商的 Caribe Imports 经营。',

  `description_ar` = 'أوّل امتياز «لا كاسا ديل هابانو» في كولومبيا، افتُتح في كانون الأول/ديسمبر 2025 في حي كينتا كاماتشو التراثي ببوغوتا. مستودع ترطيب مكيّف، وصالة مونتيكريستو في الطابق الأرضي، وصالتان خاصتان كوهيبا وروميو إي جولييتا في الطابق العلوي. تديره Caribe Imports، موزّع هابانوس في البلاد منذ 2012.',

  `updated_at` = NOW()
 WHERE `id` = 747 AND `country_id` = 'colombia';

UPDATE `translation_status`
   SET `source_hash` = (SELECT SHA1(`description`) FROM `lounges` WHERE `id` = 747),
       `statut` = 'machine', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '747' AND `champ` = 'description';

-- ── Les quatre autres « Casa del Habano » de Colombie ────
UPDATE `lounges`
   SET `is_verified` = 0,
       `source`      = 'RETIRÉ — la première franchise de Colombie a ouvert à Bogotá fin 2025 ; il n''y en a pas d''autre',
       `updated_at`  = NOW()
 WHERE `id` IN (749, 2518, 2519, 2522);

-- ── Le doublon de Miraflores ─────────────────────────────
UPDATE `lounges`
   SET `is_verified` = 0,
       `source`      = 'RETIRÉ — doublon de la fiche 161, Larcomar, dans le même quartier de Miraflores',
       `updated_at`  = NOW()
 WHERE `id` = 2532 AND `country_id` = 'peru';

-- ── Les deux Davidoff que rien n'atteste ─────────────────
UPDATE `lounges`
   SET `is_verified` = 0,
       `source`      = 'RETIRÉ — le centre commercial publie ses enseignes, Davidoff n''y figure pas',
       `updated_at`  = NOW()
 WHERE `id` IN (2520, 2534);

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 148','systeme','fiche_corrigee','lounge',747,'la seule Casa del Habano de Colombie est Calle 70 No 10a-25, Quinta Camacho, ouverte le 28 decembre 2025 par Caribe Imports ; source lacasadelhabano.com'),
  (NULL,'migration 148','systeme','lounge_retire','lounge',749,'Carthagene : aucune franchise avant l ouverture de Bogota fin 2025'),
  (NULL,'migration 148','systeme','lounge_retire','lounge',2518,'Medellin : aucune franchise avant l ouverture de Bogota fin 2025'),
  (NULL,'migration 148','systeme','lounge_retire','lounge',2519,'Barranquilla : aucune franchise avant l ouverture de Bogota fin 2025'),
  (NULL,'migration 148','systeme','lounge_retire','lounge',2522,'Carthagene (Charleston) : aucune franchise avant l ouverture de Bogota fin 2025'),
  (NULL,'migration 148','systeme','tension_signalee','lounge',0,'des annuaires listent un commerce nomme La Casa del Habano a Carthagene avec des avis anterieurs a 2025 ; le reseau dit Bogota premiere franchise du pays. Enseigne sans franchise, ou annuaire mal tenu : non tranche'),
  (NULL,'migration 148','systeme','lounge_retire','lounge',2532,'Larcomar est a Miraflores et c est deja la fiche 161 ; doublon a cent metres'),
  (NULL,'migration 148','systeme','lounge_retire','lounge',2520,'Davidoff ne figure pas parmi les enseignes publiees par Chipichape a Cali'),
  (NULL,'migration 148','systeme','lounge_retire','lounge',2534,'Davidoff ne figure pas parmi les enseignes publiees par Jockey Plaza a Lima');
