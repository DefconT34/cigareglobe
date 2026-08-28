-- ══════════════════════════════════════════════════════════
-- 125 — Des mots pleins restés en anglais dans quatre langues
-- ──────────────────────────────────────────────────────────
-- ── CE QUE `tools/i18n_lexique_degustation.php` A TROUVÉ ───
--
-- 19 valeurs es/de/zh/ar portent du vocabulaire anglais au milieu d'un
-- texte par ailleurs correct. Elles se ramènent à CINQ textes sources.
--
-- Aucun contrôle existant ne pouvait les voir. `i18n_fraicheur` compte
-- les cases pleines : elles le sont. `i18n_langue_check` cherche des
-- MOTS-OUTILS anglais (the, and, with…) parce qu'ils trahissent une
-- phrase anglaise entière : ici les phrases sont espagnoles, allemandes,
-- chinoises. Et le détecteur réversible de la 095 cherche un mot ABÎMÉ :
-- ceux-ci sont intacts, simplement pas traduits.
--
-- ── LES QUATRE ACCORDS ─────────────────────────────────────
--
-- Le défaut porte sur le `name` de l'accord, pas sur ses `notes` — qui
-- sont, elles, correctement traduites partout. Le nom était resté en
-- anglais dans les quatre langues à la fois :
--
--   « Ethiopian natural process coffee »  ← fr : Café éthiopien natural process
--   « Brazilian coado coffee »            ← fr : Café brasileiro coado
--   « Light roast drip coffee »           ← fr : Café américain filtre
--
-- Cohiba en portait deux. Son nom disait « 12 YEARS » là où le français
-- dit « 12 ans » — un mot qu'aucun lexique de dégustation ne contient,
-- trouvé en relisant les extraits. Et ses notes gardaient deux
-- fragments anglais au milieu d'une phrase traduite : « comparten el
-- mismo CUBAN SOIL. Notas de CANE AND TOBACCO IN RESONANCE. »
--
-- L'arabe disait par ailleurs « المقارنة الطبيعية » — « la comparaison
-- naturelle » — là où il s'agit d'un ACCORD. Corrigé dans la foulée.
--
-- ── MONTECRISTO : LE MÊME DÉFAUT, À TROIS ADRESSES SUR QUATRE
--
-- « Notes de pain grillé, noix de cajou, poivre blanc » était devenu
-- « toast, cashew, white Pfeffer » en allemand, « toast, cashew, white
-- 胡椒 » en chinois, « toast, cashew, white فلفل » en arabe.
--
-- C'est LA PHRASE que la migration 123 a corrigée. Elle ne l'a corrigée
-- QU'EN ESPAGNOL. Onzième fois de ce chantier qu'un défaut est réparé à
-- une adresse et laissé aux autres.
--
-- ── ET UN RANG MONDIAL QUE PERSONNE NE COMPTAIT ────────────
--
-- La même fiche affirme, en allemand, en chinois et en arabe : « die
-- meistverkaufte Zigarre der WELT », « 全球销量最高的雪茄 », « أكثر
-- السيجار مبيعًا في العالم ». Le français ne dit rien de tel : il dit
-- « la vitole qui a défini le cigare de tous les jours ».
--
-- Le cliquet des rangs (`marques_rangs_baseline.json`) ne les contient
-- pas : ses motifs reconnaissent « más vendido del mundo » mais pas la
-- tournure allemande ni les caractères chinois. Le rang retiré en
-- français et en espagnol à la migration 108 vivait donc encore, dans
-- trois langues, sous des formes que le contrôle ne cherchait pas.
--
-- ── ET UNE OMISSION, DANS LES CINQ LANGUES ─────────────────
--
-- Le français porte une troisième phrase — « C'est le Montecristo par
-- excellence — celui que l'on offre, que l'on partage… » — qu'AUCUNE
-- traduction ne rend, anglais compris. Les cinq colonnes sont donc
-- retraduites en entier depuis le français, seule source. L'anglais y
-- perd au passage un « the daily benchmark of the range » que le
-- français ne dit pas davantage.
--
-- ── LE FRANÇAIS N'ÉTAIT PAS INDEMNE ────────────────────────
--
-- Le lexique, mesuré sur le français comme témoin, devait être muet. Il
-- a signalé une valeur, et c'était un vrai défaut : la fiche Partagás
-- USA disait « ont développé leur PALATE sur la version dominicaine ».
-- Un mot anglais dans la colonne SOURCE, celle dont dérivent les cinq
-- autres. Les cinq traductions, elles, disaient juste — paladar,
-- Gaumen, palates. Le défaut n'existait qu'à l'origine.
-- ══════════════════════════════════════════════════════════

