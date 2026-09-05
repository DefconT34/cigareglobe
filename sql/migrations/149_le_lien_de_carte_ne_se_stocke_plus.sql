-- ════════════════════════════════════════════════════════
-- 149 — Le lien de carte cesse d'être stocké
-- ────────────────────────────────────────────────────────
-- COMMENT CE DÉFAUT S'EST MONTRÉ. En vérifiant la fiche de Dakar après
-- la migration 147, le mot « Almadies » subsistait une fois dans la
-- page servie — alors que la fiche portait sa nouvelle adresse, 40 rue
-- Jules Ferry, dans les six langues. Le mot restait dans le lien
-- « Google Maps ↗ » :
--
--   .../maps/search/?api=1&query=La Casa del Habano, Dakar
--                                — Route des Almadies, Senegal
--
-- Le nom ET l'adresse d'avant, dans le seul élément de la page qu'on ne
-- lit pas mais qu'on SUIT. Quelqu'un qui clique pour s'y rendre part à
-- l'ancienne adresse — et la fiche, elle, a l'air juste.
--
-- ── CE QUE LA COLONNE CONTENAIT ──────────────────────────
-- Quatre cent dix-neuf fiches portaient un `maps_url`. AUCUN ne
-- contenait de coordonnées : tous étaient des RECHERCHES Google
-- fabriquées à la saisie depuis le nom et la ville, au format
-- « Nom (précision), Ville, Pays ».
--
-- Autrement dit, une valeur DÉRIVÉE rangée dans une colonne. Elle ne se
-- met pas à jour toute seule, et les migrations 143 à 148 ont corrigé
-- des noms et des adresses sans y toucher — Bertie, Sautter, le Royal
-- Monceau, Kuala Lumpur, Marina Bay Sands, Dakar, Lomé, Bogotá.
--
-- ── UNE MESURE FAUSSE, ET SA CORRECTION ──────────────────
-- Mon premier comptage annonçait 413 liens périmés sur 419. Il
-- comparait au gabarit « Nom, Ville » alors que les données emploient
-- « Nom (précision), Ville, Pays » : il déclarait périmé tout ce qu'il
-- ne savait pas lire. Le chiffre était un artefact du test, et non une
-- mesure du corpus. Les liens réellement en retard sont ceux des fiches
-- corrigées depuis mars.
--
-- ── POURQUOI VIDER PLUTÔT QUE METTRE À JOUR ──────────────
-- On pouvait recalculer les 419 valeurs. Elles seraient à recalculer au
-- prochain changement de nom, et le défaut reviendrait le jour où on
-- oublierait — c'est-à-dire un jour.
--
-- Le lien est désormais CONSTRUIT au moment de l'affichage, depuis ce
-- que la fiche porte à cet instant : `backend/carte_lib.php`, employé
-- par `page.php` et par l'API. Il ne peut plus être en retard, et les
-- coordonnées l'emportent dès qu'une fiche en aura.
--
-- La colonne est donc vidée. Une colonne qu'on ne lit plus mais qui
-- garde d'anciennes valeurs est un piège pour le suivant : elle a l'air
-- d'une donnée. Elle n'est pas SUPPRIMÉE — un DROP COLUMN sur une base
-- de production se réfléchit à part, et le schéma versionné doit suivre.
--
-- Après cette migration :
--   php tools/contenu_dump.php
-- ════════════════════════════════════════════════════════

UPDATE `lounges`
   SET `maps_url` = NULL, `updated_at` = `updated_at`
 WHERE `maps_url` IS NOT NULL;

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL, 'migration 149', 'systeme', 'colonne_videe', 'lounge', 0,
   'maps_url : 419 liens de recherche fabriques a la saisie, perimes des qu un nom ou une adresse changeait ; le lien est desormais construit a l affichage par backend/carte_lib.php');
