-- ════════════════════════════════════════════════════════
-- 186 — La scène boutique dominicaine
-- ────────────────────────────────────────────────────────
-- Six maisons, toutes rattachées à la République dominicaine :
--
--   Tabacalera Palma      la fabrique, 1936 — José Arnaldo Blanco II
--   Aging Room            Rafael Nodal, 2011, chez Jochy Blanco
--   Swag                  l'autre marque de Boutique Blends
--   Kristoff              Glen Case, 2004
--   Caldwell Cigar Co.    Robert Caldwell, 2014
--   Casa Cuevas           la famille Cuevas, Tabacalera Las Lavas
--
-- ── CE LOT NOMME ENFIN LES FABRIQUES ────────────────────
-- Le lot nicaraguayen (migration 185) montrait des maisons SANS usine.
-- Celui-ci fait l'inverse : il nomme trois FABRIQUES dominicaines que
-- l'atlas citait déjà sans jamais leur donner de fiche.
--
--   Tabacalera Palma      Aging Room, Swag, La Galera, La Matilde —
--                         et la Matilde de l'atlas en sort
--   Tabacalera Las Lavas  Casa Cuevas, mais aussi Gurkha et Veritas
--   Tabacalera von Eicken Kristoff (ex-Charles Fairmorn)
--
-- Tabacalera Palma reçoit sa propre fiche parce qu'elle est la plus
-- ancienne des trois — 1936 — et parce que quatre marques de cet atlas
-- en dépendent.
--
-- ── ET IL RESSERRE UN NŒUD DÉJÀ POSÉ ────────────────────
-- La migration 180 avait créé `Boutique Blends` en disant qu'elle
-- portait Aging Room et Swag. Les deux marques existent enfin, et le
-- renvoi fonctionne dans les deux sens. Rafael Nodal apparaît ainsi une
-- quatrième fois dans l'atlas : Boutique Blends, Aging Room, Swag, et
-- le Trinidad Santiago dont il a revu la composition pour Altadis —
-- assemblé par le même Jochy Blanco.
--
-- ⚠ LA PALINA N'EST PAS DANS CE LOT, ET C'EST DÉLIBÉRÉ.
-- `docs/maisons-absentes.md` la classait en République dominicaine. La
-- vérification dit autre chose : elle se fabrique au Honduras, au
-- Nicaragua, en République dominicaine ET à Miami, chez El Titan de
-- Bronze — que l'atlas porte. Aucun lieu principal ne se dégage, et
-- lui en inventer un serait refaire l'erreur de Nicoya (migration 183).
-- Elle attend une décision, pas une approximation.
--
-- ── CE QUE CES FICHES REFUSENT D'ÉCRIRE ─────────────────
-- Aging Room porte deux classements de Cigar Aficionado pour 2013 —
-- deuxième cigare de l'année, et premier non cubain. Aucun n'entre ici,
-- faute de `source_url` : règle de `marques_check`, déjà appliquée à El
-- Sitio (182) et à Viaje (185).
--
-- ── LE TABLEAU JSON EST POSÉ EN TOUTES LETTRES ──────────
-- Règle des migrations 179 à 185 : aucun `JSON_*`.
-- `producer_countries.brands` pour `dominican` passe de vingt-six à
-- trente-deux entrées, écrites entières.
--
-- ⚠ LES SIX `founded` TIENNENT SOUS 49 CARACTÈRES — leçon de la 184,
-- vérifiée avant écriture.
--
-- Sources : tabacalerapalma.com et cigaraficionado.com « Touring Jochy
-- Blanco's Farm and the Tabacalera Palma Cigar Factory » (1936, la zone
-- franche de 1995, les générations, les effectifs), procigar.org,
-- cigarjournal.com « Rafael Nodal: From Asylum Seeker to Master of
-- Boutique Blends » et en.wikipedia.org (Boutique Blends : rachat de
-- 2002, associés, marques), cigarjournal.com et famous-smoke.com (Glen
-- Case, Rolando Villamil, Charles Fairmorn devenu von Eicken),
-- cigar-coop.com et cigardojo.com (Caldwell, 2014, les Ventura),
-- halfwheel.com et cigaraficionado.com (Casa Cuevas, Las Lavas,
-- Patrimonio).
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

-- ── Tabacalera Palma ─────────────────────────────────────
('Tabacalera Palma', 'dominican', '1936 — Tamboril, Rép. dominicaine',
 'Zone franche La Palma, Tamboril, Santiago, Rép. dominicaine',

 'Tabacalera Palma n''est pas une marque : c''est la fabrique d''où sortent quatre des marques de cet atlas. José Arnaldo Blanco II la fonde en 1936. Son père, José Manuel Blanco Lozada, était un Espagnol arrivé en République dominicaine au milieu du XIXe siècle.

José « Jochy » Blanco la dirige aujourd''hui. Il est de la quatrième génération de planteurs de la famille et de la troisième à la tête de la maison — une continuité rare dans un métier où presque toutes les enseignes ont changé de mains.

En 1995, il déplace la fabrique dans une zone franche qu''il crée lui-même, à Tamboril, dans la banlieue de Santiago. Elle porte le nom de La Palma, et c''est de là que vient la confusion fréquente entre le nom de la zone et celui de l''entreprise. Plus de trois cent cinquante personnes y travaillent, dont plus de sept sur dix sont des femmes.

Elle roule sa propre marque, La Galera, et fabrique pour d''autres : Aging Room et Swag pour Rafael Nodal, et la Matilde que cet atlas porte déjà. C''est aussi elle qui assemble le Trinidad Santiago d''Altadis — une fabrique dominicaine qui fait un cigare portant un nom cubain, ce qui résume assez bien ce pays.',

 '[{"name":"La Galera","color":"#8B5A2B","force":"Medium","wrapper":"Assemblages dominicains, capes variées","vitolas":["Robusto","Toro","Corona"],"story":"La marque propre de la fabrique, et la seule qu''elle signe de son nom. Le mot désigne l''atelier de roulage lui-même — la salle où les torcedores travaillent en rangs."}]',

 'Tabacalera Palma is not a brand: it is the factory four of this atlas''s brands come out of. José Arnaldo Blanco II founded it in 1936. His father, José Manuel Blanco Lozada, was a Spaniard who reached the Dominican Republic in the middle of the nineteenth century.

José "Jochy" Blanco runs it today. He is the fourth generation of growers in the family and the third at the head of the house — a continuity that is rare in a trade where almost every name has changed hands.

In 1995 he moved the factory into a free-trade zone he created himself, at Tamboril, on the outskirts of Santiago. It is named La Palma, and that is where the frequent confusion between the name of the zone and the name of the company comes from. More than three hundred and fifty people work there, more than seven in ten of them women.

It rolls its own brand, La Galera, and makes for others: Aging Room and Swag for Rafael Nodal, and the Matilde this atlas already holds. It is also the factory that blends Altadis''s Trinidad Santiago — a Dominican factory making a cigar under a Cuban name, which sums this country up rather well.',

 'Tabacalera Palma no es una marca: es la fábrica de la que salen cuatro de las marcas de este atlas. José Arnaldo Blanco II la funda en 1936. Su padre, José Manuel Blanco Lozada, era un español llegado a la República Dominicana a mediados del siglo XIX.

José «Jochy» Blanco la dirige hoy. Es la cuarta generación de cultivadores de la familia y la tercera al frente de la casa: una continuidad rara en un oficio en el que casi todos los nombres han cambiado de manos.

En 1995 traslada la fábrica a una zona franca que él mismo crea, en Tamboril, en las afueras de Santiago. Se llama La Palma, y de ahí viene la confusión frecuente entre el nombre de la zona y el de la empresa. Allí trabajan más de trescientas cincuenta personas, más de siete de cada diez mujeres.

Lía su propia marca, La Galera, y fabrica para otros: Aging Room y Swag para Rafael Nodal, y la Matilde que este atlas ya recoge. Es también la que liga el Trinidad Santiago de Altadis: una fábrica dominicana que hace un puro con nombre cubano, lo que resume bastante bien a este país.',

 'Tabacalera Palma ist keine Marke: Sie ist die Fabrik, aus der vier Marken dieses Atlas kommen. José Arnaldo Blanco II gründete sie 1936. Sein Vater, José Manuel Blanco Lozada, war ein Spanier, der Mitte des 19. Jahrhunderts in die Dominikanische Republik kam.

José "Jochy" Blanco führt sie heute. Er ist die vierte Generation von Pflanzern in der Familie und die dritte an der Spitze des Hauses — eine Kontinuität, die in einem Gewerbe selten ist, in dem fast jeder Name den Besitzer gewechselt hat.

1995 verlegte er die Fabrik in eine Freihandelszone, die er selbst schuf, in Tamboril am Rand von Santiago. Sie heißt La Palma, und daher rührt die häufige Verwechslung zwischen dem Namen der Zone und dem des Unternehmens. Über dreihundertfünfzig Menschen arbeiten dort, mehr als sieben von zehn davon Frauen.

Sie rollt ihre eigene Marke, La Galera, und fertigt für andere: Aging Room und Swag für Rafael Nodal, und die Matilde, die dieser Atlas bereits führt. Sie mischt auch die Trinidad Santiago von Altadis — eine dominikanische Fabrik, die eine Zigarre unter kubanischem Namen macht, was dieses Land recht gut zusammenfasst.',

 'Tabacalera Palma 不是一个品牌，而是本图集中四个品牌的出产地。José Arnaldo Blanco II 于 1936 年创办了它。他的父亲 José Manuel Blanco Lozada 是十九世纪中叶抵达多米尼加共和国的西班牙人。

如今由 José「Jochy」Blanco 主持。他是家族第四代烟农，也是第三代掌门——在一个几乎所有招牌都已易主的行业里，这样的延续并不多见。

1995 年，他把工厂迁入自己创设的一处自由贸易区，位于圣地亚哥郊外的坦博里尔。这片区域名为 La Palma，人们常把区名与公司名混为一谈，根源正在于此。厂内员工三百五十余人，其中十之七八为女性。

工厂卷制自有品牌 La Galera，也为别人代工：为 Rafael Nodal 生产 Aging Room 与 Swag，还有本图集已收录的 Matilde。Altadis 的 Trinidad Santiago 也由它调配——一家多米尼加工厂做着一支挂古巴名字的雪茄，这倒相当准确地概括了这个国家。',

 'تاباكاليرا بالما ليست علامة، بل المصنع الذي تخرج منه أربع من علامات هذا الأطلس. أسّسه خوسيه أرنالدو بلانكو الثاني عام 1936. وكان أبوه، خوسيه مانويل بلانكو لوثادا، إسبانيًا وصل إلى الجمهورية الدومينيكية في منتصف القرن التاسع عشر.

ويديره اليوم خوسيه «خوتشي» بلانكو. وهو الجيل الرابع من مزارعي العائلة والثالث على رأس الدار — وهو تواصل نادر في مهنة بدّل فيها كلّ اسم تقريبًا أصحابه.

وفي 1995 نقل المصنع إلى منطقة حرّة أنشأها بنفسه، في تامبوريل بضواحي سانتياغو. واسمها «لا بالما»، ومن هنا يأتي الخلط المتكرّر بين اسم المنطقة واسم الشركة. ويعمل فيه أكثر من ثلاثمئة وخمسين شخصًا، أكثر من سبعة من كلّ عشرة منهم نساء.

يلفّ المصنع علامته الخاصة «لا غاليرا»، ويصنع لغيره: «إيجينغ روم» و«سواغ» لرافاييل نودال، و«ماتيلدي» التي يضمّها هذا الأطلس. وهو أيضًا الذي يمزج «ترينيداد سانتياغو» لألتاديس — مصنع دومينيكي يصنع سيجارًا باسم كوبي، وهو ما يلخّص هذا البلد تلخيصًا لا بأس به.',

 '[{"name":"La Galera","color":"#8B5A2B","force":"Medium","wrapper":"Dominican blends, varied wrappers","vitolas":["Robusto","Toro","Corona"],"story":"The factory''s own brand, and the only one it signs with its own name. The word names the rolling floor itself — the room where the torcedores work in rows."}]',

 '[{"name":"La Galera","color":"#8B5A2B","force":"Medium","wrapper":"Ligadas dominicanas, capas variadas","vitolas":["Robusto","Toro","Corona"],"story":"La marca propia de la fábrica, y la única que firma con su nombre. La palabra designa la propia sala de liado: el lugar donde los torcedores trabajan en filas."}]',

 '[{"name":"La Galera","color":"#8B5A2B","force":"Medium","wrapper":"Dominikanische Mischungen, wechselnde Deckblätter","vitolas":["Robusto","Toro","Corona"],"story":"Die eigene Marke der Fabrik und die einzige, die sie mit ihrem Namen zeichnet. Das Wort bezeichnet den Rollsaal selbst — den Raum, in dem die Torcedores in Reihen arbeiten."}]',

 '[{"name":"La Galera","color":"#8B5A2B","force":"Medium","wrapper":"多米尼加配方，茄衣不一","vitolas":["Robusto","Toro","Corona"],"story":"工厂的自有品牌，也是它唯一以自己名字署名的品牌。这个词本指卷制车间——卷烟师成排工作的那间屋子。"}]',

 '[{"name":"La Galera","color":"#8B5A2B","force":"Medium","wrapper":"مزائج دومينيكية بأغلفة متنوّعة","vitolas":["Robusto","Toro","Corona"],"story":"العلامة الخاصة بالمصنع، والوحيدة التي يوقّعها باسمه. والكلمة تسمّي قاعة اللفّ نفسها — الغرفة التي يعمل فيها اللافّون صفوفًا."}]'),

