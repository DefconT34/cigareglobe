-- ════════════════════════════════════════════════════════
-- 181 — Les deux marques de J.C. Newman
-- ────────────────────────────────────────────────────────
-- L'ATLAS PORTAIT J.C. NEWMAN SANS SES DEUX MARQUES PREMIUM.
-- Diamond Crown et Cuesta-Rey n'existaient que sous la forme d'une
-- ligne de trois phrases dans le champ `gamme` de la maison mère —
-- l'une des deux seulement, l'autre nulle part.
--
-- C'est la CONFUSION LIGNE / MARQUE, prise dans l'autre sens que
-- d'habitude. Le recensement `docs/maisons-absentes.md` a identifié
-- vingt-sept lignes que les index prennent pour des maisons ; ici c'est
-- l'inverse : deux marques de plein droit réduites à des lignes.
--
-- Le précédent est dans l'atlas, et il est exact : ASHTON. William
-- Ashton Taylor est de Philadelphie, sa marque est américaine, et sa
-- fiche est classée en République dominicaine parce que ses cigares
-- sortent de la Tabacalera A. Fuente. Diamond Crown et Cuesta-Rey sont
-- le même montage — marque américaine, tabac et main dominicains — et
-- reçoivent donc le même classement.
--
--   Cuesta-Rey     1884, Ybor City ; rachetée par Stanford Newman en
--                  1958 ; roulée chez Fuente depuis les années 1980
--   Diamond Crown  1995, commande de Stanford Newman à Carlos Fuente
--                  Sr. pour le centenaire de la maison
--
-- ── ET LA FICHE DE LA MAISON MÈRE EST CORRIGÉE ──────────
-- `J.C. Newman` reste américaine — El Reloj tourne toujours à Tampa —
-- mais son dernier paragraphe disait « plusieurs gammes fabriquées en
-- République dominicaine, dont Diamond Crown ». Il nomme désormais les
-- deux marques et renvoie à leurs fiches, dans les six langues. Et son
-- champ `gamme` perd l'entrée Diamond Crown, qui faisait doublon avec
-- une fiche entière : c'est le patron de la migration 180, où les sept
-- maisons mères nomment leurs marques EN PROSE et gardent un `gamme`
-- vide.
--
-- ⚠ LES SIX REPLACE SONT VÉRIFIÉS À LA FIN DE CE FICHIER. Un REPLACE
-- qui ne trouve pas son motif ne dit rien et sort en succès — c'est
-- ainsi qu'un REPLACE allemand avait silencieusement échoué au chantier
-- des jumelles. Le SELECT de contrôle en fin de migration doit rendre
-- SIX lignes à 1 ; toute autre valeur signale un motif manqué.
--
-- ── LE TABLEAU JSON EST POSÉ EN TOUTES LETTRES ──────────
-- Règle des migrations 179 et 180 : aucun `JSON_*`. `producer_countries.
-- brands` pour `dominican` passe de vingt-quatre à vingt-six entrées,
-- écrites entières. JSON_TABLE puis JSON_ARRAYAGG gardent le type sur
-- MySQL et le perdent sur MariaDB, où l'agrégat empile des chaînes —
-- ce qui avait vidé la page de ce pays-là précisément.
--
-- ── CE QUE LA FICHE NE DIT PAS COMME UN FAIT ────────────
-- jcnewman.com attribue à Cuesta-Rey le titre de cigare officiel du roi
-- Alphonse XIII d'Espagne. Aucune source indépendante ne le confirme :
-- la fiche l'attribue explicitement à la maison plutôt que de l'énoncer.
--
-- Sources : jcnewman.com (fiches Diamond Crown, Cuesta-Rey, Maximus,
-- Julius Caeser — gammes, capes et vitoles), cigarjournal.com
-- (« J. C. Newman Cigar Co. — America's Oldest Cigar Family » : le
-- diamètre uniforme de 54 et le rachat de 1958), en.wikipedia.org
-- (Cuesta-Rey : fondation 1884, clear Havana, production dominicaine
-- depuis les années 1980 ; Diamond Crown Maximus).
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

