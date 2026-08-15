-- ════════════════════════════════════════════════════════
-- 026 — Relecture sur sources : quatre erreurs, six précisions
-- ────────────────────────────────────────────────────────
-- Les migrations 024 et 025 signalaient dix maisons « moins
-- documentées », écrites de mémoire et à vérifier avant mise en ligne.
-- Elles l'ont été, une par une, sur sources extérieures. Quatre
-- affirmations étaient FAUSSES — dont deux que rien, dans le texte, ne
-- présentait comme incertain.
--
-- ── Les quatre erreurs ──────────────────────────────────
--
--   SUERDIECK N'EXISTE PLUS. L'article la décrivait au présent, avec
--   « une histoire récente difficile ». Elle a fermé sa dernière usine
--   de Cruz das Almas EN 2000, après cent huit ans. C'est une maison
--   morte, et l'atlas le disait vivante.
--
--   MEERAPFEL NE ROULE PAS AU CAMEROUN. Ses cigares sont faits en
--   RÉPUBLIQUE DOMINICAINE, avec la cape camerounaise que la famille
--   sélectionne. La migration 024 en faisait « la première maison que
--   le Cameroun peut dire sienne » : c'est faux au sens où le pays n'y
--   fabrique rien. Par le critère même posé en 023 — une entrée est
--   « cape » quand la contribution du pays est la cape — Meerapfel doit
--   rejoindre la section des cigares à cape. Le Cameroun n'a donc
--   toujours pas de maison en propre, et la fiche le dit désormais.
--
--   MATILDE NE PORTE PAS LE PRÉNOM DE LA FEMME DE SON FONDATEUR
--   (elle s'appelle Carmen). Le nom vient de la Tabacalera La Matilde,
--   fabrique dominicaine active de 1876 à 1910 : la famille a cherché
--   un nom historique de son pays. La vraie histoire est meilleure que
--   celle que j'avais inventée.
--
--   ALHAMBRA N'ÉTAIT PAS ESPAGNOLE. L'article déduisait du nom — le
--   palais de Grenade — que le capital venait d'Espagne. La société
--   fondée à Manille en 1898 était SUISSE. L'inférence était jolie et
--   fausse ; c'est exactement ce contre quoi une relecture sert.
--
-- ── Les six précisions ──────────────────────────────────
--
--   TARU MARTANI — 1918, fondée par le Néerlandais N.V. Negresco.
--   Après l'indépendance, le sultan Hamengkubuwono IX la rebaptise
--   « Taru Martani » : la feuille qui fait vivre. Le nom lui-même
--   raconte la reprise en main du pays.
--
--   JUAN CLEMENTE — Jean Clément, Français, 1982, Santiago. La bague
--   au pied n'est pas une coquetterie : elle protège l'extrémité,
--   fragile, contre les fentes. La raison valait mieux que l'anecdote.
--
--   BERING — 1905, Corral, Wodiska y Ca. à Tampa, qui produit jusqu'en
--   1985. Swisher rachète, transfère au Honduras en 1990, bâtit une
--   usine à Danlí, puis revend marque et usine à Nestor Plasencia en
--   2002 — déjà présent dans cet atlas, au Nicaragua.
--
--   MATACAN — sort de la MÊME usine que Te Amo, chez les Turrent. La
--   fiche du Mexique compte donc quatre entrées de la même famille :
--   il fallait le dire plutôt que de les présenter en concurrentes.
--
--   THE GRIFFIN'S — le club genevois date de 1964, le premier cigare
--   de 1984. Davidoff n'a PAS composé l'assemblage : Grobet l'a fait
--   fabriquer en République dominicaine, et Davidoff est intervenu
--   ensuite pour l'export avant de racheter la marque.
--
--   WARPED — roulé chez TABSA (Tabacos Valle de Jalapa) et El Titan de
--   Bronze, avec de la feuille Aganorsa et un bouquet « entubado ».
--
-- Les dix articles restent des textes de rédaction, pas des fiches
-- d'encyclopédie : ce qui est corrigé ici, ce sont les faits.
-- ════════════════════════════════════════════════════════

-- ── 1. Suerdieck : une maison fermée en 2000 ────────────
UPDATE `brands` SET
  `founded` = '1892 — Cruz das Almas, Bahia, Brésil · fermée en 2000',
  `factory` = 'Cruz das Almas, Bahia — usine fermée en 2000',
  `history` = 'Le tabac de Bahia, cultivé dans le Recôncavo autour de Cruz das Almas, a nourri pendant plus d\'un siècle une industrie cigarière qui exportait vers l\'Europe bien avant que l\'Amérique centrale ne domine le marché. Suerdieck en a été la maison la plus connue — et elle n\'existe plus.\n\nAugust Suerdieck, Allemand, arrive à Bahia en 1888 comme employé d\'une firme de Hambourg, chargé de surveiller le bottelage du tabac. Quatre ans plus tard il rachète l\'entrepôt de son employeur et fonde sa propre maison. La fabrication de cigares suit, à Maragogipe puis à Cruz das Almas, et Suerdieck devient le premier producteur du pays.\n\nSon tabac — le mata fina, sombre, sucré, à l\'acidité particulière — n\'a d\'équivalent nulle part. C\'est un goût que les fumeurs habitués aux profils cubains trouvent souvent déroutant à la première bouffée : plus fruité, presque vineux, avec une combustion rapide qui demande un tirage plus lent.\n\nEn 2000, après cent huit ans, la maison a fermé sa dernière usine. L\'atlas la garde pour ce qu\'elle représente : la mémoire d\'un pays producteur que la géographie du cigare premium a marginalisé — et, cette fois, effacé.',
  `gamme` = '[{"name":"Suerdieck Mata Fina","color":"#5B3A29","force":"Medium","wrapper":"Mata Fina","vitolas":["Corona"],"story":"Le tabac de Bahia dans sa forme la plus directe : fruité, presque vineux, avec une acidité qu\'aucun autre terroir ne donne. À chercher chez les collectionneurs — la production s\'est arrêtée en 2000."},{"name":"Suerdieck Brasilia","color":"#7B4B2A","force":"Light","wrapper":"Mata Fina Claro","vitolas":["Petit Corona"],"story":"Format court et registre léger, dans la tradition des petits cigares brésiliens que l\'Europe importait en quantité au siècle dernier. Lui non plus ne se fabrique plus."}]'
 WHERE `name` = 'Suerdieck';

-- ── 2. Meerapfel : une cape, pas une manufacture ────────
UPDATE `brands` SET
  `founded` = 'Famille marchande depuis 1876 — cape du Cameroun, cigares roulés en Rép. dominicaine',
  `factory` = 'Cape sélectionnée au Cameroun, cigares roulés en Rép. dominicaine',
  `history` = 'La cape camerounaise est l\'une des feuilles les plus recherchées du métier, et le Cameroun n\'existe dans le monde du cigare que par elle : une matière première, vendue à des maisons qui la roulent ailleurs. Meerapfel ne fait pas exception — et cet atlas a d\'abord écrit le contraire.\n\nLa famille Meerapfel est au cœur de cette histoire. Marchands de tabac depuis 1876, d\'origine allemande, les Meerapfel ont bâti leur réputation sur la sélection et le négoce de la feuille camerounaise, au point d\'en être le nom de référence. Richard Meerapfel, mort en 2003, est crédité d\'avoir sauvé ce tabac de la disparition à une époque où plus personne n\'en voulait.\n\nQuand la famille a lancé son propre cigare, elle l\'a fait avec l\'argument le plus solide qui soit — personne ne connaît mieux qu\'elle cette cape — mais elle le fait rouler en République dominicaine. Ce que le Cameroun apporte ici, c\'est donc la feuille la plus visible de l\'assemblage, et rien d\'autre.\n\nLa maison figure à ce titre parmi les cigares à cape camerounaise, avec CAO Cameroon et les autres. Le Cameroun n\'a pas de manufacture premium, et l\'atlas ne peut pas lui en inventer une.',
  `gamme` = '[{"name":"Meerapfel Cigar","color":"#8B7355","force":"Medium","wrapper":"Cape du Cameroun","vitolas":["Robusto","Toro"],"story":"La cape camerounaise chez ceux qui la sélectionnent depuis 1876 : grain fin, noisette grillée, poivre doux, et cette texture soyeuse qui fait sa réputation. Le cigare, lui, est roulé en République dominicaine."},{"name":"Meerapfel Vintage","color":"#6B5B4B","force":"Medium","wrapper":"Cape du Cameroun vieillie","vitolas":["Corona Gorda"],"story":"Des feuilles gardées plusieurs années avant roulage. Le poivre s\'efface, la noisette reste, et la texture devient encore plus fine."}]'
 WHERE `name` = 'Meerapfel';

UPDATE `producer_countries` SET `brands` = JSON_SET(`brands`,
    REPLACE(JSON_UNQUOTE(JSON_SEARCH(`brands`, 'one', 'Meerapfel', NULL, '$[*].name')), '.name', '.cape'), TRUE)
  WHERE `id` = 'cameroon' AND JSON_SEARCH(`brands`, 'one', 'Meerapfel', NULL, '$[*].name') IS NOT NULL;

UPDATE `producer_countries` SET `brands` = JSON_SET(`brands`,
    REPLACE(JSON_UNQUOTE(JSON_SEARCH(`brands`, 'one', 'Meerapfel', NULL, '$[*].name')), '.name', '.iconic'), FALSE)
  WHERE `id` = 'cameroon' AND JSON_SEARCH(`brands`, 'one', 'Meerapfel', NULL, '$[*].name') IS NOT NULL;

UPDATE `producer_countries` SET `brands` = JSON_SET(`brands`,
    REPLACE(JSON_UNQUOTE(JSON_SEARCH(`brands`, 'one', 'Meerapfel', NULL, '$[*].name')), '.name', '.desc'),
    'Les marchands de cette cape depuis 1876, roulé ailleurs')
  WHERE `id` = 'cameroon' AND JSON_SEARCH(`brands`, 'one', 'Meerapfel', NULL, '$[*].name') IS NOT NULL;

-- ── 3. Matilde : le nom vient d'une fabrique de 1876 ────
UPDATE `brands` SET
  `founded` = '2013 — Rép. dominicaine',
  `history` = 'José Seijas a dirigé pendant des décennies la plus grande manufacture de cigares premium du monde, à La Romana — des dizaines de millions de cigares par an, et la responsabilité d\'une régularité que peu de gens mesurent. Il a fondé Matilde en 2013, avec ses fils Ricardo et Enrique, après avoir quitté ce poste.\n\nLe nom ne vient pas de la famille mais de l\'histoire du pays : la Tabacalera La Matilde était une fabrique dominicaine active de 1876 à 1910. Les Seijas cherchaient un nom ancien qui appartienne à leur île plutôt qu\'un patronyme de plus — et ils ont ressuscité celui-là.\n\nLe contraste d\'échelle est le sujet même de la maison. Après avoir passé sa carrière à garantir la constance de volumes industriels, Seijas a monté une marque de séries courtes, où chaque assemblage est le sien et où la production annuelle représente ce que son ancienne usine sortait en une journée.\n\nLe style porte cette expérience : des cigares très construits, d\'un équilibre dominicain classique, avec une régularité de fabrication qui trahit l\'homme qui les faisait. José Seijas est mort en 2024 ; ses fils tiennent la maison.'
 WHERE `name` = 'Matilde';

-- ── 4. Alhambra : une société suisse, pas espagnole ─────
UPDATE `brands` SET
  `founded` = '1898 — Manille, Philippines',
  `history` = 'Les Philippines ont été, sous administration espagnole, l\'autre grand pays du cigare : la vallée de Cagayan fournissait un tabac que Manille roulait en quantités industrielles pour toute l\'Asie et une partie de l\'Europe. Alhambra est née de cette époque, à côté de Tabacalera et de La Flor de la Isabela.\n\nLe nom vient du palais de Grenade, mais il ne dit rien de l\'origine du capital : la société fondée à Manille en 1898 était SUISSE, et non espagnole. Elle installe en 1912 sa fabrique à Tondo, dans le nord de la ville, et devient pour Tabacalera une concurrente sérieuse et cordiale — les deux maisons se partageront le marché pendant des décennies.\n\nLa production philippine a décliné au XXe siècle sans disparaître, et Alhambra conserve une clientèle en Europe, notamment en Suisse — un retour de balancier que son acte de naissance rendait presque prévisible.\n\nFaire figurer la marque dans l\'atlas, c\'est rappeler que la géographie du cigare ne s\'est pas toujours limitée aux Caraïbes.'
 WHERE `name` = 'Alhambra';

-- ── 5. Taru Martani : 1918, et le nom du sultan ─────────
UPDATE `brands` SET
  `founded` = '1918 — Yogyakarta, Java, Indonésie',
  `history` = 'Java et Sumatra fournissent depuis le XIXe siècle des tabacs que l\'Europe a massivement utilisés : la cape de Sumatra a habillé des générations de cigares néerlandais, allemands et belges. Mais l\'Indonésie, dans l\'imaginaire du cigare, reste un fournisseur — pas un pays de maisons.\n\nTaru Martani corrige cela. Fondée en 1918 par le Néerlandais N.V. Negresco, installée à Yogyakarta trois ans plus tard, la manufacture change de mains au gré des occupations — néerlandaise, puis japonaise — avant de revenir à l\'Indonésie en 1949.\n\nC\'est alors que le sultan Hamengkubuwono IX lui donne son nom actuel : Taru Martani, « la feuille qui fait vivre » en javanais. Le nom lui-même raconte une reprise en main, et il est difficile de trouver ailleurs un cigare dont l\'appellation dit aussi clairement une indépendance.\n\nLa maison, la plus ancienne du pays, roule encore l\'essentiel de sa production à la main et exporte vers l\'Europe et l\'Asie. La fiche indonésienne de cet atlas ne comptait jusqu\'ici que des marques néerlandaises utilisant du tabac local : celle-ci est la première qui soit indonésienne au sens plein.'
 WHERE `name` = 'Taru Martani';

-- ── 6. Juan Clemente : la bague protège le pied ─────────
UPDATE `brands` SET
  `founded` = '1982 — Santiago de los Caballeros, Rép. dominicaine',
  `history` = 'Juan Clemente se reconnaît à une bizarrerie que personne d\'autre n\'a osée : sa bague n\'est pas posée près de la tête, mais au PIED du cigare, à l\'extrémité qu\'on allume.\n\nCe n\'est pas une coquetterie. Le pied est la partie la plus fragile d\'un cigare : la cape y est libre, et le moindre choc la fend. La bague, placée là, la maintient jusqu\'à l\'allumage puis se retire d\'elle-même. C\'est une solution de fabricant, adoptée par obsession de la construction — et devenue une signature qu\'on repère à dix mètres.\n\nSon fondateur, Jean Clément, était français. Il crée la maison à Santiago de los Caballeros en 1982 et hispanise son propre nom, jugeant qu\'il sonnerait mieux ainsi dans ce métier. Une origine française à ce moment-là est une anomalie de plus : le pays montait en puissance et presque toutes les nouvelles marques venaient de familles cubaines exilées.\n\nLe profil est doux à médium, dans la tradition dominicaine classique : cèdre, foin, une douceur discrète, et des formats souvent fins. La production est restée confidentielle, et la marque appartient à cette catégorie de maisons dont on parle au passé sans qu\'elles aient jamais vraiment disparu.'
 WHERE `name` = 'Juan Clemente';

-- ── 7. Bering : Tampa 1905, Honduras 1990, Plasencia ────
UPDATE `brands` SET
  `founded` = '1905 — Tampa, Floride · production au Honduras depuis 1990',
  `factory` = 'Danlí, Honduras (Plasencia) — marque née à Tampa en 1905',
  `history` = 'Bering est un nom de Tampa. La marque naît en 1905 chez Corral, Wodiska y Ca., dans la Floride des grandes fabriques de Ybor City, à l\'époque où le quartier produisait des centaines de millions de cigares par an et où les enseignes cubaines exilées côtoyaient les maisons espagnoles.\n\nLa maison de Tampa a produit jusqu\'en 1985. Le groupe Swisher rachète alors la marque, transfère la fabrication au Honduras en 1990, y bâtit une usine à Danlí, puis revend l\'ensemble — marque et usine — à Nestor Plasencia en 2002. Bering appartient donc aujourd\'hui à une famille déjà présente dans cet atlas, du côté du Nicaragua.\n\nC\'est pourquoi cette fiche la rattache au Honduras plutôt qu\'aux États-Unis : c\'est là qu\'elle se fabrique depuis plus de trente ans, et c\'est ce qui explique son goût.\n\nLe profil est hondurien classique, dans son registre le plus accessible : bois, terre, une combustion franche, sans la puissance des assemblages du Jamastran. La gamme couvre des formats nombreux et souvent fins, héritage direct des habitudes américaines du milieu du siècle.'
 WHERE `name` = 'Bering';

-- ── 8. Matacan : la même usine que Te Amo ───────────────
UPDATE `brands` SET
  `factory` = 'Nueva Matacapan Tabacos, San Andrés Tuxtla, Veracruz, Mexique',
  `history` = 'Matacan est le cigare que la vallée de San Andrés fume elle-même. Entièrement composé de tabacs mexicains — tripe, sous-cape et cape —, c\'est un puro au sens strict, vendu en bottes plutôt qu\'en boîtes et à un prix qui le place hors de la concurrence des grandes marques.\n\nIl sort de la MÊME usine que Te Amo : Nueva Matacapan Tabacos, qui appartient aux Turrent, la famille qui domine le tabac mexicain depuis quatre générations. La fiche du Mexique compte ainsi quatre entrées liées à cette seule famille — Te Amo, Santa Clara 1830, Casa Turrent et Matacan. Ce n\'est pas un défaut de l\'atlas : c\'est la réalité d\'un pays où une famille tient le terroir.\n\nSes références portent des numéros plutôt que des noms, ce qui dit assez son propos : ce n\'est pas une marque de prestige mais une gamme de formats, où l\'on choisit un chiffre selon le temps dont on dispose. La présentation est minimale, souvent sans bague.\n\nLe goût, lui, est instructif : la cape San Andrés sans les tabacs nicaraguayens ou dominicains qui l\'accompagnent habituellement — donc le terroir mexicain seul, franc et un peu rugueux. Pour comprendre ce que le Mexique apporte réellement aux assemblages du continent, c\'est l\'échantillon le plus direct qui soit.'
 WHERE `name` = 'Matacan';

-- ── 9. The Griffin's : 1964 le club, 1984 le cigare ─────
UPDATE `brands` SET
  `founded` = '1984 — Rép. dominicaine, pour un club de Genève ouvert en 1964',
  `history` = 'The Griffin\'s doit son nom à une boîte de nuit genevoise, ce qui est probablement l\'origine la plus improbable du catalogue. Bernard Grobet ouvre le club en 1964 et y reçoit une clientèle internationale ; vingt ans plus tard, il veut un cigare à offrir à ses tables et le fait fabriquer pour lui en République dominicaine. Le premier Griffin\'s sort en 1984, destiné au seul club.\n\nIl a plu au-delà de toute intention. Le cigare se retrouve rapidement chez les buralistes suisses, puis aux États-Unis à partir de 1989. Grobet s\'adresse alors à l\'organisation Davidoff pour gérer l\'export, et lui vend la marque trois ans plus tard — c\'est donc après coup que la maison suisse entre dans l\'histoire, et non à la création comme on le lit parfois.\n\nLe résultat porte la marque de son commanditaire : un cigare de salon, élégant, sans aspérité, pensé pour accompagner une conversation plutôt que pour la dominer. Cape claire, registre doux à médium, notes de cèdre, de noisette et de fleurs blanches.\n\nC\'est, dans l\'atlas, l\'un des rares cigares dont l\'acte de naissance est une soirée plutôt qu\'une plantation.'
 WHERE `name` = 'The Griffin\'s';

-- ── 10. Warped : TABSA, El Titan de Bronze, entubado ────
UPDATE `brands` SET
  `founded` = '2007 — Miami, production au Nicaragua et en Floride',
  `factory` = 'TABSA (Jalapa, Nicaragua) et El Titan de Bronze (Miami)',
  `history` = 'Warped est née de la volonté de faire revivre des noms de marques cubaines d\'avant 1960 tombés dans l\'oubli, et de les remplir d\'assemblages contemporains. Kyle Gellis, son fondateur, a découvert le métier en traversant Miami chaque semaine pendant ses études pour observer les rouleurs de la Petite Havane ; c\'est chez El Titan de Bronze qu\'il a fait ses premiers cigares.\n\nIl travaille sans usine propre. Ses gammes sortent de deux ateliers très différents — TABSA, dans la vallée de Jalapa, et El Titan de Bronze à Miami — et utilisent la feuille d\'Aganorsa. Ce double ancrage donne à la marque une palette inhabituelle pour sa taille.\n\nLe style privilégie les formats fins et le bouquet « entubado », méthode ancienne où chaque feuille de tripe est roulée sur elle-même avant d\'être assemblée : plus lente, plus coûteuse, elle ouvre le tirage et allonge la fumée. C\'est un choix technique cohérent avec ce que la maison recherche — la longueur en bouche plutôt que la puissance immédiate.\n\nLes séries sont courtes, souvent annoncées sans préavis, et écoulées en quelques semaines. C\'est une marque de fumeurs informés — celle qu\'on découvre par une conversation plutôt que par une vitrine.'
 WHERE `name` = 'Warped';
