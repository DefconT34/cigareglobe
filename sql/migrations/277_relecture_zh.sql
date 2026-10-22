-- ════════════════════════════════════════════════════════
-- 277 — Relecture zh
-- ────────────────────────────────────────────────────────
-- Relecture des traductions « zh » par : expert-traduction (agent).
-- Fichier de verdicts : verdicts_p3_zh.json ; generee par tools/i18n_relecture.php le 2026-10-22.
-- Un texte « corrige » est reecrit ; tout texte relu passe au statut « relu »,
-- avec le nom du relecteur. L'empreinte du francais est verifiee dans le WHERE :
-- un francais qui a change depuis l'export ne se laisse pas declarer relu.
-- ════════════════════════════════════════════════════════

-- brands|A.J. Fernandez|history|zh — noms latins, ville non traduite
UPDATE `brands` SET `history_zh` = 'Abdel J. Fernández带着家族的手艺来到埃斯特利，却没有一个属于自己的品牌要维护：他的祖父在古巴种烟，而他自己是从为别人卷制起步的。在这个行业里，这是一个特殊的位置。多年来，知名品牌销售着出自他工厂的雪茄，烟标上却没有他的名字——而业内人心知肚明。

他作为调配师的声誉，建立在方法而非风格之上：Fernández追求的是配方的平衡，而不是它的力度；在墨西哥圣安德烈斯茄衣仍被视为粗糙的年代，他是率先大规模将其重新引入尼加拉瓜配方的人之一。结果——深色、带甜、烟雾厚实——影响之广，以致跟随者已难以计数。

他自己的品牌来得更晚：New World、Bellas Artes、Enclave。它们无须为自己扬名，因为它们继承了一份现成的声誉。如今这家企业在埃斯特利周边耕种自己的烟田，跻身于罕见的一类生产者之列：从幼苗到烟标，掌握整条链条。

截至2026年10月，Fernández还为并非属于自己的名号卷制雪茄。Diesel与Man O''War于2009年为Cigars International推出，均出自其工厂；Diesel于2021年转至Forged Cigar Company旗下，其Uncaged产品线自2026年8月起在门店有售，由Fernández在埃斯特利制作。Artesano del Tobacco（亦写作Artesano del Tabaco）归Billy与Gus Fakih兄弟所有，他们于2019年在该名号下推出Viva La Vida。Henk归Heiko Poerz所有，由其与Fernández及Didier Houvenaghel共同组建；Nasser Cigars归来自佩蒂翁维尔的Jeffrey Nasser所有，其The Goat由Fernández卷制。Reposado：据Cigars Direct称是Fernández的配方，而Cigars Direct并未说明这个名号归谁所有。'
 WHERE `name` = 'A.J. Fernandez' AND SHA1(TRIM(`history`)) = 'd6583be5b489e8b074ec4f1874e8b48545580d21';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'A.J. Fernandez' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'd6583be5b489e8b074ec4f1874e8b48545580d21';
-- brands|Aganorsa Leaf|history|zh — noms latins, dates 8月/10月
UPDATE `brands` SET `history_zh` = '你很可能已经抽过Aganorsa的烟叶而不自知。Eduardo Fernández先创办了一家农业公司——Agrícola Ganadera Norteña——然后才创办品牌，这与业内所有人的次序恰好相反。这家企业首先是种植者，田地在哈拉帕山谷与埃斯特利周边，它的烟叶出现在几十家没有自有农田的企业的配方之中。

这一身份让它在图册中占据特殊位置：它代表的是尼加拉瓜极为稀缺的东西——不是又一座工厂，而是原料本身。在此重植的古巴种子——可乐多99、克里奥罗98——已成为现代尼加拉瓜风味的标尺，也就是这个国家用来与哈瓦那抗衡的那种直率力度与甜感的结合。

这家企业长期以Casa Fernandez之名销售自己的雪茄，之后才改用农业公司的名字。这一更名说清了它的主张：为雪茄背书的不是品牌，而是烟叶。

La Tribu归Atlantic Cigar Company所有，这是一家美国零售商：一个博客在2013年8月称，据其所知，La Tribu仅由这一家零售商销售，茄衣为厄瓜多尔Habano。2026年10月，Atlantic Cigar的页面列出一款来自多米尼加共和国的La Tribu Robusto，并将Serie de Couleurs归于Aganorsa Leaf。其Noir为Toro 6 x 56，采用尼加拉瓜烟草，来自在Aganorsa Leaf的醇化室中存放了一年的雪茄，这些雪茄因零售商所说的雪茄政治方面的那些事而成了孤儿。'
 WHERE `name` = 'Aganorsa Leaf' AND SHA1(TRIM(`history`)) = 'e1dac37dbab91530f66cad5a1f984284c36cb846';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Aganorsa Leaf' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'e1dac37dbab91530f66cad5a1f984284c36cb846';
-- brands|Alec Bradley|history|zh — noms de personnes en latin
UPDATE `brands` SET `history_zh` = 'Alan Rubin决定在卖掉家族的五金进口生意之后投身雪茄，Alec Bradley 于1996年在美国诞生，这是雪茄零售商 Cigars Direct 的说法。据行业媒体，他此前与烟草毫无渊源。

他用两个儿子的名字——Alec 与 Bradley——为公司命名。

起步艰难：首个品牌 Bogie Stogies 是为高尔夫球场而做的雪茄，没能熬过热潮的结束，Rubin转而为零售商生产品牌。2000年，老手 Ralph Montero 加入；他们与 Davidoff 的首席调配师 Henke Kelner 一起，推出了在多米尼加共和国制造的 Occidental Reserve，随后是 Trilogy（Cigars Direct）。

公司不拥有工厂：旗下系列都由外包卷制。多数在洪都拉斯丹利的 Raíces Cubanas 卷制；少数在尼加拉瓜的Plasencia家族处，自2019年起，Project 40 等系列在埃斯特利的 J. Fuego 卷制（行业媒体、维基百科）。所读各页均未给出与洪都拉斯Plasencia工厂之间联系的日期。

Prensado 于2009年在 IPCPR 上以五种规格亮相，采用方压工艺，这在公司是头一回：茄衣为特罗赫斯（洪都拉斯）种植的科罗霍，茄套来自哈拉帕（尼加拉瓜），茄芯为洪都拉斯与尼加拉瓜烟叶。其 Churchill 规格被行业媒体评为2011年的头号雪茄，公司自己也格外强调这一转折点。

随后是 Tempus（依来源不同为2007年或2009年）、Black Market（2011年）、Coyol（2014年）、Magic Toast（2018年）和 Project 40（2019年）。2018年，Rubin的儿子们推出了自己的品牌 Alec & Bradley，据维基百科，Kintsugi 即出自该品牌。2023年3月1日，Scandinavian Tobacco Group 接手 Alec Bradley 的产品组合；Rubin继续担任顾问，公司如今隶属 Forged Cigar Co. 旗下。'
 WHERE `name` = 'Alec Bradley' AND SHA1(TRIM(`history`)) = 'e82df430f404a44722df2414111a20f4cb20a4a7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Alec Bradley' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'e82df430f404a44722df2414111a20f4cb20a4a7';
-- brands|Arturo Fuente|history|zh — noms de personnes en latin
UPDATE `brands` SET `history_zh` = '1887年11月18日生于古巴吉内斯的Arturo Fuente Sr.，据 arturofuente.com，1906年定居基韦斯特，1910年又迁至西坦帕；维基百科则把他抵达美国的时间定在1902年。1912年，二十四岁的他在西坦帕的弗朗西斯街813号创办了 A. Fuente & Company。1924年，他赴古巴采购烟草期间，工厂毁于火灾；此后二十二年，他担任一家本地企业的总经理。

他的儿子Carlos Fuente Sr.生于1935年，1956年以一美元买下兄长Arturo Oscar的股份，成为公司唯一的所有者；已退休的Arturo Sr.于1973年去世。七十年代初，Carlos在尼加拉瓜买下一家工厂；据他的儿子所述，1976年售出的首支 Don Carlos 是在埃斯特利卷制的。1978年，桑地诺叛乱烧毁了尼加拉瓜的工厂；1979年，一场“意外”火灾毁掉了洪都拉斯的工厂。

据 arturofuente.com，Carlos Sr.仍在伊博城的厂址继续生产雪茄。1980年9月4日，Carlos Sr.与儿子Carlos Jr.（人称Carlito）在多米尼加共和国的圣地亚哥-德洛斯卡瓦列罗斯开设了 Fuente Ltd。伊博城厂址位于第22街，仅作为配送中心保持开放：那里不再手工卷制雪茄。

Carlito于1992年创制出这家字号所称的首支成功的百分之百多米尼加 puro 雪茄，连茄衣在内，即 Fuente Fuente OpusX，据 arturofuente.com，该雪茄于1995年11月18日上市；该网站还提及，多米尼加的土壤曾被认为不适合种植茄衣烟叶。茄衣产自 Château de la Fuente，它位于多山的博瑙地区，在圣地亚哥东南约一小时路程处：家族于九十年代初在那里播下了首批种子，农场向 ProCigar 节的参观者开放。

Carlos Fuente Sr.于2016年8月去世，享年81岁。当时Carlito担任公司总裁；他的姐妹Cynthia Fuente-Suarez（据 arturofuente.com 为副总裁）与他同为创始人的孙辈。这家字号指出，在创业四代之后，企业依然是家族企业；《Arturo Fuente: Since 1912》一书提到，有第四代正在幕后等待。'
 WHERE `name` = 'Arturo Fuente' AND SHA1(TRIM(`history`)) = 'd8be123ec46f77c26f7ef15cca0bd6fd16fdb648';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Arturo Fuente' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'd8be123ec46f77c26f7ef15cca0bd6fd16fdb648';
-- brands|Ashton|history|zh — noms latins, dates, rang
UPDATE `brands` SET `history_zh` = 'Ashton的故事始于1985年的费城，起点是 Holt''s Cigar Company 这家店，据 holts.com 称，由Levin家族自1957年起经营，Robert Levin则自1974年起掌管。七十年代成为美国烟客眼中古巴的主要替代产地之后，多米尼加共和国出产的雪茄品质很不齐整——有些出色，更多只是过得去。创建这个品牌的是Robert Levin：该公司称他是 Ashton 的创办者，时间在1980年代初，并把品牌的推出定在1985年；他在1996年的一次访谈中说，自己曾在华盛顿的 Retail Tobacco Dealers of America 大会上推介过它，并于1992年从 Ashton 烟斗的制造商Bill Taylor手中买下了这个名字，那是一位朋友建议的，这位朋友是这些烟斗的进口商。

早期的 Ashton 雪茄并不是在Fuente卷制的：Levin说，它们起初由 Henke Kelner 在 Tabadom 制作，后来他在1988年把品牌交给了Fuente家族，并与Carlos Fuente Jr.（Carlito）一起定下了配方；该公司则写道，他在品牌推出后不久便与Fuente家族合作。这层关系至今仍在：ashtoncigar.com 与 holts.com 称，Ashton 雪茄在多米尼加共和国的 Tabacalera A. Fuente 卷制，并由Carlito Fuente调配——下文的 San Cristobal 系列除外。这项安排也意味着两家共享同一条质量底线——Fuente家族愿意署上自己名字的东西，同样为Levin的品牌生产。

由此而来的产品目录，覆盖了多米尼加表达的全部幅度。经典的康涅狄格阴植系列道出根本主张：有骨架、奶油质地，制作的稳定度是少有字号能守住的。VSG 系列——Virgin Sun Grown——用的是日照栽培的厄瓜多尔茄衣，性格更饱满，让只知道Ashton柔和一面的烟客吃了一惊。卷制后在西班牙雪松木箱中陈化的 Cabinet Selection，则展示了这家字号精致的顶点。

品牌的气质来自费城：素净、看重质量，对执行本身的兴趣大于对雪茄圈那套戏剧的兴趣。Davidoff是日内瓦式的、冷的；Ashton是费城式的、暖的。它不靠极端规格或出人意料的配方博取谈资；它做的是老练爱好者一再回头而不失望的雪茄——这比听上去要难。

在美国以外，Ashton的San Cristobal产品线在尼加拉瓜的制造委托给位于埃斯特利的My Father的Garcia家族，以Paradiso之名销售：2015年12月的一篇文章将此归因于品牌方面的原因。2026年10月，德国的零售商仍以此名供应，分为Paradiso by Ashton、Revelation、Quintessence与Elegancia几个系列。请勿与古巴品牌San Cristóbal de La Habana混淆。'
 WHERE `name` = 'Ashton' AND SHA1(TRIM(`history`)) = 'bccdf493d6fba9411367159bca921b94e5ad455c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ashton' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'bccdf493d6fba9411367159bca921b94e5ad455c';
