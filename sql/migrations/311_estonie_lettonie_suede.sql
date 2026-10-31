-- ════════════════════════════════════════════════════════
-- 311 — trois pays (Estonie, Lettonie, Suède) et 4 fiches (#2626 à #2629)
-- ────────────────────────────────────────────────────────
-- CE QU'ON A TROUVÉ (31 octobre 2026). Trois pays entrent dans l'atlas pour accueillir quatre lieux rendus par l'agent du Moyen-Orient et de l'Europe : l'Estonie (The Oak Lounge et Sigari Maja, Tallinn), la Lettonie (Oak Lounge / La Casa del Habano, Riga) et la Suède (Cigarrummet, Stockholm, salon privé). Tous « à vérifier ». Drapeaux dessinés dans flags.js, régions dans explorer.js, amorce régénérée.
-- Photos : uploads/lounges/<id>/placeholder_<id>.jpg à téléverser sur le serveur.
-- ════════════════════════════════════════════════════════

INSERT INTO `lounge_countries` (`id`, `name`, `flag`, `lat`, `lon`, `color`, `iso_code`)
SELECT 'estonia', 'Estonie', CONVERT(UNHEX('F09F87AAF09F87AA') USING utf8mb4), 58.5953, 25.0136, '#8B2BE2', 'EE' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `lounge_countries` WHERE `id` = 'estonia');
INSERT INTO `lounge_countries` (`id`, `name`, `flag`, `lat`, `lon`, `color`, `iso_code`)
SELECT 'latvia', 'Lettonie', CONVERT(UNHEX('F09F87B1F09F87BB') USING utf8mb4), 56.8796, 24.6032, '#8B2BE2', 'LV' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `lounge_countries` WHERE `id` = 'latvia');
INSERT INTO `lounge_countries` (`id`, `name`, `flag`, `lat`, `lon`, `color`, `iso_code`)
SELECT 'sweden', 'Suède', CONVERT(UNHEX('F09F87B8F09F87AA') USING utf8mb4), 60.1282, 18.6435, '#8B2BE2', 'SE' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `lounge_countries` WHERE `id` = 'sweden');

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2626, 'estonia', 'The Oak Lounge', 'Tallinn — Dunkri 2, 10123 Tallinn', 'Cigar Lounge', '+372 644 5647', 'http://www.theoaklounge.com',
  'à vérifier — relu le 31 octobre 2026 : inyourpocket.com, non datée : « cigar lounge, about 200 cigar types, attached cigar and whiskey shop » ; theoaklounge.com, 19 octobre 2026 : « Dunkri str 2, Tallinn ; horaires fériés 23.06.26 fermé »', 1,
  'The Oak Lounge, à Tallinn : un salon où l''on peut fumer le cigare.',
  'The Oak Lounge, in Tallinn: a lounge where you can smoke a cigar.',
  'The Oak Lounge, en Tallinn: un salón donde se puede fumar un puro.',
  'The Oak Lounge, Tallinn: eine Lounge, in der man Zigarre rauchen kann.',
  'The Oak Lounge,位于Tallinn:可以抽雪茄的雪茄吧。',
  'The Oak Lounge، في Tallinn: صالة يمكن فيها تدخين السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2626 OR (`country_id` = 'estonia' AND `name` = 'The Oak Lounge'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 536, 2626, 'placeholder_2626.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2626 AND `name` = 'The Oak Lounge') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2626);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2627, 'estonia', 'Sigari Maja (Cigar House)', 'Tallinn — Raekoja plats 16, 10146 Tallinn', 'Cigar Shop & Lounge', '+372 631 4735', 'http://cigarhouse.ee',
  'à vérifier — relu le 31 octobre 2026 : inyourpocket.com, non datée : « quiet old-fashioned cigar lounge, wood panelling, fireplace,… » ; cigarhouse.ee, 27 mai 2026 : « cigar evening with Aldo Puncioni, Vol. 4, Tallinn »', 1,
  'Sigari Maja (Cigar House), à Tallinn : une boutique de cigares avec un salon où fumer.',
  'Sigari Maja (Cigar House), in Tallinn: a cigar shop with a lounge for smoking.',
  'Sigari Maja (Cigar House), en Tallinn: una tienda de puros con un salón para fumar.',
  'Sigari Maja (Cigar House), Tallinn: ein Zigarrenfachgeschäft mit Raucher-Lounge.',
  'Sigari Maja (Cigar House),位于Tallinn:设有吸烟休息室的雪茄店。',
  'Sigari Maja (Cigar House)، في Tallinn: متجر سيجار مع صالة للتدخين.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2627 OR (`country_id` = 'estonia' AND `name` = 'Sigari Maja (Cigar House)'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 537, 2627, 'placeholder_2627.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2627 AND `name` = 'Sigari Maja (Cigar House)') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2627);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2628, 'latvia', 'The Oak Lounge / La Casa del Habano Riga', 'Riga — Jeruzalemes iela 10', 'Cigar Lounge', '+371 6733 8787', 'https://theoaklounge.lv',
  'à vérifier — relu le 31 octobre 2026 : zl.lv, 2025 : « cigar shop and bar in central Riga, cigar salon, more than 150 cigars » ; habanos.com, 28 décembre 2011 : « La Casa del Habano opened 1 December 2011, Rasa Trading, 94 m2,… »', 1,
  'The Oak Lounge / La Casa del Habano Riga, à Riga : un salon où l''on peut fumer le cigare.',
  'The Oak Lounge / La Casa del Habano Riga, in Riga: a lounge where you can smoke a cigar.',
  'The Oak Lounge / La Casa del Habano Riga, en Riga: un salón donde se puede fumar un puro.',
  'The Oak Lounge / La Casa del Habano Riga, Riga: eine Lounge, in der man Zigarre rauchen kann.',
  'The Oak Lounge / La Casa del Habano Riga,位于Riga:可以抽雪茄的雪茄吧。',
  'The Oak Lounge / La Casa del Habano Riga، في Riga: صالة يمكن فيها تدخين السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2628 OR (`country_id` = 'latvia' AND `name` = 'The Oak Lounge / La Casa del Habano Riga'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 538, 2628, 'placeholder_2628.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2628 AND `name` = 'The Oak Lounge / La Casa del Habano Riga') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2628);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2629, 'sweden', 'Cigarrummet', 'Stockholm — Birger Jarlsgatan 44, 114 29 Stockholm', 'Private Cigar Club', '+46 8 611 62 70', 'https://www.cigarrummet.com',
  'à vérifier — relu le 31 octobre 2026 : cigaraficionado.com, 29 juillet 2014 : « Only shop members (about eight) may smoke upstairs » ; cigarrummet.com, 2026 : « Medlemsloungen, a quiet private space for members of a closed society »', 1,
  'Cigarrummet, à Stockholm : un salon de cigares réservé aux membres.',
  'Cigarrummet, in Stockholm: a members-only cigar lounge.',
  'Cigarrummet, en Stockholm: un salón de puros reservado a los socios.',
  'Cigarrummet, Stockholm: eine Zigarren-Lounge nur für Mitglieder.',
  'Cigarrummet,位于Stockholm:仅限会员的雪茄休息室。',
  'Cigarrummet، في Stockholm: صالة سيجار للأعضاء فقط.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2629 OR (`country_id` = 'sweden' AND `name` = 'Cigarrummet'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 539, 2629, 'placeholder_2629.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2629 AND `name` = 'Cigarrummet') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2629);

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'lounges', l.`id`, 'description', g.lang, SHA1(l.`description`), 'machine', NOW()
  FROM `lounges` l
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de' UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') g
 WHERE l.`id` BETWEEN 2626 AND 2629
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `statut` = 'machine', `maj` = NOW();

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 311';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 311', 'systeme', 'fiche_ajoutee', 'systeme', 0, 'Estonie, Lettonie, Suede : 3 pays, 4 fiches ajoutees (#2626 a #2629), lues le 31 octobre 2026');

-- Contrôle : des 1 partout.
SELECT
  (SELECT COUNT(*) FROM `lounge_countries` WHERE `id` IN ('estonia','latvia','sweden')) = 3 AS `pays_ajoutes`,
  (SELECT COUNT(*) FROM `lounges` WHERE `id` BETWEEN 2626 AND 2629) = 4 AS `fiches_ajoutees`,
  (SELECT COUNT(*) FROM `lounge_photos` WHERE `lounge_id` BETWEEN 2626 AND 2629) = 4 AS `photos`,
  (SELECT COUNT(*) FROM `translation_status` WHERE `entite` = 'lounges' AND `champ` = 'description' AND `entite_id` BETWEEN '2626' AND '2629' AND `statut` = 'machine') >= 20 AS `sceaux_remis`;
