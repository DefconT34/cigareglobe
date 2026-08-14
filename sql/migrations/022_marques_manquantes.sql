-- ════════════════════════════════════════════════════════
-- 022 — Les marques qui manquaient à l'atlas
-- ────────────────────────────────────────────────────────
-- CUBA passe de 11 à 27 marques, soit le portefeuille complet de
-- Habanos S.A. Il en manquait seize, dont plusieurs parmi les plus
-- anciennes encore produites : Por Larrañaga (1834), Ramón Allones
-- (1837), El Rey del Mundo et Sancho Panza (1848).
--
-- S'y ajoutent deux maisons que leur ancienneté rendait indispensables :
--
--   LA AURORA (1903), la plus ancienne manufacture dominicaine, déjà
--   installée depuis soixante ans quand l'exode cubain a fait du pays
--   la capitale du cigare premium. Son absence était la plus criante
--   de toute la fiche dominicaine.
--
--   J.C. NEWMAN (1895), la plus ancienne entreprise familiale de
--   cigares encore en activité aux États-Unis, et la dernière grande
--   fabrique en fonctionnement de Ybor City. La fiche américaine ne
--   listait jusqu'ici qu'une entreprise — General Cigar — et une
--   extension de marque.
--
-- ── Ce que ces articles contiennent, et ce qu'ils ne contiennent pas ──
--
-- Histoire, gamme de deux vitoles, accords : oui.
--
-- Notes de dégustation chiffrées, célébrités, éditions limitées : NON,
-- volontairement. Ce sont les champs les plus faciles à inventer et les
-- plus difficiles à vérifier ; une note « Cigar Aficionado 94/2021 »
-- fausse serait indiscernable d'une vraie. Les colonnes restent vides,
-- et le front ne les affiche pas — il a d'ailleurs fallu corriger
-- l'affichage d'une étiquette absente en même temps (migration 021).
--
-- ⚠ Le texte vient des connaissances du rédacteur, comme les 92 fiches
-- pays et les 90 dates de fête nationale déjà en attente de relecture.
-- Les dates de fondation et les régions demandent une vérification
-- avant mise en ligne publique.
--
-- Les descriptions courtes sont traduites dans les cinq autres langues
-- par le dictionnaire (`content_translations`) — voir sql/traductions.sql.
--
-- Rejouable : chaque insertion vérifie d'abord l'absence du nom.
-- ════════════════════════════════════════════════════════

-- ── 1. Les articles ─────────────────────────────────────
INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Ramón Allones', 'cuba', '1837 — La Havane, Cuba',
         'Ramón Allones est l\'une des plus anciennes marques encore produites, et son fondateur a laissé au cigare une invention qu\'on ne remarque plus tant elle va de soi : la boîte de bois habillée d\'une étiquette imprimée en couleurs. Ramón Allones, immigré galicien installé à La Havane, fut le premier à décorer ses caisses de lithographies dorées vers 1845 — une manière de signer sa production à une époque où le cigare se vendait en vrac. Toute la présentation moderne du havane en découle.

La marque a traversé le XXe siècle sans jamais chercher le premier rang commercial, et c\'est ce qui explique sa réputation actuelle. Son assemblage, resté franc et corsé, s\'adresse à des fumeurs qui savent ce qu\'ils cherchent : une matière dense, des notes de cuir, de cacao amer et de bois brûlé, une force soutenue du premier au dernier tiers.

Le Specially Selected, un Robusto, est le cigare qui porte la marque depuis les années 1970. Il est régulièrement cité parmi les havanes que les connaisseurs conseillent en premier à qui veut comprendre ce qu\'apporte le vieillissement : sorti de boîte il est brutal, à cinq ans il devient une des expressions les plus rondes du profil cubain corsé.

Ramón Allones a par ailleurs servi de terrain aux séries régionales : la marque en compte parmi les plus recherchées, ce qui entretient une rareté qu\'elle n\'a jamais organisée elle-même.',
         '[{"name":"Specially Selected","color":"#8B0000","force":"Full","wrapper":"Habano Colorado","vitolas":["Robusto"],"story":"Le Robusto qui porte la marque. Cuir, cacao amer, bois brûlé, une force qui ne faiblit pas. Sorti de boîte il est brutal ; à cinq ans de cave il devient l\'une des expressions les plus rondes du profil cubain corsé — c\'est le cigare qu\'on conseille pour comprendre ce que le vieillissement fait vraiment."},{"name":"Gigantes","color":"#6B0000","force":"Full","wrapper":"Habano Colorado","vitolas":["Prominente"],"story":"Un double corona, format long et lent, où l\'assemblage a le temps de se déployer. Réservé aux séances sans horaire : deux heures, et un développement en trois actes que les formats courts ne peuvent pas offrir."}]',
         '[{"type":"Spiritueux","name":"Rhum agricole vieux","notes":"La sécheresse végétale d\'un agricole tient tête au cacao amer sans le sucrer."},{"type":"Café","name":"Expresso italien torréfaction foncée","notes":"Accord de proximité : les mêmes notes brûlées, à des intensités qui se répondent."}]', 'La Havane, Cuba'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Ramón Allones');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'El Rey del Mundo', 'cuba', '1848 — La Havane, Cuba',
         'Le nom claque comme une enseigne du XIXe siècle, et c\'en est une : « le roi du monde », déposé en 1848 par Emilio Ohmstedt, à une époque où l\'on ne reculait devant aucune emphase pour vendre du tabac. La marque fut longtemps l\'une des plus chères de La Havane, réputée pour la sélection de ses feuilles plus que pour la puissance de ses assemblages.

