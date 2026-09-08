-- ════════════════════════════════════════════════════════
-- 190 — Le cercle Eiroa, et deux ateliers d'Estelí
-- ────────────────────────────────────────────────────────
--   CLE Cigar Company   Christian Eiroa, 2012        honduras
--   Asylum              Lazuka et Eiroa, 2012        nicaragua
--   Oscar Valladares    Danlí, 2012                  honduras
--   Micallef            Al Micallef, 2016            nicaragua
--
-- Quatre fiches, pas six : Don Tomas, HPC et 777 n'ont pas été assez
-- documentées pour être écrites. Mieux vaut quatre fiches sourcées que
-- six dont deux tiennent sur des pages de détaillants.
--
-- ── LA CONSIGNE « QUI FAIT QUOI », APPLIQUÉE À FOND ─────
-- Ce lot est celui où elle rend le plus, parce que les quatre maisons
-- ne sont pas isolées : elles forment des chaînes de personnes, et
-- chaque maillon a déjà sa fiche dans cet atlas.
--
--   LE CERCLE EIROA, sur trois générations
--     Generoso J. Eiroa   d'Espagne à Cuba ; ferme de 28 hectares
--                         à Pinar del Río
--     Julio Eiroa         travaille avec Angel Oliva, fonde sa ferme
--                         dans la vallée de Jamastran ; c'est lui
--                         d'ALADINO, que l'atlas porte
--     Christian Eiroa     possède CAMACHO avec son père et la VEND À
--                         DAVIDOFF EN 2008 — Camacho et Oettinger
--                         Davidoff sont dans l'atlas ; fonde CLE en
--                         juillet 2012, et Asylum avec Tom Lazuka
--
--   LA CHAÎNE MICALLEF, sur trois générations aussi
--     Pedro F. Gómez      roulait chez H. UPMANN, à La Havane
--     sa belle-fille      travaillait chez PARTAGÁS
--     Joel et Edel        ses petits-fils ; ils tiennent aujourd'hui
--                         la fabrique 1934 à Estelí
--   H. Upmann et Partagás sont l'un et l'autre dans cet atlas.
--
--   L'ÉQUIPE VALLADARES, formée ailleurs
--     Oscar Valladares    neuf ans chez ROCKY PATEL
--     Bayron Duarte       vingt ans cumulés chez GENERAL CIGAR et OLIVA
--   Les trois maisons sont dans l'atlas.
--
-- ── ⚠ DEUX CORRECTIONS DE PLUS AU RECENSEMENT ───────────
-- `docs/maisons-absentes.md` classait Asylum ET Micallef au Honduras.
-- Les deux sont fausses :
--
--   Asylum    sort PRINCIPALEMENT de la NACSA, à Estelí (Nicaragua),
--             le reste de la fabrique Aladino à Danlí (Honduras)
--   Micallef  est faite à la fabrique 1934 de la famille Gómez Sánchez,
--             à Estelí. Le Honduras n'apparaît que dans la TRIPE
--
-- C'est la QUATRIÈME et la CINQUIÈME fois que le recensement se trompe
-- de pays, après Nicoya (183), La Palina (186/189) et Padilla (188). Le
-- motif ne varie pas : la nationalité ou le domicile du fondateur pris
-- pour le lieu de fabrication. Le document porte désormais cet
-- avertissement en tête de sa méthode.
--
-- ── ET UNE DATE CORRIGÉE ────────────────────────────────
-- Le recensement donnait Oscar Valladares en 2013 ; c'est 2012.
-- Comme pour Southern Draw à la migration 188, où il disait 2015 pour
-- 2014.
--
-- ⚠ LES QUATRE SONT ROULÉES MAIN — vérifié avant écriture, règle 187.
--
-- Sources : cigarjournal.com « Christian Eiroa: The Corojo King »
-- (les trois générations, la vente de Camacho en 2008, CLE en juillet
-- 2012, Asylum avec Tom Lazuka), cigaraficionado.com « CLE Cigar Co. »
-- et famous-smoke.com (le partage NACSA / Aladino, l'ancien cinéma du
-- grand-père), jrcigars.com et cigars.com (Oscar Valladares : 2012,
-- Danlí, Hector Valladares et Bayron Duarte, les parcours chez Rocky
-- Patel, General Cigar et Oliva, le Leaf by Oscar), micallefcigars.com
-- et cigaraficionado.com « Texas Businessman Sets His Sights On
-- Cigars » (Al Micallef, les frères Gómez Sánchez, la fabrique 1934,
-- les assemblages Leyenda et Reserva Limitada Privada).
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

