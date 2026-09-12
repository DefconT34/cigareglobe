-- ════════════════════════════════════════════════════════
-- 215 — Lot 6 du troisieme recensement : la carte s'etend
-- ────────────────────────────────────────────────────────
-- QUATRE PAYS ENTRENT, CINQ MAISONS. Trois lieux de roulage sans champs
-- — comme la Suisse et la Cote d'Ivoire — et un pays producteur :
--   BAHAMAS      Graycliff (Nassau, janvier 1997, Avelino Lara)
--   ACORES       Fabrica de Tabaco Estrela (Ponta Delgada, 1882 ; EMT,
--                associee de Luciano dans Constella depuis avril 2025)
--   PORTO RICO   Don Collins (Vieux San Juan, 1991)
--   CHINE        Great Wall Cigars (Shifang, Sichuan, 1918 ; le 132)
-- et, dans un pays deja ouvert :
--   PHILIPPINES  Tabaqueria de Filipinas (Manille 1993, San Pedro)
--
-- CE QUE LES FICHES ATTRIBUENT SANS ADOPTER : Don Collins se dit de
-- 1506 et « la plus vieille fabrique des Caraibes » — la fiche le
-- rapporte a la maison, retient 1991, et ne garde comme fait que la
-- Porto Rican-American Tobacco Company de 1899, ecrite dans l'arret
-- antitrust de 1911. Great Wall « avant toute autre fabrique du pays »
-- est attribue a la presse du metier. Graycliff : Lara sorti de Cuba
-- en 1993 (presse), production commencee en janvier 1997 (maison) —
-- les deux dates sont ecrites, elles ne se contredisent pas.
--
-- LES TROUS SONT DECLARES, comme pour le Mozambique (174) : aucune
-- zone, aucune variete, aucun climat pour les quatre pays. Les Bahamas
-- et Porto Rico ne cultivent rien d'atteste ; les Acores ont cultive
-- au XIXe ; la Chine cultive a Shifang depuis quatre siecles — mais la
-- presse a decrit la fabrique, pas les champs. Les coordonnees de la
-- Chine pointent SHIFANG, pas Pekin : c'est la que se roule.
--
-- LE CODE ACCOMPAGNE LA BASE : flags.js recoit trois drapeaux
-- (bahamas, puertorico, azores — la Chine y etait) et FLAGS_DESSINES
-- les declare ; data.pays.js recoit BS et PR, et azores entre dans
-- TERRITOIRES_INFOS avec Atlantic/Azores (UTC-1), comme les Canaries.
-- Sans cela, coherence_check refuse trois bandes grises et une heure
-- de Lisbonne.
--
-- Les drapeaux passent par leurs octets (lecon 168).
-- `producer_countries.brands` des Philippines lu et reecrit en litteral.
-- Domaines verifies au DNS : graycliff.com, cigaraficionado.com,
-- halfwheel.com, visitpontadelgada.pt, lifecooler.com, agroportal.pt,
-- don-collins.com, supreme.justia.com, tripadvisor.com, tabaqueria.com,
-- tobaccoasia.com, cigarjournal.com.
-- ════════════════════════════════════════════════════════

-- ── BAHAMAS ──
INSERT INTO `producer_countries` (`id`, `name`, `flag`, `lat`, `lon`, `color`, `tier`, `region`, `region_en`, `region_es`, `region_de`, `region_zh`, `region_ar`, `regions`, `varieties`, `tabacaleras`, `brands`, `production`, `production_en`, `production_es`, `production_de`, `production_zh`, `production_ar`, `revenue`, `rev_detail`, `rev_detail_en`, `rev_detail_es`, `rev_detail_de`, `rev_detail_zh`, `rev_detail_ar`, `notes`, `notes_en`, `notes_es`, `notes_de`, `notes_zh`, `notes_ar`)
VALUES ('bahamas',
  'Bahamas',
  CONVERT(UNHEX('F09F87A7F09F87B8') USING utf8mb4),
  25.0343,
  -77.3963,
  '#00A3B5',
  'emerging',
  'Caraïbes',
  'Caribbean',
  'Caribe',
  'Karibik',
  '加勒比地区',
  'الكاريبي',
  '[]',
  '[]',
  '["Graycliff Cigar Company"]',
  '[{"name":"Graycliff","desc":"Nassau, 1997 — le premier assemblage d''Avelino Lara, l''ancien rouleur d''El Laguito","iconic":true}]',
  'Un seul atelier, à Nassau — roulé main, tabacs importés',
  'A single workshop, in Nassau — hand-rolled, imported tobaccos',
  'Un solo taller, en Nassau — liado a mano, tabacos importados',
  'Eine einzige Werkstatt, in Nassau — handgerollt, importierte Tabake',
  '拿骚仅一家作坊——手工卷制，进口烟叶',
  'ورشة واحدة في ناساو — لفّ يدوي، أتبغة مستوردة',
  '',
  'Il n''existe pas de ligne d''exportation de cigares bahaméens. Graycliff vend dans son hôtel, à ses visiteurs, et aux États-Unis depuis octobre 1997 ; la maison a déclaré 650 000 cigares roulés en 1999.',
  'There is no export line for Bahamian cigars. Graycliff sells in its hotel, to visitors, and in the United States since October 1997; the house reported 650,000 cigars rolled in 1999.',
  'No existe una línea de exportación de puros bahameños. Graycliff vende en su hotel, a sus visitantes y en Estados Unidos desde octubre de 1997; la casa declaró 650 000 puros liados en 1999.',
  'Eine Exportposition für bahamaische Zigarren gibt es nicht. Graycliff verkauft in seinem Hotel, an Besucher und seit Oktober 1997 in den Vereinigten Staaten; das Haus meldete 650 000 gerollte Zigarren für 1999.',
  '不存在巴哈马雪茄的出口税目。Graycliff 在自家酒店向访客销售，并自1997年10月起销往美国；公司申报1999年卷制了65万支。',
  'لا يوجد بند جمركي لتصدير السيجار البهامي. تبيع Graycliff في فندقها للزوّار، وفي الولايات المتحدة منذ تشرين الأوّل/أكتوبر 1997؛ وأعلنت الدار 650 ألف سيجار مُلفوف سنة 1999.',
  'Les Bahamas ne cultivent pas de tabac : tout ce qui se roule à Nassau vient du Brésil, du Nicaragua, du Honduras, parfois d''Équateur et du Cameroun, sous cape d''Indonésie. C''est un pays de roulage, pas de champs — comme la Suisse ou la Côte d''Ivoire dans cet atlas.',
  'The Bahamas grow no tobacco: everything rolled in Nassau comes from Brazil, Nicaragua, Honduras, sometimes Ecuador and Cameroon, under an Indonesian wrapper. It is a rolling country, not a growing one — like Switzerland or Côte d''Ivoire in this atlas.',
  'Las Bahamas no cultivan tabaco: todo lo que se lía en Nassau viene de Brasil, Nicaragua, Honduras, a veces Ecuador y Camerún, bajo capa de Indonesia. Es un país de liado, no de campos — como Suiza o Costa de Marfil en este atlas.',
  'Die Bahamas bauen keinen Tabak an: Alles, was in Nassau gerollt wird, kommt aus Brasilien, Nicaragua, Honduras, manchmal Ecuador und Kamerun, unter einem indonesischen Deckblatt. Ein Rollland, kein Anbauland — wie die Schweiz oder Côte d''Ivoire in diesem Atlas.',
  '巴哈马不种烟草：拿骚卷制的一切都来自巴西、尼加拉瓜、洪都拉斯，有时是厄瓜多尔与喀麦隆，配印尼茄衣。这是卷制之国，而非种植之国——如本图集中的瑞士或科特迪瓦。',
  'لا تزرع البهاما التبغ: كلّ ما يُلفّ في ناساو يأتي من البرازيل ونيكاراغوا وهندوراس، وأحيانًا من الإكوادور والكاميرون، تحت غلاف إندونيسي. إنّه بلدُ لفٍّ لا بلدُ حقول — كسويسرا أو ساحل العاج في هذا الأطلس.')
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`), `flag` = VALUES(`flag`), `lat` = VALUES(`lat`), `lon` = VALUES(`lon`), `color` = VALUES(`color`), `tier` = VALUES(`tier`), `region` = VALUES(`region`), `region_en` = VALUES(`region_en`), `region_es` = VALUES(`region_es`), `region_de` = VALUES(`region_de`), `region_zh` = VALUES(`region_zh`), `region_ar` = VALUES(`region_ar`), `regions` = VALUES(`regions`), `varieties` = VALUES(`varieties`), `tabacaleras` = VALUES(`tabacaleras`), `brands` = VALUES(`brands`), `production` = VALUES(`production`), `production_en` = VALUES(`production_en`), `production_es` = VALUES(`production_es`), `production_de` = VALUES(`production_de`), `production_zh` = VALUES(`production_zh`), `production_ar` = VALUES(`production_ar`), `revenue` = VALUES(`revenue`), `rev_detail` = VALUES(`rev_detail`), `rev_detail_en` = VALUES(`rev_detail_en`), `rev_detail_es` = VALUES(`rev_detail_es`), `rev_detail_de` = VALUES(`rev_detail_de`), `rev_detail_zh` = VALUES(`rev_detail_zh`), `rev_detail_ar` = VALUES(`rev_detail_ar`), `notes` = VALUES(`notes`), `notes_en` = VALUES(`notes_en`), `notes_es` = VALUES(`notes_es`), `notes_de` = VALUES(`notes_de`), `notes_zh` = VALUES(`notes_zh`), `notes_ar` = VALUES(`notes_ar`);

INSERT INTO `producer_geo` (`country_id`, `capital`, `population`, `area`, `currency`, `language`, `timezone`, `gdp`, `independent`, `currency_en`, `currency_es`, `currency_de`, `currency_zh`, `currency_ar`, `language_en`, `language_es`, `language_de`, `language_zh`, `language_ar`, `independent_en`, `independent_es`, `independent_de`, `independent_zh`, `independent_ar`)
VALUES ('bahamas', 'Nassau', '0,41 M (2024)', '13 943 km²', 'Dollar bahaméen (BSD)', 'Anglais', 'UTC−5', '14,3 Md$ (2023)', '1973 (du Royaume-Uni)', 'Bahamian dollar (BSD)', 'Dólar bahameño (BSD)', 'Bahama-Dollar (BSD)', '巴哈马元（BSD）', 'الدولار البهامي (BSD)', 'English', 'Inglés', 'Englisch', '英语', 'الإنجليزية', '1973 (from the United Kingdom)', '1973 (del Reino Unido)', '1973 (vom Vereinigten Königreich)', '1973 年（脱离英国）', '1973 (عن المملكة المتحدة)')
ON DUPLICATE KEY UPDATE `capital` = VALUES(`capital`), `population` = VALUES(`population`), `area` = VALUES(`area`), `currency` = VALUES(`currency`), `language` = VALUES(`language`), `timezone` = VALUES(`timezone`), `gdp` = VALUES(`gdp`), `independent` = VALUES(`independent`), `currency_en` = VALUES(`currency_en`), `currency_es` = VALUES(`currency_es`), `currency_de` = VALUES(`currency_de`), `currency_zh` = VALUES(`currency_zh`), `currency_ar` = VALUES(`currency_ar`), `language_en` = VALUES(`language_en`), `language_es` = VALUES(`language_es`), `language_de` = VALUES(`language_de`), `language_zh` = VALUES(`language_zh`), `language_ar` = VALUES(`language_ar`), `independent_en` = VALUES(`independent_en`), `independent_es` = VALUES(`independent_es`), `independent_de` = VALUES(`independent_de`), `independent_zh` = VALUES(`independent_zh`), `independent_ar` = VALUES(`independent_ar`);

-- ── AÇORES ──
INSERT INTO `producer_countries` (`id`, `name`, `flag`, `lat`, `lon`, `color`, `tier`, `region`, `region_en`, `region_es`, `region_de`, `region_zh`, `region_ar`, `regions`, `varieties`, `tabacaleras`, `brands`, `production`, `production_en`, `production_es`, `production_de`, `production_zh`, `production_ar`, `revenue`, `rev_detail`, `rev_detail_en`, `rev_detail_es`, `rev_detail_de`, `rev_detail_zh`, `rev_detail_ar`, `notes`, `notes_en`, `notes_es`, `notes_de`, `notes_zh`, `notes_ar`)
VALUES ('azores',
  'Açores',
  CONVERT(UNHEX('F09F87B5F09F87B9') USING utf8mb4),
  37.7412,
  -25.6756,
  '#2B6CB0',
  'emerging',
  'Europe / Atlantique',
  'Europe / Atlantic',
  'Europa / Atlántico',
  'Europa / Atlantik',
  '欧洲 / 大西洋',
  'أوروبا / الأطلسي',
  '[]',
  '[]',
  '["Fábrica de Tabaco Estrela"]',
  '[{"name":"Fábrica de Tabaco Estrela","desc":"Ponta Delgada, 1882 — l''atelier main d''une fabrique de cigarettes","iconic":true}]',
  'Un atelier de cigares roulés main dans une fabrique de cigarettes, à Ponta Delgada',
  'A hand-rolled cigar workshop inside a cigarette factory, in Ponta Delgada',
  'Un taller de puros liados a mano dentro de una fábrica de cigarrillos, en Ponta Delgada',
  'Eine Werkstatt handgerollter Zigarren in einer Zigarettenfabrik, in Ponta Delgada',
  '蓬塔德尔加达一家卷烟厂内的手工雪茄作坊',
  'ورشة سيجار مُلفوف يدويًّا داخل مصنع سجائر، في بونتا ديلغادا',
  '',
  'Aucun chiffre publié pour les cigares seuls : l''atelier est un complément, petit, d''une fabrique dont le gros de la production est la cigarette et le cigarillo. Depuis avril 2025, EMT est associée à Luciano dans Constella Group.',
  'No figures published for cigars alone: the workshop is a small complement to a factory whose bulk is cigarettes and cigarillos. Since April 2025, EMT has been partnered with Luciano in Constella Group.',
  'Ninguna cifra publicada para los puros solos: el taller es un complemento, pequeño, de una fábrica cuyo grueso son los cigarrillos y los cigarritos. Desde abril de 2025, EMT está asociada con Luciano en Constella Group.',
  'Keine Zahlen für Zigarren allein: Die Werkstatt ist eine kleine Ergänzung einer Fabrik, deren Hauptgeschäft Zigaretten und Zigarillos sind. Seit April 2025 ist EMT mit Luciano in der Constella Group verbunden.',
  '雪茄本身没有公布数字：作坊只是一家以卷烟和小雪茄为主的工厂的小小补充。自2025年4月起，EMT 与 Luciano 在 Constella Group 中结为伙伴。',
  'لا أرقام منشورة للسيجار وحده: الورشة تكملةٌ صغيرة لمصنع معظم إنتاجه السجائر والسيجاريلو. ومنذ نيسان/أبريل 2025، EMT شريكةٌ لـLuciano في Constella Group.',
  'Les Açores ont cultivé du tabac au XIXe siècle — José Bensaúde fonde la Fábrica de Tabaco Micaelense en 1866 — et l''archipel garde deux fabriques à Ponta Delgada. Les cigares de l''Estrela sont roulés sur des tripes du Brésil, de Cuba et de République dominicaine, sous cape américaine ou indonésienne : le tabac n''est plus de l''île, le geste l''est.',
  'The Azores grew tobacco in the nineteenth century — José Bensaúde founded Fábrica de Tabaco Micaelense in 1866 — and the archipelago keeps two factories in Ponta Delgada. The Estrela cigars are rolled on fillers from Brazil, Cuba and the Dominican Republic, under an American or Indonesian wrapper: the tobacco is no longer from the island, the gesture is.',
  'Las Azores cultivaron tabaco en el siglo XIX — José Bensaúde funda la Fábrica de Tabaco Micaelense en 1866 — y el archipiélago conserva dos fábricas en Ponta Delgada. Los puros de la Estrela se lían con tripas de Brasil, Cuba y República Dominicana, bajo capa americana o indonesia: el tabaco ya no es de la isla, el gesto sí.',
  'Die Azoren bauten im 19. Jahrhundert Tabak an — José Bensaúde gründete 1866 die Fábrica de Tabaco Micaelense — und der Archipel behält zwei Fabriken in Ponta Delgada. Die Estrela-Zigarren werden auf Einlagen aus Brasilien, Kuba und der Dominikanischen Republik gerollt, unter amerikanischem oder indonesischem Deckblatt: Der Tabak ist nicht mehr von der Insel, die Handbewegung schon.',
  '亚速尔在十九世纪种过烟草——若泽·本索德1866年创办 Fábrica de Tabaco Micaelense——群岛在蓬塔德尔加达仍保有两家工厂。Estrela 的雪茄用巴西、古巴与多米尼加的填充卷制，配美国或印尼茄衣：烟叶已不再来自岛上，手艺还在。',
  'زرعت الأزور التبغ في القرن التاسع عشر — أسّس جوزيه بنساودي Fábrica de Tabaco Micaelense سنة 1866 — ويحتفظ الأرخبيل بمصنعين في بونتا ديلغادا. تُلفّ سيجارات Estrela على حشوات من البرازيل وكوبا وجمهورية الدومينيكان، تحت غلاف أمريكي أو إندونيسي: لم يعد التبغ من الجزيرة، أمّا الحركة فمنها.')
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`), `flag` = VALUES(`flag`), `lat` = VALUES(`lat`), `lon` = VALUES(`lon`), `color` = VALUES(`color`), `tier` = VALUES(`tier`), `region` = VALUES(`region`), `region_en` = VALUES(`region_en`), `region_es` = VALUES(`region_es`), `region_de` = VALUES(`region_de`), `region_zh` = VALUES(`region_zh`), `region_ar` = VALUES(`region_ar`), `regions` = VALUES(`regions`), `varieties` = VALUES(`varieties`), `tabacaleras` = VALUES(`tabacaleras`), `brands` = VALUES(`brands`), `production` = VALUES(`production`), `production_en` = VALUES(`production_en`), `production_es` = VALUES(`production_es`), `production_de` = VALUES(`production_de`), `production_zh` = VALUES(`production_zh`), `production_ar` = VALUES(`production_ar`), `revenue` = VALUES(`revenue`), `rev_detail` = VALUES(`rev_detail`), `rev_detail_en` = VALUES(`rev_detail_en`), `rev_detail_es` = VALUES(`rev_detail_es`), `rev_detail_de` = VALUES(`rev_detail_de`), `rev_detail_zh` = VALUES(`rev_detail_zh`), `rev_detail_ar` = VALUES(`rev_detail_ar`), `notes` = VALUES(`notes`), `notes_en` = VALUES(`notes_en`), `notes_es` = VALUES(`notes_es`), `notes_de` = VALUES(`notes_de`), `notes_zh` = VALUES(`notes_zh`), `notes_ar` = VALUES(`notes_ar`);

