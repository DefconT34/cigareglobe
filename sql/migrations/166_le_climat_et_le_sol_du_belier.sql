-- ════════════════════════════════════════════════════════
-- 166 — Le climat et le sol du Bélier
-- ────────────────────────────────────────────────────────
-- DEUX DES CINQ TROUS SE REFERMENT. La migration 165 a ouvert la Côte
-- d'Ivoire en pays producteur avec cinq champs vides déclarés :
-- `varieties`, `harvest`, `climate`, `soil` et `revenue`. Trois d'entre
-- eux ne dépendent pas du fabricant — le climat et le sol sont des
-- données géographiques publiques.
--
-- ── LA CONDITION QUE JE M'ÉTAIS FIXÉE ────────────────────
-- « À condition de les rattacher aux zones de culture et non au pays en
-- général, sinon j'écrirais une généralité déguisée en fait tabacole. »
-- Elle est tenue : la source porte sur un périmètre DU BÉLIER, pas sur
-- la Côte d'Ivoire.
--
-- ── LA SOURCE ────────────────────────────────────────────
-- « Intégration de données topographiques et hydrographiques en vue de
-- la localisation des zones humides potentielles de fond de vallée :
-- cas d'un périmètre de la région du Bélier en Côte d'Ivoire »,
-- Physio-Géo (revue de géographie physique, OpenEdition) —
-- journals.openedition.org/physio-geo/4120
--
-- Ce qu'elle établit, sur le terrain d'étude :
--   · climat dit BAOULÉEN, tropical humide de TRANSITION entre le
--     climat équatorial à quatre saisons du sud et le tropical humide à
--     deux saisons du nord ;
--   · pluviosité annuelle moyenne de 1 000 à 1 400 mm, en deux périodes
--     humides — avril-juin (grande) et septembre-octobre (petite) ;
--   · substratum ESSENTIELLEMENT GRANITIQUE ;
--   · sols FERRALLITIQUES sur l'essentiel du terrain, gleysols
--     hydromorphes le long des cours d'eau.
--
-- ── CE QU'ON N'EN DÉDUIT PAS ─────────────────────────────
-- `harvest` RESTE VIDE, et c'est le point délicat. Le régime des pluies
-- est documenté — deux saisons — mais un calendrier de RÉCOLTE DU TABAC
-- ne s'en déduit pas : la date de coupe dépend de la variété, de la
-- conduite de la plante et du séchage, pas seulement de la pluie.
-- Écrire « Avr – Juin » parce qu'il pleut à ce moment-là serait
-- exactement la généralité déguisée en fait tabacole que cette
-- migration se refuse.
--
-- `varieties` reste vide : aucune source. `revenue` aussi, et
-- probablement pour de bon — la filière est intérieure, il n'existe pas
-- de ligne d'exportation. Les Canaries sont déjà dans ce cas.
--
-- Il restera donc TROIS trous sur cinq, dont deux qu'une question à
-- Fagot refermerait : la variété et la saison de récolte.
--
-- ── ET LES GLEYSOLS NE SONT PAS ÉCRITS ───────────────────
-- La source les mentionne le long du Kan et de la Marahoué, et les dit
-- favorables à la RIZICULTURE IRRIGUÉE. Les nommer dans un champ de
-- fiche tabac laisserait croire qu'ils portent le tabac. On ne garde
-- que le sol dominant.
--
-- Après cette migration :
--   php tools/contenu_dump.php
--   php tools/i18n_dump.php > sql/traductions.sql
-- ════════════════════════════════════════════════════════

UPDATE `producer_countries` SET
  `climate`    = 'Baouléen, tropical humide de transition — deux saisons des pluies, 1 000 à 1 400 mm',
  `climate_en` = 'Baoulé type, a humid tropical transition climate — two rainy seasons, 1,000 to 1,400 mm',
  `climate_es` = 'Tipo baulé, tropical húmedo de transición: dos estaciones de lluvias, de 1 000 a 1 400 mm',
  `climate_de` = 'Baoulé-Typ, feuchttropisches Übergangsklima — zwei Regenzeiten, 1 000 bis 1 400 mm',
  `climate_zh` = '巴乌莱型过渡性湿润热带气候：两个雨季，年降水 1 000 至 1 400 毫米',
  `climate_ar` = 'مناخ باوليه، مداري رطب انتقالي: موسمان مطيران، و1000 إلى 1400 مم سنويًا',

  `soil`    = 'Ferrallitique sur socle granitique du Bélier',
  `soil_en` = 'Ferrallitic over the granitic bedrock of the Bélier',
  `soil_es` = 'Ferralítico sobre el zócalo granítico del Bélier',
  `soil_de` = 'Ferrallitisch über dem Granitsockel des Bélier',
  `soil_zh` = '贝利耶花岗岩基底之上的铁铝土',
  `soil_ar` = 'تربة فيرالّيتية فوق القاعدة الغرانيتية في بيلييه',

  `updated_at` = NOW()
 WHERE `id` = 'ivorycoast';

-- ── Les sceaux, calculés depuis les colonnes ─────────────
INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'producer_countries', 'ivorycoast', c.champ, l.lang,
       SHA1(CASE c.champ WHEN 'climate' THEN p.`climate` ELSE p.`soil` END),
       'machine', NOW()
  FROM `producer_countries` p
  JOIN (SELECT 'climate' champ UNION ALL SELECT 'soil') c
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE p.`id` = 'ivorycoast'
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 166','systeme','trous_combles','pays',0,
   'climate et soil de la Cote d Ivoire, d apres Physio-Geo (OpenEdition, journals.openedition.org/physio-geo/4120), article portant sur un PERIMETRE DE LA REGION DU BELIER et non sur le pays en general : climat baouleen, tropical humide de transition, 1 000 a 1 400 mm en deux saisons ; substratum essentiellement granitique ; sols ferrallitiques'),
  (NULL,'migration 166','systeme','deduction_refusee','pays',0,
   'harvest RESTE VIDE. Le regime des pluies est documente — avril-juin et septembre-octobre — mais un calendrier de RECOLTE DU TABAC ne s en deduit pas : la date de coupe depend de la variete, de la conduite de la plante et du sechage. Ecrire « Avr - Juin » parce qu il pleut a ce moment-la serait la generalite deguisee en fait tabacole que ce chantier se refuse'),
  (NULL,'migration 166','systeme','mention_ecartee','pays',0,
   'la source mentionne aussi des gleysols hydromorphes le long du Kan et de la Marahoue, en les disant favorables a la RIZICULTURE IRRIGUEE. Les nommer dans un champ de fiche tabac laisserait croire qu ils portent le tabac : on ne garde que le sol dominant'),
  (NULL,'migration 166','systeme','trous_restants','pays',0,
   'il reste TROIS trous sur cinq : varieties, harvest et revenue. Les deux premiers, une question a Fagot les refermerait. Le troisieme restera probablement vide — la filiere est interieure et il n existe pas de ligne d exportation, cas deja connu des Canaries');
