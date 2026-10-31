-- ════════════════════════════════════════════════════════
-- 309 — 3 nouvelles fiches allemandes (#2611 à #2613)
-- ────────────────────────────────────────────────────────
-- CE QU'ON A TROUVÉ (31 octobre 2026). L'agent du premier lot a trouvé trois lieux allemands absents de la base, tous « à vérifier » : Kempinski Cigar Lounge (Munich, ouvert en 2018), Breidenbacher Hof (Düsseldorf, hôtel devenu Capella) et Handelshof (Leipzig, source de 2022). Écartés : Mephisto Bar (plus bar que salon cigares). Descriptions courtes, six langues, sceaux « machine ».
-- Photos : uploads/lounges/<id>/placeholder_<id>.jpg à téléverser sur le serveur.
-- ════════════════════════════════════════════════════════

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2611, 'germany', 'Kempinski Cigar Lounge by Zechbauer (Hotel Vier Jahreszeiten Kempinski)', 'München — Hotel Vier Jahreszeiten Kempinski, Maximilianstraße', 'Hotel Cigar Bar', '+49 89 2125 1745', 'https://www.kempinski.com/en/munich/hotel-vier-jahreszeiten/dining/kempinski-cigar-lounge-by-zechbauer/',
  'à vérifier — relu le 31 octobre 2026 : hotelsmag.com, 24 juillet 2019 : « Kempinski Cigar Lounge by Zechbauer opened in August 2018 » ; kempinski.com, © 2026 : « Finest cigars & the exclusive ambience of a British gentlemen''s club »', 1,
  'Kempinski Cigar Lounge by Zechbauer (Hotel Vier Jahreszeiten Kempinski), à München : un hôtel dont le bar ou le salon accueille les amateurs de cigares.',
  'Kempinski Cigar Lounge by Zechbauer (Hotel Vier Jahreszeiten Kempinski), in München: a hotel whose bar or lounge welcomes cigar smokers.',
  'Kempinski Cigar Lounge by Zechbauer (Hotel Vier Jahreszeiten Kempinski), en München: un hotel cuyo bar o salón recibe a los aficionados a los puros.',
  'Kempinski Cigar Lounge by Zechbauer (Hotel Vier Jahreszeiten Kempinski), München: ein Hotel, dessen Bar oder Lounge Zigarrenliebhaber willkommen heißt.',
  'Kempinski Cigar Lounge by Zechbauer (Hotel Vier Jahreszeiten Kempinski),位于München:酒店的酒吧或休息室欢迎抽雪茄的客人。',
  'Kempinski Cigar Lounge by Zechbauer (Hotel Vier Jahreszeiten Kempinski)، في München: فندق يستقبل بار أو صالة عشاق السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2611 OR (`country_id` = 'germany' AND `name` = 'Kempinski Cigar Lounge by Zechbauer (Hotel Vier Jahreszeiten Kempinski)'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 521, 2611, 'placeholder_2611.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2611 AND `name` = 'Kempinski Cigar Lounge by Zechbauer (Hotel Vier Jahreszeiten Kempinski)') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2611);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2612, 'germany', 'Bar & Smokers Lounge - Breidenbacher Hof (Capella)', 'Düsseldorf — Königsallee 11, 40212 Düsseldorf', 'Hotel Cigar Bar', '+49 211 160900', 'https://www.visitduesseldorf.de/en/poi/detail/breidenbacher-hof-bar-smoking-lounge-0c8330d7c3',
  'à vérifier — relu le 31 octobre 2026 : visitduesseldorf.de, non datée : « A smoking lounge with a walk-in humidor and a selection of over… » ; enprimeurclub.com, 28 septembre 2026 : « a separate cigar lounge » ; luxaterra.com, © 2026 : « Choose from one of the 124 Cuban and Dominican Cigars on offer in… »', 1,
  'Bar & Smokers Lounge - Breidenbacher Hof (Capella), à Düsseldorf : un hôtel dont le bar ou le salon accueille les amateurs de cigares.',
  'Bar & Smokers Lounge - Breidenbacher Hof (Capella), in Düsseldorf: a hotel whose bar or lounge welcomes cigar smokers.',
  'Bar & Smokers Lounge - Breidenbacher Hof (Capella), en Düsseldorf: un hotel cuyo bar o salón recibe a los aficionados a los puros.',
  'Bar & Smokers Lounge - Breidenbacher Hof (Capella), Düsseldorf: ein Hotel, dessen Bar oder Lounge Zigarrenliebhaber willkommen heißt.',
  'Bar & Smokers Lounge - Breidenbacher Hof (Capella),位于Düsseldorf:酒店的酒吧或休息室欢迎抽雪茄的客人。',
  'Bar & Smokers Lounge - Breidenbacher Hof (Capella)، في Düsseldorf: فندق يستقبل بار أو صالة عشاق السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2612 OR (`country_id` = 'germany' AND `name` = 'Bar & Smokers Lounge - Breidenbacher Hof (Capella)'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 522, 2612, 'placeholder_2612.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2612 AND `name` = 'Bar & Smokers Lounge - Breidenbacher Hof (Capella)') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2612);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2613, 'germany', 'Smokers'' Lounge - Steigenberger Icon Grandhotel Handelshof', 'Leipzig — Salzgässchen 6, 04109 Leipzig', 'Hotel Cigar Bar', '+49 341 350581-970', 'https://www.gcb.de/en/why-germany/gcb-partners/the-gcb-network/steigenberger-icon-grandhotel-handelshof/',
  'à vérifier — relu le 31 octobre 2026 : develop.cigarjournal.com, 8 août 2022 : « Brown, comfortable leather cube seats » ; gcb.de, non datée : « Smoker''s Lounge with an exquisite selection of high-quality cigars… »', 1,
  'Smokers'' Lounge - Steigenberger Icon Grandhotel Handelshof, à Leipzig : un hôtel dont le bar ou le salon accueille les amateurs de cigares.',
  'Smokers'' Lounge - Steigenberger Icon Grandhotel Handelshof, in Leipzig: a hotel whose bar or lounge welcomes cigar smokers.',
  'Smokers'' Lounge - Steigenberger Icon Grandhotel Handelshof, en Leipzig: un hotel cuyo bar o salón recibe a los aficionados a los puros.',
  'Smokers'' Lounge - Steigenberger Icon Grandhotel Handelshof, Leipzig: ein Hotel, dessen Bar oder Lounge Zigarrenliebhaber willkommen heißt.',
  'Smokers'' Lounge - Steigenberger Icon Grandhotel Handelshof,位于Leipzig:酒店的酒吧或休息室欢迎抽雪茄的客人。',
  'Smokers'' Lounge - Steigenberger Icon Grandhotel Handelshof، في Leipzig: فندق يستقبل بار أو صالة عشاق السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2613 OR (`country_id` = 'germany' AND `name` = 'Smokers'' Lounge - Steigenberger Icon Grandhotel Handelshof'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 523, 2613, 'placeholder_2613.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2613 AND `name` = 'Smokers'' Lounge - Steigenberger Icon Grandhotel Handelshof') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2613);

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'lounges', l.`id`, 'description', g.lang, SHA1(l.`description`), 'machine', NOW()
  FROM `lounges` l
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de' UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') g
 WHERE l.`id` BETWEEN 2611 AND 2613
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `statut` = 'machine', `maj` = NOW();

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 309';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 309', 'systeme', 'fiche_ajoutee', 'systeme', 0, 'Allemagne : 3 fiches ajoutees (#2611 a #2613), lues le 31 octobre 2026');

-- Contrôle : des 1 partout.
SELECT
  (SELECT COUNT(*) FROM `lounges` WHERE `id` BETWEEN 2611 AND 2613) = 3 AS `fiches_ajoutees`,
  (SELECT COUNT(*) FROM `lounge_photos` WHERE `lounge_id` BETWEEN 2611 AND 2613) = 3 AS `photos`,
  (SELECT COUNT(*) FROM `translation_status` WHERE `entite` = 'lounges' AND `champ` = 'description' AND `entite_id` BETWEEN '2611' AND '2613' AND `statut` = 'machine') >= 15 AS `sceaux_remis`;