-- ── Aging Room ───────────────────────────────────────────
('Aging Room', 'dominican', '2011 — Rép. dominicaine ; Rafael Nodal',
 'Tabacalera Palma, Tamboril (José « Jochy » Blanco)',

 'Aging Room est née de la rencontre de deux hommes que l''atlas porte désormais l''un et l''autre : Rafael Nodal, qui compose, et José « Jochy » Blanco, qui fabrique. La marque paraît en 2011.

Nodal est cubain, né en 1964, arrivé aux États-Unis comme demandeur d''asile. En 2002, avec sa femme Alina Cordoves Nodal et Hank Bischoff, il rachète la Habana Cuba Cigar Company de Miami et la renomme Boutique Blends. Jochy Blanco est lui aussi associé de la maison — le fabricant et le donneur d''ordre sont partenaires, ce qui n''est pas la règle dans ce métier.

Tout sort de la Tabacalera Palma, à Tamboril. Le nom de la marque dit le parti pris : la salle de vieillissement. Le Bin No. 1 est bâti sur des tabacs de 1999 et 2001 gardés de la vallée du Cibao, ce qui suppose d''avoir eu la place, la patience et la trésorerie pour les garder.

Le portefeuille a été entièrement revu en 2018. Nodal, lui, est aussi passé chez Tabacalera USA : c''est à ce titre qu''il a revu la composition du Trinidad Santiago pour Altadis — assemblé, là encore, par Jochy Blanco.',

 '[{"name":"Quattro","color":"#8B4513","force":"Medium-Full","wrapper":"Habano","vitolas":["Maestro","Concerto","Espressivo"],"story":"La gamme la plus large, aux vitoles nommées en vocabulaire musical — Nodal est musicien de formation. Format carré à la base, ce qui est rare."},{"name":"Small Batch","color":"#6B4226","force":"Full","wrapper":"Habano","vitolas":["M356","F55"],"story":"Les séries courtes de la maison, désignées par un code plutôt que par un nom. C''est la gamme qui a fait connaître la marque."},{"name":"Bin No. 1","color":"#4A2C1A","force":"Medium-Full","wrapper":"Dominicain","vitolas":["Bin No. 1"],"story":"Bâtie sur des tabacs de 1999 et 2001 gardés de la vallée du Cibao. Le nom désigne le casier de vieillissement — la marque entière tient dans cette idée."},{"name":"Pelo de Oro","color":"#A0522D","force":"Medium","wrapper":"Pelo de Oro","vitolas":["Rondo","Mezzo"],"story":"Du nom d''une variété cubaine ancienne, difficile à cultiver et longtemps abandonnée pour cette raison. Lancée en 2016."}]',

 'Aging Room came out of the meeting of two men this atlas now holds side by side: Rafael Nodal, who blends, and José "Jochy" Blanco, who makes. The brand appeared in 2011.

Nodal is Cuban, born in 1964, and reached the United States as an asylum seeker. In 2002, with his wife Alina Cordoves Nodal and Hank Bischoff, he bought Miami''s Habana Cuba Cigar Company and renamed it Boutique Blends. Jochy Blanco is also a partner in the house — maker and commissioner are partners, which is not the rule in this trade.

Everything comes out of Tabacalera Palma, at Tamboril. The brand''s name states the stance: the ageing room. Bin No. 1 is built on tobaccos from 1999 and 2001 held back from the Cibao Valley, which presupposes the space, the patience and the cash to hold them.

The portfolio was entirely reworked in 2018. Nodal himself also moved to Tabacalera USA: it is in that capacity that he reblended Altadis''s Trinidad Santiago — made, once again, by Jochy Blanco.',

 'Aging Room nace del encuentro de dos hombres que el atlas recoge ahora uno junto a otro: Rafael Nodal, que liga, y José «Jochy» Blanco, que fabrica. La marca aparece en 2011.

Nodal es cubano, nacido en 1964, y llegó a Estados Unidos como solicitante de asilo. En 2002, con su mujer Alina Cordoves Nodal y Hank Bischoff, compra la Habana Cuba Cigar Company de Miami y la rebautiza Boutique Blends. Jochy Blanco es también socio de la casa: el fabricante y quien encarga son socios, lo que no es la regla en este oficio.

Todo sale de la Tabacalera Palma, en Tamboril. El nombre de la marca dice la apuesta: la sala de añejamiento. El Bin No. 1 se construye sobre tabacos de 1999 y 2001 guardados del valle del Cibao, lo que supone haber tenido el sitio, la paciencia y la caja para guardarlos.

La cartera se rehízo por entero en 2018. Nodal, por su parte, pasó también a Tabacalera USA: es a ese título que rehizo la ligada del Trinidad Santiago de Altadis, fabricado, una vez más, por Jochy Blanco.',

 'Aging Room entstand aus der Begegnung zweier Männer, die dieser Atlas nun nebeneinander führt: Rafael Nodal, der mischt, und José "Jochy" Blanco, der fertigt. Die Marke erschien 2011.

Nodal ist Kubaner, 1964 geboren, und kam als Asylsuchender in die Vereinigten Staaten. 2002 kaufte er mit seiner Frau Alina Cordoves Nodal und Hank Bischoff die Habana Cuba Cigar Company in Miami und benannte sie in Boutique Blends um. Auch Jochy Blanco ist Teilhaber des Hauses — Hersteller und Auftraggeber sind Partner, was in diesem Gewerbe nicht die Regel ist.

Alles kommt aus der Tabacalera Palma in Tamboril. Der Name der Marke nennt die Haltung: der Reiferaum. Bin No. 1 beruht auf Tabaken von 1999 und 2001, die aus dem Cibao-Tal zurückgehalten wurden — was Platz, Geduld und Geld voraussetzt.

Das Sortiment wurde 2018 vollständig überarbeitet. Nodal selbst wechselte außerdem zu Tabacalera USA: in dieser Eigenschaft mischte er die Trinidad Santiago von Altadis neu — gefertigt, wieder einmal, von Jochy Blanco.',

 'Aging Room 源于两个人的相遇，本图集如今把他们并列收录：调配的 Rafael Nodal，与制造的 José「Jochy」Blanco。品牌于 2011 年问世。

Nodal 是古巴人，1964 年生，以寻求庇护者的身份抵达美国。2002 年，他与妻子 Alina Cordoves Nodal 及 Hank Bischoff 一同买下迈阿密的 Habana Cuba Cigar Company，更名为 Boutique Blends。Jochy Blanco 同样是这家公司的股东——制造者与委托者互为合伙人，这在业内并非常态。

一切均出自坦博里尔的 Tabacalera Palma。品牌之名道出了其主张：陈化室。Bin No. 1 建立在 1999 与 2001 年从西宝谷留存下来的烟叶之上，这需要有地方、有耐心，也要有资金去留住它们。

产品线于 2018 年整体重整。Nodal 本人则转入 Tabacalera USA：正是以此身份，他重新调配了 Altadis 的 Trinidad Santiago——制造者，又一次，是 Jochy Blanco。',

 'وُلدت «إيجينغ روم» من لقاء رجلين يضمّهما هذا الأطلس اليوم جنبًا إلى جنب: رافاييل نودال الذي يمزج، وخوسيه «خوتشي» بلانكو الذي يصنع. وظهرت العلامة عام 2011.

نودال كوبيّ من مواليد 1964، وصل إلى الولايات المتحدة طالبَ لجوء. وفي 2002 اشترى مع زوجته ألينا كوردوفيس نودال وهانك بيشوف شركة «هابانا كوبا سيغار» في ميامي وأعاد تسميتها «بوتيك بلندز». وخوتشي بلانكو شريك في الدار كذلك — فالصانع وصاحب الطلب شريكان، وليست تلك قاعدة هذه المهنة.

ويخرج كلّ شيء من تاباكاليرا بالما في تامبوريل. واسم العلامة يقول الموقف: غرفة التعتيق. أمّا «Bin No. 1» فمبنيّ على أتبغة من 1999 و2001 احتُفِظ بها من وادي سيباو، وهو ما يفترض توافر المكان والصبر والمال للاحتفاظ بها.

وأُعيد تكوين المجموعة بالكامل عام 2018. أمّا نودال فانتقل إلى «تاباكاليرا يو إس إيه»، وبهذه الصفة أعاد تركيب مزيج «ترينيداد سانتياغو» لألتاديس — من صنع خوتشي بلانكو، مرّة أخرى.',

 '[{"name":"Quattro","color":"#8B4513","force":"Medium-Full","wrapper":"Habano","vitolas":["Maestro","Concerto","Espressivo"],"story":"The widest range, its vitolas named in musical vocabulary — Nodal trained as a musician. Box-pressed at the base, which is uncommon."},{"name":"Small Batch","color":"#6B4226","force":"Full","wrapper":"Habano","vitolas":["M356","F55"],"story":"The house''s short runs, designated by a code rather than a name. This is the range that made the brand known."},{"name":"Bin No. 1","color":"#4A2C1A","force":"Medium-Full","wrapper":"Dominican","vitolas":["Bin No. 1"],"story":"Built on tobaccos from 1999 and 2001 held back from the Cibao Valley. The name is the ageing bin — the whole brand is in that idea."},{"name":"Pelo de Oro","color":"#A0522D","force":"Medium","wrapper":"Pelo de Oro","vitolas":["Rondo","Mezzo"],"story":"Named for an old Cuban variety, hard to grow and long abandoned for that reason. Launched in 2016."}]',

 '[{"name":"Quattro","color":"#8B4513","force":"Medium-Full","wrapper":"Habano","vitolas":["Maestro","Concerto","Espressivo"],"story":"La gama más amplia, con vitolas nombradas en vocabulario musical: Nodal es músico de formación. De base cuadrada, lo que es raro."},{"name":"Small Batch","color":"#6B4226","force":"Full","wrapper":"Habano","vitolas":["M356","F55"],"story":"Las series cortas de la casa, designadas por un código y no por un nombre. Es la gama que dio a conocer la marca."},{"name":"Bin No. 1","color":"#4A2C1A","force":"Medium-Full","wrapper":"Dominicana","vitolas":["Bin No. 1"],"story":"Construida sobre tabacos de 1999 y 2001 guardados del valle del Cibao. El nombre designa el cajón de añejamiento: la marca entera cabe en esa idea."},{"name":"Pelo de Oro","color":"#A0522D","force":"Medium","wrapper":"Pelo de Oro","vitolas":["Rondo","Mezzo"],"story":"Del nombre de una variedad cubana antigua, difícil de cultivar y por eso mucho tiempo abandonada. Lanzada en 2016."}]',

 '[{"name":"Quattro","color":"#8B4513","force":"Medium-Full","wrapper":"Habano","vitolas":["Maestro","Concerto","Espressivo"],"story":"Die breiteste Linie, ihre Vitolas nach musikalischem Vokabular benannt — Nodal ist ausgebildeter Musiker. Im Ansatz box-pressed, was selten ist."},{"name":"Small Batch","color":"#6B4226","force":"Full","wrapper":"Habano","vitolas":["M356","F55"],"story":"Die kurzen Serien des Hauses, mit einem Code statt eines Namens bezeichnet. Diese Linie hat die Marke bekannt gemacht."},{"name":"Bin No. 1","color":"#4A2C1A","force":"Medium-Full","wrapper":"Dominikanisch","vitolas":["Bin No. 1"],"story":"Auf Tabaken von 1999 und 2001 aufgebaut, die aus dem Cibao-Tal zurückgehalten wurden. Der Name bezeichnet das Reifefach — die ganze Marke steckt in diesem Gedanken."},{"name":"Pelo de Oro","color":"#A0522D","force":"Medium","wrapper":"Pelo de Oro","vitolas":["Rondo","Mezzo"],"story":"Benannt nach einer alten kubanischen Sorte, schwer anzubauen und deshalb lange aufgegeben. 2016 herausgebracht."}]',

 '[{"name":"Quattro","color":"#8B4513","force":"Medium-Full","wrapper":"Habano","vitolas":["Maestro","Concerto","Espressivo"],"story":"最齐全的一条线，尺寸以音乐术语命名——Nodal 出身音乐科班。基本款为方压形制，这并不多见。"},{"name":"Small Batch","color":"#6B4226","force":"Full","wrapper":"Habano","vitolas":["M356","F55"],"story":"这家的小批量系列，以代号而非名称标示。正是这条线让品牌为人所知。"},{"name":"Bin No. 1","color":"#4A2C1A","force":"Medium-Full","wrapper":"多米尼加","vitolas":["Bin No. 1"],"story":"建立在 1999 与 2001 年从西宝谷留存的烟叶之上。名字指的是陈化格——整个品牌的理念都在这个词里。"},{"name":"Pelo de Oro","color":"#A0522D","force":"Medium","wrapper":"Pelo de Oro","vitolas":["Rondo","Mezzo"],"story":"取自一个古老的古巴烟草品种之名，因难以栽培而长期被弃用。2016 年推出。"}]',

 '[{"name":"Quattro","color":"#8B4513","force":"Medium-Full","wrapper":"هابانو","vitolas":["Maestro","Concerto","Espressivo"],"story":"أوسع السلاسل، ومقاساتها مسمّاة بمفردات موسيقية — فنودال موسيقيّ التكوين. وشكلها الأساسي مكبوس مربّع، وهو قليل."},{"name":"Small Batch","color":"#6B4226","force":"Full","wrapper":"هابانو","vitolas":["M356","F55"],"story":"دفعات الدار القصيرة، تُسمّى برمز لا باسم. وهي السلسلة التي عرّفت بالعلامة."},{"name":"Bin No. 1","color":"#4A2C1A","force":"Medium-Full","wrapper":"دومينيكي","vitolas":["Bin No. 1"],"story":"مبنيّ على أتبغة من 1999 و2001 احتُفِظ بها من وادي سيباو. والاسم يعني خانة التعتيق — والعلامة كلّها في هذه الفكرة."},{"name":"Pelo de Oro","color":"#A0522D","force":"Medium","wrapper":"بيلو دي أورو","vitolas":["Rondo","Mezzo"],"story":"باسم صنف كوبي قديم صعب الزراعة، ولهذا هُجر طويلًا. أُطلقت عام 2016."}]'),

