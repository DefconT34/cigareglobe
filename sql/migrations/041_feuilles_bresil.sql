-- ════════════════════════════════════════════════════════
-- 041 — Trois feuilles brésiliennes, et une liste corrigée
-- ────────────────────────────────────────────────────────
-- Quatrième lot de la table `feuilles`. Le Brésil était le dernier des
-- cinq pays que la migration 036 a identifiés comme vendeurs de feuille
-- plutôt que de cigares.
--
-- ── UNE VARIÉTÉ QUI N'EN EST PAS UNE ────────────────────
--
-- La fiche listait « Mata Fina », « Arapiraca » et « BAHIA ». Or Bahia
-- est un ÉTAT, pas une variété — et les sources sont formelles : tout
-- le tabac sombre planté en Bahia est du type Mata Fina d'origine, les
-- écarts de goût venant des microclimats et des façons culturales.
--
-- Pendant ce temps la vraie troisième variété manquait : MATA NORTE.
-- Le site la nommait pourtant déjà dans le champ `production` de la
-- fiche pays, depuis la migration 034 — « Mata Fina et Mata Norte,
-- 7,1 t de cigares exportées ». Le même fait était juste d'un côté et
-- faux de l'autre, une fois de plus.
--
-- ── CE QUE LES SOURCES DISENT ───────────────────────────
--
-- Les deux Mata viennent du RECÔNCAVO BAIANO, la baie qui entoure
-- Salvador. Toutes deux poussent au soleil, et ce qui les sépare tient
-- surtout à l'eau : la Mata Fina reçoit quelque 1 200 mm de pluie par
-- an et donne une feuille fine, douce, plutôt florale ; la Mata Norte
-- en reçoit moins, sèche à l'air libre, et donne du corps aux
-- assemblages.
--
-- ARAPIRACA est ailleurs — dans l'État d'Alagoas, dont la ville du même
-- nom est le centre du tabac brésilien depuis le début du XXe siècle.
-- Feuille plus épaisse et plus grasse que les Mata, elle tire vers le
-- chocolat et l'épice, brûle régulièrement et laisse une cendre très
-- blanche.
--
-- La note de la fiche pays — « Mata Fina, l'un des maduros les plus
-- réputés au monde » — vient de la migration 031, qui avait retiré son
-- superlatif au présent de l'indicatif. Elle tient toujours.
-- ════════════════════════════════════════════════════════

INSERT INTO `feuilles`
  (`id`, `name`, `country_id`, `emploi`, `genese`, `culture`, `caracteres`, `notes`, `pairings`)
VALUES
(
  'bresil-mata-fina',
  'Mata Fina',
  'brazil',
  'Cape et tripe',
  'Elle vient du Recôncavo Baiano, la baie qui entoure Salvador. C''est la souche d''origine : tout le tabac sombre planté en Bahia en descend, et ce sont les microclimats et les façons de faire qui creusent ensuite les différences.',
  'Culture de plein soleil, sous quelque 1 200 millimètres de pluie par an. C''est cette eau abondante qui la distingue de sa voisine du nord, plus sèche.',
  'Feuille fine au parfum agréable et au goût retenu, plutôt floral. Assez belle pour servir de cape, assez souple pour entrer dans la tripe — elle fait les deux.',
  '["Douceur","Fleurs","Bois clair"]',
  '["Cachaça vieillie","Café doux","Fruits blancs"]'
),
(
  'bresil-mata-norte',
  'Mata Norte',
  'brazil',
  'Tripe et sous-cape',
  'Même berceau que la Mata Fina, le Recôncavo Baiano, et même souche à l''origine. C''est le climat du nord de la zone qui en a fait autre chose.',
  'Plein soleil également, mais sous une pluie plus rare. Les feuilles sèchent ensuite à l''air libre, et non sous abri — ce qui appuie leur caractère.',
  'Plus corsée que la Mata Fina, elle sert à donner de la profondeur aux assemblages plutôt qu''à les habiller. C''est la feuille de la charpente, pas celle de la façade.',
  '["Corps","Terre","Épices"]',
  '["Rhum agricole","Café serré","Chocolat noir"]'
),
(
  'bresil-arapiraca',
  'Arapiraca',
  'brazil',
  'Cape maduro',
  'Celle-ci n''est pas de Bahia mais de l''État d''Alagoas, dont la ville d''Arapiraca est le centre du tabac brésilien depuis le début du XXe siècle.',
  'Culture de plein soleil, comme les deux Mata. Le terroir d''Alagoas donne une feuille sensiblement plus épaisse et plus grasse.',
  'Sombre et huileuse, elle brûle régulièrement et laisse une cendre très blanche. Là où la Mata Fina va vers la fleur, elle va vers le chocolat et l''épice — d''où son emploi en cape maduro.',
  '["Chocolat","Épices","Terre sucrée"]',
  '["Porto","Café noir","Chocolat au lait"]'
);

-- « Bahia » etait l'État, pas la variété. Mata Norte prend sa place —
-- la fiche pays la nommait déjà dans son champ production.
UPDATE `producer_countries`
   SET `varieties` = '["Mata Fina","Mata Norte","Arapiraca"]'
 WHERE `id` = 'brazil';
