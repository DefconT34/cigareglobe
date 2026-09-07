-- ════════════════════════════════════════════════════════
-- 182 — Les six maisons canariennes
-- ────────────────────────────────────────────────────────
-- LES CANARIES ÉTAIENT LE PAYS PRODUCTEUR LE PLUS PAUVRE DE L'ATLAS :
-- deux fiches, Vargas et Montecruz, pour un archipel qui cultive et
-- roule au même endroit — ce que presque aucun autre endroit d'Europe
-- ne fait.
--
--   Dos Santos                Las Palmas de Gran Canaria, 1921
--   Montealto                 Breña Alta, La Palma, 1917/1918
--   Puros Artesanos Julio     Breña Alta, La Palma, 2000
--   Finca Tabaquera El Sitio  Breña Alta, La Palma, 2005
--   Canaritos                 Güímar, Tenerife
--   Kolumbus                  La Palma
--
-- ── L'HOMONYMIE QUI PIÉGEAIT LA FICHE DE PAYS ───────────
-- `producer_countries.tabacaleras` portait « Compañía Insular
-- Tabacalera ». Il en existe DEUX, à quarante ans et une mer d'écart :
--
--   Compañía Insular Tabacalera            Las Palmas de Gran Canaria,
--                                          1961, Benjamín Menéndez —
--                                          celle du Montecruz
--   Compañía Insular de Tabaco de La Palma Breña Alta, 1917/1918 —
--                                          celle du Montealto
--
-- La fiche Montealto le dit explicitement, parce que même les
-- répertoires d'entreprises confondent les deux.
--
-- ── DEUX DATES POUR UNE MÊME FONDATION ──────────────────
-- La presse canarienne (eldiario.es) date la Compañía Insular de Tabaco
-- de La Palma de 1917 ; la maison affiche 1918. L'écart n'est pas
-- tranché ici : `founded` porte les deux.
-- Même prudence chez Dos Santos, qui se fonde en 1921 quand la presse
-- fait remonter la marque à 1919.
--
-- ── UNE COLONNE MUETTE RÉPARÉE AU PASSAGE ───────────────
-- `Vargas.founded` disait « La Palma, Îles Canaries » — un LIEU dans un
-- champ de DATE, donc rien. La recherche a rendu l'année et l'homme :
-- Enrique Vargas de Paz ouvre son chinchal sur l'avenue Maritime de
-- Santa Cruz de La Palma en 1925, avec son frère Felipe.
-- `founded` et `factory` ne sont pas des colonnes traduites : elles se
-- corrigent sans toucher aux sceaux.
--
-- ── CE QUE LA FICHE DE PAYS NE DISAIT PAS ───────────────
-- `notes` racontait l'exil cubain de 1960 et s'arrêtait là. Il manquait
-- LE fait qui explique l'état actuel de l'archipel : le mildiou bleu a
-- détruit les plantations de La Palma en 1967. Il reste des ateliers ;
-- il n'y a plus d'industrie. Les six fiches ci-dessous ne se lisent pas
-- sans cela.
--
-- ── CE QUE CES FICHES REFUSENT D'ÉCRIRE ─────────────────
-- Les sources canariennes sont généreuses en rangs mondiaux : « l'un
-- des meilleurs mélangeurs du monde » pour Vargas selon la revue
-- Tobacconist, « parmi les dix meilleures du monde » pour El Sitio,
-- « considérés les meilleurs d'Europe » pour Montealto. Aucun n'est
-- repris. La distinction d'El Sitio est mentionnée SANS son rang, et
-- attribuée à la revue qui la décerne — c'est la règle des notes de
-- presse sans `source_url`.
-- Winston Churchill est cité comme client par le matériel commercial de
-- Vargas : non repris non plus.
--
-- ── TROIS GARDE-FOUS ONT PARLÉ, ET ONT EU RAISON ────────
-- Le premier jet de cette migration a été refusé trois fois. Aucun
-- refus n'a été excepté :
--
--   `marques_check`  El Sitio citait « Cigar Journal » dans douze
--                    colonnes, sans `source_url` vers le classement.
--                    Une note de presse vaut par sa source
--                    consultable : la mention est RETIRÉE, pas
--                    exceptée.
--   `coherence_check` `regions` annonçait « Breña Alta », « Güímar »
--                    et « Santa Cruz de La Palma » sans zone de
--                    production derrière — trois étiquettes qui ne
--                    menaient nulle part. Les deux premières sont
--                    devenues de vraies zones (49 et 50) ; la
--                    troisième est retirée, ses coordonnées étant
--                    DÉJÀ celles de la zone « La Palma ».
--                    `varieties` annonçait « Breña (La Palma) » sans
--                    fiche : Breña n'est pas une variété distincte,
--                    c'est le nom que Kolumbus donne à la feuille
--                    palmera — qui a déjà sa fiche
--                    `canaries-la-palma`. Retiré.
--   `i18n_superlatif` deux traductions affirmaient un rang que le
--                    français ne porte pas : « 最能说明 » chez Dos
--                    Santos en chinois, et « más que » chez Kolumbus
--                    en espagnol — un comparatif de substitution que
--                    le français dit par « plutôt que ». Reformulés.
--
-- ── ET LE TABLEAU JSON EST POSÉ EN TOUTES LETTRES ───────
-- Règle des migrations 179, 180 et 181 : aucun `JSON_*`.
-- `producer_countries.brands` pour `canaries` passe de deux à huit
-- entrées, écrites entières.
--
-- Sources : dossantossa.com (histoire, générations, volumes,
-- exportations, fiche La Regenta), eldiario.es « El puro palmero es un
-- producto estrella único y espectacular » (Compañía Insular de Tabaco
-- de La Palma : 1917, Las Vueltas, associés, marques, volumes),
-- diariodeavisos.com « Finca El Sitio, reserva tabaquera de Europa »
-- (surfaces, cultivo bajo telón, Antonio González), lapalmabiosfera.es
-- et purosartesanosjulio.com (Julio : 1950, 2000, plantation, lignes),
-- cigarworld.de (Canaritos : Güímar, shortfiller, proportions),
-- kolumbuscigars.ch et zigarren.zone (Kolumbus : longfiller palmero,
-- caves de cèdre, Track & Trace), humolatino.com (Vargas : 1925,
-- Enrique Vargas de Paz, le mildiou bleu de 1967).
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

