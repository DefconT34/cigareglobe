-- ════════════════════════════════════════════════════════
-- 039 — Quatre feuilles : Indonésie et Équateur
-- ────────────────────────────────────────────────────────
-- Deuxième lot de la table `feuilles` (migration 038). On avance par
-- pays, sur les sources déjà réunies : écrire cent textes de mémoire
-- recréerait la dette que six lots de relecture viennent de solder.
--
-- Ces quatre-là sont les mieux documentées de ce qui reste. Les sources
-- viennent des recherches des lots 4 et 1 :
--
--   INDONÉSIE — Deli (Sumatra), Besuki (Java Est) et Klaten (Java
--   Centre) sont les trois centres historiques du tabac à cigare.
--   Besuki se récolte en deux passes qui ont gardé leurs noms
--   néerlandais : Vroege Oogst, la précoce, et Na Oogst, la tardive.
--   La feuille de Deli est de semence native, cultivée en plein soleil
--   pour servir de cape, et sa fumée sèche et épicée est très répandue
--   en Europe.
--
--   ÉQUATEUR — la couverture nuageuse permanente des contreforts andins
--   remplace les toiles d'ombrage : c'est la raison même de sa
--   domination sur le marché de la cape, et c'est ce que la migration
--   028 avait retenu en retirant le rang mondial non sourcé.
--
-- ── UNE VARIÉTÉ MANQUE, ET ON LE DIT ────────────────────
--
-- Les sources décrivent TROIS capes équatoriennes : Connecticut,
-- Habano et SUMATRA. La fiche pays n'en listait que deux. La troisième
-- est ajoutée à la liste des variétés, sans fiche pour l'instant — un
-- nom sans article vaut mieux qu'un oubli, et l'étiquette restera
-- simplement non cliquable jusqu'à ce qu'elle soit documentée.
--
-- ── ATTENTION AUX SUPERLATIFS ───────────────────────────
--
-- `tools/coherence_check.php` refuse « meilleur » et « le plus utilisé »
-- depuis le lot 5 : ce sont des classements que personne ne publie. Les
-- formulations ci-dessous disent la RÉPUTATION, qui est vraie. Le
-- contrôle a d'ailleurs corrigé deux tournures pendant la rédaction.
-- ════════════════════════════════════════════════════════

INSERT INTO `feuilles`
  (`id`, `name`, `country_id`, `emploi`, `genese`, `culture`, `caracteres`, `notes`, `pairings`)
VALUES
(
  'indonesie-deli',
  'Deli Sumatra',
  'indonesia',
  'Cape',
  'Les planteurs néerlandais installent la culture à Deli, sur la côte est de Sumatra, au XIXe siècle. Avec Besuki à Java Est et Klaten à Java Centre, Deli forme l''un des trois centres historiques du tabac à cigare indonésien.',
  'Cultivée en plein soleil, et destinée dès le départ à servir de cape. La semence est native — un tabac noir qui n''a pas été importé d''ailleurs.',
  'Fumée sèche et épicée, d''un caractère reconnaissable. C''est en Europe qu''elle est la plus répandue, où elle habille une grande part des cigares et cigarillos.',
  '["Épices","Fumée sèche","Bois"]',
  '["Café allongé","Bière brune","Thé noir fumé"]'
),
(
  'indonesie-besuki',
  'Besuki',
  'indonesia',
  'Cape et tripe',
  'La région de Jember, à Java Est, est la plus réputée d''Indonésie pour le tabac. La feuille y porte le nom de la résidence de Besuki, héritée de l''administration coloniale.',
  'Deux récoltes se succèdent et ont gardé leurs noms néerlandais : la Vroege Oogst, précoce, et la Na Oogst, tardive. Culture de plein soleil, comme à Deli.',
  'Feuille douce et aromatique, assez souple pour servir de cape et assez neutre pour entrer dans la tripe. C''est cette double vocation qui la distingue.',
  '["Douceur","Aromatique","Foin sec"]',
  '["Thé vert","Vin blanc sec","Fruits secs"]'
),
(
  'equateur-habano',
  'Ecuador Habano',
  'ecuador',
  'Cape',
  'Semence cubaine plantée sur les contreforts andins. L''Équateur n''a pas de tradition du cigare roulé : il fournit la feuille aux fabricants du Nicaragua, du Honduras et de République dominicaine.',
  'Cultivée SANS TOILE D''OMBRAGE, ce qui est l''exception dans le métier : la couverture nuageuse de la saison filtre le soleil en permanence et rend les tentures inutiles. C''est cette lumière égale qui fait la réputation du pays.',
  'Cape souple et régulière, l''une des plus répandues aujourd''hui sur les cigares premium. Elle apporte du corps et de l''épice là où sa voisine Connecticut apporte de la douceur.',
  '["Épices","Cuir","Poivre"]',
  '["Rhum ambré","Café serré","Chocolat noir"]'
),
(
  'equateur-connecticut',
  'Ecuador Connecticut',
  'ecuador',
  'Cape',
  'Semence du Connecticut transplantée en Équateur. Le pays offre à cette feuille d''ombre les conditions qu''elle demandait, sans les toiles qu''il faut tendre en Nouvelle-Angleterre.',
  'Même principe que l''Habano équatorien : c''est le ciel qui fait l''ombre. La couverture nuageuse permanente donne une feuille plus claire et plus fine que celle poussée en plein soleil.',
  'Cape claire, veinée discrète, réputée pour sa douceur. C''est le choix des assemblages doux du matin, là où l''Habano équatorien vise le corps.',
  '["Douceur","Amande","Crème"]',
  '["Café au lait","Champagne","Pâtisserie"]'
);

-- La troisième cape équatorienne existe, même sans fiche : la nommer
-- vaut mieux que de l'oublier. L'étiquette restera non cliquable tant
-- qu'elle n'aura pas d'article.
UPDATE `producer_countries`
   SET `varieties` = '["Ecuador Connecticut","Ecuador Habano","Ecuador Sumatra"]'
 WHERE `id` = 'ecuador';
