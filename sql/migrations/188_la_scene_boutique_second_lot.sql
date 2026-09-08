-- ════════════════════════════════════════════════════════
-- 188 — La scène boutique, second lot
-- ────────────────────────────────────────────────────────
--   Southern Draw            Robert et Sharon Holt, 2014   nicaragua
--   HVC Cigars               Reinier Lorenzo, 2011         nicaragua
--   Fratello                 Omar de Frias, 2013           nicaragua
--   Curivari                 Andreas Throuvalas, 2003      nicaragua
--   Black Label Trading Co.  James et Angela Brown, 2013   nicaragua
--   Padilla                  Ernesto Padilla, 2003         usa
--
-- ⚠ LES SIX ONT ÉTÉ VÉRIFIÉES ROULÉES MAIN AVANT D'ÊTRE ÉCRITES.
-- La règle de la migration 187 — aucun cigare de machine — s'applique
-- d'abord à ce qu'on ajoute. Black Label Trading déclare « 100 %
-- handmade » ; HVC « traditional hand-made cigar methods » ; Curivari
-- le procédé cubain et la triple coiffe. Aucune des six ne fait de
-- cigarillo.
--
-- ── PADILLA EST AMÉRICAINE, PAS NICARAGUAYENNE ──────────
-- Le recensement la classait au Nicaragua. La vérification dit autre
-- chose : le Padilla Miami, gamme emblématique de la maison, est roulé
-- à EL TITAN DE BRONZE, dans la Petite Havane — l'atelier de Calle Ocho
-- que cet atlas porte déjà, sous `usa`. Le tabac est nicaraguayen,
-- cultivé par Aganorsa, mais l'atlas classe par le lieu où le cigare
-- est FAIT. C'est la règle de Casdagli, de Diamond Crown et de Nicoya.
--
-- D'autres gammes viennent de Raíces Cubanas au Honduras et de la
-- Tabacalera A.J. Fernández au Nicaragua : la fiche l'écrit, comme
-- celle de Room101 (migration 185).
--
-- ── ET DEUX MAISONS ONT FINI PAR AVOIR DES MURS ─────────
-- La migration 185 montrait cinq maisons sur six SANS usine. Celle-ci
-- montre la suite de l'histoire : HVC a ouvert sa propre fabrique à
-- Estelí en 2021, après dix ans passés chez Aganorsa ; Black Label
-- Trading a ouvert la Fábrica Oveja Negra en 2015, deux ans après ses
-- débuts. Le modèle sans usine n'est pas toujours un état définitif —
-- c'est parfois une étape.
--
-- Southern Draw est le cas inverse et il mérite d'être noté : elle ne
-- fait rouler que chez A.J. Fernández, UN SEUL atelier, quand Crowned
-- Heads, Dunbarton et Room101 en emploient chacune plusieurs.
--
-- ── CE QUE CES FICHES REFUSENT D'ÉCRIRE ─────────────────
-- Le Buenaventura de Curivari et plusieurs Southern Draw portent des
-- notes de Cigar Aficionado. Aucune n'entre ici faute de `source_url` —
-- règle de `marques_check`, appliquée depuis El Sitio (182).
-- Et « la seule marque boutique fabriquée exclusivement chez A.J.
-- Fernández » n'est pas reprise : c'est un rang, pas un fait.
--
-- ── LE TABLEAU JSON EST POSÉ EN TOUTES LETTRES ──────────
-- Règle des migrations 179 à 187 : aucun `JSON_*`. `nicaragua` passe de
-- vingt-huit à trente-trois entrées, `usa` de dix à onze.
--
-- ⚠ LES SIX `founded` TIENNENT SOUS 47 CARACTÈRES — leçon de la 184,
-- comptés avant écriture.
--
-- Sources : southerndrawcigars.com et famous-smoke.com (les Holt, 2014,
-- A.J. Fernández, Rose of Sharon), premiumcigars.org et
-- bestcigarprices.com (HVC : Havana City, 2011, Aganorsa, la fabrique
-- de 2021), thecigarauthority.com et cigar.com (Omar de Frias, la NASA,
-- Joya de Nicaragua), smokingpipes.com (Curivari : Throuvalas, 2003,
-- semence cubaine, procédé cubain), ovejanegracigars.com et
-- premiumcigars.org (Black Label : les Brown, 2013, Oveja Negra 2015,
-- 100 % handmade), cigaraficionado.com « Back in the U.S.A. — Padilla
-- Miami » et padillacigars.com (Heberto Padilla, El Titan de Bronze,
-- Raíces Cubanas).
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

-- ── Southern Draw ────────────────────────────────────────
('Southern Draw', 'nicaragua', '2014 — Robert et Sharon Holt, Estelí',
 'Tabacalera A.J. Fernández, Estelí, Nicaragua',

 'Southern Draw est une maison de couple. Robert et Sharon Holt la fondent en 2014 ; lui est un vétéran de l''armée américaine, et la maison le dit plutôt que de le taire.

Elle ne fait rouler qu''à un seul endroit : la Tabacalera A.J. Fernández, à Estelí. C''est rare parmi les maisons sans usine — Crowned Heads, Dunbarton et Room101 en emploient chacune plusieurs, et cette dispersion est même devenue la norme de la scène boutique.

Le nom de sa gamme la plus connue est celui de sa femme. Rose of Sharon est une plante, mais c''est d''abord Sharon Holt, et la maison en fait le centre de son propos — ce qu''elle appelle une culture de l''honneur, fondée sur la famille, la foi et la compagnie.

Les autres gammes portent des noms de plantes et de reliefs du Sud américain : Kudzu, Cedrus, Jacobs Ladder, Manzanita. C''est un ancrage régional revendiqué, pour une marque dont tout le tabac vient d''Amérique centrale.',

 '[{"name":"Rose of Sharon","color":"#C9A96E","force":"Light-Medium","wrapper":"Connecticut d''Équateur","vitolas":["Robusto","Toro","Corona"],"story":"La gamme qui porte le prénom de Sharon Holt. Cape Connecticut d''Équateur, registre doux — c''est l''entrée du catalogue, et celle par laquelle la maison s''est fait connaître."},{"name":"Kudzu","color":"#4A2C1A","force":"Full","wrapper":"Assemblage roulé chez A.J. Fernández","vitolas":["Robusto","Toro"],"story":"Le kudzu est une liane envahissante du Sud des États-Unis, qui recouvre tout ce qu''elle touche. C''est le versant corsé du catalogue, et le nom n''est pas neutre."},{"name":"Jacobs Ladder","color":"#3A2A20","force":"Full","wrapper":"Assemblage roulé chez A.J. Fernández","vitolas":["Brimstone","Robusto"],"story":"La gamme la plus dense, aux vitoles nommées en vocabulaire biblique — Brimstone, le soufre. La maison assume l''imagerie."}]',

 'Southern Draw is a couple''s house. Robert and Sharon Holt founded it in 2014; he is a US Army veteran, and the house says so rather than keeping quiet about it.

It has its cigars rolled in one place only: Tabacalera A.J. Fernández, in Estelí. That is rare among houses without a factory — Crowned Heads, Dunbarton and Room101 each use several, and that spreading has become the norm on the boutique scene.

Its best-known range carries his wife''s name. Rose of Sharon is a plant, but it is first of all Sharon Holt, and the house makes it the centre of its argument — what it calls a culture of honour, built on family, faith and fellowship.

The other ranges take the names of plants and landforms of the American South: Kudzu, Cedrus, Jacobs Ladder, Manzanita. It is a claimed regional anchoring, for a brand whose tobacco all comes from Central America.',

 'Southern Draw es una casa de pareja. Robert y Sharon Holt la fundan en 2014; él es veterano del ejército estadounidense, y la casa lo dice en vez de callarlo.

Solo hace liar en un sitio: la Tabacalera A.J. Fernández, en Estelí. Es raro entre las casas sin fábrica — Crowned Heads, Dunbarton y Room101 emplean varias cada una, y esa dispersión se ha vuelto la norma de la escena boutique.

Su gama más conocida lleva el nombre de su mujer. Rose of Sharon es una planta, pero es ante todo Sharon Holt, y la casa hace de ello el centro de su discurso: lo que llama una cultura del honor, fundada en la familia, la fe y la compañía.

Las demás gamas llevan nombres de plantas y de relieves del Sur estadounidense: Kudzu, Cedrus, Jacobs Ladder, Manzanita. Es un anclaje regional reivindicado, para una marca cuyo tabaco viene todo de Centroamérica.',

 'Southern Draw ist das Haus eines Paares. Robert und Sharon Holt gründeten es 2014; er ist Veteran der US-Armee, und das Haus sagt es, statt darüber zu schweigen.

Es lässt an einem einzigen Ort rollen: in der Tabacalera A.J. Fernández in Estelí. Das ist selten unter den Häusern ohne Fabrik — Crowned Heads, Dunbarton und Room101 nutzen jeweils mehrere, und diese Streuung ist zur Regel der Boutiqueszene geworden.

Die bekannteste Linie trägt den Namen seiner Frau. Rose of Sharon ist eine Pflanze, aber zuerst ist es Sharon Holt, und das Haus macht das zum Kern seiner Aussage — was es eine Kultur der Ehre nennt, gegründet auf Familie, Glauben und Gemeinschaft.

Die übrigen Linien tragen Namen von Pflanzen und Landformen des amerikanischen Südens: Kudzu, Cedrus, Jacobs Ladder, Manzanita. Es ist eine bewusst behauptete regionale Verankerung, für eine Marke, deren Tabak vollständig aus Mittelamerika stammt.',

 'Southern Draw 是一对夫妻的公司。Robert 与 Sharon Holt 于 2014 年创办；他是美军退伍军人，公司对此直言不讳。

它只在一个地方代工：埃斯特利的 Tabacalera A.J. Fernández。这在没有自有工厂的公司中并不多见——Crowned Heads、Dunbarton 与 Room101 各自使用数家，而这种分散已成为精品圈的常态。

它最知名的一条线以妻子之名命名。Rose of Sharon 是一种植物，但它首先是 Sharon Holt；公司把这一点作为自己主张的核心——他们所说的荣誉文化，建立在家庭、信仰与情谊之上。

其余各线取名于美国南方的植物与地貌：Kudzu、Cedrus、Jacobs Ladder、Manzanita。这是一种主动申明的地域归属，而其烟叶却全部来自中美洲。',

 'ساذرن درو دار زوجين. أسّسها روبرت وشارون هولت عام 2014؛ وهو من قدامى محاربي الجيش الأمريكي، وتقول الدار ذلك بدل أن تسكت عنه.

ولا تلفّ إلا في مكان واحد: تاباكاليرا أ. ج. فرنانديز في إستيلي. وهذا نادر بين الدور التي لا مصنع لها — فكراونِد هيدز ودنبارتون ورووم101 تستعمل كلٌّ منها عدّة مصانع، وقد صار هذا التشتّت قاعدة مشهد البوتيك.

وتحمل سلسلتها الأشهر اسم زوجته. «رَوز أوف شارون» نبتة، لكنّها قبل ذلك شارون هولت؛ وتجعل الدار من ذلك محور خطابها — ما تسمّيه ثقافة الشرف، القائمة على الأسرة والإيمان والصحبة.

أمّا بقية السلاسل فتحمل أسماء نباتات وتضاريس من الجنوب الأمريكي: كودزو، وسيدروس، وجايكوبس لادر، ومانزانيتا. إنّه انتماء إقليمي مُعلَن، لعلامة يأتي تبغها كلّه من أمريكا الوسطى.',

 '[{"name":"Rose of Sharon","color":"#C9A96E","force":"Light-Medium","wrapper":"Ecuadorian Connecticut","vitolas":["Robusto","Toro","Corona"],"story":"The range that carries Sharon Holt''s name. Ecuadorian Connecticut wrapper, a mild register — it is the entry to the catalogue, and the one that made the house known."},{"name":"Kudzu","color":"#4A2C1A","force":"Full","wrapper":"Rolled at A.J. Fernández","vitolas":["Robusto","Toro"],"story":"Kudzu is an invasive vine of the American South that covers everything it touches. This is the fuller side of the catalogue, and the name is not neutral."},{"name":"Jacobs Ladder","color":"#3A2A20","force":"Full","wrapper":"Rolled at A.J. Fernández","vitolas":["Brimstone","Robusto"],"story":"The densest range, its vitolas named in biblical vocabulary — Brimstone, sulphur. The house owns the imagery."}]',

 '[{"name":"Rose of Sharon","color":"#C9A96E","force":"Light-Medium","wrapper":"Connecticut de Ecuador","vitolas":["Robusto","Toro","Corona"],"story":"La gama que lleva el nombre de Sharon Holt. Capa Connecticut de Ecuador, registro suave: es la entrada del catálogo, y aquella por la que la casa se dio a conocer."},{"name":"Kudzu","color":"#4A2C1A","force":"Full","wrapper":"Liada en A.J. Fernández","vitolas":["Robusto","Toro"],"story":"El kudzu es una liana invasora del Sur de Estados Unidos que cubre todo lo que toca. Es la vertiente fuerte del catálogo, y el nombre no es neutro."},{"name":"Jacobs Ladder","color":"#3A2A20","force":"Full","wrapper":"Liada en A.J. Fernández","vitolas":["Brimstone","Robusto"],"story":"La gama más densa, con vitolas nombradas en vocabulario bíblico: Brimstone, el azufre. La casa asume la imaginería."}]',

 '[{"name":"Rose of Sharon","color":"#C9A96E","force":"Light-Medium","wrapper":"Ecuador-Connecticut","vitolas":["Robusto","Toro","Corona"],"story":"Die Linie, die Sharon Holts Namen trägt. Ecuador-Connecticut-Deckblatt, mildes Register — sie ist der Einstieg in den Katalog und hat das Haus bekannt gemacht."},{"name":"Kudzu","color":"#4A2C1A","force":"Full","wrapper":"Bei A.J. Fernández gerollt","vitolas":["Robusto","Toro"],"story":"Kudzu ist eine wuchernde Kletterpflanze des amerikanischen Südens, die alles überzieht, was sie berührt. Das ist die kräftige Seite des Katalogs, und der Name ist nicht neutral."},{"name":"Jacobs Ladder","color":"#3A2A20","force":"Full","wrapper":"Bei A.J. Fernández gerollt","vitolas":["Brimstone","Robusto"],"story":"Die dichteste Linie, ihre Vitolas nach biblischem Vokabular benannt — Brimstone, der Schwefel. Das Haus steht zu der Bildsprache."}]',

 '[{"name":"Rose of Sharon","color":"#C9A96E","force":"Light-Medium","wrapper":"厄瓜多尔康涅狄格","vitolas":["Robusto","Toro","Corona"],"story":"以 Sharon Holt 之名命名的一条线。厄瓜多尔康涅狄格茄衣，风格柔和——它是目录的入门款，也是让这家为人所知的一款。"},{"name":"Kudzu","color":"#4A2C1A","force":"Full","wrapper":"于 A.J. Fernández 卷制","vitolas":["Robusto","Toro"],"story":"葛藤是美国南方的一种入侵藤蔓，所触之处尽被覆盖。这是目录中浓烈的一侧，名字并不中性。"},{"name":"Jacobs Ladder","color":"#3A2A20","force":"Full","wrapper":"于 A.J. Fernández 卷制","vitolas":["Brimstone","Robusto"],"story":"最厚重的一条线，尺寸以圣经词汇命名——Brimstone，硫磺。公司坦然接受这套意象。"}]',

 '[{"name":"Rose of Sharon","color":"#C9A96E","force":"Light-Medium","wrapper":"كونيتيكت إكوادوري","vitolas":["Robusto","Toro","Corona"],"story":"السلسلة التي تحمل اسم شارون هولت. غلاف كونيتيكت إكوادوري ومزاج لطيف — وهي مدخل الكتالوج، وبها عُرفت الدار."},{"name":"Kudzu","color":"#4A2C1A","force":"Full","wrapper":"ملفوف عند أ. ج. فرنانديز","vitolas":["Robusto","Toro"],"story":"الكودزو نبتة متسلّقة غازية في جنوب الولايات المتحدة تغطّي كلّ ما تلمسه. وهو الوجه القويّ في الكتالوج، والاسم ليس محايدًا."},{"name":"Jacobs Ladder","color":"#3A2A20","force":"Full","wrapper":"ملفوف عند أ. ج. فرنانديز","vitolas":["Brimstone","Robusto"],"story":"أكثف السلاسل، ومقاساتها مسمّاة بمفردات توراتية — «برِمستون»، أي الكبريت. والدار تتبنّى هذه الصور."}]'),

