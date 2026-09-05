-- ════════════════════════════════════════════════════════
-- 155 — Les salons d'hôtel : un tri, pas une purge
-- ────────────────────────────────────────────────────────
-- Dernier bloc du chantier : trente et une fiches portant « sans source
-- externe » depuis la migration 141. Trente viennent de l'import du
-- 22 mars, et toutes ont la même forme — un hôtel réel, un salon
-- cigares affirmé. C'est exactement ce que la migration 145 a démasqué
-- à Dubaï, Osaka et Bethesda.
--
-- ── MAIS CE BLOC-CI EST MIXTE, ET C'EST L'ESSENTIEL ──────
-- Les trois blocs précédents étaient homogènes : une source inventée,
-- une affiliation impossible, une enseigne dupliquée. Ici, la
-- vérification donne des réponses des DEUX côtés. Quatre de ces salons
-- existent pour de bon, et deux portent même un nom que l'atlas
-- ignorait. Traiter ce bloc comme les précédents aurait supprimé du
-- vrai.
--
-- ── LES QUATRE QUI EXISTENT ──────────────────────────────
--   #2498 InterContinental Bangkok — le salon s'appelle HUMIDOR CIGAR
--         BAR, avec le Balcony Lounge. Une vingtaine de places, ouvert
--         aux non-résidents ; l'hôtel lui consacre une page.
--   #2505 Caravelle Saigon — c'est le SAIGON SAIGON BAR, le rooftop,
--         dont l'humidor tient Cohiba, Montecristo, Partagás et Romeo
--         y Julieta.
--   #2517 Capella Singapore — le CAPELLA CIGAR LOUNGE : boiseries,
--         fauteuils de cuir, cave accessible de cent vingt-quatre
--         cigares cubains et dominicains.
--   #2524 Alvear Palace, Buenos Aires — le bar à cigares est attesté,
--         avec une sélection cubaine. Le nom « Churchill » que portait
--         la fiche ne l'est pas : il disparaît.
--
-- ── LES ONZE QUE L'ÉTABLISSEMENT CONTREDIT ───────────────
-- Ce ne sont pas des fiches « qu'on n'a pas trouvées » : ce sont des
-- fiches dont l'établissement PUBLIE la liste de ses bars, et aucun
-- n'est un salon cigares.
--
--   #2501 Mandarin Oriental Bangkok — l'Authors' Lounge est le salon
--         de thé de l'hôtel. Son lieu cigares est La Casa del Habano,
--         que l'atlas porte déjà en #136.
--   #2511 The RuMa, Kuala Lumpur — ATAS, SEVEN, The LIBRARI, SANTAI.
--   #2523 Faena, Buenos Aires — on y fume au bord de la piscine, et
--         l'hôtel ne vend pas de cigares.
--   #2504 Park Hyatt Saigon, #2507 InterContinental Hanoi Westlake,
--   #2516 1-Altitude, #2500 The Dome at State Tower, #2521 Club
--   Colombia, #2528 Ritz-Carlton Santiago, #2533 Country Club Lima,
--   #2535 Hotel Monasterio Cusco.
--
-- ── LES SEIZE QU'ON NE PEUT PAS TRANCHER, ET QU'ON GARDE ─
-- Quinze hôtels d'Afrique de l'Ouest — Dakar, Cotonou, Ouagadougou,
-- Bamako, Lomé, Conakry — plus un club à Viña del Mar. Aucun ne publie
-- de liste de bars consultable ; on ne trouve ni confirmation, ni
-- démenti.
--
-- ELLES NE SONT PAS RETIRÉES, et c'est délibéré. Dans les blocs
-- précédents, retirer se fondait sur une preuve POSITIVE : un domaine
-- inventé, une franchise impossible, un doublon. Ici il n'y aurait que
-- mon incapacité à trouver — et la couverture web d'un hôtel de Bamako
-- n'a rien à voir avec celle d'un hôtel de Singapour. Retirer sur ce
-- silence-là reviendrait à faire disparaître l'Afrique de l'Ouest de
-- l'atlas parce qu'elle est moins indexée.
--
-- Le champ `source` dit désormais exactement l'état : l'hôtel existe,
-- son salon cigares n'est recoupé nulle part.
--
-- ── ET UNE ADRESSE TROUVÉE EN CHERCHANT ──────────────────
-- En cherchant les fumoirs d'hôtel de Bamako, un vrai club est apparu :
-- LES MAISONS LE CADRE, cigare club à ACI 2000, immeuble du
-- Cinquantenaire. Il publie ses adresses. L'atlas listait des salons
-- d'hôtel non recoupés et ignorait le seul club cigares déclaré de la
-- ville. Il est ajouté. (Le Cadre annonce aussi Conakry, « bientôt » :
-- on n'inscrit pas ce qui n'est pas ouvert.)
--
-- Après cette migration :
--   php tools/contenu_dump.php
--   php tools/sources.php --figer
--   php tools/i18n_dump.php > sql/traductions.sql
-- ════════════════════════════════════════════════════════

