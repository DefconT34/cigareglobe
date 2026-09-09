-- ════════════════════════════════════════════════════════
-- 194 — Black Swan : quatre maisons pour un nom qui n'est
--       à aucune d'elles
-- ────────────────────────────────────────────────────────
-- BLACK SWAN N'EST PAS UNE MAISON, ET N'AURA PAS DE FICHE.
-- Le nom appartient a CIGARPAGE, detaillant americain. C'est une SERIE
-- dont chaque edition est confiee a une manufacture differente et batie
-- sur un lot de tabac particulier trouve chez elle. Quatre editions,
-- quatre maisons, trois pays :
--
--   1  2023          OLIVA             Nicaragua
--   2  janvier 2024  ROCKY PATEL       Honduras
--   3  2025          E.P. CARRILLO     Rep. dominicaine
--   4  2025          JOYA DE NICARAGUA Nicaragua
--
-- LES QUATRE ONT DEJA LEUR FICHE DANS CET ATLAS. C'est ce qui distingue
-- ce cas des exclusivites de detaillants que le recensement met hors
-- perimetre — 5 Vegas, 898 Collection, Morro Castle : celles-la sont des
-- marques de catalogue SANS MAISON DERRIERE. Black Swan en a quatre, et
-- elles sont nommees.
--
-- ── POURQUOI PAS DE FICHE, ET POURQUOI PAS DANS LA `gamme` ──
-- Pas de fiche : une serie de detaillant n'est pas une maison. Meme
-- traitement que Zino (191), Oliveros (186), Chaman, Arsen et Nick's
-- Sticks (193) — le nom est ecrit sur la fiche de qui le fabrique.
--
-- Pas dans `gamme` non plus, et c'est une distinction qui compte : le
-- champ `gamme` porte le CATALOGUE PROPRE d'une maison. Le Black Swan
-- est une COMMANDE, en quantite limitee, vendue par un seul detaillant.
-- L'y ranger dirait que la maison le propose, ce qui est faux. Il va
-- donc en prose, la ou l'atlas ecrit deja qui fait quoi pour qui.
--
-- C'est la difference avec l'Orchant Seleccion de REGIUS (migration
-- 192), qui EST au `gamme` : celui-la est une bague de detaillant sur un
-- cigare que la maison fait par ailleurs sous son propre nom.
--
-- ── LA CONSIGNE « QUI FAIT QUOI » ───────────────────────
-- Chacune des quatre fiches dit ce QU'ELLE a fait, et renvoie aux trois
-- autres. Le lecteur qui arrive par Oliva apprend que Rocky Patel,
-- E.P. Carrillo et Joya de Nicaragua ont fait les autres editions.
--
-- ⚠ ROCKY PATEL EST FICHEE `nicaragua` DANS CET ATLAS, et son Black
-- Swan sort du HONDURAS. Ce n'est pas une contradiction : sa fiche porte
-- deja « Torano International, Danli, Honduras + Esteli, Nicaragua ».
-- Le paragraphe le rappelle, parce qu'un pays de fiche dit ou se fait
-- l'ESSENTIEL de la production, pas ou se fait la totalite.
--
-- ⚠ TRIPE LONGUE, ROULE MAIN — verifie avant ecriture (regle 187).
-- L'edition Joya de Nicaragua est decrite avec des long-fillers de
-- Jalapa et d'Esteli.
--
-- ⚠ CE QUE CES PARAGRAPHES REFUSENT D'ECRIRE. Le detaillant note ses
-- propres cigares et qualifie la serie de rarete extreme. Aucune de ces
-- appreciations n'entre ici : ce sont des arguments de vente, pas des
-- sources. Seuls les faits verifiables sont repris — qui fabrique, ou,
-- avec quoi, et quand.
--
-- Sources : stogiephile.blog « Oliva Black Swan? Rocky Patel Black Swan?
-- WTF? » (avril 2024 — la propriete du nom par CigarPage, le principe de
-- la serie, l'edition Oliva de 2023 au Nicaragua et l'edition Rocky
-- Patel de janvier 2024 au Honduras, avec leurs assemblages),
-- stogiephile.blog « Joya de Nicaragua Black Swan Corona » et « Yet
-- Another Black Swan? » (septembre 2025), cigarpage.com « Joya de
-- Nicaragua Black Swan » (quatrieme edition, cape criollo d'Equateur de
-- semence cubaine, sous-cape habano nicaraguayenne, tripe longue de
-- Jalapa et d'Esteli, corona 6 x 46 ; et la mention des trois editions
-- precedentes par Oliva, Rocky Patel et EP Carrillo).
--
-- Apres cette migration :
--   php tools/contenu_dump.php
--   php tools/i18n_dump.php > sql/traductions.sql
-- ════════════════════════════════════════════════════════

