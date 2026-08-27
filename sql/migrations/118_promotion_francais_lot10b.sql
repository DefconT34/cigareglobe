-- ════════════════════════════════════════════════════════
-- 118 — Promotion vers le français : Romeo y Julieta, dernière fiche
-- ────────────────────────────────────────────────────────
-- Quarantième et dernière fiche de la campagne de promotion ouverte par
-- la migration 101. `history_en` n'est plus, nulle part, un texte
-- autonome que cinq lecteurs sur six ne voient pas.
--
-- ── CE QUI PART ─────────────────────────────────────────
--
--   « il en deviendra LE PLUS GRAND AMBASSADEUR INVOLONTAIRE DE
--     L'HISTOIRE DU TABAC » (français) — un rang sur deux siècles de
--     métier. Ce qui reste dit le fait : soixante-dix ans, huit à dix
--     cigares par jour, un format qui porte son nom depuis 1948.
--   « a distinction NO OTHER BRAND HAD OFFERED a living statesman »
--     (anglais) — une antériorité que rien n'établit.
--   « It is the brand that MOST CONVERTS DESCRIBE as their gateway » —
--     une statistique sans statistique.
--   « the brand's limited editions are AMONG THE MOST ANTICIPATED in
--     the calendar » — attendues par qui, et comptées comment ?
--   « quarante-cinq minutes d'une complexité florale et crémeuse QUI
--     EXPLIQUE TOUT » — quatre mots qui n'expliquent rien.
--
-- ── CE QUI EST GARDÉ, ET POURQUOI ───────────────────────
--
-- Les deux légendes du français, parce qu'elles se DISENT comme telles :
-- « on raconte que » pendant le Blitz, et « la légende veut que » les
-- sous-marins allemands aient visé les navires chargés de cigares pour
-- Downing Street. Une légende annoncée n'est pas une affirmation : elle
-- rapporte ce qui se raconte, et le lecteur sait à quoi s'en tenir.
-- C'est le même traitement que « assassiné par un rival, dit la
-- légende » chez Partagás (migration 117).
--
-- Les médailles d'or d'Amsterdam, Paris et Chicago restent aussi :
-- expositions nommées, villes nommées, période nommée. Même ligne qu'en
-- migration 100 sur les récompenses — le spécifique et attribuable reste.
--
-- Et la consommation de Churchill, qui est le seul cas du chantier où
-- une consommation de tabac reste attribuée à une personne réelle. La
-- migration 057 en avait retiré quatre, toutes concernant des personnes
-- NOMMÉES ET VIVANTES. Churchill est mort en 1965, son usage du cigare
-- est documenté par lui-même et par ses contemporains, et le format qui
-- porte son nom en dépend. Le retirer appauvrirait sans rien protéger.
-- ════════════════════════════════════════════════════════

UPDATE `brands` SET `history` =
'Romeo y Julieta fut fondée en 1875 par Inocencio Álvarez, fabricant havanais qui avait compris qu''un grand nom est la première condition de la grandeur. Le titre romantique — emprunté à Shakespeare, dont les ouvriers du cigare cubains connaissaient bien les pièces par les séances de lectura — portait une charge émotionnelle qui traversait les langues et les cultures. En deux décennies, Romeo y Julieta remporta des médailles d''or aux expositions d''Amsterdam, de Paris et de Chicago. Álvarez fit appel aux meilleurs lithographes de La Havane pour ses bagues et ses étiquettes : la marque avait l''air de ce qu''elle valait.

La relation qui a défini son histoire commence en 1895. Winston Churchill avait vingt et un ans et couvrait comme correspondant de guerre la lutte d''indépendance cubaine ; on lui fit découvrir les Romeo y Julieta pendant ses trois semaines à La Havane. La rencontre fut décisive. Churchill fumerait ensuite entre huit et dix cigares par jour, chaque jour, pendant soixante-dix ans — à travers deux guerres mondiales, le Blitz, d''innombrables séances parlementaires, et l''écriture de l''histoire en six volumes de la Seconde Guerre mondiale qui lui valut le prix Nobel de littérature. Sa préférence allait au double corona : 47 × 178 mm, environ quarante-cinq minutes d''une complexité florale, crémeuse et cédrée.

On raconte que pendant le Blitz, il ne descendait jamais à l''abri sans sa boîte ; et la légende veut que les sous-marins allemands aient visé les navires transportant les cigares cubains destinés à Downing Street.

La marque honora cette relation en 1948 en donnant à son double corona le nom de Churchill. Le format reste la pièce maîtresse de la collection, fabriqué à la manufacture Romeo y Julieta du quartier de Belascoaín, à La Havane, et distribué par le réseau de Habanos S.A.

Le profil de la maison s''oppose délibérément aux marques de puissance du portefeuille cubain. Là où Partagás et Bolívar poussent la terre et l''intensité, Romeo joue la floralité, la crème et un sens presque orchestral de la progression. Les cigares ouvrent sur le cèdre et l''épice légère, passent par la noisette et le poivre blanc, et finissent sur les fruits secs et le miel. C''est souvent par cette marque qu''on comprend ce que le tabac cubain peut être — et c''est souvent vers elle qu''on revient après avoir exploré les extrêmes.

La ligne Reserva, qui emploie des tabacs vieillis de parcelles choisies de la Vuelta Abajo, prolonge l''ambition de la maison vers le domaine du collectionneur. Le Wide Churchill, lancé en 2008, a modernisé le format classique avec un diamètre légèrement plus large, pour une fumée plus fraîche et plus longue.'
WHERE `name` = 'Romeo y Julieta';
