-- ════════════════════════════════════════════════════════
-- 019 — Langues activables depuis l'administration
-- ────────────────────────────────────────────────────────
-- Le site parle six langues, décidées jusqu'ici par une constante
-- répétée dans index.php, sitemap.php, auth_lib.php et forum.js. En
-- ouvrir une septième, ou en fermer une le temps d'en relire les
-- traductions, demandait une mise en ligne.
--
-- Cette table dit lesquelles sont SERVIES. Elle ne dit pas lesquelles
-- EXISTENT : les dictionnaires vivent dans assets/js/i18n.js, et une
-- ligne pour une langue sans dictionnaire ne produirait qu'une page
-- vide. La liste des langues connues reste donc dans le code
-- (langues_connues(), backend/langues.php) ; la base ne fait que
-- cocher dedans.
--
-- Le français n'est pas désactivable : c'est le repli de toutes les
-- traductions manquantes, côté serveur comme côté front. La contrainte
-- est portée par le code, pas par SQL — un CHECK ne saurait pas
-- distinguer « fr décoché » d'une base réinitialisée.
--
-- Désactiver une langue ne touche à AUCUN contenu. Les messages, les
-- comptes et les événements déjà écrits dans cette langue gardent leur
-- code ; ils redeviennent visibles tels quels si on la réactive.
-- ════════════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS `site_languages` (
  `code`       CHAR(2)     NOT NULL,
  `is_active`  TINYINT(1)  NOT NULL DEFAULT 1,
  `updated_at` TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- État de départ : celui d'avant la migration, les six langues servies.
-- INSERT IGNORE pour que rejouer le fichier ne réactive pas une langue
-- que l'administration aurait entre-temps fermée.
INSERT IGNORE INTO `site_languages` (`code`, `is_active`) VALUES
  ('fr', 1), ('en', 1), ('es', 1), ('de', 1), ('zh', 1), ('ar', 1);