-- ── Cuesta-Rey ───────────────────────────────────────────
('Cuesta-Rey', 'dominican', '1884 — Ybor City, Tampa, Floride',
 'Tabacalera A. Fuente, Santiago de los Caballeros, République dominicaine',

 'Cuesta-Rey est plus ancienne que la maison qui la possède. Angel LaMadrid Cuesta, un Espagnol qui avait appris le métier à Cuba, et Peregrino Rey la fondent en 1884 à Ybor City — le quartier de Tampa où l''industrie du cigare s''était installée en quittant La Havane. Ils y roulent des clear Havana : des cigares faits aux États-Unis avec du tabac cubain importé.

L''atelier travaille aussi pour d''autres marques, dont Nat Sherman, que cet atlas porte. La maison revendique par ailleurs le titre de cigare officiel du roi Alphonse XIII d''Espagne — c''est elle qui le dit, et aucune source indépendante ne l''établit.

En 1958, l''année de la mort de Julius Caeser Newman, son fils Stanford rachète la marque à la famille de Karl Cuesta. J.C. Newman fabrique des Cuesta-Rey depuis. Et depuis les années 1980, les cigares roulés à la main ne sortent plus de Tampa : ils viennent de la Tabacalera A. Fuente, à Santiago de los Caballeros — la manufacture qui fait aussi l''Arturo Fuente et l''Ashton. C''est la raison pour laquelle cette fiche est classée en République dominicaine quand celle de J.C. Newman reste américaine.

Trois gammes tiennent le catalogue. La Cabinet Selection porte une cape camerounaise sur une tripe dominicaine et brésilienne ; la Centenario, une Connecticut Shade en clair ou une Connecticut Broadleaf en maduro ; la Centro Fino, une cape équatorienne cultivée au soleil. Les vitoles gardent des numéros de catalogue plutôt que des noms — le Cabinet No. 898, le No. 95.',

 '[{"name":"Cabinet Selection","color":"#8B5A2B","force":"Medium","wrapper":"Cameroun","vitolas":["Cabinet No. 898","Cabinet No. 95"],"story":"La gamme la plus habillée : cape camerounaise, sous-cape dominicaine, tripe dominicaine et brésilienne. Deux formats seulement, tous deux longs et fins — un parti pris rare aujourd''hui."},{"name":"Centenario","color":"#C9A96E","force":"Light-Medium","wrapper":"Connecticut Shade ou Connecticut Broadleaf","vitolas":["Aristocrat","Pyramid No. 9","Dominican No. 60","Dominican No. 5","Robusto No. 7"],"story":"La gamme la plus large, en clair sous cape Connecticut Shade et en maduro sous Connecticut Broadleaf. Registre doux, assemblage entièrement dominicain sous la cape."},{"name":"Centro Fino Sungrown","color":"#A0522D","force":"Medium","wrapper":"Centro Fino d''Équateur, cultivé au soleil","vitolas":["Pyramid No. 9","Centro Fino No. 60","Robusto No. 7"],"story":"Le versant corsé du catalogue. La cape équatorienne cultivée en plein soleil donne un cigare plus dense que le reste de la marque, sans la quitter."}]',

 'Cuesta-Rey is older than the house that owns it. Angel LaMadrid Cuesta, a Spaniard who had learned the trade in Cuba, and Peregrino Rey founded it in 1884 in Ybor City — the Tampa district where the cigar industry settled after leaving Havana. There they rolled clear Havanas: cigars made in the United States from imported Cuban tobacco.

The workshop also worked for other brands, among them Nat Sherman, which this atlas holds. The house further claims the title of official cigar of King Alfonso XIII of Spain — that is the house speaking, and no independent source establishes it.

In 1958, the year Julius Caeser Newman died, his son Stanford bought the brand from Karl Cuesta''s family. J.C. Newman has made Cuesta-Rey ever since. And since the 1980s the handmade cigars no longer come out of Tampa: they come from Tabacalera A. Fuente, in Santiago de los Caballeros — the factory that also makes Arturo Fuente and Ashton. That is why this entry is filed under the Dominican Republic while J.C. Newman''s remains American.

Three ranges hold the catalogue. Cabinet Selection carries a Cameroon wrapper over Dominican and Brazilian filler; Centenario, a Connecticut Shade in natural or a Connecticut Broadleaf in maduro; Centro Fino, an Ecuadorian sun-grown wrapper. The vitolas keep catalogue numbers rather than names — the Cabinet No. 898, the No. 95.',

 'Cuesta-Rey es más antigua que la casa que la posee. Angel LaMadrid Cuesta, un español que había aprendido el oficio en Cuba, y Peregrino Rey la fundan en 1884 en Ybor City, el barrio de Tampa donde la industria del puro se instaló al salir de La Habana. Allí lían clear Havanas: puros hechos en Estados Unidos con tabaco cubano importado.

El taller trabaja también para otras marcas, entre ellas Nat Sherman, que este atlas recoge. La casa reivindica además el título de puro oficial del rey Alfonso XIII de España — lo dice ella, y ninguna fuente independiente lo establece.

En 1958, el año de la muerte de Julius Caeser Newman, su hijo Stanford compra la marca a la familia de Karl Cuesta. J.C. Newman fabrica Cuesta-Rey desde entonces. Y desde los años ochenta los puros liados a mano ya no salen de Tampa: vienen de la Tabacalera A. Fuente, en Santiago de los Caballeros, la manufactura que hace también el Arturo Fuente y el Ashton. Por eso esta ficha se clasifica en la República Dominicana mientras la de J.C. Newman sigue siendo estadounidense.

Tres gamas sostienen el catálogo. La Cabinet Selection lleva capa camerunesa sobre tripa dominicana y brasileña; la Centenario, una Connecticut Shade en claro o una Connecticut Broadleaf en maduro; la Centro Fino, una capa ecuatoriana cultivada al sol. Las vitolas conservan números de catálogo en vez de nombres: el Cabinet No. 898, el No. 95.',

 'Cuesta-Rey ist älter als das Haus, dem sie gehört. Angel LaMadrid Cuesta, ein Spanier, der das Handwerk auf Kuba gelernt hatte, und Peregrino Rey gründeten sie 1884 in Ybor City — jenem Stadtteil von Tampa, in dem sich die Zigarrenindustrie nach dem Weggang aus Havanna niederließ. Dort rollten sie Clear Havanas: Zigarren, in den Vereinigten Staaten aus importiertem kubanischem Tabak gefertigt.

Die Werkstatt arbeitete auch für andere Marken, darunter Nat Sherman, die dieser Atlas führt. Das Haus beansprucht überdies den Titel der offiziellen Zigarre König Alfons XIII. von Spanien — so sagt es das Haus, und keine unabhängige Quelle belegt es.

1958, im Todesjahr von Julius Caeser Newman, kaufte sein Sohn Stanford die Marke der Familie von Karl Cuesta ab. Seither fertigt J.C. Newman Cuesta-Rey. Und seit den 1980er Jahren kommen die handgerollten Zigarren nicht mehr aus Tampa, sondern aus der Tabacalera A. Fuente in Santiago de los Caballeros — derselben Manufaktur, die auch Arturo Fuente und Ashton herstellt. Deshalb steht dieser Eintrag unter der Dominikanischen Republik, während der von J.C. Newman amerikanisch bleibt.

Drei Linien tragen den Katalog. Die Cabinet Selection trägt ein Kameruner Deckblatt über dominikanischer und brasilianischer Einlage; die Centenario ein Connecticut Shade im Hellen oder ein Connecticut Broadleaf im Maduro; die Centro Fino ein sonnengewachsenes Deckblatt aus Ecuador. Die Vitolas behalten Katalognummern statt Namen — die Cabinet No. 898, die No. 95.',

 'Cuesta-Rey 比拥有它的那家公司更古老。西班牙人 Angel LaMadrid Cuesta 曾在古巴习艺，1884 年他与 Peregrino Rey 在坦帕的伊博城创办了这个品牌——雪茄业离开哈瓦那后正是在那个街区落脚。他们在那里卷制 clear Havana：用进口古巴烟叶在美国制成的雪茄。

这家作坊也为别的品牌代工，其中包括本图集收录的 Nat Sherman。此外，该公司自称获得过西班牙国王阿方索十三世御用雪茄的名号——这是它自己的说法，并无独立来源可以证实。

1958 年，也就是 Julius Caeser Newman 去世的那一年，其子 Stanford 从 Karl Cuesta 的家族手中买下这个品牌。此后 Cuesta-Rey 一直由 J.C. Newman 出品。而自 1980 年代起，手工卷制的雪茄已不再出自坦帕，而是来自圣地亚哥-德洛斯卡瓦耶罗斯的 Tabacalera A. Fuente——同一家工厂也生产 Arturo Fuente 与 Ashton。这正是本条目归入多米尼加共和国、而 J.C. Newman 一条仍属美国的原因。

三个系列撑起整份目录。Cabinet Selection 以喀麦隆茄衣包裹多米尼加与巴西茄芯；Centenario 分为康涅狄格阴植的浅色版与康涅狄格宽叶的马杜罗版；Centro Fino 则用厄瓜多尔日照茄衣。各款尺寸沿用目录编号而非名字——Cabinet No. 898、No. 95。',

 'كويستا-ري أقدم من الدار التي تملكها. أسّسها عام 1884 في حيّ إيبور سيتي بتامبا كلٌّ من أنخيل لامادريد كويستا، وهو إسباني تعلّم الحرفة في كوبا، وبيريغرينو ري — وهو الحيّ الذي استقرّت فيه صناعة السيجار بعد مغادرتها هافانا. وكانا يلفّان فيه سيجار «كلير هافانا»: سيجار يُصنع في الولايات المتحدة من تبغ كوبي مستورد.

وكانت الورشة تعمل كذلك لعلامات أخرى، منها نات شيرمان التي يضمّها هذا الأطلس. كما تدّعي الدار لنفسها لقب السيجار الرسمي لملك إسبانيا ألفونسو الثالث عشر — وهو قول الدار نفسها، ولا تثبته أيّ مصادر مستقلّة.

وفي عام 1958، وهو عام وفاة يوليوس سيزر نيومان، اشترى ابنه ستانفورد العلامة من عائلة كارل كويستا. ومنذ ذلك الحين تصنع J.C. Newman سيجار كويستا-ري. ومنذ ثمانينيات القرن الماضي لم يعد السيجار الملفوف يدويًا يخرج من تامبا، بل من تاباكاليرا أ. فوينتي في سانتياغو دي لوس كاباييروس — المصنع نفسه الذي يصنع أرتورو فوينتي وأشتون. ولهذا صُنّفت هذه البطاقة في الجمهورية الدومينيكية بينما بقيت بطاقة J.C. Newman أمريكية.

ويقوم الكتالوج على ثلاث سلاسل. تحمل «كابينت سيليكشن» غلافًا كاميرونيًا فوق حشوة دومينيكية وبرازيلية؛ و«سينتيناريو» غلاف كونيتيكت شيد في النسخة الفاتحة أو كونيتيكت برودليف في نسخة المادورو؛ و«سنترو فينو» غلافًا إكوادوريًا مزروعًا في الشمس. وتحتفظ المقاسات بأرقام الكتالوج بدل الأسماء — كابينت رقم 898، ورقم 95.',

 '[{"name":"Cabinet Selection","color":"#8B5A2B","force":"Medium","wrapper":"Cameroon","vitolas":["Cabinet No. 898","Cabinet No. 95"],"story":"The dressiest of the three: Cameroon wrapper, Dominican binder, Dominican and Brazilian filler. Two sizes only, both long and slim — a rare choice today."},{"name":"Centenario","color":"#C9A96E","force":"Light-Medium","wrapper":"Connecticut Shade or Connecticut Broadleaf","vitolas":["Aristocrat","Pyramid No. 9","Dominican No. 60","Dominican No. 5","Robusto No. 7"],"story":"The widest range, natural under Connecticut Shade and maduro under Connecticut Broadleaf. A mild register, wholly Dominican beneath the wrapper."},{"name":"Centro Fino Sungrown","color":"#A0522D","force":"Medium","wrapper":"Ecuadorian Centro Fino, sun-grown","vitolas":["Pyramid No. 9","Centro Fino No. 60","Robusto No. 7"],"story":"The fuller side of the catalogue. The sun-grown Ecuadorian wrapper gives a denser cigar than the rest of the brand, without leaving it."}]',

 '[{"name":"Cabinet Selection","color":"#8B5A2B","force":"Medium","wrapper":"Camerún","vitolas":["Cabinet No. 898","Cabinet No. 95"],"story":"La gama más vestida: capa camerunesa, capote dominicano, tripa dominicana y brasileña. Solo dos formatos, ambos largos y finos, una apuesta rara hoy."},{"name":"Centenario","color":"#C9A96E","force":"Light-Medium","wrapper":"Connecticut Shade o Connecticut Broadleaf","vitolas":["Aristocrat","Pyramid No. 9","Dominican No. 60","Dominican No. 5","Robusto No. 7"],"story":"La gama más amplia, en claro bajo capa Connecticut Shade y en maduro bajo Connecticut Broadleaf. Registro suave, todo dominicano bajo la capa."},{"name":"Centro Fino Sungrown","color":"#A0522D","force":"Medium","wrapper":"Centro Fino de Ecuador, cultivada al sol","vitolas":["Pyramid No. 9","Centro Fino No. 60","Robusto No. 7"],"story":"La vertiente con más cuerpo del catálogo. La capa ecuatoriana cultivada a pleno sol da un puro más denso que el resto de la marca, sin salirse de ella."}]',

 '[{"name":"Cabinet Selection","color":"#8B5A2B","force":"Medium","wrapper":"Kamerun","vitolas":["Cabinet No. 898","Cabinet No. 95"],"story":"Die feinste der drei: Kameruner Deckblatt, dominikanisches Umblatt, dominikanische und brasilianische Einlage. Nur zwei Formate, beide lang und schlank — heute eine seltene Wahl."},{"name":"Centenario","color":"#C9A96E","force":"Light-Medium","wrapper":"Connecticut Shade oder Connecticut Broadleaf","vitolas":["Aristocrat","Pyramid No. 9","Dominican No. 60","Dominican No. 5","Robusto No. 7"],"story":"Die breiteste Linie, hell unter Connecticut Shade und maduro unter Connecticut Broadleaf. Mildes Register, unter dem Deckblatt durchweg dominikanisch."},{"name":"Centro Fino Sungrown","color":"#A0522D","force":"Medium","wrapper":"Centro Fino aus Ecuador, sonnengewachsen","vitolas":["Pyramid No. 9","Centro Fino No. 60","Robusto No. 7"],"story":"Die kräftigere Seite des Katalogs. Das sonnengewachsene ecuadorianische Deckblatt ergibt eine dichtere Zigarre als der Rest der Marke, ohne sie zu verlassen."}]',

 '[{"name":"Cabinet Selection","color":"#8B5A2B","force":"Medium","wrapper":"喀麦隆","vitolas":["Cabinet No. 898","Cabinet No. 95"],"story":"三者之中最考究的一款：喀麦隆茄衣、多米尼加茄套、多米尼加与巴西茄芯。仅两个尺寸，皆细长——这在今天是少见的取舍。"},{"name":"Centenario","color":"#C9A96E","force":"Light-Medium","wrapper":"康涅狄格阴植或康涅狄格宽叶","vitolas":["Aristocrat","Pyramid No. 9","Dominican No. 60","Dominican No. 5","Robusto No. 7"],"story":"尺寸最齐的一条线，浅色版用康涅狄格阴植茄衣，马杜罗版用康涅狄格宽叶。口感柔和，茄衣之下全为多米尼加烟叶。"},{"name":"Centro Fino Sungrown","color":"#A0522D","force":"Medium","wrapper":"厄瓜多尔 Centro Fino，日照种植","vitolas":["Pyramid No. 9","Centro Fino No. 60","Robusto No. 7"],"story":"目录中较为浓厚的一侧。全日照的厄瓜多尔茄衣使它比品牌其余各款更为紧实，却仍在同一风格之内。"}]',

 '[{"name":"Cabinet Selection","color":"#8B5A2B","force":"Medium","wrapper":"الكاميرون","vitolas":["Cabinet No. 898","Cabinet No. 95"],"story":"أرقى السلاسل الثلاث: غلاف كاميروني، ورابط دومينيكي، وحشوة دومينيكية وبرازيلية. مقاسان اثنان فقط، طويلان نحيلان — وهو خيار نادر اليوم."},{"name":"Centenario","color":"#C9A96E","force":"Light-Medium","wrapper":"كونيتيكت شيد أو كونيتيكت برودليف","vitolas":["Aristocrat","Pyramid No. 9","Dominican No. 60","Dominican No. 5","Robusto No. 7"],"story":"أوسع السلاسل مقاسًا، فاتحة بغلاف كونيتيكت شيد ومادورو بغلاف كونيتيكت برودليف. مزاج لطيف، وما تحت الغلاف دومينيكي بالكامل."},{"name":"Centro Fino Sungrown","color":"#A0522D","force":"Medium","wrapper":"سنترو فينو إكوادوري مزروع في الشمس","vitolas":["Pyramid No. 9","Centro Fino No. 60","Robusto No. 7"],"story":"الوجه الأقوى في الكتالوج. الغلاف الإكوادوري المزروع في الشمس الكاملة يمنحه كثافة تفوق بقية العلامة، من دون أن يخرج عنها."}]'),

