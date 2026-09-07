-- ════════════════════════════════════════════════════════
-- 180 — Les sept maisons mères
-- ────────────────────────────────────────────────────────
-- L'ATLAS PORTAIT UNE DOUZAINE DE MARQUES SANS JAMAIS NOMMER QUI LES
-- FAIT. Davidoff, Avo, The Griffin's, Camacho et Zino Platinum sont
-- d'un même groupe suisse ; Atabey, Byron et Bandolero d'un même homme ;
-- Flor de Selva d'une maison hondurienne fondée par une femme. Aucun de
-- ces propriétaires n'avait de fiche.
--
-- C'est le même défaut que les huit colonnes muettes, mais à l'échelle
-- d'une entreprise : la donnée existait, elle n'était nommée nulle part.
--
--   Oettinger Davidoff   Davidoff, Avo, The Griffin's, Camacho, Zino
--   Villiger Söhne       Villiger
--   Burger Söhne         Dannemann, Ritmeester
--   Selected Tobacco     Atabey, Byron, Bandolero
--   Maya Selva Cigars    Flor de Selva
--   Boutique Blends      Aging Room, Swag
--   Forged Cigar Company Cohiba USA, Punch Honduras, Bolívar Honduras,
--                        La Gloria Cubana Dominicaine
--
-- ── TROIS SONT SUISSES, ET LA SUISSE N'EST PAS PRODUCTRICE
-- Elles sont rattachées à `switzerland`, qui est un pays D'ADRESSES de
-- l'atlas. Le chemin de code est celui qu'a ouvert Le Fagot Cigar en
-- Côte d'Ivoire — page_marque() joint `lounge_countries` — et la
-- campagne l'éprouve depuis. `coherence_check` n'exige d'annonce que
-- pour les pays producteurs : les trois suisses n'en ont pas besoin.
--
-- ── ET LES TABLEAUX JSON S'ÉCRIVENT EN TOUTES LETTRES ────
-- Leçon de la migration 179 : `JSON_TABLE` puis `JSON_ARRAYAGG` gardent
-- le type sur MySQL et le perdent sur MariaDB, où l'agrégat empile des
-- chaînes — ce qui a vidé la page de la République dominicaine. Les
-- quatre tableaux `producer_countries.brands` modifiés ici sont donc
-- posés ENTIERS, comme des chaînes littérales. Aucun moteur ne peut les
-- interpréter de travers.
--
-- Sources : oettingerdavidoff.com, villigercigars.com, cigarjournal.com,
-- de.wikipedia.org (Geraldo Dannemann, Burger Söhne), en.wikipedia.org
-- (Maya Selva), halfwheel.com et cigaraficionado.com (Selected Tobacco,
-- Forged).
--
-- Après cette migration :
--   php tools/contenu_dump.php
--   php tools/i18n_dump.php > sql/traductions.sql
-- ════════════════════════════════════════════════════════

INSERT INTO `brands`
  (`name`, `country_id`, `founded`, `factory`, `history`, `gamme`,
   `history_en`, `history_es`, `history_de`, `history_zh`, `history_ar`,
   `gamme_en`, `gamme_es`, `gamme_de`, `gamme_zh`, `gamme_ar`)
VALUES

