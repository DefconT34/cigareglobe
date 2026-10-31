-- ════════════════════════════════════════════════════════
-- 313 — 5 nouvelles fiches (#2635 à #2639) : villes américaines et Qatar
-- ────────────────────────────────────────────────────────
-- CE QU'ON A TROUVÉ (31 octobre 2026). Deux agents ont cherché des lieux absents : villes américaines
-- sous-représentées (4 retenus) et Golfe, Afrique, Europe de l'Est (7 proposés, 1 retenu). Les autres
-- n'avaient qu'une page lue (403, extraits de recherche) ou une source de 2018 : Kempinski Cairo, Villa Rosa
-- Nairobi, Aficionado Room et Cigarro (Varsovie), Budapest Cigar Lounge (pays à créer), Bohemia Lounge (Doha,
-- bandeau de rénovation). Écartés : Casa de Montecristo Washington (patio seulement), Churchill Bar Denver (2018).
-- 1. Cuban Creations (La Nouvelle-Orléans) : trois sources lues dont deux de 2026, confirmé.
--    The King Cigar Lounge (Los Angeles), Elite Cigar Cafe (Addison, Texas), Stanza dei Sigari (Boston) et
--    Blue Cigar (Raffles Doha) restent « à vérifier » : seule date récente = copyright ou page sans date.
-- 2. Descriptions courtes, traduites dans les cinq autres langues, sceaux remis (machine).
-- Photos : lancer php tools/placeholders.php --tout depuis ~/public_html.
-- ════════════════════════════════════════════════════════

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2635, 'usa', 'Cuban Creations Cigar Bar', 'La Nouvelle-Orléans — 533 Toulouse Street, New Orleans, LA 70130', 'Cigar Bar', NULL, 'https://cigarbarnola.com/',
  'relu le 31 octobre 2026 : themanual.com, 2 octobre 2026 : « French Quarter''s only cigar lounge, 533 Toulouse » ; cigarbarnola.com, 16 septembre 2026 : « 533 Toulouse St., (504) 372-4838 » ; cigaraficionado.com, 9 mai 2022 : « full-service cigar bar off Jackson Square »', 1,
  'Cuban Creations Cigar Bar, à La Nouvelle-Orléans : un bar où l''on fume le cigare.',
  'Cuban Creations Cigar Bar, in La Nouvelle-Orléans: a bar where cigars are smoked.',
  'Cuban Creations Cigar Bar, en La Nouvelle-Orléans: un bar donde se fuma puro.',
  'Cuban Creations Cigar Bar, La Nouvelle-Orléans: eine Bar, in der Zigarre geraucht wird.',
  'Cuban Creations Cigar Bar,位于La Nouvelle-Orléans:可以抽雪茄的酒吧。',
  'Cuban Creations Cigar Bar، في La Nouvelle-Orléans: بار يُدخَّن فيه السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2635 OR (`country_id` = 'usa' AND `name` = 'Cuban Creations Cigar Bar'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 545, 2635, 'placeholder_2635.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2635 AND `name` = 'Cuban Creations Cigar Bar') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2635);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2636, 'usa', 'The King Cigar Lounge', 'Los Angeles — 1117 S. Hope Street, Los Angeles, CA 90015', 'Cigar Lounge', '213-205-8222', 'https://thekingcigarlounge.com/',
  'à vérifier — relu le 31 octobre 2026 : thekingcigarlounge.com, 2024 : « 1117 S. Hope Street, Los Angeles, CA 90015 » ; cigaraficionado.com, 8 janvier 2020 : « public and private smoking areas »', 1,
  'The King Cigar Lounge, à Los Angeles : un salon où l''on peut fumer le cigare.',
  'The King Cigar Lounge, in Los Angeles: a lounge where you can smoke a cigar.',
  'The King Cigar Lounge, en Los Angeles: un salón donde se puede fumar un puro.',
  'The King Cigar Lounge, Los Angeles: eine Lounge, in der man Zigarre rauchen kann.',
  'The King Cigar Lounge,位于Los Angeles:可以抽雪茄的雪茄吧。',
  'The King Cigar Lounge، في Los Angeles: صالة يمكن فيها تدخين السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2636 OR (`country_id` = 'usa' AND `name` = 'The King Cigar Lounge'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 546, 2636, 'placeholder_2636.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2636 AND `name` = 'The King Cigar Lounge') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2636);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2637, 'usa', 'Elite Cigar Cafe', 'Dallas (Addison) — 4291 Belt Line Rd., Addison, TX 75001', 'Cigar Lounge', NULL, 'https://www.elitecigarcafe.com/',
  'à vérifier — relu le 31 octobre 2026 : elitecigarcafe.com, 2025 : « bar and lounge ... premium cigars and drinks » ; thegentlemansjournal.com, non datée : « Elite Cigar Cafe, Dallas lounge »', 1,
  'Elite Cigar Cafe, à Dallas : un salon où l''on peut fumer le cigare.',
  'Elite Cigar Cafe, in Dallas: a lounge where you can smoke a cigar.',
  'Elite Cigar Cafe, en Dallas: un salón donde se puede fumar un puro.',
  'Elite Cigar Cafe, Dallas: eine Lounge, in der man Zigarre rauchen kann.',
  'Elite Cigar Cafe,位于Dallas:可以抽雪茄的雪茄吧。',
  'Elite Cigar Cafe، في Dallas: صالة يمكن فيها تدخين السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2637 OR (`country_id` = 'usa' AND `name` = 'Elite Cigar Cafe'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 547, 2637, 'placeholder_2637.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2637 AND `name` = 'Elite Cigar Cafe') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2637);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2638, 'usa', 'Stanza dei Sigari', 'Boston — 292 Hanover Street, Boston, MA 02113', 'Cigar Shop & Lounge', '617-227-0295', 'https://www.stanzadeisigari.com',
  'à vérifier — relu le 31 octobre 2026 : stanzadeisigari.com, 2026 : « Premium cigars, $15 cutting fee, 21+ » ; timeout.com, 24 septembre 2021 : « Choose a premium cigar to pair with bourbon »', 1,
  'Stanza dei Sigari, à Boston : une boutique de cigares avec un salon où fumer.',
  'Stanza dei Sigari, in Boston: a cigar shop with a lounge for smoking.',
  'Stanza dei Sigari, en Boston: una tienda de puros con un salón para fumar.',
  'Stanza dei Sigari, Boston: ein Zigarrenfachgeschäft mit Raucher-Lounge.',
  'Stanza dei Sigari,位于Boston:设有吸烟休息室的雪茄店。',
  'Stanza dei Sigari، في Boston: متجر سيجار مع صالة للتدخين.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2638 OR (`country_id` = 'usa' AND `name` = 'Stanza dei Sigari'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 548, 2638, 'placeholder_2638.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2638 AND `name` = 'Stanza dei Sigari') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2638);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2639, 'qatar', 'Blue Cigar — Raffles Doha', 'Doha (Lusail) — Raffles Doha, Marina East Street, Lusail Marina District', 'Hotel Cigar Bar', '+974 4030 7070', 'https://www.raffles.com/doha/dining/blue-cigar',
  'à vérifier — relu le 31 octobre 2026 : raffles.com, 31 octobre 2026 : « Blue Cigar Lounge (Writer''s Lounge), tous les jours 17h-01h » ; elitetraveler.com, 26 février 2023 : « cigar lounge that also serves as a library, 22 cigar lines »', 1,
  'Blue Cigar — Raffles Doha, à Doha : un hôtel dont le bar ou le salon accueille les amateurs de cigares.',
  'Blue Cigar — Raffles Doha, in Doha: a hotel whose bar or lounge welcomes cigar smokers.',
  'Blue Cigar — Raffles Doha, en Doha: un hotel cuyo bar o salón recibe a los aficionados a los puros.',
  'Blue Cigar — Raffles Doha, Doha: ein Hotel, dessen Bar oder Lounge Zigarrenliebhaber willkommen heißt.',
  'Blue Cigar — Raffles Doha,位于Doha:酒店的酒吧或休息室欢迎抽雪茄的客人。',
  'Blue Cigar — Raffles Doha، في Doha: فندق يستقبل بار أو صالة عشاق السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2639 OR (`country_id` = 'qatar' AND `name` = 'Blue Cigar — Raffles Doha'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 549, 2639, 'placeholder_2639.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2639 AND `name` = 'Blue Cigar — Raffles Doha') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2639);

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'lounges', l.`id`, 'description', g.lang, SHA1(l.`description`), 'machine', NOW()
  FROM `lounges` l
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de' UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') g
 WHERE l.`id` BETWEEN 2635 AND 2639
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `statut` = 'machine', `maj` = NOW();

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 313';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 313', 'systeme', 'fiche_ajoutee', 'systeme', 0, 'Villes americaines et Qatar : 5 fiches ajoutees (#2635 a #2639), lues le 31 octobre 2026');

-- Contrôle : des 1 partout.
SELECT
  (SELECT COUNT(*) FROM `lounges` WHERE `id` BETWEEN 2635 AND 2639) = 5 AS `fiches_ajoutees`,
  (SELECT COUNT(*) FROM `lounge_photos` WHERE `lounge_id` BETWEEN 2635 AND 2639) = 5 AS `photos`,
  (SELECT COUNT(*) FROM `translation_status` WHERE `entite` = 'lounges' AND `champ` = 'description' AND `entite_id` BETWEEN '2635' AND '2639' AND `statut` = 'machine') >= 25 AS `sceaux_remis`;