-- ── Diamond Crown ────────────────────────────────────────
('Diamond Crown', 'dominican', '1995 — Tampa, États-Unis',
 'Tabacalera A. Fuente, Santiago de los Caballeros, République dominicaine',

 'Diamond Crown est née d''une commande d''une famille à une autre. En 1995, pour les cent ans de la maison que son père avait fondée à Cleveland, Stanford Newman demande à Carlos Fuente Sr. de composer un cigare d''exception.

Les deux hommes arrêtent un module que personne ne faisait alors : une gamme entière au diamètre de 54, quand le plus gros cigare du marché s''arrêtait à 52. La cape Connecticut Shade est vieillie cinq ans avant roulage. Les formats ajoutés depuis ont rompu cette uniformité — le No. 6 monte à 64, le No. 9 redescend à 50 — mais le cœur de la gamme est resté au 54 d''origine.

Le cigare sort de la Tabacalera A. Fuente, à Santiago de los Caballeros : les mêmes ateliers que l''Arturo Fuente et l''Ashton, que cet atlas porte l''un et l''autre. C''est le montage d''Ashton refait dix ans plus tard — une marque américaine, un tabac et une main dominicains — et c''est pour cela que la fiche est classée ici, et non aux États-Unis avec sa maison mère.

La famille a étendu la gamme depuis. Maximus paraît au début des années 2000 sous une cape équatorienne El Bajo cultivée au soleil, vieillie cinq ans elle aussi, dans un registre nettement plus corsé. Julius Caeser suit en 2010, pour les cent trente-cinq ans de la naissance de Julius Caeser Newman et les cent quinze ans de son entreprise, sous une cape équatorienne de semence havanaise. Diamond Crown Tampa, plus récente, prend une sous-cape Florida Sun Grown — du tabac cultivé en Floride, ce qui, pour une maison de Tampa, n''est pas un détail de composition.',

 '[{"name":"Diamond Crown Classic","color":"#C9A96E","force":"Light-Medium","wrapper":"Connecticut Shade, vieillie cinq ans","vitolas":["No. 2","No. 3","No. 4","No. 5","No. 7","No. 9"],"story":"La gamme d''origine, celle du centenaire de 1995 et du diamètre uniforme de 54. Cape Connecticut Shade vieillie cinq ans avant roulage, sous-cape dominicaine, tripe puisée dans cinq tabacs des Caraïbes et d''Amérique centrale."},{"name":"Diamond Crown Maduro","color":"#4A2C1A","force":"Medium","wrapper":"Connecticut Broadleaf","vitolas":["No. 3","No. 4","No. 5","No. 6"],"story":"Le même cigare sous une cape Connecticut Broadleaf, qui l''épaissit d''un cran sans le pousser au corsé. Quatre formats, tous repris de la numérotation de la Classic."},{"name":"Diamond Crown Maximus","color":"#8B0000","force":"Full","wrapper":"El Bajo d''Équateur, cultivé au soleil","vitolas":["Robusto","Toro","Double Corona","Torpedo"],"story":"Le versant corsé, paru au début des années 2000. Cape équatorienne El Bajo cultivée au soleil et vieillie cinq ans, sur sous-cape et tripe dominicaines."},{"name":"Diamond Crown Julius Caeser","color":"#722F37","force":"Medium-Full","wrapper":"Équateur, semence havanaise","vitolas":["Robusto","Toro","Pyramid","Hail Caeser"],"story":"Parue en 2010 pour les cent trente-cinq ans de la naissance du fondateur et les cent quinze ans de sa maison. Cape équatorienne de semence havanaise, tripe dominicaine et centraméricaine ; roulée par petites séries."}]',

 'Diamond Crown was born of one family''s commission to another. In 1995, for the hundredth year of the house his father had founded in Cleveland, Stanford Newman asked Carlos Fuente Sr. to compose an exceptional cigar.

The two men settled on a format nobody was then making: an entire range at a ring gauge of 54, when the thickest cigar on the market stopped at 52. The Connecticut Shade wrapper is aged five years before rolling. Sizes added since have broken that uniformity — the No. 6 rises to 64, the No. 9 drops back to 50 — but the core of the range has stayed at the original 54.

The cigar comes out of Tabacalera A. Fuente, in Santiago de los Caballeros: the same workshops as Arturo Fuente and Ashton, both of which this atlas holds. It is the Ashton arrangement made again ten years later — an American brand, Dominican tobacco and Dominican hands — and that is why the entry is filed here rather than in the United States with its parent house.

The family has widened the range since. Maximus appeared in the early 2000s under a sun-grown Ecuadorian El Bajo wrapper, likewise aged five years, in a distinctly fuller register. Julius Caeser followed in 2010, marking a hundred and thirty-five years since the birth of Julius Caeser Newman and a hundred and fifteen since his company, under an Ecuadorian Havana-seed wrapper. Diamond Crown Tampa, more recent, takes a Florida Sun Grown binder — tobacco grown in Florida, which for a Tampa house is not a mere blending detail.',

 'Diamond Crown nació de un encargo de una familia a otra. En 1995, por los cien años de la casa que su padre había fundado en Cleveland, Stanford Newman pide a Carlos Fuente Sr. que componga un puro de excepción.

Los dos hombres fijan un formato que entonces nadie hacía: una gama entera con cepo 54, cuando el puro más grueso del mercado se detenía en 52. La capa Connecticut Shade se añeja cinco años antes del liado. Los formatos añadidos después han roto esa uniformidad — el No. 6 sube a 64, el No. 9 baja a 50 — pero el núcleo de la gama se ha quedado en el 54 original.

El puro sale de la Tabacalera A. Fuente, en Santiago de los Caballeros: los mismos talleres que el Arturo Fuente y el Ashton, que este atlas recoge por igual. Es el montaje de Ashton rehecho diez años más tarde — marca estadounidense, tabaco y manos dominicanos — y por eso la ficha se clasifica aquí y no en Estados Unidos junto a su casa madre.

La familia ha ampliado la gama desde entonces. Maximus aparece a principios de los años dos mil bajo una capa ecuatoriana El Bajo cultivada al sol, añejada también cinco años, en un registro netamente más fuerte. Julius Caeser le sigue en 2010, por los ciento treinta y cinco años del nacimiento de Julius Caeser Newman y los ciento quince de su empresa, bajo capa ecuatoriana de semilla habana. Diamond Crown Tampa, más reciente, toma un capote Florida Sun Grown: tabaco cultivado en Florida, lo que para una casa de Tampa no es un simple detalle de ligada.',

 'Diamond Crown entstand als Auftrag einer Familie an eine andere. 1995, zum hundertsten Jahr des Hauses, das sein Vater in Cleveland gegründet hatte, bat Stanford Newman Carlos Fuente Sr. darum, eine außergewöhnliche Zigarre zu komponieren.

Die beiden Männer legten ein Format fest, das damals niemand machte: eine ganze Linie im Ringmaß 54, während die dickste Zigarre am Markt bei 52 endete. Das Connecticut-Shade-Deckblatt reift fünf Jahre vor dem Rollen. Später hinzugekommene Formate haben diese Einheitlichkeit gebrochen — die No. 6 steigt auf 64, die No. 9 fällt auf 50 zurück — doch der Kern der Linie ist beim ursprünglichen 54 geblieben.

Die Zigarre kommt aus der Tabacalera A. Fuente in Santiago de los Caballeros: denselben Werkstätten wie Arturo Fuente und Ashton, die dieser Atlas beide führt. Es ist die Konstruktion von Ashton, zehn Jahre später wiederholt — amerikanische Marke, dominikanischer Tabak, dominikanische Hände — und deshalb steht der Eintrag hier und nicht in den Vereinigten Staaten bei seinem Mutterhaus.

Die Familie hat die Linie seither erweitert. Maximus erschien Anfang der 2000er Jahre unter einem sonnengewachsenen ecuadorianischen El-Bajo-Deckblatt, ebenfalls fünf Jahre gereift, in deutlich kräftigerem Register. Julius Caeser folgte 2010, zum hundertfünfunddreißigsten Geburtstag von Julius Caeser Newman und zum hundertfünfzehnten Jahr seines Unternehmens, unter einem ecuadorianischen Deckblatt aus Havanna-Saat. Diamond Crown Tampa, jüngeren Datums, nimmt ein Umblatt aus Florida Sun Grown — in Florida gewachsener Tabak, was für ein Haus aus Tampa kein bloßes Mischungsdetail ist.',

 'Diamond Crown 源于一个家族向另一个家族下的订单。1995 年，为纪念其父在克利夫兰创办的公司满一百年，Stanford Newman 请 Carlos Fuente Sr. 调配一支非凡的雪茄。

两人定下了当时无人制作的规格：整条系列统一采用 54 环径，而彼时市面上最粗的雪茄止于 52。康涅狄格阴植茄衣在卷制前需陈化五年。后来增补的尺寸打破了这份统一——No. 6 升至 64，No. 9 又回落到 50——但系列的主干仍保持在最初的 54。

这支雪茄出自圣地亚哥-德洛斯卡瓦耶罗斯的 Tabacalera A. Fuente：与 Arturo Fuente、Ashton 同一批工坊，二者本图集皆有收录。这正是十年之后重演的 Ashton 模式——美国品牌，多米尼加烟叶与多米尼加双手——也正因如此，本条目归在此处，而非与母公司一同列入美国。

此后家族不断扩充这一系列。Maximus 于二〇〇〇年代初面世，采用日照种植的厄瓜多尔 El Bajo 茄衣，同样陈化五年，风格明显更为浓烈。Julius Caeser 继之于 2010 年，纪念 Julius Caeser Newman 诞辰一百三十五周年、其企业创立一百一十五周年，用的是哈瓦那种源的厄瓜多尔茄衣。更晚近的 Diamond Crown Tampa 则采用 Florida Sun Grown 茄套——佛罗里达本地种植的烟叶，这对一家坦帕的公司而言，并非仅仅是配方上的细节。',

 'وُلدت «دايموند كراون» من طلبٍ وجّهته عائلة إلى أخرى. ففي عام 1995، بمناسبة مرور مئة عام على الدار التي أسّسها والده في كليفلاند، طلب ستانفورد نيومان من كارلوس فوينتي الأب أن يؤلّف سيجارًا استثنائيًا.

واستقرّ الرجلان على قياسٍ لم يكن أحد يصنعه آنذاك: سلسلة كاملة بقُطر 54، في وقتٍ كان أغلظ سيجار في السوق يقف عند 52. ويُعتَّق غلاف كونيتيكت شيد خمس سنوات قبل اللفّ. وقد كسرت المقاسات المضافة لاحقًا هذا التوحيد — إذ يرتفع رقم 6 إلى 64، ويعود رقم 9 إلى 50 — غير أنّ قلب السلسلة بقي عند الـ54 الأصلي.

ويخرج السيجار من تاباكاليرا أ. فوينتي في سانتياغو دي لوس كاباييروس: الورش نفسها التي تصنع أرتورو فوينتي وأشتون، وكلاهما في هذا الأطلس. إنّه تركيب أشتون معادًا بعد عشر سنوات — علامة أمريكية، وتبغ وأيدٍ دومينيكية — ولهذا صُنّفت البطاقة هنا لا في الولايات المتحدة مع دارها الأم.

ووسّعت العائلة السلسلة منذ ذلك الحين. فظهرت «ماكسيموس» في مطلع الألفية بغلاف إكوادوري من نوع «إل باخو» مزروع في الشمس ومعتَّق خمس سنوات أيضًا، في مزاج أشدّ قوّة بوضوح. ثم تلتها «يوليوس سيزر» عام 2010، إحياءً لمئة وخمسة وثلاثين عامًا على مولد يوليوس سيزر نيومان ومئة وخمسة عشر عامًا على شركته، بغلاف إكوادوري من بذرة هافانية. أمّا «دايموند كراون تامبا»، وهي الأحدث، فتأخذ رابطًا من نوع «فلوريدا سن غراون» — تبغ مزروع في فلوريدا، وهو لدارٍ من تامبا ليس مجرّد تفصيل في المزيج.',

 '[{"name":"Diamond Crown Classic","color":"#C9A96E","force":"Light-Medium","wrapper":"Connecticut Shade, five years aged","vitolas":["No. 2","No. 3","No. 4","No. 5","No. 7","No. 9"],"story":"The original range, the one of the 1995 centenary and of the uniform 54 ring gauge. Connecticut Shade wrapper aged five years before rolling, Dominican binder, filler drawn from five tobaccos of the Caribbean and Central America."},{"name":"Diamond Crown Maduro","color":"#4A2C1A","force":"Medium","wrapper":"Connecticut Broadleaf","vitolas":["No. 3","No. 4","No. 5","No. 6"],"story":"The same cigar under a Connecticut Broadleaf wrapper, which thickens it a notch without pushing it to full. Four sizes, all carried over from the Classic numbering."},{"name":"Diamond Crown Maximus","color":"#8B0000","force":"Full","wrapper":"Ecuadorian El Bajo, sun-grown","vitolas":["Robusto","Toro","Double Corona","Torpedo"],"story":"The fuller side, out in the early 2000s. Sun-grown Ecuadorian El Bajo wrapper, aged five years, over Dominican binder and filler."},{"name":"Diamond Crown Julius Caeser","color":"#722F37","force":"Medium-Full","wrapper":"Ecuador, Havana seed","vitolas":["Robusto","Toro","Pyramid","Hail Caeser"],"story":"Released in 2010, marking a hundred and thirty-five years since the founder''s birth and a hundred and fifteen since his house. Ecuadorian Havana-seed wrapper, Dominican and Central American filler; rolled in small batches."}]',

 '[{"name":"Diamond Crown Classic","color":"#C9A96E","force":"Light-Medium","wrapper":"Connecticut Shade, añejada cinco años","vitolas":["No. 2","No. 3","No. 4","No. 5","No. 7","No. 9"],"story":"La gama de origen, la del centenario de 1995 y del cepo uniforme de 54. Capa Connecticut Shade añejada cinco años antes del liado, capote dominicano, tripa tomada de cinco tabacos del Caribe y de Centroamérica."},{"name":"Diamond Crown Maduro","color":"#4A2C1A","force":"Medium","wrapper":"Connecticut Broadleaf","vitolas":["No. 3","No. 4","No. 5","No. 6"],"story":"El mismo puro bajo capa Connecticut Broadleaf, que lo espesa un punto sin llevarlo a fuerte. Cuatro formatos, todos heredados de la numeración de la Classic."},{"name":"Diamond Crown Maximus","color":"#8B0000","force":"Full","wrapper":"El Bajo de Ecuador, cultivada al sol","vitolas":["Robusto","Toro","Double Corona","Torpedo"],"story":"La vertiente fuerte, salida a principios de los años dos mil. Capa ecuatoriana El Bajo cultivada al sol y añejada cinco años, sobre capote y tripa dominicanos."},{"name":"Diamond Crown Julius Caeser","color":"#722F37","force":"Medium-Full","wrapper":"Ecuador, semilla habana","vitolas":["Robusto","Toro","Pyramid","Hail Caeser"],"story":"Salida en 2010, por los ciento treinta y cinco años del nacimiento del fundador y los ciento quince de su casa. Capa ecuatoriana de semilla habana, tripa dominicana y centroamericana; liada en series cortas."}]',

 '[{"name":"Diamond Crown Classic","color":"#C9A96E","force":"Light-Medium","wrapper":"Connecticut Shade, fünf Jahre gereift","vitolas":["No. 2","No. 3","No. 4","No. 5","No. 7","No. 9"],"story":"Die ursprüngliche Linie, die des Jubiläums von 1995 und des einheitlichen Ringmaßes 54. Fünf Jahre vor dem Rollen gereiftes Connecticut-Shade-Deckblatt, dominikanisches Umblatt, Einlage aus fünf Tabaken der Karibik und Mittelamerikas."},{"name":"Diamond Crown Maduro","color":"#4A2C1A","force":"Medium","wrapper":"Connecticut Broadleaf","vitolas":["No. 3","No. 4","No. 5","No. 6"],"story":"Dieselbe Zigarre unter einem Connecticut-Broadleaf-Deckblatt, das sie eine Stufe dichter macht, ohne sie ins Kräftige zu treiben. Vier Formate, alle aus der Nummerierung der Classic übernommen."},{"name":"Diamond Crown Maximus","color":"#8B0000","force":"Full","wrapper":"El Bajo aus Ecuador, sonnengewachsen","vitolas":["Robusto","Toro","Double Corona","Torpedo"],"story":"Die kräftige Seite, Anfang der 2000er Jahre erschienen. Sonnengewachsenes ecuadorianisches El-Bajo-Deckblatt, fünf Jahre gereift, über dominikanischem Um- und Einlageblatt."},{"name":"Diamond Crown Julius Caeser","color":"#722F37","force":"Medium-Full","wrapper":"Ecuador, Havanna-Saat","vitolas":["Robusto","Toro","Pyramid","Hail Caeser"],"story":"2010 erschienen, zum hundertfünfunddreißigsten Geburtstag des Gründers und zum hundertfünfzehnten Jahr seines Hauses. Ecuadorianisches Deckblatt aus Havanna-Saat, dominikanische und mittelamerikanische Einlage; in kleinen Serien gerollt."}]',

 '[{"name":"Diamond Crown Classic","color":"#C9A96E","force":"Light-Medium","wrapper":"康涅狄格阴植，陈化五年","vitolas":["No. 2","No. 3","No. 4","No. 5","No. 7","No. 9"],"story":"最初的系列，属于 1995 年百年纪念与统一 54 环径的那一条。茄衣为陈化五年后方才卷制的康涅狄格阴植叶，茄套为多米尼加，茄芯取自加勒比与中美洲五种烟叶。"},{"name":"Diamond Crown Maduro","color":"#4A2C1A","force":"Medium","wrapper":"康涅狄格宽叶","vitolas":["No. 3","No. 4","No. 5","No. 6"],"story":"同一支雪茄换上康涅狄格宽叶茄衣，浓度上升一档，却未推向浓烈。四个尺寸，编号全部沿用 Classic。"},{"name":"Diamond Crown Maximus","color":"#8B0000","force":"Full","wrapper":"厄瓜多尔 El Bajo，日照种植","vitolas":["Robusto","Toro","Double Corona","Torpedo"],"story":"浓烈的一侧，问世于二〇〇〇年代初。日照种植的厄瓜多尔 El Bajo 茄衣同样陈化五年，包裹多米尼加茄套与茄芯。"},{"name":"Diamond Crown Julius Caeser","color":"#722F37","force":"Medium-Full","wrapper":"厄瓜多尔，哈瓦那种源","vitolas":["Robusto","Toro","Pyramid","Hail Caeser"],"story":"2010 年推出，纪念创始人诞辰一百三十五周年与公司创立一百一十五周年。茄衣为哈瓦那种源的厄瓜多尔叶，茄芯来自多米尼加与中美洲；小批量手工卷制。"}]',

 '[{"name":"Diamond Crown Classic","color":"#C9A96E","force":"Light-Medium","wrapper":"كونيتيكت شيد، معتَّق خمس سنوات","vitolas":["No. 2","No. 3","No. 4","No. 5","No. 7","No. 9"],"story":"السلسلة الأصلية، سلسلة مئوية 1995 والقُطر الموحّد 54. غلاف كونيتيكت شيد معتَّق خمس سنوات قبل اللفّ، ورابط دومينيكي، وحشوة من خمسة أنواع تبغ من الكاريبي وأمريكا الوسطى."},{"name":"Diamond Crown Maduro","color":"#4A2C1A","force":"Medium","wrapper":"كونيتيكت برودليف","vitolas":["No. 3","No. 4","No. 5","No. 6"],"story":"السيجار نفسه تحت غلاف كونيتيكت برودليف يزيده كثافةً درجةً واحدة من دون أن يدفعه إلى القوّة. أربعة مقاسات، كلّها مأخوذة من ترقيم الـClassic."},{"name":"Diamond Crown Maximus","color":"#8B0000","force":"Full","wrapper":"إل باخو إكوادوري، مزروع في الشمس","vitolas":["Robusto","Toro","Double Corona","Torpedo"],"story":"الوجه القويّ، صدر في مطلع الألفية. غلاف إكوادوري من نوع إل باخو مزروع في الشمس ومعتَّق خمس سنوات، فوق رابط وحشوة دومينيكيَّين."},{"name":"Diamond Crown Julius Caeser","color":"#722F37","force":"Medium-Full","wrapper":"إكوادور، بذرة هافانية","vitolas":["Robusto","Toro","Pyramid","Hail Caeser"],"story":"صدر عام 2010 إحياءً لمئة وخمسة وثلاثين عامًا على مولد المؤسّس ومئة وخمسة عشر عامًا على داره. غلاف إكوادوري من بذرة هافانية، وحشوة دومينيكية وأمريكية وسطى؛ يُلفّ بدفعات صغيرة."}]');