-- ── Joya de Nicaragua — la quatrième édition, et le récit
--    complet de la série
-- ════════════════════════════════════════════════════════
UPDATE `brands` SET
  `history` = CONCAT(`history`, '\n\nEn 2025, la maison a roulé un Black Swan. Le nom n''est pas le sien : Black Swan appartient à CigarPage, un détaillant américain, qui en a fait une série dont chaque édition est confiée à une manufacture différente et bâtie sur un lot de tabac particulier trouvé chez elle. Quatre éditions, quatre maisons, trois pays — Oliva au Nicaragua en 2023, Rocky Patel au Honduras en janvier 2024, E.P. Carrillo en République dominicaine, et celle-ci. Les quatre ont leur fiche dans cet atlas.\n\nCelle de Joya de Nicaragua porte une cape criollo d''Équateur de semence cubaine sur une sous-cape habano nicaraguayenne et une tripe longue de Jalapa et d''Estelí. Elle n''entre pas dans la gamme de la maison : c''est une commande, en quantité limitée, vendue par un seul détaillant. L''atlas l''écrit ici parce que la main qui roule compte autant que le nom sur la bague, et qu''ici les deux ne sont pas de la même maison.'),
  `history_en` = CONCAT(`history_en`, '\n\nIn 2025 the house rolled a Black Swan. The name is not its own: Black Swan belongs to CigarPage, an American retailer, which made of it a series whose every edition is entrusted to a different factory and built on a particular lot of tobacco found there. Four editions, four houses, three countries — Oliva in Nicaragua in 2023, Rocky Patel in Honduras in January 2024, E.P. Carrillo in the Dominican Republic, and this one. All four have their entry in this atlas.\n\nJoya de Nicaragua''s carries an Ecuadorian Criollo wrapper of Cuban seed over a Nicaraguan Habano binder and long filler from Jalapa and Estelí. It does not belong to the house''s range: it is a commission, in limited quantity, sold by a single retailer. The atlas writes it here because the hand that rolls counts as much as the name on the band, and here the two are not the same house.'),
  `history_es` = CONCAT(`history_es`, '\n\nEn 2025 la casa lió un Black Swan. El nombre no es suyo: Black Swan pertenece a CigarPage, un minorista estadounidense, que hizo de él una serie cuya cada edición se confía a una manufactura distinta y se construye sobre un lote de tabaco particular hallado en ella. Cuatro ediciones, cuatro casas, tres países: Oliva en Nicaragua en 2023, Rocky Patel en Honduras en enero de 2024, E.P. Carrillo en la República Dominicana, y esta. Las cuatro tienen su ficha en este atlas.\n\nLa de Joya de Nicaragua lleva una capa criollo de Ecuador de semilla cubana sobre un capote habano nicaragüense y tripa larga de Jalapa y Estelí. No entra en la gama de la casa: es un encargo, en cantidad limitada, vendido por un solo minorista. El atlas lo escribe aquí porque la mano que lía cuenta tanto como el nombre de la vitola, y aquí ambos no son de la misma casa.'),
  `history_de` = CONCAT(`history_de`, '\n\n2025 rollte das Haus eine Black Swan. Der Name gehört ihm nicht: Black Swan gehört CigarPage, einem amerikanischen Händler, der daraus eine Serie machte, deren jede Ausgabe einer anderen Fabrik anvertraut und auf eine dort gefundene besondere Tabakpartie gebaut wird. Vier Ausgaben, vier Häuser, drei Länder — Oliva in Nicaragua 2023, Rocky Patel in Honduras im Januar 2024, E.P. Carrillo in der Dominikanischen Republik, und diese. Alle vier haben in diesem Atlas ihren Eintrag.\n\nDie von Joya de Nicaragua trägt ein ecuadorianisches Criollo-Deckblatt kubanischer Saat über einem nicaraguanischen Habano-Umblatt und Langeinlage aus Jalapa und Estelí. Sie gehört nicht zur Linie des Hauses: Sie ist ein Auftrag, in begrenzter Menge, von einem einzigen Händler verkauft. Der Atlas schreibt es hier, weil die rollende Hand ebenso zählt wie der Name auf dem Ring — und hier sind beide nicht dasselbe Haus.'),
  `history_zh` = CONCAT(`history_zh`, '\n\n2025 年，这家卷制了一支 Black Swan。这个名字不属于它：Black Swan 归美国零售商 CigarPage 所有，后者把它做成一个系列，每一版都交给不同的工厂，并建立在该厂找到的某一批特定烟叶之上。四版、四家公司、三个国家——2023 年 Oliva 在尼加拉瓜，2024 年 1 月 Rocky Patel 在洪都拉斯，E.P. Carrillo 在多米尼加共和国，以及这一版。四家在本图集中都有条目。\n\nJoya de Nicaragua 这一版用古巴种的厄瓜多尔 Criollo 茄衣，配尼加拉瓜 Habano 茄套，芯叶为来自 Jalapa 与埃斯特利的长芯。它不属于这家的常规产品线：这是一份订制，数量有限，只由一家零售商销售。本图集把它写在这里，是因为卷制的手与茄标上的名字同样重要——而在这里，两者并非同一家。'),
  `history_ar` = CONCAT(`history_ar`, '\n\nفي عام 2025 لفّت الدار سيجار «بلاك سوان». والاسم ليس اسمها: فـ«بلاك سوان» ملك لـ«سيغار بيدج»، وهو بائع تجزئة أمريكيّ، جعل منه سلسلة تُسنَد كلّ طبعة فيها إلى مصنع مختلف، وتُبنى على دفعة تبغ خاصّة وُجدت عنده. أربع طبعات، وأربع دور، وثلاثة بلدان — «أوليفا» في نيكاراغوا عام 2023، و«روكي باتيل» في هندوراس في يناير 2024، و«إي. بي. كاريّو» في الجمهورية الدومينيكية، وهذه. وللأربع بطاقاتها في هذا الأطلس.\n\nأمّا طبعة «خويا دي نيكاراغوا» فتحمل غلاف كريّو إكوادوريًّا من بذرة كوبية، فوق رابط هابانو نيكاراغويّ وحشوة طويلة من خالابا وإستيلي. وهي لا تدخل في سلسلة الدار: إنّها طلبيّة، بكمّية محدودة، يبيعها بائع واحد. ويكتبها الأطلس هنا لأنّ اليد التي تلفّ تزن ما يزنه الاسم على الحلقة، والاثنان هنا ليسا من دارٍ واحدة.'),
  `updated_at` = NOW()
 WHERE `name` = 'Joya de Nicaragua';

