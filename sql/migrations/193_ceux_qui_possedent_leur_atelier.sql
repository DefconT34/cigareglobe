-- ════════════════════════════════════════════════════════
-- 193 — Ceux qui possèdent leur atelier, et cinq reprises
-- ────────────────────────────────────────────────────────
--   Cuban Crafters        Don Kiki Berger, 1996      nicaragua
--   Vegas de Santiago     Marc Niehaus               costarica
--   De Los Reyes Cigars   Augusto Reyes, 1995        dominican
--   Menendez Amerino      Amerino et Menéndez, 1977  brazil
--   Don Tomas             U.S. Tobacco, 1975         honduras
--
-- Le contrepoint exact de la 192. Ces cinq-la fabriquent : quatre
-- possedent leur manufacture, et deux cultivent en plus leur propre
-- tabac (Vegas de Santiago, De Los Reyes par la famille du fondateur).
--
-- ── DIXIEME ERREUR DE PAYS DU RECENSEMENT ───────────────
-- `docs/maisons-absentes.md` classait CUBAN CRAFTERS aux Etats-Unis, a
-- l'adresse de son magasin de Miami. Elle possede sa fabrique — la
-- Tabacalera Esteli, le long de la route panamericaine, a quelques
-- centaines de metres de chez Padron. La fiche est nicaraguayenne.
--
-- ── LA CONSIGNE « QUI FAIT QUOI » ───────────────────────
--   Menendez Amerino   fabrique DONA FLOR, qui a sa propre fiche dans
--                      cet atlas — meme partage qu'entre Tabacalera
--                      Palma et Aging Room, la fabrique et sa marque
--   De Los Reyes       fait ses marques (Saga, Augusto Reyes, Arsen) ET
--                      roule pour d'autres : Debonaire, Fittipaldi,
--                      Patoro. Leo Reyes cultive, Nirka Reyes dirige
--   Don Tomas          HATSA a Danli, sous Estelo PADRON — le meme
--                      atelier et le meme homme que la fiche BOLIVAR
--                      HONDURAS nomme deja
--   Vegas de Santiago  roule des bagues de detaillants europeens, dont
--                      celles de ZECHBAUER, la maison de Munich
--
-- ── TROIS REQUALIFICATIONS ──────────────────────────────
-- Trois noms que le recensement listait comme maisons absentes n'en
-- sont pas. Ils sont des LIGNES de maisons deja presentes :
--
--   CHAMAN         ligne de VEGAS DE SANTIAGO — nommee sur sa fiche
--   ARSEN          marque de DE LOS REYES CIGARS — nommee sur sa fiche
--   NICK'S STICKS  ligne de PERDOMO, deja presente dans sa gamme, ou
--                  elle etait ecrite « Nick's Stick » au singulier.
--                  Corrigee ici dans les six langues
--
-- Meme traitement que Zino (191) et Oliveros (186) : la ligne ne recoit
-- pas de fiche, elle est nommee sur celle de sa maison.
--
-- ── QUATRE REPRISES DANS DES FICHES EXISTANTES ──────────
-- 1. DONA FLOR se disait faite « annees 1990, a Cruz das Almas ». Les
--    deux sont faux. La marque est lancee en 1982, et la fabrique
--    Menendez Amerino est a SAO GONCALO DOS CAMPOS. Cruz das Almas est
--    la ou pousse la mata fina qu'elle emploie — un lieu de culture
--    pris pour un lieu de fabrication.
--
-- 2. BOLIVAR HONDURAS : Scandinavian Tobacco Group a retire la marque
--    du tarif en octobre 2024, avec El Rico Habano et Helix. La fiche
--    le dit desormais, dans les six langues.
--
-- 3. TROIS `founded` COMMENCAIENT PAR UN TIRET ORPHELIN —
--    « — Rep. dominicaine (Altadis USA) ». L'annee attendue avant le
--    tiret manquait, et le tiret est reste. H. Upmann Dominicain,
--    Henry Clay, Saint Luis Rey Honduras. Un nouveau controle de
--    `coherence_check` refuse desormais cette forme.
--
-- 4. KOLUMBUS portait « La Palma, Iles Canaries » dans son champ de
--    DATE — exactement l'erreur corrigee chez Vargas a la 182. Sa fiche
--    dit elle-meme que la maison ne publie pas son annee ; le champ le
--    dit maintenant aussi.
--
-- ⚠ LES CINQ SONT ROULEES MAIN. Menendez Amerino le declare de son cote
-- (« manufatura integralmente artesanal ») ; ses cigarillos ne sont pas
-- portes a la gamme — regle 187.
--
-- Sources : cigaraficionado.com « Kiki Berger of Cuban Crafters, 56,
-- Dies » et cigarinspector.com (Max Berger, 1996, Tabacalera Esteli,
-- Karen Berger) ; vegassantiago.com, cigars-vegasantiago.biz et
-- casagranda-cigars.de (Marc Niehaus, Puriscal, 1 100 m, Luis Santana
-- Lamas, Chaman, les bagues privees) ; cigaraficionado.com « De Los
-- Reyes — A Field and a Factory » et cigarcountry.com (1995, Augusto,
-- Leo et Nirka Reyes, 2 a 2,5 millions de cigares) ; menendezamerino.com
-- et correiobraziliense.com.br (1977, Sao Goncalo dos Campos, Alonso
-- Menendez 1980, Dona Flor 1982, roulage integralement artisanal) ;
-- cigars-connect.com « What's new at Don Tomas », neptunecigar.com et
-- en.wikipedia.org/wiki/General_Cigar_Company (1975, U.S. Tobacco,
-- HATSA, Estelo Padron, Swedish Match 2004, STG) ; cigar-coop.com
-- « STG Discontinues Lines under Bolivar, El Rico Habano, and Helix
-- Brands » (octobre 2024).
--
-- Apres cette migration :
--   php tools/contenu_dump.php
--   php tools/i18n_dump.php > sql/traductions.sql
-- ════════════════════════════════════════════════════════

INSERT INTO `brands`
  (`name`, `country_id`, `founded`, `factory`, `history`, `gamme`,
   `history_en`, `history_es`, `history_de`, `history_zh`, `history_ar`,
   `gamme_en`, `gamme_es`, `gamme_de`, `gamme_zh`, `gamme_ar`)
VALUES

-- ── Cuban Crafters ───────────────────────────────────────
('Cuban Crafters', 'nicaragua', '1996 — Henry « Don Kiki » Berger',
 'Tabacalera Estelí, Estelí, Nicaragua',

 'Max Berger avait quitté la Pologne pendant la guerre pour Cuba, où il était devenu planteur et fabricant de cigares — des fermes, une manufacture. La révolution lui a tout pris ; il est parti aux États-Unis avec son fils Henry.

Henry Berger, que le métier appelait Don Kiki, est entré dans le cigare en 1996, en plein boom. Il a monté sa fabrique au Nicaragua, le long de la route panaméricaine à Estelí, à quelques centaines de mètres de chez Padrón : la Tabacalera Estelí, avec un séchoir au toit de chaume construit à l''ancienne juste à côté.

Ce que Miami connaît de la maison, c''est autre chose : le magasin de la Petite Havane, un de ces lieux où l''on achète, où l''on boit un verre et où l''on fume sur place. L''atlas le note mais ne s''y trompe pas — la fiche est nicaraguayenne parce que les cigares se font à Estelí. Le recensement la classait aux États-Unis, à l''adresse de la boutique.

Don Kiki est mort en 2014. Karen Berger, sa femme, a repris la maison.',

 '[{"name":"Don Kiki Brown Label","color":"#5A3A22","force":"Medium-Full","wrapper":"Habano du Nicaragua","vitolas":["Robusto","Toro","Churchill"],"story":"La ligne qui porte le surnom du fondateur. C''est celle par laquelle la maison s''est fait connaître hors de Miami."},{"name":"Cuban Crafters Cabinet","color":"#3E2723","force":"Full","wrapper":"Assemblage nicaraguayen","vitolas":["Robusto","Toro","Torpedo"],"story":"Roulée à la Tabacalera Estelí, comme le reste. La maison vend en cabinet plutôt qu''en boîte plate — un usage qui vient du commerce cubain d''avant 1960."},{"name":"Don Kiki Vintage","color":"#7B4B2A","force":"Medium","wrapper":"Cape vieillie","vitolas":["Robusto","Toro"],"story":"Le versant assagi de la maison, sur des feuilles gardées plus longtemps avant le roulage."}]',

 'Max Berger had left Poland during the war for Cuba, where he became a grower and a cigar maker — farms, a factory. The revolution took it all; he left for the United States with his son Henry.

Henry Berger, whom the trade called Don Kiki, entered cigars in 1996, at the height of the boom. He set up his factory in Nicaragua, along the Pan-American highway at Estelí, a few hundred metres from Padrón: Tabacalera Estelí, with a thatch-roofed curing barn built the old way right beside it.

What Miami knows of the house is something else: the Little Havana store, one of those places where you buy, have a drink and smoke on the spot. The atlas notes it but is not misled — this entry is Nicaraguan because the cigars are made in Estelí. The census filed it under the United States, at the shop''s address.

Don Kiki died in 2014. Karen Berger, his wife, took over the house.',

 'Max Berger había dejado Polonia durante la guerra rumbo a Cuba, donde se hizo cultivador y fabricante de puros: fincas, una manufactura. La revolución se lo quitó todo; se marchó a Estados Unidos con su hijo Henry.

Henry Berger, a quien el oficio llamaba Don Kiki, entró en el puro en 1996, en pleno boom. Montó su fábrica en Nicaragua, junto a la carretera panamericana en Estelí, a unos cientos de metros de Padrón: la Tabacalera Estelí, con un secadero de techo de paja construido a la antigua justo al lado.

Lo que Miami conoce de la casa es otra cosa: la tienda de la Pequeña Habana, uno de esos lugares donde se compra, se toma algo y se fuma allí mismo. El atlas lo anota pero no se confunde: esta ficha es nicaragüense porque los puros se hacen en Estelí. El censo la clasificaba en Estados Unidos, en la dirección de la tienda.

Don Kiki murió en 2014. Karen Berger, su mujer, tomó las riendas de la casa.',

 'Max Berger hatte Polen während des Krieges Richtung Kuba verlassen, wo er Pflanzer und Zigarrenmacher wurde — Farmen, eine Manufaktur. Die Revolution nahm ihm alles; er ging mit seinem Sohn Henry in die Vereinigten Staaten.

Henry Berger, den die Branche Don Kiki nannte, stieg 1996 mitten im Boom in die Zigarre ein. Seine Fabrik baute er in Nicaragua, an der Panamericana bei Estelí, wenige hundert Meter von Padrón entfernt: die Tabacalera Estelí, mit einer strohgedeckten Trockenscheune alter Bauart direkt daneben.

Was Miami vom Haus kennt, ist etwas anderes: der Laden in Little Havana, einer jener Orte, an denen man kauft, ein Glas trinkt und an Ort und Stelle raucht. Der Atlas vermerkt ihn, lässt sich aber nicht täuschen — dieser Eintrag ist nicaraguanisch, weil die Zigarren in Estelí gemacht werden. Die Bestandsaufnahme führte ihn unter den Vereinigten Staaten, unter der Adresse des Ladens.

Don Kiki starb 2014. Karen Berger, seine Frau, übernahm das Haus.',

 'Max Berger 在战时离开波兰前往古巴，在那里成了烟农与雪茄制造者——有农场，也有一间工厂。革命夺走了一切；他带着儿子 Henry 去了美国。

行内称作 Don Kiki 的 Henry Berger，于 1996 年雪茄热潮正盛时入行。他在尼加拉瓜建起自己的工厂，就在埃斯特利的泛美公路旁，离 Padrón 只有几百米：Tabacalera Estelí，紧挨着一座按老法子搭的茅草顶晾房。

迈阿密所认识的这家公司是另一回事：小哈瓦那的那间店铺，一个可以买、可以喝一杯、可以就地抽起来的地方。本图集记下它，却不会被它误导——这一条目属于尼加拉瓜，因为雪茄是在埃斯特利做的。清点曾按店铺地址把它归入美国。

Don Kiki 于 2014 年去世。他的妻子 Karen Berger 接手了这家公司。',

 'كان ماكس بيرغر قد غادر بولندا في أثناء الحرب إلى كوبا، فصار فيها مزارعًا وصانع سيجار — مزارع ومصنع. ثم أخذت الثورة كلّ شيء، فرحل إلى الولايات المتحدة مع ابنه هنري.

دخل هنري بيرغر، الذي كانت المهنة تدعوه «دون كيكي»، عالم السيجار عام 1996 في ذروة الرواج. وأقام مصنعه في نيكاراغوا على الطريق الأمريكية العابرة قرب إستيلي، على بُعد مئات الأمتار من «بادرون»: «تاباكاليرا إستيلي»، وإلى جانبها مباشرةً حظيرة تجفيف بسقف من القشّ بُنيت على الطريقة القديمة.

أمّا ما تعرفه ميامي من الدار فشيء آخر: متجر هافانا الصغيرة، أحد تلك الأماكن التي يشتري فيها المرء ويشرب كأسًا ويدخّن في مكانه. والأطلس يسجّله ولا ينخدع به — فالبطاقة نيكاراغوية لأنّ السيجار يُصنع في إستيلي. وكان الإحصاء قد صنّفها في الولايات المتحدة على عنوان المتجر.

تُوفّي دون كيكي عام 2014، وتولّت الدار زوجته كارن بيرغر.',

 '[{"name":"Don Kiki Brown Label","color":"#5A3A22","force":"Medium-Full","wrapper":"Nicaraguan Habano","vitolas":["Robusto","Toro","Churchill"],"story":"The line carrying the founder''s nickname. It is the one that made the house known beyond Miami."},{"name":"Cuban Crafters Cabinet","color":"#3E2723","force":"Full","wrapper":"Nicaraguan blend","vitolas":["Robusto","Toro","Torpedo"],"story":"Rolled at Tabacalera Estelí, like the rest. The house sells in cabinets rather than flat boxes — a habit inherited from the Cuban trade before 1960."},{"name":"Don Kiki Vintage","color":"#7B4B2A","force":"Medium","wrapper":"Aged wrapper","vitolas":["Robusto","Toro"],"story":"The house''s quieter side, on leaves held longer before rolling."}]',

 '[{"name":"Don Kiki Brown Label","color":"#5A3A22","force":"Medium-Full","wrapper":"Habano de Nicaragua","vitolas":["Robusto","Toro","Churchill"],"story":"La línea que lleva el apodo del fundador. Es la que dio a conocer la casa fuera de Miami."},{"name":"Cuban Crafters Cabinet","color":"#3E2723","force":"Full","wrapper":"Ligada nicaragüense","vitolas":["Robusto","Toro","Torpedo"],"story":"Liada en la Tabacalera Estelí, como el resto. La casa vende en cabinet más que en caja plana: un uso heredado del comercio cubano anterior a 1960."},{"name":"Don Kiki Vintage","color":"#7B4B2A","force":"Medium","wrapper":"Capa envejecida","vitolas":["Robusto","Toro"],"story":"La vertiente sosegada de la casa, sobre hojas guardadas más tiempo antes del liado."}]',

 '[{"name":"Don Kiki Brown Label","color":"#5A3A22","force":"Medium-Full","wrapper":"Nicaraguanisches Habano","vitolas":["Robusto","Toro","Churchill"],"story":"Die Linie mit dem Spitznamen des Gründers. Sie hat das Haus über Miami hinaus bekannt gemacht."},{"name":"Cuban Crafters Cabinet","color":"#3E2723","force":"Full","wrapper":"Nicaraguanische Mischung","vitolas":["Robusto","Toro","Torpedo"],"story":"Bei der Tabacalera Estelí gerollt wie alles Übrige. Das Haus verkauft eher im Cabinet als in der flachen Kiste — eine Gewohnheit aus dem kubanischen Handel vor 1960."},{"name":"Don Kiki Vintage","color":"#7B4B2A","force":"Medium","wrapper":"Gereiftes Deckblatt","vitolas":["Robusto","Toro"],"story":"Die ruhigere Seite des Hauses, auf länger gelagerten Blättern."}]',

 '[{"name":"Don Kiki Brown Label","color":"#5A3A22","force":"Medium-Full","wrapper":"尼加拉瓜 Habano","vitolas":["Robusto","Toro","Churchill"],"story":"带着创始人绰号的一条线。正是它让这家公司为迈阿密以外的人所知。"},{"name":"Cuban Crafters Cabinet","color":"#3E2723","force":"Full","wrapper":"尼加拉瓜配方","vitolas":["Robusto","Toro","Torpedo"],"story":"与其余产品一样在 Tabacalera Estelí 卷制。这家多用捆装而非平盒——沿袭 1960 年前古巴贸易的旧习。"},{"name":"Don Kiki Vintage","color":"#7B4B2A","force":"Medium","wrapper":"陈化茄衣","vitolas":["Robusto","Toro"],"story":"这家安静的一面，用卷制前存放更久的烟叶。"}]',

 '[{"name":"Don Kiki Brown Label","color":"#5A3A22","force":"Medium-Full","wrapper":"هابانو نيكاراغويّ","vitolas":["Robusto","Toro","Churchill"],"story":"الخطّ الحامل للقب المؤسّس. وهو الذي عرّف بالدار خارج ميامي."},{"name":"Cuban Crafters Cabinet","color":"#3E2723","force":"Full","wrapper":"مزيج نيكاراغويّ","vitolas":["Robusto","Toro","Torpedo"],"story":"يُلَفّ في «تاباكاليرا إستيلي» كسائر الإنتاج. وتبيع الدار في صناديق كابينيت لا في علب مسطّحة — عادة موروثة من التجارة الكوبية قبل 1960."},{"name":"Don Kiki Vintage","color":"#7B4B2A","force":"Medium","wrapper":"غلاف معتّق","vitolas":["Robusto","Toro"],"story":"الوجه الهادئ للدار، على أوراق حُفظت مدّة أطول قبل اللفّ."}]'),