C\'est précisément ce qui la rend intéressante aujourd\'hui. El Rey del Mundo appartient au registre doux à médium du portefeuille cubain — celui que la mode des années 2000, tournée vers les blends de plus en plus forts, a laissé de côté. La marque n\'a pas suivi ; elle a gardé un profil de bois blond, de foin sec et d\'amande, avec une longueur en bouche qui doit tout à la qualité de la matière et rien à l\'intensité.

La gamme s\'est réduite au fil des décennies, comme celle de plusieurs marques historiques que Habanos a resserrées. Le Choix Suprême, un Hermoso No.4, en reste l\'expression la plus connue : un format court, régulier, qui se fume en une heure et ne demande pas d\'estomac plein.

Une marque de connaisseurs, donc — au sens le moins snob du terme : celle qu\'on redécouvre quand on se lasse de chercher la force.',
         '[{"name":"Choix Suprême","color":"#C9A227","force":"Medium","wrapper":"Habano Claro","vitolas":["Hermoso No.4"],"story":"Bois blond, foin sec, amande. Une heure de fumée régulière, sans pic ni creux, où la longueur vient de la matière et non de l\'intensité. Le cigare qu\'on ressort quand on se lasse de chercher la force."},{"name":"Demi Tasse","color":"#D4B44A","force":"Light","wrapper":"Habano Claro","vitolas":["Entreactos"],"story":"Vingt-cinq minutes, pas davantage. Le format qui accompagne un café sans engager l\'après-midi — et l\'un des rares petits formats cubains à ne pas sacrifier la finesse au gabarit."}]',
         '[{"type":"Café","name":"Café filtre d\'Amérique centrale","notes":"Un café clair laisse passer l\'amande ; un expresso l\'écraserait."},{"type":"Spiritueux","name":"Cognac VSOP","notes":"Le fruité du cognac prolonge le bois blond sans jamais le couvrir."}]', 'La Havane, Cuba'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'El Rey del Mundo');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'La Gloria Cubana', 'cuba', '1885 — La Havane, Cuba',
         'La Gloria Cubana appartient à cette génération de marques nées dans les années 1880, quand La Havane comptait des centaines de fabriques et que le nom d\'une maison valait contrat. La sienne s\'est bâtie sur une série : les Medaille d\'Or, formats longs et fins, présentés en boîtes de cèdre verni et coiffés d\'une bague qui reproduit les médailles remportées aux expositions universelles de la fin du XIXe siècle.

Ces formats élancés — le No.4 en particulier, un Dalias — sont exigeants à rouler et lents à fumer. Ils demandent un tirage impeccable, que la marque a longtemps su tenir, et offrent en échange un profil médium très caractéristique : cèdre, miel, une pointe florale, avec une finale sèche qui n\'alourdit jamais.

La Gloria Cubana a connu une histoire administrative compliquée : son nom vit aujourd\'hui des deux côtés de l\'embargo, avec une marque américaine homonyme sans lien d\'assemblage avec la cubaine. C\'est un cas de plus dans la longue liste des homonymes que l\'embargo a créés, et l\'une des raisons pour lesquelles il faut toujours regarder d\'où vient la boîte.

La version cubaine reste discrète, produite en quantités modestes, et fidèle à ses formats d\'origine.',
         '[{"name":"Medaille d\'Or No.4","color":"#C9A227","force":"Medium","wrapper":"Habano Colorado Claro","vitolas":["Dalias"],"story":"Format long et fin, difficile à rouler, lent à fumer. Cèdre, miel, une pointe florale et une finale sèche. Le tirage fait tout : réussi, c\'est l\'un des profils les plus élégants du portefeuille."},{"name":"Tapados","color":"#B8901F","force":"Medium","wrapper":"Habano Colorado Claro","vitolas":["Petit Corona"],"story":"La version courte du même assemblage, pour qui n\'a pas l\'heure et demie que réclame un Dalias."}]',
         '[{"type":"Spiritueux","name":"Whisky des Highlands, non tourbé","notes":"Le miel du malt répond au miel du cigare ; la tourbe, elle, l\'effacerait."},{"type":"Thé","name":"Oolong torréfié","notes":"Un accord rare et juste : la note florale du cigare trouve là son écho exact."}]', 'La Havane, Cuba'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'La Gloria Cubana');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Juan López', 'cuba', '1876 — La Havane, Cuba',
         'Juan López est le genre de marque dont on entend parler par quelqu\'un, jamais par une publicité. Fondée en 1876 par un fabricant espagnol du même nom, elle n\'a jamais occupé le devant de la scène et produit aujourd\'hui l\'une des plus petites gammes du portefeuille cubain — deux ou trois références selon les années.

Cette discrétion tient à un choix : la marque n\'a pas cherché à décliner son nom sur vingt formats. Son assemblage, médium à corsé, se reconnaît à une matière franche, un peu rustique au bon sens du terme, avec des notes de terre sèche, de poivre blanc et de cuir neuf. Rien d\'ornemental ; c\'est un cigare direct.

Le Seleccion No.2, un Robusto, en est l\'expression la mieux connue et sans doute le meilleur rapport entre ce qu\'on paie et ce qu\'on obtient dans tout le catalogue de La Havane. Il est régulièrement cité par les amateurs comme le havane qu\'on offre à quelqu\'un qui croit avoir tout fumé.

