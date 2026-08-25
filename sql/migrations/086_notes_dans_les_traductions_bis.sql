-- ════════════════════════════════════════════════════════
-- 086 — Neuvième forme, et changement de méthode
-- ────────────────────────────────────────────────────────
-- Trouvé en mesurant la divergence de `history` entre les six langues :
-- l'anglais y porte des ANNÉES et des CHIFFRES que le français n'a pas.
-- Parmi eux, six notes de presse encore vivantes.
--
-- Toutes dans des formes que les motifs ratent :
--
--   « awarded it scores between 92 and 95 »   (Partagás)
--   « rated it between 91 and 94 »            (Punch)
--   « a 96-point score »                      (Plasencia)
--   « 97-point score »                        (Perdomo)
--   « scores between 89 and 92 »              (Oliva Connecticut Reserve)
--   « على 97 في CA »                          (Oliva, arabe, sans le mot « points »)
--
-- Le motif cherchait « scored 92 » ou « 92 points ». Un intervalle, un
-- trait d'union, une préposition suffisent à passer.
--
-- ── ET UNE EN FRANÇAIS ──────────────────────────────────
--
-- Alec Bradley : « Après la récompense CA 2011, des revendeurs qui
-- l'avaient ignoré pendant 10 ans lui téléphonèrent. » Deux lettres —
-- CA — et le contrôle français, qui balaie pourtant les quatre champs et
-- les six langues depuis la migration 077, ne voyait rien.
--
-- ── CHANGEMENT DE MÉTHODE ───────────────────────────────
--
-- Neuf fois, un motif écrit pour « une note de presse » a raté la même
-- affirmation dite autrement. Courir après les formes ne marche pas :
-- il y en a toujours une de plus.
--
-- Le marqueur robuste n'est pas la forme du chiffre, c'est le NOM DE LA
-- REVUE. Une fiche n'a aucune raison de citer Cigar Aficionado sinon
-- pour s'en prévaloir. `marques_check` balaie désormais les noms de
-- revues dans les six langues, en plus des motifs de chiffres.
--
-- Le balayage complet ne trouve que ces sept-là, plus un faux positif
-- assumé : en chinois, 雪茄爱好者 est à la fois le nom de la revue et le
-- mot courant pour « amateur de cigares ». La fiche Quintero l'emploie
-- au second sens.
--
-- ── CE QUI REMPLACE ─────────────────────────────────────
--
-- Chaque phrase est réécrite sur ce que la note prétendait établir : la
-- régularité, la reconnaissance, l'accueil du marché. Ce sont des faits
-- observables ; la note, elle, ne l'était pas.
-- ════════════════════════════════════════════════════════

-- ── Anglais ─────────────────────────────────────────────
UPDATE `brands` SET `history_en` = REPLACE(`history_en`,
  'The range''s consistent performance across multiple Cigar Aficionado reviews — scores between 89 and 92 — validated the strategy.',
  'The range held its line from one box to the next, which is what the strategy was betting on.')
WHERE `name` = 'Oliva Connecticut Reserve';

UPDATE `brands` SET `history_en` = REPLACE(`history_en`,
  'Cigar Aficionado has awarded it scores between 92 and 95 across fifteen consecutive reviews.',
  'It has kept the same character across decades of production, which is rarer than a good year.')
WHERE `name` = 'Partagás';

UPDATE `brands` SET `history_en` = REPLACE(`history_en`,
  'Cigar Aficionado''s 97-point score for the Robusto established Perdomo among the handful of houses whose premium expressions compete directly with Padrón and Oliva for the top position in Nicaraguan tobacco.',
  'The Robusto is the vitola that placed Perdomo among the houses whose top expressions are discussed alongside Padrón and Oliva.')
WHERE `name` = 'Perdomo';

UPDATE `brands` SET `history_en` = REPLACE(`history_en`,
  'The market response was immediate: a 96-point score from Cigar Aficionado, and allocation demands that exceeded production within the first year.',
  'The market response was immediate: demand outran production within the first year.')
WHERE `name` = 'Plasencia';

UPDATE `brands` SET `history_en` = REPLACE(`history_en`,
  'Cigar Aficionado has rated it between 91 and 94 across six separate assessments — a record of reliability that speaks directly to what the brand has always offered: not surprise, but confidence.',
  'What the brand has always offered is not surprise but confidence — the same cigar, box after box.')
WHERE `name` = 'Punch';

-- ── Arabe ───────────────────────────────────────────────
UPDATE `brands` SET `history_ar` = REPLACE(`history_ar`,
  'حازت السيري V (2004) على 97 في CA، ووصل ميلانيو إلى 99 عام 2014 — أعلى تقييم لسيجار غير كوبي آنذاك.',
  'أُطلقت السيري V عام 2004، فصارت على الفور المجموعة التي تُقاس بها الدار، ثم جاء ميلانيو عام 2014 ليمدّها إلى أبعد.')
WHERE `name` = 'Oliva';

-- ── Français ────────────────────────────────────────────
UPDATE `brands` SET `celebrities` = JSON_SET(`celebrities`, '$[0].anecdote',
  'Rubin vendit des boîtes dans le coffre de sa voiture pendant des années avant le succès. Quand la maison a percé, des revendeurs qui l''avaient ignoré pendant dix ans lui téléphonèrent pour commander. Il rappela uniquement ceux qui lui avaient accordé une chance au début.')
WHERE `name` = 'Alec Bradley';
