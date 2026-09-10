-- ════════════════════════════════════════════════════════
-- 204 — Les dettes nommées
-- ────────────────────────────────────────────────────────
-- La feuille de route portait deux petites dettes : quatre réserves
-- écrites dans des champs `source` (Bering, Excalibur, Suerdieck,
-- Carlos Toraño) et une tension entre deux fiches du Costa Rica
-- (Casdagli / Vegas de Santiago).
--
-- LES CHERCHER A MONTRE QUE DEUX D'ENTRE ELLES N'ETAIENT PAS DES
-- RESERVES MAIS DES SYMPTOMES.
--
--  · La fiche EXCALIBUR racontait une histoire entierement fausse,
--    batie sur une confusion de noms : Villiger (le suisse) pour
--    Villazon (le tampeño), avec un assembleur dominicain (Hendrik
--    Kelner) et des plantations Eiroa que rien ne relie a cette marque.
--    La reserve ne portait que sur une date ; c'est tout le corps du
--    texte qui etait a refaire.
--
--  · La fiche CARLOS TORAÑO PANAMA decrivait un terroir panameen a
--    Boquete, entre 1 200 et 1 800 metres, employe dans l'assemblage de
--    l'Exodus 1959. AUCUNE SOURCE NE SOUTIENT CELA. L'Exodus 1959 est
--    une ligne lancee en 2001 — d'ou le « 2001 » du champ, qui ne
--    datait donc aucune installation au Chiriquí — et elle se fabrique
--    au Honduras puis au Nicaragua, sans tabac panameen. La fiche est
--    supprimee.
--
-- LES TROIS AUTRES SE REGLENT PROPREMENT, ET DEUX D'ENTRE ELLES SE
-- LEVENT PLUTOT QU'ELLES NE SE CORRIGENT : la source disait deja ce
-- qu'il fallait, mal lu la premiere fois.
--
-- ── ORDRE DE TRAVAIL, APPRIS AUX MIGRATIONS 198 ET 199 ───
-- Les domaines cites ont ete verifies au DNS AVANT d'etre ecrits :
-- dopanama.com, lonelyplanet.com, newsroompanama.com, zechbauer.de,
-- cigardojo.com, famous-smoke.com, tampachanging.com — tous resolvent.
-- ════════════════════════════════════════════════════════

-- ════════════════════════════════════════════════════════
-- 1. BERING — la reserve tombe, la source la contredisait deja
-- ────────────────────────────────────────────────────────
-- La reserve disait : « l'attribution (Plasencia) daterait de la
-- periode du contrat ; aucune source consultee ne la confirme pour
-- aujourd'hui ». Or jaimemontilla.com, DEJA CITEE PAR LA FICHE, ecrit
-- qu'en 2002 Swisher a vendu LA MARQUE ET L'USINE a Nestor Plasencia.
-- Le corps de la fiche le disait aussi, en toutes lettres. J'avais
-- ecrit une reserve contre un fait que mes deux propres textes
-- portaient : c'est un defaut de lecture, pas un manque de source.
--
-- Au passage, la date de 1905 se precise : Manuel Corral arrive a
-- Tampa en 1905 et fonde Fernandez, Wodiska & Corral ; la raison
-- sociale Corral-Wodiska & Cia. date de 1907, quand Corral rachete les
-- parts de Fernandez. La MARQUE est datee de 1905, la MAISON de 1907 —
-- les deux chiffres qu'on trouve en ligne designent deux choses.
-- ════════════════════════════════════════════════════════

UPDATE `brands` SET
  `factory` = 'Danlí, Honduras — marque et usine vendues par Swisher à Nestor Plasencia en 2002',
  `source`  = 'jaimemontilla.com « Corral-Wodiska » et tampachanging.com (Manuel Corral à Tampa en 1905, Fernandez Wodiska & Corral, puis Corral-Wodiska & Cia. en 1907 ; rachat par Swisher International en 1985 ; production hondurienne sous contrat en 1990, puis usine de 78 000 pieds carrés à Danlí ; EN 2002 SWISHER VEND LA MARQUE ET L''USINE à Nestor Plasencia) — réserve levée : la source citée confirmait déjà l''attribution Plasencia, et le corps de la fiche aussi'
WHERE `name` = 'Bering';

-- ════════════════════════════════════════════════════════
-- 2. EXCALIBUR — une histoire batie sur une confusion de noms
-- ────────────────────────────────────────────────────────
-- CE QUE LA FICHE DISAIT, ET QUI EST FAUX : « un entrepreneur suisse
-- (Villiger Söhne), un assembleur dominicain de genie (Hendrik
-- Kelner), et des plantations honduriennes de la famille Eiroa » ;
-- « Heinrich Villiger initia le projet » ; « revendue a Altadis USA ».
--
-- CE QUE DISENT LES SOURCES :
--  · Villazon & Co., maison de Tampa dirigee par Frank Llaneza
--    (1920-2010), rachete a Fernando Palicio apres 1959 les lignes
--    Punch, Hoyo de Monterrey et Belinda (en.wikipedia.org) ;
--  · Excalibur naît d'un EMPECHEMENT DE MARQUE, pas d'une idee de
--    style : « Comme nous ne pouvons pas utiliser Hoyo de Monterrey,
--    nous avons developpe une marque appelee Excalibur, que nous
--    vendons en Allemagne et en Angleterre » — Dan Blumenthal, alors
--    president de Villazon, cite par Cigar Advisor ;
--  · Cigar Aficionado, mai 2021 : la ligne « turns 40 this year »,
--    donc 1981 ; fabriquee « at the HATSA factory in Danlí, Honduras »
--    par General Cigar, filiale du Scandinavian Tobacco Group ;
--  · 1997 : Llaneza et son associe vendent Villazon a General Cigar
--    pour 81,4 millions de dollars — General Cigar, PAS Altadis.
--
-- LA DATE RESTE DISCUTEE et la fiche le dit desormais au lieu de
-- trancher en silence : 1981 (Cigar Aficionado), 1992 comme ligne Hoyo
-- de Monterrey (Cigar Advisor), « les annees 1970 » chez des
-- detaillants. L'atlas retient 1981 et le motive.
--
-- LE CHAMP `factory` ETAIT FAUX AUSSI : « Manufactura de Puros
-- Jamastran S.A. » n'est etablie par aucune source comme fabricant
-- d'Excalibur ; Jamastrán est la VALLEE ou pousse le tabac. La source
-- la plus recente et la plus solide nomme la HATSA.
-- ════════════════════════════════════════════════════════

UPDATE `brands` SET
  `founded` = '1981 — Danlí, Honduras',
  `factory` = 'HATSA (Honduras American Tabaco S.A.), Danlí, Honduras — General Cigar / Scandinavian Tobacco Group',
  `source`  = 'cigaraficionado.com « Hoyo Excalibur Celebrates 40 Years » (mai 2021 : « turns 40 this year », donc 1981 ; fabriquée à la HATSA de Danlí par General Cigar, filiale du Scandinavian Tobacco Group) et « Frank Llaneza: 1920—2010 » (Villazon vendue à General Cigar en 1997 pour 81,4 M$) ; famous-smoke.com / Cigar Advisor pour la citation de Dan Blumenthal et la date de 1992 comme ligne Hoyo ; en.wikipedia.org « Hoyo de Monterrey » pour le rachat des lignes Palicio',
  `history` = 'Excalibur est une marque née d''un empêchement juridique, et non d''une intention de style. Villazon & Co., la maison de Tampa que dirigeait Frank Llaneza, avait racheté à Fernando Palicio, après la nationalisation cubaine de 1959, les lignes Punch, Hoyo de Monterrey et Belinda. Elle pouvait les vendre aux États-Unis ; elle ne pouvait pas se servir du nom Hoyo de Monterrey partout ailleurs. « Comme nous ne pouvons pas utiliser Hoyo de Monterrey, nous avons développé une marque appelée Excalibur, que nous vendons en Allemagne et en Angleterre », expliquait Dan Blumenthal, alors président de Villazon, dans un entretien que Cigar Advisor cite encore. Le nom du roi Arthur n''est donc pas une trouvaille de publicitaire : c''est un contournement de marque.

Llaneza avait découvert le Honduras en 1960, deux ans avant l''embargo, et Villazon y transféra sa production roulée à la main au cours de la décennie, ne gardant à Tampa qu''un atelier réduit. C''est de là que vient le profil de la ligne : les tabacs de la vallée de Jamastrán, terreux, boisés, francs à la combustion, dans un registre plus rond que puissant.

La date de naissance n''est pas établie de la même façon par tout le monde, et cette fiche le dit plutôt que de choisir en silence. Cigar Aficionado, en mai 2021, disait la ligne quadragénaire cette année-là — donc 1981. Cigar Advisor date de 1992 son lancement comme ligne Hoyo de Monterrey, ce qui se comprend si l''on distingue la marque européenne de son arrivée sous l''enseigne Hoyo aux États-Unis. Des détaillants évoquent les années 1970. L''atlas retient 1981, sur la source la plus précise.

En 1997, Llaneza et son associé vendirent Villazon à General Cigar pour 81,4 millions de dollars. Excalibur appartient depuis à cet ensemble, aujourd''hui filiale du Scandinavian Tobacco Group, et se fabrique à la HATSA de Danlí — la fabrique où furent roulés pendant des décennies El Rey del Mundo, Hoyo de Monterrey et Punch.',
  `history_en` = 'Excalibur was born of a trademark obstacle, not of a stylistic intention. Villazon & Co., the Tampa house run by Frank Llaneza, had bought from Fernando Palicio, after the Cuban nationalisation of 1959, the Punch, Hoyo de Monterrey and Belinda lines. It could sell them in the United States; it could not use the Hoyo de Monterrey name everywhere else. "Because we can''t use Hoyo de Monterrey, we developed a brand called Excalibur, which we sell in Germany and England," explained Dan Blumenthal, then chairman of Villazon, in an interview Cigar Advisor still quotes. King Arthur''s sword, then, is not an advertising find: it is a way around a trademark.