-- ── Bolívar, accord [1] : le nom du café ───────────────────
UPDATE `brands` SET
  `pairings_es` = JSON_SET(`pairings_es`, '$[1].name', 'Café etíope natural process'),
  `pairings_de` = JSON_SET(`pairings_de`, '$[1].name', 'Äthiopischer Kaffee, natural process'),
  `pairings_zh` = JSON_SET(`pairings_zh`, '$[1].name', '埃塞俄比亚日晒处理咖啡'),
  `pairings_ar` = JSON_SET(`pairings_ar`, '$[1].name', 'قهوة إثيوبية بالمعالجة الطبيعية')
WHERE `name` = 'Bolivar';

-- ── Dannemann, accord [1] ──────────────────────────────────
-- « coado » est portugais et le français le garde tel quel : ce qui
-- devait partir, c'est l'enveloppe anglaise autour du mot.
UPDATE `brands` SET
  `pairings_es` = JSON_SET(`pairings_es`, '$[1].name', 'Café brasileiro coado'),
  `pairings_de` = JSON_SET(`pairings_de`, '$[1].name', 'Café brasileiro coado'),
  `pairings_zh` = JSON_SET(`pairings_zh`, '$[1].name', '巴西滤泡咖啡（coado）'),
  `pairings_ar` = JSON_SET(`pairings_ar`, '$[1].name', 'قهوة برازيلية مُرشَّحة (coado)')
WHERE `name` = 'Dannemann';

-- ── Macanudo, accord [1] ───────────────────────────────────
UPDATE `brands` SET
  `pairings_es` = JSON_SET(`pairings_es`, '$[1].name', 'Café de filtro americano'),
  `pairings_de` = JSON_SET(`pairings_de`, '$[1].name', 'Amerikanischer Filterkaffee'),
  `pairings_zh` = JSON_SET(`pairings_zh`, '$[1].name', '美式滤泡咖啡'),
  `pairings_ar` = JSON_SET(`pairings_ar`, '$[1].name', 'قهوة أمريكية مُرشَّحة')
WHERE `name` = 'Macanudo';

-- ── Cohiba, accord [1] : le nom ET les notes ───────────────
UPDATE `brands` SET
  `pairings_es` = JSON_SET(`pairings_es`,
      '$[1].name',  'Ron Santiago de Cuba 12 años',
      '$[1].notes', 'El maridaje natural — ambos productos comparten las mismas tierras cubanas. Notas de caña y de tabaco en resonancia.'),
  `pairings_de` = JSON_SET(`pairings_de`,
      '$[1].name',  'Ron Santiago de Cuba 12 Jahre',
      '$[1].notes', 'Die natürliche Paarung — beide Produkte teilen dieselben kubanischen Böden. Noten von Zuckerrohr und Tabak im Einklang.'),
  `pairings_zh` = JSON_SET(`pairings_zh`,
      '$[1].name',  'Ron Santiago de Cuba 12 年',
      '$[1].notes', '天然的搭配——两种产品共享同一片古巴土地。风味：甘蔗与烟草的共鸣。'),
  `pairings_ar` = JSON_SET(`pairings_ar`,
      '$[1].name',  'رون سانتياغو دي كوبا 12 سنة',
      '$[1].notes', 'المرافقة الطبيعية — كلا المنتجين يشتركان في الأرض الكوبية نفسها. نكهات القصب والتبغ في تناغم.')
