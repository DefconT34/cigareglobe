-- ════════════════════════════════════════════════════════
-- 075 — « Wrapper » dans les anecdotes et les accords
-- ────────────────────────────────────────────────────────
-- Deuxième lot de vocabulaire : `brands.celebrities` et
-- `brands.pairings`. Onze textes, même règle qu'à la migration 074 —
-- « cape » est féminine, « wrapper » ne l'était pas, donc chaque phrase
-- est reprise et non remplacée.
--
-- « Le Connecticut wrapper » chez Cohiba USA méritait mieux qu'une
-- substitution : la formule collait un nom de variété anglais à un nom
-- commun anglais, dans une phrase française. Elle devient « la cape
-- Connecticut ».
-- ════════════════════════════════════════════════════════

UPDATE `brands` SET `celebrities` = JSON_SET(`celebrities`, '$[1].anecdote',
  'Le patriarche suisse considérait Excalibur comme sa plus grande fierté dans le cigare premium. Il la fumait quotidiennement et refusait catégoriquement qu''on retouche l''assemblage pour en réduire le coût.')
WHERE `name` = 'Excalibur';

UPDATE `brands` SET `celebrities` = JSON_SET(`celebrities`, '$[0].anecdote',
  'Le tabac de San Andrés Tuxtla était utilisé dans les cérémonies religieuses aztèques — offert aux dieux lors des sacrifices rituels. Te Amo cultive le même sol, dans la même vallée, avec la même patience que les cultivateurs précolombiens. La cape maduro mexicaine est l''un des rares liens directs entre la civilisation précolombienne et le cigare moderne.')
WHERE `name` = 'Te Amo';

UPDATE `brands` SET `pairings` = JSON_SET(`pairings`, '$[0].notes',
  'Le café du même pays que la cape — notes communes de chocolat et de caramel, que l''on retrouve identiques dans le Fuente Maduro.')
WHERE `name` = 'Arturo Fuente Maduro';

UPDATE `brands` SET `pairings` = JSON_SET(`pairings`, '$[0].notes',
  'Le mezcal de la même région que la cape — Veracruz produit à la fois du tabac et du mezcal d''exception. Notes communes de fumée et de terre volcanique.')
WHERE `name` = 'CAO Black';

UPDATE `brands` SET `pairings` = JSON_SET(`pairings`, '$[0].notes',
  'L''accord américain par excellence pour le Red Dot. La vanille et le caramel du bourbon du Kentucky amplifient la douceur de la cape dominicaine sans écraser un profil volontairement modeste.')
WHERE `name` = 'Cohiba USA';

UPDATE `brands` SET `pairings` = JSON_SET(`pairings`, '$[1].notes',
  'Pour le Cohiba Blue, l''amertume florale d''une IPA à houblonnage tardif offre un contraste intéressant avec la légèreté crémeuse de la cape Connecticut.')
WHERE `name` = 'Cohiba USA';

UPDATE `brands` SET `pairings` = JSON_SET(`pairings`, '$[0].notes',
  'Le rhum nicaraguayen vieilli 25 ans rencontre l''assemblage nicaraguayen vieilli 4 ans. Accord de terroir, profondeur commune de cacao et de canne.')
WHERE `name` = 'My Father';

UPDATE `brands` SET `pairings` = JSON_SET(`pairings`, '$[0].notes',
  'Le café camerounais, légèrement boisé et chocolaté, s''harmonise avec les notes de la cape camerounaise. Accord de terroir africain.')
WHERE `name` = 'Oliva Serie G';

UPDATE `brands` SET `pairings` = JSON_SET(`pairings`, '$[0].notes',
  'La douceur d''un thé blanc de grande finesse s''accorde avec la légèreté crémeuse de la cape équatorienne.')
WHERE `name` = 'Perdomo Ecuador';

UPDATE `brands` SET `pairings` = JSON_SET(`pairings`, '$[1].notes',
  'L''accord quotidien de la Cabinet Selection. La douceur lactée est amplifiée par la légèreté crémeuse de la cape — deux produits faits pour le confort du matin.')
WHERE `name` = 'Santa Damiana';

UPDATE `brands` SET `pairings` = JSON_SET(`pairings`, '$[1].notes',
  'Pour la gamme Crown, la minéralité pétrolée et la douceur florale d''un riesling d''Alsace amplifient les notes herbacées et florales de la cape Corojo du Honduras.')
WHERE `name` = 'Zino Platinum';
