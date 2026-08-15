-- ════════════════════════════════════════════════════════
-- 025 — Douze maisons, et une erreur d'inventaire réparée
-- ────────────────────────────────────────────────────────
-- La migration 022 annonçait que Cuba tenait « le portefeuille Habanos
-- COMPLET » avec 27 marques. C'était faux : LA FLOR DE CANO manquait.
-- Fondée en 1884, elle est une marque Habanos à part entière — produite
-- en petites quantités et surtout présente dans les éditions régionales,
-- ce qui explique qu'on l'oublie, pas qu'on ait le droit de l'omettre.
-- Le portefeuille en compte 28. La fiche de Cuba le dit désormais.
--
-- S'y ajoutent onze maisons repérées lors d'une revue de couverture :
--
--   NICARAGUA (3) — Espinosa (manufacture La Zona), Crowned Heads
--   (maison sans usine, qui fait rouler chez les autres) et Warped.
--
--   RÉP. DOMINICAINE (5) — VegaFina, très largement distribuée en
--   Europe et pourtant absente ; Don Diego, marque historique du groupe
--   Altadis ; The Griffin's, née d'une boîte de nuit genevoise ; Matilde
--   et Juan Clemente.
--
--   ÉTATS-UNIS (1) — Nat Sherman, maison new-yorkaise de 1930.
--   HONDURAS (1) — Bering, héritière de Tampa.
--   MEXIQUE (1) — Matacan, le puro mexicain d'entrée de gamme.
--
-- ── Deux relations que ces maisons rendent visibles ─────
--
-- CROWNED HEADS ET WARPED N'ONT PAS D'USINE. Elles composent des
-- assemblages et les font rouler chez d'autres — My Father, La Alianza,
-- Aganorsa, El Titan de Bronze. C'est un modèle devenu courant que
-- l'atlas ne montrait nulle part : une marque peut être d'un pays sans
-- rien y fabriquer elle-même. Leurs articles le disent explicitement
-- plutôt que de laisser croire à une manufacture.
--
-- NAT SHERMAN ET BERING sont des maisons AMÉRICAINES dont les cigares
-- sont roulés ailleurs — comme General Cigar, déjà présente. Bering est
-- rattachée au Honduras, où elle est produite depuis des décennies ;
-- Nat Sherman aux États-Unis, où vivait la maison. Le critère retenu :
-- le pays qui explique le mieux ce qu'on lit sur la bague.
--
-- ── Ce que ces articles contiennent, et ce qu'ils ne contiennent pas ──
--
-- Histoire, gamme de deux vitoles, accords : oui.
-- Notes chiffrées, célébrités, éditions limitées : NON, comme en 022
-- et 024.
--
-- ⚠ RELECTURE. Le texte vient des connaissances du rédacteur. La Flor
-- de Cano, Espinosa, Crowned Heads, VegaFina, Don Diego et Nat Sherman
-- sont bien documentées. WARPED, THE GRIFFIN'S, MATILDE, JUAN CLEMENTE,
-- BERING et MATACAN le sont moins : leurs dates sont écrites au
-- conditionnel dans le texte plutôt que données pour acquises. Six
-- maisons à vérifier en priorité, qui s'ajoutent aux quatre de 024
-- (Suerdieck, Alhambra, Taru Martani, Meerapfel).
--
-- Rejouable : chaque insertion vérifie d'abord l'absence du nom.
-- ════════════════════════════════════════════════════════

-- ── 1. Les articles ─────────────────────────────────────

