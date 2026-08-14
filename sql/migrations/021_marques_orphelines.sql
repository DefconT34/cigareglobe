-- ════════════════════════════════════════════════════════
-- 021 — Onze articles de marque que rien ne reliait au site
-- ────────────────────────────────────────────────────────
-- Une fiche pays n'affiche que les marques inscrites dans SA propre
-- liste (`producer_countries.brands`). Onze articles n'y figuraient
-- nulle part : rédigés, dotés de leur gamme, de leurs notes, de leurs
-- accords, traduits dans les six langues — et introuvables autrement
-- qu'en devinant l'adresse « ?brand=… ».
--
-- Parmi eux, Hoyo de Monterrey, l'une des cinq grandes cubaines.
--
-- ── Deux réparations, qui n'ont pas la même nature ───────
--
-- 1. `brands.country_id` ne désignait aucun pays connu dans 34 lignes
--    sur 53. Trois dégâts distincts : un import qui a gardé le drapeau
--    et le nom (« 🇨🇺 Cuba » au lieu de « cuba »), un identifiant
--    dominicain écrit de deux façons, et la Suisse qui n'est pas un
--    pays producteur de l'atlas. Ce champ sert à la recherche, qui s'en
--    sert pour rejoindre le pays d'une marque : faux, elle ne trouvait
--    rien à rejoindre.
--
-- 2. Les onze noms entrent dans la liste de leur pays. Le pays retenu
--    est celui de l'USINE, tel que l'article le déclare lui-même —
--    pas une déduction : Hoyo de Monterrey, Quintero et Vegas Robaina
--    sortent tous d'El Rey del Mundo à La Havane ; Santa Damiana de la
--    Tabacalera de García à La Romana ; Liga Privada de Drew Estate à
--    Estelí.
--
-- ── Deux choix qui se discutent, donc écrits ici ─────────
--
-- VILLIGER est suisse (Pfeffikon, 1888) et la Suisse n'a pas de fiche :
-- ce n'est pas un pays producteur. Son propre champ « usine » nomme des
-- manufactures partenaires à Estelí ; on la classe donc au Nicaragua.
-- Le champ dit où l'atlas la RANGE, la première ligne de son article dit
-- d'où elle vient — rien n'est perdu pour le lecteur.
--
-- ROMEO Y JULIETA USA portait « dominican_republic » alors que ses deux
-- sœurs de la même famille juridique — Cohiba USA et Partagás USA —
-- portaient « usa ». Les trois racontent la même histoire : l'embargo a
-- ouvert un vide de marque que des maisons américaines ont occupé. Elles
-- vont ensemble sur la fiche des États-Unis.
--
-- AUCUNE des trois n'est marquée « emblématique » : ce sont des
-- homonymes, et les mettre en tête risquerait de les faire prendre pour
-- les cubaines. Seul Hoyo de Monterrey l'est — 1865, et l'une des cinq
-- grandes.
--
-- Le fichier est rejouable : chaque ajout vérifie d'abord que le nom
-- n'est pas déjà dans la liste.
-- ════════════════════════════════════════════════════════

-- ── 1. Les identifiants de pays ──────────────────────────
UPDATE `brands` SET `country_id` = 'cuba'        WHERE `country_id` = '🇨🇺 Cuba';
UPDATE `brands` SET `country_id` = 'nicaragua'   WHERE `country_id` = '🇳🇮 Nicaragua';
UPDATE `brands` SET `country_id` = 'dominican'   WHERE `country_id` = '🇩🇴 Rép. Dominicaine';
UPDATE `brands` SET `country_id` = 'honduras'    WHERE `country_id` = '🇭🇳 Honduras';
UPDATE `brands` SET `country_id` = 'indonesia'   WHERE `country_id` = '🇮🇩 Indonésie';
UPDATE `brands` SET `country_id` = 'panama'      WHERE `country_id` = '🇵🇦 Panama';
UPDATE `brands` SET `country_id` = 'brazil'      WHERE `country_id` = '🇧🇷 Brésil';
UPDATE `brands` SET `country_id` = 'ecuador'     WHERE `country_id` = '🇪🇨 Équateur';
UPDATE `brands` SET `country_id` = 'philippines' WHERE `country_id` = '🇵🇭 Philippines';
UPDATE `brands` SET `country_id` = 'mexico'      WHERE `country_id` = '🇲🇽 Mexique';
UPDATE `brands` SET `country_id` = 'dominican'   WHERE `country_id` = 'dominican_republic';

