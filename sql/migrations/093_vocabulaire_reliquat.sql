-- ════════════════════════════════════════════════════════
-- 093 — Le reliquat, et une table que rien ne balayait
-- ────────────────────────────────────────────────────────
-- Après les migrations 089 à 092, huit textes restaient signalés. Cinq
-- sont des NOMS PROPRES qu'il faut garder : « VSG — Virgin Sun Grown »
-- est le nom d'une gamme Ashton, « American Barrel-Aged » celui d'une
-- gamme Camacho, « Toro Sun Grown Natural » celui d'un format Perdomo,
-- et « Smooth Jazz » un genre musical.
--
-- Les trois autres sont réels.
--
-- ── UN CONDITIONNEL DE PLUS SUR SINATRA ─────────────────
--
-- Avo, récit de la gamme fondatrice : « Le cigare que Sinatra AURAIT
-- AIMÉ fumer après un concert ».
--
-- La migration 060 s'appelait « avo_sinatra » : elle avait retiré
-- « Sinatra aurait fumé les premiers prototypes Avo ». Elle a traité
-- l'anecdote et laissé le récit de gamme. Le lien réel — Uvezian était
-- l'ami de Sinatra — figure dans `celebrities` et se suffit.
--
-- C'est le sixième cas de correction partielle du chantier : un même
-- fait écrit à deux endroits, corrigé à un seul.
--
-- ── UNE DISTINCTION DE PRESSE DANS `lounges` ────────────
--
-- « BURN by Rocky Patel — Naples FL » annonce « Cigar Journal Award ».
--
-- `marques_check` balaie les quatre champs narratifs de `brands`, dans
-- les six langues, depuis les migrations 077 et 086. Il ne regarde pas
-- `lounges`. Cinq cents fiches d'établissements, écrites en partie par
-- des contributeurs, hors de tout contrôle d'affirmation.
--
-- La fiche annonce aussi « 77 000 cigares en stock, 270 facings ». Les
-- deux chiffres viennent de l'établissement lui-même et personne ne les
-- a comptés ; « facings » est en outre un terme de marchandisage
-- anglais. La phrase dit désormais ce qui s'observe en entrant.
--
-- ── ET UN SUPERLATIF DE MARCHÉ ──────────────────────────
--
-- Ashton : ses cigares Connecticut sont « parmi les plus crémeux et les
-- mieux construits DU MARCHÉ ». Ni « monde » ni « industrie » : le motif
-- ne le voyait pas.
-- ════════════════════════════════════════════════════════

UPDATE `brands` SET `history` = REPLACE(`history`,
  'Ses cigares Connecticut sont parmi les plus crémeux et les mieux construits du marché ;',
  'Ses cigares Connecticut sont d''une régularité de construction que peu de maisons tiennent ;')
WHERE `name` = 'Ashton';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'enveloppe un Dominican aged de la manufacture Fuente',
  'enveloppe des tabacs dominicains vieillis chez Fuente')
WHERE `name` = 'Ashton Cabinet';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'La gamme fondatrice — cape Connecticut Shade sur dominicain vieilli. Notes de crème, vanille, café au lait. Chaque vitole porte un numéro, du No.1 au No.9, selon le format. Douce, musicale, sans agression : c''est la gamme où le métier de pianiste du fondateur s''entend le mieux.')
WHERE `name` = 'Avo';

-- ── lounges ─────────────────────────────────────────────
UPDATE `lounges` SET `description` =
  '1re boutique BURN, ouverte en 2010. Vaste stock, présentation en rayonnages ouverts, et une carte de restauration complète — c''est un lieu où l''on passe la soirée, pas seulement l''achat.'
WHERE `name` = 'BURN by Rocky Patel — Naples FL';

UPDATE `lounges` SET `description` =
  'Brasserie artisanale primée, qui associe ses bières à des cigares locaux. Terrasse, cave humidifiée où l''on entre, accords bières-cigares honduriens et nicaraguayens.'
WHERE `name` = 'Cigar City Brewing — Cigar Bar';