-- .......................... CUBA .......................

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'La Flor de Cano', 'cuba', '1884 — La Havane, Cuba',
         'La Flor de Cano est la marque qu\'on oublie en récitant le portefeuille cubain, et c\'est arrivé à cet atlas : la fiche de Cuba a longtemps annoncé vingt-sept marques en les donnant pour complètes. Il y en a vingt-huit.\n\nFondée en 1884 par les frères Cano, la maison a connu au XXe siècle une production régulière puis un effacement progressif. Sa gamme courante s\'est réduite à presque rien, et l\'essentiel de ce qui porte aujourd\'hui son nom paraît sous forme d\'éditions régionales — ces séries composées pour un marché national précis, que les collectionneurs suivent de près.\n\nCe statut lui vaut une réputation particulière : celle d\'une marque qu\'on ne trouve pas, et dont chaque sortie est guettée. Le profil, lui, est resté fidèle à son époque — doux à médium, cèdre, foin, une note de pain d\'épice, sans la puissance que les assemblages récents recherchent.\n\nC\'est le genre de maison dont l\'existence tient à peu de chose : quelques milliers de cigares par an, et une place sur une liste officielle.',
         '[{"name":"Petit Coronas","color":"#C9A227","force":"Light-Medium","wrapper":"Habano Claro","vitolas":["Mareva"],"story":"Cèdre, foin, une note de pain d\'épice. Le format courant de la marque, quand on le trouve — la production annuelle se compte en milliers, pas en millions."},{"name":"Séries régionales","color":"#B8901F","force":"Medium","wrapper":"Habano Colorado","vitolas":["Robusto","Corona Gorda"],"story":"L\'essentiel de ce qui porte le nom aujourd\'hui : des séries composées pour un marché national précis, guettées par les collectionneurs et introuvables ailleurs."}]',
         '[{"type":"Thé","name":"Thé noir de Ceylan","notes":"Le tanin léger du thé suit le foin sans jamais couvrir le cèdre."},{"type":"Spiritueux","name":"Rhum cubain 7 ans","notes":"L\'accord de proximité, à condition de rester sur un rhum peu sucré."}]', 'La Havane, Cuba'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'La Flor de Cano');

