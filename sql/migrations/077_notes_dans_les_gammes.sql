-- ════════════════════════════════════════════════════════
-- 077 — Les quarante notes que le contrôle vert ne voyait pas
-- ────────────────────────────────────────────────────────
-- `marques_check` annonçait, à chaque campagne :
--
--   « 0 note(s) chiffree(s), toutes accompagnees d'une source
--     consultable. »
--
-- C'était littéralement vrai. La migration 058 avait vidé la COLONNE
-- `scores`, et le contrôle lisait cette colonne.
--
-- QUARANTE notes vivaient ailleurs : dans le sous-tableau
-- `gamme[].scores`. Avec la revue, la note et l'année — « Cigar
-- Aficionado 96 (2011) », « 100 (1994) », « 99 (2014) ». Aucune ne
-- portait de `source_url`. Et panels.js les affichait, en pastille
-- dorée, sur chaque fiche de marque, dans les six langues.
--
-- ── CE QUE CELA APPREND, ET QUI EST NOUVEAU ─────────────
--
-- Les leçons précédentes du chantier portaient sur la FORME d'une idée
-- (migrations 059→067), sur la COLONNE où elle se cache (068, 076), et
-- sur le MARQUEUR grammatical auquel un contrôle s'accroche (071).
--
-- Celle-ci est d'un autre ordre : le contrôle vérifiait un CONTENANT,
-- pas une DONNÉE. Vider `scores` et contrôler `scores` ne prouve rien
-- sur les notes — elles avaient une seconde adresse, et le rapport vert
-- disait exactement ce qu'on lui avait demandé de dire.
--
-- Un contrôle qui ne peut pas échouer ne protège de rien. Celui-ci
-- n'avait jamais échoué depuis la migration 058.
--
-- ── DEUX DÉFAUTS DE PARITÉ, INVISIBLES AUSSI ────────────
--
-- Le français portait 40 notes, les cinq autres langues 38 : Arturo
-- Fuente et Cohiba en avaient une de plus en français seulement. Le
-- contrôle de parité des six colonnes compte les ENTRÉES d'un tableau,
-- pas leurs sous-tableaux — il voyait le même nombre de vitoles et
-- concluait à l'égalité.
--
-- ── ET UN DOUBLON DE PLUS ───────────────────────────────
--
-- « CAO Flathead, Cigar Aficionado 93 (2020) » figurait à la fois sur
-- la fiche CAO et sur celle de General Cigar. Cinquième doublon
-- divergent du chantier, après Kennedy sur deux fiches, Drew Estate et
-- Liga Privada, l'anecdote de dégustation à l'aveugle, et l'anecdote de
-- Jonathan Drew.
--
-- ── POURQUOI ON RETIRE PLUTÔT QUE DE SOURCER ────────────
--
-- Même raison qu'à la migration 058 : aucune de ces notes n'est
-- vérifiable en l'état. Les rétablir demanderait, pour chacune, l'URL de
-- la critique publiée — un travail de sourçage, pas de nettoyage. La
-- rubrique disparaît en attendant, ce qui est l'information juste.
--
-- Le contrôle lit désormais les deux adresses, et panels.js refuse
-- d'afficher une note sans `source_url` : même si une note revenait en
-- base, elle ne s'afficherait pas tant qu'elle n'est pas sourçable.
-- ════════════════════════════════════════════════════════

UPDATE `brands` SET
  `gamme` = JSON_REMOVE(`gamme`, '$[0].scores'),
  `gamme_en` = JSON_REMOVE(`gamme_en`, '$[0].scores'),
  `gamme_es` = JSON_REMOVE(`gamme_es`, '$[0].scores'),
  `gamme_de` = JSON_REMOVE(`gamme_de`, '$[0].scores'),
  `gamme_zh` = JSON_REMOVE(`gamme_zh`, '$[0].scores'),
  `gamme_ar` = JSON_REMOVE(`gamme_ar`, '$[0].scores')
WHERE `name` = 'Alec Bradley';

