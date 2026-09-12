-- ════════════════════════════════════════════════════════
-- 207 — Lot 1 du second recensement : les fabriques deja nommees
-- ────────────────────────────────────────────────────────
-- Quatre fiches, et les quatre reparent un renvoi dans le vide. L'atlas
-- nommait ces fabriques dans d'autres fiches — Caldwell et La Barba
-- pour William Ventura, Casdagli pour la Kelner Boutique Factory,
-- 7-20-4 pour J. Fuego, Kafie (a venir) pour Puros Aliados — sans leur
-- avoir jamais donne d'entree. C'est le defaut de Tabacalera Palma
-- avant la migration 186, quatre fois.
--
-- PRINCIPE DU LOT : les fabriques AVANT les marques qu'elles roulent.
-- Une fiche de maison sans usine renvoie a sa fabrique ; le renvoi doit
-- avoir une cible. Voir docs/maisons-absentes-2.md.
--
-- CE QUE LA RECHERCHE A RENDU ET QUI N'ETAIT PAS PREVU :
--  · 777, que le premier recensement cherchait comme une maison
--    hondurienne « sans aucune source », est une marque de J. Fuego.
--    Le nom n'etait pas absent, il etait range sous le mauvais pays.
--  · La fabrique de Caldwell et de La Barba a BRULE le 26 septembre
--    2022. Les deux fiches, ecrites apres, ne le disaient pas. Elles le
--    disent maintenant, en six langues.
--  · Oliva possede Cuba Aliados, Puros Indios et Roly depuis aout
--    2021. Sa gamme les porte desormais, avec la date et l'origine.
--
-- CLASSEMENT PAR LE LIEU DE FABRICATION, comme toujours : Reyes Family
-- Cigars reste au Honduras parce que L'USINE y est restee — ce sont les
-- marques qui sont parties.
--
-- `producer_countries.brands` est reecrit EN LITTERAL COMPLET depuis
-- la valeur courante (dump versionne, identique a la base) : aucune
-- fonction JSON_*, la regle depuis la migration 179.
--
-- Domaines cites, verifies au DNS avant ecriture : cigaraficionado.com,
-- halfwheel.com, cigar-coop.com, cigarworld.com, famous-smoke.com,
-- jfuego.com, casdaglicigars.com, leafenthusiast.com, cigarjournal.com,
-- en.wikipedia.org. ⚠ cigarpublic.com a ete ecarte : cite d'abord, sa
-- resolution DNS est instable (refuse par tools/sources.php, delai a la
-- lecture) — une source qu'on ne peut pas rouvrir n'en est pas une.
-- ════════════════════════════════════════════════════════

-- ── Tabacalera William Ventura (dominican) ──

INSERT INTO `brands` (`name`, `country_id`, `founded`, `factory`, `source`, `history`, `gamme`, `history_en`, `gamme_en`, `history_es`, `gamme_es`, `history_de`, `gamme_de`, `history_zh`, `gamme_zh`, `history_ar`, `gamme_ar`)
VALUES ('Tabacalera William Ventura',
        'dominican',
        '2007-2008 — Tamboril, Rép. dominicaine',
        'Tabacalera William Ventura, Tamboril — reconstruite, rouverte en mars 2024 ; El Maestro, atelier secondaire',
        'cigaraficionado.com « Fire in the Free Zone » (26 septembre 2022 : incendie avant 3 h, bâtiment partagé avec Intercigar perdu, ~800 000 cigares de Ventura et ~700 000 d''Intercigar, une centaine d''employés, aucun blessé ; roulait Room101, Caldwell, La Barba, Freud) ; cigarworld.com (William Ventura chef de production chez Davidoff, déjà en 1991 ; Wiber Ventura vingt ans chez Davidoff, parti en 2019 ; Nataly Ventura ; rouverte en mars 2024) ; halfwheel.com (El Maestro, Partagás Y Nada Más). Fondation : 2007 ou 2008 selon la source',
        'Tabacalera William Ventura est une fabrique de Tamboril, dans la zone franche de Santiago, et l''atlas la nommait déjà trois fois sans lui avoir donné de fiche : c''est là que Caldwell fait composer ses assemblages, là que La Barba a fini par installer les siens, là qu''ADVentura et Freud sont roulées.

William Ventura vient de Davidoff, où il a dirigé la production pendant des années — il y était déjà quand les cigares Davidoff sont arrivés aux États-Unis, en 1991. Il ouvre sa propre fabrique vers 2007 ; les sources divergent d''un an, et cette fiche le dit plutôt que de choisir. Ses enfants l''ont rejoint : Henderson Ventura, assembleur, dont le nom revient sur les collaborations ; Wiber, vingt ans chez Davidoff avant de partir en 2019 construire quelque chose avec son père ; Nataly, à la logistique, à l''emballage et aux finances, et à l''assemblage aussi.

Le 26 septembre 2022, avant trois heures du matin, un incendie a pris dans le bâtiment que la fabrique partageait avec Intercigar. Tout a brûlé : près de 800 000 cigares en attente d''emballage ou de vieillissement pour Ventura, 700 000 cigares finis pour Intercigar, et la matière première. Une centaine d''employés, moins de quarante rouleurs, aucun blessé. Robert Caldwell a annoncé la semaine même que la production reprendrait dans des ateliers satellites et à El Maestro, la petite fabrique que la famille gardait pour ses propres marques.

La nouvelle fabrique, sous le même nom, a rouvert en mars 2024, et les deux tournent aujourd''hui. Depuis, Scandinavian Tobacco Group lui a confié le Partagás Y Nada Más Santiago — une marque de groupe chez une fabrique familiale, ce qui dit ce que le métier pense d''elle.

Les marques propres s''appellent William Ventura et El Maestro. Mais la fiche existe d''abord pour les autres : c''est une fabrique qui roule pour des maisons sans usine, et l''atlas s''oblige à nommer qui fait quoi.',
        '[{"name":"William Ventura","color":"#5B3A29","force":"Non divulguée","wrapper":"Non divulguée","vitolas":[],"story":"La marque au nom de la maison — la seule qui porte le sien."},{"name":"El Maestro","color":"#7A4A2C","force":"Non divulguée","wrapper":"Non divulguée","vitolas":[],"story":"Le nom de l''atelier secondaire, et de la marque qui y est née. C''est lui qui a tenu pendant la reconstruction."}]',
        'Tabacalera William Ventura is a factory in Tamboril, in the Santiago free zone, and this atlas already named it three times without giving it an entry: it is where Caldwell has its blends composed, where La Barba ended up settling its own, where ADVentura and Freud are rolled.

William Ventura comes from Davidoff, where he ran production for years — he was already there when Davidoff cigars arrived in the United States, in 1991. He opened his own factory around 2007; the sources differ by a year, and this entry says so rather than choosing. His children joined him: Henderson Ventura, blender, whose name recurs on collaborations; Wiber, twenty years at Davidoff before leaving in 2019 to build something with his father; Nataly, on logistics, packaging and finance, and on blending too.

On 26 September 2022, before three in the morning, a fire broke out in the building the factory shared with Intercigar. Everything burned: close to 800,000 cigars awaiting packaging or ageing for Ventura, 700,000 finished cigars for Intercigar, and the raw material. About a hundred employees, fewer than forty rollers, no one hurt. Robert Caldwell announced that same week that production would resume at satellite workshops and at El Maestro, the small factory the family kept for its own brands.

The new factory, under the same name, reopened in March 2024, and both run today. Since then, Scandinavian Tobacco Group has entrusted it with the Partagás Y Nada Más Santiago — a group brand at a family factory, which says what the trade thinks of it.

Its own brands are called William Ventura and El Maestro. But the entry exists first for the others: this is a factory that rolls for houses without one, and this atlas obliges itself to name who does what.',
        '[{"name":"William Ventura","color":"#5B3A29","force":"Undisclosed","wrapper":"Undisclosed","vitolas":[],"story":"The brand bearing the house''s name — the only one that does."},{"name":"El Maestro","color":"#7A4A2C","force":"Undisclosed","wrapper":"Undisclosed","vitolas":[],"story":"The name of the secondary workshop, and of the brand born there. It is what held during the rebuild."}]',
        'Tabacalera William Ventura es una fábrica de Tamboril, en la zona franca de Santiago, y este atlas ya la nombraba tres veces sin haberle dado una ficha: allí hace componer Caldwell sus ligadas, allí terminó instalando La Barba las suyas, allí se lían ADVentura y Freud.

William Ventura viene de Davidoff, donde dirigió la producción durante años — ya estaba allí cuando los puros Davidoff llegaron a Estados Unidos, en 1991. Abre su propia fábrica hacia 2007; las fuentes difieren en un año, y esta ficha lo dice en lugar de elegir. Sus hijos se le unieron: Henderson Ventura, ligador, cuyo nombre vuelve en las colaboraciones; Wiber, veinte años en Davidoff antes de irse en 2019 a construir algo con su padre; Nataly, en logística, empaque y finanzas, y también en la ligada.

El 26 de septiembre de 2022, antes de las tres de la madrugada, un incendio prendió en el edificio que la fábrica compartía con Intercigar. Todo ardió: cerca de 800 000 puros a la espera de empaque o de añejamiento para Ventura, 700 000 puros terminados para Intercigar, y la materia prima. Un centenar de empleados, menos de cuarenta torcedores, ningún herido. Robert Caldwell anunció esa misma semana que la producción se reanudaría en talleres satélite y en El Maestro, la pequeña fábrica que la familia conservaba para sus propias marcas.

La nueva fábrica, con el mismo nombre, reabrió en marzo de 2024, y hoy funcionan las dos. Desde entonces, Scandinavian Tobacco Group le confió el Partagás Y Nada Más Santiago — una marca de grupo en una fábrica familiar, lo que dice lo que el oficio piensa de ella.

Sus marcas propias se llaman William Ventura y El Maestro. Pero la ficha existe ante todo por los demás: es una fábrica que lía para casas sin taller, y este atlas se obliga a nombrar quién hace qué.',
        '[{"name":"William Ventura","color":"#5B3A29","force":"No divulgada","wrapper":"No divulgada","vitolas":[],"story":"La marca con el nombre de la casa — la única que lo lleva."},{"name":"El Maestro","color":"#7A4A2C","force":"No divulgada","wrapper":"No divulgada","vitolas":[],"story":"El nombre del taller secundario, y de la marca nacida allí. Fue lo que sostuvo durante la reconstrucción."}]',
        'Tabacalera William Ventura ist eine Fabrik in Tamboril, in der Freizone von Santiago, und dieser Atlas nannte sie bereits dreimal, ohne ihr einen Eintrag zu geben: Dort lässt Caldwell seine Blends komponieren, dort hat La Barba am Ende die eigenen angesiedelt, dort werden ADVentura und Freud gerollt.

William Ventura kommt von Davidoff, wo er jahrelang die Produktion leitete — er war schon dort, als die Davidoff-Zigarren 1991 in die Vereinigten Staaten kamen. Um 2007 eröffnete er seine eigene Fabrik; die Quellen weichen um ein Jahr ab, und dieser Eintrag sagt das, statt zu wählen. Seine Kinder kamen dazu: Henderson Ventura, Blender, dessen Name auf den Kooperationen wiederkehrt; Wiber, zwanzig Jahre bei Davidoff, bevor er 2019 ging, um mit seinem Vater etwas aufzubauen; Nataly, für Logistik, Verpackung und Finanzen, und auch fürs Blending.

Am 26. September 2022, vor drei Uhr morgens, brach in dem Gebäude, das sich die Fabrik mit Intercigar teilte, ein Feuer aus. Alles brannte: nahezu 800.000 Zigarren, die bei Ventura auf Verpackung oder Reifung warteten, 700.000 fertige Zigarren bei Intercigar, dazu der Rohstoff. Rund hundert Beschäftigte, weniger als vierzig Roller, keine Verletzten. Robert Caldwell kündigte noch in derselben Woche an, die Produktion werde in Satellitenwerkstätten und bei El Maestro weitergehen, der kleinen Fabrik, die die Familie für ihre eigenen Marken hielt.

Die neue Fabrik, unter demselben Namen, öffnete im März 2024 wieder, und heute laufen beide. Seither hat ihr Scandinavian Tobacco Group die Partagás Y Nada Más Santiago anvertraut — eine Konzernmarke in einer Familienfabrik, was sagt, was die Branche von ihr hält.

Die eigenen Marken heißen William Ventura und El Maestro. Doch der Eintrag besteht zuerst für die anderen: Dies ist eine Fabrik, die für Häuser ohne eigene rollt, und dieser Atlas verpflichtet sich zu benennen, wer was macht.',
        '[{"name":"William Ventura","color":"#5B3A29","force":"Nicht angegeben","wrapper":"Nicht angegeben","vitolas":[],"story":"Die Marke mit dem Namen des Hauses — die einzige, die ihn trägt."},{"name":"El Maestro","color":"#7A4A2C","force":"Nicht angegeben","wrapper":"Nicht angegeben","vitolas":[],"story":"Der Name der zweiten Werkstatt und der dort entstandenen Marke. Sie hielt während des Wiederaufbaus."}]',
        'Tabacalera William Ventura 是圣地亚哥自由区坦博里尔的一家工厂，本图集此前已三次提到它却未立词条：Caldwell 在此调配配方，La Barba 后来也把自己的配方安在这里，ADVentura 与 Freud 在此卷制。

威廉·文图拉出身大卫杜夫，多年主管生产——1991年大卫杜夫雪茄进入美国时他已在任。他约于2007年开办自己的工厂；资料相差一年，本词条如实说明而不择其一。子女相继加入：亨德森·文图拉，调配师，其名屡见于合作项目；维贝尔，在大卫杜夫二十年，2019年离开「与父亲共建一番事业」；纳塔莉，负责物流、包装与财务，也参与调配。

2022年9月26日凌晨三时前，工厂与 Intercigar 共用的厂房失火。付之一炬：文图拉近八十万支待包装或待陈化的雪茄，Intercigar 七十万支成品，以及原料。约百名员工，不足四十名卷烟师，无人受伤。罗伯特·考德威尔当周即宣布，生产将转往卫星作坊与 El Maestro——家族为自有品牌保留的小厂——继续。

同名新厂于2024年3月重开，如今两厂并行。此后斯堪的纳维亚烟草集团将 Partagás Y Nada Más Santiago 交由它生产——集团品牌托付家族工厂，足见业界对它的看法。

自有品牌名为 William Ventura 与 El Maestro。但本词条首先是为他人而设：这是一家替无厂之家卷制的工厂，而本图集有义务写明谁做了什么。',
        '[{"name":"William Ventura","color":"#5B3A29","force":"未公开","wrapper":"未公开","vitolas":[],"story":"以本厂之名命名的牌子——唯一冠此名者。"},{"name":"El Maestro","color":"#7A4A2C","force":"未公开","wrapper":"未公开","vitolas":[],"story":"第二作坊之名，也是诞生于此的牌子。重建期间全靠它支撑。"}]',
        'تاباكاليرا ويليام فنتورا مصنعٌ في تامبوريل، في المنطقة الحرة بسانتياغو، وقد ذكره هذا الأطلس ثلاث مرات من قبل دون أن يمنحه بطاقة: هناك تُركَّب مزجات كالدويل، وهناك انتهى الأمر بلا باربا إلى تركيب مزجاتها، وهناك تُلفّ أدفنتورا وفرويد.

يأتي ويليام فنتورا من دافيدوف، حيث أدار الإنتاج سنوات طويلة — وكان هناك أصلًا حين وصلت سيجارات دافيدوف إلى الولايات المتحدة سنة 1991. فتح مصنعه الخاص نحو 2007؛ وتختلف المصادر بسنة واحدة، وهذه البطاقة تقول ذلك بدل أن تختار. والتحق به أبناؤه: هندرسون فنتورا، المزّاج، الذي يتكرّر اسمه في التعاونات؛ وويبر، عشرون سنة في دافيدوف قبل أن يغادر سنة 2019 ليبني شيئًا مع أبيه؛ وناتالي، في اللوجستيات والتغليف والمالية، وفي المزج أيضًا.

في 26 أيلول/سبتمبر 2022، قبل الثالثة فجرًا، شبّ حريق في المبنى الذي كان المصنع يتقاسمه مع إنترسيغار. احترق كلّ شيء: نحو 800 ألف سيجار في انتظار التغليف أو التعتيق لفنتورا، و700 ألف سيجار جاهز لإنترسيغار، والمادّة الخام. نحو مئة موظّف، وأقلّ من أربعين لافًّا، ولا مصابين. وأعلن روبرت كالدويل في الأسبوع نفسه أنّ الإنتاج سيُستأنف في ورش فرعية وفي إل مايسترو، المصنع الصغير الذي احتفظت به العائلة لعلاماتها الخاصة.

أعاد المصنع الجديد، بالاسم نفسه، فتح أبوابه في آذار/مارس 2024، والمصنعان يعملان اليوم. ومنذ ذلك الحين عهدت إليه مجموعة التبغ الإسكندنافية بسيجار Partagás Y Nada Más Santiago — علامة مجموعة في مصنع عائلي، وهو ما يقول رأي المهنة فيه.

علامتاه الخاصتان هما William Ventura وEl Maestro. لكنّ البطاقة موجودة أوّلًا من أجل الآخرين: إنّه مصنع يلفّ لدور بلا مصانع، وهذا الأطلس يُلزم نفسه بتسمية من يصنع ماذا.',
        '[{"name":"William Ventura","color":"#5B3A29","force":"غير معلنة","wrapper":"غير معلن","vitolas":[],"story":"العلامة التي تحمل اسم الدار — الوحيدة التي تحمله."},{"name":"El Maestro","color":"#7A4A2C","force":"غير معلنة","wrapper":"غير معلن","vitolas":[],"story":"اسم الورشة الثانوية، والعلامة التي وُلدت فيها. وهي التي صمدت خلال إعادة البناء."}]')
