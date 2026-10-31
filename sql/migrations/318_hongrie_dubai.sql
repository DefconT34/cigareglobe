-- ════════════════════════════════════════════════════════
-- 318 — Hongrie (nouveau pays) et 3 fiches (#2641 à #2643)
-- ────────────────────────────────────────────────────────
-- CE QU'ON A TROUVÉ (31 octobre 2026). Deux agents ont instruit des pistes précises : Europe-Orient (1 retenu sur 12 pistes) et
-- Amériques-villes du monde (2 retenus sur 17). Retenus : Budapest Cigar Lounge (site du salon, Cigar Journal du 17 avril 2025 :
-- ouvert fin 2024, deux sources lues dont une datée : confirmé ; la Hongrie est créée), The Cigar Bar du Fairmont Dubai et
-- The Cigar Lounge d'Address Downtown (Engel & Völkers du 24 février 2026 plus la page de l'hôtel ou un annuaire : « à vérifier »,
-- horaires laissés vides, accès au bar du Fairmont à confirmer).
-- Écartés faute de deux sources lues dont une de 2024-2026 : Villa Rosa Nairobi, Aficionado Room et Cigarro (Varsovie), Bohemia
-- (Doha), Anantara Palais Hansen (Vienne), Augusto (Oslo, le site ne mentionne aucun salon), Marriott Amman, PedroPortia
-- (Johannesburg, profil rédigé par l'entreprise), Curaçao, Bahamas, Nouvelle-Zélande, Singapour, Istanbul, Le Cap, Marrakech.
-- Photos : lancer php tools/placeholders.php --tout depuis ~/public_html.
-- ════════════════════════════════════════════════════════

INSERT INTO `lounge_countries` (`id`, `name`, `flag`, `lat`, `lon`, `color`, `iso_code`)
SELECT 'hungary', 'Hongrie', CONVERT(UNHEX('F09F87ADF09F87BA') USING utf8mb4), 47.1625, 19.5033, '#8B2BE2', 'HU' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `lounge_countries` WHERE `id` = 'hungary');

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2641, 'hungary', 'Budapest Cigar Lounge', 'Budapest — Szinyei Merse Pál utca 17, 1063 Budapest', 'Cigar Lounge', '+36 30 681 6409', 'https://budapestcigarlounge.com',
  'relu le 31 octobre 2026 : budapestcigarlounge.com, 2026 : « the only Cigar Lounge in Budapest ; formulaire de réservation » ; cigarjournal.com, 17 avril 2025 : « Opened at the end of 2024 ; Szinyei Merse Pál utca 17 »', 1,
  'Budapest Cigar Lounge, à Budapest : un salon où l''on peut fumer le cigare.',
  'Budapest Cigar Lounge, in Budapest: a lounge where you can smoke a cigar.',
  'Budapest Cigar Lounge, en Budapest: un salón donde se puede fumar un puro.',
  'Budapest Cigar Lounge, Budapest: eine Lounge, in der man Zigarre rauchen kann.',
  'Budapest Cigar Lounge,位于Budapest:可以抽雪茄的雪茄吧。',
  'Budapest Cigar Lounge، في Budapest: صالة يمكن فيها تدخين السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2641 OR (`country_id` = 'hungary' AND `name` = 'Budapest Cigar Lounge'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 551, 2641, 'placeholder_2641.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2641 AND `name` = 'Budapest Cigar Lounge') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2641);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2642, 'uae', 'The Cigar Bar — Fairmont Dubai', 'Dubai — Fairmont Dubai, Sheikh Zayed Road, Dubai', 'Hotel Cigar Bar', NULL, 'https://www.fairmont.com/en/hotels/dubai/fairmont-dubai/dining/the-cigar-bar.html',
  'à vérifier — relu le 31 octobre 2026 : fairmont.com, 2026 : « walk-in humidor ... private cigar lockers » ; engelvoelkers.com, 24 février 2026 : « warm mahogany interiors and traditional club atmosphere »', 1,
  'The Cigar Bar — Fairmont Dubai, à Dubai : un hôtel dont le bar ou le salon accueille les amateurs de cigares.',
  'The Cigar Bar — Fairmont Dubai, in Dubai: a hotel whose bar or lounge welcomes cigar smokers.',
  'The Cigar Bar — Fairmont Dubai, en Dubai: un hotel cuyo bar o salón recibe a los aficionados a los puros.',
  'The Cigar Bar — Fairmont Dubai, Dubai: ein Hotel, dessen Bar oder Lounge Zigarrenliebhaber willkommen heißt.',
  'The Cigar Bar — Fairmont Dubai,位于Dubai:酒店的酒吧或休息室欢迎抽雪茄的客人。',
  'The Cigar Bar — Fairmont Dubai، في Dubai: فندق يستقبل بار أو صالة عشاق السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2642 OR (`country_id` = 'uae' AND `name` = 'The Cigar Bar — Fairmont Dubai'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 552, 2642, 'placeholder_2642.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2642 AND `name` = 'The Cigar Bar — Fairmont Dubai') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2642);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2643, 'uae', 'The Cigar Lounge — Address Downtown', 'Dubai — 6e étage, Address Downtown, Downtown Dubai', 'Hotel Cigar Bar', NULL, NULL,
  'à vérifier — relu le 31 octobre 2026 : engelvoelkers.com, 24 février 2026 : « Location: 6th Floor, Address Downtown » ; eatapp.co, non datée : « humidor with signature and limited-edition cigars »', 1,
  'The Cigar Lounge — Address Downtown, à Dubai : un hôtel dont le bar ou le salon accueille les amateurs de cigares.',
  'The Cigar Lounge — Address Downtown, in Dubai: a hotel whose bar or lounge welcomes cigar smokers.',
  'The Cigar Lounge — Address Downtown, en Dubai: un hotel cuyo bar o salón recibe a los aficionados a los puros.',
  'The Cigar Lounge — Address Downtown, Dubai: ein Hotel, dessen Bar oder Lounge Zigarrenliebhaber willkommen heißt.',
  'The Cigar Lounge — Address Downtown,位于Dubai:酒店的酒吧或休息室欢迎抽雪茄的客人。',
  'The Cigar Lounge — Address Downtown، في Dubai: فندق يستقبل بار أو صالة عشاق السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2643 OR (`country_id` = 'uae' AND `name` = 'The Cigar Lounge — Address Downtown'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 553, 2643, 'placeholder_2643.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2643 AND `name` = 'The Cigar Lounge — Address Downtown') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2643);

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'lounges', l.`id`, 'description', g.lang, SHA1(l.`description`), 'machine', NOW()
  FROM `lounges` l
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de' UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') g
 WHERE l.`id` BETWEEN 2641 AND 2643
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `statut` = 'machine', `maj` = NOW();

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 318';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 318', 'systeme', 'fiche_ajoutee', 'systeme', 0, 'Hongrie creee, 3 fiches ajoutees (#2641 a #2643), lues le 31 octobre 2026');

-- Contrôle : des 1 partout.
SELECT
  (SELECT COUNT(*) FROM `lounge_countries` WHERE `id` = 'hungary') = 1 AS `pays`,
  (SELECT COUNT(*) FROM `lounges` WHERE `id` BETWEEN 2641 AND 2643) = 3 AS `fiches_ajoutees`,
  (SELECT COUNT(*) FROM `lounge_photos` WHERE `lounge_id` BETWEEN 2641 AND 2643) = 3 AS `photos`,
  (SELECT COUNT(*) FROM `translation_status` WHERE `entite` = 'lounges' AND `champ` = 'description' AND `entite_id` BETWEEN '2641' AND '2643' AND `statut` = 'machine') >= 15 AS `sceaux_remis`;
