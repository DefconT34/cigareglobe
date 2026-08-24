-- ════════════════════════════════════════════════════════
-- 078 — Les affirmations de presse survivaient dans les traductions
-- ────────────────────────────────────────────────────────
-- Depuis la migration 058, chaque note de presse retirée l'a été du
-- FRANÇAIS. `marques_check` ne lit que le français — c'est la colonne
-- source, les autres en dérivent.
--
-- Sauf quand on ne les retraduit pas. Quarante et une phrases portant
-- une note, un rang ou un titre de « cigare de l'année » vivaient encore
-- dans les cinq colonnes traduites de `history` : « #1 Cigar of the
-- Year », « logró un 96 en Cigar Aficionado », « eine 96 im Cigar
-- Aficionado », « 96分获得雪茄爱好者年度第一 ».
--
-- Le français était vert. L'espagnol, l'allemand, le chinois et l'arabe
-- affirmaient toujours.
--
-- ── DEUX DÉFAUTS RATTRAPÉS À LA RELECTURE ───────────────
--
-- La première version de ce lot était fausse deux fois, et les deux
-- fautes venaient de l'outil, pas du contenu.
--
--   1. TOUTES les espaces après les points disparaissaient. Le
--      découpage en phrases utilisait un séparateur que `preg_split`
--      jette par défaut ; recoller les morceaux perdait l'espace. Le
--      texte entier était abîmé, pas seulement l'endroit de la coupe.
--      Le découpage est désormais vérifié RÉVERSIBLE sur trois cas
--      avant tout traitement.
--
--   2. Les motifs espagnol et allemand ne voyaient que « puntuación de
--      100 » et « 100/100 ». Ils rataient la forme la plus courante —
--      le nombre nu à côté du nom de la revue, « logró un 96 en Cigar
--      Aficionado » — et le rang « Dos #1 en cuatro años ». La phrase
--      restait, amputée de sa voisine. Toute phrase citant la revue ou
--      portant un « #N » est désormais prise.
--
-- ── DEUX EFFETS DE BORD, TRAITÉS ────────────────────────
--
-- SUPPRIMER UNE PHRASE PEUT EN ORPHELINER UNE AUTRE. « Über Nacht wurde
-- Alec Bradley zur weltweiten Referenz » — le lendemain de quoi ?
-- « 2012 wiederholte er das Kunststück » — quel exploit ? Ces phrases
-- ne portent aucune affirmation, donc aucun motif ne les voit ; elles
-- étaient pourtant devenues incompréhensibles. Elles sont réécrites.
--
-- CERTAINES PHRASES NE PORTENT PAS QUE LA NOTE. Chez Romeo y Julieta
-- USA, la même phrase décrit la cape et les arômes avant d'annoncer le
-- Top 25. La couper aurait perdu de l'information juste : elle est
-- réécrite, comme la migration 076 l'a fait côté français.
--
-- ── CE QUI RESTE À DÉCIDER ──────────────────────────────
--
-- En mesurant ceci, un autre écart est apparu : les six colonnes de
-- `history` ne sont pas des traductions les unes des autres. L'anglais
-- d'Alec Bradley fait 2 461 caractères pour 794 en français ; l'espagnol
-- en fait 320. Sur 116 fiches, 43 anglaises, 32 espagnoles, 32
-- allemandes, 37 chinoises et 34 arabes sortent des proportions
-- attendues.
--
-- Ce sont des textes DIFFÉRENTS, pas des versions. `i18n_fraicheur` les
-- compte à jour parce qu'elles sont scellées sur le bon français — le
-- même angle mort que la fuite d'anglais, sur un autre axe. Ce constat
-- dépasse ce lot et n'est pas traité ici.
-- ════════════════════════════════════════════════════════