-- ════════════════════════════════════════════════════════
-- LA FICHE DE LA MAISON MÈRE
-- ────────────────────────────────────────────────────────
-- Son dernier paragraphe nommait Diamond Crown comme une gamme parmi
-- d'autres et ignorait Cuesta-Rey. Il nomme désormais les deux marques
-- et dit pourquoi elles sont classées ailleurs.
-- ════════════════════════════════════════════════════════

UPDATE `brands` SET
 `history` = REPLACE(`history`,
   'Côté premium, la famille produit et distribue plusieurs gammes fabriquées en République dominicaine, dont Diamond Crown, née pour le centenaire de 1995.',
   'Côté premium, la famille ne roule rien elle-même : ses deux marques hautes, Diamond Crown et Cuesta-Rey, sortent de la Tabacalera A. Fuente, en République dominicaine. Chacune a sa fiche dans cet atlas, classée là-bas pour cette raison. El Reloj, lui, reste à Tampa.'),

 `history_en` = REPLACE(`history_en`,
   'On the premium side, the family produces and distributes several ranges made in the Dominican Republic, among them Diamond Crown, born for the centenary of 1995.',
   'On the premium side, the family rolls nothing itself: its two top brands, Diamond Crown and Cuesta-Rey, come out of Tabacalera A. Fuente, in the Dominican Republic. Each has its own entry in this atlas, filed there for that reason. El Reloj, for its part, stays in Tampa.'),

 `history_es` = REPLACE(`history_es`,
   'En el terreno premium, la familia produce y distribuye varias gamas fabricadas en la República Dominicana, entre ellas Diamond Crown, nacida para el centenario de 1995.',
   'En el terreno premium, la familia no lía nada ella misma: sus dos marcas altas, Diamond Crown y Cuesta-Rey, salen de la Tabacalera A. Fuente, en la República Dominicana. Cada una tiene su ficha en este atlas, clasificada allí por esa razón. El Reloj, en cambio, se queda en Tampa.'),

 `history_de` = REPLACE(`history_de`,
   'Auf der Premiumseite produziert und vertreibt die Familie mehrere in der Dominikanischen Republik gefertigte Linien, darunter Diamond Crown, entstanden zum hundertjährigen Jubiläum 1995.',
   'Auf der Premiumseite rollt die Familie nichts selbst: Ihre beiden Spitzenmarken, Diamond Crown und Cuesta-Rey, kommen aus der Tabacalera A. Fuente in der Dominikanischen Republik. Beide haben in diesem Atlas einen eigenen Eintrag und stehen aus eben diesem Grund dort. El Reloj dagegen bleibt in Tampa.'),

 `history_zh` = REPLACE(`history_zh`,
   '在优质产品线一侧，这个家族生产并经销多个在多米尼加共和国制造的系列，其中包括为1995年百年纪念而生的 Diamond Crown。',
   '在优质产品线一侧，这个家族并不自己卷制：旗下两个高端品牌 Diamond Crown 与 Cuesta-Rey 均出自多米尼加共和国的 Tabacalera A. Fuente。二者在本图集中各有专条，也正因如此归在那里。而 El Reloj 仍留在坦帕。'),

 `history_ar` = REPLACE(`history_ar`,
   'أمّا في الفاخر، فتنتج العائلة وتوزّع سلاسل عدّة تُصنع في الجمهورية الدومينيكية، منها «دايموند كراون» التي وُلدت لمئوية 1995.',
   'أمّا في الفاخر، فالعائلة لا تلفّ شيئًا بنفسها: علامتاها الكبريان، «دايموند كراون» و«كويستا-ري»، تخرجان من تاباكاليرا أ. فوينتي في الجمهورية الدومينيكية. ولكلٍّ منهما بطاقتها في هذا الأطلس، وهي مصنّفة هناك لهذا السبب بالذات. أمّا «إل ريلوخ» فيبقى في تامبا.'),

 `updated_at` = NOW()
 WHERE `name` = 'J.C. Newman';

