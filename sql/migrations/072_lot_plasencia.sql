-- ════════════════════════════════════════════════════════
-- 072 — Le dernier lot, et le compte des fautes
-- ────────────────────────────────────────────────────────
-- Fin de la campagne de fuite d'anglais : 691 éléments au départ, zéro
-- ici. Ce dernier lot ne contient plus de gros défaut de fond — mais
-- il en contient deux petits, et ils méritent d'être comptés.
--
--   « le cognac d'entrée gamme »        (Avo)      — « de » manquant
--   « Notes de poivre commun aux deux » (Camacho)  — accord rompu
--
-- Avec « teste chaque blend en LES fumant » (068), « un accord d'UNE
-- raffinement absolu » (069) et « l'Armagnac VIEILLIT » (071), cela
-- fait cinq fautes de français dans le texte source. Toutes les cinq
-- ont été trouvées en TRADUISANT — jamais en relisant le français.
--
-- La raison est mécanique : relire sa propre langue, c'est glisser sur
-- le sens déjà connu. Traduire oblige à décider ce que chaque mot fait
-- dans la phrase, et une faute d'accord se voit à ce moment-là parce
-- qu'elle empêche de décider.
--
-- ── UNE RARETÉ QUI NE SE VÉRIFIE PAS ────────────────────
--
-- Trinidad Robustos Extra : « Édition limitée, produite en quantités
-- infimes. Les connaisseurs font la queue lors des lancements. »
--
-- C'est la même affirmation que « épuisé en heures lors de chaque
-- lancement » chez Don Carlos, retirée à la migration 070 : une rareté
-- annoncée que rien ne mesure. Le Robustos Extra a par ailleurs figuré
-- en production courante, ce qui contredit « édition limitée ».
--
-- ── DEUX SUPERLATIFS DANS UNE PHRASE ────────────────────
--
-- « Le café le plus doux et le plus raffiné DU MONDE pour le cigare le
-- plus élégant DE CUBA » : deux classements mondiaux en douze mots, sur
-- un accord café-cigare. Le Blue Mountain et le Connaisseur n°1 tiennent
-- très bien debout sans être couronnés.
--
-- ── ET LE CHÂTEAU BORDELAIS ─────────────────────────────
--
-- Plasencia « publie les notes de dégustation de chaque millésime comme
-- un château bordelais » : affirmation précise, vérifiable en principe,
-- invérifiée en pratique. Ce qui reste — un assemblage qui change
-- d'une récolte à l'autre et l'assume — est déjà le point intéressant.
--
-- « Concept unique dans le monde du cigare » part avec.
--
-- ── LE CAFÉ DES « MÊMES TERRES », ENCORE ────────────────
--
-- La migration 068 a corrigé chez My Father un café de Jinotega présenté
-- comme « le café des mêmes collines d'Estelí » — deux régions
-- distinctes. Plasencia porte la même tournure : « le café des mêmes
-- terres que le blend Cosecha », pour un café de Marcala.
--
-- Je ne peux pas établir que les tabacs de la Cosecha viennent de
-- Marcala, et la formule a déjà été fausse une fois. Elle est retirée
-- plutôt que confirmée à l'aveugle : l'accord se défend par les arômes,
-- qui eux sont dans le verre.
-- ════════════════════════════════════════════════════════

-- ── Plasencia ───────────────────────────────────────────
UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[1].story',
  'Le nombre renvoie à la 146e récolte de la famille, qui plante depuis 1865. Assemblage annuel : chaque millésime diffère selon ce que la récolte a donné. C''est une approche rare dans le cigare, où l''on cherche d''ordinaire à reproduire le même goût d''une année sur l''autre.')
WHERE `name` = 'Plasencia';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[2].story',
  '« L''âme du champ » — hommage aux travailleurs des plantations. Format Corona (44 x 140mm). Mi-corsée, accessible, avec la signature terreuse de Plasencia. Notes de foin séché, herbes aromatiques, bois léger. Le cigare de tous les jours dans le catalogue de la maison.')
WHERE `name` = 'Plasencia';

UPDATE `brands` SET `pairings` = JSON_SET(`pairings`, '$[1].notes',
  'Le café hondurien de Marcala, aux notes de caramel et d''agrumes, s''harmonise avec la douceur terreuse d''une Alma del Campo.')
WHERE `name` = 'Plasencia';

-- ── H. Upmann ───────────────────────────────────────────
UPDATE `brands` SET `celebrities` = JSON_SET(`celebrities`, '$[1].anecdote',
  'Le fondateur, banquier avant d''être cigarier, a fait de la présentation du cigare un argument à part entière : boîtes de cèdre, sceau de cire, puis tubes d''aluminium. Ce sont ses codes que la profession a repris, et c''est par eux que le cigare est devenu un objet qu''on offre.')
WHERE `name` = 'H. Upmann';

UPDATE `brands` SET `pairings` = JSON_SET(`pairings`, '$[2].notes',
  'Le Blue Mountain, doux et sans amertume agressive, laisse toute la place à la finesse d''un H. Upmann. Accord de connaisseurs.')
WHERE `name` = 'H. Upmann';

-- ── Trinidad ────────────────────────────────────────────
UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[3].story',
  'Robusto Extra (50 x 155mm). La vitole la plus ambitieuse de la gamme moderne : ce que la maison sait faire de plus complexe, dans une heure de fumée. Les volumes sont faibles et la disponibilité irrégulière — c''est un format qu''on trouve quand on le trouve.')
WHERE `name` = 'Trinidad';

-- ── Avo, Camacho ────────────────────────────────────────
UPDATE `brands` SET `pairings` = JSON_SET(`pairings`, '$[1].notes',
  'Le cognac d''entrée de gamme — accessible comme l''Avo Classic, et bâti comme une improvisation de jazz. Accord des soirées musicales.')
WHERE `name` = 'Avo';

UPDATE `brands` SET `pairings` = JSON_SET(`pairings`, '$[0].notes',
  'Le bourbon à forte proportion de seigle, épicé et sec, s''accorde naturellement avec le Corojo hondurien. Notes de poivre communes aux deux.')
WHERE `name` = 'Camacho';
