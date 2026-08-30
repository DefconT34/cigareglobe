-- ════════════════════════════════════════════════════════
-- 130 — Le journal de modération
-- ────────────────────────────────────────────────────────
-- ── CE QUI MANQUAIT ─────────────────────────────────────
--
-- Le cahier des charges de l'espace communautaire (docs/communaute.md,
-- §8) demande : « toute décision est journalisée avec son auteur et son
-- motif. Un modérateur doit pouvoir être audité. »
--
-- Une seule trace existait : `forum_flags.resolved_by`, qui dit qui a
-- clos un signalement du forum. Rien pour les avis retirés, rien pour
-- les contributions rejetées, rien pour les photos supprimées, rien
-- pour les rôles attribués. On pouvait constater qu'un établissement
-- avait disparu de l'atlas sans jamais savoir qui l'avait décidé.
--
-- C'est le préalable au recrutement d'un modérateur, pas un ornement :
-- on ne confie pas un pouvoir qu'on ne peut pas relire.
--
-- ── POURQUOI `acteur_nom` EN PLUS DE `acteur_id` ────────
--
-- Le nom est FIGÉ au moment de l'acte. Un compte peut être renommé,
-- rétrogradé ou supprimé ; le journal doit continuer à dire qui a
-- décidé, le jour où l'on cherche justement à comprendre ce qu'a fait
-- un compte devenu problématique. Une clé étrangère avec ON DELETE
-- CASCADE ferait exactement l'inverse : elle effacerait les décisions
-- de celui qu'on audite. Il n'y a donc VOLONTAIREMENT pas de contrainte
-- vers `users` — le journal survit à son sujet.
--
-- ── POURQUOI LA PORTÉE « systeme » ──────────────────────
--
-- Trois chemins publient une contribution : la décision d'un
-- modérateur, le vote de la communauté, et la publication directe d'un
-- contributeur de confiance. Les deux derniers n'ont pas d'auteur
-- humain. Les journaliser quand même donne au journal une seconde
-- utilité, celle qu'on cherche le plus souvent : « pourquoi cette fiche
-- est-elle en ligne ? » — et la réponse « personne ne l'a décidé, le
-- seuil de votes a été atteint » est une réponse.
--
-- Idempotente : rejouée, elle ne duplique rien.
-- ════════════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS `moderation_log` (
  `id`         int unsigned NOT NULL AUTO_INCREMENT,
  `acteur_id`  int unsigned DEFAULT NULL COMMENT 'NULL = clé d administration ou chemin automatique',
  `acteur_nom` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Figé au moment de l acte : le journal survit au compte',
  `portee`     enum('admin','moderator','systeme') COLLATE utf8mb4_unicode_ci NOT NULL,
  `action`     varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cible_type` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cible_id`   int unsigned NOT NULL,
  `detail`     varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_ml_cible`  (`cible_type`, `cible_id`),
  KEY `idx_ml_acteur` (`acteur_id`, `created_at`),
  KEY `idx_ml_date`   (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
