-- ════════════════════════════════════════════════════════
-- 076 — `history` : le champ que le contrôle ne lisait pas
-- ────────────────────────────────────────────────────────
-- En balayant `brands.history` pour y remplacer « wrapper » par
-- « cape », j'y ai trouvé SEPT affirmations de presse — « score de 96 »,
-- « cigare de l'année n°1 », « Top 25 », « tops annuels », « scores de
-- 95 à 97 », « score parfait de 96 », « plusieurs 100/100 ».
--
-- Toutes écrites dans des formes que le motif connaît depuis la
-- migration 064. Ce qui les a sauvées, c'est encore une fois l'ENDROIT :
-- `marques_check` balayait `gamme`, `celebrities` et `pairings`, jamais
-- `history`.
--
-- C'est la DEUXIÈME fois, après « le cigare de l'année n°1 » de My
-- Father à la migration 068, où j'avais justement élargi le balayage
-- pour cette raison — sans penser à `history`, qui n'est pas un tableau
-- JSON et se trouvait donc hors de la boucle. La leçon ne se retient
-- pas toute seule : quand on écrit un motif, il faut aussi se demander
-- OÙ on le passe.
--
-- ── ET TROIS FAUSSES ALERTES, INSTRUCTIVES ──────────────
--
-- Le balayage élargi a d'abord levé trois récits parfaitement innocents :
--
--   « le meilleur cigare serait celui qu'il roulerait lui-même »
--     — une conviction d'Arturo Fuente en 1912
--   « les wrappers de LEURS meilleurs cigares »
--     — un possessif : les meilleurs de leur propre récolte
--   « produisaient DE meilleurs cigares »
--     — un comparatif, pas un superlatif
--
-- Le motif « meilleur … cigare » avait été élargi sans garde-fou à la
-- migration 071. Or ce qui fait le classement n'est pas le mot
-- « meilleur » : c'est le CHAMP sur lequel il porte — du monde, de
-- l'année, de la maison, cubain. Sans complément, « meilleur cigare »
-- est une phrase française ordinaire. Le motif exige désormais la
-- portée, et les trois récits passent.
--
-- ── LES CAPES, AUSSI ────────────────────────────────────
--
-- Même passage de vocabulaire qu'aux migrations 074 et 075 sur les
-- textes touchés ici : « wrapper » devient « cape », « blend » devient
-- « assemblage », « blender » devient « assembleur ».
-- ════════════════════════════════════════════════════════

-- ── Padrón ──────────────────────────────────────────────
UPDATE `brands` SET `history` = REPLACE(`history`,
  'Et en 1994, la famille lança la série 1964 Anniversary — un cigare en hommage aux 30 ans de la maison — qui obtint un score parfait de 96 dans Cigar Aficionado.',
  'Et en 1994, la famille lança la série 1964 Anniversary, en hommage aux trente ans de la maison — celle qui a fait passer Padrón du rang de valeur sûre à celui de référence.')
WHERE `name` = 'Padrón';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'Depuis lors, les scores parfaits se sont accumulés : Padrón est la seule maison à avoir obtenu plusieurs 100/100 dans l''histoire de la revue.',
  'La maison a bâti sa réputation sur la régularité plutôt que sur un coup d''éclat : d''une boîte à l''autre, d''une année sur l''autre, le cigare est le même.')
WHERE `name` = 'Padrón';

-- ── Alec Bradley ────────────────────────────────────────
UPDATE `brands` SET `history` = REPLACE(`history`,
  'En 2011, le Prensado obtint le titre de cigare de l''année n°1 dans Cigar Aficionado — un score de 96 pour une maison que beaucoup ignoraient encore.',
  'En 2011, le Prensado a fait connaître la maison bien au-delà du cercle des initiés — jusque-là, Alec Bradley restait un nom que peu de fumeurs auraient su placer.')
WHERE `name` = 'Alec Bradley';

-- ── Liga Privada ────────────────────────────────────────
UPDATE `brands` SET `history` = REPLACE(`history`,
  'Le No.9 et le T52 obtinrent des scores de 95 à 97 dans toutes les revues spécialisées.',
  'Le No.9 et le T52 ont installé la gamme durablement, au point que la demande dépasse encore la production.')
WHERE `name` = 'Liga Privada';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'Le blend No.9 fut composé pour un cercle de quinze personnes.',
  'L''assemblage No.9 fut composé pour un cercle de quinze personnes.')
WHERE `name` = 'Liga Privada';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'Le wrapper Connecticut Broadleaf Habano — cultivé dans la vallée de Hartford, Connecticut, fermenté trois ans avant roulage — est la signature de Liga Privada.',
  'La cape Connecticut Broadleaf Habano — cultivée dans la vallée de Hartford, fermentée trois ans avant roulage — est la signature de Liga Privada.')
WHERE `name` = 'Liga Privada';

-- ── Oliva ───────────────────────────────────────────────
UPDATE `brands` SET `history` = REPLACE(`history`,
  'La Serie V (pour Vuelta — hommage au Vuelta Abajo cubain) fut lancée en 2004 et obtint immédiatement un score 97 dans Cigar Aficionado.',
  'La Serie V — pour Vuelta, en hommage au Vuelta Abajo cubain — fut lancée en 2004 et devint aussitôt la gamme sur laquelle la maison serait jugée.')
WHERE `name` = 'Oliva';

-- ── My Father ───────────────────────────────────────────
UPDATE `brands` SET `history` = REPLACE(`history`,
  'La même année, leur première création obtint le cigare de l''année n°1 de Cigar Aficionado — un exploit sans précédent pour une maison de moins d''un an.',
  'Leur première création s''est imposée dès la première année, ce qui est rare pour une maison qui n''existait pas douze mois plus tôt.')
WHERE `name` = 'My Father';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'Le secret de Pepin : il roule lui-même les vitolas prototypes et impose ses blends à son équipe par démonstration plutôt que par formule écrite.',
  'Le secret de Pepin : il roule lui-même les vitoles prototypes et transmet ses assemblages à son équipe par démonstration plutôt que par formule écrite.')
WHERE `name` = 'My Father';

-- ── Excalibur ───────────────────────────────────────────
UPDATE `brands` SET `history` = REPLACE(`history`,
  'Son Robusto obtint des scores Cigar Aficionado qui le placèrent plusieurs fois dans les tops annuels.',
  'Son Robusto est resté le format de référence de la gamme, et celui par lequel la marque s''est fait connaître aux États-Unis.')
WHERE `name` = 'Excalibur';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'un blender dominicain de génie (Hendrik Kelner)',
  'un assembleur dominicain de génie (Hendrik Kelner)')
WHERE `name` = 'Excalibur';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'assembla un blend hondurien exploitant les tabacs Corojo de Jamastran',
  'composa un assemblage hondurien tirant parti des tabacs Corojo de Jamastran')
WHERE `name` = 'Excalibur';

-- ── Romeo y Julieta USA ─────────────────────────────────
UPDATE `brands` SET `history` = REPLACE(`history`,
  'Utilisant un wrapper Connecticut Broadleaf fermenté deux ans, il développe chocolat au lait et café torréfié et a régulièrement figuré dans les Top 25 de Cigar Aficionado.',
  'Sous une cape Connecticut Broadleaf fermentée deux ans, il développe chocolat au lait et café torréfié — c''est la gamme par laquelle la marque américaine a trouvé son public.')
WHERE `name` = 'Romeo y Julieta USA';
