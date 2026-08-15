-- ════════════════════════════════════════════════════════
-- 024 — Vingt-cinq maisons que l'atlas ignorait
-- ────────────────────────────────────────────────────────
-- La migration 022 avait comblé Cuba. Le reste du continent restait
-- maigre : le Nicaragua, premier producteur premium du monde en volume,
-- n'affichait que dix noms, et A.J. FERNANDEZ n'en faisait pas partie —
-- l'un des rouleurs les plus demandés de sa génération, absent de la
-- fiche de son propre pays. C'est ce trou qui a déclenché cette revue.
--
--   NICARAGUA (6) — A.J. Fernandez, Aganorsa Leaf, Tatuaje, Illusione,
--   Foundation, Mombacho. Trois d'entre elles ne roulent pas elles-mêmes
--   ou pas seulement : c'est le propre de ce pays, où la frontière entre
--   planteur, manufacture et marque est plus poreuse qu'ailleurs.
--
--   RÉP. DOMINICAINE (5) — E.P. Carrillo, Quesada, PDR, et les versions
--   dominicaines de Montecristo et Romeo y Julieta.
--
--   HONDURAS (6) — Flor de Selva, La Flor de Copán, Aladino, Baccarat,
--   et les Hoyo de Monterrey et Punch honduriens.
--
--   MEXIQUE (2), BRÉSIL (2), PHILIPPINES (1), ÉTATS-UNIS (1),
--   CAMEROUN (1), INDONÉSIE (1) — ces fiches tenaient en une ou deux
--   lignes. Le Cameroun et l'Indonésie gagnent surtout leur PREMIÈRE
--   maison en propre : jusqu'ici ils n'affichaient que des cigares
--   habillés de leur cape, ou des marques néerlandaises.
--
-- ── Le même nom, deux maisons, deux pays ────────────────
--
-- Punch, Hoyo de Monterrey, Montecristo et Romeo y Julieta existent en
-- version cubaine ET non cubaine, séparées par la nationalisation de
-- 1960 : à Cuba la marque est restée, hors de Cuba les propriétaires
-- l'ont reprise ailleurs. Ce sont deux cigares différents sous un même
-- nom, et l'atlas doit le dire.
--
-- La fiche du Honduras listait « Punch » tout court. Le lien menait donc
-- à l'article CUBAIN : le lecteur venu du Honduras lisait l'histoire
-- d'une autre maison sans le savoir. On renomme l'entrée en « Punch
-- Honduras » et on lui écrit son article, sur le modèle des entrées
-- américaines déjà en place (Cohiba USA, Partagás USA).
--
-- ── Ce que ces articles contiennent, et ce qu'ils ne contiennent pas ──
--
-- Histoire, gamme de deux vitoles, accords : oui.
-- Notes chiffrées, célébrités, éditions limitées : NON, comme en 022.
--
-- ⚠ RELECTURE. Le texte vient des connaissances du rédacteur. Les
-- maisons du Nicaragua, de Rép. dominicaine, du Honduras et du Mexique
-- sont largement documentées ; SUERDIECK, ALHAMBRA, TARU MARTANI et
-- MEERAPFEL le sont beaucoup moins, et leurs dates de fondation sont
-- écrites au conditionnel dans le texte plutôt que données pour
-- acquises. Quatre maisons à vérifier en priorité avant mise en ligne.
--
-- Les descriptions courtes sont traduites dans les cinq autres langues
-- par le dictionnaire (`content_translations`) — voir sql/traductions.sql.
--
-- Rejouable : chaque insertion vérifie d'abord l'absence du nom.
-- ════════════════════════════════════════════════════════

-- ── 1. Les articles ─────────────────────────────────────

-- ...................... NICARAGUA ......................

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'A.J. Fernandez', 'nicaragua', 'Années 2000 — Estelí, Nicaragua',
         'Abdel J. Fernández est arrivé à Estelí avec un savoir-faire de famille et sans marque à défendre : son grand-père cultivait le tabac à Cuba, et lui a commencé par rouler pour les autres. C\'est une position singulière dans ce métier. Pendant des années, des marques réputées ont vendu des cigares sortis de sa manufacture sans que son nom figure sur la bague — et le milieu, lui, savait.

Cette réputation d\'assembleur s\'est bâtie sur une méthode plus que sur un style : Fernández travaille en cherchant l\'équilibre d\'un mélange plutôt que sa force, et il a été l\'un des premiers à ramener massivement la cape mexicaine de San Andrés dans des assemblages nicaraguayens, à une époque où ce tabac passait pour rustique. Le résultat — sombre, sucré, épais en fumée — a fait école au point qu\'on ne compte plus les maisons qui l\'ont suivi.

Ses propres marques sont venues ensuite, et tard : New World, Bellas Artes, Enclave. Elles n\'ont pas eu à se faire connaître, elles ont hérité d\'une réputation déjà constituée. La maison cultive aujourd\'hui ses propres champs autour d\'Estelí, ce qui la place dans la catégorie rare des producteurs qui maîtrisent la chaîne entière, du plant à la bague.',
         '[{"name":"New World","color":"#5C4033","force":"Full","wrapper":"San Andrés Maduro","vitolas":["Robusto","Toro"],"story":"L\'assemblage qui a fait connaître la maison sous son propre nom. Cape mexicaine sombre, fumée épaisse, notes de café brûlé et de poivre noir — puissant sans être agressif, ce qui est précisément la signature de la maison."},{"name":"Bellas Artes","color":"#8B6914","force":"Medium","wrapper":"Habano Rosado","vitolas":["Toro"],"story":"Le registre médium de la maison, plus boisé et plus sec. Celui qu\'on donne à qui trouve New World trop dense, et qui montre que la force n\'a jamais été le sujet."}]',
         '[{"type":"Spiritueux","name":"Rhum nicaraguayen vieilli en fût","notes":"Un accord de terroir : les mêmes sols volcaniques, les mêmes notes de sucre brûlé."},{"type":"Café","name":"Café d\'Estelí","notes":"Torréfaction moyenne : elle répond au café brûlé de la fumée sans surenchérir."}]', 'Tabacalera Fernández, Estelí, Nicaragua'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'A.J. Fernandez');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Aganorsa Leaf', 'nicaragua', '1998 — Jalapa et Estelí, Nicaragua',
         'Il y a une bonne chance que vous ayez déjà fumé du tabac Aganorsa sans le savoir. Eduardo Fernández a fondé une société agricole — Agrícola Ganadera Norteña — avant de fonder une marque, et c\'est l\'ordre inverse de tout le reste du métier. La maison est d\'abord un planteur, dans la vallée de Jalapa et autour d\'Estelí, et son tabac se retrouve dans les assemblages de dizaines de maisons qui n\'ont pas de champs à elles.

Ce statut lui donne une place à part dans l\'atlas : elle représente ce que le Nicaragua a de plus rare, non pas une manufacture de plus, mais la matière première elle-même. Les semences cubaines replantées ici — corojo 99, criollo 98 — sont devenues la référence du goût nicaraguayen moderne, cette combinaison de puissance franche et de sucrosité que le pays a imposée face au havane.

