-- ════════════════════════════════════════════════════════
-- 053 — L'Italie, seizième pays producteur
-- ────────────────────────────────────────────────────────
-- L'atlas ne connaissait l'Italie que comme pays à établissements : un
-- point sur le globe, des caves, aucune production. C'était une lacune
-- de fond — quinze pays producteurs, tous américains ou asiatiques,
-- les Canaries exceptées.
--
-- ── CE QUI REND CETTE ORIGINE PARTICULIÈRE ──────────────
--
-- L'Italie cultive du KENTUCKY et le sèche AU FEU. Deux endroits au
-- monde le font pour le cigare : le Kentucky et le Tennessee aux
-- États-Unis, et l'Italie. Partout ailleurs la feuille sèche à l'air,
-- au soleil ou sous abri ; ici elle passe deux semaines au-dessus d'un
-- feu de bois lent, et c'est de là que vient le goût du Toscano.
--
-- ── LE CHIFFRE, ET CE QU'IL NE DIT PAS ──────────────────
--
-- 36,0 M$ d'exportations de cigares en 2024 (COMTRADE, HS 2402.10),
-- pour 359 tonnes. Série complète sur six ans après relance des années
-- manquantes :
--
--   2019   16,2   176 t        2022   21,7   241 t
--   2020   17,1   204 t        2023   30,1   310 t
--   2021   21,9   223 t        2024   36,0   359 t
--
-- L'accès public a d'abord rendu 2020, 2022 et 2024 VIDES. Trois
-- relances les ont remplies : c'était de la capricieuse, pas de
-- l'absence. La leçon du Brésil vaut ici aussi — un trou ressemble
-- exactement à un zéro.
--
-- Témoin de complétude, pour vérifier que l'endpoint ne tronquait pas :
-- le tabac brut italien (HS 2401) sort à 417 M$ pour 55 633 tonnes, ce
-- qui correspond au rang de l'Italie parmi les cultivateurs européens.
-- Un gros chiffre est revenu gros.
--
-- ── POURQUOI PAS CES 417 M$ ─────────────────────────────
--
-- Parce que ce serait refaire l'erreur des Canaries : ce tonnage est
-- surtout du Virginia et du Burley pour la cigarette. La part du
-- Kentucky à cigare n'y est pas ventilée. On prend donc le cigare
-- lui-même, et `rev_detail` nomme sa base sous le montant.
--
-- Ce montant ne mesure que l'EXPORT. Le Toscano se vend d'abord en
-- Italie, et cette part-là n'apparaît dans aucune statistique
-- douanière. Le champ `notes` le dit plutôt que de le laisser croire.
--
-- ── LES ZONES ───────────────────────────────────────────
--
-- La Valtiberina, à cheval sur la Toscane et l'Ombrie, est le berceau
-- historique. La Campanie fournit la seconde source.
--
-- Le Veneto est VOLONTAIREMENT absent : on y cultive du tabac, mais du
-- Bright pour la cigarette. L'y faire figurer répéterait l'erreur de
-- Lombok, retirée des zones indonésiennes par la migration 030 pour
-- exactement cette raison.
-- ════════════════════════════════════════════════════════

-- ── Le pays ─────────────────────────────────────────────

INSERT INTO `producer_countries`
  (`id`, `name`, `flag`, `lat`, `lon`, `region`, `tier`, `color`,
   `production`, `revenue`, `rev_detail`, `harvest`, `climate`, `soil`,
   `tabacaleras`, `regions`, `varieties`, `notes`, `brands`)
VALUES (
  'italy', 'Italie', '🇮🇹', 42.8000, 12.6000, 'Europe du Sud', 'notable', '#B8860B',
  '359 t de cigares exportées (2024)',
  '36,0 M$ (2024)',
  'exportations de cigares vers le monde (COMTRADE)',
  'Août – Sept',
  'Tempéré méditerranéen',
  'Alluvions du haut Tibre',
  '["Manifatture Sigaro Toscano"]',
  '["Valtiberina","Benevento"]',
  '["Kentucky"]',
  'Avec le Kentucky américain, le seul tabac à cigare séché au feu. Le montant ne compte que l''export : le Toscano se vend d''abord en Italie.',
  '[{"name":"Toscano","desc":"Le cigare né d''un orage florentin en 1815","iconic":true}]'
);

-- ── La fiche pratique ───────────────────────────────────
-- Population et PIB viennent de la Banque mondiale (millésime 2025) ;
-- `tools/geo_banquemondiale.php` les entretiendra désormais tout seul,
-- l'Italie ayant rejoint PAYS_BM.

INSERT INTO `producer_geo`
  (`country_id`, `capital`, `population`, `area`, `currency`, `language`,
   `timezone`, `gdp`, `independent`)
VALUES (
  'italy', 'Rome', '58,9 M (2025)', '302 073 km²', 'Euro (EUR)', 'Italien',
  'UTC+1', '2,55 T$ (2025)', '1861'
);

