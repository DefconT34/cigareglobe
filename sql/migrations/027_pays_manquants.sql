-- ════════════════════════════════════════════════════════
-- 027 — Trois pays producteurs, et trois qui ne passent pas
-- ────────────────────────────────────────────────────────
-- L'atlas comptait douze pays producteurs. Six autres avaient été
-- signalés comme manquants : Costa Rica, Pérou, Colombie, Haïti,
-- Jamaïque, Canaries. Chacun a été vérifié sur sources avant d'écrire
-- une ligne — c'est la leçon de la migration 026.
--
-- TROIS PASSENT :
--
--   JAMAÏQUE. Dans les années 1960-1970, après l'embargo américain,
--   c'était le premier pays du cigare des Caraïbes hors de Cuba. Royal
--   Jamaica (1935) et la manufacture Temple Hall de Kingston — où
--   MACANUDO est né avant de devenir dominicain — en étaient les noms.
--   Le 12 septembre 1988, l'ouragan Gilbert a détruit l'usine de
--   Kingston et mille acres de tabac à May Pen. L'industrie ne s'en est
--   pas relevée : les marques ont été rachetées et transférées en
--   République dominicaine dans l'année.
--
--   ÎLES CANARIES. C'est de là que venaient beaucoup des familles qui
--   ont planté le tabac cubain — la Vuelta Abajo a été colonisée par
--   des paysans canariens. Après la nationalisation de 1960, plusieurs
--   d'entre elles sont revenues sur la terre de leurs aïeux : Benjamín
--   Menéndez ouvre en 1961 la Compañía Insular Tabacalera à Las Palmas
--   et y lance MONTECRUZ, copie du Montecristo qu'il venait de perdre.
--   La boucle historique est complète, et l'atlas ne la montrait pas.
--
--   COSTA RICA. Un seul acteur, mais qui vise le sommet : Selected
--   Tobacco, fondée en 2012 par Nelson Alfonso — l'artiste cubain qui
--   avait dessiné l'identité du Cohiba Behike pour Habanos. Atabey,
--   Byron et Bandolero sont produits sur place en quantités très
--   limitées.
--
-- ── TROIS NE PASSENT PAS, et il faut le dire ────────────
--
--   PÉROU et COLOMBIE fournissent de la feuille — du corps, une épice
--   douce — que d'autres pays mettent dans leurs tripes. Aucune maison
--   vérifiable ne s'y rattache. Les ajouter reviendrait à publier deux
--   fiches sans marques, dont les chiffres de production seraient
--   inventés. Ils restent hors de l'atlas tant qu'on n'a pas de quoi
--   les remplir honnêtement.
--
--   HAÏTI : je n'ai trouvé aucune source sur une production cigarière
--   haïtienne, ancienne ou actuelle. Écrire une fiche reviendrait à la
--   fabriquer entièrement. Le pays est retiré de la liste des manques
--   tant que quelque chose ne vient pas l'étayer.
--
-- ── Ce que ces fiches ne contiennent pas ────────────────
--
-- Pas de chiffre de revenus, pas de volume de production chiffré, pas
-- de calendrier de récolte : je n'ai pas ces données pour ces trois
-- pays, et les fiches existantes en portent déjà que personne n'a
-- vérifiées. Les colonnes restent descriptives ou vides plutôt que
-- fausses.
--
-- ⚠ Après cette migration, REJOUER `php tools/amorce_generer.php` :
-- trois pays s'ajoutent au globe, et le fichier d'amorçage du front en
-- dépend.
--
-- Rejouable : chaque insertion vérifie d'abord l'absence de la clé.
-- ════════════════════════════════════════════════════════

-- ── 1. Les trois pays ───────────────────────────────────

INSERT INTO `producer_countries`
  (`id`,`name`,`flag`,`lat`,`lon`,`region`,`tier`,`color`,`production`,`revenue`,`rev_detail`,`climate`,`soil`,`tabacaleras`,`regions`,`notes`,`brands`)
  SELECT 'jamaica','Jamaïque','🇯🇲',18.1096,-77.2975,'Caraïbes','notable','#B8860B',
    'Industrie détruite en 1988, jamais reconstruite',
    'Marginale', 'production quasi arrêtée depuis l\'ouragan',
    'Tropical maritime','Plaine calcaire de May Pen',
    '["Temple Hall","Royal Jamaica"]', '["Kingston","May Pen"]',
    'Premier pays du cigare des Caraïbes hors de Cuba dans les années 1960-1970. L\'ouragan Gilbert a emporté l\'industrie en une nuit de septembre 1988.',
    '[{"name":"Royal Jamaica","desc":"1935, jusqu\'à l\'ouragan de 1988","iconic":true},{"name":"Temple Hall","desc":"La manufacture de Kingston où Macanudo est né","iconic":true}]'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `producer_countries` WHERE `id` = 'jamaica');