-- ── CLE Cigar Company ────────────────────────────────────
('CLE Cigar Company', 'honduras', '2012 — Christian Eiroa, Danlí, Honduras',
 'Fabrique CLE, Danlí, Honduras ; bureaux à Danlí, Estelí et Miami',

 'CLE, ce sont trois initiales : Christian Luis Eiroa. Il fonde la maison en juillet 2012, et il n''arrive pas dans le métier — il y revient.

Son grand-père, Generoso J. Eiroa, quitte l''Espagne pour Cuba et y possède une ferme de tabac à Pinar del Río. Son père, Julio Eiroa, travaille avec Angel Oliva puis fonde sa propre ferme dans la vallée de Jamastran, au Honduras — c''est lui qui fait l''Aladino, que cet atlas porte. Christian naît à Danlí.

Père et fils possédaient Camacho. Ils la vendent au groupe Davidoff en 2008 : les deux maisons sont dans cet atlas, et c''est la même histoire vue des deux bouts. Christian passe quatre ans hors du métier avant de revenir sous son propre nom.

CLE roule à Danlí, avec des bureaux à Danlí, à Estelí et à Miami. Christian Eiroa a monté en parallèle Asylum avec son ami Tom Lazuka — l''autre moitié du même ensemble, et l''autre fiche de ce lot.',

 '[{"name":"CLE Corojo","color":"#8B4513","force":"Medium-Full","wrapper":"Corojo de la vallée de Jamastran","vitolas":["Robusto","Toro","Corona"],"story":"Le corojo hondurien de la vallée où son père a fondé sa ferme. C''est la variété qui a fait le nom de la famille, et la gamme qui ouvre le catalogue de CLE."},{"name":"CLE Connecticut","color":"#C9A96E","force":"Light-Medium","wrapper":"Connecticut","vitolas":["Robusto","Toro"],"story":"Le versant doux, sous cape Connecticut. Même fabrique de Danlí, un registre plus clair — le contrepoint du Corojo."},{"name":"Eiroa","color":"#6B4226","force":"Medium-Full","wrapper":"Corojo du Honduras","vitolas":["Robusto","Toro","Prensado"],"story":"La gamme qui porte le nom de famille plutôt que les initiales. Tabac hondurien de bout en bout, y compris la cape — ce qui est rare, et c''est le sujet."}]',

 'CLE is three initials: Christian Luis Eiroa. He founded the house in July 2012, and he did not arrive in the trade — he returned to it.

His grandfather, Generoso J. Eiroa, left Spain for Cuba and owned a tobacco farm at Pinar del Río. His father, Julio Eiroa, worked with Angel Oliva and then founded his own farm in the Jamastran Valley, in Honduras — he is the man behind Aladino, which this atlas holds. Christian was born in Danlí.

Father and son owned Camacho. They sold it to the Davidoff group in 2008: both houses are in this atlas, and it is the same story seen from either end. Christian spent four years out of the trade before returning under his own name.

CLE rolls at Danlí, with offices in Danlí, Estelí and Miami. Christian Eiroa also set up Asylum alongside his friend Tom Lazuka — the other half of the same set, and the other entry in this batch.',

 'CLE son tres iniciales: Christian Luis Eiroa. Funda la casa en julio de 2012, y no llega al oficio: vuelve a él.

Su abuelo, Generoso J. Eiroa, deja España por Cuba y posee allí una finca de tabaco en Pinar del Río. Su padre, Julio Eiroa, trabaja con Angel Oliva y funda luego su propia finca en el valle de Jamastrán, en Honduras: es él quien hace el Aladino, que este atlas recoge. Christian nace en Danlí.

Padre e hijo poseían Camacho. La venden al grupo Davidoff en 2008: las dos casas están en este atlas, y es la misma historia vista por los dos extremos. Christian pasa cuatro años fuera del oficio antes de volver con su propio nombre.

CLE lía en Danlí, con oficinas en Danlí, Estelí y Miami. Christian Eiroa montó en paralelo Asylum con su amigo Tom Lazuka: la otra mitad del mismo conjunto, y la otra ficha de este lote.',

 'CLE sind drei Initialen: Christian Luis Eiroa. Er gründete das Haus im Juli 2012, und er kam nicht ins Gewerbe — er kehrte dorthin zurück.

Sein Großvater, Generoso J. Eiroa, verließ Spanien Richtung Kuba und besaß dort eine Tabakfarm in Pinar del Río. Sein Vater, Julio Eiroa, arbeitete mit Angel Oliva und gründete dann seine eigene Farm im Jamastran-Tal in Honduras — er ist der Mann hinter Aladino, das dieser Atlas führt. Christian wurde in Danlí geboren.

Vater und Sohn besaßen Camacho. Sie verkauften sie 2008 an die Davidoff-Gruppe: Beide Häuser stehen in diesem Atlas, und es ist dieselbe Geschichte von beiden Enden aus gesehen. Christian verbrachte vier Jahre außerhalb des Gewerbes, ehe er unter eigenem Namen zurückkam.

CLE rollt in Danlí, mit Büros in Danlí, Estelí und Miami. Christian Eiroa baute daneben mit seinem Freund Tom Lazuka Asylum auf — die andere Hälfte desselben Ganzen, und der andere Eintrag dieser Reihe.',

 'CLE 是三个首字母：Christian Luis Eiroa。他于 2012 年 7 月创办这家公司——他并非初入此行，而是重返此行。

他的祖父 Generoso J. Eiroa 离开西班牙前往古巴，在比那尔德里奥拥有一座烟草农场。他的父亲 Julio Eiroa 曾与 Angel Oliva 共事，后在洪都拉斯的哈马斯特兰谷创办自己的农场——正是他做出了本图集收录的 Aladino。Christian 生于丹利。

父子二人曾拥有 Camacho，并于 2008 年将其售予 Davidoff 集团：两家公司都在本图集之中，这是同一个故事的两端。Christian 离开这一行四年，之后以自己的名字回归。

CLE 在丹利卷制，并在丹利、埃斯特利与迈阿密设有办公室。Christian Eiroa 同时与好友 Tom Lazuka 一起创办了 Asylum——同一整体的另一半，也是本批的另一条目。',

 'CLE ثلاثة أحرف أولى: كريستيان لويس إيروا. أسّس الدار في يوليو 2012، وهو لم يدخل المهنة، بل عاد إليها.

فجدّه جينيروسو ج. إيروا غادر إسبانيا إلى كوبا وامتلك هناك مزرعة تبغ في بينار دل ريو. وأبوه خوليو إيروا عمل مع أنخل أوليفا ثم أسّس مزرعته الخاصة في وادي خاماستران بهندوراس — وهو صاحب «ألادينو» التي يضمّها هذا الأطلس. وُلد كريستيان في دانلي.

وكان الأب والابن يملكان «كاماتشو»، فباعاها لمجموعة دافيدوف عام 2008: والداران كلتاهما في هذا الأطلس، وهي القصة نفسها منظورًا إليها من طرفيها. وقضى كريستيان أربع سنوات خارج المهنة قبل أن يعود باسمه.

تلفّ CLE في دانلي، ولها مكاتب في دانلي وإستيلي وميامي. وقد أنشأ كريستيان إيروا بالتوازي علامة «أسايلم» مع صديقه توم لازوكا — النصف الآخر من المجموعة نفسها، والبطاقة الأخرى في هذه الدفعة.',

 '[{"name":"CLE Corojo","color":"#8B4513","force":"Medium-Full","wrapper":"Jamastran Valley corojo","vitolas":["Robusto","Toro","Corona"],"story":"The Honduran corojo of the valley where his father founded his farm. It is the variety that made the family''s name, and the range that opens CLE''s catalogue."},{"name":"CLE Connecticut","color":"#C9A96E","force":"Light-Medium","wrapper":"Connecticut","vitolas":["Robusto","Toro"],"story":"The mild side, under a Connecticut wrapper. Same Danlí factory, a lighter register — the counterpoint to the Corojo."},{"name":"Eiroa","color":"#6B4226","force":"Medium-Full","wrapper":"Honduran corojo","vitolas":["Robusto","Toro","Prensado"],"story":"The range that carries the family name rather than the initials. Honduran tobacco throughout, wrapper included — which is rare, and which is the point."}]',

 '[{"name":"CLE Corojo","color":"#8B4513","force":"Medium-Full","wrapper":"Corojo del valle de Jamastrán","vitolas":["Robusto","Toro","Corona"],"story":"El corojo hondureño del valle donde su padre fundó su finca. Es la variedad que hizo el nombre de la familia, y la gama que abre el catálogo de CLE."},{"name":"CLE Connecticut","color":"#C9A96E","force":"Light-Medium","wrapper":"Connecticut","vitolas":["Robusto","Toro"],"story":"La vertiente suave, bajo capa Connecticut. Misma fábrica de Danlí, un registro más claro: el contrapunto del Corojo."},{"name":"Eiroa","color":"#6B4226","force":"Medium-Full","wrapper":"Corojo de Honduras","vitolas":["Robusto","Toro","Prensado"],"story":"La gama que lleva el apellido en vez de las iniciales. Tabaco hondureño de principio a fin, capa incluida, lo que es raro y es justamente el asunto."}]',

 '[{"name":"CLE Corojo","color":"#8B4513","force":"Medium-Full","wrapper":"Corojo aus dem Jamastran-Tal","vitolas":["Robusto","Toro","Corona"],"story":"Der honduranische Corojo aus dem Tal, in dem sein Vater seine Farm gründete. Es ist die Sorte, die den Namen der Familie gemacht hat, und die Linie, die den Katalog von CLE eröffnet."},{"name":"CLE Connecticut","color":"#C9A96E","force":"Light-Medium","wrapper":"Connecticut","vitolas":["Robusto","Toro"],"story":"Die milde Seite, unter einem Connecticut-Deckblatt. Dieselbe Fabrik in Danlí, ein helleres Register — der Kontrapunkt zur Corojo."},{"name":"Eiroa","color":"#6B4226","force":"Medium-Full","wrapper":"Honduranischer Corojo","vitolas":["Robusto","Toro","Prensado"],"story":"Die Linie, die den Familiennamen trägt statt der Initialen. Durchweg honduranischer Tabak, Deckblatt eingeschlossen — was selten ist und worum es geht."}]',

 '[{"name":"CLE Corojo","color":"#8B4513","force":"Medium-Full","wrapper":"哈马斯特兰谷 corojo","vitolas":["Robusto","Toro","Corona"],"story":"来自其父创办农场的那座山谷的洪都拉斯 corojo。正是这个品种成就了这个家族的名字，也是 CLE 目录的开篇之作。"},{"name":"CLE Connecticut","color":"#C9A96E","force":"Light-Medium","wrapper":"康涅狄格","vitolas":["Robusto","Toro"],"story":"柔和的一侧，采用康涅狄格茄衣。同一座丹利工厂，风格更浅——是 Corojo 的对位。"},{"name":"Eiroa","color":"#6B4226","force":"Medium-Full","wrapper":"洪都拉斯 corojo","vitolas":["Robusto","Toro","Prensado"],"story":"以姓氏而非首字母命名的一条线。自始至终皆为洪都拉斯烟叶，连茄衣在内——这并不多见，而这正是要点。"}]',

 '[{"name":"CLE Corojo","color":"#8B4513","force":"Medium-Full","wrapper":"كوروخو من وادي خاماستران","vitolas":["Robusto","Toro","Corona"],"story":"الكوروخو الهندوراسي من الوادي الذي أسّس فيه أبوه مزرعته. إنّه الصنف الذي صنع اسم العائلة، والسلسلة التي تفتتح كتالوج CLE."},{"name":"CLE Connecticut","color":"#C9A96E","force":"Light-Medium","wrapper":"كونيتيكت","vitolas":["Robusto","Toro"],"story":"الوجه اللطيف، تحت غلاف كونيتيكت. المصنع نفسه في دانلي، بمزاج أفتح — وهو مقابل الكوروخو."},{"name":"Eiroa","color":"#6B4226","force":"Medium-Full","wrapper":"كوروخو هندوراسي","vitolas":["Robusto","Toro","Prensado"],"story":"السلسلة التي تحمل اسم العائلة بدل الأحرف الأولى. تبغ هندوراسي من أوّله إلى آخره، بما في ذلك الغلاف — وهو أمر نادر، وهو المقصود."}]'),