Llaneza had discovered Honduras in 1960, two years before the embargo, and Villazon moved its hand-rolled production there during that decade, keeping only a reduced workshop in Tampa. That is where the line''s profile comes from: the tobaccos of the Jamastrán valley, earthy, woody, clean-burning, in a register more round than powerful.

The founding date is not established the same way by everyone, and this entry says so rather than choosing in silence. Cigar Aficionado, in May 2021, called the line forty years old that year — so 1981. Cigar Advisor dates its launch as a Hoyo de Monterrey line to 1992, which makes sense if one separates the European brand from its arrival under the Hoyo name in the United States. Retailers mention the 1970s. The atlas keeps 1981, on the most precise source.

In 1997, Llaneza and his partner sold Villazon to General Cigar for 81.4 million dollars. Excalibur has belonged to that group ever since — today a subsidiary of Scandinavian Tobacco Group — and is made at the HATSA factory in Danlí, where El Rey del Mundo, Hoyo de Monterrey and Punch were rolled for decades.',
  `history_es` = 'Excalibur nació de un impedimento de marca, no de una intención de estilo. Villazon & Co., la casa de Tampa dirigida por Frank Llaneza, había comprado a Fernando Palicio, tras la nacionalización cubana de 1959, las líneas Punch, Hoyo de Monterrey y Belinda. Podía venderlas en Estados Unidos; no podía usar el nombre Hoyo de Monterrey en el resto del mundo. «Como no podemos usar Hoyo de Monterrey, desarrollamos una marca llamada Excalibur, que vendemos en Alemania e Inglaterra», explicaba Dan Blumenthal, entonces presidente de Villazon, en una entrevista que Cigar Advisor sigue citando. La espada del rey Arturo no es, pues, un hallazgo publicitario: es un rodeo legal.

Llaneza había descubierto Honduras en 1960, dos años antes del embargo, y Villazon trasladó allí su producción hecha a mano a lo largo de esa década, conservando en Tampa solo un taller reducido. De ahí viene el perfil de la línea: los tabacos del valle de Jamastrán, terrosos, amaderados, de combustión franca, en un registro más redondo que potente.

La fecha de nacimiento no está establecida igual por todos, y esta ficha lo dice en lugar de elegir en silencio. Cigar Aficionado, en mayo de 2021, daba la línea por cuarentona ese año — es decir, 1981. Cigar Advisor fecha en 1992 su lanzamiento como línea Hoyo de Monterrey, lo que se entiende si se distingue la marca europea de su llegada bajo el nombre Hoyo en Estados Unidos. Algunos minoristas hablan de los años setenta. El atlas retiene 1981, por ser la fuente más precisa.

En 1997, Llaneza y su socio vendieron Villazon a General Cigar por 81,4 millones de dólares. Excalibur pertenece desde entonces a ese conjunto, hoy filial del Scandinavian Tobacco Group, y se fabrica en la HATSA de Danlí, la fábrica donde se liaron durante décadas El Rey del Mundo, Hoyo de Monterrey y Punch.',
  `history_de` = 'Excalibur entstand aus einem markenrechtlichen Hindernis, nicht aus einer stilistischen Absicht. Villazon & Co., das von Frank Llaneza geführte Haus aus Tampa, hatte Fernando Palicio nach der kubanischen Verstaatlichung von 1959 die Linien Punch, Hoyo de Monterrey und Belinda abgekauft. Verkaufen durfte es sie in den Vereinigten Staaten; den Namen Hoyo de Monterrey überall sonst zu führen, war ihm verwehrt. „Da wir Hoyo de Monterrey nicht verwenden können, haben wir eine Marke namens Excalibur entwickelt, die wir in Deutschland und England verkaufen", erklärte Dan Blumenthal, damals Vorsitzender von Villazon, in einem Interview, das Cigar Advisor bis heute zitiert. Das Schwert von König Artus ist also kein Werbeeinfall, sondern ein Umweg um ein Markenrecht.

Llaneza hatte Honduras 1960 entdeckt, zwei Jahre vor dem Embargo, und Villazon verlagerte seine handgerollte Produktion im Lauf des Jahrzehnts dorthin; in Tampa blieb nur eine kleine Werkstatt. Daher stammt das Profil der Linie: die Tabake des Jamastrán-Tals, erdig, holzig, mit sauberem Abbrand, eher rund als kraftvoll.

Das Gründungsjahr wird nicht von allen gleich angegeben, und dieser Eintrag sagt das, statt stillschweigend zu wählen. Cigar Aficionado nannte die Linie im Mai 2021 vierzigjährig — also 1981. Cigar Advisor datiert ihren Start als Hoyo-de-Monterrey-Linie auf 1992, was sich erklärt, wenn man die europäische Marke von ihrer Ankunft unter dem Hoyo-Namen in den USA unterscheidet. Händler sprechen von den 1970er-Jahren. Der Atlas hält an 1981 fest, nach der genauesten Quelle.

1997 verkauften Llaneza und sein Partner Villazon für 81,4 Millionen Dollar an General Cigar. Seither gehört Excalibur zu dieser Gruppe, heute eine Tochter der Scandinavian Tobacco Group, und wird in der HATSA in Danlí gefertigt — jener Fabrik, in der jahrzehntelang El Rey del Mundo, Hoyo de Monterrey und Punch gerollt wurden.',
  `history_zh` = 'Excalibur（王者之剑）的诞生源于一个商标障碍，而非风格构想。由弗兰克·利亚内萨执掌的坦帕老号 Villazon & Co.，在1959年古巴国有化之后，从费尔南多·帕利西奥手中买下了 Punch、Hoyo de Monterrey 与 Belinda 三个系列。它可以在美国销售这些牌子，却无法在其他地方使用 Hoyo de Monterrey 之名。「因为我们不能用 Hoyo de Monterrey，所以我们开发了一个叫 Excalibur 的牌子，在德国和英国销售。」时任 Villazon 董事长的丹·布卢门塔尔如此解释——这段话至今仍被 Cigar Advisor 引用。可见亚瑟王之剑并非广告灵感，而是一条绕开商标的路。

利亚内萨1960年初识洪都拉斯，比禁运早两年；Villazon 在那十年间将手工卷制迁往当地，坦帕只留下一个小作坊。系列的风味由此而来：哈马斯特兰河谷的烟叶，土气、木质、燃烧干净，圆润多于强劲。

创立年份并非人人一致，本词条选择说明分歧，而不是默默择一。《雪茄爱好者》2021年5月称该系列当年「四十岁」，即1981年。Cigar Advisor 则将其作为 Hoyo de Monterrey 系列的推出定在1992年——若把欧洲的牌子与它在美国以 Hoyo 之名登场区分开来，这就说得通。零售商则提到1970年代。本图集采信最精确的来源，取1981年。

1997年，利亚内萨与合伙人以8140万美元将 Villazon 售予 General Cigar。此后 Excalibur 一直属于该集团——今日为斯堪的纳维亚烟草集团的子公司——在丹利的 HATSA 厂制造；那正是数十年间卷制 El Rey del Mundo、Hoyo de Monterrey 与 Punch 的厂房。',
  `history_ar` = 'وُلدت إكسكاليبر من عائق يتعلق بالعلامة التجارية، لا من نيّة أسلوبية. فقد اشترت شركة فيّازون (Villazon & Co.)، وهي دار من تامبا كان يديرها فرانك يانيسا، من فرناندو باليسيو، بعد التأميم الكوبي سنة 1959، خطوط بونتش وأويو دي مونتيري وبليندا. كان بوسعها بيعها في الولايات المتحدة، لكن لم يكن بوسعها استعمال اسم أويو دي مونتيري في سائر البلدان. قال دان بلومنتال، رئيس فيّازون آنذاك، في حديث ما زالت مجلة Cigar Advisor تنقله: «بما أننا لا نستطيع استعمال أويو دي مونتيري، طوّرنا علامة اسمها إكسكاليبر نبيعها في ألمانيا وإنجلترا». فسيف الملك آرثر إذن ليس ابتكارًا إعلانيًا، بل التفافًا على حقّ علامة.

كان يانيسا قد اكتشف هندوراس سنة 1960، أي قبل الحصار بعامين، ونقلت فيّازون إليها إنتاجها الملفوف يدويًا خلال ذلك العقد، ولم تُبقِ في تامبا سوى ورشة مصغّرة. من هناك يأتي طابع الخط: تبغ وادي خاماستران، ترابيّ، خشبيّ، صافي الاحتراق، في سجلّ مستدير أكثر منه قويًّا.

سنة النشأة ليست مقرَّرة على نحو واحد عند الجميع، وهذه البطاقة تقول ذلك بدل أن تختار في صمت. فمجلة Cigar Aficionado وصفت الخط في أيار/مايو 2021 بأنه بلغ الأربعين تلك السنة، أي 1981. أما Cigar Advisor فتؤرّخ إطلاقه كخط تابع لأويو دي مونتيري بسنة 1992، وهو ما يُفهم إذا فُرِّق بين العلامة الأوروبية وبين وصولها إلى الولايات المتحدة تحت اسم أويو. ويذكر بائعون سبعينيات القرن الماضي. ويأخذ الأطلس بسنة 1981، اعتمادًا على أدقّ المصادر.

