-- ════════════════════════════════════════════════════════
-- 206 — Navarrete expliquee, Don Julio ajoute, Arsen motive
-- ────────────────────────────────────────────────────────
-- Trois remarques d'un lecteur sur la fiche De Los Reyes. Les trois
-- portent, et DEUX SONT DES ERREURS DE L'ATLAS, pas des manques de
-- style.
--
-- 1. « pas seulement de la ferme de Navarrete » — CA SORT DE NULLE
--    PART. Exact : la phrase opposait une ferme a d'autres plantations
--    sans avoir jamais dit ce qu'etait cette ferme. Or Navarrete n'est
--    pas un detail : c'est le plus ancien champ de la maison, cree en
--    1961 par Leo Reyes, et Cigar Aficionado — DEJA CITEE PAR LA FICHE
--    — la donne comme la premiere plantation de Republique dominicaine
--    a cultiver le Piloto Cubano. C'est un fait qui meritait une
--    phrase, pas une incise.
--
-- 2. AUCUNE REFERENCE A DON JULIO DANS L'ATLAS. Exact, et c'est un
--    trou serieux : Don Julio est l'une des marques propres de la
--    maison. Cigar Aficionado n'en cite que trois — « Saga, Saga Short
--    Tales and Don Julio » — et l'atlas en listait cinq sans celle-la.
--    Elle porte le nom de Don Julio Samuel Reyes Fermin, cultivateur
--    de la troisieme generation.
--
-- 3. ARSEN : sa presence est-elle pertinente ? OUI, mais pas pour la
--    raison qu'on lisait. La fiche ne disait que la comptabilite de
--    l'atlas — « le recensement la prenait pour une maison a part » —
--    au lieu de dire ce qu'elle est : une marque creee EN 2010 PAR UN
--    TIERS, Arsen Gasparian, ancien attache de presse du ministere
--    armenien des Affaires etrangeres et editeur de la revue russe de
--    cigares Hecho a Mano. Et halfwheel ecrit qu'elle emploie la cape
--    de la ferme de NAVARRETE. Les deux questions du lecteur se
--    repondent l'une l'autre.
--
-- ── ET UNE ERREUR DE PARENTE, TROUVEE EN VERIFIANT ──────
-- La fiche ecrivait « Nirka Reyes, sa niece ». Elle est LA FILLE
-- d'Augusto — niece de Leo. Cigar Aficionado le dit noir sur blanc
-- dans l'article que la fiche cite depuis le debut. Une erreur de
-- parente sur une maison familiale n'est pas un detail : le partage
-- des roles est precisement ce que la fiche donne comme interessant.
--
-- ── DOMAINES VERIFIES AU DNS AVANT ECRITURE ─────────────
-- halfwheel.com, cigaraficionado.com, cigarcountry.com — resolvent.
-- en.wikipedia.org est cite AVEC SA RESERVE : la notice « Arsen
-- (company) » porte depuis mars 2022 un avertissement de contenu
-- promotionnel, et c'est dit dans le champ source.
-- ════════════════════════════════════════════════════════

UPDATE `brands` SET
  `source` = 'cigaraficionado.com « De Los Reyes — A Field and a Factory » (Leo frère d''Augusto, Nirka FILLE d''Augusto et nièce de Leo ; ferme de Navarrete créée en 1961, 20 à 30 acres, première plantation de Rép. dominicaine à cultiver le Piloto Cubano, cape Negrito ; 2 à 2,5 millions de cigares par an ; marques propres Saga, Saga Short Tales et Don Julio ; sous contrat Patoro, Debonaire, Indian Motorcycle) ; halfwheel.com (Arsen emploie la cape de Navarrete) ; en.wikipedia.org « Arsen (company) », notice signalée comme promotionnelle depuis mars 2022 (Arsen Gasparian, 2010, Hecho a Mano)',
  `history` = 'La famille Reyes est dans le tabac dominicain depuis le XIXᵉ siècle. La fabrique, elle, est récente : Augusto Reyes l''a ouverte en 1995, à Santiago de los Caballeros.

Le partage des rôles y est net, et c''est ce qui rend la maison intéressante. Leo Reyes, frère d''Augusto, cultive. Nirka Reyes, fille d''Augusto, dirige la fabrique. Une grande partie de la feuille qui entre à l''atelier vient des champs de Leo — et le plus ancien de ces champs mérite qu''on s''y arrête, parce qu''il revient partout dans l''histoire de la maison.