La maison a longtemps vendu ses propres cigares sous le nom de Casa Fernandez avant de prendre celui de sa société agricole. Le changement dit bien ce qu\'elle revendique : ce n\'est pas la marque qui garantit le cigare, c\'est la feuille.',
         '[{"name":"Aganorsa Leaf Original","color":"#7B3F00","force":"Full","wrapper":"Corojo 99","vitolas":["Robusto"],"story":"Cent pour cent tabac maison, de la tripe à la cape. C\'est l\'argument entier de la marque : goûter le terroir de Jalapa sans intermédiaire, en pleine force."},{"name":"Signature Selection","color":"#A0522D","force":"Medium","wrapper":"Corojo 99","vitolas":["Toro"],"story":"Le même tabac dans un assemblage plus retenu, où le sucré de la feuille passe devant la puissance. Le meilleur point d\'entrée dans le style de la maison."}]',
         '[{"type":"Spiritueux","name":"Rhum ambré peu sucré","notes":"La sucrosité naturelle du corojo n\'a pas besoin qu\'on en rajoute."},{"type":"Autre","name":"Chocolat noir 70 %","notes":"L\'amertume du cacao fait ressortir le végétal de la feuille de Jalapa."}]', 'Tabacos Valle de Jalapa, Estelí, Nicaragua'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Aganorsa Leaf');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Tatuaje', 'nicaragua', '2003 — Estelí, Nicaragua',
         'Tatuaje est née d\'une rencontre entre un Californien passionné et une famille cubaine de rouleurs. Pete Johnson vendait des cigares dans une boutique de Los Angeles quand il a convaincu José Pepín García, qui roulait alors à Miami, de lui composer un assemblage. Le premier Tatuaje sortait d\'un atelier minuscule ; la production a suivi les García jusqu\'à Estelí, où leur manufacture est devenue l\'une des plus réputées du pays.

La marque a compté parce qu\'elle est arrivée au bon moment avec la bonne idée : un cigare fait selon les méthodes cubaines, avec du tabac nicaraguayen, vendu à un fumeur américain qui n\'avait pas accès au havane. Elle n\'imite pas le cubain, elle en reprend la grammaire — les formats, la construction, le rythme de combustion — et la remplit d\'une matière plus franche.

Le nom veut dire tatouage, et le fondateur en porte. C\'est une marque qui a assumé très tôt une esthétique personnelle, à contre-courant d\'un métier alors très attaché aux blasons et aux couronnes. Une partie de l\'attachement qu\'elle suscite tient à cela : on sait qui est derrière.',
         '[{"name":"Brown Label","color":"#6B4423","force":"Full","wrapper":"Habano de Ecuador","vitolas":["Robusto","Corona"],"story":"La série d\'origine, celle qui porte la marque depuis 2003. Grammaire cubaine, matière nicaraguayenne : poivre, cuir, une combustion lente et régulière qui doit tout au roulage des García."},{"name":"Havana VI","color":"#B87333","force":"Medium","wrapper":"Corojo","vitolas":["Corona Gorda"],"story":"Le registre plus doux de la maison, pensé pour la journée plutôt que pour la soirée. Moins de poivre, plus de bois et de pain grillé."}]',
         '[{"type":"Spiritueux","name":"Whisky de seigle","notes":"L\'épice du seigle rejoint le poivre de l\'assemblage plutôt que de le contredire."},{"type":"Café","name":"Café cubain","notes":"Court, serré, sucré : le contrepoint traditionnel du profil que la marque revendique."}]', 'My Father Cigars, Estelí, Nicaragua'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Tatuaje');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Illusione', 'nicaragua', '2006 — Jalapa, Nicaragua',
         'Dion Giolito tenait une boutique dans le Nevada et trouvait que les cigares de son temps allaient tous dans la même direction : plus forts, plus gros, plus sucrés. Illusione est née de ce désaccord. La marque cherche un profil qu\'elle appelle volontiers d\'avant — sec, boisé, épicé, sans la rondeur sucrée devenue la norme nicaraguayenne — et le trouve dans les tabacs de la vallée de Jalapa, plus fine et plus nerveuse que celle d\'Estelí.

Les bagues de la maison sont couvertes de symboles, de chiffres et de références ésotériques, et les noms de ses cigares sont souvent des nombres. C\'est un jeu, mais un jeu cohérent avec le propos : la marque s\'adresse à des fumeurs qui lisent les bagues, comparent les formats et discutent les assemblages.

Elle a durablement modifié le paysage sur un point précis : elle a rendu respectable le petit format. À une époque où le marché montait en diamètre, Illusione a défendu les coronas et les lanceros, en soutenant qu\'un cigare fin concentre l\'assemblage au lieu de le diluer.',
         '[{"name":"Epernay","color":"#C2B280","force":"Medium","wrapper":"Corojo de Jalapa","vitolas":["Corona","Robusto"],"story":"Le versant crémeux de la maison, nommé d\'après la ville du champagne. Pain grillé, beurre, foin — un cigare de milieu de journée que sa finesse rend plus long en bouche que son gabarit ne le laisse croire."},{"name":"Illusione Original Documents","color":"#8B7355","force":"Full","wrapper":"Corojo 99","vitolas":["Lancero"],"story":"Le format fin défendu par la marque, quand tout le marché montait en diamètre. Sec, poivré, sans concession : la démonstration que la finesse concentre au lieu de diluer."}]',
         '[{"type":"Spiritueux","name":"Champagne brut","notes":"Le nom n\'est pas un hasard : les bulles nettoient le gras et relancent le pain grillé."},{"type":"Autre","name":"Thé noir fumé","notes":"Le végétal du thé prolonge la sécheresse de Jalapa, là où un alcool sucré l\'écraserait."}]', 'Tabacos Valle de Jalapa, Nicaragua'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Illusione');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Foundation Cigar Company', 'nicaragua', '2015 — Estelí, Nicaragua',
         'Nicholas Melillo a passé une dizaine d\'années à choisir le tabac d\'une des grandes maisons d\'Estelí avant de fonder la sienne. C\'est un parcours qui explique le positionnement de Foundation : la marque ne se présente pas comme une aventure de collectionneur mais comme le travail d\'un homme qui connaît les champs, les récoltes et les fermentations depuis l\'intérieur.

El Güegüense, son assemblage fondateur, porte le nom d\'une pièce de théâtre populaire nicaraguayenne, satire coloniale transmise oralement pendant des siècles et inscrite au patrimoine immatériel de l\'humanité. Le choix dit quelque chose de l\'ambition de la maison : ancrer un cigare dans une culture, pas seulement dans un terroir.

Charter Oak, l\'autre gamme, part de l\'autre bout — la vallée du Connecticut, où Melillo a grandi et où pousse la cape américaine la plus utilisée du métier. Une maison nicaraguayenne qui revendique une racine du nord : c\'est rare, et c\'est assumé.',
         '[{"name":"El Güegüense","color":"#8B4513","force":"Medium","wrapper":"Corojo 99 de Jalapa","vitolas":["Corona Gorda","Toro"],"story":"L\'assemblage fondateur, nommé d\'après une satire coloniale transmise oralement pendant des siècles. Bois, cuir, une pointe de sucre roux, et une évolution nette entre le premier et le dernier tiers."},{"name":"Charter Oak","color":"#3B2F2F","force":"Medium","wrapper":"Connecticut Broadleaf","vitolas":["Robusto"],"story":"La racine nord de la maison : cape du Connecticut sur tripe nicaraguayenne. Sombre, terreux, sans amertume — et volontairement placé dans une gamme de prix accessible."}]',
         '[{"type":"Spiritueux","name":"Rhum vieux d\'Amérique centrale","notes":"Le sucre roux de l\'assemblage y trouve un prolongement direct."},{"type":"Autre","name":"Cidre fermier sec","notes":"Sur Charter Oak, l\'acidité du cidre allège le terreux de la cape broadleaf."}]', 'Tabacalera AJ Fernandez, Estelí, Nicaragua'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Foundation Cigar Company');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Mombacho', 'nicaragua', 'Années 2000 — Granada, Nicaragua',
         'Presque toutes les manufactures nicaraguayennes sont à Estelí, dans le nord tabacole. Mombacho a fait le choix inverse et s\'est installée à Granada, ville coloniale au bord du lac Nicaragua, au pied du volcan qui lui donne son nom. Ce n\'est pas un détail de géographie : la maison roule là où passent les voyageurs, dans une demeure ancienne ouverte aux visiteurs, et a fait de cette accessibilité une partie de son propos.