-- ── HVC Cigars ───────────────────────────────────────────
('HVC Cigars', 'nicaragua', '2011 — Reinier Lorenzo ; Estelí depuis 2021',
 'Fabrique propre à Estelí depuis 2021 ; auparavant Aganorsa, Estelí',

 'HVC est un sigle, et il dit d''où vient son fondateur : Havana City. Reinier Lorenzo est cubain, de La Havane, et il fonde la maison en 2011.

Pendant dix ans, il ne possède rien. Ses cigares sont roulés chez Aganorsa, à Estelí — la maison que cet atlas porte sous le nom d''Aganorsa Leaf, et qui cultive sa propre feuille. Le catalogue tient d''ailleurs entièrement sur ce tabac.

En 2021, il ouvre sa propre fabrique, toujours à Estelí. C''est le passage que peu de maisons boutique accomplissent : partie très petite, elle produit aujourd''hui près d''un million de cigares par an. Le modèle sans usine n''est pas toujours un état définitif — c''est parfois une étape.

Les noms disent la même chose que le sigle. La Serie A est composée exclusivement de feuilles nicaraguayennes de classe A. Le Pan Caliente reprend l''expression cubaine qui désigne ce qui part comme du pain chaud, et c''est la gamme la plus vendue de la maison.',

 '[{"name":"Serie A","color":"#8B5A2B","force":"Medium-Full","wrapper":"Nicaragua (Aganorsa)","vitolas":["Perlas","Robusto","Toro"],"story":"Composée exclusivement de feuilles nicaraguayennes classées A, cultivées par Aganorsa. Le nom n''est pas une lettre décorative : c''est le classement de la feuille."},{"name":"Pan Caliente","color":"#A0522D","force":"Medium-Full","wrapper":"Nicaragua (Aganorsa)","vitolas":["Robusto","Toro"],"story":"« Pain chaud » — l''expression cubaine pour ce qui se vend aussitôt posé. C''est la gamme la plus vendue de la maison, et le nom était un pari sur elle-même."},{"name":"Hot Cake","color":"#6B4226","force":"Full","wrapper":"Nicaragua (Aganorsa)","vitolas":["Robusto","Toro"],"story":"La suite du Pan Caliente, dont elle traduit le nom en anglais. Même tabac Aganorsa, un registre plus corsé."}]',

 'HVC is an acronym, and it says where its founder comes from: Havana City. Reinier Lorenzo is Cuban, from Havana, and he founded the house in 2011.

For ten years he owned nothing. His cigars were rolled at Aganorsa, in Estelí — the house this atlas holds as Aganorsa Leaf, which grows its own leaf. The catalogue rests entirely on that tobacco.

In 2021 he opened his own factory, still in Estelí. It is the step few boutique houses take: having started very small, it now makes close to a million cigars a year. The factoryless model is not always a settled state — sometimes it is a stage.

The names say the same thing as the acronym. Serie A is blended exclusively from Nicaraguan class-A leaf. Pan Caliente takes the Cuban expression for what sells like hot bread, and it is the house''s best-selling range.',

 'HVC es una sigla, y dice de dónde viene su fundador: Havana City. Reinier Lorenzo es cubano, de La Habana, y funda la casa en 2011.

Durante diez años no posee nada. Sus puros se lían en Aganorsa, en Estelí — la casa que este atlas recoge como Aganorsa Leaf, y que cultiva su propia hoja. El catálogo se sostiene por entero sobre ese tabaco.

En 2021 abre su propia fábrica, siempre en Estelí. Es el paso que pocas casas boutique dan: partida muy pequeña, produce hoy cerca de un millón de puros al año. El modelo sin fábrica no siempre es un estado definitivo: a veces es una etapa.

Los nombres dicen lo mismo que la sigla. La Serie A se compone exclusivamente de hojas nicaragüenses de clase A. El Pan Caliente retoma la expresión cubana que designa lo que se vende como pan caliente, y es la gama más vendida de la casa.',

 'HVC ist ein Kürzel, und es sagt, woher sein Gründer kommt: Havana City. Reinier Lorenzo ist Kubaner, aus Havanna, und gründete das Haus 2011.

Zehn Jahre lang besaß er nichts. Seine Zigarren wurden bei Aganorsa in Estelí gerollt — dem Haus, das dieser Atlas als Aganorsa Leaf führt und das seinen eigenen Tabak anbaut. Der ganze Katalog ruht auf diesem Tabak.

2021 eröffnete er seine eigene Fabrik, weiterhin in Estelí. Es ist der Schritt, den wenige Boutiquehäuser gehen: sehr klein gestartet, stellt es heute an die eine Million Zigarren im Jahr her. Das Modell ohne Fabrik ist nicht immer ein Dauerzustand — manchmal ist es eine Etappe.

Die Namen sagen dasselbe wie das Kürzel. Die Serie A wird ausschließlich aus nicaraguanischem Blatt der Klasse A gemischt. Pan Caliente greift den kubanischen Ausdruck für das auf, was weggeht wie warmes Brot, und ist die meistverkaufte Linie des Hauses.',

 'HVC 是一个缩写，它道出了创办人的来处：Havana City（哈瓦那城）。Reinier Lorenzo 是来自哈瓦那的古巴人，2011 年创办了这家公司。

有十年时间他一无所有。他的雪茄在埃斯特利的 Aganorsa 卷制——本图集以 Aganorsa Leaf 之名收录的那一家，它自种烟叶。整份目录都建立在这种烟草之上。

2021 年，他在埃斯特利开设了自己的工厂。这是少有精品公司走出的一步：起步极小，如今年产近百万支。没有工厂的模式并非永久状态——有时它只是一个阶段。

各系列的名字与缩写说着同样的事。Serie A 全部由尼加拉瓜 A 级烟叶调配。Pan Caliente 取自古巴俗语，形容像热面包一样一出炉就卖光的东西，而它正是这家最畅销的一条线。',

 'HVC اختصار، وهو يقول من أين جاء مؤسّسها: هافانا سيتي. رينيير لورينثو كوبي من هافانا، وقد أسّس الدار عام 2011.

وطوال عشر سنوات لم يملك شيئًا. كان سيجاره يُلَفّ عند أغانورسا في إستيلي — الدار التي يضمّها هذا الأطلس باسم Aganorsa Leaf، والتي تزرع ورقها بنفسها. ويقوم الكتالوج كلّه على هذا التبغ.

وفي 2021 افتتح مصنعه الخاص، في إستيلي أيضًا. وهي الخطوة التي قلّ أن تخطوها دور البوتيك: بدأت صغيرة جدًا، وتنتج اليوم قرابة مليون سيجار سنويًا. فالنموذج بلا مصنع ليس دائمًا حالةً نهائية — بل قد يكون مرحلة.

والأسماء تقول ما يقوله الاختصار. تُمزَج «سيري إيه» حصرًا من ورق نيكاراغوي من الفئة أ. أمّا «بان كاليينتي» فتستعيد التعبير الكوبي لما يُباع كالخبز الساخن، وهي السلسلة الأكثر مبيعًا في الدار.',

 '[{"name":"Serie A","color":"#8B5A2B","force":"Medium-Full","wrapper":"Nicaragua (Aganorsa)","vitolas":["Perlas","Robusto","Toro"],"story":"Blended exclusively from Nicaraguan class-A leaf grown by Aganorsa. The name is not a decorative letter: it is the leaf grade."},{"name":"Pan Caliente","color":"#A0522D","force":"Medium-Full","wrapper":"Nicaragua (Aganorsa)","vitolas":["Robusto","Toro"],"story":"\\"Hot bread\\" — the Cuban expression for what sells the moment it is set down. It is the house''s best-selling range, and the name was a bet on itself."},{"name":"Hot Cake","color":"#6B4226","force":"Full","wrapper":"Nicaragua (Aganorsa)","vitolas":["Robusto","Toro"],"story":"The follow-up to Pan Caliente, whose name it translates into English. Same Aganorsa tobacco, a fuller register."}]',

 '[{"name":"Serie A","color":"#8B5A2B","force":"Medium-Full","wrapper":"Nicaragua (Aganorsa)","vitolas":["Perlas","Robusto","Toro"],"story":"Compuesta exclusivamente de hojas nicaragüenses de clase A, cultivadas por Aganorsa. El nombre no es una letra decorativa: es la clasificación de la hoja."},{"name":"Pan Caliente","color":"#A0522D","force":"Medium-Full","wrapper":"Nicaragua (Aganorsa)","vitolas":["Robusto","Toro"],"story":"La expresión cubana para lo que se vende nada más ponerlo. Es la gama más vendida de la casa, y el nombre era una apuesta sobre sí misma."},{"name":"Hot Cake","color":"#6B4226","force":"Full","wrapper":"Nicaragua (Aganorsa)","vitolas":["Robusto","Toro"],"story":"La continuación del Pan Caliente, cuyo nombre traduce al inglés. Mismo tabaco Aganorsa, un registro más fuerte."}]',

 '[{"name":"Serie A","color":"#8B5A2B","force":"Medium-Full","wrapper":"Nicaragua (Aganorsa)","vitolas":["Perlas","Robusto","Toro"],"story":"Ausschließlich aus nicaraguanischem Blatt der Klasse A gemischt, von Aganorsa angebaut. Der Name ist kein dekorativer Buchstabe: Es ist die Blattklasse."},{"name":"Pan Caliente","color":"#A0522D","force":"Medium-Full","wrapper":"Nicaragua (Aganorsa)","vitolas":["Robusto","Toro"],"story":"\\"Warmes Brot\\" — der kubanische Ausdruck für das, was weggeht, kaum dass es daliegt. Es ist die meistverkaufte Linie des Hauses, und der Name war eine Wette auf sich selbst."},{"name":"Hot Cake","color":"#6B4226","force":"Full","wrapper":"Nicaragua (Aganorsa)","vitolas":["Robusto","Toro"],"story":"Die Fortsetzung der Pan Caliente, deren Namen sie ins Englische überträgt. Gleicher Aganorsa-Tabak, kräftigeres Register."}]',

 '[{"name":"Serie A","color":"#8B5A2B","force":"Medium-Full","wrapper":"尼加拉瓜（Aganorsa）","vitolas":["Perlas","Robusto","Toro"],"story":"全部以 Aganorsa 种植的尼加拉瓜 A 级烟叶调配。这个字母不是装饰，它就是烟叶的分级。"},{"name":"Pan Caliente","color":"#A0522D","force":"Medium-Full","wrapper":"尼加拉瓜（Aganorsa）","vitolas":["Robusto","Toro"],"story":"「热面包」——古巴俗语，形容一放上货架就卖光的东西。这是这家最畅销的一条线，而这个名字当初是对自己的一场下注。"},{"name":"Hot Cake","color":"#6B4226","force":"Full","wrapper":"尼加拉瓜（Aganorsa）","vitolas":["Robusto","Toro"],"story":"Pan Caliente 的后续，名字是它的英译。同样的 Aganorsa 烟叶，风格更浓。"}]',

 '[{"name":"Serie A","color":"#8B5A2B","force":"Medium-Full","wrapper":"نيكاراغوا (أغانورسا)","vitolas":["Perlas","Robusto","Toro"],"story":"تُمزَج حصرًا من ورق نيكاراغوي من الفئة أ تزرعه أغانورسا. والحرف ليس زخرفًا: إنّه تصنيف الورقة."},{"name":"Pan Caliente","color":"#A0522D","force":"Medium-Full","wrapper":"نيكاراغوا (أغانورسا)","vitolas":["Robusto","Toro"],"story":"«الخبز الساخن» — التعبير الكوبي لما يُباع فور وضعه. وهي السلسلة الأكثر مبيعًا في الدار، وكان الاسم رهانًا على نفسه."},{"name":"Hot Cake","color":"#6B4226","force":"Full","wrapper":"نيكاراغوا (أغانورسا)","vitolas":["Robusto","Toro"],"story":"تكملة «بان كاليينتي»، وتترجم اسمها إلى الإنجليزية. تبغ أغانورسا نفسه، بمزاج أقوى."}]'),