-- brands|Ashton Cabinet|history|zh — noms latins, Sr. omis
UPDATE `brands` SET `history_zh` = 'Robert Levin（出自在费城经营 Holt''s 的那个家族）于1985年推出 Ashton，据 holts.com 称。他早期的雪茄并不是在Fuente卷制的：他在1996年的一次访谈中说，它们起初由 Henke Kelner 在 Tabadom 制作，后来他在1988年把品牌交给了Fuente家族；该公司则写道，他在品牌推出后不久便与Fuente家族合作。Fuente家族——这家刚在1980年工厂大火之后，于岛上重建声誉的家族字号——如今在多米尼加共和国的 Tabacalera A. Fuente 卷制 Ashton 雪茄。

Cabinet Selection 是该公司在卷制之后再行陈化的系列。它不只是一支高端雪茄：它经过额外的陈化——雪松木箱给予它的时间。

卷制之后，Cabinet Selection 被放进西班牙雪松木箱——不是普通包装上那种装饰性雪松，而是结构用材，传统上用于陈放西班牙葡萄酒与烈酒的那一种——在里面存放十二到二十四个月才出厂。这段时间里，烟叶在受控的环境中继续发酵，磨去残余的粗糙，让配方各部分彼此调和。木箱也带来自己的性格：雪松树脂油分在数月接触中缓慢渗移，影响茄衣与外层叶片，其效果是普通陈化复制不出来的。

结果是一支状态极其稳定的雪茄。康涅狄格阴植茄衣——和今天多数同类茄衣一样来自厄瓜多尔——从头几口就给出榛子与山地蜂蜜的气息。以Carlos Fuente Sr.个人配方为底的多米尼加茄芯，转向白雪松与坚果干，末了收在一段长度与清晰度都不寻常的余味上。没有一处毛糙。这支雪茄自始至终对烟客只有一个要求：专注。'
 WHERE `name` = 'Ashton Cabinet' AND SHA1(TRIM(`history`)) = 'a900d1a21bbd388e3ddf4bb89e5fbe1339e23d0f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ashton Cabinet' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'a900d1a21bbd388e3ddf4bb89e5fbe1339e23d0f';
-- brands|Avo|history|zh — villes, rue, sujet "maison"
UPDATE `brands` SET `history_zh` = 'Avo Uvezian 1926年3月22日生于贝鲁特；他是亚美尼亚裔美国钢琴家兼作曲家，2017年3月24日在奥兰多去世，享年91岁（Cigar Dojo，2017年3月24日）。他广为人知的那首歌至今仍有争议：《Strangers in the Night》署名为 Bert Kaempfert，而 Uvezian 声称自己创作了它，并在 Sinatra 于1966年录制之前把旋律寄给了 Kaempfert（维基百科）。

至于雪茄，他找到了 Hendrik Kelner，后者于1984年开办了 Tabacos Dominicanos（Tabadom）。据行业媒体报道，Kelner 为 Avo 下的首笔订单（17 000 支雪茄）可追溯到1987年，麦迪逊大道上的 Davidoff 门店于1988年销售该品牌；首次推出的时间标为1988年。维基百科写道，Davidoff 于1995年获得 Avo 的经销权，金额约1000万美元。

雪茄在多米尼加共和国卷制，地点是 Tabadom 旗下的 OK Cigars 工厂，Tabadom 是 Oettinger Davidoff 的子公司（行业媒体，2016年与2025年）。2015年1月，该品牌把产品线收窄为四个在售系列：Classic、Domaine、Heritage 与 XO；Signature 与 Maduro 已停产。XO 系列以音乐术语作为规格名称：Notturno、Preludio、Intermezzo、Legato、Maestoso。

Davidoff 在2001年至2014年间每年推出一款限量版来庆祝其周年，随后在2016年推出 Avo 90th。2026年3月，行业媒体报道称，该公司计划在4月的 PCA 展会上纪念 Uvezian 的百年。'
 WHERE `name` = 'Avo' AND SHA1(TRIM(`history`)) = '9907b0453e6eb2e15525e8a381867ceb1333f6e4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Avo' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '9907b0453e6eb2e15525e8a381867ceb1333f6e4';
-- brands|Bolivar|history|zh — lancement le plus récent mal rendu
UPDATE `brands` SET `history_zh` = 'Habanos 把 Bolívar 品牌的创立定在1902年。它的名字来自 Simón Bolívar；Habanos 的页面把他介绍为19世纪的伟大人物之一，他作为把南美洲大部分地区从西班牙统治下解放出来的“解放者”载入史册。

各来源对起步阶段说法不一：维基百科依据 Bati（The Cigar Companion，1993年）称，该品牌约于1901年或1902年由 José F. Rocha 创立，也许在英国，1921年才在哈瓦那注册；零售商 J.J. Fox 写道，它1901年由 José F. Rocha 在英国创立；网站 Quill & Pad 给出的名字是 Jose Fernandez Rocha，认为1902年是一般认可的日期，但并不确定。据维基百科和 J.J. Fox，Cifuentes y Cía 于1954年买下该品牌（据 Quill & Pad 为1944年或1954年，更可能是1954年），生产随后转到哈瓦那的 Partagás 工厂。Habanos 写道，Bolívar 是其目录中力度与风味居前列的品牌之一（力度“Fuerte”），与赋予它名字的历史人物的性格相合；它的配方把 Vuelta Abajo 地区的 tripa 与 capote 叶片组合在一起，所有规格都全手工卷制，用长叶芯。维基百科写道，古巴的 Bolívar 浓郁，配方里 ligero 占相当比例，传统上属于哈瓦那雪茄中力度居前列的一类。

网站 Quill & Pad 在2023年把 Bolívar 的风格描述为粗壮而浓郁，ligero 比例很高，并指出1990年代中期转向了更温和的风格。

Royal Corona 是一支长 124 毫米、环径 50（4 7/8 英寸）的罗布图，据维基百科的列表和 Cigars Connect（2017年）；后者称它是大众化而不典型的罗布图。金字塔形的 Belicosos Finos（vitola de galera Campana），据维基百科为 52 × 140 毫米；Cigar Coop 在2020年为 Belicosos Finos Reserva Cosecha 2016——该品牌首个 Reserva——给出了相同的尺寸。Corona Gigante（各来源写作 Coronas Gigantes 或 Gigantes），47 × 178 毫米（vitola de galera Julieta No. 2，即 churchill），似乎已于2017年从目录中撤下，网站 Quill & Pad 在2023年如此写道。

Habanos 介绍了两款近期的限量版：Bolívar Soberano（54 × 140 毫米，2018年），首次把 vitola de galera Duke 引入该品牌的系列；以及 Bolívar Regentes（52 × 130 毫米，2021年），据该品牌页面，这是其新近的发布。

它在哪里卷制？在古巴，这个问题的答案分两层。自2002年起，Habanos 的每个品牌都有一家母厂，负责选叶和配方，其雪茄可以在岛上几十家工厂中的任何一家、在母厂监督下卷制；Habanos 不公布这张图，由行业媒体拼出来。它的母厂是 Partagás。2011年底，行业媒体写道，工业街的工厂——Partagás、Bolívar、La Gloria Cubana、Ramón Allones 和 Quai d''Orsay 的母厂——将因施工而关闭，其生产将转到原 El Rey del Mundo 厂；该媒体2020年则写道，这家工厂已于2011年因翻修而关闭，而维基百科给出的搬迁日期是2012年1月2日。2026年10月，habanos.com 的“Brands Academia”页面列出27个品牌，并把 Bolívar 归入五个价值品牌（Brands Value 栏目：Trinidad、Bolívar、Punch、Quai d''Orsay、Ramón Allones），此外还有六个全球品牌、三个销量品牌和十三个其他品牌；2019年8月，行业媒体描述了一个由二十一个品牌组成的组合，其中有一组四个高价值品牌（Bolívar、Punch、Ramón Allones、Trinidad），当时 Quai d''Orsay 属于其余品牌。官方页面说它设在 Partagás 厂，行业媒体也证实。'
 WHERE `name` = 'Bolivar' AND SHA1(TRIM(`history`)) = '52a5ff2acd6db85d57e5de0d039269c311a8c57c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bolivar' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '52a5ff2acd6db85d57e5de0d039269c311a8c57c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Camacho' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '88b433f3fc41eb8f46e296cb3fbfebb9fbd8fb1e';
-- brands|CAO|history|zh — noms de personnes en latin
UPDATE `brands` SET `history_zh` = 'CAO 的故事始于烟斗，而不是雪茄。据 Cigar Dojo，Cano Aret Ozgener于1968年在纳什维尔创办了这家公司，并以自己姓名的首字母命名；它起初制作烟斗和雪茄保湿盒。行业媒体补充说，Ozgener 1937年生于伊斯坦布尔，是工程师，曾在北卡罗来纳州的 DuPont 工作，在那里修理有缺陷的土耳其海泡石烟斗，并于1977年全职投入烟斗：因此两个页面给出的起点并不相同（1968年或1977年）。

雪茄是后来的事。据 Cigar Dojo，公司在1980年尝试过高端雪茄，之后在1990年代中期重新回到雪茄；行业媒体则把Ozgener进入雪茄市场的时间定在1993年，把在洪都拉斯卷制的首支 CAO 定在1995年。到2000年代初，这个品牌已凭大胆而当代的配方为人所知。

CAO 经营着一条独立的路线，朝向美国意象。据 Cigar Dojo，Flathead 系列于2013年推出，取材于改装老爷车（hot rod）、海报女郎（pin-up）和定制摩托的世界；其规格以发动机零件命名（Carb、Camshaft、Piston、Big Block）。公司页面在2026年10月称其以 Connecticut Broadleaf 茄衣为基础，未提及任何摩托车品牌。

据行业媒体，2007年，CAO 被 ST Tobacco 旗下的 Henri Wintermans 收购；Cigar Dojo 点出的是如今的 Scandinavian Tobacco Group。品牌由此离开纳什维尔，迁往 General Cigar 位于弗吉尼亚州里士满的总部。创始人之子Tim Ozgener一直担任总裁到2010年；Cano Ozgener于2018年6月9日在纳什维尔去世，享年81岁。2026年10月，caocigars.com 网站标注为 General Cigar Co., Inc.；各系列的雪茄视不同情况在埃斯特利（尼加拉瓜）、洪都拉斯或 General Cigar Dominicana（多米尼加共和国）卷制。'
 WHERE `name` = 'CAO' AND SHA1(TRIM(`history`)) = '3d11a130e14af1991e5162c7ec26aa9161208ba3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '3d11a130e14af1991e5162c7ec26aa9161208ba3';
-- brands|Casdagli|history|zh — noms de personnes en latin
UPDATE `brands` SET `history_zh` = 'Casdagli 是一家不拥有田地的英国老号。Jeremy Casdagli于1997年以 Bespoke Cigars 之名创立，2018年春改用创始人的姓氏。这一更名透露了它的立意：它甘于做一个署名，而非一座工厂，走短批次而非常设目录的路子。

它的雪茄三度易国。起初在古巴卷制，出自一位卷烟师Carlos Valdez Mosquera之手，直至他2013年退出。此后生产转至多米尼加共和国圣地亚哥的Hendrik Kelner Jr.的 Kelner Boutique Factory。如今则在哥斯达黎加，由两家作坊分担：圣何塞的 IGM 负责 Daughters of the Wind 与 Cypher 3311；普里斯卡尔的 Tabacos de Costa Rica 负责 Villa Casdagli 系列，由调配大师Olman Guzmán主理。

第二个地址并非无关紧要，它纠正了本词条此前的说法。据该号自述，Tabacos de Costa Rica S.A. 正是那家「当时名为 Vegas Santiago」的作坊——也就是 Vegas de Santiago 的那一家，它在本图集中另有词条，该号写道自己在普里斯卡尔种植烟草已逾八十年（据 Zechbauer 称，海拔一千一百米以上）。不过，La Nación 在2011年写道，当地的烟草生产已于1997-1998年停止：Casdagli 在普里斯卡尔卷制它的 Villa Casdagli，无论周边田地是何状况。

依然成立的是：烟叶来自别处。Villa Casdagli 以厄瓜多尔茄衣与茄套，配以秘鲁、尼加拉瓜、厄瓜多尔与多米尼加的填充烟叶；其中四种要经历为期两到四个月、称为 mejorado 的二次发酵。Jeremy Casdagli说，他正是2012年在这家作坊里认识了那种后来成为他调配偏爱的秘鲁烟叶。生产国确实是为作坊而选——但所为的是这家作坊的本事。

这家老号属于所谓「精品」一类：年产以数万支计，而大厂以数千万支计。这首先是规模之别，其次才是品质之别，也解释了它的处境——供货不定、没有广泛的分销网络，名声主要在爱好者之间流转。'
 WHERE `name` = 'Casdagli' AND SHA1(TRIM(`history`)) = 'fa5c0203d765e422b463f45bfd571483003817da';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casdagli' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'fa5c0203d765e422b463f45bfd571483003817da';
