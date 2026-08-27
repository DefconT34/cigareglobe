-- ════════════════════════════════════════════════════════
-- 120 — Aligner l'anglais sur le français promu, lot 2
-- ────────────────────────────────────────────────────────
-- ── LE BALAYAGE, PLUTÔT QUE MA MÉMOIRE ──────────────────
--
-- Le lot 1 (migration 119) traitait ce que j'avais noté dans mes propres
-- en-têtes. Ce lot part d'un balayage des 40 fiches anglaises.
--
-- Premier jeu de motifs — rangs, presse, consensus, absolus : DOUZE
-- signalements. Second jeu, élargi aux formes que j'avais retirées sans
-- les inscrire dans un motif — « benchmark », « the standard against
-- which », « most celebrated », « longest-serving », « best-selling »,
-- « entirely earned », « reads like a directory » : TRENTE-TROIS DE PLUS.
--
-- Mes premiers motifs voyaient un quart du problème. C'est la même leçon
-- qu'aux migrations 098 et 100 : un motif écrit après coup ne couvre que
-- ce dont on se souvient, et il faut le confronter au texte réel.
--
-- ── CE QUI EST RETIRÉ ───────────────────────────────────
--
-- Alec Bradley : « without the consistent NUMBER-ONE RANKINGS that come,
--   by definition, only once a year » — le classement annuel de la
--   presse, quatrième sortie du prix 2011 de cette maison.
-- Arturo Fuente : « had become THE BENCHMARK Dominican cigar
--   manufacturer » — la preuve qui suit dit mieux et se vérifie.
-- Ashton : « access to THE FINEST Dominican sourcing and manufacturing
--   precision IN THE ISLAND'S INDUSTRY ».
-- CAO America : « THE MOST CELEBRATED shade-grown leaf in the Americas —
--   THE STANDARD AGAINST WHICH every other Connecticut-style wrapper is
--   measured ».
-- Camacho : « Cuban corojo wrapper was THE STANDARD AGAINST WHICH every
--   other wrapper tobacco was measured ».
-- Henri Wintermans : « ONE OF THE MOST RECOGNIZED cigar formats in
--   European history » ; « mechanisms that NO OTHER EUROPEAN MARKET
--   COULD MATCH ».
-- La Flor Dominicana : « THE LARGEST COMMERCIALLY PRODUCED CIGAR IN THE
--   WORLD » ; « HAS NO EQUIVALENT in the commercial market ».
-- Plasencia : « reads like a directory of THE AMERICAN MARKET'S FINEST » ;
--   « NO OTHER INDEPENDENT GROWER APPROACHES THAT SCALE ».
-- Perdomo Ecuador : « AMERICA'S MOST CELEBRATED wrapper leaf » ; « the
--   MOST ELEGANT STYLE IN THE MARKET ».
-- Tabacalera : « NO OTHER MAJOR GROWING REGION PRODUCES IT ».
-- Te Amo : « a chocolate complexity FOUND IN NO OTHER WRAPPER VARIETY at
--   comparable consistency » ; « HAS EARNED THE BRAND ATTENTION IN THE
--   SPECIALIST PRESS ».
--
-- ── CE QUI EST GARDÉ, ET POURQUOI ───────────────────────
--
-- « cigars of absolute WORLD-CLASS quality » (Ashton Cabinet) : la
-- phrase attribue explicitement ce jugement à la PRÉMISSE DE TAYLOR en
-- 1985 — « with a premise that […] could produce ». Le français promu
-- dit la même chose. L'atlas rapporte une conviction, il ne la porte pas.
--
-- « the Camachos were AMONG ITS MOST ACCOMPLISHED practitioners » : borné
-- à un artisanat et relatif, exactement comme le français « comptaient
-- parmi ceux qui le maîtrisaient le mieux ».
--
-- « the longest continuous period HE SPENT ANYWHERE » (Hemingway à
-- Cuba) : un fait biographique, que le motif attrape parce qu'il cherche
-- « anywhere ». Un faux positif du balayage, pas un défaut du texte.
-- ════════════════════════════════════════════════════════

