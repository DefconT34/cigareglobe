-- ════════════════════════════════════════════════════════
-- 208 — Lot 2a du second recensement : quatre fabriques nicaraguayennes
-- ────────────────────────────────────────────────────────
-- Les fabriques-maisons d'Esteli et de Condega : Luciano (ex-ACE Prime),
-- Agrotabacos, Karen Berger Cigars, Rojas Cigars. Chacune a son usine,
-- et chacune roule pour des maisons que l'atlas porte ou portera —
-- Crowned Heads et Ozgener chez Luciano, Ventura et Lampert chez
-- Agrotabacos, Cuban Crafters chez Berger, Ezra Zion, Nomad et Stolen
-- Throne chez Rojas. Les fabriques avant les marques qu'elles roulent.
--
-- TABACALERA ARAGON EST REPORTEE. Son propre site ne donne pas d'annee
-- de fondation, et la seule relation documentee par la presse — Jas Sum
-- Kral, 2018-2024 — est terminee. Une fiche qui ne tiendrait que sur le
-- site de la maison repeterait la faute du Torano Panama. Elle reste
-- dans docs/maisons-absentes-2.md, avec la raison.
--
-- CE QUE LA RECHERCHE A RENDU EN PASSANT : la Tabacalera Esteli de
-- Karen Berger est LA FABRIQUE DE CUBAN CRAFTERS — Kiki Berger etait
-- co-proprietaire des deux. La fiche Cuban Crafters nommait l'usine
-- sans dire a qui elle etait ; un paragraphe en six langues le dit.
--
-- `producer_countries.brands` est lu dans la base a la generation et
-- reecrit en litteral complet — aucune fonction JSON_*.
--
-- Domaines cites, verifies au DNS avant ecriture : cigaraficionado.com,
-- halfwheel.com, cigar-coop.com, tobaccobusiness.com, cigarinspector.com,
-- stogiepress.com, karenbergercigars.com.
-- ════════════════════════════════════════════════════════

-- ── Luciano Cigars ──

