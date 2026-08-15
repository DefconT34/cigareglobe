-- ════════════════════════════════════════════════════════
-- 023 — Une cape n'est pas une marque
-- ────────────────────────────────────────────────────────
-- La fiche du Cameroun annonçait « Marques emblématiques » puis
-- listait CAO Cameroon, Arturo Fuente Hemingway et Oliva Serie G —
-- trois cigares roulés au Honduras, en République dominicaine et au
-- Nicaragua. Aucun n'est camerounais. Ce que le Cameroun leur donne,
-- c'est sa CAPE, et les articles le disaient déjà : « utilisant le
-- wrapper camerounais », « wrapper importé du Cameroun ». Seul le titre
-- de la section prétendait autre chose.
--
-- Même situation en Équateur, qui fournit l'essentiel des capes claires
-- du marché sans abriter une seule maison ; et sur une entrée du Brésil
-- et une du Mexique.
--
-- Ces pays ne sont pas des sous-pays du cigare : la cape est la feuille
-- la plus visible, la plus chère et la plus décisive d'un assemblage.
-- Le drapeau qu'on voit sur un cigare est souvent celui de son usine ;
-- son goût doit beaucoup à un pays qui n'y figure pas. C'est cela que
-- la troisième section rend enfin lisible.
--
-- ── Le critère, et pourquoi il n'est pas discutable ──────
--
-- Une entrée est marquée « cape » quand SON PROPRE ARTICLE dit que la
-- contribution du pays est la cape. Rien n'est déduit, rien n'est
-- ajouté : le champ `factory` de CAO Cameroon porte littéralement
-- « (wrapper importé du Cameroun) ».
--
-- ── Trois cas voisins qui NE sont PAS concernés ──────────
--
-- L'INDONÉSIE garde ses deux entrées telles quelles : Café Crème et
-- Henri Wintermans sont des maisons néerlandaises, mais leurs usines
-- déclarées se trouvent à Java et Sumatra. Elles produisent sur place ;
-- ce n'est pas le même cas.
--
-- LES ÉTATS-UNIS gardent Cohiba USA, Partagás USA, Romeo y Julieta USA
-- et General Cigar : ce sont des marques américaines roulées à
-- l'étranger — l'inverse exact du cas de la cape.
--
-- CUBA n'est pas concernée : ses usines disent « La Havane » sans
-- répéter « Cuba », ce qui trompe une recherche mécanique mais personne
-- d'autre.
--
-- ── Un défaut repéré au passage, NON corrigé ici ─────────
--
-- « Punch » figure à la fois sur la fiche de Cuba et sur celle du
-- Honduras, mais un seul article existe : le cubain. La carte
-- hondurienne ouvre donc l'histoire de la marque cubaine. Le remède est
-- un article « Punch Honduras », comme il en existe pour les trois
-- homonymes américaines — c'est de la rédaction, pas de la structure.
-- ════════════════════════════════════════════════════════

-- Le chemin est calculé depuis le nom : l'ordre des listes n'a pas à
-- être supposé, et le fichier reste rejouable.
UPDATE `producer_countries` SET `brands` = JSON_SET(`brands`,
    REPLACE(JSON_UNQUOTE(JSON_SEARCH(`brands`, 'one', 'CAO Cameroon', NULL, '$[*].name')), '.name', '.cape'), TRUE)
  WHERE `id` = 'cameroon' AND JSON_SEARCH(`brands`, 'one', 'CAO Cameroon', NULL, '$[*].name') IS NOT NULL;

UPDATE `producer_countries` SET `brands` = JSON_SET(`brands`,
    REPLACE(JSON_UNQUOTE(JSON_SEARCH(`brands`, 'one', 'Arturo Fuente Hemingway', NULL, '$[*].name')), '.name', '.cape'), TRUE)
  WHERE `id` = 'cameroon' AND JSON_SEARCH(`brands`, 'one', 'Arturo Fuente Hemingway', NULL, '$[*].name') IS NOT NULL;

UPDATE `producer_countries` SET `brands` = JSON_SET(`brands`,
    REPLACE(JSON_UNQUOTE(JSON_SEARCH(`brands`, 'one', 'Oliva Serie G', NULL, '$[*].name')), '.name', '.cape'), TRUE)
  WHERE `id` = 'cameroon' AND JSON_SEARCH(`brands`, 'one', 'Oliva Serie G', NULL, '$[*].name') IS NOT NULL;

UPDATE `producer_countries` SET `brands` = JSON_SET(`brands`,
    REPLACE(JSON_UNQUOTE(JSON_SEARCH(`brands`, 'one', 'Perdomo Ecuador', NULL, '$[*].name')), '.name', '.cape'), TRUE)
  WHERE `id` = 'ecuador' AND JSON_SEARCH(`brands`, 'one', 'Perdomo Ecuador', NULL, '$[*].name') IS NOT NULL;

UPDATE `producer_countries` SET `brands` = JSON_SET(`brands`,
    REPLACE(JSON_UNQUOTE(JSON_SEARCH(`brands`, 'one', 'Oliva Connecticut Reserve', NULL, '$[*].name')), '.name', '.cape'), TRUE)
  WHERE `id` = 'ecuador' AND JSON_SEARCH(`brands`, 'one', 'Oliva Connecticut Reserve', NULL, '$[*].name') IS NOT NULL;

UPDATE `producer_countries` SET `brands` = JSON_SET(`brands`,
    REPLACE(JSON_UNQUOTE(JSON_SEARCH(`brands`, 'one', 'Ashton Cabinet', NULL, '$[*].name')), '.name', '.cape'), TRUE)
  WHERE `id` = 'ecuador' AND JSON_SEARCH(`brands`, 'one', 'Ashton Cabinet', NULL, '$[*].name') IS NOT NULL;

UPDATE `producer_countries` SET `brands` = JSON_SET(`brands`,
    REPLACE(JSON_UNQUOTE(JSON_SEARCH(`brands`, 'one', 'Arturo Fuente Maduro', NULL, '$[*].name')), '.name', '.cape'), TRUE)
  WHERE `id` = 'brazil' AND JSON_SEARCH(`brands`, 'one', 'Arturo Fuente Maduro', NULL, '$[*].name') IS NOT NULL;

UPDATE `producer_countries` SET `brands` = JSON_SET(`brands`,
    REPLACE(JSON_UNQUOTE(JSON_SEARCH(`brands`, 'one', 'CAO Black', NULL, '$[*].name')), '.name', '.cape'), TRUE)
  WHERE `id` = 'mexico' AND JSON_SEARCH(`brands`, 'one', 'CAO Black', NULL, '$[*].name') IS NOT NULL;
