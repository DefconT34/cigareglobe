-- ════════════════════════════════════════════════════════
-- 069 — Un en-tête qui contredit son texte
-- ────────────────────────────────────────────────────────
-- La migration 065 a retiré de Joya de Nicaragua une citation que la
-- fiche annonçait elle-même comme apocryphe, et réécrit l'anecdote pour
-- dire ce qui est documenté : la marque était le cigare de protocole du
-- régime Somoza, « et non une préférence personnelle attestée ».
--
-- Le titre de l'entrée, lui, est resté « Richard Nixon ».
--
-- Une fiche affiche donc le nom d'un président des États-Unis au-dessus
-- d'un texte qui explique qu'on ne lui connaît aucune préférence pour
-- cette marque. Un lecteur voit le nom en gras ; le démenti est
-- au-dessous, en petit.
--
-- La correction de 065 était incomplète, et rien ne pouvait le voir :
-- aucun contrôle ne compare un en-tête à son texte. Je l'ai trouvé en
-- relisant la fiche pour la traduire — comme presque tous les défauts
-- de ce chantier.
--
-- ── BIANCA JAGGER ───────────────────────────────────────
--
-- La même fiche portait une seconde entrée : « L'icône des années 70,
-- ex-femme de Mick Jagger et native du Nicaragua, a souvent été
-- photographiée avec des cigares nicaraguayens lors de ses activités
-- militantes. »
--
-- Rien n'est sourçable là-dedans. « Souvent photographiée » ne renvoie à
-- aucune photo, et la seule chose vérifiable — être née à Managua — ne
-- relie personne à une marque de cigares.
--
-- Il s'agit d'une personne vivante, militante des droits humains, et
-- l'affirmation la range parmi les figures d'une marque de tabac sans
-- qu'elle l'ait jamais dit. L'entrée est retirée des six colonnes, pas
-- réécrite : il n'y a rien à sauver dedans.
--
-- ── LE LECTOR, PAS LES TORCEDORES ───────────────────────
--
-- Montecristo affirmait que « les torcedors de La Havane qui lisaient
-- son œuvre pendant le roulage » perpétuaient la mémoire de Dumas. On
-- ne lit pas en roulant : c'est le lector, lecteur d'atelier payé pour
-- cela, qui fait la lecture à voix haute pendant que les autres
-- travaillent. C'est même toute la raison pour laquelle la fonction
-- existe — et c'est de cette lecture-là que la marque tire son nom.
--
-- ── « ÉDITION PERMANENTE, PRODUCTION LIMITÉE » ──────────
--
-- Quatre mots qui se contredisent, dans la même phrase, sur la Línea
-- 1935. La date de lancement annoncée (2015, pour les 80 ans) n'étant
-- pas vérifiable de mon côté, elle part aussi : la phrase dit ce qui
-- reste vrai, une ligne au catalogue permanent et de faibles volumes.
--
-- ── ET LES ACCORDS ROMPUS ───────────────────────────────
--
-- « un accord d'UNE raffinement absolu » chez Ashton. Deuxième faute
-- d'accord du chantier après « teste chaque blend en LES fumant »
-- (migration 068), et trouvée de la même façon : en traduisant.
-- ════════════════════════════════════════════════════════

-- ── Montecristo ─────────────────────────────────────────
UPDATE `brands` SET `celebrities` = JSON_SET(`celebrities`, '$[0].anecdote',
  'L''auteur du Comte de Monte-Cristo n''a jamais fumé ces cigares : il est mort en 1870, soixante-cinq ans avant la création de la marque. C''est le lector — le lecteur d''atelier, payé pour faire la lecture à voix haute pendant que les autres roulent — qui portait le roman jusqu''aux tables des torcedores. La tradition veut que le nom de la marque vienne de là.')
WHERE `name` = 'Montecristo';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[2].story',
  'Une ligne qui renvoie à l''année de fondation de la marque, 1935. Feuilles de Vuelta Abajo, assemblage plus épicé et plus corsé que la gamme classique. Elle figure au catalogue permanent, mais les volumes restent faibles — c''est une gamme qu''on ne trouve pas dans toutes les caves.')
WHERE `name` = 'Montecristo';

-- ── Ashton ──────────────────────────────────────────────
UPDATE `brands` SET `celebrities` = JSON_SET(`celebrities`, '$[0].anecdote',
  'Taylor est l''exemple rare d''un détaillant devenu fabricant. Il ne possède pas d''usine : depuis l''origine, les cigares Ashton sont roulés par la maison Fuente en République dominicaine, dans les mêmes ateliers et avec les mêmes tabacs que les gammes Fuente. C''est une marque entièrement construite sur une relation avec un tiers, et elle ne s''en cache pas.')
WHERE `name` = 'Ashton';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'La gamme fondatrice. Cape Connecticut Shade sur assemblage dominicain, roulée par Fuente. Notes de crème, vanille, céréales grillées. Régulière, élégante, sans surprise. Le format Magnum (52 x 127mm) est le plus demandé. L''Ashton Classic est le cigare qu''on offre quand on ne connaît pas les goûts de son invité.')
WHERE `name` = 'Ashton';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[2].story',
  'La gamme prestige — vieillie douze à vingt-quatre mois de plus en boîtes de cèdre espagnol après roulage. Cape Connecticut Shade. Notes de noisette affinée, miel de montagne, cèdre blanc. Complexe sans être exigeante : c''est exactement ce qu''elle cherche à être.')
WHERE `name` = 'Ashton';

UPDATE `brands` SET `pairings` = JSON_SET(`pairings`, '$[0].notes',
  'La délicatesse florale du Perrier-Jouët accompagne l''élégance crémeuse du Cabinet Selection en un accord d''un raffinement absolu.')
WHERE `name` = 'Ashton';

-- ── Joya de Nicaragua : deux entrées deviennent une ──────
-- L'en-tête « Richard Nixon » est remplacé, l'entrée Bianca Jagger
-- supprimée. Les cinq colonnes traduites sont reconstruites par le lot
-- de traduction qui suit — la parité des six colonnes est vérifiée par
-- tools/marques_check.php.
UPDATE `brands` SET `celebrities` = JSON_ARRAY(JSON_OBJECT(
  'name',     'La Maison-Blanche des années Somoza',
  'anecdote', 'Joya de Nicaragua était le cigare de protocole du régime Somoza, offert aux hôtes officiels — d''où sa présence à Washington dans les années qui suivirent l''embargo cubain. C''est ce statut, et non une préférence personnelle attestée, qui a lié la marque à la Maison-Blanche de cette période.'))
WHERE `name` = 'Joya de Nicaragua';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[1].story',
  '« Quatre décennies » — édition anniversaire pour les 40 ans de la marque, en 2008. L''assemblage le plus complexe de la maison : des tabacs de cinq pays, vieillis quatre ans. Notes de cacao noir, cannelle, sous-bois, café. Production annuelle strictement limitée.')
WHERE `name` = 'Joya de Nicaragua';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[2].story',
  'La gamme mi-corsée accessible. Cape équatorienne sur nicaraguayen. Notes de noisette, chocolat au lait, poivre blanc. L''entrée dans l''univers Joya sans l''engagement que demande un Antaño. Idéale pour découvrir la maison.')
WHERE `name` = 'Joya de Nicaragua';
