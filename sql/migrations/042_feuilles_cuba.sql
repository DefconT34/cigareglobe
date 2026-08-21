-- ════════════════════════════════════════════════════════
-- 042 — Les trois feuilles de Cuba, ou l'histoire d'une maladie
-- ────────────────────────────────────────────────────────
-- Cinquième lot de la table `feuilles`, et le premier qui concerne un
-- pays ROULEUR et non un vendeur de feuille. Les cinq précédents
-- couvraient le périmètre que la migration 036 avait identifié chiffres
-- en main ; on entre ici dans le tabac que le pays transforme lui-même.
--
-- ── LES TROIS NE SE COMPRENNENT QUE L'UNE PAR L'AUTRE ───
--
-- CRIOLLO est là depuis toujours : le mot veut dire « semence native »,
-- et cette plante est réputée présente sur l'île au moment où Colomb y
-- débarque.
--
-- COROJO est une création datée — 1947, par Diego Rodríguez, et
-- expressément pour faire des capes. Elle a un défaut qui finira par la
-- condamner : elle attrape tout.
--
-- HABANO 2000 naît de cette faiblesse. À la fin des années 1970, le
-- MOHO AZUL — un champignon — arrive à Cuba et détruit la production.
-- Les agronomes cubains croisent alors le Corojo avec Bell 61-10, un
-- tabac de cigarette, et retiennent la troisième hybridation : même
-- aspect et même goût que le Corojo, mais résistante.
--
-- La même crise a donné CRIOLLO 98 et COROJO 99, que l'atlas liste déjà
-- au Nicaragua. Ce sont des semences cubaines cultivées ailleurs — le
-- lien se verra quand ces fiches-là seront écrites.
--
-- ── UNE GRAPHIE QU'ON NE TRANCHE PAS ────────────────────
--
-- Les sources écrivent aussi bien « Habano 2000 » que « HABANA 2000 »,
-- parfois dans le même texte. Le nom de la fiche ne bouge donc pas, et
-- la genèse mentionne la seconde graphie plutôt que d'arbitrer.
--
-- C'est le même parti pris que pour le « Claro » mexicain de la
-- migration 040 : quand la source hésite, on le dit au lieu de choisir
-- en silence.
-- ════════════════════════════════════════════════════════

INSERT INTO `feuilles`
  (`id`, `name`, `country_id`, `emploi`, `genese`, `culture`, `caracteres`, `notes`, `pairings`)
VALUES
(
  'cuba-criollo',
  'Criollo',
  'cuba',
  'Tripe et sous-cape',
  'Le mot signifie « semence native », et c''est tout son propos : cette plante est réputée présente sur l''île au moment où Colomb y débarque. Toutes les variétés cubaines qui ont suivi en descendent de près ou de loin.',
  'Cultivée en plein soleil pour la tripe, et la même souche passe sous la toile quand on lui demande une cape. C''est l''usage, plus que la plante, qui décide.',
  'Feuille de fond plutôt que de façade : elle porte le goût de l''assemblage sans chercher à l''habiller. Sa réputation tient à son ancienneté autant qu''à son caractère.',
  '["Terre","Cuir","Note boisée"]',
  '["Rhum cubain","Café serré","Chocolat noir"]'
),
(
  'cuba-corojo',
  'Corojo',
  'cuba',
  'Cape',
  'Une création datée : 1947, par Diego Rodríguez, et expressément destinée à faire des capes. Elle a régné sur les habanos pendant un demi-siècle avant qu''une maladie ne la chasse des champs cubains.',
  'Culture sous toile d''ombrage, comme toute feuille destinée à la cape. Son défaut n''était pas au champ mais dans sa constitution : elle attrapait tout, et les récoltes se perdaient.',
  'Cape fine et régulière, dont le nom a survécu à la plante : on le retrouve au Honduras et dans le Corojo 99 cubain, sa descendance résistante.',
  '["Épices","Cèdre","Poivre"]',
  '["Rhum vieux","Café noir","Cacao"]'
),
(
  'cuba-habano-2000',
  'Habano 2000',
  'cuba',
  'Cape',
  'Elle naît d''une catastrophe. À la fin des années 1970, le moho azul — un champignon — arrive à Cuba et détruit la production. Les agronomes croisent le Corojo avec Bell 61-10, un tabac de cigarette, et retiennent la troisième hybridation. On l''écrit aussi « Habana 2000 » : les deux graphies circulent.',
  'Cultivée sous toile, comme le Corojo dont elle prend la place. Toute sa raison d''être est là : tenir debout face à la maladie qui avait emporté sa devancière.',
  'On lui a demandé l''aspect et le goût du Corojo avec sa résistance en plus, et c''est ce qu''elle donne. Une cape de remplacement qui a fini par s''imposer pour elle-même.',
  '["Épices douces","Bois","Cuir"]',
  '["Rhum ambré","Café au lait","Fruits secs"]'
);