-- ── Fratello ─────────────────────────────────────────────
('Fratello', 'nicaragua', '2013 — Omar de Frias, chez Joya de Nicaragua',
 'Fábrica de Tabacos Joya de Nicaragua, Estelí, Nicaragua',

 'Omar de Frias était ingénieur à la NASA. Né en République dominicaine, élevé aux États-Unis, basketteur universitaire puis titulaire d''un master d''ingénierie, il travaillait sur des programmes spatiaux quand il a décidé de monter une marque de cigares.

Deux ans de préparation, et Fratello paraît au salon de l''IPCPR en 2013. Le nom veut dire « frère » en italien.

Tout est roulé à la Fábrica de Tabacos Joya de Nicaragua, à Estelí — la plus ancienne manufacture du pays, que cet atlas porte, et celle qui roule aussi pour Dunbarton et pour Room101.

Le catalogue tient sur quatre gammes : Bianco, Oro, Boxer et Navetta. Navetta signifie « navette » en italien, ce qui n''est probablement pas un hasard chez un ancien ingénieur spatial.',

 '[{"name":"Fratello Bianco","color":"#C9A96E","force":"Medium","wrapper":"Connecticut d''Équateur","vitolas":["Robusto","Toro"],"story":"Le versant clair du catalogue, sous cape Connecticut d''Équateur. C''est la gamme la plus accessible de la maison, et celle qui l''a fait entrer chez les détaillants."},{"name":"Fratello Oro","color":"#8B5A2B","force":"Medium-Full","wrapper":"Assemblage roulé à la Joya de Nicaragua","vitolas":["Robusto","Toro","Corona"],"story":"La gamme dorée, plus dense que la Bianco. Même atelier, même famille de tabacs, une composition plus affirmée."},{"name":"Navetta","color":"#4A2C1A","force":"Full","wrapper":"Assemblage roulé à la Joya de Nicaragua","vitolas":["Robusto","Toro"],"story":"« Navette », en italien. Le nom d''un ancien ingénieur de la NASA qui fait des cigares, et le versant le plus corsé de son catalogue."}]',

 'Omar de Frias was an engineer at NASA. Born in the Dominican Republic, raised in the United States, a college basketball player and then holder of a master''s in engineering, he was working on space programmes when he decided to start a cigar brand.

Two years of preparation, and Fratello appeared at the IPCPR trade show in 2013. The name means "brother" in Italian.

Everything is rolled at Fábrica de Tabacos Joya de Nicaragua, in Estelí — the country''s oldest factory, which this atlas holds, and the one that also rolls for Dunbarton and for Room101.

The catalogue rests on four ranges: Bianco, Oro, Boxer and Navetta. Navetta means "shuttle" in Italian, which is probably no accident for a former space engineer.',

 'Omar de Frias era ingeniero en la NASA. Nacido en la República Dominicana, criado en Estados Unidos, jugador universitario de baloncesto y luego máster en ingeniería, trabajaba en programas espaciales cuando decidió montar una marca de puros.

Dos años de preparación, y Fratello aparece en el salón de la IPCPR en 2013. El nombre quiere decir «hermano» en italiano.

Todo se lía en la Fábrica de Tabacos Joya de Nicaragua, en Estelí: la manufactura más antigua del país, que este atlas recoge, y la misma que lía para Dunbarton y para Room101.

El catálogo se sostiene sobre cuatro gamas: Bianco, Oro, Boxer y Navetta. Navetta significa «lanzadera» en italiano, lo que probablemente no sea casual en un antiguo ingeniero espacial.',

 'Omar de Frias war Ingenieur bei der NASA. Geboren in der Dominikanischen Republik, aufgewachsen in den Vereinigten Staaten, College-Basketballer und dann Master der Ingenieurwissenschaften, arbeitete er an Raumfahrtprogrammen, als er beschloss, eine Zigarrenmarke zu gründen.

Zwei Jahre Vorbereitung, und Fratello erschien 2013 auf der IPCPR-Messe. Der Name heißt auf Italienisch "Bruder".

Alles wird in der Fábrica de Tabacos Joya de Nicaragua in Estelí gerollt — der ältesten Manufaktur des Landes, die dieser Atlas führt, und derselben, die auch für Dunbarton und für Room101 rollt.

Der Katalog ruht auf vier Linien: Bianco, Oro, Boxer und Navetta. Navetta heißt auf Italienisch "Fähre" oder "Shuttle", was bei einem ehemaligen Raumfahrtingenieur wohl kein Zufall ist.',

 'Omar de Frias 曾是美国航天局的工程师。他生于多米尼加共和国，在美国长大，做过大学篮球运动员，后取得工程学硕士；他正参与航天项目时，决定创办一个雪茄品牌。

筹备两年之后，Fratello 于 2013 年在 IPCPR 展会上亮相。这个名字在意大利语中意为「兄弟」。

一切均在埃斯特利的 Fábrica de Tabacos Joya de Nicaragua 卷制——本图集收录的这家全国最古老的工厂，也为 Dunbarton 与 Room101 代工。

目录由四条线支撑：Bianco、Oro、Boxer 与 Navetta。Navetta 在意大利语中意为「航天飞机」，对一位前航天工程师而言，这大概不是偶然。',

 'كان عمر دي فرياس مهندسًا في ناسا. وُلد في الجمهورية الدومينيكية ونشأ في الولايات المتحدة، ولعب كرة السلة الجامعية ثم نال ماجستيرًا في الهندسة، وكان يعمل في برامج فضائية حين قرّر إنشاء علامة سيجار.

سنتان من التحضير، ثم ظهرت «فراتيلو» في معرض IPCPR عام 2013. والاسم يعني «أخ» بالإيطالية.

ويُلَفّ كلّ شيء في «فابريكا دي تاباكوس خويا دي نيكاراغوا» بإستيلي — أقدم مصانع البلاد، ويضمّه هذا الأطلس، وهو نفسه الذي يلفّ لدنبارتون ولرووم101.

ويقوم الكتالوج على أربع سلاسل: بيانكو، وأورو، وبوكسر، ونافيتّا. و«نافيتّا» تعني «المكوك» بالإيطالية، وهو على الأرجح ليس محض مصادفة عند مهندس فضاء سابق.',

 '[{"name":"Fratello Bianco","color":"#C9A96E","force":"Medium","wrapper":"Ecuadorian Connecticut","vitolas":["Robusto","Toro"],"story":"The pale side of the catalogue, under an Ecuadorian Connecticut wrapper. It is the house''s most accessible range, and the one that got it onto retailers'' shelves."},{"name":"Fratello Oro","color":"#8B5A2B","force":"Medium-Full","wrapper":"Rolled at Joya de Nicaragua","vitolas":["Robusto","Toro","Corona"],"story":"The golden range, denser than the Bianco. Same workshop, same family of tobaccos, a more assertive composition."},{"name":"Navetta","color":"#4A2C1A","force":"Full","wrapper":"Rolled at Joya de Nicaragua","vitolas":["Robusto","Toro"],"story":"\\"Shuttle\\", in Italian. The name of a former NASA engineer who makes cigars, and the fullest side of his catalogue."}]',

 '[{"name":"Fratello Bianco","color":"#C9A96E","force":"Medium","wrapper":"Connecticut de Ecuador","vitolas":["Robusto","Toro"],"story":"La vertiente clara del catálogo, bajo capa Connecticut de Ecuador. Es la gama más accesible de la casa, y la que la metió en las tiendas."},{"name":"Fratello Oro","color":"#8B5A2B","force":"Medium-Full","wrapper":"Liada en Joya de Nicaragua","vitolas":["Robusto","Toro","Corona"],"story":"La gama dorada, más densa que la Bianco. Mismo taller, misma familia de tabacos, una composición más afirmada."},{"name":"Navetta","color":"#4A2C1A","force":"Full","wrapper":"Liada en Joya de Nicaragua","vitolas":["Robusto","Toro"],"story":"«Lanzadera», en italiano. El nombre de un antiguo ingeniero de la NASA que hace puros, y la vertiente más fuerte de su catálogo."}]',

 '[{"name":"Fratello Bianco","color":"#C9A96E","force":"Medium","wrapper":"Ecuador-Connecticut","vitolas":["Robusto","Toro"],"story":"Die helle Seite des Katalogs, unter einem Ecuador-Connecticut-Deckblatt. Es ist die zugänglichste Linie des Hauses und diejenige, die es in den Handel gebracht hat."},{"name":"Fratello Oro","color":"#8B5A2B","force":"Medium-Full","wrapper":"Bei Joya de Nicaragua gerollt","vitolas":["Robusto","Toro","Corona"],"story":"Die goldene Linie, dichter als die Bianco. Dieselbe Werkstatt, dieselbe Tabakfamilie, eine bestimmtere Zusammensetzung."},{"name":"Navetta","color":"#4A2C1A","force":"Full","wrapper":"Bei Joya de Nicaragua gerollt","vitolas":["Robusto","Toro"],"story":"\\"Shuttle\\", auf Italienisch. Der Name eines ehemaligen NASA-Ingenieurs, der Zigarren macht, und die kräftigste Seite seines Katalogs."}]',

 '[{"name":"Fratello Bianco","color":"#C9A96E","force":"Medium","wrapper":"厄瓜多尔康涅狄格","vitolas":["Robusto","Toro"],"story":"目录中浅色的一侧，采用厄瓜多尔康涅狄格茄衣。这是这家最易入手的一条线，也是它得以进入零售渠道的那一条。"},{"name":"Fratello Oro","color":"#8B5A2B","force":"Medium-Full","wrapper":"于 Joya de Nicaragua 卷制","vitolas":["Robusto","Toro","Corona"],"story":"金色系列，比 Bianco 更为厚实。同一作坊，同一族烟叶，配方更为鲜明。"},{"name":"Navetta","color":"#4A2C1A","force":"Full","wrapper":"于 Joya de Nicaragua 卷制","vitolas":["Robusto","Toro"],"story":"意大利语中的「航天飞机」。这是一位做雪茄的前 NASA 工程师取的名字，也是他目录中最浓的一侧。"}]',

 '[{"name":"Fratello Bianco","color":"#C9A96E","force":"Medium","wrapper":"كونيتيكت إكوادوري","vitolas":["Robusto","Toro"],"story":"الوجه الفاتح في الكتالوج، تحت غلاف كونيتيكت إكوادوري. وهي أيسر سلاسل الدار منالًا، وبها دخلت المتاجر."},{"name":"Fratello Oro","color":"#8B5A2B","force":"Medium-Full","wrapper":"ملفوف في خويا دي نيكاراغوا","vitolas":["Robusto","Toro","Corona"],"story":"السلسلة الذهبية، أكثف من «بيانكو». الورشة نفسها وعائلة التبغ نفسها، بتركيبة أوضح."},{"name":"Navetta","color":"#4A2C1A","force":"Full","wrapper":"ملفوف في خويا دي نيكاراغوا","vitolas":["Robusto","Toro"],"story":"«المكوك» بالإيطالية. اسم اختاره مهندس ناسا سابق صار يصنع السيجار، وهو الوجه الأقوى في كتالوجه."}]'),