-- brands|Cohiba|history|zh — marque/noms latins, 首屈一指
UPDATE `brands` SET `history_zh` = 'Habanos 把Cohiba的创立定在1966年，并写道，这个品牌在许多年里专门留作礼品，赠予政府人物和Fidel Castro总统。这支雪茄的来历有两种说法。Castro在1994年说，他的一名警卫抽一种香气很浓的雪茄，由一位朋友为他卷制，供其个人使用；他让人研究其配方和茄衣，并围绕他建了一家工厂。卷制师Eduardo Rivera在1995年讲述，1960年代初，一位朋友把他的一支雪茄送给了Fidel，此后Fidel不再抽别的；他当时在哈瓦那的 La Corona 卷制，之后才转到 El Laguito。专业媒体提到这些礼物的受赠者中有Tito、Nasser、Luis Echeverría和Omar Torrijos，并提到1974年交给美国使者的一个套盒，收件人是Henry Kissinger；Castro在1994年说，他送出的主要是Cohiba。

Habanos 写道，自1982年起，也就是这个品牌在多个国家亮相的那一年，Cohiba面向烟民供应，数量有限。专业媒体把这次首次发售放在西班牙，时值世界杯，推出了三种规格：Lancero、Corona Especial 和 Panetela；Robusto、Exquisito 和 Espléndido 于1989年加入。有些说法把这个名字的起用时间定在1968年而非1966年。这个名字来自一个泰诺语词，指哥伦布1492年在古巴见到的卷起的烟叶；Habanos 视之为烟草的首个名称。

Habanos 写道，Cohiba是其旗下唯一的这样一个品牌：所用三类叶子中，seco 和 ligero 两类要经过额外发酵，因此品牌有了可辨认的香气和风味。据其所说，这些叶子是 Vuelta Abajo 的 San Juan y Martínez 和 San Luis 两地顶级 vegas 的精选中的精选。专业媒体则提到第三次发酵，在木桶中进行，1965至1966年在 El Laguito 决定采用，目的是让口味更柔和。

El Laguito 曾有一段时间只雇用女卷制师，专业媒体在2016年这样写道。这家工厂通常不对公众开放：Habanos 在那里为其活动的参与者组织导览参观，例如2022年9月为品牌55周年举办的那次。

黑黄相间的烟标是这个品牌的视觉标志。Habanos 于2014年推出了带全息图的新烟标，先用在 Pirámides Extra 上，随后用于整条 Línea Clásica 和 Línea 1492，以便更好地追踪每一支雪茄；Behike 产品线自2010年起就带有自己的烟标，其安全措施有所加强。

Behike 产品线于2010年推出，Habanos 将其描述为自己推出的产品线中极为尊享的一条。它是该品牌中首个把 medio tiempo 用进配方的产品线，这种叶子取自全日照种植的烟株顶部的两片叶子。它诞生时有三种规格，BHK 52、54 和 56，均在 El Laguito 卷制；第四种规格 BHK 58（58 x 178 mm）于2025年2月在 Festival del Habano 上亮相，自2026年2月起首次在瑞士发售，装在一个包含四种规格、庆祝该产品线十五周年的套盒中。

它在哪里卷制？在古巴，这个问题的答案分两层。自2002年起，Habanos 的每个品牌都有一家母厂，负责选叶和配方，其雪茄可以在岛上几十家工厂中的任何一家、在母厂监督下卷制；Habanos 不公布这张图，由行业媒体拼出来。 它的工厂是 El Laguito，位于哈瓦那西部的一座旧宅：Habanos 官方页面称Cohiba自1966年起在那里生产，另有来源提到1967年，而媒体对这座旧宅的位置，时而说在库瓦纳坎，时而说在西沃内或米拉马尔。 自2019年起，Habanos 把它列为六个全球品牌之一，在其所有市场和每一家 Casa del Habano 销售。 行业媒体指出，部分规格也曾在 H. Upmann 厂和 Partagás 厂卷制；El Laguito 仍是母厂。

Habanos 在2026年10月8日的新闻稿中宣布，Talismán 于10月7日在伦敦全球发布，这是Cohiba年的首个节点，该年为纪念品牌六十周年：这款 Sublimes No. 1（54 x 154 mm）于2017年以限量版推出，成为 Línea Clásica 的第九种规格。'
 WHERE `name` = 'Cohiba' AND SHA1(TRIM(`history`)) = 'aed85c64ddab0e80e288294e77b1ff6188e22045';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cohiba' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'aed85c64ddab0e80e288294e77b1ff6188e22045';
-- brands|Cohiba USA|history|zh — 终审法院；日期格式统一
UPDATE `brands` SET `history_zh` = 'Cohiba USA 是烟草业中的一桩知识产权纠纷：两家企业主张同一个名称，一家是古巴国有公司 Cubatabaco（Empresa Cubana del Tabaco），另一家是美国的 General Cigar Company；双方的诉讼始于 1997年，在多个联邦法院出现了相互矛盾的裁决。

General Cigar Company 于 1978年3月13日向美国专利商标局提交了 COHIBA 商标申请；该商标的注册日期为 1981年2月17日。Cubatabaco 曾于 1969年9月在古巴提交了自己的商标申请，并于 1972年5月31日获得注册，专业媒体在报道 2025年的裁决时如此回顾。General Cigar 为美国市场开发了自己的 Cohiba 产品线，起初仅在多米尼加共和国卷制。

Cubatabaco 于 1997年1月向商标局申请注册 COHIBA，并请求撤销 General Cigar 的商标，随后于 1997年11月12日在纽约南区联邦法院起诉 General Cigar。2004年3月，Robert Sweet 法官禁止 General Cigar 使用该商标并撤销其注册；2005年2月，联邦第二巡回上诉法院推翻了这一裁决，认定禁运使古巴企业不得在美国取得财产权利。该案于 2008年重启后，Sweet 法官于 2009年12月再度判 Cubatabaco 胜诉，随后上诉法院于 2010年7月判 General Cigar 胜诉。在商标审判和上诉委员会（TTAB），Cubatabaco 的撤销申请于 2013年3月被驳回；联邦巡回上诉法院于 2014年6月4日撤销了这一驳回，美国联邦终审法院于 2015年2月23日拒绝审理 General Cigar 的上诉。2022年12月，TTAB 裁令撤销 General Cigar 的两项美国注册，依据是 1929年的《美洲国家间公约》。General Cigar 于 2023年2月诉至弗吉尼亚东区联邦法院，该院于 2025年5月维持了这一撤销裁决（Leonie Brinkema 法官）；General Cigar 已向联邦第四巡回上诉法院提出上诉。其母公司 STG 称，上诉期间联邦注册仍然有效，且因在美国长期使用该商标而产生的权利不受影响。

美国的 Cohiba 在古巴境外制造：Red Dot、Blue 与 Macassar 在多米尼加共和国制造（Blue 在圣地亚哥的 General Cigar Dominicana），Nicaragua 与 Riviera 在尼加拉瓜的 STG Estelí 制造，Royale 与 Rubicon 在洪都拉斯制造，Serie M 则在迈阿密的 El Titan de Bronze 制造。cohiba.com 网站在 2026年标注的版权所有者为 Forged Cigar Co., Inc.，列出九个常设产品线（Red Dot、Riviera、Blue、Macassar、Black、Nicaragua、Royale、Connecticut、Rubicon）、四款限量版（Spectre、Weller、Serie M、C8）和三个已停产的产品线。Cigar Coop 在 2026年8月写道，STG 已将该品牌从 General Cigar Company 转移至集团旗下的另一家子公司 Forged Cigar Company。

2026年10月，Cohiba 的美国版本在欧洲以 Silencio 之名销售，该名称由 STG 为其选定（General Cigar 自 2010年起隶属 STG），据 STG 调配大师 Sean Williams 于 2022年11月所述。当地推出了两个产品线：Red Dot（据他所说占其销量的60%）与 Black；Cigarworld 在 Silencio 名下列出 Red Dot、Black、Los Rios、Blue、Riviera 与 Series M 几个系列。在美国，Silencio 是 Williams 的招牌拼配之名。'
 WHERE `name` = 'Cohiba USA' AND SHA1(TRIM(`history`)) = 'ba44a7f0ecee216b866e0f177f7aa77f168f4133';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cohiba USA' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'ba44a7f0ecee216b866e0f177f7aa77f168f4133';
-- brands|Cuaba|history|zh — 品牌名须用拉丁字母
UPDATE `brands` SET `history_zh` = 'Cuaba 是一个「复活」的品牌。它于1996年推出，重拾两端渐尖的双头异形茄——这是十九世纪末流行的样式，habanos.com 称其一个世纪后即1996年在 Romeo y Julieta 工厂重新推出。维基百科写道，Habanos 于1996年11月19日在伦敦的 Claridge''s 酒店推出该品牌，而异形茄在二十世纪初流行，自1950年代起衰落。

Habanos 将双头异形茄视为卷制师技艺的巅峰。维基百科写道，每支 Cuaba 都由7级卷制师手工卷制，这是认证的顶级水平；头几批不用模具，尺寸略有差异，模具大约一年后才出现。原始尺寸为 Divinos、Tradicionales、Generosos 和 Exclusivos；Distinguido、Diadema 和 Salomón 于2003年加入常规产品线，habanos.com 如是说。

Habanos 称该品牌力度中等至饱满，茄衣与茄芯均来自 Pinar del Río 的 Vuelta Abajo。

这个名字，habanos.com 称，是克里斯托弗·哥伦布时代的一个印第安词，指一种极易燃的灌木，宗教仪式上用它点燃雪茄；行业媒体则认为那是泰诺人用来点燃雪茄的灌木。

它在哪里卷制？在古巴，这个问题的答案分两层。自2002年起，Habanos 的每个品牌都有一家母厂，负责选叶和配方，其雪茄可以在岛上几十家工厂中的任何一家、在母厂监督下卷制；Habanos 不公布这张图，由行业媒体拼出来。它的母厂是 La Corona——即 Miguel Fernández Roig 厂——位于塞罗区 20 de Mayo 大道，原为卷烟厂，2000年改建为雪茄厂，行业媒体（2011年和2015年）如是说，并称其为 Cuaba、Hoyo de Monterrey 和 Punch 的母厂。2026年10月，habanos.com 的 Habanos Brands Academia 页面把 Cuaba 列入一个27个品牌的组合中的另外十三个品牌，不在六个全球品牌、五个价值品牌和三个销量品牌之内。Habanos 写道，Cuaba 的风格于1996年在 Romeo y Julieta 工厂重新推出，但未点名母厂；维基百科写道，大部分 Cuaba 在 Briones Montoto 工厂制作，即 Romeo y Julieta 的工厂，而行业媒体把母厂定在 La Corona：两种说法并存。全部手工长茄芯。'
 WHERE `name` = 'Cuaba' AND SHA1(TRIM(`history`)) = '017e6a13bcb627ee63d86ed94041961408f7cfa6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuaba' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '017e6a13bcb627ee63d86ed94041961408f7cfa6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dannemann' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '03ed2148766fbc9ec3ac50cca833555406d0b08d';
-- brands|Davidoff|history|zh — 人名拉丁字母；城市；tirage
UPDATE `brands` SET `history_zh` = 'Zino Davidoff 于1906年3月11日出生在今乌克兰境内：据 swissinfo（2006年3月11日）是在基辅，据维基百科是在诺夫霍罗德-谢韦尔斯基。据该公司的年表，他一家于1911年离开基辅，迁居日内瓦，他的父亲 Henri Davidoff 在那里开设了自己的首家烟草店。

该公司将 Davidoff 雪茄品牌的诞生定在1968年：由 Zino Davidoff 在古巴创制的首批白色烟标雪茄于当年面世；据维基百科，是 Cubatabaco 于1967年带着一项提议接触了 Davidoff，而前三款 vitola 的年份为1968-1969年。1970年，Oettinger 集团接手了 Zino Davidoff 在日内瓦的店铺，自1961年起执掌该集团的 Ernst Schneider 着手把它打造成一个国际品牌。

据该公司称，自1991年起，所有 Davidoff 雪茄都在多米尼加共和国的 Villa González（圣地亚哥）手工卷制，该地也生产 AVO、The Griffin''s、Cusano、Private Stock 和 Zino Platinum。关于与古巴的决裂，各页说法不一。据行业媒体，Zino Davidoff 于1989年与 Cubatabaco 的代表和瑞士海关人员一起，焚烧了约 130 000 支哈瓦那雪茄；在与 Cubatabaco 发生分歧、并出现抽吸和燃烧方面的问题之后，Davidoff 在古巴的生产于1991年停止，一项协议规定在1992年底前售出剩余库存。维基百科写道，Zino Davidoff 与 Cubatabaco 在质量和权利方面诸多分歧之后共同决定终止双方关系，决裂于1990-1991年正式确定；零售商 Holt''s 写道，1991年 Zino 已解除这一关系，并将全部生产迁往多米尼加共和国，理由是失去了质量控制。该公司的年表只为多米尼加的卷制定了年份，自1991年起。

此后产品目录继续扩大：该集团于2007年取得 Winston Churchill 之名用于雪茄的独家权利，该系列于2008年5月推出；Davidoff Nicaragua 使用黑色烟标，于2013年问世；Yamasá 是第三款黑色烟标的 Davidoff，茄衣和茄套均为多米尼加产，于2016年推出。