-- ── Dos Santos ───────────────────────────────────────────
('Dos Santos', 'canaries', '1921 — Las Palmas de Gran Canaria',
 'Dos Santos S.A.U., Polígono Industrial Lomo Blanco, Las Torres, Grande Canarie',

 'Dos Santos est la seule maison canarienne de cet atlas qui ne soit pas de La Palma. Joaquín Jesús Dos Santos González ouvre en 1921 sa fabrique au 16 de la rue Perojo, à Las Palmas de Gran Canaria, et l''appelle La Regenta. La demande européenne de tabac est forte au sortir de la Première Guerre mondiale, et le port de Las Palmas a de quoi y répondre : des navires allemands y sont immobilisés depuis 1914, feuille cubaine à bord. La maison date sa fondation de 1921 ; la presse canarienne fait remonter la marque à 1919.

Quatre générations se sont succédé. Joaquín Roberto, le fils, prend la suite dans les années 1940 et ajoute le cigare — mécanisé, puis roulé à la main — à une production qui n''était que cigarettes et tabac coupé. Il meurt en 1983 ; la troisième génération lui succède, la quatrième dirige aujourd''hui.

L''ancienne fabrique de la rue Perojo n''appartient plus à la maison. Le bâtiment est classé et abrite un centre d''art qui a gardé le nom du cigare : le Centro de Arte La Regenta. La production, elle, est partie dans une zone industrielle des Torres.

Les chiffres disent ce qu''est vraiment cette maison. Elle déclare plus d''un milliard de cigarettes, six millions de cigares mécanisés, trente-huit millions de cigarillos — et cinq cent mille cigares roulés à la main. Le haut de gamme est son plus petit volume. Elle exporte vers l''Allemagne, la Tchéquie, le Chili, la Chine, la Hongrie et l''Angola, porte aussi la marque Cónsul, et a relancé Condal en 2016.',

 '[{"name":"La Regenta — Línea Clásica","color":"#C9A96E","force":"Medium","wrapper":"Connecticut clair ; San Andrés ou Équateur selon les vitoles","vitolas":["Nº1","Nº3","Nº4","Nº5"],"story":"La marque qui a donné son nom à la fabrique de 1921. Cape Connecticut claire, tripe de semence cubaine venue de République dominicaine et du Brésil : le tabac canarien n''entre pas dans cet assemblage, et c''est ce qui sépare Dos Santos des maisons de La Palma."},{"name":"La Regenta — Gama 1921","color":"#8B5A2B","force":"Medium","wrapper":"Connecticut clair, ou maduro selon les vitoles","vitolas":["Half Corona","Robusto","Gran Toro","Maduro Titan"],"story":"La ligne moderne, aux formats courts et épais que la Línea Clásica ignore. Elle porte en chiffres l''année de la fabrique de la rue Perojo."}]',

 'Dos Santos is the only Canary house in this atlas that is not from La Palma. In 1921 Joaquín Jesús Dos Santos González opened his factory at 16 calle Perojo, in Las Palmas de Gran Canaria, and named it La Regenta. European demand for tobacco was strong after the First World War, and the port of Las Palmas could meet it: German ships had lain immobilised there since 1914, Cuban leaf on board. The house dates its founding to 1921; the Canary press traces the brand back to 1919.

Four generations have followed one another. Joaquín Roberto, the son, took over in the 1940s and added cigars — machine-made, then hand-rolled — to a production that had been only cigarettes and cut tobacco. He died in 1983; the third generation succeeded him, the fourth runs the house today.

The old calle Perojo factory no longer belongs to the family. The building is listed and houses an art centre that has kept the cigar''s name: the Centro de Arte La Regenta. Production has moved to an industrial estate at Las Torres.

The figures say what this house really is. It reports over a billion cigarettes, six million machine-made cigars, thirty-eight million cigarillos — and five hundred thousand hand-rolled cigars. The premium end is its smallest volume. It exports to Germany, the Czech Republic, Chile, China, Hungary and Angola, also carries the Cónsul brand, and revived Condal in 2016.',

 'Dos Santos es la única casa canaria de este atlas que no es de La Palma. En 1921 Joaquín Jesús Dos Santos González abre su fábrica en el número 16 de la calle Perojo, en Las Palmas de Gran Canaria, y la llama La Regenta. La demanda europea de tabaco es fuerte al salir de la Primera Guerra Mundial, y el puerto de Las Palmas puede atenderla: hay barcos alemanes inmovilizados allí desde 1914, con hoja cubana a bordo. La casa data su fundación en 1921; la prensa canaria hace remontar la marca a 1919.

Se han sucedido cuatro generaciones. Joaquín Roberto, el hijo, toma el relevo en los años cuarenta y añade el puro — mecanizado, luego liado a mano — a una producción que solo era de cigarrillos y picadura. Muere en 1983; le sucede la tercera generación, y la cuarta dirige hoy.

La antigua fábrica de la calle Perojo ya no pertenece a la casa. El edificio está catalogado y alberga un centro de arte que ha conservado el nombre del puro: el Centro de Arte La Regenta. La producción se ha ido a un polígono industrial de Las Torres.

Las cifras dicen lo que esta casa es realmente. Declara más de mil millones de cigarrillos, seis millones de puros mecanizados, treinta y ocho millones de cigarritos — y quinientos mil puros liados a mano. La gama alta es su volumen más pequeño. Exporta a Alemania, Chequia, Chile, China, Hungría y Angola, lleva también la marca Cónsul y relanzó Condal en 2016.',

 'Dos Santos ist das einzige kanarische Haus in diesem Atlas, das nicht von La Palma stammt. 1921 eröffnete Joaquín Jesús Dos Santos González seine Fabrik in der Calle Perojo 16 in Las Palmas de Gran Canaria und nannte sie La Regenta. Die europäische Tabaknachfrage war nach dem Ersten Weltkrieg groß, und der Hafen von Las Palmas konnte sie bedienen: Dort lagen seit 1914 deutsche Schiffe fest, kubanisches Blatt an Bord. Das Haus datiert seine Gründung auf 1921; die kanarische Presse führt die Marke auf 1919 zurück.

Vier Generationen folgten aufeinander. Joaquín Roberto, der Sohn, übernahm in den 1940er Jahren und fügte einer Produktion, die nur aus Zigaretten und Schnittabak bestand, die Zigarre hinzu — maschinell, dann von Hand gerollt. Er starb 1983; die dritte Generation folgte ihm, die vierte führt das Haus heute.

Die alte Fabrik in der Calle Perojo gehört dem Haus nicht mehr. Das Gebäude steht unter Denkmalschutz und beherbergt ein Kunstzentrum, das den Namen der Zigarre behalten hat: das Centro de Arte La Regenta. Die Produktion ist in ein Industriegebiet von Las Torres gezogen.

Die Zahlen sagen, was dieses Haus wirklich ist. Es weist über eine Milliarde Zigaretten aus, sechs Millionen maschinell gefertigte Zigarren, achtunddreißig Millionen Zigarillos — und fünfhunderttausend handgerollte Zigarren. Das Premiumsegment ist sein kleinstes Volumen. Es exportiert nach Deutschland, Tschechien, Chile, China, Ungarn und Angola, führt außerdem die Marke Cónsul und hat Condal 2016 wiederbelebt.',

 'Dos Santos 是本图集收录的加那利雪茄庄中唯一不属于拉帕尔马岛的一家。1921 年，Joaquín Jesús Dos Santos González 在大加那利岛拉斯帕尔马斯佩罗霍街 16 号开办工厂，取名 La Regenta。第一次世界大战结束后欧洲对烟草需求旺盛，而拉斯帕尔马斯港恰能供应：自 1914 年起就有德国船只滞留于此，船上载着古巴烟叶。公司将创立之年定为 1921 年；加那利当地报刊则把这个品牌上溯至 1919 年。

家族已传四代。次代的 Joaquín Roberto 于 1940 年代接手，为原本只有卷烟与切丝烟草的生产线增加了雪茄——先是机制，后为手工卷制。他于 1983 年去世，第三代继任，如今由第四代主持。

佩罗霍街的旧厂房已不属于这个家族。建筑受文物保护，如今是一座艺术中心，并保留了雪茄的名字：Centro de Arte La Regenta。生产则迁往拉斯托雷斯的一处工业区。

这些数字说明了这家公司的实际面貌。它公布的产量为卷烟十亿余支、机制雪茄六百万支、小雪茄三千八百万支——而手工卷制雪茄仅五十万支。高端产品是它最小的一块。产品出口至德国、捷克、智利、中国、匈牙利与安哥拉；旗下还有 Cónsul 品牌，并于 2016 年重启了 Condal。',

 'دوس سانتوس هي الدار الكناريّة الوحيدة في هذا الأطلس التي لا تنتمي إلى جزيرة لا بالما. ففي عام 1921 افتتح خواكين خيسوس دوس سانتوس غونثالِث مصنعه في شارع بيروخو رقم 16 بلاس بالماس دي غران كناريا، وسمّاه «لا ريخينتا». كان الطلب الأوروبي على التبغ قويًا بعد الحرب العالمية الأولى، وكان ميناء لاس بالماس قادرًا على تلبيته: فقد رست فيه سفن ألمانية عالقة منذ 1914 تحمل على متنها ورق تبغ كوبيًا. تؤرّخ الدار تأسيسها بعام 1921، بينما تُرجع الصحافة الكناريّة العلامة إلى 1919.

وتعاقبت أربعة أجيال. تسلّم الابن خواكين روبرتو في أربعينيات القرن الماضي فأضاف السيجار — آليًا ثم ملفوفًا باليد — إلى إنتاج لم يكن يضمّ سوى السجائر والتبغ المفروم. وتوفّي عام 1983، فخلفه الجيل الثالث، ويدير الدار اليوم جيلها الرابع.

ولم يعد مصنع شارع بيروخو القديم ملكًا للدار. فالمبنى مصنّف أثريًا ويضمّ اليوم مركزًا للفنون احتفظ باسم السيجار: مركز الفنون «لا ريخينتا». أمّا الإنتاج فقد انتقل إلى منطقة صناعية في لاس توريس.

والأرقام تقول ما هي هذه الدار حقًّا. فهي تعلن أكثر من مليار سيجارة، وستة ملايين سيجار آليّ، وثمانية وثلاثين مليون سيجار صغير — وخمسمئة ألف سيجار ملفوف يدويًا. فالفاخر هو أصغر أحجامها. وتصدّر إلى ألمانيا وتشيكيا وتشيلي والصين والمجر وأنغولا، وتحمل كذلك علامة «كونسول»، وأعادت إطلاق «كوندال» عام 2016.',

 '[{"name":"La Regenta — Línea Clásica","color":"#C9A96E","force":"Medium","wrapper":"Light Connecticut; San Andrés or Ecuador on some vitolas","vitolas":["Nº1","Nº3","Nº4","Nº5"],"story":"The brand that gave the 1921 factory its name. Light Connecticut wrapper, Cuban-seed filler from the Dominican Republic and Brazil: Canary tobacco does not enter this blend, and that is what separates Dos Santos from the houses of La Palma."},{"name":"La Regenta — Gama 1921","color":"#8B5A2B","force":"Medium","wrapper":"Light Connecticut, or maduro on some vitolas","vitolas":["Half Corona","Robusto","Gran Toro","Maduro Titan"],"story":"The modern line, in the short thick formats the Línea Clásica ignores. Its name is the year of the calle Perojo factory, in figures."}]',

 '[{"name":"La Regenta — Línea Clásica","color":"#C9A96E","force":"Medium","wrapper":"Connecticut claro; San Andrés o Ecuador según las vitolas","vitolas":["Nº1","Nº3","Nº4","Nº5"],"story":"La marca que dio nombre a la fábrica de 1921. Capa Connecticut clara, tripa de semilla cubana venida de la República Dominicana y de Brasil: el tabaco canario no entra en esta ligada, y eso separa a Dos Santos de las casas de La Palma."},{"name":"La Regenta — Gama 1921","color":"#8B5A2B","force":"Medium","wrapper":"Connecticut claro, o maduro según las vitolas","vitolas":["Half Corona","Robusto","Gran Toro","Maduro Titan"],"story":"La línea moderna, en los formatos cortos y gruesos que la Línea Clásica ignora. Lleva en cifras el año de la fábrica de la calle Perojo."}]',

 '[{"name":"La Regenta — Línea Clásica","color":"#C9A96E","force":"Medium","wrapper":"Helles Connecticut; bei einigen Vitolas San Andrés oder Ecuador","vitolas":["Nº1","Nº3","Nº4","Nº5"],"story":"Die Marke, die der Fabrik von 1921 ihren Namen gab. Helles Connecticut-Deckblatt, Einlage aus kubanischer Saat von der Dominikanischen Republik und aus Brasilien: Kanarischer Tabak kommt in dieser Mischung nicht vor — und genau das trennt Dos Santos von den Häusern La Palmas."},{"name":"La Regenta — Gama 1921","color":"#8B5A2B","force":"Medium","wrapper":"Helles Connecticut, bei einigen Vitolas maduro","vitolas":["Half Corona","Robusto","Gran Toro","Maduro Titan"],"story":"Die moderne Linie, in den kurzen dicken Formaten, die der Línea Clásica fehlen. Ihr Name ist das Jahr der Fabrik in der Calle Perojo, in Ziffern."}]',

 '[{"name":"La Regenta — Línea Clásica","color":"#C9A96E","force":"Medium","wrapper":"浅色康涅狄格；部分尺寸用圣安德烈斯或厄瓜多尔叶","vitolas":["Nº1","Nº3","Nº4","Nº5"],"story":"为 1921 年那座工厂命名的品牌。浅色康涅狄格茄衣，茄芯为来自多米尼加共和国与巴西的古巴种源烟叶：加那利本地烟叶并不进入这一配方，而这正是 Dos Santos 与拉帕尔马各家的分野。"},{"name":"La Regenta — Gama 1921","color":"#8B5A2B","force":"Medium","wrapper":"浅色康涅狄格，部分尺寸为马杜罗","vitolas":["Half Corona","Robusto","Gran Toro","Maduro Titan"],"story":"现代线，采用经典线所没有的短粗尺寸。其名以数字写下佩罗霍街那座工厂的年份。"}]',

 '[{"name":"La Regenta — Línea Clásica","color":"#C9A96E","force":"Medium","wrapper":"كونيتيكت فاتح؛ وسان أندريس أو إكوادور في بعض المقاسات","vitolas":["Nº1","Nº3","Nº4","Nº5"],"story":"العلامة التي أعطت مصنع 1921 اسمه. غلاف كونيتيكت فاتح، وحشوة من بذرة كوبية قادمة من الجمهورية الدومينيكية والبرازيل: التبغ الكناري لا يدخل هذا المزيج، وهذا بالذات ما يفصل دوس سانتوس عن دور لا بالما."},{"name":"La Regenta — Gama 1921","color":"#8B5A2B","force":"Medium","wrapper":"كونيتيكت فاتح، أو مادورو في بعض المقاسات","vitolas":["Half Corona","Robusto","Gran Toro","Maduro Titan"],"story":"الخطّ الحديث، بمقاسات قصيرة غليظة تخلو منها السلسلة الكلاسيكية. ويحمل اسمه بالأرقام سنة مصنع شارع بيروخو."}]'),