-- ── Curivari ─────────────────────────────────────────────
('Curivari', 'nicaragua', '2003 — Andreas Throuvalas ; roulé au Nicaragua',
 'Estelí, Nicaragua — la maison ne nomme pas sa fabrique',

 'Curivari est une marque grecque de cigares nicaraguayens. Andreas Throuvalas, détaillant en Grèce, la fonde en 2003 en Europe ; elle n''entre aux États-Unis qu''en 2010.

Le projet est explicite et il est difficile : reproduire le profil du havane sans tabac cubain. Les feuilles sont des criollo et des corojo de semence cubaine cultivés au Nicaragua, travaillés selon le procédé cubain traditionnel, et chaque cigare est fini par une triple coiffe à la cubaine.

La maison ne publie pas le nom de la fabrique qui roule pour elle, et cet atlas ne l''invente pas.

Les gammes récentes portent des noms grecs — Achilles, Socrates, Aristoteles, Centauro — en hommage à l''origine du fondateur. Les plus anciennes gardent l''espagnol : Buenaventura, Selección Privada, Gloria de León. Les deux séries cohabitent dans le même catalogue, ce qui dit assez bien ce qu''est cette maison : grecque de tête, cubaine d''intention, nicaraguayenne de matière.',

 '[{"name":"Buenaventura","color":"#8B5A2B","force":"Medium","wrapper":"Semence cubaine cultivée au Nicaragua","vitolas":["BV500","BV560","BV560 Torpedo"],"story":"L''une des premières gammes, et la plus répandue. Les vitoles sont désignées par leurs dimensions plutôt que par un nom de forme."},{"name":"Selección Privada","color":"#A0522D","force":"Medium","wrapper":"Semence cubaine cultivée au Nicaragua","vitolas":["Corona","Robusto"],"story":"Le registre crémeux et boisé du catalogue. C''est la gamme où l''intention cubaine de la maison s''entend le plus directement."},{"name":"Achilles","color":"#6B4226","force":"Medium-Full","wrapper":"Semence cubaine cultivée au Nicaragua","vitolas":["Mirmidones","Gloriosos","Heroicos","Eternos"],"story":"La série grecque, dont les vitoles portent des noms tirés de l''Iliade. Le fondateur est grec, et il a fini par le mettre sur les bagues."}]',

 'Curivari is a Greek brand of Nicaraguan cigars. Andreas Throuvalas, a retailer in Greece, founded it in 2003 in Europe; it only entered the United States in 2010.

The project is explicit and it is hard: to reproduce the profile of a Havana without Cuban tobacco. The leaves are Cuban-seed criollo and corojo grown in Nicaragua, worked by the traditional Cuban process, and every cigar is finished with a Cuban-style triple cap.

The house does not publish the name of the factory that rolls for it, and this atlas does not invent one.

The recent ranges carry Greek names — Achilles, Socrates, Aristoteles, Centauro — in tribute to the founder''s origin. The older ones keep Spanish: Buenaventura, Selección Privada, Gloria de León. The two series live in the same catalogue, which says fairly well what this house is: Greek in the head, Cuban in intent, Nicaraguan in matter.',

 'Curivari es una marca griega de puros nicaragüenses. Andreas Throuvalas, detallista en Grecia, la funda en 2003 en Europa; solo entra en Estados Unidos en 2010.

El proyecto es explícito y es difícil: reproducir el perfil del habano sin tabaco cubano. Las hojas son criollo y corojo de semilla cubana cultivados en Nicaragua, trabajados según el procedimiento cubano tradicional, y cada puro se remata con una triple perilla a la cubana.

La casa no publica el nombre de la fábrica que lía para ella, y este atlas no lo inventa.

Las gamas recientes llevan nombres griegos — Achilles, Socrates, Aristoteles, Centauro — en homenaje al origen del fundador. Las más antiguas conservan el español: Buenaventura, Selección Privada, Gloria de León. Las dos series conviven en el mismo catálogo, lo que dice bastante bien lo que es esta casa: griega de cabeza, cubana de intención, nicaragüense de materia.',

 'Curivari ist eine griechische Marke nicaraguanischer Zigarren. Andreas Throuvalas, Händler in Griechenland, gründete sie 2003 in Europa; in die Vereinigten Staaten kam sie erst 2010.

Das Vorhaben ist ausgesprochen und es ist schwierig: das Profil einer Havanna ohne kubanischen Tabak nachzubilden. Die Blätter sind Criollo und Corojo kubanischer Saat, in Nicaragua angebaut, nach dem traditionellen kubanischen Verfahren verarbeitet, und jede Zigarre wird mit einem kubanischen Dreifachdeckel abgeschlossen.

Das Haus nennt den Namen der Fabrik, die für es rollt, nicht, und dieser Atlas erfindet keinen.

Die jüngeren Linien tragen griechische Namen — Achilles, Socrates, Aristoteles, Centauro — als Verbeugung vor der Herkunft des Gründers. Die älteren behalten das Spanische: Buenaventura, Selección Privada, Gloria de León. Beide Reihen leben im selben Katalog, was recht gut sagt, was dieses Haus ist: griechisch im Kopf, kubanisch in der Absicht, nicaraguanisch in der Materie.',

 'Curivari 是一个尼加拉瓜雪茄的希腊品牌。希腊零售商 Andreas Throuvalas 于 2003 年在欧洲创办了它，直到 2010 年才进入美国市场。

其目标明确而困难：在不用古巴烟叶的前提下再现哈瓦那的风味。所用烟叶为在尼加拉瓜种植的古巴种源 criollo 与 corojo，按古巴传统工艺处理，每支雪茄以古巴式三层帽收口。

这家公司并不公布为它卷制的工厂名称，本图集也不予杜撰。

较新的各线取希腊名——Achilles、Socrates、Aristoteles、Centauro——以致意创办人的出身。较早的则保留西班牙语：Buenaventura、Selección Privada、Gloria de León。两套名字并存于同一份目录，这也相当准确地道出了这家的性质：头脑是希腊的，意图是古巴的，材料是尼加拉瓜的。',

 'كوريفاري علامة يونانية لسيجار نيكاراغوي. أسّسها أندرياس ثروفالاس، وهو تاجر تجزئة في اليونان، عام 2003 في أوروبا؛ ولم تدخل الولايات المتحدة إلا في 2010.

والمشروع معلَن وصعب: إعادة إنتاج مزاج الهافانا من دون تبغ كوبي. الأوراق كريولو وكوروخو من بذرة كوبية مزروعة في نيكاراغوا، تُعالَج بالطريقة الكوبية التقليدية، ويُختَم كلّ سيجار بغطاء ثلاثيّ على الطراز الكوبي.

ولا تنشر الدار اسم المصنع الذي يلفّ لها، وهذا الأطلس لا يخترع اسمًا.

وتحمل السلاسل الحديثة أسماءً يونانية — أخيل، وسقراط، وأرسطو، وقنطور — تحيّةً لأصل المؤسّس. أمّا الأقدم فتحتفظ بالإسبانية: بوينافينتورا، وسيليكسيون بريفادا، وغلوريا دي ليون. وتتعايش السلسلتان في الكتالوج نفسه، وهو ما يقول جيّدًا ما هي هذه الدار: يونانية الرأس، كوبية القصد، نيكاراغوية المادّة.',

 '[{"name":"Buenaventura","color":"#8B5A2B","force":"Medium","wrapper":"Cuban seed grown in Nicaragua","vitolas":["BV500","BV560","BV560 Torpedo"],"story":"One of the first ranges, and the most widespread. The vitolas are designated by their dimensions rather than by a shape name."},{"name":"Selección Privada","color":"#A0522D","force":"Medium","wrapper":"Cuban seed grown in Nicaragua","vitolas":["Corona","Robusto"],"story":"The creamy, woody register of the catalogue. It is the range in which the house''s Cuban intent is heard most directly."},{"name":"Achilles","color":"#6B4226","force":"Medium-Full","wrapper":"Cuban seed grown in Nicaragua","vitolas":["Mirmidones","Gloriosos","Heroicos","Eternos"],"story":"The Greek series, its vitolas named from the Iliad. The founder is Greek, and he ended up putting it on the bands."}]',

 '[{"name":"Buenaventura","color":"#8B5A2B","force":"Medium","wrapper":"Semilla cubana cultivada en Nicaragua","vitolas":["BV500","BV560","BV560 Torpedo"],"story":"Una de las primeras gamas, y la más extendida. Las vitolas se designan por sus medidas y no por un nombre de forma."},{"name":"Selección Privada","color":"#A0522D","force":"Medium","wrapper":"Semilla cubana cultivada en Nicaragua","vitolas":["Corona","Robusto"],"story":"El registro cremoso y amaderado del catálogo. Es la gama donde la intención cubana de la casa se oye más directamente."},{"name":"Achilles","color":"#6B4226","force":"Medium-Full","wrapper":"Semilla cubana cultivada en Nicaragua","vitolas":["Mirmidones","Gloriosos","Heroicos","Eternos"],"story":"La serie griega, con vitolas nombradas a partir de la Ilíada. El fundador es griego, y acabó poniéndolo en las vitolas."}]',

 '[{"name":"Buenaventura","color":"#8B5A2B","force":"Medium","wrapper":"Kubanische Saat, in Nicaragua angebaut","vitolas":["BV500","BV560","BV560 Torpedo"],"story":"Eine der ersten Linien und die verbreitetste. Die Vitolas werden nach ihren Maßen bezeichnet statt nach einem Formnamen."},{"name":"Selección Privada","color":"#A0522D","force":"Medium","wrapper":"Kubanische Saat, in Nicaragua angebaut","vitolas":["Corona","Robusto"],"story":"Das cremige, holzige Register des Katalogs. In dieser Linie ist die kubanische Absicht des Hauses am unmittelbarsten zu hören."},{"name":"Achilles","color":"#6B4226","force":"Medium-Full","wrapper":"Kubanische Saat, in Nicaragua angebaut","vitolas":["Mirmidones","Gloriosos","Heroicos","Eternos"],"story":"Die griechische Reihe, ihre Vitolas nach der Ilias benannt. Der Gründer ist Grieche, und am Ende stand es auf den Bauchbinden."}]',

 '[{"name":"Buenaventura","color":"#8B5A2B","force":"Medium","wrapper":"在尼加拉瓜种植的古巴种源","vitolas":["BV500","BV560","BV560 Torpedo"],"story":"最初的系列之一，也是流传较广的一条。其尺寸以数据而非形制名称标示。"},{"name":"Selección Privada","color":"#A0522D","force":"Medium","wrapper":"在尼加拉瓜种植的古巴种源","vitolas":["Corona","Robusto"],"story":"目录中奶香与木质的一路。这家对古巴风味的追求，在这条线上听得最直接。"},{"name":"Achilles","color":"#6B4226","force":"Medium-Full","wrapper":"在尼加拉瓜种植的古巴种源","vitolas":["Mirmidones","Gloriosos","Heroicos","Eternos"],"story":"希腊系列，尺寸名称取自《伊利亚特》。创办人是希腊人，最终把这一点写上了标环。"}]',

 '[{"name":"Buenaventura","color":"#8B5A2B","force":"Medium","wrapper":"بذرة كوبية مزروعة في نيكاراغوا","vitolas":["BV500","BV560","BV560 Torpedo"],"story":"من أولى السلاسل وأوسعها انتشارًا. وتُسمّى مقاساتها بأبعادها لا باسم شكل."},{"name":"Selección Privada","color":"#A0522D","force":"Medium","wrapper":"بذرة كوبية مزروعة في نيكاراغوا","vitolas":["Corona","Robusto"],"story":"الطابع الكريمي الخشبي في الكتالوج. وفي هذه السلسلة يُسمع قصد الدار الكوبي على نحو أشدّ مباشرة."},{"name":"Achilles","color":"#6B4226","force":"Medium-Full","wrapper":"بذرة كوبية مزروعة في نيكاراغوا","vitolas":["Mirmidones","Gloriosos","Heroicos","Eternos"],"story":"السلسلة اليونانية، ومقاساتها مسمّاة من الإلياذة. المؤسّس يوناني، وقد انتهى به الأمر إلى وضع ذلك على الأحزمة."}]'),