-- ── Swag ─────────────────────────────────────────────────
('Swag', 'dominican', 'Boutique Blends ; roulé chez Tabacalera Palma',
 'Tabacalera Palma, Tamboril (José « Jochy » Blanco)',

 'Swag est la seconde marque de Boutique Blends, la maison de Rafael Nodal que cet atlas porte déjà. Elle sort du même atelier qu''Aging Room : la Tabacalera Palma de Jochy Blanco, à Tamboril.

Les deux marques ne visent pas le même fumeur, et c''est tout leur intérêt côte à côte. Aging Room parle de vieillissement, de casiers et de millésimes ; Swag prend un nom d''argot américain et une identité graphique franche. La première s''adresse au collectionneur, la seconde à qui veut un bon cigare sans cérémonie.

Boutique Blends porte aussi King Havano et les cigares vendus sous l''étiquette Oliveros — ce qui explique pourquoi Oliveros n''a pas de fiche séparée dans cet atlas : ce n''est pas une maison, c''est une étiquette de cette maison-là.',

 '[{"name":"Swag","color":"#3A3A3A","force":"Medium","wrapper":"Assemblages dominicains, capes variées","vitolas":["Robusto","Toro","Belicoso"],"story":"Déclinée en séries distinguées par la couleur plutôt que par un nom de gamme. Même atelier qu''Aging Room, même famille de tabacs, un registre plus direct et un prix plus bas."}]',

 'Swag is the second brand of Boutique Blends, Rafael Nodal''s house, which this atlas already holds. It comes out of the same workshop as Aging Room: Jochy Blanco''s Tabacalera Palma, at Tamboril.

The two brands do not aim at the same smoker, and that is exactly what makes them interesting side by side. Aging Room speaks of ageing, of bins and of vintages; Swag takes an American slang name and a blunt graphic identity. The first addresses the collector, the second whoever wants a good cigar without ceremony.

Boutique Blends also carries King Havano and the cigars sold under the Oliveros label — which is why Oliveros has no separate entry in this atlas: it is not a house, it is a label of that house.',

 'Swag es la segunda marca de Boutique Blends, la casa de Rafael Nodal que este atlas ya recoge. Sale del mismo taller que Aging Room: la Tabacalera Palma de Jochy Blanco, en Tamboril.

Las dos marcas no apuntan al mismo fumador, y ahí está todo su interés una junto a otra. Aging Room habla de añejamiento, de cajones y de añadas; Swag toma un nombre de argot estadounidense y una identidad gráfica franca. La primera se dirige al coleccionista, la segunda a quien quiere un buen puro sin ceremonia.

Boutique Blends lleva además King Havano y los puros vendidos bajo la etiqueta Oliveros, lo que explica por qué Oliveros no tiene ficha aparte en este atlas: no es una casa, es una etiqueta de esa casa.',

 'Swag ist die zweite Marke von Boutique Blends, dem Haus von Rafael Nodal, das dieser Atlas bereits führt. Sie kommt aus derselben Werkstatt wie Aging Room: Jochy Blancos Tabacalera Palma in Tamboril.

Die beiden Marken zielen nicht auf denselben Raucher, und genau das macht sie nebeneinander interessant. Aging Room spricht von Reifung, von Fächern und Jahrgängen; Swag nimmt einen amerikanischen Slangnamen und eine unverblümte Grafik. Die erste wendet sich an den Sammler, die zweite an alle, die eine gute Zigarre ohne Zeremonie wollen.

Boutique Blends führt außerdem King Havano und die unter dem Label Oliveros verkauften Zigarren — weshalb Oliveros in diesem Atlas keinen eigenen Eintrag hat: Es ist kein Haus, sondern ein Label dieses Hauses.',

 'Swag 是 Boutique Blends 的第二个品牌——本图集已收录 Rafael Nodal 的这家公司。它与 Aging Room 出自同一间作坊：Jochy Blanco 位于坦博里尔的 Tabacalera Palma。

两个品牌面向的并非同一类烟客，而这正是把它们并置的意义。Aging Room 谈的是陈化、格位与年份；Swag 则取了一个美式俚语名字和一套直白的视觉。前者面向收藏者，后者面向想要一支好雪茄却不讲排场的人。

Boutique Blends 旗下还有 King Havano，以及以 Oliveros 标签出售的雪茄——这也说明了为何本图集不为 Oliveros 单列条目：它不是一家公司，而是这家公司的一个标签。',

 '«سواغ» هي العلامة الثانية لـ«بوتيك بلندز»، دار رافاييل نودال التي يضمّها هذا الأطلس. وتخرج من الورشة نفسها التي تخرج منها «إيجينغ روم»: تاباكاليرا بالما لخوتشي بلانكو في تامبوريل.

ولا تقصد العلامتان المدخّن نفسه، وهنا تحديدًا تكمن فائدة وضعهما جنبًا إلى جنب. تتحدّث «إيجينغ روم» عن التعتيق والخانات والسنوات؛ أمّا «سواغ» فتأخذ اسمًا من العاميّة الأمريكية وهويّة بصرية صريحة. الأولى تخاطب الجامع، والثانية من يريد سيجارًا جيّدًا بلا مراسم.

وتحمل «بوتيك بلندز» أيضًا «كينغ هافانو» والسيجار المباع تحت علامة «أوليفيروس» — وهذا يفسّر لماذا لا بطاقة منفصلة لأوليفيروس في هذا الأطلس: فهي ليست دارًا، بل علامة تابعة لتلك الدار.',

 '[{"name":"Swag","color":"#3A3A3A","force":"Medium","wrapper":"Dominican blends, varied wrappers","vitolas":["Robusto","Toro","Belicoso"],"story":"Offered in series told apart by colour rather than by a range name. Same workshop as Aging Room, same family of tobaccos, a more direct register and a lower price."}]',

 '[{"name":"Swag","color":"#3A3A3A","force":"Medium","wrapper":"Ligadas dominicanas, capas variadas","vitolas":["Robusto","Toro","Belicoso"],"story":"Se declina en series distinguidas por el color y no por un nombre de gama. Mismo taller que Aging Room, misma familia de tabacos, un registro más directo y un precio más bajo."}]',

 '[{"name":"Swag","color":"#3A3A3A","force":"Medium","wrapper":"Dominikanische Mischungen, wechselnde Deckblätter","vitolas":["Robusto","Toro","Belicoso"],"story":"In Serien angeboten, die sich durch die Farbe statt durch einen Linien­namen unterscheiden. Dieselbe Werkstatt wie Aging Room, dieselbe Tabakfamilie, ein direkteres Register und ein niedrigerer Preis."}]',

 '[{"name":"Swag","color":"#3A3A3A","force":"Medium","wrapper":"多米尼加配方，茄衣不一","vitolas":["Robusto","Toro","Belicoso"],"story":"以颜色而非系列名称来区分各款。与 Aging Room 同一作坊、同一族烟叶，风格更直接，价格也更低。"}]',

 '[{"name":"Swag","color":"#3A3A3A","force":"Medium","wrapper":"مزائج دومينيكية بأغلفة متنوّعة","vitolas":["Robusto","Toro","Belicoso"],"story":"تُقدَّم في سلاسل يفرّق بينها اللون لا اسم الخطّ. الورشة نفسها التي لـ«إيجينغ روم»، وعائلة التبغ نفسها، بمزاج مباشر وسعر أدنى."}]'),