-- ── Oettinger Davidoff ───────────────────────────────────
('Oettinger Davidoff', 'switzerland', '1875 — Bâle, Suisse',
 'Groupe suisse ; production à Tabadom, Villa González (Rép. dominicaine) et à Danlí (Honduras)',

 'En 1875, Max Oettinger ouvre son premier magasin de cigares à la Eisengasse 9, à Bâle. Il y vend des cigares importés, du tabac au tonneau, des pipes et des articles pour fumeurs.

Zino Davidoff, lui, reprend en 1930 la boutique de son père à Genève et en fait une maison. En 1970, il vend son affaire à Max Oettinger : les deux noms n''en font plus qu''un.

Le groupe reste familial. Il déclare environ cinq cents millions de francs suisses de ventes et près de quatre mille personnes dans le monde. L''atlas porte cinq de ses marques sans l''avoir jamais nommé : Davidoff, Avo, The Griffin''s, Camacho et Zino Platinum — auxquelles s''ajoutent Cusano, Private Stock et Zino.',

 '[]',

 'In 1875, Max Oettinger opened his first cigar shop at Eisengasse 9 in Basel, selling imported cigars, barrel tobacco, pipes and smokers'' supplies.

Zino Davidoff, for his part, took over his father''s Geneva shop in 1930 and turned it into a house. In 1970 he sold his business to Max Oettinger: the two names became one.

The group remains family-owned. It reports around five hundred million Swiss francs in sales and close to four thousand people worldwide. This atlas holds five of its brands without ever having named it: Davidoff, Avo, The Griffin''s, Camacho and Zino Platinum — to which Cusano, Private Stock and Zino may be added.',

 'En 1875, Max Oettinger abre su primera tienda de puros en la Eisengasse 9, en Basilea, donde vende puros importados, tabaco a granel, pipas y artículos para fumadores.

Zino Davidoff, por su parte, toma en 1930 la tienda de su padre en Ginebra y la convierte en una casa. En 1970 vende su negocio a Max Oettinger: los dos nombres pasan a ser uno.

El grupo sigue siendo familiar. Declara unos quinientos millones de francos suizos de ventas y cerca de cuatro mil personas en el mundo. Este atlas recoge cinco de sus marcas sin haberlo nombrado nunca: Davidoff, Avo, The Griffin''s, Camacho y Zino Platinum, a las que se añaden Cusano, Private Stock y Zino.',

 '1875 eröffnete Max Oettinger sein erstes Zigarrengeschäft an der Eisengasse 9 in Basel und verkaufte dort importierte Zigarren, Fasstabak, Pfeifen und Raucherbedarf.

Zino Davidoff wiederum übernahm 1930 den Laden seines Vaters in Genf und machte daraus ein Haus. 1970 verkaufte er sein Geschäft an Max Oettinger: Aus zwei Namen wurde einer.

Die Gruppe bleibt in Familienbesitz. Sie weist rund fünfhundert Millionen Schweizer Franken Umsatz und knapp viertausend Beschäftigte weltweit aus. Dieser Atlas führt fünf ihrer Marken, ohne sie je genannt zu haben: Davidoff, Avo, The Griffin''s, Camacho und Zino Platinum — dazu kommen Cusano, Private Stock und Zino.',

 '1875 年，马克斯·厄廷格在巴塞尔铁匠巷 9 号开设雪茄店，售卖进口雪茄、散装烟草、烟斗与吸烟用品。

至于齐诺·大卫杜夫，他于 1930 年接手父亲在日内瓦的店铺，并将其经营成一家名庄。1970 年，他把生意卖给了马克斯·厄廷格：两个名字自此合而为一。

该集团至今仍为家族所有，公布的销售额约为五亿瑞士法郎，全球员工近四千人。本图集收录了它旗下五个品牌，却从未提及它本身：Davidoff、Avo、The Griffin''s、Camacho 与 Zino Platinum，此外还有 Cusano、Private Stock 与 Zino。',

 'في عام 1875 افتتح ماكس أوتينغر أول متجر سيجار له في شارع آيزنغاسه 9 ببازل، حيث كان يبيع السيجار المستورد والتبغ بالبرميل والغلايين ولوازم المدخّنين.

أمّا زينو دافيدوف فقد تسلّم عام 1930 متجر والده في جنيف وحوّله إلى دار. وفي 1970 باع عمله إلى ماكس أوتينغر، فصار الاسمان اسمًا واحدًا.

ولا تزال المجموعة عائلية، وتعلن نحو خمسمئة مليون فرنك سويسري من المبيعات وقرابة أربعة آلاف موظّف حول العالم. ويضمّ هذا الأطلس خمسًا من علاماتها دون أن يسمّيها قطّ: دافيدوف، وأفو، وذا غريفنز، وكاماتشو، وزينو بلاتينوم — يضاف إليها كوسانو وبرايفت ستوك وزينو.',

 '[]', '[]', '[]', '[]', '[]'),

-- ── Villiger Söhne ───────────────────────────────────────
('Villiger Söhne', 'switzerland', '1888 — Pfeffikon, Suisse',
 'Villiger Söhne AG, Pfeffikon ; ateliers en Suisse, en Allemagne et au Nicaragua',

 'En 1888, Jean Villiger, marchand de vingt-huit ans, fonde une fabrique de cigares chez lui, à Pfeffikon. Il meurt tôt, en 1902 ; c''est sa femme, Louise Villiger, qui tient la maison. En 1907, elle lance le Villiger Kiel — le premier cigare au fume-cigarette en plume d''oie.

En 1918, Hans et Max Villiger reprennent l''affaire et lui donnent son nom : Villiger Söhne. La maison est toujours familiale, à la quatrième et cinquième génération ; Heinrich Villiger, de la troisième, l''a présidée jusqu''à sa mort, à quatre-vingt-quinze ans.

Elle produit environ un milliard de cigares et cigarillos par an, emploie plus de mille deux cents personnes et déclare quelque cent quarante millions de francs suisses de ventes. L''atlas porte sa marque Villiger, rattachée au Nicaragua où elle fait rouler ses cigares premium.',

 '[]',

 'In 1888, Jean Villiger, a twenty-eight-year-old merchant, founded a cigar factory in his own home at Pfeffikon. He died early, in 1902; it was his wife, Louise Villiger, who kept the house going. In 1907 she launched the Villiger Kiel — the first cigar with a goose-quill mouthpiece.

In 1918, Hans and Max Villiger took over and gave the firm its name: Villiger Söhne. It is still family-owned, in the fourth and fifth generations; Heinrich Villiger, of the third, chaired it until his death at ninety-five.

It makes some one billion cigars and cigarillos a year, employs more than twelve hundred people and reports around one hundred and forty million Swiss francs in sales. This atlas holds its Villiger brand, attached to Nicaragua, where its premium cigars are rolled.',

 'En 1888, Jean Villiger, comerciante de veintiocho años, funda una fábrica de puros en su propia casa, en Pfeffikon. Muere joven, en 1902; es su mujer, Louise Villiger, quien sostiene la casa. En 1907 lanza el Villiger Kiel, el primer puro con boquilla de pluma de ganso.

En 1918, Hans y Max Villiger toman el relevo y le dan su nombre: Villiger Söhne. Sigue siendo familiar, en la cuarta y quinta generación; Heinrich Villiger, de la tercera, la presidió hasta su muerte, a los noventa y cinco años.

Produce unos mil millones de puros y cigarritos al año, emplea a más de mil doscientas personas y declara unos ciento cuarenta millones de francos suizos de ventas. Este atlas recoge su marca Villiger, adscrita a Nicaragua, donde se lían sus puros premium.',

 '1888 gründete Jean Villiger, ein achtundzwanzigjähriger Kaufmann, in seinem eigenen Haus in Pfeffikon eine Zigarrenfabrik. Er starb früh, 1902; seine Frau Louise Villiger führte das Haus weiter. 1907 brachte sie die Villiger Kiel heraus — die erste Zigarre mit Gänsekiel-Mundstück.

1918 übernahmen Hans und Max Villiger und gaben dem Haus seinen Namen: Villiger Söhne. Es ist bis heute in Familienhand, in vierter und fünfter Generation; Heinrich Villiger, aus der dritten, führte den Verwaltungsrat bis zu seinem Tod mit fünfundneunzig Jahren.

Das Haus stellt rund eine Milliarde Zigarren und Zigarillos im Jahr her, beschäftigt über zwölfhundert Menschen und weist etwa hundertvierzig Millionen Schweizer Franken Umsatz aus. Dieser Atlas führt die Marke Villiger, Nicaragua zugeordnet, wo ihre Premiumzigarren gerollt werden.',

 '1888 年，二十八岁的商人让·维利格在自己位于普费菲孔的家中创办了一家雪茄厂。他于 1902 年早逝，由妻子路易丝·维利格支撑起这家企业。1907 年，她推出 Villiger Kiel——第一支带鹅毛烟嘴的雪茄。

1918 年，汉斯与马克斯·维利格接手，并为公司定名 Villiger Söhne。企业至今仍由家族第四、第五代经营；第三代的海因里希·维利格担任董事长直至九十五岁辞世。

公司年产雪茄与小雪茄约十亿支，雇员一千二百余人，公布销售额约一亿四千万瑞士法郎。本图集收录其 Villiger 品牌，归于尼加拉瓜——其高级雪茄的卷制地。',

 'في عام 1888 أسّس جان فيليغر، وهو تاجر في الثامنة والعشرين، مصنعًا للسيجار في منزله بقرية بفيفيكون. ثمّ توفّي مبكرًا عام 1902، فتولّت زوجته لويز فيليغر إدارة الدار. وفي 1907 أطلقت طراز فيليغر كيل، أول سيجار بمبسم من ريشة إوزّ.

وفي 1918 تسلّم هانس وماكس فيليغر العمل وأعطياه اسمه: فيليغر زونه. ولا تزال الدار عائلية في جيلها الرابع والخامس؛ وقد ترأّسها هاينريش فيليغر، من الجيل الثالث، حتى وفاته عن خمسة وتسعين عامًا.

تُنتج الدار نحو مليار سيجار وسيجار صغير سنويًا، وتشغّل أكثر من ألف ومئتَي شخص، وتعلن نحو مئة وأربعين مليون فرنك سويسري من المبيعات. ويضمّ هذا الأطلس علامتها فيليغر، منسوبة إلى نيكاراغوا حيث تُلفّ سيجارها الفاخر.',

 '[]', '[]', '[]', '[]', '[]'),