-- ── Vegas de Santiago ────────────────────────────────────
('Vegas de Santiago', 'costarica', 'Fondée par Marc Niehaus — date non établie',
 'Santiago de Puriscal, San José, Costa Rica',

 'Le Costa Rica est, dans cet atlas, le pays des maisons sans terroir : Selected Tobacco y fait rouler des feuilles venues d''ailleurs, Casdagli aussi. Vegas de Santiago est l''exception — elle cultive ce qu''elle roule.

Ses champs sont à Santiago de Puriscal, dans les montagnes volcaniques au sud-ouest de San José, à plus de mille cent mètres. On y plante du tabac depuis plus de quatre-vingts ans. L''altitude tient lieu de traitement : la maison explique qu''elle se passe de pesticides parce que les ravageurs ne montent pas si haut.

Marc Niehaus l''a fondée. Aucune source consultable n''en donne l''année, et cette fiche préfère le dire que l''inventer — la même règle que pour Kolumbus aux Canaries. Un maître cubain, Luis Santana Lamas, y a apporté la manière de traiter la feuille et de rouler ; la maison le nomme, et son prénom est resté sur une gamme.

Elle fait ses lignes — Chaman, Reserva, Don Luis, Secretos del Maestro — et elle roule aussi pour d''autres : des bagues de détaillants européens sortent de cet atelier, dont celles de Zechbauer, la maison de Munich. Chaman, que le recensement de cet atlas prenait pour une maison à part, est l''une de ses gammes.',

 '[{"name":"Chaman","color":"#4A5D3A","force":"Medium-Full","wrapper":"Tabac de Puriscal","vitolas":["Robusto","Toro","Corona"],"story":"Le nom veut dire chaman. Le recensement de cet atlas le prenait pour une maison ; c''est une gamme, et elle est faite ici même, à Puriscal."},{"name":"Reserva","color":"#6B4226","force":"Medium","wrapper":"Tabac de Puriscal","vitolas":["Robusto","Toro"],"story":"La gamme de garde, sur des feuilles vieillies au moins trois ans avant roulage, puis reposées trois mois en chambre de cèdre."},{"name":"Don Luis","color":"#8B5A2B","force":"Medium-Full","wrapper":"Tabac de Puriscal","vitolas":["Robusto","Toro","Churchill"],"story":"Nommée d''après Luis Santana Lamas, le maître cubain qui a apporté la manière de traiter la feuille et de rouler."}]',

 'Costa Rica is, in this atlas, the country of houses without terroir: Selected Tobacco has leaves from elsewhere rolled there, and so does Casdagli. Vegas de Santiago is the exception — it grows what it rolls.

Its fields are at Santiago de Puriscal, in the volcanic mountains southwest of San José, above eleven hundred metres. Tobacco has been planted there for more than eighty years. Altitude stands in for treatment: the house explains that it does without pesticides because the pests do not climb that high.

Marc Niehaus founded it. No consultable source gives the year, and this entry prefers to say so rather than invent it — the same rule applied to Kolumbus in the Canaries. A Cuban master, Luis Santana Lamas, brought the way of handling the leaf and of rolling; the house names him, and his first name has stayed on a line.

It makes its own lines — Chaman, Reserva, Don Luis, Secretos del Maestro — and it also rolls for others: bands of European retailers come out of this workshop, among them those of Zechbauer, the Munich house. Chaman, which this atlas''s census took for a separate house, is one of its lines.',

 'Costa Rica es, en este atlas, el país de las casas sin terruño: Selected Tobacco hace liar allí hojas venidas de otra parte, y Casdagli también. Vegas de Santiago es la excepción: cultiva lo que lía.

Sus campos están en Santiago de Puriscal, en las montañas volcánicas al suroeste de San José, por encima de los mil cien metros. Allí se planta tabaco desde hace más de ochenta años. La altura hace de tratamiento: la casa explica que prescinde de pesticidas porque las plagas no suben tanto.

Marc Niehaus la fundó. Ninguna fuente consultable da el año, y esta ficha prefiere decirlo antes que inventarlo: la misma regla aplicada a Kolumbus en Canarias. Un maestro cubano, Luis Santana Lamas, aportó la manera de tratar la hoja y de liar; la casa lo nombra, y su nombre de pila ha quedado en una gama.

Hace sus líneas —Chaman, Reserva, Don Luis, Secretos del Maestro— y también lía para otros: de este taller salen vitolas de minoristas europeos, entre ellas las de Zechbauer, la casa de Múnich. Chaman, que el censo de este atlas tomaba por una casa aparte, es una de sus gamas.',

 'Costa Rica ist in diesem Atlas das Land der Häuser ohne Terroir: Selected Tobacco lässt dort Blätter von anderswo rollen, Casdagli ebenso. Vegas de Santiago ist die Ausnahme — es baut an, was es rollt.

Die Felder liegen bei Santiago de Puriscal, in den vulkanischen Bergen südwestlich von San José, oberhalb von elfhundert Metern. Dort wird seit mehr als achtzig Jahren Tabak gepflanzt. Die Höhe ersetzt die Behandlung: Das Haus erklärt, es komme ohne Pestizide aus, weil die Schädlinge nicht so hoch steigen.

Marc Niehaus hat es gegründet. Keine einsehbare Quelle nennt das Jahr, und dieser Eintrag sagt das lieber, als es zu erfinden — dieselbe Regel wie bei Kolumbus auf den Kanaren. Ein kubanischer Meister, Luis Santana Lamas, brachte die Art, das Blatt zu behandeln und zu rollen; das Haus nennt ihn, und sein Vorname ist auf einer Linie geblieben.

Es macht seine eigenen Linien — Chaman, Reserva, Don Luis, Secretos del Maestro — und rollt auch für andere: Ringe europäischer Händler kommen aus dieser Werkstatt, darunter jene von Zechbauer, dem Münchner Haus. Chaman, das die Bestandsaufnahme dieses Atlas für ein eigenes Haus hielt, ist eine seiner Linien.',

 '在本图集里，哥斯达黎加是「没有风土的公司」之国：Selected Tobacco 在那里卷制来自别处的烟叶，Casdagli 亦然。Vegas de Santiago 是例外——它种自己所卷的烟。

它的田地在圣何塞西南火山山区的 Santiago de Puriscal，海拔一千一百米以上。那里种烟已有八十多年。海拔代替了药剂：这家公司说，它不用农药，因为虫害爬不了那么高。

创办者是 Marc Niehaus。没有可查证的资料给出年份，本条目宁可如实说出，也不去编造——与加那利群岛的 Kolumbus 同一条规矩。一位古巴师傅 Luis Santana Lamas 带来了处理烟叶与卷制的手法；公司写下了他的名字，他的名也留在了一条产品线上。

它做自己的产品线——Chaman、Reserva、Don Luis、Secretos del Maestro——也为别人卷制：欧洲零售商的茄标出自这间作坊，其中包括慕尼黑的 Zechbauer。本图集的清点曾把 Chaman 当作独立的公司，其实它是这里的一条产品线。',

 'كوستاريكا في هذا الأطلس بلد الدور بلا أرضٍ خاصّة: «سيليكتد توباكو» تُلَفّ فيها أوراق آتية من غيرها، وكذلك «كسداغلي». أمّا «فيغاس دي سانتياغو» فهي الاستثناء — تزرع ما تلفّه.

حقولها في سانتياغو دي بوريسكال، في الجبال البركانية جنوب غربيّ سان خوسيه، على ارتفاع يجاوز ألفًا ومئة متر. ويُزرع التبغ هناك منذ أكثر من ثمانين سنة. والارتفاع يقوم مقام المعالجة: تقول الدار إنّها تستغني عن المبيدات لأنّ الآفات لا تصعد إلى هذا العلوّ.

أسّسها مارك نيهاوس. ولا يذكر أيّ مصدر متاح سنة التأسيس، وتؤثر هذه البطاقة قول ذلك على اختلاقه — القاعدة نفسها المتّبعة مع «كولومبوس» في الكناري. وقد جلب معلّم كوبيّ، لويس سانتانا لاماس، طريقة معالجة الورقة واللفّ؛ والدار تسمّيه، وبقي اسمه الأوّل على إحدى السلاسل.

تصنع سلاسلها — «تشامان» و«ريسيرفا» و«دون لويس» و«سيكريتوس دل مايسترو» — وتلفّ كذلك لغيرها: تخرج من هذه الورشة حلقات لبائعي تجزئة أوروبيّين، منها حلقات «تسيشباور» دار ميونخ. و«تشامان»، التي عدّها إحصاء هذا الأطلس دارًا مستقلّة، إنّما هي إحدى سلاسلها.',

 '[{"name":"Chaman","color":"#4A5D3A","force":"Medium-Full","wrapper":"Puriscal tobacco","vitolas":["Robusto","Toro","Corona"],"story":"The name means shaman. This atlas''s census took it for a house; it is a line, and it is made right here, at Puriscal."},{"name":"Reserva","color":"#6B4226","force":"Medium","wrapper":"Puriscal tobacco","vitolas":["Robusto","Toro"],"story":"The keeping line, on leaves aged at least three years before rolling, then rested three months in a cedar room."},{"name":"Don Luis","color":"#8B5A2B","force":"Medium-Full","wrapper":"Puriscal tobacco","vitolas":["Robusto","Toro","Churchill"],"story":"Named after Luis Santana Lamas, the Cuban master who brought the way of handling the leaf and of rolling."}]',

 '[{"name":"Chaman","color":"#4A5D3A","force":"Medium-Full","wrapper":"Tabaco de Puriscal","vitolas":["Robusto","Toro","Corona"],"story":"El nombre significa chamán. El censo de este atlas lo tomaba por una casa; es una gama, y se hace aquí mismo, en Puriscal."},{"name":"Reserva","color":"#6B4226","force":"Medium","wrapper":"Tabaco de Puriscal","vitolas":["Robusto","Toro"],"story":"La gama de guarda, sobre hojas envejecidas al menos tres años antes del liado y luego reposadas tres meses en cámara de cedro."},{"name":"Don Luis","color":"#8B5A2B","force":"Medium-Full","wrapper":"Tabaco de Puriscal","vitolas":["Robusto","Toro","Churchill"],"story":"Llamada así por Luis Santana Lamas, el maestro cubano que aportó la manera de tratar la hoja y de liar."}]',

 '[{"name":"Chaman","color":"#4A5D3A","force":"Medium-Full","wrapper":"Puriscal-Tabak","vitolas":["Robusto","Toro","Corona"],"story":"Der Name heisst Schamane. Die Bestandsaufnahme dieses Atlas hielt ihn für ein Haus; es ist eine Linie, und sie entsteht genau hier, in Puriscal."},{"name":"Reserva","color":"#6B4226","force":"Medium","wrapper":"Puriscal-Tabak","vitolas":["Robusto","Toro"],"story":"Die Lagerlinie, auf Blättern, die vor dem Rollen mindestens drei Jahre reifen und danach drei Monate im Zedernraum ruhen."},{"name":"Don Luis","color":"#8B5A2B","force":"Medium-Full","wrapper":"Puriscal-Tabak","vitolas":["Robusto","Toro","Churchill"],"story":"Benannt nach Luis Santana Lamas, dem kubanischen Meister, der die Art brachte, das Blatt zu behandeln und zu rollen."}]',

 '[{"name":"Chaman","color":"#4A5D3A","force":"Medium-Full","wrapper":"Puriscal 烟叶","vitolas":["Robusto","Toro","Corona"],"story":"这名字意为萨满。本图集的清点曾把它当作一家公司；它是一条产品线，就在 Puriscal 本地制作。"},{"name":"Reserva","color":"#6B4226","force":"Medium","wrapper":"Puriscal 烟叶","vitolas":["Robusto","Toro"],"story":"存放型的一条线，烟叶在卷制前至少陈化三年，之后再在雪松房里静置三个月。"},{"name":"Don Luis","color":"#8B5A2B","force":"Medium-Full","wrapper":"Puriscal 烟叶","vitolas":["Robusto","Toro","Churchill"],"story":"取名自古巴师傅 Luis Santana Lamas，是他带来了处理烟叶与卷制的手法。"}]',

 '[{"name":"Chaman","color":"#4A5D3A","force":"Medium-Full","wrapper":"تبغ بوريسكال","vitolas":["Robusto","Toro","Corona"],"story":"الاسم يعني الشامان. عدّه إحصاء هذا الأطلس دارًا؛ وإنّما هو سلسلة، وتُصنع هنا نفسها في بوريسكال."},{"name":"Reserva","color":"#6B4226","force":"Medium","wrapper":"تبغ بوريسكال","vitolas":["Robusto","Toro"],"story":"سلسلة الحفظ، على أوراق تُعتّق ثلاث سنوات على الأقلّ قبل اللفّ، ثم تستريح ثلاثة أشهر في غرفة أرز."},{"name":"Don Luis","color":"#8B5A2B","force":"Medium-Full","wrapper":"تبغ بوريسكال","vitolas":["Robusto","Toro","Churchill"],"story":"سُمّيت على اسم لويس سانتانا لاماس، المعلّم الكوبيّ الذي جلب طريقة معالجة الورقة واللفّ."}]'),