INSERT INTO `producer_countries`
  (`id`,`name`,`flag`,`lat`,`lon`,`region`,`tier`,`color`,`production`,`revenue`,`rev_detail`,`climate`,`soil`,`tabacaleras`,`regions`,`notes`,`brands`)
  SELECT 'canaries','Îles Canaries','🇪🇸',28.4000,-16.3000,'Europe / Atlantique','notable','#B8860B',
    'Production artisanale, surtout à La Palma',
    'Confidentielle', 'quelques ateliers familiaux',
    'Subtropical océanique, alizés constants','Sols volcaniques de La Palma',
    '["Vargas","Compañía Insular Tabacalera"]', '["La Palma","Las Palmas de Gran Canaria"]',
    'Terre d\'origine de nombreuses familles tabacoles cubaines — et leur refuge après 1960.',
    '[{"name":"Vargas","desc":"Le cigare palmero, roulé sur l\'île","iconic":true},{"name":"Montecruz","desc":"1961, le Montecristo que les Menéndez ont refait en exil","iconic":true}]'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `producer_countries` WHERE `id` = 'canaries');

INSERT INTO `producer_countries`
  (`id`,`name`,`flag`,`lat`,`lon`,`region`,`tier`,`color`,`production`,`revenue`,`rev_detail`,`climate`,`soil`,`tabacaleras`,`regions`,`notes`,`brands`)
  SELECT 'costarica','Costa Rica','🇨🇷',9.7489,-83.7534,'Amérique Centrale','emerging','#3D6B4A',
    'Séries très limitées, ultra-premium',
    'Confidentielle', 'volumes délibérément réduits',
    'Tropical humide d\'altitude','Terres volcaniques',
    '["Selected Tobacco"]', '[]',
    'Un seul acteur, mais qui vise le sommet du marché plutôt que le volume.',
    '[{"name":"Atabey","desc":"Du dessinateur du Behike à sa propre maison","iconic":true},{"name":"Byron","desc":"Le versant classique de Selected Tobacco","iconic":false},{"name":"Bandolero","desc":"Des tabacs mûris cinq ans avant roulage","iconic":false}]'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `producer_countries` WHERE `id` = 'costarica');

-- ── 2. Fiches pratiques ─────────────────────────────────

INSERT INTO `producer_geo` (`country_id`,`capital`,`population`,`area`,`currency`,`language`,`coords`,`timezone`,`gdp`,`independent`)
  SELECT 'jamaica','Kingston','2,8 M','10 991 km²','Dollar jamaïcain (JMD)','Anglais','18°N 77°O','UTC−5','$19B (2023)','1962'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `producer_geo` WHERE `country_id` = 'jamaica');

INSERT INTO `producer_geo` (`country_id`,`capital`,`population`,`area`,`currency`,`language`,`coords`,`timezone`,`gdp`,`independent`)
  SELECT 'canaries','Las Palmas / Santa Cruz','2,2 M','7 493 km²','Euro (EUR)','Espagnol','28°N 16°O','UTC+0','—','Communauté autonome d\'Espagne'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `producer_geo` WHERE `country_id` = 'canaries');

INSERT INTO `producer_geo` (`country_id`,`capital`,`population`,`area`,`currency`,`language`,`coords`,`timezone`,`gdp`,`independent`)
  SELECT 'costarica','San José','5,2 M','51 100 km²','Colón (CRC)','Espagnol','10°N 84°O','UTC−6','$77B (2023)','1821'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `producer_geo` WHERE `country_id` = 'costarica');

-- ── 3. Zones de production (celles qu'on peut sourcer) ──

INSERT INTO `production_zones` (`country_id`,`name`,`lat`,`lon`,`note`,`color`)
  SELECT 'jamaica','May Pen',17.9667,-77.2333,'Mille acres de tabac détruits par l\'ouragan Gilbert en 1988','#E8541A'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `production_zones` WHERE `country_id`='jamaica' AND `name`='May Pen');