Le tabac, lui, vient du nord comme celui des autres — il n\'y a pas de terroir tabacole autour de Granada. Ce que la maison revendique est ailleurs : des séries courtes, une manufacture à taille humaine, et une relation directe entre le fumeur et l\'atelier, à rebours d\'un métier où l\'on ne visite presque jamais l\'endroit où le cigare est né.

C\'est, dans l\'atlas, l\'exemple le plus net d\'une maison dont l\'intérêt tient autant au lieu qu\'au produit.',
         '[{"name":"Liga Maestro","color":"#6F4E37","force":"Full","wrapper":"Habano de Jalapa","vitolas":["Robusto"],"story":"La gamme haute de la maison, en séries courtes. Corsé, terreux, avec la densité que permettent des volumes de production réduits."},{"name":"Cosecha","color":"#A67B5B","force":"Medium","wrapper":"Habano","vitolas":["Toro"],"story":"Un assemblage millésimé, qui change avec la récolte. L\'inverse exact de la constance industrielle — et c\'est le sujet."}]',
         '[{"type":"Spiritueux","name":"Rhum de Granada","notes":"Accord local au sens strict : la ville, le lac, le volcan et le fût."},{"type":"Café","name":"Café d\'altitude nicaraguayen","notes":"L\'acidité d\'un café d\'altitude relève la terre de la tripe."}]', 'Casa Favilli, Granada, Nicaragua'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Mombacho');

-- .................. RÉP. DOMINICAINE ...................

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'E.P. Carrillo', 'dominican', '2009 — Santiago, Rép. dominicaine',
         'Ernesto Perez-Carrillo avait déjà fait une carrière entière quand il a fondé la maison qui porte ses initiales. Né à Cuba, il avait repris à Miami la petite fabrique familiale, El Crédito, et y avait relancé une marque endormie : La Gloria Cubana. Le succès fut tel que la production, partie d\'un atelier de la Petite Havane, dut être transférée en République dominicaine, et que le groupe General Cigar racheta l\'ensemble à la fin des années 1990.

Il aurait pu s\'arrêter là. À soixante ans passés, il a quitté le groupe et recommencé, avec ses deux enfants, dans une manufacture neuve de Santiago. C\'est un cas rare dans ce métier : un assembleur reconnu qui repart de zéro sans nom de marque à réutiliser, en pariant que sa signature suffira.

Le style de la maison est reconnaissable — un médium à corsé très construit, où l\'on sent le travail de proportions plus que la démonstration de force. La production reste modeste au regard des grands groupes, et c\'est délibéré.',
         '[{"name":"Encore","color":"#8B1A1A","force":"Full","wrapper":"Habano de Ecuador","vitolas":["Robusto","Toro"],"story":"Le nom est un clin d\'œil à une carrière recommencée. Assemblage dense et très construit, où la puissance sert la structure au lieu de la remplacer."},{"name":"New Wave Connecticut","color":"#D2B48C","force":"Light","wrapper":"Connecticut Shade","vitolas":["Corona"],"story":"Le versant doux de la maison : cape claire, registre matinal, crème et amande. La démonstration qu\'un assembleur connu pour le corsé sait aussi retenir sa main."}]',
         '[{"type":"Spiritueux","name":"Rhum dominicain vieux","notes":"Le fruit confit du rhum local répond à la densité d\'Encore."},{"type":"Café","name":"Café au lait","notes":"Sur la New Wave, un café allongé et lacté prolonge la crème sans la couvrir."}]', 'Tabacalera La Alianza, Santiago, Rép. dominicaine'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'E.P. Carrillo');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Quesada', 'dominican', '1974 — Santiago, Rép. dominicaine',
         'La famille Quesada fait du tabac depuis la fin du XIXe siècle, d\'abord à Cuba, puis en République dominicaine où elle s\'est installée dans les années 1970 — avant la vague qui a fait du pays la première destination du cigare premium. Cette antériorité compte : quand les grandes maisons sont arrivées, les Quesada étaient déjà là, avec leur manufacture de Santiago.

La maison a longtemps travaillé dans l\'ombre, produisant pour d\'autres marques autant que pour la sienne, et cultivant une discrétion qui contraste avec l\'exubérance commerciale du métier. Elle est aujourd\'hui dirigée par la génération suivante, et reste l\'une des rares grandes maisons dominicaines encore indépendantes et familiales.

Son style suit le tempérament dominicain classique : équilibre, souplesse, une élégance qui ne cherche pas l\'effet. Casa Magna, son assemblage le plus connu, fait exception en allant chercher le corsé nicaraguayen — une manière de montrer que la maison sait faire autre chose que ce qu\'on attend d\'elle.',
         '[{"name":"Casa Magna","color":"#7C3030","force":"Full","wrapper":"Habano de Nicaragua","vitolas":["Robusto"],"story":"L\'écart assumé d\'une maison dominicaine : tripe nicaraguayenne, force pleine, poivre et terre. L\'assemblage qui a fait connaître la famille au-delà de son pays."},{"name":"Quesada Reserva Privada","color":"#B5651D","force":"Medium","wrapper":"Connecticut Broadleaf","vitolas":["Corona Gorda"],"story":"Le style maison dans son registre habituel : équilibré, souple, sans démonstration. Un cigare qui se laisse oublier, au bon sens du terme."}]',
         '[{"type":"Spiritueux","name":"Brandy espagnol","notes":"La rondeur du brandy épouse l\'équilibre dominicain plutôt que de le bousculer."},{"type":"Café","name":"Café dominicain de Cibao","notes":"Cultivé dans la même vallée que la manufacture : l\'accord le plus court possible."}]', 'MATASA, Santiago, Rép. dominicaine'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Quesada');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'PDR Cigars', 'dominican', 'Années 2000 — Tamboril, Rép. dominicaine',
         'PDR — pour Pinar del Río, la région cubaine dont la famille fondatrice tire son origine — est installée à Tamboril, la ville qui roule sans doute le plus de cigares au monde par habitant. Abe Flores y a bâti une maison qui cultive, fermente et roule sur place, ce qui reste minoritaire même en République dominicaine où beaucoup de marques achètent leur tabac et sous-traitent l\'assemblage.

La maison s\'est fait connaître par un travail sur la fermentation — des procédés longs, poussés, qui donnent des cigares sombres et sucrés — et par une politique de prix qui l\'a rendue accessible là où ses concurrentes montaient en gamme.

Elle produit aussi pour d\'autres marques, comme presque toutes les manufactures de Tamboril. C\'est une réalité que l\'atlas doit dire : dans cette ville, la même paire de mains roule souvent plusieurs bagues.',
         '[{"name":"PDR 1878 Capa Oscura","color":"#4A3728","force":"Full","wrapper":"Habano Oscuro","vitolas":["Robusto"],"story":"Le travail de fermentation poussé qui a fait la réputation de la maison : cape très sombre, sucre brûlé, café, une douceur trompeuse sur un fond puissant."},{"name":"PDR Small Batch","color":"#9C6B4F","force":"Medium","wrapper":"Habano de Ecuador","vitolas":["Toro"],"story":"Séries courtes, assemblage plus clair et plus boisé. La face sobre d\'une maison connue pour ses capes noires."}]',
         '[{"type":"Spiritueux","name":"Rhum dominicain ambré","notes":"Le sucre brûlé de la cape oscura y trouve son écho exact."},{"type":"Autre","name":"Chocolat au lait","notes":"Un accord facile et juste sur les assemblages très fermentés."}]', 'Tamboril, Rép. dominicaine'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'PDR Cigars');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Montecristo Dominicain', 'dominican', 'Depuis 1960 — La Romana, Rép. dominicaine',
         'Il existe deux Montecristo, et beaucoup de fumeurs l\'ignorent. La marque, née à La Havane en 1935, a été nationalisée en 1960 ; ses propriétaires ont quitté l\'île et repris le nom hors de Cuba. Depuis, un Montecristo cubain et un Montecristo non cubain coexistent, vendus sur des marchés différents — le premier partout sauf aux États-Unis, le second aux États-Unis. Même nom, même bague ou presque, deux cigares sans rapport.

