-- ════════════════════════════════════════════════════════
-- 074 — « Wrapper » dans la prose : les fiches pays et zones
-- ────────────────────────────────────────────────────────
-- Premier des trois lots de vocabulaire. Le français du site écrivait
-- « wrapper », « binder », « filler » là où il dit ailleurs « cape »,
-- « sous-cape », « tripe » — les termes du métier en français, ceux
-- qu'emploient les traductions espagnole, allemande, chinoise et arabe
-- depuis le début.
--
-- ── L'ACCORD SUIT LE MOT ────────────────────────────────
--
-- « Wrapper » est masculin, « cape » est féminine. Une substitution
-- automatique aurait produit « Cape Sumatra très répandu », « Cape
-- claire exceptionnel », « Cape Bahia premium ». Chaque phrase est donc
-- reprise, pas remplacée — c'est la raison pour laquelle ce chantier ne
-- pouvait pas être une expression régulière.
--
-- ── UN ANGLICISME QUE MA LISTE N'AVAIT PAS ──────────────
--
-- La fiche des États-Unis disait que l'embargo « a paradoxalement
-- BOOSTÉ les industries nicaraguayenne et dominicaine ». « Booster » ne
-- figurait pas dans mon relevé, qui cherchait du vocabulaire technique
-- du tabac. Un inventaire de mots est toujours incomplet — c'est la
-- même limite que la liste de verbes de parole à la migration 071.
--
-- ── ET DEUX SUPERLATIFS, TANT QU'À RÉÉCRIRE ─────────────
--
-- « Le MEILLEUR wrapper Maduro naturel DU MONDE » (Brésil) et « la cape
-- la plus douce AU MONDE » (États-Unis). Ce sont les affirmations que
-- `marques_check` retire des fiches de marques depuis la migration 058
-- — sauf que ce contrôle ne lit que `brands`, et que celles-ci vivent
-- dans `habanos_presence`. Encore l'axe « la colonne » de la migration
-- 068 : un contrôle ne voit pas ce qu'il ne regarde pas.
--
-- Elles deviennent « l'une des plus recherchées » et « l'une des plus
-- douces », qui disent la même chose sans couronner personne.
-- ════════════════════════════════════════════════════════

-- ── producer_countries.production ───────────────────────
UPDATE `producer_countries` SET `production` = 'Cape de niche très recherchée'          WHERE `name` = 'Cameroun';
UPDATE `producer_countries` SET `production` = 'Cape d''ombre cultivée sans toile, sous couvert nuageux' WHERE `name` = 'Équateur';
UPDATE `producer_countries` SET `production` = 'Cape Sumatra très répandue'             WHERE `name` = 'Indonésie';
UPDATE `producer_countries` SET `production` = 'Cape San Andrés, production de niche'   WHERE `name` = 'Mexique';
UPDATE `producer_countries` SET `production` = 'Cape Connecticut, la référence'         WHERE `name` = 'États-Unis';

-- ── producer_countries.notes ────────────────────────────
UPDATE `producer_countries` SET `notes` = 'La cape la plus recherchée — café, cacao, épices.'   WHERE `name` = 'Cameroun';
UPDATE `producer_countries` SET `notes` = 'Deli Sumatra — cape très répandue en Europe.'        WHERE `name` = 'Indonésie';
UPDATE `producer_countries` SET `notes` = 'San Andrés — la référence de la cape maduro.'        WHERE `name` = 'Mexique';
UPDATE `producer_countries` SET `notes` = 'Connecticut Shade — le berceau de la cape d''ombre.' WHERE `name` = 'États-Unis';

-- ── production_zones.note ───────────────────────────────
UPDATE `production_zones` SET `note` = 'Sous-cape et tripe de qualité'     WHERE `name` = 'Semi Vuelta';
UPDATE `production_zones` SET `note` = 'Cape claire exceptionnelle'        WHERE `name` = 'Partido';
UPDATE `production_zones` SET `note` = 'Cape Sumatra équatoriale'          WHERE `name` = 'El Oro';
UPDATE `production_zones` SET `note` = 'Habano et capes variées'           WHERE `name` = 'Guayas';
UPDATE `production_zones` SET `note` = 'Cape Bahia de haut de gamme'       WHERE `name` = 'Cruz das Almas';
UPDATE `production_zones` SET `note` = 'Berceau de la cape d''ombre'       WHERE `name` = 'Connecticut Valley';
UPDATE `production_zones` SET `note` = 'La cape Sumatra la plus réputée'   WHERE `name` = 'Deli, Sumatra Nord';

