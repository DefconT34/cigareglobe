-- ════════════════════════════════════════════════════════
-- 106 — Promotion vers le français, lot 4
-- ────────────────────────────────────────────────────────
-- ── UNE NOTE DE PRESSE DANS L'ANGLAIS ───────────────────
--
-- « the Opus X […] earned SCORES IN THE UPPER 90s » (Arturo Fuente).
-- C'est très exactement ce que les migrations 057, 058 et 077 ont retiré
-- des six colonnes, et cela attendait dans un texte que personne ne
-- lisait comme du contenu à promouvoir.
--
-- `marques_check` ne pouvait pas le voir : son motif anglais cherche
-- « scored 96 », « 96 points », « Top 25 » — pas « scores in the upper
-- 90s », qui ne porte aucun chiffre exploitable. La forme est
-- indénombrable, donc invisible. Elle n'est pas ajoutée au motif : une
-- expression aussi vague ne se distingue pas d'une tournure ordinaire
-- sans produire du bruit. Elle est simplement retirée ici, et la liste
-- d'attente — le fait observable — reste.
--
-- ── ET UN CONSENSUS SANS SOURCE ─────────────────────────
--
-- « SEVERAL SERIOUS TASTERS have described it as a more extreme version
-- of the Cuban original » (Camacho). C'est « many experts consider »
-- sous un autre habit — la forme que RANGS_MONDIAUX attrape en anglais,
-- ici hors de sa portée parce qu'elle ne parle pas de rang mais de
-- description. Retirée.
--
-- Deuxième fois en deux lots : la migration 105 avait trouvé « les
-- connaisseurs sérieux s'accordent » dans le français de Bolívar.
--
-- ── DEUX RANGS RETIRÉS, DEUX GARDÉS ─────────────────────
--
-- Retirés :
--   « had become the BENCHMARK Dominican cigar manufacturer » — un
--     jugement. La preuve qui suivait dit mieux et se vérifie : d'autres
--     maisons envoyaient leurs assembleurs observer les Fuente.
--   « Cuban corojo wrapper was THE STANDARD AGAINST WHICH EVERY OTHER
--     wrapper tobacco was measured » — devient une description de ce que
--     cette cape donnait aux havanes.
--
-- Gardé : « the LARGEST INDEPENDENT cigar manufacturing operation IN THE
-- DOMINICAN REPUBLIC » — un rang borné à un pays et à une catégorie
-- nommée, qu'un lecteur peut vérifier. Même ligne qu'aux migrations 100,
-- 103 et 105.
-- ════════════════════════════════════════════════════════

-- ── Arturo Fuente ───────────────────────────────────────
UPDATE `brands` SET `history` =
'Arturo Fuente Sr. débarqua à Tampa en 1902, parmi des milliers de torcedores cubains qui avaient suivi la migration de l''industrie du cigare vers la Floride. En 1912, il fonda sa manufacture sur un principe qui allait définir la famille pendant quatre générations : chaque cigare qui sortait de l''atelier devait être un cigare qu''il était fier d''avoir roulé lui-même. La maison grandit lentement, délibérément, sans les capitaux des grandes structures — elle grandit parce que ses cigares valaient régulièrement mieux que leur prix.

Carlos Fuente Sr. hérita de l''affaire à la mort de son père et la conduisit à travers l''expansion du marché premium américain du milieu du siècle. En 1980, un incendie détruisit entièrement la manufacture d''Ybor City. Chaque machine, chaque tabac en vieillissement, chaque archive de production : tout. La perte fut totale. Carlos avait la cinquantaine ; son fils Carlos Jr., que le métier appelle simplement Carlito, la vingtaine.

La reconstruction les mena en République dominicaine, où la famille négocia l''accès à des terres de la vallée du Cibao. Ils se mirent à cultiver eux-mêmes — non plus acheter la feuille à des courtiers, mais contrôler chaque étape, de la plantation à la fermentation puis au roulage. Le Château de la Fuente, une plantation dont l''emplacement exact n''est communiqué à personne hors de la famille, devint la matière première des plus hautes ambitions de la maison. À la fin des années 1980, d''autres maisons envoyaient leurs assembleurs les plus expérimentés observer ce que faisaient les Fuente.

En 1995, Carlito lança l''Opus X. L''idée était simple et radicale : un cigare entièrement dominicain, cape comprise. On tenait alors la cape dominicaine pour trop fragile, trop fine, trop encline à se rompre pour tenir au niveau premium. Carlito passa des années à sélectionner et à travailler par la fermentation des feuilles dominicaines capables de supporter les contraintes du roulage. Il en sortit une cape sombre, huileuse, résistante, d''une complexité aromatique remarquable — et une liste d''attente qui dure encore trente ans plus tard.

La famille exploite aujourd''hui la plus grande manufacture de cigares indépendante de République dominicaine : le Château de la Fuente alimente les gammes hautes, et l''usine principale produit un catalogue de plus de vingt gammes. Cynthia, fille de Carlito, représente la quatrième génération aux commandes.'
WHERE `name` = 'Arturo Fuente';

-- ── Camacho ─────────────────────────────────────────────
UPDATE `brands` SET `history` =
'La famille Camacho cultivait le corojo dans la Vuelta Abajo cubaine depuis des générations — non pas n''importe quel tabac, mais précisément cette variété dont les feuilles fournissent les capes qui ont donné aux grands havanes leur signature visuelle et aromatique. Sombre, huileuse, d''une texture régulière, elle donnait au cigare son aspect et son parfum reconnaissables entre tous. La cultiver était un métier à part, et les Camacho comptaient parmi ceux qui le maîtrisaient le mieux.

La révolution cubaine referma ce chapitre en 1959. Le départ de Simon Camacho fut celui d''un homme emportant son identité professionnelle sous forme de semences — littéralement, s''agissant des plants de corojo dont il transporta la génétique jusqu''à Miami, puis au Honduras. La vallée de Jamastran, dans le département d''Olancho, se révéla le site le plus prometteur : sols volcaniques, altitude et régime d''humidité que les tabacologues jugeaient capables de porter une culture de corojo.

Le corojo hondurien que la famille développa au fil des décennies n''est pas la même plante que le cubain. Le terroir diffère réellement — composition du sol, eau, milieu microbien des salles de fermentation. Il en est sorti une variété qui partage les caractéristiques visuelles et la tenue de l''originale cubaine tout en développant son propre profil : plus corsé, plus dominé par le poivre, avec une terre que le sol hondurien apporte et non le cubain.

Le rachat par le groupe Davidoff en 2008 apporta les moyens de fabrication et de distribution qui firent passer Camacho du statut de manufacture spécialisée à celui de marque internationale. Le repositionnement autour de « Cigars Gone Loud » était un calcul commercial, mais il n''était pas faux : Camacho occupe un registre d''intensité et de franchise qu''aucune autre grande marque du portefeuille Davidoff n''adresse. Les boîtes noires, les noms de gammes — Corojo, BXP, American Barrel-Aged —, toute l''esthétique d''agressivité assumée décrivent honnêtement les cigares : ce ne sont pas des exercices de subtilité.'
WHERE `name` = 'Camacho';
