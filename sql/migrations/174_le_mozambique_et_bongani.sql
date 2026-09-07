-- ════════════════════════════════════════════════════════
-- 174 — Le Mozambique, dix-huitième pays producteur, et Bongani
-- ────────────────────────────────────────────────────────
-- LE MOZAMBIQUE N'ÉTAIT DANS L'ATLAS NI COMME PRODUCTEUR NI COMME PAYS
-- D'ADRESSES. Il entre par une seule maison — Bongani — et c'est
-- justement ce qui le rend intéressant : après la Côte d'Ivoire, c'est
-- le second pays africain que l'atlas ouvre en trois mois, et le
-- premier d'Afrique australe.
--
-- ── CE QUI EST ÉTABLI ────────────────────────────────────
-- Kamal Moukheiber, libanais de naissance, diplômé d'HEC Paris, a passé
-- quinze ans dans la banque d'investissement à Londres — Credit Suisse,
-- Lehman Brothers — avant de s'installer à Maputo en 2013 pour un
-- projet immobilier. Bongani commence comme un projet annexe.
--
--   · premier cigare : DÉCEMBRE 2016
--   · un maître cigarier DOMINICAIN, passé par General Cigar sur
--     Macanudo, forme les rouleuses mozambicaines ; première promotion
--     diplômée en 2017, une seconde en formation
--   · atelier dans le quartier de la BAIXA, à Maputo ; environ
--     10 000 cigares par mois ; une nouvelle fabrique en zone franche
--   · tabac cultivé au Mozambique par des paysans SOUS CONTRAT, à
--     partir de SEMENCES DOMINICAINES
--   · CAPE DU CAMEROUN — que l'atlas porte déjà comme « producteur de
--     cape exclusif » — et vieillissement en feuilles de cèdre du Ghana
--   · gamme : Robusto 5×50, 458 Toro 6×58, Gordo 4×58
--   · marchés : Mozambique, Afrique du Sud, Kenya, Nigeria, Congo et
--     CÔTE D'IVOIRE — dont l'atlas porte les adresses
--
-- Sources : moodiedavittreport.com (entretien avec le fondateur),
-- riotimesonline.com, cigars-connect.com, houseofgrauer.com.
--
-- ── UNE ÉTIQUETTE QUE LE FABRICANT NE REVENDIQUE PAS ─────
-- On lit partout — Wikipédia le premier — que Bongani est « la première
-- marque de cigares ENTIÈREMENT africaine ». LE FONDATEUR NE DIT PAS
-- CELA. Il revendique une sélection guidée par la qualité, d'Afrique
-- comme d'ailleurs, et la tripe mêle des tabacs africains et non
-- africains — dominicains compris.
--
-- « Premier cigare africain » se défend ; « entièrement africain » est
-- une formule de reprise de presse, et l'atlas ne la reprend pas. C'est
-- exactement le geste des dix-huit descriptions de la migration 162 :
-- ne pas affirmer à la place de celui qui fabrique.
--
-- ── LES TROUS SONT DÉCLARÉS ──────────────────────────────
-- `regions`, `varieties`, `climate`, `soil`, `harvest` et `revenue`
-- restent VIDES. Une couverture de presse attribue le tabac à la
-- province de MANICA ; c'est une source unique et indirecte, et la
-- fiche Wikipédia de la province ne mentionne AUCUNE culture de tabac.
-- Pour la Côte d'Ivoire, deux caves décrivaient l'assemblage par
-- terroir et une revue de géographie décrivait la région : ici, rien
-- de tel. On ne pose donc ni zone de culture, ni coordonnées, ni
-- feuille. Manica est nommée dans la prose, attribuée à la presse.
--
-- ── ET LE DRAPEAU PASSE PAR SES OCTETS ───────────────────
-- Leçon de la migration 168 : un emoji de drapeau tient sur QUATRE
-- octets, et un `mysql <` sans `--default-character-set=utf8mb4` le
-- remplace par des « ? ». Le fichier ne porte donc pas 🇲🇿 mais son
-- hexadécimal, reconverti côté serveur. Rien ici qu'un jeu de
-- caractères puisse abîmer.
--
-- Après cette migration :
--   php tools/contenu_dump.php
--   php tools/i18n_dump.php > sql/traductions.sql
--   php tools/coords_check.php
-- ════════════════════════════════════════════════════════