INSERT INTO `brands` (`name`, `country_id`, `founded`, `factory`, `source`, `history`, `gamme`, `history_en`, `gamme_en`, `history_es`, `gamme_es`, `history_de`, `gamme_de`, `history_zh`, `gamme_zh`, `history_ar`, `gamme_ar`)
VALUES ('Luciano Cigars',
        'nicaragua',
        'Usine 2005 · ACE Prime 2018 · Luciano 2022',
        'Luciano Cigar Factory (ex-Tabacalera Pichardo), Estelí — 64 rouleurs et bouncheurs, 123 employés en 2020',
        'cigaraficionado.com « A Q&A with Luciano Meirelles, ACE Prime Cigars » (10 août 2020 : Meirelles brésilien, finance puis conseil politique ; présenté à Eradio Pichardo par Ernesto Perez-Carrillo en 2008 ; Pichardo parti de Cuba en 2005, ancien de Habanos S.A. ; Dhatuey Tabacos février 2005, Tabacalera Pichardo janvier 2009 ; 64 rouleurs, 123 employés, 3,1 millions de cigares en 2019 ; ACE Prime janvier 2018 avec Tiago Splitter ; roule Crowned Heads) ; halfwheel.com et cigar-coop.com (rebaptisée Luciano Cigars en septembre 2022, la fabrique devient Luciano Cigar Factory) ; roule aussi pour Ozgener Family Cigars',
        'Luciano est le prénom d''un Brésilien, et la fabrique qui porte son nom est d''abord celle d''un Cubain. Eradio Pichardo a quitté Cuba en 2005, après avoir travaillé pour Habanos S.A., et a ouvert en février de la même année un petit atelier à Estelí, Dhatuey Tabacos. Luciano Meirelles, lui, vient de São Paulo et de la finance — assurances, un fonds d''investissement à vingt-deux ans, puis un cabinet de conseil politique en Amérique latine. C''est Ernesto Perez-Carrillo, dont l''atlas porte la fiche, qui les présente l''un à l''autre en 2008. En janvier 2009, Meirelles devient l''associé de Pichardo, et l''atelier prend le nom de Tabacalera Pichardo.

La fabrique a grandi sans changer de nature. En 2020, elle comptait soixante-quatre rouleurs et bouncheurs, cent vingt-trois employés en comptant les champs, et elle sortait un peu plus de trois millions de cigares par an. Elle roule pour d''autres, et pas des moindres : Crowned Heads y fait faire son Juarez, et Ozgener Family Cigars — la maison du fils du fondateur de CAO — y fait ses cigares.

Les marques propres sont venues tard. ACE Prime naît en janvier 2018, avec un troisième associé qui n''est pas du métier : Tiago Splitter, joueur de basket brésilien passé par la NBA, devenu entraîneur. Les premières lignes sortent en juillet 2019 — Pichardo Reserva Familiar et Classico au nom de la famille, Luciano The Traveler et The Dreamer au prénom de l''associé, MXS pour les signatures d''athlètes.

En septembre 2022, ACE Prime devient Luciano Cigars, et la fabrique elle-même est rebaptisée Luciano Cigar Factory. Le nom du financier a remplacé celui du cigarier sur la porte. Cette fiche garde les deux, parce que c''est l''histoire.',
        '[{"name":"Pichardo Reserva Familiar","color":"#5B3A29","force":"Medium-Full","wrapper":"Non divulguée","vitolas":[],"story":"Au nom de la famille du fondateur de la fabrique. Sortie en juillet 2019."},{"name":"Luciano The Dreamer","color":"#7A4A2C","force":"Medium","wrapper":"Non divulguée","vitolas":[],"story":"Au prénom de l''associé. Avec The Traveler, la ligne qui a donné son nom à la maison en 2022."},{"name":"MXS","color":"#4A3728","force":"Medium-Full","wrapper":"Non divulguée","vitolas":[],"story":"Des signatures d''athlètes — la part de Tiago Splitter dans l''affaire."}]',
        'Luciano is a Brazilian''s first name, and the factory that carries it was first a Cuban''s. Eradio Pichardo left Cuba in 2005, after working for Habanos S.A., and opened in February of that year a small workshop in Estelí, Dhatuey Tabacos. Luciano Meirelles comes from São Paulo and from finance — insurance, an investment fund at twenty-two, then a political consultancy in Latin America. It was Ernesto Perez-Carrillo, whose entry this atlas carries, who introduced them in 2008. In January 2009, Meirelles became Pichardo''s partner, and the workshop took the name Tabacalera Pichardo.

The factory has grown without changing its nature. In 2020 it counted sixty-four rollers and bunchers, a hundred and twenty-three employees including the fields, and turned out a little over three million cigars a year. It rolls for others, and not minor ones: Crowned Heads has its Juarez made there, and Ozgener Family Cigars — the house of the son of CAO''s founder — makes its cigars there.

Its own brands came late. ACE Prime was born in January 2018, with a third partner from outside the trade: Tiago Splitter, a Brazilian basketball player who went through the NBA and became a coach. The first lines came out in July 2019 — Pichardo Reserva Familiar and Classico in the family''s name, Luciano The Traveler and The Dreamer in the partner''s first name, MXS for athletes'' signatures.

In September 2022, ACE Prime became Luciano Cigars, and the factory itself was renamed Luciano Cigar Factory. The financier''s name replaced the cigar maker''s on the door. This entry keeps both, because that is the story.',
        '[{"name":"Pichardo Reserva Familiar","color":"#5B3A29","force":"Medium-Full","wrapper":"Undisclosed","vitolas":[],"story":"In the name of the factory founder''s family. Released July 2019."},{"name":"Luciano The Dreamer","color":"#7A4A2C","force":"Medium","wrapper":"Undisclosed","vitolas":[],"story":"In the partner''s first name. With The Traveler, the line that gave the house its name in 2022."},{"name":"MXS","color":"#4A3728","force":"Medium-Full","wrapper":"Undisclosed","vitolas":[],"story":"Athletes'' signatures — Tiago Splitter''s part in the venture."}]',
        'Luciano es el nombre de pila de un brasileño, y la fábrica que lo lleva fue primero la de un cubano. Eradio Pichardo dejó Cuba en 2005, tras trabajar para Habanos S.A., y abrió en febrero de ese mismo año un pequeño taller en Estelí, Dhatuey Tabacos. Luciano Meirelles, por su parte, viene de São Paulo y de las finanzas — seguros, un fondo de inversión a los veintidós años, luego una consultora política en América Latina. Fue Ernesto Perez-Carrillo, cuya ficha lleva este atlas, quien los presentó en 2008. En enero de 2009, Meirelles se convirtió en socio de Pichardo, y el taller tomó el nombre de Tabacalera Pichardo.

La fábrica creció sin cambiar de naturaleza. En 2020 contaba sesenta y cuatro torcedores y boncheros, ciento veintitrés empleados contando el campo, y sacaba poco más de tres millones de puros al año. Lía para otros, y no menores: Crowned Heads hace allí su Juarez, y Ozgener Family Cigars — la casa del hijo del fundador de CAO — hace allí sus puros.

Las marcas propias llegaron tarde. ACE Prime nace en enero de 2018, con un tercer socio ajeno al oficio: Tiago Splitter, jugador de baloncesto brasileño que pasó por la NBA y se hizo entrenador. Las primeras líneas salen en julio de 2019 — Pichardo Reserva Familiar y Classico con el nombre de la familia, Luciano The Traveler y The Dreamer con el nombre de pila del socio, MXS para las firmas de atletas.

En septiembre de 2022, ACE Prime pasa a ser Luciano Cigars, y la propia fábrica es rebautizada Luciano Cigar Factory. El nombre del financiero reemplazó al del tabaquero en la puerta. Esta ficha conserva los dos, porque esa es la historia.',
        '[{"name":"Pichardo Reserva Familiar","color":"#5B3A29","force":"Medium-Full","wrapper":"No divulgada","vitolas":[],"story":"Con el nombre de la familia del fundador de la fábrica. Salida en julio de 2019."},{"name":"Luciano The Dreamer","color":"#7A4A2C","force":"Medium","wrapper":"No divulgada","vitolas":[],"story":"Con el nombre de pila del socio. Con The Traveler, la línea que dio su nombre a la casa en 2022."},{"name":"MXS","color":"#4A3728","force":"Medium-Full","wrapper":"No divulgada","vitolas":[],"story":"Firmas de atletas — la parte de Tiago Splitter en el negocio."}]',
        'Luciano ist der Vorname eines Brasilianers, und die Fabrik, die ihn trägt, war zuerst die eines Kubaners. Eradio Pichardo verließ Kuba 2005, nachdem er für Habanos S.A. gearbeitet hatte, und eröffnete im Februar desselben Jahres eine kleine Werkstatt in Estelí, Dhatuey Tabacos. Luciano Meirelles kommt aus São Paulo und aus der Finanzwelt — Versicherungen, ein Investmentfonds mit zweiundzwanzig, dann eine Politikberatung in Lateinamerika. Ernesto Perez-Carrillo, dessen Eintrag dieser Atlas führt, stellte die beiden 2008 einander vor. Im Januar 2009 wurde Meirelles Pichardos Partner, und die Werkstatt nahm den Namen Tabacalera Pichardo an.

Die Fabrik ist gewachsen, ohne ihr Wesen zu ändern. 2020 zählte sie vierundsechzig Roller und Buncher, hundertdreiundzwanzig Beschäftigte mit den Feldern, und brachte etwas über drei Millionen Zigarren im Jahr hervor. Sie rollt für andere, und nicht die kleinsten: Crowned Heads lässt dort seine Juarez fertigen, und Ozgener Family Cigars — das Haus des Sohnes des CAO-Gründers — macht dort seine Zigarren.

Die eigenen Marken kamen spät. ACE Prime entstand im Januar 2018, mit einem dritten Partner von außerhalb des Metiers: Tiago Splitter, brasilianischer Basketballspieler, der durch die NBA ging und Trainer wurde. Die ersten Linien erschienen im Juli 2019 — Pichardo Reserva Familiar und Classico im Namen der Familie, Luciano The Traveler und The Dreamer im Vornamen des Partners, MXS für die Signaturen von Athleten.

Im September 2022 wurde ACE Prime zu Luciano Cigars, und die Fabrik selbst wurde in Luciano Cigar Factory umbenannt. Der Name des Finanziers ersetzte den des Zigarrenmachers an der Tür. Dieser Eintrag behält beide, denn das ist die Geschichte.',
        '[{"name":"Pichardo Reserva Familiar","color":"#5B3A29","force":"Medium-Full","wrapper":"Nicht angegeben","vitolas":[],"story":"Im Namen der Familie des Fabrikgründers. Erschienen im Juli 2019."},{"name":"Luciano The Dreamer","color":"#7A4A2C","force":"Medium","wrapper":"Nicht angegeben","vitolas":[],"story":"Im Vornamen des Partners. Mit The Traveler die Linie, die dem Haus 2022 seinen Namen gab."},{"name":"MXS","color":"#4A3728","force":"Medium-Full","wrapper":"Nicht angegeben","vitolas":[],"story":"Signaturen von Athleten — Tiago Splitters Anteil am Unternehmen."}]',
        'Luciano 是一个巴西人的名字，而冠以此名的工厂最初属于一个古巴人。埃拉迪奥·皮查尔多2005年离开古巴，此前曾任职于 Habanos S.A.；同年2月他在埃斯特利开了一间小作坊 Dhatuey Tabacos。卢西亚诺·梅雷莱斯则来自圣保罗与金融界——保险、二十二岁时的一支投资基金、之后是拉美的政治咨询公司。2008年，本图集载有词条的埃内斯托·佩雷斯-卡里略把两人引见给彼此。2009年1月，梅雷莱斯成为皮查尔多的合伙人，作坊更名 Tabacalera Pichardo。

工厂扩大了，本质未变。2020年有六十四名卷烟师与捆芯工，连同田间共一百二十三名员工，年产略超三百万支。它也为他人卷制，且非小客户：Crowned Heads 的 Juarez 在此制作，Ozgener Family Cigars——CAO 创始人之子的公司——也在此制作雪茄。

自有品牌来得晚。ACE Prime 于2018年1月诞生，第三位合伙人来自行外：蒂亚戈·斯普利特，打过 NBA、后转任教练的巴西篮球运动员。首批系列于2019年7月面世——以家族之名的 Pichardo Reserva Familiar 与 Classico，以合伙人之名的 Luciano The Traveler 与 The Dreamer，以及运动员签名的 MXS。

2022年9月，ACE Prime 更名 Luciano Cigars，工厂本身也改称 Luciano Cigar Factory。门上金融家的名字取代了雪茄匠的名字。本词条两个都留着，因为这就是这段历史。',
        '[{"name":"Pichardo Reserva Familiar","color":"#5B3A29","force":"Medium-Full","wrapper":"未公开","vitolas":[],"story":"以工厂创办人家族之名。2019年7月推出。"},{"name":"Luciano The Dreamer","color":"#7A4A2C","force":"Medium","wrapper":"未公开","vitolas":[],"story":"以合伙人之名。与 The Traveler 一道，是2022年赋予公司名字的那条线。"},{"name":"MXS","color":"#4A3728","force":"Medium-Full","wrapper":"未公开","vitolas":[],"story":"运动员签名款——蒂亚戈·斯普利特在这桩生意里的角色。"}]',
        'لوتشيانو اسمُ برازيلي، والمصنع الذي يحمله كان أوّلًا مصنعَ كوبي. غادر إراديو بيتشاردو كوبا سنة 2005 بعد أن عمل لدى Habanos S.A.، وفتح في شباط/فبراير من السنة نفسها ورشة صغيرة في إستيلي، Dhatuey Tabacos. أمّا لوتشيانو ميريليس فيأتي من ساو باولو ومن عالم المال — التأمين، وصندوق استثماري في الثانية والعشرين، ثم شركة استشارات سياسية في أمريكا اللاتينية. وإرنستو بيريس-كاريّو، الذي يحمل هذا الأطلس بطاقته، هو من عرّف أحدهما بالآخر سنة 2008. وفي كانون الثاني/يناير 2009 صار ميريليس شريكَ بيتشاردو، وأخذت الورشة اسم Tabacalera Pichardo.

كبُر المصنع دون أن تتغيّر طبيعته. في 2020 كان يضمّ أربعة وستين لافًّا وحازمًا، ومئة وثلاثة وعشرين موظّفًا مع الحقول، ويُخرج ما يزيد قليلًا على ثلاثة ملايين سيجار في السنة. ويلفّ لغيره، وليسوا بالصغار: فـCrowned Heads تصنع فيه سيجار Juarez، وOzgener Family Cigars — دار ابن مؤسّس CAO — تصنع فيه سيجاراتها.

جاءت العلامات الخاصة متأخّرة. وُلدت ACE Prime في كانون الثاني/يناير 2018 مع شريك ثالث من خارج المهنة: تياغو سبليتر، لاعب كرة السلة البرازيلي الذي مرّ بدوري NBA وصار مدرّبًا. وصدرت الخطوط الأولى في تموز/يوليو 2019 — Pichardo Reserva Familiar وClassico باسم العائلة، وLuciano The Traveler وThe Dreamer باسم الشريك، وMXS لتوقيعات الرياضيين.

وفي أيلول/سبتمبر 2022 صارت ACE Prime هي Luciano Cigars، وأُعيدت تسمية المصنع نفسه Luciano Cigar Factory. حلّ اسم رجل المال محلّ اسم صانع السيجار على الباب. وتحتفظ هذه البطاقة بالاسمين، لأنّ هذه هي القصّة.',
        '[{"name":"Pichardo Reserva Familiar","color":"#5B3A29","force":"Medium-Full","wrapper":"غير معلن","vitolas":[],"story":"باسم عائلة مؤسّس المصنع. صدر في تموز/يوليو 2019."},{"name":"Luciano The Dreamer","color":"#7A4A2C","force":"Medium","wrapper":"غير معلن","vitolas":[],"story":"باسم الشريك. مع The Traveler، الخطّ الذي أعطى الدار اسمها سنة 2022."},{"name":"MXS","color":"#4A3728","force":"Medium-Full","wrapper":"غير معلن","vitolas":[],"story":"توقيعات رياضيين — نصيب تياغو سبليتر في المشروع."}]')
ON DUPLICATE KEY UPDATE `country_id` = VALUES(`country_id`), `founded` = VALUES(`founded`), `factory` = VALUES(`factory`), `source` = VALUES(`source`), `history` = VALUES(`history`), `gamme` = VALUES(`gamme`), `history_en` = VALUES(`history_en`), `gamme_en` = VALUES(`gamme_en`), `history_es` = VALUES(`history_es`), `gamme_es` = VALUES(`gamme_es`), `history_de` = VALUES(`history_de`), `gamme_de` = VALUES(`gamme_de`), `history_zh` = VALUES(`history_zh`), `gamme_zh` = VALUES(`gamme_zh`), `history_ar` = VALUES(`history_ar`), `gamme_ar` = VALUES(`gamme_ar`);