-- ── De Los Reyes Cigars ──────────────────────────────────
('De Los Reyes Cigars', 'dominican', '1995 — Augusto Reyes, Santiago',
 'De Los Reyes, Santiago de los Caballeros, Rép. dominicaine',

 'La famille Reyes est dans le tabac dominicain depuis le XIXᵉ siècle. La fabrique, elle, est récente : Augusto Reyes l''a ouverte en 1995, à Santiago de los Caballeros.

Le partage des rôles y est net, et c''est ce qui rend la maison intéressante. Leo Reyes, frère d''Augusto, cultive. Nirka Reyes, sa nièce, dirige la fabrique. Une grande partie de la feuille qui entre à l''atelier vient des champs de Leo — pas seulement de la ferme de Navarrete, mais de plusieurs plantations qu''il exploite dans le pays. Peu de maisons dominicaines tiennent ainsi les deux bouts.

L''atelier sort entre deux et deux millions et demi de cigares par an. Il fait ses propres marques — Saga, Augusto Reyes, Rey de Reyes, Urban, Arsen — et il roule pour d''autres : Debonaire, Fittipaldi et Patoro sont fabriqués là.

Arsen, que le recensement de cet atlas listait comme une maison absente, est l''une de ces marques. Elle n''a pas d''existence séparée de cette fabrique — même cas que Zino chez Oettinger Davidoff et qu''Oliveros chez Boutique Blends.',

 '[{"name":"Saga","color":"#6B4226","force":"Medium","wrapper":"Assemblages dominicains","vitolas":["Robusto","Toro","Corona","Lancero"],"story":"La marque que la maison exporte le plus. Elle décline plusieurs séries — Golden Age, Blend, Short Tales — sur les tabacs des champs de Leo Reyes."},{"name":"Augusto Reyes","color":"#8B5A2B","force":"Medium-Full","wrapper":"Assemblages dominicains","vitolas":["Robusto","Toro","Churchill"],"story":"Le nom du fondateur, sur la gamme qui reste la plus attachée aux tabacs de la maison."},{"name":"Arsen","color":"#4A3728","force":"Medium","wrapper":"Assemblage dominicain","vitolas":["Robusto","Toro"],"story":"Le recensement de cet atlas la prenait pour une maison à part. C''est une marque de cette fabrique, et elle n''existe pas sans elle."}]',

 'The Reyes family has been in Dominican tobacco since the nineteenth century. The factory, though, is recent: Augusto Reyes opened it in 1995, at Santiago de los Caballeros.

The division of roles there is clear, and it is what makes the house interesting. Leo Reyes, Augusto''s brother, grows. Nirka Reyes, his niece, runs the factory. Much of the leaf that enters the workshop comes from Leo''s fields — not only from the Navarrete farm, but from several plantations he works across the country. Few Dominican houses hold both ends this way.

The workshop turns out between two and two and a half million cigars a year. It makes its own brands — Saga, Augusto Reyes, Rey de Reyes, Urban, Arsen — and it rolls for others: Debonaire, Fittipaldi and Patoro are made there.

Arsen, which this atlas''s census listed as a missing house, is one of those brands. It has no existence apart from this factory — the same case as Zino at Oettinger Davidoff and Oliveros at Boutique Blends.',

 'La familia Reyes está en el tabaco dominicano desde el siglo XIX. La fábrica, en cambio, es reciente: Augusto Reyes la abrió en 1995, en Santiago de los Caballeros.

El reparto de papeles es allí nítido, y es lo que hace interesante a la casa. Leo Reyes, hermano de Augusto, cultiva. Nirka Reyes, su sobrina, dirige la fábrica. Gran parte de la hoja que entra en el taller viene de los campos de Leo: no solo de la finca de Navarrete, sino de varias plantaciones que explota en el país. Pocas casas dominicanas sostienen así los dos extremos.

El taller saca entre dos y dos millones y medio de puros al año. Hace sus propias marcas —Saga, Augusto Reyes, Rey de Reyes, Urban, Arsen— y lía para otros: Debonaire, Fittipaldi y Patoro se fabrican allí.

Arsen, que el censo de este atlas listaba como casa ausente, es una de esas marcas. No existe separada de esta fábrica: el mismo caso que Zino en Oettinger Davidoff y Oliveros en Boutique Blends.',

 'Die Familie Reyes ist seit dem 19. Jahrhundert im dominikanischen Tabak. Die Fabrik dagegen ist jung: Augusto Reyes eröffnete sie 1995 in Santiago de los Caballeros.

Die Rollenverteilung ist dort klar, und sie macht das Haus interessant. Leo Reyes, Augustos Bruder, baut an. Nirka Reyes, seine Nichte, leitet die Fabrik. Ein grosser Teil des Blattes, das in die Werkstatt kommt, stammt von Leos Feldern — nicht nur von der Farm in Navarrete, sondern von mehreren Pflanzungen, die er im Land bewirtschaftet. Wenige dominikanische Häuser halten beide Enden auf diese Weise.

Die Werkstatt bringt zwei bis zweieinhalb Millionen Zigarren im Jahr hervor. Sie macht eigene Marken — Saga, Augusto Reyes, Rey de Reyes, Urban, Arsen — und rollt für andere: Debonaire, Fittipaldi und Patoro entstehen dort.

Arsen, das die Bestandsaufnahme dieses Atlas als fehlendes Haus führte, ist eine dieser Marken. Ohne diese Fabrik gibt es sie nicht — derselbe Fall wie Zino bei Oettinger Davidoff und Oliveros bei Boutique Blends.',

 'Reyes 家族自十九世纪起就在多米尼加的烟草行当里。工厂却很年轻：Augusto Reyes 于 1995 年在圣地亚哥－德洛斯卡瓦耶罗斯开办了它。

这里的分工很清楚，也正是这家公司有意思的地方。Augusto 的弟弟 Leo Reyes 种烟；他的侄女 Nirka Reyes 掌管工厂。进入作坊的烟叶大部分来自 Leo 的田——不只是 Navarrete 那片农场，还有他在全国经营的若干种植园。多米尼加少有公司能这样把两头都握在手里。

作坊年产两百万至两百五十万支雪茄。它做自己的品牌——Saga、Augusto Reyes、Rey de Reyes、Urban、Arsen——也为别人卷制：Debonaire、Fittipaldi 与 Patoro 都在这里制作。

本图集的清点曾把 Arsen 列为缺席的公司，其实它是这家工厂的品牌之一，离开这家工厂便不存在——与 Oettinger Davidoff 的 Zino、Boutique Blends 的 Oliveros 同一情形。',

 'عائلة رييس في التبغ الدومينيكيّ منذ القرن التاسع عشر. أمّا المصنع فحديث: افتتحه أوغوستو رييس عام 1995 في سانتياغو دي لوس كاباييروس.

وتوزيع الأدوار فيه واضح، وهو ما يجعل الدار جديرة بالانتباه. ليو رييس، شقيق أوغوستو، يزرع. ونيركا رييس، ابنة أخيه، تدير المصنع. ومعظم الورق الداخل إلى الورشة يأتي من حقول ليو — لا من مزرعة نافاريتي وحدها، بل من مزارع عدّة يستثمرها في البلاد. وقلّة من الدور الدومينيكية تمسك الطرفين على هذا النحو.

تُخرج الورشة بين مليونين ومليونين ونصف من السيجار سنويًّا. تصنع علاماتها الخاصّة — «ساغا» و«أوغوستو رييس» و«ري دي رييس» و«أوربان» و«أرسن» — وتلفّ لغيرها: «ديبونير» و«فيتيبالدي» و«باتورو» تُصنع هناك.

و«أرسن»، التي أدرجها إحصاء هذا الأطلس دارًا غائبة، إنّما هي إحدى تلك العلامات. لا وجود لها منفصلةً عن هذا المصنع — الحال نفسها مع «زينو» عند أوتينغر دافيدوف و«أوليفيروس» عند «بوتيك بلندز».',

 '[{"name":"Saga","color":"#6B4226","force":"Medium","wrapper":"Dominican blends","vitolas":["Robusto","Toro","Corona","Lancero"],"story":"The house''s most exported brand. It runs to several series — Golden Age, Blend, Short Tales — on tobaccos from Leo Reyes''s fields."},{"name":"Augusto Reyes","color":"#8B5A2B","force":"Medium-Full","wrapper":"Dominican blends","vitolas":["Robusto","Toro","Churchill"],"story":"The founder''s name, on the line that stays closest to the house''s own tobaccos."},{"name":"Arsen","color":"#4A3728","force":"Medium","wrapper":"Dominican blend","vitolas":["Robusto","Toro"],"story":"This atlas''s census took it for a separate house. It is a brand of this factory, and does not exist without it."}]',

 '[{"name":"Saga","color":"#6B4226","force":"Medium","wrapper":"Ligadas dominicanas","vitolas":["Robusto","Toro","Corona","Lancero"],"story":"La marca que más exporta la casa. Se declina en varias series —Golden Age, Blend, Short Tales— sobre los tabacos de los campos de Leo Reyes."},{"name":"Augusto Reyes","color":"#8B5A2B","force":"Medium-Full","wrapper":"Ligadas dominicanas","vitolas":["Robusto","Toro","Churchill"],"story":"El nombre del fundador, sobre la gama que sigue más apegada a los tabacos de la casa."},{"name":"Arsen","color":"#4A3728","force":"Medium","wrapper":"Ligada dominicana","vitolas":["Robusto","Toro"],"story":"El censo de este atlas la tomaba por una casa aparte. Es una marca de esta fábrica, y no existe sin ella."}]',

 '[{"name":"Saga","color":"#6B4226","force":"Medium","wrapper":"Dominikanische Mischungen","vitolas":["Robusto","Toro","Corona","Lancero"],"story":"Die meistexportierte Marke des Hauses. Sie gliedert sich in mehrere Serien — Golden Age, Blend, Short Tales — auf Tabaken von Leo Reyes'' Feldern."},{"name":"Augusto Reyes","color":"#8B5A2B","force":"Medium-Full","wrapper":"Dominikanische Mischungen","vitolas":["Robusto","Toro","Churchill"],"story":"Der Name des Gründers, auf der Linie, die den hauseigenen Tabaken am nächsten bleibt."},{"name":"Arsen","color":"#4A3728","force":"Medium","wrapper":"Dominikanische Mischung","vitolas":["Robusto","Toro"],"story":"Die Bestandsaufnahme dieses Atlas hielt sie für ein eigenes Haus. Sie ist eine Marke dieser Fabrik und besteht ohne sie nicht."}]',

 '[{"name":"Saga","color":"#6B4226","force":"Medium","wrapper":"多米尼加配方","vitolas":["Robusto","Toro","Corona","Lancero"],"story":"这家出口最多的品牌，分作 Golden Age、Blend、Short Tales 等数个系列，用的是 Leo Reyes 田里的烟叶。"},{"name":"Augusto Reyes","color":"#8B5A2B","force":"Medium-Full","wrapper":"多米尼加配方","vitolas":["Robusto","Toro","Churchill"],"story":"创始人的名字，用在与自家烟叶联系最紧的那条线上。"},{"name":"Arsen","color":"#4A3728","force":"Medium","wrapper":"多米尼加配方","vitolas":["Robusto","Toro"],"story":"本图集的清点曾把它当作独立的公司。它是这家工厂的品牌，离开工厂便不存在。"}]',

 '[{"name":"Saga","color":"#6B4226","force":"Medium","wrapper":"مزائج دومينيكية","vitolas":["Robusto","Toro","Corona","Lancero"],"story":"أكثر علامات الدار تصديرًا. تتفرّع إلى سلاسل عدّة — «غولدن إيدج» و«بلند» و«شورت تيلز» — على أتبغة حقول ليو رييس."},{"name":"Augusto Reyes","color":"#8B5A2B","force":"Medium-Full","wrapper":"مزائج دومينيكية","vitolas":["Robusto","Toro","Churchill"],"story":"اسم المؤسّس، على السلسلة الأوثق صلةً بأتبغة الدار نفسها."},{"name":"Arsen","color":"#4A3728","force":"Medium","wrapper":"مزيج دومينيكيّ","vitolas":["Robusto","Toro"],"story":"عدّها إحصاء هذا الأطلس دارًا مستقلّة. وإنّما هي علامة لهذا المصنع، ولا وجود لها من دونه."}]'),