Le Montecristo non cubain est roulé à La Romana, dans la plus grande manufacture de cigares premium du monde. L\'échelle change tout : là où une maison boutique produit quelques centaines de milliers de cigares par an, cette usine en compte des dizaines de millions, avec une régularité de fabrication qui est en soi une prouesse technique.

Le profil suit la tradition dominicaine — doux à médium, crémeux, cape claire — là où le cubain est plus corsé et plus terreux. Ce n\'est pas une copie manquée : c\'est une autre lecture du même nom, faite pour un autre palais.',
         '[{"name":"Montecristo Classic","color":"#D9C7A7","force":"Light","wrapper":"Connecticut Shade","vitolas":["Robusto","Toro"],"story":"Cape claire du Connecticut, tripe dominicaine : crème, amande, cèdre. Le profil doux qui a fait la réputation du cigare dominicain aux États-Unis."},{"name":"Montecristo White","color":"#EFE6D5","force":"Light","wrapper":"Connecticut Shade Ecuador","vitolas":["Corona"],"story":"Encore plus doux, presque lacté. Le cigare du matin, ou celui qu\'on tend à quelqu\'un qui commence."}]',
         '[{"type":"Café","name":"Café filtre doux","notes":"Un café léger ne couvre pas la crème et la laisse s\'installer."},{"type":"Spiritueux","name":"Rhum blanc agricole","notes":"Sa nervosité végétale évite l\'effet mou que produit un rhum sucré sur un cigare déjà doux."}]', 'Tabacalera de García, La Romana, Rép. dominicaine'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Montecristo Dominicain');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Romeo y Julieta Dominicain', 'dominican', 'Depuis 1960 — La Romana, Rép. dominicaine',
         'Comme Montecristo, comme Punch, comme Hoyo de Monterrey, Romeo y Julieta est un nom coupé en deux par 1960. La marque cubaine est restée à La Havane ; le nom, hors de Cuba, a été repris par ses anciens propriétaires et se fabrique aujourd\'hui en République dominicaine, dans la même immense manufacture de La Romana.

La version dominicaine s\'est éloignée du modèle cubain plus franchement que d\'autres. Là où le havane du même nom cultive un profil médium et floral, le dominicain a exploré des registres variés au fil des décennies, du très doux au corsé, en multipliant les gammes. C\'est le privilège — et le risque — d\'un nom sans continuité de recette.

Le shakespearien de la bague, lui, est resté des deux côtés : l\'histoire d\'amour véronaise ornait déjà les caisses au XIXe siècle, bien avant que la politique ne sépare la marque en deux.',
         '[{"name":"Romeo y Julieta Reserva Real","color":"#C68642","force":"Medium","wrapper":"Connecticut Shade Ecuador","vitolas":["Robusto"],"story":"Le registre médium de la maison dominicaine : cèdre, noisette, une douceur qui reste tenue. La proposition la plus proche de ce que le nom évoque."},{"name":"Romeo 505 Nicaragua","color":"#7B3F00","force":"Full","wrapper":"Habano de Nicaragua","vitolas":["Toro"],"story":"L\'écart le plus net avec le modèle cubain : tripe nicaraguayenne, poivre et terre. Un cigare que rien ne rattache au havane du même nom, sinon la bague."}]',
         '[{"type":"Spiritueux","name":"Porto tawny","notes":"Le fruit cuit du tawny suit la noisette de la Reserva Real."},{"type":"Café","name":"Expresso","notes":"Sur le 505, la torréfaction tient tête au poivre nicaraguayen."}]', 'Tabacalera de García, La Romana, Rép. dominicaine'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Romeo y Julieta Dominicain');

-- ....................... HONDURAS ......................

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Flor de Selva', 'honduras', '1995 — Danlí, Honduras',
         'Maya Selva est hondurienne, ingénieure de formation, et a fondé sa maison depuis Paris — configuration inhabituelle dans un métier où l\'on part rarement d\'Europe pour produire en Amérique centrale. Flor de Selva s\'est construite d\'emblée pour le marché français et européen, avec un profil pensé pour un palais habitué au havane : médium, boisé, sans l\'exubérance sucrée que le marché américain appréciait alors.

La maison est installée à Danlí, dans la vallée du Jamastran, l\'une des deux grandes régions tabacoles honduriennes. Elle y travaille en séries mesurées et revendique une continuité de recette rare — les assemblages bougent peu d\'une année à l\'autre, ce qui, pour un produit agricole, demande un travail constant sur la sélection.

C\'est aussi l\'une des très rares maisons de cigares fondées et dirigées par une femme, dans un métier qui l\'est presque exclusivement par des hommes. Le fait mérite d\'être noté sans en faire un argument : la marque, elle, s\'est imposée sur ses assemblages.',
         '[{"name":"Flor de Selva Classique","color":"#8B7D6B","force":"Medium","wrapper":"Habano du Honduras","vitolas":["Corona","Robusto"],"story":"Le cœur de la maison, composé pour un palais européen : bois sec, foin, une pointe de cuir, et une constance d\'une année sur l\'autre qui est en soi un travail."},{"name":"Cumpay","color":"#5D4037","force":"Full","wrapper":"Habano Maduro","vitolas":["Toro"],"story":"Le versant corsé, plus sombre et plus terreux, où la maison montre ce que le Jamastran peut donner en puissance."}]',
         '[{"type":"Spiritueux","name":"Armagnac","notes":"Le rancio de l\'armagnac s\'accorde au bois sec mieux qu\'un cognac plus fruité."},{"type":"Café","name":"Café hondurien","notes":"Accord de pays : le Honduras est autant un pays de café que de tabac."}]', 'Danlí, vallée du Jamastran, Honduras'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Flor de Selva');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'La Flor de Copán', 'honduras', 'Santa Rosa de Copán, Honduras',
         'Santa Rosa de Copán roule du tabac depuis l\'époque coloniale : la ville doit son développement à une manufacture royale, et son centre historique s\'est bâti autour. Peu de lieux du continent peuvent revendiquer une continuité aussi longue entre une ville et une culture.

La manufacture actuelle perpétue ce lien. Elle roule des cigares destinés pour l\'essentiel au marché européen, avec un profil hondurien classique — plus terreux que le nicaraguayen, plus corsé que le dominicain — et une régularité de fabrication qui tient à l\'expérience accumulée d\'une main-d\'œuvre locale formée sur place depuis des générations.

C\'est, dans l\'atlas, un cas où le lieu prime sur la marque : on visite Santa Rosa de Copán pour l\'usine autant que pour la ville, et le musée du tabac y raconte une histoire que peu de fiches pays peuvent proposer.',
         '[{"name":"La Flor de Copán Classic","color":"#8B5A2B","force":"Medium","wrapper":"Habano du Honduras","vitolas":["Corona","Robusto"],"story":"Le profil hondurien tel qu\'on l\'attend : terre, bois, cuir, une combustion franche. Un cigare de tous les jours dans le meilleur sens du terme."},{"name":"Reserva","color":"#6B4226","force":"Full","wrapper":"Habano Maduro","vitolas":["Toro"],"story":"Tabacs plus longuement vieillis, cape plus sombre, davantage de cacao et de café. La montée en gamme de la maison, sans changement de style."}]',
         '[{"type":"Café","name":"Café de Copán","notes":"La région produit l\'un des meilleurs cafés du pays : l\'accord se fait à quelques kilomètres près."},{"type":"Spiritueux","name":"Rhum hondurien","notes":"Sucre de canne et terre : deux registres qui se tiennent."}]', 'Santa Rosa de Copán, Honduras'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'La Flor de Copán');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Aladino', 'honduras', '2016 — Danlí, Honduras',
         'Julio Eiroa cultive du corojo depuis les années 1960. Il a été l\'homme derrière une grande maison hondurienne qu\'il a vendue au début des années 2000, et il est revenu, avec son fils Justo, pour faire exactement ce qu\'il voulait : un cigare entièrement composé de corojo cultivé sur ses propres terres du Jamastran.

