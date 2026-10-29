-- ════════════════════════════════════════════════════════
-- 292 — États-Unis : quatre établissements fermés
-- ────────────────────────────────────────────────────────
-- CE QU'ON A TROUVÉ. Pilote de relecture des 21 fiches des États-Unis
-- (29 octobre 2026, expert-cigare, trois agents, une source datée par
-- verdict). Quatre fiches décrivent un lieu fermé, avec une source qui le dit
-- (règle : « fermé » exige une source) :
--   #416  Casa Fuente (Forum Shops, Las Vegas) — fermé les 19/20 octobre 2025
--         (Cigar Aficionado / Halfwheel : divergence de dates écrite) ;
--   #425  Nat Sherman, 12 East 42nd Street — fermé vers le 16 septembre 2020 ;
--   #1504 21 Club — fermé en 2020, définitivement annoncé en décembre 2020 ;
--   #1508 Cigar City Brewing, taproom de Spruce Street — fermé ; aucune source
--         ne mentionne un cigar bar.
-- Elles sont dépubliées (`is_verified = 0`, motif dans `source`), jamais
-- effacées. Les 17 autres fiches (adresses fausses : 146, 151, 152 ; descriptions
-- à ramener à ce que les sources disent) font l'objet d'un lot à part.
-- ════════════════════════════════════════════════════════

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 29 octobre 2026 : Casa Fuente, Forum Shops at Caesars, a fermé en octobre 2025 : Cigar Aficionado (29 septembre 2025) annonce la fermeture le 19 octobre, Halfwheel donne le 20 octobre (page non lue, extrait de recherche) ; la divergence de dates reste écrite, non tranchée ; à rétablir si un nouveau lieu ouvre', `updated_at` = NOW()
 WHERE `id` = 416 AND `country_id` = 'usa';

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 29 octobre 2026 : la boutique Nat Sherman du 12 East 42nd Street, à New York, a fermé vers le 16 septembre 2020 (Cigar Coop, article de septembre 2020) ; la fiche la décrivait au présent ; aucune source lue ne dit qu''un autre lieu de la maison ait pris sa suite ; à rétablir si une page en apporte un', `updated_at` = NOW()
 WHERE `id` = 425 AND `country_id` = 'usa';

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 29 octobre 2026 : le restaurant 21 Club, à New York, a fermé ses portes en mars 2020 et sa fermeture a été annoncée définitive en décembre 2020 (amNY, décembre 2020) ; aucune source lue ne décrit un cigar room ; à rétablir si une page apporte un lieu ouvert', `updated_at` = NOW()
 WHERE `id` = 1504 AND `country_id` = 'usa';

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 29 octobre 2026 : le taproom de Cigar City Brewing, 3924 West Spruce Street, à Tampa, est fermé (site de la brasserie, lu le 29 octobre 2026 : « Our Spruce Street Tap Room is now closed ») ; aucune source lue ne mentionne un cigar bar ni une cave dans ce lieu ; à rétablir si une page en apporte un', `updated_at` = NOW()
 WHERE `id` = 1508 AND `country_id` = 'usa';

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 292';
INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 292','systeme','fiche_retiree','lounge',416,'cigaraficionado.com : fermeture annoncee le 19 octobre 2025 ; halfwheel.com : 20 octobre (divergence de dates)'),
  (NULL,'migration 292','systeme','fiche_retiree','lounge',425,'cigar-coop.com : boutique du 12 E 42nd Street fermee vers le 16 septembre 2020'),
  (NULL,'migration 292','systeme','fiche_retiree','lounge',1504,'amny.com : fermeture du 21 Club annoncee definitive en decembre 2020'),
  (NULL,'migration 292','systeme','fiche_retiree','lounge',1508,'cigarcitybrewing.com : taproom de Spruce Street ferme ; aucun cigar bar atteste');

-- Contrôle : des 1 partout.
SELECT
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (416,425,1504,1508) AND `country_id` = 'usa' AND `is_verified` = 0 AND `source` LIKE 'RETIRÉ%') = 4 AS `quatre_retires`,
  (SELECT COUNT(*) FROM `moderation_log` WHERE `acteur_nom` = 'migration 292') = 4 AS `quatre_traces`;
