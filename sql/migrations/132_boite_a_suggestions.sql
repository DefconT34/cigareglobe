-- ════════════════════════════════════════════════════════
-- 132 — La boîte à suggestions
-- ────────────────────────────────────────────────────────
-- POURQUOI, ET POURQUOI PAS LE FORUM
--
-- Le site est en ligne mais en phase d'essai : ce qu'il faut recueillir
-- maintenant, ce sont les remarques de ceux qui l'essaient. Or le forum
-- exige un compte ET un email vérifié avant d'écrire une ligne — deux
-- barrières que la personne qui vient de repérer un défaut ne
-- franchira pas. Elle fermera l'onglet.
--
-- D'où une boîte SANS COMPTE. L'adresse est facultative : elle ne sert
-- qu'à répondre, et son absence n'empêche rien.
--
-- CE QUE LA TABLE GARDE, ET POURQUOI
--
-- `page` et `lang` : « ça ne marche pas » sans savoir où ni dans quelle
-- langue est inexploitable. Ce ne sont pas des données personnelles,
-- c'est le contexte du défaut.
--
-- `ip` : uniquement pour le plafond anti-spam, comme `auth_attempts`.
-- Elle se purge, et n'a aucune valeur au-delà de quelques heures.
--
-- `email` : NULLABLE, et c'est le point. Une boîte à suggestions qui
-- exige une adresse n'est plus anonyme, et recueille moins.
--
-- `traite` : une remarque lue n'est pas une remarque traitée. Deux
-- états valent mieux qu'une pile qu'on relit sans fin.
--
-- Idempotente : rejouée, elle ne duplique rien.
-- ════════════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS `suggestions` (
  `id`         int unsigned NOT NULL AUTO_INCREMENT,
  `texte`      text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email`      varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Facultatif : sert uniquement a repondre',
  `page`       varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Ou la personne se trouvait',
  `lang`       varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip`         varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Plafond anti-spam uniquement',
  `traite`     tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_sugg_traite` (`traite`, `created_at`),
  KEY `idx_sugg_date`   (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
