-- ════════════════════════════════════════════════════════
-- 305 — Quatre lieux confirmés (deux sources) et cinq noms corrigés
-- ────────────────────────────────────────────────────────
-- CE QU'ON A TROUVÉ. Les 21 derniers lieux hors franchise ont été repris (31 octobre
-- 2026). Quatre ont deux sources lues : Club Macanudo New York #148, Iwan Ries
-- Chicago #418, Monte-Carlo Cigar Club #1615, Lobby Bar du Métropole #1616.
-- 1. #1615 s'appelait « Salle Fumoir » (club privé historique) : c'est un club sur
--    parrainage ouvert en mai 2025. #1616 s'appelait « La Terrasse » (rooftop) :
--    l'expérience cigare se tient au Lobby Bar et sur une terrasse sur les jardins.
-- 2. Trois noms corrigés sans changer le statut : #1575 (la manufacture est
--    Tabacalera de García, pas General Cigar), #1572 (le volet La Romana de 2026 a été
--    annulé), #182 (Cigar Club de l'Hotel Santiago, pas une « boutique manufacture »).
-- Un nom ne se traduit pas et les descriptions disaient déjà vrai : aucune
-- traduction à refaire.
-- ════════════════════════════════════════════════════════

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : clubmacanudo.com (page New York : 26 E 63rd St, New York, NY 10065 ; horaires listés, page non datée). Billet de 2018 sur la scène cigare de New York vu en résultat de recherche seulement, même adresse. Aucune preuve de fermeture ni de réouverture récente ; clubmacanudo.com/locations, lu le 31 octobre 2026 : 26 E 63rd St ; danspapers.com, avril 2025 : « only remaining restaurant in New York City where you can still smoke »', `updated_at` = NOW()
 WHERE `id` = 148 AND `country_id` = 'usa' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : en.wikipedia.org (19 S Wabash, deuxième étage), iwanries.com (magasin et salon Front Room, pas d''étage indiqué), timeout.com (étage 2, vu en résultat de recherche seulement). Divergence : la fiche indiquait le 7e étage, non retrouvé ; iwanries.com, lu le 31 octobre 2026 : « The Front Room - Chicago''s Premier Smoking Lounge » ; cigaraficionado.com, janv.-févr. 2023 : « Iwan Ries Cigar Lounge »', `updated_at` = NOW()
 WHERE `id` = 418 AND `country_id` = 'usa' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `name` = 'Monte-Carlo Cigar Club — Casino de Monte-Carlo', `source` = 'relu le 31 octobre 2026 : montecarlosbm.com (Monte-Carlo Cigar Club au Casino, ancien bureau de François Blanc ; « membres parrainés ») ; hellomonaco.com (Article du 11 oct. 2024 : club dans le Casino, ouverture annoncée printemps 2025, accès réservé aux membres) ; montecarlosbm.com, lu le 31 octobre 2026 : « salon fumoir, espace clos strictement privé » ; monacolife.net, 2025 : inauguration le 19 mai, membres le 28 mai', `updated_at` = NOW()
 WHERE `id` = 1615 AND `country_id` = 'monaco' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `name` = 'Lobby Bar — Hôtel Métropole Monte-Carlo', `source` = 'relu le 31 octobre 2026 : metropole.com (Cigares au Lobby Bar ; fumer sur deux terrasses (jardins du Casino, piscine Odyssey) ; daté octobre 2026) ; metropole.com (Restauration : Lobby Bar, Les Ambassadeurs, Yoshi ; piscine Odyssey ; 4 avenue de la Madone, +377 93 15 15 15) ; metropole.com, article « The Art of Cigars » : terrasse sur les jardins du Casino ; Morning Radio Monaco, 19 février 2026 : expérience cigare au Lobby Bar', `updated_at` = NOW()
 WHERE `id` = 1616 AND `country_id` = 'monaco' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `name` = 'Tabacalera de García — Casa de Campo (La Romana)', `updated_at` = NOW()
 WHERE `id` = 1575 AND `country_id` = 'dominican' AND `is_verified` = 1;

UPDATE `lounges` SET `name` = 'ProCigar Festival — Santiago', `updated_at` = NOW()
 WHERE `id` = 1572 AND `country_id` = 'dominican' AND `is_verified` = 1;

UPDATE `lounges` SET `name` = 'Arturo Fuente Cigar Club — Hotel Santiago', `updated_at` = NOW()
 WHERE `id` = 182 AND `country_id` = 'dominican' AND `is_verified` = 1;

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 305';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 305', 'systeme', 'fiches_relues', 'systeme', 0, 'Lieux hors franchise : 4 confirmes par deux sources, 5 noms corriges');

-- Contrôle : des 1 partout.
SELECT
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (148,418,1615,1616) AND `source` LIKE 'relu le 31 octobre 2026%') = 4 AS `fiches_confirmees`,
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (1615,1616,1575,1572,182) AND (`name` LIKE '%Cigar Club%' OR `name` LIKE 'Lobby Bar%' OR `name` LIKE 'Tabacalera%' OR `name` LIKE 'ProCigar Festival — Santiago')) = 5 AS `noms_corriges`;
