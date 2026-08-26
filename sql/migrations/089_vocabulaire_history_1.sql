-- ════════════════════════════════════════════════════════
-- 089 — Le vocabulaire de `history`, premier lot
-- ────────────────────────────────────────────────────────
-- Treize fiches sur les vingt-cinq que le relevé signale. Même règle
-- qu'aux migrations 074 et 075 : « cape » est féminine là où « wrapper »
-- était masculin, donc chaque phrase est reprise et non remplacée.
--
-- ── LES HYBRIDES ────────────────────────────────────────
--
-- Plusieurs fiches ne mêlaient pas seulement le vocabulaire mais les
-- LANGUES : « Wrapper Cameroun sur Dominican », « le wrapper Brazilian
-- Maduro », « le blend Dominican Fuente », « le Dominican wrapper ». Un
-- nom commun anglais accolé à un adjectif de pays anglais, dans une
-- phrase française.
--
-- Et une phrase qui ne voulait rien dire : « premier cigare dominicain
-- entièrement WRAPPER DE TABAC dominicain ». Le mot y sert à la fois de
-- nom et de complément.
--
-- ── DEUX DÉFAUTS TROUVÉS EN RELISANT ────────────────────
--
-- Ashton : la manufacture Fuente y était « LA MEILLEURE de République
-- dominicaine ». Un superlatif régional, que le motif ne voit pas — il
-- cherche « du monde », et celui-ci nomme un pays. Il part avec le reste
-- de la phrase.
--
-- H. Upmann : « INVENTANT AINSI le packaging luxueux du cigare
-- moderne ». La revendication d'invention est forte, et invérifiable :
-- d'autres maisons emballaient déjà. La phrase dit désormais que ce sont
-- ses codes qui se sont imposés, ce qui est observable.
--
-- C'est la même leçon qu'à la migration 088 : corriger un mot dans une
-- phrase n'exempte pas de lire le reste de la phrase.
-- ════════════════════════════════════════════════════════

UPDATE `brands` SET `history` = REPLACE(`history`,
  'premier cigare dominicain entièrement wrapper de tabac dominicain. Avant Fuente, on pensait que le Dominican wrapper était trop fragile.',
  'premier cigare dominicain dont la cape elle-même vient de République dominicaine. Avant Fuente, on tenait la cape dominicaine pour trop fragile.')
WHERE `name` = 'Arturo Fuente';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'Wrapper Cameroun sur Dominican.',
  'Cape camerounaise sur dominicain.')
WHERE `name` = 'Arturo Fuente Hemingway';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'utilise le wrapper Brazilian Maduro — les feuilles de tabac Bahia et Arapiraca du Brésil',
  'utilise une cape maduro du Brésil — les feuilles Bahia et Arapiraca')
WHERE `name` = 'Arturo Fuente Maduro';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'Sur le blend Dominican Fuente, ce wrapper brésilien crée',
  'Sur l''assemblage dominicain de Fuente, cette cape brésilienne crée')
WHERE `name` = 'Arturo Fuente Maduro';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'Il s''associa à la manufacture Arturo Fuente — la meilleure de République Dominicaine — et confia le blend à Carlos Fuente Sr. en personne.',
  'Il s''associa à la manufacture Arturo Fuente et confia l''assemblage à Carlos Fuente Sr. en personne.')
WHERE `name` = 'Ashton';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'Le wrapper Connecticut Shade équatorien, plus fin et plus doux que l''américain,',
  'La cape Connecticut Shade d''Équateur, plus fine et plus douce que l''américaine,')
WHERE `name` = 'Ashton Cabinet';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'enveloppé dans un wrapper de feuilles de tabac indonésiennes',
  'enveloppé dans une cape de feuilles indonésiennes')
WHERE `name` = 'Café Crème';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'Le corojo — tabac qui donne le wrapper signature de Cuba —',
  'Le corojo — le tabac qui donne à Cuba sa cape signature —')
WHERE `name` = 'Camacho';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'Les packaging noirs et agressifs,',
  'Les boîtes noires et agressives,')
WHERE `name` = 'Camacho';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'blends audacieux, formats inédits, noms évocateurs.',
  'assemblages audacieux, formats inédits, noms évocateurs.')
WHERE `name` = 'CAO';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'la Pilon (blend nicaraguayen pur), la Cameroon (wrapper africain sur blend Centre-américain)',
  'la Pilon (assemblage nicaraguayen pur), la Cameroon (cape africaine sur tabacs d''Amérique centrale)')
WHERE `name` = 'CAO';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'à une époque où les blends nicaraguayens et honduriens dominaient tout',
  'à une époque où les assemblages nicaraguayens et honduriens dominaient tout')
WHERE `name` = 'CAO America';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'utilise le wrapper Mexican San Andrés Maduro',
  'utilise la cape San Andrés Maduro du Mexique')
WHERE `name` = 'CAO Black';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'Sur un blend Nicaraguayen-Hondurien, ce wrapper mexicain crée',
  'Sur un assemblage nicaraguayen et hondurien, cette cape mexicaine crée')
WHERE `name` = 'CAO Black';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'utilisant le wrapper camerounais AVO XO — l''un des wrappers africains les plus prisés',
  'utilisant la cape camerounaise AVO XO — l''une des capes africaines les plus prisées')
WHERE `name` = 'CAO Cameroon';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'tournée vers les blends de plus en plus forts',
  'tournée vers les assemblages de plus en plus forts')
WHERE `name` = 'El Rey del Mundo';

UPDATE `brands` SET `history` = REPLACE(`history`,
  '— inventant ainsi le packaging luxueux du cigare moderne.',
  '— et ce sont ses codes de présentation que la profession a repris.')
WHERE `name` = 'H. Upmann';
