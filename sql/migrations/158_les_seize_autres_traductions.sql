-- ════════════════════════════════════════════════════════
-- 158 — Les seize autres, et la sonde qui les a trouvées
-- ────────────────────────────────────────────────────────
-- La migration 157 corrigeait cinq fiches, trouvées à l'œil dans le
-- dump. Une mesure faite APRÈS coup en a trouvé seize de plus : la
-- première sonde cherchait des motifs précis — « Openede »,
-- « Eröffnund » — au lieu de chercher la propriété qui compte.
--
-- LA BONNE SONDE. Dans une colonne ALLEMANDE, les mots-outils français
-- sont sans ambiguïté : « du », « aux », « à », « sur », « chez »,
-- « avec », « pour », « dans », « où ». Trois d'entre eux dans le même
-- texte, et la colonne n'a pas été traduite.
--
-- ⚠ La première version de cette sonde comptait aussi « des », que
-- l'allemand possède au génitif. Elle accusait #182 et #232, qui sont
-- du bon allemand. Un mot partagé par deux langues ne prouve rien.
--
-- ── LA SIGNATURE : « oficialle », « offiziellle » ────────
-- Huit fiches portent le même artefact. Le traducteur automatique a
-- pris « officielle » et lui a collé un suffixe étranger sans retirer
-- le français : « oficialle », « offiziellle » avec trois L. Le reste
-- de la phrase n'a pas bougé d'un mot.
--
--   #50  es : « La Casa del Habano oficialle de Chester chez Turmeaus,
--             célèbre tobacconist britannique. »
--
-- Tout, sauf trois mots, est resté français — y compris « chez », qui
-- n'existe dans aucune des deux langues cibles.
--
-- ── CE QUE ÇA DONNE AU LECTEUR ───────────────────────────
-- Un hispanophone qui ouvre la fiche de Montréal lit une phrase
-- française avec deux mots espagnols dedans. Il ne comprend pas qu'il
-- s'agit d'un défaut : il croit que le site est mal fait, ou que la
-- fiche n'existe pas dans sa langue. Le compteur, lui, annonçait 6 920
-- traductions.
--
-- ── LE STATUT RESTE « MACHINE » ──────────────────────────
-- Comme à la 157 : ces textes sont écrits, pas relus. Le compteur de
-- relecture humaine continue d'annoncer zéro, parce que c'est vrai.
--
-- Après cette migration :
--   php tools/contenu_dump.php
--   php tools/i18n_dump.php > sql/traductions.sql
-- ════════════════════════════════════════════════════════

-- ── #50 Chester ──────────────────────────────────────────
UPDATE `lounges` SET
  `description_es` = 'La Casa del Habano oficial de Chester, en Turmeaus, la célebre tabaquería británica.',
  `description_de` = 'Die offizielle La Casa del Habano von Chester, bei Turmeaus, dem bekannten britischen Tabakhaus.',
  `description_zh` = '切斯特的官方 La Casa del Habano，设于英国知名烟草行 Turmeaus 之内。',
  `description_ar` = '«لا كاسا ديل هابانو» الرسمية في تشيستر، داخل متجر التبغ البريطاني الشهير Turmeaus.',
  `updated_at` = NOW() WHERE `id` = 50;

-- ── #116 Tokyo ───────────────────────────────────────────
UPDATE `lounges` SET
  `description_es` = 'La Casa del Habano oficial de Tokio. Yutaka Kobayashi, Master Trainer de la Habanos Academia.',
  `description_de` = 'Die offizielle La Casa del Habano von Tokio. Yutaka Kobayashi, Master Trainer der Habanos Academia.',
  `description_zh` = '东京的官方 La Casa del Habano。店主小林裕高为哈伯纳斯学院认证的 Master Trainer。',
  `description_ar` = '«لا كاسا ديل هابانو» الرسمية في طوكيو. يوتاكا كوباياشي، مدرّب معتمد لدى أكاديمية هابانوس.',
  `updated_at` = NOW() WHERE `id` = 116;

-- ── #138 Phnom Penh ──────────────────────────────────────
UPDATE `lounges` SET
  `description_es` = 'La Casa del Habano oficial de Phnom Penh, en el Sisowath Quay, a orillas del Mekong.',
  `description_de` = 'Die offizielle La Casa del Habano von Phnom Penh, am Sisowath Quay direkt am Mekong.',
  `description_zh` = '金边的官方 La Casa del Habano，位于湄公河畔的西索瓦大道。',
  `description_ar` = '«لا كاسا ديل هابانو» الرسمية في بنوم بنه، على كورنيش سيسواث بمحاذاة نهر ميكونغ.',
  `updated_at` = NOW() WHERE `id` = 138;

