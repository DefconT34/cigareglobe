-- ════════════════════════════════════════════════════════
-- 175 — Fonseca a changé de famille et de pays
-- ────────────────────────────────────────────────────────
-- UNE ERREUR DE LA MIGRATION 173, TROUVÉE EN RECENSANT LES MAISONS
-- ABSENTES. La fiche « Fonseca Dominicain » dit que le cigare est fait
-- par MATASA, à Santiago de los Caballeros, et se termine sur ce qui en
-- faisait l'intérêt : « le seul des cas non cubains de cet atlas à ne
-- dépendre ni d'Altadis ni de General Cigar, mais d'une famille
-- dominicaine ».
--
-- C'EST FAUX DEPUIS DÉCEMBRE 2019. La famille García a repris la marque
-- à cette date ; elle se roule depuis chez My Father Cigars, à Estelí,
-- au Nicaragua. La famille Quesada l'avait fabriquée pendant
-- quarante-cinq ans.
-- Source : cigaraficionado.com, fiche « Fonseca (Non-Cuban) ».
--
-- ── D'OÙ VIENT L'ERREUR ──────────────────────────────────
-- De la liste des marques de Wikipédia, qui porte encore « Fonseca —
-- 1. Habanos S.A. ; 2. MATASA — non-Cuban made in the Dominican
-- Republic ». C'était vrai pendant quarante-cinq ans.
--
-- C'est exactement ce que la migration 172 vient de nommer : un fait
-- daté ne se démode pas d'un coup, il reste juste puis devient faux
-- sans rien changer à sa forme. Je l'ai écrit ce matin dans un journal
-- de modération, et je suis tombé dedans le même jour. La leçon n'est
-- donc pas « se méfier de Wikipédia » : c'est que TOUTE affirmation de
-- propriété doit être datée, et recoupée sur une source qui se met à
-- jour.
--
-- ── CE QUE ÇA CHANGE ─────────────────────────────────────
-- Le nom, le pays, l'usine et l'histoire. La fiche passe de
-- `dominican` à `nicaragua`, et son adresse de /marque/fonseca-dominicain
-- à /marque/fonseca-nicaraguayen. L'ancienne rendra un 404 — elle avait
-- moins d'un jour, et un 404 vaut mieux qu'une fiche qui ment.
--
-- Les deux fiches de pays doivent suivre : `producer_countries.brands`
-- perd l'entrée côté dominicain et la gagne côté nicaraguayen, sans quoi
-- coherence_check refuse — une maison que son pays n'annonce pas reste
-- invisible depuis le globe.
--
-- ── ET L'HISTOIRE Y GAGNE ────────────────────────────────
-- Le récit est meilleur que celui qu'il remplace : une marque qui
-- change de famille et de pays après quarante-cinq ans, avec DEUX
-- renvois internes — la maison Quesada et la maison My Father, que
-- l'atlas porte toutes les deux.
--
-- Après cette migration :
--   php tools/contenu_dump.php
--   php tools/i18n_dump.php > sql/traductions.sql
-- ════════════════════════════════════════════════════════

UPDATE `brands` SET
  `name`       = 'Fonseca Nicaraguayen',
  `country_id` = 'nicaragua',
  `founded`    = '2019 — Nicaragua (My Father Cigars)',
  `factory`    = 'My Father Cigars, Estelí, Nicaragua',

  `history` = 'Le Fonseca cubain et son homonyme non cubain portent le même nom sans partager de propriétaire — mais celui-ci a changé de famille et de pays.

La famille Quesada l''a fabriqué pendant quarante-cinq ans dans sa manufacture MATASA, à Santiago de los Caballeros, en République dominicaine. L''atlas porte la maison Quesada sous son propre nom.

En décembre 2019, la famille García l''a repris. Il se roule depuis chez My Father Cigars, à Estelí, au Nicaragua — la maison que l''atlas porte sous le nom My Father.',

  `history_en` = 'The Cuban Fonseca and its non-Cuban namesake share a name without sharing an owner — but this one has changed family and country.

The Quesada family made it for forty-five years at their MATASA factory in Santiago de los Caballeros, in the Dominican Republic. This atlas holds the Quesada house under its own name.

In December 2019 the García family took it over. It has been rolled since at My Father Cigars in Estelí, Nicaragua — the house this atlas holds under the name My Father.',

  `history_es` = 'El Fonseca cubano y su homónimo no cubano llevan el mismo nombre sin compartir propietario, pero este ha cambiado de familia y de país.

La familia Quesada lo fabricó durante cuarenta y cinco años en su manufactura MATASA, en Santiago de los Caballeros, en la República Dominicana. Este atlas recoge la casa Quesada con su propio nombre.

En diciembre de 2019 la familia García lo retomó. Se lía desde entonces en My Father Cigars, en Estelí, Nicaragua: la casa que este atlas recoge con el nombre My Father.',

  `history_de` = 'Der kubanische Fonseca und sein nicht-kubanischer Namensvetter teilen den Namen, nicht den Eigentümer — doch dieser hat Familie und Land gewechselt.

