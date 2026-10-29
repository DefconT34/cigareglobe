-- ════════════════════════════════════════════════════════
-- 295 — Pays producteurs : chiffres d'export, superlatifs, bloc local
-- ────────────────────────────────────────────────────────
-- CE QU'ON A TROUVÉ. Audit du 29 octobre 2026 : sur les pages Nicaragua, République
-- dominicaine et Honduras, `habanos_presence.revenue` portait des estimations sans
-- source (~850 M$, ~1,2 Md$, ~220 M$) qui contredisaient les chiffres sourcés de
-- `producer_countries.revenue` (425 M$ 2023, 1,34 Md$ 2024, 115 M$ 2024) ; les statuts
-- (« PREMIER EXPORTATEUR MONDIAL », « PÔLE MONDIAL INDÉPENDANT »…) et les textes
-- (« premier producteur mondial », « quatrième producteur mondial », « record mondial »)
-- étaient des rangs non sourcés. Remplacés par des faits attribués à la Cigar Association
-- of America (430 M de cigares importés aux États-Unis en 2024) et à l'Intabaco, ou supprimés.
-- Le champ `habanos_presence.revenue` des trois pays est vidé. Padrón est à Estelí (retrait
-- du rattachement à TAVASA / Jalapa) ; « STG Honduras (Altadis) » amalgamait deux groupes
-- (CAO a été reversée à HATSA, General Cigar, groupe STG, en 2010) ; la ligne « distributeur
-- USA » de la RD amalgamait General Cigar, Altadis USA et STG. Cuba : Remedios est au centre
-- (Vuelta Arriba), pas « de l'Est » ; le Corojo n'a pas « disparu » : il est abandonné à Cuba
-- vers 1996-1997 selon les sources. Le bloc « Habanos S.A. » des pays non cubains devient
-- « Industrie locale » (clé `s_industrie_locale`, panels.js et page.php).
-- ════════════════════════════════════════════════════════

UPDATE `habanos_presence` SET `revenue` = NULL WHERE `country_id` = 'nicaragua';

UPDATE `producer_countries` SET
  `rev_detail` = 'exportations de cigares, cigarettes et assimilés (HS 2402), d''après UN Comtrade via TrendEconomy ; la Banque centrale du Nicaragua donne 421,8 M$ pour 2024 (La Prensa, juin 2026) et la Chambre des tabacaleros près de 400 M$ ; les importations américaines depuis le Nicaragua sont de 371 M$ en 2023',
  `rev_detail_en` = 'exports of cigars, cigarettes and similar products (HS 2402), according to UN Comtrade via TrendEconomy; the Central Bank of Nicaragua gives US$421.8 million for 2024 (La Prensa, June 2026) and the Chamber of Tabacaleros close to US$400 million; US imports from Nicaragua stand at US$371 million in 2023',
  `rev_detail_es` = 'exportaciones de puros, cigarrillos y similares (HS 2402), según UN Comtrade a través de TrendEconomy; el Banco Central de Nicaragua indica 421,8 millones de dólares para 2024 (La Prensa, junio de 2026) y la Cámara de Tabacaleros cerca de 400 millones; las importaciones estadounidenses procedentes de Nicaragua ascienden a 371 millones de dólares en 2023',
  `rev_detail_de` = 'Exporte von Zigarren, Zigaretten und ähnlichen Erzeugnissen (HS 2402) nach UN Comtrade über TrendEconomy; die Zentralbank von Nicaragua nennt für 2024 421,8 Mio. US-Dollar (La Prensa, Juni 2026) und die Kammer der Tabacaleros nahezu 400 Mio. US-Dollar; die US-Importe aus Nicaragua belaufen sich 2023 auf 371 Mio. US-Dollar',
  `rev_detail_zh` = '雪茄、卷烟及类似产品的出口(HS 2402),数据来自 UN Comtrade(经 TrendEconomy);尼加拉瓜中央银行给出的 2024 年数字为 4.218 亿美元(La Prensa,2026 年 6 月),烟草商会(Chambre des tabacaleros)则给出近 4 亿美元;2023 年美国自尼加拉瓜的进口额为 3.71 亿美元',
  `rev_detail_ar` = 'صادرات السيجار والسجائر وما شابهها (HS 2402)، وفق UN Comtrade عبر TrendEconomy؛ ويذكر البنك المركزي في نيكاراغوا 421٫8 مليون دولار لعام 2024 (La Prensa، يونيو 2026) وتذكر غرفة التاباكاليروس نحو 400 مليون دولار؛ وتبلغ الواردات الأمريكية من نيكاراغوا 371 مليون دولار في عام 2023'
 WHERE `id` = 'nicaragua';