INSERT INTO `producer_geo` (`country_id`, `capital`, `population`, `area`, `currency`, `language`, `timezone`, `gdp`, `independent`, `currency_en`, `currency_es`, `currency_de`, `currency_zh`, `currency_ar`, `language_en`, `language_es`, `language_de`, `language_zh`, `language_ar`, `independent_en`, `independent_es`, `independent_de`, `independent_zh`, `independent_ar`)
VALUES ('azores', 'Ponta Delgada (siège du gouvernement régional)', '0,24 M (2023)', '2 351 km²', 'Euro (EUR)', 'Portugais', 'UTC−1', '—', 'Région autonome du Portugal', 'Euro (EUR)', 'Euro (EUR)', 'Euro (EUR)', '欧元（EUR）', 'يورو (EUR)', 'Portuguese', 'Portugués', 'Portugiesisch', '葡萄牙语', 'البرتغالية', 'Autonomous region of Portugal', 'Región autónoma de Portugal', 'Autonome Region Portugals', '葡萄牙自治区', 'منطقة حكم ذاتي تابعة للبرتغال')
ON DUPLICATE KEY UPDATE `capital` = VALUES(`capital`), `population` = VALUES(`population`), `area` = VALUES(`area`), `currency` = VALUES(`currency`), `language` = VALUES(`language`), `timezone` = VALUES(`timezone`), `gdp` = VALUES(`gdp`), `independent` = VALUES(`independent`), `currency_en` = VALUES(`currency_en`), `currency_es` = VALUES(`currency_es`), `currency_de` = VALUES(`currency_de`), `currency_zh` = VALUES(`currency_zh`), `currency_ar` = VALUES(`currency_ar`), `language_en` = VALUES(`language_en`), `language_es` = VALUES(`language_es`), `language_de` = VALUES(`language_de`), `language_zh` = VALUES(`language_zh`), `language_ar` = VALUES(`language_ar`), `independent_en` = VALUES(`independent_en`), `independent_es` = VALUES(`independent_es`), `independent_de` = VALUES(`independent_de`), `independent_zh` = VALUES(`independent_zh`), `independent_ar` = VALUES(`independent_ar`);

-- ── PORTO RICO ──
INSERT INTO `producer_countries` (`id`, `name`, `flag`, `lat`, `lon`, `color`, `tier`, `region`, `region_en`, `region_es`, `region_de`, `region_zh`, `region_ar`, `regions`, `varieties`, `tabacaleras`, `brands`, `production`, `production_en`, `production_es`, `production_de`, `production_zh`, `production_ar`, `revenue`, `rev_detail`, `rev_detail_en`, `rev_detail_es`, `rev_detail_de`, `rev_detail_zh`, `rev_detail_ar`, `notes`, `notes_en`, `notes_es`, `notes_de`, `notes_zh`, `notes_ar`)
VALUES ('puertorico',
  'Porto Rico',
  CONVERT(UNHEX('F09F87B5F09F87B7') USING utf8mb4),
  18.4655,
  -66.1057,
  '#C8102E',
  'emerging',
  'Caraïbes',
  'Caribbean',
  'Caribe',
  'Karibik',
  '加勒比地区',
  'الكاريبي',
  '[]',
  '[]',
  '["Puerto Rico Tobacco Corporation"]',
  '[{"name":"Don Collins","desc":"Vieux San Juan, 1991 — le roulé main de la Puerto Rico Tobacco Corporation","iconic":true}]',
  'Un atelier-boutique dans le Vieux San Juan — roulé main',
  'A workshop-shop in Old San Juan — hand-rolled',
  'Un taller-tienda en el Viejo San Juan — liado a mano',
  'Eine Werkstatt mit Laden in Alt-San Juan — handgerollt',
  '老圣胡安的一家前店后坊——手工卷制',
  'ورشة-متجر في سان خوان القديمة — لفّ يدوي',
  '',
  'Aucun chiffre publié. Porto Rico a été, jusqu''aux années 1920, un grand pays de tabac et de cigares ; il n''en reste aujourd''hui, pour le roulé main, qu''un atelier documenté par sa propre vitrine.',
  'No published figures. Puerto Rico was, until the 1920s, a major tobacco and cigar country; for hand-rolling, only one workshop remains today, documented by its own shopfront.',
  'Ninguna cifra publicada. Puerto Rico fue, hasta los años 1920, un gran país de tabaco y puros; del liado a mano solo queda hoy un taller documentado por su propio escaparate.',
  'Keine veröffentlichten Zahlen. Puerto Rico war bis in die 1920er ein großes Tabak- und Zigarrenland; vom Handrollen bleibt heute nur eine Werkstatt, dokumentiert durch ihr eigenes Schaufenster.',
  '没有公布的数字。直到1920年代，波多黎各还是烟草与雪茄大国；如今手工卷制只剩一家作坊，由它自己的橱窗作证。',
  'لا أرقام منشورة. كانت بورتوريكو حتى عشرينيات القرن الماضي بلدًا كبيرًا للتبغ والسيجار؛ ولم يبقَ اليوم من اللفّ اليدوي سوى ورشة واحدة توثّقها واجهتها.',
  'L''île cultivait un tabac réputé dans la Cordillère centrale au XIXe siècle, et la Porto Rican-American Tobacco Company, créée en 1899 par l''American Tobacco, y a consolidé fabriques et marques — c''est un fait de droit, écrit dans l''arrêt antitrust de 1911 de la Cour suprême des États-Unis. La suite se documente moins bien : l''atlas ne porte ni zone de culture ni variété, et laisse à la maison ses affirmations sur 1506.',
  'The island grew a reputed tobacco in the Cordillera Central in the nineteenth century, and the Porto Rican-American Tobacco Company, created in 1899 by American Tobacco, consolidated factories and brands there — a matter of law, written in the 1911 antitrust ruling of the United States Supreme Court. What followed is less well documented: this atlas carries neither growing zone nor variety, and leaves to the house its claims about 1506.',
  'La isla cultivaba un tabaco reputado en la Cordillera Central en el siglo XIX, y la Porto Rican-American Tobacco Company, creada en 1899 por la American Tobacco, consolidó allí fábricas y marcas — un hecho de derecho, escrito en la sentencia antimonopolio de 1911 del Tribunal Supremo de Estados Unidos. Lo que siguió se documenta peor: este atlas no recoge ni zona de cultivo ni variedad, y deja a la casa sus afirmaciones sobre 1506.',
  'Die Insel baute im 19. Jahrhundert in der Cordillera Central einen angesehenen Tabak an, und die Porto Rican-American Tobacco Company, 1899 von American Tobacco gegründet, bündelte dort Fabriken und Marken — eine Rechtstatsache, festgehalten im Kartellurteil des Obersten Gerichtshofs der Vereinigten Staaten von 1911. Was folgte, ist schlechter belegt: Dieser Atlas führt weder Anbauzone noch Sorte und überlässt dem Haus seine Behauptungen über 1506.',
  '十九世纪，岛上中央山脉种植着有名的烟草；1899年由美国烟草公司创立的 Porto Rican-American Tobacco Company 在此整合了工厂与品牌——这是写进美国最高法院1911年反垄断判决的法律事实。之后的历史记载较差：本图集既不录入种植区也不录入品种，并把关于1506年的说法留给公司自己。',
  'زرعت الجزيرة تبغًا ذائع الصيت في الكورديليرا الوسطى في القرن التاسع عشر، ووحّدت Porto Rican-American Tobacco Company، التي أنشأتها American Tobacco سنة 1899، المصانع والعلامات هناك — واقعةٌ قانونية مكتوبة في حكم مكافحة الاحتكار الصادر عن المحكمة العليا الأمريكية سنة 1911. أمّا ما تلا ذلك فأقلّ توثيقًا: لا يحمل هذا الأطلس منطقة زراعة ولا صنفًا، ويترك للدار ادّعاءاتها بشأن 1506.')
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`), `flag` = VALUES(`flag`), `lat` = VALUES(`lat`), `lon` = VALUES(`lon`), `color` = VALUES(`color`), `tier` = VALUES(`tier`), `region` = VALUES(`region`), `region_en` = VALUES(`region_en`), `region_es` = VALUES(`region_es`), `region_de` = VALUES(`region_de`), `region_zh` = VALUES(`region_zh`), `region_ar` = VALUES(`region_ar`), `regions` = VALUES(`regions`), `varieties` = VALUES(`varieties`), `tabacaleras` = VALUES(`tabacaleras`), `brands` = VALUES(`brands`), `production` = VALUES(`production`), `production_en` = VALUES(`production_en`), `production_es` = VALUES(`production_es`), `production_de` = VALUES(`production_de`), `production_zh` = VALUES(`production_zh`), `production_ar` = VALUES(`production_ar`), `revenue` = VALUES(`revenue`), `rev_detail` = VALUES(`rev_detail`), `rev_detail_en` = VALUES(`rev_detail_en`), `rev_detail_es` = VALUES(`rev_detail_es`), `rev_detail_de` = VALUES(`rev_detail_de`), `rev_detail_zh` = VALUES(`rev_detail_zh`), `rev_detail_ar` = VALUES(`rev_detail_ar`), `notes` = VALUES(`notes`), `notes_en` = VALUES(`notes_en`), `notes_es` = VALUES(`notes_es`), `notes_de` = VALUES(`notes_de`), `notes_zh` = VALUES(`notes_zh`), `notes_ar` = VALUES(`notes_ar`);

INSERT INTO `producer_geo` (`country_id`, `capital`, `population`, `area`, `currency`, `language`, `timezone`, `gdp`, `independent`, `currency_en`, `currency_es`, `currency_de`, `currency_zh`, `currency_ar`, `language_en`, `language_es`, `language_de`, `language_zh`, `language_ar`, `independent_en`, `independent_es`, `independent_de`, `independent_zh`, `independent_ar`)
VALUES ('puertorico', 'San Juan', '3,2 M (2024)', '9 104 km²', 'Dollar américain (USD)', 'Espagnol/Anglais', 'UTC−4', '117 Md$ (2023)', 'Territoire des États-Unis depuis 1898', 'US dollar (USD)', 'Dólar estadounidense (USD)', 'US-Dollar (USD)', '美元（USD）', 'الدولار الأمريكي (USD)', 'Spanish / English', 'Español / Inglés', 'Spanisch / Englisch', '西班牙语 / 英语', 'الإسبانية / الإنجليزية', 'US territory since 1898', 'Territorio de Estados Unidos desde 1898', 'US-Territorium seit 1898', '1898 年起为美国领地', 'إقليم تابع للولايات المتحدة منذ 1898')
ON DUPLICATE KEY UPDATE `capital` = VALUES(`capital`), `population` = VALUES(`population`), `area` = VALUES(`area`), `currency` = VALUES(`currency`), `language` = VALUES(`language`), `timezone` = VALUES(`timezone`), `gdp` = VALUES(`gdp`), `independent` = VALUES(`independent`), `currency_en` = VALUES(`currency_en`), `currency_es` = VALUES(`currency_es`), `currency_de` = VALUES(`currency_de`), `currency_zh` = VALUES(`currency_zh`), `currency_ar` = VALUES(`currency_ar`), `language_en` = VALUES(`language_en`), `language_es` = VALUES(`language_es`), `language_de` = VALUES(`language_de`), `language_zh` = VALUES(`language_zh`), `language_ar` = VALUES(`language_ar`), `independent_en` = VALUES(`independent_en`), `independent_es` = VALUES(`independent_es`), `independent_de` = VALUES(`independent_de`), `independent_zh` = VALUES(`independent_zh`), `independent_ar` = VALUES(`independent_ar`);

-- ── CHINE ──
INSERT INTO `producer_countries` (`id`, `name`, `flag`, `lat`, `lon`, `color`, `tier`, `region`, `region_en`, `region_es`, `region_de`, `region_zh`, `region_ar`, `regions`, `varieties`, `tabacaleras`, `brands`, `production`, `production_en`, `production_es`, `production_de`, `production_zh`, `production_ar`, `revenue`, `rev_detail`, `rev_detail_en`, `rev_detail_es`, `rev_detail_de`, `rev_detail_zh`, `rev_detail_ar`, `notes`, `notes_en`, `notes_es`, `notes_de`, `notes_zh`, `notes_ar`)
VALUES ('china',
  'Chine',
  CONVERT(UNHEX('F09F87A8F09F87B3') USING utf8mb4),
  31.1266,
  104.1672,
  '#B22222',
  'emerging',
  'Asie de l''Est',
  'East Asia',
  'Asia Oriental',
  'Ostasien',
  '东亚',
  'شرق آسيا',
  '[]',
  '[]',
  '["Great Wall Cigar Factory (China Tobacco Sichuan Industrial)"]',
  '[{"name":"Great Wall Cigars","desc":"Shifang, Sichuan, 1918 — le 132, roulé main, et 1,5 million de cigares main par an","iconic":true}]',
  '1,5 million de cigares roulés main par an à Shifang (2017), pour 560 millions de machine',
  '1.5 million hand-rolled cigars a year in Shifang (2017), against 560 million machine-made',
  '1,5 millones de puros liados a mano al año en Shifang (2017), frente a 560 millones de máquina',
  '1,5 Millionen handgerollte Zigarren im Jahr in Shifang (2017), gegen 560 Millionen aus der Maschine',
  '什邡每年手工卷制150万支（2017年），机制则为5.6亿支',
  '1.5 مليون سيجار مُلفوف يدويًّا في السنة في شيفانغ (2017)، مقابل 560 مليونًا بالآلة',
  '',
  'Le marché est intérieur, sous monopole d''État. L''export commence : accords de distribution sur trois marchés en 2024, puis, le 23 juillet 2025, un accord mondial exclusif hors Chine continentale entre China Tobacco International (HK) et China Tobacco Sichuan Industrial, signé à la fabrique de Shifang.',
  'The market is domestic, under a state monopoly. Export is beginning: distribution agreements in three markets in 2024, then, on 23 July 2025, an exclusive worldwide agreement outside mainland China between China Tobacco International (HK) and China Tobacco Sichuan Industrial, signed at the Shifang factory.',
  'El mercado es interior, bajo monopolio de Estado. La exportación empieza: acuerdos de distribución en tres mercados en 2024, luego, el 23 de julio de 2025, un acuerdo mundial exclusivo fuera de la China continental entre China Tobacco International (HK) y China Tobacco Sichuan Industrial, firmado en la fábrica de Shifang.',
  'Der Markt ist ein Binnenmarkt unter Staatsmonopol. Der Export beginnt: Vertriebsvereinbarungen in drei Märkten 2024, dann am 23. Juli 2025 ein exklusives weltweites Abkommen außerhalb Festlandchinas zwischen China Tobacco International (HK) und China Tobacco Sichuan Industrial, unterzeichnet in der Fabrik von Shifang.',
  '市场在国内，属国家专卖。出口刚刚起步：2024年在三个市场签订分销协议；2025年7月23日，中烟国际（香港）与四川中烟在什邡工厂签署中国大陆以外的全球独家协议。',
  'السوق داخلية تحت احتكار الدولة. وبدأ التصدير: اتفاقات توزيع في ثلاث أسواق سنة 2024، ثم في 23 تموز/يوليو 2025 اتفاق عالمي حصري خارج الصين القارية بين China Tobacco International (HK) وChina Tobacco Sichuan Industrial، وُقّع في مصنع شيفانغ.',
  'Le Sichuan cultive du tabac depuis la dynastie Qing, et Shifang, à deux heures au nord de Chengdu, depuis quatre siècles selon la presse du métier. Une semence cubaine y a été introduite au début des années 2000 ; des variétés locales poussent ailleurs ; des essais sont menés à Hainan. La fabrique achète aussi des feuilles en République dominicaine, au Mexique et en Indonésie. L''atlas ne pose ni zone ni variété : il attend une source qui décrive les champs, pas seulement la fabrique.',
  'Sichuan has grown tobacco since the Qing dynasty, and Shifang, two hours north of Chengdu, for four centuries according to the trade press. A Cuban seed was introduced there in the early 2000s; local varieties grow elsewhere; trials are under way in Hainan. The factory also buys leaf in the Dominican Republic, Mexico and Indonesia. This atlas sets neither zone nor variety: it awaits a source that describes the fields, not only the factory.',
  'Sichuan cultiva tabaco desde la dinastía Qing, y Shifang, a dos horas al norte de Chengdu, desde hace cuatro siglos según la prensa del oficio. Una semilla cubana se introdujo allí a principios de los años 2000; variedades locales crecen en otros lugares; hay ensayos en Hainan. La fábrica compra también hoja en República Dominicana, México e Indonesia. Este atlas no fija ni zona ni variedad: espera una fuente que describa los campos, no solo la fábrica.',
  'Sichuan baut seit der Qing-Dynastie Tabak an, und Shifang, zwei Stunden nördlich von Chengdu, seit vier Jahrhunderten laut Fachpresse. Ein kubanisches Saatgut wurde dort Anfang der 2000er eingeführt; anderswo wachsen lokale Sorten; Versuche laufen in Hainan. Die Fabrik kauft auch Blätter in der Dominikanischen Republik, Mexiko und Indonesien. Dieser Atlas setzt weder Zone noch Sorte: Er wartet auf eine Quelle, die die Felder beschreibt, nicht nur die Fabrik.',
  '四川自清代起种植烟草；据行业媒体，成都以北两小时车程的什邡已种了四百年。2000年代初引进了古巴种子；别处种植本地品种；海南在试种。工厂也从多米尼加、墨西哥和印尼采购烟叶。本图集既不设产区也不设品种：它等待一份描述田地而不只是工厂的资料。',
  'تزرع سيتشوان التبغ منذ أسرة تشينغ، وشيفانغ، على بُعد ساعتين شمال تشنغدو، منذ أربعة قرون بحسب صحافة المهنة. أُدخلت بذرة كوبية هناك في مطلع الألفية؛ وتنمو أصناف محلية في مواضع أخرى؛ وتُجرى تجارب في هاينان. ويشتري المصنع أيضًا أوراقًا من جمهورية الدومينيكان والمكسيك وإندونيسيا. لا يضع هذا الأطلس منطقةً ولا صنفًا: ينتظر مصدرًا يصف الحقول لا المصنع وحده.')
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`), `flag` = VALUES(`flag`), `lat` = VALUES(`lat`), `lon` = VALUES(`lon`), `color` = VALUES(`color`), `tier` = VALUES(`tier`), `region` = VALUES(`region`), `region_en` = VALUES(`region_en`), `region_es` = VALUES(`region_es`), `region_de` = VALUES(`region_de`), `region_zh` = VALUES(`region_zh`), `region_ar` = VALUES(`region_ar`), `regions` = VALUES(`regions`), `varieties` = VALUES(`varieties`), `tabacaleras` = VALUES(`tabacaleras`), `brands` = VALUES(`brands`), `production` = VALUES(`production`), `production_en` = VALUES(`production_en`), `production_es` = VALUES(`production_es`), `production_de` = VALUES(`production_de`), `production_zh` = VALUES(`production_zh`), `production_ar` = VALUES(`production_ar`), `revenue` = VALUES(`revenue`), `rev_detail` = VALUES(`rev_detail`), `rev_detail_en` = VALUES(`rev_detail_en`), `rev_detail_es` = VALUES(`rev_detail_es`), `rev_detail_de` = VALUES(`rev_detail_de`), `rev_detail_zh` = VALUES(`rev_detail_zh`), `rev_detail_ar` = VALUES(`rev_detail_ar`), `notes` = VALUES(`notes`), `notes_en` = VALUES(`notes_en`), `notes_es` = VALUES(`notes_es`), `notes_de` = VALUES(`notes_de`), `notes_zh` = VALUES(`notes_zh`), `notes_ar` = VALUES(`notes_ar`);

