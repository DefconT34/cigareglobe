-- ════════════════════════════════════════════════════════
-- 150 — Argentine et Chili : les villes de province qui n'en ont pas
-- ────────────────────────────────────────────────────────
-- Même méthode qu'aux migrations 146 à 148. Les réseaux publient leurs
-- adresses ; on les lit, et on compare.
--
-- ── CE QUE L'ATLAS AVAIT DÉJÀ DE JUSTE ───────────────────
-- L'Argentine a DEUX La Casa del Habano, toutes deux à Buenos Aires, et
-- l'atlas les porte correctement depuis longtemps : #157 San Martín 690,
-- la première, et #156 Gorriti 4325 à Palermo, la seconde, ouverte le
-- 12 décembre 2024 par Blanca et Lucía Alsogaray — 250 m², sourcée
-- « habanos.com officiel ».
--
-- Le Chili en a UNE, et l'atlas la porte aussi : #159, Hotel W, Isidora
-- Goyenechea 3000, local S-104 au niveau -1, Las Condes.
--
-- Ce chantier ne découvre donc rien de neuf sur ces deux pays. Il retire
-- ce que l'import du 22 mars y avait ajouté en plus.
--
-- ── LE COHIBA ATMOSPHERE EST DANS L'AUTRE QUARTIER ───────
-- #158 le plaçait « Moreno 1041, Microcentro ». Habanos S.A. le situe
-- MORENO 518, dans le quartier colonial de SAN TELMO. Même rue, autre
-- numéro, autre quartier — cinq cents mètres et un nom de quartier
-- d'écart, ce qui suffit à ne pas trouver la porte.
--
-- Le téléphone n'est PAS effacé. Il n'est attesté nulle part, mais rien
-- ne le dit faux non plus, et l'erreur portait sur le numéro de rue, pas
-- sur l'établissement. Règle posée par la migration 139 : on ne touche
-- pas à ce qu'on ne sait pas faux. Effacer par principe ferait perdre un
-- contact réel aussi souvent qu'un faux.
--
-- ── LES QUATRE VILLES DE PROVINCE ────────────────────────
--   #2525 Rosario, #2526 Mendoza — l'Argentine n'a que Buenos Aires.
--   #2529 Concepción, #2530 Antofagasta — le Chili n'a que Santiago.
--
-- ── ET UNE CINQUIÈME, HORS DU LOT ────────────────────────
-- #742 « La Casa del Habano — Santiago (Vitacura) » appartient au bloc
-- « liste officielle non retrouvée » (migration 135) et non aux
-- vingt-huit de ce chantier. L'exploitant chilien publie ses adresses :
-- il n'en annonce qu'une, l'Hotel W. Publier #159 en retirant #2529 et
-- #2530 tout en laissant #742 serait incohérent sur la même preuve.
--
-- ── LA FICHE DE SANTIAGO GAGNE CE QU'ELLE N'AVAIT PAS ────
-- #159 n'avait ni téléphone ni horaires. L'exploitant les publie :
-- +569 5796 4229, du lundi au vendredi de 11h30 à 19h30, le samedi
-- jusqu'à 15h.
--
-- Elle est la SIXIÈME fiche de l'atlas à porter des horaires. Avant ce
-- chantier il n'y en avait qu'une sur cinq cents ; les migrations 143,
-- 146 et 147 en ont ajouté quatre — Bertie Hong Kong et Phnom Penh, le
-- Davidoff du Pavilion, La Casa del Habano Togo. Ce n'est pas une
-- collecte d'horaires, c'est ce qu'on trouve en passant quand on va
-- vérifier une adresse à la source. Le vrai chantier des horaires reste
-- entier.
--
-- Après cette migration :
--   php tools/contenu_dump.php
--   php tools/sources.php --figer
--   php tools/i18n_dump.php > sql/traductions.sql
-- ════════════════════════════════════════════════════════

-- ── Buenos Aires : le bon numéro, le bon quartier ────────
UPDATE `lounges` SET
  `city`   = 'Buenos Aires — Moreno 518, San Telmo, C1091AAL',
  `source` = 'habanos.com — fiche officielle Cohiba Atmosphere Buenos Aires',

  `description`    = 'Salon Cohiba Atmosphere du quartier colonial de San Telmo, à Buenos Aires. Service complet autour des Habanos, dans le réseau officiel de salons de la marque.',

  `description_en` = 'Cohiba Atmosphere lounge in the colonial district of San Telmo, Buenos Aires. Full service built around Habanos, within the brand''s official network of lounges.',

  `description_es` = 'Salón Cohiba Atmosphere en el barrio colonial de San Telmo, en Buenos Aires. Servicio completo en torno a los Habanos, dentro de la red oficial de salones de la marca.',

  `description_de` = 'Cohiba-Atmosphere-Lounge im Kolonialviertel San Telmo in Buenos Aires. Vollständiger Service rund um Habanos, innerhalb des offiziellen Lounge-Netzes der Marke.',

  `description_zh` = '位于布宜诺斯艾利斯圣特尔莫殖民老城区的高希霸 Atmosphere 雪茄吧，属于该品牌的官方雪茄吧网络，围绕哈伯纳斯提供全套服务。',

  `description_ar` = 'صالة كوهيبا أتموسفير في حي سان تيلمو الاستعماري ببوينس آيرس. خدمة متكاملة حول سيجار هابانوس، ضمن الشبكة الرسمية لصالات العلامة.',

  `updated_at` = NOW()
 WHERE `id` = 158 AND `country_id` = 'argentina';

