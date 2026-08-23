-- ════════════════════════════════════════════════════════
-- 061 — Six notes de plus, et une anecdote sur la mauvaise fiche
-- ────────────────────────────────────────────────────────
-- ── LE MOTIF QUI RATAIT SIX FOIS ────────────────────────
--
-- La migration 059 avait retiré treize notes de presse cachées dans la
-- prose. Six autres y ont survécu, sous la forme « Score Cigar
-- Aficionado 93 » : le motif exigeait le NOMBRE juste après « score »,
-- et le nom de la revue s'intercale.
--
-- C'est la troisième fois dans ce chantier qu'un contrôle rate par sa
-- forme et non par son intention. Le motif accepte désormais les deux
-- ordres et tolère jusqu'à trente caractères entre les deux.
--
-- ── UNE ANECDOTE SUR LA MAUVAISE FICHE ──────────────────
--
-- Montecristo portait l'anecdote de Kennedy — celle des 1 200 Petit
-- Upmann achetés la veille de l'embargo. Elle concerne H. UPMANN, dont
-- la fiche la porte déjà.
--
-- Et les deux versions se contredisaient : chez H. Upmann ce sont les
-- cigares de Kennedy, chez Montecristo « les cigares préférés de Pierre
-- Salinger » — qui était l'attaché de presse envoyé les acheter. Le même
-- fait, raconté deux fois, avec deux protagonistes différents.
--
-- Aucun contrôle ne pouvait le voir : chaque fiche était cohérente avec
-- elle-même. C'est exactement la panne du lot R5, celle qui a donné
-- naissance à coherence_check — un fait écrit à deux endroits diverge
-- sans que rien ne le signale.
--
-- ── ET UNE DE PLUS AU CONDITIONNEL ──────────────────────
--
-- Romeo y Julieta : « Sur le tournage d'Autant en emporte le vent,
-- il aurait fumé plus de 300 cigares. » Un chiffre précis sous un
-- conditionnel — la combinaison la plus trompeuse qui soit.
-- ════════════════════════════════════════════════════════

-- ── L'anecdote égarée et celle au conditionnel ──────────

UPDATE `brands` SET
  `celebrities`    = JSON_REMOVE(`celebrities`,    '$[1]'),
  `celebrities_en` = JSON_REMOVE(`celebrities_en`, '$[1]'),
  `celebrities_es` = JSON_REMOVE(`celebrities_es`, '$[1]'),
  `celebrities_de` = JSON_REMOVE(`celebrities_de`, '$[1]'),
  `celebrities_zh` = JSON_REMOVE(`celebrities_zh`, '$[1]'),
  `celebrities_ar` = JSON_REMOVE(`celebrities_ar`, '$[1]')
WHERE `name` IN ('Montecristo', 'Romeo y Julieta');

-- ── Les six récits, réécrits ────────────────────────────

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'Format Double Corona (47 x 178mm), nommé en 1954 pour les 80 ans de Churchill — qui fumait H. Upmann avant de passer à Romeo y Julieta. La Sir Winston est l''un des rares formats géants encore produits régulièrement. Quatre-vingt-dix minutes d''une complexité crémeuse : noix, bois de santal. Fumée dans les règles, elle ne déçoit pas.')
WHERE `name` = 'H. Upmann';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'Recréation de l''assemblage présidentiel de 1970. Tabac nicaraguayen vieilli six ans au minimum. Notes de cuir, réglisse noire, café sans sucre, poivre long. Corsé à l''extrême — pour fumeurs aguerris.')
WHERE `name` = 'Joya de Nicaragua';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'Format Torpedo (52 x 162mm). La forme pyramidale concentre les arômes en une montée progressive. Notes dominantes de cèdre, noisette grillée, épices douces. Quatre-vingt-dix minutes. C''est la vitole que l''on cite le plus souvent quand on parle d''équilibre à Cuba.')
WHERE `name` = 'Montecristo';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'La Série D No.4 — Robusto 50 x 124mm — est la référence corsée de la maison. Terreuse, puissante, complexe. Notes de cacao amer, poivre noir, sous-bois humide. Quarante-cinq minutes, et elle ne pardonne pas une conservation négligée. C''est souvent le premier cigare vraiment puissant que découvre un amateur confirmé — et il y revient.')
WHERE `name` = 'Partagás';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'Format Churchill (47 x 178mm) — nommé en hommage direct au Premier ministre. Quarante-cinq minutes de fumée. Notes florales, crème, cèdre doux. C''est le format que l''on recommande le plus volontiers à un amateur qui progresse. Churchill lui-même en commandait des boîtes portant sa bague.')
WHERE `name` = 'Romeo y Julieta';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'Format Corona (44 x 143mm), assemblage Brésil-Équateur-Indonésie. La proposition premium de la maison — notes de cèdre, café, épices douces. Construite avec la régularité que les marchés allemand et suisse exigent.')
WHERE `name` = 'Villiger';