-- ── Montealto ────────────────────────────────────────────
('Montealto', 'canaries', '1917 ou 1918 — Breña Alta, La Palma',
 'Compañía Insular de Tabaco de La Palma, Las Vueltas, Breña Alta, La Palma',

 'Montealto est la marque haute de la plus ancienne fabrique de cigares encore en activité aux Canaries. Ernesto González Pérez l''installe à Las Vueltas, dans la commune de Breña Alta. La presse canarienne date la fondation de 1917, la maison affiche 1918 ; l''écart n''est pas tranché. Sur l''île, on ne l''appelle pas autrement que « la Fábrica ».

González roulait ses cigares dans la semaine, puis attachait ses bottes au porte-bagages de sa bicyclette et les vendait à travers l''île le samedi et le dimanche. Dans les années 1950, l''atelier comptait soixante employés.

Il en compte aujourd''hui une dizaine. Fabrizio Gentile et Miguel Ángel Pérez González y produisent à la main et à la machine — environ trois cents cigares roulés par jour — sous les marques Montealto, De Lucía, Premium, Casa Vieja, Rica Hoja et Primorosa. La maison cultive cinq mille pieds et complète avec du tabac de Cuba, de République dominicaine et du Nicaragua.

Attention à l''homonymie, qui trompe jusqu''aux répertoires d''entreprises : la Compañía Insular de Tabaco de La Palma n''est pas la Compañía Insular Tabacalera que Benjamín Menéndez a ouverte en 1961 à Las Palmas de Gran Canaria pour y faire le Montecruz. Deux sociétés, deux îles, quarante ans d''écart.',

 '[{"name":"Serie Oro","color":"#C9A227","force":"Medium","wrapper":"Feuille de La Palma, complétée de tabacs importés","vitolas":["Toro","Robusto"],"story":"La ligne haute de la Fábrica, roulée à la main. Le tabac palmero de ses cinq mille pieds y tient la place principale, complété par des feuilles de Cuba, de République dominicaine et du Nicaragua."},{"name":"Serie Plata","color":"#B0B7BC","force":"Medium","wrapper":"Feuille de La Palma, complétée de tabacs importés","vitolas":["Toro"],"story":"Le versant plus accessible du catalogue, sur le même assemblage de base. Environ trois cents cigares sortent chaque jour de l''atelier, toutes marques confondues."}]',

 'Montealto is the top brand of the oldest cigar factory still working in the Canaries. Ernesto González Pérez set it up at Las Vueltas, in the municipality of Breña Alta. The Canary press dates the founding to 1917, the house states 1918; the gap has not been settled. On the island nobody calls it anything but "la Fábrica".

González rolled his cigars during the week, then tied his bundles to the luggage rack of his bicycle and sold them across the island on Saturdays and Sundays. By the 1950s the workshop employed sixty people.

Today it employs about ten. Fabrizio Gentile and Miguel Ángel Pérez González produce there by hand and by machine — some three hundred rolled cigars a day — under the brands Montealto, De Lucía, Premium, Casa Vieja, Rica Hoja and Primorosa. The house grows five thousand plants and makes up the rest with tobacco from Cuba, the Dominican Republic and Nicaragua.

Beware the near-homonymy, which misleads even business directories: the Compañía Insular de Tabaco de La Palma is not the Compañía Insular Tabacalera that Benjamín Menéndez opened in 1961 at Las Palmas de Gran Canaria to make Montecruz. Two companies, two islands, forty years apart.',

 'Montealto es la marca alta de la fábrica de puros más antigua aún en activo de Canarias. Ernesto González Pérez la instala en Las Vueltas, en el municipio de Breña Alta. La prensa canaria data la fundación en 1917, la casa exhibe 1918; la diferencia no está zanjada. En la isla no se la llama de otro modo que «la Fábrica».

González liaba sus puros entre semana, luego ataba sus mazos a la parrilla de su bicicleta y los vendía por toda la isla los sábados y domingos. En los años cincuenta el taller contaba con sesenta empleados.

Hoy cuenta con una decena. Fabrizio Gentile y Miguel Ángel Pérez González producen allí a mano y a máquina — unos trescientos puros liados al día — bajo las marcas Montealto, De Lucía, Premium, Casa Vieja, Rica Hoja y Primorosa. La casa cultiva cinco mil matas y completa con tabaco de Cuba, la República Dominicana y Nicaragua.

Cuidado con la homonimia, que engaña incluso a los directorios de empresas: la Compañía Insular de Tabaco de La Palma no es la Compañía Insular Tabacalera que Benjamín Menéndez abrió en 1961 en Las Palmas de Gran Canaria para hacer allí el Montecruz. Dos sociedades, dos islas, cuarenta años de diferencia.',

 'Montealto ist die Spitzenmarke der ältesten noch arbeitenden Zigarrenfabrik der Kanaren. Ernesto González Pérez richtete sie in Las Vueltas ein, in der Gemeinde Breña Alta. Die kanarische Presse datiert die Gründung auf 1917, das Haus nennt 1918; die Differenz ist nicht geklärt. Auf der Insel heißt sie nur "la Fábrica".

González rollte seine Zigarren unter der Woche, band seine Bündel dann auf den Gepäckträger seines Fahrrads und verkaufte sie samstags und sonntags über die ganze Insel. In den 1950er Jahren beschäftigte die Werkstatt sechzig Menschen.

Heute sind es etwa zehn. Fabrizio Gentile und Miguel Ángel Pérez González fertigen dort von Hand und maschinell — rund dreihundert gerollte Zigarren am Tag — unter den Marken Montealto, De Lucía, Premium, Casa Vieja, Rica Hoja und Primorosa. Das Haus baut fünftausend Pflanzen an und ergänzt mit Tabak aus Kuba, der Dominikanischen Republik und Nicaragua.

Vorsicht bei der Namensähnlichkeit, die selbst Firmenverzeichnisse in die Irre führt: Die Compañía Insular de Tabaco de La Palma ist nicht die Compañía Insular Tabacalera, die Benjamín Menéndez 1961 in Las Palmas de Gran Canaria für die Montecruz eröffnete. Zwei Gesellschaften, zwei Inseln, vierzig Jahre Abstand.',

 'Montealto 是加那利群岛现存最老的一家仍在运转的雪茄厂的高端品牌。Ernesto González Pérez 把它设在布雷尼亚阿尔塔市镇的拉斯武埃尔塔斯。加那利报刊将创立之年定为 1917 年，公司自称 1918 年；这一出入尚无定论。在岛上，人们只叫它「la Fábrica」（那座工厂）。

González 平日卷制雪茄，周六周日便把成捆的雪茄绑在自行车后架上，沿岛贩售。到 1950 年代，这间作坊已有六十名员工。

如今约有十人。Fabrizio Gentile 与 Miguel Ángel Pérez González 在此手工与机械并用，每日卷制约三百支，品牌包括 Montealto、De Lucía、Premium、Casa Vieja、Rica Hoja 与 Primorosa。公司自种五千株烟草，其余以古巴、多米尼加共和国与尼加拉瓜的烟叶补足。

须留意名称的近似，它连企业名录都会误导：Compañía Insular de Tabaco de La Palma 并非 Benjamín Menéndez 于 1961 年在大加那利岛拉斯帕尔马斯开设、用以生产 Montecruz 的 Compañía Insular Tabacalera。两家公司，两座岛，相隔四十年。',

 'مونتيألتو هي العلامة الفاخرة لأقدم مصنع سيجار لا يزال يعمل في جزر الكناري. أنشأه إرنستو غونثالِث بيريث في لاس بويلتاس ببلدية بريينيا ألتا. تؤرّخ الصحافة الكناريّة التأسيس بعام 1917، بينما تعلن الدار 1918؛ والفارق لم يُحسم. وفي الجزيرة لا يسمّيه أحد إلا «لا فابريكا»، أي المصنع.

كان غونثالِث يلفّ سيجاره خلال الأسبوع، ثم يربط حزمه على حمّالة درّاجته ويبيعها في أنحاء الجزيرة يومَي السبت والأحد. وفي خمسينيات القرن الماضي كانت الورشة تضمّ ستّين عاملًا.

أمّا اليوم فنحو عشرة. ينتج فيها فابريتسيو جنتيلي وميغيل أنخل بيريث غونثالِث يدويًا وآليًا — قرابة ثلاثمئة سيجار ملفوف يوميًا — تحت علامات مونتيألتو، ودي لوثيا، وبريميوم، وكاسا بييخا، وريكا أوخا، وبريموروسا. وتزرع الدار خمسة آلاف شتلة وتكمّل الباقي بتبغ من كوبا والجمهورية الدومينيكية ونيكاراغوا.

وانتبه إلى تشابه الاسمين، فهو يضلّل حتى أدلّة الشركات: «كومپانيا إنسولار دي تاباكو دي لا بالما» ليست «كومپانيا إنسولار تاباكاليرا» التي افتتحها بنخامين مينينديث عام 1961 في لاس بالماس دي غران كناريا لصناعة مونتيكروث. شركتان، وجزيرتان، وأربعون عامًا من الفارق.',

 '[{"name":"Serie Oro","color":"#C9A227","force":"Medium","wrapper":"La Palma leaf, completed with imported tobaccos","vitolas":["Toro","Robusto"],"story":"The top line of the Fábrica, hand-rolled. Palmero tobacco from its five thousand plants holds the main place, completed with leaf from Cuba, the Dominican Republic and Nicaragua."},{"name":"Serie Plata","color":"#B0B7BC","force":"Medium","wrapper":"La Palma leaf, completed with imported tobaccos","vitolas":["Toro"],"story":"The more accessible side of the catalogue, on the same base blend. Some three hundred cigars leave the workshop each day, all brands together."}]',

 '[{"name":"Serie Oro","color":"#C9A227","force":"Medium","wrapper":"Hoja de La Palma, completada con tabacos importados","vitolas":["Toro","Robusto"],"story":"La línea alta de la Fábrica, liada a mano. El tabaco palmero de sus cinco mil matas ocupa el lugar principal, completado con hojas de Cuba, la República Dominicana y Nicaragua."},{"name":"Serie Plata","color":"#B0B7BC","force":"Medium","wrapper":"Hoja de La Palma, completada con tabacos importados","vitolas":["Toro"],"story":"La vertiente más accesible del catálogo, sobre la misma ligada de base. Unos trescientos puros salen cada día del taller, contando todas las marcas."}]',

 '[{"name":"Serie Oro","color":"#C9A227","force":"Medium","wrapper":"Blatt von La Palma, ergänzt durch importierte Tabake","vitolas":["Toro","Robusto"],"story":"Die Spitzenlinie der Fábrica, von Hand gerollt. Der Palmero-Tabak ihrer fünftausend Pflanzen nimmt den Hauptplatz ein, ergänzt durch Blatt aus Kuba, der Dominikanischen Republik und Nicaragua."},{"name":"Serie Plata","color":"#B0B7BC","force":"Medium","wrapper":"Blatt von La Palma, ergänzt durch importierte Tabake","vitolas":["Toro"],"story":"Die zugänglichere Seite des Katalogs, auf derselben Grundmischung. Rund dreihundert Zigarren verlassen die Werkstatt täglich, alle Marken zusammen."}]',

 '[{"name":"Serie Oro","color":"#C9A227","force":"Medium","wrapper":"拉帕尔马烟叶，辅以进口烟叶","vitolas":["Toro","Robusto"],"story":"这家工厂的高端线，手工卷制。自种五千株所产的帕尔马烟叶占主体，辅以古巴、多米尼加共和国与尼加拉瓜的烟叶。"},{"name":"Serie Plata","color":"#B0B7BC","force":"Medium","wrapper":"拉帕尔马烟叶，辅以进口烟叶","vitolas":["Toro"],"story":"目录中较为亲民的一侧，用的是同一套基础配方。各品牌合计，作坊每日出品约三百支。"}]',

 '[{"name":"Serie Oro","color":"#C9A227","force":"Medium","wrapper":"ورق لا بالما، مكمَّلًا بأتبغة مستوردة","vitolas":["Toro","Robusto"],"story":"الخطّ الأعلى في «لا فابريكا»، ملفوف باليد. يحتلّ تبغ لا بالما الآتي من شتلاتها الخمسة آلاف المكانة الأولى، مكمَّلًا بورق من كوبا والجمهورية الدومينيكية ونيكاراغوا."},{"name":"Serie Plata","color":"#B0B7BC","force":"Medium","wrapper":"ورق لا بالما، مكمَّلًا بأتبغة مستوردة","vitolas":["Toro"],"story":"الوجه الأيسر منالًا في الكتالوج، على المزيج الأساسي نفسه. تخرج من الورشة نحو ثلاثمئة سيجارة يوميًا، بجميع العلامات مجتمعة."}]'),