-- Les trois homonymes américaines vont ensemble (voir en-tête).
UPDATE `brands` SET `country_id` = 'usa'       WHERE `name` = 'Romeo y Julieta USA';
-- Villiger : le pays où l'atlas la range, pas celui d'où elle vient.
UPDATE `brands` SET `country_id` = 'nicaragua' WHERE `name` = 'Villiger';

-- ── 2. Les onze noms entrent dans la liste de leur pays ──
UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$',
  CAST('{"name":"Hoyo de Monterrey","desc":"Le creux de Vuelta Abajo, depuis 1865","iconic":true}' AS JSON))
  WHERE `id` = 'cuba' AND JSON_SEARCH(`brands`, 'one', 'Hoyo de Monterrey', NULL, '$[*].name') IS NULL;

UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$',
  CAST('{"name":"Vegas Robaina","desc":"La seule havane au nom d\'un cultivateur","iconic":false}' AS JSON))
  WHERE `id` = 'cuba' AND JSON_SEARCH(`brands`, 'one', 'Vegas Robaina', NULL, '$[*].name') IS NULL;

UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$',
  CAST('{"name":"Quintero","desc":"Le secret le mieux gardé du portefeuille Habanos","iconic":false}' AS JSON))
  WHERE `id` = 'cuba' AND JSON_SEARCH(`brands`, 'one', 'Quintero', NULL, '$[*].name') IS NULL;

UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$',
  CAST('{"name":"Liga Privada","desc":"Le mélange privé de Jonathan Drew, devenu culte","iconic":false}' AS JSON))
  WHERE `id` = 'nicaragua' AND JSON_SEARCH(`brands`, 'one', 'Liga Privada', NULL, '$[*].name') IS NULL;

UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$',
  CAST('{"name":"Villiger","desc":"Maison suisse de 1888, roulée à Estelí","iconic":false}' AS JSON))
  WHERE `id` = 'nicaragua' AND JSON_SEARCH(`brands`, 'one', 'Villiger', NULL, '$[*].name') IS NULL;

UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$',
  CAST('{"name":"Excalibur","desc":"Suisse, dominicaine et hondurienne à la fois","iconic":false}' AS JSON))
  WHERE `id` = 'honduras' AND JSON_SEARCH(`brands`, 'one', 'Excalibur', NULL, '$[*].name') IS NULL;

UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$',
  CAST('{"name":"Zino Platinum","desc":"Le prénom de Zino Davidoff, en marque à part","iconic":false}' AS JSON))
  WHERE `id` = 'honduras' AND JSON_SEARCH(`brands`, 'one', 'Zino Platinum', NULL, '$[*].name') IS NULL;

UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$',
  CAST('{"name":"Santa Damiana","desc":"La douceur comme valeur absolue, depuis 1993","iconic":false}' AS JSON))
  WHERE `id` = 'dominican' AND JSON_SEARCH(`brands`, 'one', 'Santa Damiana', NULL, '$[*].name') IS NULL;

UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$',
  CAST('{"name":"Cohiba USA","desc":"L\'homonyme américaine, née de l\'embargo","iconic":false}' AS JSON))
  WHERE `id` = 'usa' AND JSON_SEARCH(`brands`, 'one', 'Cohiba USA', NULL, '$[*].name') IS NULL;

UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$',
  CAST('{"name":"Partagás USA","desc":"La version américaine, chez General Cigar","iconic":false}' AS JSON))
  WHERE `id` = 'usa' AND JSON_SEARCH(`brands`, 'one', 'Partagás USA', NULL, '$[*].name') IS NULL;

UPDATE `producer_countries` SET `brands` = JSON_ARRAY_APPEND(`brands`, '$',
  CAST('{"name":"Romeo y Julieta USA","desc":"L\'américaine d\'Altadis, depuis 1969","iconic":false}' AS JSON))
  WHERE `id` = 'usa' AND JSON_SEARCH(`brands`, 'one', 'Romeo y Julieta USA', NULL, '$[*].name') IS NULL;
