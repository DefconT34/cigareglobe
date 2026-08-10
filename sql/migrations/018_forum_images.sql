-- ═══════════════════════════════════════════════════════════════════
-- Migration 018 — Images dans les messages de la communauté
-- ───────────────────────────────────────────────────────────────────
-- Trois images au plus par message, en pièces jointes. Le §5 du cahier
-- des charges le prévoyait ; une communauté de cigares sans photos, ce
-- sont les trois quarts de ce qu'on veut montrer qui manquent — la
-- bague, la cendre, la coupe, la cave qu'on vient de monter.
--
-- PAS D'AFFICHE D'ÉVÉNEMENT. Elle est écartée volontairement : une
-- affiche est par définition un support promotionnel, et si elle porte
-- le logo d'une maison, c'est de la publicité pour le tabac au sens le
-- plus littéral de la loi Évin. Une photo de son propre cigare est un
-- témoignage ; une affiche n'en est pas un. La question attend l'avis
-- juridique (§10).
--
-- POURQUOI `post_id` EST NULLABLE. On téléverse AVANT de publier : le
-- rédacteur choisit ses images, les voit en aperçu, puis envoie son
-- message. L'image existe donc avant le message auquel elle se
-- rattachera — et parfois avant un message qui ne sera jamais envoyé.
-- Ces orphelines sont purgées au bout de 24 h, à l'occasion du
-- téléversement suivant du même membre : un statut qui dépend d'une
-- horloge doit se rattraper tout seul, comme la péremption des
-- rendez-vous (migration 017).
--
-- Le fichier est stocké sous « AAAAMM/nom.jpg » : un dossier par mois
-- évite le répertoire à cent mille entrées, que les systèmes de
-- fichiers et les sauvegardes supportent mal.
-- ═══════════════════════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS forum_post_images (
  id         INT UNSIGNED NOT NULL AUTO_INCREMENT,
  post_id    INT UNSIGNED NULL COMMENT 'NULL tant que le message n''est pas publie',
  user_id    INT UNSIGNED NULL,
  file       VARCHAR(120) NOT NULL COMMENT 'Chemin relatif : AAAAMM/nom.jpg',
  w          SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  h          SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY idx_fpi_post (post_id),
  -- Retrouver les orphelines d'un membre sans balayer la table.
  KEY idx_fpi_orphelines (user_id, post_id, created_at),
  CONSTRAINT fk_fpi_post FOREIGN KEY (post_id) REFERENCES forum_posts (id) ON DELETE CASCADE,
  CONSTRAINT fk_fpi_user FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
