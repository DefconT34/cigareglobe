-- ════════════════════════════════════════════════════════
-- 260 — Les conditions d'utilisation sont acceptees a l'inscription, et la
--       preuve en est gardee
-- ────────────────────────────────────────────────────────
-- D'OU CELA VIENT. L'audit du 9 octobre 2026 : le formulaire d'inscription
-- n'avait ni case ni lien vers les conditions, et rien ne prouvait qu'un
-- inscrit les ait acceptees (ni qu'il ait declare l'age legal). Des
-- conditions que personne n'a acceptees sont inopposables.
--
-- CE QUE FAIT LA MIGRATION. Deux colonnes sur `users` : la date de
-- l'acceptation et la version des conditions acceptee (backend/config.php,
-- TERMS_VERSION). NULL pour les comptes existants : ils n'ont rien accepte
-- explicitement, et le dire vaut mieux que de fabriquer une date.
--
-- A DEPLOYER AVANT LE CODE : backend/auth.php ecrit ces colonnes a chaque
-- inscription. Rejouable : la colonne n'est ajoutee que si elle manque.
-- ════════════════════════════════════════════════════════

SET @ddl = IF((SELECT COUNT(*) FROM information_schema.COLUMNS
                WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'users'
                  AND COLUMN_NAME = 'terms_accepted_at') = 0,
  'ALTER TABLE `users`
     ADD COLUMN `terms_accepted_at` DATETIME NULL DEFAULT NULL COMMENT ''Acceptation des conditions a l inscription'',
     ADD COLUMN `terms_version` VARCHAR(20) NULL DEFAULT NULL COMMENT ''Version des conditions acceptee (TERMS_VERSION)''',
  'SELECT 1');
PREPARE ddl_stmt FROM @ddl;
EXECUTE ddl_stmt;
DEALLOCATE PREPARE ddl_stmt;

SELECT
  (SELECT COUNT(*) FROM information_schema.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'users'
      AND COLUMN_NAME IN ('terms_accepted_at', 'terms_version')) = 2 AS deux_colonnes;