Les séries régionales ont ici aussi joué un rôle : quelques éditions locales ont fait connaître Juan López à des marchés qui l\'ignoraient, et ont contribué à sa réputation de secret partagé.',
         '[{"name":"Seleccion No.2","color":"#8B4513","force":"Medium-Full","wrapper":"Habano Colorado","vitolas":["Robusto"],"story":"Terre sèche, poivre blanc, cuir neuf. Un cigare direct, sans ornement, et le meilleur rapport entre ce qu\'on paie et ce qu\'on obtient dans tout le catalogue havanais. Celui qu\'on offre à quelqu\'un qui croit avoir tout fumé."},{"name":"Seleccion No.1","color":"#7A3E10","force":"Medium","wrapper":"Habano Colorado","vitolas":["Corona Gorda"],"story":"Un peu plus long, un peu plus rond. La même franchise, avec le temps de s\'installer."}]',
         '[{"type":"Spiritueux","name":"Rhum cubain 7 ans","notes":"L\'accord de proximité géographique, et il fonctionne : même terre, même franchise."},{"type":"Bière","name":"Porter","notes":"Le grillé du porter absorbe le poivre et laisse remonter le cuir."}]', 'La Havane, Cuba'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Juan López');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Por Larrañaga', 'cuba', '1834 — La Havane, Cuba',
         'Por Larrañaga revendique 1834, ce qui en fait la plus ancienne marque cubaine encore produite sans interruption. Elle a survécu à la fin de la colonie espagnole, à deux guerres mondiales, à la nationalisation, et à plusieurs restructurations du portefeuille — chaque fois en gardant une gamme réduite plutôt qu\'en s\'élargissant.

Rudyard Kipling lui a offert sa publicité la plus durable sans rien demander : dans un poème de 1886, il oppose l\'amour d\'une femme à celui d\'un cigare, et cite la marque. Le vers est devenu l\'une des citations les plus reprises de l\'histoire du tabac, souvent sans que ceux qui la répètent sachent d\'où elle vient.

Le profil, lui, est resté doux à médium : bois de cèdre, crème, une douceur presque lactée qui a fait la réputation de la maison auprès des fumeurs du matin. La marque a longtemps été produite en petites quantités, et une partie de sa production part aujourd\'hui vers des séries régionales, notamment européennes.

C\'est un havane de tempérament calme, dans un portefeuille qui n\'en compte pas tant.',
         '[{"name":"Petit Corona","color":"#D4B44A","force":"Light-Medium","wrapper":"Habano Claro","vitolas":["Marevas"],"story":"Cèdre, crème, une douceur presque lactée. Quarante minutes de calme — le format du matin, celui qu\'on fume avant que la journée n\'ait commencé."},{"name":"Panetelas","color":"#E0C88A","force":"Light","wrapper":"Habano Claro","vitolas":["Panetela"],"story":"Plus fin encore, et plus court. La même douceur, concentrée en une demi-heure."}]',
         '[{"type":"Café","name":"Café au lait","notes":"L\'accord du matin, sans détour : deux douceurs lactées qui se prolongent."},{"type":"Spiritueux","name":"Calvados","notes":"La pomme cuite relève la crème sans la couper."}]', 'La Havane, Cuba'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Por Larrañaga');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Rafael González', 'cuba', '1928 — La Havane, Cuba',
         'Rafael González est la seule marque cubaine à porter, imprimée à l\'intérieur du couvercle de ses boîtes, une recommandation de dégustation : fumer ces cigares dans l\'année qui suit leur fabrication, ou les laisser vieillir plus d\'un an. Entre les deux, dit l\'avis, ils traversent une période creuse. Le texte, rédigé en anglais et attribué à un marquis britannique, date de la création de la marque en 1928, quand elle fut lancée à destination du marché anglais.

L\'avis dit quelque chose de vrai sur la marque : son assemblage, dans le registre doux à médium, se lit très tôt et très tard, mais s\'efface au milieu. C\'est une particularité que peu de maisons assument par écrit.

Le profil tient dans quelques mots : cèdre, foin, une amertume légère de thé noir, et une texture soyeuse qui doit beaucoup à la finesse des capes retenues. Les Perlas — un petit format — et les Panetelas Extra en sont les expressions les plus connues.

La gamme est aujourd\'hui l\'une des plus courtes du portefeuille, et la marque appartient à ce groupe de maisons historiques que Habanos maintient sans les pousser.',
         '[{"name":"Perlas","color":"#C9A227","force":"Light-Medium","wrapper":"Habano Claro","vitolas":["Perla"],"story":"Cèdre, foin, une amertume légère de thé noir, une texture soyeuse. Vingt-cinq minutes. À fumer dans l\'année ou après deux ans — jamais entre les deux, comme l\'avis imprimé sous le couvercle le recommande depuis 1928."},{"name":"Panetelas Extra","color":"#D4B44A","force":"Light-Medium","wrapper":"Habano Claro","vitolas":["Ninfas"],"story":"Long et très fin. Le même assemblage, étiré, où la finesse de la cape devient la moitié du plaisir."}]',
         '[{"type":"Thé","name":"Darjeeling second flush","notes":"L\'amertume de thé du cigare rencontre la sienne, et les deux s\'allongent."},{"type":"Spiritueux","name":"Sherry Amontillado","notes":"La noisette oxydative du sherry épouse le foin sec."}]', 'La Havane, Cuba'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Rafael González');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Sancho Panza', 'cuba', '1848 — La Havane, Cuba',
         'Le choix du nom dit tout : non pas Don Quichotte, mais son écuyer — le personnage terre à terre, celui qui mange, dort et ne poursuit pas de moulins. La marque, fondée en 1848, a construit son profil sur cette promesse de bon sens : un cigare doux à médium, sans aspérité, fait pour être fumé plutôt que commenté.

Sancho Panza a longtemps été très populaire en Espagne, son premier marché, et a bâti là une clientèle fidèle qui n\'a jamais réclamé de changement. Le profil est resté celui d\'origine : bois clair, herbe fraîche, une douceur beurrée, une force que la plupart des fumeurs qualifient de reposante.

La marque possède pourtant une exception à son propre registre, et c\'est celle qu\'on retient : le Belicosos, un figurado pyramidal dont l\'assemblage monte nettement plus haut en intensité que le reste de la gamme. Le contraste entre le nom de la maison et ce format-là amuse les amateurs depuis des décennies.