-- ── Bangkok : le Humidor Cigar Bar ───────────────────────
UPDATE `lounges` SET
  `name` = 'Humidor Cigar Bar — InterContinental Bangkok',
  `website` = 'https://bangkok.intercontinental.com/bars/humidor-cigar-bar',
  `source` = 'bangkok.intercontinental.com',
  `description`    = 'Bar à cigares de l''InterContinental Bangkok, attenant au Balcony Lounge. Une vingtaine de places, cave fournie en havanes et en cigares du Nouveau Monde, ouverte aux visiteurs comme aux résidents.',
  `description_en` = 'Cigar bar of the InterContinental Bangkok, next to the Balcony Lounge. Around twenty seats, a humidor stocked with Havanas and New World cigars, open to visitors as well as hotel guests.',
  `description_es` = 'Bar de puros del InterContinental Bangkok, junto al Balcony Lounge. Una veintena de plazas, humidor surtido de habanos y puros del Nuevo Mundo, abierto a visitantes y huéspedes.',
  `description_de` = 'Zigarrenbar des InterContinental Bangkok, neben der Balcony Lounge. Rund zwanzig Plätze, ein Humidor mit Havannas und New-World-Zigarren, offen für Besucher wie für Hotelgäste.',
  `description_zh` = '曼谷洲际酒店的雪茄吧，紧邻 Balcony Lounge。约二十个座位，雪茄柜备有哈瓦那与新世界雪茄，非住客亦可入内。',
  `description_ar` = 'بار السيجار في فندق إنتركونتيننتال بانكوك، الملاصق لصالة بالكوني. نحو عشرين مقعدًا، ومستودع ترطيب يضمّ سيجار هافانا وسيجار العالم الجديد، مفتوح للزوار والنزلاء معًا.',
  `updated_at` = NOW()
 WHERE `id` = 2498 AND `country_id` = 'thailand';

-- ── Saigon : le Saigon Saigon Bar ────────────────────────
UPDATE `lounges` SET
  `name` = 'Saigon Saigon Bar — Caravelle',
  `source` = 'cigaraficionado.com',
  `description`    = 'Bar en terrasse au dernier étage du Caravelle, ouvert depuis les années 1960. Humidor tenant Cohiba, Montecristo, Partagás et Romeo y Julieta, au-dessus de la place Lam Son.',
  `description_en` = 'Rooftop bar on the top floor of the Caravelle, open since the 1960s. A humidor holding Cohiba, Montecristo, Partagás and Romeo y Julieta, above Lam Son square.',
  `description_es` = 'Bar en la azotea del Caravelle, abierto desde los años sesenta. Humidor con Cohiba, Montecristo, Partagás y Romeo y Julieta, sobre la plaza Lam Son.',
  `description_de` = 'Dachbar im obersten Stock des Caravelle, seit den 1960er-Jahren geöffnet. Ein Humidor mit Cohiba, Montecristo, Partagás und Romeo y Julieta, über dem Lam-Son-Platz.',
  `description_zh` = '卡拉维尔酒店顶层的露台酒吧，自 1960 年代营业至今。雪茄柜备有高希霸、蒙特克里斯托、帕特加斯与罗密欧与朱丽叶，俯瞰林山广场。',
  `description_ar` = 'بار على سطح فندق كارافيل، مفتوح منذ ستينيات القرن الماضي. مستودع ترطيب يضمّ كوهيبا ومونتيكريستو وبارتاغاس وروميو إي جولييتا، فوق ساحة لام سون.',
  `updated_at` = NOW()
 WHERE `id` = 2505 AND `country_id` = 'vietnam';

