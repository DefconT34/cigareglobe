-- ════════════════════════════════════════════════════════
-- 121 — Aligner l'anglais sur le français promu, lot 3 (fin)
-- ────────────────────────────────────────────────────────
-- Dernier lot de l'alignement ouvert par la migration 119. Après celui-ci,
-- `history_en` ne porte plus les affirmations que la promotion avait
-- écartées du français.
--
-- ── LES DEUX FICHES LES PLUS CHARGÉES ───────────────────
--
-- Punch en portait CINQ à lui seul :
--   « tobacco's LONGEST-SERVING MASCOT, PREDATING EVERY CORPORATE LOGO
--     in the modern industry » — un record sans registre ;
--   « the MOST DEPENDABLY PLEASURABLE » ;
--   « ONE OF THE FORMAT'S FINEST EXPRESSIONS in the Cuban portfolio » ;
--   « the BEST-SELLING cigar brand in the British market » ;
--   « ONE OF THE MOST REVIEWED AND RE-REVIEWED cigars in Havana's
--     catalog ».
--
-- Partagás en portait trois, dont la plus révélatrice du chantier :
-- « the oldest cigar factory still in active production ANYWHERE IN THE
-- WORLD — a distinction that is architectural, historical, AND ENTIRELY
-- EARNED ». Se décerner un titre mondial, puis ajouter qu'il est mérité.
--
-- ── ET LE MÊME FAIT, CINQUIÈME RETRAIT ──────────────────
--
-- « Macanudo […] became, by the early 1980s, THE BEST-SELLING PREMIUM
-- CIGAR IN THE UNITED STATES » (General Cigar, anglais).
--
--   070 — retiré de Macanudo et de General Cigar (une seule corrigée)
--   109 — retiré du français de Macanudo
--   116 — retiré du français de General Cigar
--   119 — retiré de l'anglais de Macanudo
--   121 — retiré de l'anglais de General Cigar
--
-- Cinq retraits, un seul fait, cinq adresses. Le cas est clos, et il
-- restera l'exemple du chantier : personne n'avait jamais cherché
-- COMBIEN de fois la même phrase était écrite.
--
-- ── CE QUI EST GARDÉ ────────────────────────────────────
--
-- « the longest Cuban cigar EVER PRODUCED AT COMMERCIAL SCALE »
-- (Trinidad) et « the largest independent cigar manufacturing operation
-- IN THE DOMINICAN REPUBLIC » (Arturo Fuente, non touché ici) : deux
-- rangs bornés à un ensemble nommé et fini.
--
-- Décision assumée et inverse pour Trinidad : le français a retiré la
-- formule et gardé les 40 × 192 mm. L'anglais fait de même, par
-- cohérence — les deux colonnes doivent dire la même chose, c'est tout
-- l'objet de ce lot.
-- ════════════════════════════════════════════════════════

UPDATE `brands` SET
  `history_en` = REPLACE(REPLACE(REPLACE(`history_en`,
    'had become the benchmark for what a daily cigar should be',
    'had become the definition of what a daily cigar should be'),
    ' And they have never stopped being the reference against which every other premium cigar is measured.', ''),
    'a Double Corona of haunting complexity that connoisseurs compare to great Burgundy in the way it evolves differently in every box',
    'a Double Corona that evolves differently in every box')
WHERE `name` = 'Montecristo';

UPDATE `brands` SET `history_en` = REPLACE(`history_en`,
  'the western end of the island that would become known as Vuelta Abajo, the reference against which Cuban tobacco is judged',
  'the western end of the island that would become known as Vuelta Abajo')
WHERE `name` = 'Oliva';

UPDATE `brands` SET
  `history_en` = REPLACE(REPLACE(`history_en`,
    ' It is today the oldest cigar factory still in active production anywhere in the world — a distinction that is architectural, historical, and entirely earned.', ''),
    'became under Cuban state management what it remains today: the global benchmark for full-body cigars',
    'became under Cuban state management what it remains today: the vitola by which Cuban full-body cigars are judged')
WHERE `name` = 'Partagás';

UPDATE `brands` SET
  `history_en` = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(`history_en`,
    ' He is tobacco''s longest-serving mascot, predating every corporate logo in the modern industry.', ''),
    'During the mid-nineteenth century, Punch was the best-selling cigar brand in the British market — a position it maintained until the First World War disrupted trade and changed smoking habits permanently. The brand survived',
    'The brand survived'),
    'It is, instead, the most dependably pleasurable — the cigar that experienced smokers reach for',
    'It is, instead, the cigar that experienced smokers reach for'),
    'is one of the format''s finest expressions in the Cuban portfolio — 90 minutes',
    'gives 90 minutes'),
    'with a consistency that has made it one of the most reviewed and re-reviewed cigars in Havana''s catalog',
    'with a consistency that has made it one of the most discussed cigars in Havana''s catalog')
WHERE `name` = 'Punch';

UPDATE `brands` SET
  `history_en` = REPLACE(REPLACE(REPLACE(`history_en`,
    'Rocky Patel''s professional trajectory is the cigar industry''s most improbable success story in the American market.',
    'Rocky Patel''s professional trajectory is one of the most improbable in the American cigar industry.'),
    'represents the most comprehensive approach to market segmentation in the premium American industry',
    'represents a methodical approach to market segmentation'),
    'The 1990, 1992, and 1999 Vintages earned critical scores between 92 and 95 consistently across multiple reviews, establishing',
    'The 1990, 1992, and 1999 Vintages established')
WHERE `name` = 'Rocky Patel';

UPDATE `brands` SET
  `history_en` = REPLACE(REPLACE(`history_en`,
    'the Churchill — a distinction no other brand had offered a living statesman',
    'the Churchill'),
    ' The brand''s limited editions — released annually through Habanos S.A.''s Gran Reserva and Regional Edition programs — are among the most anticipated in the calendar.', '')
WHERE `name` = 'Romeo y Julieta';

UPDATE `brands` SET
  `history_en` = REPLACE(REPLACE(`history_en`,
    'the Fundadores: 40 x 192mm, the longest Cuban cigar ever produced at commercial scale',
    'the Fundadores: 40 x 192mm, nearly 20 centimetres'),
    'Trinidad''s production remains the smallest of any major Cuban house. The factory allocates',
    'The factory allocates')
WHERE `name` = 'Trinidad';

UPDATE `brands` SET `history_en` = REPLACE(`history_en`,
  'Nicaragua''s most celebrated cigar brand was created by the government',
  'the country''s best-known cigar brand was created by the government')
WHERE `name` = 'Joya de Nicaragua';

UPDATE `brands` SET `history_en` = REPLACE(`history_en`,
  'The Havana house today produces some of the most underrated cigars in the Cuban portfolio. The Magnum 46',
  'The Magnum 46')
WHERE `name` = 'H. Upmann';

UPDATE `brands` SET `history_en` = REPLACE(`history_en`,
  'a brand positioned for accessibility and consistency that became, by the early 1980s, the best-selling premium cigar in the United States. Macanudo''s commercial success funded',
  'a brand positioned for accessibility and consistency, whose commercial success funded')
WHERE `name` = 'General Cigar';

UPDATE `brands` SET `history_en` = REPLACE(`history_en`,
  'over the Jalapa filler blend that several reviewers described as the most accomplished Nicaraguan cigar they had smoked',
  'over the Jalapa filler blend')
WHERE `name` = 'Perdomo';

UPDATE `brands` SET `history_en` = REPLACE(`history_en`,
  'The brand has continued without chasing effect. The Tempus',
  'The brand has continued without chasing effect: the Tempus')
WHERE `name` = 'Alec Bradley';
