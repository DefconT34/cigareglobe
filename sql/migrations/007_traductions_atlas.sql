-- ═══════════════════════════════════════════════════════════════════
-- Migration 007 — Colonnes de traduction du contenu de l'atlas
-- ───────────────────────────────────────────────────────────────────
-- Quatre tables affichaient du texte francais quelle que soit la langue
-- choisie, faute de colonnes de traduction : les fiches pays, les
-- marches, les zones de production et la presence Habanos.
--
-- Ne sont dupliquees que les colonnes REELLEMENT traduisibles. Restent
-- volontairement uniques :
--   - les identifiants, drapeaux et couleurs ;
--   - les valeurs chiffrees ou nominales (revenue, founded, hq, ceo,
--     employees, share) — un montant ou un nom propre ne se traduit pas ;
--   - producer_countries.name et markets.name : ce sont des noms de
--     pays, que le front obtient dans les six langues par
--     Intl.DisplayNames a partir du code ISO. Les stocker serait 93
--     lignes a maintenir pour rien.
--
-- `brands.notes_en/_es/_de/_zh/_ar` sont supprimees : cinq colonnes
-- vides, sans colonne source `notes` en francais, jamais alimentees —
-- et pourtant interrogees par data.php. Ce sont des colonnes mortes.
--
-- Les colonnes ajoutees sont NULL par defaut : data.php retombe sur le
-- francais tant qu'une traduction manque, ce qui permet de remplir le
-- contenu progressivement (lot F4, voir docs/i18n.md).
-- ═══════════════════════════════════════════════════════════════════

-- ── producer_countries ─────────────────────────────────────────────
ALTER TABLE producer_countries
  ADD COLUMN region_en      VARCHAR(200) NULL, ADD COLUMN region_es      VARCHAR(200) NULL,
  ADD COLUMN region_de      VARCHAR(200) NULL, ADD COLUMN region_zh      VARCHAR(200) NULL,
  ADD COLUMN region_ar      VARCHAR(200) NULL,
  ADD COLUMN production_en  VARCHAR(200) NULL, ADD COLUMN production_es  VARCHAR(200) NULL,
  ADD COLUMN production_de  VARCHAR(200) NULL, ADD COLUMN production_zh  VARCHAR(200) NULL,
  ADD COLUMN production_ar  VARCHAR(200) NULL,
  ADD COLUMN rev_detail_en  VARCHAR(200) NULL, ADD COLUMN rev_detail_es  VARCHAR(200) NULL,
  ADD COLUMN rev_detail_de  VARCHAR(200) NULL, ADD COLUMN rev_detail_zh  VARCHAR(200) NULL,
  ADD COLUMN rev_detail_ar  VARCHAR(200) NULL,
  ADD COLUMN harvest_en     VARCHAR(200) NULL, ADD COLUMN harvest_es     VARCHAR(200) NULL,
  ADD COLUMN harvest_de     VARCHAR(200) NULL, ADD COLUMN harvest_zh     VARCHAR(200) NULL,
  ADD COLUMN harvest_ar     VARCHAR(200) NULL,
  ADD COLUMN climate_en     VARCHAR(200) NULL, ADD COLUMN climate_es     VARCHAR(200) NULL,
  ADD COLUMN climate_de     VARCHAR(200) NULL, ADD COLUMN climate_zh     VARCHAR(200) NULL,
  ADD COLUMN climate_ar     VARCHAR(200) NULL,
  ADD COLUMN soil_en        VARCHAR(200) NULL, ADD COLUMN soil_es        VARCHAR(200) NULL,
  ADD COLUMN soil_de        VARCHAR(200) NULL, ADD COLUMN soil_zh        VARCHAR(200) NULL,
  ADD COLUMN soil_ar        VARCHAR(200) NULL,
  ADD COLUMN notes_en       TEXT NULL,         ADD COLUMN notes_es       TEXT NULL,
  ADD COLUMN notes_de       TEXT NULL,         ADD COLUMN notes_zh       TEXT NULL,
  ADD COLUMN notes_ar       TEXT NULL;

-- ── markets ────────────────────────────────────────────────────────
ALTER TABLE markets
  ADD COLUMN consumption_en VARCHAR(200) NULL, ADD COLUMN consumption_es VARCHAR(200) NULL,
  ADD COLUMN consumption_de VARCHAR(200) NULL, ADD COLUMN consumption_zh VARCHAR(200) NULL,
  ADD COLUMN consumption_ar VARCHAR(200) NULL,
  ADD COLUMN cigars_en      VARCHAR(200) NULL, ADD COLUMN cigars_es      VARCHAR(200) NULL,
  ADD COLUMN cigars_de      VARCHAR(200) NULL, ADD COLUMN cigars_zh      VARCHAR(200) NULL,
  ADD COLUMN cigars_ar      VARCHAR(200) NULL,
  ADD COLUMN trend_en       VARCHAR(200) NULL, ADD COLUMN trend_es       VARCHAR(200) NULL,
  ADD COLUMN trend_de       VARCHAR(200) NULL, ADD COLUMN trend_zh       VARCHAR(200) NULL,
  ADD COLUMN trend_ar       VARCHAR(200) NULL,
  ADD COLUMN note_en        TEXT NULL,         ADD COLUMN note_es        TEXT NULL,
  ADD COLUMN note_de        TEXT NULL,         ADD COLUMN note_zh        TEXT NULL,
  ADD COLUMN note_ar        TEXT NULL;

-- ── production_zones ───────────────────────────────────────────────
-- `name` est un toponyme (Vuelta Abajo, Jamastran) : non traduit.
ALTER TABLE production_zones
  ADD COLUMN note_en TEXT NULL, ADD COLUMN note_es TEXT NULL,
  ADD COLUMN note_de TEXT NULL, ADD COLUMN note_zh TEXT NULL,
  ADD COLUMN note_ar TEXT NULL;

-- ── habanos_presence ───────────────────────────────────────────────
ALTER TABLE habanos_presence
  ADD COLUMN status_en      VARCHAR(200) NULL, ADD COLUMN status_es      VARCHAR(200) NULL,
  ADD COLUMN status_de      VARCHAR(200) NULL, ADD COLUMN status_zh      VARCHAR(200) NULL,
  ADD COLUMN status_ar      VARCHAR(200) NULL,
  ADD COLUMN ownership_en   VARCHAR(200) NULL, ADD COLUMN ownership_es   VARCHAR(200) NULL,
  ADD COLUMN ownership_de   VARCHAR(200) NULL, ADD COLUMN ownership_zh   VARCHAR(200) NULL,
  ADD COLUMN ownership_ar   VARCHAR(200) NULL,
  ADD COLUMN description_en TEXT NULL,         ADD COLUMN description_es TEXT NULL,
  ADD COLUMN description_de TEXT NULL,         ADD COLUMN description_zh TEXT NULL,
  ADD COLUMN description_ar TEXT NULL,
  ADD COLUMN festival_en    VARCHAR(200) NULL, ADD COLUMN festival_es    VARCHAR(200) NULL,
  ADD COLUMN festival_de    VARCHAR(200) NULL, ADD COLUMN festival_zh    VARCHAR(200) NULL,
  ADD COLUMN festival_ar    VARCHAR(200) NULL;

-- ── Nettoyage : colonnes mortes ────────────────────────────────────
ALTER TABLE brands
  DROP COLUMN notes_en, DROP COLUMN notes_es, DROP COLUMN notes_de,
  DROP COLUMN notes_zh, DROP COLUMN notes_ar;