La gamme s\'est resserrée comme celle de ses contemporaines, mais Sancho Panza garde une place précise dans le portefeuille : celle du havane qu\'on propose à quelqu\'un qui n\'en a jamais fumé.',
         '[{"name":"Belicosos","color":"#8B4513","force":"Medium-Full","wrapper":"Habano Colorado","vitolas":["Belicoso"],"story":"L\'exception de la maison : un pyramidal qui monte bien plus haut en intensité que le reste de la gamme. Le contraste avec le nom de la marque amuse les amateurs depuis des décennies."},{"name":"Molinos","color":"#C9A227","force":"Light-Medium","wrapper":"Habano Claro","vitolas":["Corona Grande"],"story":"Bois clair, herbe fraîche, une douceur beurrée. Le havane qu\'on propose à quelqu\'un qui n\'en a jamais fumé — et le format qui porte le mieux l\'esprit de la maison."}]',
         '[{"type":"Spiritueux","name":"Xérès Fino bien frais","notes":"La salinité du fino réveille l\'herbe fraîche ; accord espagnol, comme la clientèle d\'origine."},{"type":"Café","name":"Café con leche","notes":"Le beurré du cigare et le lait chaud : sans surprise, et parfaitement juste."}]', 'La Havane, Cuba'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Sancho Panza');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Saint Luis Rey', 'cuba', '1940 — La Havane, Cuba',
         'Saint Luis Rey doit son nom à une région de tabac — San Luis, dans la Vuelta Abajo — et son orthographe francisée à une histoire commerciale britannique : la marque fut lancée autour de 1940 pour des importateurs londoniens, à une époque où le marché anglais dictait une part des choix de La Havane.

Elle est restée l\'une des marques les moins connues du grand public et l\'une des plus appréciées des fumeurs réguliers, pour une raison simple : son assemblage est franchement corsé alors que sa présentation, sobre et rouge, ne l\'annonce pas. Notes de terre, de cuir et d\'épice noire, avec une charpente qui tient sur toute la longueur.

Le Regios, un Robusto, en est le format de référence. Il figure souvent dans les recommandations d\'amateurs comme une alternative moins chère et moins exposée aux grands corsés du portefeuille.

Une confusion mérite d\'être signalée : il existe une marque hondurienne au nom voisin, sans aucun lien d\'assemblage. Là encore, c\'est la boîte qu\'il faut lire.',
         '[{"name":"Regios","color":"#8B0000","force":"Full","wrapper":"Habano Colorado","vitolas":["Robusto"],"story":"Terre, cuir, épice noire, une charpente qui tient du premier au dernier tiers. Une présentation sobre qui n\'annonce rien de la puissance qu\'il y a dedans — c\'est précisément ce qui plaît."},{"name":"Double Corona","color":"#6B0000","force":"Full","wrapper":"Habano Colorado","vitolas":["Prominente"],"story":"Le même assemblage sur deux heures. Format de fin de soirée, à ne pas commencer sans avoir dîné."}]',
         '[{"type":"Spiritueux","name":"Whisky d\'Islay tourbé","notes":"Deux puissances qui ne se disputent pas : la tourbe et la terre se superposent."},{"type":"Bière","name":"Stout sec","notes":"L\'amertume torréfiée soutient l\'épice noire sans ajouter de sucre."}]', 'La Havane, Cuba'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Saint Luis Rey');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Diplomáticos', 'cuba', '1966 — La Havane, Cuba',
         'Diplomáticos est née d\'une commande : en 1966, le monopole français du tabac cherchait une marque à son propre usage, moins chère que Montecristo mais bâtie sur le même registre. La Havane lui a fourni exactement cela — une gamme parallèle, aux formats numérotés comme ceux de Montecristo, et à l\'assemblage très proche.

Ce parallélisme, longtemps tenu pour un secret d\'initiés, est devenu l\'argument principal de la marque : les amateurs y voient l\'occasion d\'un profil montecristien à un prix plus doux. La comparaison est un peu injuste — les assemblages ont divergé au fil des décennies — mais elle a fait la réputation de la maison.

Le profil actuel est médium : cacao, café au lait, une pointe de cuir, une régularité de combustion que les fumeurs réguliers apprécient. Le No.2, un Pirámide, en est l\'expression la plus recherchée.

La gamme, réduite dans les années 2000 à une poignée de références, reste distribuée principalement en Europe — un héritage direct de sa naissance administrative.',
         '[{"name":"No.2","color":"#8B4513","force":"Medium-Full","wrapper":"Habano Colorado","vitolas":["Pirámide"],"story":"Le pyramidal de la maison, et le format que cherchent ceux qui connaissent l\'histoire de la marque. Cacao, café au lait, une pointe de cuir, et une combustion d\'une régularité remarquable."},{"name":"No.4","color":"#A0522D","force":"Medium","wrapper":"Habano Colorado","vitolas":["Mareva"],"story":"Le format court du même assemblage. Quarante-cinq minutes, sans la montée en puissance du Pirámide."}]',
         '[{"type":"Café","name":"Cappuccino","notes":"L\'accord littéral : le cigare a déjà le café au lait dans son profil."},{"type":"Spiritueux","name":"Armagnac","notes":"Le pruneau de l\'armagnac creuse le cacao et allonge la finale."}]', 'La Havane, Cuba'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Diplomáticos');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Fonseca', 'cuba', '1892 — La Havane, Cuba',
         'Fonseca se reconnaît avant même d\'être allumée : chaque cigare est enveloppé individuellement dans un papier de soie blanc, une présentation que la marque a conservée depuis la fin du XIXe siècle et que plus aucune autre maison cubaine ne pratique.

Ce détail n\'est pas décoratif. Le papier protège une cape choisie très claire, fine et fragile, qui marque au moindre frottement. Il dit aussi le positionnement de la marque : la douceur, revendiquée depuis toujours, dans un portefeuille où elle est minoritaire.

