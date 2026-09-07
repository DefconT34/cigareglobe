-- ════════════════════════════════════════════════════════
-- 173 — Les neuf jumelles non cubaines
-- ────────────────────────────────────────────────────────
-- L'ATLAS DOCUMENTAIT SEPT FOIS UN MOTIF ET EN LAISSAIT DIX OUVERTS.
-- Depuis l'embargo, une quinzaine de noms cubains existent en DEUX
-- marques distinctes. L'atlas portait déjà Cohiba USA, Partagás USA,
-- Romeo y Julieta USA et Dominicain, Trinidad USA, Montecristo
-- Dominicain, Hoyo de Monterrey Honduras et Punch Honduras — et n'avait
-- que la version cubaine des autres.
--
-- ⚠ LE PIÈGE QUI LES AVAIT CACHÉES : un recoupement par le nom les
-- déclare « déjà présentes », puisque le nom cubain est en base. Ce sont
-- des faux positifs DE FOND. C'est ce qui avait laissé passer Trinidad
-- USA jusqu'à ce qu'un lecteur le remarque.
--
-- ── NEUF, ET NON DIX ─────────────────────────────────────
-- SANCHO PANZA NON CUBAIN N'EST PAS CRÉÉ. En janvier 2026, Scandinavian
-- Tobacco Group a annoncé le RETRAIT DE SON TARIF des marques Sancho
-- Panza et Los Statos Deluxe. Ouvrir une fiche de maison vivante pour
-- une marque qu'on cesse de vendre serait affirmer le contraire de ce
-- qu'on sait. Le fait est consigné au journal ; la fiche attendra qu'on
-- sache ce que le nom devient.
--
-- ── DEUX QUI NE SONT PAS DES JUMELLES, ET ON LE DIT ──────
-- GISPERT : ici c'est CUBA qui a lâché le nom. Habanos a arrêté la
-- production en 2005 ; Altadis l'avait relancée dès 2003 au Honduras.
-- Il n'y a donc plus de Gispert cubain, et l'atlas n'en portait pas.
-- HENRY CLAY : même cas, la marque ne subsiste que hors de Cuba.
-- Toutes deux entrent sans suffixe de pays, puisqu'il n'y a personne en
-- face.
--
-- ── LES SEPT AUTRES PRENNENT LE SUFFIXE DE L'ATLAS ───────
-- « Hoyo de Monterrey Honduras », « Montecristo Dominicain » : la
-- convention existe, on la suit.
--
-- ── CE QUE LES SOURCES DONNENT, ET CE QU'ELLES NE DONNENT PAS
-- `gamme` n'est rempli que pour les TROIS maisons dont une source
-- décrit l'assemblage : Bolívar Honduras, Gispert, Saint Luis Rey
-- Honduras. Les six autres ont une gamme VIDE — le rendu l'omet sans
-- laisser de bloc, ce que la campagne éprouve depuis la fiche du Fagot.
-- Inventer six gammes pour faire symétrique serait exactement la faute
-- que le chantier des sources a passé quatre blocs à défaire.
--
-- Sources : cigaraficionado.com (El Credito, Villazon, Tabacalera de
-- García), en.wikipedia.org (Gispert, El Rey del Mundo, Por Larrañaga),
-- halfwheel.com (Saint Luis Rey Tabacales), cigarjournal.com et
-- cigar-coop.com (répartition General Cigar / Forged).
--
-- Après cette migration :
--   php tools/contenu_dump.php
--   php tools/i18n_dump.php > sql/traductions.sql
-- ════════════════════════════════════════════════════════

-- ══ HONDURAS ════════════════════════════════════════════

INSERT INTO `brands`
  (`name`, `country_id`, `founded`, `factory`, `history`, `gamme`,
   `history_en`, `history_es`, `history_de`, `history_zh`, `history_ar`,
   `gamme_en`, `gamme_es`, `gamme_de`, `gamme_zh`, `gamme_ar`)
VALUES