2021年，该公司庆祝了多米尼加生产三十周年（1991-2021年），并将其与「Crop-to-Shop」理念的起点联系在一起；2025年，厂区扩建应能使手工卷制雪茄的年产量翻倍，并包含一个1 700平方米的拼配中心。'
 WHERE `name` = 'Davidoff' AND SHA1(TRIM(`history`)) = '0408b14ed3f9fe7ba7c5e69876e399eb1965460f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Davidoff' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '0408b14ed3f9fe7ba7c5e69876e399eb1965460f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Diplomáticos' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '8ec728b301db2b4738dce64e7bdcb69a43c0b4c4';
-- brands|Don Diego|history|zh — 品牌名拉丁字母；日期格式
UPDATE `brands` SET `history_zh` = 'Don Diego 属于头一波——那些在1960年之后为在美国市场取代已无从获得的哈瓦那雪茄而创立的品牌。生产起初设在加那利群岛，随后迁往多米尼加共和国，并留在了那里。

这一来历解释了它的风格。当时需要的是一支柔和、稳定、浅色茄衣的雪茄，足以安抚失去坐标的烟客：Don Diego 正是为此而调配，也从未偏离。雪松、杏仁，一种奶油般的柔和，燃烧顺畅——这是一支对谁都无所要求的雪茄。

有二十年，它是美国销量居前的品牌之一，直到1990年代的浓郁配方浪潮把它贬为过时的经典。它却并未因此改变，这让它今天成为一个有用的见证：你可以在它身上尝到，在「力度」成为卖点之前，市场所谓的好雪茄是什么样。

这个品牌仍由一家大集团经销，没有特别的宣传投入——而这样很好。

Playboy 这个名称属于杂志，而不属于这家公司。Playboy by Don Diego 于1996年在 Playboy Mansion 举办的一场活动上推出；此后 Playboy 有了以自身名义发行的雪茄，其中 Cigarworld 将一个系列（2009年5月25日推出）归入多米尼加共和国，完全手工制作。'
 WHERE `name` = 'Don Diego' AND SHA1(TRIM(`history`)) = '0eb85869b0f41f30d23ad3f043d73c545d1a1c86';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Diego' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '0eb85869b0f41f30d23ad3f043d73c545d1a1c86';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Drew Estate' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '35c2f9c6ed90db9f11375e431d992cd21e7e3041';
-- brands|E.P. Carrillo|history|zh — 人名品牌拉丁字母；日期
UPDATE `brands` SET `history_zh` = '创立这家以其名字缩写命名的企业时，Ernesto Perez-Carrillo 已经走完了整整一段职业生涯。他生于古巴，在迈阿密接手了家族的小工厂 El Crédito，并在那里重振了一个沉睡的品牌：La Gloria Cubana。成功之大，使得原本始于小哈瓦那作坊的生产不得不迁往多米尼加共和国，而 General Cigar 集团在九十年代末买下了整体。

他本可以就此止步。年过六十，他离开集团，与两个孩子一起，在圣地亚哥一座新工厂里重新开始。这在业内极为罕见：一位公认的调配师从零起步，没有可沿用的品牌名，只赌自己的签名足够。

这家的风格辨识度很高——中至浓的路子，结构极为讲究，你感受到的是比例的推敲，而非力度的炫示。相对于大集团，产量始终不大，而这是刻意的。

这家卷制了 Black Swan 的第三版。这个系列归美国零售商 CigarPage 所有，每一版都交给不同的工厂。这一版出自多米尼加共和国，而另外三版来自尼加拉瓜与洪都拉斯。Oliva 与 Rocky Patel 在它之前，Joya de Nicaragua 在它之后。这个名字不属于四家中的任何一家：它是一份订制，不是这家自己的品牌。

另有两个名称要经过 Casa Carrillo，这是 Tabacalera La Alianza 自2024年2月起使用的名称，但它们并不属于该公司。Gilbert de Montsalvat 是 Raymondo Bernasconi（The Royal Cigar Company，巴塞尔）的品牌，于2008年4月1日正式推出；据 Zigarren.Zone，15 Years 版本（2024年6月）在那里以 Ernesto Perez-Carrillo 的拼配卷制，而 Signature 系列（2023年）则出自 Tabacalera Diaz Cabrera，在 Eladio Diaz 处。Conspiracy 属于 Quality Importers Trading Company；发货于2024年8月开始。EPC 是 Cigarworld 用来归类该公司产品目录的缩写。'
 WHERE `name` = 'E.P. Carrillo' AND SHA1(TRIM(`history`)) = 'ed7b2a21999f2ccb592929c1944d6a82fd99b14e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'E.P. Carrillo' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'ed7b2a21999f2ccb592929c1944d6a82fd99b14e';
-- brands|El Rey del Mundo|history|zh — 街道、地名未译
UPDATE `brands` SET `history_zh` = '这个名字的意思是世界之王。维基百科和 Origin of Cigar 写道，该品牌据称由德国人 Emilio Ohmstedt 于1848年创制，与 Sancho Panza 同时；Origin of Cigar 还转述了另一种说法，即把 Antonio Allones 本人视为1848年的创始人。Habanos 把1882年定为推出时间，当时由 Antonio Allones 主持，他在哈瓦那制作雪茄已超过三十年，推出的是一个品质与价格都高的品牌，其名号很快因声望而闻名。

Habanos 称其风味轻至中等，采用 Vuelta Abajo 的叶片，手工长茄芯卷制。Habanos 还写道，该品牌常用于地区限量版。维基百科写道，它在1960年代和1970年代依然广受欢迎。

Origin of Cigar 于2025年12月写道，标准产品线只有 Choix Suprême 和 Demi Tasse。据 Alchetron 转载的维基百科，Choix Suprême 是 Hermoso No.4，127 mm、cepo 48；Demi Tasse 是 Entreacto，98 mm、cepo 30。

另有一款洪都拉斯的 El Rey del Mundo，由 Villazon 家族制作，维基百科如是说：那是另一种雪茄，本词条只涉及 Habanos S.A. 的古巴品牌。

它在哪里卷制？在古巴，这个问题的答案分两层。自2002年起，Habanos 的每个品牌都有一家母厂，负责选叶和配方，其雪茄可以在岛上几十家工厂中的任何一家、在母厂监督下卷制；Habanos 不公布这张图，由行业媒体拼出来。Habanos 没有为 El Rey del Mundo 点名任何工厂。行业媒体（2014年4月）称，贝拉斯科艾因街852号，又称 Briones Montoto 工厂，是1940年的一本名录划给 El Rey del Mundo Cigar Company 的建筑，Romeo y Julieta 品牌曾设在那里直到2000年；行业媒体于2011年写道，贝拉斯科艾因街852号的 Romeo y Julieta 工厂当时以 H. Upmann 之名运转，Partagás 的生产将转到 El Rey del Mundo 工厂，该厂于5月因翻修关闭；Origin of Cigar 把 Romeo y Julieta 自2015年起定在马里亚瑙的 Carlos Baliño 工厂，即 José L. Piedra 的旧址。这些页面对该品牌现在的工厂说法不一，且没有一页说 Carlos Baliño 曾用 El Rey del Mundo 之名。2026年10月，habanos.com 的 Habanos Brands Academia 页面把 El Rey del Mundo 列入一个27个品牌的组合中的另外十三个品牌，不在六个全球品牌、五个价值品牌和三个销量品牌之内。一个品牌两个日期：维基百科和 Origin of Cigar 为1848年、Emilio Ohmstedt，habanos.com 为1882年、Antonio Allones，并把它当作高价品牌的推出；Origin of Cigar 补充说，该品牌1873年已见于哈瓦那名录，Allones 据某些来源于1882年重新注册了它。行业媒体于2011年写道，Partagás 的生产将并入 El Rey del Mundo 工厂，该厂当时因翻修关闭。'
 WHERE `name` = 'El Rey del Mundo' AND SHA1(TRIM(`history`)) = 'b12e53128e0e6ed7508ab9a8bc5bc0571d308707';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Rey del Mundo' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'b12e53128e0e6ed7508ab9a8bc5bc0571d308707';
-- brands|El Titan de Bronze|history|zh — 品牌名拉丁字母；日期
UPDATE `brands` SET `history_zh` = '在小哈瓦那的第八街，几位卷制师在橱窗后徒手工作，距路人不过几米。El Titan de Bronze 是迈阿密仅存的几家仍在运作的雪茄厂之一，也无疑是极为显眼的一家：你能看见他们卷制。

这对图册很重要。1960年之后，迈阿密曾是古巴流亡者的首都，是离岛卷制师们的避难所；那里曾有数十家作坊，如今几乎全部消失。留下来的只剩寥寥数处地址，而这一处仍在按古巴方法培养卷制师——全程手工，极讲究的形制不借助机械模具。

这家企业既卷制自己的系列，也以极小批量为那些想要「美国制造」雪茄的品牌代工。以行业尺度衡量，产量微不足道；但其遗产价值并非如此。

Altezas Reales 1871 是 Rafael Cifuentes III 的品牌，他是 Ramón Cifuentes Llano 的曾孙，后者是 Partagás 工厂的前任所有者。该品牌于2023年9月在佛罗里达州的 Dadeland 亮相，在迈阿密的这家工厂卷制：厄瓜多尔 Habano 茄衣，配尼加拉瓜茄套和茄芯，规格为 Robusto、Corona 和 Toro，宣布的产量为每种规格 1 000 盒。Cifuentes 表示，他的灵感来自1990年代的 Partagás，尤其是 Serie D No. 4；他通过自己的公司 Flor de Tabacos La Lealtad 销售该品牌。2026年10月，Luxury Cigar Club 显示所有规格均已售罄。'
 WHERE `name` = 'El Titan de Bronze' AND SHA1(TRIM(`history`)) = 'c0cd0a224095a2b0d1867fb0ef2675ccb06c4f7e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Titan de Bronze' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'c0cd0a224095a2b0d1867fb0ef2675ccb06c4f7e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Excalibur' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '037aab664d5e203968eda281d8b796bb007ba6a6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fonseca' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'd4be418515eb10180ed1ba88713bea944d579d1a';
-- brands|Foundation Cigar Company|history|zh — 人名品牌拉丁字母；日期
UPDATE `brands` SET `history_zh` = 'Nicholas Melillo 在创立自己的企业之前，曾用约十年时间为埃斯特利的一家大厂挑选烟叶。这段经历解释了 Foundation 的定位：这个品牌并不以收藏家的冒险自居，而是一个从内部熟悉田地、采收与发酵的人的作品。

其2015年的奠基配方 El Güegüense，得名于一部尼加拉瓜民间戏剧——一出口口相传数百年的殖民时期讽刺剧，已列入人类非物质文化遗产。这一选择透露了这家的抱负：让一支雪茄扎根于一种文化，而不只是一方风土。

另一系列 Charter Oak 则从另一端出发——康涅狄格河谷，Melillo 在那里长大，那里也出产业内使用极广的美国茄衣。一家尼加拉瓜企业主张自己有一条北方的根：这很少见，而且是自觉的。

2024年3月，Foundation 宣布 El Güegüense 这一名称正在淡出：The Wise Man Corojo 取代首款拼配，并经重新制作，生产也从 Aganorsa Leaf 转至 My Father Cigars S.A.，该公司由 Pepín García 掌管。The Wise Man 这一名称始于2017年7月：它起初用于 Maduro 版本。2026年10月，该公司网站展示 The Wise Man Corojo，采用尼加拉瓜 corojo ''99 茄衣，共四种规格，从 Corona 到 Doble Corona。'
 WHERE `name` = 'Foundation Cigar Company' AND SHA1(TRIM(`history`)) = 'c7d22b0095089bc2786258b44ce4428591ef60bc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Foundation Cigar Company' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'c7d22b0095089bc2786258b44ce4428591ef60bc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'General Cigar' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '48b02cefa436d25c4b625c8340f4751688b72eb1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'H. Upmann' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '5ff9e27abff78c0f1e287749fb28fc43ee9804fa';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Hoyo de Monterrey' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'a990410a4552e412eecc823ea387211417074557';
-- brands|J.C. Newman|history|zh — 人名品牌改拉丁字母
UPDATE `brands` SET `history_zh` = 'J.C. Newman 是美国至今仍在运营的历史极为悠久的家族雪茄企业。匈牙利移民 Julius Caeser Newman 于1895年在克利夫兰父母的谷仓里卷出了头一批雪茄。四代之后，这家企业仍在家族手中——在一个几乎所有历史名号都被集团收购的行业里，这是独一无二的。

1954年，公司迁往佛罗里达州坦帕，进入一栋1910年建成、顶上有一座钟的砖砌厂房：El Reloj（钟）。这栋建筑是伊博城仅存的仍在运作的大型雪茄作坊；二十世纪初，这个街区年产数亿支雪茄，当时被称为世界雪茄之都。

如今 El Reloj 里安放着1930年代的卷制机器，至今仍在运转，以一种再无他人使用的工艺生产雪茄。这家企业把这份延续性当作自己的主题：它向访客开放工厂，并像记录工业遗产那样记录自己的机器。