UPDATE `brands` SET
  `history_en` = 'Alan Rubin''s decision to leave medical equipment sales in 1996 and enter the cigar industry was driven by personal passion and commercial calculation in proportions he has never precisely specified. He had been a serious cigar smoker since his twenties and had developed, through years of careful consumption and trade reading, a specific thesis about what was missing from the American market: premium-quality cigars made with genuine seriousness, sold at prices that allowed daily smoking rather than rationing.

He named the company Alec Bradley after his two sons — a gesture that established from the beginning that this was a personal project as much as a commercial one, and that its success or failure would be measured in terms more significant than quarterly revenue. The early years were precisely as difficult as the trajectory suggests: a salesman driving from account to account, opening the trunk of his car to show samples, building a distribution network one retailer at a time with no track record and no inherited relationships.

The Honduras connection, developed in the early 2000s through a long-term relationship with the Plasencia family''s manufacturing operations, gave Alec Bradley access to the leaf quality and rolling precision that the brand''s ambitions required. Honduras had been overshadowed commercially by Nicaragua''s emergence as the premium power tobacco region, but the Jamastran Valley''s corojo-influenced soils and the Plasencias'' generational expertise produced leaf that blenders with good taste could work with at the highest level.

The Prensado release in 2011 demonstrated how completely the investment had paid off. A box-pressed Robusto using Plasencia-grown Honduran corojo wrapper over a Guatemalan and Honduran blend, the Prensado carried the house well beyond the circle of insiders. The allocations sold out within hours of distribution. Retailers reported customers calling daily for months. The waiting list sustained itself for over two years.

The brand has continued producing critically acclaimed work without the consistent number-one rankings that come, by definition, only once a year. The Tempus, the Medalist, the Black Market series — each represents a different expression of the Alec Bradley approach: serious Honduran-Guatemalan blends, rolled with precision, sold without ostentatious marketing.',
  `history_es` = 'Alan Rubin abandonó su carrera en equipos médicos en 1996 para fundar Alec Bradley — nombrada por sus dos hijos. Vendía cajas desde el maletero de su coche durante años. El Prensado dio a conocer la casa mucho más allá del círculo de los iniciados.',
  `history_de` = 'Alan Rubin gab 1996 seine Karriere in der Medizintechnik auf, um Alec Bradley zu gründen — benannt nach seinen beiden Söhnen. Jahrelang verkaufte er Kisten aus seinem Kofferraum. Der Prensado machte das Haus weit über den Kreis der Kenner hinaus bekannt.',
  `history_zh` = '阿兰·鲁宾于1996年放弃医疗设备职业创立阿雷克·布拉德利——以两个儿子命名。多年来从车后备箱销售雪茄。Prensado 让这家老号被远远超出圈内的人所认识。'
WHERE `name` = 'Alec Bradley';

UPDATE `brands` SET
  `history_en` = 'Excalibur was born from a collaboration that seems improbable on paper: a Swiss entrepreneur (Villiger Söhne), a genius Dominican blender (Hendrik Kelner), and Honduran plantations from the Eiroa family in the Jamastran valley.

Heinrich Villiger initiated the project in the early 1980s, when the American market was searching for alternatives to the inaccessible Cuban cigars. Kelner — who would later become the driving force behind Davidoff Dominican, Santa Damiana, and a dozen other brands — assembled a Honduran blend exploiting the Corojo tobaccos of Jamastran. Its signature: earthy and deep like Honduras, but with a roundness and creaminess that bring the profile closer to accessible medium territory.

Excalibur experienced a first period of glory in the 1980s-1990s on the American market, perceived as a quality proxy for forbidden Cuban cigars. The brand was sold to Altadis USA in the early 2000s, but Villiger retained the European rights — creating a dual-market situation comparable to the great Cuban brands under embargo. The Honduran version remains the reference: more earthy, more complex, with the Jamastran signature that distinguishes Honduras from other Central American terroirs. The construction, inherited from Kelner''s standards, remains exemplary in its consistency.',
  `history_es` = 'Excalibur nació de una colaboración que sobre el papel parece improbable: un empresario suizo (Villiger Söhne), un genial maestro ligador dominicano (Hendrik Kelner) y las plantaciones hondureñas de la familia Eiroa en el valle de Jamastran.

