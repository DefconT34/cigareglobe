-- ════════════════════════════════════════════════════════
-- 304 — Huit lieux hors franchise confirmés par deux sources
-- ────────────────────────────────────────────────────────
-- CE QU'ON A TROUVÉ. Quatre agents ont repris, fiche par fiche, 48 lieux hors
-- franchise restés « à vérifier » (31 octobre 2026) : site du lieu + presse datée ou
-- annuaire. Huit sont attestés par deux sources lues : À La Civette #25, Bar Aristide
-- #26, Remedy #89, Hotel De' Ricci #90, R261 Cigar & Rock #120, Bertie HK #385,
-- Royal Lounge Luxembourg #913, Hotel Nacional (bar à cigares) #1564.
-- Les 40 autres restent « à vérifier » (une seule source, ou aucun salon cigares
-- attesté), jamais de preuve de fermeture : aucun retrait.
-- Les descriptions ne bougent pas : aucune traduction à refaire.
-- ════════════════════════════════════════════════════════

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : habanos.com (Habanos Specialist, 157 rue Saint-Honoré, fiche non datée) ; cigaraficionado.com (16 juin 2016 : 157 rue Saint-Honoré depuis 1876, environ 300 cigares) ; pariszigzag.fr (ouverture 1716, non daté). Site de la maison non lu (erreur serveur). Divergence : 1716 (maison) / 1876 pour l''adresse (CA) ; alacivette.com, lu le 31 octobre 2026 : 157 rue Saint-Honoré, « fondée en 1716 »', `updated_at` = NOW()
 WHERE `id` = 25 AND `country_id` = 'france' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : tendancehotellerie.fr (10 mars 2022 : deux fumoirs jouxtent le bar) ; timeout.fr et mandarinoriental.com (page du bar, corps non lu) ; timeout.fr, critique du 12 février 2025 : « un chic fumoir » ; fermeture estivale 2024 mentionnée, type de cigares non établi', `updated_at` = NOW()
 WHERE `id` = 26 AND `country_id` = 'france' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : remedymilano.it (Viale Luigi Majno 26 angle Via Morelli ; cigar room avec quatre fauteuils ; lun-sam 18h-1h) ; gamberorosso.it (Presse (résultat de recherche, page non lue en entier) : cigar room, 18h-1h) ; ilgiornale.it, 18 décembre 2024 : viale Majno 26, « cigar room » ; gamberorosso.it : « cigar room » (page lue)', `updated_at` = NOW()
 WHERE `id` = 89 AND `country_id` = 'italy' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : hoteldericci.com (Site officiel : Via della Barchetta 14, 00186 Roma ; liste Cellier, Charade (bar à cigare), Cigar Lounge) ; wantedinrome.com : « Cigar Room », Via della Barchetta 14', `updated_at` = NOW()
 WHERE `id` = 90 AND `country_id` = 'italy' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : tokyuhotels.co.jp (Shibuya R261 CIGAR & ROCK, 26-1 Sakuragaokacho, 2F Tower Side Terrace ; aucun avis de fermeture) ; tokyuhotels.co.jp (L''hôtel publie ses bars: Bellovisto, R261 Cigar & Rock, JZ Brat, Zabou (R261 y figure)) ; j-hotel.or.jp (R261 CIGAR & ROCK ; 16h-24h lun-sam (association hôtelière)) ; j-hotel.or.jp, page R261 lue le 31 octobre 2026 : cigares, lun-sam 16h-24h', `updated_at` = NOW()
 WHERE `id` = 120 AND `country_id` = 'japan' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : bertie-hk.com (4/F, Duke Wellington House, 14-24 Wellington Street, Central ; lun-sam 12h-0h) ; cigarjournal.com (Cigar Journal (extrait de recherche) : Bertie Cigar Lounge, deux ans a Hong Kong ; adresse 2/F chez Time Out (Attire House)) ; bertie-hk.com, lu le 31 octobre 2026 : logo « Habanos Specialist » ; cigarjournal.com, 8 avril 2021', `updated_at` = NOW()
 WHERE `id` = 385 AND `country_id` = 'hongkong' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : luxembourg.leroyal.com (Royal Lounge ; The Royal Lounge includes a cigar lounge ; aucun Churchill Bar) ; guide.michelin.com (The Royal Lounge keeps a cigar room. Boulevard Royal 12) ; luxembourg.leroyal.com, lu le 31 octobre 2026 : « bar with a cigar lounge » ; guide.michelin.com : « keeps a cigar room »', `updated_at` = NOW()
 WHERE `id` = 913 AND `country_id` = 'luxembourg' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : cigaraficionado.com, « hidden cigar lounge upstairs » ; « Opened in 2022 » ; Casa del Habano « downstairs »; hotelnacionaldecuba.com, Habanos Lounge, 12:00 p.m. à 12:00 a.m. ; liste des bars sans salon cigares distinct ; hotelnacionaldecuba.com, restaurants et bars, lu le 31 octobre 2026 : sélection de cigares, Habanos Lounge', `updated_at` = NOW()
 WHERE `id` = 1564 AND `country_id` = 'cuba' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 304';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 304', 'systeme', 'fiches_relues', 'systeme', 0, 'Lieux hors franchise confirmes par deux sources : 8 fiches');

-- Contrôle : un 1.
SELECT
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (25,26,89,90,120,385,913,1564) AND `source` LIKE 'relu le 31 octobre 2026%') = 8 AS `fiches_confirmees`;