-- ── Menendez Amerino ─────────────────────────────────────
('Menendez Amerino', 'brazil', '1977 — São Gonçalo dos Campos, Bahia',
 'Menendez Amerino, São Gonçalo dos Campos, Bahia, Brésil',

 'C''est une maison née d''un exil et d''une association. La famille Menéndez faisait à Cuba le Montecristo et le H. Upmann ; après 1960, elle s''est dispersée. L''un des siens achetait déjà de la feuille du Recôncavo bahianais à un planteur, Mário Amerino da Silva Portugal. À la fin des années 1970, les deux hommes ont monté une fabrique ensemble.

Elle est à São Gonçalo dos Campos, en Bahia — et non à Cruz das Almas, où pousse la mata fina qu''elle emploie. La distinction n''est pas une chicane : cet atlas portait l''erreur sur la fiche de Dona Flor, et la corrige avec celle-ci. Un lieu de culture n''est pas un lieu de fabrication.

Tout s''y fait à la main. La maison dit son procédé « intégralement artisanal » : chaque feuille choisie, traitée et roulée par des artisanes.

De cet atelier sortent l''Alonso Menendez, créé en 1980, la Dona Flor lancée en 1982 — qui a sa propre fiche dans cet atlas — et l''Alonso Del Patron, paru en 2018. C''est le même partage qu''entre la Tabacalera Palma et l''Aging Room en République dominicaine : la fabrique et sa marque figurent toutes deux ici, parce que ce ne sont pas la même chose.',

 '[{"name":"Alonso Menendez","color":"#4A3728","force":"Medium-Full","wrapper":"Mata fina de Bahia","vitolas":["Robusto","Toro","Corona"],"story":"Créé en 1980, avant même la Dona Flor. Il porte le prénom de la famille cubaine qui a apporté la méthode."},{"name":"Alonso Del Patron","color":"#6B4226","force":"Medium","wrapper":"Mata fina de Bahia","vitolas":["Robusto","Toro"],"story":"Paru en 2018, quarante ans après la fondation de la fabrique. Une maison qui sort une gamme neuve à cet âge-là est rare au Brésil."},{"name":"Dona Flor","color":"#8B5A2B","force":"Medium","wrapper":"Mata fina de Bahia","vitolas":["Robusto","Toro","Corona","Lonsdale"],"story":"Lancée en 1982 et devenue la marque de la maison. Elle a sa propre fiche dans cet atlas : roulage cubain, feuille brésilienne."}]',

 'This is a house born of an exile and a partnership. The Menéndez family made Montecristo and H. Upmann in Cuba; after 1960 they scattered. One of them was already buying leaf from the Bahian Recôncavo from a grower, Mário Amerino da Silva Portugal. At the end of the 1970s the two men set up a factory together.

It stands at São Gonçalo dos Campos, in Bahia — not at Cruz das Almas, where the mata fina it uses is grown. The distinction is not a quibble: this atlas carried the error on the Dona Flor entry, and corrects it with this one. A place of cultivation is not a place of manufacture.

Everything there is done by hand. The house calls its process "entirely artisanal": each leaf chosen, treated and rolled by skilled women.

Out of this workshop come Alonso Menendez, created in 1980, Dona Flor launched in 1982 — which has its own entry in this atlas — and Alonso Del Patron, out in 2018. It is the same division as between Tabacalera Palma and Aging Room in the Dominican Republic: the factory and its brand both appear here, because they are not the same thing.',

 'Es una casa nacida de un exilio y de una asociación. La familia Menéndez hacía en Cuba el Montecristo y el H. Upmann; tras 1960 se dispersó. Uno de los suyos compraba ya hoja del Recôncavo bahiano a un plantador, Mário Amerino da Silva Portugal. A finales de los setenta, los dos hombres montaron juntos una fábrica.

Está en São Gonçalo dos Campos, en Bahía, y no en Cruz das Almas, donde crece la mata fina que emplea. La distinción no es una argucia: este atlas llevaba el error en la ficha de Dona Flor, y lo corrige con esta. Un lugar de cultivo no es un lugar de fabricación.

Todo se hace allí a mano. La casa llama a su proceso «integralmente artesanal»: cada hoja escogida, tratada y liada por artesanas.

De este taller salen el Alonso Menendez, creado en 1980, la Dona Flor lanzada en 1982 —que tiene su propia ficha en este atlas— y el Alonso Del Patron, aparecido en 2018. Es el mismo reparto que entre la Tabacalera Palma y el Aging Room en la República Dominicana: la fábrica y su marca figuran ambas aquí, porque no son la misma cosa.',

 'Dies ist ein Haus, das aus einem Exil und einer Verbindung entstand. Die Familie Menéndez machte auf Kuba Montecristo und H. Upmann; nach 1960 zerstreute sie sich. Einer von ihnen kaufte bereits Blatt aus dem bahianischen Recôncavo von einem Pflanzer, Mário Amerino da Silva Portugal. Ende der 1970er Jahre bauten die beiden Männer gemeinsam eine Fabrik.

Sie steht in São Gonçalo dos Campos in Bahia — nicht in Cruz das Almas, wo der verwendete Mata Fina wächst. Die Unterscheidung ist keine Spitzfindigkeit: Dieser Atlas trug den Fehler im Eintrag zu Dona Flor und berichtigt ihn mit diesem. Ein Anbauort ist kein Fertigungsort.

Alles geschieht dort von Hand. Das Haus nennt sein Verfahren "vollständig handwerklich": jedes Blatt ausgewählt, behandelt und von Handwerkerinnen gerollt.

Aus dieser Werkstatt kommen Alonso Menendez, 1980 geschaffen, Dona Flor, 1982 eingeführt — mit eigenem Eintrag in diesem Atlas — und Alonso Del Patron von 2018. Es ist dieselbe Aufteilung wie zwischen Tabacalera Palma und Aging Room in der Dominikanischen Republik: Fabrik und Marke stehen beide hier, weil sie nicht dasselbe sind.',

 '这是一家生于流亡与合伙的公司。Menéndez 家族在古巴做过 Montecristo 与 H. Upmann；1960 年之后四散。其中一人早已向巴伊亚 Recôncavo 的一位烟农 Mário Amerino da Silva Portugal 收购烟叶。七十年代末，两人合力办起一座工厂。

工厂在巴伊亚的 São Gonçalo dos Campos——而不在种植它所用 mata fina 的 Cruz das Almas。这个区分不是吹毛求疵：本图集在 Dona Flor 条目上就犯了这个错，如今借这一条目更正。种植之地不等于制造之地。

那里的一切都靠手工。公司称自己的工序「全然手作」：每一片叶子都由女工挑选、处理、手卷。

从这间作坊出来的有 1980 年创制的 Alonso Menendez、1982 年推出的 Dona Flor（本图集另有其条目），以及 2018 年问世的 Alonso Del Patron。这与多米尼加共和国的 Tabacalera Palma 和 Aging Room 是同一种分工：工厂与它的品牌都收录于此，因为二者并非一回事。',

 'دارٌ وُلدت من منفًى ومن شراكة. كانت عائلة مننديز تصنع في كوبا «مونتيكريستو» و«إتش. أوبمان»؛ ثم تفرّقت بعد 1960. وكان أحد أفرادها يشتري ورق ريكونكافو باهيا من مزارع، هو ماريو أميرينو دا سيلفا بورتوغال. وفي أواخر السبعينيات أقام الرجلان مصنعًا معًا.

يقع المصنع في ساو غونسالو دوس كامبوس بولاية باهيا — لا في كروز داس ألماس حيث تنمو «ماتا فينا» التي يستعملها. وليس التمييز مماحكة: فقد حمل هذا الأطلس الخطأ في بطاقة «دونا فلور»، وهو يصحّحه بهذه البطاقة. فمكان الزراعة ليس مكان الصناعة.

وكلّ شيء هناك يُصنع باليد. تصف الدار طريقتها بأنّها «حرفية بالكامل»: كلّ ورقة تُنتقى وتُعالَج وتُلَفّ بأيدي حِرَفيّات.

ومن هذه الورشة يخرج «ألونسو مننديز» المُنشأ عام 1980، و«دونا فلور» التي أُطلقت عام 1982 — ولها بطاقتها في هذا الأطلس — و«ألونسو دِل باترون» الصادر عام 2018. وهو التقسيم نفسه القائم بين «تاباكاليرا بالما» و«إيجنغ روم» في الجمهورية الدومينيكية: المصنع وعلامته كلاهما هنا، لأنّهما ليسا شيئًا واحدًا.',

 '[{"name":"Alonso Menendez","color":"#4A3728","force":"Medium-Full","wrapper":"Bahian mata fina","vitolas":["Robusto","Toro","Corona"],"story":"Created in 1980, before Dona Flor itself. It carries the first name of the Cuban family that brought the method."},{"name":"Alonso Del Patron","color":"#6B4226","force":"Medium","wrapper":"Bahian mata fina","vitolas":["Robusto","Toro"],"story":"Out in 2018, forty years after the factory was founded. A house bringing out a new line at that age is rare in Brazil."},{"name":"Dona Flor","color":"#8B5A2B","force":"Medium","wrapper":"Bahian mata fina","vitolas":["Robusto","Toro","Corona","Lonsdale"],"story":"Launched in 1982 and become the house''s brand. It has its own entry in this atlas: Cuban rolling, Brazilian leaf."}]',

 '[{"name":"Alonso Menendez","color":"#4A3728","force":"Medium-Full","wrapper":"Mata fina de Bahía","vitolas":["Robusto","Toro","Corona"],"story":"Creado en 1980, antes incluso que la Dona Flor. Lleva el nombre de pila de la familia cubana que aportó el método."},{"name":"Alonso Del Patron","color":"#6B4226","force":"Medium","wrapper":"Mata fina de Bahía","vitolas":["Robusto","Toro"],"story":"Aparecido en 2018, cuarenta años después de fundarse la fábrica. Una casa que saca una gama nueva a esa edad es rara en Brasil."},{"name":"Dona Flor","color":"#8B5A2B","force":"Medium","wrapper":"Mata fina de Bahía","vitolas":["Robusto","Toro","Corona","Lonsdale"],"story":"Lanzada en 1982 y convertida en la marca de la casa. Tiene su propia ficha en este atlas: liado cubano, hoja brasileña."}]',

 '[{"name":"Alonso Menendez","color":"#4A3728","force":"Medium-Full","wrapper":"Mata Fina aus Bahia","vitolas":["Robusto","Toro","Corona"],"story":"1980 geschaffen, noch vor der Dona Flor. Sie trägt den Vornamen der kubanischen Familie, die die Methode mitbrachte."},{"name":"Alonso Del Patron","color":"#6B4226","force":"Medium","wrapper":"Mata Fina aus Bahia","vitolas":["Robusto","Toro"],"story":"2018 erschienen, vierzig Jahre nach Gründung der Fabrik. Ein Haus, das in diesem Alter eine neue Linie herausbringt, ist in Brasilien selten."},{"name":"Dona Flor","color":"#8B5A2B","force":"Medium","wrapper":"Mata Fina aus Bahia","vitolas":["Robusto","Toro","Corona","Lonsdale"],"story":"1982 eingeführt und zur Marke des Hauses geworden. Sie hat ihren eigenen Eintrag in diesem Atlas: kubanisches Rollen, brasilianisches Blatt."}]',

 '[{"name":"Alonso Menendez","color":"#4A3728","force":"Medium-Full","wrapper":"巴伊亚 mata fina","vitolas":["Robusto","Toro","Corona"],"story":"1980 年创制，比 Dona Flor 还早。它取自那个带来手法的古巴家族之名。"},{"name":"Alonso Del Patron","color":"#6B4226","force":"Medium","wrapper":"巴伊亚 mata fina","vitolas":["Robusto","Toro"],"story":"2018 年问世，距工厂创办已四十年。在巴西，这个年纪还推出新线的公司不多。"},{"name":"Dona Flor","color":"#8B5A2B","force":"Medium","wrapper":"巴伊亚 mata fina","vitolas":["Robusto","Toro","Corona","Lonsdale"],"story":"1982 年推出，已成为这家的招牌品牌。本图集另有其条目：古巴的卷法，巴西的叶子。"}]',

 '[{"name":"Alonso Menendez","color":"#4A3728","force":"Medium-Full","wrapper":"ماتا فينا من باهيا","vitolas":["Robusto","Toro","Corona"],"story":"أُنشئ عام 1980، قبل «دونا فلور» نفسها. ويحمل الاسم الأوّل للعائلة الكوبية التي جلبت الطريقة."},{"name":"Alonso Del Patron","color":"#6B4226","force":"Medium","wrapper":"ماتا فينا من باهيا","vitolas":["Robusto","Toro"],"story":"صدر عام 2018، بعد أربعين سنة من تأسيس المصنع. وقلّما تُخرج دارٌ في هذا العمر سلسلة جديدة في البرازيل."},{"name":"Dona Flor","color":"#8B5A2B","force":"Medium","wrapper":"ماتا فينا من باهيا","vitolas":["Robusto","Toro","Corona","Lonsdale"],"story":"أُطلقت عام 1982 وصارت علامة الدار. ولها بطاقتها في هذا الأطلس: لفٌّ كوبيّ وورقة برازيلية."}]'),