-- ── Black Label Trading Co. ──────────────────────────────
('Black Label Trading Co.', 'nicaragua', '2013 — James et Angela Brown, Estelí',
 'Fábrica Oveja Negra, Estelí, Nicaragua',

 'Black Label Trading est une maison d''artistes autant que de tabac. James et Angela Brown la fondent au Nicaragua en 2013, et James dessine lui-même toutes les bagues.

En 2015, deux ans après leurs débuts, ils ouvrent leur propre fabrique à Estelí : la Fábrica Oveja Negra — la brebis galeuse. Elle est conçue pour ressembler à un atelier d''artiste plutôt qu''à une chaîne de production, et ce n''est pas une formule publicitaire : le parti pris se voit dans l''échelle et dans le rythme.

Tout est roulé à la main. Les feuilles viennent du Nicaragua, du Honduras, de San Andrés au Mexique et d''Équateur.

Les noms de gammes forment un registre suivi : Last Rites, Bishops Blend, Benediction, Santa Muerte, Salvation, Deliverance, Royalty. C''est une iconographie funèbre et liturgique, tenue jusqu''au bout du dessin — et c''est ce qui distingue cette maison bien avant qu''on ait allumé quoi que ce soit.',

 '[{"name":"Last Rites","color":"#2E2018","force":"Full","wrapper":"Assemblage Oveja Negra","vitolas":["Robusto","Toro","Petit Lancero"],"story":"« Les derniers sacrements » — la gamme fondatrice, et celle qui a donné son ton à toute l''iconographie de la maison. Corsée, roulée à l''Oveja Negra."},{"name":"Salvation","color":"#4A2C1A","force":"Medium-Full","wrapper":"Assemblage Oveja Negra","vitolas":["Robusto","Toro"],"story":"Le pendant du Last Rites, dans le même registre liturgique. Feuilles du Nicaragua, du Honduras, de San Andrés et d''Équateur."},{"name":"Santa Muerte","color":"#3A2A20","force":"Full","wrapper":"Assemblage Oveja Negra","vitolas":["Robusto","Toro"],"story":"La sainte Mort du culte populaire mexicain, dessinée par James Brown lui-même. La maison va au bout de son imagerie plutôt que de la suggérer."}]',

 'Black Label Trading is as much a house of artists as of tobacco. James and Angela Brown founded it in Nicaragua in 2013, and James draws every band himself.

In 2015, two years after they began, they opened their own factory in Estelí: Fábrica Oveja Negra — the black sheep. It is designed to look like an artist''s studio rather than a production line, and that is not an advertising line: the choice shows in the scale and in the pace.

Everything is rolled by hand. The leaves come from Nicaragua, Honduras, San Andrés in Mexico and Ecuador.

The range names form a sustained register: Last Rites, Bishops Blend, Benediction, Santa Muerte, Salvation, Deliverance, Royalty. It is a funerary and liturgical iconography, carried through to the last line of the drawing — and it is what marks this house out long before anything has been lit.',

 'Black Label Trading es tanto una casa de artistas como de tabaco. James y Angela Brown la fundan en Nicaragua en 2013, y James dibuja él mismo todas las vitolas.

En 2015, dos años después de empezar, abren su propia fábrica en Estelí: la Fábrica Oveja Negra. Está concebida para parecer un taller de artista más que una cadena de producción, y no es una fórmula publicitaria: la apuesta se ve en la escala y en el ritmo.

Todo se lía a mano. Las hojas vienen de Nicaragua, Honduras, San Andrés en México y Ecuador.

Los nombres de gama forman un registro sostenido: Last Rites, Bishops Blend, Benediction, Santa Muerte, Salvation, Deliverance, Royalty. Es una iconografía fúnebre y litúrgica, llevada hasta el último trazo del dibujo, y es lo que distingue a esta casa mucho antes de haber encendido nada.',

 'Black Label Trading ist ebenso ein Haus von Künstlern wie von Tabak. James und Angela Brown gründeten es 2013 in Nicaragua, und James zeichnet jede Bauchbinde selbst.

2015, zwei Jahre nach dem Start, eröffneten sie ihre eigene Fabrik in Estelí: die Fábrica Oveja Negra — das schwarze Schaf. Sie ist so angelegt, dass sie eher einem Künstleratelier gleicht als einer Fertigungsstraße, und das ist keine Werbeformel: Die Haltung zeigt sich im Maßstab und im Takt.

Alles wird von Hand gerollt. Die Blätter kommen aus Nicaragua, Honduras, San Andrés in Mexiko und Ecuador.

Die Linienamen bilden ein durchgehaltenes Register: Last Rites, Bishops Blend, Benediction, Santa Muerte, Salvation, Deliverance, Royalty. Eine Grab- und Liturgie-Ikonografie, bis zur letzten Linie der Zeichnung durchgehalten — und sie kennzeichnet dieses Haus, lange bevor irgendetwas angezündet ist.',

 'Black Label Trading 既是烟草之家，也是艺术家之家。James 与 Angela Brown 于 2013 年在尼加拉瓜创办，所有标环均由 James 亲手绘制。

2015 年，创办两年之后，他们在埃斯特利开设了自己的工厂：Fábrica Oveja Negra——「黑羊」。厂房刻意设计得更像艺术家工作室而非生产线，这并非广告辞令：这一取向在规模与节奏上都看得见。

一切均为手工卷制。烟叶来自尼加拉瓜、洪都拉斯、墨西哥圣安德烈斯与厄瓜多尔。

各系列名字构成一套连贯的语汇：Last Rites、Bishops Blend、Benediction、Santa Muerte、Salvation、Deliverance、Royalty。这是一套丧葬与礼拜的图像学，贯彻到画面的最后一笔——而这正是这家在点燃任何东西之前就已辨识出的特征。',

 'بلاك ليبل تريدنغ دار فنّانين بقدر ما هي دار تبغ. أسّسها جيمس وأنجيلا براون في نيكاراغوا عام 2013، ويرسم جيمس كلّ الأحزمة بنفسه.

وفي 2015، بعد عامين من البداية، افتتحا مصنعهما الخاص في إستيلي: «فابريكا أوبيخا نيغرا» — الخروف الأسود. وقد صُمّم ليشبه مرسم فنّان لا خطّ إنتاج، وليست تلك عبارة دعائية: فالخيار يُرى في الحجم وفي الإيقاع.

ويُلَفّ كلّ شيء باليد. وتأتي الأوراق من نيكاراغوا وهندوراس وسان أندريس في المكسيك والإكوادور.

وتشكّل أسماء السلاسل سجلًّا متّصلًا: لاست رايتس، وبيشوبس بلند، وبينيدكشن، وسانتا مويرتي، وسالفيشن، وديليفرنس، ورويالتي. إنّها أيقونوغرافيا جنائزية وطقسية، مُتابَعة حتى آخر خطّ في الرسم — وهي ما يميّز هذه الدار قبل أن يُشعَل أيّ شيء بوقت طويل.',

 '[{"name":"Last Rites","color":"#2E2018","force":"Full","wrapper":"Oveja Negra blend","vitolas":["Robusto","Toro","Petit Lancero"],"story":"\\"The last rites\\" — the founding range, and the one that set the tone for the whole of the house''s iconography. Full-bodied, rolled at Oveja Negra."},{"name":"Salvation","color":"#4A2C1A","force":"Medium-Full","wrapper":"Oveja Negra blend","vitolas":["Robusto","Toro"],"story":"The counterpart to Last Rites, in the same liturgical register. Leaves from Nicaragua, Honduras, San Andrés and Ecuador."},{"name":"Santa Muerte","color":"#3A2A20","force":"Full","wrapper":"Oveja Negra blend","vitolas":["Robusto","Toro"],"story":"The Holy Death of Mexican popular devotion, drawn by James Brown himself. The house carries its imagery through rather than merely hinting at it."}]',

 '[{"name":"Last Rites","color":"#2E2018","force":"Full","wrapper":"Ligada Oveja Negra","vitolas":["Robusto","Toro","Petit Lancero"],"story":"«Los últimos sacramentos»: la gama fundadora, y la que dio el tono a toda la iconografía de la casa. Fuerte, liada en la Oveja Negra."},{"name":"Salvation","color":"#4A2C1A","force":"Medium-Full","wrapper":"Ligada Oveja Negra","vitolas":["Robusto","Toro"],"story":"El contrapunto del Last Rites, en el mismo registro litúrgico. Hojas de Nicaragua, Honduras, San Andrés y Ecuador."},{"name":"Santa Muerte","color":"#3A2A20","force":"Full","wrapper":"Ligada Oveja Negra","vitolas":["Robusto","Toro"],"story":"La Santa Muerte de la devoción popular mexicana, dibujada por el propio James Brown. La casa lleva su imaginería hasta el final en vez de solo sugerirla."}]',

 '[{"name":"Last Rites","color":"#2E2018","force":"Full","wrapper":"Oveja-Negra-Mischung","vitolas":["Robusto","Toro","Petit Lancero"],"story":"\\"Die Sterbesakramente\\" — die Gründungslinie und diejenige, die den Ton der gesamten Bildsprache des Hauses vorgab. Kräftig, in der Oveja Negra gerollt."},{"name":"Salvation","color":"#4A2C1A","force":"Medium-Full","wrapper":"Oveja-Negra-Mischung","vitolas":["Robusto","Toro"],"story":"Das Gegenstück zur Last Rites, im selben liturgischen Register. Blätter aus Nicaragua, Honduras, San Andrés und Ecuador."},{"name":"Santa Muerte","color":"#3A2A20","force":"Full","wrapper":"Oveja-Negra-Mischung","vitolas":["Robusto","Toro"],"story":"Der Heilige Tod der mexikanischen Volksfrömmigkeit, von James Brown selbst gezeichnet. Das Haus führt seine Bildsprache zu Ende, statt sie nur anzudeuten."}]',

 '[{"name":"Last Rites","color":"#2E2018","force":"Full","wrapper":"Oveja Negra 配方","vitolas":["Robusto","Toro","Petit Lancero"],"story":"「临终圣事」——奠基之作，也为这家的整套图像学定下了基调。浓烈，于 Oveja Negra 卷制。"},{"name":"Salvation","color":"#4A2C1A","force":"Medium-Full","wrapper":"Oveja Negra 配方","vitolas":["Robusto","Toro"],"story":"Last Rites 的对照款，属同一套礼拜语汇。烟叶来自尼加拉瓜、洪都拉斯、圣安德烈斯与厄瓜多尔。"},{"name":"Santa Muerte","color":"#3A2A20","force":"Full","wrapper":"Oveja Negra 配方","vitolas":["Robusto","Toro"],"story":"墨西哥民间信仰中的「圣死神」，由 James Brown 亲手绘制。这家把自己的图像学做到底，而非仅止于暗示。"}]',

 '[{"name":"Last Rites","color":"#2E2018","force":"Full","wrapper":"مزيج أوبيخا نيغرا","vitolas":["Robusto","Toro","Petit Lancero"],"story":"«الطقوس الأخيرة» — السلسلة المؤسِّسة، وهي التي أعطت نبرتها لكامل أيقونوغرافيا الدار. قويّة، وملفوفة في أوبيخا نيغرا."},{"name":"Salvation","color":"#4A2C1A","force":"Medium-Full","wrapper":"مزيج أوبيخا نيغرا","vitolas":["Robusto","Toro"],"story":"نظيرة «لاست رايتس»، في السجلّ الطقسي نفسه. أوراق من نيكاراغوا وهندوراس وسان أندريس والإكوادور."},{"name":"Santa Muerte","color":"#3A2A20","force":"Full","wrapper":"مزيج أوبيخا نيغرا","vitolas":["Robusto","Toro"],"story":"«الموت المقدّس» في التديّن الشعبي المكسيكي، من رسم جيمس براون نفسه. تمضي الدار بصورها إلى منتهاها بدل الاكتفاء بالتلميح."}]'),