-- ── Agrotabacos ──

INSERT INTO `brands` (`name`, `country_id`, `founded`, `factory`, `source`, `history`, `gamme`, `history_en`, `gamme_en`, `history_es`, `gamme_es`, `history_de`, `gamme_de`, `history_zh`, `gamme_zh`, `history_ar`, `gamme_ar`)
VALUES ('Agrotabacos',
        'nicaragua',
        '1995 — Condega',
        'Agroindustrial Nicaragüense de Tabacos S.A., Condega — fabrique familiale des Ortez',
        'cigaraficionado.com « Q&A: Indiana Ortez, Agrotabacos » (5 février 2019 : « In 1995, Agroindustrial Nicaraguense de Tabacos S.A. (Agrotabacos) was born as a family business » ; fondée par Omar Ortez ; Jalapa, Condega et Estelí ; 40 % de la production sous Omar Ortez Originals et Maduro, 60 % pour des tiers — Altadis USA, Zander-Greg, Flor de González, Kretek International ; Fathers, Friends and Fire avec Ventura ; Indiana Ortez, 25 ans, contrôle qualité et marketing, formée par le superviseur Fausto) ; halfwheel.com (Casa de Ortez présente La Malinche à la PCA 2023 ; Psyko Seven Nicaragua pour Ventura) ; cigar-coop.com (janvier 2025 : Indiana Ortez ambassadrice de fabrique pour Best Cigar Prices)',
        'Agrotabacos est le nom court d''une raison sociale qui dit tout : Agroindustrial Nicaragüense de Tabacos. Omar Ortez l''a fondée en 1995, à Condega, comme une affaire de famille, et elle l''est restée. La fabrique est à Condega — la ville du milieu, entre Estelí et Jalapa — et elle revendique de mélanger les trois : la douceur de Jalapa, les arômes de Condega, la force d''Estelí.

Ce qu''elle fait est partagé en deux, et elle le dit avec des chiffres. Quarante pour cent de sa production sort sous ses propres marques, Omar Ortez Originals et Omar Ortez Maduro. Soixante pour cent est roulé pour d''autres — et la liste dit à qui l''on a affaire : Altadis USA, Zander-Greg, Flor de González, Kretek International. Une fabrique qui roule pour un groupe comme Altadis n''est pas un atelier.

Indiana Ortez est la fille d''Omar, et le visage de la maison. Elle est entrée dans la fabrique à vingt-deux ans, formée pendant six mois par un superviseur nommé Fausto, et tient depuis le contrôle qualité et le marketing. C''est sous son nom que sont sorties les collaborations récentes : Fathers, Friends and Fire avec Ventura Cigar Co., puis le Psyko Seven Nicaragua ; et Casa de Ortez, la marque qu''elle a présentée avec La Malinche au salon de 2023.

L''atlas la rencontrait déjà sans le savoir : c''est ici que sont faits la Edición Verde de Lampert et les cigares de Small Batch. Une fabrique de plus que les fiches nommaient sans lui donner la sienne.',
        '[{"name":"Omar Ortez Originals","color":"#6B4226","force":"Medium-Full","wrapper":"Non divulguée","vitolas":[],"story":"La marque du fondateur — avec la Maduro, quarante pour cent de ce que la fabrique roule."},{"name":"Casa de Ortez","color":"#8B5A2B","force":"Medium","wrapper":"Non divulguée","vitolas":[],"story":"La marque d''Indiana Ortez, présentée avec La Malinche au salon de 2023."}]',
        'Agrotabacos is the short name of a corporate name that says it all: Agroindustrial Nicaragüense de Tabacos. Omar Ortez founded it in 1995, in Condega, as a family business, and it has stayed one. The factory is in Condega — the town in the middle, between Estelí and Jalapa — and it claims to blend the three: the sweetness of Jalapa, the aromas of Condega, the strength of Estelí.

What it does is split in two, and it says so with figures. Forty per cent of its output goes out under its own brands, Omar Ortez Originals and Omar Ortez Maduro. Sixty per cent is rolled for others — and the list says whom one is dealing with: Altadis USA, Zander-Greg, Flor de González, Kretek International. A factory that rolls for a group like Altadis is not a workshop.

Indiana Ortez is Omar''s daughter, and the face of the house. She entered the factory at twenty-two, trained for six months by a supervisor named Fausto, and has held quality control and marketing since. The recent collaborations came out under her name: Fathers, Friends and Fire with Ventura Cigar Co., then the Psyko Seven Nicaragua; and Casa de Ortez, the brand she presented with La Malinche at the 2023 trade show.

This atlas was already meeting it without knowing: this is where Lampert''s Edición Verde and Small Batch''s cigars are made. One more factory the entries named without giving it its own.',
        '[{"name":"Omar Ortez Originals","color":"#6B4226","force":"Medium-Full","wrapper":"Undisclosed","vitolas":[],"story":"The founder''s brand — with the Maduro, forty per cent of what the factory rolls."},{"name":"Casa de Ortez","color":"#8B5A2B","force":"Medium","wrapper":"Undisclosed","vitolas":[],"story":"Indiana Ortez''s brand, presented with La Malinche at the 2023 trade show."}]',
        'Agrotabacos es el nombre corto de una razón social que lo dice todo: Agroindustrial Nicaragüense de Tabacos. Omar Ortez la fundó en 1995, en Condega, como negocio familiar, y así sigue. La fábrica está en Condega — la ciudad del medio, entre Estelí y Jalapa — y reivindica mezclar las tres: la dulzura de Jalapa, los aromas de Condega, la fuerza de Estelí.

Lo que hace está repartido en dos, y lo dice con cifras. El cuarenta por ciento de su producción sale bajo sus propias marcas, Omar Ortez Originals y Omar Ortez Maduro. El sesenta por ciento se lía para otros — y la lista dice con quién se trata: Altadis USA, Zander-Greg, Flor de González, Kretek International. Una fábrica que lía para un grupo como Altadis no es un taller.

Indiana Ortez es la hija de Omar, y el rostro de la casa. Entró en la fábrica a los veintidós años, formada durante seis meses por un supervisor llamado Fausto, y desde entonces lleva el control de calidad y el marketing. Bajo su nombre salieron las colaboraciones recientes: Fathers, Friends and Fire con Ventura Cigar Co., luego el Psyko Seven Nicaragua; y Casa de Ortez, la marca que presentó con La Malinche en el salón de 2023.

Este atlas ya la encontraba sin saberlo: aquí se hacen la Edición Verde de Lampert y los puros de Small Batch. Una fábrica más que las fichas nombraban sin darle la suya.',
        '[{"name":"Omar Ortez Originals","color":"#6B4226","force":"Medium-Full","wrapper":"No divulgada","vitolas":[],"story":"La marca del fundador — con la Maduro, el cuarenta por ciento de lo que lía la fábrica."},{"name":"Casa de Ortez","color":"#8B5A2B","force":"Medium","wrapper":"No divulgada","vitolas":[],"story":"La marca de Indiana Ortez, presentada con La Malinche en el salón de 2023."}]',
        'Agrotabacos ist die Kurzform eines Firmennamens, der alles sagt: Agroindustrial Nicaragüense de Tabacos. Omar Ortez gründete sie 1995 in Condega als Familienbetrieb, und das ist sie geblieben. Die Fabrik steht in Condega — der Stadt in der Mitte, zwischen Estelí und Jalapa — und beansprucht, die drei zu verbinden: die Süße von Jalapa, die Aromen von Condega, die Kraft von Estelí.

Was sie tut, ist zweigeteilt, und sie sagt es in Zahlen. Vierzig Prozent ihrer Produktion gehen unter eigenen Marken hinaus, Omar Ortez Originals und Omar Ortez Maduro. Sechzig Prozent werden für andere gerollt — und die Liste sagt, mit wem man es zu tun hat: Altadis USA, Zander-Greg, Flor de González, Kretek International. Eine Fabrik, die für einen Konzern wie Altadis rollt, ist keine Werkstatt.

Indiana Ortez ist Omars Tochter und das Gesicht des Hauses. Sie trat mit zweiundzwanzig in die Fabrik ein, sechs Monate lang ausgebildet von einem Vorarbeiter namens Fausto, und verantwortet seither Qualitätskontrolle und Marketing. Unter ihrem Namen erschienen die neueren Kooperationen: Fathers, Friends and Fire mit Ventura Cigar Co., dann die Psyko Seven Nicaragua; und Casa de Ortez, die Marke, die sie mit La Malinche auf der Messe 2023 vorstellte.

Dieser Atlas begegnete ihr schon, ohne es zu wissen: Hier entstehen Lamperts Edición Verde und die Zigarren von Small Batch. Eine weitere Fabrik, die die Einträge nannten, ohne ihr einen eigenen zu geben.',
        '[{"name":"Omar Ortez Originals","color":"#6B4226","force":"Medium-Full","wrapper":"Nicht angegeben","vitolas":[],"story":"Die Marke des Gründers — mit der Maduro vierzig Prozent dessen, was die Fabrik rollt."},{"name":"Casa de Ortez","color":"#8B5A2B","force":"Medium","wrapper":"Nicht angegeben","vitolas":[],"story":"Die Marke von Indiana Ortez, mit La Malinche auf der Messe 2023 vorgestellt."}]',
        'Agrotabacos 是一个道尽一切的公司全称的简写：Agroindustrial Nicaragüense de Tabacos（尼加拉瓜烟草农工业公司）。奥马尔·奥尔特斯于1995年在孔德加创办，是家族企业，至今如此。工厂位于孔德加——埃斯特利与哈拉帕之间的中间城镇——并以调和三地自任：哈拉帕的甜、孔德加的香、埃斯特利的劲。

它的业务一分为二，并用数字说明。产量的四成以自有品牌 Omar Ortez Originals 与 Omar Ortez Maduro 出品；六成为他人卷制——客户名单说明了分量：Altadis USA、Zander-Greg、Flor de González、Kretek International。为 Altadis 这样的集团代工的工厂，不是一间作坊。

印第安娜·奥尔特斯是奥马尔的女儿，也是公司的门面。她二十二岁进厂，由一位名叫福斯托的主管带教六个月，此后主管品控与营销。近年的合作以她之名推出：与 Ventura Cigar Co. 的 Fathers, Friends and Fire，继而 Psyko Seven Nicaragua；以及 Casa de Ortez——她在2023年展会上以 La Malinche 亮相的品牌。

本图集其实早已在不知情中遇见它：Lampert 的 Edición Verde 与 Small Batch 的雪茄正出自此处。又一家被各词条提及却未有自己词条的工厂。',
        '[{"name":"Omar Ortez Originals","color":"#6B4226","force":"Medium-Full","wrapper":"未公开","vitolas":[],"story":"创办人的牌子——连同 Maduro，占工厂产量的四成。"},{"name":"Casa de Ortez","color":"#8B5A2B","force":"Medium","wrapper":"未公开","vitolas":[],"story":"印第安娜·奥尔特斯的牌子，2023年展会上以 La Malinche 亮相。"}]',
        'أغروتاباكوس هو الاسم المختصر لاسم تجاري يقول كلّ شيء: Agroindustrial Nicaragüense de Tabacos. أسّسها عمر أورتيس سنة 1995 في كونديغا مشروعًا عائليًّا، وبقيت كذلك. المصنع في كونديغا — المدينة الوسطى بين إستيلي وخالابا — ويدّعي مزج الثلاث: حلاوة خالابا، وروائح كونديغا، وقوّة إستيلي.

ما تفعله مقسوم إلى قسمين، وهي تقوله بالأرقام. أربعون بالمئة من إنتاجها يخرج تحت علاماتها الخاصة، Omar Ortez Originals وOmar Ortez Maduro. وستّون بالمئة يُلفّ لغيرها — والقائمة تقول مع من نتعامل: Altadis USA وZander-Greg وFlor de González وKretek International. ومصنعٌ يلفّ لمجموعة مثل ألتاديس ليس ورشة.

إنديانا أورتيس ابنة عمر، ووجه الدار. دخلت المصنع في الثانية والعشرين، ودرّبها مشرفٌ اسمه فاوستو ستّة شهور، وتتولّى منذ ذلك الحين مراقبة الجودة والتسويق. وباسمها صدرت التعاونات الأخيرة: Fathers, Friends and Fire مع Ventura Cigar Co.، ثم Psyko Seven Nicaragua؛ وCasa de Ortez، العلامة التي قدّمتها مع La Malinche في معرض 2023.

وكان هذا الأطلس يلتقيها من قبل دون أن يعلم: فهنا تُصنع Edición Verde لِلامبرت وسيجارات Small Batch. مصنعٌ آخر ذكرته البطاقات دون أن تمنحه بطاقته.',
        '[{"name":"Omar Ortez Originals","color":"#6B4226","force":"Medium-Full","wrapper":"غير معلن","vitolas":[],"story":"علامة المؤسّس — مع المادورو، أربعون بالمئة ممّا يلفّه المصنع."},{"name":"Casa de Ortez","color":"#8B5A2B","force":"Medium","wrapper":"غير معلن","vitolas":[],"story":"علامة إنديانا أورتيس، قُدّمت مع La Malinche في معرض 2023."}]')
