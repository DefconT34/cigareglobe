-- ════════════════════════════════════════════════════════
-- 099 — Ce qu'une traduction affirme et que sa source ne dit pas
-- ────────────────────────────────────────────────────────
-- Premier passage de `tools/i18n_divergence.php`, écrit pour rendre la
-- relecture des 6 925 traductions praticable.
--
-- Le principe : une DATE est le fait le plus vérifiable d'un texte, et
-- le plus facile à comparer entre écritures — 2014 s'écrit 2014 en arabe
-- comme en chinois. Une traduction qui porte une année absente du
-- français affirme quelque chose que sa source ne dit pas.
--
-- Quinze signalements, six fiches, et un motif net : quand PLUSIEURS
-- langues portent la même date, c'est le français qui l'a perdue ; quand
-- UNE SEULE la porte, elle l'a inventée.
--
-- ── LA NOTE DE PRESSE QUI A SURVÉCU EN ARABE ────────────
--
-- `history_ar` d'Alec Bradley disait :
--
--     « عام 2011، نال برينسادو جائزة السيجار رقم 1 من CA بنقاط 96 »
--     « En 2011, Prensado a reçu le prix du cigare n°1 de CA, 96 points »
--
-- Revue nommée, rang, points. C'est exactement ce que les migrations
-- 057, 058 et 077 ont passé des semaines à retirer, et c'était encore là.
--
-- Elle a échappé à TROIS motifs d'un cheveu, tous corrigés dans l'outil :
--   — « نقاط 96 » met le nombre APRÈS le mot, quand le motif arabe
--     exigeait « 96 نقطة » ;
--   — REVUES_CITEES connaissait « في CA », pas « من CA » ;
--   — et « CA بنقاط 96 » intercale un mot entre la revue et le chiffre.
--
-- ── ET LE MÊME PRIX, DANS CINQ ANECDOTES ────────────────
--
-- Le français dit « Quand la maison a percé ». Les cinq traductions
-- disent « après le prix 2011 » — « After the 2011 CA award », « Tras el
-- galardón de 2011 », « Nach der Auszeichnung von 2011 », « 2011 年获奖
-- 之后 », « وبعد جائزة 2011 ». Le français avait été corrigé seul.
--
-- Aucun motif de presse ne contient de mot signifiant « récompense » :
-- ni award, ni galardón, ni Auszeichnung, ni 获奖, ni جائزة. Un balayage
-- d'essai en trouve 26 occurrences dans la base, dont plusieurs vraies
-- (des établissements qui annoncent un prix). C'est un chantier à part,
-- signalé dans la feuille de route et non ouvert ici.
--
-- ── UN CIGARE INVENTÉ ───────────────────────────────────
--
-- Oliva, `history_ar` : « puis vint le Melanio en 2014 pour la
-- prolonger ». Ni le français ni l'anglais ne mentionnent le Melanio, et
-- 2014 est l'année où ce cigare a été primé par la presse. Le texte
-- arabe fait le TIERS du français et invente pourtant un fait.
--
-- ── DEUX ASYMÉTRIES PLUS BÉNIGNES ───────────────────────
--
-- Café Crème, `pairings_en` : « An immutable tradition since 1958 »,
-- une date que le français n'a pas et que rien n'appuie.
--
-- La Flor de la Isabela : le FRANÇAIS dit « fondée la même année que
-- Tabacalera » sans donner l'année, quand l'espagnol, l'allemand, le
-- chinois et l'arabe donnent tous 1881. Ici c'est la source qui est en
-- retrait, et c'est elle qu'on complète.
-- ════════════════════════════════════════════════════════

-- ── Alec Bradley : la note de presse arabe ──────────────
UPDATE `brands` SET
  `history_ar` = REPLACE(`history_ar`, ' عام 2011، نال برينسادو جائزة السيجار رقم 1 من CA بنقاط 96.', '')
WHERE `name` = 'Alec Bradley';

-- ── Alec Bradley : le prix dans les cinq anecdotes ──────
UPDATE `brands` SET
  `celebrities_en` = REPLACE(`celebrities_en`, 'After the 2011 CA award, retailers', 'When the house broke through, retailers'),
  `celebrities_es` = REPLACE(`celebrities_es`, 'Tras el galardón de 2011, distribuidores', 'Cuando la casa despegó, distribuidores'),
  `celebrities_de` = REPLACE(`celebrities_de`, 'Nach der Auszeichnung von 2011 riefen Händler an', 'Als der Durchbruch kam, riefen Händler an'),
  `celebrities_zh` = REPLACE(`celebrities_zh`, '2011 年获奖之后，那些冷落了他十年的经销商', '待到这家雪茄行崭露头角，那些冷落了他十年的经销商'),
  `celebrities_ar` = REPLACE(`celebrities_ar`, 'وبعد جائزة 2011، هاتفه موزّعون', 'وحين ذاع صيت الدار، هاتفه موزّعون')
WHERE `name` = 'Alec Bradley';

-- ── Oliva : le Melanio que personne d'autre ne mentionne ─
UPDATE `brands` SET
  `history_ar` = REPLACE(`history_ar`, '، ثم جاء ميلانيو عام 2014 ليمدّها إلى أبعد', '')
WHERE `name` = 'Oliva';

-- ── Café Crème : une date sans appui ────────────────────
UPDATE `brands` SET
  `pairings_en` = REPLACE(`pairings_en`, ' An immutable tradition since 1958.', ' A tradition that has not moved since.')
WHERE `name` = 'Café Crème';

-- ── La Flor de la Isabela : le français complété ────────
UPDATE `brands` SET
  `history` = REPLACE(`history`, 'Fondée la même année que Tabacalera', 'Fondée en 1881, la même année que Tabacalera')
WHERE `name` = 'La Flor de la Isabela';
