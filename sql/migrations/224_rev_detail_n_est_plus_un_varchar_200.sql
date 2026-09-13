-- ════════════════════════════════════════════════════════
-- 224 — `rev_detail` n'est plus un varchar(200)
-- ────────────────────────────────────────────────────────
-- MEME PANNE QUE LA 219, UNE COLONNE PLUS LOIN. `producer_countries.
-- rev_detail` et ses cinq traductions sont des varchar(200), et le
-- serveur n'est pas en mode strict : depuis la 165 (Cote d'Ivoire),
-- DOUZE PAYS ont ete tronques en silence, la phrase coupee au 200e
-- caractere — Cote d'Ivoire, Mozambique, Bahamas, Acores, Chine,
-- Allemagne, Russie, Zimbabwe, Afrique du Sud, Perou, Colombie, Aruba.
-- Le francais et l'anglais surtout ; le chinois, plus court, passait.
--
-- On elargit les six colonnes en TEXT, puis on reecrit les textes
-- entiers, relus dans les migrations qui les ont ecrits (165, 174,
-- 215, 221, 223) — pas retapes. Le sceau de fraicheur est recalcule
-- sur le francais entier. Un test dans tests/run.php garde la porte.
-- ════════════════════════════════════════════════════════

ALTER TABLE `producer_countries`
  MODIFY `rev_detail`    TEXT NULL,
  MODIFY `rev_detail_en` TEXT NULL,
  MODIFY `rev_detail_es` TEXT NULL,
  MODIFY `rev_detail_de` TEXT NULL,
  MODIFY `rev_detail_zh` TEXT NULL,
  MODIFY `rev_detail_ar` TEXT NULL;

-- ── aruba (223) : fr 276, en 267, es 258, de 278 ──
UPDATE `producer_countries` SET
  `rev_detail` = 'Aucun chiffre. Aruba est une île de tourisme — cent mille habitants, des hôtels sur Palm Beach — et le cigare y est une boutique près du moulin hollandais, qui vend aux visiteurs ce qu''elle roule l''après-midi. Le tabac pousse sur l''île, sur une terre qui donnait des haricots.',
  `rev_detail_en` = 'No figures. Aruba is a tourism island — a hundred thousand inhabitants, hotels along Palm Beach — and the cigar there is a shop near the Dutch windmill, selling visitors what it rolls in the afternoon. The tobacco grows on the island, on land that used to give beans.',
  `rev_detail_es` = 'Ninguna cifra. Aruba es una isla de turismo — cien mil habitantes, hoteles en Palm Beach — y el puro es allí una tienda junto al molino holandés, que vende a los visitantes lo que lía por la tarde. El tabaco crece en la isla, en una tierra que daba frijoles.',
  `rev_detail_de` = 'Keine Zahlen. Aruba ist eine Tourismusinsel — hunderttausend Einwohner, Hotels an Palm Beach —, und die Zigarre ist dort ein Laden bei der holländischen Windmühle, der Besuchern verkauft, was er nachmittags rollt. Der Tabak wächst auf der Insel, auf Land, das einst Bohnen trug.',
  `rev_detail_zh` = '没有数字。阿鲁巴是旅游之岛——十万居民，棕榈滩沿岸的酒店——雪茄在这里是荷兰风车旁的一家店，下午卷，卖给游客。烟草就在岛上种植，那片地过去种豆子。',
  `rev_detail_ar` = 'لا أرقام. أروبا جزيرة سياحة — مئة ألف نسمة، وفنادق على بالم بيتش — والسيجار فيها متجر قرب الطاحونة الهولندية يبيع للزوّار ما يلفّه بعد الظهر. ينمو التبغ في الجزيرة، على أرض كانت تعطي الفاصولياء.'
 WHERE `id` = 'aruba';

