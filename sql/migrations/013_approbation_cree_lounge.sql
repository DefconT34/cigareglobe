-- ═══════════════════════════════════════════════════════════════════
-- Migration 013 — Une approbation crée un vrai établissement
-- ───────────────────────────────────────────────────────────────────
-- CE QUI NE MARCHAIT PAS
--
-- `approve_contribution()` écrivait dans `approved_lounges`, et
-- `data.php` lisait cette table avec :
--
--     WHERE country_id = ? AND status = 'approved'
--
-- `approved_lounges` n'a jamais eu de colonne `status`. La requête
-- levait donc une erreur SQL à chaque appel, avalée par un
-- `catch (Throwable)` écrit pour tolérer l'absence de la table. La liste
-- revenait vide, en silence.
--
-- Résultat : le modérateur voyait « Approuvé », le contributeur voyait
-- sa contribution approuvée dans son espace, et RIEN n'apparaissait sur
-- le site. Vérifié sur la base réelle — 1 établissement approuvé
-- (Cohiba’r, Côte d'Ivoire), 0 servi par l'API.
--
-- CE QUE FAIT CETTE MIGRATION
--
-- L'approbation crée désormais une vraie ligne dans `lounges`. Un
-- établissement approuvé EST un établissement : il gagne du même coup la
-- notation, les avis, les favoris, les photos et les colonnes de
-- traduction, dont les fiches « communautaires » étaient privées.
--
-- `contribution_id` porte la provenance. Il sert à trois choses :
-- remonter à l'auteur, distinguer plus tard une fiche communautaire
-- d'une fiche du catalogue si le besoin vient, et garantir qu'une
-- double approbation ne crée pas de doublon.
--
-- L'unicité existait déjà sur (country_id, name) : une contribution
-- portant le nom d'un établissement déjà présent sera ignorée plutôt que
-- dupliquée. `approve_contribution()` journalise ce cas — c'est
-- précisément le genre de silence qui a produit le défaut ci-dessus.
--
-- `approved_lounges` est CONSERVÉE : elle porte `approved_at` et fait
-- office de journal. Elle n'est simplement plus servie aux visiteurs.
-- ═══════════════════════════════════════════════════════════════════

ALTER TABLE lounges
  ADD COLUMN contribution_id INT UNSIGNED NULL DEFAULT NULL COMMENT 'Contribution a l origine de cette fiche, si communautaire',
  ADD UNIQUE KEY uq_contribution (contribution_id);

-- Reprise des approbations déjà prononcées, restées invisibles.
-- INSERT IGNORE : une fiche portant déjà ce nom dans ce pays est
-- conservée telle quelle, elle fait autorité.
INSERT IGNORE INTO lounges
  (contribution_id, country_id, name, city, type, phone, description, source,
   hours, maps_url, website, instagram, lat, lon, is_verified)
SELECT a.contribution_id, a.country_id, a.name, a.city, a.type, a.phone,
       a.description, a.source_url, a.hours, a.maps_url, a.website, a.instagram,
       a.lat, a.lon, 1
FROM approved_lounges a;