-- ── Kristoff ─────────────────────────────────────────────
('Kristoff', 'dominican', '2004 — Glen Case, Chicago ; roulé à Santiago',
 'Tabacalera von Eicken (ex-Charles Fairmorn), Santiago, Rép. dominicaine',

 'Kristoff est née d''une visite que son fondateur n''avait pas sollicitée. En 2004, Rolando Villamil, de la fabrique Charles Fairmorn en République dominicaine, se rend à Chicago pour proposer à Glen Case et à sa femme de représenter aux États-Unis des cigares qu''il comptait fabriquer.

Case travaillait dans la finance. Il accepte l''invitation à venir voir la fabrique, y va — et en revient avec une autre idée : composer ses propres assemblages sur place, Villamil se chargeant de la production. Il quitte la finance et fonde Kristoff la même année.

La fabrique a changé de nom depuis : Charles Fairmorn est devenue la Tabacalera von Eicken, à Santiago. La marque y est restée.

Le tabac, lui, vient de partout — Honduras, Nicaragua, République dominicaine, Brésil, Équateur, Connecticut, Pennsylvanie, Afrique. C''est le contraire de la logique de terroir, et c''est assumé : ce qui définit un Kristoff n''est pas une origine mais une composition.',

 '[{"name":"Kristoff Sumatra","color":"#8B5A2B","force":"Medium","wrapper":"Sumatra","vitolas":["Robusto","Torpedo","Churchill"],"story":"L''une des premières gammes de la maison. Cape de Sumatra sur un assemblage puisé dans plusieurs pays — le principe de la marque dès l''origine."},{"name":"Kristoff San Andrés","color":"#3A2A20","force":"Full","wrapper":"San Andrés du Mexique","vitolas":["Robusto","Toro"],"story":"Le versant corsé, sous cape mexicaine. C''est la gamme qui a le plus élargi l''audience de la marque."},{"name":"Kristoff Nicaragua","color":"#6B4226","force":"Medium-Full","wrapper":"Nicaragua","vitolas":["Robusto","Toro"],"story":"Une gamme nicaraguayenne faite dans une fabrique dominicaine : la marque assemble d''où elle veut, et ne s''en cache pas."},{"name":"685 Woodlawn","color":"#4A2C1A","force":"Medium","wrapper":"Assemblage multi-origines","vitolas":["Robusto","Toro"],"story":"Le nom est une adresse — celle de la maison d''enfance de Glen Case. Une des rares gammes de la marque à porter une référence personnelle."}]',

 'Kristoff was born of a visit its founder had not asked for. In 2004 Rolando Villamil, of the Charles Fairmorn factory in the Dominican Republic, went to Chicago to ask Glen Case and his wife to represent in the United States the cigars he intended to make.

Case worked in finance. He accepted the invitation to come and see the factory, went — and came back with a different idea: to blend his own cigars there, with Villamil overseeing production. He left finance and founded Kristoff the same year.

The factory has since changed its name: Charles Fairmorn became Tabacalera von Eicken, in Santiago. The brand stayed.

The tobacco, for its part, comes from everywhere — Honduras, Nicaragua, the Dominican Republic, Brazil, Ecuador, Connecticut, Pennsylvania, Africa. It is the opposite of a terroir logic, and it is deliberate: what defines a Kristoff is not an origin but a composition.',

 'Kristoff nació de una visita que su fundador no había pedido. En 2004, Rolando Villamil, de la fábrica Charles Fairmorn en la República Dominicana, va a Chicago a proponer a Glen Case y a su mujer que representen en Estados Unidos unos puros que pensaba fabricar.

Case trabajaba en finanzas. Acepta la invitación a ver la fábrica, va, y vuelve con otra idea: ligar allí sus propias mezclas, encargándose Villamil de la producción. Deja las finanzas y funda Kristoff ese mismo año.

La fábrica ha cambiado de nombre desde entonces: Charles Fairmorn se convirtió en Tabacalera von Eicken, en Santiago. La marca se quedó.

El tabaco, en cambio, viene de todas partes: Honduras, Nicaragua, República Dominicana, Brasil, Ecuador, Connecticut, Pensilvania, África. Es lo contrario de una lógica de terruño, y está asumido: lo que define a un Kristoff no es un origen sino una composición.',

 'Kristoff entstand aus einem Besuch, um den ihr Gründer nicht gebeten hatte. 2004 fuhr Rolando Villamil von der Fabrik Charles Fairmorn in der Dominikanischen Republik nach Chicago, um Glen Case und seiner Frau vorzuschlagen, in den Vereinigten Staaten Zigarren zu vertreten, die er herstellen wollte.

Case arbeitete im Finanzwesen. Er nahm die Einladung an, die Fabrik zu besichtigen, fuhr hin — und kam mit einer anderen Idee zurück: dort eigene Mischungen zu komponieren, wobei Villamil die Fertigung übernahm. Er verließ das Finanzwesen und gründete Kristoff im selben Jahr.

Die Fabrik hat seither ihren Namen gewechselt: Aus Charles Fairmorn wurde die Tabacalera von Eicken in Santiago. Die Marke blieb.

Der Tabak dagegen kommt von überall — Honduras, Nicaragua, Dominikanische Republik, Brasilien, Ecuador, Connecticut, Pennsylvania, Afrika. Es ist das Gegenteil einer Terroir-Logik, und es ist gewollt: Was eine Kristoff ausmacht, ist keine Herkunft, sondern eine Zusammensetzung.',

 'Kristoff 起于一次它的创办人并未请求的来访。2004 年，多米尼加共和国 Charles Fairmorn 工厂的 Rolando Villamil 前往芝加哥，想请 Glen Case 夫妇在美国代理他打算生产的雪茄。

Case 当时从事金融。他接受了参观工厂的邀请，去了——回来时却带着另一个想法：在那里调配自己的配方，由 Villamil 负责生产。他离开金融业，同年创办了 Kristoff。

工厂此后改了名：Charles Fairmorn 成了圣地亚哥的 Tabacalera von Eicken。品牌留了下来。

至于烟叶，则来自四面八方——洪都拉斯、尼加拉瓜、多米尼加共和国、巴西、厄瓜多尔、康涅狄格、宾夕法尼亚、非洲。这与风土逻辑正相反，而且是有意为之：定义一支 Kristoff 的不是产地，而是配方。',

 'وُلدت «كريستوف» من زيارة لم يطلبها مؤسّسها. ففي 2004 قصد رولاندو بياميل، من مصنع تشارلز فيرمورن في الجمهورية الدومينيكية، مدينة شيكاغو ليعرض على غلين كيس وزوجته تمثيل سيجار كان ينوي صنعه في الولايات المتحدة.

كان كيس يعمل في المال. قبل الدعوة لزيارة المصنع، وذهب — ثمّ عاد بفكرة أخرى: أن يمزج تركيباته الخاصة هناك، على أن يتولّى بياميل الإنتاج. فترك المال وأسّس «كريستوف» في العام نفسه.

وقد غيّر المصنع اسمه منذ ذلك الحين: صار «تشارلز فيرمورن» تاباكاليرا فون آيكن في سانتياغو. أمّا العلامة فبقيت.

أمّا التبغ فيأتي من كلّ مكان — هندوراس، ونيكاراغوا، والجمهورية الدومينيكية، والبرازيل، والإكوادور، وكونيتيكت، وبنسلفانيا، وأفريقيا. إنّه نقيض منطق الأرض، وهو مقصود: فما يحدّد سيجار «كريستوف» ليس منشأً بل تركيبة.',

 '[{"name":"Kristoff Sumatra","color":"#8B5A2B","force":"Medium","wrapper":"Sumatra","vitolas":["Robusto","Torpedo","Churchill"],"story":"One of the house''s first ranges. Sumatra wrapper over a blend drawn from several countries — the brand''s principle from the start."},{"name":"Kristoff San Andrés","color":"#3A2A20","force":"Full","wrapper":"Mexican San Andrés","vitolas":["Robusto","Toro"],"story":"The fuller side, under a Mexican wrapper. It is the range that has most widened the brand''s audience."},{"name":"Kristoff Nicaragua","color":"#6B4226","force":"Medium-Full","wrapper":"Nicaragua","vitolas":["Robusto","Toro"],"story":"A Nicaraguan range made in a Dominican factory: the brand blends from wherever it likes, and does not hide it."},{"name":"685 Woodlawn","color":"#4A2C1A","force":"Medium","wrapper":"Multi-origin blend","vitolas":["Robusto","Toro"],"story":"The name is an address — that of Glen Case''s childhood home. One of the brand''s few ranges to carry a personal reference."}]',

 '[{"name":"Kristoff Sumatra","color":"#8B5A2B","force":"Medium","wrapper":"Sumatra","vitolas":["Robusto","Torpedo","Churchill"],"story":"Una de las primeras gamas de la casa. Capa de Sumatra sobre una ligada tomada de varios países: el principio de la marca desde el origen."},{"name":"Kristoff San Andrés","color":"#3A2A20","force":"Full","wrapper":"San Andrés de México","vitolas":["Robusto","Toro"],"story":"La vertiente con más cuerpo, bajo capa mexicana. Es la gama que más ha ampliado el público de la marca."},{"name":"Kristoff Nicaragua","color":"#6B4226","force":"Medium-Full","wrapper":"Nicaragua","vitolas":["Robusto","Toro"],"story":"Una gama nicaragüense hecha en una fábrica dominicana: la marca liga de donde quiere, y no lo oculta."},{"name":"685 Woodlawn","color":"#4A2C1A","force":"Medium","wrapper":"Ligada de varios orígenes","vitolas":["Robusto","Toro"],"story":"El nombre es una dirección: la de la casa de infancia de Glen Case. Una de las pocas gamas de la marca con una referencia personal."}]',

 '[{"name":"Kristoff Sumatra","color":"#8B5A2B","force":"Medium","wrapper":"Sumatra","vitolas":["Robusto","Torpedo","Churchill"],"story":"Eine der ersten Linien des Hauses. Sumatra-Deckblatt über einer aus mehreren Ländern geschöpften Mischung — das Prinzip der Marke von Anfang an."},{"name":"Kristoff San Andrés","color":"#3A2A20","force":"Full","wrapper":"Mexikanisches San Andrés","vitolas":["Robusto","Toro"],"story":"Die kräftigere Seite, unter mexikanischem Deckblatt. Diese Linie hat das Publikum der Marke am stärksten erweitert."},{"name":"Kristoff Nicaragua","color":"#6B4226","force":"Medium-Full","wrapper":"Nicaragua","vitolas":["Robusto","Toro"],"story":"Eine nicaraguanische Linie, in einer dominikanischen Fabrik gefertigt: Die Marke mischt, woher sie will, und verbirgt es nicht."},{"name":"685 Woodlawn","color":"#4A2C1A","force":"Medium","wrapper":"Mischung mehrerer Herkünfte","vitolas":["Robusto","Toro"],"story":"Der Name ist eine Adresse — die des Elternhauses von Glen Case. Eine der wenigen Linien der Marke mit persönlichem Bezug."}]',

 '[{"name":"Kristoff Sumatra","color":"#8B5A2B","force":"Medium","wrapper":"苏门答腊","vitolas":["Robusto","Torpedo","Churchill"],"story":"这家最早的系列之一。苏门答腊茄衣，内里取自数国烟叶——这正是品牌自始至终的原则。"},{"name":"Kristoff San Andrés","color":"#3A2A20","force":"Full","wrapper":"墨西哥圣安德烈斯","vitolas":["Robusto","Toro"],"story":"较浓的一侧，采用墨西哥茄衣。这是最大幅拓宽品牌受众的一条线。"},{"name":"Kristoff Nicaragua","color":"#6B4226","force":"Medium-Full","wrapper":"尼加拉瓜","vitolas":["Robusto","Toro"],"story":"在多米尼加工厂制作的尼加拉瓜系列：品牌想从哪里取叶就从哪里取，并不掩饰。"},{"name":"685 Woodlawn","color":"#4A2C1A","force":"Medium","wrapper":"多产地配方","vitolas":["Robusto","Toro"],"story":"名字是一个门牌号——Glen Case 儿时住所的地址。这是品牌少数带有私人指涉的系列之一。"}]',

 '[{"name":"Kristoff Sumatra","color":"#8B5A2B","force":"Medium","wrapper":"سومطرة","vitolas":["Robusto","Torpedo","Churchill"],"story":"من أولى سلاسل الدار. غلاف سومطري فوق مزيج مستقًى من بلدان عدّة — وهو مبدأ العلامة منذ البداية."},{"name":"Kristoff San Andrés","color":"#3A2A20","force":"Full","wrapper":"سان أندريس المكسيكي","vitolas":["Robusto","Toro"],"story":"الوجه الأقوى، تحت غلاف مكسيكي. وهي السلسلة التي وسّعت جمهور العلامة أكثر من غيرها."},{"name":"Kristoff Nicaragua","color":"#6B4226","force":"Medium-Full","wrapper":"نيكاراغوا","vitolas":["Robusto","Toro"],"story":"سلسلة نيكاراغوية تُصنع في مصنع دومينيكي: تمزج العلامة من حيث تشاء، ولا تخفي ذلك."},{"name":"685 Woodlawn","color":"#4A2C1A","force":"Medium","wrapper":"مزيج متعدّد المنشأ","vitolas":["Robusto","Toro"],"story":"الاسم عنوان — عنوان بيت طفولة غلين كيس. وهي من السلاسل القليلة في العلامة التي تحمل إشارة شخصية."}]'),

