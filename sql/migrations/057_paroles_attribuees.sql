-- ════════════════════════════════════════════════════════
-- 057 — Retirer les paroles qu'on prête à des gens
-- ────────────────────────────────────────────────────────
-- L'inventaire des fiches de marques a trouvé huit anecdotes qui mettent
-- une phrase entre guillemets dans la bouche de quelqu'un. Une seule est
-- authentique : le vers de Kipling, publié dans « The Betrothed » en
-- 1885 et vérifiable. Les sept autres sont des aphorismes plausibles
-- attribués à des personnes réelles.
--
-- Et une seconde catégorie, du même bois : des affirmations sur la
-- consommation de tabac de personnes NOMMÉES ET VIVANTES — Michael
-- Jordan, Jack Nicholson, Arnold Schwarzenegger, Alain Ducasse.
--
-- ── POURQUOI CELLE-CI D'ABORD ───────────────────────────
--
-- C'est le seul endroit de l'atlas où une erreur de contenu cesse d'être
-- un problème avec un lecteur pour devenir un problème avec une
-- personne. Un « aurait déclaré » ne protège pas beaucoup : la phrase
-- est publiée, nommée, attribuée, et traduite en six langues.
--
-- Les figures historiques mortes depuis longtemps posent une question
-- de justesse ; les personnes vivantes posent une question de droit.
--
-- ── CE QU'ON GARDE ──────────────────────────────────────
--
-- Les faits documentés survivent à la citation qui les habillait :
-- Castro a cessé de fumer en 1985, les Fuente ont reconstruit en
-- République dominicaine, Zino Davidoff a fondé sa maison. Ces
-- phrases-là sont réécrites sans la parole inventée.
--
-- Les entrées dont la citation ÉTAIT toute la substance disparaissent :
-- il n'en reste rien à sauver.
--
-- ── NOTE TECHNIQUE ──────────────────────────────────────
--
-- Les suppressions passent par JSON_REMOVE sur LES SIX COLONNES à la
-- fois. Retirer l'entrée [1] du français sans la retirer des cinq
-- traductions décalerait tout le reste : le lecteur anglais lirait
-- l'anecdote de Churchill sous le nom de Groucho Marx.
--
-- Les index décroissants sont volontaires — retirer [0] d'abord
-- renumérote [1] en [0], et la seconde suppression frapperait à côté.
--
-- Les réécritures ne touchent que le FRANÇAIS. Les cinq traductions
-- deviennent périmées, i18n_fraicheur le dira, et elles seront
-- réimportées. C'est le circuit prévu.
-- ════════════════════════════════════════════════════════

-- ── Personnes vivantes : consommation et paroles ─────────

-- Trinidad perd ses deux entrées : Ducasse (vivant, citation inventée)
-- et Mandela (bénéficiaire supposé, invérifiable). Le fait documenté —
-- un havane réservé aux cadeaux diplomatiques jusqu'en 1998 — vit déjà
-- dans le champ `history` de la marque.
UPDATE `brands` SET
  `celebrities`    = JSON_REMOVE(`celebrities`,    '$[1]', '$[0]'),
  `celebrities_en` = JSON_REMOVE(`celebrities_en`, '$[1]', '$[0]'),
  `celebrities_es` = JSON_REMOVE(`celebrities_es`, '$[1]', '$[0]'),
  `celebrities_de` = JSON_REMOVE(`celebrities_de`, '$[1]', '$[0]'),
  `celebrities_zh` = JSON_REMOVE(`celebrities_zh`, '$[1]', '$[0]'),
  `celebrities_ar` = JSON_REMOVE(`celebrities_ar`, '$[1]', '$[0]')
WHERE `name` = 'Trinidad';

-- Michael Jordan : achats personnels prêtés à une personne vivante.
UPDATE `brands` SET
  `celebrities`    = JSON_REMOVE(`celebrities`,    '$[1]'),
  `celebrities_en` = JSON_REMOVE(`celebrities_en`, '$[1]'),
  `celebrities_es` = JSON_REMOVE(`celebrities_es`, '$[1]'),
  `celebrities_de` = JSON_REMOVE(`celebrities_de`, '$[1]'),
  `celebrities_zh` = JSON_REMOVE(`celebrities_zh`, '$[1]'),
  `celebrities_ar` = JSON_REMOVE(`celebrities_ar`, '$[1]')
WHERE `name` = 'Arturo Fuente';

-- Jack Nicholson : même motif.
UPDATE `brands` SET
  `celebrities`    = JSON_REMOVE(`celebrities`,    '$[1]'),
  `celebrities_en` = JSON_REMOVE(`celebrities_en`, '$[1]'),
  `celebrities_es` = JSON_REMOVE(`celebrities_es`, '$[1]'),
  `celebrities_de` = JSON_REMOVE(`celebrities_de`, '$[1]'),
  `celebrities_zh` = JSON_REMOVE(`celebrities_zh`, '$[1]'),
  `celebrities_ar` = JSON_REMOVE(`celebrities_ar`, '$[1]')
WHERE `name` = 'Cohiba';