-- ── Bolívar Honduras ─────────────────────────────────────
('Bolívar Honduras', 'honduras', '1997 — Honduras (General Cigar)',
 'HATSA — Honduras American Tobacco, Danlí',

 'Le nom vient de Cuba, où la marque naît au début du XXᵉ siècle. La version non cubaine, elle, est hondurienne : elle se roule chez HATSA — Honduras American Tobacco —, à Danlí, l''une des deux usines que la famille Villazon exploitait dans le pays. General Cigar a racheté Villazon en 1997 pour 81,4 millions de dollars.

L''assemblage Cofradia porte le nom de l''autre usine Villazon. Il est l''œuvre d''Estélo Padrón, directeur de production des manufactures HATSA : cape équatorienne de semence Sumatra, sous-cape Connecticut Broadleaf des États-Unis, tripe hondurienne et nicaraguayenne.',

 '[{"name":"Cofradia","color":"#6B3A1F","wrapper":"Équateur, semence Sumatra","story":"Assemblage d''Estélo Padrón, directeur de production des usines HATSA. Sous-cape Connecticut Broadleaf des États-Unis, tripe hondurienne et nicaraguayenne."}]',

 'The name comes from Cuba, where the brand was born in the early twentieth century. The non-Cuban version is Honduran: it is rolled at HATSA — Honduras American Tobacco — in Danlí, one of the two factories the Villazon family ran in the country. General Cigar bought Villazon in 1997 for 81.4 million dollars.

The Cofradia blend takes its name from the other Villazon factory. It is the work of Estélo Padrón, production manager of the HATSA plants: an Ecuadorian Sumatra-seed wrapper, a US Connecticut Broadleaf binder, Honduran and Nicaraguan filler.',

 'El nombre viene de Cuba, donde la marca nace a principios del siglo XX. La versión no cubana es hondureña: se lía en HATSA —Honduras American Tobacco—, en Danlí, una de las dos fábricas que la familia Villazon explotaba en el país. General Cigar compró Villazon en 1997 por 81,4 millones de dólares.

La liga Cofradia lleva el nombre de la otra fábrica Villazon. Es obra de Estélo Padrón, director de producción de las manufacturas HATSA: capa ecuatoriana de semilla Sumatra, capote Connecticut Broadleaf de Estados Unidos, tripa hondureña y nicaragüense.',

 'Der Name stammt aus Kuba, wo die Marke zu Beginn des 20. Jahrhunderts entsteht. Die nicht-kubanische Fassung ist honduranisch: Sie wird bei HATSA — Honduras American Tobacco — in Danlí gerollt, einer der beiden Fabriken, die die Familie Villazon im Land betrieb. General Cigar kaufte Villazon 1997 für 81,4 Millionen Dollar.

Die Cofradia-Mischung trägt den Namen der anderen Villazon-Fabrik. Sie stammt von Estélo Padrón, Produktionsleiter der HATSA-Werke: ecuadorianisches Deckblatt aus Sumatra-Saat, US-amerikanisches Connecticut-Broadleaf-Umblatt, honduranische und nicaraguanische Einlage.',

 '这个名字来自古巴，品牌于二十世纪初诞生于此。非古巴版本则是洪都拉斯的：它在丹利的 HATSA（洪都拉斯美洲烟草）卷制，那是维拉松家族在该国经营的两家工厂之一。General Cigar 于 1997 年以 8140 万美元收购了维拉松。

Cofradia 配方取自维拉松的另一家工厂之名，出自 HATSA 各厂生产总监埃斯特洛·帕德龙之手：厄瓜多尔苏门答腊种茄衣，美国康涅狄格宽叶茄套，洪都拉斯与尼加拉瓜茄芯。',

 'يأتي الاسم من كوبا حيث وُلدت العلامة في مطلع القرن العشرين. أمّا النسخة غير الكوبية فهندوراسية: تُلفّ في مصنع HATSA — هندوراس أميركان توباكو — بمدينة دانلي، وهو أحد مصنعَين كانت تديرهما عائلة فيّازون في البلد. وقد اشترت General Cigar شركة فيّازون عام 1997 بمبلغ 81.4 مليون دولار.

وتحمل خلطة كوفراديا اسم مصنع فيّازون الآخر، وهي من عمل إستيلو بادرون، مدير الإنتاج في مصانع HATSA: غلاف إكوادوري من بذرة سومطرة، وغلاف داخلي من كونيتيكت برودليف الأمريكي، وحشوة هندوراسية ونيكاراغوية.',

 '[{"name":"Cofradia","color":"#6B3A1F","wrapper":"Ecuador, Sumatra seed","story":"Blended by Estélo Padrón, production manager of the HATSA plants. US Connecticut Broadleaf binder, Honduran and Nicaraguan filler."}]',
 '[{"name":"Cofradia","color":"#6B3A1F","wrapper":"Ecuador, semilla Sumatra","story":"Ligada por Estélo Padrón, director de producción de las manufacturas HATSA. Capote Connecticut Broadleaf de Estados Unidos, tripa hondureña y nicaragüense."}]',
 '[{"name":"Cofradia","color":"#6B3A1F","wrapper":"Ecuador, Sumatra-Saat","story":"Gemischt von Estélo Padrón, Produktionsleiter der HATSA-Werke. US-amerikanisches Connecticut-Broadleaf-Umblatt, honduranische und nicaraguanische Einlage."}]',
 '[{"name":"Cofradia","color":"#6B3A1F","wrapper":"厄瓜多尔苏门答腊种","story":"由 HATSA 各厂生产总监埃斯特洛·帕德龙调配。美国康涅狄格宽叶茄套，洪都拉斯与尼加拉瓜茄芯。"}]',
 '[{"name":"Cofradia","color":"#6B3A1F","wrapper":"إكوادور، بذرة سومطرة","story":"خلطها إستيلو بادرون، مدير الإنتاج في مصانع HATSA. غلاف داخلي من كونيتيكت برودليف الأمريكي، وحشوة هندوراسية ونيكاراغوية."}]'),

-- ── El Rey del Mundo Honduras ────────────────────────────
('El Rey del Mundo Honduras', 'honduras', '1997 — Honduras (General Cigar)',
 'HATSA — Honduras American Tobacco, Cofradía et Danlí',

 'La marque cubaine date de 1848. Son homonyme hondurienne est l''œuvre de la famille Villazon, qui la fait rouler chez Honduras American Tobacco — la HATSA que Frank Llaneza fonde en 1963, et dont l''usine de Cofradía fut la première du pays tournée vers l''exportation.

General Cigar rachète Villazon en 1997. La maison partage donc ses ateliers et ses rouleurs avec les Punch et Hoyo de Monterrey honduriens, dont l''atlas porte déjà les fiches : Villazon avait obtenu les droits américains de ces deux-là en 1965, et Llaneza en avait porté la production chez HATSA en 1969.',

 '[]',

 'The Cuban brand dates from 1848. Its Honduran namesake is the work of the Villazon family, who had it rolled at Honduras American Tobacco — the HATSA that Frank Llaneza founded in 1963, and whose Cofradía factory was the country''s first export-oriented cigar plant.

General Cigar bought Villazon in 1997. The house therefore shares its benches and its rollers with the Honduran Punch and Hoyo de Monterrey, both already in this atlas: Villazon had obtained the American rights to those two in 1965, and Llaneza had moved their production to HATSA in 1969.',

 'La marca cubana data de 1848. Su homónima hondureña es obra de la familia Villazon, que la hizo liar en Honduras American Tobacco: la HATSA que Frank Llaneza funda en 1963, y cuya fábrica de Cofradía fue la primera del país orientada a la exportación.

General Cigar compra Villazon en 1997. La casa comparte pues sus talleres y sus liadores con los Punch y Hoyo de Monterrey hondureños, ya presentes en este atlas: Villazon había obtenido los derechos estadounidenses de esos dos en 1965, y Llaneza había llevado su producción a HATSA en 1969.',

 'Die kubanische Marke stammt von 1848. Ihre honduranische Namensvetterin geht auf die Familie Villazon zurück, die sie bei Honduras American Tobacco rollen ließ — jener HATSA, die Frank Llaneza 1963 gründete und deren Werk in Cofradía die erste exportorientierte Zigarrenfabrik des Landes war.

General Cigar kaufte Villazon 1997. Das Haus teilt daher Werkbänke und Roller mit dem honduranischen Punch und Hoyo de Monterrey, die dieser Atlas bereits führt: Villazon hatte 1965 die amerikanischen Rechte an beiden erhalten, und Llaneza hatte ihre Produktion 1969 zu HATSA verlegt.',

 '古巴品牌可追溯至 1848 年。其洪都拉斯同名品牌出自维拉松家族之手，交由洪都拉斯美洲烟草（HATSA）卷制——该厂由弗兰克·亚内萨于 1963 年创办，其科夫拉迪亚工厂是该国第一家面向出口的雪茄厂。

General Cigar 于 1997 年收购维拉松。因此本品牌与本图集已收录的洪都拉斯 Punch 和 Hoyo de Monterrey 共用同样的工坊与卷制师：维拉松于 1965 年取得后两者的美国权利，亚内萨则在 1969 年将其生产迁至 HATSA。',

 'يعود تاريخ العلامة الكوبية إلى 1848. أمّا شبيهتها الهندوراسية فمن عمل عائلة فيّازون، التي عهدت بلفّها إلى هندوراس أميركان توباكو — تلك HATSA التي أسّسها فرانك يانيثا عام 1963، وكان مصنعها في كوفراديا أول مصنع سيجار في البلد موجَّه إلى التصدير.

اشترت General Cigar شركة فيّازون عام 1997. فالدار تتقاسم إذًا ورشها ولافّيها مع بانش وأويو دي مونتيري الهندوراسيّين، وكلاهما في هذا الأطلس: فقد نالت فيّازون الحقوق الأمريكية لهما عام 1965، ونقل يانيثا إنتاجهما إلى HATSA عام 1969.',

 '[]', '[]', '[]', '[]', '[]'),