Le corojo est une semence cubaine d\'avant les hybrides modernes, réputée difficile — rendements faibles, sensibilité aux maladies — et abandonnée par la plupart des planteurs au profit de variétés plus dociles. En continuer la culture est un choix coûteux, et c\'est tout l\'argument de la maison : Aladino se présente comme un cigare d\'avant, au sens agricole du terme.

Le nom vient du cinéma de Danlí, que la famille a restauré. C\'est une marque récente qui parle beaucoup du passé — mais avec, pour une fois, des champs pour l\'appuyer.',
         '[{"name":"Aladino Corojo","color":"#8B4513","force":"Medium","wrapper":"Corojo authentique","vitolas":["Corona","Robusto"],"story":"Cent pour cent corojo cultivé par la famille : une semence d\'avant les hybrides, difficile et peu rentable. Fruits secs, bois, cuir, avec une acidité fine que les variétés modernes ont perdue."},{"name":"Aladino Maduro","color":"#3E2723","force":"Full","wrapper":"Corojo Maduro","vitolas":["Toro"],"story":"Le même tabac, cape fermentée plus longtemps. Cacao et café noir, sans le sucre appuyé des maduros nicaraguayens."}]',
         '[{"type":"Spiritueux","name":"Rhum sec vieilli","notes":"Un rhum peu sucré laisse l\'acidité du corojo intacte."},{"type":"Café","name":"Café noir sans sucre","notes":"Le maduro appelle l\'amertume plutôt que la douceur."}]', 'JRE Tobacco, Danlí, Honduras'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Aladino');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Baccarat', 'honduras', 'Danlí, Honduras',
         'Baccarat est un cas d\'école : un cigare que les connaisseurs regardent de haut et que des générations de fumeurs ont adoré. Sa particularité tient à la tête, sucrée — un procédé qui consiste à appliquer une gomme douce sur la coupe. Les puristes y voient une trahison ; les vendeurs, eux, savent que c\'est souvent le premier cigare de quelqu\'un.

L\'assemblage lui-même est doux, avec une cape claire et une combustion très régulière, pensé pour ne heurter personne. C\'est une construction délibérée, et pas un défaut de fabrication : la maison assume depuis longtemps de faire un cigare d\'initiation, dans un métier qui préfère parler aux initiés.

L\'atlas gagne à le dire clairement plutôt qu\'à l\'ignorer. Une bonne part des fumeurs de cigares du continent américain ont commencé par celui-là, et cette fonction d\'entrée compte autant, dans une histoire du goût, que les assemblages de prestige.',
         '[{"name":"Baccarat The Game","color":"#DEB887","force":"Light","wrapper":"Connecticut Shade","vitolas":["Churchill","Robusto"],"story":"La tête sucrée qui fait débat, sur un assemblage volontairement doux et une combustion sans surprise. Le premier cigare de beaucoup de fumeurs — ce n\'est pas rien."},{"name":"Baccarat Maduro","color":"#4E342E","force":"Medium","wrapper":"Maduro","vitolas":["Rothschild"],"story":"La même construction sous une cape sombre : plus de cacao, la même douceur de tête. Le pas suivant sans quitter le terrain connu."}]',
         '[{"type":"Café","name":"Café au lait sucré","notes":"L\'accord évident, et le plus honnête pour un cigare qui assume la douceur."},{"type":"Autre","name":"Thé noir au lait","notes":"Sans alcool, il tient la tête sucrée sans la redoubler."}]', 'Danlí, Honduras'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Baccarat');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Hoyo de Monterrey Honduras', 'honduras', 'Depuis 1960 — Cofradía, Honduras',
         'Hoyo de Monterrey est un nom cubain — une marque de 1865, née à Vuelta Abajo. Après 1960, comme pour Punch, Montecristo et Romeo y Julieta, le nom a été repris hors de Cuba, et sa version non cubaine se fabrique depuis au Honduras. Les deux cigares n\'ont rien de commun sinon la bague.

Le Hoyo hondurien a même pris le contre-pied du cubain. Là où le havane du même nom est réputé pour sa douceur — c\'est la marque des Épicure, des cigares légers et fins —, la version hondurienne a construit sa réputation sur la force, jusqu\'à devenir l\'une des références du corsé sur le marché américain.

Sa gamme Excalibur, déjà présente dans cet atlas, en est l\'expression la plus connue ; elle a longtemps été vendue comme une marque à part entière, au point que beaucoup de fumeurs ignorent qu\'elle appartient à Hoyo.',
         '[{"name":"Hoyo de Monterrey Honduras","color":"#6B4226","force":"Full","wrapper":"Habano","vitolas":["Robusto","Toro"],"story":"Le contre-pied exact du havane du même nom : là où le cubain cultive la légèreté, l\'hondurien a bâti sa réputation sur la force. Terre, poivre, cuir."},{"name":"Excalibur","color":"#C9A227","force":"Medium","wrapper":"Connecticut Shade","vitolas":["Churchill"],"story":"La gamme qui a dépassé sa maison : beaucoup la prennent pour une marque à part. Cape claire, registre plus tenu, une régularité de fabrication remarquable pour ces volumes."}]',
         '[{"type":"Spiritueux","name":"Bourbon","notes":"La vanille du bourbon adoucit un assemblage volontairement rude."},{"type":"Café","name":"Café noir corsé","notes":"Sur Excalibur, la torréfaction relève la cape claire."}]', 'Cofradía, Honduras'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Hoyo de Monterrey Honduras');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Punch Honduras', 'honduras', 'Depuis 1960 — Cofradía, Honduras',
         'La fiche du Honduras annonçait Punch, et le lien menait à l\'article cubain — celui d\'une marque de 1840 fondée à La Havane pour le marché anglais, avec son Mr. Punch de marionnette sur le couvercle. Le lecteur lisait donc l\'histoire d\'un cigare qu\'il ne trouverait pas au Honduras. Cet article-ci répare ce malentendu.

Le Punch hondurien est né de la nationalisation cubaine : le nom, repris hors de l\'île, se fabrique au Honduras depuis les années 1960 et s\'est vendu aux États-Unis pendant tout l\'embargo. Il y a construit sa propre clientèle, sur un profil plus terreux et plus corsé que le havane, et sur des prix restés accessibles là où le cubain devenait un produit rare.

Deux marques, deux pays, un même nom hérité d\'un même XIXe siècle — c\'est l\'une des cicatrices que 1960 a laissées sur la géographie du cigare, et l\'atlas la montre plutôt que de la lisser.',
         '[{"name":"Punch Honduras","color":"#7B3F00","force":"Medium","wrapper":"Habano de Ecuador","vitolas":["Robusto","Churchill"],"story":"Terre, bois, poivre franc : le profil hondurien classique, à un prix qui a fait sa clientèle pendant tout l\'embargo. Rien à voir avec le havane du même nom."},{"name":"Punch Gran Puro","color":"#4E342E","force":"Full","wrapper":"Habano Maduro","vitolas":["Toro"],"story":"Un puro hondurien — tout le tabac vient du pays, tripe comprise. La démonstration que le Honduras se suffit à lui-même."}]',
         '[{"type":"Spiritueux","name":"Rhum hondurien","notes":"Accord de pays, sur un cigare qui revendique son terroir jusque dans la tripe."},{"type":"Café","name":"Café noir","notes":"Le poivre de l\'assemblage supporte une torréfaction franche."}]', 'Cofradía, Honduras'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Punch Honduras');

-- ....................... MEXIQUE .......................

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Santa Clara 1830', 'mexico', 'Revendique 1830 — San Andrés Tuxtla, Mexique',
         'La vallée de San Andrés, au Veracruz, produit un tabac que le monde entier utilise sans toujours savoir d\'où il vient : la cape mexicaine San Andrés, sombre et sucrée, est devenue en vingt ans l\'un des habillages les plus recherchés du métier, jusque dans les assemblages nicaraguayens.