UPDATE `habanos_presence` SET
  `status` = 'INDUSTRIE LOCALE',
  `status_en` = 'LOCAL INDUSTRY',
  `status_es` = 'INDUSTRIA LOCAL',
  `status_de` = 'EINHEIMISCHE INDUSTRIE',
  `status_zh` = '本地产业',
  `status_ar` = 'صناعة محلية'
 WHERE `country_id` = 'nicaragua';

UPDATE `habanos_presence` SET
  `description` = 'Le Nicaragua est le premier fournisseur de cigares premium des États-Unis : environ 253 millions d''unités en 2024, soit près de 59 % des 430 millions importés (Cigar Association of America). L''industrie se concentre autour d''Estelí, surnommée « capitale du cigare », où plusieurs maisons ont leur fabrique.',
  `description_en` = 'Nicaragua is the leading supplier of premium cigars to the United States: about 253 million units in 2024, or nearly 59% of the 430 million imported (Cigar Association of America). The industry is concentrated around Estelí, nicknamed the "cigar capital", where several houses have their factory.',
  `description_es` = 'Nicaragua es el primer proveedor de puros premium de Estados Unidos: unos 253 millones de unidades en 2024, es decir, cerca del 59 % de los 430 millones importados (Cigar Association of America). La industria se concentra en torno a Estelí, apodada la «capital del puro», donde varias casas tienen su fábrica.',
  `description_de` = 'Nicaragua ist der erste Lieferant von Premium-Zigarren für die USA: rund 253 Millionen Stück im Jahr 2024, das sind knapp 59 % der 430 Millionen importierten Zigarren (Cigar Association of America). Die Industrie konzentriert sich um Estelí, die als „Hauptstadt der Zigarre“ bezeichnet wird und in der mehrere Häuser ihre Manufaktur unterhalten.',
  `description_zh` = '尼加拉瓜是美国高端雪茄的首位供应国:2024 年约 2.53 亿支,约占进口总量 4.3 亿支的 59%(Cigar Association of America)。该产业集中在埃斯特利周边,该地被称为“雪茄之都”,多家雪茄品牌在此设有工厂。',
  `description_ar` = 'نيكاراغوا هي المورّد الأول للسيجار الفاخر إلى الولايات المتحدة: نحو 253 مليون وحدة في عام 2024، أي ما يقارب 59 % من أصل 430 مليون وحدة مستوردة (Cigar Association of America). وتتركز الصناعة حول إستيلي، التي تُلقَّب «عاصمة السيجار»، حيث تملك عدة دور مصنعها فيها.'
 WHERE `country_id` = 'nicaragua';

UPDATE `habanos_presence` SET `revenue` = NULL WHERE `country_id` = 'dominican';

UPDATE `producer_countries` SET
  `rev_detail` = 'exportations de tabac dominicain, tous produits, vers 148 pays, dont 996 M$ vers les États-Unis (Intabaco, mai 2025)',
  `rev_detail_en` = 'exports of Dominican tobacco, all products, to 148 countries, including US$996 million to the United States (Intabaco, May 2025)',
  `rev_detail_es` = 'exportaciones de tabaco dominicano, todos los productos, a 148 países, de los cuales 996 millones de dólares a Estados Unidos (Intabaco, mayo de 2025)',
  `rev_detail_de` = 'Exporte dominikanischen Tabaks, alle Erzeugnisse, in 148 Länder, davon 996 Mio. US-Dollar in die USA (Intabaco, Mai 2025)',
  `rev_detail_zh` = '多米尼加烟草出口(所有产品)销往 148 个国家,其中对美国出口 9.96 亿美元(Intabaco,2025 年 5 月)',
  `rev_detail_ar` = 'صادرات التبغ الدومينيكاني، بجميع منتجاته، إلى 148 دولة، منها 996 مليون دولار إلى الولايات المتحدة (Intabaco، مايو 2025)'
 WHERE `id` = 'dominican';

