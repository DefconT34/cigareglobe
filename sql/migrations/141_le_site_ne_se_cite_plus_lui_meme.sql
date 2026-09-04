-- ════════════════════════════════════════════════════════
-- 141 — Le site cesse de se citer lui-même comme source
-- ────────────────────────────────────────────────────────
-- CE QUE L'ENQUÊTE CHERCHAIT, ET CE QU'ELLE A TROUVÉ À LA PLACE.
--
-- Trois fiches citant « PDF officiel Habanos S.A. » portaient un
-- indicatif d'un autre pays, et j'en avais conclu que cette source
-- était douteuse. Mesuré : le bloc « PDF officiel » compte 110 fiches,
-- dont 5 avaient un numéro faux — soit 4,5 %, contre 8,0 % dans le
-- reste du corpus. Cette source est donc MEILLEURE que la moyenne, et
-- mon soupçon était mal placé. Elle n'est pas touchée ici.
--
-- L'excès est ailleurs. Cent quatre-vingt-une fiches revendiquent
-- « La Casa del Habano » alors que le réseau réel en compte environ
-- cent quarante. En les rangeant par source :
--
--   96  PDF officiel Habanos S.A.        plausible
--   45  ex-lcdh-locator                  déjà signalées (migration 135)
--   21  thecigarodyssey.com              ← LE SITE LUI-MÊME
--   19  habanos.com, lacasadelhabano.com, jjfox.co.uk…   sourcées
--
-- ── LE PROBLÈME ──────────────────────────────────────────
-- Soixante fiches portent `thecigarodyssey.com` en source, et
-- VINGT-HUIT d'entre elles revendiquent une affiliation officielle :
-- vingt et une « La Casa del Habano », deux « Cohiba Atmosphere », cinq
-- « Davidoff ».
--
-- Une affiliation officielle est un fait qui concerne un TIERS : elle
-- décrit une relation commerciale entre une enseigne et Habanos S.A. ou
-- Davidoff. L'affirmer sur la seule autorité du site qui l'affirme est
-- une citation circulaire — c'est-à-dire aucune source du tout.
--
-- Les vingt et une sont d'un même import du 22 mars, et toutes dans des
-- villes secondaires : Rosario, Antofagasta, Penang, Chiang Mai,
-- Cotonou, Lomé, Conakry. Ce sont précisément les endroits où une
-- succursale plausible s'invente sans qu'on aille vérifier.
--
-- ── CE QU'ON FAIT, ET CE QU'ON NE FAIT PAS ───────────────
-- On ne supprime rien : certaines de ces adresses existent sûrement, et
-- effacer sur un soupçon ferait plus de dégâts que le défaut. Le champ
-- `source` cesse simplement de laisser croire à une vérification qui
-- n'a pas eu lieu.
--
-- Deux textes, parce qu'il y a deux situations. Un hôtel qui a un
-- fumoir énonce un fait ordinaire ; une enseigne qui se dit franchisée
-- officielle engage un tiers. Les deux méritent d'être signalés, pas
-- avec la même gravité.
--
-- Après cette migration : php tools/sources.php --figer
-- ════════════════════════════════════════════════════════

-- ── Les vingt-huit qui revendiquent une affiliation ──────
UPDATE `lounges`
   SET `source`     = 'à vérifier — affiliation officielle affirmée sans source externe',
       `updated_at` = NOW()
 WHERE `source` = 'thecigarodyssey.com'
   AND (`type` LIKE '%Casa del Habano%' OR `name` LIKE 'La Casa del Habano%'
     OR `type` LIKE '%Cohiba Atmosphere%' OR `type` LIKE '%Davidoff%');

-- ── Les trente-deux autres ───────────────────────────────
UPDATE `lounges`
   SET `source`     = 'sans source externe',
       `updated_at` = NOW()
 WHERE `source` = 'thecigarodyssey.com';

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL, 'migration 141', 'systeme', 'sources_corrigees', 'lounge', 0,
   '28 affiliations officielles affirmees avec le site lui-meme pour source'),
  (NULL, 'migration 141', 'systeme', 'sources_corrigees', 'lounge', 0,
   '32 autres fiches auto-sourcees : mention rendue explicite');