-- ── azores (215) : fr 228, en 201, es 219, de 209 ──
UPDATE `producer_countries` SET
  `rev_detail` = 'Aucun chiffre publié pour les cigares seuls : l''atelier est un complément, petit, d''une fabrique dont le gros de la production est la cigarette et le cigarillo. Depuis avril 2025, EMT est associée à Luciano dans Constella Group.',
  `rev_detail_en` = 'No figures published for cigars alone: the workshop is a small complement to a factory whose bulk is cigarettes and cigarillos. Since April 2025, EMT has been partnered with Luciano in Constella Group.',
  `rev_detail_es` = 'Ninguna cifra publicada para los puros solos: el taller es un complemento, pequeño, de una fábrica cuyo grueso son los cigarrillos y los cigarritos. Desde abril de 2025, EMT está asociada con Luciano en Constella Group.',
  `rev_detail_de` = 'Keine Zahlen für Zigarren allein: Die Werkstatt ist eine kleine Ergänzung einer Fabrik, deren Hauptgeschäft Zigaretten und Zigarillos sind. Seit April 2025 ist EMT mit Luciano in der Constella Group verbunden.',
  `rev_detail_zh` = '雪茄本身没有公布数字：作坊只是一家以卷烟和小雪茄为主的工厂的小小补充。自2025年4月起，EMT 与 Luciano 在 Constella Group 中结为伙伴。',
  `rev_detail_ar` = 'لا أرقام منشورة للسيجار وحده: الورشة تكملةٌ صغيرة لمصنع معظم إنتاجه السجائر والسيجاريلو. ومنذ نيسان/أبريل 2025، EMT شريكةٌ لـLuciano في Constella Group.'
 WHERE `id` = 'azores';

-- ── bahamas (215) : de 210 ──
UPDATE `producer_countries` SET
  `rev_detail` = 'Il n''existe pas de ligne d''exportation de cigares bahaméens. Graycliff vend dans son hôtel, à ses visiteurs, et aux États-Unis depuis octobre 1997 ; la maison a déclaré 650 000 cigares roulés en 1999.',
  `rev_detail_en` = 'There is no export line for Bahamian cigars. Graycliff sells in its hotel, to visitors, and in the United States since October 1997; the house reported 650,000 cigars rolled in 1999.',
  `rev_detail_es` = 'No existe una línea de exportación de puros bahameños. Graycliff vende en su hotel, a sus visitantes y en Estados Unidos desde octubre de 1997; la casa declaró 650 000 puros liados en 1999.',
  `rev_detail_de` = 'Eine Exportposition für bahamaische Zigarren gibt es nicht. Graycliff verkauft in seinem Hotel, an Besucher und seit Oktober 1997 in den Vereinigten Staaten; das Haus meldete 650 000 gerollte Zigarren für 1999.',
  `rev_detail_zh` = '不存在巴哈马雪茄的出口税目。Graycliff 在自家酒店向访客销售，并自1997年10月起销往美国；公司申报1999年卷制了65万支。',
  `rev_detail_ar` = 'لا يوجد بند جمركي لتصدير السيجار البهامي. تبيع Graycliff في فندقها للزوّار، وفي الولايات المتحدة منذ تشرين الأوّل/أكتوبر 1997؛ وأعلنت الدار 650 ألف سيجار مُلفوف سنة 1999.'
 WHERE `id` = 'bahamas';

-- ── china (215) : fr 302, en 307, es 323, de 319, ar 238 ──
UPDATE `producer_countries` SET
  `rev_detail` = 'Le marché est intérieur, sous monopole d''État. L''export commence : accords de distribution sur trois marchés en 2024, puis, le 23 juillet 2025, un accord mondial exclusif hors Chine continentale entre China Tobacco International (HK) et China Tobacco Sichuan Industrial, signé à la fabrique de Shifang.',
  `rev_detail_en` = 'The market is domestic, under a state monopoly. Export is beginning: distribution agreements in three markets in 2024, then, on 23 July 2025, an exclusive worldwide agreement outside mainland China between China Tobacco International (HK) and China Tobacco Sichuan Industrial, signed at the Shifang factory.',
  `rev_detail_es` = 'El mercado es interior, bajo monopolio de Estado. La exportación empieza: acuerdos de distribución en tres mercados en 2024, luego, el 23 de julio de 2025, un acuerdo mundial exclusivo fuera de la China continental entre China Tobacco International (HK) y China Tobacco Sichuan Industrial, firmado en la fábrica de Shifang.',
  `rev_detail_de` = 'Der Markt ist ein Binnenmarkt unter Staatsmonopol. Der Export beginnt: Vertriebsvereinbarungen in drei Märkten 2024, dann am 23. Juli 2025 ein exklusives weltweites Abkommen außerhalb Festlandchinas zwischen China Tobacco International (HK) und China Tobacco Sichuan Industrial, unterzeichnet in der Fabrik von Shifang.',
  `rev_detail_zh` = '市场在国内，属国家专卖。出口刚刚起步：2024年在三个市场签订分销协议；2025年7月23日，中烟国际（香港）与四川中烟在什邡工厂签署中国大陆以外的全球独家协议。',
  `rev_detail_ar` = 'السوق داخلية تحت احتكار الدولة. وبدأ التصدير: اتفاقات توزيع في ثلاث أسواق سنة 2024، ثم في 23 تموز/يوليو 2025 اتفاق عالمي حصري خارج الصين القارية بين China Tobacco International (HK) وChina Tobacco Sichuan Industrial، وُقّع في مصنع شيفانغ.'
 WHERE `id` = 'china';