-- ── Singapour : le Capella Cigar Lounge ──────────────────
UPDATE `lounges` SET
  `name` = 'Capella Cigar Lounge — Sentosa',
  `source` = 'citynomads.com, egmcigars.com',
  `description`    = 'Salon cigares du Capella, sur l''île de Sentosa. Boiseries et fauteuils de cuir profond, cave accessible réunissant cent vingt-quatre cigares cubains et dominicains.',
  `description_en` = 'Cigar lounge of the Capella, on Sentosa island. Wood panelling and deep leather chairs, a walk-in humidor holding one hundred and twenty-four Cuban and Dominican cigars.',
  `description_es` = 'Salón de puros del Capella, en la isla de Sentosa. Paneles de madera y sillones de cuero, humidor accesible con ciento veinticuatro puros cubanos y dominicanos.',
  `description_de` = 'Zigarrenlounge des Capella auf der Insel Sentosa. Holzvertäfelung und tiefe Ledersessel, ein begehbarer Humidor mit hundertvierundzwanzig kubanischen und dominikanischen Zigarren.',
  `description_zh` = '圣淘沙岛嘉佩乐酒店的雪茄吧。木饰墙面与深座皮质扶手椅，步入式雪茄柜藏有一百二十四款古巴与多米尼加雪茄。',
  `description_ar` = 'صالة السيجار في فندق كابيلا بجزيرة سنتوسا. جدران خشبية ومقاعد جلدية عميقة، ومستودع ترطيب يمكن دخوله يضمّ مئة وأربعة وعشرين نوعًا من سيجار كوبا والدومينيكان.',
  `updated_at` = NOW()
 WHERE `id` = 2517 AND `country_id` = 'singapore';

-- ── Buenos Aires : le nom « Churchill » disparaît ────────
UPDATE `lounges` SET
  `name` = 'Alvear Palace — Bar à cigares',
  `source` = 'attesté par des sources tierces ; le nom « Churchill » ne l''est pas',
  `description`    = 'Bar à cigares de l''Alvear Palace, avenue Alvear, dans le quartier de la Recoleta. Sélection cubaine, surtout des robustos.',
  `description_en` = 'Cigar bar of the Alvear Palace, on Avenida Alvear in the Recoleta district. A Cuban selection, mostly robustos.',
  `description_es` = 'Bar de puros del Alvear Palace, en la avenida Alvear, en el barrio de la Recoleta. Selección cubana, sobre todo robustos.',
  `description_de` = 'Zigarrenbar des Alvear Palace, an der Avenida Alvear im Viertel Recoleta. Kubanische Auswahl, überwiegend Robustos.',
  `description_zh` = '阿尔维尔宫酒店的雪茄吧，位于雷科莱塔区阿尔维尔大道。以古巴雪茄为主，多为罗布图尺寸。',
  `description_ar` = 'بار السيجار في فندق ألفيار بالاس، بجادة ألفيار في حي ريكوليتا. تشكيلة كوبية، معظمها من مقاس روبوستو.',
  `updated_at` = NOW()
 WHERE `id` = 2524 AND `country_id` = 'argentina';

UPDATE `translation_status` t
  JOIN `lounges` l ON l.`id` = t.`entite_id`
   SET t.`source_hash` = SHA1(l.`description`), t.`statut` = 'machine', t.`maj` = NOW()
 WHERE t.`entite` = 'lounges' AND t.`champ` = 'description'
   AND t.`entite_id` IN ('2498','2505','2517','2524');

-- ── Les onze que l'établissement contredit ───────────────
UPDATE `lounges`
   SET `is_verified` = 0,
       `source`      = 'RETIRÉ — l''établissement publie la liste de ses bars, aucun n''est un salon cigares',
       `updated_at`  = NOW()
 WHERE `id` IN (2500, 2501, 2504, 2507, 2511, 2516, 2521, 2523, 2528, 2533, 2535);

-- ── Les quinze qu'on garde, avec ce qu'on en sait ────────
UPDATE `lounges`
   SET `source`     = 'à vérifier — l''hôtel existe, son salon cigares n''est recoupé nulle part',
       `updated_at` = NOW()
 WHERE `id` IN (2537, 2538, 2539, 2540, 2541,   -- Dakar
                2546, 2547,                     -- Cotonou
                2552, 2553,                     -- Ouagadougou
                2554, 2555,                     -- Bamako
                2543, 2544,                     -- Lomé
                2549, 2550);                    -- Conakry

