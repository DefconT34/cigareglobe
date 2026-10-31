-- ════════════════════════════════════════════════════════
-- 319 — Relecture des lieux non vérifiés : 23 confirmations et 5 retraits
-- ────────────────────────────────────────────────────────
-- CE QU'ON A TROUVÉ (31 octobre 2026). 106 fiches « à vérifier » ou sans lecture datée ont été relues par neuf lots d'agents
-- (hors franchises Habanos/Davidoff, qui exigent leurs listes officielles). 23 reçoivent une seconde source lue dont une
-- datée 2024-2026 : leur source passe à « relu le 31 octobre 2026 » et le badge « non vérifié » tombe. Les autres restent
-- « à vérifier » : une seule source lue, ou aucune source de 2024-2026. Cinq fiches d'hôtels sont retirées : la page officielle de l'hôtel liste ses bars sans salon cigares et un contradicteur n'a rien trouvé. Sept autres « introuvables » (dont Taillevent, Grand Véfour, Union Interalliée, Augusta National) restent publiées : le contradicteur n'a rien établi dans un sens ni dans l'autre.
-- Les extraits cités sont courts ; ce qui reste douteux est écrit dans la source (saison, activité non établie).
-- ════════════════════════════════════════════════════════

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : broadsheet.com.au, 2 janvier 2024 : « 161 Spring Street ; humidor décrit ; menu reçu le 27 octobre 2025 » ; timeout.com, 31 mars 2021 : « Cigars served with caviar and Champagne »', `updated_at` = NOW()
 WHERE `id` = 2617 AND `is_verified` = 1 AND `source` NOT LIKE 'RETIRÉ%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : habanos.com, 29 août 2024 : « first Habanos Lounge in the market, 2015 Crescent St » ; cigars-connect.com, 11 octobre 2021 : « on the festive rue Crescent »', `updated_at` = NOW()
 WHERE `id` = 2601 AND `is_verified` = 1 AND `source` NOT LIKE 'RETIRÉ%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : ribnreef.com, 2026 : « cigar lounge, 8105 boul. Décarie, tél. au site (pied de page 2026) » ; themain.com, 12 janvier 2026 : « un salon de cigares entièrement approvisionné »', `updated_at` = NOW()
 WHERE `id` = 2602 AND `is_verified` = 1 AND `source` NOT LIKE 'RETIRÉ%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : acento.com.do, 18 février 2026 : « XVIII Festival Procigar 2026 inauguré à Santiago » ; cigar-coop.com, 2026-02 : « that portion of the festival has been cancelled for 2026 »', `updated_at` = NOW()
 WHERE `id` = 1572 AND `is_verified` = 1 AND `source` NOT LIKE 'RETIRÉ%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : enprimeurclub.com, 24 août 2026 : « Av 27 de Febrero 211 ; cigar lounge and bar-restaurant » ; cigar-coop.com, 18 juin 2026 : « celebrated its 30th anniversary ; opened June 1996 »', `updated_at` = NOW()
 WHERE `id` = 2625 AND `is_verified` = 1 AND `source` NOT LIKE 'RETIRÉ%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : theoaklounge.com, 19 octobre 2026 : « Lounge & Shop, Dunkri str 2, 300+ cigars, 2 walk-in humidors » ; gonomad.com, non datée : « Oak Lounge Tobacconists, Dunkri 2, franchise LCDH »', `updated_at` = NOW()
 WHERE `id` = 2626 AND `is_verified` = 1 AND `source` NOT LIKE 'RETIRÉ%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : cigaraficionado.com, 22 avril 2025 : « 145 Rue de la Poste ; carte de cigares, lun-sam 9h-1h » ; airelles.com, non datée : « Le Fumoir, cigar menu PDF, boiseries, whiskies »', `updated_at` = NOW()
 WHERE `id` = 2590 AND `is_verified` = 1 AND `source` NOT LIKE 'RETIRÉ%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : breidenbacherhof.com, non datée : « Bar & Smoking Lounge, walk-in humidor, 124 cigars, from 6 pm » ; enprimeurclub.com, 28 septembre 2026 : « a separate cigar lounge ; horaires au ''May 2026'' »', `updated_at` = NOW()
 WHERE `id` = 2612 AND `is_verified` = 1 AND `source` NOT LIKE 'RETIRÉ%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : cigaraficionado.com, 6 février 2025 : « grand opening of La Casa Cubana Cigar Lounge, Crowne Plaza Digital… » ; moodiedavittreport.com, 7 février 2025 : « the new La Casa Cubana Cigar Lounge, Crowne Plaza Hotel » ; ouverture de janvier 2025 ; activité postérieure non établie', `updated_at` = NOW()
 WHERE `id` = 2621 AND `is_verified` = 1 AND `source` NOT LIKE 'RETIRÉ%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : graubuenden.ch, 2026 : « Vintage Cigar Lounge: smoking allowed, 16:00-00:00 » ; fastly.cigaraficionado.com, 2016-12 : « opulent, cigar-friendly lounge with handmade cigars, humidors »', `updated_at` = NOW()
 WHERE `id` = 2583 AND `is_verified` = 1 AND `source` NOT LIKE 'RETIRÉ%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : myswitzerland.com, non datée : « smoking lounge, 10:00-24:00, plus de 900 cigares » ; whiskyadvocate.com, 30 janvier 2024 : « largest cigar selection of any hotel in the world »', `updated_at` = NOW()
 WHERE `id` = 2584 AND `is_verified` = 1 AND `source` NOT LIKE 'RETIRÉ%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : whiskyadvocate.com, 30 janvier 2024 : « 95 cigares et 80 whiskies » ; burgenstockresort.com, 2026 : « Lakeview Bar & Cigar Lounge (pied de page (c) 2026) »', `updated_at` = NOW()
 WHERE `id` = 2585 AND `is_verified` = 1 AND `source` NOT LIKE 'RETIRÉ%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : finews.ch, 7 février 2022 : « cigar bar, humidor de plus de 30 variétés, fumoir » ; whiskyadvocate.com, 30 janvier 2024 : « several cigar pairings are on the menu »', `updated_at` = NOW()
 WHERE `id` = 2586 AND `is_verified` = 1 AND `source` NOT LIKE 'RETIRÉ%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : zigarren.zone, 3 juillet 2024 : « Löwenstrasse 12, entretien chez Manuel Fröhlich » ; enprimeurclub.com, 20 septembre 2026 : « bar, shop and cigar lounge, Löwenstrasse 12 »', `updated_at` = NOW()
 WHERE `id` = 2587 AND `is_verified` = 1 AND `source` NOT LIKE 'RETIRÉ%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : cigaraficionado.com, 7 octobre 2019 : « Quai du Mont-Blanc 17 ; salon cigares séparé du bar » ; whiskyadvocate.com, 30 janvier 2024 : « The Cigar Lounge, about three dozen cigars » ; salon distinct du Leopard Bar', `updated_at` = NOW()
 WHERE `id` = 2588 AND `is_verified` = 1 AND `source` NOT LIKE 'RETIRÉ%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : thealpinagstaad.ch, 2026 : « walk-in humidor, plus de 60 cigares ; réouverture 11 décembre 2026 » ; whiskyadvocate.com, 30 janvier 2024 : « Cigar Lounge, Cohiba Robusto en accord » ; salon saisonnier, réouverture annoncée le 11 décembre 2026', `updated_at` = NOW()
 WHERE `id` = 2589 AND `is_verified` = 1 AND `source` NOT LIKE 'RETIRÉ%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : cigardojo.com, 23 février 2024 : « luxury cigar lounge à Xinyi, ouverture le 27 février » ; clubmacanudo.com, non datée : « No. 90, Songren Road, Xinyi Dist., Taipei » ; aucune source 2025-2026 sur l''activité', `updated_at` = NOW()
 WHERE `id` = 683 AND `is_verified` = 1 AND `source` NOT LIKE 'RETIRÉ%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : cigarjournal.com, 5 mars 2026 : « salle fumeurs publique, 32e étage, remplace Character » ; sustainablefirst.com, 3 mars 2026 : « cigar and whiskey bar, walk-in humidor, ouverture 27 février »', `updated_at` = NOW()
 WHERE `id` = 2630 AND `is_verified` = 1 AND `source` NOT LIKE 'RETIRÉ%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : cigardojo.com, 13 janvier 2025 : « officially launched ; Al Barsha, entre les deux malls » ; cigarslover.com, 21 janvier 2025 : « large smoking lounge, private VIP rooms, retail area »', `updated_at` = NOW()
 WHERE `id` = 2620 AND `is_verified` = 1 AND `source` NOT LIKE 'RETIRÉ%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : maybourne.com, non datée : « 11am-1am Mon-Sat ; Carlos Place, Mayfair, W1K 2AL » ; sothebysrealty.co.uk, 1 juin 2026 : « rare Cuban cigars, pairing with rare whiskies »', `updated_at` = NOW()
 WHERE `id` = 2609 AND `is_verified` = 1 AND `source` NOT LIKE 'RETIRÉ%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : cigaraficionado.com, 2025-03 : « we have a little lounge, about eight chairs » ; thegeorgetowndish.com, non datée : « 3144 M Street ; the gentle art of smoking »', `updated_at` = NOW()
 WHERE `id` = 426 AND `is_verified` = 1 AND `source` NOT LIKE 'RETIRÉ%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : cigaraficionado.com, 14 mai 2026 : « 3334 Edloe St. ; indoor lounge, walk-in humidor » ; josephscigar.com, non datée : « Houston Edloe location 3334 Edloe St »', `updated_at` = NOW()
 WHERE `id` = 2622 AND `is_verified` = 1 AND `source` NOT LIKE 'RETIRÉ%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : cigaraficionado.com, 12 décembre 2023 : « 2,400 sq ft lounge, second floor, open to the public » ; genesisdiamonds.com, 2026-06 : « Byron Lounge, The Ariston, 508 Church St, 3 juin »', `updated_at` = NOW()
 WHERE `id` = 2624 AND `is_verified` = 1 AND `source` NOT LIKE 'RETIRÉ%';

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 31 octobre 2026 : marriott.com, page des restaurants et bars de l''hôtel : Hacienda Kitchen, Bar 10, La Castilla, La Isabela, sports bar et bar à cocktails, aucun salon cigares. Trois requêtes et un contradicteur n''ont rien trouvé ; à rétablir si l''hôtel annonce un salon.', `updated_at` = NOW()
 WHERE `id` = 1110 AND `is_verified` = 1;

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 31 octobre 2026 : marriott.com, page de restauration du JW Marriott Quito : Raíces, Botánica, Fogo de Chão, The Exchange Bar, aucun cigar bar. Trois requêtes et un contradicteur n''ont rien trouvé ; à rétablir si l''hôtel annonce un salon.', `updated_at` = NOW()
 WHERE `id` = 1149 AND `is_verified` = 1;

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 31 octobre 2026 : all.accor.com, page de l''hôtel : Cacao Lounge, Link Bar, Oasis Pool, aucun fumoir ; le « L''Escale cigar lounge » d''Accor est celui du Novotel Marcory. Trois requêtes et un contradicteur n''ont rien trouvé ; à rétablir si l''hôtel annonce un salon.', `updated_at` = NOW()
 WHERE `id` = 1191 AND `is_verified` = 1;

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 31 octobre 2026 : thewheatbakerlagos.com, site de l''hôtel : The GrillRoom et le café Kófí, aucun cigar bar. Trois requêtes et un contradicteur n''ont rien trouvé ; à rétablir si l''hôtel annonce un salon.', `updated_at` = NOW()
 WHERE `id` = 828 AND `is_verified` = 1;

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 31 octobre 2026 : alsuites.com, site de l''hôtel : 360 Caracas Lounge Bar, Magnolia, Otokam by Makoto, aucun salon cigares. Trois requêtes et un contradicteur n''ont rien trouvé ; à rétablir si l''hôtel annonce un salon.', `updated_at` = NOW()
 WHERE `id` = 1107 AND `is_verified` = 1;

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 319';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 319', 'systeme', 'fiches_relues', 'systeme', 0, 'Relecture des lieux non verifies : 23 confirmes, 5 retires (hotels sans salon), lus le 31 octobre 2026');

-- Contrôle : des 1 partout.
SELECT
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (2617, 2601, 2602, 1572, 2625, 2626, 2590, 2612, 2621, 2583, 2584, 2585, 2586, 2587, 2588, 2589, 683, 2630, 2620, 2609, 426, 2622, 2624) AND `source` LIKE 'relu le 31 octobre 2026%') = 23 AS `confirmees`,
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (1110, 1149, 1191, 828, 1107) AND `is_verified` = 0 AND `source` LIKE 'RETIRÉ — relu le 31 octobre 2026%') = 5 AS `retirees`;