INSERT INTO `producer_geo` (`country_id`, `capital`, `population`, `area`, `currency`, `language`, `timezone`, `gdp`, `independent`, `currency_en`, `currency_es`, `currency_de`, `currency_zh`, `currency_ar`, `language_en`, `language_es`, `language_de`, `language_zh`, `language_ar`, `independent_en`, `independent_es`, `independent_de`, `independent_zh`, `independent_ar`)
VALUES ('china', 'Pékin', '1 408 M (2024)', '9 596 961 km²', 'Yuan renminbi (CNY)', 'Chinois (mandarin)', 'UTC+8', '18 700 Md$ (2024)', '1949 (République populaire)', 'Renminbi yuan (CNY)', 'Yuan renminbi (CNY)', 'Renminbi Yuan (CNY)', '人民币（CNY）', 'اليوان الصيني (CNY)', 'Chinese (Mandarin)', 'Chino (mandarín)', 'Chinesisch (Mandarin)', '汉语（普通话）', 'الصينية (الماندرين)', '1949 (People''s Republic)', '1949 (República Popular)', '1949 (Volksrepublik)', '1949 年（人民共和国）', '1949 (الجمهورية الشعبية)')
ON DUPLICATE KEY UPDATE `capital` = VALUES(`capital`), `population` = VALUES(`population`), `area` = VALUES(`area`), `currency` = VALUES(`currency`), `language` = VALUES(`language`), `timezone` = VALUES(`timezone`), `gdp` = VALUES(`gdp`), `independent` = VALUES(`independent`), `currency_en` = VALUES(`currency_en`), `currency_es` = VALUES(`currency_es`), `currency_de` = VALUES(`currency_de`), `currency_zh` = VALUES(`currency_zh`), `currency_ar` = VALUES(`currency_ar`), `language_en` = VALUES(`language_en`), `language_es` = VALUES(`language_es`), `language_de` = VALUES(`language_de`), `language_zh` = VALUES(`language_zh`), `language_ar` = VALUES(`language_ar`), `independent_en` = VALUES(`independent_en`), `independent_es` = VALUES(`independent_es`), `independent_de` = VALUES(`independent_de`), `independent_zh` = VALUES(`independent_zh`), `independent_ar` = VALUES(`independent_ar`);

-- ── Graycliff ──