-- ── Burger Söhne ─────────────────────────────────────────
('Burger Söhne', 'switzerland', '1864 — Suisse',
 'Groupe suisse ; usine Dannemann à Lübbecke (Allemagne)',

 'La famille Burger se lance dans le cigare et le tabac à pipe en Suisse en 1864.

En 1988, elle rachète Dannemann GmbH, à Lübbecke, en Allemagne — et devient le troisième producteur mondial de cigares. La marque Dannemann, elle, vient du Brésil : Gerhard Dannemann, né à Brême en 1851, émigre en 1872 et ouvre en 1873 une fabrique à São Félix, dans l''État de Bahia, avec six employés. Il devient l''un des grands industriels de la région ; l''entreprise fait faillite en 1954, mais le nom survit.

Le groupe possède aujourd''hui Dannemann, Ritmeester et Al Capone. L''atlas porte Dannemann, rattachée au Brésil — le terroir où elle est née.',

 '[]',

 'The Burger family entered the cigar and pipe tobacco trade in Switzerland in 1864.

In 1988 it bought Dannemann GmbH, in Lübbecke, Germany — and became the world''s third-largest cigar producer. The Dannemann name itself comes from Brazil: Gerhard Dannemann, born in Bremen in 1851, emigrated in 1872 and opened a factory at São Félix, in Bahia, in 1873 with six employees. He became one of the state''s leading industrialists; the firm went bankrupt in 1954, but the name survived.

The group today owns Dannemann, Ritmeester and Al Capone. This atlas holds Dannemann, attached to Brazil — the ground where it was born.',

 'La familia Burger entra en el negocio del puro y del tabaco de pipa en Suiza en 1864.

En 1988 compra Dannemann GmbH, en Lübbecke, Alemania, y se convierte en el tercer productor mundial de puros. El nombre Dannemann viene de Brasil: Gerhard Dannemann, nacido en Bremen en 1851, emigra en 1872 y abre en 1873 una fábrica en São Félix, en Bahía, con seis empleados. Llega a ser uno de los grandes industriales del estado; la empresa quiebra en 1954, pero el nombre sobrevive.

El grupo posee hoy Dannemann, Ritmeester y Al Capone. Este atlas recoge Dannemann, adscrita a Brasil, la tierra donde nació.',

 'Die Familie Burger stieg 1864 in der Schweiz in den Zigarren- und Pfeifentabakhandel ein.

1988 kaufte sie die Dannemann GmbH im westfälischen Lübbecke — und rückte damit weltweit auf Platz drei der Zigarrenhersteller. Der Name Dannemann selbst kommt aus Brasilien: Gerhard Dannemann, 1851 in Bremen geboren, wanderte 1872 aus und eröffnete 1873 in São Félix im Bundesstaat Bahia eine Fabrik mit sechs Beschäftigten. Er wurde einer der großen Industriellen des Bundesstaates; das Unternehmen ging 1954 in Konkurs, der Name blieb.

Heute gehören der Gruppe Dannemann, Ritmeester und Al Capone. Dieser Atlas führt Dannemann, Brasilien zugeordnet — dem Boden, auf dem sie entstand.',

 '伯格家族于 1864 年在瑞士开始经营雪茄与烟斗丝生意。

1988 年，该家族收购了位于德国吕贝克的 Dannemann GmbH，成为全球第三大雪茄生产商。而 Dannemann 这个名字本身来自巴西：1851 年生于不来梅的格哈德·丹尼曼于 1872 年移民，1873 年在巴伊亚州圣费利克斯开办工厂，起初仅六名员工。他后来成为该州重要的实业家；企业于 1954 年破产，名字却留了下来。

集团如今拥有 Dannemann、Ritmeester 与 Al Capone。本图集收录 Dannemann，归于巴西——它诞生的土地。',

 'دخلت عائلة بورغر تجارة السيجار وتبغ الغليون في سويسرا عام 1864.

وفي 1988 اشترت شركة Dannemann GmbH في لوبِكه بألمانيا، فصارت في المرتبة الثالثة بين منتجي السيجار في العالم. أمّا اسم دانيمان نفسه فيأتي من البرازيل: فقد هاجر غيرهارد دانيمان، المولود في بريمن عام 1851، سنة 1872، وافتتح عام 1873 مصنعًا في ساو فيليكس بولاية باهيا بستة عمّال. وصار من كبار صناعيّي الولاية؛ ثم أفلست الشركة عام 1954، وبقي الاسم.

وتملك المجموعة اليوم دانيمان وريتمايستر وآل كابوني. ويضمّ هذا الأطلس دانيمان، منسوبة إلى البرازيل، أرض مولدها.',

 '[]', '[]', '[]', '[]', '[]');