-- ── Don Tomas ────────────────────────────────────────────
('Don Tomas', 'honduras', '1975 — Danlí, créée par U.S. Tobacco',
 'HATSA — Honduras American Tobacco, Danlí',

 'Don Tomas est né en 1975 à Danlí, et il ne doit rien à un Hondurien : c''est une compagnie américaine, U.S. Tobacco, qui l''a créé. Un de ses dirigeants a hispanisé le prénom de son père pour baptiser la marque.

Les cigares sont sortis de HATSA — Honduras American Tobacco —, sous la direction d''Estélo Padrón, maître d''atelier que cet atlas nomme déjà sur la fiche du Bolívar hondurien. L''assemblage d''origine mariait la feuille hondurienne de Talanga et la nicaraguayenne de Jalapa.

Le boom des années 1990 l''a défiguré. La demande a dépassé ce que la récolte pouvait suivre, et l''assemblage a été refait avec des tabacs colombiens, dominicains et brésiliens sous cape équatorienne. Peu de marques racontent cet épisode ; il explique pourtant ce qu''une génération entière de fumeurs a trouvé dans la boîte.

La marque a changé quatre fois de mains sans jamais quitter Danlí : U.S. Tobacco, puis General Cigar, puis Swedish Match en 2004, puis le groupe danois Scandinavian Tobacco, qui possède General Cigar depuis 2005. C''est la chaîne exacte que l''atlas suit déjà pour les Punch, Hoyo de Monterrey et El Rey del Mundo honduriens.',

 '[{"name":"Don Tomas Clasico","color":"#8B5A2B","force":"Medium","wrapper":"Connecticut d''Équateur","vitolas":["Robusto","Toro","Churchill","Presidente"],"story":"La gamme la plus répandue, celle de l''assemblage refait dans les années 1990 : tripe colombienne, dominicaine et brésilienne sous cape équatorienne."},{"name":"Don Tomas Sun Grown","color":"#6B4226","force":"Medium-Full","wrapper":"Cape de plein soleil","vitolas":["Robusto","Toro","Corona"],"story":"Le versant corsé, plus proche de ce que la marque était à ses débuts, quand elle mariait Talanga et Jalapa."},{"name":"Don Tomas Maduro","color":"#3E2723","force":"Medium-Full","wrapper":"Maduro","vitolas":["Robusto","Toro"],"story":"Roulée à HATSA comme le reste, sous une cape fermentée longuement. La fabrique de Danlí n''a jamais cessé de faire cette marque depuis 1975."}]',

 'Don Tomas was born in 1975 at Danlí, and it owes nothing to a Honduran: an American company, U.S. Tobacco, created it. One of its directors turned his father''s first name into Spanish to christen the brand.

The cigars came out of HATSA — Honduras American Tobacco — under Estélo Padrón, the factory master this atlas already names on the Honduran Bolívar entry. The original blend married Honduran leaf from Talanga with Nicaraguan from Jalapa.

The boom of the 1990s disfigured it. Demand outran what the harvest could follow, and the blend was remade with Colombian, Dominican and Brazilian tobaccos under an Ecuadorian wrapper. Few brands tell this episode; it explains all the same what a whole generation of smokers found in the box.

The brand changed hands four times without ever leaving Danlí: U.S. Tobacco, then General Cigar, then Swedish Match in 2004, then the Danish group Scandinavian Tobacco, which has owned General Cigar since 2005. It is the exact chain the atlas already follows for the Honduran Punch, Hoyo de Monterrey and El Rey del Mundo.',

 'Don Tomas nació en 1975 en Danlí, y no debe nada a un hondureño: lo creó una compañía estadounidense, U.S. Tobacco. Uno de sus directivos hispanizó el nombre de su padre para bautizar la marca.

Los puros salieron de HATSA —Honduras American Tobacco—, bajo la dirección de Estélo Padrón, maestro de taller a quien este atlas ya nombra en la ficha del Bolívar hondureño. La ligada de origen casaba la hoja hondureña de Talanga con la nicaragüense de Jalapa.

El boom de los años noventa la desfiguró. La demanda superó lo que la cosecha podía seguir, y la ligada se rehízo con tabacos colombianos, dominicanos y brasileños bajo capa ecuatoriana. Pocas marcas cuentan este episodio; explica, sin embargo, lo que toda una generación de fumadores encontró en la caja.

La marca cambió cuatro veces de manos sin salir nunca de Danlí: U.S. Tobacco, luego General Cigar, luego Swedish Match en 2004, luego el grupo danés Scandinavian Tobacco, propietario de General Cigar desde 2005. Es la cadena exacta que el atlas sigue ya para los Punch, Hoyo de Monterrey y El Rey del Mundo hondureños.',

 'Don Tomas entstand 1975 in Danlí und verdankt sich keinem Honduraner: Ein amerikanisches Unternehmen, U.S. Tobacco, schuf ihn. Einer seiner Direktoren hispanisierte den Vornamen seines Vaters, um die Marke zu taufen.

Die Zigarren kamen aus der HATSA — Honduras American Tobacco — unter Estélo Padrón, dem Werkstattmeister, den dieser Atlas bereits im Eintrag zum honduranischen Bolívar nennt. Die ursprüngliche Mischung vermählte honduranisches Blatt aus Talanga mit nicaraguanischem aus Jalapa.

Der Boom der 1990er Jahre entstellte sie. Die Nachfrage überholte, was die Ernte hergab, und die Mischung wurde mit kolumbianischen, dominikanischen und brasilianischen Tabaken unter ecuadorianischem Deckblatt neu gebaut. Wenige Marken erzählen diese Episode; sie erklärt gleichwohl, was eine ganze Raucher-Generation in der Kiste vorfand.

Die Marke wechselte viermal den Besitzer, ohne Danlí je zu verlassen: U.S. Tobacco, dann General Cigar, dann Swedish Match 2004, dann die dänische Scandinavian Tobacco Group, der General Cigar seit 2005 gehört. Es ist genau die Kette, der der Atlas schon beim honduranischen Punch, Hoyo de Monterrey und El Rey del Mundo folgt.',

 'Don Tomas 生于 1975 年的丹利，而它并不出自洪都拉斯人之手：创立它的是美国公司 U.S. Tobacco。该公司的一位主管把父亲的名字改成西班牙语形式，用作品牌名。

雪茄出自 HATSA——Honduras American Tobacco——由车间大师 Estélo Padrón 主持，本图集在洪都拉斯 Bolívar 条目中已经写到过他。最初的配方把 Talanga 的洪都拉斯叶与 Jalapa 的尼加拉瓜叶配在一起。

九十年代的热潮毁了它的面目。需求超出收成所能跟上的限度，配方被改成哥伦比亚、多米尼加与巴西烟叶，配厄瓜多尔茄衣。少有品牌讲述这一段；它却解释了整整一代烟客在盒子里找到的是什么。

品牌四度易手，却始终没有离开丹利：U.S. Tobacco，而后 General Cigar，2004 年归 Swedish Match，再归丹麦的 Scandinavian Tobacco 集团——后者自 2005 年起拥有 General Cigar。这正是本图集在洪都拉斯的 Punch、Hoyo de Monterrey 与 El Rey del Mundo 上已经追述过的同一条链。',

 'وُلد «دون توماس» عام 1975 في دانلي، ولا يدين بشيء لهندوراسيّ: أنشأته شركة أمريكية هي «يو. إس. توباكو». وقد أسبغ أحد مديريها صيغة إسبانية على اسم أبيه ليسمّي بها العلامة.

خرج السيجار من «هاتسا» — هندوراس أمريكان توباكو — بإدارة إستيلو بادرون، معلّم الورشة الذي يسمّيه هذا الأطلس أصلًا في بطاقة «بوليفار» الهندوراسيّ. وكان المزيج الأصليّ يجمع ورق هندوراس من تالانغا إلى ورق نيكاراغوا من خالابا.

ثم شوّهه رواج التسعينيات. تجاوز الطلبُ ما يقدر عليه الحصاد، فأُعيد بناء المزيج بأتبغة كولومبية ودومينيكية وبرازيلية تحت غلاف إكوادوريّ. وقلّة من العلامات تروي هذه الواقعة؛ وهي مع ذلك تفسّر ما وجده جيل كامل من المدخّنين في العلبة.

انتقلت العلامة أربع مرّات بين الأيدي دون أن تغادر دانلي قطّ: «يو. إس. توباكو»، ثم «جنرال سيغار»، ثم «سويدش ماتش» عام 2004، ثم المجموعة الدنماركية «سكانديناڤيان توباكو» المالكة لـ«جنرال سيغار» منذ 2005. وهي السلسلة عينها التي يتتبّعها الأطلس عند «بونش» و«أويو دي مونتيري» و«إل ري دل موندو» الهندوراسيّة.',

 '[{"name":"Don Tomas Clasico","color":"#8B5A2B","force":"Medium","wrapper":"Ecuadorian Connecticut","vitolas":["Robusto","Toro","Churchill","Presidente"],"story":"The most widespread line, the one carrying the blend remade in the 1990s: Colombian, Dominican and Brazilian filler under an Ecuadorian wrapper."},{"name":"Don Tomas Sun Grown","color":"#6B4226","force":"Medium-Full","wrapper":"Sun-grown wrapper","vitolas":["Robusto","Toro","Corona"],"story":"The fuller side, closer to what the brand was at the start, when it married Talanga with Jalapa."},{"name":"Don Tomas Maduro","color":"#3E2723","force":"Medium-Full","wrapper":"Maduro","vitolas":["Robusto","Toro"],"story":"Rolled at HATSA like the rest, under a long-fermented wrapper. The Danlí factory has never stopped making this brand since 1975."}]',

 '[{"name":"Don Tomas Clasico","color":"#8B5A2B","force":"Medium","wrapper":"Connecticut de Ecuador","vitolas":["Robusto","Toro","Churchill","Presidente"],"story":"La gama más extendida, la de la ligada rehecha en los años noventa: tripa colombiana, dominicana y brasileña bajo capa ecuatoriana."},{"name":"Don Tomas Sun Grown","color":"#6B4226","force":"Medium-Full","wrapper":"Capa de sol","vitolas":["Robusto","Toro","Corona"],"story":"La vertiente fuerte, más cercana a lo que la marca fue al principio, cuando casaba Talanga con Jalapa."},{"name":"Don Tomas Maduro","color":"#3E2723","force":"Medium-Full","wrapper":"Maduro","vitolas":["Robusto","Toro"],"story":"Liada en HATSA como el resto, bajo una capa largamente fermentada. La fábrica de Danlí no ha dejado de hacer esta marca desde 1975."}]',

 '[{"name":"Don Tomas Clasico","color":"#8B5A2B","force":"Medium","wrapper":"Ecuadorianisches Connecticut","vitolas":["Robusto","Toro","Churchill","Presidente"],"story":"Die verbreitetste Linie, jene mit der in den 1990er Jahren neu gebauten Mischung: kolumbianische, dominikanische und brasilianische Einlage unter ecuadorianischem Deckblatt."},{"name":"Don Tomas Sun Grown","color":"#6B4226","force":"Medium-Full","wrapper":"Sonnendeckblatt","vitolas":["Robusto","Toro","Corona"],"story":"Die kräftigere Seite, näher an dem, was die Marke am Anfang war, als sie Talanga mit Jalapa vermählte."},{"name":"Don Tomas Maduro","color":"#3E2723","force":"Medium-Full","wrapper":"Maduro","vitolas":["Robusto","Toro"],"story":"Wie alles Übrige bei HATSA gerollt, unter einem lang fermentierten Deckblatt. Die Fabrik in Danlí hat diese Marke seit 1975 nie ausgesetzt."}]',

 '[{"name":"Don Tomas Clasico","color":"#8B5A2B","force":"Medium","wrapper":"厄瓜多尔 Connecticut","vitolas":["Robusto","Toro","Churchill","Presidente"],"story":"流传最广的一条线，用的是九十年代重做的配方：哥伦比亚、多米尼加与巴西芯叶，配厄瓜多尔茄衣。"},{"name":"Don Tomas Sun Grown","color":"#6B4226","force":"Medium-Full","wrapper":"日光茄衣","vitolas":["Robusto","Toro","Corona"],"story":"厚重的一面，更接近品牌起步时的样子——那时它把 Talanga 与 Jalapa 配在一起。"},{"name":"Don Tomas Maduro","color":"#3E2723","force":"Medium-Full","wrapper":"Maduro","vitolas":["Robusto","Toro"],"story":"与其余产品一样在 HATSA 卷制，用长时间发酵的茄衣。丹利的工厂自 1975 年起从未停做这个品牌。"}]',

 '[{"name":"Don Tomas Clasico","color":"#8B5A2B","force":"Medium","wrapper":"كونيتيكت إكوادوريّ","vitolas":["Robusto","Toro","Churchill","Presidente"],"story":"أوسع السلاسل انتشارًا، وهي حاملة المزيج الذي أُعيد بناؤه في التسعينيات: حشوة كولومبية ودومينيكية وبرازيلية تحت غلاف إكوادوريّ."},{"name":"Don Tomas Sun Grown","color":"#6B4226","force":"Medium-Full","wrapper":"غلاف شمسيّ","vitolas":["Robusto","Toro","Corona"],"story":"الوجه الأقوى، وهو أقرب إلى ما كانته العلامة في البداية حين كانت تجمع تالانغا إلى خالابا."},{"name":"Don Tomas Maduro","color":"#3E2723","force":"Medium-Full","wrapper":"مادورو","vitolas":["Robusto","Toro"],"story":"يُلَفّ في «هاتسا» كسائر الإنتاج، تحت غلاف طويل التخمير. ولم يتوقّف مصنع دانلي عن صنع هذه العلامة منذ 1975."}]');

