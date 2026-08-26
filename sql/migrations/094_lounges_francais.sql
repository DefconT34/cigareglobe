-- ════════════════════════════════════════════════════════
-- 094 — `lounges.description` : la table que rien ne balayait
-- ────────────────────────────────────────────────────────
-- Trouvé en finissant le vocabulaire des marques : la colonne FRANÇAISE
-- de `lounges.description` porte de l'anglais.
--
--   17 fiches sur 500 disent « walk-in humidor »
--    2 sont ENTIÈREMENT en anglais :
--
--      « Madrid's largest La Casa del Habano on the Paseo de la
--        Castellana. Monumental walk-in humidor, whisky bar, the
--        Spanish capital's most comprehensive Habanos address. »
--
--      « Davidoff flagship boutique in Roma — Via Condotti 18.
--        Complete range, walk-in humidor, premium lounge. »
--
-- ── POURQUOI AUCUN CONTRÔLE NE LES VOYAIT ───────────────
--
-- `i18n_langue_check` cherche de l'anglais dans les colonnes
-- TRADUITES — es, de, zh, ar. La colonne française est sa RÉFÉRENCE :
-- il ne lui viendrait pas à l'idée d'y chercher de l'anglais.
--
-- C'est le même angle mort que « moho azul » (migration 080), où le
-- français était la seule des six langues à ne pas avoir traduit. Un mot
-- étranger dans la langue source ne déclenche rien.
--
-- Et `marques_check`, qui balaie les quatre champs narratifs de `brands`
-- dans les six langues, ne regarde pas `lounges` — cinq cents fiches
-- écrites en partie par des contributeurs, hors de tout contrôle.
--
-- ── « WALK-IN HUMIDOR » ─────────────────────────────────
--
-- Le terme désigne une cave humidifiée assez grande pour y entrer, par
-- opposition à l'armoire. Le français dit « cave humidifiée » ou, quand
-- la taille est le propos, « cave où l'on entre ».
--
-- Madrid perd au passage « the Spanish capital's most comprehensive
-- Habanos address » : un rang, dans une ville, que rien ne mesure.
-- ════════════════════════════════════════════════════════

UPDATE `lounges` SET `description` =
  'La plus vaste Casa del Habano de Madrid, sur le Paseo de la Castellana. Cave humidifiée monumentale où l''on entre, bar à whisky, et l''un des choix Habanos les plus larges de la capitale.'
WHERE `id` = 246;

UPDATE `lounges` SET `description` =
  'Boutique amirale Davidoff de Rome — Via Condotti 18. Gamme complète, cave humidifiée où l''on entre, lounge haut de gamme.'
WHERE `id` = 327;

-- Les quinze autres : seul le terme change.
UPDATE `lounges` SET `description` = REPLACE(`description`, 'humidor walk-in', 'cave humidifiée où l''on entre')
WHERE `description` LIKE '%humidor walk-in%';

UPDATE `lounges` SET `description` = REPLACE(`description`, 'Walk-in humidor', 'Cave humidifiée où l''on entre')
WHERE `description` LIKE '%Walk-in humidor%';

UPDATE `lounges` SET `description` = REPLACE(`description`, 'walk-in humidor', 'cave humidifiée où l''on entre')
WHERE `description` LIKE '%walk-in humidor%';

-- ── ET LEURS TRADUCTIONS, QUI N'EN ÉTAIENT PAS ──────────
--
-- En rescellant, j'ai lu les cinq colonnes de ces deux fiches. La
-- « traduction » anglaise de Madrid était : « La plus grande La Casa del
-- Habano de Madrid, humidor monumental, bar à whisky. » Du FRANÇAIS.
-- L'espagnole, la même chaîne. La chinoise, un mot-à-mot hybride :
-- « La plus grande 哈瓦那之家 的Madrid, 雪茄保湿箱 monumental ».
--
-- `i18n_langue_check` ne pouvait pas le voir : il cherche des mots
-- outils ANGLAIS dans les colonnes traduites. Du français dans une
-- colonne espagnole ne déclenche rien — la symétrie exacte de la fuite
-- qu'il a été écrit pour trouver.
--
-- Mesuré ensuite sur les 500 fiches : 24 seulement sont dans ce cas,
-- soit 1 %. L'échantillon de deux que j'avais lu était trompeur, et
-- c'est la mesure qui l'a montré.
UPDATE `lounges` SET
  `description_en` = 'The largest Casa del Habano in Madrid, on the Paseo de la Castellana. A monumental walk-in humidor, a whisky bar, and one of the widest Habanos selections in the capital.',
  `description_es` = 'La Casa del Habano más amplia de Madrid, en el Paseo de la Castellana. Humidor monumental por el que se entra, bar de whisky y una de las selecciones de Habanos más completas de la capital.',
  `description_de` = 'Die größte Casa del Habano Madrids, am Paseo de la Castellana. Ein begehbarer Monumental-Humidor, eine Whiskybar und eine der breitesten Habanos-Auswahlen der Hauptstadt.',
  `description_zh` = '马德里最大的 Casa del Habano，位于卡斯特利亚纳大道。可步入的巨型恒湿库、威士忌吧，以及首都最齐全的哈瓦那雪茄选择之一。',
  `description_ar` = 'أكبر «كازا ديل هابانو» في مدريد، على جادة كاستيانا. مخزن ترطيب ضخم يُدخل إليه، وبار ويسكي، وواحدة من أوسع تشكيلات الهابانوس في العاصمة.'
WHERE `id` = 246;

UPDATE `lounges` SET
  `description_en` = 'Davidoff flagship store in Rome — Via Condotti 18. Full range, walk-in humidor, premium lounge.',
  `description_es` = 'Tienda insignia Davidoff en Roma — Via Condotti 18. Gama completa, humidor por el que se entra, lounge de alta gama.',
  `description_de` = 'Davidoff-Flagship in Rom — Via Condotti 18. Komplettes Sortiment, begehbarer Humidor, gehobene Lounge.',
  `description_zh` = '大卫杜夫罗马旗舰店——孔多蒂街 18 号。产品线齐全，设可步入的恒湿库与高端休息区。',
  `description_ar` = 'متجر دافيدوف الرئيس في روما — شارع كوندوتي 18. تشكيلة كاملة، ومخزن ترطيب يُدخل إليه، وصالة راقية.'
WHERE `id` = 327;
