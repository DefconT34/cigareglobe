-- ═══════════════════════════════════════════════════════════════════
-- Migration 010 — Deux incohérences de `lounge_countries`
-- ───────────────────────────────────────────────────────────────────
-- Relevées en indexant les fêtes nationales par code ISO. Le travail
-- consistait à dériver ce code du drapeau emoji ; comparer le résultat
-- à la colonne `iso_code` a mis les deux cas au jour.
--
--  1. LE BRÉSIL FIGURAIT DEUX FOIS.
--
--     `brazil`    (-14.2350, -51.9253) — iso_code VIDE, 7 établissements
--     `brazil_c`  (-15.8000, -47.9000) — iso_code 'BR', 0 établissement
--
--     Deux marqueurs pour un seul pays, à 300 km l'un de l'autre sur le
--     globe. Chacun portait la moitié de ce qu'il fallait : les données
--     d'un côté, le code de l'autre.
--
--     On garde `brazil`, celui auquel les établissements sont rattachés,
--     et on lui donne le code qui manquait. `brazil_c` est supprimé —
--     vérifié sans aucune ligne dépendante avant de l'écrire.
--
--  2. SAINT-MARTIN PORTAIT LE DRAPEAU DE L'AUTRE MOITIÉ DE L'ÎLE.
--
--     `iso_code` valait 'MF' (Saint-Martin, collectivité française) mais
--     le drapeau était 🇸🇽, celui de Sint Maarten — la partie
--     néerlandaise. Deux territoires distincts, deux pays au sens ISO.
--
--     Ce sont les adresses qui tranchent, et elles disent toutes la même
--     chose : Marigot (Marina Royale), Grand Case, Port La Royale. Les
--     trois établissements sont dans la partie FRANÇAISE. C'est donc le
--     drapeau qui était faux, pas le code — l'inverse de ce que l'on
--     suppose d'abord.
--
-- Aucune traduction n'est touchée : `lounge_countries` ne porte pas de
-- colonne de langue. Les noms de pays viennent d'`Intl.DisplayNames`.
-- ═══════════════════════════════════════════════════════════════════

-- ── 1. Brésil : rendre au bon enregistrement son code ISO ──────────
UPDATE lounge_countries SET iso_code = 'BR' WHERE id = 'brazil';

-- Filet : ne supprimer le doublon que s'il est bien resté vide. Si des
-- établissements lui ont été rattachés entre-temps, la ligne survit et
-- le doublon se voit encore — mieux qu'une perte silencieuse.
DELETE FROM lounge_countries
 WHERE id = 'brazil_c'
   AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM lounges) l
                    WHERE l.country_id = 'brazil_c');

-- ── 2. Saint-Martin : le drapeau suit les adresses ─────────────────
UPDATE lounge_countries SET flag = '🇲🇫' WHERE id = 'stmartin' AND iso_code = 'MF';
