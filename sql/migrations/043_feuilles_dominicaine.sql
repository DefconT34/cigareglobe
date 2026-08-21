-- ════════════════════════════════════════════════════════
-- 043 — Les trois piliers dominicains
-- ────────────────────────────────────────────────────────
-- Sixième lot de la table `feuilles`. Comme à Cuba, les trois variétés
-- se racontent ensemble — mais l'histoire n'est pas celle d'une
-- maladie, c'est celle d'un exil.
--
-- ── UNE SEMENCE PASSÉE EN FRAUDE ────────────────────────
--
-- PILOTO CUBANO vient de la Vuelta Abajo. Elle arrive en République
-- dominicaine en 1962, sortie de Cuba dans des enveloppes bourrées de
-- coton. On attribue généralement à Carlos Toraño père d'avoir amené la
-- semence cubaine sur l'île voisine.
--
-- C'est la même rupture de 1959-1960 qui a peuplé l'atlas ailleurs :
-- les Canaries (migration 027), le Honduras, le Nicaragua. Ici elle
-- tient dans une enveloppe.
--
-- SAN VICENTE en descend directement — c'est une variation du Piloto,
-- cultivée dans le SUD du pays et plus douce que son aînée.
--
-- OLOR DOMINICANO est la seule des trois à être née sur place : c'est
-- l'unique semence proprement dominicaine, et elle sert surtout de
-- sous-cape.
--
-- ── UNE NUANCE GÉOGRAPHIQUE À RETENIR ───────────────────
--
-- Le Piloto pousse dans la VALLÉE DU CIBAO, au nord — que la fiche pays
-- liste déjà parmi ses zones, avec Santiago et Tamboril. San Vicente,
-- elle, vient du sud : aucune zone de l'atlas ne la représente
-- aujourd'hui.
--
-- Ce n'est pas corrigé ici. Ajouter une zone demanderait des
-- coordonnées, et `tools/coords_check.php` les vérifie depuis le lot 0 :
-- on ne pose pas un point sur le globe au jugé. C'est noté pour le lot
-- qui reprendra les zones.
-- ════════════════════════════════════════════════════════

INSERT INTO `feuilles`
  (`id`, `name`, `country_id`, `emploi`, `genese`, `culture`, `caracteres`, `notes`, `pairings`)
VALUES
(
  'dominicaine-piloto-cubano',
  'Piloto Cubano',
  'dominican',
  'Tripe',
  'Une semence de la Vuelta Abajo, sortie de Cuba en 1962 dans des enveloppes bourrées de coton. On attribue généralement à Carlos Toraño père de l''avoir amenée sur l''île voisine. La même rupture qui a dispersé les familles cubaines a donc aussi déplacé leurs graines.',
  'Elle a trouvé son terrain dans la vallée du Cibao, au nord du pays : beaucoup de soleil, et des brises d''après-midi qui empêchent les plantations de surchauffer.',
  'C''est la feuille de force des assemblages dominicains, celle qu''on mêle aux autres pour donner du goût plutôt que de la tenue. Sa filiation cubaine s''entend.',
  '["Corps","Terre","Épices"]',
  '["Rhum dominicain","Café serré","Chocolat noir"]'
),
(
  'dominicaine-san-vicente',
  'San Vicente',
  'dominican',
  'Sous-cape et tripe',
  'Une variation du Piloto Cubano, et donc une petite-fille de la Vuelta Abajo. Elle s''est fixée dans le sud du pays, loin du Cibao où sa devancière s''était installée.',
  'Culture du sud dominicain. Le déplacement a suffi à l''adoucir : c''est le même sang que le Piloto, dans un autre climat.',
  'Plus douce que son aînée, d''une texture souple et d''un goût crémeux. Elle sert de sous-cape autant que de tripe, là où le Piloto reste dans la tripe.',
  '["Douceur","Crème","Bois clair"]',
  '["Café au lait","Rhum blanc","Fruits secs"]'
),
(
  'dominicaine-olor',
  'Olor Dominicano',
  'dominican',
  'Sous-cape',
  'La seule des trois qui soit née ici : c''est l''unique semence proprement dominicaine, et son nom dit ce qu''on lui demande — « olor », l''odeur.',
  'Cultivée dans les terres du Cibao comme le Piloto, mais pour un autre usage : on la veut souple et régulière plutôt que puissante.',
  'Feuille de tenue : elle enveloppe la tripe et la maintient, sans imposer son goût. C''est la sous-cape de la plupart des cigares dominicains.',
  '["Douceur","Foin","Note florale"]',
  '["Thé noir","Café doux","Vin blanc sec"]'
);
