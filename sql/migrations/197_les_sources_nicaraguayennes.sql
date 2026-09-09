-- ════════════════════════════════════════════════════════
-- 197 — Les dix-sept nicaraguayennes : sources, une maison
--       fermee, et une fiche qui ne savait rien
-- ────────────────────────────────────────────────────────
-- Deuxieme lot du chantier ouvert par la 195. Comme pour les cubaines
-- a la 196, la verification a rendu plus que des citations.
--
-- ── MOMBACHO A FERME, ET L'ATLAS LA DECRIVAIT AU PRESENT ─
-- Le 9 juin 2023, Cameron HEAPS, fondateur de Mombacho, et Jared
-- MICHAELI, president de Favilli, ont annonce la fermeture definitive
-- de la maison et leur retrait du metier. Claudio SGROI, president et
-- maitre assembleur, etait parti en 2021 ; la demeure achetee en 2014
-- avait ete convertie en lieu d'accueil de luxe, et la marque n'a pas
-- retrouve son marche.
--
-- La fiche de l'atlas, elle, disait : « la maison roule la ou passent
-- les voyageurs, dans une demeure ancienne ouverte aux visiteurs ». Au
-- present. Depuis trois ans. Et le tableau du pays annoncait « l'atelier
-- ouvert aux visiteurs ».
--
-- C'est le meme defaut que Bolivar Honduras a la 193 — une fiche juste
-- le jour ou elle a ete ecrite, fausse depuis, et qui n'a pas change de
-- forme en changeant de valeur. La migration 172 l'avait nomme ; il
-- revient a chaque lot.
--
-- ── CAPITOL : LA FICHE DISAIT NE RIEN SAVOIR ────────────
-- Elle etait honnete et le disait : « Ni l'annee de fondation, ni
-- l'atelier qui roule ses cigares, ni la composition de ses gammes ne
-- sont etablis ici. » C'etait la bonne decision au moment ou elle a ete
-- prise. La recherche menee pour ce lot a rendu ce qui manquait, et
-- c'est un cas de collaboration exemplaire :
--
--   RAFAEL NODAL      compose — celui d'Aging Room et de Boutique
--                     Blends, qui dirige aussi le produit chez
--                     Altadis USA
--   PLASENCIA         fabrique, a Esteli, chez Nestor Plasencia
--   TABACALERA        possede et distribue
--
-- Les deux premiers ont deja leur fiche dans cet atlas. Le troisieme
-- est un groupe, pas une manufacture.
--
-- L'annee de lancement, elle, n'est toujours pas etablie : le champ le
-- dit, comme chez Kolumbus et Vegas de Santiago.
--
-- ── UNE DATE ENFIN POSEE ────────────────────────────────
-- A.J. FERNANDEZ portait « Annees 2000 — Esteli ». C'est 2003 :
-- en.wikipedia.org et cigaraficionado.com donnent la fondation de la
-- Tabacalera Fernandez a Esteli cette annee-la, AVEC SIX ROULEURS. Le
-- texte de la fiche ne porte aucune annee, donc rien ne se contredit.
--
-- ── UNE VARIANCE ECRITE PLUTOT QUE TRANCHEE ─────────────
-- WARPED : l'atlas dit 2007. cigaraficionado.com, dans son entretien
-- avec Kyle Gellis, ecrit qu'il a lance Warped EN 2009, encore
-- etudiant ; d'autres sources donnent 2007. On garde 2007 et le champ
-- `source` porte l'ecart — meme traitement que Fonseca a la 196.
--
-- Sources : en.wikipedia.org « A. J. Fernandez Cigars » et
-- cigaraficionado.com (Tabacalera Fernandez, Esteli, 2003, six
-- rouleurs ; San Lotano repris en 2010) ; cigaraficionado.com « Q&A:
-- Kyle Gellis, Owner of Warped Cigars » (TABSA, El Titan de Bronze,
-- l'annee de lancement) ; blindmanspuff.com « Favilli/Mombacho Cigars
-- to Close Permanently » et cigar-coop.com « Mombacho/Favilli Closes
-- Operations » (9 juin 2023, Heaps, Michaeli, le depart de Sgroi en
-- 2021, la demeure achetee en 2014) ; cigaraficionado.com « A Visit To
-- Mombacho Cigars » (2006, Granada, Casa Favilli batie en 1925 par
-- Mario Favilli Bendichi, convertie en 2014) ; cigarjournal.com
-- « Capitol — 100% Nicaraguan. 100% Handmade » et cigarinspector.com
-- « Tabacalera introduces Nicaraguan Capitol » (Nodal, Plasencia,
-- Tabacalera, les trois vitoles, le theme des annees 1920 et Duke
-- Ellington) ; cigaraficionado.com « The Mission of My Father » et
-- en.wikipedia.org (El Rey de los Habanos en 2002-2003 a Miami, la
-- Tabacalera Cubana d'Esteli en 2006, la marque My Father creee par
-- Jaime Garcia en 2008).
--
-- Apres cette migration :
--   php tools/contenu_dump.php
--   php tools/i18n_dump.php > sql/traductions.sql
--   php tools/sources.php --verifier
-- ════════════════════════════════════════════════════════

-- ════════════════════════════════════════════════════════
-- 1. MOMBACHO — la maison a fermé le 9 juin 2023
-- ════════════════════════════════════════════════════════
UPDATE `brands` SET
  `founded` = '2006 — Granada ; fermée en 2023',
  `history` = CONCAT(`history`, '\n\nIl faut écrire ce qui a suivi. Le 9 juin 2023, Cameron Heaps, fondateur de Mombacho, et Jared Michaeli, président de Favilli, ont annoncé la fermeture définitive de la maison et leur retrait du métier. Claudio Sgroi, président et maître assembleur, était parti en 2021 ; la demeure, achetée en 2014, avait été convertie en lieu d''accueil de luxe, et la marque n''a pas retrouvé son marché.\n\nCette fiche est donc une fiche d''archive. Ce qu''elle décrit — l''atelier de Granada, les visites, les séries courtes — a existé, et n''existe plus.'),
  `history_en` = CONCAT(`history_en`, '\n\nWhat followed has to be written down. On 9 June 2023, Cameron Heaps, Mombacho''s founder, and Jared Michaeli, Favilli''s president, announced the permanent closure of the house and their retirement from the trade. Claudio Sgroi, president and master blender, had left in 2021; the mansion, bought in 2014, had been turned into a luxury hospitality venue, and the brand never found its market again.\n\nThis entry is therefore an archive entry. What it describes — the Granada workshop, the visits, the short runs — existed, and exists no longer.'),
  `history_es` = CONCAT(`history_es`, '\n\nHay que escribir lo que vino después. El 9 de junio de 2023, Cameron Heaps, fundador de Mombacho, y Jared Michaeli, presidente de Favilli, anunciaron el cierre definitivo de la casa y su retirada del oficio. Claudio Sgroi, presidente y maestro ligador, se había ido en 2021; la mansión, comprada en 2014, se había convertido en un espacio de hostelería de lujo, y la marca no volvió a encontrar su mercado.\n\nEsta ficha es, pues, una ficha de archivo. Lo que describe —el taller de Granada, las visitas, las series cortas— existió, y ya no existe.'),
  `history_de` = CONCAT(`history_de`, '\n\nWas danach kam, muss festgehalten werden. Am 9. Juni 2023 gaben Cameron Heaps, Gründer von Mombacho, und Jared Michaeli, Präsident von Favilli, die endgültige Schliessung des Hauses und ihren Rückzug aus dem Gewerbe bekannt. Claudio Sgroi, Präsident und Chef-Blender, war 2021 gegangen; das 2014 gekaufte Herrenhaus war in eine Luxus-Gastronomie verwandelt worden, und die Marke fand ihren Markt nicht wieder.\n\nDieser Eintrag ist damit ein Archiveintrag. Was er beschreibt — die Werkstatt in Granada, die Besuche, die kleinen Serien — hat existiert und existiert nicht mehr.'),
  `history_zh` = CONCAT(`history_zh`, '\n\n后来的事必须写下来。2023 年 6 月 9 日，Mombacho 创办人 Cameron Heaps 与 Favilli 总裁 Jared Michaeli 宣布这家公司永久关闭，并退出这一行。总裁兼首席调配师 Claudio Sgroi 已于 2021 年离开；2014 年买下的那座宅邸改成了高端接待场所，而品牌再没能找回自己的市场。\n\n因此，本条目是一份档案条目。它所描述的——格拉纳达的作坊、参观、小批量——曾经存在，如今不复存在。'),
  `history_ar` = CONCAT(`history_ar`, '\n\nلا بدّ من تسجيل ما جرى بعد ذلك. في 9 يونيو 2023 أعلن كاميرون هيبس، مؤسّس «مومباتشو»، وجاريد ميكائيلي، رئيس «فافيلّي»، الإغلاق النهائيّ للدار وانسحابهما من المهنة. وكان كلاوديو سغروي، الرئيس وكبير المازجين، قد غادر عام 2021؛ أمّا القصر الذي اشتُري عام 2014 فقد تحوّل إلى مكان ضيافة فاخر، ولم تستعد العلامة سوقها.\n\nوهذه البطاقة إذن بطاقة أرشيف. فما تصفه — ورشة غرناطة، والزيارات، والدفعات الصغيرة — قد وُجد، ولم يعد موجودًا.'),
  `updated_at` = NOW()
 WHERE `name` = 'Mombacho';

SELECT 'fr' AS lang, `history`    LIKE '%9 juin 2023%'   AS ok FROM `brands` WHERE `name`='Mombacho'
UNION ALL SELECT 'en', `history_en` LIKE '%9 June 2023%'   FROM `brands` WHERE `name`='Mombacho'
UNION ALL SELECT 'es', `history_es` LIKE '%9 de junio de 2023%' FROM `brands` WHERE `name`='Mombacho'
UNION ALL SELECT 'de', `history_de` LIKE '%9. Juni 2023%'  FROM `brands` WHERE `name`='Mombacho'
UNION ALL SELECT 'zh', `history_zh` LIKE '%2023 年 6 月 9 日%' FROM `brands` WHERE `name`='Mombacho'
UNION ALL SELECT 'ar', `history_ar` LIKE '%9 يونيو 2023%'   FROM `brands` WHERE `name`='Mombacho';

-- ════════════════════════════════════════════════════════
-- 2. CAPITOL — la fiche qui disait ne rien savoir
-- ════════════════════════════════════════════════════════
UPDATE `brands` SET
  `founded` = 'Année non établie — marque de Tabacalera',
  `factory` = 'Plasencia Cigars, Estelí, Nicaragua',
  `history` = 'Capitol n''est pas une maison au sens où l''atlas emploie le mot. C''est une marque du groupe Tabacalera, et sa fabrication se partage entre trois acteurs distincts — ce qui en fait un cas d''école du métier d''aujourd''hui.

L''assemblage est de Rafael Nodal, celui d''Aging Room et de Boutique Blends, qui dirige aussi le produit chez Altadis USA. La fabrication est de Plasencia, à Estelí, dans la manufacture de Nestor Plasencia. La propriété et la distribution reviennent à Tabacalera. Les deux premiers ont leur fiche dans cet atlas ; le troisième est un groupe, pas une manufacture.

Le cigare est nicaraguayen de bout en bout : cape, sous-cape et tripe. Le catalogue tient en trois vitoles — Jack, Casino et Gala — et il n''y en a pas d''autres.

Le nom et l''habillage viennent des années 1920. Nodal dit y avoir mis son goût du jazz, et Duke Ellington en particulier : c''est une marque bâtie sur une décennie et une musique, là où les autres le sont sur une famille ou sur un terroir.

L''année de lancement, elle, n''est établie par aucune source consultable, et cette fiche préfère le dire.',
  `gamme` = '[{"name":"Capitol Jack","color":"#8B5A2B","force":"Medium-Full","wrapper":"Nicaraguayen intégral","vitolas":["Robusto 4¾ × 52"],"story":"Le plus court des trois. Comme les deux autres, cape, sous-cape et tripe viennent toutes du Nicaragua."},{"name":"Capitol Casino","color":"#6B4226","force":"Medium-Full","wrapper":"Nicaraguayen intégral","vitolas":["5⅓ × 54"],"story":"Le format médian. Le nom continue l''imagerie des années 1920 qui tient lieu d''identité à la marque."},{"name":"Capitol Gala","color":"#3E2723","force":"Full","wrapper":"Nicaraguayen intégral","vitolas":["6 × 56"],"story":"Le plus grand des trois, et le plus corsé. Trois vitoles font tout le catalogue : c''est peu, et assumé."}]',
  `history_en` = 'Capitol is not a house in the sense this atlas gives the word. It is a brand of the Tabacalera group, and its making is shared between three distinct parties — which makes it a textbook case of the trade as it is now.

The blend is Rafael Nodal''s, the man behind Aging Room and Boutique Blends, who also heads product at Altadis USA. The manufacture is Plasencia''s, in Estelí, at Nestor Plasencia''s factory. Ownership and distribution belong to Tabacalera. The first two have their own entries in this atlas; the third is a group, not a factory.

The cigar is Nicaraguan throughout: wrapper, binder and filler. The catalogue holds three sizes — Jack, Casino and Gala — and there are no others.

The name and the packaging come from the 1920s. Nodal says he put his taste for jazz into them, Duke Ellington in particular: this is a brand built on a decade and a music, where others are built on a family or on a soil.

The year it was launched is established by no consultable source, and this entry prefers to say so.',
  `history_es` = 'Capitol no es una casa en el sentido que este atlas da a la palabra. Es una marca del grupo Tabacalera, y su fabricación se reparte entre tres actores distintos, lo que la convierte en un caso de manual del oficio actual.

La ligada es de Rafael Nodal, el de Aging Room y Boutique Blends, que dirige además el producto en Altadis USA. La fabricación es de Plasencia, en Estelí, en la manufactura de Nestor Plasencia. La propiedad y la distribución corresponden a Tabacalera. Los dos primeros tienen su ficha en este atlas; el tercero es un grupo, no una manufactura.

El puro es nicaragüense de cabo a rabo: capa, capote y tripa. El catálogo cabe en tres vitolas —Jack, Casino y Gala— y no hay más.

El nombre y la presentación vienen de los años veinte. Nodal dice haber puesto en ellos su gusto por el jazz, y por Duke Ellington en particular: es una marca construida sobre una década y una música, allí donde otras lo están sobre una familia o un terruño.

El año de lanzamiento no lo establece ninguna fuente consultable, y esta ficha prefiere decirlo.',
  `history_de` = 'Capitol ist kein Haus in dem Sinn, den dieser Atlas dem Wort gibt. Es ist eine Marke der Tabacalera-Gruppe, und ihre Herstellung teilt sich auf drei verschiedene Beteiligte auf — was sie zu einem Lehrbuchfall des heutigen Gewerbes macht.

Die Mischung stammt von Rafael Nodal, dem Mann hinter Aging Room und Boutique Blends, der zudem bei Altadis USA das Produkt verantwortet. Die Fertigung liegt bei Plasencia in Estelí, in der Fabrik von Nestor Plasencia. Eigentum und Vertrieb gehören Tabacalera. Die ersten beiden haben in diesem Atlas ihren eigenen Eintrag; die dritte ist ein Konzern, keine Manufaktur.

Die Zigarre ist durchgehend nicaraguanisch: Deckblatt, Umblatt und Einlage. Der Katalog umfasst drei Formate — Jack, Casino und Gala — und keine weiteren.

Name und Aufmachung stammen aus den 1920er Jahren. Nodal sagt, er habe seine Vorliebe für Jazz hineingelegt, besonders für Duke Ellington: eine Marke, die auf einem Jahrzehnt und einer Musik aufgebaut ist, wo andere auf einer Familie oder einem Boden ruhen.

Das Jahr der Einführung belegt keine einsehbare Quelle, und dieser Eintrag sagt das lieber.',
  `history_zh` = 'Capitol 不是本图集所说的那种「公司」。它是 Tabacalera 集团的一个品牌，其制作由三方分担——这使它成为当下这一行的典型例子。

配方出自 Rafael Nodal，也就是 Aging Room 与 Boutique Blends 背后的那个人，他同时主管 Altadis USA 的产品。制造由 Plasencia 承担，在埃斯特利，出自 Nestor Plasencia 的工厂。所有权与经销归 Tabacalera。前两者在本图集中各有条目；第三者是集团，不是工厂。

这支雪茄从头到尾都是尼加拉瓜的：茄衣、茄套与芯叶。整个目录只有三个尺寸——Jack、Casino 与 Gala——再无其他。

名字与包装取自 1920 年代。Nodal 说他把自己对爵士乐的偏爱放了进去，尤其是 Duke Ellington：这是一个建立在一个年代与一种音乐之上的品牌，而别家建立在一个家族或一片土地之上。

至于推出的年份，没有任何可查证的资料能确定，本条目宁可如实说出。',
  `history_ar` = 'ليست «كابيتول» دارًا بالمعنى الذي يعطيه هذا الأطلس للكلمة. إنّها علامة لمجموعة «تاباكاليرا»، وصناعتها موزّعة على ثلاثة أطراف متمايزة — وهو ما يجعلها مثالًا مدرسيًّا على المهنة كما هي اليوم.

المزيج لرفائيل نودال، صاحب «إيجنغ روم» و«بوتيك بلندز»، والمسؤول أيضًا عن المنتج في «ألتاديس يو إس إيه». والصناعة لـ«بلاسنسيا» في إستيلي، في مصنع نيستور بلاسنسيا. أمّا الملكية والتوزيع فلـ«تاباكاليرا». وللأوّلَين بطاقتاهما في هذا الأطلس؛ والثالثة مجموعة لا مصنع.

والسيجار نيكاراغويّ من أوّله إلى آخره: الغلاف والرابط والحشوة. ويتّسع الكتالوج لثلاثة قياسات — «جاك» و«كازينو» و«غالا» — ولا غير.

أمّا الاسم والتقديم فمن عشرينيات القرن الماضي. يقول نودال إنّه وضع فيهما ولعه بالجاز، وبديوك إلينغتون خاصّةً: علامة مبنيّة على عقد وعلى موسيقى، حيث تُبنى غيرها على عائلة أو على أرض.

وأمّا سنة الإطلاق فلا يُثبتها أيّ مصدر متاح، وتؤثر هذه البطاقة قول ذلك.',
  `gamme_en` = '[{"name":"Capitol Jack","color":"#8B5A2B","force":"Medium-Full","wrapper":"Nicaraguan throughout","vitolas":["Robusto 4¾ × 52"],"story":"The shortest of the three. Like the other two, wrapper, binder and filler all come from Nicaragua."},{"name":"Capitol Casino","color":"#6B4226","force":"Medium-Full","wrapper":"Nicaraguan throughout","vitolas":["5⅓ × 54"],"story":"The middle size. The name continues the 1920s imagery that stands in for the brand''s identity."},{"name":"Capitol Gala","color":"#3E2723","force":"Full","wrapper":"Nicaraguan throughout","vitolas":["6 × 56"],"story":"The largest of the three, and the fullest. Three sizes make the whole catalogue: that is little, and deliberate."}]',
  `gamme_es` = '[{"name":"Capitol Jack","color":"#8B5A2B","force":"Medium-Full","wrapper":"Nicaragüense íntegro","vitolas":["Robusto 4¾ × 52"],"story":"El más corto de los tres. Como los otros dos, capa, capote y tripa vienen todos de Nicaragua."},{"name":"Capitol Casino","color":"#6B4226","force":"Medium-Full","wrapper":"Nicaragüense íntegro","vitolas":["5⅓ × 54"],"story":"El formato medio. El nombre continúa la imaginería de los años veinte que hace las veces de identidad de la marca."},{"name":"Capitol Gala","color":"#3E2723","force":"Full","wrapper":"Nicaragüense íntegro","vitolas":["6 × 56"],"story":"El mayor de los tres, y el más fuerte. Tres vitolas componen todo el catálogo: es poco, y asumido."}]',
  `gamme_de` = '[{"name":"Capitol Jack","color":"#8B5A2B","force":"Medium-Full","wrapper":"Durchgehend nicaraguanisch","vitolas":["Robusto 4¾ × 52"],"story":"Das kürzeste der drei. Wie bei den beiden anderen stammen Deckblatt, Umblatt und Einlage sämtlich aus Nicaragua."},{"name":"Capitol Casino","color":"#6B4226","force":"Medium-Full","wrapper":"Durchgehend nicaraguanisch","vitolas":["5⅓ × 54"],"story":"Das mittlere Format. Der Name setzt die Bildwelt der 1920er Jahre fort, die der Marke als Identität dient."},{"name":"Capitol Gala","color":"#3E2723","force":"Full","wrapper":"Durchgehend nicaraguanisch","vitolas":["6 × 56"],"story":"Das grösste der drei und das kräftigste. Drei Formate machen den ganzen Katalog aus: das ist wenig, und gewollt."}]',
  `gamme_zh` = '[{"name":"Capitol Jack","color":"#8B5A2B","force":"Medium-Full","wrapper":"全尼加拉瓜","vitolas":["Robusto 4¾ × 52"],"story":"三者中最短的一支。与另外两支一样，茄衣、茄套与芯叶全部来自尼加拉瓜。"},{"name":"Capitol Casino","color":"#6B4226","force":"Medium-Full","wrapper":"全尼加拉瓜","vitolas":["5⅓ × 54"],"story":"中间的尺寸。名字延续了充当品牌身份的 1920 年代意象。"},{"name":"Capitol Gala","color":"#3E2723","force":"Full","wrapper":"全尼加拉瓜","vitolas":["6 × 56"],"story":"三者中最大、也最厚重的一支。三个尺寸构成全部目录：不多，而且是有意为之。"}]',
  `gamme_ar` = '[{"name":"Capitol Jack","color":"#8B5A2B","force":"Medium-Full","wrapper":"نيكاراغويّ بالكامل","vitolas":["Robusto 4¾ × 52"],"story":"أقصر الثلاثة. وكما في الآخرَين، يأتي الغلاف والرابط والحشوة كلّها من نيكاراغوا."},{"name":"Capitol Casino","color":"#6B4226","force":"Medium-Full","wrapper":"نيكاراغويّ بالكامل","vitolas":["5⅓ × 54"],"story":"القياس الأوسط. والاسم يواصل صور العشرينيات التي تقوم مقام هويّة العلامة."},{"name":"Capitol Gala","color":"#3E2723","force":"Full","wrapper":"نيكاراغويّ بالكامل","vitolas":["6 × 56"],"story":"أكبر الثلاثة وأقواها. ثلاثة قياسات تصنع الكتالوج كلّه: قليل، وعن قصد."}]',
  `updated_at` = NOW()
 WHERE `name` = 'Capitol';

SELECT 'fr' AS lang, `history`    LIKE '%Rafael Nodal%' AS ok FROM `brands` WHERE `name`='Capitol'
UNION ALL SELECT 'en', `history_en` LIKE '%Rafael Nodal%' FROM `brands` WHERE `name`='Capitol'
UNION ALL SELECT 'es', `history_es` LIKE '%Rafael Nodal%' FROM `brands` WHERE `name`='Capitol'
UNION ALL SELECT 'de', `history_de` LIKE '%Rafael Nodal%' FROM `brands` WHERE `name`='Capitol'
UNION ALL SELECT 'zh', `history_zh` LIKE '%Rafael Nodal%' FROM `brands` WHERE `name`='Capitol'
UNION ALL SELECT 'ar', `history_ar` LIKE '%نودال%'         FROM `brands` WHERE `name`='Capitol'
UNION ALL SELECT 'gamme fr', JSON_LENGTH(`gamme`) = 3      FROM `brands` WHERE `name`='Capitol';

-- ════════════════════════════════════════════════════════
-- 3. A.J. FERNANDEZ — une date enfin posée
-- ════════════════════════════════════════════════════════
UPDATE `brands` SET `founded` = '2003 — Estelí, Nicaragua', `updated_at` = NOW()
 WHERE `name` = 'A.J. Fernandez';

-- ════════════════════════════════════════════════════════
-- 4. LES DIX-SEPT SOURCES
-- ════════════════════════════════════════════════════════
UPDATE `brands` SET `source` = CASE `name`

WHEN 'A.J. Fernandez' THEN 'en.wikipedia.org « A. J. Fernandez Cigars » et cigaraficionado.com (Tabacalera Fernández fondée à Estelí en 2003 avec six rouleurs ; San Lotano, marque du grand-père à San Luís, reprise en 2010) — le champ de date disait « années 2000 », précisé par la migration 197'
WHEN 'Aganorsa Leaf' THEN 'cigaraficionado.com et halfwheel.com (Eduardo Fernández, 1998, Agrícola Ganadera Norteña ; la TABSA d''Estelí et les champs de Jalapa)'
WHEN 'Capitol' THEN 'cigarjournal.com « Capitol — 100% Nicaraguan. 100% Handmade » et cigarinspector.com « Tabacalera introduces Nicaraguan Capitol » (assemblage de Rafael Nodal, fabrication Plasencia à Estelí, propriété Tabacalera, les trois vitoles, le thème des années 1920) ; cigar-coop.com (revue du Capitol Casino, septembre 2020). Aucune ne donne l''année de lancement'
WHEN 'Crowned Heads' THEN 'cigaraficionado.com et halfwheel.com (Jon Huber et Mike Conder, 2011, Nashville ; production chez My Father puis à la Tabacalera La Alianza d''E.P. Carrillo)'
WHEN 'Drew Estate' THEN 'cigaraficionado.com et halfwheel.com (Jonathan Drew et Marvin Samel, 1996 à New York, l''installation à Estelí, la manufacture de 1999) ; en.wikipedia.org (Drew Estate)'
WHEN 'Espinosa' THEN 'cigaraficionado.com et halfwheel.com (Erik Espinosa, la séparation d''EO Brands, l''ouverture de La Zona à Estelí) ; cigar-coop.com'
WHEN 'Foundation Cigar Company' THEN 'foundationcigarcompany.com « About Foundation » et cigaraficionado.com « Q&A: Nick Melillo » (2015, les dix ans chez Drew Estate, El Güegüense, production chez A.J. Fernández)'
WHEN 'Illusione' THEN 'cigaraficionado.com et halfwheel.com (Dion Giolito, 2006, production à la TABSA d''Aganorsa)'
WHEN 'Liga Privada' THEN 'cigaraficionado.com et halfwheel.com (le mélange privé de Jonathan Drew, 2008, No. 9 et T52, fabrication Drew Estate à Estelí)'
WHEN 'Mombacho' THEN 'cigaraficionado.com « A Visit To Mombacho Cigars » (2006, Granada, Casa Favilli bâtie en 1925 par Mario Favilli Bendichi et convertie en fabrique en 2014) ; blindmanspuff.com et cigar-coop.com (FERMETURE DÉFINITIVE annoncée le 9 juin 2023 par Cameron Heaps et Jared Michaeli ; départ de Claudio Sgroi en 2021)'
WHEN 'My Father' THEN 'cigaraficionado.com « The Mission of My Father » et en.wikipedia.org (José « Pepín » García : El Rey de los Habanos à Miami en 2002-2003, la Tabacalera Cubana d''Estelí en 2006 d''où vient le nom My Father Cigars, la marque My Father créée par Jaime García en 2008)'
WHEN 'Padrón' THEN 'padron.com et cigaraficionado.com (José Orlando Padrón, 1964, Miami ; les fabriques d''Estelí et de Danlí ; les séries Anniversary) ; en.wikipedia.org (Padrón Cigars)'
WHEN 'Perdomo' THEN 'perdomocigars.com et cigaraficionado.com (Nick Perdomo, 1992, la première fabrique de Flagler Street à Miami, Estelí et la vallée de Jalapa) ; jrcigars.com (la gamme Nick''s Sticks)'
WHEN 'Plasencia' THEN 'plasenciacigars.com et cigaraficionado.com (la famille depuis 1865 à Cuba, l''installation en Amérique centrale, les fabriques d''Estelí et de Danlí) ; cigarjournal.com'
WHEN 'Tatuaje' THEN 'en.wikipedia.org « Tatuaje » et cigaraficionado.com (Pete Johnson, 2003, la collaboration avec Pepín García et la fabrication chez My Father)'
WHEN 'Villiger' THEN 'villigercigars.com « New Villiger cigar factory in Nicaragua » (la branche nicaraguayenne) ; la fiche de la maison mère Villiger Söhne porte ses propres sources (migration 195)'
WHEN 'Warped' THEN 'cigaraficionado.com « Q&A: Kyle Gellis, Owner of Warped Cigars » (TABSA à Estelí, El Titan de Bronze à Miami, l''emploi quasi exclusif du tabac Aganorsa) — ⚠ L''ANNÉE DIVERGE : cet entretien dit que Gellis a lancé Warped en 2009, encore étudiant ; d''autres sources donnent 2007, année que l''atlas retient'

ELSE `source` END,
`updated_at` = NOW()
 WHERE `country_id` = 'nicaragua';

-- Dix-sept doivent être remplies, zéro doit rester vide.
SELECT COUNT(*) AS nicaraguayennes,
       SUM(`source` IS NOT NULL AND `source` <> '') AS sourcees,
       SUM(`source` IS NULL OR `source` = '')       AS sans_source
  FROM `brands` WHERE `country_id` = 'nicaragua';

-- ── Les sceaux, calculés depuis les colonnes ─────────────
INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'brands', b.`name`, c.champ, l.lang,
       SHA1(CASE c.champ WHEN 'history' THEN b.`history` ELSE b.`gamme` END),
       'machine', NOW()
  FROM `brands` b
  JOIN (SELECT 'history' champ UNION ALL SELECT 'gamme') c
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE b.`name` IN ('Mombacho','Capitol')
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 197','systeme','dix_sept_sources_nicaraguayennes','marque',0,
   'Deuxieme lot du chantier ouvert par la 195. Les dix-sept fiches nicaraguayennes sans source en recoivent une. Comme pour les cubaines a la 196, la verification a rendu plus que des citations'),
  (NULL,'migration 197','systeme','mombacho_a_ferme_et_l_atlas_la_decrivait_au_present','marque',0,
   'MOMBACHO A FERME DEFINITIVEMENT le 9 juin 2023 — annonce de Cameron Heaps, fondateur, et Jared Michaeli, president de Favilli ; Claudio Sgroi, president et maitre assembleur, etait parti en 2021. La fiche de l atlas disait AU PRESENT « la maison roule la ou passent les voyageurs, dans une demeure ancienne ouverte aux visiteurs », et le tableau du pays annoncait « l atelier ouvert aux visiteurs ». Corrige dans les six langues, et le champ founded porte desormais « 2006 — Granada ; fermee en 2023 ». Meme defaut que Bolivar Honduras a la 193 : une fiche juste le jour ou elle a ete ecrite, fausse depuis, et qui n a pas change de forme en changeant de valeur'),
  (NULL,'migration 197','systeme','capitol_la_fiche_qui_disait_ne_rien_savoir','marque',0,
   'CAPITOL : la fiche declarait explicitement ignorer l annee, l atelier et les gammes, et laissait ses rubriques vides en expliquant pourquoi. C etait la bonne decision au moment ou elle a ete prise. La recherche menee pour ce lot a rendu ce qui manquait, et c est un cas de COLLABORATION exemplaire : RAFAEL NODAL compose (celui d Aging Room et de Boutique Blends, qui dirige aussi le produit chez Altadis USA), PLASENCIA fabrique a Esteli, TABACALERA possede et distribue. Les deux premiers ont deja leur fiche ici. Trois vitoles font tout le catalogue — Jack, Casino, Gala — et le theme des annees 1920 vient du gout de Nodal pour le jazz et pour Duke Ellington. L ANNEE DE LANCEMENT reste non etablie, et le champ le dit'),
  (NULL,'migration 197','systeme','une_date_posee_et_une_variance_ecrite','marque',0,
   'A.J. FERNANDEZ portait « Annees 2000 — Esteli » : c est 2003, la fondation de la Tabacalera Fernandez avec six rouleurs (en.wikipedia.org, cigaraficionado.com). Le texte de la fiche ne porte aucune annee, donc rien ne se contredit. WARPED : l atlas dit 2007 ; cigaraficionado.com, dans son entretien avec Kyle Gellis, ecrit qu il a lance Warped EN 2009, encore etudiant. On garde 2007 et le champ source porte l ecart — meme traitement que Fonseca a la 196');

