-- ════════════════════════════════════════════════════════
-- 101 — Promotion vers le français, lot 1 sur 8
-- ────────────────────────────────────────────────────────
-- Sur 40 fiches, `history_en` n'est pas une traduction du français mais
-- un texte autonome, deux à sept fois plus long — 63 066 caractères que
-- cinq lecteurs sur six ne voient jamais (migration 099).
--
-- Décision prise : PROMOUVOIR vers le français, qui redevient la source.
-- Les quatre autres langues suivront, fiche par fiche.
--
-- Ce lot traite cinq fiches dont le français était un moignon d'environ
-- 300 caractères là où l'anglais en compte plus de 2 000 :
--
--   Oliva Connecticut Reserve   294 → 1 740
--   Arturo Fuente Maduro        300 → 2 121
--   Arturo Fuente Hemingway     314 → 1 804
--   CAO Cameroon                316 → 1 796
--   Ashton Cabinet              317 → 2 007
--
-- ── LE COMPTE MONTE AVANT DE DESCENDRE ──────────────────
--
-- `i18n_divergence` passe de 248 à 263 écarts de volume, et ce n'est pas
-- une régression : promouvoir une fiche RETIRE un écart en anglais et en
-- CRÉE quatre, en attente de traduction. -1 + 4 = +3 par fiche, cinq
-- fiches, +15.
--
-- Un problème caché devient quatre problèmes visibles. C'est le but.
-- Seul le détail par langue rend la campagne lisible — il a été ajouté
-- au rapport : l'anglais doit décroître de 40 vers 0, les quatre autres
-- monter puis redescendre.
--
-- ── CE QUE LA PROMOTION FILTRE AU PASSAGE ───────────────
--
-- Faire passer ce texte par le français, c'est le faire passer par les
-- contrôles. Trois choses n'ont pas été reprises :
--
--   « the best cigars on earth were grown an hour's drive from his desk »
--     (Hemingway) — un rang mondial. La distance, elle, se garde : les
--     plantations étaient bien à une heure de route de son bureau.
--
--   « the most technically demanding format in cigar production »
--     (le Perfecto) — un superlatif que personne ne mesure. Le texte dit
--     désormais ce qui est vérifiable : peu de manufactures le roulent
--     en série, et l'anglais explique lui-même pourquoi.
--
--   « Carlos Fuente Sr. REPORTEDLY conceived the range as a personal
--     project » et « equal to anything from Havana » — une intention
--     prêtée au conditionnel, puis une comparaison sans mesure. Même
--     motif que le « cigare que Sinatra aurait aimé fumer » retiré par
--     la migration 093.
--
--   « acknowledged as the finest manufacturer on the island » (Ashton
--     Cabinet) — reconnu par qui ? La phrase est retirée. « cigars of
--     absolute world-class quality » est en revanche gardé, mais rendu à
--     ce qu'il est : le PARI DE TAYLOR en 1985, attribué à lui, et non
--     un jugement que l'atlas porte à son compte.
--
-- Aucune des 40 fiches ne portait d'affirmation déjà au cliquet : les 29
-- rangs mondiaux de `brands` vivent dans les AUTRES fiches, celles dont
-- l'anglais est bien une traduction. Vérifié avant d'écrire.
--
-- ── LES QUATRE COLONNES TRADUITES NE BOUGENT PAS ────────
--
-- Elles restent la traduction de l'ancien français court, et deviennent
-- donc périmées — c'est exact et c'est voulu. `i18n_fraicheur` les
-- signalera, et elles ne seront PAS rescellées : sceller déclarerait
-- « à jour » sans rien retraduire, ce qui est précisément le mensonge
-- que la migration 095 a mis au jour.
-- ════════════════════════════════════════════════════════

-- ── Oliva Connecticut Reserve ───────────────────────────
UPDATE `brands` SET `history` =
'On tient d''ordinaire Oliva pour une maison de puissance. La Serie V, les Master Blends, le Melanio : des cigares construits sur l''intensité nicaraguayenne, ce profil terreux et poivré qui a fait la réputation de la vallée de Jalapa. En lançant une Connecticut Reserve, la maison entrait sur un terrain que beaucoup jugeaient étranger à son savoir-faire.

Le résultat a montré que ce jugement était incomplet. La Connecticut Reserve porte une cape Connecticut Shade d''Équateur, cultivée en altitude dans les Andes — des conditions qui donnent une feuille de plus de caractère que le Connecticut américain, sans lui retirer l''onctuosité qui définit le style de l''ombrière. Cette cape, issue des mêmes plantations qui approvisionnent plusieurs gammes Davidoff, recouvre une tripe nicaraguayenne plus légère que tout ce que compte le catalogue Oliva.