وفي 1997 باع يانيسا وشريكه فيّازون إلى جنرال سيغار بمبلغ 81,4 مليون دولار. ومنذ ذلك الحين تنتمي إكسكاليبر إلى تلك المجموعة، وهي اليوم تابعة لمجموعة التبغ الإسكندنافية، وتُصنع في مصنع HATSA بمدينة دانلي — المصنع الذي لُفّت فيه عقودًا طويلة سجائر إل ري ديل موندو وأويو دي مونتيري وبونتش.'
WHERE `name` = 'Excalibur';

-- ── 2 bis. LA MEME INVENTION VIVAIT DANS `celebrities` ───
-- Deux anecdotes, entierement fabriquees, et la seconde prêtait une
-- attitude a une personne reelle et nommee : « Le patriarche suisse
-- considerait Excalibur comme sa plus grande fierte [...] Il refusait
-- categoriquement qu'on retouche l'assemblage. » Heinrich Villiger n'a
-- rien a voir avec cette marque.
--
-- Reecrire l'historique sans nettoyer ce champ aurait laisse la fiche
-- se contredire elle-meme, un ecran plus bas. Une seule entree la
-- remplace, sur des faits que la source de la fiche porte deja, sans
-- citation et sans nommer de revue dans le corps du texte.
UPDATE `brands` SET
  `celebrities` = '[{"name": "Frank Llaneza", "anecdote": "Président de Villazon & Co., souvent décrit comme le parrain du cigare hondurien — un titre qu''il relativisait, rappelant que l''industrie s''y développait déjà lors de sa première visite, en 1960, deux ans avant l''embargo. Il vendit Villazon à General Cigar en 1997 et travaillait encore à de nouveaux assemblages, au Nicaragua, à sa mort en 2010."}]',
  `celebrities_en` = '[{"name": "Frank Llaneza", "anecdote": "President of Villazon & Co., often described as the godfather of the Honduran cigar — a title he played down, recalling that the industry was already developing there on his first visit, in 1960, two years before the embargo. He sold Villazon to General Cigar in 1997 and was still working on new blends, in Nicaragua, when he died in 2010."}]',
  `celebrities_es` = '[{"name": "Frank Llaneza", "anecdote": "Presidente de Villazon & Co., a menudo descrito como el padrino del puro hondureño — un título que él relativizaba, recordando que la industria ya se desarrollaba allí en su primera visita, en 1960, dos años antes del embargo. Vendió Villazon a General Cigar en 1997 y seguía trabajando en nuevas ligas, en Nicaragua, cuando murió en 2010."}]',
  `celebrities_de` = '[{"name": "Frank Llaneza", "anecdote": "Präsident von Villazon & Co., oft als Pate der honduranischen Zigarre bezeichnet — ein Titel, den er relativierte: Die Industrie habe sich dort schon bei seinem ersten Besuch 1960 entwickelt, zwei Jahre vor dem Embargo. 1997 verkaufte er Villazon an General Cigar und arbeitete bis zu seinem Tod 2010 in Nicaragua noch an neuen Blends."}]',
  `celebrities_zh` = '[{"name": "Frank Llaneza", "anecdote": "Villazon & Co. 的总裁，常被称作洪都拉斯雪茄的教父——他本人淡化这一称号，说自己1960年初访时当地产业已在发展，那还早于禁运两年。1997年他将 Villazon 售予 General Cigar；直至2010年去世，他仍在尼加拉瓜调配新的配方。"}]',
  `celebrities_ar` = '[{"name": "Frank Llaneza", "anecdote": "رئيس شركة فيّازون، ويُوصف كثيرًا بأنّه عرّاب السيجار الهندوراسي — وهو لقب كان يقلّل من شأنه، مذكّرًا بأنّ الصناعة كانت تنمو هناك أصلًا حين زارها أوّل مرّة سنة 1960، أي قبل الحصار بعامين. باع فيّازون إلى جنرال سيغار سنة 1997، وظلّ يعمل على مزجات جديدة في نيكاراغوا حتى وفاته سنة 2010."}]'
WHERE `name` = 'Excalibur';