-- ── colombia (223) : fr 378, en 372, es 369, de 367, ar 284 ──
UPDATE `producer_countries` SET
  `rev_detail` = 'Le tabac fait 40 % du produit municipal de Piedecuesta et fait vivre 4 500 à 6 500 familles, selon l''année et le journal ; deux cents fabricants, 78 % de femmes (2018). Presque tout est du tabaco bon marché ; le puro premium est l''affaire de quelques maisons, et l''export reste rare — Colpuros a placé des puros en Allemagne en 2018 après quatre ans sans aucun envoi du secteur.',
  `rev_detail_en` = 'Tobacco makes 40% of Piedecuesta''s municipal product and feeds 4,500 to 6,500 families, depending on the year and the newspaper; two hundred makers, 78% women (2018). Almost all of it is cheap tabaco; the premium puro is the business of a few houses, and export remains rare — Colpuros placed puros in Germany in 2018 after four years without any shipment from the sector.',
  `rev_detail_es` = 'El tabaco hace el 40 % del producto municipal de Piedecuesta y sostiene de 4 500 a 6 500 familias, según el año y el diario; doscientos fabricantes, 78 % mujeres (2018). Casi todo es tabaco barato; el puro premium es asunto de unas pocas casas, y la exportación sigue siendo rara — Colpuros colocó puros en Alemania en 2018 tras cuatro años sin ningún envío del sector.',
  `rev_detail_de` = 'Tabak macht 40 % des Gemeindeprodukts von Piedecuesta aus und ernährt 4 500 bis 6 500 Familien, je nach Jahr und Zeitung; zweihundert Hersteller, 78 % Frauen (2018). Fast alles ist billiger tabaco; der Premium-Puro ist Sache weniger Häuser, und der Export bleibt selten — Colpuros brachte 2018 Puros nach Deutschland, nach vier Jahren ohne eine Lieferung des Sektors.',
  `rev_detail_zh` = '烟草占皮耶德奎斯塔市产值的40%，养活4500到6500个家庭（因年份和报纸而异）；两百家制造者，78%为女性（2018年）。几乎全是廉价 tabaco；高档 puro 只是少数几家的事，出口仍然稀少——Colpuros 于2018年把 puro 送进德国，此前该行业四年没有任何出货。',
  `rev_detail_ar` = 'يشكّل التبغ 40 % من ناتج بلدية بييديكويستا ويعيل 4500 إلى 6500 أسرة بحسب السنة والصحيفة؛ مئتا صانع، 78 % منهم نساء (2018). يكاد كلّه تبغًا رخيصًا؛ والسيجار الفاخر شأن دور قليلة، ويبقى التصدير نادرًا — وضعت Colpuros سيجارًا في ألمانيا سنة 2018 بعد أربع سنوات من دون أيّ شحنة من القطاع.'
 WHERE `id` = 'colombia';