INSERT INTO `producer_countries`
  (`id`, `name`, `flag`, `lat`, `lon`, `color`, `tier`,
   `region`, `region_en`, `region_es`, `region_de`, `region_zh`, `region_ar`,
   `regions`, `varieties`, `tabacaleras`, `brands`,
   `production`, `production_en`, `production_es`, `production_de`, `production_zh`, `production_ar`,
   `revenue`,
   `rev_detail`, `rev_detail_en`, `rev_detail_es`, `rev_detail_de`, `rev_detail_zh`, `rev_detail_ar`,
   `notes`, `notes_en`, `notes_es`, `notes_de`, `notes_zh`, `notes_ar`)
VALUES (
  'mozambique', 'Mozambique',
  CONVERT(UNHEX('F09F87B2F09F87BF') USING utf8mb4),
  -18.7000, 35.5000, '#1E9E5A', 'emerging',

  -- Neuvième macro-région de l'atlas. Le Cameroun est en « Afrique
  -- Centrale », la Côte d'Ivoire en « Afrique de l'Ouest » ; aucune
  -- n'existait pour l'Afrique australe.
  'Afrique australe', 'Southern Africa', 'África Austral', 'Südliches Afrika', '南部非洲', 'الجنوب الأفريقي',

  '[]', '[]', '["Bongani Cigars"]',
  '[{"name":"Bongani","desc":"Cape du Cameroun, tabac cultivé au Mozambique sur semences dominicaines","iconic":true}]',

  'Production artisanale, atelier de Maputo',
  'Artisanal production, Maputo workshop',
  'Producción artesanal, taller de Maputo',
  'Handwerkliche Produktion, Werkstatt in Maputo',
  '手工生产，马普托工坊',
  'إنتاج حرفي في ورشة مابوتو',

  '',

  'Il n''existe pas de ligne d''exportation de cigares mozambicains. L''atelier de Maputo sort environ dix mille cigares par mois, vendus pour l''essentiel sur le continent — Mozambique, Afrique du Sud, Kenya, Nigeria, Congo, Côte d''Ivoire.',
  'There is no export line for Mozambican cigars. The Maputo workshop turns out some ten thousand cigars a month, sold mostly on the continent — Mozambique, South Africa, Kenya, Nigeria, Congo, Côte d''Ivoire.',
  'No existe una línea de exportación de puros mozambiqueños. El taller de Maputo saca unos diez mil puros al mes, vendidos sobre todo en el continente: Mozambique, Sudáfrica, Kenia, Nigeria, Congo, Costa de Marfil.',
  'Eine Exportposition für mosambikanische Zigarren gibt es nicht. Die Werkstatt in Maputo bringt rund zehntausend Zigarren im Monat hervor, überwiegend auf dem Kontinent verkauft — Mosambik, Südafrika, Kenia, Nigeria, Kongo, Côte d''Ivoire.',
  '并不存在莫桑比克雪茄的出口税目。马普托的工坊月产约一万支，主要在非洲大陆销售——莫桑比克、南非、肯尼亚、尼日利亚、刚果、科特迪瓦。',
  'لا يوجد بند جمركي لتصدير السيجار الموزمبيقي. تُنتج ورشة مابوتو نحو عشرة آلاف سيجار شهريًا، تُباع في معظمها داخل القارة: موزمبيق وجنوب أفريقيا وكينيا ونيجيريا والكونغو وساحل العاج.',

  'Le tabac est cultivé sur place par des paysans sous contrat, à partir de semences dominicaines. La cape vient du Cameroun, et les cigares vieillissent dans des feuilles de cèdre du Ghana.',
  'The tobacco is grown locally by contract farmers, from Dominican seed. The wrapper comes from Cameroon, and the cigars age in cedarwood sheets from Ghana.',
  'El tabaco se cultiva allí mismo por campesinos bajo contrato, a partir de semillas dominicanas. La capa viene de Camerún, y los puros envejecen en láminas de cedro de Ghana.',
  'Der Tabak wird vor Ort von Vertragsbauern angebaut, aus dominikanischem Saatgut. Das Deckblatt kommt aus Kamerun, und die Zigarren reifen in Zedernholzblättern aus Ghana.',
  '烟叶由当地契约农户以多米尼加种子就地种植。茄衣来自喀麦隆，雪茄则在加纳产的雪松木片中陈化。',
  'يُزرع التبغ محليًّا على يد مزارعين بعقود، من بذور دومينيكية. أمّا الغلاف فيأتي من الكاميرون، وتُعتَّق السيجار في صفائح خشب الأرز من غانا.'
);