ON DUPLICATE KEY UPDATE `country_id` = VALUES(`country_id`), `founded` = VALUES(`founded`), `factory` = VALUES(`factory`), `source` = VALUES(`source`), `history` = VALUES(`history`), `gamme` = VALUES(`gamme`), `history_en` = VALUES(`history_en`), `gamme_en` = VALUES(`gamme_en`), `history_es` = VALUES(`history_es`), `gamme_es` = VALUES(`gamme_es`), `history_de` = VALUES(`history_de`), `gamme_de` = VALUES(`gamme_de`), `history_zh` = VALUES(`history_zh`), `gamme_zh` = VALUES(`gamme_zh`), `history_ar` = VALUES(`history_ar`), `gamme_ar` = VALUES(`gamme_ar`);

-- ── Kelner Boutique Factory (dominican) ──

INSERT INTO `brands` (`name`, `country_id`, `founded`, `factory`, `source`, `history`, `gamme`, `history_en`, `gamme_en`, `history_es`, `gamme_es`, `history_de`, `gamme_de`, `history_zh`, `gamme_zh`, `history_ar`, `gamme_ar`)
VALUES ('Kelner Boutique Factory',
        'dominican',
        '2012 — Santiago de los Caballeros',
        'Kelner Boutique Factory (KBF), Santiago, Rép. dominicaine',
        'halfwheel.com (fondée en 2012 par Hendrik Kelner Jr. après dix-huit ans chez Tabadom auprès de son père ; The 73, du nom de son année de naissance, avec Privada Cigar Club ; Klaas Pieter Kelner, de la même famille, ouvre sa propre fabrique dans la zone franche de Santiago en 2023) ; casdaglicigars.com « KBF Factory » (Casdagli y a été roulée de 2013 à 2016) ; leafenthusiast.com (Henke Kelner, maître de tabac de Davidoff, fondateur de Tabadom, plus de trente ans) ; cigarjournal.com (Principle y est faite)',
        'Kelner est un nom que tout le cigare dominicain connaît, et pour une raison précise : Hendrik « Henke » Kelner est le maître de tabac qui a fondé et dirigé Tabadom, la fabrique de Davidoff en République dominicaine, pendant plus de trente ans. Son fils, Hendrik Kelner Jr., y a travaillé dix-huit ans à ses côtés avant d''ouvrir la sienne, en 2012, à Santiago de los Caballeros : la Kelner Boutique Factory, que le métier appelle KBF.

Le mot boutique est à prendre au pied de la lettre. C''est une très petite fabrique, et elle a été pensée comme telle — pas une annexe de Davidoff, mais l''endroit où un assembleur formé dans la plus grande maison dominicaine fait des cigares que la plus grande maison ne ferait pas. Elle roule pour d''autres, et c''est ainsi que l''atlas l''a rencontrée : Casdagli y a fait faire ses cigares de 2013 à 2016, entre Cuba et le Costa Rica ; Principle y fait les siens.

Ses marques propres sont rares et signées. Smoking Jacket porte le nom de la maison. The 73 — l''année de naissance de Kelner Jr. — est une collaboration avec Privada Cigar Club, un club américain d''abonnement.

Un autre Kelner a suivi le même chemin : Klaas Pieter Kelner, de la même famille, a ouvert sa propre fabrique dans la zone franche de Santiago en 2023. Plusieurs fabriques, une famille, une école — celle de Davidoff, dont l''atlas porte la fiche.',
        '[{"name":"Smoking Jacket","color":"#3E2A1E","force":"Non divulguée","wrapper":"Non divulguée","vitolas":[],"story":"La marque au nom de la maison."},{"name":"The 73","color":"#6B4226","force":"Non divulguée","wrapper":"Non divulguée","vitolas":[],"story":"L''année de naissance de Hendrik Kelner Jr. Faite avec Privada Cigar Club, club d''abonnement américain."}]',
        'Kelner is a name the whole Dominican cigar world knows, and for a precise reason: Hendrik "Henke" Kelner is the tobacco master who founded and ran Tabadom, Davidoff''s factory in the Dominican Republic, for more than thirty years. His son, Hendrik Kelner Jr., worked there eighteen years at his side before opening his own, in 2012, at Santiago de los Caballeros: the Kelner Boutique Factory, which the trade calls KBF.

The word boutique is to be taken literally. It is a very small factory, and it was conceived as one — not an annex of Davidoff, but the place where a blender trained in the largest Dominican house makes cigars the largest house would not. It rolls for others, and that is how this atlas met it: Casdagli had its cigars made there from 2013 to 2016, between Cuba and Costa Rica; Principle makes its own there.

Its own brands are few and signed. Smoking Jacket carries the house''s name. The 73 — Kelner Jr.''s birth year — is a collaboration with Privada Cigar Club, an American subscription club.

Another Kelner followed the same road: Klaas Pieter Kelner, of the same family, opened his own factory in the Santiago free zone in 2023. Several factories, one family, one school — Davidoff''s, whose entry this atlas carries.',
        '[{"name":"Smoking Jacket","color":"#3E2A1E","force":"Undisclosed","wrapper":"Undisclosed","vitolas":[],"story":"The brand in the house''s name."},{"name":"The 73","color":"#6B4226","force":"Undisclosed","wrapper":"Undisclosed","vitolas":[],"story":"Hendrik Kelner Jr.''s birth year. Made with Privada Cigar Club, an American subscription club."}]',
        'Kelner es un nombre que todo el puro dominicano conoce, y por una razón precisa: Hendrik «Henke» Kelner es el maestro tabaquero que fundó y dirigió Tabadom, la fábrica de Davidoff en la República Dominicana, durante más de treinta años. Su hijo, Hendrik Kelner Jr., trabajó allí dieciocho años a su lado antes de abrir la suya, en 2012, en Santiago de los Caballeros: la Kelner Boutique Factory, que el oficio llama KBF.

La palabra boutique hay que tomarla al pie de la letra. Es una fábrica muy pequeña, y fue pensada como tal — no un anexo de Davidoff, sino el lugar donde un ligador formado en la mayor casa dominicana hace puros que la mayor casa no haría. Lía para otros, y así la encontró este atlas: Casdagli hizo fabricar allí sus puros de 2013 a 2016, entre Cuba y Costa Rica; Principle hace allí los suyos.

Sus marcas propias son escasas y firmadas. Smoking Jacket lleva el nombre de la casa. The 73 — el año de nacimiento de Kelner Jr. — es una colaboración con Privada Cigar Club, un club estadounidense de suscripción.

Otro Kelner siguió el mismo camino: Klaas Pieter Kelner, de la misma familia, abrió su propia fábrica en la zona franca de Santiago en 2023. Varias fábricas, una familia, una escuela — la de Davidoff, cuya ficha lleva este atlas.',
        '[{"name":"Smoking Jacket","color":"#3E2A1E","force":"No divulgada","wrapper":"No divulgada","vitolas":[],"story":"La marca con el nombre de la casa."},{"name":"The 73","color":"#6B4226","force":"No divulgada","wrapper":"No divulgada","vitolas":[],"story":"El año de nacimiento de Hendrik Kelner Jr. Hecha con Privada Cigar Club, club estadounidense de suscripción."}]',
        'Kelner ist ein Name, den die ganze dominikanische Zigarrenwelt kennt, und zwar aus einem genauen Grund: Hendrik „Henke" Kelner ist der Tabakmeister, der Tabadom, die Davidoff-Fabrik in der Dominikanischen Republik, gründete und über dreißig Jahre führte. Sein Sohn Hendrik Kelner Jr. arbeitete dort achtzehn Jahre an seiner Seite, ehe er 2012 in Santiago de los Caballeros seine eigene eröffnete: die Kelner Boutique Factory, in der Branche KBF genannt.

Das Wort Boutique ist wörtlich zu nehmen. Es ist eine sehr kleine Fabrik, und sie wurde als solche gedacht — kein Anhang von Davidoff, sondern der Ort, an dem ein im größten dominikanischen Haus ausgebildeter Blender Zigarren macht, die das größte Haus nicht machen würde. Sie rollt für andere, und so ist ihr dieser Atlas begegnet: Casdagli ließ dort von 2013 bis 2016 fertigen, zwischen Kuba und Costa Rica; Principle lässt dort die eigenen machen.

Die eigenen Marken sind wenige und signiert. Smoking Jacket trägt den Namen des Hauses. The 73 — das Geburtsjahr von Kelner Jr. — ist eine Zusammenarbeit mit dem Privada Cigar Club, einem amerikanischen Abonnementclub.

Ein weiterer Kelner ging denselben Weg: Klaas Pieter Kelner, aus derselben Familie, eröffnete 2023 seine eigene Fabrik in der Freizone von Santiago. Mehrere Fabriken, eine Familie, eine Schule — die von Davidoff, deren Eintrag dieser Atlas führt.',
        '[{"name":"Smoking Jacket","color":"#3E2A1E","force":"Nicht angegeben","wrapper":"Nicht angegeben","vitolas":[],"story":"Die Marke mit dem Namen des Hauses."},{"name":"The 73","color":"#6B4226","force":"Nicht angegeben","wrapper":"Nicht angegeben","vitolas":[],"story":"Das Geburtsjahr von Hendrik Kelner Jr. Gemacht mit dem Privada Cigar Club, einem amerikanischen Abonnementclub."}]',
        '凯尔纳这个姓，多米尼加雪茄界无人不晓，理由很具体：亨德里克·「亨克」·凯尔纳是那位创办并执掌大卫杜夫多米尼加工厂 Tabadom 三十余年的烟草大师。其子亨德里克·凯尔纳二世在父亲身边工作了十八年，2012年在圣地亚哥-德洛斯卡瓦耶罗斯开办了自己的厂：Kelner Boutique Factory，业内称 KBF。

「精品」一词须按字面理解。这是一家很小的工厂，也正是按此设想的——不是大卫杜夫的附属，而是一个在多米尼加最大老号受训的调配师去做最大老号不会做的雪茄的地方。它替他人卷制，本图集正是这样遇见它的：Casdagli 于2013至2016年间——在古巴与哥斯达黎加之间——在此制作雪茄；Principle 至今在此制作。

自有品牌稀少且带署名。Smoking Jacket 冠以厂名。The 73——凯尔纳二世的出生年份——是与美国订阅俱乐部 Privada Cigar Club 的合作。

另一位凯尔纳走了同样的路：同一家族的克拉斯·彼得·凯尔纳于2023年在圣地亚哥自由区开办了自己的工厂。数家工厂，一个家族，一个流派——大卫杜夫的流派，本图集载有其词条。',
        '[{"name":"Smoking Jacket","color":"#3E2A1E","force":"未公开","wrapper":"未公开","vitolas":[],"story":"冠以厂名的牌子。"},{"name":"The 73","color":"#6B4226","force":"未公开","wrapper":"未公开","vitolas":[],"story":"亨德里克·凯尔纳二世的出生年份。与美国订阅俱乐部 Privada Cigar Club 合作制作。"}]',
        'كلنر اسمٌ يعرفه عالم السيجار الدومينيكي كلّه، ولسبب محدّد: هندريك «هنكه» كلنر هو معلّم التبغ الذي أسّس وأدار تابادوم، مصنعَ دافيدوف في جمهورية الدومينيكان، أكثر من ثلاثين سنة. وعمل ابنه هندريك كلنر الابن هناك ثماني عشرة سنة إلى جانبه قبل أن يفتح مصنعه الخاص سنة 2012 في سانتياغو دي لوس كاباييروس: Kelner Boutique Factory، التي تسمّيها المهنة KBF.

وكلمة «بوتيك» تُؤخذ بحرفيّتها. إنّه مصنع صغير جدًّا، وقد صُمّم على هذا النحو — لا ملحقًا لدافيدوف، بل المكان الذي يصنع فيه مزّاجٌ تدرّب في أكبر دار دومينيكية سيجارات لا تصنعها أكبر دار. يلفّ لغيره، وهكذا التقاه هذا الأطلس: صنعت كاسداغلي سيجاراتها هناك من 2013 إلى 2016، بين كوبا وكوستاريكا؛ وتصنع برينسيبل سيجاراتها هناك.

علاماته الخاصة قليلة وموقّعة. Smoking Jacket تحمل اسم الدار. وThe 73 — سنة ميلاد كلنر الابن — تعاونٌ مع Privada Cigar Club، وهو نادي اشتراك أمريكي.

وسلك كلنرٌ آخر الطريقَ نفسها: فتح كلاس بيتر كلنر، من العائلة نفسها، مصنعه الخاص في المنطقة الحرة بسانتياغو سنة 2023. مصانع عدّة، عائلة واحدة، مدرسة واحدة — مدرسة دافيدوف، التي يحمل هذا الأطلس بطاقتها.',
        '[{"name":"Smoking Jacket","color":"#3E2A1E","force":"غير معلنة","wrapper":"غير معلن","vitolas":[],"story":"العلامة التي تحمل اسم الدار."},{"name":"The 73","color":"#6B4226","force":"غير معلنة","wrapper":"غير معلن","vitolas":[],"story":"سنة ميلاد هندريك كلنر الابن. صُنعت مع Privada Cigar Club، نادي الاشتراك الأمريكي."}]')