-- ── Puros Artesanos Julio ────────────────────────────────
('Puros Artesanos Julio', 'canaries', '2000 — Breña Alta, La Palma',
 'Puros Artesanos Julio, Breña Alta, La Palma',

 'La famille est dans le tabac depuis 1950 ; l''entreprise, elle, porte un prénom et date de 2000. Julio et son frère la fondent alors, avec le métier appris de leur père.

L''atelier est à Breña Alta et la plantation est en face, de l''autre côté de la route. C''est ce qui distingue la maison : la moitié de sa feuille vient de son propre champ, l''autre de Sumatra, de Cuba et du Brésil. Culture, séchage, fermentation, roulage — tout se fait sur ces quelques centaines de mètres.

Breña Alta n''a pas été choisie au hasard : le bourg a une longue tradition tabacole, qu''il doit à un microclimat et aux Palmeros revenus d''Amérique du Sud avec le geste. La maison y a ouvert un magasin thématique et fait visiter son atelier.

Deux lignes tiennent le catalogue, et elles se distinguent par la cape plutôt que par le format : une Connecticut douce, équilibrée à la combustion, et une Brasil sombre aux reflets roux, entre moyenne et corsée.',

 '[{"name":"Connecticut","color":"#C9A96E","force":"Light-Medium","wrapper":"Connecticut","vitolas":[],"story":"La ligne douce, que la maison décrit par son équilibre de combustion et sa souplesse au toucher. Moitié feuille de la plantation d''en face, moitié tabacs de Sumatra, de Cuba et du Brésil."},{"name":"Brasil","color":"#6B4226","force":"Medium-Full","wrapper":"Brésil","vitolas":[],"story":"La cape sombre aux reflets roux, et le versant puissant de la maison : entre moyenne et corsée, sur un goût que l''atelier revendique comme intense."}]',

 'The family has been in tobacco since 1950; the firm itself bears a first name and dates from 2000. Julio and his brother founded it then, with the trade learned from their father.

The workshop is at Breña Alta and the plantation is opposite, across the road. That is what sets the house apart: half its leaf comes from its own field, the other half from Sumatra, Cuba and Brazil. Growing, curing, fermenting, rolling — all of it happens within those few hundred metres.

Breña Alta was not picked at random: the town has a long tobacco tradition, owed to a microclimate and to the Palmeros who came back from South America with the craft. The house has opened a themed shop there and shows visitors round its workshop.

Two lines hold the catalogue, and they differ by wrapper rather than by format: a mild Connecticut, balanced in the burn, and a dark Brazil with reddish tones, medium to full.',

 'La familia está en el tabaco desde 1950; la empresa, en cambio, lleva un nombre de pila y data de 2000. Julio y su hermano la fundan entonces, con el oficio aprendido de su padre.

El taller está en Breña Alta y la plantación está enfrente, al otro lado de la carretera. Es lo que distingue a la casa: la mitad de su hoja viene de su propio campo, la otra de Sumatra, Cuba y Brasil. Cultivo, secado, fermentación, liado: todo ocurre en esos pocos centenares de metros.

Breña Alta no se eligió al azar: el municipio tiene una larga tradición tabaquera, que debe a un microclima y a los palmeros vueltos de Sudamérica con el oficio. La casa ha abierto allí una tienda temática y enseña su taller a los visitantes.

Dos líneas sostienen el catálogo, y se distinguen por la capa más que por el formato: una Connecticut suave, equilibrada en la combustión, y una Brasil oscura de tonos rojizos, entre media y fuerte.',

 'Die Familie ist seit 1950 im Tabak; das Unternehmen selbst trägt einen Vornamen und stammt von 2000. Julio und sein Bruder gründeten es damals, mit dem vom Vater gelernten Handwerk.

Die Werkstatt liegt in Breña Alta, die Plantage gegenüber, auf der anderen Straßenseite. Das unterscheidet dieses Haus: Die Hälfte seines Blattes stammt vom eigenen Feld, die andere aus Sumatra, Kuba und Brasilien. Anbau, Trocknung, Fermentation, Rollen — alles geschieht auf diesen wenigen hundert Metern.

Breña Alta wurde nicht zufällig gewählt: Der Ort hat eine lange Tabaktradition, die er einem Mikroklima verdankt und den Palmeros, die das Handwerk aus Südamerika mitbrachten. Das Haus hat dort einen Themenladen eröffnet und führt Besucher durch seine Werkstatt.

Zwei Linien tragen den Katalog, und sie unterscheiden sich eher durch das Deckblatt als durch das Format: ein mildes Connecticut, ausgewogen im Abbrand, und ein dunkles Brasil mit rötlichen Tönen, mittel bis kräftig.',

 '这个家族自 1950 年起从事烟草；公司本身则以一个名字命名，创立于 2000 年。Julio 与兄弟凭着从父亲那里学来的手艺创办了它。

作坊在布雷尼亚阿尔塔，种植园就在马路对面。这正是它与众不同之处：一半烟叶来自自家田地，另一半来自苏门答腊、古巴与巴西。种植、晾制、发酵、卷制——全部在这几百米之内完成。

布雷尼亚阿尔塔并非随意选定：这个市镇有悠久的烟草传统，得益于当地的小气候，也得益于把手艺从南美带回来的帕尔马人。公司在此开设了一家主题商店，并接待参观作坊。

目录由两条线撑起，区分它们的是茄衣而非尺寸：一条柔和的康涅狄格，燃烧均衡；一条深色泛红的巴西，介于中度与浓烈之间。',

 'العائلة في التبغ منذ عام 1950؛ أمّا الشركة نفسها فتحمل اسمًا شخصيًا وتعود إلى عام 2000. أسّسها آنذاك خوليو وأخوه، بحرفةٍ تعلّماها عن أبيهما.

الورشة في بريينيا ألتا، والمزرعة قبالتها على الجانب الآخر من الطريق. وهذا ما يميّز الدار: نصف ورقها من حقلها الخاص، والنصف الآخر من سومطرة وكوبا والبرازيل. الزراعة والتجفيف والتخمير واللفّ — كلّه يجري في هذه المئات القليلة من الأمتار.

ولم تُختَر بريينيا ألتا اعتباطًا: فللبلدة تقليد تبغيّ طويل تدين به لمناخ محلّي خاص، وللبالميّين العائدين من أمريكا الجنوبية بالحرفة معهم. وقد افتتحت الدار فيها متجرًا موضوعيًا وتستقبل الزوّار في ورشتها.

ويقوم الكتالوج على خطّين، يفرّق بينهما الغلاف لا المقاس: كونيتيكت لطيف متّزن الاحتراق، وبرازيلي داكن بلمحات حمراء، بين المتوسط والقويّ.',

 '[{"name":"Connecticut","color":"#C9A96E","force":"Light-Medium","wrapper":"Connecticut","vitolas":[],"story":"The mild line, which the house describes by its balanced burn and its soft feel. Half the leaf from the plantation across the road, half from Sumatra, Cuba and Brazil."},{"name":"Brasil","color":"#6B4226","force":"Medium-Full","wrapper":"Brazil","vitolas":[],"story":"The dark wrapper with reddish tones, and the house''s stronger side: medium to full, on a taste the workshop claims as intense."}]',

 '[{"name":"Connecticut","color":"#C9A96E","force":"Light-Medium","wrapper":"Connecticut","vitolas":[],"story":"La línea suave, que la casa describe por su equilibrio de combustión y su tacto blando. Mitad hoja de la plantación de enfrente, mitad tabacos de Sumatra, Cuba y Brasil."},{"name":"Brasil","color":"#6B4226","force":"Medium-Full","wrapper":"Brasil","vitolas":[],"story":"La capa oscura de tonos rojizos, y la vertiente potente de la casa: entre media y fuerte, sobre un sabor que el taller reivindica como intenso."}]',

 '[{"name":"Connecticut","color":"#C9A96E","force":"Light-Medium","wrapper":"Connecticut","vitolas":[],"story":"Die milde Linie, die das Haus über ihren ausgewogenen Abbrand und ihre weiche Haptik beschreibt. Zur Hälfte Blatt von der Plantage gegenüber, zur Hälfte Tabake aus Sumatra, Kuba und Brasilien."},{"name":"Brasil","color":"#6B4226","force":"Medium-Full","wrapper":"Brasilien","vitolas":[],"story":"Das dunkle Deckblatt mit rötlichen Tönen und die kräftigere Seite des Hauses: mittel bis stark, auf einem Geschmack, den die Werkstatt als intensiv beansprucht."}]',

 '[{"name":"Connecticut","color":"#C9A96E","force":"Light-Medium","wrapper":"康涅狄格","vitolas":[],"story":"柔和的一条线，公司以燃烧均衡与手感柔软来描述它。一半烟叶来自马路对面的种植园，一半来自苏门答腊、古巴与巴西。"},{"name":"Brasil","color":"#6B4226","force":"Medium-Full","wrapper":"巴西","vitolas":[],"story":"深色泛红的茄衣，也是这家较为强劲的一侧：介于中度与浓烈之间，作坊自称其风味浓郁。"}]',

 '[{"name":"Connecticut","color":"#C9A96E","force":"Light-Medium","wrapper":"كونيتيكت","vitolas":[],"story":"الخطّ اللطيف، وتصفه الدار باتّزان احتراقه ونعومة ملمسه. نصف الورق من المزرعة المقابلة، ونصفه من سومطرة وكوبا والبرازيل."},{"name":"Brasil","color":"#6B4226","force":"Medium-Full","wrapper":"البرازيل","vitolas":[],"story":"الغلاف الداكن ذو اللمحات الحمراء، والوجه الأقوى للدار: بين المتوسط والقويّ، بمذاق تصفه الورشة بالكثيف."}]'),

