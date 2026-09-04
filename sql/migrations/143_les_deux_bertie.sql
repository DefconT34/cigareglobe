-- ════════════════════════════════════════════════════════
-- 143 — Bertie : une fiche fausse à Hong Kong, une absente à Phnom Penh
-- ────────────────────────────────────────────────────────
-- D'OÙ VIENT CE CHANTIER. Un tiers a regardé l'atlas et signalé deux
-- choses : que la fiche de Bertie Hong Kong portait une mauvaise
-- adresse, et que celle de Phnom Penh manquait. Un signalement n'est
-- pas une source : les deux établissements ont leur propre site, et
-- c'est là que tout ce qui suit a été relevé — bertie-hk.com et
-- bertie-pnh.com, l'un et l'autre consultés.
--
-- ── #385 ÉTAIT UN COMPOSITE ──────────────────────────────
-- La fiche disait :
--
--   « Bertie's — The Fleming Hotel »
--   Hong Kong — The Fleming Hotel, 41 Fleming Road, Wan Chai
--   +852 3607 2288
--   « Lounge cigares raffiné de l'hôtel The Fleming à Wan Chai »
--
-- Bertie est à CENTRAL, au quatrième étage de Duke Wellington House,
-- 14-24 Wellington Street, et son téléphone est le +852 2619 9418.
-- L'adresse et le numéro portés par la fiche sont ceux de l'hôtel The
-- Fleming, à Wan Chai — un autre quartier, un autre établissement.
--
-- Le nom d'un lounge posé sur les coordonnées d'un hôtel sans rapport :
-- c'est exactement la forme de l'erreur d'Olivos Golf Club (migration
-- 142). Elle ne se voit pas à la lecture — tout y est plausible.
--
-- ── LA FICHE ÉTAIT DÉJÀ SIGNALÉE, ET PERSONNE N'A REGARDÉ ─
-- La source de #385 était `thefleming.com.hk`, un des vingt-huit
-- domaines inexistants relevés la veille par `tools/sources.php`. Le
-- contrôle avait donc DÉJÀ dit que cette fiche n'était pas traçable.
-- Il a fallu qu'un humain connaissant l'endroit le dise pour qu'on
-- aille voir.
--
-- C'est la mesure de ce que l'audit sait faire et de ce qu'il ne sait
-- pas : il repère les fiches sur lesquelles on ne peut pas s'appuyer,
-- il ne dit pas ce qu'elles devraient dire. Les vingt-sept autres
-- attendent le même travail.
--
-- ── ON CORRIGE, ON NE RETIRE PAS ─────────────────────────
-- Contrairement à Olivos, on sait ici de quel établissement la fiche
-- parle : son NOM était juste. Corriger en place garde l'identifiant,
-- donc l'adresse publique /cave/385-… déjà indexée, et les cinq
-- traductions attachées.
--
-- ── LES SIX TEXTES CHANGENT ENSEMBLE ─────────────────────
-- `translation_status` scelle chaque traduction par le SHA1 de sa
-- source française. Corriger le français seul laisserait cinq lignes
-- prétendant traduire un texte disparu — et le site servirait cinq
-- fois une adresse fausse, dans cinq langues. Le sceau est recalculé
-- DEPUIS LA COLONNE, jamais recopié à la main (leçon de la 140).
--
-- Le statut reste « machine » : ces traductions n'ont pas été relues
-- par un humain, et prétendre le contraire fausserait le seul compteur
-- qui dit où en est la relecture.
--
-- ── CE QU'ON NE MET PAS ──────────────────────────────────
-- `lat` / `lon` restent nuls. Placer un point sur un globe demande des
-- coordonnées, pas une adresse et un souvenir de carte : les inventer
-- au degré près mettrait les deux lounges dans la mauvaise rue avec
-- l'aplomb du chiffre. `completude` les comptera manquants, ce qui est
-- la réponse juste.
--
-- `price` reste nul pour la même raison : aucun des deux sites ne
-- l'annonce.
--
-- La distinction « meilleur lounge d'Asie » que Bertie HK affiche
-- n'est pas reprise : c'est un rang, il vient de l'établissement
-- lui-même, et la campagne vérifie qu'aucune fiche n'affirme un rang
-- que sa source ne fait pas.
--
-- Après cette migration :
--   php tools/contenu_dump.php
--   php tools/sources.php --figer      (deux domaines cités nouveaux)
--   php tools/i18n_dump.php > sql/traductions.sql
-- ════════════════════════════════════════════════════════

