-- ════════════════════════════════════════════════════════
-- 159 — Huit fiches que la sonde allemande ne pouvait pas voir
-- ────────────────────────────────────────────────────────
-- LES DEUX ANGLES MORTS DE LA MIGRATION 158.
--
-- Le premier : sa sonde ne regardait que les fiches PUBLIÉES. Les
-- fiches dépubliées pendant la campagne des sources restent dans le
-- dump versionné et repartiraient telles quelles le jour où l'une
-- d'elles serait rétablie.
--
-- Le second, plus intéressant : la sonde comptait des mots-outils
-- français dans une colonne ALLEMANDE. Or plusieurs fiches ont une
-- colonne allemande PARFAITE et une colonne chinoise restée française.
-- La substitution n'a pas échoué partout au même endroit ; mesurer une
-- langue ne dit rien des quatre autres.
--
--   #89  zh : « Ouvert 2024年开业, le rêve des bon vivants milanais.
--             Divans en cuir, 18 000 bouteilles de vins… »
--   #968 zh : « Le mythique Red 雪茄吧 的Sacher — cigares sélectionnés
--             par le sommelier… »
--
-- Dans les deux cas l'allemand est irréprochable.
--
-- ── DEUX DÉFAUTS QUE MÊME LA SECONDE SONDE N'A PAS VUS ───
-- #913 : ses colonnes chinoise et arabe sont TRONQUÉES en plein milieu
-- — « 雪茄吧 du palace Le Royal， » et rien après la virgule. Aucune
-- sonde ne cherchait la troncature ; elle s'est vue à la lecture.
--
-- #971 : son ANGLAIS est resté français — « La Casa del Habano sur la
-- rue Matogianni, artère des grandes maisons luxe de Mykonos ». La
-- fiche a été trouvée par sa colonne chinoise ; son anglais était le
-- vrai problème.
--
-- ── TROIS FAUX POSITIFS, ÉCARTÉS ─────────────────────────
-- La sonde chinoise signalait aussi trois marques : Arturo Fuente, My
-- Father, Tabacalera. Leur texte chinois est juste ; les mots français
-- qu'il contient sont des NOMS PROPRES — « Château de la Fuente », la
-- plantation ; « Le Bijou 1922 », le nom du cigare. Ils doivent rester.
--
-- C'est la deuxième fois que cette sonde se trompe de la même manière :
-- elle avait déjà accusé du bon allemand à cause de « des » au génitif.
-- Un mot n'appartient pas à une langue parce qu'il en vient.
--
-- ── LES FICHES DÉPUBLIÉES SONT CORRIGÉES AUSSI ───────────
-- #234 Lyon, #374 Shanghai, #971 Mykonos, #1106 Caracas ne sont plus
-- servies. On les corrige quand même : le jour où une source les
-- rétablirait, personne ne penserait à rouvrir leurs traductions.
--
-- Le statut reste « machine ».
--
-- Après cette migration :
--   php tools/contenu_dump.php
--   php tools/i18n_dump.php > sql/traductions.sql
-- ════════════════════════════════════════════════════════

-- ── #89 Milan ────────────────────────────────────────────
UPDATE `lounges` SET
  `description_zh` = '2024 年开业，米兰享乐者的理想去处。皮质沙发、一万八千瓶藏酒，另设配有扶手椅与恒湿雪茄柜的雪茄室。营业时间 18:00 至次日 01:00。',
  `description_ar` = 'افتُتح عام 2024، وهو مقصد محبّي الحياة الطيّبة في ميلانو. أرائك جلدية، وثمانية عشر ألف زجاجة نبيذ، وغرفة سيجار بمقاعد وثيرة ومستودع ترطيب. يفتح من السادسة مساءً حتى الواحدة بعد منتصف الليل.',
  `updated_at` = NOW() WHERE `id` = 89;

-- ── #234 Lyon (dépubliée) ────────────────────────────────
UPDATE `lounges` SET
  `description_es` = 'La Casa del Habano oficial de Lyon, la primera tienda de la región de Ródano-Alpes.',
  `description_de` = 'Die offizielle La Casa del Habano von Lyon, das erste Geschäft der Region Rhône-Alpes.',
  `description_zh` = '里昂的官方 La Casa del Habano，也是罗讷-阿尔卑斯大区的首家门店。',
  `description_ar` = '«لا كاسا ديل هابانو» الرسمية في ليون، وهي أول متجر في منطقة رون ألب.',
  `updated_at` = NOW() WHERE `id` = 234;