-- ── Padilla ──────────────────────────────────────────────
('Padilla', 'usa', '2003 — Miami ; Ernesto Padilla',
 'El Titan de Bronze, Little Havana, Miami ; aussi Raíces Cubanas (Honduras) et A.J. Fernández (Nicaragua)',

 'Padilla est un hommage à un poète. Ernesto Padilla crée la marque à Miami, fin 2003, pour son père : Heberto Padilla, dont l''arrestation et la rétractation forcée en 1971 sont restées dans l''histoire cubaine sous le nom d''affaire Padilla, et ont marqué la rupture d''une partie des intellectuels de gauche avec le régime.

La famille venait de Pinar del Río, où elle possédait des terres et cultivait le tabac. Le nom sur la bague n''est donc pas un choix commercial : c''est celui du père, et le tabac est l''autre héritage.

C''est pourquoi cette fiche est américaine et non nicaraguayenne. Le Padilla Miami, gamme emblématique de la maison, est roulé à El Titan de Bronze, dans la Petite Havane — l''atelier de Calle Ocho que cet atlas porte déjà, où des torcedores cubains travaillent en petit nombre. Le tabac, lui, est nicaraguayen, cultivé par Aganorsa : l''atlas classe par le lieu où le cigare est FAIT, pas par l''origine de la feuille.

La production est répartie. D''autres gammes viennent de la Fábrica de Tabacos Raíces Cubanas, au Honduras, et le Padilla Habano de la Tabacalera A.J. Fernández, au Nicaragua. Cette fiche est américaine par son centre, pas par la totalité de ses ateliers, et elle le dit.',

 '[{"name":"Padilla Miami","color":"#8B0000","force":"Full","wrapper":"Habano d''Équateur","vitolas":["Robusto","Toro","Torpedo","Segundo"],"story":"La gamme emblématique, roulée à El Titan de Bronze dans la Petite Havane. Cape Habano d''Équateur sur un assemblage nicaraguayen cultivé par Aganorsa."},{"name":"Padilla Signature 1932","color":"#4A2C1A","force":"Medium-Full","wrapper":"Assemblage Padilla","vitolas":["Robusto","Toro"],"story":"L''année est celle de la naissance d''Heberto Padilla, le poète. La gamme fait partie de celles dont la production a été rapatriée à Miami."},{"name":"Padilla Habano","color":"#6B4226","force":"Medium-Full","wrapper":"Habano","vitolas":["Robusto","Toro"],"story":"Celle qui vient du Nicaragua, roulée à la Tabacalera A.J. Fernández. La maison ne travaille pas dans un seul atelier, et sa fiche ne le laisse pas croire."}]',

 'Padilla is a tribute to a poet. Ernesto Padilla created the brand in Miami, at the end of 2003, for his father: Heberto Padilla, whose arrest and forced recantation in 1971 entered Cuban history as the Padilla affair, and marked the break of part of the international left with the regime.

The family came from Pinar del Río, where it owned land and grew tobacco. The name on the band is therefore not a commercial choice: it is the father''s, and tobacco is the other inheritance.

That is why this entry is American and not Nicaraguan. Padilla Miami, the house''s emblematic range, is rolled at El Titan de Bronze, in Little Havana — the Calle Ocho workshop this atlas already holds, where Cuban torcedores work in small numbers. The tobacco is Nicaraguan, grown by Aganorsa: this atlas files by where the cigar is MADE, not by where the leaf comes from.

Production is spread. Other ranges come from Fábrica de Tabacos Raíces Cubanas, in Honduras, and Padilla Habano from Tabacalera A.J. Fernández, in Nicaragua. This entry is American by its centre, not by the whole of its workshops, and it says so.',

 'Padilla es un homenaje a un poeta. Ernesto Padilla crea la marca en Miami, a finales de 2003, para su padre: Heberto Padilla, cuya detención y retractación forzada en 1971 quedaron en la historia cubana con el nombre de caso Padilla, y marcaron la ruptura de parte de la izquierda internacional con el régimen.

La familia venía de Pinar del Río, donde poseía tierras y cultivaba tabaco. El nombre de la vitola no es, pues, una elección comercial: es el del padre, y el tabaco es la otra herencia.

Por eso esta ficha es estadounidense y no nicaragüense. El Padilla Miami, gama emblemática de la casa, se lía en El Titan de Bronze, en la Pequeña Habana: el taller de la Calle Ocho que este atlas ya recoge, donde trabajan unos pocos torcedores cubanos. El tabaco es nicaragüense, cultivado por Aganorsa: el atlas clasifica por el lugar donde el puro se HACE, no por el origen de la hoja.

La producción está repartida. Otras gamas vienen de la Fábrica de Tabacos Raíces Cubanas, en Honduras, y el Padilla Habano de la Tabacalera A.J. Fernández, en Nicaragua. Esta ficha es estadounidense por su centro, no por la totalidad de sus talleres, y lo dice.',

 'Padilla ist eine Hommage an einen Dichter. Ernesto Padilla schuf die Marke Ende 2003 in Miami für seinen Vater: Heberto Padilla, dessen Verhaftung und erzwungener Widerruf 1971 als Padilla-Affäre in die kubanische Geschichte eingingen und den Bruch eines Teils der internationalen Linken mit dem Regime markierten.

Die Familie kam aus Pinar del Río, wo sie Land besaß und Tabak anbaute. Der Name auf der Bauchbinde ist also keine kaufmännische Wahl: Es ist der des Vaters, und der Tabak ist das andere Erbe.

Deshalb steht dieser Eintrag unter den Vereinigten Staaten und nicht unter Nicaragua. Padilla Miami, die Vorzeigelinie des Hauses, wird bei El Titan de Bronze in Little Havana gerollt — der Werkstatt an der Calle Ocho, die dieser Atlas bereits führt, wo kubanische Torcedores in kleiner Zahl arbeiten. Der Tabak ist nicaraguanisch, von Aganorsa angebaut: Der Atlas ordnet nach dem Ort ein, an dem die Zigarre GEMACHT wird, nicht nach der Herkunft des Blattes.

Die Produktion ist verteilt. Andere Linien kommen aus der Fábrica de Tabacos Raíces Cubanas in Honduras, die Padilla Habano aus der Tabacalera A.J. Fernández in Nicaragua. Dieser Eintrag ist amerikanisch durch sein Zentrum, nicht durch die Gesamtheit seiner Werkstätten, und er sagt es.',

 'Padilla 是献给一位诗人的致敬。Ernesto Padilla 于 2003 年底在迈阿密创立这个品牌，献给他的父亲 Heberto Padilla——1971 年他的被捕与被迫检讨，以「帕迪利亚事件」之名载入古巴历史，也标志着国际左翼中一部分人与该政权的决裂。

家族来自比那尔德里奥，在那里拥有土地并种植烟草。因此标环上的名字并非商业选择：那是父亲的名字，而烟草是另一份遗产。

这正是本条目归入美国而非尼加拉瓜的原因。这家的代表作 Padilla Miami 在小哈瓦那的 El Titan de Bronze 卷制——本图集已收录的那家第八街作坊，只有为数不多的古巴卷烟师在此工作。烟叶则是尼加拉瓜的，由 Aganorsa 种植：本图集按雪茄的**制作地**归类，而非按烟叶的产地。

生产是分散的。其他系列来自洪都拉斯的 Fábrica de Tabacos Raíces Cubanas，Padilla Habano 则出自尼加拉瓜的 Tabacalera A.J. Fernández。本条目属美国，是就其重心而言，而非就其全部作坊而言——这一点它明说。',

 'باديّا تحيّة لشاعر. أنشأ إرنستو باديّا العلامة في ميامي أواخر 2003 إكرامًا لأبيه: إيبرتو باديّا، الذي دخل اعتقاله وتراجعه القسري عام 1971 تاريخَ كوبا باسم «قضية باديّا»، وكان علامةً على قطيعة جزء من اليسار العالمي مع النظام.

جاءت العائلة من بينار دل ريو، حيث كانت تملك أرضًا وتزرع التبغ. فالاسم على الحزام ليس خيارًا تجاريًا: إنّه اسم الأب، والتبغ هو الميراث الآخر.

ولهذا صُنّفت هذه البطاقة أمريكية لا نيكاراغوية. فسلسلة «باديّا ميامي»، وهي واجهة الدار، تُلَفّ في «إل تيتان دي برونثي» بهافانا الصغيرة — ورشة شارع كايي أوتشو التي يضمّها هذا الأطلس، حيث يعمل عدد قليل من اللافّين الكوبيين. أمّا التبغ فنيكاراغوي تزرعه أغانورسا: والأطلس يصنّف بالمكان الذي يُصنع فيه السيجار، لا بمنشأ الورقة.

والإنتاج موزّع. فسلاسل أخرى تأتي من «فابريكا دي تاباكوس رايسِس كوبانا» في هندوراس، و«باديّا هابانو» من تاباكاليرا أ. ج. فرنانديز في نيكاراغوا. هذه البطاقة أمريكية بمركزها لا بمجموع ورشها، وهي تقول ذلك.',

 '[{"name":"Padilla Miami","color":"#8B0000","force":"Full","wrapper":"Ecuadorian Habano","vitolas":["Robusto","Toro","Torpedo","Segundo"],"story":"The emblematic range, rolled at El Titan de Bronze in Little Havana. Ecuadorian Habano wrapper over a Nicaraguan blend grown by Aganorsa."},{"name":"Padilla Signature 1932","color":"#4A2C1A","force":"Medium-Full","wrapper":"Padilla blend","vitolas":["Robusto","Toro"],"story":"The year is that of the birth of Heberto Padilla, the poet. It is among the ranges whose production was brought back to Miami."},{"name":"Padilla Habano","color":"#6B4226","force":"Medium-Full","wrapper":"Habano","vitolas":["Robusto","Toro"],"story":"The one that comes from Nicaragua, rolled at Tabacalera A.J. Fernández. The house does not work in a single workshop, and its entry does not pretend otherwise."}]',

 '[{"name":"Padilla Miami","color":"#8B0000","force":"Full","wrapper":"Habano de Ecuador","vitolas":["Robusto","Toro","Torpedo","Segundo"],"story":"La gama emblemática, liada en El Titan de Bronze, en la Pequeña Habana. Capa Habano de Ecuador sobre una ligada nicaragüense cultivada por Aganorsa."},{"name":"Padilla Signature 1932","color":"#4A2C1A","force":"Medium-Full","wrapper":"Ligada Padilla","vitolas":["Robusto","Toro"],"story":"El año es el del nacimiento de Heberto Padilla, el poeta. Es una de las gamas cuya producción se repatrió a Miami."},{"name":"Padilla Habano","color":"#6B4226","force":"Medium-Full","wrapper":"Habano","vitolas":["Robusto","Toro"],"story":"La que viene de Nicaragua, liada en la Tabacalera A.J. Fernández. La casa no trabaja en un solo taller, y su ficha no lo deja creer."}]',

 '[{"name":"Padilla Miami","color":"#8B0000","force":"Full","wrapper":"Habano aus Ecuador","vitolas":["Robusto","Toro","Torpedo","Segundo"],"story":"Die Vorzeigelinie, bei El Titan de Bronze in Little Havana gerollt. Ecuadorianisches Habano-Deckblatt über einer von Aganorsa angebauten nicaraguanischen Mischung."},{"name":"Padilla Signature 1932","color":"#4A2C1A","force":"Medium-Full","wrapper":"Padilla-Mischung","vitolas":["Robusto","Toro"],"story":"Das Jahr ist das der Geburt des Dichters Heberto Padilla. Die Linie gehört zu denen, deren Produktion nach Miami zurückgeholt wurde."},{"name":"Padilla Habano","color":"#6B4226","force":"Medium-Full","wrapper":"Habano","vitolas":["Robusto","Toro"],"story":"Die aus Nicaragua, in der Tabacalera A.J. Fernández gerollt. Das Haus arbeitet nicht in einer einzigen Werkstatt, und sein Eintrag lässt nichts anderes glauben."}]',

 '[{"name":"Padilla Miami","color":"#8B0000","force":"Full","wrapper":"厄瓜多尔 Habano","vitolas":["Robusto","Toro","Torpedo","Segundo"],"story":"代表性系列，在小哈瓦那的 El Titan de Bronze 卷制。厄瓜多尔 Habano 茄衣，内里为 Aganorsa 种植的尼加拉瓜配方。"},{"name":"Padilla Signature 1932","color":"#4A2C1A","force":"Medium-Full","wrapper":"Padilla 配方","vitolas":["Robusto","Toro"],"story":"这个年份是诗人 Heberto Padilla 的出生之年。它属于生产被迁回迈阿密的那几条线之一。"},{"name":"Padilla Habano","color":"#6B4226","force":"Medium-Full","wrapper":"Habano","vitolas":["Robusto","Toro"],"story":"来自尼加拉瓜的一条，在 Tabacalera A.J. Fernández 卷制。这家并非只在一间作坊工作，其条目也不作此暗示。"}]',

 '[{"name":"Padilla Miami","color":"#8B0000","force":"Full","wrapper":"هابانو إكوادوري","vitolas":["Robusto","Toro","Torpedo","Segundo"],"story":"السلسلة الواجهة، تُلَفّ في «إل تيتان دي برونثي» بهافانا الصغيرة. غلاف هابانو إكوادوري فوق مزيج نيكاراغوي تزرعه أغانورسا."},{"name":"Padilla Signature 1932","color":"#4A2C1A","force":"Medium-Full","wrapper":"مزيج باديّا","vitolas":["Robusto","Toro"],"story":"السنة هي سنة مولد الشاعر إيبرتو باديّا. وهي من السلاسل التي أُعيد إنتاجها إلى ميامي."},{"name":"Padilla Habano","color":"#6B4226","force":"Medium-Full","wrapper":"هابانو","vitolas":["Robusto","Toro"],"story":"تلك الآتية من نيكاراغوا، ملفوفة في تاباكاليرا أ. ج. فرنانديز. الدار لا تعمل في ورشة واحدة، وبطاقتها لا توهم بغير ذلك."}]');

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
 WHERE b.`name` IN ('Southern Draw','HVC Cigars','Fratello','Curivari',
                    'Black Label Trading Co.','Padilla')
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 188','systeme','scene_boutique_second_lot','marque',0,
   'Six maisons ajoutees : Southern Draw (Robert et Sharon Holt, 2014), HVC Cigars (Reinier Lorenzo, 2011), Fratello (Omar de Frias, 2013), Curivari (Andreas Throuvalas, 2003), Black Label Trading Co. (James et Angela Brown, 2013) et Padilla (Ernesto Padilla, 2003)'),
  (NULL,'migration 188','systeme','regle_187_appliquee_avant_ecriture','marque',0,
   'LES SIX ONT ETE VERIFIEES ROULEES MAIN AVANT D ETRE ECRITES. La regle de la migration 187 — aucun cigare de machine — s applique d abord a ce qu on ajoute, pas seulement a ce qu on retire. Black Label Trading declare « 100% handmade » ; HVC « traditional hand-made cigar methods » ; Curivari le procede cubain traditionnel et la triple coiffe. Aucune des six ne fait de cigarillo'),
  (NULL,'migration 188','systeme','padilla_est_americaine','marque',0,
   'LE RECENSEMENT CLASSAIT PADILLA AU NICARAGUA. La verification dit autre chose : le Padilla Miami, gamme emblematique, est roule a EL TITAN DE BRONZE dans la Petite Havane — l atelier de Calle Ocho que l atlas porte deja sous usa. Le tabac est nicaraguayen, cultive par Aganorsa, mais l atlas classe par le lieu ou le cigare est FAIT : regle de Casdagli, de Diamond Crown et de Nicoya. D autres gammes viennent de Raices Cubanas au Honduras et d A.J. Fernandez au Nicaragua, et la fiche l ecrit comme celle de Room101'),
  (NULL,'migration 188','systeme','deux_maisons_ont_fini_par_avoir_des_murs','marque',0,
   'LA MIGRATION 185 MONTRAIT CINQ MAISONS SUR SIX SANS USINE ; CELLE-CI MONTRE LA SUITE. HVC a ouvert sa propre fabrique a Esteli en 2021 apres dix ans passes chez Aganorsa, et produit aujourd hui pres d un million de cigares par an ; Black Label Trading a ouvert la Fabrica Oveja Negra en 2015, deux ans apres ses debuts. Le modele sans usine n est pas toujours un etat definitif — c est parfois une etape. Southern Draw est le cas inverse : elle ne fait rouler que chez A.J. Fernandez, UN SEUL atelier, quand Crowned Heads, Dunbarton et Room101 en emploient chacune plusieurs'),
  (NULL,'migration 188','systeme','notes_de_presse_ecartees','marque',0,
   'Le Buenaventura de Curivari et plusieurs Southern Draw portent des notes de Cigar Aficionado ; aucune n entre ici faute de source_url — regle de marques_check appliquee depuis El Sitio (182). Et « la seule marque boutique fabriquee exclusivement chez A.J. Fernandez » n est pas repris : c est un rang, pas un fait');

