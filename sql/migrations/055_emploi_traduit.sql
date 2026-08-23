-- ════════════════════════════════════════════════════════
-- 055 — L'emploi de la feuille, dans les six langues
-- ────────────────────────────────────────────────────────
-- Le sous-titre de chaque fiche de feuille — « Cape », « Tripe et
-- sous-cape » — s'affichait en FRANÇAIS dans les six langues. Un
-- lecteur chinois ou arabe lisait donc le seul mot de la fiche qui dit
-- à quoi la feuille sert, dans une langue qu'il n'a pas demandée.
--
-- ── POURQUOI IL AVAIT ÉTÉ OUBLIÉ ────────────────────────
--
-- `emploi` n'est pas de la prose : c'est un vocabulaire fermé de neuf
-- valeurs. Il ne ressemblait donc à aucun des champs que le plan de
-- traduction listait, et personne ne l'y a jamais mis. Le compteur de
-- `i18n_fraicheur` annonçait 100 % — ce qui était vrai des champs
-- DÉCLARÉS, et ne disait rien de celui qui ne l'était pas.
--
-- C'est le même défaut que les fiches de feuilles injoignables de la
-- migration 048 : un champ absent du périmètre n'est pas signalé comme
-- manquant, il est simplement invisible.
--
-- ── POURQUOI DES COLONNES PLUTÔT QUE DES CLÉS DE FRONT ──
--
-- Neuf valeurs tiendraient dans `assets/js/i18n.js`. Mais il faudrait
-- alors un contrôle qui refuse toute dixième valeur saisie plus tard —
-- sans lui, elle s'afficherait en français sans que rien ne le dise, et
-- on aurait reconstruit le défaut qu'on corrige.
--
-- Les colonnes traduites, elles, sont déjà surveillées : il suffit de
-- déclarer `emploi` dans les deux plans (backend/data.php et
-- tools/i18n_contenu_plan.php) pour que i18n_fraicheur, i18n_contenu,
-- le dump et la campagne le prennent en charge. Une valeur nouvelle
-- apparaîtra comme « manquante », ce qui est exactement le
-- comportement voulu.
--
-- ── NOTE D'APPLICATION ──────────────────────────────────
--
-- Ces colonnes existent déjà dans la base de développement : un
-- chantier parallèle les y avait créées sans que la migration
-- correspondante n'atteigne le dépôt. L'ALTER ci-dessous est donc
-- volontairement écrit pour une base NEUVE — c'est lui qui fait foi.
-- Sur une base qui les porte déjà, il échouera avec « Duplicate
-- column », et c'est sans conséquence.
-- ════════════════════════════════════════════════════════

ALTER TABLE `feuilles`
  ADD COLUMN `emploi_en` varchar(80) DEFAULT NULL AFTER `emploi`,
  ADD COLUMN `emploi_es` varchar(80) DEFAULT NULL AFTER `emploi_en`,
  ADD COLUMN `emploi_de` varchar(80) DEFAULT NULL AFTER `emploi_es`,
  ADD COLUMN `emploi_zh` varchar(80) DEFAULT NULL AFTER `emploi_de`,
  ADD COLUMN `emploi_ar` varchar(80) DEFAULT NULL AFTER `emploi_zh`;

-- ── Le vocabulaire du métier, dans les cinq langues ──────
--
-- Ce ne sont pas des mots courants : chaque langue du cigare a ses
-- termes propres, et les traduire littéralement les rendrait faux.
-- « Sous-cape » n'est pas « sous-couverture » mais binder / capote /
-- Umblatt / 茄套 / رابط.

UPDATE `feuilles` SET
  `emploi_en` = 'Wrapper', `emploi_es` = 'Capa',
  `emploi_de` = 'Deckblatt', `emploi_zh` = '茄衣', `emploi_ar` = 'غلاف'
WHERE `emploi` = 'Cape';

UPDATE `feuilles` SET
  `emploi_en` = 'Wrapper and filler', `emploi_es` = 'Capa y tripa',
  `emploi_de` = 'Deckblatt und Einlage', `emploi_zh` = '茄衣与茄芯',
  `emploi_ar` = 'غلاف وحشوة'
WHERE `emploi` = 'Cape et tripe';

UPDATE `feuilles` SET
  `emploi_en` = 'Maduro wrapper', `emploi_es` = 'Capa maduro',
  `emploi_de` = 'Maduro-Deckblatt', `emploi_zh` = '马杜罗茄衣',
  `emploi_ar` = 'غلاف مادورو'
WHERE `emploi` = 'Cape maduro';

UPDATE `feuilles` SET
  `emploi_en` = 'Maduro wrapper and binder', `emploi_es` = 'Capa maduro y capote',
  `emploi_de` = 'Maduro-Deckblatt und Umblatt', `emploi_zh` = '马杜罗茄衣与茄套',
  `emploi_ar` = 'غلاف مادورو ورابط'
WHERE `emploi` = 'Cape maduro et sous-cape';

UPDATE `feuilles` SET
  `emploi_en` = 'Wrapper, binder and filler', `emploi_es` = 'Capa, capote y tripa',
  `emploi_de` = 'Deckblatt, Umblatt und Einlage', `emploi_zh` = '茄衣、茄套与茄芯',
  `emploi_ar` = 'غلاف ورابط وحشوة'
WHERE `emploi` = 'Cape, sous-cape et tripe';

UPDATE `feuilles` SET
  `emploi_en` = 'Binder', `emploi_es` = 'Capote',
  `emploi_de` = 'Umblatt', `emploi_zh` = '茄套', `emploi_ar` = 'رابط'
WHERE `emploi` = 'Sous-cape';

UPDATE `feuilles` SET
  `emploi_en` = 'Binder and filler', `emploi_es` = 'Capote y tripa',
  `emploi_de` = 'Umblatt und Einlage', `emploi_zh` = '茄套与茄芯',
  `emploi_ar` = 'رابط وحشوة'
WHERE `emploi` = 'Sous-cape et tripe';

UPDATE `feuilles` SET
  `emploi_en` = 'Filler', `emploi_es` = 'Tripa',
  `emploi_de` = 'Einlage', `emploi_zh` = '茄芯', `emploi_ar` = 'حشوة'
WHERE `emploi` = 'Tripe';

UPDATE `feuilles` SET
  `emploi_en` = 'Filler and binder', `emploi_es` = 'Tripa y capote',
  `emploi_de` = 'Einlage und Umblatt', `emploi_zh` = '茄芯与茄套',
  `emploi_ar` = 'حشوة ورابط'
WHERE `emploi` = 'Tripe et sous-cape';
