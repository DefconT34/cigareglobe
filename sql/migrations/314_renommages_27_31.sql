-- ════════════════════════════════════════════════════════
-- 314 — Deux renommages : #27 (La Réserve Paris) et #31 (Gimeno devenu Domingo Cigars)
-- ────────────────────────────────────────────────────────
-- CE QU'ON A TROUVÉ (31 octobre 2026). Relecture de 24 fiches « à vérifier » : deux noms ne disaient plus le lieu.
-- 1. #27 s'appelait « Le Gaspard », bar de l'hôtel dont la page officielle ne parle pas de cigares ; la description
--    disait déjà que le fumoir est autre chose (Smoking Room selon l'hôtel, Winter Garden selon Cigar Aficionado,
--    11 août 2023). Le nom suit désormais le lieu. Description et statut inchangés, rien à retraduire.
-- 2. #31 s'appelait « Gimeno » : le site de la boutique (domingocigars.com, page lue) dit qu'elle a été rebaptisée
--    Domingo Cigars. La description, qui disait le renommage non établi, est réécrite ; ses traductions sont
--    rescellées dans la même migration. La fiche reste « à vérifier » : aucune source datée 2024-2026, aucun salon
--    où fumer attesté.
-- ════════════════════════════════════════════════════════

UPDATE `lounges` SET `name` = 'La Réserve Paris — Smoking Room (Winter Garden)', `updated_at` = NOW()
 WHERE `id` = 27 AND `country_id` = 'france' AND `is_verified` = 1;

UPDATE `lounges` SET `name` = 'Domingo Cigars (ex-Gimeno) — La Rambla', `website` = 'https://domingocigars.com', `source` = 'à vérifier — relu le 31 octobre 2026 : domingocigars.com (page lue : « fondé en 1920 sous le nom de Casa Gimeno ; rebaptisé Domingo Cigars ») ; barcelona.com, annuaire non daté : Gimeno puis Domingo Cigars, La Rambla 100 ; leadstal.com, non datée : « antiguo Gimeno Tabac ». Aucune source datée 2024-2026 ; salon où fumer non attesté.',
  `description` = 'Boutique de cigares de La Rambla 100, à Barcelone, fondée en 1920 sous le nom de Casa Gimeno (Juan Francisco Gimeno selon l''annuaire barcelona.com) ; le site de la boutique dit qu''elle a été rebaptisée Domingo Cigars. Aucun salon où fumer n''est mentionné sur place.',
  `description_en` = 'Cigar shop at La Rambla 100, Barcelona, founded in 1920 as Casa Gimeno (Juan Francisco Gimeno according to the barcelona.com directory); the shop''s own website says it was renamed Domingo Cigars. No smoking room on the premises is mentioned.',
  `description_es` = 'Tienda de puros de La Rambla 100, en Barcelona, fundada en 1920 como Casa Gimeno (Juan Francisco Gimeno según el directorio barcelona.com); el sitio de la propia tienda dice que pasó a llamarse Domingo Cigars. No se menciona ninguna sala de fumadores en el local.',
  `description_de` = 'Zigarrengeschäft in der La Rambla 100 in Barcelona, 1920 als Casa Gimeno gegründet (laut Verzeichnis barcelona.com von Juan Francisco Gimeno); die Website des Geschäfts selbst besagt, es sei in Domingo Cigars umbenannt worden. Ein Raucherzimmer vor Ort wird nicht erwähnt.',
  `description_zh` = '巴塞罗那 La Rambla 100 号的雪茄店，1920年以 Casa Gimeno 之名创立（据 barcelona.com 名录由 Juan Francisco Gimeno 创办）；该店自己的网站称其已更名为 Domingo Cigars。未提及店内设有吸烟室。',
  `description_ar` = 'متجر سيجار في La Rambla 100 ببرشلونة، تأسس عام 1920 باسم Casa Gimeno (على يد Juan Francisco Gimeno بحسب دليل barcelona.com)؛ ويذكر موقع المتجر نفسه أنه أُعيدت تسميته إلى Domingo Cigars. ولا يُذكر وجود غرفة تدخين في المحل.',
  `updated_at` = NOW()
 WHERE `id` = 31 AND `country_id` = 'spain' AND `is_verified` = 1;

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'lounges', l.`id`, 'description', g.lang, SHA1(l.`description`), 'machine', NOW()
  FROM `lounges` l
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de' UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') g
 WHERE l.`id` = 31
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `statut` = 'machine', `maj` = NOW();

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 314';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 314', 'systeme', 'fiches_relues', 'systeme', 0, 'Deux renommages : 27 (La Reserve Paris), 31 (Domingo Cigars)');

-- Contrôle : des 1 partout.
SELECT
  (SELECT COUNT(*) FROM `lounges` WHERE `id` = 27 AND `name` LIKE 'La Réserve Paris%') = 1 AS `nom_27`,
  (SELECT COUNT(*) FROM `lounges` WHERE `id` = 31 AND `name` LIKE 'Domingo Cigars%' AND `source` LIKE 'à vérifier — relu le 31 octobre 2026%') = 1 AS `fiche_31`,
  (SELECT COUNT(*) FROM `translation_status` WHERE `entite` = 'lounges' AND `entite_id` = '31' AND `champ` = 'description' AND `statut` = 'machine' AND `source_hash` = SHA1((SELECT `description` FROM `lounges` WHERE `id` = 31))) = 5 AS `sceaux_31`;