INSERT INTO `production_zones` (`country_id`,`name`,`lat`,`lon`,`note`,`color`)
  SELECT 'jamaica','Kingston',17.9714,-76.7931,'La manufacture Temple Hall, où Macanudo est né','#C04000'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `production_zones` WHERE `country_id`='jamaica' AND `name`='Kingston');

INSERT INTO `production_zones` (`country_id`,`name`,`lat`,`lon`,`note`,`color`)
  SELECT 'canaries','La Palma',28.6835,-17.7642,'L\'île du cigare palmero, roulé de père en fils','#E8541A'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `production_zones` WHERE `country_id`='canaries' AND `name`='La Palma');
INSERT INTO `production_zones` (`country_id`,`name`,`lat`,`lon`,`note`,`color`)
  SELECT 'canaries','Las Palmas de Gran Canaria',28.1235,-15.4363,'La Compañía Insular Tabacalera, ouverte par les Menéndez en 1961','#C04000'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `production_zones` WHERE `country_id`='canaries' AND `name`='Las Palmas de Gran Canaria');

-- ── 4. Les sept articles de marque ──────────────────────

INSERT INTO `brands` (`name`,`country_id`,`founded`,`history`,`gamme`,`pairings`,`factory`)
  SELECT 'Royal Jamaica','jamaica','1935 — Kingston, Jamaïque',
    'Royal Jamaica est la marque d\'un pays qui a perdu son industrie en une nuit. James Frederick Gore la fonde à Kingston en 1935, et sa famille la tient pendant trois générations. Quand l\'embargo américain de 1962 prive les États-Unis du havane, la Jamaïque devient le premier pays du cigare des Caraïbes hors de Cuba — et Royal Jamaica, l\'une des rares marques que les fumeurs américains acceptent comme substitut sérieux.\n\nLe style tenait à la feuille locale, plus douce et plus sèche que la cubaine, et à des formats fins hérités du goût britannique. Notes de cèdre, de foin et de thé noir, avec une combustion rapide qui demandait un tirage lent.\n\nLe 12 septembre 1988, l\'ouragan Gilbert traverse l\'île à pleine puissance. Il détruit l\'usine de Kingston, bâtie par le grand-père du fondateur, et ravage mille acres de tabac à May Pen. La marque est rachetée dans l\'année et sa production transférée en République dominicaine, où elle se poursuit sous le même nom.\n\nC\'est l\'une des rares fois où l\'on peut dater la fin d\'une industrie nationale au jour près.',
    '[{"name":"Royal Jamaica Corona","color":"#8B7355","force":"Light-Medium","wrapper":"Cameroun","vitolas":["Corona"],"story":"Cèdre, foin, une note de thé noir. Format fin hérité du goût britannique, et combustion rapide qui demande un tirage lent — le profil que les fumeurs américains privés de havane ont adopté."},{"name":"Royal Jamaica Churchill","color":"#A0522D","force":"Medium","wrapper":"Cameroun","vitolas":["Churchill"],"story":"Le grand format de la maison. Même douceur, étirée sur une heure et demie — celle qu\'on servait dans les hôtels de Montego Bay."}]',
    '[{"type":"Café","name":"Blue Mountain jamaïcain","notes":"Le café le plus fin des Caraïbes, cultivé à quelques kilomètres de l\'usine détruite."},{"type":"Spiritueux","name":"Rhum jamaïcain vieux","notes":"L\'ester puissant du rhum local réveille un assemblage volontairement discret."}]',
    'Kingston, Jamaïque (jusqu\'en 1988), puis Rép. dominicaine'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Royal Jamaica');

