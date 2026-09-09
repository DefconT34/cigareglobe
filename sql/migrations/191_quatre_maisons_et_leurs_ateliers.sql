-- ════════════════════════════════════════════════════════
-- 191 — Quatre maisons, et les ateliers qui les portent
-- ────────────────────────────────────────────────────────
--   Ferio Tego       Herklots et Scott, 2021      dominican
--   Paul Garmirian   1990, Washington D.C.        dominican
--   Gurkha           relancée par K. Hansotia     nicaragua
--   La Barba         Bellatto et Rossi, 2013      dominican
--
-- ── LE RECENSEMENT S'EST TROMPÉ DEUX FOIS DE PLUS ───────
-- `docs/maisons-absentes.md` classait Gurkha en République dominicaine
-- et La Barba au Nicaragua. Les deux sont fausses :
--
--   Gurkha    a RACHETÉ sa fabrique — l'American Caribbean Cigars,
--             à Estelí — en mai 2017. Las Lavas produit aussi pour
--             elle, mais l'usine qui lui appartient est nicaraguayenne
--   La Barba  a QUITTÉ le Honduras. Son premier cigare sortait de la
--             fabrique Aladino de Danlí ; tout est passé depuis à la
--             Tabacalera William Ventura, en République dominicaine
--
-- Cela porte à SEPT le nombre d'erreurs de pays du recensement, après
-- Nicoya (183), La Palina (186/189), Padilla (188), Asylum et Micallef
-- (190). Le motif ne varie pas.
--
-- ── ET SIX LIGNES PÉRIMÉES CORRIGÉES AU PASSAGE ─────────
-- Le document listait encore comme absentes HVC, Fratello, Curivari et
-- Black Label Trading (faites à la 188) et Selected Tobacco (faite à la
-- 180). Vérifié contre la base, pas contre le document : il ne restait
-- pas 37 maisons mais 28.
--
-- Et ZINO N'EST PAS UNE MAISON : c'est une ligne d'Oettinger Davidoff,
-- que sa propre fiche nomme déjà — même cas qu'Oliveros, étiquette de
-- Boutique Blends (migration 186).
--
-- ── LA CONSIGNE « QUI FAIT QUOI » ───────────────────────
-- Les quatre fiches nomment leurs ateliers, et six des partenaires ont
-- déjà leur fiche ici :
--
--   Ferio Tego      QUESADA (Tabacos de Exportación, Licey) fait le
--                   Metropolitan et deux Timeless ; PLASENCIA (Estelí)
--                   fait les deux autres Timeless. Les marques
--                   viennent de NAT SHERMAN, rachetées à Altria
--   Paul Garmirian  O.K. CIGARS, la fabrique du groupe Davidoff qui
--                   fait l'AVO, sur le campus TABADOM
--   Gurkha          sa propre usine d'Estelí depuis 2017 ; LAS LAVAS,
--                   celle de Casa Cuevas, produit aussi pour elle
--   La Barba        ALADINO (Danlí) hier, TABACALERA WILLIAM VENTURA
--                   aujourd'hui — l'atelier de CALDWELL
--
-- ── CE QUE CES FICHES REFUSENT D'ÉCRIRE ─────────────────
-- Gurkha fait remonter son nom à 1887, dans l'Inde britannique, et à un
-- cigare qu'auraient fumé les soldats gurkhas. Aucune source
-- indépendante ne l'établit : la fiche l'attribue à la maison, comme
-- elle l'a fait pour Alphonse XIII chez Cuesta-Rey et pour Churchill
-- chez Vargas et La Aroma de Cuba.
--
-- ⚠ LES QUATRE SONT ROULÉES MAIN, et les `founded` tiennent sous 49
-- caractères — règles 184 et 187, vérifiées avant écriture.
--
-- Sources : cigar-coop.com et feriotego.com (Herklots, Scott, le rachat
-- des marques Nat Sherman à Altria, début 2021, le blason familial),
-- cigaraficionado.com « Ferio Tego Metropolitan Selection Shipping Now »
-- et halfwheel.com (le partage Quesada / Plasencia ligne par ligne),
-- en.wikipedia.org et halfwheel.com (Paul Garmirian : 1990, le livre,
-- O.K. Cigars et l'Occidental sur le campus Tabadom),
-- tobaccobusiness.com « Gurkha Cigars Gains Its Own Factory » (mai 2017,
-- American Caribbean Cigars, les volumes de 2012 à 2016),
-- tobaccobusiness.com « Rite of Passage » et cigardojo.com (La Barba :
-- Bellatto et Rossi, le Red de 2013 chez Aladino, le passage chez
-- Ventura).
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

-- ── Ferio Tego ───────────────────────────────────────────
('Ferio Tego', 'dominican', '2021 — Michael Herklots et Brendon Scott',
 'Quesada, Tabacos de Exportación, Licey (Rép. dom.) ; et Plasencia, Estelí (Nicaragua)',

 'Ferio Tego est né de la fin d''une autre maison. En 2020, Altria ferme la division cigare de Nat Sherman après quatre-vingt-dix ans — cette adresse de la Cinquième Avenue que cet atlas porte encore. Deux anciens de la maison rachètent alors au groupe les marques et leur propriété intellectuelle : Michael Herklots, qui en était vice-président, et Brendon Scott. Ferio Tego paraît au début de 2021.

Le nom vient du blason de la famille Herklots. Il se traduit « frapper et défendre ».

Ce qu''ils ont racheté, ce sont des assemblages que d''autres roulaient déjà — et ils ont gardé les mêmes mains. Le Metropolitan a été composé au milieu des années 1990 par la famille Quesada pour Nat Sherman ; il sort toujours de leur Tabacos de Exportación, à Licey. La collection Timeless est partagée en deux : le Prestige et le Sterling chez Quesada, le Panamericana et le Supreme chez Plasencia, à Estelí.

Quesada et Plasencia sont l''une et l''autre dans cet atlas, et Nat Sherman aussi. Cette fiche est dominicaine parce que la part de Quesada l''emporte — le Metropolitan et la moitié du Timeless — mais l''atlas écrit le partage plutôt que de le taire.',

 '[{"name":"Timeless — Prestige et Sterling","color":"#8B5A2B","force":"Medium-Full","wrapper":"Assemblage Quesada","vitolas":["Robusto","Toro","Corona"],"story":"La moitié dominicaine de la collection, roulée par la famille Quesada à la Tabacos de Exportación de Licey. Timeless était déjà une ligne Nat Sherman : c''est le même assemblage, sous une autre bague."},{"name":"Timeless — Panamericana et Supreme","color":"#6B4226","force":"Full","wrapper":"Assemblage Plasencia","vitolas":["Robusto","Toro"],"story":"L''autre moitié, roulée par la famille Plasencia à Estelí. Une même collection tenue par deux familles dans deux pays — c''est rare, et la maison ne s''en cache pas."},{"name":"Metropolitan","color":"#C9A96E","force":"Medium","wrapper":"Connecticut ou maduro selon les versions","vitolas":["Host","Connecticut","Maduro"],"story":"Composé au milieu des années 1990 par les Quesada pour Nat Sherman, et toujours fait par eux. C''est la ligne la plus ancienne du catalogue, et elle a plus de trente ans."}]',

 'Ferio Tego was born of another house''s ending. In 2020 Altria closed Nat Sherman''s cigar division after ninety years — that Fifth Avenue address this atlas still holds. Two of the house''s own then bought the brands and their intellectual property from the group: Michael Herklots, who had been its vice-president, and Brendon Scott. Ferio Tego appeared in early 2021.

The name comes from the Herklots family coat of arms. It translates as "strike and defend".

What they bought were blends others were already rolling — and they kept the same hands. Metropolitan was composed in the mid-1990s by the Quesada family for Nat Sherman; it still comes out of their Tabacos de Exportación, at Licey. The Timeless collection is split in two: Prestige and Sterling at Quesada, Panamericana and Supreme at Plasencia, in Estelí.

Quesada and Plasencia are both in this atlas, and so is Nat Sherman. This entry is Dominican because Quesada''s share is the larger one — Metropolitan and half of Timeless — but the atlas writes the split rather than hiding it.',

 'Ferio Tego nació del final de otra casa. En 2020, Altria cierra la división de puros de Nat Sherman tras noventa años: esa dirección de la Quinta Avenida que este atlas todavía recoge. Dos antiguos de la casa compran entonces al grupo las marcas y su propiedad intelectual: Michael Herklots, que era su vicepresidente, y Brendon Scott. Ferio Tego aparece a principios de 2021.

El nombre viene del escudo de la familia Herklots. Se traduce «golpear y defender».

Lo que compraron eran ligadas que otros ya liaban, y conservaron las mismas manos. El Metropolitan fue compuesto a mediados de los noventa por la familia Quesada para Nat Sherman; sigue saliendo de su Tabacos de Exportación, en Licey. La colección Timeless está repartida en dos: el Prestige y el Sterling en Quesada, el Panamericana y el Supreme en Plasencia, en Estelí.

Quesada y Plasencia están ambas en este atlas, y Nat Sherman también. Esta ficha es dominicana porque la parte de Quesada pesa más — el Metropolitan y la mitad del Timeless — pero el atlas escribe el reparto en vez de callarlo.',

 'Ferio Tego entstand aus dem Ende eines anderen Hauses. 2020 schloss Altria die Zigarrensparte von Nat Sherman nach neunzig Jahren — jene Adresse an der Fifth Avenue, die dieser Atlas noch führt. Zwei aus dem Haus kauften daraufhin dem Konzern die Marken und deren Schutzrechte ab: Michael Herklots, zuvor Vizepräsident, und Brendon Scott. Ferio Tego erschien Anfang 2021.

Der Name stammt aus dem Wappen der Familie Herklots. Er heißt übersetzt "schlagen und verteidigen".

Was sie kauften, waren Mischungen, die andere bereits rollten — und sie behielten dieselben Hände. Metropolitan wurde Mitte der 1990er Jahre von der Familie Quesada für Nat Sherman komponiert; sie kommt noch immer aus deren Tabacos de Exportación in Licey. Die Timeless-Kollektion ist zweigeteilt: Prestige und Sterling bei Quesada, Panamericana und Supreme bei Plasencia in Estelí.

Quesada und Plasencia stehen beide in diesem Atlas, Nat Sherman ebenfalls. Dieser Eintrag ist dominikanisch, weil Quesadas Anteil der größere ist — Metropolitan und die Hälfte von Timeless —, doch der Atlas schreibt die Aufteilung, statt sie zu verschweigen.',

 'Ferio Tego 诞生于另一家公司的终结。2020 年，Altria 关闭了 Nat Sherman 经营九十年的雪茄部门——那个第五大道的地址，本图集至今仍有收录。随后，两位出自该公司的人从集团手中买下这些品牌及其知识产权：曾任副总裁的 Michael Herklots 与 Brendon Scott。Ferio Tego 于 2021 年初问世。

名字取自 Herklots 家族的纹章，意为「出击与防守」。

他们买下的是别人早已在卷制的配方——而他们保留了同一双双手。Metropolitan 于 1990 年代中期由 Quesada 家族为 Nat Sherman 调配，至今仍出自他们位于利塞伊的 Tabacos de Exportación。Timeless 系列则一分为二：Prestige 与 Sterling 在 Quesada，Panamericana 与 Supreme 在埃斯特利的 Plasencia。

Quesada 与 Plasencia 都在本图集之中，Nat Sherman 亦然。本条目归入多米尼加，是因为 Quesada 的份额更大——Metropolitan 加上一半的 Timeless——但本图集把这种分工写明，而非略去。',

 'وُلدت «فيريو تيغو» من نهاية دارٍ أخرى. ففي 2020 أغلقت «ألتريا» قسم السيجار في نات شيرمان بعد تسعين عامًا — ذلك العنوان في الجادة الخامسة الذي ما زال هذا الأطلس يضمّه. عندئذٍ اشترى اثنان من رجال الدار العلامات وحقوقها الفكرية من المجموعة: مايكل هيركلوتس، وكان نائب رئيسها، وبريندون سكوت. وظهرت «فيريو تيغو» في مطلع 2021.

والاسم مأخوذ من شعار عائلة هيركلوتس، ويُترجم بـ«اضرب وادفع».

وما اشترياه كان مزائج يلفّها آخرون سلفًا — فأبقيا على الأيدي نفسها. فقد ألّفت عائلة كيسادا مزيج «ميتروبوليتان» في منتصف التسعينيات لنات شيرمان، وما زال يخرج من مصنعها «تاباكوس دي إكسبورتاسيون» في ليسي. أمّا مجموعة «تايملس» فمقسومة نصفين: «برستيج» و«ستيرلينغ» عند كيسادا، و«بانامريكانا» و«سوبريم» عند بلاسينسيا في إستيلي.

وكيسادا وبلاسينسيا كلتاهما في هذا الأطلس، ونات شيرمان كذلك. وهذه البطاقة دومينيكية لأنّ حصّة كيسادا هي الأكبر — ميتروبوليتان ونصف تايملس — غير أنّ الأطلس يكتب القسمة بدل أن يكتمها.',

 '[{"name":"Timeless — Prestige and Sterling","color":"#8B5A2B","force":"Medium-Full","wrapper":"Quesada blend","vitolas":["Robusto","Toro","Corona"],"story":"The Dominican half of the collection, rolled by the Quesada family at Tabacos de Exportación in Licey. Timeless was already a Nat Sherman line: the same blend, under another band."},{"name":"Timeless — Panamericana and Supreme","color":"#6B4226","force":"Full","wrapper":"Plasencia blend","vitolas":["Robusto","Toro"],"story":"The other half, rolled by the Plasencia family in Estelí. One collection held by two families in two countries — rare, and the house does not hide it."},{"name":"Metropolitan","color":"#C9A96E","force":"Medium","wrapper":"Connecticut or maduro depending on the version","vitolas":["Host","Connecticut","Maduro"],"story":"Composed in the mid-1990s by the Quesadas for Nat Sherman, and still made by them. It is the oldest line in the catalogue, and it is over thirty years old."}]',

 '[{"name":"Timeless — Prestige y Sterling","color":"#8B5A2B","force":"Medium-Full","wrapper":"Ligada Quesada","vitolas":["Robusto","Toro","Corona"],"story":"La mitad dominicana de la colección, liada por la familia Quesada en Tabacos de Exportación, en Licey. Timeless ya era una línea Nat Sherman: la misma ligada, bajo otra vitola."},{"name":"Timeless — Panamericana y Supreme","color":"#6B4226","force":"Full","wrapper":"Ligada Plasencia","vitolas":["Robusto","Toro"],"story":"La otra mitad, liada por la familia Plasencia en Estelí. Una misma colección sostenida por dos familias en dos países: es raro, y la casa no lo oculta."},{"name":"Metropolitan","color":"#C9A96E","force":"Medium","wrapper":"Connecticut o maduro según las versiones","vitolas":["Host","Connecticut","Maduro"],"story":"Compuesto a mediados de los noventa por los Quesada para Nat Sherman, y todavía hecho por ellos. Es la línea más antigua del catálogo, y tiene más de treinta años."}]',

 '[{"name":"Timeless — Prestige und Sterling","color":"#8B5A2B","force":"Medium-Full","wrapper":"Quesada-Mischung","vitolas":["Robusto","Toro","Corona"],"story":"Die dominikanische Hälfte der Kollektion, von der Familie Quesada in der Tabacos de Exportación in Licey gerollt. Timeless war schon eine Nat-Sherman-Linie: dieselbe Mischung, ein anderes Bauchband."},{"name":"Timeless — Panamericana und Supreme","color":"#6B4226","force":"Full","wrapper":"Plasencia-Mischung","vitolas":["Robusto","Toro"],"story":"Die andere Hälfte, von der Familie Plasencia in Estelí gerollt. Eine Kollektion, von zwei Familien in zwei Ländern getragen — selten, und das Haus verbirgt es nicht."},{"name":"Metropolitan","color":"#C9A96E","force":"Medium","wrapper":"Connecticut oder Maduro je nach Fassung","vitolas":["Host","Connecticut","Maduro"],"story":"Mitte der 1990er Jahre von den Quesadas für Nat Sherman komponiert und bis heute von ihnen gefertigt. Es ist die älteste Linie des Katalogs, über dreißig Jahre alt."}]',

 '[{"name":"Timeless — Prestige 与 Sterling","color":"#8B5A2B","force":"Medium-Full","wrapper":"Quesada 配方","vitolas":["Robusto","Toro","Corona"],"story":"这一系列的多米尼加一半，由 Quesada 家族在利塞伊的 Tabacos de Exportación 卷制。Timeless 本就是 Nat Sherman 的产品线：同样的配方，换了一条标环。"},{"name":"Timeless — Panamericana 与 Supreme","color":"#6B4226","force":"Full","wrapper":"Plasencia 配方","vitolas":["Robusto","Toro"],"story":"另一半，由 Plasencia 家族在埃斯特利卷制。同一系列由两个家族分处两国承担——这并不多见，而这家并不讳言。"},{"name":"Metropolitan","color":"#C9A96E","force":"Medium","wrapper":"依版本而定：康涅狄格或马杜罗","vitolas":["Host","Connecticut","Maduro"],"story":"1990 年代中期由 Quesada 家族为 Nat Sherman 调配，至今仍由他们制作。这是目录中最老的一条线，已逾三十年。"}]',

 '[{"name":"Timeless — Prestige و Sterling","color":"#8B5A2B","force":"Medium-Full","wrapper":"مزيج كيسادا","vitolas":["Robusto","Toro","Corona"],"story":"النصف الدومينيكي من المجموعة، تلفّه عائلة كيسادا في «تاباكوس دي إكسبورتاسيون» بليسي. وكانت «تايملس» أصلًا خطًّا لنات شيرمان: المزيج نفسه، بحزامٍ آخر."},{"name":"Timeless — Panamericana و Supreme","color":"#6B4226","force":"Full","wrapper":"مزيج بلاسينسيا","vitolas":["Robusto","Toro"],"story":"النصف الآخر، تلفّه عائلة بلاسينسيا في إستيلي. مجموعة واحدة تحملها عائلتان في بلدين — أمر نادر، والدار لا تخفيه."},{"name":"Metropolitan","color":"#C9A96E","force":"Medium","wrapper":"كونيتيكت أو مادورو بحسب النسخة","vitolas":["Host","Connecticut","Maduro"],"story":"ألّفه آل كيسادا في منتصف التسعينيات لنات شيرمان، وما زالوا يصنعونه. وهو أقدم خطوط الكتالوج، وقد جاوز الثلاثين عامًا."}]'),

-- ── Paul Garmirian ───────────────────────────────────────
('Paul Garmirian', 'dominican', '1990 — Paul Garmirian, Washington D.C.',
 'O.K. Cigars, campus Tabadom, Villa González, Rép. dominicaine',

 'Paul Garmirian a écrit un livre avant de faire un cigare. The Gourmet Guide to Cigars paraît en 1990 ; il fonde sa maison la même année, et sa première gamme s''appelle la Gourmet Series.

L''intention était précise, et elle tient de la mémoire : retrouver le goût des havanes qu''il fumait à la fin des années 1950. Ce n''est pas une posture — c''est un cahier des charges, et il explique la retenue d''une maison qui n''a jamais suivi la mode de la puissance.

Les cigares se font en République dominicaine, chez O.K. Cigars — la fabrique du groupe Davidoff surtout connue pour faire l''Avo. Ils sortaient auparavant de l''Occidental Cigar Factory, voisine. Les trois ateliers appartiennent au même ensemble, celui de Tabadom, que cet atlas nomme déjà sur les fiches Davidoff et The Griffin''s.

Une maison d''auteur roulée chez un industriel, donc — le contraire exact du modèle boutique d''aujourd''hui, qui cherche plutôt le petit atelier. Ici c''est la constance qui était recherchée, et une grande fabrique la donne mieux qu''une petite.',

 '[{"name":"PG Gourmet Series","color":"#8B5A2B","force":"Medium","wrapper":"Assemblage dominicain, chez O.K. Cigars","vitolas":["Corona","Robusto","Churchill","Bombones"],"story":"La gamme de 1990, née en même temps que le livre. Elle cherchait le havane de la fin des années 1950, et sa retenue vient de là."},{"name":"PG Gourmet Series III","color":"#6B4226","force":"Medium-Full","wrapper":"Assemblage dominicain, chez O.K. Cigars","vitolas":["Short Robusto","Toro"],"story":"La troisième déclinaison de la série, plus dense que l''originale. La maison a marqué ses trentième et trente-cinquième anniversaires par des éditions de cette gamme."}]',

 'Paul Garmirian wrote a book before he made a cigar. The Gourmet Guide to Cigars appeared in 1990; he founded his house the same year, and his first range is called the Gourmet Series.

The intent was precise, and it is a matter of memory: to find again the taste of the Havanas he smoked in the late 1950s. That is not a pose — it is a specification, and it explains the restraint of a house that never followed the fashion for strength.

The cigars are made in the Dominican Republic, at O.K. Cigars — the Davidoff group''s factory best known for making Avo. They previously came out of the neighbouring Occidental Cigar Factory. All three workshops belong to the same Tabadom grounds, which this atlas already names on the Davidoff and The Griffin''s entries.

An author''s house rolled by an industrial one, then — the exact opposite of today''s boutique model, which looks for the small workshop. Here it was consistency that was wanted, and a large factory gives that better than a small one.',

 'Paul Garmirian escribió un libro antes de hacer un puro. The Gourmet Guide to Cigars aparece en 1990; funda su casa el mismo año, y su primera gama se llama Gourmet Series.

La intención era precisa, y es cosa de memoria: reencontrar el gusto de los habanos que fumaba a finales de los cincuenta. No es una pose: es un pliego de condiciones, y explica la contención de una casa que nunca siguió la moda de la fuerza.

Los puros se hacen en la República Dominicana, en O.K. Cigars, la fábrica del grupo Davidoff más conocida por hacer el Avo. Antes salían de la vecina Occidental Cigar Factory. Los tres talleres pertenecen al mismo conjunto, el de Tabadom, que este atlas ya nombra en las fichas de Davidoff y The Griffin''s.

Una casa de autor liada en casa de un industrial, pues: lo contrario exacto del modelo boutique de hoy, que busca el taller pequeño. Aquí se buscaba la constancia, y una fábrica grande la da mejor que una pequeña.',

 'Paul Garmirian schrieb ein Buch, bevor er eine Zigarre machte. The Gourmet Guide to Cigars erschien 1990; im selben Jahr gründete er sein Haus, und seine erste Linie heißt Gourmet Series.

Die Absicht war genau, und sie ist eine Sache der Erinnerung: den Geschmack der Havannas wiederzufinden, die er Ende der 1950er Jahre rauchte. Das ist keine Pose — es ist ein Pflichtenheft, und es erklärt die Zurückhaltung eines Hauses, das der Mode der Stärke nie gefolgt ist.

Die Zigarren entstehen in der Dominikanischen Republik, bei O.K. Cigars — der Fabrik der Davidoff-Gruppe, die vor allem für die Avo bekannt ist. Zuvor kamen sie aus der benachbarten Occidental Cigar Factory. Alle drei Werkstätten gehören zum selben Tabadom-Gelände, das dieser Atlas auf den Einträgen Davidoff und The Griffin''s bereits nennt.

Ein Autorenhaus also, bei einem Industriellen gerollt — das genaue Gegenteil des heutigen Boutique-Modells, das die kleine Werkstatt sucht. Hier ging es um Beständigkeit, und die gibt eine große Fabrik besser als eine kleine.',

 'Paul Garmirian 先写了一本书，然后才做雪茄。《The Gourmet Guide to Cigars》于 1990 年出版；同年他创办了自己的公司，并把开篇的产品线取名为 Gourmet Series。

意图非常明确，而且关乎记忆：重新找回他在 1950 年代末所抽哈瓦那雪茄的味道。这并非姿态，而是一份规格书——它也解释了这家公司的克制：它从未追随浓烈之风。

雪茄产自多米尼加共和国的 O.K. Cigars——Davidoff 集团旗下、以生产 Avo 而广为人知的那家工厂。此前则出自毗邻的 Occidental Cigar Factory。这三个工坊同属 Tabadom 一处园区，本图集在 Davidoff 与 The Griffin''s 两条中已经提到过它。

于是这是一家由工业厂房代卷的作者型公司——与今日追求小作坊的精品模式恰恰相反。这里所求的是稳定，而大厂在这一点上胜过小厂。',

 'كتب بول غارميريان كتابًا قبل أن يصنع سيجارًا. صدر «الدليل الذوّاق إلى السيجار» عام 1990؛ وأسّس داره في السنة نفسها، وسمّى سلسلته الأولى «غورميه سيريز».

كان المقصد دقيقًا، وهو من باب الذاكرة: أن يستعيد مذاق السيجار الهافاني الذي كان يدخّنه في أواخر الخمسينيات. وليست تلك وقفة استعراض، بل دفتر شروط — وهو يفسّر تحفّظ دارٍ لم تجارِ قطّ موضة القوّة.

ويُصنع السيجار في الجمهورية الدومينيكية عند «أو.كيه. سيغارز» — مصنع مجموعة دافيدوف المعروف قبل كلّ شيء بصناعة «أفو». وكان يخرج قبلها من «أوكسيدنتال سيغار فاكتوري» المجاورة. والورش الثلاث تنتمي إلى المجمّع نفسه، مجمّع تابادوم، الذي يسمّيه هذا الأطلس أصلًا في بطاقتَي دافيدوف وذا غريفنز.

فهي إذن دار مؤلِّف تُلَفّ عند صانع صناعيّ — نقيض النموذج البوتيكي اليوم الذي يقصد الورشة الصغيرة. المطلوب هنا هو الثبات، والمصنع الكبير يمنحه أفضل من الصغير.',

 '[{"name":"PG Gourmet Series","color":"#8B5A2B","force":"Medium","wrapper":"Dominican blend, at O.K. Cigars","vitolas":["Corona","Robusto","Churchill","Bombones"],"story":"The 1990 range, born at the same time as the book. It was after the Havana of the late 1950s, and its restraint comes from that."},{"name":"PG Gourmet Series III","color":"#6B4226","force":"Medium-Full","wrapper":"Dominican blend, at O.K. Cigars","vitolas":["Short Robusto","Toro"],"story":"The third turn of the series, denser than the original. The house marked its thirtieth and thirty-fifth anniversaries with editions of this range."}]',

 '[{"name":"PG Gourmet Series","color":"#8B5A2B","force":"Medium","wrapper":"Ligada dominicana, en O.K. Cigars","vitolas":["Corona","Robusto","Churchill","Bombones"],"story":"La gama de 1990, nacida a la vez que el libro. Buscaba el habano de finales de los cincuenta, y de ahí viene su contención."},{"name":"PG Gourmet Series III","color":"#6B4226","force":"Medium-Full","wrapper":"Ligada dominicana, en O.K. Cigars","vitolas":["Short Robusto","Toro"],"story":"La tercera vuelta de la serie, más densa que la original. La casa marcó sus treinta y sus treinta y cinco años con ediciones de esta gama."}]',

 '[{"name":"PG Gourmet Series","color":"#8B5A2B","force":"Medium","wrapper":"Dominikanische Mischung, bei O.K. Cigars","vitolas":["Corona","Robusto","Churchill","Bombones"],"story":"Die Linie von 1990, zugleich mit dem Buch entstanden. Sie zielte auf die Havanna der späten 1950er Jahre, und daher rührt ihre Zurückhaltung."},{"name":"PG Gourmet Series III","color":"#6B4226","force":"Medium-Full","wrapper":"Dominikanische Mischung, bei O.K. Cigars","vitolas":["Short Robusto","Toro"],"story":"Die dritte Wendung der Serie, dichter als das Original. Das Haus hat seinen dreißigsten und fünfunddreißigsten Jahrestag mit Ausgaben dieser Linie begangen."}]',

 '[{"name":"PG Gourmet Series","color":"#8B5A2B","force":"Medium","wrapper":"多米尼加配方，产自 O.K. Cigars","vitolas":["Corona","Robusto","Churchill","Bombones"],"story":"1990 年的产品线，与那本书同时诞生。它所追的是 1950 年代末的哈瓦那雪茄，其克制正源于此。"},{"name":"PG Gourmet Series III","color":"#6B4226","force":"Medium-Full","wrapper":"多米尼加配方，产自 O.K. Cigars","vitolas":["Short Robusto","Toro"],"story":"这一系列的第三次演绎，比原版更为紧实。公司的三十周年与三十五周年都以这条线的特别版来纪念。"}]',

 '[{"name":"PG Gourmet Series","color":"#8B5A2B","force":"Medium","wrapper":"مزيج دومينيكي، عند أو.كيه. سيغارز","vitolas":["Corona","Robusto","Churchill","Bombones"],"story":"سلسلة عام 1990، وُلدت مع الكتاب نفسه. كانت تقصد هافانا أواخر الخمسينيات، ومن هناك يأتي تحفّظها."},{"name":"PG Gourmet Series III","color":"#6B4226","force":"Medium-Full","wrapper":"مزيج دومينيكي، عند أو.كيه. سيغارز","vitolas":["Short Robusto","Toro"],"story":"الدورة الثالثة من السلسلة، أكثف من الأصل. وقد أحيت الدار ذكراها الثلاثين والخامسة والثلاثين بإصدارات من هذا الخطّ."}]'),

-- ── Gurkha ───────────────────────────────────────────────
('Gurkha', 'nicaragua', 'Relancée par Kaizad Hansotia ; usine à Estelí',
 'American Caribbean Cigars, Estelí, Nicaragua (rachetée en 2017)',

 'Gurkha fait remonter son nom à 1887, dans l''Inde britannique, et à un cigare qu''auraient fumé les soldats gurkhas dont elle porte le nom. C''est le récit de la maison ; aucune source indépendante ne l''établit, et cet atlas le rapporte sans le reprendre à son compte.

Ce qui est établi commence dans les années 1990, quand Kaizad Hansotia relance le nom et en fait une marque connue pour ses boîtes, ses éditions et ses prix hauts.

Longtemps elle n''a pas eu d''usine. Elle travaillait depuis 2012 avec l''American Caribbean Cigars, à Estelí, sous un accord de cinq ans : cent cinquante mille cigares la première année, cinq millions en 2016. En mai 2017 elle rachète la fabrique — et cesse d''être une maison sans murs.

C''est pourquoi cette fiche est nicaraguayenne. La Tabacalera Las Lavas, en République dominicaine — celle de la famille Cuevas, que cet atlas porte — produit aussi pour elle ; mais l''atelier qui lui appartient est à Estelí, et c''est celui-là qui la définit.',

 '[{"name":"Gurkha Cellar Reserve","color":"#4A2C1A","force":"Medium-Full","wrapper":"Assemblage nicaraguayen","vitolas":["Robusto","Toro","Churchill"],"story":"La gamme sur laquelle la maison appuie son argument de vieillissement. C''est aussi celle qui a fixé sa réputation de prix hauts, bien avant qu''elle possède une usine."},{"name":"Gurkha Nicaragua Series","color":"#6B4226","force":"Full","wrapper":"Nicaragua","vitolas":["Robusto","Toro"],"story":"La gamme née après le rachat de l''American Caribbean Cigars : un puro nicaraguayen fait dans sa propre fabrique d''Estelí. Elle dit le changement de statut de la maison."},{"name":"Gurkha Heritage","color":"#8B5A2B","force":"Medium","wrapper":"Assemblage nicaraguayen","vitolas":["Robusto","Toro"],"story":"Le nom renvoie au récit de 1887, que la maison porte et que rien n''établit. Le cigare, lui, est contemporain et sort d''Estelí."}]',

 'Gurkha traces its name back to 1887, in British India, and to a cigar said to have been smoked by the Gurkha soldiers whose name it carries. That is the house''s own account; no independent source establishes it, and this atlas reports it without adopting it.

What is established begins in the 1990s, when Kaizad Hansotia revived the name and made it a brand known for its boxes, its editions and its high prices.

For a long time it had no factory. Since 2012 it had worked with American Caribbean Cigars, in Estelí, under a five-year agreement: a hundred and fifty thousand cigars in the first year, five million by 2016. In May 2017 it bought the factory — and stopped being a house without walls.

That is why this entry is Nicaraguan. Tabacalera Las Lavas, in the Dominican Republic — the Cuevas family''s, which this atlas holds — also produces for it; but the workshop it owns is in Estelí, and that is the one that defines it.',

 'Gurkha hace remontar su nombre a 1887, en la India británica, y a un puro que habrían fumado los soldados gurkhas cuyo nombre lleva. Es el relato de la casa; ninguna fuente independiente lo establece, y este atlas lo refiere sin hacerlo suyo.

Lo establecido empieza en los años noventa, cuando Kaizad Hansotia relanza el nombre y hace de él una marca conocida por sus cajas, sus ediciones y sus precios altos.

Durante mucho tiempo no tuvo fábrica. Desde 2012 trabajaba con American Caribbean Cigars, en Estelí, bajo un acuerdo de cinco años: ciento cincuenta mil puros el primer año, cinco millones en 2016. En mayo de 2017 compra la fábrica y deja de ser una casa sin paredes.

Por eso esta ficha es nicaragüense. La Tabacalera Las Lavas, en la República Dominicana — la de la familia Cuevas, que este atlas recoge — produce también para ella; pero el taller que le pertenece está en Estelí, y es ese el que la define.',

 'Gurkha führt ihren Namen auf 1887 zurück, auf Britisch-Indien und auf eine Zigarre, die die namengebenden Gurkha-Soldaten geraucht haben sollen. Das ist die Erzählung des Hauses; keine unabhängige Quelle belegt sie, und dieser Atlas gibt sie wieder, ohne sie sich zu eigen zu machen.

Belegt ist, was in den 1990er Jahren beginnt, als Kaizad Hansotia den Namen wiederbelebte und daraus eine Marke machte, bekannt für ihre Kisten, ihre Editionen und ihre hohen Preise.

Lange hatte sie keine Fabrik. Seit 2012 arbeitete sie mit American Caribbean Cigars in Estelí zusammen, unter einer Fünfjahresvereinbarung: hundertfünfzigtausend Zigarren im ersten Jahr, fünf Millionen im Jahr 2016. Im Mai 2017 kaufte sie die Fabrik — und hörte auf, ein Haus ohne Mauern zu sein.

Deshalb ist dieser Eintrag nicaraguanisch. Die Tabacalera Las Lavas in der Dominikanischen Republik — die der Familie Cuevas, die dieser Atlas führt — produziert ebenfalls für sie; doch die Werkstatt, die ihr gehört, steht in Estelí, und sie ist es, die das Haus bestimmt.',

 'Gurkha 把自己的名字上溯至 1887 年的英属印度，以及据称由其得名的廓尔喀士兵所抽的一种雪茄。这是公司自己的说法；并无独立来源可以证实，本图集如实转述而不据为己有。

可以确证的部分始于 1990 年代，Kaizad Hansotia 重启这个名字，并把它做成一个以包装、限量与高价著称的品牌。

它长期没有自己的工厂。自 2012 年起，它与埃斯特利的 American Caribbean Cigars 签有五年合作：第一年十五万支，到 2016 年已达五百万支。2017 年 5 月，它买下了这家工厂——从此不再是一家没有厂房的公司。

这正是本条目归入尼加拉瓜的原因。多米尼加共和国的 Tabacalera Las Lavas——Cuevas 家族那一家，本图集已有收录——也为它代工；但属于它自己的作坊在埃斯特利，而定义它的正是那一间。',

 'ترجع غوركا باسمها إلى عام 1887 في الهند البريطانية، وإلى سيجار يُقال إنّ جنود الغوركا الذين تحمل اسمهم كانوا يدخّنونه. تلك رواية الدار؛ ولا تثبتها أيّ مصادر مستقلّة، وينقلها هذا الأطلس من دون أن يتبنّاها.

أمّا الثابت فيبدأ في التسعينيات، حين أعاد كايزاد هانسوتيا إحياء الاسم وجعل منه علامة عُرفت بعلبها وإصداراتها وأسعارها المرتفعة.

وظلّت طويلًا بلا مصنع. فمنذ 2012 كانت تعمل مع «أمريكان كاريبيان سيغارز» في إستيلي باتفاق خمسيّ: مئة وخمسون ألف سيجار في السنة الأولى، وخمسة ملايين في 2016. وفي مايو 2017 اشترت المصنع — فكفّت عن كونها دارًا بلا جدران.

ولهذا صُنّفت هذه البطاقة نيكاراغوية. فتاباكاليرا لاس لافاس في الجمهورية الدومينيكية — مصنع عائلة كويفاس الذي يضمّه هذا الأطلس — تنتج لها أيضًا؛ غير أنّ الورشة التي تملكها هي في إستيلي، وهي التي تحدّدها.',

 '[{"name":"Gurkha Cellar Reserve","color":"#4A2C1A","force":"Medium-Full","wrapper":"Nicaraguan blend","vitolas":["Robusto","Toro","Churchill"],"story":"The range on which the house rests its ageing argument. It is also the one that fixed its reputation for high prices, well before it owned a factory."},{"name":"Gurkha Nicaragua Series","color":"#6B4226","force":"Full","wrapper":"Nicaragua","vitolas":["Robusto","Toro"],"story":"The range born after the purchase of American Caribbean Cigars: a Nicaraguan puro made in its own Estelí factory. It states the house''s change of standing."},{"name":"Gurkha Heritage","color":"#8B5A2B","force":"Medium","wrapper":"Nicaraguan blend","vitolas":["Robusto","Toro"],"story":"The name points to the 1887 account, which the house carries and which nothing establishes. The cigar itself is contemporary and comes out of Estelí."}]',

 '[{"name":"Gurkha Cellar Reserve","color":"#4A2C1A","force":"Medium-Full","wrapper":"Ligada nicaragüense","vitolas":["Robusto","Toro","Churchill"],"story":"La gama sobre la que la casa apoya su argumento de añejamiento. Es también la que fijó su fama de precios altos, mucho antes de que tuviera fábrica."},{"name":"Gurkha Nicaragua Series","color":"#6B4226","force":"Full","wrapper":"Nicaragua","vitolas":["Robusto","Toro"],"story":"La gama nacida tras la compra de American Caribbean Cigars: un puro nicaragüense hecho en su propia fábrica de Estelí. Dice el cambio de condición de la casa."},{"name":"Gurkha Heritage","color":"#8B5A2B","force":"Medium","wrapper":"Ligada nicaragüense","vitolas":["Robusto","Toro"],"story":"El nombre remite al relato de 1887, que la casa sostiene y que nada establece. El puro, en cambio, es contemporáneo y sale de Estelí."}]',

 '[{"name":"Gurkha Cellar Reserve","color":"#4A2C1A","force":"Medium-Full","wrapper":"Nicaraguanische Mischung","vitolas":["Robusto","Toro","Churchill"],"story":"Die Linie, auf die das Haus sein Reifungsargument stützt. Sie hat auch seinen Ruf für hohe Preise begründet, lange bevor es eine Fabrik besaß."},{"name":"Gurkha Nicaragua Series","color":"#6B4226","force":"Full","wrapper":"Nicaragua","vitolas":["Robusto","Toro"],"story":"Die Linie, die nach dem Kauf von American Caribbean Cigars entstand: ein nicaraguanischer Puro aus der eigenen Fabrik in Estelí. Sie benennt den Statuswechsel des Hauses."},{"name":"Gurkha Heritage","color":"#8B5A2B","force":"Medium","wrapper":"Nicaraguanische Mischung","vitolas":["Robusto","Toro"],"story":"Der Name verweist auf die Erzählung von 1887, die das Haus führt und die nichts belegt. Die Zigarre selbst ist zeitgenössisch und kommt aus Estelí."}]',

 '[{"name":"Gurkha Cellar Reserve","color":"#4A2C1A","force":"Medium-Full","wrapper":"尼加拉瓜配方","vitolas":["Robusto","Toro","Churchill"],"story":"公司用以支撑陈化说法的一条线，也是在它拥有工厂之前就为它奠定高价名声的一条。"},{"name":"Gurkha Nicaragua Series","color":"#6B4226","force":"Full","wrapper":"尼加拉瓜","vitolas":["Robusto","Toro"],"story":"收购 American Caribbean Cigars 之后诞生的一条线：在自有的埃斯特利工厂制作的尼加拉瓜纯产雪茄。它道出了这家身份的转变。"},{"name":"Gurkha Heritage","color":"#8B5A2B","force":"Medium","wrapper":"尼加拉瓜配方","vitolas":["Robusto","Toro"],"story":"这个名字指向 1887 年的那段叙述——公司如此宣称，却无从证实。至于雪茄本身，则是当代的，出自埃斯特利。"}]',

 '[{"name":"Gurkha Cellar Reserve","color":"#4A2C1A","force":"Medium-Full","wrapper":"مزيج نيكاراغوي","vitolas":["Robusto","Toro","Churchill"],"story":"السلسلة التي تسند إليها الدار حجّتها في التعتيق. وهي أيضًا التي رسّخت سمعتها بالأسعار المرتفعة، قبل أن تملك مصنعًا بزمن."},{"name":"Gurkha Nicaragua Series","color":"#6B4226","force":"Full","wrapper":"نيكاراغوا","vitolas":["Robusto","Toro"],"story":"السلسلة التي وُلدت بعد شراء «أمريكان كاريبيان سيغارز»: سيجار نيكاراغوي خالص يُصنع في مصنعها الخاص بإستيلي. وهي تقول تغيّر وضع الدار."},{"name":"Gurkha Heritage","color":"#8B5A2B","force":"Medium","wrapper":"مزيج نيكاراغوي","vitolas":["Robusto","Toro"],"story":"يحيل الاسم إلى رواية 1887 التي تحملها الدار ولا يثبتها شيء. أمّا السيجار فمعاصر، ويخرج من إستيلي."}]'),

-- ── La Barba ─────────────────────────────────────────────
('La Barba', 'dominican', '2013 — Tony Bellatto et Craig Rossi',
 'Tabacalera William Ventura, Rép. dominicaine (auparavant Aladino, Danlí)',

 'La Barba a changé de pays sans changer de nom. Tony Bellatto et Craig Rossi fondent la maison au début des années 2010 ; le premier cigare, La Barba Red, paraît en 2013.

Il était alors roulé au Honduras, à la fabrique Aladino de Danlí — celle de la famille Eiroa, l''ancien cinéma que cet atlas raconte sur la fiche Asylum.

En 2014, le Purple sort avec des tabacs dominicains, et la maison s''associe à la Tabacalera William Ventura. Le Red a suivi : il a quitté le Honduras pour ce même atelier. C''est la fabrique où Robert Caldwell fait composer ses assemblages, et l''atlas porte les deux maisons.

Les gammes se désignent par des couleurs plutôt que par des noms — Red, Purple — ce qui est une manière de ne rien promettre avant que le cigare ait parlé.',

 '[{"name":"La Barba Red","color":"#8B2222","force":"Medium-Full","wrapper":"Assemblage Ventura","vitolas":["Robusto","Toro","Corona"],"story":"Le premier cigare de la maison, sorti en 2013. Il était alors fait à la fabrique Aladino, au Honduras ; il est passé depuis à la Tabacalera William Ventura, en République dominicaine."},{"name":"La Barba Purple","color":"#5B3A6E","force":"Medium","wrapper":"Assemblage dominicain, chez Ventura","vitolas":["Robusto","Toro"],"story":"Sortie en 2014, et bâtie sur des tabacs dominicains. C''est elle qui a fait basculer toute la maison vers l''atelier des Ventura."}]',

 'La Barba changed country without changing its name. Tony Bellatto and Craig Rossi founded the house in the early 2010s; the first cigar, La Barba Red, appeared in 2013.

It was rolled then in Honduras, at the Aladino factory in Danlí — the Eiroa family''s, the former cinema this atlas recounts on the Asylum entry.

In 2014 Purple came out with Dominican tobaccos, and the house went into partnership with Tabacalera William Ventura. Red followed: it left Honduras for that same workshop. It is the factory where Robert Caldwell has his blends made, and the atlas holds both houses.

The ranges are designated by colours rather than by names — Red, Purple — which is a way of promising nothing before the cigar has spoken.',

 'La Barba cambió de país sin cambiar de nombre. Tony Bellatto y Craig Rossi fundan la casa a principios de la década de 2010; el primer puro, La Barba Red, aparece en 2013.

Se liaba entonces en Honduras, en la fábrica Aladino de Danlí: la de la familia Eiroa, el antiguo cine que este atlas cuenta en la ficha de Asylum.

En 2014 sale el Purple con tabacos dominicanos, y la casa se asocia con la Tabacalera William Ventura. El Red siguió: dejó Honduras por ese mismo taller. Es la fábrica donde Robert Caldwell hace componer sus ligadas, y el atlas recoge ambas casas.

Las gamas se designan por colores y no por nombres — Red, Purple —, que es una manera de no prometer nada antes de que el puro haya hablado.',

 'La Barba wechselte das Land, ohne den Namen zu wechseln. Tony Bellatto und Craig Rossi gründeten das Haus Anfang der 2010er Jahre; die erste Zigarre, La Barba Red, erschien 2013.

Sie wurde damals in Honduras gerollt, in der Aladino-Fabrik von Danlí — der der Familie Eiroa, jenem ehemaligen Kino, das dieser Atlas im Eintrag Asylum erzählt.

2014 kam Purple mit dominikanischen Tabaken heraus, und das Haus verband sich mit der Tabacalera William Ventura. Red folgte: Es verließ Honduras für dieselbe Werkstatt. Es ist die Fabrik, in der Robert Caldwell seine Mischungen fertigen lässt, und der Atlas führt beide Häuser.

Die Linien werden mit Farben statt mit Namen bezeichnet — Red, Purple —, was eine Art ist, nichts zu versprechen, bevor die Zigarre gesprochen hat.',

 'La Barba 换了国家，却没换名字。Tony Bellatto 与 Craig Rossi 在 2010 年代初创办了这家公司；第一支雪茄 La Barba Red 于 2013 年问世。

它当时在洪都拉斯卷制，出自丹利的 Aladino 工厂——Eiroa 家族那一间，也就是本图集在 Asylum 条目中讲到的那座旧电影院。

2014 年，Purple 以多米尼加烟叶问世，公司随之与 Tabacalera William Ventura 合作。Red 也跟着走了：它离开洪都拉斯，转入同一间作坊。那正是 Robert Caldwell 委托调配的工厂，本图集收录了这两家。

各条产品线以颜色而非名称标示——Red、Purple——这也是一种做法：在雪茄开口之前，不作任何许诺。',

 'غيّرت «لا باربا» بلدها ولم تغيّر اسمها. أسّس توني بيلاتو وكريغ روسي الدار في مطلع العقد الثاني من الألفية؛ وظهر أوّل سيجار لها، «لا باربا ريد»، عام 2013.

كان يُلَفّ حينها في هندوراس، في مصنع «ألادينو» بدانلي — مصنع عائلة إيروا، تلك السينما القديمة التي يرويها هذا الأطلس في بطاقة «أسايلم».

وفي 2014 صدر «بيربل» بأتبغة دومينيكية، وارتبطت الدار بـ«تاباكاليرا وليام بينتورا». ثم تبعه «ريد»: غادر هندوراس إلى الورشة نفسها. وهي المصنع الذي يُعِدّ فيه روبرت كالدويل مزائجه، والأطلس يضمّ الدارين معًا.

وتُسمّى السلاسل بالألوان لا بالأسماء — ريد، بيربل — وتلك طريقة في ألّا تَعِد بشيء قبل أن ينطق السيجار.',

 '[{"name":"La Barba Red","color":"#8B2222","force":"Medium-Full","wrapper":"Ventura blend","vitolas":["Robusto","Toro","Corona"],"story":"The house''s first cigar, out in 2013. It was then made at the Aladino factory in Honduras; it has since moved to Tabacalera William Ventura, in the Dominican Republic."},{"name":"La Barba Purple","color":"#5B3A6E","force":"Medium","wrapper":"Dominican blend, at Ventura","vitolas":["Robusto","Toro"],"story":"Out in 2014, and built on Dominican tobaccos. It is what tipped the whole house towards the Ventura workshop."}]',

 '[{"name":"La Barba Red","color":"#8B2222","force":"Medium-Full","wrapper":"Ligada Ventura","vitolas":["Robusto","Toro","Corona"],"story":"El primer puro de la casa, salido en 2013. Se hacía entonces en la fábrica Aladino, en Honduras; ha pasado desde entonces a la Tabacalera William Ventura, en la República Dominicana."},{"name":"La Barba Purple","color":"#5B3A6E","force":"Medium","wrapper":"Ligada dominicana, en Ventura","vitolas":["Robusto","Toro"],"story":"Salida en 2014 y construida sobre tabacos dominicanos. Es la que inclinó a toda la casa hacia el taller de los Ventura."}]',

 '[{"name":"La Barba Red","color":"#8B2222","force":"Medium-Full","wrapper":"Ventura-Mischung","vitolas":["Robusto","Toro","Corona"],"story":"Die erste Zigarre des Hauses, 2013 erschienen. Sie wurde damals in der Aladino-Fabrik in Honduras gefertigt; seither ist sie zur Tabacalera William Ventura in die Dominikanische Republik gewechselt."},{"name":"La Barba Purple","color":"#5B3A6E","force":"Medium","wrapper":"Dominikanische Mischung, bei Ventura","vitolas":["Robusto","Toro"],"story":"2014 erschienen und auf dominikanischen Tabaken aufgebaut. Sie hat das ganze Haus zur Werkstatt der Ventura hinüberkippen lassen."}]',

 '[{"name":"La Barba Red","color":"#8B2222","force":"Medium-Full","wrapper":"Ventura 配方","vitolas":["Robusto","Toro","Corona"],"story":"这家的第一支雪茄，2013 年问世。它当时产自洪都拉斯的 Aladino 工厂，此后迁至多米尼加共和国的 Tabacalera William Ventura。"},{"name":"La Barba Purple","color":"#5B3A6E","force":"Medium","wrapper":"多米尼加配方，产自 Ventura","vitolas":["Robusto","Toro"],"story":"2014 年问世，以多米尼加烟叶为基础。正是它把整家公司带向了 Ventura 的作坊。"}]',

 '[{"name":"La Barba Red","color":"#8B2222","force":"Medium-Full","wrapper":"مزيج بينتورا","vitolas":["Robusto","Toro","Corona"],"story":"أوّل سيجار للدار، صدر عام 2013. كان يُصنع حينها في مصنع ألادينو بهندوراس، ثم انتقل إلى تاباكاليرا وليام بينتورا في الجمهورية الدومينيكية."},{"name":"La Barba Purple","color":"#5B3A6E","force":"Medium","wrapper":"مزيج دومينيكي، عند بينتورا","vitolas":["Robusto","Toro"],"story":"صدر عام 2014، وبُني على أتبغة دومينيكية. وهو الذي أمال الدار كلّها نحو ورشة آل بينتورا."}]');

-- ── Les sceaux, calculés depuis les colonnes ─────────────
INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'brands', b.`name`, c.champ, l.lang,
       SHA1(CASE c.champ WHEN 'history' THEN b.`history` ELSE b.`gamme` END),
       'machine', NOW()
  FROM `brands` b
  JOIN (SELECT 'history' champ UNION ALL SELECT 'gamme') c
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE b.`name` IN ('Ferio Tego','Paul Garmirian','Gurkha','La Barba')
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 191','systeme','quatre_maisons_ajoutees','marque',0,
   'Ferio Tego (Herklots et Scott, 2021, dominican), Paul Garmirian (1990, dominican), Gurkha (relancee par Kaizad Hansotia, nicaragua) et La Barba (Bellatto et Rossi, 2013, dominican)'),
  (NULL,'migration 191','systeme','sixieme_et_septieme_erreur_de_pays','marque',0,
   'docs/maisons-absentes.md classait GURKHA en Republique dominicaine et LA BARBA au Nicaragua ; les deux sont fausses. Gurkha a RACHETE sa fabrique — l American Caribbean Cigars a Esteli — en mai 2017 ; Las Lavas produit aussi pour elle mais l usine qui lui appartient est nicaraguayenne. La Barba a QUITTE le Honduras : son premier cigare sortait de la fabrique Aladino de Danli, tout est passe depuis a la Tabacalera William Ventura en Republique dominicaine. Cela porte a SEPT les erreurs de pays du recensement, apres Nicoya, La Palina, Padilla, Asylum et Micallef'),
  (NULL,'migration 191','systeme','le_document_verifie_contre_la_base','systeme',0,
   'IL NE RESTAIT PAS 37 MAISONS MAIS 28. Le document listait encore comme absentes HVC, Fratello, Curivari et Black Label Trading (faites a la migration 188) et Selected Tobacco (faite a la 180). Verifie contre la BASE, pas contre le document. Et ZINO N EST PAS UNE MAISON : c est une ligne d Oettinger Davidoff, que sa propre fiche nomme deja — meme cas qu Oliveros, etiquette de Boutique Blends'),
  (NULL,'migration 191','systeme','qui_fait_quoi','marque',0,
   'LES QUATRE FICHES NOMMENT LEURS ATELIERS, et six partenaires ont deja leur fiche ici. FERIO TEGO : Quesada (Tabacos de Exportacion, Licey) fait le Metropolitan et deux Timeless, Plasencia (Esteli) fait les deux autres Timeless ; les marques viennent de NAT SHERMAN, rachetees a Altria apres qu elle a ferme sa division cigare en 2020. PAUL GARMIRIAN : O.K. Cigars, la fabrique du groupe Davidoff qui fait l AVO, sur le campus Tabadom que l atlas nomme deja chez Davidoff et The Griffin s. GURKHA : sa propre usine d Esteli depuis 2017, et Las Lavas — celle de Casa Cuevas — produit aussi pour elle. LA BARBA : Aladino a Danli hier, Tabacalera William Ventura aujourd hui — l atelier de CALDWELL'),
  (NULL,'migration 191','systeme','recit_attribue','marque',0,
   'GURKHA FAIT REMONTER SON NOM A 1887, dans l Inde britannique, et a un cigare qu auraient fume les soldats gurkhas. Aucune source independante ne l etablit : la fiche l attribue a la maison, comme elle l a fait pour Alphonse XIII chez Cuesta-Rey et pour Churchill chez Vargas et La Aroma de Cuba');

