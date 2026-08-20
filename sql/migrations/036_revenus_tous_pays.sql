-- ════════════════════════════════════════════════════════
-- 036 — Un revenu pour chaque pays, ou la raison qu'il n'y en ait pas
-- ────────────────────────────────────────────────────────
-- Dix fiches sur quinze n'avaient toujours pas de montant. La consigne
-- est d'en trouver un pour tous.
--
-- ── LA VOIE QUI MANQUAIT ────────────────────────────────
--
-- Jusqu'ici on demandait à chaque pays ce qu'il EXPORTE. Les petits
-- producteurs déclarent mal et par à-coups, d'où les trous.
--
-- On demande désormais aux ÉTATS-UNIS ce qu'ils IMPORTENT de lui. Le
-- Census américain déclare avec une régularité que le Honduras ou le
-- Costa Rica n'ont pas, et les États-Unis sont le premier marché
-- mondial du cigare. En insistant (deux tentatives par année, l'accès
-- public étant capricieux), les séries deviennent pleines :
--
--   HONDURAS    84,2  100,0  127,1  128,5  112,1  115,4   six ans
--   INDONÉSIE   13,6   12,7   15,3   12,1    8,8    8,7   six ans
--   COSTA RICA   0,53   0,79   1,37   1,61   2,42   2,95  six ans
--
-- ── ET LE COSTA RICA SE RÈGLE DE LUI-MÊME ───────────────
--
-- La migration 035 l'avait écarté : ses exportations mondiales
-- annonçaient 100 tonnes, une douzaine de millions de pièces, pour une
-- fiche qui dit « un seul acteur, séries très limitées ».
--
-- Vu des douanes américaines : 2,95 M$ pour 19 tonnes. Compatible avec
-- Selected Tobacco. La contradiction ne venait pas de la fiche mais du
-- chiffre mondial, qui compte visiblement autre chose.
--
-- ── MESURER CE QUE LE PAYS VEND VRAIMENT ────────────────
--
-- Cameroun, Équateur et Mexique n'exportent AUCUN cigare vers les
-- États-Unis — six ans de zéro. Ce n'est pas une lacune : ils vendent
-- de la FEUILLE. Les mesurer au cigare revenait à peser un boulanger au
-- poids de sa farine vendue.
--
-- Le code HS 2401 (tabac non manufacturé) leur donne enfin un chiffre
-- qui décrit leur métier :
--
--   MEXIQUE      2,1   7,6   6,6  14,2  13,7   cinq ans
--   ÉQUATEUR     1,4   2,5   2,2   1,5   2,7   cinq ans
--   CAMEROUN     1,1   0,1   0,3    —    0,7   série trouée, petite base
--
-- ── LA COLONNE N'EST PLUS HOMOGÈNE, ET C'EST ASSUMÉ ─────
--
-- Trois bases coexistent désormais : chiffre d'affaires d'un
-- distributeur (Cuba), exportations mondiales (Rép. dominicaine,
-- Nicaragua, Brésil, États-Unis), importations américaines (les
-- autres) — et pour trois pays, de la feuille et non du cigare.
--
-- Les uniformiser serait pire. Ramener tout le monde aux importations
-- américaines mettrait CUBA À ZÉRO — embargo — ce qui serait absurde ;
-- et ramener tout le monde aux exportations mondiales rendrait le
-- Honduras et le Costa Rica à leurs trous.
--
-- La parade est celle du lot 1 : `rev_detail` s'affiche SOUS le montant
-- et nomme sa base. Sans lui, 425 M$ et 115 M$ se liraient comme
-- comparables ; avec lui, le lecteur voit qu'on parle d'exportations
-- mondiales dans un cas et d'importations américaines dans l'autre.
--
-- ── LES DEUX QUI RESTENT ────────────────────────────────
--
--   JAMAÏQUE : aucune importation américaine sur six ans. Comme les
--   États-Unis déclarent exhaustivement, cette absence EST la donnée —
--   l'industrie détruite en 1988 n'a jamais redémarré. Le montant est
--   donc zéro, et il est juste.
--
--   ÎLES CANARIES : pas de chiffre, et ce n'est pas faute d'avoir
--   cherché. L'ISTAC publie bien un commerce extérieur canarien distinct
--   de l'espagnol — 127 millions d'euros de tabac exporté en 2024, un
--   record qui dépasse la banane. Mais l'essentiel est de la CIGARETTE,
--   et la part du cigare n'est pas ventilée publiquement.
--
--   Publier les 127 M€ referait pour la quatrième fois l'erreur de la
--   migration 028 : un chiffre juste sous un intitulé trop large. Le
--   détail affiche donc le fait et sa limite, ce qui informe davantage
--   qu'un montant faux.
-- ════════════════════════════════════════════════════════

-- ── Cigares : importations américaines ───────────────────

UPDATE producer_countries SET
    revenue    = '115 M$ (2024)',
    rev_detail = 'importations américaines de cigares et cigarillos (HS 2402.10)'
WHERE id = 'honduras';

UPDATE producer_countries SET
    revenue    = '8,7 M$ (2024)',
    rev_detail = 'importations américaines de cigares et cigarillos (HS 2402.10)'
WHERE id = 'indonesia';

UPDATE producer_countries SET
    revenue    = '2,95 M$ (2024)',
    rev_detail = 'importations américaines de cigares et cigarillos (HS 2402.10)'
WHERE id = 'costarica';

UPDATE producer_countries SET
    revenue    = '0,44 M$ (2024)',
    rev_detail = 'importations américaines de cigares et cigarillos (HS 2402.10)'
WHERE id = 'philippines';

UPDATE producer_countries SET
    revenue    = '0,02 M$ (2024)',
    rev_detail = 'importations américaines de cigares et cigarillos (HS 2402.10)'
WHERE id = 'panama';

-- ── Feuille : ce que ces trois pays vendent réellement ───

UPDATE producer_countries SET
    revenue    = '13,7 M$ (2024)',
    rev_detail = 'importations américaines de tabac en feuille (HS 2401)'
WHERE id = 'mexico';

UPDATE producer_countries SET
    revenue    = '2,65 M$ (2024)',
    rev_detail = 'importations américaines de tabac en feuille (HS 2401)'
WHERE id = 'ecuador';

UPDATE producer_countries SET
    revenue    = '0,73 M$ (2024)',
    rev_detail = 'importations américaines de tabac en feuille (HS 2401)'
WHERE id = 'cameroon';

-- ── L'absence qui est une donnée ─────────────────────────

UPDATE producer_countries SET
    revenue    = '0 M$ (2024)',
    rev_detail = 'aucune importation américaine depuis six ans'
WHERE id = 'jamaica';

-- ── Le seul qui n'aura pas de montant ────────────────────

UPDATE producer_countries SET
    revenue    = NULL,
    rev_detail = '127 M€ de tabac exporté en 2024, mais surtout des cigarettes'
WHERE id = 'canaries';