-- ── Finca Tabaquera El Sitio ─────────────────────────────
('Finca Tabaquera El Sitio', 'canaries', '2005 — Breña Alta, La Palma',
 'Finca Tabaquera El Sitio, La Lomada, Breña Alta, La Palma',

 'El Sitio n''est pas d''abord une marque : c''est un champ. La finca, à La Lomada de Breña Alta, cultive plus de vingt-cinq mille mètres carrés, dont cinq mille sous bâches pour la seule cape — le cultivo bajo telón, qu''aucune autre exploitation de l''archipel ne pratique.

Antonio González, qui la dirige, cultive le tabac depuis l''âge de onze ans. Le parti pris est le plus radical des Canaries : la feuille est entièrement palmera, cape comprise, là où la plupart des cigares dits canariens sont roulés avec du tabac américain importé. La finca sélectionne des semences locales, héritées des plantations du XVIIIe siècle.

Ouverte en 2005, elle se visite du lundi au vendredi. On y suit la plante du champ au roulage, en passant par le séchoir et la fermentation — un enchaînement qu''aucun autre lieu de l''archipel ne montre d''un seul tenant.',

 '[{"name":"El Sitio Robusto","color":"#8B5A2B","force":"Medium","wrapper":"Palmera cultivée sous bâches","vitolas":["Robusto"],"story":"Le cigare qui a fait connaître la finca : entièrement palmero, cape comprise, ce qui est rare aux Canaries. C''est le format sur lequel la finca se fait juger."},{"name":"El Sitio Corona","color":"#A0522D","force":"Medium","wrapper":"Palmera cultivée sous bâches","vitolas":["Corona","Nº 1"],"story":"Les formats longs de la maison, sur le même tabac intégralement insulaire. La cape vient des cinq mille mètres carrés cultivés sous telones."},{"name":"El Sitio Pirámides","color":"#6B4226","force":"Medium","wrapper":"Palmera cultivée sous bâches","vitolas":["Pirámide"],"story":"Le figurado du catalogue. La finca produit sa propre cape et sa propre sous-cape, ce qui lui permet des formes que peu d''ateliers canariens tentent."}]',

 'El Sitio is not first of all a brand: it is a field. The finca, at La Lomada in Breña Alta, farms more than twenty-five thousand square metres, five thousand of them under cloth for the wrapper alone — the cultivo bajo telón, which no other holding in the archipelago practises.

Antonio González, who runs it, has grown tobacco since he was eleven. The stance is the most radical in the Canaries: the leaf is entirely palmera, wrapper included, where most so-called Canary cigars are rolled with imported American tobacco. The finca selects local seeds, inherited from the plantations of the eighteenth century.

Opened in 2005, it can be visited Monday to Friday. There the plant can be followed from the field to the rolling table, by way of the drying barn and fermentation — a sequence no other place in the archipelago shows in one piece.',

 'El Sitio no es ante todo una marca: es un campo. La finca, en La Lomada de Breña Alta, cultiva más de veinticinco mil metros cuadrados, cinco mil de ellos bajo telones para la capa sola: el cultivo bajo telón, que ninguna otra explotación del archipiélago practica.

Antonio González, que la dirige, cultiva tabaco desde los once años. La apuesta es la más radical de Canarias: la hoja es enteramente palmera, capa incluida, cuando la mayoría de los puros llamados canarios se lían con tabaco americano importado. La finca selecciona semillas locales, heredadas de las plantaciones del siglo XVIII.

Abierta en 2005, se visita de lunes a viernes. Allí se sigue la planta del campo al liado, pasando por el secadero y la fermentación: un encadenamiento que ningún otro lugar del archipiélago muestra de una sola vez.',

 'El Sitio ist zuallererst keine Marke, sondern ein Feld. Die Finca in La Lomada bei Breña Alta bewirtschaftet über fünfundzwanzigtausend Quadratmeter, fünftausend davon unter Tüchern allein für das Deckblatt — das cultivo bajo telón, das kein anderer Betrieb des Archipels betreibt.

Antonio González, der sie führt, baut seit seinem elften Lebensjahr Tabak an. Die Haltung ist die kompromissloseste der Kanaren: Das Blatt ist vollständig palmero, Deckblatt eingeschlossen, während die meisten sogenannten kanarischen Zigarren mit importiertem amerikanischem Tabak gerollt werden. Die Finca wählt lokale Samen aus, ererbt von den Pflanzungen des 18. Jahrhunderts.

2005 eröffnet, kann sie montags bis freitags besichtigt werden. Dort lässt sich die Pflanze vom Feld bis zum Rolltisch verfolgen, über Trockenschuppen und Fermentation — eine Abfolge, die kein anderer Ort des Archipels an einem Stück zeigt.',

 'El Sitio 首先不是一个品牌，而是一片田。这座位于布雷尼亚阿尔塔拉洛马达的庄园耕作两万五千余平方米，其中五千平方米覆布遮荫，专供茄衣——即 cultivo bajo telón，群岛上再无第二家如此耕作。

主持庄园的 Antonio González 自十一岁起种植烟草。这是加那利最彻底的一种立场：烟叶全部为帕尔马本地所产，连茄衣在内；而多数所谓的加那利雪茄，用的是进口的美洲烟叶。庄园筛选本地种子，承自十八世纪的种植园。

庄园 2005 年开放，周一至周五可参观。在那里可以跟随烟草从田间走到卷制台，经过晾房与发酵——这一完整链条，群岛上没有第二处能一并展示。',

 'إل سيتيو ليست علامة في المقام الأول، بل حقل. تزرع المزرعة، في لا لومادا ببريينيا ألتا، أكثر من خمسة وعشرين ألف متر مربّع، منها خمسة آلاف تحت أغطية للغلاف وحده — أي الزراعة تحت الستائر، وهي ممارسة لا تعرفها أيّ مزرعة أخرى في الأرخبيل.

أنطونيو غونثالِث، الذي يديرها، يزرع التبغ منذ كان في الحادية عشرة. والموقف هنا هو الأكثر تشدّدًا في الكناري: الورق بالميّ بالكامل، بما فيه الغلاف، في حين تُلَفّ معظم ما يُسمّى بالسيجار الكناري بتبغ أمريكي مستورد. وتنتقي المزرعة بذورًا محلّية موروثة عن مزارع القرن الثامن عشر.

افتُتحت عام 2005، ويمكن زيارتها من الاثنين إلى الجمعة. وفيها تُتابَع النبتة من الحقل إلى طاولة اللفّ، مرورًا بالمجفّف والتخمير — وهو تسلسل لا يعرضه أيّ مكان آخر في الأرخبيل دفعةً واحدة.',

 '[{"name":"El Sitio Robusto","color":"#8B5A2B","force":"Medium","wrapper":"Palmera grown under cloth","vitolas":["Robusto"],"story":"The cigar that made the finca known: wholly palmero, wrapper included, which is rare in the Canaries. It is the format on which the finca lets itself be judged."},{"name":"El Sitio Corona","color":"#A0522D","force":"Medium","wrapper":"Palmera grown under cloth","vitolas":["Corona","Nº 1"],"story":"The house''s long formats, on the same wholly island-grown tobacco. The wrapper comes from the five thousand square metres farmed under telones."},{"name":"El Sitio Pirámides","color":"#6B4226","force":"Medium","wrapper":"Palmera grown under cloth","vitolas":["Pirámide"],"story":"The figurado of the catalogue. The finca produces its own wrapper and its own binder, which allows shapes few Canary workshops attempt."}]',

 '[{"name":"El Sitio Robusto","color":"#8B5A2B","force":"Medium","wrapper":"Palmera cultivada bajo telón","vitolas":["Robusto"],"story":"El puro que dio a conocer la finca: enteramente palmero, capa incluida, lo que es raro en Canarias. Es el formato por el que la finca se deja juzgar."},{"name":"El Sitio Corona","color":"#A0522D","force":"Medium","wrapper":"Palmera cultivada bajo telón","vitolas":["Corona","Nº 1"],"story":"Los formatos largos de la casa, sobre el mismo tabaco íntegramente insular. La capa viene de los cinco mil metros cuadrados cultivados bajo telones."},{"name":"El Sitio Pirámides","color":"#6B4226","force":"Medium","wrapper":"Palmera cultivada bajo telón","vitolas":["Pirámide"],"story":"El figurado del catálogo. La finca produce su propia capa y su propio capote, lo que le permite formas que pocos talleres canarios intentan."}]',

 '[{"name":"El Sitio Robusto","color":"#8B5A2B","force":"Medium","wrapper":"Palmera, unter Tüchern gewachsen","vitolas":["Robusto"],"story":"Die Zigarre, die die Finca bekannt machte: ganz palmero, Deckblatt eingeschlossen, was auf den Kanaren selten ist. Es ist das Format, an dem sich die Finca messen lässt."},{"name":"El Sitio Corona","color":"#A0522D","force":"Medium","wrapper":"Palmera, unter Tüchern gewachsen","vitolas":["Corona","Nº 1"],"story":"Die langen Formate des Hauses, auf demselben vollständig inselgewachsenen Tabak. Das Deckblatt stammt von den fünftausend Quadratmetern unter telones."},{"name":"El Sitio Pirámides","color":"#6B4226","force":"Medium","wrapper":"Palmera, unter Tüchern gewachsen","vitolas":["Pirámide"],"story":"Der Figurado des Katalogs. Die Finca erzeugt ihr eigenes Deck- und Umblatt, was Formen erlaubt, die wenige kanarische Werkstätten wagen."}]',

 '[{"name":"El Sitio Robusto","color":"#8B5A2B","force":"Medium","wrapper":"覆布种植的帕尔马叶","vitolas":["Robusto"],"story":"让这座庄园为人所知的一支：全部为帕尔马烟叶，连茄衣在内，这在加那利并不多见。它也是这座庄园愿意接受评判的那个尺寸。"},{"name":"El Sitio Corona","color":"#A0522D","force":"Medium","wrapper":"覆布种植的帕尔马叶","vitolas":["Corona","Nº 1"],"story":"这家的长型尺寸，用的是同样全然产自本岛的烟叶。茄衣来自那五千平方米的覆布地块。"},{"name":"El Sitio Pirámides","color":"#6B4226","force":"Medium","wrapper":"覆布种植的帕尔马叶","vitolas":["Pirámide"],"story":"目录中的异形款。庄园自产茄衣与茄套，因而能做出加那利少有作坊敢尝试的造型。"}]',

 '[{"name":"El Sitio Robusto","color":"#8B5A2B","force":"Medium","wrapper":"ورق بالميّ مزروع تحت الستائر","vitolas":["Robusto"],"story":"السيجار الذي عرّف بالمزرعة: بالميّ بالكامل، بما فيه الغلاف، وهو أمر نادر في الكناري. وهو المقاس الذي ترتضي المزرعة أن تُحاكَم عليه."},{"name":"El Sitio Corona","color":"#A0522D","force":"Medium","wrapper":"ورق بالميّ مزروع تحت الستائر","vitolas":["Corona","Nº 1"],"story":"المقاسات الطويلة للدار، على التبغ الجزريّ الخالص نفسه. ويأتي الغلاف من الخمسة آلاف متر مربّع المزروعة تحت الستائر."},{"name":"El Sitio Pirámides","color":"#6B4226","force":"Medium","wrapper":"ورق بالميّ مزروع تحت الستائر","vitolas":["Pirámide"],"story":"الشكل المخروطيّ في الكتالوج. تنتج المزرعة غلافها ورابطها بنفسها، ما يتيح لها أشكالًا قلّ أن تجرؤ عليها الورش الكناريّة."}]'),