ON DUPLICATE KEY UPDATE `country_id` = VALUES(`country_id`), `founded` = VALUES(`founded`), `factory` = VALUES(`factory`), `source` = VALUES(`source`), `history` = VALUES(`history`), `gamme` = VALUES(`gamme`), `history_en` = VALUES(`history_en`), `gamme_en` = VALUES(`gamme_en`), `history_es` = VALUES(`history_es`), `gamme_es` = VALUES(`gamme_es`), `history_de` = VALUES(`history_de`), `gamme_de` = VALUES(`gamme_de`), `history_zh` = VALUES(`history_zh`), `gamme_zh` = VALUES(`gamme_zh`), `history_ar` = VALUES(`history_ar`), `gamme_ar` = VALUES(`gamme_ar`);

-- ── J. Fuego (nicaragua) ──

INSERT INTO `brands` (`name`, `country_id`, `founded`, `factory`, `source`, `history`, `gamme`, `history_en`, `gamme_en`, `history_es`, `gamme_es`, `history_de`, `gamme_de`, `history_zh`, `gamme_zh`, `history_ar`, `gamme_ar`)
VALUES ('J. Fuego',
        'nicaragua',
        '2006 — usine à Estelí depuis 2016',
        'J. Fuego Cigar Co. de Nicaragua S.A., Estelí — en face de Tabacalera Perdomo',
        'famous-smoke.com « Master Blenders: Jesus Fuego » et jfuego.com « Our Story » (cinq générations de cultivateurs, ferme dans la région d''El Corojo à Pinar del Río ; ingénieur agronome, thèse sur la fermentation ; a travaillé avec Rocky Patel et Nestor Plasencia ; société en 2006, Gran Reserva Corojo No.1 ; marques 777, Heat, Origen, Sangre de Toro) ; halfwheel.com IPCPR 2016 et 2017 (usine d''Estelí ouverte en 2016, en face de Perdomo) ; cigar-coop.com (7-20-4 y est roulée depuis juillet 2021)',
        'J. Fuego est une fabrique d''Estelí que l''atlas nommait sans la connaître : la fiche 7-20-4 dit que ses cigares y sont roulés depuis juillet 2021. Voici qui roule.

Jesús Fuego est cubain, de Pinar del Río, cinquième génération d''une famille qui cultive le tabac depuis qu''elle a acquis une ferme dans la région d''El Corojo — le nom même de la variété. Ingénieur agronome, il a consacré sa thèse à la fermentation, ce qui n''est pas un détail : c''est l''étape que les maisons gardent le plus jalousement, et celle où se joue le goût. Il a travaillé au Honduras et au Nicaragua, cultivé pour d''autres, et son nom s''est fait auprès de Rocky Patel et de Nestor Plasencia — deux maisons de cet atlas.

En 2006, il fonde sa propre société. Le premier cigare, la Gran Reserva Corojo No.1, dit déjà le programme : le Corojo, la feuille de sa famille, au centre de tout. Origen est un puro de Corojo ; 777 et Heat ont suivi, puis Sangre de Toro.

Pendant dix ans, il fait rouler chez d''autres. En 2016, il ouvre sa propre fabrique à Estelí, en face de Tabacalera Perdomo, et y passe désormais l''essentiel de son temps. C''est là que 7-20-4 a déménagé en 2021, quittant Tabacos de Oriente au Honduras.

Un mot sur 777 : le premier recensement de cet atlas la cherchait comme une maison hondurienne et n''avait rien trouvé. C''était une marque de J. Fuego. Le nom manquant n''était pas absent — il était rangé sous le mauvais pays.',
        '[{"name":"Gran Reserva Corojo No.1","color":"#7A2E1E","force":"Medium-Full","wrapper":"Corojo","vitolas":[],"story":"Le premier cigare de la maison, en 2006 — et son programme : le Corojo au centre de tout."},{"name":"Origen","color":"#8B4A2B","force":"Medium-Full","wrapper":"Corojo","vitolas":[],"story":"Un puro de Corojo, la feuille de la famille Fuego."},{"name":"777","color":"#4A3728","force":"Full","wrapper":"Non divulguée","vitolas":[],"story":"Le nom que le premier recensement de cet atlas cherchait comme une maison hondurienne. C''est une marque de J. Fuego."},{"name":"Sangre de Toro","color":"#6B1F1F","force":"Full","wrapper":"Corojo","vitolas":[],"story":"La plus récente des lignes au Corojo."}]',
        'J. Fuego is a factory in Estelí that this atlas named without knowing it: the 7-20-4 entry says its cigars have been rolled there since July 2021. Here is who rolls them.

Jesús Fuego is Cuban, from Pinar del Río, fifth generation of a family that has grown tobacco since it acquired a farm in the El Corojo region — the very name of the varietal. An agricultural engineer, he devoted his thesis to fermentation, which is no small thing: it is the stage houses guard most jealously, and where the taste is decided. He worked in Honduras and Nicaragua, grew for others, and made his name alongside Rocky Patel and Nestor Plasencia — two houses in this atlas.

In 2006, he founded his own company. The first cigar, the Gran Reserva Corojo No.1, already stated the programme: Corojo, his family''s leaf, at the centre of everything. Origen is a Corojo puro; 777 and Heat followed, then Sangre de Toro.

For ten years, he had his cigars rolled by others. In 2016, he opened his own factory in Estelí, across from Tabacalera Perdomo, and now spends most of his time there. That is where 7-20-4 moved in 2021, leaving Tabacos de Oriente in Honduras.

A word on 777: this atlas''s first census looked for it as a Honduran house and found nothing. It was a J. Fuego brand. The missing name was not absent — it was filed under the wrong country.',
        '[{"name":"Gran Reserva Corojo No.1","color":"#7A2E1E","force":"Medium-Full","wrapper":"Corojo","vitolas":[],"story":"The house''s first cigar, in 2006 — and its programme: Corojo at the centre of everything."},{"name":"Origen","color":"#8B4A2B","force":"Medium-Full","wrapper":"Corojo","vitolas":[],"story":"A Corojo puro, the Fuego family''s leaf."},{"name":"777","color":"#4A3728","force":"Full","wrapper":"Undisclosed","vitolas":[],"story":"The name this atlas''s first census looked for as a Honduran house. It is a J. Fuego brand."},{"name":"Sangre de Toro","color":"#6B1F1F","force":"Full","wrapper":"Corojo","vitolas":[],"story":"The most recent of the Corojo lines."}]',
        'J. Fuego es una fábrica de Estelí que este atlas nombraba sin conocerla: la ficha 7-20-4 dice que sus puros se lían allí desde julio de 2021. He aquí quién los lía.

Jesús Fuego es cubano, de Pinar del Río, quinta generación de una familia que cultiva tabaco desde que adquirió una finca en la región de El Corojo — el nombre mismo de la variedad. Ingeniero agrónomo, dedicó su tesis a la fermentación, lo que no es un detalle: es la etapa que las casas guardan con más celo, y donde se juega el sabor. Trabajó en Honduras y en Nicaragua, cultivó para otros, y su nombre se hizo junto a Rocky Patel y Nestor Plasencia — dos casas de este atlas.

En 2006 funda su propia empresa. El primer puro, la Gran Reserva Corojo No.1, ya anuncia el programa: el Corojo, la hoja de su familia, en el centro de todo. Origen es un puro de Corojo; 777 y Heat siguieron, luego Sangre de Toro.

Durante diez años hace liar en casa de otros. En 2016 abre su propia fábrica en Estelí, frente a Tabacalera Perdomo, y allí pasa ahora lo esencial de su tiempo. Es allí adonde se mudó 7-20-4 en 2021, dejando Tabacos de Oriente en Honduras.

Una palabra sobre 777: el primer censo de este atlas la buscaba como casa hondureña y no había encontrado nada. Era una marca de J. Fuego. El nombre que faltaba no estaba ausente — estaba archivado bajo el país equivocado.',
        '[{"name":"Gran Reserva Corojo No.1","color":"#7A2E1E","force":"Medium-Full","wrapper":"Corojo","vitolas":[],"story":"El primer puro de la casa, en 2006 — y su programa: el Corojo en el centro de todo."},{"name":"Origen","color":"#8B4A2B","force":"Medium-Full","wrapper":"Corojo","vitolas":[],"story":"Un puro de Corojo, la hoja de la familia Fuego."},{"name":"777","color":"#4A3728","force":"Full","wrapper":"No divulgada","vitolas":[],"story":"El nombre que el primer censo de este atlas buscaba como casa hondureña. Es una marca de J. Fuego."},{"name":"Sangre de Toro","color":"#6B1F1F","force":"Full","wrapper":"Corojo","vitolas":[],"story":"La más reciente de las líneas de Corojo."}]',
        'J. Fuego ist eine Fabrik in Estelí, die dieser Atlas nannte, ohne sie zu kennen: Der Eintrag 7-20-4 sagt, dass seine Zigarren seit Juli 2021 dort gerollt werden. Hier ist, wer rollt.

Jesús Fuego ist Kubaner aus Pinar del Río, fünfte Generation einer Familie, die Tabak anbaut, seit sie eine Farm in der Region El Corojo erwarb — dem Namen der Sorte selbst. Als Agraringenieur widmete er seine Abschlussarbeit der Fermentation, was kein Detail ist: Es ist die Stufe, die die Häuser am eifersüchtigsten hüten, und die über den Geschmack entscheidet. Er arbeitete in Honduras und Nicaragua, baute für andere an, und sein Name entstand an der Seite von Rocky Patel und Nestor Plasencia — zwei Häusern dieses Atlas.

2006 gründete er seine eigene Firma. Die erste Zigarre, die Gran Reserva Corojo No.1, sagte schon das Programm: Corojo, das Blatt seiner Familie, im Mittelpunkt von allem. Origen ist ein Corojo-Puro; 777 und Heat folgten, dann Sangre de Toro.

Zehn Jahre lang ließ er bei anderen rollen. 2016 eröffnete er seine eigene Fabrik in Estelí, gegenüber von Tabacalera Perdomo, und verbringt dort nun den größten Teil seiner Zeit. Dorthin zog 7-20-4 im Jahr 2021, weg von Tabacos de Oriente in Honduras.

Ein Wort zu 777: Die erste Bestandsaufnahme dieses Atlas suchte sie als honduranisches Haus und fand nichts. Es war eine Marke von J. Fuego. Der fehlende Name fehlte nicht — er war unter dem falschen Land abgelegt.',
        '[{"name":"Gran Reserva Corojo No.1","color":"#7A2E1E","force":"Medium-Full","wrapper":"Corojo","vitolas":[],"story":"Die erste Zigarre des Hauses, 2006 — und sein Programm: Corojo im Mittelpunkt von allem."},{"name":"Origen","color":"#8B4A2B","force":"Medium-Full","wrapper":"Corojo","vitolas":[],"story":"Ein Corojo-Puro, das Blatt der Familie Fuego."},{"name":"777","color":"#4A3728","force":"Full","wrapper":"Nicht angegeben","vitolas":[],"story":"Der Name, den die erste Bestandsaufnahme dieses Atlas als honduranisches Haus suchte. Es ist eine Marke von J. Fuego."},{"name":"Sangre de Toro","color":"#6B1F1F","force":"Full","wrapper":"Corojo","vitolas":[],"story":"Die jüngste der Corojo-Linien."}]',
        'J. Fuego 是埃斯特利的一家工厂，本图集曾提及却不了解：7-20-4 词条写道，其雪茄自2021年7月起在此卷制。这里说说是谁在卷。

赫苏斯·富埃戈是古巴人，来自比那尔德里奥，家族自购得埃尔科罗霍地区——正是那个品种之名——的一座农场以来种植烟草，他是第五代。作为农业工程师，他的论文以发酵为题，这绝非小事：发酵是各家最严守的环节，也是风味定型之处。他曾在洪都拉斯与尼加拉瓜工作、为他人种植，其名声在洛基·帕特尔与内斯托尔·普拉森西亚身边树立——两者皆在本图集中有词条。

2006年，他创办自己的公司。首款雪茄 Gran Reserva Corojo No.1 已道出纲领：科罗霍，他家族的烟叶，是一切的核心。Origen 是纯科罗霍雪茄；777 与 Heat 随后，再是 Sangre de Toro。

十年间他委托他人卷制。2016年，他在埃斯特利、Tabacalera Perdomo 对面开办自己的工厂，此后大部分时间在此度过。7-20-4 于2021年从洪都拉斯的 Tabacos de Oriente 迁至此处。

关于 777 说一句：本图集首次普查曾把它当作一家洪都拉斯老号来找，一无所获。它其实是 J. Fuego 的一个牌子。缺失的名字并非不存在——只是被归在了错误的国家之下。',
        '[{"name":"Gran Reserva Corojo No.1","color":"#7A2E1E","force":"Medium-Full","wrapper":"科罗霍","vitolas":[],"story":"本厂2006年的第一款雪茄——也是它的纲领：科罗霍是一切的核心。"},{"name":"Origen","color":"#8B4A2B","force":"Medium-Full","wrapper":"科罗霍","vitolas":[],"story":"纯科罗霍雪茄，富埃戈家族的烟叶。"},{"name":"777","color":"#4A3728","force":"Full","wrapper":"未公开","vitolas":[],"story":"本图集首次普查曾把这个名字当作洪都拉斯老号来找。它是 J. Fuego 的牌子。"},{"name":"Sangre de Toro","color":"#6B1F1F","force":"Full","wrapper":"科罗霍","vitolas":[],"story":"科罗霍系列中最新的一支。"}]',
        'جي. فويغو مصنعٌ في إستيلي ذكره هذا الأطلس دون أن يعرفه: تقول بطاقة 7-20-4 إنّ سيجاراتها تُلفّ فيه منذ تموز/يوليو 2021. وهذا من يلفّها.

خيسوس فويغو كوبيّ من بينار ديل ريو، من الجيل الخامس لعائلة تزرع التبغ منذ اقتنت مزرعة في منطقة إل كوروخو — وهو اسم الصنف نفسه. مهندس زراعي، خصّص أطروحته للتخمير، وليس ذلك تفصيلًا: فهي المرحلة التي تحرسها الدور بأشدّ الغيرة، والتي يُحسم فيها الطعم. عمل في هندوراس ونيكاراغوا، وزرع لغيره، وصنع اسمه إلى جانب روكي باتيل ونستور بلاسينسيا — داران في هذا الأطلس.

في 2006 أسّس شركته الخاصة. والسيجار الأوّل، Gran Reserva Corojo No.1، أعلن البرنامج منذ البداية: الكوروخو، ورقة عائلته، في قلب كلّ شيء. Origen سيجار كوروخو خالص؛ وتبعه 777 وHeat، ثم Sangre de Toro.

عشر سنوات وهو يُلفّ عند غيره. وفي 2016 فتح مصنعه الخاص في إستيلي، قبالة تاباكاليرا بيردومو، وصار يقضي فيه جُلّ وقته. وإلى هناك انتقلت 7-20-4 سنة 2021، تاركةً تاباكوس دي أورينتي في هندوراس.

كلمة عن 777: بحث عنها الإحصاء الأوّل لهذا الأطلس بوصفها دارًا هندوراسية فلم يجد شيئًا. كانت علامةً لجي. فويغو. الاسم الناقص لم يكن غائبًا — بل كان مصنَّفًا تحت البلد الخطأ.',
        '[{"name":"Gran Reserva Corojo No.1","color":"#7A2E1E","force":"Medium-Full","wrapper":"كوروخو","vitolas":[],"story":"أوّل سيجار للدار، سنة 2006 — وبرنامجها: الكوروخو في قلب كلّ شيء."},{"name":"Origen","color":"#8B4A2B","force":"Medium-Full","wrapper":"كوروخو","vitolas":[],"story":"سيجار كوروخو خالص، ورقة عائلة فويغو."},{"name":"777","color":"#4A3728","force":"Full","wrapper":"غير معلن","vitolas":[],"story":"الاسم الذي بحث عنه الإحصاء الأوّل لهذا الأطلس بوصفه دارًا هندوراسية. إنّه علامة لجي. فويغو."},{"name":"Sangre de Toro","color":"#6B1F1F","force":"Full","wrapper":"كوروخو","vitolas":[],"story":"أحدث خطوط الكوروخو."}]')
