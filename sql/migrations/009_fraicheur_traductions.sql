-- ═══════════════════════════════════════════════════════════════════
-- Migration 009 — Fraîcheur des traductions
-- ───────────────────────────────────────────────────────────────────
-- Le schéma actuel range chaque traduction dans une colonne
-- « champ_xx ». Une colonne ne sait dire qu'une chose : pleine ou vide.
-- Elle ne sait pas dire de QUEL français elle est la traduction.
--
-- Deux conséquences constatées :
--
--   1. 665 valeurs de charabia — du français passé à une substitution
--      mot à mot — ont compté pour traduites pendant des mois. L'export
--      mesure le vide ; une colonne pleine est réputée faite.
--
--   2. La réécriture de 168 sources françaises a laissé leurs cinq
--      traductions décrire l'ancien texte, sans que rien ne le signale.
--      Cet écart se creuse à chaque correction du français.
--
-- Cette table ne remplace rien : elle observe. Les colonnes restent la
-- source de vérité servie aux visiteurs, et le site n'en dépend pas —
-- c'est un instrument d'outillage, pas un chemin d'exécution.
--
-- L'empreinte est celle du texte source AU MOMENT de la traduction. Si
-- sha1(français actuel) ne lui correspond plus, la traduction est
-- périmée, et on le sait sans avoir à le relire.
--
-- Le jour où l'on migrera vers une table de traductions unique, cette
-- table en est déjà la moitié.
-- ═══════════════════════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS translation_status (
    entite      VARCHAR(32)  NOT NULL COMMENT 'table d''origine',
    entite_id   VARCHAR(64)  NOT NULL COMMENT 'clé primaire de la ligne',
    champ       VARCHAR(32)  NOT NULL COMMENT 'colonne source, sans suffixe',
    lang        CHAR(2)      NOT NULL,
    source_hash CHAR(40)     NOT NULL COMMENT 'sha1 du français traduit',
    statut      ENUM('machine','relu') NOT NULL DEFAULT 'machine'
                             COMMENT 'relu = vérifié par un humain',
    maj         TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP
                             ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (entite, entite_id, champ, lang),
    KEY idx_statut (statut)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