-- ════════════════════════════════════════════════════════
-- 3. SUERDIECK — deux dates qui ne se contredisent pas
-- ────────────────────────────────────────────────────────
-- La reserve opposait « decembre 1999 » (les sources bahianaises) a
-- « 2000 » (le champ de l'atlas). LES DEUX SONT VRAIES : elles ne
-- designent pas le meme evenement. L'activite s'arrete a la fin de
-- 1999 ; la fermeture de la derniere unite, a Cruz das Almas, avec le
-- licenciement des cent derniers employes, est de 2000 — c'est ce
-- qu'ecrit pt.wikipedia.org, deja citee par la fiche.
--
-- Aucune donnee nouvelle ici : seulement la lecture juste de deux
-- sources que la fiche portait deja. Le champ `founded` garde donc
-- 2000 pour la fermeture, en nommant l'arret de 1999.
-- ════════════════════════════════════════════════════════

UPDATE `brands` SET
  `founded` = '1892 — Cruz das Almas, Bahia · fermée 1999-2000',
  `factory` = 'Cruz das Almas, Bahia — activité arrêtée fin 1999, dernière usine fermée en 2000',
  `source`  = 'pt.wikipedia.org « Suerdieck Charutos » (« No ano 2000 [...] fechou sua última unidade na cidade de Cruz das Almas, dispensando os cem funcionários » ; environ cinq millions de pièces produites en 1999, premier fabricant brésilien) et gestoesinspiradoras.ufba.br « August Wilhelm Suerdieck » (arrivé en Bahia en 1888 ; société de 1892 ; fabrication à Maragojipe dès 1905 ; fin des activités à la fin de 1999) — réserve levée : l''arrêt de l''activité et la fermeture de la dernière usine sont deux moments, pas une contradiction'
WHERE `name` = 'Suerdieck';

-- ════════════════════════════════════════════════════════
-- 4. CARLOS TORAÑO PANAMA — une fiche sans fondement
-- ────────────────────────────────────────────────────────
-- LA RESERVE DISAIT : « aucune source consultee ne date l'installation
-- au Chiriquí ». La verification a montre pire : rien n'etablit qu'un
-- cigare Toraño ait jamais ete FABRIQUE au Panama, ni qu'un tabac de
-- Chiriquí soit entre dans un de leurs assemblages.
--
--  · Le « 2001 » du champ correspond au lancement de la ligne Carlos
--    Toraño Exodus 1959 (cigardojo.com : « The line was initially
--    introduced in 2001 with the Carlos Toraño Exodus 1959 »). Il ne
--    datait aucune installation.
--  · L'Exodus se fabrique au Honduras puis, apres le rachat par
--    General Cigar en 2014, a la STG d'Estelí au Nicaragua. Son
--    assemblage ne contient pas de tabac panameen.
--  · Cigar Journal et Cigar Aficionado, deja cites par la fiche,
--    decrivent des fermes et fabriques en Republique dominicaine, au
--    Honduras et au Nicaragua. Le Panama n'apparaît que dans la liste
--    des pays ou des MEMBRES DE LA FAMILLE se sont disperses apres
--    1959 — ce qui n'est pas une implantation industrielle.
--
-- LA REGLE DE CET ATLAS EST LE LIEU DE FABRICATION. Une fiche classee
-- au Panama pour un cigare qui n'y a jamais ete roule est une erreur
-- de classement doublee d'un terroir invente. Elle est supprimee.
--
-- CE QUI RESTE VRAI ET N'EST PAS PERDU : la trajectoire de la famille
-- Toraño (Santiago Toraño arrive de l'Espagne a Cuba en 1916, vingt-
-- trois fermes dans les annees 1930, l'exil de 1959) est documentee,
-- mais elle appartient aux pays ou la famille a effectivement produit.
-- ════════════════════════════════════════════════════════

DELETE FROM `translation_status`
 WHERE `entite` = 'brands' AND `entite_id` = 'Carlos Toraño Panama';

DELETE FROM `brands` WHERE `name` = 'Carlos Toraño Panama';

-- ── Le Panama, tel que les sources le decrivent ──────────
-- Le pays a une industrie du cigare premium REELLE mais minuscule et
-- largement effondree, et c'est cela qu'il faut ecrire :
--  · mars 1981, Gilberto Oliva et Nestor Plasencia apportent des
--    semences cubaines dans la province de Coclé ; la Coclé Tobacco
--    Factory ouvre a Peñonomé la meme annee, Tabacos Panama S.A. a La
--    Pintada en 1984 (dopanama.com) ;
--  · fevrier 1986, Miriam Padilla — qui avait ete directrice de
--    production chez Gilberto Oliva — fonde Joyas de Panamá a La
--    Pintada ; roulage entierement a la main, semence cubaine ; son
--    fils Braulio Zurita a rouvert l'atelier en 2023 apres la
--    fermeture liee au covid (dopanama.com, lonelyplanet.com) ;
--  · en 2025, un reportage de newsroompanama.com parti a la recherche
--    des cigares panameens trouve Don Juan Cigars a l'arret et decrit
--    une industrie de Coclé ruinee par la mauvaise gestion, des
--    accusations de fraude aux certificats fiscaux et des salaires
--    impayes.
--
-- « Production artisanale croissance » etait donc faux dans les deux
-- sens : ce n'est pas en croissance, et l'artisanat qui subsiste tient
-- a un atelier.
--
-- AUCUNE FICHE DE MAISON N'EST ECRITE EN REMPLACEMENT. Joyas de
-- Panamá le meriterait, mais les sources dont je dispose sont un site
-- touristique et une notice de guide : ecrire une fiche complete
-- la-dessus repeterait exactement la faute que cette migration
-- corrige.
--
-- ET LE PAYS NE L'ANNONCE PAS NON PLUS DANS `brands`. Le controle 7 de
-- coherence_check.php le refuse a juste titre : un nom annonce la
-- ouvre une carte sur le globe, et une carte qui n'ouvre sur rien est
-- une promesse cassee. Le nom vit donc dans `tabacaleras`, qui decrit
-- sans promettre de fiche.
--
-- LE PANAMA EST DONC LE PREMIER PAYS DE CET ATLAS SANS AUCUNE MAISON.
-- C'est un etat honnête, pas un accident : il dit qu'on connaît le
-- pays et qu'on n'a pas de quoi y ecrire une fiche.
-- ════════════════════════════════════════════════════════

UPDATE `producer_countries` SET
  `tabacaleras` = '["Joyas de Panamá — La Pintada, Coclé, 1986, Miriam Padilla","Tabacos Panamá S.A. — La Pintada, 1984","Coclé Tobacco Factory — Peñonomé, 1981"]',
  `brands` = '[]',
  `production`    = 'Artisanale, très réduite',
  `production_en` = 'Artisanal, very small',
  `production_es` = 'Artesanal, muy reducida',
  `production_de` = 'Handwerklich, sehr gering',
  `production_zh` = '手工，规模极小',
  `production_ar` = 'حرفي، محدود جدًّا',
  `notes`    = 'Industrie née en 1981 de semences cubaines apportées à Coclé par Gilberto Oliva et Nestor Plasencia. Largement effondrée depuis : un reportage de 2025 trouve les ateliers à l''arrêt.',
  `notes_en` = 'An industry born in 1981 from Cuban seed brought to Coclé by Gilberto Oliva and Nestor Plasencia. Largely collapsed since: a 2025 report found the workshops idle.',
  `notes_es` = 'Industria nacida en 1981 de semillas cubanas llevadas a Coclé por Gilberto Oliva y Nestor Plasencia. Muy venida a menos: un reportaje de 2025 halló los talleres parados.',
  `notes_de` = 'Eine Industrie, die 1981 aus kubanischem Saatgut entstand, das Gilberto Oliva und Nestor Plasencia nach Coclé brachten. Seither weitgehend zusammengebrochen: eine Reportage von 2025 fand die Werkstätten stillstehen.',
  `notes_zh` = '该产业始于1981年，吉尔贝托·奥利瓦与内斯托尔·普拉森西亚将古巴烟种带到科克莱省。此后大体崩解：2025年的一篇报道发现作坊已停工。',
  `notes_ar` = 'صناعة نشأت سنة 1981 من بذور كوبية جلبها غيلبرتو أوليفا ونستور بلاسينسيا إلى مقاطعة كوكلي. ثم انهارت إلى حدّ بعيد: وجد تحقيق صحفي سنة 2025 الورش متوقّفة.'
WHERE `id` = 'panama';

-- ── 4 bis. LA FABRICATION ALLAIT PLUS LOIN QUE LA FICHE ──
-- En retirant la marque, `habanos_presence` s'est trouvee porter la
-- meme invention, en six langues et avec des chiffres :
--
--   ceo         « Carlos Toraño (pionnier) »
--   revenue     « ~$12M USD »
--   employees   « 500+ »
--   factories   Toraño Panama, Volcán, Chiriquí, fondee en 2001,
--               produisant « Carlos Toraño Exodus 1959 »
--   marques     « Carlos Toraño Panama », « La Palina Panama »
--   description un terroir a 1 400 m sur les flancs du Volcán Barú
--
-- AUCUN DE CES CHIFFRES N'A DE SOURCE. La Palina est une maison reelle
-- mais elle n'est pas panameenne. Un chiffre d'affaires et un effectif
-- inventes sont pires qu'un champ vide : ils se citent.
--
-- Ce qui est documente prend la place, et ce qui ne l'est pas devient
-- NULL. Un champ vide dit « on ne sait pas » ; « ~$12M USD » dit « on
-- sait », et c'est faux.
-- ════════════════════════════════════════════════════════

UPDATE `habanos_presence` SET
  `founded`   = 'Semence cubaine portée à Coclé en 1981',
  `ownership` = 'Petites structures indépendantes',
  `hq`        = 'Coclé et Chiriquí, Panama',
  `ceo`       = NULL,
  `revenue`   = NULL,
  `employees` = NULL,
  `factories` = '[{"name":"Joyas de Panamá","city":"La Pintada, Coclé","founded":"1986","marques":[]},{"name":"Tabacos Panamá S.A.","city":"La Pintada","founded":"1984","marques":[]},{"name":"Coclé Tobacco Factory","city":"Peñonomé","founded":"1981","marques":[]}]',
  `marques_officielles` = '[]',
  `distributeurs`  = '[]',
  `certifications` = '[]',
  `ownership_en` = 'Small independent operations',
  `ownership_es` = 'Pequeñas estructuras independientes',
  `ownership_de` = 'Kleine unabhängige Betriebe',
  `ownership_zh` = '小型独立作坊',
  `ownership_ar` = 'منشآت صغيرة مستقلّة',
  `description` = 'Le Panama n''a pas de représentation Habanos. Son industrie du cigare premium naît en mars 1981, quand Gilberto Oliva et Nestor Plasencia apportent des semences cubaines dans la province de Coclé : la Coclé Tobacco Factory ouvre à Peñonomé la même année, Tabacos Panamá S.A. à La Pintada en 1984, et Miriam Padilla fonde Joyas de Panamá en février 1986. Du tabac est cultivé dans le Chiriquí. Cette industrie est aujourd''hui largement effondrée — mauvaise gestion, accusations de fraude aux certificats fiscaux, salaires impayés — et un reportage de 2025 parti à la recherche des cigares panaméens a trouvé les ateliers à l''arrêt. Cet atlas ne porte donc aucune fiche de maison panaméenne : il n''a pas de source assez solide pour en écrire une.',
  `description_en` = 'Panama has no Habanos office. Its premium cigar industry began in March 1981, when Gilberto Oliva and Nestor Plasencia brought Cuban seed to Coclé province: the Coclé Tobacco Factory opened at Peñonomé that year, Tabacos Panamá S.A. at La Pintada in 1984, and Miriam Padilla founded Joyas de Panamá in February 1986. Tobacco is grown in Chiriquí. That industry has largely collapsed — mismanagement, accusations of tax-credit fraud, unpaid wages — and a 2025 report that went looking for Panamanian cigars found the workshops idle. This atlas therefore carries no Panamanian house: it has no source solid enough to write one.',
  `description_es` = 'Panamá no tiene representación de Habanos. Su industria del puro premium nace en marzo de 1981, cuando Gilberto Oliva y Nestor Plasencia llevan semillas cubanas a la provincia de Coclé: la Coclé Tobacco Factory abre en Penonomé ese mismo año, Tabacos Panamá S.A. en La Pintada en 1984, y Miriam Padilla funda Joyas de Panamá en febrero de 1986. Se cultiva tabaco en Chiriquí. Esa industria está hoy muy venida a menos — mala gestión, acusaciones de fraude con certificados fiscales, salarios impagados — y un reportaje de 2025 que salió a buscar puros panameños halló los talleres parados. Este atlas no incluye por ello ninguna casa panameña: no tiene una fuente lo bastante sólida para escribirla.',
  `description_de` = 'Panama hat keine Habanos-Vertretung. Seine Premiumzigarrenindustrie beginnt im März 1981, als Gilberto Oliva und Nestor Plasencia kubanisches Saatgut in die Provinz Coclé bringen: Im selben Jahr eröffnet die Coclé Tobacco Factory in Penonomé, 1984 Tabacos Panamá S.A. in La Pintada, und im Februar 1986 gründet Miriam Padilla Joyas de Panamá. In Chiriquí wird Tabak angebaut. Diese Industrie ist heute weitgehend zusammengebrochen — Misswirtschaft, Vorwürfe des Betrugs mit Steuergutschriften, unbezahlte Löhne — und eine Reportage von 2025, die panamaische Zigarren suchte, fand die Werkstätten stillstehen. Dieser Atlas führt daher kein panamaisches Haus: Es fehlt eine belastbare Quelle dafür.',
  `description_zh` = '巴拿马没有哈瓦那雪茄代表处。其高级雪茄产业始于1981年3月，吉尔贝托·奥利瓦与内斯托尔·普拉森西亚将古巴烟种带到科克莱省：同年科克莱烟草厂在佩诺诺梅开业，1984年 Tabacos Panamá S.A. 在拉平塔达设立，1986年2月米里亚姆·帕迪利亚创办 Joyas de Panamá。奇里基省种植烟草。这一产业如今大体崩解——经营不善、涉税凭证欺诈指控、拖欠工资——2025年一篇寻访巴拿马雪茄的报道发现作坊已停工。因此本图集不收录任何巴拿马老号：尚无足够可靠的来源可据以书写。',
  `description_ar` = 'لا يوجد في بنما تمثيل لهابانوس. بدأت صناعة السيجار الفاخر فيها في آذار/مارس 1981، حين جلب غيلبرتو أوليفا ونستور بلاسينسيا بذورًا كوبية إلى مقاطعة كوكلي: افتُتح مصنع كوكلي للتبغ في بينونومي في العام نفسه، وTabacos Panamá S.A. في لا بينتادا سنة 1984، وأسّست مِريام باديّا شركة Joyas de Panamá في شباط/فبراير 1986. ويُزرع التبغ في تشيريكي. وقد انهارت هذه الصناعة اليوم إلى حدّ بعيد — سوء إدارة، واتّهامات باحتيال على الشهادات الضريبية، وأجور غير مدفوعة — ووجد تحقيق صحفي سنة 2025 خرج بحثًا عن السيجار البنمي الورشَ متوقّفة. لذلك لا يحمل هذا الأطلس أيّ بطاقة لدار بنمية: ليس لديه مصدر متين بما يكفي لكتابتها.'
WHERE `country_id` = 'panama';

-- ════════════════════════════════════════════════════════
-- 5. CASDAGLI — la tension du Costa Rica, tranchee par les faits
-- ────────────────────────────────────────────────────────
-- LA TENSION SIGNALEE A LA 193 : la fiche Casdagli disait le Costa
-- Rica « sans terroir tabacole notable », alors que la fiche Vegas de
-- Santiago decrit, dans le meme pays, une maison qui cultive son tabac
-- a plus de 1 100 m depuis plus de quatre-vingts ans.
--
-- LA VERIFICATION DONNE MIEUX QU'UN ARBITRAGE : LES DEUX MAISONS SONT
-- AU MEME ENDROIT. Casdagli ecrit elle-meme que sa cooperation « avec
-- Tabacos de Costa Rica S.A., ALORS CONNUE SOUS LE NOM DE VEGAS
-- SANTIAGO, a commence en 2012 », et que la ligne Villa Casdagli est
-- « faite au Costa Rica par Tabacos de Costa Rica sous la supervision
-- du maitre assembleur Don Olman Guzman ». Zechbauer, de son cote,
-- nomme Olman León Guzmán chef de la fabrique Vegas de Santiago et
-- ecrit qu'on y cultive le tabac « depuis plus de 80 ans » a plus de
-- 1 100 metres. Meme lieu, meme homme, meme altitude.
--
-- La phrase a corriger n'etait donc pas une nuance : elle niait
-- l'existence du terroir a l'endroit exact ou la maison fait rouler
-- ses cigares.
--
-- CE QUI SURVIT DE L'IDEE DE DEPART, et qui est dit autrement : la
-- FEUILLE de Casdagli vient d'ailleurs — Perou, Nicaragua, Equateur,
-- Republique dominicaine, cape et sous-cape equatoriennes. Le pays a
-- ete choisi pour l'atelier ; mais pour ce que cet atelier sait faire,
-- non parce que la terre autour serait vide.
--
-- LE CHAMP `factory` ETAIT FAUX : « Tabacalera Aragón » n'apparaît
-- dans aucune source de la maison. Casdagli nomme DEUX ateliers
-- costariciens, et la regle de cet atlas est de nommer les
-- collaborations et de dire qui fait quoi.
-- ════════════════════════════════════════════════════════

UPDATE `brands` SET
  `founded` = '1997 — Bespoke Cigars jusqu''au printemps 2018',
  `factory` = 'IGM, San José (Daughters of the Wind, Cypher 3311) + Tabacos de Costa Rica, Puriscal (Villa Casdagli)',
  `source`  = 'casdaglicigars.com « The Story of Casdagli Cigars » (fondée en 1997 sous le nom de Bespoke Cigars, rebaptisée au printemps 2018 ; roulage à Cuba par Carlos Valdez Mosquera jusqu''en 2013, puis Kelner Boutique Factory, puis IGM à San José et Tabacos de Costa Rica à Puriscal) et « Casdagli Cigars launches the Villa Casdagli Line » (« Tabacos de Costa Rica SA, then known as Vegas Santiago », coopération depuis 2012 ; maître assembleur Don Olman Guzman ; cape et sous-cape Équateur, tripe Pérou/Nicaragua/Équateur/Rép. dominicaine)',
  `history` = 'Casdagli est une maison britannique qui ne possède pas de champs. Jeremy Casdagli l''a fondée en 1997 sous le nom de Bespoke Cigars ; elle a pris celui de son fondateur au printemps 2018. Ce changement dit quelque chose de son propos : elle assume d''être une signature plutôt qu''une manufacture, et travaille en séries courtes plutôt qu''en catalogue permanent.

Ses cigares ont changé de pays trois fois. Ils ont d''abord été roulés à Cuba, par un seul torcedor, Carlos Valdez Mosquera, jusqu''à son retrait en 2013. La production est ensuite passée à la Kelner Boutique Factory de Hendrik Kelner Jr., à Santiago de los Caballeros, en République dominicaine. Elle est aujourd''hui costaricienne et partagée entre deux ateliers : IGM, à San José, pour Daughters of the Wind et Cypher 3311 ; Tabacos de Costa Rica, à Puriscal, pour la ligne Villa Casdagli, sous la conduite du maître assembleur Olman Guzmán.

Cette seconde adresse n''est pas quelconque, et elle corrige ce que cette fiche affirmait auparavant. Tabacos de Costa Rica S.A. est, de l''aveu même de la maison, l''atelier « alors connu sous le nom de Vegas Santiago » — celui-là même qui, à Puriscal, cultive son tabac à plus de mille cent mètres depuis plus de quatre-vingts ans, et qui a sa propre fiche dans cet atlas. Le Costa Rica n''est donc pas un pays sans terroir tabacole : il en a un, et Casdagli fait rouler ses Villa Casdagli à l''endroit précis où il se trouve.

Ce qui reste vrai, c''est que la feuille vient d''ailleurs. Les Villa Casdagli assemblent des tabacs du Pérou, du Nicaragua, de l''Équateur et de la République dominicaine, sous cape et sous-cape équatoriennes ; quatre d''entre eux passent une seconde fermentation, dite mejorado, de deux à quatre mois. Jeremy Casdagli raconte avoir découvert dans cet atelier, en 2012, le tabac péruvien devenu son préféré à l''assemblage. Le pays de production a bien été choisi pour l''atelier — mais pour ce que cet atelier sait faire, non parce que la terre autour serait vide.

La maison appartient à la catégorie dite « boutique » : celles dont la production annuelle se compte en dizaines de milliers de cigares là où les grandes en comptent des dizaines de millions. C''est une différence d''échelle avant d''être une différence de qualité, et elle explique l''essentiel — la disponibilité irrégulière, l''absence de réseau de distribution large, et une notoriété qui circule surtout entre amateurs.',
  `history_en` = 'Casdagli is a British house that owns no fields. Jeremy Casdagli founded it in 1997 under the name Bespoke Cigars; it took its founder''s name in the spring of 2018. That change says something about its purpose: it accepts being a signature rather than a manufactory, and works in short series rather than a permanent catalogue.

Its cigars have changed country three times. They were first rolled in Cuba, by a single torcedor, Carlos Valdez Mosquera, until he stepped back in 2013. Production then moved to Hendrik Kelner Jr.''s Kelner Boutique Factory in Santiago de los Caballeros, Dominican Republic. Today it is Costa Rican and split between two workshops: IGM, in San José, for Daughters of the Wind and Cypher 3311; Tabacos de Costa Rica, in Puriscal, for the Villa Casdagli line, under master blender Olman Guzmán.

That second address is not just any address, and it corrects what this entry used to claim. Tabacos de Costa Rica S.A. is, by the house''s own account, the workshop "then known as Vegas Santiago" — the very one that, at Puriscal, has grown its tobacco above eleven hundred metres for more than eighty years, and that has its own entry in this atlas. Costa Rica is therefore not a country without tobacco terroir: it has one, and Casdagli has its Villa Casdagli rolled at the exact spot where it lies.

What remains true is that the leaf comes from elsewhere. The Villa Casdagli blends tobaccos from Peru, Nicaragua, Ecuador and the Dominican Republic under an Ecuadorian wrapper and binder; four of them undergo a second fermentation, called mejorado, of two to four months. Jeremy Casdagli says it was in this workshop, in 2012, that he discovered the Peruvian tobacco that became his favourite for blending. The country of production was indeed chosen for the workshop — but for what that workshop knows how to do, not because the land around it was empty.

The house belongs to the so-called boutique category: those whose annual output is counted in tens of thousands of cigars where the large houses count tens of millions. It is a difference of scale before it is a difference of quality, and it explains the essentials — irregular availability, no wide distribution network, and a reputation that circulates mainly among enthusiasts.',
  `history_es` = 'Casdagli es una casa británica que no posee campos. Jeremy Casdagli la fundó en 1997 con el nombre de Bespoke Cigars; adoptó el de su fundador en la primavera de 2018. Ese cambio dice algo de su propósito: asume ser una firma más que una manufactura, y trabaja en series cortas en lugar de un catálogo permanente.

Sus cigarros han cambiado de país tres veces. Primero se liaron en Cuba, por un solo torcedor, Carlos Valdez Mosquera, hasta su retirada en 2013. La producción pasó después a la Kelner Boutique Factory de Hendrik Kelner Jr., en Santiago de los Caballeros, República Dominicana. Hoy es costarricense y está repartida entre dos talleres: IGM, en San José, para Daughters of the Wind y Cypher 3311; Tabacos de Costa Rica, en Puriscal, para la línea Villa Casdagli, bajo la dirección del maestro ligador Olman Guzmán.

Esta segunda dirección no es una cualquiera, y corrige lo que esta ficha afirmaba antes. Tabacos de Costa Rica S.A. es, según la propia casa, el taller «entonces conocido como Vegas Santiago» — el mismo que, en Puriscal, cultiva su tabaco a más de mil cien metros desde hace más de ochenta años, y que tiene su propia ficha en este atlas. Costa Rica no es, pues, un país sin terruño tabacalero: lo tiene, y Casdagli hace liar sus Villa Casdagli en el lugar exacto donde se encuentra.

Lo que sigue siendo cierto es que la hoja viene de otra parte. Los Villa Casdagli combinan tabacos de Perú, Nicaragua, Ecuador y República Dominicana, con capa y capote ecuatorianos; cuatro de ellos pasan una segunda fermentación, llamada mejorado, de dos a cuatro meses. Jeremy Casdagli cuenta que fue en ese taller, en 2012, donde descubrió el tabaco peruano que se volvió su preferido para ligar. El país de producción sí fue elegido por el taller — pero por lo que ese taller sabe hacer, no porque la tierra alrededor estuviera vacía.

La casa pertenece a la categoría llamada «boutique»: aquellas cuya producción anual se cuenta en decenas de miles de cigarros allí donde las grandes cuentan decenas de millones. Es una diferencia de escala antes que de calidad, y explica lo esencial — disponibilidad irregular, ausencia de una red amplia de distribución y una notoriedad que circula sobre todo entre aficionados.',
  `history_de` = 'Casdagli ist ein britisches Haus ohne eigene Felder. Jeremy Casdagli gründete es 1997 unter dem Namen Bespoke Cigars; den Namen seines Gründers trägt es seit dem Frühjahr 2018. Dieser Wechsel sagt etwas über sein Vorhaben: Es versteht sich als Signatur, nicht als Manufaktur, und arbeitet in kurzen Serien statt mit einem festen Katalog.

Seine Zigarren haben dreimal das Land gewechselt. Zuerst wurden sie in Kuba gerollt, von einem einzigen Torcedor, Carlos Valdez Mosquera, bis zu dessen Rückzug 2013. Danach ging die Produktion an die Kelner Boutique Factory von Hendrik Kelner Jr. in Santiago de los Caballeros, Dominikanische Republik. Heute ist sie costa-ricanisch und auf zwei Werkstätten verteilt: IGM in San José für Daughters of the Wind und Cypher 3311; Tabacos de Costa Rica in Puriscal für die Linie Villa Casdagli, unter der Leitung des Master Blenders Olman Guzmán.

Diese zweite Adresse ist keine beliebige, und sie berichtigt, was dieser Eintrag zuvor behauptete. Tabacos de Costa Rica S.A. ist nach Angaben des Hauses selbst jene Werkstatt, die „damals als Vegas Santiago bekannt" war — eben jene, die in Puriscal seit mehr als achtzig Jahren auf über elfhundert Metern ihren Tabak anbaut und die in diesem Atlas einen eigenen Eintrag hat. Costa Rica ist also kein Land ohne Tabakterroir: Es hat eines, und Casdagli lässt seine Villa Casdagli genau dort rollen, wo es liegt.

Wahr bleibt, dass das Blatt von anderswo kommt. Die Villa Casdagli vereint Tabake aus Peru, Nicaragua, Ecuador und der Dominikanischen Republik unter ecuadorianischem Deck- und Umblatt; vier davon durchlaufen eine zweite Gärung, mejorado genannt, von zwei bis vier Monaten. Jeremy Casdagli erzählt, er habe in dieser Werkstatt 2012 den peruanischen Tabak entdeckt, der für ihn beim Blenden zur ersten Wahl wurde. Das Produktionsland wurde tatsächlich der Werkstatt wegen gewählt — aber wegen dessen, was diese Werkstatt kann, nicht weil das Land ringsum leer wäre.

Das Haus gehört zur sogenannten Boutique-Kategorie: jene, deren Jahresausstoß in Zehntausenden Zigarren zählt, wo die großen Häuser in Zehnmillionen rechnen. Das ist zuerst ein Unterschied der Größenordnung und erst dann einer der Qualität, und er erklärt das Wesentliche — unregelmäßige Verfügbarkeit, kein breites Vertriebsnetz und eine Bekanntheit, die vor allem unter Liebhabern kursiert.',
  `history_zh` = 'Casdagli 是一家不拥有田地的英国老号。杰里米·卡斯达格利于1997年以 Bespoke Cigars 之名创立，2018年春改用创始人的姓氏。这一更名透露了它的立意：它甘于做一个署名，而非一座工厂，走短批次而非常设目录的路子。

它的雪茄三度易国。最初在古巴卷制，出自一位卷烟师卡洛斯·巴尔德斯·莫斯克拉之手，直至他2013年退出。此后生产转至多米尼加共和国圣地亚哥的亨德里克·凯尔纳二世的 Kelner Boutique Factory。如今则在哥斯达黎加，由两家作坊分担：圣何塞的 IGM 负责 Daughters of the Wind 与 Cypher 3311；普里斯卡尔的 Tabacos de Costa Rica 负责 Villa Casdagli 系列，由调配大师奥尔曼·古斯曼主理。

第二个地址并非无关紧要，它纠正了本词条此前的说法。据该号自述，Tabacos de Costa Rica S.A. 正是那家「当时名为 Vegas Santiago」的作坊——也就是在普里斯卡尔、于一千一百米以上种植烟叶已逾八十年、并在本图集中另有词条的那一家。可见哥斯达黎加并非没有烟草风土的国家：它有，而 Casdagli 正是在这片风土所在之处卷制它的 Villa Casdagli。

依然成立的是：烟叶来自别处。Villa Casdagli 以厄瓜多尔茄衣与茄套，配以秘鲁、尼加拉瓜、厄瓜多尔与多米尼加的填充烟叶；其中四种要经历为期两到四个月、称为 mejorado 的二次发酵。杰里米·卡斯达格利说，他正是2012年在这家作坊里认识了那种后来成为他调配最爱的秘鲁烟叶。生产国确实是为作坊而选——但所为的是这家作坊的本事，而非因为周遭的土地空无一物。

这家老号属于所谓「精品」一类：年产以数万支计，而大厂以数千万支计。这首先是规模之别，其次才是品质之别，也解释了它的处境——供货不定、没有广泛的分销网络，名声主要在爱好者之间流转。',
  `history_ar` = 'كاسداغلي دار بريطانية لا تملك حقولًا. أسّسها جيريمي كاسداغلي سنة 1997 باسم Bespoke Cigars، ثم حملت اسم مؤسّسها في ربيع 2018. ويقول هذا التغيير شيئًا عن مقصدها: فهي ترتضي أن تكون توقيعًا لا مصنعًا، وتعمل بسلاسل قصيرة لا بكتالوج دائم.

غيّرت سيجاراتها البلد ثلاث مرات. لُفّت أولًا في كوبا على يد لافّ واحد، كارلوس بالديس موسكيرا، حتى انسحابه سنة 2013. ثم انتقل الإنتاج إلى مصنع Kelner Boutique Factory الذي يديره هندريك كلنر الابن في سانتياغو دي لوس كاباييروس بجمهورية الدومينيكان. وهو اليوم كوستاريكي، موزّع على ورشتين: IGM في سان خوسيه لخطَّي Daughters of the Wind وCypher 3311؛ وTabacos de Costa Rica في بوريسكال لخط Villa Casdagli، بإشراف كبير المزّاجين أولمان غوسمان.

وهذا العنوان الثاني ليس عنوانًا كأيّ عنوان، وهو يصحّح ما كانت هذه البطاقة تؤكّده من قبل. فشركة Tabacos de Costa Rica S.A. هي، بإقرار الدار نفسها، الورشة التي كانت «تُعرف آنذاك باسم فيغاس سانتياغو» — وهي بعينها التي تزرع تبغها في بوريسكال على ارتفاع يتجاوز ألفًا ومئة متر منذ أكثر من ثمانين سنة، ولها بطاقتها الخاصة في هذا الأطلس. فكوستاريكا إذن ليست بلدًا بلا تروا تبغي: لها تروا، وكاسداغلي تلفّ سيجارات Villa Casdagli في الموضع نفسه الذي يوجد فيه.

وما يبقى صحيحًا أنّ الورقة تأتي من مكان آخر. فخط Villa Casdagli يمزج تبغ بيرو ونيكاراغوا والإكوادور وجمهورية الدومينيكان، تحت غلاف ورباط إكوادوريَّين؛ وأربعة من هذه الأتبغة تمرّ بتخمير ثانٍ يُسمّى «مِخورادو» يدوم شهرين إلى أربعة. ويروي جيريمي كاسداغلي أنّه اكتشف في هذه الورشة سنة 2012 التبغ البيروفي الذي صار مفضّله في المزج. لقد اختير بلد الإنتاج فعلًا من أجل الورشة — لكن من أجل ما تُحسنه هذه الورشة، لا لأنّ الأرض من حولها خالية.

تنتمي الدار إلى ما يُسمّى فئة «البوتيك»: تلك التي يُحصى إنتاجها السنوي بعشرات الآلاف من السيجارات حيث تُحصي الدور الكبرى عشرات الملايين. وهو فرق في الحجم قبل أن يكون فرقًا في الجودة، وهو يفسّر الأساس — توافر غير منتظم، وغياب شبكة توزيع واسعة، وشهرة تدور خصوصًا بين الهواة.'
WHERE `name` = 'Casdagli';

-- ════════════════════════════════════════════════════════
-- 6. VEGAS DE SANTIAGO — l'autre bout de la meme correction
-- ────────────────────────────────────────────────────────
-- Sa fiche ouvrait sur « Le Costa Rica est, dans cet atlas, le pays
-- des maisons sans terroir ». La formule etait deja un raccourci ; une
-- fois etabli que Casdagli fait rouler chez elle, elle devient fausse.
--
-- Et il manquait un fait que les deux maisons documentent : l'atelier
-- de Puriscal travaille aujourd'hui sous la raison sociale Tabacos de
-- Costa Rica S.A., et il roule pour d'autres — dont la ligne Villa
-- Casdagli. La regle de cet atlas veut qu'on nomme les collaborations
-- et qu'on dise qui fait quoi.
-- ════════════════════════════════════════════════════════

UPDATE `brands` SET
  `factory` = 'Santiago de Puriscal, San José, Costa Rica — aujourd''hui Tabacos de Costa Rica S.A.',
  `source`  = 'vegassantiago.com, cigars-vegasantiago.biz et casagranda-cigars.de (Marc Niehaus, Puriscal, 1 100 m, Luis Santana Lamas, Chaman, les bagues privées) ; zechbauer.de « At the Vegas de Santiago factory » (Olman León Guzmán chef de la fabrique ; tabac cultivé sur ces pentes « depuis plus de 80 ans » à plus de 1 100 m) ; casdaglicigars.com (« Tabacos de Costa Rica SA, then known as Vegas Santiago », coopération depuis 2012) — aucune de ces sources ne donne l''année de fondation',
  `history` = 'Le Costa Rica passe pour un pays d''ateliers plutôt que de champs : Selected Tobacco y fait rouler des feuilles venues d''ailleurs, Casdagli aussi. Vegas de Santiago est ce qui dément la formule — elle cultive ce qu''elle roule.

Ses champs sont à Santiago de Puriscal, dans les montagnes volcaniques au sud-ouest de San José, à plus de mille cent mètres. On y plante du tabac depuis plus de quatre-vingts ans. L''altitude tient lieu de traitement : la maison explique qu''elle se passe de pesticides parce que les ravageurs ne montent pas si haut.

Marc Niehaus l''a fondée. Aucune source consultable n''en donne l''année, et cette fiche préfère le dire que l''inventer — la même règle que pour Kolumbus aux Canaries. Un maître cubain, Luis Santana Lamas, y a apporté la manière de traiter la feuille et de rouler ; la maison le nomme, et son prénom est resté sur une gamme.

Elle fait ses lignes — Chaman, Reserva, Don Luis, Secretos del Maestro — et elle roule aussi pour d''autres : des bagues de détaillants européens sortent de cet atelier, dont celles de Zechbauer, la maison de Munich. Chaman, que le recensement de cet atlas prenait pour une maison à part, est l''une de ses gammes.

L''atelier a changé de raison sociale et travaille aujourd''hui sous le nom de Tabacos de Costa Rica S.A. Zechbauer présente Olman León Guzmán comme le chef de la fabrique ; Casdagli le nomme maître assembleur et écrit que sa coopération avec « Tabacos de Costa Rica S.A., alors connue sous le nom de Vegas Santiago » a commencé en 2012. C''est ici, et non ailleurs au Costa Rica, que se roule la ligne Villa Casdagli.',
  `history_en` = 'Costa Rica passes for a country of workshops rather than fields: Selected Tobacco has leaf from elsewhere rolled there, and so does Casdagli. Vegas de Santiago is what contradicts the formula — it grows what it rolls.

Its fields are at Santiago de Puriscal, in the volcanic mountains south-west of San José, above eleven hundred metres. Tobacco has been planted there for more than eighty years. Altitude serves as treatment: the house explains that it does without pesticides because the pests do not climb that high.

Marc Niehaus founded it. No consultable source gives the year, and this entry prefers to say so rather than invent it — the same rule as for Kolumbus in the Canaries. A Cuban master, Luis Santana Lamas, brought the way of curing the leaf and of rolling; the house names him, and his first name has stayed on a line.

It makes its own lines — Chaman, Reserva, Don Luis, Secretos del Maestro — and it also rolls for others: bands of European retailers come out of this workshop, among them those of Zechbauer, the Munich house. Chaman, which this atlas''s census took for a separate house, is one of its lines.

The workshop has changed its trading name and works today as Tabacos de Costa Rica S.A. Zechbauer presents Olman León Guzmán as the head of the factory; Casdagli calls him master blender and writes that its cooperation with "Tabacos de Costa Rica S.A., then known as Vegas Santiago" began in 2012. It is here, and nowhere else in Costa Rica, that the Villa Casdagli line is rolled.',
  `history_es` = 'Costa Rica pasa por ser un país de talleres más que de campos: Selected Tobacco hace liar allí hojas venidas de otra parte, y Casdagli también. Vegas de Santiago es lo que desmiente la fórmula — cultiva lo que lía.

Sus campos están en Santiago de Puriscal, en las montañas volcánicas al suroeste de San José, a más de mil cien metros. Allí se planta tabaco desde hace más de ochenta años. La altitud hace las veces de tratamiento: la casa explica que prescinde de pesticidas porque las plagas no suben tan alto.

Marc Niehaus la fundó. Ninguna fuente consultable da el año, y esta ficha prefiere decirlo a inventarlo — la misma regla que para Kolumbus en Canarias. Un maestro cubano, Luis Santana Lamas, aportó la manera de curar la hoja y de liar; la casa lo nombra, y su nombre de pila quedó en una línea.

Hace sus propias líneas — Chaman, Reserva, Don Luis, Secretos del Maestro — y lía también para otros: de este taller salen anillas de minoristas europeos, entre ellas las de Zechbauer, la casa de Múnich. Chaman, que el censo de este atlas tomaba por una casa aparte, es una de sus líneas.

El taller cambió de razón social y trabaja hoy como Tabacos de Costa Rica S.A. Zechbauer presenta a Olman León Guzmán como jefe de la fábrica; Casdagli lo llama maestro ligador y escribe que su cooperación con «Tabacos de Costa Rica S.A., entonces conocida como Vegas Santiago» comenzó en 2012. Es aquí, y no en otro lugar de Costa Rica, donde se lía la línea Villa Casdagli.',
  `history_de` = 'Costa Rica gilt eher als Land der Werkstätten denn der Felder: Selected Tobacco lässt dort Blatt von anderswo rollen, Casdagli ebenso. Vegas de Santiago ist das, was die Formel widerlegt — es baut an, was es rollt.

Seine Felder liegen in Santiago de Puriscal, in den vulkanischen Bergen südwestlich von San José, auf über elfhundert Metern. Seit mehr als achtzig Jahren wird dort Tabak gepflanzt. Die Höhe ersetzt die Behandlung: Das Haus erklärt, es komme ohne Pestizide aus, weil die Schädlinge nicht so hoch steigen.

Marc Niehaus hat es gegründet. Keine einsehbare Quelle nennt das Jahr, und dieser Eintrag sagt das lieber, als es zu erfinden — dieselbe Regel wie bei Kolumbus auf den Kanaren. Ein kubanischer Meister, Luis Santana Lamas, brachte die Art, das Blatt zu behandeln und zu rollen; das Haus nennt ihn, und sein Vorname ist auf einer Linie geblieben.

Es fertigt eigene Linien — Chaman, Reserva, Don Luis, Secretos del Maestro — und rollt auch für andere: Banderolen europäischer Händler verlassen diese Werkstatt, darunter die von Zechbauer, dem Münchner Haus. Chaman, das die Bestandsaufnahme dieses Atlas für ein eigenes Haus hielt, ist eine seiner Linien.

Die Werkstatt hat ihren Firmennamen gewechselt und arbeitet heute als Tabacos de Costa Rica S.A. Zechbauer stellt Olman León Guzmán als Leiter der Fabrik vor; Casdagli nennt ihn Master Blender und schreibt, die Zusammenarbeit mit „Tabacos de Costa Rica S.A., damals bekannt als Vegas Santiago" habe 2012 begonnen. Hier, und nirgendwo sonst in Costa Rica, wird die Linie Villa Casdagli gerollt.',
  `history_zh` = '哥斯达黎加素被视为一个有作坊而少田地的国家：Selected Tobacco 在此卷制来自别处的烟叶，Casdagli 亦然。Vegas de Santiago 正是推翻这一说法的存在——它种自己所卷的烟叶。

它的田地在圣何塞西南火山群山中的圣地亚哥-德普里斯卡尔，海拔一千一百米以上。此地种植烟草已逾八十年。海拔本身即是处理之法：该号称，虫害爬不了这么高，因此无须农药。

创立者是马克·尼豪斯。可查的资料均未给出年份，本词条宁可直说，也不愿臆造——与加那利群岛的 Kolumbus 同一准则。一位古巴大师路易斯·桑塔纳·拉马斯将处理烟叶与卷制的手法带到此地；该号点出他的名字，而他的名也留在了一个系列上。

它做自己的系列——Chaman、Reserva、Don Luis、Secretos del Maestro——也为别人卷制：欧洲零售商的烟标出自这家作坊，其中包括慕尼黑老号 Zechbauer 的。Chaman 曾被本图集的普查误作独立老号，其实是它的一个系列。

作坊已更改商号，如今以 Tabacos de Costa Rica S.A. 之名经营。Zechbauer 称奥尔曼·莱昂·古斯曼为厂长；Casdagli 称他为调配大师，并写道与「Tabacos de Costa Rica S.A.，当时名为 Vegas Santiago」的合作始于2012年。Villa Casdagli 系列正是在这里卷制，而非哥斯达黎加的其他地方。',
  `history_ar` = 'تمرّ كوستاريكا في الأذهان بوصفها بلد ورشٍ لا بلد حقول: فشركة Selected Tobacco تلفّ فيها ورقًا آتيًا من غيرها، وكذلك تفعل كاسداغلي. أمّا فيغاس دي سانتياغو فهي ما يكذّب هذه الصيغة — إذ تزرع ما تلفّه.

حقولها في سانتياغو دي بوريسكال، في الجبال البركانية جنوب غربي سان خوسيه، على ارتفاع يتجاوز ألفًا ومئة متر. ويُزرع التبغ هناك منذ أكثر من ثمانين سنة. والارتفاع يقوم مقام المعالجة: تقول الدار إنّها تستغني عن المبيدات لأنّ الآفات لا تصعد إلى هذا العلوّ.

أسّسها مارك نيهاوس. ولا يذكر أيّ مصدر متاح سنةَ التأسيس، وتفضّل هذه البطاقة قول ذلك على اختلاقه — وهي القاعدة نفسها المتّبعة مع كولومبوس في جزر الكناري. وقد نقل إليها معلّم كوبي، لويس سانتانا لاماس، طريقةَ معالجة الورقة واللفّ؛ تذكره الدار باسمه، وقد بقي اسمه الأوّل على أحد خطوطها.

تصنع خطوطها الخاصة — تشامان، ورِسِرفا، ودون لويس، وسِكريتوس ديل مايسترو — وتلفّ أيضًا لغيرها: فمن هذه الورشة تخرج أطواق تجّار أوروبيين، منها أطواق تسيشباور، الدار الميونيخية. وتشامان، التي حسبها إحصاءُ هذا الأطلس دارًا مستقلّة، إنّما هي أحد خطوطها.

وقد غيّرت الورشة اسمها التجاري، وهي تعمل اليوم باسم Tabacos de Costa Rica S.A. يقدّم تسيشباور أولمان ليون غوسمان بوصفه رئيس المصنع؛ وتسمّيه كاسداغلي كبير المزّاجين وتكتب أنّ تعاونها مع «Tabacos de Costa Rica S.A.، المعروفة آنذاك باسم فيغاس سانتياغو» بدأ سنة 2012. وهنا، لا في مكان آخر من كوستاريكا، يُلفّ خط Villa Casdagli.'
WHERE `name` = 'Vegas de Santiago';

-- ════════════════════════════════════════════════════════
-- LES SCEAUX DE TRADUCTION
-- ────────────────────────────────────────────────────────
-- Le hash est RECALCULE DEPUIS LA COLONNE, jamais recopie a la main :
-- une empreinte fausse ferait passer pour a jour une traduction qui ne
-- l'est plus, ce qui est pire que pas de sceau du tout.
-- ════════════════════════════════════════════════════════

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'brands', b.`name`, 'history', l.lang, SHA1(b.`history`), 'machine', NOW()
  FROM `brands` b
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE b.`name` IN ('Excalibur','Casdagli','Vegas de Santiago')
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

-- Et `celebrities` d'Excalibur, reecrit lui aussi.
INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'brands', b.`name`, 'celebrities', l.lang, SHA1(b.`celebrities`), 'machine', NOW()
  FROM `brands` b
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE b.`name` = 'Excalibur'
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

-- Le pays : `notes` et `production` ont change, leurs sceaux suivent.
INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'producer_countries', p.`id`, c.champ, l.lang,
       SHA1(CASE c.champ WHEN 'notes' THEN p.`notes` ELSE p.`production` END),
       'machine', NOW()
  FROM `producer_countries` p
  JOIN (SELECT 'notes' champ UNION ALL SELECT 'production') c
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE p.`id` = 'panama'
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

-- Et la presence Habanos : `ownership` et `description`.
INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'habanos_presence', h.`country_id`, c.champ, l.lang,
       SHA1(CASE c.champ WHEN 'ownership' THEN h.`ownership` ELSE h.`description` END),
       'machine', NOW()
  FROM `habanos_presence` h
  JOIN (SELECT 'ownership' champ UNION ALL SELECT 'description') c
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE h.`country_id` = 'panama'
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

-- ════════════════════════════════════════════════════════
-- LE CONSTAT — ce qui a ete trouve, et ce que j'avais mal ecrit
-- ────────────────────────────────────────────────────────
-- ⚠ `detail` EST UN varchar(255) ET `action` UN varchar(40) : LES DEUX
-- TRONQUENT EN SILENCE. Verifie : les quatre entrees de la 202 et les
-- quatre de la 203 font toutes EXACTEMENT 255 caracteres — coupees en
-- pleine phrase sans qu un mot le signale.
--
-- J'y suis tombe le premier coup : huit des onze entrees ci-dessous
-- sortaient a 255. Elles ont ete raccourcies, et le controle en fin de
-- fichier REFUSE desormais de passer si l'une d'elles atteint la
-- limite. C'est la seule facon de ne pas recommencer.
--
-- Le DELETE qui precede rend le bloc rejouable : une migration qu'on
-- relance ne doit pas empiler des doublons de journal.
-- ════════════════════════════════════════════════════════

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 204';

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 204','systeme','bering_reserve_levee','marque',0,
   'La reserve niait ce que la source citee affirmait. jaimemontilla.com, DEJA dans le champ, ecrit qu en 2002 Swisher a vendu LA MARQUE ET L USINE a Nestor Plasencia. Le corps de la fiche le disait aussi. Defaut de lecture, pas manque de source'),
  (NULL,'migration 204','systeme','excalibur_histoire_fausse','marque',0,
   'Le texte attribuait Excalibur a Villiger Sohne, a Hendrik Kelner et aux plantations Eiroa, puis sa revente a Altadis. Confusion Villiger / VILLAZON. L acheteur de 1997 est GENERAL CIGAR. Histoire reecrite en six langues'),
  (NULL,'migration 204','systeme','excalibur_date_et_fabrique','marque',0,
   'Le 1983 du champ n avait aucune source. Cigar Aficionado (mai 2021) dit la ligne quadragenaire, donc 1981, et la fabrique a la HATSA de Danli. La divergence 1970s / 1981 / 1992 est desormais ECRITE DANS LA FICHE'),
  (NULL,'migration 204','systeme','suerdieck_deux_dates','marque',0,
   'Decembre 1999 et 2000 ne se contredisent pas : l activite cesse fin 1999, la derniere usine de Cruz das Almas ferme en 2000 avec cent licenciements. Aucune donnee nouvelle, seulement la lecture juste de deux sources deja citees'),
  (NULL,'migration 204','systeme','torano_panama_supprimee','marque',0,
   'La fiche decrivait un terroir panameen a Boquete employe dans l Exodus 1959. RIEN NE L ETABLIT. Le 2001 datait le lancement de la ligne Exodus, pas une installation au Chiriqui ; l Exodus se fait au Honduras puis au Nicaragua'),
  (NULL,'migration 204','systeme','panama_reecrit','pays',0,
   'Mars 1981 : Oliva et Plasencia portent la semence cubaine a Cocle. Cocle Tobacco Factory a Penonome la meme annee, Tabacos Panama SA en 1984, Joyas de Panama en fevrier 1986. Un reportage de 2025 trouve les ateliers a l arret'),
  (NULL,'migration 204','systeme','panama_aucun_remplacement','pays',0,
   'Joyas de Panama meriterait une fiche, mais mes sources sont un site touristique et une notice de guide. En ecrire une fiche complete repeterait la faute que cette migration corrige. Le pays porte la maison, rien de plus'),
  (NULL,'migration 204','systeme','costarica_tension_tranchee','marque',0,
   'Casdagli et Vegas de Santiago sont AU MEME ENDROIT. Casdagli ecrit que Tabacos de Costa Rica SA est l atelier alors connu sous le nom de Vegas Santiago ; Zechbauer nomme Olman Leon Guzman chef de cette fabrique'),
  (NULL,'migration 204','systeme','casdagli_ce_qui_etait_faux','marque',0,
   'Pays sans terroir tabacole notable niait le terroir la ou la maison fait rouler. Le champ factory nommait Tabacalera Aragon, introuvable dans ses sources : ce sont IGM a San Jose et Tabacos de Costa Rica a Puriscal'),
  (NULL,'migration 204','systeme','ordre_de_travail','systeme',0,
   'Domaines verifies au DNS AVANT ecriture, comme depuis la migration 200 : dopanama.com, lonelyplanet.com, newsroompanama.com, zechbauer.de, cigardojo.com, famous-smoke.com, tampachanging.com. Aucun n a ete cite sans avoir resolu'),
  (NULL,'migration 204','systeme','journal_tronque_en_silence','systeme',0,
   'moderation_log.detail est un varchar(255) : les quatre entrees de la 202 et les quatre de la 203 font toutes EXACTEMENT 255 caracteres, donc coupees en pleine phrase. Les entrees de la 204 tiennent dans la limite');

-- ── LE CONTROLE, ET IL DOIT TENIR ────────────────────────
-- 181 marques (182 moins la fiche supprimee), toutes avec source.
SELECT COUNT(*) AS marques,
       SUM(TRIM(COALESCE(`source`,'')) = '') AS sans_source,
       SUM(`country_id` = 'panama') AS encore_au_panama
  FROM `brands`;
-- Aucun sceau orphelin ne doit subsister pour la fiche supprimee.
SELECT COUNT(*) AS sceaux_orphelins FROM `translation_status`
 WHERE `entite` = 'brands' AND `entite_id` = 'Carlos Toraño Panama';
-- Et aucune entree de journal ne doit avoir ete tronquee cette fois.
-- `tronquees` DOIT VALOIR 0 : une valeur a 255 pile est le signe d'une
-- coupe silencieuse, pas d'une phrase qui tombe juste.
SELECT COUNT(*) AS entrees,
       MAX(CHAR_LENGTH(`detail`))                  AS plus_longue,
       SUM(CHAR_LENGTH(`detail`) >= 255)           AS tronquees,
       SUM(CHAR_LENGTH(`action`) >= 40)            AS actions_tronquees
  FROM `moderation_log` WHERE `acteur_nom` = 'migration 204';