ON DUPLICATE KEY UPDATE `country_id` = VALUES(`country_id`), `founded` = VALUES(`founded`), `factory` = VALUES(`factory`), `source` = VALUES(`source`), `history` = VALUES(`history`), `gamme` = VALUES(`gamme`), `history_en` = VALUES(`history_en`), `gamme_en` = VALUES(`gamme_en`), `history_es` = VALUES(`history_es`), `gamme_es` = VALUES(`gamme_es`), `history_de` = VALUES(`history_de`), `gamme_de` = VALUES(`gamme_de`), `history_zh` = VALUES(`history_zh`), `gamme_zh` = VALUES(`gamme_zh`), `history_ar` = VALUES(`history_ar`), `gamme_ar` = VALUES(`gamme_ar`);

-- ── Reyes Family Cigars (honduras) ──

INSERT INTO `brands` (`name`, `country_id`, `founded`, `factory`, `source`, `history`, `gamme`, `history_en`, `gamme_en`, `history_es`, `gamme_es`, `history_de`, `gamme_de`, `history_zh`, `gamme_zh`, `history_ar`, `gamme_ar`)
VALUES ('Reyes Family Cigars',
        'honduras',
        'Années 1970 (New Jersey) — Danlí depuis 1990',
        'Puros Aliados, Danlí, Honduras — environ cinq millions de cigares par an',
        'cigaraficionado.com « Oliva Cigar Co. Acquires Cuba Aliados and Puros Indios Brands » (6 août 2021 : Cuba Aliados, Puros Indios et Roly vendues par Carlos Diez, petit-fils du fondateur ; l''usine de Danlí exclue de la vente ; fabrication passée au Nicaragua ; la famille continue Premier, Classic, Vintage, Cienfuegos et le travail à façon), « CLE to Distribute Reyes Family Cigars » (1er septembre 2016 : distribution par C.L.E. de Christian Eiroa dès le 12 septembre) et « Cigar Kings » (Cuba Aliados née dans les années 1970 au New Jersey ; consolidation à Danlí en 1990 ; Puros Indios en 1995 ; cinq millions de cigares par an) ; halfwheel.com ; en.wikipedia.org « Rolando Reyes Sr. » (1923–2012). Kafie y a fait rouler ses cigares de 2013 à 2017',
        'Rolando Reyes Sr. avait une fabrique à Cuba. Elle s''appelait Cuba Aliados, et elle lui a été confisquée. Il est parti, et dans les années 1970 il a recommencé — au New Jersey d''abord, puis à Miami et en République dominicaine, avant de tout rassembler à Danlí, au Honduras, en 1990. Il est mort en 2012, à quatre-vingt-neuf ans, et son petit-fils Carlos Diez dirige la maison.

Ce qu''elle fabrique : quelque cinq millions de cigares par an, dont un demi-million sous la marque Puros Indios, lancée en 1995. Depuis septembre 2016, c''est C.L.E. — la maison de Christian Eiroa, qui a sa fiche — qui les distribue depuis Miami. Le nom d''Eiroa revient ainsi une fois de plus dans cet atlas, sur une maison qui n''est pas la sienne.

Puis un tournant, en août 2021 : la famille a vendu ses trois marques historiques — Cuba Aliados, Puros Indios et Roly — à Oliva. Les marques seulement : l''usine de Danlí n''était pas dans la vente, et leur fabrication est passée au Nicaragua, chez Oliva. C''est la raison pour laquelle la fiche Oliva les porte désormais, et pourquoi cette fiche-ci ne s''appelle ni Cuba Aliados ni Puros Indios.

La fabrique continue sous le nom de la famille, avec Premier, Classic, Vintage et Cienfuegos, et avec le travail à façon qui a toujours fait vivre les ateliers de Danlí : Kafie y a fait rouler ses cigares de 2013 à 2017, avant d''ouvrir les siens.

Une maison qui vend ses marques et garde son usine, c''est l''inverse de ce qu''on voit d''ordinaire — et c''est exactement pourquoi l''atlas, qui classe par le lieu de fabrication, la garde au Honduras.',
        '[{"name":"Premier","color":"#6B4226","force":"Non divulguée","wrapper":"Non divulguée","vitolas":[],"story":"L''une des quatre marques que la famille a gardées après la vente de 2021."},{"name":"Classic","color":"#7A4A2C","force":"Non divulguée","wrapper":"Non divulguée","vitolas":[],"story":"Gardée après la vente de 2021."},{"name":"Vintage","color":"#5B3A29","force":"Non divulguée","wrapper":"Non divulguée","vitolas":[],"story":"Gardée après la vente de 2021."},{"name":"Cienfuegos","color":"#4A3728","force":"Non divulguée","wrapper":"Non divulguée","vitolas":[],"story":"Le nom d''une ville cubaine, sur une marque que la famille a gardée."}]',
        'Rolando Reyes Sr. had a factory in Cuba. It was called Cuba Aliados, and it was confiscated from him. He left, and in the 1970s he started again — in New Jersey first, then in Miami and the Dominican Republic, before gathering everything at Danlí, in Honduras, in 1990. He died in 2012, at eighty-nine, and his grandson Carlos Diez runs the house.

What it makes: some five million cigars a year, half a million of them under the Puros Indios brand, launched in 1995. Since September 2016, it is C.L.E. — Christian Eiroa''s house, which has its entry — that distributes them from Miami. The Eiroa name thus returns once more in this atlas, on a house that is not his own.

Then a turn, in August 2021: the family sold its three historic brands — Cuba Aliados, Puros Indios and Roly — to Oliva. The brands only: the Danlí factory was not in the sale, and their production moved to Nicaragua, at Oliva. That is why the Oliva entry now carries them, and why this entry is called neither Cuba Aliados nor Puros Indios.

The factory goes on under the family''s name, with Premier, Classic, Vintage and Cienfuegos, and with the contract work that has always kept Danlí''s workshops alive: Kafie had its cigars rolled there from 2013 to 2017, before opening its own.

A house that sells its brands and keeps its factory is the reverse of what one usually sees — and it is exactly why this atlas, which classifies by place of manufacture, keeps it in Honduras.',
        '[{"name":"Premier","color":"#6B4226","force":"Undisclosed","wrapper":"Undisclosed","vitolas":[],"story":"One of the four brands the family kept after the 2021 sale."},{"name":"Classic","color":"#7A4A2C","force":"Undisclosed","wrapper":"Undisclosed","vitolas":[],"story":"Kept after the 2021 sale."},{"name":"Vintage","color":"#5B3A29","force":"Undisclosed","wrapper":"Undisclosed","vitolas":[],"story":"Kept after the 2021 sale."},{"name":"Cienfuegos","color":"#4A3728","force":"Undisclosed","wrapper":"Undisclosed","vitolas":[],"story":"The name of a Cuban city, on a brand the family kept."}]',
        'Rolando Reyes Sr. tenía una fábrica en Cuba. Se llamaba Cuba Aliados, y se la confiscaron. Se fue, y en los años setenta volvió a empezar — en Nueva Jersey primero, luego en Miami y en la República Dominicana, antes de reunirlo todo en Danlí, Honduras, en 1990. Murió en 2012, a los ochenta y nueve años, y su nieto Carlos Diez dirige la casa.

Lo que fabrica: unos cinco millones de puros al año, medio millón de ellos bajo la marca Puros Indios, lanzada en 1995. Desde septiembre de 2016, es C.L.E. — la casa de Christian Eiroa, que tiene su ficha — quien los distribuye desde Miami. El nombre de Eiroa vuelve así una vez más en este atlas, sobre una casa que no es la suya.

Luego un giro, en agosto de 2021: la familia vendió sus tres marcas históricas — Cuba Aliados, Puros Indios y Roly — a Oliva. Solo las marcas: la fábrica de Danlí no entraba en la venta, y su fabricación pasó a Nicaragua, a Oliva. Por eso la ficha Oliva las lleva ahora, y por eso esta ficha no se llama ni Cuba Aliados ni Puros Indios.

La fábrica sigue bajo el nombre de la familia, con Premier, Classic, Vintage y Cienfuegos, y con el trabajo a maquila que siempre ha dado vida a los talleres de Danlí: Kafie hizo liar allí sus puros de 2013 a 2017, antes de abrir los suyos.

Una casa que vende sus marcas y conserva su fábrica es lo contrario de lo que suele verse — y es exactamente por eso que este atlas, que clasifica por el lugar de fabricación, la mantiene en Honduras.',
        '[{"name":"Premier","color":"#6B4226","force":"No divulgada","wrapper":"No divulgada","vitolas":[],"story":"Una de las cuatro marcas que la familia conservó tras la venta de 2021."},{"name":"Classic","color":"#7A4A2C","force":"No divulgada","wrapper":"No divulgada","vitolas":[],"story":"Conservada tras la venta de 2021."},{"name":"Vintage","color":"#5B3A29","force":"No divulgada","wrapper":"No divulgada","vitolas":[],"story":"Conservada tras la venta de 2021."},{"name":"Cienfuegos","color":"#4A3728","force":"No divulgada","wrapper":"No divulgada","vitolas":[],"story":"El nombre de una ciudad cubana, en una marca que la familia conservó."}]',
        'Rolando Reyes Sr. hatte eine Fabrik in Kuba. Sie hieß Cuba Aliados, und sie wurde ihm beschlagnahmt. Er ging, und in den 1970er-Jahren fing er neu an — zuerst in New Jersey, dann in Miami und der Dominikanischen Republik, ehe er 1990 alles in Danlí, Honduras, zusammenführte. Er starb 2012 mit neunundachtzig Jahren, und sein Enkel Carlos Diez führt das Haus.

Was es herstellt: rund fünf Millionen Zigarren im Jahr, eine halbe Million davon unter der 1995 lancierten Marke Puros Indios. Seit September 2016 vertreibt sie C.L.E. — das Haus von Christian Eiroa, das seinen Eintrag hat — von Miami aus. Der Name Eiroa kehrt damit in diesem Atlas ein weiteres Mal wieder, auf einem Haus, das nicht sein eigenes ist.

Dann eine Wende, im August 2021: Die Familie verkaufte ihre drei historischen Marken — Cuba Aliados, Puros Indios und Roly — an Oliva. Nur die Marken: Die Fabrik in Danlí war nicht Teil des Verkaufs, und ihre Fertigung wanderte nach Nicaragua, zu Oliva. Darum trägt der Oliva-Eintrag sie jetzt, und darum heißt dieser Eintrag weder Cuba Aliados noch Puros Indios.

Die Fabrik läuft unter dem Namen der Familie weiter, mit Premier, Classic, Vintage und Cienfuegos, und mit der Lohnfertigung, von der die Werkstätten in Danlí immer gelebt haben: Kafie ließ dort von 2013 bis 2017 rollen, bevor es die eigene eröffnete.

Ein Haus, das seine Marken verkauft und seine Fabrik behält, ist das Gegenteil dessen, was man gewöhnlich sieht — und genau deshalb hält dieser Atlas, der nach dem Ort der Herstellung ordnet, es in Honduras.',
        '[{"name":"Premier","color":"#6B4226","force":"Nicht angegeben","wrapper":"Nicht angegeben","vitolas":[],"story":"Eine der vier Marken, die die Familie nach dem Verkauf von 2021 behielt."},{"name":"Classic","color":"#7A4A2C","force":"Nicht angegeben","wrapper":"Nicht angegeben","vitolas":[],"story":"Nach dem Verkauf von 2021 behalten."},{"name":"Vintage","color":"#5B3A29","force":"Nicht angegeben","wrapper":"Nicht angegeben","vitolas":[],"story":"Nach dem Verkauf von 2021 behalten."},{"name":"Cienfuegos","color":"#4A3728","force":"Nicht angegeben","wrapper":"Nicht angegeben","vitolas":[],"story":"Der Name einer kubanischen Stadt, auf einer Marke, die die Familie behielt."}]',
        '罗兰多·雷耶斯老先生在古巴有一家工厂，名叫 Cuba Aliados，后被没收。他离开了，在1970年代重新开始——先在新泽西，后在迈阿密与多米尼加共和国，直到1990年将一切集中到洪都拉斯的丹利。他于2012年去世，享年八十九岁，如今由孙子卡洛斯·迪耶斯主持。

它生产什么：每年约五百万支雪茄，其中五十万支以1995年推出的 Puros Indios 之名出品。自2016年9月起，由 C.L.E.——克里斯蒂安·埃罗亚的公司，本图集有其词条——从迈阿密负责分销。埃罗亚之名由此再次出现在本图集中，落在一家并非他自己的公司上。

随后是2021年8月的转折：家族把三个历史品牌——Cuba Aliados、Puros Indios 与 Roly——卖给了奥利瓦。只卖品牌：丹利的工厂不在交易之列，而这些品牌的生产转到了尼加拉瓜的奥利瓦。这就是奥利瓦词条如今收录它们的原因，也是本词条既不叫 Cuba Aliados 也不叫 Puros Indios 的原因。

工厂以家族之名继续运营，出品 Premier、Classic、Vintage 与 Cienfuegos，并承接一直支撑着丹利各作坊的代工：Kafie 于2013至2017年在此卷制雪茄，之后才自建工厂。

卖掉品牌却留下工厂，与常见情形恰好相反——而这正是本图集——按制造地分类——将它归于洪都拉斯的原因。',
        '[{"name":"Premier","color":"#6B4226","force":"未公开","wrapper":"未公开","vitolas":[],"story":"2021年出售之后家族保留的四个牌子之一。"},{"name":"Classic","color":"#7A4A2C","force":"未公开","wrapper":"未公开","vitolas":[],"story":"2021年出售之后保留。"},{"name":"Vintage","color":"#5B3A29","force":"未公开","wrapper":"未公开","vitolas":[],"story":"2021年出售之后保留。"},{"name":"Cienfuegos","color":"#4A3728","force":"未公开","wrapper":"未公开","vitolas":[],"story":"一座古巴城市之名，用在家族保留的牌子上。"}]',
        'كان لرولاندو رييس الأب مصنعٌ في كوبا. كان اسمه Cuba Aliados، وصودر منه. رحل، وفي سبعينيات القرن الماضي بدأ من جديد — في نيوجيرسي أوّلًا، ثم في ميامي وجمهورية الدومينيكان، قبل أن يجمع كلّ شيء في دانلي بهندوراس سنة 1990. توفّي سنة 2012 عن تسع وثمانين سنة، ويدير حفيده كارلوس دييس الدار.

ما تصنعه: نحو خمسة ملايين سيجار في السنة، نصف مليون منها تحت علامة Puros Indios التي أُطلقت سنة 1995. ومنذ أيلول/سبتمبر 2016 تتولّى C.L.E. — دار كريستيان إيروا، التي لها بطاقتها — توزيعها من ميامي. وهكذا يعود اسم إيروا مرّة أخرى في هذا الأطلس، على دار ليست داره.

ثم منعطف، في آب/أغسطس 2021: باعت العائلة علاماتها التاريخية الثلاث — Cuba Aliados وPuros Indios وRoly — إلى أوليفا. العلامات فقط: لم يكن مصنع دانلي ضمن الصفقة، وانتقل إنتاجها إلى نيكاراغوا، عند أوليفا. ولهذا تحملها بطاقة أوليفا الآن، ولهذا لا تُسمّى هذه البطاقة Cuba Aliados ولا Puros Indios.

يستمرّ المصنع باسم العائلة، مع Premier وClassic وVintage وCienfuegos، ومع العمل بالوكالة الذي طالما أعاش ورش دانلي: فقد لفّت كافي سيجاراتها فيه من 2013 إلى 2017، قبل أن تفتح مصنعها.

دارٌ تبيع علاماتها وتحتفظ بمصنعها هي عكس ما يُرى عادةً — وهذا بالضبط ما يجعل هذا الأطلس، الذي يصنّف بحسب مكان الصنع، يُبقيها في هندوراس.',
        '[{"name":"Premier","color":"#6B4226","force":"غير معلنة","wrapper":"غير معلن","vitolas":[],"story":"إحدى العلامات الأربع التي احتفظت بها العائلة بعد بيع 2021."},{"name":"Classic","color":"#7A4A2C","force":"غير معلنة","wrapper":"غير معلن","vitolas":[],"story":"احتُفظ بها بعد بيع 2021."},{"name":"Vintage","color":"#5B3A29","force":"غير معلنة","wrapper":"غير معلن","vitolas":[],"story":"احتُفظ بها بعد بيع 2021."},{"name":"Cienfuegos","color":"#4A3728","force":"غير معلنة","wrapper":"غير معلن","vitolas":[],"story":"اسم مدينة كوبية، على علامة احتفظت بها العائلة."}]')
