-- ════════════════════════════════════════════════════════
-- 279 — Relecture zh
-- ────────────────────────────────────────────────────────
-- Relecture des traductions « zh » par : expert-traduction (agent).
-- Fichier de verdicts : verdicts_p2_zh.json ; generee par tools/i18n_relecture.php le 2026-10-22.
-- Un texte « corrige » est reecrit ; tout texte relu passe au statut « relu »,
-- avec le nom du relecteur. L'empreinte du francais est verifiee dans le WHERE :
-- un francais qui a change depuis l'export ne se laisse pas declarer relu.
-- ════════════════════════════════════════════════════════

-- brands|1502 Cigars|history|zh — 人名厂名改拉丁字母
UPDATE `brands` SET `history_zh` = '1502年是哥伦布抵达尼加拉瓜海岸的年份，Enrique Sánchez Icaza 以此为名，因为他是尼加拉瓜人，并且要把这一点说出来。他的公司 Global Premium Cigars 据其官网创于2011年，据行业媒体为2012年——相差一年，本词条存而不论。

它没有工厂，也不掩饰：雪茄在埃斯特利的 Plasencia 厂卷制，本图集载有该厂词条，Crux 与 Blanco 也在那里卷制。这份名单上每三家便有一家经由 Plasencia——这正是这个家族在精品雪茄界分量的度量。

目录以宝石与金属排列——Emerald、Ruby、Black Gold——上有 XO，另有一款朴素的 Nicaragua。归入尼加拉瓜毫无争议：创始人、烟叶与作坊都在那里。'
 WHERE `name` = '1502 Cigars' AND SHA1(TRIM(`history`)) = 'e81ea97c2d6e48ab8097ecc0731cdf5c37c94118';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = '1502 Cigars' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'e81ea97c2d6e48ab8097ecc0731cdf5c37c94118';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = '262 Cigars' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '1f752d20747b70311b06321661d4a97992e64f45';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = '7-20-4' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'c71eb657916546e5e8ca12c99c20e5a0df579a42';
-- brands|ADVentura|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'ADVentura 是一场合作，名字以大写写明：ADV 代表合伙人，Ventura 代表工厂。Henderson Ventura 是联合调配大师、William Ventura 之子——本图集载有其父词条；Marcel Knobel 是瑞士人，侍酒师、咖啡生产者与零售商，因味觉而入雪茄之门。两人于2016年创立品牌，一切都在坦博里尔的 Tabacalera William Ventura 卷制。

目录讲述航海与海盗：The Explorer、The Navigator、The Conqueror——厄瓜多尔 Habano 2000 茄衣、厄瓜多尔苏门答腊茄套、多米尼加与尼加拉瓜茄芯——继而 The Royal Return、Barbarroja''s Invasion、Blue Eyed Jack''s Revenge。在美国，公司以 ADV & McKay Cigars Co. 之名于2019年展会登场。

一个瑞士人与一个多米尼加人构思、由后者卷制的牌子：本图集两者皆点名，而国家是作坊所在之国。'
 WHERE `name` = 'ADVentura' AND SHA1(TRIM(`history`)) = '9b9e3a7c132684f9022f0f12ead494ea50b38fea';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'ADVentura' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '9b9e3a7c132684f9022f0f12ead494ea50b38fea';
-- brands|Aging Room|history|zh — Cibao译名不统一
UPDATE `brands` SET `history_zh` = 'Aging Room 源于两个人的相遇：调配的 Rafael Nodal，与制造的 José「Jochy」Blanco。品牌于 2011 年问世。

Nodal 是古巴人，1964 年生，以寻求庇护者的身份抵达美国。2002 年，他与妻子 Alina Cordoves Nodal 及 Hank Bischoff 一同买下迈阿密的 Habana Cuba Cigar Company，更名为 Boutique Blends。Jochy Blanco 同样是这家公司的股东——制造者与委托者互为合伙人，这在业内并非常态。

坦博里尔的 Tabacalera Palma 仍在卷制多米尼加的系列，例如 Core Habano（据零售商 Cigars Direct 在2026年10月所说）；但 Quattro Nicaragua、2016年的 Pelo de Oro，以及自2025年1月起的 La Bohème，都在尼加拉瓜的 A.J. Fernandez 卷制，据 Cigar Coop 与2025年1月的媒体所述。品牌之名道出了其主张：陈化室。Bin No. 1 建立在 1999 与 2001 年从锡瓦奥谷留存下来的烟叶之上，这需要有地方、有耐心，也要有资金去留住它们。

产品线于 2018 年整体重整。Nodal 本人则转入 Tabacalera USA：正是以此身份，他重新调配了 Altadis 的 Trinidad Santiago——制造者，又一次，是 Jochy Blanco。'
 WHERE `name` = 'Aging Room' AND SHA1(TRIM(`history`)) = '2a3548bc4cf64e918f1e08e951eb637b7848dc12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Aging Room' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '2a3548bc4cf64e918f1e08e951eb637b7848dc12';
-- brands|Agrotabacos|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Agrotabacos 是一个道尽一切的公司全称的简写：Agroindustrial Nicaragüense de Tabacos（尼加拉瓜烟草农工业公司）。Omar Ortez 于1995年在孔德加创办，是家族企业，至今如此。工厂位于孔德加——埃斯特利与哈拉帕之间的中间城镇——并以调和三地自任：哈拉帕的甜、孔德加的香、埃斯特利的劲。

它的业务一分为二，并用数字说明。产量的四成以自有品牌 Omar Ortez Originals 与 Omar Ortez Maduro 出品；六成为他人卷制——客户名单说明了分量：Altadis USA、Zander-Greg、Flor de González、Kretek International。为 Altadis 这样的集团代工的工厂，不是一间作坊。

Indiana Ortez 是 Omar 的女儿，也是公司的门面。她二十二岁进厂，由一位名叫 Fausto 的主管带教六个月，此后主管品控与营销。近年的合作以她之名推出：与 Ventura Cigar Co. 的 Fathers, Friends and Fire，继而 Psyko Seven Nicaragua；以及 Casa de Ortez——她在2023年展会上以 La Malinche 亮相的品牌。

Lampert 的 Edición Verde 与 Small Batch 的雪茄正出自此处。'
 WHERE `name` = 'Agrotabacos' AND SHA1(TRIM(`history`)) = '7ab9e58c5ed0ff0d3dd08f17b496a9c0cef35f19';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Agrotabacos' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '7ab9e58c5ed0ff0d3dd08f17b496a9c0cef35f19';
-- brands|Aladino|history|zh — 人名拉丁化；店名误译
UPDATE `brands` SET `history_zh` = 'Julio R. Eiroa 自 1963 年起在丹利种植烟草。他曾是 Camacho 的掌舵人，与儿子 Christian 一同将其经营成洪都拉斯的大字号，并于 2008 年售予 Davidoff。多年间他陆续买下哈马斯特兰谷的国营烟田，家族至今仍在此耕作。

2015 年，他与长子 Justo 一同回归，创办 JRE Tobacco，只为做成他一直想做的事：一支完全由自家土地所产科罗霍烟叶制成的雪茄。

科罗霍是现代杂交品种出现之前的古巴种，以难伺候著称——产量低、易染病——多数种植者早已改种更温顺的品种。坚持种它是一个昂贵的选择，而这正是这家字号的全部主张：Aladino 自称是一支「从前的雪茄」，就农艺意义而言。

名字取自 El Cine Aladino，丹利一家 1970 年代的电影院，家族将其改建为工厂，即今日卷制雪茄的 Las Lomas 厂。此后产品线有所扩充：2018 年的马杜罗、2020 年的喀麦隆种，以及一款 Vintage Selection。'
 WHERE `name` = 'Aladino' AND SHA1(TRIM(`history`)) = '1ac3350883d691df734fdcf849bb7e20da7472a0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Aladino' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '1ac3350883d691df734fdcf849bb7e20da7472a0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Alcazar' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '12327a5d7c782a0c811f12eb8c4cd1810d912f4c';
-- brands|Alfambra|history|zh — 人名拉丁化；烟圈误译
UPDATE `brands` SET `history_zh` = 'Alfambra是Alejandro Mata的品牌，他是来自马拉加的西班牙企业家，当时是Havana Club朗姆酒的经销商。他对雪茄的热情促使他在2005年参加Festival del Habano，在那里结识了古巴烟草种植者Alejandro Robaina。2007年，Mata在埃斯特利开设了一家小作坊，两对雪茄卷制师在那里加工一种来自古巴雷梅迪奥斯、名为La Flor de San Luis的烟叶，随后于2015年推出Alfambra品牌——媒体认为这个名字与格拉纳达的阿尔罕布拉宫有关——首款产品是橙色烟标的medium-filler雪茄，年产3万支。工厂名为Tabacalera Alfambra，在尼加拉瓜的Páginas Amarillas名录中列于埃斯特利名下。其自有土地，包括普韦布洛努埃沃的两处庄园，在尼加拉瓜共计超过五十公顷，据介绍日产量接近6000支，销往十二个欧洲国家。

El Brujito是一款在品牌创立三年后推出的longfiller，Alejandro Mata透露已售出84万支。Boutique产品线，其中包括一款Gran Toro，构成目录的补充。一条名为Alejandro Mata的新产品线已在Intertabac 2026展出，预计2027年3月进入国际市场，向创始人致敬：colorado茄衣五种规格，maduro茄衣三种规格。'
 WHERE `name` = 'Alfambra' AND SHA1(TRIM(`history`)) = '8fc3c48099592901f057eab8e2f0b890430acb6f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Alfambra' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '8fc3c48099592901f057eab8e2f0b890430acb6f';
-- brands|Alhambra|history|zh — 公司名拉丁化；术语统一
UPDATE `brands` SET `history_zh` = '在西班牙统治时期，菲律宾曾是另一个雪茄大国：卡加延河谷供应的烟叶，被马尼拉以工业规模卷制，供应整个亚洲和部分欧洲。Alhambra 正诞生于那个年代，与 Tabacalera 并列。

这个名字来自格拉纳达的宫殿，却丝毫没有说明资本的来处：1898年在马尼拉创立的这家公司是瑞士的，而非西班牙的。1912年，它在城北的通多设厂，并成为 Tabacalera 一个认真而友好的竞争者——两家企业此后数十年共分市场。

菲律宾的产业在二十世纪衰退，却未消失，而 Alhambra 在欧洲、尤其在瑞士保有一批客户——这一钟摆的回摆，几乎是它的出生证明所预告的。

把这个品牌收入图集，是为了提醒：雪茄的地理并非一直局限于加勒比。'
 WHERE `name` = 'Alhambra' AND SHA1(TRIM(`history`)) = 'c89c7c18c4894619cc18c0e4424bfed6ceee9e64';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Alhambra' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'c89c7c18c4894619cc18c0e4424bfed6ceee9e64';
-- brands|All Saints Cigars|history|zh — 人名拉丁化
UPDATE `brands` SET `history_zh` = 'All Saints 是2018年的公司，由 Micky Pegg 与两位朋友 Frank Layo、Martin Corboy 创办。它没有工厂：每支雪茄都在埃斯特利 Rocky Patel 的 TAVICUSA 厂卷制——本图集载有其词条——Pegg 说，这是他与 Patel 长期交情的结果。归入尼加拉瓜依据的是作坊。

名字许诺了众圣徒，目录却过了一阵才交出一位。首个成功之作 Solamente 是单一尺寸 5×58 的限量版——正如其名，只此一支。随后是 Dedicación，首条常规生产线，Pegg 称之为向所有他心怀感激之人的致敬。然后是2021年的 Saint Francis——阿西西的方济各——这家公司首支真正冠以圣徒之名的雪茄。

三条线、一家工厂、一位讲故事的创始人：这是一家精品雪茄公司，词条止于它所点名的东西。'
 WHERE `name` = 'All Saints Cigars' AND SHA1(TRIM(`history`)) = 'f4aee859db72805695bd452522eac4f87293e99b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'All Saints Cigars' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'f4aee859db72805695bd452522eac4f87293e99b';
-- brands|American Caribbean Cigars|history|zh — 城市未译；盒误作箱
UPDATE `brands` SET `history_zh` = 'Emiliano Lagos拥有位于埃斯特利的Tabacalera American Caribbean工厂，该厂在打造自有品牌之前已在为第三方代工。Gurkha于2017年5月宣布有意收购该厂，但同年放弃，转而自建工厂（据Tobacco Business）；American Caribbean得以保持独立，并继续为Gurkha代工。据Cigar Coop称，2018年该厂还为Toraño、Leccia Tobacco以及Vintage Rock-A-Feller Cigar Group代工。

该品牌于2015年推出首个自有品牌La Rosa de Sandiego。随后推出的The Bouncer与Bella Mundo于2018年IPCPR展会亮相：前者采用墨西哥San Andrés茄衣，茄芯为产自埃斯特利、哈拉帕与奥梅特佩的尼加拉瓜烟叶；后者采用被称为Cubra的巴西茄衣、Sumatra茄套及尼加拉瓜criollo茄芯。El Viejo Continente诞生于Emiliano Lagos与Daniel Guerrero的相识——后者是一位巴塞罗那烟草专家，家族曾经营一家烟草店；该系列推出多种外观版本，并包含两条姊妹系列Mare Nostrum与The Circus。

Lagos还卷制他个人的品牌The Traveler，于2017年先在欧洲、后在美国推出，雪茄规格以国际机场命名，分天然与maduro两个版本。该系列包含Maradona Tribute版本，共五百盒，以纪念Diego Maradona，茄芯为尼加拉瓜与洪都拉斯烟叶，茄套为San Andrés，茄衣为厄瓜多尔烟叶。唯一一条在尼加拉瓜境外卷制的系列El Copey，在多米尼加共和国手工制作，所查阅的资料均未指明工厂名称。该品牌参展的记录一直延续至2021年PCA展会（据halfwheel）；截至2026年，The Bouncer与El Copey仍列于Cigarworld.de的目录中。

The Circus是El Viejo Continente旗下的产品线，El Viejo Continente是Daniel Guerrero的品牌；2026年十月，该品牌官网将其列入各产品系列，与Mare Nostrum并列。2021年十月，一个博客称该品牌的生产（包括The Circus Petit，3 1/2 x 44）设在American Caribbean Cigars位于埃斯特利的工厂。2023年九月的一篇文章介绍了该品牌自有的工厂，位于孔德加，但文中未在其中提及The Circus；2026年十月，Cigarworld.de写道，Guerrero在其位于尼加拉瓜的tabacalera生产雪茄。'
 WHERE `name` = 'American Caribbean Cigars' AND SHA1(TRIM(`history`)) = '7164f3c6934e7c474c056ae1b3710e7453c07b89';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'American Caribbean Cigars' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '7164f3c6934e7c474c056ae1b3710e7453c07b89';
-- brands|Ann-Eks|history|zh — 城市名未译
UPDATE `brands` SET `history_zh` = 'Ann-Eks是August Schuster GmbH & Co. KG旗下的一个品牌，这是一家位于北莱茵-威斯特法伦州比恩德的烟草商行。该商行以此名义出售朗姆酒、产自巴西的小雪茄Karla与Kurt，以及一条在尼加拉瓜完全手工卷制的longfiller系列——X系列，Cigarworld.de自2018年12月28日起将其列入目录。该系列有两款规格，Gerda为Robusto，Günther为Toro，采用尼加拉瓜茄芯与多米尼加茄套，外覆墨西哥San Andrés claro茄衣，Cigarworld.de如是说。

该商行未透露卷制X系列的工厂名称，也未透露其所在城市。该商行还出售Canned Heat，一款尼加拉瓜puro，装在独立金属罐中。截至2026年9月，X系列在Zigarre.de、Cigarworld.de与Paul-Bugge.com有售。'
 WHERE `name` = 'Ann-Eks' AND SHA1(TRIM(`history`)) = '18af5a1d044e1bb55870da3137c5a3a4eb1d9ead';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ann-Eks' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '18af5a1d044e1bb55870da3137c5a3a4eb1d9ead';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Antonius' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'd1e7bec67fbd22f4fb675b5c4008eb59d261ed53';
-- brands|Arnold André|history|zh — 城市未译；庄主误译
UPDATE `brands` SET `history_zh` = 'Arnold André是一家德国家族企业，1817年由Johann Friedrich Christian André在奥斯纳布吕克创立，起初生产的是烟丝；1851年，André家族迁往北莱茵-威斯特法伦州的比恩德，七代之后企业总部仍设于当地。为生产手工雪茄，公司于2011年在圣地亚哥-德洛斯卡瓦列罗斯工业自由区开设了自有工厂Arnold André Dominicana S.R.L.；长茄芯雪茄的卷制工序全部转移至该厂，于2015年完成。在比恩德，公司还以机器生产雪茄和小雪茄。

在圣地亚哥建立起的自有产品线共有五个长茄芯品牌。Carlos André于2009年推出，以纪念企业主Axel-Georg André的幼子，采用厄瓜多尔Connecticut Shade Desflorado茄衣卷制。Buena Vista（2013年）据该品牌称，调配了多米尼加、巴西、秘鲁和尼加拉瓜烟叶，其中包括一种按Perique法处理的稀有巴西Araperique烟叶。Beast（2016年）是Axel-Georg André的个人项目，采用墨西哥San Andrés茄衣、Sumatra茄套，以及巴西和尼加拉瓜茄芯。Montosa于2022年进入美国市场，分为Natural（厄瓜多尔Connecticut Shade）和Maduro（墨西哥San Andrés）两款。Parcero则于2021年春季以Dominicano版本（墨西哥茄衣）问世，2022年又增加了Brasil版本（Mata Fina茄衣）。'
 WHERE `name` = 'Arnold André' AND SHA1(TRIM(`history`)) = '627fd0eba57a12c7f4901b8b357285f551737e18';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Arnold André' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '627fd0eba57a12c7f4901b8b357285f551737e18';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Artista Cigars' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'ae7cdbcd99c39fc7bf15bbfcc64fdd33c22d163a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Arturo Fuente Hemingway' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'a2da9f37e6c65c01e7c6329357916321e40dfca0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Arturo Fuente Maduro' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '299dbd1768047acf00733bcbf771d1f0d51b01e6';
-- brands|Aruhiba|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Aruhiba 是阿鲁巴的雪茄，别无其他：Benjamin Petrocchi 出身种豆人家，在同一片地上种下烟草，并开始卷制。一份旅行名录说自2005年起，2026年的游客数着二十一年；雪茄媒体和本地媒体都没有给出别的日期。作坊在诺德，棕榈滩荷兰风车旁，与酒店平齐；奥拉涅斯塔德还有第二家店。

一本荷兰指南描述了下午的情形：两位早上分拣烟叶的女性在卷制，每小时约四十支，浅色叶和深色叶；旅游局补充说，烟株用印楝提取物而非合成农药保护。在一座一百八十平方公里、仙人掌和风的干旱岛上种植、晾制、卷制——不知道茄衣是否来自别处：公司从未写过，2014年一位品鉴者就已指出。

这是一份来自英语和荷兰语旅游资料的词条，并如实说明；公司过去的域名如今是一家与它无关的乌克兰店铺。阿鲁巴以卷制与种植之地进入图集，规模只是一家店。'
 WHERE `name` = 'Aruhiba' AND SHA1(TRIM(`history`)) = '50778a7446cce6a5257b86cd439cbfa923fa75ba';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Aruhiba' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '50778a7446cce6a5257b86cd439cbfa923fa75ba';
-- brands|Asylum|history|zh — 公司名拉丁化；序数
UPDATE `brands` SET `history_zh` = 'Asylum 是 CLE 的另一半。Tom Lazuka 于 2012 年与多年好友 Christian Eiroa 一同创办，正是后者以自己首字母创立 CLE 的同一年。

生产分处两国。主体出自埃斯特利的 NACSA（Nicaragua American Cigars），其余来自洪都拉斯丹利的 Aladino 工厂。本条目归入尼加拉瓜，是因为本图集按主要产地归类——而它把另一处写明，而非略去。

丹利那座工厂值得单独一句：它原是一座电影院，属于 Christian Eiroa 的祖父。它也是首批通过 Bayer CropScience 认证的烟草设施之一。

这个品牌以超大规格出名——Asylum 13 的环径可达少有品牌敢做的尺寸——而价格却并不随之飞涨。这是一种明确的取向，与 CLE 的家族传承气质正相反，尽管两者出自同一双手。'
 WHERE `name` = 'Asylum' AND SHA1(TRIM(`history`)) = 'd7f15217aef78cd43becd0e6f81f16e28259d472';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Asylum' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'd7f15217aef78cd43becd0e6f81f16e28259d472';
-- brands|Atabey|history|zh — 名称拉丁化；序数
UPDATE `brands` SET `history_zh` = 'Atabey 取名自泰诺人的母神——大安的列斯群岛首批居民所奉的、掌管淡水与丰饶的女神。这个选择道出了它的抱负：追溯到古巴之前、西班牙之前，回到烟草被认为的源头。

它的创造者 Nelson Alfonso 是一位古巴艺术家，多年为 Habanos S.A. 做设计——正是他构思了 Cohiba Behike 的视觉形象，那支雪茄的价格，为古巴烟草业划下了一道断裂。2012年，他在哥斯达黎加创立 Selected Tobacco，走到了另一侧：不再为别人的雪茄做外衣，而是做自己的雪茄。

Atabey 产量极小，其尺寸都取着仪式性的名字——Divinos、Brujos、Delirios、Ritos。风格柔至中度，结构极为讲究，带着一种在哈瓦那之外少见的细腻：雪松、奶油、白花，绵长的余味与力度无关。

这是本图集中价格居首的雪茄，也是极少数其作者来自绘图而非田间的雪茄之一。'
 WHERE `name` = 'Atabey' AND SHA1(TRIM(`history`)) = 'a66ac83ace8ea8c3ae25f1bc29b30b1ecb9bdcae';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Atabey' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'a66ac83ace8ea8c3ae25f1bc29b30b1ecb9bdcae';
-- brands|Atatürk|history|zh — 人名拉丁化；术语误用
UPDATE `brands` SET `history_zh` = 'Atatürk 1923是印度尼西亚企业家Jimmy Sartika的品牌，此人绰号Cigar Man，出身光纤与电信行业，据Etwasgenuss.de报道。品牌名称向Mustafa Kemal Atatürk及其宣告成立土耳其共和国的1923年致敬；厂方未说明品牌创立的具体年份。

这款雪茄是在印度尼西亚手工卷制的puro：茄衣为Javano，茄套为Besuki Na-Oogst，产自东爪哇的贝苏基地区，茄芯则完全产自印度尼西亚，据Cigarworld.de报道。厂方未透露卷制工厂的名称。

截至2026年9月，产品目录中仅有一种规格Robusto，自2024年5月29日起在Cigarworld.de发售，同时也在Noblego.de与StarkeZigarren.de有售；Cigarworld.de将其力度评为温和至中等。'
 WHERE `name` = 'Atatürk' AND SHA1(TRIM(`history`)) = 'a6318aa47cda0afec9083e8acdef4c7a5e5b39ef';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Atatürk' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'a6318aa47cda0afec9083e8acdef4c7a5e5b39ef';
-- brands|Baccarat|history|zh — 品牌名拉丁化
UPDATE `brands` SET `history_zh` = 'Baccarat 是个教科书式的例子：行家看不上，却被一代代烟客所钟爱的雪茄。它的特点在于甜味的雪茄帽——一种在切口处涂上温和树胶的工艺。纯粹主义者视之为背叛；而店家知道，它往往是某个人的首支雪茄。

配方本身温和，浅色茄衣，燃烧极为均匀，设计上就不打算冒犯任何人。这是刻意的构造，而非制作的缺陷：这家企业长期坦然承认自己做的是入门雪茄，而这个行业更愿意对内行说话。

图集把这一点说清楚，比忽略它更有价值。美洲大陆相当一部分雪茄烟客都是从它开始的，而在一部关于品味的历史里，这种入门的功能与那些名贵配方同样重要。'
 WHERE `name` = 'Baccarat' AND SHA1(TRIM(`history`)) = '85b5eb4a9cdd3d43e6bfd40d578cf4411b6a396f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Baccarat' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '85b5eb4a9cdd3d43e6bfd40d578cf4411b6a396f';
-- brands|Bahia|history|zh — 工厂名称误作所在
UPDATE `brands` SET `history_zh` = '据thecigarstore.com介绍，Bahia创立于1990年代中期，由Tony Borhani创立。据Gotham Cigars介绍，该品牌及其商号此后被Cigars International收购——后者是Scandinavian Tobacco Group集团旗下的线上零售子公司，该集团由Scandinavian Tobacco Group AB与Swedish Match AB的雪茄及烟斗丝业务于2010年4月26日合并而成。厂方并未点明其工厂的名称。

据Holt''s Cigar介绍，截至2026年9月在CigarPlace有售的Blu系列，仍在尼加拉瓜埃斯特利手工卷制：采用油润的尼加拉瓜Habano sun grown茄衣，属Corojo类型，茄芯取自埃斯特利、哈拉帕与孔德加、陈化五至六年，风味适中，带雪松、烘烤与皮革香气。Maduro系列则采用Connecticut Shade broadleaf茄衣，配多米尼加产的Olor茄套与Piloto Cubano茄芯，部分烟叶也产自尼加拉瓜与厄瓜多尔；据Premium Cigar of the Month Club与thecigarstore.com介绍，有零售商将其归为尼加拉瓜产，也有零售商归为多米尼加共和国产。'
 WHERE `name` = 'Bahia' AND SHA1(TRIM(`history`)) = '081b9798f3d2502fb21355c7ba1aac3cae1ce51e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bahia' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '081b9798f3d2502fb21355c7ba1aac3cae1ce51e';
-- brands|Balmoral|history|zh — 人名公司名拉丁化
UPDATE `brands` SET `history_zh` = 'Balmoral 是一个荷兰名字，印在一支多米尼加雪茄上。杜伊泽尔的 Royal Agio 一个世纪以来生产机制雪茄——Panter、Mehari''s——本图集不收录；但它1990年在多米尼加共和国的圣佩德罗-德马科里斯开了一家工厂，后来在那里手工卷制。优质线来得晚：2014年的 Añejo 18，2015年7月的 Añejo XO——巴西日晒茄衣、多米尼加 olor 茄套、巴西、多米尼加与尼加拉瓜茄芯——当时在美国由 Drew Estate 分销。Agio 的老板 Boris Wintermans 随后签出四手合作的 Serie Signaturas：2018年与 Ernesto Perez-Carrillo 的 Dueto，2019年与 Litto Gomez 的 Paso Doble——本图集的两家公司。

2020年1月，Scandinavian Tobacco Group 收购了 Agio，主要为了它的机制雪茄。随后的5月1日，STG 把 Balmoral 撤出美国市场——销量太低，且无法确定它的任何一条线在2007年2月15日之前存在，那是让雪茄免于 FDA 规则的日期——并把圣佩德罗-德马科里斯工厂改为只做机制雪茄。Balmoral 在别处延续，首先是欧洲，此后在圣地亚哥的 General Cigar Dominicana 卷制。

本图集因此在此收录一个集团品牌，如同 Bolívar Honduras：卷制上是多米尼加的，名字是荷兰的，东家是丹麦的，并且已从行业媒体曾描述它的那个国家消失。词条只收录手工卷制的部分。'
 WHERE `name` = 'Balmoral' AND SHA1(TRIM(`history`)) = '9587bae66253cd2bed87f09d812b1fc8e85a45ac';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Balmoral' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '9587bae66253cd2bed87f09d812b1fc8e85a45ac';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bandolero' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'fdae7c20ec181ecb1ef4c940da459722acc67d1e';
-- brands|Baron Ullmann|history|zh — 人名拉丁字母
UPDATE `brands` SET `history_zh` = 'Georg Baron von Ullmann junior——德国银行世家 Sal. Oppenheim 的后人（据 cigarworld.de 网站介绍）——与合伙人 Francisco Diaz Suarez 在多米尼加共和国购置了一家工厂，在那里手工卷制一款雪茄。据该品牌介绍，这款雪茄起初只是一个私人构想，后来才变成商业项目。公司在多米尼加共和国以 Baron Von Ullmann & Frandisuarez Corp., S.A. 之名注册（见 Justia Trademarks、opencorporates.com），据一位德国雪茄经销商介绍，其雪茄已售卖约二十年——长期以来只作礼品赠送，后来才进入商业流通。查到的资料均未说明工厂所在的城市。

现行产品线将喀麦隆茄衣与多米尼加共和国及尼加拉瓜的茄套、茄芯相配（cigarworld.de）。有据可查的系列共两款：Corona 与 Gran Robusto Edición Limitada。该品牌在德国由多家独立雪茄经销商经销。'
 WHERE `name` = 'Baron Ullmann' AND SHA1(TRIM(`history`)) = '2b52e6e899d8f6e57bc2d74ef38bfa9bac99a13f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Baron Ullmann' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '2b52e6e899d8f6e57bc2d74ef38bfa9bac99a13f';
-- brands|Barrio Viejo|history|zh — 茄套茄芯术语不一致
UPDATE `brands` SET `history_zh` = 'Barrio Viejo是Thorsten Wolfertz于2019年4月29日创立的品牌，其进口商Wolfertz GmbH总部位于德国索林根，据Smokersplanet.de报道。品牌名称源自洪都拉斯丹利同名的老城区，Wolfertz在那里与烟叶种植者会面。这款longfiller正是在当地完全手工卷制而成，采用洪都拉斯茄套与茄芯，外覆深色油亮的尼加拉瓜茄衣；正因这层茄衣，部分零售商将其归入尼加拉瓜雪茄之列。厂方未透露卷制工厂名称，只表示产地为丹利。

2023年1月1日，根据2022年达成的协议，Wolfertz GmbH的业务转由VCF（Vandermarliere Cigar Family）接手，据halfwheel报道；Thorsten Wolfertz继续执掌销售业务，据TRBusiness报道。

截至2026年9月，Cigarworld.de与StarkeZigarren.de的产品目录中均列有Barrio Viejo：单一系列，六种规格，从Half Corona（3.5 x 44）到Churchill（7 x 52），据Cigarworld.de称，力度中等。'
 WHERE `name` = 'Barrio Viejo' AND SHA1(TRIM(`history`)) = '45c2179b6999664c85016ae006f71002090f02e4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Barrio Viejo' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '45c2179b6999664c85016ae006f71002090f02e4';
-- brands|Bauza|history|zh — 卷烟误译；小数点错误
UPDATE `brands` SET `history_zh` = '据Oscar Boruchin介绍，Bauza沿用了一个古巴老牌子的名字，这个牌子从未出口，只在岛内吸食。1990年，Boruchin在迈阿密收购了一家与Fuente家族有关联的小型经销公司，并与Carlos Fuente Sr.一起重新推出Bauza：此后品牌归属Arturo Fuente家族所有，由该家族自行生产，Boruchin则负责其在美国的经销，他本人如是说。据Holt''s Cigar介绍，雪茄在Tabacalera A. Fuente制作——Fuente家族离开尼加拉瓜后，于1980年9月在多米尼加共和国圣地亚哥-德洛斯卡瓦列罗斯开设的工厂；在那里，为其卷制雪茄的，正是卷制Arturo Fuente雪茄的同一批torcedores。

据Holt''s Cigar介绍，现行产品线采用Ecuador Sumatra Sun-grown茄衣，配多米尼加茄套与茄芯，风味呈medium-full，带雪松、谷物、烤坚果与皮革香气，并略带一丝甜感；截至2026年9月，该商家在售两种规格，Petit Corona与Pyramid；同款茄衣的Casa Grande（6.75 x 48）曾在另一家零售商上架，但截至2026年9月已不再有售。'
 WHERE `name` = 'Bauza' AND SHA1(TRIM(`history`)) = '28b24af6cd24721802039164538d8aef98418ecf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bauza' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '28b24af6cd24721802039164538d8aef98418ecf';
-- brands|Belmore|history|zh — maison误作品牌
UPDATE `brands` SET `history_zh` = '据经销商 cigarworld.de 网站介绍，Charles Fairmorn 这家公司可追溯至1972年的美国，此后在德国开设分支，先在汉堡，继而在丁格尔施泰特（图林根）和吕贝克；同一网站称 Belmore 的生产于2001年在多米尼加共和国启动，品牌自2003年起投入销售。专业媒体对这家多米尼加工厂的起源另有说法：halfwheel 在介绍 Kristoff 时提到一家名为 Charles Fairmorn S.A. 的公司，于2000至2001年间在圣地亚哥设立，此后演变为今天的 Tabacalera von Eicken S.R.L.，该厂也为 Kristoff 与 Epic Cigars 卷制雪茄。查阅过的媒体资料均未证实1972年那家美国公司与这家工厂之间的延续关系。

有据可查的产品线共两款：Belmore Connecticut（原名 Clasico），美国浅色康涅狄格茄衣配多米尼加与尼加拉瓜茄芯，经销商称其口感清淡；以及 Belmore Maduro，巴西马杜罗茄衣，风味据称偏甜。该品牌仍在多家经销商的目录中，但近来未见专业媒体对其本身的报道。'
 WHERE `name` = 'Belmore' AND SHA1(TRIM(`history`)) = '836080f3e1ebed35e8638fba2558ba631b2570f4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Belmore' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '836080f3e1ebed35e8638fba2558ba631b2570f4';
-- brands|Bering|history|zh — 品牌人名拉丁字母
UPDATE `brands` SET `history_zh` = 'Bering 是一个属于坦帕的名字。这个品牌于1905年诞生于 Corral, Wodiska y Ca.，地点是伊博城大厂林立的佛罗里达；那时这个街区年产数亿支雪茄，流亡的古巴商号与西班牙企业比邻而作。

坦帕的工厂一直生产到1985年。随后 Swisher 集团买下这个品牌，1990年把制造迁往洪都拉斯，并在丹利建厂，又于2002年将品牌与工厂一并卖给 Nestor Plasencia。因此，Bering 如今属于一个已出现在本图集中的家族——在尼加拉瓜那一侧。

这正是本页把它归入洪都拉斯而非美国的原因：它在那里制造已逾三十年，而这解释了它的味道。

风格是典型的洪都拉斯路数，且属其中十分平易的一档：木质、泥土，燃烧干脆，没有哈马斯特兰配方的力度。产品线涵盖众多且往往偏细的尺寸，这是二十世纪中叶美国习惯的直接遗产。'
 WHERE `name` = 'Bering' AND SHA1(TRIM(`history`)) = 'ceaaeb4e6bf685c9ddfe08cce865616bb8286242';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bering' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'ceaaeb4e6bf685c9ddfe08cce865616bb8286242';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'BerlinCigarMen' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'ad3d801c0d92a9bb0571cab09d324d42e94048c7';
-- brands|BIN Cigar|history|zh — 人名拉丁字母
UPDATE `brands` SET `history_zh` = 'BIN Cigar——PT Boss Image Nusantara——2013年诞生于东爪哇的烟草之城任抹，由已故的 Abdul Kahar Muzakir 发起，他从事烟草五十年，想把印尼雪茄推向国际。他的赌注先是农业的，然后才是商业的：在任抹驯化一种古巴种子的品种——哈瓦那——让它在东爪哇的土地上生长，当地媒体说它扎了根并保留了本色。

此前任抹主要出口原叶，即全世界买来做茄衣的 Besuki Na-Oogst 烟叶；BIN 自己手工卷制，以自己的名字销售。公司称出口十二个国家，并依靠二十七个印尼使馆推广；2025年瞄准美国。词条把这些数字归于发布它们的印尼媒体和公司本身。

BIN 属于任抹，同属任抹的还有 Golden Djawa，以及 Villiger 和 Burger Söhne 的工厂，它们的瑞士词条已点名。'
 WHERE `name` = 'BIN Cigar' AND SHA1(TRIM(`history`)) = '68f8f4374d3a296e3a93e61ee5b6fadc8797a1ff';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'BIN Cigar' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '68f8f4374d3a296e3a93e61ee5b6fadc8797a1ff';
-- brands|Black Label Trading Co.|history|zh — 结尾句语义不通
UPDATE `brands` SET `history_zh` = 'Black Label Trading 既是烟草之家，也是艺术家之家。James 与 Angela Brown 于 2013 年在尼加拉瓜创办，所有标环均由 James 亲手绘制。

2015 年，创办两年之后，他们在埃斯特利开设了自己的工厂：Fábrica Oveja Negra——「黑羊」。厂房刻意设计得更像艺术家工作室而非生产线，这并非广告辞令：这一取向在规模与节奏上都看得见。

一切均为手工卷制。烟叶来自尼加拉瓜、洪都拉斯、墨西哥圣安德烈斯与厄瓜多尔。

各系列名字构成一套连贯的语汇：Last Rites、Bishops Blend、Benediction、Santa Muerte、Salvation、Deliverance、Royalty。这是一套丧葬与礼拜的图像学，一直贯彻到设计的尽头——而这正是这家公司在人们点燃任何东西之前就已与众不同之处。'
 WHERE `name` = 'Black Label Trading Co.' AND SHA1(TRIM(`history`)) = 'e145f1dc6eb17cab7f157d25ab36a31432e4b2ec';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Black Label Trading Co.' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'e145f1dc6eb17cab7f157d25ab36a31432e4b2ec';
-- brands|Blackbird Cigar Co.|history|zh — 人名拉丁字母
UPDATE `brands` SET `history_zh` = 'Blackbird 是一家决定以鸟命名一切的多米尼加工厂，这与其说是巧思不如说是体系：每款配方都以一种鸟为名——Crow、Rook、Jackdaw、Finch、Cuco、Unkind、Nest、Superb、Cactus Wren——名字先于烟标道出性格。

Jonas Santana 2016年与兄弟共同创办。他出身 Tabacalera El Artista，坦博里尔的一家工厂，在那里学得手艺，也学得此后萦绕于心的一件事：品质控制。工厂名为 Blackbird Dominicana；公司设在佛罗里达州海厄利亚，自行分销——本图集常见的是反过来的模式，品牌在迈阿密、制造托付他处。

把它与本图集其余部分联系起来的是烟叶。Santana 不在市场上采购：他的全部烟草来自第四代种植者、Tabacalera Palma 掌门人 Jochy Blanco，本图集载有其词条。一家卷制，一家种植——与圣地亚哥的 Reyes 家族同样的分工，只是分在两个家族而非一个。'
 WHERE `name` = 'Blackbird Cigar Co.' AND SHA1(TRIM(`history`)) = '2b4035353ae4798e413dff1ffd03e80423ecf301';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Blackbird Cigar Co.' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '2b4035353ae4798e413dff1ffd03e80423ecf301';
-- brands|Blanco Cigars|history|zh — 人名拉丁字母
UPDATE `brands` SET `history_zh` = 'Blanco 是一桩表亲之间的事。家族来自古巴烟草大省比那尔德里奥，在那里与 Plasencia 家族比邻——Blanco 家说两家相识已八十年，如今正是 Plasencia 家在埃斯特利为他们卷制雪茄。本图集因此把它归入尼加拉瓜——烟叶成为雪茄之处；柜台则在佛罗里达州塞米诺尔。

公司创于1998年。Cesar A. Blanco 与兄弟 Francisco、儿子 David 共同创办，接续老 Cesar 在二十世纪初奠定的基业。David Blanco 是调配师：他调配，表亲们卷制——在丹利与埃斯特利那些从种植到制造一以贯之的工厂里。

把这家公司说得透彻的系列，叫 Liga Exclusiva de Familia——家族专属配方。它原是兄弟俩的私藏，后来才出售，有两个版本、两种性情：Cesar 偏爱奶油般的康涅狄格阴植茄衣，David 偏爱更粗犷的宾夕法尼亚阔叶马杜罗。Blanco Nine 是爱好者知道的另一个名字。'
 WHERE `name` = 'Blanco Cigars' AND SHA1(TRIM(`history`)) = '424c5ebc4d3a0fa5acb2e15afd2afc8f993f4b0d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Blanco Cigars' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '424c5ebc4d3a0fa5acb2e15afd2afc8f993f4b0d';
-- brands|Bock y Ca.|history|zh — 人名拉丁字母；卷烟厂
UPDATE `brands` SET `history_zh` = '据 Villiger 的博客介绍，移居古巴的德国人 Gustav Bock Müller（1837-1910）于1865年在哈瓦那创立了 El Águila de Oro 雪茄厂；Bock 这个名字自1888年起便用作品牌名并与他联系在一起，Villiger 方面还将1880年发明雪茄环的功劳归于他。Bock 于1910年去世后，这一品牌逐渐式微，作为古巴品牌就此消失。Heinrich Villiger 重新发掘了这一名字，于1999年通过旗下子公司 El Mundo De Tabaco 将其作为多米尼加雪茄品牌重新推出，该品牌方面称其在2008年进行过一次品牌革新。此后，Bock y Ca. 一直在 ABAM Cigars S.R.L. 卷制，这家工厂由流亡古巴人 Matías Maragoto 主持，他自1996年起携兄弟 José 与妻子 Aidee 定居多米尼加共和国，工厂位于圣多明各北区维拉梅拉的工业自由贸易区——这家工厂也为 Villiger 卷制 La Flor de Ynclan、1888 与 Corrida；La Libertad 曾在这里卷制，之后转到埃斯特利，一款新配方于2022年1月在那里展示。

2024年，Villiger 以限量版 Bock Renacimiento 25 Años 庆祝品牌复兴二十五周年，该款由 ABAM 卷制（halfwheel）。据 cigarworld.de 介绍，现行产品线包括 Corona Tubo、Robusto、Panetela 与 Churchill 几种规格，印尼茄套配多米尼加与尼加拉瓜茄芯，被形容为一款中等浓度、带有多米尼加共和国典型奶油般甜润口感的雪茄（Villiger）。'
 WHERE `name` = 'Bock y Ca.' AND SHA1(TRIM(`history`)) = '2824c5ed9be8ff7bccc88489ae2bc1647832a405';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bock y Ca.' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '2824c5ed9be8ff7bccc88489ae2bc1647832a405';
-- brands|Bohekio|history|zh — 日期格式不统一
UPDATE `brands` SET `history_zh` = 'Bohekio 是海地公司 Supreme Tobacco S.A. 旗下的品牌，据品牌方称，该公司由三位朋友于2015年创立（据 Neptune Cigar 和 Cigarcentury 称为四位）。品牌方称其在中央高原的米尔巴莱种植烟叶，并在当地灌溉土地、培训种植者，同时自称是海地唯一的雪茄制造商。雪茄在其自有工厂 Supreme Tobacco S.A. 手工卷制；品牌方没有说明该工厂所在的市镇。

据 Cigar Coop 称，Bohekio 是该公司的首款高端雪茄，于2021年在 PCA 展会上推出：茄套和茄芯来自海地，另有多米尼加 habano 茄衣，共四种规格（Neptune Cigar 称该品牌始于2015年）。品牌方取此名是为纪念哈拉瓜酋长。随后是 Colors，于2022年的展会上加入，再后是 Maduro，据 halfwheel 称，于2024年初发货给零售商，其茄衣据品牌方称来自厄瓜多尔，据 Cigarcentury 称来自多米尼加。Liga 2 by Bohekio 由 Neptune Cigar 以 bundles 形式销售，搭配 habano 茄衣、美国茄套，以及来自巴西和多米尼加共和国的茄芯；Neptune 称其在海地卷制。

2026年10月，Neptune Cigar 的目录中有四个系列（Bohekio、Colors、Maduro 和 Liga 2），Black Box Cigar Club 则列出 Colors 和 Maduro，均缺货。品牌方列出了位于海地、美国（分销商：City of Palms Cigar Distribution）和德国（Cigar World）的经销商；其网站上标有日期的文章，末篇的日期为2025年1月31日。'
 WHERE `name` = 'Bohekio' AND SHA1(TRIM(`history`)) = 'baad3d1b5e8274ea49b1ee948a63ba262d8961a5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bohekio' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'baad3d1b5e8274ea49b1ee948a63ba262d8961a5';
-- brands|Bolívar Honduras|history|zh — 人名公司拉丁字母
UPDATE `brands` SET `history_zh` = '这个名字来自古巴，品牌于二十世纪初诞生于此。非古巴版本则是洪都拉斯的：它在丹利的 HATSA（洪都拉斯美洲烟草）卷制，那是 Villazon 家族在该国经营的两家工厂之一。General Cigar 于 1997 年以 8140 万美元收购了 Villazon。

Cofradia 配方取自 Villazon 的另一家工厂之名，出自 HATSA 各厂生产总监 Estélo Padrón 之手：厄瓜多尔苏门答腊种茄衣，美国康涅狄格宽叶茄套，洪都拉斯与尼加拉瓜茄芯。

2024 年 10 月，Scandinavian Tobacco Group 把这个品牌连同 El Rico Habano 与 Helix 一起撤出了价目表。丹利的工厂仍在运转，这枚茄标却不再制作。本条目从此是一份档案条目。'
 WHERE `name` = 'Bolívar Honduras' AND SHA1(TRIM(`history`)) = '7c62edca381518734bf0a83cbb92a5060e9e6ac4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bolívar Honduras' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '7c62edca381518734bf0a83cbb92a5060e9e6ac4';
-- brands|Bombay Tobak|history|zh — 人名拉丁字母；茄芯
UPDATE `brands` SET `history_zh` = 'Bombay Tobak 是 Mel Shah 的公司，他是加州棕榈泉 Fame Lounge 的老板——一家雪茄、葡萄酒与啤酒吧。他2014年5月成立公司，以 MBombay 品牌在全国分销原本为自家酒廊定制的雪茄。名字道出创始人的印度出身，各系列亦然：2016年7月的 Gaaja 来自 gaja，印度教文化中的大象；Kēsara 是藏红花；Mōra 是孔雀。

一切都在哥斯达黎加普里斯卡尔的 Tabacos de Costa Rica 卷制——本图集在 Vegas de Santiago 词条描述的那家工厂（Casdagli 写道，它当时以此名为人所知），它也卷制 Selected Tobacco、Villa Casdagli、Malekö、Skull 77 和 Zechbauer Royales。Cigar Coop 称 Andrés León 为该厂业主兼经营者，并把 Bombay Tobak 与 Selected Tobacco 一同算作出自该厂的品牌。哥斯达黎加在此依然是作坊之国：烟叶来自别处——厄瓜多尔、多米尼加共和国、秘鲁、尼加拉瓜。

厄瓜多尔康涅狄格茄衣的 Classic 系列柔和程度为各系列之首；2019年的 M.Estelí 浓烈程度为公司各系列之首，厄瓜多尔 Habano 2000 茄衣配以尼加拉瓜为主的茄芯。一支在哥斯达黎加卷制的雪茄冠以埃斯特利之名，欠的是烟叶而非作坊——词条特意说明，因为本图集的规则是卷制地。'
 WHERE `name` = 'Bombay Tobak' AND SHA1(TRIM(`history`)) = 'c1a64acbe7a57c9fca124841f32ac4e2f5a6d31b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bombay Tobak' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'c1a64acbe7a57c9fca124841f32ac4e2f5a6d31b';
-- brands|Bongani|history|zh — 人名公司拉丁字母
UPDATE `brands` SET `history_zh` = 'Kamal Moukheiber 生于黎巴嫩，毕业于 HEC Paris，曾在伦敦从事投资银行业十五年——Credit Suisse、Lehman Brothers——后于 2013 年因一项房地产项目定居马普托。灵感来自首都一家咖啡馆：他看着客人抽雪茄，心想非洲种烟草，却不卷雪茄。

首支雪茄于 2016 年 12 月问世。Moukheiber 请来一位曾在 General Cigar 负责 Macanudo 的多米尼加雪茄大师，培训莫桑比克女卷制师；首批学员 2017 年结业，第二批正在培训中。位于马普托拜沙区的工坊月产约一万支，另一座新厂正在自由贸易区兴建。

烟叶由契约农户在莫桑比克以多米尼加种子种植。茄衣来自喀麦隆——本图集将其列为茄衣产地——雪茄则在加纳产的雪松木片中陈化。产品销往莫桑比克、南非、肯尼亚、尼日利亚、刚果与科特迪瓦，后者的地址本图集亦有收录。

人们常说 Bongani 是首支「完全非洲」的雪茄。其创办人并未如此宣称：他主张以品质为准的选料，无论来自非洲或他处，茄芯亦兼用非洲与非非洲烟叶。至于品牌名，在祖鲁语中意为「心怀感恩」。'
 WHERE `name` = 'Bongani' AND SHA1(TRIM(`history`)) = '9ef23c6450a282f6cdc06a7f4cf3d1c85ca5f8e4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bongani' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '9ef23c6450a282f6cdc06a7f4cf3d1c85ca5f8e4';
-- brands|Boutique Blends|history|zh — 人名拉丁字母
UPDATE `brands` SET `history_zh` = 'Rafael Nodal 于 2011 年创立 Aging Room。雪茄由 José « Jochy » Blanco 在多米尼加共和国坦博里尔的 Tabacalera La Palma 工厂制作，但 La Bohème、Quattro Nicaragua 与 Pelo de Oro 除外，它们在尼加拉瓜的 A.J. Fernandez 卷制。该公司旗下还有 Swag。

Nodal 的名字在本图集别处已经出现过：正是他为 Altadis 重新调整了 Trinidad Santiago 的配方——而那款雪茄同样出自 Jochy Blanco 之手。'
 WHERE `name` = 'Boutique Blends' AND SHA1(TRIM(`history`)) = '2829a50841eb79764311c3cb5fb078003723e1fa';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Boutique Blends' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '2829a50841eb79764311c3cb5fb078003723e1fa';
-- brands|Brun del Ré|history|zh — 人名拉丁字母；排名补回
UPDATE `brands` SET `history_zh` = 'Brun del Ré 是一位在哥斯达黎加转做雪茄的瑞士钟表商的公司。长期定居该国的 Carlo Corazza 1999年戒了烟，2001年与朋友在古巴发现雪茄，开了一家雪茄吧，2006年与合伙人 Sam Capuano 决定自己制作——他说当时像动画片里那样向合伙人下了战书。2007年他在圣何塞找到一家工厂；如今工厂在埃斯卡苏，由家族经营，约十五名员工，月产两万五千到三万支。名字取自他的祖母，以及一个两百年历史的瑞士家徽。

它与普里斯卡尔一道，是哥斯达黎加雪茄的另一个中心，行业媒体称之为该国知名度居首的公司。各系列名为 Gold、Premium、Colonial、1638，尤其是 1787 Libertad——Corazza 首支完全用哥斯达黎加烟叶制作的雪茄，烟叶来自该国南部的一位种植者；年份指向哥斯达黎加尚属危地马拉王国、供应抢手烟草的年代。公司销往二十二个国家，主要在欧洲，并表示不想在数量上扩张。

本图集在此收录一家既卷制、又为一条线使用完全产自哥斯达黎加、来自该国南部一位种植者的烟叶的公司——在一个作坊之国里的例外，普里斯卡尔的 Vegas de Santiago 称，就其一部分烟叶而言也是如此。'
 WHERE `name` = 'Brun del Ré' AND SHA1(TRIM(`history`)) = 'f2c88adb1e5753b7bafb5d155da4d3533ead3280';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Brun del Ré' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'f2c88adb1e5753b7bafb5d155da4d3533ead3280';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bugatti' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '8d7e50cbd92af500a7d49e666886a6dcd5f287cd';
-- brands|Burger Söhne|history|zh — 城市误译；段落重复
UPDATE `brands` SET `history_zh` = 'Burger 家族于 1864 年在瑞士开始经营雪茄与烟斗丝生意。

1988 年，该家族收购了位于德国 Lübbecke 的 Dannemann GmbH，成为全球第三大雪茄生产商。而 Dannemann 这个名字本身来自巴西：1851 年生于不来梅的 Gerhard Dannemann 于 1872 年移民，1873 年在巴伊亚州圣费利克斯开办工厂，起初仅六名员工。他后来成为该地区的大实业家之一；企业于 1954 年破产，名字却留了下来。

集团如今拥有 Dannemann、Ritmeester 与 Al Capone。本图集收录 Dannemann，归于巴西——它诞生的土地。

集团在东爪哇任抹也有一座工厂，印尼媒体把它与 Villiger 的工厂并列为该城两家国际级雪茄厂。全世界买来做茄衣的 Besuki Na-Oogst 烟叶就在当地为瑞士卷制——本图集在此说明，并在 BIN 和 Golden Djawa 词条讲述任抹。'
 WHERE `name` = 'Burger Söhne' AND SHA1(TRIM(`history`)) = '8ee6dd2e62bb2689d8dd2318001dd190ad9cc0b7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Burger Söhne' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '8ee6dd2e62bb2689d8dd2318001dd190ad9cc0b7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Butera' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '146c8af153102f1ff6f3c1be5c42405a1c8f5b64';
-- brands|Byron|history|zh — 品牌人名拉丁字母
UPDATE `brands` SET `history_zh` = 'Byron 是 Selected Tobacco 古典的一面，其名字来自一个旧品牌——Nelson Alfonso 选择让它复活，而不是凭空创造一个；对那些希望把自己置入某种延续之中的企业来说，这已是常见做法。

Atabey 走细腻，Byron 则走开阔：宽尺寸、更厚实的配方，香气偏皮革、可可与名贵木材。产品线按「时代」组织——每个系列指向雪茄史上的一个世纪，并配以据称与之相应的烟叶与工艺。

这种带布景感的立意，与其作者的来路一致：Alfonso 出身于图像与叙事，而非农学；他的品牌在被点燃之前就已经在讲述。话虽如此，内容跟得上——结构无可指摘，产量始终极小。

与 Atabey 一样，Byron 的售价把它置于市场的顶端，每个国家只有寥寥数家店有售。'
 WHERE `name` = 'Byron' AND SHA1(TRIM(`history`)) = '3a9b84d98335d8291a0fa5b7382b4d7f44b1fe57';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Byron' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '3a9b84d98335d8291a0fa5b7382b4d7f44b1fe57';
-- brands|Cabal Cigars|history|zh — 人名拉丁字母；茄芯
UPDATE `brands` SET `history_zh` = 'Cabal——创始人说，是「密谋团」之意，指为同一目标聚在一起的人——是 Chris Arolfo 的品牌，他在得克萨斯州韦伯斯特经营 The Smoke Ring 雪茄吧，2013年创立此品牌。他找到 Davidoff 烟草大师之子 Hendrik Kelner Jr.，在圣地亚哥的 Kelner Boutique Factory——本图集载有其词条——近两年试验、二十一款配方，做出一支以博瑙茄衣（茄标上少见的多米尼加烟叶）配秘鲁与多米尼加茄套、尼加拉瓜、宾夕法尼亚与多米尼加茄芯的雪茄。第19号配方因与 Cabal 风格差异太大，成了小批量的 Esoteric。

Cabal 由此成为本图集第四个出自 KBF 的品牌，继 Casdagli、Principle 和工厂自有的 The 73 之后。它的新品 Initiative 出自另一家多米尼加工厂——Hostos Fernández Quesada 的 Tabacalera La Isla——厄瓜多尔 Colorado corojo 茄衣、尼加拉瓜茄套，一家零售商称之为公司六年多来的首次新品。

于是两支雪茄之间是六年的沉默：行业媒体自2015年起未再描写这家公司，词条对其后续的了解来自零售商和它的网站。本图集写它，因为两家工厂都有名字，并说明自己不知道的部分。'
 WHERE `name` = 'Cabal Cigars' AND SHA1(TRIM(`history`)) = 'ad7b5741fdba79927bf774b84e3067b30a3364a8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cabal Cigars' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'ad7b5741fdba79927bf774b84e3067b30a3364a8';
-- brands|Caldwell Cigar Co.|history|zh — millésimes误译为份额
UPDATE `brands` SET `history_zh` = 'Caldwell Cigar Co. 生于一次决裂。Robert Caldwell 离开 Wynwood Cigars，于 2014 年以自己的名字在 IPCPR 展会上重返这一行。

他与多米尼加共和国 Tabacalera William Ventura 的 William 和 Henderson Ventura 合作。这又是一家没有自有工厂的公司——正是尼加拉瓜那一批所揭示的模式——但有一点不同：Caldwell 的配方围绕稀有烟叶与陈年年份烟叶构建，而非围绕一个可复制的配方。

首发系列有三款配方，名字彼此呼应：The King is Dead 与 Long Live the King。第三款 Eastern Standard 并不在计划之内——有人把一批特别的康涅狄格烟叶交到 Caldwell 手上，试制成功，于是它进入了目录。

这样的做法解释了这家公司的规模：无法二次取得的东西，也就无法大量生产。

2022年9月26日，一场火灾烧毁了 Tabacalera William Ventura；生产转往卫星作坊与 El Maestro 继续，同名新厂于2024年3月重开。这家工厂有自己的词条：Tabacalera William Ventura。'
 WHERE `name` = 'Caldwell Cigar Co.' AND SHA1(TRIM(`history`)) = 'e36800c9728c6d4687b7c30f2f1431b4562b155d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Caldwell Cigar Co.' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'e36800c9728c6d4687b7c30f2f1431b4562b155d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Canaritos' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'c54ee6d4d716f9907f142538a40871cbe84e949d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Canned Heat' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'd3b616fb2349917779d33d42c03650978eb8f337';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO America' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'e1bb37ca2902c18a87425f059aa4e67e5f91451a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO Black' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '9ad79bcbd23b636dfbb661f1d031ef5da9827129';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO Cameroon' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '347fddff85743e67462b049e16e5cb2c09a3914a';
-- brands|Caoba|history|zh — 城市名未译，Santo Domingo
UPDATE `brands` SET `history_zh` = 'Caoba于1992年诞生于圣多明各，由Don Julio Pérez González创立，他是一名西班牙人，娶了一位多米尼加女子，此前经营一间桃花心木雕刻工坊——caoba在西班牙语中意为桃花心木，也是该国的国树：据该品牌称，品牌名即由此而来。起初的工厂设于首都东部的Villa Faro；下一代经营者其后将其迁至圣多明各的殖民区（Ciudad Colonial），即如今所在地（据humoytabaco.com，西班牙语资料）。Stogiepress称该厂为垂直整合型工厂，在Cibao河谷的Tamboril拥有自己的烟田。

据Humo y Tabaco称，产品目录中共有约十个系列；其中两个系列见诸专业媒体报道。据Stogiepress称，Diamante口感浓郁，采用墨西哥San Andrés茄衣，搭配全部为多米尼加烟叶的茄套与茄芯。相反，Oro采用厄瓜多尔Connecticut Shade茄衣，搭配多米尼加茄套与茄芯，口感更为温和（据Leaf Enthusiast）。该品牌曾于2019年IPCPR展会亮相（据halfwheel），目前仍在正常销售中。'
 WHERE `name` = 'Caoba' AND SHA1(TRIM(`history`)) = '7f2da9e68f6de42f2c3224627ecf7f17ca9b3f52';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Caoba' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '7f2da9e68f6de42f2c3224627ecf7f17ca9b3f52';
-- brands|Capadura|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Oskar Nausch出生于德国伍珀塔尔，多年来定居多米尼加共和国，主持着圣地亚哥-德洛斯卡瓦耶罗斯的一家小型工厂 Tabacalera Don Esteban。与他合作近二十年的德国雪茄经销商 cigarworld.de 将 Capadura 介绍为Nausch本人的品牌，在该厂手工卷制，自2021年6月起在德国销售，此前先在瑞士与奥地利起步。然而一家供应商门户网站（eldiquetrading.com）将 Capadura 列入 Don Esteban 旗下产品之列，与 Samana、Cibao 以及众多为第三方定制的私牌产品并列，并未说明 Capadura 是否属于同类私牌，还是Nausch本人的独立创作；因此，其确切归属——究竟是独立品牌，还是经销商托付的目录品牌——在查到的资料中并无定论。

据 cigarworld.de 介绍，在售产品线共有十个品种，其茄芯混有巴西烟叶；经销商将其形容为口感均衡，适合中等浓度雪茄的爱好者。查阅过的资料中没有任何单一系列按名称、茄衣或浓淡被记录在案；因此本词条仅以此整体描述为准。'
 WHERE `name` = 'Capadura' AND SHA1(TRIM(`history`)) = '9fff1d185a2a8d703528fe4cc4a42f8b2ac8f6b2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Capadura' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '9fff1d185a2a8d703528fe4cc4a42f8b2ac8f6b2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Capitol' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'dd19335efd3a0eeaaf9c977cf5f1a70a004ee7a7';
-- brands|Casa 1910|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Casa 1910 以墨西哥革命之年为名，整个目录都由此而来：首支雪茄 Cuchillo Parado 是起义爆发的奇瓦瓦州村庄；Tierra Blanca、El Ébano 是战役；Soldadera 是参战的女性。公司2021年诞生，在 PCA 展会亮相，由三位合伙人创立——曾在墨西哥古巴雪茄分销商任职、毕业于 Habanos 学院的Manolo Santiago，以及Jamie Baer和Serge Bollag。宗旨是改变人们对墨西哥雪茄的看法，用圣安德烈斯谷的纯料——本图集在 Te Amo、Casa Turrent 和 Santa Clara 词条讲过这片土地。

词条所缺的正是媒体所缺的：公司不说哪家圣安德烈斯图斯特拉的工厂在卷它的雪茄，行业媒体2026年3月白纸黑字写明了这一点。本图集不为工厂未点名的公司立词条；此处沿用对 Jas Sum Kral 的例外——沉默有据可查，不是杜撰——并记下已点名的部分：2023年的 Soldadera 在多米尼加共和国的 Tabacalera La Isla 卷制，Cavalry 也在墨西哥以外；两者2026年停产，只留墨西哥产品。

因为公司成长很快：2025年降价并融资三百万美元，外聘首席执行官Rob Maneson，2026年3月目录重组——所有系列统一三种尺寸，El Ébano 预计夏季上市——美国连锁店 Smoker Friendly 入股。一家风险资本的公司，置身于家族行业；本图集如实说出而不评判，并等待工厂的名字。'
 WHERE `name` = 'Casa 1910' AND SHA1(TRIM(`history`)) = '4de511a6977b729297dadfa7a1bb0ca19a9579d5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa 1910' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '4de511a6977b729297dadfa7a1bb0ca19a9579d5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa Cuevas' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '32b962ae1a81c6e877b036a26245603be1176a5c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa Culinaria' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '2b4784d6714b1c4aa0fc64118d98401ae19d968b';
-- brands|Casa de Alegria|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Casa de Alegria S.A.于2004年10月在埃斯特利成立，创始人是学心理学出身、后成为总经理的Maritza Molina，以及来自德国古默斯巴赫、后成为首席调配师的地理学家Ralf Westerwick——据德国经销商Cigarworld介绍，这是两人共同的职业转型。该品牌在自有的埃斯特利tabacalera中卷制该经销商所称的手工优质longfiller雪茄。Edición Limitada Rico和Edición Limitada Suave两条产品线截至2026年仍在多家德国雪茄专卖店的目录中。

在同一家工厂，Ralf Westerwick还以个人名义推出了Rosa Nicaragua品牌——据Cigarworld说明，该品牌并非Casa de Alegria自身所有，并提到Westerwick与这家经销商管理层之间存在私人关系，该经销商会定期购买固定数量的产品。该品牌由三条产品线组成：Jalapa，茄衣为印尼产、口味清淡；Estelí，采用尼加拉瓜烟叶、风味更浓烈；以及Connecticut，茄衣呈金黄色、口感绵密。该品牌宣称遵循公平贸易做法——即时收购烟叶、工资据称高于平均水平。

2026年10月，Tabacalera Casa de Alegria还卷制La Chaveta，这是Patricia与Marc Benden的品牌，二人管理Cigarworld：该品牌于2025年夏末问世，据Cigarworld称仅在其网上商店出售，由Ralf Westerwick在Estelí卷制，据Smokersplanet.de称。其White系列口感温和，茄衣为Connecticut Shade；Black系列力度更强，茄衣为深色Criollo类型；两者均以来自Estelí、Jalapa与Condega的尼加拉瓜烟草作茄芯，规格有Minuto、Perla、Robusto与Toro。'
 WHERE `name` = 'Casa de Alegria' AND SHA1(TRIM(`history`)) = '9c88e2a5de8a07e85b0cb79e2b04bfdbf6045ddc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa de Alegria' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '9c88e2a5de8a07e85b0cb79e2b04bfdbf6045ddc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa de Garcia' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '76028c1ae90536b3bb4ef5a7f5fb318382ce7d8c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa de Torres' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '47be8d21446d33cb64ab63d61ef12379aa911ba3';
-- brands|Casa Turrent|history|zh — 姓氏与品牌名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Turrent家族自二十世纪初就种植圣安德烈斯的烟叶，长期以来更以种植者而非制造者闻名：他们的茄衣包裹着世界各地的雪茄，往往挂着别家的烟标。Casa Turrent正是这个家族终于为自己的作品署名的系列。

这家企业发挥着一项罕见的优势——拥有自己的烟叶、库存多个年份，并能围绕一种自己从头到尾掌握的烟叶来构建配方。其以明确采收年份为基础的年份系列，是古巴之外少见的此类尝试。

以整个大陆的尺度衡量，墨西哥仍是低调的生产国，产量被邻国远远压过。它以独特性作为补偿：没有别的国家出产这种茄衣，而墨西哥风土的全部价值，就在这片叶子里。'
 WHERE `name` = 'Casa Turrent' AND SHA1(TRIM(`history`)) = '046090566857ea41cb78ad1ddc844b207c0a4344';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa Turrent' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '046090566857ea41cb78ad1ddc844b207c0a4344';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casagranda' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '4ce0ae5216d06ef8653123b34194ff21169b61b4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Castillo de Reyes' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '9ab1392b2412b1da5098b9a3f29650b741229be9';
-- brands|Cavalier Genève|history|zh — 人名与Davidoff改拉丁字母
UPDATE `brands` SET `history_zh` = 'Cavalier Genève 以一座它从未在此制造过任何东西的城市为名，本图集按其卷制之地归类：丹利。Sébastien Decoppet在日内瓦长大，离Davidoff总部咫尺之遥，二十岁上下在一家Davidoff店里抽了首支雪茄。他自称不是坐办公室的人；他去洪都拉斯学手艺，那时还不会说当地的语言。

公司创立于2016年，它拥有多数出于同样冲动而生的品牌所没有的东西：自己的工厂，丹利的 Fábrica Centroamericana de Tabaco。辨认它的标志是每支雪茄上的一枚二十四K金箔菱形——先于烟标的署名。

目录分为三个家族。以 White Series 为核心的 Original Diamond Series；区域限定——Black II、Viso、Prospektor；以及较新的系列：Inner Circle，纪念创始人1956年出生的父亲的 Domaine Rouge，还有三种茄衣、三种尺寸、街头艺术标签的 Tres Delincuentes。Decoppet承认早年的一个错误：不了解美国市场便经由经销商进入。他的纠正是从中美洲亲自掌管业务。

2026年的十周年有两支纪念雪茄。创始人谈到美国梦；这是一个日内瓦人对一家洪都拉斯工厂说的话，本词条如实转述，不据为己见。'
 WHERE `name` = 'Cavalier Genève' AND SHA1(TRIM(`history`)) = '3ca18bf7faa2df4417b078221f9f5b758304676a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cavalier Genève' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '3ca18bf7faa2df4417b078221f9f5b758304676a';
-- brands|Chaba|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Chaba——Charutos da Bahia——是Fernando Fraga在巴伊亚北部阿拉戈伊尼亚斯的公司，是 Suerdieck 留下的、比 Suerdieck 活得更久的一块。Fraga在那里度过了职业生涯；当曾雇用两千多人的马拉戈吉佩大厂于2000年关闭末一个单位时，他继承了其中一些品牌，并让它们在自己1998年10月28日注册的公司里延续。

2012年的经济媒体讲了后来的事：八十名员工；2010年卫生监管机构因注册不合规查扣产品，工厂关闭，次年以二十五人重开。Fraga当时七十三岁。2017年的巴伊亚工厂名单仍把它算在阿拉戈伊尼亚斯。

此后再无消息：2012年之后没有任何被引用的报道，企业登记显示它2026年仍在同一地址、同一管理人名下处于活跃状态。词条在该用过去时的地方用过去时，不假装知道那里是否还在卷制——这是图集对无法核实的公司的规则。'
 WHERE `name` = 'Chaba' AND SHA1(TRIM(`history`)) = '2e409f3f9780aea7bbfa49288c92c45fdcd28983';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Chaba' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '2e409f3f9780aea7bbfa49288c92c45fdcd28983';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Charatan' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'bb088c3d3859a6eda2831fabe17f40cf4f5ad2b4';
-- brands|Chateau Diadem|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = '据 halfwheel 早前一篇报道，Chateau Diadem 由定居多米尼加共和国的瑞士表亲Thierry Farah与Emily Sahakian于2020年创立；同一网站较近的一篇报道，围绕 Certitude 系列的推出，则将创立时间定在2022年，所查阅的资料并未调和这两种说法。该品牌在圣地亚哥以北的 PISANO 工业自由贸易区纳瓦雷特拥有自己的工厂（halfwheel），旗下雪茄在此完全手工卷制（havanahouse.co.uk）。

产品线包括多个系列：Splendor 由卷制师Eladio Díaz创制，采用厄瓜多尔 Corojo 茄衣、墨西哥圣安德烈斯茄套与多米尼加茄芯，自2024年起在欧洲销售，据 halfwheel 报道计划于2026年春季进入美国市场；Alisio 定位更轻淡、更平价，采用厄瓜多尔 Corojo 茄衣，配多米尼加与尼加拉瓜茄芯；Midnight Wonder 采用 Connecticut Broadleaf 茄衣，配方历时近三年调制而成。此外，Conviction 系列已更名为 Certitude 以进入美国市场，并在2025年 PCA 展会上推出（halfwheel）；该品牌网站还提到一个 Monkey Business 系列，但未说明茄衣或浓淡。'
 WHERE `name` = 'Chateau Diadem' AND SHA1(TRIM(`history`)) = '220776b3a907b9378f3956566175c42e4271c3f2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Chateau Diadem' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '220776b3a907b9378f3956566175c42e4271c3f2';
-- brands|Cházaro|history|zh — 去掉「第二大」，人名拉丁
UPDATE `brands` SET `history_zh` = 'Cházaro 是本图集中唯一在韦拉克鲁斯之外的墨西哥地区卷制的公司：在克雷塔罗州的埃塞基耶尔蒙特斯，葡萄酒与奶酪之路上，一个韦拉克鲁斯裔家族在2015年前后开了一家工厂，取名 Real Fábrica de Tabacos，纪念王室1779年设在克雷塔罗的圣费尔南多皇家烟草厂——新西班牙的第二家，十九世纪上半叶关闭。到访过的两家报纸对年份说法不一：一家说成立于2018年前三年，另一家说品牌创于2016年；词条两者都写。2017年向公众开放。

烟叶来自圣安德烈斯-图斯特拉，匠人也是：Antonio Toto Pucheta，人称Don Toño，四十年手艺的卷制大师，带领来自河谷的卷工主持生产，每人每天七十到九十支。三条线——Black，五分之四浅色烟叶；Habano，各半；Peña Blanca，加甘蔗烧酒和果汁。数字因年份而异：2018年每月一万五千支、七成出口美国，2022年十五人、每天约三百支；词条两者都写，不作取舍。

本图集为它开辟一个没有田地的卷制产区——埃塞基耶尔蒙特斯：一个卷制别处烟叶的地方，如同德累斯顿或莫斯科。'
 WHERE `name` = 'Cházaro' AND SHA1(TRIM(`history`)) = 'fc83573e7cf1a90d47f3686341cfeb11194051be';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cházaro' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'fc83573e7cf1a90d47f3686341cfeb11194051be';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Chinchalero' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '2145249223475f9a4ca75479ad1e3307ddd6e5f4';
-- brands|Chogüí|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'chogüí 是多米尼加共和国的一种鸟，以它命名的品牌属于本国的一位爱好者——Víctor Nicolás，他想做自己的雪茄。2013年底他结识了Francisco「Chico」Rivas，开始每月造访他的小工厂——Manufactura Rivas，公司借那只鸟的名义称之为秘密鸟巢。烟叶来自纳瓦雷特的种植者Leo Reyes，本图集在 De Los Reyes 词条讲过他的农场。Primera Edición 于2014年11月推出，只供多米尼加零售商，六千支。

本图集据实把它归于此：一支多米尼加纯料，烟叶、工厂与创始人同出一国。在一个主要为他人卷制的国家，这比人们以为的更少见。

2018年，Nicolás悄然离开行业，连他的美国经销商也不知道品牌的去向。2022年2月它回来了，带着重做的 Dos77——原来的多米尼加茄衣已无处可寻，改用日晒多米尼加 corojo，填充里加了 piloto mejorado——分销交给 Venture 1492，即 Warped 创始人Kyle Gellis的公司，本图集载有 Warped 词条。一个沉睡后归来的品牌，正如 Mombacho 走的反方向：词条以现在时写它，因为回归有据可查。'
 WHERE `name` = 'Chogüí' AND SHA1(TRIM(`history`)) = '3e61c441213e3ce2b0e2dbaf73c9cf36bee80f69';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Chogüí' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '3e61c441213e3ce2b0e2dbaf73c9cf36bee80f69';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Chone' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '99c5bd4ee0c6518c535f542c0d3220902aa31ac5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Christo' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'b7567056f1fa6ff017a213dddd9a93c0a88557c8';
-- brands|Cigarkings|history|zh — rouleurs 误作卷烟师
UPDATE `brands` SET `history_zh` = 'CigarKings GmbH于2016年12月在慕尼黑成立，据德国商业登记记载，Philipp Kugler担任总经理。在CigarKings品牌之下，该厂的Longfiller雪茄由古巴流亡雪茄卷制师在尼加拉瓜埃斯特利手工卷制而成——据厂方称共十六人——采用Entubado卷制法，头部三层包裹，从而增加燃烧通道。厂方称工厂规模小、属家族经营，并对外保密，不透露厂名。

2026年9月，产品目录包括两款配方：Sun Grown采用同名天然茄衣，配尼加拉瓜H2000茄芯，厂方称不含Ligero，烟碱含量相对较低；Maduro配方采用相同茄芯，厂方称口感温和香甜。共有六种规格：Petit Robusto、Coronita FT、Corona、Robusto、Elegantes和Toro。此外还有一系列年度限量版，即COY系列，每年在Intertabac展会上推出：COY 24 Geniales Colorado为Robusto（5 x 52），推出于2024年；其后是2025年的COY 25 Majestic Flag Tail；据halfwheel报道，COY 26 Aero Lancero已预告推出。Cigarworld.de将该品牌保留在产品目录中。'
 WHERE `name` = 'Cigarkings' AND SHA1(TRIM(`history`)) = '05ba62fc6de5cbbe33a86136878d869b54f040ab';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cigarkings' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '05ba62fc6de5cbbe33a86136878d869b54f040ab';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CLE Cigar Company' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '3ad328425bb4aaa6b1b3ad2119f8d454d8f6b479';
-- brands|Colpuros|history|zh — 人名公司名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Colpuros——Compañía Colombiana de Puros——2009年8月5日诞生于桑坦德省皮耶德奎斯塔，是一个世系的公司：一百五十年前 Agustín Correa 在萨帕托卡做 tabaco，其子 José Correa 改良了烟叶和销售，而孙子 Yorgan Correa Rodríguez，1974年出生的经济学家，想从大众 tabaco 转向出口 puro。他与 Laura Victoria Heredia Portillo 共同创立公司，后者负责行政和人事；他以父亲之名把精品线命名为 Don José Correa；Mosqueteros 是 tabaco 和半精品线。

作坊在金塔格拉纳达街区。公司说，卷工全是女性户主，由古巴人和多米尼加人培训；烟叶是在哥伦比亚种植的古巴种，辅以厄瓜多尔、尼加拉瓜、洪都拉斯和多米尼加的烟叶。员工人数未公布。

2018年9月，布卡拉曼加的报纸写道，Colpuros 刚把高档 puro 送进德国，此前四年皮耶德奎斯塔没有任何一家出口——这座城里两百家制造者、78%为女性，靠烟草养活6500个家庭，烟草占市产值40%。接下来瞄准比利时、俄罗斯、西班牙和瑞典；词条不知道后来如何。公司自称是唯一持有出口认证的企业，那是它自己的说法；图集留给它。'
 WHERE `name` = 'Colpuros' AND SHA1(TRIM(`history`)) = '54ebf00a54e8000362b5e00458d6cf0c490880b9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Colpuros' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '54ebf00a54e8000362b5e00458d6cf0c490880b9';
-- brands|Compagnia Toscana Sigari|history|zh — cavistes误译烟草商；人名
UPDATE `brands` SET `history_zh` = 'Compagnia Toscana Sigari 2015年诞生于托斯卡纳瓦尔蒂贝里纳的圣塞波尔克罗，创始人是农学家兼种植者 Gabriele Zippilli——处在那个一个半世纪以来制作 Toscano 的专卖体制之外，本图集在 Toscano 词条讲过其历史。这是同一种雪茄，在托斯卡纳种植和加工的烟熏干燥肯塔基烟叶；却是另一家私人公司。

女制茄工——这个行当在意大利和古巴一样属于女性——由两位三十多年经验的女师傅在厂内培训。优质线 Mastro Tornabuoni 完全手工制作、长填充——公司用西班牙语说 totalmente a mano，如古巴的用语——这使它区别于切碎填充的普通 Toscano。公司以守护托斯卡纳传统为使命，用英语面向外国人介绍自己。

一家年轻的公司，没有英语媒体；来源是意大利酒商和它自己的网站。词条如实说明。'
 WHERE `name` = 'Compagnia Toscana Sigari' AND SHA1(TRIM(`history`)) = '7d45cb9adc01a96c0b632e6c9597d627d7e92829';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Compagnia Toscana Sigari' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '7d45cb9adc01a96c0b632e6c9597d627d7e92829';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cornelius & Anthony' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '9073004cedf33b909a0178beaea136287d25902b';
-- brands|Corona Real|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Corona Real 是 Gabriel Pico Gutiérrez 在皮耶德奎斯塔的公司，那是布卡拉曼加以南桑坦德省的烟草之城。他十二岁入行，和父亲一起捆烟叶、送烟草，后来在一家小厂做茄套和包装；他在桑坦德工业大学读企业管理——一家报纸说第七学期中断，另一家说已毕业；词条两者都写——并去古巴学习另一种做烟草的方法。他的品牌2000年先叫 Cigarros Chicamocha，取自附近的峡谷，2006年改为 Corona Real。

皮耶德奎斯塔自建镇起就在卷制，他说哥伦比亚95%的烟草产自这里——但那是 tabaco，每支几百比索、养活数千家庭的大众雪茄。Corona Real 做的是另一件事：puro，全手工，约八个人，烟叶九成来自哥伦比亚——希龙、塞皮塔、洛斯桑托斯台地、卡皮塔内霍、库库塔、马里亚山——加上他窖藏陈化的2005至2006年厄瓜多尔苏门答腊茄衣。三个本地品种：Costeña、Guane、Cubita。

他在哥伦比亚全国销售，却没能出口——2021年他说，每次尝试都被限制拦下；至于他的雪茄到过名人手里，那是他讲的轶事，图集不予转述。一份来自哥伦比亚西班牙语媒体的词条，写的是一家雪茄媒体从未写过的公司。'
 WHERE `name` = 'Corona Real' AND SHA1(TRIM(`history`)) = 'd378c1e7da89c88e81465c63ec7d7dd8d2ba38d4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Corona Real' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'd378c1e7da89c88e81465c63ec7d7dd8d2ba38d4';
-- brands|Crowned Heads|history|zh — 品牌人名拉丁；La Alianza误译
UPDATE `brands` SET `history_zh` = 'Crowned Heads 没有工厂，而这正是重点。在 CAO 被一家大集团收购之后，Jon Huber 与合伙人在纳什维尔创立了这家企业，采用的模式此后广为流传：自己调配方，再交给现有的工厂卷制——埃斯特利的 My Father、位于圣地亚哥的 Perez-Carrillo 家的 La Alianza，以及随产品线而定的其他工厂。

图集必须说明这种关系，因为它已经很常见，并且模糊了旗帜的含义：一个品牌可以属于某个国家，却在那里什么都不生产；而你手中的雪茄，可能出自一间名字根本不出现在盒子上的作坊。

这一模式有个令人愉快的后果：企业按配方来挑选卷制者，而不是相反。奠基产品线 Four Kicks 是尼加拉瓜的、浓郁的；与 Ernesto Perez-Carrillo 合作而生的 Le Carême 则是多米尼加的、更圆润的。两支雪茄之间除了构思它们的这家企业之外，别无关联。

名字取自歌曲与文学典故，盒身文字的写作也有着这个行业里少见的用心——细节而已，但它说明了这个品牌在对谁说话。'
 WHERE `name` = 'Crowned Heads' AND SHA1(TRIM(`history`)) = '4376d02f06a2d13566823aae53f72304702ed9f2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Crowned Heads' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '4376d02f06a2d13566823aae53f72304702ed9f2';
-- brands|Crux Cigars|history|zh — 人名公司名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Crux 诞生于明尼苏达州的一家雪茄店，而非种植园。Joel Rodgers 与 Jeff Haugen 是店的共有人；2014年他们走到柜台的另一边，创立了自己的牌子。这是本图集常见的路——Sindicato 是一群人走的，Crux 是两个人走的。

雪茄在埃斯特利的 Plasencia 厂卷制，由 Nestor Plasencia 把关，本图集载有其词条。Crux 从未有过工厂，也不这么声称：它带来的是配方的取舍与柜台的经验——知道爱好者要什么，因为卖了他们多年。

以这种规模的公司而言，目录颇宽：Epicure 及其 Habano、Maduro 变体，Bull & Bear、Guild、Passport、Limitada、Du Connoisseur、Marblehead。一个零售商的牌子成了品牌，在尼加拉瓜的大厂之一卷制。'
 WHERE `name` = 'Crux Cigars' AND SHA1(TRIM(`history`)) = 'cfd7086237e3e3a76d24f41e89c15fe49ae78911';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Crux Cigars' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'cfd7086237e3e3a76d24f41e89c15fe49ae78911';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CSC' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'd3ba069dd36575541b33e2894bd762c8d156b631';
-- brands|Cuba Aliados|history|zh — 落户误作新厂建设
UPDATE `brands` SET `history_zh` = '据维基百科介绍，1924年出生于古巴拉斯维拉斯省苏卢埃塔的Rolando Reyes Sr.，其品牌Los Aliados及工厂于1968年被古巴政府没收；1971年他移民美国，先到迈阿密，后迁往泽西城，并于1973年在联合城将其产品更名为Cuba Aliados。其家族于1989年在洪都拉斯丹利完成落户；Rolando Reyes Sr.于2012年3月18日去世。

据Cigar Coop介绍，2021年8月6日，Oliva Cigar Co.从Carlos Diez手中收购了Cuba Aliados、Puros Indios及Roly品牌；Carlos Diez是Rolando Reyes Sr.之孙，也是Reyes Family Cigars的唯一所有者；Reyes家族保留了自有工厂，易手的只是品牌名称。

此后，常规系列Original Blend一直作为洪都拉斯puro卷制——茄衣、茄套与茄芯均产自洪都拉斯——力度适中，共五种规格，从Robusto到Churchill，产自由Julio R. Eiroa（JRE Tobacco Co.）执掌的、位于丹利的Fábrica de Puros Aladino。另有一款限量版，由Ernesto Perez-Carrillo Jr.调配，产自多米尼加共和国的Tabacalera La Alianza，茄衣为厄瓜多尔产Sumatra，茄套为尼加拉瓜烟叶，茄芯为尼加拉瓜与多米尼加烟叶，同样有五种规格。截至2025年6月，Original Blend仍在产品目录中。'
 WHERE `name` = 'Cuba Aliados' AND SHA1(TRIM(`history`)) = 'e48ac21122136d812a1e085302ab6c4abda32c40';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuba Aliados' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'e48ac21122136d812a1e085302ab6c4abda32c40';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuban Crafters' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '5fd8d7385bd0addcf31972f5507a87dbd5130c42';
-- brands|Cuban Stock Cigar Co.|history|zh — 人名拉丁；一百余名
UPDATE `brands` SET `history_zh` = 'Cuban Stock 是圣地亚哥的一家公司，历经二十年后刚刚换了量级。Yaniv Levy 于1996年、美国雪茄热高峰之时创办，此后二十年在两座相继的工厂里维持，两处面积合计不到一万平方英尺。

2016年2月，它在坦博里尔自由区开设了一座两万平方英尺的工厂——两间各一千二百平方英尺的发酵与陈化室，开业时四十名工人，数周后一百余名。理论产能从每年一百八十万支提高到一千万支；Levy 短期目标三百万支，本词条记目标而非产能，因为那是他给出的数字。

它的产品是一份清单而非一个署名：二十多个在售品牌——Chubbys、Delicioso、Everyday Joe、Limitado、Reserve、Triumph、231——售予零售商，从不直销。这是一家多米尼加式的走量工厂，没有邻居们那样的家族叙事，本图集按它的本来面目收录：又一家坦博里尔的工厂，门上有自己的名字。'
 WHERE `name` = 'Cuban Stock Cigar Co.' AND SHA1(TRIM(`history`)) = 'c68a2ce9699e1457bcaa0bddc80cf58f887c335d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuban Stock Cigar Co.' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'c68a2ce9699e1457bcaa0bddc80cf58f887c335d';
-- brands|Cuervo y Sobrinos|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Cuervo y Sobrinos自称可追溯至哈瓦那，阿斯图里亚斯人Ramón Fernández Cuervo于1862年在那里开设了一家珠宝店；他的六个侄子于1882年加入，该品牌将这一年视为其正式创立之年。品牌将其黄金时代定位于二十世纪五十年代，并称Caruso、Churchill、Einstein、Gable、Hemingway与Neruda都曾是其客户。如今，该品牌是一家制表企业，总部与工坊设于瑞士卡波拉戈。

2023年，Cuervo y Sobrinos推出雪茄产品线，交由Fernando Navarro执掌的Cigar Conexion负责，并与Tabacalera Pages合作：这些雪茄采用古巴种子烟叶，在尼加拉瓜埃斯特利手工卷制。该品牌未说明两家合作方如何分工。产品分阶段上市：2024年6月登陆日本，7月登陆瑞士，随后是欧洲市场，于2024年9月25日宣布。

截至2026年9月，该品牌网站展示四款规格——Toro、Mareva、Perfecto Press与Robusto——以及一个独立系列Historiador。'
 WHERE `name` = 'Cuervo y Sobrinos' AND SHA1(TRIM(`history`)) = 'f722bc9d7b62e170d949bff8401073cd0a2af0d7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuervo y Sobrinos' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'f722bc9d7b62e170d949bff8401073cd0a2af0d7';
-- brands|Cuesta-Rey|history|zh — 国王名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Cuesta-Rey 比拥有它的那家公司更古老。西班牙人 Angel LaMadrid Cuesta 曾在古巴习艺，1884 年他与 Peregrino Rey 在坦帕的伊博城创办了这个品牌——雪茄业离开哈瓦那后正是在那个街区落脚。他们在那里卷制 clear Havana：用进口古巴烟叶在美国制成的雪茄。

这家作坊也为别的品牌代工，其中包括本图集收录的 Nat Sherman。此外，该公司自称获得过西班牙国王 Alfonso XIII 御用雪茄的名号——这是它自己的说法，并无独立来源可以证实。

1958 年，也就是 Julius Caeser Newman 去世的那一年，其子 Stanford 从 Karl Cuesta 的家族手中买下这个品牌。此后 Cuesta-Rey 一直由 J.C. Newman 出品。而自 1980 年代起，手工卷制的雪茄已不再出自坦帕，而是来自圣地亚哥-德洛斯卡瓦耶罗斯的 Tabacalera A. Fuente——同一家工厂也生产 Arturo Fuente 与 Ashton。这正是本条目归入多米尼加共和国、而 J.C. Newman 一条仍属美国的原因。

三个系列撑起整份目录。Cabinet Selection 以喀麦隆茄衣包裹多米尼加与巴西茄芯；Centenario 分为康涅狄格阴植的浅色版与康涅狄格宽叶的马杜罗版；Centro Fino 则用厄瓜多尔日照茄衣。各款尺寸沿用目录编号而非名字——Cabinet No. 898、No. 95。'
 WHERE `name` = 'Cuesta-Rey' AND SHA1(TRIM(`history`)) = '0c679e0cd8049100634af6aff89d780141f92973';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuesta-Rey' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '0c679e0cd8049100634af6aff89d780141f92973';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Curivari' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '4da8d428b9674751064c7fe7c2e042d7153c77d7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'D''Crossier' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '90bfe64ca3c509b2afb2c1e015eca40b24599e7d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dalay' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '974188858ec399602805e2041c18ca172b61f121';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Daniel Marshall' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '73ff092d9d419e0d87c629a89565638e6148cd9c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dapper' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '3bacd08d8ec7f0f302cb95f8deb9bb871222978a';
-- brands|Darier & Cleef|history|zh — 删增添语；首席改调配大师
UPDATE `brands` SET `history_zh` = '德国经销商（noblego.de、smokersplanet.de）称Tabacalera Darier & Cleef由Alfons Darier与Jean van Cleef于1881年创立；smokersplanet.de补充说，该厂的生产在1903年至1999年间数次中断。而巴拿马媒体（Newsroom Panama，2025年）则认为，1986年2月创立的Joyas de Panamá才是该国首家持续经营的雪茄工厂：两种说法互相矛盾。

据noblego.de称，该厂完全以手工卷制长茄芯雪茄，所用巴拿马烟叶在卷制前需陈化三至四年。所查阅的资料均提及产烟省份Chiriquí，但均未说明工坊所在城市。

产品目录中共有两个系列。Colón分为Vintage 2001系列——于2007年11月16日推出，卷制后再于雪茄柜中陈化六个月——以及Especiales系列；据cigarworld.de称，茄衣、茄套与茄芯均产自巴拿马。Cruzero de Panamá据称源起于1881年，于2000年前后在调配大师Ramón主导下重新推出，并于2010年增加了大环径的Sportivos规格，据noblego.de与cigar-wiki.com称。'
 WHERE `name` = 'Darier & Cleef' AND SHA1(TRIM(`history`)) = 'f9fd9faad4c99fe6d4d70f479054fbb5a59273d0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Darier & Cleef' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'f9fd9faad4c99fe6d4d70f479054fbb5a59273d0';
-- brands|DBL|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Francisco Almonte于2013年创立了DBL Cigars——Dominican Big Leaguer。他说自己是在烟草中长大的：七岁起就为父亲的烟叶去梗，父亲当时有自己的品牌El Rey；到十二岁，他已经开始卷烟。据他说，家族里从事这一行的成员超过六十八人。他提到两位师傅：来自Arturo Fuente的Carlos Fuente，以及来自La Flor Dominicana的Litto Gomez，他曾师从二人学艺。

Almonte于2018年在多米尼加共和国坦博里尔购入一块略大于一英亩的地皮；建设工程于2020年动工，整个项目——一座雪茄厂和一座纸盒厂，两栋建筑合计32000平方英尺——于2023年3月4日落成，正值品牌十周年。工厂当时雇用约一百人；设有可存放300000支雪茄的陈化室，并具备发酵超过200000磅烟叶的能力。纸盒厂由Kedwin Estrella与Miguel A. Martinez（来自Artesania Estrella）共同筹建，据称年产能超过200000个纸盒。

2023年6月，DBL在PCA展会推出La Tabla系列，茄衣为该品牌所称的墨西哥阿拉皮拉卡烟叶。2026年9月，西班牙网站Pasión Puro介绍其目录共有七条产品线：Amarillo、Maduro、Mafu、Formula、Extra Viejo、2a Generación与El Final。'
 WHERE `name` = 'DBL' AND SHA1(TRIM(`history`)) = '838fd1a217a22c4a88a8de358db2ed30c69e0502';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'DBL' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '838fd1a217a22c4a88a8de358db2ed30c69e0502';
-- brands|De Los Reyes Cigars|history|zh — 人名改拉丁字母；序数
UPDATE `brands` SET `history_zh` = 'Reyes 家族自十九世纪起便从事多米尼加烟草业。工厂本身则年轻得多：Augusto Reyes 于1995年在圣地亚哥-德洛斯卡瓦耶罗斯开办了它。

分工分明，这正是这家公司的有趣之处。Augusto 的兄弟 Leo Reyes 负责种植。Augusto 的女儿 Nirka Reyes 主持工厂。进入作坊的烟叶很大一部分来自 Leo 的田地——而其中开辟得极早的那一片值得停下来说说，因为它贯穿了这家公司的整部历史。

纳瓦雷特农场得名于圣地亚哥西北的一处市镇。Leo Reyes 于1961年辟建，面积二十至三十英亩——约十公顷，并不大。Cigar Aficionado 称它是多米尼加共和国首片种植 Piloto Cubano 的园子；这一品种是该国于1959年后从古巴接手的，如今构成多数多米尼加填充烟叶的骨架。此处也收 Negrito，一种深色茄衣。Arsen 的茄衣正来自这里，而这片田地日后又由其他种植园扩展开来。少有多米尼加公司能这样一头一尾都握在手里，从苗床直到卷制台。

作坊年产两百万至两百五十万支。自有品牌为 Saga——含 Golden Age、Blend No. 7 与 Short Tales 三个系列——Don Julio，以及以创始人之名命名的那一系。它也为别人卷制：Debonaire、Fittipaldi、Patoro 与 Indian Motorcycle 皆出自此地。

Don Julio 并非杜撰之名。它指的是家族第三代种植者 Don Julio Samuel Reyes Fermín；该牌子全部使用 Reyes 家族在锡瓦奥河谷田里的多米尼加烟叶。它有两条主线：2014年推出的 Punta Espada，以及2024年问世的 Sang Bleu——十年来首款常规生产的新品。

Arsen 是这家厂的牌子——但并非诞生于此。Arsen Gasparian 于2010年推出了它：他曾任亚美尼亚外交部新闻秘书，先以俄文雪茄杂志《Hecho a Mano》出版人的身份进入这一行，此后才在多米尼加共和国委托生产自己的牌子。它使用纳瓦雷特的茄衣。它列于此处正因如此：由外人构思、在这家公司卷制的牌子——与 Zino 之于 Oettinger Davidoff、Oliveros 之于 Boutique Blends 同理。'
 WHERE `name` = 'De Los Reyes Cigars' AND SHA1(TRIM(`history`)) = '089c1e96628dbd93a99e4cf901916c0a12952f8a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'De Los Reyes Cigars' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '089c1e96628dbd93a99e4cf901916c0a12952f8a';
-- brands|Debonaire House|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Debonaire House 是一家拥有两个品牌、没有工厂的公司。Phil Zanghi 2012年与 Daniel Sinclair 共同创办，源于与 Emilio Reyes 及圣地亚哥 De Los Reyes 工厂的旧交——该厂有自己的词条：一切都在那里、在 Zanghi 的监督下卷制。

两个品牌是 Debonaire——公司之名——与获摩托车制造商授权的 Indian Motorcycle Cigars。各有 Habano 与 Maduro 两种茄衣；2018年，Daybreak 以 Debonaire 之名添加了厄瓜多尔康涅狄格茄衣，成为目录中的第五款配方，与 Drew Estate 联合分销。

模式是精品雪茄界的那一种：美国的署名，多米尼加的工厂，而本图集两者皆点名。'
 WHERE `name` = 'Debonaire House' AND SHA1(TRIM(`history`)) = '266025cb335fd47c4bd827841ae6a5821aa6e5a6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Debonaire House' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '266025cb335fd47c4bd827841ae6a5821aa6e5a6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Despot' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'a78f7155b80e4d5fa24bfef0f2d7a9b581d05947';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Diamond Crown' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '2d63ba79805e5ed3d0362df6776039a7db42d094';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dios del Sol' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '016f645cbcd9a3f1eefd10b056b6d20c011faa29';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Domaine de Lavalette' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '23adcc907bb54d960e1538dd6d1aadf5227a5aa7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Domenico' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '6918d1aa4a6b34b7b1c1b17af2ee11a34f3eaca3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dominican Estates' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '0c48704f2affd428072edb72412cfb136ec1dd48';
-- brands|Don Collins|history|zh — 公司名拉丁字母；老牌措辞
UPDATE `brands` SET `history_zh` = 'Don Collins 是老圣胡安基督街上一家前店后坊的品牌，从街上就能看到卷雪茄。Puerto Rico Tobacco Corporation 自1991年起生产它——这是本图集采用的日期，也是公司给出的唯一无须争论的日期。

因为公司讲得更远。它自称源于一家据说1506年由西班牙特许的 Porto Rico Leaf Company，并自称是加勒比历史居首的雪茄厂；本图集把这一说法归于提出者，在别处未曾找到。可以确定的更朴素也更可靠：1899年，American Tobacco Company 组建了 Porto Rican-American Tobacco Company，接管岛上的雪茄与卷烟制造商 Rucabado y Portela——这写在美国联邦大法院1911年拆分该托拉斯的判决里。今天的 Puerto Rico Tobacco Corporation 自称是那家公司的继承者；这层关系说得通，本图集以存疑的方式保留。

直到1920年代，波多黎各仍是烟草大国。手工卷制如今只剩这一家作坊，本图集为它开辟这座岛——一个由自家橱窗作证的卷制之国，词条把这一点说出来，而不是藏起来。'
 WHERE `name` = 'Don Collins' AND SHA1(TRIM(`history`)) = '8048ea30a32a9bf86fe76a939ace06cb34e7168b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Collins' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '8048ea30a32a9bf86fe76a939ace06cb34e7168b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Duarte' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'cbcf433e01f2d2626de9d9e106f2a15893447609';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Emmanuel' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'fb32e87f6b823a57238ebcc30f49e7569636d992';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Fidel' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '741a7134d8a368df8825688f01957ae76dd09673';
-- brands|Don Lucas|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Don Lucas 是旅游海岸上的一家工厂，词条开头就这么说，因为这正是它与圣地亚哥各公司的区别：它坐落在蓬塔卡纳的 Mundo Auténtico 综合园区，介于咖啡、巧克力与朗姆酒之间，酒店大巴把游客送到这里。比利时人 Philippe Gillet 创办了它——公司说是1992年，起初两名卷工、日产一百五十支；如今员工超过四十五人。目录里2017年前后的「20th Anniversary」系列暗示另一个起始年份；本图集两者都写，而不作裁断。

但它不是布景。烟叶来自岛另一端圣地亚哥周边的农场，以及别处；到访的媒体描述了烟包、分拣室、卷制车间和就地制作的雪松木盒，没有产量指标——工厂只卷制备好的烟叶所允许的数量。约六成雪茄在园区商店售出；其余进入二十来家美国店铺和哥伦比亚的几家。

目录按茄衣阅读：厄瓜多尔康涅狄格的 Classic、苏门答腊的 HS、美国 broadleaf 的 AL、纪念周年的多米尼加纯料，以及一款 Family Reserve。本图集按其本来面目保留这家公司——一家点名的、可参观的、手工卷制的工厂——并说明它在哪里。'
 WHERE `name` = 'Don Lucas' AND SHA1(TRIM(`history`)) = 'dfc2c062a9824cc18d2b9585511cecb5e62c9dc8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Lucas' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'dfc2c062a9824cc18d2b9585511cecb5e62c9dc8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Tomas' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '9f654253ba36a69b62c34394cbaef6de2dfcc242';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Zuarin' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '78f24a100ccbfeb4a8928083baa6a33217526a82';
-- brands|Dona Flor|history|zh — 品牌人名拉丁；术语统一
UPDATE `brands` SET `history_zh` = 'Dona Flor 诞生于古巴技艺与巴伊亚烟叶的相遇。Menendez Amerino 这家企业落户雷孔卡沃，抱着把哈瓦那卷制方法用于巴西烟叶的想法——此前没有人以这样的严谨去尝试。

结果是这片大陆上格外独特的雪茄之一：构造是古巴式的——经典尺寸、精细卷制、可控的燃烧——但味道依然是巴西的，果味而带酸，还有那种别处给不了的 mata fina 甜感。这是两种传统之间的桥梁，而不是模仿。

名字取自巴伊亚作家 Jorge Amado 的一部小说。这并非卖弄：这家企业既主张自己的地方根脉，也主张自己引进的方法，而这恰是本图集想要呈现的——一方风土、一门技术，以及二者相遇所生之物。'
 WHERE `name` = 'Dona Flor' AND SHA1(TRIM(`history`)) = '7578c20f27ab4867703f74b414510597da01c651';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dona Flor' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '7578c20f27ab4867703f74b414510597da01c651';
-- brands|Dos Amigos|history|zh — 城市未译；增添大规格
UPDATE `brands` SET `history_zh` = 'Dos Amigos诞生于巴塞罗那，源于两位创始人之间的友谊——因雪茄、音乐以及共同分享美好时光的爱好而结缘，据该品牌官网称。Jordi Llorens与Isidre Pineda于2025年10月推出该品牌，并于2026年Intertabac展会上展示了其产品系列。

据该品牌称，雪茄在尼加拉瓜手工卷制，采用产自哈拉帕、埃斯特利与奥梅特佩的烟叶；无论是品牌官网还是媒体，均未指明卷制工厂。

产品目录共有四个系列：Paster与Sidecar，采用Ecuador Rosado茄衣，搭配尼加拉瓜茄芯；Paladium，采用相同配方，制成双figurado，陈化十二个月；以及Zwoa Spezln，慕尼黑版本，采用厄瓜多尔茄衣，据该品牌称浓度中等。'
 WHERE `name` = 'Dos Amigos' AND SHA1(TRIM(`history`)) = 'f855318d4bd6590f8a26bb15e52abb565d9f0121';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dos Amigos' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'f855318d4bd6590f8a26bb15e52abb565d9f0121';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dos Jotas' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '334bb1e56a1fef7681cf7a3f5aff3325fc009726';
-- brands|Dos Santos|history|zh — 禁用字符；属家族改公司
UPDATE `brands` SET `history_zh` = 'Dos Santos 是本图集收录的加那利雪茄庄中唯一不属于拉帕尔马岛的一家。1921 年，Joaquín Jesús Dos Santos González 在大加那利岛拉斯帕尔马斯佩罗霍街 16 号开办工厂，取名 La Regenta。一战结束后欧洲对烟草需求旺盛，而拉斯帕尔马斯港恰能供应：自 1914 年起就有德国船只滞留于此，船上载着古巴烟叶。公司将创立之年定为 1921 年；加那利当地报刊则把这个品牌上溯至 1919 年。

家族已传四代。次代的 Joaquín Roberto 于 1940 年代接手，为原本只有卷烟与切丝烟草的生产线增加了雪茄——先是机制，后为手工卷制。他于 1983 年去世，第三代继任，如今由第四代主持。

佩罗霍街的旧厂房已不属于这家公司。建筑受文物保护，如今是一座艺术中心，并保留了雪茄的名字：Centro de Arte La Regenta。生产则迁往拉斯托雷斯的一处工业区。

这些数字说明了这家公司的实际面貌。它公布的产量为卷烟十亿余支、机制雪茄六百万支、小雪茄三千八百万支——而手工卷制雪茄仅五十万支。高端产品的产量居末。产品出口至德国、捷克、智利、中国、匈牙利与安哥拉；旗下还有 Cónsul 品牌，并于 2016 年重启了 Condal。'
 WHERE `name` = 'Dos Santos' AND SHA1(TRIM(`history`)) = '37b22f195668e815d763479726d379d79ad8cb07';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dos Santos' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '37b22f195668e815d763479726d379d79ad8cb07';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Drunk Chicken' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '65b5b44799f9c793f443af848a1bd573bed4bc39';
-- brands|Dunbarton Tobacco & Trust|history|zh — 禁用字符；保持原级别
UPDATE `brands` SET `history_zh` = 'Dunbarton Tobacco & Trust 没有自己的工厂，而其创办人曾经掌管过一家。Steve Saka 曾任 Drew Estate（本图集已收录）的总裁，随后离开，于 2015 年夏天创立自己的公司。

他请别人代卷：一处是尼加拉瓜历史居首的工厂、同样收录于本图集的 Joya de Nicaragua，另一处是 NACSA（Nicaragua American Cigars），Mi Querida 便出自那里 Raul Disla 之手。这与 Crowned Heads 的模式相同，只有一点不同：Saka 亲自调配，并以自己的名字为配方署名。

Sobremesa 于 2015 年开启这份目录。这个西班牙语词指的是饭后众人仍留在桌边、谈话继续的那段时光——它也定下了这家的基调：中度至浓烈，土壤、甜香料、皮革、深焙咖啡。

其后各系列的名字对不熟悉的人毫无解释可言，而这是有意为之：Mi Querida、Sin Compromiso、Todos Las Dias、Triqui Traca、Muestra de Saka。末一个是试验系列——字面意思就是「Saka 的样品」。'
 WHERE `name` = 'Dunbarton Tobacco & Trust' AND SHA1(TRIM(`history`)) = '9a6b5461f7f3617ecb2bccb7c58d7216ea0e6cb4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dunbarton Tobacco & Trust' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '9a6b5461f7f3617ecb2bccb7c58d7216ea0e6cb4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Galan' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'dd7eeeb4fcc3839c978668af729cb046261055a3';
-- brands|El Gaucho|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'El Gaucho是Besuki Raya Cigars（PT Besuki Raya Cigar）的旗舰优质品牌，总部位于东爪哇的杰姆贝尔。BRC自2020年起成为印尼集团Mangli Djaya Raya（MDR，董事长为Christian A. Njoto Njoo）旗下的独立子公司，自2009年起在贝苏基和杰姆贝尔地区种植烟草，此后才进入优质雪茄领域——行业媒体Tobacco Asia和Intertabac展会的参展商简介都是如此介绍的。El Gaucho据品牌介绍在烟叶陈放三年后于2022年推出，是其首款高端产品，此前BRC已有Rojo Blanco（2020年）及随后的My Lockdown和Lauk Daun（2021年）。El Gaucho称其雪茄完全手工卷制；两份独立资料均未明确证实这一点，也都没有提到机器。

产品目录共有两条产品线，均采用54环径的压制盒装，有三种规格——Square、Toro、Chiquitos。Premium将厄瓜多尔茄衣与巴西阿拉皮拉卡茄套、多米尼加茄芯搭配，带有巧克力、肉桂和咖啡的风味，品牌称其力度中等偏浓郁。Fantastico采用habano品种的厄瓜多尔茄衣，将同一款巴西茄套与多米尼加和印尼茄芯搭配，呈现中等力度，带有黄油和柑橘风味。在同一家工厂，Besuki Raya还与Monsoon Cigar合作卷制Mata Hari品牌。'
 WHERE `name` = 'El Gaucho' AND SHA1(TRIM(`history`)) = 'e856468ce274b6dbe05e4addfd61b1e43bfa15a5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Gaucho' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'e856468ce274b6dbe05e4addfd61b1e43bfa15a5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Mago' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '7574c28917dfdc1f4f15abf2964c49ebb1aaf56c';
-- brands|El Rey del Mundo Honduras|history|zh — 人名公司名拉丁字母
UPDATE `brands` SET `history_zh` = '古巴品牌可追溯至 1848 年。其洪都拉斯同名品牌出自 Villazon 家族之手，交由 Honduras American Tobacco（HATSA）卷制——该厂由 Frank Llaneza 于 1963 年创办，其科夫拉迪亚工厂是该国首家面向出口的雪茄厂。

General Cigar 于 1997 年收购 Villazon。因此本品牌与本图集已收录的洪都拉斯 Punch 和 Hoyo de Monterrey 共用同样的工坊与卷制师：Villazon 于 1965 年取得后两者的美国权利，Llaneza 则在 1969 年将其生产迁至 HATSA。'
 WHERE `name` = 'El Rey del Mundo Honduras' AND SHA1(TRIM(`history`)) = '034425602a98b31f87b937c66bcb77007b7da9d5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Rey del Mundo Honduras' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '034425602a98b31f87b937c66bcb77007b7da9d5';
-- brands|El Septimo|history|zh — 人名拉丁字母；禁用字符
UPDATE `brands` SET `history_zh` = 'El Septimo 是一个诞生于日内瓦的奢侈品牌——据它自己说创立于2005年，先在欧洲和中东出名——本图集把它归入哥斯达黎加，它的雪茄在那里一家它自称属于自己的工厂卷制。2019年3月，伊拉克裔金融家、Younan Company 掌门人 Zaya Younan 收购了它；该奢侈品集团在波尔多和圣埃美隆拥有城堡和葡萄园。他的女儿 Alexandra 负责市场，以她名字命名的系列于2019年6月推出，为女性而设计。

公司的说法很多，本图集照录：茄衣、茄套和填充全部为哥斯达黎加烟叶，在哥斯达黎加种植和卷制；它把自家葡萄园的方法用于烟田；它的烟草生长在海拔两千八百米以上——后一个数字词条留给公司自己，没有任何外部来源核实过。无需争论就能看到的：极高的价格、沉重的雪茄盒，以及快速扩张的目录——2021年的 Sacred Arts Collection，七支以艺术家和创世七日命名的雪茄；同年进入一百三十家美国店铺，志在一千家。

一家先卖奢华、后卖烟草的公司，本图集如实说出而不评判，因为这里还有别的——几公里外的 Atabey 便是其一。'
 WHERE `name` = 'El Septimo' AND SHA1(TRIM(`history`)) = '595e0f0effc261ce941df4a3db755d49b2b73a37';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Septimo' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '595e0f0effc261ce941df4a3db755d49b2b73a37';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Eladio Diaz' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'cea4c512b851d8bbbb9febbf50dbe92a118a9158';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Emilio Cigars' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'd73abddff0bd51092550a3e5a8d6031611f09525';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Emperors Cut' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '61d887251e7ea7d54a74076b61f6e1a1f0383e93';
-- brands|Epic Cigars|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Epic 诞生于一位转行到加勒比做房地产经纪的加拿大警察。Dean Parsons 2005年结束十年警察生涯，去了特克斯和凯科斯群岛，那里好雪茄难寻；他到多米尼加共和国买雪茄送给客户，在那里结识了小工厂，并推出一个只在群岛销售的品牌 Turks Select，从2006到2010年。2009年定居圣地亚哥后，他2010年创办 Epic，以 Maduro 与 Corojo 两支雪茄起步，至今仍在目录中。

工厂就是卷制 Kristoff 的那家——本图集载有 Kristoff 词条：圣地亚哥的 Charles Fairmorn，今名 Tabacalera von Eicken。Corojo Reserva 用厄瓜多尔 corojo 茄衣，Maduro Reserva 用巴西 Arapiraca。2019年底，2007年起拥有 Nat Cicco 的加州经销商 Zander-Greg 收购了 Epic，并留 Parsons 掌舵——他说对他而言变化不大，除了产量与市场。

一个由外国人创办、由点名的工厂卷制、被经销商收购的品牌：三件事本图集照实写下，不译成传奇。'
 WHERE `name` = 'Epic Cigars' AND SHA1(TRIM(`history`)) = '1702f0224afbf9344d45369efb7559f28b6af056';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Epic Cigars' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '1702f0224afbf9344d45369efb7559f28b6af056';
-- brands|Espinosa|history|zh — 人名厂名拉丁；去禁用字
UPDATE `brands` SET `history_zh` = '在独自启用自己这个姓氏之前，Erik Espinosa 已经让两个品牌为人所知——601 与 Murcielago——那是在他与人合营的公司之下。随后他做了一件少有品牌创始人会做的事：在埃斯特利开设自己的工厂 La Zona，而不再继续把雪茄交给别处卷制。

从品牌到制造者的这一步改变了一切。这家企业如今从卷制到出厂全程掌控自己的配方，既为自己生产也为别的品牌代工，并且能承担任何代工厂都不会接受的短批量。

风格是不绕弯子的尼加拉瓜式：浓郁、带胡椒，物质感直率，不去追求古巴式的细腻。围绕巴西茄衣构建的 Laranja Reserva 是它为人熟知的代表作，也是巴西烟叶在巴西之外少见的成功之一。

与此同时，La Zona 已作为一家独立工厂立住脚：数个精品品牌在此卷制——这是一间作坊所能获得的极佳推荐。'
 WHERE `name` = 'Espinosa' AND SHA1(TRIM(`history`)) = 'b8c9006f41a59b5497411889a49e8dae3b9a6855';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Espinosa' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'b8c9006f41a59b5497411889a49e8dae3b9a6855';
-- brands|Esteban Carreras|history|zh — 店主误译；人名拉丁
UPDATE `brands` SET `history_zh` = 'Esteban Carreras 这个名字，没人真正知道指的是谁，行业媒体也坦然承认：据说品牌在1990年代由一位匿名的古巴卷工创立，名字据说来自一位在革命后帮助古巴人出逃的引路人——或者，按品牌所有者2024年对一家零售商所讲，来自一段把 corojo 种子带出岛的故事。本图集把这些说法归于讲述者，不采用任何一个作为创立日期。

可以确定的从2000年代初或中期开始：美国企业家 Craig Cunningham 自那时起拥有并经营这家公司，并在埃斯特利建立了自己的工厂 Tabacalera Carreras，种植或采购、调配和卷制都在那里。公司总部在加利福尼亚，市场在美国；2024年在多特蒙德 Inter-tabac 展会上，它宣布与 Kopp Tobaccos 合作进行全球分销。工厂也为其他品牌代工，但不点名。

目录有十三条线——Cashmere、Dictator''s Hand、Hellcat、Chupacabra、Unforsaken、Black Cross、Brown Cross、Bloodline、Mr Brownstone——公司说大多数是尼加拉瓜纯料。有三个版本的 Chupacabra 是为它赢得名声的那一款。'
 WHERE `name` = 'Esteban Carreras' AND SHA1(TRIM(`history`)) = '2381510a3b2b0796ec2a5df993c871745985176e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Esteban Carreras' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '2381510a3b2b0796ec2a5df993c871745985176e';
-- brands|Ezra Zion|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Ezra Zion 是一家得克萨斯公司，由两位爱好者 Chris Kelly 与 Kyle Hoover 创办，2012年7月以两条线起步——Honor Series Reagan 与后来更名为 Jamais Vu 的 Inception——继而 Tantrum。前三款配方均为尼加拉瓜纯料，制作者是一位「归化」的尼加拉瓜人：埃斯特利的古巴调配师 Noel Rojas——本图集载有其词条——当时在他的 Aromas de Jalapa 作坊。本图集因此把它归入雪茄卷制之地尼加拉瓜，而非构思之地得克萨斯。

公司以小批量销售，名字都是句子——All My EX''s、FHK Truth——每支雪茄都当作一个故事来讲。这更像出版而非制造的模式，且找到了自己的受众。

2018年9月，Fred Rewey 把 Nomad Cigar Company 卖给了它——本图集载有 Nomad 词条：Ezra Zion 因此拥有本图集的两个品牌，而 Nomad 同样经 Rojas 之手。它还收购了爱好者论坛 Cigar Federation——一家拥有人们谈论它的场所的公司。'
 WHERE `name` = 'Ezra Zion' AND SHA1(TRIM(`history`)) = '8cba7531ea3e44b290422b4a479033919d4f8d85';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ezra Zion' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '8cba7531ea3e44b290422b4a479033919d4f8d85';
-- brands|Fable Cigars|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Fable 是2016年的公司，由 Sean Kremenetski 与零售商 Mitul Shah 创办，它的故事可以装进一次日食：自诞生以来约有一半时间缺席市场，2025年10月回归。

它唯一的系列 Fourth Prime 讲述数字7——第四个质数——公司解释说各尺寸以此命名，标志上的三角形由七道线条构成。早期雪茄出自埃斯特利 RoMa Craft 的作坊 Fábrica de Tabacos Nica Sueño，本图集载有其词条。回归后，生产转到同在埃斯特利的 Córdoba & Morales，本图集在此点名而尚未描述的一家工厂。配方据称不变：宾夕法尼亚 broadleaf 茄衣、厄瓜多尔 Habano ligero 茄套、多米尼加与尼加拉瓜填充。

变化可以数出来：日食前七种尺寸，回归后四种；五十六支装变为二十一支装；价格上调。一家带着同样配方与另一家工厂回归的公司——正是本图集的规则为之而设的情形：国家是雪茄今日卷制之地，工厂被点名。'
 WHERE `name` = 'Fable Cigars' AND SHA1(TRIM(`history`)) = '676adaca0366de15e06f7b42c3d37eba651c84ab';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fable Cigars' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '676adaca0366de15e06f7b42c3d37eba651c84ab';
-- brands|Fábrica de Tabaco Estrela|history|zh — 人名公司名拉丁
UPDATE `brands` SET `history_zh` = '亚速尔在十九世纪有过自己的烟草工业——José Bensaúde 1866年开办 Fábrica de Tabaco Micaelense——而 Estrela 是蓬塔德尔加达的第二家工厂，1882年由 José Medeiros Cogumbreiro 在圣若泽堂区创立。它属于 Empresa Madeirense de Tabacos（EMT），做的是大西洋工厂都在做的事：卷烟和小雪茄，走量。

雪茄在那里是一项补充，规模小、另辟一室，正是它值得这个词条：一间女工们完全手工卷制的作坊，用巴西、古巴与多米尼加的填充，配美国或印尼茄衣。雪茄在模具里放两天，低温干燥，再上茄衣——Meia Coroa、Coroa、Robusto Estrela，木盒装。本图集把这家公司归入亚速尔，因为手艺在那里；烟叶来自别处，一如邻近的加那利。

2025年4月，EMT 与本图集载有词条的 Luciano Cigars 共同创立 Constella Group，后者成为 Luciano 的母公司：一家亚速尔卷烟厂如今是埃斯特利一家雪茄厂的合伙人。Estrela 进入本图集，既因它的作坊，也因这层关系。'
 WHERE `name` = 'Fábrica de Tabaco Estrela' AND SHA1(TRIM(`history`)) = '09219a0d9759ba71337f37b4817e148a52e63d13';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fábrica de Tabaco Estrela' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '09219a0d9759ba71337f37b4817e148a52e63d13';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ferio Tego' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '224b2a9757862cd5ee0a9b36fed635da8d35c5a1';
-- brands|Finca Tabaquera El Sitio|history|zh — 去除禁用字符
UPDATE `brands` SET `history_zh` = 'El Sitio 首先不是一个品牌，而是一片田。这座位于布雷尼亚阿尔塔拉洛马达的庄园耕作两万五千余平方米，其中五千平方米覆布遮荫，专供茄衣——即 cultivo bajo telón，群岛上再无第二家如此耕作。

主持庄园的 Antonio González 自十一岁起种植烟草。这是加那利群岛上立场极为彻底的一种：烟叶全部为帕尔马本地所产，连茄衣在内；而多数所谓的加那利雪茄，用的是进口的美洲烟叶。庄园筛选本地种子，承自十八世纪的种植园。

庄园 2005 年开放，周一至周五可参观。在那里可以跟随烟草从田间走到卷制台，经过晾房与发酵——这一完整链条，群岛上没有第二处能一并展示。'
 WHERE `name` = 'Finca Tabaquera El Sitio' AND SHA1(TRIM(`history`)) = 'bf7f8a086372f569c80d690ad6fe4180267dca63';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Finca Tabaquera El Sitio' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'bf7f8a086372f569c80d690ad6fe4180267dca63';
-- brands|Firecracker|history|zh — 红锚指代错误
UPDATE `brands` SET `history_zh` = 'Firecracker是一个短雪茄品牌，规格为3 1/2 x 50，头部拉长成引线状，诞生于新罕布什尔州Two Guys Smoke Shop连锁店的老板David Garofalo与分销公司United Cigars之手。品牌方将其推出时间定在2006年；Cigar Coop则将该系列的开端定在2007年，首款Firecracker由My Father Cigars为Two Guys的门店卷制，用于庆祝独立日。据Cigar Coop称，该系列此后成为年度版，交由不同的制造商生产，由United Cigars在全国范围内分销。

品牌方没有点出常规生产的Firecracker所在的工厂，只称其在多米尼加共和国手工制作。据Cigar Coop称，它们产自Tabacalera Magia Cubana，该厂归José Dominguez所有；Cigars Daily与Atlantic Cigar则同样称它们产自圣地亚哥。2026年10月，品牌方展示三条产品线，即Sun Grown、Maduro与Connecticut，其中Connecticut据Cigars Daily称曾在TPE 2024展会上作为常设产品线亮相；其目录中还有La Gianna与Red Anchor，Maduro雪茄环上的一枚红色小锚令人联想到后者。

为纪念美国250周年而设的年度版Independence Firecracker，于2026年在Arnold André Dominicana制作，而非在Magia Cubana：墨西哥Habano茄衣，多米尼加茄套，多米尼加与尼加拉瓜的ligero，以十二支装的tins销售，据Cigar Coop称。Premium Cigar Association称，该款于2026年6月24日正发往零售商。'
 WHERE `name` = 'Firecracker' AND SHA1(TRIM(`history`)) = '9c9423c34c71d7e8817ca904fc7d2934ff633c81';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Firecracker' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '9c9423c34c71d7e8817ca904fc7d2934ff633c81';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Flavoroute' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'ca9b842f768816862b54c7f5547967e8e9bee005';
-- brands|Flor de Selva|history|zh — 人名品牌名拉丁
UPDATE `brands` SET `history_zh` = 'Maya Selva 是洪都拉斯人，工程师出身，却在巴黎创立了自己的企业——在一个鲜有人从欧洲出发、到中美洲生产的行业里，这是不寻常的安排。Flor de Selva 从一开始就是为法国和欧洲市场而建，其风格面向习惯哈瓦那雪茄的味蕾：中度、木质，没有当时美国市场偏爱的甜腻张扬。

这家企业位于丹利，在哈马斯特兰山谷——洪都拉斯两大烟草产区之一。它在此以有节制的批量生产，并坚持一种罕见的配方连续性：配方逐年变动极小，而对一件农产品而言，这需要在选叶上持续下功夫。

它也是极少数由女性创立并领导的雪茄企业之一，而这个行业几乎完全由男性主导。这一点值得指出，但不必当作卖点：这个品牌是靠配方立住的。'
 WHERE `name` = 'Flor de Selva' AND SHA1(TRIM(`history`)) = '182a209bf57789bbeaceffa720b731993c6f6f98';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Flor de Selva' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '182a209bf57789bbeaceffa720b731993c6f6f98';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Flor del Sol' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '8fdac7d2f6cd8ad48063321534ade26679525ed2';
-- brands|Fonseca Nicaraguayen|history|zh — 家族公司名拉丁
UPDATE `brands` SET `history_zh` = '古巴版 Fonseca 与其非古巴同名品牌同名而不同主——而后者已易主，也换了国家。

Quesada 家族在其位于多米尼加共和国圣地亚哥-德洛斯卡瓦耶罗斯的 MATASA 工厂生产了它四十五年。本图集以其本名收录 Quesada 这家公司。

2019 年 12 月，García 家族接手。此后它在尼加拉瓜埃斯特利的 My Father Cigars 卷制——即本图集以 My Father 之名收录的品牌。'
 WHERE `name` = 'Fonseca Nicaraguayen' AND SHA1(TRIM(`history`)) = '1b0fa9cc03264f41586f9175ab8214b090b4beef';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fonseca Nicaraguayen' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '1b0fa9cc03264f41586f9175ab8214b090b4beef';
-- brands|Forged Cigar Company|history|zh — 去除多余星号标记
UPDATE `brands` SET `history_zh` = '这不是一家制造厂，本条目开门见山：Forged 是一家分销公司，由 Scandinavian Tobacco Group 于 2021 年 1 月 13 日设立，拥有自己的销售团队，2 月 1 日开始运营。

成立之初，它获得了 Partagás、La Gloria Cubana、Bolívar Cofradia、Diesel 与 Chillin'' Moose，而 General Cigar 保留 Macanudo、CAO、Cohiba、Punch 与 Hoyo de Monterrey。

2026 年 2 月，集团重新洗牌：Cohiba、Punch 与 Havana Honeys 转入 Forged，Partagás 与 Room101 转入 General。同一次调整将 Sancho Panza 与 Los Statos Deluxe 撤出价目表——这正是本图集不收录非古巴版 Sancho Panza 的原因。'
 WHERE `name` = 'Forged Cigar Company' AND SHA1(TRIM(`history`)) = 'd3becb0d40127088613e590099916e9677687a49';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Forged Cigar Company' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'd3becb0d40127088613e590099916e9677687a49';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fortis Cigars' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '3abd30f5575baa3c2c714049927693c01a8d7b18';
-- brands|Fratello|history|zh — 去除禁用字符
UPDATE `brands` SET `history_zh` = 'Omar de Frias 曾是美国航天局的工程师。他生于多米尼加共和国，在美国长大，做过大学篮球运动员，后取得工程学硕士；他正参与航天项目时，决定创办一个雪茄品牌。

筹备两年之后，Fratello 于 2013 年在 IPCPR 展会上亮相。这个名字在意大利语中意为「兄弟」。

一切均在埃斯特利的 Fábrica de Tabacos Joya de Nicaragua 卷制——本图集收录的这家全国历史极为悠久的工厂，也为 Dunbarton 与 Room101 代工。

目录由四条线支撑：Bianco、Oro、Boxer 与 Navetta。Navetta 在意大利语中意为「航天飞机」，对一位前航天工程师而言，这大概不是偶然。'
 WHERE `name` = 'Fratello' AND SHA1(TRIM(`history`)) = '6762001bce64ced2da8e3aff2a5b5e2b2650b83d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fratello' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '6762001bce64ced2da8e3aff2a5b5e2b2650b83d';
-- brands|Freud Cigar Co.|history|zh — 去禁用字；人名拉丁
UPDATE `brands` SET `history_zh` = 'Freud 是2022年的公司，安稳了五个月。Luis Torres 与 David Stadnyk 春天在纽约推出它，作为 Agape Lifestyle Inc. 的子公司，首款雪茄名为 SuperEgo——超我，弗洛伊德理论中负责评判的部分。它在坦博里尔的 Tabacalera William Ventura 卷制，本图集载有该厂词条。同年9月26日，工厂失火。

本词条因此有两个存在理由。其一平常：纽约构思、多米尼加卷制的牌子，本图集点出工厂。其二在于日期：Freud 是受2022年火灾波及的公司中成立时间居末的一家，其第二条线 AlterEgo 于2023年重建期间由卫星作坊与 El Maestro 推出。

名字循着理论走——SuperEgo、AlterEgo——人们等着 Ego。公司尚未说它是否会来。'
 WHERE `name` = 'Freud Cigar Co.' AND SHA1(TRIM(`history`)) = '892276737af4fd366633f4836ac105dba11acb26';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Freud Cigar Co.' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '892276737af4fd366633f4836ac105dba11acb26';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Gellis Family Cigars' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'a3db188a96fa30edccfcc319c9b0dc6a23c9994b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'German Engineered Cigars' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'ef329f225ccb801fe9dcf7a7edee63de5b2ca5d8';
-- brands|Gispert|history|zh — 人名公司名拉丁
UPDATE `brands` SET `history_zh` = '这一例与其他不同：此处是古巴放开了这个名字。

Simón Veja Peláez 于 1940 年在比那尔德里奥创立 Gispert，用的是上维尔塔的烟叶，以口味清淡著称——这在古巴产品目录中颇为少见。1959 年之后，先由 Cubatabaco、后由 Habanos S.A. 在 Carlos Balio 工厂生产，但销量渐衰，规格从十一款减至寥寥数款。Habanos 于 2005 年停产。

而 Altadis 早在 2003 年便已在洪都拉斯重启该品牌。如今它出自本图集已收录的 La Flor de Copán 工厂，有两个版本：厄瓜多尔康涅狄格种茄衣，或墨西哥圣安德烈斯马杜罗茄衣。'
 WHERE `name` = 'Gispert' AND SHA1(TRIM(`history`)) = '582da14e208aa4e922451ed3e2c12520e91bd759';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Gispert' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '582da14e208aa4e922451ed3e2c12520e91bd759';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'God of Fire' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'afa5fe9bc6934d72c139833968bf5ff47562971b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Golden Djawa' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '95c80c76e02f785f4bbab55133c72a4806d4aa6d';
-- brands|Gran Habano|history|zh — 人名拉丁；日期格式
UPDATE `brands` SET `history_zh` = 'Gran Habano 就家族而言是哥伦比亚的，就工厂而言是洪都拉斯的，本图集按工厂归类。Rico 家族自1920年起在哥伦比亚种植深色烟草，始于 Guillermo Rico 的祖父；1946年其父接手田地。Guillermo 本人1995年赴迈阿密，正值美国雪茄热兴起——他没有止步于经销商。

1998年他在洪都拉斯丹利开办工厂：G.R. Tabacaleras Unidas。五年后的2003年，父子二人——如今由 George Rico 执掌——推出 Gran Habano 品牌。首份目录只有三个数字：温和的 Connecticut No. 1、中等的 Habano No. 3、辛辣浓郁的 Corojo No. 5。它们至今仍在，加上后来的：3 Siglos、Gran Reserva、20th Aniversario、Blue in Green。

它与丹利邻居们的区别在于土地：G.R. Tabacaleras Unidas 在毗邻农场自种大部分烟叶，而非采购。这种规模的公司少有能两头兼顾的，本词条记下的正是这一点。公司本身设在迈阿密——三十年来洪都拉斯雪茄的销售之城。

2026年10月，德国零售商Cigarworld的页面以G.H.之名展示Guillermo Rico的雪茄，这些雪茄在洪都拉斯的Danlí卷制，在欧洲销售：该零售商写道，欧洲法律在当地禁止对并非产自该产地的产品主张地理标志，而原名让人联想到哈瓦那。G.H.的各条产品线Connecticut No. 1、Criollo No. 3和Corojo No. 5，沿用了Gran Habano的三个编号，其中No. 3名为Habano。同一家零售商还列出Gran Honduras和Guillermo Rico作为另外的名称，据其所述，这些名称在美国的商店里是找不到的。'
 WHERE `name` = 'Gran Habano' AND SHA1(TRIM(`history`)) = 'aae6a610346cf2098cf19d116ac06916452bd6c3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Gran Habano' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'aae6a610346cf2098cf19d116ac06916452bd6c3';
-- brands|Graycliff|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Graycliff 首先是拿骚的一家酒店餐厅，坐落在俯瞰邮轮进港的山丘上；店主 Enrico Garzaroli 在那里卖了二十年古巴雪茄之后，想要自己的雪茄。他请来 Avelino Lara——El Laguito 的前厂长、Cohiba 背后的人——并于1993年安排他离开古巴，先以游客身份，后获准长住。两人一起用进口烟叶调配：巴西、尼加拉瓜、洪都拉斯，有时是厄瓜多尔和喀麦隆，配印尼茄衣，Lara 用「贝通」——酒精与香料的浸泡液——为茄衣抛光，Garzaroli 只透露其中一味：苏玳甜酒。

生产始于1997年1月，一位卷工坐在餐厅入口处——公司这样说，行业媒体也描写过客人进门就看到的卷制台。雪茄于1997年10月运往美国。作坊离餐厅五十步，由 Garzaroli 请来的古巴退休卷工组成，平均年龄六十四岁，其中四位年近八十；他申报1999年卷制了六十五万支。Lara 2000年退休；此后由 Enrico 与儿子 Paolo 调配，十六位卷工。

巴哈马不种植任何烟草：这是卷制之国，本图集为这一家公司而开辟它，如同为瑞士那样。本图集载有词条的 La Palina，2010年正是在这里重启，之后才迁往别处。'
 WHERE `name` = 'Graycliff' AND SHA1(TRIM(`history`)) = '79fdb310bea9b8cac49ce9f513467fc4a84b2a24';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Graycliff' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '79fdb310bea9b8cac49ce9f513467fc4a84b2a24';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Great Wall Cigars' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'c72d2350dbb422aa1d82f6c45c06f166780c880f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Gurkha' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'a59d982eae2a8b83af20b0802ae39e88724a860b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'H. Upmann Dominicain' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'a7151b7073e05d58818dc0d0bd2cfdaecbc18540';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'H.R.' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'd09bc4c6775348cdad7a6b6a74be1157ec1bd70a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Helvada' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '5bc656c91267336cc745829a5f18b53b9aa6ff10';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Hemmys' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '8b60e6b9015260e6bdc9d5625a2bd83ce41ac61a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Henry Clay' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'e04a207b76f6d6203fafb1a0907a53f12dd60e04';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Herr Lehmann' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '3c1d04536bf595f2c7ea2226baa03a7a6270a2c1';
-- brands|Hiram & Solomon|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Hiram & Solomon 是共济会员为共济会员而写的品牌：Hiram Abiff，传说中圣殿的建筑师；所罗门，下令建造圣殿的国王。Fouad Kashouty 与 George Dakrat 2015年创办，各系列以会所的等级与职务命名——Entered Apprentice、Fellow Craft、Master Mason、Grand Architect、Shriner、Veiled Prophet、Traveling Man。公司说，用意是让弟兄们围着一支雪茄相聚。词条不评判这个想法；只记下它已坚持十年。

本图集要确定的是谁在卷。公司从多米尼加共和国起步，后来把大部分生产托付给 Plasencia。2021年，Fouad 与 Romy Kashouty 开始与坦博里尔 PDR Cigars 的调配大师 Abe Flores 合作调配——2021年2月的 Curamus，随后是2022年初的 Châbal、Revival 与 Sublime Prince 32。2022年6月，在与 Blanco Cigars 的履约协议结束两周后，公司宣布全部产品线转到 PDR。Flores 对行业媒体说，他们想只与他一家合作，不要别的工厂。

本图集的 PDR 词条已经点了它的名；这一条把环扣上。Entered Apprentice 与 Veiled Prophet 有一个少有词条能写的特点：配方里有巴拉圭烟叶。'
 WHERE `name` = 'Hiram & Solomon' AND SHA1(TRIM(`history`)) = 'f1457d87c624e183d9fa2cd962583b2db0a38d8f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Hiram & Solomon' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'f1457d87c624e183d9fa2cd962583b2db0a38d8f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Holt''s Cigar Company' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'e3ab8abd85d7a9d4eb33d5be0979211cd4df6b33';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Horacio' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'ae8e4ebb43939ac2391eb40db82f74f71d7e5986';
-- brands|Hoyo de Monterrey Honduras|history|zh — 品牌名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Hoyo de Monterrey 是个古巴名字——一个1865年诞生于阿巴霍谷的品牌。1960年之后，如同 Punch、Montecristo 与 Romeo y Julieta，这个名字在古巴之外被重新启用，其非古巴版本自此在洪都拉斯生产。两支雪茄除了烟标之外别无共同之处。

洪都拉斯的 Hoyo 甚至走了与古巴版相反的路。同名的哈瓦那雪茄以柔和著称——它是 Epicure 系列的品牌，是轻盈细致之作——而洪都拉斯版却把声誉建立在力度之上，直至成为美国市场浓郁风格的标杆之一。

它的 Excalibur 系列已收录于本图集，是它尤其广为人知的表达；这一系列长期被当作独立品牌销售，以致许多烟客并不知道它隶属于 Hoyo。'
 WHERE `name` = 'Hoyo de Monterrey Honduras' AND SHA1(TRIM(`history`)) = '597d01e31f8a4b8d97c19f3ca2afeb9f2d198b75';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Hoyo de Monterrey Honduras' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '597d01e31f8a4b8d97c19f3ca2afeb9f2d198b75';
-- brands|HVC Cigars|history|zh — 超出法文的比较级
UPDATE `brands` SET `history_zh` = 'HVC 是一个缩写，它道出了创办人的来处：Havana City（哈瓦那城）。Reinier Lorenzo 是来自哈瓦那的古巴人，2011 年创办了这家公司。

有十年时间他一无所有。他的雪茄在埃斯特利的 Aganorsa 卷制——本图集以 Aganorsa Leaf 之名收录的那一家，它自种烟叶。整份目录都建立在这种烟草之上。

2021 年，他在埃斯特利开设了自己的工厂。这是少有精品公司走出的一步：起步极小，如今年产近百万支。没有工厂的模式并非永久状态——有时它只是一个阶段。

各系列的名字与缩写说着同样的事。Serie A 全部由尼加拉瓜 A 级烟叶调配。Pan Caliente 取自古巴俗语，形容像热面包一样一出炉就卖光的东西，而它正是这家销量居首的一条线。'
 WHERE `name` = 'HVC Cigars' AND SHA1(TRIM(`history`)) = 'e3aa3fff06b3b23a0fc84dc23868621f22ca2270';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'HVC Cigars' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'e3aa3fff06b3b23a0fc84dc23868621f22ca2270';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ibis' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'c2ef227b9d2b21483e8227cca6ab594cc9801cd3';
-- brands|IGM Cigars|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'IGM——Inversiones González Martínez——是圣何塞一家自称精品店的小工厂：别处没有的规格和配方，手工制作，常常按客户选定的配方定制。公司自称1997年由有古巴根源的 González Ferrer 家族创立，其中的 José González Ferrer 是古巴培养的农艺工程师；工厂在海拔九百多米的圣玛尔塔-德普里斯卡尔山区种植，也从多米尼加、尼加拉瓜、秘鲁和厄瓜多尔购买烟叶。

人们通过它的客户认识它：本图集已收录的英国品牌 Casdagli 自2013年起把沙特市场的雪茄交给它，随后是2018年的 Daughters of the Wind 系列和2022年的 Cypher 3311——多米尼加和秘鲁茄芯，哥斯达黎加茄套和茄衣，一位名叫 Luis 的卷工负责 Cremellos。工厂向访客开放农场，从种子到雪茄。

没有独立报刊描述过它；词条来自公司及其客户，并如实说明。它有词条，是因为 IGM 是 Casdagli 的工厂——与 Tabacalera Palma 和 Aging Room 之间的逻辑相同。'
 WHERE `name` = 'IGM Cigars' AND SHA1(TRIM(`history`)) = '91538f827103fbff11c2fcea0f1e1f11bbb491f4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'IGM Cigars' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '91538f827103fbff11c2fcea0f1e1f11bbb491f4';
-- brands|Illusione|history|zh — 人名品牌名；nerveuse误译
UPDATE `brands` SET `history_zh` = 'Dion Giolito 在内华达开店，他觉得当时的雪茄都在往同一个方向走：更浓、更粗、更甜。Illusione 正诞生于这份不认同。这个品牌追求一种它乐于称为「旧式」的风格——干、木质、带辛香，没有那种已成尼加拉瓜常态的甜润——并在哈拉帕山谷的烟叶中找到了它：比埃斯特利的更细致、更劲道。

这家的烟标上布满符号、数字和隐晦的指涉，雪茄的名字往往就是数字。这是游戏，却与其主张一致：这个品牌面向的是会读烟标、比较尺寸、争论配方的烟客。

它在一个具体的点上长久地改变了格局：它让小尺寸重新体面起来。在市场一路加粗的年代，Illusione 为 coronas 与 lanceros 辩护，主张细身雪茄浓缩配方，而非稀释配方。'
 WHERE `name` = 'Illusione' AND SHA1(TRIM(`history`)) = '5a0ba75a9b796678596d8d2055086a632586622a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Illusione' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '5a0ba75a9b796678596d8d2055086a632586622a';
-- brands|J. Fuego|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'J. Fuego 是埃斯特利的一家工厂：7-20-4 词条写道，其雪茄自2021年7月起在此卷制。这里说说是谁在卷。

Jesús Fuego 是古巴人，来自比那尔德里奥，家族自购得埃尔科罗霍地区——正是那个品种之名——的一座农场以来种植烟草，他是第五代。作为农业工程师，他的论文以发酵为题，这绝非小事：发酵是各家守得极严的环节，也是风味定型之处。他曾在洪都拉斯与尼加拉瓜工作、为他人种植，其名声在 Rocky Patel 与 Nestor Plasencia 身边树立——两者皆在本图集中有词条。

2006年，他创办自己的公司。首款雪茄 Gran Reserva Corojo No.1 已道出纲领：科罗霍，他家族的烟叶，是一切的核心。Origen 是纯科罗霍雪茄；777 与 Heat 随后，再是 Sangre de Toro。

十年间他委托他人卷制。2016年，他在埃斯特利、Tabacalera Perdomo 对面开办自己的工厂，此后大部分时间在此度过。7-20-4 于2021年从洪都拉斯的 Tabacos de Oriente 迁至此处。

关于 777 说一句：它是 J. Fuego 的一个牌子，并非一家独立的洪都拉斯公司。'
 WHERE `name` = 'J. Fuego' AND SHA1(TRIM(`history`)) = '44be2041cbe6dd7a2674afd5f8665b17e395cabb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'J. Fuego' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '44be2041cbe6dd7a2674afd5f8665b17e395cabb';
-- brands|Jake Wyatt Cigar Co.|history|zh — 人名拉丁；球衣号码误译
UPDATE `brands` SET `history_zh` = 'Jake Wyatt 由两个孩子的名字组成：Neil Garcia 的儿子 Jake，与 Gerard Abajian 的儿子 Wyatt。两位合伙人2020年2月创办公司——Abajian 当了十年消防员，少年时在父亲加州的店里站柜台；Garcia 打过棒球，二十二支装的盒子取自他的球衣号码。

公司从多米尼加共和国起步，两人走访了给他们提供样品的工厂。后来它自称拥有一家独立的自有作坊，名为 Casamorabo，两万平方英尺；这一说法出自公司本身，没有其他页面加以证实。行业媒体在2026年4月确认的却相反：全部生产刚刚转到洪都拉斯丹利的 Tabacalera San Jerónimo，此前经过了几家多米尼加工厂，且整个系列已用洪都拉斯与尼加拉瓜烟叶重新调配。因此按卷制地规则，词条归入洪都拉斯。

目录按系列阅读——Gourmet，茄标精工、为拍照而生；Connoisseur，更为朴素——2026年 Titan 系列又添了三支日常雪茄：Goliad、Colossus、Omega。'
 WHERE `name` = 'Jake Wyatt Cigar Co.' AND SHA1(TRIM(`history`)) = 'c0caef1d84b4957997593de3d36ef70de30b3ba4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Jake Wyatt Cigar Co.' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'c0caef1d84b4957997593de3d36ef70de30b3ba4';
-- brands|JAMM Cigar|history|zh — 人名改拉丁字母；序数
UPDATE `brands` SET `history_zh` = 'JAMM Cigar 源于尼亚加拉瀑布附近一家赌场里递来的一支雪茄：巴伊亚北部种橙子、柠檬和橘子的 José Antônio Martins Monteiro，在那里认识了 Joaquim Alfredo Mesquita Moreira，后者递给他首支高价雪茄。两位朋友的姓名首字母组成了品牌名。他说，起初只为自己和送人而卷，直到会计给他算了成本，他才把它做成生意。2016年在离萨尔瓦多124公里的阿拉戈伊尼亚斯买下的 FEANBE 农场承载着 BR-110 公路旁的工厂，据2022年媒体报道成立于2020年，2021年起商业化生产。

工厂两年内扩建三次。2022年媒体称约有一百人直接或间接靠它生活；2024年日产4500支，其中2500支为长茄芯——其余为中、短茄芯，本图集不收。配方把雷孔卡沃的 Mata Fina 与在巴西种植的古巴种烟叶结合；长茄芯系列名为 Super Premium、Robusto Premium、Petit Lonsdale、Churchill、Gordito。

它是本图集所收巴西公司中成立时间居末的一家，却已是 Apcab 认定的、占全国手工雪茄主要份额的四家之一；创始人参与2026年的原产地命名项目。阿拉戈伊尼亚斯不属于雷孔卡沃——它更靠北，在帕拉瓜苏河谷之外——本图集为它开辟一个产区。'
 WHERE `name` = 'JAMM Cigar' AND SHA1(TRIM(`history`)) = '97b80f5872fa08dcc7961856fc792f757d8d4ced';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'JAMM Cigar' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '97b80f5872fa08dcc7961856fc792f757d8d4ced';
-- brands|Jas Sum Kral|history|zh — 人名拉丁；多余添加
UPDATE `brands` SET `history_zh` = 'Jas Sum Kral 在马其顿语里意为「我是王」，这是一位赴美从事信息技术的马其顿人 Riste Ristevski 的品牌，他2015年决定不再抽别人的雪茄，而做自己的。茄标借用他祖国的纺织图案——其中一个花样来自他女儿身穿乡村婚礼服的照片——公司的语调就是创始人的语调：直来直去，公开与联邦监管为敌。

公司自己公布工厂沿革，这是少有的。2015至2017年，雪茄出自 NOA——New Order of the Ages——当时由古巴调配师 Noel Rojas 主持的埃斯特利作坊，本图集载有 Rojas 词条：Jas Sum Kral 是本图集第五家经他之手的公司。2018年至2024年10月，雪茄出自 Roniel 与 Roidel Aragón 兄弟的 Tabacalera Aragón，该厂因没有自有品牌在此没有词条。2024年10月11日，经过六个月重新调配各线之后，Ristevski 离开 Aragón，转到埃斯特利的第三家工厂——并选择不公布其名。本图集不为工厂未点名的公司立词条，此处是有意的例外：拒绝点名由公司本身记录在案，且三家工厂中有两家已点名。

目录是尼加拉瓜的、不绕弯子的——Red Knight、Crna Nok（黑夜）、Tyrannical Buc、Nuggs、Zlatno Sonce（金色太阳）——公司直销，用它的话说，从工厂的卷制台直达顾客家门。'
 WHERE `name` = 'Jas Sum Kral' AND SHA1(TRIM(`history`)) = '7895e3e3d8152c55cf7266fedd4066151bca37ef';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Jas Sum Kral' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '7895e3e3d8152c55cf7266fedd4066151bca37ef';
-- brands|Joyas de Panamá|history|zh — 人名拉丁；公司名拉丁
UPDATE `brands` SET `history_zh` = 'Joyas de Panamá 是巴拿马留住的那家老号。Miriam Padilla 于1986年2月在科克莱省的拉平塔达创办了它，巴拿马媒体称之为全国首家常设雪茄厂——这话也说明了此前的情形：开了又关的作坊。

它并非凭空而来。1981年3月，Gilberto Oliva 与 Nestor Plasencia 将古巴烟种带到科克莱；同年 Coclé Tobacco Factory 在佩诺诺梅开业，1984年 Tabacos Panamá S.A. 在拉平塔达设立。Padilla 在自立门户之前曾任 Oliva 公司的生产主管：她带走的不是一个牌子，而是一门手艺——本词条如此表述，因为这正是资料所能确立的。

卷制全凭手工，用古巴烟种，依循从这些师傅处学来的做法。烟叶来自拉平塔达、索纳多拉一带的火山土，以及一处名为 Sortová 的地方。在后一点上资料彼此不一，本图集不予裁断：奇里基省布加巴区确有一个 Sortová，而巴拿马媒体把产烟的 Sortová 归在科克莱。两省都种烟；同一个名字或许指着两处地方。

这家老号于2023年停工——先是疫情，继而 Padilla 退休。她的儿子 Braulio Zurita 重开了作坊并主持至今。这正是本词条用现在时书写的原因，也是它仍然谨慎的原因：2025年一篇寻访巴拿马雪茄的报道发现科克莱其余作坊均已停工，整个产业为经营不善、涉税凭证欺诈指控与拖欠工资所困。Joyas de Panamá 是从中存活下来的那一家。

此处不列任何系列名称，这是有意的：该号没有任何可核实的公开系列。本图集有十四则词条处于同样状况。为未曾见过的系列命名，正是重复刚刚从巴拿马移除的那个错误——一整则凭空构筑的词条。'
 WHERE `name` = 'Joyas de Panamá' AND SHA1(TRIM(`history`)) = 'a2babc38a82bed6ba6aec64445efb6f2cee41887';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Joyas de Panamá' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'a2babc38a82bed6ba6aec64445efb6f2cee41887';
-- brands|Juan Clemente|history|zh — 品牌人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Juan Clemente 凭一个别人都不敢做的怪招而易于辨认：它的烟标不贴在靠近雪茄头的位置，而是贴在茄脚——你点燃的那一端。

这并非卖弄。茄脚是一支雪茄上尤为脆弱的部分：那里的茄衣是散开的，稍受磕碰就会裂开。烟标贴在那一端，可以把它固定到点燃之时，随后自行脱落。这是制造者的解决办法，出于对结构的执着——并因此成为一个十米开外就能认出的签名。

它的创始人 Jean Clément 是法国人。他于1982年在圣地亚哥-德洛斯卡瓦耶罗斯创立了这家企业，并把自己的名字西班牙语化，认为这样在这个行业里更好听。在那个时刻，一个法国出身又是一重异数：这个国家正在崛起，而几乎所有新品牌都出自流亡的古巴家族。

风格属柔至中度，遵循经典的多米尼加传统：雪松、干草，一种含蓄的柔和，尺寸往往偏细。产量始终不大，这个品牌属于那类人们用过去时谈论、却其实从未真正消失的企业。'
 WHERE `name` = 'Juan Clemente' AND SHA1(TRIM(`history`)) = '7f034a727f72c0a663e5af9efb4b4c0c22dbdaa5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Juan Clemente' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '7f034a727f72c0a663e5af9efb4b4c0c22dbdaa5';
-- brands|Kafie 1901|history|zh — 人名改拉丁字母；序数
UPDATE `brands` SET `history_zh` = 'Kafie 1901 名字上是洪都拉斯品牌，地点上是多米尼加品牌，本图集按后者归类。这个数字是 Kafie 家族定居特古西加尔巴的年份。Gaby Kafie 本人是外科医生——足踝骨科、运动医学——直到2007年一种罕见眼疾迫使他在三十八岁退休。雪茄是他之后做的事。

公司2013年在佛罗里达成立，雪茄委托丹利的 Reyes 家族工厂 Puros Aliados 卷制，本图集载有其词条。2017年 Kafie 在同一城市开办自己的工厂：Tabacalera G. Kafie y Cía，两千平方英尺，二十人，含十二名卷烟师、两名调配大师、一名烟叶采购与一名发酵主管，年产十五万支，分四款配方——Don Fernando Maduro、Connecticut、Sumatra、San Andrés。

它撑了四年。2021年11月，蹂躏该地区的飓风与被疫情打断的供应链压垮了它：Kafie 关闭丹利厂，把全部生产迁到多米尼加共和国历史居首的工厂 La Aurora——本图集同样载有其词条。新生的首支雪茄 Serie L Natural 是与 La Aurora 调配大师 Manuel Inoa 共同调配的全多米尼加配方；L 是罗马数字五十，纪念 Kafie 2021年7月的五十岁生日，而雪茄晚了一年多，于2022年9月才上市。

曾拥有工厂又失去它，与精品雪茄界的惯常轨迹恰好相反。本词条如实写下。'
 WHERE `name` = 'Kafie 1901' AND SHA1(TRIM(`history`)) = '05f406d0640965b44df9725e4311e03e67dbb48f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Kafie 1901' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '05f406d0640965b44df9725e4311e03e67dbb48f';
-- brands|Karen Berger Cigars|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = '三代人，三个国家，每一次留下的都是烟草。Max Berger 1940年代逃离希特勒治下的波兰，落脚古巴，在比那尔德里奥办起一家工厂。革命又把他赶走；1960年代他带着儿子去了美国，决定与烟草一刀两断。儿子 Enrique——「Kiki」——没有听从这个忠告。

1990年代美国雪茄热潮兴起时，Kiki Berger 去了尼加拉瓜，买地，在埃斯特利开办工厂 Tabacalera Estelí，旁边是两百英亩的 Vegas 农场。公司至今仍在那里。它也是 Cuban Crafters 的工厂——迈阿密小哈瓦那的那家店铺与同名品牌，Kiki 是其共有人，本图集载有其词条：两家出自同一作坊。

Karen 是尼加拉瓜人，就来自埃斯特利。十八岁时，作为工商管理专业的学生，她为付学费在城里一家工厂当卷烟工。那家工厂正是 Kiki Berger 的。两人结婚，共同经营；2014年他五十六岁去世后，是她接过了一切——工厂、农场、代托纳比奇的店铺。业内说她是唯一一位从土地到柜台、从头到尾拥有并经营一家雪茄公司的女性。

她先把 Don Kiki 系列从四款配方扩到六款。随后于2016年推出署名系列：K by Karen Berger，用自家农场的烟叶。2021年，业界授予她「年度烟草女企业家」。'
 WHERE `name` = 'Karen Berger Cigars' AND SHA1(TRIM(`history`)) = 'dc208a10bb48f4e5d7b13db513e6380d3b347b56';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Karen Berger Cigars' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'dc208a10bb48f4e5d7b13db513e6380d3b347b56';
-- brands|Kelner Boutique Factory|history|zh — 禁用字串、专名拉丁化、城市
UPDATE `brands` SET `history_zh` = 'Kelner这个姓，多米尼加雪茄界无人不晓，理由很具体：Hendrik「Henke」Kelner是那位创办并执掌Davidoff多米尼加工厂Tabadom三十余年的烟草大师。其子Hendrik Kelner Jr.在父亲身边工作了十八年，2012年在圣地亚哥-德洛斯卡瓦耶罗斯开办了自己的厂：Kelner Boutique Factory，业内称KBF。

「精品」一词须按字面理解。这是一家很小的工厂，也正是按此设想的——不是Davidoff的附属，而是一个在多米尼加规模居首的老号受训的调配师去做那家老号不会做的雪茄的地方。它替他人卷制：Casdagli于2013至2016年间——在古巴与哥斯达黎加之间——在此制作雪茄；Principle至今在此制作。

自有品牌稀少且带署名。Smoking Jacket冠以厂名。The 73——Kelner Jr.的出生年份——是与美国订阅俱乐部Privada Cigar Club的合作。

另一位Kelner走了同样的路：同一家族的Klaas Pieter Kelner于2023年在圣地亚哥自由区开办了自己的工厂。数家工厂，一个家族，一个流派——Davidoff的流派，本图集载有其词条。

Centaur Cigars是该工厂为第三方卷制的另一个品牌：该名称是Tobias Forst的，他以希腊神话为主题。2026年十月，其雪茄归入Hero Series，以英雄命名，包括Cheiron、Achilles、Odysseus、Jason、Perseus和Kronos，德国零售商以Toro规格销售，Kronos则为Toro Grande。它们由Hendrik Kelner Jr.在圣地亚哥-德洛斯卡瓦耶罗斯的Kelner Boutique Factory手工卷制。'
 WHERE `name` = 'Kelner Boutique Factory' AND SHA1(TRIM(`history`)) = '619f3ee2dde56be1e92221266835997913ab2ea3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Kelner Boutique Factory' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '619f3ee2dde56be1e92221266835997913ab2ea3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Kinix' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'd462bb12f55dce97bdfc8531d37247202f8ea660';
-- brands|Kolumbus|history|zh — 庄误用；每月约两千多余
UPDATE `brands` SET `history_zh` = 'Kolumbus是拉帕尔马岛上的一家小公司，卷制长填料——整叶——所用烟草全然产自本岛：布雷尼亚品种，生于该岛东部的火山土壤，其烟田也在那里。烟叶在卷制前要在西班牙雪松地窖中陈化数年。

它由三位朋友创办。公司既未公布他们的姓名，也未公布创立年份，本图集不予杜撰。其销售由Stefan Baltisberger在瑞士经办。

它近年的遭遇说明了整个加那利的处境。原本针对卷烟走私而制定的欧盟Track & Trace法规被扩及雪茄：每一支都须带有唯一识别码与安全标记，这就需要认证标签打印机、专用软件与按月付费的许可。网络杂志zigarren.zone估算此项投入超过七万瑞士法郎，另加每月两千法郎，并称该公司整整一年没有任何出口。

对一家手工卷制数千支雪茄的作坊而言，这份负担与其产量毫无对应关系。这条规则并非为对付这样的公司而写；它却照样落到它们身上——一个行业圈子无人决定却悄然消失，往往正是这类缘由。'
 WHERE `name` = 'Kolumbus' AND SHA1(TRIM(`history`)) = '9a7d59ac3ae9a6e95a1b3075dbc03668b3b5c738';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Kolumbus' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '9a7d59ac3ae9a6e95a1b3075dbc03668b3b5c738';
-- brands|Kristoff|history|zh — 城市未译
UPDATE `brands` SET `history_zh` = 'Kristoff起于一次它的创办人并未请求的来访。2004年，多米尼加共和国Charles Fairmorn工厂的Rolando Villamil前往芝加哥，想请Glen Case夫妇在美国代理他打算生产的雪茄。

Case当时从事金融。他接受了参观工厂的邀请，去了——回来时却带着另一个想法：在那里调配自己的配方，由Villamil负责生产。他离开金融业，同年创办了Kristoff。

工厂此后改了名：Charles Fairmorn成了圣地亚哥的Tabacalera von Eicken。品牌留了下来。

至于烟叶，则来自四面八方——洪都拉斯、尼加拉瓜、多米尼加共和国、巴西、厄瓜多尔、康涅狄格、宾夕法尼亚、非洲。这与风土逻辑正相反，而且是有意为之：定义一支Kristoff的不是产地，而是配方。

位于圣地亚哥的Tabacalera von Eicken并非只卷制Kristoff。它曾名为Charles Fairmorn，这一名称在其他品牌上仍是制造商的名称。2026年十月，德国零售商Cigarworld提供三个不属于Kristoff的品牌：Dominican Santiago Selection，该系列的页面将其标注为2003年，为longfiller；Quisqueya和R.A. Villamil，为medium-filler，其中R.A. Villamil的Clasico标注为2007年。位于布鲁赫萨尔的Kleinlagel被列为前两个的分销商。'
 WHERE `name` = 'Kristoff' AND SHA1(TRIM(`history`)) = '7ef0b769e1facec2684b1fe676f57cbf7727498d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Kristoff' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '7ef0b769e1facec2684b1fe676f57cbf7727498d';
-- brands|L'Atelier|history|zh — 含禁用字串，改写
UPDATE `brands` SET `history_zh` = 'L''Atelier是Pete Johnson的第二家公司，本图集已以Tatuaje之名收录了他先前创办的那一家。他于2012年与Dan Welsh、K.C. Johnson和Sean Johnson共同创办，与Tatuaje同处一个屋檐之下。

其公开的意图并不寻常，且有两层：以烟客负担得起的价格做高级雪茄，并提升人们对每一价位雪茄的期待。公司头一年推出两个高端品牌L''Atelier与Surrogates，另有两条价格从紧的产品线。

一切均由García家族在埃斯特利的My Father Cigars卷制——本图集以My Father之名收录的那家工厂，也正是Tatuaje所用的那家。两家公司、一位创办人、一间作坊：这是精品圈中脉络十分清晰的一种格局，也是少数明白承认这层关系的例子。

这也是L''Atelier有别于其他没有自有工厂的公司之处。Crowned Heads或Dunbarton把生产分散到数家工厂，而Johnson只用一家——正是他首个品牌所用的那家。'
 WHERE `name` = 'L''Atelier' AND SHA1(TRIM(`history`)) = '3bfb04e46cb14887e0f09a675ede909f9878423c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'L''Atelier' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '3bfb04e46cb14887e0f09a675ede909f9878423c';
-- brands|La Aroma de Cuba|history|zh — 人名拉丁化、漏主语
UPDATE `brands` SET `history_zh` = 'La Aroma de Cuba是一个十九世纪的古巴名字，却已有一个多世纪不在古巴生产任何东西。品牌可上溯至1880年代；其注册在世纪之交后散失，与数十家被出售、转手或干脆遗忘的古巴老号一样。

拥有Ashton（本图集已收录）的Levin家族在1990年代取回了权利，并于二〇〇〇年代初以洪都拉斯制造重启该品牌。

转折在2009年。José「Pepin」García全面重制配方，生产迁往埃斯特利的My Father：康涅狄格宽叶茄衣，茄芯全为尼加拉瓜烟叶。正是这一版本成就了品牌，也正是它使其归入尼加拉瓜而非洪都拉斯或古巴。

此外，这家公司把Winston Churchill算作其古巴时期的早期烟客之一。这是一个古老的商业说辞，并无独立来源可以证实——与加那利的Vargas如出一辙。本图集将它归还给主张者，并不据为己有。

在德国和瑞士，该品牌以La Aroma del Caribe之名销售。2026年十月，德国零售商Cigarworld以此名称提供该品牌，制造商为My Father Cigars S.A.，进口商为位于雷林根的M. K. & Söhne，所列系列中有Mi Amor。一个雪茄分析页面将其关联至Ashton，该品牌在美国称为La Aroma de Cuba。在瑞士，Pasion Churchill被标示自2023年三月起可在进口商The Royal Cigar Company处购买。'
 WHERE `name` = 'La Aroma de Cuba' AND SHA1(TRIM(`history`)) = 'c0aab599a4ee2262e20beb92cb18e2b0f2cd31f0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Aroma de Cuba' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'c0aab599a4ee2262e20beb92cb18e2b0f2cd31f0';
-- brands|La Barba|history|zh — 含禁用字串，改写
UPDATE `brands` SET `history_zh` = 'La Barba换了国家，却没换名字。Tony Bellatto与Craig Rossi在2010年代初创办了这家公司；首支雪茄La Barba Red于2013年问世。

它当时在洪都拉斯卷制，出自丹利的Aladino工厂——Eiroa家族那一间，也就是本图集在Asylum条目中讲到的那座旧电影院。

2014年，Purple以多米尼加烟叶问世，公司随之与Tabacalera William Ventura合作。Red也跟着走了：它离开洪都拉斯，转入同一间作坊。那正是Robert Caldwell委托调配的工厂，本图集收录了这两家。

各条产品线以颜色而非名称标示——Red、Purple——这也是一种做法：在雪茄开口之前，不作任何许诺。

2022年9月26日，一场火灾烧毁了Tabacalera William Ventura；生产转往卫星作坊与El Maestro继续，同名新厂于2024年3月重开。该厂有自己的词条：Tabacalera William Ventura。'
 WHERE `name` = 'La Barba' AND SHA1(TRIM(`history`)) = 'b0afeff4db4f3e0812ffe46149bc914171c332bc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Barba' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'b0afeff4db4f3e0812ffe46149bc914171c332bc';
-- brands|La Flor de Copán|history|zh — 图册与图集不一致
UPDATE `brands` SET `history_zh` = '圣罗莎德科潘自殖民时代起就在卷制烟草：这座城市的发展要归功于一座皇家烟厂，其历史中心正是围绕它建起来的。在这片大陆上，能宣称城市与一种作物有如此长久延续关系的地方并不多。

现今的工厂延续着这层关联。它卷制的雪茄主要面向欧洲市场，风格是典型的洪都拉斯路数——比尼加拉瓜更带土味，比多米尼加更浓——而制作的稳定性，则源自世代在本地培养的工人所积累的经验。

在本图集中，这是地点重于品牌的一个例子：人们去圣罗莎德科潘，既为这座城，也为这座厂，而它的烟草博物馆讲述的故事，是少有国家页面能够提供的。'
 WHERE `name` = 'La Flor de Copán' AND SHA1(TRIM(`history`)) = '066a2c924805ac7eb4b611b9d974310b2208730c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Flor de Copán' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '066a2c924805ac7eb4b611b9d974310b2208730c';
-- brands|La Flor Dominicana|history|zh — 城市未译；卷烟工误用
UPDATE `brands` SET `history_zh` = 'La Flor Dominicana出自Litto Gómez与其妻子Ines Lorenzo之手，前者曾是迈阿密的珠宝商。据行业媒体报道，这对夫妇于1994年带着Los Libertadores品牌踏入雪茄行业，在维拉冈萨雷斯的一间小作坊里，只有四个卷制工位。1996年，因一场纠纷，Litto Gómez与Ines Lorenzo接手了这家企业，但不带Los Libertadores品牌，雪茄随之改名为La Flor Dominicana。据维基百科，首批雪茄于1996年在圣地亚哥生产；工厂如今设在坦博里尔（截至2026年10月的情况，仅此一个来源）。

Chisel是一种楔形头的异形雪茄，据行业媒体报道于2003年推出：Litto Gómez据说是在前往工厂的路上想到了这个主意，这个形状花了十个月调试，他让自己的卷制师把它复制出来。它收在Double Ligero系列之中，厂家将该系列描述为以厄瓜多尔产的深色Sumatra烟叶作茄衣，阳光下种植，内里的芯叶与束叶为多米尼加烟叶，来自庄园自家种植。

José「Jochi」Blanco是一名雪茄制造者，2007年行业媒体称他与La Flor Dominicana共用一座120英亩的农场；他并非该品牌的创办人。'
 WHERE `name` = 'La Flor Dominicana' AND SHA1(TRIM(`history`)) = 'af35374bf82e4aae217449ccc120209dd3278e99';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Flor Dominicana' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'af35374bf82e4aae217449ccc120209dd3278e99';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Fontana' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '3d2a1879ef63820e6056990462a3b16a7600c411';
-- brands|La Galana|history|zh — 人名拉丁化；术语统一
UPDATE `brands` SET `history_zh` = 'La Galana是Annette Meisl的工坊。这位科隆女子曾是艺人经纪、作家和音乐人，直到在古巴陷入她所说的烟草魔力。她请古巴女大师Silvia Hernández教她卷制，随后多年亲身学习尼加拉瓜和洪都拉斯的手法。La Galana生于2005年；四年后她在埃伦费尔德开了一家古风陈设的店铺，附带沙龙。

雪茄是进口加勒比烟叶的长填料，由女卷工——公司用阴性词，因为雇的是女性——按它所称的德国质量标准手工卷制。本图集把它归入德国，并与德累斯顿、佩尔莱斯罗伊特一道把德国开辟为卷制之地：三家作坊，三段不同的故事，同一种手艺。

一人之公司，在一座没有雪茄传统的城市；来源是这座城市的杂志。词条如实说明，不编造数字。'
 WHERE `name` = 'La Galana' AND SHA1(TRIM(`history`)) = '578a0036c9cdbe7d564608e5fd38cb13797dcdbf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Galana' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '578a0036c9cdbe7d564608e5fd38cb13797dcdbf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Gianna' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '85d28ca4e3ad25672a62556d609b5a76c7d5791f';
-- brands|La Gloria Cubana Dominicaine|history|zh — 人名应为拉丁字母
UPDATE `brands` SET `history_zh` = '这一个并非诞生于商标注册，而是诞生于一间工坊。

老Ernesto Perez-Carrillo 1959年从古巴来到美国，1968年在迈阿密小哈瓦那的第八街开设了El Credito工厂。非古巴版的La Gloria Cubana于1972年在此问世。其子Ernesto Perez-Carrillo 1980年接手，并将其打造为该厂的招牌。

1996年，El Credito拥有三十名卷制师，年产约120万支雪茄，其中五分之四为Gloria Cubana。需求超出了工坊的产能：生产迁往多米尼加共和国，General Cigar于1999年收购该品牌。这位Ernesto Perez-Carrillo此后创办了自己的品牌，即本图集收录的E.P. Carrillo。'
 WHERE `name` = 'La Gloria Cubana Dominicaine' AND SHA1(TRIM(`history`)) = 'a587d1213c1e2b8e2252eedf50b0095a4cc40285';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Gloria Cubana Dominicaine' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'a587d1213c1e2b8e2252eedf50b0095a4cc40285';
-- brands|La Palina|history|zh — 电视网误；法语词残留
UPDATE `brands` SET `history_zh` = 'La Palina是1896年的一个老字号，由孙辈重新启用。乌克兰移民Samuel Paley于那一年在芝加哥开设雪茄店，创办Congress Cigar Company；他以妻子Goldie Drell Paley的名字为品牌命名。到1910年，他在费城已有一座工厂。

其子William S. Paley借电台推销雪茄——节目名为La Palina Hour——并因此入迷，1928年索性取得了播出该节目那家广播网的控制权。他离开雪茄业，把CBS做成了后来的样子。Congress Cigar Company在Samuel于1926年退出后清算，这个名字随之湮没。

William Paley Jr.，人称Bill，于2010年将它重新启用。起初的雪茄产自巴哈马，数量不多。

这家公司自称为贸易商，这正是本条目的关键：它不拥有任何工厂，却拥有自己的烟叶、成品与品牌。因此它请别人代卷，分工是公开的——Goldie与Mr. Sam在迈阿密小哈瓦那的El Titan de Bronze，其中Goldie由一位卷制师独自完成；Classic在多米尼加共和国的PDR Cigars；El Diario与Maduro在洪都拉斯的Raíces Cubanas；Nicaragua Oscuro在A.J. Fernández；1896在巴哈马的Graycliff。这五家合作方中，已有三家在本图集中设有专条。

这正是本条目归入美国的原因：这家公司的高端线Goldie与另外两条线均出自迈阿密。本图集按主要产地归类——并把其余写明，而非略去。'
 WHERE `name` = 'La Palina' AND SHA1(TRIM(`history`)) = '5d26ec42be22cf2141440b4954fd401694158f1d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Palina' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '5d26ec42be22cf2141440b4954fd401694158f1d';
-- brands|La Sirena|history|zh — 含禁用字串；人名拉丁化
UPDATE `brands` SET `history_zh` = 'La Sirena是Arielle Ditkowich的品牌，2009年与Nestor Miranda合伙创立——后者是Miami Cigar & Co.的创始人，本图集载有其词条。茄标上的美人鱼来自神话，首条产品线La Sirena Original出自García家的My Father工厂，2014年转到Erik Espinosa的La Zona，此后一直在那里以尼加拉瓜Habano oscuro茄衣卷制。同年公司收购了Old School Cigars。本图集把它归入尼加拉瓜，即冠名系列的产地。

此后目录分散到三个国家，词条记下这一点，因为对这么小的公司而言少见：一条线在洪都拉斯Plasencia的El Paraíso厂；Oceano在多米尼加共和国Quesada的MATASA调配；2019年5月以Aniversario Especial庆祝十周年之后，又有了以墨西哥国旗配色的Mexican Mermaid。

末次的公开踪迹是2022年：当年卷制一千支的限量版，公司称四年内每年释出一千支，直到2025年。此后行业媒体不再描写它；公司网站仍在运行。词条以现在时书写，因为已宣布的计划仍在进行，词条也如实说明。'
 WHERE `name` = 'La Sirena' AND SHA1(TRIM(`history`)) = 'd572be5f19886bf17f628c135ab45d94662a9732';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Sirena' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'd572be5f19886bf17f628c135ab45d94662a9732';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Unica' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '808df0ef8a1dd7d45dcba87a50e266028a40241d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Las Cabrillas' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'db78103126616256888f9e9188cca4067aff4fdc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Latitude Zero' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'd2f68f39b803e0ab6e2f817edb5794b0fe7f90af';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Laura Chavin' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '243e5da845a5348ed62b6b54a89b1eabc2de100a';
-- brands|Le Fagot Cigar|history|zh — 品牌名缺 Le
UPDATE `brands` SET `history_zh` = 'Le Fagot Cigar在阿比让手工卷制雪茄。该品牌宣称秉持本地工艺、产品不含任何添加剂，并自述为一群年轻匠人的作品。

产品线有三个名字：Robusto、Aboussouan，以及Fagorillos组合装。Aboussouan以科特迪瓦地名命名：北部的Le Poro，中部的Tiébissou与Djékanou。

烟叶产自科特迪瓦。阿比让经销Fagot的雪茄行称其以蒂耶比苏的茄衣，配迪迪耶维的茄套与茄芯——两地同属贝利耶大区的相邻省份——当地媒体也报道采收、晾制与发酵均在国内完成。至于品种，则无处提及。'
 WHERE `name` = 'Le Fagot Cigar' AND SHA1(TRIM(`history`)) = 'd4ac66b4ee1c2127f858778dfaccac180b486b38';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Le Fagot Cigar' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'd4ac66b4ee1c2127f858778dfaccac180b486b38';
-- brands|League of Fat Bastards|history|zh — 含禁用字串，改写
UPDATE `brands` SET `history_zh` = 'League of Fat Bastards，简称LOFB，是澳大利亚企业家Adam Levine的品牌，据Premium Cigar Association于2026年5月13日称。品牌方在其网站上称，该品牌源于Adam在2019年经历的一场磨难，并将净利润的40%捐给男性心理健康事业；品牌方未标明创立日期。起初有日期可查的记录是2023年8月8日的一份新闻稿（预告9月发货）和2024年3月12日的一篇文章，后者称Serie L的发布晚会于2月17日在迈阿密举行。

Serie L的拼配由Adam Levine与Joya de Nicaragua的Juan Martínez远程调配而成，据2024年3月的文章称，该系列在Joya de Nicaragua制作；2024年11月推出的Serie O，据Cigar Coop称，由该工厂在埃斯特利卷制，Cigar Coop还写道，Adam Levine这一次在现场工作。据Stogiepress称，2025年PCA上推出的Skinny Bastarda在多米尼加共和国的Quesada工厂制作，由Raquel与Patricia Quesada负责。品牌方未在其网站上点明其工厂，而Cigar Coop于2025年11月写道，品牌方没有说明谁来卷制首款限量版Wingman。

其末次发布Department of Honor汇集四支雪茄，分属两种拼配，专供2026年PCA的零售商，自2026年5月中旬起发货；据Premium Cigar Association称，它们在尼加拉瓜制作，未点明工厂。2026年10月，Cigar World销售Serie L与Serie O，Neptune Cigars则销售Serie L、Skinny Bastarda与Wingman。'
 WHERE `name` = 'League of Fat Bastards' AND SHA1(TRIM(`history`)) = '2c73f1c1b065a4993d986d328480f52325d2602c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'League of Fat Bastards' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '2c73f1c1b065a4993d986d328480f52325d2602c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Legado' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '1faaf7d138a9daf1413ae70057c9a5a57760c202';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Leite & Alves' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '24e78d471c32944cef8c91d7f4a7b6077b95de4e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Licenciados' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'd670661c3aada88b8520bedb958ea12badd8dc64';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Loaisiga' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '39557292fdb79ff62719541dbaa791193b497e30';
-- brands|Los Amigos|history|zh — 友谊年限只属后两人
UPDATE `brands` SET `history_zh` = 'Los Amigos于2024年诞生，源于三位因烟草结缘的商旅友人之间的情谊：南非人Pedro Ramos，随父亲从事雪茄行业已十七年；巴西人Walter Saes；以及智利人Eduardo Lahsen，后两人相识约十年，Wanted Online如是说。三人花了大约一年时间考察各家工厂，之后选定了一家尼加拉瓜的小型工厂，Ramos表示。

这家工厂就是位于埃斯特利的Tabacalera Familia Disla S.A.，同年由Esteban Disla——自幼在多米尼加共和国接触烟草——与Daniel Lance共同创立，Cigar Coop如是说。据该雪茄厂网站介绍，其工厂种植着八十公顷土地，除其他品牌外也卷制Domain Cigars。

2026年8月，Los Amigos通过Domain Distribution在美国市场首次亮相，这是Disla与Lance旗下公司Domain Cigars推出的一项服务，随Small Batch 2025系列一同发布，Cigar Dojo如是说：Epiphany，厄瓜多尔Habano茄衣，Robusto（5 x 50）；The Sacred Blend，茄衣相同，Grand Robusto（5 x 56）；Legacy of the Leaf，墨西哥San Andrés茄衣，盒压（4½ x 60）；以及Hedonism，Connecticut Broadleaf茄衣，Toro（6 x 52）。'
 WHERE `name` = 'Los Amigos' AND SHA1(TRIM(`history`)) = 'ec4beec6fa43fd3cd103c2e1f64879a4a4a2b1d5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Los Amigos' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'ec4beec6fa43fd3cd103c2e1f64879a4a4a2b1d5';
-- brands|Luciano Cigars|history|zh — 人名公司名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Luciano 是一个巴西人的名字，而冠以此名的工厂起初属于一个古巴人。Eradio Pichardo 2005年离开古巴，此前曾任职于 Habanos S.A.；同年2月他在埃斯特利开了一间小作坊 Dhatuey Tabacos。Luciano Meirelles 则来自圣保罗与金融界——保险、二十二岁时的一支投资基金、之后是拉美的政治咨询公司。2008年，本图集载有词条的 Ernesto Perez-Carrillo 把两人引见给彼此。2009年1月，Meirelles 成为 Pichardo 的合伙人，作坊更名 Tabacalera Pichardo。

工厂扩大了，本质未变。2020年有六十四名卷烟师与捆芯工，连同田间共一百二十三名员工，年产略超三百万支。它也为他人卷制，且非小客户：Crowned Heads 的 Juarez 在此制作，Ozgener Family Cigars——CAO 创始人之子的公司——于2022年在此制作了首批雪茄，随后在2022年11月把它们交给 Tabacalera La Alianza。

自有品牌来得晚。ACE Prime 于2018年1月诞生，第三位合伙人来自行外：Tiago Splitter，打过 NBA、后转任教练的巴西篮球运动员。首批系列于2019年7月面世——以家族之名的 Pichardo Reserva Familiar 与 Classico，以合伙人之名的 Luciano The Traveler 与 The Dreamer，以及运动员签名的 MXS。

2022年9月，ACE Prime 更名 Luciano Cigars，工厂本身也改称 Luciano Cigar Factory。门上金融家的名字取代了雪茄匠的名字。本词条两个都留着，因为这就是这段历史。

2025年4月，Luciano 与 Empresa Madeirense de Tabacos——拥有 Fábrica de Tabaco Estrela 的亚速尔公司，本图集载有其词条——共同创立 Constella Group，后者成为 Luciano 的母公司；Luciano Meirelles 任 Constella USA 总裁。埃斯特利的 Luciano Tabacos S.A. 也为 Peter James Cigars 与 Dalay Zigarren 卷制。'
 WHERE `name` = 'Luciano Cigars' AND SHA1(TRIM(`history`)) = '4f90738ce554277b4d33b3096d9343b6d56f40ea';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Luciano Cigars' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '4f90738ce554277b4d33b3096d9343b6d56f40ea';
-- brands|Malekö|history|zh — 日期格式中文数字混用
UPDATE `brands` SET `history_zh` = 'Malekö 是一个哥斯达黎加品牌，据 Casagranda 称，其名称是向马莱库（Maleku）人致敬，马莱库人是哥斯达黎加热带森林中的原住民群体。其首条产品线 Malekö Classic 曾在中东取得成功，尤其是在黎巴嫩；据 Casagranda 和 Smokersplanet.de 称，Custom Blend 于2015年接替它，采用泛红的茄衣、新的茄型和现代的造型。

该品牌的持有人是 Tabacos de Costa Rica S.A.，其地址在 Santiago de Puriscal：据 Trademarkia，美国商标注册簿在此记录了2020年3月25日的申请、2021年8月17日的注册，以及2016年7月27日申报的首次使用。Cigarworld.de 将同一家公司列为制造商，Casagranda 把 Malekö 归入其 Tabacos de Costa Rica 栏目，并称其为1997年在 Puriscal 山区设立的家族式工厂。Cigar Coop 于2019年称 Andrés León 为 Tabacos de Costa Rica 位于 Santiago de Puriscal 的工厂的所有者和经营者；Casdagli 写道，其与 Tabacos de Costa Rica SA（当时被称为 Vegas Santiago）的合作始于2012年。

2026年10月，Casagranda 介绍 Custom Blend 有三种茄型，以漆木盒包装；Cigarworld.de 将位于 Esslingen 的 Casagranda Cigars GmbH 列为进口商，并将其列入目录，以 Totalmente a mano 方式、用 longfiller 卷制：Emperador 自2025年8月11日起列于目录。Smokersplanet.de 于2025年8月26日发表了一篇专门介绍它的文章。'
 WHERE `name` = 'Malekö' AND SHA1(TRIM(`history`)) = 'f1400f2ea1a6e8d33f924a90bc5fb69998322ba1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Malekö' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'f1400f2ea1a6e8d33f924a90bc5fb69998322ba1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Mara' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '56cf966fe06231939633f5a6b73a3adbc3e82f53';
-- brands|Marca Fina|history|zh — chocolat误作可可
UPDATE `brands` SET `history_zh` = '据Cigarworld.de与StarkeZigarren.de介绍，Marca Fina是FTAC（Federación de Tabaqueros America Central）旗下的雪茄品牌，该联合会集合了中美洲的小烟农，让他们自行将部分收成加工成雪茄并销售；厂方未透露创始人或创立年份。每条产品线都是puro：茄衣、茄套与茄芯均产自同一国家，经至少两年的发酵。巴拿马系列是其起初的产品线；此后又陆续加入了多米尼加共和国、洪都拉斯、尼加拉瓜、厄瓜多尔与巴西的产品线。截至2026年9月，据StarkeZigarren.de介绍，雪茄在尼加拉瓜卷制；厂方并未说明其工厂所在。在德国，该品牌长期由汉堡的Darier & Cleef代理进口，自2024年Intertabac展会后改由Kopp Tobacco接手。据Cigarworld.de介绍，一款以巴拿马烟叶机制而成的Marca Fina Zigarillo，自2009年9月15日起开始销售。

各产品线以所用烟叶区分：巴拿马为maduro茄衣，风味适中，带草本与辛香；洪都拉斯风味适中，更为浓烈并带泥土气息；多米尼加共和国风味偏柔和，带果香；巴西为maduro茄衣，带巧克力与皮革香气；尼加拉瓜与厄瓜多尔两条产品线为全手工制作（TAF），厂方未公布其茄衣。截至2026年9月，以上产品均在Cigarworld.de与Noblego有售。'
 WHERE `name` = 'Marca Fina' AND SHA1(TRIM(`history`)) = '0a4b651c395ebee973c7abd88e788decb6d65565';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Marca Fina' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '0a4b651c395ebee973c7abd88e788decb6d65565';
-- brands|Mata Hari|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = '据该品牌介绍，Monsoon Cigar Company诞生于Sonny Suciawan与Sebastian在德国勃兰登堡一处农场的相遇；公司于2024年推出首个品牌Mata Hari，起初在德国上市。这个名字取自1917年因间谍罪被处决的荷兰舞者；Suciawan说，他希望让印尼雪茄在国际市场——包括德国与美国市场——上更为人知。

Monsoon没有自己的工厂，也不透露是哪家工厂在为其卷制雪茄。其配方在爪哇东部的任抹，由PT Besuki Raya Cigar调制完成——El Gaucho正是产自该厂，该厂自2020年起隶属于Mangli Djaya Raya集团——Suciawan说，他曾在那里主持品鉴与选叶工作。目录中共有三款规格：Courtisane，据品牌介绍完全采用印尼烟草；Java Exotica，采用多米尼加与巴西烟叶，茄衣为爪哇烟叶，首次采摘可追溯至2020年；以及Limited Edition 2024，采用巴西、多米尼加与印尼烟叶，茄衣为墨西哥圣安德烈斯烟叶。

该品牌于2024年6月在柏林首次亮相，随后于2024年11月走进雅加达与万隆；2025年2月，Suciawan在一次访谈中仍谈及此事。截至2026年9月，Cigarworld.de的目录中仍保留这三款规格。'
 WHERE `name` = 'Mata Hari' AND SHA1(TRIM(`history`)) = '26ab6465912172034ad8d5c7fce1ffda92b7f1fe';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Mata Hari' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '26ab6465912172034ad8d5c7fce1ffda92b7f1fe';
-- brands|Matacan|history|zh — 品牌名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Matacan 是圣安德烈斯山谷自己抽的雪茄。它完全由墨西哥烟叶制成——茄芯、茄套与茄衣——是严格意义上的纯产雪茄，以捆而非以盒出售，价格则让它置身于大品牌的竞争之外。

它出自与 Te Amo **同一座**工厂：Nueva Matacapan Tabacos，属于 Turrent 家族——四代以来主导墨西哥烟草的那个家族。墨西哥页因此有四条记录与这同一个家族相关：Te Amo、Santa Clara 1830、Casa Turrent 与 Matacan。这不是图册的缺陷，而是一个由一个家族掌握风土的国家的现实。

它的产品以编号而非名字标示，这已足以说明它的用意：这不是一个声望品牌，而是一组尺寸，你按手头有多少时间来挑一个数字。包装极简，往往没有烟标。

味道却很有教益：圣安德烈斯茄衣，不带通常伴随它的尼加拉瓜或多米尼加烟叶——也就是墨西哥风土的单独呈现，直率而略带粗粝。要弄清墨西哥究竟为这片大陆的配方贡献了什么，这是再直接不过的样本。'
 WHERE `name` = 'Matacan' AND SHA1(TRIM(`history`)) = '4fade9be3fe99980e47995d7afbe678e5f432dc3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Matacan' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '4fade9be3fe99980e47995d7afbe678e5f432dc3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'May''s Cigars' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'e663ea10c8b7ce0b1584d5762199505641b8b1fe';
-- brands|Maya Selva Cigars|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Maya Selva 在洪都拉斯长大，母亲是法国人，父亲是洪都拉斯人。她十六岁赴法求学，成为工程师，并在美国取得硕士学位。

1993 年，她结识了种植者兼制造商 Nestor Plasencia，向他说出自己的构想：把一支优质的洪都拉斯雪茄带到法国市场。他成了她的导师。1995 年她创办自己的品牌，并推出 Flor de Selva，先在法国上市，而后走向世界。

她创办了自己的公司，而在这个行业里，由女性创办的品牌屈指可数。'
 WHERE `name` = 'Maya Selva Cigars' AND SHA1(TRIM(`history`)) = '2e7dc979840de4fc18b42e99e1ad7d1498da1f6b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Maya Selva Cigars' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '2e7dc979840de4fc18b42e99e1ad7d1498da1f6b';
-- brands|Meerapfel|history|zh — 人名拉丁；穿着误译
UPDATE `brands` SET `history_zh` = '喀麦隆茄衣是业内极受追捧的烟叶之一，而喀麦隆在雪茄世界中也仅以它存在：一种原料，卖给那些在别处卷制的企业。Meerapfel 并非例外。

Meerapfel 家族正处在这段历史的中心。作为自1876年起的烟草商人、德裔出身，他们的声誉建立在喀麦隆烟叶的挑选与贸易之上，直至成为这一领域的标杆之名。2003年去世的 Richard Meerapfel，被认为在无人再要这种烟叶的年代把它从消失中挽救了回来。

当这个家族推出自己的雪茄时，凭借的是极为坚实的理由——没有人比他们更懂这种茄衣——但雪茄是在多米尼加共和国卷制的。因此，喀麦隆在此提供的是配方中格外显眼的那片叶子，仅此而已。

这家企业因而被列入喀麦隆茄衣雪茄之列，与 CAO Cameroon 等并列。喀麦隆没有优质雪茄的生产，而图册不能为它凭空造出一个。'
 WHERE `name` = 'Meerapfel' AND SHA1(TRIM(`history`)) = '34c160fd3609233ec06f3f759734e97fa9888291';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Meerapfel' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '34c160fd3609233ec06f3f759734e97fa9888291';
-- brands|Menendez Amerino|history|zh — 人名拉丁；排名措辞
UPDATE `brands` SET `history_zh` = '这是一家生于流亡与合伙的公司。Menéndez 家族在古巴做过 Montecristo 与 H. Upmann；1960 年之后四散。其中一人早已向巴伊亚 Recôncavo 的一位烟农 Mário Amerino da Silva Portugal 收购烟叶。七十年代末，两人合力办起一座工厂。

工厂在巴伊亚的 São Gonçalo dos Campos——而不在种植它所用 mata fina 的 Cruz das Almas。这个区分很重要：种植之地不等于制造之地。

那里的一切都靠手工。公司把自己的工序描述为全然手作：每一片叶子都由女工挑选、处理、手卷。

从这间作坊出来的有 1980 年创制的 Alonso Menendez、1982 年推出的 Dona Flor（本图集另有其条目），以及 2018 年问世的 Alonso Del Patron。这与多米尼加共和国的 Tabacalera Palma 和 Aging Room 是同一种分工：工厂与它的品牌都收录于此，因为二者并非一回事。

一个创立年份，两个说法：本图集和公司写1977年，2017年一篇报道写1978年；词条两者都写。2012年的经济媒体量出了下滑：1990年代末每天一万五千支，2012年一千五百支，另有每月四十万支小雪茄；从前四百名员工，三年前一百五十人，当时七十人，九成以上是女性——仍是全国规模居首的工厂。2026年，副总裁 José Henrique Barreto 任职于 Apcab，即推动雷孔卡沃雪茄原产地命名的协会。'
 WHERE `name` = 'Menendez Amerino' AND SHA1(TRIM(`history`)) = '6f824f644902005914638bd5ab8151c401114b56';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Menendez Amerino' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '6f824f644902005914638bd5ab8151c401114b56';
-- brands|Miami Cigar & Co.|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Miami Cigar & Co. 是一家从未拥有工厂的经销商，本图集按其以创始人 Nestor Miranda 命名的系列的卷制地归类：埃斯特利，My Father 厂。数量无法裁定：公司在2026年10月介绍的四个品牌中，Nestor Miranda 与 Don Lino（Africa 系列，由 A.J. Fernandez 制作）在尼加拉瓜卷制，Tatiana 与 Outcast 在多米尼加共和国卷制——Tatiana 是 Cigar Coop 在2023年7月描述为公司基础品牌的那一个，在 La Aurora 卷制，Cigar Coop 在2024年5月就 Delights 如此说，Neptune Cigar 则就其余各款如此说；Outcast 未点名工厂——而且没有任何一页给出按工厂划分的产量。其余的故事发生在洪都拉斯与多米尼加共和国之间，必须讲出来，因为它解释了原因。

Nestor Miranda 是古巴人。他在烈酒业待了二十五年——Southern Wine & Spirits 十五年，Seagram 十年——1989年公司初创时由妻子 Mariana 主持，他仍在卖酒。头一年：分销四万支，在 U.S. Tobacco 的洪都拉斯工厂制作八万支——正是制作 Don Tomás 的那家厂，本图集载有其词条。品牌叫 Don Lino，取自厂里一个人的名字。在美国热潮推动下，它从1994年的一百五十万支增至1996年的一千两百万支。

随后 UST 于1996年11月停止供货。Don Lino 从市场消失两年。是 La Aurora 的 Guillermo León 救了它：1999年初在他多米尼加的工厂恢复生产。Miami Cigar 自1980年代末起就在美国分销 La Aurora——这层关系来自一位卷烟师——直到2023年3月：2022年11月，La Aurora 宣布将于2023年4月1日起，通过子公司 La Aurora USA 自行接管其在美国的分销；Miami Cigar 现已不再是其分销商。Miranda 1995年离开烈酒业，专做此事。

以创始人命名的 Nestor Miranda Collection 则在别处制作：埃斯特利 García 家族的 My Father 厂。2014年的二十五周年纪念款同时出自两厂，La Aurora 与 My Father。公司曾表示，每年为一系列制造商分销两千万余支雪茄，本图集按其本来面目收录：一家迈阿密公司，失去工厂后靠找到另外两家而存活——并且两家都点名。'
 WHERE `name` = 'Miami Cigar & Co.' AND SHA1(TRIM(`history`)) = '3a9c56a2e4eee569f41c7f1e92fcde98420828b3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Miami Cigar & Co.' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '3a9c56a2e4eee569f41c7f1e92fcde98420828b3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Micallef' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '71b0838283eb318dd2d3e5602a355de56a3dc354';
-- brands|Monte Pascoal|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Monte Pascoal 是 Tabacos Mata Fina 的品牌，那是 Lorenzo Orsi 2007年在雷孔卡沃腹地克鲁斯-达斯阿尔马斯创办的工厂，想法是做一支不像任何别处、因为只来自此地的巴西高档雪茄：百分之百本国烟叶，Mata Fina 出香气，Mata Norte 出劲道，每种规格有自己的两者配比。名字取自 Cabral 1500年望见的那座山，盒子讲述巴西的发现；雪茄媒体说，印刷品在荷兰印制。

全部手工卷制，整叶；每支雪茄要经过抽吸、做工和茄衣色泽的检查，然后至少等三个月才出售。六种规格，二十五支和十支装。

Lorenzo Orsi 任 Apcab（巴西手工雪茄生产者协会）主席，该协会2026年7月正向 INPI 提交 Mata Fina 烟草与雷孔卡沃手工雪茄的原产地命名——项目称，四家制造商占全国手工雪茄市场约85%。'
 WHERE `name` = 'Monte Pascoal' AND SHA1(TRIM(`history`)) = '837eb0170353a2f11534746d023e841653d6b3b8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Monte Pascoal' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '837eb0170353a2f11534746d023e841653d6b3b8';
-- brands|Montealto|history|zh — 措辞调整
UPDATE `brands` SET `history_zh` = 'Montealto 是加那利群岛现存仍在运转的雪茄厂中历史居首的那一家的高端品牌。Ernesto González Pérez 把它设在布雷尼亚阿尔塔市镇的拉斯武埃尔塔斯。加那利报刊将创立之年定为 1917 年，公司自称 1918 年；这一出入尚无定论。在岛上，人们只叫它「la Fábrica」（那座工厂）。

González 平日卷制雪茄，周六周日便把成捆的雪茄绑在自行车后架上，沿岛贩售。到 1950 年代，这间作坊已有六十名员工。

如今约有十人。Fabrizio Gentile 与 Miguel Ángel Pérez González 在此手工与机械并用，每日卷制约三百支，品牌包括 Montealto、De Lucía、Premium、Casa Vieja、Rica Hoja 与 Primorosa。公司自种五千株烟草，其余以古巴、多米尼加共和国与尼加拉瓜的烟叶补足。

须留意名称的近似，它连企业名录都会误导：Compañía Insular de Tabaco de La Palma 并非 Benjamín Menéndez 于 1961 年在大加那利岛拉斯帕尔马斯开设、用以生产 Montecruz 的 Compañía Insular Tabacalera。两家公司，两座岛，相隔四十年。'
 WHERE `name` = 'Montealto' AND SHA1(TRIM(`history`)) = '243bcb8829c939bc5ba7596c3ae60038b3aaed58';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Montealto' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '243bcb8829c939bc5ba7596c3ae60038b3aaed58';
-- brands|Montecristo Dominicain|history|zh — 品牌名改拉丁字母
UPDATE `brands` SET `history_zh` = '世上有两个 Montecristo，而许多烟客并不知道。这个1935年诞生于哈瓦那的品牌在1960年被国有化；其所有者离开该岛，在古巴之外重启了这个名字。此后，古巴的 Montecristo 与非古巴的 Montecristo 并存，在不同市场销售——前者行销除美国以外的各地，后者行销美国。同样的名字，几乎相同的烟标，两支毫无关系的雪茄。

非古巴版的 Montecristo 在拉罗马纳卷制，那是拉罗马纳的雪茄工厂，业内规模居前的几家之一。规模改变了一切：精品厂一年产几十万支，而这座工厂以千万计，其制作的稳定性本身就是一项技术成就。

其风格遵循多米尼加传统——轻至中度、奶润、浅色茄衣——而古巴那一支更浓、更带土味。这不是失败的仿制：这是同一个名字的另一种读法，为另一种味蕾而作。'
 WHERE `name` = 'Montecristo Dominicain' AND SHA1(TRIM(`history`)) = 'a5be5a702a89e029c75faceab310b2f8042cfee4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Montecristo Dominicain' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'a5be5a702a89e029c75faceab310b2f8042cfee4';
-- brands|Montecruz|history|zh — 品牌人名拉丁；havane误译
UPDATE `brands` SET `history_zh` = 'Montecruz 是一个失去一切之后重新开始的人的雪茄。1960年9月，古巴的国有化夺走了 Menéndez 家族的 Montecristo——正是他们把这个品牌推上顶峰。这个家族一无所有地离开了那座岛。

他们选择了加那利群岛——而这个选择并非地理上的偶然。这片群岛正是种植古巴烟草的许多农人的故土：Vuelta Abajo 地区是由加那利人开垦的，而古巴的烟草家族在此保有联系长达两个世纪。回到加那利，就是回家。

Benjamín Menéndez 于1961年在拉斯帕尔马斯创办了 Compañía Insular Tabacalera，并推出 Montecruz——这个名字与他刚失去的那个如此接近，用意毫无疑问。这支雪茄裹着深色而带颗粒感的喀麦隆茄衣；事实证明它是哈瓦那雪茄令人信服的替代品，并助其扎根于美国人的口味之中。

Montecruz 的黄金岁月是1960与1970年代的美国市场。生产终于迁往多米尼加共和国——正如几乎所有诞生于加那利的东西一样。'
 WHERE `name` = 'Montecruz' AND SHA1(TRIM(`history`)) = 'd5e13e299385b68c7fbe053e2924c6ef02817d0b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Montecruz' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'd5e13e299385b68c7fbe053e2924c6ef02817d0b';
-- brands|MOSI|history|zh — 人名公司拉丁；长填充误
UPDATE `brands` SET `history_zh` = 'MOSI——Moderno Opificio del Sigaro Italiano——是在威尼托打破意大利雪茄托斯卡纳专卖的公司。Cesare Pietrella 2013年创立；特雷维索省奥尔萨戈的工厂在手续办妥后于2014年2月3日投产——因为在意大利，烟草是国家事务，在 Toscano 之外做雪茄并非理所当然。其品牌 Ambasciator Italico 用意大利和美国肯塔基烟叶制成。

本图集不收录这家公司的主要产品：意大利传统的机制雪茄。它收录的是手工卷制的 Ambasciator Italico Storico，用威尼托和托斯卡纳的意大利肯塔基长茄芯，烟叶手工去梗——正是这条线、也只有这条线，才值得词条，如同手工卷制的部分成就了 Villiger 或 Pogar 的词条。

2021年11月，Scandinavian Tobacco Group 取得 MOSI 的多数股权：这个在本图集中已拥有 General Cigar、Bolívar Honduras、Balmoral 和 Agio 的丹麦集团，把专卖之外的意大利雪茄收入囊中。词条说出这一点，因为它如今与欧洲一半的机制雪茄同属一个母公司。'
 WHERE `name` = 'MOSI' AND SHA1(TRIM(`history`)) = '1e7e5731240b58985d8ebd6b36f992af5674061a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'MOSI' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '1e7e5731240b58985d8ebd6b36f992af5674061a';
-- brands|Mosi Oa Tunya|history|zh — 人名拉丁；多米尼加共和国
UPDATE `brands` SET `history_zh` = 'Mosi Oa Tunya——维多利亚瀑布的洛齐语名字，"轰鸣的烟雾"——是津巴布韦首家手工雪茄厂，公司和该国媒体都这么说。它源于一场横跨两大洲的对话：不抽烟的 Shepherd Mafundikwa 在一家美国航空公司工作了十五年，注意到美国开了多少雪茄吧，而那个国家一支都不卷，他自己的国家却种了一个世纪的烟草。他回国，2019年与 Loy Veal 创立公司，去古巴和多米尼加共和国参观工厂，并带回一位多米尼加师傅 Elias López。

工厂位于哈拉雷工业区格拉尼特赛德。2020年7月已有七名女性学会卷制，2022年为十名；公司把它办成一个女性就业项目，其中一位对媒体说她之前没有工作。烟叶是晾制白肋烟——这个以卷烟弗吉尼亚烟为主的国家里那一小部分深色烟——茄衣靠进口，因为本地烟叶易碎：95%本地，5%外来，并宣称目标是全部本地。起初每天两百支，五种规格，按系列使用 Habano、Sumatra 或 Connecticut 茄衣。

各报日期不一——一家说2020年3月启动，另一家说5月，7月宣布投产；词条三者都写。2022年公司称出口巴西、罗马尼亚、南非、美国、安哥拉、刚果和迪拜。'
 WHERE `name` = 'Mosi Oa Tunya' AND SHA1(TRIM(`history`)) = '0df041d09e027dc6a3f8f5644dd800900b050913';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Mosi Oa Tunya' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '0df041d09e027dc6a3f8f5644dd800900b050913';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Mustique' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '4901b2a86728f2c265580adc3ede1fc107311eca';
-- brands|NACSA|history|zh — 人名拉丁；réassembler误译
UPDATE `brands` SET `history_zh` = 'NACSA 先是一家工厂，然后才是品牌，本图集也如此书写。它1995年在埃斯特利以 Nicaragua American Tobacco S.A.——NATSA——之名诞生，由 Juan Francisco Bermejo 与包括 JR Cigar 老板 Lew Rothman 在内的合伙人创立：多年来它只为这家零售商卷制廉价雪茄，Quorum 在其中，直到 J.C. Newman 2011年开设 PENSA 并把该线收回。本图集在 J.C. Newman 词条讲了 PENSA。

转折出现在2015年前后：同一条街往下的一座新楼，以及做优质雪茄的决定。工厂聘请 Raúl Disla 负责生产，并吸引了客户——本图集载有词条的 Asylum、Steve Saka 的 Mi Querida，再是2019年的 Patina。它部分属于 Oliva Tobacco Company，坦帕的烟叶经纪商，由 Angel Oliva Sr. 创办于1930年代，在邻近的 Finca Guadalupe 种植——与 Oliva Cigars 毫无关系，这种混淆常见到媒体每次都要指出。

2016年1月，从业四十四年、曾任 Altadis USA 烟草副总裁的 Larry Palombo 前来重新整合工厂压在抽屉里的注册品牌——Red Dot、Villar y Villar、La Rosa Especial、Aristoff——用 Oliva 的烟叶推向市场。正是为了这些品牌，NACSA 在此有自己的词条，而不只是出现在别家的词条里。'
 WHERE `name` = 'NACSA' AND SHA1(TRIM(`history`)) = '961dad913e81f517052fe284217207ca50b6abc3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'NACSA' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '961dad913e81f517052fe284217207ca50b6abc3';
-- brands|Nat Sherman|history|zh — 人名品牌拉丁字母
UPDATE `brands` SET `history_zh` = 'Nat Sherman 先是一个地址，然后才是一个品牌。1930年，Nathan Sherman 在纽约开了一家烟草店；他的后继者把这家企业安置在第五大道一栋带品吸沙龙的三层建筑里，数十年间，那里成了曼哈顿雪茄烟客的聚集地。

雪茄本身则从未在纽约卷制：这家企业以自己的名义、按自己的规格，在多米尼加共和国与尼加拉瓜调配产品线。这是「零售商变成品牌」的典型模式，并造就了美国市场上一些极为考究的系列——Timeless、Metropolitan、Sterling。

第五大道的店铺于2020年关闭，品牌随后被持有它的集团终止。团队的一部分人以另一个名字重启了那些配方，这种事很少发生：通常，一个被放弃的品牌会连同它的配方一起消失。

本图集保留它，是因为它所代表的东西——一家美国企业，其所在之地与其产品同等重要，而这个行业里几乎一切都发生在别处。'
 WHERE `name` = 'Nat Sherman' AND SHA1(TRIM(`history`)) = '61476950ad1cb60274c3c3af516b98a9e5c7cdb6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Nat Sherman' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '61476950ad1cb60274c3c3af516b98a9e5c7cdb6';
-- brands|Nicoya|history|zh — 庄误译为公司
UPDATE `brands` SET `history_zh` = 'Nicoya 是一个澳大利亚品牌，却不含一克澳大利亚烟叶——而且也不可能含有。澳大利亚的商业烟草种植已于 2006 年 10 月终止，终点是维多利亚州东北部的默特尔福德，全国九成五的收成曾出自那里。此后在澳大利亚种植烟草即属违法，也不再有任何持牌种植者。

澳大利亚人 Gerard Hayes 于 2016 年推出这个品牌，并自行出资。他前往埃斯特利，带回了一位制造商：A.J. Fernández——本图集已有其条目。他所选的名字道出了这份亏欠：「nicoya」指的是尼加拉瓜人，品牌正是献给他们的。同年，它在美国 IPCPR 展会上亮相。

这正是本条目归入尼加拉瓜而非澳大利亚的原因。本图集按雪茄的制作地为品牌归类，而非按销售者的国籍：Casdagli 是在哥斯达黎加卷制的英国公司，Diamond Crown 是在多米尼加共和国卷制的美国品牌。澳大利亚在本图集中仍是它本来的身份——一个有地址的国家。那里有人吸，却无人种。

两种配方，一种尺寸：罗布图，五英寸乘五十二环径。澳大利亚的售价值得一提，因为它与雪茄本身无关：单支约五十澳元，二十支一盒约一千澳元。说话的是消费税，不是工厂。'
 WHERE `name` = 'Nicoya' AND SHA1(TRIM(`history`)) = '8bf1a13c7812bae3a4fe028fc6ca9b4849ace991';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Nicoya' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '8bf1a13c7812bae3a4fe028fc6ca9b4849ace991';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Nomad' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '04b02f074f02382c9c8f5f9842991f2c1d180e68';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Nordlicht' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'bb8d7fe4d6425b942591fcbbeca192aa4e5c628e';
-- brands|Notorious|history|zh — 人名拉丁字母
UPDATE `brands` SET `history_zh` = '据Cigar Dojo报道，Notorious于2025年3月由爱尔兰综合格斗选手Conor McGregor推出。该品牌在多米尼加共和国圣地亚哥省坦博里尔的MJ Frias Cigars手工卷制——据零售商Corona Cigar介绍，这家工厂由Miguel Frias于1991年在圣地亚哥开设，2002年迁至坦博里尔，手工卷制价格亲民的雪茄。

起初的配方混合了尼加拉瓜、多米尼加共和国和墨西哥的烟叶，规格有Toro、Double Robusto和Corona Gorda；多家经销商称其茄衣为陈化约四年的厄瓜多尔Habano 2000 Rosado Oscura茄衣。该品牌称在一年多一点的时间里已进入二十多个国家。2026年4月，在新奥尔良举行的PCA展会上，该品牌推出两款新配方，据halfwheel报道现已发货：Crème de la Crème更为温和，采用浅色厄瓜多尔茄衣、巴西阿拉皮拉卡茄套，茄芯来自尼加拉瓜、多米尼加共和国和哥伦比亚；Unapologetic则更为浓郁，采用美国康涅狄格宽叶茄衣、厄瓜多尔苏门答腊茄套，茄芯来自尼加拉瓜、美国和多米尼加共和国，共有四种规格——Corona Larga、Toro、Sublime和Sixty。'
 WHERE `name` = 'Notorious' AND SHA1(TRIM(`history`)) = 'c45225b11bb7de556c5bb63dc49666882f5ca552';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Notorious' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'c45225b11bb7de556c5bb63dc49666882f5ca552';
-- brands|Oettinger Davidoff|history|zh — 人名品牌拉丁字母
UPDATE `brands` SET `history_zh` = '1875年5月，Max Oettinger 在巴塞尔铁匠巷 9 号开设雪茄店，售卖进口雪茄、散装烟草、烟斗与吸烟用品。

在日内瓦，Davidoff 一家于 1911年从基辅来到此地，Henri Davidoff 在那里开设了自己的首家烟草店。由 Zino Davidoff 在古巴创制的首批白色烟标雪茄于 1968年问世；1970年，Oettinger 集团接手了 Zino Davidoff 在日内瓦的店铺，自 1961年起执掌该集团的 Ernst Schneider 着手把它打造成一个国际品牌。

收购随后而来：2008年10月1日收购 Camacho（洪都拉斯的 Danlí 与迈阿密），为集团带来第二个原产地洪都拉斯；2009年收购 Cusano，为其在美国打开新的分销渠道。自 1991年起，所有 Davidoff 均在多米尼加共和国的 Villa González（Santiago）手工卷制，该公司也在那里生产 AVO、The Griffin''s、Cusano、Private Stock 和 Zino Platinum；Zino 于 1978年推出，当时在洪都拉斯卷制，2021年以尼加拉瓜风格重新推出。该集团仍为家族所有；全球员工逾 4 000 人（2025年6月11日的新闻稿），由 2017年起任首席执行官的 Beat Hauenstein 领导，并于 2025年5月庆祝了 150 周年。其总部 Maison Davidoff 位于巴塞尔的 Nauenstrasse 73。'
 WHERE `name` = 'Oettinger Davidoff' AND SHA1(TRIM(`history`)) = '6c4e1337b85867a832ff990e5d4a9490f33c1c05';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oettinger Davidoff' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '6c4e1337b85867a832ff990e5d4a9490f33c1c05';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ohana' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'c4e1ca2ca5c4081816f117fcb8514c6d84a35215';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oliva Connecticut Reserve' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '09f868f1369ada42a29df1dbca8c0b22ea03b452';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oliva Serie G' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '25622bde17b50bbbeefa9db9b4fd6465fde1ee62';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Omar Rodriguez' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'd559d976ff4f1ef94da62656995c48539e15dacb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Onyx' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'bb66385a2f513ecb363ec53a92b6f82ea18817d6';
-- brands|Ortega Cigars|history|zh — 人名拉丁字母
UPDATE `brands` SET `history_zh` = 'Eddie Ortega 是 EO Brands 的一半——E 是 Espinosa，O 是 Ortega——这家公司2000年代在 Don Pepín García 处推出了 601 和 Cubao。两位合伙人2012年2月分手：Erik Espinosa 留下 601、Murcielago 和 Mi Barrio，本图集在他的词条讲了这些；Ortega 留下 Cubao、REO 和 Vibe，创立 Ortega Premium Cigars。他的首条线 Serie D 同年出自 García 家的 My Father 工厂，本图集载有其词条；2013年推出 Wild Bunch，一年十二支，每月一个人物。

2016年，Ortega 曾短暂效力的经销商 Quality Importers 接手分销，之后的各线出自埃斯特利 Carlos Sánchez 的 TACASA 工厂，该厂也生产他们的 Cult 品牌。Cubao 就在那里回归，配方与原版相同——厄瓜多尔苏门答腊茄衣、埃斯特利与哈拉帕茄芯——同时还有 Jalapa 和 M3。

此后，行业媒体沉默了。本图集能说的2021年至今的情况，只装在零售商目录和一位爱好者的博客里：雪茄在卖，工厂有名字，公司不再引人谈论。这个词条为 EO Brands 的故事而存在，因为没有别的词条从 Ortega 这一边讲它，词条也说明自己所知到哪里为止。'
 WHERE `name` = 'Ortega Cigars' AND SHA1(TRIM(`history`)) = '9d81f5e9609faf1ef88f6a7135e10b80f42abcf4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ortega Cigars' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '9d81f5e9609faf1ef88f6a7135e10b80f42abcf4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oscar Valladares' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '323c2f5185aa9a3040bf0427e62df799d0481172';
-- brands|Padilla|history|zh — 左翼知识分子遗漏
UPDATE `brands` SET `history_zh` = 'Padilla 是献给一位诗人的致敬。Ernesto Padilla 于 2003 年底在迈阿密创立这个品牌，献给他的父亲 Heberto Padilla——1971 年他的被捕与被迫检讨，以「帕迪利亚事件」之名载入古巴历史，也标志着一部分左翼知识分子与该政权的决裂。

家族来自比那尔德里奥，在那里拥有土地并种植烟草。因此标环上的名字并非商业选择：那是父亲的名字，而烟草是另一份遗产。

这正是本条目归入美国而非尼加拉瓜的原因。这家的代表作 Padilla Miami 在小哈瓦那的 El Titan de Bronze 卷制——本图集已收录的那家第八街作坊，只有为数不多的古巴卷烟师在此工作。烟叶则是尼加拉瓜的，由 Aganorsa 种植：本图集按雪茄的**制作地**归类，而非按烟叶的产地。

生产是分散的。其他系列来自洪都拉斯的 Fábrica de Tabacos Raíces Cubanas，Padilla Habano 则出自尼加拉瓜的 Tabacalera A.J. Fernández。本条目属美国，是就其重心而言，而非就其全部作坊而言——这一点它明说。'
 WHERE `name` = 'Padilla' AND SHA1(TRIM(`history`)) = 'c210335e9b40c11850638e91df6beac98d35937e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Padilla' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'c210335e9b40c11850638e91df6beac98d35937e';
-- brands|Patina Cigars|history|zh — 人名拉丁字母
UPDATE `brands` SET `history_zh` = 'Patina——铜器和久经把玩之物所生的包浆——是2015年由 Mo Maali 在芝加哥创立的公司，本图集把它归入卷制之地尼加拉瓜。它从 Mombacho 起步，即本图集讲过其关闭的格拉纳达工厂：起初的配方2017年出自火山脚下那座殖民时期宅邸。2019年 Maali 与之分道扬镳，把生产转到埃斯特利的 NACSA——该厂有自己的词条——与 Mombacho 公司自身几年后走向关闭的路正好相反。

此后目录在埃斯特利书写：常规线 Oro de Nicaragua、一款 Anniversary，以及2025年的两款——Verdigris，铜绿之名，与 Tyler Jeffery 的 Viso Horny 合作，三千支供十家店；Red Pill，10月28日发货。一家以颜色和材质命名小批量产品的公司，正是美国精品雪茄圈的作派。

词条得以存在，是因为每一步的工厂都被点名——这是规则——也因为行业媒体一直追踪这家公司到今年。'
 WHERE `name` = 'Patina Cigars' AND SHA1(TRIM(`history`)) = 'bfa8f56d086fd0d184a9d005a43b4bb64040c20c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Patina Cigars' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'bfa8f56d086fd0d184a9d005a43b4bb64040c20c';
-- brands|Patoro|history|zh — 人名拉丁字母
UPDATE `brands` SET `history_zh` = 'Patoro 是一家在多米尼加共和国委托卷制的瑞士公司，本条目按卷制地归类——正如 Villiger 及其他瑞士公司的词条。Patrick J. Martin 创立了它，自2001年起在欧洲销售；他为土地选择了多米尼加共和国，为作坊选择了圣地亚哥 Augusto Reyes 的工厂 De Los Reyes——本图集载有该厂词条。

目录逐线增长：2001年 Gran Añejo Reserva，2003年 Platino，随后 Vintage、VA、Brasil 与 Serie P。道出行业门道的细节是：在美国销售的 Serie P 与欧洲的不是同一款——美国版为巴西茄衣与茄套配多米尼加填充，旧大陆则是另一种配方。同一烟标，两支雪茄，公司也这么说。

在美国，负责分销 Serie P 美国版的是 C.L.E.——Christian Eiroa 的公司，又是他。Eiroa 之名由此出现在本图集第七个并非他自己的词条上。'
 WHERE `name` = 'Patoro' AND SHA1(TRIM(`history`)) = '2169c3738c570c5fa9cd97d4f8ed4582220d95f9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Patoro' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '2169c3738c570c5fa9cd97d4f8ed4582220d95f9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Paul Garmirian' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '0d930307235295580f82043aca64d8ac04435813';
-- brands|Paul Stulac Cigars|history|zh — 人名拉丁字母
UPDATE `brands` SET `history_zh` = 'Paul Stulac 是一家加拿大公司，本图集把它归入尼加拉瓜，因为它的雪茄在埃斯特利的 Las Villas Cigars 卷制，由其调配大师 Guillermo Peña 主持——本图集在此点名而尚未描述的一家工厂。经销它的零售商说品牌2011年在 IPCPR 展会推出；公司自己的网站不注明任何日期，本图集只好采用零售商的年份，并如实说明。

风格远远就能认出：黑色茄标，名字来自摇滚与黑夜——Black Phantom、Red Screaming Sun、Miami Style——雪茄偏浓烈。与其说是风土，不如说是一种美学，这不是指责：北美精品雪茄圈有一半如此。

词条止于它能点名的东西：工厂、调配师、入市年份。其余——烟叶、产量——未曾公布。'
 WHERE `name` = 'Paul Stulac Cigars' AND SHA1(TRIM(`history`)) = '762523110546366abc0fe09d4d3036cf9be3d4c6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Paul Stulac Cigars' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '762523110546366abc0fe09d4d3036cf9be3d4c6';
-- brands|PDR Cigars|history|zh — 人名拉丁字母
UPDATE `brands` SET `history_zh` = 'PDR 即 Pinar del Río——古巴烟草大省之名，被坦博里尔一家多米尼加工厂取用。Abe Flores 1975年生于纽约皇后区，三岁起在多米尼加共和国长大，1990年代末从事信息技术，之后回到烟草业。品牌于2008年展会亮相：首日开了十二个客户，六个月后五十个。PDR 1878 于2009年跟进——数月售出十万支——2011年工厂迁入一座四万平方英尺的建筑，起初只用了四分之一。

到2015年已使用三万平方英尺，六十名卷烟师，年产四百五十万至五百万支。一半以自有品牌出品：PDR 1878、Small Batch Reserve、A. Flores 1975——创始人的出生年份——以及与名叫 Luis 的合伙人合作的 Flores y Rodríguez。

另一半为他人卷制，名单与本图集的三个词条交叉：La Palina 的 Black 与 Classic 系列；Gurkha 的 125th；Viaje 的 TNT 与 C4；以及 Kristoff。Hiram & Solomon 于2022年6月把全部生产迁到此处。能为 La Palina 与 Gurkha 代工的工厂不是街坊作坊——这正是它先于自己所制品牌进入本图集的原因。'
 WHERE `name` = 'PDR Cigars' AND SHA1(TRIM(`history`)) = '2fb04bda7ae5f99c0649188f6dc301c509c5c6cb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'PDR Cigars' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '2fb04bda7ae5f99c0649188f6dc301c509c5c6cb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Perdomo Legacy Connecticut' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'c21644d1dff2063edc8586a3541703264266cfcc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Perla de Calvano' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '48633535a42f93526a1589cf77f993e942ea41e1';
-- brands|Pogar|history|zh — 品牌名拉丁字母
UPDATE `brands` SET `history_zh` = 'Pogar 是俄罗斯西部布良斯克州的一座小城，它的烟草厂是该国老厂之一：1839年有企业在此开业，Pogar 烟草厂自1915年起以此名存在。当时烟草种在俄罗斯帝国境内。革命之后、战争之后，种植园消失，工厂靠廉价产品幸存；后来重返雪茄，烟叶购自古巴、多米尼加、巴西和尼加拉瓜，除种植外一切在厂内完成。

本图集不收录 Pogar 的走量产品——机制雪茄、加香雪茄、低价系列——只收录它的手工产品：由自家卷工卷制的雪茄，一家俄罗斯零售商称之为该国规模居首的手工卷制。词条把这一说法归于该零售商。品牌道出时代与地点：XO、Aroma Cubana，以及用1918年之前旧正字法书写的「陀思妥耶夫斯基」。

与 Siglo de Oro 一起，它是让俄罗斯以卷制之地进入本图集的第二家工厂。它没有英语媒体；它有一个世纪。'
 WHERE `name` = 'Pogar' AND SHA1(TRIM(`history`)) = 'fa6f37f458af1169627fa0ab6d721e1119be04d7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Pogar' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'fa6f37f458af1169627fa0ab6d721e1119be04d7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Por Larrañaga Dominicain' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'f20ad7035e80b730a8a216fb2e2ebaedb248b31a';
-- brands|Powstanie|history|zh — 人名拉丁字母
UPDATE `brands` SET `history_zh` = 'Powstanie——读作「波-沙-涅」，波兰语「起义」——是佛罗里达两位零售商兄弟的品牌：Mike 与 Greg Szczepankewicz，德尔托纳 Cigar Hustler 店的老板。它2015年的诞生方式媒体觉得值得一讲：兄弟俩各自与 Esteban Disla 和 Skip Martin 在埃斯特利的 Fábrica de Tabacos Nica Sueño——RoMa Craft 的工厂，本图集载有其词条——调配自己的配方，然后由店里的顾客盲品两款。Mike 的 Habano 五月推出，Greg 的 Maduro 八月推出；这是该厂同意向多家零售商出售的头一个非 RoMa Craft 品牌。

标志借用二战波兰抵抗运动的符号，名字道出家族的来源。此后目录围绕茄衣扩展：Habano、broadleaf Maduro、Connecticut、San Andrés——perfecto 和 corona gorda 尺寸，二十一支装，工厂偏爱的装法。

兄弟俩的公司 Pospiech 也成了分销商：正是它经销 Fable 与 Chogüí，本图集的两个词条。所以这是零售商的品牌——但有点名的工厂、常设的目录和十年的媒体记录，正是本图集在 Sindicato 与 Black Swan 之间划下的那条线。'
 WHERE `name` = 'Powstanie' AND SHA1(TRIM(`history`)) = 'bf66a73829f04332f98550ad3aab31de4db98ede';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Powstanie' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'bf66a73829f04332f98550ad3aab31de4db98ede';
-- brands|Principle Cigars|history|zh — 人名品牌拉丁字母
UPDATE `brands` SET `history_zh` = 'Principle 是一家收藏家的公司。长岛的 Darren Cioffi 多年经手古董雪茄盒标签与烟草石版画，建起一座可追溯至1870年代的雪茄库；他抽过陈年与禁运前的雪茄。他2013年创办的品牌——公司的座右铭标出了年份——生于这种癖好：雪茄作为完整的物件，盒、茄标、尺寸与烟叶一体。

他结识了 Davidoff 烟草大师之子 Hendrik Kelner Jr.，后者刚在圣地亚哥开了自己的作坊——Kelner Boutique Factory，本图集载有其词条。两人花一年半挑选陈年烟叶，一切都在那里由四位卷工卷制，速度慢的尺寸每天只出十支。2023年的十周年项目 Time To Burn 是例外：它出自 Casa Carrillo。

各系列是不同年代：Aviator，1940年代末的美国工业装饰艺术；Accomplice，1930年代的法国风格；Martinique，十八世纪殖民地风格。一家把茄标当版画来构思的公司——创始人在生产之前收藏的正是这些。'
 WHERE `name` = 'Principle Cigars' AND SHA1(TRIM(`history`)) = '35d47a997d60ee7b712a43307f496ca535384bd1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Principle Cigars' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '35d47a997d60ee7b712a43307f496ca535384bd1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Protocol' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'b2e78d6772665590f22a6446d650d455b058a054';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Psyko Seven' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '600d5e4fe4ec8e798868bbf52f479bc392ad9f1b';
-- brands|Punch Honduras|history|zh — 品牌名改拉丁字母
UPDATE `brands` SET `history_zh` = '洪都拉斯的国家页写着 Punch，链接却指向古巴的条目——那是一个1840年在哈瓦那为英国市场创立的品牌，盒盖上有它的 Mr. Punch 木偶。读者因而读到的，是一支他在洪都拉斯根本找不到的雪茄的历史。这篇文章纠正了这个误会。

洪都拉斯的 Punch 源于古巴的国有化：这个名字在岛外被重新启用，自1960年代起在洪都拉斯生产，并在整个禁运期间行销美国。它在那里建立了自己的客群，靠的是比哈瓦那更带土味、更浓郁的风格，以及在古巴雪茄日渐稀有之时仍保持可及的价格。

两个品牌，两个国家，一个继承自同一个十九世纪的共同名字——这是1960年在雪茄地理上留下的伤疤之一，而这部图册选择呈现它，而非将其抹平。'
 WHERE `name` = 'Punch Honduras' AND SHA1(TRIM(`history`)) = 'a26e2f4939ab578472246a963c22226245855861';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Punch Honduras' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'a26e2f4939ab578472246a963c22226245855861';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Puros Artesanos Julio' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'a9efe3697c40b5cf9083fcbb88c692e2caa6b827';
-- brands|Quesada|history|zh — 品牌名拉丁化；语句不通
UPDATE `brands` SET `history_zh` = 'Quesada 家族自十九世纪末就从事烟草，先在古巴，后于1970年代落户多米尼加共和国——那还在使该国成为优质雪茄头号产地的浪潮之前。这份先手很重要：当大厂到来时，Quesada 一家已经在那里，带着他们位于圣地亚哥的工厂。

这家企业长期在幕后工作，为别的品牌代工不亚于为自己生产，并保持着与行业商业喧嚣相反的低调。如今由下一代执掌，仍是少数依然独立且属于家族的多米尼加大厂之一。

其风格遵循经典的多米尼加气质：平衡、柔顺，一种不追求效果的优雅。其知名度居前的配方 Casa Magna 是个例外，它去追寻尼加拉瓜的力度——这是一种表态：这家公司能做的，不止于人们对它的期待。'
 WHERE `name` = 'Quesada' AND SHA1(TRIM(`history`)) = 'a0b4dc551cce30479ecf5b03dedb4fd6ba11c145';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Quesada' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'a0b4dc551cce30479ecf5b03dedb4fd6ba11c145';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Red Anchor' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '7dd14523754092bbae2629e9913ef58fefa57064';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Regius' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '57925d6f373c207989915e5940d0aa86e74085b6';
-- brands|Reinado|history|zh — 人名公司名拉丁化；禁用字
UPDATE `brands` SET `history_zh` = 'Reinado——统治——是 Antonio Lam 的公司，2009年创立，首条产品线在2010年 IPCPR 展会推出，由埃斯特利的 Agros Tabacos Industriales 卷制，本图集在此点名而未曾描述这家工厂。它有过自己的时刻——一款 Grand Empire Reserve、一批拥趸——然后退出了市场，行业媒体2018年12月为它写了一篇追忆文章。

2021年8月它回归，换了工厂：Aganorsa Leaf 的 TABSA，本图集载有其词条。回归的系列叫 Grand Apex，Lam 把它献给父亲——一位一无所有来到美国、后成为纽约 Chase Manhattan Bank 副总裁的古巴移民——标题所指的顶点。2022年又推出 6×60 和 C29。

然后媒体再次沉默，公司网站自2023年起未再更新。一家已经隐没过一次、不知是否再次隐没的公司：本图集带着这一保留写下它，因为工厂有名字，2021年的回归有记录——宁可日后更正，也不愿缄口不写。'
 WHERE `name` = 'Reinado' AND SHA1(TRIM(`history`)) = '40abeb06d2f6b5c2fa6ad4a72bbcc98a08062ecb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Reinado' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '40abeb06d2f6b5c2fa6ad4a72bbcc98a08062ecb';
-- brands|Reyes Family Cigars|history|zh — 人名公司名拉丁化
UPDATE `brands` SET `history_zh` = 'Rolando Reyes Sr. 在古巴有一家工厂，名叫 Cuba Aliados，后被没收。他离开了，在1970年代重新开始——先在新泽西，后在迈阿密与多米尼加共和国，直到1990年将一切集中到洪都拉斯的丹利。他于2012年去世，享年八十九岁，如今由孙子 Carlos Diez 主持。

它生产什么：每年约五百万支雪茄，其中五十万支以1995年推出的 Puros Indios 之名出品。自2016年9月起，由 C.L.E.——Christian Eiroa 的公司，本图集有其词条——从迈阿密负责分销。Eiroa 之名由此再次出现在本图集中，落在一家并非他自己的公司上。

随后是2021年8月的转折：家族把三个历史品牌——Cuba Aliados、Puros Indios 与 Roly——卖给了 Oliva。只卖品牌：丹利的工厂不在交易之列，而这些品牌的生产转到了尼加拉瓜的 Oliva。这就是 Oliva 词条收录它们的原因，也是本词条既不叫 Cuba Aliados 也不叫 Puros Indios 的原因。

工厂以家族之名继续运营，出品 Premier、Classic、Vintage 与 Cienfuegos，并承接一直支撑着丹利各作坊的代工：Kafie 于2013至2017年在此卷制雪茄，之后才自建工厂。

卖掉品牌却留下工厂，与常见情形恰好相反——而这正是本图集——按制造地分类——将它归于洪都拉斯的原因。'
 WHERE `name` = 'Reyes Family Cigars' AND SHA1(TRIM(`history`)) = 'ef753698c198e629c3d43bc1328445207c1b054e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Reyes Family Cigars' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'ef753698c198e629c3d43bc1328445207c1b054e';
-- brands|Rizona Baru|history|zh — 人名拉丁字母
UPDATE `brands` SET `history_zh` = 'Rizona 是中爪哇山区特曼贡的一家工厂，自1910年起制作雪茄——印尼仍在运营的老厂之一。创始人 Hoo Tjong An 向一位菲律宾雪茄匠学艺，本图集记下这个细节，因为它连接了图集中的两个国家：当时马尼拉为全亚洲卷制雪茄，手艺正是从那里传到爪哇。他建起小厂，雇用邻里。

其子 Sunardi Hartono 接手——一份来源说1934年，另一份说1940年；词条两者都写——给工厂取名 Rizona，并从哈瓦那和巴西进口茄衣以提升品质。五十年后，他自己的儿子 Mulyadi Hartono 接班，如今以第三代身份执掌。三十八人在此工作，多为女性，从清洗烟叶到装盒，不用现代工具；烟叶来自岛另一端的任抹。三个品牌：Kenner Ballero、Kenner King、Extra Fine。

印尼媒体把它当作古迹造访——标题写着「一个多世纪」。'
 WHERE `name` = 'Rizona Baru' AND SHA1(TRIM(`history`)) = '795261b66e46ce45d26d43c9b2bf41c9120003aa';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rizona Baru' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '795261b66e46ce45d26d43c9b2bf41c9120003aa';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rodrigo de Jerez' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '60d13f9d29e520ba9e15ac32912b8f065f823f0e';
-- brands|Rojas Cigars|history|zh — 人名拉丁字母
UPDATE `brands` SET `history_zh` = 'Noel Rojas 生于古巴，二十岁上下离开，先到迈阿密，再到尼加拉瓜。在那里他起初为他人调配：Emilio 的 Draig Cayuquero、Nomad LE Estelí Lot 1386、Ezra Zion 的雪茄、Stolen Throne 的雪茄，都出自他手。这四家公司各有词条。

他自己的牌子 Guayacan 始于2012年；首次参展在2013年。从那时到今天，中间是一连串没能撑住的作坊——Aromas de Jalapa、Tabacalera New Order of the Ages、Sabor de Estelí，全在埃斯特利，全在不久后关门——然后是2019年与 Tabacalera Flor de San Luis 合作三款雪茄：KSG、Bluebonnets、Statement。本词条把失败写出来，因为它们解释了后来的事。

后来的事，是一座自己的工厂，而这个地方本身也说明了此人：Rojas 买下埃斯特利一座旧电影院，七千多平方英尺，改造成 Rojas Cigar Factory。他往返于得克萨斯——公司所在的达拉斯-沃思堡——与尼加拉瓜——干活的地方——之间。

各系列的名字拒绝一本正经：Street Tacos、Bluebonnets、Statement。2023年的十周年也有自己的一支雪茄。'
 WHERE `name` = 'Rojas Cigars' AND SHA1(TRIM(`history`)) = '084b238322915dae620dc04e2e2a3355d1565abd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rojas Cigars' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '084b238322915dae620dc04e2e2a3355d1565abd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'RoMa Craft Tobac' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'c20d962ebf3c43e44182f2266c97af3d1255258f';
-- brands|Romeo y Julieta Dominicain|history|zh — 品牌名拉丁化
UPDATE `brands` SET `history_zh` = '如同 Montecristo、Punch、Hoyo de Monterrey，Romeo y Julieta 也是一个被1960年一分为二的名字。古巴的品牌留在哈瓦那；在古巴之外，这个名字由其旧日所有者接手，如今在多米尼加共和国、在拉罗马纳同一座巨型工厂里生产。

多米尼加版本比其他几个更明确地偏离了古巴范式。同名的哈瓦那雪茄经营的是中度而带花香的风格，多米尼加版则在几十年间尝试了从极轻到浓郁的各种路数，产品线不断增多。这是一个没有配方连续性的名字所享有的特权——也是它的风险。

烟标上的莎士比亚倒是两边都留了下来：早在十九世纪，维罗纳的爱情故事就已装饰着雪茄盒，远在政治把这个品牌劈成两半之前。'
 WHERE `name` = 'Romeo y Julieta Dominicain' AND SHA1(TRIM(`history`)) = '0e9f67cf4c679be9be7fa5b7aab890507b01e873';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Romeo y Julieta Dominicain' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '0e9f67cf4c679be9be7fa5b7aab890507b01e873';
-- brands|Room101|history|zh — 艺术总监误译创意总监
UPDATE `brands` SET `history_zh` = 'Room101 出自一位珠宝匠之手。Matt Booth 于 2003 年在洛杉矶以此名创办银饰品牌，2009 年经由与 Camacho 的合作进入雪茄行业。这是通常路径的倒转：先有设计，后有烟叶——这一点从它的标环上看得出来。

日内瓦的 Davidoff 于 2009 至 2017 年间代理该品牌。此后 Booth 离开这一行，与这家瑞士集团决裂——本图集以 Oettinger Davidoff 之名收录了它。

Scandinavian Tobacco Group 于 2022 年收购 Room101，并留任 Booth 为艺术总监。2026 年 2 月，集团重新洗牌：该品牌划归 General Cigar 一侧，而 Cohiba USA 与 Punch Honduras 转入 Forged。本图集收录了这两家公司，说的正是同一次调整。

生产是分散的，本条目选择说明而非隐去。主体出自埃斯特利的 Tabacalera A.J. Fernández；Farce Nicaragua 来自 Joya de Nicaragua，Big Payback 来自洪都拉斯的 HATSA。本条目归入尼加拉瓜，是因为本图集按主要产地归类，而非因为一切都在那里制作。'
 WHERE `name` = 'Room101' AND SHA1(TRIM(`history`)) = '3ba03bb81b45fa155519617f22786af1adf8b420';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Room101' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '3ba03bb81b45fa155519617f22786af1adf8b420';
-- brands|Royal Jamaica|history|zh — 品牌人名拉丁化；首屈一指
UPDATE `brands` SET `history_zh` = 'Royal Jamaica 是一个在一夜之间失去自身产业的国家的品牌。James Frederick Gore 于1935年在金斯敦创立了它，其家族守了三代。当1962年的美国禁运切断了美国与哈瓦那雪茄的联系，牙买加成为古巴之外加勒比地区的头号雪茄国——而 Royal Jamaica 是少数几个被美国烟客认可为严肃替代品的品牌之一。

它的风格立足于本地烟叶——比古巴的更柔和、更干爽——以及承袭英式趣味的细身尺寸。雪松、干草与红茶的气息，燃烧偏快，因而需要慢抽。

1988年9月12日，飓风吉尔伯特以全力横扫该岛。它摧毁了由创始人祖父所建的金斯敦工厂，并毁掉了梅彭一千英亩的烟田。品牌当年即被收购，生产迁往多米尼加共和国，并以同一名字延续至今。

这是极少数可以把一个国家产业的终结精确到某一天的例子。'
 WHERE `name` = 'Royal Jamaica' AND SHA1(TRIM(`history`)) = '6a8a38b92e38c8f45e633bf0b3b7f1f3259e084a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Royal Jamaica' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '6a8a38b92e38c8f45e633bf0b3b7f1f3259e084a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Saint Luis Rey Honduras' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '4cea5d8a7103144928014aacdb8e2da73e9d4985';
-- brands|Samana|history|zh — Cibao Valley 多出 Valley
UPDATE `brands` SET `history_zh` = '据cigarworld.de介绍，Oskar Nausch是来自伍珀塔尔的德国医生，专攻发展中国家医学，现任多米尼加共和国圣地亚哥-德洛斯卡瓦列罗斯的Tabacalera Don Esteban雪茄厂所有者兼负责人。据cigar.ch介绍，该厂由Peter Rohner于1997年为瑞士的Wellauer AG创办；首次尝试曾失败，此后由Nausch接手管理，年产量约为120万支雪茄。Nausch在此还制作另一品牌Capadura。该厂未标明Samana品牌的创立年份。

Samana在Don Esteban完全手工卷制，共有多个系列。经典系列采用美国产Connecticut Shade Claro茄衣与多米尼加茄套，规格约十五种，从Chico到Piramide，力度温和，据cigarworld.de介绍。1756系列采用厄瓜多尔产Connecticut茄衣，茄芯来自Cibao，力度适中，据noblego.de介绍。较新推出的Nicaragua Line将厄瓜多尔产Habano 2000茄衣与产自埃斯特利的ligero和seco茄芯结合，力度浓郁，装于蓝白礼盒，据zigarrenversand.ch介绍。Flair系列是Nausch与其子Adrian共同调配的配方，采用Connecticut茄衣，据smokersplanet.de介绍。

该品牌主要在瑞士和奥地利销售，与零售商cigarworld.de保持着二十年的合作关系；截至2026年9月，该店与noblego.de、fumar.ch及zigarrenversand.ch一同将其列入目录。'
 WHERE `name` = 'Samana' AND SHA1(TRIM(`history`)) = 'a3de2bcedbcdaa0fd257f1eea0d8a5689479432c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Samana' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'a3de2bcedbcdaa0fd257f1eea0d8a5689479432c';
-- brands|Santa Bras|history|zh — 人名拉丁字母
UPDATE `brands` SET `history_zh` = 'Santa Bras 是南非南海岸乔治镇的一家作坊，自称该国仅有的雪茄制造商——2023年的农业媒体从其卷工口中重复了这句话。按公司的说法，故事始于1990年代的一项爱好：创始人试用本地烟叶，用东北部低地草原的烟叶失败，随后在西开普省斯瓦特山与奥特尼夸山之间找到一处山谷，从那里取茄衣和茄套；茄芯来自东开普省的农场。公司没有说明从爱好到企业的时间，也没有点出创始人的名字；词条就此打住。

此外所知的只有两个名字：Jaco Snyman，业主，亲自卷制，媒体称他为 torcedor；Annerie Snyman，在一档经济广播节目中被介绍为公司背后的创业者。他说烟叶陈化两年；晾制烟只占南非烟草的五分之一，三四百家种植者靠它生活，而正是这一部分做成雪茄。

Navigator 系列——Escobar、Goncalves、De Coimbra、De Alenquer，绕过好望角的葡萄牙航海家的名字——是高档线，全用本地烟叶；加香的 Nonnie 和 De La Rey 是短茄芯，图集不收。一处山谷，一家公司，来源主要是公司自己：本图集以手头所有开辟南非，并如实说明。'
 WHERE `name` = 'Santa Bras' AND SHA1(TRIM(`history`)) = '7c6322cefdeef5490ce7dc2ebfef662d5c7cfca0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Santa Bras' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '7c6322cefdeef5490ce7dc2ebfef662d5c7cfca0';
-- brands|Santa Clara 1830|history|zh — 品牌名拉丁化；禁用字
UPDATE `brands` SET `history_zh` = '韦拉克鲁斯州的圣安德烈斯山谷出产一种全世界都在用、却未必知其来处的烟叶：深色而带甜的墨西哥圣安德烈斯茄衣，二十年间已成为业内极受追捧的包裹叶之一，连尼加拉瓜的配方里也有它。

Santa Clara 宣称创立于1830年，若属实，它便是该国历史居首的烟厂，也是整个大陆历史极为悠久的烟厂之一。这家企业属于 Turrent 家族，他们在这座山谷耕作已历数代，如今是墨西哥境外圣安德烈斯茄衣的主要供应者。

正是这种双重角色让这家企业变得有意思：它把烟叶卖给竞争对手，又用同样的烟叶卷自己的雪茄。墨西哥的国家页此前只有两条记录，其中一条甚至不是墨西哥品牌——这一条纠正了一个刺眼的失衡。'
 WHERE `name` = 'Santa Clara 1830' AND SHA1(TRIM(`history`)) = '7a64398b6f2f2dd1fa50fc1a54843aae3e8d9fd8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Santa Clara 1830' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '7a64398b6f2f2dd1fa50fc1a54843aae3e8d9fd8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Santa Damiana' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '6d7362cb466fc6ea2d64cde1d5de1467a3ac309f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Schumacher' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'c232d4606f93f87032f4b9c7e5bc7f815cab55da';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Secret Blend of Cuba' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '96649ac7b2b8b46d335ad9368a3e1bba3d951311';
-- brands|Selected Tobacco|history|zh — 人名拉丁字母
UPDATE `brands` SET `history_zh` = '2012 年，Nelson Alfonso 在哥斯达黎加创办 Selected Tobacco，一开始便推出 Atabey 与 Bandolero，Byron 随后问世。

雪茄在圣地亚哥-德普里斯卡尔的 Tabacos de Costa Rica 卷制。这三个品牌——Atabey、Byron 与 Bandolero——各有词条。该公司另有以其本人名字命名的 Alfonso 系列。'
 WHERE `name` = 'Selected Tobacco' AND SHA1(TRIM(`history`)) = '22da1ab462369c3d1e335d3fa9f26b439519f193';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Selected Tobacco' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '22da1ab462369c3d1e335d3fa9f26b439519f193';
-- brands|Serino Cigar Co.|history|zh — 人名拉丁字母
UPDATE `brands` SET `history_zh` = 'Serino 是一桩父子之事，Tony 与 Carson，2016年因一次相遇而创立：认识了埃斯特利 La Corona Cigars S.A. 工厂的老板 Omar González-Alemán。他们在那里共同调配了首条产品线 Serino Royale，此后几乎一切都在那里卷制。La Corona 在本图集中没有词条；此处点名，且只要没有自有品牌足以支撑，就一直只是点名。

儿子 Carson 主导了之后的系列：2017年的 Wayfarer，随后是 Taíno——以哥伦布之前的加勒比原住民命名。一家以四手调配起步、以儿子的调配延续的公司：传承在三年内完成。

本图集把它归入所售雪茄的卷制地尼加拉瓜，并保留工厂及其主人的名字——这是规则。'
 WHERE `name` = 'Serino Cigar Co.' AND SHA1(TRIM(`history`)) = '523e4b2eda5a9bf6e5ed1f1331a74e2e2a4836c0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Serino Cigar Co.' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '523e4b2eda5a9bf6e5ed1f1331a74e2e2a4836c0';
-- brands|Siglo de Oro|history|zh — 人名拉丁化；漏品牌名
UPDATE `brands` SET `history_zh` = 'Siglo de Oro 是莫斯科的一家雪茄工厂——这一句就足以说明词条为何存在。曾经营建筑公司、据合伙人说「生下来嘴里就叼着雪茄」的 Artur Chiliaev，2011年与 Andreï Ivanov 开办了它。五六位卷工在此工作，全部来自古巴和尼加拉瓜；Chiliaev 亲自到古巴、尼加拉瓜和多米尼加采购烟叶，调配公司的五个系列、三十三种尺寸。一间大陈化室让雪茄至少存放四个月，他觉得太年轻就存更久。

年产约三十五万支，只在俄罗斯销售——这个市场2020年约消费二百五十万支。品牌讲述这个国家：普希金笔下的叶甫盖尼·奥涅金居首；Siglo de Oro、Pelo de Oro 和 Hidalgo 是西班牙语；Tchortova Dioujina，即「魔鬼的一打」。本图集为这家公司和 Pogar 把俄罗斯列为卷制之地，不设田地与品种：所有烟叶来自别处。

英语行业媒体对它视而不见；俄罗斯雪茄媒体追踪它十年，词条引用的正是后者。'
 WHERE `name` = 'Siglo de Oro' AND SHA1(TRIM(`history`)) = '362b0f59807f31832cb61d3f31a810763d4e1ab4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Siglo de Oro' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '362b0f59807f31832cb61d3f31a810763d4e1ab4';
-- brands|Simon Beltre|history|zh — 人名拉丁字母
UPDATE `brands` SET `history_zh` = 'Simon Beltre是多米尼加品牌，由Beltré家族经营，该家族在阿苏阿种植烟草已有数代。据多家欧洲经销商介绍，创始人Simón Beltré早在1976年、五岁时便由祖父Andrés Beltré（人称「Don Titi」）和父亲Alcibiades Beltré在家族的土地上引入烟草世界。SB品牌由此于2017年诞生。

雪茄在阿苏阿的家族庄园手工制作；查阅的资料均未提及另有独立工厂，也未在省份之外说明确切城镇。自有目录主要包括CSZ——一位罗马尼亚经销商称之为Swiss Chocolate，茄衣为厄瓜多尔Habano H-2000，茄套为Olor Dominicano，茄芯为Semilla 2020、San Vicente、Negrito和SVM；以及Andullo——据一位英国进口商介绍，按同名多米尼加传统以王棕叶鞘卷裹陈化。这两条产品线仍列于多家欧洲经销商的目录中。'
 WHERE `name` = 'Simon Beltre' AND SHA1(TRIM(`history`)) = 'dff927cd7268aec39c9b802cb539b81bd05d38da';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Simon Beltre' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'dff927cd7268aec39c9b802cb539b81bd05d38da';
-- brands|Sindicato Cigar Group|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Sindicato 是零售商的品牌，须立即说明它与 Black Swan 有何不同：它不是一个卖家向轮换工厂订制的系列，而是一家公司——Sindicato Cigar Group——2013年由一群想拥有自己品牌的店主创办，有常设目录，总裁出身行业：前 Altadis USA 副总裁 Jim Colucci。名字道出了所有权的形式。

一切都在埃斯特利的 Casa Fernández 卷制——即今日的 Aganorsa Leaf，本图集载有其词条——用 Fernández 农场的烟叶。以三款配方起步：厄瓜多尔 Habano 茄衣的 Hex，以及两款厄瓜多尔康涅狄格茄衣、尼加拉瓜与多米尼加填充的 Affinity 与 Casa Bella。冠以集团之名的 Sindicato 随后推出，再是 Particulares——一个被重新启用的古巴老牌名。

由卖它的人构思、由点名的工厂卷制的牌子：本图集保留它，并说明理由。'
 WHERE `name` = 'Sindicato Cigar Group' AND SHA1(TRIM(`history`)) = 'c5ac8ff71a797b37d684230fe8c3f8a90506ad4a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Sindicato Cigar Group' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'c5ac8ff71a797b37d684230fe8c3f8a90506ad4a';
-- brands|Skull 77|history|zh — 日期格式错误，城市译名
UPDATE `brands` SET `history_zh` = 'Skull 77 是 Laurent Taha 的品牌，Zigarrenversand.ch 将他介绍为品牌背后的人，而 rauchr.de 将其姓名写作 Tahla。Zigarrenversand.ch 称该品牌创立于2014年7月7日，77 即取自这一日期。据 rauchr.de，Tahla 与雪茄和品味打交道已超过二十年，2014年在一次品鉴会上结识了 Marc Niehaus，称其为 Vegas de Santiago Cigars 的所有者；两人成为朋友，并与一位 blendmaster 在哥斯达黎加一家高端雪茄工厂共同研发出混合配方。

Cigarworld.de 和 rauchr.de 给出的制造商是 Tabacos de Costa Rica S.A.，进口商是位于埃斯林根的 Casagranda Cigars GmbH；Zigarrenversand.ch 则提到位于哥斯达黎加的 Vegas de Santiago 工厂。Casdagli 写道，其与 Tabacos de Costa Rica SA（当时被称为 Vegas Santiago）的合作始于2012年；Cigar Coop 将 Tabacos de Costa Rica 的工厂置于圣地亚哥-德普里斯卡尔。

该品牌有四种茄型，以 longfiller 手工卷制，茄衣为厄瓜多尔的 H-2000。2026年10月，Zigarrenversand.ch 和 Humidor.ch 将它们列入目录，而 Cigarworld.de 和 rauchr.de 保留 Unicos，自2018年6月27日起列入目录，列为清仓款，库存十三支；Zigarrenwelt.de 同样标示 Niños，自2019年12月20日起列入目录。'
 WHERE `name` = 'Skull 77' AND SHA1(TRIM(`history`)) = 'af2623e8ba9513416ce29206cf3fefe5dbb61146';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Skull 77' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'af2623e8ba9513416ce29206cf3fefe5dbb61146';
-- brands|Southern Draw|history|zh — 规避禁用字样
UPDATE `brands` SET `history_zh` = 'Southern Draw 是一对夫妻的公司。Robert 与 Sharon Holt 于 2014 年创办；他是美军退伍军人，公司对此直言不讳。

它只在一个地方代工：埃斯特利的 Tabacalera A.J. Fernández。这在没有自有工厂的公司中并不多见——Crowned Heads、Dunbarton 与 Room101 各自使用数家，而这种分散已成为精品圈的常态。

它知名度极高的一条线以妻子之名命名。Rose of Sharon 是一种植物，但它首先是 Sharon Holt；公司把这一点作为自己主张的核心——他们所说的荣誉文化，建立在家庭、信仰与情谊之上。

其余各线取名于美国南方的植物与地貌：Kudzu、Cedrus、Jacobs Ladder、Manzanita。这是一种主动申明的地域归属，而其烟叶却全部来自中美洲。'
 WHERE `name` = 'Southern Draw' AND SHA1(TRIM(`history`)) = '9ecb230e266c1630b2dd4b87b78c06054bd604b6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Southern Draw' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '9ecb230e266c1630b2dd4b87b78c06054bd604b6';
-- brands|Spartanos|history|zh — caviste误译为雪茄零售商
UPDATE `brands` SET `history_zh` = 'Spartanos 是德国酒商 Jürgen Ring 的品牌，他是位于比辛根的 Crazy Store 的店主；品牌名称取自他从事武术与健美的那些年，以及电影 300，据 Cigarworld.de 介绍。起初的版本由 Kurt Brandt 在尼加拉瓜合作完成；雪茄在尼加拉瓜完全手工卷制，该品牌未说明其工厂名称。

起初的系列分为 Connecticut 与 Maduro，销售至2022年。2026年9月，Cigarworld.de 销售三个系列，均为 Robusto 规格、强度中等：Connecticut，Connecticut 茄衣搭配多米尼加茄套与茄芯；Maduro，尼加拉瓜 puro；以及 Limitada 2022，尼加拉瓜 puro。Jürgen Ring 还销售一款 Spartanos 朗姆酒，据同一零售商介绍。'
 WHERE `name` = 'Spartanos' AND SHA1(TRIM(`history`)) = '20f72426be5c1befdadf04a2c56346f4f7e55fcf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Spartanos' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '20f72426be5c1befdadf04a2c56346f4f7e55fcf';
-- brands|Stauffenberg|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Stauffenberg 是由 Maik Neubauer 推动的德国品牌，他希望打造属于自己的洪都拉斯雪茄。产品在洪都拉斯丹利的家族工厂 La Pequeña Vega 手工卷制。首版于2025年5月进入德国市场，限量3000支，随后销售网络扩展到奥地利和瑞士。

该品牌的产品目录以编号系列而非命名产品线呈现。Edition 1 是一款 Pyramides，纯洪都拉斯 Criollo 98 配方：茄衣、茄套和茄芯均为同一种烟叶。Edition 2 同样是纯洪都拉斯 Criollo 配方的 Robusto，自2025年9月起发售。Edition 3 是一款在丹利卷制的浓郁 Toro，发布日期定于2025年11月。Edition 4 采用 candela 茄衣，原定于2026年推出。据品牌介绍，其名称是为纪念 Claus Schenk Graf von Stauffenberg 及德国反纳粹抵抗运动人士。'
 WHERE `name` = 'Stauffenberg' AND SHA1(TRIM(`history`)) = 'dfe322c2afe07d81b42acc1adb247b309b4df90a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Stauffenberg' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'dfe322c2afe07d81b42acc1adb247b309b4df90a';
-- brands|Stolen Throne|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Stolen Throne——被窃的王座——是弗吉尼亚的一家公司，从未自己卷过一支雪茄，并且直言不讳。Richard「Lee」Marsh 2019年与埃斯特利的古巴调配师 Noel Rojas 合作创立——本图集载有 Rojas 词条：首批雪茄出自 Rojas 当时任职的 Tabacalera Flor de San Luis，早于 Rojas Cigar Factory。Ezra Zion、Nomad 与 Emilio 做了同样的选择；Rojas 为本图集的四家公司卷制。

前两条线奠定了名声：Crook of the Crown——篡位者，与 Call to Arms——号召武装。随后是 Three Kingdoms 与 Yorktown Fleet——后者取自独立战争的地名，弗吉尼亚使然。2024年的五周年有自己的 Corona。

讲故事的品牌名、点名的调配师、点名的工厂：这正是本图集所要求的，词条无须添加什么。'
 WHERE `name` = 'Stolen Throne' AND SHA1(TRIM(`history`)) = 'b70c59a43007b0846f39609de92c40bb39dfa871';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Stolen Throne' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'b70c59a43007b0846f39609de92c40bb39dfa871';
-- brands|Suerdieck|history|zh — 人名品牌拉丁化，规避禁字
UPDATE `brands` SET `history_zh` = '巴伊亚的烟叶，产自克鲁斯达斯阿尔马斯周边的雷孔卡沃，一个多世纪以来供养着一个向欧洲出口的雪茄产业——那还远在中美洲主导市场之前。Suerdieck 是其中名声极为响亮的一家——而它已经不复存在。

德国人 August Suerdieck 于1888年以汉堡某商行雇员的身份来到巴伊亚，负责监督烟叶打包。四年后，他买下雇主的仓库，创立了自己的公司。雪茄制造随之而来，先在马拉戈日皮，后在克鲁斯达斯阿尔马斯，Suerdieck 成为该国首要的生产者。

它的烟叶——马塔菲纳，深色、带甜、有一种独特的酸度——在别处没有对应之物。习惯了古巴风格的烟客，往往在头一口就觉得这味道令人意外：更果味，近乎酒感，燃烧偏快，因而需要更慢地抽。

2000年，在存续一百零八年之后，这家企业关闭了仅存的那座工厂。本图集保留它，是因为它所代表的东西：一个被优质雪茄的地理格局边缘化的产国的记忆——而这一次，是被抹去了。'
 WHERE `name` = 'Suerdieck' AND SHA1(TRIM(`history`)) = 'b1f7f17329cec904f408f9c629fe0878b32412fc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Suerdieck' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'b1f7f17329cec904f408f9c629fe0878b32412fc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Swag' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '9ff091a512247d46f0213b4692ee98746505f6e1';
-- brands|SYN|history|zh — 公司名标点被改动
UPDATE `brands` SET `history_zh` = '据synbrands.com介绍，Joseph Casimir在多米尼加共和国圣地亚哥省坦博里尔创立了Tabacalera SYN。他对雪茄的热情始于1990年，即他上大学的头一周；三十年后，历经多次商业尝试，他才创立了这家公司；该厂并未标明这一创立年份。

据该厂介绍，Juan Rodriguez以首席调配师身份执掌工厂，拥有三十五年以上经验，这些经验是他加入SYN之前在其他品牌积累的。他与De Los Reyes Cigars现任所有者Leo Reyes密切合作，共同挑选烟叶。

截至2026年9月，产品目录共有两个系列。The Original SYN以两种茄衣版本卷制而成，一种为陈化五年的Habano HVA，另一种为陈化五年的Corojo Maduro，茄套为多米尼加烟叶，茄芯采用在多米尼加共和国种植的古巴品种Corojo，规格为Petit Robusto和Salomon。The Seven Syns汇集七款以七宗罪命名的配方——GULA、IRA、ACEDIA、AVARITIA、LUXURIA、SUPERBIA、INVIDIA——采用陈化五年、以多米尼加烟叶为主的烟草，据该厂介绍。

SYN通过自有机构销售：SYN Cigars, Inc.（迈阿密）、SYN Europe GmbH（德国）、SYN Asia, Ltd.（越南）以及负责加勒比地区的Olmaq Trading NV，并在以色列、非洲和印度设有代表。'
 WHERE `name` = 'SYN' AND SHA1(TRIM(`history`)) = '22903921f9d6a1deffec5462be928a83b0f1af4f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'SYN' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '22903921f9d6a1deffec5462be928a83b0f1af4f';
-- brands|T. Sonthi|history|zh — 城市名应译出
UPDATE `brands` SET `history_zh` = 'Thomas Sontheimer在德国的劳普海姆经营T. Sonthi Rum & Cigars：自2020年起经营朗姆酒，自2022年起推出尼加拉瓜手工雪茄，据该品牌官网称；网站将这两项业务描述为对陈年烈酒与烟草的同一种喜爱的两个方面。

无论是该网站，还是将该品牌归类为尼加拉瓜雪茄的经销商Cigarworld.de，均未指明卷制工厂。

据Cigarworld.de称，该系列共有四条长茄芯产品线，均采用产自孔德加（位于埃斯特利以北四十公里处）的茄套与茄芯：Anne Bonny，采用经过四个月干燥的厄瓜多尔claro茄衣；Blackbeard，采用经过八个月发酵制成maduro的厄瓜多尔viso茄衣；Tortuga，天然外观，规格较短；以及Luxury-Edition，规格较长，双色外观。这些名称均取自海盗主题：Anne Bonny与Blackbeard是两位历史上真实存在的海盗，Tortuga则是加勒比海一座曾为海盗巢穴的岛屿。'
 WHERE `name` = 'T. Sonthi' AND SHA1(TRIM(`history`)) = '0b8a4f49bbac51dfb25f8d69dde973dd49e5c4dc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'T. Sonthi' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '0b8a4f49bbac51dfb25f8d69dde973dd49e5c4dc';
-- brands|Tabacalera|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Tabacalera 诞生于一项殖民行政决定。据 Philstar（2011），西班牙在菲律宾的烟草专营于1780年强制推行，1881年6月5日被废除；同年，Compañía General de Tabacos de Filipinas 由科米利亚斯侯爵 Antonio López y López 创立，Philstar 称在11月11日，Verafiles（2014）称在11月26日。它收购雪茄工厂，统一品质，并出口「马尼拉雪茄」。

Tabacalera Incorporada 公司如今自称为亚洲的一家雪茄工厂，并把手工制作的起点定在1881年（tabacalera.com.ph，2026年10月），用的是伊莎贝拉及其他地方的烟叶。该公司的旗舰品牌 La Flor de la Isabela 为纪念创立公司而改名为 Tabacalera（Philstar，2011）。

该集团几易其主。Verafiles（2014）描述了一家西班牙公司：从1950年代到1990年代被分块出售，La Flor de la Isabela 品牌也在其中；随后1997年至2007年间是一连串外国收购，直至荷兰公司 CDF International。Philstar（2011）写道，一个世纪之后，Compañía 出售其雪茄业务，工厂转入菲律宾人手中。工厂位于甲米地省的达斯马里尼亚斯，占地约2700平方米，雪茄在此手工制作，使用已有一百多年历史的木制压床（Philstar，2011）。

同名者：本词条是 Tabacalera Incorporada（菲律宾）的词条。它与西班牙公司 Tabacalera, S.A.（西班牙专营、Altadis、Habanos 的共同所有者）无关，也与 Tabacalera del Oriente、Palma、Paxtián 或 William Ventura 无关。'
 WHERE `name` = 'Tabacalera' AND SHA1(TRIM(`history`)) = 'f1ad2d3bce91f84fe111559ac29d083359dd1e7b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacalera' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'f1ad2d3bce91f84fe111559ac29d083359dd1e7b';
-- brands|Tabacalera del Oriente|history|zh — 人名拉丁化，城市译名统一
UPDATE `brands` SET `history_zh` = 'Tabacalera del Oriente 是亚马逊地区圣马丁大区塔拉波托的工厂，秘鲁通讯社称之为该国仅有的 puro 工厂。它的日期对不上：同一家通讯社说种植园建于二十世纪中叶；一位美国专栏作者说公司成立于1997年；一个利马博客写道，2011年时企业约有十年——词条全都写下。彼此吻合的是：它起初从古巴进口种子、烟叶和卷工，自2004年起用全秘鲁烟叶做雪茄。Lettieri 家族掌管它——族长 Salvatore、经理 Gennaro——；2011年前离开的合伙人另创了一个品牌 Café del Mundo。

田地在胡安格拉，离城十五公里，在通往尤里马瓜斯的路上：2016年90公顷，三个品种——Negro、Pelo de Oro、Criollo——还有加勒比没有的全年播种条件。烟叶首先以原叶出售，每年80到100吨运往中美洲，占营业额七成；雪茄2016年每年50万支，据2023年媒体为一百万支，八成出口，销往欧洲和亚洲。卷工多为女性，2011年前后由两位古巴师傅带领；2011年一份意大利合同，22万美元，用的是经销商的品牌。

三个自有品牌——Señor de Sipán，以西潘王的莫切面具为标；Miguel Grau；San Martín——以及一条 puritos 小雪茄线。2017年一位品鉴者发现 Señor de Sipán 是短茄芯；词条如实写下，不对整个系列下断语。秘鲁通过这家工厂进入图集，带着胡安格拉产区。

Inca并非该工厂的品牌：它归Mitchell Orchant所有，他是英国零售商C.Gars Ltd的董事，于2012年在英国以Inka Secret Blend之名推出。这些是由Tabacalera del Oriente在塔拉波托卷制的秘鲁puros。美国版写作Inca；2015年，Alec Bradley负责其分销。2026年10月，德国商店Tabak Träber销售Inca Tambo，由Kopp Tobaccos分销，英国商店则销售Inka Secret Blend。'
 WHERE `name` = 'Tabacalera del Oriente' AND SHA1(TRIM(`history`)) = 'a4e27680a63f4fc119da82912a01ca425e59d902';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacalera del Oriente' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'a4e27680a63f4fc119da82912a01ca425e59d902';
-- brands|Tabacalera Palma|history|zh — 比例「七成以上」不准
UPDATE `brands` SET `history_zh` = 'Tabacalera Palma 不是一个品牌，而是本图集中四个品牌的出产地。José Arnaldo Blanco II 于 1925年设立了它，并于 1936年提交工业登记，该公司在其介绍页面上如此说明；其首页与 Cigar Coop（后者在 2026年3月注明其已有九十年）都把业务从 1936年算起，Premium Cigar Association 2024年4月的一篇文章则写出了这两个年份。他的父亲 José Manuel Blanco Lozada 是抵达多米尼加共和国的西班牙人——据该公司称是在十九世纪中叶，公司把企业的起源定在那时；据 Premium Cigar Association 2024年4月的一篇文章，则是在 1880年代末。

如今由 José「Jochy」Blanco 主持。他是家族第四代烟农，也是第三代掌门——在一个几乎所有招牌都已易主的行业里，这样的延续并不多见。

1995 年，他把工厂迁入自己创设的一处自由贸易区，位于圣地亚哥郊外的坦博里尔。这片区域名为 La Palma，人们常把区名与公司名混为一谈，根源正在于此。厂内员工三百五十余人，其中七成以上为女性。

工厂卷制自有品牌 La Galera，也为别人代工：为 Rafael Nodal 生产 Aging Room 与 Swag（但 Aging Room 的 La Bohème 与 Quattro Nicaragua 自 2025年起由尼加拉瓜的 A.J. Fernandez 制造），还有本图集已收录的 Matilde。Altadis 的 Trinidad Santiago 也由它调配——一家多米尼加工厂做着一支挂古巴名字的雪茄，这倒相当准确地概括了这个国家。'
 WHERE `name` = 'Tabacalera Palma' AND SHA1(TRIM(`history`)) = '155ff4c91e1b2616f965d57a3ab37da4bfe5fce9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacalera Palma' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '155ff4c91e1b2616f965d57a3ab37da4bfe5fce9';
-- brands|Tabacalera R. Paxtián|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Tabacalera R. Paxtián 首先是种植者之家，然后才是雪茄之家。圣安德烈斯-图斯特拉河谷西瓦潘的 Don Juan Rodríguez López 十四岁下烟田，十五岁成婚，自1910年起在租来的地上种到七公顷，为自己卷 jolochitos，工作到九十六岁，一百零二岁去世；墨西哥雪茄媒体说，他没有留下企业，留下的是手艺。儿子 Víctor 同龄下田，后来统筹多达三百公顷，每公顷两吨，八十三岁过后仍在黎明前起身。

公司本身始于1990年：Víctor、他的儿子 Francisco——Paco，1994年毕业的工业工程师，设计了全部品牌——和一位兄弟，这次是在自家的地上。高档雪茄始于1994年的 Los Puros del Paraíso；随后是 Privilegios、R. Paxtián 和小规格的 TabaRicos，全部在西瓦潘手工卷制，用的是公司视为世上上佳成熟茄衣的 Negro San Andrés——这是公司自己的说法。第四代——孙辈——在过去五年里加入。

这是一家圣安德烈斯工厂：在 Turrent 家族和 Santa Clara 之外，一个用了一个世纪才把自己的名字签在烟叶上的河谷家族。'
 WHERE `name` = 'Tabacalera R. Paxtián' AND SHA1(TRIM(`history`)) = '8006a95f169417ff61af7e0e7678c2df44b2bc18';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacalera R. Paxtián' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '8006a95f169417ff61af7e0e7678c2df44b2bc18';
-- brands|Tabacalera William Ventura|history|zh — 人名品牌改拉丁字母
UPDATE `brands` SET `history_zh` = 'Tabacalera William Ventura 是圣地亚哥自由区坦博里尔的一家工厂，它为多家公司卷制：Caldwell 在此调配配方，La Barba 后来也把自己的配方安在这里，ADVentura 与 Freud 在此卷制。

William Ventura 出身 Davidoff，多年主管生产——1991年 Davidoff 雪茄进入美国时他已在任。他约于2007年开办自己的工厂；资料相差一年，本词条如实说明而不择其一。子女相继加入：Henderson Ventura，调配师，其名屡见于合作项目；Wiber，在 Davidoff 二十年，2019年离开「与父亲共建一番事业」；Nataly，负责物流、包装与财务，也参与调配。

2022年9月26日凌晨三时前，工厂与 Intercigar 共用的厂房失火。付之一炬：Ventura 近八十万支待包装或待陈化的雪茄，Intercigar 七十万支成品，以及原料。约百名员工，不足四十名卷工，无人受伤。Robert Caldwell 当周即宣布，生产将转往卫星作坊与 El Maestro——家族为自有品牌保留的小厂——继续。

同名新厂于2024年3月重开，如今两厂并行。此后 Scandinavian Tobacco Group 将 Partagás Y Nada Más Santiago 交由它生产——集团品牌托付家族工厂，足见业界对它的看法。

自有品牌名为 William Ventura 与 El Maestro。但本词条首先是为他人而设：这是一家替无厂之家卷制的工厂，而本图集有义务写明谁做了什么。'
 WHERE `name` = 'Tabacalera William Ventura' AND SHA1(TRIM(`history`)) = '9886787e779726db01b8c3226a1876c9bdda15c5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacalera William Ventura' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '9886787e779726db01b8c3226a1876c9bdda15c5';
-- brands|Tabacosta|history|zh — 百万位置错误
UPDATE `brands` SET `history_zh` = 'Tabacos Costa Nicaragua S.A.，即 Tabacosta，由 Antonio Costa 与其子（同样名叫 Antonio）在巴拿马创立——据 Momentohumo.com 介绍为2002年，据 Halfwheel 介绍为2012年。公司落户尼加拉瓜的时间，据同样的来源为2004年或2014年；并在埃斯特利建起自有工厂，面积约4000 m²，据 Momentohumo.com 介绍；2016年，公司声称拥有200名员工、年产180万支雪茄，据 Halfwheel 介绍。该公司未说明2026年时的所有者是谁。

Momentohumo.com 在2017年6月2日的一个页面中列出其四个自有品牌，即 Costa、Costa Maduro、Costa Platinum 与 Bucanero，并称其为第三方客户卷制雪茄。2016年，Tabacosta 在 IPCPR 上展示 Costa Platinum 与 Manuel Alonso Gran Selección，据 Halfwheel 介绍；西班牙零售商 Humoytabaco.com 称 Manuel Alonso 归古巴人 Damián Taipanes 所有。

2026年10月，tabacosta.com 网站（其 About 页面标注日期为2025年9月9日）以 Costa Cigars 之名介绍该公司：在埃斯特利手工制作的雪茄、位于 El Rosario 街区的地址和工厂照片，没有点出任何品牌或系列。Humoytabaco.com 在2024年11月写道，不清楚 Manuel Alonso 品牌是否仍在市场上。'
 WHERE `name` = 'Tabacosta' AND SHA1(TRIM(`history`)) = '7bf9eb43104265954e6feb73ea28f0fdc073d697';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacosta' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '7bf9eb43104265954e6feb73ea28f0fdc073d697';
-- brands|Tabaqueria de Filipinas|history|zh — 人名拉丁化，规避禁字
UPDATE `brands` SET `history_zh` = 'Tabaqueria de Filipinas 是一位退休者的公司。Gabriel Ripoll Jr.——公司称他「El Magnifico」——自1960年代起一生在雪茄行业做经理与顾问，从香港到多米尼加共和国；1993年退休后，他在马尼拉塔夫特大道开了一间小作坊：四名旧部、他的小儿子，以及取自父亲的名字。行业媒体说是旧马尼拉一栋租来的战前老屋里的五位卷工。

作坊后来成了拉古纳省圣佩德罗的一家工厂，两百多人——公司说是二百五十人——日产一万五千支，还自制纳拉木盒。烟叶来自公司在吕宋北部图包谷的种植园，以及伊莎贝拉——菲律宾雪茄的历史产区；只有茄衣来自印尼——爪哇，一如马尼拉百年来的惯例。三个品牌：Antonio Gimenez、Independencia 1898——共和国成立之年——、Flor de Filipinas。创始人的三个儿子执掌公司。

另外三家菲律宾公司，都是1881年西班牙 Tabacalera 的继承者。这是此后创立的头一家，也为他人代工：词条记下这一点，但不知为谁。

现有来源中没有比2016年亚洲烟草媒体更新的资料，那篇报道称它虽年轻却是该国规模居首的雪茄厂：两百多人，每天手工卷制一万五千支，品牌为 Antonio Gimenez、Independencia 1898 和 Flor de Filipinas。'
 WHERE `name` = 'Tabaqueria de Filipinas' AND SHA1(TRIM(`history`)) = '7afc64da1ce02f8212945f1859047f97a0452bb0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabaqueria de Filipinas' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '7afc64da1ce02f8212945f1859047f97a0452bb0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tambor Essence' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '0d30de13f0de4c15f36fd538ca6ade53e92f0817';
-- brands|Taru Martani|history|zh — 庄家误译，句子错乱
UPDATE `brands` SET `history_zh` = '自十九世纪起，爪哇与苏门答腊就供应着欧洲大量使用的烟叶：苏门答腊茄衣包裹过一代代荷兰、德国与比利时雪茄。然而在雪茄的想象中，印尼始终是供应者——而不是一个拥有雪茄厂号的国家。

Taru Martani 纠正了这一点。它由荷兰人 N.V. Negresco 于1918年创立，三年后落户日惹；这座工厂随着占领更迭而易主——先荷兰，后日本——直至1949年重归印尼。

正是那时，苏丹 Hamengkubuwono IX 为它取了如今的名字：Taru Martani，爪哇语意为「赋予生命的叶子」。这个名字本身讲述着一次收回主权，而在别处很难找到一支雪茄，其名称如此明白地说出一种独立。

这家在全国年代居首的企业至今仍以手工完成绝大部分生产，并出口至欧洲与亚洲。它如今是本图集中唯一的印尼企业：该国另外两个词条收录的是荷兰的机制雪茄品牌，而机制雪茄不在本图集之列。'
 WHERE `name` = 'Taru Martani' AND SHA1(TRIM(`history`)) = '5f556b9b22a963eb04bb2d310076fc1984c828c1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Taru Martani' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '5f556b9b22a963eb04bb2d310076fc1984c828c1';
-- brands|Tatuaje|history|zh — 人名品牌拉丁化，规避禁字
UPDATE `brands` SET `history_zh` = 'Tatuaje 诞生于一位加州爱好者与一个古巴卷制家族的相遇。Pete Johnson 在洛杉矶一家店里卖雪茄时，说服了当时在迈阿密卷制的 José Pepín García 为他调配一款配方。头一支 Tatuaje 出自一间极小的作坊；生产随 García 一家迁往埃斯特利，他们的工厂成为该国声誉极高的工厂之一。

这个品牌之所以重要，是因为它在恰当的时刻带来了恰当的想法：按古巴方法制作、用尼加拉瓜烟叶、卖给无法获得哈瓦那雪茄的美国烟客。它不是模仿古巴雪茄，而是沿用其语法——尺寸、结构、燃烧的节奏——再以更直率的原料填充。

品牌名意为「纹身」，创始人身上就有。这个品牌很早就确立了个人化的美学，逆着当时仍热衷徽章与王冠的行业风气而行。它所激起的那份忠诚，有一部分正源于此：人们知道背后是谁。'
 WHERE `name` = 'Tatuaje' AND SHA1(TRIM(`history`)) = '9623bd96602d29e79eb08d514b45c05ebda0f458';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tatuaje' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '9623bd96602d29e79eb08d514b45c05ebda0f458';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Teatro del Mundo' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '870e51618cb9dc1c8f3ee29a2e207e05562949de';
-- brands|Temple Hall|history|zh — 品牌人名拉丁化，增添了比较级
UPDATE `brands` SET `history_zh` = 'Temple Hall 是一个由工厂名变成品牌名的名字，而 Macanudo 正是在那里诞生的。

1969年 General Cigar 买下这座金斯敦工厂时，它属于 Gradiaz, Annis & Co.——这笔交易同时也让 General Cigar 获得了古巴之外 Macanudo 这一名称的权利。集团把当时的大调配师之一 Alfons Mayer 派驻于此；正是从这座牙买加工厂里，调配出了后来风行世界的 Macanudo——尽管生产其后迁往了多米尼加共和国。

Macanudo 这个名字本身则来自另一条路径：在古巴制作 Punch 的 Palicio 家族，二战期间避难牙买加，先把这个名字用于自家的一款尺寸，随后才使之成为品牌。

Temple Hall 本身也曾作为独立品牌存在，其牙买加配方比它所生产的 Macanudo 更浓。1988 年的吉尔伯特飓风摧毁了岛上的烟叶，但这座工厂又撑了十二年：General Cigar 于 2000 年将其关闭，并把生产迁往多米尼加共和国。这个名字偶尔重现，像是对金斯敦昔日模样的一段记忆。'
 WHERE `name` = 'Temple Hall' AND SHA1(TRIM(`history`)) = '2b3d651271afe2a0d7e05d21f9e2ed79abdfa9a4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Temple Hall' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '2b3d651271afe2a0d7e05d21f9e2ed79abdfa9a4';
-- brands|The Griffin's|history|zh — 品牌人名拉丁化，规避禁字
UPDATE `brands` SET `history_zh` = 'The Griffin''s 的名字来自日内瓦的一家夜总会，这大概是整份目录中来历极为离奇的一个。Bernard Grobet 于1964年开设了这家俱乐部，在那里接待国际客人；二十年后，他想要一支能在自己桌上奉客的雪茄，于是让人在多米尼加共和国为他制作。首支 Griffin''s 于1984年问世，原本只供俱乐部使用。

它受欢迎的程度远超预期。这支雪茄很快出现在瑞士的烟草店，1989年起又进入美国。Grobet 随后找到 Davidoff 的机构来负责出口，三年后把品牌卖给了他们——因此这家瑞士企业是后来才进入这段历史的，而不是像有时所写的那样参与了创制。

结果带着委托者的印记：一支沙龙雪茄，优雅、没有棱角，为陪伴谈话而非主导谈话而设。浅色茄衣，柔至中度，雪松、榛子与白花的气息。

在本图集中，它是极少数「出生证明」是一个夜晚而非一片烟田的雪茄之一。'
 WHERE `name` = 'The Griffin''s' AND SHA1(TRIM(`history`)) = 'e7221d6239e71a83035b335b792b6ccc14d02908';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'The Griffin''s' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'e7221d6239e71a83035b335b792b6ccc14d02908';
-- brands|Toscano|history|zh — 公司名应用拉丁字母
UPDATE `brands` SET `history_zh` = '这家老号自述：一场夏日雷雨浸透了存放在佛罗伦萨烟草工场里的一批肯塔基烟叶。人们没有把它丢弃，而是任其发酵，卷制后廉价出售。那股辛烈而带烟熏的味道竟找到了知音——本该是一笔损失，反倒成了一种做法。

由此诞生的雪茄与众不同：两端收尖，中段鼓起，按传统要先切成两半再抽。一支雪茄两个半截，两次短抽而非一次长吸——这习惯既出于节俭，也出于口味。

制造权直到二十世纪末仍属国家专卖。Manifatture Sigaro Toscano 于 2006 年接手，至今仍在卢卡与卡瓦德蒂雷尼以手工卷制高等级产品。'
 WHERE `name` = 'Toscano' AND SHA1(TRIM(`history`)) = 'cf17b50fd79dc83d8126ffc994cc54066e01e9e5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Toscano' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'cf17b50fd79dc83d8126ffc994cc54066e01e9e5';
-- brands|Total Flame|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Total Flame 是一家没有工厂的俄罗斯公司，本图集把它归入卷制之地：多米尼加共和国的 La Aurora 和尼加拉瓜的 Plasencia——本图集的两个词条。Maxim Privezentsev 与 Vladimir Roshchin 在莫斯科的一场雪茄晚会相识，发现彼此有两个共同的热爱：雪茄与摩托车；2010年他们去两家工厂调配配方，2011年骑摩托环游世界并记录下来。品牌随之而生，茄标带着摩托客的气息——Wild One、Spokes、Off The Rails、FTW。

一条 Dark Line、一条 Bright Line，公司称烟叶陈化六到八年，一条伊朗烟叶的线，以及自认的奇思。美国媒体在2010年代描写过它，当时它常参加 IPCPR；俄罗斯雪茄媒体2025年把它归入在国外制作的俄罗斯血统品牌。

这是本图集的第三个俄罗斯案例，也是唯一在俄罗斯没有工厂的：Siglo de Oro 和 Pogar 在本土卷制，Total Flame 在加勒比代工。卷制地规则做出裁断。'
 WHERE `name` = 'Total Flame' AND SHA1(TRIM(`history`)) = '6e6469b4d43040fcd02889334539f5ca3b35dc49';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Total Flame' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '6e6469b4d43040fcd02889334539f5ca3b35dc49';
-- brands|Trinidad USA|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Trinidad 家族于 1905 年在古巴创办 Trinidad y Hermanos。Diego Trinidad Jr. 1920 年接手，1958 年以 TTT Trinidad 之名注册公司；革命后企业被没收。

流亡之后，Trinidad 家族自 1968 年起委托坦帕的 Fuente 家族卷制非古巴版 Trinidad。约十年后 Fuente 家族迁址，生产随之停止。1997 年双方在多米尼加再度合作，同样为时不长。

家族将此事诉至美国法院，并于 2001 年取得在美国的销售权。2002 年，家族将品牌连同这些权利售予 Altadis U.S.A.。

这正是本品牌与 Cohiba USA、Partagás USA 的不同之处：后两者是 General Cigar 在禁运造成的空白中于美国注册的古巴名称。而此处，是原创家族先取回了自己的名字，然后才将其转让。

2003 年的产品目录——Coloniales、Fundadores、Reyes、Robusto Extra、Robusto T——全为多米尼加产。制造商如今已不再展示，但也未言明其已停产。'
 WHERE `name` = 'Trinidad USA' AND SHA1(TRIM(`history`)) = '580e3b9165201bf9eb7bb34126fc842227c5cb96';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Trinidad USA' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '580e3b9165201bf9eb7bb34126fc842227c5cb96';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Umnum' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'da3b5612dd2a1710f0a371f0a15d9f2c19a214a9';
-- brands|Valentino Siesto|history|zh — maître = 调配大师，非首席
UPDATE `brands` SET `history_zh` = '据humolatino.com介绍，1967年出生的意大利企业家Valentino Siesto于1997年抵达多米尼加共和国，本欲开设珠宝店，却由此发现了雪茄；该网站将2005年与圣地亚哥-德洛斯卡瓦列罗斯一家工厂的首次合作、以及2018年其品牌的正式商业推出作为时间节点。据valentinosiestocigars.com介绍，该厂则将2014年定为其在坦博里尔自有工厂起步之年，2019年定为涵盖多种规格生产之年；Cigar Coop证实Tabacalera El Hoyito自2014年起即已生产。据humolatino.com介绍，参与此事业的Juan Gomez是该厂的调配大师（ligador），拥有四十年经验。

据Tributary Cigars介绍，坦博里尔的Tabacalera El Hoyito可追溯至1960年代中期Marcelo Gómez的手工制作；其子女于1978年在此创办家族事业，并于2011年正式注册为公司——Tabacalera El Hoyito S.R.L.。

截至2026年9月，产品目录共有两条常规系列与一款限定版。Premium Series采用墨西哥产San Andrés Maduro茄衣，茄套为多米尼加烟叶，茄芯为Criollo ''98，力度浓郁，规格为Robusto；据klarocigars.com介绍，编号为67的版本专供美国市场。据Cigar Coop介绍，Black Series分为Nero Black（茄衣为Connecticut或厄瓜多尔产Sun Grown，茄芯为多米尼加烟叶，规格有Toro和Robusto）与Yellow Black（茄芯全部为多米尼加烟叶，规格为46 x 6）两款。该厂于2025年4月推出首款专供PCA贸易展的限定版，为一款采用Connecticut茄衣的Robusto。'
 WHERE `name` = 'Valentino Siesto' AND SHA1(TRIM(`history`)) = 'a310b52371a297a717ff899da79a1e40a641cf09';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Valentino Siesto' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'a310b52371a297a717ff899da79a1e40a641cf09';
-- brands|Vallejuelo|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Vallejuelo是一个创立于2008年的品牌，据厂方介绍，是应一家瑞士经销商的要求、为该市场而创立的。其名意为小山谷。品牌归荷兰人Maurice Antonius Koks所有，据厂方介绍他本人也是调配师，产品在圣地亚哥省坦博里尔拉帕尔马自由区的Intercigar S.A.手工卷制。

厂方共有两款配方。Classic Vallejuelo于2008年推出，将厄瓜多尔Habano rosado茄衣与多米尼加和尼加拉瓜茄芯搭配，外覆尼加拉瓜茄套；有多种规格——Robusto、Robusto Gordo、Gran Toro、Gordo——二十支装。Vallejuelo Medio Tiempo据厂方介绍力度更强，采用medio tiempo烟叶，茄衣为墨西哥圣安德烈斯，十八支装。2022年9月，一场大火烧毁了Intercigar在坦博里尔与Tabacalera William Ventura共用的厂房。截至2026年9月查阅，Intercigar网站仍将两款Vallejuelo列在其品牌之中；火灾之后产品在何处卷制，查阅的资料均未说明。'
 WHERE `name` = 'Vallejuelo' AND SHA1(TRIM(`history`)) = '6185639ba749a3d779b100e51cfeceb95315daa8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vallejuelo' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '6185639ba749a3d779b100e51cfeceb95315daa8';
-- brands|Van der Donk|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Van der Donk 是荷兰仅存的仍手工制作雪茄的工厂——一篇手绘报道这样介绍它，词条首先记下这一点。它1919年在库伦堡以 Sigarenfabriek Havana 之名诞生，由 A.W. Smits 创立；一个十四岁的男孩 J. van der Donk 来此打工，1960年代接手，1970年代冠上自己的名字。其子 Richard，第三代，如今与妻子 Gerda 在赞德街经营，周围是让人以为置身博物馆、却全都还在用的老机器。

手艺是荷兰雪茄的手艺：古巴、巴西和印尼的烟叶，手工去梗；茄套手工放入 Richard 脚踏的机器；茄衣——价格居首的叶子，平整送达——手工上。词条把这种分工写得精确，因为本图集的界线在手与机器之间，而这里主要靠手。九种规格，或长或短、或粗或细，在全国约四十家店铺出售。

没有接班人：Richard 和 Gerda 停手之日，公司便告终。本图集为这家工厂把荷兰开辟为卷制之地，而且赶在它关门之前。'
 WHERE `name` = 'Van der Donk' AND SHA1(TRIM(`history`)) = '2016bf35d724deef292b9c9ed8a00ed558826473';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Van der Donk' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '2016bf35d724deef292b9c9ed8a00ed558826473';
-- brands|Vargas|history|zh — 品牌名改拉丁字母
UPDATE `brands` SET `history_zh` = '在拉帕尔马，卷制雪茄的历史之久，以至于本地词「palmero」既指这种雪茄，也指岛上的居民。烟叶生长在火山土壤上，气候里有恒定的信风，加工则在家庭作坊而非工厂中完成。

Vargas 是这些作坊中尤为知名的一家。它以自家姓氏卷制，并大量使用拉帕尔马本地烟叶——这很少见：多数所谓的加那利雪茄用的是从美洲进口的烟叶。

这一来历解释了它的味道。palmero 干爽、带草本气、略显粗犷，力度中等，燃烧干脆。它不试图去像哈瓦那雪茄，也从来没有这种野心；这是一支海岛风土的雪茄，与其说出口，不如说就在当地抽掉。

在一部由加勒比与中美洲主导的图册里，这是欧洲少数几个「种植与卷制发生在同一地点」的地方之一。'
 WHERE `name` = 'Vargas' AND SHA1(TRIM(`history`)) = '6cd558e22b5d1f6523a31d0beba47753bbb10453';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vargas' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '6cd558e22b5d1f6523a31d0beba47753bbb10453';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'VegaFina' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '3c1af15483c42a2dc319dc542e5aabeb88d759b4';
-- brands|Vegas de Santiago|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = '哥斯达黎加素被视为一个有作坊而少田地的国家：Selected Tobacco 在此卷制来自别处的烟叶，Casdagli 亦然。Vegas de Santiago 公司写道，自己种植一部分烟叶，其余进口。

该公司写道，旗下各家族在圣何塞西南火山群山中的圣地亚哥-德普里斯卡尔种植烟草已逾八十年（据 Zechbauer 称，海拔一千一百米以上），且在这一海拔高度上无须农药。La Nación 在2011年写道，普里斯卡尔的烟草生产止于1997-1998年度的收获，作坊的原料从秘鲁、厄瓜多尔和尼加拉瓜运来，仅15%购自 Pérez Zeledón。

创立者有两种说法：Marc Niehaus 一人创立，据其德国经销商 Casagranda 所写；Niehaus 与 Guzmán 两个家族共同创立，据瑞典零售商 Cigarrspecialisten 所写。该公司没有点出创始人，而将 Marc Niehaus 介绍为合伙人兼国际销售负责人。Casagranda 把家族工厂 Tabacos de Costa Rica 追溯到1997年；vdg-cigars.com 上发表的一篇对 Marc Niehaus 的访谈把工厂的开业定在1998年；所引资料均未给出该品牌的年份。

它做自己的系列——Chaman、Reserva、Don Luis、Secretos del Maestro、El Puro——作坊也为别人卷制，其中包括慕尼黑公司的 Zechbauer Royales。Chaman 是它的一个系列。

作坊以 Tabacos de Costa Rica S.A. 之名经营：La Nación 在2011年称 Olman León 为工厂业主，Cigar Coop 在2019年称 Andrés León 为业主兼经营者。Zechbauer 称 Olman León Guzmán 为厂长；Casdagli 称他为调配大师，并写道与「Tabacos de Costa Rica S.A.，当时名为 Vegas Santiago」的合作始于2012年。Villa Casdagli 系列就在这里卷制。

本图集的另一些品牌出自同一作坊：Selected Tobacco（Atabey、Bandolero、Byron）与 Bombay Tobak，据 Cigar Coop 所述；Malekö 与 Skull 77，据一些零售商所称由 Tabacos de Costa Rica S.A. 制造。'
 WHERE `name` = 'Vegas de Santiago' AND SHA1(TRIM(`history`)) = '87fde15c8575285065efb1e688db73100fd82989';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vegas de Santiago' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '87fde15c8575285065efb1e688db73100fd82989';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Viaje' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '025f5f6e476f3b9c1250d0254a5611d018717b18';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Villa Vieja' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'b98b1ba135ebf703bbcc4a83cff080bbdbbc31cb';
-- brands|Villiger Söhne|history|zh — 重复段落；人名拉丁字母
UPDATE `brands` SET `history_zh` = '1888 年，二十八岁的商人 Jean Villiger 在自己位于普费菲孔的家中创办了一家雪茄厂。他于 1902 年早逝，由妻子 Louise Villiger 支撑起这家企业。1907 年，她推出 Villiger Kiel——首支带鹅毛烟嘴的雪茄。

1918 年，Hans 与 Max Villiger 接手，并为公司定名 Villiger Söhne。企业至今仍由家族第四、第五代经营；第三代的 Heinrich Villiger 担任董事长直至九十五岁辞世。

公司年产雪茄与小雪茄约十亿支，雇员一千二百余人，公布销售额约一亿四千万瑞士法郎。本图集收录其 Villiger 品牌，归于尼加拉瓜——其高级雪茄的卷制地。

这份名单缺了一家工厂，印尼媒体点了它的名：Villiger 在东爪哇任抹有一座工厂——PT Villiger Tobacco Indonesia，在阿戎——就在 Besuki Na-Oogst 烟叶之城，当地也有两家设有条目的公司在卷制：BIN 和 Golden Djawa。任抹为瑞士卷制已久，只是无人用英语写下。'
 WHERE `name` = 'Villiger Söhne' AND SHA1(TRIM(`history`)) = '64e157bfc609d37e27f5b006d1358bb600bd1b6d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Villiger Söhne' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '64e157bfc609d37e27f5b006d1358bb600bd1b6d';
-- brands|Wangguan|history|zh — 品牌名改拉丁字母
UPDATE `brands` SET `history_zh` = '王冠是安徽中烟的雪茄，在皖北的蒙城卷制，那座自称庄子故里的城市。中国有四大雪茄产地，每省一家专卖：四川什邡的 Great Wall——本图集载有其词条；湖北宜昌；山东济南；以及蒙城，中国雪茄媒体称之为中式手卷雪茄的代表之一。

公司的传说追溯到1896年：晚清重臣李鸿章据说从欧洲带回各国王室所赠雪茄，得知蒙城手工卷烟作坊甚多，遂责成定制——「徽派雪茄」据说风靡上海租界。本图集把这段叙述归于讲述者。有确切年份的更近：1978年后经国务院批准建立的雪茄烟厂，隶属蚌埠卷烟厂；1997年与一家多米尼加公司合作生产全叶卷王冠，令中式工艺全面升级。

继 Great Wall 之后，这是本图集第二个中国词条，也是第二个只有中文来源的词条。词条如实说明，不设田地与品种。'
 WHERE `name` = 'Wangguan' AND SHA1(TRIM(`history`)) = '17bfb58d91226fcf83bb326b2783340780186da1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Wangguan' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '17bfb58d91226fcf83bb326b2783340780186da1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Warfighter Tobacco' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '6e86b2cb8c90ba20e50f3bc99b4e1d3228673f9c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'West Tampa' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'abc8e0144765e424d9a7d3ff4ce4c2b9f6ca2efc';
-- brands|Wolf & Ruhland|history|zh — 人名拉丁字母
UPDATE `brands` SET `history_zh` = 'Wolf & Ruhland 于1909年由曼海姆商人 Hermann Wolf 与其嫂 Käthe Ruhland 在慕尼黑创立；慕尼黑工厂生意兴隆，1917年他们寻找第二个厂址，经朋友 Karl Hilz 介绍，落在巴伐利亚森林的村庄佩尔莱斯罗伊特，雇了一百七十人——村里人称老板「沃尔夫老爹」。艰难岁月里由 Karl Hilz 接手；其子 Hermann 靠一个加油站和一家修车行撑住；他的孙女 Cornelia Stix 自他2006年去世起以第三代身份执掌，十名员工。

她说，这是巴伐利亚仅存的仍手工卷制雪茄的工坊。只有一台机器辅助；某些款式由女工在脚踏装置上手工成型茄芯，茄衣手工上——词条说得精确，因为本图集划的界线在手与机器之间。烟叶来自爪哇、苏门答腊和墨西哥；配方有些可追溯到 Karl Hilz，由老板的儿子 Martin 掌管，不加香精香料。细长的 Virginia 是公司的标志；尺寸居首的 Toccata Torpedo 茄标由手写。

一家百年、三代的乡村工厂，没有行业媒体：来源是一份地区杂志。本图集保留它，因为它在卷制，而且自1909年起就在卷。'
 WHERE `name` = 'Wolf & Ruhland' AND SHA1(TRIM(`history`)) = '79c5c5f1200ad83399965da3e0b01ef77fd5dc8c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Wolf & Ruhland' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '79c5c5f1200ad83399965da3e0b01ef77fd5dc8c';
-- brands|Wolfertz|history|zh — 城市名未翻译
UPDATE `brands` SET `history_zh` = 'Wolfertz GmbH是一家总部位于德国索林根的雪茄贸易公司，其渊源可追溯至一家自1919年起经营的刀具商行；自1999年起，该公司在Thorsten Wolfertz的领导下开始进口雪茄，据其接受StarkeZigarren采访时所说。

2019年，公司推出首条自有产品线Aventura，在洪都拉斯丹利的Raíces Cubanas工厂卷制，该厂由Hugo Cesar主理；据Wolfertz介绍，该配方是与Alec Bradley的master blender Ralph Montero共同研发而成。公司此前还推出过第二条自有产品线Barrio Viejo：该产品线连同Wolfertz的全部雪茄业务、Xikar配件业务及烈酒业务，于2023年1月1日一并出售给比利时集团VCF（Vandermarliere Cigar Family）旗下的德国子公司；Thorsten Wolfertz随后加入VCF，负责商业事务。如今Barrio Viejo仅以自己的名称单独销售，不再使用Wolfertz品牌。

据smokersplanet.de介绍，VCF由Fred Vandermarliere领导，此前已拥有Oliva（自2016年起），并刚收购了Wörmann Cigars，随后又将Wolfertz并入其德国经销体系。2026年，Cigarworld.de在Wolfertz名下仅销售Aventura这一条产品线。'
 WHERE `name` = 'Wolfertz' AND SHA1(TRIM(`history`)) = 'e55bb70ff90df722d08e0fb00c0cbf82022086f3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Wolfertz' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'e55bb70ff90df722d08e0fb00c0cbf82022086f3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Xhaxhi Bobi' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '7625e38a41de8de1749e09f214ae281e1df1b6af';
-- brands|Zigarren Manufaktur Dresden|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Zigarren Manufaktur Dresden 是一个古巴人的梦想：Lázaro Javier Herrera Cabrera，第三代卷工、在祖国担任烟叶质检员，想要自己的工坊，2015年在萨克森的德累斯顿开了它，创始团队里有 Katrin Lieberum。构想写于2013年；开业时发表的创业者肖像讲了其余的故事——排除烟草的公共补贴、让贷款复杂化的古巴国籍，以及无论如何要做的决心。

作坊像在古巴那样完全手工卷制长填充雪茄：整叶填充、雪松模具，卷工在访客眼前上茄衣，访客可以看他工作。烟叶为进口；属于萨克森的是手艺。本图集因此把这家公司归入德国，并在此把德国开辟为卷制之地——对一个主要以机制雪茄闻名的国家而言是头一回。

这是一家小公司，没有英语意义上的行业媒体；它的来源是德累斯顿的一份创业者刊物。词条止于该刊物所言。'
 WHERE `name` = 'Zigarren Manufaktur Dresden' AND SHA1(TRIM(`history`)) = 'd616f19e43a9073176b0e1aa9eda066606556545';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Zigarren Manufaktur Dresden' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'd616f19e43a9073176b0e1aa9eda066606556545';
-- brands|1502 Cigars|gamme|zh — 排序误译；超出法文
UPDATE `brands` SET `gamme_zh` = '[{"name":"1502 Emerald","color":"#2E6B4A","force":"Medium","story":"祖母绿——入门款，以颜色为标识。","vitolas":[],"wrapper":"未公开"},{"name":"1502 Ruby","color":"#8B1A1A","force":"Medium-Full","story":"红宝石。","vitolas":[],"wrapper":"未公开"},{"name":"1502 Black Gold","color":"#2E2E2E","force":"Full","story":"黑金——三者中力度居首的一款。","vitolas":[],"wrapper":"未公开"},{"name":"Cachitos","color":"#8B5A2B","force":null,"wrapper":"尼加拉瓜，Connecticut Shade","vitolas":[],"story":"Global Premium Cigars旗下产品线，Enrique Sánchez Icaza称其独立于1502品牌：petit-robusto规格，4½ x 50，茄衣产自尼加拉瓜，茄套产自洪都拉斯，于2018年在IPCPR上亮相，但cigarandspirits.com在2025年4月将其记为2019年。第二个版本采用Connecticut Shade茄衣（4 x 50），在Estelí的Barreda Cigars卷制，于2025年4月推出；2018年所提及的工厂为Plasencia。"}]'
 WHERE `name` = '1502 Cigars' AND SHA1(TRIM(`gamme`)) = 'aa9b943e36e45ade71f2c3b2af31bb81edfa3941';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = '1502 Cigars' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'aa9b943e36e45ade71f2c3b2af31bb81edfa3941';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = '262 Cigars' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '63cec9f34a17679df068880daca5e13106e5423f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = '7-20-4' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'a6bea161501ebdf5dfd75e6d50488fe74920064d';
-- brands|A.J. Fernandez|gamme|zh — 产品名与人名拉丁字母
UPDATE `brands` SET `gamme_zh` = '[{"name":"New World","color":"#5C4033","force":"Full","story":"让这家企业以自己名义为人所知的配方。深色墨西哥茄衣，烟雾厚实，带焦咖啡与黑胡椒气息——浓郁而不咄咄逼人，这正是这家企业的签名。","vitolas":["Robusto","Toro"],"wrapper":"San Andrés Maduro"},{"name":"Bellas Artes","color":"#8B6914","force":"Medium","story":"这家企业的中度之作，更干、更偏木质。适合觉得 New World 过于厚重的人，也证明力度从来不是重点。","vitolas":["Toro"],"wrapper":"Habano Rosado"},{"name":"Enclave","color":"#8B3A1E","force":"Medium-Full","story":"2016年——公司的一条线。","vitolas":[],"wrapper":"厄瓜多尔 Habano"},{"name":"Días de Gloria","color":"#4A3728","force":"Full","story":"2020年——光荣岁月：来自公司自家农场的尼加拉瓜纯料。","vitolas":[],"wrapper":"尼加拉瓜纯料"},{"name":"Sosa","color":"#6B4226","force":"Medium-Full","story":"Sosa 家族的品牌——Sosa Classic、Imperio Cubano——2016年12月买下，2017年1月起在尼加拉瓜卷制。此前出自 Arturo Fuente 的四号厂，Juan Sosa 自1997年起在那里调配。","vitolas":[],"wrapper":"未公开"},{"name":"San Lotano","color":"#8B5A2B","force":"Medium-Full","story":"据Wikipedia，该系列于2010年夏季重新推出，其名称据Fernández称取自其家族在革命前于古巴拥有的品牌。2022年10月，该品牌共有四条产品线——Requiem Habano、Requiem Connecticut、Requiem Maduro与The Bull——Cuenca Cigars将其力度划为从中等偏浓到浓郁。","vitolas":[],"wrapper":"Habano、Connecticut或Maduro"}]'
 WHERE `name` = 'A.J. Fernandez' AND SHA1(TRIM(`gamme`)) = '58f1955017893b3eb31960084040d0252087a726';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'A.J. Fernandez' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '58f1955017893b3eb31960084040d0252087a726';
-- brands|ADVentura|gamme|zh — superlatif à reformuler
UPDATE `brands` SET `gamme_zh` = '[{"name":"The Conqueror","color":"#7A2E1E","force":"Medium-Full","wrapper":"厄瓜多尔 Habano 2000","vitolas":[],"story":"厄瓜多尔苏门答腊茄套，多米尼加与尼加拉瓜填充。2019年进入美国的那条线。"},{"name":"The Explorer","color":"#5B3A29","force":"Medium","wrapper":"未公开","vitolas":[],"story":"探险者——与 The Navigator 同为首批两款。"},{"name":"Barbarroja''s Invasion","color":"#8B1A1A","force":"Full","wrapper":"未公开","vitolas":[],"story":"海盗巴巴罗萨。这家的调性。"}]'
 WHERE `name` = 'ADVentura' AND SHA1(TRIM(`gamme`)) = 'fb7eb6b5f6540fd6d310c329e6faa9ef94145706';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'ADVentura' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'fb7eb6b5f6540fd6d310c329e6faa9ef94145706';
-- brands|Aganorsa Leaf|gamme|zh — superlatif; date incohérente
UPDATE `brands` SET `gamme_zh` = '[{"name":"Aganorsa Leaf Original","color":"#7B3F00","force":"Full","story":"从茄芯到茄衣，百分之百自家烟叶。这就是这个品牌的全部主张：不经中间人，以全力度品尝哈拉帕的风土。","vitolas":["Robusto"],"wrapper":"Corojo 99"},{"name":"Signature Selection","color":"#A0522D","force":"Medium","story":"同样的烟叶，配方更收敛，烟叶的甜感走在力度之前。进入这家风格的理想入口。","vitolas":["Toro"],"wrapper":"Corojo 99"},{"name":"Condega","color":"#6B4226","force":"Medium","story":"2002年随 Tropical Tobacco 从佩德罗·马丁手中买下的品牌——一个介于埃斯特利与哈拉帕之间的城镇与产区之名。","vitolas":[],"wrapper":"尼加拉瓜纯料"},{"name":"Lunatic","color":"#A0522D","force":null,"story":"JFR的延伸系列，据两篇文章（2019年六月、2023年十一月）称于2015年问世。2026年十月，该公司官网展示Lunatic Torch：茄衣为Aganorsa的Corojo，刷状脚，据公司称力度为5级制中的3.5级，规格有Imagine（5 1/2 x 50）、Visionaries（6 1/2 x 52）、Dreamlands（6 1/2 x 60）与Mad Folk（4 3/4 x 70）；Maduro版本采用San Andrés茄衣，推出了一款在PCA 2023前宣布的10 x 100，而Loco perfecto可追溯至2019年。","vitolas":[],"wrapper":"Corojo Aganorsa、San Andrés"},{"name":"JFR","color":"#6B4226","force":null,"story":"名称是Just for Retailers的缩写；据2019年6月12日的一篇文章，该产品线自2011年起存在。2026年十月，该公司官网展示了两个采用该公司茄芯的版本：JFR Maduro，茄衣为产自墨西哥的San Andrés，据公司称力度为5级制中的4级，规格从Robusto到7 x 70的770 L.E.；以及JFR Connecticut，茄衣为产自厄瓜多尔的Connecticut，其中一款4 1/2 x 46的Junior于2024年四月亮相。","vitolas":[],"wrapper":"San Andrés、Connecticut"}]'
 WHERE `name` = 'Aganorsa Leaf' AND SHA1(TRIM(`gamme`)) = '0be46958362af728058d36960f3557d68e04b91f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Aganorsa Leaf' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '0be46958362af728058d36960f3557d68e04b91f';
-- brands|Aging Room|gamme|zh — superlatif; Cibao mal rendu
UPDATE `brands` SET `gamme_zh` = '[{"name":"Quattro","color":"#8B4513","force":"Medium-Full","story":"规格极为齐全的一条线，尺寸以音乐术语命名——Nodal 出身音乐科班。基本款为方压形制，这并不多见。","vitolas":["Maestro","Concerto","Espressivo"],"wrapper":"Habano"},{"name":"Small Batch","color":"#6B4226","force":"Full","story":"这家的小批量系列，以代号而非名称标示。正是这条线让品牌为人所知。","vitolas":["M356","F55"],"wrapper":"Habano"},{"name":"Bin No. 1","color":"#4A2C1A","force":"Medium-Full","story":"建立在 1999 与 2001 年从西瓦奥谷留存的烟叶之上。名字指的是陈化格——整个品牌的理念都在这个词里。","vitolas":["Bin No. 1"],"wrapper":"多米尼加"},{"name":"Pelo de Oro","color":"#A0522D","force":"Medium","story":"取自一个古老的古巴烟草品种之名，因难以栽培而长期被弃用。2016年推出，在尼加拉瓜的 A.J. Fernandez 卷制：茄衣为尼加拉瓜产的古巴种子烟叶，茄套为尼加拉瓜产，填充烟叶为尼加拉瓜产的 Pelo de Oro。","vitolas":["Rondo","Mezzo"],"wrapper":"尼加拉瓜产古巴种子"},{"name":"La Bohème","color":"#6B4226","force":"Medium-Full","story":"2014年在Boutique Blends推出，当时在Tabacalera Palma卷制；2025年一月以Aging Room La Bohème之名回归，采用A.J. Fernandez在尼加拉瓜制作的新拼配，2024年十二月被介绍为中等至浓郁。茄衣为杂交茄衣，由Broadleaf与Habano种子在Connecticut谷地种植而成，内包叶与茄芯均产自尼加拉瓜：四种规格以Puccini的歌剧命名，分别为Mimi（3 1/2 x 46）、Pittore（5 1/8 x 52）、Poeta（5 3/4 x 54）与Musico（6 1/4 x 60）。","vitolas":[],"wrapper":"Connecticut杂交种"}]'
 WHERE `name` = 'Aging Room' AND SHA1(TRIM(`gamme`)) = '2090f545d605732a18b4a58789c7ff6ef6d07ed7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Aging Room' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '2090f545d605732a18b4a58789c7ff6ef6d07ed7';
-- brands|Agrotabacos|gamme|zh — nom de personne en latin
UPDATE `brands` SET `gamme_zh` = '[{"name":"Omar Ortez Originals","color":"#6B4226","force":"Medium-Full","wrapper":"未公开","vitolas":[],"story":"创办人的牌子——连同 Maduro，占工厂产量的四成。"},{"name":"Casa de Ortez","color":"#8B5A2B","force":"Medium","wrapper":"未公开","vitolas":[],"story":"Indiana Ortez的牌子，2023年展会上以 La Malinche 亮相。"}]'
 WHERE `name` = 'Agrotabacos' AND SHA1(TRIM(`gamme`)) = 'a7f575f04349fd498fe949f3e4acda031147b221';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Agrotabacos' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'a7f575f04349fd498fe949f3e4acda031147b221';
-- brands|Aladino|gamme|zh — date mal formée 二月1日
UPDATE `brands` SET `gamme_zh` = '[{"name":"Aladino Corojo","color":"#8B4513","force":"Medium","story":"百分之百家族自种科罗霍：现代杂交品种出现之前的老种，难伺候且收益微薄。风味见干果、木质与皮革，带一缕现代品种已失去的细致酸度。","vitolas":["Corona","Robusto"],"wrapper":"纯正科罗霍"},{"name":"Aladino Maduro","color":"#3E2723","force":"Full","story":"2018 年推出。采用墨西哥圣安德烈斯马杜罗茄衣，是全系列中唯一并非产自家族土地的烟叶。茄套为洪都拉斯科罗霍，茄芯取自哈马斯特兰谷。可可、咖啡、雪松与黑胡椒。","vitolas":["Toro"],"wrapper":"圣安德烈斯（墨西哥）"},{"name":"Rancho Luna","color":"#8B5A2B","force":null,"wrapper":"Habano、Connecticut","vitolas":[],"story":"2015年七月与Aladino、Tatascan一同在CLE Cigar Company旗下亮相，随后自2016年2月1日起由JRE Tobacco接手，据cigar-coop.com称。2025年一月以Rancho Luna by Aladino之名重新推出，为二十支装的bundles：Red采用Habano茄衣，Blue采用Connecticut种子茄衣，规格为Toro 6 x 52，在Fábrica de Puros Aladino卷制；2026年十月，该公司官网提到的是Habano与Maduro茄衣，配纯正Corojo内包叶。"},{"name":"Tatascan","color":"#8B5A2B","force":null,"wrapper":"Habano、Connecticut Shade","vitolas":[],"story":"2015年七月与Aladino、Rancho Luna一同在CLE Cigar Company旗下展出，随后自2016年2月1日起由JRE Tobacco接手，据cigar-coop.com称；2016年八月，共有八种规格，从5 x 44到6 1/2 x 60，茄衣为Habano或Connecticut Shade，内包叶与茄芯为纯正Corojo。2026年十月，该公司将其介绍为日常雪茄，版本有Connecticut、Habano与Yellow（bundles装）；其标志上的帽子，据公司称，代表大老板，即el jefe。"}]'
 WHERE `name` = 'Aladino' AND SHA1(TRIM(`gamme`)) = 'fc4edef62edea293bea6333d2a9a5335ebf4ab43';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Aladino' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'fc4edef62edea293bea6333d2a9a5335ebf4ab43';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Alcazar' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'b69f5a94e97e2e193b9d47df8e10be6716b79423';
-- brands|Alec Bradley|gamme|zh — nom de personne en latin
UPDATE `brands` SET `gamme_zh` = '[{"name":"Prensado","color":"#8B2500","force":"Medium-Full","story":"2009年推出（行业媒体）。洪都拉斯茄衣，尼加拉瓜茄套，洪都拉斯与尼加拉瓜混合茄芯，在 Raíces Cubanas 卷制，公司如此表示（alecbradley.com，2026年10月），并称其为中等至浓郁的浓度。规格从 Robusto 5 x 50 到 Double Toro 6 x 62，其中包括 Torpedo 6 1/8 x 52，均为方压。","vitolas":["Torpedo","Robusto","Gordo","Double Toro","Corona Gorda"],"wrapper":"洪都拉斯（特罗赫斯）"},{"name":"Tempus","color":"#722F37","force":null,"story":"茄衣产自洪都拉斯的系列，据一家零售商称，围绕 Rubin 2001年在洪都拉斯一座小农场发现的一种 criollo 而诞生；其名称是拉丁语中的“时间”一词。推出时间为2007年（Cigars Direct、维基百科）或2009年（维基百科的产品列表）。2022年行业媒体提到有 Maduro 与 Nicaragua 两种变体。","vitolas":["Toro","Robusto","Churchill","Torpedo"],"wrapper":"洪都拉斯"},{"name":"Black Market","color":"#1F1F1F","force":"Medium-Full","story":"2011年在 IPCPR 上亮相（见过一则媒体标题）。尼加拉瓜茄衣，Sumatra 茄套，巴拿马与洪都拉斯茄芯，公司如此表示，并提到一批稀有的巴拿马烟叶和试过的十八种配方。据媒体，Filthy Hooligan 是其圣帕特里克节版本，2013年出现。","vitolas":[],"wrapper":"尼加拉瓜"},{"name":"Magic Toast","color":"#8B5A2B","force":"Medium-Full","story":"据媒体，2018年问世（10月，IPCPR 之后）。洪都拉斯茄衣，尼加拉瓜与洪都拉斯的茄套和茄芯，公司如此表示，并把名称与一个收获之夜和星空下的一次祝酒联系起来；媒体的说法则更像是 Rubin 与 Montero 在洪都拉斯一座农场里用 Glenfiddich 碰杯。","vitolas":[],"wrapper":"洪都拉斯"},{"name":"Project 40","color":"#3E4A6B","force":"Medium","story":"2019年5月全球发行。尼加拉瓜茄衣，巴西 Habano 茄套，尼加拉瓜茄芯，中等浓度，公司如此表示。名称源自这样一种看法：大约40%的幸福取决于我们的选择，这一论点被公司和媒体沿用；据媒体，2019年在埃斯特利的 J. Fuego 卷制。","vitolas":[],"wrapper":"尼加拉瓜"},{"name":"Kintsugi","color":"#C9A96E","force":"Medium","story":"据维基百科，隶属 Alec & Bradley，该品牌由 Rubin 的儿子们创立。2020年3月宣布，因疫情推迟；据行业媒体，首批交货在2020年12月初，另一家媒体则称2021年7月（说法有分歧）。来自特罗赫斯的洪都拉斯茄衣，洪都拉斯与尼加拉瓜的茄套和茄芯，中等浓度，公司如此表示。","vitolas":[],"wrapper":"洪都拉斯（特罗赫斯）"}]'
 WHERE `name` = 'Alec Bradley' AND SHA1(TRIM(`gamme`)) = '1ca7cccc0bb0913851b7adde06322f4ec7993f18';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Alec Bradley' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '1ca7cccc0bb0913851b7adde06322f4ec7993f18';
-- brands|Alfambra|gamme|zh — nom de personne en latin
UPDATE `brands` SET `gamme_zh` = '[{"name":"El Brujito","color":"#8B5A2B","force":null,"wrapper":"未公开","vitolas":[],"story":"品牌创立三年后推出的longfiller；Alejandro Mata透露已售出84万支。"},{"name":"Alfambra Boutique","color":"#8B5A2B","force":null,"wrapper":"未公开","vitolas":[],"story":"目录中的产品线，其中包括一款Gran Toro。"},{"name":"Alejandro Mata Colorado","color":"#A0522D","force":"Medium-Full","wrapper":"Colorado","vitolas":[],"story":"五种规格，从Amanecer到Alba，于Intertabac 2026展出，向创始人致敬。"},{"name":"Alejandro Mata Maduro","color":"#4A3728","force":"Medium-Full","wrapper":"Maduro","vitolas":[],"story":"三种规格，从Legado到Linaje，预计2027年3月进入国际市场。"}]'
 WHERE `name` = 'Alfambra' AND SHA1(TRIM(`gamme`)) = '391ad0dba43717f3156022016a22cfa934758710';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Alfambra' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '391ad0dba43717f3156022016a22cfa934758710';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Alhambra' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '65435dde17d23144b257e72bb018ec75120d69bd';
-- brands|All Saints Cigars|gamme|zh — ordinal à reformuler
UPDATE `brands` SET `gamme_zh` = '[{"name":"Solamente","color":"#4A3728","force":"Full","wrapper":"未公开","vitolas":[],"story":"首个成功之作——单一尺寸 5×58 的限量版。"},{"name":"Dedicación","color":"#6B4226","force":"Medium-Full","wrapper":"未公开","vitolas":[],"story":"首条常规线——创始人说是一份致敬。"},{"name":"Saint Francis","color":"#8B5A2B","force":"Medium","wrapper":"未公开","vitolas":[],"story":"阿西西的方济各——2021年，目录里的首位圣徒。"}]'
 WHERE `name` = 'All Saints Cigars' AND SHA1(TRIM(`gamme`)) = '1296c05cced38833d811de636e6bc6b55e098538';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'All Saints Cigars' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '1296c05cced38833d811de636e6bc6b55e098538';
-- brands|American Caribbean Cigars|gamme|zh — boîtes rendu par 箱
UPDATE `brands` SET `gamme_zh` = '[{"name":"The Bouncer","color":"#4A3728","force":null,"story":"墨西哥San Andrés茄衣与Sumatra茄套，搭配产自Estelí、Jalapa与Ometepe的尼加拉瓜茄芯，于2018年IPCPR展会推出，据cigarworld.de与halfwheel称。","vitolas":[],"wrapper":"San Andrés（墨西哥）"},{"name":"El Viejo Continente","color":"#A0522D","force":null,"story":"该系列诞生于Emiliano Lagos与巴塞罗那烟草专家Daniel Guerrero的相识，推出多种外观版本（Classic、Maduro、Edición Estelí），并无明确统一的茄衣，另有两条姊妹系列Mare Nostrum与The Circus，据Neptune Cigars称。","vitolas":[],"wrapper":"未公开"},{"name":"Maradona Tribute","color":"#A0522D","force":null,"story":"限量五百盒，以纪念Diego Maradona，茄芯为尼加拉瓜与洪都拉斯烟叶，厄瓜多尔茄衣之下衬有San Andrés茄套。","vitolas":[],"wrapper":"厄瓜多尔"},{"name":"The Traveler","color":"#A0522D","force":null,"story":"Emiliano Lagos的个人品牌，2017年先在欧洲、后在美国推出，雪茄规格以国际机场命名，分天然与maduro两个版本，据Cigar Coop称。","vitolas":[],"wrapper":"未公开"},{"name":"El Copey","color":"#C9A96E","force":null,"story":"唯一一条在尼加拉瓜境外卷制的系列：在多米尼加共和国手工制作，所查阅的资料均未指明工厂名称（cigarworld.de、hacico.de）；据cigarworld.de称，采用厄瓜多尔Connecticut茄衣，搭配多米尼加茄套与茄芯。","vitolas":[],"wrapper":"Connecticut（厄瓜多尔）"},{"name":"Bella Mundo","color":"#6B4226","force":null,"story":"被称为Cubra的巴西茄衣，Sumatra茄套，以及尼加拉瓜criollo茄芯，于2018年IPCPR展会推出，据Cigar Coop称。","vitolas":[],"wrapper":"巴西（Cubra）"},{"name":"La Rosa de Sandiego","color":"#6B4226","force":null,"wrapper":"Connecticut、Habano、Maduro","vitolas":[],"story":"上市时有三个版本，据2015年八月的一篇文章：来自厄瓜多尔的Connecticut（茄芯来自尼加拉瓜与宾夕法尼亚）、来自厄瓜多尔的Habano（Piloto Cubano、Ometepe、Estelí），以及采用San Andrés茄衣的Maduro（茄芯来自多米尼加共和国、Estelí与Jalapa），规格为Robusto 5 x 52、Toro Gordo 6 x 54与Immensio XO 6 x 60。名称向古巴的San Diego de los Baños致敬；据2018年八月的一篇文章，IPCPR 2018上展示了五种拼配。"}]'
 WHERE `name` = 'American Caribbean Cigars' AND SHA1(TRIM(`gamme`)) = '098b7332faa54be497b4c12b54e3ed13d9c6abdc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'American Caribbean Cigars' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '098b7332faa54be497b4c12b54e3ed13d9c6abdc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ann-Eks' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '736cf8d4ee4eb55680f64a84429a255673e305e9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Antonius' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'ad194098eb1d0a5ce65c6d34564250d0eab3f7d1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Arnold André' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '6a75b920842d3519e0c11f2daa562d0a1c46113e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Artista Cigars' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'a5526d67254bb8c716a4800f497d0e6c93799028';
-- brands|Arturo Fuente|gamme|zh — noms de personnes en latin; The Man
UPDATE `brands` SET `gamme_zh` = '[{"name":"Opus X","color":"#8B0000","force":"Full","story":"1995年11月18日上市，arturofuente.com 将其介绍为首支多米尼加 puro 雪茄，连茄衣在内。茄衣产自博瑙附近的 Château de la Fuente。这家字号清单所列形制：Robusto 5¼ x 50、Double Corona 7⅝ x 49、Reserva D''Chateau 7 x 48、PerfecXion X 6¼ x 48、PerfecXion No.2 6⅜ x 52、Fuente Fuente 5⅝ x 46。限量供应给少数几家零售商，Tobacconist of Greenwich 于 2025年7月写道。","vitolas":["Robusto","Double Corona","Reserva D''Chateau","PerfecXion X","PerfecXion No.2","Fuente Fuente"],"wrapper":"Château de la Fuente（多米尼加）"},{"name":"Don Carlos","color":"#A0522D","force":"Medium-Full","story":"取名自 Carlos Fuente Sr.，据 arturofuente.com 所述，该网站介绍的是在喀麦隆茄衣之下陈化长达十年的稀有烟叶。据 Carlos Fuente Jr. 所述，1976年售出的首支 Don Carlos 是在尼加拉瓜埃斯特利卷制的（2026年6月）。这家字号清单所列形制：Robusto 5 x 50、Double Robusto 5¾ x 52、Belicoso 5⅜ x 52、The Man 5¼ x 50、Presidente 6½ x 50、Personal Reserve Eye of the Shark 5¼ x 52。","vitolas":["Robusto","Double Robusto","Belicoso","The Man","Presidente","Personal Reserve Eye of the Shark"],"wrapper":"喀麦隆"},{"name":"Hemingway","color":"#8B4513","force":"Medium","story":"据 arturofuente.com，1981年推出，比 Fuente Ltd 开业晚一年；该页面把它的收尖形制说成当时业内的首创。Bespoke Unit 讲述，Carlos Fuente Sr. 在佛罗里达的一间仓库里找到了旧的 perfecto 模具，并把 Carlito 的调配时间定为 1983年，以此向这位美国作家致敬。喀麦隆茄衣，茄套与茄芯均为多米尼加产，据该网站强度为柔和至中等（2017年，2023年更新）。Masterpiece 9 x 52 是这家字号清单上长度居首的形制。","vitolas":["Classic","Short Story","Best Seller","Masterpiece","Signature"],"wrapper":"喀麦隆"},{"name":"Añejo","color":"#722F37","force":"Medium-Full","story":"据 Cigar Coop（2014年8月），2000年推出，共五种形制；No.77 Shark 约在 2002年随后推出。Cigar Coop 把它与 1998年的飓风乔治联系起来：据说 Carlos Fuente Jr. 担心 OpusX 的茄衣不够用，便给 OpusX 的调配裹上了 Connecticut Broadleaf。这家字号写道，马杜罗茄衣的叶片在干邑桶中陈化，并把 Shark（5⅞ x 48/64）介绍为首款由圆润 parejo 变为方形压制的鱼雷形雪茄。","vitolas":["No.46","No.48","No.50","No.55","No.60","No.77 Shark"],"wrapper":"Connecticut Broadleaf Maduro"},{"name":"Casa Cuba","color":"#8B5A2B","force":null,"story":"据Cigar Coop称，2013年末以限量配额形式面向零售商推出；arturofuente.com将其介绍为已故的Carlos Fuente Sr.的末款拼配，意在唤起他年轻时与父亲一起用古巴烟草卷制并吸食的雪茄。茄衣为厄瓜多尔Havana，内包叶与longfiller均产自多米尼加共和国，采用古巴种子，在Tabacalera A. Fuente y Cia卷制。规格以古巴多米诺骨牌的名称命名：Doble Dos 6¾ x 42、Doble Tres 5½ x 44、Doble Cinco 5 x 50、Doble Seis 6 x 52、Doble Cuatro 4½ x 54与Divine Inspiration 6⅛ x 47。力度在2014年被Cigar Coop称为medium，在末三分之一升至medium-full；2026年十月，一家零售商称其为medium-full。","vitolas":[],"wrapper":"厄瓜多尔Havana"},{"name":"Fuente Fuente OpusX The Lost City","color":"#A0522D","force":"Medium-Full","story":"OpusX的一个版本，烟草全部产自多米尼加共和国，于2004年夏天在Château de la Fuente种植，用于拍摄电影The Lost City（2005年上映，由Andy Garcia执导），随后醇化五年，据fuenteagedselection.com所述；该网站称其力度为medium至浓郁。在Tabacalera A. Fuente卷制；2024年六月的一则快讯把它归入交付给零售商的年度配额Aged Selection。规格：Robusto 5¼ x 50、Double Robusto 5¾ x 52、Toro 6¾ x 48、Lancero 7½ x 38与Carlito''s A 9¼ x 47。","vitolas":[],"wrapper":"多米尼加共和国"}]'
 WHERE `name` = 'Arturo Fuente' AND SHA1(TRIM(`gamme`)) = 'a8262138fa7b002a4beaa497626adc1a774f589c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Arturo Fuente' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'a8262138fa7b002a4beaa497626adc1a774f589c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Arturo Fuente Hemingway' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '0c030683b6a524daa5318c24c187b4a130bb217e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Arturo Fuente Maduro' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'de0d969c686b4b18d35c581dde67311828112fb6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Aruhiba' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '304403554b6f496c50c02902d3a0215c12c24cf6';
-- brands|Ashton|gamme|zh — marques latines; superlatif
UPDATE `brands` SET `gamme_zh` = '[{"name":"Ashton Classic","color":"#C9A96E","force":"Light-Medium","story":"创立之初的系列。康涅狄格阴植茄衣，包裹多米尼加配方，由 Fuente 卷制。奶油、香草、烘烤谷物。稳定、优雅、没有意外。Magnum（52 x 127 毫米）是需求量居首的规格。当你不清楚客人的口味时，递上的就是这一支 Ashton。","vitolas":["No.1","No.2","Magnum","Churchill","Cordial","Panetela"],"wrapper":"Connecticut Shade"},{"name":"VSG — Virgin Sun Grown","color":"#8B0000","force":"Full","story":"1999 年推出——另一个面貌的 Ashton。厄瓜多尔日光茄衣，包裹尼加拉瓜与多米尼加的配方。厚实浓郁：黑咖啡、巧克力、卡宴辣椒。VSG 揭示了这家老号在愿意时同样能拿出力度。","vitolas":["Torpedo","Robusto","Toro","Illuminado","Enchantment","Conquistador","Hero"],"wrapper":"厄瓜多尔日光种植"},{"name":"Cabinet Selection","color":"#A0522D","force":"Medium","story":"旗舰系列——卷好之后，还要在西班牙雪松木盒里多陈化十二到二十四个月。康涅狄格阴植茄衣。细化的榛子、山地蜂蜜、白雪松。复杂却不费力，这正是它想要成为的样子。","vitolas":["No.1","No.2","No.3","No.6","No.7","No.8","No.10"],"wrapper":"Connecticut Shade"},{"name":"San Cristobal","color":"#6B4226","force":null,"wrapper":"厄瓜多尔，视产品线而定","vitolas":[],"story":"2007年与José « Pepin » Garcia合作推出的尼加拉瓜产品线，由Garcia家族在Estelí的My Father工厂制作。Quintessence的茄衣为厄瓜多尔Habano Rosado，覆于尼加拉瓜longfiller之上，据Ashton Distributors称力度为medium-full，共六种规格；Golden Hour于2026年四月向零售商宣布，并在PCA上亮相，新增六种规格，茄衣为厄瓜多尔Habano，内包叶为尼加拉瓜产，茄芯来自Garcia农场，据Cigar Coop称。"}]'
 WHERE `name` = 'Ashton' AND SHA1(TRIM(`gamme`)) = '23d6ed6fbdb4486000e037af9cf5dc90af8dfb98';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ashton' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '23d6ed6fbdb4486000e037af9cf5dc90af8dfb98';
-- brands|Ashton Cabinet|gamme|zh — superlatif; Fuente mal placé
UPDATE `brands` SET `gamme_zh` = '[{"name":"Cabinet Selection","color":"#C9A96E","story":"陈化的厄瓜多尔 Connecticut Shade 茄衣，多米尼加烟叶在 Fuente 的雪松中陈放两年。精致榛果、山地蜂蜜与白雪松的气息。优雅的中度。每个编号（No.1 至 No.10）对应一种规格——这是 Ashton 中完整程度居首的一条产品线。","force":"Medium","wrapper":"厄瓜多尔 Connecticut Shade","vitolas":["No.1","No.2","No.3","No.6","No.7","No.8","No.10"]}]'
 WHERE `name` = 'Ashton Cabinet' AND SHA1(TRIM(`gamme`)) = 'f22d22e8a8cbabe1046377aa69d9321c397d6338';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ashton Cabinet' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'f22d22e8a8cbabe1046377aa69d9321c397d6338';
-- brands|Asylum|gamme|zh — terme erroné 尺寸径
UPDATE `brands` SET `gamme_zh` = '[{"name":"Asylum 13","color":"#4A2C1A","force":"Full","wrapper":"尼加拉瓜配方","vitolas":["Robusto","Toro","Sixty","Seventy","Eighty"],"story":"奠基系列，也是超大规格的那一条：规格以环径为名，一直到八十。于埃斯特利的 NACSA 卷制。"},{"name":"Asylum Insidious","color":"#6B4226","force":"Medium-Full","wrapper":"尼加拉瓜配方","vitolas":["Corona","Robusto","Toro"],"story":"目录中较为克制的一侧，采用经典尺寸。同一作坊，同样的价格取向。"},{"name":"Asylum Straight Jacket","color":"#3A2A20","force":"Full","wrapper":"尼加拉瓜配方","vitolas":["Robusto","Toro"],"story":"「约束衣」，字面如此。这家把自己的主题一路贯彻到名字里，正如 Black Label Trading 贯彻它自己的那套。"}]'
 WHERE `name` = 'Asylum' AND SHA1(TRIM(`gamme`)) = '161da9267b15ac5191ebabbc994359189e1d25af';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Asylum' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '161da9267b15ac5191ebabbc994359189e1d25af';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Atabey' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '4e152a442d9e274d3aeba04163d3987bfe12b224';
-- brands|Atatürk|gamme|zh — nom latin; terme 包套叶
UPDATE `brands` SET `gamme_zh` = '[{"name":"Atatürk 1923","color":"#A0522D","force":"Mild-Medium","wrapper":"Javano（印度尼西亚）","vitolas":[],"story":"完全产自印度尼西亚的puro，茄套为Besuki Na-Oogst，向Mustafa Kemal Atatürk致敬。"}]'
 WHERE `name` = 'Atatürk' AND SHA1(TRIM(`gamme`)) = '26557aa79d03e3ca064ba9339132cb0375c6122c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Atatürk' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '26557aa79d03e3ca064ba9339132cb0375c6122c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Avo' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'fc88fea23c721e9f512c8c64ce91a90a65f8c357';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Baccarat' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '117e0654c8ffb7f55a00bfbb6be9d8894f412869';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bahia' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '0bcdcf42a9109d0a1a9c64ddfd9c0a87743c17f3';
-- brands|Balmoral|gamme|zh — 人名改拉丁字母
UPDATE `brands` SET `gamme_zh` = '[{"name":"Añejo XO","color":"#6B4226","force":"Medium-Full","wrapper":"巴西日晒","vitolas":[],"story":"2015年7月——多米尼加 olor 茄套，巴西、多米尼加与尼加拉瓜填充。Rothschild Masivo、MK52、Petit Robusto FT。"},{"name":"Añejo 18","color":"#4A3728","force":"Medium","wrapper":"未公开","vitolas":[],"story":"2014年——Royal Agio 的首条优质线。"},{"name":"Serie Signaturas","color":"#8B5A2B","force":"Medium-Full","wrapper":"未公开","vitolas":[],"story":"与 Boris Wintermans 四手合作：Dueto（Ernesto Perez-Carrillo，2018）、Paso Doble（Litto Gomez，2019）。"}]'
 WHERE `name` = 'Balmoral' AND SHA1(TRIM(`gamme`)) = 'd6d96d8f34ff7dea9f0a87700290aa4151ff2070';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Balmoral' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'd6d96d8f34ff7dea9f0a87700290aa4151ff2070';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bandolero' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'c04c52588aadec93f6e52b9118e642aea7bad1af';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Baron Ullmann' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '4adf28696d8329d918c28613af47ca7f513ac358';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Barrio Viejo' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '35b00c811ba65e42528e995273f77b78de37d59b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bauza' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '6e54596cc5bf91da089aef8bb753ca270502ee56';
-- brands|Belmore|gamme|zh — Shade 误译浅色
UPDATE `brands` SET `gamme_zh` = '[{"name":"Belmore Connecticut","color":"#C9A96E","force":"Mild","wrapper":"康涅狄格阴植（美国）","vitolas":[],"story":"原名 Clasico，多米尼加与尼加拉瓜茄芯，经销商称其口感清淡。"},{"name":"Belmore Maduro","color":"#4A3728","force":null,"wrapper":"巴西马杜罗","vitolas":[],"story":"巴西茄衣，风味经销商称之为偏甜。"}]'
 WHERE `name` = 'Belmore' AND SHA1(TRIM(`gamme`)) = '18a82a34b6ae5f74f522d1ca1fac70408c56c943';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Belmore' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '18a82a34b6ae5f74f522d1ca1fac70408c56c943';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bering' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '72223a4bdb9580cb76a722cd40a355fedd098046';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'BerlinCigarMen' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '8318c45eae744237f9cce10970ea423a867f9005';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'BIN Cigar' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'fc06e3e18e4d792887a6f570266a228f79d701dc';
-- brands|Black Label Trading Co.|gamme|zh — 人名改拉丁字母
UPDATE `brands` SET `gamme_zh` = '[{"name":"Last Rites","color":"#2E2018","force":"Full","story":"「临终圣事」——奠基之作，也为这家的整套图像学定下了基调。浓烈，于 Oveja Negra 卷制。","vitolas":["Robusto","Toro","Petit Lancero"],"wrapper":"Oveja Negra 配方"},{"name":"Salvation","color":"#4A2C1A","force":"Medium-Full","story":"Last Rites 的对照款，属同一套礼拜语汇。烟叶来自尼加拉瓜、洪都拉斯、圣安德烈斯与厄瓜多尔。","vitolas":["Robusto","Toro"],"wrapper":"Oveja Negra 配方"},{"name":"Santa Muerte","color":"#3A2A20","force":"Full","story":"墨西哥民间信仰中的「圣死神」，由 James Brown 亲手绘制。这家把自己的图像学做到底，而非仅止于暗示。","vitolas":["Robusto","Toro"],"wrapper":"Oveja Negra 配方"},{"name":"Black Works Studio","color":"#1F1F1F","force":"Full","story":"James Brown 的第二个名字，2015年11月，同一家工厂——Oveja Negra——用于不那么正统的配方。NBK、Killer Bee 与 Rorschach 打头阵。","vitolas":[],"wrapper":"厄瓜多尔 Habano"}]'
 WHERE `name` = 'Black Label Trading Co.' AND SHA1(TRIM(`gamme`)) = 'b82bd152c8d0aba179f1abcc5850e879c1b7d49c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Black Label Trading Co.' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'b82bd152c8d0aba179f1abcc5850e879c1b7d49c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Blackbird Cigar Co.' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'aa4d518f7520e84a292044c4c90f6da0bf93af7d';
-- brands|Blanco Cigars|gamme|zh — 人名改拉丁字母
UPDATE `brands` SET `gamme_zh` = '[{"name":"Liga Exclusiva de Familia","color":"#6B4226","force":"Medium","wrapper":"康涅狄格阴植或宾夕法尼亚阔叶马杜罗","vitolas":[],"story":"兄弟俩昔日的私藏，两种性情——Cesar 的康涅狄格，David 的马杜罗。"},{"name":"Blanco Nine","color":"#4A3728","force":"Full","wrapper":"未公开","vitolas":[],"story":"爱好者知道的另一个名字。"}]'
 WHERE `name` = 'Blanco Cigars' AND SHA1(TRIM(`gamme`)) = '0bc11ff0b89f33b652b427249dc22ee6414075d4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Blanco Cigars' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '0bc11ff0b89f33b652b427249dc22ee6414075d4';
-- brands|Bock y Ca.|gamme|zh — douce误作甜美
UPDATE `brands` SET `gamme_zh` = '[{"name":"Bock y Ca.","color":"#A0522D","force":"Medium","wrapper":"未公开","vitolas":[],"story":"印尼茄套配多米尼加与尼加拉瓜茄芯，Villiger 称其柔和绵密。"},{"name":"Bock Renacimiento 25 Años","color":"#A0522D","force":null,"wrapper":"未公开","vitolas":[],"story":"为纪念2024年品牌复兴二十五周年推出的限量版，规格为 Toro Gordo（halfwheel）。"}]'
 WHERE `name` = 'Bock y Ca.' AND SHA1(TRIM(`gamme`)) = 'b08c58bf87c6266652c0821b45a973095c4cbcc8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bock y Ca.' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'b08c58bf87c6266652c0821b45a973095c4cbcc8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bohekio' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '3436508d76ccee5483c8643ae6a8cc6c792afea4';
-- brands|Bolivar|gamme|zh — 国名Cuba未译
UPDATE `brands` SET `gamme_zh` = '[{"name":"Belicosos Finos","color":"#8B0000","force":"Full","story":"金字塔形（vitola de galera Campana），52 × 140 毫米（5 1/2 英寸，环径 52），据维基百科的列表；Cigar Coop 在2020年为 Belicosos Finos Reserva Cosecha 2016 给出了相同的尺寸。Habanos 把该品牌归为“Fuerte”。","vitolas":["Belicosos Finos"],"wrapper":"古巴（Vuelta Abajo）"},{"name":"Royal Corona","color":"#722F37","force":"Full","story":"一支长 124 毫米、环径 50（4 7/8 英寸）的罗布图，据维基百科的列表和 Cigars Connect（2017年）；后者把它描述为大众化而不典型的罗布图。","vitolas":["Royal Corona"],"wrapper":"古巴（Vuelta Abajo）"},{"name":"Coronas Gigantes","color":"#4A235A","force":"Full","story":"规格为 47 × 178 毫米（vitola de galera Julieta No. 2，即 churchill），维基百科的列表称其为 Corona Gigante，Quill & Pad 称其为 Coronas Gigantes 或 Gigantes；后者2023年写道，它似乎已于2017年从目录中撤下。","vitolas":["Coronas Gigantes"],"wrapper":"古巴（Vuelta Abajo）"}]'
 WHERE `name` = 'Bolivar' AND SHA1(TRIM(`gamme`)) = '954d48b8c3dd900c27bad19b01f2e5c1acde3ed3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bolivar' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '954d48b8c3dd900c27bad19b01f2e5c1acde3ed3';
-- brands|Bolívar Honduras|gamme|zh — 人名改拉丁字母
UPDATE `brands` SET `gamme_zh` = '[{"name":"Cofradia","color":"#6B3A1F","wrapper":"厄瓜多尔苏门答腊种","story":"由 HATSA 各厂生产总监 Estelo Padrón 调配。美国康涅狄格宽叶茄套，洪都拉斯与尼加拉瓜茄芯。"}]'
 WHERE `name` = 'Bolívar Honduras' AND SHA1(TRIM(`gamme`)) = '5ab6628d7ca51a39dd9dd969080d8026e3662150';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bolívar Honduras' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '5ab6628d7ca51a39dd9dd969080d8026e3662150';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bombay Tobak' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '0d8ece5afb4dd0eae6c45b26d6fdf9d88844a9ca';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bongani' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '6763c9ad6159fa9fdb199c3d54001e216a9752ec';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Boutique Blends' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Brun del Ré' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '0e22d6492d03b82a6451e4e23c6b04dfe32e1c84';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bugatti' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'ff0bed0c03dc0a1472556ede52f6e8f3251475ee';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Burger Söhne' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Butera' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'fb206a3190c32d9d2138020dd6cd1c6241628b3c';
-- brands|Byron|gamme|zh — 品牌名改拉丁字母
UPDATE `brands` SET `gamme_zh` = '[{"name":"Byron Siglo XIX","color":"#6B4226","force":"Medium-Full","wrapper":"配方不公开","vitolas":["Toro"],"story":"指向十九世纪的系列。皮革、可可、名贵木材——Atabey 走蕾丝，它走开阔。"},{"name":"Byron Siglo XVIII","color":"#8B4513","force":"Medium","wrapper":"配方不公开","vitolas":["Corona Gorda"],"story":"更古老的调子，尺寸也更素净。产品线按时代组织，而这与味道同样是重点。"}]'
 WHERE `name` = 'Byron' AND SHA1(TRIM(`gamme`)) = '4f3ffb6e133b57ab1b51d34798c9d23b9f1a1507';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Byron' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '4f3ffb6e133b57ab1b51d34798c9d23b9f1a1507';
-- brands|Cabal Cigars|gamme|zh — 人名改拉丁字母
UPDATE `brands` SET `gamme_zh` = '[{"name":"Cabal","color":"#4A3728","force":"Medium-Full","wrapper":"博瑙（多米尼加）","vitolas":[],"story":"2013年——在 KBF 与 Hendrik Kelner Jr. 做了二十一次试验；博瑙茄衣，一种少见的多米尼加烟叶。"},{"name":"Esoteric","color":"#8B1A6B","force":"Medium","wrapper":"未公开","vitolas":[],"story":"试验中的第19号配方——与 Cabal 差异太大，作为小批量保留。"},{"name":"Initiative","color":"#C9A96E","force":"Medium","wrapper":"厄瓜多尔 Colorado corojo","vitolas":[],"story":"新品，在 Tabacalera La Isla 制作——一家零售商说是六年多来的首次新品。"}]'
 WHERE `name` = 'Cabal Cigars' AND SHA1(TRIM(`gamme`)) = '659ef3c6c9db38815ff162d0419302fb2fd34c73';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cabal Cigars' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '659ef3c6c9db38815ff162d0419302fb2fd34c73';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Caldwell Cigar Co.' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '139ed99825d633e77da6611d778543443db36e34';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Camacho' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '3040a58787329ed50046b0ed9ed630aab0430f16';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Canaritos' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '60fc652172b39c675e266fead15b841e5a5fa073';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Canned Heat' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'f59881db2c766ba7a2b93cd8ca0039ba9a2752f6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'a8df47cf21eb455a9e05a500340079acbd49b559';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO America' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'f470333905d574b434d123231d1867c42de784f3';
-- brands|CAO Black|gamme|zh — longfiller误作烟丝
UPDATE `brands` SET `gamme_zh` = '[{"name":"CAO Black","color":"#1C0A00","force":null,"story":"厄瓜多尔康涅狄格茄衣，尼加拉瓜茄套，长叶茄芯产自尼加拉瓜、洪都拉斯与墨西哥（cigarworld.com，cigarplace.biz，2026年10月）。规格名为 Frontier，Gothic，Bengal，Mosaic，Storm。切勿与 Black VR 混淆。","vitolas":["Robusto","Toro","Churchill","Torpedo"],"wrapper":"厄瓜多尔康涅狄格"}]'
 WHERE `name` = 'CAO Black' AND SHA1(TRIM(`gamme`)) = 'eeddeee9d337aea4295763deabe00909ef82309a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO Black' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'eeddeee9d337aea4295763deabe00909ef82309a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO Cameroon' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'bb3e1d05e6c465c6642baab2ce50c1301d9a1259';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Caoba' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'e7ca08c60c3c008fc63ad9f2ac6b0aa0d2485789';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Capadura' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'aa07b38bd1d898925c38fbb89d38011d178aa17f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Capitol' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '23819d777f5efbadae6bcca241a0fd9dc2523fd0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa 1910' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '1e236ca965f145eb13a3b8ed91d778cc312c9ba0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa Cuevas' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '355980d501c9adde5c6646a7c14b2bc0c04cc297';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa Culinaria' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'a7e0c078cb4d7e45094473c661376bda9445cf20';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa de Alegria' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '6e54615a9d51e45b15110073b746d274e44565bf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa de Garcia' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'ce2b5e67faaf6b88969f10b07c1cd25c7407f8cc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa de Torres' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'd14a9e590f62b73a9b86a373dc0bfc0c62913316';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa Turrent' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'b65bbc1c0deefb88440832ed69f10e4f7ba115b0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casagranda' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'eb7c216d9a6dc8f3ba025b4f20a75be9dcdc9105';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casdagli' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '9f21806a437f7aeacf3fc6baf7b67098076584d1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Castillo de Reyes' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'b2f0e19946f86c078c53ef236cba9b92b5a67e06';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cavalier Genève' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'b2230c7fc7cc69ebefdf912a550c2ba350bd96cd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Chaba' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '2029738699a27b9add62e79ee327ac5b5f6a416a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Charatan' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '45e5356be3fe6b071d90cda8d7ff5909d2e6eb5f';
-- brands|Chateau Diadem|gamme|zh — nom propre en latin
UPDATE `brands` SET `gamme_zh` = '[{"name":"Splendor","color":"#A0522D","force":null,"wrapper":"厄瓜多尔 Corojo","vitolas":[],"story":"由卷制师Eladio Díaz创制，配墨西哥圣安德烈斯茄套，自2024年起在欧洲销售，据 halfwheel 介绍。"},{"name":"Alisio","color":"#A0522D","force":"Mild-Medium","wrapper":"厄瓜多尔 Corojo","vitolas":[],"story":"定位为更轻淡、更平价的雪茄，得名于多米尼加的一种风。"},{"name":"Midnight Wonder","color":"#4A3728","force":"Full","wrapper":"康涅狄格宽叶","vitolas":[],"story":"围绕康涅狄格宽叶茄衣历时近三年调制而成的配方。"}]'
 WHERE `name` = 'Chateau Diadem' AND SHA1(TRIM(`gamme`)) = '103d6e5369984924ec2a31efe8dd5bf4d78a733f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Chateau Diadem' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '103d6e5369984924ec2a31efe8dd5bf4d78a733f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cházaro' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '8f9e3d1bc1e179f55fcfa35aaefe5890f2c8417a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Chinchalero' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'ff45743b9486ec7c9699c666c4fa93b646df2a98';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Chogüí' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '17d2f84ad1e68f50dcc25fe13b6cc22f4e6947f4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Chone' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '55ee8327b04cf89e499899a67701d227a69b630d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Christo' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'b7ae9182e7c41fe3c58f9e6d9dc2ea1ffab711b0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cigarkings' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '8387180b768fc31502efdaed24fc995534ae413c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CLE Cigar Company' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '11dc2dfc15ebbb2578384e79427671e8d2861971';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cohiba' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '8f686e13dfb430b8d908e6b7d3aa6012adf214e2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cohiba USA' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '9b786ec50bd17529ade08a8d256eccd155ecd9cf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Colpuros' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '65fbb0af435a4c9632e5cbba9ad41d58cace8001';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Compagnia Toscana Sigari' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'e0839d6b726c08bd55315f7522ecd0e5b3b71118';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cornelius & Anthony' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '7c360080c1b77256ec2b280c01f339b655473b06';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Corona Real' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '50dd550609f92dcdb5399a07c85254c9215dfbd6';
-- brands|Crowned Heads|gamme|zh — noms propres en latin
UPDATE `brands` SET `gamme_zh` = '[{"name":"Four Kicks","color":"#8B4513","force":"Medium-Full","wrapper":"厄瓜多尔哈瓦那种","vitolas":["Corona Gorda","Robusto"],"story":"奠基产品线，在埃斯特利的 My Father 卷制。浓郁、带胡椒、结构严谨——这是一家没有工厂、因而能自主挑选卷制者的企业眼中的尼加拉瓜风格。"},{"name":"Le Carême","color":"#4A3728","force":"Full","wrapper":"Connecticut Broadleaf","vitolas":["Toro"],"story":"与 Ernesto Perez-Carrillo 合作而生，并在他位于多米尼加共和国的工厂卷制。深色宽叶茄衣，可可与咖啡——与 Four Kicks 毫无关系，而这正是用意所在。"},{"name":"Headley Grange","color":"#8B5A2B","force":"Medium","wrapper":"厄瓜多尔苏门答腊","vitolas":[],"story":"2013年——Led Zeppelin录音的那座庄园；在 My Father 制作。"},{"name":"Jericho Hill","color":"#4A3728","force":"Medium-Full","wrapper":"圣安德烈斯（墨西哥）","vitolas":[],"story":"2014年——Johnny Cash 的一句歌词，圣安德烈斯茄衣；在 My Father 制作。"},{"name":"Las Calaveras","color":"#1F1F1F","force":"Full","wrapper":"未公开","vitolas":[],"story":"自2014年起的年度版，以茄标纪念当年逝者。"},{"name":"La Imperiosa","color":"#7A2E1E","force":"Medium-Full","wrapper":"厄瓜多尔 Habano","vitolas":[],"story":"2015年——从 Las Calaveras 派生的常规线；在 My Father 制作。"},{"name":"Mil Días","color":"#6B4226","force":"Medium","wrapper":"厄瓜多尔 Habano","vitolas":[],"story":"2020年——一千天的打磨，在 E.P. Carrillo 的 La Alianza 制作。"}]'
 WHERE `name` = 'Crowned Heads' AND SHA1(TRIM(`gamme`)) = '03eed12d7b068068e917239515fff329aee73070';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Crowned Heads' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '03eed12d7b068068e917239515fff329aee73070';
-- brands|Crux Cigars|gamme|zh — noms propres en latin
UPDATE `brands` SET `gamme_zh` = '[{"name":"Epicure","color":"#6B4226","force":"Medium","wrapper":"未公开","vitolas":[],"story":"核心系列，三种茄衣——自然、Habano、Maduro。"},{"name":"Bull & Bear","color":"#4A3728","force":"Medium-Full","wrapper":"未公开","vitolas":[],"story":"股市的牛与熊——在 Plasencia 卷制。"},{"name":"Guild","color":"#8B5A2B","force":"Full","wrapper":"未公开","vitolas":[],"story":"行会——由 Nestor Plasencia 把关。"}]'
 WHERE `name` = 'Crux Cigars' AND SHA1(TRIM(`gamme`)) = 'fe5131d7008c9501ee3e70a9d33cd42328266fa2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Crux Cigars' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'fe5131d7008c9501ee3e70a9d33cd42328266fa2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CSC' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '77c6459fdecb0409092602c9bdb8b0567695be43';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuaba' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '0136f5b71f5c4173a9e5d384cdc0b1a477880b67';
-- brands|Cuba Aliados|gamme|zh — ajout de sens (卷制)
UPDATE `brands` SET `gamme_zh` = '[{"name":"Original Blend","color":"#A0522D","force":"Medium","wrapper":"洪都拉斯（puro）","vitolas":[],"story":"茄套与茄芯均产自洪都拉斯，共五种规格，从Robusto到Churchill，于Fábrica de Puros Aladino卷制，据Cigar Coop介绍。"},{"name":"by Ernesto Perez-Carrillo","color":"#A0522D","force":"Medium","wrapper":"Sumatra（厄瓜多尔）","vitolas":[],"story":"茄套为尼加拉瓜烟叶，茄芯为尼加拉瓜与多米尼加烟叶，共五种规格，于Tabacalera La Alianza拼配，据Cigar Coop介绍。"}]'
 WHERE `name` = 'Cuba Aliados' AND SHA1(TRIM(`gamme`)) = 'b5563588c234e129d1fdba2292de412030f0742f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuba Aliados' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'b5563588c234e129d1fdba2292de412030f0742f';
-- brands|Cuban Crafters|gamme|zh — contresens cabinet, assagi
UPDATE `brands` SET `gamme_zh` = '[{"name":"Don Kiki Brown Label","color":"#5A3A22","force":"Medium-Full","wrapper":"尼加拉瓜 Habano","vitolas":["Robusto","Toro","Churchill"],"story":"带着创始人绰号的一条线。正是它让这家公司为迈阿密以外的人所知。"},{"name":"Cuban Crafters Cabinet","color":"#3E2723","force":"Full","wrapper":"尼加拉瓜配方","vitolas":["Robusto","Toro","Torpedo"],"story":"与其余产品一样在 Tabacalera Estelí 卷制。这家多用 cabinet 木盒而非平盒出售——沿袭 1960 年前古巴贸易的旧习。"},{"name":"Don Kiki Vintage","color":"#7B4B2A","force":"Medium","wrapper":"陈化茄衣","vitolas":["Robusto","Toro"],"story":"这家沉稳的一面，用卷制前存放更久的烟叶。"}]'
 WHERE `name` = 'Cuban Crafters' AND SHA1(TRIM(`gamme`)) = 'd8534ff05360ddf16379213dfe301a033169c1cf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuban Crafters' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'd8534ff05360ddf16379213dfe301a033169c1cf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuban Stock Cigar Co.' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '93a304f6df4395db2db3b04a36b52b1bc70bf126';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuervo y Sobrinos' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'addc692256600912fd1aa60236f561bc8b2428e3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuesta-Rey' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '9c93c642e2290bb15f861a191edb9de2594123aa';
-- brands|Curivari|gamme|zh — superlatif répandue affaibli
UPDATE `brands` SET `gamme_zh` = '[{"name":"Buenaventura","color":"#8B5A2B","force":"Medium","wrapper":"在尼加拉瓜种植的古巴种源","vitolas":["BV500","BV560","BV560 Torpedo"],"story":"早期系列之一，也是流传居首的一条。其尺寸以数据而非形制名称标示。"},{"name":"Selección Privada","color":"#A0522D","force":"Medium","wrapper":"在尼加拉瓜种植的古巴种源","vitolas":["Corona","Robusto"],"story":"目录中奶香与木质的一路。这家对古巴风味的追求，在这条线上听得极为直接。"},{"name":"Achilles","color":"#6B4226","force":"Medium-Full","wrapper":"在尼加拉瓜种植的古巴种源","vitolas":["Mirmidones","Gloriosos","Heroicos","Eternos"],"story":"希腊系列，尺寸名称取自《伊利亚特》。创办人是希腊人，终于把这一点写上了标环。"}]'
 WHERE `name` = 'Curivari' AND SHA1(TRIM(`gamme`)) = 'f81dc2aa2f5050c6bd00bf974f63518a9e470059';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Curivari' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'f81dc2aa2f5050c6bd00bf974f63518a9e470059';
-- brands|D'Crossier|gamme|zh — boîtes rendues par caisses
UPDATE `brands` SET `gamme_zh` = '[{"name":"Golden Blend","color":"#A0522D","force":null,"wrapper":"厄瓜多尔","vitolas":[],"story":"品牌首个系列，2007年于Diplomacy Series旗下推出；多米尼加茄套，哥斯达黎加与多米尼加茄芯；各方对其浓度描述不一，一家网站称其柔和，另一家则称视雪茄规格而定，浓度从中等到浓郁不等。其Reserva版本献给该品牌总裁之父Isaias Santana Crossier（1945-2020）。"},{"name":"Flor de D''Crossier","color":"#A0522D","force":"Medium","wrapper":"Habano（厄瓜多尔）","vitolas":[],"story":"其Selección 512系列于2017年开启了在多米尼加共和国ABAM厂的卷制；据专业媒体称，其浓度为中等，在较大规格中趋向浓郁。"},{"name":"Imperium Class Vintage","color":"#6B4226","force":"Medium-Full","wrapper":"Habano Criollo Especial","vitolas":[],"story":"哥斯达黎加茄衣，阳光种植；茄芯为厄瓜多尔、多米尼加与哥斯达黎加烟叶混合；据经销商称共有七种规格。"},{"name":"Presidential Collection","color":"#A0522D","force":null,"wrapper":"未公开","vitolas":[],"story":"Diplomacy Series旗下系列；其扩展系列Pennsylvania Avenue（2009年）采用哥斯达黎加Habano Criollo Especial茄衣及巴西与多米尼加茄芯，曾在哥斯达黎加的Pure Aroma Cigars S.A.卷制，随后在公司位于Hialeah Gardens（佛罗里达州）的仓库中陈化十九个月。"},{"name":"L''Forte","color":"#6B4226","force":"Full","wrapper":"哥斯达黎加","vitolas":[],"story":"于2014年IPCPR展会推出，多米尼加与尼加拉瓜茄芯；据经销商称口感浓郁，据Cigar Coop（2016年）称年产量为两千盒。"},{"name":"Premium Blend","color":"#C9A96E","force":"Mild","wrapper":"Connecticut（厄瓜多尔）","vitolas":[],"story":"茄衣细腻、色浅且丝滑，据经销商称其口感比L''Forte更为温和。"}]'
 WHERE `name` = 'D''Crossier' AND SHA1(TRIM(`gamme`)) = 'a86fa2c0252a6d65b414a3c043445ae3c2b163be';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'D''Crossier' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'a86fa2c0252a6d65b414a3c043445ae3c2b163be';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dalay' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '518188882242ca56f68670f4f92c4b7ee3f1c0cc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Daniel Marshall' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'b5d9b84215eb3aeed8e5011ab3cb5d033f4feb10';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dannemann' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '6c27c92c28b76239227f8b3357b11ad17dfa9641';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dapper' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '935323836ebb4abf0c4c49769e50fe52691761f3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Darier & Cleef' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'cb9e5633e34d801560584e6a92179cd5933249e8';
-- brands|Davidoff|gamme|zh — 人名拉丁字母；城市译名
UPDATE `brands` SET `gamme_zh` = '[{"name":"Signature","color":"#C9A96E","force":"Mild","story":"White Band Collection 系列中的一款。Signature 2000 是一款环径43、长12.9厘米的 corona，1976年出现在 Mille Series 中（zigarren.zone，2026年2月12日）；2026年是它的五十周年，有五种包装带有周年贴纸，据该公司称。关于这款 Signature 2000，该公司给出的烟叶来自多米尼加共和国和厄瓜多尔，并称其在自家五级量表上的强度为1.5；茄衣来自厄瓜多尔，茄套和茄芯来自多米尼加共和国，据 zigarren.zone（CigarSense 则写作厄瓜多尔杂交茄套）。于 Villa González（圣地亚哥）手工卷制，与1991年以来所有的 Davidoff 一样，据该公司称。Aniversario 是 White Band Collection 中另成一体的系列，于1986年为庆祝 Zino Davidoff 的80岁生日而推出。","vitolas":["Anniversario No.1","Anniversario No.2","2000","3000","4000","5000"],"wrapper":"厄瓜多尔"},{"name":"Winston Churchill","color":"#8B6914","force":"Medium-Full","story":"据该公司称，2008年5月在全球推出，此前该集团已于2007年取得以 Winston Churchill 之名生产、营销和销售雪茄的独家权利。共有两个系列：Original Series（强度4，按该公司的五级量表）与 Late Hour Series（强度4.5），后者于2017年6月12日发布，其中一种来自 Condega 的烟叶在苏格兰单一麦芽威士忌酒桶中陈放了约六个月（Cigar Dojo）。该公司称两个系列用到的烟叶来自墨西哥、多米尼加共和国、尼加拉瓜和厄瓜多尔；对于 Late Hour，Cigar Dojo 描述为厄瓜多尔 Habano 茄衣覆于墨西哥 Negro San Andrés 茄套之上。","vitolas":["Toro","Robusto","Churchill","The Original","The Late Hour","The Statesman"],"wrapper":"厄瓜多尔（Habano，Late Hour）"},{"name":"Nicaragua","color":"#8B2500","force":"Full","story":"2013年推出，使用黑色烟标，据该公司称，其条目注明 Davidoff 是品牌，而非地域。Box Pressed 版本于2016年2月宣布（Cigar Coop，2016年2月22日），采用尼加拉瓜 Habana Oscuro 茄衣、Habana Jalapa 茄套，茄芯来自 Ometepe、Condega 和 Estelí，并加强了 ligero 叶位；规格为 Robusto 5 x 48 和 Toro 6 x 52。该公司的商店将盒压的 Toro 描述为100%尼加拉瓜烟叶制成，按其五级量表强度为4.5。Cigar Coop 给出的卷制国为多米尼加共和国（Tabadom），该公司的年表与此相符（自1991年起，所有 Davidoff 均在 Villa González 卷制）。","vitolas":["Box Pressed Toro","Box Pressed Robusto","Box Pressed Torpedo"],"wrapper":"尼加拉瓜（Habana Oscuro）"},{"name":"Back2Back","color":"#C9A96E","force":"Mild-Medium","story":"接手 Room101 Big Payback：据 Cigar Coop（2018年7月27日），Back2Back 是其重生之作，Matt Booth 保留了 Room101 的名称，Davidoff 保留了拼配；纽约艺术家团队 UR NY（Fernando Romero 和 Mike Baca）在雪茄盒上署名。据 Cigar Coop，由 Davidoff 于2018年7月在 IPCPR 上推出；据 Corona Cigar Co. 和 Blind Man''s Puff（2020年7月17日），于2018年10月发售，两家都将其归为烟力轻至中等。共两个版本：Connecticut（厄瓜多尔 Connecticut Shade 茄衣，墨西哥茄套，多米尼加茄芯）与 Nicaragua（puro），规格为5 x 50、6 x 60和7 x 70。在洪都拉斯手工卷制，据 Cigar Coop（2018年）是在 Diadema Cigars de Honduras；Blind Man''s Puff（2020年）给出的工厂为 Tabadom。一款2019年限量版于2019年7月在 IPCPR 上亮相（Cigar Coop）。2026年10月，该系列未出现在 davidoff.com 的品牌页面上。","vitolas":[],"wrapper":"Connecticut Shade，Nicaragua"}]'
 WHERE `name` = 'Davidoff' AND SHA1(TRIM(`gamme`)) = 'ec5bef287fa3b4c7e56e5aa820e7a8c8eb384f02';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Davidoff' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'ec5bef287fa3b4c7e56e5aa820e7a8c8eb384f02';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'DBL' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '54c69fa70050c9bc5a1729682fc42602f6d00b00';
-- brands|De Los Reyes Cigars|gamme|zh — 人名拉丁；删老号
UPDATE `brands` SET `gamme_zh` = '[{"name":"Saga","color":"#6B4226","force":"Medium","story":"该公司的主要出口品牌。它分出若干系列——Golden Age、Blend No. 7、Short Tales——用的是 Leo Reyes 田里的烟叶。","vitolas":["Robusto","Toro","Corona","Lancero"],"wrapper":"多米尼加配方"},{"name":"Saga Blend No. 7","color":"#5A3A24","force":"Full","story":"Saga 中被人按名字搜寻得尤其多的一个系列。茄衣为家族农场的巴西烟叶，茄套是多米尼加 Habano，茄芯为多米尼加与中美洲烟叶，仅出三种尺寸。","vitolas":["Robusto","Perfecto","Toro Gordo"],"wrapper":"来自 Reyes 农场的巴西 Cobra 茄衣"},{"name":"Don Julio","color":"#7A4A2C","force":"Medium-Full","story":"一个人的名字：Don Julio Samuel Reyes Fermín，家族第三代种植者。全部使用家族在锡瓦奥河谷田里的多米尼加烟叶。两条线——Punta Espada（2014）与 Sang Bleu（2024），后者是十年来首款常规生产的新品。","vitolas":["Robusto","Toro","Churchill"],"wrapper":"锡瓦奥河谷的多米尼加烟叶"},{"name":"Augusto Reyes","color":"#8B5A2B","force":"Medium-Full","story":"创始人的名字，用在尤其贴近公司自有烟叶的那一系列。","vitolas":["Robusto","Toro","Churchill"],"wrapper":"多米尼加配方"},{"name":"Arsen","color":"#4A3728","force":"Medium","story":"在外构思，在此卷制。Arsen Gasparian 于2010年推出它——他曾出版俄文杂志《Hecho a Mano》——它使用纳瓦雷特农场的茄衣。","vitolas":["Robusto","Toro"],"wrapper":"纳瓦雷特茄衣"}]'
 WHERE `name` = 'De Los Reyes Cigars' AND SHA1(TRIM(`gamme`)) = 'eb9f9a4f922d823796ca42e1212c399e1606d381';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'De Los Reyes Cigars' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'eb9f9a4f922d823796ca42e1212c399e1606d381';
-- brands|Debonaire House|gamme|zh — 去除禁用字符
UPDATE `brands` SET `gamme_zh` = '[{"name":"Debonaire Habano","color":"#8B5A2B","force":"Medium-Full","wrapper":"Habano","vitolas":[],"story":"起初两种茄衣之一。"},{"name":"Debonaire Daybreak","color":"#C9A96E","force":"Medium","wrapper":"厄瓜多尔康涅狄格","vitolas":[],"story":"2018年的第五款配方，与 Drew Estate 联合分销。"},{"name":"Indian Motorcycle","color":"#7A2E1E","force":"Medium-Full","wrapper":"未公开","vitolas":[],"story":"公司的第二个品牌，获摩托车制造商授权。Habano 与 Maduro。"}]'
 WHERE `name` = 'Debonaire House' AND SHA1(TRIM(`gamme`)) = 'f810d0dba6d38196ea60ae6c9280e38b67cfc248';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Debonaire House' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'f810d0dba6d38196ea60ae6c9280e38b67cfc248';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Despot' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '86b353ed024492abaec96e33d67686bba0802697';
-- brands|Diamond Crown|gamme|zh — 去除禁用字符
UPDATE `brands` SET `gamme_zh` = '[{"name":"Diamond Crown Classic","color":"#C9A96E","force":"Light-Medium","wrapper":"康涅狄格阴植，陈化五年","vitolas":["No. 2","No. 3","No. 4","No. 5","No. 7","No. 9"],"story":"原初的系列，属于 1995 年百年纪念与统一 54 环径的那一条。茄衣为陈化五年后方才卷制的康涅狄格阴植叶，茄套为多米尼加，茄芯取自加勒比与中美洲五种烟叶。"},{"name":"Diamond Crown Maduro","color":"#4A2C1A","force":"Medium","wrapper":"康涅狄格宽叶","vitolas":["No. 3","No. 4","No. 5","No. 6"],"story":"同一支雪茄换上康涅狄格宽叶茄衣，浓度上升一档，却未推向浓烈。四个尺寸，编号全部沿用 Classic。"},{"name":"Diamond Crown Maximus","color":"#8B0000","force":"Full","wrapper":"厄瓜多尔 El Bajo，日照种植","vitolas":["Robusto","Toro","Double Corona","Torpedo"],"story":"浓烈的一侧，问世于二〇〇〇年代初。日照种植的厄瓜多尔 El Bajo 茄衣同样陈化五年，包裹多米尼加茄套与茄芯。"},{"name":"Diamond Crown Julius Caeser","color":"#722F37","force":"Medium-Full","wrapper":"厄瓜多尔，哈瓦那种源","vitolas":["Robusto","Toro","Pyramid","Hail Caeser"],"story":"2010 年推出，纪念创始人诞辰一百三十五周年与公司创立一百一十五周年。茄衣为哈瓦那种源的厄瓜多尔叶，茄芯来自多米尼加与中美洲；小批量手工卷制。"}]'
 WHERE `name` = 'Diamond Crown' AND SHA1(TRIM(`gamme`)) = '21abe816edff827b807123881840c890cd3c77ba';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Diamond Crown' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '21abe816edff827b807123881840c890cd3c77ba';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dios del Sol' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '94efe2922e3c8793a3dba18993cf77a09bd5c473';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Diplomáticos' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '85fc6235b246af0f139cb6261c9352e7162dc1ba';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Domaine de Lavalette' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '07337f91fd52b24e4eb5f2b9247ce6c2d59d3917';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Domenico' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'ee7f7ee0b92c6a74804c64c4b650ef710ac8603a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dominican Estates' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'd884cff233ccd0cbc707c60989c4991d79253b6c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Collins' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '459c745a052c975d94d32814b2109cd5594d3087';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Diego' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'dd5e3f125cfb8d21535bd7cd0d5387c7d46a65d2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Duarte' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '596f5f9b7cd51cf1b9cbbbb12ce5536919f8cb92';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Emmanuel' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '26ccc63dfb66d95a973dd844b25b9353ff186411';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Fidel' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '2850a1b1023284b0f293a52526f10c5be29c7d0b';
-- brands|Don Lucas|gamme|zh — 术语统一：茄芯
UPDATE `brands` SET `gamme_zh` = '[{"name":"Classic","color":"#C9A96E","force":"Mild-Medium","wrapper":"厄瓜多尔康涅狄格","vitolas":[],"story":"多米尼加茄套与茄芯；柔和的一线。"},{"name":"AL Series","color":"#3A2A1E","force":"Full","wrapper":"美国 broadleaf","vitolas":[],"story":"公司里浓烈的一线。"},{"name":"20th Anniversary","color":"#6B4226","force":"Medium-Full","wrapper":"多米尼加纯料","vitolas":[],"story":"纪念周年的多米尼加纯料——其年份与公司所说的1992年不符；词条如实说明。"}]'
 WHERE `name` = 'Don Lucas' AND SHA1(TRIM(`gamme`)) = '1c667901c515f0c5998688362b682cfd020716dc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Lucas' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '1c667901c515f0c5998688362b682cfd020716dc';
-- brands|Don Tomas|gamme|zh — 去除禁用字符
UPDATE `brands` SET `gamme_zh` = '[{"name":"Don Tomas Clasico","color":"#8B5A2B","force":"Medium","wrapper":"厄瓜多尔 Connecticut","vitolas":["Robusto","Toro","Churchill","Presidente"],"story":"流传尤其广的一条线，用的是九十年代重做的配方：哥伦比亚、多米尼加与巴西芯叶，配厄瓜多尔茄衣。"},{"name":"Don Tomas Sun Grown","color":"#6B4226","force":"Medium-Full","wrapper":"日光茄衣","vitolas":["Robusto","Toro","Corona"],"story":"厚重的一面，更接近品牌起步时的样子——那时它把 Talanga 与 Jalapa 配在一起。"},{"name":"Don Tomas Maduro","color":"#3E2723","force":"Medium-Full","wrapper":"Maduro","vitolas":["Robusto","Toro"],"story":"与其余产品一样在 HATSA 卷制，用长时间发酵的茄衣。丹利的工厂自 1975 年起从未停做这个品牌。"}]'
 WHERE `name` = 'Don Tomas' AND SHA1(TRIM(`gamme`)) = '682e07af79c684cff985077a6f2b5a16d01a41d5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Tomas' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '682e07af79c684cff985077a6f2b5a16d01a41d5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Zuarin' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '1815d40fcae330df5069954ba07f4d4062533eb0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dona Flor' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '0f0b0a76f2f350d35441e5faef635a2591c5d8df';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dos Amigos' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'c83a73545674abafc53ecfaf7d004dd0d5da82d5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dos Jotas' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '3de15ee0bc9843618f2a9d864d3d5f4a5aea9f04';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dos Santos' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '07633e884b5f58f6173212332d1419385ca60507';
-- brands|Drew Estate|gamme|zh — 人名拉丁；日期格式；束
UPDATE `brands` SET `gamme_zh` = '[{"name":"ACID Kuba Kuba","color":"#7B1FA2","force":"Medium","story":"该厂的加香系列；drewestate.com 的 ACID 页面（2026年10月）仅在图片说明中提到 Kuba Kuba，未详述茄衣或加香情况。据零售商称，这是一款 5 x 54 英寸（127 毫米，环径 54）的罗布图，茄衣为苏门答腊，茄套与茄芯来自尼加拉瓜，以草本和植物成分加香；据这些零售商，力度中等。","vitolas":["Kuba Kuba","Blondie","Dirty Rat","Deep Dish","Krush"],"wrapper":"苏门答腊（据零售商）"},{"name":"Liga Privada No.9","color":"#1C0A00","force":"Full","story":"Liga Privada 是该厂追溯到2007年的品牌；业内媒体把 No. 9 的首次亮相也放在同一年，茄衣为康涅狄格宽叶，配方取自四个国家。该厂在其页面上以浓缩咖啡与泥土来描述它。Flying Pig 是尖头的 Perfecto（2018年为 3 15/16 x 60 英寸），另有 T52 与 Undercrown 版本；业内媒体记载2018年的产量限于每个版本 2 500 盒，每盒 12 支。","vitolas":["Toro","Robusto","Flying Pig","Petit Lancero","No.9 Perfecto"],"wrapper":"Connecticut Broadleaf"},{"name":"Undercrown","color":"#8B4513","force":"Full","story":"据该厂称，2010年推出：Liga Privada 的需求之大，以至于卷制师被要求不要再抽它，工坊便创制了一种新配方，即今天的 Undercrown Maduro。业内媒体（2018年）指明，这款卷制师的雪茄使用了 Liga Privada 的茄套与茄芯。该厂列出 Maduro、Shade、UC 10 与 El Tigre Dominicano；茄衣因版本而异。","vitolas":["Toro","Robusto","Corona Viva","Flying Pig","Shade","Sun Grown"],"wrapper":"因版本而异"},{"name":"Herrera Estelí","color":"#8B5A2B","force":"Medium","story":"Willy Herrera 的雪茄——他是迈阿密 El Titan de Bronze 的调配师，2011年受聘——2013年初推出，配方在他首次造访埃斯特利时调成。","vitolas":[],"wrapper":"厄瓜多尔 Habano"},{"name":"Kentucky Fire Cured","color":"#3A2A1E","force":"Medium-Full","story":"像烟斗烟草那样用木柴烟熏干燥的肯塔基烟叶，卷进一支埃斯特利制作的雪茄。是一条线，不是一家公司。","vitolas":[],"wrapper":"烟熏干燥的肯塔基烟叶"},{"name":"Nica Rustica","color":"#3A2A1E","force":"Full","story":"2013年——公司说这是卷工给自己做的雪茄：broadleaf，粗犷，起初只有一种尺寸。","vitolas":[],"wrapper":"康涅狄格 broadleaf"},{"name":"Herrera Estelí Norteño","color":"#4A3728","force":"Full","story":"2015年——Herrera Estelí 的浓烈版，圣安德烈斯茄衣。","vitolas":[],"wrapper":"圣安德烈斯（墨西哥）"},{"name":"Ambrosia","color":"#C9A96E","force":"Medium","story":"浸渍型系列：据Corona Cigar Co.称，在洪都拉斯和尼加拉瓜的烟草上使用来自欧洲和东南亚的香料、葡萄酒和朗姆酒，另据CigarPlace称，浸渍四个月，随后在雪松木柜中陈化。2026年10月，Corona Cigar Co.列出该系列的七款（Kaya、Mother Earth、Nectar、Spice Torpedo、Spice Triple Corona、Vann Reef、Clove Tiki），茄衣为Connecticut Shade、Habano、Sumatra或Cameroun；Cigars Direct称Clove Tiki小雪茄为手工卷制；Drew Estate的在线目录未列出该系列。","vitolas":[],"wrapper":"未公开"},{"name":"Blackened","color":"#4A3728","force":null,"story":"Drew Estate、James Hetfield（Metallica）与Rob Dietrich（Blackened威士忌）的合作作品，据该公司称。M81据一篇媒体文章于2022年10月18日推出，搭配San Andrés maduro茄衣与Connecticut Broadleaf maduro茄套，有Corona、Robusto、Toro和Corona Doble规格；S84 Shade to Black据Corona Cigar Co.于2024年初推出，改用厄瓜多尔Connecticut Shade茄衣，drewestate.com于2026年10月展示这两款。","vitolas":[],"wrapper":"San Andrés，Connecticut Shade"},{"name":"Chateau Real","color":"#C9A96E","force":null,"story":"于2006年推出，当时该公司刚开始涉足非浸渍雪茄，后被放弃；2023年11月9日宣布回归，采用Connecticut Shade茄衣，配尼加拉瓜茄套和茄芯，面向Drew Diplomat网络的线上零售商。Drew Estate又为Cigars International添加了一款Habano（2024年8月），并为其DDDP账户添加了一款Maduro San Andrés（2024年11月1日），均在La Gran Fabrica卷制，规格为Robusto、Toro和Churchill；2026年10月，drewestate.com的产品页面未将其列入其产品系列。","vitolas":[],"wrapper":"Connecticut Shade"},{"name":"Factory Smokes","color":"#8B5A2B","force":null,"story":"雪茄以20或25支一束的形式出售：该公司于2018年6月29日发布新闻稿，并于2018年7月在IPCPR上亮相，共四款（Sweet配Habano茄衣、Maduro、Shade、Sun Grown），茄套和茄芯均来自印度尼西亚，在La Gran Fabrica卷制，规格为Robusto、Toro、Churchill和Gordito。2026年10月，drewestate.com展示该系列，含Maduro、Sweet、Shade和Sun Grown。","vitolas":[],"wrapper":"未公开"}]'
 WHERE `name` = 'Drew Estate' AND SHA1(TRIM(`gamme`)) = '665288b7ea1eb3e61396516f96a343212d130ee9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Drew Estate' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '665288b7ea1eb3e61396516f96a343212d130ee9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Drunk Chicken' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '5aafa5e64b019f3f3e91ab29210db3512563cf7e';
-- brands|Dunbarton Tobacco & Trust|gamme|zh — 人名拉丁；改首条
UPDATE `brands` SET `gamme_zh` = '[{"name":"Sobremesa","color":"#8B5A2B","force":"Medium-Full","wrapper":"厄瓜多尔 Habano","vitolas":["Robusto","Toro","Corona","Elegante"],"story":"2015 年问世的首条线。厄瓜多尔 Habano 茄衣，墨西哥圣安德烈斯茄套，尼加拉瓜茄芯并辅以宾夕法尼亚 ligero——这是少有品牌使用的一种烟叶。"},{"name":"Mi Querida","color":"#4A2C1A","force":"Full","wrapper":"康涅狄格宽叶","vitolas":["Fino Largo","Triqui Traca"],"story":"深色康涅狄格宽叶茄衣，内里全为尼加拉瓜烟叶。这条线在 NACSA 卷制，由 Raul Disla 主持。"},{"name":"Sin Compromiso","color":"#3A2A20","force":"Full","wrapper":"圣安德烈斯 Negro","vitolas":["Selección No. 5","Parejo No. 2"],"story":"在 Joya de Nicaragua 卷制。茄衣为称作「Cultivo Tonto」的圣安德烈斯 Negro，茄套为厄瓜多尔 Habano 薄 ligero，茄芯来自逐一挑选的尼加拉瓜种植园。"},{"name":"Todos Las Dias","color":"#6B4226","force":"Full","wrapper":"尼加拉瓜","vitolas":["Robusto","Toro"],"story":"这家的尼加拉瓜纯产雪茄——茄衣、茄套与茄芯同出一国——在 Joya de Nicaragua 卷制。名字道出意图：一支日常的雪茄，只是它的浓度并不日常。"},{"name":"Umbagog","color":"#3A2A1E","force":"Full","wrapper":"康涅狄格 broadleaf","vitolas":[],"story":"2017年——对 Mi Querida 而言过于粗犷的 broadleaf，另行卷制、售价更低；以新罕布什尔的一座湖命名。"},{"name":"Muestra de Saka","color":"#7A2E1E","force":"Medium-Full","wrapper":"未公开","vitolas":[],"story":"自2016年——Steve Saka 的试验系列，一次一款配方，小盒装。"}]'
 WHERE `name` = 'Dunbarton Tobacco & Trust' AND SHA1(TRIM(`gamme`)) = '90e9bd1b67175900a4324347840de6e7c4ee4ad4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dunbarton Tobacco & Trust' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '90e9bd1b67175900a4324347840de6e7c4ee4ad4';
-- brands|E.P. Carrillo|gamme|zh — 术语统一 Habano
UPDATE `brands` SET `gamme_zh` = '[{"name":"Encore","color":"#8B1A1A","force":"Full","wrapper":"厄瓜多尔 Habano","vitolas":["Robusto","Toro"],"story":"这个名字呼应一段重新开始的职业生涯。配方厚实而结构严谨，力度服务于结构，而非取代结构。"},{"name":"New Wave Connecticut","color":"#D2B48C","force":"Light","wrapper":"Connecticut Shade","vitolas":["Corona"],"story":"这家柔和的一面：浅色茄衣，清晨的调子，奶油与杏仁。证明一位以浓郁著称的调配师同样懂得收手。"}]'
 WHERE `name` = 'E.P. Carrillo' AND SHA1(TRIM(`gamme`)) = 'd03eb491af511d3707963ce4a0d047607b79aade';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'E.P. Carrillo' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'd03eb491af511d3707963ce4a0d047607b79aade';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Galan' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '00883d8a2d6bd874f7cfe2145b81ebde3462c87b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Gaucho' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '31d6bd4d2c635df594872d4c0e47adba837e7e99';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Mago' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '9b782210e7902f57bfd518d69903152c13478e25';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Rey del Mundo' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '0d3161d3f7c8a1550deba1591b276189f744fe01';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Rey del Mundo Honduras' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Septimo' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'e506f35e01fa9773e1e1dfcc948644983d09d6e8';
-- brands|El Titan de Bronze|gamme|zh — 笔误同一双手；术语 Habano
UPDATE `brands` SET `gamme_zh` = '[{"name":"Grand Reserve","color":"#7B3F00","force":"Full","wrapper":"厄瓜多尔 Habano","vitolas":["Robusto"],"story":"在第八街由受过古巴方法训练的卷制师手工卷成。浓郁、直率，具备只有小批量且严密看管才能带来的均匀。"},{"name":"Serie 1995","color":"#A0522D","force":"Medium","wrapper":"Connecticut Shade","vitolas":["Corona"],"story":"这家的中度之作，向其开业年份致敬。浅色茄衣，更柔和的风格，同一双手。"}]'
 WHERE `name` = 'El Titan de Bronze' AND SHA1(TRIM(`gamme`)) = 'f6eef082ee70dbe7a3ed278a0ad0d492d813ae8a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Titan de Bronze' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'f6eef082ee70dbe7a3ed278a0ad0d492d813ae8a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Eladio Diaz' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '3d7d017ce819e654c4a6e949deaf8f401517b702';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Emilio Cigars' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'e893168270dfd1ba6115af142e45794372e9c276';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Emperors Cut' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'bee5876a4f40f9b6e9a0726618dda92e8795e9b1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Epic Cigars' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '983b134f1d113e2b1adb3bfd324e5d4b85dd8f92';
-- brands|Espinosa|gamme|zh — 人名厂名改拉丁字母
UPDATE `brands` SET `gamme_zh` = '[{"name":"Laranja Reserva","color":"#B8663A","force":"Medium-Full","story":"巴西茄衣配尼加拉瓜茄芯——巴伊亚烟叶在巴西之外少见的成功之一。干果、胡椒，以及来自茄衣的一份酸度。","vitolas":["Toro"],"wrapper":"巴西茄衣"},{"name":"Espinosa Habano","color":"#8B4513","force":"Full","story":"不绕弯子的家族风格：浓郁、带胡椒、直率。在 La Zona 卷制——创始人为不再依赖他人而开设的工厂。","vitolas":["Robusto"],"wrapper":"尼加拉瓜 Habano"},{"name":"601","color":"#7A2E1E","force":"Full","story":"诞生于 EO Brands 时期的系列，与 Eddie Ortega 分道扬镳后由 Erik Espinosa 保留。","vitolas":[],"wrapper":"厄瓜多尔 Habano"}]'
 WHERE `name` = 'Espinosa' AND SHA1(TRIM(`gamme`)) = '1c2616888b24bf7632a518705a42fd3a9e4aab05';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Espinosa' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '1c2616888b24bf7632a518705a42fd3a9e4aab05';
-- brands|Esteban Carreras|gamme|zh — 术语统一 San Andrés
UPDATE `brands` SET `gamme_zh` = '[{"name":"Chupacabra","color":"#4A3728","force":"Full","wrapper":"尼加拉瓜；10 Años 用 San Andrés","vitolas":[],"story":"成就名声的系列——Natural、Maduro 与 10 Años，猪尾茄帽。"},{"name":"Cashmere","color":"#C9A96E","force":"Medium","wrapper":"未公开","vitolas":[],"story":"十三条线之一；公司说大多数是尼加拉瓜纯料。"}]'
 WHERE `name` = 'Esteban Carreras' AND SHA1(TRIM(`gamme`)) = '7e74c2e8c7a9fd6f8b75970345d5b36e4b45a805';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Esteban Carreras' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '7e74c2e8c7a9fd6f8b75970345d5b36e4b45a805';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Excalibur' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '486fd6b70a10cc540fecceaa2cb52e6a683ccbec';
-- brands|Ezra Zion|gamme|zh — 人名改拉丁字母
UPDATE `brands` SET `gamme_zh` = '[{"name":"Jamais Vu","color":"#5B3A29","force":"Medium-Full","wrapper":"尼加拉瓜纯料","vitolas":[],"story":"2012年7月以 Inception 之名诞生，后更名。起初三款纯料之一。"},{"name":"Honor Series","color":"#4A3728","force":"Full","wrapper":"未公开","vitolas":[],"story":"致敬人物的雪茄——先是 Reagan，后是 FHK。"},{"name":"Tantrum","color":"#7A2E1E","force":"Full","wrapper":"未公开","vitolas":[],"story":"起初三款纯料中的第三款。"}]'
 WHERE `name` = 'Ezra Zion' AND SHA1(TRIM(`gamme`)) = '4fb1ac5558bf1f0b92a40249226b7d75231bb05f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ezra Zion' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '4fb1ac5558bf1f0b92a40249226b7d75231bb05f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fable Cigars' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'e9b8cfa82c78c3d44be107da8b833d1572ea9399';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fábrica de Tabaco Estrela' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '9e36dc941d3892c084f02734e51a595d2ac1ca98';
-- brands|Ferio Tego|gamme|zh — 术语统一；避免禁用字
UPDATE `brands` SET `gamme_zh` = '[{"name":"Timeless — Prestige 与 Sterling","color":"#8B5A2B","force":"Medium-Full","wrapper":"Quesada 配方","vitolas":["Robusto","Toro","Corona"],"story":"这一系列的多米尼加一半，由 Quesada 家族在利塞伊的 Tabacos de Exportación 卷制。Timeless 本就是 Nat Sherman 的产品线：同样的配方，换了一条标环。"},{"name":"Timeless — Panamericana 与 Supreme","color":"#6B4226","force":"Full","wrapper":"Plasencia 配方","vitolas":["Robusto","Toro"],"story":"另一半，由 Plasencia 家族在埃斯特利卷制。同一系列由两个家族分处两国承担——这并不多见，而这家并不讳言。"},{"name":"Metropolitan","color":"#C9A96E","force":"Medium","wrapper":"依版本而定：Connecticut 或 maduro","vitolas":["Host","Connecticut","Maduro"],"story":"1990 年代中期由 Quesada 家族为 Nat Sherman 调配，至今仍由他们制作。这是目录中资历居首的一条线，已逾三十年。"}]'
 WHERE `name` = 'Ferio Tego' AND SHA1(TRIM(`gamme`)) = '53b64e80a657a246ee5c29229bd39054843a6a70';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ferio Tego' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '53b64e80a657a246ee5c29229bd39054843a6a70';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Finca Tabaquera El Sitio' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '8c006ac6b336565b2d5c23da27dba0d1f35e5570';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Firecracker' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '5abaf9c3b6a5e033638073b3d373ea3ff4a702d5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Flavoroute' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '5be37f3b5c2fb7d001a89f36af2b4c988ca27453';
-- brands|Flor de Selva|gamme|zh — 术语统一 Habano
UPDATE `brands` SET `gamme_zh` = '[{"name":"Flor de Selva Classique","color":"#8B7D6B","force":"Medium","wrapper":"洪都拉斯 Habano","vitolas":["Corona","Robusto"],"story":"这家的核心，为欧洲味蕾而作：干木、干草，一点皮革，以及逐年不变的稳定——这本身就是一门功夫。"},{"name":"Cumpay","color":"#5D4037","force":"Full","wrapper":"Habano Maduro","vitolas":["Toro"],"story":"浓郁的一面，更深、更带土味，让这家展示哈马斯特兰在力度上能给出什么。"}]'
 WHERE `name` = 'Flor de Selva' AND SHA1(TRIM(`gamme`)) = '872356a31af624eb520003dbbbe46c1ca60ab78e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Flor de Selva' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '872356a31af624eb520003dbbbe46c1ca60ab78e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Flor del Sol' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '8b581c92293917f9278e3294150f9bdf79eb6774';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fonseca' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '32a3cae0bb39c8d6aff4dda7c5212eecf99e172e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fonseca Nicaraguayen' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Forged Cigar Company' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fortis Cigars' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '0410c751aeb66935383bfd7cc3cb9bbd868cda69';
-- brands|Foundation Cigar Company|gamme|zh — Jalapa 误译；术语统一
UPDATE `brands` SET `gamme_zh` = '[{"name":"El Güegüense","color":"#8B4513","force":"Medium","story":"2015年的奠基配方，得名于一出口传数百年的殖民时期讽刺剧，当时在 TABSA 工厂卷制，该厂如今是 Aganorsa Leaf。2024年3月，Foundation 宣布停产 El Güegüense，连同此前的 Wise Man Maduro，改以两款新配方 The Wise Man Corojo 与 Maduro 取代，由 My Father Cigars 制作。它有木质、皮革，一丝红糖，从首段到末段有清晰的推进。","vitolas":["Corona Gorda","Toro"],"wrapper":"哈拉帕 Corojo 99"},{"name":"Charter Oak","color":"#3B2F2F","force":"Medium","story":"这家的北方之根：康涅狄格茄衣配尼加拉瓜茄芯。深色、带土味、不苦——并有意保持在可及的价位。","vitolas":["Robusto"],"wrapper":"Connecticut Broadleaf"},{"name":"The Tabernacle","color":"#3A2A1E","force":"Full","story":"2016年——浓烈的一线，broadleaf 茄衣，在 A.J. Fernández 制作。","vitolas":[],"wrapper":"康涅狄格 broadleaf"},{"name":"Highclere Castle","color":"#C9A96E","force":"Mild-Medium","story":"2017年——标环上的唐顿庄园城堡，厄瓜多尔 Connecticut 茄衣。","vitolas":[],"wrapper":"厄瓜多尔 Connecticut"},{"name":"Olmec","color":"#6B4226","force":"Medium-Full","story":"2022年 PCA——向墨西哥及其奥尔梅克人致敬，San Andrés 茄衣，Claro 与 Maduro。","vitolas":[],"wrapper":"San Andrés（墨西哥）"},{"name":"Aksum","color":"#8B5A2B","force":"Medium-Full","story":"前身为Metapa，2024年二月因商标问题更名，据Foundation所述，其创始人写道，拼配保持不变；据Cigar Coop，为Claro和Maduro。茄套为Connecticut Broadleaf，茄芯来自Estelí和Jalapa，标称烟力为medium至浓郁，规格为Robusto 5 x 50、Corona Gorda 5½ x 48、Toro 6 x 52和Doble Corona 7 x 54，据Cigar Coop于2024年四月所述，在A.J. Fernández卷制。","vitolas":[],"wrapper":"厄瓜多尔Sumatra"},{"name":"The Wise Man Maduro","color":"#4A3728","force":"Medium","story":"在IPCPR 2017上作为El Güegüense的Maduro版本亮相，采用墨西哥San Andrés茄衣；2024年在My Father Cigars重新制作，茄衣相同，茄套取自Estelí和Jalapa，茄芯取自Estelí、Condega和Jalapa。据该公司，烟力为medium，规格为Corona 5 x 48、Robusto 5½ x 50、Toro 6 x 52和Doble Corona 7 x 54，每盒二十支。","vitolas":[],"wrapper":"San Andrés（墨西哥）"}]'
 WHERE `name` = 'Foundation Cigar Company' AND SHA1(TRIM(`gamme`)) = 'b235f31e30b1236a9e1ea83459b111942cd43303';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Foundation Cigar Company' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'b235f31e30b1236a9e1ea83459b111942cd43303';
-- brands|Fratello|gamme|zh — 遗漏配方；术语统一
UPDATE `brands` SET `gamme_zh` = '[{"name":"Fratello Bianco","color":"#C9A96E","force":"Medium","wrapper":"厄瓜多尔 Connecticut","vitolas":["Robusto","Toro"],"story":"目录中浅色的一侧，采用厄瓜多尔 Connecticut 茄衣。这是这家尤其易入手的一条线，也是它得以进入零售渠道的那一条。"},{"name":"Fratello Oro","color":"#8B5A2B","force":"Medium-Full","wrapper":"于 Joya de Nicaragua 卷制的配方","vitolas":["Robusto","Toro","Corona"],"story":"金色系列，比 Bianco 更为厚实。同一作坊，同一族烟叶，配方更为鲜明。"},{"name":"Navetta","color":"#4A2C1A","force":"Full","wrapper":"于 Joya de Nicaragua 卷制的配方","vitolas":["Robusto","Toro"],"story":"意大利语中的「航天飞机」。这是一位做雪茄的前 NASA 工程师取的名字，也是他目录中浓度居首的一侧。"},{"name":"Fratello Classico","color":"#6B4226","force":"Medium-Full","wrapper":"尼加拉瓜 Habano","vitolas":[],"story":"创始配方，2013年，仅以 Fratello 之名，2018年更名 Classico。"}]'
 WHERE `name` = 'Fratello' AND SHA1(TRIM(`gamme`)) = 'd47d7859e5497e3b43da83155b254cc13f74bf35';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fratello' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'd47d7859e5497e3b43da83155b254cc13f74bf35';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Freud Cigar Co.' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '215e25c7b056a7dba9cd3f1b752deded4b4a3d15';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Gellis Family Cigars' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'ba2d74759ce2084ab85463c45ad5971b7b174f45';
-- brands|General Cigar|gamme|zh — 人名拉丁化；日期格式
UPDATE `brands` SET `gamme_zh` = '[{"name":"Macanudo Café","color":"#C9A96E","force":"Mild","story":"Macanudo 的一条产品线，在多米尼加共和国手工卷制（牙买加的生产于2000年结束）。茄衣为 Connecticut Shade claro，色浅而柔和；茄套据一家零售商说是墨西哥的，据另一家则是多米尼加的。零售商处查得的规格：Hyde Park（5 1/2 x 49）、Duke of York（5 1/4 x 54）、Duke of Devon（5 1/2 x 42）。","vitolas":["Café","Baron de Rothschild","Hyde Park","Hampton Court","Prince Philip"],"wrapper":"Connecticut Shade"},{"name":"CAO Flathead","color":"#8B4513","force":null,"story":"CAO 系列，其2026年推出的 Speed Shop Habano 采用厄瓜多尔 Habano 茄衣、墨西哥 San Andrés 茄套，以及尼加拉瓜与多米尼加的茄芯；在尼加拉瓜的 STG Estelí 卷制。共三种规格：V654 Crankshaft（6 1/2 x 54）、V660 Carb（6 x 60）、V770 Big Block（7 x 70）。据 Cigar Coop，Flathead Steel Horse 出现于2015年。","vitolas":["V660 Carb","V554 Piston","V770 Engine","V507 Spark"],"wrapper":"厄瓜多尔 Habano"},{"name":"Toraño","color":"#8B3A1E","force":"Medium-Full","story":"Toraño 家族的品牌组合，2014年9月买下——只有品牌；Toraño Family Cigar 公司停业，Charlie Toraño 留任顾问。Carlos Toraño 2022年2月去世。","vitolas":[],"wrapper":"未公开"},{"name":"Odyssey","color":"#8B5A2B","force":null,"story":"低价位bundles品牌，由General Cigar在IPCPR 2016上亮相，原产国为尼加拉瓜，包含Habano版（尼加拉瓜habano茄衣）与Connecticut版（洪都拉斯Connecticut Shade茄衣）；2025年共有六个版本，其中包括Full（2021年9月），在STG Estelí手工卷制。自2025年8月1日起，STG将其交由Forged Cigar Company的销售团队负责，产品不变。","vitolas":[],"wrapper":"未公开"}]'
 WHERE `name` = 'General Cigar' AND SHA1(TRIM(`gamme`)) = 'd23f9423df2c9a895930cd73bb384a74a268b931';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'General Cigar' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'd23f9423df2c9a895930cd73bb384a74a268b931';
-- brands|German Engineered Cigars|gamme|zh — Raumzeit 茄芯歧义
UPDATE `brands` SET `gamme_zh` = '[{"name":"RVGN","color":"#A0522D","force":"Medium","wrapper":"混合型（厄瓜多尔）","vitolas":[],"story":"厄瓜多尔混合茄衣，多米尼加Criollo 98茄套，茄芯为多米尼加Piloto Cubano、尼加拉瓜烟叶与宾夕法尼亚烟叶，2016年据Cigar Coop介绍；在Intercigar S.A.（坦博里尔）卷制。"},{"name":"RVGN Extrem","color":"#6B4226","force":"Medium","wrapper":"墨西哥（陈化）","vitolas":[],"story":"为品牌十周年于2026年推出；墨西哥陈化茄衣，多米尼加Olor de Jacagua茄套，茄芯为多米尼加与尼加拉瓜的Piloto Cubano及Criollo 98；在Intercigar S.A.（坦博里尔）卷制。"},{"name":"Raumzeit","color":"#C9A96E","force":"Mild-Medium","wrapper":"Connecticut（尼加拉瓜）","vitolas":[],"story":"尼加拉瓜Connecticut茄衣，印度尼西亚Sumatra茄套，茄芯为尼加拉瓜哈拉帕烟叶与多米尼加Piloto；在Tabacalera Tambor（埃斯特利）卷制，据Cigar Coop介绍。"},{"name":"Weltschmerz","color":"#4A2C1A","force":"Medium","wrapper":"Habano oscuro（厄瓜多尔）","vitolas":[],"story":"厄瓜多尔Habano oscuro茄衣，哈拉帕茄套，茄芯产自埃斯特利与哈拉帕；在Tabacalera Tambor（埃斯特利）卷制。"},{"name":"Kraftwerk","color":"#4A2C1A","force":"Full","wrapper":"未公开","vitolas":[],"story":"在多米尼加共和国卷制，浓郁，品牌方称。"}]'
 WHERE `name` = 'German Engineered Cigars' AND SHA1(TRIM(`gamme`)) = 'ba8d7d556965938bfe52ef2901e157f94bac801a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'German Engineered Cigars' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'ba8d7d556965938bfe52ef2901e157f94bac801a';
-- brands|Gispert|gamme|zh — 术语统一 拉丁写法
UPDATE `brands` SET `gamme_zh` = '[{"name":"Gispert","color":"#8A5A2B","wrapper":"厄瓜多尔（Connecticut 种）或 San Andrés maduro","story":"两个版本，一浅一深。洪都拉斯与尼加拉瓜茄芯，口味由淡至中。"}]'
 WHERE `name` = 'Gispert' AND SHA1(TRIM(`gamme`)) = '5ac5665aef8242cb8e9f640e188fcdeabddfea42';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Gispert' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '5ac5665aef8242cb8e9f640e188fcdeabddfea42';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'God of Fire' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '5e4d21c71b5a3e3fd79289eae910153c5f1789e6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Golden Djawa' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'cad96dddec71adf056492fb65c7a7be098cbe3c8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Gran Habano' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '94d456ab5b5087629b0946c00f953160f945fc37';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Graycliff' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'd2de4349e0e44beedcf7332595fe262f58198bf9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Great Wall Cigars' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '49d3aa1ed4dcceafe22735ce1ff34bad7a8d7bf6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Gurkha' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'df5bc88a9e47416da715146a3f0bfbca277f19fb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'H. Upmann' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'b12972ef64032d059f55af95d2898ba9b56e3225';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'H. Upmann Dominicain' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'H.R.' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'f5c8a95d4671538d4938d064fb1ad084524b5a27';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Helvada' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '8243c46d55150dfd56989a9a91715daf53774882';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Hemmys' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '5bc36be800c6c53348687df234fe065fbba9484c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Henry Clay' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Herr Lehmann' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'caf27b5638e176c59261d32bc3c75efedbb33b2c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Hiram & Solomon' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '46dc649869548476b849c4e6c69ae16a2641c1a3';
-- brands|Holt's Cigar Company|gamme|zh — 名称遗漏 The
UPDATE `brands` SET `gamme_zh` = '[{"name":"All In!","color":"#C9A96E","force":"Mild","story":"Connecticut Shade茄衣，包裹采用Cuban sandwich的多米尼加烟叶，据Holt''s员工2025年4月的一则评述，混合了longfiller与shortfiller；据Holt''s，力度温和，Holt''s并称其在多米尼加共和国手工制作；取名自扑克的三种规格，以二十支装bundle销售：The Flop（5 x 50）、The River（7 x 50）与The Turn（6 x 50）；2026年10月列于Holt''s目录。","vitolas":[],"wrapper":"Connecticut Shade"},{"name":"Amante","color":"#A0522D","force":"Mild-Medium","story":"来自厄瓜多尔的Sun Grown茄衣，包裹由多米尼加烟叶组成的longfiller；据Holt''s，力度温和至中等，Holt''s并称其由工匠卷茄师在多米尼加共和国混合并手工制作；仅有一种规格，即Toro 6 x 50，以二十支装bundle销售；2026年10月列于Holt''s目录，缺货。","vitolas":[],"wrapper":"Sun Grown（厄瓜多尔）"},{"name":"Angry Elf","color":"#C9A96E","force":"Mild","story":"Candela茄衣，包裹由多米尼加与尼加拉瓜烟叶组成的longfiller；据Holt''s，力度温和，Holt''s给出的国家为多米尼加共和国，并在2023年3月的一则员工评述中称该品牌为手工制作，全部采用longfiller；以二十支装bundle销售：Churchill（7 x 50）、Robusto（5 x 50）与Toro（6 x 50）；该品牌另有Connecticut、Maduro与Sun Grown版本，其中Sun Grown版本据2023年11月的一则员工评述为手工制作，该页面称其力度中等；2026年10月列于Holt''s目录，缺货。","vitolas":[],"wrapper":"Candela"},{"name":"Argyle Cigars","color":"#C9A96E","force":"Mild","story":"据Holt''s，在多米尼加共和国手工制作，Connecticut Shade茄衣，包裹由多米尼加烟叶组成的longfiller，力度温和，以二十支装雪松木盒销售，共七种规格，从Corona（5½ x 46）到Mayor（8 x 54）；该页面还提及Argyle Maduro、Dark Corojo、Conundrum与White Glove；2026年10月列于Holt''s目录，七种规格中有六种有货。","vitolas":[],"wrapper":"Connecticut Shade"},{"name":"Babalu","color":"#8B5A2B","force":"Medium","story":"姜饼色Sun Grown茄衣，包裹由多米尼加与尼加拉瓜烟叶组成的longfiller；据Holt''s，力度中等，Holt''s并称其在多米尼加共和国手工制作，以二十支装bundle销售，共四种规格：Churchill（7 x 50）、Gordo（6 x 60）、Robusto（5 x 50）与Toro（6 x 50）；2026年10月列于Holt''s目录，缺货。","vitolas":[],"wrapper":"Sun Grown"},{"name":"Bella Cuba","color":"#A0522D","force":"Medium","story":"Sumatra茄衣，包裹采用Cuban sandwich的多米尼加烟叶茄芯；据Holt''s，力度中等，其员工针对Connecticut版本的一则评述（2021年8月5日，2025年9月30日更新）称Bella Cuba在多米尼加共和国手工制作，Sumatra款的页面则称其为多米尼加工艺；以二十支装bundle销售，共四种规格：Churchill（7 x 50）、Media Noche（6½ x 46）、Robusto（5 x 50）与Toro（6½ x 52）；2026年10月列于Holt''s目录，缺货。","vitolas":[],"wrapper":"Sumatra"},{"name":"Belleza","color":"#8B5A2B","force":"Mild-Medium","story":"姜饼色Sun Grown茄衣，包裹陈年的多米尼加longfiller；据Holt''s，力度温和至中等，Holt''s并称其由工匠在多米尼加共和国手工制作；仅有一种规格，即Toro 6 x 50，以二十支装bundle销售；2026年10月列于Holt''s目录，缺货。","vitolas":[],"wrapper":"Sun Grown"},{"name":"Benchmade","color":"#8B5A2B","force":"Medium","story":"可选三种茄衣，即Natural、Maduro与Sun Grown，包裹由多米尼加、洪都拉斯与尼加拉瓜烟叶组成的longfiller；据Holt''s，力度中等，Holt''s称其在尼加拉瓜埃斯特利的一家工厂卷制，Holt''s未点名该工厂，以二十支装bundle销售，共五种规格：Churchill、Gordo、Robusto、Toro与Torpedo；2026年10月列于Holt''s目录，缺货。","vitolas":[],"wrapper":"Natural、Maduro或Sun Grown"},{"name":"Blenders Clearing House","color":"#8B5A2B","force":"Mild-Medium","story":"来自厄瓜多尔的Connecticut（Natural）或Habano（Maduro）茄衣，包裹由多米尼加与尼加拉瓜烟叶组成的longfiller；据Holt''s，力度温和至中等，Holt''s并称其在多米尼加共和国手工制作，以二十支装bundle销售，共六种规格，从Robusto（5 x 50）到President（8 x 54），每种规格各有两种茄衣；2026年10月列于Holt''s目录，缺货。","vitolas":[],"wrapper":"厄瓜多尔：Connecticut、Habano"},{"name":"Boardwalk","color":"#6B4226","force":"Medium","story":"巴西茄衣，包裹采用Cuban sandwich的多米尼加与尼加拉瓜烟叶茄芯；据Holt''s，力度中等，Holt''s并称其在多米尼加共和国手工制作，以二十支装bundle销售，共两种规格：Robusto（5 x 50）与Toro（6 x 50）；2026年10月列于Holt''s目录，缺货。","vitolas":[],"wrapper":"巴西"},{"name":"Casa Royale","color":"#C9A96E","force":"Mild-Medium","story":"Connecticut Shade茄衣，包裹由多米尼加与尼加拉瓜烟叶组成的longfiller；据Holt''s，力度温和至中等，Holt''s并称其在多米尼加共和国手工制作，以每盒二十支的盒装销售，共四种规格：Churchill（7 x 50）、Imperial（6 x 50）、King（6 x 60）与Robusto（5 x 50）；2026年10月列于Holt''s目录，缺货。","vitolas":[],"wrapper":"Connecticut Shade"},{"name":"Castano","color":"#A0522D","force":"Medium","story":"肉桂色Sun Grown茄衣，包裹longfiller；据Holt''s，力度中等，Holt''s并称其在多米尼加共和国手工制作；仅有一种规格，即Churchill 7 x 50，以二十支装bundle销售；2026年10月列于Holt''s目录，缺货。","vitolas":[],"wrapper":"Sun Grown"},{"name":"Cortesia","color":"#A0522D","force":"Medium","story":"棕色油润的Sumatra茄衣，包裹陈年longfiller；据Holt''s，力度中等，Holt''s并称其在多米尼加共和国手工制作；仅有一种规格，即Churchill 7 x 50，以二十支装bundle销售；2026年10月列于Holt''s目录，缺货。","vitolas":[],"wrapper":"Sumatra"},{"name":"Fine Catch","color":"#8B5A2B","force":"Mild","story":"来自厄瓜多尔的Connecticut（Natural）或Habano（Maduro）茄衣，包裹被称为vintage的多米尼加longfiller拼配；据Holt''s，力度温和，Holt''s并称其在多米尼加共和国手工制作，以二十支装bundle销售，共五种取名自鱼类的规格：Trout（5 x 50）、Bass（6 x 50）、Marlin（6½ x 52）、Pike（7 x 50）与Grouper（5½ x 60），每种规格各有两种茄衣；2026年10月列于Holt''s目录，缺货。","vitolas":[],"wrapper":"厄瓜多尔：Connecticut、Habano"},{"name":"Rainmaker","color":"#C9A96E","force":"Mild","story":"来自厄瓜多尔的Connecticut茄衣，包裹采用Cuban sandwich的多米尼加烟叶茄芯；据Holt''s，力度温和，Holt''s并称其由工匠在多米尼加共和国手工制作；仅有一种规格，即Toro 6 x 50，以二十支装bundle销售；2026年10月列于Holt''s目录，缺货。","vitolas":[],"wrapper":"Connecticut（厄瓜多尔）"},{"name":"Royal Symbols","color":"#A0522D","force":"Medium","story":"来自厄瓜多尔的Habano茄衣，包裹由被称为vintage的多米尼加烟叶组成的longfiller；据Holt''s，力度中等，Holt''s并称其由工匠在多米尼加共和国手工制作；仅有一种规格，即Churchill 7 x 50，以二十支装bundle销售；2026年10月列于Holt''s目录，缺货。","vitolas":[],"wrapper":"Habano（厄瓜多尔）"},{"name":"Savoy","color":"#C9A96E","force":"Medium","story":"深金黄色Connecticut Shade茄衣，包裹由多米尼加烟叶组成的longfiller；据Holt''s，力度中等，Holt''s并称其由工匠卷茄师在多米尼加共和国手工制作，以二十支装bundle销售，共五种规格：Churchill（7 x 50）、Gordo（6 x 60）、Robusto（5 x 50）、Toro（6 x 50）与Torpedo（6½ x 52）；2026年10月列于Holt''s目录，缺货。","vitolas":[],"wrapper":"Connecticut Shade"},{"name":"Top Hat","color":"#C9A96E","force":"Mild-Medium","story":"深金黄色Connecticut Shade茄衣，包裹采用Cuban sandwich的烟叶茄芯；据Holt''s，力度温和至中等，Holt''s并称其在多米尼加共和国手工制作，以二十支装bundle销售，共两种规格，Ritz（6 x 50）与Waldorf（7 x 50）；2026年10月列于Holt''s目录，缺货。","vitolas":[],"wrapper":"Connecticut Shade"},{"name":"Utopia","color":"#A0522D","force":"Medium","story":"来自厄瓜多尔的Habano茄衣，包裹由被称为vintage的多米尼加烟叶组成的longfiller；据Holt''s，力度中等，Holt''s并称其由一家精品雪茄工厂的工匠在多米尼加共和国手工制作；仅有一种规格，即Churchill 7 x 50，以二十支装bundle销售；2026年10月列于Holt''s目录，缺货。","vitolas":[],"wrapper":"Habano（厄瓜多尔）"},{"name":"Viking Village","color":"#C9A96E","force":"Medium","story":"浅棕色Connecticut Shade茄衣，包裹多米尼加烟叶的茄芯；据Holt''s，力度中等，Holt''s并称其在多米尼加共和国手工制作，以二十支装bundle销售，共两种规格，Berserker（6 x 50）与Thor（5 x 50）；2026年10月列于Holt''s目录，缺货。","vitolas":[],"wrapper":"Connecticut Shade"}]'
 WHERE `name` = 'Holt''s Cigar Company' AND SHA1(TRIM(`gamme`)) = 'f63fe69d31944a5a1cd6167025c1d80fba267722';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Holt''s Cigar Company' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'f63fe69d31944a5a1cd6167025c1d80fba267722';
-- brands|Horacio|gamme|zh — module 误作系列
UPDATE `brands` SET `gamme_zh` = '[{"name":"Classic","color":"#A0522D","force":"Medium-Full","wrapper":"厄瓜多尔，Colorado","vitolas":[],"story":"厄瓜多尔colorado茄衣，哥斯达黎加茄套，尼加拉瓜茄芯，共九款规格，编号0至VIII，据House of Grauer介绍。"},{"name":"Heritage","color":"#6B4226","force":"Medium","wrapper":"厄瓜多尔，Maduro","vitolas":[],"story":"厄瓜多尔maduro茄衣，色泽深沉、油润，哥斯达黎加茄套，茄芯融合尼加拉瓜与哥斯达黎加烟叶，据House of Grauer介绍。"},{"name":"Maduro Series","color":"#4A3728","force":"Medium","wrapper":"厄瓜多尔，Maduro","vitolas":[],"story":"厄瓜多尔maduro茄衣，色泽深沉、油润，尼加拉瓜茄芯，共五款规格，从H8到H0，据Zigarrenversand.ch介绍。"},{"name":"Edición Especial","color":"#8B5A2B","force":null,"wrapper":"未公开","vitolas":[],"story":"colorado maduro茄衣，据Zigarrenversand.ch介绍，其产地依规格在墨西哥与尼加拉瓜之间变化；尼加拉瓜长茄芯，共五款规格，从Gordito到Super Gordo，力度介于medium至浓郁之间，视规格而定。"},{"name":"OX","color":"#6B4226","force":"Medium-Full","wrapper":"厄瓜多尔，Maduro","vitolas":[],"story":"厄瓜多尔maduro茄衣，尼加拉瓜茄套与茄芯，共四种规格——Black Angel、Blue Velvet、Purple Rain、Red Rock——于2017年推出，据Zigarrenversand.ch介绍。"}]'
 WHERE `name` = 'Horacio' AND SHA1(TRIM(`gamme`)) = '905aae3cee0f297a5eb9999531b67ef7471d3f8d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Horacio' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '905aae3cee0f297a5eb9999531b67ef7471d3f8d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Hoyo de Monterrey' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'a2015aef3c1dc4943ecc18d4da54622cefa6ea58';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Hoyo de Monterrey Honduras' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'f655166f297d88daaf14030fd189b271219c8ef7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'HVC Cigars' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'f023431637f55d866b9213347eecc39f5d873a53';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ibis' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '19c22d15858665a25480876602ee9ae42b124a82';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'IGM Cigars' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '6f61d62813f2730793c2be971fdc318d09948bf0';
-- brands|Illusione|gamme|zh — Corojo 误译可乐多
UPDATE `brands` SET `gamme_zh` = '[{"name":"Epernay","color":"#C2B280","force":"Medium","wrapper":"哈拉帕科罗霍","vitolas":["Corona","Robusto"],"story":"这家奶润的一面，以香槟之城命名。烤面包、黄油、干草——一支午间的雪茄，其纤细令余味比尺寸所暗示的更长。"},{"name":"Illusione Original Documents","color":"#8B7355","force":"Full","wrapper":"Corojo 99","vitolas":["Lancero"],"story":"在整个市场一路加粗时，这个品牌所捍卫的细身尺寸。干、带胡椒、毫不妥协：细身浓缩而非稀释的明证。"},{"name":"Cruzado","color":"#8B5A2B","force":"Medium-Full","wrapper":"未公开","vitolas":[],"story":"2007年——迪翁·乔利托的第二个品牌，用 Aganorsa 烟叶。"},{"name":"Rothchildes","color":"#4A3728","force":"Medium-Full","wrapper":"圣安德烈斯（墨西哥）","vitolas":[],"story":"2013年——单一短尺寸，圣安德烈斯茄衣，价格克制。"},{"name":"Fume d''Amour","color":"#C9A96E","force":"Medium","wrapper":"未公开","vitolas":[],"story":"2015年——以尼加拉瓜地名命名的各尺寸。"},{"name":"OneOff","color":"#3E4A6B","force":"Medium","wrapper":"未公开","vitolas":[],"story":"2000年代的一个意大利品牌，2018年被 Illusione 买下，在 Aganorsa 卷制。"},{"name":"Garagiste","color":"#6B4226","force":"Full","wrapper":"未公开","vitolas":[],"story":"2019年——小酒农的那个词，用在一支浓烈的雪茄上。"}]'
 WHERE `name` = 'Illusione' AND SHA1(TRIM(`gamme`)) = '2d0fcc91c12531f3799a386a9140307a0a949448';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Illusione' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '2d0fcc91c12531f3799a386a9140307a0a949448';
-- brands|J. Fuego|gamme|zh — 姓氏拉丁字母；雪茄/线混淆
UPDATE `brands` SET `gamme_zh` = '[{"name":"Gran Reserva Corojo No.1","color":"#7A2E1E","force":"Medium-Full","story":"本厂2006年推出的首款雪茄——也是它的纲领：科罗霍是一切的核心。","vitolas":[],"wrapper":"科罗霍"},{"name":"Origen","color":"#8B4A2B","force":"Medium-Full","story":"纯科罗霍雪茄，Fuego家族的烟叶。","vitolas":[],"wrapper":"科罗霍"},{"name":"777","color":"#4A3728","force":"Full","story":"J. Fuego 的牌子。","vitolas":[],"wrapper":"未公开"},{"name":"Sangre de Toro","color":"#6B1F1F","force":"Full","story":"科罗霍各条线中新近问世的那一条。","vitolas":[],"wrapper":"科罗霍"}]'
 WHERE `name` = 'J. Fuego' AND SHA1(TRIM(`gamme`)) = '32ce60a20df14376cea4f8fb95141537a55a5fed';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'J. Fuego' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '32ce60a20df14376cea4f8fb95141537a55a5fed';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'J.C. Newman' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '38cff159ecc7c386cd0bce09064bdb04d2c6bccc';
-- brands|Jake Wyatt Cigar Co.|gamme|zh — 茄套茄芯产地含混
UPDATE `brands` SET `gamme_zh` = '[{"name":"Appendix II","color":"#4A3728","force":"Medium-Full","wrapper":"未公开","vitolas":[],"story":"Connoisseur 系列中的一条线，也有 figurado 版本。"},{"name":"Titan Series","color":"#6B4226","force":"Medium","wrapper":"未公开","vitolas":[],"story":"Goliad、Colossus、Omega——三支日常雪茄，2026年，茄套与茄芯来自洪都拉斯和尼加拉瓜。"}]'
 WHERE `name` = 'Jake Wyatt Cigar Co.' AND SHA1(TRIM(`gamme`)) = 'a2d29e73e7970d57d3ac6983da7727fcb03c72ce';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Jake Wyatt Cigar Co.' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'a2d29e73e7970d57d3ac6983da7727fcb03c72ce';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'JAMM Cigar' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '0f911450c1c198748d2adb44b672192602937324';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Jas Sum Kral' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'fcd4512ee2ca4e2269121f1676ea1ac1caf6b54d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'José L. Piedra' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '4f7779245e2f982151da519609ee67c212450267';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Joya de Nicaragua' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'a560061c37c6dc630e946459c1a3a0f46c2e5b5b';
-- brands|Joyas de Panamá|gamme|zh — 人名改拉丁字母
UPDATE `brands` SET `gamme_zh` = '[{"name":"Joyas de Panamá","color":"#8B1A1A","force":"Medium","wrapper":"巴拿马（科克莱）","vitolas":[],"story":"1986年的品牌，在拉平塔达用驯化于科克莱的古巴种烟叶卷制。"},{"name":"Flor de Panamá","color":"#C9A227","force":"Mild-Medium","wrapper":"巴拿马（科克莱）","vitolas":[],"story":"据2025年报道，这是工厂的第二个品牌，风格多样——由创始人之子 Braulio Zurita 主持。"}]'
 WHERE `name` = 'Joyas de Panamá' AND SHA1(TRIM(`gamme`)) = '1904cb682f670b6bc83c2e1f082fb871119e406d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Joyas de Panamá' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '1904cb682f670b6bc83c2e1f082fb871119e406d';
-- brands|Juan Clemente|gamme|zh — 烟标改茄标
UPDATE `brands` SET `gamme_zh` = '[{"name":"Club Selection","color":"#C9A227","force":"Light-Medium","wrapper":"Connecticut Shade","vitolas":["Corona"],"story":"雪松、干草，含蓄的柔和。以及贴在茄脚——你点燃那一端——的茄标：一个十米开外就能认出、别人都不敢做的签名。"},{"name":"Rothschild","color":"#B5651D","force":"Medium","wrapper":"Connecticut Shade","vitolas":["Robusto"],"story":"这家的短尺寸，遵循经典多米尼加传统——平衡、柔顺，毫不张扬。"}]'
 WHERE `name` = 'Juan Clemente' AND SHA1(TRIM(`gamme`)) = '05b4a179c97e0f2d2f5ffd036d208d6a227be729';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Juan Clemente' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '05b4a179c97e0f2d2f5ffd036d208d6a227be729';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Juan López' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'b066d6a0f094a511f287ae79e1544f829fef064c';
-- brands|Kafie 1901|gamme|zh — 品牌人名拉丁字母
UPDATE `brands` SET `gamme_zh` = '[{"name":"Serie L Natural","color":"#8B5A2B","force":"Medium","wrapper":"多米尼加","vitolas":[],"story":"多米尼加时期的首支雪茄，与 La Aurora 的 Manuel Inoa 共同调配。全多米尼加。L 纪念 Kafie 五十岁。"},{"name":"Don Fernando Maduro","color":"#3E2A1E","force":"Full","wrapper":"Maduro","vitolas":[],"story":"丹利时期四款配方之一。"}]'
 WHERE `name` = 'Kafie 1901' AND SHA1(TRIM(`gamme`)) = '4628ce2e97e365a1adf9b608f492b807d3bb095e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Kafie 1901' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '4628ce2e97e365a1adf9b608f492b807d3bb095e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Karen Berger Cigars' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '1e0bf43357ba26c05166f879db6c2257caf4aa3f';
-- brands|Kelner Boutique Factory|gamme|zh — 人名改拉丁字母
UPDATE `brands` SET `gamme_zh` = '[{"name":"Smoking Jacket","color":"#3E2A1E","force":"未公开","wrapper":"未公开","vitolas":[],"story":"冠以厂名的牌子。"},{"name":"The 73","color":"#6B4226","force":"未公开","wrapper":"未公开","vitolas":[],"story":"Hendrik Kelner Jr. 的出生年份。与美国订阅俱乐部 Privada Cigar Club 合作制作。"}]'
 WHERE `name` = 'Kelner Boutique Factory' AND SHA1(TRIM(`gamme`)) = 'dce081f0817656789303b477d659bb7987172184';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Kelner Boutique Factory' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'dce081f0817656789303b477d659bb7987172184';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Kinix' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '257bebadda2b3ff3fad2052c2227cc6d1d05d118';
-- brands|Kolumbus|gamme|zh — 去除禁用字，标环改茄标
UPDATE `brands` SET `gamme_zh` = '[{"name":"K-Azul","color":"#2C5F8A","force":"Medium","wrapper":"布雷尼亚品种的帕尔马叶","vitolas":["Robusto"],"story":"这家三款配方之一，彼此以茄标颜色而非尺寸相区分。全部为帕尔马烟叶的长茄芯，于西班牙雪松地窖中陈化。"},{"name":"K-Negro","color":"#3A3A3A","force":"Medium-Full","wrapper":"布雷尼亚品种的帕尔马叶","vitolas":["Robustito"],"story":"三者中色泽尤深的一款，采短尺寸。同样的布雷尼亚烟叶，同样的陈化——变的是配方，不是产地。"},{"name":"K-Rojo","color":"#8B2222","force":"Medium","wrapper":"布雷尼亚品种的帕尔马叶","vitolas":["Robustito"],"story":"系列中的第三款，同为 Robustito。布雷尼亚品种带来花香调，公司以迷迭香、浆果与肉豆蔻的气息来描述它。"}]'
 WHERE `name` = 'Kolumbus' AND SHA1(TRIM(`gamme`)) = '6e263cf90c5d8a3a0e9f312595673a2fadaba874';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Kolumbus' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '6e263cf90c5d8a3a0e9f312595673a2fadaba874';
-- brands|Kristoff|gamme|zh — 去除禁用字
UPDATE `brands` SET `gamme_zh` = '[{"name":"Kristoff Sumatra","color":"#8B5A2B","force":"Medium","wrapper":"苏门答腊","vitolas":["Robusto","Torpedo","Churchill"],"story":"这家较早的系列之一。苏门答腊茄衣，内里取自数国烟叶——这正是品牌自始至终的原则。"},{"name":"Kristoff San Andrés","color":"#3A2A20","force":"Full","wrapper":"墨西哥圣安德烈斯","vitolas":["Robusto","Toro"],"story":"较浓的一侧，采用墨西哥茄衣。正是这条线为品牌拓宽了尤为广泛的受众。"},{"name":"Kristoff Nicaragua","color":"#6B4226","force":"Medium-Full","wrapper":"尼加拉瓜","vitolas":["Robusto","Toro"],"story":"在多米尼加工厂制作的尼加拉瓜系列：品牌想从哪里取叶就从哪里取，并不掩饰。"},{"name":"685 Woodlawn","color":"#4A2C1A","force":"Medium","wrapper":"多产地配方","vitolas":["Robusto","Toro"],"story":"名字是一个门牌号——Glen Case 儿时住所的地址。这是品牌少数带有私人指涉的系列之一。"}]'
 WHERE `name` = 'Kristoff' AND SHA1(TRIM(`gamme`)) = '47edd1b2786394cb014d31febdc4f4704fd27365';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Kristoff' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '47edd1b2786394cb014d31febdc4f4704fd27365';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'L''Atelier' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '44c80bed4479c91e604591c7df4985f89b7254a6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Aroma de Cuba' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '1d669659cf821f188797d30afd525e5ba7773a46';
-- brands|La Aurora|gamme|zh — 品牌人名拉丁字母
UPDATE `brands` SET `gamme_zh` = '[{"name":"1903 Preferidos","color":"#8B4513","force":"Medium","story":"以创立年份命名的系列，配上作为这家签名的喀麦隆茄衣：香料木质、烤榛子、浅色皮革。一支异形茄——这是 La Aurora 长久以来卷制的形制。","vitolas":["Figurado"],"wrapper":"喀麦隆"},{"name":"107","color":"#A0522D","force":"Medium","story":"一个由纪念系列转为常规的产品。比1903更当代、更圆润，是为初识这家的人而设。","vitolas":["Robusto"],"wrapper":"厄瓜多尔哈瓦那种"},{"name":"León Jimenes","color":"#8B5A2B","force":"Mild-Medium","story":"创始人 Eduardo León Jimenes 的名字，用于公司的一条线。","vitolas":[],"wrapper":"厄瓜多尔康涅狄格"}]'
 WHERE `name` = 'La Aurora' AND SHA1(TRIM(`gamme`)) = 'efacce75a0cc7935f754fcc87e122069025c0eab';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Aurora' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'efacce75a0cc7935f754fcc87e122069025c0eab';
-- brands|La Barba|gamme|zh — 避开禁用字，首支
UPDATE `brands` SET `gamme_zh` = '[{"name":"La Barba Red","color":"#8B2222","force":"Medium-Full","wrapper":"Ventura 配方","vitolas":["Robusto","Toro","Corona"],"story":"这家的首支雪茄，2013 年问世。它当时产自洪都拉斯的 Aladino 工厂，此后迁至多米尼加共和国的 Tabacalera William Ventura。"},{"name":"La Barba Purple","color":"#5B3A6E","force":"Medium","wrapper":"多米尼加配方，产自 Ventura","vitolas":["Robusto","Toro"],"story":"2014 年问世，以多米尼加烟叶为基础。正是它把整家公司带向了 Ventura 的作坊。"}]'
 WHERE `name` = 'La Barba' AND SHA1(TRIM(`gamme`)) = '6b7679296af955b60e038d3f6453be86323c15fc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Barba' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '6b7679296af955b60e038d3f6453be86323c15fc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Flor de Cano' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '3e39c86564094be781944e2f0f8593edc1e96a94';
-- brands|La Flor de Copán|gamme|zh — 去除禁用字，升级款
UPDATE `brands` SET `gamme_zh` = '[{"name":"La Flor de Copán Classic","color":"#8B5A2B","force":"Medium","wrapper":"洪都拉斯哈瓦那种","vitolas":["Corona","Robusto"],"story":"人们所期待的洪都拉斯风格：泥土、木质、皮革，干脆的燃烧。褒义上的日常雪茄。"},{"name":"Reserva","color":"#6B4226","force":"Full","wrapper":"Habano Maduro","vitolas":["Toro"],"story":"陈化更久的烟叶，更深的茄衣，更多可可与咖啡。这是这家的高阶之选，风格并未改变。"}]'
 WHERE `name` = 'La Flor de Copán' AND SHA1(TRIM(`gamme`)) = '1b26d305f9cdcb239f727f4560e91f60626c41b5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Flor de Copán' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '1b26d305f9cdcb239f727f4560e91f60626c41b5';
-- brands|La Flor Dominicana|gamme|zh — 束叶芯叶术语统一
UPDATE `brands` SET `gamme_zh` = '[{"name":"Double Ligero","color":"#8B0000","force":"Full","story":"品牌的标志性系列。深色厄瓜多尔 Sumatra 茄衣，阳光下种植，内裹来自庄园的多米尼加茄芯与茄套，有 natural 与 maduro 两种（厂家自述，laflordominicana.com/double-ligero）。2003年推出的楔形头异形雪茄 Chisel，是该系列广为人知的规格。","vitolas":["Chisel","Missile","Torpedo"],"wrapper":"厄瓜多尔 Sumatra"},{"name":"Air Bender","color":"#722F37","force":"Full","story":"厂家称这是一款浓郁醇厚的混合配方，以来自庄园的多米尼加茄芯与茄套，外覆 Habano 茄衣，有 natural 与 maduro 两种（laflordominicana.com/air-bender）。","vitolas":["Robusto","Toro","Chisel","Lancero"],"wrapper":"Habano"},{"name":"Litto Gómez","color":"#8B4513","force":null,"wrapper":"100% 多米尼加","vitolas":[],"story":"以创办人命名的系列，厂家介绍其完全属于多米尼加（laflordominicana.com/our-cigars）。"}]'
 WHERE `name` = 'La Flor Dominicana' AND SHA1(TRIM(`gamme`)) = '016303408c107ed4d7bed9f04f651ebcb0ea4223';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Flor Dominicana' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '016303408c107ed4d7bed9f04f651ebcb0ea4223';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Fontana' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'a20657aeebdd46c77f51418b57f19ed128b1210c';
-- brands|La Galana|gamme|zh — 填充改茄芯
UPDATE `brands` SET `gamme_zh` = '[{"name":"La Galana Longfiller","color":"#8B5A2B","force":"Medium","wrapper":"未公开","vitolas":[],"story":"公司的长茄芯雪茄，由女卷工在埃伦费尔德卷制。"}]'
 WHERE `name` = 'La Galana' AND SHA1(TRIM(`gamme`)) = '2d0ddb899add29051f8121c7cf2b676ed834e97b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Galana' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '2d0ddb899add29051f8121c7cf2b676ed834e97b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Gianna' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '3a8f419b33d64c08eda74c612475de2318f8e6f2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Gloria Cubana' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'c5588ec9baec84a6e87b824a4bb3f6df979642f9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Gloria Cubana Dominicaine' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
-- brands|La Palina|gamme|zh — 去除禁用字与星号
UPDATE `brands` SET `gamme_zh` = '[{"name":"Goldie","color":"#C9A227","force":"Medium","wrapper":"厄瓜多尔 Habano","vitolas":["Laguito No. 2","Laguito No. 5","Dalia"],"story":"高端系列，在小哈瓦那的 El Titan de Bronze 卷制——且仅由一位卷烟师独自完成。它取名自 Goldie Drell Paley，Bill 的祖母、Samuel 的妻子：1896 年那个品牌名所指的，本就是她。"},{"name":"Mr. Sam","color":"#8B5A2B","force":"Medium-Full","wrapper":"El Titan de Bronze 配方","vitolas":["Robusto","Toro"],"story":"迈阿密的另一条线，在 El Titan de Bronze 小批量制作。名字来自 1896 年的创办人 Samuel Paley。"},{"name":"El Diario","color":"#6B4226","force":"Medium-Full","wrapper":"Raíces Cubanas 配方","vitolas":["Robusto","Toro","Corona"],"story":"在洪都拉斯的 Fábrica de Tabacos Raíces Cubanas 卷制。这是与那家工厂合作而生的一条线，自有其风格。"},{"name":"Black Label","color":"#3A2A20","force":"Full","wrapper":"巴西","vitolas":["Robusto","Toro"],"story":"在多米尼加共和国制作，采用油润的巴西茄衣，茄套与茄芯来自尼加拉瓜与多米尼加共和国。目录中尤为浓烈的一侧：皮革、土壤、雪松。"},{"name":"Classic","color":"#A0522D","force":"Medium","wrapper":"依版本而定：康涅狄格、Rosado、马杜罗或洪都拉斯茄衣","vitolas":["Robusto","Toro","Churchill"],"story":"走量的一条线，在多米尼加共和国的 PDR Cigars 卷制——本图集收录的坦博里尔那家工厂。它是进入这家的入门之选。"}]'
 WHERE `name` = 'La Palina' AND SHA1(TRIM(`gamme`)) = 'ac71b53072761ad25639982106d7efc91e5d8bc9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Palina' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'ac71b53072761ad25639982106d7efc91e5d8bc9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Sirena' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '493249520eff1b5e4f9caae2e074490ed03396b8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Unica' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '020aa3752d04e152928f1bb16723501382f0acbf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Las Cabrillas' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '4879c29b31046779403048a9c00d951c92d340a8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Latitude Zero' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '1ad0681a40995dc3d7ff8bac8f3081738e65a671';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Laura Chavin' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'c5d3b0f90a4ed2fe46980e02b76c2cbebc0de732';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Le Fagot Cigar' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '4b957d2d2b86ee961cf8307527e04ad6fd9856d5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'League of Fat Bastards' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '2bf3013686ebb629f13287b84c57a0f789ea23fc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Legado' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '599ca0737da0fa73bba3af5ec5e9adc2a4d9771a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Leite & Alves' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '8d8f2cc7a7841c57dcb3c89b25a9836d98cef833';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Licenciados' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'feef3f1dd794c658a42aa40cfb653bedb2ad21d4';
-- brands|Liga Privada|gamme|zh — 规格列表漏项复原
UPDATE `brands` SET `gamme_zh` = '[{"name":"No.9","color":"#1C0A00","force":"Full","story":"该品牌的原版配方。据该厂称，茄衣为 Connecticut River Valley Broadleaf No. 1 Dark，茄套为巴西 Mata Fina，茄芯来自洪都拉斯与尼加拉瓜。该厂目录中的规格：Coronets、Robusto、Corona Viva、Toro（6 x 52 英寸）、Belicoso、Corona Doble，以及作为季节性发售的 Flying Pig。","vitolas":["Toro","Robusto","No.9 Perfecto","Flying Pig","Little Bigger Fish","Petit Lancero"],"wrapper":"Connecticut Broadleaf"},{"name":"T52","color":"#2D0A00","force":"Full","story":"康涅狄格哈瓦那茄衣，连茎割下并晾干，据该厂称陈化30至36个月；茄套为 Mata Fina，茄芯来自洪都拉斯与尼加拉瓜。该厂目录中的规格与 No.9 相同。据 Cigar Coop，2009年问世。","vitolas":["Toro","Flying Pig","Petit Toro","Unico Serie"],"wrapper":"Connecticut Habano（连茎采收）"},{"name":"Unico Serie","color":"#3D1C00","force":"Full","story":"据 Cigar Coop，该系列于2010年推出：每个规格一种独特配方，是 No.9 与 T52 的衍生。Papas Fritas 是 115 x 44 毫米（4 1/2 x 44 英寸）的短款 corona，茄芯为短茄芯，用其他 Liga Privada 的边角料制成，外覆 Connecticut Broadleaf 马杜罗茄衣；该厂如今将其作为单独的系列提供。","vitolas":["Papas Fritas","Unico Serie annuel"],"wrapper":"因版本而异"}]'
 WHERE `name` = 'Liga Privada' AND SHA1(TRIM(`gamme`)) = 'a77f2a46cec9f93138087d5d2a7a7e127b0d4ba0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Liga Privada' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'a77f2a46cec9f93138087d5d2a7a7e127b0d4ba0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Loaisiga' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '75824a8089a14da9499d1ad564314437da38b459';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Los Amigos' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '53a709b2881001ec8fe80bcc00b133f98d905259';
-- brands|Luciano Cigars|gamme|zh — 人名改拉丁字母
UPDATE `brands` SET `gamme_zh` = '[{"name":"Pichardo Reserva Familiar","color":"#5B3A29","force":"Medium-Full","wrapper":"未公开","vitolas":[],"story":"以工厂创办人家族之名。2019年7月推出。"},{"name":"Luciano The Dreamer","color":"#7A4A2C","force":"Medium","wrapper":"未公开","vitolas":[],"story":"以合伙人之名。与 The Traveler 一道，是2022年赋予公司名字的那条线。"},{"name":"MXS","color":"#4A3728","force":"Medium-Full","wrapper":"未公开","vitolas":[],"story":"运动员签名款——Tiago Splitter 在这桩生意里的角色。"}]'
 WHERE `name` = 'Luciano Cigars' AND SHA1(TRIM(`gamme`)) = 'e194ee01cf362db43219ff0739e0eba9fce63e4c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Luciano Cigars' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'e194ee01cf362db43219ff0739e0eba9fce63e4c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Macanudo' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '0e2bc37a1129c93655bb8ef02ea6830ab84693bf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Malekö' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'a055a130c99e087f737f792a0daf214f0d218cfc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Mara' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '15e219c34daad9161d95f3fa14183351ced44d33';
-- brands|Marca Fina|gamme|zh — chocolat rendu cacao
UPDATE `brands` SET `gamme_zh` = '[{"name":"Marca Fina Panama","color":"#4A3728","force":"Medium","wrapper":"Maduro（巴拿马）","vitolas":[],"story":"巴拿马puro（茄衣、茄套与茄芯均产自本国），带草本与辛香气息，据Noblego介绍。"},{"name":"Marca Fina Nicaragua","color":"#A0522D","force":"Medium","wrapper":"尼加拉瓜产","vitolas":[],"story":"尼加拉瓜puro，全手工制作（TAF），据Cigarworld.de介绍。"},{"name":"Marca Fina Dominicana","color":"#C9A96E","force":"Mild","wrapper":"多米尼加产","vitolas":[],"story":"多米尼加puro，风味偏柔和，带果香，据Cigarworld.de介绍。"},{"name":"Marca Fina Honduras","color":"#8B5A2B","force":"Medium","wrapper":"洪都拉斯产","vitolas":[],"story":"洪都拉斯puro，带泥土与辛香气息，并有雪松般的清新感，据Noblego介绍。"},{"name":"Marca Fina Ecuador","color":"#A0522D","force":null,"wrapper":"厄瓜多尔产","vitolas":[],"story":"厄瓜多尔puro，全手工制作（TAF），据Cigarworld.de介绍。"},{"name":"Marca Fina Brasil","color":"#4A3728","force":null,"wrapper":"巴西产，maduro","vitolas":[],"story":"巴西puro，maduro茄衣，带巧克力、咖啡与皮革香气，据zigarrenversand.ch介绍。"}]'
 WHERE `name` = 'Marca Fina' AND SHA1(TRIM(`gamme`)) = '1dcd55451be68a9a64d3b9c2568ced13248ed5d4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Marca Fina' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '1dcd55451be68a9a64d3b9c2568ced13248ed5d4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Mata Hari' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '92808dda9314b55fec43fde19c366a4b0a54b82e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Matacan' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'ffecc8a983ccec7b10061ffc4a90a140ee150590';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Matilde' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '459b004a5fbd1d34a0155ad3caa260ab116d91be';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'May''s Cigars' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'd55d0390731a252d2828bb879e507800db10b4d9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Maya Selva Cigars' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '86bbb79d9577d8ea42c634793971c6daed97fad5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Meerapfel' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'ee7d73a5ae5b675f5f7c81f02a785643872dff6a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Menendez Amerino' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'acbdc092579b265f0b0edf6abd211f59966e778f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Miami Cigar & Co.' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '3766250b1955df0f7795563b0d8c198abd20ea8e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Micallef' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '926063232e7b2030cb84aef5158e7b4282b153bd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Mombacho' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'e723cd2491e075b136a4f6c2bd2c610b2c7cd310';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Monte Pascoal' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '464e5ba85aec44a5dea4a6e721d779109ff97ef3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Montealto' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'd15f17135a6c36b7bf85512f6015e141e48b2d80';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Montecristo' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '16d0e3775457212b88110a229c91ea267b1821a3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Montecristo Dominicain' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '3425e18150c2eb7c5f1f0f34209860da99498512';
-- brands|Montecruz|gamme|zh — Cameroon resté en anglais
UPDATE `brands` SET `gamme_zh` = '[{"name":"Montecruz Sun Grown","color":"#6B4226","force":"Medium-Full","wrapper":"喀麦隆","vitolas":["Lonsdale","Corona"],"story":"在美国市场充当哈瓦那雪茄替代品的深色喀麦隆茄衣。皮革、烤榛子、温和的胡椒——以及1962年之后美国口味变迁史的一部分。"},{"name":"Montecruz Claro","color":"#C9A227","force":"Medium","wrapper":"喀麦隆 Claro","vitolas":["Corona"],"story":"同一配方的浅色版本，更干、余味更短。这是奉给那些从柔和哈瓦那雪茄转来的烟客的一支。"}]'
 WHERE `name` = 'Montecruz' AND SHA1(TRIM(`gamme`)) = 'b68e4f4c02e1932884a9e3ea8c030390820fb8bb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Montecruz' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'b68e4f4c02e1932884a9e3ea8c030390820fb8bb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'MOSI' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '702d6b704ce24197412312bcb4564bf4b8fe1da4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Mosi Oa Tunya' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '4ba489290b280110fc4275fb25b2c4cb3042c014';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Mustique' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '7744f5485b61ebdb644641ddfb9c33258370e0c9';
-- brands|My Father|gamme|zh — 人名拉丁化；antigüedad 词义
UPDATE `brands` SET `gamme_zh` = '[{"name":"Le Bijou 1922","color":"#8B0000","force":null,"story":"鱼雷型（52 x 152 毫米）。尼加拉瓜配方，厄瓜多尔深色哈瓦那茄衣，烈度为浓烈。红雪松、玛奇朵咖啡、荜澄茄胡椒的气息。名称中的1922，据一位零售商（Cigarsdirect）所说，应是 Pepín 父亲的出生年份；该公司在其首页上并未说明。","vitolas":["Torpedo","Toro","Robusto","Petit Robusto","Churchill","Magnum"],"wrapper":"厄瓜多尔 Habano Oscuro"},{"name":"My Father No.1","color":"#722F37","force":null,"story":"厄瓜多尔康涅狄格自然色茄衣，芯叶为尼加拉瓜烟叶。奶油、榛子、轻盈香料的气息。该系列的名称见于公司页面；页面上未给出其推出年份。","vitolas":["Toro","Robusto","Torpedo","Belicoso","Churchill","Juniors"],"wrapper":"厄瓜多尔 Connecticut"},{"name":"La Antigüedad","color":"#A0522D","force":null,"story":"康涅狄格宽叶马杜罗茄衣，芯叶为尼加拉瓜烟叶。黑巧克力、冷咖啡、糖蜜的气息。名称（意为悠久）据一位零售商称，指向一个古巴旧品牌，其包装图案经过考据；比 Le Bijou 1922 更柔和。","vitolas":["Robusto","Toro","Torpedo","Churchill"],"wrapper":"Connecticut Broadleaf Maduro"},{"name":"Jaime García Reserva Especial","color":"#4A3728","force":null,"story":"以 Pepín 之子命名的系列，康涅狄格 Broadleaf 茄衣。","vitolas":[],"wrapper":"康涅狄格 broadleaf"},{"name":"Flor de las Antillas","color":"#8B5A2B","force":null,"story":"尼加拉瓜纯料，日晒茄衣；公司把它列在其他品牌之中，其 Maduro 版本也在列。","vitolas":[],"wrapper":"尼加拉瓜纯料"},{"name":"La Dueña","color":"#8B1A6B","force":null,"story":"该资料页将这个系列与公司之女 Janny García 联系在一起；康涅狄格 Broadleaf 茄衣。","vitolas":[],"wrapper":"康涅狄格 broadleaf"},{"name":"El Centurión","color":"#7A2E1E","force":null,"story":"公司列出的系列（包括 H-2K-CT 与 Maduro 版本）；尼加拉瓜 Habano 茄衣。","vitolas":[],"wrapper":"尼加拉瓜 Habano"},{"name":"Tabacos Baez","color":"#8B5A2B","force":"Medium","story":"2026年十月，零售商Cigarsdaily称其为My Father首个short filler自有品牌（简称S.F.），但2010年的一篇评论描述其茄芯为混合式，约70%为古巴种子的longfiller，取自Pepin García生产过程中的边角料。茄衣为尼加拉瓜Habano，茄套与茄芯均为尼加拉瓜所产，规格为Robusto 5 x 50，当时在售；2010年另有Corona 6 x 46。","vitolas":[],"wrapper":"尼加拉瓜Habano"}]'
 WHERE `name` = 'My Father' AND SHA1(TRIM(`gamme`)) = '70ee8e6f847849e3d11b7ef36c84822061f223b5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'My Father' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '70ee8e6f847849e3d11b7ef36c84822061f223b5';
-- brands|NACSA|gamme|zh — 人名与公司名拉丁化
UPDATE `brands` SET `gamme_zh` = '[{"name":"Red Dot","color":"#B22222","force":"Medium","wrapper":"未公开","vitolas":[],"story":"工厂的注册品牌之一，2016年由 Larry Palombo 用 Oliva 的烟叶重新调配。"},{"name":"Villar y Villar","color":"#6B4226","force":"Medium-Full","wrapper":"未公开","vitolas":[],"story":"一个旧品牌名，与 La Rosa Especial 和 Aristoff 一起从抽屉里取出。"}]'
 WHERE `name` = 'NACSA' AND SHA1(TRIM(`gamme`)) = '87ee05ba5b2bfcb68510cca428b7b63422c6d8ab';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'NACSA' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '87ee05ba5b2bfcb68510cca428b7b63422c6d8ab';
-- brands|Nat Sherman|gamme|zh — 禁用字符串；保持法文语气
UPDATE `brands` SET `gamme_zh` = '[{"name":"Timeless","color":"#8B4513","force":"Medium-Full","wrapper":"厄瓜多尔哈瓦那种","vitolas":["Robusto","Toro"],"story":"这家公司尤为考究的系列：结构严谨、带胡椒，绵长的余韵解释了它那批纽约客的忠诚。"},{"name":"Metropolitan","color":"#C9A227","force":"Medium","wrapper":"Connecticut Shade","vitolas":["Corona"],"story":"沙龙式的路数，一如这家在第五大道待客的那栋楼：雪松、榛子，没有什么提高音量。"}]'
 WHERE `name` = 'Nat Sherman' AND SHA1(TRIM(`gamme`)) = '097cafb1f7993ac0ef898dbf8388112d0d8a0ad8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Nat Sherman' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '097cafb1f7993ac0ef898dbf8388112d0d8a0ad8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Nicoya' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '65dad592473b81014b75e4620c15127052d54772';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Nomad' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '080fb9b9c3300456a08d1448ed9ec4a628933cdc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Nordlicht' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '4bb5e11f5198eb925bf6aae0c3a00274faadcfc4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Notorious' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '832c7aab01ca776c3c6209f8f84ca7e801416c15';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oettinger Davidoff' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ohana' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '8cddc511d02b0bbfd6d70ae4a7596291c5f07bed';
-- brands|Oliva|gamme|zh — 公司与家族名拉丁化
UPDATE `brands` SET `gamme_zh` = '[{"name":"Serie V","color":"#8B0000","force":"Full","story":"公司的主打系列；各来源给出的推出年份不一。厄瓜多尔日晒茄衣，尼加拉瓜茄套，芯叶为尼加拉瓜 longfiller，其中含哈拉帕的 ligero，据公司称；咖啡、黑巧克力与细腻的香料。Melanio 在公司页面上是另一个独立的系列。","vitolas":["Robusto","Torpedo","Toro","Churchill","Double Toro","Melanio","Figurado"],"wrapper":"厄瓜多尔，日晒"},{"name":"Serie G","color":"#722F37","force":"Medium","story":"喀麦隆茄衣，茄套与芯叶均为尼加拉瓜产；公司称其为中等醇厚。","vitolas":["No.4","No.5","No.7","Belicoso","Torpedo"],"wrapper":"喀麦隆"},{"name":"Nub","color":"#A0522D","force":"Medium","story":"短而粗的雪茄构想（约十厘米，环径可达60），诞生于 Oliva 的创意实验室 Studio Tobac；据一家专业网站，其想法是让整支雪茄都带有通常在末段三分之一才有的风味（另一来源把这一想法归于 Sam Leccia）。推出年份：仅一个来源给出2008年。","vitolas":["358","460","464","Habano","Connecticut","Cameroon"],"wrapper":"Variable"},{"name":"Cuba Aliados","color":"#7A2E1E","force":"Medium-Full","story":"Reyes 家族（洪都拉斯）的牌子；2021年8月，Oliva 连同 Puros Indios 与 Roly 一起收购了这一注册商标，Reyes 家族保留其业务与工厂。Oliva 称正在把生产从洪都拉斯转到尼加拉瓜。参见 Reyes Family Cigars。","vitolas":[],"wrapper":"未公开"},{"name":"Puros Indios","color":"#6B4226","force":"Medium","story":"Reyes 家族的牌子，据行业媒体的一篇专题报道，出现于1995年；注册商标于2021年8月被 Oliva 收购。","vitolas":[],"wrapper":"未公开"},{"name":"Roly","color":"#5B3A29","force":"Medium","story":"2021年8月收购的第三个牌子。","vitolas":[],"wrapper":"未公开"}]'
 WHERE `name` = 'Oliva' AND SHA1(TRIM(`gamme`)) = '9c5f50d758befe5b930bd07d98a005f0d6622e93';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oliva' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '9c5f50d758befe5b930bd07d98a005f0d6622e93';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oliva Connecticut Reserve' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '4679ec1e284286b7d1bce58709002a299d6e9c36';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oliva Serie G' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '18da7f02b077a78a102f222f2678f48b4183473d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Omar Rodriguez' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '0904b24493d70b8c3f16dd2a2aaea20c46b213c8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Onyx' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'df4aa5f6c10257cb43647f8b5a76c7e2ccbe4968';
-- brands|Ortega Cigars|gamme|zh — 人名品牌拉丁字母
UPDATE `brands` SET `gamme_zh` = '[{"name":"Cubao","color":"#8B5A2B","force":"Medium-Full","wrapper":"厄瓜多尔苏门答腊","vitolas":[],"story":"EO Brands 时期诞生于 Don Pepín 处，2012年由 Ortega 保留，在 TACASA 以同一配方回归。"},{"name":"Serie D","color":"#4A3728","force":"Full","wrapper":"未公开","vitolas":[],"story":"2012年——公司独立后的首条线，在 My Father 制作；Natural 与 Maduro。"},{"name":"Wild Bunch","color":"#7A2E1E","force":"Medium-Full","wrapper":"未公开","vitolas":[],"story":"2013年——一年十二支，每月一个人物，灵感来自行业里的朋友。"}]'
 WHERE `name` = 'Ortega Cigars' AND SHA1(TRIM(`gamme`)) = '2f7dc7957edab54605a09d7d3372d85246f704a6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ortega Cigars' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '2f7dc7957edab54605a09d7d3372d85246f704a6';
-- brands|Oscar Valladares|gamme|zh — 城市未译，英文残留
UPDATE `brands` SET `gamme_zh` = '[{"name":"Leaf by Oscar","color":"#6B4226","force":"Medium","story":"外裹一整片烟叶的雪茄，点燃前取下。正是它让这家为人所知，也让它远远就能被认出。","vitolas":["Robusto","Toro","Sixty"],"wrapper":"依版本而定：Corojo、康涅狄格、马杜罗或苏门答腊"},{"name":"Oscar Valladares 2012","color":"#8B5A2B","force":"Medium-Full","story":"以创立之年为名。这家的经典系列，没有那层叶套——评判的是烟草本身，而非那个点子。","vitolas":["Robusto","Toro"],"wrapper":"洪都拉斯配方"},{"name":"Super Fly","color":"#3A2A20","force":"Full","story":"浓烈的一侧，小批量生产。这家常与零售商合作，而这种风格正适合此道。","vitolas":["Robusto","Toro"],"wrapper":"洪都拉斯配方"},{"name":"Island Jim","color":"#4A3728","force":"Medium","wrapper":"哈拉帕的San Andrés","vitolas":[],"story":"该产品线以匹兹堡零售商Jim Robinson的名字命名，于IPCPR 2014上亮相，规格为脚部呈散丝状的No. 2；2025年五月，其雪茄已属该公司的产品组合。2026年十月，一家在线零售商描述其茄衣为哈拉帕的San Andrés，带有Connecticut条带和Oscuro尖端，配尼加拉瓜长茄芯，烟力中等；2025年的Barber Pole规格为6 x 52，由Connecticut和Corojo茄衣交织而成。"}]'
 WHERE `name` = 'Oscar Valladares' AND SHA1(TRIM(`gamme`)) = '0785f7ce1e99d3de3e3cf752ff9456bb1e75f4ab';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oscar Valladares' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '0785f7ce1e99d3de3e3cf752ff9456bb1e75f4ab';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ozgener Family Cigars' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '5e3562191b237f197c9f83920f9a5dce830e6f47';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Padilla' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '163718322cdf4df4c1d2c8c2736e1aa3240ff861';
-- brands|Padrón|gamme|zh — 人名应用拉丁字母
UPDATE `brands` SET `gamme_zh` = '[{"name":"1964 Anniversary Series","color":"#8B0000","force":"Medium-Full","story":"1994年为这家字号的三十周年而推出，据 padron.com，起初采用盒内压制，沿袭古巴传统。全日照茄衣，自然色或马杜罗，烟叶陈化四年。共十六种形制（长度以英寸计 x 环径），其中有 Exclusivo 5½ x 50、Monarca 6½ x 46、Torpedo 6 x 52、Presidente 6 x 50 和 Diplomatico 7 x 50。","vitolas":["Exclusivo","Monarca","Torpedo","Presidente","Diplomatico"],"wrapper":"全日照，自然色/马杜罗"},{"name":"Serie 1926","color":"#722F37","force":"Full","story":"2002年推出，为庆祝 José O. Padrón 七十五岁生日，据 padron.com；2014年发表的一篇人物特写则把它定在 2001年，即他 75 岁那年（他生于 1926年6月）。该系列沿用 José Orlando 的出生年份，Holt''s 写道。烟叶陈化五年，全日照茄衣，自然色或马杜罗，共十种形制：No.1（6¾ x 54，长度以英寸计 x 环径）、No.2、No.6、No.9、No.35、No.40、No.47、No.48、No.80 和 No.90。","vitolas":["No.1","No.2","No.6","No.9","No.35","No.40","No.47","No.48","No.80","No.90"],"wrapper":"全日照，自然色/马杜罗"},{"name":"Padrón Series","color":"#A0522D","force":"Medium-Full","story":"Padrón Series，据 padron.com：十五种长茄芯形制，被描述为中等至浓郁，从 Cortico 到 Magnum，采用全日照烟叶，陈化至少两年半。其中包括 2000（5 x 50）、3000（5½ x 52）、4000（6½ x 54）、5000（5½ x 56）和 7000（6¼ x 60）。","vitolas":["2000","3000","4000","5000","6000","7000"],"wrapper":"全日照"},{"name":"Dámaso","color":"#C04000","force":"Mild-Medium","story":"据 Cigar Coop，2015年7月在 IPCPR 上亮相：这是 Padrón 的首款康涅狄格茄衣雪茄，圆身卷制而非压制，茄套与茄芯均产自尼加拉瓜。这家字号称其采用厄瓜多尔康涅狄格茄衣，强度为柔和至中等；该系列以 Dámaso Padrón 命名，他是 19 世纪末从加那利群岛抵达古巴的首位 Padrón，Cigar Coop 称他是 José O. Padrón 的祖父。形制：No.8（5½ x 46）、No.12（5 x 50）、No.15（6 x 52）、No.17（7 x 54），以及两款更浓郁的 Red Label，即 No.32 和 No.34。","vitolas":["No.8","No.12","No.15","No.17","No.32","No.34"],"wrapper":"厄瓜多尔 Connecticut"}]'
 WHERE `name` = 'Padrón' AND SHA1(TRIM(`gamme`)) = 'b82bfd2ee3c22d313f75549540d0d8bfb253a575';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Padrón' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'b82bfd2ee3c22d313f75549540d0d8bfb253a575';
-- brands|Partagás|gamme|zh — 国名 Cuba 未译
UPDATE `brands` SET `gamme_zh` = '[{"name":"Série D","color":"#8B2500","force":"Full","story":"Serie D No. 4 是一支 50 × 124 毫米的罗布图（4 7/8 英寸，环径 50），此为维基百科列表所载；Habanos 把它列在该品牌特别知名的规格之首；它的 Reserva，Habanos 写道，是这家字号做出的首个 Reserva。该系列还有2011年推出的 Serie D No. 5（110 毫米，环径 50，据维基百科）和2014年推出的 Serie D No. 6（90 毫米，环径 50）。","vitolas":["No.4","No.5","No.6"],"wrapper":"古巴（Vuelta Abajo）"},{"name":"Lusitanias","color":"#722F37","force":"Full","story":"规格为 49 × 194 毫米（7 5/8 英寸，环径 49），据维基百科的列表属 prominente。Habanos 把它列入该品牌特别知名的规格，并在2013年12月推出 Partagás 首款 Gran Reserva 时称其庄严雄伟。","vitolas":["Lusitanias"],"wrapper":"古巴（Vuelta Abajo）"},{"name":"8-9-8","color":"#5C4033","force":"Medium-Full","story":"据维基百科的列表，这是一支约 171 毫米、环径 43 的 dalia（lonsdale）；零售商 Cigars Unlimited 给出的是 6 3/4 英寸、环径 43，并用漆面盒中二十五支雪茄的排列来解释名称：上面八支，中间九支，下面八支。Habanos 把它列入 Partagás 特别知名的规格，但没有给出其尺寸。","vitolas":["8-9-8 Varnished"],"wrapper":"古巴（Vuelta Abajo）"},{"name":"Série P","color":"#6E2C1E","force":"Full","wrapper":"古巴（Vuelta Abajo）","vitolas":[],"story":"Pirámide Serie P No. 2，2005年推出：Habanos 写道，它很快成为偏爱浓郁风味雪茄的爱好者所钟爱的一款 habano。据维基百科的列表，它长 156 毫米、环径 52（6 1/8 英寸）。"},{"name":"Série E","color":"#8C4A2F","force":"Full","wrapper":"古巴（Vuelta Abajo）","vitolas":[],"story":"Serie E No. 2，2011年由 Habanos 与 Serie D No. 5 一同推出：长 140 毫米、环径 54（5 1/2 英寸），据维基百科的列表，其 vitola de galera 为 Duke（robusto extra）。"},{"name":"Línea Maduro","color":"#3B2A20","force":null,"wrapper":"Maduro","vitolas":[],"story":"Habanos 把 Maduro No. 1 定在2015年，它先是为 Casa del Habano 网络推出，随后并入该系列；Línea Maduro 连同 Maduro No. 2 和 No. 3 的推出则定在2018年；该页面没有给出它们的尺寸。"}]'
 WHERE `name` = 'Partagás' AND SHA1(TRIM(`gamme`)) = 'ce290a06568c58f7c033e585a9ae75d936587d5a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Partagás' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'ce290a06568c58f7c033e585a9ae75d936587d5a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Partagás USA' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '8851b6375c246e11eacd76855c1e7806a18ac70d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Patina Cigars' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'a72fa81972ba690ff74e47a30668d60cc8a65aa4';
-- brands|Patoro|gamme|zh — 规避禁用字样
UPDATE `brands` SET `gamme_zh` = '[{"name":"Gran Añejo Reserva","color":"#5B3A29","force":"Medium-Full","wrapper":"未公开","vitolas":[],"story":"2001年的首条线。"},{"name":"Platino","color":"#A8A8A8","force":"Medium","wrapper":"未公开","vitolas":[],"story":"自2003年起。"},{"name":"Serie P","color":"#8B5A2B","force":"Medium-Full","wrapper":"巴西（美国版）","vitolas":[],"story":"同一烟标下的两支雪茄：巴西茄衣与茄套的美国版不同于欧洲版。美国由 C.L.E. 分销。"}]'
 WHERE `name` = 'Patoro' AND SHA1(TRIM(`gamme`)) = 'd68f8d5a98daf9343651ee28938f5a05ab5b7550';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Patoro' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'd68f8d5a98daf9343651ee28938f5a05ab5b7550';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Paul Garmirian' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'eab3e8acc87453db05553b3e1c5d4e00f2084921';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Paul Stulac Cigars' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'f4c93d81ceaf34297f9a8a841b2e40d0b91abacd';
-- brands|PDR Cigars|gamme|zh — 人名应用拉丁字母
UPDATE `brands` SET `gamme_zh` = '[{"name":"PDR 1878","color":"#6B4226","force":"Medium","wrapper":"未公开","vitolas":[],"story":"2009年的主力牌子——四个变体，数月售出十万支。"},{"name":"A. Flores 1975","color":"#7A2E1E","force":"Medium-Full","wrapper":"未公开","vitolas":[],"story":"创始人的出生年份，用在以他姓名署名的系列上——Serie Privada 与 Gran Reserve。"},{"name":"Flores y Rodríguez","color":"#8B5A2B","force":"Medium-Full","wrapper":"未公开","vitolas":[],"story":"与合伙人 Luis 合作。零售商目录里常见的名字。"}]'
 WHERE `name` = 'PDR Cigars' AND SHA1(TRIM(`gamme`)) = '26b9179738f30e338770c30b94b0846b9bac7ae0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'PDR Cigars' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '26b9179738f30e338770c30b94b0846b9bac7ae0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Perdomo' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '480cb5eb144b3ff115a457abdc7448f3afa3fd4b';
-- brands|Perdomo Legacy Connecticut|gamme|zh — Medium 未译
UPDATE `brands` SET `gamme_zh` = '[{"name":"Perdomo Legacy Ecuadorian Connecticut","color":"#C9A96E","force":"Medium","story":"厂方产品线（perdomocigars.com，2026年10月）：Ecuadorian Connecticut 茄衣陈放十年，并在波本桶中至少放置八个月，茄套叶为 Nicaraguan Shade Grown，茄芯为古巴种子的尼加拉瓜烟草；据厂方，力度为中等。规格：Robusto 5x54、Epicure 6x54、Gran Belicoso 6x60、Gordo 6x60、Churchill 7x54。","vitolas":["Robusto","Toro","Churchill","Torpedo"],"wrapper":"厄瓜多尔 Connecticut"}]'
 WHERE `name` = 'Perdomo Legacy Connecticut' AND SHA1(TRIM(`gamme`)) = '618670b7a469a0c5cf6b07e05657c577aa8e7a4d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Perdomo Legacy Connecticut' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '618670b7a469a0c5cf6b07e05657c577aa8e7a4d';
-- brands|Perla de Calvano|gamme|zh — 茄套术语不一致
UPDATE `brands` SET `gamme_zh` = '[{"name":"Perla de Calvano","color":"#C9A96E","force":null,"wrapper":"Java Besuki（印度尼西亚）","vitolas":[],"story":"力度被一家经销商评为中等，另一家则评为较柔和；茄套为洪都拉斯Connecticut Broadleaf。"}]'
 WHERE `name` = 'Perla de Calvano' AND SHA1(TRIM(`gamme`)) = '508aef1671ef4020332465f2bde167070f830c1f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Perla de Calvano' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '508aef1671ef4020332465f2bde167070f830c1f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Plasencia' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'dced305a41240d1e3740d722c47f11787c62e015';
-- brands|Pogar|gamme|zh — 人名应用拉丁字母
UPDATE `brands` SET `gamme_zh` = '[{"name":"Dostoïevski","color":"#4A3728","force":"Medium-Full","wrapper":"未公开","vitolas":[],"story":"Dostoïevski，茄标上用1918年前的旧拼写——工厂的手工系列。"},{"name":"XO","color":"#8B5A2B","force":"Medium","wrapper":"未公开","vitolas":[],"story":"单支管装，价格克制。"}]'
 WHERE `name` = 'Pogar' AND SHA1(TRIM(`gamme`)) = '7806ba128f1dbcb36024fd676095c73e0c8cac16';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Pogar' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '7806ba128f1dbcb36024fd676095c73e0c8cac16';
-- brands|Por Larrañaga|gamme|zh — 外叶应为茄衣
UPDATE `brands` SET `gamme_zh` = '[{"name":"Petit Corona","color":"#D4B44A","force":"Mild-Medium","story":"5 1/8英寸，cepo 42（galera Mareva），据维基百科。茄衣与茄芯来自 Vuelta Abajo，该品牌的浓度为轻度至中度，据 habanos.com。","vitolas":["Marevas"],"wrapper":"Vuelta Abajo"},{"name":"Panetela","color":"#E0C88A","force":"Mild-Medium","story":"5英寸，cepo 36（galera Veguerito），据维基百科。茄衣与茄芯来自 Vuelta Abajo；该规格自身的浓度没有页面可查，品牌的浓度为轻度至中度。","vitolas":["Panetela"],"wrapper":"Vuelta Abajo"},{"name":"Galanes","color":"#C8A55B","force":"Mild-Medium","wrapper":"Vuelta Abajo","vitolas":[],"story":"52 x 120 mm：据 habanos.com，这是该品牌新近推出的规格，也是其首款粗环径规格；长茄芯，烟叶来自 Vuelta Abajo；据进口商称，2021年4月在瑞士上市。"}]'
 WHERE `name` = 'Por Larrañaga' AND SHA1(TRIM(`gamme`)) = '751aadd259f84dc8f3006baa7fde52db73bf6a25';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Por Larrañaga' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '751aadd259f84dc8f3006baa7fde52db73bf6a25';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Por Larrañaga Dominicain' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
-- brands|Powstanie|gamme|zh — 人名拉丁字母，术语统一
UPDATE `brands` SET `gamme_zh` = '[{"name":"Powstanie Habano","color":"#8B5A2B","force":"Medium-Full","wrapper":"厄瓜多尔 Habano","vitolas":[],"story":"Mike 的配方，由顾客盲品选出——2015年5月推出。"},{"name":"Powstanie Maduro","color":"#3A2A1E","force":"Full","wrapper":"Broadleaf 马杜罗","vitolas":[],"story":"Greg 的配方——2015年8月。"},{"name":"Powstanie San Andrés","color":"#4A3728","force":"Full","wrapper":"San Andrés（墨西哥）","vitolas":[],"story":"墨西哥茄衣，尤其是 corona gorda 尺寸。"}]'
 WHERE `name` = 'Powstanie' AND SHA1(TRIM(`gamme`)) = 'a95ad8fab036f661bffb9f45dcc822a7b58e190a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Powstanie' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'a95ad8fab036f661bffb9f45dcc822a7b58e190a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Principle Cigars' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '851c07755f11ad1b6a2d64552fd428553344f558';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Protocol' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '7ccb03fdc266ba263631115068a80ac59394117b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Psyko Seven' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'f0f1cc9019af6cbc42e055263bb3ea44d6222438';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Punch' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '2d22b1708c99a8876ec8e7fbf3ce3ada07ad8a1e';
-- brands|Punch Honduras|gamme|zh — Habano 术语统一
UPDATE `brands` SET `gamme_zh` = '[{"name":"Punch Honduras","color":"#7B3F00","force":"Medium","wrapper":"厄瓜多尔 Habano","vitolas":["Robusto","Churchill"],"story":"泥土、木质、直率的胡椒：典型的洪都拉斯风格，价格则在整个禁运期间为它赢得客群。与同名的哈瓦那毫无关系。"},{"name":"Punch Gran Puro","color":"#4E342E","force":"Full","wrapper":"Habano Maduro","vitolas":["Toro"],"story":"一支洪都拉斯纯产雪茄——包括茄芯在内的所有烟叶都来自本国。证明洪都拉斯可以自给自足。"}]'
 WHERE `name` = 'Punch Honduras' AND SHA1(TRIM(`gamme`)) = 'f1088408c2bb779c46cddc1b27af232d2c9df6bb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Punch Honduras' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'f1088408c2bb779c46cddc1b27af232d2c9df6bb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Puros Artesanos Julio' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'ccd3595f359065c8934f29b338b72248b4f45422';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Quai d''Orsay' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '9de292369edb5e053c68039ac7dd806b70163887';
-- brands|Quesada|gamme|zh — Habano 术语统一
UPDATE `brands` SET `gamme_zh` = '[{"name":"Casa Magna","color":"#7C3030","force":"Full","wrapper":"尼加拉瓜 Habano","vitolas":["Robusto"],"story":"一家多米尼加企业刻意的出格：尼加拉瓜茄芯，全力度，胡椒与泥土。正是这款配方让这个家族的名字越出国界。"},{"name":"Quesada Reserva Privada","color":"#B5651D","force":"Medium","wrapper":"Connecticut Broadleaf","vitolas":["Corona Gorda"],"story":"这家惯常的风格：平衡、柔顺、不事张扬。一支可以让人忘掉它存在的雪茄——这是褒义。"}]'
 WHERE `name` = 'Quesada' AND SHA1(TRIM(`gamme`)) = '73f002cf9f90539f40c356727fd9875b63e25a09';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Quesada' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '73f002cf9f90539f40c356727fd9875b63e25a09';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Quintero' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '68e813536ad06905b4a5d9041d4b91b8b39cbf00';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rafael González' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '673a84dc178b3f34c2df9c5df51867d7fbce395b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ramón Allones' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'a2dd2e63956d8cffa2519a7d5a465d02c0533edc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Red Anchor' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'd470655d1479a29dc96b5bb95bd44ed1958b64d2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Regius' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '2030f1fafc3ae17bc47b89828b073bfc7efa5ac1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Reinado' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '2b3d915446045bfb7481e652674d57ab80faff2f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Reyes Family Cigars' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '44d8f67c7b88e7336c17ed1d7d0b33e6dcc24fce';
-- brands|Rizona Baru|gamme|zh — Jember mal rendu
UPDATE `brands` SET `gamme_zh` = '[{"name":"Kenner King","color":"#6B4226","force":"Medium","wrapper":"爪哇","vitolas":[],"story":"工厂三个品牌之一，用詹贝尔烟叶。"},{"name":"Kenner Ballero","color":"#8B5A2B","force":"Mild-Medium","wrapper":"爪哇","vitolas":[],"story":"公司的细长尺寸。"}]'
 WHERE `name` = 'Rizona Baru' AND SHA1(TRIM(`gamme`)) = '6c82fee336a88601aaf60d67a1691921ed13bfe0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rizona Baru' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '6c82fee336a88601aaf60d67a1691921ed13bfe0';
-- brands|Rocky Patel|gamme|zh — noms propres en latin; maison
UPDATE `brands` SET `gamme_zh` = '[{"name":"Vintage 1992","color":"#8B4513","force":"Medium-Full","story":"名字指的是首款配方所用茄衣的来历——那批茄衣收于 1992 年，而不是今天所售烟叶的年份。厄瓜多尔康涅狄格茄衣，包裹洪都拉斯与尼加拉瓜烟叶。烤榛子、焦糖、浅色木。中偏浓而均衡；Vintage 系列至今仍是市场上极具叙事性的构想之一：每一个年份都在讲一次收成。","vitolas":["Toro","Torpedo","Churchill","Robusto","Corona"],"wrapper":"Ecuador Connecticut"},{"name":"Fifty Years","color":"#722F37","force":"Full","story":"为 Rocky Patel 五十岁而推出——是这个人，不是这个牌子。复杂的洪都拉斯－尼加拉瓜配方，茄衣来自厄瓜多尔的全日照种植。咖啡、东方香料、林下腐叶。Toro 规格，50 x 152 毫米。这个系列一直被 Vintage 各系列的光芒盖住，可它对这家公司的诉说并不逊色。","vitolas":["Toro","Robusto","Churchill","Torpedo"],"wrapper":"厄瓜多尔日光种植"},{"name":"The Edge","color":"#A0522D","force":"Medium","story":"这家公司的入门系列。Robusto 与 Toro 两种规格，康涅狄格茄衣，洪都拉斯与尼加拉瓜烟叶。奶油与榛子的柔和气息。给新手的首支 Rocky Patel——好上手、稳定、有回报。价格亲民。","vitolas":["Robusto","Toro","Torpedo","Corona","Gordo"],"wrapper":"Connecticut Shade"},{"name":"Hamlet","color":"#4A3728","force":"Medium-Full","story":"Hamlet Paredes 的雪茄——他曾是 Partagás 的卷工与 Habanos 的大使，2015年受聘——先是 Tabaquero，再是 Liberation 与 25th Year。Paredes 2022年8月离开；公司保留名字与各线，停掉了 Tabaquero。","vitolas":[],"wrapper":"圣安德烈斯（墨西哥）"},{"name":"Indian Tabac","color":"#8B5A2B","force":"Medium","story":"Rocky Patel 的首个品牌，1990年代，早于公司改用他的名字。","vitolas":[],"wrapper":"未公开"},{"name":"Bold by Nish Patel","color":"#4A3728","force":"Medium-Full","story":"2013年由Nish Patel推出，他是Rocky Patel的兄弟、公司的执行副总裁，此前于2011年首次发售；2024年三月，Premium Cigar Association的一篇文章称他主持该产品线，该产品线在尼加拉瓜生产。茄衣之下为来自San Andrés和公司尼加拉瓜农场的烟叶，规格为Robusto（5½ x 50）、Toro（6 x 52）、Torpedo（6⅛ x 52）和Sixty（6 x 60），据rockypatel.com。","vitolas":[],"wrapper":"Connecticut Broadleaf Maduro"}]'
 WHERE `name` = 'Rocky Patel' AND SHA1(TRIM(`gamme`)) = '80e1b0795eac46ebf9a8d5c8573bb0a4c561ef17';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rocky Patel' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '80e1b0795eac46ebf9a8d5c8573bb0a4c561ef17';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rodrigo de Jerez' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'f1be98c7717ae0e0eb2d18236f302cebd9b70852';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rojas Cigars' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'e1c8563d44af939d61216160c5154d4658996b52';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'RoMa Craft Tobac' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'e42be00358a5e00fbff759b9a3cacfbb5c0ec583';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Romeo y Julieta' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '3cf55eaedbae012b4218895dce7f56d4c5f41565';
-- brands|Romeo y Julieta Dominicain|gamme|zh — Habano; bague=茄标
UPDATE `brands` SET `gamme_zh` = '[{"name":"Romeo y Julieta Reserva Real","color":"#C68642","force":"Medium","wrapper":"厄瓜多尔 Connecticut Shade","vitolas":["Robusto"],"story":"这家多米尼加企业的中度之作：雪松、榛子，克制的甜感。与这个名字所唤起之物尤为接近的一款。"},{"name":"Romeo 505 Nicaragua","color":"#7B3F00","force":"Full","wrapper":"尼加拉瓜 Habano","vitolas":["Toro"],"story":"与古巴范式的差异尤为鲜明：尼加拉瓜茄芯，胡椒与泥土。除了茄标，这支雪茄与同名的哈瓦那毫无关联。"}]'
 WHERE `name` = 'Romeo y Julieta Dominicain' AND SHA1(TRIM(`gamme`)) = '716a94f117e1f93b6a42466e1eaf853b3a36a490';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Romeo y Julieta Dominicain' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '716a94f117e1f93b6a42466e1eaf853b3a36a490';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Romeo y Julieta USA' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '27f07418b3fb5f0a86107e7a4df5787670ee57ec';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Room101' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '69a4a1b5c7d546eb33d8575fb17023572e9b3cbe';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Royal Jamaica' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '0ac1ab9d3169347794d75f8e798217f2776504e9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Saint Luis Rey' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'aebd0d138ea93eb4c24a0891981a0eaf77645e37';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Saint Luis Rey Honduras' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'ea5ba341ba512da7b994b7e68be90e1ce24fbef1';
-- brands|Samana|gamme|zh — Cibao non traduit
UPDATE `brands` SET `gamme_zh` = '[{"name":"Classic","color":"#C9A96E","force":"Mild","wrapper":"Connecticut Shade Claro（美国）","vitolas":[],"story":"规格约十五种，从Chico到Piramide，据cigarworld.de介绍。"},{"name":"1756","color":"#A0522D","force":"Medium","wrapper":"Connecticut Shade（厄瓜多尔）","vitolas":[],"story":"茄芯来自西瓦奥谷地，茄套为多米尼加烟叶，据noblego.de介绍。"},{"name":"Nicaragua Line","color":"#6B4226","force":"Full","wrapper":"Habano 2000（厄瓜多尔）","vitolas":[],"story":"茄芯采用产自埃斯特利的ligero与seco烟叶，装于蓝白礼盒，据zigarrenversand.ch介绍。"},{"name":"Flair","color":"#C9A96E","force":null,"wrapper":"Connecticut（美国）","vitolas":[],"story":"由Oskar Nausch与其子Adrian共同调配，据smokersplanet.de介绍。"}]'
 WHERE `name` = 'Samana' AND SHA1(TRIM(`gamme`)) = '94355366a5a73bd987b0c6473b1cf27f7366b261';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Samana' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '94355366a5a73bd987b0c6473b1cf27f7366b261';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'San Cristóbal de La Habana' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'e133722ef455296edd3b216888c7ac4d1e31ad3d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Sancho Panza' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'ddf92b7662036356fefccce558f72730fa6896c8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Santa Bras' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '4a5e2ee9dd808e7996efb94c9c1f59d8fe199f68';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Santa Clara 1830' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '601f716fa9decc3efef0d8061f24f1ab988c3d2d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Santa Damiana' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '48a841eefbc489cb7218b1340a193330638bf8ca';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Schumacher' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '4c666691499457d47b392f913b3df9922156c0c5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Secret Blend of Cuba' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '25ce8f120b2c90e9f499566aed1e63822046f43e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Selected Tobacco' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
-- brands|Serino Cigar Co.|gamme|zh — nom de personne en latin
UPDATE `brands` SET `gamme_zh` = '[{"name":"Serino Royale","color":"#6B4226","force":"Medium-Full","wrapper":"未公开","vitolas":[],"story":"首条线，2016年，在 La Corona 四手调配。"},{"name":"Wayfarer","color":"#5B3A29","force":"Medium","wrapper":"未公开","vitolas":[],"story":"Carson 的系列，2017年。"},{"name":"Taíno","color":"#8B5A2B","force":"Medium-Full","wrapper":"未公开","vitolas":[],"story":"哥伦布之前的加勒比原住民。"}]'
 WHERE `name` = 'Serino Cigar Co.' AND SHA1(TRIM(`gamme`)) = 'f8a1710d6365e0177787665b81c42f739b247805';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Serino Cigar Co.' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'f8a1710d6365e0177787665b81c42f739b247805';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Siglo de Oro' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '54bb03e3b7cd60bb82c9231709edb30e99a29de6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Simon Beltre' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '62efc1b6b1a171bf056985ad5069cd3400f55a4d';
-- brands|Sindicato Cigar Group|gamme|zh — tripe=茄芯 incohérent
UPDATE `brands` SET `gamme_zh` = '[{"name":"Hex","color":"#4A3728","force":"Full","wrapper":"厄瓜多尔 Habano","vitolas":[],"story":"2013年首发三款配方之一，尼加拉瓜茄芯。"},{"name":"Affinity","color":"#C9A96E","force":"Medium","wrapper":"厄瓜多尔康涅狄格","vitolas":[],"story":"首发的康涅狄格款，与 Casa Bella 同期。"},{"name":"Sindicato","color":"#6B4226","force":"Medium-Full","wrapper":"未公开","vitolas":[],"story":"冠以集团之名的雪茄，在先前三款之后推出。"},{"name":"Particulares","color":"#7A2E1E","force":"Medium","wrapper":"未公开","vitolas":[],"story":"一个重新启用的古巴老牌名。"}]'
 WHERE `name` = 'Sindicato Cigar Group' AND SHA1(TRIM(`gamme`)) = '81f7d9c47a8c5b62396ffbf670a8335b9d344363';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Sindicato Cigar Group' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '81f7d9c47a8c5b62396ffbf670a8335b9d344363';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Skull 77' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '98e8b43843698c94def6cb05d7a1f26087838b45';
-- brands|Southern Draw|gamme|zh — Holt en latin
UPDATE `brands` SET `gamme_zh` = '[{"name":"Rose of Sharon","color":"#C9A96E","force":"Light-Medium","wrapper":"厄瓜多尔康涅狄格","vitolas":["Robusto","Toro","Corona"],"story":"以 Sharon Holt 之名命名的一条线。厄瓜多尔康涅狄格茄衣，风格柔和——它是目录的入门款，也是让这家为人所知的一款。"},{"name":"Kudzu","color":"#4A2C1A","force":"Full","wrapper":"于 A.J. Fernández 卷制","vitolas":["Robusto","Toro"],"story":"葛藤是美国南方的一种入侵藤蔓，所触之处尽被覆盖。这是目录中浓烈的一侧，名字并不中性。"},{"name":"Jacobs Ladder","color":"#3A2A20","force":"Full","wrapper":"于 A.J. Fernández 卷制","vitolas":["Brimstone","Robusto"],"story":"极为厚重的一条线，尺寸以圣经词汇命名——Brimstone，硫磺。公司坦然接受这套意象。"},{"name":"Quickdraw","color":"#8B5A2B","force":"Medium","wrapper":"未公开","vitolas":[],"story":"2015年——公司的小尺寸系列，多种茄衣。"},{"name":"Firethorn","color":"#B22222","force":"Medium-Full","wrapper":"厄瓜多尔 Habano","vitolas":[],"story":"2016年——美国南方的火棘，厄瓜多尔 Habano 茄衣。"},{"name":"Desert Rose","color":"#8B1A6B","force":"Medium","wrapper":"未公开","vitolas":[],"story":"2018年——公司说，献给 Holt 家族的女性。"},{"name":"Fraternal Order","color":"#3E4A6B","force":"Medium-Full","wrapper":"未公开","vitolas":[],"story":"2019年先供 Cigars International，2020年起全国发售——兄弟会，按茄标颜色区分。"}]'
 WHERE `name` = 'Southern Draw' AND SHA1(TRIM(`gamme`)) = '6c43e2a4dce5a79fcf3258371e30c9a2014a8826';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Southern Draw' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '6c43e2a4dce5a79fcf3258371e30c9a2014a8826';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Spartanos' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'eaf0831cb2fd4c6e7451d0cad9e443fb6d26d450';
-- brands|Stauffenberg|gamme|zh — caviste = vendeur de vin
UPDATE `brands` SET `gamme_zh` = '[{"name":"Edition 1 (Pyramides)","color":"#A0522D","force":"Mild-Medium","wrapper":"洪都拉斯Criollo 98","vitolas":[],"story":"纯洪都拉斯配方——茄衣、茄套和茄芯均为同一种烟叶——限量3000支，2025年5月进入德国市场。"},{"name":"Edition 2 (Robusto)","color":"#A0522D","force":null,"wrapper":"洪都拉斯Criollo","vitolas":[],"story":"纯洪都拉斯配方，规格5x54，自2025年9月起在一家德国葡萄酒专卖店有售。"},{"name":"Edition 3 (Toro)","color":"#6B4226","force":"Full","wrapper":"未公开","vitolas":[],"story":"在丹利卷制，发布日期定于2025年11月。"}]'
 WHERE `name` = 'Stauffenberg' AND SHA1(TRIM(`gamme`)) = 'ad03669dca497674010cdcb931d3f96a983c287d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Stauffenberg' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'ad03669dca497674010cdcb931d3f96a983c287d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Stolen Throne' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '20a2f5294986e5ad31ae900a70404a57c3fe495c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Suerdieck' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '79220bf963e010c8f92b36eabc1458fb44b1fd65';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Swag' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '7844cdc8cd5578df23e52863c5ade76e5397abf6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'SYN' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'b574cf78c4a921adefeb4fa339dc169655cf10ca';
-- brands|T. Sonthi|gamme|zh — Condega non traduit
UPDATE `brands` SET `gamme_zh` = '[{"name":"Anne Bonny","color":"#C9A96E","force":null,"wrapper":"厄瓜多尔（claro）","vitolas":[],"story":"厄瓜多尔claro茄衣，2020年采收，干燥四个月，搭配孔德加茄套与茄芯，据Cigarworld.de称。"},{"name":"Blackbeard","color":"#6B4226","force":null,"wrapper":"厄瓜多尔（maduro）","vitolas":[],"story":"厄瓜多尔viso茄衣，2020年采收，发酵八个月制成maduro，同样搭配孔德加茄套与茄芯，据Cigarworld.de称。"},{"name":"Tortuga","color":"#A0522D","force":null,"wrapper":"未公开","vitolas":[],"story":"天然外观，规格较短，同样采用孔德加茄芯，据Cigarworld.de称。"},{"name":"Luxury-Edition","color":"#A0522D","force":null,"wrapper":"未公开","vitolas":[],"story":"规格较长，双色外观，同样采用孔德加茄芯，据Cigarworld.de称。"}]'
 WHERE `name` = 'T. Sonthi' AND SHA1(TRIM(`gamme`)) = '9ee2eeed2743f768fc2d8b65a1b56099b2f12d9c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'T. Sonthi' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '9ee2eeed2743f768fc2d8b65a1b56099b2f12d9c';
-- brands|Tabacalera|gamme|zh — force=力度 cohérence
UPDATE `brands` SET `gamme_zh` = '[{"name":"Tabacalera","color":"#8B6914","force":null,"story":"以该公司名称命名的系列，设有一款 Maduro 版（tabacalera.com.ph，2026年10月）。所读页面未注明茄衣、力度或尺寸。","vitolas":["Churchill","Robusto","Corona","Double Corona"],"wrapper":"未注明"},{"name":"1881","color":"#8B6914","force":null,"wrapper":"未注明","vitolas":[],"story":"该公司的基础系列，含 1881 Perique 的各款（Maduro、BOLD、BOLD Maduro）（tabacalera.com.ph，2026年10月）。所读页面未注明茄衣或力度。"},{"name":"Don Juan Urquijo","color":"#A0522D","force":null,"wrapper":"未注明","vitolas":[],"story":"该公司的系列，设有一款 20 Aniversario 版（tabacalera.com.ph，2026年10月）。所读页面未注明茄衣或力度。"}]'
 WHERE `name` = 'Tabacalera' AND SHA1(TRIM(`gamme`)) = '29f6a44887fc15b9cea58ecef80bd44e828b4882';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacalera' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '29f6a44887fc15b9cea58ecef80bd44e828b4882';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacalera del Oriente' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '513d31c778383c43f97d191317585316078f9996';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacalera Palma' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '6ba4fe71141c6e5c79141299885a21cf97c916b4';
-- brands|Tabacalera R. Paxtián|gamme|zh — 名称被省略，已补回
UPDATE `brands` SET `gamme_zh` = '[{"name":"Del Paraíso","color":"#8B1A1A","force":"Medium","wrapper":"Negro San Andrés（韦拉克鲁斯）","vitolas":[],"story":"首个品牌，1994年——Elemental、Especial、Premium、Mexike，以及一款 Fusión México-Nicaragua。"},{"name":"Privilegios","color":"#5C2E1E","force":"Medium-Full","wrapper":"Negro San Andrés（韦拉克鲁斯）","vitolas":[],"story":"Especial、Premium、Selecta——公司的高端。"},{"name":"R. Paxtián","color":"#6B4226","force":"Medium","wrapper":"Negro San Andrés（韦拉克鲁斯）","vitolas":[],"story":"Premium 与 Secrets，以家族之名命名。"}]'
 WHERE `name` = 'Tabacalera R. Paxtián' AND SHA1(TRIM(`gamme`)) = 'c27c024f816419fbc975a7ed5995d0a829eafb4c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacalera R. Paxtián' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'c27c024f816419fbc975a7ed5995d0a829eafb4c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacalera William Ventura' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '5c5b5299be2cf3d6528fb9d603b482e2dd371d96';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacosta' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'e2255fa1ee5b9975a3d9cccac2bdafa2a10f2d1a';
-- brands|Tabaqueria de Filipinas|gamme|zh — 术语统一：茄芯
UPDATE `brands` SET `gamme_zh` = '[{"name":"Flor de Filipinas","color":"#8B5A2B","force":"Medium","wrapper":"爪哇","vitolas":[],"story":"创始配方：爪哇茄衣、自家的 Sarah 茄套、伊莎贝拉茄芯。"},{"name":"Antonio Gimenez","color":"#4A3728","force":"Medium-Full","wrapper":"爪哇","vitolas":[],"story":"公司里劲道足的一款——伊莎贝拉 pais 与古巴种茄芯，七种尺寸。"},{"name":"Independencia 1898","color":"#7A2E1E","force":"Medium","wrapper":"未公开","vitolas":[],"story":"菲律宾共和国成立之年，印在茄标上。"}]'
 WHERE `name` = 'Tabaqueria de Filipinas' AND SHA1(TRIM(`gamme`)) = '84155020e95322919df3b3c003888dc448cd3a3a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabaqueria de Filipinas' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '84155020e95322919df3b3c003888dc448cd3a3a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tambor Essence' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'dc859a19568aee123191acf0c1dafc67f1d5cd64';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Taru Martani' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '10acbdb2046214f85bed08f0e8cb1d6304ed423a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tatuaje' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'b4228c3d7ca22842ae1c04c75a1a0bb874667ba2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Te Amo' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'ecf4de623ea0f9f3e9ab6be2a5fbcc6605e3e377';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Teatro del Mundo' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'c3ee094fcd076a76b3e3ace1c377c85d9cf46dcd';
-- brands|Temple Hall|gamme|zh — 品牌名用拉丁字母
UPDATE `brands` SET `gamme_zh` = '[{"name":"Temple Hall Estate","color":"#8B4513","force":"Medium","wrapper":"喀麦隆","vitolas":["Corona","Lonsdale"],"story":"这座工厂自家的牙买加配方，比它在同一车间生产的 Macanudo 更浓。木质、皮革，一点泥土气。"},{"name":"Temple Hall No.625","color":"#A0522D","force":"Medium","wrapper":"喀麦隆","vitolas":["Robusto"],"story":"偶尔重版的短尺寸，像是对金斯敦昔日模样的一段记忆。"}]'
 WHERE `name` = 'Temple Hall' AND SHA1(TRIM(`gamme`)) = 'f25adcbbd50adc490b602738c6f3a198d419eddf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Temple Hall' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'f25adcbbd50adc490b602738c6f3a198d419eddf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'The Griffin''s' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '1f57a62d0d8d9e2df7a4d2183447d6ce153550e0';
-- brands|Toscano|gamme|zh — 品牌名拉丁化，去添加义
UPDATE `brands` SET `gamme_zh` = '[{"name":"Toscano Classico","color":"#5B3A29","story":"标准规格，自十九世纪以来便是这般抽法。木质烟气、皮革、黑胡椒，还有那股直白的辛烈——初尝一口令人却步，此后却让人上瘾。切成两半，每半支约可抽半小时。","force":"Full","wrapper":"Kentucky","vitolas":["Toscano"]},{"name":"Toscanello","color":"#8B5A2B","story":"半支 Toscano，原样出售。二十分钟，意大利人站在吧台配一杯咖啡抽的就是它。另有咖啡、茴香等加味款，为这个品牌引来了被 Classico 劝退的烟客。","force":"Medium","wrapper":"Kentucky","vitolas":["Toscanello"]},{"name":"Toscano Originale","color":"#4A2C1A","story":"手工卷制，陈化时间长于 Classico。烟气变得圆润，力度却分毫未减：皮革接替了胡椒，尾段浮出一缕果干的甜。","force":"Full","wrapper":"Kentucky","vitolas":["Toscano"]}]'
 WHERE `name` = 'Toscano' AND SHA1(TRIM(`gamme`)) = 'e4471bb3132c03364e061333f722a5cb6c37fe25';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Toscano' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'e4471bb3132c03364e061333f722a5cb6c37fe25';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Total Flame' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '110e0ebfd0f9f287195f1b002e8e69ab7c98ce64';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Trinidad' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '61a7a895ef896836d712aa4678a24e4e4fbb1294';
-- brands|Trinidad USA|gamme|zh — 人名用拉丁字母
UPDATE `brands` SET `gamme_zh` = '[{"name":"Trinidad Santiago","color":"#7B3F00","wrapper":"多米尼加（纯产地）","story":"多米尼加纯产地雪茄，由 José「Jochy」Blanco 在其位于多米尼加的 Tabacalera Palma 工厂配制，用料取自西瓦奥谷。Rafael Nodal 为 Altadis 重新调整了配方。"},{"name":"Trinidad Espiritu No. 1","color":"#5D4037","wrapper":"尼加拉瓜（纯产地）","story":"尼加拉瓜纯产地雪茄，于埃斯特利的 A.J. Fernandez 工厂卷制。系列首作，各作分别取材于不同产区。"},{"name":"Trinidad Espiritu No. 2","color":"#6D4C41","story":"系列续作。制造商宣称其茄衣与茄芯与首作不同，但未作说明。"},{"name":"Trinidad Espiritu No. 3","color":"#4E342E","story":"2024 年推出，采用墨西哥与尼加拉瓜烟叶，是该系列的墨西哥篇。"},{"name":"Trinidad x Tommy Bahama Island Collection","color":"#8D6E63","story":"与服装品牌 Tommy Bahama 合作推出的系列。"}]'
 WHERE `name` = 'Trinidad USA' AND SHA1(TRIM(`gamme`)) = '839d679ea926f2779824ceb94e246c33c42c0ff6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Trinidad USA' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '839d679ea926f2779824ceb94e246c33c42c0ff6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Umnum' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '9398ad2efe9734be4378baf3aae242ec54d1b8e8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Valentino Siesto' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '513d375f6955e36ddf809514d3a2c24fb2fb33ab';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vallejuelo' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '987725b3a26af0e3583a97af339dd4337fb300a7';
-- brands|Van der Donk|gamme|zh — variantes不是规格
UPDATE `brands` SET `gamme_zh` = '[{"name":"Van der Donk","color":"#8B5A2B","force":"Mild-Medium","wrapper":"苏门答腊或巴西","vitolas":[],"story":"荷兰雪茄的九个变体——古巴、巴西和印尼烟叶。"}]'
 WHERE `name` = 'Van der Donk' AND SHA1(TRIM(`gamme`)) = 'b2221fb5b3142d1e343b12b9a79cbac63ff51a7d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Van der Donk' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'b2221fb5b3142d1e343b12b9a79cbac63ff51a7d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vargas' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '3dfb9ab8d6e2507a7795a739694d6a5b9195e1f8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'VegaFina' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'a9b91b3497cea4350267ecb9f887b8e4fa5b3299';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vegas de Santiago' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '0fd23656d6d40b4e45bfed721763754bde7ef310';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vegas Robaina' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'dc2427feb19ae0436fed1d649546bd584fd8a209';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vegueros' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'd3808241d767dfd75cdd2acfba25ea2fcedab4f2';
-- brands|Viaje|gamme|zh — 禁用字；还原名称
UPDATE `brands` SET `gamme_zh` = '[{"name":"Skull and Bones","color":"#2E2018","force":"Full","wrapper":"尼加拉瓜（Aganorsa）","vitolas":["Daisy Cutter","「?」"],"story":"这家追随者极多的系列，逐年以不同副题重出。每次发行均为限量，且不会原样再版。"},{"name":"Oro et Platino","color":"#8B7355","force":"Medium","wrapper":"尼加拉瓜（Aganorsa）","vitolas":["Reserva VOR"],"story":"起初的两条常规线，始于 2008 年。2012 年公司决定只做限量后即被放弃——此后仅偶尔回归。"}]'
 WHERE `name` = 'Viaje' AND SHA1(TRIM(`gamme`)) = '0ededa02736204639c77ef53f1f764235f6ed483';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Viaje' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '0ededa02736204639c77ef53f1f764235f6ed483';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Villa Vieja' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '40fa5948182e419e932e163095f5bd0f0af9148e';
-- brands|Villiger|gamme|zh — 城市名未译，已译
UPDATE `brands` SET `gamme_zh` = '[{"name":"Villiger La Meridiana","color":"#2C1A0E","story":"完全产自尼加拉瓜的 puro 雪茄，1998年在欧洲面世，沿用了十九世纪一家哈瓦那工厂的名字，据 Cigar Coop 与 Blind Man''s Puff 2019年3月所述；Cigar Coop 当时称其在埃斯特利的 Joya de Nicaragua 卷制。德国零售商 Cigarworld.de 在2026年10月给出的是 H-2000 茄衣、Connecticut 茄套和茄芯，全部产自尼加拉瓜，属 longfiller。Villiger 把它列入其埃斯特利工厂（2021年9月底竣工）的品牌之中。","wrapper":"尼加拉瓜（H-2000）","force":null},{"name":"Cuéllar","color":"#5C3317","story":"由三支多米尼加雪茄组成的系列，即 Connecticut Krēmē、Black Forest 与 Caribe，由 Jochy Blanco 在多米尼加共和国的工厂 Tabacalera Palma 生产，据 Cigar Coop 在2019年、2025年1月和2025年5月所述。Black Forest 于2019年10月宣布，茄衣为 maduro，茄套与茄芯均为多米尼加产；Caribe 于2025年1月31日宣布，茄衣为厄瓜多尔 habano，茄套与茄芯均为多米尼加产，零售商 Neptune Cigar 在2026年10月称其由 Tabacalera La Palma 制造。","wrapper":"Connecticut、Maduro、Habano","force":null},{"name":"Havana Club","color":"#7A2E1E","force":"Medium","story":"一个古巴老牌名，2007年由 Villiger 以多米尼加雪茄的身份重启，在 ABAM 卷制——据 Cigar Coop 2018年3月所述，这家位于圣多明各的工厂归 José「Matias」Maragoto 所有，负责卷制 Villiger 的多米尼加雪茄。","vitolas":[],"wrapper":"未公开"},{"name":"Dominico","color":"#C9A96E","force":"Mild-Medium","story":"来自多米尼加共和国的系列，公司页面在2026年十月称其强度为轻至中等、价格实惠，在Villiger的等级表上为2级（共5级），共有五种规格：Perla、Corona、Robusto、Torpedo和Churchill。德国零售商Cigarworld.de称其在ABAM Cigars手工卷制，采用longfiller，以bundles形式销售，茄衣为厄瓜多尔Connecticut Shade，茄套来自印尼，茄芯为多米尼加共和国与尼加拉瓜的Piloto；据该零售商称，该品牌可追溯至2000年代初，该零售商自2010年十二月七日起将Corona收入目录。","vitolas":[],"wrapper":"Connecticut Shade（厄瓜多尔）"},{"name":"Casa de Nicaragua","color":"#8B5A2B","force":"Medium-Full","story":"据Cigarworld.de称，该系列由Villiger于2014年发布；该零售商自2014年八月十二日起将其收入目录，称其手工卷制，采用mediumfiller，茄衣为厄瓜多尔H-2000，茄套来自印尼，茄芯来自尼加拉瓜。Villiger将其列入位于埃斯特利的工厂所产品牌之列，该工厂于2021年九月底竣工；2026年十月，公司页面列出五种产地为尼加拉瓜的规格（Perla、Corona、Robusto、Torpedo、Churchill），在其等级表上为4级（共5级）。","vitolas":[],"wrapper":"厄瓜多尔（H-2000）"},{"name":"La Libertad","color":"#8B5A2B","force":"Medium-Full","story":"该系列于2000年代初出现在德国的Liberty Cigar Company，后并入Villiger集团；它先离开洪都拉斯（Plasencia曾在那里卷制），再离开多米尼加共和国（ABAM曾在那里卷制），转至埃斯特利：一款新配方（茄衣为尼加拉瓜criollo，茄套来自多米尼加的西瓦奥，茄芯来自尼加拉瓜的哈拉帕与埃斯特利）于2022年一月在拉斯维加斯的TPE展会上亮相，规格为Corona、Robusto和Gran Toro。2026年十月，公司页面将其列入手工制作雪茄之列，共四种规格（Gordito、Robusto、Corona、Gran Toro），在其等级表上为4级（共5级）。","vitolas":[],"wrapper":"Criollo（尼加拉瓜）"},{"name":"La Capitana","color":"#C9A96E","force":"Mild-Medium","story":"该系列于2025年以新配方重新推出，茄衣为厄瓜多尔Connecticut Shade，茄套来自尼加拉瓜，茄芯来自尼加拉瓜与多米尼加共和国，2025年四月在PCA展会上宣布，规格为Lonsdale（6 x 43）、Robusto（5 x 50）、Toro（6 x 50）和Churchill（7 x 50）；2026年七月的一篇报道称，此前的版本使用habano茄衣。Cigarworld.de称其在埃斯特利由Tabacalera Villiger de Nicaragua手工卷制，采用longfiller，在Joya de Nicaragua的场地内进行，并自2025年八月二十八日起将其收入目录；2026年十月，公司页面列出Robusto、Toro和Churchill，在其等级表上为2级（共5级）。","vitolas":[],"wrapper":"Connecticut（厄瓜多尔）"},{"name":"Corrida","color":"#8B5A2B","force":null,"story":"该系列于2017年五月在欧洲推出，有两个版本：洪都拉斯版（据一篇发布报道，由Nestor A. Plasencia在丹利卷制）与多米尼加共和国版（据另一篇报道，在ABAM制作），规格为Robusto+（5 x 56）和Toro+（6 x 52）。2026年十月，公司页面将其列为四种产地：洪都拉斯、多米尼加共和国、尼加拉瓜和巴西，在其等级表上依次为4级、2.5级、5级和3.5级（共5级），并将其面向手工卷制雪茄的爱好者；Villiger将Corrida列入其位于埃斯特利的工厂所产品牌之列，该工厂于2021年九月底竣工。","vitolas":[],"wrapper":"未公开"},{"name":"Nicaroma","color":"#8B5A2B","force":"Medium-Full","story":"该系列据Cigarworld.de称在多特蒙德举行的InterTabac 2023上发布；该零售商称其在埃斯特利与Joya de Nicaragua合作手工卷制，采用longfiller，茄衣与茄芯来自尼加拉瓜，茄套来自印尼，并自2023年九月二十五日起将5 x 52规格收入目录。2026年十月，公司页面列出三种以尺寸命名的规格：4 x 56、5 x 52和6 x 54，在其等级表上为4级（共5级）；2013年四月的一篇预览报道已经以此名称介绍了一个使用三种茄衣的系列。","vitolas":[],"wrapper":"尼加拉瓜"}]'
 WHERE `name` = 'Villiger' AND SHA1(TRIM(`gamme`)) = 'ba88f47fbf28493e52d4060456beff08e371efd5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Villiger' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'ba88f47fbf28493e52d4060456beff08e371efd5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Villiger Söhne' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Wangguan' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '28b73700d56314a7537f1a9242967b6a64ee806c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Warfighter Tobacco' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '1bab23a0ceea7ebd84d1271013dc4961ab7ba0c8';
-- brands|Warped|gamme|zh — 主语缺失补全
UPDATE `brands` SET `gamme_zh` = '[{"name":"La Colmena","color":"#A0522D","force":"Medium","story":"一个1960年前的古巴品牌名，被填入当代配方。哈拉帕烟叶、细身尺寸，口中的绵长来自原料而非力度。","vitolas":["Corona","Lancero"],"wrapper":"Corojo 99"},{"name":"Flor del Valle","color":"#8B7355","force":"Medium","story":"小批量系列，常常毫无预告地发布。木质、干草，一丝白胡椒——这正是这家公司逆着粗环径潮流所捍卫的路数。","vitolas":["Corona Gorda"],"wrapper":"Corojo 99"},{"name":"Guardian of the Farm","color":"#4A3728","force":"Medium-Full","story":"2016年——与 Aganorsa（当时叫 Casa Fernández）的合作，在对方工厂卷制：守护农场的斗牛犬，尺寸以狗的名字命名。两家公司的一条线，不是独立品牌。","vitolas":[],"wrapper":"Corojo 99"},{"name":"Cloud Hopper","color":"#3E4A6B","force":"Medium","story":"Edition One（Kyle Gellis 与其弟弟 Devin 的公司）的雪茄，在 TABSA（Tabacos Valle de Jalapa S.A.，Cigar Wars 与 Neptune Cigar 也称其为 Aganorsa Leaf）制造，据 Cigar Dojo 称仅使用 Aganorsa 的烟叶。日期说法不一：2016年低调推出，随后于2017年夏季为人所知，据 Cigar Wars；2016年初问世，据 Cigar Dojo（2017年11月10日）；2017年8月问世，此前已在 IPCPR 2017 上亮相，据 Blind Man''s Puff（2018年7月25日）。","vitolas":[],"wrapper":"Corojo 99"}]'
 WHERE `name` = 'Warped' AND SHA1(TRIM(`gamme`)) = '7f4ddb7032b5fd2de9b444bb1cd5fe996a455b78';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Warped' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '7f4ddb7032b5fd2de9b444bb1cd5fe996a455b78';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'West Tampa' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '2bfa65c376c98d555b63303e5f56ebe469f65d7a';
-- brands|Wolf & Ruhland|gamme|zh — 去除禁用字，语法
UPDATE `brands` SET `gamme_zh` = '[{"name":"Virginia","color":"#C9A96E","force":"Mild","wrapper":"未公开","vitolas":[],"story":"细长的雪茄，公司的标志——老板说它闻起来像巴伐利亚森林。"},{"name":"Toccata Torpedo","color":"#6B4226","force":"Medium","wrapper":"未公开","vitolas":[],"story":"尺寸大于其余各款，茄标是手写的。"}]'
 WHERE `name` = 'Wolf & Ruhland' AND SHA1(TRIM(`gamme`)) = '08f9ff9f36e03f39a12bd2ec3c8aedb646ff0e00';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Wolf & Ruhland' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '08f9ff9f36e03f39a12bd2ec3c8aedb646ff0e00';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Wolfertz' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '3f66687a9dce19034b688bce607ba1b3ba41075b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Xhaxhi Bobi' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '5982e297fdfbfcab7734973876dabe2d05cb0601';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Zigarren Manufaktur Dresden' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = '1a2fe2123131652661fd6e04254f71298a74a8ae';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Zino Platinum' AND `champ` = 'gamme' AND `lang` = 'zh' AND `source_hash` = 'bb6e126dd7d7fb388536220706a6158ae83a9a4e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Alec Bradley' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
-- brands|Arturo Fuente|celebrities|zh — 人名改拉丁字母
UPDATE `brands` SET `celebrities_zh` = '[{"name":"Carlos Fuente Sr.","anecdote":"据 arturofuente.com，他生于 1935年，1956年成为这家字号的唯一所有者，并于 1980年9月4日与儿子在多米尼加共和国的圣地亚哥开设 Fuente Ltd，此前尼加拉瓜（1978年）和洪都拉斯（1979年）的工厂先后失火。他于 2016年8月去世，享年81 岁；Don Carlos 系列以他的名字命名。"},{"name":"Carlos Fuente Jr.","anecdote":"人称 Carlito，1992年创制了 OpusX，这是一款多米尼加 puro 雪茄，茄衣产自博瑙附近的 Château de la Fuente，家族于九十年代初在这座农场播下了首批种子。他的姐妹 Cynthia Fuente-Suarez 是这家字号的副总裁。"}]'
 WHERE `name` = 'Arturo Fuente' AND SHA1(TRIM(`celebrities`)) = '0cfaa9068d023975b9b810f8671705536337bb11';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Arturo Fuente' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '0cfaa9068d023975b9b810f8671705536337bb11';
-- brands|Ashton|celebrities|zh — 人名拉丁化，去禁用字
UPDATE `brands` SET `celebrities_zh` = '[{"name":"Robert Levin","anecdote":"Levin 是零售商出身、后来成为品牌创建者的人：他的家族自1957年起在费城经营 Holt''s，他本人自1974年起掌管其业务，并于1985年创办 Ashton，据 holts.com 称。他起初的雪茄先在 Tabadom 制作，后来在 Fuente 制作——据他所说是从1988年起，据该公司所说则是品牌推出后不久；Ashton 雪茄如今在多米尼加共和国的 Tabacalera A. Fuente 卷制，San Cristobal 系列除外。这是一个完全建立在他人关系之上的品牌，而它从不讳言这一点。"}]'
 WHERE `name` = 'Ashton' AND SHA1(TRIM(`celebrities`)) = '42f9869244041dedc9f4263acd460dfbfd6d8fc4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ashton' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '42f9869244041dedc9f4263acd460dfbfd6d8fc4';
-- brands|Avo|celebrities|zh — 城市名应译出
UPDATE `brands` SET `celebrities_zh` = '[{"name":"Avo Uvezian","anecdote":"钢琴家兼作曲家，1926年生于贝鲁特，2017年去世，享年91岁。他声称自己创作了《Strangers in the Night》，这首歌署名为 Bert Kaempfert（维基百科）。Armenpress 援引 Men''s Journal 的报道称，他在1966年向 Sinatra 弹奏了一段旋律，Sinatra 让他更改了标题和歌词。"}]'
 WHERE `name` = 'Avo' AND SHA1(TRIM(`celebrities`)) = '5d763ecbb141e7a576fc508d9c9a825719287629';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Avo' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '5d763ecbb141e7a576fc508d9c9a825719287629';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bolivar' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Camacho' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '4d1d8e0fda69d1c14229e2706b1d030580825ef6';
-- brands|Cohiba|celebrities|zh — 品牌人名拉丁化
UPDATE `brands` SET `celebrities_zh` = '[{"name":"Fidel Castro","anecdote":"Cohiba 是为 Castro 而生的，他把它当作礼物送人：在1994年的一次访谈中，他说自己送出的主要是 Cohiba。他于1985年8月26日戒烟，当时正值一场全国性的禁烟运动，据他解释，是为了以身作则。"},{"name":"Che Guevara","anecdote":"Che Guevara 与古巴雪茄联系在一起，尤其是通过 René Burri 在1963年为 Look 杂志拍的那幅肖像。那支雪茄是品牌出现之前的哈瓦那雪茄：Cohiba 可追溯到1966年，Guevara 1965年已离开古巴，并于1967年10月9日在玻利维亚被处决。有媒体报道写道，Castro 把后来成为 Cohiba 的首批雪茄送给了他的亲信，包括 Che 在内；Habanos 的官方页面对此只字未提。"}]'
 WHERE `name` = 'Cohiba' AND SHA1(TRIM(`celebrities`)) = '03588b1e7af9f6f3bc2de78bd6dde1152bac230d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cohiba' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '03588b1e7af9f6f3bc2de78bd6dde1152bac230d';
-- brands|Cohiba USA|celebrities|zh — 品牌名改拉丁字母
UPDATE `brands` SET `celebrities_zh` = '[{"name":"Cohiba 商标诉讼","anecdote":"Cubatabaco 与 General Cigar 的纠纷自 1997年延续至今：商标局与 TTAB、纽约法院（2004、2009）、联邦第二巡回上诉法院（2005、2010）、联邦巡回上诉法院（2014）、美国联邦终审法院（2015年拒绝受理）、弗吉尼亚东区法院（2025），随后是联邦第四巡回上诉法院。"},{"name":"Jay-Z","anecdote":"说唱歌手 Shawn Carter（人称 Jay-Z）与 Cohiba 的调配团队就 Comador 合作了约两年。这是一款 6 x 52 的 toro 雪茄，茄衣为采用哈瓦那种子种植的康涅狄格烟叶，在多米尼加共和国卷制，于 2013年12月推出；Cohiba 在 2016年 Macassar 问世时将其撤下。"}]'
 WHERE `name` = 'Cohiba USA' AND SHA1(TRIM(`celebrities`)) = '7b962f1d48e08c07b24b199195997515b5ca5daf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cohiba USA' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '7b962f1d48e08c07b24b199195997515b5ca5daf';
-- brands|Cuaba|celebrities|zh — 标题留法语
UPDATE `brands` SET `celebrities_zh` = '[{"name":"泰诺人","anecdote":"行业媒体称，Cuaba 是泰诺语中一种灌木的名字，岛上居民用它来点燃雪茄；habanos.com 则认为这是克里斯托弗·哥伦布时代的一个印第安词，指一种极易燃、用于宗教仪式的灌木。1996年的这个品牌取回了这个词，用于双头异形茄。"},{"name":"Carlos Izquierdo González","anecdote":"维基百科称他是该品牌的创建者，品牌于1996年11月19日在伦敦推出；据说他仿照 Montecristo 的配方调制了混合，同一页面转述了这一说法，但没有证实。"}]'
 WHERE `name` = 'Cuaba' AND SHA1(TRIM(`celebrities`)) = 'd0288273f2dfc277b45088a03058e75645eb62f1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuaba' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = 'd0288273f2dfc277b45088a03058e75645eb62f1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dannemann' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '5932bad9139da2cb0fc69e6491ceb741067eae89';
-- brands|Davidoff|celebrities|zh — 人名拉丁字母
UPDATE `brands` SET `celebrities_zh` = '[{"name":"Zino Davidoff","anecdote":"他的家人于1911年离开基辅前往日内瓦，Henri Davidoff 在那里开了一家烟草店。Zino Davidoff 于1968年在古巴创制了首批白色烟标雪茄；据该公司称，1970年 Oettinger 集团接手了他在日内瓦的店铺。他于1994年去世。"},{"name":"Winston Churchill（致敬）","anecdote":"Oettinger Davidoff 集团于2007年取得了 Winston Churchill 之名用于雪茄的独家权利，据该公司称，该系列于2008年5月推出。"}]'
 WHERE `name` = 'Davidoff' AND SHA1(TRIM(`celebrities`)) = '7d8fa4067b1ee35805c3e0ce8e4a0fcc19673477';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Davidoff' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '7d8fa4067b1ee35805c3e0ce8e4a0fcc19673477';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Diplomáticos' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Drew Estate' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = 'bf54dbd74d91c89d0e1555e248ec5de10f6aa12b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Rey del Mundo' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '95ae8d240b382c8b2981fb5c178dee51bb46537d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Excalibur' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '6bb28ba9ff1c1e702754db29073db26b51f89670';
-- brands|Fonseca|celebrities|zh — 城市名应译出
UPDATE `brands` SET `celebrities_zh` = '[{"name":"Francisco E. Fonseca","anecdote":"Habanos 称他为 Don Francisco Fonseca，是该品牌在十九世纪末十年间的创始人，优雅而注重仪表，据说他把这一点传给了自己 Habanos 的呈现方式。维基百科引用1929年10月26日的 New York Times，称他生于曼萨尼约，1929年在哈瓦那去世。"}]'
 WHERE `name` = 'Fonseca' AND SHA1(TRIM(`celebrities`)) = '5340c1e3a54138fb52ea9af1313f4d2985d5617e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fonseca' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '5340c1e3a54138fb52ea9af1313f4d2985d5617e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'General Cigar' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'H. Upmann' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '65b95cfdd7d1c1d01ced1a1d00d136375ab1aa99';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Hoyo de Monterrey' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = 'bcd23c2ce00902f7f6a433b09978fe031bf89e86';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Joya de Nicaragua' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = 'c2d230a082b813679d7595681cf14a985ea7068a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Flor Dominicana' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Gloria Cubana' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '6a8368b58323510764a6bc82a2a4b7e06cdfe2db';
-- brands|Liga Privada|celebrities|zh — 措辞笔误修正
UPDATE `brands` SET `celebrities_zh` = '[{"name":"Steve Saka","anecdote":"当时的 Drew Estate 负责人，与 Jonathan Drew 和 Nicholas Melillo 一起主导了 Liga Privada 的调配工作（Cigar Dojo，2018年）。他于2013年7月离开该厂（Cigar Coop）。"},{"name":"Jonathan Drew","anecdote":"Drew Estate 的联合创始人，被列为 Liga Privada 的创制者之一（Cigar Dojo，2018年）。在2021年7月29日的新闻稿中，他称 Papas Fritas 一入口便十分圆润。"}]'
 WHERE `name` = 'Liga Privada' AND SHA1(TRIM(`celebrities`)) = '8e511add512ef54543b597148e7e24265cfae9bf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Liga Privada' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '8e511add512ef54543b597148e7e24265cfae9bf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Macanudo' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '0be807a85e820020e07eab7bc42b7bef49c75b05';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Montecristo' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = 'ef78d8b23419876591a8bfab73293d1ce4706dd3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'My Father' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '1c811375200ae103abba812b0d8b96460979282e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oliva' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '2e24aa414d51b423774d80f9a19147811116cc87';
-- brands|Padrón|celebrities|zh — 人名拉丁字母
UPDATE `brands` SET `celebrities_zh` = '[{"name":"José Orlando Padrón","anecdote":"1926年6月10日生于比那尔德里奥地区，据 padron.com，他于 1961年4月离开哈瓦那，1962年2月抵达迈阿密，并于 1964年9月开办 Padrón Cigars。总部仍留在迈阿密，生产则于 1970年迁往尼加拉瓜的埃斯特利。他于 2017年12月去世，享年91 岁；据行业媒体称，他的儿子 Jorge（1991年进入公司）在 2021年11月掌管着公司。"}]'
 WHERE `name` = 'Padrón' AND SHA1(TRIM(`celebrities`)) = 'f4be1e42e8cfe4078a6a272813641bf4f925c592';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Padrón' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = 'f4be1e42e8cfe4078a6a272813641bf4f925c592';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Partagás' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Partagás USA' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
-- brands|Perdomo|celebrities|zh — 人名拉丁字母
UPDATE `brands` SET `celebrities_zh` = '[{"name":"Nick Perdomo","anecdote":"Nick Perdomo Jr. 原是迈阿密机场的空中交通管制员，据行业媒体（2001年）与维基百科，他于1992年8月开设 Nick''s Cigar Co.，并未辞去工作。"}]'
 WHERE `name` = 'Perdomo' AND SHA1(TRIM(`celebrities`)) = 'afaaa1487e24cda378a813ea45b073737a731df5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Perdomo' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = 'afaaa1487e24cda378a813ea45b073737a731df5';
-- brands|Plasencia|celebrities|zh — 人名拉丁字母
UPDATE `brands` SET `celebrities_zh` = '[{"name":"Néstor Plasencia","anecdote":"该厂将他称为第四代（Néstor Plasencia Fernández），他于1986年接手家族的烟草业务（Cigars Direct，2020年）。该厂把 José Luis、Gustavo、Alina 和 Néstor Andrés Plasencia 称为第五代。它自称通过种植与制造两方面把控品质。"}]'
 WHERE `name` = 'Plasencia' AND SHA1(TRIM(`celebrities`)) = '8883ec2cfff1cd7103be23f7c8e87791e85abc44';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Plasencia' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '8883ec2cfff1cd7103be23f7c8e87791e85abc44';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Por Larrañaga' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '76cac516952f69294b3282c41cfcbd42fbb250a5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Punch' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = 'd331d314beef4c02ab087b114c79d8fc7ef5f2a2';
-- brands|Quai d'Orsay|celebrities|zh — 标题留法语
UPDATE `brands` SET `celebrities_zh` = '[{"name":"Seita","anecdote":"这个品牌1973年诞生于 Cubatabaco，应法国烟草专卖机构 Seita 之请（Seita 曾是该品牌在法国的经销商）；名字指向一处巴黎地址（行业媒体称是塞纳河沿岸的码头；维基百科在大道、外交部与 Seita 总部之间犹疑）。"}]'
 WHERE `name` = 'Quai d''Orsay' AND SHA1(TRIM(`celebrities`)) = '3817b52830ea8e9a7748357ea6e32fe0f58e206e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Quai d''Orsay' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '3817b52830ea8e9a7748357ea6e32fe0f58e206e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Quintero' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rafael González' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '9f22b9115cb05112212461452aef7d7082e7f9a9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ramón Allones' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = 'ef3e67d58e3c935c207ecac706f87c164f6c9f68';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rocky Patel' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
-- brands|Romeo y Julieta|celebrities|zh — 人名拉丁字母
UPDATE `brands` SET `celebrities_zh` = '[{"name":"Winston Churchill","anecdote":"Habanos 写道，Winston Churchill 是这个品牌格外忠实的烟客之一：自1946年访问哈瓦那起，他的名字被用在了某些茄标上，也成了 Churchills 规格的名称，该规格在这个品牌中知名度居首。据行业媒体（1995年），他于1895年11月抵达哈瓦那，对雪茄的热情正是在加勒比地区真正开始的，Romeo y Julieta 是他偏爱的品牌之一，他通常每天抽八到十支雪茄。各来源对这一规格名称的年代说法不一：有人说是1940年代末，也有人说是1950年代（行业媒体，2018年）。"}]'
 WHERE `name` = 'Romeo y Julieta' AND SHA1(TRIM(`celebrities`)) = 'fd2fbab8ae38255dafa0b9a4337d4806e384a63b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Romeo y Julieta' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = 'fd2fbab8ae38255dafa0b9a4337d4806e384a63b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Romeo y Julieta USA' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
-- brands|San Cristóbal de La Habana|celebrities|zh — 标题留法语
UPDATE `brands` SET `celebrities_zh` = '[{"name":"哈瓦那本身","anecdote":"1999年的这个品牌沿用了这座城市的原名，据品牌方页面可追溯到1519年，其首批四款规格以哈瓦那的要塞命名：El Morro、La Fuerza、La Punta、El Príncipe。"}]'
 WHERE `name` = 'San Cristóbal de La Habana' AND SHA1(TRIM(`celebrities`)) = '4e111824b8b96193437afc128450cd235ff16711';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'San Cristóbal de La Habana' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '4e111824b8b96193437afc128450cd235ff16711';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Sancho Panza' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Santa Damiana' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacalera' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Te Amo' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '50e50d1ba379bcf888a9cd31bbef18c7b107badc';
-- brands|Trinidad|celebrities|zh — 人名拉丁字母
UPDATE `brands` SET `celebrities_zh` = '[{"name":"Fidel Castro","anecdote":"Habanos 的品牌页面没有点他的名：它只写道，Trinidad 长期只用作赠送外国高级要人的国礼。行业媒体（2019年）写道，这种雪茄不是为销售而做，而是由 Fidel Castro 用来赠送的。据维基百科，曾任 El Laguito 负责人的 Avelino Lara 在1992年说，只有 Castro 被允许赠送它；Castro 说过自己只送过 Cohiba，并在自传中说他对 Trinidad 所知甚少。"}]'
 WHERE `name` = 'Trinidad' AND SHA1(TRIM(`celebrities`)) = 'f2f0cd6900f0bf53b9f6316f4e75188e8cdb5df2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Trinidad' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = 'f2f0cd6900f0bf53b9f6316f4e75188e8cdb5df2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vegas Robaina' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = 'a496c07f9b279e1c4e307aab5f3660c908c7d3b3';
-- brands|Villiger|celebrities|zh — 人名拉丁字母
UPDATE `brands` SET `celebrities_zh` = '[{"name":"Heinrich Villiger","anecdote":"1950年进入家族企业，1954年接替 Hans，直至2025年7月25日去世（享年95岁）一直担任 Villiger Söhne 董事会主席（公司历史页面；zigarren.zone）。"}]'
 WHERE `name` = 'Villiger' AND SHA1(TRIM(`celebrities`)) = '74ca6e37da814ec9cc9fbb7e283164c507ed95e4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Villiger' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '74ca6e37da814ec9cc9fbb7e283164c507ed95e4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Zino Platinum' AND `champ` = 'celebrities' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'A.J. Fernandez' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'd82e7ef776cd7010280c1a86703e68a60807fc82';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Aganorsa Leaf' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'd7f9bb831b2f920044bc34ee1b7ac4a5c708d515';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Aladino' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'cea6b19f4bd8a9bc730a6e999a627724aba84512';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Alec Bradley' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '52107d27435a7aaa176deee91adf6259893c05be';
-- brands|Alhambra|pairings|zh — 去除禁用字
UPDATE `brands` SET `pairings_zh` = '[{"type":"其他","name":"乌龙茶","notes":"显而易见、也格外恰当的亚洲搭配：茶的草本感顺着烟叶的干爽而行。"},{"type":"烈酒","name":"菲律宾朗姆","notes":"甜而轻盈，圆润了本就偏胡椒感的风格。"}]'
 WHERE `name` = 'Alhambra' AND SHA1(TRIM(`pairings`)) = '709c1142bedea6e9cc84dc9038251d2c3586cf51';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Alhambra' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '709c1142bedea6e9cc84dc9038251d2c3586cf51';
-- brands|Arturo Fuente|pairings|zh — 年份单位残留英文
UPDATE `brands` SET `pairings_zh` = '[{"type":"烈酒","name":"Rémy Martin XO Cognac","notes":"一杯 XO 干邑与 Añejo 系列相呼应，这家字号写道，该系列的马杜罗茄衣在干邑桶中陈化：这是相似而非对比的搭配。"},{"type":"葡萄酒","name":"Napa Valley Cabernet 10年","notes":"加州赤霞珠的力道足以与 Opus X 抗衡，却不会压过它。这是势均力敌的一次搭配。"},{"type":"咖啡","name":"Panama Gesha","notes":"巴拿马瑰夏的花香特质，不加糖饮用，与 OpusX 形成轻盈的对照。"}]'
 WHERE `name` = 'Arturo Fuente' AND SHA1(TRIM(`pairings`)) = 'c457ac10e435e338ce87ad6264088927888d9ae0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Arturo Fuente' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'c457ac10e435e338ce87ad6264088927888d9ae0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Arturo Fuente Hemingway' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Arturo Fuente Maduro' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
-- brands|Ashton|pairings|zh — 品牌改拉丁，年份
UPDATE `brands` SET `pairings_zh` = '[{"type":"香槟","name":"Perrier-Jouët Belle Époque","notes":"Perrier-Jouët 那份花香的细腻，与 Cabinet Selection 奶油般的优雅相伴，是一场极致精致的搭配。"},{"type":"威士忌","name":"Glenfiddich 18年","notes":"Glenfiddich 的梨与核桃气息，与 Ashton Classic 那份榛果般的柔和相互应和。"}]'
 WHERE `name` = 'Ashton' AND SHA1(TRIM(`pairings`)) = 'e420a1bdb1031b68a5545b2c513e6fe316360216';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ashton' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'e420a1bdb1031b68a5545b2c513e6fe316360216';
-- brands|Ashton Cabinet|pairings|zh — 品牌改拉丁字母
UPDATE `brands` SET `pairings_zh` = '[{"type":"香槟","name":"Billecart-Salmon 白中白","notes":"香槟区霞多丽的纯净，伴随 Ashton Cabinet 的厄瓜多尔式细腻，构成一种极致优雅的呼应。"}]'
 WHERE `name` = 'Ashton Cabinet' AND SHA1(TRIM(`pairings`)) = '829ef160562f7f67d2052c53185c1370eb29d943';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ashton Cabinet' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '829ef160562f7f67d2052c53185c1370eb29d943';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Atabey' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '9e5627f13de93a55ceb8c2dd3a2b8d52539d62df';
-- brands|Avo|pairings|zh — 类型词未翻译
UPDATE `brands` SET `pairings_zh` = '[{"type":"爵士乐","name":"Miles Davis, Kind of Blue","notes":"为 Classic 系列营造氛围的建议，与该品牌并无文献可查的关联。"},{"type":"咖啡","name":"Barahona 产多米尼加咖啡","notes":"建议：柔和的咖啡搭配劲道轻至中等的系列，不会盖过它。"},{"type":"烈酒","name":"年轻干邑","notes":"建议：为 XO 系列配一款柔顺的干邑。"}]'
 WHERE `name` = 'Avo' AND SHA1(TRIM(`pairings`)) = 'db02ba814963d87e6f9643ef742d0caa84e67b8b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Avo' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'db02ba814963d87e6f9643ef742d0caa84e67b8b';
-- brands|Baccarat|pairings|zh — 去禁用字，tête误译
UPDATE `brands` SET `pairings_zh` = '[{"type":"咖啡","name":"加糖的欧蕾咖啡","notes":"显而易见的搭配，对一支坦然承认自己甜的雪茄而言也格外诚实。"},{"type":"其他","name":"奶红茶","notes":"不含酒精，能托住甜美的开头而不使之加倍。"}]'
 WHERE `name` = 'Baccarat' AND SHA1(TRIM(`pairings`)) = '3f2a16ebf48b7e8856be55ba07ff74c772ccb4cd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Baccarat' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '3f2a16ebf48b7e8856be55ba07ff74c772ccb4cd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bandolero' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '176ceefda33e8b8883e7ee414f63d72b73b3d71a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bering' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'fe813355a68aa64409237efefd9afc4b574845b6';
-- brands|Bolivar|pairings|zh — 名称英法混杂
UPDATE `brands` SET `pairings_zh` = '[{"type":"烈酒","name":"瓦哈卡手工梅斯卡尔","notes":"梅斯卡尔的烟熏与土气，与 Bolívar 的大地属性彼此共鸣。这是一次大胆的搭配，留给老烟客。"},{"type":"咖啡","name":"埃塞俄比亚日晒处理咖啡","notes":"日晒处理咖啡那股果香与发酵气息，能缓和 Bolívar 的粗粝力度。一次出人意料的搭配。"},{"type":"啤酒","name":"Imperial Stout 12%","notes":"帝国世涛的浓烈能与 Belicosos Finos 分庭抗礼。适合寒冷季节的搭配。"}]'
 WHERE `name` = 'Bolivar' AND SHA1(TRIM(`pairings`)) = '5f89666cb85a9badcc84c3d02fcee9c47809d9c2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bolivar' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '5f89666cb85a9badcc84c3d02fcee9c47809d9c2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Byron' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'a89a46482814c8a88881300d3f0a1e447b40a6d1';
-- brands|Camacho|pairings|zh — 名称残留英文
UPDATE `brands` SET `pairings_zh` = '[{"type":"波旁威士忌","name":"Bulleit Bourbon","notes":"这款黑麦比例高的波本，辛辣而干，与洪都拉斯的 Corojo 自然相合。两者共有胡椒的气息。"},{"type":"啤酒","name":"精酿波特啤酒","notes":"美式波特啤酒那份巧克力般的厚度，补足了 Camacho Corojo 的焦咖啡气息。"}]'
 WHERE `name` = 'Camacho' AND SHA1(TRIM(`pairings`)) = '3ea08238ca0a9c876946f51d761a1c3bc48ff15e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Camacho' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '3ea08238ca0a9c876946f51d761a1c3bc48ff15e';
-- brands|CAO|pairings|zh — 名称残留英文
UPDATE `brands` SET `pairings_zh` = '[{"type":"咖啡","name":"土耳其咖啡","notes":"向创始人的伊斯坦布尔出身致意：浓稠而强烈的咖啡，与一支浓郁的雪茄相配。"}]'
 WHERE `name` = 'CAO' AND SHA1(TRIM(`pairings`)) = '7573edd93163544f5e4c20b645de0c9f770a5bc3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '7573edd93163544f5e4c20b645de0c9f770a5bc3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO America' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO Black' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO Cameroon' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Capitol' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
-- brands|Casa Turrent|pairings|zh — 去除禁用字
UPDATE `brands` SET `pairings_zh` = '[{"type":"烈酒","name":"陈酿龙舌兰","notes":"陈酿龙舌兰的木质感承得住 1880 的力度，又不会掩盖它。"},{"type":"咖啡","name":"韦拉克鲁斯咖啡","notes":"与烟叶生长在同一片山坡：再在地不过的搭配。"}]'
 WHERE `name` = 'Casa Turrent' AND SHA1(TRIM(`pairings`)) = 'db1283f2678906e8b4a73e9b08afc99344090bc6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa Turrent' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'db1283f2678906e8b4a73e9b08afc99344090bc6';
-- brands|Casdagli|pairings|zh — single malt ajouté
UPDATE `brands` SET `pairings_zh` = '[{"name":"无泥煤麦芽威士忌","type":"烈酒","notes":"一家以克制见长的老号，受不了张扬的酒。没有泥煤的麦芽威士忌才留得出余地。"},{"name":"哥斯达黎加咖啡","type":"咖啡","notes":"这是地点的搭配，而非风土的搭配：这支雪茄之所以属于哥斯达黎加，靠的是作坊而不是烟叶——咖啡才是真正属于这里的。"}]'
 WHERE `name` = 'Casdagli' AND SHA1(TRIM(`pairings`)) = 'd28bc5b356d2d2ba03c5ee58bc549a728dbd4ca9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casdagli' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'd28bc5b356d2d2ba03c5ee58bc549a728dbd4ca9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cohiba' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '074f1ece254c04bddebed59bcc6cace8b19d4f95';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cohiba USA' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'fec3226cae5468f95181397ad39a0bb111a47858';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Crowned Heads' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '446e224d80be8c2ed5d45ea5f025fc138cf3c742';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuaba' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'b708999b636e1a8562ff209d0218b2e95e180298';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dannemann' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'dfe477fcd264c164245963eb69628e60da63fad8';
-- brands|Davidoff|pairings|zh — marques en alphabet latin
UPDATE `brands` SET `pairings_zh` = '[{"type":"香槟","name":"Dom Pérignon 2013","notes":"Dom Pérignon 的细腻与复杂，以同等的优雅陪伴 Davidoff 的轻盈系列。"},{"type":"威士忌","name":"Dalmore King Alexander III","notes":"Dalmore 经雪莉桶熏陶的丰厚，与 Winston Churchill 系列相得益彰——两份献给英国式恢弘的致敬。"},{"type":"咖啡","name":"短萃、低酸的意式浓缩咖啡","notes":"一杯短萃、低酸的意式浓缩咖啡很适合在餐末搭配雪茄，也适合 Nicaragua 这类更浓烈的系列。"}]'
 WHERE `name` = 'Davidoff' AND SHA1(TRIM(`pairings`)) = '16ba524a1026573b06d2d8a75d23e8d0f9ffe3de';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Davidoff' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '16ba524a1026573b06d2d8a75d23e8d0f9ffe3de';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Diplomáticos' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '52014876e5b9397dff6a103f73c6e2f1074dfbf7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Diego' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '4ff0ea66bde36e60f90d27e09b68afd6ad4735ef';
-- brands|Dona Flor|pairings|zh — retrait du superlatif
UPDATE `brands` SET `pairings_zh` = '[{"type":"烈酒","name":"优质卡莎萨","notes":"堪称在地搭配的典范，也是唯一真正跟得上马塔菲纳酸度的一种。"},{"type":"其他","name":"新鲜热带果汁","notes":"不含酒精：果汁的酸度与烟叶的酸度相合。"}]'
 WHERE `name` = 'Dona Flor' AND SHA1(TRIM(`pairings`)) = '7c20b602061d913499a6ef6a1bce5e96ec4a892c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dona Flor' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '7c20b602061d913499a6ef6a1bce5e96ec4a892c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Drew Estate' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '7ed7a97b369de2a590acc2c373aab65ee5363f17';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'E.P. Carrillo' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '68991e77a25288c404bbee25036bcf952c162651';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Rey del Mundo' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '872a7af861292ce3d595814a5ab62b1f7b790799';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Titan de Bronze' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '42b92cd5f8fd393c7080b8dee2c07fa73fd79c65';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Espinosa' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '25bbfdb1411908d1fed9206460d295f045d330c3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Excalibur' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Flor de Selva' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'a5718fce46cc771c2bff39a31896a07ab5ab1f8c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fonseca' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'a92a3f9e833cfa0adeeed5339ffe7a6fd1ea1c13';
-- brands|Foundation Cigar Company|pairings|zh — nom de vitola traduit
UPDATE `brands` SET `pairings_zh` = '[{"type":"烈酒","name":"中美洲陈年朗姆","notes":"配方中的红糖在这里得到直接的延续。"},{"type":"其他","name":"干型农家苹果酒","notes":"配 Charter Oak 时，苹果酒的酸度减轻宽叶茄衣的土感。"}]'
 WHERE `name` = 'Foundation Cigar Company' AND SHA1(TRIM(`pairings`)) = '87a816a9c5ecb3c139fb2aef7c1fa0e59f3987f0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Foundation Cigar Company' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '87a816a9c5ecb3c139fb2aef7c1fa0e59f3987f0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'General Cigar' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'H. Upmann' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'd5630d5c17197c62a49d116b7069b9f5c1b1037f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Hoyo de Monterrey' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '13ee4c899778f66f1cb59ebc7e91eaf3f9949faa';
-- brands|Hoyo de Monterrey Honduras|pairings|zh — nom de produit traduit
UPDATE `brands` SET `pairings_zh` = '[{"type":"烈酒","name":"波本威士忌","notes":"波本的香草柔化了这款有意粗犷的配方。"},{"type":"咖啡","name":"浓黑咖啡","notes":"配 Excalibur 时，烘焙感提起了浅色茄衣。"}]'
 WHERE `name` = 'Hoyo de Monterrey Honduras' AND SHA1(TRIM(`pairings`)) = 'b22af74c5fce305f17ccd415eb60349b4d78657e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Hoyo de Monterrey Honduras' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'b22af74c5fce305f17ccd415eb60349b4d78657e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Illusione' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '6a04bd541a1152784815ae4db8aea71f7d0f5b3e';
-- brands|J.C. Newman|pairings|zh — superlatif retiré
UPDATE `brands` SET `pairings_zh` = '[{"type":"烈酒","name":"肯塔基波本","notes":"波本的玉米与香草，配上康涅狄格茄衣：堪称典型的美式呼应。"},{"type":"咖啡","name":"坦帕古巴咖啡","notes":"是伊博城发明了它；没有什么比它更适合配 El Reloj。"}]'
 WHERE `name` = 'J.C. Newman' AND SHA1(TRIM(`pairings`)) = 'e70cc0583ede440eb764e76ec0557aca0866e143';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'J.C. Newman' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'e70cc0583ede440eb764e76ec0557aca0866e143';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'José L. Piedra' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '242b0d5520d1be0b50b0f31af4d4031b78f35664';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Joya de Nicaragua' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '622668e5055d6c669b1412fa7a394dc0b7df1b63';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Juan Clemente' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '999dfdde018ff3db30ecc2b1aa93f21189300b5d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Juan López' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '6788401e246653abfc05a5781256bb026e5d14f0';
-- brands|La Aurora|pairings|zh — superlatif retiré
UPDATE `brands` SET `pairings_zh` = '[{"type":"咖啡","name":"锡瓦奥谷多米尼加咖啡","notes":"同一座山谷，同一片土地：再直接不过的一种呼应。"},{"type":"烈酒","name":"12年多米尼加朗姆","notes":"雪茄的烤榛子气息在橡木桶中找到确切的延续。"}]'
 WHERE `name` = 'La Aurora' AND SHA1(TRIM(`pairings`)) = '701dd2838911362c63eeb197ffaf2743dedb63f3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Aurora' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '701dd2838911362c63eeb197ffaf2743dedb63f3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Flor de Cano' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'c8e72b79bcd140b27858e4545d5fc5d4efe0cfab';
-- brands|La Flor de Copán|pairings|zh — superlatif retiré
UPDATE `brands` SET `pairings_zh` = '[{"type":"咖啡","name":"科潘咖啡","notes":"该地区出产的是全国上好的咖啡之一：这份呼应只隔几公里。"},{"type":"烈酒","name":"洪都拉斯朗姆","notes":"甘蔗糖与泥土：两种彼此支撑的调子。"}]'
 WHERE `name` = 'La Flor de Copán' AND SHA1(TRIM(`pairings`)) = '6c7bf9f62bb3e471c38196d4109458a55dc6df65';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Flor de Copán' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '6c7bf9f62bb3e471c38196d4109458a55dc6df65';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Flor Dominicana' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Gloria Cubana' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'a6bb522880498401144ddfab60cef308c01caa1b';
-- brands|Liga Privada|pairings|zh — noms erronés, superlatifs
UPDATE `brands` SET `pairings_zh` = '[{"type":"啤酒","name":"美式帝国世涛","notes":"再自然不过的搭配——帝国世涛的咖啡与黑巧克力气息，与 No.9 的风格严丝合缝。属于美式吧台的搭配。"},{"type":"威士忌","name":"Pappy Van Winkle 15年","notes":"极为稀有的美国波本，配极为稀有的美国雪茄。收藏家式的搭配——两样都得排队。"},{"type":"咖啡","name":"Cold Brew 24小时","notes":"冷萃咖啡酸度低于浓缩，能让 No.9 里通常被焙烤咖啡香掩住的果味显露出来。"}]'
 WHERE `name` = 'Liga Privada' AND SHA1(TRIM(`pairings`)) = '935a09c5daf44e6fa200bdbc2e17d55f12b999c4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Liga Privada' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '935a09c5daf44e6fa200bdbc2e17d55f12b999c4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Macanudo' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'e2ccaf8e748020e4996fac9c44becca49e7d5cd6';
-- brands|Matacan|pairings|zh — superlatif retiré
UPDATE `brands` SET `pairings_zh` = '[{"type":"烈酒","name":"年轻梅斯卡尔","notes":"同一产区的两样产物，同样坦然的粗粝。"},{"type":"咖啡","name":"韦拉克鲁斯咖啡","notes":"生长在毗邻的山坡上：再短不过的搭配。"}]'
 WHERE `name` = 'Matacan' AND SHA1(TRIM(`pairings`)) = '0633ab577e7783e800ed40c91860594e20308479';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Matacan' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '0633ab577e7783e800ed40c91860594e20308479';
-- brands|Matilde|pairings|zh — superlatif retiré
UPDATE `brands` SET `pairings_zh` = '[{"type":"咖啡","name":"多米尼加咖啡","notes":"近邻式的呼应，对一款以平衡为骨架的配方而言也再贴切不过。"},{"type":"烈酒","name":"少糖的陈年朗姆","notes":"配 Oscura 时，干型朗姆可避免过度强调可可。"}]'
 WHERE `name` = 'Matilde' AND SHA1(TRIM(`pairings`)) = '4867501c32367daec13489345c5248158f305c17';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Matilde' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '4867501c32367daec13489345c5248158f305c17';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Meerapfel' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '527cb0396127dfa5b0017dc81f6118eb802e76cd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Mombacho' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '33fc99eb90ae3e19908da0018e69133094725210';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Montecristo' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '78cd9b4a4ae21454eb256e958af3947a1ca10e48';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Montecristo Dominicain' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'bbc46832a377040ad4e11371a6d9176a9f5bc978';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Montecruz' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '84d39aeccb8bc50822ba0cc8bb63607b6a4c4f76';
-- brands|My Father|pairings|zh — ans resté en years
UPDATE `brands` SET `pairings_zh` = '[{"type":"朗姆酒","name":"Ron Flor de Caña Centenario 25年","notes":"陈年的尼加拉瓜朗姆：与埃斯特利的雪茄是风土上的呼应，围绕可可与甘蔗的气息。"},{"type":"咖啡","name":"Nicaraguan Jinotega single origin","notes":"来自希诺特加、位于该国北部的咖啡；其黑色水果与可可气息与浓郁的配方相契合。"}]'
 WHERE `name` = 'My Father' AND SHA1(TRIM(`pairings`)) = '0d5edd5be188c0478c526b4f8b0f32010aea783d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'My Father' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '0d5edd5be188c0478c526b4f8b0f32010aea783d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Nat Sherman' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '3a5717cfa4cb26ece6d8a6b1e3871ba6851b2f3f';
-- brands|Oliva|pairings|zh — superlatif retiré
UPDATE `brands` SET `pairings_zh` = '[{"type":"威士忌","name":"Buffalo Trace Bourbon","notes":"美国波本，带着香草与烘烤橡木的气息，恰好衬住 Serie V Melanio 那股辛辣的力道。"},{"type":"啤酒","name":"Nicaraguan Toña Cerveza","notes":"当地啤酒，清爽轻盈，是尼加拉瓜再日常不过的搭配——一天收工时的那一口，就在种植区里。"}]'
 WHERE `name` = 'Oliva' AND SHA1(TRIM(`pairings`)) = '18242ba5e6489a5bddeb7d6dd8e154092cebed95';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oliva' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '18242ba5e6489a5bddeb7d6dd8e154092cebed95';
-- brands|Oliva Connecticut Reserve|pairings|zh — formule interdite remplacée
UPDATE `brands` SET `pairings_zh` = '[{"type":"咖啡","name":"欧蕾咖啡","notes":"经典的晨间搭配——Connecticut Reserve 奶润的柔和，配一杯加奶咖啡。周末的头一支雪茄。"}]'
 WHERE `name` = 'Oliva Connecticut Reserve' AND SHA1(TRIM(`pairings`)) = 'faa2c67041af561606e2a63cfaf33eeb3b53cc82';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oliva Connecticut Reserve' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'faa2c67041af561606e2a63cfaf33eeb3b53cc82';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oliva Serie G' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
-- brands|Padrón|pairings|zh — ans non traduit, marque
UPDATE `brands` SET `pairings_zh` = '[{"type":"烈酒","name":"Ron Flor de Caña 18年","notes":"一款陈年的尼加拉瓜朗姆酒，配用尼加拉瓜烟叶卷制的雪茄：这是同国搭配，可净饮或加一块冰。"},{"type":"威士忌","name":"Macallan Sherry Oak 18年","notes":"Macallan 的雪莉酒延续了马杜罗茄衣的甜润风味：建议与马杜罗版 1964 Anniversary 搭配。"},{"type":"咖啡","name":"Nicaragua Single Origin","notes":"一款来自尼加拉瓜的单一产地咖啡，苦味不重，与同一产地的雪茄相配：同国搭配，比烈酒更轻盈。"}]'
 WHERE `name` = 'Padrón' AND SHA1(TRIM(`pairings`)) = '78bc8b86a13eef9d711a16dae55c1a120c7d5fde';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Padrón' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '78bc8b86a13eef9d711a16dae55c1a120c7d5fde';
-- brands|Partagás|pairings|zh — noms laissés en anglais
UPDATE `brands` SET `pairings_zh` = '[{"type":"烈酒","name":"Armagnac Bas-Armagnac 20年","notes":"陈年雅文邑那种泥土般的厚度，与 Serie D 粗犷有力的一面相互呼应。这是给行家的搭配。"},{"type":"啤酒","name":"爱尔兰波特","notes":"出人意料，却厉害——爱尔兰世涛那股焙烤谷物的味道，把 Serie D 的可可气息放大了。"},{"type":"茶","name":"10年陈普洱","notes":"发酵的普洱，带着泥土气与深度，可以作为 Partagás 的一种茶配：两者都在泥土气息这一音区里做文章。"}]'
 WHERE `name` = 'Partagás' AND SHA1(TRIM(`pairings`)) = 'ca7f2f61681f737e8e1bffbce24541135bbf7c34';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Partagás' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'ca7f2f61681f737e8e1bffbce24541135bbf7c34';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Partagás USA' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'e7c6f3a7c930172fb9adcd2290bef27276bf0150';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'PDR Cigars' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'b2f2a5f511482ccda20ccde5cf83aa19054b7853';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Perdomo' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'e045115ae01c04e2f2b81a29206fc5b3e1f0e119';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Perdomo Legacy Connecticut' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
-- brands|Plasencia|pairings|zh — ans resté en years
UPDATE `brands` SET `pairings_zh` = '[{"type":"朗姆酒","name":"Flor de Caña 25年","notes":"搭配建议：一款陈年的尼加拉瓜朗姆酒，配 Alma Fuerte 这支尼加拉瓜雪茄。"},{"type":"咖啡","name":"马尔卡拉咖啡（洪都拉斯）","notes":"搭配建议：一款洪都拉斯马尔卡拉的咖啡，配 Cosecha 这支来自洪都拉斯的雪茄。"}]'
 WHERE `name` = 'Plasencia' AND SHA1(TRIM(`pairings`)) = '7e487853b0fbae9e98b80a62d41f2fa492d3d55a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Plasencia' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '7e487853b0fbae9e98b80a62d41f2fa492d3d55a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Por Larrañaga' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'cb23d1d194fa2965541bd37d147f77087e8b366c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Punch' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '069ae1621f8dfd2f7f7603b17590d5e1865466ff';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Punch Honduras' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'f3577aa51ddaa5cd8f51b8f708b37cb9b15e9f52';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Quai d''Orsay' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '130f90f456287a7b2a3176bac667c45fa69dca61';
-- brands|Quesada|pairings|zh — superlatif retiré
UPDATE `brands` SET `pairings_zh` = '[{"type":"烈酒","name":"西班牙白兰地","notes":"白兰地的圆润顺应多米尼加式的平衡，而非扰乱它。"},{"type":"咖啡","name":"锡瓦奥谷多米尼加咖啡","notes":"与工厂同处一谷：再短不过的呼应。"}]'
 WHERE `name` = 'Quesada' AND SHA1(TRIM(`pairings`)) = '7c4132c9a6522c228e003f420da88af8853cb25f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Quesada' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '7c4132c9a6522c228e003f420da88af8853cb25f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Quintero' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'a8cd15e0c28597dc08fe41ad972a6e648478a49b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rafael González' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'bac6ed00d0f8aebb9393d6819f506407cb2700ae';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ramón Allones' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'b826f016c90f1ca8f3432d9abf60f1a2794dd8b2';
-- brands|Rocky Patel|pairings|zh — marque latine, nom traduit
UPDATE `brands` SET `pairings_zh` = '[{"type":"波旁威士忌","name":"Maker''s Mark","notes":"Maker''s Mark 那款柔和带香草的波本，与 Vintage 系列极为相配——两样东西都把陈化当作长处，却都不咄咄逼人。"},{"type":"葡萄酒","name":"阿根廷马尔贝克","notes":"马尔贝克那种带果味与香料的骨架，与 Fifty Years 的风格颇为相衬。一场美洲的对饮。"}]'
 WHERE `name` = 'Rocky Patel' AND SHA1(TRIM(`pairings`)) = 'b1f7b4da318ec028bee3c7d36758dcd928380931';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rocky Patel' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'b1f7b4da318ec028bee3c7d36758dcd928380931';
-- brands|Romeo y Julieta|pairings|zh — ans resté en years
UPDATE `brands` SET `pairings_zh` = '[{"type":"香槟","name":"Bollinger R.D.","notes":"为 Churchills（47 x 178 毫米）推荐的搭配，所属品牌被 Habanos 描述为口味中等的经典 Habano。"},{"type":"威士忌","name":"Springbank 12年","notes":"为 Wide Churchills（环径 55 x 130 毫米）推荐的搭配，所属品牌被 Habanos 描述为口味中等。"},{"type":"茶","name":"Darjeeling First Flush","notes":"为 Petit Churchills（环径 50 x 102 毫米）推荐的搭配，据 Habanos 可抽约二十分钟。"}]'
 WHERE `name` = 'Romeo y Julieta' AND SHA1(TRIM(`pairings`)) = 'ae60a97cc30201e8cf00bc806e85b8ff69eb9c31';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Romeo y Julieta' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'ae60a97cc30201e8cf00bc806e85b8ff69eb9c31';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Romeo y Julieta Dominicain' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '253da7fb51d8a3784672a5a5f2a25f3c3b8f3456';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Romeo y Julieta USA' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
-- brands|Royal Jamaica|pairings|zh — superlatif retiré
UPDATE `brands` SET `pairings_zh` = '[{"type":"咖啡","name":"牙买加蓝山","notes":"加勒比无比精致的咖啡，产地距那座被毁的工厂不过数公里。"},{"type":"烈酒","name":"牙买加陈年朗姆","notes":"本地朗姆强劲的酯香唤醒一款有意低调的配方。"}]'
 WHERE `name` = 'Royal Jamaica' AND SHA1(TRIM(`pairings`)) = '27fe0f7602991efff6018b8d2543f6abde1db19c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Royal Jamaica' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '27fe0f7602991efff6018b8d2543f6abde1db19c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Saint Luis Rey' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '1ded2d9b4018042b2cabe901d4f0cc5c1b99f789';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'San Cristóbal de La Habana' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '5daa50f6c7ace1a6c03f828e02dec464bbae9aba';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Sancho Panza' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '55c30ff7119d4a5d6463f7e7dc142fd1ab7c490b';
-- brands|Santa Clara 1830|pairings|zh — superlatif retiré
UPDATE `brands` SET `pairings_zh` = '[{"type":"烈酒","name":"梅斯卡尔","notes":"梅斯卡尔的烟熏与圣安德烈斯的土壤，来自同一片火山景观。"},{"type":"其他","name":"墨西哥肉桂巧克力","notes":"茄衣的可可在这里得到再直接不过的延续。"}]'
 WHERE `name` = 'Santa Clara 1830' AND SHA1(TRIM(`pairings`)) = '709f843efc1ddffe4425148d3a0ee103a1107de8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Santa Clara 1830' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '709f843efc1ddffe4425148d3a0ee103a1107de8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Santa Damiana' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Suerdieck' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '367ec3b9a2e5bc29726af2de62b9bba0c36b56b9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacalera' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
-- brands|Taru Martani|pairings|zh — superlatif retiré
UPDATE `brands` SET `pairings_zh` = '[{"type":"其他","name":"爪哇茶","notes":"在地的搭配，也与生长在同一片火山坡地的烟叶极为一致。"},{"type":"咖啡","name":"苏门答腊咖啡","notes":"浓郁而带土味，与爪哇烟叶的调子相合而不相抵。"}]'
 WHERE `name` = 'Taru Martani' AND SHA1(TRIM(`pairings`)) = '8139f3fd1fb0c7b9ae0f4d67af07756cbbf49e3e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Taru Martani' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '8139f3fd1fb0c7b9ae0f4d67af07756cbbf49e3e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tatuaje' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'f53402fd65aacbf06394ab9d7e7d5c3b047eecd6';
-- brands|Te Amo|pairings|zh — noms laissés en anglais
UPDATE `brands` SET `pairings_zh` = '[{"type":"Mezcal","name":"瓦哈卡手工梅斯卡尔","notes":"两样出色的墨西哥物产——龙舌兰做的梅斯卡尔，与韦拉克鲁斯的火山烟叶。共有的泥土气息。"},{"type":"咖啡","name":"韦拉克鲁斯咖啡","notes":"咖啡与烟叶产自同一地区——韦拉克鲁斯两片山地风土共有的巧克力气息。"}]'
 WHERE `name` = 'Te Amo' AND SHA1(TRIM(`pairings`)) = 'e57e648c2cee668658420ebe030a92bb9d88e922';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Te Amo' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'e57e648c2cee668658420ebe030a92bb9d88e922';
-- brands|Temple Hall|pairings|zh — superlatif retiré
UPDATE `brands` SET `pairings_zh` = '[{"type":"咖啡","name":"牙买加蓝山","notes":"这座岛自己的搭配，对一款不事张扬的配方也再贴切不过。"},{"type":"烈酒","name":"牙买加朗姆","notes":"朗姆的酯香足以抗衡配方中的泥土感。"}]'
 WHERE `name` = 'Temple Hall' AND SHA1(TRIM(`pairings`)) = '0ecf39332f0dea0517e6a55a58be7d4f396ff7ab';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Temple Hall' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '0ecf39332f0dea0517e6a55a58be7d4f396ff7ab';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'The Griffin''s' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '3a9ab9332ed7ecc47d5a206ae05dbde7f04abc68';
-- brands|Toscano|pairings|zh — type resté en français
UPDATE `brands` SET `pairings_zh` = '[{"type":"烈酒","name":"Grappa","notes":"这个国家自己的搭配，也是再贴切不过的一种：格拉帕与雪茄一样直率，没有糖来磨平棱角。宜选桶陈的格拉帕，而非白格拉帕——后者切得太利。"},{"type":"咖啡","name":"Espresso","notes":"意大利人在吧台做的事：一支 Toscanello 配一杯浓缩咖啡。咖啡的苦与烟气分庭抗礼，而非俯首称臣。"}]'
 WHERE `name` = 'Toscano' AND SHA1(TRIM(`pairings`)) = '657eabf9d6600a14bc0aa6443704461bedb0246e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Toscano' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '657eabf9d6600a14bc0aa6443704461bedb0246e';
-- brands|Trinidad|pairings|zh — hors d'âge omis
UPDATE `brands` SET `pairings_zh` = '[{"type":"葡萄酒","name":"Chambolle-Musigny Premier Cru","notes":"为 Fundadores（环径 40 x 192 毫米，长规格）推荐的搭配，所属品牌被 Habanos 归为中等强度。"},{"type":"香槟","name":"Krug Grande Cuvée","notes":"为 Reyes（环径 40 x 110 毫米，该品牌的短规格）推荐的搭配。"},{"type":"烈酒","name":"Hors d''âge 雅文邑","notes":"为 Fundadores 推荐的搭配：一支长雪茄（192 毫米）和一款久经陈放的雅文邑，同样都需要时间。"}]'
 WHERE `name` = 'Trinidad' AND SHA1(TRIM(`pairings`)) = 'a6f65cd5fd7589d603cfb49112145ea74e353142';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Trinidad' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'a6f65cd5fd7589d603cfb49112145ea74e353142';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vargas' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '41f14657a092c4f961659b019c4031d54aab7c73';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'VegaFina' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'eb38b0f782235b9755ca3f568bfad2c2fc09e871';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vegas Robaina' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '949f2c0b21752ab05b6e862338de3ed7fe8b2c83';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vegueros' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '32388cbdf7618d317f8ac3bc679871bfe609ded8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Villiger' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Warped' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = '844393b57f515e5d87ec666c512fdda68398dc19';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Zino Platinum' AND `champ` = 'pairings' AND `lang` = 'zh' AND `source_hash` = 'a5f6c9bd0c68c8dffecf86ad592762ba0c0aed2f';

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 279';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 279', 'systeme', 'traductions_relues', 'systeme', 0, 'Relecture « zh » par expert-traduction (agent) : 859 traduction(s) relue(s) — 358 corrigee(s), 501 validee(s) telles quelles ; brands 859');

SELECT
  (SELECT COUNT(*) FROM `translation_status` WHERE `lang` = 'zh' AND `statut` = 'relu' AND `relecteur` = 'expert-traduction (agent)') >= 859 AS relues,
  (SELECT COUNT(*) FROM `translation_status` WHERE `statut` = 'relu' AND (`relecteur` IS NULL OR `relecteur` = '')) = 0 AS chaque_relecture_a_son_relecteur;
SELECT `lang`, SUM(`statut` = 'relu') AS relues, COUNT(*) AS total FROM `translation_status` GROUP BY `lang`;