-- ── Saint Luis Rey Honduras ──────────────────────────────
('Saint Luis Rey Honduras', 'honduras', '— Honduras (Altadis USA)',
 'Honduras ; la ligne Tabacales à la Tabacalera de García, La Romana',

 'Saint Luis Rey est né à Cuba. Sa version non cubaine appartient au portefeuille d''Altadis USA et se roule au Honduras.

Une ligne plus récente rompt avec cet usage : les Tabacales sont faits en République dominicaine, à la Tabacalera de García de La Romana — la manufacture d''où sortent aussi les Montecristo, Romeo y Julieta et H. Upmann dominicains. Une même marque non cubaine, deux pays, deux ateliers.',

 '[{"name":"Tabacales","color":"#7A4B2A","story":"Faite en République dominicaine, à la Tabacalera de García, à rebours de l''usage hondurien de la marque."}]',

 'Saint Luis Rey was born in Cuba. Its non-Cuban version belongs to the Altadis U.S.A. portfolio and is rolled in Honduras.

A more recent line breaks with that habit: the Tabacales are made in the Dominican Republic, at the Tabacalera de García in La Romana — the plant that also turns out the Dominican Montecristo, Romeo y Julieta and H. Upmann. One non-Cuban brand, two countries, two benches.',

 'Saint Luis Rey nació en Cuba. Su versión no cubana pertenece a la cartera de Altadis U.S.A. y se lía en Honduras.

Una línea más reciente rompe con esa costumbre: los Tabacales se hacen en la República Dominicana, en la Tabacalera de García de La Romana, la manufactura de la que salen también los Montecristo, Romeo y Julieta y H. Upmann dominicanos. Una misma marca no cubana, dos países, dos talleres.',

 'Saint Luis Rey stammt aus Kuba. Die nicht-kubanische Fassung gehört zum Portfolio von Altadis U.S.A. und wird in Honduras gerollt.

Eine jüngere Linie bricht damit: Die Tabacales entstehen in der Dominikanischen Republik, in der Tabacalera de García in La Romana — jenem Werk, aus dem auch der dominikanische Montecristo, Romeo y Julieta und H. Upmann kommen. Eine nicht-kubanische Marke, zwei Länder, zwei Werkbänke.',

 'Saint Luis Rey 源自古巴。其非古巴版本属于 Altadis U.S.A. 的产品线，在洪都拉斯卷制。

一条较新的产品线打破了这一惯例：Tabacales 在多米尼加共和国的拉罗马纳 Tabacalera de García 工厂制作——多米尼加版的 Montecristo、Romeo y Julieta 与 H. Upmann 也出自该厂。同一个非古巴品牌，两个国家，两处工坊。',

 'وُلد سان لويس ري في كوبا. أمّا نسخته غير الكوبية فتنتمي إلى تشكيلة Altadis U.S.A. وتُلفّ في هندوراس.

غير أنّ خطًّا أحدث يخرج عن هذه العادة: إذ تُصنع تاباكاليس في جمهورية الدومينيكان، في مصنع تاباكاليرا دي غارسيا بلا رومانا — وهو المصنع نفسه الذي يخرج منه مونتيكريستو ورومِيو إي خولييتا وهـ. أوبمان الدومينيكيّون. علامة واحدة غير كوبية، وبلدان، وورشتان.',

 '[{"name":"Tabacales","color":"#7A4B2A","story":"Made in the Dominican Republic, at the Tabacalera de García, against the brand''s Honduran habit."}]',
 '[{"name":"Tabacales","color":"#7A4B2A","story":"Hecha en la República Dominicana, en la Tabacalera de García, a contracorriente de la costumbre hondureña de la marca."}]',
 '[{"name":"Tabacales","color":"#7A4B2A","story":"In der Dominikanischen Republik gefertigt, in der Tabacalera de García, entgegen der honduranischen Gewohnheit der Marke."}]',
 '[{"name":"Tabacales","color":"#7A4B2A","story":"在多米尼加共和国的 Tabacalera de García 工厂制作，与该品牌的洪都拉斯惯例相反。"}]',
 '[{"name":"Tabacales","color":"#7A4B2A","story":"تُصنع في جمهورية الدومينيكان بمصنع تاباكاليرا دي غارسيا، خلافًا لعادة العلامة الهندوراسية."}]'),

