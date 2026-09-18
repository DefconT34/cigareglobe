-- ════════════════════════════════════════════════════════
-- 234 — Qui a relu
-- ────────────────────────────────────────────────────────
-- 9 220 traductions, toutes au statut « machine ». Le statut « relu »
-- existe depuis la migration 009 et n'a jamais été posé : « rien n'est
-- déclaré relu tant qu'un humain ne l'a pas dit », et personne ne l'a
-- dit. Le chantier de relecture commence, et il sera mené par l'agent
-- expert-traduction, lot par lot — pas par une personne. Le statut
-- seul le tairait. Cette colonne dit QUI a relu : l'agent, ou un nom.
--
-- Une relecture sans relecteur est une relecture que personne n'assume ;
-- le contrôle final de chaque lot l'interdit (tools/i18n_relecture.php).
--
-- Écrite à la main : trois lignes de schéma, aucun texte.
-- Après cette migration : rien — la première relecture est la 236.
-- ════════════════════════════════════════════════════════

ALTER TABLE `translation_status`
  ADD COLUMN `relecteur` VARCHAR(60) DEFAULT NULL COMMENT 'qui a relu : l agent expert-traduction, ou un nom' AFTER `statut`;

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 234';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 234', 'systeme', 'colonne_relecteur', 'systeme', 0,
        'translation_status.relecteur : qui a relu une traduction. Le chantier de relecture des 9 220 traductions commence, mene par l agent expert-traduction, lot par lot');

SELECT
  (SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'translation_status' AND COLUMN_NAME = 'relecteur') = 1 AS colonne_posee,
  (SELECT COUNT(*) FROM `translation_status` WHERE `statut` = 'relu') = 0 AS rien_encore_relu;
