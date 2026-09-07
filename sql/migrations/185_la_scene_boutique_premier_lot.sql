-- ════════════════════════════════════════════════════════
-- 185 — La scène boutique nicaraguayenne, premier lot
-- ────────────────────────────────────────────────────────
-- Six maisons, toutes rattachées au Nicaragua, toutes absentes de
-- l'atlas jusqu'ici :
--
--   Dunbarton Tobacco & Trust  Steve Saka, 2015
--   RoMa Craft Tobac           Rosales et Martin, 2012
--   Viaje                      Andre Farkas, 2008
--   Room101                    Matt Booth, 2009
--   L'Atelier                  Pete Johnson, 2012
--   La Aroma de Cuba           nom cubain des années 1880, refait en 2009
--
-- ── CE QUE CE LOT DIT D'UN SEUL COUP ────────────────────
-- CINQ DE CES SIX MAISONS N'ONT PAS D'USINE. Elles composent et font
-- rouler ailleurs — chez Joya de Nicaragua, A.J. Fernández, My Father,
-- Aganorsa. L'atlas porte déjà ces quatre manufactures, et déjà deux
-- maisons sans mur : Crowned Heads et Warped. Le modèle n'est plus
-- l'exception, c'est devenu la règle de la scène boutique, et il brouille
-- la lecture du drapeau : le cigare qu'on tient sort d'un atelier dont le
-- nom ne figure nulle part sur la boîte.
--
-- RoMa Craft est l'exception, et son histoire dit pourquoi : elle a
-- commencé dans le GARAGE de son assembleur, puis a bâti son propre
-- atelier l'année suivante.
--
-- ── UNE PRODUCTION ÉCLATÉE, ET LA FICHE LE DIT ──────────
-- Room101 sort principalement de la Tabacalera A.J. Fernández à Estelí,
-- mais certaines lignes viennent de la Joya de Nicaragua et d'autres de
-- la HATSA, au Honduras. La fiche est nicaraguayenne parce que l'atlas
-- classe par le lieu PRINCIPAL — et elle écrit l'éclatement plutôt que
-- de le taire.
--
-- ── CE QUE CES FICHES REFUSENT D'ÉCRIRE ─────────────────
-- WINSTON CHURCHILL, ENCORE. Le matériel commercial de La Aroma de Cuba
-- le compte parmi ses premiers fumeurs, à l'époque cubaine — exactement
-- comme celui de Vargas aux Canaries, refusé à la migration 182. La
-- fiche le MENTIONNE en le rendant à qui l'affirme, et ne le reprend pas
-- à son compte.
--
-- Les notes de presse sont écartées de même : le Viaje Oro Reserva VOR
-- No. 5 et plusieurs Southern Draw portent des scores de Cigar
-- Aficionado, et aucun n'entre ici faute de `source_url` — règle de
-- `marques_check`, déjà appliquée à El Sitio dans la migration 182.
--
-- Et « la seule marque boutique fabriquée exclusivement chez A.J.
-- Fernández » n'est pas repris non plus : c'est un rang, pas un fait.
--
-- ── TROIS REPRISES, DONT UNE QUI N'EST PAS UN GARDE-FOU ─
-- `marques_check` a lu « Green River Sucker One » entre guillemets
-- comme une PAROLE PRÊTÉE. C'est un nom de cultivar, pas une citation —
-- mais le contrôle a raison sur la forme : des guillemets autour d'un
-- groupe de mots se lisent comme une parole. Ils sont retirés dans les
-- six langues plutôt qu'exceptés.
--
-- `i18n_superlatif_check` a vu deux rangs que le français ne porte pas :
-- quatre 第一 / 最 en chinois chez L'Atelier contre deux au français, et
-- un « أكثر » arabe là où le français dit « plus direct » — un
-- comparatif que le motif français ne compte pas. Reformulés.
--
-- ET UN DÉFAUT QU'AUCUN OUTIL NE POUVAIT VOIR : deux fiches disaient
-- « des cinq autres de ce lot » et « des autres maisons sans mur de ce
-- lot ». « Ce lot » est le découpage de CE FICHIER, pas une notion du
-- site : un lecteur de la fiche RoMa Craft n'a aucun moyen de savoir de
-- quoi il s'agit. Le processus de travail avait fui dans le texte
-- publié. Corrigé dans les douze colonnes concernées.
--
-- ── LE TABLEAU JSON EST POSÉ EN TOUTES LETTRES ──────────
-- Règle des migrations 179 à 183 : aucun `JSON_*`.
-- `producer_countries.brands` pour `nicaragua` passe de vingt-deux à
-- vingt-huit entrées, écrites entières.
--
-- ⚠ LES `founded` TIENNENT TOUS SOUS 49 CARACTÈRES. Leçon de la
-- migration 184 : `brands.founded` est un varchar(50) qui tronque sans
-- rien dire, et `coherence_check` refuse désormais toute valeur qui
-- tombe pile sur la capacité de sa colonne.
--
-- Sources : dunbartoncigars.com et halfwheel.com (Saka, 2015, Joya de
-- Nicaragua et NACSA, les quatre assemblages), halfwheel.com « Rosales
-- and Martin Launch RoMa Craft Tobac » et tobaccobusiness.com (le
-- garage d'Esteban Disla, NicaSueño, le mot « craft »), cigaraficionado
-- .com (Viaje, Farkas, le tournant de 2012 ; L'Atelier Imports ; La
-- Aroma de Cuba chez García), halfwheel.com « Room101 Acquired by STG »
-- et cigar-coop.com (production éclatée AJF / Joya / HATSA),
-- holts.com (La Aroma de Cuba : origines cubaines, famille Levin).
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

-- ── Dunbarton Tobacco & Trust ────────────────────────────
('Dunbarton Tobacco & Trust', 'nicaragua', '2015 — Steve Saka, ex-Drew Estate',
 'Joya de Nicaragua et NACSA, Estelí, Nicaragua',

 'Dunbarton Tobacco & Trust n''a pas d''usine, et son fondateur en a pourtant dirigé une. Steve Saka a été président de Drew Estate — que cet atlas porte — avant de partir monter sa propre maison, à l''été 2015.

Il fait rouler chez d''autres : à la Joya de Nicaragua, la plus ancienne manufacture du pays et elle aussi dans cet atlas, et à la NACSA, Nicaragua American Cigars, où le Mi Querida sort sous la main de Raul Disla. C''est le modèle de Crowned Heads, avec une différence : Saka compose lui-même et signe ses assemblages de son nom.

Sobremesa ouvre le catalogue en 2015. Le mot désigne en espagnol le moment où l''on reste à table après le repas, quand la conversation continue — et il donne son registre à la maison : mi-corsé à corsé, terre, épice douce, cuir, café torréfié.

Les gammes suivantes portent des noms qui n''expliquent rien à qui ne les connaît pas, et c''est délibéré : Mi Querida, Sin Compromiso, Todos Las Dias, Triqui Traca, Muestra de Saka. La dernière est une série d''essais — littéralement, les échantillons de Saka.',

 '[{"name":"Sobremesa","color":"#8B5A2B","force":"Medium-Full","wrapper":"Habano d''Équateur","vitolas":["Robusto","Toro","Corona","Elegante"],"story":"La première gamme, sortie en 2015. Cape Habano d''Équateur, sous-cape San Andrés du Mexique, tripe nicaraguayenne complétée d''un ligero de Pennsylvanie — une feuille que peu de maisons emploient."},{"name":"Mi Querida","color":"#4A2C1A","force":"Full","wrapper":"Connecticut Broadleaf","vitolas":["Fino Largo","Triqui Traca"],"story":"Cape Connecticut Broadleaf sombre sur un cœur entièrement nicaraguayen. C''est la gamme roulée à la NACSA, sous la conduite de Raul Disla."},{"name":"Sin Compromiso","color":"#3A2A20","force":"Full","wrapper":"San Andrés Negro","vitolas":["Selección No. 5","Parejo No. 2"],"story":"Roulée à la Joya de Nicaragua. Cape San Andrés Negro dite « Cultivo Tonto », sous-cape Habano d''Équateur en ligero fin, tripes nicaraguayennes de plantations choisies une à une."},{"name":"Todos Las Dias","color":"#6B4226","force":"Full","wrapper":"Nicaragua","vitolas":["Robusto","Toro"],"story":"Le puro nicaraguayen de la maison — cape, sous-cape et tripe du même pays — roulé à la Joya de Nicaragua. Le nom dit l''intention : un cigare de tous les jours, à un niveau de force qui ne l''est pas."}]',

 'Dunbarton Tobacco & Trust has no factory, and yet its founder once ran one. Steve Saka was president of Drew Estate — which this atlas holds — before leaving to set up his own house, in the summer of 2015.

He has others roll for him: at Joya de Nicaragua, the country''s oldest factory and likewise in this atlas, and at NACSA, Nicaragua American Cigars, where Mi Querida comes out under the hand of Raul Disla. It is the Crowned Heads model, with one difference: Saka blends himself, and signs his blends with his own name.

Sobremesa opened the catalogue in 2015. The word names the Spanish moment when people stay at the table after the meal, while the conversation goes on — and it sets the house''s register: medium to full, earth, sweet spice, leather, dark roast coffee.

The ranges that followed carry names that explain nothing to anyone who does not already know them, and that is deliberate: Mi Querida, Sin Compromiso, Todos Las Dias, Triqui Traca, Muestra de Saka. The last is a series of trials — literally, Saka''s samples.',

 'Dunbarton Tobacco & Trust no tiene fábrica, y sin embargo su fundador dirigió una. Steve Saka fue presidente de Drew Estate — que este atlas recoge — antes de marcharse a montar su propia casa, en el verano de 2015.

Hace liar en casa de otros: en Joya de Nicaragua, la manufactura más antigua del país y también presente en este atlas, y en NACSA, Nicaragua American Cigars, donde el Mi Querida sale de la mano de Raul Disla. Es el modelo de Crowned Heads, con una diferencia: Saka liga él mismo y firma sus ligadas con su nombre.

Sobremesa abre el catálogo en 2015. La palabra nombra ese momento en que uno se queda en la mesa después de comer, mientras la conversación sigue, y fija el registro de la casa: de medio a fuerte, tierra, especia dulce, cuero, café tostado.

Las gamas siguientes llevan nombres que no explican nada a quien no las conoce, y es deliberado: Mi Querida, Sin Compromiso, Todos Las Dias, Triqui Traca, Muestra de Saka. La última es una serie de ensayos: literalmente, las muestras de Saka.',

 'Dunbarton Tobacco & Trust hat keine Fabrik, und dabei hat sein Gründer einmal eine geleitet. Steve Saka war Präsident von Drew Estate — das dieser Atlas führt —, bevor er ging, um im Sommer 2015 sein eigenes Haus zu gründen.

Er lässt bei anderen rollen: bei Joya de Nicaragua, der ältesten Manufaktur des Landes und ebenfalls in diesem Atlas, und bei NACSA, Nicaragua American Cigars, wo die Mi Querida unter der Hand von Raul Disla entsteht. Es ist das Modell von Crowned Heads, mit einem Unterschied: Saka mischt selbst und zeichnet seine Mischungen mit dem eigenen Namen.

Sobremesa eröffnete 2015 den Katalog. Das Wort benennt jenen spanischen Moment, in dem man nach dem Essen am Tisch sitzen bleibt, während das Gespräch weitergeht — und es setzt das Register des Hauses: mittel bis kräftig, Erde, süße Würze, Leder, dunkel gerösteter Kaffee.

Die folgenden Linien tragen Namen, die niemandem etwas erklären, der sie nicht schon kennt, und das ist Absicht: Mi Querida, Sin Compromiso, Todos Las Dias, Triqui Traca, Muestra de Saka. Die letzte ist eine Versuchsreihe — wörtlich, Sakas Muster.',

 'Dunbarton Tobacco & Trust 没有自己的工厂，而其创办人曾经掌管过一家。Steve Saka 曾任 Drew Estate（本图集已收录）的总裁，随后离开，于 2015 年夏天创立自己的公司。

他请别人代卷：一处是尼加拉瓜最老的工厂、同样收录于本图集的 Joya de Nicaragua，另一处是 NACSA（Nicaragua American Cigars），Mi Querida 便出自那里 Raul Disla 之手。这与 Crowned Heads 的模式相同，只有一点不同：Saka 亲自调配，并以自己的名字为配方署名。

Sobremesa 于 2015 年开启这份目录。这个西班牙语词指的是饭后众人仍留在桌边、谈话继续的那段时光——它也定下了这家的基调：中度至浓烈，土壤、甜香料、皮革、深焙咖啡。

其后各系列的名字对不熟悉的人毫无解释可言，而这是有意为之：Mi Querida、Sin Compromiso、Todos Las Dias、Triqui Traca、Muestra de Saka。最后一个是试验系列——字面意思就是「Saka 的样品」。',

 'دنبارتون توباكو آند ترست بلا مصنع، مع أنّ مؤسّسها أدار مصنعًا يومًا. فقد كان ستيف ساكا رئيسًا لدرو إستيت — التي يضمّها هذا الأطلس — قبل أن يرحل ليؤسّس داره الخاصة في صيف 2015.

وهو يوكِل اللفّ إلى غيره: إلى خويا دي نيكاراغوا، أقدم مصانع البلاد وهي أيضًا في هذا الأطلس، وإلى ناكسا (نيكاراغوا أمريكان سيغارز) حيث تخرج «مي كيريدا» على يد راؤول ديسلا. إنّه نموذج كراونِد هيدز، مع فارق واحد: ساكا يمزج بنفسه ويوقّع مزائجه باسمه.

وافتتحت «سوبريميسا» الكتالوج عام 2015. والكلمة تسمّي تلك اللحظة الإسبانية التي يبقى فيها المرء إلى المائدة بعد الطعام والحديث مستمرّ — وهي التي تحدّد مزاج الدار: متوسط إلى قويّ، بالتراب والتوابل الحلوة والجلد والقهوة المحمّصة داكنًا.

أمّا السلاسل التالية فتحمل أسماء لا تشرح شيئًا لمن لا يعرفها، وذلك مقصود: مي كيريدا، وسين كومپروميسو، وتودوس لاس دياس، وتريكي تراكا، ومويسترا دي ساكا. والأخيرة سلسلة تجارب — حرفيًا: عيّنات ساكا.',

 '[{"name":"Sobremesa","color":"#8B5A2B","force":"Medium-Full","wrapper":"Ecuadorian Habano","vitolas":["Robusto","Toro","Corona","Elegante"],"story":"The first range, out in 2015. Ecuadorian Habano wrapper, Mexican San Andrés binder, Nicaraguan filler completed with a Pennsylvania ligero — a leaf few houses use."},{"name":"Mi Querida","color":"#4A2C1A","force":"Full","wrapper":"Connecticut Broadleaf","vitolas":["Fino Largo","Triqui Traca"],"story":"A dark Connecticut Broadleaf wrapper over a wholly Nicaraguan core. This is the range rolled at NACSA, under Raul Disla."},{"name":"Sin Compromiso","color":"#3A2A20","force":"Full","wrapper":"San Andrés Negro","vitolas":["Selección No. 5","Parejo No. 2"],"story":"Rolled at Joya de Nicaragua. San Andrés Negro wrapper called \\"Cultivo Tonto\\", a thin Ecuadorian Habano ligero binder, Nicaraguan fillers from plantations chosen one by one."},{"name":"Todos Las Dias","color":"#6B4226","force":"Full","wrapper":"Nicaragua","vitolas":["Robusto","Toro"],"story":"The house''s Nicaraguan puro — wrapper, binder and filler from the one country — rolled at Joya de Nicaragua. The name states the intent: an everyday cigar, at a strength that is not."}]',

 '[{"name":"Sobremesa","color":"#8B5A2B","force":"Medium-Full","wrapper":"Habano de Ecuador","vitolas":["Robusto","Toro","Corona","Elegante"],"story":"La primera gama, salida en 2015. Capa Habano de Ecuador, capote San Andrés de México, tripa nicaragüense completada con un ligero de Pensilvania: una hoja que pocas casas emplean."},{"name":"Mi Querida","color":"#4A2C1A","force":"Full","wrapper":"Connecticut Broadleaf","vitolas":["Fino Largo","Triqui Traca"],"story":"Capa Connecticut Broadleaf oscura sobre un corazón enteramente nicaragüense. Es la gama liada en NACSA, bajo la conducción de Raul Disla."},{"name":"Sin Compromiso","color":"#3A2A20","force":"Full","wrapper":"San Andrés Negro","vitolas":["Selección No. 5","Parejo No. 2"],"story":"Liada en Joya de Nicaragua. Capa San Andrés Negro llamada «Cultivo Tonto», capote de ligero fino Habano de Ecuador, tripas nicaragüenses de plantaciones escogidas una a una."},{"name":"Todos Las Dias","color":"#6B4226","force":"Full","wrapper":"Nicaragua","vitolas":["Robusto","Toro"],"story":"El puro nicaragüense de la casa — capa, capote y tripa del mismo país — liado en Joya de Nicaragua. El nombre dice la intención: un puro de todos los días, con una fuerza que no lo es."}]',

 '[{"name":"Sobremesa","color":"#8B5A2B","force":"Medium-Full","wrapper":"Habano aus Ecuador","vitolas":["Robusto","Toro","Corona","Elegante"],"story":"Die erste Linie, 2015 erschienen. Deckblatt Habano aus Ecuador, Umblatt San Andrés aus Mexiko, nicaraguanische Einlage, ergänzt durch einen Ligero aus Pennsylvania — ein Blatt, das wenige Häuser verwenden."},{"name":"Mi Querida","color":"#4A2C1A","force":"Full","wrapper":"Connecticut Broadleaf","vitolas":["Fino Largo","Triqui Traca"],"story":"Dunkles Connecticut-Broadleaf-Deckblatt über einem vollständig nicaraguanischen Kern. Diese Linie wird bei NACSA gerollt, unter Raul Disla."},{"name":"Sin Compromiso","color":"#3A2A20","force":"Full","wrapper":"San Andrés Negro","vitolas":["Selección No. 5","Parejo No. 2"],"story":"Bei Joya de Nicaragua gerollt. Deckblatt San Andrés Negro namens \\"Cultivo Tonto\\", Umblatt aus dünnem ecuadorianischem Habano-Ligero, nicaraguanische Einlagen von einzeln ausgewählten Pflanzungen."},{"name":"Todos Las Dias","color":"#6B4226","force":"Full","wrapper":"Nicaragua","vitolas":["Robusto","Toro"],"story":"Der nicaraguanische Puro des Hauses — Deckblatt, Umblatt und Einlage aus einem Land — bei Joya de Nicaragua gerollt. Der Name sagt die Absicht: eine Alltagszigarre, in einer Stärke, die es nicht ist."}]',

 '[{"name":"Sobremesa","color":"#8B5A2B","force":"Medium-Full","wrapper":"厄瓜多尔 Habano","vitolas":["Robusto","Toro","Corona","Elegante"],"story":"2015 年问世的第一条线。厄瓜多尔 Habano 茄衣，墨西哥圣安德烈斯茄套，尼加拉瓜茄芯并辅以宾夕法尼亚 ligero——这是少有品牌使用的一种烟叶。"},{"name":"Mi Querida","color":"#4A2C1A","force":"Full","wrapper":"康涅狄格宽叶","vitolas":["Fino Largo","Triqui Traca"],"story":"深色康涅狄格宽叶茄衣，内里全为尼加拉瓜烟叶。这条线在 NACSA 卷制，由 Raul Disla 主持。"},{"name":"Sin Compromiso","color":"#3A2A20","force":"Full","wrapper":"圣安德烈斯 Negro","vitolas":["Selección No. 5","Parejo No. 2"],"story":"在 Joya de Nicaragua 卷制。茄衣为称作「Cultivo Tonto」的圣安德烈斯 Negro，茄套为厄瓜多尔 Habano 薄 ligero，茄芯来自逐一挑选的尼加拉瓜种植园。"},{"name":"Todos Las Dias","color":"#6B4226","force":"Full","wrapper":"尼加拉瓜","vitolas":["Robusto","Toro"],"story":"这家的尼加拉瓜纯产雪茄——茄衣、茄套与茄芯同出一国——在 Joya de Nicaragua 卷制。名字道出意图：一支日常的雪茄，只是它的浓度并不日常。"}]',

 '[{"name":"Sobremesa","color":"#8B5A2B","force":"Medium-Full","wrapper":"هابانو إكوادوري","vitolas":["Robusto","Toro","Corona","Elegante"],"story":"السلسلة الأولى، صدرت عام 2015. غلاف هابانو إكوادوري، ورابط سان أندريس مكسيكي، وحشوة نيكاراغوية مكمَّلة بليغيرو من بنسلفانيا — وهو ورق قلّ أن تستعمله الدور."},{"name":"Mi Querida","color":"#4A2C1A","force":"Full","wrapper":"كونيتيكت برودليف","vitolas":["Fino Largo","Triqui Traca"],"story":"غلاف كونيتيكت برودليف داكن فوق قلب نيكاراغوي بالكامل. وهي السلسلة الملفوفة في ناكسا بإشراف راؤول ديسلا."},{"name":"Sin Compromiso","color":"#3A2A20","force":"Full","wrapper":"سان أندريس نيغرو","vitolas":["Selección No. 5","Parejo No. 2"],"story":"تُلَفّ في خويا دي نيكاراغوا. غلاف سان أندريس نيغرو يُدعى «كولتيفو تونتو»، ورابط من ليغيرو هابانو إكوادوري رفيع، وحشوات نيكاراغوية من مزارع منتقاة واحدة واحدة."},{"name":"Todos Las Dias","color":"#6B4226","force":"Full","wrapper":"نيكاراغوا","vitolas":["Robusto","Toro"],"story":"سيجار الدار النيكاراغوي الخالص — غلافًا ورابطًا وحشوة من بلد واحد — ملفوف في خويا دي نيكاراغوا. والاسم يقول المقصد: سيجار كلّ يوم، بقوّة ليست كذلك."}]'),

-- ── RoMa Craft Tobac ─────────────────────────────────────
('RoMa Craft Tobac', 'nicaragua', '2012 — Estelí, Nicaragua',
 'Fábrica de Tabacos NicaSueño, Estelí, Nicaragua',

 'RoMa Craft refuse le mot « boutique » et lui préfère celui d''artisan. Le nom vient des deux fondateurs — RO pour Rosales, MA pour Martin — et la maison naît officiellement le 24 janvier 2012.

Elle a commencé dans un garage, et ce n''est pas une figure de style. En 2010, Mike Rosales et Skip Martin vont à Estelí, y rencontrent l''assembleur Esteban Disla, et les trois hommes font les premiers CroMagnon chez lui, dans son garage. L''année suivante, Rosales et Martin bâtissent leur propre atelier : la Fábrica de Tabacos NicaSueño, deux cent vingt mètres carrés.

Tout sort de là depuis, et c''est ce qui la distingue de la plupart des maisons boutique : elle a des murs. Le catalogue se lit comme une préhistoire — CroMagnon, Aquitaine, Neanderthal — et les assemblages sont plus composites que la taille de l''atelier ne le laisserait croire : sous-cape camerounaise chez les deux premiers, double ligero de Pennsylvanie chez le troisième.

La distinction que la maison tient à faire — artisan plutôt que boutique — porte sur l''échelle et sur le contrôle : petites séries, relation directe avec les détaillants, et la feuille choisie une à une.',

 '[{"name":"CroMagnon","color":"#4A2C1A","force":"Full","wrapper":"Connecticut Broadleaf maduro","vitolas":["Anthropology","Mandible","EMH"],"story":"La première gamme, née dans le garage d''Esteban Disla en 2010. Cape Connecticut Broadleaf maduro, sous-cape camerounaise, tripe nicaraguayenne."},{"name":"Aquitaine","color":"#8B4513","force":"Full","wrapper":"Habano d''Équateur, ligero","vitolas":["Gran Perfecto","Mode 5","Knuckle Dragger"],"story":"Le pendant de CroMagnon sous une cape de ligero Habano d''Équateur, épaisse et huileuse. Même sous-cape camerounaise, visos et secos de trois fermes nicaraguayennes."},{"name":"Intemperance","color":"#A0522D","force":"Medium","wrapper":"Connecticut d''Équateur (EC XVIII) ou Arapiraca du Brésil (BA XXI)","vitolas":["Virtue","Charity","Justice"],"story":"La gamme la plus abordable, en deux capes au choix. Sous-cape indonésienne, tripes nicaraguayennes et dominicaines — l''assemblage le plus international de la maison."},{"name":"Neanderthal","color":"#2E2018","force":"Full","wrapper":"San Andrés du Mexique","vitolas":["HN","SGP","LH"],"story":"Le plus fort du catalogue. Cape San Andrés, sous-cape Connecticut Broadleaf, tripes de Condega, Estelí, Jalapa et Pueblo Nuevo, un olor ligero dominicain, et un double ligero de Pennsylvanie appelé Green River Sucker One."}]',

 'RoMa Craft refuses the word "boutique" and prefers craft. The name comes from its two founders — RO for Rosales, MA for Martin — and the house was formally created on 24 January 2012.

It began in a garage, and that is not a figure of speech. In 2010 Mike Rosales and Skip Martin went to Estelí, met the blender Esteban Disla there, and the three men made the first CroMagnons at his home, in his garage. The following year Rosales and Martin built their own workshop: Fábrica de Tabacos NicaSueño, two hundred and twenty square metres.

Everything has come out of it since, and that is what sets this house apart from most boutique houses: it has walls. The catalogue reads like a prehistory — CroMagnon, Aquitaine, Neanderthal — and the blends are more composite than the size of the workshop would suggest: a Cameroon binder in the first two, a Pennsylvania double ligero in the third.

The distinction the house insists on — craft rather than boutique — is about scale and about control: small runs, direct dealing with retailers, and leaf chosen one at a time.',

 'RoMa Craft rechaza la palabra «boutique» y prefiere la de artesano. El nombre viene de sus dos fundadores — RO por Rosales, MA por Martin — y la casa nace oficialmente el 24 de enero de 2012.

Empezó en un garaje, y no es una figura retórica. En 2010, Mike Rosales y Skip Martin van a Estelí, allí conocen al ligador Esteban Disla, y los tres hacen los primeros CroMagnon en su casa, en su garaje. Al año siguiente, Rosales y Martin construyen su propio taller: la Fábrica de Tabacos NicaSueño, doscientos veinte metros cuadrados.

Todo sale de allí desde entonces, y eso distingue a esta casa de la mayoría de las casas boutique: tiene paredes. El catálogo se lee como una prehistoria — CroMagnon, Aquitaine, Neanderthal — y las ligadas son más compuestas de lo que el tamaño del taller dejaría suponer: capote camerunés en las dos primeras, doble ligero de Pensilvania en la tercera.

La distinción que la casa mantiene — artesano antes que boutique — atañe a la escala y al control: series cortas, trato directo con los detallistas y la hoja escogida una a una.',

 'RoMa Craft lehnt das Wort "Boutique" ab und zieht ihm "craft" vor. Der Name kommt von den beiden Gründern — RO für Rosales, MA für Martin — und das Haus entstand förmlich am 24. Januar 2012.

Es begann in einer Garage, und das ist keine Redewendung. 2010 fuhren Mike Rosales und Skip Martin nach Estelí, trafen dort den Blender Esteban Disla, und die drei machten die ersten CroMagnon bei ihm zu Hause, in seiner Garage. Im Jahr darauf bauten Rosales und Martin ihre eigene Werkstatt: die Fábrica de Tabacos NicaSueño, zweihundertzwanzig Quadratmeter.

Seither kommt alles von dort, und das unterscheidet dieses Haus von den meisten Boutiquehäusern: Es hat Mauern. Der Katalog liest sich wie eine Urgeschichte — CroMagnon, Aquitaine, Neanderthal — und die Mischungen sind vielteiliger, als die Größe der Werkstatt vermuten ließe: ein Kameruner Umblatt bei den ersten beiden, ein doppelter Ligero aus Pennsylvania beim dritten.

Die Unterscheidung, auf der das Haus besteht — craft statt Boutique —, betrifft Maßstab und Kontrolle: kleine Serien, direkter Umgang mit den Händlern und Blatt für Blatt ausgewählte Ware.',

 'RoMa Craft 拒绝「boutique（精品）」一词，宁愿自称 craft（手作）。名字取自两位创办人——RO 取自 Rosales，MA 取自 Martin——公司于 2012 年 1 月 24 日正式成立。

它起于一间车库，这并非修辞。2010 年，Mike Rosales 与 Skip Martin 前往埃斯特利，在那里结识调配师 Esteban Disla，三人在他家的车库里做出了最初的 CroMagnon。次年，Rosales 与 Martin 建起自己的作坊：Fábrica de Tabacos NicaSueño，二百二十平方米。

此后一切皆出自那里，这也是它有别于多数精品雪茄庄之处：它有自己的厂房。其目录读来像一部史前史——CroMagnon、Aquitaine、Neanderthal——而配方之复杂远超作坊规模所能想见：前两者用喀麦隆茄套，第三者用宾夕法尼亚双 ligero。

这家坚持的那个区别——手作而非精品——关乎规模与掌控：小批量、与零售商直接往来，以及一片一片挑出来的烟叶。',

 'روما كرافت ترفض كلمة «بوتيك» وتفضّل عليها كلمة «حِرَفية». والاسم مأخوذ من مؤسّسيها — RO من روساليس، وMA من مارتن — وقد تأسّست الدار رسميًا في 24 يناير 2012.

بدأت في مرآب، وليست هذه استعارة. ففي 2010 ذهب مايك روساليس وسكيب مارتن إلى إستيلي، والتقيا هناك المازج إستيبان ديسلا، وصنع الثلاثة أوّل سيجار «كرومانيون» في بيته، في مرآبه. وفي العام التالي بنى روساليس ومارتن ورشتهما الخاصة: فابريكا دي تاباكوس نيكاسوينيو، بمساحة مئتين وعشرين مترًا مربّعًا.

ومنذ ذلك الحين يخرج كلّ شيء من هناك، وهذا ما يميّزها عن معظم دور البوتيك: لها جدران. ويُقرأ الكتالوج كأنّه تاريخ ما قبل التاريخ — كرومانيون، وأكيتين، ونياندرتال — والمزائج أكثر تركيبًا ممّا يوحي به حجم الورشة: رابط كاميروني في الأوّلين، وليغيرو مزدوج من بنسلفانيا في الثالث.

أمّا التمييز الذي تتمسّك به الدار — حِرَفية لا بوتيك — فيتعلّق بالمقياس وبالتحكّم: دفعات صغيرة، وتعامل مباشر مع بائعي التجزئة، وورق يُنتقى ورقةً ورقة.',

 '[{"name":"CroMagnon","color":"#4A2C1A","force":"Full","wrapper":"Connecticut Broadleaf maduro","vitolas":["Anthropology","Mandible","EMH"],"story":"The first range, born in Esteban Disla''s garage in 2010. Connecticut Broadleaf maduro wrapper, Cameroon binder, Nicaraguan filler."},{"name":"Aquitaine","color":"#8B4513","force":"Full","wrapper":"Ecuadorian Habano ligero","vitolas":["Gran Perfecto","Mode 5","Knuckle Dragger"],"story":"CroMagnon''s counterpart under a thick, oily Ecuadorian Habano ligero wrapper. Same Cameroon binder, visos and secos from three Nicaraguan farms."},{"name":"Intemperance","color":"#A0522D","force":"Medium","wrapper":"Ecuadorian Connecticut (EC XVIII) or Brazilian Arapiraca (BA XXI)","vitolas":["Virtue","Charity","Justice"],"story":"The most affordable range, in a choice of two wrappers. Indonesian binder, Nicaraguan and Dominican fillers — the house''s most international blend."},{"name":"Neanderthal","color":"#2E2018","force":"Full","wrapper":"Mexican San Andrés","vitolas":["HN","SGP","LH"],"story":"The strongest in the catalogue. San Andrés wrapper, Connecticut Broadleaf binder, fillers from Condega, Estelí, Jalapa and Pueblo Nuevo, a Dominican olor ligero, and a Pennsylvania double ligero called Green River Sucker One."}]',

 '[{"name":"CroMagnon","color":"#4A2C1A","force":"Full","wrapper":"Connecticut Broadleaf maduro","vitolas":["Anthropology","Mandible","EMH"],"story":"La primera gama, nacida en el garaje de Esteban Disla en 2010. Capa Connecticut Broadleaf maduro, capote camerunés, tripa nicaragüense."},{"name":"Aquitaine","color":"#8B4513","force":"Full","wrapper":"Habano de Ecuador, ligero","vitolas":["Gran Perfecto","Mode 5","Knuckle Dragger"],"story":"El contrapunto de CroMagnon bajo una capa de ligero Habano de Ecuador, gruesa y aceitosa. Mismo capote camerunés, visos y secos de tres fincas nicaragüenses."},{"name":"Intemperance","color":"#A0522D","force":"Medium","wrapper":"Connecticut de Ecuador (EC XVIII) o Arapiraca de Brasil (BA XXI)","vitolas":["Virtue","Charity","Justice"],"story":"La gama más asequible, con dos capas a elegir. Capote indonesio, tripas nicaragüenses y dominicanas: la ligada más internacional de la casa."},{"name":"Neanderthal","color":"#2E2018","force":"Full","wrapper":"San Andrés de México","vitolas":["HN","SGP","LH"],"story":"El más fuerte del catálogo. Capa San Andrés, capote Connecticut Broadleaf, tripas de Condega, Estelí, Jalapa y Pueblo Nuevo, un olor ligero dominicano y un doble ligero de Pensilvania llamado Green River Sucker One."}]',

 '[{"name":"CroMagnon","color":"#4A2C1A","force":"Full","wrapper":"Connecticut Broadleaf Maduro","vitolas":["Anthropology","Mandible","EMH"],"story":"Die erste Linie, 2010 in Esteban Dislas Garage entstanden. Deckblatt Connecticut Broadleaf Maduro, Kameruner Umblatt, nicaraguanische Einlage."},{"name":"Aquitaine","color":"#8B4513","force":"Full","wrapper":"Ecuadorianischer Habano-Ligero","vitolas":["Gran Perfecto","Mode 5","Knuckle Dragger"],"story":"Das Gegenstück zur CroMagnon unter einem dicken, öligen Deckblatt aus ecuadorianischem Habano-Ligero. Gleiches Kameruner Umblatt, Visos und Secos von drei nicaraguanischen Farmen."},{"name":"Intemperance","color":"#A0522D","force":"Medium","wrapper":"Ecuador-Connecticut (EC XVIII) oder brasilianisches Arapiraca (BA XXI)","vitolas":["Virtue","Charity","Justice"],"story":"Die günstigste Linie, mit zwei Deckblättern zur Wahl. Indonesisches Umblatt, nicaraguanische und dominikanische Einlagen — die internationalste Mischung des Hauses."},{"name":"Neanderthal","color":"#2E2018","force":"Full","wrapper":"Mexikanisches San Andrés","vitolas":["HN","SGP","LH"],"story":"Die kräftigste des Katalogs. San-Andrés-Deckblatt, Connecticut-Broadleaf-Umblatt, Einlagen aus Condega, Estelí, Jalapa und Pueblo Nuevo, ein dominikanischer Olor-Ligero und ein doppelter Pennsylvania-Ligero namens Green River Sucker One."}]',

 '[{"name":"CroMagnon","color":"#4A2C1A","force":"Full","wrapper":"康涅狄格宽叶马杜罗","vitolas":["Anthropology","Mandible","EMH"],"story":"最早的一条线，2010 年诞生于 Esteban Disla 的车库。康涅狄格宽叶马杜罗茄衣，喀麦隆茄套，尼加拉瓜茄芯。"},{"name":"Aquitaine","color":"#8B4513","force":"Full","wrapper":"厄瓜多尔 Habano ligero","vitolas":["Gran Perfecto","Mode 5","Knuckle Dragger"],"story":"CroMagnon 的对照款，改用厚实油润的厄瓜多尔 Habano ligero 茄衣。同样的喀麦隆茄套，配三座尼加拉瓜农场的 viso 与 seco。"},{"name":"Intemperance","color":"#A0522D","force":"Medium","wrapper":"厄瓜多尔康涅狄格（EC XVIII）或巴西 Arapiraca（BA XXI）","vitolas":["Virtue","Charity","Justice"],"story":"价位最亲民的一条线，茄衣二选一。印尼茄套，尼加拉瓜与多米尼加茄芯——这家最国际化的配方。"},{"name":"Neanderthal","color":"#2E2018","force":"Full","wrapper":"墨西哥圣安德烈斯","vitolas":["HN","SGP","LH"],"story":"目录中最浓烈的一支。圣安德烈斯茄衣，康涅狄格宽叶茄套，茄芯取自孔德加、埃斯特利、哈拉帕与普韦布洛努埃沃，另有多米尼加 olor ligero 与名为 Green River Sucker One 的宾夕法尼亚双 ligero。"}]',

 '[{"name":"CroMagnon","color":"#4A2C1A","force":"Full","wrapper":"كونيتيكت برودليف مادورو","vitolas":["Anthropology","Mandible","EMH"],"story":"السلسلة الأولى، وُلدت في مرآب إستيبان ديسلا عام 2010. غلاف كونيتيكت برودليف مادورو، ورابط كاميروني، وحشوة نيكاراغوية."},{"name":"Aquitaine","color":"#8B4513","force":"Full","wrapper":"ليغيرو هابانو إكوادوري","vitolas":["Gran Perfecto","Mode 5","Knuckle Dragger"],"story":"نظيرة كرومانيون تحت غلاف من ليغيرو هابانو إكوادوري سميك زيتيّ. الرابط الكاميروني نفسه، مع فيسو وسيكو من ثلاث مزارع نيكاراغوية."},{"name":"Intemperance","color":"#A0522D","force":"Medium","wrapper":"كونيتيكت إكوادوري (EC XVIII) أو أراپيراكا برازيلي (BA XXI)","vitolas":["Virtue","Charity","Justice"],"story":"أيسر السلاسل منالًا، بغلافين للاختيار. رابط إندونيسي، وحشوات نيكاراغوية ودومينيكية — أكثر مزائج الدار عالميّة."},{"name":"Neanderthal","color":"#2E2018","force":"Full","wrapper":"سان أندريس المكسيكي","vitolas":["HN","SGP","LH"],"story":"الأقوى في الكتالوج. غلاف سان أندريس، ورابط كونيتيكت برودليف، وحشوات من كونديغا وإستيلي وخالابا وبويبلو نويفو، وأولور ليغيرو دومينيكي، وليغيرو مزدوج من بنسلفانيا يُدعى Green River Sucker One."}]'),

-- ── Viaje ────────────────────────────────────────────────
('Viaje', 'nicaragua', '2008 — Andre Farkas ; roulé chez Aganorsa',
 'Aganorsa, Estelí, Nicaragua',

 'Viaje a fait de la rareté une règle, puis son unique mode de fonctionnement. Andre Farkas fonde la marque en 2008 sur deux gammes régulières, Platino et Oro.

Il lance à côté des petites séries — Stuffed Turkey, Skull and Bones, Daisy Cutter — et constate que ses clients les achètent davantage que le catalogue courant. En 2012 il en tire la conséquence, et elle est radicale : il abandonne les gammes régulières et ne fait plus que des séries limitées.

C''est un choix qui coûte. Une maison sans catalogue permanent ne peut pas être référencée durablement par un détaillant, ne peut pas se juger d''une année sur l''autre, et laisse le fumeur devant un cigare qu''il ne retrouvera pas. Viaje l''assume, et c''est ce qui la définit dans cet atlas.

Tout est roulé chez Aganorsa, à Estelí — la maison que cet atlas porte sous le nom d''Aganorsa Leaf, et qui cultive sa propre feuille. Le goût s''en déduit : le tabac est nicaraguayen, et la marque n''en fait pas mystère.',

 '[{"name":"Skull and Bones","color":"#2E2018","force":"Full","wrapper":"Nicaragua (Aganorsa)","vitolas":["Daisy Cutter","« ? »"],"story":"La série la plus suivie de la maison, reprise d''année en année sous des sous-titres différents. Chaque sortie est limitée et n''est pas rééditée telle quelle."},{"name":"Oro et Platino","color":"#8B7355","force":"Medium","wrapper":"Nicaragua (Aganorsa)","vitolas":["Reserva VOR"],"story":"Les deux gammes régulières d''origine, celles de 2008. Elles ont été abandonnées en 2012 quand la maison a choisi de ne plus faire que des séries limitées — elles ne reviennent que par intermittence."}]',

 'Viaje made rarity a rule, then its only way of working. Andre Farkas founded the brand in 2008 on two regular ranges, Platino and Oro.

Alongside them he released small runs — Stuffed Turkey, Skull and Bones, Daisy Cutter — and found that his customers were buying those more than the standing catalogue. In 2012 he drew the conclusion, and it was a radical one: he dropped the regular ranges and now makes limited runs only.

It is a choice that costs. A house with no permanent catalogue cannot be stocked reliably by a retailer, cannot be judged from one year to the next, and leaves the smoker with a cigar he will not find again. Viaje accepts that, and it is what defines it in this atlas.

Everything is rolled at Aganorsa, in Estelí — the house this atlas holds as Aganorsa Leaf, which grows its own leaf. The taste follows: the tobacco is Nicaraguan, and the brand makes no secret of it.',

 'Viaje hizo de la rareza una regla, y luego su único modo de funcionar. Andre Farkas funda la marca en 2008 sobre dos gamas regulares, Platino y Oro.

Al lado lanza series cortas — Stuffed Turkey, Skull and Bones, Daisy Cutter — y comprueba que sus clientes las compran más que el catálogo corriente. En 2012 saca la consecuencia, y es radical: abandona las gamas regulares y ya solo hace series limitadas.

Es una elección que cuesta. Una casa sin catálogo permanente no puede ser referenciada de forma duradera por un detallista, no puede juzgarse de un año a otro, y deja al fumador ante un puro que no volverá a encontrar. Viaje lo asume, y eso es lo que la define en este atlas.

Todo se lía en Aganorsa, en Estelí — la casa que este atlas recoge como Aganorsa Leaf, y que cultiva su propia hoja. El gusto se deduce: el tabaco es nicaragüense, y la marca no lo oculta.',

 'Viaje hat die Seltenheit zur Regel gemacht und dann zu seiner einzigen Arbeitsweise. Andre Farkas gründete die Marke 2008 auf zwei festen Linien, Platino und Oro.

Daneben brachte er kleine Serien heraus — Stuffed Turkey, Skull and Bones, Daisy Cutter — und stellte fest, dass seine Kunden diese mehr kauften als den laufenden Katalog. 2012 zog er die Konsequenz, und sie war radikal: Er gab die festen Linien auf und macht seither nur noch limitierte Serien.

Das kostet. Ein Haus ohne ständigen Katalog kann von einem Händler nicht dauerhaft geführt werden, lässt sich nicht von Jahr zu Jahr beurteilen, und lässt den Raucher mit einer Zigarre zurück, die er nicht wiederfindet. Viaje nimmt das in Kauf, und das ist es, was es in diesem Atlas ausmacht.

Alles wird bei Aganorsa in Estelí gerollt — dem Haus, das dieser Atlas als Aganorsa Leaf führt und das seinen eigenen Tabak anbaut. Der Geschmack folgt daraus: Der Tabak ist nicaraguanisch, und die Marke macht daraus kein Geheimnis.',

 'Viaje 把稀有当作规矩，后来更把它当作唯一的经营方式。Andre Farkas 于 2008 年以两条常规线 Platino 与 Oro 创办了这个品牌。

他在其旁推出小批量产品——Stuffed Turkey、Skull and Bones、Daisy Cutter——却发现顾客买这些比买常规目录更多。2012 年他做出了结论，而且十分决绝：放弃常规线，此后只做限量。

这个选择是有代价的。没有常设目录的品牌无法被零售商稳定备货，无法逐年比较，也让烟客面对一支再也找不到的雪茄。Viaje 承担了这一切，而这正是它在本图集中的定位。

一切均在埃斯特利的 Aganorsa 卷制——本图集以 Aganorsa Leaf 之名收录的那一家，它自种烟叶。风味由此可知：烟草来自尼加拉瓜，品牌对此并不讳言。',

 'جعلت «بياخي» من النُّدرة قاعدة، ثم جعلتها طريقتها الوحيدة في العمل. أسّس أندريه فاركاس العلامة عام 2008 على سلسلتين ثابتتين: بلاتينو وأورو.

وأطلق إلى جانبهما دفعات صغيرة — ستافد تيركي، وسكال آند بونز، ودايزي كاتر — فوجد أنّ زبائنه يقبلون عليها أكثر من الكتالوج الجاري. وفي 2012 استخلص النتيجة، وكانت جذرية: تخلّى عن السلاسل الثابتة ولم يعد يصنع سوى إصدارات محدودة.

وهو خيار له ثمنه. فالدار بلا كتالوج دائم لا يستطيع بائع التجزئة أن يعتمدها بثبات، ولا يمكن الحكم عليها من سنة إلى أخرى، وتترك المدخّن أمام سيجار لن يجده مرّة ثانية. تقبل «بياخي» ذلك، وهو ما يحدّدها في هذا الأطلس.

ويُلَفّ كلّ شيء عند أغانورسا في إستيلي — الدار التي يضمّها هذا الأطلس باسم Aganorsa Leaf، والتي تزرع ورقها بنفسها. ومن هنا يُستنتج المذاق: التبغ نيكاراغوي، والعلامة لا تخفي ذلك.',

 '[{"name":"Skull and Bones","color":"#2E2018","force":"Full","wrapper":"Nicaragua (Aganorsa)","vitolas":["Daisy Cutter","\\"?\\""],"story":"The house''s most followed series, taken up year after year under different subtitles. Each release is limited and is not reissued as it was."},{"name":"Oro and Platino","color":"#8B7355","force":"Medium","wrapper":"Nicaragua (Aganorsa)","vitolas":["Reserva VOR"],"story":"The two original regular ranges, from 2008. They were dropped in 2012 when the house chose to make limited runs only — they come back only intermittently."}]',

 '[{"name":"Skull and Bones","color":"#2E2018","force":"Full","wrapper":"Nicaragua (Aganorsa)","vitolas":["Daisy Cutter","«?»"],"story":"La serie más seguida de la casa, retomada año tras año con subtítulos distintos. Cada salida es limitada y no se reedita tal cual."},{"name":"Oro y Platino","color":"#8B7355","force":"Medium","wrapper":"Nicaragua (Aganorsa)","vitolas":["Reserva VOR"],"story":"Las dos gamas regulares de origen, las de 2008. Fueron abandonadas en 2012 cuando la casa decidió hacer solo series limitadas: vuelven únicamente de forma intermitente."}]',

 '[{"name":"Skull and Bones","color":"#2E2018","force":"Full","wrapper":"Nicaragua (Aganorsa)","vitolas":["Daisy Cutter","\\"?\\""],"story":"Die meistbeachtete Serie des Hauses, Jahr für Jahr unter wechselnden Untertiteln wieder aufgelegt. Jede Ausgabe ist limitiert und wird nicht unverändert neu aufgelegt."},{"name":"Oro und Platino","color":"#8B7355","force":"Medium","wrapper":"Nicaragua (Aganorsa)","vitolas":["Reserva VOR"],"story":"Die beiden ursprünglichen festen Linien von 2008. Sie wurden 2012 aufgegeben, als das Haus beschloss, nur noch limitierte Serien zu machen — sie kehren nur zeitweise zurück."}]',

 '[{"name":"Skull and Bones","color":"#2E2018","force":"Full","wrapper":"尼加拉瓜（Aganorsa）","vitolas":["Daisy Cutter","「?」"],"story":"这家最受追随的系列，逐年以不同副题重出。每次发行均为限量，且不会原样再版。"},{"name":"Oro 与 Platino","color":"#8B7355","force":"Medium","wrapper":"尼加拉瓜（Aganorsa）","vitolas":["Reserva VOR"],"story":"最初的两条常规线，始于 2008 年。2012 年公司决定只做限量后即被放弃——此后仅偶尔回归。"}]',

 '[{"name":"Skull and Bones","color":"#2E2018","force":"Full","wrapper":"نيكاراغوا (أغانورسا)","vitolas":["Daisy Cutter","«؟»"],"story":"أكثر سلاسل الدار متابعةً، تُستأنف عامًا بعد عام بعناوين فرعية مختلفة. كلّ إصدار محدود ولا يُعاد طرحه كما هو."},{"name":"Oro و Platino","color":"#8B7355","force":"Medium","wrapper":"نيكاراغوا (أغانورسا)","vitolas":["Reserva VOR"],"story":"السلسلتان الثابتتان الأصليّتان، من عام 2008. تُركتا في 2012 حين اختارت الدار الاقتصار على الإصدارات المحدودة — ولا تعودان إلا متقطّعتين."}]'),

-- ── Room101 ──────────────────────────────────────────────
('Room101', 'nicaragua', '2009 — Matt Booth ; STG depuis 2022',
 'Tabacalera A.J. Fernández, Estelí ; aussi Joya de Nicaragua et HATSA (Honduras)',

 'Room101 est née d''un bijoutier. Matt Booth lance sous ce nom une marque de bijoux d''argent en 2003, à Los Angeles, et passe au cigare en 2009 par un accord avec Camacho. C''est l''ordre inverse du parcours habituel : le dessin d''abord, la feuille ensuite — et cela se voit sur les bagues.

Davidoff de Genève distribue la marque de 2009 à 2017. Booth quitte alors le métier et rompt avec le groupe suisse, que cet atlas porte sous le nom d''Oettinger Davidoff.

Scandinavian Tobacco Group rachète Room101 en 2022 et garde Booth comme directeur artistique. En février 2026, le groupe rebat ses cartes : la marque passe du côté de General Cigar pendant que Cohiba USA et Punch Honduras vont chez Forged. Cet atlas porte les deux sociétés, et c''est le même mouvement.

La production est éclatée, et la fiche le dit plutôt que de le taire. L''essentiel sort de la Tabacalera A.J. Fernández, à Estelí ; le Farce Nicaragua vient de la Joya de Nicaragua, le Big Payback de la HATSA, au Honduras. Cette fiche est nicaraguayenne parce que l''atlas classe par le lieu principal — pas parce que tout y est fait.',

 '[{"name":"Johnny Tobacconaut","color":"#6B4226","force":"Medium-Full","wrapper":"Assemblage A.J. Fernández","vitolas":["Robusto","Toro"],"story":"La ligne produite à la Tabacalera A.J. Fernández, à Estelí, et déclinée en version maduro. C''est celle qui porte le catalogue depuis le rachat par Scandinavian Tobacco Group."},{"name":"Farce Nicaragua","color":"#8B4513","force":"Medium","wrapper":"Nicaragua","vitolas":["Robusto"],"story":"Roulée à la Joya de Nicaragua, contrairement au Farce d''origine qui sort d''un autre atelier. Deux cigares, un nom, deux manufactures : c''est le fonctionnement de la maison en résumé."},{"name":"Big Payback","color":"#4A2C1A","force":"Medium","wrapper":"Honduras","vitolas":["70s"],"story":"La ligne hondurienne, produite à la HATSA — l''usine du groupe Scandinavian Tobacco au Honduras, la même que celle du Bolívar Honduras."}]',

 'Room101 was born of a jeweller. Matt Booth launched a silver jewellery brand under that name in 2003, in Los Angeles, and moved into cigars in 2009 through a deal with Camacho. It is the usual path in reverse: the design first, the leaf after — and it shows on the bands.

Davidoff of Geneva distributed the brand from 2009 to 2017. Booth then left the trade and broke with the Swiss group, which this atlas holds as Oettinger Davidoff.

Scandinavian Tobacco Group bought Room101 in 2022 and kept Booth as creative director. In February 2026 the group reshuffled: the brand moved to the General Cigar side while Cohiba USA and Punch Honduras went to Forged. This atlas holds both companies, and it is the same move.

Production is split, and this entry says so rather than hiding it. Most comes out of Tabacalera A.J. Fernández, in Estelí; Farce Nicaragua comes from Joya de Nicaragua, Big Payback from HATSA, in Honduras. This entry is Nicaraguan because the atlas files by the principal place — not because everything is made there.',

 'Room101 nació de un joyero. Matt Booth lanza con ese nombre una marca de joyería de plata en 2003, en Los Ángeles, y pasa al puro en 2009 mediante un acuerdo con Camacho. Es el recorrido habitual al revés: el diseño primero, la hoja después, y se nota en las vitolas.

Davidoff de Ginebra distribuye la marca de 2009 a 2017. Booth deja entonces el oficio y rompe con el grupo suizo, que este atlas recoge como Oettinger Davidoff.

Scandinavian Tobacco Group compra Room101 en 2022 y conserva a Booth como director creativo. En febrero de 2026 el grupo baraja de nuevo: la marca pasa al lado de General Cigar mientras Cohiba USA y Punch Honduras van a Forged. Este atlas recoge ambas sociedades, y es el mismo movimiento.

La producción está repartida, y esta ficha lo dice en vez de callarlo. Lo esencial sale de la Tabacalera A.J. Fernández, en Estelí; el Farce Nicaragua viene de Joya de Nicaragua, el Big Payback de HATSA, en Honduras. Esta ficha es nicaragüense porque el atlas clasifica por el lugar principal, no porque todo se haga allí.',

 'Room101 entstand aus einem Juwelier. Matt Booth brachte 2003 in Los Angeles unter diesem Namen eine Silberschmuckmarke heraus und stieg 2009 über eine Vereinbarung mit Camacho in die Zigarre ein. Es ist der übliche Weg rückwärts: erst der Entwurf, dann das Blatt — und man sieht es den Bauchbinden an.

Davidoff of Geneva vertrieb die Marke von 2009 bis 2017. Booth verließ dann das Fach und brach mit der Schweizer Gruppe, die dieser Atlas als Oettinger Davidoff führt.

Scandinavian Tobacco Group kaufte Room101 im Jahr 2022 und behielt Booth als Creative Director. Im Februar 2026 mischte die Gruppe neu: Die Marke ging zu General Cigar, während Cohiba USA und Punch Honduras zu Forged gingen. Dieser Atlas führt beide Gesellschaften, und es ist derselbe Vorgang.

Die Produktion ist aufgeteilt, und dieser Eintrag sagt es, statt es zu verschweigen. Das meiste kommt aus der Tabacalera A.J. Fernández in Estelí; die Farce Nicaragua stammt von Joya de Nicaragua, die Big Payback von HATSA in Honduras. Dieser Eintrag steht unter Nicaragua, weil der Atlas nach dem Hauptort einordnet — nicht, weil dort alles gemacht würde.',

 'Room101 出自一位珠宝匠之手。Matt Booth 于 2003 年在洛杉矶以此名创办银饰品牌，2009 年经由与 Camacho 的合作进入雪茄行业。这是通常路径的倒转：先有设计，后有烟叶——这一点从它的标环上看得出来。

日内瓦的 Davidoff 于 2009 至 2017 年间代理该品牌。此后 Booth 离开这一行，与这家瑞士集团决裂——本图集以 Oettinger Davidoff 之名收录了它。

Scandinavian Tobacco Group 于 2022 年收购 Room101，并留任 Booth 为创意总监。2026 年 2 月，集团重新洗牌：该品牌划归 General Cigar 一侧，而 Cohiba USA 与 Punch Honduras 转入 Forged。本图集收录了这两家公司，说的正是同一次调整。

生产是分散的，本条目选择说明而非隐去。主体出自埃斯特利的 Tabacalera A.J. Fernández；Farce Nicaragua 来自 Joya de Nicaragua，Big Payback 来自洪都拉斯的 HATSA。本条目归入尼加拉瓜，是因为本图集按主要产地归类，而非因为一切都在那里制作。',

 'وُلدت رووم101 من صائغ. أطلق مات بوث تحت هذا الاسم علامة مجوهرات فضّية عام 2003 في لوس أنجلوس، ثم دخل عالم السيجار عام 2009 باتفاق مع كاماتشو. إنّه المسار المعتاد معكوسًا: التصميم أوّلًا والورق ثانيًا — ويظهر ذلك على الأحزمة.

ووزّعت دافيدوف جنيف العلامة من 2009 إلى 2017. ثم غادر بوث المهنة وقطع صلته بالمجموعة السويسرية التي يضمّها هذا الأطلس باسم أوتينغر دافيدوف.

واشترت Scandinavian Tobacco Group علامة رووم101 عام 2022 وأبقت بوث مديرًا إبداعيًا. وفي فبراير 2026 أعادت المجموعة توزيع الأوراق: انتقلت العلامة إلى جانب جنرال سيغار، بينما ذهبت كوهيبا الأمريكية وبانش هندوراس إلى فورجد. ويضمّ هذا الأطلس الشركتين، وهي الحركة نفسها.

والإنتاج موزّع، وتقول البطاقة ذلك بدل أن تكتمه. فمعظمه يخرج من تاباكاليرا أ. ج. فرنانديز في إستيلي؛ أمّا «فارس نيكاراغوا» فمن خويا دي نيكاراغوا، و«بيغ بايباك» من هاتسا في هندوراس. وهذه البطاقة نيكاراغوية لأنّ الأطلس يصنّف بالمكان الرئيسي، لا لأنّ كلّ شيء يُصنع هناك.',

 '[{"name":"Johnny Tobacconaut","color":"#6B4226","force":"Medium-Full","wrapper":"A.J. Fernández blend","vitolas":["Robusto","Toro"],"story":"The line made at Tabacalera A.J. Fernández in Estelí, also offered in a maduro version. It has carried the catalogue since the Scandinavian Tobacco Group purchase."},{"name":"Farce Nicaragua","color":"#8B4513","force":"Medium","wrapper":"Nicaragua","vitolas":["Robusto"],"story":"Rolled at Joya de Nicaragua, unlike the original Farce, which comes out of another workshop. Two cigars, one name, two factories: the house''s working method in miniature."},{"name":"Big Payback","color":"#4A2C1A","force":"Medium","wrapper":"Honduras","vitolas":["70s"],"story":"The Honduran line, made at HATSA — Scandinavian Tobacco Group''s factory in Honduras, the same one behind Bolívar Honduras."}]',

 '[{"name":"Johnny Tobacconaut","color":"#6B4226","force":"Medium-Full","wrapper":"Ligada A.J. Fernández","vitolas":["Robusto","Toro"],"story":"La línea producida en la Tabacalera A.J. Fernández, en Estelí, y declinada en versión maduro. Es la que sostiene el catálogo desde la compra por Scandinavian Tobacco Group."},{"name":"Farce Nicaragua","color":"#8B4513","force":"Medium","wrapper":"Nicaragua","vitolas":["Robusto"],"story":"Liada en Joya de Nicaragua, a diferencia del Farce de origen, que sale de otro taller. Dos puros, un nombre, dos manufacturas: el funcionamiento de la casa en resumen."},{"name":"Big Payback","color":"#4A2C1A","force":"Medium","wrapper":"Honduras","vitolas":["70s"],"story":"La línea hondureña, producida en HATSA: la fábrica del grupo Scandinavian Tobacco en Honduras, la misma del Bolívar Honduras."}]',

 '[{"name":"Johnny Tobacconaut","color":"#6B4226","force":"Medium-Full","wrapper":"Mischung A.J. Fernández","vitolas":["Robusto","Toro"],"story":"Die Linie aus der Tabacalera A.J. Fernández in Estelí, auch in einer Maduro-Fassung. Sie trägt den Katalog seit dem Kauf durch die Scandinavian Tobacco Group."},{"name":"Farce Nicaragua","color":"#8B4513","force":"Medium","wrapper":"Nicaragua","vitolas":["Robusto"],"story":"Bei Joya de Nicaragua gerollt, anders als die ursprüngliche Farce, die aus einer anderen Werkstatt kommt. Zwei Zigarren, ein Name, zwei Manufakturen: die Arbeitsweise des Hauses im Kleinen."},{"name":"Big Payback","color":"#4A2C1A","force":"Medium","wrapper":"Honduras","vitolas":["70s"],"story":"Die honduranische Linie, bei HATSA gefertigt — der Fabrik der Scandinavian Tobacco Group in Honduras, derselben wie hinter Bolívar Honduras."}]',

 '[{"name":"Johnny Tobacconaut","color":"#6B4226","force":"Medium-Full","wrapper":"A.J. Fernández 配方","vitolas":["Robusto","Toro"],"story":"在埃斯特利 Tabacalera A.J. Fernández 生产的一条线，另有马杜罗版本。自 Scandinavian Tobacco Group 收购以来，它一直是目录的支柱。"},{"name":"Farce Nicaragua","color":"#8B4513","force":"Medium","wrapper":"尼加拉瓜","vitolas":["Robusto"],"story":"在 Joya de Nicaragua 卷制，与出自另一作坊的原版 Farce 不同。两支雪茄，一个名字，两家工厂：这正是这家运作方式的缩影。"},{"name":"Big Payback","color":"#4A2C1A","force":"Medium","wrapper":"洪都拉斯","vitolas":["70s"],"story":"洪都拉斯线，产自 HATSA——Scandinavian Tobacco Group 在洪都拉斯的工厂，也就是 Bolívar Honduras 背后的那一家。"}]',

 '[{"name":"Johnny Tobacconaut","color":"#6B4226","force":"Medium-Full","wrapper":"مزيج أ. ج. فرنانديز","vitolas":["Robusto","Toro"],"story":"الخطّ المنتَج في تاباكاليرا أ. ج. فرنانديز بإستيلي، وله نسخة مادورو. وهو الذي يحمل الكتالوج منذ شراء Scandinavian Tobacco Group للعلامة."},{"name":"Farce Nicaragua","color":"#8B4513","force":"Medium","wrapper":"نيكاراغوا","vitolas":["Robusto"],"story":"يُلَفّ في خويا دي نيكاراغوا، بخلاف «فارس» الأصلي الذي يخرج من ورشة أخرى. سيجاران واسم واحد ومصنعان: خلاصة طريقة عمل الدار."},{"name":"Big Payback","color":"#4A2C1A","force":"Medium","wrapper":"هندوراس","vitolas":["70s"],"story":"الخطّ الهندوراسي، يُصنع في هاتسا — مصنع مجموعة Scandinavian Tobacco في هندوراس، وهو نفسه الذي وراء بوليفار هندوراس."}]'),

-- ── L'Atelier ────────────────────────────────────────────
('L''Atelier', 'nicaragua', '2012 — Pete Johnson ; roulé chez My Father',
 'My Father Cigars, Estelí, Nicaragua',

 'L''Atelier est la seconde maison de Pete Johnson, que cet atlas porte déjà sous le nom de Tatuaje. Il la fonde en 2012 avec Dan Welsh, K.C. Johnson et Sean Johnson, sous le même toit que Tatuaje.

L''intention affichée est inhabituelle et elle est double : faire des cigares premium à un prix que le fumeur peut suivre, et relever ce qu''on attend d''un cigare à chaque niveau de gamme. La maison sort deux marques haut de gamme la première année, L''Atelier et Surrogates, et deux lignes à prix serré.

Tout est roulé chez la famille García, à la My Father Cigars d''Estelí — la manufacture que l''atlas porte sous le nom de My Father, et celle-là même qu''emploie Tatuaje. Deux maisons, un fondateur, un atelier : c''est une des configurations les plus lisibles de la scène boutique, et l''une des rares où le lien est déclaré.

C''est aussi ce qui distingue L''Atelier des autres maisons sans usine. Là où Crowned Heads ou Dunbarton répartissent leur production entre plusieurs manufactures, Johnson n''en emploie qu''une, et c''est celle de sa première marque.',

 '[{"name":"L''Atelier","color":"#8B5A2B","force":"Medium-Full","wrapper":"Roulé chez My Father, Estelí","vitolas":["LAT38","LAT46","LAT54"],"story":"La gamme qui porte le nom de la maison. Les vitoles sont désignées par leur diamètre plutôt que par un nom de forme — une convention que peu de marques suivent."},{"name":"Surrogates","color":"#6B4226","force":"Medium","wrapper":"Roulé chez My Father, Estelí","vitolas":["Skull Breaker","Tramp Stamp","Bone Crusher"],"story":"L''autre marque haut de gamme lancée en 2012, aux noms délibérément brutaux. Même atelier, même famille García, un registre plus direct."}]',

 'L''Atelier is Pete Johnson''s second house; this atlas already holds his first, Tatuaje. He founded it in 2012 with Dan Welsh, K.C. Johnson and Sean Johnson, under the same roof as Tatuaje.

The stated intent is unusual and it is twofold: to make premium cigars at a price the smoker can follow, and to raise what is expected of a cigar at every level of the range. The house released two premium brands in its first year, L''Atelier and Surrogates, along with two keenly priced lines.

Everything is rolled by the García family, at My Father Cigars in Estelí — the factory this atlas holds as My Father, and the very one Tatuaje uses. Two houses, one founder, one workshop: it is one of the clearest configurations on the boutique scene, and one of the few where the link is declared.

That is also what sets L''Atelier apart from the other houses without a factory. Where Crowned Heads or Dunbarton spread their production across several factories, Johnson uses only one, and it is the one behind his first brand.',

 'L''Atelier es la segunda casa de Pete Johnson, que este atlas ya recoge bajo el nombre de Tatuaje. La funda en 2012 con Dan Welsh, K.C. Johnson y Sean Johnson, bajo el mismo techo que Tatuaje.

La intención declarada es inusual y es doble: hacer puros premium a un precio que el fumador pueda seguir, y elevar lo que se espera de un puro en cada nivel de gama. La casa saca dos marcas de gama alta el primer año, L''Atelier y Surrogates, y dos líneas de precio ajustado.

Todo se lía en casa de la familia García, en My Father Cigars de Estelí: la manufactura que el atlas recoge como My Father, y la misma que emplea Tatuaje. Dos casas, un fundador, un taller: es una de las configuraciones más legibles de la escena boutique, y una de las pocas en que el vínculo se declara.

Es también lo que distingue a L''Atelier de las demás casas sin fábrica. Allí donde Crowned Heads o Dunbarton reparten su producción entre varias manufacturas, Johnson emplea una sola, y es la de su primera marca.',

 'L''Atelier ist Pete Johnsons zweites Haus; sein erstes führt dieser Atlas bereits als Tatuaje. Er gründete es 2012 mit Dan Welsh, K.C. Johnson und Sean Johnson, unter demselben Dach wie Tatuaje.

Die erklärte Absicht ist ungewöhnlich und zweifach: Premiumzigarren zu einem Preis zu machen, dem der Raucher folgen kann, und den Anspruch an eine Zigarre auf jeder Preisstufe zu heben. Im ersten Jahr brachte das Haus zwei Premiummarken heraus, L''Atelier und Surrogates, dazu zwei knapp kalkulierte Linien.

Alles wird bei der Familie García gerollt, bei My Father Cigars in Estelí — der Manufaktur, die der Atlas als My Father führt, und genau jener, die auch Tatuaje nutzt. Zwei Häuser, ein Gründer, eine Werkstatt: eine der klarsten Konstellationen der Boutiqueszene, und eine der wenigen, in denen die Verbindung offen genannt wird.

Das unterscheidet L''Atelier auch von den übrigen Häusern ohne eigene Fabrik. Wo Crowned Heads oder Dunbarton ihre Produktion auf mehrere Manufakturen verteilen, nutzt Johnson nur eine — die seiner ersten Marke.',

 'L''Atelier 是 Pete Johnson 的第二家公司，本图集已以 Tatuaje 之名收录了他先前创办的那一家。他于 2012 年与 Dan Welsh、K.C. Johnson 和 Sean Johnson 共同创办，与 Tatuaje 同处一个屋檐之下。

其公开的意图并不寻常，且有两层：以烟客负担得起的价格做高级雪茄，并提升人们对每一价位雪茄的期待。公司第一年推出两个高端品牌 L''Atelier 与 Surrogates，另有两条价格从紧的产品线。

一切均由 García 家族在埃斯特利的 My Father Cigars 卷制——本图集以 My Father 之名收录的那家工厂，也正是 Tatuaje 所用的那家。两家公司、一位创办人、一间作坊：这是精品圈中脉络十分清晰的一种格局，也是少数明白承认这层关系的例子。

这也是 L''Atelier 有别于其他没有自有工厂的公司之处。Crowned Heads 或 Dunbarton 把生产分散到数家工厂，而 Johnson 只用一家——正是他第一个品牌所用的那家。',

 'لاتوليه هي الدار الثانية لبيت جونسون، الذي يضمّ هذا الأطلس داره الأولى باسم تاتواخي. أسّسها عام 2012 مع دان ويلش وكاي سي جونسون وشون جونسون، تحت السقف نفسه مع تاتواخي.

والمقصد المعلَن غير مألوف وهو مزدوج: صنع سيجار فاخر بسعر يستطيع المدخّن مجاراته، ورفع ما يُنتظر من السيجار عند كلّ مستوى سعر. أصدرت الدار علامتين فاخرتين في عامها الأول، لاتوليه وسوروغيتس، وخطّين بسعر مضبوط.

ويُلَفّ كلّ شيء عند عائلة غارسيا في «ماي فاذر سيغارز» بإستيلي — المصنع الذي يضمّه الأطلس باسم ماي فاذر، وهو نفسه الذي تستعمله تاتواخي. داران ومؤسّس واحد وورشة واحدة: من أوضح التشكيلات في مشهد البوتيك، ومن القليلة التي تُعلَن فيها الصلة.

وهذا أيضًا ما يميّز لاتوليه عن سائر الدور التي لا مصنع لها. فحيث توزّع كراونِد هيدز أو دنبارتون إنتاجها على مصانع عدّة، لا يستعمل جونسون سوى واحد، وهو مصنع علامته الأولى.',

 '[{"name":"L''Atelier","color":"#8B5A2B","force":"Medium-Full","wrapper":"Rolled at My Father, Estelí","vitolas":["LAT38","LAT46","LAT54"],"story":"The range that carries the house''s name. Its vitolas are designated by ring gauge rather than by a shape name — a convention few brands follow."},{"name":"Surrogates","color":"#6B4226","force":"Medium","wrapper":"Rolled at My Father, Estelí","vitolas":["Skull Breaker","Tramp Stamp","Bone Crusher"],"story":"The other premium brand launched in 2012, under deliberately brutal names. Same workshop, same García family, a more direct register."}]',

 '[{"name":"L''Atelier","color":"#8B5A2B","force":"Medium-Full","wrapper":"Liado en My Father, Estelí","vitolas":["LAT38","LAT46","LAT54"],"story":"La gama que lleva el nombre de la casa. Sus vitolas se designan por el cepo y no por un nombre de forma: una convención que pocas marcas siguen."},{"name":"Surrogates","color":"#6B4226","force":"Medium","wrapper":"Liado en My Father, Estelí","vitolas":["Skull Breaker","Tramp Stamp","Bone Crusher"],"story":"La otra marca de gama alta lanzada en 2012, con nombres deliberadamente brutales. Mismo taller, misma familia García, un registro más directo."}]',

 '[{"name":"L''Atelier","color":"#8B5A2B","force":"Medium-Full","wrapper":"Bei My Father gerollt, Estelí","vitolas":["LAT38","LAT46","LAT54"],"story":"Die Linie, die den Namen des Hauses trägt. Ihre Vitolas werden nach dem Ringmaß bezeichnet statt nach einem Formnamen — eine Konvention, der wenige Marken folgen."},{"name":"Surrogates","color":"#6B4226","force":"Medium","wrapper":"Bei My Father gerollt, Estelí","vitolas":["Skull Breaker","Tramp Stamp","Bone Crusher"],"story":"Die andere 2012 herausgebrachte Premiummarke, mit bewusst brutalen Namen. Dieselbe Werkstatt, dieselbe Familie García, ein direkteres Register."}]',

 '[{"name":"L''Atelier","color":"#8B5A2B","force":"Medium-Full","wrapper":"于 My Father 卷制，埃斯特利","vitolas":["LAT38","LAT46","LAT54"],"story":"以公司之名命名的一条线。其尺寸以环径而非形制名称标示——这是少有品牌采用的做法。"},{"name":"Surrogates","color":"#6B4226","force":"Medium","wrapper":"于 My Father 卷制，埃斯特利","vitolas":["Skull Breaker","Tramp Stamp","Bone Crusher"],"story":"2012 年推出的另一个高端品牌，名字刻意粗野。同一作坊，同一 García 家族，风格更为直接。"}]',

 '[{"name":"L''Atelier","color":"#8B5A2B","force":"Medium-Full","wrapper":"ملفوف في ماي فاذر، إستيلي","vitolas":["LAT38","LAT46","LAT54"],"story":"السلسلة التي تحمل اسم الدار. وتُسمّى مقاساتها بالقُطر لا باسم الشكل — وهو عُرف قلّ أن تتبعه العلامات."},{"name":"Surrogates","color":"#6B4226","force":"Medium","wrapper":"ملفوف في ماي فاذر، إستيلي","vitolas":["Skull Breaker","Tramp Stamp","Bone Crusher"],"story":"العلامة الفاخرة الأخرى التي أُطلقت عام 2012، بأسماء فظّة عن قصد. الورشة نفسها، وعائلة غارسيا نفسها، بمزاج مباشر."}]'),

-- ── La Aroma de Cuba ─────────────────────────────────────
('La Aroma de Cuba', 'nicaragua', 'Cuba, années 1880 ; relancée par Ashton',
 'My Father Cigars, Estelí, Nicaragua',

 'La Aroma de Cuba est un nom cubain du XIXe siècle qui ne fabrique plus rien à Cuba depuis plus d''un siècle. La marque remonte aux années 1880 ; ses dépôts se perdent après le tournant du siècle, comme ceux de dizaines de maisons cubaines vendues, échangées ou simplement oubliées.

La famille Levin, propriétaire d''Ashton — que cet atlas porte —, en récupère les droits dans les années 1990 et relance la marque au début des années 2000, avec une fabrication hondurienne.

Le tournant est 2009. José « Pepin » García recompose entièrement l''assemblage et la production part chez My Father, à Estelí : cape Connecticut Broadleaf, tripe intégralement nicaraguayenne. C''est cette version qui a fait le succès de la marque, et c''est elle qui justifie sa place au Nicaragua plutôt qu''au Honduras ou à Cuba.

La maison compte par ailleurs Winston Churchill parmi ses premiers fumeurs, à l''époque cubaine. C''est un argument commercial ancien, qu''aucune source indépendante n''établit — le même que celui de Vargas aux Canaries. Cet atlas le rapporte à qui l''affirme et ne le reprend pas à son compte.',

 '[{"name":"La Aroma de Cuba","color":"#4A2C1A","force":"Medium-Full","wrapper":"Connecticut Broadleaf","vitolas":["Robusto","Churchill","Belicoso"],"story":"L''assemblage refait par Pepin García en 2009 : cape Connecticut Broadleaf, tout le reste nicaraguayen. C''est la version qui a installé la marque, et celle que l''on trouve aujourd''hui."},{"name":"Mi Amor","color":"#3A2A20","force":"Full","wrapper":"San Andrés du Mexique","vitolas":["Belicoso","Robusto","Magnifico"],"story":"La déclinaison la plus corsée, sous cape San Andrés mexicaine. Elle a sa propre Reserva, plus dense encore — c''est elle qui a fait de La Aroma de Cuba autre chose qu''une gamme unique."}]',

 'La Aroma de Cuba is a nineteenth-century Cuban name that has made nothing in Cuba for over a century. The brand dates back to the 1880s; its trademarks were lost after the turn of the century, like those of dozens of Cuban houses sold, traded or simply forgotten.

The Levin family, owners of Ashton — which this atlas holds — recovered the rights in the 1990s and relaunched the brand in the early 2000s, with Honduran production.

The turning point is 2009. José "Pepin" García entirely reblended it and production moved to My Father, in Estelí: Connecticut Broadleaf wrapper, wholly Nicaraguan filler. That is the version that made the brand''s success, and it is what justifies its place under Nicaragua rather than Honduras or Cuba.

The house also counts Winston Churchill among its early smokers, in the Cuban period. That is an old sales argument, which no independent source establishes — the same one Vargas makes in the Canaries. This atlas reports it to whoever asserts it, and does not adopt it.',

 'La Aroma de Cuba es un nombre cubano del siglo XIX que no fabrica nada en Cuba desde hace más de un siglo. La marca se remonta a los años 1880; sus registros se pierden pasado el cambio de siglo, como los de decenas de casas cubanas vendidas, cambiadas o simplemente olvidadas.

La familia Levin, propietaria de Ashton — que este atlas recoge —, recupera los derechos en los años noventa y relanza la marca a principios de los dos mil, con fabricación hondureña.

El giro es 2009. José «Pepin» García recompone enteramente la ligada y la producción pasa a My Father, en Estelí: capa Connecticut Broadleaf, tripa íntegramente nicaragüense. Es esa versión la que hizo el éxito de la marca, y la que justifica su lugar en Nicaragua y no en Honduras ni en Cuba.

La casa cuenta además a Winston Churchill entre sus primeros fumadores, en la época cubana. Es un argumento comercial antiguo, que ninguna fuente independiente establece: el mismo que el de Vargas en Canarias. Este atlas lo devuelve a quien lo afirma y no lo hace suyo.',

 'La Aroma de Cuba ist ein kubanischer Name des 19. Jahrhunderts, der seit über hundert Jahren nichts mehr in Kuba fertigt. Die Marke geht auf die 1880er Jahre zurück; ihre Eintragungen gingen nach der Jahrhundertwende verloren, wie die Dutzender kubanischer Häuser, die verkauft, getauscht oder schlicht vergessen wurden.

Die Familie Levin, Eigentümerin von Ashton — das dieser Atlas führt —, holte sich die Rechte in den 1990er Jahren zurück und brachte die Marke Anfang der 2000er Jahre mit honduranischer Fertigung wieder heraus.

Der Wendepunkt ist 2009. José "Pepin" García mischte sie vollständig neu, und die Produktion ging zu My Father in Estelí: Connecticut-Broadleaf-Deckblatt, durchweg nicaraguanische Einlage. Diese Fassung machte den Erfolg der Marke aus, und sie begründet ihren Platz unter Nicaragua statt unter Honduras oder Kuba.

Das Haus zählt überdies Winston Churchill zu seinen frühen Rauchern, in der kubanischen Zeit. Das ist ein altes Verkaufsargument, das keine unabhängige Quelle belegt — dasselbe wie bei Vargas auf den Kanaren. Dieser Atlas gibt es dem zurück, der es behauptet, und macht es sich nicht zu eigen.',

 'La Aroma de Cuba 是一个十九世纪的古巴名字，却已有一个多世纪不在古巴生产任何东西。品牌可上溯至 1880 年代；其注册在世纪之交后散失，与数十家被出售、转手或干脆遗忘的古巴老号一样。

拥有 Ashton（本图集已收录）的 Levin 家族在 1990 年代取回了权利，并于二〇〇〇年代初以洪都拉斯制造重启该品牌。

转折在 2009 年。José「Pepin」García 全面重制配方，生产迁往埃斯特利的 My Father：康涅狄格宽叶茄衣，茄芯全为尼加拉瓜烟叶。正是这一版本成就了品牌，也正是它使其归入尼加拉瓜而非洪都拉斯或古巴。

此外，这家称温斯顿·丘吉尔为其古巴时期的早期烟客之一。这是一个古老的商业说辞，并无独立来源可以证实——与加那利的 Vargas 如出一辙。本图集将它归还给主张者，并不据为己有。',

 'لا أروما دي كوبا اسم كوبي من القرن التاسع عشر لم يعد يصنع شيئًا في كوبا منذ أكثر من قرن. تعود العلامة إلى ثمانينيات القرن التاسع عشر؛ وضاعت تسجيلاتها بعد مطلع القرن، كما ضاعت تسجيلات عشرات الدور الكوبية التي بيعت أو تبودلت أو نُسيت ببساطة.

واستعادت عائلة ليفين، مالكة أشتون — التي يضمّها هذا الأطلس — الحقوق في التسعينيات، وأعادت إطلاق العلامة في مطلع الألفية بتصنيع هندوراسي.

والمنعطف هو عام 2009. أعاد خوسيه «بيبين» غارسيا تركيب المزيج بالكامل، وانتقل الإنتاج إلى «ماي فاذر» في إستيلي: غلاف كونيتيكت برودليف، وحشوة نيكاراغوية خالصة. وهذه النسخة هي التي صنعت نجاح العلامة، وهي التي تبرّر مكانها في نيكاراغوا لا في هندوراس ولا في كوبا.

كما تعدّ الدار ونستون تشرشل بين أوائل مدخّنيها في الحقبة الكوبية. وهي حجّة تجارية قديمة لا تثبتها أيّ مصادر مستقلّة — الحجّة نفسها التي تسوقها فارغاس في الكناري. ويردّ هذا الأطلس القول إلى قائله ولا يتبنّاه.',

 '[{"name":"La Aroma de Cuba","color":"#4A2C1A","force":"Medium-Full","wrapper":"Connecticut Broadleaf","vitolas":["Robusto","Churchill","Belicoso"],"story":"The blend remade by Pepin García in 2009: Connecticut Broadleaf wrapper, everything else Nicaraguan. It is the version that established the brand, and the one found today."},{"name":"Mi Amor","color":"#3A2A20","force":"Full","wrapper":"Mexican San Andrés","vitolas":["Belicoso","Robusto","Magnifico"],"story":"The fuller offshoot, under a Mexican San Andrés wrapper. It has its own Reserva, denser still — it is what made La Aroma de Cuba more than a single range."}]',

 '[{"name":"La Aroma de Cuba","color":"#4A2C1A","force":"Medium-Full","wrapper":"Connecticut Broadleaf","vitolas":["Robusto","Churchill","Belicoso"],"story":"La ligada rehecha por Pepin García en 2009: capa Connecticut Broadleaf, todo lo demás nicaragüense. Es la versión que asentó la marca, y la que se encuentra hoy."},{"name":"Mi Amor","color":"#3A2A20","force":"Full","wrapper":"San Andrés de México","vitolas":["Belicoso","Robusto","Magnifico"],"story":"La declinación más fuerte, bajo capa San Andrés mexicana. Tiene su propia Reserva, aún más densa: es la que hizo de La Aroma de Cuba algo más que una gama única."}]',

 '[{"name":"La Aroma de Cuba","color":"#4A2C1A","force":"Medium-Full","wrapper":"Connecticut Broadleaf","vitolas":["Robusto","Churchill","Belicoso"],"story":"Die 2009 von Pepin García neu gemischte Fassung: Connecticut-Broadleaf-Deckblatt, alles Übrige nicaraguanisch. Sie hat die Marke etabliert, und sie ist es, die man heute findet."},{"name":"Mi Amor","color":"#3A2A20","force":"Full","wrapper":"Mexikanisches San Andrés","vitolas":["Belicoso","Robusto","Magnifico"],"story":"Der kräftigere Ableger unter mexikanischem San-Andrés-Deckblatt. Er hat seine eigene Reserva, noch dichter — er machte aus La Aroma de Cuba mehr als eine einzige Linie."}]',

 '[{"name":"La Aroma de Cuba","color":"#4A2C1A","force":"Medium-Full","wrapper":"康涅狄格宽叶","vitolas":["Robusto","Churchill","Belicoso"],"story":"2009 年由 Pepin García 重制的配方：康涅狄格宽叶茄衣，其余全为尼加拉瓜烟叶。正是这一版本立住了品牌，也是今天所能买到的版本。"},{"name":"Mi Amor","color":"#3A2A20","force":"Full","wrapper":"墨西哥圣安德烈斯","vitolas":["Belicoso","Robusto","Magnifico"],"story":"更浓的一条支线，采用墨西哥圣安德烈斯茄衣。它另有自己的 Reserva，密度更高——正是它让 La Aroma de Cuba 不再只是一条线。"}]',

 '[{"name":"La Aroma de Cuba","color":"#4A2C1A","force":"Medium-Full","wrapper":"كونيتيكت برودليف","vitolas":["Robusto","Churchill","Belicoso"],"story":"المزيج الذي أعاد بيبين غارسيا تركيبه عام 2009: غلاف كونيتيكت برودليف، وكلّ ما عداه نيكاراغوي. هي النسخة التي رسّخت العلامة، وهي المتوافرة اليوم."},{"name":"Mi Amor","color":"#3A2A20","force":"Full","wrapper":"سان أندريس المكسيكي","vitolas":["Belicoso","Robusto","Magnifico"],"story":"الفرع الأقوى، تحت غلاف سان أندريس مكسيكي. وله «ريسيرفا» خاصّة به أشدّ كثافة — وهو ما جعل لا أروما دي كوبا أكثر من سلسلة واحدة."}]');

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
 WHERE b.`name` IN ('Dunbarton Tobacco & Trust','RoMa Craft Tobac','Viaje',
                    'Room101','L''Atelier','La Aroma de Cuba')
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 185','systeme','scene_boutique_premier_lot','marque',0,
   'Six maisons boutique nicaraguayennes ajoutees : Dunbarton Tobacco & Trust (Steve Saka, 2015), RoMa Craft Tobac (Rosales et Martin, 2012), Viaje (Andre Farkas, 2008), Room101 (Matt Booth, 2009), L Atelier (Pete Johnson, 2012) et La Aroma de Cuba (nom cubain des annees 1880, refait par Pepin Garcia en 2009)'),
  (NULL,'migration 185','systeme','cinq_maisons_sans_usine','marque',0,
   'CINQ DE CES SIX MAISONS N ONT PAS D USINE. Elles composent et font rouler ailleurs — chez Joya de Nicaragua, A.J. Fernandez, My Father, Aganorsa — quatre manufactures que l atlas porte deja, comme il porte deja deux maisons sans mur : Crowned Heads et Warped. Le modele n est plus l exception mais la regle de la scene boutique, et il brouille la lecture du drapeau : le cigare qu on tient sort d un atelier dont le nom ne figure nulle part sur la boite. RoMa Craft est l exception, et son histoire dit pourquoi : elle a commence dans le GARAGE de son assembleur Esteban Disla, puis a bati NicaSueno l annee suivante'),
  (NULL,'migration 185','systeme','production_eclatee_ecrite','marque',0,
   'ROOM101 SORT DE TROIS MANUFACTURES : principalement la Tabacalera A.J. Fernandez a Esteli, mais le Farce Nicaragua vient de la Joya de Nicaragua et le Big Payback de la HATSA au Honduras. La fiche est nicaraguayenne parce que l atlas classe par le lieu PRINCIPAL, et elle ecrit l eclatement plutot que de le taire'),
  (NULL,'migration 185','systeme','churchill_refuse_encore','marque',0,
   'WINSTON CHURCHILL, ENCORE. Le materiel commercial de La Aroma de Cuba le compte parmi ses premiers fumeurs a l epoque cubaine — exactement comme celui de Vargas aux Canaries, refuse a la migration 182. La fiche le MENTIONNE en le rendant a qui l affirme et ne le reprend pas a son compte. Les notes de presse sont ecartees de meme : le Viaje Oro Reserva VOR No. 5 porte un score de Cigar Aficionado, ecarte faute de source_url — regle deja appliquee a El Sitio. Et « la seule marque boutique fabriquee exclusivement chez A.J. Fernandez » n est pas repris non plus : c est un rang, pas un fait'),
  (NULL,'migration 185','systeme','lecon_184_appliquee','marque',0,
   'LES SIX `founded` TIENNENT TOUS SOUS 49 CARACTERES. Lecon de la migration 184 : brands.founded est un varchar(50) qui tronque sans rien dire, et coherence_check refuse desormais toute valeur qui tombe pile sur la capacite de sa colonne. Verifie avant ecriture, pas apres');