Le profil est franchement léger — crème, amande fraîche, une note de pain grillé — avec une combustion rapide qui convient aux formats courts. C\'est un cigare de début de journée ou de première expérience, et l\'un des rares havanes qu\'on peut proposer à quelqu\'un qui craint la force.

La maison, fondée par Francisco Fonseca, a par ailleurs donné son nom à une marque dominicaine sans lien d\'assemblage — encore un homonyme, encore une boîte à lire attentivement.',
         '[{"name":"Cosacos","color":"#E0C88A","force":"Light","wrapper":"Habano Claro","vitolas":["Cosaco"],"story":"Crème, amande fraîche, pain grillé. Enveloppé de papier de soie, comme toute la maison depuis 1892 — le papier protège une cape très claire qui marque au moindre frottement."},{"name":"No.1","color":"#D4B44A","force":"Light-Medium","wrapper":"Habano Claro","vitolas":["Cazadore"],"story":"Le format long de la maison, où la douceur a le temps de s\'installer sans jamais monter en puissance."}]',
         '[{"type":"Café","name":"Café filtre léger","notes":"Rien de plus fort : un expresso couvrirait entièrement l\'amande."},{"type":"Vin","name":"Champagne blanc de blancs","notes":"La craie du champagne et le pain grillé du cigare : accord de petit-déjeuner tardif."}]', 'La Havane, Cuba'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Fonseca');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Cuaba', 'cuba', '1996 — La Havane, Cuba',
         'Cuaba est une marque de résurrection. Lancée en 1996, elle a été créée pour faire revivre une forme abandonnée depuis les années 1940 : le double figurado, effilé aux deux extrémités, que les rouleurs du XIXe siècle produisaient couramment et que la mécanisation du XXe a fait disparaître des catalogues.

La forme n\'est pas un caprice esthétique. Un cigare effilé aux deux bouts commence étroit, s\'élargit, puis se resserre : le volume de fumée et la concentration des arômes changent en continu, ce qu\'un format droit ne fait jamais. Elle est aussi beaucoup plus difficile à rouler, ce qui explique qu\'elle ait été abandonnée et pourquoi Cuaba est confiée à des torcedores expérimentés.

Le profil est médium à corsé, avec des notes de bois épicé, de poivre et de fruits secs, et une intensité qui culmine au deuxième tiers — exactement là où le diamètre est maximal.

Le nom vient d\'un arbuste cubain dont les Taïnos utilisaient l\'écorce pour allumer leurs feux, et que les premiers Espagnols ont vu servir à allumer le tabac.',
         '[{"name":"Salomones","color":"#8B4513","force":"Medium-Full","wrapper":"Habano Colorado","vitolas":["Salomón"],"story":"Le grand double figurado : étroit, puis large, puis étroit à nouveau. L\'intensité culmine au deuxième tiers, exactement là où le diamètre est maximal — un développement qu\'aucun format droit ne peut reproduire."},{"name":"Divinos","color":"#A0522D","force":"Medium","wrapper":"Habano Colorado","vitolas":["Petit Bouquet"],"story":"Le plus petit double figurado du catalogue. Trente minutes, et la même courbe d\'intensité en accéléré."}]',
         '[{"type":"Spiritueux","name":"Rhum ambré 12 ans","notes":"Le fruit sec du rhum accompagne la montée du deuxième tiers."},{"type":"Café","name":"Expresso serré","notes":"Un format qui change tout le temps demande un accord qui, lui, ne bouge pas."}]', 'La Havane, Cuba'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Cuaba');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'San Cristóbal de La Habana', 'cuba', '1999 — La Havane, Cuba',
         'La marque porte le nom complet que les Espagnols donnèrent à la ville en 1519 : San Cristóbal de La Habana. Lancée en 1999 pour le quatre-cent-quatre-vingtième anniversaire de la fondation, elle a nommé ses formats d\'après les quatre forteresses qui gardaient la baie — El Morro, La Punta, La Fuerza, El Príncipe.

L\'assemblage a été conçu pour un registre médium, avec une matière plus douce que celle des grandes marques corsées et une aromatique tournée vers le cèdre, le café au lait et une note minérale peu commune dans le portefeuille cubain. C\'est une marque de la fin du XXe siècle, et cela s\'entend : elle a été composée à une époque où Habanos cherchait à élargir son offre vers des profils accessibles.

Les formats portent bien leur nom : El Príncipe, le plus court, se fume en une demi-heure ; El Morro, le plus grand, demande deux heures pleines. Entre les deux, la marque couvre presque toute l\'échelle des durées, ce qui est rare pour une gamme de cette taille.

Elle reste plus connue des voyageurs qui la découvrent à La Havane que des marchés d\'exportation.',
         '[{"name":"El Príncipe","color":"#C9A227","force":"Medium","wrapper":"Habano Colorado Claro","vitolas":["Perla"],"story":"La plus petite des quatre forteresses, et le plus court des formats : trente minutes de cèdre et de café au lait, avec une note minérale peu commune chez les cubains."},{"name":"El Morro","color":"#A0522D","force":"Medium","wrapper":"Habano Colorado Claro","vitolas":["Dalias"],"story":"La grande forteresse de l\'entrée de la baie, et le grand format de la maison. Deux heures, où la minéralité prend le pas sur le cèdre dans le dernier tiers."}]',
         '[{"type":"Spiritueux","name":"Rhum blanc de dégustation","notes":"La minéralité du cigare demande un alcool clair, pas un fût."},{"type":"Café","name":"Café cubain sucré","notes":"L\'accord local, et le seul qui rende justice au café au lait de l\'assemblage."}]', 'La Havane, Cuba'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'San Cristóbal de La Habana');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Vegueros', 'cuba', '1997 — Pinar del Río, Cuba',
         'Un veguero est un cultivateur de tabac — celui qui tient une vega, la parcelle. La marque, lancée en 1997, a été créée à Pinar del Río même, dans la province qui fournit l\'essentiel des feuilles du pays, et pensée d\'abord pour ceux qui y vivent : un cigare de travail, honnête, sans mise en scène.