Santa Clara revendique 1830 comme date de fondation, ce qui en ferait la plus ancienne manufacture du pays et l\'une des plus anciennes du continent. La maison appartient à la famille Turrent, qui cultive dans la vallée depuis plusieurs générations et qui est aujourd\'hui le principal fournisseur de cape San Andrés hors du Mexique.

C\'est ce double rôle qui rend la maison intéressante : elle vend sa feuille à ses concurrents et roule ses propres cigares avec. La fiche du Mexique ne comptait jusqu\'ici que deux entrées, dont une qui n\'est même pas une marque mexicaine — celle-ci corrige un déséquilibre criant.',
         '[{"name":"Santa Clara 1830","color":"#4A2C2A","force":"Medium","wrapper":"San Andrés Maduro","vitolas":["Robusto","Toro"],"story":"La cape sombre de la vallée sur une tripe mexicaine : cacao, terre, une sucrosité qui vient de la feuille et non d\'un traitement. Le San Andrés à sa source."},{"name":"Santa Clara Premier","color":"#5D4037","force":"Medium","wrapper":"San Andrés","vitolas":["Corona"],"story":"Format court et registre plus sec, pour ceux qui trouvent le maduro trop confit. Le même terroir, moins de rondeur."}]',
         '[{"type":"Spiritueux","name":"Mezcal","notes":"Le fumé du mezcal et la terre de San Andrés viennent du même paysage volcanique."},{"type":"Autre","name":"Chocolat mexicain à la cannelle","notes":"Le cacao de la cape trouve là son prolongement le plus direct."}]', 'San Andrés Tuxtla, Veracruz, Mexique'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Santa Clara 1830');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Casa Turrent', 'mexico', 'San Andrés Tuxtla, Mexique',
         'Les Turrent cultivent le tabac de San Andrés depuis le début du XXe siècle, et ont longtemps été mieux connus comme planteurs que comme fabricants : leur cape habille des cigares du monde entier, souvent sous d\'autres bagues. Casa Turrent est la gamme par laquelle la famille signe enfin son propre travail.

La maison joue de cet avantage rare — disposer de ses propres feuilles, de plusieurs récoltes en réserve, et de la possibilité de composer des assemblages autour d\'un tabac qu\'elle maîtrise de bout en bout. Ses séries millésimées, construites sur des années de récolte identifiées, sont l\'un des rares exemples de ce genre d\'exercice hors de Cuba.

Le Mexique reste un producteur discret à l\'échelle du continent, écrasé en volume par ses voisins. Il compense par la spécificité : aucun autre pays ne produit cette cape-là, et toute la valeur du terroir mexicain tient dans cette feuille.',
         '[{"name":"Casa Turrent Serie 1880","color":"#3E2723","force":"Full","wrapper":"San Andrés Maduro","vitolas":["Toro"],"story":"Le haut de gamme de la famille, sur des tabacs longuement gardés. Cacao noir, café, une profondeur que seule permet une réserve de récoltes."},{"name":"Casa Turrent Origins","color":"#6D4C41","force":"Medium","wrapper":"San Andrés","vitolas":["Robusto"],"story":"Une série qui associe le tabac mexicain à ceux d\'autres pays producteurs, pour montrer ce que la cape de la vallée apporte à chacun. Pédagogique, et réussi."}]',
         '[{"type":"Spiritueux","name":"Tequila reposado","notes":"L\'agave boisé du reposado tient la puissance de la 1880 sans la masquer."},{"type":"Café","name":"Café de Veracruz","notes":"Cultivé sur les mêmes pentes que le tabac : l\'accord le plus local qui soit."}]', 'Casa Turrent, San Andrés Tuxtla, Mexique'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Casa Turrent');

-- ........................ BRÉSIL .......................

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Suerdieck', 'brazil', 'Fin du XIXe siècle — Bahia, Brésil',
         'Le tabac de Bahia, cultivé dans le Recôncavo autour de Cruz das Almas, a nourri pendant plus d\'un siècle une industrie cigarière qui exportait vers l\'Europe bien avant que l\'Amérique centrale ne domine le marché. Suerdieck, fondée par une famille d\'origine allemande installée au Brésil, en a été la maison la plus connue.

Son tabac — le mata fina, sombre, sucré, à l\'acidité particulière — n\'a d\'équivalent nulle part. C\'est un goût que les fumeurs habitués aux profils cubains trouvent souvent déroutant à la première bouffée : plus fruité, presque vineux, avec une combustion rapide qui demande un tirage plus lent.

L\'histoire récente de la maison a été difficile, comme celle de toute l\'industrie brésilienne du cigare, longtemps concurrencée et fragilisée. L\'atlas la retient pour ce qu\'elle représente : la mémoire d\'un pays producteur que la géographie du cigare premium a marginalisé sans jamais l\'effacer.',
         '[{"name":"Suerdieck Mata Fina","color":"#5B3A29","force":"Medium","wrapper":"Mata Fina","vitolas":["Corona"],"story":"Le tabac de Bahia dans sa forme la plus directe : fruité, presque vineux, avec une acidité qu\'aucun autre terroir ne donne. Déroutant à la première bouffée, mémorable ensuite."},{"name":"Suerdieck Brasilia","color":"#7B4B2A","force":"Light","wrapper":"Mata Fina Claro","vitolas":["Petit Corona"],"story":"Format court et registre léger, dans la tradition des petits cigares brésiliens que l\'Europe importait en quantité au siècle dernier."}]',
         '[{"type":"Spiritueux","name":"Cachaça vieillie","notes":"Accord de pays, et de registre : le végétal de la canne répond au fruité du mata fina."},{"type":"Café","name":"Café brésilien","notes":"Doux et chocolaté, il tempère l\'acidité de la feuille."}]', 'Cruz das Almas, Bahia, Brésil'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Suerdieck');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Dona Flor', 'brazil', 'Années 1990 — Cruz das Almas, Bahia, Brésil',
         'Dona Flor est née de la rencontre entre un savoir-faire cubain et le tabac de Bahia. La maison Menendez Amerino s\'est installée dans le Recôncavo avec l\'idée d\'appliquer les méthodes de roulage havanaises à une feuille brésilienne, ce que personne n\'avait vraiment tenté avec cette rigueur.

Le résultat est l\'un des cigares les plus singuliers du continent : la construction est cubaine — formats classiques, roulage soigné, combustion maîtrisée — mais le goût reste brésilien, fruité et acidulé, avec cette sucrosité de mata fina que rien d\'autre ne donne. C\'est un pont entre deux traditions plutôt qu\'une imitation.

Le nom vient d\'un roman de Jorge Amado, écrivain de Bahia. Ce n\'est pas une coquetterie : la maison revendique son ancrage régional autant que sa méthode importée, et c\'est exactement ce que l\'atlas cherche à montrer — un terroir, une technique, et ce qui naît de leur rencontre.',
         '[{"name":"Dona Flor Selección","color":"#6E4B3A","force":"Medium","wrapper":"Mata Fina","vitolas":["Robusto","Corona"],"story":"Roulage à la cubaine sur feuille de Bahia. La combustion est maîtrisée comme un havane, le goût reste brésilien : fruité, acidulé, sucré sans lourdeur."},{"name":"Dona Flor Alonso Menendez","color":"#4E342E","force":"Full","wrapper":"Mata Fina Maduro","vitolas":["Toro"],"story":"La gamme haute, sur des feuilles plus longuement fermentées. Le fruité brésilien vire au fruit cuit, et la structure tient sur toute la longueur."}]',
         '[{"type":"Spiritueux","name":"Cachaça de qualité","notes":"L\'accord régional par excellence, et le seul qui suive vraiment l\'acidité du mata fina."},{"type":"Autre","name":"Jus de fruits tropicaux frais","notes":"Sans alcool : l\'acidité du fruit épouse celle de la feuille."}]', 'Menendez Amerino, Cruz das Almas, Bahia, Brésil'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Dona Flor');