INSERT INTO `brands` (`name`,`country_id`,`founded`,`history`,`gamme`,`pairings`,`factory`)
  SELECT 'Temple Hall','jamaica','Kingston, Jamaïque',
    'Temple Hall est un nom d\'usine devenu nom de marque, et c\'est là que Macanudo est né.\n\nLa manufacture de Kingston appartenait à Gradiaz, Annis & Co. lorsque General Cigar la rachète en 1969 — l\'opération lui donne du même coup les droits sur le nom Macanudo hors de Cuba. Le groupe y installe Alfons Mayer, l\'un des grands assembleurs de l\'époque, et c\'est depuis cette usine jamaïcaine que se compose le Macanudo que le monde entier fumera ensuite, une fois la production passée en République dominicaine.\n\nLe nom Macanudo lui-même était arrivé par un autre chemin : la famille Palicio, qui faisait Punch à Cuba, s\'était réfugiée en Jamaïque pendant la Seconde Guerre mondiale et avait donné ce nom à l\'une de ses vitoles avant d\'en faire une marque.\n\nTemple Hall a existé comme marque à part entière, avec un assemblage jamaïcain plus corsé que le Macanudo qu\'elle abritait. L\'usine n\'a pas survécu à 1988 ; le nom refait surface de loin en loin, comme un souvenir de ce que Kingston a été.',
    '[{"name":"Temple Hall Estate","color":"#8B4513","force":"Medium","wrapper":"Cameroun","vitolas":["Corona","Lonsdale"],"story":"L\'assemblage jamaïcain de l\'usine, plus corsé que le Macanudo qu\'elle produisait dans le même atelier. Bois, cuir, une pointe de terre."},{"name":"Temple Hall No.625","color":"#A0522D","force":"Medium","wrapper":"Cameroun","vitolas":["Robusto"],"story":"Un format court réédité de loin en loin, comme un souvenir de ce que Kingston a été."}]',
    '[{"type":"Café","name":"Blue Mountain jamaïcain","notes":"L\'accord de l\'île, et le plus juste sur un assemblage sans excès."},{"type":"Spiritueux","name":"Rhum jamaïcain","notes":"L\'ester du rhum tient tête à la terre de l\'assemblage."}]',
    'Temple Hall, Kingston, Jamaïque'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Temple Hall');

INSERT INTO `brands` (`name`,`country_id`,`founded`,`history`,`gamme`,`pairings`,`factory`)
  SELECT 'Vargas','canaries','La Palma, Îles Canaries',
    'À La Palma, on roule le cigare depuis si longtemps que le mot local — le « palmero » — désigne à la fois le cigare et l\'habitant de l\'île. Le tabac y pousse sur des sols volcaniques, dans un climat d\'alizés constants, et se travaille dans des ateliers familiaux plutôt que dans des manufactures.\n\nLa maison Vargas est la plus connue de ces ateliers. Elle roule sous son nom de famille, avec une part importante de feuille de La Palma — ce qui est rare : la plupart des cigares dits canariens utilisent des tabacs importés d\'Amérique.\n\nCette origine explique le goût. Le palmero est sec, végétal, un peu rustique, avec une force modérée et une combustion franche. Il ne cherche pas à ressembler au havane et n\'en a jamais eu l\'ambition ; c\'est un cigare de terroir insulaire, fumé sur place bien plus qu\'exporté.\n\nDans un atlas dominé par les Caraïbes et l\'Amérique centrale, c\'est l\'un des rares endroits d\'Europe où l\'on cultive et où l\'on roule au même endroit.',
    '[{"name":"Vargas Palmero","color":"#8B7355","force":"Medium","wrapper":"La Palma","vitolas":["Corona"],"story":"Le cigare de l\'île, roulé avec sa propre feuille. Sec, végétal, un peu rustique — il ne cherche pas à ressembler au havane et n\'en a jamais eu l\'ambition."},{"name":"Vargas Reserva","color":"#A0522D","force":"Medium","wrapper":"La Palma","vitolas":["Robusto"],"story":"Des feuilles gardées plus longtemps, un peu plus de rondeur. Le même terroir volcanique, avec du temps."}]',
    '[{"type":"Vin","name":"Malvasía de La Palma","notes":"Le vin volcanique de l\'île avec son cigare : deux produits du même sol."},{"type":"Café","name":"Café des Canaries","notes":"L\'archipel en cultive un peu, sur les mêmes pentes — accord rare et strictement local."}]',
    'La Palma, Îles Canaries'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Vargas');