-- ── Oliva — la première édition, 2023 ────────────────────
UPDATE `brands` SET
  `history` = CONCAT(`history`, '\n\nEn 2023, Oliva a ouvert la série Black Swan. Le nom appartient au détaillant américain CigarPage, non à elle : chaque édition de cette série est confiée à une manufacture différente et bâtie sur un lot de tabac particulier trouvé chez elle. L''édition Oliva est roulée au Nicaragua, sous cape Connecticut Broadleaf, sur sous-cape équatorienne et tripe nicaraguayenne. Rocky Patel, E.P. Carrillo et Joya de Nicaragua ont fait les trois suivantes — toutes trois dans cet atlas.'),
  `history_en` = CONCAT(`history_en`, '\n\nIn 2023 Oliva opened the Black Swan series. The name belongs to the American retailer CigarPage, not to the house: every edition of the series is entrusted to a different factory and built on a particular lot of tobacco found there. The Oliva edition is rolled in Nicaragua, under a Connecticut Broadleaf wrapper, over an Ecuadorian binder and Nicaraguan filler. Rocky Patel, E.P. Carrillo and Joya de Nicaragua made the three that followed — all three in this atlas.'),
  `history_es` = CONCAT(`history_es`, '\n\nEn 2023 Oliva abrió la serie Black Swan. El nombre pertenece al minorista estadounidense CigarPage, no a la casa: cada edición de la serie se confía a una manufactura distinta y se construye sobre un lote de tabaco particular hallado en ella. La edición Oliva se lía en Nicaragua, bajo capa Connecticut Broadleaf, sobre capote ecuatoriano y tripa nicaragüense. Rocky Patel, E.P. Carrillo y Joya de Nicaragua hicieron las tres siguientes, las tres en este atlas.'),
  `history_de` = CONCAT(`history_de`, '\n\n2023 eröffnete Oliva die Serie Black Swan. Der Name gehört dem amerikanischen Händler CigarPage, nicht dem Haus: Jede Ausgabe der Serie wird einer anderen Fabrik anvertraut und auf eine dort gefundene besondere Tabakpartie gebaut. Die Oliva-Ausgabe wird in Nicaragua gerollt, unter einem Connecticut-Broadleaf-Deckblatt, über ecuadorianischem Umblatt und nicaraguanischer Einlage. Rocky Patel, E.P. Carrillo und Joya de Nicaragua machten die drei folgenden — alle drei in diesem Atlas.'),
  `history_zh` = CONCAT(`history_zh`, '\n\n2023 年，Oliva 开启了 Black Swan 系列。这个名字属于美国零售商 CigarPage，而不属于这家公司：该系列的每一版都交给不同的工厂，并建立在该厂找到的某一批特定烟叶之上。Oliva 这一版在尼加拉瓜卷制，用 Connecticut Broadleaf 茄衣，配厄瓜多尔茄套与尼加拉瓜芯叶。随后的三版分别由 Rocky Patel、E.P. Carrillo 与 Joya de Nicaragua 制作——三家在本图集中都有条目。'),
  `history_ar` = CONCAT(`history_ar`, '\n\nفي عام 2023 افتتحت «أوليفا» سلسلة «بلاك سوان». والاسم ملك لبائع التجزئة الأمريكيّ «سيغار بيدج» لا للدار: فكلّ طبعة من السلسلة تُسنَد إلى مصنع مختلف، وتُبنى على دفعة تبغ خاصّة وُجدت عنده. وتُلَفّ طبعة «أوليفا» في نيكاراغوا، تحت غلاف كونيتيكت برودليف، فوق رابط إكوادوريّ وحشوة نيكاراغوية. أمّا الطبعات الثلاث التالية فصنعتها «روكي باتيل» و«إي. بي. كاريّو» و«خويا دي نيكاراغوا» — وثلاثتها في هذا الأطلس.'),
  `updated_at` = NOW()
 WHERE `name` = 'Oliva';

