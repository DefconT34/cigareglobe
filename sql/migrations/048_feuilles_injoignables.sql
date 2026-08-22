-- ════════════════════════════════════════════════════════
-- 048 — Deux feuilles que personne ne pouvait ouvrir
-- ────────────────────────────────────────────────────────
-- La question « a-t-on toutes les feuilles ? » a été posée. L'audit
-- répond non, et il trouve pire qu'un manque : DEUX FICHES EXISTANTES
-- ÉTAIENT INJOIGNABLES.
--
--   producer_countries.varieties      feuilles.name
--   « San Andrés Maduro Negro »   ≠   « Negro San Andrés »
--   « Broadleaf »                 ≠   « Connecticut Broadleaf »
--
-- Le front apparie par nom EXACT (`_varietesHtml`). Ces deux feuilles
-- sont écrites, sourcées, traduites en six langues, servies par l'API —
-- et leur étiquette restait un simple mot, sans que rien ne le signale.
--
-- C'est la migration 040 qui les a créées ainsi. Le défaut est invisible
-- par construction : une étiquette non cliquable est le comportement
-- NORMAL d'une variété non documentée. Rien ne distingue « pas encore
-- écrite » de « écrite mais mal nommée ».
--
-- Même famille que le `revDetail` du lot 1 et que les tables de test
-- vides du lot des feuilles : un champ facultatif qui reste vide ne
-- ressemble pas à une panne.
--
-- ── QUEL NOM GARDER ─────────────────────────────────────
--
-- Celui de la FICHE, dans les deux cas, parce que c'est lui qui est
-- sourcé :
--
--   « Negro San Andrés » est la forme que les sources emploient — le
--   « San Andrés Negro » de la littérature. « San Andrés Maduro Negro »
--   empilait la variété et la couleur de cape.
--
--   « Connecticut Broadleaf » nomme la feuille en entier ; « Broadleaf »
--   seul est un raccourci qui ne dit pas d'où elle vient, alors que sa
--   voisine s'appelle bien « Connecticut Shade ».
--
-- ── ET LE CONTRÔLE QUI MANQUAIT ─────────────────────────
--
-- tools/coherence_check.php compare `regions` aux zones posées sur le
-- globe depuis le lot 5. Il ne comparait pas `varieties` aux feuilles.
-- C'est ajouté : une étiquette qui ne trouve pas sa fiche est désormais
-- distinguée d'une étiquette qui n'en a pas encore.
-- ════════════════════════════════════════════════════════

UPDATE `producer_countries`
   SET `varieties` = '["Negro San Andrés","Claro"]'
 WHERE `id` = 'mexico';

UPDATE `producer_countries`
   SET `varieties` = '["Connecticut Shade","Connecticut Broadleaf"]'
 WHERE `id` = 'usa';
