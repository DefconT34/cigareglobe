-- ════════════════════════════════════════════════════════
-- 088 — Les rangs mondiaux que le français portait aussi
-- ────────────────────────────────────────────────────────
-- Le balayage des rangs mondiaux, étendu aux six langues à la migration
-- 087, en a levé treize. Le tri donne :
--
--   QUATRE présents AUSSI en français, que le motif français ratait :
--
--     Atabey       « le cigare le plus cher jamais lancé par
--                    l'industrie cubaine »
--     Matilde      « la plus grande manufacture de cigares premium
--                    du monde »
--     Montecristo Dominicain — la même, mot pour mot
--     Partagás     « le plus fin jamais produit à Cuba »
--     La Flor Dom. « le plus grand cigare de série au monde »
--     Romeo y J.   « Le thé le plus floral du monde rencontre le
--                    cigare le plus floral de Cuba »
--
-- Le motif exigeait « du monde » COLLÉ à l'adjectif — « le plus X du
-- monde ». Il suffisait d'un complément entre les deux, « la plus grande
-- MANUFACTURE DE CIGARES PREMIUM du monde », pour passer. Et « le plus
-- cher JAMAIS lancé » ne dit pas « monde » du tout.
--
-- Celui de Romeo y Julieta est de ma main : la migration 072 a recopié
-- « le thé le plus floral du monde » du texte existant sans le corriger,
-- en traitant l'anglicisme et pas le superlatif. Corriger une chose dans
-- une phrase ne garantit pas d'avoir lu le reste.
--
-- ── UN FAUX POSITIF ASSUMÉ ──────────────────────────────
--
-- Guantanamera : « sans doute la mélodie cubaine la plus connue au
-- monde ». C'est une chanson, pas un cigare ; le « sans doute » la donne
-- pour ce qu'elle est ; et le nom de la marque VIENT de là. L'exception
-- est nommée dans `marques_check`.
--
-- ── ET DE L'ANGLAIS QUE LE DÉTECTEUR NE VOYAIT PAS ──────
--
-- Trois entrées espagnoles sont restées en anglais, dont deux en
-- hybride : « Nombrada por the ocean liner sunk in 1915 », « Notes that
-- evolve through five distinct phases: fresh herbs, especias, café ».
--
-- `i18n_langue_check` annonce pourtant zéro. Son seuil est de TROIS mots
-- outils anglais par texte : une entrée courte en passe sous. Le compte
-- « 0 » était exact et incomplet — encore un contrôle qui mesure ce
-- qu'on lui a demandé et pas ce qu'on voulait savoir.
-- ════════════════════════════════════════════════════════

-- ── Français ────────────────────────────────────────────
UPDATE `brands` SET `history` = REPLACE(`history`,
  'le cigare le plus cher jamais lancé par l''industrie cubaine',
  'le cigare dont le prix a marqué une rupture pour l''industrie cubaine')
WHERE `name` = 'Atabey';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'la plus grande manufacture de cigares premium du monde, à La Romana',
  'la manufacture de La Romana, l''une des plus grandes du secteur')
WHERE `name` = 'Matilde';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'dans la plus grande manufacture de cigares premium du monde',
  'dans la manufacture de La Romana, l''une des plus grandes du secteur')
WHERE `name` = 'Montecristo Dominicain';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[2].story',
  'Commercialisée en boîtes de 25 cigares rangés 8-9-8 — d''où le nom. Format Panetela (33 x 170mm), l''un des plus fins du catalogue cubain. Légèreté apparente trompeuse : la finesse du calibre concentre les arômes au lieu de les diluer.')
WHERE `name` = 'Partagás';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'Format Chisel (75 x 184mm) — un des plus grands cigares de série qui soient. Trois heures de fumée au minimum. Notes qui évoluent en cinq phases distinctes : herbes fraîches, épices, café, chocolat, finale poivrée.')
WHERE `name` = 'La Flor Dominicana';

UPDATE `brands` SET `pairings` = JSON_SET(`pairings`, '$[2].notes',
  'Un thé très floral rencontre un cigare qui l''est tout autant. Accord délicat, réservé aux après-midi ensoleillés.')
WHERE `name` = 'Romeo y Julieta';

