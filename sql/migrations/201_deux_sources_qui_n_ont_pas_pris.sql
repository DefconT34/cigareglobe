-- ════════════════════════════════════════════════════════
-- 201 — Deux sources qui n'ont pas pris en production
-- ────────────────────────────────────────────────────────
-- MESURÉ APRÈS DÉPLOIEMENT DES MIGRATIONS 194 À 200. Sur les cent
-- soixante-dix-neuf fiches de marques annoncées par le globe, cent
-- soixante-dix-sept servaient leur source en ligne. DEUX ne l'avaient
-- pas :
--
--   MENENDEZ AMERINO  (brazil)
--   VEGAS DE SANTIAGO (costarica)
--
-- Les deux sont remplies en developpement depuis la migration 195, et
-- leurs voisines immediates dans le meme CASE — Cuban Crafters, De Los
-- Reyes, Don Tomas, Dona Flor — ont bien la leur en ligne. Les deux
-- lignes ont par ailleurs, en production, exactement le meme `founded`
-- et le meme `factory` qu'ici : ce ne sont pas d'autres lignes.
--
-- ── CE QUE JE NE SAIS PAS ───────────────────────────────
-- POURQUOI l'instruction les a manquees. Le fichier de la 195 est sain,
-- l'ordre des migrations est le bon, et les deux noms sont en ASCII pur.
-- Une hypothese tient — un espace invisible dans `brands`.`name` cote
-- production, que le rendu HTML avalerait sans rien montrer — mais je
-- n'ai pas d'acces a cette base pour la verifier.
--
-- Cette migration ne suppose donc RIEN : elle vise par TRIM, normalise
-- le nom au passage, et se rejoue sans dommage.
--
-- ── ET SURTOUT : LE CONTROLE MANQUAIT ───────────────────
-- La campagne de tests verifie la base de DEVELOPPEMENT. Elle affirme
-- « aucune maison n'est sans source », et elle a raison — sur cette
-- base-la. Elle ne dit rien de la base servie, et cet ecart n'a ete vu
-- qu'en echantillonnant des pages a la main.
--
-- `tools/prevol.php` est le SEUL outil de ce depot qui s'execute sur le
-- serveur. La regle lui revient donc : il compte desormais les fiches
-- servies sans source, marques ET etablissements. En AVERTISSEMENT et
-- non en blocage — une fiche sans source est incomplete, pas cassee, et
-- bloquer punirait le deploiement qui apporte le correctif.
--
--   php tools/prevol.php    # a lancer SUR LE SERVEUR apres celle-ci
-- ════════════════════════════════════════════════════════

-- Un nom qui traine un espace ne se voit nulle part : le HTML l'avale,
-- le slug l'ignore, et seule une egalite stricte le revele.
UPDATE `brands` SET `name` = TRIM(`name`) WHERE `name` <> TRIM(`name`);

UPDATE `brands`
   SET `source` = 'vegassantiago.com, cigars-vegasantiago.biz et casagranda-cigars.de (Marc Niehaus, Puriscal, 1 100 m, Luis Santana Lamas, Chaman, les bagues privées) — aucune de ces sources ne donne l''année de fondation',
       `updated_at` = NOW()
 WHERE TRIM(`name`) = 'Vegas de Santiago';

UPDATE `brands`
   SET `source` = 'menendezamerino.com et correiobraziliense.com.br (1977, São Gonçalo dos Campos, Alonso Menendez en 1980, Dona Flor en 1982, roulage intégralement artisanal)',
       `updated_at` = NOW()
 WHERE TRIM(`name`) = 'Menendez Amerino';

-- Les deux lignes doivent valoir 1, et le compte général revenir à zéro.
SELECT 'Vegas de Santiago' AS marque,
       `source` LIKE 'vegassantiago.com%' AS ok FROM `brands` WHERE TRIM(`name`)='Vegas de Santiago'
UNION ALL
SELECT 'Menendez Amerino',
       `source` LIKE 'menendezamerino.com%' FROM `brands` WHERE TRIM(`name`)='Menendez Amerino';

SELECT COUNT(*)                                     AS marques,
       SUM(TRIM(COALESCE(`source`,'')) = '')        AS sans_source
  FROM `brands`;

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 201','systeme','deux_sources_qui_n_ont_pas_pris','marque',0,
   'MESURE APRES DEPLOIEMENT DES MIGRATIONS 194 A 200 : sur 179 fiches de marques annoncees par le globe, 177 servaient leur source en ligne ; MENENDEZ AMERINO et VEGAS DE SANTIAGO ne l avaient pas. Les deux sont remplies en developpement depuis la 195, et leurs voisines immediates dans le meme CASE — Cuban Crafters, De Los Reyes, Don Tomas, Dona Flor — ont bien la leur en ligne. En production, ces deux lignes portent exactement le meme founded et le meme factory qu ici : ce ne sont pas d autres lignes'),
  (NULL,'migration 201','systeme','ce_que_je_ne_sais_pas','marque',0,
   'POURQUOI l instruction les a manquees. Le fichier de la 195 est sain, l ordre des migrations est le bon, et les deux noms sont en ASCII pur. Une hypothese tient — un espace invisible dans brands.name cote production, que le rendu HTML avalerait sans rien montrer — mais je n ai pas d acces a cette base pour la verifier. Cette migration ne suppose donc rien : elle vise par TRIM, normalise le nom au passage, et se rejoue sans dommage'),
  (NULL,'migration 201','systeme','le_controle_manquait_et_il_est_pose','systeme',0,
   'LA CAMPAGNE DE TESTS VERIFIE LA BASE DE DEVELOPPEMENT. Elle affirme « aucune maison n est sans source » et elle a raison — sur cette base-la. Elle ne dit rien de la base SERVIE, et l ecart n a ete vu qu en echantillonnant des pages a la main. tools/prevol.php est le SEUL outil de ce depot qui s execute sur le serveur : il compte desormais les fiches servies sans source, marques ET etablissements. En AVERTISSEMENT et non en blocage — une fiche sans source est incomplete, pas cassee, et bloquer punirait le deploiement qui apporte le correctif');