-- ── Les données générales ────────────────────────────────
-- `producer_geo` est la seule table que TOUS les pays producteurs ont :
-- la migration 167 l'a appris en découvrant que la Côte d'Ivoire en
-- était la seule exception. On ne refait pas la même omission.
INSERT INTO `producer_geo`
  (`country_id`, `capital`, `population`, `area`, `currency`, `language`, `timezone`, `gdp`, `independent`,
   `currency_en`, `currency_es`, `currency_de`, `currency_zh`, `currency_ar`,
   `language_en`, `language_es`, `language_de`, `language_zh`, `language_ar`)
VALUES
  ('mozambique', 'Maputo', '34,2 M (2025)', '799 380 km²',
   'Metical (MZN)', 'Portugais', 'UTC+2', '22,7 Md$ (2024)', '1975',
   'Metical (MZN)', 'Metical (MZN)', 'Metical (MZN)', '梅蒂卡尔（MZN）', 'المتيكال (MZN)',
   'Portuguese', 'Portugués', 'Portugiesisch', '葡萄牙语', 'البرتغالية');

-- ── La maison ────────────────────────────────────────────
INSERT INTO `brands`
  (`name`, `country_id`, `founded`, `factory`, `history`, `gamme`,
   `history_en`, `history_es`, `history_de`, `history_zh`, `history_ar`,
   `gamme_en`, `gamme_es`, `gamme_de`, `gamme_zh`, `gamme_ar`)