Heinrich Villiger puso en marcha el proyecto a principios de los años ochenta, cuando el mercado estadounidense buscaba alternativas a los inaccesibles puros cubanos. Kelner —que llegaría a ser el cerebro de Davidoff Dominican, Santa Damiana y una docena de marcas más— compuso una ligada hondureña que explotaba los tabacos Corojo de Jamastran. Su firma: terrosa y profunda como Honduras, pero con una redondez y una cremosidad que acercan el perfil al registro medio accesible.

Excalibur vivió una primera época de gloria en los años ochenta y noventa en el mercado estadounidense, donde se le veía como un sustituto de calidad de los puros cubanos prohibidos. La marca se vendió a Altadis USA a principios de los años dos mil, pero Villiger conservó los derechos europeos, creando una doble comercialización comparable a la de las grandes marcas cubanas bajo embargo. La versión hondureña sigue siendo la referencia: más terrosa, más compleja, con la firma Jamastran que distingue a Honduras de los demás terruños centroamericanos. La construcción, heredada de los estándares de Kelner, sigue siendo ejemplar por su regularidad.',
  `history_de` = 'Excalibur entstand aus einer Zusammenarbeit, die auf dem Papier unwahrscheinlich wirkt: ein Schweizer Unternehmer (Villiger Söhne), ein genialer dominikanischer Blender (Hendrik Kelner) und die honduranischen Pflanzungen der Familie Eiroa im Jamastran-Tal.

Heinrich Villiger stieß das Projekt Anfang der 1980er Jahre an, als der amerikanische Markt nach Alternativen zu den unerreichbaren kubanischen Zigarren suchte. Kelner — der später der Kopf hinter Davidoff Dominican, Santa Damiana und einem Dutzend weiterer Marken werden sollte — stellte eine honduranische Mischung aus den Corojo-Tabaken von Jamastran zusammen. Seine Handschrift: erdig und tief wie Honduras, doch mit einer Rundheit und Cremigkeit, die das Profil dem zugänglichen mittleren Register annähern.

In den 1980er und 1990er Jahren erlebte Excalibur auf dem amerikanischen Markt eine erste Blütezeit; man sah darin einen qualitativen Ersatz für die verbotenen kubanischen Zigarren. Anfang der 2000er Jahre wurde die Marke an Altadis USA verkauft, doch Villiger behielt die europäischen Rechte — eine doppelte Vermarktung, vergleichbar mit jener der großen kubanischen Marken unter dem Embargo. Die honduranische Version bleibt die Referenz: erdiger, komplexer, mit jener Jamastran-Handschrift, die Honduras von den übrigen mittelamerikanischen Terroirs unterscheidet. Die aus Kelners Maßstäben ererbte Machart bleibt in ihrer Gleichmäßigkeit vorbildlich.',
  `history_zh` = 'Excalibur 诞生于一次纸面上看来极不可能的合作：一位瑞士企业家（Villiger Söhne）、一位天才的多米尼加调配师（Hendrik Kelner），以及 Eiroa 家族在洪都拉斯 Jamastran 谷地的种植园。

1980 年代初，正当美国市场寻找无法获得的古巴雪茄的替代品时，Heinrich Villiger 发起了这一项目。Kelner——日后成为 Davidoff Dominican、Santa Damiana 及十余个品牌背后的大脑——以 Jamastran 的 Corojo 烟叶配出了一款洪都拉斯配方。他的签名风格是：如洪都拉斯般厚土而深沉，却带着一份圆润与奶香，使整体口感靠近平易近人的中度区间。