-- ── Rocky Patel — la deuxième édition, janvier 2024 ──────
UPDATE `brands` SET
  `history` = CONCAT(`history`, '\n\nEn janvier 2024, la maison a roulé la deuxième édition du Black Swan, une série qui appartient au détaillant américain CigarPage et dont chaque livraison est confiée à une manufacture différente. Celle-ci sort du Honduras — cape corojo, sous-cape hondurienne, tripe hondurienne et nicaraguayenne. Cela rappelle ce que le champ des fabriques de cette fiche dit déjà : le pays d''une fiche désigne l''essentiel de la production, pas sa totalité. Oliva avait ouvert la série en 2023 ; E.P. Carrillo et Joya de Nicaragua l''ont suivie.'),
  `history_en` = CONCAT(`history_en`, '\n\nIn January 2024 the house rolled the second edition of Black Swan, a series belonging to the American retailer CigarPage, each instalment of which is entrusted to a different factory. This one comes out of Honduras — Corojo wrapper, Honduran binder, Honduran and Nicaraguan filler. It is a reminder of what this entry''s factory field already says: an entry''s country designates the bulk of the production, not all of it. Oliva opened the series in 2023; E.P. Carrillo and Joya de Nicaragua followed.'),
  `history_es` = CONCAT(`history_es`, '\n\nEn enero de 2024 la casa lió la segunda edición del Black Swan, una serie que pertenece al minorista estadounidense CigarPage y cuya cada entrega se confía a una manufactura distinta. Esta sale de Honduras: capa corojo, capote hondureño, tripa hondureña y nicaragüense. Recuerda lo que el campo de fábricas de esta ficha ya dice: el país de una ficha designa lo esencial de la producción, no su totalidad. Oliva abrió la serie en 2023; E.P. Carrillo y Joya de Nicaragua la siguieron.'),
  `history_de` = CONCAT(`history_de`, '\n\nIm Januar 2024 rollte das Haus die zweite Ausgabe der Black Swan, einer Serie, die dem amerikanischen Händler CigarPage gehört und deren jede Lieferung einer anderen Fabrik anvertraut wird. Diese kommt aus Honduras — Corojo-Deckblatt, honduranisches Umblatt, honduranische und nicaraguanische Einlage. Das erinnert an das, was das Fabrikfeld dieses Eintrags bereits sagt: Das Land eines Eintrags bezeichnet den Hauptteil der Fertigung, nicht ihre Gesamtheit. Oliva eröffnete die Serie 2023; E.P. Carrillo und Joya de Nicaragua folgten.'),
  `history_zh` = CONCAT(`history_zh`, '\n\n2024 年 1 月，这家卷制了 Black Swan 的第二版。这个系列归美国零售商 CigarPage 所有，每一批都交给不同的工厂。这一版出自洪都拉斯——Corojo 茄衣，洪都拉斯茄套，洪都拉斯与尼加拉瓜芯叶。它提醒了本条目工厂一栏早已写明的事：一条条目的国别指的是产量的主体，而非全部。Oliva 于 2023 年开启这个系列；E.P. Carrillo 与 Joya de Nicaragua 随后跟上。'),
  `history_ar` = CONCAT(`history_ar`, '\n\nفي يناير 2024 لفّت الدار الطبعة الثانية من «بلاك سوان»، وهي سلسلة تملكها شركة «سيغار بيدج» الأمريكية للتجزئة، وتُسنَد كلّ دفعة منها إلى مصنع مختلف. وهذه الطبعة تخرج من هندوراس — غلاف كوروخو، ورابط هندوراسيّ، وحشوة هندوراسية ونيكاراغوية. وفي ذلك تذكير بما يقوله حقل المصانع في هذه البطاقة أصلًا: بلد البطاقة يدلّ على معظم الإنتاج لا على كلّه. وقد افتتحت «أوليفا» السلسلة عام 2023، وتبعتها «إي. بي. كاريّو» و«خويا دي نيكاراغوا».'),
  `updated_at` = NOW()
 WHERE `name` = 'Rocky Patel';

