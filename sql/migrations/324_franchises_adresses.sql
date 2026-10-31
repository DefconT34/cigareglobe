-- ════════════════════════════════════════════════════════
-- 324 — Franchises à adresse divergente : Esch Café Rio, Lima, Partagás
-- ────────────────────────────────────────────────────────
-- CE QU'ON A TROUVÉ (31 octobre 2026). Les pages « place » de habanos.com, lues à la machine, ont servi de seconde liste.
-- Esch Café (#2562) : la fiche décrivait un café du Centro (guide de 2016) ; la Casa del Habano de la maison est à Leblon,
-- Rua Dias Ferreira 78A (habanos.com, plan lacasadelhabano.com, site de la maison) : nom, ville et description réécrits en six
-- langues. Lima (#161) : adresse portée par lacasadelhabano.com et lacasadelhabano.pe (Balta Shopping, Miraflores, Malecón Bajada
-- Balta 650) ; habanos.com donne le 626 de la même rue, divergence écrite ; le nom disait Larcomar, que le site de la boutique
-- dit absent. Partagás (#177) : lacasadelhabano.com et cigars-connect.com la placent calle Bernaza 1, habanos.com donne Industria
-- 3205, divergence écrite ; le nom disait Fábrica Partagás, qu'elle a quittée en 2020. Laissées « à vérifier » sans changement :
-- #83 Saint-Pétersbourg (habanos.com ne liste que le 9 Ligovskiy, autre local que l'hôtel Vvedensky) et #116 Tokyo (le site de Cigar
-- Club dit Nishiazabu, habanos.com Azabudai).
-- ════════════════════════════════════════════════════════

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : habanos.com, page « Esch Café – Casa Del Habano » : Rua Dias Ferreira, 78A, Leblon, Rio de Janeiro ; lacasadelhabano.com, plan des franchises : Brésil, Rio de Janeiro/Leblon (lu le 29 octobre 2026) ; eschcafe.com.br : unité Esch Leblon (lu le 29 octobre 2026). L''ancienne fiche plaçait un café Rua do Rosário 107, Centro (guide de 2016), lieu distinct',
  `name` = 'Esch Café — Leblon (La Casa del Habano)',
  `city` = 'Rio de Janeiro — Rua Dias Ferreira 78A, Leblon',
  `description` = 'Esch Café de Leblon, rua Dias Ferreira 78A, à Rio de Janeiro, répertorié par habanos.com comme La Casa del Habano et par le plan des franchises lacasadelhabano.com (Rio de Janeiro, Leblon). Le site de la maison compte deux unités, Esch Oscar à São Paulo et Esch Leblon à Rio.',
  `description_en` = 'Esch Café in Leblon, Rua Dias Ferreira 78A, Rio de Janeiro, listed by habanos.com as a La Casa del Habano and by the franchise map of lacasadelhabano.com (Rio de Janeiro, Leblon). The company''s website shows two units, Esch Oscar in São Paulo and Esch Leblon in Rio.',
  `description_es` = 'Esch Café de Leblon, Rua Dias Ferreira 78A, en Río de Janeiro, incluido en habanos.com como La Casa del Habano y en el mapa de franquicias de lacasadelhabano.com (Río de Janeiro, Leblon). El sitio de la casa muestra dos unidades, Esch Oscar en São Paulo y Esch Leblon en Río.',
  `description_de` = 'Esch Café in Leblon, Rua Dias Ferreira 78A, Rio de Janeiro, auf habanos.com als La Casa del Habano und im Franchise-Plan von lacasadelhabano.com (Rio de Janeiro, Leblon) verzeichnet. Die Website des Hauses nennt zwei Standorte, Esch Oscar in São Paulo und Esch Leblon in Rio.',
  `description_zh` = '里约热内卢莱布隆区（Leblon）的Esch Café，地址Rua Dias Ferreira 78A，habanos.com将其列为La Casa del Habano，lacasadelhabano.com的加盟店地图也列有里约热内卢莱布隆。该店官网列出两家门店：圣保罗的Esch Oscar和里约的Esch Leblon。',
  `description_ar` = 'إيش كافيه في ليبلون، Rua Dias Ferreira 78A، ريو دي جانيرو، مدرج في habanos.com بوصفه لا كاسا ديل هابانو وفي خريطة الامتياز على lacasadelhabano.com (ريو دي جانيرو، ليبلون). ويعرض موقع الشركة وحدتين: إيش أوسكار في ساو باولو وإيش ليبلون في ريو.',
  `updated_at` = NOW()
 WHERE `id` = 2562 AND `is_verified` = 1;

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : lacasadelhabano.pe : C.C. Balta Shopping, Miraflores, deux tiendas, Larcomar absent ; lacasadelhabano.com, plan des franchises : LCDH Miraflores, Malecón Bajada Balta No 650 ; habanos.com, page « La Casa del Habano » de Lima : Av. Bajada Balta 626, Tda 1112, même rue, numéro divergent non tranché',
  `name` = 'La Casa del Habano — Lima (Miraflores)',
  `updated_at` = NOW()
 WHERE `id` = 161 AND `is_verified` = 1;

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : lacasadelhabano.com : Calle Bernaza No.1, entre Obispo et O''Reilly, Habana Vieja ; cigars-connect.com : installée au 1 Bernaza ; cigaraficionado.com : boutique fermée après l''effondrement partiel du toit de la manufacture (2020) ; habanos.com, page « Lcdh Casa Partagás » : Industria 3205, adresse divergente non tranchée',
  `name` = 'La Casa del Habano — Partagás (calle Bernaza)',
  `updated_at` = NOW()
 WHERE `id` = 177 AND `is_verified` = 1;

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'lounges', l.`id`, 'description', g.lang, SHA1(l.`description`), 'machine', NOW()
  FROM `lounges` l
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de' UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') g
 WHERE l.`id` = 2562
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `statut` = 'machine', `maj` = NOW();

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 324';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 324', 'systeme', 'fiches_relues', 'systeme', 0, 'Franchises a adresse divergente : 2562, 161, 177 confirmees et renommees, lues le 31 octobre 2026');

-- Contrôle : des 1 partout.
SELECT
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (2562, 161, 177) AND `source` LIKE 'relu le 31 octobre 2026%') = 3 AS `confirmees`,
  (SELECT COUNT(*) FROM `lounges` WHERE `id` = 2562 AND `city` LIKE '%Dias Ferreira%' AND `name` LIKE '%Leblon%') = 1 AS `esch`,
  (SELECT COUNT(*) FROM `translation_status` t JOIN `lounges` l ON l.`id` = t.`entite_id` WHERE t.`entite` = 'lounges' AND t.`champ` = 'description' AND l.`id` = 2562 AND t.`source_hash` = SHA1(l.`description`)) = 5 AS `sceaux`;