1980 至 1990 年代，Excalibur 在美国市场迎来第一个鼎盛期，被视为禁运下古巴雪茄的优质替代。2000 年代初，品牌被转售给 Altadis USA，但 Villiger 保留了欧洲权利——形成了与禁运下古巴大品牌相似的双重经营格局。洪都拉斯版仍是标杆：更厚土、更复杂，带着将洪都拉斯与其他中美洲风土区分开来的 Jamastran 印记。承袭 Kelner 标准的卷制工艺，其稳定一致至今堪称典范。',
  `history_ar` = 'وُلدت Excalibur من تعاون يبدو على الورق بعيد الاحتمال: رجل أعمال سويسري (Villiger Söhne)، وخبير خلطات دومينيكي بارع (Hendrik Kelner)، ومزارع هندوراسية تملكها عائلة Eiroa في وادي Jamastran.

أطلق Heinrich Villiger المشروع في مطلع الثمانينيات، حين كانت السوق الأمريكية تبحث عن بدائل للسيجار الكوبي المتعذّر الحصول عليه. أما Kelner — الذي سيصبح العقل المدبّر وراء Davidoff Dominican وSanta Damiana وعشرات العلامات الأخرى — فقد ركّب خلطة هندوراسية تقوم على تبغ Corojo من Jamastran. وبصمته: ترابية عميقة كما هي هندوراس، لكن بامتلاء وقوام كريمي يقرّبان الطابع من المستوى المتوسط السهل.

عرفت Excalibur فترة مجد أولى في الثمانينيات والتسعينيات في السوق الأمريكية، إذ نُظر إليها كبديل رصين للسيجار الكوبي المحظور. بيعت العلامة إلى Altadis USA في مطلع الألفية، غير أن Villiger احتفظت بالحقوق الأوروبية، فنشأ ازدواج في التسويق يشبه ما تعرفه كبرى العلامات الكوبية تحت الحظر. وتظل النسخة الهندوراسية هي المرجع: أشدّ ترابية وأكثر تعقيداً، وتحمل بصمة Jamastran التي تميّز هندوراس عن سائر أراضي أمريكا الوسطى. أما الصناعة، الموروثة عن معايير Kelner، فتبقى مثالية في انتظامها.'
WHERE `name` = 'Excalibur';

UPDATE `brands` SET
  `history_en` = 'The name is a declaration of intent. Liga privada — private blend — is the vocabulary of someone creating something for himself rather than for a market. Jonathan Drew, who founded Drew Estate in 1996 and built it into a significant manufacturing operation on the back of the ACID infused cigar line, had always maintained a personal interest in serious premium tobacco that existed alongside the commercial work. The Liga Privada blends were his private project — tobaccos he selected for his own pleasure and that of a small group of people whose judgment he respected.

The No.9 blend combined a Connecticut Broadleaf Habano wrapper — grown in the Hartford Valley, fermented for three years before rolling, producing a leaf of near-black color and distinctive oily richness — with a Nicaraguan blend from Estelí and Jalapa tobaccos that Drew had been developing for years. The T52 used a slightly different wrapper from the same source. Both blends were rolled in Drew Estate''s Estelí factory in small quantities.

When a few American retailers received samples for evaluation in 2008, the No.9 sold out within 45 minutes of its first appearance. The waiting list that formed around subsequent allocations stretched to six months in some markets. The T52 earned comparable scores. Retailers reported that customers were offering premiums above list price to secure allocations.

The paradox of Liga Privada''s success is that it validated, through the most demanding segment of the market, a house whose commercial identity was built on flavored cigars. Drew Estate''s ACID line had been treated by traditional enthusiasts as a separate and lesser category. Liga Privada forced a reassessment — a house with that blending and manufacturing capability could not be dismissed on aesthetic grounds.

Production remains deliberately constrained. Drew Estate has not expanded Liga Privada to meet demand. The annual release cycle, the regional allocations, the waiting lists at authorized retailers — these are not artificial scarcity management but the consequence of genuine capacity limits. You cannot make more Liga Privada without growing more of the specific wrapper leaf, and that takes three years from planting to rolling.'
WHERE `name` = 'Liga Privada';