-- Arnold Schwarzenegger : même motif.
UPDATE `brands` SET
  `celebrities`    = JSON_REMOVE(`celebrities`,    '$[1]'),
  `celebrities_en` = JSON_REMOVE(`celebrities_en`, '$[1]'),
  `celebrities_es` = JSON_REMOVE(`celebrities_es`, '$[1]'),
  `celebrities_de` = JSON_REMOVE(`celebrities_de`, '$[1]'),
  `celebrities_zh` = JSON_REMOVE(`celebrities_zh`, '$[1]'),
  `celebrities_ar` = JSON_REMOVE(`celebrities_ar`, '$[1]')
WHERE `name` = 'Padrón';

-- ── Citations inventées, sans fait à sauver ─────────────

-- Partagás perd ses deux entrées : Maugham (citation inventée, et la
-- livraison « via l'ambassade » ne repose sur rien) et Groucho Marx
-- (citation inventée, et aucun lien documenté avec cette marca —
-- Groucho fumait, ce qui ne dit rien de la maison qu'il fumait).
UPDATE `brands` SET
  `celebrities`    = JSON_REMOVE(`celebrities`,    '$[1]', '$[0]'),
  `celebrities_en` = JSON_REMOVE(`celebrities_en`, '$[1]', '$[0]'),
  `celebrities_es` = JSON_REMOVE(`celebrities_es`, '$[1]', '$[0]'),
  `celebrities_de` = JSON_REMOVE(`celebrities_de`, '$[1]', '$[0]'),
  `celebrities_zh` = JSON_REMOVE(`celebrities_zh`, '$[1]', '$[0]'),
  `celebrities_ar` = JSON_REMOVE(`celebrities_ar`, '$[1]', '$[0]')
WHERE `name` = 'Partagás';

-- Evelyn Waugh : citation inventée, et « fumeur de Punch notoire » ne
-- repose sur rien. L'entrée du prince de Galles, elle, reste : le lien
-- de Punch au marché britannique est documenté.
UPDATE `brands` SET
  `celebrities`    = JSON_REMOVE(`celebrities`,    '$[1]'),
  `celebrities_en` = JSON_REMOVE(`celebrities_en`, '$[1]'),
  `celebrities_es` = JSON_REMOVE(`celebrities_es`, '$[1]'),
  `celebrities_de` = JSON_REMOVE(`celebrities_de`, '$[1]'),
  `celebrities_zh` = JSON_REMOVE(`celebrities_zh`, '$[1]'),
  `celebrities_ar` = JSON_REMOVE(`celebrities_ar`, '$[1]')
WHERE `name` = 'Punch';

-- Jean-Paul Sartre : « grand fumeur de pipe devenu fumeur de cigares »
-- puis passé aux Bolívar — rien ne l'établit. L'entrée de Che Guevara
-- reste : l'image est historiquement attestée.
UPDATE `brands` SET
  `celebrities`    = JSON_REMOVE(`celebrities`,    '$[1]'),
  `celebrities_en` = JSON_REMOVE(`celebrities_en`, '$[1]'),
  `celebrities_es` = JSON_REMOVE(`celebrities_es`, '$[1]'),
  `celebrities_de` = JSON_REMOVE(`celebrities_de`, '$[1]'),
  `celebrities_zh` = JSON_REMOVE(`celebrities_zh`, '$[1]'),
  `celebrities_ar` = JSON_REMOVE(`celebrities_ar`, '$[1]')
WHERE `name` = 'Bolivar';

-- ── Réécritures : le fait survit, la parole part ────────
-- Français seulement. Les cinq traductions deviendront périmées, ce qui
-- est exactement le signal attendu.

UPDATE `brands` SET `celebrities` = JSON_SET(`celebrities`, '$[0].anecdote',
  'Castro fumait beaucoup — les chiffres avancés varient — et cessa en 1985 sur conseil médical, appelant publiquement ses compatriotes à en faire autant. Le dirigeant qui avait donné son nom de guerre au tabac cubain a fini par en faire campagne contre.')
WHERE `name` = 'Cohiba';

UPDATE `brands` SET `celebrities` = JSON_SET(`celebrities`, '$[0].anecdote',
  'Après la destruction de l''outil familial au tournant des années 1980, Carlos Jr. a rebâti la maison en République dominicaine, à Santiago. C''est là qu''est née la Château de la Fuente, la plantation où pousse la cape maison — un fabricant qui cultive lui-même sa feuille reste rare.')
WHERE `name` = 'Arturo Fuente';

UPDATE `brands` SET `celebrities` = JSON_SET(`celebrities`, '$[0].anecdote',
  'Fils d''un marchand de tabac de Kiev établi à Genève, Zino Davidoff a fait de la boutique paternelle une maison mondiale, et du mot « humidor » un objet de salon. Il est mort en 1994.')
WHERE `name` = 'Davidoff';

UPDATE `brands` SET `celebrities` = JSON_SET(`celebrities`, '$[0].anecdote',
  'Parti de Cuba en 1961, José Orlando Padrón a fondé sa maison à Miami avant de s''installer au Nicaragua. Né en 1926, mort en 2017, il a dirigé l''entreprise jusqu''à un âge avancé et transmis à son fils Jorge.')
WHERE `name` = 'Padrón';

UPDATE `brands` SET `celebrities` = JSON_SET(`celebrities`, '$[0].anecdote',
  'Quatrième génération d''une famille de planteurs partie de Cuba dans les années 1960. La maison est restée indépendante et intégrée — de la plantation de Jalapa au cigare fini — ce qui la distingue des marques qui achètent leur feuille.')
WHERE `name` = 'Oliva';