-- ── Gispert ──────────────────────────────────────────────
('Gispert', 'honduras', '1940 — Cuba ; relancée en 2003 (Altadis)',
 'La Flor de Copán, Honduras',

 'Le cas est différent des autres : ici, c''est Cuba qui a lâché le nom.

Simón Veja Peláez crée Gispert en 1940 à Pinar del Río, sur des tabacs de la Vuelta Arriba, avec une réputation de cigare léger — chose rare au catalogue cubain. Après 1959, Cubatabaco puis Habanos S.A. la produisent à l''usine Carlos Balio, mais les ventes s''effritent et la gamme tombe de onze formats à quelques-uns. Habanos arrête en 2005.

Altadis avait relancé la marque dès 2003, au Honduras. Elle sort aujourd''hui de La Flor de Copán, dont l''atlas porte déjà la fiche, en deux versions : cape équatorienne de semence Connecticut, ou cape maduro de San Andrés, au Mexique.',

 '[{"name":"Gispert","color":"#8A5A2B","wrapper":"Équateur (semence Connecticut) ou San Andrés maduro","story":"Deux versions, l''une claire, l''autre maduro. Tripe hondurienne et nicaraguayenne, corps doux à moyen."}]',

 'This case differs from the others: here it is Cuba that let the name go.

Simón Veja Peláez created Gispert in 1940 in Pinar del Río, on Vuelta Arriba tobaccos, with a reputation for a light cigar — a rare thing in the Cuban catalogue. After 1959, Cubatabaco and then Habanos S.A. produced it at the Carlos Balio factory, but sales dwindled and the range fell from eleven sizes to a handful. Habanos stopped in 2005.

Altadis had already revived the brand in 2003, in Honduras. It comes today from La Flor de Copán, whose entry this atlas already holds, in two versions: an Ecuadorian Connecticut-seed wrapper, or a San Andrés maduro wrapper from Mexico.',

 'El caso es distinto de los demás: aquí fue Cuba la que soltó el nombre.

Simón Veja Peláez crea Gispert en 1940 en Pinar del Río, con tabacos de la Vuelta Arriba y fama de puro ligero, cosa rara en el catálogo cubano. Tras 1959, Cubatabaco y luego Habanos S.A. lo producen en la fábrica Carlos Balio, pero las ventas se desmoronan y la gama cae de once formatos a unos pocos. Habanos se detiene en 2005.

Altadis había relanzado la marca ya en 2003, en Honduras. Sale hoy de La Flor de Copán, cuya ficha ya figura en este atlas, en dos versiones: capa ecuatoriana de semilla Connecticut, o capa maduro de San Andrés, en México.',

 'Dieser Fall unterscheidet sich von den anderen: Hier hat Kuba den Namen losgelassen.

Simón Veja Peláez schuf Gispert 1940 in Pinar del Río, aus Tabaken der Vuelta Arriba, mit dem Ruf einer leichten Zigarre — im kubanischen Katalog eine Seltenheit. Nach 1959 stellten Cubatabaco und dann Habanos S.A. sie in der Fabrik Carlos Balio her, doch der Absatz bröckelte und das Sortiment fiel von elf Formaten auf wenige. Habanos stellte 2005 ein.

Altadis hatte die Marke schon 2003 in Honduras wiederbelebt. Sie kommt heute aus La Flor de Copán, dessen Eintrag dieser Atlas bereits führt, in zwei Fassungen: ecuadorianisches Deckblatt aus Connecticut-Saat oder Maduro-Deckblatt aus San Andrés in Mexiko.',

 '这一例与其他不同：此处是古巴放开了这个名字。

西蒙·维哈·佩拉埃斯于 1940 年在比那尔德里奥创立 Gispert，用的是上维尔塔的烟叶，以口味清淡著称——这在古巴产品目录中颇为少见。1959 年之后，先由古巴烟草公司、后由 Habanos S.A. 在卡洛斯·巴利奥工厂生产，但销量渐衰，规格从十一款减至寥寥数款。Habanos 于 2005 年停产。

而 Altadis 早在 2003 年便已在洪都拉斯重启该品牌。如今它出自本图集已收录的 La Flor de Copán 工厂，有两个版本：厄瓜多尔康涅狄格种茄衣，或墨西哥圣安德烈斯马杜罗茄衣。',

 'هذه الحالة تختلف عن سواها: فهنا كوبا هي التي تخلّت عن الاسم.

أنشأ سيمون فيخا بيلاييث علامة غيسبرت عام 1940 في بينار دل ريو، من تبغ بويلتا أرّيبا، وقد اشتُهرت بسيجارها الخفيف — وهو أمر نادر في التشكيلة الكوبية. وبعد 1959 أنتجتها كوباتاباكو ثم Habanos S.A. في مصنع كارلوس باليو، غير أنّ المبيعات تراجعت وهبطت التشكيلة من أحد عشر قياسًا إلى بضعة. وأوقفتها Habanos عام 2005.

أمّا Altadis فكانت قد أعادت إطلاق العلامة منذ 2003 في هندوراس. وهي تخرج اليوم من مصنع لا فلور دي كوبان، الذي يضمّه هذا الأطلس أصلًا، في نسختين: غلاف إكوادوري من بذرة كونيتيكت، أو غلاف مادورو من سان أندريس في المكسيك.',

 '[{"name":"Gispert","color":"#8A5A2B","wrapper":"Ecuador (Connecticut seed) or San Andrés maduro","story":"Two versions, one light, one maduro. Honduran and Nicaraguan filler, mild to medium body."}]',
 '[{"name":"Gispert","color":"#8A5A2B","wrapper":"Ecuador (semilla Connecticut) o San Andrés maduro","story":"Dos versiones, una clara y otra maduro. Tripa hondureña y nicaragüense, cuerpo suave a medio."}]',
 '[{"name":"Gispert","color":"#8A5A2B","wrapper":"Ecuador (Connecticut-Saat) oder San Andrés maduro","story":"Zwei Fassungen, eine helle und eine Maduro. Honduranische und nicaraguanische Einlage, milder bis mittlerer Körper."}]',
 '[{"name":"Gispert","color":"#8A5A2B","wrapper":"厄瓜多尔（康涅狄格种）或圣安德烈斯马杜罗","story":"两个版本，一浅一深。洪都拉斯与尼加拉瓜茄芯，口味由淡至中。"}]',
 '[{"name":"Gispert","color":"#8A5A2B","wrapper":"إكوادور (بذرة كونيتيكت) أو سان أندريس مادورو","story":"نسختان، فاتحة ومادورو. حشوة هندوراسية ونيكاراغوية، وقوام خفيف إلى متوسط."}]');