-- ── Asylum ───────────────────────────────────────────────
('Asylum', 'nicaragua', '2012 — Tom Lazuka et Christian Eiroa',
 'NACSA, Estelí (Nicaragua) principalement ; et la fabrique Aladino, Danlí (Honduras)',

 'Asylum est l''autre moitié de CLE. Tom Lazuka la monte en 2012 avec son ami de longue date Christian Eiroa, la même année où celui-ci fonde CLE sous ses propres initiales.

La production est partagée entre deux pays. L''essentiel sort de la NACSA — Nicaragua American Cigars — à Estelí ; le reste de la fabrique Aladino, à Danlí, au Honduras. Cette fiche est nicaraguayenne parce que l''atlas classe par le lieu principal, et elle écrit le second plutôt que de le taire.

La fabrique de Danlí mérite une phrase à elle seule : c''était un cinéma, et il appartenait au grand-père de Christian Eiroa. Elle a par ailleurs été l''une des premières installations tabacoles certifiées par Bayer CropScience.

La marque s''est fait connaître par les formats démesurés — l''Asylum 13 se décline jusqu''à des diamètres que peu de maisons osent — et par un prix qui ne suit pas cette démesure. C''est un positionnement assumé, à l''opposé du registre patrimonial de CLE, alors que les deux sortent des mêmes mains.',

 '[{"name":"Asylum 13","color":"#4A2C1A","force":"Full","wrapper":"Assemblage nicaraguayen","vitolas":["Robusto","Toro","Sixty","Seventy","Eighty"],"story":"La gamme fondatrice, et celle des formats démesurés : les vitoles portent leur diamètre pour nom, jusqu''au quatre-vingts. Roulée à la NACSA, à Estelí."},{"name":"Asylum Insidious","color":"#6B4226","force":"Medium-Full","wrapper":"Assemblage nicaraguayen","vitolas":["Corona","Robusto","Toro"],"story":"Le versant plus mesuré du catalogue, en formats classiques. Même atelier, même parti pris de prix."},{"name":"Asylum Straight Jacket","color":"#3A2A20","force":"Full","wrapper":"Assemblage nicaraguayen","vitolas":["Robusto","Toro"],"story":"La camisole de force, en toutes lettres. La maison pousse son thème jusqu''au bout des noms, comme Black Label Trading pousse le sien."}]',

 'Asylum is the other half of CLE. Tom Lazuka set it up in 2012 with his long-time friend Christian Eiroa, the same year Eiroa founded CLE under his own initials.

Production is split between two countries. Most comes out of NACSA — Nicaragua American Cigars — in Estelí; the rest from the Aladino factory in Danlí, Honduras. This entry is Nicaraguan because the atlas files by the principal place, and it writes the second rather than hiding it.

The Danlí factory deserves a sentence of its own: it was a cinema, and it belonged to Christian Eiroa''s grandfather. It was also among the first tobacco facilities certified by Bayer CropScience.

The brand made its name through oversized formats — Asylum 13 runs up to ring gauges few houses attempt — and through a price that does not follow that excess. It is a deliberate stance, the opposite of CLE''s heritage register, though both come from the same hands.',

 'Asylum es la otra mitad de CLE. Tom Lazuka la monta en 2012 con su amigo de siempre Christian Eiroa, el mismo año en que este funda CLE con sus propias iniciales.

La producción se reparte entre dos países. Lo esencial sale de NACSA — Nicaragua American Cigars — en Estelí; el resto de la fábrica Aladino, en Danlí, Honduras. Esta ficha es nicaragüense porque el atlas clasifica por el lugar principal, y escribe el segundo en vez de callarlo.

La fábrica de Danlí merece una frase aparte: era un cine, y pertenecía al abuelo de Christian Eiroa. Fue además una de las primeras instalaciones tabaqueras certificadas por Bayer CropScience.

La marca se dio a conocer por los formatos desmesurados — el Asylum 13 llega a cepos que pocas casas se atreven a hacer — y por un precio que no sigue esa desmesura. Es una posición asumida, lo contrario del registro patrimonial de CLE, cuando las dos salen de las mismas manos.',

 'Asylum ist die andere Hälfte von CLE. Tom Lazuka baute sie 2012 mit seinem langjährigen Freund Christian Eiroa auf, im selben Jahr, in dem dieser CLE unter seinen eigenen Initialen gründete.

Die Produktion verteilt sich auf zwei Länder. Das meiste kommt aus der NACSA — Nicaragua American Cigars — in Estelí, der Rest aus der Aladino-Fabrik in Danlí, Honduras. Dieser Eintrag steht unter Nicaragua, weil der Atlas nach dem Hauptort einordnet, und er schreibt den zweiten, statt ihn zu verschweigen.

Die Fabrik in Danlí verdient einen eigenen Satz: Sie war ein Kino, und sie gehörte Christian Eiroas Großvater. Sie war zudem eine der ersten Tabakanlagen mit Zertifizierung durch Bayer CropScience.

Bekannt wurde die Marke durch überdimensionierte Formate — die Asylum 13 reicht bis zu Ringmaßen, die sich wenige Häuser trauen — und durch einen Preis, der dieser Maßlosigkeit nicht folgt. Eine bewusste Haltung, das Gegenteil des Erbe-Registers von CLE, obwohl beide aus denselben Händen kommen.',

 'Asylum 是 CLE 的另一半。Tom Lazuka 于 2012 年与多年好友 Christian Eiroa 一同创办，正是后者以自己首字母创立 CLE 的同一年。

生产分处两国。主体出自埃斯特利的 NACSA（Nicaragua American Cigars），其余来自洪都拉斯丹利的 Aladino 工厂。本条目归入尼加拉瓜，是因为本图集按主要产地归类——而它把另一处写明，而非略去。

丹利那座工厂值得单独一句：它原是一座电影院，属于 Christian Eiroa 的祖父。它也是最早通过拜耳作物科学认证的烟草设施之一。

这个品牌以超大规格出名——Asylum 13 的环径可达少有品牌敢做的尺寸——而价格却并不随之飞涨。这是一种明确的取向，与 CLE 的家族传承气质正相反，尽管两者出自同一双手。',

 '«أسايلم» هي النصف الآخر من CLE. أنشأها توم لازوكا عام 2012 مع صديقه القديم كريستيان إيروا، في السنة نفسها التي أسّس فيها هذا الأخير CLE بأحرفه الأولى.

والإنتاج موزّع على بلدين. فمعظمه يخرج من «ناكسا» — نيكاراغوا أمريكان سيغارز — في إستيلي؛ والباقي من مصنع «ألادينو» في دانلي بهندوراس. وهذه البطاقة نيكاراغوية لأنّ الأطلس يصنّف بالمكان الرئيسي، وهو يكتب الثاني بدل أن يكتمه.

ويستحقّ مصنع دانلي جملةً خاصة به: فقد كان دار سينما، وكان يملكه جدّ كريستيان إيروا. وهو أيضًا من أوائل المنشآت التبغية التي اعتمدتها «باير كروب ساينس».

وقد عُرفت العلامة بمقاساتها المفرطة — إذ يصل «أسايلم 13» إلى أقطار قلّ أن تجرؤ عليها الدور — وبسعر لا يجاري هذا الإفراط. إنّه موقف مقصود، نقيض النبرة التراثية لـCLE، مع أنّ الاثنتين تخرجان من اليدين نفسيهما.',

 '[{"name":"Asylum 13","color":"#4A2C1A","force":"Full","wrapper":"Nicaraguan blend","vitolas":["Robusto","Toro","Sixty","Seventy","Eighty"],"story":"The founding range, and the one of oversized formats: the vitolas take their ring gauge for a name, up to eighty. Rolled at NACSA, in Estelí."},{"name":"Asylum Insidious","color":"#6B4226","force":"Medium-Full","wrapper":"Nicaraguan blend","vitolas":["Corona","Robusto","Toro"],"story":"The more measured side of the catalogue, in classic formats. Same workshop, same stance on price."},{"name":"Asylum Straight Jacket","color":"#3A2A20","force":"Full","wrapper":"Nicaraguan blend","vitolas":["Robusto","Toro"],"story":"The straitjacket, in so many words. The house pushes its theme to the end of the names, as Black Label Trading pushes its own."}]',

 '[{"name":"Asylum 13","color":"#4A2C1A","force":"Full","wrapper":"Ligada nicaragüense","vitolas":["Robusto","Toro","Sixty","Seventy","Eighty"],"story":"La gama fundadora, y la de los formatos desmesurados: las vitolas llevan su cepo por nombre, hasta el ochenta. Liada en NACSA, en Estelí."},{"name":"Asylum Insidious","color":"#6B4226","force":"Medium-Full","wrapper":"Ligada nicaragüense","vitolas":["Corona","Robusto","Toro"],"story":"La vertiente más mesurada del catálogo, en formatos clásicos. Mismo taller, misma apuesta de precio."},{"name":"Asylum Straight Jacket","color":"#3A2A20","force":"Full","wrapper":"Ligada nicaragüense","vitolas":["Robusto","Toro"],"story":"La camisa de fuerza, con todas las letras. La casa lleva su tema hasta el final de los nombres, como Black Label Trading lleva el suyo."}]',

 '[{"name":"Asylum 13","color":"#4A2C1A","force":"Full","wrapper":"Nicaraguanische Mischung","vitolas":["Robusto","Toro","Sixty","Seventy","Eighty"],"story":"Die Gründungslinie und die der überdimensionierten Formate: Die Vitolas tragen ihr Ringmaß als Namen, bis achtzig. Bei NACSA in Estelí gerollt."},{"name":"Asylum Insidious","color":"#6B4226","force":"Medium-Full","wrapper":"Nicaraguanische Mischung","vitolas":["Corona","Robusto","Toro"],"story":"Die maßvollere Seite des Katalogs, in klassischen Formaten. Dieselbe Werkstatt, dieselbe Preishaltung."},{"name":"Asylum Straight Jacket","color":"#3A2A20","force":"Full","wrapper":"Nicaraguanische Mischung","vitolas":["Robusto","Toro"],"story":"Die Zwangsjacke, ausgeschrieben. Das Haus treibt sein Thema bis in die Namen, wie Black Label Trading das seine."}]',

 '[{"name":"Asylum 13","color":"#4A2C1A","force":"Full","wrapper":"尼加拉瓜配方","vitolas":["Robusto","Toro","Sixty","Seventy","Eighty"],"story":"奠基系列，也是超大规格的那一条：尺寸径以环径为名，一直到八十。于埃斯特利的 NACSA 卷制。"},{"name":"Asylum Insidious","color":"#6B4226","force":"Medium-Full","wrapper":"尼加拉瓜配方","vitolas":["Corona","Robusto","Toro"],"story":"目录中较为克制的一侧，采用经典尺寸。同一作坊，同样的价格取向。"},{"name":"Asylum Straight Jacket","color":"#3A2A20","force":"Full","wrapper":"尼加拉瓜配方","vitolas":["Robusto","Toro"],"story":"「约束衣」，字面如此。这家把自己的主题一路贯彻到名字里，正如 Black Label Trading 贯彻它自己的那套。"}]',

 '[{"name":"Asylum 13","color":"#4A2C1A","force":"Full","wrapper":"مزيج نيكاراغوي","vitolas":["Robusto","Toro","Sixty","Seventy","Eighty"],"story":"السلسلة المؤسِّسة، وسلسلة المقاسات المفرطة: تحمل المقاسات أقطارها أسماءً، حتى الثمانين. تُلَفّ في ناكسا بإستيلي."},{"name":"Asylum Insidious","color":"#6B4226","force":"Medium-Full","wrapper":"مزيج نيكاراغوي","vitolas":["Corona","Robusto","Toro"],"story":"الوجه الأكثر اتّزانًا في الكتالوج، بمقاسات كلاسيكية. الورشة نفسها والموقف نفسه من السعر."},{"name":"Asylum Straight Jacket","color":"#3A2A20","force":"Full","wrapper":"مزيج نيكاراغوي","vitolas":["Robusto","Toro"],"story":"«سترة التقييد»، بحروفها. تمضي الدار بموضوعها إلى آخر الأسماء، كما تفعل بلاك ليبل تريدنغ بموضوعها."}]'),