旗下两个高端品牌 Diamond Crown 与 Cuesta-Rey 出自多米尼加共和国的 Tabacalera A. Fuente；二者在本图集中各有专条，也正因如此归在那里。但这个家族也自己卷制，而本词条的初版说的恰恰相反：自2011年起，它在埃斯特利拥有一家工厂 PENSA——Puros de Estelí Nicaragua S.A.——以 Quorum 与 El Baton 开厂，随后有了 Perla del Mar 与 Brick House，日产超过十万支。Omar Ortez——本图集在 Agrotabacos 词条讲过他——与 Lázaro López 共同管理。而 El Reloj 仍留在坦帕。'
 WHERE `name` = 'J.C. Newman' AND SHA1(TRIM(`history`)) = '5ece0eda6f0fb41e52e5a70b1d3ee3b185e930d9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'J.C. Newman' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '5ece0eda6f0fb41e52e5a70b1d3ee3b185e930d9';
-- brands|José L. Piedra|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = '2026年10月，habanos.com 把 José L. Piedra 与 Quintero、Vegueros 一起列为其品牌组合中的三个所谓量产品牌。

Habanos 把该品牌与 Piedra 家族联系起来：该家族1880年代从阿斯图里亚斯而来，定居在圣克拉拉附近，位于雷梅迪奥斯地区的中心，那里自十六世纪起种植烟草。据 habanos.com，七个尺寸均以雷梅迪奥斯烟叶制成，全部手工卷制，采用短茄芯（tripa corta）。品牌方展示出更现代的形象；Petit Caballeros 已采用这一形象，为十二支一包，以及陈列架上十五个三支装的小盒。

Habanos 给出的力度为中等至浓郁。

一些零售商把该品牌定在1880年代，称其在1990年代初被撤下，1996年重新推出（Puroexpress、Cigar Keep）；habanos.com 没有给出其中任何一个日期。

它在哪里卷制？在古巴，这个问题的答案分两层。自2002年起，Habanos 的每个品牌都有一家母厂，负责选叶和配方，其雪茄可以在岛上几十家工厂中的任何一家、在母厂监督下卷制；Habanos 不公布这张图，由行业媒体拼出来。habanos.com 没有为该品牌点出任何工厂；一家零售商（Puroexpress）把生产定在圣克拉拉。2026年10月，habanos.com 把 José L. Piedra、Quintero 与 Vegueros 列为其二十七个品牌中的三个量产品牌；行业媒体于2019年8月1日宣布了这一组合，当时的品牌组合为二十一个品牌。官方页面说 Piedra 家族1880年代从阿斯图里亚斯来到古巴，定居在圣克拉拉附近，品牌由第二代 José Lamadrid Piedra 创立。全系列为手工短茄芯，只用雷梅迪奥斯烟叶。'
 WHERE `name` = 'José L. Piedra' AND SHA1(TRIM(`history`)) = '857ff0f3a83596a87e87bb6a556198c3ef2eaa0c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'José L. Piedra' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '857ff0f3a83596a87e87bb6a556198c3ef2eaa0c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Joya de Nicaragua' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'de6b9de102a70fe1300cafba39839b45a7025788';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Juan López' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'c7d8fc1ed352220c9ef05c0850a4b2f91620b69f';
-- brands|La Aurora|history|zh — 品牌人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'La Aurora 是多米尼加共和国年代居首的雪茄厂，也是业内少数至今仍由创始家族掌管的字号之一。1903年，Eduardo León Jimenes 在西瓦奥山谷腹地的圣地亚哥-德洛斯卡巴列罗斯创办了它——四分之三个世纪之后，这片山谷将成为多米尼加高端雪茄产地的核心。

这份先来后到很要紧。1960年之后，古巴制造商外流把这个国家变成雪茄之都时，La Aurora 已经在那里六十年了：有自己的烟田、自己的晾房，还有在本地带出来的卷制师。这家厂不必落脚，它接纳了别人。

风格里看得出来。当许多多米尼加厂商追逐柔顺时，La Aurora 守住了骨架更明确的中度调性，常以喀麦隆茄衣为底——潮流转身离去时，它仍留着这个签名。风味为香料木、烤榛子与浅色皮革。

如今产品线覆盖数个家族，从日常之作到每逢整十年推出的纪念系列。2003年的百年纪念是个转折：从那时起，La Aurora 才为本土市场之外的人所知。

Tatiana并不属于La Aurora：它是Miami Cigar & Co.的调味雪茄品牌，以其创始人之女命名，据该公司称于1998年推出。2024年五月，一家雪茄资讯网站写道，La Aurora生产Tatiana Delights的拼配，除带甜味的一端外不添加香味，规格为Robusto、Toro和Churchill。2026年八月，新规格Cappuccino和Amaretto，即6 x 44和十支装tins，正发往美国零售商。'
 WHERE `name` = 'La Aurora' AND SHA1(TRIM(`history`)) = '12681ad871698de7abb252ca26fe7b19371aa65b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Aurora' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '12681ad871698de7abb252ca26fe7b19371aa65b';
-- brands|La Flor de Cano|history|zh — 品牌名改拉丁字母
UPDATE `brands` SET `history_zh` = 'La Flor de Cano 是人们背诵古巴品牌名录时会漏掉的那一个。

Habanos 在2015年3月26日的新闻稿中称它是源自1884年的古巴历史品牌，未点出创始人。两家英国零售商称它始于1932年，出自 Juan Cano，其中一家写明是 Juan Cano Sainz 和他的妻子 Consuela，两人曾让人在自家厨房的桌子上卷制雪茄：两种说法不一。一家英国零售商写道，常规规格长期是机器制作的，如今雪茄则完全手工制作。Habanos 则把该系列介绍为全手工卷制、短茄芯，并含 Elegidos 规格；该品牌还推出过地区限定版：面向英国的 Short Robusto（2010年）、面向加拿大的 Siboney（2015年）、面向英国的 Selectos No.3（2023年）。

一家英国零售商称它不易买到，因产量有限。Habanos 给出的浓度为中等，用的是 Vuelta Abajo 产区的烟草；零售商也提到 Vuelta Abajo 和 Semi Vuelta 的烟草。

一家零售商给出2023年 Selectos No.3 版的发行量为125 000支雪茄、5 000盒，每盒25支；Habanos 给出 Siboney（2015年）为2 000盒，每盒25支。

它在哪里卷制？在古巴，这个问题的答案分两层。自2002年起，Habanos 的每个品牌都有一家母厂，负责选叶和配方，其雪茄可以在岛上几十家工厂中的任何一家、在母厂监督下卷制；Habanos 不公布这张图，由行业媒体拼出来。行业媒体（2011年）点名 La Corona（Miguel Fernández Roig 厂，位于塞罗区）为 Flor de Cano 的母厂；Habanos 没有点名任何工厂。零售商称2010年的 Short Robusto 在 La Corona 卷制，而 Selectos No.3（2023年）在古巴圣地亚哥的 El Caney 工厂卷制，由 La Corona 监督。2026年10月，habanos.com 把它列入组合中的另外13个品牌（21个组合品牌，加上6个全球品牌共27个）。该品牌的官方页面既不给日期也不给创始人；页面称全系列（含 Elegidos）为全手工卷制短茄芯，浓度中等，用 Vuelta Abajo 烟草。仍有一处分歧：Habanos 2015年的新闻稿称 Siboney 为长茄芯。'
 WHERE `name` = 'La Flor de Cano' AND SHA1(TRIM(`history`)) = '46249bd9bf4b6bfee0e7ff078034a32bce954f4f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Flor de Cano' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '46249bd9bf4b6bfee0e7ff078034a32bce954f4f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Gloria Cubana' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'e09e0293e7b7719473f576dd98f03ba81d256a17';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Liga Privada' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'e49b5a4be81ca18ee5fe3bec70f95cba4b9a05c3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Macanudo' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'c7dcdeaf8659e7687b40ed5015414f5c28d48a5f';
-- brands|Matilde|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'José Seijas 曾数十年执掌拉罗马纳的雪茄工厂，业内规模极大的几家之一——位于拉罗马纳，年产数千万支，肩负着一种少有人能体会的稳定性责任。离开那个岗位后，他于2013年与两个儿子 Ricardo 和 Enrique 一同创立了 Matilde。

这个名字并非来自家族，而是来自这个国家的历史：Tabacalera La Matilde 是一家1876年至1910年间活跃的多米尼加烟厂。Seijas 一家想找的是一个属于自己岛屿的旧名字，而不是再添一个姓氏——于是他们让那个名字复活了。

规模上的反差正是这家企业的主题。在用整个职业生涯保障工业化产量的恒定之后，Seijas 办起了一个小批量品牌：每一款配方都出自他手，而全年产量相当于他从前的工厂一天的产出。

风格承载着这份经历：结构极为讲究的雪茄，具备典型的多米尼加式平衡，其制作的稳定性透露出做它的人是谁。José Seijas 于2024年去世；他的儿子们守着这家企业。

José Seijas 于 2024 年 11 月去世，享年七十四岁。1974 年，二十四岁的他被 Consolidated Cigar 聘用；也正是他在八十年代把拉罗马纳的工厂从机制带到了手卷。

本图集欠他的不止这一条目：多米尼加的 Montecristo、多米尼加的 Romeo y Julieta、VegaFina、多米尼加的 H. Upmann 与 Don Diego，都由他调配或督造。本图集收录的五个品牌，有一部分靠的是同一个人的手艺——而 Matilde 是其中唯一出自他自己选择的一个。'
 WHERE `name` = 'Matilde' AND SHA1(TRIM(`history`)) = '97aee70e16dff0fa4dfe7cc979f6027628c5615f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Matilde' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '97aee70e16dff0fa4dfe7cc979f6027628c5615f';
-- brands|Mombacho|history|zh — 品牌名改拉丁字母
UPDATE `brands` SET `history_zh` = '尼加拉瓜几乎所有的雪茄厂都在北部烟草产区埃斯特利。Mombacho 却反其道而行，落户于格拉纳达——尼加拉瓜湖畔的殖民古城，坐落在赋予它名字的火山脚下。这不是无关紧要的地理细节：这家企业在旅人往来之处卷制雪茄，厂址是一栋对访客开放的老宅，而它把这份可亲近性当作自身主张的一部分。

烟叶本身则和别家一样来自北方——格拉纳达周边没有烟草风土。这家企业所主张的在别处：短批量、人本尺度的作坊，以及烟客与工坊之间的直接关系——在这个几乎从不让人参观雪茄诞生之地的行业里，这是逆流而行。

在本图册中，它是极为鲜明的例子：一家企业的价值，既在产品，也在地点。

后来的事必须写下来。2023 年 6 月 9 日，Mombacho 创办人 Cameron Heaps 与 Favilli 总裁 Jared Michaeli 宣布这家公司永久关闭，并退出这一行。总裁兼首席调配师 Claudio Sgroi 已于 2021 年离开；2014 年买下的那座宅邸改成了高端接待场所，而品牌再没能找回自己的市场。

因此，本条目是一份档案条目。它所描述的——格拉纳达的作坊、参观、小批量——曾经存在，如今不复存在。'
 WHERE `name` = 'Mombacho' AND SHA1(TRIM(`history`)) = '201ddd358975bd2704b6dba9d9de7ef6d18ab0a3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Mombacho' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '201ddd358975bd2704b6dba9d9de7ef6d18ab0a3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Montecristo' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'ad1f1b6a578baae33540526edd6ed21a1f791506';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'My Father' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '460a88c8b0ca2757a19f0ca7db6e6b7780522336';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oliva' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'db0fae8283fe6b66aa71f230dc9ddda7334ed538';
-- brands|Ozgener Family Cigars|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Ozgener 也是 CAO 的名字，即纳什维尔那家由土耳其工程师出身的雪茄匠 Cano Ozgener 创办的公司。其子 Tim 在出售给 General Cigar 之前任总裁。2022年初他以自己的名字重返行业，带来两款配方——Bosphorus，伊斯坦布尔海峡；Pi Synesthesia，一支玩转色彩与感知的雪茄。

它没有工厂。Bosphorus 于2022年6月宣布，起初在埃斯特利的 Luciano（前称 Tabacalera Pichardo）卷制——那是 Eradio Pichardo 的工厂，本图集载有其词条——2022年11月起改交多米尼加共和国 E.P. Carrillo 的工厂 Tabacalera La Alianza（2024年更名为 Casa Carrillo）卷制；该厂也卷制第二条线 Aramas（2023年3月宣布，以阿拉拉特山命名）与2024年的 Firsat。Karatoba（2025年）来自埃斯特利的 NACSA；Maracana（2026年3月）来自洪都拉斯的 My Father；限量版 World Cup 2026 来自尼加拉瓜的 My Father。本图集将该词条归入多米尼加共和国，五个现行系列中有三个在那里卷制，其中包括首个系列 Bosphorus；没有任何页面给出各工厂的产量。2026年10月，smokingpipes.com 仍称 Bosphorus 在尼加拉瓜的 Pichardo 卷制，而该公司称其在 Tabacalera La Alianza 制造。