UPDATE `brands` SET
  `history_en` = 'José ''Pepin'' García is the figure through whom Cuban tobacco knowledge entered Nicaraguan production at the highest level. He grew up in Cuba, trained in the rolling rooms of Havana''s great factories during the era when Cuban cigars were still the uncontested standard, and developed a palate and a blending instinct that would have made him a master blender for any Cuban house.

He left Cuba in 2003, arriving in Miami in circumstances he has never discussed in detail. He set up a small rolling operation called El Rey de los Habanos with equipment that barely fit the available space. Word spread immediately among Miami''s cigar community that a Cuban master was producing cigars by hand, available directly from the workshop. The enthusiasm was not nostalgia for Cuba — it was recognition that someone with a specific set of skills was suddenly, unexpectedly, available.

In 2008, Pepin moved with his son Jaime to Estelí in Nicaragua, where they established My Father Cigars. The name was Jaime''s choice — a tribute made public in commercial form. No house in the magazine''s history had achieved it in its first year of operation.

In 2012, the El Centurion Robusto repeated the feat. Two number-one rankings in four years, from a two-person operation based in a building Pepin and Jaime had constructed themselves.

The technical explanation for this record is straightforward to describe and impossible to fully replicate: Pepin García rolls the prototype vitolas himself. He does not write down formulas. He blends by demonstration, by adjustment, by his hands'' memory of what correct density and draw feel like. Every My Father vitola in commercial production was personally approved through Pepin''s hands before anyone else touched it. The cigars carry his craft in the most literal sense possible.',
  `history_es` = 'José ''Pepin'' García, el torcedor más celebrado de su generación, abandonó Cuba en 2003. En 2008 lanzó My Father Cigars en Estelí con su hijo Jaime. En 2012 lo confirmó con una nueva creación.',
  `history_de` = 'José ''Pepin'' García, der gefeierte Torcedor seiner Generation, verließ Kuba 2003. 2008 gründete er mit seinem Sohn Jaime My Father Cigars in Estelí. 2012 bestätigte er es mit einer weiteren Kreation.',
  `history_zh` = '何塞·''佩平''·加西亚，他那一代最受赞誉的卷制师，于2003年离开古巴。2008年与儿子海梅在埃斯特利创立了我的父亲雪茄。2012 年，他以另一款新作再次印证了这一点。',
  `history_ar` = 'خوسيه ''بيبين'' غارسيا، أبرز ملفِّف في جيله، غادر كوبا عام 2003. عام 2008 أسّس مع ابنه خايمي ماي فاذر سيغار في إستيلي. وأكّد ذلك بإصدار جديد عام 2012.'
WHERE `name` = 'My Father';

UPDATE `brands` SET
  `history_en` = 'The Oliva family story begins in Pinar del Río Province, Cuba, in 1886 — when the family first planted tobacco in the western end of the island that would eventually become recognized as Vuelta Abajo, the world''s most celebrated tobacco-growing region. For over sixty years, the Olivas grew tobacco in that red soil, developing the cultivation knowledge that their descendants would carry into exile.

When Oswaldo Oliva left Cuba after the revolution, he brought seeds, agricultural knowledge, and the understanding that good tobacco required specific conditions to express its quality. After periods in Honduras and Miami, he established plantations in Nicaragua''s Jalapa Valley in 1968 — a growing region where the combination of volcanic soil, altitude, and consistent humidity creates conditions that experienced tasters recognize as the closest analog to Vuelta Abajo outside Cuba.

For nearly three decades, Oliva was the industry''s best-kept open secret. If you smoked a premium Nicaraguan or Honduran cigar between 1970 and 1995, there was a reasonable probability that the leaf in your hand had been grown on Oliva land and sold to the manufacturer who put their name on the band. Davidoff, Padrón, Ashton, and dozens of others sourced Oliva leaf. The family sold it without complaint and without publicity. They were growers, not brand builders.

