-- ════════════════════════════════════════════════════════
-- 109 — Promotion vers le français, suite du lot 5
-- ────────────────────────────────────────────────────────
-- ── UNE NOTE DE PRESSE, ENCORE ──────────────────────────
--
-- « several Inspirado releases EARNING SCORES ABOVE 90 FROM SPECIALIST
-- PUBLICATIONS » (Macanudo, anglais). Troisième note trouvée dans ces
-- textes autonomes, après « scores in the upper 90s » (Arturo Fuente,
-- migration 106) et le prix arabe d'Alec Bradley (migration 099).
--
-- Celle-ci non plus n'est pas dénombrable — « above 90 », « specialist
-- publications » — donc invisible pour `marques_check`, qui cherche un
-- chiffre ou un nom de revue. Ces textes n'ayant jamais été relus,
-- c'est la promotion qui les sort un par un.
--
-- ── ET LA CAPE QUI N'EXISTE PAS, DE RETOUR ──────────────
--
-- L'anglais de Drew Estate dit « Connecticut Broadleaf HABANO wrappers ».
-- C'est exactement la confusion corrigée par la migration 096 sur la
-- fiche Liga Privada : le No.9 porte une Connecticut Broadleaf maduro,
-- le T52 une habano de la vallée du Connecticut. « Broadleaf Habano » ne
-- désigne aucune feuille. Le français promu dit « Connecticut
-- Broadleaf », sans le mot de trop.
--
-- Un même défaut à deux adresses, corrigé à une seule en 096 : c'est le
-- huitième cas du chantier.
--
-- ── TROIS RANGS DE MARCHÉ RETIRÉS ───────────────────────
--
--   « la marque de cigares LA PLUS VENDUE AUX ÉTATS-UNIS — un titre
--     qu'elle conserva pendant plus de deux décennies » (Macanudo,
--     français). La migration 070 avait déjà retiré « le best-seller
--     américain depuis 30 ans » de cette même fiche ET de celle de
--     General Cigar. La formule était revenue sous un autre habit.
--     La preuve qui suit se garde et dit mieux : chaque kiosque
--     d'aéroport, chaque boutique d'hôtel proposait la Café par défaut.
--
--   « les plus vendus en Amérique après Macanudo » et « les plus
--     recherchés du marché » (Drew Estate, français) — deux rangs de
--     marché dans une seule phrase.
--
--   « LA SEULE MAISON à exceller dans deux univers radicalement
--     opposés » — « la seule maison à » figure parmi les quinze
--     affirmations retirées par les lots 089→093. Elle avait survécu
--     ici. Ce qui la remplace dit la même chose sans prétendre à
--     l'exhaustivité : la maison occupe une place qu'aucune catégorie
--     antérieure ne décrivait.
-- ════════════════════════════════════════════════════════

-- ── Macanudo ────────────────────────────────────────────
UPDATE `brands` SET `history` =
'Les origines de Macanudo sont caribéennes et compliquées. La marque fut fondée en Jamaïque en 1868 sous le nom de Temple Hall, à partir d''un tabac jamaïcain qui offrait quelque chose d''inhabituel sur le marché premium du milieu du XIXe siècle : un profil léger et crémeux, de force minimale et d''accès maximal. Les sols et le climat de l''île donnaient un tabac plus proche du Connecticut Shade que de la Vuelta Abajo cubaine — souple, doux, indulgent pour les fumeurs qui trouvaient exigeante l''intensité des grandes marques de La Havane.

L''installation à New York dans les années 1960, sous l''impulsion d''Edgar M. Cullman Sr., transforma une spécialité caribéenne en phénomène américain. Cullman avait compris que le fumeur aisé de l''après-guerre voulait du luxe sans épreuve — un cigare disant le raffinement sans exiger d''expertise ni de tolérance physique. Il repositionna Macanudo autour de capes Connecticut Shade et de tripes dominicaines, effaçant ce que le tabac jamaïcain gardait de terreux, pour un profil de crème pure, de cèdre léger et de force abordable.

La stratégie dépassa toutes les projections. Dans les années 1980 et 1990, chaque kiosque d''aéroport, chaque boutique d''hôtel, chaque bar de restaurant tenant une carte de cigares proposait la Macanudo Café comme choix premium par défaut. Les bagues jaunes étaient devenues un signe de luxe accessible qui traversait les milieux.

General Cigar, qui a racheté la marque, a reconnu dans les années 2010 que cette position était devenue autant un handicap qu''un atout. Les fumeurs qui avaient grandi avec la Café étaient désormais assez expérimentés pour vouloir plus exigeant. La gamme Inspirado — assemblages nicaraguayens plus corsés sous des capes de style Connecticut modifiées — fut conçue pour retenir ce public tout en attirant l''amateur plus jeune, qui associait Macanudo à la génération de ses parents. Deux âmes cohabitent désormais : la Café pour la tradition, l''Inspirado pour la suite.'
WHERE `name` = 'Macanudo';

-- ── Drew Estate ─────────────────────────────────────────
UPDATE `brands` SET `history` =
'Jonathan Drew et Marvin Samuels fondèrent Drew Estate à New York en 1996 avec une idée que l''industrie établie jugeait quelque part entre la sottise et l''offense : infuser les cigares de composés aromatiques — café, vanille, chocolat, rhum — et les vendre à des gens qui trouvaient jusque-là le cigare inabordable. La gamme ACID qui en sortit connut un succès que le métier traditionnel ne savait pas expliquer. Elle vendit des cigares à des gens qui ne fumaient pas le cigare. Elle vendit des produits au prix du premium à des consommateurs qui n''étaient jamais entrés dans une cave. Elle créa un segment là où il n''y avait qu''un mur.

La réaction des puristes était prévisible, et en partie fondée. Les ACID ne sont pas, au sens traditionnel, des expressions d''un terroir : les arômes ajoutés dominent les apports de la cape, de la sous-cape et de la tripe au point de rendre la discussion technique de l''assemblage à peu près sans objet. Les dégustateurs expérimentés ne les commentaient pas. La presse spécialisée traitait la marque comme une catégorie à part, reconnaissant implicitement que les règles d''évaluation du premium ne s''y appliquaient pas.

L''installation à Estelí, au Nicaragua, en 2000, donna la base industrielle qui permit à la fois de produire les ACID à grande échelle et de mener le projet tabacole sérieux qui allait devenir Liga Privada. La même manufacture qui roulait des cigarillos infusés assemblait des capes Connecticut Broadleaf sur du ligero nicaraguayen, pour une série privée que Drew n''avait pas l''intention de commercialiser. Les deux activités cohabitaient sans contradiction apparente, parce que Drew les comprenait comme deux expressions de la même chose : un point de vue tranché sur ce que doit faire un cigare.

La percée commerciale du Liga Privada No.9, en 2008, obligea le marché à réviser entièrement son jugement. Une maison qui fait à la fois un cigare premium recherché et un cigare aromatisé largement diffusé occupe une place qu''aucune catégorie antérieure ne décrivait. Ce que Drew Estate laissera, quoi qu''il en soit, tiendra à ce fait : elle a élargi la catégorie par les deux bouts en même temps.'
WHERE `name` = 'Drew Estate';