-- ── Oscar Valladares ─────────────────────────────────────
('Oscar Valladares', 'honduras', '2012 — Danlí, Honduras',
 'Oscar Valladares Tobacco & Co., Danlí, Honduras',

 'Trois hommes qui s''étaient formés ailleurs ouvrent en 2012 une petite fabrique à Danlí : Oscar Valladares, son frère Hector, et leur ami Bayron Duarte.

Ce qu''ils apportaient venait d''ailleurs, et c''est ce qui explique la maison. Oscar avait passé neuf ans chez Rocky Patel ; Bayron cumulait une vingtaine d''années entre General Cigar et Oliva. Les trois maisons sont dans cet atlas — la scène hondurienne se lit mieux quand on sait où ses gens ont appris.

Le Leaf by Oscar est ce qui l''a fait connaître, et le procédé est visible avant d''être fumé : le cigare est enveloppé dans une feuille de tabac entière, séchée, qu''on retire avant d''allumer. Ce n''est pas un emballage, c''est du tabac.

La suite tient à un détaillant. Island Jim, de Pittsburgh, visite la fabrique et rapporte mille cigares ; ils partent en une semaine. La maison a gardé l''habitude de ces collaborations avec des boutiques, dont plusieurs séries portent le nom.',

 '[{"name":"Leaf by Oscar","color":"#6B4226","force":"Medium","wrapper":"Corojo, Connecticut, Maduro ou Sumatra selon les versions","vitolas":["Robusto","Toro","Sixty"],"story":"Le cigare enveloppé dans une feuille de tabac entière, à retirer avant d''allumer. C''est ce qui a fait connaître la maison, et ce qui la rend reconnaissable de loin."},{"name":"Oscar Valladares 2012","color":"#8B5A2B","force":"Medium-Full","wrapper":"Assemblage hondurien","vitolas":["Robusto","Toro"],"story":"L''année de fondation en guise de nom. La gamme classique de la maison, sans l''enveloppe de feuille — celle par laquelle on juge le tabac plutôt que l''idée."},{"name":"Super Fly","color":"#3A2A20","force":"Full","wrapper":"Assemblage hondurien","vitolas":["Robusto","Toro"],"story":"Le versant corsé, en séries courtes. La maison travaille beaucoup en collaboration avec des détaillants, et ce registre s''y prête."}]',

 'Three men who had trained elsewhere opened a small factory at Danlí in 2012: Oscar Valladares, his brother Hector, and their friend Bayron Duarte.

What they brought came from elsewhere, and that is what explains the house. Oscar had spent nine years at Rocky Patel; Bayron had some twenty years between General Cigar and Oliva. All three houses are in this atlas — the Honduran scene reads better when you know where its people learned.

Leaf by Oscar is what made its name, and the device is visible before it is smoked: the cigar is wrapped in a whole cured tobacco leaf, removed before lighting. It is not packaging, it is tobacco.

What followed came down to a retailer. Island Jim, of Pittsburgh, visited the factory and brought back a thousand cigars; they sold out in a week. The house has kept the habit of these shop collaborations, several of which carry their names.',

 'Tres hombres que se habían formado en otra parte abren en 2012 una pequeña fábrica en Danlí: Oscar Valladares, su hermano Hector y su amigo Bayron Duarte.

Lo que traían venía de fuera, y eso explica la casa. Oscar había pasado nueve años en Rocky Patel; Bayron sumaba una veintena de años entre General Cigar y Oliva. Las tres casas están en este atlas: la escena hondureña se lee mejor cuando se sabe dónde aprendió su gente.

El Leaf by Oscar es lo que la dio a conocer, y el recurso se ve antes de fumarse: el puro va envuelto en una hoja de tabaco entera, curada, que se retira antes de encender. No es un embalaje: es tabaco.

Lo que siguió se debe a un detallista. Island Jim, de Pittsburgh, visita la fábrica y se lleva mil puros; se agotan en una semana. La casa ha conservado la costumbre de estas colaboraciones con tiendas, varias de las cuales llevan su nombre.',

 'Drei Männer, die anderswo gelernt hatten, eröffneten 2012 eine kleine Fabrik in Danlí: Oscar Valladares, sein Bruder Hector und ihr Freund Bayron Duarte.

Was sie mitbrachten, kam von anderswo, und das erklärt das Haus. Oscar hatte neun Jahre bei Rocky Patel verbracht; Bayron kam auf rund zwanzig Jahre zwischen General Cigar und Oliva. Alle drei Häuser stehen in diesem Atlas — die honduranische Szene liest sich besser, wenn man weiß, wo ihre Leute gelernt haben.

Leaf by Oscar hat sie bekannt gemacht, und der Kunstgriff ist sichtbar, bevor er geraucht wird: Die Zigarre ist in ein ganzes, getrocknetes Tabakblatt gewickelt, das vor dem Anzünden abgenommen wird. Es ist keine Verpackung, es ist Tabak.

Was folgte, verdankt sich einem Händler. Island Jim aus Pittsburgh besuchte die Fabrik und brachte tausend Zigarren mit; sie waren in einer Woche weg. Das Haus hat sich die Gewohnheit dieser Ladenkooperationen bewahrt, von denen mehrere deren Namen tragen.',

 '三个曾在别处学艺的人于 2012 年在丹利开设了一间小工厂：Oscar Valladares、其兄弟 Hector，以及朋友 Bayron Duarte。

他们带来的东西来自别处，这也解释了这家公司。Oscar 曾在 Rocky Patel 待过九年；Bayron 在 General Cigar 与 Oliva 累计约二十年。这三家都在本图集之中——知道这些人在哪里学的手艺，洪都拉斯这一片才读得懂。

让它出名的是 Leaf by Oscar，其手法在点燃之前就已可见：雪茄外裹一整片晾制过的烟叶，点火前取下。那不是包装，那就是烟草。

后来的事要归功于一位零售商。匹兹堡的 Island Jim 参观了工厂，带回一千支雪茄，一周之内售罄。这家公司此后保留了与门店合作的习惯，其中数个系列就以合作方命名。',

 'ثلاثة رجال تدرّبوا في أماكن أخرى افتتحوا عام 2012 مصنعًا صغيرًا في دانلي: أوسكار بايادارِس، وأخوه إكتور، وصديقهما بايرون دوارتي.

وما جلبوه جاء من خارج، وهذا ما يفسّر الدار. فقد أمضى أوسكار تسع سنوات في روكي باتيل؛ وجمع بايرون نحو عشرين عامًا بين جنرال سيغار وأوليفا. والدور الثلاث كلّها في هذا الأطلس — ويتّضح المشهد الهندوراسي حين نعرف أين تعلّم أهله.

و«ليف باي أوسكار» هو ما عرّف بها، والحيلة تُرى قبل أن تُدخَّن: فالسيجار ملفوف بورقة تبغ كاملة مجفّفة تُنزَع قبل الإشعال. ليست غلافًا، بل تبغًا.

أمّا ما تلا فيعود إلى بائع تجزئة. زار «آيلاند جيم» من بيتسبرغ المصنع وعاد بألف سيجار، فنفدت في أسبوع. وحافظت الدار على عادة هذه الشراكات مع المتاجر، وتحمل سلاسل عدّة أسماءها.',

 '[{"name":"Leaf by Oscar","color":"#6B4226","force":"Medium","wrapper":"Corojo, Connecticut, Maduro or Sumatra depending on the version","vitolas":["Robusto","Toro","Sixty"],"story":"The cigar wrapped in a whole tobacco leaf, to be removed before lighting. It is what made the house known, and what makes it recognisable from across a room."},{"name":"Oscar Valladares 2012","color":"#8B5A2B","force":"Medium-Full","wrapper":"Honduran blend","vitolas":["Robusto","Toro"],"story":"The founding year for a name. The house''s classic range, without the leaf sleeve — the one by which the tobacco is judged rather than the idea."},{"name":"Super Fly","color":"#3A2A20","force":"Full","wrapper":"Honduran blend","vitolas":["Robusto","Toro"],"story":"The fuller side, in short runs. The house works a great deal with retailers, and this register suits that."}]',

 '[{"name":"Leaf by Oscar","color":"#6B4226","force":"Medium","wrapper":"Corojo, Connecticut, Maduro o Sumatra según las versiones","vitolas":["Robusto","Toro","Sixty"],"story":"El puro envuelto en una hoja de tabaco entera, que se retira antes de encender. Es lo que dio a conocer a la casa, y lo que la hace reconocible de lejos."},{"name":"Oscar Valladares 2012","color":"#8B5A2B","force":"Medium-Full","wrapper":"Ligada hondureña","vitolas":["Robusto","Toro"],"story":"El año de fundación como nombre. La gama clásica de la casa, sin la funda de hoja: aquella por la que se juzga el tabaco y no la idea."},{"name":"Super Fly","color":"#3A2A20","force":"Full","wrapper":"Ligada hondureña","vitolas":["Robusto","Toro"],"story":"La vertiente fuerte, en series cortas. La casa trabaja mucho en colaboración con detallistas, y este registro se presta a ello."}]',

 '[{"name":"Leaf by Oscar","color":"#6B4226","force":"Medium","wrapper":"Corojo, Connecticut, Maduro oder Sumatra je nach Fassung","vitolas":["Robusto","Toro","Sixty"],"story":"Die Zigarre, in ein ganzes Tabakblatt gewickelt, das vor dem Anzünden abgenommen wird. Sie hat das Haus bekannt gemacht und macht es von weitem erkennbar."},{"name":"Oscar Valladares 2012","color":"#8B5A2B","force":"Medium-Full","wrapper":"Honduranische Mischung","vitolas":["Robusto","Toro"],"story":"Das Gründungsjahr als Name. Die klassische Linie des Hauses, ohne Blatthülle — jene, an der man den Tabak beurteilt und nicht die Idee."},{"name":"Super Fly","color":"#3A2A20","force":"Full","wrapper":"Honduranische Mischung","vitolas":["Robusto","Toro"],"story":"Die kräftige Seite, in kurzen Serien. Das Haus arbeitet viel mit Händlern zusammen, und dieses Register eignet sich dafür."}]',

 '[{"name":"Leaf by Oscar","color":"#6B4226","force":"Medium","wrapper":"依版本而定：Corojo、康涅狄格、马杜罗或苏门答腊","vitolas":["Robusto","Toro","Sixty"],"story":"外裹一整片烟叶的雪茄，点燃前取下。正是它让这家为人所知，也让它远远就能被认出。"},{"name":"Oscar Valladares 2012","color":"#8B5A2B","force":"Medium-Full","wrapper":"洪都拉斯配方","vitolas":["Robusto","Toro"],"story":"以创立之年为名。这家的经典系列，没有那层叶套——评判的是烟草本身，而非那个点子。"},{"name":"Super Fly","color":"#3A2A20","force":"Full","wrapper":"洪都拉斯配方","vitolas":["Robusto","Toro"],"story":"浓烈的一侧，小批量生产。这家常与零售商合作，而这种风格正适合此道。"}]',

 '[{"name":"Leaf by Oscar","color":"#6B4226","force":"Medium","wrapper":"كوروخو أو كونيتيكت أو مادورو أو سومطرة بحسب النسخة","vitolas":["Robusto","Toro","Sixty"],"story":"السيجار الملفوف بورقة تبغ كاملة تُنزَع قبل الإشعال. هو ما عرّف بالدار، وما يجعلها تُعرَف من بعيد."},{"name":"Oscar Valladares 2012","color":"#8B5A2B","force":"Medium-Full","wrapper":"مزيج هندوراسي","vitolas":["Robusto","Toro"],"story":"سنة التأسيس اسمًا. السلسلة الكلاسيكية للدار، بلا غلاف الورقة — تلك التي يُحكَم بها على التبغ لا على الفكرة."},{"name":"Super Fly","color":"#3A2A20","force":"Full","wrapper":"مزيج هندوراسي","vitolas":["Robusto","Toro"],"story":"الوجه القويّ، بدفعات قصيرة. تعمل الدار كثيرًا بالشراكة مع بائعي التجزئة، وهذا المزاج يلائم ذلك."}]'),