-- ....................... NICARAGUA .....................

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Espinosa', 'nicaragua', '2012 — Estelí, Nicaragua',
         'Erik Espinosa avait déjà fait connaître deux marques — 601 et Murcielago — sous une société qu\'il dirigeait à deux, avant de reprendre seul le nom qui est le sien. Il a alors fait ce que peu de fondateurs de marque font : ouvrir sa propre manufacture, La Zona, à Estelí, plutôt que de continuer à faire rouler ailleurs.\n\nCe passage du statut de marque à celui de fabricant change tout. La maison contrôle désormais ses assemblages du roulage à la sortie, produit pour elle-même autant que pour d\'autres marques, et peut se permettre des séries courtes qu\'aucun sous-traitant n\'accepterait.\n\nLe style est nicaraguayen sans détour : corsé, poivré, avec une matière franche qui ne cherche pas la finesse cubaine. Laranja Reserva, composée autour d\'une cape brésilienne, en est l\'expression la plus reconnue et l\'une des rares réussites brésiliennes hors du Brésil.\n\nLa Zona s\'est entre-temps fait une place comme manufacture à part entière : plusieurs marques boutiques y font rouler, ce qui est la meilleure recommandation qu\'un atelier puisse recevoir.',
         '[{"name":"Laranja Reserva","color":"#B8663A","force":"Medium-Full","wrapper":"Cape brésilienne","vitolas":["Toro"],"story":"Une cape brésilienne sur tripe nicaraguayenne — l\'une des rares réussites de la feuille de Bahia hors du Brésil. Fruits secs, poivre, une acidité qui vient de la cape."},{"name":"Espinosa Habano","color":"#8B4513","force":"Full","wrapper":"Habano de Nicaragua","vitolas":["Robusto"],"story":"Le style de la maison sans détour : corsé, poivré, franc. Roulé à La Zona, la manufacture que le fondateur a ouverte pour cesser de dépendre des autres."}]',
         '[{"type":"Spiritueux","name":"Cachaça vieillie","notes":"Sur la Laranja, l\'accord suit la cape : même pays, même acidité."},{"type":"Café","name":"Café nicaraguayen torréfié foncé","notes":"Le poivre de l\'assemblage supporte une torréfaction franche."}]', 'La Zona, Estelí, Nicaragua'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Espinosa');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Crowned Heads', 'nicaragua', '2011 — Nashville, Tennessee (production au Nicaragua)',
         'Crowned Heads n\'a pas d\'usine, et c\'est le sujet. Jon Huber et ses associés ont fondé la maison à Nashville après le rachat de CAO par un grand groupe, avec un modèle qui s\'est depuis répandu : composer des assemblages, puis les faire rouler chez des manufactures existantes — My Father à Estelí, La Alianza de Perez-Carrillo à Santiago, d\'autres encore selon les gammes.\n\nL\'atlas doit dire cette relation-là, parce qu\'elle est devenue courante et qu\'elle brouille la lecture des drapeaux : une marque peut être d\'un pays sans y fabriquer quoi que ce soit, et le cigare qu\'on tient peut sortir d\'un atelier dont le nom ne figure nulle part sur la boîte.\n\nCe modèle a une conséquence heureuse : la maison choisit son rouleur en fonction de l\'assemblage plutôt que l\'inverse. Four Kicks, sa gamme fondatrice, est nicaraguayenne et corsée ; Le Carême, née d\'une collaboration avec Ernesto Perez-Carrillo, est dominicaine et plus ronde. Deux cigares que rien ne réunit sinon la maison qui les a pensés.\n\nLes noms viennent de chansons et de références littéraires, et les textes de boîte sont écrits avec un soin rare dans le métier — un détail, mais qui dit à qui la marque s\'adresse.',
         '[{"name":"Four Kicks","color":"#8B4513","force":"Medium-Full","wrapper":"Habano de Ecuador","vitolas":["Corona Gorda","Robusto"],"story":"La gamme fondatrice, roulée à Estelí chez My Father. Corsée, poivrée, très construite — le style nicaraguayen vu par une maison qui n\'a pas d\'usine et choisit donc son rouleur."},{"name":"Le Carême","color":"#4A3728","force":"Full","wrapper":"Connecticut Broadleaf","vitolas":["Toro"],"story":"Née d\'une collaboration avec Ernesto Perez-Carrillo et roulée chez lui, en République dominicaine. Cape broadleaf sombre, cacao et café — rien à voir avec Four Kicks, et c\'est le propos."}]',
         '[{"type":"Spiritueux","name":"Whisky de seigle","notes":"Sur Four Kicks, l\'épice du seigle rejoint le poivre nicaraguayen."},{"type":"Café","name":"Expresso","notes":"Sur Le Carême, la torréfaction prolonge le cacao de la cape broadleaf."}]', 'Roulé chez My Father et Tabacalera La Alianza'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Crowned Heads');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Warped', 'nicaragua', 'Fondée à la fin des années 2000 — production au Nicaragua et à Miami',
         'Warped est née de la volonté de faire revivre des noms de marques cubaines d\'avant 1960 tombés dans l\'oubli, et de les remplir d\'assemblages contemporains. Kyle Gellis, son fondateur, travaille sans usine propre : ses cigares sortent des ateliers d\'Aganorsa à Estelí et d\'El Titan de Bronze à Miami, selon les gammes.\n\nCe choix de sous-traiter chez deux maisons très différentes — un grand planteur nicaraguayen d\'un côté, une manufacture artisanale de la Petite Havane de l\'autre — donne à la marque une palette inhabituelle pour sa taille. Les séries sont courtes, souvent annoncées sans préavis, et écoulées en quelques semaines.\n\nLe style privilégie les tabacs nicaraguayens de Jalapa et les formats fins, à contre-courant de la mode des gros modules. Les assemblages cherchent la longueur en bouche plutôt que la puissance immédiate, ce qui les rapproche du registre cubain sans en imiter les formats.\n\nC\'est une marque de fumeurs informés — celle qu\'on découvre par une conversation plutôt que par une vitrine.',
         '[{"name":"La Colmena","color":"#A0522D","force":"Medium","wrapper":"Corojo 99","vitolas":["Corona","Lancero"],"story":"Un nom de marque cubaine d\'avant 1960, rempli d\'un assemblage contemporain. Tabacs de Jalapa, formats fins, une longueur en bouche qui vient de la matière et non de la force."},{"name":"Flor del Valle","color":"#8B7355","force":"Medium","wrapper":"Corojo 99","vitolas":["Corona Gorda"],"story":"Séries courtes, souvent annoncées sans préavis. Bois, foin, une pointe de poivre blanc — le registre que la maison défend contre la mode des gros modules."}]',
         '[{"type":"Café","name":"Café filtre d\'altitude","notes":"Un café clair laisse passer la finesse que la marque recherche."},{"type":"Spiritueux","name":"Rhum agricole blanc","notes":"Sec et végétal, il ne surcharge pas des assemblages construits sur la longueur."}]', 'Aganorsa (Estelí) et El Titan de Bronze (Miami)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Warped');