-- ══ LES QUATRE AUTRES ═══════════════════════════════════

INSERT INTO `brands`
  (`name`, `country_id`, `founded`, `factory`, `history`, `gamme`,
   `history_en`, `history_es`, `history_de`, `history_zh`, `history_ar`,
   `gamme_en`, `gamme_es`, `gamme_de`, `gamme_zh`, `gamme_ar`)
VALUES

-- ── Selected Tobacco ─────────────────────────────────────
('Selected Tobacco', 'costarica', '2012 — Costa Rica',
 'Tabacos de Costa Rica, Santiago de Puriscal',

 'Nelson Alfonso lance Selected Tobacco depuis le Costa Rica en 2012, et présente d''emblée Atabey et Bandolero. Byron suit.

Les cigares se roulent chez Tabacos de Costa Rica, à Santiago de Puriscal. L''atlas portait déjà les trois marques — Atabey, Byron et Bandolero — sans nommer la maison qui les tient ni l''homme qui les assemble. La maison a depuis ajouté une ligne à son propre nom, Alfonso.',

 '[]',

 'Nelson Alfonso launched Selected Tobacco out of Costa Rica in 2012, unveiling Atabey and Bandolero from the start. Byron followed.

The cigars are rolled at Tabacos de Costa Rica, in Santiago de Puriscal. This atlas already held all three brands — Atabey, Byron and Bandolero — without naming the house that owns them or the man who blends them. The house has since added a line under his own name, Alfonso.',

 'Nelson Alfonso lanza Selected Tobacco desde Costa Rica en 2012, y presenta de entrada Atabey y Bandolero. Byron llega después.

Los puros se lían en Tabacos de Costa Rica, en Santiago de Puriscal. Este atlas ya recogía las tres marcas —Atabey, Byron y Bandolero— sin nombrar la casa que las posee ni al hombre que las liga. La casa ha añadido después una línea con su propio nombre, Alfonso.',

 'Nelson Alfonso gründete Selected Tobacco 2012 von Costa Rica aus und stellte gleich Atabey und Bandolero vor. Byron folgte.

Die Zigarren werden bei Tabacos de Costa Rica in Santiago de Puriscal gerollt. Dieser Atlas führte alle drei Marken — Atabey, Byron und Bandolero — bereits, ohne das Haus zu nennen, dem sie gehören, oder den Mann, der sie mischt. Inzwischen kam eine Linie unter seinem eigenen Namen hinzu, Alfonso.',

 '2012 年，纳尔逊·阿方索在哥斯达黎加创办 Selected Tobacco，一开始便推出 Atabey 与 Bandolero，Byron 随后问世。

雪茄在圣地亚哥-德普里斯卡尔的 Tabacos de Costa Rica 卷制。本图集此前已收录这三个品牌，却未提及拥有它们的公司，也未提及为它们调配配方的人。此后该公司又推出了以其本人名字命名的 Alfonso 系列。',

 'أطلق نيلسون ألفونسو شركة Selected Tobacco من كوستاريكا عام 2012، وقدّم منذ البداية أتابي وبانْدوليرو، ثم تبعهما بايرون.

ويُلفّ السيجار لدى Tabacos de Costa Rica في سانتياغو دي بوريسكال. وكان هذا الأطلس يضمّ العلامات الثلاث — أتابي وبايرون وبانْدوليرو — دون أن يسمّي الدار التي تملكها ولا الرجل الذي يخلطها. وقد أضافت الدار لاحقًا خطًّا باسمه، ألفونسو.',

 '[]', '[]', '[]', '[]', '[]'),

