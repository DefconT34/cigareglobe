-- ════════════════════════════════════════════════════════
-- 272 — Vague 2, fin : « Perdomo Ecuador » devient « Perdomo Legacy Connecticut »
-- ────────────────────────────────────────────────────────
-- POURQUOI. Le lot 7 (migration 268) l'avait noté : aucune page de la maison ne nomme une
-- ligne « Perdomo Ecuador ». La ligne qui existe est Perdomo Legacy Ecuadorian
-- Connecticut (cape Connecticut de semence cultivée en Équateur, liant et tripe du
-- Nicaragua, Tabacalera Perdomo, Estelí ; Cigar Coop, 12 octobre 2025). Le nom de la fiche
-- devient « Perdomo Legacy Connecticut ». Le nom est la clé primaire de `brands` : la
-- clé, les sceaux de traduction et les listes de marques des pages Nicaragua et Équateur
-- changent ensemble. Le texte de la fiche ne porte pas l'ancien nom ; le journal de
-- modération le garde tel qu'il était.
-- ════════════════════════════════════════════════════════

UPDATE `brands` SET `name` = 'Perdomo Legacy Connecticut', `updated_at` = NOW() WHERE `name` = 'Perdomo Ecuador';
UPDATE `translation_status` SET `entite_id` = 'Perdomo Legacy Connecticut' WHERE `entite` = 'brands' AND `entite_id` = 'Perdomo Ecuador';
UPDATE `producer_countries` SET `brands` = REPLACE(`brands`, 'Perdomo Ecuador', 'Perdomo Legacy Connecticut'), `updated_at` = NOW()
 WHERE `id` IN ('nicaragua', 'ecuador') AND `brands` LIKE '%Perdomo Ecuador%';

SELECT (SELECT COUNT(*) FROM `brands` WHERE `name` = 'Perdomo Ecuador') = 0 AS ancien_nom_absent,
       (SELECT COUNT(*) FROM `brands` WHERE `name` = 'Perdomo Legacy Connecticut' AND `country_id` = 'nicaragua') = 1 AS fiche_renommee,
       (SELECT COUNT(*) FROM `translation_status` WHERE `entite_id` = 'Perdomo Legacy Connecticut') = 15 AS quinze_sceaux,
       (SELECT COUNT(*) FROM `producer_countries` WHERE `brands` LIKE '%Perdomo Ecuador%') = 0 AS pages_a_jour;