-- ── Canaritos ────────────────────────────────────────────
('Canaritos', 'canaries', 'Güímar, Tenerife',
 'Güímar, côte est de Tenerife',

 'Canaritos est la seule maison canarienne de cet atlas qui roule à Tenerife. L''atelier est à Güímar, sur la côte est, à peu de distance de Santa Cruz.

Elle assume ce que les maisons de La Palma refusent. Ses cigares sont des shortfillers : la tripe est faite de morceaux de feuille plutôt que de feuilles entières pliées. Et le tabac canarien n''y entre que pour un cinquième environ — le reste vient de République dominicaine.

Ce point est écrit ici parce que l''étiquette ne le dit pas. « Cigare des Canaries » se lit comme une origine ; c''est d''abord un lieu de roulage. La maison n''en fait pas mystère, et son prix le reflète : elle vise le fumeur de tous les jours plutôt que la cave.

C''est aussi ce qui la rend utile dans cet atlas. À côté d''El Sitio, qui cultive sa propre cape sous bâches, Canaritos montre l''autre modèle canarien — celui qui a survécu à l''effondrement des plantations en important sa feuille.',

 '[{"name":"Brevas","color":"#8B7355","force":"Medium","wrapper":"Assemblage dominicain et canarien","vitolas":["Breva"],"story":"Le format qui représente la maison : une douzaine de centimètres, shortfiller, environ un cinquième de tabac canarien pour quatre cinquièmes de dominicain."},{"name":"Miguelitos","color":"#A0522D","force":"Medium","wrapper":"Assemblage dominicain et canarien","vitolas":["Miguelito"],"story":"Le format court, celui de tous les jours. Même assemblage, même parti pris : un cigare de consommation courante plutôt que de garde."}]',

 'Canaritos is the only Canary house in this atlas that rolls on Tenerife. The workshop is at Güímar, on the east coast, a short way from Santa Cruz.

It accepts what the houses of La Palma refuse. Its cigars are shortfillers: the filler is made of pieces of leaf rather than whole folded leaves. And Canary tobacco makes up only about a fifth of the blend — the rest comes from the Dominican Republic.

That point is written here because the label does not say it. "Canary cigar" reads as an origin; it is first of all a place of rolling. The house makes no secret of it, and its price reflects it: it aims at the everyday smoker rather than at the humidor.

That is also what makes it useful in this atlas. Beside El Sitio, which grows its own wrapper under cloth, Canaritos shows the other Canary model — the one that survived the collapse of the plantations by importing its leaf.',

 'Canaritos es la única casa canaria de este atlas que lía en Tenerife. El taller está en Güímar, en la costa este, a poca distancia de Santa Cruz.

Asume lo que las casas de La Palma rechazan. Sus puros son shortfillers: la tripa se hace con trozos de hoja en vez de hojas enteras plegadas. Y el tabaco canario entra solo en torno a una quinta parte: el resto viene de la República Dominicana.

Esto se escribe aquí porque la etiqueta no lo dice. «Puro de Canarias» se lee como un origen; es ante todo un lugar de liado. La casa no lo oculta, y su precio lo refleja: apunta al fumador de todos los días más que a la vitrina.

Es también lo que la hace útil en este atlas. Junto a El Sitio, que cultiva su propia capa bajo telón, Canaritos muestra el otro modelo canario: el que sobrevivió al hundimiento de las plantaciones importando su hoja.',

 'Canaritos ist das einzige kanarische Haus in diesem Atlas, das auf Teneriffa rollt. Die Werkstatt liegt in Güímar an der Ostküste, unweit von Santa Cruz.

Es bekennt sich zu dem, was die Häuser La Palmas ablehnen. Seine Zigarren sind Shortfiller: Die Einlage besteht aus Blattstücken statt aus ganzen gefalteten Blättern. Und kanarischer Tabak macht nur etwa ein Fünftel der Mischung aus — der Rest kommt aus der Dominikanischen Republik.

Das steht hier, weil die Banderole es nicht sagt. "Kanarische Zigarre" liest sich wie eine Herkunft; es ist zuerst ein Ort des Rollens. Das Haus macht daraus kein Geheimnis, und der Preis spiegelt es: Es zielt auf den Alltagsraucher, nicht auf den Humidor.

Genau das macht es in diesem Atlas nützlich. Neben El Sitio, das sein Deckblatt unter Tüchern selbst anbaut, zeigt Canaritos das andere kanarische Modell — jenes, das den Zusammenbruch der Pflanzungen überlebte, indem es sein Blatt importierte.',

 'Canaritos 是本图集收录的加那利雪茄庄中唯一在特内里费卷制的一家。作坊位于东岸的圭马尔，离圣克鲁斯不远。

它坦然接受拉帕尔马各家所拒绝的做法。它的雪茄是短填料：茄芯由碎叶而非整叶折叠而成。而加那利本地烟叶只占约五分之一，其余来自多米尼加共和国。

这一点写在这里，是因为标签上并不写。「加那利雪茄」读起来像是一个产地，其实首先是一个卷制地。这家并不讳言，价格也如实反映：它面向日常烟客，而非陈藏柜。

这也正是它在本图集中的用处。与自种覆布茄衣的 El Sitio 并置，Canaritos 展示了加那利的另一种模式——靠进口烟叶熬过种植园崩溃的那一种。',

 'كناريتوس هي الدار الكناريّة الوحيدة في هذا الأطلس التي تلفّ في تينيريفي. تقع الورشة في غويمار على الساحل الشرقي، غير بعيد عن سانتا كروث.

وهي تتحمّل ما ترفضه دور لا بالما. فسيجارها من نوع الحشوة القصيرة: الحشوة من قطع الورق لا من أوراق كاملة مطويّة. ولا يدخل التبغ الكناري إلا بنحو الخُمس — والباقي من الجمهورية الدومينيكية.

وهذا مكتوب هنا لأنّ البطاقة لا تقوله. فعبارة «سيجار الكناري» تُقرأ كأنّها منشأ، وهي قبل كلّ شيء مكان لفّ. والدار لا تخفي ذلك، وسعرها يعكسه: فهي تقصد مدخّن كلّ يوم لا خزانة الترطيب.

وهذا أيضًا ما يجعلها مفيدة في هذا الأطلس. فإلى جانب إل سيتيو التي تزرع غلافها تحت الستائر، تُظهر كناريتوس النموذج الكناري الآخر — ذاك الذي نجا من انهيار المزارع باستيراد ورقه.',

 '[{"name":"Brevas","color":"#8B7355","force":"Medium","wrapper":"Dominican and Canary blend","vitolas":["Breva"],"story":"The format that stands for the house: about twelve centimetres, shortfiller, roughly one fifth Canary tobacco to four fifths Dominican."},{"name":"Miguelitos","color":"#A0522D","force":"Medium","wrapper":"Dominican and Canary blend","vitolas":["Miguelito"],"story":"The short format, the everyday one. Same blend, same stance: a cigar to smoke rather than to keep."}]',

 '[{"name":"Brevas","color":"#8B7355","force":"Medium","wrapper":"Ligada dominicana y canaria","vitolas":["Breva"],"story":"El formato que representa a la casa: una docena de centímetros, shortfiller, alrededor de una quinta parte de tabaco canario por cuatro quintas de dominicano."},{"name":"Miguelitos","color":"#A0522D","force":"Medium","wrapper":"Ligada dominicana y canaria","vitolas":["Miguelito"],"story":"El formato corto, el de todos los días. Misma ligada, misma apuesta: un puro para fumar más que para guardar."}]',

 '[{"name":"Brevas","color":"#8B7355","force":"Medium","wrapper":"Dominikanisch-kanarische Mischung","vitolas":["Breva"],"story":"Das Format, das für das Haus steht: rund zwölf Zentimeter, Shortfiller, etwa ein Fünftel kanarischer Tabak auf vier Fünftel dominikanischen."},{"name":"Miguelitos","color":"#A0522D","force":"Medium","wrapper":"Dominikanisch-kanarische Mischung","vitolas":["Miguelito"],"story":"Das kurze Format, das für jeden Tag. Gleiche Mischung, gleiche Haltung: eine Zigarre zum Rauchen, nicht zum Lagern."}]',

 '[{"name":"Brevas","color":"#8B7355","force":"Medium","wrapper":"多米尼加与加那利混合","vitolas":["Breva"],"story":"代表这家的尺寸：约十二厘米，短填料，约五分之一为加那利烟叶，五分之四为多米尼加烟叶。"},{"name":"Miguelitos","color":"#A0522D","force":"Medium","wrapper":"多米尼加与加那利混合","vitolas":["Miguelito"],"story":"短尺寸，日常之选。同样的配方，同样的取向：一支用来抽的雪茄，而非用来存的。"}]',

 '[{"name":"Brevas","color":"#8B7355","force":"Medium","wrapper":"مزيج دومينيكي وكناري","vitolas":["Breva"],"story":"المقاس الذي يمثّل الدار: نحو اثني عشر سنتيمترًا، بحشوة قصيرة، وخُمس تقريبًا من التبغ الكناري مقابل أربعة أخماس دومينيكية."},{"name":"Miguelitos","color":"#A0522D","force":"Medium","wrapper":"مزيج دومينيكي وكناري","vitolas":["Miguelito"],"story":"المقاس القصير، مقاس كلّ يوم. المزيج نفسه والموقف نفسه: سيجار للتدخين لا للحفظ."}]'),

