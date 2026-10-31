-- ════════════════════════════════════════════════════════
-- 321 — Hotel d'Angleterre : espace superflu avant un point (description française de la 320)
-- ════════════════════════════════════════════════════════
UPDATE `lounges` SET `description` = REPLACE(`description`, 'cigares .', 'cigares.'), `updated_at` = NOW() WHERE `id` = 2588;

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'lounges', l.`id`, 'description', g.lang, SHA1(l.`description`), 'machine', NOW()
  FROM `lounges` l
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de' UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') g
 WHERE l.`id` = 2588
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `statut` = 'machine', `maj` = NOW();

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 321';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 321', 'systeme', 'fiche_corrigee', 'systeme', 0, 'Hotel d Angleterre (2588) : espace avant le point retire');

-- Contrôle : des 1 partout.
SELECT (SELECT COUNT(*) FROM `lounges` WHERE `id` = 2588 AND `description` NOT LIKE '% .%') = 1 AS `typo`,
  (SELECT COUNT(*) FROM `translation_status` t JOIN `lounges` l ON l.`id` = t.`entite_id` WHERE t.`entite` = 'lounges' AND t.`champ` = 'description' AND l.`id` = 2588 AND t.`source_hash` = SHA1(l.`description`)) = 5 AS `sceaux`;