UPDATE `habanos_presence` SET
  `status` = 'INDUSTRIE LOCALE',
  `status_en` = 'LOCAL INDUSTRY',
  `status_es` = 'INDUSTRIA LOCAL',
  `status_de` = 'EINHEIMISCHE INDUSTRIE',
  `status_zh` = '本地产业',
  `status_ar` = 'صناعة محلية'
 WHERE `country_id` = 'dominican';

UPDATE `habanos_presence` SET
  `description` = 'Selon l''Intabaco (mai 2025), le tabac dominicain est exporté vers 148 pays pour environ 1,34 Md$ par an, dont 996 M$ vers les États-Unis. Pour les seuls cigares premium, la Cigar Association of America compte 106 millions d''unités importées aux États-Unis en 2024 (-1,8 %). La région de Santiago et la vallée du Cibao concentrent de grandes manufactures.',
  `description_en` = 'According to Intabaco (May 2025), Dominican tobacco is exported to 148 countries for about US$1.34 billion a year, including US$996 million to the United States. For premium cigars alone, the Cigar Association of America counts 106 million units imported into the United States in 2024 (-1.8%). The Santiago region and the Cibao valley are home to large factories.',
  `description_es` = 'Según Intabaco (mayo de 2025), el tabaco dominicano se exporta a 148 países por unos 1340 millones de dólares al año, de los cuales 996 millones a Estados Unidos. Solo para los puros premium, la Cigar Association of America contabiliza 106 millones de unidades importadas en Estados Unidos en 2024 (-1,8 %). La región de Santiago y el valle del Cibao concentran grandes manufacturas.',
  `description_de` = 'Laut Intabaco (Mai 2025) wird dominikanischer Tabak in 148 Länder exportiert, für rund 1,34 Mrd. US-Dollar pro Jahr, davon 996 Mio. US-Dollar in die USA. Allein bei Premium-Zigarren zählt die Cigar Association of America 106 Millionen in die USA importierte Stück im Jahr 2024 (-1,8 %). Die Region Santiago und das Cibao-Tal vereinen große Manufakturen.',
  `description_zh` = '据 Intabaco(2025 年 5 月)统计,多米尼加烟草出口至 148 个国家,年出口额约 13.4 亿美元,其中对美国出口 9.96 亿美元。仅就高端雪茄而言,Cigar Association of America 统计 2024 年美国进口 1.06 亿支(-1.8%)。圣地亚哥地区和锡瓦奥山谷集中了多家大型雪茄厂。',
  `description_ar` = 'وفق Intabaco (مايو 2025)، يُصدَّر التبغ الدومينيكاني إلى 148 دولة بنحو 1٫34 مليار دولار سنويًا، منها 996 مليون دولار إلى الولايات المتحدة. وبالنسبة إلى السيجار الفاخر وحده، تحصي Cigar Association of America استيراد 106 ملايين وحدة إلى الولايات المتحدة في عام 2024 (-1٫8 %). وتضم منطقة سانتياغو ووادي سيباو مصانع كبرى.'
 WHERE `country_id` = 'dominican';

UPDATE `habanos_presence` SET `revenue` = NULL WHERE `country_id` = 'honduras';

