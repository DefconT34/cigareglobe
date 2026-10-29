-- ════════════════════════════════════════════════════════
-- 282 — Relecture zh
-- ────────────────────────────────────────────────────────
-- Relecture des traductions « zh » par : expert-traduction (agent).
-- Fichier de verdicts : verdicts_p4_zh.json ; generee par tools/i18n_relecture.php le 2026-10-29.
-- Un texte « corrige » est reecrit ; tout texte relu passe au statut « relu »,
-- avec le nom du relecteur. L'empreinte du francais est verifiee dans le WHERE :
-- un francais qui a change depuis l'export ne se laisse pas declarer relu.
-- ════════════════════════════════════════════════════════

-- feuilles|philippines-cagayan|genese|zh — superlatif ajouté supprimé
UPDATE `feuilles` SET `genese_zh` = '种子跟随信仰而来：菲律宾媒体说，1592年圣克莱门特号大帆船带来五十公斤古巴种子，传教修士把它们传遍群岛，并发现它们在伊莎贝拉省的卡加延河谷长势良好。西班牙在那里从1782年起实行烟草专卖，直到1881年废除——同年，科米利亚斯侯爵在巴塞罗那创立接手的公司，其马尼拉工厂将成为亚洲首家雪茄厂。'
 WHERE `id` = 'philippines-cagayan' AND SHA1(TRIM(`genese`)) = '59e31d99622ad76c0d3efc1da7baebbd0b6da86d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'philippines-cagayan' AND `champ` = 'genese' AND `lang` = 'zh' AND `source_hash` = '59e31d99622ad76c0d3efc1da7baebbd0b6da86d';
-- lexique|cape|definition|zh — goût mal rendu, terme interdit
UPDATE `lexique` SET `definition_zh` = '外层的、看得见的那片叶子。它既看味道，也看外观：整支雪茄里，只有它会因为一点瑕疵就被眼睛淘汰。'
 WHERE `id` = 'cape' AND SHA1(TRIM(`definition`)) = '558186cf220e5aa7310e280bade0610bfaa64417';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'cape' AND `champ` = 'definition' AND `lang` = 'zh' AND `source_hash` = '558186cf220e5aa7310e280bade0610bfaa64417';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '11' AND `champ` = 'description' AND `lang` = 'zh' AND `source_hash` = 'f9bf70c6150be2cdec22eafbce3f14f252af0d80';
-- lounges|90|description|zh — marques en alphabet latin
UPDATE `lounges` SET `description_zh` = '罗马两家获 Habanos S.A. 认可的官方 Habanos Lounge 之一。葡萄酒精品酒店，藏酒 1500 款。古巴雪茄独家精选：Trinidad、Cohiba、Montecristo。对公众开放，消费不低于 30 欧元。'
 WHERE `id` = '90' AND SHA1(TRIM(`description`)) = 'c28a371a7a8dcb1177b95107f063d40335d16ffb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '90' AND `champ` = 'description' AND `lang` = 'zh' AND `source_hash` = 'c28a371a7a8dcb1177b95107f063d40335d16ffb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '935' AND `champ` = 'description' AND `lang` = 'zh' AND `source_hash` = '13990c6b9aff9826a5130f75df33815459394ee4';
-- lounges|2561|description|zh — ordinal premier, terme interdit
UPDATE `lounges` SET `description_zh` = '香港第二家 La Casa del Habano，位于中环乐怡大厦十一楼。首家在九龙喜来登酒店。由 Pacific Cigar 供货。'
 WHERE `id` = '2561' AND SHA1(TRIM(`description`)) = 'd4fdae2d9beddd0f33745178c17bff4a3a62ee12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2561' AND `champ` = 'description' AND `lang` = 'zh' AND `source_hash` = 'd4fdae2d9beddd0f33745178c17bff4a3a62ee12';

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 282';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 282', 'systeme', 'traductions_relues', 'systeme', 0, 'Relecture « zh » par expert-traduction (agent) : 6 traduction(s) relue(s) — 4 corrigee(s), 2 validee(s) telles quelles ; feuilles 1, lexique 1, lounges 4');

SELECT
  (SELECT COUNT(*) FROM `translation_status` WHERE `lang` = 'zh' AND `statut` = 'relu' AND `relecteur` = 'expert-traduction (agent)') >= 6 AS relues,
  (SELECT COUNT(*) FROM `translation_status` WHERE `statut` = 'relu' AND (`relecteur` IS NULL OR `relecteur` = '')) = 0 AS chaque_relecture_a_son_relecteur;
SELECT `lang`, SUM(`statut` = 'relu') AS relues, COUNT(*) AS total FROM `translation_status` GROUP BY `lang`;
