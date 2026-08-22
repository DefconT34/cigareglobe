-- ════════════════════════════════════════════════════════
-- 051 — Dire ce que « Terre » veut dire
-- ────────────────────────────────────────────────────────
-- Les rubriques Notes et Accords alignaient des mots nus : « Terre »,
-- « Cuir », « Foin sec ». Ce vocabulaire est celui du métier — qui le
-- possède n'a pas besoin de l'atlas, et qui ne le possède pas n'y
-- apprend rien.
--
-- Chaque famille reçoit donc une phrase qui la rend sensible : pas une
-- définition de dictionnaire, une image qu'on peut se rappeler.
--
-- ── UN GLOSSAIRE PAR FAMILLE, PAS PAR LIBELLÉ ───────────
--
-- Les soixante-deux libellés se ramènent à dix-sept familles (voir
-- famille_arome dans backend/data.php). Gloser chaque libellé
-- demanderait d'écrire trois fois la même chose pour « Café »,
-- « Café noir » et « Café serré ».
--
-- ── MAIS DEUX CONTEXTES, ET C'EST NÉCESSAIRE ────────────
--
-- « Cacao » en NOTE veut dire « vous goûterez du cacao ». « Chocolat
-- noir » en ACCORD veut dire « mangez-en avec ». Même famille, propos
-- opposé. La clé est donc (famille, contexte), et trois familles —
-- café, cacao, fruits — ont bien deux textes distincts.
--
-- ── POURQUOI UNE TABLE PLUTÔT QUE DU CODE ───────────────
--
-- Parce que ces textes doivent vivre en six langues, et que
-- l'outillage i18n travaille sur les tables. `feuilles` l'a montré au
-- lot précédent : il a suffi de déclarer la table dans le plan pour que
-- i18n_fraicheur, i18n_contenu et la campagne la prennent en charge
-- sans une ligne de plus.
-- ════════════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS `aromes` (
  `famille`   varchar(30) NOT NULL,
  -- « note » = ce qu'on sent en fumant ; « accord » = ce qu'on boit ou
  -- mange à côté. Le même mot ne dit pas la même chose des deux côtés.
  `contexte`  enum('note','accord') NOT NULL,
  `texte`     text DEFAULT NULL,
  `texte_en`  text DEFAULT NULL, `texte_es` text DEFAULT NULL,
  `texte_de`  text DEFAULT NULL, `texte_zh` text DEFAULT NULL,
  `texte_ar`  text DEFAULT NULL,
  PRIMARY KEY (`famille`, `contexte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ── Ce qu'on sent en fumant ─────────────────────────────

INSERT INTO `aromes` (`famille`, `contexte`, `texte`) VALUES
('terre','note',    'L''humus d''un sous-bois après la pluie. Rien de sale là-dedans : c''est l''odeur du sol vivant, celle qui monte quand on soulève une feuille morte.'),
('bois','note',     'Le cèdre d''une boîte de cigares qu''on vient d''ouvrir. Sec, droit, avec un souvenir de crayon taillé.'),
('cacao','note',    'Le chocolat noir moins le sucre — l''amertume ronde de la fève, pas celle de la tablette.'),
('cafe','note',     'Le fond d''une tasse oubliée : torréfié, un peu brûlé, franchement amer. C''est une note du matin.'),
('epices','note',   'Ce qui pique sans faire mal : le poivre qui gratte au fond de la gorge, la cannelle qui chauffe la langue.'),
('douceur','note',  'Pas du sucre — une rondeur. La crème, l''amande, tout ce qui arrondit les angles d''un assemblage.'),
('fleur','note',    'Un parfum discret, jamais capiteux. Pensez au tilleul plutôt qu''à la rose.'),
('foin','note',     'Une grange en plein été. Herbe séchée, paille tiède, et ce rien de pain grillé qui va avec.'),
('cuir','note',     'Le dossier d''un vieux fauteuil de club. Animal, tiède, légèrement ciré.'),
('fruits','note',   'Des fruits séchés plutôt que frais : figue, abricot, amande. Du sucre concentré, jamais juteux.'),
('force','note',    'Ce n''est pas un goût mais un poids : ce que le cigare pèse en bouche, et le temps qu''il y reste après la dernière bouffée.'),
('fumee','note',    'Le bois qui vient de s''éteindre. Sec, un peu âcre, un souvenir de cheminée du matin.');

-- ── Ce qu'on boit ou mange à côté ───────────────────────

INSERT INTO `aromes` (`famille`, `contexte`, `texte`) VALUES
('cafe','accord',       'L''accord le plus sûr, et le plus ancien : l''amertume du café relance celle du tabac au lieu de la couvrir.'),
('spiritueux','accord', 'Le rhum et le cigare partagent la canne et le fût de chêne. Un vieux rhum prolonge la fumée ; un blanc la tranche.'),
('cacao','accord',      'Le chocolat noir révèle le sucré caché des cigares sombres. Laissez-le fondre — ne le croquez pas.'),
('the','accord',        'Pour le matin, ou pour les feuilles douces : le thé rince la bouche entre deux bouffées au lieu de rivaliser avec elles.'),
('vin','accord',        'Le plus délicat de tous. Un rouge tannique se bat avec le cigare ; un vin muté l''accompagne — porto, madère, malvoisie.'),
('biere','accord',      'Une brune ou une stout : le grain torréfié rejoint le tabac, et les bulles nettoient le palais entre deux gorgées.'),
('fruits','accord',     'Quelques fruits secs entre deux bouffées : ils rafraîchissent sans laver le goût, ce qu''un fruit juteux ferait.'),
('patisserie','accord', 'Une pâtisserie peu sucrée, pour les cigares clairs du matin : le beurre arrondit ce que le tabac a de sec.');