Ce qu''Oliva apporte à cette formule tient à la précision de son approvisionnement. La maison possède ses plantations nicaraguayennes en propre — les parcelles de Jalapa et d''Estelí qui alimentent tout le catalogue. Elle peut donc prélever, dans son propre stock, des feuilles plus légères et récoltées plus tôt, inutilisables pour la Serie V mais exactement calibrées pour un assemblage moyen-léger. Il en sort un cigare qui offre une vraie complexité — crème, céréales grillées, vanille, cèdre léger — sans le poids qui écraserait un cigare du matin ou le premier de la soirée.

La Connecticut Reserve a mis à mal l''idée qu''une maison nicaraguayenne ne saurait produire que de l''intensité. Elle a aussi fait connaître le nom d''Oliva à des fumeurs qui évitaient le catalogue entier sur la foi de sa réputation. La gamme a tenu sa ligne d''une boîte à l''autre, ce qui était précisément le pari.'
WHERE `name` = 'Oliva Connecticut Reserve';

-- ── Arturo Fuente Hemingway ─────────────────────────────
UPDATE `brands` SET `history` =
'Ernest Hemingway et le tabac cubain ont occupé le même monde pendant l''essentiel de la vie adulte de l''écrivain. Il a vécu à Cuba de 1939 à 1960 — la plus longue période qu''il ait passée au même endroit — et sa finca, aux portes de La Havane, fut le centre de son travail littéraire et de ses expéditions de pêche. L''homme qui écrivit Le Vieil Homme et la Mer le fit dans un pays où le tabac était à la fois une industrie et un rituel, et où les plantations se trouvaient à une heure de route de son bureau.

L''hommage d''Arturo Fuente à cette relation repose sur un format que Hemingway n''a jamais fumé, mais qui incarne le métier qu''il aurait su reconnaître : le Perfecto. Effilé aux deux bouts — tête et pied —, c''est un format que peu de manufactures roulent en série. Rouler un parejo classique est déjà difficile ; un Perfecto demande au torcedor de tenir une symétrie parfaite sur deux extrémités qui s''affinent, tout en maintenant une densité constante d''un bout à l''autre. Le tirage doit rester facile malgré le diamètre variable, la combustion régulière malgré la complexité de la structure. Celle d''Arturo Fuente, en République dominicaine, le fait couramment.

La cape est camerounaise — un choix cohérent avec les ambitions de complexité de la gamme. La feuille du Cameroun sur un assemblage dominicain donne un profil d''une finesse inhabituelle : noix de cajou et crème sur le premier tiers, puis café léger et cèdre, vers une finale de poivre doux et de miel. La force moyenne rend la gamme abordable sans sacrifier la complexité qui justifie le nom de Hemingway.

Outre le Perfecto emblématique, la gamme compte plusieurs modules — le Short Story, le Work of Art, le Classic —, chacun déclinant le même principe : la construction comme fin en soi, la difficulté mise au service du plaisir.'
WHERE `name` = 'Arturo Fuente Hemingway';

-- ── CAO Cameroon ────────────────────────────────────────
UPDATE `brands` SET `history` =
'L''histoire du tabac camerounais dans le cigare premium est d''abord celle d''une découverte retardée par la géographie. La province du Centre — sols équatoriaux, humidité constante, températures qui varient à peine d''un mois à l''autre — produit une cape que rien de ce qui pousse aux Amériques ne reproduit. Elle est plus sombre que le Connecticut Shade, plus complexe de structure, et porte une teneur naturelle en huiles qui la rend reconnaissable à l''œil et puissante au nez dès la coupe.

CAO fut l''une des premières maisons américaines à bâtir une gamme entière sur ce terroir. La gamme Cameroon emploie la cape AVO XO — une sélection précise de la province du Centre, qui représente le haut du panier de la feuille camerounaise arrivant sur le marché américain. Sa complexité s''impose d''emblée : un caractère cacaoté prononcé, entre chocolat au lait et chocolat noir, doublé d''une douceur naturelle qui contredit l''épice de l''assemblage au lieu de l''amplifier.

Sous cette cape, la tripe associe des tabacs dominicains et brésiliens choisis pour accompagner la feuille plutôt que lui disputer la place. Il en résulte un cigare qui ouvre sur le chocolat et un poivre doux, évolue vers le café et la cerise séchée, et s''achève sur une longue note de cèdre légèrement sucrée — une démonstration de ce qu''une cape bien choisie peut faire d''un assemblage par ailleurs classique.