VALUES (
  'Bongani', 'mozambique', '2016 — Maputo, Mozambique',
  'Bongani Cigars, quartier de la Baixa, Maputo',

  'Kamal Moukheiber, libanais de naissance et diplômé d''HEC Paris, a passé quinze ans dans la banque d''investissement à Londres — Credit Suisse, Lehman Brothers — avant de s''installer à Maputo en 2013 pour un projet immobilier. L''idée lui vient dans un café de la capitale, en regardant des clients fumer : l''Afrique cultive du tabac et n''en roule pas.

Le premier cigare sort en décembre 2016. Moukheiber fait venir un maître cigarier dominicain, passé par General Cigar sur Macanudo, pour former des rouleuses mozambicaines ; la première promotion est diplômée en 2017, une seconde est en formation. L''atelier, dans le quartier de la Baixa à Maputo, sort une dizaine de milliers de cigares par mois, et une nouvelle fabrique se construit en zone franche.

Le tabac est cultivé au Mozambique par des paysans sous contrat, à partir de semences dominicaines. La cape vient du Cameroun — que l''atlas porte comme producteur de cape — et les cigares vieillissent dans des feuilles de cèdre du Ghana. La maison se vend au Mozambique, en Afrique du Sud, au Kenya, au Nigeria, au Congo et en Côte d''Ivoire, dont l''atlas porte les adresses.

On lit souvent que Bongani est le premier cigare « entièrement africain ». Le fondateur ne le dit pas : il revendique une sélection guidée par la qualité, d''Afrique comme d''ailleurs, et la tripe mêle des tabacs africains et non africains. Le nom, lui, veut dire « sois reconnaissant » en zoulou.',

  '[{"name":"Robusto","color":"#4E7C4A","wrapper":"Cameroun","story":"Cinq pouces sur bague 50."},{"name":"458 Toro","color":"#3E6B3C","wrapper":"Cameroun","story":"Six pouces sur bague 58."},{"name":"Gordo","color":"#5C8C52","wrapper":"Cameroun","story":"Quatre pouces sur bague 58 : court et épais."}]',

  'Kamal Moukheiber, Lebanese by birth and a graduate of HEC Paris, spent fifteen years in investment banking in London — Credit Suisse, Lehman Brothers — before settling in Maputo in 2013 for a property project. The idea came to him in a café in the capital, watching customers smoke: Africa grows tobacco and rolls none of it.

The first cigar came out in December 2016. Moukheiber brought in a Dominican master cigar maker, formerly at General Cigar on Macanudo, to train Mozambican rollers; the first class graduated in 2017 and a second is in training. The workshop, in Maputo''s Baixa district, turns out some ten thousand cigars a month, and a new factory is being built in a free zone.

The tobacco is grown in Mozambique by contract farmers, from Dominican seed. The wrapper comes from Cameroon — which this atlas holds as a wrapper-growing country — and the cigars age in cedarwood sheets from Ghana. The house sells in Mozambique, South Africa, Kenya, Nigeria, Congo and Côte d''Ivoire, whose addresses this atlas holds.

Bongani is often called the first "fully African" cigar. Its founder does not say so: he claims a selection driven by quality, from Africa and elsewhere, and the filler mixes African and non-African tobaccos. The name itself means "be grateful" in Zulu.',

  'Kamal Moukheiber, libanés de nacimiento y licenciado por HEC París, pasó quince años en la banca de inversión en Londres —Credit Suisse, Lehman Brothers— antes de instalarse en Maputo en 2013 por un proyecto inmobiliario. La idea le llega en un café de la capital, viendo fumar a los clientes: África cultiva tabaco y no lo lía.

El primer puro sale en diciembre de 2016. Moukheiber trae a un maestro tabaquero dominicano, pasado por General Cigar con Macanudo, para formar a liadoras mozambiqueñas; la primera promoción se gradúa en 2017 y una segunda está en formación. El taller, en el barrio de la Baixa de Maputo, saca unos diez mil puros al mes, y una nueva fábrica se construye en zona franca.

El tabaco se cultiva en Mozambique por campesinos bajo contrato, a partir de semillas dominicanas. La capa viene de Camerún —que este atlas recoge como país productor de capa— y los puros envejecen en láminas de cedro de Ghana. La casa se vende en Mozambique, Sudáfrica, Kenia, Nigeria, Congo y Costa de Marfil, cuyas direcciones figuran en este atlas.

A menudo se lee que Bongani es el primer puro «enteramente africano». Su fundador no lo dice: reivindica una selección guiada por la calidad, de África y de fuera, y la tripa mezcla tabacos africanos y no africanos. El nombre significa «sé agradecido» en zulú.',

  'Kamal Moukheiber, gebürtiger Libanese und Absolvent der HEC Paris, verbrachte fünfzehn Jahre im Investmentbanking in London — Credit Suisse, Lehman Brothers — bevor er sich 2013 für ein Immobilienprojekt in Maputo niederließ. Die Idee kam ihm in einem Café der Hauptstadt, beim Anblick rauchender Gäste: Afrika baut Tabak an und rollt keinen.

Die erste Zigarre entstand im Dezember 2016. Moukheiber holte einen dominikanischen Maestro, zuvor bei General Cigar für Macanudo, um mosambikanische Rollerinnen auszubilden; der erste Jahrgang schloss 2017 ab, ein zweiter ist in Ausbildung. Die Werkstatt im Viertel Baixa in Maputo bringt rund zehntausend Zigarren im Monat hervor, und eine neue Fabrik entsteht in einer Freihandelszone.

Der Tabak wird in Mosambik von Vertragsbauern angebaut, aus dominikanischem Saatgut. Das Deckblatt kommt aus Kamerun — das dieser Atlas als Deckblattland führt — und die Zigarren reifen in Zedernholzblättern aus Ghana. Verkauft wird in Mosambik, Südafrika, Kenia, Nigeria, Kongo und Côte d''Ivoire, deren Adressen dieser Atlas führt.

Bongani gilt vielerorts als die erste „vollständig afrikanische" Zigarre. Ihr Gründer sagt das nicht: Er beansprucht eine von Qualität geleitete Auswahl, aus Afrika wie von anderswo, und die Einlage mischt afrikanische und nicht-afrikanische Tabake. Der Name bedeutet auf Zulu „sei dankbar".',

  '卡马尔·穆凯贝尔生于黎巴嫩，毕业于巴黎高等商学院，曾在伦敦从事投资银行业十五年——瑞士信贷、雷曼兄弟——后于 2013 年因一项房地产项目定居马普托。灵感来自首都一家咖啡馆：他看着客人抽雪茄，心想非洲种烟草，却不卷雪茄。

第一支雪茄于 2016 年 12 月问世。穆凯贝尔请来一位曾在 General Cigar 负责 Macanudo 的多米尼加雪茄大师，培训莫桑比克女卷制师；首批学员 2017 年结业，第二批正在培训中。位于马普托拜沙区的工坊月产约一万支，另一座新厂正在自由贸易区兴建。

烟叶由契约农户在莫桑比克以多米尼加种子种植。茄衣来自喀麦隆——本图集将其列为茄衣产地——雪茄则在加纳产的雪松木片中陈化。产品销往莫桑比克、南非、肯尼亚、尼日利亚、刚果与科特迪瓦，后者的地址本图集亦有收录。

人们常说 Bongani 是第一支「完全非洲」的雪茄。其创办人并未如此宣称：他主张以品质为准的选料，无论来自非洲或他处，茄芯亦兼用非洲与非非洲烟叶。至于品牌名，在祖鲁语中意为「心怀感恩」。',

  'كمال مخيبر، لبناني المولد وخرّيج مدرسة HEC باريس، أمضى خمسة عشر عامًا في الصيرفة الاستثمارية بلندن — كريدي سويس وليمان براذرز — قبل أن يستقرّ في مابوتو عام 2013 من أجل مشروع عقاري. وجاءته الفكرة في مقهى بالعاصمة، وهو يرى الزبائن يدخّنون: أفريقيا تزرع التبغ ولا تلفّه.

خرج أول سيجار في ديسمبر 2016. واستقدم مخيبر معلّم سيجار دومينيكيًّا، عمل سابقًا لدى General Cigar على ماكانودو، ليدرّب لافّات موزمبيقيات؛ تخرّجت الدفعة الأولى عام 2017، وثانية قيد التدريب. وتُنتج الورشة في حي بايشا بمابوتو نحو عشرة آلاف سيجار شهريًا، فيما يُبنى مصنع جديد في منطقة حرة.

يُزرع التبغ في موزمبيق على يد مزارعين بعقود، من بذور دومينيكية. ويأتي الغلاف من الكاميرون — التي يضمّها هذا الأطلس بوصفها بلد غلاف — وتُعتَّق السيجار في صفائح خشب الأرز من غانا. وتُباع الدار في موزمبيق وجنوب أفريقيا وكينيا ونيجيريا والكونغو وساحل العاج، التي يضمّ هذا الأطلس عناوينها.

كثيرًا ما يُقال إنّ بونغاني أول سيجار «أفريقي بالكامل». غير أنّ مؤسّسها لا يقول ذلك: فهو يعلن انتقاءً تقوده الجودة، من أفريقيا ومن غيرها، والحشوة تمزج تبغًا أفريقيًّا وغير أفريقي. أمّا الاسم فيعني «كن شاكرًا» بلغة الزولو.',

  '[{"name":"Robusto","color":"#4E7C4A","wrapper":"Cameroon","story":"Five inches on a 50 ring."},{"name":"458 Toro","color":"#3E6B3C","wrapper":"Cameroon","story":"Six inches on a 58 ring."},{"name":"Gordo","color":"#5C8C52","wrapper":"Cameroon","story":"Four inches on a 58 ring: short and thick."}]',
  '[{"name":"Robusto","color":"#4E7C4A","wrapper":"Camerún","story":"Cinco pulgadas con cepo 50."},{"name":"458 Toro","color":"#3E6B3C","wrapper":"Camerún","story":"Seis pulgadas con cepo 58."},{"name":"Gordo","color":"#5C8C52","wrapper":"Camerún","story":"Cuatro pulgadas con cepo 58: corto y grueso."}]',
  '[{"name":"Robusto","color":"#4E7C4A","wrapper":"Kamerun","story":"Fünf Zoll bei Ringmaß 50."},{"name":"458 Toro","color":"#3E6B3C","wrapper":"Kamerun","story":"Sechs Zoll bei Ringmaß 58."},{"name":"Gordo","color":"#5C8C52","wrapper":"Kamerun","story":"Vier Zoll bei Ringmaß 58: kurz und dick."}]',
  '[{"name":"Robusto","color":"#4E7C4A","wrapper":"喀麦隆","story":"长五英寸，环径 50。"},{"name":"458 Toro","color":"#3E6B3C","wrapper":"喀麦隆","story":"长六英寸，环径 58。"},{"name":"Gordo","color":"#5C8C52","wrapper":"喀麦隆","story":"长四英寸，环径 58：短而粗。"}]',
  '[{"name":"Robusto","color":"#4E7C4A","wrapper":"الكاميرون","story":"خمس بوصات بمقاس حلقة 50."},{"name":"458 Toro","color":"#3E6B3C","wrapper":"الكاميرون","story":"ست بوصات بمقاس حلقة 58."},{"name":"Gordo","color":"#5C8C52","wrapper":"الكاميرون","story":"أربع بوصات بمقاس حلقة 58: قصير وغليظ."}]'
);