ON DUPLICATE KEY UPDATE `country_id` = VALUES(`country_id`), `founded` = VALUES(`founded`), `factory` = VALUES(`factory`), `source` = VALUES(`source`), `history` = VALUES(`history`), `gamme` = VALUES(`gamme`), `history_en` = VALUES(`history_en`), `gamme_en` = VALUES(`gamme_en`), `history_es` = VALUES(`history_es`), `gamme_es` = VALUES(`gamme_es`), `history_de` = VALUES(`history_de`), `gamme_de` = VALUES(`gamme_de`), `history_zh` = VALUES(`history_zh`), `gamme_zh` = VALUES(`gamme_zh`), `history_ar` = VALUES(`history_ar`), `gamme_ar` = VALUES(`gamme_ar`);

-- ── Karen Berger Cigars ──

INSERT INTO `brands` (`name`, `country_id`, `founded`, `factory`, `source`, `history`, `gamme`, `history_en`, `gamme_en`, `history_es`, `gamme_es`, `history_de`, `gamme_de`, `history_zh`, `gamme_zh`, `history_ar`, `gamme_ar`)
VALUES ('Karen Berger Cigars',
        'nicaragua',
        'Années 1990 — Estelí ; Don Kiki Berger, 1996',
        'Tabacalera Estelí (Estelí Cigar Factory S.A.), Estelí — la fabrique de Cuban Crafters ; ferme Vegas de 200 acres attenante',
        'tobaccobusiness.com « Karen Berger: Dream Chaser » (Tobacco Businesswoman of the Year 2021 ; Don Kiki Berger fonde l''affaire dans les années 1990, meurt en 2014 ; fabrique Tabacalera Estelí ; ferme ; K by Karen Berger en 2016 ; Don Kiki Cigars Superstore à Daytona Beach) ; cigaraficionado.com « Kiki Berger of Cuban Crafters, 56, Dies » et cigar-coop.com (septembre 2014 ; co-propriétaire de la boutique et de la marque Cuban Crafters à Miami) ; cigarinspector.com « Cigar Industry Legends – Don Kiki Berger » (Max Berger, parti de Pologne en 1940 pour Cuba, fabrique à Pinar del Río ; entrée de Kiki dans le métier en 1996 ; Tabacalera Estelí et la ferme Vegas de 200 acres) ; karenbergercigars.com',
        'Trois générations et trois pays, et à chaque fois le tabac est ce qui reste. Max Berger a fui la Pologne devant Hitler dans les années 1940 et s''est arrêté à Cuba, où il a monté une fabrique à Pinar del Río. La révolution l''a chassé à son tour ; il est parti pour les États-Unis dans les années 1960, avec son fils, et il a décidé d''en finir avec le tabac. Le fils, Enrique — Kiki — n''a pas suivi ce conseil.

Dans les années 1990, quand le cigare américain s''est emballé, Kiki Berger est allé au Nicaragua, a acheté de la terre et ouvert une fabrique à Estelí, la Tabacalera Estelí, avec une ferme de deux cents acres à côté, les Vegas. C''est là que la maison est encore. C''est aussi la fabrique de Cuban Crafters, la boutique et la marque de la Petite Havane à Miami dont Kiki était co-propriétaire, et dont l''atlas porte la fiche : les deux maisons sortent du même atelier.

Karen est nicaraguayenne, d''Estelí même. À dix-huit ans, étudiante en gestion, elle a pris un emploi de rouleuse dans une fabrique de la ville pour payer ses études. La fabrique était celle de Kiki Berger. Ils se sont mariés, ont travaillé ensemble, et quand il est mort, en 2014, à cinquante-six ans, c''est elle qui a repris — la fabrique, la ferme, la boutique de Daytona Beach. Elle est, dit-on d''elle dans le métier, la seule femme à posséder et diriger une maison de cigares de bout en bout, de la terre au comptoir.

Elle a d''abord élargi la gamme Don Kiki, de quatre assemblages à six. Puis, en 2016, elle a signé la sienne : K by Karen Berger, sur les tabacs de sa propre ferme. Le métier l''a nommée Tobacco Businesswoman of the Year en 2021.',
        '[{"name":"Don Kiki","color":"#6B4226","force":"Medium-Full","wrapper":"Non divulguée","vitolas":[],"story":"La marque du fondateur. Quatre assemblages à sa mort en 2014, six depuis."},{"name":"K by Karen Berger","color":"#8B5A2B","force":"Medium","wrapper":"Habano et Maduro","vitolas":[],"story":"Signée en 2016, sur les tabacs de sa propre ferme."}]',
        'Three generations and three countries, and each time tobacco is what remains. Max Berger fled Poland from Hitler in the 1940s and stopped in Cuba, where he set up a factory in Pinar del Río. The revolution drove him out in turn; he left for the United States in the 1960s, with his son, and decided to be done with tobacco. The son, Enrique — Kiki — did not follow that advice.

In the 1990s, when the American cigar market took off, Kiki Berger went to Nicaragua, bought land and opened a factory in Estelí, the Tabacalera Estelí, with a two-hundred-acre farm beside it, the Vegas. That is where the house still is. It is also the factory of Cuban Crafters, the Little Havana shop and brand in Miami that Kiki co-owned, and whose entry this atlas carries: the two houses come out of the same workshop.

Karen is Nicaraguan, from Estelí itself. At eighteen, a business student, she took a job as a roller in a factory in town to pay for her studies. The factory was Kiki Berger''s. They married, worked together, and when he died, in 2014, at fifty-six, it was she who took over — the factory, the farm, the shop in Daytona Beach. She is, the trade says of her, the only woman to own and run a cigar house end to end, from the land to the counter.

She first widened the Don Kiki range, from four blends to six. Then, in 2016, she signed her own: K by Karen Berger, on tobacco from her own farm. The trade named her Tobacco Businesswoman of the Year in 2021.',
        '[{"name":"Don Kiki","color":"#6B4226","force":"Medium-Full","wrapper":"Undisclosed","vitolas":[],"story":"The founder''s brand. Four blends at his death in 2014, six since."},{"name":"K by Karen Berger","color":"#8B5A2B","force":"Medium","wrapper":"Habano and Maduro","vitolas":[],"story":"Signed in 2016, on tobacco from her own farm."}]',
        'Tres generaciones y tres países, y cada vez el tabaco es lo que queda. Max Berger huyó de Polonia ante Hitler en los años cuarenta y se detuvo en Cuba, donde montó una fábrica en Pinar del Río. La revolución lo expulsó a su vez; se fue a Estados Unidos en los años sesenta, con su hijo, y decidió acabar con el tabaco. El hijo, Enrique — Kiki — no siguió ese consejo.

En los años noventa, cuando el puro estadounidense se disparó, Kiki Berger fue a Nicaragua, compró tierra y abrió una fábrica en Estelí, la Tabacalera Estelí, con una finca de doscientos acres al lado, las Vegas. Allí sigue la casa. Es también la fábrica de Cuban Crafters, la tienda y marca de la Pequeña Habana de Miami de la que Kiki era copropietario, y cuya ficha lleva este atlas: las dos casas salen del mismo taller.

Karen es nicaragüense, de la propia Estelí. A los dieciocho años, estudiante de administración, tomó un empleo de torcedora en una fábrica de la ciudad para pagarse los estudios. La fábrica era la de Kiki Berger. Se casaron, trabajaron juntos, y cuando él murió, en 2014, a los cincuenta y seis años, fue ella quien tomó el relevo — la fábrica, la finca, la tienda de Daytona Beach. Es, dicen de ella en el oficio, la única mujer que posee y dirige una casa de puros de punta a punta, de la tierra al mostrador.

Primero amplió la gama Don Kiki, de cuatro ligadas a seis. Luego, en 2016, firmó la suya: K by Karen Berger, con los tabacos de su propia finca. El oficio la nombró Tobacco Businesswoman of the Year en 2021.',
        '[{"name":"Don Kiki","color":"#6B4226","force":"Medium-Full","wrapper":"No divulgada","vitolas":[],"story":"La marca del fundador. Cuatro ligadas a su muerte en 2014, seis desde entonces."},{"name":"K by Karen Berger","color":"#8B5A2B","force":"Medium","wrapper":"Habano y Maduro","vitolas":[],"story":"Firmada en 2016, con los tabacos de su propia finca."}]',
        'Drei Generationen und drei Länder, und jedes Mal ist der Tabak das, was bleibt. Max Berger floh in den 1940er-Jahren vor Hitler aus Polen und blieb in Kuba, wo er in Pinar del Río eine Fabrik aufbaute. Die Revolution vertrieb ihn wiederum; er ging in den 1960er-Jahren mit seinem Sohn in die Vereinigten Staaten und beschloss, mit dem Tabak abzuschließen. Der Sohn, Enrique — Kiki — befolgte diesen Rat nicht.

In den 1990er-Jahren, als die amerikanische Zigarre boomte, ging Kiki Berger nach Nicaragua, kaufte Land und eröffnete in Estelí eine Fabrik, die Tabacalera Estelí, mit einer zweihundert Acre großen Farm daneben, den Vegas. Dort ist das Haus noch heute. Es ist auch die Fabrik von Cuban Crafters, dem Laden und der Marke in Little Havana, Miami, deren Mitinhaber Kiki war und deren Eintrag dieser Atlas führt: Die beiden Häuser kommen aus derselben Werkstatt.

Karen ist Nicaraguanerin, aus Estelí selbst. Mit achtzehn, Studentin der Betriebswirtschaft, nahm sie eine Stelle als Rollerin in einer Fabrik der Stadt an, um ihr Studium zu bezahlen. Die Fabrik war die von Kiki Berger. Sie heirateten, arbeiteten zusammen, und als er 2014 mit sechsundfünfzig starb, übernahm sie — die Fabrik, die Farm, den Laden in Daytona Beach. Sie ist, sagt man in der Branche über sie, die einzige Frau, die ein Zigarrenhaus von einem Ende zum anderen besitzt und führt, vom Boden bis zum Tresen.

Zuerst erweiterte sie die Reihe Don Kiki, von vier Blends auf sechs. Dann, 2016, signierte sie ihre eigene: K by Karen Berger, auf Tabaken der eigenen Farm. Die Branche ernannte sie 2021 zur Tobacco Businesswoman of the Year.',
        '[{"name":"Don Kiki","color":"#6B4226","force":"Medium-Full","wrapper":"Nicht angegeben","vitolas":[],"story":"Die Marke des Gründers. Vier Blends bei seinem Tod 2014, seither sechs."},{"name":"K by Karen Berger","color":"#8B5A2B","force":"Medium","wrapper":"Habano und Maduro","vitolas":[],"story":"2016 signiert, auf Tabaken der eigenen Farm."}]',
        '三代人，三个国家，每一次留下的都是烟草。马克斯·伯格1940年代逃离希特勒治下的波兰，落脚古巴，在比那尔德里奥办起一家工厂。革命又把他赶走；1960年代他带着儿子去了美国，决定与烟草一刀两断。儿子恩里克——「基基」——没有听从这个忠告。

1990年代美国雪茄热潮兴起时，基基·伯格去了尼加拉瓜，买地，在埃斯特利开办工厂 Tabacalera Estelí，旁边是两百英亩的 Vegas 农场。公司至今仍在那里。它也是 Cuban Crafters 的工厂——迈阿密小哈瓦那的那家店铺与同名品牌，基基是其共有人，本图集载有其词条：两家出自同一作坊。

卡伦是尼加拉瓜人，就来自埃斯特利。十八岁时，作为工商管理专业的学生，她为付学费在城里一家工厂当卷烟工。那家工厂正是基基·伯格的。两人结婚，共同经营；2014年他五十六岁去世后，是她接过了一切——工厂、农场、代托纳比奇的店铺。业内说她是唯一一位从土地到柜台、从头到尾拥有并经营一家雪茄公司的女性。

她先把 Don Kiki 系列从四款配方扩到六款。随后于2016年推出署名系列：K by Karen Berger，用自家农场的烟叶。2021年，业界授予她「年度烟草女企业家」。',
        '[{"name":"Don Kiki","color":"#6B4226","force":"Medium-Full","wrapper":"未公开","vitolas":[],"story":"创办人的牌子。2014年他去世时有四款配方，此后六款。"},{"name":"K by Karen Berger","color":"#8B5A2B","force":"Medium","wrapper":"Habano 与 Maduro","vitolas":[],"story":"2016年推出，用自家农场的烟叶。"}]',
        'ثلاثة أجيال وثلاثة بلدان، وفي كلّ مرّة يكون التبغ هو ما يبقى. فرّ ماكس بيرغر من بولندا أمام هتلر في الأربعينيات وتوقّف في كوبا، حيث أقام مصنعًا في بينار ديل ريو. وطردته الثورة بدورها؛ فرحل إلى الولايات المتحدة في الستينيات مع ابنه، وقرّر أن يقطع مع التبغ. غير أنّ الابن، إنريكه — كيكي — لم يأخذ بتلك النصيحة.

في التسعينيات، حين انتعش السيجار الأمريكي، ذهب كيكي بيرغر إلى نيكاراغوا، فاشترى أرضًا وفتح مصنعًا في إستيلي، Tabacalera Estelí، ومزرعةً بمئتي فدّان إلى جانبه، هي «فيغاس». وهناك ما زالت الدار. وهو أيضًا مصنع Cuban Crafters، المتجر والعلامة في هافانا الصغيرة بميامي اللذين كان كيكي شريكًا في ملكيّتهما، ويحمل هذا الأطلس بطاقتهما: فالداران تخرجان من الورشة نفسها.

كارِن نيكاراغوية، من إستيلي نفسها. في الثامنة عشرة، وهي طالبة إدارة أعمال، أخذت عملًا لافّةً في مصنع بالمدينة لتدفع نفقات دراستها. كان المصنع مصنعَ كيكي بيرغر. تزوّجا وعملا معًا، ولمّا توفّي سنة 2014 عن ستّ وخمسين سنة، كانت هي من تولّى — المصنع والمزرعة ومتجر دايتونا بيتش. ويُقال عنها في المهنة إنّها المرأة الوحيدة التي تملك وتدير دار سيجار من طرفها إلى طرفها، من الأرض إلى المنضدة.

وسّعت أوّلًا سلسلة Don Kiki من أربع مزجات إلى ستّ. ثم وقّعت سلسلتها سنة 2016: K by Karen Berger، على أتبغة مزرعتها. وسمّتها المهنة سيّدة أعمال التبغ لسنة 2021.',
        '[{"name":"Don Kiki","color":"#6B4226","force":"Medium-Full","wrapper":"غير معلن","vitolas":[],"story":"علامة المؤسّس. أربع مزجات عند وفاته سنة 2014، وستٌّ منذ ذلك الحين."},{"name":"K by Karen Berger","color":"#8B5A2B","force":"Medium","wrapper":"هابانو ومادورو","vitolas":[],"story":"وُقّعت سنة 2016، على أتبغة مزرعتها."}]')