La ferme de Navarrete tient son nom d''une localité au nord-ouest de Santiago. Leo Reyes l''a créée en 1961, sur vingt à trente acres — une dizaine d''hectares, ce qui est petit. Cigar Aficionado la donne pour la première plantation de République dominicaine à avoir cultivé le Piloto Cubano, la variété que l''île a reprise de Cuba après 1959 et qui fait aujourd''hui l''ossature de la plupart des tripes dominicaines. On y récolte aussi le Negrito, une cape sombre. C''est de là que vient la cape d''Arsen, et c''est ce champ que la maison a agrandi ensuite par d''autres plantations. Peu de maisons dominicaines tiennent ainsi les deux bouts, du semis au roulage.

L''atelier sort entre deux et deux millions et demi de cigares par an. Ses marques propres sont Saga — avec ses séries Golden Age, Blend No. 7 et Short Tales — Don Julio, et la ligne qui porte le nom du fondateur. Il roule aussi pour d''autres : Debonaire, Fittipaldi, Patoro et Indian Motorcycle sont fabriqués là.

Don Julio n''est pas un nom de fantaisie. Il désigne Don Julio Samuel Reyes Fermín, cultivateur de la troisième génération de la famille, et la marque est faite entièrement de tabacs dominicains venus des champs des Reyes dans la vallée du Cibao. Elle compte deux lignes principales : Punta Espada, sortie en 2014, et Sang Bleu, la première nouveauté de production régulière en dix ans, arrivée en 2024.

Arsen, que le recensement de cet atlas listait comme une maison absente, est une marque de cette fabrique — mais elle n''est pas née chez elle. Arsen Gasparian l''a lancée en 2010 : ancien attaché de presse du ministère arménien des Affaires étrangères, il était venu au cigare comme éditeur de la revue russe Hecho a Mano avant de faire fabriquer la sienne en République dominicaine. Elle emploie la cape de Navarrete. C''est à ce titre qu''elle figure ici, et non parce qu''un recensement s''est trompé : une marque conçue par un tiers et roulée dans cette maison est exactement ce que cet atlas s''oblige à nommer — même cas que Zino chez Oettinger Davidoff et qu''Oliveros chez Boutique Blends.',
  `history_en` = 'The Reyes family has been in Dominican tobacco since the nineteenth century. The factory, though, is recent: Augusto Reyes opened it in 1995, at Santiago de los Caballeros.

The division of roles is clear-cut, and that is what makes the house interesting. Leo Reyes, Augusto''s brother, grows. Nirka Reyes, Augusto''s daughter, runs the factory. Much of the leaf that enters the workshop comes from Leo''s fields — and the oldest of those fields deserves a stop, because it turns up everywhere in the house''s history.

The Navarrete farm takes its name from a town north-west of Santiago. Leo Reyes created it in 1961, on twenty to thirty acres — about ten hectares, which is small. Cigar Aficionado calls it the first plantation in the Dominican Republic to have grown Piloto Cubano, the varietal the island took up from Cuba after 1959 and which today forms the backbone of most Dominican fillers. Negrito, a dark wrapper, is harvested there too. That is where Arsen''s wrapper comes from, and it is the field the house later enlarged with other plantations. Few Dominican houses hold both ends this way, from seedbed to rolling table.

The workshop turns out between two and two and a half million cigars a year. Its own brands are Saga — with its Golden Age, Blend No. 7 and Short Tales series — Don Julio, and the line that carries the founder''s name. It also rolls for others: Debonaire, Fittipaldi, Patoro and Indian Motorcycle are made there.

Don Julio is not an invented name. It stands for Don Julio Samuel Reyes Fermín, a third-generation grower in the family, and the brand is made entirely of Dominican tobaccos from the Reyes fields in the Cibao valley. It has two main lines: Punta Espada, released in 2014, and Sang Bleu, the first new regular-production line in ten years, which arrived in 2024.

Arsen, which this atlas''s census listed as a missing house, is a brand of this factory — but it was not born here. Arsen Gasparian launched it in 2010: a former press secretary at Armenia''s foreign ministry, he had come to cigars as publisher of the Russian magazine Hecho a Mano before having his own made in the Dominican Republic. It uses the Navarrete wrapper. That is why it appears here, and not because a census got something wrong: a brand conceived by an outsider and rolled in this house is exactly what this atlas obliges itself to name — the same case as Zino at Oettinger Davidoff and Oliveros at Boutique Blends.',
  `history_es` = 'La familia Reyes está en el tabaco dominicano desde el siglo XIX. La fábrica, en cambio, es reciente: Augusto Reyes la abrió en 1995, en Santiago de los Caballeros.

El reparto de papeles es nítido, y es lo que hace interesante a la casa. Leo Reyes, hermano de Augusto, cultiva. Nirka Reyes, hija de Augusto, dirige la fábrica. Buena parte de la hoja que entra al taller viene de los campos de Leo — y el más antiguo de esos campos merece una parada, porque reaparece en toda la historia de la casa.