-- ════════════════════════════════════════════════════════
-- LES TABLEAUX DE PAYS, EN TOUTES LETTRES
-- ════════════════════════════════════════════════════════
-- dominican : 32 → 35 entrées
UPDATE `producer_countries`
   SET `brands` = '[{"desc":"Opus X — les plus convoités au monde","name":"Arturo Fuente","iconic":true},{"desc":"Luxe suisse, manufacture dominicaine","name":"Davidoff","iconic":true},{"desc":"Artisanat d''exception depuis 1996","name":"La Flor Dominicana","iconic":true},{"desc":"Standard mondial du Connecticut","name":"Macanudo","iconic":false},{"desc":"ESG et VSG, intemporels","name":"Ashton","iconic":false},{"desc":"Créée par le pianiste Avo Uvezian","name":"Avo","iconic":false},{"desc":"La douceur comme valeur absolue, depuis 1993","name":"Santa Damiana","iconic":false},{"desc":"1903, la plus ancienne manufacture dominicaine","name":"La Aurora","iconic":true},{"desc":"Repartir de zéro après une carrière entière","name":"E.P. Carrillo","iconic":true},{"desc":"1974, avant la vague — et toujours familiale","name":"Quesada","iconic":false},{"desc":"Tamboril, où la même main roule plusieurs bagues","name":"PDR Cigars","iconic":false},{"desc":"L''autre Montecristo, celui d''après 1960","name":"Montecristo Dominicain","iconic":true},{"desc":"Même bague que le havane, autre cigare","name":"Romeo y Julieta Dominicain","iconic":false},{"desc":"Le cigare que des dizaines de milliers de gens fument vraiment","name":"VegaFina","iconic":true},{"desc":"Un bon cigare selon le marché d''avant la mode de la puissance","name":"Don Diego","iconic":false},{"desc":"Né d''une boîte de nuit genevoise, et cela s''entend","name":"The Griffin''s","iconic":false},{"desc":"Un industriel redevenu artisan","name":"Matilde","iconic":false},{"desc":"La bague au pied du cigare — personne d''autre n''a osé","name":"Juan Clemente","iconic":false},{"desc":"Cape venue du Cameroun, cigares roulés ici","name":"Meerapfel","iconic":false},{"desc":"Née chez El Credito, à Miami, en 1972","name":"La Gloria Cubana Dominicaine","iconic":false},{"desc":"Tabacalera de García, La Romana","name":"H. Upmann Dominicain","iconic":false},{"desc":"Ne subsiste que hors de Cuba","name":"Henry Clay","iconic":false},{"desc":"Collection non cubaine annoncée en 2016","name":"Por Larrañaga Dominicain","iconic":false},{"name":"Boutique Blends","desc":"Rafael Nodal — Aging Room et Swag, chez Jochy Blanco","iconic":false},{"name":"Diamond Crown","desc":"La commande de Stanford Newman à Carlos Fuente Sr., pour le centenaire de 1995","iconic":false},{"name":"Cuesta-Rey","desc":"1884, Ybor City — plus ancienne que la maison qui la possède","iconic":false},{"name":"Tabacalera Palma","desc":"1936 — la fabrique dont sortent Aging Room, Swag, La Galera et Matilde","iconic":true},{"name":"Aging Room","desc":"Rafael Nodal compose, Jochy Blanco fabrique — et ils sont associés","iconic":true},{"name":"Swag","desc":"L''autre marque de Boutique Blends, même atelier, sans cérémonie","iconic":false},{"name":"Kristoff","desc":"Une visite non sollicitée en 2004, et un financier qui change de métier","iconic":false},{"name":"Caldwell Cigar Co.","desc":"Des tabacs rares plutôt qu''une recette reproductible","iconic":false},{"name":"Casa Cuevas","desc":"Tabacalera Las Lavas — trois générations sur un même assemblage","iconic":false},{"name":"Ferio Tego","desc":"L''héritière de Nat Sherman : Quesada et Plasencia se partagent son catalogue","iconic":true},{"name":"Paul Garmirian","desc":"Un livre en 1990, puis un cigare — roulé chez la fabrique qui fait l''Avo","iconic":false},{"name":"La Barba","desc":"Partie du Honduras pour l''atelier des Ventura, celui de Caldwell","iconic":false}]',
       `updated_at` = NOW()
 WHERE `id` = 'dominican';

