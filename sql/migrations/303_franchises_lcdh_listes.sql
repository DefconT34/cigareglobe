-- ════════════════════════════════════════════════════════
-- 303 — Six franchises La Casa del Habano confirmées par deux listes officielles
-- ────────────────────────────────────────────────────────
-- CE QU'ON A TROUVÉ. Trois agents ont cherché, fiche par fiche, les 39 Davidoff et
-- La Casa del Habano restées « à vérifier » (31 octobre 2026).
-- 1. Six y figurent à la fois sur lacasadelhabano.com et sur habanos.com (ou sur le
--    site de la boutique) : Bonn #41, Londres-Harrods #48, Porto #92, Ho Chi Minh-Ville
--    #140, Lomé #2542, Kreuzlingen #2572. La réserve « à vérifier » tombe.
-- 2. #2542 : le nom « The Smoking Gorilla » n'apparaît dans aucune source lue ; la
--    fiche s'appelle désormais « La Casa del Habano — Lomé ». La description ne le
--    citait pas : aucune traduction à refaire.
-- 3. Les 33 autres restent « à vérifier » : sources insuffisantes (adresse non
--    confirmée, boutique nommée autrement, une seule liste), jamais de preuve de
--    fermeture. Les 11 Davidoff : aucune source officielle accessible.
-- ════════════════════════════════════════════════════════

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : zigarren.zone (30 mai 2023 : ouverture le 16 mai 2023, 16e Casa d''Allemagne) ; habanos.com (13 juin 2025 : Hambourg, 20e franchise allemande, ce qui exclut une ouverture de Bonn en 2025) ; annuaire habanos.com lu le 17 septembre 2026. Divergence : la fiche antérieure datait l''ouverture de 2025 ; lacasadelhabano.com, directoire, lu le 31 octobre 2026 : « LCDH Bonn by Cigar Embassy » ; habanos.com : Kaiser-Passage', `updated_at` = NOW()
 WHERE `id` = 41 AND `country_id` = 'germany' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : lacasadelhabano.com (fiche LCDH Londres/Harrods, 87-135 Brompton Road ; plan des franchises, liste officielle) ; jjfox.co.uk, page sampling-lounge (10 places) ; cigaraficionado.com, article du 22 octobre 2018 (jusqu''à 12 personnes ; la climatisation du salon est de la marque suisse Airkel). Divergence 10 / 12 places écrite ; lacasadelhabano.com, liste officielle, lue le 31 octobre 2026 : « LCDH Londres/Harrods » ; habanos.com (2018) : ouverture à Harrods', `updated_at` = NOW()
 WHERE `id` = 48 AND `country_id` = 'uk' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : habanos.com (Loja 016, Edificio Trindade Domus, Rua dos Heróis e Mártires de Angola 81, 4000-285 Porto ; ouverture 28 septembre 2019) ; habanos.com (article du 15 oct. 2025 : sixième anniversaire, Empor S.A. distributeur exclusif des Habanos au Portugal) ; lacasadelhabano.com, liste officielle, lue le 31 octobre 2026 : « LCDH Porto »', `updated_at` = NOW()
 WHERE `id` = 92 AND `country_id` = 'portugal' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : habanos.com (set for Soft Opening on 1st of August 2021 ; 74B Hai Ba Trung St., Ben Nghe Ward, District 1) ; lacasadelhabano.vn (74B Đường Hai Bà Trưng, phường Bến Nghé, Quận 1 ; ouverture 9:00-00:00) ; cigarjournal.com (via résultat de recherche (page non lue directement) : ouverture décembre 2021, Avanti Group + Golden Phoenix) ; lacasadelhabano.com, liste officielle, lue le 31 octobre 2026 : « LCDH Ho Chi Minh City »', `updated_at` = NOW()
 WHERE `id` = 140 AND `country_id` = 'vietnam' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `name` = 'La Casa del Habano — Lomé', `source` = 'relu le 31 octobre 2026 : habanos.com (B6, Imneuble Marina, a cote de Total Marina, BP:1003, Lomé ; 9 septembre 2021) ; lacasadelhabano.com, liste officielle, lue le 31 octobre 2026 : « LCDH Lome » ; le nom « The Smoking Gorilla » n''apparait dans aucune source lue, retiré', `updated_at` = NOW()
 WHERE `id` = 2542 AND `country_id` = 'togo' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : zigarren.zone (On Saturday, 27 June 2026, the new Casa del Habano officially opened its doors) ; lacasadelhabanokreuzlingen.ch (Urs Portmann Tabakwaren AG, Konstanzerstrasse 8, CH-8280 Kreuzlingen) ; lacasadelhabano.com, liste officielle, lue le 31 octobre 2026 : « LCDH Kreuzlingen » ; site de la boutique : « La Casa del Habano Kreuzlingen by Urs Portmann »', `updated_at` = NOW()
 WHERE `id` = 2572 AND `country_id` = 'switzerland' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 303';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 303', 'systeme', 'fiches_relues', 'systeme', 0, 'Franchises LCDH confirmees par deux listes officielles : 6 fiches, 1 nom corrige');

-- Contrôle : des 1 partout.
SELECT
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (41,48,92,140,2542,2572) AND `source` LIKE 'relu le 31 octobre 2026%') = 6 AS `fiches_confirmees`,
  (SELECT COUNT(*) FROM `lounges` WHERE `id` = 2542 AND `name` = 'La Casa del Habano — Lomé') = 1 AS `nom_corrige`;