-- ══ RÉPUBLIQUE DOMINICAINE ══════════════════════════════

INSERT INTO `brands`
  (`name`, `country_id`, `founded`, `factory`, `history`, `gamme`,
   `history_en`, `history_es`, `history_de`, `history_zh`, `history_ar`,
   `gamme_en`, `gamme_es`, `gamme_de`, `gamme_zh`, `gamme_ar`)
VALUES

-- ── La Gloria Cubana Dominicaine ─────────────────────────
('La Gloria Cubana Dominicaine', 'dominican', '1972 — Miami (El Credito)',
 'General Cigar, République dominicaine ; à l''origine El Credito, Miami',

 'Celle-ci n''est pas née d''un dépôt de marque mais d''une manufacture.

Ernesto Perez-Carrillo père, arrivé de Cuba en 1959, ouvre en 1968 l''usine El Credito sur la Calle Ocho, dans la Petite Havane de Miami. La Gloria Cubana non cubaine y voit le jour en 1972. Son fils, Ernesto Perez-Carrillo, reprend l''affaire en 1980 et en fait la marque de la maison.

En 1996, El Credito compte trente rouleurs et sort environ 1,2 million de cigares, dont quatre sur cinq sont des Gloria Cubana. La demande dépasse l''atelier : la production part en République dominicaine, et General Cigar rachète la marque en 1999. Le même Ernesto Perez-Carrillo a depuis fondé sa propre maison, que l''atlas porte sous le nom E.P. Carrillo.',

 '[]',

 'This one was not born of a trademark filing but of a workshop.

Ernesto Perez-Carrillo Sr., who arrived from Cuba in 1959, opened the El Credito factory on Calle Ocho, in Miami''s Little Havana, in 1968. The non-Cuban La Gloria Cubana was created there in 1972. His son, Ernesto Perez-Carrillo, took over in 1980 and made it the house''s brand.

By 1996 El Credito had thirty rollers and turned out some 1.2 million cigars, four in five of them Gloria Cubanas. Demand outgrew the bench: production moved to the Dominican Republic, and General Cigar bought the brand in 1999. That same Ernesto Perez-Carrillo has since founded his own house, which this atlas holds under the name E.P. Carrillo.',

 'Esta no nació de un registro de marca sino de una manufactura.

Ernesto Perez-Carrillo padre, llegado de Cuba en 1959, abre en 1968 la fábrica El Credito en la Calle Ocho, en la Pequeña Habana de Miami. La Gloria Cubana no cubana nace allí en 1972. Su hijo, Ernesto Perez-Carrillo, toma el relevo en 1980 y la convierte en la marca de la casa.

En 1996, El Credito cuenta con treinta liadores y saca unos 1,2 millones de puros, cuatro de cada cinco Gloria Cubana. La demanda desborda el taller: la producción pasa a la República Dominicana, y General Cigar compra la marca en 1999. Ese mismo Ernesto Perez-Carrillo ha fundado después su propia casa, que este atlas recoge con el nombre E.P. Carrillo.',

 'Diese hier entstand nicht aus einer Markenanmeldung, sondern aus einer Werkstatt.

Ernesto Perez-Carrillo senior, 1959 aus Kuba gekommen, eröffnete 1968 die Fabrik El Credito an der Calle Ocho in Miamis Little Havana. Die nicht-kubanische La Gloria Cubana entstand dort 1972. Sein Sohn Ernesto Perez-Carrillo übernahm 1980 und machte sie zur Marke des Hauses.

1996 zählte El Credito dreißig Roller und brachte rund 1,2 Millionen Zigarren hervor, vier von fünf davon Gloria Cubanas. Die Nachfrage überstieg die Werkbank: Die Produktion ging in die Dominikanische Republik, und General Cigar kaufte die Marke 1999. Derselbe Ernesto Perez-Carrillo hat seither sein eigenes Haus gegründet, das dieser Atlas unter dem Namen E.P. Carrillo führt.',

 '这一个并非诞生于商标注册，而是诞生于一间工坊。

老埃内斯托·佩雷斯-卡里略 1959 年从古巴来到美国，1968 年在迈阿密小哈瓦那的第八街开设了 El Credito 工厂。非古巴版的 La Gloria Cubana 于 1972 年在此问世。其子埃内斯托·佩雷斯-卡里略 1980 年接手，并将其打造为该厂的招牌。

1996 年，El Credito 拥有三十名卷制师，年产约 120 万支雪茄，其中五分之四为 Gloria Cubana。需求超出了工坊的产能：生产迁往多米尼加共和国，General Cigar 于 1999 年收购该品牌。这位埃内斯托·佩雷斯-卡里略此后创办了自己的品牌，即本图集收录的 E.P. Carrillo。',

 'لم تُولد هذه من تسجيل علامة، بل من ورشة.

فتح إرنستو بيريث-كاريّو الأب، الذي وصل من كوبا عام 1959، مصنع إل كريديتو عام 1968 في شارع كايي أوتشو بحي هافانا الصغيرة في ميامي. وهناك وُلدت لا غلوريا كوبانا غير الكوبية عام 1972. ثمّ تولّى ابنه إرنستو بيريث-كاريّو الأمر عام 1980 وجعلها علامة الدار.

وفي 1996 كان لدى إل كريديتو ثلاثون لافًّا، وأنتج نحو 1.2 مليون سيجار، أربعة أخماسها من غلوريا كوبانا. وتجاوز الطلبُ الورشةَ: فانتقل الإنتاج إلى جمهورية الدومينيكان، واشترت General Cigar العلامة عام 1999. وقد أسّس إرنستو بيريث-كاريّو نفسه بعدها داره الخاصة، التي يضمّها هذا الأطلس باسم E.P. Carrillo.',

 '[]', '[]', '[]', '[]', '[]'),