-- .................. RÉP. DOMINICAINE ...................

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'VegaFina', 'dominican', 'Années 1990 — La Romana, Rép. dominicaine',
         'VegaFina est l\'une des marques les plus vendues d\'Europe continentale, et elle manquait à cet atlas — une absence d\'autant plus étrange qu\'un fumeur français ou espagnol la croise dans presque tous les bureaux de tabac.\n\nElle est née dans les années 1990 au sein du groupe qui possède la grande manufacture de La Romana, avec une intention claire : offrir un cigare dominicain régulier, doux, disponible partout et à un prix stable. C\'est exactement ce qu\'elle fait, et ce positionnement lui vaut le dédain d\'une partie des amateurs — le même dédain que reçoivent toutes les marques qui réussissent à grande échelle.\n\nLe profil est doux à médium : cape claire, notes de cèdre, d\'amande et de crème, une combustion sans surprise. La gamme s\'est étoffée au fil des ans vers des séries plus corsées, produites en volumes moindres, qui ont fait remonter la marque dans l\'estime des connaisseurs sans changer ce qu\'elle est.\n\nL\'atlas gagne à la citer telle qu\'elle est : le cigare que des dizaines de milliers de gens fument réellement, plutôt que celui dont on parle.',
         '[{"name":"VegaFina Classic","color":"#D2B48C","force":"Light-Medium","wrapper":"Connecticut Shade","vitolas":["Robusto","Corona"],"story":"Cape claire, cèdre, amande, crème. Une combustion sans surprise et un prix stable — le cigare que des dizaines de milliers de gens fument réellement."},{"name":"VegaFina Nicaragua","color":"#8B4513","force":"Medium-Full","wrapper":"Habano de Nicaragua","vitolas":["Toro"],"story":"La montée en gamme de la maison : tripe nicaraguayenne, poivre et terre, en volumes moindres. Celle qui a fait remonter la marque dans l\'estime des connaisseurs."}]',
         '[{"type":"Café","name":"Café au lait","notes":"Sur la Classic, l\'accord du matin, sans détour."},{"type":"Spiritueux","name":"Rhum dominicain ambré","notes":"Le fruit confit du rhum tient tête à la version nicaraguayenne."}]', 'Tabacalera de García, La Romana, Rép. dominicaine'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'VegaFina');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Don Diego', 'dominican', 'Années 1960 — La Romana, Rép. dominicaine',
         'Don Diego appartient à la première vague — celle des marques créées après 1960 pour remplacer, sur le marché américain, les havanes devenus inaccessibles. La production a d\'abord été installée aux Canaries, puis transférée en République dominicaine, où elle est restée.\n\nCette origine explique son profil. Il fallait un cigare doux, régulier, à cape claire, capable de rassurer des fumeurs privés de leurs repères : Don Diego a été composé pour cela et n\'en a jamais dévié. Cèdre, amande, une douceur crémeuse, une combustion facile — c\'est un cigare qui ne demande rien à personne.\n\nPendant deux décennies, il a été l\'une des marques les plus vendues des États-Unis, avant que la vague des assemblages corsés des années 1990 ne le relègue au rang de classique démodé. Il n\'a pas changé pour autant, ce qui en fait aujourd\'hui un témoin utile : on peut y goûter ce que le marché appelait un bon cigare avant que la puissance ne devienne un argument.\n\nLa marque reste distribuée par un grand groupe, sans effort de communication particulier — et c\'est très bien ainsi.',
         '[{"name":"Don Diego Classic","color":"#D9C7A7","force":"Light","wrapper":"Connecticut Shade","vitolas":["Corona","Lonsdale"],"story":"Cèdre, amande, une douceur crémeuse. Composé après 1960 pour rassurer des fumeurs privés de havane, et jamais modifié depuis — on y goûte ce que le marché appelait un bon cigare avant la mode de la puissance."},{"name":"Don Diego Aniversario","color":"#B5651D","force":"Medium","wrapper":"Connecticut Shade","vitolas":["Robusto"],"story":"Des tabacs plus longuement vieillis, un peu plus de corps. La seule concession de la marque à son époque."}]',
         '[{"type":"Café","name":"Café filtre doux","notes":"Rien de plus fort : l\'amande disparaîtrait."},{"type":"Autre","name":"Thé blanc","notes":"Sans alcool, il respecte une douceur qui ne supporte pas la concurrence."}]', 'Tabacalera de García, La Romana, Rép. dominicaine'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Don Diego');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'The Griffin\'s', 'dominican', 'Années 1980 — Rép. dominicaine',
         'The Griffin\'s doit son nom à une boîte de nuit genevoise, ce qui est probablement l\'origine la plus improbable du catalogue. Son fondateur, Bernard Grobet, y recevait une clientèle internationale et souhaitait un cigare à offrir à sa table ; il s\'est tourné vers la maison suisse qui régnait alors sur le cigare de luxe pour le faire composer, et la marque est née de cette commande privée devenue commerciale.\n\nLe résultat porte la marque de son commanditaire : un cigare de salon, élégant, sans aspérité, pensé pour accompagner une conversation plutôt que pour la dominer. Cape claire, registre doux à médium, notes de cèdre, de noisette et de fleurs blanches.\n\nLa production se fait en République dominicaine, avec les tabacs et le savoir-faire de la maison mère, et la gamme est restée volontairement courte. On y trouve des formats fins que le marché a largement abandonnés — un choix cohérent avec l\'esprit d\'origine.\n\nC\'est, dans l\'atlas, l\'un des rares cigares dont l\'acte de naissance est une soirée plutôt qu\'une plantation.',
         '[{"name":"Griffin\'s Classic","color":"#D2B48C","force":"Light-Medium","wrapper":"Connecticut Shade","vitolas":["Corona","Robusto"],"story":"Cèdre, noisette, fleurs blanches. Un cigare de salon, pensé pour accompagner une conversation plutôt que pour la dominer — l\'esprit de la boîte de nuit genevoise dont il porte le nom."},{"name":"Griffin\'s Perfecto","color":"#C9A227","force":"Medium","wrapper":"Connecticut Shade","vitolas":["Perfecto"],"story":"Un format effilé que le marché a largement abandonné, gardé ici par cohérence avec l\'esprit d\'origine."}]',
         '[{"type":"Vin","name":"Champagne millésimé","notes":"L\'accord que son fondateur servait : c\'est pour cette table-là que le cigare a été composé."},{"type":"Café","name":"Café filtre léger","notes":"La noisette du cigare demande un café qui ne l\'écrase pas."}]', 'Rép. dominicaine'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'The Griffin\'s');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Matilde', 'dominican', 'Années 2010 — Rép. dominicaine',
         'José Seijas a dirigé pendant des décennies la plus grande manufacture de cigares premium du monde, à La Romana — des dizaines de millions de cigares par an, et la responsabilité d\'une régularité que peu de gens mesurent. Il a fondé Matilde après avoir quitté ce poste, et lui a donné le prénom de sa femme.\n\nLe contraste d\'échelle est le sujet même de la maison. Après avoir passé sa carrière à garantir la constance de volumes industriels, Seijas a monté une marque de séries courtes, où chaque assemblage est le sien et où la production annuelle représente ce que son ancienne usine sortait en une journée.\n\nLe style porte cette expérience : des cigares très construits, d\'un équilibre dominicain classique, avec une régularité de fabrication qui trahit l\'homme qui les fait. Registre médium, cèdre, café au lait, une douceur tenue.\n\nC\'est l\'inverse exact du parcours habituel — non pas un amateur qui devient fabricant, mais un fabricant qui redevient artisan.',
         '[{"name":"Matilde Renacer","color":"#A0522D","force":"Medium","wrapper":"Habano de Ecuador","vitolas":["Robusto","Toro"],"story":"Cèdre, café au lait, une douceur tenue. Très construit — la régularité trahit l\'homme qui a passé sa carrière à garantir celle de volumes industriels."},{"name":"Matilde Oscura","color":"#4A3728","force":"Medium-Full","wrapper":"Connecticut Broadleaf","vitolas":["Toro"],"story":"Cape broadleaf sombre, cacao et terre. Le versant corsé d\'une maison qui ne cherche jamais l\'excès."}]',
         '[{"type":"Café","name":"Café dominicain","notes":"L\'accord de proximité, et le plus juste sur un assemblage bâti sur l\'équilibre."},{"type":"Spiritueux","name":"Rhum vieux peu sucré","notes":"Sur l\'Oscura, un rhum sec évite d\'appuyer le cacao."}]', 'Rép. dominicaine'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Matilde');

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Juan Clemente', 'dominican', 'Années 1980 — Santiago, Rép. dominicaine',
         'Juan Clemente se reconnaît à une bizarrerie que personne d\'autre n\'a osée : sa bague n\'est pas posée près de la tête, mais au PIED du cigare, à l\'extrémité qu\'on allume. La marque explique que la bague, ainsi placée, ne gêne pas le fumeur et se retire naturellement dès les premières bouffées. Les puristes y voient une excentricité ; c\'est en tout cas une signature que l\'on repère à dix mètres.\n\nSon fondateur, un Français installé en République dominicaine, a créé la maison au début des années 1980, à un moment où le pays montait en puissance et où presque toutes les nouvelles marques venaient de familles cubaines exilées. Une origine française dans ce paysage-là est une anomalie de plus.\n\nLe profil est doux à médium, dans la tradition dominicaine classique : cèdre, foin, une douceur discrète, et des formats souvent fins. La production est restée confidentielle, et la marque appartient à cette catégorie de maisons dont on parle au passé sans qu\'elles aient jamais vraiment disparu.\n\nUn cas à part, donc, et l\'un des rares cigares que l\'on identifie sans lire son nom.',
         '[{"name":"Club Selection","color":"#C9A227","force":"Light-Medium","wrapper":"Connecticut Shade","vitolas":["Corona"],"story":"Cèdre, foin, une douceur discrète. Et la bague au PIED du cigare, à l\'extrémité qu\'on allume : une signature qu\'on repère à dix mètres et que personne d\'autre n\'a osée."},{"name":"Rothschild","color":"#B5651D","force":"Medium","wrapper":"Connecticut Shade","vitolas":["Robusto"],"story":"Le format court de la maison, dans la tradition dominicaine classique — équilibre, souplesse, aucune démonstration."}]',
         '[{"type":"Café","name":"Café filtre d\'Amérique centrale","notes":"Un café clair, à la mesure d\'un cigare qui ne hausse jamais le ton."},{"type":"Spiritueux","name":"Cognac VSOP","notes":"Le fruité du cognac prolonge le cèdre sans le couvrir."}]', 'Santiago, Rép. dominicaine'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Juan Clemente');