INSERT INTO `brands` (`name`, `country_id`, `founded`, `factory`, `source`, `history`, `gamme`, `history_en`, `gamme_en`, `history_es`, `gamme_es`, `history_de`, `gamme_de`, `history_zh`, `gamme_zh`, `history_ar`, `gamme_ar`)
VALUES ('Graycliff',
        'bahamas',
        'Janvier 1997 — Nassau, Bahamas',
        'Graycliff Cigar Company, à cinquante pas du restaurant Graycliff, Nassau',
        'cigaraficionado.com « A $20 Nassau » (Enrico Garzaroli, propriétaire de l''hôtel-restaurant Graycliff, fait sortir de Cuba Avelino Lara en 1993 ; l''assemblage — tabacs du Brésil, du Nicaragua, du Honduras, parfois d''Équateur et du Cameroun, cape d''Indonésie, bétune au sauternes — vendu aux États-Unis dès octobre 1997 ; atelier de rouleurs cubains retraités, moyenne d''âge 64 ans ; 650 000 cigares en 1999 ; marque Bahiba) ; graycliff.com (production commencée en janvier 1997 avec un seul rouleur dans l''entrée du restaurant ; seize rouleurs ; Enrico et Paolo Garzaroli assemblent depuis le départ de Lara en 2000)',
        'Graycliff est d''abord un hôtel-restaurant de Nassau, sur une colline qui regarde les paquebots entrer au port, et son propriétaire, Enrico Garzaroli, y vendait des havanes depuis vingt ans quand il a voulu les siens. Il a fait venir Avelino Lara — l''ancien chef d''El Laguito, l''homme du Cohiba — dont il a organisé la sortie de Cuba en 1993, en touriste d''abord, puis avec la permission de rester. Ensemble ils ont composé un assemblage de tabacs importés : Brésil, Nicaragua, Honduras, parfois Équateur et Cameroun, sous une cape d''Indonésie que Lara lustrait à la bétune, une macération d''alcool et d''épices dont Garzaroli ne livre qu''un ingrédient, le sauternes.

La production a commencé en janvier 1997 avec un seul rouleur, assis dans l''entrée du restaurant — la maison le dit, et la presse du métier a décrit la table de roulage que les clients voyaient en entrant. Les cigares sont partis aux États-Unis en octobre 1997. L''atelier, à cinquante pas du restaurant, était peuplé de rouleurs cubains retraités que Garzaroli avait fait venir, moyenne d''âge soixante-quatre ans, quatre d''entre eux proches de quatre-vingts ; il a déclaré six cent cinquante mille cigares roulés en 1999. Lara s''est retiré en 2000 ; Enrico et son fils Paolo assemblent depuis, avec seize rouleurs.

Les Bahamas ne cultivent rien : c''est un pays de roulage, et l''atlas l''ouvre pour cette seule maison, comme il a ouvert la Suisse. C''est ici que La Palina, dont l''atlas porte la fiche, a été relancée en 2010 avant de partir ailleurs.',
        '[{"name":"Graycliff","color":"#6B4226","force":"Medium","wrapper":"Indonésie","vitolas":[],"story":"L''assemblage d''Avelino Lara, 1997 — Brésil, Nicaragua, Honduras sous cape d''Indonésie lustrée à la bétune."},{"name":"Bahiba","color":"#8B5A2B","force":"Medium-Full","wrapper":"Non divulguée","vitolas":[],"story":"Bahamas et Cohiba, contractés — lancée en août 2000, dit le fondateur."}]',
        'Graycliff is first a hotel and restaurant in Nassau, on a hill that watches the liners come into port, and its owner, Enrico Garzaroli, had been selling Havanas there for twenty years when he wanted his own. He brought in Avelino Lara — the former head of El Laguito, the man of the Cohiba — whose exit from Cuba he arranged in 1993, as a tourist first, then with permission to stay. Together they composed a blend of imported tobaccos: Brazil, Nicaragua, Honduras, sometimes Ecuador and Cameroon, under an Indonesian wrapper that Lara polished with bethune, a maceration of alcohol and spices of which Garzaroli discloses only one ingredient, Sauternes.

Production began in January 1997 with a single roller, seated in the restaurant''s entrance — the house says so, and the trade press described the rolling table customers saw as they walked in. The cigars went to the United States in October 1997. The workshop, fifty paces from the restaurant, was staffed with retired Cuban rollers Garzaroli had brought over, average age sixty-four, four of them near eighty; he reported six hundred and fifty thousand cigars rolled in 1999. Lara retired in 2000; Enrico and his son Paolo have blended since, with sixteen rollers.

The Bahamas grow nothing: it is a rolling country, and this atlas opens it for this single house, as it opened Switzerland. It is here that La Palina, whose entry this atlas carries, was relaunched in 2010 before moving elsewhere.',
        '[{"name":"Graycliff","color":"#6B4226","force":"Medium","wrapper":"Indonesian","vitolas":[],"story":"Avelino Lara''s blend, 1997 — Brazil, Nicaragua, Honduras under an Indonesian wrapper polished with bethune."},{"name":"Bahiba","color":"#8B5A2B","force":"Medium-Full","wrapper":"Undisclosed","vitolas":[],"story":"Bahamas and Cohiba, contracted — launched in August 2000, the founder says."}]',
        'Graycliff es primero un hotel-restaurante de Nassau, en una colina que mira entrar los cruceros al puerto, y su propietario, Enrico Garzaroli, vendía allí habanos desde hacía veinte años cuando quiso los suyos. Hizo venir a Avelino Lara — el antiguo jefe de El Laguito, el hombre del Cohiba — cuya salida de Cuba organizó en 1993, primero como turista, luego con permiso para quedarse. Juntos compusieron una ligada de tabacos importados: Brasil, Nicaragua, Honduras, a veces Ecuador y Camerún, bajo una capa de Indonesia que Lara lustraba con betún, una maceración de alcohol y especias de la que Garzaroli solo revela un ingrediente, el sauternes.

La producción empezó en enero de 1997 con un solo torcedor, sentado en la entrada del restaurante — la casa lo dice, y la prensa del oficio describió la mesa de torcido que los clientes veían al entrar. Los puros salieron hacia Estados Unidos en octubre de 1997. El taller, a cincuenta pasos del restaurante, estaba poblado de torcedores cubanos jubilados que Garzaroli había hecho venir, edad media sesenta y cuatro años, cuatro de ellos cerca de los ochenta; declaró seiscientos cincuenta mil puros liados en 1999. Lara se retiró en 2000; Enrico y su hijo Paolo ligan desde entonces, con dieciséis torcedores.

Las Bahamas no cultivan nada: es un país de liado, y este atlas lo abre por esta sola casa, como abrió Suiza. Es aquí donde La Palina, cuya ficha lleva este atlas, fue relanzada en 2010 antes de irse a otra parte.',
        '[{"name":"Graycliff","color":"#6B4226","force":"Medium","wrapper":"Indonesia","vitolas":[],"story":"La ligada de Avelino Lara, 1997 — Brasil, Nicaragua, Honduras bajo capa de Indonesia lustrada con betún."},{"name":"Bahiba","color":"#8B5A2B","force":"Medium-Full","wrapper":"No divulgada","vitolas":[],"story":"Bahamas y Cohiba, contraídos — lanzada en agosto de 2000, dice el fundador."}]',
        'Graycliff ist zunächst ein Hotel-Restaurant in Nassau, auf einem Hügel, der die Kreuzfahrtschiffe in den Hafen einlaufen sieht, und sein Besitzer Enrico Garzaroli verkaufte dort seit zwanzig Jahren Havannas, als er seine eigenen wollte. Er holte Avelino Lara — den früheren Leiter von El Laguito, den Mann der Cohiba —, dessen Ausreise aus Kuba er 1993 organisierte, zuerst als Tourist, dann mit Bleibeerlaubnis. Gemeinsam komponierten sie einen Blend aus importierten Tabaken: Brasilien, Nicaragua, Honduras, manchmal Ecuador und Kamerun, unter einem indonesischen Deckblatt, das Lara mit Betún polierte, einer Mazeration aus Alkohol und Gewürzen, von der Garzaroli nur eine Zutat nennt, Sauternes.

Die Produktion begann im Januar 1997 mit einem einzigen Roller, der im Eingang des Restaurants saß — das Haus sagt es, und die Fachpresse beschrieb den Rolltisch, den die Gäste beim Eintreten sahen. Die Zigarren gingen im Oktober 1997 in die Vereinigten Staaten. Die Werkstatt, fünfzig Schritte vom Restaurant, war mit pensionierten kubanischen Rollern besetzt, die Garzaroli hatte kommen lassen, Durchschnittsalter vierundsechzig, vier von ihnen nahe achtzig; er meldete sechshundertfünfzigtausend gerollte Zigarren für 1999. Lara zog sich 2000 zurück; seither blenden Enrico und sein Sohn Paolo, mit sechzehn Rollern.

Die Bahamas bauen nichts an: Es ist ein Rollland, und dieser Atlas öffnet es für dieses eine Haus, wie er die Schweiz öffnete. Hier wurde La Palina, deren Eintrag dieser Atlas führt, 2010 neu lanciert, bevor sie anderswohin ging.',
        '[{"name":"Graycliff","color":"#6B4226","force":"Medium","wrapper":"Indonesisch","vitolas":[],"story":"Der Blend von Avelino Lara, 1997 — Brasilien, Nicaragua, Honduras unter einem mit Betún polierten indonesischen Deckblatt."},{"name":"Bahiba","color":"#8B5A2B","force":"Medium-Full","wrapper":"Nicht angegeben","vitolas":[],"story":"Bahamas und Cohiba, zusammengezogen — lanciert im August 2000, sagt der Gründer."}]',
        'Graycliff 首先是拿骚的一家酒店餐厅，坐落在俯瞰邮轮进港的山丘上；店主恩里科·加尔扎罗利在那里卖了二十年古巴雪茄之后，想要自己的雪茄。他请来阿韦利诺·拉拉——El Laguito 的前厂长、Cohiba 背后的人——并于1993年安排他离开古巴，先以游客身份，后获准长住。两人一起用进口烟叶调配：巴西、尼加拉瓜、洪都拉斯，有时是厄瓜多尔和喀麦隆，配印尼茄衣，拉拉用「贝通」——酒精与香料的浸泡液——为茄衣抛光，加尔扎罗利只透露其中一味：苏玳甜酒。

生产始于1997年1月，一位卷工坐在餐厅入口处——公司这样说，行业媒体也描写过客人进门就看到的卷制台。雪茄于1997年10月运往美国。作坊离餐厅五十步，由加尔扎罗利请来的古巴退休卷工组成，平均年龄六十四岁，其中四位年近八十；他申报1999年卷制了六十五万支。拉拉2000年退休；此后由恩里科与儿子保罗调配，十六位卷工。

巴哈马不种植任何烟草：这是卷制之国，本图集为这一家公司而开辟它，如同为瑞士那样。本图集载有词条的 La Palina，2010年正是在这里重启，之后才迁往别处。',
        '[{"name":"Graycliff","color":"#6B4226","force":"Medium","wrapper":"印尼","vitolas":[],"story":"阿韦利诺·拉拉1997年的配方——巴西、尼加拉瓜、洪都拉斯，配贝通抛光的印尼茄衣。"},{"name":"Bahiba","color":"#8B5A2B","force":"Medium-Full","wrapper":"未公开","vitolas":[],"story":"「巴哈马」与「Cohiba」的合成词——创始人说2000年8月推出。"}]',
        'غرايكليف أوّلًا فندقٌ ومطعم في ناساو، على تلّة تراقب دخول السفن إلى الميناء، وكان صاحبه إنريكو غارزارولي يبيع فيه الهافانا منذ عشرين سنة حين أراد سيجاراته الخاصة. استقدم أفيلينو لارا — الرئيس السابق لـEl Laguito، رجل Cohiba — الذي رتّب خروجه من كوبا سنة 1993، سائحًا أوّلًا، ثم بإذن بالبقاء. وركّبا معًا مزجةً من أتبغة مستوردة: البرازيل ونيكاراغوا وهندوراس، وأحيانًا الإكوادور والكاميرون، تحت غلاف إندونيسي كان لارا يصقله بالبيتون، نقيعٍ من الكحول والتوابل لا يكشف غارزارولي منه سوى مكوّن واحد، نبيذ سوتيرن.

بدأ الإنتاج في كانون الثاني/يناير 1997 بلفّاف واحد يجلس في مدخل المطعم — تقول الدار ذلك، ووصفت صحافة المهنة طاولة اللفّ التي يراها الزبائن عند الدخول. وذهبت السيجارات إلى الولايات المتحدة في تشرين الأوّل/أكتوبر 1997. وكانت الورشة، على خمسين خطوة من المطعم، مأهولةً بلفّافين كوبيين متقاعدين استقدمهم غارزارولي، بمتوسّط عمر أربع وستين سنة، أربعة منهم قرب الثمانين؛ وأعلن ستمئة وخمسين ألف سيجار مُلفوف سنة 1999. اعتزل لارا سنة 2000؛ ومنذئذٍ يمزج إنريكو وابنه باولو، مع ستة عشر لفّافًا.

لا تزرع البهاما شيئًا: إنّها بلدُ لفّ، ويفتحه هذا الأطلس لهذه الدار وحدها، كما فتح سويسرا. وهنا أُعيد إطلاق La Palina، التي يحمل هذا الأطلس بطاقتها، سنة 2010 قبل أن تنتقل إلى مكان آخر.',
        '[{"name":"Graycliff","color":"#6B4226","force":"Medium","wrapper":"إندونيسي","vitolas":[],"story":"مزجة أفيلينو لارا، 1997 — البرازيل ونيكاراغوا وهندوراس تحت غلاف إندونيسي مصقول بالبيتون."},{"name":"Bahiba","color":"#8B5A2B","force":"Medium-Full","wrapper":"غير معلن","vitolas":[],"story":"اختصارٌ من البهاما وCohiba — أُطلقت في آب/أغسطس 2000، كما يقول المؤسّس."}]')
ON DUPLICATE KEY UPDATE `country_id` = VALUES(`country_id`), `founded` = VALUES(`founded`), `factory` = VALUES(`factory`), `source` = VALUES(`source`), `history` = VALUES(`history`), `gamme` = VALUES(`gamme`), `history_en` = VALUES(`history_en`), `gamme_en` = VALUES(`gamme_en`), `history_es` = VALUES(`history_es`), `gamme_es` = VALUES(`gamme_es`), `history_de` = VALUES(`history_de`), `gamme_de` = VALUES(`gamme_de`), `history_zh` = VALUES(`history_zh`), `gamme_zh` = VALUES(`gamme_zh`), `history_ar` = VALUES(`history_ar`), `gamme_ar` = VALUES(`gamme_ar`);

-- ── Fábrica de Tabaco Estrela ──