-- ── H. Upmann Dominicain ─────────────────────────────────
('H. Upmann Dominicain', 'dominican', '— Rép. dominicaine (Altadis USA)',
 'Tabacalera de García, La Romana',

 'Après la Révolution, la famille Menéndez, qui tenait H. Upmann à La Havane, gagne la République dominicaine. Un second H. Upmann y naît, sans lien de propriété avec le cubain.

Il se roule à la Tabacalera de García, à La Romana — fondée en 1971 dans la première zone franche du pays. Plus de deux mille personnes y travaillent, pour une quarantaine de millions de cigares par an, tous roulés à la main. Les Montecristo, Romeo y Julieta, Don Diego et Henry Clay dominicains en sortent aussi.',

 '[]',

 'After the Revolution, the Menéndez family, who held H. Upmann in Havana, made for the Dominican Republic. A second H. Upmann was born there, with no ownership link to the Cuban one.

It is rolled at the Tabacalera de García in La Romana — founded in 1971 in the country''s first free zone. More than two thousand people work there, for some forty million cigars a year, every one rolled by hand. The Dominican Montecristo, Romeo y Julieta, Don Diego and Henry Clay come from there too.',

 'Tras la Revolución, la familia Menéndez, que tenía H. Upmann en La Habana, se marcha a la República Dominicana. Allí nace un segundo H. Upmann, sin vínculo de propiedad con el cubano.

Se lía en la Tabacalera de García, en La Romana, fundada en 1971 en la primera zona franca del país. Allí trabajan más de dos mil personas, para unos cuarenta millones de puros al año, todos liados a mano. De allí salen también los Montecristo, Romeo y Julieta, Don Diego y Henry Clay dominicanos.',

 'Nach der Revolution zog die Familie Menéndez, die H. Upmann in Havanna führte, in die Dominikanische Republik. Dort entstand ein zweiter H. Upmann, ohne Eigentumsverbindung zum kubanischen.

Er wird in der Tabacalera de García in La Romana gerollt — 1971 in der ersten Freihandelszone des Landes gegründet. Über zweitausend Menschen arbeiten dort, für rund vierzig Millionen Zigarren im Jahr, alle von Hand gerollt. Auch der dominikanische Montecristo, Romeo y Julieta, Don Diego und Henry Clay kommen von dort.',

 '革命之后，在哈瓦那经营 H. Upmann 的梅嫩德斯家族前往多米尼加共和国。第二个 H. Upmann 在此诞生，与古巴版并无产权关联。

它在拉罗马纳的 Tabacalera de García 卷制——该厂 1971 年创办于该国第一个自由贸易区。厂内员工两千余人，年产约四千万支，全部手工卷制。多米尼加版的 Montecristo、Romeo y Julieta、Don Diego 与 Henry Clay 也出自此厂。',

 'بعد الثورة، انتقلت عائلة مينينديث، التي كانت تدير هـ. أوبمان في هافانا، إلى جمهورية الدومينيكان. وهناك وُلد هـ. أوبمان ثانٍ، دون صلة ملكية بالكوبي.

ويُلفّ في مصنع تاباكاليرا دي غارسيا بلا رومانا، الذي أُسّس عام 1971 في أول منطقة حرة بالبلد. ويعمل فيه أكثر من ألفَي شخص، لإنتاج نحو أربعين مليون سيجار سنويًا، تُلفّ كلّها باليد. ومنه يخرج أيضًا مونتيكريستو ورومِيو إي خولييتا ودون دييغو وهنري كلاي الدومينيكيّون.',

 '[]', '[]', '[]', '[]', '[]'),

-- ── Henry Clay ───────────────────────────────────────────
('Henry Clay', 'dominican', '— Rép. dominicaine (Altadis USA)',
 'Tabacalera de García, La Romana',

 'La marque porte le nom de l''homme d''État américain Henry Clay. Née à Cuba, elle ne subsiste aujourd''hui que dans sa version non cubaine — l''atlas ne porte donc pas de Henry Clay havanais en face, et le nom n''a pas besoin de suffixe.

Altadis USA la fait rouler à la Tabacalera de García, à La Romana, la même manufacture que les H. Upmann, Montecristo et Romeo y Julieta dominicains.',

 '[]',

 'The brand carries the name of the American statesman Henry Clay. Born in Cuba, it survives today only in its non-Cuban version — this atlas therefore holds no Havana Henry Clay opposite it, and the name needs no suffix.

Altadis U.S.A. has it rolled at the Tabacalera de García in La Romana, the same plant as the Dominican H. Upmann, Montecristo and Romeo y Julieta.',

 'La marca lleva el nombre del estadista estadounidense Henry Clay. Nacida en Cuba, hoy solo subsiste en su versión no cubana: este atlas no recoge pues ningún Henry Clay habanero enfrente, y el nombre no necesita sufijo.

Altadis U.S.A. la hace liar en la Tabacalera de García, en La Romana, la misma manufactura que los H. Upmann, Montecristo y Romeo y Julieta dominicanos.',

 'Die Marke trägt den Namen des amerikanischen Staatsmanns Henry Clay. In Kuba entstanden, besteht sie heute nur noch in ihrer nicht-kubanischen Fassung — dieser Atlas führt ihr also keinen Havanna-Henry-Clay gegenüber, und der Name braucht kein Suffix.

Altadis U.S.A. lässt sie in der Tabacalera de García in La Romana rollen, demselben Werk wie den dominikanischen H. Upmann, Montecristo und Romeo y Julieta.',

 '该品牌以美国政治家亨利·克莱命名。它诞生于古巴，如今仅以非古巴版本存续——因此本图集并无与之相对的哈瓦那版 Henry Clay，名称也无需后缀。

Altadis U.S.A. 交由拉罗马纳的 Tabacalera de García 卷制，与多米尼加版的 H. Upmann、Montecristo 和 Romeo y Julieta 同厂。',

 'تحمل العلامة اسم رجل الدولة الأمريكي هنري كلاي. وُلدت في كوبا، ولا تبقى اليوم إلّا في نسختها غير الكوبية — ولذلك لا يضمّ هذا الأطلس هنري كلاي هافانيًّا يقابلها، ولا يحتاج الاسم إلى لاحقة.

وتعهد Altadis U.S.A. بلفّها إلى مصنع تاباكاليرا دي غارسيا في لا رومانا، وهو المصنع نفسه الذي يخرج منه هـ. أوبمان ومونتيكريستو ورومِيو إي خولييتا الدومينيكيّون.',

 '[]', '[]', '[]', '[]', '[]'),