这是本图集在 Seijas 家与 Eiroa 家见过的那种人脉网：父亲创办 CAO，儿子执掌、出售，再带着家族的名字——博斯普鲁斯、阿拉拉特——回到由他人制作的雪茄上。

这家公司也写作Oz Family Cigars。其于2022年以Ozgener Family Cigars之名推出，后来将其缩短：PCA展会2024年四月的一篇报道写道，已作出称作Oz Family Cigars的选择，2026年三月其两款已宣布的版本Maracana和World Cup 2026也采用这一名称。2026年十月，smokingpipes.com将其雪茄归在OZ Family名下。Crowned Heads负责分销这些雪茄（Tim Ozgener于2022年成为其投资人，并于2025年四月出任总经理），2026年三月时仍是如此。'
 WHERE `name` = 'Ozgener Family Cigars' AND SHA1(TRIM(`history`)) = '438ddab53a459aa36992d0f1b1e39952c75e5be8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ozgener Family Cigars' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '438ddab53a459aa36992d0f1b1e39952c75e5be8';
-- brands|Padrón|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'José Orlando Padrón 生于1926年6月10日，出生地在古巴比那尔德里奥地区，家人在那里种植烟草；据 padron.com，他于1961年4月离开哈瓦那，途经西班牙，1962年2月抵达迈阿密。他一边修剪草坪，一边做木匠，在那里挣到600美元，凭此得以在1964年9月开办 Padrón Cigars，仅有一名卷制师。尼加拉瓜埃斯特利地区的土壤和小气候与比那尔德里奥相近，吸引了他；据这家字号所述，他早在1967年就向那里运送烟草，并于1970年把生产设在那里。

1978年，José Orlando 参与了与古巴政府的谈判，促成政治犯获释；Holt''s 写道，迈阿密的反卡斯特罗群体自那时起视他为叛徒。据 Holt''s，他在迈阿密的场所在1979年7月26日至1983年间三次遭炸弹袭击，此前已有首枚炸弹于1979年3月未爆；反卡斯特罗团体 Omega 7 声称对1983年1月小哈瓦那 Padrón 工厂的爆炸负责（UPI），而 padron.com 则提到一小撮当地敲诈者的未遂袭击。在尼加拉瓜，内战于1978年毁掉了埃斯特利的工厂，美国自1985年至1990年的禁运又促使家族改在洪都拉斯的丹利生产，那里已于2007年停止卷制雪茄。

1994年，这家字号为三十周年推出了 1964 Anniversary，随后又为 José Orlando 的七十五岁生日推出了 Serie 1926。其农场分布在埃斯特利周围。José Orlando 于2017年12月去世，享年91岁；据行业媒体称，他的儿子 Jorge（1991年进入公司）在2021年11月掌管着公司。'
 WHERE `name` = 'Padrón' AND SHA1(TRIM(`history`)) = 'bfc5e8ae7b4eac5c0f3b4313e493437debd79fda';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Padrón' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'bfc5e8ae7b4eac5c0f3b4313e493437debd79fda';
-- brands|Partagás|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Habanos 官方页面称，Partagás 工厂由 Don Jaime Partagás 创办于1845年。他1816年12月7日生于 Arenys de Mar（加泰罗尼亚），1831年定居古巴，在那里创办了 La Flor de Tabacos Partagás；Gran Enciclopèdia Catalana 称，该厂接续的是一家更早的工厂，即 Joan Conill i Pi 的工厂。同样据 Habanos，这家工厂在哈瓦那国会大厦后面的工业街520号待了许多年，如今在圣卡洛斯街806号；该页面没有给出变动的时间。维基百科和 EcuRed 把1845年的地址放在克里斯蒂娜街1号，早于工业街（据 EcuRed 为1850年，该来源把创办时间定在1838年）。

Habanos 把 Partagás 雪茄描述为凭浓烈的风味即可立刻辨认，力度为“Fuerte”，以 Pinar del Río 的 Vuelta Abajo 烟叶拼配而成。

La lectura，也就是工作时为卷制师高声朗读，并非诞生于 Partagás：EcuRed 把首次在工厂里的朗读定在1865年12月21日，地点是哈瓦那的 tabaquería El Fígaro，而 Partagás 工厂的朗读则定在1866年1月9日。Jaime Partagás 接受了这一请求，条件只有一个，即事先审查所读作品，EcuRed 和 Mental Floss 都这么说；后者认为，烟草工人兼报纸 La Aurora 出版人 Saturnino Martínez，也许是首位在烟叶之间读报纸和书籍的人。Mental Floss 还补充说，工人们会对文本进行表决，并喜爱 Alexandre Dumas 和 Victor Hugo。1866年，La lectura 被总督 Francisco Lersundi 禁止，十年战争（1878年）之后恢复；Mental Floss 随后又展示它跟随古巴卷工来到佛罗里达的坦帕和基韦斯特。

Jaime Partagás 于1868年去世：Gran Enciclopèdia Catalana 称他1868年7月17日死于 Pinar del Río，死因是在一场因商业竞争而起的斗殴中所受的枪伤；EcuRed 则说他与一位邻居有土地纠纷，据称这场纠纷使他6月身受致命重伤，一个月后去世；维基百科称他在自己的一处种植园里被杀。他的儿子 José 接手了生意，随后工厂转到银行家 José A. Bances 和 Cifuentes 家族手中，据维基百科，该家族把它改名为 Cifuentes y Cía；古巴政府于1960年9月15日没收了这家工厂，同时没收的还有另外十五家。Serie D No. 4 是一支 50 × 124 毫米的罗布图（据维基百科的列表），列在 Habanos 称为该品牌特别知名的规格之中，同列的还有 Lusitanias、8-9-8 和 Pirámide Serie P No. 2；Serie D No. 4 的 Reserva，Habanos 写道，是这家字号做出的首个 Reserva。

Lusitanias（49 × 194 毫米）是该品牌首款 Gran Reserva，即 Cosecha 2007 所用的规格，Habanos 于2013年12月23日以五千个编号盒推出，每盒十五支；Habanos 称这一规格庄严雄伟。8-9-8 Varnished 据维基百科的列表是一支约 171 毫米、环径 43 的 dalia（lonsdale）；其名称来自漆面盒中二十五支雪茄的排列——八支、九支、再八支——这是零售商 Cigars Unlimited 的解释，该店给出的尺寸为 6 ¾ 英寸。

它在哪里卷制？在古巴，这个问题的答案分两层。自2002年起，Habanos 的每个品牌都有一家母厂，负责选叶和配方，其雪茄可以在岛上几十家工厂中的任何一家、在母厂监督下卷制；Habanos 不公布这张图，由行业媒体拼出来。它的母厂是 Partagás。2011年底，行业媒体写道，工业街的工厂——Partagás、Bolívar、La Gloria Cubana、Ramón Allones 和 Quai d''Orsay 的母厂——将因施工而关闭，其生产将转到原 El Rey del Mundo 厂；该媒体2020年则写道，这家工厂已于2011年因翻修而关闭，而维基百科给出的搬迁日期是2012年1月2日。2026年10月，habanos.com 的“Brands Academia”页面列出27个品牌，其中六个为全球品牌——Cohiba、Montecristo、Romeo y Julieta、Partagás、Hoyo de Monterrey、H. Upmann——Habanos 将它们介绍为对爱好者而言相关度和知名度都排在前列的品牌；2019年，行业媒体为这一分类标注了日期，并写道全球品牌在凡有古巴雪茄之处和所有 Casa del Habano 都有售。行业媒体统计，2016年初现场有209名卷工，约有240个工位，并指出仍可在原工厂购买雪茄，那里已不再卷制；2020年7月，该楼的一处屋顶坍塌，据 Habanos 的消息来源称无人受伤，该楼连同入口处的 Casa del Habano 被关闭。'
 WHERE `name` = 'Partagás' AND SHA1(TRIM(`history`)) = '5a273d450461fad63e1c5d00255c78880c61d13b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Partagás' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '5a273d450461fad63e1c5d00255c78880c61d13b';
-- brands|Partagás USA|history|zh — 卷烟师改卷工
UPDATE `brands` SET `history_zh` = 'Partagás 是两个不同品牌共用的名字：一是 Habanos S.A. 旗下的古巴 Partagás，在哈瓦那手工卷制；二是美国的 Partagás，不含古巴烟叶，本图鉴将其归入多米尼加共和国，因为它在那里卷制。两者只共享名字、哈瓦那创立的 1845年，以及红金相间的烟标设计。

General Cigar 自 1978年起在美国持有该品牌（维基百科）；生产起初在牙买加，一年后转到多米尼加共和国圣地亚哥-德洛斯卡瓦列罗斯的工厂（维基百科；行业媒体，1995—1996年冬季）。1995年，自由区的这家工厂约有 600 名员工，其中 200 名是卷工。General Cigar 隶属于 Scandinavian Tobacco Group（STG）；烟标上印的是“1845”，而不是“Habana”。

行业媒体在 1995年记录到，这家工厂每年出产约八百万支 Partagás。这款 Partagás 已成为美国爱好者的选择：他们因禁运而买不到古巴版，只能在自己的市场上找到它。

在现行系列中，行业媒体提到 1845，2012年推出，采用厄瓜多尔 Habano 茄衣，与喀麦隆茄衣的 Partagás 形成断裂；还有 Black Label，据零售商称采用 Connecticut Broadleaf 马杜罗茄衣。2015年，Aniversario 170 问世，采用日晒栽培的喀麦隆茄衣（2015年11月20日一期）。2025年，STG 把一款版本 Y Nada Más Santiago 交给圣地亚哥附近塔姆沃里尔的 Tabacalera William Ventura（仅见标题）。'
 WHERE `name` = 'Partagás USA' AND SHA1(TRIM(`history`)) = '0baa2557196f73476ce0116995e9a68010ee4c8a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Partagás USA' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '0baa2557196f73476ce0116995e9a68010ee4c8a';
-- brands|Perdomo|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = 'Nick Perdomo Jr. 于1992年8月在迈阿密创办 Nick''s Cigar Co.（据维基百科，地点是他的车库），当时他并未辞去迈阿密机场空中交通管制员的职务。这个家族有古巴渊源：维基百科把它与圣何塞-德拉斯拉赫斯（San José de las Lajas）联系起来，他的祖父 Silvio 即来自那里；其父 Nick Sr. 先后在 Partagás 与 H. Upmann 工作，革命后离开古巴。关于尼加拉瓜的起步，各方说法不一：2001年的行业媒体称1995年在埃斯特利有首家工厂，1999年有一家更大的；维基百科则称1997年设厂，1999年被取代。

2026年10月，该厂自称是家族企业，且纵向一体化，从种烟到分销一应俱全：总部在迈阿密，制造在埃斯特利，土地在埃斯特利、孔德加与哈拉帕。2001年并非如此：当时行业媒体写道，Perdomo 没有自己的田地，烟草购自供应商，其中包括埃斯特利 ASP Enterprises 的 Perez 家族。

20th Anniversary 于 IPCPR 2012 亮相，纪念该厂成立二十周年：这是一支采用古巴种子的尼加拉瓜 puro，茄衣有 Sun Grown 与 Maduro 两种，烟叶来自埃斯特利、孔德加和哈拉帕的农场。该厂如今也提供厄瓜多尔 Connecticut 茄衣的版本；烟叶至少陈化八年，茄衣随后入波本桶。'
 WHERE `name` = 'Perdomo' AND SHA1(TRIM(`history`)) = 'ba78d4576e80c6f58666d52e8c141ae1f1b808d2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Perdomo' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'ba78d4576e80c6f58666d52e8c141ae1f1b808d2';
-- brands|Plasencia|history|zh — 人名改拉丁字母
UPDATE `brands` SET `history_zh` = '据该厂所述（plasenciacigars.com，2026年10月），Plasencia 家族自1865年起种植烟草，已传五代。据 Cigars Direct 的博客（2020年），一切始于 Eduardo Plasencia，他从加那利群岛来到古巴的阿巴霍谷。

关于后来的事，各方说法不一。据 Cigars Direct（2020年），古巴政府于1963年没收了农场，Don Sixto 取道墨西哥前往尼加拉瓜，约在1965年于当地种植；桑地诺叛军1978年烧毁了他的农场，家族迁往洪都拉斯。据行业媒体，没收农场的是1979年桑地诺政权的上台；维基百科则说是1980年代初。Néstor Plasencia 于1986年接手烟草业务（Cigars Direct）；尼加拉瓜的奥科塔尔工厂，据维基百科1992年开业，据行业媒体则为1994年。

很长一段时间里，这个家族主要以种植者和代工制造商闻名。据行业媒体，它向 Davidoff 供应烟叶，并为 Rocky Patel 和 Alec Bradley 等品牌制造雪茄；维基百科还提到 Swisher。

2016年，家族创立分销公司 Plasencia 1865，并以自己的名字推出 Alma 系列，其中 Alma Fuerte（强悍的灵魂）是首支雪茄。据 Cigar Coop（2018年），这是一支以 Criollo ''98 为基础的尼加拉瓜 puro，烟叶来自孔德加、埃斯特利、哈拉帕与奥梅特佩。来自洪都拉斯的 Cosecha 系列于2017年底接续推出，首款是 Cosecha 146。

