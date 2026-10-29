-- ════════════════════════════════════════════════════════
-- 291 — Chester (fiche 50) : les cinq traductions relues
-- ────────────────────────────────────────────────────────
-- La 289 a réécrit la description française de la fiche 50 et remis ses cinq
-- traductions en « machine ». Relues contre le français : le sens, l'adresse
-- (32 Watergate Street), la boutique voisine (Turmeaus) et « même exploitant »
-- sont rendus sans ajout ni superlatif ; aucune correction. Seuls les sceaux
-- changent, avec la garde d'empreinte du français.
-- ════════════════════════════════════════════════════════

UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'Claude (relecture directe, 29 octobre 2026)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '50' AND `champ` = 'description' AND `lang` = 'en'
   AND `source_hash` = SHA1('La Casa del Habano officielle de Chester, 32 Watergate Street, voisine de la boutique Turmeaus, du même exploitant.');
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'Claude (relecture directe, 29 octobre 2026)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '50' AND `champ` = 'description' AND `lang` = 'es'
   AND `source_hash` = SHA1('La Casa del Habano officielle de Chester, 32 Watergate Street, voisine de la boutique Turmeaus, du même exploitant.');
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'Claude (relecture directe, 29 octobre 2026)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '50' AND `champ` = 'description' AND `lang` = 'de'
   AND `source_hash` = SHA1('La Casa del Habano officielle de Chester, 32 Watergate Street, voisine de la boutique Turmeaus, du même exploitant.');
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'Claude (relecture directe, 29 octobre 2026)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '50' AND `champ` = 'description' AND `lang` = 'zh'
   AND `source_hash` = SHA1('La Casa del Habano officielle de Chester, 32 Watergate Street, voisine de la boutique Turmeaus, du même exploitant.');
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'Claude (relecture directe, 29 octobre 2026)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '50' AND `champ` = 'description' AND `lang` = 'ar'
   AND `source_hash` = SHA1('La Casa del Habano officielle de Chester, 32 Watergate Street, voisine de la boutique Turmeaus, du même exploitant.');

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 291';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 291', 'systeme', 'traductions_relues', 'lounge', 50, 'Chester : 5 traductions relues, 0 corrigee');

SELECT (SELECT COUNT(*) FROM `translation_status` WHERE `entite` = 'lounges' AND `entite_id` = '50' AND `champ` = 'description' AND `statut` = 'relu') = 5 AS chester_relu;