Die Familie Quesada fertigte ihn fünfundvierzig Jahre lang in ihrer Manufaktur MATASA in Santiago de los Caballeros, in der Dominikanischen Republik. Dieser Atlas führt das Haus Quesada unter eigenem Namen.

Im Dezember 2019 übernahm ihn die Familie García. Seither wird er bei My Father Cigars in Estelí, Nicaragua, gerollt — dem Haus, das dieser Atlas unter dem Namen My Father führt.',

  `history_zh` = '古巴版 Fonseca 与其非古巴同名品牌同名而不同主——而后者已易主，也换了国家。

克萨达家族在其位于多米尼加共和国圣地亚哥-德洛斯卡瓦耶罗斯的 MATASA 工厂生产了它四十五年。本图集以其本名收录克萨达这一品牌。

2019 年 12 月，加西亚家族接手。此后它在尼加拉瓜埃斯特利的 My Father Cigars 卷制——即本图集以 My Father 之名收录的品牌。',

  `history_ar` = 'يحمل فونسيكا الكوبي ونظيره غير الكوبي الاسم نفسه دون أن يجمعهما مالك — غير أنّ هذا الأخير غيّر عائلته وبلده.

فقد صنعته عائلة كيسادا خمسة وأربعين عامًا في مصنعها MATASA بسانتياغو دي لوس كاباييروس في جمهورية الدومينيكان. ويضمّ هذا الأطلس دار كيسادا باسمها.

وفي ديسمبر 2019 تسلّمته عائلة غارسيا، فصار يُلفّ لدى My Father Cigars في إستيلي بنيكاراغوا — وهي الدار التي يضمّها هذا الأطلس باسم My Father.',

  `updated_at` = NOW()
 WHERE `name` = 'Fonseca Dominicain';

-- ── Les deux fiches de pays suivent ──────────────────────
UPDATE `producer_countries`
   SET `brands` = JSON_REMOVE(`brands`,
         JSON_UNQUOTE(JSON_SEARCH(`brands`, 'one', 'Fonseca Dominicain', NULL, '$[*].name'))),
       `updated_at` = NOW()
 WHERE `id` = 'dominican'
   AND JSON_SEARCH(`brands`, 'one', 'Fonseca Dominicain') IS NOT NULL;

UPDATE `producer_countries`
   SET `brands` = JSON_ARRAY_APPEND(`brands`, '$',
         JSON_OBJECT('name', 'Fonseca Nicaraguayen',
                     'desc', 'Repris par la famille García en décembre 2019, après quarante-cinq ans chez Quesada',
                     'iconic', FALSE)),
       `updated_at` = NOW()
 WHERE `id` = 'nicaragua'
   AND JSON_SEARCH(`brands`, 'one', 'Fonseca Nicaraguayen') IS NULL;

-- ── Le sceau suit le nom ─────────────────────────────────
UPDATE `translation_status`
   SET `entite_id` = 'Fonseca Nicaraguayen'
 WHERE `entite` = 'brands' AND `entite_id` = 'Fonseca Dominicain';

UPDATE `translation_status` t
  JOIN `brands` b ON b.`name` = t.`entite_id`
   SET t.`source_hash` = SHA1(CASE t.`champ` WHEN 'history' THEN b.`history` ELSE b.`gamme` END),
       t.`statut` = 'machine', t.`maj` = NOW()
 WHERE t.`entite` = 'brands' AND t.`entite_id` = 'Fonseca Nicaraguayen';

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 175','systeme','fiche_corrigee','marque',0,
   'la fiche « Fonseca Dominicain », posee le jour meme par la migration 173, disait que le cigare est fait par MATASA en Republique dominicaine. FAUX DEPUIS DECEMBRE 2019 : la famille Garcia a repris la marque a cette date, et elle se roule depuis chez My Father Cigars a Esteli, au Nicaragua. La famille Quesada l avait fabriquee pendant quarante-cinq ans. Source : cigaraficionado.com'),
  (NULL,'migration 175','systeme','source_perimee','systeme',0,
   'l erreur vient de la liste des marques de Wikipedia, qui porte encore « Fonseca — MATASA — non-Cuban made in the Dominican Republic ». C etait vrai pendant quarante-cinq ans. C est exactement ce que la migration 172 venait de nommer — un fait date reste juste puis devient faux sans changer de forme — et j y suis tombe LE MEME JOUR. La lecon n est pas « se mefier de Wikipedia » mais : toute affirmation de propriete doit etre datee et recoupee sur une source qui se met a jour'),
  (NULL,'migration 175','systeme','adresse_changee','marque',0,
   '/marque/fonseca-dominicain rend desormais un 404 : la fiche passe a /marque/fonseca-nicaraguayen. Elle avait moins d un jour, et un 404 vaut mieux qu une fiche qui ment');