2026年10月，该厂宣称在尼加拉瓜与洪都拉斯的七个产区拥有农场（孔德加、埃斯特利、哈拉帕山谷与奥梅特佩；Jamastrán、Talanga 与 Azacualpa），面积达4900多英亩。

据cigarworld.de，Plasencia也卷制Astoria de Nicaragua，这是一个在德国销售的品牌。2026年十月，该零售商供应这一品牌，进口商为Tabac Benden GmbH（Düsseldorf），制造商为位于Estelí的Tabacalera Plasencia：手工卷制，茄芯为mediumfiller，全部采用尼加拉瓜烟叶。该零售商将Classic列入目录，始于2010年十月1日，将Crimez系列（Hate、Kidnapping、Manslaughter）列入目录，始于2025年四月23日，并自2024年起直接进口，其原进口商已停止营业。'
 WHERE `name` = 'Plasencia' AND SHA1(TRIM(`history`)) = 'c42d2ee4f4de48656611c078c4ab7a7d50b2a106';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Plasencia' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'c42d2ee4f4de48656611c078c4ab7a7d50b2a106';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Por Larrañaga' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'e14cf3c0c8e2490f749bdab472a0e91dd3fcaa7d';
-- brands|Punch|history|zh — attribution habanos.com mal rendue
UPDATE `brands` SET `history_zh` = 'Habanos 在其2025年12月庆祝品牌185周年的新闻稿中写道，Punch 于1840年注册并随即创立，以服务不断增长的英国市场；其品牌页面只说是19世纪中叶，并称它由 Don Manuel López de Juan Valle y Cía 创立，该公司想进入英国市场，而当时一份同名的幽默刊物在那里广受欢迎。维基百科写道，该品牌于1840年由一位名叫 Stockmann 的德国人注册，1874年被 Luis Corujo 买下，1884年又被 Manuel López Fernández 买下，其名称源自木偶 Mr. Punch；而杂志 Punch 则是在1841年7月17日首次出版。

小丑 Mr. Punch 是同名刊物的象征，至今仍出现在每个盒子上，手里拿着一支 Habano，habanos.com 如是说，其2025年的新闻稿把该品牌与 Punch & Judy 的标志联系起来。

维基百科写道，Fernández, Palicio y Cía 公司于1930年买下该品牌，而 habanos.com 说1931年 Punch 转入 Hoyo de Monterrey 的工厂，并说美国禁运之后，Fernando Palicio 把自己的品牌卖给了 Villazon & Co. 的 Frank Llaneza 和 Dan Blumenthal，他们用洪都拉斯烟叶为美国市场制造 Punch，此后古巴将这一行业国有化，Punch 的生产得以继续。这款洪都拉斯的 Punch 与 Habanos 旗下的古巴 Punch 是两种不同的雪茄。

Habanos 把 Punch 归入其力度中等（「Medium」）的品牌，采用 Vuelta Abajo 的烟叶，以长茄芯手工卷制。

据维基百科的规格列表，Double Corona 长 194 mm，cepo 49（vitola de galera Prominentes），Punch 长 143 mm，cepo 46（Corona Gorda）。

它在哪里卷制？在古巴，这个问题的答案分两层。自2002年起，Habanos 的每个品牌都有一家母厂，负责选叶和配方，其雪茄可以在岛上几十家工厂中的任何一家、在母厂监督下卷制；Habanos 不公布这张图，由行业媒体拼出来。它的母厂是 La Corona——即 Miguel Fernández Roig 厂——位于塞罗区的5月20日大道，是一座原卷烟厂，2000年改建为雪茄厂，行业媒体如是说，并称它也是 Hoyo de Monterrey 与 Cuaba 的母厂。2026年10月，habanos.com 的页面「The Habanos Brands Academia」把 Punch 列入其五个「High Value Brands」品牌（该页面称其分销面广、产品线值得关注），与 Trinidad、Bolívar、Quai d''Orsay 和 Ramón Allones 并列，产品组合共27个品牌；行业媒体曾在2019年8月1日宣布一种分级，分为二十一个组合品牌，其中有被称为高价值的四个品牌一组——Bolívar、Punch、Ramón Allones、Trinidad。官方页面写明：1931年 Punch 并入生产 Hoyo de Monterrey 的工厂，两个品牌都在 La Corona 生产。Short de Punch 于2019年7月12日在苏黎世全球首发，为它带来了首个 cepo 50（50 x 120 mm，每盒10支），habanos.com 如是说。'
 WHERE `name` = 'Punch' AND SHA1(TRIM(`history`)) = '76fbdf4dddc84bc8a112d476051caf81eb5b03e3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Punch' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '76fbdf4dddc84bc8a112d476051caf81eb5b03e3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Quai d''Orsay' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'b4ec2b38799732c4cf45b3242f9957a85821daa7';
-- brands|Quintero|history|zh — 城市名、术语不一致
UPDATE `brands` SET `history_zh` = 'Quintero 是 Habanos 少数并非诞生于哈瓦那的品牌之一。据 habanos.com 说，其创始人 Agustín Quintero 在南方的明珠西恩富戈斯定居，该网站没有给品牌标注年份。据维基百科，它于1924年以 Quintero y Hermanos 之名诞生，当时 Agustín 与四位兄弟在西恩富戈斯开了一家小工厂；一家英国零售商也给出1924年，并附有“believed”（据信）。

烟叶方面，habanos.com 写道，该品牌的全部配方来自 Vuelta Abajo 产区，力度为中等，雪茄全部手工卷制，使用短茄芯。行业媒体的一篇报道（2012年4月）给出的茄衣产区是比那尔德里奥的 Vuelta Abajo 与 Semi Vuelta，一家英国零售商也列出同样这两个产区。品牌方把这个品牌介绍为通向 Habano 风味的入门之路，力度中等，价格亲民。

据维基百科，该品牌在1960年代初国有化之后主要成了机制雪茄，Habanos S.A. 于2002年放弃机制雪茄，改为手工版本；然而一家英国零售商写道，产品线中仍有机制或手工收尾的规格，而品牌方的页面却称它们全部为完全手工卷制：说法不一。一家英国零售商称它在1940年代是重要的出口品牌，在西班牙市场尤其受欢迎，至今仍受西班牙爱好者喜爱。

Favoritos 是产品线的第五个规格，2012年推出：4 1/2 英寸（约114mm），环径50，工厂内称为 Concha No. 2，力度中等，五支一包出售。英国零售商还列出 Petit Quintero、Panetelas 和 Tubulares 规格，未见尺寸数据。

它在哪里卷制？在古巴，这个问题的答案分两层。自2002年起，Habanos 的每个品牌都有一家母厂，负责选叶和配方，其雪茄可以在岛上几十家工厂中的任何一家、在母厂监督下卷制；Habanos 不公布这张图，由行业媒体拼出来。Habanos 没有点名 Quintero 的母厂。品牌诞生于西恩富戈斯（habanos.com）；维基百科把一家规模更大的卷制工厂放在1940年代的哈瓦那；现今的工厂仍在营业。2026年10月，habanos.com 把它列入三个销量品牌——José L. Piedra、Quintero、Vegueros；行业媒体在2019年8月1日公布了这一分类，所涉雪茄的售价更为亲民。官方页面没有给品牌标日期——1924年来自惯例——但说它诞生在哈瓦那之外的西恩富戈斯，南方的明珠，全部为手工短茄芯，用 Vuelta Abajo 烟叶。'
 WHERE `name` = 'Quintero' AND SHA1(TRIM(`history`)) = 'f920bef5db7fa833536ca90fa0eb90529bca82f8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Quintero' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'f920bef5db7fa833536ca90fa0eb90529bca82f8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rafael González' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '3c1fd42e0678e9f9269c1f15d2a4b75c32add654';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ramón Allones' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '137be8938e2962b0c95b518c48d1423b465387d7';
-- brands|Rocky Patel|history|zh — 人名、品牌名须用拉丁字母
UPDATE `brands` SET `history_zh` = 'Rocky Patel 的经历，是美国雪茄里极不像真的那一类。二十几岁时，他在洛杉矶做娱乐业律师，客户的作息让雪茄吧成了他天然的职业栖息地。他学烟草的方式，和律师学大多数事情的方式一样：提问、大量阅读、去跟懂行的人说话。到九十年代初，他对高端雪茄市场的了解已超过大多数同行。

1995年，他决定入行。他没有种植的背景，没有和任何工厂的关系，也没有销售网络。他有的是法律本事、商业直觉，以及一个明确的判断：九十年代美国的这股热潮造出了一块需求，而高端厂商并没有以够得着的价格去满足它。Padrón 很好，但贵。Davidoff 无可指摘，但面向的是另一类客人。在真正的品质与日常的价格之间，有一片空地，没人以他打算投入的认真去对待。

二〇〇〇年代初推出的 Vintage 系列，把这个判断变成了产品：雪茄围绕自烟标上所标年份起陈化的烟叶来构建，定价则容得下每天一支认真的雪茄，而不只是偶尔的仪式。Vintage 1990、1992 与 1999 在一群人面前立住了这家字号的信誉——在此之前，他们把「便宜的好雪茄」看作一种妥协。

随后的产品目录——三十多条产品线，分布在几个价位上——回应的是对市场的有条理切分：每条线对应一种口味偏好与一份预算，而制作质量有一条下限，使得任何价位的 Rocky Patel 都不至于让品牌蒙羞。这份稳定，直接来自 Patel 与洪都拉斯制造商在二十年间越来越紧密的合作关系。

2024 年 1 月，这家卷制了 Black Swan 的第二版。这个系列归美国零售商 CigarPage 所有，每一批都交给不同的工厂。这一版出自洪都拉斯——Corojo 茄衣，洪都拉斯茄套，洪都拉斯与尼加拉瓜芯叶。本图集也把本条目归入洪都拉斯：Premium Cigar Association 于2024年3月写道，Rocky Patel 雪茄的大部分出自丹利的 El Paraiso（据执行副总裁 Nish Patel 称，每天可达约78 000支雪茄），而埃斯特利的 TaviCusa 为26 000至28 000支。一条条目的国别指的是产量的主体，而非全部：Emerald、Year of the Snake、Thirtieth 与 Sapphire 在 TaviCusa 卷制，据 Cigar Coop 称；另已宣布将在尼加拉瓜设立一家更大的工厂；该公司网站在2025年把三十个条目归在尼加拉瓜，十八个归在洪都拉斯。Oliva 于 2023 年开启这个系列；E.P. Carrillo 与 Joya de Nicaragua 随后跟上。'
 WHERE `name` = 'Rocky Patel' AND SHA1(TRIM(`history`)) = '414450bf045d1dd657c218e1dbc76c287df9d40b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rocky Patel' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '414450bf045d1dd657c218e1dbc76c287df9d40b';
-- brands|Romeo y Julieta|history|zh — 人名、品牌名须用拉丁字母
UPDATE `brands` SET `history_zh` = 'Habanos 写道，Romeo y Julieta 这个名字于1875年作为 Habanos 的品牌创立，其根源在莎士比亚的悲剧，但没有点出创始人。OnCuba（2013年）写道，1875年两位西班牙人 Inocencio Álvarez 和 José García 推出了这个品牌；维基百科写作 Inocencio Alvarez 和 Manin García；另有页面给出1873年（Origin of Cigar，2025年）或1870年（CubaMemorias，2022年）。Habanos 写道，这个品牌在20世纪初赢得了国际声誉；维基百科写道，它在1885年至1900年间赢得过许多荣誉，但没有点明是哪一届博览会，而 CubaMemorias 则提到在布鲁塞尔、巴黎、芝加哥和巴拿马的博览会上获得的奖章与证书。Habanos 举出 Don “Pepín” Rodríguez，称他是率先认识到茄标是成功因素的人之一；OnCuba 和维基百科写道，José Rodríguez Fernández，人称 Don Pepín，于1903年收购了这个品牌。

Habanos 写道，Winston Churchill 是这个品牌格外忠实的烟客之一：自1946年访问哈瓦那起，他的名字被用在了某些茄标上，也成了这个品牌知名度居首的规格 Churchills 的名称。据行业媒体（1995年），Churchill 于1895年11月抵达哈瓦那，对雪茄的热情正是在加勒比地区真正开始的；该媒体写道，他偏爱的品牌包括 Romeo y Julieta 和 La Aroma de Cuba。同一来源写道，Churchill 通常每天抽八到十支雪茄。据 habanos.com，Churchills 规格为 47 x 178 毫米（环径 47），galera 名称为 Julieta No 2。

这个规格名称的来历有两种说法：Habanos 把它与 Churchill 1946年访问哈瓦那联系起来；行业媒体（2018年）写道，许多人说它是1940年代末在 Romeo y Julieta 工厂创制的，在 Sir Winston 来访之后，另有人认为 Churchill 这个名字直到1950年代才出现在 Romeo y Julieta 雪茄上。