ON DUPLICATE KEY UPDATE `country_id` = VALUES(`country_id`), `founded` = VALUES(`founded`), `factory` = VALUES(`factory`), `source` = VALUES(`source`), `history` = VALUES(`history`), `gamme` = VALUES(`gamme`), `history_en` = VALUES(`history_en`), `gamme_en` = VALUES(`gamme_en`), `history_es` = VALUES(`history_es`), `gamme_es` = VALUES(`gamme_es`), `history_de` = VALUES(`history_de`), `gamme_de` = VALUES(`gamme_de`), `history_zh` = VALUES(`history_zh`), `gamme_zh` = VALUES(`gamme_zh`), `history_ar` = VALUES(`history_ar`), `gamme_ar` = VALUES(`gamme_ar`);

-- ── Rojas Cigars ──

INSERT INTO `brands` (`name`, `country_id`, `founded`, `factory`, `source`, `history`, `gamme`, `history_en`, `gamme_en`, `history_es`, `gamme_es`, `history_de`, `gamme_de`, `history_zh`, `gamme_zh`, `history_ar`, `gamme_ar`)
VALUES ('Rojas Cigars',
        'nicaragua',
        '2013 — Guayacan dès 2012 ; usine propre à Estelí',
        'Rojas Cigar Factory, Estelí — un ancien cinéma d''un peu plus de 7 000 pieds carrés',
        'halfwheel.com « Noel Rojas Announces New Nicaraguan Factory » et « PCA 2025: Rojas Cigars » (Rojas Cigar Factory, ancien cinéma d''Estelí, un peu plus de 7 000 pieds carrés) ; cigar-coop.com (Guayacan 2012, premier salon 2013 ; ateliers précédents Aromas de Jalapa, Tabacalera New Order of the Ages, Sabor de Estelí, tous fermés ; a fait le Draig Cayuquero d''Emilio, le Nomad LE Estelí Lot 1386, les cigares d''Ezra Zion) ; cigarinspector.com et stogiepress.com (né à Cuba, Miami vers vingt ans, puis le Nicaragua ; Tabacalera Flor de San Luis en 2019 pour KSG, Bluebonnets, Statement ; roule Stolen Throne)',
        'Noel Rojas est né à Cuba et l''a quittée vers vingt ans, pour Miami, puis pour le Nicaragua. Il y est d''abord assembleur pour les autres — et c''est ainsi que l''atlas le rencontre partout sans l''avoir jamais nommé : c''est lui qui a fait le Draig Cayuquero d''Emilio, le Nomad LE Estelí Lot 1386, les cigares d''Ezra Zion, ceux de Stolen Throne. Trois maisons de cet atlas, et une quatrième à venir, sortent de ses mains.

Sa propre marque, Guayacan, date de 2012 ; son premier salon, de 2013. Entre les deux et aujourd''hui, il y a une suite d''ateliers qui n''ont pas tenu — Aromas de Jalapa, Tabacalera New Order of the Ages, Sabor de Estelí, tous à Estelí, tous fermés après peu de temps — puis, en 2019, un rapprochement avec la Tabacalera Flor de San Luis pour trois cigares, KSG, Bluebonnets et Statement. Cette fiche dit les échecs parce qu''ils expliquent ce qui suit.

Ce qui suit, c''est une fabrique à lui, et le lieu dit quelque chose du personnage : Rojas a racheté un ancien cinéma d''Estelí, un peu plus de sept mille pieds carrés, et en a fait la Rojas Cigar Factory. Il vit entre le Texas — Dallas–Fort Worth, où est la société — et le Nicaragua, où est le travail.

Les lignes portent des noms qui refusent le sérieux : Street Tacos, Bluebonnets, Statement. Le dixième anniversaire, en 2023, a eu son cigare.',
        '[{"name":"Guayacan","color":"#5B3A29","force":"Medium-Full","wrapper":"Non divulguée","vitolas":[],"story":"La première marque, en 2012 — avant la société, avant la fabrique."},{"name":"Bluebonnets","color":"#3E4A6B","force":"Medium","wrapper":"Non divulguée","vitolas":[],"story":"La fleur du Texas, sur un cigare fait à Estelí. Née en 2019 chez Flor de San Luis."},{"name":"Street Tacos","color":"#8B5A2B","force":"Medium-Full","wrapper":"Non divulguée","vitolas":[],"story":"Le nom dit le ton de la maison. Une édition Cinco de Mayo en 2025."}]',
        'Noel Rojas was born in Cuba and left it around twenty, for Miami, then for Nicaragua. There he was first a blender for others — and that is how this atlas meets him everywhere without ever having named him: he made Emilio''s Draig Cayuquero, the Nomad LE Estelí Lot 1386, Ezra Zion''s cigars, Stolen Throne''s. Three houses in this atlas, and a fourth to come, come out of his hands.

His own brand, Guayacan, dates from 2012; his first trade show, from 2013. Between those and today lies a string of workshops that did not hold — Aromas de Jalapa, Tabacalera New Order of the Ages, Sabor de Estelí, all in Estelí, all closed after a short time — then, in 2019, an alignment with Tabacalera Flor de San Luis for three cigars, KSG, Bluebonnets and Statement. This entry tells the failures because they explain what follows.

What follows is a factory of his own, and the place says something about the man: Rojas bought an old cinema in Estelí, a little over seven thousand square feet, and made it the Rojas Cigar Factory. He lives between Texas — Dallas–Fort Worth, where the company is — and Nicaragua, where the work is.

The lines carry names that refuse seriousness: Street Tacos, Bluebonnets, Statement. The tenth anniversary, in 2023, had its cigar.',
        '[{"name":"Guayacan","color":"#5B3A29","force":"Medium-Full","wrapper":"Undisclosed","vitolas":[],"story":"The first brand, in 2012 — before the company, before the factory."},{"name":"Bluebonnets","color":"#3E4A6B","force":"Medium","wrapper":"Undisclosed","vitolas":[],"story":"The Texas flower, on a cigar made in Estelí. Born in 2019 at Flor de San Luis."},{"name":"Street Tacos","color":"#8B5A2B","force":"Medium-Full","wrapper":"Undisclosed","vitolas":[],"story":"The name says the house''s tone. A Cinco de Mayo edition in 2025."}]',
        'Noel Rojas nació en Cuba y la dejó hacia los veinte años, por Miami, luego por Nicaragua. Allí fue primero ligador para otros — y así es como este atlas lo encuentra por todas partes sin haberlo nombrado nunca: es él quien hizo el Draig Cayuquero de Emilio, el Nomad LE Estelí Lot 1386, los puros de Ezra Zion, los de Stolen Throne. Tres casas de este atlas, y una cuarta por venir, salen de sus manos.

Su propia marca, Guayacan, data de 2012; su primer salón, de 2013. Entre ambos y hoy hay una serie de talleres que no aguantaron — Aromas de Jalapa, Tabacalera New Order of the Ages, Sabor de Estelí, todos en Estelí, todos cerrados al poco tiempo — luego, en 2019, un acercamiento a la Tabacalera Flor de San Luis para tres puros, KSG, Bluebonnets y Statement. Esta ficha cuenta los fracasos porque explican lo que sigue.

Lo que sigue es una fábrica propia, y el lugar dice algo del personaje: Rojas compró un antiguo cine de Estelí, poco más de siete mil pies cuadrados, y lo convirtió en la Rojas Cigar Factory. Vive entre Texas — Dallas–Fort Worth, donde está la empresa — y Nicaragua, donde está el trabajo.

Las líneas llevan nombres que rehúyen la seriedad: Street Tacos, Bluebonnets, Statement. El décimo aniversario, en 2023, tuvo su puro.',
        '[{"name":"Guayacan","color":"#5B3A29","force":"Medium-Full","wrapper":"No divulgada","vitolas":[],"story":"La primera marca, en 2012 — antes de la empresa, antes de la fábrica."},{"name":"Bluebonnets","color":"#3E4A6B","force":"Medium","wrapper":"No divulgada","vitolas":[],"story":"La flor de Texas, en un puro hecho en Estelí. Nacida en 2019 en Flor de San Luis."},{"name":"Street Tacos","color":"#8B5A2B","force":"Medium-Full","wrapper":"No divulgada","vitolas":[],"story":"El nombre dice el tono de la casa. Una edición Cinco de Mayo en 2025."}]',
        'Noel Rojas wurde in Kuba geboren und verließ es mit etwa zwanzig, nach Miami, dann nach Nicaragua. Dort war er zuerst Blender für andere — und so begegnet ihm dieser Atlas überall, ohne ihn je genannt zu haben: Er machte den Draig Cayuquero von Emilio, den Nomad LE Estelí Lot 1386, die Zigarren von Ezra Zion, die von Stolen Throne. Drei Häuser dieses Atlas, und ein viertes, das noch kommt, gehen durch seine Hände.

Seine eigene Marke, Guayacan, stammt von 2012; seine erste Messe von 2013. Zwischen beidem und heute liegt eine Reihe von Werkstätten, die nicht hielten — Aromas de Jalapa, Tabacalera New Order of the Ages, Sabor de Estelí, alle in Estelí, alle nach kurzer Zeit geschlossen — dann, 2019, eine Annäherung an die Tabacalera Flor de San Luis für drei Zigarren, KSG, Bluebonnets und Statement. Dieser Eintrag erzählt die Fehlschläge, weil sie erklären, was folgt.

Was folgt, ist eine eigene Fabrik, und der Ort sagt etwas über den Mann: Rojas kaufte ein altes Kino in Estelí, etwas über siebentausend Quadratfuß, und machte daraus die Rojas Cigar Factory. Er lebt zwischen Texas — Dallas–Fort Worth, wo die Firma sitzt — und Nicaragua, wo die Arbeit ist.

Die Linien tragen Namen, die den Ernst verweigern: Street Tacos, Bluebonnets, Statement. Das zehnjährige Jubiläum 2023 bekam seine Zigarre.',
        '[{"name":"Guayacan","color":"#5B3A29","force":"Medium-Full","wrapper":"Nicht angegeben","vitolas":[],"story":"Die erste Marke, 2012 — vor der Firma, vor der Fabrik."},{"name":"Bluebonnets","color":"#3E4A6B","force":"Medium","wrapper":"Nicht angegeben","vitolas":[],"story":"Die Blume von Texas, auf einer in Estelí gemachten Zigarre. 2019 bei Flor de San Luis entstanden."},{"name":"Street Tacos","color":"#8B5A2B","force":"Medium-Full","wrapper":"Nicht angegeben","vitolas":[],"story":"Der Name sagt den Ton des Hauses. Eine Cinco-de-Mayo-Edition 2025."}]',
        '诺埃尔·罗哈斯生于古巴，二十岁上下离开，先到迈阿密，再到尼加拉瓜。在那里他起初为他人调配——本图集正是这样处处遇见他却从未点过他的名：Emilio 的 Draig Cayuquero、Nomad LE Estelí Lot 1386、Ezra Zion 的雪茄、Stolen Throne 的雪茄，都出自他手。本图集里的三家、外加即将收录的第四家，都经他之手。

他自己的牌子 Guayacan 始于2012年；首次参展在2013年。从那时到今天，中间是一连串没能撑住的作坊——Aromas de Jalapa、Tabacalera New Order of the Ages、Sabor de Estelí，全在埃斯特利，全在不久后关门——然后是2019年与 Tabacalera Flor de San Luis 合作三款雪茄：KSG、Bluebonnets、Statement。本词条把失败写出来，因为它们解释了后来的事。

后来的事，是一座自己的工厂，而这个地方本身也说明了此人：罗哈斯买下埃斯特利一座旧电影院，七千多平方英尺，改造成 Rojas Cigar Factory。他往返于得克萨斯——公司所在的达拉斯-沃思堡——与尼加拉瓜——干活的地方——之间。

各系列的名字拒绝一本正经：Street Tacos、Bluebonnets、Statement。2023年的十周年也有自己的一支雪茄。',
        '[{"name":"Guayacan","color":"#5B3A29","force":"Medium-Full","wrapper":"未公开","vitolas":[],"story":"第一个牌子，2012年——早于公司，早于工厂。"},{"name":"Bluebonnets","color":"#3E4A6B","force":"Medium","wrapper":"未公开","vitolas":[],"story":"得克萨斯州花，用在一支埃斯特利制的雪茄上。2019年诞生于 Flor de San Luis。"},{"name":"Street Tacos","color":"#8B5A2B","force":"Medium-Full","wrapper":"未公开","vitolas":[],"story":"名字道出了这家的调性。2025年有五月五日节特别版。"}]',
        'وُلد نويل روخاس في كوبا وغادرها في نحو العشرين، إلى ميامي ثم إلى نيكاراغوا. وهناك كان أوّلًا مزّاجًا لغيره — وهكذا يلتقيه هذا الأطلس في كلّ مكان دون أن يكون قد سمّاه قطّ: فهو من صنع Draig Cayuquero لإميليو، وNomad LE Estelí Lot 1386، وسيجارات Ezra Zion، وسيجارات Stolen Throne. ثلاث دور في هذا الأطلس، ورابعة قادمة، تخرج من يديه.

علامته الخاصة، Guayacan، تعود إلى 2012؛ ومعرضه الأوّل إلى 2013. وبين ذلك واليوم سلسلةُ ورش لم تصمد — Aromas de Jalapa وTabacalera New Order of the Ages وSabor de Estelí، كلّها في إستيلي، وكلّها أُغلقت بعد وقت قصير — ثم، في 2019، تقاربٌ مع Tabacalera Flor de San Luis لثلاثة سيجارات: KSG وBluebonnets وStatement. تروي هذه البطاقة الإخفاقات لأنّها تفسّر ما يليها.

وما يليها مصنعٌ له، والمكان يقول شيئًا عن الرجل: اشترى روخاس دارَ سينما قديمة في إستيلي، تزيد قليلًا على سبعة آلاف قدم مربّعة، وجعل منها Rojas Cigar Factory. ويعيش بين تكساس — دالاس–فورت وورث، حيث الشركة — ونيكاراغوا، حيث العمل.

وتحمل الخطوط أسماءً ترفض الجدّية: Street Tacos وBluebonnets وStatement. وكان للذكرى العاشرة، سنة 2023، سيجارها.',
        '[{"name":"Guayacan","color":"#5B3A29","force":"Medium-Full","wrapper":"غير معلن","vitolas":[],"story":"العلامة الأولى، سنة 2012 — قبل الشركة، وقبل المصنع."},{"name":"Bluebonnets","color":"#3E4A6B","force":"Medium","wrapper":"غير معلن","vitolas":[],"story":"زهرة تكساس، على سيجار مصنوع في إستيلي. وُلد سنة 2019 لدى Flor de San Luis."},{"name":"Street Tacos","color":"#8B5A2B","force":"Medium-Full","wrapper":"غير معلن","vitolas":[],"story":"الاسم يقول نبرة الدار. إصدار «سينكو دي مايو» سنة 2025."}]')