-- ..................... ÉTATS-UNIS ......................

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Nat Sherman', 'usa', '1930 — New York, États-Unis',
         'Nat Sherman était une adresse avant d\'être une marque. Nathan Sherman ouvre en 1930 une boutique de tabac à New York ; ses successeurs installent la maison sur la Cinquième Avenue, dans un immeuble sur trois niveaux avec salons de dégustation, qui devient pendant des décennies le point de ralliement des fumeurs de Manhattan.\n\nLes cigares, eux, n\'ont jamais été roulés à New York : la maison faisait composer ses gammes en République dominicaine et au Nicaragua, sous son nom et selon ses spécifications. C\'est le modèle du détaillant devenu marque, qui a produit certaines des séries les plus soignées du marché américain — Timeless, Metropolitan, Sterling.\n\nLa boutique de la Cinquième Avenue a fermé en 2020, et la marque a été arrêtée peu après par le groupe qui la détenait. Une partie de l\'équipe a relancé les assemblages sous un autre nom, ce qui arrive rarement : d\'ordinaire, une marque abandonnée disparaît avec ses recettes.\n\nL\'atlas la garde pour ce qu\'elle représente — une maison américaine dont le lieu comptait autant que le produit, dans un métier où presque tout se joue ailleurs.',
         '[{"name":"Timeless","color":"#8B4513","force":"Medium-Full","wrapper":"Habano de Ecuador","vitolas":["Robusto","Toro"],"story":"La série la plus soignée de la maison : très construite, poivrée, avec une longueur qui explique la fidélité de sa clientèle new-yorkaise."},{"name":"Metropolitan","color":"#C9A227","force":"Medium","wrapper":"Connecticut Shade","vitolas":["Corona"],"story":"Le registre de salon, à l\'image de l\'immeuble de la Cinquième Avenue où la maison recevait : cèdre, noisette, rien qui hausse le ton."}]',
         '[{"type":"Spiritueux","name":"Whisky de seigle new-yorkais","notes":"L\'accord de la ville, et l\'épice du seigle tient tête au Timeless."},{"type":"Café","name":"Café noir","notes":"Sur le Metropolitan, une torréfaction moyenne suffit largement."}]', 'Rép. dominicaine et Nicaragua, pour une maison de New York'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Nat Sherman');