-- ── Les mêmes, dans les cinq autres langues ─────────────
-- REPLACE ciblé plutôt que retraduction du récit entier : seul le rang
-- change, le reste du texte est juste.
UPDATE `brands` SET
  `history_en` = REPLACE(`history_en`, 'the most expensive cigar the Cuban industry ever launched', 'the cigar whose price marked a break for the Cuban industry'),
  `history_es` = REPLACE(`history_es`, 'el puro más caro jamás lanzado por la industria cubana', 'el puro cuyo precio marcó una ruptura para la industria cubana'),
  `history_de` = REPLACE(`history_de`, 'die teuerste Zigarre, die die kubanische Industrie je lanciert hat', 'die Zigarre, deren Preis für die kubanische Industrie einen Bruch bedeutete'),
  `history_zh` = REPLACE(`history_zh`, '古巴业界有史以来最昂贵的雪茄', '价格为古巴业界划出一道分界的雪茄'),
  `history_ar` = REPLACE(`history_ar`, 'أغلى سيجار أطلقته الصناعة الكوبية على الإطلاق', 'السيجار الذي شكّل سعره قطيعة في الصناعة الكوبية')
WHERE `name` = 'Atabey';

UPDATE `brands` SET
  `history_en` = REPLACE(`history_en`, 'the world''s largest premium cigar factory', 'the La Romana factory, one of the largest in the trade'),
  `history_es` = REPLACE(`history_es`, 'la mayor fábrica de puros premium del mundo', 'la fábrica de La Romana, una de las mayores del sector'),
  `history_de` = REPLACE(`history_de`, 'die größte Premium-Zigarrenfabrik der Welt', 'die Fabrik von La Romana, eine der größten der Branche'),
  `history_zh` = REPLACE(`history_zh`, '世界上最大的优质雪茄工厂', '拉罗马纳的雪茄工厂，业内规模最大的几家之一'),
  `history_ar` = REPLACE(`history_ar`, 'أكبر مصنع للسيجار الفاخر في العالم', 'مصنع لا رومانا، أحد أكبر مصانع القطاع')
WHERE `name` IN ('Matilde', 'Montecristo Dominicain');

-- Deux rangs qui n'existaient QU'EN ANGLAIS : le français ne dit nulle
-- part que ces vitoles sont les plus vendues au monde.
UPDATE `brands` SET `gamme_en` = REPLACE(`gamme_en`,
  'The world''s best-selling Cuban Robusto (50×124mm).',
  'The Cuban Robusto that set the standard (50x124mm).')
WHERE `name` = 'Hoyo de Monterrey';

UPDATE `brands` SET `gamme_en` = REPLACE(`gamme_en`,
  'Petit Corona (42 x 129mm), the world''s best-selling cigar.',
  'Petit Corona (42 x 129mm), the daily benchmark of the range.')
WHERE `name` = 'Montecristo';

-- ── Trois entrées espagnoles restées en anglais ─────────
-- Dont deux en hybride : « Nombrada por the ocean liner sunk in 1915 »,
-- « fresh herbs, especias, café ». Le seuil de trois mots outils du
-- détecteur de fuite les laissait passer, faute de longueur.
UPDATE `brands` SET `gamme_es` = JSON_SET(`gamme_es`, '$[1].story',
  'Formato Double Corona (49 x 194mm), 90 minutos de humo. Uno de los pocos formatos gigantes que Cuba sigue produciendo con regularidad. Lleva el nombre del transatlántico hundido en 1915. Un puro para las grandes ocasiones solemnes.')
WHERE `name` = 'Partagás';

UPDATE `brands` SET `gamme_es` = JSON_SET(`gamme_es`, '$[2].story',
  'Se vende en cajas de 25 puros dispuestos 8-9-8, de ahí el nombre. Formato Panetela (33 x 170mm), uno de los más finos del catálogo cubano. Ligereza aparente y engañosa: la estrechez del cepo concentra los aromas en vez de diluirlos.')
WHERE `name` = 'Partagás';

UPDATE `brands` SET `gamme_es` = JSON_SET(`gamme_es`, '$[0].story',
  'Formato Chisel (75 x 184mm), uno de los puros de serie más grandes que existen. Tres horas de humo como mínimo. Notas que evolucionan en cinco fases distintas: hierbas frescas, especias, café, chocolate, final apimentado.')
WHERE `name` = 'La Flor Dominicana';