UPDATE `brands` SET
  `gamme` = JSON_REMOVE(`gamme`, '$[0].scores', '$[1].scores'),
  `gamme_en` = JSON_REMOVE(`gamme_en`, '$[0].scores', '$[1].scores'),
  `gamme_es` = JSON_REMOVE(`gamme_es`, '$[0].scores', '$[1].scores'),
  `gamme_de` = JSON_REMOVE(`gamme_de`, '$[0].scores', '$[1].scores'),
  `gamme_zh` = JSON_REMOVE(`gamme_zh`, '$[0].scores', '$[1].scores'),
  `gamme_ar` = JSON_REMOVE(`gamme_ar`, '$[0].scores', '$[1].scores')
WHERE `name` = 'Arturo Fuente';

UPDATE `brands` SET
  `gamme` = JSON_REMOVE(`gamme`, '$[1].scores'),
  `gamme_en` = JSON_REMOVE(`gamme_en`, '$[1].scores'),
  `gamme_es` = JSON_REMOVE(`gamme_es`, '$[1].scores'),
  `gamme_de` = JSON_REMOVE(`gamme_de`, '$[1].scores'),
  `gamme_zh` = JSON_REMOVE(`gamme_zh`, '$[1].scores'),
  `gamme_ar` = JSON_REMOVE(`gamme_ar`, '$[1].scores')
WHERE `name` = 'Ashton';

UPDATE `brands` SET
  `gamme` = JSON_REMOVE(`gamme`, '$[0].scores'),
  `gamme_en` = JSON_REMOVE(`gamme_en`, '$[0].scores'),
  `gamme_es` = JSON_REMOVE(`gamme_es`, '$[0].scores'),
  `gamme_de` = JSON_REMOVE(`gamme_de`, '$[0].scores'),
  `gamme_zh` = JSON_REMOVE(`gamme_zh`, '$[0].scores'),
  `gamme_ar` = JSON_REMOVE(`gamme_ar`, '$[0].scores')
WHERE `name` = 'Bolivar';

UPDATE `brands` SET
  `gamme` = JSON_REMOVE(`gamme`, '$[0].scores'),
  `gamme_en` = JSON_REMOVE(`gamme_en`, '$[0].scores'),
  `gamme_es` = JSON_REMOVE(`gamme_es`, '$[0].scores'),
  `gamme_de` = JSON_REMOVE(`gamme_de`, '$[0].scores'),
  `gamme_zh` = JSON_REMOVE(`gamme_zh`, '$[0].scores'),
  `gamme_ar` = JSON_REMOVE(`gamme_ar`, '$[0].scores')
WHERE `name` = 'Camacho';

UPDATE `brands` SET
  `gamme` = JSON_REMOVE(`gamme`, '$[1].scores'),
  `gamme_en` = JSON_REMOVE(`gamme_en`, '$[1].scores'),
  `gamme_es` = JSON_REMOVE(`gamme_es`, '$[1].scores'),
  `gamme_de` = JSON_REMOVE(`gamme_de`, '$[1].scores'),
  `gamme_zh` = JSON_REMOVE(`gamme_zh`, '$[1].scores'),
  `gamme_ar` = JSON_REMOVE(`gamme_ar`, '$[1].scores')
WHERE `name` = 'CAO';

UPDATE `brands` SET
  `gamme` = JSON_REMOVE(`gamme`, '$[0].scores'),
  `gamme_en` = JSON_REMOVE(`gamme_en`, '$[0].scores'),
  `gamme_es` = JSON_REMOVE(`gamme_es`, '$[0].scores'),
  `gamme_de` = JSON_REMOVE(`gamme_de`, '$[0].scores'),
  `gamme_zh` = JSON_REMOVE(`gamme_zh`, '$[0].scores'),
  `gamme_ar` = JSON_REMOVE(`gamme_ar`, '$[0].scores')
WHERE `name` = 'Carlos Toraño Panama';

UPDATE `brands` SET
  `gamme` = JSON_REMOVE(`gamme`, '$[0].scores'),
  `gamme_en` = JSON_REMOVE(`gamme_en`, '$[0].scores'),
  `gamme_es` = JSON_REMOVE(`gamme_es`, '$[0].scores'),
  `gamme_de` = JSON_REMOVE(`gamme_de`, '$[0].scores'),
  `gamme_zh` = JSON_REMOVE(`gamme_zh`, '$[0].scores'),
  `gamme_ar` = JSON_REMOVE(`gamme_ar`, '$[0].scores')