-- ── Maya Selva Cigars ────────────────────────────────────
('Maya Selva Cigars', 'honduras', '1995 — Honduras',
 'Honduras ; assemblages menés avec Nestor Plasencia',

 'Maya Selva a grandi au Honduras, d''une mère française et d''un père hondurien. Elle part étudier en France à seize ans, devient ingénieure, passe un master aux États-Unis.

En 1993, elle rencontre Nestor Plasencia — planteur et fabricant — et lui dit son idée : porter un cigare hondurien de qualité sur le marché français. Il devient son mentor. Elle fonde sa maison en 1995 et crée Flor de Selva, lancée en France avant de s''exporter.

L''atlas portait Flor de Selva sans nommer celle qui l''a faite, dans une industrie où les maisons fondées par des femmes se comptent.',

 '[]',

 'Maya Selva grew up in Honduras, daughter of a French mother and a Honduran father. She left to study in France at sixteen, became an engineer and took a master''s degree in the United States.

In 1993 she met Nestor Plasencia — grower and manufacturer — and told him her idea: to bring a fine Honduran cigar to the French market. He became her mentor. She founded her house in 1995 and created Flor de Selva, launched in France before it travelled.

This atlas held Flor de Selva without naming the woman who made it, in an industry where houses founded by women can be counted.',

 'Maya Selva creció en Honduras, hija de madre francesa y padre hondureño. Se marchó a estudiar a Francia a los dieciséis años, se hizo ingeniera y cursó un máster en Estados Unidos.

En 1993 conoció a Nestor Plasencia —cultivador y fabricante— y le contó su idea: llevar un puro hondureño de calidad al mercado francés. Él fue su mentor. Fundó su casa en 1995 y creó Flor de Selva, lanzada en Francia antes de salir al mundo.

Este atlas recogía Flor de Selva sin nombrar a quien la hizo, en una industria donde las casas fundadas por mujeres se cuentan.',

 'Maya Selva wuchs in Honduras auf, Tochter einer französischen Mutter und eines honduranischen Vaters. Mit sechzehn ging sie zum Studium nach Frankreich, wurde Ingenieurin und erwarb einen Master in den Vereinigten Staaten.

1993 traf sie Nestor Plasencia — Pflanzer und Hersteller — und erzählte ihm ihre Idee: eine gute honduranische Zigarre auf den französischen Markt zu bringen. Er wurde ihr Mentor. 1995 gründete sie ihr Haus und schuf Flor de Selva, zuerst in Frankreich eingeführt.

Dieser Atlas führte Flor de Selva, ohne die zu nennen, die sie gemacht hat — in einer Branche, in der von Frauen gegründete Häuser zählbar sind.',

 '玛雅·塞尔瓦在洪都拉斯长大，母亲是法国人，父亲是洪都拉斯人。她十六岁赴法求学，成为工程师，并在美国取得硕士学位。

1993 年，她结识了种植者兼制造商内斯托·普拉森西亚，向他说出自己的构想：把一支优质的洪都拉斯雪茄带到法国市场。他成了她的导师。1995 年她创办自己的品牌，并推出 Flor de Selva，先在法国上市，而后走向世界。

本图集此前收录 Flor de Selva，却未提及创造它的人——而在这个行业里，由女性创办的品牌屈指可数。',

 'نشأت مايا سيلفا في هندوراس لأمّ فرنسية وأب هندوراسي. غادرت للدراسة في فرنسا في السادسة عشرة، وصارت مهندسة، ونالت الماجستير في الولايات المتحدة.

وفي 1993 التقت نستور بلاسينسيا — المزارع والصانع — وأخبرته بفكرتها: أن تحمل سيجارًا هندوراسيًّا جيّدًا إلى السوق الفرنسية. فصار معلّمها. وأسّست دارها عام 1995 وأنشأت فلور دي سيلفا، التي أُطلقت في فرنسا قبل أن تنتشر.

وكان هذا الأطلس يضمّ فلور دي سيلفا دون أن يسمّي من صنعتها، في صناعة تُعدّ فيها الدور التي أسّستها نساء على الأصابع.',

 '[]', '[]', '[]', '[]', '[]'),

-- ── Boutique Blends ──────────────────────────────────────
('Boutique Blends', 'dominican', '2011 — Rép. dominicaine',
 'Tabacalera La Palma, Tamboril (José « Jochy » Blanco)',

 'Rafael Nodal crée Aging Room en 2011. Les cigares sont faits par José « Jochy » Blanco, à la Tabacalera La Palma de Tamboril, en République dominicaine. La maison porte aussi Swag.

Le nom de Nodal figure déjà ailleurs dans cet atlas : c''est lui qui a revu la composition du Trinidad Santiago pour Altadis — assemblé, lui aussi, par Jochy Blanco.',

 '[]',

 'Rafael Nodal created Aging Room in 2011. The cigars are made by José “Jochy” Blanco, at the Tabacalera La Palma in Tamboril, Dominican Republic. The house also carries Swag.

Nodal''s name appears elsewhere in this atlas already: he is the man who reworked the Trinidad Santiago blend for Altadis — also built by Jochy Blanco.',

 'Rafael Nodal crea Aging Room en 2011. Los puros los hace José «Jochy» Blanco, en la Tabacalera La Palma de Tamboril, en la República Dominicana. La casa lleva también Swag.

El nombre de Nodal ya figura en otro punto de este atlas: es quien revisó la liga del Trinidad Santiago para Altadis, montada también por Jochy Blanco.',

 'Rafael Nodal schuf 2011 Aging Room. Die Zigarren werden von José „Jochy" Blanco in der Tabacalera La Palma in Tamboril, Dominikanische Republik, gefertigt. Zum Haus gehört auch Swag.

Nodals Name steht schon an anderer Stelle in diesem Atlas: Er hat die Mischung des Trinidad Santiago für Altadis überarbeitet — ebenfalls von Jochy Blanco gebaut.',

 '拉斐尔·诺达尔于 2011 年创立 Aging Room。雪茄由何塞·「霍奇」·布兰科在多米尼加共和国坦博里尔的 Tabacalera La Palma 工厂制作。该公司旗下还有 Swag。

诺达尔的名字在本图集别处已经出现过：正是他为 Altadis 重新调整了 Trinidad Santiago 的配方——而那款雪茄同样出自霍奇·布兰科之手。',

 'أنشأ رفائيل نودال علامة إيجينغ روم عام 2011. ويصنع السيجار خوسيه «خوتشي» بلانكو في مصنع تاباكاليرا لا بالما بتامبوريل في جمهورية الدومينيكان. وتضمّ الدار أيضًا علامة سواغ.

واسم نودال وارد في موضع آخر من هذا الأطلس: فهو من أعاد ضبط خلطة ترينيداد سانتياغو لصالح Altadis — وهي أيضًا من صنع خوتشي بلانكو.',

 '[]', '[]', '[]', '[]', '[]'),