-- ── Micallef ─────────────────────────────────────────────
('Micallef', 'nicaragua', '2016 — Al Micallef et la famille Gómez Sánchez',
 'Fabrique 1934 de la famille Gómez Sánchez, Estelí, Nicaragua',

 'Micallef commence par une panne de voiture. Al Micallef, entrepreneur texan, rencontre les frères Joel et Edel Gómez Sánchez dans un salon de cigares du Texas où ils s''étaient arrêtés, leur voiture étant tombée en panne. Il goûte ce qu''ils roulent, et leur demande de composer un cigare pour lui.

De là naît en 2016 une maison à deux têtes : le nom et les moyens d''un côté, trois générations de métier de l''autre.

Car la famille Gómez Sánchez vient de Cuba, et son parcours se lit dans cet atlas. Pedro F. Gómez roulait à la fabrique H. Upmann, à La Havane. Sa belle-fille travaillait chez Partagás. Leurs petits-fils Joel et Edel ont fait leurs classes dans des fabriques cubaines avant de tenir la leur, à Estelí — la fabrique 1934, où se fait tout le Micallef.

C''est aussi pourquoi cette fiche est nicaraguayenne et non hondurienne, comme on la classe parfois : le Honduras n''apparaît que dans la tripe. La Leyenda porte une cape Habano d''Équateur, une sous-cape nicaraguayenne, et une tripe venue de République dominicaine, du Honduras et du Nicaragua ; la Reserva Limitada Privada prend une cape San Andrés du Mexique et va chercher du tabac jusqu''au Pérou.',

 '[{"name":"Leyenda","color":"#8B5A2B","force":"Medium-Full","wrapper":"Habano d''Équateur","vitolas":["Robusto","Toro","Corona"],"story":"Cape Habano d''Équateur, sous-cape nicaraguayenne, tripe de République dominicaine, du Honduras et du Nicaragua. C''est la gamme qui a établi la maison."},{"name":"Reserva Limitada Privada","color":"#3A2A20","force":"Full","wrapper":"San Andrés Habano du Mexique","vitolas":["Robusto","Toro"],"story":"Cape San Andrés Habano, sous-cape nicaraguayenne, et une tripe qui va chercher du tabac jusqu''au Pérou — un pays que peu d''assemblages emploient."}]',

 'Micallef begins with a breakdown. Al Micallef, a Texas entrepreneur, met the brothers Joel and Edel Gómez Sánchez in a Texas cigar lounge where they had stopped, their car having broken down. He tried what they rolled, and asked them to blend a cigar for him.

Out of that came, in 2016, a house with two heads: the name and the means on one side, three generations of the trade on the other.

For the Gómez Sánchez family comes from Cuba, and its path can be read in this atlas. Pedro F. Gómez rolled at the H. Upmann factory in Havana. His daughter-in-law worked at Partagás. Their grandsons Joel and Edel learned their trade in Cuban factories before running their own, in Estelí — the 1934 factory, where every Micallef is made.

That is also why this entry is Nicaraguan and not Honduran, as it is sometimes filed: Honduras appears only in the filler. Leyenda carries an Ecuadorian Habano wrapper, a Nicaraguan binder, and filler from the Dominican Republic, Honduras and Nicaragua; Reserva Limitada Privada takes a Mexican San Andrés wrapper and reaches as far as Peru for tobacco.',

 'Micallef empieza con una avería. Al Micallef, empresario tejano, conoce a los hermanos Joel y Edel Gómez Sánchez en un salón de puros de Texas donde se habían detenido porque su coche se había averiado. Prueba lo que lían y les pide que compongan un puro para él.

De ahí nace en 2016 una casa de dos cabezas: el nombre y los medios de un lado, tres generaciones de oficio del otro.

Porque la familia Gómez Sánchez viene de Cuba, y su recorrido se lee en este atlas. Pedro F. Gómez liaba en la fábrica H. Upmann, en La Habana. Su nuera trabajaba en Partagás. Sus nietos Joel y Edel se formaron en fábricas cubanas antes de llevar la suya, en Estelí: la fábrica 1934, donde se hace todo el Micallef.

Por eso también esta ficha es nicaragüense y no hondureña, como a veces se la clasifica: Honduras solo aparece en la tripa. La Leyenda lleva capa Habano de Ecuador, capote nicaragüense y tripa de la República Dominicana, Honduras y Nicaragua; la Reserva Limitada Privada toma capa San Andrés de México y va a buscar tabaco hasta el Perú.',

 'Micallef beginnt mit einer Autopanne. Al Micallef, ein texanischer Unternehmer, traf die Brüder Joel und Edel Gómez Sánchez in einer texanischen Zigarrenlounge, wo sie Halt gemacht hatten, weil ihr Wagen liegengeblieben war. Er probierte, was sie rollten, und bat sie, ihm eine Zigarre zu mischen.

Daraus entstand 2016 ein Haus mit zwei Köpfen: der Name und die Mittel auf der einen Seite, drei Generationen Handwerk auf der anderen.

Denn die Familie Gómez Sánchez stammt aus Kuba, und ihr Weg lässt sich in diesem Atlas nachlesen. Pedro F. Gómez rollte in der Fabrik H. Upmann in Havanna. Seine Schwiegertochter arbeitete bei Partagás. Ihre Enkel Joel und Edel lernten in kubanischen Fabriken, ehe sie ihre eigene führten, in Estelí — die Fabrik 1934, in der jede Micallef entsteht.

Deshalb steht dieser Eintrag auch unter Nicaragua und nicht unter Honduras, wie er mitunter geführt wird: Honduras taucht nur in der Einlage auf. Die Leyenda trägt ein ecuadorianisches Habano-Deckblatt, ein nicaraguanisches Umblatt und Einlage aus der Dominikanischen Republik, Honduras und Nicaragua; die Reserva Limitada Privada nimmt ein mexikanisches San-Andrés-Deckblatt und holt Tabak bis aus Peru.',

 'Micallef 始于一次汽车抛锚。得州企业家 Al Micallef 在得州一家雪茄厅里遇见 Joel 与 Edel Gómez Sánchez 兄弟——他们因车子抛锚而在此停留。他尝了他们卷的雪茄，便请他们为自己调配一支。

由此在 2016 年诞生了一家双头的公司：一边是名字与资源，另一边是三代人的手艺。

因为 Gómez Sánchez 家族来自古巴，其脉络在本图集中就能读到。Pedro F. Gómez 曾在哈瓦那的 H. Upmann 工厂卷制雪茄。他的儿媳在 Partagás 工作。他们的孙辈 Joel 与 Edel 先在古巴的工厂学艺，之后才在埃斯特利经营自己的工厂——1934 工厂，所有 Micallef 都出自那里。

这也是本条目归入尼加拉瓜而非洪都拉斯的原因（它有时被归到洪都拉斯）：洪都拉斯只出现在茄芯里。Leyenda 用厄瓜多尔 Habano 茄衣、尼加拉瓜茄套，茄芯来自多米尼加共和国、洪都拉斯与尼加拉瓜；Reserva Limitada Privada 用墨西哥圣安德烈斯茄衣，烟叶甚至远取自秘鲁。',

 'تبدأ «ميكاليف» بعطل سيارة. فقد التقى آل ميكاليف، وهو رجل أعمال من تكساس، بالأخوين خويل وإيديل غوميث سانتشيث في صالة سيجار بتكساس كانا قد توقّفا فيها بعد أن تعطّلت سيارتهما. ذاق ما يلفّانه، فطلب إليهما أن يؤلّفا له سيجارًا.

ومن هناك وُلدت عام 2016 دار برأسين: الاسم والإمكانات من جهة، وثلاثة أجيال من الحرفة من جهة أخرى.

فعائلة غوميث سانتشيث من كوبا، ومسارها يُقرأ في هذا الأطلس. كان بيدرو ف. غوميث يلفّ في مصنع «إتش. أوبمان» بهافانا. وعملت كنّته في «بارتاغاس». وتعلّم حفيداهما خويل وإيديل في مصانع كوبية قبل أن يديرا مصنعهما في إستيلي — مصنع 1934، حيث يُصنع كلّ سيجار ميكاليف.

ولهذا أيضًا صُنّفت هذه البطاقة نيكاراغوية لا هندوراسية كما تُصنَّف أحيانًا: فهندوراس لا تظهر إلا في الحشوة. تحمل «ليينْدا» غلافًا هابانو إكوادوريًا ورابطًا نيكاراغويًا وحشوة من الجمهورية الدومينيكية وهندوراس ونيكاراغوا؛ أمّا «ريسيرفا ليميتادا بريبادا» فتأخذ غلاف سان أندريس المكسيكي وتذهب في طلب التبغ حتى البيرو.',

 '[{"name":"Leyenda","color":"#8B5A2B","force":"Medium-Full","wrapper":"Ecuadorian Habano","vitolas":["Robusto","Toro","Corona"],"story":"Ecuadorian Habano wrapper, Nicaraguan binder, filler from the Dominican Republic, Honduras and Nicaragua. It is the range that established the house."},{"name":"Reserva Limitada Privada","color":"#3A2A20","force":"Full","wrapper":"Mexican San Andrés Habano","vitolas":["Robusto","Toro"],"story":"San Andrés Habano wrapper, Nicaraguan binder, and a filler that reaches as far as Peru — a country few blends use."}]',

 '[{"name":"Leyenda","color":"#8B5A2B","force":"Medium-Full","wrapper":"Habano de Ecuador","vitolas":["Robusto","Toro","Corona"],"story":"Capa Habano de Ecuador, capote nicaragüense, tripa de la República Dominicana, Honduras y Nicaragua. Es la gama que asentó la casa."},{"name":"Reserva Limitada Privada","color":"#3A2A20","force":"Full","wrapper":"San Andrés Habano de México","vitolas":["Robusto","Toro"],"story":"Capa San Andrés Habano, capote nicaragüense y una tripa que va a buscar tabaco hasta el Perú, país que pocas ligadas emplean."}]',

 '[{"name":"Leyenda","color":"#8B5A2B","force":"Medium-Full","wrapper":"Habano aus Ecuador","vitolas":["Robusto","Toro","Corona"],"story":"Ecuadorianisches Habano-Deckblatt, nicaraguanisches Umblatt, Einlage aus der Dominikanischen Republik, Honduras und Nicaragua. Diese Linie hat das Haus etabliert."},{"name":"Reserva Limitada Privada","color":"#3A2A20","force":"Full","wrapper":"Mexikanisches San Andrés Habano","vitolas":["Robusto","Toro"],"story":"San-Andrés-Habano-Deckblatt, nicaraguanisches Umblatt und eine Einlage, die bis nach Peru reicht — ein Land, das wenige Mischungen verwenden."}]',

 '[{"name":"Leyenda","color":"#8B5A2B","force":"Medium-Full","wrapper":"厄瓜多尔 Habano","vitolas":["Robusto","Toro","Corona"],"story":"厄瓜多尔 Habano 茄衣，尼加拉瓜茄套，茄芯来自多米尼加共和国、洪都拉斯与尼加拉瓜。正是这条线立住了这家公司。"},{"name":"Reserva Limitada Privada","color":"#3A2A20","force":"Full","wrapper":"墨西哥圣安德烈斯 Habano","vitolas":["Robusto","Toro"],"story":"圣安德烈斯 Habano 茄衣，尼加拉瓜茄套，茄芯远取秘鲁——那是极少配方会用的产地。"}]',

 '[{"name":"Leyenda","color":"#8B5A2B","force":"Medium-Full","wrapper":"هابانو إكوادوري","vitolas":["Robusto","Toro","Corona"],"story":"غلاف هابانو إكوادوري، ورابط نيكاراغوي، وحشوة من الجمهورية الدومينيكية وهندوراس ونيكاراغوا. وهي السلسلة التي رسّخت الدار."},{"name":"Reserva Limitada Privada","color":"#3A2A20","force":"Full","wrapper":"سان أندريس هابانو المكسيكي","vitolas":["Robusto","Toro"],"story":"غلاف سان أندريس هابانو، ورابط نيكاراغوي، وحشوة تذهب في طلب التبغ حتى البيرو — بلد قلّ أن تستعمله المزائج."}]');