-- ════════════════════════════════════════════════════════
-- REPRISE 1 — Dona Flor : un lieu de culture pris pour un
--             lieu de fabrication
-- ════════════════════════════════════════════════════════
UPDATE `brands`
   SET `founded`    = '1982 — São Gonçalo dos Campos, Bahia',
       `factory`    = 'Menendez Amerino, São Gonçalo dos Campos, Bahia, Brésil',
       `updated_at` = NOW()
 WHERE `name` = 'Dona Flor';

-- ════════════════════════════════════════════════════════
-- REPRISE 2 — Bolívar Honduras : retirée du tarif en
--             octobre 2024
-- ════════════════════════════════════════════════════════
UPDATE `brands` SET
  `history`    = CONCAT(`history`,    '\n\nEn octobre 2024, Scandinavian Tobacco Group a retiré cette marque de son tarif, avec El Rico Habano et Helix. La fabrique de Danlí tourne toujours ; la bague, elle, ne se fait plus. Cette fiche est désormais une fiche d''archive.'),
  `history_en` = CONCAT(`history_en`, '\n\nIn October 2024 Scandinavian Tobacco Group withdrew this brand from its price list, along with El Rico Habano and Helix. The Danlí factory still runs; the band is no longer made. This entry is now an archive entry.'),
  `history_es` = CONCAT(`history_es`, '\n\nEn octubre de 2024 Scandinavian Tobacco Group retiró esta marca de su tarifa, junto con El Rico Habano y Helix. La fábrica de Danlí sigue funcionando; la vitola ya no se hace. Esta ficha es desde ahora una ficha de archivo.'),
  `history_de` = CONCAT(`history_de`, '\n\nIm Oktober 2024 nahm die Scandinavian Tobacco Group diese Marke aus ihrer Preisliste, zusammen mit El Rico Habano und Helix. Die Fabrik in Danlí läuft weiter; der Ring wird nicht mehr gemacht. Dieser Eintrag ist von nun an ein Archiveintrag.'),
  `history_zh` = CONCAT(`history_zh`, '\n\n2024 年 10 月，Scandinavian Tobacco Group 把这个品牌连同 El Rico Habano 与 Helix 一起撤出了价目表。丹利的工厂仍在运转，这枚茄标却不再制作。本条目从此是一份档案条目。'),
  `history_ar` = CONCAT(`history_ar`, '\n\nوفي أكتوبر 2024 سحبت مجموعة «سكانديناڤيان توباكو» هذه العلامة من قائمة أسعارها، مع «إل ريكو هابانو» و«هيليكس». ولا يزال مصنع دانلي يعمل؛ أمّا الحلقة فلم تعد تُصنع. وهذه البطاقة صارت من الآن بطاقة أرشيف.'),
  `updated_at` = NOW()
 WHERE `name` = 'Bolívar Honduras';

-- Un REPLACE ou un CONCAT qui rate sa cible ne dit rien et sort
-- sans erreur. Les six lignes doivent valoir 1.
SELECT 'fr' AS lang, `history`    LIKE '%octobre 2024%'      AS ok FROM `brands` WHERE `name`='Bolívar Honduras'
UNION ALL SELECT 'en', `history_en` LIKE '%October 2024%'      FROM `brands` WHERE `name`='Bolívar Honduras'
UNION ALL SELECT 'es', `history_es` LIKE '%octubre de 2024%'   FROM `brands` WHERE `name`='Bolívar Honduras'
UNION ALL SELECT 'de', `history_de` LIKE '%Oktober 2024%'      FROM `brands` WHERE `name`='Bolívar Honduras'
UNION ALL SELECT 'zh', `history_zh` LIKE '%2024 年 10 月%'      FROM `brands` WHERE `name`='Bolívar Honduras'
UNION ALL SELECT 'ar', `history_ar` LIKE '%أكتوبر 2024%'       FROM `brands` WHERE `name`='Bolívar Honduras';

-- ════════════════════════════════════════════════════════
-- REPRISE 3 — Perdomo : « Nick's Stick » au singulier
-- ════════════════════════════════════════════════════════
-- La gamme s'appelle Nick's STICKS. Le recensement la listait comme
-- une maison absente : c'est une ligne de Perdomo, deja presente ici.
UPDATE `brands` SET
  `gamme`    = REPLACE(`gamme`,    'Nick''s Stick"', 'Nick''s Sticks"'),
  `gamme_en` = REPLACE(`gamme_en`, 'Nick''s Stick"', 'Nick''s Sticks"'),
  `gamme_es` = REPLACE(`gamme_es`, 'Nick''s Stick"', 'Nick''s Sticks"'),
  `gamme_de` = REPLACE(`gamme_de`, 'Nick''s Stick"', 'Nick''s Sticks"'),
  `gamme_zh` = REPLACE(`gamme_zh`, 'Nick''s Stick"', 'Nick''s Sticks"'),
  `gamme_ar` = REPLACE(`gamme_ar`, 'Nick''s Stick"', 'Nick''s Sticks"'),
  `updated_at` = NOW()
 WHERE `name` = 'Perdomo';

SELECT 'fr' AS lang, `gamme`    LIKE '%Nick''s Sticks%' AS ok FROM `brands` WHERE `name`='Perdomo'
UNION ALL SELECT 'en', `gamme_en` LIKE '%Nick''s Sticks%' FROM `brands` WHERE `name`='Perdomo'
UNION ALL SELECT 'es', `gamme_es` LIKE '%Nick''s Sticks%' FROM `brands` WHERE `name`='Perdomo'
UNION ALL SELECT 'de', `gamme_de` LIKE '%Nick''s Sticks%' FROM `brands` WHERE `name`='Perdomo'
UNION ALL SELECT 'zh', `gamme_zh` LIKE '%Nick''s Sticks%' FROM `brands` WHERE `name`='Perdomo'
UNION ALL SELECT 'ar', `gamme_ar` LIKE '%Nick''s Sticks%' FROM `brands` WHERE `name`='Perdomo';

-- ════════════════════════════════════════════════════════
-- REPRISE 4 — Trois tirets orphelins et un lieu dans un
--             champ de date
-- ════════════════════════════════════════════════════════
-- « — Rep. dominicaine (Altadis USA) » : l'annee attendue avant le
-- tiret manquait, et le tiret est reste. Un controle de coherence
-- refuse desormais cette forme.
UPDATE `brands` SET `founded` = 'Rép. dominicaine (Altadis USA)', `updated_at` = NOW()
 WHERE `name` = 'H. Upmann Dominicain';
UPDATE `brands` SET `founded` = 'Rép. dominicaine (Altadis USA)', `updated_at` = NOW()
 WHERE `name` = 'Henry Clay';
UPDATE `brands` SET `founded` = 'Honduras (Altadis USA)', `updated_at` = NOW()
 WHERE `name` = 'Saint Luis Rey Honduras';

-- Kolumbus portait un LIEU dans son champ de date — l'erreur corrigee
-- chez Vargas a la 182. Sa propre fiche dit que la maison ne publie pas
-- son annee de fondation ; le champ le dit maintenant aussi.
UPDATE `brands` SET `founded` = 'Année non publiée — La Palma, Canaries', `updated_at` = NOW()
 WHERE `name` = 'Kolumbus';

