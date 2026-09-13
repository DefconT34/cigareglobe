-- ════════════════════════════════════════════════════════
-- 221 — Lot 10 du quatrieme recensement : l'Europe roule aussi
-- ────────────────────────────────────────────────────────
-- TROIS PAYS DE ROULAGE ENTRENT — Allemagne, Pays-Bas, Russie — et
-- NEUF MAISONS. Aucun de ces pays ne cultive pour le cigare ; tous
-- roulent a la main, et personne ne l'ecrivait en anglais.
--   ALLEMAGNE   Zigarren Manufaktur Dresden (2015, un torcedor cubain),
--               La Galana (Cologne, 2005), Wolf & Ruhland (1909)
--   PAYS-BAS    Van der Donk (Culemborg, 1919) — « la derniere du pays »
--   ITALIE      Compagnia Toscana Sigari (2015), MOSI (2013, STG 2021)
--   RUSSIE      Siglo de Oro (Moscou, 2011), Pogar (1915)
--   DOMINICAINE Total Flame (russe, chez La Aurora et Plasencia)
--
-- LA FRONTIERE MAIN / MACHINE, ECRITE FICHE PAR FICHE. Wolf & Ruhland
-- et Van der Donk forment les rouleaux sur un appareil a pedale et
-- posent la cape a la main ; MOSI et Pogar font surtout de la machine
-- et une ligne main — l'atlas ne porte que la ligne main, comme pour
-- Villiger. Chaque fiche dit ce partage.
--
-- Les sources sont des journaux LOCAUX — dresden-exists.de, hogn.de,
-- koelnerleben-magazin.de, rogerklaassen.com, ilnordest.it,
-- cigarinfo.ru, cigarday.ru — et chaque fiche dit que sa presse n'est
-- pas anglophone. Les drapeaux, fuseaux et devises de ces trois pays
-- etaient deja dans flags.js et data.pays.js (pays d'adresses).
--
-- Les trous sont declares : aucune zone, aucune variete. Les drapeaux
-- passent par leurs octets (lecon 168).
-- ════════════════════════════════════════════════════════

-- ── ALLEMAGNE ──
INSERT INTO `producer_countries` (`id`, `name`, `flag`, `lat`, `lon`, `color`, `tier`, `region`, `region_en`, `region_es`, `region_de`, `region_zh`, `region_ar`, `regions`, `varieties`, `tabacaleras`, `brands`, `production`, `production_en`, `production_es`, `production_de`, `production_zh`, `production_ar`, `revenue`, `rev_detail`, `rev_detail_en`, `rev_detail_es`, `rev_detail_de`, `rev_detail_zh`, `rev_detail_ar`, `notes`, `notes_en`, `notes_es`, `notes_de`, `notes_zh`, `notes_ar`)
VALUES ('germany',
  'Allemagne',
  CONVERT(UNHEX('F09F87A9F09F87AA') USING utf8mb4),
  51.1657,
  10.4515,
  '#4A4A4A',
  'emerging',
  'Europe de l''Ouest',
  'Western Europe',
  'Europa Occidental',
  'Westeuropa',
  '西欧',
  'أوروبا الغربية',
  '[]',
  '[]',
  '["Zigarren Manufaktur Dresden","La Galana (Cologne)","Wolf & Ruhland (Perlesreut)"]',
  '[{"name":"Zigarren Manufaktur Dresden","desc":"Dresde, 2015 — un torcedor cubain, des longfillers roulés en Saxe","iconic":true},{"name":"La Galana","desc":"Cologne, 2005 — Annette Meisl, formée à Cuba","iconic":false},{"name":"Wolf & Ruhland","desc":"Perlesreut, 1909 — la dernière de Bavière à rouler à la main","iconic":false}]',
  'Trois ateliers qui roulent à la main — Dresde, Cologne, Perlesreut',
  'Three workshops that roll by hand — Dresden, Cologne, Perlesreut',
  'Tres talleres que lían a mano — Dresde, Colonia, Perlesreut',
  'Drei Werkstätten, die von Hand rollen — Dresden, Köln, Perlesreut',
  '三家手工卷制作坊——德累斯顿、科隆、佩尔莱斯罗伊特',
  'ثلاث ورش تلفّ يدويًّا — درسدن وكولونيا وبرليسرويت',
  '',
  'Aucun chiffre agrégé : l''Allemagne est un grand pays de cigares de machine — Bünde, Lübbecke — que l''atlas ne porte pas, et de trois ateliers main qui comptent en dizaines de milliers de pièces par an. Le tabac est importé.',
  'No aggregate figure: Germany is a major country of machine cigars — Bünde, Lübbecke — which this atlas does not carry, and of three hand workshops counting in tens of thousands of pieces a year. The tobacco is imported.',
  'Ninguna cifra agregada: Alemania es un gran país de puros de máquina — Bünde, Lübbecke — que este atlas no recoge, y de tres talleres a mano que cuentan en decenas de miles de piezas al año. El tabaco es importado.',
  'Keine Gesamtzahl: Deutschland ist ein großes Land der Maschinenzigarren — Bünde, Lübbecke —, die dieser Atlas nicht führt, und dreier Handwerkstätten, die in Zehntausenden Stück im Jahr zählen. Der Tabak wird importiert.',
  '没有汇总数字：德国是机制雪茄大国——本德、吕贝克——本图集不收录；三家手工作坊年产以万计。烟叶为进口。',
  'لا رقم إجمالي: ألمانيا بلد كبير للسيجار الآلي — بونده ولوبكه — لا يحمله هذا الأطلس، وثلاث ورش يدوية تُعدّ بعشرات آلاف القطع في السنة. والتبغ مستورد.',
  'L''Allemagne fut au XIXe siècle un centre du cigare — Brême, Bünde, la Bavière — et il en reste une industrie de machine. Le roulé main y a été relancé par des personnes : une Cologneise formée à Cuba, un torcedor cubain installé à Dresde, une famille bavaroise qui n''a jamais arrêté. L''atlas n''ouvre pas ici un pays de champs mais un lieu de roulage, comme les Bahamas.',
  'Germany was a cigar centre in the nineteenth century — Bremen, Bünde, Bavaria — and a machine industry remains. Hand-rolling was revived there by people: a Cologne woman trained in Cuba, a Cuban roller settled in Dresden, a Bavarian family that never stopped. This atlas opens here not a growing country but a rolling place, like the Bahamas.',
  'Alemania fue en el siglo XIX un centro del puro — Bremen, Bünde, Baviera — y queda una industria de máquina. El liado a mano fue relanzado allí por personas: una colonesa formada en Cuba, un torcedor cubano instalado en Dresde, una familia bávara que nunca paró. Este atlas no abre aquí un país de campos sino un lugar de liado, como las Bahamas.',
  'Deutschland war im 19. Jahrhundert ein Zigarrenzentrum — Bremen, Bünde, Bayern —, und eine Maschinenindustrie ist geblieben. Das Handrollen wurde dort von Menschen wiederbelebt: einer in Kuba ausgebildeten Kölnerin, einem in Dresden ansässigen kubanischen Roller, einer bayerischen Familie, die nie aufhörte. Dieser Atlas öffnet hier kein Anbauland, sondern einen Rollort, wie die Bahamas.',
  '德国在十九世纪曾是雪茄中心——不来梅、本德、巴伐利亚——如今留下的是机制工业。手工卷制在此由个人重振：一位在古巴受训的科隆女子、一位定居德累斯顿的古巴卷工、一个从未停手的巴伐利亚家族。本图集在此开辟的不是种植之国，而是卷制之地，一如巴哈马。',
  'كانت ألمانيا في القرن التاسع عشر مركزًا للسيجار — بريمن وبونده وبافاريا — وبقيت منها صناعة آلية. وأحيا اللفّ اليدوي هناك أشخاصٌ: كولونيّة تدرّبت في كوبا، ولفّاف كوبي استقرّ في درسدن، وعائلة بافارية لم تتوقّف قطّ. لا يفتح هذا الأطلس هنا بلد حقول بل مكان لفّ، كالبهاما.')
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`), `flag` = VALUES(`flag`), `lat` = VALUES(`lat`), `lon` = VALUES(`lon`), `color` = VALUES(`color`), `tier` = VALUES(`tier`), `region` = VALUES(`region`), `region_en` = VALUES(`region_en`), `region_es` = VALUES(`region_es`), `region_de` = VALUES(`region_de`), `region_zh` = VALUES(`region_zh`), `region_ar` = VALUES(`region_ar`), `regions` = VALUES(`regions`), `varieties` = VALUES(`varieties`), `tabacaleras` = VALUES(`tabacaleras`), `brands` = VALUES(`brands`), `production` = VALUES(`production`), `production_en` = VALUES(`production_en`), `production_es` = VALUES(`production_es`), `production_de` = VALUES(`production_de`), `production_zh` = VALUES(`production_zh`), `production_ar` = VALUES(`production_ar`), `revenue` = VALUES(`revenue`), `rev_detail` = VALUES(`rev_detail`), `rev_detail_en` = VALUES(`rev_detail_en`), `rev_detail_es` = VALUES(`rev_detail_es`), `rev_detail_de` = VALUES(`rev_detail_de`), `rev_detail_zh` = VALUES(`rev_detail_zh`), `rev_detail_ar` = VALUES(`rev_detail_ar`), `notes` = VALUES(`notes`), `notes_en` = VALUES(`notes_en`), `notes_es` = VALUES(`notes_es`), `notes_de` = VALUES(`notes_de`), `notes_zh` = VALUES(`notes_zh`), `notes_ar` = VALUES(`notes_ar`);

INSERT INTO `producer_geo` (`country_id`, `capital`, `population`, `area`, `currency`, `language`, `timezone`, `gdp`, `independent`, `currency_en`, `currency_es`, `currency_de`, `currency_zh`, `currency_ar`, `language_en`, `language_es`, `language_de`, `language_zh`, `language_ar`, `independent_en`, `independent_es`, `independent_de`, `independent_zh`, `independent_ar`)
VALUES ('germany', 'Berlin', '83,6 M (2024)', '357 596 km²', 'Euro (EUR)', 'Allemand', 'UTC+1', '4 660 Md$ (2024)', '1871 (Empire) ; réunifiée en 1990', 'Euro (EUR)', 'Euro (EUR)', 'Euro (EUR)', '欧元（EUR）', 'يورو (EUR)', 'German', 'Alemán', 'Deutsch', '德语', 'الألمانية', '1871 (Empire); reunified in 1990', '1871 (Imperio); reunificada en 1990', '1871 (Kaiserreich); 1990 wiedervereinigt', '1871 年（帝国）；1990 年重新统一', '1871 (الإمبراطورية)؛ أُعيد توحيدها سنة 1990')
ON DUPLICATE KEY UPDATE `capital` = VALUES(`capital`), `population` = VALUES(`population`), `area` = VALUES(`area`), `currency` = VALUES(`currency`), `language` = VALUES(`language`), `timezone` = VALUES(`timezone`), `gdp` = VALUES(`gdp`), `independent` = VALUES(`independent`), `currency_en` = VALUES(`currency_en`), `currency_es` = VALUES(`currency_es`), `currency_de` = VALUES(`currency_de`), `currency_zh` = VALUES(`currency_zh`), `currency_ar` = VALUES(`currency_ar`), `language_en` = VALUES(`language_en`), `language_es` = VALUES(`language_es`), `language_de` = VALUES(`language_de`), `language_zh` = VALUES(`language_zh`), `language_ar` = VALUES(`language_ar`), `independent_en` = VALUES(`independent_en`), `independent_es` = VALUES(`independent_es`), `independent_de` = VALUES(`independent_de`), `independent_zh` = VALUES(`independent_zh`), `independent_ar` = VALUES(`independent_ar`);

-- ── PAYS-BAS ──
INSERT INTO `producer_countries` (`id`, `name`, `flag`, `lat`, `lon`, `color`, `tier`, `region`, `region_en`, `region_es`, `region_de`, `region_zh`, `region_ar`, `regions`, `varieties`, `tabacaleras`, `brands`, `production`, `production_en`, `production_es`, `production_de`, `production_zh`, `production_ar`, `revenue`, `rev_detail`, `rev_detail_en`, `rev_detail_es`, `rev_detail_de`, `rev_detail_zh`, `rev_detail_ar`, `notes`, `notes_en`, `notes_es`, `notes_de`, `notes_zh`, `notes_ar`)
VALUES ('netherlands',
  'Pays-Bas',
  CONVERT(UNHEX('F09F87B3F09F87B1') USING utf8mb4),
  52.1326,
  5.2913,
  '#E36F1E',
  'emerging',
  'Europe de l''Ouest',
  'Western Europe',
  'Europa Occidental',
  'Westeuropa',
  '西欧',
  'أوروبا الغربية',
  '[]',
  '[]',
  '["Van der Donk Sigaren (Culemborg)"]',
  '[{"name":"Van der Donk","desc":"Culemborg, 1919 — la dernière fabrique du pays qui travaille à la main","iconic":true}]',
  'Un seul atelier qui fait encore à la main — Culemborg',
  'A single workshop still making by hand — Culemborg',
  'Un solo taller que aún hace a mano — Culemborg',
  'Eine einzige Werkstatt, die noch von Hand macht — Culemborg',
  '仅存一家仍手工制作的作坊——库伦堡',
  'ورشة واحدة ما زالت تصنع يدويًّا — كولمبورغ',
  '',
  'Aucun chiffre : Van der Donk vend à une quarantaine de boutiques néerlandaises. Le reste du pays — Kampen, Eindhoven, Agio, De Olifant — est du cigare de machine, hors de cet atlas.',
  'No figures: Van der Donk sells to some forty Dutch shops. The rest of the country — Kampen, Eindhoven, Agio, De Olifant — is machine cigars, outside this atlas.',
  'Ninguna cifra: Van der Donk vende a unas cuarenta tiendas neerlandesas. El resto del país — Kampen, Eindhoven, Agio, De Olifant — es puro de máquina, fuera de este atlas.',
  'Keine Zahlen: Van der Donk verkauft an rund vierzig niederländische Läden. Der Rest des Landes — Kampen, Eindhoven, Agio, De Olifant — ist Maschinenzigarre, außerhalb dieses Atlas.',
  '没有数字：Van der Donk 向约四十家荷兰店铺供货。国内其余——坎彭、埃因霍温、Agio、De Olifant——都是机制雪茄，不在本图集内。',
  'لا أرقام: تبيع Van der Donk لنحو أربعين متجرًا هولنديًّا. أمّا بقية البلاد — كامبن وأيندهوفن وAgio وDe Olifant — فسيجار آلي خارج هذا الأطلس.',
  'Les Pays-Bas ont roulé des cigares dès la fin du XVIIIe siècle, avec le tabac de Java et de Sumatra de leurs colonies ; vers 1850, presque chaque ville avait ses petites fabriques, et Kampen en comptait plus de cent vingt. Il en reste une industrie de machine et un atelier de Culemborg qui travaille encore à la main, sans successeur annoncé. L''atlas l''ouvre pour lui — un lieu de roulage, pas un pays de champs.',
  'The Netherlands rolled cigars from the late eighteenth century, with Java and Sumatra tobacco from their colonies; around 1850 almost every town had its small factories, and Kampen counted more than a hundred and twenty. What remains is a machine industry and one Culemborg workshop still working by hand, with no successor announced. This atlas opens it for that one — a rolling place, not a growing country.',
  'Los Países Bajos liaron puros desde finales del siglo XVIII, con tabaco de Java y Sumatra de sus colonias; hacia 1850 casi cada ciudad tenía sus pequeñas fábricas, y Kampen contaba más de ciento veinte. Queda una industria de máquina y un taller de Culemborg que aún trabaja a mano, sin sucesor anunciado. Este atlas lo abre por él — un lugar de liado, no un país de campos.',
  'Die Niederlande rollten Zigarren seit dem späten 18. Jahrhundert, mit Java- und Sumatra-Tabak aus ihren Kolonien; um 1850 hatte fast jede Stadt ihre kleinen Fabriken, und Kampen zählte über hundertzwanzig. Geblieben sind eine Maschinenindustrie und eine Werkstatt in Culemborg, die noch von Hand arbeitet, ohne angekündigten Nachfolger. Dieser Atlas öffnet es für sie — ein Rollort, kein Anbauland.',
  '荷兰自十八世纪末起用其殖民地的爪哇与苏门答腊烟叶卷制雪茄；1850年前后几乎每座城镇都有小工厂，坎彭一地就有一百二十多家。如今留下的是机制工业，以及库伦堡一家仍在手工作业、尚无接班人的作坊。本图集为它开辟这个国家——卷制之地，而非种植之国。',
  'لفّت هولندا السيجار منذ أواخر القرن الثامن عشر بتبغ جاوة وسومطرة من مستعمراتها؛ ونحو 1850 كان لكلّ مدينة تقريبًا مصانعها الصغيرة، وعدّت كامبن أكثر من مئة وعشرين. وبقيت صناعة آلية وورشة في كولمبورغ ما زالت تعمل يدويًّا من دون خليفة معلن. يفتحه هذا الأطلس من أجلها — مكان لفّ لا بلد حقول.')
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`), `flag` = VALUES(`flag`), `lat` = VALUES(`lat`), `lon` = VALUES(`lon`), `color` = VALUES(`color`), `tier` = VALUES(`tier`), `region` = VALUES(`region`), `region_en` = VALUES(`region_en`), `region_es` = VALUES(`region_es`), `region_de` = VALUES(`region_de`), `region_zh` = VALUES(`region_zh`), `region_ar` = VALUES(`region_ar`), `regions` = VALUES(`regions`), `varieties` = VALUES(`varieties`), `tabacaleras` = VALUES(`tabacaleras`), `brands` = VALUES(`brands`), `production` = VALUES(`production`), `production_en` = VALUES(`production_en`), `production_es` = VALUES(`production_es`), `production_de` = VALUES(`production_de`), `production_zh` = VALUES(`production_zh`), `production_ar` = VALUES(`production_ar`), `revenue` = VALUES(`revenue`), `rev_detail` = VALUES(`rev_detail`), `rev_detail_en` = VALUES(`rev_detail_en`), `rev_detail_es` = VALUES(`rev_detail_es`), `rev_detail_de` = VALUES(`rev_detail_de`), `rev_detail_zh` = VALUES(`rev_detail_zh`), `rev_detail_ar` = VALUES(`rev_detail_ar`), `notes` = VALUES(`notes`), `notes_en` = VALUES(`notes_en`), `notes_es` = VALUES(`notes_es`), `notes_de` = VALUES(`notes_de`), `notes_zh` = VALUES(`notes_zh`), `notes_ar` = VALUES(`notes_ar`);