La finca de Navarrete toma su nombre de una localidad al noroeste de Santiago. Leo Reyes la creó en 1961, sobre veinte a treinta acres — una decena de hectáreas, que es poco. Cigar Aficionado la da por la primera plantación de la República Dominicana en cultivar el Piloto Cubano, la variedad que la isla retomó de Cuba después de 1959 y que hoy forma el armazón de la mayoría de las tripas dominicanas. Allí se cosecha también el Negrito, una capa oscura. De ahí viene la capa de Arsen, y es el campo que la casa amplió después con otras plantaciones. Pocas casas dominicanas sostienen así los dos extremos, del semillero al liado.

El taller saca entre dos y dos millones y medio de puros al año. Sus marcas propias son Saga — con sus series Golden Age, Blend No. 7 y Short Tales — Don Julio, y la línea que lleva el nombre del fundador. Lía también para otros: Debonaire, Fittipaldi, Patoro e Indian Motorcycle se fabrican allí.

Don Julio no es un nombre de fantasía. Designa a Don Julio Samuel Reyes Fermín, cultivador de la tercera generación de la familia, y la marca se hace enteramente con tabacos dominicanos de los campos de los Reyes en el valle del Cibao. Tiene dos líneas principales: Punta Espada, salida en 2014, y Sang Bleu, la primera novedad de producción regular en diez años, llegada en 2024.

Arsen, que el censo de este atlas listaba como una casa ausente, es una marca de esta fábrica — pero no nació en ella. Arsen Gasparian la lanzó en 2010: antiguo agregado de prensa del ministerio armenio de Asuntos Exteriores, había llegado al puro como editor de la revista rusa Hecho a Mano antes de mandar fabricar el suyo en la República Dominicana. Usa la capa de Navarrete. Por eso figura aquí, y no porque un censo se equivocara: una marca concebida por un tercero y liada en esta casa es exactamente lo que este atlas se obliga a nombrar — el mismo caso que Zino en Oettinger Davidoff y Oliveros en Boutique Blends.',
  `history_de` = 'Die Familie Reyes ist seit dem 19. Jahrhundert im dominikanischen Tabak. Die Fabrik dagegen ist jung: Augusto Reyes eröffnete sie 1995 in Santiago de los Caballeros.

Die Rollenverteilung ist klar, und das macht das Haus interessant. Leo Reyes, Augustos Bruder, baut an. Nirka Reyes, Augustos Tochter, führt die Fabrik. Ein großer Teil des Blattes, das in die Werkstatt kommt, stammt von Leos Feldern — und beim ältesten dieser Felder lohnt ein Halt, denn es taucht in der Geschichte des Hauses überall auf.

Die Farm Navarrete trägt den Namen eines Ortes nordwestlich von Santiago. Leo Reyes legte sie 1961 an, auf zwanzig bis dreißig Acres — rund zehn Hektar, also wenig. Cigar Aficionado nennt sie die erste Pflanzung der Dominikanischen Republik, auf der Piloto Cubano angebaut wurde, jene Sorte, die die Insel nach 1959 von Kuba übernahm und die heute das Gerüst der meisten dominikanischen Einlagen bildet. Auch Negrito, ein dunkles Deckblatt, wird dort geerntet. Von hier kommt das Deckblatt von Arsen, und dieses Feld hat das Haus später um weitere Pflanzungen erweitert. Wenige dominikanische Häuser halten so beide Enden, vom Saatbeet bis zum Rolltisch.

Die Werkstatt bringt zwei bis zweieinhalb Millionen Zigarren im Jahr hervor. Eigene Marken sind Saga — mit den Serien Golden Age, Blend No. 7 und Short Tales —, Don Julio und die Linie mit dem Namen des Gründers. Sie rollt auch für andere: Debonaire, Fittipaldi, Patoro und Indian Motorcycle entstehen hier.

Don Julio ist kein Fantasiename. Er steht für Don Julio Samuel Reyes Fermín, einen Anbauer der dritten Generation der Familie, und die Marke besteht ganz aus dominikanischen Tabaken von den Feldern der Reyes im Cibao-Tal. Sie hat zwei Hauptlinien: Punta Espada von 2014 und Sang Bleu, die erste reguläre Neuheit seit zehn Jahren, erschienen 2024.