-- ── #153 Montréal ────────────────────────────────────────
UPDATE `lounges` SET
  `description_es` = 'La Casa del Habano oficial de Montreal. Acceso legal a los habanos cubanos, a diferencia de Estados Unidos.',
  `description_de` = 'Die offizielle La Casa del Habano von Montreal. Legaler Zugang zu kubanischen Habanos, anders als in den USA.',
  `description_zh` = '蒙特利尔的官方 La Casa del Habano。可合法购买古巴哈伯纳斯，这在美国并不允许。',
  `description_ar` = '«لا كاسا ديل هابانو» الرسمية في مونتريال. شراء السيجار الكوبي متاح قانونًا هنا، بخلاف الولايات المتحدة.',
  `updated_at` = NOW() WHERE `id` = 153;

-- ── #156 Buenos Aires ────────────────────────────────────
UPDATE `lounges` SET
  `description_es` = 'La Casa del Habano oficial de Buenos Aires, en Palermo. Distribuida por Puro Tabaco S.A.',
  `description_de` = 'Die offizielle La Casa del Habano von Buenos Aires, im Viertel Palermo. Beliefert von Puro Tabaco S.A.',
  `description_zh` = '布宜诺斯艾利斯的官方 La Casa del Habano，位于巴勒莫区。由 Puro Tabaco S.A. 供货。',
  `description_ar` = '«لا كاسا ديل هابانو» الرسمية في بوينس آيرس، بحي باليرمو. يزوّدها Puro Tabaco S.A.',
  `updated_at` = NOW() WHERE `id` = 156;

-- ── #164 San José ────────────────────────────────────────
UPDATE `lounges` SET
  `description_es` = 'La Casa del Habano oficial de San José de Costa Rica. Nuevas instalaciones inauguradas en marzo de 2022, más de 450 m².',
  `description_de` = 'Die offizielle La Casa del Habano von San José in Costa Rica. Neue Räume, eröffnet im März 2022, über 450 m².',
  `description_zh` = '哥斯达黎加圣何塞的官方 La Casa del Habano。新址于 2022 年 3 月启用，面积逾四百五十平方米。',
  `description_ar` = '«لا كاسا ديل هابانو» الرسمية في سان خوسيه بكوستاريكا. مقرّ جديد افتُتح في آذار/مارس 2022 على مساحة تتجاوز 450 م².',
  `updated_at` = NOW() WHERE `id` = 164;

-- ── #179 Estelí ──────────────────────────────────────────
UPDATE `lounges` SET
  `description_es` = 'Boutique oficial en la propia fábrica Padrón. Acceso directo a las ediciones limitadas.',
  `description_de` = 'Offizielle Boutique direkt an der Produktionsstätte von Padrón. Direkter Zugang zu den limitierten Editionen.',
  `description_zh` = '帕德龙自有工厂内的官方门店，可直接购得限量版产品。',
  `description_ar` = 'متجر رسمي داخل مصنع بادرون نفسه، مع وصول مباشر إلى الإصدارات المحدودة.',
  `updated_at` = NOW() WHERE `id` = 179;

-- ── #198 Sydney ──────────────────────────────────────────
UPDATE `lounges` SET
  `description_es` = 'La boutique Davidoff oficial de Sídney, en el CBD. Gama Davidoff completa, humidor accesible y salón de puros premium: la dirección Davidoff de referencia en Australia.',
  `description_de` = 'Die offizielle Davidoff-Boutique von Sydney, im CBD. Vollständiges Davidoff-Sortiment, begehbarer Humidor und Premium-Zigarrenlounge — die Davidoff-Adresse Australiens.',
  `description_zh` = '悉尼中央商务区的官方大卫杜夫专门店。大卫杜夫全系列产品、步入式恒湿雪茄柜与高级雪茄休息厅，是该品牌在澳大利亚的旗舰地址。',
  `description_ar` = 'متجر دافيدوف الرسمي في سيدني، بحي الأعمال المركزي. تشكيلة دافيدوف الكاملة، ومستودع ترطيب يمكن دخوله، وصالة سيجار فاخرة — عنوان دافيدوف المرجعي في أستراليا.',
  `updated_at` = NOW() WHERE `id` = 198;

-- ── #250 Barcelone ───────────────────────────────────────
UPDATE `lounges` SET
  `description_zh` = '位于格拉西亚大道的 La Casa del Habano，可望见街上的现代主义建筑，客源来自世界各地。',
  `description_ar` = '«لا كاسا ديل هابانو» في جادة غراسيا، بإطلالة على البيوت الحداثية وزبائن من مختلف البلدان.',
  `updated_at` = NOW() WHERE `id` = 250;

-- ── #646 Jérusalem ───────────────────────────────────────
UPDATE `lounges` SET
  `description_zh` = '玛米拉精品酒店的雪茄休息厅，可眺望老城城墙。',
  `description_ar` = 'صالة سيجار في فندق ماميلا البوتيكي، بإطلالة على أسوار المدينة القديمة.',
  `updated_at` = NOW() WHERE `id` = 646;

-- ── #837 Dar es Salaam ───────────────────────────────────
UPDATE `lounges` SET
  `description_en` = 'Cigar lounge at the Serena Hotel, the grand hotel of Tanzania''s commercial capital.',
  `description_zh` = '塞雷纳酒店的雪茄休息厅，该酒店是坦桑尼亚经济首都的老牌豪华饭店。',
  `description_ar` = 'صالة سيجار في فندق سيرينا، الفندق الفخم في العاصمة الاقتصادية لتنزانيا.',
  `updated_at` = NOW() WHERE `id` = 837;

