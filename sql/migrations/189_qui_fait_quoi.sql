-- ════════════════════════════════════════════════════════
-- 189 — Qui fait quoi : Dannemann corrigée, La Palina tranchée
-- ────────────────────────────────────────────────────────
-- Deux demandes du propriétaire de l'atlas, et une consigne durable :
-- NOMMER LES COLLABORATIONS ENTRE MAISONS, et le rôle de chacune.
--
-- ════════ 1. DANNEMANN ═══════════════════════════════════
--
-- La question posée était : « à retirer si ce sont des cigarillos faits
-- à la machine ». La vérification donne une réponse en deux temps.
--
-- LE GROUPE FAIT LES DEUX, MAIS PAS AU MÊME ENDROIT :
--
--   São Félix da Cachoeira, Bahia   LONGFILLER ROULÉ MAIN, par des
--                                   charuteiras — c'est de cette
--                                   fabrique que parle la fiche
--   Lübbecke, Allemagne             cigarillos, machine
--   Brissago et Reinach, Suisse     cigarillos et cigares de spécialité
--
-- La fiche de l'atlas porte la maison brésilienne, celle du Recôncavo,
-- qui roule à la main. ELLE RESTE. Ce qui sort, ce sont les DEUX
-- ENTRÉES DE CIGARILLOS de son champ `gamme` :
--
--   Dannemann Speciale   « cigarillo brésilien », format court
--   Dannemann Pierrot    « format mini, aromatisé vanille ou cerise »
--
-- Il reste la gamme Premium — cigares pleine longueur, tabac de Bahia
-- vieilli deux ans — réécrite pour dire ce qu'elle est : le longfiller
-- roulé main de São Félix. C'est le même partage que chez J.C. Newman
-- à la migration 187 : le produit de machine sort, la maison reste.
--
-- ── ⚠ ET UNE CONTRADICTION ENTRE DEUX FICHES DE L'ATLAS ─
-- Trouvée en vérifiant la chaîne de propriété, ce que la consigne sur
-- les collaborations demandait précisément de faire :
--
--   `Dannemann`      disait « rachat par le groupe SWISHER
--                    INTERNATIONAL »
--   `Burger Söhne`   disait « en 1988, elle rachète Dannemann GmbH à
--                    Lübbecke » et « le groupe possède aujourd'hui
--                    Dannemann, Ritmeester et Al Capone »
--
-- C'est Burger Söhne qui a raison : dannemann-group.com déclare le
-- groupe suisse et familial, et Wikipédia le donne « Swiss-owned,
-- Germany-based ». Swisher International est une société américaine
-- qui n'a rien à voir avec cette chaîne — elle apparaît en revanche à
-- juste titre sur la fiche Bering, qu'elle a bien possédée.
--
-- L'erreur est corrigée dans les six langues. Aucun contrôle ne pouvait
-- la voir : deux affirmations vraies séparément, fausses ensemble.
--
-- ════════ 2. LA PALINA ═══════════════════════════════════
--
-- Écartée délibérément à la migration 186, faute de lieu principal
-- identifiable. La recherche a tranché, et elle a donné mieux que la
-- réponse attendue : LA MAISON SE DÉCRIT ELLE-MÊME COMME UN NÉGOCIANT.
-- Elle ne possède aucune fabrique, mais possède son tabac, ses produits
-- finis et ses marques. Le partage des rôles est public et net :
--
--   El Titan de Bronze, Miami       Goldie (un seul rouleur), Mr. Sam,
--                                   Family Series
--   PDR Cigars, Rép. dominicaine    Classic
--   Raíces Cubanas, Honduras        El Diario, Maduro
--   A.J. Fernández, Nicaragua       Nicaragua Oscuro
--   Graycliff, Bahamas              1896, et la Family Series d'origine
--
-- TROIS DE CES CINQ PARTENAIRES ONT DÉJÀ LEUR FICHE DANS CET ATLAS :
-- El Titan de Bronze, PDR Cigars et A.J. Fernández. La fiche les nomme.
--
-- `country_id` = `usa` : le Goldie, ligne haute de la maison, et deux
-- autres gammes sortent de Miami. C'est le même raisonnement que pour
-- Padilla (migration 188), et la fiche écrit le reste plutôt que de le
-- taire, comme celle de Room101.
--
-- ⚠ TOUT EST ROULÉ MAIN — la maison parle de « premium and
-- ultra-premium handmade cigars ». Vérifié avant écriture, règle 187.
--
-- Sources : dannemann-group.com « Our Company » (les trois sites de
-- production et leurs rôles), en.wikipedia.org (Dannemann Cigars :
-- Swiss-owned, Germany-based), lapalinacigars.com « About » (le modèle
-- de négociant, les quatre pays), cigar-coop.com « Remembering the
-- Rebirth of La Palina » (la carte des fabriques par gamme),
-- cigaraficionado.com (Samuel Paley, la Congress Cigar Company, la
-- relance de 2010).
--
-- Après cette migration :
--   php tools/contenu_dump.php
--   php tools/i18n_dump.php > sql/traductions.sql
-- ════════════════════════════════════════════════════════