-- ── E.P. Carrillo — la troisième édition ─────────────────
UPDATE `brands` SET
  `history` = CONCAT(`history`, '\n\nLa maison a roulé la troisième édition du Black Swan, série qui appartient au détaillant américain CigarPage et dont chaque édition est confiée à une manufacture différente. C''est de République dominicaine que sort celle-ci, quand les trois autres viennent du Nicaragua et du Honduras. Oliva et Rocky Patel l''ont précédée, Joya de Nicaragua l''a suivie. Le nom n''appartient à aucune des quatre maisons : c''est une commande, pas une marque de la maison.'),
  `history_en` = CONCAT(`history_en`, '\n\nThe house rolled the third edition of Black Swan, a series belonging to the American retailer CigarPage, each edition of which is entrusted to a different factory. This one comes out of the Dominican Republic, where the other three come from Nicaragua and Honduras. Oliva and Rocky Patel preceded it, Joya de Nicaragua followed. The name belongs to none of the four houses: it is a commission, not a brand of the house.'),
  `history_es` = CONCAT(`history_es`, '\n\nLa casa lió la tercera edición del Black Swan, serie que pertenece al minorista estadounidense CigarPage y cuya cada edición se confía a una manufactura distinta. Esta sale de la República Dominicana, mientras que las otras tres vienen de Nicaragua y de Honduras. Oliva y Rocky Patel la precedieron, Joya de Nicaragua la siguió. El nombre no pertenece a ninguna de las cuatro casas: es un encargo, no una marca de la casa.'),
  `history_de` = CONCAT(`history_de`, '\n\nDas Haus rollte die dritte Ausgabe der Black Swan, einer Serie, die dem amerikanischen Händler CigarPage gehört und deren jede Ausgabe einer anderen Fabrik anvertraut wird. Diese kommt aus der Dominikanischen Republik, während die drei anderen aus Nicaragua und Honduras stammen. Oliva und Rocky Patel gingen ihr voraus, Joya de Nicaragua folgte. Der Name gehört keinem der vier Häuser: Er ist ein Auftrag, keine Marke des Hauses.'),
  `history_zh` = CONCAT(`history_zh`, '\n\n这家卷制了 Black Swan 的第三版。这个系列归美国零售商 CigarPage 所有，每一版都交给不同的工厂。这一版出自多米尼加共和国，而另外三版来自尼加拉瓜与洪都拉斯。Oliva 与 Rocky Patel 在它之前，Joya de Nicaragua 在它之后。这个名字不属于四家中的任何一家：它是一份订制，不是这家自己的品牌。'),
  `history_ar` = CONCAT(`history_ar`, '\n\nلفّت الدار الطبعة الثالثة من «بلاك سوان»، وهي سلسلة تملكها شركة «سيغار بيدج» الأمريكية للتجزئة، وتُسنَد كلّ طبعة منها إلى مصنع مختلف. وتخرج هذه الطبعة من الجمهورية الدومينيكية، بينما تأتي الثلاث الأخرى من نيكاراغوا وهندوراس. سبقتها «أوليفا» و«روكي باتيل»، وتبعتها «خويا دي نيكاراغوا». والاسم لا يخصّ أيًّا من الدور الأربع: إنّه طلبيّة، لا علامة للدار.'),
  `updated_at` = NOW()
 WHERE `name` = 'E.P. Carrillo';