WHERE `name` = 'Cohiba';

UPDATE `brands` SET
  `gamme` = JSON_REMOVE(`gamme`, '$[0].scores', '$[1].scores', '$[2].scores'),
  `gamme_en` = JSON_REMOVE(`gamme_en`, '$[0].scores', '$[1].scores', '$[2].scores'),
  `gamme_es` = JSON_REMOVE(`gamme_es`, '$[0].scores', '$[1].scores', '$[2].scores'),
  `gamme_de` = JSON_REMOVE(`gamme_de`, '$[0].scores', '$[1].scores', '$[2].scores'),
  `gamme_zh` = JSON_REMOVE(`gamme_zh`, '$[0].scores', '$[1].scores', '$[2].scores'),
  `gamme_ar` = JSON_REMOVE(`gamme_ar`, '$[0].scores', '$[1].scores', '$[2].scores')
WHERE `name` = 'Davidoff';

UPDATE `brands` SET
  `gamme` = JSON_REMOVE(`gamme`, '$[1].scores'),
  `gamme_en` = JSON_REMOVE(`gamme_en`, '$[1].scores'),
  `gamme_es` = JSON_REMOVE(`gamme_es`, '$[1].scores'),
  `gamme_de` = JSON_REMOVE(`gamme_de`, '$[1].scores'),
  `gamme_zh` = JSON_REMOVE(`gamme_zh`, '$[1].scores'),
  `gamme_ar` = JSON_REMOVE(`gamme_ar`, '$[1].scores')
WHERE `name` = 'Drew Estate';

UPDATE `brands` SET
  `gamme` = JSON_REMOVE(`gamme`, '$[1].scores'),
  `gamme_en` = JSON_REMOVE(`gamme_en`, '$[1].scores'),
  `gamme_es` = JSON_REMOVE(`gamme_es`, '$[1].scores'),
  `gamme_de` = JSON_REMOVE(`gamme_de`, '$[1].scores'),
  `gamme_zh` = JSON_REMOVE(`gamme_zh`, '$[1].scores'),
  `gamme_ar` = JSON_REMOVE(`gamme_ar`, '$[1].scores')
WHERE `name` = 'General Cigar';

UPDATE `brands` SET
  `gamme` = JSON_REMOVE(`gamme`, '$[0].scores'),
  `gamme_en` = JSON_REMOVE(`gamme_en`, '$[0].scores'),
  `gamme_es` = JSON_REMOVE(`gamme_es`, '$[0].scores'),
  `gamme_de` = JSON_REMOVE(`gamme_de`, '$[0].scores'),
  `gamme_zh` = JSON_REMOVE(`gamme_zh`, '$[0].scores'),
  `gamme_ar` = JSON_REMOVE(`gamme_ar`, '$[0].scores')
WHERE `name` = 'H. Upmann';

UPDATE `brands` SET
  `gamme` = JSON_REMOVE(`gamme`, '$[0].scores'),
  `gamme_en` = JSON_REMOVE(`gamme_en`, '$[0].scores'),
  `gamme_es` = JSON_REMOVE(`gamme_es`, '$[0].scores'),
  `gamme_de` = JSON_REMOVE(`gamme_de`, '$[0].scores'),
  `gamme_zh` = JSON_REMOVE(`gamme_zh`, '$[0].scores'),
  `gamme_ar` = JSON_REMOVE(`gamme_ar`, '$[0].scores')
WHERE `name` = 'Joya de Nicaragua';

UPDATE `brands` SET
  `gamme` = JSON_REMOVE(`gamme`, '$[0].scores', '$[1].scores'),
  `gamme_en` = JSON_REMOVE(`gamme_en`, '$[0].scores', '$[1].scores'),
  `gamme_es` = JSON_REMOVE(`gamme_es`, '$[0].scores', '$[1].scores'),
  `gamme_de` = JSON_REMOVE(`gamme_de`, '$[0].scores', '$[1].scores'),
  `gamme_zh` = JSON_REMOVE(`gamme_zh`, '$[0].scores', '$[1].scores'),
  `gamme_ar` = JSON_REMOVE(`gamme_ar`, '$[0].scores', '$[1].scores')
