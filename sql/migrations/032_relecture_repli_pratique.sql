-- ════════════════════════════════════════════════════════
-- 032 — Les 45 valeurs que le lot 2 avait écartées
-- ────────────────────────────────────────────────────────
-- Devise, langue et fuseau des quinze pays. Le lot 2 ne les avait PAS
-- relues, et le disait : `fiche.js` les remplace par Intl, et
-- `data.pays.js` couvrant les quinze, la valeur de la base ne peut se
-- déclencher pour aucun. Relire ce que personne ne lit aurait été du
-- gaspillage.
--
-- Elles restent le repli d'un seizième pays qui manquerait à
-- `data.pays.js` — c'est à ce titre qu'elles sont relues ici.
--
-- ── QUARANTE ET UNE SUR QUARANTE-CINQ ÉTAIENT JUSTES ────
--
-- Le meilleur taux de toute la relecture, et c'est logique : une
-- devise et un fuseau bougent rarement, là où un PIB vieillit tout
-- seul. Les quinze codes ISO concordent avec `data.pays.js`, et les
-- quinze fuseaux avec le décalage standard de la zone IANA
-- correspondante.
--
-- Quatre défauts de forme, un de fond :
--
--   PANAMA n'avait aucun code ISO là où les quatorze autres en
--   portaient un. Le pays a bien deux monnaies en circulation — le
--   balboa n'existe qu'en pièces, à parité avec le dollar.
--
--   NICARAGUA : la monnaie est le córdoba. « Córdoba oro » est le nom
--   de la refonte de 1991, pas celui de l'unité.
--
--   CAMEROUN : « Fr./Anglais » abrégeait là où les autres écrivent en
--   toutes lettres.
--
--   BRÉSIL et MEXIQUE annonçaient un fuseau unique alors que les deux
--   sont dans `PAYS_MULTIFUSEAUX` — et que les États-Unis et
--   l'Indonésie, eux, affichaient bien une fourchette. Trois pays à
--   plusieurs fuseaux sur cinq le disaient ; deux non.
--
-- ── ET LE DÉFAUT QUI N'ÉTAIT PAS DANS LA BASE ───────────
--
-- La vraie trouvaille de ce lot est ailleurs, et elle inverse ce qu'on
-- cherchait : `producer_geo` avait RAISON et l'écran avait TORT.
--
-- `data.pays.js` est indexé par code ISO, et ce code est déduit du
-- DRAPEAU. Les Canaries arborent 🇪🇸 : leur fiche héritait donc de
-- toute la ligne espagnole, fuseau compris, et affichait l'heure de
-- Madrid — une heure de trop toute l'année, l'archipel étant à UTC+0
-- quand la péninsule est à UTC+1. La base disait « UTC+0 », c'est-à-dire
-- juste, et ce repris juste ne pouvait pas se déclencher.
--
-- Corrigé côté front par `TERRITOIRES_INFOS`, indexé par identifiant de
-- fiche — puisque c'est justement le drapeau qui ne discrimine pas.
-- `tools/coherence_check.php` compare désormais les deux copies, code
-- ISO contre code ISO et décalage contre décalage standard de la zone
-- IANA : c'est la seule façon de voir qu'elles divergent.
-- ════════════════════════════════════════════════════════

UPDATE producer_geo SET currency = 'Balboa (PAB) / Dollar US (USD)' WHERE country_id = 'panama';
UPDATE producer_geo SET currency = 'Córdoba (NIO)'                  WHERE country_id = 'nicaragua';

UPDATE producer_geo SET language = 'Français / Anglais'             WHERE country_id = 'cameroon';

UPDATE producer_geo SET timezone = 'UTC−3 à −5'                     WHERE country_id = 'brazil';
UPDATE producer_geo SET timezone = 'UTC−6 à −8'                     WHERE country_id = 'mexico';
