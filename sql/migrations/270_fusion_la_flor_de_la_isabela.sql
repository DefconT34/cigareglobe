-- ════════════════════════════════════════════════════════
-- 270 — Vague 2, fin : La Flor de la Isabela fusionnée dans Tabacalera
-- ────────────────────────────────────────────────────────
-- POURQUOI. La fiche « La Flor de la Isabela » (mars 2026) décrivait une marque sœur
-- de Tabacalera, « légère et florale », avec une gamme de quatre formats et des
-- accords : aucune page lue ne l'établit. Philstar (2011) écrit au contraire que la marque
-- phare de la Compañía, La Flor de la Isabela, a été rebaptisée Tabacalera : c'est une
-- seule marque, et la fiche Tabacalera (migration 269) la porte déjà. Arbitrage du
-- 21 octobre 2026 : la ligne `brands` est supprimée, ses sceaux de traduction aussi.
--
-- CE QUI CHANGE. (1) `brands` perd « La Flor de la Isabela » (et ses 15 sceaux).
-- (2) La phrase de Tabacalera « a sa propre fiche dans l'atlas » est retirée dans les six
-- langues ; la mention de la marque dans l'histoire des propriétaires (Verafiles, 2014)
-- reste, c'est un fait daté. (3) Alhambra et Tabaqueria de Filipinas ne renvoient plus à
-- une fiche qui n'existe plus. (4) La page Philippines compte trois fiches, non quatre :
-- liste de marques, note (six langues) et `tabacaleras`. Les sceaux des champs retouchés
-- sont recalculés depuis le français. Le statut `habanos_presence` des Philippines
-- (usine et marques « officielles » de La Flor de la Isabela) n'est pas touché : il relève
-- d'un autre recensement.
-- ════════════════════════════════════════════════════════

-- ── Tabacalera : la phrase « propre fiche » ──
UPDATE `brands` SET `history` = REPLACE(`history`, '; La Flor de la Isabela a sa propre fiche dans l''atlas.', '.') WHERE `name` = 'Tabacalera';
UPDATE `brands` SET `history_en` = REPLACE(`history_en`, '; La Flor de la Isabela has its own entry in the atlas.', '.') WHERE `name` = 'Tabacalera';
UPDATE `brands` SET `history_es` = REPLACE(`history_es`, '; La Flor de la Isabela tiene su propia ficha en el atlas.', '.') WHERE `name` = 'Tabacalera';
UPDATE `brands` SET `history_de` = REPLACE(`history_de`, '; La Flor de la Isabela hat im Atlas einen eigenen Eintrag.', '.') WHERE `name` = 'Tabacalera';
UPDATE `brands` SET `history_zh` = REPLACE(`history_zh`, '；La Flor de la Isabela 在本图集中另有词条。', '。') WHERE `name` = 'Tabacalera';
UPDATE `brands` SET `history_ar` = REPLACE(`history_ar`, '؛ ولـLa Flor de la Isabela بطاقتها الخاصة في الأطلس.', '.') WHERE `name` = 'Tabacalera';

-- ── Alhambra ──
UPDATE `brands` SET `history` = REPLACE(`history`, 'à côté de Tabacalera et de La Flor de la Isabela.', 'à côté de Tabacalera.') WHERE `name` = 'Alhambra';
UPDATE `brands` SET `history_en` = REPLACE(`history_en`, 'alongside Tabacalera and La Flor de la Isabela.', 'alongside Tabacalera.') WHERE `name` = 'Alhambra';
UPDATE `brands` SET `history_es` = REPLACE(`history_es`, 'junto a Tabacalera y La Flor de la Isabela.', 'junto a Tabacalera.') WHERE `name` = 'Alhambra';
UPDATE `brands` SET `history_de` = REPLACE(`history_de`, 'neben Tabacalera und La Flor de la Isabela.', 'neben Tabacalera.') WHERE `name` = 'Alhambra';
UPDATE `brands` SET `history_zh` = REPLACE(`history_zh`, '与塔巴卡莱拉和伊莎贝拉之花并列。', '与塔巴卡莱拉并列。') WHERE `name` = 'Alhambra';

-- ── Tabaqueria de Filipinas ──
UPDATE `brands` SET `history` = REPLACE(`history`, ' que l''atlas raconte à la fiche La Flor de la Isabela ;', ' ;') WHERE `name` = 'Tabaqueria de Filipinas';
UPDATE `brands` SET `history_en` = REPLACE(`history_en`, ' that this atlas tells at the La Flor de la Isabela entry;', ';') WHERE `name` = 'Tabaqueria de Filipinas';
UPDATE `brands` SET `history_es` = REPLACE(`history_es`, ' que este atlas cuenta en la ficha La Flor de la Isabela;', ';') WHERE `name` = 'Tabaqueria de Filipinas';
UPDATE `brands` SET `history_de` = REPLACE(`history_de`, ', die dieser Atlas im Eintrag La Flor de la Isabela erzählt;', ';') WHERE `name` = 'Tabaqueria de Filipinas';
UPDATE `brands` SET `history_zh` = REPLACE(`history_zh`, '，本图集在 La Flor de la Isabela 词条讲过；', '；') WHERE `name` = 'Tabaqueria de Filipinas';
UPDATE `brands` SET `history_ar` = REPLACE(`history_ar`, ' التي يرويها هذا الأطلس في بطاقة La Flor de la Isabela؛', '؛') WHERE `name` = 'Tabaqueria de Filipinas';

