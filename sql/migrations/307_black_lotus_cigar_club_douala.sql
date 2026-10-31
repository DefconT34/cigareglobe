-- ════════════════════════════════════════════════════════
-- 307 — Nouvelle fiche : Black Lotus Cigar Club, Douala (#2581)
-- ────────────────────────────────────────────────────────
-- CE QU'ON A TROUVÉ (31 octobre 2026). habanos.com (page lue) liste Black Lotus Cigar
-- Club, Rue Tokoto, Bonapriso, Douala, comme Habanos Specialist ; un annuaire non daté
-- (cameroun-plus.com) donne le même téléphone et décrit un cigar bar façon club anglais.
-- Une seule source officielle, aucune presse datée, ouverture actuelle non confirmée :
-- la fiche entre « à vérifier » (badge visible). Aucun numéro de rue publié : non inscrit.
-- Description traduite dans les cinq autres langues, sceaux remis (machine).
-- Photo : l'espace réservé uploads/lounges/2581/placeholder_2581.jpg est à téléverser.
-- ════════════════════════════════════════════════════════
INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2581, 'cameroon', 'Black Lotus Cigar Club', 'Douala — Rue Tokoto, Bonapriso', 'Cigar Bar & Habanos Specialist', '+237 696 116 373', 'http://www.blacklotuscigarclub.com',
  'à vérifier — relu le 31 octobre 2026 : habanos.com, page Black Lotus Cigar Club (Habanos Specialist, Rue Tokoto, Bonapriso, Douala) ; cameroun-plus.com, annuaire non daté (même téléphone, cigar bar) ; ni presse datée ni horaires, ouverture actuelle non confirmée', 1,
  'Cigar bar de Bonapriso, à Douala, inspiré des clubs de gentlemen anglais : un club, un lounge bar et un coin privé dédié aux cognacs et cigares de luxe. Référencé comme Habanos Specialist sur habanos.com.',
  'Cigar bar in Bonapriso, Douala, modelled on English gentlemen''s clubs: a club, a lounge bar and a private corner devoted to cognacs and luxury cigars. Listed as a Habanos Specialist on habanos.com.',
  'Cigar bar de Bonapriso, en Douala, inspirado en los clubes de caballeros ingleses: un club, un lounge bar y un rincón privado dedicado a los coñacs y los cigarros de lujo. Figura como Habanos Specialist en habanos.com.',
  'Zigarrenbar in Bonapriso, Douala, nach dem Vorbild englischer Gentlemen''s Clubs: ein Club, eine Lounge-Bar und eine private Ecke für Cognacs und Luxuszigarren. Auf habanos.com als Habanos Specialist geführt.',
  '位于杜阿拉(Douala)博纳普里索(Bonapriso)的雪茄吧,以英式绅士俱乐部为蓝本:设有俱乐部、酒廊吧和专供干邑与高档雪茄的私人角落。在 habanos.com 上被列为 Habanos Specialist。',
  'بار سيجار في بوناپريسو بمدينة دوالا، على طراز نوادي النبلاء الإنجليزية: نادٍ وبار صالة وركن خاص مخصص للكونياك والسيجار الفاخر. مُدرج كـ Habanos Specialist على موقع habanos.com.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2581);

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 491, 2581, 'placeholder_2581.jpg', 1, 1, 'admin', 1, NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2581);

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'lounges', l.`id`, 'description', g.lang, SHA1(l.`description`), 'machine', NOW()
  FROM `lounges` l
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de' UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') g
 WHERE l.`id` = 2581
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `statut` = 'machine', `maj` = NOW();

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 307';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 307', 'systeme', 'fiche_ajoutee', 'lounge', 2581, 'Black Lotus Cigar Club (Douala) - habanos.com, cameroun-plus.com, lus le 31 octobre 2026, a verifier');

-- Contrôle : des 1 partout.
SELECT
  (SELECT COUNT(*) FROM `lounges` WHERE `id` = 2581 AND `country_id` = 'cameroon') = 1 AS `fiche_ajoutee`,
  (SELECT COUNT(*) FROM `translation_status` WHERE `entite` = 'lounges' AND `champ` = 'description' AND `entite_id` = '2581' AND `statut` = 'machine') = 5 AS `sceaux_remis`;
