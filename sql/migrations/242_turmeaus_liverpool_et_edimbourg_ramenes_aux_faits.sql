-- ════════════════════════════════════════════════════════
-- 242 — Turmeaus : Liverpool et Édimbourg ramenés aux faits
-- ────────────────────────────────────────────────────────
-- CE QUI A OUVERT LE CHANTIER. Deux descriptions de salons de C.Gars
-- Ltd, au Royaume-Uni :
--   · Turmeaus — Liverpool (281) : le chinois et l'arabe sont des
--     substitutions machine, du français semé de particules
--     (« 哈瓦那之家 的Liverpool, référence 的Nord 的 ») — i18n_divergence
--     les tenait au cliquet depuis la 239 ; le français et ses trois
--     autres langues finissaient sur un éloge (« l'adresse cigare qui
--     fait autorité dans le nord de l'Angleterre ») ;
--   · Turmeaus — Edinburgh (282) : un éloge dans les six langues (« le
--     premier spécialiste écossais des Habanos, doublé d'une sélection
--     remarquable de single malts » ; 首屈一指 en chinois, أبرز en arabe).
-- La consigne : un français factuel — l'exploitant, l'adresse, la cave,
-- le bar — et cinq traductions refaites.
--
-- CE QUE LA RELECTURE DES SOURCES A TROUVÉ EN PLUS. Écrire les faits
-- demandait de les relire, et ceux des deux fiches tombent avec les
-- éloges :
--   · LIVERPOOL N'A PAS DE CASA DEL HABANO. Le site des Casas de C.Gars
--     Ltd (lcdhcigars.uk) en compte trois : Chester, Knutsford,
--     Édimbourg. L'annuaire habanos.com (lu le 17 septembre 2026) n'en
--     porte aucune à Liverpool et classe la boutique Turmeaus en Habanos
--     Specialist, sous son ancienne adresse de Fenwick Street et avec le
--     même téléphone. Le plan des franchises (30 août 2026) ne tranche
--     pas : trois de ses sept marqueurs britanniques n'ont pas de ville.
--     Une liste officielle et la parole de l'exploitant suffisent (règle
--     du lot 20) : la fiche quitte le type La Casa del Habano pour
--     Cave & Lounge.
--   · Ce qui est à Liverpool : Turmeaus Cigars & Whisky, The Albany
--     Building, 8 Old Hall Street, L3 9PA, 0151 236 3802, cave où l'on
--     entre et salon de dégustation (turmeaus.co.uk, lu le 24 septembre
--     2026 ; la même page situe la boutique Water Street puis Fenwick
--     Street avant l'Albany) ; le bar Puffin Rooms est à la même adresse
--     (puffinrooms.co.uk). Le 11 Castle Street et le +44 151 236 4237 de
--     la fiche : aucune des sources lues ne les porte.
--   · ÉDIMBOURG EST BIEN UNE CASA, AILLEURS QUE LÀ OÙ LA FICHE LA
--     METTAIT : Unit 2, 11 Lister Square, EH3 9GL, dans l'ensemble
--     Quartermile, 0131 285 8082 (lcdhcigars.uk ; cigars.co.uk,
--     localisateur de Hunters & Frankau ; turmeaus.co.uk), ouverte le
--     12 septembre 2023 par C.Gars Ltd (communiqué lacasadelhabano.com du
--     26 septembre 2023) ; cave où l'on entre, terrasse chauffée, bar
--     Puffin Rooms attenant ; toujours active — l'exploitant y annonce
--     des soirées le 20 août et le 22 octobre 2026. Le 35 Frederick
--     Street, la New Town et le +44 131 225 4064 : aucune source lue ne
--     les porte. L'annuaire habanos.com ne la liste pas ; le réseau, son
--     distributeur et son exploitant, si — la source l'écrit.
--   · Le contradicteur proposait pour Liverpool le type Habanos
--     Specialist, celui de l'annuaire : explorer.js range tout type qui
--     contient « habanos » sous La Casa del Habano, ce qui refaisait
--     l'erreur à l'écran. L'annuaire reste nommé dans la source.
--
-- CE QUI RESTE. Les noms : Turmeaus est l'enseigne de C.Gars Ltd, et le
-- nom est la clé des cliquets i18n. Les cartes n'affichent que le nom et
-- la ville : rien à régénérer.
--
-- LES TRADUCTIONS. Refaites dans les cinq langues depuis le nouveau
-- français — noms propres et adresses en caractères latins, ponctuation
-- chinoise pleine chasse —, rescellées depuis la colonne (machine).
-- Faits contredits par expert-cigare, langues relues par
-- expert-traduction (agents), avant cette écriture.
--
-- Rejouable : UPDATE à valeurs absolues, gardés par l'id, le pays et le
-- nom ; sceaux par INSERT … ON DUPLICATE KEY UPDATE.
--
-- Après cette migration :
--   php tools/contenu_dump.php
--   php tools/sources.php --figer
--   retirer à la main les deux clés « Turmeaus — Liverpool » de
--   tools/i18n_divergence_baseline.json (pas de --figer)
-- ════════════════════════════════════════════════════════

-- ── Turmeaus — Liverpool (281) ──
UPDATE `lounges` SET
  `city` = 'Liverpool — The Albany Building, 8 Old Hall Street, L3 9PA',
  `type` = 'Cave & Lounge',
  `phone` = '+44 151 236 3802',
  `source` = 'turmeaus.co.uk, page Turmeaus Liverpool (adresse, téléphone, cave, salon de dégustation ; avant l''Albany, Water Street puis Fenwick Street ; lue le 24 septembre 2026) ; puffinrooms.co.uk (bar, même adresse) ; lcdhcigars.uk : les Casas de C.Gars Ltd sont à Chester, Knutsford et Édimbourg ; habanos.com, place Alfie Turmeaus – Liverpool, Habanos Specialist, à l''ancienne adresse (lu le 17 septembre 2026) — la fiche disait Casa del Habano, 11 Castle Street : aucune source lue ne le porte',
  `description` = 'Turmeaus Cigars & Whisky, boutique de C.Gars Ltd à Liverpool, dans l''Albany Building, au 8 Old Hall Street : cave où l''on entre et salon de dégustation. Dans le même bâtiment, le bar Puffin Rooms sert whiskies et cocktails.',
  `description_en` = 'Turmeaus Cigars & Whisky, C.Gars Ltd''s shop in Liverpool, in the Albany Building at 8 Old Hall Street: walk-in humidor and sampling lounge. In the same building, the Puffin Rooms bar serves whiskies and cocktails.',
  `description_es` = 'Turmeaus Cigars & Whisky, tienda de C.Gars Ltd en Liverpool, en el Albany Building, en el 8 de Old Hall Street: humidor visitable y salón de degustación. En el mismo edificio, el bar Puffin Rooms sirve whiskies y cócteles.',
  `description_de` = 'Turmeaus Cigars & Whisky, das Geschäft von C.Gars Ltd in Liverpool, im Albany Building, 8 Old Hall Street: begehbarer Humidor und Verkostungslounge. Im selben Gebäude schenkt die Bar Puffin Rooms Whiskys und Cocktails aus.',
  `description_zh` = 'Turmeaus Cigars & Whisky 是 C.Gars Ltd 在利物浦的门店，位于 Old Hall Street 8号的 Albany Building 内：设有步入式雪茄保湿室和品鉴室。同一栋楼里的 Puffin Rooms 酒吧供应威士忌和鸡尾酒。',
  `description_ar` = 'Turmeaus Cigars & Whisky، متجر شركة C.Gars Ltd في ليفربول، داخل مبنى Albany Building في 8 Old Hall Street: غرفة ترطيب للسيجار يمكن دخولها وصالة للتذوّق. وفي المبنى نفسه يقدّم بار Puffin Rooms الويسكي والكوكتيلات.',
  `updated_at` = NOW()
 WHERE `id` = 281 AND `country_id` = 'uk' AND `name` = 'Turmeaus — Liverpool';

-- ── Turmeaus — Edinburgh (282) ──
UPDATE `lounges` SET
  `city` = 'Edinburgh — Unit 2, 11 Lister Square, EH3 9GL',
  `type` = 'La Casa del Habano Officielle',
  `phone` = '+44 131 285 8082',
  `source` = 'lcdhcigars.uk (Unit 2, 11 Lister Square, EH3 9GL ; lu le 24 septembre 2026) ; lacasadelhabano.com, communiqué du 26 septembre 2023 (ouverte le 12 septembre 2023 par C.Gars Ltd) ; cigars.co.uk, localisateur Hunters & Frankau (La Casa del Habano, téléphone) ; turmeaus.co.uk et puffinrooms.co.uk (cave où l''on entre, terrasse chauffée, bar Puffin Rooms) — absente de l''annuaire habanos.com (lu le 17 septembre 2026) ; la fiche disait 35 Frederick Street : aucune source lue ne le porte',
  `description` = 'La Casa del Habano de C.Gars Ltd à Édimbourg, au 11 Lister Square, dans l''ensemble Quartermile : cave où l''on entre et terrasse chauffée où l''on fume. Le bar Puffin Rooms, attenant, sert whiskies et cocktails.',
  `description_en` = 'C.Gars Ltd''s La Casa del Habano in Edinburgh, at 11 Lister Square in the Quartermile development: walk-in humidor and heated smoking terrace. The adjoining Puffin Rooms bar serves whiskies and cocktails.',
  `description_es` = 'La Casa del Habano de C.Gars Ltd en Edimburgo, en el 11 de Lister Square, dentro del conjunto Quartermile: humidor visitable y terraza calefactada para fumar. El bar Puffin Rooms, contiguo, sirve whiskies y cócteles.',
  `description_de` = 'Die La Casa del Habano von C.Gars Ltd in Edinburgh, 11 Lister Square im Quartermile-Areal: begehbarer Humidor und beheizte Raucherterrasse. Die angrenzende Bar Puffin Rooms schenkt Whiskys und Cocktails aus.',
  `description_zh` = 'C.Gars Ltd 旗下的 La Casa del Habano，位于爱丁堡 Quartermile 街区的 Lister Square 11号：设有步入式雪茄保湿室和带取暖设施的吸烟露台。毗邻的 Puffin Rooms 酒吧供应威士忌和鸡尾酒。',
  `description_ar` = 'La Casa del Habano التابعة لشركة C.Gars Ltd في إدنبرة، في 11 Lister Square ضمن مجمّع Quartermile: غرفة ترطيب للسيجار يمكن دخولها وتراس مُدفّأ للتدخين. ويقدّم بار Puffin Rooms المجاور الويسكي والكوكتيلات.',
  `updated_at` = NOW()
 WHERE `id` = 282 AND `country_id` = 'uk' AND `name` = 'Turmeaus — Edinburgh';

-- ── Les sceaux des traductions réécrites, depuis la colonne ──
INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'lounges', l.`id`, 'description', g.lang, SHA1(l.`description`), 'machine', NOW()
  FROM `lounges` l
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de' UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') g
 WHERE l.`id` IN (281, 282)
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `statut` = 'machine', `maj` = NOW();

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 242';
INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 242','systeme','fiche_corrigee','lounge',281,'Turmeaus — Liverpool : pas une Casa del Habano (lcdhcigars.uk, habanos.com) → Cave & Lounge ; The Albany Building, 8 Old Hall Street, L3 9PA ; +44 151 236 3802 ; description sans éloge, zh et ar refaits'),
  (NULL,'migration 242','systeme','fiche_corrigee','lounge',282,'Turmeaus — Edinburgh : Casa del Habano de C.Gars Ltd au Unit 2, 11 Lister Square, EH3 9GL (pas 35 Frederick Street) ; +44 131 285 8082 ; description sans éloge dans les six langues'),
  (NULL,'migration 242','systeme','turmeaus_aux_faits','systeme',0,'Deux salons Turmeaus ramenés aux faits : éloges retirés, zh et ar de Liverpool refaits (substitution machine), adresses, téléphones et type relus aux sources ; Liverpool n''est pas une Casa del Habano ; 10 traductions rescellées');