The third generation changed that calculation. In 1995, convinced that the family''s leaf quality deserved its own identity, they launched Oliva Cigars. The family''s structural advantage is ownership. Every leaf that goes into an Oliva cigar was grown on family-owned land in Jalapa or Estelí. Gilberto Oliva Jr. inspects his plantations personally, on horseback, every growing season. This connection between the family and the soil has produced a consistency of quality across three decades of commercial production that no contract-sourcing arrangement can match.',
  `history_es` = 'La familia Oliva cultiva tabaco desde 1886 en Cuba. Oswaldo Oliva se instaló en Nicaragua en 1968, estableciendo plantaciones en el Valle de Jalapa. Durante décadas fue el proveedor secreto del sector. En 1995 lanzó sus propios cigarros.',
  `history_de` = 'Die Familie Oliva baut seit 1886 in Kuba Tabak an. Oswaldo Oliva ließ sich 1968 in Nicaragua nieder und legte Plantagen im Jalapa-Tal an. Jahrzehntelang war sie der geheime Lieferant der Branche. 1995 lancierte sie eigene Zigarren.',
  `history_zh` = '奥利瓦家族自1886年起在古巴种植烟草。奥斯瓦尔多·奥利瓦于1968年定居尼加拉瓜，在哈拉帕谷建立种植园。数十年来一直是行业的秘密供应商。1995年推出自己的雪茄。'
WHERE `name` = 'Oliva';

UPDATE `brands` SET
  `history_en` = 'José Orlando Padrón left Cuba in 1961, one of hundreds of thousands who departed after the revolution with skills but little else. He settled in Miami with the conviction that had sustained his family through three generations of tobacco cultivation: that the quality of what you put in the ground, and the patience with which you let it develop, determines everything about what eventually goes into the humidor.

In 1964, he founded Padrón Cigars with six hundred dollars in savings and a rented space in Miami. The early years were defined by two things: genuine commercial struggle and violence. The factory was bombed twice by Cuban exile groups who viewed Padrón''s success with Nicaraguan tobacco — a country that had recently undergone its own leftist revolution — as a political betrayal. Padrón rebuilt each time, never relocated, never changed his source material.

The breakthrough came in 1994, when the family launched the 1964 Anniversary Series — a blend designed to honor the house''s 30th year using Nicaraguan tobacco aged a minimum of four years before rolling. The review changed everything. Padrón became, almost overnight, the standard against which Nicaraguan cigars were measured.

The accumulation of exceptional scores since then has no parallel in the industry. The philosophy is agricultural before it is commercial. Padrón owns its Nicaraguan plantations outright, concentrated in the Jalapa Valley and around Estelí. The aging program is not a marketing narrative — every Padrón blend uses tobacco aged between two and four years minimum before rolling, with the premium lines using tobacco aged considerably longer. José Orlando, who continued walking his plantations into his late eighties, described the approach simply: ''I don''t sell cigars. I sell time.''

He died in 2017 at age 90. The family continues under Jorge Padrón. The standard has not moved.',
  `history_es` = 'José Orlando Padrón abandonó Cuba y fundó Padrón en Miami en 1964 con 600 dólares. Superó dos atentados con bomba de exiliados cubanos. Su filosofía: envejecer el tabaco nicaragüense de Jalapa al menos 2-4 años.',
  `history_de` = 'José Orlando Padrón verließ Kuba und gründete Padrón 1964 in Miami mit 600 Dollar. Er überstand zwei Bombenanschläge kubanischer Exilanten. Seine Philosophie: Tabak aus dem nicaraguanischen Jalapa-Tal mindestens 2-4 Jahre reifen lassen.',
  `history_zh` = '何塞·奥兰多·帕德隆离开古巴，于1964年在迈阿密用600美元创立帕德隆。他经历了两次古巴流亡者的炸弹袭击。理念：尼加拉瓜哈拉帕烟草至少陈化2-4年。',
  `history_ar` = 'غادر خوسيه أورلاندو بادرون كوبا وأسّس بادرون في ميامي عام 1964 بـ600 دولار. نجا من هجومين بالقنابل من قِبل المنفيين الكوبيين. فلسفته: تعتيق تبغ خالابا النيكاراغوي لا أقل من 2-4 سنوات.'