INSERT INTO `brands` (`name`, `country_id`, `founded`, `factory`, `source`, `history`, `gamme`, `history_en`, `gamme_en`, `history_es`, `gamme_es`, `history_de`, `gamme_de`, `history_zh`, `gamme_zh`, `history_ar`, `gamme_ar`)
VALUES ('Fábrica de Tabaco Estrela',
        'azores',
        '1882 — Ponta Delgada, Açores',
        'Fábrica de Tabaco Estrela (Empresa Madeirense de Tabacos), paroisse de São José, Ponta Delgada',
        'halfwheel.com « Luciano Cigars & Empresa Madeirense de Tabacos S.A. Launch Constella Group » (2 avril 2025 : EMT, 142 ans d''histoire, exploite la Fábrica de Tabacos Estrela à São Miguel, qui fait surtout des cigarettes et des cigarillos avec un petit atelier de cigares main ; Constella devient la maison mère de Luciano) ; visitpontadelgada.pt « Estrela Tobacco Factory » (fondée en 1882 par José Medeiros Cogumbreiro ; seule à faire ses cigares entièrement à la main ; tripes du Brésil, de Cuba et de Rép. dominicaine, capes des États-Unis et d''Indonésie ; deux jours en moule, séchage à basse température ; Meia Coroa, Coroa, Robusto Estrela) ; lifecooler.com (le cigare est un complément petit mais prestigieux d''une fabrique de cigarettes ; boîtes en bois, personnalisables) ; agroportal.pt (136e anniversaire fêté en 2018)',
        'Les Açores ont eu leur industrie du tabac au XIXe siècle — José Bensaúde ouvre la Fábrica de Tabaco Micaelense en 1866 — et l''Estrela est la seconde fabrique de Ponta Delgada, fondée en 1882 par José Medeiros Cogumbreiro, dans la paroisse de São José. Elle appartient à l''Empresa Madeirense de Tabacos, EMT, et elle fait ce que font les fabriques atlantiques : des cigarettes et des cigarillos, en volume.

Le cigare y est un complément, petit et tenu à part, et c''est lui qui vaut la fiche : un atelier où des ouvrières roulent entièrement à la main, sur des tripes du Brésil, de Cuba et de République dominicaine, sous cape américaine ou indonésienne. Le cigare passe deux jours en moule, sèche à basse température, puis reçoit sa cape — Meia Coroa, Coroa, Robusto Estrela, en boîtes de bois. L''atlas classe la maison aux Açores parce que c''est là que la main travaille ; le tabac vient d''ailleurs, comme aux Canaries voisines.

En avril 2025, EMT et Luciano Cigars, dont l''atlas porte la fiche, ont fondé Constella Group, qui devient la maison mère de Luciano : une fabrique de cigarettes des Açores est désormais l''associée d''une fabrique de cigares d''Estelí. C''est par ce lien, autant que par son atelier, que l''Estrela entre ici.',
        '[{"name":"Robusto Estrela","color":"#5B3A29","force":"Medium","wrapper":"États-Unis ou Indonésie","vitolas":[],"story":"Le format moderne de la maison ; deux jours en moule avant la cape."},{"name":"Coroa","color":"#8B5A2B","force":"Medium","wrapper":"Non divulguée","vitolas":[],"story":"La couronne — le format traditionnel, avec la Meia Coroa, sa demie."}]',
        'The Azores had their tobacco industry in the nineteenth century — José Bensaúde opened Fábrica de Tabaco Micaelense in 1866 — and the Estrela is Ponta Delgada''s second factory, founded in 1882 by José Medeiros Cogumbreiro, in the parish of São José. It belongs to Empresa Madeirense de Tabacos, EMT, and it does what Atlantic factories do: cigarettes and cigarillos, in volume.

The cigar there is a complement, small and kept apart, and it is what earns the entry: a workshop where women roll entirely by hand, on fillers from Brazil, Cuba and the Dominican Republic, under an American or Indonesian wrapper. The cigar spends two days in a mould, dries at low temperature, then receives its wrapper — Meia Coroa, Coroa, Robusto Estrela, in wooden boxes. This atlas classifies the house in the Azores because that is where the hand works; the tobacco comes from elsewhere, as in the neighbouring Canaries.

In April 2025, EMT and Luciano Cigars, whose entry this atlas carries, founded Constella Group, which becomes Luciano''s parent company: an Azorean cigarette factory is now the partner of an Estelí cigar factory. It is through that link, as much as through its workshop, that the Estrela enters here.',
        '[{"name":"Robusto Estrela","color":"#5B3A29","force":"Medium","wrapper":"American or Indonesian","vitolas":[],"story":"The house''s modern size; two days in the mould before the wrapper."},{"name":"Coroa","color":"#8B5A2B","force":"Medium","wrapper":"Undisclosed","vitolas":[],"story":"The corona — the traditional size, with the Meia Coroa, its half."}]',
        'Las Azores tuvieron su industria del tabaco en el siglo XIX — José Bensaúde abre la Fábrica de Tabaco Micaelense en 1866 — y la Estrela es la segunda fábrica de Ponta Delgada, fundada en 1882 por José Medeiros Cogumbreiro, en la parroquia de São José. Pertenece a la Empresa Madeirense de Tabacos, EMT, y hace lo que hacen las fábricas atlánticas: cigarrillos y cigarritos, en volumen.

El puro es allí un complemento, pequeño y aparte, y es lo que vale la ficha: un taller donde obreras lían enteramente a mano, con tripas de Brasil, Cuba y República Dominicana, bajo capa americana o indonesia. El puro pasa dos días en molde, seca a baja temperatura y recibe luego su capa — Meia Coroa, Coroa, Robusto Estrela, en cajas de madera. Este atlas clasifica la casa en las Azores porque es allí donde trabaja la mano; el tabaco viene de otra parte, como en las Canarias vecinas.

En abril de 2025, EMT y Luciano Cigars, cuya ficha lleva este atlas, fundaron Constella Group, que se convierte en la casa matriz de Luciano: una fábrica de cigarrillos de las Azores es ahora la socia de una fábrica de puros de Estelí. Es por ese vínculo, tanto como por su taller, que la Estrela entra aquí.',
        '[{"name":"Robusto Estrela","color":"#5B3A29","force":"Medium","wrapper":"Estados Unidos o Indonesia","vitolas":[],"story":"El formato moderno de la casa; dos días en molde antes de la capa."},{"name":"Coroa","color":"#8B5A2B","force":"Medium","wrapper":"No divulgada","vitolas":[],"story":"La corona — el formato tradicional, con la Meia Coroa, su mitad."}]',
        'Die Azoren hatten ihre Tabakindustrie im 19. Jahrhundert — José Bensaúde eröffnete 1866 die Fábrica de Tabaco Micaelense —, und die Estrela ist die zweite Fabrik von Ponta Delgada, gegründet 1882 von José Medeiros Cogumbreiro, in der Pfarrei São José. Sie gehört der Empresa Madeirense de Tabacos, EMT, und tut, was atlantische Fabriken tun: Zigaretten und Zigarillos, in Menge.

Die Zigarre ist dort eine Ergänzung, klein und getrennt gehalten, und sie ist es, die den Eintrag verdient: eine Werkstatt, in der Arbeiterinnen vollständig von Hand rollen, auf Einlagen aus Brasilien, Kuba und der Dominikanischen Republik, unter amerikanischem oder indonesischem Deckblatt. Die Zigarre liegt zwei Tage in der Form, trocknet bei niedriger Temperatur und erhält dann ihr Deckblatt — Meia Coroa, Coroa, Robusto Estrela, in Holzkisten. Dieser Atlas ordnet das Haus auf den Azoren ein, weil dort die Hand arbeitet; der Tabak kommt von anderswo, wie auf den benachbarten Kanaren.

Im April 2025 gründeten EMT und Luciano Cigars, deren Eintrag dieser Atlas führt, die Constella Group, die Lucianos Muttergesellschaft wird: Eine azorische Zigarettenfabrik ist nun Partnerin einer Zigarrenfabrik in Estelí. Durch diese Verbindung, so sehr wie durch ihre Werkstatt, tritt die Estrela hier ein.',
        '[{"name":"Robusto Estrela","color":"#5B3A29","force":"Medium","wrapper":"Amerikanisch oder indonesisch","vitolas":[],"story":"Das moderne Format des Hauses; zwei Tage in der Form vor dem Deckblatt."},{"name":"Coroa","color":"#8B5A2B","force":"Medium","wrapper":"Nicht angegeben","vitolas":[],"story":"Die Corona — das traditionelle Format, mit der Meia Coroa, ihrer Hälfte."}]',
        '亚速尔在十九世纪有过自己的烟草工业——若泽·本索德1866年开办 Fábrica de Tabaco Micaelense——而 Estrela 是蓬塔德尔加达的第二家工厂，1882年由若泽·梅德罗斯·科贡布雷罗在圣若泽堂区创立。它属于马德拉烟草公司 EMT，做的是大西洋工厂都在做的事：卷烟和小雪茄，走量。

雪茄在那里是一项补充，规模小、另辟一室，正是它值得这个词条：一间女工们完全手工卷制的作坊，用巴西、古巴与多米尼加的填充，配美国或印尼茄衣。雪茄在模具里放两天，低温干燥，再上茄衣——Meia Coroa、Coroa、Robusto Estrela，木盒装。本图集把这家公司归入亚速尔，因为手艺在那里；烟叶来自别处，一如邻近的加那利。

2025年4月，EMT 与本图集载有词条的 Luciano Cigars 共同创立 Constella Group，后者成为 Luciano 的母公司：一家亚速尔卷烟厂如今是埃斯特利一家雪茄厂的合伙人。Estrela 进入本图集，既因它的作坊，也因这层关系。',
        '[{"name":"Robusto Estrela","color":"#5B3A29","force":"Medium","wrapper":"美国或印尼","vitolas":[],"story":"公司的现代尺寸；上茄衣前在模具里放两天。"},{"name":"Coroa","color":"#8B5A2B","force":"Medium","wrapper":"未公开","vitolas":[],"story":"皇冠——传统尺寸，另有其半支 Meia Coroa。"}]',
        'كان للأزور صناعة تبغ في القرن التاسع عشر — افتتح جوزيه بنساودي Fábrica de Tabaco Micaelense سنة 1866 — وEstrela هي المصنع الثاني في بونتا ديلغادا، أسّسه سنة 1882 جوزيه ميديروس كوغومبريرو، في أبرشية ساو جوزيه. وهي ملك Empresa Madeirense de Tabacos، EMT، وتصنع ما تصنعه مصانع الأطلسي: السجائر والسيجاريلو، بالكمّيات.

السيجار هناك تكملةٌ صغيرة مفصولة، وهو ما يستحقّ البطاقة: ورشةٌ تلفّ فيها عاملات يدويًّا بالكامل، على حشوات من البرازيل وكوبا وجمهورية الدومينيكان، تحت غلاف أمريكي أو إندونيسي. يمضي السيجار يومين في القالب، ويجفّ في حرارة منخفضة، ثم يتلقّى غلافه — Meia Coroa وCoroa وRobusto Estrela، في علب خشبية. يصنّف هذا الأطلس الدار في الأزور لأنّ اليد تعمل هناك؛ والتبغ يأتي من مكان آخر، كما في جزر الكناري المجاورة.

وفي نيسان/أبريل 2025 أسّست EMT وLuciano Cigars، التي يحمل هذا الأطلس بطاقتها، Constella Group التي تصير الشركة الأمّ لـLuciano: مصنعُ سجائر أزوري صار شريكًا لمصنع سيجار في إستيلي. وبهذه الصلة، بقدر ورشتها، تدخل Estrela هنا.',
        '[{"name":"Robusto Estrela","color":"#5B3A29","force":"Medium","wrapper":"أمريكي أو إندونيسي","vitolas":[],"story":"القياس الحديث للدار؛ يومان في القالب قبل الغلاف."},{"name":"Coroa","color":"#8B5A2B","force":"Medium","wrapper":"غير معلن","vitolas":[],"story":"الكورونا — القياس التقليدي، مع Meia Coroa، نصفه."}]')
ON DUPLICATE KEY UPDATE `country_id` = VALUES(`country_id`), `founded` = VALUES(`founded`), `factory` = VALUES(`factory`), `source` = VALUES(`source`), `history` = VALUES(`history`), `gamme` = VALUES(`gamme`), `history_en` = VALUES(`history_en`), `gamme_en` = VALUES(`gamme_en`), `history_es` = VALUES(`history_es`), `gamme_es` = VALUES(`gamme_es`), `history_de` = VALUES(`history_de`), `gamme_de` = VALUES(`gamme_de`), `history_zh` = VALUES(`history_zh`), `gamme_zh` = VALUES(`gamme_zh`), `history_ar` = VALUES(`history_ar`), `gamme_ar` = VALUES(`gamme_ar`);

-- ── Don Collins ──

INSERT INTO `brands` (`name`, `country_id`, `founded`, `factory`, `source`, `history`, `gamme`, `history_en`, `gamme_en`, `history_es`, `gamme_es`, `history_de`, `gamme_de`, `history_zh`, `gamme_zh`, `history_ar`, `gamme_ar`)
VALUES ('Don Collins',
        'puertorico',
        '1991 — Vieux San Juan, Porto Rico',
        'Puerto Rico Tobacco Corporation, calle del Cristo 59, Vieux San Juan',
        'don-collins.com « Our History » (la Puerto Rico Tobacco Corporation fait Don Collins depuis 1991 ; la maison affirme descendre d''une Porto Rico Leaf Company de 1506, puis de la Porto Rican-American Tobacco Company de 1898-1899 — le premier point n''est pas vérifiable, le second cite l''arrêt United States v. American Tobacco Co. de 1911) ; supreme.justia.com « United States v. American Tobacco Co., 221 U.S. 106 (1911) » (l''American Tobacco fait organiser en 1899 la Porto Rican-American Tobacco Company, qui reprend Rucabado y Portela, fabricant de cigares et de cigarettes) ; tripadvisor.com (atelier-boutique de la calle del Cristo, rouleurs visibles)',
        'Don Collins est la marque d''un atelier-boutique du Vieux San Juan, calle del Cristo, où l''on voit rouler les cigares depuis la rue. La Puerto Rico Tobacco Corporation la fait depuis 1991 — c''est la date que l''atlas retient, et la seule que la maison donne sans qu''il faille la discuter.

Car la maison raconte plus loin. Elle se dit issue d''une Porto Rico Leaf Company qu''aurait chartée l''Espagne vers 1506, et se présente comme la plus vieille fabrique de cigares des Caraïbes ; l''atlas rapporte cette affirmation à celle qui la fait, et ne l''a trouvée nulle part ailleurs. Ce qui est établi est plus modeste et plus solide : en 1899, l''American Tobacco Company fait organiser la Porto Rican-American Tobacco Company, qui reprend Rucabado y Portela, fabricant de cigares et de cigarettes de l''île — c''est écrit dans l''arrêt de 1911 par lequel la Cour suprême des États-Unis démantèle le trust. La Puerto Rico Tobacco Corporation d''aujourd''hui se dit l''héritière de cette société-là ; le lien est plausible, et l''atlas le laisse au conditionnel.

Porto Rico fut un grand pays de tabac jusqu''aux années 1920. Il ne lui reste, pour le roulé main, que cet atelier, et l''atlas ouvre l''île pour lui — un pays de roulage documenté par sa propre vitrine, ce que la fiche dit plutôt que de le taire.',
        '[{"name":"Don Collins","color":"#6B4226","force":"Medium","wrapper":"Portoricaine, dit la maison","vitolas":[],"story":"Roulé main dans l''atelier de la calle del Cristo depuis 1991 ; tabac portoricain sans pesticide, affirme la maison."}]',
        'Don Collins is the brand of a workshop-shop in Old San Juan, on Calle del Cristo, where cigars can be seen rolled from the street. Puerto Rico Tobacco Corporation has made it since 1991 — the date this atlas retains, and the only one the house gives that needs no discussion.

For the house tells more. It says it descends from a Porto Rico Leaf Company supposedly chartered by Spain around 1506, and presents itself as the oldest cigar factory in the Caribbean; this atlas attributes that claim to the one making it, and found it nowhere else. What is established is more modest and more solid: in 1899, the American Tobacco Company had the Porto Rican-American Tobacco Company organised, taking over Rucabado y Portela, a cigar and cigarette maker on the island — it is written in the 1911 ruling by which the United States Supreme Court broke up the trust. Today''s Puerto Rico Tobacco Corporation says it is the heir of that company; the link is plausible, and this atlas leaves it in the conditional.

Puerto Rico was a major tobacco country until the 1920s. For hand-rolling, only this workshop remains, and this atlas opens the island for it — a rolling country documented by its own shopfront, which the entry says rather than hides.',
        '[{"name":"Don Collins","color":"#6B4226","force":"Medium","wrapper":"Puerto Rican, the house says","vitolas":[],"story":"Hand-rolled in the Calle del Cristo workshop since 1991; pesticide-free Puerto Rican tobacco, the house claims."}]',
        'Don Collins es la marca de un taller-tienda del Viejo San Juan, en la calle del Cristo, donde se ve liar los puros desde la calle. La Puerto Rico Tobacco Corporation la hace desde 1991 — la fecha que este atlas retiene, y la única que la casa da sin que haya que discutirla.

Porque la casa cuenta más. Se dice heredera de una Porto Rico Leaf Company que España habría autorizado hacia 1506, y se presenta como la fábrica de puros más antigua del Caribe; este atlas atribuye esa afirmación a quien la hace, y no la encontró en ninguna otra parte. Lo establecido es más modesto y más sólido: en 1899, la American Tobacco Company hace organizar la Porto Rican-American Tobacco Company, que absorbe a Rucabado y Portela, fabricante de puros y cigarrillos de la isla — está escrito en la sentencia de 1911 con la que el Tribunal Supremo de Estados Unidos desmantela el trust. La Puerto Rico Tobacco Corporation de hoy se dice heredera de aquella sociedad; el vínculo es plausible, y este atlas lo deja en condicional.

Puerto Rico fue un gran país de tabaco hasta los años 1920. Del liado a mano solo le queda este taller, y este atlas abre la isla por él — un país de liado documentado por su propio escaparate, lo que la ficha dice en vez de callarlo.',
        '[{"name":"Don Collins","color":"#6B4226","force":"Medium","wrapper":"Puertorriqueña, dice la casa","vitolas":[],"story":"Liado a mano en el taller de la calle del Cristo desde 1991; tabaco puertorriqueño sin pesticidas, afirma la casa."}]',
        'Don Collins ist die Marke einer Werkstatt mit Laden in Alt-San Juan, in der Calle del Cristo, wo man von der Straße aus Zigarren rollen sieht. Die Puerto Rico Tobacco Corporation macht sie seit 1991 — das Datum, das dieser Atlas behält, und das einzige, das das Haus nennt, ohne dass man darüber streiten müsste.

Denn das Haus erzählt mehr. Es sagt, es stamme von einer Porto Rico Leaf Company ab, die Spanien um 1506 konzessioniert habe, und stellt sich als älteste Zigarrenfabrik der Karibik vor; dieser Atlas schreibt diese Behauptung dem zu, der sie aufstellt, und fand sie nirgends sonst. Was feststeht, ist bescheidener und solider: 1899 ließ die American Tobacco Company die Porto Rican-American Tobacco Company organisieren, die Rucabado y Portela übernahm, einen Zigarren- und Zigarettenhersteller der Insel — so steht es im Urteil von 1911, mit dem der Oberste Gerichtshof der Vereinigten Staaten den Trust zerschlug. Die heutige Puerto Rico Tobacco Corporation nennt sich Erbin jener Gesellschaft; die Verbindung ist plausibel, und dieser Atlas belässt sie im Konjunktiv.

Puerto Rico war bis in die 1920er ein großes Tabakland. Vom Handrollen bleibt ihm nur diese Werkstatt, und dieser Atlas öffnet die Insel für sie — ein Rollland, dokumentiert durch sein eigenes Schaufenster, was der Eintrag sagt, statt es zu verschweigen.',
        '[{"name":"Don Collins","color":"#6B4226","force":"Medium","wrapper":"Puerto-ricanisch, sagt das Haus","vitolas":[],"story":"Seit 1991 handgerollt in der Werkstatt der Calle del Cristo; pestizidfreier puerto-ricanischer Tabak, behauptet das Haus."}]',
        'Don Collins 是老圣胡安基督街上一家前店后坊的品牌，从街上就能看到卷雪茄。波多黎各烟草公司自1991年起生产它——这是本图集采用的日期，也是公司给出的唯一无须争论的日期。

因为公司讲得更远。它自称源于一家据说1506年由西班牙特许的 Porto Rico Leaf Company，并自称加勒比现存的老牌雪茄厂；本图集把这一说法归于提出者，在别处未曾找到。可以确定的更朴素也更可靠：1899年，美国烟草公司组建了 Porto Rican-American Tobacco Company，接管岛上的雪茄与卷烟制造商 Rucabado y Portela——这写在美国最高法院1911年拆分该托拉斯的判决里。今天的波多黎各烟草公司自称是那家公司的继承者；这层关系说得通，本图集以存疑的方式保留。

直到1920年代，波多黎各仍是烟草大国。手工卷制如今只剩这一家作坊，本图集为它开辟这座岛——一个由自家橱窗作证的卷制之国，词条把这一点说出来，而不是藏起来。',
        '[{"name":"Don Collins","color":"#6B4226","force":"Medium","wrapper":"公司称为波多黎各烟叶","vitolas":[],"story":"1991年起在基督街作坊手工卷制；公司称用无农药的波多黎各烟叶。"}]',
        'دون كولينز علامةُ ورشة-متجر في سان خوان القديمة، في شارع الكريستو، حيث تُرى السيجارات تُلفّ من الشارع. تصنعها Puerto Rico Tobacco Corporation منذ 1991 — التاريخ الذي يحتفظ به هذا الأطلس، والوحيد الذي تعطيه الدار من دون حاجة إلى نقاش.

لأنّ الدار تروي أبعد من ذلك. تقول إنّها منحدرة من Porto Rico Leaf Company زعمت أنّ إسبانيا رخّصتها نحو 1506، وتقدّم نفسها مصنع السيجار الأقدم في الكاريبي؛ وينسب هذا الأطلس ذلك القول إلى قائله، ولم يجده في أيّ مكان آخر. أمّا الثابت فأكثر تواضعًا وأمتن: في 1899 نظّمت American Tobacco Company شركة Porto Rican-American Tobacco Company التي استوعبت Rucabado y Portela، صانع السيجار والسجائر في الجزيرة — وهذا مكتوب في حكم 1911 الذي فكّكت به المحكمة العليا الأمريكية الاحتكار. وتقول Puerto Rico Tobacco Corporation اليوم إنّها وريثة تلك الشركة؛ الصلة معقولة، ويتركها هذا الأطلس بصيغة الاحتمال.

كانت بورتوريكو بلدًا كبيرًا للتبغ حتى عشرينيات القرن الماضي. ولم يبقَ لها من اللفّ اليدوي سوى هذه الورشة، ويفتح هذا الأطلس الجزيرة من أجلها — بلدُ لفٍّ توثّقه واجهته، وهو ما تقوله البطاقة بدلًا من إخفائه.',
        '[{"name":"Don Collins","color":"#6B4226","force":"Medium","wrapper":"بورتوريكي، كما تقول الدار","vitolas":[],"story":"يُلفّ يدويًّا في ورشة شارع الكريستو منذ 1991؛ تبغ بورتوريكي بلا مبيدات، كما تزعم الدار."}]')