INSERT INTO `producer_geo` (`country_id`, `capital`, `population`, `area`, `currency`, `language`, `timezone`, `gdp`, `independent`, `currency_en`, `currency_es`, `currency_de`, `currency_zh`, `currency_ar`, `language_en`, `language_es`, `language_de`, `language_zh`, `language_ar`, `independent_en`, `independent_es`, `independent_de`, `independent_zh`, `independent_ar`)
VALUES ('netherlands', 'Amsterdam', '18,0 M (2024)', '41 543 km²', 'Euro (EUR)', 'Néerlandais', 'UTC+1', '1 220 Md$ (2024)', '1581 (Union d''Utrecht) ; royaume en 1815', 'Euro (EUR)', 'Euro (EUR)', 'Euro (EUR)', '欧元（EUR）', 'يورو (EUR)', 'Dutch', 'Neerlandés', 'Niederländisch', '荷兰语', 'الهولندية', '1581 (Union of Utrecht); kingdom in 1815', '1581 (Unión de Utrecht); reino en 1815', '1581 (Utrechter Union); Königreich 1815', '1581 年（乌得勒支联盟）；1815 年成为王国', '1581 (اتحاد أوترخت)؛ مملكة سنة 1815')
ON DUPLICATE KEY UPDATE `capital` = VALUES(`capital`), `population` = VALUES(`population`), `area` = VALUES(`area`), `currency` = VALUES(`currency`), `language` = VALUES(`language`), `timezone` = VALUES(`timezone`), `gdp` = VALUES(`gdp`), `independent` = VALUES(`independent`), `currency_en` = VALUES(`currency_en`), `currency_es` = VALUES(`currency_es`), `currency_de` = VALUES(`currency_de`), `currency_zh` = VALUES(`currency_zh`), `currency_ar` = VALUES(`currency_ar`), `language_en` = VALUES(`language_en`), `language_es` = VALUES(`language_es`), `language_de` = VALUES(`language_de`), `language_zh` = VALUES(`language_zh`), `language_ar` = VALUES(`language_ar`), `independent_en` = VALUES(`independent_en`), `independent_es` = VALUES(`independent_es`), `independent_de` = VALUES(`independent_de`), `independent_zh` = VALUES(`independent_zh`), `independent_ar` = VALUES(`independent_ar`);