-- ── Les sceaux, calculés depuis les colonnes ─────────────
INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'brands', b.`name`, c.champ, l.lang,
       SHA1(CASE c.champ WHEN 'history' THEN b.`history` ELSE b.`gamme` END),
       'machine', NOW()
  FROM `brands` b
  JOIN (SELECT 'history' champ UNION ALL SELECT 'gamme') c
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE b.`name` IN ('CLE Cigar Company','Asylum','Oscar Valladares','Micallef')
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 190','systeme','le_cercle_eiroa','marque',0,
   'QUATRE FICHES, PAS SIX : Don Tomas, HPC et 777 n ont pas ete assez documentees pour etre ecrites. Mieux vaut quatre fiches sourcees que six dont deux tiennent sur des pages de detaillants. Ajoutees : CLE Cigar Company (Christian Eiroa, 2012, honduras), Asylum (Lazuka et Eiroa, 2012, nicaragua), Oscar Valladares (Danli, 2012, honduras) et Micallef (Al Micallef, 2016, nicaragua)'),
  (NULL,'migration 190','systeme','qui_fait_quoi_applique_a_fond','marque',0,
   'LA CONSIGNE SUR LES COLLABORATIONS REND LE PLUS SUR CE LOT. LE CERCLE EIROA sur trois generations : Generoso J. Eiroa quitte l Espagne pour Cuba ; Julio Eiroa travaille avec Angel Oliva puis fonde sa ferme dans la vallee de Jamastran — c est lui d ALADINO, que l atlas porte ; Christian Eiroa possede CAMACHO avec son pere et la VEND A DAVIDOFF EN 2008, deux maisons que l atlas porte aussi, puis fonde CLE et Asylum. LA CHAINE MICALLEF sur trois generations egalement : Pedro F. Gomez roulait chez H. UPMANN a La Havane, sa belle-fille chez PARTAGAS, leurs petits-fils Joel et Edel tiennent la fabrique 1934 d Esteli — H. Upmann et Partagas sont dans l atlas. L EQUIPE VALLADARES : Oscar neuf ans chez ROCKY PATEL, Bayron Duarte vingt ans entre GENERAL CIGAR et OLIVA — les trois maisons sont dans l atlas'),
  (NULL,'migration 190','systeme','quatrieme_et_cinquieme_erreur_de_pays','marque',0,
   'docs/maisons-absentes.md CLASSAIT ASYLUM ET MICALLEF AU HONDURAS ; LES DEUX SONT FAUSSES. Asylum sort PRINCIPALEMENT de la NACSA a Esteli au Nicaragua, le reste de la fabrique Aladino a Danli. Micallef est faite a la fabrique 1934 de la famille Gomez Sanchez a Esteli — le Honduras n apparait que dans la TRIPE. C est la QUATRIEME et la CINQUIEME fois que le recensement se trompe de pays, apres Nicoya (183), La Palina (186/189) et Padilla (188), et le motif ne varie pas : la nationalite ou le domicile du fondateur pris pour le lieu de fabrication'),
  (NULL,'migration 190','systeme','date_corrigee','marque',0,
   'le recensement donnait Oscar Valladares en 2013 ; c est 2012. Comme pour Southern Draw a la migration 188, ou il disait 2015 pour 2014'),
  (NULL,'migration 190','systeme','un_cinema_devenu_fabrique','marque',0,
   'LA FABRIQUE ALADINO DE DANLI ETAIT UN CINEMA, et il appartenait au grand-pere de Christian Eiroa. Elle a par ailleurs ete l une des premieres installations tabacoles certifiees par Bayer CropScience. C est la que se fait la part hondurienne d Asylum');

