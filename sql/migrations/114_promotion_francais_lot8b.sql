-- ════════════════════════════════════════════════════════
-- 114 — Promotion vers le français, suite du lot 8
-- ────────────────────────────────────────────────────────
-- Rocky Patel et Perdomo.
--
-- ── CINQUIÈME NOTE DE PRESSE ────────────────────────────
--
-- « The 1990, 1992, and 1999 Vintages EARNED CRITICAL SCORES BETWEEN 92
-- AND 95 consistently across multiple reviews » (Rocky Patel, anglais).
--
-- Même forme que celle de Davidoff au lot précédent, et même raison de
-- passer inaperçue : le motif anglais exige « scored » suivi d'un
-- nombre, ou « N points ». « earned scores between » n'a ni l'un ni
-- l'autre, et « multiple reviews » ne nomme aucune revue.
--
-- Ce que le texte garde est ce qui reste vrai sans la note : la série a
-- établi la crédibilité de la maison auprès d'un public qui tenait le
-- cigare abordable pour un compromis.
--
-- ── ET UN CONSENSUS DE CRITIQUES ────────────────────────
--
-- « a profile that SEVERAL REVIEWERS DESCRIBED AS THE MOST ACCOMPLISHED
-- NICARAGUAN CIGAR they had smoked » (Perdomo). Quatrième variante de
-- « many experts consider » du chantier, après Bolívar (105), Camacho
-- (106) et Montecristo (108).
--
-- ── TROIS RANGS ─────────────────────────────────────────
--
--   « Rocky Patel est L'UNE DES DIX PLUS GRANDES MANUFACTURES
--     AMÉRICAINES » (français) — un classement chiffré que rien
--     n'établit. Les trente gammes, elles, se comptent et restent.
--   « the cigar industry's MOST IMPROBABLE SUCCESS STORY in the American
--     market » — devient « l'une des plus improbables ».
--   « THE MOST COMPREHENSIVE approach to market segmentation in the
--     premium American industry » — devient « une segmentation
--     méthodique », suivie de sa description.
--   « une continuité narrative UNIQUE DANS L'INDUSTRIE » (français) —
--     retirée.
--
-- ── CE QUI EST GARDÉ ────────────────────────────────────
--
-- « défie directement la Serie V d'Oliva sur son propre terrain » et
-- « les maisons dont on discute les hautes expressions à côté de celles
-- de Padrón et d'Oliva » : situer une maison par rapport à d'autres
-- nommées n'est pas la classer. Le lecteur peut comparer lui-même.
-- ════════════════════════════════════════════════════════

-- ── Rocky Patel ─────────────────────────────────────────
UPDATE `brands` SET `history` =
'La trajectoire de Rocky Patel est l''une des plus improbables du cigare américain. Il passa sa vingtaine comme avocat du spectacle à Los Angeles, avec des clients dont les horaires faisaient des salons à cigares un habitat professionnel naturel. Il apprit le tabac comme un avocat apprend la plupart des choses : en posant des questions, en lisant beaucoup, et en parlant à ceux qui savaient. Au début des années 1990, il connaissait le marché du cigare premium mieux que la plupart de ses confrères.

En 1995, il décida d''y entrer. Il n''avait ni passé de planteur, ni relation avec une manufacture, ni réseau commercial. Il avait des compétences juridiques, un instinct commercial et une thèse précise : l''engouement américain des années 1990 créait une demande que les fabricants premium ne satisfaisaient pas à des prix accessibles. Padrón était excellent mais cher. Davidoff était irréprochable mais visait un autre client. Entre la vraie qualité et le prix quotidien, il y avait un espace que personne ne traitait avec le sérieux qu''il comptait y mettre.

La série Vintage, introduite au début des années 2000, mit cette thèse en produit : des cigares bâtis autour de tabacs vieillis depuis le millésime porté sur la bague, vendus à des prix qui autorisent le cigare sérieux de tous les jours plutôt que la cérémonie occasionnelle. Les Vintage 1990, 1992 et 1999 ont établi la crédibilité de la maison auprès d''un public qui tenait jusque-là le cigare abordable pour un compromis.

Le catalogue qui a suivi — plus de trente gammes réparties sur plusieurs niveaux de prix — répond à une segmentation méthodique du marché : chaque gamme vise une préférence de goût et un budget, avec une qualité de fabrication dont le plancher empêche qu''un Rocky Patel, quel que soit son prix, ne fasse honte à la marque. Cette régularité découle directement des relations que Patel a nouées avec des manufacturiers honduriens sur deux décennies de production de plus en plus concertée.'
WHERE `name` = 'Rocky Patel';

-- ── Perdomo ─────────────────────────────────────────────
UPDATE `brands` SET `history` =
'Le lien de Nick Perdomo avec le tabac nicaraguayen est généalogique avant d''être commercial. Sa famille cultivait le tabac dans la province cubaine de Pinar del Río depuis des générations avant que la révolution ne referme ce chapitre. Les semences et le savoir emportés en exil n''étaient pas des métaphores : les Perdomo, comme les Oliva et les Plasencia, ont conservé du matériel génétique de plants cubains, qu''ils ont fini par mettre en terre au Nicaragua.

Cette continuité compte, parce que l''argument central de la maison — le tabac nicaraguayen de la vallée de Jalapa peut rivaliser de complexité et de profondeur avec le cubain — n''est pas une formule publicitaire mais la conclusion de quelqu''un qui a grandi avec les deux. Le père de Nick Perdomo savait le goût du tabac de la Vuelta Abajo parce qu''il l''avait cultivé. Nick le savait parce que son père le lui avait montré. La comparaison qu''il fait en décrivant sa feuille nicaraguayenne s''appuie sur une mémoire sensorielle transmise.

L''exploitation d''Estelí contrôle son approvisionnement plus complètement que la plupart des fabricants du marché américain. Là où les concurrents passent par des courtiers ou des contrats de fourniture, Perdomo cultive une part importante de ses tabacs sur des terres familiales, selon des pratiques affinées depuis un siècle. Les capes des gammes premium — y compris les cas rares où il emploie une cape nicaraguayenne plutôt que le Connecticut Shade d''Équateur que préfèrent la plupart des maisons — représentent des années de sélection variétale et d''essais de fermentation.

La série 20th Anniversary, sortie en 2012 pour les vingt ans de la maison, en montre clairement l''ambition. La cape oscuro nicaraguayenne — fermentée longuement pour développer le caractère sombre et huileux que le San Andrés Maduro donne plus naturellement — produit sur la tripe de Jalapa un profil de chocolat noir et d''expresso qui défie directement la Serie V d''Oliva sur son propre terrain. Le robusto est la vitole qui a placé Perdomo parmi les maisons dont on discute les hautes expressions à côté de celles de Padrón et d''Oliva.'
WHERE `name` = 'Perdomo';