2019年6月，Habanos 推出了管装的 Churchills Añejados，外有保护外盒，罩住25支装的原装雪茄盒；该公司称自己是以 Pirámides 规格推出 Añejados 概念的。Habanos 还把 Short Churchills（2006年，长 124 毫米）和 Petit Churchills（2012年，环径 50 x 102 毫米，据该公司约二十分钟的烟程）归入这个品牌。

Habanos 把 Romeo y Julieta 描述为口味中等的经典 Habano，用的是 Vuelta Abajo 的烟草。Línea de Oro 是三个规格，于第二十二届 Festival del Habano 的晚宴上（2020年3月2日新闻稿）为纪念品牌145周年推出，Habanos 给出的强度为中等至强，而这个品牌的核心系列则是中等强度。

2012年，Habanos 推出了 Churchills Reserva Cosecha 2008，所用 Vuelta Abajo 烟叶至少陈放三年；2015年6月又以 Wide Churchills 推出 Gran Reserva Cosecha 2009：这是一个特别系列，共5000盒带编号的漆面礼盒，每盒15支，所用为2009年收成的烟叶，陈放五年。Wide Churchills 见于2010年6月3日的新闻稿，是一个 galera 名称为 Montesco 的规格，环径 55（21.83 毫米），长 130 毫米；Habanos 写道，它开创了 55 环径，并称其调配均衡而芳香。2023年9月，Habanos 在德国推出了 Cupidos（环径 55 x 148 毫米，20支装），仅在 Casas del Habano 和 Habanos Specialists 销售，新闻稿如是说；2025年2月，为纪念品牌150周年，Amantes 规格（53 x 153 毫米）在第二十五届 Festival del Habano 上亮相。

它在哪里卷制？在古巴，这个问题的答案分两层。自2002年起，Habanos 的每个品牌都有一家母厂，负责选叶和配方，其雪茄可以在岛上几十家工厂中的任何一家、在母厂监督下卷制；Habanos 不公布这张图，由行业媒体拼出来。Habanos 没有点出 Romeo y Julieta 的工厂，而媒体先后给出的说法互有分歧。2006年3月，行业媒体报道哈瓦那的 Romeo y Julieta 老厂关闭，因过于破败而无法翻修，工人将转入城市边缘的一家新厂。2011年，它描述了一家位于中哈瓦那贝拉斯科艾因街852号的 Romeo y Julieta / H. Upmann 工厂，H. Upmann 团队于2011年2月迁入；2014年，它写道，该品牌曾在这栋楼里一直待到2000年前后，此后生产被越来越多地外包出去。2024年2月，Prensa Latina 将位于马里亚瑙的 Carlos Baliño 工厂（设在一座翻修过的、建于20世纪初的旧修道院里）介绍为新的 Romeo y Julieta 工厂；Origin of Cigar 在2025年写道，该品牌自2015年起入驻此处，而这处场地大约从1950年到2013年是 José L. Piedra 工厂。行业媒体2011年还写道，位于比那尔德里奥的 Francisco Donatién 工厂也卷制一些 Romeo y Julieta。2026年10月，habanos.com 上的“The Habanos Brands Academia”页面把 Romeo y Julieta 列入一个由27个品牌组成的组合中的六个全球品牌，与 Cohiba、Montecristo、Partagás、Hoyo de Monterrey 和 H. Upmann 并列；行业媒体于2019年8月1日宣布了这一归类，并称这些品牌在所有能买到古巴雪茄的市场销售，并出现在每一家 Casa del Habano 中。'
 WHERE `name` = 'Romeo y Julieta' AND SHA1(TRIM(`history`)) = '8db9b573d4802a0e56fa8056c734005557fb8557';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Romeo y Julieta' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '8db9b573d4802a0e56fa8056c734005557fb8557';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Romeo y Julieta USA' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '85d68cd82afcf08f1ff51e6651795f42def6234a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Saint Luis Rey' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '8f40cb22663cd7894ea2a9e55bc5badc74789f27';
-- brands|San Cristóbal de La Habana|history|zh — capote/tripe 译法不当
UPDATE `brands` SET `history_zh` = '这个品牌沿用了哈瓦那的原名，品牌方页面称其可追溯到1519年：San Cristóbal de La Habana。它于1999年推出，向这座城市的历史致敬（据维基百科，在哈瓦那是11月20日），并以十六至十八世纪哈瓦那的几座要塞为首批四款规格命名：El Morro、La Fuerza、La Punta、El Príncipe。

Habanos 将该品牌归为轻至中力度，全手工卷制，长茄芯，茄套与茄芯均来自 Vuelta Abajo 产区；该页面没有描述任何口味。维基百科补充说，革命之前存在一个同名品牌，与新品牌无关。

据维基百科，El Príncipe 比其余三款都短（4 3/8 英寸，cepo 42，即 111 mm，galera 名称 Minuto），El Morro 比其余三款都长（7 1/4 英寸，cepo 49，即 184 mm，Paco）；一家零售商写道，El Morro 已于2013年停产。两者之间，La Fuerza（5 1/2 英寸，cepo 50，Gordito）和 La Punta（5 1/2 英寸，cepo 52，Campana）各长 140 mm，同样据维基百科。

Habanos 将该品牌介绍为专为 La Casa del Habano 网络设计的品牌之一，每年推出专供该网络和 Habanos Specialists 的专属产品。

它在哪里卷制？在古巴，这个问题的答案分两层。自2002年起，Habanos 的每个品牌都有一家母厂，负责选叶和配方，其雪茄可以在岛上几十家工厂中的任何一家、在母厂监督下卷制；Habanos 不公布这张图，由行业媒体拼出来。它的母厂是 La Corona，即 Miguel Fernández Roig 厂，据行业媒体（2011年），其厂房2000年以前是一家卷烟厂，之后改建为雪茄厂；habanos.com 没有为该品牌指明任何工厂。2026年10月，habanos.com 把它归入二十七个品牌组合中的十三个其他品牌之列，不在六个全球品牌、五个价值品牌和三个销量品牌之内；行业媒体2019年8月1日把它放在二十一个品牌组合中的十四个其他品牌之列。官方页面说它1999年为纪念这座城市的历史而推出，四款规格以要塞命名——El Morro、La Fuerza、La Punta、El Príncipe——2004年增加了 Mercaderes、Oficios 与 Murallas 三款，均为老哈瓦那的街道名，并且每年有专供 Casas del Habano 网络的专属产品；页面提到2019年满20周年，正值哈瓦那建城500年，并有 20 Aniversario（cepo 52，162 mm）。维基百科指出，只有2004年的三款规格带有 La Casa del Habano 茄标。行业媒体（2011年）称 La Corona 是该品牌的母厂；品牌方页面对此没有说明。'
 WHERE `name` = 'San Cristóbal de La Habana' AND SHA1(TRIM(`history`)) = 'd17e4b1820c24f5a445163272ab2bc8b8f8e9277';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'San Cristóbal de La Habana' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'd17e4b1820c24f5a445163272ab2bc8b8f8e9277';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Sancho Panza' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '6ecee5d0a08a40b9917d7a1e7c3a76a9c21d58c4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Te Amo' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '3148b8e4d9df460ef0d1a36553e70b9cf1298363';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Trinidad' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '881db611025e1ee33cb2d5fdaa6f9442b679fc5b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vegas Robaina' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'a6e537786c17cbb36f673b18fba16fefe8dbcfe3';
-- brands|Vegueros|history|zh — Vuelta Abajo ; 销量品牌 cohérence
UPDATE `brands` SET `history_zh` = 'veguero 是种烟人——耕作一块 vega（烟田）的人。Habanos 把该品牌定在1996年，并称它是向比那尔德里奥的烟草种植者致敬；其他来源给出1997年（维基百科：当年由 Habanos 出口）。其雪茄就在比那尔德里奥当地的 Francisco Donatien 厂卷制。

品牌名指的是 vegueros，即品牌方称所致敬的那些种植者。现行系列据 habanos.com 以十六支金属盒装出售；行业媒体在2014年描述过十六支的竖式盒或五支一包，2019年则描述过方形金属盒。

据行业媒体，该系列已被全面重构：2013年在 Festival del Habano 上亮相，2014年才进入店铺，配以新的包装、三个短尺寸（Mañanitas、Entretiempos、Tapados）和为中等浓度而修订的配方。据行业媒体，Centrofinos（50 x 130 mm）于2018年在 Festival del Habano 上亮相，并由 habanos.com 于2019年3月25日宣布。Habanos 称其力度为中等至浓郁；外叶、中层叶和芯叶均来自比那尔德里奥地区的 Vuelta Abajo，雪茄全部手工卷制，采用长茄芯（tripa larga）。

行业媒体2014年把它放在中低档，价格水平接近 José L. Piedra；2019年则把它列入组合中的入门级品牌。

它在哪里卷制？在古巴，这个问题的答案分两层。自2002年起，Habanos 的每个品牌都有一家母厂，负责选叶和配方，其雪茄可以在岛上几十家工厂中的任何一家、在母厂监督下卷制；Habanos 不公布这张图，由行业媒体拼出来。Francisco Donatien 厂位于比那尔德里奥，habanos.com 把生产定在这里；这是一座1868年的建筑，1961年改为雪茄厂；行业媒体称它建在一座旧监狱的原址上，并说它也卷制 Trinidad（2014年）。2026年10月，habanos.com 把 Vegueros 与 José L. Piedra、Quintero 一起列为其二十七个品牌中的三个所谓销量品牌；行业媒体于2019年8月1日宣布了这一组合，当时的品牌组合为二十一个品牌。官方页面把该品牌定在1996年；1997年是维基百科给出的出口年份。现行系列据 habanos.com 包括 Tapados（46 x 120 mm）、Entretiempos（52 x 110 mm）、Mañanitas（46 x 100 mm）和 Centrofinos（50 x 130 mm），十六支金属盒装。'
 WHERE `name` = 'Vegueros' AND SHA1(TRIM(`history`)) = 'e9adeb7f89928a7263c6d5ac33dc34169ce725d6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vegueros' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'e9adeb7f89928a7263c6d5ac33dc34169ce725d6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Villiger' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '73694cff55089a8118d1b5f1a0e2acac9e3bac0d';
-- brands|Warped|history|zh — noms latins ; typo 茄茄芯
UPDATE `brands` SET `history_zh` = 'Warped 诞生于一个愿望：让1960年之前那些被遗忘的古巴品牌名字复活，并以当代配方填充它们。创始人 Kyle Gellis 是在求学期间每周穿越迈阿密、去观看小哈瓦那卷制师工作时认识这一行的；他起步时的雪茄正是在 El Titan de Bronze 做出来的。

他没有自己的工厂。他的产品线出自两间截然不同的作坊——埃斯特利的 TABSA，与迈阿密的 El Titan de Bronze——并使用 Aganorsa 的烟叶。这种双重落点，让这个品牌拥有了与其规模不相称的丰富层次。

风格偏爱细身尺寸与「entubado」卷芯法：这是一种古老工艺，每一片茄芯叶在组合之前先各自卷成管状；它更慢、更贵，却能打开通风、延长烟气。这是一个与这家所追求之物相符的技术选择——口中的绵长，而非即刻的力度。

系列批量小，常常毫无预告地发布，几周内售罄。这是一个属于内行烟客的品牌——你通过一次交谈发现它，而不是通过一扇橱窗。

Edition One是Edition One, Inc.的名称，该公司归Warped创始人Kyle Gellis及其弟弟Devin所有。据Cigar Wars所述，其唯一的雪茄Cloud Hopper于2016年低调推出，2017年夏季为公众所知。2026年10月，warpedcigars.com将其列为Warped旗下品牌之一，由TABSA制造，Kyle Gellis担任调配师，但未出现Edition One这一名称；Neptune Cigar销售这款在尼加拉瓜手工制作的雪茄，名称为Edition One Cloud Hopper，Cigars Direct则以Warped Cloud Hopper之名销售。'
 WHERE `name` = 'Warped' AND SHA1(TRIM(`history`)) = '89f5fb83f12fae2c523fdfa053600ebb659ccf2b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Warped' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = '89f5fb83f12fae2c523fdfa053600ebb659ccf2b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Zino Platinum' AND `champ` = 'history' AND `lang` = 'zh' AND `source_hash` = 'b7ad765ab0e9dae9d02dc1e14d94a68c597b509b';

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 277';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 277', 'systeme', 'traductions_relues', 'systeme', 0, 'Relecture « zh » par expert-traduction (agent) : 67 traduction(s) relue(s) — 38 corrigee(s), 29 validee(s) telles quelles ; brands 67');

SELECT
  (SELECT COUNT(*) FROM `translation_status` WHERE `lang` = 'zh' AND `statut` = 'relu' AND `relecteur` = 'expert-traduction (agent)') >= 67 AS relues,
  (SELECT COUNT(*) FROM `translation_status` WHERE `statut` = 'relu' AND (`relecteur` IS NULL OR `relecteur` = '')) = 0 AS chaque_relecture_a_son_relecteur;
SELECT `lang`, SUM(`statut` = 'relu') AS relues, COUNT(*) AS total FROM `translation_status` GROUP BY `lang`;