-- ════════════════════════════════════════════════════════
-- LES DEUX TABLEAUX DE PAYS, EN TOUTES LETTRES
-- ════════════════════════════════════════════════════════
-- honduras : 17 → 19 entrées
UPDATE `producer_countries`
   SET `brands` = '[{"desc":"Prensado — Cigare de l''Année 2011","name":"Alec Bradley","iconic":true},{"desc":"Honduras Cameroon, blend iconique","name":"CAO","iconic":true},{"desc":"Corojo authentique de Jamastran","name":"Camacho","iconic":false},{"desc":"Le Punch d''après 1960, sans rapport avec le havane","name":"Punch Honduras","iconic":false},{"desc":"Suisse, dominicaine et hondurienne à la fois","name":"Excalibur","iconic":false},{"desc":"Le prénom de Zino Davidoff, en marque à part","name":"Zino Platinum","iconic":false},{"desc":"1995, fondée depuis Paris pour un palais européen","name":"Flor de Selva","iconic":true},{"desc":"Une ville bâtie autour de sa manufacture","name":"La Flor de Copán","iconic":false},{"desc":"Du corojo d''avant les hybrides, cultivé par la famille","name":"Aladino","iconic":false},{"desc":"La tête sucrée qui a fait commencer des générations","name":"Baccarat","iconic":false},{"desc":"Le contre-pied du havane : ici, c''est le corsé","name":"Hoyo de Monterrey Honduras","iconic":false},{"desc":"Une des dernières traces vivantes de ce que Tampa a été","name":"Bering","iconic":false},{"desc":"Assemblage Cofradia d''Estélo Padrón, chez HATSA","name":"Bolívar Honduras","iconic":false},{"desc":"Villazon, aux mêmes ateliers que Punch et Hoyo","name":"El Rey del Mundo Honduras","iconic":false},{"desc":"Altadis USA ; la ligne Tabacales est dominicaine","name":"Saint Luis Rey Honduras","iconic":false},{"desc":"Abandonnée par Habanos en 2005, relancée au Honduras","name":"Gispert","iconic":false},{"name":"Maya Selva Cigars","desc":"Fondée en 1995 par Maya Selva — Flor de Selva","iconic":false},{"name":"CLE Cigar Company","desc":"Christian Eiroa revient au métier quatre ans après avoir vendu Camacho","iconic":true},{"name":"Oscar Valladares","desc":"Le cigare enveloppé dans une feuille entière, à retirer avant d''allumer","iconic":false}]',
       `updated_at` = NOW()
 WHERE `id` = 'honduras';

