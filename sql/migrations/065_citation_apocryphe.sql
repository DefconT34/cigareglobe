-- ════════════════════════════════════════════════════════
-- 065 — Une citation qui s'annonce comme fausse
-- ────────────────────────────────────────────────────────
-- Joya de Nicaragua portait, attribuée à Richard Nixon : « Le seul
-- cigare que je peux fumer sans trahir l'Amérique » — suivi de la
-- mention « citation apocryphe mais vraisemblable ».
--
-- ── POURQUOI L'AVEU N'ARRANGE RIEN ──────────────────────
--
-- L'auteur savait qu'il inventait, l'a écrit, et l'a publiée quand même.
-- La phrase se retrouve sur la fiche, entre guillemets, sous le nom d'un
-- président des États-Unis, traduite en six langues.
--
-- Un lecteur qui parcourt une fiche retient la phrase, pas la note de
-- bas de page. Et « vraisemblable » n'est pas un critère : c'est
-- exactement ce qui rend une invention dangereuse.
--
-- Le détecteur traite désormais l'aveu comme un constat : « apocryphe »,
-- « attribué à tort », « prétendument » suffisent à faire échouer le
-- contrôle. Une citation dont on annonce soi-même qu'elle est fausse n'a
-- pas besoin d'analyse supplémentaire.
--
-- ── ET « SCORES » AU PLURIEL ────────────────────────────
--
-- Macanudo annonçait « scores 93-95 réguliers depuis le lancement ». Le
-- motif cherchait `\bscore\b` : la frontière de mot bloque sur le « s »
-- du pluriel. Quatrième forme de la même affirmation, après « Score
-- 96 », « Score Cigar Aficionado 93 » et « Top 25 ».
--
-- ── CE QUI RESTE ────────────────────────────────────────
--
-- Le lien entre Joya de Nicaragua et la Maison-Blanche des années
-- Somoza est documenté sans avoir besoin d'une citation : la marque
-- était le cigare de protocole du régime, et à ce titre offerte aux
-- visiteurs officiels.
-- ════════════════════════════════════════════════════════

UPDATE `brands` SET `celebrities` = JSON_SET(`celebrities`, '$[0].anecdote',
  'Joya de Nicaragua était le cigare de protocole du régime Somoza, offert aux hôtes officiels — d''où sa présence à Washington dans les années qui suivirent l''embargo cubain. C''est ce statut, et non une préférence personnelle attestée, qui a lié la marque à la Maison-Blanche de cette période.')
WHERE `name` = 'Joya de Nicaragua';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[1].story',
  'Lancée en 2014, un virage stylistique majeur. Assemblage nicaraguayen, cape oscuro d''Équateur. Notes de café, chocolat noir, épices. Corsée — l''inverse exact de la Café. General Cigar voulait montrer que Macanudo pouvait sortir de son registre doux, et la gamme est restée au catalogue depuis.')
WHERE `name` = 'Macanudo';