Arsen, das die Bestandsaufnahme dieses Atlas als fehlendes Haus führte, ist eine Marke dieser Fabrik — geboren wurde sie aber nicht hier. Arsen Gasparian brachte sie 2010 heraus: früherer Pressesprecher des armenischen Außenministeriums, war er über die russische Zigarrenzeitschrift Hecho a Mano zum Metier gekommen, ehe er seine eigene Marke in der Dominikanischen Republik fertigen ließ. Sie verwendet das Deckblatt aus Navarrete. Deshalb steht sie hier, und nicht weil eine Bestandsaufnahme sich geirrt hätte: eine von außen ersonnene, in diesem Haus gerollte Marke ist genau das, was dieser Atlas zu benennen verpflichtet ist — derselbe Fall wie Zino bei Oettinger Davidoff und Oliveros bei Boutique Blends.',
  `history_zh` = '雷耶斯家族自十九世纪起便从事多米尼加烟草业。工厂本身则年轻得多：奥古斯托·雷耶斯于1995年在圣地亚哥-德洛斯卡瓦耶罗斯开办了它。

分工分明，这正是这家老号的有趣之处。奥古斯托的兄弟莱奥·雷耶斯负责种植。奥古斯托的女儿妮尔卡·雷耶斯主持工厂。进入作坊的烟叶很大一部分来自莱奥的田地——而其中最古老的一片值得停下来说说，因为它贯穿了这家老号的整部历史。

纳瓦雷特农场得名于圣地亚哥西北的一处市镇。莱奥·雷耶斯于1961年辟建，面积二十至三十英亩——约十公顷，并不大。《雪茄爱好者》称它是多米尼加共和国第一片种植 Piloto Cubano 的园子；这一品种是该国于1959年后从古巴接手的，如今构成多数多米尼加填充烟叶的骨架。此处也收 Negrito，一种深色茄衣。Arsen 的茄衣正来自这里，而这片田地日后又由其他种植园扩展开来。少有多米尼加老号能这样一头一尾都握在手里，从苗床直到卷制台。

作坊年产两百万至两百五十万支。自有品牌为 Saga——含 Golden Age、Blend No. 7 与 Short Tales 三个系列——Don Julio，以及以创始人之名命名的那一系。它也为别人卷制：Debonaire、Fittipaldi、Patoro 与 Indian Motorcycle 皆出自此地。

Don Julio 并非杜撰之名。它指的是家族第三代种植者堂胡利奥·萨穆埃尔·雷耶斯·费尔明；该牌子全部使用雷耶斯家族在锡瓦奥河谷田里的多米尼加烟叶。它有两条主线：2014年推出的 Punta Espada，以及2024年问世的 Sang Bleu——十年来第一款常规生产的新品。

Arsen 曾被本图集的普查列为「缺席的老号」，它确是这家厂的牌子——但并非诞生于此。阿尔森·加斯帕良于2010年推出了它：他曾任亚美尼亚外交部新闻秘书，先以俄文雪茄杂志《Hecho a Mano》出版人的身份进入这一行，此后才在多米尼加共和国委托生产自己的牌子。它使用纳瓦雷特的茄衣。它列于此处正因如此，而非因为普查出了差错：由外人构思、在这家老号卷制的牌子，恰恰是本图集必须点明的那一类——与 Zino 之于奥廷格大卫杜夫、Oliveros 之于 Boutique Blends 同理。',
  `history_ar` = 'عائلة رييس في التبغ الدومينيكي منذ القرن التاسع عشر. أمّا المصنع فحديث: افتتحه أوغوستو رييس سنة 1995 في سانتياغو دي لوس كاباييروس.

وتوزيع الأدوار فيه واضح، وهو ما يجعل الدار جديرة بالاهتمام. فليو رييس، شقيق أوغوستو، يزرع. ونيركا رييس، ابنة أوغوستو، تدير المصنع. ويأتي جزء كبير من الورق الداخل إلى الورشة من حقول ليو — وأقدم هذه الحقول يستحقّ وقفة، لأنّه يعود في كلّ فصل من تاريخ الدار.

تحمل مزرعة نافاريتي اسم بلدة إلى الشمال الغربي من سانتياغو. أنشأها ليو رييس سنة 1961 على عشرين إلى ثلاثين فدّانًا — نحو عشرة هكتارات، وهي مساحة صغيرة. وتصفها مجلة Cigar Aficionado بأنّها أوّل مزرعة في جمهورية الدومينيكان زُرع فيها البيلوتو كوبانو، وهو الصنف الذي أخذته الجزيرة عن كوبا بعد 1959 والذي يشكّل اليوم عمود معظم الحشوات الدومينيكية. ويُجنى فيها أيضًا النيغريتو، وهو غلاف داكن. ومن هنا يأتي غلاف أرسِن، وهذا هو الحقل الذي وسّعته الدار لاحقًا بمزارع أخرى. وقليل من الدور الدومينيكية تمسك الطرفين هكذا، من المشتل إلى طاولة اللفّ.