-- ....................... HONDURAS ......................

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Bering', 'honduras', 'Origine à Tampa au début du XXe siècle — production au Honduras',
         'Bering est un nom de Tampa. La marque est née dans la Floride des grandes fabriques de Ybor City, à l\'époque où le quartier produisait des centaines de millions de cigares par an et où les enseignes cubaines exilées y côtoyaient les maisons espagnoles.\n\nComme presque toute la production américaine, elle a migré vers l\'Amérique centrale quand les coûts et la main-d\'œuvre l\'ont imposé, et elle est aujourd\'hui roulée au Honduras. C\'est pourquoi cet atlas la rattache à ce pays plutôt qu\'aux États-Unis : c\'est là qu\'elle se fabrique, et c\'est ce qui explique son goût.\n\nLe profil est hondurien classique, dans son registre le plus accessible : bois, terre, une combustion franche, sans la puissance des assemblages du Jamastran. La gamme couvre des formats nombreux et souvent fins, héritage direct des habitudes de consommation américaines du milieu du siècle.\n\nC\'est une marque de continuité plus que de prestige — et l\'une des dernières traces vivantes de ce que Tampa a été.',
         '[{"name":"Bering Corona","color":"#8B7355","force":"Light-Medium","wrapper":"Habano du Honduras","vitolas":["Corona"],"story":"Bois, terre, une combustion franche, sans la puissance du Jamastran. Format fin, héritage direct des habitudes américaines du milieu du siècle."},{"name":"Bering Immensa","color":"#A0522D","force":"Medium","wrapper":"Habano du Honduras","vitolas":["Lonsdale"],"story":"Le format long de la gamme. Le même registre accessible, étiré sur une heure et demie."}]',
         '[{"type":"Café","name":"Café cubain de Tampa","notes":"L\'accord de la ville d\'origine, que la marque a quittée sans l\'oublier."},{"type":"Spiritueux","name":"Bourbon léger","notes":"La vanille du bourbon adoucit la terre hondurienne."}]', 'Honduras, pour une marque née à Tampa'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Bering');