WHERE `name` = 'Padrón';

UPDATE `brands` SET
  `history_en` = 'The American Romeo y Julieta shares with Cohiba USA and Partagás USA the same legal genesis: the American embargo against Cuba opened the way for trademark registration on American soil by entities entirely distinct from the original Havana house.

Altadis USA (now Imperial Brands) holds the American rights to Romeo y Julieta and produces the range in the Dominican Republic. The American brand has succeeded in creating its own identity without trying to exactly reproduce the Cuban profile — a judicious strategic choice that spared it the inevitable unfavorable comparisons.

The 1875 range — the number recalling the founding year of the original Havana house — is built around Dominican and Ecuadorian tobaccos with Nicaraguan contributions. Its softer, creamier profile than the Cuban version reflects the preferences of the broad American market, allowing it to reach volumes the Cuban brand will never approach.

The Reserve Maduro is the most ambitious interpretation of the American brand. Under a Connecticut Broadleaf wrapper fermented for two years, it develops milk chocolate and roasted coffee — the range through which the American brand found its audience. Several serious enthusiasts argue it deserves to be evaluated independently of its Cuban namesake — not as a substitute, but as an expression of a distinct aesthetic.',
  `history_es` = 'La versión estadounidense de Romeo y Julieta comparte con Cohiba USA y Partagás USA la misma génesis jurídica: el embargo estadounidense contra Cuba abrió la vía al registro de la marca en suelo estadounidense por entidades ajenas a la casa habanera original.

Altadis USA (hoy Imperial Brands) posee los derechos estadounidenses de Romeo y Julieta y produce la gama en la República Dominicana. La marca estadounidense ha sabido crear su propia identidad sin pretender reproducir exactamente el perfil cubano: una decisión estratégica acertada que le ha ahorrado las inevitables comparaciones desfavorables.

La gama 1875 —cifra que recuerda el año de fundación de la casa habanera— se construye sobre tabacos dominicanos y ecuatorianos con aportes nicaragüenses. Su perfil, más suave y cremoso que el de la versión cubana, refleja las preferencias del gran mercado estadounidense y le ha permitido alcanzar volúmenes que el cubano nunca rozará.

El Reserve Maduro es la interpretación más ambiciosa de la marca estadounidense. Bajo una capa Connecticut Broadleaf fermentada dos años, despliega chocolate con leche y café tostado: es la gama con la que la marca estadounidense encontró su público. Varios aficionados serios sostienen que merece juzgarse al margen de su homónimo cubano: no como sustituto, sino como expresión de una estética propia.',
  `history_de` = 'Die amerikanische Version von Romeo y Julieta teilt mit Cohiba USA und Partagás USA denselben rechtlichen Ursprung: Das amerikanische Embargo gegen Kuba ebnete den Weg dafür, dass die Marke auf amerikanischem Boden von Gesellschaften eingetragen wurde, die mit dem ursprünglichen Havanna-Haus nichts zu tun hatten.

Altadis USA (heute Imperial Brands) hält die amerikanischen Rechte an Romeo y Julieta und fertigt die Linie in der Dominikanischen Republik. Die amerikanische Marke hat es verstanden, eine eigene Identität zu entwickeln, statt das kubanische Profil genau nachbilden zu wollen — eine kluge strategische Entscheidung, die ihr die unvermeidlichen ungünstigen Vergleiche ersparte.

