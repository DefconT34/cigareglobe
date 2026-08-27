-- ════════════════════════════════════════════════════════
-- 119 — Aligner l'anglais sur le français promu, lot 1
-- ────────────────────────────────────────────────────────
-- ── UNE DETTE QUE J'AI CRÉÉE ────────────────────────────
--
-- La campagne de promotion (migrations 101 à 118) a porté 63 066
-- caractères d'anglais vers le français, en FILTRANT au passage une
-- vingtaine d'affirmations non sourçables : cinq notes de presse, quatre
-- variantes de « many experts consider », une quinzaine de rangs.
--
-- Le filtrage s'est appliqué au texte qui ENTRAIT en français. Il n'a
-- rien retiré du texte anglais, qui est resté tel quel.
--
-- Vérification faite sur dix affirmations documentées dans les en-têtes
-- de 101 à 118 : DIX SUR DIX sont encore dans `history_en`. Le français
-- est propre, l'anglais ne l'est pas, et c'est l'anglais que lisent les
-- anglophones aujourd'hui.
--
-- ── POURQUOI CE LOT PASSE AVANT LA TRADUCTION ───────────
--
-- Les 200 traductions « en attente » se répartissent ainsi :
--   40 en anglais — qui n'ont pas besoin d'être TRADUITES (l'anglais est
--     la source du contenu) mais d'être CORRIGÉES des affirmations que
--     le français a écartées ;
--   160 en es/de/zh/ar — soit environ 346 000 caractères de traduction
--     réelle, plusieurs dizaines d'heures.
--
-- Le premier tiers coûte le moins et corrige des défauts en production.
-- Le reste est du volume. On commence par les défauts.
--
-- ── CE LOT ──────────────────────────────────────────────
--
-- Quatre fiches, neuf affirmations. Les phrases sont retirées ou
-- ramenées à leur part vérifiable, exactement comme en français — et,
-- quand le français a trouvé une meilleure formulation, c'est elle qui
-- est reportée.
--
-- Arturo Fuente : « earned SCORES IN THE UPPER 90s » — la liste
--   d'attente, elle, est le fait observable et reste.
-- Cohiba : « the UNDISPUTED APEX of Cuban tobacco » (phrase entière
--   retirée) ; « more checkpoints THAN ANY OTHER CUBAN BRAND » ;
--   « The waiting lists are LONGER THAN THE CIGAR ITSELF » — une mesure
--   sans mesure.
-- Davidoff : « consistently EARN SCORES BETWEEN 92 AND 96 » et « at the
--   APEX of the accessible premium market » ; « positioned them ABOVE
--   EVERY OTHER CIGAR IN THE WORLD » ; « the ASPIRATIONAL PEAK of cigar
--   culture ».
-- Macanudo : « earning SCORES ABOVE 90 from specialist publications » ;
--   « THE BEST-SELLING PREMIUM CIGAR IN THE UNITED STATES » — quatrième
--   retrait de ce seul fait, après 070, 109 et 116.
-- ════════════════════════════════════════════════════════

UPDATE `brands` SET `history_en` = REPLACE(`history_en`,
  'the Opus X, in a Double Corona format, earned scores in the upper 90s and created a waiting list that persists thirty years later',
  'the Opus X, in a Double Corona format, created a waiting list that persists thirty years later')
WHERE `name` = 'Arturo Fuente';

UPDATE `brands` SET
  `history_en` = REPLACE(`history_en`, 'Today, Cohiba stands as the undisputed apex of Cuban tobacco. ', '')
WHERE `name` = 'Cohiba';

UPDATE `brands` SET
  `history_en` = REPLACE(`history_en`,
    'Each cigar leaving El Laguito passes through more quality control checkpoints than any other Cuban brand.',
    'Each cigar leaving El Laguito passes through a series of quality control checkpoints.')
WHERE `name` = 'Cohiba';

UPDATE `brands` SET
  `history_en` = REPLACE(`history_en`, ' The waiting lists are longer than the cigar itself.', '')
WHERE `name` = 'Cohiba';

UPDATE `brands` SET
  `history_en` = REPLACE(`history_en`,
    'The Davidoff Millennium Blend, the Signature, and the Year of the series consistently earn scores between 92 and 96 and maintain the brand''s position at the apex of the accessible premium market.',
    'The Davidoff Millennium Blend, the Signature, and the Year of the series carry that argument in the market today.')
WHERE `name` = 'Davidoff';

UPDATE `brands` SET
  `history_en` = REPLACE(`history_en`,
    'at price points and in packaging that explicitly positioned them above every other cigar in the world',
    'at price points and in packaging that deliberately set them apart')
WHERE `name` = 'Davidoff';

UPDATE `brands` SET
  `history_en` = REPLACE(`history_en`,
    'became, for 22 years, the aspirational peak of cigar culture — the object of desire for anyone who understood what a cigar was supposed to be and was willing to pay accordingly',
    'became, for 22 years, the object of desire for anyone who understood what a cigar was supposed to be and was willing to pay accordingly')
WHERE `name` = 'Davidoff';

UPDATE `brands` SET
  `history_en` = REPLACE(`history_en`,
    'The strategy has produced mixed but largely positive results, with several Inspirado releases earning scores above 90 from specialist publications.',
    'The strategy has produced mixed but largely positive results.')
WHERE `name` = 'Macanudo';

UPDATE `brands` SET
  `history_en` = REPLACE(`history_en`,
    'Through the 1980s and into the 1990s, Macanudo Café was the best-selling premium cigar in the United States — a position it held for over twenty consecutive years. Every airport newsstand',
    'Through the 1980s and into the 1990s, every airport newsstand')
WHERE `name` = 'Macanudo';
