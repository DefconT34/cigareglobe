-- ════════════════════════════════════════════════════════
-- 317 — Mapamba House (Douala) et trois fiches confirmées
-- ────────────────────────────────────────────────────────
-- CE QU'ON A TROUVÉ (31 octobre 2026). Lot D de relecture : 30 fiches « à vérifier » relues, 5 confirmées par un agent,
-- trois retenues ici (141 Angelina Hanoï, 182 Arturo Fuente Cigar Club Santiago, 184 Festival de Danlí : deux sources lues
-- chacune, dont une datée 2024-2026). Écartées : 147 (adresse non relue), 232 et 278 (renommages à instruire avec leur
-- description), 129/143/196 « introuvables » sans contradicteur suffisant : aucune fiche retirée.
-- Mapamba House (Douala, Bonapriso, rue Paul Monthe) : lieu signalé par l'utilisateur ; localisé par la recherche Google
-- (qui ne confirme rien) et des publications de réseaux sociaux ; fiche « à vérifier », sans description d'offre.
-- Photo : lancer php tools/placeholders.php --tout depuis ~/public_html.
-- ════════════════════════════════════════════════════════

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : habanos.com, 3 avril 2025 : « Angelina named a Habanos Lounge, 15 Ngo Quyen » ; journaldespalaces.com, août 2024 : « Angelina awarded Habanos Lounge elite cigar bar status » ; les deux dates divergent (août 2024 / avril 2025)', `updated_at` = NOW()
 WHERE `id` = 141 AND `is_verified` = 1 AND `source` NOT LIKE 'RETIRÉ%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : cigarinspector.com, décembre 2024 : « Arturo Fuente Cigar Club Santiago ouvre dans le Hotel Santiago » ; cigar-coop.com, 18 février 2026 : Cigar Club au Hotel Santiago, hôte du ProCigar 2026 ; avenue non confirmée par une page datée', `updated_at` = NOW()
 WHERE `id` = 182 AND `is_verified` = 1 AND `source` NOT LIKE 'RETIRÉ%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : newsinamerica.com, 2026 : 6e édition du Festival del Puro y del Café, 15 et 16 mai, Danlí ; cigarjournal.com, 2026 : Honduras Cigar & Coffee Festival, 15-16 mai, Danlí ; un autre festival est annoncé pour janvier 2027 (halfwheel.com), distinct, à vérifier', `updated_at` = NOW()
 WHERE `id` = 184 AND `is_verified` = 1 AND `source` NOT LIKE 'RETIRÉ%';

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `instagram`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2640, 'cameroon', 'Mapamba House', 'Douala — Rue Paul Monthe, Bonapriso', 'Cigar Lounge', '+237 680 50 58 57', NULL, 'mapambahouse',
  'à vérifier — relu le 31 octobre 2026 : instagram.com/mapambahouse (profil illisible sans connexion) ; publications Facebook et TikTok de 2026 : adresse Bonapriso, rue Paul Monthe ; 237mood_officiel (Instagram, 2026) : lieu de luxe à Douala consacré aux cigares, dires du propriétaire. Ni presse ni annuaire lus : aucune seconde source indépendante.', 1,
  'Mapamba House, à Douala : un salon où l''on peut fumer le cigare.',
  'Mapamba House, in Douala: a lounge where you can smoke a cigar.',
  'Mapamba House, en Douala: un salón donde se puede fumar un puro.',
  'Mapamba House, Douala: eine Lounge, in der man Zigarre rauchen kann.',
  'Mapamba House,位于Douala:可以抽雪茄的雪茄吧。',
  'Mapamba House، في Douala: صالة يمكن فيها تدخين السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2640 OR (`country_id` = 'cameroon' AND `name` = 'Mapamba House'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 550, 2640, 'placeholder_2640.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2640 AND `name` = 'Mapamba House') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2640);

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'lounges', l.`id`, 'description', g.lang, SHA1(l.`description`), 'machine', NOW()
  FROM `lounges` l
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de' UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') g
 WHERE l.`id` = 2640
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `statut` = 'machine', `maj` = NOW();

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 317';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 317', 'systeme', 'fiche_ajoutee', 'systeme', 0, 'Mapamba House (2640) ajoutee ; 141, 182, 184 confirmees, lus le 31 octobre 2026');

-- Contrôle : des 1 partout.
SELECT
  (SELECT COUNT(*) FROM `lounges` WHERE `id` = 2640 AND `country_id` = 'cameroon') = 1 AS `fiche`,
  (SELECT COUNT(*) FROM `lounge_photos` WHERE `lounge_id` = 2640) = 1 AS `photo`,
  (SELECT COUNT(*) FROM `translation_status` WHERE `entite` = 'lounges' AND `entite_id` = '2640' AND `champ` = 'description' AND `statut` = 'machine') = 5 AS `sceaux`,
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (141, 182, 184) AND `source` LIKE 'relu le 31 octobre 2026%') = 3 AS `confirmees`;
