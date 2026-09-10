-- ════════════════════════════════════════════════════════
-- 202 — Rectification : la migration 201 reposait sur une
--       erreur de MA part
-- ────────────────────────────────────────────────────────
-- CE FICHIER NE CHANGE AUCUNE DONNEE. Il corrige le journal de
-- moderation, qui porte depuis la 201 trois affirmations fausses.
--
-- ── CE QUE LA 201 AFFIRMAIT ─────────────────────────────
-- Que deux fiches — MENENDEZ AMERINO et VEGAS DE SANTIAGO — etaient
-- servies en ligne sans leur source, alors qu'elles etaient remplies en
-- developpement ; que je ne savais pas pourquoi ; et qu'une hypothese
-- d'espace invisible dans `brands`.`name` tenait faute de mieux.
--
-- ── CE QUI ETAIT VRAI ───────────────────────────────────
-- RIEN DE TOUT CELA. Les deux sondes lancees sur la base servie l'ont
-- montre sans ambiguite :
--
--   SELECT acteur_nom, COUNT(*) FROM moderation_log ...
--     → les migrations 195 a 201 y sont TOUTES, et completes
--
--   SELECT name, HEX(name), CHAR_LENGTH(COALESCE(source,'')) ...
--     → « Menendez Amerino » = 4D656E...6F, seize octets, aucun
--       caractere invisible ; source de 156 caracteres
--     → « Vegas de Santiago », dix-sept octets ; source de 202
--
-- LES SOURCES ETAIENT EN BASE DEPUIS LA MIGRATION 195. La 201 n'a donc
-- rien repare : elle a reecrit deux valeurs identiques.
--
-- ── LA VRAIE CAUSE ──────────────────────────────────────
-- Le serveur repond `Cache-Control: public, max-age=300`. Mes
-- verifications par le Web, lancees dans les minutes suivant la
-- migration, ont lu des pages RENDUES AVANT ELLE. Contenu d'avant,
-- en-tetes d'aujourd'hui, aucun indice visible.
--
-- Refaites en cassant le cache, les memes requetes rendent 179 fiches
-- sur 179 avec leur bloc source. Le defaut n'a jamais existe.
--
-- ── CE QUE J'AI MAL FAIT ────────────────────────────────
-- 1. J'ai conclu a un defaut de donnees sur la foi de pages Web, sans
--    verifier que je lisais bien l'etat courant.
-- 2. J'ai ecrit une migration corrective AVANT d'avoir la mesure qui
--    l'aurait rendue inutile — alors que les deux sondes qui tranchent
--    tiennent en deux lignes et que je les ai redigees APRES.
-- 3. J'ai consigne au journal une hypothese non verifiee. Le journal
--    doit porter ce qui est mesure, pas ce qui est suppose.
--
-- ── CE QUI RESTE, ET QUI EST BON ────────────────────────
-- Le controle ajoute a `tools/prevol.php` — le compte des fiches
-- servies sans source, marques et etablissements. Il lit LA BASE
-- SERVIE, sur le serveur, et il est donc insensible au cache HTTP qui
-- m'a trompe. C'est la seule chose que cet episode a produite d'utile,
-- et elle reste.
--
-- `docs/deploiement.md` porte desormais le quatrieme geste — lancer
-- prevol.php sur le serveur — et l'avertissement sur le cache de cinq
-- minutes, avec la sonde `moderation_log` qui dit quelles migrations
-- ont reellement tourne.
-- ════════════════════════════════════════════════════════

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 202','systeme','rectification_de_la_201','marque',0,
   'LA MIGRATION 201 REPOSAIT SUR UNE ERREUR. Elle affirmait que MENENDEZ AMERINO et VEGAS DE SANTIAGO etaient servies sans leur source. C etait faux : les deux sondes lancees sur la base servie montrent que les migrations 195 a 201 y sont toutes et completes, que les deux noms ne portent aucun caractere invisible (HEX a l appui), et que leurs sources font 156 et 202 caracteres. LES SOURCES ETAIENT EN BASE DEPUIS LA 195 ; la 201 a reecrit deux valeurs identiques et n a rien repare'),
  (NULL,'migration 202','systeme','la_vraie_cause_etait_un_cache','systeme',0,
   'Le serveur repond Cache-Control: public, max-age=300. Les verifications par le Web lancees dans les minutes suivant une migration lisent des pages RENDUES AVANT ELLE — contenu d avant, en-tetes d aujourd hui, aucun indice visible. Refaites en cassant le cache, les memes requetes rendent 179 fiches sur 179 avec leur bloc source. LE DEFAUT N A JAMAIS EXISTE'),
  (NULL,'migration 202','systeme','ce_qui_a_ete_mal_fait','systeme',0,
   'TROIS FAUTES, ET ELLES SONT A MOI. 1) Avoir conclu a un defaut de donnees sur la foi de pages Web, sans verifier que je lisais l etat courant. 2) Avoir ecrit une migration corrective AVANT d avoir la mesure qui l aurait rendue inutile, alors que les deux sondes qui tranchent tiennent en deux lignes et que je les ai redigees APRES. 3) Avoir consigne au journal une hypothese non verifiee : le journal doit porter ce qui est mesure, pas ce qui est suppose'),
  (NULL,'migration 202','systeme','ce_qui_reste_et_qui_est_bon','systeme',0,
   'Le controle ajoute a tools/prevol.php — le compte des fiches servies sans source, marques et etablissements — lit LA BASE SERVIE sur le serveur, et il est donc insensible au cache HTTP qui m a trompe. C est la seule chose utile que cet episode a produite, et elle reste. docs/deploiement.md porte desormais le QUATRIEME GESTE (lancer prevol.php sur le serveur) et l avertissement sur le cache de cinq minutes, avec la sonde moderation_log qui dit quelles migrations ont reellement tourne');

-- Rien d'autre. La base est juste, et l'etait deja.
SELECT COUNT(*) AS marques, SUM(TRIM(COALESCE(`source`,'')) = '') AS sans_source FROM `brands`;