WHERE `name` = 'Cohiba';

-- ── Montecristo, gamme [1] : les cinq langues, depuis le français
UPDATE `brands` SET
  `gamme_en` = JSON_SET(`gamme_en`, '$[1].story', 'Petit Corona (42 x 129mm), the vitola that defined the everyday cigar. Accessible, balanced, perfect for novice and expert alike. This is the Montecristo par excellence — the one you give, the one you share, the one you find in humidors everywhere. Notes of toast, cashew, white pepper.'),
  `gamme_es` = JSON_SET(`gamme_es`, '$[1].story', 'Petit Corona (42 x 129mm), la vitola que definió el puro de todos los días. Accesible, equilibrado, perfecto tanto para principiantes como para expertos. Es el Montecristo por excelencia: el que se regala, el que se comparte, el que aparece en todas las cavas. Notas de pan tostado, anacardo y pimienta blanca.'),
  `gamme_de` = JSON_SET(`gamme_de`, '$[1].story', 'Petit Corona (42 x 129mm), das Format, das die Zigarre für jeden Tag definiert hat. Zugänglich, ausgewogen, perfekt für Anfänger und Experten gleichermaßen. Das ist der Montecristo schlechthin — die Zigarre, die man verschenkt, die man teilt, die in jedem Humidor zu finden ist. Noten von geröstetem Brot, Cashew und weißem Pfeffer.'),
  `gamme_zh` = JSON_SET(`gamme_zh`, '$[1].story', 'Petit Corona（42 x 129 毫米），定义了日常雪茄的尺寸。易入门、平衡，新手与行家都合适。这正是最典型的蒙特克里斯托——用来馈赠，用来分享，在各地的雪茄柜里都能见到。风味：烤面包、腰果、白胡椒。'),
  `gamme_ar` = JSON_SET(`gamme_ar`, '$[1].story', 'بيتي كورونا (42 × 129 مم)، القياس الذي عرّف سيجار كل يوم. سهل الوصول، متوازن، مثالي للمبتدئ والخبير على حدٍّ سواء. إنه المونتيكريستو بامتياز — السيجار الذي يُهدى ويُشارَك، ويوجد في خزائن السيجار أينما كانت. نكهات: خبز محمّص، كاجو، فلفل أبيض.')
WHERE `name` = 'Montecristo';

-- ── Partagás USA : le mot anglais dans la colonne française ─
UPDATE `brands`
   SET `history` = REPLACE(`history`, 'développé leur palate sur', 'développé leur palais sur')
 WHERE `name` = 'Partagás USA';

-- ── ET SA CONSÉQUENCE, QU'IL FAUT ASSUMER ICI ──────────────
--
-- Toucher au FRANÇAIS périme mécaniquement ses cinq traductions :
-- `translation_status` retient l'empreinte du français dont chacune
-- dérive, et cette empreinte vient de changer. La suite de tests l'a
-- signalé au premier passage — le scellement fait son travail.
--
-- Ici, les cinq traductions restent pourtant justes : le français
-- disait « palate » là où il fallait « palais », et AUCUNE d'elles ne
-- reprenait l'anglicisme — paladar, Gaumen, 味覚, حنك. L'anglais dit
-- « their palates », ce qui est son mot. Le sens n'a pas bougé d'un
-- pouce : seule la faute française a disparu.
--
-- On re-scelle donc ces cinq lignes, et ELLES SEULES. Sceller la langue
-- entière (`i18n_fraicheur --sceller es`) déclarerait à jour les 175
-- traductions réellement en attente : le mensonge exact que la
-- migration 095 a mis au jour.
UPDATE `translation_status` ts
  JOIN `brands` b ON b.`name` = ts.`entite_id`
   SET ts.`source_hash` = SHA1(TRIM(b.`history`))
 WHERE ts.`entite`    = 'brands'
   AND ts.`entite_id` = 'Partagás USA'
   AND ts.`champ`     = 'history';