-- ── Un CONCAT qui rate sa cible ne dit rien et sort sans
--    erreur. Les vingt-quatre lignes doivent valoir 1.
-- ════════════════════════════════════════════════════════
SELECT 'Joya de Nicaragua' AS marque, 'fr' AS lang, `history`    LIKE '%Black Swan%' AS ok FROM `brands` WHERE `name`='Joya de Nicaragua'
UNION ALL SELECT 'Joya de Nicaragua','en', `history_en` LIKE '%Black Swan%' FROM `brands` WHERE `name`='Joya de Nicaragua'
UNION ALL SELECT 'Joya de Nicaragua','es', `history_es` LIKE '%Black Swan%' FROM `brands` WHERE `name`='Joya de Nicaragua'
UNION ALL SELECT 'Joya de Nicaragua','de', `history_de` LIKE '%Black Swan%' FROM `brands` WHERE `name`='Joya de Nicaragua'
UNION ALL SELECT 'Joya de Nicaragua','zh', `history_zh` LIKE '%Black Swan%' FROM `brands` WHERE `name`='Joya de Nicaragua'
UNION ALL SELECT 'Joya de Nicaragua','ar', `history_ar` LIKE '%بلاك سوان%'  FROM `brands` WHERE `name`='Joya de Nicaragua'
UNION ALL SELECT 'Oliva','fr', `history`    LIKE '%Black Swan%' FROM `brands` WHERE `name`='Oliva'
UNION ALL SELECT 'Oliva','en', `history_en` LIKE '%Black Swan%' FROM `brands` WHERE `name`='Oliva'
UNION ALL SELECT 'Oliva','es', `history_es` LIKE '%Black Swan%' FROM `brands` WHERE `name`='Oliva'
UNION ALL SELECT 'Oliva','de', `history_de` LIKE '%Black Swan%' FROM `brands` WHERE `name`='Oliva'
UNION ALL SELECT 'Oliva','zh', `history_zh` LIKE '%Black Swan%' FROM `brands` WHERE `name`='Oliva'
UNION ALL SELECT 'Oliva','ar', `history_ar` LIKE '%بلاك سوان%'  FROM `brands` WHERE `name`='Oliva'
UNION ALL SELECT 'Rocky Patel','fr', `history`    LIKE '%Black Swan%' FROM `brands` WHERE `name`='Rocky Patel'
UNION ALL SELECT 'Rocky Patel','en', `history_en` LIKE '%Black Swan%' FROM `brands` WHERE `name`='Rocky Patel'
UNION ALL SELECT 'Rocky Patel','es', `history_es` LIKE '%Black Swan%' FROM `brands` WHERE `name`='Rocky Patel'
UNION ALL SELECT 'Rocky Patel','de', `history_de` LIKE '%Black Swan%' FROM `brands` WHERE `name`='Rocky Patel'
UNION ALL SELECT 'Rocky Patel','zh', `history_zh` LIKE '%Black Swan%' FROM `brands` WHERE `name`='Rocky Patel'
UNION ALL SELECT 'Rocky Patel','ar', `history_ar` LIKE '%بلاك سوان%'  FROM `brands` WHERE `name`='Rocky Patel'
UNION ALL SELECT 'E.P. Carrillo','fr', `history`    LIKE '%Black Swan%' FROM `brands` WHERE `name`='E.P. Carrillo'
UNION ALL SELECT 'E.P. Carrillo','en', `history_en` LIKE '%Black Swan%' FROM `brands` WHERE `name`='E.P. Carrillo'
UNION ALL SELECT 'E.P. Carrillo','es', `history_es` LIKE '%Black Swan%' FROM `brands` WHERE `name`='E.P. Carrillo'
UNION ALL SELECT 'E.P. Carrillo','de', `history_de` LIKE '%Black Swan%' FROM `brands` WHERE `name`='E.P. Carrillo'
UNION ALL SELECT 'E.P. Carrillo','zh', `history_zh` LIKE '%Black Swan%' FROM `brands` WHERE `name`='E.P. Carrillo'
UNION ALL SELECT 'E.P. Carrillo','ar', `history_ar` LIKE '%بلاك سوان%'  FROM `brands` WHERE `name`='E.P. Carrillo';

