-- ════════════════════════════════════════════════════════
-- 196 — Les vingt-sept cubaines : d'où viennent leurs fiches
-- ────────────────────────────────────────────────────────
-- Premier lot du chantier ouvert par la migration 195 : cent cinq
-- maisons portaient `source` a NULL, faute que leur source ait jamais
-- ete enregistree. Les vingt-sept cubaines sont le lot le plus net —
-- elles ont toutes une PAGE OFFICIELLE chez leur proprietaire.
--
-- ── LA VERIFICATION A PRECEDE L'ECRITURE ────────────────
-- Le portefeuille annonce sur habanos.com a ete releve avant de citer
-- quoi que ce soit. Les vingt-six marques de la page « Marcas » plus
-- QUINTERO (portefeuille volume, avec Jose L. Piedra et Vegueros) font
-- exactement les vingt-sept fiches cubaines de l'atlas. Aucune de
-- l'atlas ne manque au portefeuille, aucune du portefeuille ne manque
-- a l'atlas.
--
-- ── ET LA VERIFICATION A TROUVE UNE CONTRADICTION ───────
-- BOLIVAR : le champ `founded` disait « 1901 — La Havane ». Le texte de
-- SA PROPRE FICHE dit « Fondee en 1902 ». Et habanos.com tranche :
-- « The Bolivar brand was created in 1902. »
--
-- Aucun controle ne pouvait le voir : une date dans un champ et une
-- date dans une phrase sont deux chaines valides, et rien ne les
-- compare. C'est le meme genre de defaut que la contradiction Dannemann
-- de la 189 — deux affirmations vraies separement, fausses ensemble —
-- sauf qu'ici les deux sont DANS LA MEME FICHE.
--
-- Le champ est corrige. Le texte n'avait pas besoin de l'etre.
--
-- ── UNE DATE QUE L'ON GARDE EN DISANT CE QU'ELLE VAUT ───
-- FONSECA : l'atlas dit 1892. habanos.com NE DONNE PAS D'ANNEE et
-- ecrit « in the last decade of the 19th century ». en.wikipedia.org
-- donne 1892, d'autres sources 1891. Les trois sont compatibles, et la
-- fiche elle-meme dit « depuis la fin du XIXe siecle ».
--
-- On garde 1892 ET on ecrit la variance dans le champ `source`. C'est
-- precisement a cela qu'il sert : dire d'ou vient la fiche, y compris
-- quand ce d'ou elle vient hesite.
--
-- ── CE QUE CES CITATIONS COUVRENT ───────────────────────
-- La page officielle d'une marque etablit son existence au
-- portefeuille, sa date de creation quand elle la donne, et le
-- caractere de son assemblage. Elle n'etablit PAS les anecdotes que
-- portent certaines fiches. La citation designe donc la source
-- principale, pas une garantie ligne a ligne — c'est le sens qu'a
-- `source` chez `lounges` depuis toujours.
--
-- Sources : habanos.com, section « The Habanos Brands » (pages
-- officielles par marque, relevees le 9 septembre 2026, dont
-- /bolivar-brand/ et /fonseca-brand/ lues integralement) ;
-- cigaraficionado.com, encyclopedie des marques ; en.wikipedia.org.
--
-- Apres cette migration :
--   php tools/contenu_dump.php
--   php tools/sources.php --verifier
-- ════════════════════════════════════════════════════════

-- ── LA CONTRADICTION INTERNE, D'ABORD ───────────────────
UPDATE `brands`
   SET `founded` = '1902 — La Havane, Cuba', `updated_at` = NOW()
 WHERE `name` = 'Bolivar';

-- Le champ et le texte doivent dire la meme annee. Les deux lignes
-- valent 1, ou la reprise a rate.
SELECT 'champ founded' AS ou, `founded` = '1902 — La Havane, Cuba' AS ok FROM `brands` WHERE `name`='Bolivar'
UNION ALL
SELECT 'texte history', `history` LIKE '%1902%' AND `history` NOT LIKE '%1901%' FROM `brands` WHERE `name`='Bolivar';

-- ── LES VINGT-SEPT SOURCES ──────────────────────────────
UPDATE `brands` SET `source` = CASE `name`

