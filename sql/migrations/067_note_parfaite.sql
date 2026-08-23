-- ════════════════════════════════════════════════════════
-- 067 — La note parfaite, cinquième forme
-- ────────────────────────────────────────────────────────
-- Padrón annonçait « Score parfait 100/100 par Cigar Aficionado pour le
-- No.1 Maduro en 2002 », suivi de « le cigare le plus récompensé de
-- l'histoire de la revue ».
--
-- Le motif exigeait DEUX chiffres — `\b\d{2}\b`. La frontière de mot
-- bloque sur le troisième : « 100 » n'a jamais déclenché.
--
-- ── LE COMPTE DES FORMES ────────────────────────────────
--
--   059  « Score 96 »
--   061  « Score Cigar Aficionado 93 »     — le nom s'intercale
--   064  « Top 25 », « classé parmi les 25 meilleurs »
--   065  « scores 93-95 »                  — le pluriel
--   067  « Score parfait 100/100 »         — trois chiffres
--
-- Cinq fois, un contrôle écrit pour cette affirmation a raté cette
-- affirmation. À ce stade ce n'est plus une série de maladresses, c'est
-- une propriété du procédé : un motif reconnaît une écriture, pas une
-- idée. Le seul remède qui ait marché à chaque fois n'est pas un motif
-- plus large — c'est d'aller RELIRE les données et d'y chercher la même
-- idée autrement dite.
--
-- ── ET LE SUPERLATIF ────────────────────────────────────
--
-- « Le cigare le plus récompensé de l'histoire de la revue » est une
-- affirmation de rang, exactement ce que le lot R5 a banni des fiches
-- pays. `coherence_check` la refuse depuis — mais sur `producer_countries`
-- et `production_zones` seulement. Les marques y échappaient ; le
-- contrôle les couvre désormais.
-- ════════════════════════════════════════════════════════

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[1].story',
  'Née en 2002 pour les soixante-quinze ans de José Padrón, en hommage à son année de naissance. Le sommet de la maison : tabac vieilli cinq ans, production confidentielle. Notes de ristretto, cacao pur, poivre de la Jamaïque. C''est la gamme sur laquelle la maison se juge elle-même.')
WHERE `name` = 'Padrón';