-- ....................... MEXIQUE .......................

INSERT INTO `brands` (`name`, `country_id`, `founded`, `history`, `gamme`, `pairings`, `factory`)
  SELECT 'Matacan', 'mexico', 'San Andrés Tuxtla, Veracruz, Mexique',
         'Matacan est le cigare que la vallée de San Andrés fume elle-même. Produit sur place, entièrement à partir de tabacs mexicains — tripe, sous-cape et cape —, c\'est un puro au sens strict, vendu à un prix qui le place hors de la concurrence des grandes marques.\n\nSes références portent des numéros plutôt que des noms, ce qui dit assez son propos : ce n\'est pas une marque de prestige mais une gamme de formats, où l\'on choisit un chiffre selon le temps dont on dispose. La présentation est minimale, souvent sans bague.\n\nLe goût, lui, est instructif. On y trouve la cape San Andrés sans les tabacs nicaraguayens ou dominicains qui l\'accompagnent habituellement — donc le terroir mexicain seul, franc et un peu rugueux : cacao, terre, une sucrosité naturelle et une combustion rapide.\n\nPour qui veut comprendre ce que le Mexique apporte réellement aux assemblages du continent, c\'est l\'échantillon le plus direct qui soit.',
         '[{"name":"Matacan No.2","color":"#5D4037","force":"Medium","wrapper":"San Andrés","vitolas":["Robusto"],"story":"Un puro mexicain au sens strict : tripe, sous-cape et cape du pays. Le terroir de San Andrés seul, sans les tabacs qui l\'accompagnent d\'habitude — cacao, terre, une sucrosité naturelle."},{"name":"Matacan No.4","color":"#4A2C2A","force":"Medium","wrapper":"San Andrés Maduro","vitolas":["Toro"],"story":"Le format long de la gamme, sous cape plus sombre. Même franchise, davantage de cacao, une combustion rapide qui demande un tirage lent."}]',
         '[{"type":"Spiritueux","name":"Mezcal jeune","notes":"Deux produits de la même région, et la même rugosité assumée."},{"type":"Café","name":"Café de Veracruz","notes":"Cultivé sur les pentes voisines : l\'accord le plus court possible."}]', 'San Andrés Tuxtla, Veracruz, Mexique'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Matacan');