-- ════════════════════════════════════════════════════════
-- DANNEMANN — LA CHAÎNE DE PROPRIÉTÉ CORRIGÉE
-- ════════════════════════════════════════════════════════
UPDATE `brands` SET
 `history` = REPLACE(`history`,
   'avant son rachat par le groupe Swisher International',
   'avant que le groupe suisse Burger Söhne ne rachète Dannemann GmbH, en 1988'),
 `history_en` = REPLACE(`history_en`,
   'before its acquisition by the Swisher International group',
   'before the Swiss group Burger Söhne bought Dannemann GmbH, in 1988'),
 `history_es` = REPLACE(`history_es`,
   'antes de su compra por el grupo Swisher International',
   'antes de que el grupo suizo Burger Söhne comprara Dannemann GmbH, en 1988'),
 `history_de` = REPLACE(`history_de`,
   'ehe es die Swisher International Group übernahm',
   'ehe die Schweizer Gruppe Burger Söhne 1988 die Dannemann GmbH übernahm'),
 `history_zh` = REPLACE(`history_zh`,
   '在被 Swisher International 集团收购之前',
   '在瑞士的 Burger Söhne 集团于 1988 年收购德国的 Dannemann GmbH 之前'),
 `history_ar` = REPLACE(`history_ar`,
   'قبل أن تشتريها مجموعة «سويشر إنترناشونال»',
   'قبل أن تشتري المجموعة السويسرية «بورغر زونه» شركة دانيمان الألمانية عام 1988'),
 `updated_at` = NOW()
 WHERE `name` = 'Dannemann';

-- ── Et le partage des rôles, ajouté en fin de fiche ──────
UPDATE `brands` SET
 `history` = CONCAT(`history`, '\n\nUne précision décide de la place de cette maison dans cet atlas. Le groupe fait aussi des cigarillos — mais pas ici : ceux-là sortent de Lübbecke, en Allemagne, et des ateliers suisses de Brissago et Reinach. São Félix est la fabrique de longfillers, où des charuteiras roulent à la main. L''atlas ne porte que ce qui sort de São Félix.'),
 `history_en` = CONCAT(`history_en`, '\n\nOne detail settles this house''s place in this atlas. The group also makes cigarillos — but not here: those come out of Lübbecke, in Germany, and the Swiss workshops at Brissago and Reinach. São Félix is the long filler factory, where charuteiras roll by hand. This atlas holds only what comes out of São Félix.'),
 `history_es` = CONCAT(`history_es`, '\n\nUna precisión decide el lugar de esta casa en este atlas. El grupo hace también cigarritos, pero no aquí: esos salen de Lübbecke, en Alemania, y de los talleres suizos de Brissago y Reinach. São Félix es la fábrica de tripa larga, donde las charuteiras lían a mano. Este atlas solo recoge lo que sale de São Félix.'),
 `history_de` = CONCAT(`history_de`, '\n\nEine Präzisierung entscheidet über den Platz dieses Hauses in diesem Atlas. Die Gruppe stellt auch Zigarillos her — aber nicht hier: Die kommen aus Lübbecke in Deutschland und aus den Schweizer Werkstätten in Brissago und Reinach. São Félix ist die Longfiller-Fabrik, in der Charuteiras von Hand rollen. Dieser Atlas führt nur, was aus São Félix kommt.'),
 `history_zh` = CONCAT(`history_zh`, '\n\n有一点决定了这家在本图集中的位置。集团也生产小雪茄——但不在这里：那些出自德国的吕贝克，以及瑞士布里萨戈与赖纳赫的工坊。圣费利克斯是长填料工厂，由被称作 charuteiras 的女卷烟师手工卷制。本图集只收录出自圣费利克斯的产品。'),
 `history_ar` = CONCAT(`history_ar`, '\n\nثمّة تفصيل يحسم مكانة هذه الدار في هذا الأطلس. فالمجموعة تصنع أيضًا سيجارات صغيرة — لكن ليس هنا: تلك تخرج من لوبكه في ألمانيا، ومن الورشتين السويسريتين في بريساغو ورايناخ. أمّا ساو فيليكس فهي مصنع الحشوة الطويلة، حيث تلفّ الـ«تشاروتيراس» باليد. ولا يضمّ هذا الأطلس إلا ما يخرج من ساو فيليكس.'),
 `updated_at` = NOW()
 WHERE `name` = 'Dannemann';