-- ── #374 Shanghai (dépubliée) ────────────────────────────
UPDATE `lounges` SET
  `description_zh` = '坐落于上海外滩的 La Casa del Habano，可望见浦东的天际线。这是中国景观最佳的哈伯纳斯销售点。',
  `description_ar` = '«لا كاسا ديل هابانو» على واجهة البوند الشهيرة في شنغهاي، بإطلالة على أفق منطقة بودونغ. أجمل نقاط بيع هابانوس موقعًا في الصين.',
  `updated_at` = NOW() WHERE `id` = 374;

-- ── #382 Hong Kong ───────────────────────────────────────
UPDATE `lounges` SET
  `description_zh` = '位于太古广场购物中心的官方高希霸 Atmosphere 雪茄吧，可眺望维多利亚港。',
  `description_ar` = 'صالة كوهيبا أتموسفير الرسمية في مركز باسيفيك بليس التجاري، بإطلالة على الميناء.',
  `updated_at` = NOW() WHERE `id` = 382;

-- ── #913 Luxembourg : les colonnes tronquées ─────────────
UPDATE `lounges` SET
  `description_zh` = '卢森堡市 Le Royal Hotels & Resorts 内的高端雪茄去处，备有哈伯纳斯与其他高端雪茄的精选。',
  `description_ar` = 'وجهة سيجار فاخرة في مدينة لوكسمبورغ، داخل فندق Le Royal Hotels & Resorts. تشكيلة مختارة من سيجار هابانوس والسيجار الفاخر.',
  `updated_at` = NOW() WHERE `id` = 913;

-- ── #968 Vienne ──────────────────────────────────────────
UPDATE `lounges` SET
  `description_zh` = '萨赫酒店传奇的红厅酒吧 —— 雪茄由侍酒师亲自挑选，佐以萨赫蛋糕。',
  `description_ar` = 'بار الأحمر الأسطوري في فندق زاخر — سيجار ينتقيه خبير المشروبات، وتُقدَّم معه كعكة زاخر.',
  `updated_at` = NOW() WHERE `id` = 968;

-- ── #971 Mykonos (dépubliée) : l'anglais aussi ───────────
UPDATE `lounges` SET
  `description_en` = 'La Casa del Habano on Matogianni Street, the avenue of Mykonos''s great luxury houses.',
  `description_zh` = '位于米科诺斯马托扬尼街的 La Casa del Habano，这条街聚集了各大奢侈品牌。',
  `description_ar` = '«لا كاسا ديل هابانو» في شارع ماتويانّي، شريان دور الأزياء الفاخرة في ميكونوس.',
  `updated_at` = NOW() WHERE `id` = 971;

-- ── #1106 Caracas (dépubliée) ────────────────────────────
UPDATE `lounges` SET
  `description_zh` = '位于加拉加斯商业区乔奥的 CCCT 购物中心内的 La Casa del Habano。',
  `description_ar` = '«لا كاسا ديل هابانو» في مركز CCCT التجاري بحي تشاو، منطقة الأعمال في كاراكاس.',
  `updated_at` = NOW() WHERE `id` = 1106;

-- ── Les sceaux ───────────────────────────────────────────
UPDATE `translation_status` t
  JOIN `lounges` l ON l.`id` = t.`entite_id`
   SET t.`source_hash` = SHA1(l.`description`), t.`statut` = 'machine', t.`maj` = NOW()
 WHERE t.`entite` = 'lounges' AND t.`champ` = 'description'
   AND t.`entite_id` IN ('89','234','374','382','913','968','971','1106');

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 159','systeme','traductions_refaites','lounge',0,
   '8 fiches : la sonde de la 158 ne regardait que l ALLEMAND et que les fiches PUBLIEES. Plusieurs ont un allemand parfait et un chinois reste francais — la substitution n a pas echoue partout au meme endroit'),
  (NULL,'migration 159','systeme','troncature','lounge',913,
   'les colonnes chinoise et arabe s arretaient en plein milieu : « 雪茄吧 du palace Le Royal， » et rien apres la virgule. Aucune sonde ne cherchait la troncature ; elle s est vue a la lecture'),
  (NULL,'migration 159','systeme','faux_positifs','lounge',0,
   'la sonde chinoise signalait Arturo Fuente, My Father et Tabacalera : les mots francais de leur texte sont des NOMS PROPRES — « Château de la Fuente » la plantation, « Le Bijou 1922 » le cigare. Deuxieme fois que cette sonde se trompe ainsi, apres « des » au genitif allemand'),
  (NULL,'migration 159','systeme','depubliees_corrigees','lounge',0,
   '#234 Lyon, #374 Shanghai, #971 Mykonos, #1106 Caracas ne sont plus servies mais restent au dump versionne : corrigees quand meme, car personne ne rouvrirait leurs traductions le jour ou une source les retablirait');