-- ── Forged Cigar Company ─────────────────────────────────
('Forged Cigar Company', 'usa', '2021 — États-Unis (Scandinavian Tobacco Group)',
 'Société de distribution ; les cigares sortent des usines du groupe',

 'Ce n''est pas une manufacture, et la fiche le dit d''emblée : Forged est une société de DISTRIBUTION, créée le 13 janvier 2021 par Scandinavian Tobacco Group, avec ses propres commerciaux. Elle est entrée en activité le 1er février.

Elle a reçu à sa naissance Partagás, La Gloria Cubana, Bolívar Cofradia, Diesel et Chillin'' Moose, pendant que General Cigar gardait Macanudo, CAO, Cohiba, Punch et Hoyo de Monterrey.

En février 2026, le groupe a rebattu les cartes : Cohiba, Punch et Havana Honeys sont passés chez Forged, Partagás et Room101 chez General. Le même mouvement a retiré du tarif Sancho Panza et Los Statos Deluxe — ce qui est la raison pour laquelle l''atlas ne porte pas de Sancho Panza non cubain.',

 '[]',

 'This is not a factory, and the entry says so at once: Forged is a DISTRIBUTION company, set up on 13 January 2021 by Scandinavian Tobacco Group with its own sales force. It began trading on 1 February.

At birth it received Partagás, La Gloria Cubana, Bolívar Cofradia, Diesel and Chillin'' Moose, while General Cigar kept Macanudo, CAO, Cohiba, Punch and Hoyo de Monterrey.

In February 2026 the group reshuffled: Cohiba, Punch and Havana Honeys moved to Forged, Partagás and Room101 to General. The same move struck Sancho Panza and Los Statos Deluxe off the price list — which is why this atlas holds no non-Cuban Sancho Panza.',

 'No es una manufactura, y la ficha lo dice de entrada: Forged es una sociedad de DISTRIBUCIÓN, creada el 13 de enero de 2021 por Scandinavian Tobacco Group, con sus propios comerciales. Empezó a operar el 1 de febrero.

Al nacer recibió Partagás, La Gloria Cubana, Bolívar Cofradia, Diesel y Chillin'' Moose, mientras General Cigar conservaba Macanudo, CAO, Cohiba, Punch y Hoyo de Monterrey.

En febrero de 2026 el grupo barajó de nuevo: Cohiba, Punch y Havana Honeys pasaron a Forged; Partagás y Room101 a General. El mismo movimiento retiró del tarifario Sancho Panza y Los Statos Deluxe, razón por la cual este atlas no recoge un Sancho Panza no cubano.',

 'Dies ist keine Manufaktur, und der Eintrag sagt es sofort: Forged ist eine VERTRIEBSGESELLSCHAFT, am 13. Januar 2021 von Scandinavian Tobacco Group mit eigenem Außendienst gegründet. Der Betrieb begann am 1. Februar.

Bei ihrer Gründung erhielt sie Partagás, La Gloria Cubana, Bolívar Cofradia, Diesel und Chillin'' Moose, während General Cigar Macanudo, CAO, Cohiba, Punch und Hoyo de Monterrey behielt.

Im Februar 2026 mischte die Gruppe neu: Cohiba, Punch und Havana Honeys gingen zu Forged, Partagás und Room101 zu General. Derselbe Schritt nahm Sancho Panza und Los Statos Deluxe von der Preisliste — weshalb dieser Atlas keinen nicht-kubanischen Sancho Panza führt.',

 '这不是一家制造厂，本条目开门见山：Forged 是一家**分销**公司，由 Scandinavian Tobacco Group 于 2021 年 1 月 13 日设立，拥有自己的销售团队，2 月 1 日开始运营。

成立之初，它获得了 Partagás、La Gloria Cubana、Bolívar Cofradia、Diesel 与 Chillin'' Moose，而 General Cigar 保留 Macanudo、CAO、Cohiba、Punch 与 Hoyo de Monterrey。

2026 年 2 月，集团重新洗牌：Cohiba、Punch 与 Havana Honeys 转入 Forged，Partagás 与 Room101 转入 General。同一次调整将 Sancho Panza 与 Los Statos Deluxe 撤出价目表——这正是本图集不收录非古巴版 Sancho Panza 的原因。',

 'ليست هذه مصنعًا، وتقول البطاقة ذلك منذ البداية: فُورجد شركة **توزيع**، أنشأتها Scandinavian Tobacco Group في 13 يناير 2021 بفريق مبيعات خاص بها، وبدأت العمل في الأول من فبراير.

وتسلّمت عند نشأتها بارتاغاس، ولا غلوريا كوبانا، وبوليفار كوفراديا، وديزل، وتشيلين موس، بينما احتفظت General Cigar بماكانودو، وCAO، وكوهيبا، وبانش، وأويو دي مونتيري.

وفي فبراير 2026 أعادت المجموعة توزيع الأوراق: انتقلت كوهيبا وبانش وهافانا هانيز إلى فُورجد، وبارتاغاس وروم101 إلى جنرال. والحركة نفسها شطبت سانتشو بانثا ولوس ستاتوس ديلوكس من قائمة الأسعار — ولهذا لا يضمّ هذا الأطلس سانتشو بانثا غير كوبي.',

 '[]', '[]', '[]', '[]', '[]');

