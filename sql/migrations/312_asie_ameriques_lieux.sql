-- ════════════════════════════════════════════════════════
-- 312 — 5 nouvelles fiches (#2630 à #2634) et deux lieux confirmés
-- ────────────────────────────────────────────────────────
-- CE QU'ON A TROUVÉ (31 octobre 2026). Deux agents ont cherché des lieux absents de la base :
-- Asie-Pacifique (4 retenus) et Amériques-Caraïbes (2 retenus, dont le Fort Nassau des Bahamas, écarté :
-- deux pages du même office de tourisme, non datées, et un pays à créer pour un seul lieu).
-- Japon, Chine, Taïwan, Corée, Vietnam, Nouvelle-Zélande, Philippines, Brésil, Pérou, Panama, Jamaïque,
-- Argentine, Colombie, Costa Rica, Porto Rico, Trinité : aucune seconde source datée 2024-2026.
-- 1. Club Macanudo Jakarta et Cigar Point (Mexico) ont deux sources lues dont une datée : confirmés.
--    The Ledger Room (Bangkok), El Laguito (Bali) et Club Bar de l'Oberoi (New Delhi) restent « à vérifier ».
--    Téléphones laissés vides (numéros de RSVP ou de pages de 2020).
-- 2. Deux fiches existantes reçoivent leur seconde source : L'Héritage 105 (#28) et Bluesman (#32).
-- 3. Descriptions courtes, traduites dans les cinq autres langues, sceaux remis (machine).
-- Photos : lancer php tools/placeholders.php --tout depuis ~/public_html.
-- ════════════════════════════════════════════════════════

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : lesrestos.com, 27 octobre 2025 : « Cigar Bar ouvert du mardi au samedi, 15 h-2 h » ; privateaser.com, janvier 2026 : « un cigar bar intimiste ; Fumoir ; Cave à cigares »', `updated_at` = NOW()
 WHERE `id` = 28 AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : foodinspace.net, 2 mai 2024 : « Cigar Club à côté du Bluesman, cave à cigares » ; forbestravelguide.com, non datée : « Bluesman Cigar Lounge, leather-clad cigar cellar » ; ouverture saisonnière, état actuel non établi', `updated_at` = NOW()
 WHERE `id` = 32 AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2630, 'thailand', 'The Ledger Room (SKYVIEW Hotel Bangkok)', 'Bangkok — 32e étage, SKYVIEW Hotel, Sukhumvit Soi 24, Khlong Toei', 'Hotel Cigar Bar', NULL, 'https://skyviewhotel.com/bangkok/',
  'à vérifier — relu le 31 octobre 2026 : nationthailand.com, 26 janvier 2026 : « cigar and whiskey bar ... walk-in humidor » ; sustainablefirst.com, 3 mars 2026 : « walk-in humidor; premium cigars; humidor lockers »', 1,
  'The Ledger Room (SKYVIEW Hotel Bangkok), à Bangkok : un hôtel dont le bar ou le salon accueille les amateurs de cigares.',
  'The Ledger Room (SKYVIEW Hotel Bangkok), in Bangkok: a hotel whose bar or lounge welcomes cigar smokers.',
  'The Ledger Room (SKYVIEW Hotel Bangkok), en Bangkok: un hotel cuyo bar o salón recibe a los aficionados a los puros.',
  'The Ledger Room (SKYVIEW Hotel Bangkok), Bangkok: ein Hotel, dessen Bar oder Lounge Zigarrenliebhaber willkommen heißt.',
  'The Ledger Room (SKYVIEW Hotel Bangkok),位于Bangkok:酒店的酒吧或休息室欢迎抽雪茄的客人。',
  'The Ledger Room (SKYVIEW Hotel Bangkok)، في Bangkok: فندق يستقبل بار أو صالة عشاق السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2630 OR (`country_id` = 'thailand' AND `name` = 'The Ledger Room (SKYVIEW Hotel Bangkok)'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 540, 2630, 'placeholder_2630.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2630 AND `name` = 'The Ledger Room (SKYVIEW Hotel Bangkok)') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2630);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2631, 'indonesia', 'Club Macanudo Jakarta', 'Jakarta — 2e étage, Bumi Pakubuwono, Jl. Bumi No. 15, Kebayoran Baru, Jakarta Selatan 12120', 'Cigar Lounge', NULL, NULL,
  'relu le 31 octobre 2026 : whatsnewindonesia.com, 15 mai 2025 : « premium cigars ... two private rooms seat five » ; cigarslover.com, 5 mars 2024 : « smoking lounge, private VIP rooms, retail space »', 1,
  'Club Macanudo Jakarta, à Jakarta : un salon où l''on peut fumer le cigare.',
  'Club Macanudo Jakarta, in Jakarta: a lounge where you can smoke a cigar.',
  'Club Macanudo Jakarta, en Jakarta: un salón donde se puede fumar un puro.',
  'Club Macanudo Jakarta, Jakarta: eine Lounge, in der man Zigarre rauchen kann.',
  'Club Macanudo Jakarta,位于Jakarta:可以抽雪茄的雪茄吧。',
  'Club Macanudo Jakarta، في Jakarta: صالة يمكن فيها تدخين السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2631 OR (`country_id` = 'indonesia' AND `name` = 'Club Macanudo Jakarta'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 541, 2631, 'placeholder_2631.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2631 AND `name` = 'Club Macanudo Jakarta') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2631);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2632, 'indonesia', 'El Laguito Cigar Divan & Bar', 'Seminyak (Bali) — TS Suites, Jl. Nakula No.18, Seminyak, Kuta, Badung, Bali 80361', 'Hotel Cigar Bar', NULL, 'https://el-laguito.id/',
  'à vérifier — relu le 31 octobre 2026 : whatsnewindonesia.com, 23 mai 2025 : « El Laguito Cigar Divan & Bar, TS Suites, Jl. Nakula 18 » ; wanderlog.com, non datée : « Jl. Nakula No.18, Seminyak ; 4,8/127 avis »', 1,
  'El Laguito Cigar Divan & Bar, à Seminyak : un hôtel dont le bar ou le salon accueille les amateurs de cigares.',
  'El Laguito Cigar Divan & Bar, in Seminyak: a hotel whose bar or lounge welcomes cigar smokers.',
  'El Laguito Cigar Divan & Bar, en Seminyak: un hotel cuyo bar o salón recibe a los aficionados a los puros.',
  'El Laguito Cigar Divan & Bar, Seminyak: ein Hotel, dessen Bar oder Lounge Zigarrenliebhaber willkommen heißt.',
  'El Laguito Cigar Divan & Bar,位于Seminyak:酒店的酒吧或休息室欢迎抽雪茄的客人。',
  'El Laguito Cigar Divan & Bar، في Seminyak: فندق يستقبل بار أو صالة عشاق السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2632 OR (`country_id` = 'indonesia' AND `name` = 'El Laguito Cigar Divan & Bar'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 542, 2632, 'placeholder_2632.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2632 AND `name` = 'El Laguito Cigar Divan & Bar') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2632);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2633, 'india', 'The Club Bar & Cigar Lounge (The Oberoi New Delhi)', 'New Delhi — The Oberoi, Dr. Zakir Hussain Marg, New Delhi 110003', 'Hotel Cigar Bar', NULL, 'https://www.oberoihotels.com/hotels-in-delhi/dining/the-club-bar-and-cigar-lounge',
  'à vérifier — relu le 31 octobre 2026 : oberoihotels.com, 2026 : « hand-rolled Cuban cigars ... humidor lockers » ; arrivalguides.com, non datée : « Club Bar, lobby level, The Oberoi »', 1,
  'The Club Bar & Cigar Lounge (The Oberoi New Delhi), à New Delhi : un hôtel dont le bar ou le salon accueille les amateurs de cigares.',
  'The Club Bar & Cigar Lounge (The Oberoi New Delhi), in New Delhi: a hotel whose bar or lounge welcomes cigar smokers.',
  'The Club Bar & Cigar Lounge (The Oberoi New Delhi), en New Delhi: un hotel cuyo bar o salón recibe a los aficionados a los puros.',
  'The Club Bar & Cigar Lounge (The Oberoi New Delhi), New Delhi: ein Hotel, dessen Bar oder Lounge Zigarrenliebhaber willkommen heißt.',
  'The Club Bar & Cigar Lounge (The Oberoi New Delhi),位于New Delhi:酒店的酒吧或休息室欢迎抽雪茄的客人。',
  'The Club Bar & Cigar Lounge (The Oberoi New Delhi)، في New Delhi: فندق يستقبل بار أو صالة عشاق السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2633 OR (`country_id` = 'india' AND `name` = 'The Club Bar & Cigar Lounge (The Oberoi New Delhi)'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 543, 2633, 'placeholder_2633.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2633 AND `name` = 'The Club Bar & Cigar Lounge (The Oberoi New Delhi)') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2633);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2634, 'mexico', 'Cigar Point (Mercado Roma)', 'Mexico — Calle Querétaro 225, 2e étage, Mercado Roma, Roma Norte, 06700', 'Cigar Lounge', NULL, NULL,
  'relu le 31 octobre 2026 : themanual.com, 18 septembre 2026 : « 225 Calle Querétaro, second floor of Mercado Roma » ; cigaraficionado.com, 28 janvier 2020 : « we sell about 70 percent Cuban cigars »', 1,
  'Cigar Point (Mercado Roma), à Mexico : un salon où l''on peut fumer le cigare.',
  'Cigar Point (Mercado Roma), in Mexico: a lounge where you can smoke a cigar.',
  'Cigar Point (Mercado Roma), en Mexico: un salón donde se puede fumar un puro.',
  'Cigar Point (Mercado Roma), Mexico: eine Lounge, in der man Zigarre rauchen kann.',
  'Cigar Point (Mercado Roma),位于Mexico:可以抽雪茄的雪茄吧。',
  'Cigar Point (Mercado Roma)، في Mexico: صالة يمكن فيها تدخين السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2634 OR (`country_id` = 'mexico' AND `name` = 'Cigar Point (Mercado Roma)'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 544, 2634, 'placeholder_2634.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2634 AND `name` = 'Cigar Point (Mercado Roma)') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2634);

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'lounges', l.`id`, 'description', g.lang, SHA1(l.`description`), 'machine', NOW()
  FROM `lounges` l
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de' UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') g
 WHERE l.`id` BETWEEN 2630 AND 2634
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `statut` = 'machine', `maj` = NOW();

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 312';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 312', 'systeme', 'fiche_ajoutee', 'systeme', 0, 'Asie et Ameriques : 5 fiches ajoutees (#2630 a #2634), 2 lieux confirmes (28, 32), lus le 31 octobre 2026');

-- Contrôle : des 1 partout.
SELECT
  (SELECT COUNT(*) FROM `lounges` WHERE `id` BETWEEN 2630 AND 2634) = 5 AS `fiches_ajoutees`,
  (SELECT COUNT(*) FROM `lounge_photos` WHERE `lounge_id` BETWEEN 2630 AND 2634) = 5 AS `photos`,
  (SELECT COUNT(*) FROM `translation_status` WHERE `entite` = 'lounges' AND `champ` = 'description' AND `entite_id` BETWEEN '2630' AND '2634' AND `statut` = 'machine') >= 25 AS `sceaux_remis`,
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (28, 32) AND `source` LIKE 'relu le 31 octobre 2026%') = 2 AS `fiches_confirmees`;