UPDATE `producer_countries` SET
  `rev_detail` = 'importations américaines de tabac et produits du tabac depuis le Honduras (UN Comtrade, via Trading Economics ; tous produits du tabac, pas les seuls cigares) ; 112 M$ en 2023 pour les cigares et assimilés (HS 2402, TrendEconomy)',
  `rev_detail_en` = 'US imports of tobacco and tobacco products from Honduras (UN Comtrade, via Trading Economics; all tobacco products, not cigars alone); US$112 million in 2023 for cigars and similar products (HS 2402, TrendEconomy)',
  `rev_detail_es` = 'importaciones estadounidenses de tabaco y productos del tabaco procedentes de Honduras (UN Comtrade, a través de Trading Economics; todos los productos del tabaco, no solo los puros); 112 millones de dólares en 2023 por puros y similares (HS 2402, TrendEconomy)',
  `rev_detail_de` = 'US-Importe von Tabak und Tabakerzeugnissen aus Honduras (UN Comtrade, über Trading Economics; alle Tabakerzeugnisse, nicht nur Zigarren); 112 Mio. US-Dollar im Jahr 2023 für Zigarren und ähnliche Erzeugnisse (HS 2402, TrendEconomy)',
  `rev_detail_zh` = '美国自洪都拉斯进口的烟草及烟草制品(UN Comtrade,经 Trading Economics;为全部烟草制品,而非仅雪茄);2023 年雪茄及类似产品为 1.12 亿美元(HS 2402,TrendEconomy)',
  `rev_detail_ar` = 'الواردات الأمريكية من التبغ ومنتجات التبغ من هندوراس (UN Comtrade، عبر Trading Economics؛ جميع منتجات التبغ وليس السيجار وحده)؛ و112 مليون دولار في عام 2023 للسيجار وما شابهه (HS 2402، TrendEconomy)'
 WHERE `id` = 'honduras';

UPDATE `habanos_presence` SET
  `status` = 'INDUSTRIE LOCALE',
  `status_en` = 'LOCAL INDUSTRY',
  `status_es` = 'INDUSTRIA LOCAL',
  `status_de` = 'EINHEIMISCHE INDUSTRIE',
  `status_zh` = '本地产业',
  `status_ar` = 'صناعة محلية'
 WHERE `country_id` = 'honduras';

UPDATE `habanos_presence` SET
  `description` = 'Le Honduras est le troisième fournisseur de cigares premium des États-Unis : 67,4 millions d''unités en 2024 (-3,3 %), derrière le Nicaragua et la République dominicaine (Cigar Association of America). La vallée de Jamastrán est l''une des zones où se cultive aujourd''hui le Corojo, abandonné à Cuba vers 1997.',
  `description_en` = 'Honduras is the third-largest supplier of premium cigars to the United States: 67.4 million units in 2024 (-3.3%), behind Nicaragua and the Dominican Republic (Cigar Association of America). The Jamastrán valley is one of the areas where Corojo, abandoned in Cuba around 1997, is grown today.',
  `description_es` = 'Honduras es el tercer proveedor de puros premium de Estados Unidos: 67,4 millones de unidades en 2024 (-3,3 %), por detrás de Nicaragua y la República Dominicana (Cigar Association of America). El valle de Jamastrán es una de las zonas donde se cultiva hoy el Corojo, abandonado en Cuba hacia 1997.',
  `description_de` = 'Honduras ist der dritte Lieferant von Premium-Zigarren für die USA: 67,4 Millionen Stück im Jahr 2024 (-3,3 %), hinter Nicaragua und der Dominikanischen Republik (Cigar Association of America). Das Jamastrán-Tal ist eines der Gebiete, in denen heute Corojo angebaut wird, der auf Kuba um 1997 aufgegeben wurde.',
  `description_zh` = '洪都拉斯是美国高端雪茄的第三大供应国:2024 年为 6740 万支(-3.3%),位列尼加拉瓜和多米尼加共和国之后(Cigar Association of America)。哈马斯特兰山谷是如今种植 Corojo 的产区之一,这一品种在古巴于 1997 年前后被弃用。',
  `description_ar` = 'هندوراس هي المورّد الثالث للسيجار الفاخر إلى الولايات المتحدة: 67٫4 مليون وحدة في عام 2024 (-3٫3 %)، بعد نيكاراغوا وجمهورية الدومينيكان (Cigar Association of America). ويُعدّ وادي خاماسترين إحدى المناطق التي يُزرع فيها اليوم الكورخو، الذي تُرك في كوبا نحو عام 1997.'
 WHERE `country_id` = 'honduras';