-- ── germany (221) : fr 223, en 219, es 214, de 220 ──
UPDATE `producer_countries` SET
  `rev_detail` = 'Aucun chiffre agrégé : l''Allemagne est un grand pays de cigares de machine — Bünde, Lübbecke — que l''atlas ne porte pas, et de trois ateliers main qui comptent en dizaines de milliers de pièces par an. Le tabac est importé.',
  `rev_detail_en` = 'No aggregate figure: Germany is a major country of machine cigars — Bünde, Lübbecke — which this atlas does not carry, and of three hand workshops counting in tens of thousands of pieces a year. The tobacco is imported.',
  `rev_detail_es` = 'Ninguna cifra agregada: Alemania es un gran país de puros de máquina — Bünde, Lübbecke — que este atlas no recoge, y de tres talleres a mano que cuentan en decenas de miles de piezas al año. El tabaco es importado.',
  `rev_detail_de` = 'Keine Gesamtzahl: Deutschland ist ein großes Land der Maschinenzigarren — Bünde, Lübbecke —, die dieser Atlas nicht führt, und dreier Handwerkstätten, die in Zehntausenden Stück im Jahr zählen. Der Tabak wird importiert.',
  `rev_detail_zh` = '没有汇总数字：德国是机制雪茄大国——本德、吕贝克——本图集不收录；三家手工作坊年产以万计。烟叶为进口。',
  `rev_detail_ar` = 'لا رقم إجمالي: ألمانيا بلد كبير للسيجار الآلي — بونده ولوبكه — لا يحمله هذا الأطلس، وثلاث ورش يدوية تُعدّ بعشرات آلاف القطع في السنة. والتبغ مستورد.'
 WHERE `id` = 'germany';

-- ── ivorycoast (165) : fr 243, es 226, de 212, ar 203 ──
UPDATE `producer_countries` SET
  `rev_detail` = 'Environ 8 071 t de feuilles de tabac par an, premier tonnage d''Afrique de l''Ouest (FAO) — toutes variétés confondues. La part qui va au cigare n''est isolée par aucune statistique, et il n''existe pas de ligne d''exportation de cigares ivoiriens.',
  `rev_detail_en` = 'About 8,071 t of tobacco leaf a year, ranking first in West Africa (FAO) — all varieties together. No statistic isolates the share that goes to cigars, and there is no export line for Ivorian cigars.',
  `rev_detail_es` = 'Unas 8 071 t de hoja de tabaco al año, el primer tonelaje de África Occidental (FAO), todas las variedades juntas. Ninguna estadística aísla la parte destinada al puro, y no existe una línea de exportación de puros marfileños.',
  `rev_detail_de` = 'Rund 8 071 t Tabakblatt im Jahr, an erster Stelle in Westafrika (FAO) — alle Sorten zusammen. Keine Statistik trennt den Anteil, der in Zigarren geht, und eine Exportposition für ivorische Zigarren gibt es nicht.',
  `rev_detail_zh` = '每年约 8 071 吨烟叶，在西非居首位（粮农组织数据），且为各品种合计。没有任何统计单列用于雪茄的部分，也不存在科特迪瓦雪茄的出口税目。',
  `rev_detail_ar` = 'نحو 8071 طنًّا من أوراق التبغ سنويًا، وهو الأول في غرب أفريقيا (منظمة الأغذية والزراعة)، بجميع الأصناف مجتمعة. ولا تفصل أي إحصاءة الحصّة الموجّهة إلى السيجار، ولا يوجد بند جمركي لتصدير السيجار الإيفواري.'
 WHERE `id` = 'ivorycoast';