ON DUPLICATE KEY UPDATE `country_id` = VALUES(`country_id`), `founded` = VALUES(`founded`), `factory` = VALUES(`factory`), `source` = VALUES(`source`), `history` = VALUES(`history`), `gamme` = VALUES(`gamme`), `history_en` = VALUES(`history_en`), `gamme_en` = VALUES(`gamme_en`), `history_es` = VALUES(`history_es`), `gamme_es` = VALUES(`gamme_es`), `history_de` = VALUES(`history_de`), `gamme_de` = VALUES(`gamme_de`), `history_zh` = VALUES(`history_zh`), `gamme_zh` = VALUES(`gamme_zh`), `history_ar` = VALUES(`history_ar`), `gamme_ar` = VALUES(`gamme_ar`);

-- ── Tabaqueria de Filipinas ──

INSERT INTO `brands` (`name`, `country_id`, `founded`, `factory`, `source`, `history`, `gamme`, `history_en`, `gamme_en`, `history_es`, `gamme_es`, `history_de`, `gamme_de`, `history_zh`, `gamme_zh`, `history_ar`, `gamme_ar`)
VALUES ('Tabaqueria de Filipinas',
        'philippines',
        '1993 — Manille ; usine à San Pedro, Laguna',
        'Tabaqueria de Filipinas, San Pedro (Laguna) ; plantations dans la vallée de Tubao, La Union',
        'tabaqueria.com (Gabriel « El Magnifico » Ripoll Jr., gérant et consultant du cigare depuis les années 1960, de Hong Kong à la Rép. dominicaine ; à sa retraite en 1993, un petit atelier sur Taft Avenue à Manille avec quatre anciens employés et son plus jeune fils ; ses trois fils le dirigent, plus de 250 personnes ; Isabela pais et tripe de semence cubaine sous cape de Java) ; tobaccoasia.com « Cigars: Made in Asia » (cinq rouleurs dans une maison d''avant-guerre louée du vieux Manille ; plus de 200 employés dans une usine à San Pedro, Laguna ; tabac des plantations de la vallée de Tubao, Luzon du Nord ; 15 000 cigares par jour ; marques Antonio Gimenez, Independencia 1898, Flor de Filipinas ; cape indonésienne, tout le reste philippin ; boîtes de narra faites maison)',
        'Tabaqueria de Filipinas est une maison de retraité. Gabriel Ripoll Jr. — « El Magnifico », dit son entreprise — avait passé sa vie de gérant et de consultant dans le cigare, depuis les années 1960, de Hong Kong à la République dominicaine, quand il a pris sa retraite en 1993 et ouvert un petit atelier sur Taft Avenue, à Manille : quatre anciens employés, son plus jeune fils, et un nom pris à son père. La presse du métier parle de cinq rouleurs dans une maison d''avant-guerre louée du vieux Manille.

L''atelier est devenu une usine à San Pedro, dans la Laguna, avec plus de deux cents personnes — la maison en dit deux cent cinquante —, quinze mille cigares par jour, et ses propres boîtes de narra. Le tabac vient des plantations de la maison dans la vallée de Tubao, au nord de Luzon, et de l''Isabela, la province historique du cigare philippin que l''atlas raconte à la fiche La Flor de la Isabela ; seule la cape est d''Indonésie — Java, comme il est d''usage à Manille depuis un siècle. Trois marques : Antonio Gimenez, Independencia 1898 — l''année de la République —, Flor de Filipinas. Les trois fils du fondateur dirigent.

L''atlas portait trois maisons philippines, toutes héritières de la Tabacalera espagnole de 1881. Celle-ci est la première fondée depuis, et elle fait à façon pour d''autres : la fiche le note, sans savoir pour qui.',
        '[{"name":"Flor de Filipinas","color":"#8B5A2B","force":"Medium","wrapper":"Java","vitolas":[],"story":"L''assemblage des débuts : cape de Java, sous-cape Sarah de la maison, tripe d''Isabela."},{"name":"Antonio Gimenez","color":"#4A3728","force":"Medium-Full","wrapper":"Java","vitolas":[],"story":"Le corsé de la maison — Isabela pais et tripe de semence cubaine, sept formats."},{"name":"Independencia 1898","color":"#7A2E1E","force":"Medium","wrapper":"Non divulguée","vitolas":[],"story":"L''année de la République philippine, sur une bague."}]',
        'Tabaqueria de Filipinas is a retiree''s house. Gabriel Ripoll Jr. — "El Magnifico", his company calls him — had spent his working life as a manager and consultant in cigars, since the 1960s, from Hong Kong to the Dominican Republic, when he retired in 1993 and opened a small workshop on Taft Avenue, Manila: four former employees, his youngest son, and a name taken from his father. The trade press speaks of five rollers in a rented pre-war house in old Manila.

The workshop became a factory in San Pedro, Laguna, with more than two hundred people — the house says two hundred and fifty —, fifteen thousand cigars a day, and its own narra boxes. The tobacco comes from the house''s plantations in the Tubao valley, in northern Luzon, and from Isabela, the historic province of the Philippine cigar that this atlas tells at the La Flor de la Isabela entry; only the wrapper is Indonesian — Java, as has been customary in Manila for a century. Three brands: Antonio Gimenez, Independencia 1898 — the year of the Republic —, Flor de Filipinas. The founder''s three sons run it.

This atlas carried three Philippine houses, all heirs of the Spanish Tabacalera of 1881. This one is the first founded since, and it rolls for others: the entry notes it, without knowing for whom.',
        '[{"name":"Flor de Filipinas","color":"#8B5A2B","force":"Medium","wrapper":"Java","vitolas":[],"story":"The founding blend: Java wrapper, the house''s Sarah binder, Isabela filler."},{"name":"Antonio Gimenez","color":"#4A3728","force":"Medium-Full","wrapper":"Java","vitolas":[],"story":"The house''s full-bodied one — Isabela pais and Cuban-seed filler, seven sizes."},{"name":"Independencia 1898","color":"#7A2E1E","force":"Medium","wrapper":"Undisclosed","vitolas":[],"story":"The year of the Philippine Republic, on a band."}]',
        'Tabaqueria de Filipinas es una casa de jubilado. Gabriel Ripoll Jr. — «El Magnífico», lo llama su empresa — había pasado su vida de gerente y consultor en el puro, desde los años 1960, de Hong Kong a la República Dominicana, cuando se jubiló en 1993 y abrió un pequeño taller en Taft Avenue, en Manila: cuatro antiguos empleados, su hijo menor y un nombre tomado de su padre. La prensa del oficio habla de cinco torcedores en una casa de antes de la guerra alquilada en el viejo Manila.

El taller se convirtió en una fábrica en San Pedro, en la Laguna, con más de doscientas personas — la casa dice doscientas cincuenta —, quince mil puros al día y sus propias cajas de narra. El tabaco viene de las plantaciones de la casa en el valle de Tubao, al norte de Luzón, y de Isabela, la provincia histórica del puro filipino que este atlas cuenta en la ficha La Flor de la Isabela; solo la capa es de Indonesia — Java, como es costumbre en Manila desde hace un siglo. Tres marcas: Antonio Gimenez, Independencia 1898 — el año de la República —, Flor de Filipinas. Los tres hijos del fundador dirigen.

Este atlas llevaba tres casas filipinas, todas herederas de la Tabacalera española de 1881. Esta es la primera fundada desde entonces, y lía para otros: la ficha lo anota, sin saber para quién.',
        '[{"name":"Flor de Filipinas","color":"#8B5A2B","force":"Medium","wrapper":"Java","vitolas":[],"story":"La ligada de los inicios: capa de Java, capote Sarah de la casa, tripa de Isabela."},{"name":"Antonio Gimenez","color":"#4A3728","force":"Medium-Full","wrapper":"Java","vitolas":[],"story":"El fuerte de la casa — Isabela pais y tripa de semilla cubana, siete formatos."},{"name":"Independencia 1898","color":"#7A2E1E","force":"Medium","wrapper":"No divulgada","vitolas":[],"story":"El año de la República filipina, en una anilla."}]',
        'Tabaqueria de Filipinas ist das Haus eines Ruheständlers. Gabriel Ripoll Jr. — „El Magnifico", nennt ihn sein Unternehmen — hatte sein Berufsleben als Manager und Berater im Zigarrengeschäft verbracht, seit den 1960ern, von Hongkong bis zur Dominikanischen Republik, als er 1993 in den Ruhestand ging und eine kleine Werkstatt an der Taft Avenue in Manila eröffnete: vier ehemalige Angestellte, sein jüngster Sohn und ein Name, den er von seinem Vater nahm. Die Fachpresse spricht von fünf Rollern in einem gemieteten Vorkriegshaus im alten Manila.

Die Werkstatt wurde zu einer Fabrik in San Pedro, Laguna, mit über zweihundert Leuten — das Haus sagt zweihundertfünfzig —, fünfzehntausend Zigarren am Tag und eigenen Narra-Kisten. Der Tabak kommt von den Plantagen des Hauses im Tubao-Tal im Norden Luzons und aus Isabela, der historischen Provinz der philippinischen Zigarre, die dieser Atlas im Eintrag La Flor de la Isabela erzählt; nur das Deckblatt ist indonesisch — Java, wie es in Manila seit einem Jahrhundert üblich ist. Drei Marken: Antonio Gimenez, Independencia 1898 — das Jahr der Republik —, Flor de Filipinas. Die drei Söhne des Gründers führen das Haus.

Dieser Atlas führte drei philippinische Häuser, alle Erben der spanischen Tabacalera von 1881. Dieses ist das erste seither gegründete, und es rollt für andere: Der Eintrag vermerkt es, ohne zu wissen, für wen.',
        '[{"name":"Flor de Filipinas","color":"#8B5A2B","force":"Medium","wrapper":"Java","vitolas":[],"story":"Der Gründungs-Blend: Java-Deckblatt, hauseigenes Sarah-Umblatt, Isabela-Einlage."},{"name":"Antonio Gimenez","color":"#4A3728","force":"Medium-Full","wrapper":"Java","vitolas":[],"story":"Die kräftige des Hauses — Isabela pais und Einlage aus kubanischem Saatgut, sieben Formate."},{"name":"Independencia 1898","color":"#7A2E1E","force":"Medium","wrapper":"Nicht angegeben","vitolas":[],"story":"Das Jahr der philippinischen Republik, auf einer Bauchbinde."}]',
        'Tabaqueria de Filipinas 是一位退休者的公司。加布里埃尔·里波尔二世——公司称他「El Magnifico」——自1960年代起一生在雪茄行业做经理与顾问，从香港到多米尼加共和国；1993年退休后，他在马尼拉塔夫特大道开了一间小作坊：四名旧部、他的小儿子，以及取自父亲的名字。行业媒体说是旧马尼拉一栋租来的战前老屋里的五位卷工。

作坊后来成了拉古纳省圣佩德罗的一家工厂，两百多人——公司说是二百五十人——日产一万五千支，还自制纳拉木盒。烟叶来自公司在吕宋北部图包谷的种植园，以及伊莎贝拉——菲律宾雪茄的历史产区，本图集在 La Flor de la Isabela 词条讲过；只有茄衣来自印尼——爪哇，一如马尼拉百年来的惯例。三个品牌：Antonio Gimenez、Independencia 1898——共和国成立之年——、Flor de Filipinas。创始人的三个儿子执掌公司。

本图集原有三家菲律宾公司，都是1881年西班牙 Tabacalera 的继承者。这是此后创立的头一家，也为他人代工：词条记下这一点，但不知为谁。',
        '[{"name":"Flor de Filipinas","color":"#8B5A2B","force":"Medium","wrapper":"爪哇","vitolas":[],"story":"创始配方：爪哇茄衣、自家的 Sarah 茄套、伊莎贝拉填充。"},{"name":"Antonio Gimenez","color":"#4A3728","force":"Medium-Full","wrapper":"爪哇","vitolas":[],"story":"公司里劲道足的一款——伊莎贝拉 pais 与古巴种填充，七种尺寸。"},{"name":"Independencia 1898","color":"#7A2E1E","force":"Medium","wrapper":"未公开","vitolas":[],"story":"菲律宾共和国成立之年，印在茄标上。"}]',
        'تاباكيريا دي فيليبيناس دارُ متقاعد. أمضى غابرييل ريبول الابن — «El Magnifico» كما تسمّيه شركته — حياته المهنية مديرًا ومستشارًا في السيجار منذ الستينيات، من هونغ كونغ إلى جمهورية الدومينيكان، حين تقاعد سنة 1993 وافتتح ورشة صغيرة في جادّة تافت بمانيلا: أربعة موظّفين سابقين، وابنه الأصغر، واسمٌ أخذه من أبيه. وتتحدّث صحافة المهنة عن خمسة لفّافين في بيت مستأجر من قبل الحرب في مانيلا القديمة.

صارت الورشة مصنعًا في سان بيدرو، في لاغونا، بأكثر من مئتي شخص — تقول الدار مئتين وخمسين — وخمسة عشر ألف سيجار في اليوم، وعلب نارّا من صنعها. يأتي التبغ من مزارع الدار في وادي توباو شمال لوزون، ومن إيسابيلا، المقاطعة التاريخية للسيجار الفلبيني التي يرويها هذا الأطلس في بطاقة La Flor de la Isabela؛ والغلاف وحده إندونيسي — جاوة، كما جرت العادة في مانيلا منذ قرن. ثلاث علامات: Antonio Gimenez، وIndependencia 1898 — سنة الجمهورية —، وFlor de Filipinas. ويدير الدار أبناء المؤسّس الثلاثة.

كان هذا الأطلس يحمل ثلاث دور فلبينية، كلّها وريثة Tabacalera الإسبانية لسنة 1881. وهذه أولاها تأسيسًا منذ ذلك الحين، وتلفّ للآخرين: تسجّل البطاقة ذلك من دون أن تعرف لمن.',
        '[{"name":"Flor de Filipinas","color":"#8B5A2B","force":"Medium","wrapper":"جاوة","vitolas":[],"story":"مزجة البدايات: غلاف جاوة، ورقة رابطة Sarah من الدار، حشوة إيسابيلا."},{"name":"Antonio Gimenez","color":"#4A3728","force":"Medium-Full","wrapper":"جاوة","vitolas":[],"story":"القويّ في الدار — إيسابيلا pais وحشوة من بذور كوبية، سبعة قياسات."},{"name":"Independencia 1898","color":"#7A2E1E","force":"Medium","wrapper":"غير معلن","vitolas":[],"story":"سنة الجمهورية الفلبينية، على حزام."}]')