-- nicaragua : 35 → 36 entrées
UPDATE `producer_countries`
   SET `brands` = '[{"desc":"Référence absolue du Nicaragua premium","name":"Padrón","iconic":true},{"desc":"Pepin Garcia, maître torcedor légendaire","name":"My Father","iconic":true},{"desc":"Serie V mondialement reconnue","name":"Oliva","iconic":true},{"desc":"Liga Privada, révolution moderne","name":"Drew Estate","iconic":true},{"desc":"Plus grand producteur familial","name":"Plasencia","iconic":false},{"desc":"Élégance et puissance fusionnées","name":"Rocky Patel","iconic":false},{"desc":"Maître du Connecticut nicaraguayen","name":"Perdomo","iconic":false},{"desc":"Plus ancienne manufacture du pays","name":"Joya de Nicaragua","iconic":false},{"desc":"Le mélange privé de Jonathan Drew, devenu culte","name":"Liga Privada","iconic":false},{"desc":"Maison suisse de 1888, roulée à Estelí","name":"Villiger","iconic":false},{"desc":"Le rouleur que les autres marques employaient sans le nommer","name":"A.J. Fernandez","iconic":true},{"desc":"D''abord un planteur de Jalapa, ensuite une marque","name":"Aganorsa Leaf","iconic":true},{"desc":"La grammaire cubaine, la matière nicaraguayenne","name":"Tatuaje","iconic":false},{"desc":"Celle qui a rendu le petit format respectable","name":"Illusione","iconic":false},{"desc":"Un cigare ancré dans une culture, pas seulement un terroir","name":"Foundation Cigar Company","iconic":false},{"desc":"Granada plutôt qu''Estelí, et l''atelier ouvert aux visiteurs","name":"Mombacho","iconic":false},{"desc":"Une marque qui s''est offert sa propre manufacture","name":"Espinosa","iconic":true},{"desc":"Pas d''usine : elle choisit son rouleur selon l''assemblage","name":"Crowned Heads","iconic":true},{"desc":"Des noms cubains d''avant 1960, des assemblages d''aujourd''hui","name":"Warped","iconic":false},{"desc":"Maison nicaraguayenne, encore peu documentée ici","name":"Capitol","iconic":false},{"desc":"Repris par la famille García en décembre 2019, après quarante-cinq ans chez Quesada","name":"Fonseca Nicaraguayen","iconic":false},{"name":"Nicoya","desc":"Maison australienne roulée à Estelí — l''Australie ne cultive plus depuis 2006","iconic":false},{"name":"Dunbarton Tobacco & Trust","desc":"Steve Saka, ex-Drew Estate, parti monter sa maison sans usine","iconic":true},{"name":"RoMa Craft Tobac","desc":"Commencée dans un garage, puis son propre atelier à Estelí","iconic":true},{"name":"Viaje","desc":"Plus de gamme régulière depuis 2012 : rien que des séries limitées","iconic":false},{"name":"Room101","desc":"D''un bijoutier au cigare ; trois manufactures, deux pays","iconic":false},{"name":"L''Atelier","desc":"La seconde maison de Pete Johnson, chez My Father comme Tatuaje","iconic":false},{"name":"La Aroma de Cuba","desc":"Nom cubain des années 1880, refait par Pepin García en 2009","iconic":false},{"name":"Southern Draw","desc":"Robert et Sharon Holt — un seul atelier, ce qui est rare","iconic":false},{"name":"HVC Cigars","desc":"Havana City ; dix ans sans usine, puis la sienne en 2021","iconic":true},{"name":"Fratello","desc":"Un ingénieur de la NASA passé au cigare","iconic":false},{"name":"Curivari","desc":"Grecque de tête, cubaine d''intention, nicaraguayenne de matière","iconic":false},{"name":"Black Label Trading Co.","desc":"Une fabrique conçue comme un atelier d''artiste","iconic":false},{"name":"Asylum","desc":"L''autre moitié de CLE — et une fabrique qui fut un cinéma","iconic":false},{"name":"Micallef","desc":"Une panne de voiture, un Texan, et trois générations cubaines","iconic":false},{"name":"Gurkha","desc":"Sans usine jusqu''en 2017, puis propriétaire de la sienne à Estelí","iconic":false}]',
       `updated_at` = NOW()
 WHERE `id` = 'nicaragua';