-- ── Kolumbus ─────────────────────────────────────────────
('Kolumbus', 'canaries', 'La Palma, Îles Canaries',
 'La Palma, Îles Canaries',

 'Kolumbus est une petite maison de La Palma qui roule en longfiller — feuilles entières — un tabac entièrement palmero : la variété Breña, née des sols volcaniques de l''est de l''île, où se trouvent aussi ses champs. La feuille vieillit plusieurs années en caves de cèdre espagnol avant le roulage.

Trois amis l''ont fondée. La maison ne publie ni leur nom ni son année de fondation, et cet atlas ne les invente pas. Elle est commercialisée depuis la Suisse par Stefan Baltisberger.

Son histoire récente dit quelque chose de toute la scène canarienne. Le règlement européen Track & Trace, écrit contre le trafic de cigarettes, a été étendu au cigare : chaque pièce doit porter un identifiant unique et des marqueurs de sécurité, ce qui suppose des imprimantes certifiées, un logiciel dédié et une licence mensuelle. La revue en ligne zigarren.zone chiffre l''investissement à plus de soixante-dix mille francs suisses, plus deux mille par mois, et rapporte une année entière sans aucune exportation.

Pour un atelier qui roule à la main quelques milliers de cigares, c''est une charge sans rapport avec ses volumes. La règle n''a pas été écrite contre ces maisons-là ; elle les atteint quand même, et c''est le genre de raison pour laquelle une scène disparaît sans que personne l''ait décidé.',

 '[{"name":"K-Azul","color":"#2C5F8A","force":"Medium","wrapper":"Palmero de la variété Breña","vitolas":["Robusto"],"story":"L''un des trois assemblages de la maison, distingués par la couleur de la bague plutôt que par le format. Longfiller intégralement palmero, vieilli en caves de cèdre espagnol."},{"name":"K-Negro","color":"#3A3A3A","force":"Medium-Full","wrapper":"Palmero de la variété Breña","vitolas":["Robustito"],"story":"Le plus sombre des trois, au format court. Même feuille Breña, même vieillissement — c''est l''assemblage qui change, non l''origine."},{"name":"K-Rojo","color":"#8B2222","force":"Medium","wrapper":"Palmero de la variété Breña","vitolas":["Robustito"],"story":"Le troisième de la série, en Robustito lui aussi. La variété Breña donne un registre floral, que la maison décrit par des notes de romarin, de baies et de muscade."}]',

 'Kolumbus is a small house on La Palma that rolls longfiller — whole leaves — from a wholly palmero tobacco: the Breña variety, born of the volcanic soils of the island''s eastern side, where its fields also lie. The leaf ages several years in Spanish cedar cellars before rolling.

Three friends founded it. The house publishes neither their names nor its year of founding, and this atlas does not invent them. It is sold from Switzerland by Stefan Baltisberger.

Its recent history says something about the whole Canary scene. The European Track & Trace regulation, written against cigarette smuggling, was extended to cigars: every piece must carry a unique identifier and security markings, which requires certified label printers, dedicated software and a monthly licence. The online magazine zigarren.zone puts the investment at over seventy thousand Swiss francs, plus some two thousand a month, and reports a full year with no exports at all.

For a workshop hand-rolling a few thousand cigars, that is a burden with no relation to its volumes. The rule was not written against houses like this one; it reaches them all the same, and that is the kind of reason a scene disappears without anyone having decided it.',

 'Kolumbus es una pequeña casa de La Palma que lía en longfiller — hojas enteras — un tabaco enteramente palmero: la variedad Breña, nacida de los suelos volcánicos del este de la isla, donde también están sus campos. La hoja envejece varios años en bodegas de cedro español antes del liado.

La fundaron tres amigos. La casa no publica ni sus nombres ni su año de fundación, y este atlas no los inventa. Se comercializa desde Suiza por Stefan Baltisberger.

Su historia reciente dice algo de toda la escena canaria. El reglamento europeo Track & Trace, escrito contra el contrabando de cigarrillos, se extendió al puro: cada pieza debe llevar un identificador único y marcadores de seguridad, lo que supone impresoras certificadas, software dedicado y una licencia mensual. La revista en línea zigarren.zone cifra la inversión en más de setenta mil francos suizos, más unos dos mil al mes, e informa de un año entero sin ninguna exportación.

Para un taller que lía a mano unos miles de puros, es una carga sin relación con sus volúmenes. La norma no se escribió contra casas como esta; las alcanza igualmente, y esa es la clase de razón por la que una escena desaparece sin que nadie lo haya decidido.',

 'Kolumbus ist ein kleines Haus auf La Palma, das Longfiller rollt — ganze Blätter — aus einem vollständig palmero-Tabak: der Sorte Breña, gewachsen auf den vulkanischen Böden im Osten der Insel, wo auch seine Felder liegen. Das Blatt reift vor dem Rollen mehrere Jahre in spanischen Zedernkellern.

Drei Freunde haben es gegründet. Das Haus nennt weder ihre Namen noch sein Gründungsjahr, und dieser Atlas erfindet sie nicht. Vertrieben wird es aus der Schweiz von Stefan Baltisberger.

Seine jüngere Geschichte sagt etwas über die gesamte kanarische Szene. Die europäische Track-&-Trace-Verordnung, gegen den Zigarettenschmuggel geschrieben, wurde auf Zigarren ausgeweitet: Jedes Stück muss eine eindeutige Kennung und Sicherheitsmerkmale tragen, was zertifizierte Etikettendrucker, eigene Software und eine monatliche Lizenz voraussetzt. Das Onlinemagazin zigarren.zone beziffert die Investition auf über siebzigtausend Schweizer Franken, dazu rund zweitausend im Monat, und berichtet von einem ganzen Jahr ohne jeden Export.

Für eine Werkstatt, die einige tausend Zigarren von Hand rollt, ist das eine Last ohne Bezug zu ihren Mengen. Die Regel wurde nicht gegen solche Häuser geschrieben; sie trifft sie trotzdem, und das ist die Art Grund, aus der eine Szene verschwindet, ohne dass es jemand beschlossen hätte.',

 'Kolumbus 是拉帕尔马岛上的一家小庄，卷制长填料——整叶——所用烟草全然产自本岛：布雷尼亚品种，生于该岛东部的火山土壤，其烟田也在那里。烟叶在卷制前要在西班牙雪松地窖中陈化数年。

它由三位朋友创办。公司既未公布他们的姓名，也未公布创立年份，本图集不予杜撰。其销售由 Stefan Baltisberger 在瑞士经办。

它近年的遭遇说明了整个加那利的处境。原本针对卷烟走私而制定的欧盟 Track & Trace 法规被扩及雪茄：每一支都须带有唯一识别码与安全标记，这就需要认证标签打印机、专用软件与按月付费的许可。网络杂志 zigarren.zone 估算此项投入超过七万瑞士法郎，另加每月约两千法郎，并称该公司整整一年没有任何出口。

对一家手工卷制数千支雪茄的作坊而言，这份负担与其产量毫无对应关系。这条规则并非为对付这样的公司而写；它却照样落到它们身上——一个行业圈子无人决定却悄然消失，往往正是这类缘由。',

 'كولومبوس دار صغيرة في لا بالما تلفّ بالحشوة الطويلة — أوراقًا كاملة — من تبغ بالميّ خالص: صنف بريينيا، المولود في التربة البركانية شرقيّ الجزيرة، حيث تقع حقولها أيضًا. ويُعتَّق الورق سنوات عدّة في أقبية من خشب الأرز الإسباني قبل اللفّ.

أسّسها ثلاثة أصدقاء. ولا تنشر الدار أسماءهم ولا سنة تأسيسها، وهذا الأطلس لا يخترعهما. ويتولّى تسويقها من سويسرا شتيفان بالتيسبرغر.

وتاريخها القريب يقول شيئًا عن المشهد الكناري كلّه. فلائحة «التتبّع والاقتفاء» الأوروبية، التي كُتبت لمكافحة تهريب السجائر، وُسّعت لتشمل السيجار: على كلّ قطعة أن تحمل معرّفًا فريدًا وعلامات أمان، وهو ما يستلزم طابعات ملصقات معتمدة وبرمجيات خاصة ورخصة شهرية. وتقدّر المجلّة الإلكترونية zigarren.zone الاستثمار بأكثر من سبعين ألف فرنك سويسري، إضافةً إلى نحو ألفين شهريًا، وتفيد بمرور سنة كاملة من دون أيّ تصدير.

وبالنسبة إلى ورشة تلفّ باليد بضعة آلاف من السيجار، فهذا عبء لا صلة له بأحجامها. لم تُكتب القاعدة ضدّ دور كهذه؛ لكنّها تصيبها على أيّ حال، وهذا من ذلك الضرب من الأسباب التي يختفي بها مشهد كامل من دون أن يقرّر ذلك أحد.',

 '[{"name":"K-Azul","color":"#2C5F8A","force":"Medium","wrapper":"Palmero, Breña variety","vitolas":["Robusto"],"story":"One of the house''s three blends, told apart by the colour of the band rather than by the format. Wholly palmero longfiller, aged in Spanish cedar cellars."},{"name":"K-Negro","color":"#3A3A3A","force":"Medium-Full","wrapper":"Palmero, Breña variety","vitolas":["Robustito"],"story":"The darkest of the three, in the short format. Same Breña leaf, same ageing — it is the blend that changes, not the origin."},{"name":"K-Rojo","color":"#8B2222","force":"Medium","wrapper":"Palmero, Breña variety","vitolas":["Robustito"],"story":"The third of the series, also a Robustito. The Breña variety gives a floral register, which the house describes through notes of rosemary, berries and nutmeg."}]',

 '[{"name":"K-Azul","color":"#2C5F8A","force":"Medium","wrapper":"Palmero de la variedad Breña","vitolas":["Robusto"],"story":"Una de las tres ligadas de la casa, distinguidas por el color de la vitola y no por el formato. Longfiller íntegramente palmero, envejecido en bodegas de cedro español."},{"name":"K-Negro","color":"#3A3A3A","force":"Medium-Full","wrapper":"Palmero de la variedad Breña","vitolas":["Robustito"],"story":"La más oscura de las tres, en formato corto. Misma hoja Breña, mismo envejecimiento: lo que cambia es la ligada, no el origen."},{"name":"K-Rojo","color":"#8B2222","force":"Medium","wrapper":"Palmero de la variedad Breña","vitolas":["Robustito"],"story":"La tercera de la serie, también en Robustito. La variedad Breña da un registro floral, que la casa describe con notas de romero, bayas y nuez moscada."}]',

 '[{"name":"K-Azul","color":"#2C5F8A","force":"Medium","wrapper":"Palmero der Sorte Breña","vitolas":["Robusto"],"story":"Eine der drei Mischungen des Hauses, unterschieden durch die Farbe des Bauchbands statt durch das Format. Vollständig palmero-Longfiller, in spanischen Zedernkellern gereift."},{"name":"K-Negro","color":"#3A3A3A","force":"Medium-Full","wrapper":"Palmero der Sorte Breña","vitolas":["Robustito"],"story":"Die dunkelste der drei, im kurzen Format. Gleiches Breña-Blatt, gleiche Reifung — es ändert sich die Mischung, nicht die Herkunft."},{"name":"K-Rojo","color":"#8B2222","force":"Medium","wrapper":"Palmero der Sorte Breña","vitolas":["Robustito"],"story":"Die dritte der Reihe, ebenfalls ein Robustito. Die Sorte Breña ergibt ein blumiges Register, das das Haus mit Noten von Rosmarin, Beeren und Muskat beschreibt."}]',

 '[{"name":"K-Azul","color":"#2C5F8A","force":"Medium","wrapper":"布雷尼亚品种的帕尔马叶","vitolas":["Robusto"],"story":"这家三款配方之一，彼此以标环颜色而非尺寸相区分。全然帕尔马的长填料，于西班牙雪松地窖中陈化。"},{"name":"K-Negro","color":"#3A3A3A","force":"Medium-Full","wrapper":"布雷尼亚品种的帕尔马叶","vitolas":["Robustito"],"story":"三者中最深的一款，采短尺寸。同样的布雷尼亚烟叶，同样的陈化——变的是配方，不是产地。"},{"name":"K-Rojo","color":"#8B2222","force":"Medium","wrapper":"布雷尼亚品种的帕尔马叶","vitolas":["Robustito"],"story":"系列中的第三款，同为 Robustito。布雷尼亚品种带来花香调，公司以迷迭香、浆果与肉豆蔻的气息来描述它。"}]',

 '[{"name":"K-Azul","color":"#2C5F8A","force":"Medium","wrapper":"بالميّ من صنف بريينيا","vitolas":["Robusto"],"story":"أحد مزائج الدار الثلاثة، ويُفرَّق بينها بلون الحزام لا بالمقاس. حشوة طويلة بالميّة بالكامل، معتَّقة في أقبية أرز إسبانية."},{"name":"K-Negro","color":"#3A3A3A","force":"Medium-Full","wrapper":"بالميّ من صنف بريينيا","vitolas":["Robustito"],"story":"أدكن الثلاثة، بالمقاس القصير. ورق بريينيا نفسه والتعتيق نفسه — المتغيّر هو المزيج لا المنشأ."},{"name":"K-Rojo","color":"#8B2222","force":"Medium","wrapper":"بالميّ من صنف بريينيا","vitolas":["Robustito"],"story":"ثالث السلسلة، وهو أيضًا روبوستيتو. يمنح صنف بريينيا طابعًا زهريًا تصفه الدار بلمحات من إكليل الجبل والتوت وجوزة الطيب."}]');

-- ════════════════════════════════════════════════════════
-- LA COLONNE MUETTE DE VARGAS
-- ────────────────────────────────────────────────────────
-- `founded` portait « La Palma, Îles Canaries » : un LIEU dans un champ
-- de DATE, donc rien. Enrique Vargas de Paz ouvre son chinchal sur
-- l'avenue Maritime de Santa Cruz de La Palma en 1925, avec son frère
-- Felipe. Ces deux colonnes ne sont pas traduites : aucun sceau à
-- recalculer.
-- ════════════════════════════════════════════════════════
UPDATE `brands` SET
 `founded`    = '1925 — Santa Cruz de La Palma',
 `factory`    = 'Tabacos Vargas, avenue Maritime, Santa Cruz de La Palma',
 `updated_at` = NOW()
 WHERE `name` = 'Vargas';