-- ════════════════════════════════════════════════════════
-- LES DEUX TABLEAUX DE PAYS, EN TOUTES LETTRES
-- ════════════════════════════════════════════════════════
-- nicaragua : 28 → 33 entrées
UPDATE `producer_countries`
   SET `brands` = '[{"desc":"Référence absolue du Nicaragua premium","name":"Padrón","iconic":true},{"desc":"Pepin Garcia, maître torcedor légendaire","name":"My Father","iconic":true},{"desc":"Serie V mondialement reconnue","name":"Oliva","iconic":true},{"desc":"Liga Privada, révolution moderne","name":"Drew Estate","iconic":true},{"desc":"Plus grand producteur familial","name":"Plasencia","iconic":false},{"desc":"Élégance et puissance fusionnées","name":"Rocky Patel","iconic":false},{"desc":"Maître du Connecticut nicaraguayen","name":"Perdomo","iconic":false},{"desc":"Plus ancienne manufacture du pays","name":"Joya de Nicaragua","iconic":false},{"desc":"Le mélange privé de Jonathan Drew, devenu culte","name":"Liga Privada","iconic":false},{"desc":"Maison suisse de 1888, roulée à Estelí","name":"Villiger","iconic":false},{"desc":"Le rouleur que les autres marques employaient sans le nommer","name":"A.J. Fernandez","iconic":true},{"desc":"D''abord un planteur de Jalapa, ensuite une marque","name":"Aganorsa Leaf","iconic":true},{"desc":"La grammaire cubaine, la matière nicaraguayenne","name":"Tatuaje","iconic":false},{"desc":"Celle qui a rendu le petit format respectable","name":"Illusione","iconic":false},{"desc":"Un cigare ancré dans une culture, pas seulement un terroir","name":"Foundation Cigar Company","iconic":false},{"desc":"Granada plutôt qu''Estelí, et l''atelier ouvert aux visiteurs","name":"Mombacho","iconic":false},{"desc":"Une marque qui s''est offert sa propre manufacture","name":"Espinosa","iconic":true},{"desc":"Pas d''usine : elle choisit son rouleur selon l''assemblage","name":"Crowned Heads","iconic":true},{"desc":"Des noms cubains d''avant 1960, des assemblages d''aujourd''hui","name":"Warped","iconic":false},{"desc":"Maison nicaraguayenne, encore peu documentée ici","name":"Capitol","iconic":false},{"desc":"Repris par la famille García en décembre 2019, après quarante-cinq ans chez Quesada","name":"Fonseca Nicaraguayen","iconic":false},{"name":"Nicoya","desc":"Maison australienne roulée à Estelí — l''Australie ne cultive plus depuis 2006","iconic":false},{"name":"Dunbarton Tobacco & Trust","desc":"Steve Saka, ex-Drew Estate, parti monter sa maison sans usine","iconic":true},{"name":"RoMa Craft Tobac","desc":"Commencée dans un garage, puis son propre atelier à Estelí","iconic":true},{"name":"Viaje","desc":"Plus de gamme régulière depuis 2012 : rien que des séries limitées","iconic":false},{"name":"Room101","desc":"D''un bijoutier au cigare ; trois manufactures, deux pays","iconic":false},{"name":"L''Atelier","desc":"La seconde maison de Pete Johnson, chez My Father comme Tatuaje","iconic":false},{"name":"La Aroma de Cuba","desc":"Nom cubain des années 1880, refait par Pepin García en 2009","iconic":false},{"name":"Southern Draw","desc":"Robert et Sharon Holt — un seul atelier, ce qui est rare","iconic":false},{"name":"HVC Cigars","desc":"Havana City ; dix ans sans usine, puis la sienne en 2021","iconic":true},{"name":"Fratello","desc":"Un ingénieur de la NASA passé au cigare","iconic":false},{"name":"Curivari","desc":"Grecque de tête, cubaine d''intention, nicaraguayenne de matière","iconic":false},{"name":"Black Label Trading Co.","desc":"Une fabrique conçue comme un atelier d''artiste","iconic":false}]',
       `updated_at` = NOW()
 WHERE `id` = 'nicaragua';