-- ── `gamme` perd l'entrée qui faisait doublon ────────────
-- Diamond Crown a désormais une fiche entière ; la garder ici en trois
-- phrases était la confusion ligne/marque en miniature. Patron de la
-- migration 180 : la maison mère NOMME ses marques en prose.
UPDATE `brands` SET
 `gamme`    = '[{"name":"El Reloj","color":"#8B4513","force":"Medium","wrapper":"Habano","vitolas":["Corona"],"story":"Le nom de l''usine de Tampa, et l''hommage aux machines des années 1930 qui y tournent encore. Un cigare qui raconte un procédé que plus personne n''emploie."}]',
 `gamme_en` = '[{"name":"El Reloj","color":"#8B4513","force":"Medium","wrapper":"Habano","vitolas":["Corona"],"story":"The name of the Tampa factory, and a tribute to the 1930s machines still turning there. A cigar that tells of a process nobody else uses."}]',
 `gamme_es` = '[{"name":"El Reloj","color":"#8B4513","force":"Medium","wrapper":"Habano","vitolas":["Corona"],"story":"El nombre de la fábrica de Tampa, y el homenaje a las máquinas de los años treinta que allí siguen girando. Un cigarro que cuenta un procedimiento que ya nadie emplea."}]',
 `gamme_de` = '[{"name":"El Reloj","color":"#8B4513","force":"Medium","wrapper":"Habano","vitolas":["Corona"],"story":"Der Name der Fabrik in Tampa und eine Hommage an die Maschinen der 1930er Jahre, die dort noch laufen. Eine Zigarre, die von einem Verfahren erzählt, das sonst niemand mehr anwendet."}]',
 `gamme_zh` = '[{"name":"El Reloj","color":"#8B4513","force":"Medium","wrapper":"Habano","vitolas":["Corona"],"story":"坦帕那座工厂的名字，也是向仍在那里运转的1930年代机器致敬。一支讲述着再无他人使用之工艺的雪茄。"}]',
 `gamme_ar` = '[{"name":"El Reloj","color":"#8B4513","force":"Medium","wrapper":"Habano","vitolas":["Corona"],"story":"اسم مصنع تامبا، وتحيّة لآلات الثلاثينيات التي ما زالت تدور فيه. سيجار يروي طريقةً لم يعد أحد يستخدمها."}]',
 `updated_at` = NOW()
 WHERE `name` = 'J.C. Newman';

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
 WHERE b.`name` IN ('Cuesta-Rey', 'Diamond Crown', 'J.C. Newman')
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 181','systeme','marques_ajoutees','marque',0,
   'L ATLAS PORTAIT J.C. NEWMAN SANS SES DEUX MARQUES PREMIUM. Diamond Crown n existait que sous la forme d une ligne de trois phrases dans le champ gamme de la maison mere ; Cuesta-Rey n existait nulle part. C est la confusion ligne/marque prise dans l autre sens : docs/maisons-absentes.md a identifie vingt-sept LIGNES que les index prennent pour des maisons, ici ce sont deux MARQUES de plein droit reduites a des lignes'),
  (NULL,'migration 181','systeme','classement_pays','marque',0,
   'LES DEUX FICHES SONT CLASSEES EN REPUBLIQUE DOMINICAINE alors que la maison mere reste americaine. Le precedent est dans l atlas et il est exact : ASHTON. William Ashton Taylor est de Philadelphie, sa marque est americaine, sa fiche est dominicaine parce que ses cigares sortent de la Tabacalera A. Fuente. Diamond Crown et Cuesta-Rey sont le meme montage — marque americaine, tabac et main dominicains'),
  (NULL,'migration 181','systeme','fiche_mere_corrigee','marque',0,
   'le dernier paragraphe de J.C. Newman disait « plusieurs gammes fabriquees en Republique dominicaine, dont Diamond Crown » et ignorait Cuesta-Rey. Il nomme desormais les deux marques et dit pourquoi elles sont classees ailleurs, dans les six langues. Et son champ gamme perd l entree Diamond Crown, qui faisait doublon avec une fiche entiere — patron de la migration 180, ou les sept maisons meres nomment leurs marques EN PROSE'),
  (NULL,'migration 181','systeme','replace_verifie','marque',0,
   'LES SIX REPLACE SONT VERIFIES PAR UN SELECT EN FIN DE MIGRATION. Un REPLACE qui ne trouve pas son motif ne dit rien et sort en succes — c est ainsi qu un REPLACE allemand avait silencieusement echoue au chantier des jumelles, ou « anbahnen » est un verbe separable dont la particule part en fin de proposition'),
  (NULL,'migration 181','systeme','affirmation_attribuee','marque',0,
   'jcnewman.com attribue a Cuesta-Rey le titre de cigare officiel du roi Alphonse XIII d Espagne. Aucune source independante ne le confirme : la fiche l ATTRIBUE EXPLICITEMENT A LA MAISON — « c est elle qui le dit » — plutot que de l enoncer comme un fait. Meme traitement que les notes de presse sans source_url'),
  (NULL,'migration 181','systeme','json_en_toutes_lettres','systeme',0,
   'regle des migrations 179 et 180 respectee : producer_countries.brands pour dominican passe de vingt-quatre a vingt-six entrees, ECRITES ENTIERES. Aucune fonction JSON_*, qui gardent le type sur MySQL et le perdent sur MariaDB — ce qui avait vide la page de ce pays-la precisement');

