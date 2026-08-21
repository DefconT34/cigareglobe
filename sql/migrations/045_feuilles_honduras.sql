-- ════════════════════════════════════════════════════════
-- 045 — Le Honduras, ou l'exil du Corojo
-- ────────────────────────────────────────────────────────
-- Huitième lot de la table `feuilles`, et il referme l'histoire que la
-- migration 042 avait ouverte.
--
-- ── LA PLANTE QUE CUBA A PERDUE ─────────────────────────
--
-- Le Corojo de Diego Rodríguez, créé en 1947, a été chassé des champs
-- cubains par le moho azul. Mais dans les années 1960 — donc AVANT la
-- crise — la maison Camacho en avait planté la semence dans la vallée
-- de Jamastrán, dont le climat rappelle celui de la Vuelta Abajo.
--
-- Elle revendique d'y avoir fait pousser la première feuille de Corojo
-- non cubaine. C'est une revendication de maison, pas un fait établi, et
-- la fiche la présente comme telle.
--
-- Ce qui est vérifiable est plus fort : aujourd'hui, l'essentiel du
-- Corojo du monde vient de Jamastrán. La plante que Cuba a dû
-- abandonner a continué ailleurs.
--
-- La migration 030 avait déjà corrigé la zone — « Vallée de Jamastrán »
-- au lieu de « Jamastran Valley », et sa note « Corojo réputé hors de
-- Cuba » au lieu d'un superlatif. Les deux fiches se répondent.
--
-- ── DEUX NOMS QUI EXISTENT AILLEURS ─────────────────────
--
-- « Corojo » et « Connecticut Shade » désignent aussi des feuilles
-- cubaine et américaine, déjà dans la table. Ce n'est pas un doublon :
-- ce sont les mêmes SEMENCES sur d'autres terres, et l'atlas raconte
-- justement ces transplantations.
--
-- Techniquement, aucune collision : `action=country` ne rend que les
-- feuilles du pays demandé, et le front apparie par nom DANS cette
-- liste. Deux « Corojo » ne se croisent jamais.
-- ════════════════════════════════════════════════════════

INSERT INTO `feuilles`
  (`id`, `name`, `country_id`, `emploi`, `genese`, `culture`, `caracteres`, `notes`, `pairings`)
VALUES
(
  'honduras-corojo',
  'Corojo',
  'honduras',
  'Cape',
  'La semence cubaine de 1947 arrive dans la vallée de Jamastrán au cours des années 1960, plantée par la maison Camacho — qui revendique d''y avoir fait pousser la première feuille de Corojo hors de Cuba. Le moho azul chassera l''originale des champs cubains une quinzaine d''années plus tard : ce qui n''était qu''un essai est devenu un refuge.',
  'Culture sous toile d''ombrage, dans une vallée dont le climat rappelle celui de la Vuelta Abajo. C''est de là que vient aujourd''hui l''essentiel du Corojo du monde.',
  'Elle a gardé la puissance et l''épice de la souche d''origine — c''est ce qu''on vient y chercher, et ce que Cuba avait perdu en la remplaçant par des hybrides résistants.',
  '["Épices","Poivre","Cuir"]',
  '["Rhum vieux","Café noir","Cacao"]'
),
(
  'honduras-connecticut-shade',
  'Connecticut Shade',
  'honduras',
  'Cape',
  'La semence de Nouvelle-Angleterre, transplantée au Honduras. Le pays est l''un des rares à cultiver côte à côte deux capes d''ombrage aux caractères opposés : celle-ci et le Corojo.',
  'Sous toile, comme dans sa vallée d''origine — mais sous un soleil tropical, ce qui n''appelle pas les mêmes gestes ni les mêmes durées.',
  'Cape claire et douce, à l''opposé du Corojo voisin. Les deux poussent dans le même pays et servent des assemblages contraires : c''est la palette du Honduras.',
  '["Douceur","Cèdre","Pain grillé"]',
  '["Café au lait","Thé blanc","Vin blanc sec"]'
);