ON DUPLICATE KEY UPDATE `country_id` = VALUES(`country_id`), `founded` = VALUES(`founded`), `factory` = VALUES(`factory`), `source` = VALUES(`source`), `history` = VALUES(`history`), `gamme` = VALUES(`gamme`), `history_en` = VALUES(`history_en`), `gamme_en` = VALUES(`gamme_en`), `history_es` = VALUES(`history_es`), `gamme_es` = VALUES(`gamme_es`), `history_de` = VALUES(`history_de`), `gamme_de` = VALUES(`gamme_de`), `history_zh` = VALUES(`history_zh`), `gamme_zh` = VALUES(`gamme_zh`), `history_ar` = VALUES(`history_ar`), `gamme_ar` = VALUES(`gamme_ar`);


-- ── CUBAN CRAFTERS : la fabrique a un nom, et une fiche ──
UPDATE `brands` SET `history` = CONCAT(`history`, '

La Tabacalera Estelí est la fabrique de Kiki Berger, co-propriétaire de Cuban Crafters, mort en 2014 ; sa veuve Karen Berger la dirige, et l''atlas porte désormais sa fiche : Karen Berger Cigars. Les deux maisons sortent du même atelier.')
 WHERE `name` = 'Cuban Crafters' AND `history` NOT LIKE '%Karen Berger%';
UPDATE `brands` SET `history_en` = CONCAT(`history_en`, '

Tabacalera Estelí is the factory of Kiki Berger, co-owner of Cuban Crafters, who died in 2014; his widow Karen Berger runs it, and this atlas now carries her entry: Karen Berger Cigars. The two houses come out of the same workshop.')
 WHERE `name` = 'Cuban Crafters' AND `history_en` NOT LIKE '%Karen Berger%';
UPDATE `brands` SET `history_es` = CONCAT(`history_es`, '

La Tabacalera Estelí es la fábrica de Kiki Berger, copropietario de Cuban Crafters, fallecido en 2014; su viuda Karen Berger la dirige, y este atlas lleva ahora su ficha: Karen Berger Cigars. Las dos casas salen del mismo taller.')
 WHERE `name` = 'Cuban Crafters' AND `history_es` NOT LIKE '%Karen Berger%';
UPDATE `brands` SET `history_de` = CONCAT(`history_de`, '

Die Tabacalera Estelí ist die Fabrik von Kiki Berger, Mitinhaber von Cuban Crafters, gestorben 2014; seine Witwe Karen Berger führt sie, und dieser Atlas führt nun ihren Eintrag: Karen Berger Cigars. Die beiden Häuser kommen aus derselben Werkstatt.')
 WHERE `name` = 'Cuban Crafters' AND `history_de` NOT LIKE '%Karen Berger%';
UPDATE `brands` SET `history_zh` = CONCAT(`history_zh`, '

Tabacalera Estelí 是 Cuban Crafters 共有人基基·伯格的工厂，他于2014年去世；其遗孀卡伦·伯格主持工厂，本图集如今载有她的词条：Karen Berger Cigars。两家出自同一作坊。')
 WHERE `name` = 'Cuban Crafters' AND `history_zh` NOT LIKE '%Karen Berger%';
UPDATE `brands` SET `history_ar` = CONCAT(`history_ar`, '

تاباكاليرا إستيلي هي مصنع كيكي بيرغر، الشريك في ملكيّة Cuban Crafters، المتوفّى سنة 2014؛ وتديره أرملته كارِن بيرغر، ويحمل هذا الأطلس الآن بطاقتها: Karen Berger Cigars. فالداران تخرجان من الورشة نفسها.')
 WHERE `name` = 'Cuban Crafters' AND `history_ar` NOT LIKE '%Karen Berger%';

-- ── NICARAGUA : `brands` reecrit en litteral complet (49 entrees) ──
UPDATE `producer_countries` SET `brands` = '[{"desc":"Référence absolue du Nicaragua premium","name":"Padrón","iconic":true},{"desc":"Pepin Garcia, maître torcedor légendaire","name":"My Father","iconic":true},{"desc":"Serie V mondialement reconnue","name":"Oliva","iconic":true},{"desc":"Liga Privada, révolution moderne","name":"Drew Estate","iconic":true},{"desc":"Plus grand producteur familial","name":"Plasencia","iconic":false},{"desc":"Élégance et puissance fusionnées","name":"Rocky Patel","iconic":false},{"desc":"Maître du Connecticut nicaraguayen","name":"Perdomo","iconic":false},{"desc":"Plus ancienne manufacture du pays","name":"Joya de Nicaragua","iconic":false},{"desc":"Le mélange privé de Jonathan Drew, devenu culte","name":"Liga Privada","iconic":false},{"desc":"Maison suisse de 1888, roulée à Estelí","name":"Villiger","iconic":false},{"desc":"Le rouleur que les autres marques employaient sans le nommer","name":"A.J. Fernandez","iconic":true},{"desc":"D''abord un planteur de Jalapa, ensuite une marque","name":"Aganorsa Leaf","iconic":true},{"desc":"La grammaire cubaine, la matière nicaraguayenne","name":"Tatuaje","iconic":false},{"desc":"Celle qui a rendu le petit format respectable","name":"Illusione","iconic":false},{"desc":"Un cigare ancré dans une culture, pas seulement un terroir","name":"Foundation Cigar Company","iconic":false},{"desc":"Granada plutôt qu''Estelí — et fermée depuis juin 2023","name":"Mombacho","iconic":false},{"desc":"Une marque qui s''est offert sa propre manufacture","name":"Espinosa","iconic":true},{"desc":"Pas d''usine : elle choisit son rouleur selon l''assemblage","name":"Crowned Heads","iconic":true},{"desc":"Des noms cubains d''avant 1960, des assemblages d''aujourd''hui","name":"Warped","iconic":false},{"desc":"Nodal compose, Plasencia fabrique, Tabacalera possède","name":"Capitol","iconic":false},{"desc":"Repris par la famille García en décembre 2019, après quarante-cinq ans chez Quesada","name":"Fonseca Nicaraguayen","iconic":false},{"name":"Nicoya","desc":"Maison australienne roulée à Estelí — l''Australie ne cultive plus depuis 2006","iconic":false},{"name":"Dunbarton Tobacco & Trust","desc":"Steve Saka, ex-Drew Estate, parti monter sa maison sans usine","iconic":true},{"name":"RoMa Craft Tobac","desc":"Commencée dans un garage, puis son propre atelier à Estelí","iconic":true},{"name":"Viaje","desc":"Plus de gamme régulière depuis 2012 : rien que des séries limitées","iconic":false},{"name":"Room101","desc":"D''un bijoutier au cigare ; trois manufactures, deux pays","iconic":false},{"name":"L''Atelier","desc":"La seconde maison de Pete Johnson, chez My Father comme Tatuaje","iconic":false},{"name":"La Aroma de Cuba","desc":"Nom cubain des années 1880, refait par Pepin García en 2009","iconic":false},{"name":"Southern Draw","desc":"Robert et Sharon Holt — un seul atelier, ce qui est rare","iconic":false},{"name":"HVC Cigars","desc":"Havana City ; dix ans sans usine, puis la sienne en 2021","iconic":true},{"name":"Fratello","desc":"Un ingénieur de la NASA passé au cigare","iconic":false},{"name":"Curivari","desc":"Grecque de tête, cubaine d''intention, nicaraguayenne de matière","iconic":false},{"name":"Black Label Trading Co.","desc":"Une fabrique conçue comme un atelier d''artiste","iconic":false},{"name":"Asylum","desc":"L''autre moitié de CLE — et une fabrique qui fut un cinéma","iconic":false},{"name":"Micallef","desc":"Une panne de voiture, un Texan, et trois générations cubaines","iconic":false},{"name":"Gurkha","desc":"Sans usine jusqu''en 2017, puis propriétaire de la sienne à Estelí","iconic":false},{"name":"Protocol","desc":"Deux policiers, aucune usine — La Zona puis San Lotano","iconic":false},{"name":"Regius","desc":"Maison londonienne de 2010, roulée chez Plasencia","iconic":false},{"name":"Cornelius & Anthony","desc":"Cent cinquante ans de tabac en Virginie, roulés à Estelí","iconic":false},{"name":"262 Cigars","desc":"Le nom est une date : février 1962, la signature de l''embargo","iconic":false},{"name":"Emilio Cigars","desc":"Trois fabriques, trois familles, un seul nom sur la bague","iconic":false},{"name":"Nomad","desc":"Le nom était un programme : elle a changé d''atelier et de pays","iconic":false},{"name":"7-20-4","desc":"Une adresse de Manchester fermée en 1962, reprise en 2006","iconic":false},{"name":"Cuban Crafters","desc":"Une boutique à Miami, mais la fabrique est à Estelí","iconic":false},{"name":"J. Fuego","desc":"Estelí, 2016 — le Corojo de Pinar del Río, et l''atelier où 7-20-4 est roulée","iconic":false},{"name":"Luciano Cigars","desc":"Estelí — la fabrique d''un Cubain parti en 2005, au prénom d''un financier brésilien ; roule Crowned Heads et Ozgener","iconic":false},{"name":"Agrotabacos","desc":"Condega, 1995 — les Ortez ; 60 % de la production pour des tiers, dont Altadis","iconic":false},{"name":"Karen Berger Cigars","desc":"Estelí — la fabrique de Kiki Berger, reprise par sa veuve en 2014 ; c''est aussi celle de Cuban Crafters","iconic":false},{"name":"Rojas Cigars","desc":"Estelí — un ancien cinéma ; l''assembleur d''Ezra Zion, Nomad et Stolen Throne","iconic":false}]' WHERE `id` = 'nicaragua';

-- ── LES SCEAUX ──
INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'brands', b.`name`, c.champ, l.lang,
       SHA1(CASE c.champ WHEN 'history' THEN b.`history` ELSE b.`gamme` END),
       'machine', NOW()
  FROM `brands` b
  JOIN (SELECT 'history' champ UNION ALL SELECT 'gamme') c
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE b.`name` IN ('Luciano Cigars','Agrotabacos','Karen Berger Cigars','Rojas Cigars','Cuban Crafters')
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

-- ── LE JOURNAL ──
DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 208';
INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 208','systeme','lot_2a_quatre_fabriques_nicaraguayennes','marque',0,
   'Luciano (ex-ACE Prime), Agrotabacos, Karen Berger Cigars, Rojas Cigars : quatre fabriques avec usine, chacune roulant pour des maisons de l atlas — Crowned Heads, Ozgener, Ventura, Lampert, Cuban Crafters, Ezra Zion, Nomad, Stolen Throne'),
  (NULL,'migration 208','systeme','la_fabrique_de_cuban_crafters_a_un_nom','marque',0,
   'La Tabacalera Esteli de Karen Berger est la fabrique de Cuban Crafters : Kiki Berger etait co-proprietaire des deux. La fiche Cuban Crafters nommait l usine sans dire a qui elle etait. Un paragraphe en six langues le dit'),
  (NULL,'migration 208','systeme','tabacalera_aragon_reportee','marque',0,
   'Son site ne donne pas d annee de fondation et la seule relation documentee par la presse, Jas Sum Kral 2018-2024, est terminee. Une fiche qui ne tiendrait que sur le site de la maison repeterait la faute du Torano Panama'),
  (NULL,'migration 208','systeme','trois_reseaux_de_plus','marque',0,
   'Perez-Carrillo presente Meirelles a Pichardo en 2008 ; Max Berger fuit la Pologne pour Cuba puis son fils Kiki refait la fabrique au Nicaragua ; Rojas a fait les cigares de quatre maisons avant d avoir la sienne. Les personnes relient les fiches');

-- ── LE CONTROLE, ET IL DOIT NE RENDRE QUE DES 1 ──
SELECT
  (SELECT COUNT(*) FROM `brands` WHERE `name` IN ('Luciano Cigars','Agrotabacos','Karen Berger Cigars','Rojas Cigars')) = 4 AS quatre_fiches,
  (SELECT `history` LIKE '%Karen Berger%' AND `history_ar` LIKE '%Karen Berger%' FROM `brands` WHERE `name` = 'Cuban Crafters') AS cuban_crafters_relie,
  (SELECT `brands` LIKE '%Rojas Cigars%' AND `brands` LIKE '%Luciano Cigars%' FROM `producer_countries` WHERE `id` = 'nicaragua') AS nicaragua_annonce,
  (SELECT SUM(CHAR_LENGTH(`detail`) >= 255) = 0 FROM `moderation_log` WHERE `acteur_nom` = 'migration 208') AS journal_non_tronque;
SELECT COUNT(*) AS marques, SUM(TRIM(COALESCE(`source`,'')) = '') AS sans_source FROM `brands`;