C\'est ce qui en fait un cas à part dans le portefeuille. Là où les autres marques racontent des salons et des dynasties, Vegueros parle de champ. La présentation suit : boîtes métalliques rondes, sobres, conçues pour le transport plutôt que pour la vitrine.

La gamme a été entièrement refondue au milieu des années 2010, avec de nouveaux formats et un assemblage révisé, plus corsé qu\'à l\'origine. Le profil actuel donne du bois, du poivre et une franchise terreuse qui évoque directement la région d\'où viennent les feuilles.

À prix contenu, c\'est l\'une des portes d\'entrée les plus honnêtes du monde cubain — et l\'une des rares marques dont le nom désigne les gens qui font le tabac plutôt que ceux qui le vendent.',
         '[{"name":"Tapados","color":"#8B4513","force":"Medium","wrapper":"Habano Colorado","vitolas":["Petit Edmundo"],"story":"Bois, poivre, une franchise terreuse qui vient directement de Pinar del Río. Un cigare de travail, sans mise en scène — et l\'une des portes d\'entrée les plus honnêtes du monde cubain."},{"name":"Mañanitas","color":"#A0522D","force":"Medium","wrapper":"Habano Colorado","vitolas":["Petit"],"story":"Le petit format du matin, vendu en boîte métallique ronde conçue pour la poche plutôt que pour la vitrine."}]',
         '[{"type":"Café","name":"Café noir serré","notes":"L\'accord du champ : rien d\'ajouté, rien de sucré."},{"type":"Spiritueux","name":"Rhum blanc jeune","notes":"Sec et direct, comme le cigare."}]', 'Pinar del Río, Cuba'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Vegueros');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Quai d\'Orsay', 'cuba', '1973 — La Havane, Cuba',
         'Quai d\'Orsay porte le nom d\'une adresse parisienne, et ce n\'est pas une coquetterie : la marque a été créée en 1973 à la demande du monopole français des tabacs, qui voulait un havane composé pour le palais de ses clients. Le cahier des charges tenait en un mot : douceur.

Le résultat est l\'un des assemblages les plus clairs du portefeuille cubain — cape blonde, matière soyeuse, notes de foin, de beurre frais et d\'amande, avec une force que les amateurs de corsés jugent inexistante et que les autres trouvent exactement à sa place.

Longtemps réservée au marché français, la marque n\'a été distribuée plus largement qu\'à partir des années 2010, avec l\'arrivée de nouveaux formats plus épais qui ont un peu remonté l\'intensité sans changer le registre. Cette ouverture lui a valu une seconde jeunesse auprès de fumeurs qui ne la connaissaient que de nom.

C\'est, avec Fonseca et Rafael González, l\'un des trois havanes qu\'on peut recommander sans réserve à quelqu\'un qui déclare ne pas aimer le cigare.',
         '[{"name":"Coronas Claro","color":"#E0C88A","force":"Light","wrapper":"Habano Claro","vitolas":["Corona"],"story":"Cape blonde, matière soyeuse, foin et beurre frais. La douceur inscrite au cahier des charges de 1973 — et l\'un des trois havanes qu\'on recommande à qui déclare ne pas aimer le cigare."},{"name":"No.50","color":"#D4B44A","force":"Light-Medium","wrapper":"Habano Claro","vitolas":["Robusto"],"story":"Le format épais arrivé dans les années 2010 : un peu plus d\'intensité, sans quitter le registre clair de la maison."}]',
         '[{"type":"Vin","name":"Chablis","notes":"La minéralité tendue du chablis et le beurre du cigare : accord français jusqu\'au bout."},{"type":"Thé","name":"Thé vert sencha","notes":"Végétal contre végétal, sans qu\'aucun ne domine."}]', 'La Havane, Cuba'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Quai d\'Orsay');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'José L. Piedra', 'cuba', 'Années 1880 — Villa Clara, Cuba',
         'José L. Piedra occupe une place que le reste du portefeuille laisse vide : celle du cigare cubain de tous les jours, vendu au prix d\'un paquet de cigarettes, et assumé comme tel.

La marque vient de la région de Villa Clara, dans le centre de l\'île, et non de la Vuelta Abajo. Ses feuilles sont plus rustiques, son roulage est différent — la tripe est faite de feuilles entières mais l\'exécution reste volontairement simple —, et la présentation se limite souvent à des paquets de cinq ou à des boîtes sans habillage.

Le profil s\'en ressent, et c\'est là tout l\'intérêt : terreux, franc, un peu sauvage, avec une force médium qui ne cherche aucune finesse. Ceux qui l\'aiment y trouvent une authenticité que les grands assemblages, très travaillés, ont perdue ; ceux qui ne l\'aiment pas lui reprochent exactement la même chose.