-- ...................... PHILIPPINES ....................

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Alhambra', 'philippines', 'Fin du XIXe siècle — Manille, Philippines',
         'Les Philippines ont été, sous administration espagnole, l\'autre grand pays du cigare : la vallée de Cagayan fournissait un tabac que Manille roulait en quantités industrielles pour toute l\'Asie et une partie de l\'Europe. Alhambra est l\'une des maisons nées de cette époque, à côté de Tabacalera et de La Flor de la Isabela.

Le nom, emprunté au palais de Grenade, dit d\'où venait le capital et vers qui le produit regardait. C\'est une constante de l\'histoire philippine du tabac : une culture locale, une organisation espagnole, et des marchés lointains.

L\'industrie philippine a décliné au XXe siècle sans disparaître, et son tabac reste utilisé — souvent comme composant d\'assemblage plutôt que comme produit fini signé. Faire figurer Alhambra dans l\'atlas, c\'est rappeler que la géographie du cigare ne s\'est pas toujours limitée aux Caraïbes.',
         '[{"name":"Alhambra Corona","color":"#8B6F47","force":"Medium","wrapper":"Tabac de Cagayan","vitolas":["Corona"],"story":"Le tabac de la vallée de Cagayan, plus sec et plus poivré que les feuilles caraïbes. Un profil que peu de fumeurs connaissent, et qui ne ressemble à rien d\'autre."},{"name":"Alhambra Especiales","color":"#A98467","force":"Light","wrapper":"Tabac de Cagayan Claro","vitolas":["Petit Corona"],"story":"Format court, registre léger, dans la tradition des cigares de Manille que l\'Asie coloniale consommait en quantité."}]',
         '[{"type":"Autre","name":"Thé oolong","notes":"L\'accord asiatique évident, et le plus juste : le végétal du thé suit la sécheresse du tabac."},{"type":"Spiritueux","name":"Rhum philippin","notes":"Sucré et léger, il arrondit un profil naturellement poivré."}]', 'Manille, Philippines'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Alhambra');

-- ..................... ÉTATS-UNIS ......................

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'El Titan de Bronze', 'usa', '1995 — Miami, Floride, États-Unis',
         'Sur la Calle Ocho, à Little Havana, une poignée de rouleurs travaillent derrière une vitrine, à la main, à quelques mètres des passants. El Titan de Bronze est l\'une des dernières manufactures de cigares en activité à Miami, et sans doute la plus visible : on y voit rouler.

C\'est important pour l\'atlas. Miami fut, après 1960, la capitale de l\'exil cubain et le refuge des torcedores qui avaient quitté l\'île ; des dizaines d\'ateliers y ont fonctionné, presque tous disparus depuis. Ce qu\'il en reste tient en quelques adresses, et celle-ci forme encore des rouleurs selon les méthodes cubaines — entièrement à la main, sans moule mécanique pour les formats les plus travaillés.

La maison roule ses propres gammes et produit aussi, en très petites séries, pour des marques qui veulent des cigares faits aux États-Unis. Le volume est dérisoire à l\'échelle du métier ; la valeur patrimoniale ne l\'est pas.',
         '[{"name":"Grand Reserve","color":"#7B3F00","force":"Full","wrapper":"Habano de Ecuador","vitolas":["Robusto"],"story":"Roulé à la main sur la Calle Ocho, par des torcedores formés aux méthodes cubaines. Corsé, franc, avec la régularité que seule donne une petite série surveillée de près."},{"name":"Serie 1995","color":"#A0522D","force":"Medium","wrapper":"Connecticut Shade","vitolas":["Corona"],"story":"Le registre médium de la maison, en hommage à son année d\'ouverture. Cape claire, profil plus doux, mêmes mains."}]',
         '[{"type":"Café","name":"Cafecito cubain","notes":"À Little Havana, c\'est moins un accord qu\'une habitude — et elle fonctionne."},{"type":"Spiritueux","name":"Rhum blanc","notes":"Sec et direct, il ne détourne pas l\'attention d\'un cigare qu\'on fume pour sa construction."}]', 'Little Havana, Miami, Floride, États-Unis'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'El Titan de Bronze');

-- ....................... CAMEROUN ......................

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Meerapfel', 'cameroon', 'Famille marchande depuis le XIXe siècle — Cameroun',
         'La cape camerounaise est l\'une des feuilles les plus recherchées du métier, et pendant longtemps le Cameroun n\'a existé dans le monde du cigare que par elle : une matière première, vendue à des maisons qui la roulaient ailleurs et signaient de leur nom. La fiche de ce pays, dans cet atlas, ne listait d\'ailleurs que des cigares habillés de sa cape.

La famille Meerapfel est au cœur de cette histoire. Marchands de tabac sur plusieurs générations, les Meerapfel ont bâti leur réputation sur la sélection et le négoce de la feuille camerounaise, au point d\'en être l\'un des noms de référence. Quand ils ont lancé leur propre cigare, ils l\'ont fait avec l\'argument le plus solide qui soit : personne ne connaît mieux qu\'eux cette cape.

C\'est ainsi le premier nom que le Cameroun peut revendiquer comme sien — non pas une manufacture locale, le pays n\'en a pas de premium, mais une maison dont l\'identité entière repose sur son tabac.',
         '[{"name":"Meerapfel Cigar","color":"#8B7355","force":"Medium","wrapper":"Cape du Cameroun","vitolas":["Robusto","Toro"],"story":"La cape camerounaise chez ceux qui la sélectionnent depuis des générations : grain fin, saveur de noisette grillée et de poivre doux, avec cette texture soyeuse qui fait toute sa réputation."},{"name":"Meerapfel Vintage","color":"#6B5B4B","force":"Medium","wrapper":"Cape du Cameroun vieillie","vitolas":["Corona Gorda"],"story":"Des feuilles gardées plusieurs années avant roulage. Le poivre s\'efface, la noisette reste, et la texture devient encore plus fine."}]',
         '[{"type":"Spiritueux","name":"Whisky des Highlands","notes":"Le malté et la noisette de la cape camerounaise se répondent presque littéralement."},{"type":"Café","name":"Café éthiopien","notes":"Un café floral et acidulé pour ne pas écraser la finesse de cette cape."}]', 'Cape sélectionnée au Cameroun'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Meerapfel');

-- ....................... INDONÉSIE .....................

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Taru Martani', 'indonesia', 'Fondée sous l\'administration néerlandaise — Yogyakarta, Java',
         'Java et Sumatra fournissent depuis le XIXe siècle des tabacs que l\'Europe a massivement utilisés : la cape de Sumatra a habillé des générations de cigares néerlandais, allemands et belges, et le tabac javanais entre encore dans quantité d\'assemblages. Mais l\'Indonésie, dans l\'imaginaire du cigare, reste un fournisseur — pas un pays de maisons.

Taru Martani corrige cela. Fondée à Yogyakarta sous l\'administration coloniale néerlandaise, la manufacture a été reprise après l\'indépendance et roule depuis sous pavillon indonésien. Elle produit pour l\'exportation comme pour le marché intérieur, et représente le cas rare d\'une maison javanaise qui signe ses propres cigares.