UPDATE `producer_countries` SET
  `notes` = 'En 2024, près de six cigares premium sur dix importés aux États-Unis viennent du Nicaragua (Cigar Association of America).',
  `notes_en` = 'In 2024, nearly six in ten premium cigars imported into the United States come from Nicaragua (Cigar Association of America).',
  `notes_es` = 'En 2024, cerca de seis de cada diez puros premium importados en Estados Unidos proceden de Nicaragua (Cigar Association of America).',
  `notes_de` = 'Im Jahr 2024 stammen knapp sechs von zehn in die USA importierten Premium-Zigarren aus Nicaragua (Cigar Association of America).',
  `notes_zh` = '2024 年,美国进口的高端雪茄中,近六成来自尼加拉瓜(Cigar Association of America)。',
  `notes_ar` = 'في عام 2024، يأتي نحو ستة من كل عشرة سيجار فاخر مستورد إلى الولايات المتحدة من نيكاراغوا (Cigar Association of America).'
 WHERE `id` = 'nicaragua';

UPDATE `producer_countries` SET
  `notes` = '… hybrides de l''ancien Corojo, abandonné à Cuba vers 1996-1997 selon les sources (Cigar Aficionado, « The Death of El Corojo », hésite sur la date).',
  `notes_en` = '… hybrids of the old Corojo, abandoned in Cuba around 1996-1997 depending on the source (Cigar Aficionado, "The Death of El Corojo", is unsure of the date).',
  `notes_es` = '… híbridos del antiguo Corojo, abandonado en Cuba hacia 1996-1997 según las fuentes (Cigar Aficionado, «The Death of El Corojo», duda sobre la fecha).',
  `notes_de` = '… Hybriden des alten Corojo, der auf Kuba je nach Quelle um 1996–1997 aufgegeben wurde (Cigar Aficionado, „The Death of El Corojo“, ist beim Datum unsicher).',
  `notes_zh` = '……古老 Corojo 的杂交品种;该品种在古巴于 1996—1997 年前后被弃用,各来源说法不一(Cigar Aficionado 的《The Death of El Corojo》对年份不确定)。',
  `notes_ar` = '… هجائن من الكورخو القديم، الذي تُرك في كوبا نحو عامي 1996-1997 بحسب المصادر (Cigar Aficionado، «The Death of El Corojo»، تتردد في تحديد التاريخ).'
 WHERE `id` = 'cuba';

UPDATE `production_zones` SET
  `note` = 'Centre de l''île (Vuelta Arriba) ; feuilles de la fabrique José L. Piedra, selon habanos.com',
  `note_en` = 'Centre of the island (Vuelta Arriba); leaves from the José L. Piedra factory, according to habanos.com',
  `note_es` = 'Centro de la isla (Vuelta Arriba); hojas de la fábrica José L. Piedra, según habanos.com',
  `note_de` = 'Zentrum der Insel (Vuelta Arriba); Blätter der Fabrik José L. Piedra, laut habanos.com',
  `note_zh` = '岛屿中部(Vuelta Arriba);叶片来自 José L. Piedra 工厂,据 habanos.com',
  `note_ar` = 'وسط الجزيرة (Vuelta Arriba)؛ أوراق من مصنع José L. Piedra، وفق habanos.com'
 WHERE `id` = 4 AND `country_id` = 'cuba';

UPDATE `habanos_presence` SET `factories` = REPLACE(`factories`, '{"name":"Tabacos Valle de Jalapa (TAVASA)","city":"Jalapa","founded":"1970s","marques":["Padrón 1926","Padrón 1964","Family Reserve"]}', '{"name":"Padrón Cigars (Tabacalera Padrón)","city":"Estelí","founded":"—","marques":["Padrón 1926","Padrón 1964","Family Reserve"]}') WHERE `country_id` = 'nicaragua';

UPDATE `habanos_presence` SET `factories` = REPLACE(`factories`, ',{"name":"STG Honduras (Altadis)","city":"Danlí","founded":"1980s","marques":["CAO","Baccarat","Henri Wintermans HN"]}', '') WHERE `country_id` = 'honduras';