-- ── Caldwell Cigar Co. ───────────────────────────────────
('Caldwell Cigar Co.', 'dominican', '2014 — Robert Caldwell ; chez Ventura',
 'Tabacalera William Ventura, Rép. dominicaine',

 'Caldwell Cigar Co. naît d''une rupture. Robert Caldwell quitte Wynwood Cigars et revient dans le métier en 2014, sous son propre nom, au salon de l''IPCPR.

Il s''associe à William et Henderson Ventura, à la Tabacalera William Ventura, en République dominicaine. C''est encore une maison sans usine — le modèle que le lot nicaraguayen a rendu visible — mais avec une particularité : Caldwell construit ses assemblages autour de tabacs rares et de millésimes anciens plutôt qu''autour d''une recette reproductible.

La collection de lancement comptait trois assemblages, et leurs noms se répondent : The King is Dead et Long Live the King. Le troisième, Eastern Standard, n''était pas prévu — on a mis entre les mains de Caldwell une feuille de Connecticut particulière, l''essai a tenu, et la gamme est entrée au catalogue.

C''est une manière de travailler qui explique la taille de la maison : ce qu''on ne peut pas se procurer deux fois ne peut pas se produire en grand nombre.',

 '[{"name":"Long Live the King","color":"#6B4226","force":"Medium-Full","wrapper":"Dominicain","vitolas":["Petit Double Wide Short Churchill","Robusto"],"story":"L''une des trois gammes de lancement de 2014, et celle qui a duré. Les noms de vitoles sont volontairement démesurés — la maison joue de l''emphase plutôt que de la sobriété."},{"name":"The King is Dead","color":"#4A2C1A","force":"Full","wrapper":"Dominicain","vitolas":["Premier Regalos"],"story":"L''autre moitié du diptyque de lancement. Les deux gammes se lisent ensemble et n''ont de sens que l''une par rapport à l''autre."},{"name":"Eastern Standard","color":"#C9A96E","force":"Medium","wrapper":"Connecticut","vitolas":["Sungrown","Euro Cut"],"story":"La gamme qui n''était pas prévue. Une feuille de Connecticut particulière a été mise entre les mains de Caldwell, l''essai a tenu, et elle est entrée au catalogue."}]',

 'Caldwell Cigar Co. was born of a break. Robert Caldwell left Wynwood Cigars and returned to the trade in 2014, under his own name, at the IPCPR trade show.

He partnered with William and Henderson Ventura, at Tabacalera William Ventura in the Dominican Republic. It is another house without a factory — the model the Nicaraguan batch made visible — but with a particularity: Caldwell builds his blends around rare tobaccos and old vintages rather than around a repeatable recipe.

The launch collection held three blends, and their names answer one another: The King is Dead and Long Live the King. The third, Eastern Standard, was not planned — a particular Connecticut leaf was put into Caldwell''s hands, the trial held, and the range entered the catalogue.

It is a way of working that explains the size of the house: what cannot be sourced twice cannot be made in quantity.',

 'Caldwell Cigar Co. nace de una ruptura. Robert Caldwell deja Wynwood Cigars y vuelve al oficio en 2014, con su propio nombre, en el salón de la IPCPR.

Se asocia con William y Henderson Ventura, en la Tabacalera William Ventura, en la República Dominicana. Es otra casa sin fábrica — el modelo que el lote nicaragüense hizo visible — pero con una particularidad: Caldwell construye sus ligadas en torno a tabacos raros y añadas antiguas más que en torno a una receta reproducible.

La colección de lanzamiento contaba tres ligadas, y sus nombres se responden: The King is Dead y Long Live the King. La tercera, Eastern Standard, no estaba prevista: se puso en manos de Caldwell una hoja de Connecticut particular, el ensayo funcionó, y la gama entró en el catálogo.

Es una manera de trabajar que explica el tamaño de la casa: lo que no se puede conseguir dos veces no se puede producir en cantidad.',

 'Caldwell Cigar Co. entstand aus einem Bruch. Robert Caldwell verließ Wynwood Cigars und kehrte 2014 unter eigenem Namen ins Gewerbe zurück, auf der IPCPR-Messe.

Er verband sich mit William und Henderson Ventura, in der Tabacalera William Ventura in der Dominikanischen Republik. Es ist ein weiteres Haus ohne Fabrik — das Modell, das die nicaraguanische Reihe sichtbar gemacht hat —, aber mit einer Besonderheit: Caldwell baut seine Mischungen um seltene Tabake und alte Jahrgänge herum, nicht um ein wiederholbares Rezept.

Die Auftaktkollektion umfasste drei Mischungen, und ihre Namen antworten einander: The King is Dead und Long Live the King. Die dritte, Eastern Standard, war nicht geplant — ein besonderes Connecticut-Blatt kam Caldwell in die Hände, der Versuch hielt, und die Linie kam in den Katalog.

Es ist eine Arbeitsweise, die die Größe des Hauses erklärt: Was sich nicht zweimal beschaffen lässt, lässt sich nicht in Menge herstellen.',

 'Caldwell Cigar Co. 生于一次决裂。Robert Caldwell 离开 Wynwood Cigars，于 2014 年以自己的名字在 IPCPR 展会上重返这一行。

他与多米尼加共和国 Tabacalera William Ventura 的 William 和 Henderson Ventura 合作。这又是一家没有自有工厂的公司——正是尼加拉瓜那一批所揭示的模式——但有一点不同：Caldwell 的配方围绕稀有烟叶与陈年份额构建，而非围绕一个可复制的配方。

首发系列有三款配方，名字彼此呼应：The King is Dead 与 Long Live the King。第三款 Eastern Standard 并不在计划之内——有人把一批特别的康涅狄格烟叶交到 Caldwell 手上，试制成功，于是它进入了目录。

这样的做法解释了这家公司的规模：无法二次取得的东西，也就无法大量生产。',

 'وُلدت «كالدويل سيغار» من قطيعة. غادر روبرت كالدويل شركة وينوود سيغارز وعاد إلى المهنة عام 2014 باسمه الخاص، في معرض IPCPR.

وشارك وليام وهندرسون بينتورا في «تاباكاليرا وليام بينتورا» بالجمهورية الدومينيكية. وهي دار أخرى بلا مصنع — النموذج الذي أظهرته الدفعة النيكاراغوية — لكن بخصوصيّة: يبني كالدويل مزائجه حول أتبغة نادرة وسنوات قديمة، لا حول وصفة قابلة للتكرار.

وضمّت مجموعة الإطلاق ثلاثة مزائج تتجاوب أسماؤها: «الملك قد مات» و«عاش الملك». أمّا الثالث، «إيسترن ستاندرد»، فلم يكن مقرّرًا — إذ وُضع بين يدي كالدويل ورق كونيتيكت خاصّ، فنجحت التجربة، ودخل الخطّ الكتالوج.

وهي طريقة عمل تفسّر حجم الدار: ما لا يمكن الحصول عليه مرّتين لا يمكن إنتاجه بكثرة.',

 '[{"name":"Long Live the King","color":"#6B4226","force":"Medium-Full","wrapper":"Dominican","vitolas":["Petit Double Wide Short Churchill","Robusto"],"story":"One of the three launch ranges of 2014, and the one that lasted. The vitola names are deliberately oversized — the house plays on emphasis rather than restraint."},{"name":"The King is Dead","color":"#4A2C1A","force":"Full","wrapper":"Dominican","vitolas":["Premier Regalos"],"story":"The other half of the launch diptych. The two ranges read together and make sense only in relation to one another."},{"name":"Eastern Standard","color":"#C9A96E","force":"Medium","wrapper":"Connecticut","vitolas":["Sungrown","Euro Cut"],"story":"The range that was not planned. A particular Connecticut leaf was put into Caldwell''s hands, the trial held, and it entered the catalogue."}]',

 '[{"name":"Long Live the King","color":"#6B4226","force":"Medium-Full","wrapper":"Dominicana","vitolas":["Petit Double Wide Short Churchill","Robusto"],"story":"Una de las tres gamas de lanzamiento de 2014, y la que ha durado. Los nombres de vitola son deliberadamente desmesurados: la casa juega con el énfasis, no con la sobriedad."},{"name":"The King is Dead","color":"#4A2C1A","force":"Full","wrapper":"Dominicana","vitolas":["Premier Regalos"],"story":"La otra mitad del díptico de lanzamiento. Las dos gamas se leen juntas y solo tienen sentido una respecto de la otra."},{"name":"Eastern Standard","color":"#C9A96E","force":"Medium","wrapper":"Connecticut","vitolas":["Sungrown","Euro Cut"],"story":"La gama que no estaba prevista. Se puso en manos de Caldwell una hoja de Connecticut particular, el ensayo funcionó, y entró en el catálogo."}]',

 '[{"name":"Long Live the King","color":"#6B4226","force":"Medium-Full","wrapper":"Dominikanisch","vitolas":["Petit Double Wide Short Churchill","Robusto"],"story":"Eine der drei Auftaktlinien von 2014 und diejenige, die geblieben ist. Die Vitolanamen sind bewusst überdimensioniert — das Haus spielt mit dem Nachdruck, nicht mit der Zurückhaltung."},{"name":"The King is Dead","color":"#4A2C1A","force":"Full","wrapper":"Dominikanisch","vitolas":["Premier Regalos"],"story":"Die andere Hälfte des Auftaktdiptychons. Die beiden Linien lesen sich zusammen und ergeben nur im Verhältnis zueinander einen Sinn."},{"name":"Eastern Standard","color":"#C9A96E","force":"Medium","wrapper":"Connecticut","vitolas":["Sungrown","Euro Cut"],"story":"Die Linie, die nicht geplant war. Ein besonderes Connecticut-Blatt kam Caldwell in die Hände, der Versuch hielt, und sie kam in den Katalog."}]',

 '[{"name":"Long Live the King","color":"#6B4226","force":"Medium-Full","wrapper":"多米尼加","vitolas":["Petit Double Wide Short Churchill","Robusto"],"story":"2014 年三条首发线之一，也是留存下来的那一条。尺寸名称刻意冗长——这家玩的是夸张，而非克制。"},{"name":"The King is Dead","color":"#4A2C1A","force":"Full","wrapper":"多米尼加","vitolas":["Premier Regalos"],"story":"首发双联作的另一半。两条线须并读，彼此对照才有意义。"},{"name":"Eastern Standard","color":"#C9A96E","force":"Medium","wrapper":"康涅狄格","vitolas":["Sungrown","Euro Cut"],"story":"计划之外的一条线。有人把一批特别的康涅狄格烟叶交到 Caldwell 手上，试制成功，于是进入目录。"}]',

 '[{"name":"Long Live the King","color":"#6B4226","force":"Medium-Full","wrapper":"دومينيكي","vitolas":["Petit Double Wide Short Churchill","Robusto"],"story":"أحد خطوط الإطلاق الثلاثة عام 2014، وهو الذي دام. وأسماء المقاسات مفرطة الطول عن قصد — تلعب الدار على التوكيد لا على الاقتضاب."},{"name":"The King is Dead","color":"#4A2C1A","force":"Full","wrapper":"دومينيكي","vitolas":["Premier Regalos"],"story":"النصف الآخر من ثنائية الإطلاق. يُقرأ الخطّان معًا، ولا معنى لأحدهما إلا بالنسبة إلى الآخر."},{"name":"Eastern Standard","color":"#C9A96E","force":"Medium","wrapper":"كونيتيكت","vitolas":["Sungrown","Euro Cut"],"story":"الخطّ الذي لم يكن مقرّرًا. وُضع بين يدي كالدويل ورق كونيتيكت خاصّ، فنجحت التجربة ودخل الكتالوج."}]'),