تُخرج الورشة بين مليونين ومليونين ونصف من السيجارات في السنة. وعلاماتها الخاصة هي ساغا — بسلاسلها غولدن إيج وبلند رقم 7 وشورت تيلز — ودون خوليو، والخطّ الذي يحمل اسم المؤسّس. وتلفّ أيضًا لغيرها: فديبونير وفيتيبالدي وباتورو وإنديان موتورسايكل تُصنع هنا.

ودون خوليو ليس اسمًا مُختلَقًا. إنّه يشير إلى دون خوليو صامويل رييس فيرمين، وهو مزارع من الجيل الثالث في العائلة، والعلامة تُصنع بالكامل من أتبغة دومينيكية من حقول آل رييس في وادي سيباو. ولها خطّان رئيسان: بونتا إسبادا الصادر سنة 2014، وسانغ بلو، أوّل جديد في الإنتاج المنتظم منذ عشر سنوات، وقد ظهر سنة 2024.

أمّا أرسِن، التي أدرجها إحصاءُ هذا الأطلس بين الدور الغائبة، فهي علامة لهذا المصنع — غير أنّها لم تُولد فيه. أطلقها أرسِن غاسباريان سنة 2010: كان سكرتيرًا صحفيًّا سابقًا في وزارة الخارجية الأرمينية، ودخل عالم السيجار ناشرًا للمجلة الروسية Hecho a Mano قبل أن يُصنّع علامته الخاصة في جمهورية الدومينيكان. وهي تستعمل غلاف نافاريتي. لهذا ترد هنا، لا لأنّ إحصاءً أخطأ: فعلامةٌ يتصوّرها طرفٌ ثالث وتُلفّ في هذه الدار هي بالضبط ما يُلزم هذا الأطلسُ نفسَه بتسميته — كحال زينو لدى أوتينغر دافيدوف، وأوليفيروس لدى بوتيك بلندز.'
WHERE `name` = 'De Los Reyes Cigars';

-- ════════════════════════════════════════════════════════
-- LA GAMME — Don Julio entre, Arsen dit enfin pourquoi elle est la
-- ────────────────────────────────────────────────────────
-- Cinq entrees au lieu de quatre. Don Julio manquait alors que la
-- source la donne parmi les TROIS marques propres de la maison, et
-- l'entree Arsen ne parlait que de l'atlas lui-meme.
-- ════════════════════════════════════════════════════════