-- ══ LES SCEAUX, CALCULÉS DEPUIS LES COLONNES ════════════
INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'brands', b.`name`, c.champ, l.lang,
       SHA1(CASE c.champ WHEN 'history' THEN b.`history` ELSE b.`gamme` END),
       'machine', NOW()
  FROM `brands` b
  JOIN (SELECT 'history' champ UNION ALL SELECT 'gamme') c
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE b.`name` IN ('Oettinger Davidoff','Villiger Söhne','Burger Söhne',
                    'Selected Tobacco','Maya Selva Cigars','Boutique Blends',
                    'Forged Cigar Company')
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 180','systeme','maisons_meres_ajoutees','marque',0,
   'l atlas portait une douzaine de marques sans jamais nommer qui les fait. Davidoff, Avo, The Griffin s, Camacho et Zino Platinum sont d un meme groupe suisse ; Atabey, Byron et Bandolero d un meme homme ; Flor de Selva d une maison hondurienne fondee par une femme. Sept maisons meres ajoutees — meme defaut que les huit colonnes muettes, mais a l echelle d une entreprise'),
  (NULL,'migration 180','systeme','pays_d_adresses','marque',0,
   'TROIS SONT SUISSES et la Suisse n est pas productrice : elles sont rattachees a `switzerland`, pays d ADRESSES de l atlas. Le chemin de code est celui qu a ouvert Le Fagot Cigar en Cote d Ivoire — page_marque() joint lounge_countries — et la campagne l eprouve depuis. coherence_check n exige d annonce que pour les pays producteurs'),
  (NULL,'migration 180','systeme','json_en_toutes_lettres','systeme',0,
   'LECON DE LA 179 APPLIQUEE : les quatre tableaux producer_countries.brands modifies ici sont poses ENTIERS, comme des chaines litterales, et non construits par des fonctions JSON_*. JSON_TABLE puis JSON_ARRAYAGG gardent le type sur MySQL et le perdent sur MariaDB, ou l agregat empile des chaines — ce qui avait vide la page de la Republique dominicaine'),
  (NULL,'migration 180','systeme','distributeur_et_non_manufacture','marque',0,
   'FORGED N EST PAS UNE MANUFACTURE et sa fiche le dit d emblee : societe de DISTRIBUTION creee le 13 janvier 2021 par Scandinavian Tobacco Group. Elle explique aussi pourquoi l atlas ne porte pas de Sancho Panza non cubain — le rebattage de fevrier 2026 l a retire du tarif avec Los Statos Deluxe'),
  (NULL,'migration 180','systeme','renvois_internes','marque',0,
   'quatre fiches renvoient a ce que l atlas porte deja : Oettinger Davidoff a cinq de ses marques, Selected Tobacco a ses trois, Maya Selva a Flor de Selva, Burger Sohne a Dannemann. Et Boutique Blends renvoie a Trinidad USA : Rafael Nodal a revu la composition du Trinidad Santiago, assemble par le meme Jochy Blanco');

-- ══ LES QUATRE FICHES DE PAYS, EN TOUTES LETTRES ═══════
-- Regle de la migration 179 : aucun JSON_*, le tableau entier en
-- litteral. MariaDB et MySQL le lisent pareil.

-- ── costarica ──
UPDATE `producer_countries`
   SET `brands` = '[{"desc":"Du dessinateur du Behike à sa propre maison","name":"Atabey","iconic":true},{"desc":"Le versant classique de Selected Tobacco","name":"Byron","iconic":false},{"desc":"Des tabacs mûris cinq ans avant roulage","name":"Bandolero","iconic":false},{"desc":"Maison britannique sans champs, roulée au Costa Rica","name":"Casdagli","iconic":false},{"name":"Selected Tobacco","desc":"Nelson Alfonso — la maison derrière Atabey, Byron et Bandolero","iconic":false}]',
       `updated_at` = NOW()
 WHERE `id` = 'costarica';