-- ── La gamme perd ses deux cigarillos ────────────────────
UPDATE `brands` SET
 `gamme`    = '[{"name":"Dannemann Premium","color":"#8B5A2B","force":"Light-Medium","wrapper":"Bahia du Brésil","vitolas":["Robusto","Toro"],"story":"Le longfiller de São Félix, roulé à la main par les charuteiras de la fabrique. Cigares pleine longueur, tabac de Bahia vieilli deux ans : vanille, noix de cajou, une pointe de cannelle. C''est la seule gamme Dannemann que cet atlas porte, et c''est la seule qui ne sorte pas d''une machine."}]',
 `gamme_en` = '[{"name":"Dannemann Premium","color":"#8B5A2B","force":"Light-Medium","wrapper":"Brazilian Bahia","vitolas":["Robusto","Toro"],"story":"The long filler of São Félix, hand-rolled by the factory''s charuteiras. Full-length cigars, Bahia tobacco aged two years: vanilla, cashew, a touch of cinnamon. It is the only Dannemann range this atlas holds, and the only one that does not come off a machine."}]',
 `gamme_es` = '[{"name":"Dannemann Premium","color":"#8B5A2B","force":"Light-Medium","wrapper":"Bahia de Brasil","vitolas":["Robusto","Toro"],"story":"La tripa larga de São Félix, liada a mano por las charuteiras de la fábrica. Puros de largo completo, tabaco de Bahía envejecido dos años: vainilla, anacardo, una pizca de canela. Es la única gama Dannemann que este atlas recoge, y la única que no sale de una máquina."}]',
 `gamme_de` = '[{"name":"Dannemann Premium","color":"#8B5A2B","force":"Light-Medium","wrapper":"Bahia aus Brasilien","vitolas":["Robusto","Toro"],"story":"Der Longfiller aus São Félix, von den Charuteiras der Fabrik von Hand gerollt. Zigarren in voller Länge, Bahia-Tabak zwei Jahre gereift: Vanille, Cashew, ein Hauch Zimt. Es ist die einzige Dannemann-Linie, die dieser Atlas führt, und die einzige, die nicht von einer Maschine kommt."}]',
 `gamme_zh` = '[{"name":"Dannemann Premium","color":"#8B5A2B","force":"Light-Medium","wrapper":"巴西 Bahia","vitolas":["Robusto","Toro"],"story":"圣费利克斯的长填料，由厂内的 charuteiras 手工卷制。足长雪茄，巴伊亚烟叶陈化两年：香草、腰果、一丝肉桂。这是本图集收录的唯一一条 Dannemann 系列，也是唯一不出自机器的一条。"}]',
 `gamme_ar` = '[{"name":"Dannemann Premium","color":"#8B5A2B","force":"Light-Medium","wrapper":"باهيا البرازيلية","vitolas":["Robusto","Toro"],"story":"حشوة ساو فيليكس الطويلة، تلفّها بأيديهنّ «التشاروتيراس» في المصنع. سيجارات كاملة الطول بتبغ باهيا معتَّق سنتين: فانيليا، وكاجو، ولمسة قرفة. وهي السلسلة الوحيدة من دانيمان في هذا الأطلس، والوحيدة التي لا تخرج من آلة."}]',
 `updated_at` = NOW()
 WHERE `name` = 'Dannemann';

-- ════════════════════════════════════════════════════════
-- LA PALINA
-- ════════════════════════════════════════════════════════
INSERT INTO `brands`
  (`name`, `country_id`, `founded`, `factory`, `history`, `gamme`,
   `history_en`, `history_es`, `history_de`, `history_zh`, `history_ar`,
   `gamme_en`, `gamme_es`, `gamme_de`, `gamme_zh`, `gamme_ar`)
VALUES