ON DUPLICATE KEY UPDATE `country_id` = VALUES(`country_id`), `founded` = VALUES(`founded`), `factory` = VALUES(`factory`), `source` = VALUES(`source`), `history` = VALUES(`history`), `gamme` = VALUES(`gamme`), `history_en` = VALUES(`history_en`), `gamme_en` = VALUES(`gamme_en`), `history_es` = VALUES(`history_es`), `gamme_es` = VALUES(`gamme_es`), `history_de` = VALUES(`history_de`), `gamme_de` = VALUES(`gamme_de`), `history_zh` = VALUES(`history_zh`), `gamme_zh` = VALUES(`gamme_zh`), `history_ar` = VALUES(`history_ar`), `gamme_ar` = VALUES(`gamme_ar`);

-- ── Great Wall Cigars ──

INSERT INTO `brands` (`name`, `country_id`, `founded`, `factory`, `source`, `history`, `gamme`, `history_en`, `gamme_en`, `history_es`, `gamme_es`, `history_de`, `gamme_de`, `history_zh`, `gamme_zh`, `history_ar`, `gamme_ar`)
VALUES ('Great Wall Cigars',
        'china',
        '1918 — Shifang, Sichuan',
        'Great Wall Cigar Factory, Shifang, Sichuan — China Tobacco Sichuan Industrial ; bâtiment des cigares main sur un site de 200 000 m²',
        'cigarjournal.com « Visiting China''s Premium Cigar Production » (reportage de Samuel Spurr, édition d''automne 2017 : née en 1918 comme Yichuan Industry Society ; le cigare 132 roulé main pour Mao dans les années 1960 ; 560 millions de cigares de machine et 1,5 million roulés main par an, objectif 2 millions ; site actuel achevé en 2007 ; trois maîtres rouleuses encadrent près de cent rouleuses ; partenariats avec Altadis et Agio ; semence cubaine introduite seize ans plus tôt ; essais à Hainan ; achats de feuilles en Rép. dominicaine, au Mexique et en Indonésie ; 400 000 cigares en vieillissement) et « CTIHK and Sichuan Tobacco Sign Global Deal for Great Wall Cigars » (23 juillet 2025 : accord mondial exclusif hors Chine continentale ; Inter-tabac 2025) ; cigaraficionado.com « New Cigars Unveiled At Great Wall Cigar Festival » ; tobaccoasia.com « Cigars: Made in Asia »',
        'Great Wall — 長城, la Grande Muraille — est la marque de cigares du monopole d''État chinois, roulée à Shifang, à deux heures au nord de Chengdu, dans le Sichuan. La fabrique est née en 1918 sous le nom de Yichuan Industry Society, avant toute autre fabrique de cigares du pays selon la presse du métier, dans une ville qui cultive le tabac depuis quatre siècles. Dans les années 1960, elle a roulé pour Mao Zedong un cigare dont il a approuvé l''assemblage et qui a ensuite été mis sur le marché : le 132, roulé main et précoupé, reste le nom que tout amateur chinois connaît, et les rouleuses de l''équipe 132 sont les anciennes de la maison, en photo sur les murs.

Le site actuel, achevé en 2007, couvre deux cent mille mètres carrés et fabrique surtout des cigares de machine — cinq cent soixante millions par an à la date du reportage, contre cent vingt-six millions en 2003. L''atlas ne porte pas ceux-là. Il porte le bâtiment des cigares main, à part sur le site : un million et demi de cigares par an, près de cent rouleuses encadrées par trois maîtresses, quatre cent mille cigares en vieillissement, une semence cubaine introduite au début des années 2000, des essais dans l''île de Hainan, des achats de feuilles en République dominicaine, au Mexique et en Indonésie, et des partenariats techniques avec Altadis et Agio — une rouleuse dominicaine vient former les équipes.

Le marché était intérieur. Il s''ouvre : après trois accords de distribution en 2024, China Tobacco International (HK) a signé le 23 juillet 2025, à la fabrique même, un accord mondial exclusif hors Chine continentale. L''atlas ouvre la Chine comme pays producteur pour cette maison, sans poser de zone ni de variété : la presse a décrit la fabrique, pas encore les champs.',
        '[{"name":"132","color":"#B22222","force":"Medium","wrapper":"Chinoise","vitolas":[],"story":"Le cigare roulé pour Mao dans les années 1960, main et précoupé — le nom que tout amateur chinois connaît."},{"name":"Great Wall","color":"#8B1A1A","force":"Medium-Full","wrapper":"Non divulguée","vitolas":[],"story":"Les lignes roulées main du bâtiment à part — semence cubaine du Sichuan, feuilles achetées en Rép. dominicaine, au Mexique et en Indonésie. Six nouveautés présentées à l''Inter-tabac 2025."}]',
        'Great Wall — 長城 — is the cigar brand of the Chinese state monopoly, rolled in Shifang, two hours north of Chengdu, in Sichuan. The factory was born in 1918 as Yichuan Industry Society, ahead of any other cigar factory in the country according to the trade press, in a town that has grown tobacco for four centuries. In the 1960s it rolled for Mao Zedong a cigar whose blend he approved and which was then put on the market: the 132, hand-rolled and pre-cut, remains the name every Chinese enthusiast knows, and the rollers of the 132 team are the house''s elders, in photographs on the walls.

The current site, completed in 2007, covers two hundred thousand square metres and makes mostly machine cigars — five hundred and sixty million a year at the time of the report, against a hundred and twenty-six million in 2003. This atlas does not carry those. It carries the hand-rolled cigar building, set apart on the site: a million and a half cigars a year, nearly a hundred rollers overseen by three masters, four hundred thousand cigars ageing, a Cuban seed introduced in the early 2000s, trials on Hainan island, leaf purchases in the Dominican Republic, Mexico and Indonesia, and technical partnerships with Altadis and Agio — a Dominican roller comes to train the teams.

The market was domestic. It is opening: after three distribution agreements in 2024, China Tobacco International (HK) signed on 23 July 2025, at the factory itself, an exclusive worldwide agreement outside mainland China. This atlas opens China as a producing country for this house, without setting a zone or a variety: the press has described the factory, not yet the fields.',
        '[{"name":"132","color":"#B22222","force":"Medium","wrapper":"Chinese","vitolas":[],"story":"The cigar rolled for Mao in the 1960s, hand-made and pre-cut — the name every Chinese enthusiast knows."},{"name":"Great Wall","color":"#8B1A1A","force":"Medium-Full","wrapper":"Undisclosed","vitolas":[],"story":"The hand-rolled lines of the separate building — Cuban seed from Sichuan, leaf bought in the Dominican Republic, Mexico and Indonesia. Six new releases shown at Inter-tabac 2025."}]',
        'Great Wall — 長城, la Gran Muralla — es la marca de puros del monopolio de Estado chino, liada en Shifang, a dos horas al norte de Chengdu, en Sichuan. La fábrica nació en 1918 con el nombre de Yichuan Industry Society, antes que cualquier otra fábrica de puros del país según la prensa del oficio, en una ciudad que cultiva tabaco desde hace cuatro siglos. En los años 1960 lió para Mao Zedong un puro cuya ligada él aprobó y que luego se puso en el mercado: el 132, liado a mano y precortado, sigue siendo el nombre que todo aficionado chino conoce, y las torcedoras del equipo 132 son las veteranas de la casa, en fotos sobre las paredes.

El sitio actual, terminado en 2007, cubre doscientos mil metros cuadrados y fabrica sobre todo puros de máquina — quinientos sesenta millones al año en la fecha del reportaje, frente a ciento veintiséis millones en 2003. Este atlas no recoge esos. Recoge el edificio de los puros a mano, aparte en el sitio: un millón y medio de puros al año, cerca de cien torcedoras encuadradas por tres maestras, cuatrocientos mil puros en añejamiento, una semilla cubana introducida a principios de los años 2000, ensayos en la isla de Hainan, compras de hoja en República Dominicana, México e Indonesia, y acuerdos técnicos con Altadis y Agio — una torcedora dominicana viene a formar a los equipos.

El mercado era interior. Se abre: tras tres acuerdos de distribución en 2024, China Tobacco International (HK) firmó el 23 de julio de 2025, en la propia fábrica, un acuerdo mundial exclusivo fuera de la China continental. Este atlas abre China como país productor por esta casa, sin fijar zona ni variedad: la prensa ha descrito la fábrica, todavía no los campos.',
        '[{"name":"132","color":"#B22222","force":"Medium","wrapper":"China","vitolas":[],"story":"El puro liado para Mao en los años 1960, a mano y precortado — el nombre que todo aficionado chino conoce."},{"name":"Great Wall","color":"#8B1A1A","force":"Medium-Full","wrapper":"No divulgada","vitolas":[],"story":"Las líneas liadas a mano del edificio aparte — semilla cubana de Sichuan, hoja comprada en República Dominicana, México e Indonesia. Seis novedades presentadas en Inter-tabac 2025."}]',
        'Great Wall — 長城, die Große Mauer — ist die Zigarrenmarke des chinesischen Staatsmonopols, gerollt in Shifang, zwei Stunden nördlich von Chengdu, in Sichuan. Die Fabrik entstand 1918 als Yichuan Industry Society, vor jeder anderen Zigarrenfabrik des Landes laut Fachpresse, in einer Stadt, die seit vier Jahrhunderten Tabak anbaut. In den 1960ern rollte sie für Mao Zedong eine Zigarre, deren Blend er billigte und die dann auf den Markt kam: Die 132, handgerollt und vorgeschnitten, bleibt der Name, den jeder chinesische Liebhaber kennt, und die Rollerinnen des 132-Teams sind die Ältesten des Hauses, auf Fotos an den Wänden.

Das heutige Gelände, 2007 fertiggestellt, umfasst zweihunderttausend Quadratmeter und stellt vor allem Maschinenzigarren her — fünfhundertsechzig Millionen im Jahr zur Zeit der Reportage, gegen hundertsechsundzwanzig Millionen 2003. Diese führt dieser Atlas nicht. Er führt das Gebäude der handgerollten Zigarren, abseits auf dem Gelände: anderthalb Millionen Zigarren im Jahr, fast hundert Rollerinnen unter drei Meisterinnen, vierhunderttausend Zigarren in der Reifung, ein kubanisches Saatgut, Anfang der 2000er eingeführt, Versuche auf der Insel Hainan, Blattkäufe in der Dominikanischen Republik, Mexiko und Indonesien und technische Partnerschaften mit Altadis und Agio — eine dominikanische Rollerin kommt, um die Teams zu schulen.

Der Markt war ein Binnenmarkt. Er öffnet sich: Nach drei Vertriebsvereinbarungen 2024 unterzeichnete China Tobacco International (HK) am 23. Juli 2025, in der Fabrik selbst, ein exklusives weltweites Abkommen außerhalb Festlandchinas. Dieser Atlas öffnet China als Erzeugerland für dieses Haus, ohne Zone oder Sorte festzulegen: Die Presse hat die Fabrik beschrieben, die Felder noch nicht.',
        '[{"name":"132","color":"#B22222","force":"Medium","wrapper":"Chinesisch","vitolas":[],"story":"Die in den 1960ern für Mao gerollte Zigarre, von Hand und vorgeschnitten — der Name, den jeder chinesische Liebhaber kennt."},{"name":"Great Wall","color":"#8B1A1A","force":"Medium-Full","wrapper":"Nicht angegeben","vitolas":[],"story":"Die handgerollten Linien des separaten Gebäudes — kubanisches Saatgut aus Sichuan, Blätter aus der Dominikanischen Republik, Mexiko und Indonesien. Sechs Neuheiten auf der Inter-tabac 2025 gezeigt."}]',
        '长城——是中国国家专卖体制下的雪茄品牌，在四川什邡卷制，什邡在成都以北两小时车程。工厂1918年以「益川工业社」之名诞生，据行业媒体，早于该国任何其他雪茄厂，所在的城市种植烟草已有四百年。1960年代，它为毛泽东卷制了一款他认可配方、随后投放市场的雪茄：手工卷制、预切口的「132」，至今仍是每个中国雪茄客都知道的名字，132 小组的卷工是厂里的元老，照片挂在墙上。

现今厂区于2007年建成，占地二十万平方米，主要生产机制雪茄——报道时年产五亿六千万支，2003年为一亿两千六百万支。本图集不收录这些。它收录的是厂区里单独的手工雪茄楼：年产一百五十万支，近百名卷工由三位大师带领，四十万支在陈化，2000年代初引进古巴种子，在海南岛试种，从多米尼加、墨西哥和印尼采购烟叶，并与 Altadis 和 Agio 有技术合作——一位多米尼加卷工前来培训团队。

市场原本在国内。如今正在开放：继2024年三项分销协议之后，2025年7月23日，中烟国际（香港）在工厂本身签署了中国大陆以外的全球独家协议。本图集为这家公司把中国列为生产国，但不设产区与品种：媒体描写了工厂，尚未描写田地。',
        '[{"name":"132","color":"#B22222","force":"Medium","wrapper":"中国","vitolas":[],"story":"1960年代为毛泽东卷制的雪茄，手工、预切口——每个中国雪茄客都知道的名字。"},{"name":"Great Wall","color":"#8B1A1A","force":"Medium-Full","wrapper":"未公开","vitolas":[],"story":"独立楼内的手工卷制系列——四川的古巴种烟叶，从多米尼加、墨西哥和印尼采购的烟叶。2025年 Inter-tabac 展会推出六款新品。"}]',
        'غريت وول — 長城، السور العظيم — علامةُ السيجار لاحتكار الدولة الصيني، تُلفّ في شيفانغ، على بُعد ساعتين شمال تشنغدو، في سيتشوان. وُلد المصنع سنة 1918 باسم Yichuan Industry Society، قبل أيّ مصنع سيجار آخر في البلاد بحسب صحافة المهنة، في مدينة تزرع التبغ منذ أربعة قرون. وفي الستينيات لفّ لماو تسي تونغ سيجارًا وافق على مزجته ثم طُرح في السوق: الـ132، المُلفوف يدويًّا والمقطوع مسبقًا، ما زال الاسم الذي يعرفه كلّ هاوٍ صيني، ولفّافات فريق 132 هنّ قدامى الدار، في صور على الجدران.

الموقع الحالي، المكتمل سنة 2007، يمتدّ على مئتي ألف متر مربّع ويصنع في الغالب سيجارات آلية — خمسمئة وستين مليونًا في السنة وقت التحقيق، مقابل مئة وستة وعشرين مليونًا سنة 2003. لا يحمل هذا الأطلس تلك. بل يحمل مبنى السيجار اليدوي، المنفصل في الموقع: مليون ونصف مليون سيجار في السنة، وقرابة مئة لفّافة تشرف عليهنّ ثلاث معلّمات، وأربعمئة ألف سيجار في التعتيق، وبذرة كوبية أُدخلت في مطلع الألفية، وتجارب في جزيرة هاينان، ومشتريات أوراق من جمهورية الدومينيكان والمكسيك وإندونيسيا، وشراكات تقنية مع Altadis وAgio — تأتي لفّافة دومينيكية لتدريب الفرق.

كانت السوق داخلية. وها هي تنفتح: بعد ثلاثة اتفاقات توزيع سنة 2024، وقّعت China Tobacco International (HK) في 23 تموز/يوليو 2025، في المصنع نفسه، اتفاقًا عالميًّا حصريًّا خارج الصين القارية. يفتح هذا الأطلس الصين بلدًا منتجًا لهذه الدار، من دون تحديد منطقة ولا صنف: وصفت الصحافة المصنع، ولم تصف الحقول بعد.',
        '[{"name":"132","color":"#B22222","force":"Medium","wrapper":"صيني","vitolas":[],"story":"السيجار الذي لُفّ لماو في الستينيات، يدويًّا ومقطوعًا مسبقًا — الاسم الذي يعرفه كلّ هاوٍ صيني."},{"name":"Great Wall","color":"#8B1A1A","force":"Medium-Full","wrapper":"غير معلن","vitolas":[],"story":"الخطوط المُلفوفة يدويًّا في المبنى المنفصل — بذور كوبية من سيتشوان، وأوراق مشتراة من جمهورية الدومينيكان والمكسيك وإندونيسيا. ستّ إصدارات جديدة عُرضت في Inter-tabac 2025."}]')