-- ── dominican ──
UPDATE `producer_countries`
   SET `brands` = '[{"desc":"Opus X — les plus convoités au monde","name":"Arturo Fuente","iconic":true},{"desc":"Luxe suisse, manufacture dominicaine","name":"Davidoff","iconic":true},{"desc":"Artisanat d''exception depuis 1996","name":"La Flor Dominicana","iconic":true},{"desc":"Standard mondial du Connecticut","name":"Macanudo","iconic":false},{"desc":"ESG et VSG, intemporels","name":"Ashton","iconic":false},{"desc":"Créée par le pianiste Avo Uvezian","name":"Avo","iconic":false},{"desc":"La douceur comme valeur absolue, depuis 1993","name":"Santa Damiana","iconic":false},{"desc":"1903, la plus ancienne manufacture dominicaine","name":"La Aurora","iconic":true},{"desc":"Repartir de zéro après une carrière entière","name":"E.P. Carrillo","iconic":true},{"desc":"1974, avant la vague — et toujours familiale","name":"Quesada","iconic":false},{"desc":"Tamboril, où la même main roule plusieurs bagues","name":"PDR Cigars","iconic":false},{"desc":"L''autre Montecristo, celui d''après 1960","name":"Montecristo Dominicain","iconic":true},{"desc":"Même bague que le havane, autre cigare","name":"Romeo y Julieta Dominicain","iconic":false},{"desc":"Le cigare que des dizaines de milliers de gens fument vraiment","name":"VegaFina","iconic":true},{"desc":"Un bon cigare selon le marché d''avant la mode de la puissance","name":"Don Diego","iconic":false},{"desc":"Né d''une boîte de nuit genevoise, et cela s''entend","name":"The Griffin''s","iconic":false},{"desc":"Un industriel redevenu artisan","name":"Matilde","iconic":false},{"desc":"La bague au pied du cigare — personne d''autre n''a osé","name":"Juan Clemente","iconic":false},{"desc":"Cape venue du Cameroun, cigares roulés ici","name":"Meerapfel","iconic":false},{"desc":"Née chez El Credito, à Miami, en 1972","name":"La Gloria Cubana Dominicaine","iconic":false},{"desc":"Tabacalera de García, La Romana","name":"H. Upmann Dominicain","iconic":false},{"desc":"Ne subsiste que hors de Cuba","name":"Henry Clay","iconic":false},{"desc":"Collection non cubaine annoncée en 2016","name":"Por Larrañaga Dominicain","iconic":false},{"name":"Boutique Blends","desc":"Rafael Nodal — Aging Room et Swag, chez Jochy Blanco","iconic":false}]',
       `updated_at` = NOW()
 WHERE `id` = 'dominican';

-- ── honduras ──
UPDATE `producer_countries`
   SET `brands` = '[{"desc":"Prensado — Cigare de l''Année 2011","name":"Alec Bradley","iconic":true},{"desc":"Honduras Cameroon, blend iconique","name":"CAO","iconic":true},{"desc":"Corojo authentique de Jamastran","name":"Camacho","iconic":false},{"desc":"Le Punch d''après 1960, sans rapport avec le havane","name":"Punch Honduras","iconic":false},{"desc":"Suisse, dominicaine et hondurienne à la fois","name":"Excalibur","iconic":false},{"desc":"Le prénom de Zino Davidoff, en marque à part","name":"Zino Platinum","iconic":false},{"desc":"1995, fondée depuis Paris pour un palais européen","name":"Flor de Selva","iconic":true},{"desc":"Une ville bâtie autour de sa manufacture","name":"La Flor de Copán","iconic":false},{"desc":"Du corojo d''avant les hybrides, cultivé par la famille","name":"Aladino","iconic":false},{"desc":"La tête sucrée qui a fait commencer des générations","name":"Baccarat","iconic":false},{"desc":"Le contre-pied du havane : ici, c''est le corsé","name":"Hoyo de Monterrey Honduras","iconic":false},{"desc":"Une des dernières traces vivantes de ce que Tampa a été","name":"Bering","iconic":false},{"desc":"Assemblage Cofradia d''Estélo Padrón, chez HATSA","name":"Bolívar Honduras","iconic":false},{"desc":"Villazon, aux mêmes ateliers que Punch et Hoyo","name":"El Rey del Mundo Honduras","iconic":false},{"desc":"Altadis USA ; la ligne Tabacales est dominicaine","name":"Saint Luis Rey Honduras","iconic":false},{"desc":"Abandonnée par Habanos en 2005, relancée au Honduras","name":"Gispert","iconic":false},{"name":"Maya Selva Cigars","desc":"Fondée en 1995 par Maya Selva — Flor de Selva","iconic":false}]',
       `updated_at` = NOW()
 WHERE `id` = 'honduras';

-- ── usa ──
UPDATE `producer_countries`
   SET `brands` = '[{"desc":"Macanudo, Punch, Partagás HN","name":"General Cigar","iconic":true},{"desc":"100% US tobacco","name":"CAO America","iconic":false},{"desc":"L''homonyme américaine, née de l''embargo","name":"Cohiba USA","iconic":false},{"desc":"La version américaine, chez General Cigar","name":"Partagás USA","iconic":false},{"desc":"L''américaine d''Altadis, depuis 1969","name":"Romeo y Julieta USA","iconic":false},{"desc":"1895, le plus ancien fabricant familial américain","name":"J.C. Newman","iconic":true},{"desc":"Ce qui reste des ateliers cubains de Miami","name":"El Titan de Bronze","iconic":true},{"desc":"1930, une adresse de la Cinquième Avenue devenue marque","name":"Nat Sherman","iconic":true},{"desc":"La maison d''origine a récupéré son nom en 2001, puis l''a vendu à Altadis","name":"Trinidad USA","iconic":false},{"name":"Forged Cigar Company","desc":"Société de distribution de Scandinavian Tobacco Group","iconic":false}]',
       `updated_at` = NOW()
 WHERE `id` = 'usa';