WHERE `name` = 'La Flor Dominicana';

UPDATE `brands` SET
  `gamme` = JSON_REMOVE(`gamme`, '$[0].scores', '$[1].scores'),
  `gamme_en` = JSON_REMOVE(`gamme_en`, '$[0].scores', '$[1].scores'),
  `gamme_es` = JSON_REMOVE(`gamme_es`, '$[0].scores', '$[1].scores'),
  `gamme_de` = JSON_REMOVE(`gamme_de`, '$[0].scores', '$[1].scores'),
  `gamme_zh` = JSON_REMOVE(`gamme_zh`, '$[0].scores', '$[1].scores'),
  `gamme_ar` = JSON_REMOVE(`gamme_ar`, '$[0].scores', '$[1].scores')
WHERE `name` = 'Liga Privada';

UPDATE `brands` SET
  `gamme` = JSON_REMOVE(`gamme`, '$[1].scores'),
  `gamme_en` = JSON_REMOVE(`gamme_en`, '$[1].scores'),
  `gamme_es` = JSON_REMOVE(`gamme_es`, '$[1].scores'),
  `gamme_de` = JSON_REMOVE(`gamme_de`, '$[1].scores'),
  `gamme_zh` = JSON_REMOVE(`gamme_zh`, '$[1].scores'),
  `gamme_ar` = JSON_REMOVE(`gamme_ar`, '$[1].scores')
WHERE `name` = 'Macanudo';

UPDATE `brands` SET
  `gamme` = JSON_REMOVE(`gamme`, '$[0].scores'),
  `gamme_en` = JSON_REMOVE(`gamme_en`, '$[0].scores'),
  `gamme_es` = JSON_REMOVE(`gamme_es`, '$[0].scores'),
  `gamme_de` = JSON_REMOVE(`gamme_de`, '$[0].scores'),
  `gamme_zh` = JSON_REMOVE(`gamme_zh`, '$[0].scores'),
  `gamme_ar` = JSON_REMOVE(`gamme_ar`, '$[0].scores')
WHERE `name` = 'Montecristo';

UPDATE `brands` SET
  `gamme` = JSON_REMOVE(`gamme`, '$[0].scores', '$[1].scores'),
  `gamme_en` = JSON_REMOVE(`gamme_en`, '$[0].scores', '$[1].scores'),
  `gamme_es` = JSON_REMOVE(`gamme_es`, '$[0].scores', '$[1].scores'),
  `gamme_de` = JSON_REMOVE(`gamme_de`, '$[0].scores', '$[1].scores'),
  `gamme_zh` = JSON_REMOVE(`gamme_zh`, '$[0].scores', '$[1].scores'),
  `gamme_ar` = JSON_REMOVE(`gamme_ar`, '$[0].scores', '$[1].scores')
WHERE `name` = 'My Father';

UPDATE `brands` SET
  `gamme` = JSON_REMOVE(`gamme`, '$[0].scores'),
  `gamme_en` = JSON_REMOVE(`gamme_en`, '$[0].scores'),
  `gamme_es` = JSON_REMOVE(`gamme_es`, '$[0].scores'),
  `gamme_de` = JSON_REMOVE(`gamme_de`, '$[0].scores'),
  `gamme_zh` = JSON_REMOVE(`gamme_zh`, '$[0].scores'),
  `gamme_ar` = JSON_REMOVE(`gamme_ar`, '$[0].scores')
WHERE `name` = 'Oliva';

UPDATE `brands` SET
  `gamme` = JSON_REMOVE(`gamme`, '$[0].scores', '$[1].scores'),
  `gamme_en` = JSON_REMOVE(`gamme_en`, '$[0].scores', '$[1].scores'),
  `gamme_es` = JSON_REMOVE(`gamme_es`, '$[0].scores', '$[1].scores'),
  `gamme_de` = JSON_REMOVE(`gamme_de`, '$[0].scores', '$[1].scores'),
  `gamme_zh` = JSON_REMOVE(`gamme_zh`, '$[0].scores', '$[1].scores'),
  `gamme_ar` = JSON_REMOVE(`gamme_ar`, '$[0].scores', '$[1].scores')