-- ════════════════════════════════════════════════════════
-- LA FICHE DE PAYS, EN TOUTES LETTRES — 26 ENTRÉES
-- ════════════════════════════════════════════════════════
UPDATE `producer_countries`
   SET `brands` = '[{"desc":"Opus X — les plus convoités au monde","name":"Arturo Fuente","iconic":true},{"desc":"Luxe suisse, manufacture dominicaine","name":"Davidoff","iconic":true},{"desc":"Artisanat d''exception depuis 1996","name":"La Flor Dominicana","iconic":true},{"desc":"Standard mondial du Connecticut","name":"Macanudo","iconic":false},{"desc":"ESG et VSG, intemporels","name":"Ashton","iconic":false},{"desc":"Créée par le pianiste Avo Uvezian","name":"Avo","iconic":false},{"desc":"La douceur comme valeur absolue, depuis 1993","name":"Santa Damiana","iconic":false},{"desc":"1903, la plus ancienne manufacture dominicaine","name":"La Aurora","iconic":true},{"desc":"Repartir de zéro après une carrière entière","name":"E.P. Carrillo","iconic":true},{"desc":"1974, avant la vague — et toujours familiale","name":"Quesada","iconic":false},{"desc":"Tamboril, où la même main roule plusieurs bagues","name":"PDR Cigars","iconic":false},{"desc":"L''autre Montecristo, celui d''après 1960","name":"Montecristo Dominicain","iconic":true},{"desc":"Même bague que le havane, autre cigare","name":"Romeo y Julieta Dominicain","iconic":false},{"desc":"Le cigare que des dizaines de milliers de gens fument vraiment","name":"VegaFina","iconic":true},{"desc":"Un bon cigare selon le marché d''avant la mode de la puissance","name":"Don Diego","iconic":false},{"desc":"Né d''une boîte de nuit genevoise, et cela s''entend","name":"The Griffin''s","iconic":false},{"desc":"Un industriel redevenu artisan","name":"Matilde","iconic":false},{"desc":"La bague au pied du cigare — personne d''autre n''a osé","name":"Juan Clemente","iconic":false},{"desc":"Cape venue du Cameroun, cigares roulés ici","name":"Meerapfel","iconic":false},{"desc":"Née chez El Credito, à Miami, en 1972","name":"La Gloria Cubana Dominicaine","iconic":false},{"desc":"Tabacalera de García, La Romana","name":"H. Upmann Dominicain","iconic":false},{"desc":"Ne subsiste que hors de Cuba","name":"Henry Clay","iconic":false},{"desc":"Collection non cubaine annoncée en 2016","name":"Por Larrañaga Dominicain","iconic":false},{"name":"Boutique Blends","desc":"Rafael Nodal — Aging Room et Swag, chez Jochy Blanco","iconic":false},{"name":"Diamond Crown","desc":"La commande de Stanford Newman à Carlos Fuente Sr., pour le centenaire de 1995","iconic":false},{"name":"Cuesta-Rey","desc":"1884, Ybor City — plus ancienne que la maison qui la possède","iconic":false}]',
       `updated_at` = NOW()
 WHERE `id` = 'dominican';

