-- ════════════════════════════════════════════════════════
-- 294 — États-Unis et France : neuf fiches introuvables ou fermées retirées
-- ────────────────────────────────────────────────────────
-- CE QU'ON A TROUVÉ. Relecture des fiches des États-Unis et de la France
-- (29 octobre 2026, expert-cigare). Règle : « introuvable » après trois requêtes
-- en langue locale et en anglais, puis un contradicteur ; « fermé » exige une
-- source qui le dise. Retirées (`is_verified = 0`, motif dans `source`) :
--   États-Unis : #411 Casa de Montecristo Doral, #414 Casa de Montecristo
--   Orlando, #417 Club Macanudo Las Vegas — introuvables, confirmés par un
--   contradicteur (anglais et espagnol) ;
--   France : #229 Davidoff rue de Rivoli et #241 Le Diplomate (Lille) —
--   introuvables, confirmés par un contradicteur ; #230 musée Seita — fermé en 2000 ;
--   Espagne : #1265 elBulli et #1268 Casino de Madrid (fumoir) — introuvables ; Royaume-Uni : #279 Claridge's —
--   l'hôtel publie sa liste de bars sans salon cigares (règle 155).
-- ════════════════════════════════════════════════════════

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 29 octobre 2026 : aucune source ne place un Casa de Montecristo à Doral ; le seul Casa de Montecristo de Miami documenté est celui de Brickell (Cigar Aficionado, 2016), rebaptisé Empire Social Lounge (Halfwheel) ; cinq requêtes en anglais et en espagnol, deux relecteurs ; à rétablir si une page apporte le lieu', `updated_at` = NOW()
 WHERE `id` = 411 AND `country_id` = 'usa';

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 29 octobre 2026 : aucune source ne place un Casa de Montecristo à Orlando (liste de septembre 2025 de l''enseigne : aucun site à Orlando) ; le salon de West Sand Lake Road est Corona Cigar, 7792, pas 7339 ; requêtes en anglais et en espagnol, deux relecteurs ; à rétablir si une page apporte le lieu', `updated_at` = NOW()
 WHERE `id` = 414 AND `country_id` = 'usa';

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 29 octobre 2026 : aucun Club Macanudo à Las Vegas (Venetian ou Palazzo) dans les sources lues ; les Grand Canal Shoppes interdisent de fumer (FAQ officielle) ; les Club Macanudo américains documentés sont ceux de New York et de Bossier City (Halfwheel, 2024) ; quatre requêtes, deux relecteurs ; à rétablir si une page apporte le lieu', `updated_at` = NOW()
 WHERE `id` = 417 AND `country_id` = 'usa';

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 29 octobre 2026 : aucune source n''atteste une boutique Davidoff au 234 rue de Rivoli, à Paris : le localisateur davidoff.com (lu le 18 septembre 2026) ne donne que Roissy, la presse ne cite que l''aéroport CDG et une adresse du 16e (non vérifiée) ; neuf requêtes en français et en anglais, deux relecteurs ; à rétablir si une page apporte le lieu', `updated_at` = NOW()
 WHERE `id` = 229 AND `country_id` = 'france';

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 29 octobre 2026 : le musée-galerie de la Seita, 12 rue Surcouf (7e arrondissement, et non 9e), a ouvert en 1979 et fermé en juin 2000 (Wikipédia) ; la fiche le décrivait au présent ; aucune boutique de cigares n''y est mentionnée', `updated_at` = NOW()
 WHERE `id` = 230 AND `country_id` = 'france';

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 29 octobre 2026 : aucun établissement « Le Diplomate » avec cigares place du Théâtre, à Lille : le site cité (le-diplomate.fr) est un bar-brasserie de Châlons-en-Champagne, homonyme ; neuf requêtes en français et en anglais, deux relecteurs, aucun Habanos Specialist lillois sous ce nom ; à rétablir si une page apporte le lieu', `updated_at` = NOW()
 WHERE `id` = 241 AND `country_id` = 'france';

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 29 octobre 2026 : aucune source lue ne mentionne de cigares à elBulli ou à la fondation elBulli ; le lieu de Cala Montjoi est devenu en juin 2023 le musée elBulli1846, visité sur rendez-vous (La Vanguardia / Vilaweb, 2023) ; cinq requêtes en espagnol et en anglais, deux relecteurs ; à rétablir si une page apporte une activité cigare', `updated_at` = NOW()
 WHERE `id` = 1265 AND `country_id` = 'spain';

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 29 octobre 2026 : le Casino de Madrid, calle de Alcalá 15 (cercle privé fondé en 1836), n''a aucun fumoir ni salon cigares dans les sources lues ; le nom « Gran Peña » est celui d''un autre cercle, Gran Vía 2 (Wikipédia) ; requêtes en espagnol et en anglais, deux relecteurs ; à rétablir si une page apporte un fumoir', `updated_at` = NOW()
 WHERE `id` = 1268 AND `country_id` = 'spain';

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 29 octobre 2026 : la liste officielle des bars et restaurants de Claridge''s (maybourne.com) ne compte aucun salon cigares (Claridge''s Bar, The Fumoir, The Painter''s Room…) ; le guide de l''hôtel de décembre 2020 interdit de fumer à l''intérieur ; le seul « Cigar Room » d''hôtel londonien trouvé est celui du May Fair Hotel, fermé ; règle de la fiche 155', `updated_at` = NOW()
 WHERE `id` = 279 AND `country_id` = 'uk';

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 294';
INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 294','systeme','fiche_retiree','lounge',411,'cigaraficionado.com : seul Casa de Montecristo a Miami = Brickell (2016) ; aucune trace de Doral'),
  (NULL,'migration 294','systeme','fiche_retiree','lounge',414,'cigardojo.com : liste 2025 des Casa de Montecristo sans Orlando ; coronacigar.com : salon voisin'),
  (NULL,'migration 294','systeme','fiche_retiree','lounge',417,'grandcanalshoppes.com : fumer interdit ; halfwheel.com : Club Macanudo americains hors New York = Bossier City'),
  (NULL,'migration 294','systeme','fiche_retiree','lounge',229,'cigarinspector.com : guide des cigares a Paris sans rue de Rivoli ; davidoff.com : localisateur sans Paris intra-muros'),
  (NULL,'migration 294','systeme','fiche_retiree','lounge',230,'wikipedia.org : musee de la Seita ferme en juin 2000, 7e arrondissement'),
  (NULL,'migration 294','systeme','fiche_retiree','lounge',241,'lebonbon.fr : place du Theatre sans cave a cigares ; le-diplomate.fr = Chalons-en-Champagne'),
  (NULL,'migration 294','systeme','fiche_retiree','lounge',1265,'vilaweb.cat : elBulli1846, musee sur rendez-vous, aucune mention de cigares'),
  (NULL,'migration 294','systeme','fiche_retiree','lounge',1268,'wikipedia.org : La Gran Pena = autre cercle (Gran Via 2) ; aucun fumoir atteste au Casino de Madrid'),
  (NULL,'migration 294','systeme','fiche_retiree','lounge',279,'maybourne.com : liste des bars de Claridges sans salon cigares (regle de la fiche 155)');

-- Contrôle : des 1 partout.
SELECT
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (411,414,417,229,230,241,1265,1268,279) AND `is_verified` = 0 AND `source` LIKE 'RETIRÉ%') = 9 AS `neuf_retires`,
  (SELECT COUNT(*) FROM `moderation_log` WHERE `acteur_nom` = 'migration 294') = 9 AS `neuf_traces`;
