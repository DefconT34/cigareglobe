-- ════════════════════════════════════════════════════════
-- 320 — Hotel d'Angleterre (Genève) : le salon n'est pas le Leopard Bar
-- ────────────────────────────────────────────────────────
-- CE QU'ON A TROUVÉ (31 octobre 2026). La fiche 2588, confirmée par la migration 319, portait « (Leopard Bar) » dans son nom
-- et une description générique. Ses deux sources lues (7 octobre 2019 ; 30 janvier 2024)
-- disent que le salon cigares est distinct du bar. Nom corrigé, description réécrite en six langues avec la date de 2024 (la revue de 2019 reste dans la source),
-- traductions rescellées.
-- ════════════════════════════════════════════════════════
UPDATE `lounges` SET `name` = 'Cigar Lounge — Hotel d''Angleterre',
  `description` = 'Salon cigares de l''hôtel d''Angleterre, au quai du Mont-Blanc 17, à Genève, distinct du Leopard Bar de l''hôtel. Whisky Advocate (30 janvier 2024) y relève une trentaine de cigares . Une source de 2019 le décrit déjà comme séparé du bar.',
  `description_en` = 'Cigar lounge of the Hotel d''Angleterre, at Quai du Mont-Blanc 17 in Geneva, separate from the hotel''s Leopard Bar. Whisky Advocate (30 January 2024) notes about three dozen cigars. A 2019 source already describes it as separate from the bar.',
  `description_es` = 'Salón de cigarros del Hotel d''Angleterre, en el Quai du Mont-Blanc 17 de Ginebra, distinto del Leopard Bar del hotel. Whisky Advocate (30 de enero de 2024) señala unas tres docenas de cigarros. Una fuente de 2019 ya lo describe como separado del bar.',
  `description_de` = 'Zigarrensalon des Hotels d''Angleterre am Quai du Mont-Blanc 17 in Genf, getrennt von der Leopard Bar des Hauses. Whisky Advocate (30. Januar 2024) nennt rund drei Dutzend Zigarren. Eine Quelle von 2019 beschreibt ihn bereits als von der Bar getrennt.',
  `description_zh` = '日内瓦英国酒店（Hotel d''Angleterre）的雪茄沙龙，位于勃朗峰码头17号，与酒店的Leopard Bar分开。Whisky Advocate（2024年1月30日）提到约三十六支雪茄。2019年的一份资料已称其与酒吧分开。',
  `description_ar` = 'صالون سيجار في فندق دانجليتير (Hotel d''Angleterre) على رصيف مون بلان 17 في جنيف، منفصل عن Leopard Bar التابع للفندق. تذكر Whisky Advocate (30 يناير 2024) نحو 36 سيجارًا. وتصفه مصدر من عام 2019 بأنه منفصل عن البار.',
  `updated_at` = NOW()
 WHERE `id` = 2588;

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'lounges', l.`id`, 'description', g.lang, SHA1(l.`description`), 'machine', NOW()
  FROM `lounges` l
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de' UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') g
 WHERE l.`id` = 2588
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `statut` = 'machine', `maj` = NOW();

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 320';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 320', 'systeme', 'fiche_corrigee', 'systeme', 0, 'Hotel d Angleterre (2588) : nom et description corriges, salon distinct du Leopard Bar');

-- Contrôle : des 1 partout.
SELECT
  (SELECT COUNT(*) FROM `lounges` WHERE `id` = 2588 AND `name` = 'Cigar Lounge — Hotel d''Angleterre' AND `name` NOT LIKE '%Leopard%') = 1 AS `nom`,
  (SELECT COUNT(*) FROM `translation_status` t JOIN `lounges` l ON l.`id` = t.`entite_id` WHERE t.`entite` = 'lounges' AND t.`champ` = 'description' AND l.`id` = 2588 AND t.`source_hash` = SHA1(l.`description`)) = 5 AS `sceaux`;