-- ── RUSSIE ──
INSERT INTO `producer_countries` (`id`, `name`, `flag`, `lat`, `lon`, `color`, `tier`, `region`, `region_en`, `region_es`, `region_de`, `region_zh`, `region_ar`, `regions`, `varieties`, `tabacaleras`, `brands`, `production`, `production_en`, `production_es`, `production_de`, `production_zh`, `production_ar`, `revenue`, `rev_detail`, `rev_detail_en`, `rev_detail_es`, `rev_detail_de`, `rev_detail_zh`, `rev_detail_ar`, `notes`, `notes_en`, `notes_es`, `notes_de`, `notes_zh`, `notes_ar`)
VALUES ('russia',
  'Russie',
  CONVERT(UNHEX('F09F87B7F09F87BA') USING utf8mb4),
  55.7558,
  37.6173,
  '#8B2323',
  'emerging',
  'Europe de l''Est',
  'Eastern Europe',
  'Europa Oriental',
  'Osteuropa',
  '东欧',
  'أوروبا الشرقية',
  '[]',
  '[]',
  '["Siglo de Oro (Moscou)","Fabrique de Pogar (Briansk)"]',
  '[{"name":"Siglo de Oro","desc":"Moscou, 2011 — des rouleurs cubains et nicaraguayens, un Onéguine sur la bague","iconic":true},{"name":"Pogar","desc":"Briansk, 1915 sur un site de 1839 — le roulé main d''une fabrique de tout","iconic":false}]',
  'Environ 350 000 cigares roulés main par an à Moscou (Siglo de Oro, 2021) ; Pogar en plus, non chiffré',
  'About 350,000 hand-rolled cigars a year in Moscow (Siglo de Oro, 2021); Pogar on top, unquantified',
  'Unos 350 000 puros liados a mano al año en Moscú (Siglo de Oro, 2021); Pogar además, sin cifra',
  'Etwa 350 000 handgerollte Zigarren im Jahr in Moskau (Siglo de Oro, 2021); Pogar dazu, unbeziffert',
  '莫斯科每年约35万支手工卷制（Siglo de Oro，2021年）；波加尔另计，无数字',
  'نحو 350 ألف سيجار مُلفوف يدويًّا في السنة في موسكو (Siglo de Oro، 2021)؛ وبوغار فوق ذلك بلا رقم',
  '',
  'Marché intérieur seulement : Siglo de Oro vend en Russie, où l''on a fumé environ 2,5 millions de cigares en 2020. Le tabac vient de Cuba, du Nicaragua, d''Équateur et de République dominicaine ; la Russie en cultivait au Caucase, en Crimée et au Kouban, et n''en cultive plus pour le cigare.',
  'Domestic market only: Siglo de Oro sells in Russia, where about 2.5 million cigars were smoked in 2020. The tobacco comes from Cuba, Nicaragua, Ecuador and the Dominican Republic; Russia grew it in the Caucasus, Crimea and the Kuban, and no longer grows it for cigars.',
  'Solo mercado interior: Siglo de Oro vende en Rusia, donde se fumaron unos 2,5 millones de puros en 2020. El tabaco viene de Cuba, Nicaragua, Ecuador y República Dominicana; Rusia lo cultivaba en el Cáucaso, Crimea y el Kubán, y ya no lo cultiva para el puro.',
  'Nur Binnenmarkt: Siglo de Oro verkauft in Russland, wo 2020 etwa 2,5 Millionen Zigarren geraucht wurden. Der Tabak kommt aus Kuba, Nicaragua, Ecuador und der Dominikanischen Republik; Russland baute ihn im Kaukasus, auf der Krim und im Kuban an und baut ihn für Zigarren nicht mehr an.',
  '只有国内市场：Siglo de Oro 在俄罗斯销售，2020年该国约消费250万支雪茄。烟叶来自古巴、尼加拉瓜、厄瓜多尔和多米尼加；俄罗斯曾在高加索、克里米亚和库班种植烟草，如今不再为雪茄种植。',
  'سوق داخلية فقط: تبيع Siglo de Oro في روسيا حيث دُخّن نحو 2.5 مليون سيجار سنة 2020. يأتي التبغ من كوبا ونيكاراغوا والإكوادور وجمهورية الدومينيكان؛ وكانت روسيا تزرعه في القوقاز والقرم والكوبان، ولم تعد تزرعه للسيجار.',
  'Deux fabriques, deux âges : Pogar, dans l''oblast de Briansk, roule depuis 1915 sur un site de 1839, et a survécu à la révolution et à la guerre en faisant du bon marché avant de revenir au cigare ; Siglo de Oro, à Moscou, est née en 2011 de la passion d''un entrepreneur du bâtiment, avec des rouleurs cubains et nicaraguayens. L''atlas ouvre la Russie comme lieu de roulage, sans zone ni variété : le tabac vient d''ailleurs.',
  'Two factories, two ages: Pogar, in Bryansk oblast, has rolled since 1915 on an 1839 site, and survived revolution and war by making cheap goods before returning to cigars; Siglo de Oro, in Moscow, was born in 2011 from the passion of a construction entrepreneur, with Cuban and Nicaraguan rollers. This atlas opens Russia as a rolling place, without zone or variety: the tobacco comes from elsewhere.',
  'Dos fábricas, dos edades: Pogar, en el óblast de Briansk, lía desde 1915 en un sitio de 1839, y sobrevivió a la revolución y a la guerra haciendo barato antes de volver al puro; Siglo de Oro, en Moscú, nació en 2011 de la pasión de un empresario de la construcción, con torcedores cubanos y nicaragüenses. Este atlas abre Rusia como lugar de liado, sin zona ni variedad: el tabaco viene de otra parte.',
  'Zwei Fabriken, zwei Zeitalter: Pogar, im Oblast Brjansk, rollt seit 1915 an einem Standort von 1839 und überlebte Revolution und Krieg mit Billigware, bevor es zur Zigarre zurückkehrte; Siglo de Oro in Moskau entstand 2011 aus der Leidenschaft eines Bauunternehmers, mit kubanischen und nicaraguanischen Rollern. Dieser Atlas öffnet Russland als Rollort, ohne Zone oder Sorte: Der Tabak kommt von anderswo.',
  '两家工厂，两个时代：布良斯克州的波加尔自1915年起在一处1839年的旧址卷制，靠廉价产品熬过革命与战争后重返雪茄；莫斯科的 Siglo de Oro 2011年诞生于一位建筑企业家的热情，卷工来自古巴和尼加拉瓜。本图集把俄罗斯列为卷制之地，不设产区与品种：烟叶来自别处。',
  'مصنعان، عصران: بوغار، في أوبلاست بريانسك، يلفّ منذ 1915 في موقع من 1839، ونجا من الثورة والحرب بصنع الرخيص قبل أن يعود إلى السيجار؛ وSiglo de Oro في موسكو وُلدت سنة 2011 من شغف مقاول بناء، بلفّافين كوبيين ونيكاراغويين. يفتح هذا الأطلس روسيا مكانَ لفّ، بلا منطقة ولا صنف: التبغ يأتي من مكان آخر.')
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`), `flag` = VALUES(`flag`), `lat` = VALUES(`lat`), `lon` = VALUES(`lon`), `color` = VALUES(`color`), `tier` = VALUES(`tier`), `region` = VALUES(`region`), `region_en` = VALUES(`region_en`), `region_es` = VALUES(`region_es`), `region_de` = VALUES(`region_de`), `region_zh` = VALUES(`region_zh`), `region_ar` = VALUES(`region_ar`), `regions` = VALUES(`regions`), `varieties` = VALUES(`varieties`), `tabacaleras` = VALUES(`tabacaleras`), `brands` = VALUES(`brands`), `production` = VALUES(`production`), `production_en` = VALUES(`production_en`), `production_es` = VALUES(`production_es`), `production_de` = VALUES(`production_de`), `production_zh` = VALUES(`production_zh`), `production_ar` = VALUES(`production_ar`), `revenue` = VALUES(`revenue`), `rev_detail` = VALUES(`rev_detail`), `rev_detail_en` = VALUES(`rev_detail_en`), `rev_detail_es` = VALUES(`rev_detail_es`), `rev_detail_de` = VALUES(`rev_detail_de`), `rev_detail_zh` = VALUES(`rev_detail_zh`), `rev_detail_ar` = VALUES(`rev_detail_ar`), `notes` = VALUES(`notes`), `notes_en` = VALUES(`notes_en`), `notes_es` = VALUES(`notes_es`), `notes_de` = VALUES(`notes_de`), `notes_zh` = VALUES(`notes_zh`), `notes_ar` = VALUES(`notes_ar`);

INSERT INTO `producer_geo` (`country_id`, `capital`, `population`, `area`, `currency`, `language`, `timezone`, `gdp`, `independent`, `currency_en`, `currency_es`, `currency_de`, `currency_zh`, `currency_ar`, `language_en`, `language_es`, `language_de`, `language_zh`, `language_ar`, `independent_en`, `independent_es`, `independent_de`, `independent_zh`, `independent_ar`)
VALUES ('russia', 'Moscou', '146 M (2024)', '17 098 246 km²', 'Rouble (RUB)', 'Russe', 'UTC+3', '2 170 Md$ (2024)', '1991 (Fédération de Russie)', 'Ruble (RUB)', 'Rublo (RUB)', 'Rubel (RUB)', '卢布（RUB）', 'الروبل (RUB)', 'Russian', 'Ruso', 'Russisch', '俄语', 'الروسية', '1991 (Russian Federation)', '1991 (Federación de Rusia)', '1991 (Russische Föderation)', '1991 年（俄罗斯联邦）', '1991 (الاتحاد الروسي)')
ON DUPLICATE KEY UPDATE `capital` = VALUES(`capital`), `population` = VALUES(`population`), `area` = VALUES(`area`), `currency` = VALUES(`currency`), `language` = VALUES(`language`), `timezone` = VALUES(`timezone`), `gdp` = VALUES(`gdp`), `independent` = VALUES(`independent`), `currency_en` = VALUES(`currency_en`), `currency_es` = VALUES(`currency_es`), `currency_de` = VALUES(`currency_de`), `currency_zh` = VALUES(`currency_zh`), `currency_ar` = VALUES(`currency_ar`), `language_en` = VALUES(`language_en`), `language_es` = VALUES(`language_es`), `language_de` = VALUES(`language_de`), `language_zh` = VALUES(`language_zh`), `language_ar` = VALUES(`language_ar`), `independent_en` = VALUES(`independent_en`), `independent_es` = VALUES(`independent_es`), `independent_de` = VALUES(`independent_de`), `independent_zh` = VALUES(`independent_zh`), `independent_ar` = VALUES(`independent_ar`);

-- ── Zigarren Manufaktur Dresden ──

INSERT INTO `brands` (`name`, `country_id`, `founded`, `factory`, `source`, `history`, `gamme`, `history_en`, `gamme_en`, `history_es`, `gamme_es`, `history_de`, `gamme_de`, `history_zh`, `gamme_zh`, `history_ar`, `gamme_ar`)
VALUES ('Zigarren Manufaktur Dresden',
        'germany',
        '2015 — Dresde ; Lázaro Javier Herrera Cabrera',
        'Atelier propre à Dresde, ouvert au public',
        'dresden-exists.de « Gründerportrait #55: Zigarren Manufaktur Dresden. Hecho totalmente a mano! » (22 mai 2015 : Lázaro Javier Herrera Cabrera, Cubain, torcedor de troisième génération et contrôleur de qualité du tabac, réalise son rêve d''une manufacture à Dresde ; équipe fondatrice avec Katrin Lieberum ; longfiller roulés entièrement à la main, tripe en feuilles entières, moules de cèdre ; concept écrit en 2013 ; les aides publiques refusent le tabac, et la nationalité cubaine complique les crédits) ; zigarrenmanufaktur.com',
        'La Zigarren Manufaktur Dresden est le rêve d''un Cubain : Lázaro Javier Herrera Cabrera, torcedor de troisième génération et contrôleur de qualité du tabac dans son pays, a voulu sa propre manufacture, et il l''a ouverte en Saxe, à Dresde, en 2015, avec une équipe fondatrice où l''on trouve Katrin Lieberum. Le concept avait été écrit en 2013 ; le portrait de fondateurs publié à l''ouverture raconte le reste — les aides publiques qui excluent le tabac, la nationalité cubaine qui complique les crédits, et le choix de faire quand même.

L''atelier roule des longfillers entièrement à la main, comme à Cuba : tripe en feuilles entières, moules de cèdre, une cape posée par le torcedor sous les yeux des visiteurs, qui peuvent le regarder travailler. Les tabacs sont importés ; ce qui est saxon, c''est le geste. L''atlas classe donc la maison en Allemagne, qu''il ouvre ici comme lieu de roulage — une première pour un pays que l''on connaît surtout par ses cigares de machine.

C''est une petite maison, sans presse du métier au sens anglophone ; sa source est un journal d''entrepreneurs de Dresde. La fiche s''en tient à ce qu''il dit.',
        '[{"name":"Longfiller Dresden","color":"#4A4A4A","force":"Medium","wrapper":"Non divulguée","vitolas":[],"story":"Le longfiller de la maison, roulé sous les yeux des visiteurs."}]',
        'Zigarren Manufaktur Dresden is a Cuban''s dream: Lázaro Javier Herrera Cabrera, a third-generation roller and tobacco quality inspector in his country, wanted his own manufactory, and he opened it in Saxony, in Dresden, in 2015, with a founding team including Katrin Lieberum. The concept had been written in 2013; the founders'' portrait published at the opening tells the rest — public grants that exclude tobacco, a Cuban nationality that complicates loans, and the choice to do it anyway.

The workshop rolls long-filler cigars entirely by hand, as in Cuba: whole-leaf filler, cedar moulds, a wrapper applied by the roller before the eyes of visitors, who may watch him work. The tobaccos are imported; what is Saxon is the gesture. This atlas therefore classifies the house in Germany, which it opens here as a rolling place — a first for a country known mostly for its machine cigars.

It is a small house, without trade press in the English-language sense; its source is a Dresden entrepreneurs'' journal. The entry keeps to what it says.',
        '[{"name":"Longfiller Dresden","color":"#4A4A4A","force":"Medium","wrapper":"Undisclosed","vitolas":[],"story":"The house''s long-filler, rolled before visitors'' eyes."}]',
        'La Zigarren Manufaktur Dresden es el sueño de un cubano: Lázaro Javier Herrera Cabrera, torcedor de tercera generación y controlador de calidad del tabaco en su país, quiso su propia manufactura, y la abrió en Sajonia, en Dresde, en 2015, con un equipo fundador donde está Katrin Lieberum. El concepto se había escrito en 2013; el retrato de fundadores publicado en la apertura cuenta el resto — las ayudas públicas que excluyen el tabaco, la nacionalidad cubana que complica los créditos, y la decisión de hacerlo de todos modos.

El taller lía longfillers enteramente a mano, como en Cuba: tripa de hojas enteras, moldes de cedro, una capa puesta por el torcedor a la vista de los visitantes, que pueden verlo trabajar. Los tabacos son importados; lo sajón es el gesto. Este atlas clasifica pues la casa en Alemania, que abre aquí como lugar de liado — una primicia para un país conocido sobre todo por sus puros de máquina.

Es una casa pequeña, sin prensa del oficio en el sentido anglófono; su fuente es un diario de emprendedores de Dresde. La ficha se atiene a lo que dice.',
        '[{"name":"Longfiller Dresden","color":"#4A4A4A","force":"Medium","wrapper":"No divulgada","vitolas":[],"story":"El longfiller de la casa, liado a la vista de los visitantes."}]',
        'Die Zigarren Manufaktur Dresden ist der Traum eines Kubaners: Lázaro Javier Herrera Cabrera, Torcedor in dritter Generation und Tabakgütekontrolleur in seinem Land, wollte seine eigene Manufaktur und eröffnete sie 2015 in Sachsen, in Dresden, mit einem Gründerteam, zu dem Katrin Lieberum gehört. Das Konzept war 2013 geschrieben worden; das zur Eröffnung veröffentlichte Gründerporträt erzählt den Rest — Förderungen, die Tabak ausschließen, eine kubanische Staatsangehörigkeit, die Kredite erschwert, und die Entscheidung, es trotzdem zu tun.

Die Werkstatt rollt Longfiller vollständig von Hand, wie auf Kuba: Einlage aus ganzen Blättern, Zedernformen, ein Deckblatt, das der Torcedor vor den Augen der Besucher aufbringt, die ihm bei der Arbeit zusehen können. Die Tabake sind importiert; sächsisch ist die Handbewegung. Dieser Atlas ordnet das Haus daher in Deutschland ein, das er hier als Rollort öffnet — eine Premiere für ein Land, das man vor allem durch seine Maschinenzigarren kennt.

Es ist ein kleines Haus, ohne Fachpresse im englischsprachigen Sinn; seine Quelle ist ein Dresdner Gründermagazin. Der Eintrag hält sich an das, was es sagt.',
        '[{"name":"Longfiller Dresden","color":"#4A4A4A","force":"Medium","wrapper":"Nicht angegeben","vitolas":[],"story":"Der Longfiller des Hauses, vor den Augen der Besucher gerollt."}]',
        'Zigarren Manufaktur Dresden 是一个古巴人的梦想：拉萨罗·哈维尔·埃雷拉·卡夫雷拉，第三代卷工、在祖国担任烟叶质检员，想要自己的工坊，2015年在萨克森的德累斯顿开了它，创始团队里有卡特琳·利贝鲁姆。构想写于2013年；开业时发表的创业者肖像讲了其余的故事——排除烟草的公共补贴、让贷款复杂化的古巴国籍，以及无论如何要做的决心。

作坊像在古巴那样完全手工卷制长填充雪茄：整叶填充、雪松模具，卷工在访客眼前上茄衣，访客可以看他工作。烟叶为进口；属于萨克森的是手艺。本图集因此把这家公司归入德国，并在此把德国开辟为卷制之地——对一个主要以机制雪茄闻名的国家而言是头一回。

这是一家小公司，没有英语意义上的行业媒体；它的来源是德累斯顿的一份创业者刊物。词条止于该刊物所言。',
        '[{"name":"Longfiller Dresden","color":"#4A4A4A","force":"Medium","wrapper":"未公开","vitolas":[],"story":"公司的长填充雪茄，在访客眼前卷制。"}]',
        'Zigarren Manufaktur Dresden حلمُ كوبي: لازارو خافيير إيريرا كابريرا، لفّافٌ من الجيل الثالث ومراقب جودة التبغ في بلده، أراد مصنعه الخاص، فافتتحه في ساكسونيا، في درسدن، سنة 2015، مع فريق مؤسّس فيه كاترين ليبيروم. كُتب التصوّر سنة 2013؛ ويروي بورتريه المؤسّسين المنشور عند الافتتاح الباقي — الإعانات العامّة التي تستثني التبغ، والجنسية الكوبية التي تعقّد القروض، واختيار الفعل رغم ذلك.

تلفّ الورشة سيجارات طويلة الحشوة يدويًّا بالكامل كما في كوبا: حشوة من أوراق كاملة، وقوالب أرز، وغلاف يضعه اللفّاف أمام أعين الزوّار الذين يستطيعون مشاهدته يعمل. الأتبغة مستوردة؛ والساكسوني فيها هو الحركة. لذلك يصنّف هذا الأطلس الدار في ألمانيا التي يفتحها هنا مكانَ لفّ — سابقةٌ لبلد يُعرف أساسًا بسيجاره الآلي.

دارٌ صغيرة، بلا صحافة مهنة بالمعنى الأنجلوفوني؛ مصدرها مجلّة روّاد أعمال في درسدن. وتقف البطاقة عند ما تقوله.',
        '[{"name":"Longfiller Dresden","color":"#4A4A4A","force":"Medium","wrapper":"غير معلن","vitolas":[],"story":"السيجار طويل الحشوة للدار، يُلفّ أمام أعين الزوّار."}]')
ON DUPLICATE KEY UPDATE `country_id` = VALUES(`country_id`), `founded` = VALUES(`founded`), `factory` = VALUES(`factory`), `source` = VALUES(`source`), `history` = VALUES(`history`), `gamme` = VALUES(`gamme`), `history_en` = VALUES(`history_en`), `gamme_en` = VALUES(`gamme_en`), `history_es` = VALUES(`history_es`), `gamme_es` = VALUES(`gamme_es`), `history_de` = VALUES(`history_de`), `gamme_de` = VALUES(`gamme_de`), `history_zh` = VALUES(`history_zh`), `gamme_zh` = VALUES(`gamme_zh`), `history_ar` = VALUES(`history_ar`), `gamme_ar` = VALUES(`gamme_ar`);

-- ── La Galana ──

INSERT INTO `brands` (`name`, `country_id`, `founded`, `factory`, `source`, `history`, `gamme`, `history_en`, `gamme_en`, `history_es`, `gamme_es`, `history_de`, `gamme_de`, `history_zh`, `gamme_zh`, `history_ar`, `gamme_ar`)
VALUES ('La Galana',
        'germany',
        '2005 — Cologne ; Annette Meisl',
        'Atelier propre — Cologne-Ehrenfeld, manufacture et salon ouverts en 2009',
        'koelnerleben-magazin.de « Eine Zigarrenmanufaktur in Köln » (Annette Meisl, agente d''artistes, autrice et musicienne, tombée à Cuba dans la magie du tabac ; formée par la maestra cubaine Silvia Hernández, puis aux manières nicaraguayenne et hondurienne ; La Galana fondée en 2005, boutique-salon d''Ehrenfeld ouverte quatre ans plus tard) ; lagalana.de (longfiller de tabacs caribéens importés, roulés main par des torcedoras)',
        'La Galana est la manufacture d''Annette Meisl, une Cologneise qui fut agente d''artistes, autrice et musicienne avant de tomber, à Cuba, dans ce qu''elle appelle la magie du tabac. Elle a demandé à une maestra cubaine, Silvia Hernández, de lui apprendre le roulage, puis a appris pendant des années, de première main, les manières nicaraguayenne et hondurienne. La Galana est née en 2005 ; quatre ans plus tard, elle a ouvert à Ehrenfeld une boutique meublée à l''ancienne, avec un salon.

Les cigares sont des longfillers de tabacs caribéens importés, roulés à la main par des torcedoras — le féminin est de la maison, qui emploie des femmes — selon ce qu''elle appelle des standards de qualité allemands. L''atlas la classe en Allemagne, pays qu''il ouvre comme lieu de roulage avec Dresde et Perlesreut : trois ateliers, trois histoires différentes, un même geste.

Une maison d''une personne, dans une ville qui n''a pas de tradition du cigare ; sa source est le magazine de la ville. La fiche le dit, et n''invente pas de chiffres.',
        '[{"name":"La Galana Longfiller","color":"#8B5A2B","force":"Medium","wrapper":"Non divulguée","vitolas":[],"story":"Les longfillers de la maison, roulés à Ehrenfeld par des torcedoras."}]',
        'La Galana is the manufactory of Annette Meisl, a Cologne woman who was an artists'' agent, author and musician before falling, in Cuba, into what she calls the magic of tobacco. She asked a Cuban maestra, Silvia Hernández, to teach her rolling, then learned for years, first-hand, the Nicaraguan and Honduran ways. La Galana was born in 2005; four years later she opened in Ehrenfeld a shop furnished in period style, with a salon.

The cigars are long-fillers of imported Caribbean tobaccos, hand-rolled by torcedoras — the feminine is the house''s, which employs women — to what it calls German quality standards. This atlas classifies it in Germany, a country it opens as a rolling place with Dresden and Perlesreut: three workshops, three different stories, one gesture.

A one-person house, in a city with no cigar tradition; its source is the city''s magazine. The entry says so, and invents no figures.',
        '[{"name":"La Galana Longfiller","color":"#8B5A2B","force":"Medium","wrapper":"Undisclosed","vitolas":[],"story":"The house''s long-fillers, rolled in Ehrenfeld by torcedoras."}]',
        'La Galana es la manufactura de Annette Meisl, una colonesa que fue agente de artistas, autora y música antes de caer, en Cuba, en lo que ella llama la magia del tabaco. Pidió a una maestra cubana, Silvia Hernández, que le enseñara el torcido, y luego aprendió durante años, de primera mano, las maneras nicaragüense y hondureña. La Galana nació en 2005; cuatro años después abrió en Ehrenfeld una tienda amueblada a la antigua, con salón.

Los puros son longfillers de tabacos caribeños importados, liados a mano por torcedoras — el femenino es de la casa, que emplea mujeres — según lo que llama estándares de calidad alemanes. Este atlas la clasifica en Alemania, país que abre como lugar de liado con Dresde y Perlesreut: tres talleres, tres historias distintas, un mismo gesto.

Una casa de una persona, en una ciudad sin tradición de puros; su fuente es la revista de la ciudad. La ficha lo dice, y no inventa cifras.',
        '[{"name":"La Galana Longfiller","color":"#8B5A2B","force":"Medium","wrapper":"No divulgada","vitolas":[],"story":"Los longfillers de la casa, liados en Ehrenfeld por torcedoras."}]',
        'La Galana ist die Manufaktur von Annette Meisl, einer Kölnerin, die Künstleragentin, Autorin und Musikerin war, bevor sie auf Kuba dem verfiel, was sie die Magie des Tabaks nennt. Sie bat eine kubanische Maestra, Silvia Hernández, ihr das Rollen beizubringen, und lernte dann jahrelang aus erster Hand die nicaraguanische und honduranische Art. La Galana entstand 2005; vier Jahre später eröffnete sie in Ehrenfeld ein stilecht eingerichtetes Geschäft mit Salon.

Die Zigarren sind Longfiller aus importierten karibischen Tabaken, von Torcedoras von Hand gerollt — die weibliche Form ist die des Hauses, das Frauen beschäftigt — nach dem, was es deutsche Qualitätsstandards nennt. Dieser Atlas ordnet es in Deutschland ein, einem Land, das er mit Dresden und Perlesreut als Rollort öffnet: drei Werkstätten, drei verschiedene Geschichten, eine Handbewegung.

Ein Ein-Personen-Haus in einer Stadt ohne Zigarrentradition; seine Quelle ist das Magazin der Stadt. Der Eintrag sagt es und erfindet keine Zahlen.',
        '[{"name":"La Galana Longfiller","color":"#8B5A2B","force":"Medium","wrapper":"Nicht angegeben","vitolas":[],"story":"Die Longfiller des Hauses, in Ehrenfeld von Torcedoras gerollt."}]',
        'La Galana 是安妮特·迈斯尔的工坊。这位科隆女子曾是艺人经纪、作家和音乐人，直到在古巴陷入她所说的烟草魔力。她请古巴女大师西尔维娅·埃尔南德斯教她卷制，随后多年亲身学习尼加拉瓜和洪都拉斯的手法。La Galana 生于2005年；四年后她在埃伦费尔德开了一家古风陈设的店铺，附带沙龙。

雪茄是进口加勒比烟叶的长填充，由女卷工——公司用阴性词，因为雇的是女性——按它所称的德国质量标准手工卷制。本图集把它归入德国，并与德累斯顿、佩尔莱斯罗伊特一道把德国开辟为卷制之地：三家作坊，三段不同的故事，同一种手艺。

一人之公司，在一座没有雪茄传统的城市；来源是这座城市的杂志。词条如实说明，不编造数字。',
        '[{"name":"La Galana Longfiller","color":"#8B5A2B","force":"Medium","wrapper":"未公开","vitolas":[],"story":"公司的长填充雪茄，由女卷工在埃伦费尔德卷制。"}]',
        'لا غالانا مصنعُ أنيته مايزل، الكولونيّة التي كانت وكيلة فنّانين وكاتبة وموسيقية قبل أن تقع، في كوبا، فيما تسمّيه سحر التبغ. طلبت من معلّمة كوبية، سيلفيا إرنانديس، أن تعلّمها اللفّ، ثم تعلّمت لسنوات، من المصدر الأوّل، الطريقتين النيكاراغوية والهندوراسية. وُلدت لا غالانا سنة 2005؛ وبعد أربع سنين افتتحت في إيرنفلد متجرًا مؤثّثًا على الطراز القديم مع صالون.

السيجارات طويلة الحشوة من أتبغة كاريبية مستوردة، تلفّها يدويًّا لفّافات — صيغة التأنيث من الدار التي توظّف نساءً — بحسب ما تسمّيه معايير الجودة الألمانية. يصنّفها هذا الأطلس في ألمانيا، البلد الذي يفتحه مكانَ لفّ مع درسدن وبرليسرويت: ثلاث ورش، ثلاث قصص مختلفة، حركة واحدة.

دارُ شخص واحد في مدينة لا تقليد للسيجار فيها؛ مصدرها مجلّة المدينة. تقول البطاقة ذلك ولا تخترع أرقامًا.',
        '[{"name":"La Galana Longfiller","color":"#8B5A2B","force":"Medium","wrapper":"غير معلن","vitolas":[],"story":"سيجارات الدار طويلة الحشوة، تلفّها لفّافات في إيرنفلد."}]')
ON DUPLICATE KEY UPDATE `country_id` = VALUES(`country_id`), `founded` = VALUES(`founded`), `factory` = VALUES(`factory`), `source` = VALUES(`source`), `history` = VALUES(`history`), `gamme` = VALUES(`gamme`), `history_en` = VALUES(`history_en`), `gamme_en` = VALUES(`gamme_en`), `history_es` = VALUES(`history_es`), `gamme_es` = VALUES(`gamme_es`), `history_de` = VALUES(`history_de`), `gamme_de` = VALUES(`gamme_de`), `history_zh` = VALUES(`history_zh`), `gamme_zh` = VALUES(`gamme_zh`), `history_ar` = VALUES(`history_ar`), `gamme_ar` = VALUES(`gamme_ar`);

-- ── Wolf & Ruhland ──

INSERT INTO `brands` (`name`, `country_id`, `founded`, `factory`, `source`, `history`, `gamme`, `history_en`, `gamme_en`, `history_es`, `gamme_es`, `history_de`, `gamme_de`, `history_zh`, `gamme_zh`, `history_ar`, `gamme_ar`)
VALUES ('Wolf & Ruhland',
        'germany',
        '1909 — Munich ; Perlesreut depuis 1917',
        'Fabrique propre — Perlesreut, forêt de Bavière ; dix personnes (2016)',
        'hogn.de « Made in da Heimat: „Eigentlich riecht die Virginia wie der Bayerische Wald“ » (17 août 2016 : fondée en 1909 à Munich par le négociant mannheimois Hermann Wolf et sa belle-sœur Käthe Ruhland ; second site à Perlesreut en 1917 grâce à l''ami Karl Hilz, cent soixante-dix employés alors ; Karl Hilz reprend la firme dans les années difficiles, son fils Hermann la tient avec une station-service ; Cornelia Stix, troisième génération, dirige depuis 2006 avec dix personnes ; « la dernière de Bavière qui roule encore à la main » ; une seule machine aide, les rouleaux se font aussi à la main sur un appareil à pédale ; tabacs de Java, de Sumatra et du Mexique ; Virginia, la cigarette de la maison ; Toccata Torpedo, la plus grande, dont la patronne écrit la bague à la main)',
        'Wolf & Ruhland a été fondée en 1909 à Munich par un négociant de Mannheim, Hermann Wolf, et sa belle-sœur Käthe Ruhland ; la fabrique munichoise a si bien marché qu''ils ont cherché en 1917 un second site, et l''ont trouvé, grâce à un ami, Karl Hilz, dans un village de la forêt de Bavière, Perlesreut, où ils ont embauché cent soixante-dix personnes — le village appelait le patron « le père Wolf ». Dans les années difficiles, c''est Karl Hilz qui a repris la firme ; son fils Hermann l''a tenue à flot avec une station-service et un garage ; sa petite-fille, Cornelia Stix, la dirige depuis sa mort en 2006, en troisième génération, avec dix personnes.

C''est, dit-elle, la dernière manufacture de Bavière qui roule encore des cigares à la main. Une seule machine aide ; pour certains styles, les femmes forment les rouleaux à la main sur un appareil à pédale, et la cape est posée à la main — la fiche le dit précisément, parce que la frontière que trace cet atlas passe entre la main et la machine. Les tabacs viennent de Java, de Sumatra et du Mexique ; les recettes, dont certaines remontent à Karl Hilz, sont tenues par le fils de la patronne, Martin, sans arômes ni parfums ajoutés. La Virginia, une cigarette fine, est la marque de la maison ; la Toccata Torpedo, la plus grande, porte une bague écrite à la main.

Une fabrique de village, d''un siècle et de trois générations, sans presse du métier : sa source est un magazine régional. L''atlas la garde parce qu''elle roule, et qu''elle le fait depuis 1909.',
        '[{"name":"Virginia","color":"#C9A96E","force":"Mild","wrapper":"Non divulguée","vitolas":[],"story":"La cigare fine, marque de la maison — « elle sent la forêt de Bavière », dit la patronne."},{"name":"Toccata Torpedo","color":"#6B4226","force":"Medium","wrapper":"Non divulguée","vitolas":[],"story":"Le plus grand format, dont la bague est écrite à la main."}]',
        'Wolf & Ruhland was founded in 1909 in Munich by a Mannheim merchant, Hermann Wolf, and his sister-in-law Käthe Ruhland; the Munich factory did so well that in 1917 they looked for a second site, and found it, through a friend, Karl Hilz, in a village of the Bavarian Forest, Perlesreut, where they hired a hundred and seventy people — the village called the boss "Father Wolf". In the hard years it was Karl Hilz who took over the firm; his son Hermann kept it afloat with a petrol station and a garage; his granddaughter, Cornelia Stix, has run it since his death in 2006, in the third generation, with ten people.

It is, she says, the last manufactory in Bavaria still rolling cigars by hand. A single machine helps; for some styles the women form the bunches by hand on a foot-operated device, and the wrapper is applied by hand — the entry says so precisely, because the line this atlas draws runs between hand and machine. The tobaccos come from Java, Sumatra and Mexico; the recipes, some going back to Karl Hilz, are kept by the owner''s son, Martin, with no added flavours or scents. The Virginia, a slim cigar, is the house''s mark; the Toccata Torpedo, the largest, wears a hand-written band.

A village factory, a century and three generations old, without trade press: its source is a regional magazine. This atlas keeps it because it rolls, and has since 1909.',
        '[{"name":"Virginia","color":"#C9A96E","force":"Mild","wrapper":"Undisclosed","vitolas":[],"story":"The slim cigar, the house''s mark — it smells of the Bavarian Forest, the owner says."},{"name":"Toccata Torpedo","color":"#6B4226","force":"Medium","wrapper":"Undisclosed","vitolas":[],"story":"The largest size, whose band is hand-written."}]',
        'Wolf & Ruhland fue fundada en 1909 en Múnich por un comerciante de Mannheim, Hermann Wolf, y su cuñada Käthe Ruhland; la fábrica muniquesa marchó tan bien que en 1917 buscaron un segundo sitio, y lo encontraron, gracias a un amigo, Karl Hilz, en un pueblo del Bosque Bávaro, Perlesreut, donde contrataron a ciento setenta personas — el pueblo llamaba al patrón «el padre Wolf». En los años difíciles fue Karl Hilz quien tomó la firma; su hijo Hermann la mantuvo a flote con una gasolinera y un taller; su nieta, Cornelia Stix, la dirige desde su muerte en 2006, en tercera generación, con diez personas.

Es, dice ella, la última manufactura de Baviera que aún lía puros a mano. Una sola máquina ayuda; para algunos estilos las mujeres forman los rollos a mano en un aparato de pedal, y la capa se pone a mano — la ficha lo dice con precisión, porque la frontera que traza este atlas pasa entre la mano y la máquina. Los tabacos vienen de Java, Sumatra y México; las recetas, algunas de Karl Hilz, las guarda el hijo de la patrona, Martin, sin aromas ni perfumes añadidos. La Virginia, un puro fino, es la marca de la casa; la Toccata Torpedo, la mayor, lleva una anilla escrita a mano.

Una fábrica de pueblo, de un siglo y tres generaciones, sin prensa del oficio: su fuente es una revista regional. Este atlas la conserva porque lía, y lo hace desde 1909.',
        '[{"name":"Virginia","color":"#C9A96E","force":"Mild","wrapper":"No divulgada","vitolas":[],"story":"El puro fino, marca de la casa — huele al Bosque Bávaro, dice la patrona."},{"name":"Toccata Torpedo","color":"#6B4226","force":"Medium","wrapper":"No divulgada","vitolas":[],"story":"El formato mayor, cuya anilla se escribe a mano."}]',
        'Wolf & Ruhland wurde 1909 in München von einem Mannheimer Kaufmann, Hermann Wolf, und seiner Schwägerin Käthe Ruhland gegründet; die Münchner Fabrik lief so gut, dass sie 1917 einen zweiten Standort suchten und ihn durch einen Freund, Karl Hilz, in einem Dorf des Bayerischen Waldes fanden, Perlesreut, wo sie hundertsiebzig Leute einstellten — das Dorf nannte den Chef „Vater Wolf". In den schwierigen Jahren übernahm Karl Hilz die Firma; sein Sohn Hermann hielt sie mit einer Tankstelle und einer Autowerkstatt über Wasser; seine Enkelin Cornelia Stix führt sie seit seinem Tod 2006 in dritter Generation, mit zehn Leuten.

Es ist, sagt sie, die letzte Manufaktur Bayerns, die noch Zigarren von Hand rollt. Nur eine Maschine hilft; für manche Stile stellen die Frauen die Wickel von Hand an einer fußbedienten Apparatur her, und das Deckblatt wird von Hand aufgelegt — der Eintrag sagt es genau, weil die Grenze, die dieser Atlas zieht, zwischen Hand und Maschine verläuft. Die Tabake kommen aus Java, Sumatra und Mexiko; die Rezepturen, einige noch von Karl Hilz, hält der Sohn der Chefin, Martin, ohne Geschmacksverstärker oder Parfümierungen. Die Virginia, eine schmale Zigarre, ist das Markenzeichen des Hauses; die Toccata Torpedo, die größte, trägt eine handbeschriftete Banderole.

Eine Dorffabrik, ein Jahrhundert und drei Generationen alt, ohne Fachpresse: ihre Quelle ist ein Regionalmagazin. Dieser Atlas behält sie, weil sie rollt, und das seit 1909.',
        '[{"name":"Virginia","color":"#C9A96E","force":"Mild","wrapper":"Nicht angegeben","vitolas":[],"story":"Die schmale Zigarre, Markenzeichen des Hauses — sie rieche wie der Bayerische Wald, sagt die Chefin."},{"name":"Toccata Torpedo","color":"#6B4226","force":"Medium","wrapper":"Nicht angegeben","vitolas":[],"story":"Das größte Format, dessen Banderole von Hand beschriftet wird."}]',
        'Wolf & Ruhland 1909年由曼海姆商人赫尔曼·沃尔夫与其嫂克特·鲁兰在慕尼黑创立；慕尼黑工厂生意兴隆，1917年他们寻找第二个厂址，经朋友卡尔·希尔茨介绍，落在巴伐利亚森林的村庄佩尔莱斯罗伊特，雇了一百七十人——村里人称老板「沃尔夫老爹」。艰难岁月里由卡尔·希尔茨接手；其子赫尔曼靠一个加油站和一家修车行撑住；他的孙女科尔内利娅·施蒂克斯自他2006年去世起以第三代身份执掌，十名员工。

她说，这是巴伐利亚最后一家仍手工卷制雪茄的工坊。只有一台机器辅助；某些款式由女工在脚踏装置上手工成型茄芯，茄衣手工上——词条说得精确，因为本图集划的界线在手与机器之间。烟叶来自爪哇、苏门答腊和墨西哥；配方有些可追溯到卡尔·希尔茨，由老板的儿子马丁掌管，不加香精香料。细长的 Virginia 是公司的标志；最大的 Toccata Torpedo 茄标由手写。

一家百年、三代的乡村工厂，没有行业媒体：来源是一份地区杂志。本图集保留它，因为它在卷制，而且自1909年起就在卷。',
        '[{"name":"Virginia","color":"#C9A96E","force":"Mild","wrapper":"未公开","vitolas":[],"story":"细长的雪茄，公司的标志——老板说它闻起来像巴伐利亚森林。"},{"name":"Toccata Torpedo","color":"#6B4226","force":"Medium","wrapper":"未公开","vitolas":[],"story":"最大的尺寸，茄标由手写。"}]',
        'أُسّست Wolf & Ruhland سنة 1909 في ميونيخ على يد تاجر من مانهايم، هرمان فولف، وشقيقة زوجته كيته رولاند؛ ونجح مصنع ميونيخ حتى بحثا سنة 1917 عن موقع ثانٍ، ووجداه بفضل صديق، كارل هيلتس، في قرية من غابة بافاريا، برليسرويت، حيث وظّفا مئة وسبعين شخصًا — وكانت القرية تسمّي الرئيس «الأب فولف». في السنوات الصعبة تولّى كارل هيلتس الشركة؛ وأبقاها ابنه هرمان طافيةً بمحطّة وقود وورشة سيّارات؛ وتديرها حفيدته كورنيليا شتيكس منذ وفاته سنة 2006، في الجيل الثالث، بعشرة أشخاص.

إنّه، كما تقول، آخر مصنع في بافاريا ما زال يلفّ السيجار يدويًّا. آلة واحدة تساعد؛ ولبعض الطُرز تشكّل النساء اللفائف يدويًّا على جهاز يُدار بالقدم، ويوضع الغلاف باليد — تقول البطاقة ذلك بدقّة لأنّ الحدّ الذي يرسمه هذا الأطلس يمرّ بين اليد والآلة. تأتي الأتبغة من جاوة وسومطرة والمكسيك؛ والوصفات، وبعضها يعود إلى كارل هيلتس، يحفظها ابن المالكة مارتن، بلا نكهات ولا عطور مضافة. وVirginia، سيجار رفيع، هي علامة الدار؛ وToccata Torpedo، الأكبر، يحمل حزامًا مكتوبًا بخطّ اليد.

مصنعُ قرية، عمره قرن وثلاثة أجيال، بلا صحافة مهنة: مصدره مجلّة إقليمية. يحتفظ به هذا الأطلس لأنّه يلفّ، ومنذ 1909.',
        '[{"name":"Virginia","color":"#C9A96E","force":"Mild","wrapper":"غير معلن","vitolas":[],"story":"السيجار الرفيع، علامة الدار — تقول المالكة إنّ رائحته كرائحة غابة بافاريا."},{"name":"Toccata Torpedo","color":"#6B4226","force":"Medium","wrapper":"غير معلن","vitolas":[],"story":"أكبر القياسات، حزامه مكتوب بخطّ اليد."}]')
ON DUPLICATE KEY UPDATE `country_id` = VALUES(`country_id`), `founded` = VALUES(`founded`), `factory` = VALUES(`factory`), `source` = VALUES(`source`), `history` = VALUES(`history`), `gamme` = VALUES(`gamme`), `history_en` = VALUES(`history_en`), `gamme_en` = VALUES(`gamme_en`), `history_es` = VALUES(`history_es`), `gamme_es` = VALUES(`gamme_es`), `history_de` = VALUES(`history_de`), `gamme_de` = VALUES(`gamme_de`), `history_zh` = VALUES(`history_zh`), `gamme_zh` = VALUES(`gamme_zh`), `history_ar` = VALUES(`history_ar`), `gamme_ar` = VALUES(`gamme_ar`);

-- ── Van der Donk ──

INSERT INTO `brands` (`name`, `country_id`, `founded`, `factory`, `source`, `history`, `gamme`, `history_en`, `gamme_en`, `history_es`, `gamme_es`, `history_de`, `gamme_de`, `history_zh`, `gamme_zh`, `history_ar`, `gamme_ar`)
VALUES ('Van der Donk',
        'netherlands',
        '1919 — Culemborg (Sigarenfabriek Havana)',
        'Fabrique propre — Zandstraat, Culemborg ; Richard et Gerda van der Donk, troisième génération',
        'rogerklaassen.com « Van der Donk Sigaren » (reportage dessiné : « la dernière fabrique des Pays-Bas où les cigares se font encore à la main », Culemborg ; fondée en 1919 sous le nom de Sigarenfabriek Havana par A.W. Smits ; J. van der Donk y entre à quatorze ans, reprend dans les années 1960 et renomme dans les années 1970 ; son fils Richard, troisième génération, et sa femme Gerda ; tabacs de Cuba, du Brésil et d''Indonésie, neuf variantes ; nervures ôtées à la main, sous-cape posée à la main dans une machine à pédale ; vendue dans une quarantaine de boutiques ; pas de successeur) ; vanderdonksigaren.nl « Het ambacht »',
        'Van der Donk est la dernière fabrique des Pays-Bas où l''on fait encore des cigares à la main — c''est ainsi qu''un reportage dessiné la présente, et c''est ce que la fiche retient d''abord. Elle est née en 1919 à Culemborg sous le nom de Sigarenfabriek Havana, fondée par A.W. Smits ; un garçon de quatorze ans, J. van der Donk, y est entré, l''a reprise dans les années 1960 et lui a donné son nom dans les années 1970. Son fils Richard, troisième génération, la tient aujourd''hui avec sa femme Gerda, dans la Zandstraat, au milieu de machines anciennes qui font croire à un musée et qui servent toutes.

Le geste est celui du cigare hollandais : des tabacs de Cuba, du Brésil et d''Indonésie, dont les nervures sont ôtées à la main ; une sous-cape posée à la main dans une machine à pédale que Richard actionne au pied ; une cape — la feuille la plus chère, livrée à plat — posée à la main. La fiche décrit ce partage précisément, parce que la frontière de cet atlas passe entre la main et la machine, et qu''ici la main fait l''essentiel. Neuf variantes, plus ou moins longues et épaisses, vendues dans une quarantaine de boutiques du pays.

Il n''y a pas de successeur : quand Richard et Gerda s''arrêteront, la maison cessera. L''atlas ouvre les Pays-Bas comme lieu de roulage pour cette fabrique-là, et il le fait avant qu''elle ne ferme.',
        '[{"name":"Van der Donk","color":"#8B5A2B","force":"Mild-Medium","wrapper":"Sumatra ou Brésil","vitolas":[],"story":"Neuf variantes du cigare hollandais — tabacs de Cuba, du Brésil et d''Indonésie."}]',
        'Van der Donk is the last factory in the Netherlands where cigars are still made by hand — that is how an illustrated report presents it, and it is what the entry retains first. It was born in 1919 in Culemborg as Sigarenfabriek Havana, founded by A.W. Smits; a fourteen-year-old boy, J. van der Donk, came to work there, took it over in the 1960s and gave it his name in the 1970s. His son Richard, third generation, runs it today with his wife Gerda, in the Zandstraat, among old machines that suggest a museum and are all in use.

The gesture is that of the Dutch cigar: tobaccos from Cuba, Brazil and Indonesia, their veins removed by hand; a binder placed by hand into a pedal machine that Richard works with his foot; a wrapper — the most expensive leaf, delivered flat — applied by hand. The entry describes this division precisely, because this atlas''s line runs between hand and machine, and here the hand does the essential. Nine variants, longer or shorter, thicker or thinner, sold in some forty shops in the country.

There is no successor: when Richard and Gerda stop, the house will cease. This atlas opens the Netherlands as a rolling place for that one factory, and does so before it closes.',
        '[{"name":"Van der Donk","color":"#8B5A2B","force":"Mild-Medium","wrapper":"Sumatra or Brazil","vitolas":[],"story":"Nine variants of the Dutch cigar — tobaccos from Cuba, Brazil and Indonesia."}]',
        'Van der Donk es la última fábrica de los Países Bajos donde aún se hacen puros a mano — así la presenta un reportaje dibujado, y es lo que la ficha retiene primero. Nació en 1919 en Culemborg con el nombre de Sigarenfabriek Havana, fundada por A.W. Smits; un muchacho de catorce años, J. van der Donk, entró a trabajar allí, la tomó en los años 1960 y le dio su nombre en los años 1970. Su hijo Richard, tercera generación, la lleva hoy con su mujer Gerda, en la Zandstraat, entre máquinas antiguas que hacen pensar en un museo y que sirven todas.

El gesto es el del puro holandés: tabacos de Cuba, Brasil e Indonesia, a los que se quitan las venas a mano; un capote puesto a mano en una máquina de pedal que Richard acciona con el pie; una capa — la hoja más cara, entregada plana — puesta a mano. La ficha describe ese reparto con precisión, porque la frontera de este atlas pasa entre la mano y la máquina, y aquí la mano hace lo esencial. Nueve variantes, más o menos largas y gruesas, vendidas en unas cuarenta tiendas del país.

No hay sucesor: cuando Richard y Gerda paren, la casa cesará. Este atlas abre los Países Bajos como lugar de liado para esa fábrica, y lo hace antes de que cierre.',
        '[{"name":"Van der Donk","color":"#8B5A2B","force":"Mild-Medium","wrapper":"Sumatra o Brasil","vitolas":[],"story":"Nueve variantes del puro holandés — tabacos de Cuba, Brasil e Indonesia."}]',
        'Van der Donk ist die letzte Fabrik der Niederlande, in der Zigarren noch von Hand gemacht werden — so stellt sie eine gezeichnete Reportage vor, und das behält der Eintrag zuerst. Sie entstand 1919 in Culemborg als Sigarenfabriek Havana, gegründet von A.W. Smits; ein vierzehnjähriger Junge, J. van der Donk, kam dort zur Arbeit, übernahm sie in den 1960ern und gab ihr in den 1970ern seinen Namen. Sein Sohn Richard, dritte Generation, führt sie heute mit seiner Frau Gerda in der Zandstraat, zwischen alten Maschinen, die an ein Museum denken lassen und alle in Gebrauch sind.

Die Handbewegung ist die der holländischen Zigarre: Tabake aus Kuba, Brasilien und Indonesien, deren Rippen von Hand entfernt werden; ein Umblatt, von Hand in eine Pedalmaschine gelegt, die Richard mit dem Fuß bedient; ein Deckblatt — das teuerste Blatt, flach geliefert —, von Hand aufgelegt. Der Eintrag beschreibt diese Aufteilung genau, weil die Grenze dieses Atlas zwischen Hand und Maschine verläuft und hier die Hand das Wesentliche tut. Neun Varianten, länger oder kürzer, dicker oder dünner, in rund vierzig Läden des Landes verkauft.

Es gibt keinen Nachfolger: Wenn Richard und Gerda aufhören, wird das Haus enden. Dieser Atlas öffnet die Niederlande als Rollort für diese eine Fabrik, und er tut es, bevor sie schließt.',
        '[{"name":"Van der Donk","color":"#8B5A2B","force":"Mild-Medium","wrapper":"Sumatra oder Brasil","vitolas":[],"story":"Neun Varianten der holländischen Zigarre — Tabake aus Kuba, Brasilien und Indonesien."}]',
        'Van der Donk 是荷兰最后一家仍手工制作雪茄的工厂——一篇手绘报道这样介绍它，词条首先记下这一点。它1919年在库伦堡以 Sigarenfabriek Havana 之名诞生，由 A.W. 斯米茨创立；一个十四岁的男孩 J. 范德东克来此打工，1960年代接手，1970年代冠上自己的名字。其子理查德，第三代，如今与妻子赫尔达在赞德街经营，周围是让人以为置身博物馆、却全都还在用的老机器。

手艺是荷兰雪茄的手艺：古巴、巴西和印尼的烟叶，手工去梗；茄套手工放入理查德脚踏的机器；茄衣——最贵的叶子，平整送达——手工上。词条把这种分工写得精确，因为本图集的界线在手与机器之间，而这里主要靠手。九种规格，或长或短、或粗或细，在全国约四十家店铺出售。

没有接班人：理查德和赫尔达停手之日，公司便告终。本图集为这家工厂把荷兰开辟为卷制之地，而且赶在它关门之前。',
        '[{"name":"Van der Donk","color":"#8B5A2B","force":"Mild-Medium","wrapper":"苏门答腊或巴西","vitolas":[],"story":"荷兰雪茄的九种规格——古巴、巴西和印尼烟叶。"}]',
        'فان دير دونك آخر مصنع في هولندا ما زالت تُصنع فيه السيجارات يدويًّا — هكذا يقدّمه تحقيقٌ مرسوم، وهذا ما تحتفظ به البطاقة أوّلًا. وُلد سنة 1919 في كولمبورغ باسم Sigarenfabriek Havana، أسّسه A.W. سميتس؛ ودخله فتًى في الرابعة عشرة، J. فان دير دونك، للعمل، ثم استلمه في الستينيات وأعطاه اسمه في السبعينيات. ويديره اليوم ابنه ريتشارد، الجيل الثالث، مع زوجته خيردا، في شارع زاندسترات، وسط آلات قديمة توحي بمتحف وكلّها مستعملة.

الحركة حركة السيجار الهولندي: أتبغة من كوبا والبرازيل وإندونيسيا تُنزع عروقها باليد؛ وورقة رابطة توضع باليد في آلة بدوّاسة يديرها ريتشارد بقدمه؛ وغلافٌ — أغلى الأوراق، يُسلَّم مسطّحًا — يوضع باليد. تصف البطاقة هذا التقسيم بدقّة لأنّ حدّ هذا الأطلس يمرّ بين اليد والآلة، وهنا تصنع اليد الجوهر. تسع أشكال، أطول أو أقصر، أغلظ أو أرفع، تُباع في نحو أربعين متجرًا في البلاد.

لا خليفة: حين يتوقّف ريتشارد وخيردا تتوقّف الدار. يفتح هذا الأطلس هولندا مكانَ لفّ لهذا المصنع بعينه، ويفعل ذلك قبل أن يُغلق.',
        '[{"name":"Van der Donk","color":"#8B5A2B","force":"Mild-Medium","wrapper":"سومطرة أو البرازيل","vitolas":[],"story":"تسع أشكال من السيجار الهولندي — أتبغة من كوبا والبرازيل وإندونيسيا."}]')
ON DUPLICATE KEY UPDATE `country_id` = VALUES(`country_id`), `founded` = VALUES(`founded`), `factory` = VALUES(`factory`), `source` = VALUES(`source`), `history` = VALUES(`history`), `gamme` = VALUES(`gamme`), `history_en` = VALUES(`history_en`), `gamme_en` = VALUES(`gamme_en`), `history_es` = VALUES(`history_es`), `gamme_es` = VALUES(`gamme_es`), `history_de` = VALUES(`history_de`), `gamme_de` = VALUES(`gamme_de`), `history_zh` = VALUES(`history_zh`), `gamme_zh` = VALUES(`gamme_zh`), `history_ar` = VALUES(`history_ar`), `gamme_ar` = VALUES(`gamme_ar`);

-- ── Compagnia Toscana Sigari ──

INSERT INTO `brands` (`name`, `country_id`, `founded`, `factory`, `source`, `history`, `gamme`, `history_en`, `gamme_en`, `history_es`, `gamme_es`, `history_de`, `gamme_de`, `history_zh`, `gamme_zh`, `history_ar`, `gamme_ar`)
VALUES ('Compagnia Toscana Sigari',
        'italy',
        '2015 — Sansepolcro ; Gabriele Zippilli',
        'Fabrique propre — Sansepolcro, Toscane ; sigaraie formées en interne',
        'gustotabacco.it « Italian tuscan cigars » et bottegadelfumatore.com « Compagnia Toscana Sigari • storia e informazioni » (fondée à Sansepolcro, en Valtiberina, en 2015 par Gabriele Zippilli, agronome et cultivateur ; Kentucky cultivé et travaillé en Toscane ; Mastro Tornabuoni, la ligne premium, totalement à la main et longfiller ; sigaraie formées par deux maîtresses de plus de trente ans de métier) ; compagniatoscanasigari.it « Chi siamo »',
        'La Compagnia Toscana Sigari est née en 2015 à Sansepolcro, dans la Valtiberina toscane, d''un agronome et cultivateur, Gabriele Zippilli — hors du monopole qui fit le Toscano pendant un siècle et demi, et dont l''atlas raconte l''histoire à la fiche Toscano. C''est le même cigare, le Kentucky séché au feu, cultivé et travaillé en Toscane ; c''est une autre maison, privée, et c''est la première que l''atlas ajoute à l''Italie depuis qu''il l''a ouverte.

Les sigaraie — le métier est féminin en Italie comme à Cuba — sont formées en interne par deux maîtresses de plus de trente ans d''expérience. La ligne premium, Mastro Tornabuoni, est faite totalement à la main, en tripe longue — la maison le dit en espagnol, totalmente a mano, comme la formule cubaine —, ce qui la distingue du Toscano ordinaire, à tripe hachée. La maison se donne pour mission de garder la tradition toscane, et se présente en anglais aux étrangers.

Une maison jeune, sans presse anglophone ; ses sources sont des cavistes italiens et son propre site. La fiche le dit.',
        '[{"name":"Mastro Tornabuoni","color":"#4A3728","force":"Full","wrapper":"Kentucky de Toscane","vitolas":[],"story":"La ligne premium — totalmente a mano, tripe longue, ce qui la distingue du Toscano ordinaire."}]',
        'Compagnia Toscana Sigari was born in 2015 in Sansepolcro, in the Tuscan Valtiberina, from an agronomist and grower, Gabriele Zippilli — outside the monopoly that made the Toscano for a century and a half, whose story this atlas tells at the Toscano entry. It is the same cigar, fire-cured Kentucky grown and worked in Tuscany; it is another house, private, and the first this atlas adds to Italy since opening it.

The sigaraie — the trade is feminine in Italy as in Cuba — are trained in-house by two masters with more than thirty years'' experience. The premium line, Mastro Tornabuoni, is made entirely by hand, long-filler — the house says it in Spanish, totalmente a mano, like the Cuban formula —, which sets it apart from the ordinary Toscano, with its chopped filler. The house gives itself the mission of keeping the Tuscan tradition, and presents itself in English to foreigners.

A young house, without English-language press; its sources are Italian tobacconists and its own site. The entry says so.',
        '[{"name":"Mastro Tornabuoni","color":"#4A3728","force":"Full","wrapper":"Tuscan Kentucky","vitolas":[],"story":"The premium line — totalmente a mano, long-filler, which sets it apart from the ordinary Toscano."}]',
        'La Compagnia Toscana Sigari nació en 2015 en Sansepolcro, en la Valtiberina toscana, de un agrónomo y cultivador, Gabriele Zippilli — fuera del monopolio que hizo el Toscano durante siglo y medio, y cuya historia este atlas cuenta en la ficha Toscano. Es el mismo puro, el Kentucky curado al fuego, cultivado y trabajado en Toscana; es otra casa, privada, y es la primera que este atlas añade a Italia desde que la abrió.

Las sigaraie — el oficio es femenino en Italia como en Cuba — se forman en la empresa con dos maestras de más de treinta años de experiencia. La línea premium, Mastro Tornabuoni, se hace totalmente a mano, de tripa larga — la casa lo dice en español, totalmente a mano, como la fórmula cubana —, lo que la distingue del Toscano corriente, de tripa picada. La casa se da por misión guardar la tradición toscana, y se presenta en inglés a los extranjeros.

Una casa joven, sin prensa anglófona; sus fuentes son estanqueros italianos y su propio sitio. La ficha lo dice.',
        '[{"name":"Mastro Tornabuoni","color":"#4A3728","force":"Full","wrapper":"Kentucky de Toscana","vitolas":[],"story":"La línea premium — totalmente a mano, tripa larga, lo que la distingue del Toscano corriente."}]',
        'Die Compagnia Toscana Sigari entstand 2015 in Sansepolcro, in der toskanischen Valtiberina, aus einem Agronomen und Pflanzer, Gabriele Zippilli — außerhalb des Monopols, das den Toscano anderthalb Jahrhunderte lang machte und dessen Geschichte dieser Atlas im Eintrag Toscano erzählt. Es ist dieselbe Zigarre, feuergetrockneter Kentucky, in der Toskana angebaut und verarbeitet; es ist ein anderes, privates Haus, und das erste, das dieser Atlas Italien seit dessen Öffnung hinzufügt.

Die Sigaraie — der Beruf ist in Italien wie auf Kuba weiblich — werden intern von zwei Meisterinnen mit über dreißig Jahren Erfahrung ausgebildet. Die Premiumlinie, Mastro Tornabuoni, wird vollständig von Hand gemacht, als Longfiller — das Haus sagt es auf Spanisch, totalmente a mano, wie die kubanische Formel —, was sie vom gewöhnlichen Toscano mit gehackter Einlage unterscheidet. Das Haus gibt sich die Aufgabe, die toskanische Tradition zu bewahren, und stellt sich Ausländern auf Englisch vor.

Ein junges Haus ohne englischsprachige Presse; seine Quellen sind italienische Tabakhändler und seine eigene Seite. Der Eintrag sagt es.',
        '[{"name":"Mastro Tornabuoni","color":"#4A3728","force":"Full","wrapper":"Toskanischer Kentucky","vitolas":[],"story":"Die Premiumlinie — totalmente a mano, Longfiller, was sie vom gewöhnlichen Toscano unterscheidet."}]',
        'Compagnia Toscana Sigari 2015年诞生于托斯卡纳瓦尔蒂贝里纳的圣塞波尔克罗，创始人是农学家兼种植者加布里埃莱·齐皮利——处在那个一个半世纪以来制作 Toscano 的专卖体制之外，本图集在 Toscano 词条讲过其历史。这是同一种雪茄，在托斯卡纳种植和加工的烟熏干燥肯塔基烟叶；却是另一家私人公司，也是本图集开辟意大利以来第一次添加的意大利公司。

女制茄工——这个行当在意大利和古巴一样属于女性——由两位三十多年经验的女师傅在厂内培训。优质线 Mastro Tornabuoni 完全手工制作、长填充——公司用西班牙语说 totalmente a mano，如古巴的用语——这使它区别于切碎填充的普通 Toscano。公司以守护托斯卡纳传统为使命，用英语面向外国人介绍自己。

一家年轻的公司，没有英语媒体；来源是意大利烟草商和它自己的网站。词条如实说明。',
        '[{"name":"Mastro Tornabuoni","color":"#4A3728","force":"Full","wrapper":"托斯卡纳肯塔基","vitolas":[],"story":"优质线——totalmente a mano，长填充，有别于普通 Toscano。"}]',
        'وُلدت Compagnia Toscana Sigari سنة 2015 في سانسيبولكرو، في فالتيبيرينا التوسكانية، على يد مهندس زراعي ومزارع، غابرييلي زيبيلي — خارج الاحتكار الذي صنع Toscano طوال قرن ونصف، والذي يروي هذا الأطلس تاريخه في بطاقة Toscano. إنّه السيجار نفسه، كنتاكي مجفَّف بالنار مزروع ومعالج في توسكانا؛ لكنّها دار أخرى، خاصّة، وهي أوّل ما يضيفه هذا الأطلس إلى إيطاليا منذ فتحها.

تُدرَّب صانعات السيجار — المهنة مؤنّثة في إيطاليا كما في كوبا — داخل الشركة على يد معلّمتين تزيد خبرتهما على ثلاثين سنة. والخطّ الفاخر، Mastro Tornabuoni، يُصنع يدويًّا بالكامل وبحشوة طويلة — تقولها الدار بالإسبانية، totalmente a mano، كالصيغة الكوبية — وهو ما يميّزه عن Toscano العادي ذي الحشوة المفرومة. تتّخذ الدار الحفاظ على التقليد التوسكاني رسالةً، وتقدّم نفسها للأجانب بالإنجليزية.

دارٌ فتيّة بلا صحافة أنجلوفونية؛ مصادرها باعة تبغ إيطاليون وموقعها. تقول البطاقة ذلك.',
        '[{"name":"Mastro Tornabuoni","color":"#4A3728","force":"Full","wrapper":"كنتاكي توسكاني","vitolas":[],"story":"الخطّ الفاخر — totalmente a mano، حشوة طويلة، ما يميّزه عن Toscano العادي."}]')
ON DUPLICATE KEY UPDATE `country_id` = VALUES(`country_id`), `founded` = VALUES(`founded`), `factory` = VALUES(`factory`), `source` = VALUES(`source`), `history` = VALUES(`history`), `gamme` = VALUES(`gamme`), `history_en` = VALUES(`history_en`), `gamme_en` = VALUES(`gamme_en`), `history_es` = VALUES(`history_es`), `gamme_es` = VALUES(`gamme_es`), `history_de` = VALUES(`history_de`), `gamme_de` = VALUES(`gamme_de`), `history_zh` = VALUES(`history_zh`), `gamme_zh` = VALUES(`gamme_zh`), `history_ar` = VALUES(`history_ar`), `gamme_ar` = VALUES(`gamme_ar`);

-- ── MOSI ──

INSERT INTO `brands` (`name`, `country_id`, `founded`, `factory`, `source`, `history`, `gamme`, `history_en`, `gamme_en`, `history_es`, `gamme_es`, `history_de`, `gamme_de`, `history_zh`, `gamme_zh`, `history_ar`, `gamme_ar`)
VALUES ('MOSI',
        'italy',
        '2013 — Orsago (Trévise) ; STG depuis 2021',
        'Fabrique propre — Orsago, Vénétie, en activité depuis le 3 février 2014',
        'ilnordest.it « I sigari della trevigiana Mosi rompono il monopolio toscano » et bottegadelfumatore.com « Moderno Opificio del Sigaro Italiano » (fondé en 2013 par Cesare Pietrella ; fabrique à Orsago, province de Trévise, production commencée le 3 février 2014 après les procédures ; Ambasciator Italico, de Kentucky italien et américain ; une production surtout de machine, et une ligne Storico roulée à la main en tripe longue de Kentucky italien de Vénétie et de Toscane, feuilles écotées à la main) ; globenewswire.com « Scandinavian Tobacco Group A/S acquires majority stake in Italian cigar company » (18 novembre 2021) ; mosi.it ; dalmoroshop.com',
        'MOSI — Moderno Opificio del Sigaro Italiano — est la maison qui a rompu, en Vénétie, le monopole toscan du cigare italien. Cesare Pietrella l''a fondée en 2013 ; la fabrique d''Orsago, dans la province de Trévise, a commencé à produire le 3 février 2014, une fois les procédures passées — car en Italie le tabac est une affaire d''État, et faire un cigare hors du Toscano ne va pas de soi. Sa marque, Ambasciator Italico, est faite de Kentucky italien et américain.

L''atlas ne porte pas ce que la maison fait surtout : des cigares de machine, dans la tradition italienne. Il porte l''Ambasciator Italico Storico, roulé à la main, en tripe longue de Kentucky italien de Vénétie et de Toscane, dont les feuilles sont écotées à la main — c''est cette ligne, et elle seule, qui vaut la fiche, comme le roulé main vaut celle de Villiger ou de Pogar.

En novembre 2021, Scandinavian Tobacco Group a pris la majorité de MOSI : le groupe danois qui possède déjà General Cigar, Bolívar Honduras, Balmoral et Agio dans cet atlas s''est offert le cigare italien hors monopole. La fiche le dit, parce que c''est désormais la même maison mère que la moitié des machines d''Europe.',
        '[{"name":"Ambasciator Italico Storico","color":"#4A3728","force":"Full","wrapper":"Kentucky italien","vitolas":[],"story":"Roulé à la main, tripe longue de Kentucky de Vénétie et de Toscane, feuilles écotées à la main — la seule ligne que l''atlas porte."}]',
        'MOSI — Moderno Opificio del Sigaro Italiano — is the house that broke, in Veneto, the Tuscan monopoly of the Italian cigar. Cesare Pietrella founded it in 2013; the Orsago factory, in the province of Treviso, began producing on 3 February 2014, once the procedures were through — for in Italy tobacco is a state matter, and making a cigar outside the Toscano is not straightforward. Its brand, Ambasciator Italico, is made of Italian and American Kentucky.

This atlas does not carry what the house mostly makes: machine cigars, in the Italian tradition. It carries the Ambasciator Italico Storico, hand-rolled, with a long filler of Italian Kentucky from Veneto and Tuscany, its leaves de-stemmed by hand — it is that line, and that line alone, that earns the entry, as the hand-rolled earns Villiger''s or Pogar''s.

In November 2021, Scandinavian Tobacco Group took a majority of MOSI: the Danish group that already owns General Cigar, Bolívar Honduras, Balmoral and Agio in this atlas bought itself the Italian cigar outside the monopoly. The entry says so, because it is now the same parent as half of Europe''s machines.',
        '[{"name":"Ambasciator Italico Storico","color":"#4A3728","force":"Full","wrapper":"Italian Kentucky","vitolas":[],"story":"Hand-rolled, long filler of Kentucky from Veneto and Tuscany, leaves de-stemmed by hand — the only line this atlas carries."}]',
        'MOSI — Moderno Opificio del Sigaro Italiano — es la casa que rompió, en el Véneto, el monopolio toscano del puro italiano. Cesare Pietrella la fundó en 2013; la fábrica de Orsago, en la provincia de Treviso, empezó a producir el 3 de febrero de 2014, pasados los trámites — porque en Italia el tabaco es asunto de Estado, y hacer un puro fuera del Toscano no es evidente. Su marca, Ambasciator Italico, se hace con Kentucky italiano y estadounidense.

Este atlas no recoge lo que la casa hace sobre todo: puros de máquina, en la tradición italiana. Recoge el Ambasciator Italico Storico, liado a mano, con tripa larga de Kentucky italiano del Véneto y de Toscana, con hojas desvenadas a mano — es esa línea, y solo ella, la que vale la ficha, como el liado a mano vale la de Villiger o la de Pogar.

En noviembre de 2021, Scandinavian Tobacco Group tomó la mayoría de MOSI: el grupo danés que ya posee General Cigar, Bolívar Honduras, Balmoral y Agio en este atlas se compró el puro italiano fuera del monopolio. La ficha lo dice, porque ahora es la misma casa matriz que la mitad de las máquinas de Europa.',
        '[{"name":"Ambasciator Italico Storico","color":"#4A3728","force":"Full","wrapper":"Kentucky italiano","vitolas":[],"story":"Liado a mano, tripa larga de Kentucky del Véneto y de Toscana, hojas desvenadas a mano — la única línea que recoge este atlas."}]',
        'MOSI — Moderno Opificio del Sigaro Italiano — ist das Haus, das im Veneto das toskanische Monopol der italienischen Zigarre brach. Cesare Pietrella gründete es 2013; die Fabrik in Orsago, Provinz Treviso, begann am 3. Februar 2014 zu produzieren, nachdem die Verfahren durch waren — denn in Italien ist Tabak Staatssache, und eine Zigarre außerhalb des Toscano zu machen, versteht sich nicht von selbst. Seine Marke, Ambasciator Italico, besteht aus italienischem und amerikanischem Kentucky.

Dieser Atlas führt nicht, was das Haus vor allem macht: Maschinenzigarren in italienischer Tradition. Er führt den Ambasciator Italico Storico, handgerollt, mit langer Einlage aus italienischem Kentucky aus Venetien und der Toskana, dessen Blätter von Hand entrippt werden — diese Linie, und sie allein, verdient den Eintrag, wie das Handgerollte den von Villiger oder Pogar verdient.

Im November 2021 übernahm die Scandinavian Tobacco Group die Mehrheit an MOSI: Der dänische Konzern, dem in diesem Atlas bereits General Cigar, Bolívar Honduras, Balmoral und Agio gehören, kaufte sich die italienische Zigarre außerhalb des Monopols. Der Eintrag sagt es, weil es nun dieselbe Mutter ist wie die halber Maschinen Europas.',
        '[{"name":"Ambasciator Italico Storico","color":"#4A3728","force":"Full","wrapper":"Italienischer Kentucky","vitolas":[],"story":"Handgerollt, lange Einlage aus Kentucky aus Venetien und der Toskana, Blätter von Hand entrippt — die einzige Linie, die dieser Atlas führt."}]',
        'MOSI——Moderno Opificio del Sigaro Italiano——是在威尼托打破意大利雪茄托斯卡纳专卖的公司。切萨雷·彼得雷拉2013年创立；特雷维索省奥尔萨戈的工厂在手续办妥后于2014年2月3日投产——因为在意大利，烟草是国家事务，在 Toscano 之外做雪茄并非理所当然。其品牌 Ambasciator Italico 用意大利和美国肯塔基烟叶制成。

本图集不收录这家公司的主要产品：意大利传统的机制雪茄。它收录的是手工卷制的 Ambasciator Italico Storico，用威尼托和托斯卡纳的意大利肯塔基长填充，烟叶手工去梗——正是这条线、也只有这条线，才值得词条，如同手工卷制的部分成就了 Villiger 或 Pogar 的词条。

2021年11月，斯堪的纳维亚烟草集团取得 MOSI 的多数股权：这个在本图集中已拥有 General Cigar、Bolívar Honduras、Balmoral 和 Agio 的丹麦集团，把专卖之外的意大利雪茄收入囊中。词条说出这一点，因为它如今与欧洲一半的机制雪茄同属一个母公司。',
        '[{"name":"Ambasciator Italico Storico","color":"#4A3728","force":"Full","wrapper":"意大利肯塔基","vitolas":[],"story":"手工卷制，威尼托和托斯卡纳肯塔基长填充，烟叶手工去梗——本图集收录的唯一一线。"}]',
        'MOSI — Moderno Opificio del Sigaro Italiano — الدار التي كسرت، في فينيتو، الاحتكار التوسكاني للسيجار الإيطالي. أسّسها تشيزاري بييتريلا سنة 2013؛ وبدأ مصنع أورساغو، في مقاطعة تريفيزو، الإنتاج في 3 شباط/فبراير 2014 بعد اجتياز الإجراءات — لأنّ التبغ في إيطاليا شأنُ دولة، وصنع سيجار خارج Toscano ليس بديهيًّا. علامتها، Ambasciator Italico، من كنتاكي إيطالي وأمريكي.

لا يحمل هذا الأطلس ما تصنعه الدار في الغالب: سيجارات آلية على التقليد الإيطالي. بل يحمل Ambasciator Italico Storico، المُلفوف يدويًّا، بحشوة طويلة من كنتاكي إيطالي من فينيتو وتوسكانا، تُنزع عروق أوراقه باليد — هذا الخطّ، وحده، يستحقّ البطاقة، كما يستحقّ المُلفوف يدويًّا بطاقة Villiger أو Pogar.

وفي تشرين الثاني/نوفمبر 2021 أخذت Scandinavian Tobacco Group أغلبية MOSI: المجموعة الدنماركية التي تملك في هذا الأطلس General Cigar وBolívar Honduras وBalmoral وAgio اشترت لنفسها السيجار الإيطالي خارج الاحتكار. تقول البطاقة ذلك لأنّها صارت الآن الشركة الأمّ نفسها لنصف آلات أوروبا.',
        '[{"name":"Ambasciator Italico Storico","color":"#4A3728","force":"Full","wrapper":"كنتاكي إيطالي","vitolas":[],"story":"مُلفوف يدويًّا، حشوة طويلة من كنتاكي فينيتو وتوسكانا، أوراق منزوعة العروق باليد — الخطّ الوحيد الذي يحمله هذا الأطلس."}]')
ON DUPLICATE KEY UPDATE `country_id` = VALUES(`country_id`), `founded` = VALUES(`founded`), `factory` = VALUES(`factory`), `source` = VALUES(`source`), `history` = VALUES(`history`), `gamme` = VALUES(`gamme`), `history_en` = VALUES(`history_en`), `gamme_en` = VALUES(`gamme_en`), `history_es` = VALUES(`history_es`), `gamme_es` = VALUES(`gamme_es`), `history_de` = VALUES(`history_de`), `gamme_de` = VALUES(`gamme_de`), `history_zh` = VALUES(`history_zh`), `gamme_zh` = VALUES(`gamme_zh`), `history_ar` = VALUES(`history_ar`), `gamme_ar` = VALUES(`gamme_ar`);

-- ── Siglo de Oro ──

INSERT INTO `brands` (`name`, `country_id`, `founded`, `factory`, `source`, `history`, `gamme`, `history_en`, `gamme_en`, `history_es`, `gamme_es`, `history_de`, `gamme_de`, `history_zh`, `gamme_zh`, `history_ar`, `gamme_ar`)
VALUES ('Siglo de Oro',
        'russia',
        '2011 — Moscou ; Artur Chiliaev',
        'Fabrique propre à Moscou — cinq à six torcedores cubains et nicaraguayens',
        'cigarinfo.ru « Из России с любовью » (16 juin 2021 : dix ans de fabrique à Moscou ; Artur Chiliaev, ancien entrepreneur du bâtiment, fondateur et second associé, Andreï Ivanov l''autre ; environ 350 000 cigares par an, vendus seulement en Russie, où 2,5 millions de cigares ont été fumés en 2020 ; cinq à six torcedores, tous venus du Nicaragua et de Cuba ; cinq lignes et trente-trois vitoles, assemblées par Chiliaev, qui va chercher lui-même le tabac à Cuba et au Nicaragua ; grande cave de vieillissement, quatre mois au moins) ; cigarday.ru « Российские сигарные бренды » (31 juillet 2025 : marques Евгений Онегин, Siglo de Oro, Pelo de Oro, Hidalgo, Чортова Дюжина ; tabacs de Rép. dominicaine, du Nicaragua et de Cuba) ; siglodeoro.ru',
        'Siglo de Oro est une fabrique de cigares à Moscou — la phrase suffit à dire pourquoi la fiche existe. Artur Chiliaev, qui avait dirigé une entreprise du bâtiment et que son associé décrit comme né un cigare à la bouche, l''a ouverte en 2011 avec Andreï Ivanov. Cinq à six torcedores y travaillent, tous venus de Cuba et du Nicaragua ; Chiliaev va lui-même acheter le tabac à Cuba, au Nicaragua, en République dominicaine, et compose les cinq lignes et les trente-trois vitoles de la maison. Une grande cave garde les cigares au moins quatre mois, et plus s''il les juge trop jeunes.

La production tourne autour de trois cent cinquante mille cigares par an, vendus uniquement en Russie — un marché qui fumait environ deux millions et demi de cigares en 2020. Les marques racontent le pays : Evgueni Onéguine, le héros de Pouchkine, en tête ; Siglo de Oro, Pelo de Oro et Hidalgo en espagnol ; Tchortova Dioujina, la douzaine du diable. L''atlas ouvre la Russie comme lieu de roulage pour cette maison et pour Pogar, sans champs ni variété : tout le tabac vient d''ailleurs.

La presse du métier anglophone l''ignore ; la presse russe du cigare la suit depuis dix ans, et c''est elle que la fiche cite.',
        '[{"name":"Evgueni Onéguine","color":"#8B2323","force":"Medium-Full","wrapper":"Non divulguée","vitolas":[],"story":"Le héros de Pouchkine sur une bague — la ligne de tête de la fabrique."},{"name":"Siglo de Oro","color":"#C9A96E","force":"Medium","wrapper":"Non divulguée","vitolas":[],"story":"Le siècle d''or, en espagnol, sur un cigare moscovite."}]',
        'Siglo de Oro is a cigar factory in Moscow — the sentence is enough to say why the entry exists. Artur Shilyaev, who had run a construction company and, his partner says, was born with a cigar in his mouth, opened it in 2011 with Andrey Ivanov. Five to six rollers work there, all from Cuba and Nicaragua; Shilyaev himself goes to buy the tobacco in Cuba, Nicaragua and the Dominican Republic, and composes the house''s five lines and thirty-three vitolas. A large cellar keeps the cigars at least four months, and longer if he judges them too young.

Production runs around three hundred and fifty thousand cigars a year, sold only in Russia — a market that smoked about two and a half million cigars in 2020. The brands tell the country: Evgeny Onegin, Pushkin''s hero, first; Siglo de Oro, Pelo de Oro and Hidalgo in Spanish; Chortova Dyuzhina, the devil''s dozen. This atlas opens Russia as a rolling place for this house and for Pogar, without fields or variety: all the tobacco comes from elsewhere.

The English-language trade press ignores it; the Russian cigar press has followed it for ten years, and that is what the entry cites.',
        '[{"name":"Evgueni Onéguine","color":"#8B2323","force":"Medium-Full","wrapper":"Undisclosed","vitolas":[],"story":"Pushkin''s hero on a band — the factory''s lead line."},{"name":"Siglo de Oro","color":"#C9A96E","force":"Medium","wrapper":"Undisclosed","vitolas":[],"story":"The golden century, in Spanish, on a Moscow cigar."}]',
        'Siglo de Oro es una fábrica de puros en Moscú — la frase basta para decir por qué existe la ficha. Artur Shiliaev, que había dirigido una empresa de construcción y, dice su socio, nació con un puro en la boca, la abrió en 2011 con Andréi Ivanov. Cinco o seis torcedores trabajan allí, todos venidos de Cuba y Nicaragua; Shiliaev va él mismo a comprar el tabaco a Cuba, Nicaragua y República Dominicana, y compone las cinco líneas y las treinta y tres vitolas de la casa. Una gran bodega guarda los puros al menos cuatro meses, y más si los juzga demasiado jóvenes.

La producción ronda los trescientos cincuenta mil puros al año, vendidos únicamente en Rusia — un mercado que fumaba unos dos millones y medio de puros en 2020. Las marcas cuentan el país: Eugenio Oneguin, el héroe de Pushkin, primero; Siglo de Oro, Pelo de Oro e Hidalgo en español; Chórtova Diúzhina, la docena del diablo. Este atlas abre Rusia como lugar de liado para esta casa y para Pogar, sin campos ni variedad: todo el tabaco viene de otra parte.

La prensa del oficio anglófona la ignora; la prensa rusa del puro la sigue desde hace diez años, y es a ella a quien la ficha cita.',
        '[{"name":"Evgueni Onéguine","color":"#8B2323","force":"Medium-Full","wrapper":"No divulgada","vitolas":[],"story":"El héroe de Pushkin en una anilla — la línea principal de la fábrica."},{"name":"Siglo de Oro","color":"#C9A96E","force":"Medium","wrapper":"No divulgada","vitolas":[],"story":"El siglo de oro, en español, en un puro moscovita."}]',
        'Siglo de Oro ist eine Zigarrenfabrik in Moskau — der Satz genügt, um zu sagen, warum der Eintrag existiert. Artur Schiljajew, der ein Bauunternehmen geführt hatte und, wie sein Partner sagt, mit einer Zigarre im Mund geboren wurde, eröffnete sie 2011 mit Andrej Iwanow. Fünf bis sechs Torcedores arbeiten dort, alle aus Kuba und Nicaragua; Schiljajew kauft den Tabak selbst in Kuba, Nicaragua und der Dominikanischen Republik und komponiert die fünf Linien und dreiunddreißig Vitolas des Hauses. Ein großer Keller lagert die Zigarren mindestens vier Monate, und länger, wenn er sie für zu jung hält.

Die Produktion liegt um dreihundertfünfzigtausend Zigarren im Jahr, nur in Russland verkauft — ein Markt, der 2020 etwa zweieinhalb Millionen Zigarren rauchte. Die Marken erzählen das Land: Jewgeni Onegin, Puschkins Held, zuerst; Siglo de Oro, Pelo de Oro und Hidalgo auf Spanisch; Tschortowa Djuschina, das Teufelsdutzend. Dieser Atlas öffnet Russland als Rollort für dieses Haus und für Pogar, ohne Felder oder Sorte: Aller Tabak kommt von anderswo.

Die englischsprachige Fachpresse ignoriert es; die russische Zigarrenpresse begleitet es seit zehn Jahren, und sie zitiert der Eintrag.',
        '[{"name":"Evgueni Onéguine","color":"#8B2323","force":"Medium-Full","wrapper":"Nicht angegeben","vitolas":[],"story":"Puschkins Held auf einer Bauchbinde — die Hauptlinie der Fabrik."},{"name":"Siglo de Oro","color":"#C9A96E","force":"Medium","wrapper":"Nicht angegeben","vitolas":[],"story":"Das goldene Jahrhundert, auf Spanisch, auf einer Moskauer Zigarre."}]',
        'Siglo de Oro 是莫斯科的一家雪茄工厂——这一句就足以说明词条为何存在。曾经营建筑公司、据合伙人说「生下来嘴里就叼着雪茄」的阿尔图尔·希利亚耶夫，2011年与安德烈·伊万诺夫开办了它。五六位卷工在此工作，全部来自古巴和尼加拉瓜；希利亚耶夫亲自到古巴、尼加拉瓜和多米尼加采购烟叶，调配公司的五个系列、三十三种尺寸。一间大陈化室让雪茄至少存放四个月，他觉得太年轻就存更久。

年产约三十五万支，只在俄罗斯销售——这个市场2020年约消费二百五十万支。品牌讲述这个国家：普希金笔下的叶甫盖尼·奥涅金居首；Siglo de Oro、Pelo de Oro 和 Hidalgo 是西班牙语；「魔鬼的一打」。本图集为这家公司和波加尔把俄罗斯列为卷制之地，不设田地与品种：所有烟叶来自别处。

英语行业媒体对它视而不见；俄罗斯雪茄媒体追踪它十年，词条引用的正是后者。',
        '[{"name":"Evgueni Onéguine","color":"#8B2323","force":"Medium-Full","wrapper":"未公开","vitolas":[],"story":"茄标上的普希金笔下人物——工厂的主打系列。"},{"name":"Siglo de Oro","color":"#C9A96E","force":"Medium","wrapper":"未公开","vitolas":[],"story":"西班牙语的「黄金世纪」，印在一支莫斯科雪茄上。"}]',
        'Siglo de Oro مصنعُ سيجار في موسكو — تكفي الجملة لتقول لِمَ توجد البطاقة. افتتحه سنة 2011 أرتور شيليايف، الذي كان يدير شركة بناء و«وُلد والسيجار في فمه» كما يقول شريكه، مع أندريه إيفانوف. يعمل فيه خمسة إلى ستّة لفّافين، كلّهم من كوبا ونيكاراغوا؛ ويذهب شيليايف بنفسه لشراء التبغ في كوبا ونيكاراغوا وجمهورية الدومينيكان، ويركّب خطوط الدار الخمسة وفيتولاتها الثلاث والثلاثين. ويحفظ قبوٌ كبير السيجارات مدّة أربعة شهور على الأقلّ، وأكثر إن رآها فتيّة.

يدور الإنتاج حول ثلاثمئة وخمسين ألف سيجار في السنة، تُباع في روسيا وحدها — سوقٌ دخّنت نحو مليونين ونصف مليون سيجار سنة 2020. تروي العلامات البلد: يفغيني أونيغين، بطل بوشكين، في المقدّمة؛ وSiglo de Oro وPelo de Oro وHidalgo بالإسبانية؛ ودزّينة الشيطان. يفتح هذا الأطلس روسيا مكانَ لفّ لهذه الدار ولبوغار، بلا حقول ولا صنف: كلّ التبغ يأتي من مكان آخر.

تتجاهلها صحافة المهنة الأنجلوفونية؛ وتتابعها صحافة السيجار الروسية منذ عشر سنين، وإيّاها تستشهد البطاقة.',
        '[{"name":"Evgueni Onéguine","color":"#8B2323","force":"Medium-Full","wrapper":"غير معلن","vitolas":[],"story":"بطل بوشكين على حزام — الخطّ الرئيسي للمصنع."},{"name":"Siglo de Oro","color":"#C9A96E","force":"Medium","wrapper":"غير معلن","vitolas":[],"story":"القرن الذهبي، بالإسبانية، على سيجار موسكوفي."}]')
ON DUPLICATE KEY UPDATE `country_id` = VALUES(`country_id`), `founded` = VALUES(`founded`), `factory` = VALUES(`factory`), `source` = VALUES(`source`), `history` = VALUES(`history`), `gamme` = VALUES(`gamme`), `history_en` = VALUES(`history_en`), `gamme_en` = VALUES(`gamme_en`), `history_es` = VALUES(`history_es`), `gamme_es` = VALUES(`gamme_es`), `history_de` = VALUES(`history_de`), `gamme_de` = VALUES(`gamme_de`), `history_zh` = VALUES(`history_zh`), `gamme_zh` = VALUES(`gamme_zh`), `history_ar` = VALUES(`history_ar`), `gamme_ar` = VALUES(`gamme_ar`);

-- ── Pogar ──

INSERT INTO `brands` (`name`, `country_id`, `founded`, `factory`, `source`, `history`, `gamme`, `history_en`, `gamme_en`, `history_es`, `gamme_es`, `history_de`, `gamme_de`, `history_zh`, `gamme_zh`, `history_ar`, `gamme_ar`)
VALUES ('Pogar',
        'russia',
        '1915 — Pogar (Briansk), sur un site de 1839',
        'Fabrique propre — Погарская фабрика, Pogar, oblast de Briansk ; tout se fait sur place sauf la culture',
        'cigarday.ru « Российские сигарные бренды » (31 juillet 2025 : entreprise ouverte en 1839, la Fabrique de tabac de Pogar depuis 1915 ; tabacs autrefois cultivés dans l''Empire russe, aujourd''hui venus des Caraïbes ; marques XO, Aroma Cubana, Достоевскiй) ; cigarpro.ru « Сигары Погарской Фабрики » (le plus grand producteur de cigares roulés main de Russie, dit le détaillant ; tous les procédés sauf la culture se font dans la fabrique ; après la révolution et la guerre, les plantations disparaissent et la fabrique fait du bon marché avant de revenir au cigare ; tabacs de Cuba, de Rép. dominicaine, du Brésil et du Nicaragua ; plusieurs lignes, dont des aromatisées et des cigares de machine, et des cigares d''élite roulés par ses torcedores)',
        'Pogar est une petite ville de l''oblast de Briansk, à l''ouest de la Russie, et sa fabrique de tabac est l''une des plus anciennes du pays : une entreprise y est ouverte en 1839, et la Fabrique de tabac de Pogar existe sous ce nom depuis 1915. Le tabac était alors cultivé dans l''Empire russe. Après la révolution, puis la guerre, les plantations ont disparu et la fabrique a survécu en faisant du bon marché ; elle est revenue au cigare plus tard, avec des feuilles achetées à Cuba, en République dominicaine, au Brésil et au Nicaragua, et tout se fait sur place sauf la culture.

L''atlas ne porte pas ce que Pogar fait en volume — des cigares de machine, des aromatisés, une gamme de prix bas — mais ce qu''elle fait à la main : des cigares roulés par ses torcedores, qu''un détaillant russe donne pour la plus grande production de roulé main du pays. La fiche le rapporte à ce détaillant. Les marques disent l''époque et le lieu : XO, Aroma Cubana, et Dostoïevski, écrit avec l''orthographe d''avant 1918.

Avec Siglo de Oro, c''est la seconde fabrique qui fait entrer la Russie dans cet atlas comme lieu de roulage. Elle n''a pas de presse anglophone ; elle a un siècle.',
        '[{"name":"Dostoïevski","color":"#4A3728","force":"Medium-Full","wrapper":"Non divulguée","vitolas":[],"story":"Dostoïevski, écrit sur la bague avec l''orthographe d''avant 1918 — la ligne main de la fabrique."},{"name":"XO","color":"#8B5A2B","force":"Medium","wrapper":"Non divulguée","vitolas":[],"story":"En tubes individuels, à prix contenu."}]',
        'Pogar is a small town in Bryansk oblast, in western Russia, and its tobacco factory is one of the oldest in the country: an enterprise opened there in 1839, and the Pogar Tobacco Factory has existed under that name since 1915. The tobacco was then grown in the Russian Empire. After the revolution, then the war, the plantations disappeared and the factory survived by making cheap goods; it returned to cigars later, with leaf bought in Cuba, the Dominican Republic, Brazil and Nicaragua, and everything is done on site except growing.

This atlas does not carry what Pogar makes in volume — machine cigars, flavoured ones, a low-price range — but what it makes by hand: cigars rolled by its torcedores, which a Russian retailer gives as the country''s largest hand-rolled production. The entry attributes that to the retailer. The brands say the era and the place: XO, Aroma Cubana, and Dostoevsky, spelled in the pre-1918 orthography.

With Siglo de Oro, it is the second factory that brings Russia into this atlas as a rolling place. It has no English-language press; it has a century.',
        '[{"name":"Dostoïevski","color":"#4A3728","force":"Medium-Full","wrapper":"Undisclosed","vitolas":[],"story":"Dostoevsky, written on the band in the pre-1918 spelling — the factory''s hand-rolled line."},{"name":"XO","color":"#8B5A2B","force":"Medium","wrapper":"Undisclosed","vitolas":[],"story":"In single tubes, at a moderate price."}]',
        'Pogar es una pequeña ciudad del óblast de Briansk, en el oeste de Rusia, y su fábrica de tabaco es una de las más antiguas del país: una empresa abrió allí en 1839, y la Fábrica de tabaco de Pogar existe con ese nombre desde 1915. El tabaco se cultivaba entonces en el Imperio ruso. Tras la revolución, y luego la guerra, las plantaciones desaparecieron y la fábrica sobrevivió haciendo barato; volvió al puro más tarde, con hojas compradas en Cuba, República Dominicana, Brasil y Nicaragua, y todo se hace allí salvo el cultivo.

Este atlas no recoge lo que Pogar hace en volumen — puros de máquina, aromatizados, una gama de precio bajo — sino lo que hace a mano: puros liados por sus torcedores, que un minorista ruso da como la mayor producción de liado a mano del país. La ficha lo atribuye al minorista. Las marcas dicen la época y el lugar: XO, Aroma Cubana y Dostoievski, escrito con la ortografía anterior a 1918.

Con Siglo de Oro, es la segunda fábrica que hace entrar a Rusia en este atlas como lugar de liado. No tiene prensa anglófona; tiene un siglo.',
        '[{"name":"Dostoïevski","color":"#4A3728","force":"Medium-Full","wrapper":"No divulgada","vitolas":[],"story":"Dostoievski, escrito en la anilla con la ortografía anterior a 1918 — la línea a mano de la fábrica."},{"name":"XO","color":"#8B5A2B","force":"Medium","wrapper":"No divulgada","vitolas":[],"story":"En tubos individuales, a precio contenido."}]',
        'Pogar ist eine Kleinstadt im Oblast Brjansk im Westen Russlands, und ihre Tabakfabrik ist eine der ältesten des Landes: 1839 wurde dort ein Betrieb eröffnet, und die Tabakfabrik Pogar besteht unter diesem Namen seit 1915. Der Tabak wurde damals im Russischen Reich angebaut. Nach der Revolution und dann dem Krieg verschwanden die Plantagen, und die Fabrik überlebte mit Billigware; später kehrte sie zur Zigarre zurück, mit Blättern aus Kuba, der Dominikanischen Republik, Brasilien und Nicaragua, und alles außer dem Anbau geschieht vor Ort.

Dieser Atlas führt nicht, was Pogar in Menge macht — Maschinenzigarren, aromatisierte, ein Niedrigpreissortiment —, sondern was es von Hand macht: von seinen Torcedores gerollte Zigarren, die ein russischer Händler als größte Handrollproduktion des Landes bezeichnet. Der Eintrag schreibt das dem Händler zu. Die Marken sagen Epoche und Ort: XO, Aroma Cubana und Dostojewski, in der Schreibung von vor 1918.

Mit Siglo de Oro ist es die zweite Fabrik, die Russland als Rollort in diesen Atlas bringt. Sie hat keine englischsprachige Presse; sie hat ein Jahrhundert.',
        '[{"name":"Dostoïevski","color":"#4A3728","force":"Medium-Full","wrapper":"Nicht angegeben","vitolas":[],"story":"Dostojewski, auf der Banderole in der Schreibung von vor 1918 — die handgerollte Linie der Fabrik."},{"name":"XO","color":"#8B5A2B","force":"Medium","wrapper":"Nicht angegeben","vitolas":[],"story":"In Einzeltuben, zu moderatem Preis."}]',
        '波加尔是俄罗斯西部布良斯克州的一座小城，它的烟草厂是该国老厂之一：1839年有企业在此开业，波加尔烟草厂自1915年起以此名存在。当时烟草种在俄罗斯帝国境内。革命之后、战争之后，种植园消失，工厂靠廉价产品幸存；后来重返雪茄，烟叶购自古巴、多米尼加、巴西和尼加拉瓜，除种植外一切在厂内完成。

本图集不收录波加尔的走量产品——机制雪茄、加香雪茄、低价系列——只收录它的手工产品：由自家卷工卷制的雪茄，一家俄罗斯零售商称之为该国规模最大的手工卷制。词条把这一说法归于该零售商。品牌道出时代与地点：XO、Aroma Cubana，以及用1918年之前旧正字法书写的「陀思妥耶夫斯基」。

与 Siglo de Oro 一起，它是让俄罗斯以卷制之地进入本图集的第二家工厂。它没有英语媒体；它有一个世纪。',
        '[{"name":"Dostoïevski","color":"#4A3728","force":"Medium-Full","wrapper":"未公开","vitolas":[],"story":"陀思妥耶夫斯基，茄标上用1918年前的旧拼写——工厂的手工系列。"},{"name":"XO","color":"#8B5A2B","force":"Medium","wrapper":"未公开","vitolas":[],"story":"单支管装，价格克制。"}]',
        'بوغار مدينةٌ صغيرة في أوبلاست بريانسك غرب روسيا، ومصنع التبغ فيها من أقدم مصانع البلاد: افتُتحت فيها مؤسّسة سنة 1839، ومصنع تبغ بوغار قائم بهذا الاسم منذ 1915. كان التبغ آنذاك يُزرع في الإمبراطورية الروسية. وبعد الثورة ثم الحرب اختفت المزارع ونجا المصنع بصنع الرخيص؛ ثم عاد إلى السيجار لاحقًا بأوراق تُشترى من كوبا وجمهورية الدومينيكان والبرازيل ونيكاراغوا، وكلّ شيء يُصنع في الموقع عدا الزراعة.

لا يحمل هذا الأطلس ما يصنعه بوغار بالكمّية — سيجارات آلية ومنكّهة وتشكيلة رخيصة — بل ما يصنعه باليد: سيجارات يلفّها لفّافوه، ويقدّمها تاجر تجزئة روسي أكبر إنتاج مُلفوف يدويًّا في البلاد. تنسب البطاقة ذلك إلى التاجر. وتقول العلامات العصر والمكان: XO وAroma Cubana ودوستويفسكي، مكتوبًا بإملاء ما قبل 1918.

مع Siglo de Oro، إنّه المصنع الثاني الذي يُدخل روسيا في هذا الأطلس مكانَ لفّ. لا صحافة أنجلوفونية له؛ له قرن.',
        '[{"name":"Dostoïevski","color":"#4A3728","force":"Medium-Full","wrapper":"غير معلن","vitolas":[],"story":"دوستويفسكي، مكتوب على الحزام بإملاء ما قبل 1918 — الخطّ اليدوي للمصنع."},{"name":"XO","color":"#8B5A2B","force":"Medium","wrapper":"غير معلن","vitolas":[],"story":"في أنابيب فردية، بسعر معتدل."}]')
ON DUPLICATE KEY UPDATE `country_id` = VALUES(`country_id`), `founded` = VALUES(`founded`), `factory` = VALUES(`factory`), `source` = VALUES(`source`), `history` = VALUES(`history`), `gamme` = VALUES(`gamme`), `history_en` = VALUES(`history_en`), `gamme_en` = VALUES(`gamme_en`), `history_es` = VALUES(`history_es`), `gamme_es` = VALUES(`gamme_es`), `history_de` = VALUES(`history_de`), `gamme_de` = VALUES(`gamme_de`), `history_zh` = VALUES(`history_zh`), `gamme_zh` = VALUES(`gamme_zh`), `history_ar` = VALUES(`history_ar`), `gamme_ar` = VALUES(`gamme_ar`);

-- ── Total Flame ──

INSERT INTO `brands` (`name`, `country_id`, `founded`, `factory`, `source`, `history`, `gamme`, `history_en`, `gamme_en`, `history_es`, `gamme_es`, `history_de`, `gamme_de`, `history_zh`, `gamme_zh`, `history_ar`, `gamme_ar`)
VALUES ('Total Flame',
        'dominican',
        '2010 — Moscou ; chez La Aurora et Plasencia',
        'Sans usine — Tabacalera La Aurora (Rép. dominicaine) et Plasencia (Nicaragua)',
        'halfwheel.com « Total Flame Premium » et « Total Flame Wild One » (lancée en 2010 par Maxim Privezentsev et Vladimir Roshchin, rencontrés à une soirée cigare à Moscou, deux passions communes — le cigare et la moto ; en 2010 ils composent leurs assemblages chez Plasencia S.A. et La Aurora S.A. ; en 2011, un tour du monde à moto ; habitués de l''IPCPR) ; cigar-coop.com « Cigar Review: Total Flame FTW » ; cigarday.ru (fabriquée chez La Aurora et Plasencia ; tabacs vieillis six à huit ans ; une ligne en tabac iranien) ; neptunecigar.com « Total Flame FTW » (roulée à Tabacalera La Aurora)',
        'Total Flame est une maison russe sans usine, et l''atlas la classe là où elle est roulée : à La Aurora, en République dominicaine, et chez Plasencia, au Nicaragua — deux fiches de cet atlas. Maxim Privezentsev et Vladimir Roshchin se sont rencontrés à une soirée cigare à Moscou et se sont découvert deux passions, le cigare et la moto ; en 2010 ils sont partis composer leurs assemblages dans les deux fabriques, et en 2011 ils sont partis faire le tour du monde à moto, en le documentant. La marque a suivi, avec des bagues de motards — Wild One, Spokes, Off The Rails, FTW.

Une Dark Line et une Bright Line, des tabacs que la maison dit vieillis six à huit ans, une ligne en tabac iranien, et des lubies revendiquées comme telles. La presse américaine l''a décrite dans les années 2010, quand elle fréquentait l''IPCPR ; la presse russe du cigare la range en 2025 parmi les marques à racines russes faites à l''étranger.

C''est le troisième cas russe de cet atlas, et le seul sans fabrique en Russie : Siglo de Oro et Pogar roulent chez elles, Total Flame fait rouler dans les Caraïbes. La règle du lieu de roulage tranche.',
        '[{"name":"Dark Line","color":"#1F1F1F","force":"Full","wrapper":"Non divulguée","vitolas":[],"story":"La ligne sombre — Old School, World Trip —, à La Aurora."},{"name":"Bright Line","color":"#C9A96E","force":"Medium","wrapper":"Non divulguée","vitolas":[],"story":"La ligne claire — 8 Ball, Spokes."},{"name":"Wild One","color":"#7A2E1E","force":"Medium-Full","wrapper":"Non divulguée","vitolas":[],"story":"Le sauvage — un nom de motard, comme Off The Rails et FTW."}]',
        'Total Flame is a Russian house without a factory, and this atlas classifies it where it is rolled: at La Aurora, in the Dominican Republic, and at Plasencia, in Nicaragua — two entries of this atlas. Maxim Privezentsev and Vladimir Roshchin met at a cigar evening in Moscow and discovered two shared passions, cigars and motorcycles; in 2010 they went to compose their blends at the two factories, and in 2011 they set off to ride around the world, documenting it. The brand followed, with bikers'' bands — Wild One, Spokes, Off The Rails, FTW.

A Dark Line and a Bright Line, tobaccos the house says are aged six to eight years, a line in Iranian tobacco, and whims claimed as such. The American press described it in the 2010s, when it attended the IPCPR; the Russian cigar press in 2025 files it among brands with Russian roots made abroad.

It is the third Russian case in this atlas, and the only one without a factory in Russia: Siglo de Oro and Pogar roll at home, Total Flame has its cigars rolled in the Caribbean. The rule of the rolling place decides.',
        '[{"name":"Dark Line","color":"#1F1F1F","force":"Full","wrapper":"Undisclosed","vitolas":[],"story":"The dark line — Old School, World Trip —, at La Aurora."},{"name":"Bright Line","color":"#C9A96E","force":"Medium","wrapper":"Undisclosed","vitolas":[],"story":"The bright line — 8 Ball, Spokes."},{"name":"Wild One","color":"#7A2E1E","force":"Medium-Full","wrapper":"Undisclosed","vitolas":[],"story":"The wild one — a biker name, like Off The Rails and FTW."}]',
        'Total Flame es una casa rusa sin fábrica, y este atlas la clasifica donde se lía: en La Aurora, en la República Dominicana, y en Plasencia, en Nicaragua — dos fichas de este atlas. Maxim Privezentsev y Vladimir Roshchin se conocieron en una velada de puros en Moscú y se descubrieron dos pasiones, el puro y la moto; en 2010 fueron a componer sus ligadas a las dos fábricas, y en 2011 salieron a dar la vuelta al mundo en moto, documentándola. La marca siguió, con anillas de moteros — Wild One, Spokes, Off The Rails, FTW.

Una Dark Line y una Bright Line, tabacos que la casa dice añejados de seis a ocho años, una línea de tabaco iraní, y caprichos reivindicados como tales. La prensa estadounidense la describió en los años 2010, cuando frecuentaba la IPCPR; la prensa rusa del puro la sitúa en 2025 entre las marcas de raíces rusas hechas en el extranjero.

Es el tercer caso ruso de este atlas, y el único sin fábrica en Rusia: Siglo de Oro y Pogar lían en casa, Total Flame hace liar en el Caribe. La regla del lugar de liado decide.',
        '[{"name":"Dark Line","color":"#1F1F1F","force":"Full","wrapper":"No divulgada","vitolas":[],"story":"La línea oscura — Old School, World Trip —, en La Aurora."},{"name":"Bright Line","color":"#C9A96E","force":"Medium","wrapper":"No divulgada","vitolas":[],"story":"La línea clara — 8 Ball, Spokes."},{"name":"Wild One","color":"#7A2E1E","force":"Medium-Full","wrapper":"No divulgada","vitolas":[],"story":"El salvaje — un nombre de motero, como Off The Rails y FTW."}]',
        'Total Flame ist ein russisches Haus ohne Fabrik, und dieser Atlas ordnet es dort ein, wo es gerollt wird: bei La Aurora in der Dominikanischen Republik und bei Plasencia in Nicaragua — zwei Einträge dieses Atlas. Maxim Priwesenzew und Wladimir Roschtschin lernten sich bei einem Zigarrenabend in Moskau kennen und entdeckten zwei gemeinsame Leidenschaften, Zigarren und Motorräder; 2010 reisten sie, um ihre Blends in den beiden Fabriken zu komponieren, und 2011 brachen sie zu einer dokumentierten Weltreise auf dem Motorrad auf. Die Marke folgte, mit Biker-Bauchbinden — Wild One, Spokes, Off The Rails, FTW.

Eine Dark Line und eine Bright Line, Tabake, die das Haus als sechs bis acht Jahre gereift angibt, eine Linie aus iranischem Tabak und als solche bekannte Marotten. Die amerikanische Presse beschrieb es in den 2010ern, als es die IPCPR besuchte; die russische Zigarrenpresse zählt es 2025 zu den Marken mit russischen Wurzeln, die im Ausland gemacht werden.

Es ist der dritte russische Fall in diesem Atlas und der einzige ohne Fabrik in Russland: Siglo de Oro und Pogar rollen daheim, Total Flame lässt in der Karibik rollen. Die Regel des Rollorts entscheidet.',
        '[{"name":"Dark Line","color":"#1F1F1F","force":"Full","wrapper":"Nicht angegeben","vitolas":[],"story":"Die dunkle Linie — Old School, World Trip —, bei La Aurora."},{"name":"Bright Line","color":"#C9A96E","force":"Medium","wrapper":"Nicht angegeben","vitolas":[],"story":"Die helle Linie — 8 Ball, Spokes."},{"name":"Wild One","color":"#7A2E1E","force":"Medium-Full","wrapper":"Nicht angegeben","vitolas":[],"story":"Der Wilde — ein Bikername, wie Off The Rails und FTW."}]',
        'Total Flame 是一家没有工厂的俄罗斯公司，本图集把它归入卷制之地：多米尼加共和国的 La Aurora 和尼加拉瓜的 Plasencia——本图集的两个词条。马克西姆·普里韦津采夫与弗拉基米尔·罗辛在莫斯科的一场雪茄晚会相识，发现彼此有两个共同的热爱：雪茄与摩托车；2010年他们去两家工厂调配配方，2011年骑摩托环游世界并记录下来。品牌随之而生，茄标带着摩托客的气息——Wild One、Spokes、Off The Rails、FTW。

一条 Dark Line、一条 Bright Line，公司称烟叶陈化六到八年，一条伊朗烟叶的线，以及自认的奇思。美国媒体在2010年代描写过它，当时它常参加 IPCPR；俄罗斯雪茄媒体2025年把它归入在国外制作的俄罗斯血统品牌。

这是本图集的第三个俄罗斯案例，也是唯一在俄罗斯没有工厂的：Siglo de Oro 和波加尔在本土卷制，Total Flame 在加勒比代工。卷制地规则做出裁断。',
        '[{"name":"Dark Line","color":"#1F1F1F","force":"Full","wrapper":"未公开","vitolas":[],"story":"暗色系列——Old School、World Trip——在 La Aurora 制作。"},{"name":"Bright Line","color":"#C9A96E","force":"Medium","wrapper":"未公开","vitolas":[],"story":"亮色系列——8 Ball、Spokes。"},{"name":"Wild One","color":"#7A2E1E","force":"Medium-Full","wrapper":"未公开","vitolas":[],"story":"狂野者——摩托客的名字，如 Off The Rails 和 FTW。"}]',
        'توتال فلايم دارٌ روسية بلا مصنع، ويصنّفها هذا الأطلس حيث تُلفّ: لدى La Aurora في جمهورية الدومينيكان ولدى Plasencia في نيكاراغوا — بطاقتان من هذا الأطلس. التقى مكسيم بريفيزينتسيف وفلاديمير روشين في أمسية سيجار بموسكو واكتشفا شغفين مشتركين، السيجار والدرّاجة النارية؛ وفي 2010 ذهبا لتركيب مزجاتهما في المصنعين، وفي 2011 انطلقا للدوران حول العالم على الدرّاجة موثّقَين ذلك. وتبعت العلامة، بأحزمة راكبي الدرّاجات — Wild One وSpokes وOff The Rails وFTW.

خطّ Dark Line وآخر Bright Line، وأتبغة تقول الدار إنّها معتّقة ستّ إلى ثماني سنين، وخطّ من تبغ إيراني، ونزوات معلنة بوصفها كذلك. وصفتها الصحافة الأمريكية في العقد الثاني من الألفية حين كانت تحضر IPCPR؛ وتضعها صحافة السيجار الروسية سنة 2025 بين العلامات ذات الجذور الروسية المصنوعة في الخارج.

إنّها الحالة الروسية الثالثة في هذا الأطلس، والوحيدة بلا مصنع في روسيا: Siglo de Oro وبوغار يلفّان في الديار، وتوتال فلايم تُلفّ في الكاريبي. وقاعدة مكان اللفّ تحسم.',
        '[{"name":"Dark Line","color":"#1F1F1F","force":"Full","wrapper":"غير معلن","vitolas":[],"story":"الخطّ الداكن — Old School وWorld Trip — لدى La Aurora."},{"name":"Bright Line","color":"#C9A96E","force":"Medium","wrapper":"غير معلن","vitolas":[],"story":"الخطّ الفاتح — 8 Ball وSpokes."},{"name":"Wild One","color":"#7A2E1E","force":"Medium-Full","wrapper":"غير معلن","vitolas":[],"story":"المتوحّش — اسمُ راكب درّاجة، مثل Off The Rails وFTW."}]')
ON DUPLICATE KEY UPDATE `country_id` = VALUES(`country_id`), `founded` = VALUES(`founded`), `factory` = VALUES(`factory`), `source` = VALUES(`source`), `history` = VALUES(`history`), `gamme` = VALUES(`gamme`), `history_en` = VALUES(`history_en`), `gamme_en` = VALUES(`gamme_en`), `history_es` = VALUES(`history_es`), `gamme_es` = VALUES(`gamme_es`), `history_de` = VALUES(`history_de`), `gamme_de` = VALUES(`gamme_de`), `history_zh` = VALUES(`history_zh`), `gamme_zh` = VALUES(`gamme_zh`), `history_ar` = VALUES(`history_ar`), `gamme_ar` = VALUES(`gamme_ar`);


-- ── ITALY : `brands` reecrit en litteral complet (3 entrees) ──
UPDATE `producer_countries` SET `brands` = '[{"name":"Toscano","desc":"Le cigare né d''un orage florentin en 1815","iconic":true,"cape":true},{"name":"Compagnia Toscana Sigari","desc":"Sansepolcro, 2015 — le Kentucky toscan hors du monopole, totalmente a mano","iconic":false},{"name":"MOSI","desc":"Orsago, 2013 — l''Ambasciator Italico Storico, roulé main ; STG depuis 2021","iconic":false}]' WHERE `id` = 'italy';

-- ── DOMINICAN : `brands` reecrit en litteral complet (53 entrees) ──
UPDATE `producer_countries` SET `brands` = '[{"desc":"Opus X — les plus convoités au monde","name":"Arturo Fuente","iconic":true},{"desc":"Luxe suisse, manufacture dominicaine","name":"Davidoff","iconic":true},{"desc":"Artisanat d''exception depuis 1996","name":"La Flor Dominicana","iconic":true},{"desc":"Standard mondial du Connecticut","name":"Macanudo","iconic":false},{"desc":"ESG et VSG, intemporels","name":"Ashton","iconic":false},{"desc":"Créée par le pianiste Avo Uvezian","name":"Avo","iconic":false},{"desc":"La douceur comme valeur absolue, depuis 1993","name":"Santa Damiana","iconic":false},{"desc":"1903, la plus ancienne manufacture dominicaine","name":"La Aurora","iconic":true},{"desc":"Repartir de zéro après une carrière entière","name":"E.P. Carrillo","iconic":true},{"desc":"1974, avant la vague — et toujours familiale","name":"Quesada","iconic":false},{"desc":"Tamboril, où la même main roule plusieurs bagues","name":"PDR Cigars","iconic":false},{"desc":"L''autre Montecristo, celui d''après 1960","name":"Montecristo Dominicain","iconic":true},{"desc":"Même bague que le havane, autre cigare","name":"Romeo y Julieta Dominicain","iconic":false},{"desc":"Le cigare que des dizaines de milliers de gens fument vraiment","name":"VegaFina","iconic":true},{"desc":"Un bon cigare selon le marché d''avant la mode de la puissance","name":"Don Diego","iconic":false},{"desc":"Né d''une boîte de nuit genevoise, et cela s''entend","name":"The Griffin''s","iconic":false},{"desc":"Un industriel redevenu artisan","name":"Matilde","iconic":false},{"desc":"La bague au pied du cigare — personne d''autre n''a osé","name":"Juan Clemente","iconic":false},{"desc":"Cape venue du Cameroun, cigares roulés ici","name":"Meerapfel","iconic":false},{"desc":"Née chez El Credito, à Miami, en 1972","name":"La Gloria Cubana Dominicaine","iconic":false},{"desc":"Tabacalera de García, La Romana","name":"H. Upmann Dominicain","iconic":false},{"desc":"Ne subsiste que hors de Cuba","name":"Henry Clay","iconic":false},{"desc":"Collection non cubaine annoncée en 2016","name":"Por Larrañaga Dominicain","iconic":false},{"name":"Boutique Blends","desc":"Rafael Nodal — Aging Room et Swag, chez Jochy Blanco","iconic":false},{"name":"Diamond Crown","desc":"La commande de Stanford Newman à Carlos Fuente Sr., pour le centenaire de 1995","iconic":false},{"name":"Cuesta-Rey","desc":"1884, Ybor City — plus ancienne que la maison qui la possède","iconic":false},{"name":"Tabacalera Palma","desc":"1936 — la fabrique dont sortent Aging Room, Swag, La Galera et Matilde","iconic":true},{"name":"Aging Room","desc":"Rafael Nodal compose, Jochy Blanco fabrique — et ils sont associés","iconic":true},{"name":"Swag","desc":"L''autre marque de Boutique Blends, même atelier, sans cérémonie","iconic":false},{"name":"Kristoff","desc":"Une visite non sollicitée en 2004, et un financier qui change de métier","iconic":false},{"name":"Caldwell Cigar Co.","desc":"Des tabacs rares plutôt qu''une recette reproductible","iconic":false},{"name":"Casa Cuevas","desc":"Tabacalera Las Lavas — trois générations sur un même assemblage","iconic":false},{"name":"Ferio Tego","desc":"L''héritière de Nat Sherman : Quesada et Plasencia se partagent son catalogue","iconic":true},{"name":"Paul Garmirian","desc":"Un livre en 1990, puis un cigare — roulé chez la fabrique qui fait l''Avo","iconic":false},{"name":"La Barba","desc":"Partie du Honduras pour l''atelier des Ventura, celui de Caldwell","iconic":false},{"name":"De Los Reyes Cigars","desc":"Leo cultive, Nirka dirige — et l''atelier roule aussi pour d''autres","iconic":false},{"name":"Tabacalera William Ventura","desc":"La fabrique de Caldwell et de La Barba — brûlée en 2022, rouverte en 2024","iconic":false},{"name":"Kelner Boutique Factory","desc":"2012, Santiago — la petite fabrique du fils du maître de tabac de Davidoff","iconic":false},{"name":"Cuban Stock Cigar Co.","desc":"1996 — vingt marques, une usine de zone franche à Tamboril depuis 2016","iconic":false},{"name":"Blackbird Cigar Co.","desc":"2016 — des oiseaux pour noms, et toute la feuille de Tabacalera Palma","iconic":false},{"name":"Kafie 1901","desc":"Un chirurgien hondurien, une usine de Danlí perdue en 2021, une seconde vie chez La Aurora","iconic":false},{"name":"Debonaire House","desc":"2012 — Debonaire et Indian Motorcycle, roulées chez De Los Reyes","iconic":false},{"name":"Patoro","desc":"Suisse, 2001 — roulée chez De Los Reyes ; deux Serie P sous une bague","iconic":false},{"name":"ADVentura","desc":"2016 — un Suisse et un Dominicain ; roulée chez William Ventura","iconic":false},{"name":"Freud Cigar Co.","desc":"2022 — SuperEgo, roulée chez William Ventura cinq mois avant l''incendie","iconic":false},{"name":"Hiram & Solomon","desc":"2015 — la marque des francs-maçons, chez PDR","iconic":false},{"name":"Epic Cigars","desc":"2010 — un Canadien chez Tabacalera von Eicken","iconic":false},{"name":"Chogüí","desc":"2014 — puro dominicain, dormant puis revenu en 2022","iconic":false},{"name":"Principle Cigars","desc":"2013 — la maison d''un collectionneur, chez KBF","iconic":false},{"name":"Balmoral","desc":"La marque premium de Royal Agio, STG depuis 2020 — roulée à Santiago pour l''Europe","iconic":false},{"name":"Don Lucas","desc":"Punta Cana, 1992 — la fabrique-boutique de la côte touristique","iconic":false},{"name":"Cabal Cigars","desc":"2013 — chez KBF, puis La Isla pour Initiative","iconic":false},{"name":"Total Flame","desc":"Moscou, 2010 — deux motards, chez La Aurora et Plasencia","iconic":false}]' WHERE `id` = 'dominican';

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'producer_countries', p.`id`, c.champ, l.lang,
       SHA1(CASE c.champ WHEN 'region' THEN p.`region` WHEN 'production' THEN p.`production`
                         WHEN 'rev_detail' THEN p.`rev_detail` ELSE p.`notes` END), 'machine', NOW()
  FROM `producer_countries` p
  JOIN (SELECT 'region' champ UNION ALL SELECT 'production' UNION ALL SELECT 'rev_detail' UNION ALL SELECT 'notes') c
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de' UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE p.`id` IN ('germany','netherlands','russia')
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'producer_geo', g.`country_id`, c.champ, l.lang,
       SHA1(CASE c.champ WHEN 'currency' THEN g.`currency` WHEN 'language' THEN g.`language` ELSE g.`independent` END), 'machine', NOW()
  FROM `producer_geo` g
  JOIN (SELECT 'currency' champ UNION ALL SELECT 'language' UNION ALL SELECT 'independent') c
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de' UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE g.`country_id` IN ('germany','netherlands','russia')
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'brands', b.`name`, c.champ, l.lang,
       SHA1(CASE c.champ WHEN 'history' THEN b.`history` ELSE b.`gamme` END), 'machine', NOW()
  FROM `brands` b
  JOIN (SELECT 'history' champ UNION ALL SELECT 'gamme') c
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de' UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE b.`name` IN ('Zigarren Manufaktur Dresden','La Galana','Wolf & Ruhland','Van der Donk','Compagnia Toscana Sigari','MOSI','Siglo de Oro','Pogar','Total Flame')
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 221';
INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 221','systeme','trois_pays_de_roulage_europeens','pays',0,
   'Allemagne (Dresde, Cologne, Perlesreut), Pays-Bas (Culemborg), Russie (Moscou, Pogar) : trois pays d adresses qui roulent a la main sans que personne ne l ecrive en anglais. Aucun ne cultive pour le cigare ; trous declares'),
  (NULL,'migration 221','systeme','frontiere_main_machine_ecrite','marque',0,
   'Wolf & Ruhland et Van der Donk : rouleaux sur appareil a pedale, cape a la main — dit dans la fiche. MOSI et Pogar : surtout machine, une ligne main — l atlas ne porte que la ligne main, comme Villiger'),
  (NULL,'migration 221','systeme','sources_locales_declarees','marque',0,
   'Chaque fiche dit que sa presse n est pas anglophone : journaux de Dresde, de Cologne, du Bayerischer Wald, de Trevise, de Moscou. Total Flame, russe sans usine, classee ou elle est roulee : La Aurora et Plasencia');

SELECT
  (SELECT COUNT(*) FROM `producer_countries` WHERE `id` IN ('germany','netherlands','russia')) = 3 AS trois_pays,
  (SELECT COUNT(*) FROM `producer_geo` WHERE `country_id` IN ('germany','netherlands','russia')) = 3 AS trois_geo,
  (SELECT COUNT(*) FROM `brands` WHERE `name` IN ('Zigarren Manufaktur Dresden','La Galana','Wolf & Ruhland','Van der Donk','Compagnia Toscana Sigari','MOSI','Siglo de Oro','Pogar','Total Flame')) = 9 AS neuf_fiches,
  (SELECT CHAR_LENGTH(`flag`) FROM `producer_countries` WHERE `id` = 'russia') = 2 AS drapeau_entier,
  (SELECT `brands` LIKE '%MOSI%' FROM `producer_countries` WHERE `id` = 'italy') AS italie_annonce,
  (SELECT `brands` LIKE '%Total Flame%' FROM `producer_countries` WHERE `id` = 'dominican') AS dominicaine_annonce,
  (SELECT SUM(CHAR_LENGTH(`detail`) >= 255) = 0 FROM `moderation_log` WHERE `acteur_nom` = 'migration 221') AS journal_non_tronque;
SELECT COUNT(*) AS marques, SUM(TRIM(COALESCE(`source`,'')) = '') AS sans_source FROM `brands`;
SELECT COUNT(*) AS pays_producteurs FROM `producer_countries`;