-- ── Les sceaux, calculés depuis les colonnes ─────────────
INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'producer_countries', 'mozambique', c.champ, l.lang,
       SHA1(CASE c.champ WHEN 'region'     THEN p.`region`
                         WHEN 'production' THEN p.`production`
                         WHEN 'rev_detail' THEN p.`rev_detail`
                         ELSE p.`notes` END),
       'machine', NOW()
  FROM `producer_countries` p
  JOIN (SELECT 'region' champ UNION ALL SELECT 'production'
        UNION ALL SELECT 'rev_detail' UNION ALL SELECT 'notes') c
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE p.`id` = 'mozambique';

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'producer_geo', 'mozambique', c.champ, l.lang,
       SHA1(CASE c.champ WHEN 'currency' THEN g.`currency` ELSE g.`language` END),
       'machine', NOW()
  FROM `producer_geo` g
  JOIN (SELECT 'currency' champ UNION ALL SELECT 'language') c
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE g.`country_id` = 'mozambique';

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'brands', 'Bongani', c.champ, l.lang,
       SHA1(CASE c.champ WHEN 'history' THEN b.`history` ELSE b.`gamme` END),
       'machine', NOW()
  FROM `brands` b
  JOIN (SELECT 'history' champ UNION ALL SELECT 'gamme') c
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE b.`name` = 'Bongani';

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 174','systeme','pays_ouvert','pays',0,
   'le Mozambique n etait dans l atlas NI comme producteur NI comme pays d adresses. Il entre par une seule maison, Bongani : second pays africain ouvert en trois mois apres la Cote d Ivoire, et premier d Afrique australe — neuvieme macro-region de l atlas'),
  (NULL,'migration 174','systeme','etiquette_non_reprise','marque',0,
   'ON LIT PARTOUT — WIKIPEDIA LE PREMIER — que Bongani est « la premiere marque de cigares ENTIEREMENT africaine ». LE FONDATEUR NE DIT PAS CELA : il revendique une selection guidee par la qualite, d Afrique comme d ailleurs, et la tripe mele des tabacs africains et non africains, dominicains compris. « Premier cigare africain » se defend ; « entierement africain » est une formule de reprise de presse, et l atlas ne la reprend pas'),
  (NULL,'migration 174','systeme','trous_declares','pays',0,
   'regions, varieties, climate, soil, harvest et revenue restent VIDES. Une couverture de presse attribue le tabac a la province de MANICA, mais c est une source unique et indirecte, et la fiche Wikipedia de la province ne mentionne AUCUNE culture de tabac. Pour la Cote d Ivoire, deux caves decrivaient l assemblage par terroir et une revue de geographie decrivait la region : ici rien de tel. Ni zone de culture, ni coordonnees, ni feuille'),
  (NULL,'migration 174','systeme','lecon_168_appliquee','pays',0,
   'le drapeau mozambicain est ecrit en HEXADECIMAL et reconverti cote serveur : CONVERT(UNHEX(F09F87B2F09F87BF) USING utf8mb4). Un emoji de drapeau tient sur QUATRE octets, et un mysql < sans --default-character-set=utf8mb4 le remplace par des « ? » — c est ce qui etait arrive au drapeau ivoirien, puis retrouve sur Macao. Rien dans ce fichier qu un jeu de caracteres puisse abimer'),
  (NULL,'migration 174','systeme','renvois_internes','marque',0,
   'la fiche renvoie a DEUX pays deja dans l atlas : le CAMEROUN, dont vient la cape et que l atlas porte comme producteur de cape exclusif, et la COTE D IVOIRE, l un des marches de la maison, ouverte trois migrations plus tot. Le vieillissement se fait en feuilles de cedre du GHANA, pays d adresses de l atlas');
