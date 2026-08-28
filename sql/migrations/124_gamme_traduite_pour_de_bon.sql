-- ════════════════════════════════════════════════════════
-- 124 — Six textes anglais dans des colonnes qui ne le sont pas
-- ────────────────────────────────────────────────────────
-- ── COMMENT ILS SONT SORTIS ─────────────────────────────
--
-- `i18n_langue_check` comptait « was » et « has » comme marqueurs
-- anglais. Or « was » est un mot ALLEMAND et « has » un mot ESPAGNOL.
-- Le compteur les additionnait comme des preuves, ce qui le rendait faux
-- dans les deux sens : il pouvait se déclencher sur de l'allemand
-- impeccable, et il laissait passer du vrai anglais.
--
-- Débarrassé de ces deux collisions, et son seuil ramené de trois à
-- deux, il signale vingt-et-un éléments. Aucun n'était compté ailleurs.
--
-- ── CE QU'ILS SONT ──────────────────────────────────────
--
-- Ce ne sont pas des traductions approximatives : ce sont des TEXTES
-- ANGLAIS où quelques mots ont été remplacés par leur équivalent.
--
--   es : « The original product — café aroma over Java-Sumatra tobacco.
--         […] Notas de flavored café, soft tobacco, light sweetness. »
--   zh : « Habano blend — Nicaraguan shade-grown wrapper over
--         Nicaraguan ligero. 风味： 咖啡 cream, soft 香料, 雪松木. »
--   ar : « المقارنة الطبيعية — high-fermentation beer, slightly bitter
--         and biscuity, accompanies the woody profile of a Punch. »
--
-- Même chaîne de substitution qu'à la migration 095 — mais appliquée
-- ici à une source ANGLAISE, et sans casser de mot. Le détecteur
-- réversible de la 095 ne pouvait donc rien voir : il cherche
-- « civandte » → « civette », et il n'y a ici aucun mot abîmé.
--
-- ── POURQUOI LE SEUIL DE 3 LES LAISSAIT PASSER ──────────
--
-- La fiche Perdomo ne contient que DEUX mots de la liste, `blend` et
-- `wrapper`. Un texte peut être entièrement anglais et n'employer que
-- deux mots-outils : la longueur du texte n'y change rien.
--
-- ── LES SIX ─────────────────────────────────────────────
--
--   Café Crème gamme[0], Carlos Toraño Panama gamme[1],
--   General Cigar gamme[1], Perdomo gamme[1],
--   Romeo y Julieta gamme[3], Punch pairings[0].
--
-- Traduits depuis le FRANÇAIS, qui est correct dans les six cas — et
-- non depuis l'anglais présent dans la colonne, qui n'aurait fait que
-- reconduire la source du défaut.
-- ════════════════════════════════════════════════════════

-- ── Café Crème, gamme[0] ────────────────────────────────
UPDATE `brands` SET
  `gamme_es` = JSON_SET(`gamme_es`, '$[0].story', 'El producto original: aroma de café sobre tabaco de Java y Sumatra. Formato mini (34 x 100 mm), diez minutos. Notas de café aromatizado, tabaco suave y un ligero dulzor. El puro que fumaba su abuelo después del almuerzo del domingo. Intemporal, accesible, universal.'),
  `gamme_de` = JSON_SET(`gamme_de`, '$[0].story', 'Das ursprüngliche Produkt: Kaffeearoma auf Java-Sumatra-Tabak. Mini-Format (34 x 100 mm), zehn Minuten. Noten von aromatisiertem Kaffee, mildem Tabak und einer leichten Süße. Die Zigarre, die Ihr Großvater nach dem Sonntagsessen rauchte. Zeitlos, zugänglich, überall zu Hause.'),
  `gamme_zh` = JSON_SET(`gamme_zh`, '$[0].story', '最初的产品——爪哇与苏门答腊烟叶上的咖啡香。迷你规格（34 x 100 毫米），约十分钟。风味为加香咖啡、柔和烟草，带一丝甜意。这是祖父在周日午饭后点上的那支雪茄：不受时间影响，人人可及。'),
  `gamme_ar` = JSON_SET(`gamme_ar`, '$[0].story', 'المنتج الأصلي: رائحة قهوة على تبغ جاوة وسومطرة. قياس صغير (34 × 100 مم)، نحو عشر دقائق. نكهات قهوة معطّرة وتبغ لطيف مع حلاوة خفيفة. إنها السيجارة التي كان جدّك يدخّنها بعد غداء الأحد — خارج الزمن، وفي متناول الجميع.')