UPDATE `translation_status`
   SET `source_hash` = (SELECT SHA1(`description`) FROM `lounges` WHERE `id` = 158),
       `statut` = 'machine', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '158' AND `champ` = 'description';

-- ── Santiago : le téléphone et les horaires ──────────────
UPDATE `lounges` SET
  `phone`   = '+56 9 5796 4229',
  `hours`   = 'Lun–Ven 11h30–19h30 · Sam 11h30–15h',
  `website` = 'https://www.casadelhabanochile.cl/',
  `source`  = 'casadelhabanochile.cl',

  `description`    = 'Unique La Casa del Habano du Chili, au niveau -1 de l''hôtel W à Las Condes. Cent quatre mètres carrés : cave, spiritueux, cafés et accessoires. Exploitée par Intercigar, approvisionnée par Puro Tabaco.',

  `description_en` = 'Chile''s only La Casa del Habano, on level -1 of the W hotel in Las Condes. One hundred and four square metres: humidor, spirits, coffees and accessories. Run by Intercigar, supplied by Puro Tabaco.',

  `description_es` = 'Única La Casa del Habano de Chile, en el nivel -1 del hotel W en Las Condes. Ciento cuatro metros cuadrados: humidor, destilados, cafés y accesorios. Operada por Intercigar, abastecida por Puro Tabaco.',

  `description_de` = 'Chiles einzige La Casa del Habano, auf Ebene -1 des Hotels W in Las Condes. Hundertvier Quadratmeter: Humidor, Spirituosen, Kaffees und Accessoires. Betrieben von Intercigar, beliefert von Puro Tabaco.',

  `description_zh` = '智利唯一的 La Casa del Habano，位于拉斯孔德斯 W 酒店负一层。面积一百零四平方米，设雪茄柜、烈酒、咖啡与配件。由 Intercigar 经营，Puro Tabaco 供货。',

  `description_ar` = 'المتجر الوحيد «لا كاسا ديل هابانو» في تشيلي، في الطابق −1 من فندق W بحيّ لاس كونديس. مئة وأربعة أمتار مربعة: مستودع ترطيب، ومشروبات روحية، وقهوة، وإكسسوارات. تديره Intercigar ويزوّده Puro Tabaco.',

  `updated_at` = NOW()
 WHERE `id` = 159 AND `country_id` = 'chile';

UPDATE `translation_status`
   SET `source_hash` = (SELECT SHA1(`description`) FROM `lounges` WHERE `id` = 159),
       `statut` = 'machine', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '159' AND `champ` = 'description';

-- ── Les villes de province ───────────────────────────────
UPDATE `lounges`
   SET `is_verified` = 0,
       `source`      = 'RETIRÉ — le réseau n''a dans ce pays que la ou les adresses de la capitale',
       `updated_at`  = NOW()
 WHERE `id` IN (742, 2525, 2526, 2529, 2530);

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 150','systeme','fiche_corrigee','lounge',158,'Cohiba Atmosphere Buenos Aires est Moreno 518 a San Telmo, pas Moreno 1041 au Microcentro ; source habanos.com'),
  (NULL,'migration 150','systeme','fiche_corrigee','lounge',159,'telephone et horaires ajoutes depuis casadelhabanochile.cl ; deuxieme fiche de l atlas a porter des horaires'),
  (NULL,'migration 150','systeme','lounge_retire','lounge',2525,'l Argentine n a que deux Casa del Habano, toutes deux a Buenos Aires'),
  (NULL,'migration 150','systeme','lounge_retire','lounge',2526,'l Argentine n a que deux Casa del Habano, toutes deux a Buenos Aires'),
  (NULL,'migration 150','systeme','lounge_retire','lounge',2529,'le Chili n a qu une Casa del Habano, a Santiago'),
  (NULL,'migration 150','systeme','lounge_retire','lounge',2530,'le Chili n a qu une Casa del Habano, a Santiago'),
  (NULL,'migration 150','systeme','lounge_retire','lounge',742,'l exploitant chilien n annonce qu une adresse, l Hotel W ; aucune a Vitacura');