-- ════════════════════════════════════════════════════════
-- LA FICHE DE PAYS
-- ────────────────────────────────────────────────────────
-- `notes` s'arrêtait à l'exil cubain de 1960. Il manquait le fait qui
-- explique l'état actuel de l'archipel : le mildiou bleu a détruit les
-- plantations de La Palma en 1967.
-- ════════════════════════════════════════════════════════
UPDATE `producer_countries` SET
 `notes`    = 'Terre d''origine de nombreuses familles tabacoles cubaines — et leur refuge après 1960. L''industrie insulaire, elle, ne s''est jamais relevée du mildiou bleu qui a détruit les plantations de La Palma en 1967 : il reste des ateliers, il n''y a plus d''industrie.',
 `notes_en` = 'The homeland of many Cuban tobacco families — and their refuge after 1960. The island industry itself never recovered from the blue mould that destroyed La Palma''s plantations in 1967: workshops remain, an industry does not.',
 `notes_es` = 'Tierra de origen de muchas familias tabaqueras cubanas — y su refugio después de 1960. La industria insular, en cambio, nunca se repuso del moho azul que destruyó las plantaciones de La Palma en 1967: quedan talleres, ya no hay industria.',
 `notes_de` = 'Herkunftsland vieler kubanischer Tabakfamilien — und ihr Zufluchtsort nach 1960. Die Inselindustrie selbst hat sich vom Blauschimmel, der 1967 die Pflanzungen La Palmas vernichtete, nie erholt: Werkstätten gibt es noch, eine Industrie nicht mehr.',
 `notes_zh` = '许多古巴烟草世家的祖籍地——也是他们 1960 年之后的避难所。而本地的产业再未从 1967 年那场摧毁拉帕尔马种植园的霜霉病中恢复：作坊仍在，产业已无。',
 `notes_ar` = 'أرض المنشأ لكثير من عائلات التبغ الكوبية — وملاذها بعد 1960. أمّا الصناعة الجزريّة فلم تتعافَ قطّ من العفن الأزرق الذي دمّر مزارع لا بالما عام 1967: بقيت الورش، ولم تبقَ صناعة.',
 `tabacaleras` = '["Compañía Insular de Tabaco de La Palma","Dos Santos","Finca Tabaquera El Sitio","Puros Artesanos Julio","Tabacos Vargas","Compañía Insular Tabacalera"]',
 `regions`     = '["La Palma","Breña Alta","Las Palmas de Gran Canaria","Güímar (Tenerife)"]',
 `updated_at`  = NOW()
 WHERE `id` = 'canaries';

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
 WHERE b.`name` IN ('Dos Santos','Montealto','Puros Artesanos Julio',
                    'Finca Tabaquera El Sitio','Canaritos','Kolumbus')
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

UPDATE `translation_status` t
  JOIN `producer_countries` p ON p.`id` = t.`entite_id`
   SET t.`source_hash` = SHA1(p.`notes`), t.`statut` = 'machine', t.`maj` = NOW()
 WHERE t.`entite` = 'producer_countries' AND t.`champ` = 'notes' AND t.`entite_id` = 'canaries';

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 182','systeme','maisons_canariennes_ajoutees','marque',0,
   'LES CANARIES ETAIENT LE PAYS PRODUCTEUR LE PLUS PAUVRE DE L ATLAS : deux fiches, Vargas et Montecruz, pour un archipel qui cultive ET roule au meme endroit — ce que presque aucun autre endroit d Europe ne fait. Six maisons ajoutees : Dos Santos (Gran Canaria, 1921), Montealto (Brena Alta, 1917/1918), Puros Artesanos Julio (2000), Finca Tabaquera El Sitio (2005), Canaritos (Guimar, Tenerife) et Kolumbus'),
  (NULL,'migration 182','systeme','homonymie_levee','pays',0,
   'DEUX SOCIETES PRESQUE HOMONYMES, a quarante ans et une mer d ecart : la Compania Insular Tabacalera de Benjamin Menendez (Las Palmas de Gran Canaria, 1961, celle du Montecruz) et la Compania Insular de Tabaco de La Palma (Brena Alta, 1917/1918, celle du Montealto). producer_countries.tabacaleras ne portait que la premiere, ce qui laissait croire a une seule. La fiche Montealto ecrit la distinction en toutes lettres : meme les repertoires d entreprises confondent les deux'),
  (NULL,'migration 182','systeme','colonne_muette_reparee','marque',0,
   'Vargas.founded disait « La Palma, Iles Canaries » — un LIEU dans un champ de DATE, donc rien. Enrique Vargas de Paz ouvre son chinchal sur l avenue Maritime de Santa Cruz de La Palma en 1925, avec son frere Felipe. founded et factory ne sont pas des colonnes traduites : corrigees sans toucher aux sceaux'),
  (NULL,'migration 182','systeme','fait_manquant_au_pays','pays',0,
   'notes s arretait a l exil cubain de 1960 et taisait LE fait qui explique l etat actuel de l archipel : le mildiou bleu a detruit les plantations de La Palma en 1967. Il reste des ateliers, il n y a plus d industrie. Les six fiches ne se lisent pas sans cela'),
  (NULL,'migration 182','systeme','rangs_mondiaux_refuses','marque',0,
   'LES SOURCES CANARIENNES SONT GENEREUSES EN RANGS MONDIAUX et aucun n est repris : « l un des meilleurs melangeurs du monde » pour Vargas selon la revue Tobacconist, « parmi les dix meilleures du monde » pour El Sitio, « consideres les meilleurs d Europe » pour Montealto. La distinction d El Sitio est mentionnee SANS son rang et attribuee a la revue qui la decerne. Winston Churchill, cite comme client par le materiel commercial de Vargas, n est pas repris non plus'),
  (NULL,'migration 182','systeme','ce_qui_n_est_pas_su','marque',0,
   'LA FICHE KOLUMBUS DIT CE QU ELLE NE SAIT PAS : trois amis l ont fondee, la maison ne publie ni leur nom ni son annee de fondation, et l atlas ne les invente pas. Meme traitement que la variete du tabac de Fagot en Cote d Ivoire. En revanche sa fiche porte un fait que les autres n ont pas : le reglement europeen Track and Trace, ecrit contre le trafic de cigarettes et etendu au cigare, chiffre par zigarren.zone a plus de soixante-dix mille francs suisses d investissement et une annee sans aucune exportation'),
  (NULL,'migration 182','systeme','deux_modeles_canariens','marque',0,
   'CANARITOS EST GARDEE POUR CE QU ELLE MONTRE, pas malgre lui : shortfiller, un cinquieme seulement de tabac canarien, le reste dominicain. A cote d El Sitio qui cultive sa propre cape sous batches, elle donne l autre modele canarien — celui qui a survecu a l effondrement des plantations en important sa feuille. La fiche l ecrit parce que l etiquette « cigare des Canaries » ne le dit pas');

-- ════════════════════════════════════════════════════════
-- LE TABLEAU `brands` DU PAYS, EN TOUTES LETTRES — 8 ENTRÉES
-- ════════════════════════════════════════════════════════
UPDATE `producer_countries`
   SET `brands` = '[{"name":"Vargas","desc":"Le cigare palmero, roulé sur l''île","iconic":true},{"name":"Montecruz","desc":"1961, le Montecristo que les Menéndez ont refait en exil","iconic":true},{"name":"Dos Santos","desc":"1921, Gran Canaria — la seule qui ne soit pas de La Palma","iconic":true},{"name":"Montealto","desc":"La plus ancienne fabrique encore en activité de l''archipel","iconic":true},{"name":"Finca Tabaquera El Sitio","desc":"Un champ avant d''être une marque : cape palmera cultivée sous bâches","iconic":true},{"name":"Puros Artesanos Julio","desc":"La plantation est en face de l''atelier","iconic":false},{"name":"Kolumbus","desc":"Longfiller intégralement palmero, vieilli en caves de cèdre","iconic":false},{"name":"Canaritos","desc":"Güímar, Tenerife — l''autre modèle canarien, shortfiller et feuille importée","iconic":false}]',
       `updated_at` = NOW()
 WHERE `id` = 'canaries';

-- ════════════════════════════════════════════════════════
-- DEUX ZONES DE PRODUCTION, POUR QUE LES ÉTIQUETTES MÈNENT QUELQUE PART
-- ────────────────────────────────────────────────────────
-- `coherence_check` a refusé « Breña Alta » et « Güímar (Tenerife) »
-- annoncées dans `regions` sans zone derrière — une étiquette qui ne
-- mène nulle part. Elles existent maintenant, avec leurs coordonnées.
--
-- « Santa Cruz de La Palma » a été retirée de `regions` plutôt
-- qu'ajoutée ici : ses coordonnées sont DÉJÀ celles de la zone « La
-- Palma » (28.6835 / -17.7642). Deux points au même endroit sur le
-- globe ne disent rien de plus.
--
-- ⚠ RÈGLE DES ID EXPLICITES (migration 143) : `production_zones` est
-- une table versionnée à AUTO_INCREMENT ; l'id est écrit, jamais laissé
-- au moteur, sinon `contenu.sql` diverge d'une base à l'autre.
-- ════════════════════════════════════════════════════════
INSERT INTO `production_zones`
  (`id`, `country_id`, `name`, `lat`, `lon`, `color`,
   `note`, `note_en`, `note_es`, `note_de`, `note_zh`, `note_ar`)
VALUES
 (49, 'canaries', 'Breña Alta', 28.6539, -17.7889, '#D2691E',
  'Le bourg tabacole de La Palma : la Fábrica de 1917, la finca El Sitio et l''atelier de Julio y tiennent dans quelques kilomètres',
  'La Palma''s tobacco town: the 1917 Fábrica, the El Sitio finca and Julio''s workshop all lie within a few kilometres',
  'El municipio tabaquero de La Palma: la Fábrica de 1917, la finca El Sitio y el taller de Julio caben en unos pocos kilómetros',
  'Der Tabakort La Palmas: die Fábrica von 1917, die Finca El Sitio und Julios Werkstatt liegen wenige Kilometer auseinander',
  '拉帕尔马的烟草市镇：1917 年的那座工厂、El Sitio 庄园与 Julio 的作坊，都在几公里之内',
  'بلدة التبغ في لا بالما: مصنع 1917، ومزرعة إل سيتيو، وورشة خوليو، كلّها ضمن بضعة كيلومترات'),
 (50, 'canaries', 'Güímar (Tenerife)', 28.3186, -16.4133, '#B8860B',
  'La côte est de Tenerife, où Canaritos roule en shortfiller avec une feuille très majoritairement importée',
  'The east coast of Tenerife, where Canaritos rolls shortfillers from largely imported leaf',
  'La costa este de Tenerife, donde Canaritos lía shortfillers con hoja mayoritariamente importada',
  'Die Ostküste Teneriffas, wo Canaritos Shortfiller aus überwiegend importiertem Blatt rollt',
  '特内里费东岸，Canaritos 在此以大部分进口的烟叶卷制短填料雪茄',
  'الساحل الشرقي لتينيريفي، حيث تلفّ كناريتوس سيجارًا بحشوة قصيرة من ورق مستورد في معظمه');

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'production_zones', z.`id`, 'note', l.lang, SHA1(z.`note`), 'machine', NOW()
  FROM `production_zones` z
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE z.`id` IN (49, 50)
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 182','systeme','garde_fous_respectes','marque',0,
   'TROIS GARDE-FOUS ONT REFUSE LE PREMIER JET, ET AUCUN REFUS N A ETE EXCEPTE. marques_check : El Sitio citait Cigar Journal dans douze colonnes sans source_url vers le classement — mention RETIREE. coherence_check : regions annoncait Brena Alta, Guimar et Santa Cruz de La Palma sans zone de production derriere, et varieties annoncait Brena sans fiche — les deux premieres regions sont devenues de vraies zones (49 et 50), Santa Cruz est retiree car ses coordonnees sont deja celles de la zone La Palma, et Brena est retiree car ce n est pas une variete distincte mais le nom que Kolumbus donne a la feuille palmera, qui a deja sa fiche canaries-la-palma. i18n_superlatif_check : deux traductions affirmaient un rang que le francais ne porte pas — le chinois de Dos Santos et un comparatif de substitution espagnol chez Kolumbus');