-- ── mozambique (174) : fr 233, en 205, es 212, de 237 ──
UPDATE `producer_countries` SET
  `rev_detail` = 'Il n''existe pas de ligne d''exportation de cigares mozambicains. L''atelier de Maputo sort environ dix mille cigares par mois, vendus pour l''essentiel sur le continent — Mozambique, Afrique du Sud, Kenya, Nigeria, Congo, Côte d''Ivoire.',
  `rev_detail_en` = 'There is no export line for Mozambican cigars. The Maputo workshop turns out some ten thousand cigars a month, sold mostly on the continent — Mozambique, South Africa, Kenya, Nigeria, Congo, Côte d''Ivoire.',
  `rev_detail_es` = 'No existe una línea de exportación de puros mozambiqueños. El taller de Maputo saca unos diez mil puros al mes, vendidos sobre todo en el continente: Mozambique, Sudáfrica, Kenia, Nigeria, Congo, Costa de Marfil.',
  `rev_detail_de` = 'Eine Exportposition für mosambikanische Zigarren gibt es nicht. Die Werkstatt in Maputo bringt rund zehntausend Zigarren im Monat hervor, überwiegend auf dem Kontinent verkauft — Mosambik, Südafrika, Kenia, Nigeria, Kongo, Côte d''Ivoire.',
  `rev_detail_zh` = '并不存在莫桑比克雪茄的出口税目。马普托的工坊月产约一万支，主要在非洲大陆销售——莫桑比克、南非、肯尼亚、尼日利亚、刚果、科特迪瓦。',
  `rev_detail_ar` = 'لا يوجد بند جمركي لتصدير السيجار الموزمبيقي. تُنتج ورشة مابوتو نحو عشرة آلاف سيجار شهريًا، تُباع في معظمها داخل القارة: موزمبيق وجنوب أفريقيا وكينيا ونيجيريا والكونغو وساحل العاج.'
 WHERE `id` = 'mozambique';

-- ── peru (223) : fr 318, en 294, es 324, de 337, ar 251 ──
UPDATE `producer_countries` SET
  `rev_detail` = 'Le tabac de Tarapoto se vend d''abord en feuilles : 80 à 100 tonnes exportées par an vers l''Amérique centrale (2016), 70 % du chiffre contre 30 % pour le cigare fini — la maison veut inverser la proportion. Les cigares partent à 80 % à l''export, en Europe et en Asie ; un contrat italien de 2011 valait 220 000 dollars.',
  `rev_detail_en` = 'Tarapoto tobacco sells first as leaf: 80 to 100 tonnes exported a year to Central America (2016), 70% of turnover against 30% for finished cigars — the house wants to reverse the proportion. The cigars go 80% to export, in Europe and Asia; an Italian contract of 2011 was worth 220,000 dollars.',
  `rev_detail_es` = 'El tabaco de Tarapoto se vende primero en hoja: de 80 a 100 toneladas exportadas al año hacia Centroamérica (2016), 70 % de la cifra frente a 30 % para el puro terminado — la casa quiere invertir la proporción. Los puros salen en un 80 % a la exportación, a Europa y Asia; un contrato italiano de 2011 valía 220 000 dólares.',
  `rev_detail_de` = 'Der Tabak von Tarapoto verkauft sich zuerst als Blatt: 80 bis 100 Tonnen im Jahr nach Mittelamerika exportiert (2016), 70 % des Umsatzes gegen 30 % für die fertige Zigarre — das Haus will das Verhältnis umkehren. Die Zigarren gehen zu 80 % in den Export, nach Europa und Asien; ein italienischer Vertrag von 2011 war 220 000 Dollar wert.',
  `rev_detail_zh` = '塔拉波托的烟叶首先以原叶出售：每年向中美洲出口80到100吨（2016年），占营业额70%，成品雪茄占30%——公司想把比例倒过来。雪茄八成出口，销往欧洲和亚洲；2011年一份意大利合同价值22万美元。',
  `rev_detail_ar` = 'يُباع تبغ تارابوتو أوّلًا ورقًا: 80 إلى 100 طن تُصدَّر سنويًّا إلى أمريكا الوسطى (2016)، 70 % من الرقم مقابل 30 % للسيجار الجاهز — وتريد الدار قلب النسبة. ويذهب 80 % من السيجار إلى التصدير، في أوروبا وآسيا؛ وبلغ عقد إيطالي سنة 2011 قيمة 220 ألف دولار.'
 WHERE `id` = 'peru';

