-- ════════════════════════════════════════════════════════
-- 079 — Une note de presse sans chiffre
-- ────────────────────────────────────────────────────────
-- Cohiba annonçait, sur la Behike BHK :
--
--   « Score parfait par plusieurs experts. »
--
-- Dans les six langues, français compris. Le contrôle était vert.
--
-- ── POURQUOI ────────────────────────────────────────────
--
-- Le motif cherchait `\bscores?\b[^.]{0,30}?\b\d{2,3}\b` : le mot
-- « score » ET un nombre. « Parfait » dit exactement « 100/100 » sans
-- écrire 100.
--
-- C'est la huitième forme de la même affirmation depuis la migration
-- 059, et la première qui se passe entièrement de chiffre. Toutes les
-- précédentes en portaient un — c'était l'hypothèse tacite du motif, et
-- personne ne l'avait écrite.
--
-- ── DEUX AUTRES, DANS L'ANGLAIS SEUL ────────────────────
--
-- Trouvées en balayant les colonnes traduites (migration 078) :
--
--   Montecristo : « Cigar Aficionado awarded it 96 points in 2022 — the
--   highest score ever given to a regular production Cuban cigar. »
--
--   Drew Estate : « the most critically acclaimed premium cigar of the
--   year alongside the best-selling flavored cigar in the country ».
--
-- Aucune des deux n'existe en français. Ce ne sont donc pas des
-- traductions : l'anglais affirme ce que le français ne dit pas. Même
-- constat que la migration 078 sur la longueur des récits.
--
-- ── UN FAUX POSITIF, POUR MÉMOIRE ───────────────────────
--
-- Le balayage arabe a levé El Titan de Bronze sur « سيجار العام ». La
-- séquence chevauche deux mots de « مصانع السيجار العاملة » — « les
-- fabriques de cigares en activité ». Rien à corriger : c'est mon motif
-- qui coupe au mauvais endroit, faute de frontière de mot fiable en
-- arabe.
-- ════════════════════════════════════════════════════════

-- ── Cohiba : les six langues ────────────────────────────
UPDATE `brands` SET
  `gamme`    = REPLACE(`gamme`,    ' Score parfait par plusieurs experts.', ''),
  `gamme_en` = REPLACE(`gamme_en`, ' Perfect scores from multiple experts.', ''),
  `gamme_es` = REPLACE(`gamme_es`, ' Puntuaciones perfectas de múltiples expertos.', ''),
  `gamme_de` = REPLACE(`gamme_de`, ' Perfekte Bewertungen von mehreren Experten.', ''),
  `gamme_zh` = REPLACE(`gamme_zh`, '多位专家给予满分评价。', ''),
  `gamme_ar` = REPLACE(`gamme_ar`, ' تقييمات مثالية من خبراء متعددين.', '')
WHERE `name` = 'Cohiba';

-- ── Montecristo : l'anglais seul ────────────────────────
UPDATE `brands` SET `history_en` = REPLACE(`history_en`,
  'Cigar Aficionado awarded it 96 points in 2022 — the highest score ever given to a regular production Cuban cigar in that publication''s history.',
  'It remains the vitola by which the house is most often judged.')
WHERE `name` = 'Montecristo';

-- ── Drew Estate : l'anglais seul ────────────────────────
UPDATE `brands` SET `history_en` = REPLACE(`history_en`,
  'A house capable of producing the most critically acclaimed premium cigar of the year alongside the best-selling flavored cigar in the country occupies a position in the industry that no prior category could describe.',
  'A house that makes both a sought-after premium cigar and a widely sold flavoured one occupies a position in the industry no earlier category could describe.')
WHERE `name` = 'Drew Estate';
