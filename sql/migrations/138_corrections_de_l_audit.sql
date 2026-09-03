-- ════════════════════════════════════════════════════════
-- 138 — Les trois corrections de l'audit des établissements
-- ────────────────────────────────────────────────────────
-- `tools/etablissements.php` a passé les 497 fiches au crible de ce qui
-- se vérifie sans se déplacer : l'indicatif d'un numéro, les motifs
-- qu'aucun opérateur n'attribue, les affiliations que le droit interdit.
-- Trois familles d'erreurs en sont sorties, et voici leur correction.
--
-- Le cliquet de l'outil (sql/etablissements_audit.json) doit être
-- REFERMÉ après cette migration : php tools/etablissements.php --figer
-- ════════════════════════════════════════════════════════


-- ════════════════════════════════════════════════════════
-- 1 · TRENTE-TROIS NUMÉROS QU'AUCUN OPÉRATEUR N'ATTRIBUE
-- ────────────────────────────────────────────────────────
-- 1234, 3456, 4567, 5678, 6789, 5432, ou la même touche cinq fois.
-- Sept pour cent des fiches téléphonées. Davidoff Istanbul en
-- « +90 212 230 4567 », le Cigar Club Torino en « +39 011 562 1234 ».
-- Ce ne sont pas trente-trois coïncidences.
--
-- POURQUOI VIDER PLUTÔT QUE CORRIGER. On ne connaît pas le vrai numéro,
-- et l'inventer serait refaire l'erreur qu'on répare. Un champ vide est
-- honnête ; un numéro faux ne l'est pas — il envoie quelqu'un chez un
-- tiers qui n'a rien demandé, et fait passer le site pour sérieux au
-- moment précis où il ne l'est pas.
--
-- Le champ redevient donc vide, et la fiche descend au barème de
-- complétude : c'est exactement ce qu'on veut, puisqu'elle est en effet
-- moins complète qu'on ne le croyait.
UPDATE `lounges`
   SET `phone` = NULL, `updated_at` = NOW()
 WHERE `id` IN (14, 15, 21, 22, 24, 48, 95, 252, 254, 329, 331, 623,
                627, 647, 747, 831, 833, 934, 937, 947, 971, 1106, 1109, 1112,
                1115, 1123, 1132, 1145, 1171, 1392, 1448, 1575, 2504);


-- ════════════════════════════════════════════════════════
-- 2 · QUATRE AFFILIATIONS HABANOS AUX ÉTATS-UNIS
-- ────────────────────────────────────────────────────────
-- La Casa del Habano et Cohiba Atmosphere sont des réseaux franchisés
-- par Habanos S.A. : ils ne vendent QUE des cigares cubains, dont la
-- vente reste interdite aux États-Unis.
--
-- CES QUATRE ENSEIGNES EXISTENT RÉELLEMENT. Casa de Montecristo est une
-- chaîne américaine bien réelle, le Grand Havana Room un club privé de
-- Beverly Hills. C'est l'affiliation qu'on leur prête qui est fausse —
-- et prêter une affiliation officielle à un commerce réel n'est pas une
-- approximation : c'est lui attribuer une qualité qu'il n'a pas, dans un
-- pays où l'avoir serait illégal.
--
-- On ne retire donc PAS les fiches : on corrige le `type`, qui est le
-- seul champ fautif. Les valeurs choisies existent déjà dans le corpus,
-- et ne revendiquent rien.
UPDATE `lounges` SET `type` = 'Cave & Lounge', `updated_at` = NOW()
 WHERE `id` IN (411, 414) AND `country_id` = 'usa' AND `name` LIKE 'Casa de Montecristo%';

UPDATE `lounges` SET `type` = 'Cave Premium', `updated_at` = NOW()
 WHERE `id` = 413 AND `country_id` = 'usa' AND `name` LIKE 'Havana Connections%';

UPDATE `lounges` SET `type` = 'Club Privé', `updated_at` = NOW()
 WHERE `id` = 420 AND `country_id` = 'usa' AND `name` LIKE 'Grand Havana Room%';


-- ════════════════════════════════════════════════════════
-- 3 · QUATRE FICHES CLASSÉES DANS LE MAUVAIS PAYS
-- ────────────────────────────────────────────────────────
-- C'est l'indicatif qui les a trahies, et il disait vrai : ce ne sont
-- pas les numéros qui étaient faux, mais le pays.
--
-- ── Macao, créé pour l'occasion ─────────────────────────
-- Trois établissements portaient +853 — l'indicatif de MACAO — tout en
-- étant classés à Hong Kong. Leurs noms le disaient déjà : « La Casa
-- del Habano — Macau », « Grand Lisboa Palace », « Robuchon au Dôme »
-- (au Grand Lisboa). Macao n'existait pas dans l'atlas ; il y entre.
--
-- Ce n'est pas un détail de rangement : Hong Kong et Macao sont deux
-- régions administratives distinctes, à deux heures de bateau, et
-- quelqu'un qui cherche une cave à Hong Kong ne veut pas traverser
-- l'estuaire de la rivière des Perles.
INSERT INTO `lounge_countries` (`id`, `name`, `flag`, `lat`, `lon`, `color`, `iso_code`)
VALUES ('macau', 'Macao', '🇲🇴', 22.1667, 113.5500, '#8B2BE2', 'MO')
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`);

UPDATE `lounges` SET `country_id` = 'macau', `updated_at` = NOW()
 WHERE `id` IN (127, 129, 1449) AND `country_id` = 'hongkong';

-- La ville de la fiche 1449 annonçait « Hong Kong — Grand Lisboa,
-- Macau » : les deux à la fois, ce qui ne peut pas être.
UPDATE `lounges` SET `city` = 'Macau — Grand Lisboa, Avenida de Lisboa', `updated_at` = NOW()
 WHERE `id` = 1449;

-- ── ProCigar est dominicain ─────────────────────────────
-- La fiche portait +1 809, indicatif de la République Dominicaine, tout
-- en étant classée au Nicaragua. ProCigar est le festival de
-- l'association dominicaine des fabricants ; il se tient à Santiago de
-- los Caballeros et à La Romana. Estelí est au Nicaragua, et relève
-- d'un autre festival.
--
-- Le NOM et la VILLE se corrigent ici : ils ne sont pas traduits.
-- ⚠ La DESCRIPTION, elle, n'est pas touchée — elle porte cinq
-- traductions scellées, et affirme encore que le festival « combine
-- Estelí et Santiago ». Elle doit passer par la chaîne de traduction,
-- qui sait resceller. C'est signalé, pas oublié.
UPDATE `lounges`
   SET `country_id` = 'dominican',
       `name`       = 'ProCigar Festival — Santiago',
       `city`       = 'Santiago de los Caballeros (chaque février)',
       `updated_at` = NOW()
 WHERE `id` = 1572 AND `country_id` = 'nicaragua';


-- ── La trace ─────────────────────────────────────────────
INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL, 'migration 138', 'systeme', 'telephones_vides', 'lounge', 0,
   '33 numeros fabriques (suites 1234/4567, touches repetees) effaces'),
  (NULL, 'migration 138', 'systeme', 'affiliations_corrigees', 'lounge', 0,
   '4 affiliations Habanos pretees a des commerces americains (embargo)'),
  (NULL, 'migration 138', 'systeme', 'pays_corriges', 'lounge', 0,
   '3 fiches de Macao classees a Hong Kong, ProCigar classe au Nicaragua');
