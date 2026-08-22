-- ════════════════════════════════════════════════════════
-- 047 — Les Philippines, ou le tabac venu avec les moines
-- ────────────────────────────────────────────────────────
-- Dixième et dernier lot de la table `feuilles` pour les variétés
-- documentables. Il reste après lui deux étiquettes délibérément sans
-- fiche — voir plus bas.
--
-- ── CE QUE LES SOURCES DONNENT ──────────────────────────
--
-- La semence a suivi la FOI CATHOLIQUE : ce sont les frères qui l'ont
-- répandue dans l'archipel, et qui ont trouvé qu'elle prospérait dans
-- la vallée de Cagayan, province d'Isabela — un climat proche de celui
-- de la Vuelta Abajo cubaine.
--
-- L'Espagne y tient un monopole du tabac jusqu'à son abolition en 1881.
-- La même année, le marquis de Comillas fonde à Barcelone la Compañía
-- General de Tabacos de Filipinas pour en prendre la suite. Sa
-- manufacture de Manille est LA PREMIÈRE FABRIQUE DE CIGARES D'ASIE.
--
-- En 1885 naît sa maison phare, LA FLOR DE LA ISABELA — que l'atlas
-- liste déjà parmi les tabacaleras philippines. Elle porte le nom d'une
-- VARIÉTÉ DE FEUILLE, celle qui pousse encore au nord de la vallée de
-- Cagayan. La marque et la plante sont la même chose : c'est le genre
-- de lien que cette table est faite pour montrer.
--
-- Les souches locales portent des noms qu'on ne lit nulle part
-- ailleurs : Cimaba, Viscaya, Isabela.
--
-- ── LE NOM DE LA FICHE NE BOUGE PAS ─────────────────────
--
-- « Tabac natif de Cagayan » vient de la migration 031, qui corrigeait
-- une erreur : la fiche annonçait « Burley » et « Virginia », des
-- tabacs à CIGARETTES. Le nom retenu est une catégorie plutôt qu'un
-- cultivar, et c'est justifié — les sources parlent de plusieurs
-- souches locales, pas d'une seule. La fiche les nomme au lieu de
-- choisir arbitrairement l'une d'elles comme titre.
--
-- ── DEUX ÉTIQUETTES QUI RESTENT SANS FICHE ──────────────
--
-- « Ecuador Sumatra » (ajoutée par la migration 039) et le « Claro »
-- mexicain (migration 040) gardent leur étiquette non cliquable.
--
-- La première existe — les sources décrivent bien trois capes
-- équatoriennes — mais je n'ai pas de matière propre à elle. La seconde
-- est probablement une nuance de cape et non une variété, sans que j'en
-- aie la certitude.
--
-- Dans les deux cas, un nom sans article vaut mieux qu'un article
-- inventé. C'est la règle de docs/relecture.md, appliquée à du contenu
-- neuf plutôt qu'à du contenu relu.
-- ════════════════════════════════════════════════════════

INSERT INTO `feuilles`
  (`id`, `name`, `country_id`, `emploi`, `genese`, `culture`, `caracteres`, `notes`, `pairings`)
VALUES
(
  'philippines-cagayan',
  'Tabac natif de Cagayan',
  'philippines',
  'Cape, sous-cape et tripe',
  'La semence a suivi la foi : ce sont les frères missionnaires qui l''ont répandue dans l''archipel, et qui ont trouvé qu''elle prospérait dans la vallée de Cagayan, province d''Isabela. L''Espagne y tint un monopole du tabac jusqu''à son abolition en 1881 — l''année même où le marquis de Comillas fonde à Barcelone la compagnie qui lui succédera, et dont la manufacture de Manille sera la première fabrique de cigares d''Asie.',
  'La vallée de Cagayan s''étend à quatre cents kilomètres au nord de Manille. Son climat est proche de celui de la Vuelta Abajo cubaine, et c''est ce qui a décidé de sa vocation.',
  'Ce n''est pas un cultivar mais une famille de souches locales — Cimaba, Viscaya, Isabela — dont on ne lit les noms nulle part ailleurs. La dernière a donné le sien à la maison La Flor de la Isabela, fondée en 1885 : ici, la marque et la plante sont la même chose.',
  '["Bois","Terre","Épices douces"]',
  '["Thé noir","Café allongé","Fruits secs"]'
);