-- ── Les sceaux, calculés depuis les colonnes ─────────────
INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'brands', b.`name`, 'history', l.lang, SHA1(b.`history`), 'machine', NOW()
  FROM `brands` b
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE b.`name` IN ('Joya de Nicaragua','Oliva','Rocky Patel','E.P. Carrillo')
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 194','systeme','black_swan_documente_sans_fiche','marque',0,
   'BLACK SWAN N EST PAS UNE MAISON : le nom appartient a CIGARPAGE, detaillant americain, qui en a fait une SERIE dont chaque edition est confiee a une manufacture differente et batie sur un lot de tabac particulier trouve chez elle. Quatre editions, quatre maisons, trois pays : OLIVA au Nicaragua en 2023, ROCKY PATEL au Honduras en janvier 2024, E.P. CARRILLO en Republique dominicaine, JOYA DE NICARAGUA en 2025. Les quatre ont deja leur fiche ici, et chacune dit desormais ce QU ELLE a fait et renvoie aux trois autres'),
  (NULL,'migration 194','systeme','pourquoi_pas_de_fiche_ni_de_gamme','marque',0,
   'PAS DE FICHE : une serie de detaillant n est pas une maison — meme traitement que Zino (191), Oliveros (186), Chaman, Arsen et Nick s Sticks (193). PAS DANS LE CHAMP `gamme` NON PLUS, et la distinction compte : `gamme` porte le CATALOGUE PROPRE d une maison, or le Black Swan est une COMMANDE en quantite limitee vendue par un seul detaillant ; l y ranger dirait que la maison le propose, ce qui est faux. C est la difference avec l ORCHANT SELECCION de Regius (192), qui EST au `gamme` parce que c est une bague de detaillant sur un cigare que la maison fait par ailleurs sous son propre nom'),
  (NULL,'migration 194','systeme','distinction_avec_les_exclusivites_hors_perimetre','marque',0,
   'docs/maisons-absentes.md met hors perimetre les EXCLUSIVITES DE DETAILLANTS — 5 Vegas, 898 Collection, East Coast Rollers, Morro Castle, San Miguel — en les qualifiant de « marques de catalogue SANS MAISON DERRIERE ». Black Swan n entre pas dans cette categorie : elle a quatre maisons derriere elle, toutes nommees et toutes fichees ici. Le critere d exclusion n est donc pas « exclusivite de detaillant » mais « fabricant inconnu ou tu »'),
  (NULL,'migration 194','systeme','rocky_patel_nicaragua_mais_black_swan_hondurien','marque',0,
   'ROCKY PATEL est fichee `nicaragua` et son Black Swan sort du HONDURAS. Ce n est pas une contradiction : sa fiche porte deja « Torano International, Danli, Honduras + Esteli, Nicaragua » dans son champ `factory`. Le paragraphe le rappelle explicitement, parce qu un pays de fiche designe l ESSENTIEL de la production, pas sa totalite'),
  (NULL,'migration 194','systeme','ce_que_ces_paragraphes_refusent_d_ecrire','marque',0,
   'Le detaillant NOTE SES PROPRES CIGARES (« 5/5 ») et qualifie la serie de rarete extreme. Aucune de ces appreciations n entre ici : ce sont des arguments de vente, pas des sources — meme regle que pour les scores de presse sans source_url. Seuls les faits verifiables sont repris : qui fabrique, ou, avec quoi, et quand. TRIPE LONGUE ET ROULE MAIN verifies avant ecriture (regle 187) : l edition Joya de Nicaragua est decrite avec des long-fillers de Jalapa et d Esteli');