INSERT INTO `brands` (`name`,`country_id`,`founded`,`history`,`gamme`,`pairings`,`factory`)
  SELECT 'Montecruz','canaries','1961 — Las Palmas de Gran Canaria',
    'Montecruz est le cigare d\'un homme qui recommence après avoir tout perdu. En septembre 1960, la nationalisation cubaine retire aux Menéndez la marque Montecristo, qu\'ils avaient portée au sommet. La famille quitte l\'île sans rien.\n\nElle choisit les Canaries — et ce choix n\'est pas un hasard de géographie. L\'archipel est la terre d\'origine d\'une grande partie des paysans qui ont planté le tabac cubain : la Vuelta Abajo a été colonisée par des Canariens, et les familles tabacoles de Cuba y ont gardé des attaches pendant deux siècles. Revenir aux Canaries, c\'était rentrer chez soi.\n\nBenjamín Menéndez ouvre en 1961 la Compañía Insular Tabacalera à Las Palmas et lance Montecruz — un nom si proche de celui qu\'il vient de perdre que l\'intention ne fait aucun doute. Le cigare est habillé de cape camerounaise, sombre et grenue, qui se révèle un substitut convaincant au havane et contribue à installer cette feuille dans le goût américain.\n\nMontecruz a fait les grandes heures du marché américain des années 1960 et 1970. La production a fini par gagner la République dominicaine, comme presque tout ce qui était né aux Canaries.',
    '[{"name":"Montecruz Sun Grown","color":"#6B4226","force":"Medium-Full","wrapper":"Cameroun","vitolas":["Lonsdale","Corona"],"story":"La cape camerounaise sombre qui a servi de substitut au havane sur le marché américain. Cuir, noisette grillée, poivre doux — et une part de l\'histoire du goût américain d\'après 1962."},{"name":"Montecruz Claro","color":"#C9A227","force":"Medium","wrapper":"Cameroun Claro","vitolas":["Corona"],"story":"La version claire du même assemblage, plus sèche et plus courte en bouche. Celle que l\'on servait aux fumeurs venus du havane doux."}]',
    '[{"type":"Spiritueux","name":"Brandy espagnol","notes":"L\'accord de l\'exil : un alcool de la péninsule sur un cigare fait par des Cubains aux Canaries."},{"type":"Café","name":"Café serré","notes":"La noisette de la cape camerounaise supporte une torréfaction franche."}]',
    'Compañía Insular Tabacalera, Las Palmas de Gran Canaria'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Montecruz');

INSERT INTO `brands` (`name`,`country_id`,`founded`,`history`,`gamme`,`pairings`,`factory`)
  SELECT 'Atabey','costarica','2012 — Costa Rica',
    'Atabey porte le nom de la déesse mère des Taïnos, les premiers habitants des Grandes Antilles — celle des eaux douces et de la fertilité. Le choix dit l\'ambition : remonter avant Cuba, avant l\'Espagne, à l\'origine supposée du tabac.\n\nSon créateur, Nelson Alfonso, est un artiste cubain qui a passé des années à dessiner pour Habanos S.A. — c\'est lui qui a conçu l\'identité visuelle du Cohiba Behike, le cigare le plus cher jamais lancé par l\'industrie cubaine. En 2012, il fonde Selected Tobacco au Costa Rica et passe de l\'autre côté : non plus habiller les cigares des autres, mais faire les siens.\n\nAtabey est produit en quantités très limitées, dans des formats aux noms rituels — Divinos, Brujos, Delirios, Ritos. Le profil est doux à médium, extrêmement construit, avec une finesse que l\'on rencontre rarement hors de La Havane : cèdre, crème, fleurs blanches, une longueur qui ne doit rien à la force.\n\nC\'est le cigare le plus cher de cet atlas, et l\'un des rares dont l\'auteur vient du dessin plutôt que du champ.',
    '[{"name":"Atabey Brujos","color":"#D9C7A7","force":"Medium","wrapper":"Assemblage non divulgué","vitolas":["Robusto"],"story":"Cèdre, crème, fleurs blanches, une longueur qui ne doit rien à la force. La finesse que l\'on rencontre rarement hors de La Havane — et un prix qui suit."},{"name":"Atabey Ritos","color":"#C9A227","force":"Medium","wrapper":"Assemblage non divulgué","vitolas":["Toro"],"story":"Le grand format de la série, aux noms rituels empruntés aux Taïnos. Même construction, davantage de temps pour la déployer."}]',
    '[{"type":"Vin","name":"Champagne blanc de blancs","notes":"La seule chose assez fine pour ne pas écraser un cigare bâti sur la dentelle."},{"type":"Café","name":"Café de Tarrazú","notes":"Le grand cru costaricien, cultivé en altitude, avec le cigare fait dans le même pays."}]',
    'Selected Tobacco, Costa Rica'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Atabey');