('La Palina', 'usa', '2010 — relance par Bill Paley ; marque de 1896',
 'Négociant sans fabrique : El Titan de Bronze (Miami), PDR Cigars (Rép. dom.), Raíces Cubanas (Honduras), A.J. Fernández (Nicaragua)',

 'La Palina est un nom de 1896 relancé par un petit-fils. Samuel Paley, immigré ukrainien, ouvre cette année-là une boutique de cigares à Chicago et fonde la Congress Cigar Company ; il baptise sa marque du prénom de sa femme, Goldie Drell Paley. En 1910, il a une fabrique à Philadelphie.

Son fils William S. Paley vend les cigares par la radio — l''émission s''appelait la La Palina Hour — et y prend goût au point de prendre en 1928 le contrôle du réseau qui la diffusait. Il quitte le cigare et fait de CBS ce qu''elle est devenue. La Congress Cigar Company est liquidée après le retrait de Samuel en 1926, et le nom s''éteint.

William Paley junior, dit Bill, le relance en 2010. Les premiers cigares sortent des Bahamas, en petites quantités.

La maison se décrit comme un négociant, et c''est la clé de sa fiche : elle ne possède aucune fabrique, mais elle possède son tabac, ses produits finis et ses marques. Elle fait donc rouler chez d''autres, et le partage est public — le Goldie et le Mr. Sam à El Titan de Bronze, dans la Petite Havane à Miami, le Goldie par un seul rouleur ; le Classic à la PDR Cigars, en République dominicaine ; l''El Diario et le Maduro à la Raíces Cubanas, au Honduras ; le Nicaragua Oscuro chez A.J. Fernández ; le 1896 au Graycliff, aux Bahamas. Trois de ces cinq partenaires ont déjà leur fiche dans cet atlas.

C''est pourquoi cette fiche est américaine : le Goldie, ligne haute de la maison, et deux autres gammes sortent de Miami. L''atlas classe par le lieu principal — et il écrit le reste plutôt que de le taire.',

 '[{"name":"Goldie","color":"#C9A227","force":"Medium","wrapper":"Habano d''Équateur","vitolas":["Laguito No. 2","Laguito No. 5","Dalia"],"story":"La ligne haute, roulée à El Titan de Bronze dans la Petite Havane — et par UN SEUL rouleur. Elle porte le prénom de Goldie Drell Paley, la grand-mère de Bill et la femme de Samuel : c''est elle que le nom de la marque désignait déjà en 1896."},{"name":"Mr. Sam","color":"#8B5A2B","force":"Medium-Full","wrapper":"Assemblage El Titan de Bronze","vitolas":["Robusto","Toro"],"story":"L''autre gamme de Miami, faite en petites séries chez El Titan de Bronze. Le nom est celui de Samuel Paley, le fondateur de 1896."},{"name":"El Diario","color":"#6B4226","force":"Medium-Full","wrapper":"Assemblage Raíces Cubanas","vitolas":["Robusto","Toro","Corona"],"story":"Roulée à la Fábrica de Tabacos Raíces Cubanas, au Honduras. C''est la gamme née de l''association avec cette manufacture-là, et elle porte son propre registre."},{"name":"Black Label","color":"#3A2A20","force":"Full","wrapper":"Brésil","vitolas":["Robusto","Toro"],"story":"Faite en République dominicaine, sous une cape brésilienne huileuse, sur sous-cape et tripe du Nicaragua et de République dominicaine. Le versant le plus corsé du catalogue : cuir, terre, cèdre."},{"name":"Classic","color":"#A0522D","force":"Medium","wrapper":"Connecticut, Rosado, Maduro ou cape du Honduras selon les versions","vitolas":["Robusto","Toro","Churchill"],"story":"La gamme de volume, roulée à la PDR Cigars, en République dominicaine — la manufacture de Tamboril que cet atlas porte. C''est la porte d''entrée de la maison."}]',

 'La Palina is an 1896 name brought back by a grandson. Samuel Paley, a Ukrainian immigrant, opened a cigar shop in Chicago that year and founded the Congress Cigar Company; he named his brand after his wife''s first name, Goldie Drell Paley. By 1910 he had a factory in Philadelphia.

His son William S. Paley sold the cigars over the radio — the programme was called the La Palina Hour — and took to it so thoroughly that in 1928 he took control of the network that carried it. He left cigars behind and made CBS what it became. The Congress Cigar Company was wound up after Samuel''s retirement in 1926, and the name died out.

William Paley junior, known as Bill, brought it back in 2010. The first cigars came out of the Bahamas, in small quantities.

The house describes itself as a negociant, and that is the key to this entry: it owns no factory, but it owns its tobacco, its finished products and its brands. So it has others roll for it, and the division is public — Goldie and Mr. Sam at El Titan de Bronze, in Little Havana, Miami, Goldie by a single roller; Classic at PDR Cigars, in the Dominican Republic; El Diario and Maduro at Raíces Cubanas, in Honduras; Nicaragua Oscuro at A.J. Fernández; the 1896 at Graycliff, in the Bahamas. Three of those five partners already have entries in this atlas.

That is why this entry is American: Goldie, the house''s top line, and two other ranges come out of Miami. The atlas files by the principal place — and writes the rest rather than hiding it.',

 'La Palina es un nombre de 1896 relanzado por un nieto. Samuel Paley, inmigrante ucraniano, abre ese año una tienda de puros en Chicago y funda la Congress Cigar Company; bautiza su marca con el nombre de su mujer, Goldie Drell Paley. En 1910 tiene una fábrica en Filadelfia.

Su hijo William S. Paley vende los puros por la radio — el programa se llamaba La Palina Hour — y le toma tal gusto que en 1928 se hace con el control de la cadena que lo emitía. Deja el puro y hace de CBS lo que llegó a ser. La Congress Cigar Company se liquida tras la retirada de Samuel en 1926, y el nombre se apaga.

William Paley hijo, llamado Bill, lo relanza en 2010. Los primeros puros salen de las Bahamas, en pequeñas cantidades.

La casa se describe como un negociante, y esa es la clave de esta ficha: no posee ninguna fábrica, pero posee su tabaco, sus productos acabados y sus marcas. Así que hace liar en casa de otros, y el reparto es público: el Goldie y el Mr. Sam en El Titan de Bronze, en la Pequeña Habana de Miami, el Goldie por un solo liador; el Classic en PDR Cigars, en la República Dominicana; el El Diario y el Maduro en Raíces Cubanas, en Honduras; el Nicaragua Oscuro en A.J. Fernández; el 1896 en Graycliff, en las Bahamas. Tres de esos cinco socios ya tienen ficha en este atlas.

Por eso esta ficha es estadounidense: el Goldie, gama alta de la casa, y otras dos gamas salen de Miami. El atlas clasifica por el lugar principal, y escribe el resto en vez de callarlo.',

 'La Palina ist ein Name von 1896, den ein Enkel zurückgeholt hat. Samuel Paley, ukrainischer Einwanderer, eröffnete in jenem Jahr ein Zigarrengeschäft in Chicago und gründete die Congress Cigar Company; er benannte seine Marke nach dem Vornamen seiner Frau, Goldie Drell Paley. 1910 besaß er eine Fabrik in Philadelphia.

Sein Sohn William S. Paley verkaufte die Zigarren über das Radio — die Sendung hieß La Palina Hour — und fand daran solchen Gefallen, dass er 1928 die Kontrolle über das Netz übernahm, das sie ausstrahlte. Er ließ die Zigarre hinter sich und machte aus CBS, was daraus wurde. Die Congress Cigar Company wurde nach Samuels Rückzug 1926 abgewickelt, und der Name erlosch.

William Paley junior, genannt Bill, holte ihn 2010 zurück. Die ersten Zigarren kamen in kleinen Mengen aus den Bahamas.

Das Haus beschreibt sich als Negociant, und das ist der Schlüssel zu diesem Eintrag: Es besitzt keine Fabrik, wohl aber seinen Tabak, seine Fertigwaren und seine Marken. Es lässt also bei anderen rollen, und die Aufteilung ist öffentlich — Goldie und Mr. Sam bei El Titan de Bronze in Little Havana, Miami, die Goldie von einem einzigen Roller; Classic bei PDR Cigars in der Dominikanischen Republik; El Diario und Maduro bei Raíces Cubanas in Honduras; Nicaragua Oscuro bei A.J. Fernández; die 1896 bei Graycliff auf den Bahamas. Drei dieser fünf Partner haben in diesem Atlas bereits einen Eintrag.

Deshalb steht dieser Eintrag unter den Vereinigten Staaten: Goldie, die Spitzenlinie des Hauses, und zwei weitere Linien kommen aus Miami. Der Atlas ordnet nach dem Hauptort ein — und schreibt den Rest, statt ihn zu verschweigen.',

 'La Palina 是 1896 年的一个老字号，由孙辈重新启用。乌克兰移民 Samuel Paley 于那一年在芝加哥开设雪茄店，创办 Congress Cigar Company；他以妻子 Goldie Drell Paley 的名字为品牌命名。到 1910 年，他在费城已有一座工厂。

其子 William S. Paley 借电台推销雪茄——节目名为 La Palina Hour——并因此入迷，1928 年索性取得了播出该节目那家电视网的控制权。他离开雪茄业，把 CBS 做成了后来的样子。Congress Cigar Company 在 Samuel 于 1926 年退出后清算，这个名字随之湮没。

William Paley 之子、人称 Bill 者，于 2010 年将它重新启用。最初的雪茄产自巴哈马，数量不多。

这家公司自称为「négociant（商号）」，这正是本条目的关键：它不拥有任何工厂，却拥有自己的烟叶、成品与品牌。因此它请别人代卷，分工是公开的——Goldie 与 Mr. Sam 在迈阿密小哈瓦那的 El Titan de Bronze，其中 Goldie 由一位卷烟师独自完成；Classic 在多米尼加共和国的 PDR Cigars；El Diario 与 Maduro 在洪都拉斯的 Raíces Cubanas；Nicaragua Oscuro 在 A.J. Fernández；1896 在巴哈马的 Graycliff。这五家合作方中，已有三家在本图集中设有专条。

这正是本条目归入美国的原因：这家的高端线 Goldie 与另外两条线均出自迈阿密。本图集按主要产地归类——并把其余写明，而非略去。',

 'لا بالينا اسم من عام 1896 أعاده حفيد إلى الحياة. ففي تلك السنة افتتح صامويل بايلي، وهو مهاجر أوكراني، متجر سيجار في شيكاغو وأسّس «كونغرِس سيغار كومباني»؛ وسمّى علامته باسم زوجته غولدي دريل بايلي. وبحلول 1910 صار له مصنع في فيلادلفيا.

أمّا ابنه ويليام س. بايلي فباع السيجار عبر الإذاعة — وكان البرنامج يُسمّى «ساعة لا بالينا» — وأولع بذلك حتى استولى عام 1928 على الشبكة التي كانت تبثّه. ترك السيجار وصنع من CBS ما صارت إليه. وصُفِّيت «كونغرِس سيغار كومباني» بعد اعتزال صامويل عام 1926، فانطفأ الاسم.

ثم أعاده ويليام بايلي الابن، المعروف ببيل، إلى الحياة عام 2010. وخرجت أولى السيجارات من الباهاما، بكميات صغيرة.

وتصف الدار نفسها بأنّها «نيغوسيان»، أي تاجر مُلّاك، وهذا مفتاح بطاقتها: لا تملك أيّ مصنع، لكنّها تملك تبغها ومنتجاتها النهائية وعلاماتها. فهي تُوكِل اللفّ إلى غيرها، والتقسيم معلَن — «غولدي» و«مستر سام» في إل تيتان دي برونثي بهافانا الصغيرة في ميامي، و«غولدي» على يد لافٍّ واحد؛ و«كلاسيك» في PDR Cigars بالجمهورية الدومينيكية؛ و«إل دياريو» و«مادورو» في رايسِس كوبانا بهندوراس؛ و«نيكاراغوا أوسكورو» عند أ. ج. فرنانديز؛ و«1896» في غرايكليف بالباهاما. وثلاثة من هؤلاء الشركاء الخمسة لهم بطاقاتهم في هذا الأطلس.

ولهذا صُنّفت هذه البطاقة أمريكية: فـ«غولدي»، الخطّ الأعلى للدار، وخطّان آخران يخرجون من ميامي. والأطلس يصنّف بالمكان الرئيسي — ويكتب الباقي بدل أن يكتمه.',

 '[{"name":"Goldie","color":"#C9A227","force":"Medium","wrapper":"Ecuadorian Habano","vitolas":["Laguito No. 2","Laguito No. 5","Dalia"],"story":"The top line, rolled at El Titan de Bronze in Little Havana — and by A SINGLE roller. It carries the first name of Goldie Drell Paley, Bill''s grandmother and Samuel''s wife: she is who the brand name already meant in 1896."},{"name":"Mr. Sam","color":"#8B5A2B","force":"Medium-Full","wrapper":"El Titan de Bronze blend","vitolas":["Robusto","Toro"],"story":"The other Miami range, made in small batches at El Titan de Bronze. The name is Samuel Paley''s, the founder of 1896."},{"name":"El Diario","color":"#6B4226","force":"Medium-Full","wrapper":"Raíces Cubanas blend","vitolas":["Robusto","Toro","Corona"],"story":"Rolled at Fábrica de Tabacos Raíces Cubanas, in Honduras. It is the range born of the partnership with that factory, and it carries its own register."},{"name":"Black Label","color":"#3A2A20","force":"Full","wrapper":"Brazil","vitolas":["Robusto","Toro"],"story":"Made in the Dominican Republic, under an oily Brazilian wrapper, over binder and filler from Nicaragua and the Dominican Republic. The fullest side of the catalogue: leather, earth, cedar."},{"name":"Classic","color":"#A0522D","force":"Medium","wrapper":"Connecticut, Rosado, Maduro or a Honduran wrapper depending on the version","vitolas":["Robusto","Toro","Churchill"],"story":"The volume range, rolled at PDR Cigars, in the Dominican Republic — the Tamboril factory this atlas holds. It is the house''s way in."}]',

 '[{"name":"Goldie","color":"#C9A227","force":"Medium","wrapper":"Habano de Ecuador","vitolas":["Laguito No. 2","Laguito No. 5","Dalia"],"story":"La gama alta, liada en El Titan de Bronze, en la Pequeña Habana, y por UN SOLO liador. Lleva el nombre de Goldie Drell Paley, abuela de Bill y mujer de Samuel: es a ella a quien el nombre de la marca ya designaba en 1896."},{"name":"Mr. Sam","color":"#8B5A2B","force":"Medium-Full","wrapper":"Ligada El Titan de Bronze","vitolas":["Robusto","Toro"],"story":"La otra gama de Miami, hecha en series cortas en El Titan de Bronze. El nombre es el de Samuel Paley, el fundador de 1896."},{"name":"El Diario","color":"#6B4226","force":"Medium-Full","wrapper":"Ligada Raíces Cubanas","vitolas":["Robusto","Toro","Corona"],"story":"Liada en la Fábrica de Tabacos Raíces Cubanas, en Honduras. Es la gama nacida de la asociación con esa manufactura, y tiene su propio registro."},{"name":"Black Label","color":"#3A2A20","force":"Full","wrapper":"Brasil","vitolas":["Robusto","Toro"],"story":"Hecha en la República Dominicana, bajo una capa brasileña aceitosa, sobre capote y tripa de Nicaragua y de la República Dominicana. La vertiente más fuerte del catálogo: cuero, tierra, cedro."},{"name":"Classic","color":"#A0522D","force":"Medium","wrapper":"Connecticut, Rosado, Maduro o capa de Honduras según las versiones","vitolas":["Robusto","Toro","Churchill"],"story":"La gama de volumen, liada en PDR Cigars, en la República Dominicana: la manufactura de Tamboril que este atlas recoge. Es la puerta de entrada de la casa."}]',

 '[{"name":"Goldie","color":"#C9A227","force":"Medium","wrapper":"Habano aus Ecuador","vitolas":["Laguito No. 2","Laguito No. 5","Dalia"],"story":"Die Spitzenlinie, bei El Titan de Bronze in Little Havana gerollt — und von EINEM EINZIGEN Roller. Sie trägt den Vornamen von Goldie Drell Paley, Bills Großmutter und Samuels Frau: Sie war schon 1896 mit dem Markennamen gemeint."},{"name":"Mr. Sam","color":"#8B5A2B","force":"Medium-Full","wrapper":"Mischung El Titan de Bronze","vitolas":["Robusto","Toro"],"story":"Die andere Miami-Linie, in kleinen Serien bei El Titan de Bronze gefertigt. Der Name ist der von Samuel Paley, dem Gründer von 1896."},{"name":"El Diario","color":"#6B4226","force":"Medium-Full","wrapper":"Mischung Raíces Cubanas","vitolas":["Robusto","Toro","Corona"],"story":"Bei der Fábrica de Tabacos Raíces Cubanas in Honduras gerollt. Es ist die Linie, die aus der Verbindung mit dieser Manufaktur entstand, und sie hat ihr eigenes Register."},{"name":"Black Label","color":"#3A2A20","force":"Full","wrapper":"Brasilien","vitolas":["Robusto","Toro"],"story":"In der Dominikanischen Republik gefertigt, unter einem öligen brasilianischen Deckblatt, über Um- und Einlage aus Nicaragua und der Dominikanischen Republik. Die kräftigste Seite des Katalogs: Leder, Erde, Zeder."},{"name":"Classic","color":"#A0522D","force":"Medium","wrapper":"Connecticut, Rosado, Maduro oder honduranisches Deckblatt je nach Fassung","vitolas":["Robusto","Toro","Churchill"],"story":"Die Mengenlinie, bei PDR Cigars in der Dominikanischen Republik gerollt — der Manufaktur in Tamboril, die dieser Atlas führt. Sie ist der Einstieg in das Haus."}]',

 '[{"name":"Goldie","color":"#C9A227","force":"Medium","wrapper":"厄瓜多尔 Habano","vitolas":["Laguito No. 2","Laguito No. 5","Dalia"],"story":"居于顶端的一条线，在小哈瓦那的 El Titan de Bronze 卷制——且由**一位**卷烟师独自完成。它取名自 Goldie Drell Paley，Bill 的祖母、Samuel 的妻子：1896 年那个品牌名所指的，本就是她。"},{"name":"Mr. Sam","color":"#8B5A2B","force":"Medium-Full","wrapper":"El Titan de Bronze 配方","vitolas":["Robusto","Toro"],"story":"迈阿密的另一条线，在 El Titan de Bronze 小批量制作。名字来自 1896 年的创办人 Samuel Paley。"},{"name":"El Diario","color":"#6B4226","force":"Medium-Full","wrapper":"Raíces Cubanas 配方","vitolas":["Robusto","Toro","Corona"],"story":"在洪都拉斯的 Fábrica de Tabacos Raíces Cubanas 卷制。这是与那家工厂合作而生的一条线，自有其风格。"},{"name":"Black Label","color":"#3A2A20","force":"Full","wrapper":"巴西","vitolas":["Robusto","Toro"],"story":"在多米尼加共和国制作，采用油润的巴西茄衣，茄套与茄芯来自尼加拉瓜与多米尼加共和国。目录中最浓的一侧：皮革、土壤、雪松。"},{"name":"Classic","color":"#A0522D","force":"Medium","wrapper":"依版本而定：康涅狄格、Rosado、马杜罗或洪都拉斯茄衣","vitolas":["Robusto","Toro","Churchill"],"story":"走量的一条线，在多米尼加共和国的 PDR Cigars 卷制——本图集收录的坦博里尔那家工厂。它是进入这家的入门之选。"}]',

 '[{"name":"Goldie","color":"#C9A227","force":"Medium","wrapper":"هابانو إكوادوري","vitolas":["Laguito No. 2","Laguito No. 5","Dalia"],"story":"الخطّ الأعلى، يُلَفّ في إل تيتان دي برونثي بهافانا الصغيرة — وعلى يد لافٍّ واحد. ويحمل اسم غولدي دريل بايلي، جدّة بيل وزوجة صامويل: وهي من كان اسم العلامة يعنيها منذ 1896."},{"name":"Mr. Sam","color":"#8B5A2B","force":"Medium-Full","wrapper":"مزيج إل تيتان دي برونثي","vitolas":["Robusto","Toro"],"story":"الخطّ الميامي الآخر، يُصنع بدفعات صغيرة في إل تيتان دي برونثي. والاسم اسم صامويل بايلي، مؤسّس 1896."},{"name":"El Diario","color":"#6B4226","force":"Medium-Full","wrapper":"مزيج رايسِس كوبانا","vitolas":["Robusto","Toro","Corona"],"story":"يُلَفّ في «فابريكا دي تاباكوس رايسِس كوبانا» بهندوراس. وهو الخطّ الذي وُلد من الشراكة مع ذلك المصنع، وله مزاجه الخاص."},{"name":"Black Label","color":"#3A2A20","force":"Full","wrapper":"البرازيل","vitolas":["Robusto","Toro"],"story":"يُصنع في الجمهورية الدومينيكية، تحت غلاف برازيلي زيتيّ، فوق رابط وحشوة من نيكاراغوا والجمهورية الدومينيكية. الوجه الأقوى في الكتالوج: جلد، وتراب، وأرز."},{"name":"Classic","color":"#A0522D","force":"Medium","wrapper":"كونيتيكت أو روسادو أو مادورو أو غلاف هندوراسي بحسب النسخة","vitolas":["Robusto","Toro","Churchill"],"story":"خطّ الحجم الكبير، يُلَفّ في PDR Cigars بالجمهورية الدومينيكية — مصنع تامبوريل الذي يضمّه هذا الأطلس. وهو مدخل الدار."}]');

