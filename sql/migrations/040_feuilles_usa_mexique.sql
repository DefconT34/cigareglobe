-- ════════════════════════════════════════════════════════
-- 040 — Trois feuilles : Connecticut et San Andrés
-- ────────────────────────────────────────────────────────
-- Troisième lot de la table `feuilles`. Sources vérifiées avant
-- rédaction, comme pour les deux précédents.
--
-- ── CONNECTICUT : DEUX FEUILLES, UNE VALLÉE ─────────────
--
-- La « Tobacco Valley » remonte la vallée du Connecticut de Springfield
-- (Massachusetts) à Hartford. Avant 1900, on n'y cultivait QUE du
-- broadleaf. C'est la concurrence de Sumatra qui a tout changé : des
-- planteurs sont allés en rapporter la semence, mais les feuilles
-- brûlaient au soleil de Nouvelle-Angleterre. Ils ont alors tendu des
-- toiles de gaze au-dessus des champs — d'où le nom « shade ».
--
-- Les deux feuilles sont donc filles du même sol et opposées en tout :
-- l'une pousse serrée sous la toile et donne une cape fine et claire ;
-- l'autre pousse au plein soleil, espacée d'une soixantaine de
-- centimètres, et donne une feuille épaisse, grasse et très veinée.
--
-- ── SAN ANDRÉS : UNE FILIATION CUBAINE ──────────────────
--
-- La vallée de San Andrés, dans le Veracruz, monte à quelque 1 200
-- mètres au bord du golfe du Mexique. Des immigrants cubains et
-- allemands y plantent du tabac dès les années 1830 ; en 1880, le
-- cultivateur cubain Alberto Turrent quitte son île pour s'y installer
-- avec ses semences.
--
-- Le negro San Andrés se coupe à la tige — comme le broadleaf du
-- Connecticut, et c'est la même logique — et supporte des températures
-- de fermentation élevées, ce qui en fait une cape maduro.
--
-- ── UN DOUTE QU'ON NE TRANCHE PAS ───────────────────────
--
-- La fiche mexicaine liste « San Andrés Maduro Negro » ET « Claro ».
-- Or « claro » désigne une NUANCE DE CAPE, pas une variété : c'est le
-- même défaut de modèle que « Sun-grown » au Cameroun, corrigé par la
-- migration 038.
--
-- Mais là-bas le cas était limpide — un adjectif de culture. Ici, une
-- désignation commerciale « San Andrés claro » pourrait exister. Faute
-- de certitude, l'entrée reste dans la liste SANS fiche : son étiquette
-- ne sera pas cliquable, et c'est plus honnête que de la supprimer sur
-- une intuition ou de lui écrire un article inventé.
-- ════════════════════════════════════════════════════════

INSERT INTO `feuilles`
  (`id`, `name`, `country_id`, `emploi`, `genese`, `culture`, `caracteres`, `notes`, `pairings`)
VALUES
(
  'usa-connecticut-shade',
  'Connecticut Shade',
  'usa',
  'Cape',
  'Vers 1900, la cape de Sumatra ruine le commerce américain. Des planteurs de la vallée du Connecticut vont en chercher la semence et la rapportent — mais sous le soleil de Nouvelle-Angleterre, les feuilles brûlent. Ils tendent alors des toiles de gaze au-dessus des champs, et la cape d''ombre est née.',
  'Cultivée serrée, sous des toiles de gaze ou de nylon qui filtrent le soleil et abritent aussi du vent. La « Tobacco Valley » remonte la vallée du Connecticut de Springfield, dans le Massachusetts, jusqu''à Hartford.',
  'Feuille mince et souple, d''un brun doré, à la nervure très fine et au toucher soyeux. Elle donne un corps doux : c''est la cape des assemblages qu''on veut légers.',
  '["Douceur","Cèdre","Pain grillé"]',
  '["Café au lait","Thé blanc","Vin blanc sec"]'
),
(
  'usa-broadleaf',
  'Connecticut Broadleaf',
  'usa',
  'Cape maduro et sous-cape',
  'C''est l''aînée : avant 1900, la vallée du Connecticut ne cultivait qu''elle. L''arrivée de la cape d''ombre ne l''a pas remplacée — elle lui a donné un rôle opposé, celui des cigares sombres.',
  'Plein soleil, et les plants espacés d''une soixantaine de centimètres pour que la feuille prenne toute sa taille. Elle se coupe à la tige entière, et non feuille à feuille comme la cape d''ombre.',
  'Feuille épaisse, grasse et très veinée, d''une couleur profonde après séchage. Elle brûle lentement et porte un goût appuyé — tout le contraire de sa voisine d''ombre.',
  '["Cacao","Terre","Sucre brûlé"]',
  '["Bourbon","Café noir","Stout"]'
),
(
  'mexique-negro-san-andres',
  'Negro San Andrés',
  'mexico',
  'Cape maduro et sous-cape',
  'Des immigrants cubains et allemands plantent du tabac dans la vallée de San Andrés dès les années 1830. En 1880, le cultivateur cubain Alberto Turrent quitte son île pour s''y installer avec ses semences — la filiation est directe.',
  'La vallée monte à quelque 1 200 mètres au bord du golfe du Mexique : climat plus frais qu''on ne l''attendrait sous cette latitude, brises humides venues de la côte, sols enrichis par le volcan.',
  'Feuille sombre qui se coupe à la tige, comme le broadleaf du Connecticut. Elle supporte des températures de fermentation élevées, ce qui en fait une cape maduro de premier plan.',
  '["Chocolat noir","Poivre","Terre"]',
  '["Mezcal","Café serré","Chocolat chaud"]'
);