-- Les six marques mondiales
WHEN 'Cohiba' THEN 'habanos.com — « The Habanos Brands » (fiche officielle : 1966, El Laguito) ; cigaraficionado.com ; en.wikipedia.org (Cohiba cigar brand)'
WHEN 'Montecristo' THEN 'habanos.com — « The Habanos Brands » (fiche officielle : création en 1935 à La Havane) ; en.wikipedia.org (Montecristo cigar) ; cigaraficionado.com'
WHEN 'Partagás' THEN 'habanos.com — « The Habanos Brands », page Partagás (fiche officielle : création en 1845) ; cigaraficionado.com ; en.wikipedia.org'
WHEN 'Romeo y Julieta' THEN 'habanos.com — « The Habanos Brands » (fiche officielle : 1875) ; en.wikipedia.org (Romeo y Julieta cigar) ; cigaraficionado.com'
WHEN 'Hoyo de Monterrey' THEN 'habanos.com — « The Habanos Brands » (fiche officielle : 1865, José Gener) ; cigaraficionado.com ; en.wikipedia.org'
WHEN 'H. Upmann' THEN 'habanos.com — « The Habanos Brands » (fiche officielle : 1844) ; cigaraficionado.com ; en.wikipedia.org'

-- Le portefeuille de haute valeur
WHEN 'Trinidad' THEN 'habanos.com — « The Habanos Brands » (fiche officielle : usage diplomatique à partir de 1969, mise en vente publique en 1998, El Laguito) ; cigaraficionado.com'
WHEN 'Bolivar' THEN 'habanos.com — « The Habanos Brands », page Bolívar : « The Bolívar brand was created in 1902 » — le champ de date de cette fiche portait 1901 alors que son propre texte disait 1902 ; corrigé par la migration 196'
WHEN 'Punch' THEN 'habanos.com — « The Habanos Brands » (fiche officielle : 1840) ; cigaraficionado.com ; en.wikipedia.org'
WHEN 'Quai d''Orsay' THEN 'habanos.com — « The Habanos Brands » (fiche officielle : 1973, marque créée pour le marché français) ; cigaraficionado.com'
WHEN 'Ramón Allones' THEN 'habanos.com — « The Habanos Brands » (fiche officielle : 1837) ; cigaraficionado.com ; en.wikipedia.org'

-- Le portefeuille volume
WHEN 'José L. Piedra' THEN 'habanos.com — « The Habanos Brands » (fiche officielle ; portefeuille volume, tripe courte roulée main) ; cigaraficionado.com'
WHEN 'Quintero' THEN 'habanos.com — portefeuille volume, avec José L. Piedra et Vegueros (fiche officielle : 1924, Cienfuegos) ; en.wikipedia.org (Quintero cigar)'
WHEN 'Vegueros' THEN 'habanos.com — « The Habanos Brands » (fiche officielle : marque de Pinar del Río, relancée en 1997) ; cigaraficionado.com'