-- ── russia (221) : fr 289, en 268, es 258, de 285, ar 214 ──
UPDATE `producer_countries` SET
  `rev_detail` = 'Marché intérieur seulement : Siglo de Oro vend en Russie, où l''on a fumé environ 2,5 millions de cigares en 2020. Le tabac vient de Cuba, du Nicaragua, d''Équateur et de République dominicaine ; la Russie en cultivait au Caucase, en Crimée et au Kouban, et n''en cultive plus pour le cigare.',
  `rev_detail_en` = 'Domestic market only: Siglo de Oro sells in Russia, where about 2.5 million cigars were smoked in 2020. The tobacco comes from Cuba, Nicaragua, Ecuador and the Dominican Republic; Russia grew it in the Caucasus, Crimea and the Kuban, and no longer grows it for cigars.',
  `rev_detail_es` = 'Solo mercado interior: Siglo de Oro vende en Rusia, donde se fumaron unos 2,5 millones de puros en 2020. El tabaco viene de Cuba, Nicaragua, Ecuador y República Dominicana; Rusia lo cultivaba en el Cáucaso, Crimea y el Kubán, y ya no lo cultiva para el puro.',
  `rev_detail_de` = 'Nur Binnenmarkt: Siglo de Oro verkauft in Russland, wo 2020 etwa 2,5 Millionen Zigarren geraucht wurden. Der Tabak kommt aus Kuba, Nicaragua, Ecuador und der Dominikanischen Republik; Russland baute ihn im Kaukasus, auf der Krim und im Kuban an und baut ihn für Zigarren nicht mehr an.',
  `rev_detail_zh` = '只有国内市场：Siglo de Oro 在俄罗斯销售，2020年该国约消费250万支雪茄。烟叶来自古巴、尼加拉瓜、厄瓜多尔和多米尼加；俄罗斯曾在高加索、克里米亚和库班种植烟草，如今不再为雪茄种植。',
  `rev_detail_ar` = 'سوق داخلية فقط: تبيع Siglo de Oro في روسيا حيث دُخّن نحو 2.5 مليون سيجار سنة 2020. يأتي التبغ من كوبا ونيكاراغوا والإكوادور وجمهورية الدومينيكان؛ وكانت روسيا تزرعه في القوقاز والقرم والكوبان، ولم تعد تزرعه للسيجار.'
 WHERE `id` = 'russia';

-- ── southafrica (223) : fr 331, en 303, es 300, de 310, ar 258 ──
UPDATE `producer_countries` SET
  `rev_detail` = 'Aucun chiffre. L''Afrique du Sud cultive du tabac — trois à quatre cents planteurs, dont un cinquième environ en séchage à l''air, dit la presse agricole de 2023 — et n''a qu''un atelier qui en fasse des cigares. La cape et la sous-cape viendraient d''une vallée du Western Cape, la tripe de l''Eastern Cape : c''est la maison qui le dit.',
  `rev_detail_en` = 'No figures. South Africa grows tobacco — three to four hundred growers, about a fifth of them air-curing, says the farming press of 2023 — and has only one workshop making cigars from it. Wrapper and binder would come from a Western Cape valley, filler from the Eastern Cape: that is the house speaking.',
  `rev_detail_es` = 'Ninguna cifra. Sudáfrica cultiva tabaco — de trescientos a cuatrocientos plantadores, cerca de un quinto en curado al aire, dice la prensa agrícola de 2023 — y solo tiene un taller que haga puros con él. Capa y capote vendrían de un valle del Western Cape, la tripa del Eastern Cape: lo dice la casa.',
  `rev_detail_de` = 'Keine Zahlen. Südafrika baut Tabak an — drei- bis vierhundert Pflanzer, etwa ein Fünftel davon luftgetrocknet, sagt die Agrarpresse von 2023 — und hat nur eine Werkstatt, die daraus Zigarren macht. Deckblatt und Umblatt kämen aus einem Tal des Western Cape, die Einlage aus dem Eastern Cape: das sagt das Haus.',
  `rev_detail_zh` = '没有数字。南非种植烟草——2023年农业媒体称有三四百家种植者，约五分之一为晾制——只有一家作坊用它做雪茄。茄衣和茄套据说来自西开普省的一处山谷，茄芯来自东开普省：这是公司的说法。',
  `rev_detail_ar` = 'لا أرقام. تزرع جنوب أفريقيا التبغ — ثلاثمئة إلى أربعمئة مزارع، نحو خُمسهم بالتجفيف الهوائي، تقول الصحافة الزراعية سنة 2023 — وليس فيها سوى ورشة واحدة تصنع منه السيجار. الغلاف والرابط يأتيان، كما تقول الدار، من وادٍ في الكيب الغربية، والحشوة من الكيب الشرقية.'
 WHERE `id` = 'southafrica';

