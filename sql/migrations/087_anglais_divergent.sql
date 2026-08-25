-- ════════════════════════════════════════════════════════
-- 087 — Ce que l'anglais affirmait tout seul
-- ────────────────────────────────────────────────────────
-- La mesure de divergence a montré que sur 118 fiches, l'anglais de
-- `history` est bien une traduction pour 75 d'entre elles — médiane du
-- rapport de longueur : 0,96. Mais QUARANTE-TROIS dépassent x1,6,
-- jusqu'à x7,14. Là, ce n'est plus une version : c'est un autre texte.
--
-- Or les contrôles de contenu du projet — paroles prêtées, superlatifs,
-- affirmations sur des personnes — tournent sur le FRANÇAIS. Ce que
-- l'anglais dit en plus n'a jamais été relu.
--
-- Le balayage de ces 43 fiches trouve sept affirmations qui n'auraient
-- pas passé la relecture française :
--
-- ── UNE CONSOMMATION DE TABAC ATTRIBUÉE ─────────────────
--
--   Avo : « died in February 2017 at the age of 89, HAVING SMOKED HIS
--   OWN CIGARS DAILY throughout his final years. »
--
-- C'est exactement la catégorie que l'inventaire initial avait bannie :
-- « 4 affirmations sur la consommation de tabac de personnes nommées ».
-- Invérifiable, et sur un site consacré au tabac, ce n'est pas anodin.
-- Le mois précis part avec : je ne peux pas le confirmer.
--
-- ── QUATRE SUPERLATIFS MONDIAUX ─────────────────────────
--
--   Cohiba      : « the world's most prestigious cigar »
--   Cohiba      : « the world's most counterfeited cigar band »
--   Montecristo : « the world's best-selling cigar »
--   Plasencia   : « the most important independent tobacco family in
--                 the world »
--   Bolívar     : « the most experienced tasters in the world »
--
-- Les migrations R1, R4 et R5 ont retiré tous les rangs mondiaux non
-- sourcés du français. Personne ne publie de classement mondial des
-- ventes de cigares, ni de palmarès des dégustateurs.
--
-- ── ET UNE NOTE DE PRESSE DE PLUS ───────────────────────
--
--   My Father : « Two number-one rankings in four years », suivi de
--   « The technical explanation for THIS RECORD ».
--
-- La migration 076 avait retiré ce palmarès du français. L'anglais le
-- gardait, et la phrase suivante y renvoyait — de sorte qu'en le
-- retirant seul, on laissait un « ce palmarès » sans antécédent. Les
-- deux phrases partent ensemble.
--
-- Dixième forme de la même affirmation depuis la migration 059 :
-- « number-one rankings ». Le balayage par NOM DE REVUE (migration 086)
-- ne l'attrape pas non plus — celle-ci ne cite aucune revue.
--
-- ── CE QUI RESTE OUVERT ─────────────────────────────────
--
-- Les 43 fiches restent divergentes en volume : l'anglais y raconte plus
-- que le français. Ce lot corrige ce qui est FAUX ou invérifiable, pas
-- l'écart lui-même. Aligner les six colonnes demanderait de retraduire
-- ~65 000 caractères, ou d'enrichir le français à partir d'un anglais
-- dont je ne peux vérifier aucune source. Les deux dépassent ce lot.
-- ════════════════════════════════════════════════════════

-- ── Avo : la consommation attribuée ─────────────────────
UPDATE `brands` SET `history_en` = REPLACE(`history_en`,
  'Avo Uvezian died in February 2017 at the age of 89, having smoked his own cigars daily throughout his final years.',
  'Avo Uvezian died in 2017, at eighty-nine.')
WHERE `name` = 'Avo';

-- ── Cohiba : deux rangs mondiaux ────────────────────────
UPDATE `brands` SET `history_en` = REPLACE(`history_en`,
  'The irony is perfect — the world''s most prestigious cigar bears the most ancient and universal name for what it is.',
  'The irony is perfect: a cigar wrapped in protocol carries the oldest and plainest name for what it is.')
WHERE `name` = 'Cohiba';

UPDATE `brands` SET `history_en` = REPLACE(`history_en`,
  'It is also the world''s most counterfeited cigar band — a distinction that measures the brand''s reach better than any sales figure.',
  'Counterfeit bands circulate widely, which says more about the brand''s reach than any sales figure would.')
WHERE `name` = 'Cohiba';

-- ── Montecristo : le rang de ventes ─────────────────────
UPDATE `brands` SET `history_en` = REPLACE(`history_en`,
  'It is today the world''s best-selling cigar, a distinction it has held for decades.',
  'It has stayed at the centre of the range ever since.')
WHERE `name` = 'Montecristo';

-- ── Plasencia : le rang de famille ──────────────────────
UPDATE `brands` SET `history_en` = REPLACE(`history_en`,
  'to emerge as arguably the most important independent tobacco family in the world.',
  'and the family has kept growing tobacco through all of it.')
WHERE `name` = 'Plasencia';

-- ── Bolívar : le palmarès des dégustateurs ──────────────
UPDATE `brands` SET `history_en` = REPLACE(`history_en`,
  'They are the consistent testimony of the most experienced tasters in the world, reviewing Bolívar across decades and formats.',
  'They describe what the cigar does, and they have described it the same way across decades and formats.')
WHERE `name` = 'Bolivar';

-- ── My Father : le palmarès, et la phrase qui y renvoie ──
UPDATE `brands` SET `history_en` = REPLACE(`history_en`,
  'The technical explanation for this record is straightforward to describe and impossible to fully replicate: Pepin García rolls the prototype vitolas himself.',
  'What is easy to describe and impossible to copy: Pepin García rolls the prototype vitolas himself.')
WHERE `name` = 'My Father';

-- La phrase qui PORTE le palmarès, et non plus celle qui y renvoie.
-- Retirée dans un second temps : la première passe n'avait traité que la
-- suivante, ce qui laissait l'affirmation en place et son commentaire
-- orphelin. Les deux vont ensemble.
UPDATE `brands` SET `history_en` = REPLACE(`history_en`,
  'Two number-one rankings in four years, from a two-person operation based in a building Pepin and Jaime had constructed themselves.',
  'All of it from a two-person operation, in a building Pepin and Jaime had put up themselves.')
WHERE `name` = 'My Father';

-- Un sixième rang mondial, sur une RÉGION cette fois : « Vuelta Abajo,
-- the world's most celebrated tobacco-growing region ». Moins spectaculaire
-- qu'un rang de ventes, même nature : une notoriété que rien ne mesure.
UPDATE `brands` SET `history_en` = REPLACE(`history_en`,
  'that would eventually become recognized as Vuelta Abajo, the world''s most celebrated tobacco-growing region.',
  'that would become known as Vuelta Abajo, the reference against which Cuban tobacco is judged.')
WHERE `name` = 'Oliva';

-- « what many experts consider the most complex cigar ever commercially
-- released » : le « many experts consider » n'est pas une source, c'est
-- une façon de ne pas en donner. Septième rang mondial de ce lot.
UPDATE `brands` SET `history_en` = REPLACE(`history_en`,
  'it produced what many experts consider the most complex cigar ever commercially released.',
  'it produced the most ambitious cigar the brand has released.')
WHERE `name` = 'Cohiba';