-- nicaragua : 33 → 35 entrées
UPDATE `producer_countries`
   SET `brands` = '[{"desc":"Référence absolue du Nicaragua premium","name":"Padrón","iconic":true},{"desc":"Pepin Garcia, maître torcedor légendaire","name":"My Father","iconic":true},{"desc":"Serie V mondialement reconnue","name":"Oliva","iconic":true},{"desc":"Liga Privada, révolution moderne","name":"Drew Estate","iconic":true},{"desc":"Plus grand producteur familial","name":"Plasencia","iconic":false},{"desc":"Élégance et puissance fusionnées","name":"Rocky Patel","iconic":false},{"desc":"Maître du Connecticut nicaraguayen","name":"Perdomo","iconic":false},{"desc":"Plus ancienne manufacture du pays","name":"Joya de Nicaragua","iconic":false},{"desc":"Le mélange privé de Jonathan Drew, devenu culte","name":"Liga Privada","iconic":false},{"desc":"Maison suisse de 1888, roulée à Estelí","name":"Villiger","iconic":false},{"desc":"Le rouleur que les autres marques employaient sans le nommer","name":"A.J. Fernandez","iconic":true},{"desc":"D''abord un planteur de Jalapa, ensuite une marque","name":"Aganorsa Leaf","iconic":true},{"desc":"La grammaire cubaine, la matière nicaraguayenne","name":"Tatuaje","iconic":false},{"desc":"Celle qui a rendu le petit format respectable","name":"Illusione","iconic":false},{"desc":"Un cigare ancré dans une culture, pas seulement un terroir","name":"Foundation Cigar Company","iconic":false},{"desc":"Granada plutôt qu''Estelí, et l''atelier ouvert aux visiteurs","name":"Mombacho","iconic":false},{"desc":"Une marque qui s''est offert sa propre manufacture","name":"Espinosa","iconic":true},{"desc":"Pas d''usine : elle choisit son rouleur selon l''assemblage","name":"Crowned Heads","iconic":true},{"desc":"Des noms cubains d''avant 1960, des assemblages d''aujourd''hui","name":"Warped","iconic":false},{"desc":"Maison nicaraguayenne, encore peu documentée ici","name":"Capitol","iconic":false},{"desc":"Repris par la famille García en décembre 2019, après quarante-cinq ans chez Quesada","name":"Fonseca Nicaraguayen","iconic":false},{"name":"Nicoya","desc":"Maison australienne roulée à Estelí — l''Australie ne cultive plus depuis 2006","iconic":false},{"name":"Dunbarton Tobacco & Trust","desc":"Steve Saka, ex-Drew Estate, parti monter sa maison sans usine","iconic":true},{"name":"RoMa Craft Tobac","desc":"Commencée dans un garage, puis son propre atelier à Estelí","iconic":true},{"name":"Viaje","desc":"Plus de gamme régulière depuis 2012 : rien que des séries limitées","iconic":false},{"name":"Room101","desc":"D''un bijoutier au cigare ; trois manufactures, deux pays","iconic":false},{"name":"L''Atelier","desc":"La seconde maison de Pete Johnson, chez My Father comme Tatuaje","iconic":false},{"name":"La Aroma de Cuba","desc":"Nom cubain des années 1880, refait par Pepin García en 2009","iconic":false},{"name":"Southern Draw","desc":"Robert et Sharon Holt — un seul atelier, ce qui est rare","iconic":false},{"name":"HVC Cigars","desc":"Havana City ; dix ans sans usine, puis la sienne en 2021","iconic":true},{"name":"Fratello","desc":"Un ingénieur de la NASA passé au cigare","iconic":false},{"name":"Curivari","desc":"Grecque de tête, cubaine d''intention, nicaraguayenne de matière","iconic":false},{"name":"Black Label Trading Co.","desc":"Une fabrique conçue comme un atelier d''artiste","iconic":false},{"name":"Asylum","desc":"L''autre moitié de CLE — et une fabrique qui fut un cinéma","iconic":false},{"name":"Micallef","desc":"Une panne de voiture, un Texan, et trois générations cubaines","iconic":false}]',
       `updated_at` = NOW()
 WHERE `id` = 'nicaragua';

