-- ════════════════════════════════════════════════════════
-- 136 — Deux fiches que la 135 a mal étiquetées
-- ────────────────────────────────────────────────────────
-- MA PROPRE ERREUR, TROUVÉE EN VÉRIFIANT LE DÉPLOIEMENT.
--
-- La migration 135 a remplacé la source des quarante-huit fiches qui
-- citaient `lcdh-locator.com` par « à vérifier — réseau La Casa del
-- Habano ». Sa clause portait sur la SOURCE et non sur le nom : deux
-- fiches ont donc reçu une affirmation qui ne les concerne pas.
--
--   #250  Club Pasión Habanos — Barcelona
--         « Club Pasión Habanos » est bien une franchise de Habanos
--         S.A., mais c'est un ÉCHELON DISTINCT de La Casa del Habano.
--         Dire l'un pour l'autre est une confusion de catégorie.
--
--   #413  Havana Connections — Tampa
--         Un magasin des ÉTATS-UNIS. Il ne peut appartenir à aucune
--         franchise Habanos, pour la raison même qui a fait retirer
--         Chicago et Houston : l'embargo. La 135 lui a collé une
--         appartenance impossible.
--
-- Remplacer une source fabriquée par une affirmation fausse n'aurait
-- rien réparé — c'est exactement le défaut qu'on corrigeait. Une source
-- dit ce qu'on sait, et s'arrête là.
-- ════════════════════════════════════════════════════════

UPDATE `lounges`
   SET `source`     = 'à vérifier — réseau franchisé Habanos (Club Pasión Habanos), liste officielle non recoupée',
       `updated_at` = NOW()
 WHERE `id` = 250 AND `name` LIKE 'Club Pasi%';

UPDATE `lounges`
   SET `source`     = 'à vérifier — source d''origine non traçable',
       `updated_at` = NOW()
 WHERE `id` = 413 AND `country_id` = 'usa' AND `name` LIKE 'Havana Connections%';

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL, 'migration 136', 'systeme', 'source_corrigee', 'lounge', 250,
   'la 135 disait « La Casa del Habano » pour un Club Pasion Habanos'),
  (NULL, 'migration 136', 'systeme', 'source_corrigee', 'lounge', 413,
   'la 135 pretait une franchise Habanos a un magasin des Etats-Unis');