-- ── Les sceaux, calculés depuis les colonnes ─────────────
INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'brands', b.`name`, c.champ, l.lang,
       SHA1(CASE c.champ WHEN 'history' THEN b.`history` ELSE b.`gamme` END),
       'machine', NOW()
  FROM `brands` b
  JOIN (SELECT 'history' champ UNION ALL SELECT 'gamme') c
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE b.`name` IN ('Cuban Crafters','Vegas de Santiago','De Los Reyes Cigars',
                    'Menendez Amerino','Don Tomas','Bolívar Honduras','Perdomo')
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 193','systeme','cinq_maisons_ajoutees','marque',0,
   'Cuban Crafters (Don Kiki Berger, 1996, nicaragua), Vegas de Santiago (Marc Niehaus, costarica), De Los Reyes Cigars (Augusto Reyes, 1995, dominican), Menendez Amerino (1977, brazil) et Don Tomas (U.S. Tobacco, 1975, honduras) — le contrepoint de la 192 : ces cinq-la FABRIQUENT, et deux cultivent en plus leur propre tabac'),
  (NULL,'migration 193','systeme','dixieme_erreur_de_pays','marque',0,
   'docs/maisons-absentes.md classait CUBAN CRAFTERS aux Etats-Unis, a l adresse de son magasin de Miami. Elle possede sa fabrique — la Tabacalera Esteli, le long de la route panamericaine, a quelques centaines de metres de chez Padron. La fiche est nicaraguayenne. DIX erreurs de pays au total'),
  (NULL,'migration 193','systeme','trois_requalifications','marque',0,
   'CHAMAN n est pas une maison : c est une ligne de VEGAS DE SANTIAGO, nommee sur sa fiche. ARSEN n est pas une maison : c est une marque de DE LOS REYES CIGARS, nommee sur sa fiche. NICK S STICKS n est pas une maison : c est une ligne de PERDOMO, deja presente dans sa gamme ou elle etait ecrite « Nick s Stick » au singulier — corrigee ici dans les six langues. Meme traitement que Zino (191) et Oliveros (186)'),
  (NULL,'migration 193','systeme','dona_flor_corrigee','marque',0,
   'DONA FLOR se disait faite « annees 1990, a Cruz das Almas ». Les deux sont faux : la marque est lancee en 1982, et la fabrique Menendez Amerino est a SAO GONCALO DOS CAMPOS. Cruz das Almas est la ou pousse la mata fina qu elle emploie — un LIEU DE CULTURE pris pour un LIEU DE FABRICATION. Trouve en ecrivant la fiche de la fabrique, exactement comme la contradiction Dannemann a la 189'),
  (NULL,'migration 193','systeme','bolivar_honduras_retiree_du_tarif','marque',0,
   'Scandinavian Tobacco Group a retire BOLIVAR HONDURAS de son tarif en octobre 2024, avec EL RICO HABANO et HELIX. La fiche le dit desormais dans les six langues. La fabrique de Danli tourne toujours : c est la bague qui ne se fait plus'),
  (NULL,'migration 193','systeme','trois_tirets_orphelins','marque',0,
   'H. UPMANN DOMINICAIN, HENRY CLAY et SAINT LUIS REY HONDURAS portaient un `founded` commencant par un tiret orphelin — « — Rep. dominicaine (Altadis USA) » : l annee attendue avant le tiret manquait et le tiret est reste. Corriges. Un nouveau controle de coherence_check refuse desormais cette forme. KOLUMBUS portait un LIEU dans son champ de DATE, l erreur corrigee chez Vargas a la 182 ; sa fiche disant que la maison ne publie pas son annee, le champ le dit maintenant aussi'),
  (NULL,'migration 193','systeme','tension_signalee_non_corrigee','marque',0,
   'La fiche CASDAGLI dit que le Costa Rica est un « pays sans terroir tabacole notable ». VEGAS DE SANTIAGO y cultive son propre tabac a Puriscal depuis plus de quatre-vingts ans. La nouvelle fiche pose explicitement les deux — le pays des maisons sans terroir, et l exception qui cultive — plutot que de reecrire Casdagli, dont la phrase reste vraie au sens ou le tabac costaricien n est pas une reference internationale. A relire si une troisieme fiche costaricienne arrive');

-- ════════════════════════════════════════════════════════
-- LES TABLEAUX DE PAYS, EN TOUTES LETTRES
-- ════════════════════════════════════════════════════════
-- nicaragua : 43 → 44 entrées
UPDATE `producer_countries`
   SET `brands` = '[{"desc":"Référence absolue du Nicaragua premium","name":"Padrón","iconic":true},{"desc":"Pepin Garcia, maître torcedor légendaire","name":"My Father","iconic":true},{"desc":"Serie V mondialement reconnue","name":"Oliva","iconic":true},{"desc":"Liga Privada, révolution moderne","name":"Drew Estate","iconic":true},{"desc":"Plus grand producteur familial","name":"Plasencia","iconic":false},{"desc":"Élégance et puissance fusionnées","name":"Rocky Patel","iconic":false},{"desc":"Maître du Connecticut nicaraguayen","name":"Perdomo","iconic":false},{"desc":"Plus ancienne manufacture du pays","name":"Joya de Nicaragua","iconic":false},{"desc":"Le mélange privé de Jonathan Drew, devenu culte","name":"Liga Privada","iconic":false},{"desc":"Maison suisse de 1888, roulée à Estelí","name":"Villiger","iconic":false},{"desc":"Le rouleur que les autres marques employaient sans le nommer","name":"A.J. Fernandez","iconic":true},{"desc":"D''abord un planteur de Jalapa, ensuite une marque","name":"Aganorsa Leaf","iconic":true},{"desc":"La grammaire cubaine, la matière nicaraguayenne","name":"Tatuaje","iconic":false},{"desc":"Celle qui a rendu le petit format respectable","name":"Illusione","iconic":false},{"desc":"Un cigare ancré dans une culture, pas seulement un terroir","name":"Foundation Cigar Company","iconic":false},{"desc":"Granada plutôt qu''Estelí, et l''atelier ouvert aux visiteurs","name":"Mombacho","iconic":false},{"desc":"Une marque qui s''est offert sa propre manufacture","name":"Espinosa","iconic":true},{"desc":"Pas d''usine : elle choisit son rouleur selon l''assemblage","name":"Crowned Heads","iconic":true},{"desc":"Des noms cubains d''avant 1960, des assemblages d''aujourd''hui","name":"Warped","iconic":false},{"desc":"Maison nicaraguayenne, encore peu documentée ici","name":"Capitol","iconic":false},{"desc":"Repris par la famille García en décembre 2019, après quarante-cinq ans chez Quesada","name":"Fonseca Nicaraguayen","iconic":false},{"name":"Nicoya","desc":"Maison australienne roulée à Estelí — l''Australie ne cultive plus depuis 2006","iconic":false},{"name":"Dunbarton Tobacco & Trust","desc":"Steve Saka, ex-Drew Estate, parti monter sa maison sans usine","iconic":true},{"name":"RoMa Craft Tobac","desc":"Commencée dans un garage, puis son propre atelier à Estelí","iconic":true},{"name":"Viaje","desc":"Plus de gamme régulière depuis 2012 : rien que des séries limitées","iconic":false},{"name":"Room101","desc":"D''un bijoutier au cigare ; trois manufactures, deux pays","iconic":false},{"name":"L''Atelier","desc":"La seconde maison de Pete Johnson, chez My Father comme Tatuaje","iconic":false},{"name":"La Aroma de Cuba","desc":"Nom cubain des années 1880, refait par Pepin García en 2009","iconic":false},{"name":"Southern Draw","desc":"Robert et Sharon Holt — un seul atelier, ce qui est rare","iconic":false},{"name":"HVC Cigars","desc":"Havana City ; dix ans sans usine, puis la sienne en 2021","iconic":true},{"name":"Fratello","desc":"Un ingénieur de la NASA passé au cigare","iconic":false},{"name":"Curivari","desc":"Grecque de tête, cubaine d''intention, nicaraguayenne de matière","iconic":false},{"name":"Black Label Trading Co.","desc":"Une fabrique conçue comme un atelier d''artiste","iconic":false},{"name":"Asylum","desc":"L''autre moitié de CLE — et une fabrique qui fut un cinéma","iconic":false},{"name":"Micallef","desc":"Une panne de voiture, un Texan, et trois générations cubaines","iconic":false},{"name":"Gurkha","desc":"Sans usine jusqu''en 2017, puis propriétaire de la sienne à Estelí","iconic":false},{"name":"Protocol","desc":"Deux policiers, aucune usine — La Zona puis San Lotano","iconic":false},{"name":"Regius","desc":"Maison londonienne de 2010, roulée chez Plasencia","iconic":false},{"name":"Cornelius & Anthony","desc":"Cent cinquante ans de tabac en Virginie, roulés à Estelí","iconic":false},{"name":"262 Cigars","desc":"Le nom est une date : février 1962, la signature de l''embargo","iconic":false},{"name":"Emilio Cigars","desc":"Trois fabriques, trois familles, un seul nom sur la bague","iconic":false},{"name":"Nomad","desc":"Le nom était un programme : elle a changé d''atelier et de pays","iconic":false},{"name":"7-20-4","desc":"Une adresse de Manchester fermée en 1962, reprise en 2006","iconic":false},{"name":"Cuban Crafters","desc":"Une boutique à Miami, mais la fabrique est à Estelí","iconic":false}]',
       `updated_at` = NOW()
 WHERE `id` = 'nicaragua';

-- costarica : 5 → 6 entrées
UPDATE `producer_countries`
   SET `brands` = '[{"desc":"Du dessinateur du Behike à sa propre maison","name":"Atabey","iconic":true},{"desc":"Le versant classique de Selected Tobacco","name":"Byron","iconic":false},{"desc":"Des tabacs mûris cinq ans avant roulage","name":"Bandolero","iconic":false},{"desc":"Maison britannique sans champs, roulée au Costa Rica","name":"Casdagli","iconic":false},{"name":"Selected Tobacco","desc":"Nelson Alfonso — la maison derrière Atabey, Byron et Bandolero","iconic":false},{"name":"Vegas de Santiago","desc":"La seule du pays qui cultive ce qu''elle roule","iconic":true}]',
       `updated_at` = NOW()
 WHERE `id` = 'costarica';

-- dominican : 35 → 36 entrées
UPDATE `producer_countries`
   SET `brands` = '[{"desc":"Opus X — les plus convoités au monde","name":"Arturo Fuente","iconic":true},{"desc":"Luxe suisse, manufacture dominicaine","name":"Davidoff","iconic":true},{"desc":"Artisanat d''exception depuis 1996","name":"La Flor Dominicana","iconic":true},{"desc":"Standard mondial du Connecticut","name":"Macanudo","iconic":false},{"desc":"ESG et VSG, intemporels","name":"Ashton","iconic":false},{"desc":"Créée par le pianiste Avo Uvezian","name":"Avo","iconic":false},{"desc":"La douceur comme valeur absolue, depuis 1993","name":"Santa Damiana","iconic":false},{"desc":"1903, la plus ancienne manufacture dominicaine","name":"La Aurora","iconic":true},{"desc":"Repartir de zéro après une carrière entière","name":"E.P. Carrillo","iconic":true},{"desc":"1974, avant la vague — et toujours familiale","name":"Quesada","iconic":false},{"desc":"Tamboril, où la même main roule plusieurs bagues","name":"PDR Cigars","iconic":false},{"desc":"L''autre Montecristo, celui d''après 1960","name":"Montecristo Dominicain","iconic":true},{"desc":"Même bague que le havane, autre cigare","name":"Romeo y Julieta Dominicain","iconic":false},{"desc":"Le cigare que des dizaines de milliers de gens fument vraiment","name":"VegaFina","iconic":true},{"desc":"Un bon cigare selon le marché d''avant la mode de la puissance","name":"Don Diego","iconic":false},{"desc":"Né d''une boîte de nuit genevoise, et cela s''entend","name":"The Griffin''s","iconic":false},{"desc":"Un industriel redevenu artisan","name":"Matilde","iconic":false},{"desc":"La bague au pied du cigare — personne d''autre n''a osé","name":"Juan Clemente","iconic":false},{"desc":"Cape venue du Cameroun, cigares roulés ici","name":"Meerapfel","iconic":false},{"desc":"Née chez El Credito, à Miami, en 1972","name":"La Gloria Cubana Dominicaine","iconic":false},{"desc":"Tabacalera de García, La Romana","name":"H. Upmann Dominicain","iconic":false},{"desc":"Ne subsiste que hors de Cuba","name":"Henry Clay","iconic":false},{"desc":"Collection non cubaine annoncée en 2016","name":"Por Larrañaga Dominicain","iconic":false},{"name":"Boutique Blends","desc":"Rafael Nodal — Aging Room et Swag, chez Jochy Blanco","iconic":false},{"name":"Diamond Crown","desc":"La commande de Stanford Newman à Carlos Fuente Sr., pour le centenaire de 1995","iconic":false},{"name":"Cuesta-Rey","desc":"1884, Ybor City — plus ancienne que la maison qui la possède","iconic":false},{"name":"Tabacalera Palma","desc":"1936 — la fabrique dont sortent Aging Room, Swag, La Galera et Matilde","iconic":true},{"name":"Aging Room","desc":"Rafael Nodal compose, Jochy Blanco fabrique — et ils sont associés","iconic":true},{"name":"Swag","desc":"L''autre marque de Boutique Blends, même atelier, sans cérémonie","iconic":false},{"name":"Kristoff","desc":"Une visite non sollicitée en 2004, et un financier qui change de métier","iconic":false},{"name":"Caldwell Cigar Co.","desc":"Des tabacs rares plutôt qu''une recette reproductible","iconic":false},{"name":"Casa Cuevas","desc":"Tabacalera Las Lavas — trois générations sur un même assemblage","iconic":false},{"name":"Ferio Tego","desc":"L''héritière de Nat Sherman : Quesada et Plasencia se partagent son catalogue","iconic":true},{"name":"Paul Garmirian","desc":"Un livre en 1990, puis un cigare — roulé chez la fabrique qui fait l''Avo","iconic":false},{"name":"La Barba","desc":"Partie du Honduras pour l''atelier des Ventura, celui de Caldwell","iconic":false},{"name":"De Los Reyes Cigars","desc":"Leo cultive, Nirka dirige — et l''atelier roule aussi pour d''autres","iconic":false}]',
       `updated_at` = NOW()
 WHERE `id` = 'dominican';