-- ── habanos_presence.status ─────────────────────────────
UPDATE `habanos_presence` SET `status` = 'PRODUCTEUR DE CAPE EXCLUSIF'      WHERE `country_id` = 'cameroon';
UPDATE `habanos_presence` SET `status` = 'FOURNISSEUR MONDIAL DE CAPES'     WHERE `country_id` = 'ecuador';
UPDATE `habanos_presence` SET `status` = 'FOURNISSEUR DE CAPE SUMATRA'      WHERE `country_id` = 'indonesia';
UPDATE `habanos_presence` SET `status` = 'NICHE PREMIUM — CAPE SAN ANDRÉS'  WHERE `country_id` = 'mexico';
UPDATE `habanos_presence` SET `status` = 'MARCHÉ ET PRODUCTEUR DE CAPES'    WHERE `country_id` = 'usa';

-- ── habanos_presence.description ────────────────────────
UPDATE `habanos_presence` SET `description` =
  'Le Brésil n''a pas de représentation Habanos. Son influence mondiale repose sur le tabac Mata Fina de Bahia, l''une des capes maduro naturelles les plus recherchées. Des marques comme Arturo Fuente Añejo, Padrón 1926 Maduro et CAO l''emploient. Sur son marché intérieur, Dannemann, marque nationale, est distribuée dans plus de quatre-vingts pays.'
WHERE `country_id` = 'brazil';

UPDATE `habanos_presence` SET `description` =
  'Le Cameroun ne possède pas de représentation Habanos et ne produit aucun cigare fini pour le marché international. Sa contribution est unique mais fondamentale : la cape Cameroun, cultivée sur les flancs volcaniques du mont Cameroun. Elle compte parmi les plus recherchées au monde, notamment pour les Arturo Fuente Hemingway et les Oliva Serie G. La production reste très limitée et fluctue selon les saisons des pluies.'
WHERE `country_id` = 'cameroon';

UPDATE `habanos_presence` SET `description` =
  'L''Équateur n''a pas de représentation Habanos et ne produit pas de cigares finis sous sa propre marque : c''est exclusivement un fournisseur mondial de feuilles de cape. La couverture nuageuse naturelle de la région remplace l''ombrage artificiel utilisé au Connecticut, et donne une cape Connecticut Shade de qualité comparable à moindre coût. Presque toutes les grandes manufactures du monde emploient de la cape équatorienne.'
WHERE `country_id` = 'ecuador';

UPDATE `habanos_presence` SET `description` =
  'L''Indonésie ne possède pas de représentation Habanos. Sa contribution principale est la cape Deli Sumatra, cultivée sur des sols volcaniques depuis les plantations hollandaises du XIXe siècle. Terreuse, légèrement épicée, elle est l''une des plus employées pour les cigarillos et les cigares de milieu de gamme en Europe.'
WHERE `country_id` = 'indonesia';

UPDATE `habanos_presence` SET `description` =
  'Le Mexique n''a pas de représentation Habanos mais détient un terroir unique avec les « terres noires » volcaniques de San Andrés Tuxtla. La cape San Andrés Maduro Negro compte parmi les plus sombres qui soient : elle fermente sans additif, développant une douceur et une onctuosité rares. La famille Turrent contrôle l''essentiel de la production depuis quatre générations.'
WHERE `country_id` = 'mexico';

UPDATE `habanos_presence` SET `description` =
  'Les États-Unis sont le plus grand marché consommateur de cigares premium au monde. Le Connecticut Shade — cultivé sous voiles dans la vallée du Connecticut depuis 1900 — est l''une des capes les plus douces qui soient, employée par Macanudo, Davidoff, Ashton et des dizaines d''autres maisons. L''embargo sur Cuba (1962) a paradoxalement stimulé les industries nicaraguayenne et dominicaine, qui ont absorbé les maîtres torcedores cubains exilés.'
WHERE `country_id` = 'usa';