-- Les autres marques du portefeuille
WHEN 'Cuaba' THEN 'habanos.com — « The Habanos Brands » (fiche officielle : lancée en 1996, formats figurados) ; cigaraficionado.com'
WHEN 'San Cristóbal de La Habana' THEN 'habanos.com — « The Habanos Brands » (fiche officielle : lancée en 1999, vitoles nommées d''après les forteresses de La Havane) ; cigaraficionado.com'
WHEN 'Fonseca' THEN 'habanos.com — « The Habanos Brands », page Fonseca : NE DONNE PAS D''ANNÉE et place la fondation « in the last decade of the 19th century » ; en.wikipedia.org donne 1892, d''autres sources 1891. L''atlas retient 1892 et écrit ici la variance'
WHEN 'Vegas Robaina' THEN 'habanos.com — « The Habanos Brands » (fiche officielle : lancée en 1997, seule marque nommée d''après un planteur, Alejandro Robaina) ; cigaraficionado.com'
WHEN 'Diplomáticos' THEN 'habanos.com — « The Habanos Brands » (fiche officielle : 1966, créée pour le marché français) ; cigaraficionado.com'
WHEN 'El Rey del Mundo' THEN 'habanos.com — « The Habanos Brands » (fiche officielle : 1848, Antonio Allones) ; en.wikipedia.org (El Rey del Mundo cigar) ; cigaraficionado.com'
WHEN 'Juan López' THEN 'habanos.com — « The Habanos Brands » (fiche officielle : 1876) ; cigaraficionado.com'
WHEN 'La Flor de Cano' THEN 'habanos.com — « The Habanos Brands », listée sous « La Flor de Caño » (fiche officielle : 1884, frères Cano) ; cigaraficionado.com'
WHEN 'La Gloria Cubana' THEN 'habanos.com — « The Habanos Brands » (fiche officielle : 1885) ; cigaraficionado.com ; en.wikipedia.org'
WHEN 'Por Larrañaga' THEN 'habanos.com — « The Habanos Brands » (fiche officielle : 1834, la plus ancienne du portefeuille) ; en.wikipedia.org (Por Larrañaga) ; cigaraficionado.com'
WHEN 'Rafael González' THEN 'habanos.com — « The Habanos Brands » (fiche officielle : 1928) ; cigaraficionado.com'
WHEN 'Saint Luis Rey' THEN 'habanos.com — « The Habanos Brands » (fiche officielle : 1940) ; cigaraficionado.com ; en.wikipedia.org'
WHEN 'Sancho Panza' THEN 'habanos.com — « The Habanos Brands » (fiche officielle : 1848) ; cigaraficionado.com'

ELSE `source` END,
`updated_at` = NOW()
 WHERE `country_id` = 'cuba';

-- Vingt-sept doivent être remplies, zéro doit rester vide.
SELECT COUNT(*) AS cubaines,
       SUM(`source` IS NOT NULL AND `source` <> '') AS sourcees,
       SUM(`source` IS NULL OR `source` = '')       AS sans_source
  FROM `brands` WHERE `country_id` = 'cuba';

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 196','systeme','vingt_sept_sources_cubaines','marque',0,
   'Premier lot du chantier ouvert par la 195. Les vingt-sept fiches cubaines recoivent leur source : habanos.com, section « The Habanos Brands », page officielle par marque, plus cigaraficionado.com et en.wikipedia.org selon les fiches. Le portefeuille annonce sur habanos.com a ete releve AVANT de citer : les vingt-six marques de la page « Marcas » plus QUINTERO font exactement les vingt-sept fiches cubaines de l atlas, sans manque d un cote ni de l autre'),
  (NULL,'migration 196','systeme','une_fiche_qui_se_contredisait','marque',0,
   'BOLIVAR : le champ `founded` disait « 1901 — La Havane » et le texte de SA PROPRE FICHE disait « Fondee en 1902 ». habanos.com tranche : « The Bolivar brand was created in 1902. » Le champ est corrige. AUCUN CONTROLE NE POUVAIT LE VOIR : une date dans un champ et une date dans une phrase sont deux chaines valides, et rien ne les compare. Meme genre de defaut que la contradiction Dannemann de la 189, sauf qu ici les deux affirmations sont DANS LA MEME FICHE'),
  (NULL,'migration 196','systeme','une_date_gardee_avec_sa_variance','marque',0,
   'FONSECA : l atlas dit 1892 ; habanos.com NE DONNE PAS D ANNEE et ecrit « in the last decade of the 19th century » ; en.wikipedia.org donne 1892, d autres sources 1891. Les trois sont compatibles et la fiche elle-meme dit « depuis la fin du XIXe siecle ». On garde 1892 ET on ecrit la variance dans le champ `source` — c est precisement a cela qu il sert : dire d ou vient la fiche, y compris quand ce d ou elle vient hesite'),
  (NULL,'migration 196','systeme','ce_que_ces_citations_couvrent','marque',0,
   'La page officielle d une marque etablit son existence au portefeuille, sa date de creation quand elle la donne, et le caractere de son assemblage. Elle n etablit PAS les anecdotes que portent certaines fiches. La citation designe la SOURCE PRINCIPALE, pas une garantie ligne a ligne — c est le sens qu a `source` chez `lounges` depuis toujours');
