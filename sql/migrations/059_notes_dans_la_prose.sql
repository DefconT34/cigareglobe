-- ════════════════════════════════════════════════════════
-- 059 — Les notes que la migration 058 n'avait pas atteintes
-- ────────────────────────────────────────────────────────
-- La migration 058 a vidé la colonne `scores`. Treize récits de vitoles
-- portaient la MÊME affirmation en texte — « Score 96 », « Cigar de
-- l'Année n°1 Cigar Aficionado 2011 » — là où on ne la cherchait pas.
--
-- C'est exactement le motif de la migration 031 : « Premier exportateur
-- mondial » avait été retiré de `rev_detail` par 028 et avait survécu
-- dans `notes` pendant trois migrations. Un fait retiré d'un champ
-- continue de vivre dans les autres tant que personne ne les regarde.
--
-- ── ET DEUX PAROLES QUE MON PROPRE CONTRÔLE A RATÉES ────
--
-- `marques_check.php` cherchait le verbe AVANT la citation — « il aurait
-- dit : '…' ». Bolívar portait la forme inverse, « '…', aurait-il dit »,
-- et y a survécu. Rocky Patel aussi. Une anecdote entière est passée à
-- travers un contrôle écrit pour elle.
--
-- Le motif accepte désormais les deux ordres. Ces deux entrées partent.
--
-- ── POURQUOI RÉÉCRIRE PLUTÔT QUE SUPPRIMER PAR MOTIF ────
--
-- Retirer la note par expression régulière laissait des phrases
-- boiteuses : « Lancée 2004, Cigar Aficionado. », « Score 96 lors du
-- lancement. » devenant « lors du lancement. ». Une correction
-- automatique qui produit du français cassé n'est pas une correction.
--
-- Les treize récits sont donc réécrits à la main. Le reste du texte —
-- format, assemblage, notes de dégustation — ne bouge pas : ce sont des
-- faits de produit, pas des appréciations de presse.
--
-- Les cinq colonnes traduites de ces treize récits deviennent périmées.
-- Pour la plupart elles contiennent DÉJÀ l'anglais mot pour mot (voir
-- tools/i18n_langue_check.php) : elles seront reprises avec le reste du
-- chantier de langue.
-- ════════════════════════════════════════════════════════

-- ── Les deux paroles inventées ──────────────────────────

UPDATE `brands` SET
  `celebrities`    = JSON_REMOVE(`celebrities`,    '$[0]'),
  `celebrities_en` = JSON_REMOVE(`celebrities_en`, '$[0]'),
  `celebrities_es` = JSON_REMOVE(`celebrities_es`, '$[0]'),
  `celebrities_de` = JSON_REMOVE(`celebrities_de`, '$[0]'),
  `celebrities_zh` = JSON_REMOVE(`celebrities_zh`, '$[0]'),
  `celebrities_ar` = JSON_REMOVE(`celebrities_ar`, '$[0]')
WHERE `name` = 'Bolivar';

UPDATE `brands` SET
  `celebrities`    = JSON_REMOVE(`celebrities`,    '$[0]'),
  `celebrities_en` = JSON_REMOVE(`celebrities_en`, '$[0]'),
  `celebrities_es` = JSON_REMOVE(`celebrities_es`, '$[0]'),
  `celebrities_de` = JSON_REMOVE(`celebrities_de`, '$[0]'),
  `celebrities_zh` = JSON_REMOVE(`celebrities_zh`, '$[0]'),
  `celebrities_ar` = JSON_REMOVE(`celebrities_ar`, '$[0]')
WHERE `name` = 'Rocky Patel';

