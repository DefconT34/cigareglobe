-- ════════════════════════════════════════════════════════
-- 289 — Chester corrigé (fiche 50), Soho retiré (fiche 283)
-- ────────────────────────────────────────────────────────
-- Vérification par expert-cigare, 29 octobre 2026 (page de C.Gars en 403 :
-- lue par résumés de recherche).
--   #50  Chester : la Casa del Habano est au 32 Watergate Street (habanos.com,
--        lcdhcigars.uk) ; le 34 est la boutique Turmeaus, mitoyenne, même
--        exploitant. La fiche mélangeait les deux. « célèbre » n'avait aucune
--        source : retiré, dans les six langues.
--   #283 Soho : aucune boutique C.Gars à Old Compton Street ni chez Selfridges
--        (boutiques lues : St James's, The City, Shepherd Market). Le type
--        « Cave Premium Selfridges » était faux. RETIRÉE (`is_verified = 0`) ;
--        à rétablir si une page est apportée.
-- ════════════════════════════════════════════════════════

UPDATE `lounges` SET
  `city` = 'Chester — 32 Watergate Street, CH1 2LA',
  `description` = 'La Casa del Habano officielle de Chester, 32 Watergate Street, voisine de la boutique Turmeaus, du même exploitant.',
  `description_en` = 'Chester''s official La Casa del Habano, at 32 Watergate Street, next door to the Turmeaus shop, which has the same operator.',
  `description_es` = 'La Casa del Habano oficial de Chester, en el 32 de Watergate Street, junto a la tienda Turmeaus, del mismo explotador.',
  `description_de` = 'Die offizielle La Casa del Habano von Chester, 32 Watergate Street, neben dem Geschäft Turmeaus, das vom selben Betreiber geführt wird.',
  `description_zh` = '切斯特的官方 La Casa del Habano，位于 Watergate Street 32 号，毗邻同一经营者的 Turmeaus 店。',
  `description_ar` = '«لا كاسا ديل هابانو» الرسمية في تشيستر، 32 شارع واترغيت، بجوار متجر Turmeaus الذي يديره المشغّل نفسه.',
  `source` = CONCAT(`source`, ' ; adresse relue le 29 octobre 2026 : 32 Watergate Street (le 34 est la boutique Turmeaus voisine, même exploitant)'),
  `updated_at` = NOW()
 WHERE `id` = 50 AND `country_id` = 'uk';

UPDATE `translation_status` t
  JOIN `lounges` l ON l.`id` = t.`entite_id`
   SET t.`source_hash` = SHA1(l.`description`), t.`statut` = 'machine', t.`maj` = NOW()
 WHERE t.`entite` = 'lounges' AND t.`champ` = 'description' AND t.`entite_id` = '50';

UPDATE `lounges` SET `is_verified` = 0,
  `source` = 'RETIRÉ — relu le 29 octobre 2026 : aucune boutique C.Gars ni Turmeaus à Old Compton Street, ni chez Selfridges (boutiques lues : St James''s Street, Lime Street, Shepherd Market) ; le type « Cave Premium Selfridges » était faux ; à rétablir si une page est apportée',
  `updated_at` = NOW()
 WHERE `id` = 283 AND `country_id` = 'uk';

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 289';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
 (NULL, 'migration 289', 'systeme', 'fiche_corrigee', 'lounge', 50, 'Chester : adresse 32 Watergate Street (le 34 est Turmeaus), eloge « celebre » retire'),
 (NULL, 'migration 289', 'systeme', 'fiche_retiree', 'lounge', 283, 'Soho : aucune boutique a Old Compton Street ni chez Selfridges, type faux');

SELECT
  (SELECT COUNT(*) FROM `lounges` WHERE `id` = 50 AND `city` LIKE '%32 Watergate%' AND `description` NOT LIKE '%célèbre%') = 1 AS chester,
  (SELECT COUNT(*) FROM `lounges` WHERE `id` = 283 AND `is_verified` = 0) = 1 AS soho_retire,
  (SELECT COUNT(*) FROM `translation_status` WHERE `entite` = 'lounges' AND `entite_id` = '50' AND `champ` = 'description' AND `statut` = 'machine') = 5 AS sceaux_remis;
