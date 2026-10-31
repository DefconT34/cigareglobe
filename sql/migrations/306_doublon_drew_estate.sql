-- ════════════════════════════════════════════════════════
-- 306 — Doublon Drew Estate Estelí : #1570 retirée, #180 gardée
-- ────────────────────────────────────────────────────────
-- CE QU'ON A TROUVÉ (31 octobre 2026). #180 « Factory Lounge » et #1570
-- « Factory — Lounge & Tour » décrivent le même lieu : La Gran Fabrica Drew Estate,
-- à Estelí, dont l'itinéraire officiel du Cigar Safari (drewestate.com) cite le
-- lounge de la manufacture ; cigaraficionado.com décrit la même visite. #1570 est
-- retirée (is_verified = 0), #180 reste affichée.
-- Padrón #179 / #1571 : AUCUN doublon tranché. Aucune boutique ni « Sala VIP »
-- ouverte au public n'est attestée (visites limitées, sur invitation ou lors
-- d'événements) : les deux fiches restent « à vérifier », sans retrait.
-- Pas de description touchée sur #180 : aucune traduction à refaire.
-- ════════════════════════════════════════════════════════
UPDATE `lounges` SET `is_verified` = 0,
  `source` = 'RETIRÉ — relu le 31 octobre 2026 : doublon de #180 ; même lieu, La Gran Fabrica Drew Estate à Estelí (programme Cigar Safari, drewestate.com ; cigaraficionado.com, « A Walking Tour of Drew Estate »)',
  `updated_at` = NOW()
 WHERE `id` = 1570 AND `country_id` = 'nicaragua';

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 306';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 306', 'systeme', 'fiche_retiree', 'lounge', 1570, 'Doublon de la fiche 180 : meme lieu, La Gran Fabrica Drew Estate a Esteli');

-- Contrôle : un 1.
SELECT (SELECT COUNT(*) FROM `lounges` WHERE `id` = 1570 AND `is_verified` = 0 AND `source` LIKE 'RETIRÉ%') = 1 AS `doublon_retire`;
