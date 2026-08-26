-- ════════════════════════════════════════════════════════
-- 091 — Le vocabulaire des récits de gamme, premier lot
-- ────────────────────────────────────────────────────────
-- Vingt-huit récits sur les cinquante-cinq que le relevé signale.
-- « wrapper » ×49, « blend » ×23, « full body » ×9, « medium-full » ×7.
--
-- Comme aux quatre lots précédents, la relecture fait remonter autre
-- chose que le vocabulaire :
--
--   Camacho Corojo : « la RÉFÉRENCE MONDIALE du Honduran Corojo »
--   CAO Cameroon   : « la gamme LA PLUS VENDUE de CAO en Europe »
--   Drew Estate    : « le BEST-SELLER infusé », « des MILLIONS
--                     d'Américains »
--
-- Un rang mondial, un rang de ventes régional, et deux affirmations de
-- volume. Les trois premières ne disent rien de vérifiable ; la
-- quatrième dit quelque chose de vrai — la gamme ACID a effectivement
-- élargi le public du cigare — mais le chiffre ne se vérifie pas et
-- n'ajoute rien.
--
-- ── LES HYBRIDES, ENCORE ────────────────────────────────
--
-- « Wrapper Camerounais sur Dominican vieilli », « Wrapper Brazilian
-- Maduro sur Dominican vieilli Fuente », « Blend Pennsylvania-Virginia-
-- Connecticut wrapper », « Wrapper Indonesian sur blend propriétaire ».
-- Le nom commun anglais et l'adjectif de pays anglais, dans une phrase
-- française.
-- ════════════════════════════════════════════════════════

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'Format Torpedo (52 x 152mm) pressé en boîte. Assemblage hondurien, guatémaltèque et nicaraguayen, cape Jamastrán du Honduras. Notes de poivre noir intense, café espresso, noix de cajou grillée. La section rectangulaire change la combustion — les arômes en sortent plus concentrés.')
WHERE `name` = 'Alec Bradley';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[1].story',
  'Lancée en 2008. Assemblage hondurien et nicaraguayen, cape d''Équateur. Notes de cuir, épices orientales, bois sombre. Mi-corsée à corsée, équilibrée. La gamme qui précédait le Prensado et qui reste la plus constante de la maison — disponible quand le Prensado est épuisé.')
WHERE `name` = 'Alec Bradley';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[2].story',
  'Lancée en 2019, à prix doux. Cape Connecticut Shade sur assemblage d''Amérique centrale. Notes de noisette, crème, bois léger. L''entrée dans l''univers Alec Bradley pour qui découvre la maison.')
WHERE `name` = 'Alec Bradley';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'Format Perfecto — deux extrémités pointues. Cape camerounaise sur dominicain vieilli. Notes de noix de cajou, café crème, bois de santal. Chaque format porte un titre de l''écrivain : Short Story, Best Seller, Masterpiece — neuf pouces, le plus long de la gamme, quatre-vingt-dix minutes.')
WHERE `name` = 'Arturo Fuente Hemingway';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'Cape maduro du Brésil (Bahia et Arapiraca) sur dominicain vieilli chez Fuente. Notes de chocolat, mélasse, légère douceur de canne. Mi-corsée à corsée. La face brésilienne d''Arturo Fuente — douce en apparence, complexe en profondeur. Le format Robusto est celui qui l''équilibre le mieux.')
WHERE `name` = 'Arturo Fuente Maduro';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'Cape Connecticut Shade d''Équateur vieillie, tabacs dominicains vieillis deux ans en cèdre chez Fuente. Notes de noisette affinée, miel de montagne, cèdre blanc. Mi-corsée, élégante. Chaque numéro, du No.1 au No.10, correspond à un format — c''est la gamme la plus complète d''Ashton.')
WHERE `name` = 'Ashton Cabinet';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[1].story',
  'La gamme jazz, aux noms d''accords : Intermezzo (Robusto), Maestoso (Churchill), Notturno (Toro). Cape Connecticut Shade plus épaisse sur dominicain plus structuré. Notes de noisette grillée, cèdre, vanille dorée. L''Intermezzo est la plus demandée — comme un air qu''on fredonne sans y penser.')
WHERE `name` = 'Avo';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[2].story',
  'Hommage posthume au fondateur, lancé après sa mort en 2017. Cape Connecticut Broadleaf sur dominicain et nicaraguayen. Mi-corsée à corsée, plus que les gammes classiques. Notes de pain grillé, café, légère épice. La signature finale d''un homme qui a fait de ses deux passions une seule.')
WHERE `name` = 'Avo';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[1].story',
  'Petit Corona (42 x 127mm). Plus accessible que les Belicosos, sans rien céder sur le caractère. Le Royal Corona est le Bolívar de tous les jours — pour qui entend par là du corsé sans exception. Notes de bois sombre, sous-bois, épices noires.')
WHERE `name` = 'Bolivar';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'Le produit originel — cape Corojo du Honduras sur tripe ligero de Jamastrán. Corsé, intense. Notes de poivre rouge, café serré, sous-bois sombre. C''est le cigare qui a donné son sens à l''expression « Corojo hondurien » : un terroir à part entière, différent du cubain.')
WHERE `name` = 'Camacho';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[1].story',
  '« Box Pressed Xtreme » — format carré pressé, puissance maximale. Cape hondurienne oscuro sur ligero pur. Notes de café brûlé, cacao pur, réglisse noire. Le BXP est ce que Camacho propose quand elle veut montrer jusqu''où elle peut aller. Fumeurs confirmés seulement.')