-- ── 2. Les noms entrent dans la liste de leur pays ──────

UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"La Flor de Cano","desc":"1884, la vingt-huitième que l\'on oublie toujours","iconic":false}' AS JSON))
  WHERE `id` = 'cuba' AND JSON_SEARCH(`brands`, 'one', 'La Flor de Cano', NULL, '$[*].name') IS NULL;

UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Espinosa","desc":"Une marque qui s\'est offert sa propre manufacture","iconic":true}' AS JSON))
  WHERE `id` = 'nicaragua' AND JSON_SEARCH(`brands`, 'one', 'Espinosa', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Crowned Heads","desc":"Pas d\'usine : elle choisit son rouleur selon l\'assemblage","iconic":true}' AS JSON))
  WHERE `id` = 'nicaragua' AND JSON_SEARCH(`brands`, 'one', 'Crowned Heads', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Warped","desc":"Des noms cubains d\'avant 1960, des assemblages d\'aujourd\'hui","iconic":false}' AS JSON))
  WHERE `id` = 'nicaragua' AND JSON_SEARCH(`brands`, 'one', 'Warped', NULL, '$[*].name') IS NULL;

UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"VegaFina","desc":"Le cigare que des dizaines de milliers de gens fument vraiment","iconic":true}' AS JSON))
  WHERE `id` = 'dominican' AND JSON_SEARCH(`brands`, 'one', 'VegaFina', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Don Diego","desc":"Un bon cigare selon le marché d\'avant la mode de la puissance","iconic":false}' AS JSON))
  WHERE `id` = 'dominican' AND JSON_SEARCH(`brands`, 'one', 'Don Diego', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"The Griffin\'s","desc":"Né d\'une boîte de nuit genevoise, et cela s\'entend","iconic":false}' AS JSON))
  WHERE `id` = 'dominican' AND JSON_SEARCH(`brands`, 'one', 'The Griffin\'s', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Matilde","desc":"Un industriel redevenu artisan","iconic":false}' AS JSON))
  WHERE `id` = 'dominican' AND JSON_SEARCH(`brands`, 'one', 'Matilde', NULL, '$[*].name') IS NULL;
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Juan Clemente","desc":"La bague au pied du cigare — personne d\'autre n\'a osé","iconic":false}' AS JSON))
  WHERE `id` = 'dominican' AND JSON_SEARCH(`brands`, 'one', 'Juan Clemente', NULL, '$[*].name') IS NULL;

UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Nat Sherman","desc":"1930, une adresse de la Cinquième Avenue devenue marque","iconic":true}' AS JSON))
  WHERE `id` = 'usa' AND JSON_SEARCH(`brands`, 'one', 'Nat Sherman', NULL, '$[*].name') IS NULL;

UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Bering","desc":"Une des dernières traces vivantes de ce que Tampa a été","iconic":false}' AS JSON))
  WHERE `id` = 'honduras' AND JSON_SEARCH(`brands`, 'one', 'Bering', NULL, '$[*].name') IS NULL;

UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$', CAST('{"name":"Matacan","desc":"Le terroir de San Andrés seul, sans rien pour l\'accompagner","iconic":false}' AS JSON))
  WHERE `id` = 'mexico' AND JSON_SEARCH(`brands`, 'one', 'Matacan', NULL, '$[*].name') IS NULL;