-- ════════════════════════════════════════════════════════
-- 5. LE TABLEAU DU PAYS : deux descriptions devenues fausses
-- ════════════════════════════════════════════════════════
-- « l'atelier ouvert aux visiteurs » chez MOMBACHO — il ne l'est plus.
-- « encore peu documentee ici » chez CAPITOL — elle l'est desormais.
-- nicaragua : 44 entrées, deux descriptions réécrites
UPDATE `producer_countries`
   SET `brands` = '[{"desc":"Référence absolue du Nicaragua premium","name":"Padrón","iconic":true},{"desc":"Pepin Garcia, maître torcedor légendaire","name":"My Father","iconic":true},{"desc":"Serie V mondialement reconnue","name":"Oliva","iconic":true},{"desc":"Liga Privada, révolution moderne","name":"Drew Estate","iconic":true},{"desc":"Plus grand producteur familial","name":"Plasencia","iconic":false},{"desc":"Élégance et puissance fusionnées","name":"Rocky Patel","iconic":false},{"desc":"Maître du Connecticut nicaraguayen","name":"Perdomo","iconic":false},{"desc":"Plus ancienne manufacture du pays","name":"Joya de Nicaragua","iconic":false},{"desc":"Le mélange privé de Jonathan Drew, devenu culte","name":"Liga Privada","iconic":false},{"desc":"Maison suisse de 1888, roulée à Estelí","name":"Villiger","iconic":false},{"desc":"Le rouleur que les autres marques employaient sans le nommer","name":"A.J. Fernandez","iconic":true},{"desc":"D''abord un planteur de Jalapa, ensuite une marque","name":"Aganorsa Leaf","iconic":true},{"desc":"La grammaire cubaine, la matière nicaraguayenne","name":"Tatuaje","iconic":false},{"desc":"Celle qui a rendu le petit format respectable","name":"Illusione","iconic":false},{"desc":"Un cigare ancré dans une culture, pas seulement un terroir","name":"Foundation Cigar Company","iconic":false},{"desc":"Granada plutôt qu''Estelí — et fermée depuis juin 2023","name":"Mombacho","iconic":false},{"desc":"Une marque qui s''est offert sa propre manufacture","name":"Espinosa","iconic":true},{"desc":"Pas d''usine : elle choisit son rouleur selon l''assemblage","name":"Crowned Heads","iconic":true},{"desc":"Des noms cubains d''avant 1960, des assemblages d''aujourd''hui","name":"Warped","iconic":false},{"desc":"Nodal compose, Plasencia fabrique, Tabacalera possède","name":"Capitol","iconic":false},{"desc":"Repris par la famille García en décembre 2019, après quarante-cinq ans chez Quesada","name":"Fonseca Nicaraguayen","iconic":false},{"name":"Nicoya","desc":"Maison australienne roulée à Estelí — l''Australie ne cultive plus depuis 2006","iconic":false},{"name":"Dunbarton Tobacco & Trust","desc":"Steve Saka, ex-Drew Estate, parti monter sa maison sans usine","iconic":true},{"name":"RoMa Craft Tobac","desc":"Commencée dans un garage, puis son propre atelier à Estelí","iconic":true},{"name":"Viaje","desc":"Plus de gamme régulière depuis 2012 : rien que des séries limitées","iconic":false},{"name":"Room101","desc":"D''un bijoutier au cigare ; trois manufactures, deux pays","iconic":false},{"name":"L''Atelier","desc":"La seconde maison de Pete Johnson, chez My Father comme Tatuaje","iconic":false},{"name":"La Aroma de Cuba","desc":"Nom cubain des années 1880, refait par Pepin García en 2009","iconic":false},{"name":"Southern Draw","desc":"Robert et Sharon Holt — un seul atelier, ce qui est rare","iconic":false},{"name":"HVC Cigars","desc":"Havana City ; dix ans sans usine, puis la sienne en 2021","iconic":true},{"name":"Fratello","desc":"Un ingénieur de la NASA passé au cigare","iconic":false},{"name":"Curivari","desc":"Grecque de tête, cubaine d''intention, nicaraguayenne de matière","iconic":false},{"name":"Black Label Trading Co.","desc":"Une fabrique conçue comme un atelier d''artiste","iconic":false},{"name":"Asylum","desc":"L''autre moitié de CLE — et une fabrique qui fut un cinéma","iconic":false},{"name":"Micallef","desc":"Une panne de voiture, un Texan, et trois générations cubaines","iconic":false},{"name":"Gurkha","desc":"Sans usine jusqu''en 2017, puis propriétaire de la sienne à Estelí","iconic":false},{"name":"Protocol","desc":"Deux policiers, aucune usine — La Zona puis San Lotano","iconic":false},{"name":"Regius","desc":"Maison londonienne de 2010, roulée chez Plasencia","iconic":false},{"name":"Cornelius & Anthony","desc":"Cent cinquante ans de tabac en Virginie, roulés à Estelí","iconic":false},{"name":"262 Cigars","desc":"Le nom est une date : février 1962, la signature de l''embargo","iconic":false},{"name":"Emilio Cigars","desc":"Trois fabriques, trois familles, un seul nom sur la bague","iconic":false},{"name":"Nomad","desc":"Le nom était un programme : elle a changé d''atelier et de pays","iconic":false},{"name":"7-20-4","desc":"Une adresse de Manchester fermée en 1962, reprise en 2006","iconic":false},{"name":"Cuban Crafters","desc":"Une boutique à Miami, mais la fabrique est à Estelí","iconic":false}]',
       `updated_at` = NOW()
 WHERE `id` = 'nicaragua';
