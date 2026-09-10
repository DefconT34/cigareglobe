-- ════════════════════════════════════════════════════════
-- 203 — De quoi savoir si quelqu'un vient
-- ────────────────────────────────────────────────────────
-- LE SITE N'AVAIT AUCUNE MESURE. Ni Google Analytics, ni Plausible, ni
-- Matomo, ni compteur maison. « Je n'ai pas encore d'audience » n'etait
-- donc pas un constat mais une ABSENCE DE CONSTAT : trois cents
-- visiteurs par mois arrivant par la recherche auraient ete invisibles.
--
-- ── POURQUOI PAS GOOGLE ANALYTICS ───────────────────────
-- Le portique d'age de ce site porte ce commentaire, et il fait
-- doctrine : « il ne pose pas de cookie. Le choix vit dans localStorage
-- [...] et pas une ligne de plus dans une banniere de consentement ».
--
-- Poser GA4, c'est un cookie, donc une banniere, donc un obstacle de
-- plus entre un visiteur et une fiche — sur un site qui n'a pas encore
-- de visiteurs. Et c'est confier a un tiers la seule chose qu'on
-- cherche a savoir.
--
-- ── CE QUI EST ENREGISTRE, ET CE QUI NE L'EST PAS ───────
-- ENREGISTRE : la date, le type de page, le chemin, la langue, le
-- DOMAINE referent (google.com, pas l'URL complete), et un drapeau
-- robot.
--
-- PAS ENREGISTRE : aucune adresse IP, aucun user-agent complet, aucun
-- cookie, aucun identifiant qui traverse la journee.
--
-- L'EMPREINTE MERITE SON PARAGRAPHE. Pour compter des VISITEURS et non
-- des pages, il faut distinguer deux lectures sans identifier personne.
-- On stocke donc douze caracteres de SHA1(sel_du_jour + ip + ua), ou
-- `sel_du_jour` derive d'ADMIN_KEY et de la date. Consequences :
--
--   · irreversible — l'IP n'est pas retrouvable depuis l'empreinte
--   · non correlable d'un jour a l'autre — le sel change a minuit
--   · inutile a qui volerait la table sans ADMIN_KEY
--
-- C'est le procede des mesures dites sans cookie. Il donne « combien de
-- personnes distinctes aujourd'hui » sans jamais dire QUI.
--
-- ── CE QUE CETTE MESURE NE VERRA PAS ────────────────────
-- Le `.htaccess` pose « ExpiresByType text/html access plus 1 hour » et
-- l'hebergeur repond `Cache-Control: public, max-age=300`. UNE PAGE
-- SERVIE DEPUIS LE CACHE N'ATTEINT PAS PHP, donc n'est pas comptee.
--
-- Les chiffres sont donc un PLANCHER, pas un compte exact : la premiere
-- visite de chacun est vue, les relectures dans l'heure ne le sont pas.
-- A ce stade — savoir si quelqu'un arrive, et par ou — c'est la bonne
-- question et le bon outil. Le jour ou il faudra mesurer l'engagement,
-- il faudra autre chose, et l'outil le dit lui-meme a chaque execution.
--
--   php tools/audience.php          # le rapport
--   php tools/audience.php --jours 30
-- ════════════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS `audience` (
  `id`        bigint unsigned NOT NULL AUTO_INCREMENT,
  `vu_le`     datetime NOT NULL,
  `jour`      date NOT NULL COMMENT 'redondant avec vu_le, mais indexe pour les comptes',
  `type`      varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'marque, cave, pays, accueil…',
  `chemin`    varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang`      char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fr',
  `referent`  varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'DOMAINE seul, jamais l''URL complete',
  `robot`     tinyint(1) NOT NULL DEFAULT 0,
  `empreinte` char(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'SHA1(sel du jour + ip + ua), tronque, irreversible, non correlable d''un jour a l''autre',
  PRIMARY KEY (`id`),
  KEY `k_jour` (`jour`),
  KEY `k_type` (`type`),
  KEY `k_robot` (`robot`),
  KEY `k_jour_empreinte` (`jour`, `empreinte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 203','systeme','mesure_d_audience_posee','systeme',0,
   'LE SITE N AVAIT AUCUNE MESURE : ni Google Analytics, ni Plausible, ni Matomo, ni compteur maison. « Je n ai pas encore d audience » n etait donc pas un constat mais une ABSENCE DE CONSTAT. Table `audience` : date, type de page, chemin, langue, DOMAINE referent, drapeau robot'),
  (NULL,'migration 203','systeme','pourquoi_pas_google_analytics','systeme',0,
   'Le portique d age de ce site porte ce commentaire, et il fait doctrine : « il ne pose pas de cookie. Le choix vit dans localStorage [...] et pas une ligne de plus dans une banniere de consentement ». Poser GA4 c est un cookie, donc une banniere, donc un obstacle de plus entre un visiteur et une fiche — sur un site qui n a pas encore de visiteurs. Et c est confier a un tiers la seule chose qu on cherche a savoir'),
  (NULL,'migration 203','systeme','ce_qui_n_est_pas_enregistre','systeme',0,
   'AUCUNE ADRESSE IP, aucun user-agent complet, aucun cookie, aucun identifiant qui traverse la journee. Pour compter des VISITEURS sans identifier personne, on stocke douze caracteres de SHA1(sel_du_jour + ip + ua), ou le sel derive d ADMIN_KEY et de la date : irreversible, non correlable d un jour a l autre puisque le sel change a minuit, et inutile a qui volerait la table sans ADMIN_KEY'),
  (NULL,'migration 203','systeme','ce_que_cette_mesure_ne_verra_pas','systeme',0,
   'Le .htaccess pose « ExpiresByType text/html access plus 1 hour » et l hebergeur repond Cache-Control: public, max-age=300. UNE PAGE SERVIE DEPUIS LE CACHE N ATTEINT PAS PHP, donc n est pas comptee. Les chiffres sont un PLANCHER : la premiere visite de chacun est vue, les relectures dans l heure ne le sont pas. L outil le dit lui-meme a chaque execution — le meme cache qui m avait fait croire a un defaut de sources a la 201');