ON DUPLICATE KEY UPDATE `country_id` = VALUES(`country_id`), `founded` = VALUES(`founded`), `factory` = VALUES(`factory`), `source` = VALUES(`source`), `history` = VALUES(`history`), `gamme` = VALUES(`gamme`), `history_en` = VALUES(`history_en`), `gamme_en` = VALUES(`gamme_en`), `history_es` = VALUES(`history_es`), `gamme_es` = VALUES(`gamme_es`), `history_de` = VALUES(`history_de`), `gamme_de` = VALUES(`gamme_de`), `history_zh` = VALUES(`history_zh`), `gamme_zh` = VALUES(`gamme_zh`), `history_ar` = VALUES(`history_ar`), `gamme_ar` = VALUES(`gamme_ar`);

-- ── PHILIPPINES : `brands` reecrit en litteral complet (4 entrees) ──
UPDATE `producer_countries` SET `brands` = '[{"desc":"Marque nationale historique depuis 1782","name":"Tabacalera","iconic":true},{"desc":"Production artisanale traditionnelle","name":"La Flor de la Isabela","iconic":false},{"desc":"Manille roulait pour toute l''Asie","name":"Alhambra","iconic":false},{"name":"Tabaqueria de Filipinas","desc":"Manille 1993, San Pedro — la première maison fondée depuis la Tabacalera","iconic":false}]' WHERE `id` = 'philippines';

-- ── Luciano : Constella, six langues ──
UPDATE `brands` SET `history` = CONCAT(`history`, '\n\n', 'En avril 2025, Luciano et l''Empresa Madeirense de Tabacos — la société des Açores qui tient la Fábrica de Tabaco Estrela, dont l''atlas porte la fiche — ont fondé Constella Group, qui devient la maison mère de Luciano ; Luciano Meirelles préside Constella USA. Luciano Tabacos S.A., à Estelí, roule aussi pour Peter James Cigars et Dalay Zigarren.') WHERE `name` = 'Luciano Cigars' AND `history` NOT LIKE '%Constella%';
UPDATE `brands` SET `history_en` = CONCAT(`history_en`, '\n\n', 'In April 2025, Luciano and Empresa Madeirense de Tabacos — the Azorean company that runs Fábrica de Tabaco Estrela, whose entry this atlas carries — founded Constella Group, which becomes Luciano''s parent company; Luciano Meirelles presides over Constella USA. Luciano Tabacos S.A., in Estelí, also rolls for Peter James Cigars and Dalay Zigarren.') WHERE `name` = 'Luciano Cigars' AND `history_en` NOT LIKE '%Constella%';
UPDATE `brands` SET `history_es` = CONCAT(`history_es`, '\n\n', 'En abril de 2025, Luciano y la Empresa Madeirense de Tabacos — la sociedad de las Azores que tiene la Fábrica de Tabaco Estrela, cuya ficha lleva este atlas — fundaron Constella Group, que se convierte en la casa matriz de Luciano; Luciano Meirelles preside Constella USA. Luciano Tabacos S.A., en Estelí, lía también para Peter James Cigars y Dalay Zigarren.') WHERE `name` = 'Luciano Cigars' AND `history_es` NOT LIKE '%Constella%';
UPDATE `brands` SET `history_de` = CONCAT(`history_de`, '\n\n', 'Im April 2025 gründeten Luciano und die Empresa Madeirense de Tabacos — die azorische Gesellschaft, der die Fábrica de Tabaco Estrela gehört, deren Eintrag dieser Atlas führt — die Constella Group, die Lucianos Muttergesellschaft wird; Luciano Meirelles steht Constella USA vor. Luciano Tabacos S.A. in Estelí rollt auch für Peter James Cigars und Dalay Zigarren.') WHERE `name` = 'Luciano Cigars' AND `history_de` NOT LIKE '%Constella%';
UPDATE `brands` SET `history_zh` = CONCAT(`history_zh`, '\n\n', '2025年4月，Luciano 与马德拉烟草公司——拥有 Fábrica de Tabaco Estrela 的亚速尔公司，本图集载有其词条——共同创立 Constella Group，后者成为 Luciano 的母公司；卢西亚诺·梅雷莱斯任 Constella USA 总裁。埃斯特利的 Luciano Tabacos S.A. 也为 Peter James Cigars 与 Dalay Zigarren 卷制。') WHERE `name` = 'Luciano Cigars' AND `history_zh` NOT LIKE '%Constella%';
UPDATE `brands` SET `history_ar` = CONCAT(`history_ar`, '\n\n', 'وفي نيسان/أبريل 2025 أسّست Luciano وEmpresa Madeirense de Tabacos — الشركة الأزورية التي تملك Fábrica de Tabaco Estrela التي يحمل هذا الأطلس بطاقتها — Constella Group التي تصير الشركة الأمّ لـLuciano؛ ويرأس لوتشيانو ميريليس Constella USA. وتلفّ Luciano Tabacos S.A. في إستيلي أيضًا لـPeter James Cigars وDalay Zigarren.') WHERE `name` = 'Luciano Cigars' AND `history_ar` NOT LIKE '%Constella%';

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'producer_countries', p.`id`, c.champ, l.lang,
       SHA1(CASE c.champ WHEN 'region' THEN p.`region` WHEN 'production' THEN p.`production`
                         WHEN 'rev_detail' THEN p.`rev_detail` ELSE p.`notes` END), 'machine', NOW()
  FROM `producer_countries` p
  JOIN (SELECT 'region' champ UNION ALL SELECT 'production' UNION ALL SELECT 'rev_detail' UNION ALL SELECT 'notes') c
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de' UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE p.`id` IN ('bahamas','azores','puertorico','china')
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'producer_geo', g.`country_id`, c.champ, l.lang,
       SHA1(CASE c.champ WHEN 'currency' THEN g.`currency` WHEN 'language' THEN g.`language` ELSE g.`independent` END), 'machine', NOW()
  FROM `producer_geo` g
  JOIN (SELECT 'currency' champ UNION ALL SELECT 'language' UNION ALL SELECT 'independent') c
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de' UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE g.`country_id` IN ('bahamas','azores','puertorico','china')
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'brands', b.`name`, c.champ, l.lang,
       SHA1(CASE c.champ WHEN 'history' THEN b.`history` ELSE b.`gamme` END), 'machine', NOW()
  FROM `brands` b
  JOIN (SELECT 'history' champ UNION ALL SELECT 'gamme') c
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de' UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE b.`name` IN ('Graycliff','Fábrica de Tabaco Estrela','Don Collins','Tabaqueria de Filipinas','Great Wall Cigars', 'Luciano Cigars')
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 215';
INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 215','systeme','quatre_pays_ouverts','pays',0,
   'Bahamas (Graycliff), Acores (Fabrica de Tabaco Estrela), Porto Rico (Don Collins) : trois lieux de roulage sans champs, comme la Suisse. Chine (Great Wall, Shifang) : pays producteur. Tabaqueria de Filipinas dans un pays deja ouvert'),
  (NULL,'migration 215','systeme','revendications_attribuees','marque',0,
   'Don Collins se dit de 1506 : rapporte a la maison, 1991 retenu, seul fait garde la Porto Rican-American Tobacco Co. de 1899, ecrite dans l arret antitrust de 1911. Great Wall « avant toute autre fabrique du pays » : attribue a la presse du metier'),
  (NULL,'migration 215','systeme','trous_declares','pays',0,
   'Aucune zone, variete ni climat pour les quatre pays : Bahamas et Porto Rico ne cultivent rien d atteste, les Acores ont cultive au XIXe, la Chine cultive a Shifang mais la presse a decrit la fabrique, pas les champs. Coordonnees chinoises : Shifang'),
  (NULL,'migration 215','systeme','code_accompagne_la_base','pays',0,
   'flags.js : bahamas, puertorico, azores dessines et declares dans FLAGS_DESSINES ; data.pays.js : BS et PR ajoutes, azores dans TERRITOIRES_INFOS avec Atlantic/Azores. Sans cela coherence_check refuse trois bandes grises et l heure de Lisbonne'),
  (NULL,'migration 215','systeme','luciano_constella','marque',0,
   'Paragraphe ajoute en six langues : Constella Group fonde en avril 2025 avec EMT, maison mere de Luciano ; Luciano Tabacos roule aussi pour Peter James Cigars et Dalay Zigarren');

SELECT
  (SELECT COUNT(*) FROM `producer_countries` WHERE `id` IN ('bahamas','azores','puertorico','china')) = 4 AS quatre_pays,
  (SELECT COUNT(*) FROM `producer_geo` WHERE `country_id` IN ('bahamas','azores','puertorico','china')) = 4 AS quatre_geo,
  (SELECT COUNT(*) FROM `brands` WHERE `name` IN ('Graycliff','Fábrica de Tabaco Estrela','Don Collins','Tabaqueria de Filipinas','Great Wall Cigars')) = 5 AS cinq_fiches,
  (SELECT CHAR_LENGTH(`flag`) FROM `producer_countries` WHERE `id` = 'bahamas') = 2 AS drapeau_entier,
  (SELECT `history_ar` LIKE '%Constella%' FROM `brands` WHERE `name` = 'Luciano Cigars') AS luciano_constella,
  (SELECT `brands` LIKE '%Tabaqueria%' FROM `producer_countries` WHERE `id` = 'philippines') AS philippines_annonce,
  (SELECT SUM(CHAR_LENGTH(`detail`) >= 255) = 0 FROM `moderation_log` WHERE `acteur_nom` = 'migration 215') AS journal_non_tronque;
SELECT COUNT(*) AS marques, SUM(TRIM(COALESCE(`source`,'')) = '') AS sans_source FROM `brands`;
SELECT COUNT(*) AS pays_producteurs FROM `producer_countries`;