WHERE `name` = 'Camacho';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[2].story',
  'Assemblage nicaraguayen et hondurien vieilli en fûts de bourbon américain avant roulage. Notes de bourbon, vanille de chêne, épices douces. Mi-corsée à corsée. La gamme qui montre que Camacho peut être complexe sans être brutale — l''exception accessible dans un catalogue de guerriers.')
WHERE `name` = 'Camacho';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[1].story',
  'Inspirée des moteurs Harley-Davidson V-twin, chaque format porte le nom d''une pièce : V660 Carb, V554 Piston, V770 Engine. Cape d''Équateur sur nicaraguayen et hondurien. Corsée, notes de cuir, café noir, chocolat, huile de moteur — vraiment. Cigare de route et d''Amérique industrielle.')
WHERE `name` = 'CAO';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'Format Toro. Assemblage Pennsylvanie-Virginie, cape Connecticut. Notes de foin séché, fruits rouges, légère acidité. Mi-corsée. La gamme la plus abordable de la série America — une introduction au terroir américain.')
WHERE `name` = 'CAO America';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[1].story',
  'Corsée et américaine — cape Connecticut Broadleaf sur ligero de Virginie. Notes de cèdre américain, noix, épices automnales. La face puissante de la série. Le format Churchill est celui qui laisse l''évolution aromatique aller au bout.')
WHERE `name` = 'CAO America';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'Cape San Andrés Maduro du Mexique sur nicaraguayen et hondurien. Notes de cacao noir, réglisse, poivre de Cayenne. Corsée. Le côté sombre de CAO — puissant, direct, sans compromis. Le format Toro est celui qui en donne le plus.')
WHERE `name` = 'CAO Black';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'Cape camerounaise sur assemblage hondurien et dominicain. Notes de chocolat au lait, noisette, herbes douces. Mi-corsée, équilibrée. C''est la gamme par laquelle CAO s''est installée en Europe — la cape africaine apporte une onctuosité que les capes américaines ou caribéennes ne donnent pas.')
WHERE `name` = 'CAO Cameroon';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'Nommée en référence à l''exil de 1959. Cape Connecticut Shade sur assemblage dominicain et nicaraguayen. Notes de crème, noix, bois léger. Mi-corsée, douce. L''hommage à Cuba sans nostalgie amère — un cigare élégant qui regarde vers l''avenir.')
WHERE `name` = 'Carlos Toraño Panama';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[1].story',
  'Corsée, hondurienne et nicaraguayenne, sous cape oscuro. Notes de café, poivre, sous-bois sombre. La gamme puissante, pour qui cherche l''intensité d''Amérique centrale. Le format Toro est celui que la maison recommande.')
WHERE `name` = 'Carlos Toraño Panama';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[2].story',
  'Cape Connecticut Shade, assemblage dominicain. Légère à mi-corsée. La face douce de la maison — accessible, régulière. L''entrée dans l''univers Toraño pour les débutants.')
WHERE `name` = 'Carlos Toraño Panama';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[1].story',
  'Créée pour le cinq-centième anniversaire de 1492. Les Sublimes EL et Pirámides comptent parmi les vitoles les plus rares de la maison, en éditions régionales dans certains pays seulement. La Línea 1492 est la Cohiba du luxe quotidien — corsée sans excès.')
WHERE `name` = 'Cohiba';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[3].story',
  'Lancée en 2007, première maduro de l''univers cubain. Cape maduro vieillie cinq ans en fûts supplémentaires, d''où une douceur paradoxale malgré la puissance. Notes de pruneaux, chocolat noir, café torréfié. Les habitués des cubains traditionnels ont été déstabilisés par cette douceur ; la gamme est aujourd''hui culte.')
WHERE `name` = 'Cohiba';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'Gamme d''entrée — cape Connecticut dominicaine sur assemblage hondurien et dominicain. Profil léger et crémeux, construit pour le quotidien américain. Aucun rapport de goût avec la gamme cubaine, malgré le nom identique.')
WHERE `name` = 'Cohiba USA';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[1].story',
  'La gamme haute américaine, sous cape Piloto Cubano de République dominicaine. Plus de corps, notes de cèdre et d''épices douces. Le Red Dot a longtemps été le cigare de prestige par défaut des steakhouses américains, des années 1990 aux années 2010.')
WHERE `name` = 'Cohiba USA';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'Le produit phare — cigarillo brésilien sous cape Bahia. Notes douces de miel, noix de cajou, cèdre léger. Format court (34 x 112mm), quinze minutes. Le cigare brésilien qu''on fume de São Paulo à Amsterdam en passant par les bars parisiens.')
WHERE `name` = 'Dannemann';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[3].story',
  'Cape oscuro d''Équateur sur dominicain. La gamme intermédiaire entre la finesse de la Signature et la puissance de la Nicaragua. Notes de noisette, café au lait, épices légères. C''est celle qu''on trouve le plus souvent dans les lounges européens — accessible, régulière, gratifiante.')
WHERE `name` = 'Davidoff';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'La gamme infusée qui a fait connaître la maison — arômes de thé, herbes botaniques, essence florale. Format Robusto (54 x 127mm). Cape d''Indonésie sur un assemblage que Drew Estate ne détaille pas. C''est le cigare qui a fait entrer dans le genre des fumeurs que la puissance des assemblages traditionnels aurait écartés. Contesté chez les puristes, adoré de ses amateurs.')
WHERE `name` = 'Drew Estate';