C\'est, dans les faits, le cigare le plus fumé à Cuba, très loin devant les marques qui font la réputation de l\'île à l\'étranger. À ce titre, il en dit davantage sur le pays réel que n\'importe quelle boîte vernie.',
         '[{"name":"Petit Cazadores","color":"#8B4513","force":"Medium","wrapper":"Habano Colorado","vitolas":["Petit Cazadore"],"story":"Terreux, franc, un peu sauvage. Aucune finesse recherchée, et c\'est le propos : le cigare le plus fumé à Cuba, très loin devant les marques qui font la réputation de l\'île à l\'étranger."},{"name":"Conservas","color":"#A0522D","force":"Medium","wrapper":"Habano Colorado","vitolas":["Conserva"],"story":"Un peu plus long, vendu sans habillage. Le même tabac de Villa Clara, la même absence de mise en scène."}]',
         '[{"type":"Café","name":"Café de rue cubain","notes":"Sucré, court, brûlant. L\'accord réel, celui qu\'on voit sur les trottoirs de La Havane."},{"type":"Bière","name":"Lager glacée","notes":"Rien de sophistiqué : c\'est ce que boivent ceux qui le fument."}]', 'Cuba'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'José L. Piedra');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Guantanamera', 'cuba', '2002 — La Havane, Cuba',
         'Guantanamera est le seul havane dont l\'argument principal est d\'être fabriqué à la machine. Lancée en 2002, la marque répond à une demande que le portefeuille cubain ne couvrait pas : un cigare cubain d\'entrée de gamme, régulier, bon marché, et distribué en volume.

La mécanisation n\'est pas dissimulée. La tripe est constituée de tabac haché plutôt que de feuilles entières, ce qui change tout : la combustion est plus rapide, le tirage plus ouvert, et le développement aromatique beaucoup plus court qu\'avec un cigare roulé à la main. En échange, la régularité d\'un exemplaire à l\'autre est totale — ce qu\'aucun cigare fait main ne garantit.

Le profil est médium et direct : bois, terre, une pointe de poivre, sans les couches successives qu\'on attend d\'un havane premium. Il ne prétend pas les avoir.

Le nom vient de la chanson, elle-même tirée d\'un poème de José Martí — sans doute la mélodie cubaine la plus connue au monde, ce qui en fait un choix commercial parfaitement lisible.',
         '[{"name":"Cristales","color":"#A0522D","force":"Medium","wrapper":"Habano Colorado","vitolas":["Cristal"],"story":"Bois, terre, une pointe de poivre. Tripe hachée, combustion rapide, développement court — et une régularité d\'un exemplaire à l\'autre qu\'aucun cigare fait main ne garantit. Vendu en bocal de verre."},{"name":"Minutos","color":"#B8663A","force":"Medium","wrapper":"Habano Colorado","vitolas":["Minuto"],"story":"Vingt minutes. Le format qui assume complètement ce qu\'il est : un cigare cubain de tous les jours, régulier et bon marché."}]',
         '[{"type":"Bière","name":"Lager cubaine","notes":"L\'accord évident, et le seul qui ne demande rien au cigare qu\'il ne puisse donner."},{"type":"Café","name":"Café noir","notes":"Court comme le cigare."}]', 'Cuba'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Guantanamera');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'La Aurora', 'dominican', '1903 — Santiago de los Caballeros, République Dominicaine',
         'La Aurora est la plus ancienne manufacture de cigares de République dominicaine, et l\'une des rares maisons du secteur à être restée dans la même famille depuis sa fondation. Eduardo León Jimenes l\'ouvre en 1903 à Santiago de los Caballeros, au cœur de la vallée du Cibao — la région qui deviendra, trois quarts de siècle plus tard, le premier bassin mondial du cigare premium.

Cette antériorité compte. Quand l\'exode des fabricants cubains, après 1960, transforme le pays en capitale du cigare, La Aurora est déjà là depuis soixante ans, avec ses champs, ses séchoirs et ses rouleurs formés sur place. La maison n\'a pas eu à s\'installer : elle a accueilli.

Le style s\'en ressent. Là où beaucoup de dominicains ont cherché la douceur, La Aurora a gardé un registre médium plus charpenté, souvent bâti sur des capes cameroun — une signature qu\'elle a maintenue quand la mode s\'en détournait. Notes de bois épicé, de noisette grillée, de cuir clair.

La gamme couvre aujourd\'hui plusieurs familles, du quotidien aux séries anniversaires que la maison sort à chaque décennie franchie. Le centenaire, en 2003, a marqué un tournant : c\'est à partir de là que La Aurora s\'est fait connaître hors de son marché domestique.',
         '[{"name":"1903 Preferidos","color":"#8B4513","force":"Medium","wrapper":"Cameroun","vitolas":["Figurado"],"story":"La série qui porte l\'année de fondation, et la cape cameroun qui est la signature de la maison : bois épicé, noisette grillée, cuir clair. Un figurado, forme que La Aurora roule depuis longtemps."},{"name":"107","color":"#A0522D","force":"Medium","wrapper":"Habano Ecuador","vitolas":["Robusto"],"story":"Une série anniversaire devenue permanente. Plus contemporaine que la 1903, plus ronde, et pensée pour ceux qui découvrent la maison."}]',
         '[{"type":"Café","name":"Café dominicain du Cibao","notes":"Même vallée, même terre : l\'accord le plus direct qui soit."},{"type":"Spiritueux","name":"Rhum dominicain 12 ans","notes":"La noisette grillée du cigare trouve dans le fût son prolongement exact."}]', 'La Aurora, Santiago de los Caballeros, République Dominicaine'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'La Aurora');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'J.C. Newman', 'usa', '1895 — Cleveland, puis Tampa, États-Unis',
         'J.C. Newman est la plus ancienne entreprise familiale de cigares encore en activité aux États-Unis. Julius Caeser Newman, immigré hongrois, roule ses premiers cigares en 1895 dans la grange de ses parents à Cleveland. Quatre générations plus tard, la famille tient toujours la maison — un cas unique dans une industrie où presque toutes les enseignes historiques ont été rachetées par des groupes.

En 1954, l\'entreprise s\'installe à Tampa, en Floride, dans une fabrique de brique construite en 1910 et surmontée d\'une horloge : El Reloj. Le bâtiment est le dernier grand atelier de cigares encore en fonctionnement de Ybor City, le quartier qui produisait au début du XXe siècle plusieurs centaines de millions de cigares par an et qu\'on appelait alors la capitale mondiale du cigare.