SELECT
  (SELECT `type` = 'Cave & Lounge' AND `city` = 'Liverpool — The Albany Building, 8 Old Hall Street, L3 9PA' AND `phone` = '+44 151 236 3802' AND `is_verified` = 1 FROM `lounges` WHERE `id` = 281) AS liverpool_aux_faits,
  (SELECT `type` = 'La Casa del Habano Officielle' AND `city` = 'Edinburgh — Unit 2, 11 Lister Square, EH3 9GL' AND `phone` = '+44 131 285 8082' AND `is_verified` = 1 FROM `lounges` WHERE `id` = 282) AS edimbourg_aux_faits,
  (SELECT COUNT(*) FROM (SELECT CONCAT_WS(' ', `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`) AS t FROM `lounges` WHERE `id` IN (281, 282)) x
    WHERE LOCATE('autorité', x.t) > 0 OR LOCATE('premier', x.t) > 0 OR LOCATE('remarquable', x.t) > 0 OR LOCATE('authoritative', x.t) > 0 OR LOCATE('foremost', x.t) > 0 OR LOCATE('outstanding', x.t) > 0 OR LOCATE('referencia', x.t) > 0 OR LOCATE('maßgebliche', x.t) > 0 OR LOCATE('führender', x.t) > 0 OR LOCATE('herausragende', x.t) > 0 OR LOCATE('首屈一指', x.t) > 0 OR LOCATE('最', x.t) > 0 OR LOCATE('第一', x.t) > 0 OR LOCATE('أبرز', x.t) > 0 OR LOCATE('أفضل', x.t) > 0 OR LOCATE('أكثر', x.t) > 0 OR LOCATE('référence', x.t) > 0 OR LOCATE('哈瓦那之家', x.t) > 0 OR LOCATE('Nord', x.t) > 0) = 0 AS ni_eloge_ni_substitution,
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (281, 282) AND `description_zh` LIKE '%C.Gars Ltd%' AND `description_ar` LIKE '%C.Gars Ltd%') = 2 AS zh_ar_refaits,
  (SELECT COUNT(*) FROM `translation_status` t JOIN `lounges` l ON l.`id` = t.`entite_id` WHERE t.`entite` = 'lounges' AND t.`champ` = 'description' AND l.`id` IN (281, 282) AND t.`source_hash` = SHA1(l.`description`) AND t.`statut` = 'machine') = 10 AS sceaux,
  (SELECT COUNT(*) FROM `moderation_log` WHERE `acteur_nom` = 'migration 242') = 3 AS journal,
  (SELECT SUM(CHAR_LENGTH(`detail`) >= 255) = 0 FROM `moderation_log` WHERE `acteur_nom` = 'migration 242') AS journal_non_tronque,
  (SELECT COUNT(*) FROM `lounges` WHERE CHAR_LENGTH(`source`) >= 495) = 0 AS aucune_source_tronquee;