-- ── zimbabwe (223) : fr 275, en 248, es 266, de 285, ar 208 ──
UPDATE `producer_countries` SET
  `rev_detail` = 'Le Zimbabwe est l''un des grands pays du tabac de cigarette — le Virginie séché à l''air chaud —, et ce tabac-là ne fait pas de cigare. Le cigare y prend une petite part de Burley séché à l''air, et importe ses capes. Une seule fabrique, qui ne publie pas de chiffre d''affaires.',
  `rev_detail_en` = 'Zimbabwe is one of the great countries of cigarette tobacco — flue-cured Virginia —, and that tobacco makes no cigars. The cigar takes a small share of air-cured Burley there, and imports its wrappers. A single factory, which publishes no turnover.',
  `rev_detail_es` = 'Zimbabue es uno de los grandes países del tabaco de cigarrillo — el Virginia curado con aire caliente —, y ese tabaco no hace puros. El puro toma allí una pequeña parte de Burley curado al aire, e importa sus capas. Una sola fábrica, que no publica cifra de negocio.',
  `rev_detail_de` = 'Simbabwe ist eines der großen Länder des Zigarettentabaks — heißluftgetrockneter Virginia —, und dieser Tabak macht keine Zigarren. Die Zigarre nimmt dort einen kleinen Teil luftgetrockneten Burley und importiert ihre Deckblätter. Eine einzige Fabrik, die keinen Umsatz veröffentlicht.',
  `rev_detail_zh` = '津巴布韦是卷烟烟草大国之一——热风烤制的弗吉尼亚烟——而那种烟叶做不了雪茄。雪茄在此只取一小部分晾制白肋烟，茄衣靠进口。仅一家工厂，不公布营业额。',
  `rev_detail_ar` = 'زيمبابوي من البلدان الكبيرة لتبغ السجائر — الفرجينيا المجفّف بالهواء الساخن — وذلك التبغ لا يصنع سيجارًا. يأخذ السيجار هناك حصّة صغيرة من البيرلي المجفّف بالهواء، ويستورد أغلفته. مصنع واحد، لا ينشر رقم أعمال.'
 WHERE `id` = 'zimbabwe';


INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'producer_countries', p.`id`, 'rev_detail', l.lang, SHA1(p.`rev_detail`), 'machine', NOW()
  FROM `producer_countries` p
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de' UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE p.`id` IN ('aruba','azores','bahamas','china','colombia','germany','ivorycoast','mozambique','peru','russia','southafrica','zimbabwe')
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 224';
INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 224','systeme','rev_detail_elargi_en_text','pays',0,
   'Six colonnes varchar(200) passees en TEXT : rev_detail et ses cinq traductions. Douze pays tronques en silence depuis la 165, reecrits entiers depuis les migrations 165, 174, 215, 221 et 223. Meme panne que brands.source (219)');

SELECT
  (SELECT COUNT(*) FROM information_schema.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'producer_countries'
      AND COLUMN_NAME LIKE 'rev_detail%' AND DATA_TYPE = 'text') = 6 AS six_colonnes_text,
  -- Le francais des Bahamas fait exactement 200 caracteres, entier et
  -- ponctue (215) : c'est l'exception nommee, comme ADVentura en 219.
  (SELECT COUNT(*) FROM `producer_countries`
    WHERE `id` <> 'bahamas'
      AND 200 IN (CHAR_LENGTH(`rev_detail`), CHAR_LENGTH(`rev_detail_en`), CHAR_LENGTH(`rev_detail_es`),
                  CHAR_LENGTH(`rev_detail_de`), CHAR_LENGTH(`rev_detail_zh`), CHAR_LENGTH(`rev_detail_ar`))) = 0 AS plus_rien_a_200,
  (SELECT COUNT(*) FROM `producer_countries` WHERE `id` IN ('aruba','azores','bahamas','china','colombia','germany','ivorycoast','mozambique','peru','russia','southafrica','zimbabwe') AND CHAR_LENGTH(`rev_detail`) > 200) = 11 AS textes_entiers,
  (SELECT SUM(CHAR_LENGTH(`detail`) >= 255) = 0 FROM `moderation_log` WHERE `acteur_nom` = 'migration 224') AS journal_non_tronque;