-- ── Les zones ───────────────────────────────────────────
-- Couleurs dans l'ordre de la convention : #E8541A puis #C04000.
-- Les noms doivent correspondre EXACTEMENT à `regions` ci-dessus —
-- c'est ce que vérifie la section 1 de coherence_check.

INSERT INTO `production_zones` (`country_id`, `name`, `lat`, `lon`, `note`, `color`)
VALUES
('italy', 'Valtiberina', 43.5600, 12.1900,
 'Le haut Tibre, entre Toscane et Ombrie — berceau du Kentucky italien', '#E8541A'),
('italy', 'Benevento',   41.1300, 14.7800,
 'La seconde source, en Campanie', '#C04000');

-- ── La feuille ──────────────────────────────────────────

INSERT INTO `feuilles`
  (`id`, `name`, `country_id`, `emploi`, `genese`, `culture`, `caracteres`, `notes`, `pairings`)
VALUES (
  'italie-kentucky', 'Kentucky', 'italy', 'Cape et tripe',
  'La graine vient d''Amérique du Nord et porte le nom de l''État qui l''a fait connaître. Elle arrive en Italie au XIXe siècle, dans un pays qui cultivait déjà du tabac pour son monopole d''État. Elle y est restée, et c''est aujourd''hui la seule feuille à cigare d''Europe continentale.',
  'Récoltée en fin d''été, puis séchée AU FEU : la feuille passe une quinzaine de jours suspendue au-dessus d''un feu de bois lent, dans une grange close. Ce n''est pas de la fumaison au sens culinaire — le feu sèche autant qu''il parfume — et c''est ce que presque aucune autre origine ne pratique pour le cigare. Vient ensuite la fermentation, plus longue que la moyenne.',
  'Feuille épaisse, nervurée, sombre. Elle sert à la fois de cape et de tripe, ce qui est rare : le Toscano est fait d''un seul type de feuille, là où un cigare caribéen en assemble trois ou quatre. Le Kentucky italien fournit surtout la tripe, la cape venant selon les cas d''Italie ou des États-Unis.',
  '["Fumée","Cuir","Poivre"]',
  '["Grappa","Café serré","Chocolat noir"]'
);

-- ── La marque ───────────────────────────────────────────

INSERT INTO `brands`
  (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
VALUES (
  'Toscano', 'italy', '1815 — Florence, Italie',
  'La maison raconte qu''un orage d''été trempa un stock de Kentucky entreposé à la Manifattura Tabacchi de Florence. Plutôt que de le jeter, on laissa fermenter la feuille gâtée et on la roula pour la vendre à bas prix. Le goût, âcre et fumé, trouva son public — et ce qui devait être une perte devint une manière de faire.\n\nLe cigare qui en sortit ne ressemble à aucun autre : effilé aux deux bouts, renflé au milieu, et traditionnellement coupé en deux avant d''être fumé. Deux moitiés d''un même cigare, deux fumées courtes plutôt qu''une longue — un usage né de l''économie autant que du goût.\n\nLa fabrication est restée un monopole d''État jusqu''à la fin du XXe siècle. Manifatture Sigaro Toscano la reprend en 2006 et roule toujours à la main les qualités hautes, à Lucques et à Cava de'' Tirreni.',
  '[{"name":"Toscano Classico","color":"#5B3A29","story":"Le format de référence, tel qu''il se fume depuis le XIXe siècle. Fumée de bois, cuir, poivre noir, avec cette âcreté franche qui déroute à la première bouffée et qu''on vient chercher ensuite. Se coupe en deux : chaque moitié tient une demi-heure.","force":"Full","wrapper":"Kentucky","vitolas":["Toscano"]},{"name":"Toscanello","color":"#8B5A2B","story":"La moitié d''un Toscano, vendue telle quelle. Vingt minutes, le format que l''Italie fume au comptoir avec un café. Décliné en versions aromatisées — café, anis — qui ont fait entrer la maison chez des fumeurs que le Classico rebutait.","force":"Medium","wrapper":"Kentucky","vitolas":["Toscanello"]},{"name":"Toscano Originale","color":"#4A2C1A","story":"Roulé à la main, vieilli plus longtemps que le Classico. La fumée s''arrondit sans rien perdre de sa force : le cuir prend le pas sur le poivre, et une douceur de fruit sec apparaît en fin de fumée.","force":"Full","wrapper":"Kentucky","vitolas":["Toscano"]}]',
  '[{"type":"Spiritueux","name":"Grappa","notes":"L''accord du pays, et le plus juste : la grappa a la même franchise que le cigare, sans sucre pour arrondir les angles. Une grappa vieillie en fût plutôt qu''une blanche, qui trancherait trop."},{"type":"Café","name":"Espresso","notes":"Ce que fait l''Italie au comptoir : un Toscanello et un espresso. L''amertume du café tient tête à la fumée au lieu de la subir."}]',
  'Lucques et Cava de'' Tirreni — Manifatture Sigaro Toscano'
);