-- ── Les sceaux, calculés depuis les colonnes ─────────────
INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'brands', b.`name`, c.champ, l.lang,
       SHA1(CASE c.champ WHEN 'history' THEN b.`history` ELSE b.`gamme` END),
       'machine', NOW()
  FROM `brands` b
  JOIN (SELECT 'history' champ UNION ALL SELECT 'gamme') c
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE b.`name` IN ('Dannemann', 'La Palina')
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 189','systeme','dannemann_fait_les_deux','marque',0,
   'LA QUESTION ETAIT « DANNEMANN A RETIRER SI CE SONT DES CIGARILLOS FAITS A LA MACHINE ». Le groupe fait les deux, mais PAS AU MEME ENDROIT : Sao Felix da Cachoeira au Bresil est la fabrique de LONGFILLER ROULE MAIN, par des charuteiras ; les cigarillos sortent de Lubbecke en Allemagne et des ateliers suisses de Brissago et Reinach. La fiche de l atlas porte la maison bresilienne : ELLE RESTE. Ce qui sort, ce sont les DEUX ENTREES DE CIGARILLOS de son champ gamme — Speciale et Pierrot, ce dernier « aromatise vanille ou cerise ». Meme partage que chez J.C. Newman a la migration 187 : le produit de machine sort, la maison reste'),
  (NULL,'migration 189','systeme','contradiction_entre_deux_fiches','marque',0,
   'TROUVEE EN VERIFIANT LA CHAINE DE PROPRIETE, ce que la consigne sur les collaborations demandait precisement de faire. La fiche Dannemann disait « rachat par le groupe SWISHER INTERNATIONAL » ; la fiche Burger Sohne disait « en 1988 elle rachete Dannemann GmbH a Lubbecke » et « le groupe possede aujourd hui Dannemann, Ritmeester et Al Capone ». C est Burger Sohne qui a raison : dannemann-group.com declare le groupe suisse et familial. Swisher International est une societe americaine etrangere a cette chaine — elle apparait en revanche a juste titre sur la fiche Bering, qu elle a bien possedee. Corrige dans les six langues. AUCUN CONTROLE NE POUVAIT LE VOIR : deux affirmations vraies separement, fausses ensemble'),
  (NULL,'migration 189','systeme','la_palina_tranchee','marque',0,
   'ECARTEE DELIBEREMENT A LA MIGRATION 186 faute de lieu principal identifiable. La recherche a tranche et a donne mieux que la reponse attendue : LA MAISON SE DECRIT ELLE-MEME COMME UN NEGOCIANT — elle ne possede aucune fabrique, mais possede son tabac, ses produits finis et ses marques. country_id = usa parce que le Goldie, ligne haute, et deux autres gammes sortent d El Titan de Bronze a Miami. Meme raisonnement que Padilla (188)'),
  (NULL,'migration 189','systeme','qui_fait_quoi','marque',0,
   'CONSIGNE DURABLE DU PROPRIETAIRE DE L ATLAS : nommer les collaborations entre maisons et le role de chacune. La fiche La Palina l applique en entier — El Titan de Bronze a Miami fait le Goldie (par UN SEUL rouleur) et le Mr. Sam ; PDR Cigars en Rep. dominicaine fait le Classic ; Raices Cubanas au Honduras fait l El Diario et le Maduro ; A.J. Fernandez au Nicaragua fait le Nicaragua Oscuro ; Graycliff aux Bahamas fait le 1896. TROIS DE CES CINQ PARTENAIRES ONT DEJA LEUR FICHE DANS CET ATLAS, et la fiche les nomme');