INSERT INTO `brands` (`name`,`country_id`,`founded`,`history`,`gamme`,`pairings`,`factory`)
  SELECT 'Byron','costarica','Relancée en 2012 — Costa Rica',
    'Byron est le versant classique de Selected Tobacco, et son nom vient d\'une marque ancienne que Nelson Alfonso a choisi de relancer plutôt que d\'inventer — une pratique devenue courante chez les maisons qui cherchent à s\'inscrire dans une continuité.\n\nLà où Atabey joue la finesse, Byron joue l\'ampleur : des formats larges, des assemblages plus denses, une aromatique de cuir, de cacao et de bois précieux. La gamme est organisée par « époques » — chaque série renvoie à un siècle de l\'histoire du cigare, avec des tabacs et des méthodes censés y correspondre.\n\nCe parti pris scénographique est cohérent avec le parcours de son auteur : Alfonso est venu de l\'image et du récit, pas de l\'agronomie, et ses marques racontent quelque chose avant de se fumer. Reste que le contenu suit — la construction est irréprochable et les volumes restent minuscules.\n\nComme Atabey, Byron se vend à des prix qui le placent tout en haut du marché, dans une poignée de boutiques par pays.',
    '[{"name":"Byron Siglo XIX","color":"#6B4226","force":"Medium-Full","wrapper":"Assemblage non divulgué","vitolas":["Toro"],"story":"La série qui renvoie au XIXe siècle. Cuir, cacao, bois précieux — l\'ampleur là où Atabey joue la dentelle."},{"name":"Byron Siglo XVIII","color":"#8B4513","force":"Medium","wrapper":"Assemblage non divulgué","vitolas":["Corona Gorda"],"story":"Un registre plus ancien encore, formats plus sobres. La gamme est organisée par époques, et c\'est le propos autant que le goût."}]',
    '[{"type":"Spiritueux","name":"Rhum très vieux","notes":"L\'ampleur appelle l\'ampleur ; un alcool jeune serait inaudible ici."},{"type":"Café","name":"Café de Tarrazú","notes":"Le grand cru local, sur un cigare fait dans le même pays."}]',
    'Selected Tobacco, Costa Rica'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Byron');

INSERT INTO `brands` (`name`,`country_id`,`founded`,`history`,`gamme`,`pairings`,`factory`)
  SELECT 'Bandolero','costarica','2012 — Costa Rica',
    'Bandolero est la troisième marque de Selected Tobacco, et la plus directe des trois. Son argument tient en une donnée : les tabacs sont mûris cinq ans ou davantage avant d\'être roulés.\n\nCe vieillissement long est la seule information que la maison communique sur l\'assemblage — la composition reste tue, ce qui agace une partie des amateurs et fait partie du dispositif. Dans un métier où l\'on détaille d\'ordinaire l\'origine de chaque feuille, ce silence est un choix.\n\nLe résultat est un cigare rond et sans arête, où l\'on cherche en vain l\'amertume ou le poivre vert des tabacs jeunes : le temps a fait son travail. Notes de fruits secs, de bois ciré, de cacao au lait, avec une combustion très régulière.\n\nComme ses deux sœurs, Bandolero sort en volumes minuscules et se trouve dans une poignée d\'adresses par pays. C\'est un cigare de collectionneur autant que de fumeur.',
    '[{"name":"Bandolero Guapos","color":"#7B4B2A","force":"Medium","wrapper":"Assemblage non divulgué","vitolas":["Robusto"],"story":"Cinq ans de vieillissement au minimum avant roulage, et cela s\'entend : ni amertume ni poivre vert, mais fruits secs, bois ciré et cacao au lait."},{"name":"Bandolero Picadores","color":"#8B6F47","force":"Medium","wrapper":"Assemblage non divulgué","vitolas":["Corona"],"story":"Le format court de la série. La même rondeur, en quarante minutes."}]',
    '[{"type":"Spiritueux","name":"Cognac XO","notes":"Deux produits dont l\'argument est le temps passé en réserve."},{"type":"Café","name":"Café doux d\'altitude","notes":"Rien de brûlé : l\'assemblage n\'a aucune amertume à équilibrer."}]',
    'Selected Tobacco, Costa Rica'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `brands` WHERE `name` = 'Bandolero');