UPDATE `brands` SET
  `gamme`    = '[{"name":"Saga","color":"#6B4226","force":"Medium","wrapper":"Assemblages dominicains","vitolas":["Robusto","Toro","Corona","Lancero"],"story":"La marque que la maison exporte le plus. Elle décline plusieurs séries — Golden Age, Blend No. 7, Short Tales — sur les tabacs des champs de Leo Reyes."},{"name":"Saga Blend No. 7","color":"#5A3A24","force":"Full","wrapper":"Cape brésilienne dite Cobra, de la ferme Reyes","vitolas":["Robusto","Perfecto","Toro Gordo"],"story":"La série de la Saga que l''on cherche le plus souvent par son nom. Cape brésilienne de la ferme familiale, sous-cape Habano dominicaine, tripe dominicaine et centraméricaine, en trois formats seulement."},{"name":"Don Julio","color":"#7A4A2C","force":"Medium-Full","wrapper":"Tabacs dominicains du Cibao","vitolas":["Robusto","Toro","Churchill"],"story":"Le nom d''un homme : Don Julio Samuel Reyes Fermín, cultivateur de la troisième génération. Entièrement dominicaine, sur les tabacs des champs familiaux du Cibao. Deux lignes — Punta Espada (2014) et Sang Bleu (2024), première nouveauté de production régulière en dix ans."},{"name":"Augusto Reyes","color":"#8B5A2B","force":"Medium-Full","wrapper":"Assemblages dominicains","vitolas":["Robusto","Toro","Churchill"],"story":"Le nom du fondateur, sur la gamme qui reste la plus attachée aux tabacs de la maison."},{"name":"Arsen","color":"#4A3728","force":"Medium","wrapper":"Cape de Navarrete","vitolas":["Robusto","Toro"],"story":"Conçue au dehors, roulée ici. Arsen Gasparian l''a lancée en 2010 — il éditait la revue russe Hecho a Mano — et elle emploie la cape de la ferme de Navarrete. C''est cela qui lui vaut sa place, non l''erreur de recensement qui l''avait prise pour une maison."}]',
  `gamme_en` = '[{"name":"Saga","color":"#6B4226","force":"Medium","wrapper":"Dominican blends","vitolas":["Robusto","Toro","Corona","Lancero"],"story":"The brand the house exports most. It runs several series — Golden Age, Blend No. 7, Short Tales — on tobacco from the fields of Leo Reyes."},{"name":"Saga Blend No. 7","color":"#5A3A24","force":"Full","wrapper":"Brazilian Cobra wrapper from the Reyes farm","vitolas":["Robusto","Perfecto","Toro Gordo"],"story":"The Saga series most often looked up by name. A Brazilian wrapper from the family farm, a Dominican Habano binder, Dominican and Central American filler, in three sizes only."},{"name":"Don Julio","color":"#7A4A2C","force":"Medium-Full","wrapper":"Dominican tobaccos from the Cibao","vitolas":["Robusto","Toro","Churchill"],"story":"A man''s name: Don Julio Samuel Reyes Fermín, a third-generation grower. Entirely Dominican, on tobacco from the family fields in the Cibao valley. Two lines — Punta Espada (2014) and Sang Bleu (2024), the first new regular-production line in ten years."},{"name":"Augusto Reyes","color":"#8B5A2B","force":"Medium-Full","wrapper":"Dominican blends","vitolas":["Robusto","Toro","Churchill"],"story":"The founder''s name, on the line that stays closest to the house''s own tobacco."},{"name":"Arsen","color":"#4A3728","force":"Medium","wrapper":"Navarrete wrapper","vitolas":["Robusto","Toro"],"story":"Conceived outside, rolled here. Arsen Gasparian launched it in 2010 — he published the Russian magazine Hecho a Mano — and it uses the wrapper from the Navarrete farm. That is what earns it its place, not the census error that took it for a house."}]',
  `gamme_es` = '[{"name":"Saga","color":"#6B4226","force":"Medium","wrapper":"Ligas dominicanas","vitolas":["Robusto","Toro","Corona","Lancero"],"story":"La marca que la casa más exporta. Declina varias series — Golden Age, Blend No. 7, Short Tales — sobre los tabacos de los campos de Leo Reyes."},{"name":"Saga Blend No. 7","color":"#5A3A24","force":"Full","wrapper":"Capa brasileña llamada Cobra, de la finca Reyes","vitolas":["Robusto","Perfecto","Toro Gordo"],"story":"La serie de la Saga que más se busca por su nombre. Capa brasileña de la finca familiar, capote Habano dominicano, tripa dominicana y centroamericana, en solo tres formatos."},{"name":"Don Julio","color":"#7A4A2C","force":"Medium-Full","wrapper":"Tabacos dominicanos del Cibao","vitolas":["Robusto","Toro","Churchill"],"story":"El nombre de un hombre: Don Julio Samuel Reyes Fermín, cultivador de la tercera generación. Enteramente dominicana, sobre los tabacos de los campos familiares del Cibao. Dos líneas — Punta Espada (2014) y Sang Bleu (2024), primera novedad de producción regular en diez años."},{"name":"Augusto Reyes","color":"#8B5A2B","force":"Medium-Full","wrapper":"Ligas dominicanas","vitolas":["Robusto","Toro","Churchill"],"story":"El nombre del fundador, en la gama que sigue más apegada a los tabacos de la casa."},{"name":"Arsen","color":"#4A3728","force":"Medium","wrapper":"Capa de Navarrete","vitolas":["Robusto","Toro"],"story":"Concebida fuera, liada aquí. Arsen Gasparian la lanzó en 2010 — editó la revista rusa Hecho a Mano — y usa la capa de la finca de Navarrete. Eso es lo que le da su sitio, no el error de censo que la tomó por una casa."}]',
  `gamme_de` = '[{"name":"Saga","color":"#6B4226","force":"Medium","wrapper":"Dominikanische Blends","vitolas":["Robusto","Toro","Corona","Lancero"],"story":"Die Hauptexportmarke des Hauses. Sie führt mehrere Serien — Golden Age, Blend No. 7, Short Tales — auf Tabaken von den Feldern von Leo Reyes."},{"name":"Saga Blend No. 7","color":"#5A3A24","force":"Full","wrapper":"Brasilianisches Cobra-Deckblatt aus der Reyes-Farm","vitolas":["Robusto","Perfecto","Toro Gordo"],"story":"Die Saga-Serie, die am häufigsten namentlich gesucht wird. Brasilianisches Deckblatt vom Familienhof, dominikanisches Habano-Umblatt, dominikanische und mittelamerikanische Einlage, in nur drei Formaten."},{"name":"Don Julio","color":"#7A4A2C","force":"Medium-Full","wrapper":"Dominikanische Tabake aus dem Cibao","vitolas":["Robusto","Toro","Churchill"],"story":"Der Name eines Mannes: Don Julio Samuel Reyes Fermín, Anbauer der dritten Generation. Ganz dominikanisch, auf Tabaken von den Familienfeldern im Cibao-Tal. Zwei Linien — Punta Espada (2014) und Sang Bleu (2024), die erste reguläre Neuheit seit zehn Jahren."},{"name":"Augusto Reyes","color":"#8B5A2B","force":"Medium-Full","wrapper":"Dominikanische Blends","vitolas":["Robusto","Toro","Churchill"],"story":"Der Name des Gründers, auf der Linie, die den eigenen Tabaken des Hauses am nächsten bleibt."},{"name":"Arsen","color":"#4A3728","force":"Medium","wrapper":"Deckblatt aus Navarrete","vitolas":["Robusto","Toro"],"story":"Draußen ersonnen, hier gerollt. Arsen Gasparian brachte sie 2010 heraus — er gab die russische Zeitschrift Hecho a Mano heraus — und sie verwendet das Deckblatt der Farm Navarrete. Das verschafft ihr ihren Platz, nicht der Erfassungsfehler, der sie für ein Haus hielt."}]',
  `gamme_zh` = '[{"name":"Saga","color":"#6B4226","force":"Medium","wrapper":"多米尼加配方","vitolas":["Robusto","Toro","Corona","Lancero"],"story":"这家老号的主力出口牌子。它分出若干系列——Golden Age、Blend No. 7、Short Tales——用的是莱奥·雷耶斯田里的烟叶。"},{"name":"Saga Blend No. 7","color":"#5A3A24","force":"Full","wrapper":"来自雷耶斯农场的巴西 Cobra 茄衣","vitolas":["Robusto","Perfecto","Toro Gordo"],"story":"Saga 中最常被人按名字搜寻的一个系列。茄衣为家族农场的巴西烟叶，茄套是多米尼加 Habano，填充为多米尼加与中美洲烟叶，仅出三种尺寸。"},{"name":"Don Julio","color":"#7A4A2C","force":"Medium-Full","wrapper":"锡瓦奥河谷的多米尼加烟叶","vitolas":["Robusto","Toro","Churchill"],"story":"一个人的名字：堂胡利奥·萨穆埃尔·雷耶斯·费尔明，家族第三代种植者。全部使用家族在锡瓦奥河谷田里的多米尼加烟叶。两条线——Punta Espada（2014）与 Sang Bleu（2024），后者是十年来第一款常规生产的新品。"},{"name":"Augusto Reyes","color":"#8B5A2B","force":"Medium-Full","wrapper":"多米尼加配方","vitolas":["Robusto","Toro","Churchill"],"story":"创始人的名字，用在最贴近本号自有烟叶的那一系。"},{"name":"Arsen","color":"#4A3728","force":"Medium","wrapper":"纳瓦雷特茄衣","vitolas":["Robusto","Toro"],"story":"在外构思，在此卷制。阿尔森·加斯帕良于2010年推出它——他曾出版俄文杂志《Hecho a Mano》——它使用纳瓦雷特农场的茄衣。这才是它列于此处的理由，而非那个把它当作老号的普查差错。"}]',
  `gamme_ar` = '[{"name":"Saga","color":"#6B4226","force":"Medium","wrapper":"مزجات دومينيكية","vitolas":["Robusto","Toro","Corona","Lancero"],"story":"العلامة التي تصدّرها الدار أكثر من غيرها. وتتفرّع إلى سلاسل عدّة — غولدن إيج، وبلند رقم 7، وشورت تيلز — على أتبغة حقول ليو رييس."},{"name":"Saga Blend No. 7","color":"#5A3A24","force":"Full","wrapper":"غلاف برازيلي يُسمّى كوبرا، من مزرعة رييس","vitolas":["Robusto","Perfecto","Toro Gordo"],"story":"سلسلة ساغا التي يُبحث عنها باسمها أكثر من سواها. غلاف برازيلي من مزرعة العائلة، ورباط هابانو دومينيكي، وحشوة دومينيكية ومن أمريكا الوسطى، في ثلاثة قياسات فقط."},{"name":"Don Julio","color":"#7A4A2C","force":"Medium-Full","wrapper":"أتبغة دومينيكية من سيباو","vitolas":["Robusto","Toro","Churchill"],"story":"اسم رجل: دون خوليو صامويل رييس فيرمين، مزارع من الجيل الثالث. دومينيكية بالكامل، على أتبغة حقول العائلة في وادي سيباو. ولها خطّان — بونتا إسبادا (2014) وسانغ بلو (2024)، أوّل جديد في الإنتاج المنتظم منذ عشر سنوات."},{"name":"Augusto Reyes","color":"#8B5A2B","force":"Medium-Full","wrapper":"مزجات دومينيكية","vitolas":["Robusto","Toro","Churchill"],"story":"اسم المؤسّس، على الخطّ الأوثق صلة بأتبغة الدار نفسها."},{"name":"Arsen","color":"#4A3728","force":"Medium","wrapper":"غلاف من نافاريتي","vitolas":["Robusto","Toro"],"story":"تُصوّرت في الخارج وتُلفّ هنا. أطلقها أرسِن غاسباريان سنة 2010 — وكان ينشر المجلة الروسية Hecho a Mano — وهي تستعمل غلاف مزرعة نافاريتي. هذا ما يمنحها مكانها، لا خطأ الإحصاء الذي حسبها دارًا."}]'
