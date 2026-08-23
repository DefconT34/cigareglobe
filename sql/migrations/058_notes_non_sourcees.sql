-- ════════════════════════════════════════════════════════
-- 058 — Retirer les soixante-et-une notes qu'on ne peut pas vérifier
-- ────────────────────────────────────────────────────────
-- Trente-neuf marques portaient soixante-et-une notes chiffrées :
-- cinquante-sept attribuées à Cigar Aficionado, quatre à Cigar Journal,
-- toutes avec année et vitole précises. Aucune n'était accompagnée
-- d'une source consultable.
--
-- ── POURQUOI LES RETIRER PLUTÔT QUE LES GARDER ──────────
--
-- Une note de presse ne vaut pas par sa précision mais par sa source.
-- « Cigar Aficionado, 94, 2020, Belicosos Finos » a l'air plus sérieux
-- que « bien noté par la presse » — et l'est moins, tant que personne ne
-- peut aller voir.
--
-- C'est la forme exacte que prenait l'erreur du lot R1 : le chiffre
-- précis, invérifiable, que personne ne remet en cause parce qu'il est
-- précis.
--
-- ── UN SIGNAL DE PLUS ───────────────────────────────────
--
-- La distribution des années penchait lourdement : cinquante-deux des
-- soixante-et-une notes tombaient entre 2018 et 2023, en une montée
-- régulière jusqu'à douze pour la seule année 2022. Une bibliographie
-- réellement compilée est grumeleuse — elle contient les classements
-- anciens et célèbres, et elle a des trous. Ce n'est pas une preuve ;
-- c'est un signal, et il va dans le même sens que le reste.
--
-- ── CE QUE ÇA COÛTE, ET CE QUE ÇA RAPPORTE ──────────────
--
-- La rubrique disparaît de trente-neuf fiches. C'est une perte visible.
-- En échange, l'atlas cesse d'affirmer soixante-et-une choses qu'il ne
-- peut pas soutenir.
--
-- `tools/marques_check.php` exige désormais `source_url` sur toute note.
-- Le jour où les sources existent, les notes reviennent — avec le lien
-- qui permet d'aller vérifier.
--
-- ── ET DEUX ANECDOTES QUE LE CONTRÔLE DE PARALLÉLISME A
--    TROUVÉES, LÀ OÙ CELUI DU CONTENU AVAIT ÉCHOUÉ ───────
--
-- Drew Estate et Macanudo portaient DEUX anecdotes en français et UNE
-- SEULE dans les cinq autres langues : un contenu invisible pour tout
-- lecteur non francophone.
--
-- Les deux entrées orphelines sont précisément du genre que la
-- migration 057 retirait — « Machine Gun Kelly a participé à une session
-- de création de blend », affirmation sur une personne vivante ; et
-- « Seinfeld Persona », qui n'est même pas quelqu'un. Elles avaient
-- survécu au balayage parce qu'elles ne contiennent ni citation ni verbe
-- de consommation.
--
-- On les retire donc du français : le parallélisme se rétablit par le
-- bas, et deux affirmations de moins.
-- ════════════════════════════════════════════════════════

-- ── Les notes ───────────────────────────────────────────

UPDATE `brands` SET `scores` = '[]'
 WHERE `scores` IS NOT NULL AND `scores` <> '[]';

-- ── Les deux anecdotes sans traduction ──────────────────
-- Seul le français porte l'entrée [1] : les cinq traductions ne l'ont
-- jamais eue, il n'y a donc rien à y retirer.

UPDATE `brands` SET `celebrities` = JSON_REMOVE(`celebrities`, '$[1]')
 WHERE `name` IN ('Drew Estate', 'Macanudo');
