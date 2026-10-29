-- ════════════════════════════════════════════════════════
-- 288 — Zira Hotel (Belgrade, fiche 935) retiré
-- ────────────────────────────────────────────────────────
-- La 281 l'avait gardé « à vérifier » : l'hôtel est actif (Golden Tulip Zira
-- Belgrade) mais aucune source ne décrivait son cigar bar, et la page
-- officielle (403) n'avait pu être lue. Depuis : l'hôtel indique lui-même, dans
-- sa réponse publique à un avis TripAdvisor, qu'il est non-fumeur et que sa seule
-- zone fumeurs est la terrasse du restaurant ; Booking et Agoda ne décrivent
-- qu'un bar / lounge, sans cigares. Règle de la fiche 155 : RETIRÉE
-- (`is_verified = 0`) ; à rétablir si une page ou l'hôtel confirme un cigar bar.
-- ════════════════════════════════════════════════════════

UPDATE `lounges` SET `is_verified` = 0,
  `source` = 'RETIRÉ — relu le 29 octobre 2026 : l''hôtel (Golden Tulip Zira Belgrade) se déclare non-fumeur, sa seule zone fumeurs est la terrasse du restaurant (réponse de l''hôtel sur TripAdvisor) ; Booking et Agoda ne décrivent qu''un bar / lounge, aucun cigar bar ; page officielle illisible (403) ; à rétablir si une page ou l''hôtel confirme un cigar bar',
  `updated_at` = NOW()
 WHERE `id` = 935 AND `country_id` = 'serbia';

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 288';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 288', 'systeme', 'fiche_retiree', 'lounge', 935,
  'Zira Hotel : hotel non-fumeur (zone fumeurs = terrasse), aucun cigar bar decrit par aucune source (regle de la fiche 155)');

SELECT (SELECT COUNT(*) FROM `lounges` WHERE `id` = 935 AND `is_verified` = 0 AND `source` LIKE 'RETIRÉ%') = 1 AS zira_retire;