-- ── Page Philippines : trois fiches ──
UPDATE `producer_countries` SET
  `brands` = REPLACE(`brands`, '{"desc":"Production artisanale traditionnelle","name":"La Flor de la Isabela","iconic":false},', ''),
  `tabacaleras` = REPLACE(`tabacaleras`, ',"La Flor de la Isabela"', ''),
  `updated_at` = NOW()
 WHERE `id` = 'philippines';
UPDATE `producer_countries` SET `notes` = REPLACE(`notes`, 'quatre fiches — Tabacalera, La Flor de la Isabela, Alhambra', 'trois fiches — Tabacalera, Alhambra') WHERE `id` = 'philippines';
UPDATE `producer_countries` SET `notes_en` = REPLACE(`notes_en`, 'four entries — Tabacalera, La Flor de la Isabela, Alhambra', 'three entries — Tabacalera, Alhambra') WHERE `id` = 'philippines';
UPDATE `producer_countries` SET `notes_es` = REPLACE(`notes_es`, 'cuatro fichas — Tabacalera, La Flor de la Isabela, Alhambra', 'tres fichas — Tabacalera, Alhambra') WHERE `id` = 'philippines';
UPDATE `producer_countries` SET `notes_de` = REPLACE(`notes_de`, 'vier Einträge hinaus bekannt — Tabacalera, La Flor de la Isabela, Alhambra', 'drei Einträge hinaus bekannt — Tabacalera, Alhambra') WHERE `id` = 'philippines';
UPDATE `producer_countries` SET `notes_zh` = REPLACE(`notes_zh`, '四个词条——Tabacalera、La Flor de la Isabela、Alhambra', '三个词条——Tabacalera、Alhambra') WHERE `id` = 'philippines';
UPDATE `producer_countries` SET `notes_ar` = REPLACE(`notes_ar`, 'البطاقات الأربع — Tabacalera وLa Flor de la Isabela وAlhambra', 'البطاقات الثلاث — Tabacalera وAlhambra') WHERE `id` = 'philippines';

-- ── La fiche et ses sceaux ──
DELETE FROM `translation_status` WHERE `entite` = 'brands' AND `entite_id` = 'La Flor de la Isabela';
DELETE FROM `brands` WHERE `name` = 'La Flor de la Isabela';

-- ── Les sceaux des champs retouchés, recalculés depuis le français (statut conservé) ──
UPDATE `translation_status` t JOIN `brands` b ON b.`name` = t.`entite_id` AND t.`entite` = 'brands' AND t.`champ` = 'history'
   SET t.`source_hash` = SHA1(b.`history`), t.`maj` = NOW()
 WHERE b.`name` IN ('Tabacalera', 'Alhambra', 'Tabaqueria de Filipinas');
UPDATE `translation_status` t JOIN `producer_countries` p ON p.`id` = t.`entite_id` AND t.`entite` = 'producer_countries' AND t.`champ` = 'notes'
   SET t.`source_hash` = SHA1(p.`notes`), t.`maj` = NOW()
 WHERE p.`id` = 'philippines';

-- ── Contrôle ──
SELECT (SELECT COUNT(*) FROM `brands` WHERE `name` = 'La Flor de la Isabela') = 0 AS fiche_supprimee,
       (SELECT COUNT(*) FROM `translation_status` WHERE `entite_id` = 'La Flor de la Isabela') = 0 AS sceaux_supprimes,
       (SELECT COUNT(*) FROM `brands` WHERE `name` IN ('Tabacalera','Alhambra','Tabaqueria de Filipinas') AND CONCAT_WS(' ', `history`, `history_en`, `history_es`, `history_de`, `history_zh`, `history_ar`) REGEXP 'propre fiche|own entry|propia ficha|eigenen Eintrag|另有词条|بطاقتها الخاصة|fiche La Flor|La Flor de la Isabela entry|ficha La Flor|Eintrag La Flor|La Flor de la Isabela 词条|بطاقة La Flor') = 0 AS renvois_retires,
       (SELECT `notes` LIKE '%trois fiches%' AND `brands` NOT LIKE '%La Flor de la Isabela%' AND `tabacaleras` NOT LIKE '%Isabela%' FROM `producer_countries` WHERE `id` = 'philippines') AS page_philippines;
