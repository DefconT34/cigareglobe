-- ════════════════════════════════════════════════════════
-- 090 — Le vocabulaire de `history`, second lot
-- ────────────────────────────────────────────────────────
-- Les douze fiches restantes. Et, comme au lot précédent, la relecture
-- imposée par le remplacement fait remonter autre chose.
--
-- ── CINQ AFFIRMATIONS DE PLUS ───────────────────────────
--
--   La Flor Dominicana : « le laboratoire LE PLUS ACTIF de l'industrie
--   — inventant des formats, des blends, des fermentations QUE PERSONNE
--   N'AVAIT OSÉS avant lui ». Deux revendications dans une phrase, dont
--   une d'antériorité absolue.
--
--   Te Amo : « l'un des rares wrappers naturellement sombres et
--   onctueux DU MONDE », puis « Te Amo est LA SEULE MAISON à utiliser
--   ce wrapper comme fer de lance ». Un rang mondial et une exclusivité,
--   ni l'un ni l'autre vérifiables.
--
--   Oliva Connecticut Reserve : « les cigares LES PLUS DOUX DU MARCHÉ ».
--
--   Santa Damiana : Kelner y est « LE BLENDER LÉGENDAIRE ». La migration
--   071 avait déjà retiré la citation qu'on lui prêtait ; l'épithète est
--   restée.
--
-- Aucune de ces cinq n'est attrapée par le motif des rangs mondiaux :
-- « du marché », « de l'industrie », « la seule maison », « que personne
-- n'avait osés » — quatre façons de dire un premier rang sans écrire
-- « monde ».
--
-- ── ET UNE MALADRESSE ───────────────────────────────────
--
-- Oliva Serie G : « la gamme ENTRÉE DE GAMME premium ». Le mot revient
-- deux fois en quatre.
--
-- ── UN NÉOLOGISME ───────────────────────────────────────
--
-- Perdomo : « des wrappers équatoriens ou CONNECTICUTAIS ». Le gentilé
-- n'existe pas ; on dit une cape « du Connecticut ».
-- ════════════════════════════════════════════════════════

UPDATE `brands` SET `history` = REPLACE(`history`,
  'réservaient ces parcelles aux wrappers de leurs meilleurs cigares.',
  'réservaient ces parcelles aux capes de leurs meilleurs cigares.')
WHERE `name` = 'Hoyo de Monterrey';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'recréation du blend original de 1970',
  'recréation de l''assemblage original de 1970')
WHERE `name` = 'Joya de Nicaragua';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'sa maison est le laboratoire le plus actif de l''industrie — inventant des formats, des blends, des fermentations que personne n''avait osés avant lui.',
  'sa maison travaille comme un laboratoire : des formats, des assemblages et des fermentations que peu d''autres tentent.')
WHERE `name` = 'La Flor Dominicana';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'dans plusieurs de ses blends, créant une opacité narrative délibérée',
  'dans plusieurs de ses assemblages, créant une opacité délibérée')
WHERE `name` = 'La Flor Dominicana';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'peut produire les cigares les plus doux du marché avec la même excellence que ses gammes full-body. Wrapper Connecticut Shade équatorien sur blend Nicaraguayen léger.',
  'sait faire aussi bien le très doux que le corsé. Cape Connecticut Shade d''Équateur sur assemblage nicaraguayen léger.')
WHERE `name` = 'Oliva Connecticut Reserve';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'est la gamme entrée de gamme premium utilisant le wrapper camerounais',
  'est la porte d''entrée du catalogue, sous cape camerounaise,')
WHERE `name` = 'Oliva Serie G';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'Medium-Full accessible.',
  'Mi-corsée à corsée, accessible.')
WHERE `name` = 'Oliva Serie G';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'un blend à prédominance mexicaine San Andrés',
  'un assemblage à dominante San Andrés du Mexique')
WHERE `name` = 'Partagás USA';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'Sa spécialité : les wrappers nicaraguayens.',
  'Sa spécialité : les capes nicaraguayennes.')
WHERE `name` = 'Perdomo';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'utilisent des wrappers équatoriens ou connecticutais pour habiller un blend nicaraguayen',
  'emploient des capes d''Équateur ou du Connecticut pour habiller un assemblage nicaraguayen')
WHERE `name` = 'Perdomo';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'Le wrapper oscuro nicaraguayen vieilli 5 ans crée',
  'La cape oscuro nicaraguayenne, vieillie cinq ans, crée')
WHERE `name` = 'Perdomo';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'exploite le wrapper Connecticut shade cultivé en altitude équatorienne',
  'emploie la cape Connecticut Shade cultivée en altitude, en Équateur')
WHERE `name` = 'Perdomo Ecuador';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'créent un wrapper plus doux, plus soyeux, moins "vert" que le Connecticut américain',
  'donnent une cape plus douce, plus soyeuse, moins végétale que le Connecticut américain')
WHERE `name` = 'Perdomo Ecuador';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'Hendrik Kelner — le blender légendaire de la Tabacalera de García —',
  'Hendrik Kelner — l''assembleur de la Tabacalera de García —')
WHERE `name` = 'Santa Damiana';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'une course généralisée vers les blends plus forts',
  'une course généralisée vers les assemblages plus forts')
WHERE `name` = 'Santa Damiana';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'dans le registre doux-médium : wrapper Connecticut Shade, blend dominicain équilibré',
  'dans le registre doux à moyen : cape Connecticut Shade, assemblage dominicain équilibré')
WHERE `name` = 'Santa Damiana';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'sur les techniques de fermentation et les blends.',
  'sur les techniques de fermentation et les assemblages.')
WHERE `name` = 'Tabacalera';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'est l''un des rares wrappers naturellement sombres et onctueux du monde.',
  'donne une cape naturellement sombre et onctueuse, ce qui est rare.')
WHERE `name` = 'Te Amo';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'Te Amo est la seule maison à utiliser ce wrapper comme fer de lance de toute sa production.',
  'Te Amo en a fait le fer de lance de toute sa production.')
WHERE `name` = 'Te Amo';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'pour les amateurs qui hésitent devant les wrappers sombres.',
  'pour les amateurs qui hésitent devant les capes sombres.')
WHERE `name` = 'Te Amo';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'Ses wrappers colorado maduro — sombres, huileux,',
  'Ses capes colorado maduro — sombres, huileuses,')
WHERE `name` = 'Vegas Robaina';