WHERE `name` = 'Padrón';

UPDATE `brands` SET
  `gamme` = JSON_REMOVE(`gamme`, '$[0].scores'),
  `gamme_en` = JSON_REMOVE(`gamme_en`, '$[0].scores'),
  `gamme_es` = JSON_REMOVE(`gamme_es`, '$[0].scores'),
  `gamme_de` = JSON_REMOVE(`gamme_de`, '$[0].scores'),
  `gamme_zh` = JSON_REMOVE(`gamme_zh`, '$[0].scores'),
  `gamme_ar` = JSON_REMOVE(`gamme_ar`, '$[0].scores')
WHERE `name` = 'Perdomo';

UPDATE `brands` SET
  `gamme` = JSON_REMOVE(`gamme`, '$[0].scores'),
  `gamme_en` = JSON_REMOVE(`gamme_en`, '$[0].scores'),
  `gamme_es` = JSON_REMOVE(`gamme_es`, '$[0].scores'),
  `gamme_de` = JSON_REMOVE(`gamme_de`, '$[0].scores'),
  `gamme_zh` = JSON_REMOVE(`gamme_zh`, '$[0].scores'),
  `gamme_ar` = JSON_REMOVE(`gamme_ar`, '$[0].scores')
WHERE `name` = 'Plasencia';

UPDATE `brands` SET
  `gamme` = JSON_REMOVE(`gamme`, '$[0].scores'),
  `gamme_en` = JSON_REMOVE(`gamme_en`, '$[0].scores'),
  `gamme_es` = JSON_REMOVE(`gamme_es`, '$[0].scores'),
  `gamme_de` = JSON_REMOVE(`gamme_de`, '$[0].scores'),
  `gamme_zh` = JSON_REMOVE(`gamme_zh`, '$[0].scores'),
  `gamme_ar` = JSON_REMOVE(`gamme_ar`, '$[0].scores')
WHERE `name` = 'Punch';

UPDATE `brands` SET
  `gamme` = JSON_REMOVE(`gamme`, '$[0].scores'),
  `gamme_en` = JSON_REMOVE(`gamme_en`, '$[0].scores'),
  `gamme_es` = JSON_REMOVE(`gamme_es`, '$[0].scores'),
  `gamme_de` = JSON_REMOVE(`gamme_de`, '$[0].scores'),
  `gamme_zh` = JSON_REMOVE(`gamme_zh`, '$[0].scores'),
  `gamme_ar` = JSON_REMOVE(`gamme_ar`, '$[0].scores')
WHERE `name` = 'Rocky Patel';

UPDATE `brands` SET
  `gamme` = JSON_REMOVE(`gamme`, '$[0].scores'),
  `gamme_en` = JSON_REMOVE(`gamme_en`, '$[0].scores'),
  `gamme_es` = JSON_REMOVE(`gamme_es`, '$[0].scores'),
  `gamme_de` = JSON_REMOVE(`gamme_de`, '$[0].scores'),
  `gamme_zh` = JSON_REMOVE(`gamme_zh`, '$[0].scores'),
  `gamme_ar` = JSON_REMOVE(`gamme_ar`, '$[0].scores')
WHERE `name` = 'Romeo y Julieta';

UPDATE `brands` SET
  `gamme` = JSON_REMOVE(`gamme`, '$[0].scores'),
  `gamme_en` = JSON_REMOVE(`gamme_en`, '$[0].scores'),
  `gamme_es` = JSON_REMOVE(`gamme_es`, '$[0].scores'),
  `gamme_de` = JSON_REMOVE(`gamme_de`, '$[0].scores'),
  `gamme_zh` = JSON_REMOVE(`gamme_zh`, '$[0].scores'),
  `gamme_ar` = JSON_REMOVE(`gamme_ar`, '$[0].scores')
WHERE `name` = 'Trinidad';