-- ════════════════════════════════════════════════════════
-- LE TABLEAU `brands` DES ÉTATS-UNIS, EN TOUTES LETTRES
-- ════════════════════════════════════════════════════════
UPDATE `producer_countries`
   SET `brands` = '[{"desc":"Macanudo, Punch, Partagás HN","name":"General Cigar","iconic":true},{"desc":"100% US tobacco","name":"CAO America","iconic":false},{"desc":"L''homonyme américaine, née de l''embargo","name":"Cohiba USA","iconic":false},{"desc":"La version américaine, chez General Cigar","name":"Partagás USA","iconic":false},{"desc":"L''américaine d''Altadis, depuis 1969","name":"Romeo y Julieta USA","iconic":false},{"desc":"1895, le plus ancien fabricant familial américain","name":"J.C. Newman","iconic":true},{"desc":"Ce qui reste des ateliers cubains de Miami","name":"El Titan de Bronze","iconic":true},{"desc":"1930, une adresse de la Cinquième Avenue devenue marque","name":"Nat Sherman","iconic":true},{"desc":"La maison d''origine a récupéré son nom en 2001, puis l''a vendu à Altadis","name":"Trinidad USA","iconic":false},{"name":"Forged Cigar Company","desc":"Société de distribution de Scandinavian Tobacco Group","iconic":false},{"name":"Padilla","desc":"L''hommage d''un fils au poète Heberto Padilla, roulé Calle Ocho","iconic":true},{"name":"La Palina","desc":"Négociant sans fabrique : quatre partenaires, trois pays, un nom de 1896","iconic":true}]',
       `updated_at` = NOW()
 WHERE `id` = 'usa';

-- ── Le contrôle des six REPLACE de Dannemann ────────────
-- Doit rendre SIX lignes à 1.
SELECT 'fr' AS lang, `history` LIKE '%Burger Söhne ne rachète Dannemann GmbH%' AS ok FROM `brands` WHERE `name`='Dannemann'
UNION ALL SELECT 'en', `history_en` LIKE '%Burger Söhne bought Dannemann GmbH%' FROM `brands` WHERE `name`='Dannemann'
UNION ALL SELECT 'es', `history_es` LIKE '%Burger Söhne comprara Dannemann GmbH%' FROM `brands` WHERE `name`='Dannemann'
UNION ALL SELECT 'de', `history_de` LIKE '%Burger Söhne 1988 die Dannemann GmbH%' FROM `brands` WHERE `name`='Dannemann'
UNION ALL SELECT 'zh', `history_zh` LIKE '%瑞士的 Burger Söhne 集团于 1988 年%' FROM `brands` WHERE `name`='Dannemann'
UNION ALL SELECT 'ar', `history_ar` LIKE '%«بورغر زونه»%' FROM `brands` WHERE `name`='Dannemann';
