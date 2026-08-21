-- ════════════════════════════════════════════════════════
-- 038 — Les feuilles ont droit à leur fiche, comme les marques
-- ────────────────────────────────────────────────────────
-- Six pays de cet atlas ne vendent pas de cigares : ils vendent de la
-- FEUILLE. La migration 036 l'a établi chiffres en main — Cameroun,
-- Équateur et Mexique n'exportent aucun cigare vers les États-Unis, et
-- il a fallu les mesurer au code HS 2401 pour dire quoi que ce soit de
-- leur métier.
--
-- Leurs fiches ne disaient pourtant de ce métier qu'une liste de noms
-- dans un encadré « Variétés ». Une maison a son histoire, sa gamme,
-- ses notes et ses accords ; la feuille qui l'habille n'avait rien.
--
-- ── UNE ERREUR DE MODÈLE, CORRIGÉE AU PASSAGE ───────────
--
-- `producer_countries.varieties` mélangeait des variétés et des
-- ATTRIBUTS. Le Cameroun listait « Sun-grown » et « Semence Sumatra »
-- comme deux entrées : ce ne sont pas deux feuilles, ce sont deux
-- caractères de la MÊME feuille — la cape camerounaise est de semence
-- sumatranaise ET cultivée en plein soleil.
--
-- C'est la migration 031 qui a écrit cette liste, en corrigeant une
-- autre erreur (« Cameroon Shade » pour un tabac de plein soleil). La
-- correction était juste sur le fond et fautive sur la forme : elle a
-- rangé un adjectif là où le champ attend un nom.
--
-- La table `feuilles` sépare les deux : un nom, et des caractères qui
-- le décrivent.
--
-- ── CE QUI N'EST PAS STOCKÉ ICI ─────────────────────────
--
-- La liste des cigares qui portent une feuille N'EST PAS une colonne.
-- Elle se dérive des entrées `cape: true` de la fiche pays, qui existent
-- déjà (migration 023). Une valeur qu'on peut dériver ne se stocke pas :
-- c'est une occasion de diverger, et le lot 2 en a retiré une pour
-- exactement cette raison (`producer_geo.coords`).
--
-- ── LE CONTENU VIENDRA PAR LOTS ─────────────────────────
--
-- Vingt-sept variétés × quatre champs de prose font une centaine de
-- textes. En écrire cent de mémoire recréerait la dette que six lots de
-- relecture viennent de solder.
--
-- Cette migration crée donc la table et n'y met QUE LE CAMEROUN, dont
-- les sources ont déjà été réunies au lot 5 : semence de Sumatra
-- apportée par les colons néerlandais, monopole SEITA jusqu'à son
-- retrait d'Afrique centrale en 1993, négoce Meerapfel depuis plus de
-- cent vingt ans, culture de plein soleil sur des terres qui ne
-- demandent pas d'engrais.
-- ════════════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS `feuilles` (
  `id`          varchar(60)  NOT NULL,
  `name`        varchar(100) NOT NULL,
  `country_id`  varchar(50)  NOT NULL,
  -- cape, sous-cape ou tripe : ce que la feuille sert à faire.
  -- « usage » est un mot reserve de MySQL : le nom francais evite
  -- d'avoir a le proteger dans chaque requete.
  `emploi`      varchar(40)  DEFAULT NULL,
  -- D'où elle vient, et par quelles mains elle est passée.
  `genese`      text         DEFAULT NULL,
  -- Comment elle pousse : ombre ou soleil, sol, altitude, récolte.
  `culture`     text         DEFAULT NULL,
  -- Ce qu'on voit et ce qu'on sent : grain, couleur, combustion, force.
  `caracteres`  text         DEFAULT NULL,
  -- Tableaux JSON, même convention que `brands.pairings`.
  `notes`       longtext     DEFAULT NULL,
  `pairings`    longtext     DEFAULT NULL,
  `created_at`  datetime     DEFAULT CURRENT_TIMESTAMP,
  `updated_at`  datetime     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `genese_en`     text DEFAULT NULL, `genese_es`     text DEFAULT NULL,
  `genese_de`     text DEFAULT NULL, `genese_zh`     text DEFAULT NULL,
  `genese_ar`     text DEFAULT NULL,
  `culture_en`    text DEFAULT NULL, `culture_es`    text DEFAULT NULL,
  `culture_de`    text DEFAULT NULL, `culture_zh`    text DEFAULT NULL,
  `culture_ar`    text DEFAULT NULL,
  `caracteres_en` text DEFAULT NULL, `caracteres_es` text DEFAULT NULL,
  `caracteres_de` text DEFAULT NULL, `caracteres_zh` text DEFAULT NULL,
  `caracteres_ar` text DEFAULT NULL,
  `notes_en`      longtext DEFAULT NULL, `notes_es`  longtext DEFAULT NULL,
  `notes_de`      longtext DEFAULT NULL, `notes_zh`  longtext DEFAULT NULL,
  `notes_ar`      longtext DEFAULT NULL,
  `pairings_en`   longtext DEFAULT NULL, `pairings_es` longtext DEFAULT NULL,
  `pairings_de`   longtext DEFAULT NULL, `pairings_zh` longtext DEFAULT NULL,
  `pairings_ar`   longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feuilles_pays` (`country_id`),
  CONSTRAINT `feuilles_ibfk_1` FOREIGN KEY (`country_id`)
    REFERENCES `producer_countries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ── Cameroun : une seule feuille, pas deux ──────────────

INSERT INTO `feuilles`
  (`id`, `name`, `country_id`, `emploi`, `genese`, `culture`, `caracteres`, `notes`, `pairings`)
VALUES (
  'cameroun-cape',
  'Cape du Cameroun',
  'cameroon',
  'Cape',
  'Des colons néerlandais apportent la semence de Sumatra en Afrique centrale au début du XXe siècle. Sous administration française, le monopole SEITA achète et exporte seul la récolte pendant des décennies, jusqu''à son retrait de la région en 1993. La maison M. Meerapfel & Söhne négocie cette feuille depuis plus de cent vingt ans, et on lui attribue de l''avoir sauvée de la disparition dans les années 1990.',
  'Cultivée en PLEIN SOLEIL — ce qui est rare pour une cape : la couverture nuageuse régulière de la saison rend les toiles d''ombrage inutiles. Les terres de la zone sont si riches qu''elles ne demandent pas d''engrais. La région à cape est à cheval sur l''est du Cameroun, autour de Batouri, et la Centrafrique voisine où se trouvent les usines de traitement.',
  'Feuille fine au grain marqué, recherchée autant pour sa rareté que pour son aspect. Elle habille des cigares roulés ailleurs — Honduras, République dominicaine, Nicaragua — auxquels elle donne sa signature plutôt que sa force.',
  '["Café","Cacao","Épices douces"]',
  '["Café noir serré","Rhum vieux","Chocolat noir"]'
);

-- La liste des variétés du pays disait deux attributs pour une feuille.
UPDATE `producer_countries`
   SET `varieties` = '["Cape du Cameroun"]'
 WHERE `id` = 'cameroon';