Le tabac camerounais a gagné l''attention du marché premium en partie grâce à CAO, en partie par son emploi dans la série Millennium de Davidoff. Quand les grandes manufactures se sont mises à en acheter massivement, l''offre disponible s''est resserrée. La position de pionnier de CAO lui vaut, auprès des producteurs d''Afrique centrale, une relation d''approvisionnement que les entrants plus récents peinent à établir.'
WHERE `name` = 'CAO Cameroon';

-- ── Arturo Fuente Maduro ────────────────────────────────
UPDATE `brands` SET `history` =
'La cape maduro est la transformation la plus radicale que subisse le tabac. Une feuille déjà retenue pour sa finesse, sa couleur régulière et sa tenue passe par une fermentation prolongée — des mois, parfois des années — qui convertit ses sucres naturels, sous chaleur et humidité contrôlées, en composés complexes. La feuille fonce du brun au presque noir. Sa surface devient huileuse. Et elle acquiert une douceur naturelle — ni ajoutée ni artificielle, mais produite par cette transformation cellulaire prolongée — qui change en profondeur le caractère de tout cigare qu''elle enveloppe.

L''approche d''Arturo Fuente en la matière fut délibérée, et géographiquement précise. Plutôt que le Connecticut broadleaf, source américaine habituelle du maduro, la famille a choisi des tabacs brésiliens de Bahia et d''Arapiraca — des régions où les sols rouges profonds, l''humidité équatoriale et des siècles de culture donnent des feuilles naturellement sombres, un peu épaisses, qui fermentent avec une régularité inhabituelle. La cape maduro brésilienne est reconnue pour un caractère chocolaté particulier, quelque part entre le cacao en poudre et la ganache noire, que le Connecticut broadleaf atteint rarement.

Posée sur l''assemblage dominicain que la famille Fuente affine depuis quatre générations, cette cape brésilienne crée un profil de contraste saisissant. L''assemblage Fuente est connu pour son élégance — cèdre, crème de café, épice discrète — et la cape maduro y ajoute une couche de douceur sombre qui approfondit sans écraser. Il en résulte des notes d''expresso chocolaté, de figue sèche, et une longue finale de cacao noir qui se prolonge bien après la dernière bouffée.

La gamme existe en tension féconde avec l''Opus X, au sommet du catalogue Fuente. Là où l''Opus X est la maison à son intensité maximale — pleine puissance dominicaine, cape dominicaine, exigeant et hors norme —, le Maduro propose un raisonnement parallèle : le tabac brésilien, sur la même base dominicaine, peut produire une complexité d''une tout autre nature, bâtie sur la douceur et la profondeur plutôt que sur la puissance et l''épice.'
WHERE `name` = 'Arturo Fuente Maduro';

-- ── Ashton Cabinet ──────────────────────────────────────
UPDATE `brands` SET `history` =
'William Ashton Taylor fonda Ashton Cigars à Philadelphie en 1985, sur une idée qui paraît simple aujourd''hui mais qui ne l''était pas alors : avec le bon approvisionnement en tabac et le bon partenaire de fabrication, la République dominicaine pouvait produire des cigares du plus haut niveau. Le partenaire qu''il choisit fut Arturo Fuente — la maison familiale qui venait de rebâtir sa réputation dans l''île après l''incendie de son usine, en 1980.

La Cabinet Selection est celle qui valide le plus complètement ce pari. Ce n''est pas seulement un cigare haut de gamme : c''est un cigare qui subit un vieillissement supplémentaire, conçu pour répondre à ce que Taylor tenait pour le principal manque d''une production dominicaine par ailleurs excellente — le temps.

Après roulage, les Cabinet Selection sont placés dans des caisses de cèdre espagnol — non pas le cèdre décoratif des emballages courants, mais du cèdre de structure, de celui qu''on emploie traditionnellement pour le vieillissement des vins et spiritueux espagnols — et laissés là de douze à vingt-quatre mois avant leur sortie. Pendant cette période, les tabacs continuent de fermenter dans un milieu contrôlé qui adoucit ce qu''il restait d''âpreté et laisse les composantes de l''assemblage s''harmoniser. Les caisses apportent leur propre caractère : le transfert lent des huiles résineuses du cèdre, sur des mois de contact, influe sur la cape et les feuilles extérieures d''une manière que le vieillissement ordinaire ne reproduit pas.

Le résultat est un cigare d''une tenue remarquable. La cape Connecticut Shade — équatorienne, comme la plupart des capes de ce style aujourd''hui — donne dès les premières bouffées des notes de noisette et de miel de montagne. La tripe dominicaine, bâtie sur la recette personnelle de Carlos Fuente Sr., évolue vers le cèdre blanc et les fruits secs avant une finale d''une longueur et d''une netteté inhabituelles. Aucune aspérité. À aucun moment le cigare ne demande au fumeur autre chose que de l''attention.'
WHERE `name` = 'Ashton Cabinet';
