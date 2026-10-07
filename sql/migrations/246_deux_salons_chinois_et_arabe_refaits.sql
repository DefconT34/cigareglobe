-- ════════════════════════════════════════════════════════
-- 246 — La Falaise et The Bristol Hotel : chinois et arabe refaits
-- ────────────────────────────────────────────────────────
-- CE QUI A OUVERT LE CHANTIER. La 245 ajoute vingt-cinq fiches, donc
-- vingt-cinq traductions chinoises et arabes, et déplace la médiane de
-- volume de chaque langue : i18n_divergence a arrêté deux salons que
-- le seuil épargnait de justesse.
--   · La Falaise — Espace VIP Cigares (1152, Douala) : le chinois
--     tient en « Espace VIP cigares 的 », l'arabe en « Espace VIP
--     cigares من » ;
--   · The Bristol Hotel — Churchill Bar (1172, Panama) : « 雪茄吧 du
--     palace The Bristol, référence 的 » et « بار السيجار du palace
--     The Bristol, référence من ».
-- Ce sont des substitutions machine : du français semé de particules,
-- comme celles de Turmeaus (242), restées sous le seuil tant que la
-- médiane était plus basse. Le français, l'anglais, l'espagnol et
-- l'allemand disent ce que dit la fiche ; le chinois et l'arabe sont
-- refaits sur ce même français, sans un fait de plus.
--
-- Rejouable : UPDATE sur l'identifiant et le nom ; sceaux `machine`
-- recalculés depuis la colonne française.
-- ════════════════════════════════════════════════════════

UPDATE `lounges` SET
  `description_zh` = '杜阿拉 Hôtel La Falaise 内的优质雪茄去处，提供精选的 Habanos 和优质雪茄。',
  `description_ar` = 'عنوان للسيجار الفاخر في دوالا، في Hôtel La Falaise. تشكيلة مختارة من سيجار Habanos ومن السيجار الفاخر.',
  `updated_at` = NOW()
 WHERE `id` = 1152 AND `name` = 'La Falaise — Espace VIP Cigares';

UPDATE `lounges` SET
  `description_zh` = '巴拿马城 The Bristol Hotel 内的优质雪茄吧：精选 Habanos、佳酿烈酒，氛围雅致。',
  `description_ar` = 'صالة سيجار فاخرة في The Bristol Hotel بمدينة بنما. سيجار Habanos مختار، ومشروبات روحية راقية، وأجواء أنيقة.',
  `updated_at` = NOW()
 WHERE `id` = 1172 AND `name` = 'The Bristol Hotel — Churchill Bar';

-- ── Les sceaux des traductions réécrites, depuis la colonne ──
INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'lounges', l.`id`, 'description', g.lang, SHA1(l.`description`), 'machine', NOW()
  FROM `lounges` l
  JOIN (SELECT 'zh' lang UNION ALL SELECT 'ar') g
 WHERE l.`id` IN (1152, 1172)
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `statut` = 'machine', `maj` = NOW();

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 246';
INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 246','systeme','traductions_refaites','systeme',0,'La Falaise (1152) et The Bristol Hotel (1172) : chinois et arabe refaits sur le français actuel (du français semé de particules, sorti du seuil par la médiane de la 245), sans fait ajouté');

SELECT
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (1152, 1172) AND `description_zh` NOT LIKE '%的' AND `description_ar` NOT LIKE '%من' AND `description_zh` NOT LIKE '%référence%' AND `description_ar` NOT LIKE '%référence%') = 2 AS zh_ar_refaits,
  (SELECT COUNT(*) FROM `translation_status` t JOIN `lounges` l ON l.`id` = t.`entite_id` WHERE t.`entite` = 'lounges' AND t.`champ` = 'description' AND l.`id` IN (1152, 1172) AND t.`source_hash` = SHA1(l.`description`) AND t.`statut` = 'machine') = 10 AS sceaux,
  (SELECT COUNT(*) FROM `moderation_log` WHERE `acteur_nom` = 'migration 246') = 1 AS journal,
  (SELECT SUM(CHAR_LENGTH(`detail`) >= 255) = 0 FROM `moderation_log` WHERE `acteur_nom` = 'migration 246') AS journal_non_tronque;
