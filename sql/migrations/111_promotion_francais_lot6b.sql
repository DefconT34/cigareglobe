-- ════════════════════════════════════════════════════════
-- 111 — Promotion vers le français, suite du lot 6
-- ────────────────────────────────────────────────────────
-- Plasencia et La Flor Dominicana.
--
-- ── UN RECORD QUI N'A PAS D'ARBITRE ─────────────────────
--
-- « le Double Ligero — LE PLUS GRAND CIGARE PRODUIT EN SÉRIE DANS LE
-- MONDE » (français), « THE LARGEST COMMERCIALLY PRODUCED CIGAR IN THE
-- WORLD » (anglais). Aucun organisme ne tient ce registre.
--
-- Ce qui reste est meilleur, parce que vérifiable : 75 × 184 mm. Le
-- lecteur qui veut comparer a le chiffre ; l'atlas ne prétend pas avoir
-- mesuré tous les cigares du monde.
--
-- Même traitement pour « sa manufacture est LA SEULE à posséder le
-- moule » : l'anglais dit ce qui est réellement su — la maison a fait
-- fabriquer ce moule pour elle seule. Commander en exclusivité est un
-- fait ; être seul au monde à en posséder un est une enquête.
--
-- ── TROIS RANGS DE PLUS ─────────────────────────────────
--
--   « le fournisseur LE PLUS DISCRET ET LE PLUS ESSENTIEL de
--     l'industrie » (Plasencia, français) — deux superlatifs, dont l'un
--     est par nature invérifiable : mesurer la discrétion.
--   « NO OTHER INDEPENDENT GROWER approaches that scale » (anglais) —
--     retiré. Les 3 000 acres restent, et ils se comptent.
--   « the list […] reads like a directory of the American market's
--     FINEST » — devient « un annuaire du marché américain ». La liste
--     de maisons qui suit est le fait ; le classement, l'ornement.
--
-- ── ET UNE FORMULE GARDÉE, PARCE QU'ATTRIBUÉE ───────────
--
-- « relève du génie commercial ou de la philosophie du terroir, SELON LE
-- POINT DE VUE » (Mystery Ligero). L'anglais pose lui-même l'alternative
-- sans trancher. C'est l'inverse d'une affirmation non sourçable : le
-- texte dit explicitement qu'il ne sait pas.
-- ════════════════════════════════════════════════════════

-- ── Plasencia ───────────────────────────────────────────
UPDATE `brands` SET `history` =
'La famille Plasencia cultive le tabac depuis 1865 — une continuité de cinq générations, sur deux continents, à travers l''un des bouleversements les plus profonds qu''ait connus le métier. Ce qui a commencé dans la province cubaine de Pinar del Río a survécu à la révolution cubaine, à la révolution nicaraguayenne, à la guerre des Contras et à un demi-siècle d''instabilité économique en Amérique centrale — et la famille n''a pas cessé de cultiver.

L''exil de Cuba, en 1961, fixa la trajectoire. Comme la plupart des familles de tabac cubaines, les Plasencia emportèrent leurs semences, leur savoir et leurs relations professionnelles. À la différence de la plupart, ils trouvèrent des terres réellement exceptionnelles. La vallée de Jalapa, dans le nord du Nicaragua — un bassin volcanique à 900 mètres d''altitude, dont l''humidité et les amplitudes de température rappellent une partie de ce qui fait la Vuelta Abajo — devint leur base principale.

Pendant des décennies, l''histoire des Plasencia fut invisible pour le fumeur et essentielle pour presque tous les fabricants. La famille a fourni la feuille à Davidoff, qui l''emploie dans le Millennium Blend. À Padrón, qui l''emploie dans la série 1926. À My Father, qui a bâti en partie sur elle son identité nicaraguayenne. Ashton, Rocky Patel, Alec Bradley — la liste des maisons dont la production premium nicaraguayenne dépend de la feuille Plasencia se lit comme un annuaire du marché américain.

L''Alma Fuerte, lancée en 2018, fut la première tentative sérieuse de la famille de faire des cigares sous sa propre identité. Le nom — âme forte — dit ce que les Plasencia voulaient exprimer après cinquante ans passés à soutenir les marques des autres. L''assemblage réunit leurs meilleurs tabacs du Nicaragua et du Honduras, roulés dans des formats d''une taille et d''une complexité de construction inhabituelles. La réponse du marché fut immédiate : la demande dépassa la production dès la première année.

La famille exploite aujourd''hui plus de 3 000 acres de plantations au Nicaragua, au Honduras et au Guatemala. Perfecto García, patriarche de la génération actuelle, arpente encore les champs. L''affaire née dans la Cuba du XIXe siècle n''a jamais cessé de croître.'
WHERE `name` = 'Plasencia';

-- ── La Flor Dominicana ──────────────────────────────────
UPDATE `brands` SET `history` =
'José « Jochy » Blanco a fondé La Flor Dominicana à Santiago, en République dominicaine, en 1996, avec une ligne dont il n''a pas dévié : faire ce que les autres ne font pas. Dans un métier qui privilégie souvent l''incrément — le léger ajustement d''un assemblage établi, le format familier sous une nouvelle cape —, Blanco a bâti sa réputation sur l''expérimentation véritable et sur des décisions de production que la plupart des fabricants refuseraient pour des raisons pratiques.

Le Double Ligero — un double torpedo de 75 × 184 mm — en est l''expression la plus nette. Le seul défi technique est considérable : le format exige un moule de dimensions si particulières que La Flor Dominicana l''a fait fabriquer pour elle seule. L''expérience qu''il produit — trois heures au minimum, cinq phases aromatiques distinctes, du cèdre léger au premier tiers jusqu''à la terre profonde et au chocolat noir dans la dernière demi-heure — tient autant de l''épreuve d''endurance que du plaisir.

Au-delà de ce format vitrine, les apports techniques de Blanco à la production dominicaine sont substantiels. Il a introduit pour les ligeros dominicains des protocoles de fermentation prolongée que d''autres manufactures de l''île ont adoptés ensuite. Son emploi de tabacs dits « Mystery Ligero » — des feuilles d''origine volontairement non divulguée, ajoutées à plusieurs assemblages pour créer un caractère que l''analyse ne peut pas rattacher à une région connue — relève du génie commercial ou de la philosophie du terroir, selon le point de vue.

La manufacture de Santiago produit un catalogue qui va du cigare dominicain doux de tous les jours aux expressions extrêmes du Double Ligero. Cette amplitude est inhabituelle pour une maison de cette taille : la plupart des fabricants de niche trouvent leur registre et s''y tiennent. La Flor Dominicana parcourt tout le spectre, et montre que la République dominicaine, poussée comme il faut, produit des tabacs aussi exigeants que ceux du Nicaragua ou du Honduras.'
WHERE `name` = 'La Flor Dominicana';