-- ── Casa Cuevas ──────────────────────────────────────────
('Casa Cuevas', 'dominican', 'Tabacalera Las Lavas, Santiago — famille Cuevas',
 'Tabacalera Las Lavas, vallée du Cibao, Santiago, Rép. dominicaine',

 'Casa Cuevas est la marque propre d''une fabrique, et la fabrique est celle d''une famille qui plante depuis plus de cent ans.

Juan Cuevas, Espagnol de Santander, quitte l''Espagne au milieu du XIXe siècle et se met à cultiver le tabac dans la province de Pinar del Río, à Cuba. La suite de la famille s''installera en République dominicaine, dans la vallée du Cibao, où elle bâtit la Tabacalera Las Lavas.

Luis Cuevas père la dirige, rejoint par son fils Luis junior. En 2021, Luis junior et son propre fils Alec composent ensemble la gamme Patrimonio et la dédient à Luis père — trois générations sur un même assemblage, ce qui est une manière assez directe de dire ce que le mot veut dire.

La fabrique ne travaille pas que pour elle-même : elle produit aussi pour Gurkha, Sam Leccia et Veritas. C''est la troisième fabrique dominicaine que cet atlas nomme, avec la Tabacalera Palma et la von Eicken — trois adresses derrière une bonne partie du catalogue dominicain.',

 '[{"name":"Casa Cuevas","color":"#8B5A2B","force":"Medium","wrapper":"Habano, Connecticut ou maduro selon les gammes","vitolas":["Robusto","Toro","Belicoso"],"story":"La gamme de base, en tripe longue et entièrement roulée à la Tabacalera Las Lavas. Le tabac vient en partie des champs de la famille, dans la vallée du Cibao."},{"name":"Patrimonio","color":"#4A2C1A","force":"Medium-Full","wrapper":"Assemblage dominicain","vitolas":["Toro","Robusto"],"story":"Composée en 2021 par Luis Cuevas junior et son fils Alec, et dédiée à Luis Cuevas père. Trois générations sur un même assemblage."},{"name":"Sangre Nueva","color":"#6B4226","force":"Medium-Full","wrapper":"Assemblage dominicain","vitolas":["Toro"],"story":"« Sang neuf » — la gamme par laquelle la génération suivante s''est annoncée. Même atelier, même vallée, une composition plus affirmée."}]',

 'Casa Cuevas is a factory''s own brand, and the factory belongs to a family that has been planting for more than a hundred years.

Juan Cuevas, a Spaniard from Santander, left Spain in the middle of the nineteenth century and began growing tobacco in the province of Pinar del Río, in Cuba. The family that followed settled in the Dominican Republic, in the Cibao Valley, where it built Tabacalera Las Lavas.

Luis Cuevas Sr. runs it, joined by his son Luis Jr. In 2021 Luis Jr. and his own son Alec blended the Patrimonio range together and dedicated it to Luis Sr. — three generations on a single blend, which is a fairly direct way of saying what the word means.

The factory does not work for itself alone: it also makes for Gurkha, Sam Leccia and Veritas. It is the third Dominican factory this atlas names, alongside Tabacalera Palma and von Eicken — three addresses behind a good part of the Dominican catalogue.',

 'Casa Cuevas es la marca propia de una fábrica, y la fábrica es la de una familia que planta desde hace más de cien años.

Juan Cuevas, español de Santander, deja España a mediados del siglo XIX y se pone a cultivar tabaco en la provincia de Pinar del Río, en Cuba. La familia que sigue se instalará en la República Dominicana, en el valle del Cibao, donde construye la Tabacalera Las Lavas.

Luis Cuevas padre la dirige, acompañado por su hijo Luis hijo. En 2021, Luis hijo y su propio hijo Alec ligan juntos la gama Patrimonio y se la dedican a Luis padre: tres generaciones sobre una misma ligada, que es una manera bastante directa de decir lo que la palabra significa.

La fábrica no trabaja solo para sí misma: produce también para Gurkha, Sam Leccia y Veritas. Es la tercera fábrica dominicana que este atlas nombra, junto a la Tabacalera Palma y la von Eicken: tres direcciones detrás de buena parte del catálogo dominicano.',

 'Casa Cuevas ist die eigene Marke einer Fabrik, und die Fabrik gehört einer Familie, die seit über hundert Jahren pflanzt.

Juan Cuevas, ein Spanier aus Santander, verließ Spanien Mitte des 19. Jahrhunderts und begann in der Provinz Pinar del Río auf Kuba Tabak anzubauen. Die nachfolgende Familie ließ sich in der Dominikanischen Republik nieder, im Cibao-Tal, wo sie die Tabacalera Las Lavas errichtete.

Luis Cuevas senior führt sie, unterstützt von seinem Sohn Luis junior. 2021 mischten Luis junior und dessen eigener Sohn Alec gemeinsam die Linie Patrimonio und widmeten sie Luis senior — drei Generationen an einer Mischung, was recht direkt sagt, was das Wort bedeutet.

Die Fabrik arbeitet nicht nur für sich selbst: Sie fertigt auch für Gurkha, Sam Leccia und Veritas. Sie ist die dritte dominikanische Fabrik, die dieser Atlas nennt, neben der Tabacalera Palma und der von Eicken — drei Adressen hinter einem guten Teil des dominikanischen Katalogs.',

 'Casa Cuevas 是一家工厂的自有品牌，而这家工厂属于一个种烟已逾百年的家族。

来自桑坦德的西班牙人 Juan Cuevas 于十九世纪中叶离开西班牙，在古巴比那尔德里奥省开始种植烟草。其后家族迁至多米尼加共和国的西宝谷，并在那里建起 Tabacalera Las Lavas。

工厂由 Luis Cuevas 父亲主持，其子 Luis 二世同任。2021 年，Luis 二世与自己的儿子 Alec 共同调配了 Patrimonio 系列，并献给 Luis 父亲——三代人共成一支配方，这大概是相当直接地道出了这个词的含义。

工厂不只为自己生产：它也为 Gurkha、Sam Leccia 与 Veritas 代工。这是本图集所点名的第三家多米尼加工厂，另两家是 Tabacalera Palma 与 von Eicken——多米尼加目录的相当一部分，就出自这三个地址。',

 '«كاسا كويفاس» علامة خاصة بمصنع، والمصنع لعائلة تزرع التبغ منذ أكثر من مئة عام.

غادر خوان كويفاس، وهو إسباني من سانتاندير، بلادَه في منتصف القرن التاسع عشر وشرع في زراعة التبغ في مقاطعة بينار دل ريو بكوبا. ثم استقرّت العائلة من بعده في الجمهورية الدومينيكية، في وادي سيباو، حيث بنت «تاباكاليرا لاس لافاس».

يديره لويس كويفاس الأب، ومعه ابنه لويس الابن. وفي 2021 مزج لويس الابن وابنُه هو ألِك سلسلة «باتريمونيو» معًا وأهدياها إلى لويس الأب — ثلاثة أجيال على مزيج واحد، وهي طريقة مباشرة إلى حدّ بعيد لقول ما تعنيه الكلمة.

ولا يعمل المصنع لنفسه وحده: فهو يصنع أيضًا لغوركا وسام ليتشيا وفيريتاس. وهو ثالث مصنع دومينيكي يسمّيه هذا الأطلس، إلى جانب تاباكاليرا بالما وفون آيكن — ثلاثة عناوين وراء جانب كبير من الكتالوج الدومينيكي.',

 '[{"name":"Casa Cuevas","color":"#8B5A2B","force":"Medium","wrapper":"Habano, Connecticut or maduro depending on the range","vitolas":["Robusto","Toro","Belicoso"],"story":"The core range, long filler and rolled entirely at Tabacalera Las Lavas. Part of the tobacco comes from the family''s own fields, in the Cibao Valley."},{"name":"Patrimonio","color":"#4A2C1A","force":"Medium-Full","wrapper":"Dominican blend","vitolas":["Toro","Robusto"],"story":"Blended in 2021 by Luis Cuevas Jr. and his son Alec, and dedicated to Luis Cuevas Sr. Three generations on a single blend."},{"name":"Sangre Nueva","color":"#6B4226","force":"Medium-Full","wrapper":"Dominican blend","vitolas":["Toro"],"story":"\\u201cNew blood\\u201d — the range through which the next generation announced itself. Same workshop, same valley, a more assertive composition."}]',

 '[{"name":"Casa Cuevas","color":"#8B5A2B","force":"Medium","wrapper":"Habano, Connecticut o maduro según las gamas","vitolas":["Robusto","Toro","Belicoso"],"story":"La gama de base, de tripa larga y liada íntegramente en la Tabacalera Las Lavas. El tabaco viene en parte de los campos de la familia, en el valle del Cibao."},{"name":"Patrimonio","color":"#4A2C1A","force":"Medium-Full","wrapper":"Ligada dominicana","vitolas":["Toro","Robusto"],"story":"Ligada en 2021 por Luis Cuevas hijo y su hijo Alec, y dedicada a Luis Cuevas padre. Tres generaciones sobre una misma ligada."},{"name":"Sangre Nueva","color":"#6B4226","force":"Medium-Full","wrapper":"Ligada dominicana","vitolas":["Toro"],"story":"La gama con la que se anunció la generación siguiente. Mismo taller, mismo valle, una composición más afirmada."}]',

 '[{"name":"Casa Cuevas","color":"#8B5A2B","force":"Medium","wrapper":"Habano, Connecticut oder Maduro je nach Linie","vitolas":["Robusto","Toro","Belicoso"],"story":"Die Grundlinie, Longfiller und vollständig in der Tabacalera Las Lavas gerollt. Ein Teil des Tabaks stammt von den eigenen Feldern der Familie im Cibao-Tal."},{"name":"Patrimonio","color":"#4A2C1A","force":"Medium-Full","wrapper":"Dominikanische Mischung","vitolas":["Toro","Robusto"],"story":"2021 von Luis Cuevas junior und seinem Sohn Alec gemischt und Luis Cuevas senior gewidmet. Drei Generationen an einer Mischung."},{"name":"Sangre Nueva","color":"#6B4226","force":"Medium-Full","wrapper":"Dominikanische Mischung","vitolas":["Toro"],"story":"\\u201eNeues Blut\\u201c — die Linie, mit der sich die folgende Generation ankündigte. Dieselbe Werkstatt, dasselbe Tal, eine bestimmtere Zusammensetzung."}]',

 '[{"name":"Casa Cuevas","color":"#8B5A2B","force":"Medium","wrapper":"依系列而定：Habano、康涅狄格或马杜罗","vitolas":["Robusto","Toro","Belicoso"],"story":"基础系列，长填料，全部在 Tabacalera Las Lavas 卷制。部分烟叶来自家族在西宝谷的自有田地。"},{"name":"Patrimonio","color":"#4A2C1A","force":"Medium-Full","wrapper":"多米尼加配方","vitolas":["Toro","Robusto"],"story":"2021 年由 Luis Cuevas 二世与其子 Alec 共同调配，献给 Luis Cuevas 父亲。三代人共成一支配方。"},{"name":"Sangre Nueva","color":"#6B4226","force":"Medium-Full","wrapper":"多米尼加配方","vitolas":["Toro"],"story":"「新血」——下一代借以宣告自己的一条线。同一作坊，同一山谷，配方更为鲜明。"}]',

 '[{"name":"Casa Cuevas","color":"#8B5A2B","force":"Medium","wrapper":"هابانو أو كونيتيكت أو مادورو بحسب السلسلة","vitolas":["Robusto","Toro","Belicoso"],"story":"السلسلة الأساسية، بحشوة طويلة وملفوفة كاملةً في تاباكاليرا لاس لافاس. ويأتي جزء من التبغ من حقول العائلة في وادي سيباو."},{"name":"Patrimonio","color":"#4A2C1A","force":"Medium-Full","wrapper":"مزيج دومينيكي","vitolas":["Toro","Robusto"],"story":"مزجها عام 2021 لويس كويفاس الابن وابنُه ألِك، وأهدياها إلى لويس كويفاس الأب. ثلاثة أجيال على مزيج واحد."},{"name":"Sangre Nueva","color":"#6B4226","force":"Medium-Full","wrapper":"مزيج دومينيكي","vitolas":["Toro"],"story":"«دم جديد» — السلسلة التي أعلن بها الجيل التالي عن نفسه. الورشة نفسها والوادي نفسه، بتركيبة حازمة."}]');

