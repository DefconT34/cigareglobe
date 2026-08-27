-- ════════════════════════════════════════════════════════
-- 122 — Deux faits que la promotion avait laissés tomber
-- ────────────────────────────────────────────────────────
-- ── CE QUI A PERMIS DE LES VOIR ─────────────────────────
--
-- L'alignement de l'anglais (migrations 119→121) a rendu `history_en`
-- équivalent au français en contenu. Les 40 colonnes anglaises ont donc
-- pu être scellées — elles décrivent bien le français actuel — pendant
-- que les 160 colonnes es/de/zh/ar restaient en attente.
--
-- Sorties du cliquet, ces 40 entrées sont retombées sous le contrôle des
-- faits de `i18n_divergence`, qui compare les dates entre la source et
-- ses traductions. Il en a signalé deux — et ce sont deux OMISSIONS que
-- j'ai commises en promouvant, pas des inventions de la traduction.
--
-- ── 1. UN PROPRIÉTAIRE OUBLIÉ ───────────────────────────
--
-- L'anglais de General Cigar compte cinq paragraphes ; le dernier dit :
--
--   « The Scandinavian Tobacco Group, WHICH ACQUIRED GENERAL CIGAR IN
--     2016, added European distribution and manufacturing capabilities… »
--
-- Le français promu en compte cinq aussi — mais le cinquième est une
-- formule de clôture que j'ai écrite, et le paragraphe sur le rachat a
-- disparu. J'ai supprimé, sans le voir, le propriétaire actuel de
-- l'entreprise dont la fiche raconte l'histoire.
--
-- Compter les paragraphes ne suffit pas : les deux colonnes en avaient
-- cinq. C'est la DATE qui a trahi l'omission.
--
-- ── 2. UNE DATE DÉDUCTIBLE, MAIS ABSENTE ────────────────
--
-- Montecristo : « la Línea 1492, créée pour le cinquième centenaire du
-- voyage de Colomb ». L'anglais précise « in 1992 ». Le lecteur peut
-- faire l'addition — 1492 + 500 — mais rien n'oblige à la lui laisser
-- faire, et l'entrée `brands.gamme|Cohiba|*` du cliquet montre que cette
-- même date circule déjà ailleurs dans la base.
--
-- ── CE QUE CET ÉPISODE APPREND ──────────────────────────
--
-- Un contrôle ne trouve que ce qu'on lui laisse comparer. Tant que
-- l'anglais restait « en attente », ces deux omissions étaient hors de
-- portée — non parce que le contrôle était faible, mais parce que je
-- l'avais moi-même écarté de ces entrées, à juste titre, jusqu'à ce que
-- l'alignement les rende comparables.
-- ════════════════════════════════════════════════════════

UPDATE `brands` SET `history` = REPLACE(`history`,
  'Quand vous fumez une Macanudo Café, une CAO Flathead ou une Cohiba Blue, c''est un cigare General Cigar que vous tenez.',
  'Le Scandinavian Tobacco Group, qui a racheté General Cigar en 2016, y a ajouté des capacités de distribution et de fabrication européennes qui ont étendu la portée du groupe sur des marchés où les marques américaines travaillaient jusque-là en position défavorable.

Quand vous fumez une Macanudo Café, une CAO Flathead ou une Cohiba Blue, c''est un cigare General Cigar que vous tenez.')
WHERE `name` = 'General Cigar';

UPDATE `brands` SET `history` = REPLACE(`history`,
  'La Línea 1492, créée pour le cinquième centenaire du voyage de Colomb, a donné le Sublimes',
  'La Línea 1492, créée en 1992 pour le cinquième centenaire du voyage de Colomb, a donné le Sublimes')
WHERE `name` = 'Montecristo';