-- ── Hong Kong : la fiche rendue à son établissement ──────
UPDATE `lounges` SET
  `name`    = 'Bertie HK',
  `city`    = 'Hong Kong — Duke Wellington House, 14-24 Wellington Street, 4/F, Central',
  `type`    = 'Habanos Specialist',
  `phone`   = '+852 2619 9418',
  `website` = 'https://www.bertie-hk.com/',
  `hours`   = 'Lun–Sam 12h–0h · Dim 14h–22h',
  `source`  = 'bertie-hk.com',

  `description`    = 'Salon de cigares de Central, au quatrième étage de Duke Wellington House, à l''entrée de Lan Kwai Fong. Humidor climatisé avec casiers de membres, salon principal, salon privé et terrasse couverte.',

  `description_en` = 'Cigar lounge in Central, on the fourth floor of Duke Wellington House, at the entrance to Lan Kwai Fong. Climate-controlled walk-in humidor with member lockers, main lounge, private room and covered terrace.',

  `description_es` = 'Salón de puros en Central, en la cuarta planta de Duke Wellington House, a la entrada de Lan Kwai Fong. Humidor climatizado con casilleros para socios, salón principal, sala privada y terraza cubierta.',

  `description_de` = 'Zigarrenlounge in Central, im vierten Stock des Duke Wellington House, am Eingang von Lan Kwai Fong. Klimatisierter begehbarer Humidor mit Mitgliederfächern, Hauptlounge, Separee und überdachte Terrasse.',

  `description_zh` = '位于中环威灵顿街公爵大厦四楼的雪茄吧，紧邻兰桂坊入口。设有恒温恒湿步入式雪茄柜与会员储柜、主厅、私人包厢及有盖露台。',

  `description_ar` = 'صالة سيجار في حي سنترال، في الطابق الرابع من مبنى ديوك ولينغتون، عند مدخل لان كواي فونغ. مستودع ترطيب مكيّف مع خزائن للأعضاء، وصالة رئيسية، وغرفة خاصة، وشرفة مسقوفة.',

  `updated_at` = NOW()
 WHERE `id` = 385 AND `country_id` = 'hongkong';

-- Le sceau, recalculé depuis la colonne elle-même.
UPDATE `translation_status`
   SET `source_hash` = (SELECT SHA1(`description`) FROM `lounges` WHERE `id` = 385),
       `statut`      = 'machine',
       `maj`         = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '385' AND `champ` = 'description';

-- ── Phnom Penh : la fiche qui manquait ───────────────────
INSERT INTO `lounges`
  (`country_id`, `name`, `city`, `type`, `phone`, `hours`, `website`,
   `source`, `is_verified`,
   `description`, `description_en`, `description_es`,
   `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
VALUES (
  'cambodia',
  'Bertie Phnom Penh',
  'Phnom Penh — House 16, Street 13, Village 9, Sangkat Wat Phnom, Khan Daun Penh',
  'Cave & Lounge',
  '+855 10 567 825',
  'Lun–Sam 12h–0h · Dim 14h–0h',
  'https://www.bertie-pnh.com/',
  'bertie-pnh.com',
  1,

  'Salon de cigares du quartier de Wat Phnom, face à la poste centrale. Humidor climatisé, salon principal, salon privé et mezzanine ; carte de vins et spiritueux composée pour les accords.',

  'Cigar lounge in the Wat Phnom district, opposite the central post office. Climate-controlled walk-in humidor, main lounge, private room and mezzanine; wine and spirits list put together for pairings.',

  'Salón de puros en el barrio de Wat Phnom, frente a la oficina central de correos. Humidor climatizado, salón principal, sala privada y entreplanta; carta de vinos y destilados compuesta para los maridajes.',

  'Zigarrenlounge im Viertel Wat Phnom, gegenüber der Hauptpost. Klimatisierter begehbarer Humidor, Hauptlounge, Separee und Zwischengeschoss; Wein- und Spirituosenkarte für Pairings zusammengestellt.',

  '位于洼弄区的雪茄吧，与中央邮局相对。设有恒温恒湿步入式雪茄柜、主厅、私人包厢及夹层；酒单为搭配雪茄而设。',

  'صالة سيجار في حي وات فنوم، مقابل مكتب البريد المركزي. مستودع ترطيب مكيّف، وصالة رئيسية، وغرفة خاصة، وطابق معلّق؛ وقائمة نبيذ ومشروبات روحية أُعدّت للمزاوجة.',

  NOW(), NOW()
);

SET @bertie_pnh = LAST_INSERT_ID();

-- Les cinq sceaux de la nouvelle fiche, calculés depuis la colonne.
INSERT INTO `translation_status`
  (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'lounges', @bertie_pnh, 'description', l.`lang`,
       (SELECT SHA1(`description`) FROM `lounges` WHERE `id` = @bertie_pnh),
       'machine', NOW()
  FROM (SELECT 'en' AS `lang` UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') AS l;

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL, 'migration 143', 'systeme', 'fiche_corrigee', 'lounge', 385,
   'Bertie etait a Central, la fiche portait l adresse et le telephone de l hotel The Fleming a Wan Chai ; source bertie-hk.com'),
  (NULL, 'migration 143', 'systeme', 'fiche_ajoutee', 'lounge', 0,
   'Bertie Phnom Penh (Cambodge) manquait a l atlas ; source bertie-pnh.com');