-- ════════════════════════════════════════════════════════
-- LES SCEAUX, CALCULÉS DEPUIS LES COLONNES
-- ════════════════════════════════════════════════════════
INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'brands', b.`name`, c.champ, l.lang,
       SHA1(CASE c.champ WHEN 'history' THEN b.`history` ELSE b.`gamme` END),
       'machine', NOW()
  FROM `brands` b
  JOIN (SELECT 'history' champ UNION ALL SELECT 'gamme') c
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE b.`name` IN ('Tabacalera Palma','Aging Room','Swag','Kristoff',
                    'Caldwell Cigar Co.','Casa Cuevas')
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 186','systeme','scene_boutique_dominicaine','marque',0,
   'Six maisons dominicaines ajoutees : Tabacalera Palma (la fabrique, 1936), Aging Room (Rafael Nodal, 2011), Swag (l autre marque de Boutique Blends), Kristoff (Glen Case, 2004), Caldwell Cigar Co. (Robert Caldwell, 2014) et Casa Cuevas (la famille Cuevas, Tabacalera Las Lavas)'),
  (NULL,'migration 186','systeme','les_fabriques_enfin_nommees','marque',0,
   'LE LOT NICARAGUAYEN (185) MONTRAIT DES MAISONS SANS USINE ; CELUI-CI FAIT L INVERSE et nomme trois FABRIQUES dominicaines que l atlas citait deja sans jamais leur donner de fiche : Tabacalera Palma (Aging Room, Swag, La Galera, La Matilde), Tabacalera Las Lavas (Casa Cuevas, mais aussi Gurkha et Veritas) et Tabacalera von Eicken, ex-Charles Fairmorn (Kristoff). Tabacalera Palma recoit sa propre fiche parce qu elle est la plus ancienne des trois — 1936 — et parce que quatre marques de cet atlas en dependent'),
  (NULL,'migration 186','systeme','noeud_resserre','marque',0,
   'LA MIGRATION 180 AVAIT CREE Boutique Blends EN DISANT QU ELLE PORTAIT AGING ROOM ET SWAG. Les deux marques existent enfin et le renvoi fonctionne dans les deux sens. Rafael Nodal apparait desormais quatre fois dans l atlas : Boutique Blends, Aging Room, Swag, et le Trinidad Santiago dont il a revu la composition pour Altadis — assemble par le meme Jochy Blanco. Et Oliveros, que le recensement listait comme une maison absente, est en fait une ETIQUETTE de Boutique Blends : la fiche Swag le dit, et le document est corrige'),
  (NULL,'migration 186','systeme','la_palina_ecartee_deliberement','marque',0,
   'LA PALINA N EST PAS DANS CE LOT, ET C EST DELIBERE. docs/maisons-absentes.md la classait en Republique dominicaine. La verification dit autre chose : elle se fabrique au Honduras, au Nicaragua, en Republique dominicaine ET a Miami chez El Titan de Bronze — que l atlas porte. Aucun lieu principal ne se degage, et lui en inventer un serait refaire l erreur de Nicoya (migration 183). Elle attend une decision, pas une approximation'),
  (NULL,'migration 186','systeme','classements_de_presse_ecartes','marque',0,
   'AGING ROOM PORTE DEUX CLASSEMENTS DE CIGAR AFICIONADO POUR 2013 — deuxieme cigare de l annee, et premier non cubain. Aucun n entre ici faute de source_url : regle de marques_check, deja appliquee a El Sitio (182) et a Viaje (185)');