WHERE `name` = 'Café Crème';

-- ── Carlos Toraño Panama, gamme[1] ──────────────────────
UPDATE `brands` SET
  `gamme_es` = JSON_SET(`gamme_es`, '$[1].story', 'Potente, hondureña y nicaragüense, bajo capa oscuro. Notas de café, pimienta y sotobosque oscuro. La gama fuerte, para quien busca la intensidad centroamericana. El formato Toro es el que recomienda la casa.'),
  `gamme_de` = JSON_SET(`gamme_de`, '$[1].story', 'Kräftig, honduranisch und nicaraguanisch, unter einem Oscuro-Deckblatt. Noten von Kaffee, Pfeffer und dunklem Unterholz. Die kräftige Linie, für alle, die zentralamerikanische Intensität suchen. Das Haus empfiehlt das Toro-Format.'),
  `gamme_zh` = JSON_SET(`gamme_zh`, '$[1].story', '厚重的洪都拉斯与尼加拉瓜配方，覆以深色茄衣。风味为咖啡、胡椒与深沉的林下气息。这是追求中美洲力量者的浓味系列，酒庄本身推荐 Toro 规格。'),
  `gamme_ar` = JSON_SET(`gamme_ar`, '$[1].story', 'خلطة قوية من هندوراس ونيكاراغوا، تحت غلافة داكنة. نكهات القهوة والفلفل وأرضية الغابة الداكنة. إنها التشكيلة القوية لمن يبحث عن كثافة أمريكا الوسطى، والدار توصي بقياس التورو.')
WHERE `name` = 'Carlos Toraño Panama';

-- ── General Cigar, gamme[1] ─────────────────────────────
UPDATE `brands` SET
  `gamme_es` = JSON_SET(`gamme_es`, '$[1].story', 'Serie inspirada en los motores V-twin de Harley-Davidson, con formatos bautizados como piezas: V660 Carb, V554 Piston, V770 Engine. Capa de Ecuador sobre tripa nicaragüense y hondureña. Potente, con notas de cuero, café negro y chocolate. Un puro de carretera y de la América profunda.'),
  `gamme_de` = JSON_SET(`gamme_de`, '$[1].story', 'Eine Serie, inspiriert von den V-Twin-Motoren von Harley-Davidson, mit Formaten, die wie Bauteile heißen: V660 Carb, V554 Piston, V770 Engine. Deckblatt aus Ecuador über nicaraguanischer und honduranischer Einlage. Kräftig, mit Noten von Leder, schwarzem Kaffee und Schokolade. Eine Zigarre der Landstraße und des tiefen Amerika.'),
  `gamme_zh` = JSON_SET(`gamme_zh`, '$[1].story', '这一系列取材于哈雷戴维森的 V-twin 发动机，各规格以零件命名：V660 Carb、V554 Piston、V770 Engine。厄瓜多尔茄衣，包裹尼加拉瓜与洪都拉斯茄芯。风格厚重，带皮革、黑咖啡与巧克力的气息——属于公路与美国腹地的一支雪茄。'),
  `gamme_ar` = JSON_SET(`gamme_ar`, '$[1].story', 'سلسلة مستوحاة من محرّكات هارلي ديفيدسون ثنائية الأسطوانة، بقياسات تحمل أسماء قطع المحرّك: V660 Carb وV554 Piston وV770 Engine. غلافة من الإكوادور فوق حشوة نيكاراغوية وهندوراسية. قوية، بنكهات الجلد والقهوة السوداء والشوكولاتة — سيجارة الطريق وأمريكا العميقة.')
WHERE `name` = 'General Cigar';