-- ════════════════════════════════════════════════════════
-- LE CONTRÔLE DES SIX REPLACE
-- ────────────────────────────────────────────────────────
-- Doit rendre SIX lignes valant 1. Toute valeur à 0 signale un motif
-- qui n'a pas été trouvé — et un paragraphe resté dans son ancien état
-- sans que rien ne l'ait signalé.
-- ════════════════════════════════════════════════════════
SELECT 'fr' AS lang, `history`    LIKE '%ses deux marques hautes, Diamond Crown et Cuesta-Rey%' AS ok FROM `brands` WHERE `name`='J.C. Newman'
UNION ALL SELECT 'en', `history_en` LIKE '%its two top brands, Diamond Crown and Cuesta-Rey%'    FROM `brands` WHERE `name`='J.C. Newman'
UNION ALL SELECT 'es', `history_es` LIKE '%sus dos marcas altas, Diamond Crown y Cuesta-Rey%'    FROM `brands` WHERE `name`='J.C. Newman'
UNION ALL SELECT 'de', `history_de` LIKE '%Diamond Crown und Cuesta-Rey, kommen aus der Tabacalera%' FROM `brands` WHERE `name`='J.C. Newman'
UNION ALL SELECT 'zh', `history_zh` LIKE '%Diamond Crown 与 Cuesta-Rey 均出自%'                    FROM `brands` WHERE `name`='J.C. Newman'
UNION ALL SELECT 'ar', `history_ar` LIKE '%«دايموند كراون» و«كويستا-ري»%'                        FROM `brands` WHERE `name`='J.C. Newman';