La fiche indonésienne de cet atlas ne comptait jusqu\'ici que des marques néerlandaises utilisant du tabac local. Celle-ci est la première qui soit indonésienne au sens plein : cultivée, roulée et signée sur place.',
         '[{"name":"Taru Martani Senator","color":"#6B4423","force":"Medium","wrapper":"Java","vitolas":["Corona"],"story":"Le tabac de Java roulé à Java. Registre terreux et légèrement épicé, avec une combustion franche — un profil que les assemblages européens n\'utilisent qu\'en composant, jamais seul."},{"name":"Taru Martani Panter","color":"#8B6F47","force":"Light","wrapper":"Sumatra","vitolas":["Petit Corona"],"story":"Cape de Sumatra, format court : exactement ce que l\'Europe importait par millions au siècle dernier, mais fabriqué au pays d\'origine de la feuille."}]',
         '[{"type":"Autre","name":"Thé de Java","notes":"L\'accord local, et le plus cohérent avec un tabac cultivé sur les mêmes pentes volcaniques."},{"type":"Café","name":"Café de Sumatra","notes":"Corsé et terreux, il rejoint le registre du tabac javanais sans le contredire."}]', 'Yogyakarta, Java, Indonésie'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Taru Martani');

-- ── 2. Réparer l'entrée « Punch » du Honduras ───────────
-- Elle pointait sur l'article cubain. On la renomme pour qu'elle
-- désigne l'article hondurien créé ci-dessus.
UPDATE `producer_countries`
   SET `brands` = JSON_SET(`brands`,
         JSON_UNQUOTE(JSON_SEARCH(`brands`, 'one', 'Punch', NULL, '$[*].name')),
         'Punch Honduras')
 WHERE `id` = 'honduras'
   AND JSON_SEARCH(`brands`, 'one', 'Punch', NULL, '$[*].name') IS NOT NULL;

UPDATE `producer_countries`
   SET `brands` = JSON_SET(`brands`,
         REPLACE(JSON_UNQUOTE(JSON_SEARCH(`brands`, 'one', 'Punch Honduras', NULL, '$[*].name')), '.name', '.desc'),
         'Le Punch d\'après 1960, sans rapport avec le havane')
 WHERE `id` = 'honduras'
   AND JSON_SEARCH(`brands`, 'one', 'Punch Honduras', NULL, '$[*].name') IS NOT NULL;

-- ── 3. Les noms entrent dans la liste de leur pays ──────

UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"A.J. Fernandez","desc":"Le rouleur que les autres marques employaient sans le nommer","iconic":true}' AS JSON))
  WHERE `id` = 'nicaragua' AND JSON_SEARCH(`brands`, 'one', 'A.J. Fernandez', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Aganorsa Leaf","desc":"D\'abord un planteur de Jalapa, ensuite une marque","iconic":true}' AS JSON))
  WHERE `id` = 'nicaragua' AND JSON_SEARCH(`brands`, 'one', 'Aganorsa Leaf', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Tatuaje","desc":"La grammaire cubaine, la matière nicaraguayenne","iconic":false}' AS JSON))
  WHERE `id` = 'nicaragua' AND JSON_SEARCH(`brands`, 'one', 'Tatuaje', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Illusione","desc":"Celle qui a rendu le petit format respectable","iconic":false}' AS JSON))
  WHERE `id` = 'nicaragua' AND JSON_SEARCH(`brands`, 'one', 'Illusione', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Foundation Cigar Company","desc":"Un cigare ancré dans une culture, pas seulement un terroir","iconic":false}' AS JSON))
  WHERE `id` = 'nicaragua' AND JSON_SEARCH(`brands`, 'one', 'Foundation Cigar Company', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Mombacho","desc":"Granada plutôt qu\'Estelí, et l\'atelier ouvert aux visiteurs","iconic":false}' AS JSON))
  WHERE `id` = 'nicaragua' AND JSON_SEARCH(`brands`, 'one', 'Mombacho', NULL, '$[*].name') IS NULL;

UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"E.P. Carrillo","desc":"Repartir de zéro après une carrière entière","iconic":true}' AS JSON))
  WHERE `id` = 'dominican' AND JSON_SEARCH(`brands`, 'one', 'E.P. Carrillo', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Quesada","desc":"1974, avant la vague — et toujours familiale","iconic":false}' AS JSON))
  WHERE `id` = 'dominican' AND JSON_SEARCH(`brands`, 'one', 'Quesada', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"PDR Cigars","desc":"Tamboril, où la même main roule plusieurs bagues","iconic":false}' AS JSON))
  WHERE `id` = 'dominican' AND JSON_SEARCH(`brands`, 'one', 'PDR Cigars', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Montecristo Dominicain","desc":"L\'autre Montecristo, celui d\'après 1960","iconic":true}' AS JSON))
  WHERE `id` = 'dominican' AND JSON_SEARCH(`brands`, 'one', 'Montecristo Dominicain', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Romeo y Julieta Dominicain","desc":"Même bague que le havane, autre cigare","iconic":false}' AS JSON))
  WHERE `id` = 'dominican' AND JSON_SEARCH(`brands`, 'one', 'Romeo y Julieta Dominicain', NULL, '$[*].name') IS NULL;

UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Flor de Selva","desc":"1995, fondée depuis Paris pour un palais européen","iconic":true}' AS JSON))
  WHERE `id` = 'honduras' AND JSON_SEARCH(`brands`, 'one', 'Flor de Selva', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"La Flor de Copán","desc":"Une ville bâtie autour de sa manufacture","iconic":false}' AS JSON))
  WHERE `id` = 'honduras' AND JSON_SEARCH(`brands`, 'one', 'La Flor de Copán', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Aladino","desc":"Du corojo d\'avant les hybrides, cultivé par la famille","iconic":false}' AS JSON))
  WHERE `id` = 'honduras' AND JSON_SEARCH(`brands`, 'one', 'Aladino', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Baccarat","desc":"La tête sucrée qui a fait commencer des générations","iconic":false}' AS JSON))
  WHERE `id` = 'honduras' AND JSON_SEARCH(`brands`, 'one', 'Baccarat', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Hoyo de Monterrey Honduras","desc":"Le contre-pied du havane : ici, c\'est le corsé","iconic":false}' AS JSON))
  WHERE `id` = 'honduras' AND JSON_SEARCH(`brands`, 'one', 'Hoyo de Monterrey Honduras', NULL, '$[*].name') IS NULL;

UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Santa Clara 1830","desc":"La cape San Andrés à sa source","iconic":true}' AS JSON))
  WHERE `id` = 'mexico' AND JSON_SEARCH(`brands`, 'one', 'Santa Clara 1830', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Casa Turrent","desc":"Les planteurs de la vallée signent enfin leur travail","iconic":true}' AS JSON))
  WHERE `id` = 'mexico' AND JSON_SEARCH(`brands`, 'one', 'Casa Turrent', NULL, '$[*].name') IS NULL;

UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Suerdieck","desc":"La mémoire cigarière de Bahia","iconic":true}' AS JSON))
  WHERE `id` = 'brazil' AND JSON_SEARCH(`brands`, 'one', 'Suerdieck', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Dona Flor","desc":"Roulage cubain, feuille brésilienne","iconic":true}' AS JSON))
  WHERE `id` = 'brazil' AND JSON_SEARCH(`brands`, 'one', 'Dona Flor', NULL, '$[*].name') IS NULL;

UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Alhambra","desc":"Manille roulait pour toute l\'Asie","iconic":false}' AS JSON))
  WHERE `id` = 'philippines' AND JSON_SEARCH(`brands`, 'one', 'Alhambra', NULL, '$[*].name') IS NULL;

UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"El Titan de Bronze","desc":"Ce qui reste des ateliers cubains de Miami","iconic":true}' AS JSON))
  WHERE `id` = 'usa' AND JSON_SEARCH(`brands`, 'one', 'El Titan de Bronze', NULL, '$[*].name') IS NULL;

UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Meerapfel","desc":"La première maison que le Cameroun peut dire sienne","iconic":true}' AS JSON))
  WHERE `id` = 'cameroon' AND JSON_SEARCH(`brands`, 'one', 'Meerapfel', NULL, '$[*].name') IS NULL;

UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Taru Martani","desc":"Cultivé, roulé et signé à Java","iconic":true}' AS JSON))
  WHERE `id` = 'indonesia' AND JSON_SEARCH(`brands`, 'one', 'Taru Martani', NULL, '$[*].name') IS NULL;
