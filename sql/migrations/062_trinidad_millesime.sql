-- ════════════════════════════════════════════════════════
-- 062 — Un accord bâti sur une date fausse
-- ────────────────────────────────────────────────────────
-- Trinidad proposait « Armagnac millésimé 1985 — un millésime de la même
-- année que les premiers Trinidad commercialisés ».
--
-- Trinidad naît en 1969 comme cigare de cadeau diplomatique, et n'est
-- mise en vente qu'en 1998. Aucun Trinidad n'a été commercialisé en
-- 1985 : l'accord repose sur une coïncidence qui n'existe pas.
--
-- ── CE QUE CE CAS AJOUTE AUX PRÉCÉDENTS ─────────────────
--
-- Les migrations 057 à 061 retiraient des affirmations INVÉRIFIABLES —
-- citations inventées, notes de presse sans source. Celle-ci est d'une
-- autre espèce : elle est vérifiable, et fausse.
--
-- Aucun outil ne pouvait la voir. `marques_check` cherche des notes et
-- des paroles ; `coherence_check` compare des champs entre eux ; le
-- contrôle de langue lit la langue. Une date fausse dans une phrase bien
-- formée ne déclenche rien.
--
-- C'est la limite de tout ce dispositif, et elle vaut d'être écrite :
-- les contrôles attrapent des FORMES. Le fond demande qu'on lise. Ce
-- défaut-ci n'est apparu que parce qu'il fallait relire la phrase pour
-- la traduire en quatre langues.
--
-- ── LA CORRECTION ───────────────────────────────────────
--
-- L'accord lui-même se tient — un armagnac vieux et un Trinidad se
-- répondent. On retire la coïncidence inventée et on garde la raison
-- qui vaut : l'âge, pas le millésime.
-- ════════════════════════════════════════════════════════

UPDATE `brands` SET `pairings` = JSON_SET(`pairings`, '$[2].name', 'Armagnac hors d''âge')
WHERE `name` = 'Trinidad';

UPDATE `brands` SET `pairings` = JSON_SET(`pairings`, '$[2].notes',
  'Un armagnac longuement vieilli, dont le rancio et les fruits confits répondent au miel et au cèdre du Fundadores. L''âge fait l''accord, pas le millésime : c''est la lenteur commune des deux qui les rapproche.')
WHERE `name` = 'Trinidad';