ON DUPLICATE KEY UPDATE `country_id` = VALUES(`country_id`), `founded` = VALUES(`founded`), `factory` = VALUES(`factory`), `source` = VALUES(`source`), `history` = VALUES(`history`), `gamme` = VALUES(`gamme`), `history_en` = VALUES(`history_en`), `gamme_en` = VALUES(`gamme_en`), `history_es` = VALUES(`history_es`), `gamme_es` = VALUES(`gamme_es`), `history_de` = VALUES(`history_de`), `gamme_de` = VALUES(`gamme_de`), `history_zh` = VALUES(`history_zh`), `gamme_zh` = VALUES(`gamme_zh`), `history_ar` = VALUES(`history_ar`), `gamme_ar` = VALUES(`gamme_ar`);


-- ── OLIVA : les trois marques rachetees en aout 2021 entrent dans la gamme ──
UPDATE `brands` SET `gamme` = CONCAT(SUBSTRING(`gamme`, 1, CHAR_LENGTH(`gamme`) - 1), ',{"name":"Cuba Aliados","color":"#7A2E1E","force":"Medium-Full","wrapper":"Non divulguée","vitolas":[],"story":"Marque de la famille Reyes, née à Cuba puis refaite au Honduras ; rachetée par Oliva en août 2021, avec Puros Indios et Roly, et roulée depuis au Nicaragua. Voir Reyes Family Cigars."},{"name":"Puros Indios","color":"#6B4226","force":"Medium","wrapper":"Non divulguée","vitolas":[],"story":"Lancée en 1995 par la famille Reyes à Danlí ; à Oliva depuis août 2021, roulée au Nicaragua."},{"name":"Roly","color":"#5B3A29","force":"Medium","wrapper":"Non divulguée","vitolas":[],"story":"La troisième marque du rachat d''août 2021."}]')
 WHERE `name` = 'Oliva' AND `gamme` LIKE '[%]' AND `gamme` NOT LIKE '%Cuba Aliados%';