-- ── #938 Dubrovnik ───────────────────────────────────────
UPDATE `lounges` SET
  `description_zh` = '埃克塞尔西奥豪华酒店的雪茄休息厅，可全景眺望杜布罗夫尼克城墙。',
  `description_ar` = 'صالة سيجار في فندق إكسلسيور الفخم، بإطلالة بانورامية على أسوار دوبروفنيك.',
  `updated_at` = NOW() WHERE `id` = 938;

-- ── #951 Téhéran ─────────────────────────────────────────
UPDATE `lounges` SET
  `description_en` = 'Cigar bar at the Parsian Azadi, a historic grand hotel in Tehran near the Azadi stadium.',
  `description_es` = 'Bar de puros del Parsian Azadi, gran hotel histórico de Teherán, cerca del estadio Azadi.',
  `description_de` = 'Zigarrenbar im Parsian Azadi, einem historischen Grandhotel in Teheran nahe dem Azadi-Stadion.',
  `description_zh` = '帕西安阿扎迪酒店的雪茄吧。该酒店是德黑兰的历史名店，邻近阿扎迪体育场。',
  `description_ar` = 'بار السيجار في فندق بارسيان آزادي، أحد الفنادق التاريخية الكبرى في طهران قرب ملعب آزادي.',
  `updated_at` = NOW() WHERE `id` = 951;

-- ── #1113 Guatemala City ─────────────────────────────────
UPDATE `lounges` SET
  `description_en` = 'Cigar bar at the Westin Camino Real, the historic grand hotel of Zone 10 in Guatemala City.',
  `description_es` = 'Bar de puros del Westin Camino Real, el gran hotel histórico de la Zona 10 de Ciudad de Guatemala.',
  `description_de` = 'Zigarrenbar im Westin Camino Real, dem historischen Grandhotel der Zona 10 von Guatemala-Stadt.',
  `description_zh` = '威斯汀卡米诺雷亚尔酒店的雪茄吧，位于危地马拉城十区，是当地的历史名店。',
  `description_ar` = 'بار السيجار في فندق ويستن كامينو ريال، الفندق التاريخي الكبير في المنطقة العاشرة بمدينة غواتيمالا.',
  `updated_at` = NOW() WHERE `id` = 1113;

-- ── #1130 Saint-Martin ───────────────────────────────────
UPDATE `lounges` SET
  `description_zh` = '大凯斯海滩俱乐部的雪茄露台，面朝圣马丁岛的加勒比海。',
  `description_ar` = 'شرفة سيجار في نادي غران كاس الشاطئي، تطلّ على البحر الكاريبي في سان مارتن.',
  `updated_at` = NOW() WHERE `id` = 1130;

-- ── #1151 Yaoundé ────────────────────────────────────────
UPDATE `lounges` SET
  `description_en` = 'Cigar bar at the Hilton Yaoundé, the grand hotel of Cameroon''s diplomatic capital.',
  `description_es` = 'Bar de puros del Hilton Yaoundé, el gran hotel de la capital diplomática de Camerún.',
  `description_de` = 'Zigarrenbar im Hilton Yaoundé, dem Grandhotel der diplomatischen Hauptstadt Kameruns.',
  `description_zh` = '雅温得希尔顿酒店的雪茄吧，该酒店是喀麦隆外交首都的老牌豪华饭店。',
  `description_ar` = 'بار السيجار في فندق هيلتون ياوندي، الفندق الفخم في العاصمة الدبلوماسية للكاميرون.',
  `updated_at` = NOW() WHERE `id` = 1151;

-- ── Les sceaux ───────────────────────────────────────────
UPDATE `translation_status` t
  JOIN `lounges` l ON l.`id` = t.`entite_id`
   SET t.`source_hash` = SHA1(l.`description`), t.`statut` = 'machine', t.`maj` = NOW()
 WHERE t.`entite` = 'lounges' AND t.`champ` = 'description'
   AND t.`entite_id` IN ('50','116','138','153','156','164','179','198','250','646',
                         '837','938','951','1113','1130','1151');

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 158','systeme','traductions_refaites','lounge',0,
   '16 fiches de plus, trouvees par une sonde mesurant la PROPRIETE (des mots-outils francais dans une colonne allemande) au lieu de motifs precis. La 157 en avait vu cinq a l oeil dans le dump'),
  (NULL,'migration 158','systeme','sonde_corrigee','lounge',0,
   'la premiere version de la sonde comptait « des », que l allemand possede au genitif : elle accusait #182 et #232, qui sont du bon allemand. Un mot partage par deux langues ne prouve rien'),
  (NULL,'migration 158','systeme','signature','lounge',0,
   'huit fiches portaient « oficialle » et « offiziellle » (trois L) : le traducteur collait un suffixe etranger a « officielle » sans toucher au reste de la phrase — y compris « chez », qui n existe ni en espagnol ni en allemand');