El Reloj abrite aujourd\'hui des machines à rouler des années 1930, toujours en service, qui produisent des cigares selon un procédé que plus personne n\'emploie. La maison a fait de cette continuité son sujet : elle ouvre l\'usine aux visiteurs et documente ses machines comme un patrimoine industriel.

Côté premium, la famille produit et distribue plusieurs gammes fabriquées en République dominicaine, dont Diamond Crown, née pour le centenaire de 1995.',
         '[{"name":"Diamond Crown","color":"#C9A227","force":"Medium","wrapper":"Connecticut Shade","vitolas":["Robusto"],"story":"Née pour le centenaire de 1995, roulée en République dominicaine chez Fuente. Cape Connecticut, module épais, registre doux à médium — la gamme haute de la maison."},{"name":"El Reloj","color":"#8B4513","force":"Medium","wrapper":"Habano","vitolas":["Corona"],"story":"Le nom de l\'usine de Tampa, et l\'hommage aux machines des années 1930 qui y tournent encore. Un cigare qui raconte un procédé que plus personne n\'emploie."}]',
         '[{"type":"Spiritueux","name":"Bourbon du Kentucky","notes":"Le maïs et la vanille du bourbon avec une cape Connecticut : l\'accord américain par excellence."},{"type":"Café","name":"Café cubain de Tampa","notes":"Ybor City l\'a inventé ; il n\'y a pas plus juste pour accompagner El Reloj."}]', 'El Reloj, Tampa, Floride, États-Unis'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'J.C. Newman');

-- ── 2. Les noms entrent dans la liste de leur pays ──────
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Ramón Allones","desc":"1837, et l\'invention de la boîte imprimée","iconic":true}' AS JSON))
  WHERE `id` = 'cuba' AND JSON_SEARCH(`brands`, 'one', 'Ramón Allones', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"El Rey del Mundo","desc":"1848, la douceur d\'avant la mode de la puissance","iconic":false}' AS JSON))
  WHERE `id` = 'cuba' AND JSON_SEARCH(`brands`, 'one', 'El Rey del Mundo', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"La Gloria Cubana","desc":"1885, et les Medaille d\'Or d\'avant-guerre","iconic":false}' AS JSON))
  WHERE `id` = 'cuba' AND JSON_SEARCH(`brands`, 'one', 'La Gloria Cubana', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Juan López","desc":"1876, une marque que se transmettent les initiés","iconic":false}' AS JSON))
  WHERE `id` = 'cuba' AND JSON_SEARCH(`brands`, 'one', 'Juan López', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Por Larrañaga","desc":"1834, la doyenne encore produite","iconic":false}' AS JSON))
  WHERE `id` = 'cuba' AND JSON_SEARCH(`brands`, 'one', 'Por Larrañaga', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Rafael González","desc":"1928, et l\'avis de fumer jeune inscrit sur la boîte","iconic":false}' AS JSON))
  WHERE `id` = 'cuba' AND JSON_SEARCH(`brands`, 'one', 'Rafael González', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Sancho Panza","desc":"1848, l\'écuyer plutôt que le chevalier","iconic":false}' AS JSON))
  WHERE `id` = 'cuba' AND JSON_SEARCH(`brands`, 'one', 'Sancho Panza', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Saint Luis Rey","desc":"Une marque anglaise à l\'assemblage cubain corsé","iconic":false}' AS JSON))
  WHERE `id` = 'cuba' AND JSON_SEARCH(`brands`, 'one', 'Saint Luis Rey', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Diplomáticos","desc":"1966, créée pour le marché français","iconic":false}' AS JSON))
  WHERE `id` = 'cuba' AND JSON_SEARCH(`brands`, 'one', 'Diplomáticos', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Fonseca","desc":"Le seul havane vendu enveloppé de papier de soie","iconic":false}' AS JSON))
  WHERE `id` = 'cuba' AND JSON_SEARCH(`brands`, 'one', 'Fonseca', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Cuaba","desc":"1996, le retour du double figurado","iconic":false}' AS JSON))
  WHERE `id` = 'cuba' AND JSON_SEARCH(`brands`, 'one', 'Cuaba', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"San Cristóbal de La Habana","desc":"1999, les quatre forteresses de La Havane","iconic":false}' AS JSON))
  WHERE `id` = 'cuba' AND JSON_SEARCH(`brands`, 'one', 'San Cristóbal de La Habana', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Vegueros","desc":"Le cigare des cultivateurs de Pinar del Río","iconic":false}' AS JSON))
  WHERE `id` = 'cuba' AND JSON_SEARCH(`brands`, 'one', 'Vegueros', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Quai d\'Orsay","desc":"1973, un havane composé pour le goût français","iconic":false}' AS JSON))
  WHERE `id` = 'cuba' AND JSON_SEARCH(`brands`, 'one', 'Quai d\'Orsay', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"José L. Piedra","desc":"Le havane rustique, roulé en feuilles entières","iconic":false}' AS JSON))
  WHERE `id` = 'cuba' AND JSON_SEARCH(`brands`, 'one', 'José L. Piedra', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Guantanamera","desc":"2002, le havane mécanisé assumé","iconic":false}' AS JSON))
  WHERE `id` = 'cuba' AND JSON_SEARCH(`brands`, 'one', 'Guantanamera', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"La Aurora","desc":"1903, la plus ancienne manufacture dominicaine","iconic":true}' AS JSON))
  WHERE `id` = 'dominican' AND JSON_SEARCH(`brands`, 'one', 'La Aurora', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"J.C. Newman","desc":"1895, le plus ancien fabricant familial américain","iconic":true}' AS JSON))
  WHERE `id` = 'usa' AND JSON_SEARCH(`brands`, 'one', 'J.C. Newman', NULL, '$[*].name') IS NULL;