-- ── Perdomo, gamme[1] ───────────────────────────────────
UPDATE `brands` SET
  `gamme_es` = JSON_SET(`gamme_es`, '$[1].story', 'Ligada Habano: capa nicaragüense cultivada bajo sombra, sobre ligero nicaragüense. Notas de café con crema, especias suaves y madera de cedro. De medio a fuerte, equilibrada. Es la gama de todos los días en Perdomo, accesible sin ceder nada en la construcción.'),
  `gamme_de` = JSON_SET(`gamme_de`, '$[1].story', 'Habano-Mischung: nicaraguanisches Schattendeckblatt über nicaraguanischem Ligero. Noten von Milchkaffee, milden Gewürzen und Zedernholz. Mittelkräftig bis kräftig, ausgewogen. Die Alltagslinie bei Perdomo — zugänglich, ohne bei der Verarbeitung nachzugeben.'),
  `gamme_zh` = JSON_SET(`gamme_zh`, '$[1].story', '哈瓦那种配方：尼加拉瓜遮阴茄衣，包裹尼加拉瓜利加罗。风味为奶咖、柔和香料与雪松木。中至浓，均衡。这是柏度莫的日常系列——价格可亲，做工却不打折扣。'),
  `gamme_ar` = JSON_SET(`gamme_ar`, '$[1].story', 'خلطة هابانو: غلافة نيكاراغوية مزروعة تحت الظل، فوق ليغيرو نيكاراغوي. نكهات قهوة بالحليب وتوابل لطيفة وخشب الأرز. متوسطة إلى قوية، ومتوازنة. إنها تشكيلة كل يوم لدى بيردومو — في المتناول دون أي تنازل في الصناعة.')
WHERE `name` = 'Perdomo';

-- ── Romeo y Julieta, gamme[3] ───────────────────────────
UPDATE `brands` SET
  `gamme_es` = JSON_SET(`gamme_es`, '$[3].story', 'Romeo y Julieta saca cada año ediciones regionales exclusivas para distintos mercados: Alemania, España, Reino Unido, Benelux. Los Cazadores EL (2018, Alemania) y los Short Churchills EL son especialmente buscados. Algunos coleccionistas viajan por Europa solo para conseguir las ediciones regionales locales.'),
  `gamme_de` = JSON_SET(`gamme_de`, '$[3].story', 'Romeo y Julieta bringt jedes Jahr exklusive Regionaleditionen für einzelne Märkte heraus: Deutschland, Spanien, Großbritannien, Benelux. Die Cazadores EL (2018, Deutschland) und die Short Churchills EL sind besonders gesucht. Manche Sammler reisen allein deshalb durch Europa, um die jeweilige Regionaledition vor Ort zu bekommen.'),
  `gamme_zh` = JSON_SET(`gamme_zh`, '$[3].story', '罗密欧与朱丽叶每年为不同市场推出专属的区域版——德国、西班牙、英国、比荷卢。2018 年德国版 Cazadores EL 与 Short Churchills EL 尤其抢手。有些收藏者专程走遍欧洲，只为在当地买到当地的区域版。'),
  `gamme_ar` = JSON_SET(`gamme_ar`, '$[3].story', 'تصدر «روميو إي خولييتا» كل عام إصدارات إقليمية حصرية لأسواق بعينها: ألمانيا وإسبانيا وبريطانيا وبنيلوكس. ويُطلب إصدارا كازادوريس (2018، ألمانيا) وشورت تشرشل بوجه خاص. وبعض الجامعين يتنقّلون في أوروبا لغرض واحد: اقتناء الإصدار الإقليمي من بلده.')
WHERE `name` = 'Romeo y Julieta';

-- ── Punch, pairings[0] ──────────────────────────────────
UPDATE `brands` SET
  `pairings_es` = JSON_SET(`pairings_es`, '$[0].notes', 'El maridaje natural: una cerveza de alta fermentación, ligeramente amarga y con notas de galleta, acompaña a la perfección el perfil amaderado de un Punch. Un maridaje de pub.'),
  `pairings_de` = JSON_SET(`pairings_de`, '$[0].notes', 'Die natürliche Paarung: ein obergäriges Bier, leicht bitter und mit Keksnote, begleitet das holzige Profil einer Punch perfekt. Eine Pub-Kombination.'),
  `pairings_zh` = JSON_SET(`pairings_zh`, '$[0].notes', '最自然的搭配：上层发酵的啤酒，微苦而带饼干气息，与潘趣的木质轮廓相得益彰。这是酒馆里的组合。'),
  `pairings_ar` = JSON_SET(`pairings_ar`, '$[0].notes', 'المزاوجة الطبيعية: بيرة عالية التخمّر، بمرارة خفيفة ولمسة بسكويتية، ترافق تمامًا الطابع الخشبي لسيجارة بانش. مزاوجة على طريقة الحانات.')
WHERE `name` = 'Punch';
