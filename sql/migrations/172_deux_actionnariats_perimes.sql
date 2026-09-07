-- ════════════════════════════════════════════════════════
-- 172 — Deux actionnariats périmés depuis octobre 2020
-- ────────────────────────────────────────────────────────
-- TROUVÉ EN PRÉPARANT LES JUMELLES NON CUBAINES, et servi depuis
-- presque six ans. L'atlas affirme deux fois qu'Imperial Brands
-- possède ce qu'il a vendu.
--
-- ── LE FAIT ──────────────────────────────────────────────
-- En avril 2020, Imperial Brands a cédé la TOTALITÉ de sa division
-- cigares premium pour environ 1,3 milliard de dollars, en deux lots.
-- La vente a été bouclée le 29 OCTOBRE 2020.
--
--   · Gemstone Investment Holding Ltd. a repris Tabacalera USA et
--     ALTADIS USA — la distribution du cigare premium aux États-Unis —
--     ainsi que JR Cigar, Serious Cigars, Cigars.com et la chaîne Casa
--     de Montecristo.
--   · Allied Cigar Corporation S.L. a repris le reste du monde, ce qui
--     comprend LA MOITIÉ D'HABANOS S.A. que détenait Imperial.
--
-- Source : cigaraficionado.com, « Imperial Completes $1.44 Billion Sale
-- Of Premium Cigar Business » ; imperialbrandsplc.com, annonce « Sale
-- of Worldwide Premium Cigar Business » ; halfwheel.com.
--
-- ── CE QUE L'ATLAS DISAIT ────────────────────────────────
-- 1. `habanos_presence.ownership` pour Cuba, DANS LES SIX LANGUES :
--    « État cubain (50%) + Imperial Brands PLC (50%) ». Cette moitié
--    appartient à Allied Cigar Corporation depuis octobre 2020. La
--    phrase est rendue sur la page de Cuba, la plus lue de l'atlas.
--
-- 2. La fiche Romeo y Julieta USA, dans les six langues : « Altadis USA
--    (aujourd'hui Imperial Brands) ». C'est l'inverse : Altadis USA
--    n'est plus d'Imperial, elle est de Gemstone.
--
-- ── POURQUOI ÇA N'A PAS ÉTÉ VU ───────────────────────────
-- Aucun contrôle ne peut voir ceci. `marques_check` vérifie qu'une
-- affirmation est SOURÇABLE, pas qu'elle est encore vraie ; les
-- contrôles i18n comparent les langues entre elles, et les six
-- disaient la même chose fausse. Un fait daté ne se démode pas d'un
-- coup : il reste juste, puis il devient faux sans rien changer à sa
-- forme.
--
-- On écrit donc la DATE avec le fait, partout où c'est possible. Un
-- actionnariat sans date se relit dans dix ans comme s'il était
-- d'aujourd'hui.
--
-- Après cette migration :
--   php tools/contenu_dump.php
--   php tools/i18n_dump.php > sql/traductions.sql
-- ════════════════════════════════════════════════════════

UPDATE `habanos_presence` SET
  `ownership`    = 'État cubain (50 %) + Allied Cigar Corporation S.L. (50 %, depuis 2020)',
  `ownership_en` = 'Cuban state (50%) + Allied Cigar Corporation S.L. (50%, since 2020)',
  `ownership_es` = 'Estado cubano (50 %) + Allied Cigar Corporation S.L. (50 %, desde 2020)',
  `ownership_de` = 'Kubanischer Staat (50 %) + Allied Cigar Corporation S.L. (50 %, seit 2020)',
  `ownership_zh` = '古巴政府（50%）+ Allied Cigar Corporation S.L.（50%，2020 年起）',
  `ownership_ar` = 'الدولة الكوبية (50٪) + شركة Allied Cigar Corporation S.L. (50٪، منذ 2020)'
 WHERE `country_id` = 'cuba';

UPDATE `brands` SET
  `history`    = REPLACE(`history`,
    'Altadis USA (aujourd''hui Imperial Brands) détient les droits américains',
    'Altadis USA — passée d''Imperial Brands à Gemstone Investment Holding en octobre 2020 — détient les droits américains'),
  `history_en` = REPLACE(`history_en`,
    'Altadis USA (now Imperial Brands) holds the American rights',
    'Altadis USA — sold by Imperial Brands to Gemstone Investment Holding in October 2020 — holds the American rights'),
  `history_es` = REPLACE(`history_es`,
    'Altadis USA (hoy Imperial Brands) posee los derechos estadounidenses',
    'Altadis USA —vendida por Imperial Brands a Gemstone Investment Holding en octubre de 2020— posee los derechos estadounidenses'),
  `history_de` = REPLACE(`history_de`,
    'Altadis USA (heute Imperial Brands) hält die amerikanischen Rechte',
    'Altadis USA — im Oktober 2020 von Imperial Brands an Gemstone Investment Holding verkauft — hält die amerikanischen Rechte'),
  `history_zh` = REPLACE(`history_zh`,
    'Altadis USA（今属 Imperial Brands）持有',
    'Altadis USA（2020 年 10 月由 Imperial Brands 售予 Gemstone Investment Holding）持有'),
  `history_ar` = REPLACE(`history_ar`,
    'تملك Altadis USA (وهي اليوم ضمن Imperial Brands) الحقوق الأمريكية',
    'تملك Altadis USA — التي باعتها Imperial Brands إلى Gemstone Investment Holding في أكتوبر 2020 — الحقوق الأمريكية'),
  `updated_at` = NOW()
 WHERE `name` = 'Romeo y Julieta USA';

-- ── Les sceaux, recalculés depuis les colonnes ───────────
UPDATE `translation_status` t
  JOIN `brands` b ON b.`name` = t.`entite_id`
   SET t.`source_hash` = SHA1(b.`history`), t.`statut` = 'machine', t.`maj` = NOW()
 WHERE t.`entite` = 'brands' AND t.`champ` = 'history' AND t.`entite_id` = 'Romeo y Julieta USA';

UPDATE `translation_status` t
  JOIN `habanos_presence` h ON h.`country_id` = t.`entite_id`
   SET t.`source_hash` = SHA1(h.`ownership`), t.`statut` = 'machine', t.`maj` = NOW()
 WHERE t.`entite` = 'habanos_presence' AND t.`champ` = 'ownership' AND t.`entite_id` = 'cuba';

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 172','systeme','actionnariat_perime','pays',0,
   'la page de Cuba affirmait dans les SIX LANGUES « Etat cubain (50%) + Imperial Brands PLC (50%) ». Imperial a cede la totalite de sa division cigares premium en 2020, vente bouclee le 29 octobre : la moitie d Habanos est allee a Allied Cigar Corporation S.L. La phrase etait fausse depuis presque six ans, sur la page la plus lue de l atlas'),
  (NULL,'migration 172','systeme','actionnariat_perime','marque',0,
   'la fiche Romeo y Julieta USA disait « Altadis USA (aujourd hui Imperial Brands) » — l inverse du fait. Altadis USA a ete reprise par Gemstone Investment Holding Ltd. avec Tabacalera USA, JR Cigar, Serious Cigars, Cigars.com et la chaine Casa de Montecristo'),
  (NULL,'migration 172','systeme','angle_mort_des_controles','systeme',0,
   'AUCUN CONTROLE NE POUVAIT VOIR CECI. marques_check verifie qu une affirmation est SOURCABLE, pas qu elle est encore VRAIE ; les controles i18n comparent les langues entre elles, et les six disaient la meme chose fausse. Un fait date ne se demode pas d un coup : il reste juste, puis devient faux sans rien changer a sa forme. On ecrit donc la DATE avec le fait — un actionnariat sans date se relit dans dix ans comme s il etait d aujourd hui');
