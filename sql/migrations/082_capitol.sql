-- ════════════════════════════════════════════════════════
-- 082 — Capitol, et ce qu'une fiche a le droit de taire
-- ────────────────────────────────────────────────────────
-- Absence signalée par un lecteur, qui a fourni l'identité visuelle de
-- la marque : « CAPITOL — PREMIUM NICARAGUA ».
--
-- ── CE QUE J'ÉTABLIS, ET RIEN DE PLUS ───────────────────
--
-- Le nom, et le pays que la marque revendique elle-même. C'est tout.
--
-- Je ne connais ni l'année de fondation, ni le nom de l'atelier qui
-- roule ses cigares, ni la composition de ses gammes, ni ses profils.
-- Ces rubriques restent VIDES.
--
-- C'est la règle posée à la migration 058 et tenue depuis : une donnée
-- invérifiable ne s'affiche pas, et une rubrique vide est une
-- information juste. Le projet compte déjà quatre marcas cubaines sans
-- rubrique pour la même raison — Juan López, La Flor de Cano, Saint
-- Luis Rey, Vegueros.
--
-- La tentation, sur une marque qu'on connaît mal, est d'écrire ce que
-- disent les revendeurs : « assemblage nicaraguayen corsé, notes de
-- poivre et de cacao ». C'est plausible pour n'importe quel cigare
-- nicaraguayen, donc cela ne dit rien, et cela aurait exactement l'air
-- d'un fait.
--
-- ── POURQUOI CRÉER LA FICHE MALGRÉ TOUT ─────────────────
--
-- Parce que l'absence est plus trompeuse que le vide. Un atlas qui ne
-- mentionne pas une maison laisse croire qu'elle n'existe pas ; une
-- fiche qui dit « je ne sais pas encore » dit la vérité sur l'atlas
-- lui-même.
--
-- ── LE LOGO N'EST PAS REPRIS ────────────────────────────
--
-- L'identité visuelle fournie est une marque déposée. Le chantier des
-- logos a été écarté pour cette raison, et parce qu'il relève de l'avis
-- juridique en attente sur la loi Évin. Rien n'en est stocké ni
-- redessiné ici.
-- ════════════════════════════════════════════════════════

INSERT INTO `brands` (`name`, `country_id`, `founded`, `factory`, `history`, `gamme`, `pairings`, `scores`, `celebrities`, `limited_eds`)
VALUES (
  'Capitol',
  'nicaragua',
  'Nicaragua',
  NULL,
  'Capitol se présente comme une maison nicaraguayenne — c''est ce que porte sa propre identité, « Premium Nicaragua », et c''est aujourd''hui ce que l''atlas peut affirmer.

Ni l''année de fondation, ni l''atelier qui roule ses cigares, ni la composition de ses gammes ne sont établis ici. Ces rubriques restent vides plutôt que remplies d''approximations : sur une maison récente ou peu distribuée, ce qui circule vient des revendeurs, et rien de ce qu''on y lit ne se vérifie.

La fiche existe parce que l''absence trompe davantage que le vide. Un atlas qui ne mentionne pas une maison laisse croire qu''elle n''existe pas ; une fiche qui dit ce qu''elle ignore dit au moins la vérité sur l''atlas.',
  JSON_ARRAY(),
  JSON_ARRAY(),
  NULL, NULL, NULL
);