UPDATE `lounges`
   SET `source`     = 'à vérifier — établissement non recoupé',
       `updated_at` = NOW()
 WHERE `id` = 745 AND `country_id` = 'chile';

-- ── Le club de Bamako que l'atlas ignorait ───────────────
INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`,
   `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
VALUES (
  2565, 'mali',
  'Le Cadre VIP — Bamako',
  'Bamako — ACI 2000, immeuble du Cinquantenaire',
  'Cigare Club & Lounge',
  'https://www.lecadre223.com/',
  'lecadre223.com',
  1,
  'Club cigares de Bamako, à ACI 2000 : cave de cigares premium, bar, restaurant et lounge. La maison tient une seconde adresse à l''Hippodrome, sans cave.',
  'Cigar club in Bamako, at ACI 2000: a premium cigar selection, bar, restaurant and lounge. The house keeps a second address at Hippodrome, without a humidor.',
  'Club de puros de Bamako, en ACI 2000: selección de puros premium, bar, restaurante y salón. La casa tiene una segunda dirección en Hippodrome, sin humidor.',
  'Zigarrenclub in Bamako, in ACI 2000: Auswahl an Premiumzigarren, Bar, Restaurant und Lounge. Das Haus führt eine zweite Adresse in Hippodrome, ohne Humidor.',
  '巴马科的雪茄俱乐部，位于 ACI 2000：备有高端雪茄、酒吧、餐厅与休息厅。该品牌在 Hippodrome 另设一处门店，不设雪茄柜。',
  'نادي سيجار في باماكو، بحي ACI 2000: تشكيلة سيجار فاخرة، وبار، ومطعم، وصالة. وللدار عنوان ثانٍ في هيبودروم، دون مستودع ترطيب.',
  NOW(), NOW());

INSERT INTO `translation_status`
  (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'lounges', 2565, 'description', l.`lang`,
       (SELECT SHA1(`description`) FROM `lounges` WHERE `id` = 2565),
       'machine', NOW()
  FROM (SELECT 'en' AS `lang` UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') AS l;

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 155','systeme','fiche_corrigee','lounge',2498,'le salon de l InterContinental Bangkok est le Humidor Cigar Bar ; source bangkok.intercontinental.com'),
  (NULL,'migration 155','systeme','fiche_corrigee','lounge',2505,'le rooftop du Caravelle est le Saigon Saigon Bar, humidor Cohiba Montecristo Partagas Romeo y Julieta'),
  (NULL,'migration 155','systeme','fiche_corrigee','lounge',2517,'Capella Cigar Lounge : cave accessible de 124 cigares cubains et dominicains'),
  (NULL,'migration 155','systeme','fiche_corrigee','lounge',2524,'le bar a cigares de l Alvear Palace est atteste ; le nom « Churchill » ne l est pas et disparait'),
  (NULL,'migration 155','systeme','lounges_retires','lounge',0,'11 fiches contredites par la liste de bars que l etablissement publie : Mandarin Oriental Bangkok (l Authors Lounge est un salon de the, son lieu cigares est la LCDH #136), RuMa KL, Faena, Park Hyatt Saigon, InterContinental Hanoi Westlake, 1-Altitude, The Dome State Tower, Club Colombia, Ritz-Carlton Santiago, Country Club Lima, Monasterio Cusco'),
  (NULL,'migration 155','systeme','sources_precisees','lounge',0,'16 fiches gardees publiees : 15 hotels d Afrique de l Ouest et un club de Vina del Mar, sans confirmation ni dementi. Retirer sur ce silence reviendrait a faire disparaitre une region parce qu elle est moins indexee ; le champ source dit desormais l etat exact'),
  (NULL,'migration 155','systeme','fiche_ajoutee','lounge',2565,'Le Cadre VIP Bamako, ACI 2000 immeuble du Cinquantenaire — seul club cigares declare de la ville, que l atlas ignorait ; source lecadre223.com'),
  (NULL,'migration 155','systeme','a_documenter','lounge',0,'Le Cadre VIP Conakry annonce « bientot » par lecadre223.com — a inscrire a l ouverture');