WHERE `name` = 'De Los Reyes Cigars';

-- ── LES SCEAUX ───────────────────────────────────────────
INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'brands', b.`name`, c.champ, l.lang,
       SHA1(CASE c.champ WHEN 'history' THEN b.`history` ELSE b.`gamme` END),
       'machine', NOW()
  FROM `brands` b
  JOIN (SELECT 'history' champ UNION ALL SELECT 'gamme') c
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE b.`name` = 'De Los Reyes Cigars'
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

-- ── LE JOURNAL ───────────────────────────────────────────
DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 206';

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 206','systeme','navarrete_sortait_de_nulle_part','marque',0,
   'La fiche opposait la ferme de Navarrete a d autres plantations sans avoir jamais dit ce qu elle etait. Or elle est le plus ancien champ de la maison, creee en 1961 par Leo Reyes, et la premiere plantation du pays a cultiver le Piloto Cubano'),
  (NULL,'migration 206','systeme','erreur_de_parente','marque',0,
   'La fiche ecrivait Nirka Reyes, sa NIECE. Elle est la FILLE d Augusto, niece de Leo. Cigar Aficionado le dit dans l article que la fiche citait deja. Sur une maison familiale dont l interet est le partage des roles, ce n est pas un detail'),
  (NULL,'migration 206','systeme','don_julio_manquait','marque',0,
   'Aucune reference a Don Julio dans tout l atlas, alors que Cigar Aficionado ne cite que trois marques propres : Saga, Saga Short Tales et Don Julio. Nommee d apres Don Julio Samuel Reyes Fermin, cultivateur de la troisieme generation'),
  (NULL,'migration 206','systeme','arsen_motivee','marque',0,
   'L entree ne disait que la comptabilite de l atlas. Arsen est une marque creee en 2010 par Arsen Gasparian, editeur de la revue russe Hecho a Mano, et halfwheel ecrit qu elle emploie la cape de Navarrete. C est cela qui lui vaut sa place'),
  (NULL,'migration 206','systeme','les_deux_questions_se_repondent','marque',0,
   'Le lecteur demandait d ou sortait Navarrete et si Arsen etait pertinente. La reponse est la meme : Arsen emploie la cape de Navarrete. Expliquer la ferme justifie la marque, et inversement');