UPDATE `habanos_presence` SET `factories` = REPLACE(`factories`, '{"name":"HATSA","city":"Danlí","founded":"1968","marques":["Hoyo de Monterrey HN","Punch HN","Excalibur"]}', '{"name":"HATSA (Honduras American Tobacco, General Cigar, groupe STG)","city":"Danlí","founded":"1968","marques":["Hoyo de Monterrey HN","Punch HN","Excalibur","CAO"]}') WHERE `country_id` = 'honduras';

UPDATE `habanos_presence` SET `distributeurs` = REPLACE(`distributeurs`, '{"pays":"USA","distributeur":"General Cigar Co. / Altadis USA / STG"},', '') WHERE `country_id` = 'dominican';

-- Sceaux : les textes touchés repassent en « machine », empreinte recalculée.
UPDATE `translation_status` t JOIN `habanos_presence` h ON h.`country_id` = t.`entite_id`
   SET t.`source_hash` = SHA1(h.`status`), t.`statut` = 'machine', t.`maj` = NOW()
 WHERE t.`entite` = 'habanos_presence' AND t.`champ` = 'status' AND t.`entite_id` IN ('nicaragua','dominican','honduras');
UPDATE `translation_status` t JOIN `habanos_presence` h ON h.`country_id` = t.`entite_id`
   SET t.`source_hash` = SHA1(h.`description`), t.`statut` = 'machine', t.`maj` = NOW()
 WHERE t.`entite` = 'habanos_presence' AND t.`champ` = 'description' AND t.`entite_id` IN ('nicaragua','dominican','honduras');
UPDATE `translation_status` t JOIN `producer_countries` c ON c.`id` = t.`entite_id`
   SET t.`source_hash` = SHA1(c.`rev_detail`), t.`statut` = 'machine', t.`maj` = NOW()
 WHERE t.`entite` = 'producer_countries' AND t.`champ` = 'rev_detail' AND t.`entite_id` IN ('nicaragua','dominican','honduras');
UPDATE `translation_status` t JOIN `producer_countries` c ON c.`id` = t.`entite_id`
   SET t.`source_hash` = SHA1(c.`notes`), t.`statut` = 'machine', t.`maj` = NOW()
 WHERE t.`entite` = 'producer_countries' AND t.`champ` = 'notes' AND t.`entite_id` IN ('nicaragua','cuba');
UPDATE `translation_status` t JOIN `production_zones` z ON z.`id` = t.`entite_id`
   SET t.`source_hash` = SHA1(z.`note`), t.`statut` = 'machine', t.`maj` = NOW()
 WHERE t.`entite` = 'production_zones' AND t.`champ` = 'note' AND t.`entite_id` = '4';

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 295';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 295', 'systeme', 'contenu_corrige', 'systeme', 0,
        'Pays producteurs : revenus non sources vides, superlatifs remplaces par des faits attribues, Padron a Esteli, STG/Altadis demele, Remedios au centre, Corojo');

-- Contrôle : des 1 partout.
SELECT
  (SELECT COUNT(*) FROM `habanos_presence` WHERE `country_id` IN ('nicaragua','dominican','honduras') AND `revenue` IS NULL) = 3 AS `revenus_vides`,
  (SELECT COUNT(*) FROM `habanos_presence` WHERE `country_id` IN ('nicaragua','dominican','honduras') AND `status` = 'INDUSTRIE LOCALE') = 3 AS `statuts`,
  (SELECT COUNT(*) FROM `habanos_presence` WHERE `factories` LIKE '%TAVASA%' OR `factories` LIKE '%STG Honduras%') = 0 AS `usines_demelees`,
  (SELECT COUNT(*) FROM `habanos_presence` WHERE `country_id` = 'dominican' AND `distributeurs` LIKE '%Altadis USA%') = 0 AS `distributeur_vide`,
  (SELECT COUNT(*) FROM `production_zones` WHERE `id` = 4 AND `note` LIKE '%Vuelta Arriba%') = 1 AS `remedios`,
  (SELECT COUNT(*) FROM `translation_status` WHERE `statut` = 'machine' AND `entite` IN ('habanos_presence','producer_countries','production_zones')
      AND `entite_id` IN ('nicaragua','dominican','honduras','cuba','4') AND `champ` IN ('status','description','rev_detail','notes','note')) >= 40 AS `sceaux_remis`;
