-- ════════════════════════════════════════════════════════
-- 035 — Les États-Unis, et ce que le code douanier compte vraiment
-- ────────────────────────────────────────────────────────
-- ── UN CRITÈRE, APPLIQUÉ À TOUT LE MONDE ────────────────
--
-- La migration 033 avait retenu le Nicaragua sur un critère explicite :
-- une série de plusieurs années SANS TROU, dont la valeur et le tonnage
-- évoluent ensemble. C'est le seul signe de complétude qu'on ait quand
-- il n'existe pas de second témoin.
--
-- Ce critère ne vaut que s'il est appliqué partout. Les neuf pays sans
-- revenu y ont donc été passés, sur 2019-2024 :
--
--   ÉTATS-UNIS  40,8 / 33,4 / 24,6 / 14,5 / 17,2 / 15,6 M$
--               447 / 354 / 216 / 118 / 167 / 115 t
--               six ans pleins, 91 à 136 $/kg     → RETENU
--
--   COSTA RICA  3,5 / 2,2 / 3,9 / 6,4 / 6,8 / 6,4 M$
--               six ans pleins, 55 à 74 $/kg      → ÉCARTÉ, voir plus bas
--
--   HONDURAS    trous en 2019, 2021, 2022, 2024 ; et les deux années
--               présentes donnent 35 puis 60 $/kg → écarté
--   INDONÉSIE   2019 vaut vingt fois les autres années → écarté
--   PANAMA      19,9 M$ en 2020, 0,00 en 2023       → écarté
--   CAMEROUN, ÉQUATEUR, JAMAÏQUE, MEXIQUE : quasi nuls ou absents.
--   Ce n'est pas une lacune, c'est l'information — ces pays vendent de
--   la feuille, pas des cigares.
--
-- ── POURQUOI LE COSTA RICA EST ÉCARTÉ MALGRÉ SA SÉRIE ───
--
-- Sa série est propre, et pourtant elle contredit sa propre fiche :
-- 100 tonnes en 2024, soit une douzaine de millions de pièces, pour un
-- pays dont l'atlas dit « un seul acteur », « séries très limitées,
-- ultra-premium ». Selected Tobacco ne roule pas douze millions de
-- cigares.
--
-- Publier ce chiffre poserait deux affirmations qui se contredisent sur
-- la même fiche — exactement ce que le lot 5 a passé une migration à
-- retirer. Tant qu'on ne sait pas CE QUI est compté là, le tiret et sa
-- raison valent mieux.
--
-- ── ET CE QUE LE CODE COMPTE VRAIMENT ───────────────────
--
-- Le doute costaricien a mis le doigt sur une imprécision de libellé
-- qui touche TOUTES les valeurs déjà publiées. HS 2402.10 n'est pas
-- « les cigares » : c'est « cigares, cheroots ET CIGARILLOS contenant
-- du tabac ». Les cigarillos industriels y sont, et ils pèsent.
--
-- Trois fiches annonçaient « exportations de cigares ». C'est le même
-- défaut que le Nicaragua de la migration 028 — un chiffre juste sous
-- un intitulé trop large — et il se corrige de la même façon : en
-- nommant ce que la ligne douanière contient réellement.
-- ════════════════════════════════════════════════════════

UPDATE producer_countries SET
    revenue    = '15,6 M$ (2024)',
    rev_detail = 'exportations de cigares et cigarillos (HS 2402.10)'
WHERE id = 'usa';

UPDATE producer_countries SET
    rev_detail = 'exportations de cigares et cigarillos (HS 2402.10)'
WHERE id = 'nicaragua';

UPDATE producer_countries SET
    rev_detail = 'exportations de cigares et cigarillos (douanes brésiliennes)'
WHERE id = 'brazil';
