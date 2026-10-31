-- ════════════════════════════════════════════════════════
-- 302 — Cohiba Atmosphere (habanos.com) et deux Davidoff (davidoff.com) confirmés
-- ────────────────────────────────────────────────────────
-- CE QU'ON A TROUVÉ. Même lecture que la 301 (navigateur, 31 octobre 2026), filtre
-- « Cohiba Atmosphere » : 4 points en Europe, 2 en Afrique et Moyen-Orient, 8 en
-- Asie-Pacifique, 2 en Amérique.
-- 0. Davidoff : le localisateur de davidoff.com (lu le 31 octobre 2026) liste Marina
--    Bay Sands (#2515) et Pavilion KL (#2509) à l'adresse de leur fiche : confirmées.
--    Sa recherche par ville ne répond pas dans un navigateur sans position : les
--    autres Davidoff restent à vérifier.
-- 1. 11 fiches y figurent : la réserve « à vérifier » tombe, la lecture est datée.
-- 2. #366 renommée (Tokyo, Nishi-Azabu : l'entrée officielle est « Kasumicho », ancien
--    nom du quartier, et rien ne dit Roppongi Hills).
-- 3. Doublon #128 / #382 : la liste ne donne qu'UNE entrée Cohiba Atmosphere à Hong
--    Kong, « Members Only », que #128 décrit (Queen's Road Central). #382 (Pacific
--    Place) n'est attestée nulle part : retirée (`is_verified = 0`), #128 gardée.
-- Les descriptions ne bougent pas : aucune traduction à refaire.
-- ════════════════════════════════════════════════════════

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : habanos.com, Cohiba Atmosphere Sofia — 22 San Stefano Str., Sofia 1000 ; Kaliman Caribe; cohibaatmosphere.bg, 22 San Stefano Str., Sofia, San Stefano Plaza, ground floor ; 10:00-24:00; habanos.com, Ouvert le 20 décembre 2017 ; habanos.com, liste officielle des points de vente, région Europe, lue le 31 octobre 2026 : « Cohiba Atmosphere Sofia (Bulgaria / Sofia) »', `updated_at` = NOW()
 WHERE `id` = 69 AND `country_id` = 'bulgaria' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : habanos.com, Cohiba Atmosphere Praga — Kaprova 5, Praha 1, 110 00 ; Tabak Invest A.S; labodeguitadelmedio.cz, Kaprova 5, Praha 1 ; parle de « Atmosphere Lounge » ; habanos.com, liste officielle des points de vente, région Europe, lue le 31 octobre 2026 : « Cohiba Atmosphere Praga (Czech Republic / Praha) »', `updated_at` = NOW()
 WHERE `id` = 81 AND `country_id` = 'czech' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : habanos.com, Cohiba Atmosphere, Marina Mall — Marina Mall Crescent, Salmiya, Kuwait ; Phoenicia; cigaraficionado.com, Avril 2016 : Kuwait parmi les Cohiba Atmosphere existants ; habanos.com, liste officielle des points de vente, région Afrique / Moyen-Orient, lue le 31 octobre 2026 : « Cohiba Atmosphere,Marina Mall »', `updated_at` = NOW()
 WHERE `id` = 105 AND `country_id` = 'kuwait' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : habanos.com, Cohiba Atmosphere – Members Only, 21/F, Hing Wai Building, 36 Queen''s Road Central; habanos.com, 10 ans du Cohiba Atmosphere de Hong Kong (2017) ; habanos.com, liste officielle des points de vente, région Asie-Pacifique, lue le 31 octobre 2026 : « Cohiba Atmosphere - Members Only (Hong Kong / Hong Kong Island) »', `updated_at` = NOW()
 WHERE `id` = 128 AND `country_id` = 'hongkong' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : bkmagazine.com, 2/F, Cohiba Atmosphere, 63/3 Soi Ruamrudee, Phloen Chit Rd (liste 2018); cigaraficionado.com, Bangkok : 3 000 sq ft, restaurant italien, bar, 75 casiers (2016) ; habanos.com, liste officielle des points de vente, région Asie-Pacifique, lue le 31 octobre 2026 : « Cohiba Atmosphere - Bangkok (Thailand / Bangkok) »', `updated_at` = NOW()
 WHERE `id` = 137 AND `country_id` = 'thailand' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : habanos.com (Cohiba Atmosphere à l''intérieur du Raffles Hotel Le Royal, 92 Rukhak Vithei Daun Penh (article du 28 mars 2018)) ; cambodgemag.com (Cohiba Atmosphere located at the Raffles Hotel Le Royal (ouverture du festival le 23 octobre 2025)) ; cigarjournal.com (exploitant Pacific Cigar Company, article du 17 janvier 2022) ; habanos.com, liste officielle, région Asie-Pacifique, lue le 31 octobre 2026 : « Cohiba Atmosphere - Phnom Penh »', `updated_at` = NOW()
 WHERE `id` = 139 AND `country_id` = 'cambodia' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : cohibaatmosphere.com.my (20 Jalan Teknologi 3/4, Kota Damansara ; lundi-samedi 13h-minuit ; exploitant Mighty Milestone Sdn. Bhd) ; habanos.com (Habanos, 6 nov. 2019 : Pacific Cigar Company a le droit d''implanter le concept à KL) ; robbreport.com.my (Robb Report 21 sept. 2020 : Asiaeuro (Jonathan Chow) ; aucun lien avec La Casa del Habano cité) ; habanos.com, liste officielle, région Asie-Pacifique, lue le 31 octobre 2026 : « Cohiba Atmosphere Selangor »', `updated_at` = NOW()
 WHERE `id` = 2558 AND `country_id` = 'malaysia' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : habanos.com, Ouverture 30 juillet 2020, en périphérie, sans adresse; habanos.com, Réouverture 2018 : L217-L218, 8 Wangfujing East Street ; habanos.com, liste officielle des points de vente, région Asie-Pacifique, lue le 31 octobre 2026 : « Beijing-Chaoyang (China / Beijing) »', `updated_at` = NOW()
 WHERE `id` = 126 AND `country_id` = 'china' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `name` = 'Cohiba Atmosphere — Tokyo (Nishi-Azabu)', `source` = 'relu le 31 octobre 2026 : cohiba-atmosphere.jp (Cohiba Atmosphere Tokyo : 東京都港区西麻布1-14-1 井門西麻布ビル1F) ; habanos.com (Asie : Bangkok, Tokyo, Hong Kong, and Shanghai (6 nov. 2019)) ; news.mynavi.jp (Cigar bar de Nishi-Azabu, franchise officielle Habanos (24 nov. 2022)) ; habanos.com, liste officielle des points de vente, région Asie-Pacifique, lue le 31 octobre 2026 : « Cohiba Atomosphere Kasumicho (Japan / Tokyo) »', `updated_at` = NOW()
 WHERE `id` = 366 AND `country_id` = 'japan' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : habanos.com, Cohiba Atmosphere Buenos Aires — Moreno 518, C1091AAL CABA ; Puro Tabaco S.A; habanos.com, Ouverture 2017, quartier colonial de San Telmo ; habanos.com, liste officielle des points de vente, région Amérique / Caraïbes, lue le 31 octobre 2026 : « Cohiba Atmosphere Buenos Aires (Argentina / Buenos Aires) »', `updated_at` = NOW()
 WHERE `id` = 158 AND `country_id` = 'argentina' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : habanos.com (Neptuno Street, between Zulueta and Monserrate; Habanos S.A., 11 July 2017) ; cigaraficionado.com (Cohiba Atmosphere, Gran Hotel Manzana Kempinski, San Rafael Street (2017)) ; habanos.com, liste officielle des points de vente, région Amérique / Caraïbes, lue le 31 octobre 2026 : « Cohiba Atmosphere La Habana (Cuba / La Habana) »', `updated_at` = NOW()
 WHERE `id` = 178 AND `country_id` = 'cuba' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : pavilion-kl.com (Davidoff, Niveau 2 Couture Pavilion, lot 2.33.02, 42,5 m², 10h-22h) ; en.worldtempus.com (2009 : premier flagship de KL au Starhill Gallery (UG 12), 70 m² : autre adresse, ancienne) ; davidoff.com, localisateur de boutiques, lu le 31 octobre 2026 : « Davidoff of Geneva since 1911 - Pavilion Mall (Lot 2.33.02, Level 2, 168 Bukit Bintang) »', `updated_at` = NOW()
 WHERE `id` = 2509 AND `country_id` = 'malaysia' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : marinabaysands.com, Davidoff of Geneva, The Shoppes, #B1-90 (via recherche ; page en timeout); cigarjournal.com, Davidoff Singapore dévoile son concept boutique à Marina Bay Sands (date non lue) ; davidoff.com, localisateur de boutiques, lu le 31 octobre 2026 : « Davidoff of Geneva since 1911 - Marina Bay Sands (B1-90, 2 Bayfront Avenue) »', `updated_at` = NOW()
 WHERE `id` = 2515 AND `country_id` = 'singapore' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 31 octobre 2026 : doublon de #128 ; la liste officielle de habanos.com ne compte qu''une entrée Cohiba Atmosphere à Hong Kong (Members Only, Queen''s Road Central) ; Pacific Place n''est attesté par aucune source lue', `updated_at` = NOW()
 WHERE `id` = 382 AND `country_id` = 'hongkong';

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 302';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 302', 'systeme', 'fiches_relues', 'systeme', 0, 'Cohiba Atmosphere (habanos.com) et 2 Davidoff (davidoff.com) confirmes : 13 fiches, 1 nom corrige, 1 doublon retire'),
  (NULL, 'migration 302', 'systeme', 'fiche_retiree', 'lounge', 382, 'Doublon de la fiche 128 : une seule entree Cohiba Atmosphere a Hong Kong dans la liste officielle habanos.com');

-- Contrôle : des 1 partout.
SELECT
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (69,81,105,128,137,139,2558,126,366,158,178,2509,2515) AND `source` LIKE 'relu le 31 octobre 2026%') = 13 AS `fiches_confirmees`,
  (SELECT COUNT(*) FROM `lounges` WHERE `id` = 366 AND `name` LIKE '%Nishi-Azabu%') = 1 AS `nom_corrige`,
  (SELECT COUNT(*) FROM `lounges` WHERE `id` = 382 AND `is_verified` = 0 AND `source` LIKE 'RETIRÉ%') = 1 AS `doublon_retire`;