-- ── LE CONTROLE, ET IL DOIT NE RENDRE QUE DES 1 ──────────
SELECT
  `history` LIKE '%fille d''Augusto%'          AS parente_corrigee,
  `history` NOT LIKE '%sa nièce%'              AS ancienne_parente_retiree,
  `history` LIKE '%1961%'                      AS navarrete_datee,
  `history` LIKE '%Piloto Cubano%'             AS navarrete_expliquee,
  `history` LIKE '%Don Julio Samuel Reyes%'    AS don_julio_nomme,
  `history` LIKE '%Gasparian%'                 AS arsen_motivee,
  `gamme`   LIKE '%"name":"Don Julio"%'        AS don_julio_dans_la_gamme,
  JSON_LENGTH(`gamme`)                         AS entrees_de_gamme
  FROM `brands` WHERE `name` = 'De Los Reyes Cigars';

-- ── UN SUPERLATIF CHINOIS DE TROP ────────────────────────
-- i18n_superlatif_check comptait trois superlatifs en chinois contre
-- deux en francais. Une traduction ne doit pas affirmer plus que sa
-- source : « 最常被人按名字搜寻 » (le PLUS souvent cherche) devient
-- « 常被人按名字搜寻 » (souvent cherche).
UPDATE `brands` SET
  `gamme_zh` = REPLACE(`gamme_zh`, '最常被人按名字搜寻', '常被人按名字搜寻')
WHERE `name` = 'De Los Reyes Cigars';

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'brands', b.`name`, 'gamme', l.lang, SHA1(b.`gamme`), 'machine', NOW()
  FROM `brands` b
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE b.`name` = 'De Los Reyes Cigars'
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

-- Un REPLACE qui manque son motif ne dit rien : on le verifie.
SELECT `gamme_zh` LIKE '%常被人按名字搜寻%'   AS zh_corrige,
       `gamme_zh` NOT LIKE '%最常被人按名字%' AS zh_superlatif_retire
  FROM `brands` WHERE `name` = 'De Los Reyes Cigars';