UPDATE `brands` SET `history_en` = REPLACE(`history_en`,
  'The brand has continued producing critically acclaimed work without the consistent number-one rankings that come, by definition, only once a year.',
  'The brand has continued without chasing effect.')
WHERE `name` = 'Alec Bradley';

UPDATE `brands` SET `history_en` = REPLACE(`history_en`,
  'By the late 1980s, Arturo Fuente had become the benchmark Dominican cigar manufacturer. Other houses sent',
  'By the late 1980s, other houses sent')
WHERE `name` = 'Arturo Fuente';

UPDATE `brands` SET `history_en` = REPLACE(`history_en`,
  ' This arrangement gives Ashton access to the finest Dominican sourcing and manufacturing precision in the island''s industry.',
  '')
WHERE `name` = 'Ashton';

UPDATE `brands` SET `history_en` = REPLACE(`history_en`,
  'where the famously sandy loam soil produces the most celebrated shade-grown leaf in the Americas — the standard against which every other Connecticut-style wrapper is measured',
  'where the famously sandy loam soil produces the shade-grown leaf that made the style''s reputation')
WHERE `name` = 'CAO America';

UPDATE `brands` SET `history_en` = REPLACE(`history_en`,
  'Dark, oily, consistently textured, Cuban corojo wrapper was the standard against which every other wrapper tobacco was measured.',
  'Dark, oily, consistently textured, it gave Havana''s cigars their recognisable look and scent.')
WHERE `name` = 'Camacho';

UPDATE `brands` SET
  `history_en` = REPLACE(REPLACE(`history_en`,
    'became the house''s defining product and one of the most recognized cigar formats in European history',
    'became the house''s defining product'),
    'mechanisms for selecting and aging Javanese and Sumatran tobacco that no other European market could match',
    'mechanisms for selecting and aging Javanese and Sumatran tobacco that few other European markets possessed')
WHERE `name` = 'Henri Wintermans';

UPDATE `brands` SET
  `history_en` = REPLACE(REPLACE(`history_en`,
    'a Double Torpedo measuring 75 x 184mm, making it the largest commercially produced cigar in the world',
    'a Double Torpedo measuring 75 x 184mm'),
    'to deep earth and dark chocolate in the final half-hour — has no equivalent in the commercial market',
    'to deep earth and dark chocolate in the final half-hour — is as much an endurance test as a pleasure')
WHERE `name` = 'La Flor Dominicana';

UPDATE `brands` SET
  `history_en` = REPLACE(REPLACE(`history_en`,
    'depends on Plasencia leaf reads like a directory of the American market''s finest',
    'depends on Plasencia leaf reads like a directory of the American market'),
    ' No other independent grower approaches that scale.', '')
WHERE `name` = 'Plasencia';

UPDATE `brands` SET
  `history_en` = REPLACE(REPLACE(`history_en`,
    'where sandy soil and diffuse light have produced America''s most celebrated wrapper leaf for over two centuries',
    'where sandy soil and diffuse light have produced the wrapper leaf that made American tobacco''s reputation, for over two centuries'),
    'can produce the most elegant style in the market when applied to lighter materials',
    'can produce an elegance that owes nothing to strength when applied to lighter materials')
WHERE `name` = 'Perdomo Ecuador';

UPDATE `brands` SET `history_en` = REPLACE(`history_en`,
  'No other major growing region produces it, and blenders who seek it have historically had no choice but to source from the Philippines.',
  'Blenders who seek that character have historically sourced from the Philippines.')
WHERE `name` = 'Tabacalera';

UPDATE `brands` SET
  `history_en` = REPLACE(REPLACE(`history_en`,
    'develops its inherent sweetness into a chocolate complexity found in no other wrapper variety at comparable consistency',
    'develops its inherent sweetness into a chocolate complexity of rare consistency'),
    'to the serious premium range that has earned the brand attention in the specialist press',
    'to a more demanding premium range')
WHERE `name` = 'Te Amo';
