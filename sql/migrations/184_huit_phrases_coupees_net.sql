-- ════════════════════════════════════════════════════════
-- 184 — Huit phrases coupées net
-- ────────────────────────────────────────────────────────
-- TROUVÉ EN ÉCRIVANT LA FICHE NICOYA, ET EN LIGNE DEPUIS DES MOIS.
--
-- La fiche Nicoya affichait « production au Nicaragu ». La chaîne
-- faisait 51 caractères, `brands.founded` est un varchar(50), et MySQL
-- l'a tronquée SANS RIEN DIRE : l'INSERT sort en succès.
--
-- En vérifiant, HUIT AUTRES fiches étaient dans le même état — toutes
-- coupées en plein mot, toutes publiées :
--
--   Crowned Heads  « (production au Nicarag »  parenthèse jamais fermée
--   Suerdieck      « fermée en 2 »             L'ANNÉE ÉTAIT PERDUE
--   La Aurora      « République Domi »
--   Juan Clemente  « Rép. dominicain »
--   Bering         « au Honduras dep »
--   Warped         « et en Florid »
--   The Griffin's  « pour un club de Genève ou »
--   Meerapfel      « cape du Cameroun, »       virgule en suspens
--
-- ── POURQUOI RIEN NE L'A VU ─────────────────────────────
-- La valeur est une chaîne valide. La fiche s'affiche, le rendu est
-- correct, les sceaux sont à jour, `i18n_fraicheur` compte 100 %.
-- L'anomalie n'est QUE dans le sens, et seulement pour qui lit la
-- phrase jusqu'au bout. Aucun contrôle ne regardait là.
--
-- ── CE QUE CHAQUE PHRASE DISAIT ─────────────────────────
-- Chacune se reconstitue depuis sa PROPRE fiche, sans rien inventer :
-- l'`history` ou le `factory` de la marque porte le fait coupé. Le cas
-- de Suerdieck est le plus net — `founded` avait perdu l'année de
-- fermeture, mais `factory` disait « usine fermée en 2000 ».
--
-- Les huit nouvelles valeurs tiennent toutes sous 49 caractères, avec
-- une marge délibérée.
--
-- ── ET LE CONTRÔLE QUI L'AURAIT VU ──────────────────────
-- `coherence_check` porte désormais un constat : un texte libre dont la
-- longueur tombe PILE sur la capacité de sa colonne n'y tombe pas par
-- hasard. La largeur est lue dans INFORMATION_SCHEMA plutôt qu'écrite
-- en dur — la colonne peut être élargie un jour, et le contrôle doit
-- suivre. Il couvre `brands.founded`, `brands.factory`, `brands.name`
-- et `lounges.name`.
--
-- Un faux positif reste possible : une phrase peut mesurer exactement
-- cinquante caractères. Le remède est alors d'un mot — reformuler.
--
-- ⚠ AUCUNE DE CES COLONNES N'EST TRADUITE. `founded` n'a pas de
-- `founded_en` : rien à resceller, et les six langues ne bougent pas.
--
-- Après cette migration :
--   php tools/contenu_dump.php
-- ════════════════════════════════════════════════════════

-- Bering — history : « transfère la fabrication au Honduras en 1990 »
UPDATE `brands` SET `founded` = '1905 — Tampa ; produit au Honduras depuis 1990',
                    `updated_at` = NOW() WHERE `name` = 'Bering';

-- Crowned Heads — history : « Crowned Heads n'a pas d'usine, et c'est
-- le sujet. » La valeur tronquée ne nommait qu'un des deux ateliers ;
-- la nouvelle dit ce que la fiche dit vraiment.
UPDATE `brands` SET `founded` = '2011 — Nashville, Tennessee ; sans usine propre',
                    `updated_at` = NOW() WHERE `name` = 'Crowned Heads';

-- Juan Clemente
UPDATE `brands` SET `founded` = '1982 — Santiago de los Caballeros, Rép. dom.',
                    `updated_at` = NOW() WHERE `name` = 'Juan Clemente';

-- La Aurora
UPDATE `brands` SET `founded` = '1903 — Santiago de los Caballeros, Rép. dom.',
                    `updated_at` = NOW() WHERE `name` = 'La Aurora';

-- Meerapfel — la virgule en suspens ouvrait sur la suite de la phrase,
-- que `factory` porte en entier : « cape sélectionnée au Cameroun,
-- cigares roulés en Rép. dominicaine ».
UPDATE `brands` SET `founded` = 'Famille marchande depuis 1876 — cape du Cameroun',
                    `updated_at` = NOW() WHERE `name` = 'Meerapfel';

-- Suerdieck — L'ANNÉE PERDUE. `factory` disait « usine fermée en 2000 ».
UPDATE `brands` SET `founded` = '1892 — Cruz das Almas, Bahia · fermée en 2000',
                    `updated_at` = NOW() WHERE `name` = 'Suerdieck';

-- The Griffin's — history : « Bernard Grobet ouvre le club en 1964 »
UPDATE `brands` SET `founded` = '1984 — Rép. dominicaine, pour un club genevois',
                    `updated_at` = NOW() WHERE `name` = 'The Griffin''s';

-- Warped — factory : TABSA (Jalapa) et El Titan de Bronze (Miami)
UPDATE `brands` SET `founded` = '2007 — Miami ; Nicaragua et Floride',
                    `updated_at` = NOW() WHERE `name` = 'Warped';

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 184','systeme','troncature_silencieuse','marque',0,
   'TROUVE EN ECRIVANT LA FICHE NICOYA, ET EN LIGNE DEPUIS DES MOIS. La fiche Nicoya affichait « production au Nicaragu » : la chaine faisait 51 caracteres, brands.founded est un varchar(50), et MySQL l a tronquee SANS RIEN DIRE — l INSERT sort en succes. HUIT AUTRES fiches etaient dans le meme etat, toutes coupees en plein mot : Crowned Heads (parenthese jamais fermee), Suerdieck (l ANNEE DE FERMETURE ETAIT PERDUE), La Aurora, Juan Clemente, Bering, Warped, The Griffin s et Meerapfel (virgule en suspens)'),
  (NULL,'migration 184','systeme','pourquoi_rien_ne_l_a_vu','systeme',0,
   'LA VALEUR EST UNE CHAINE VALIDE. La fiche s affiche, le rendu est correct, les sceaux sont a jour, i18n_fraicheur compte 100%. L anomalie n est QUE dans le sens, et seulement pour qui lit la phrase jusqu au bout. Aucun controle ne regardait la — c est le meme aveuglement que les drapeaux abimes et les tableaux brands mal formes, mais sans meme un symptome visible'),
  (NULL,'migration 184','systeme','reconstitue_sans_rien_inventer','marque',0,
   'CHAQUE PHRASE SE RECONSTITUE DEPUIS SA PROPRE FICHE : l history ou le factory de la marque porte le fait coupe. Le cas de Suerdieck est le plus net — founded avait perdu l annee de fermeture, mais factory disait « usine fermee en 2000 ». Rien n a ete invente, et les huit nouvelles valeurs tiennent sous 49 caracteres avec une marge deliberee'),
  (NULL,'migration 184','systeme','controle_pose','systeme',0,
   'coherence_check porte desormais un constat : un texte libre dont la longueur tombe PILE sur la capacite de sa colonne n y tombe pas par hasard. La largeur est lue dans INFORMATION_SCHEMA plutot qu ecrite en dur — la colonne peut etre elargie un jour et le controle doit suivre. Il couvre brands.founded, brands.factory, brands.name et lounges.name. Un faux positif reste possible : une phrase peut mesurer exactement cinquante caracteres, et le remede est alors d un mot — reformuler');
