-- ════════════════════════════════════════════════════════
-- 052 — La troisième cape équatorienne, et une étiquette de trop
-- ────────────────────────────────────────────────────────
-- Il restait deux étiquettes de variétés sans fiche. Elles ne
-- réclamaient pas le même geste.
--
-- ── ECUADOR SUMATRA : un vrai manque ────────────────────
--
-- L'Équateur annonçait trois capes et n'en documentait que deux. La
-- troisième n'a rien d'anecdotique : c'est une cape courante, et elle
-- occupe précisément l'espace laissé vide entre les deux autres — plus
-- de goût que la Connecticut, moins de corps que l'Habano.
--
-- ── LE « CLARO » MEXICAIN : une étiquette fautive ───────
--
-- `Claro` désigne une NUANCE DE CAPE, pas une variété : la même plante
-- de San Andrés, récoltée et fermentée autrement, donne le clair ou le
-- maduro. Lui écrire une genèse et des caractères reviendrait à
-- documenter une couleur comme si c'était une semence.
--
-- Le corpus le dit d'ailleurs tout seul. Dans les fiches de marques
-- (migrations 022, 024), « Claro » n'apparaît JAMAIS seul : toujours
-- accolé à une variété — « Habano Claro », « Colorado Claro », « Mata
-- Fina Claro ». C'est un adjectif qui s'était retrouvé dans une liste
-- de noms.
--
-- On le retire donc au lieu de lui écrire un article. Le Mexique garde
-- la seule variété qu'il ait jamais eue ici, et sa fiche existe déjà.
-- ════════════════════════════════════════════════════════

INSERT INTO `feuilles` (`id`, `name`, `country_id`, `emploi`,
                        `genese`, `culture`, `caracteres`, `notes`, `pairings`)
VALUES (
  'equateur-sumatra', 'Ecuador Sumatra', 'ecuador', 'Cape',
  'Semence née aux Indes néerlandaises, arrivée en Équateur par le chemin qu''ont pris toutes les graines d''importation du pays : on y cherchait un climat, pas un terroir d''origine. C''est la troisième des grandes capes équatoriennes, et la moins nommée des trois.',
  'Même principe que ses voisines : pas de toile d''ombrage, la couverture nuageuse s''en charge. Récoltée plus tard que la Connecticut, elle prend une teinte colorado que la lumière constante garde égale d''un pied à l''autre — c''est ce qui permet d''en tirer des capes assorties en quantité.',
  'Cape fine, veinure presque invisible, plus sombre que la Connecticut sans atteindre le corps de l''Habano. On la choisit pour ce qu''elle ajoute au goût plutôt que pour la force : c''est la plus sucrée des trois équatoriennes.',
  '["Épices douces","Cèdre","Sucre brun"]',
  '["Bourbon","Café au lait","Fruits secs"]'
);

-- L'adjectif quitte la liste des noms. La fiche « Negro San Andrés »
-- reste, et reste atteignable — c'est la seule variété que le Mexique
-- ait ici.
UPDATE `producer_countries`
   SET `varieties` = '["Negro San Andrés"]'
 WHERE `id` = 'mexico';