-- brazil : 4 → 5 entrées
UPDATE `producer_countries`
   SET `brands` = '[{"desc":"Marque brésilienne iconique depuis 1873","name":"Dannemann","iconic":true},{"cape":true,"desc":"Utilise le wrapper Mata Fina","name":"Arturo Fuente Maduro","iconic":false},{"desc":"La mémoire cigarière de Bahia","name":"Suerdieck","iconic":true},{"desc":"Roulage cubain, feuille brésilienne","name":"Dona Flor","iconic":true},{"name":"Menendez Amerino","desc":"La fabrique de Dona Flor, à São Gonçalo dos Campos","iconic":true}]',
       `updated_at` = NOW()
 WHERE `id` = 'brazil';

-- honduras : 19 → 20 entrées
UPDATE `producer_countries`
   SET `brands` = '[{"desc":"Prensado — Cigare de l''Année 2011","name":"Alec Bradley","iconic":true},{"desc":"Honduras Cameroon, blend iconique","name":"CAO","iconic":true},{"desc":"Corojo authentique de Jamastran","name":"Camacho","iconic":false},{"desc":"Le Punch d''après 1960, sans rapport avec le havane","name":"Punch Honduras","iconic":false},{"desc":"Suisse, dominicaine et hondurienne à la fois","name":"Excalibur","iconic":false},{"desc":"Le prénom de Zino Davidoff, en marque à part","name":"Zino Platinum","iconic":false},{"desc":"1995, fondée depuis Paris pour un palais européen","name":"Flor de Selva","iconic":true},{"desc":"Une ville bâtie autour de sa manufacture","name":"La Flor de Copán","iconic":false},{"desc":"Du corojo d''avant les hybrides, cultivé par la famille","name":"Aladino","iconic":false},{"desc":"La tête sucrée qui a fait commencer des générations","name":"Baccarat","iconic":false},{"desc":"Le contre-pied du havane : ici, c''est le corsé","name":"Hoyo de Monterrey Honduras","iconic":false},{"desc":"Une des dernières traces vivantes de ce que Tampa a été","name":"Bering","iconic":false},{"desc":"Assemblage Cofradia d''Estélo Padrón, chez HATSA","name":"Bolívar Honduras","iconic":false},{"desc":"Villazon, aux mêmes ateliers que Punch et Hoyo","name":"El Rey del Mundo Honduras","iconic":false},{"desc":"Altadis USA ; la ligne Tabacales est dominicaine","name":"Saint Luis Rey Honduras","iconic":false},{"desc":"Abandonnée par Habanos en 2005, relancée au Honduras","name":"Gispert","iconic":false},{"name":"Maya Selva Cigars","desc":"Fondée en 1995 par Maya Selva — Flor de Selva","iconic":false},{"name":"CLE Cigar Company","desc":"Christian Eiroa revient au métier quatre ans après avoir vendu Camacho","iconic":true},{"name":"Oscar Valladares","desc":"Le cigare enveloppé dans une feuille entière, à retirer avant d''allumer","iconic":false},{"name":"Don Tomas","desc":"1975, créée par une compagnie américaine chez HATSA","iconic":false}]',
       `updated_at` = NOW()
 WHERE `id` = 'honduras';


-- ════════════════════════════════════════════════════════
-- REPRISES DEMANDEES PAR LES GARDE-FOUS
-- ════════════════════════════════════════════════════════
-- Ecrit, puis relu par les controles, puis corrige — dans cet ordre.
--
-- 1. `marques_check` a lu « intégralement artisanal » entre guillemets
--    comme une PAROLE PRETEE a la maison. Le fait est juste, la forme
--    ne l'etait pas : les guillemets sautent, la phrase reste attribuee
--    (« la maison decrit son procede comme... »). Meme reprise qu'a la
--    182 pour « Green River Sucker One ».
--
-- 2. `i18n_superlatif_check` a trouve six superlatifs que le francais ne
--    portait pas — quatre en chinois, un en allemand, un en arabe. Deux
--    causes distinctes :
--      · le francais disait « la ligne que le marche britannique connait
--        LE MIEUX » : c'est un superlatif, et il a essaime. La SOURCE est
--        reecrite, pas seulement les traductions
--      · les autres sont des ajouts de traduction pure. Retires.

-- ── Menendez Amerino : la parole prêtée ──────────────────
UPDATE `brands` SET
  `history`    = REPLACE(`history`,    'La maison dit son procédé « intégralement artisanal » :',   'La maison décrit son procédé comme intégralement artisanal :'),
  `history_en` = REPLACE(`history_en`, 'The house calls its process "entirely artisanal":',         'The house describes its process as entirely artisanal:'),
  `history_es` = REPLACE(`history_es`, 'La casa llama a su proceso «integralmente artesanal»:',     'La casa describe su proceso como integralmente artesanal:'),
  `history_de` = REPLACE(`history_de`, 'Das Haus nennt sein Verfahren "vollständig handwerklich":', 'Das Haus beschreibt sein Verfahren als vollständig handwerklich:'),
  `history_zh` = REPLACE(`history_zh`, '公司称自己的工序「全然手作」：', '公司把自己的工序描述为全然手作：'),
  `history_ar` = REPLACE(`history_ar`, 'تصف الدار طريقتها بأنّها «حرفية بالكامل»:', 'تصف الدار طريقتها بأنّها حرفية بالكامل:'),
  `updated_at` = NOW()
 WHERE `name` = 'Menendez Amerino';

SELECT 'fr' AS lang, `history`    LIKE '%décrit son procédé comme intégralement%' AS ok FROM `brands` WHERE `name`='Menendez Amerino'
UNION ALL SELECT 'en', `history_en` LIKE '%describes its process as entirely%'      FROM `brands` WHERE `name`='Menendez Amerino'
UNION ALL SELECT 'es', `history_es` LIKE '%describe su proceso como integralmente%' FROM `brands` WHERE `name`='Menendez Amerino'
UNION ALL SELECT 'de', `history_de` LIKE '%beschreibt sein Verfahren als%'          FROM `brands` WHERE `name`='Menendez Amerino'
UNION ALL SELECT 'zh', `history_zh` LIKE '%描述为全然手作%'                          FROM `brands` WHERE `name`='Menendez Amerino'
UNION ALL SELECT 'ar', `history_ar` LIKE '%بأنّها حرفية بالكامل%'                     FROM `brands` WHERE `name`='Menendez Amerino';

-- ── Regius : le superlatif était DANS LA SOURCE ──────────
UPDATE `brands` SET
  `gamme`    = REPLACE(`gamme`,    'La ligne que le marché britannique connaît le mieux, roulée à Estelí. L''étiquette noire est la marque de fabrique visuelle de la maison.', 'La ligne par laquelle le marché britannique connaît la maison, roulée à Estelí. L''étiquette noire est sa marque de fabrique visuelle.'),
  `gamme_en` = REPLACE(`gamme_en`, 'The line the British market knows best, rolled in Estelí. The black label is the house''s visual signature.', 'The line by which the British market knows the house, rolled in Estelí. The black label is its visual signature.'),
  `gamme_es` = REPLACE(`gamme_es`, 'La línea que mejor conoce el mercado británico, liada en Estelí. La etiqueta negra es la firma visual de la casa.', 'La línea por la que el mercado británico conoce la casa, liada en Estelí. La etiqueta negra es su firma visual.'),
  `gamme_de` = REPLACE(`gamme_de`, 'Die Linie, die der britische Markt am besten kennt, gerollt in Estelí. Das schwarze Etikett ist das optische Zeichen des Hauses.', 'Die Linie, über die der britische Markt das Haus kennt, gerollt in Estelí. Das schwarze Etikett ist sein optisches Zeichen.'),
  `gamme_zh` = REPLACE(`gamme_zh`, '英国市场最熟悉的一条线，在埃斯特利卷制。黑色标签是这家的视觉印记。', '英国市场借以认识这家公司的一条线，在埃斯特利卷制。黑色标签是它的视觉印记。'),
  `gamme_ar` = REPLACE(`gamme_ar`, 'الخطّ الذي تعرفه السوق البريطانية أكثر من سواه، ويُلَفّ في إستيلي. والملصق الأسود هو العلامة البصرية للدار.', 'الخطّ الذي تعرف به السوق البريطانية هذه الدار، ويُلَفّ في إستيلي. والملصق الأسود هو علامتها البصرية.'),
  `updated_at` = NOW()
 WHERE `name` = 'Regius';

SELECT 'fr' AS lang, `gamme`    LIKE '%par laquelle le marché britannique connaît la maison%' AS ok FROM `brands` WHERE `name`='Regius'
UNION ALL SELECT 'en', `gamme_en` LIKE '%by which the British market knows the house%'          FROM `brands` WHERE `name`='Regius'
UNION ALL SELECT 'es', `gamme_es` LIKE '%por la que el mercado británico conoce la casa%'       FROM `brands` WHERE `name`='Regius'
UNION ALL SELECT 'de', `gamme_de` LIKE '%über die der britische Markt das Haus kennt%'          FROM `brands` WHERE `name`='Regius'
UNION ALL SELECT 'zh', `gamme_zh` LIKE '%借以认识这家公司的一条线%'                                FROM `brands` WHERE `name`='Regius'
UNION ALL SELECT 'ar', `gamme_ar` LIKE '%تعرف به السوق البريطانية هذه الدار%'                     FROM `brands` WHERE `name`='Regius';

-- ── Trois superlatifs chinois que le français ne portait pas
UPDATE `brands` SET
  `history_zh` = REPLACE(`history_zh`, '在那里制作全美流传最广的十美分雪茄之一', '在那里制作十美分雪茄，在全美流传甚广'),
  `updated_at` = NOW()
 WHERE `name` = '7-20-4';

UPDATE `brands` SET
  `gamme_zh` = REPLACE(`gamme_zh`, '这家出口最多的品牌', '这家的出口主力品牌'),
  `updated_at` = NOW()
 WHERE `name` = 'De Los Reyes Cigars';

UPDATE `brands` SET
  `gamme_zh` = REPLACE(`gamme_zh`, '最早的两条线，2011 年问世', '头两条线，2011 年问世'),
  `updated_at` = NOW()
 WHERE `name` = 'Emilio Cigars';

SELECT '7-20-4' AS marque, `history_zh` LIKE '%在全美流传甚广%' AS ok FROM `brands` WHERE `name`='7-20-4'
UNION ALL SELECT 'De Los Reyes Cigars', `gamme_zh` LIKE '%出口主力品牌%' FROM `brands` WHERE `name`='De Los Reyes Cigars'
UNION ALL SELECT 'Emilio Cigars',       `gamme_zh` LIKE '%头两条线%'     FROM `brands` WHERE `name`='Emilio Cigars';

-- Les sceaux des colonnes françaises touchées sont recalculés.
INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'brands', b.`name`, c.champ, l.lang,
       SHA1(CASE c.champ WHEN 'history' THEN b.`history` ELSE b.`gamme` END),
       'machine', NOW()
  FROM `brands` b
  JOIN (SELECT 'history' champ UNION ALL SELECT 'gamme') c
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE b.`name` IN ('Menendez Amerino','Regius','7-20-4','De Los Reyes Cigars','Emilio Cigars')
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 193','systeme','reprises_des_garde_fous','marque',0,
   'marques_check a lu « integralement artisanal » entre guillemets comme une PAROLE PRETEE chez Menendez Amerino : les guillemets sautent, la phrase reste attribuee. i18n_superlatif_check a trouve six superlatifs absents du francais : chez REGIUS le superlatif etait DANS LA SOURCE (« la ligne que le marche britannique connait LE MIEUX ») et il avait essaime en de, zh et ar — la SOURCE a ete reecrite, pas seulement les traductions ; chez 7-20-4, DE LOS REYES et EMILIO c etaient des ajouts de traduction pure, retires. Reste un seul ecart, arabe, chez VEGAS DE SANTIAGO : le mot y signifie MOIS (trois mois en chambre de cedre) et non « plus celebre » — homographe, fige au cliquet');
