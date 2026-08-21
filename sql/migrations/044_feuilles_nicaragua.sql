-- ════════════════════════════════════════════════════════
-- 044 — Le Nicaragua, ou la suite de l'histoire cubaine
-- ────────────────────────────────────────────────────────
-- Septième lot de la table `feuilles`. Il se lit dans le prolongement
-- direct de la migration 042 : deux des trois variétés nicaraguayennes
-- SONT les hybrides nés du moho azul cubain.
--
--   CRIOLLO 98 croise Havana 92 et Habana P.R. Feuille courte — sa
--   largeur fait 65 % de sa longueur — ce qui la destine à la tripe et
--   à la sous-cape.
--
--   COROJO 99 croise le Criollo 98 avec le Corojo d'origine, pour
--   garder le goût de 1947 sans sa fragilité. Feuille plus longue :
--   55 % seulement.
--
-- Ces proportions ne sont pas une coquetterie. C'est la forme de la
-- feuille qui décide de son emploi, et deux chiffres disent ici ce
-- qu'un paragraphe expliquerait mal.
--
-- Le gros des surfaces nicaraguayennes est planté de ces deux-là, avec
-- quelques hectares de Havana 92 — la génération d'avant.
--
-- ── CE QUE LA VALLÉE FAIT À LA FEUILLE ──────────────────
--
-- La même semence ne donne pas la même chose selon l'endroit : le
-- Criollo d'Estelí est plus franc et plus corsé, celui de Jalapa plus
-- rond, plus sucré, l'épice adoucie.
--
-- Cela recoupe exactement ce que la migration 030 avait corrigé sur les
-- zones — Estelí à 844 m et son tabac puissant, Jalapa et ses feuilles
-- douces, Condega et son sol rocailleux qui donne une feuille plus
-- fine. Les deux bouts de l'atlas se répondent sans avoir été écrits
-- ensemble.
--
-- ── « HABANO », UN NOM DE FAMILLE ───────────────────────
--
-- La troisième entrée de la fiche s'appelle simplement « Habano ». Ce
-- n'est pas une variété au sens strict mais le nom donné aux semences
-- de souche cubaine cultivées hors de Cuba — la famille dont Criollo 98
-- et Corojo 99 sont deux membres datés.
--
-- On ne la supprime pas : le mot est employé partout dans le métier, et
-- l'atlas le nomme déjà en Équateur (Ecuador Habano) et au Panama
-- (Habano Panamá). Sa fiche dit ce qu'il recouvre plutôt que de faire
-- semblant qu'il désigne une plante précise.
-- ════════════════════════════════════════════════════════

INSERT INTO `feuilles`
  (`id`, `name`, `country_id`, `emploi`, `genese`, `culture`, `caracteres`, `notes`, `pairings`)
VALUES
(
  'nicaragua-criollo-98',
  'Criollo 98',
  'nicaragua',
  'Tripe et sous-cape',
  'Une réponse cubaine au moho azul : le croisement de Havana 92 et de Habana P.R., sélectionné pour résister au champignon qui avait détruit les récoltes de la fin des années 1970. Le Nicaragua l''a adoptée et en a fait l''une de ses deux semences principales.',
  'Cultivée dans les trois vallées du nord — Estelí, Jalapa, Condega — qui se partagent l''essentiel des surfaces avec le Corojo 99.',
  'Feuille courte : sa largeur fait 65 % de sa longueur, ce qui la destine à la tripe et à la sous-cape plutôt qu''à la cape. Elle apporte l''arôme et la force.',
  '["Force","Arôme","Épices"]',
  '["Rhum nicaraguayen","Café serré","Chocolat noir"]'
),
(
  'nicaragua-corojo-99',
  'Corojo 99',
  'nicaragua',
  'Cape et tripe',
  'Le croisement du Criollo 98 avec le Corojo de 1947 — celui de Diego Rodríguez, que la maladie avait chassé des champs cubains. Le but était de retrouver son goût sans sa fragilité, et c''est ce que porte son nom.',
  'Mêmes vallées que le Criollo 98, et les deux se partagent le gros des surfaces nicaraguayennes.',
  'Feuille plus longue que sa parente : la largeur n''y fait que 55 % de la longueur, une proportion qui convient à la cape. Elle garde du Corojo l''épice et le cèdre.',
  '["Épices","Cèdre","Cuir"]',
  '["Rhum vieux","Café noir","Cacao"]'
),
(
  'nicaragua-habano',
  'Habano',
  'nicaragua',
  'Cape et tripe',
  'Ce n''est pas une variété au sens strict mais un nom de famille : celui des semences de souche cubaine cultivées hors de Cuba. Criollo 98 et Corojo 99 en sont deux membres datés ; quelques hectares nicaraguayens portent encore la génération d''avant, Havana 92.',
  'Le mot suit la semence partout où elle s''exporte — l''atlas le retrouve en Équateur et au Panama, sur des terres qui n''ont rien de cubain.',
  'Ce que le mot promet, c''est une filiation plutôt qu''un profil : de l''épice, du corps, et le caractère qu''on associe au tabac cubain, tempéré par le sol qui l''accueille.',
  '["Épices","Corps","Terre"]',
  '["Rhum ambré","Café serré","Chocolat noir"]'
);