UPDATE `brands` SET `gamme_en` = CONCAT(SUBSTRING(`gamme_en`, 1, CHAR_LENGTH(`gamme_en`) - 1), ',{"name":"Cuba Aliados","color":"#7A2E1E","force":"Medium-Full","wrapper":"Undisclosed","vitolas":[],"story":"A Reyes family brand, born in Cuba and remade in Honduras; bought by Oliva in August 2021, with Puros Indios and Roly, and rolled in Nicaragua since. See Reyes Family Cigars."},{"name":"Puros Indios","color":"#6B4226","force":"Medium","wrapper":"Undisclosed","vitolas":[],"story":"Launched in 1995 by the Reyes family at Danlí; at Oliva since August 2021, rolled in Nicaragua."},{"name":"Roly","color":"#5B3A29","force":"Medium","wrapper":"Undisclosed","vitolas":[],"story":"The third brand of the August 2021 purchase."}]')
 WHERE `name` = 'Oliva' AND `gamme_en` LIKE '[%]' AND `gamme_en` NOT LIKE '%Cuba Aliados%';
UPDATE `brands` SET `gamme_es` = CONCAT(SUBSTRING(`gamme_es`, 1, CHAR_LENGTH(`gamme_es`) - 1), ',{"name":"Cuba Aliados","color":"#7A2E1E","force":"Medium-Full","wrapper":"No divulgada","vitolas":[],"story":"Marca de la familia Reyes, nacida en Cuba y rehecha en Honduras; comprada por Oliva en agosto de 2021, con Puros Indios y Roly, y liada desde entonces en Nicaragua. Véase Reyes Family Cigars."},{"name":"Puros Indios","color":"#6B4226","force":"Medium","wrapper":"No divulgada","vitolas":[],"story":"Lanzada en 1995 por la familia Reyes en Danlí; en Oliva desde agosto de 2021, liada en Nicaragua."},{"name":"Roly","color":"#5B3A29","force":"Medium","wrapper":"No divulgada","vitolas":[],"story":"La tercera marca de la compra de agosto de 2021."}]')
 WHERE `name` = 'Oliva' AND `gamme_es` LIKE '[%]' AND `gamme_es` NOT LIKE '%Cuba Aliados%';
UPDATE `brands` SET `gamme_de` = CONCAT(SUBSTRING(`gamme_de`, 1, CHAR_LENGTH(`gamme_de`) - 1), ',{"name":"Cuba Aliados","color":"#7A2E1E","force":"Medium-Full","wrapper":"Nicht angegeben","vitolas":[],"story":"Eine Marke der Familie Reyes, in Kuba entstanden und in Honduras neu gemacht; im August 2021 von Oliva gekauft, mit Puros Indios und Roly, und seither in Nicaragua gerollt. Siehe Reyes Family Cigars."},{"name":"Puros Indios","color":"#6B4226","force":"Medium","wrapper":"Nicht angegeben","vitolas":[],"story":"1995 von der Familie Reyes in Danlí lanciert; seit August 2021 bei Oliva, in Nicaragua gerollt."},{"name":"Roly","color":"#5B3A29","force":"Medium","wrapper":"Nicht angegeben","vitolas":[],"story":"Die dritte Marke des Kaufs vom August 2021."}]')
 WHERE `name` = 'Oliva' AND `gamme_de` LIKE '[%]' AND `gamme_de` NOT LIKE '%Cuba Aliados%';
UPDATE `brands` SET `gamme_zh` = CONCAT(SUBSTRING(`gamme_zh`, 1, CHAR_LENGTH(`gamme_zh`) - 1), ',{"name":"Cuba Aliados","color":"#7A2E1E","force":"Medium-Full","wrapper":"未公开","vitolas":[],"story":"雷耶斯家族的牌子，生于古巴、重建于洪都拉斯；2021年8月连同 Puros Indios 与 Roly 一起被奥利瓦收购，此后在尼加拉瓜卷制。参见 Reyes Family Cigars。"},{"name":"Puros Indios","color":"#6B4226","force":"Medium","wrapper":"未公开","vitolas":[],"story":"1995年由雷耶斯家族在丹利推出；2021年8月起归奥利瓦，在尼加拉瓜卷制。"},{"name":"Roly","color":"#5B3A29","force":"Medium","wrapper":"未公开","vitolas":[],"story":"2021年8月收购的第三个牌子。"}]')
 WHERE `name` = 'Oliva' AND `gamme_zh` LIKE '[%]' AND `gamme_zh` NOT LIKE '%Cuba Aliados%';