-- ════════════════════════════════════════════════════════
-- LE TABLEAU `brands` DU NICARAGUA, EN TOUTES LETTRES
-- ════════════════════════════════════════════════════════
UPDATE `producer_countries`
   SET `brands` = '[{"desc":"Référence absolue du Nicaragua premium","name":"Padrón","iconic":true},{"desc":"Pepin Garcia, maître torcedor légendaire","name":"My Father","iconic":true},{"desc":"Serie V mondialement reconnue","name":"Oliva","iconic":true},{"desc":"Liga Privada, révolution moderne","name":"Drew Estate","iconic":true},{"desc":"Plus grand producteur familial","name":"Plasencia","iconic":false},{"desc":"Élégance et puissance fusionnées","name":"Rocky Patel","iconic":false},{"desc":"Maître du Connecticut nicaraguayen","name":"Perdomo","iconic":false},{"desc":"Plus ancienne manufacture du pays","name":"Joya de Nicaragua","iconic":false},{"desc":"Le mélange privé de Jonathan Drew, devenu culte","name":"Liga Privada","iconic":false},{"desc":"Maison suisse de 1888, roulée à Estelí","name":"Villiger","iconic":false},{"desc":"Le rouleur que les autres marques employaient sans le nommer","name":"A.J. Fernandez","iconic":true},{"desc":"D''abord un planteur de Jalapa, ensuite une marque","name":"Aganorsa Leaf","iconic":true},{"desc":"La grammaire cubaine, la matière nicaraguayenne","name":"Tatuaje","iconic":false},{"desc":"Celle qui a rendu le petit format respectable","name":"Illusione","iconic":false},{"desc":"Un cigare ancré dans une culture, pas seulement un terroir","name":"Foundation Cigar Company","iconic":false},{"desc":"Granada plutôt qu''Estelí, et l''atelier ouvert aux visiteurs","name":"Mombacho","iconic":false},{"desc":"Une marque qui s''est offert sa propre manufacture","name":"Espinosa","iconic":true},{"desc":"Pas d''usine : elle choisit son rouleur selon l''assemblage","name":"Crowned Heads","iconic":true},{"desc":"Des noms cubains d''avant 1960, des assemblages d''aujourd''hui","name":"Warped","iconic":false},{"desc":"Maison nicaraguayenne, encore peu documentée ici","name":"Capitol","iconic":false},{"desc":"Repris par la famille García en décembre 2019, après quarante-cinq ans chez Quesada","name":"Fonseca Nicaraguayen","iconic":false},{"name":"Nicoya","desc":"Maison australienne roulée à Estelí — l''Australie ne cultive plus depuis 2006","iconic":false},{"name":"Dunbarton Tobacco & Trust","desc":"Steve Saka, ex-Drew Estate, parti monter sa maison sans usine","iconic":true},{"name":"RoMa Craft Tobac","desc":"Commencée dans un garage, puis son propre atelier à Estelí","iconic":true},{"name":"Viaje","desc":"Plus de gamme régulière depuis 2012 : rien que des séries limitées","iconic":false},{"name":"Room101","desc":"D''un bijoutier au cigare ; trois manufactures, deux pays","iconic":false},{"name":"L''Atelier","desc":"La seconde maison de Pete Johnson, chez My Father comme Tatuaje","iconic":false},{"name":"La Aroma de Cuba","desc":"Nom cubain des années 1880, refait par Pepin García en 2009","iconic":false}]',
       `updated_at` = NOW()
 WHERE `id` = 'nicaragua';

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 185','systeme','processus_fuite_dans_le_texte','marque',0,
   'UN DEFAUT QU AUCUN OUTIL NE POUVAIT VOIR. Deux fiches disaient « des cinq autres de ce lot » (RoMa Craft) et « des autres maisons sans mur de ce lot » (L Atelier). « Ce lot » est le decoupage du FICHIER DE MIGRATION, pas une notion du site : un lecteur de la fiche n a aucun moyen de savoir de quoi il s agit. Le processus de travail avait fui dans le texte publie. Corrige dans les douze colonnes concernees. Trouve en relisant le rendu reel, pas par un controle'),
  (NULL,'migration 185','systeme','guillemets_lus_comme_une_parole','marque',0,
   'marques_check a lu « Green River Sucker One » entre guillemets comme une PAROLE PRETEE. C est un nom de cultivar, pas une citation — mais le controle a raison sur la forme : des guillemets autour d un groupe de mots se lisent comme une parole. Retires dans les six langues plutot qu exceptes. Et i18n_superlatif_check a vu deux rangs que le francais ne porte pas chez L Atelier : quatre superlatifs chinois contre deux, et un « aktar » arabe la ou le francais dit « plus direct », comparatif que le motif francais ne compte pas');
