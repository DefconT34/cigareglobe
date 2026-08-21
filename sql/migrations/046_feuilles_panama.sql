-- ════════════════════════════════════════════════════════
-- 046 — Le Panama, ou le tabac interdit sous peine de mort
-- ────────────────────────────────────────────────────────
-- Neuvième lot de la table `feuilles`.
--
-- ── LE FAIT QUI PORTE TOUTE LA FICHE ────────────────────
--
-- Au XVIe siècle, Philippe II d'Espagne INTERDIT LA CULTURE DU TABAC AU
-- PANAMA SOUS PEINE DE MORT, pour ne pas concurrencer Cuba. La
-- tradition tabacière panaméenne s'est perdue là.
--
-- Sauf à CHIRIQUÍ, à l'ouest du pays, où l'on a continué de récolter.
-- C'est pourquoi tout le tabac panaméen vient aujourd'hui de cette
-- province, et de nulle part ailleurs — ce que la fiche pays montrait
-- déjà sans l'expliquer.
--
-- Le cœur de la production s'appelle SORTOVA, haut dans les montagnes
-- de Chiriquí. Le pays revendique plus de cent ans de fabrication de
-- cigares.
--
-- ── CE QUE JE SOURCE, ET CE QUE JE DÉDUIS ───────────────
--
-- À dire franchement, parce que la distinction compte.
--
-- SOURCÉ : l'interdiction de Philippe II, la survivance à Chiriquí,
-- Sortova comme terre de référence, et le fait que ce qu'on y cultive
-- surtout est du tabac CRIOLLO — de grandes feuilles grasses et
-- souples, de bon arôme.
--
-- DÉDUIT : les deux noms que porte la fiche, « Habano Panamá » et
-- « Corojo Panamá », désignent des semences cubaines transplantées.
-- Aucune source consultée ne les confirme individuellement pour le
-- Panama. Leur filiation, elle, est établie ailleurs dans cet atlas —
-- migration 044 pour la famille Habano, 042 et 045 pour le Corojo de
-- 1947.
--
-- Les fiches disent donc l'histoire du lieu, qui est sourcée, et la
-- filiation de la semence, qui l'est aussi — sans prêter à l'une les
-- caractères de l'autre. Ce qui reste incertain n'est pas affirmé.
-- ════════════════════════════════════════════════════════

INSERT INTO `feuilles`
  (`id`, `name`, `country_id`, `emploi`, `genese`, `culture`, `caracteres`, `notes`, `pairings`)
VALUES
(
  'panama-habano',
  'Habano Panamá',
  'panama',
  'Cape et tripe',
  'Une semence de la famille cubaine, plantée dans un pays où le tabac fut longtemps interdit : au XVIe siècle, Philippe II d''Espagne en défendit la culture au Panama sous peine de mort, pour ne pas concurrencer Cuba. La tradition s''y est perdue — sauf à Chiriquí, où l''on n''a jamais cessé de récolter.',
  'Tout le tabac panaméen vient de la province de Chiriquí, à l''ouest. Le cœur de la production s''appelle Sortova, haut dans les montagnes : c''est la terre la plus réputée du pays.',
  'Ce que le nom promet est une filiation plutôt qu''un profil, comme partout où la semence cubaine s''est exportée. Ce qui distingue celle-ci est le lieu, pas la graine.',
  '["Épices","Corps","Terre"]',
  '["Rhum ambré","Café serré","Chocolat noir"]'
),
(
  'panama-corojo',
  'Corojo Panamá',
  'panama',
  'Cape',
  'La semence de 1947, celle de Diego Rodríguez, arrivée jusqu''aux montagnes de Chiriquí. Elle a fait le même voyage qu''au Honduras — mais sur une terre dont la vocation tabacière avait survécu à une interdiction royale plutôt qu''à une maladie.',
  'Culture d''altitude dans le Chiriquí, sur les pentes du Volcán Barú. Le pays revendique plus de cent ans de fabrication de cigares, malgré les siècles perdus.',
  'Elle porte le nom d''une lignée dont l''atlas suit déjà la trace à Cuba et au Honduras. Ce qu''en fait le Panama tient à ses hauteurs et à son sol volcanique.',
  '["Épices","Cèdre","Poivre"]',
  '["Rhum vieux","Café noir","Cacao"]'
);
