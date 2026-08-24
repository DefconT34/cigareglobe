-- ════════════════════════════════════════════════════════
-- 083 — Le lexique du métier
-- ────────────────────────────────────────────────────────
-- Déclenché par une remarque de lecteur : « moho azul, qu'est-ce que
-- c'est ? » (migration 080). Le relevé qui a suivi a montré que ce
-- n'était pas un cas isolé — vingt-six termes techniques apparaissent
-- dans la prose sans qu'aucune phrase ne les explique :
--
--   vitola / vitole  ×12      figurado  ×8       torcedor  ×4
--   ligero           ×10      perfecto  ×2       lector, pilón,
--   entubado, box-pressed                        chacun ×1
--
-- Les VARIÉTÉS de tabac (habano, corojo, criollo, broadleaf, sumatra)
-- ne sont pas concernées : elles ont déjà leur fiche, et l'étiquette
-- qui la porte est cliquable depuis le lot des étiquettes. Le manque
-- porte sur le vocabulaire de FABRICATION — celui qu'aucune fiche ne
-- couvre.
--
-- ── LE MÊME MÉCANISME QUE LES ARÔMES ────────────────────
--
-- La table `aromes` (migration 051) résout déjà ce problème pour les
-- sensations : une phrase par famille, servie avec la fiche, qui rend le
-- mot sensible — « terre » ne dit rien, « l'humus d'un sous-bois après
-- la pluie » se retient.
--
-- Ce lexique reprend le principe sans le dupliquer : détection sur le
-- FRANÇAIS, restitution dans la langue du lecteur. C'est la règle déjà
-- écrite dans `action_feuille` : « Les illustrations sont choisies AVANT
-- la traduction, sur le français. C'est la seule façon qui tienne : le
-- front reçoit 咖啡 ou قهوة selon la langue, et ne peut pas y
-- reconnaître un café. »
--
-- ── POURQUOI UNE COLONNE `variantes` ────────────────────
--
-- Un terme a des formes : vitole, vitoles, vitola, vitolas. Les stocker
-- évite de coder la morphologie en dur dans le PHP — et évite surtout
-- d'y coder une expression régulière venue de la base, ce qui serait
-- une injection. Les variantes sont des chaînes LITTÉRALES, séparées par
-- des barres, échappées par `preg_quote` avant tout usage.
--
-- ── CE QUI N'Y ENTRE PAS ────────────────────────────────
--
-- `corona` : c'est à la fois une vitole et un morceau de nom de gamme
-- (Double Corona, Corona Gorda). Le mot ne se détecte pas sans contexte,
-- et une glose qui s'affiche au mauvais endroit est pire qu'une absence.
-- ════════════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS `lexique` (
  `id`         VARCHAR(40)  NOT NULL,
  `categorie`  VARCHAR(20)  NOT NULL,
  `variantes`  VARCHAR(160) NOT NULL,
  `terme`      VARCHAR(60)  NOT NULL,
  `definition` TEXT         NOT NULL,
  `terme_en`      VARCHAR(60) NULL, `definition_en` TEXT NULL,
  `terme_es`      VARCHAR(60) NULL, `definition_es` TEXT NULL,
  `terme_de`      VARCHAR(60) NULL, `definition_de` TEXT NULL,
  `terme_zh`      VARCHAR(60) NULL, `definition_zh` TEXT NULL,
  `terme_ar`      VARCHAR(60) NULL, `definition_ar` TEXT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `lexique` (`id`, `categorie`, `variantes`, `terme`, `definition`) VALUES

-- ── Les trois parties du cigare ─────────────────────────
('cape', 'assemblage', 'cape|capes', 'Cape',
 'La feuille extérieure, celle qu''on voit. Elle est choisie pour son aspect autant que pour son goût : c''est la seule du cigare qu''un défaut disqualifie à l''œil.'),

('sous-cape', 'assemblage', 'sous-cape|sous-capes', 'Sous-cape',
 'La feuille intermédiaire, qui tient la tripe en faisceau et donne sa forme au cigare avant que la cape ne l''habille. On ne la voit jamais.'),

('tripe', 'assemblage', 'tripe|tripes', 'Tripe',
 'Le cœur du cigare : les feuilles pliées en accordéon à l''intérieur. C''est là que se joue l''essentiel du goût, et c''est aussi ce qui décide du tirage.'),

-- ── Les étages du plant ─────────────────────────────────
('ligero', 'feuille', 'ligero|ligeros', 'Ligero',
 'Les feuilles du haut du plant, les plus exposées au soleil. Épaisses, puissantes, lentes à brûler — on les dose, on ne les empile pas.'),

('viso', 'feuille', 'viso|visos', 'Viso',
 'Entre le seco et le ligero. Un compromis d''arôme et de corps, dont les assembleurs se servent pour lier les deux.'),

('seco', 'feuille', 'seco|secos', 'Seco',
 'Les feuilles du milieu du plant. C''est d''elles que vient l''arôme, plus que la force.'),

('volado', 'feuille', 'volado|volados', 'Volado',
 'Les feuilles du bas, les moins gorgées de soleil. Peu de goût, mais elles brûlent bien : c''est ce qui fait tenir un cigare allumé.'),

('medio-tiempo', 'feuille', 'medio tiempo', 'Medio tiempo',
 'Les deux feuilles tout en haut du plant, quand le soleil a été assez généreux pour qu''elles poussent. Certaines années, il n''y en a pas.'),

-- ── L'atelier ───────────────────────────────────────────
('torcedor', 'atelier', 'torcedor|torcedores|torcedors', 'Torcedor',
 'Celui qui roule. Le mot est espagnol et vient de « tordre » : le geste consiste à tourner la cape en spirale autour du cigare.'),

('galera', 'atelier', 'galera|galeras', 'Galera',
 'L''atelier de roulage, où les torcedores travaillent en rangées face à un même pupitre.'),

('lector', 'atelier', 'lector|lectores', 'Lector',
 'Le lecteur d''atelier, payé pour faire la lecture à voix haute pendant que les autres roulent. La coutume est cubaine et date du XIXe siècle.'),

('entubado', 'atelier', 'entubado', 'Entubado',
 'Une manière de rouler la tripe : chaque feuille est enroulée en petit tube plutôt que pliée. Plus lent, et réputé donner un tirage plus régulier.'),

('pilon', 'atelier', 'pilón|pilon|pilones', 'Pilón',
 'La meule de feuilles empilées pour fermenter. Sa chaleur monte d''elle-même ; on la retourne quand elle atteint la température voulue.'),

-- ── Les formes ──────────────────────────────────────────
('vitole', 'forme', 'vitole|vitoles|vitola|vitolas', 'Vitole',
 'Le format d''un cigare : sa longueur, son diamètre, et le nom que la maison lui donne. Deux vitoles du même assemblage ne se fument pas pareil.'),

('figurado', 'forme', 'figurado|figurados', 'Figurado',
 'Un cigare qui n''est pas un cylindre droit : pointu, ventru, fuselé. Plus difficile à rouler, et son tirage change à mesure qu''il se consume.'),

('perfecto', 'forme', 'perfecto|perfectos', 'Perfecto',
 'Un figurado fermé aux deux bouts et renflé au milieu.'),

('box-press', 'forme', 'box-pressed|box-press', 'Pressé en boîte',
 'Un cigare pressé carré par le serrage de la boîte. Ce n''est pas une façon de rouler mais une façon d''emballer — elle change pourtant le tirage.'),

-- ── Les robes ───────────────────────────────────────────
('claro', 'robe', 'claro|claros', 'Claro',
 'Une robe claire, blonde à dorée. Celle des tabacs cultivés sous voile, moins exposés au soleil.'),

('maduro', 'robe', 'maduro|maduros', 'Maduro',
 'Une robe sombre, obtenue par une fermentation plus longue ou plus chaude. Le mot dit « mûr », pas « fort » : la couleur vient du procédé, pas de la puissance.'),

('oscuro', 'robe', 'oscuro|oscuros', 'Oscuro',
 'Plus sombre encore que le maduro, jusqu''au presque noir.');