-- ── Por Larrañaga Dominicain ─────────────────────────────
('Por Larrañaga Dominicain', 'dominican', '2016 — Rép. dominicaine (Altadis USA)',
 'République dominicaine et Honduras (Altadis)',

 'La marque cubaine est de 1834 : l''une des plus anciennes encore vivantes.

Altadis USA en détient les droits américains et a annoncé en 2016 une nouvelle collection non cubaine sous ce nom. Selon les lignes, elle est roulée en République dominicaine ou au Honduras — la maison n''a pas d''atelier unique.',

 '[]',

 'The Cuban brand dates from 1834: one of the oldest still alive.

Altadis U.S.A. holds the American rights and announced a new non-Cuban collection under the name in 2016. Depending on the line, it is rolled in the Dominican Republic or in Honduras — the house has no single bench.',

 'La marca cubana es de 1834: una de las más antiguas que siguen vivas.

Altadis U.S.A. posee los derechos estadounidenses y anunció en 2016 una nueva colección no cubana bajo ese nombre. Según las líneas, se lía en la República Dominicana o en Honduras: la casa no tiene un taller único.',

 'Die kubanische Marke stammt von 1834: eine der ältesten noch lebenden.

Altadis U.S.A. hält die amerikanischen Rechte und kündigte 2016 eine neue nicht-kubanische Kollektion unter diesem Namen an. Je nach Linie wird sie in der Dominikanischen Republik oder in Honduras gerollt — das Haus hat keine einzige Werkbank.',

 '古巴品牌创立于 1834 年，是仍在运营的最古老品牌之一。

Altadis U.S.A. 持有其美国权利，并于 2016 年宣布以该名推出新的非古巴系列。视产品线而定，其卷制地或在多米尼加共和国，或在洪都拉斯——该品牌并无单一工坊。',

 'يعود تاريخ العلامة الكوبية إلى 1834، وهي من أقدم ما لا يزال قائمًا.

تملك Altadis U.S.A. حقوقها الأمريكية، وأعلنت عام 2016 عن تشكيلة جديدة غير كوبية تحت هذا الاسم. وبحسب الخطوط، تُلفّ في جمهورية الدومينيكان أو في هندوراس — فليس للدار ورشة واحدة.',

 '[]', '[]', '[]', '[]', '[]'),

-- ── Fonseca Dominicain ───────────────────────────────────
('Fonseca Dominicain', 'dominican', '— Rép. dominicaine (MATASA)',
 'MATASA, Santiago de los Caballeros',

 'Le Fonseca cubain et le dominicain portent le même nom sans partager de propriétaire.

Le second est fait par MATASA, à Santiago de los Caballeros — la manufacture de la famille Quesada, dont l''atlas porte déjà la maison sous son propre nom. C''est le seul des cas non cubains de cet atlas à ne dépendre ni d''Altadis ni de General Cigar, mais d''une famille dominicaine.',

 '[]',

 'The Cuban Fonseca and the Dominican one share a name without sharing an owner.

The second is made by MATASA, in Santiago de los Caballeros — the Quesada family''s factory, whose house this atlas already holds under its own name. It is the only non-Cuban case in this atlas that depends neither on Altadis nor on General Cigar, but on a Dominican family.',

 'El Fonseca cubano y el dominicano llevan el mismo nombre sin compartir propietario.

El segundo lo hace MATASA, en Santiago de los Caballeros: la manufactura de la familia Quesada, cuya casa este atlas ya recoge con su propio nombre. Es el único de los casos no cubanos de este atlas que no depende ni de Altadis ni de General Cigar, sino de una familia dominicana.',

 'Der kubanische und der dominikanische Fonseca teilen den Namen, nicht den Eigentümer.

Der zweite wird von MATASA in Santiago de los Caballeros gefertigt — der Fabrik der Familie Quesada, deren Haus dieser Atlas bereits unter eigenem Namen führt. Es ist der einzige nicht-kubanische Fall in diesem Atlas, der weder von Altadis noch von General Cigar abhängt, sondern von einer dominikanischen Familie.',

 '古巴版与多米尼加版的 Fonseca 同名而不同主。

后者由位于圣地亚哥-德洛斯卡瓦耶罗斯的 MATASA 制造——即克萨达家族的工厂，本图集已以其本名收录该品牌。这是本图集所有非古巴同名品牌中，唯一既不属于 Altadis 也不属于 General Cigar，而属于一个多米尼加家族的例子。',

 'يحمل فونسيكا الكوبي ونظيره الدومينيكي الاسم نفسه دون أن يجمعهما مالك.

فالثاني تصنعه MATASA في سانتياغو دي لوس كاباييروس — مصنع عائلة كيسادا، التي يضمّ هذا الأطلس دارها أصلًا باسمها. وهي الحالة غير الكوبية الوحيدة في هذا الأطلس التي لا تتبع Altadis ولا General Cigar، بل عائلة دومينيكية.',

 '[]', '[]', '[]', '[]', '[]');

