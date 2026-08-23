-- ════════════════════════════════════════════════════════
-- 063 — Sept paroles de plus, et le piège de l'apostrophe
-- ────────────────────────────────────────────────────────
-- ── CE QUE LE DÉTECTEUR RATAIT, ET POURQUOI ─────────────
--
-- Le contrôle des paroles prêtées a été élargi trois fois. Chaque
-- élargissement a rattrapé des cas et en a créé d'autres, jusqu'à ce que
-- la vraie difficulté apparaisse :
--
--   EN FRANÇAIS, L'APOSTROPHE EST UNE MARQUE D'ÉLISION.
--
-- « comme l'une des plus belles collaborations de l'industrie » se lit
-- comme une citation pour n'importe quel motif naïf : deux apostrophes
-- encadrent du texte. Quatre faux positifs d'un coup.
--
-- Le discriminant tient en une phrase, mais il faut la dire juste :
-- une apostrophe OUVRANTE n'est pas précédée d'une lettre ; une
-- apostrophe FERMANTE n'est pas suivie d'une lettre. Ce ne sont pas les
-- mêmes signes, et la version qui testait la même condition des deux
-- côtés ratait TOUTES les citations — puisque leur apostrophe fermante
-- suit toujours une lettre.
--
-- La détection ne tient plus dans une expression régulière unique. Elle
-- est passée dans `parole_pretee()`, éprouvée sur sept cas construits
-- dont les deux pièges.
--
-- ── LES SEPT ────────────────────────────────────────────
--
-- Toutes sont des aphorismes plausibles attribués à des personnes
-- réelles. Aucune n'est sourçable.
--
-- Trois portent sur des personnes VIVANTES ou récemment disparues :
-- Hendrik Kelner, Nestor Plasencia Sr., et la famille de Cano Ozgener à
-- qui l'on prête un propos sur un mort.
--
-- Le cas Churchill / Romeo y Julieta mérite une note : le mot d'esprit
-- sur le médecin et les dîners circule effectivement, mais sous des
-- formes variables et sans source primaire. Une citation qui existe en
-- plusieurs versions n'est pas une citation vérifiée.
--
-- Et Hoyo de Monterrey invoque des « archives personnelles » de
-- Churchill qui mentionneraient les Hoyo comme son « second amour ».
-- Invoquer une archive sans la nommer, c'est emprunter son autorité
-- sans en accepter la vérification.
--
-- ── CE QUI RESTE ────────────────────────────────────────
--
-- Les faits survivent aux citations qui les habillaient. Churchill a
-- bien fumé toute sa vie ; Robaina a bien travaillé ses terres jusqu'à
-- un grand âge ; Kelner a bien contribué à la réputation de Jamastrán.
-- Ces phrases-là sont réécrites sans la parole inventée.
--
-- Zino Platinum perd son entrée : elle ne reposait QUE sur deux
-- citations, et il n'en reste rien une fois retirées.
-- ════════════════════════════════════════════════════════

UPDATE `brands` SET
  `celebrities`    = JSON_REMOVE(`celebrities`,    '$[0]'),
  `celebrities_en` = JSON_REMOVE(`celebrities_en`, '$[0]'),
  `celebrities_es` = JSON_REMOVE(`celebrities_es`, '$[0]'),
  `celebrities_de` = JSON_REMOVE(`celebrities_de`, '$[0]'),
  `celebrities_zh` = JSON_REMOVE(`celebrities_zh`, '$[0]'),
  `celebrities_ar` = JSON_REMOVE(`celebrities_ar`, '$[0]')
WHERE `name` = 'Zino Platinum';

-- ── Les six réécrites ───────────────────────────────────

UPDATE `brands` SET `celebrities` = JSON_SET(`celebrities`, '$[0].anecdote',
  'L''entrepreneur turco-américain qui transforma une boutique de pipes de Nashville en manufacture mondiale. Il est mort en 2007, quelques mois après la vente de sa maison à General Cigar — assez tard pour voir ce qu''il avait bâti passer en d''autres mains.')
WHERE `name` = 'CAO';

UPDATE `brands` SET `celebrities` = JSON_SET(`celebrities`, '$[0].anecdote',
  'La vallée de Jamastrán n''était pas encore reconnue comme grande région de production en 1983. Excalibur, née là, a contribué à établir sa réputation internationale — et Kelner y a fait une partie de son apprentissage du tabac hondurien.')
WHERE `name` = 'Excalibur';

UPDATE `brands` SET `celebrities` = JSON_SET(`celebrities`, '$[0].anecdote',
  'Churchill est associé à Romeo y Julieta, dont une vitole porte son nom. Hoyo de Monterrey figure aussi parmi les marques qu''il fumait, sans qu''on puisse en faire une préférence : il consommait largement, et de plusieurs maisons.')
WHERE `name` = 'Hoyo de Monterrey';

UPDATE `brands` SET `celebrities` = JSON_SET(`celebrities`, '$[0].anecdote',
  'Cinquième génération, Nestor Plasencia est à la fois planteur, fermenteur et assembleur. La maison contrôle la chaîne entière — de la graine à la boîte — sans dépendre d''un fournisseur extérieur, ce qui reste rare dans le métier.')
WHERE `name` = 'Plasencia';

UPDATE `brands` SET `celebrities` = JSON_SET(`celebrities`, '$[0].anecdote',
  'Churchill fuma son premier Romeo y Julieta à vingt et un ans, à Cuba, et ne s''arrêta plus. Sa consommation quotidienne, souvent citée à huit ou dix cigares, tient de la légende autant que du fait. Il est mort à quatre-vingt-dix ans, et la vitole Churchill porte son nom depuis.')
WHERE `name` = 'Romeo y Julieta';

UPDATE `brands` SET `celebrities` = JSON_SET(`celebrities`, '$[0].anecdote',
  'Don Alejandro passait ses matinées dans ses plantations jusqu''à un âge avancé, et refusait qu''on lui attribue un secret de culture : il tenait que son travail consistait surtout à ne pas contrarier la plante. Il est le seul cultivateur cubain dont une marca porte le nom.')
WHERE `name` = 'Vegas Robaina';