-- usa : 10 → 11 entrées
UPDATE `producer_countries`
   SET `brands` = '[{"desc":"Macanudo, Punch, Partagás HN","name":"General Cigar","iconic":true},{"desc":"100% US tobacco","name":"CAO America","iconic":false},{"desc":"L''homonyme américaine, née de l''embargo","name":"Cohiba USA","iconic":false},{"desc":"La version américaine, chez General Cigar","name":"Partagás USA","iconic":false},{"desc":"L''américaine d''Altadis, depuis 1969","name":"Romeo y Julieta USA","iconic":false},{"desc":"1895, le plus ancien fabricant familial américain","name":"J.C. Newman","iconic":true},{"desc":"Ce qui reste des ateliers cubains de Miami","name":"El Titan de Bronze","iconic":true},{"desc":"1930, une adresse de la Cinquième Avenue devenue marque","name":"Nat Sherman","iconic":true},{"desc":"La maison d''origine a récupéré son nom en 2001, puis l''a vendu à Altadis","name":"Trinidad USA","iconic":false},{"name":"Forged Cigar Company","desc":"Société de distribution de Scandinavian Tobacco Group","iconic":false},{"name":"Padilla","desc":"L''hommage d''un fils au poète Heberto Padilla, roulé Calle Ocho","iconic":true}]',
       `updated_at` = NOW()
 WHERE `id` = 'usa';