-- ── Les treize récits, réécrits ─────────────────────────

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'Format Torpedo (52 x 152mm) box-pressed. Blend hondurien-guatémaltèque-nicaraguayen, cape Jamastrán du Honduras. Notes de poivre noir intense, café espresso, noix de cajou grillée. La section rectangulaire du box-pressé change la combustion — les arômes en sortent plus concentrés.')
WHERE `name` = 'Alec Bradley';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'Lancé en 1995, le grand cigare dominicain. Cape Château de la Fuente — plantation à part, production confidentielle. Notes d''espresso, poivre rouge, cèdre doré, caramel. La Perfección (double figurado) est la forme la plus recherchée. Disponibilité aléatoire, et un prix de revente qui atteint plusieurs fois le prix catalogue : l''un des cigares les plus spéculatifs du marché.')
WHERE `name` = 'Arturo Fuente';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[1].story',
  'Lancée en 1999 — l''autre Ashton. Cape équatorienne sun-grown sur assemblage nicaraguayen-dominicain. Corsée : café noir, chocolat, poivre de Cayenne. La VSG révèle une maison capable de puissance quand elle choisit de l''exercer.')
WHERE `name` = 'Ashton';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[1].story',
  'L''autre visage de Drew Estate — le plus sérieux, le plus recherché. Cape Connecticut Broadleaf Habano sur triple ligero nicaraguayen. Notes de café ristretto, cacao amer, mûre. La Flying Pig, perfecto court et trapu, est le format le plus rare et le plus cher de la gamme.')
WHERE `name` = 'Drew Estate';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[1].story',
  'Lancée en 2015, cape Connecticut Broadleaf maduro sur dominicain. Notes de pain d''épices, cardamome, café indonésien. Format Robusto (52 x 127mm). L''Air Bender passe pour le meilleur rapport qualité-prix de la maison.')
WHERE `name` = 'La Flor Dominicana';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'Le mélange originel — cape Connecticut Broadleaf Habano sur triple ligero nicaraguayen. Notes de café espresso ristretto, cacao amer, mûre écrasée, cuir de sellerie. Le Toro (52 x 152mm) est le format canonique. Le premier lot est parti en quarante-cinq minutes dans une boutique de Denver.')
WHERE `name` = 'Liga Privada';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'Torpedo (52 x 152mm). Assemblage nicaraguayen complexe, cape Habano oscuro d''Équateur. Notes de cèdre rouge, café macchiato, poivre cubèbe. La référence de la maison — chaque lot est attendu comme un millésime.')
WHERE `name` = 'My Father';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[1].story',
  'Lancé en 2008, le cigare inaugural de la maison. Cape Connecticut naturel d''Équateur sur nicaraguayen. Notes de crème, noisette, épices légères. Malgré son statut de premier essai, le No.1 n''a jamais quitté le catalogue — Pepín avait vu juste dès le début.')
WHERE `name` = 'My Father';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'Lancée en 2004. Le Melanio (52 x 143mm) en est la pièce maîtresse. Cape Sumatra d''Équateur sur double ligero nicaraguayen. Notes de poivre noir intense, café, noix macadamia, et une finale qui n''en finit pas.')
WHERE `name` = 'Oliva';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'Lancée en 1994. Medium-corsée, cape maduro ou naturel. La pièce maîtresse de la maison. Notes profondes de chocolat noir, café espresso, noix de coco grillée. Le format Exclusivo (50 x 143mm) a ses partisans convaincus. Tabac vieilli quatre ans au minimum.')
WHERE `name` = 'Padrón';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'Lancée en 2012. Cape nicaraguayenne oscuro vieillie cinq ans — un cigare entièrement nicaraguayen. Notes de chocolat noir, café serré, poivre noir long, finale en cuir. Le Toro Sun Grown Natural (54 x 152mm) est le format que la maison recommande.')
WHERE `name` = 'Perdomo';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'Lancée en 2018. Box-pressée, format Robustus Magnus (58 x 127mm). Cape nicaraguayenne oscuro sur triple ligero venu de leurs propres plantations. Notes de café glacé, cuir rouge, poivre de Kampot, réglisse. La déclaration d''indépendance de la famille Plasencia.')
WHERE `name` = 'Plasencia';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'Le Gran Corona (55 x 180mm), le plus ambitieux de la gamme — quatre-vingt-dix minutes qui passent par le bois, les épices, le cuir et le chocolat. Quelques milliers d''unités par an. C''est la vitole qui attire les collectionneurs vers la marque.')
WHERE `name` = 'Vegas Robaina';