-- ══ LES FICHES DE PAYS DOIVENT ANNONCER LES MAISONS ═════
-- coherence_check l'exige : une maison que `producer_countries.brands`
-- ne nomme pas existe en base et reste invisible depuis le globe. Le nom
-- doit être IDENTIQUE des deux côtés — c'est ce qui avait refusé
-- « Le Fagot » là où la table portait « Le Fagot Cigar ».

UPDATE `producer_countries`
   SET `brands` = JSON_MERGE_PRESERVE(`brands`, JSON_ARRAY(
         JSON_OBJECT('name','Bolívar Honduras','desc','Assemblage Cofradia d''Estélo Padrón, chez HATSA','iconic',FALSE),
         JSON_OBJECT('name','El Rey del Mundo Honduras','desc','Villazon, aux mêmes ateliers que Punch et Hoyo','iconic',FALSE),
         JSON_OBJECT('name','Saint Luis Rey Honduras','desc','Altadis USA ; la ligne Tabacales est dominicaine','iconic',FALSE),
         JSON_OBJECT('name','Gispert','desc','Abandonnée par Habanos en 2005, relancée au Honduras','iconic',FALSE))),
       `updated_at` = NOW()
 WHERE `id` = 'honduras'
   AND JSON_SEARCH(`brands`, 'one', 'Gispert') IS NULL;

UPDATE `producer_countries`
   SET `brands` = JSON_MERGE_PRESERVE(`brands`, JSON_ARRAY(
         JSON_OBJECT('name','La Gloria Cubana Dominicaine','desc','Née chez El Credito, à Miami, en 1972','iconic',FALSE),
         JSON_OBJECT('name','H. Upmann Dominicain','desc','Tabacalera de García, La Romana','iconic',FALSE),
         JSON_OBJECT('name','Henry Clay','desc','Ne subsiste que hors de Cuba','iconic',FALSE),
         JSON_OBJECT('name','Por Larrañaga Dominicain','desc','Collection non cubaine annoncée en 2016','iconic',FALSE),
         JSON_OBJECT('name','Fonseca Dominicain','desc','MATASA, la manufacture de la famille Quesada','iconic',FALSE))),
       `updated_at` = NOW()
 WHERE `id` = 'dominican'
   AND JSON_SEARCH(`brands`, 'one', 'Henry Clay') IS NULL;

-- ══ LES SCEAUX, CALCULÉS DEPUIS LES COLONNES ════════════
INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'brands', b.`name`, c.champ, l.lang,
       SHA1(CASE c.champ WHEN 'history' THEN b.`history` ELSE b.`gamme` END),
       'machine', NOW()
  FROM `brands` b
  JOIN (SELECT 'history' champ UNION ALL SELECT 'gamme') c
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE b.`name` IN ('Bolívar Honduras','El Rey del Mundo Honduras','Saint Luis Rey Honduras',
                    'Gispert','La Gloria Cubana Dominicaine','H. Upmann Dominicain',
                    'Henry Clay','Por Larrañaga Dominicain','Fonseca Dominicain')
   -- UNE GAMME VIDE SE SCELLE QUAND MEME. `Capitol` porte « [] » et
   -- cinq sceaux : le sceau dit que la traduction correspond au
   -- francais, et « [] » traduit « [] » exactement. Le premier jet
   -- excluait ces valeurs, et i18n_fraicheur a compte trente
   -- traductions sans empreinte.
   AND COALESCE(CASE c.champ WHEN 'history' THEN b.`history` ELSE b.`gamme` END, '') <> ''
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 173','systeme','motif_referme','marque',0,
   'l atlas documentait SEPT fois le motif « meme nom, deux marques » — Cohiba USA, Partagas USA, Romeo y Julieta USA et Dominicain, Trinidad USA, Montecristo Dominicain, Hoyo Honduras, Punch Honduras — et n avait que la version cubaine des autres. Neuf jumelles ajoutees, portant l atlas a 129 maisons'),
  (NULL,'migration 173','systeme','piege_du_recoupement','systeme',0,
   'UN RECOUPEMENT PAR LE NOM LES DECLARAIT « DEJA PRESENTES », puisque le nom cubain est en base. Faux positifs DE FOND : c est ce qui avait laisse passer Trinidad USA jusqu a ce qu un lecteur le remarque. Le document docs/maisons-absentes.md le dit en toutes lettres pour que le piege ne reprenne pas'),
  (NULL,'migration 173','systeme','fiche_non_creee','marque',0,
   'SANCHO PANZA NON CUBAIN N EST PAS CREE : en janvier 2026, Scandinavian Tobacco Group a annonce le retrait de son tarif des marques Sancho Panza et Los Statos Deluxe. Ouvrir une fiche de maison vivante pour une marque qu on cesse de vendre serait affirmer le contraire de ce qu on sait. La fiche attendra qu on sache ce que le nom devient'),
  (NULL,'migration 173','systeme','deux_qui_ne_sont_pas_des_jumelles','marque',0,
   'GISPERT : ici c est CUBA qui a lache le nom — Habanos a arrete en 2005, Altadis avait relance des 2003 au Honduras. HENRY CLAY : meme cas, la marque ne subsiste que hors de Cuba. Toutes deux entrent SANS suffixe de pays, puisqu il n y a personne en face'),
  (NULL,'migration 173','systeme','gammes_vides_assumees','marque',0,
   '`gamme` n est rempli que pour les TROIS maisons dont une source decrit l assemblage : Bolivar Honduras, Gispert, Saint Luis Rey Honduras. Les six autres ont une gamme VIDE, que le rendu omet sans laisser de bloc. Inventer six gammes pour faire symetrique serait exactement la faute que le chantier des sources a passe quatre blocs a defaire'),
  (NULL,'migration 173','systeme','renvois_internes','marque',0,
   'trois fiches renvoient a des maisons DEJA dans l atlas, et c est ce qui fait la valeur du bloc : La Gloria Cubana Dominicaine mene a E.P. Carrillo (le meme homme), Gispert a La Flor de Copan (la meme usine), Fonseca Dominicain a Quesada (la meme famille). El Rey del Mundo Honduras partage ses rouleurs avec Punch et Hoyo Honduras');