UPDATE `brands` SET `gamme_ar` = CONCAT(SUBSTRING(`gamme_ar`, 1, CHAR_LENGTH(`gamme_ar`) - 1), ',{"name":"Cuba Aliados","color":"#7A2E1E","force":"Medium-Full","wrapper":"غير معلن","vitolas":[],"story":"علامة لعائلة رييس، وُلدت في كوبا وأُعيد صنعها في هندوراس؛ اشترتها أوليفا في آب/أغسطس 2021 مع Puros Indios وRoly، وتُلفّ منذ ذلك الحين في نيكاراغوا. انظر Reyes Family Cigars."},{"name":"Puros Indios","color":"#6B4226","force":"Medium","wrapper":"غير معلن","vitolas":[],"story":"أطلقتها عائلة رييس في دانلي سنة 1995؛ عند أوليفا منذ آب/أغسطس 2021، وتُلفّ في نيكاراغوا."},{"name":"Roly","color":"#5B3A29","force":"Medium","wrapper":"غير معلن","vitolas":[],"story":"العلامة الثالثة في صفقة آب/أغسطس 2021."}]')
 WHERE `name` = 'Oliva' AND `gamme_ar` LIKE '[%]' AND `gamme_ar` NOT LIKE '%Cuba Aliados%';

-- ── CALDWELL et LA BARBA : la fabrique a brule, les fiches ne le disaient pas ──
UPDATE `brands` SET `history` = CONCAT(`history`, '

Le 26 septembre 2022, un incendie a détruit la Tabacalera William Ventura ; la production a repris dans des ateliers satellites et à El Maestro, et la nouvelle fabrique a rouvert en mars 2024 sous le même nom. Elle a désormais sa fiche dans cet atlas.')
 WHERE `name` = 'Caldwell Cigar Co.' AND `history` NOT LIKE '%2022%';
UPDATE `brands` SET `history_en` = CONCAT(`history_en`, '

On 26 September 2022, a fire destroyed Tabacalera William Ventura; production resumed at satellite workshops and at El Maestro, and the new factory reopened in March 2024 under the same name. It now has its own entry in this atlas.')
 WHERE `name` = 'Caldwell Cigar Co.' AND `history_en` NOT LIKE '%2022%';
UPDATE `brands` SET `history_es` = CONCAT(`history_es`, '

El 26 de septiembre de 2022, un incendio destruyó la Tabacalera William Ventura; la producción se reanudó en talleres satélite y en El Maestro, y la nueva fábrica reabrió en marzo de 2024 con el mismo nombre. Ahora tiene su propia ficha en este atlas.')
 WHERE `name` = 'Caldwell Cigar Co.' AND `history_es` NOT LIKE '%2022%';
UPDATE `brands` SET `history_de` = CONCAT(`history_de`, '

Am 26. September 2022 zerstörte ein Feuer die Tabacalera William Ventura; die Produktion ging in Satellitenwerkstätten und bei El Maestro weiter, und die neue Fabrik öffnete im März 2024 unter demselben Namen wieder. Sie hat nun ihren eigenen Eintrag in diesem Atlas.')
 WHERE `name` = 'Caldwell Cigar Co.' AND `history_de` NOT LIKE '%2022%';
UPDATE `brands` SET `history_zh` = CONCAT(`history_zh`, '

2022年9月26日，一场火灾烧毁了 Tabacalera William Ventura；生产转往卫星作坊与 El Maestro 继续，同名新厂于2024年3月重开。它如今在本图集中有了自己的词条。')
 WHERE `name` = 'Caldwell Cigar Co.' AND `history_zh` NOT LIKE '%2022%';
UPDATE `brands` SET `history_ar` = CONCAT(`history_ar`, '

في 26 أيلول/سبتمبر 2022 دمّر حريقٌ تاباكاليرا ويليام فنتورا؛ واستُؤنف الإنتاج في ورش فرعية وفي إل مايسترو، وأعاد المصنع الجديد فتح أبوابه في آذار/مارس 2024 بالاسم نفسه. وله الآن بطاقته الخاصة في هذا الأطلس.')
 WHERE `name` = 'Caldwell Cigar Co.' AND `history_ar` NOT LIKE '%2022%';
UPDATE `brands` SET `history` = CONCAT(`history`, '

Le 26 septembre 2022, un incendie a détruit la Tabacalera William Ventura ; la production a repris dans des ateliers satellites et à El Maestro, et la nouvelle fabrique a rouvert en mars 2024 sous le même nom. Elle a désormais sa fiche dans cet atlas.')
 WHERE `name` = 'La Barba' AND `history` NOT LIKE '%2022%';
UPDATE `brands` SET `history_en` = CONCAT(`history_en`, '

On 26 September 2022, a fire destroyed Tabacalera William Ventura; production resumed at satellite workshops and at El Maestro, and the new factory reopened in March 2024 under the same name. It now has its own entry in this atlas.')
 WHERE `name` = 'La Barba' AND `history_en` NOT LIKE '%2022%';
UPDATE `brands` SET `history_es` = CONCAT(`history_es`, '

El 26 de septiembre de 2022, un incendio destruyó la Tabacalera William Ventura; la producción se reanudó en talleres satélite y en El Maestro, y la nueva fábrica reabrió en marzo de 2024 con el mismo nombre. Ahora tiene su propia ficha en este atlas.')
 WHERE `name` = 'La Barba' AND `history_es` NOT LIKE '%2022%';
UPDATE `brands` SET `history_de` = CONCAT(`history_de`, '

Am 26. September 2022 zerstörte ein Feuer die Tabacalera William Ventura; die Produktion ging in Satellitenwerkstätten und bei El Maestro weiter, und die neue Fabrik öffnete im März 2024 unter demselben Namen wieder. Sie hat nun ihren eigenen Eintrag in diesem Atlas.')
 WHERE `name` = 'La Barba' AND `history_de` NOT LIKE '%2022%';
UPDATE `brands` SET `history_zh` = CONCAT(`history_zh`, '

2022年9月26日，一场火灾烧毁了 Tabacalera William Ventura；生产转往卫星作坊与 El Maestro 继续，同名新厂于2024年3月重开。它如今在本图集中有了自己的词条。')
 WHERE `name` = 'La Barba' AND `history_zh` NOT LIKE '%2022%';
UPDATE `brands` SET `history_ar` = CONCAT(`history_ar`, '

في 26 أيلول/سبتمبر 2022 دمّر حريقٌ تاباكاليرا ويليام فنتورا؛ واستُؤنف الإنتاج في ورش فرعية وفي إل مايسترو، وأعاد المصنع الجديد فتح أبوابه في آذار/مارس 2024 بالاسم نفسه. وله الآن بطاقته الخاصة في هذا الأطلس.')
 WHERE `name` = 'La Barba' AND `history_ar` NOT LIKE '%2022%';

-- ── LES PAYS : `brands` reecrit en litteral complet ──
UPDATE `producer_countries` SET `brands` = '[{"desc":"Opus X — les plus convoités au monde","name":"Arturo Fuente","iconic":true},{"desc":"Luxe suisse, manufacture dominicaine","name":"Davidoff","iconic":true},{"desc":"Artisanat d''exception depuis 1996","name":"La Flor Dominicana","iconic":true},{"desc":"Standard mondial du Connecticut","name":"Macanudo","iconic":false},{"desc":"ESG et VSG, intemporels","name":"Ashton","iconic":false},{"desc":"Créée par le pianiste Avo Uvezian","name":"Avo","iconic":false},{"desc":"La douceur comme valeur absolue, depuis 1993","name":"Santa Damiana","iconic":false},{"desc":"1903, la plus ancienne manufacture dominicaine","name":"La Aurora","iconic":true},{"desc":"Repartir de zéro après une carrière entière","name":"E.P. Carrillo","iconic":true},{"desc":"1974, avant la vague — et toujours familiale","name":"Quesada","iconic":false},{"desc":"Tamboril, où la même main roule plusieurs bagues","name":"PDR Cigars","iconic":false},{"desc":"L''autre Montecristo, celui d''après 1960","name":"Montecristo Dominicain","iconic":true},{"desc":"Même bague que le havane, autre cigare","name":"Romeo y Julieta Dominicain","iconic":false},{"desc":"Le cigare que des dizaines de milliers de gens fument vraiment","name":"VegaFina","iconic":true},{"desc":"Un bon cigare selon le marché d''avant la mode de la puissance","name":"Don Diego","iconic":false},{"desc":"Né d''une boîte de nuit genevoise, et cela s''entend","name":"The Griffin''s","iconic":false},{"desc":"Un industriel redevenu artisan","name":"Matilde","iconic":false},{"desc":"La bague au pied du cigare — personne d''autre n''a osé","name":"Juan Clemente","iconic":false},{"desc":"Cape venue du Cameroun, cigares roulés ici","name":"Meerapfel","iconic":false},{"desc":"Née chez El Credito, à Miami, en 1972","name":"La Gloria Cubana Dominicaine","iconic":false},{"desc":"Tabacalera de García, La Romana","name":"H. Upmann Dominicain","iconic":false},{"desc":"Ne subsiste que hors de Cuba","name":"Henry Clay","iconic":false},{"desc":"Collection non cubaine annoncée en 2016","name":"Por Larrañaga Dominicain","iconic":false},{"name":"Boutique Blends","desc":"Rafael Nodal — Aging Room et Swag, chez Jochy Blanco","iconic":false},{"name":"Diamond Crown","desc":"La commande de Stanford Newman à Carlos Fuente Sr., pour le centenaire de 1995","iconic":false},{"name":"Cuesta-Rey","desc":"1884, Ybor City — plus ancienne que la maison qui la possède","iconic":false},{"name":"Tabacalera Palma","desc":"1936 — la fabrique dont sortent Aging Room, Swag, La Galera et Matilde","iconic":true},{"name":"Aging Room","desc":"Rafael Nodal compose, Jochy Blanco fabrique — et ils sont associés","iconic":true},{"name":"Swag","desc":"L''autre marque de Boutique Blends, même atelier, sans cérémonie","iconic":false},{"name":"Kristoff","desc":"Une visite non sollicitée en 2004, et un financier qui change de métier","iconic":false},{"name":"Caldwell Cigar Co.","desc":"Des tabacs rares plutôt qu''une recette reproductible","iconic":false},{"name":"Casa Cuevas","desc":"Tabacalera Las Lavas — trois générations sur un même assemblage","iconic":false},{"name":"Ferio Tego","desc":"L''héritière de Nat Sherman : Quesada et Plasencia se partagent son catalogue","iconic":true},{"name":"Paul Garmirian","desc":"Un livre en 1990, puis un cigare — roulé chez la fabrique qui fait l''Avo","iconic":false},{"name":"La Barba","desc":"Partie du Honduras pour l''atelier des Ventura, celui de Caldwell","iconic":false},{"name":"De Los Reyes Cigars","desc":"Leo cultive, Nirka dirige — et l''atelier roule aussi pour d''autres","iconic":false},{"name":"Tabacalera William Ventura","desc":"La fabrique de Caldwell et de La Barba — brûlée en 2022, rouverte en 2024","iconic":false},{"name":"Kelner Boutique Factory","desc":"2012, Santiago — la petite fabrique du fils du maître de tabac de Davidoff","iconic":false}]' WHERE `id` = 'dominican';
UPDATE `producer_countries` SET `brands` = '[{"desc":"Référence absolue du Nicaragua premium","name":"Padrón","iconic":true},{"desc":"Pepin Garcia, maître torcedor légendaire","name":"My Father","iconic":true},{"desc":"Serie V mondialement reconnue","name":"Oliva","iconic":true},{"desc":"Liga Privada, révolution moderne","name":"Drew Estate","iconic":true},{"desc":"Plus grand producteur familial","name":"Plasencia","iconic":false},{"desc":"Élégance et puissance fusionnées","name":"Rocky Patel","iconic":false},{"desc":"Maître du Connecticut nicaraguayen","name":"Perdomo","iconic":false},{"desc":"Plus ancienne manufacture du pays","name":"Joya de Nicaragua","iconic":false},{"desc":"Le mélange privé de Jonathan Drew, devenu culte","name":"Liga Privada","iconic":false},{"desc":"Maison suisse de 1888, roulée à Estelí","name":"Villiger","iconic":false},{"desc":"Le rouleur que les autres marques employaient sans le nommer","name":"A.J. Fernandez","iconic":true},{"desc":"D''abord un planteur de Jalapa, ensuite une marque","name":"Aganorsa Leaf","iconic":true},{"desc":"La grammaire cubaine, la matière nicaraguayenne","name":"Tatuaje","iconic":false},{"desc":"Celle qui a rendu le petit format respectable","name":"Illusione","iconic":false},{"desc":"Un cigare ancré dans une culture, pas seulement un terroir","name":"Foundation Cigar Company","iconic":false},{"desc":"Granada plutôt qu''Estelí — et fermée depuis juin 2023","name":"Mombacho","iconic":false},{"desc":"Une marque qui s''est offert sa propre manufacture","name":"Espinosa","iconic":true},{"desc":"Pas d''usine : elle choisit son rouleur selon l''assemblage","name":"Crowned Heads","iconic":true},{"desc":"Des noms cubains d''avant 1960, des assemblages d''aujourd''hui","name":"Warped","iconic":false},{"desc":"Nodal compose, Plasencia fabrique, Tabacalera possède","name":"Capitol","iconic":false},{"desc":"Repris par la famille García en décembre 2019, après quarante-cinq ans chez Quesada","name":"Fonseca Nicaraguayen","iconic":false},{"name":"Nicoya","desc":"Maison australienne roulée à Estelí — l''Australie ne cultive plus depuis 2006","iconic":false},{"name":"Dunbarton Tobacco & Trust","desc":"Steve Saka, ex-Drew Estate, parti monter sa maison sans usine","iconic":true},{"name":"RoMa Craft Tobac","desc":"Commencée dans un garage, puis son propre atelier à Estelí","iconic":true},{"name":"Viaje","desc":"Plus de gamme régulière depuis 2012 : rien que des séries limitées","iconic":false},{"name":"Room101","desc":"D''un bijoutier au cigare ; trois manufactures, deux pays","iconic":false},{"name":"L''Atelier","desc":"La seconde maison de Pete Johnson, chez My Father comme Tatuaje","iconic":false},{"name":"La Aroma de Cuba","desc":"Nom cubain des années 1880, refait par Pepin García en 2009","iconic":false},{"name":"Southern Draw","desc":"Robert et Sharon Holt — un seul atelier, ce qui est rare","iconic":false},{"name":"HVC Cigars","desc":"Havana City ; dix ans sans usine, puis la sienne en 2021","iconic":true},{"name":"Fratello","desc":"Un ingénieur de la NASA passé au cigare","iconic":false},{"name":"Curivari","desc":"Grecque de tête, cubaine d''intention, nicaraguayenne de matière","iconic":false},{"name":"Black Label Trading Co.","desc":"Une fabrique conçue comme un atelier d''artiste","iconic":false},{"name":"Asylum","desc":"L''autre moitié de CLE — et une fabrique qui fut un cinéma","iconic":false},{"name":"Micallef","desc":"Une panne de voiture, un Texan, et trois générations cubaines","iconic":false},{"name":"Gurkha","desc":"Sans usine jusqu''en 2017, puis propriétaire de la sienne à Estelí","iconic":false},{"name":"Protocol","desc":"Deux policiers, aucune usine — La Zona puis San Lotano","iconic":false},{"name":"Regius","desc":"Maison londonienne de 2010, roulée chez Plasencia","iconic":false},{"name":"Cornelius & Anthony","desc":"Cent cinquante ans de tabac en Virginie, roulés à Estelí","iconic":false},{"name":"262 Cigars","desc":"Le nom est une date : février 1962, la signature de l''embargo","iconic":false},{"name":"Emilio Cigars","desc":"Trois fabriques, trois familles, un seul nom sur la bague","iconic":false},{"name":"Nomad","desc":"Le nom était un programme : elle a changé d''atelier et de pays","iconic":false},{"name":"7-20-4","desc":"Une adresse de Manchester fermée en 1962, reprise en 2006","iconic":false},{"name":"Cuban Crafters","desc":"Une boutique à Miami, mais la fabrique est à Estelí","iconic":false},{"name":"J. Fuego","desc":"Estelí, 2016 — le Corojo de Pinar del Río, et l''atelier où 7-20-4 est roulée","iconic":false}]' WHERE `id` = 'nicaragua';
UPDATE `producer_countries` SET `brands` = '[{"desc":"Prensado — Cigare de l''Année 2011","name":"Alec Bradley","iconic":true},{"desc":"Honduras Cameroon, blend iconique","name":"CAO","iconic":true},{"desc":"Corojo authentique de Jamastran","name":"Camacho","iconic":false},{"desc":"Le Punch d''après 1960, sans rapport avec le havane","name":"Punch Honduras","iconic":false},{"desc":"Suisse, dominicaine et hondurienne à la fois","name":"Excalibur","iconic":false},{"desc":"Le prénom de Zino Davidoff, en marque à part","name":"Zino Platinum","iconic":false},{"desc":"1995, fondée depuis Paris pour un palais européen","name":"Flor de Selva","iconic":true},{"desc":"Une ville bâtie autour de sa manufacture","name":"La Flor de Copán","iconic":false},{"desc":"Du corojo d''avant les hybrides, cultivé par la famille","name":"Aladino","iconic":false},{"desc":"La tête sucrée qui a fait commencer des générations","name":"Baccarat","iconic":false},{"desc":"Le contre-pied du havane : ici, c''est le corsé","name":"Hoyo de Monterrey Honduras","iconic":false},{"desc":"Une des dernières traces vivantes de ce que Tampa a été","name":"Bering","iconic":false},{"desc":"Assemblage Cofradia d''Estélo Padrón, chez HATSA","name":"Bolívar Honduras","iconic":false},{"desc":"Villazon, aux mêmes ateliers que Punch et Hoyo","name":"El Rey del Mundo Honduras","iconic":false},{"desc":"Altadis USA ; la ligne Tabacales est dominicaine","name":"Saint Luis Rey Honduras","iconic":false},{"desc":"Abandonnée par Habanos en 2005, relancée au Honduras","name":"Gispert","iconic":false},{"name":"Maya Selva Cigars","desc":"Fondée en 1995 par Maya Selva — Flor de Selva","iconic":false},{"name":"CLE Cigar Company","desc":"Christian Eiroa revient au métier quatre ans après avoir vendu Camacho","iconic":true},{"name":"Oscar Valladares","desc":"Le cigare enveloppé dans une feuille entière, à retirer avant d''allumer","iconic":false},{"name":"Don Tomas","desc":"1975, créée par une compagnie américaine chez HATSA","iconic":false},{"name":"Reyes Family Cigars","desc":"Danlí, 1990 — Cuba Aliados et Puros Indios, vendues à Oliva en 2021 ; l''usine est restée","iconic":true}]' WHERE `id` = 'honduras';

-- ── LES SCEAUX, recalcules depuis la colonne ──
INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'brands', b.`name`, c.champ, l.lang,
       SHA1(CASE c.champ WHEN 'history' THEN b.`history` ELSE b.`gamme` END),
       'machine', NOW()
  FROM `brands` b
  JOIN (SELECT 'history' champ UNION ALL SELECT 'gamme') c
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE b.`name` IN ('Tabacalera William Ventura','Kelner Boutique Factory','J. Fuego',
                    'Reyes Family Cigars','Oliva','Caldwell Cigar Co.','La Barba')
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

-- ── LE JOURNAL — entrees sous 255, la 204 a montre pourquoi ──
DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 207';
INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 207','systeme','lot_1_quatre_fabriques','marque',0,
   'William Ventura, Kelner Boutique Factory, J. Fuego, Reyes Family Cigars : quatre fabriques nommees dans d autres fiches sans avoir la leur — le defaut de Tabacalera Palma avant la 186, quatre fois. Les fabriques avant les marques qu elles roulent'),
  (NULL,'migration 207','systeme','777_etait_rangee_sous_le_mauvais_pays','marque',0,
   'Le premier recensement cherchait 777 comme une maison hondurienne et n avait rien trouve. C est une marque de J. Fuego, a Esteli. Le nom n etait pas absent, il etait range sous le mauvais pays'),
  (NULL,'migration 207','systeme','la_fabrique_de_caldwell_a_brule','marque',0,
   'Le 26 septembre 2022 un incendie a detruit la Tabacalera William Ventura. Les fiches Caldwell et La Barba, ecrites apres, ne le disaient pas. Un paragraphe en six langues le dit, et renvoie a la fiche de la fabrique'),
  (NULL,'migration 207','systeme','oliva_porte_les_marques_reyes','marque',0,
   'Cuba Aliados, Puros Indios et Roly sont a Oliva depuis aout 2021, roulees au Nicaragua. La gamme Oliva les porte avec la date et l origine. L usine de Danli n etait pas dans la vente : Reyes Family Cigars reste au Honduras'),
  (NULL,'migration 207','systeme','date_de_fondation_divergente','marque',0,
   'William Ventura : 2007 selon une source, 2008 selon une autre. Le champ dit 2007-2008 et le texte nomme l ecart au lieu de choisir — la regle posee sur Excalibur a la 204');

-- ── LE CONTROLE, ET IL DOIT NE RENDRE QUE DES 1 ──
SELECT
  (SELECT COUNT(*) FROM `brands` WHERE `name` IN ('Tabacalera William Ventura','Kelner Boutique Factory','J. Fuego','Reyes Family Cigars')) = 4 AS quatre_fiches,
  (SELECT `gamme` LIKE '%Cuba Aliados%' AND `gamme_ar` LIKE '%Cuba Aliados%' FROM `brands` WHERE `name` = 'Oliva') AS oliva_six_langues,
  (SELECT `history` LIKE '%2022%' AND `history_zh` LIKE '%2022%' FROM `brands` WHERE `name` = 'Caldwell Cigar Co.') AS caldwell_incendie,
  (SELECT `history` LIKE '%2022%' AND `history_ar` LIKE '%2022%' FROM `brands` WHERE `name` = 'La Barba') AS la_barba_incendie,
  (SELECT `brands` LIKE '%Tabacalera William Ventura%' AND `brands` LIKE '%Kelner Boutique Factory%' FROM `producer_countries` WHERE `id` = 'dominican') AS dominican_annonce,
  (SELECT `brands` LIKE '%J. Fuego%' FROM `producer_countries` WHERE `id` = 'nicaragua') AS nicaragua_annonce,
  (SELECT `brands` LIKE '%Reyes Family Cigars%' FROM `producer_countries` WHERE `id` = 'honduras') AS honduras_annonce,
  (SELECT SUM(CHAR_LENGTH(`detail`) >= 255) = 0 FROM `moderation_log` WHERE `acteur_nom` = 'migration 207') AS journal_non_tronque;
SELECT COUNT(*) AS marques, SUM(TRIM(COALESCE(`source`,'')) = '') AS sans_source FROM `brands`;
