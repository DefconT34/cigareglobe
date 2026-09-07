-- ════════════════════════════════════════════════════════
-- 177 — Un festival n'est pas une adresse
-- ────────────────────────────────────────────────────────
-- TROUVÉ EN TESTANT LA RÉPUBLIQUE DOMINICAINE. Le pays annonce quatre
-- établissements. Deux sont LE MÊME FESTIVAL, et le troisième porte le
-- nom de deux entreprises concurrentes.
--
--   #182  Arturo Fuente — Boutique Santiago     une vraie boutique
--   #183  ProCigar Festival                     un festival
--   #1572 ProCigar Festival — Santiago & La Romana  le MÊME festival
--   #1575 Altadis General Cigar — Casa de Campo  deux concurrents
--
-- ── 1. LE DOUBLON ────────────────────────────────────────
-- #183 et #1572 sont le même événement, importés à trois jours
-- d'écart — le 18 et le 21 mars. La contrainte `uq_country_name` ne
-- pouvait rien : les deux noms diffèrent.
--
-- ── 2. ET SURTOUT : CE N'EST PAS LE BON RÉPERTOIRE ───────
-- `lounges` porte des ADRESSES QU'ON PEUT VISITER — une cave, un salon,
-- une boutique. Un festival annuel n'a pas d'adresse permanente : il
-- n'existe qu'une semaine en février, et le reste de l'année sa fiche
-- envoie le lecteur nulle part. Sur le globe, il s'affiche comme un lieu.
--
-- L'ATLAS A DÉJÀ LE BON CHAMP, et il est rempli :
-- `habanos_presence.festival` porte « ProCigar Festival — chaque
-- février à Santiago (depuis 2006) » pour la République dominicaine,
-- « Festival del Habano — chaque février à La Havane (depuis 1999) »
-- pour Cuba, et une entrée pour chacun des treize pays qui en ont une.
-- Il est rendu sur la fiche de pays, dans les six langues.
--
-- Les fiches d'établissement ne faisaient donc que dupliquer une
-- information déjà servie, au mauvais endroit et sans traduction.
--
-- ── QUATRE FICHES, DANS TROIS PAYS ───────────────────────
-- Le défaut n'était pas dominicain : la même faute existe à Cuba
-- (#1566, Festival del Habano) et au Honduras (#184, Festival del
-- Cigarro de Danlí).
--
-- ⚠ AU HONDURAS, L'INFORMATION AURAIT ÉTÉ PERDUE. Son champ
-- `habanos_presence.festival` disait seulement « Salon de tabac —
-- intégré aux foires régionales d'Amérique Centrale », sans nommer
-- Danlí. On l'enrichit AVANT de retirer la fiche : retirer d'abord
-- aurait effacé le seul endroit où ce festival était nommé.
--
-- ── 3. « ALTADIS GENERAL CIGAR » N'EXISTE PAS ────────────
-- #1575 porte le nom de DEUX GROUPES CONCURRENTS collés l'un à l'autre.
-- Altadis fait ses cigares à la Tabacalera de García, dans la zone
-- franche de La Romana ; General Cigar est à Santiago. Ni l'un ni
-- l'autre ne s'appelle « Casa de Campo », qui est un complexe hôtelier.
--
-- La fiche n'est pas retirée : la source — le site du complexe — décrit
-- bien un salon de cigares. C'est le NOM qui est faux, et lui seul est
-- corrigé. La description perd la mention des manufactures.
--
-- ── 4. ET « DAVIDOFF MATASA », ENCORE ────────────────────
-- La description de #183 disait « Visites manufactures Arturo Fuente,
-- Davidoff MATASA » — la même erreur que la migration 176 vient de
-- corriger sur les fiches de marque. Davidoff sort de Tabadom, pas de
-- MATASA. Corrigée ici aussi, même si la fiche est retirée : elle reste
-- au dump versionné, et repartirait telle quelle le jour où quelqu'un
-- la rétablirait.
--
-- Après cette migration :
--   php tools/contenu_dump.php
--   php tools/i18n_dump.php > sql/traductions.sql
-- ════════════════════════════════════════════════════════

-- ── Le Honduras nomme son festival AVANT qu'on retire la fiche ──
UPDATE `habanos_presence` SET
  `festival`    = 'Festival del Cigarro de Danlí — annuel, et salons intégrés aux foires régionales d''Amérique centrale',
  `festival_en` = 'Festival del Cigarro de Danlí — annual, plus fairs within the regional Central American trade shows',
  `festival_es` = 'Festival del Cigarro de Danlí — anual, y salones integrados en las ferias regionales de Centroamérica',
  `festival_de` = 'Festival del Cigarro de Danlí — jährlich, dazu Messen im Rahmen der regionalen mittelamerikanischen Fachmessen',
  `festival_zh` = '丹利雪茄节（Festival del Cigarro de Danlí），每年举办；此外还有中美洲区域展会中的展区。',
  `festival_ar` = 'مهرجان السيجار في دانلي — سنوي، إضافة إلى أجنحة ضمن المعارض الإقليمية في أمريكا الوسطى'
 WHERE `country_id` = 'honduras';