-- ════════════════════════════════════════════════════════
-- LE TABLEAU `brands` DU PAYS, EN TOUTES LETTRES
-- ════════════════════════════════════════════════════════
UPDATE `producer_countries`
   SET `brands` = '[{"desc":"Opus X — les plus convoités au monde","name":"Arturo Fuente","iconic":true},{"desc":"Luxe suisse, manufacture dominicaine","name":"Davidoff","iconic":true},{"desc":"Artisanat d''exception depuis 1996","name":"La Flor Dominicana","iconic":true},{"desc":"Standard mondial du Connecticut","name":"Macanudo","iconic":false},{"desc":"ESG et VSG, intemporels","name":"Ashton","iconic":false},{"desc":"Créée par le pianiste Avo Uvezian","name":"Avo","iconic":false},{"desc":"La douceur comme valeur absolue, depuis 1993","name":"Santa Damiana","iconic":false},{"desc":"1903, la plus ancienne manufacture dominicaine","name":"La Aurora","iconic":true},{"desc":"Repartir de zéro après une carrière entière","name":"E.P. Carrillo","iconic":true},{"desc":"1974, avant la vague — et toujours familiale","name":"Quesada","iconic":false},{"desc":"Tamboril, où la même main roule plusieurs bagues","name":"PDR Cigars","iconic":false},{"desc":"L''autre Montecristo, celui d''après 1960","name":"Montecristo Dominicain","iconic":true},{"desc":"Même bague que le havane, autre cigare","name":"Romeo y Julieta Dominicain","iconic":false},{"desc":"Le cigare que des dizaines de milliers de gens fument vraiment","name":"VegaFina","iconic":true},{"desc":"Un bon cigare selon le marché d''avant la mode de la puissance","name":"Don Diego","iconic":false},{"desc":"Né d''une boîte de nuit genevoise, et cela s''entend","name":"The Griffin''s","iconic":false},{"desc":"Un industriel redevenu artisan","name":"Matilde","iconic":false},{"desc":"La bague au pied du cigare — personne d''autre n''a osé","name":"Juan Clemente","iconic":false},{"desc":"Cape venue du Cameroun, cigares roulés ici","name":"Meerapfel","iconic":false},{"desc":"Née chez El Credito, à Miami, en 1972","name":"La Gloria Cubana Dominicaine","iconic":false},{"desc":"Tabacalera de García, La Romana","name":"H. Upmann Dominicain","iconic":false},{"desc":"Ne subsiste que hors de Cuba","name":"Henry Clay","iconic":false},{"desc":"Collection non cubaine annoncée en 2016","name":"Por Larrañaga Dominicain","iconic":false},{"name":"Boutique Blends","desc":"Rafael Nodal — Aging Room et Swag, chez Jochy Blanco","iconic":false},{"name":"Diamond Crown","desc":"La commande de Stanford Newman à Carlos Fuente Sr., pour le centenaire de 1995","iconic":false},{"name":"Cuesta-Rey","desc":"1884, Ybor City — plus ancienne que la maison qui la possède","iconic":false},{"name":"Tabacalera Palma","desc":"1936 — la fabrique dont sortent Aging Room, Swag, La Galera et Matilde","iconic":true},{"name":"Aging Room","desc":"Rafael Nodal compose, Jochy Blanco fabrique — et ils sont associés","iconic":true},{"name":"Swag","desc":"L''autre marque de Boutique Blends, même atelier, sans cérémonie","iconic":false},{"name":"Kristoff","desc":"Une visite non sollicitée en 2004, et un financier qui change de métier","iconic":false},{"name":"Caldwell Cigar Co.","desc":"Des tabacs rares plutôt qu''une recette reproductible","iconic":false},{"name":"Casa Cuevas","desc":"Tabacalera Las Lavas — trois générations sur un même assemblage","iconic":false}]',
       `updated_at` = NOW()
 WHERE `id` = 'dominican';

-- ════════════════════════════════════════════════════════
-- CINQ REPRISES, ET UN CONTRÔLE POSÉ
-- ────────────────────────────────────────────────────────
-- `marques_check` a vu « رقم 1 » dans l'arabe d'Aging Room et l'a lu
-- comme une note de presse. C'est « Bin No. 1 », un nom de produit, que
-- la traduction avait rendu en chiffres arabes. Le nom reste désormais
-- en caractères latins, comme dans le champ `gamme`. LA TRADUCTION
-- AVAIT FABRIQUÉ UN CLASSEMENT QUI N'EXISTE PAS.
--
-- `i18n_superlatif_check` a vu quatre rangs que le français ne porte
-- pas : « 最直接的 » chez Casa Cuevas en chinois, « die nächste » en
-- allemand — une forme en -ste que le motif lit comme un superlatif là
-- où le français dit « suivante » —, et deux « أكثر » arabes rendant
-- des comparatifs français. Reformulés.
--
-- ── ET UN ÉCART TROUVÉ EN VÉRIFIANT, QUI N'EN EST PAS UN
-- Le panneau dominicain annonce Meerapfel, dont la fiche est rattachée
-- au CAMEROUN. Ce n'est pas un défaut : le Cameroun est dans cet atlas
-- un pays DE FEUILLE, pas de roulage — ses quatre marques (Arturo
-- Fuente Hemingway, CAO Cameroon, Oliva Serie G, Meerapfel) sont toutes
-- roulées ailleurs sous une cape camerounaise. Les deux rattachements
-- sont vrais.
--
-- Mais rien ne protégeait ces tableaux d'une FAUTE DE FRAPPE, et ils
-- sont écrits à la main depuis la migration 179. `coherence_check`
-- vérifie désormais que chaque nom annoncé correspond à une fiche —
-- n'importe où, pas forcément dans le même pays, sans quoi le modèle
-- camerounais casserait. Éprouvé en injectant « Casa Cuevaz » : le
-- contrôle l'a vu.
-- ════════════════════════════════════════════════════════

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 186','systeme','la_traduction_a_fabrique_un_classement','marque',0,
   'marques_check a vu « رقم 1 » dans l arabe d Aging Room et l a lu comme une note de presse. C est « Bin No. 1 », un NOM DE PRODUIT, que la traduction avait rendu en chiffres arabes — elle avait fabrique un classement qui n existe pas. Le nom reste desormais en caracteres latins, comme dans le champ gamme. i18n_superlatif_check a vu par ailleurs quatre rangs que le francais ne porte pas, dont un « die nachste » allemand : une forme en -ste lue comme un superlatif la ou le francais dit « suivante »'),
  (NULL,'migration 186','systeme','controle_des_annonces_pose','systeme',0,
   'LE PANNEAU DOMINICAIN ANNONCE MEERAPFEL, DONT LA FICHE EST RATTACHEE AU CAMEROUN. Ce n est PAS un defaut : le Cameroun est dans cet atlas un pays DE FEUILLE et non de roulage — ses quatre marques sont toutes roulees ailleurs sous cape camerounaise. Mais rien ne protegeait producer_countries.brands d une FAUTE DE FRAPPE, et ces tableaux sont ecrits a la main depuis la migration 179 parce que les fonctions JSON_* divergent entre MySQL et MariaDB. coherence_check verifie desormais que chaque nom annonce correspond a une fiche — n importe ou, pas forcement dans le meme pays, sans quoi le modele camerounais casserait. Eprouve en injectant « Casa Cuevaz » : le controle l a vu, et s est taise une fois la faute retiree');