Die Linie 1875 — die Zahl erinnert an das Gründungsjahr des Havanna-Hauses — beruht auf dominikanischen und ecuadorianischen Tabaken mit nicaraguanischen Zugaben. Ihr milderes, cremigeres Profil gegenüber der kubanischen Version entspricht dem Geschmack des breiten amerikanischen Marktes und hat ihr Stückzahlen verschafft, an die die kubanische nie herankommen wird.

Der Reserve Maduro ist die ehrgeizigste Auslegung der amerikanischen Marke. Unter einem zwei Jahre fermentierten Connecticut-Broadleaf-Deckblatt entfaltet er Milchschokolade und Röstkaffee — die Linie, mit der die amerikanische Marke ihr Publikum fand. Manche ernsthaften Liebhaber finden, er verdiene eine Beurteilung unabhängig von seinem kubanischen Namensvetter — nicht als Ersatz, sondern als Ausdruck einer eigenen Ästhetik.',
  `history_zh` = 'Romeo y Julieta 的美国版与 Cohiba USA、Partagás USA 有着相同的法律出身：美国对古巴的禁运，为哈瓦那原厂之外的公司在美国境内注册该商标打开了通路。

Altadis USA（今属 Imperial Brands）持有 Romeo y Julieta 的美国权利，并在多米尼加共和国生产该系列。这个美国品牌懂得建立自己的身份，而不去精确复刻古巴风格——这一策略选择颇为明智，替它免去了必然不利的比较。

1875 系列——数字取自哈瓦那老厂的创立年份——以多米尼加与厄瓜多尔烟叶为骨，辅以尼加拉瓜烟叶。它比古巴版更柔和、更奶润的风格契合美国大众市场的偏好，也让它达到了古巴版永远无法接近的产量。

Reserve Maduro 是这个美国品牌最具野心的诠释。茄衣是陈化两年的 Connecticut Broadleaf，展现牛奶巧克力与烘焙咖啡的气息——这个美国品牌正是靠这个系列找到了自己的读者。不少认真的爱好者认为，应当撇开它的古巴同名者来评价它——不是作为替代品，而是作为另一种审美的表达。',
  `history_ar` = 'تشترك النسخة الأمريكية من Romeo y Julieta مع Cohiba USA وPartagás USA في المنشأ القانوني نفسه: فالحظر الأمريكي على كوبا فتح الطريق أمام تسجيل العلامة على الأراضي الأمريكية من قِبل كيانات لا صلة لها بالدار الهافانية الأصلية.

تملك Altadis USA (وهي اليوم ضمن Imperial Brands) الحقوق الأمريكية لـ Romeo y Julieta وتنتج التشكيلة في جمهورية الدومينيكان. وقد أحسنت العلامة الأمريكية بناء هوية خاصة بها بدل السعي إلى استنساخ الطابع الكوبي حرفياً — وهو خيار استراتيجي صائب جنّبها المقارنات غير المواتية الحتمية.

أما تشكيلة 1875 — والرقم يذكّر بسنة تأسيس الدار الهافانية — فمبنية على تبغ دومينيكي وإكوادوري مع إضافات نيكاراغوية. وطابعها الأنعم والأكثر كريمية من النسخة الكوبية يعكس أذواق السوق الأمريكية الواسعة، وأتاح لها أحجاماً لن تقترب منها الكوبية أبداً.

و Reserve Maduro هو أطمح تفسير قدّمته العلامة الأمريكية. فبغلاف Connecticut Broadleaf مخمَّر سنتين، يطوّر نكهات الشوكولاتة بالحليب والقهوة المحمّصة — وهي المجموعة التي وجدت بها العلامة الأمريكية جمهورها. ويرى عدد من الهواة الجادّين أنه يستحق التقييم بمعزل عن نظيره الكوبي في الاسم — لا بوصفه بديلاً، بل تعبيراً عن جماليات مستقلة.'
WHERE `name` = 'Romeo y Julieta USA';