-- ── La correction de prose, avant le retrait ─────────────
UPDATE `lounges`
   SET `description` = REPLACE(`description`, 'Davidoff MATASA', 'Davidoff Tabadom'),
       `updated_at` = NOW()
 WHERE `id` = 183;

-- ── Les quatre festivals quittent le répertoire d'adresses ──
UPDATE `lounges` SET
  `is_verified` = 0,
  `source`      = 'retiré — un festival n''est pas une adresse ; l''information vit dans habanos_presence.festival',
  `updated_at`  = NOW()
 WHERE `id` IN (183, 1572, 1566, 184);

-- ── Casa de Campo reprend son nom ────────────────────────
UPDATE `lounges` SET
  `name`  = 'Casa de Campo — Salon de cigares',
  `type`  = 'Resort Cigar Lounge',
  `description` = 'Salon de cigares du complexe de Casa de Campo, à La Romana, face au terrain de polo. Dégustation sur place.',
  `description_en` = 'The cigar lounge of the Casa de Campo resort, in La Romana, facing the polo field. Tasting on site.',
  `description_es` = 'Salón de puros del complejo de Casa de Campo, en La Romana, frente al campo de polo. Degustación in situ.',
  `description_de` = 'Die Zigarrenlounge des Resorts Casa de Campo in La Romana, mit Blick auf das Polofeld. Verkostung vor Ort.',
  `description_zh` = '拉罗马纳 Casa de Campo 度假村的雪茄厅，正对马球场，可在现场品鉴。',
  `description_ar` = 'صالة السيجار في منتجع كاسا دي كامبو بلا رومانا، المطلّة على ملعب البولو، مع تذوّق في المكان.',
  `updated_at` = NOW()
 WHERE `id` = 1575;

-- ── Les sceaux, recalculés depuis les colonnes ───────────
UPDATE `translation_status` t
  JOIN `lounges` l ON l.`id` = t.`entite_id`
   SET t.`source_hash` = SHA1(l.`description`), t.`statut` = 'machine', t.`maj` = NOW()
 WHERE t.`entite` = 'lounges' AND t.`champ` = 'description'
   AND t.`entite_id` IN ('183', '1575');

UPDATE `translation_status` t
  JOIN `habanos_presence` h ON h.`country_id` = t.`entite_id`
   SET t.`source_hash` = SHA1(h.`festival`), t.`statut` = 'machine', t.`maj` = NOW()
 WHERE t.`entite` = 'habanos_presence' AND t.`champ` = 'festival' AND t.`entite_id` = 'honduras';

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 177','systeme','doublon_retire','lounge',1572,
   '#183 et #1572 sont LE MEME festival ProCigar, importes a trois jours d ecart — le 18 et le 21 mars. La contrainte uq_country_name ne pouvait rien : les deux noms different'),
  (NULL,'migration 177','systeme','mauvais_repertoire','lounge',0,
   'QUATRE FESTIVALS ETAIENT PUBLIES DANS `lounges`, dans trois pays : #183 et #1572 (ProCigar, Rep. dominicaine), #1566 (Festival del Habano, Cuba), #184 (Festival del Cigarro de Danli, Honduras). `lounges` porte des ADRESSES QU ON PEUT VISITER ; un festival annuel n a pas d adresse permanente, n existe qu une semaine en fevrier, et s affiche pourtant sur le globe comme un lieu'),
  (NULL,'migration 177','systeme','information_deja_servie','systeme',0,
   'L ATLAS A DEJA LE BON CHAMP ET IL EST REMPLI : habanos_presence.festival porte « ProCigar Festival — chaque fevrier a Santiago (depuis 2006) », « Festival del Habano — chaque fevrier a La Havane (depuis 1999) », et une entree pour chacun des treize pays qui en ont une. Il est rendu sur la fiche de pays DANS LES SIX LANGUES. Les fiches d etablissement ne faisaient que dupliquer, au mauvais endroit et sans traduction'),
  (NULL,'migration 177','systeme','information_sauvee_avant_retrait','pays',0,
   'AU HONDURAS L INFORMATION AURAIT ETE PERDUE : son champ festival disait seulement « Salon de tabac — integre aux foires regionales d Amerique Centrale », sans nommer Danli. Il est enrichi AVANT le retrait de la fiche. Retirer d abord aurait efface le seul endroit ou ce festival etait nomme'),
  (NULL,'migration 177','systeme','nom_corrige','lounge',1575,
   '« Altadis General Cigar — Casa de Campo » collait le nom de DEUX GROUPES CONCURRENTS. Altadis fait ses cigares a la Tabacalera de Garcia dans la zone franche de La Romana, General Cigar est a Santiago, et ni l un ni l autre ne s appelle Casa de Campo — qui est un complexe hotelier. La fiche n est PAS retiree : la source decrit bien un salon de cigares. C est le nom qui etait faux'),
  (NULL,'migration 177','systeme','erreur_matasa_dans_lounges','lounge',183,
   'la description de #183 disait « Visites manufactures Arturo Fuente, Davidoff MATASA » — la meme erreur que la migration 176 vient de corriger sur les fiches de marque. Corrigee ici aussi bien que la fiche soit retiree : elle reste au dump versionne et repartirait telle quelle si quelqu un la retablissait');
