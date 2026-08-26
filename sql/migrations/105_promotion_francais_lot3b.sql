-- ════════════════════════════════════════════════════════
-- 105 — Promotion vers le français, suite du lot 3
-- ────────────────────────────────────────────────────────
-- ── UN DÉFAUT DANS LE FRANÇAIS D'ORIGINE ────────────────
--
-- Bolívar disait, avant cette migration :
--
--     « Les connaisseurs sérieux s'accordent sur un point : un Bolívar
--       bien conservé quatre ans est l'un des cigares LES PLUS
--       GRATIFIANTS QUI EXISTENT. »
--
-- Deux défauts en une phrase, et aucun motif ne les voyait.
--   « les connaisseurs sérieux s'accordent » est la traduction exacte de
--     « many experts consider », que RANGS_MONDIAUX attrape — mais en
--     ANGLAIS seulement. Le français n'avait pas la forme.
--   « les plus gratifiants qui existent » est un superlatif absolu sans
--     la locution « au monde », donc invisible lui aussi.
--
-- La phrase est retirée. C'est la deuxième fois du chantier qu'une
-- promotion fait tomber un défaut du français, et non de l'anglais.
--
-- ── CE QUE LA PROMOTION FILTRE ──────────────────────────
--
--   « one of the twentieth century's most recognizable popular songs »
--     (Avo) — un rang. Le fait, lui, est plus intéressant et se garde :
--     la paternité de « Strangers in the Night » lui est restée disputée
--     toute sa vie. L'anglais était d'ailleurs PLUS PRUDENT que le
--     français, qui affirmait « composa » sans nuance.
--
--   « one of the most structured smoking experiences in Cuban tobacco »
--     — adouci en une description de ce que fait la vitole.
--
--   « bitter cocoa from Cacao Barry's darkest shelf » — une marque de
--     chocolatier citée en note de dégustation. Devient « cacao amer ».
--
-- ── CE QUI EST GARDÉ ────────────────────────────────────
--
-- « le plus puissant des grands cubains » : un rang BORNÉ à un ensemble
-- nommé et fini, que le lecteur peut éprouver lui-même. Il figurait déjà
-- dans le français. Même distinction qu'aux migrations 100 et 103.
-- ════════════════════════════════════════════════════════

-- ── Avo ─────────────────────────────────────────────────
UPDATE `brands` SET `history` =
'La biographie d''Avo Uvezian échappe aux conventions du genre. Né à Beyrouth en 1926 de parents arméniens rescapés du génocide, il quitta le Liban dans sa vingtaine pour New York, où il devint un pianiste de jazz assez accompli pour rejoindre l''orchestre de tournée de Frank Sinatra. Sa carrière le mena des clubs new-yorkais aux salles de concert européennes, et jusqu''à cette distinction improbable : avoir contribué à « Strangers in the Night », dont la paternité lui est restée disputée toute sa vie.

Passé la soixantaine, Uvezian menait une vie qui mêlait des concerts épisodiques à un intérêt grandissant pour le cigare. Il fumait à l''ancienne école cubaine, formé par la même culture du tabac havanais que Sinatra et son cercle avaient absorbée dans leurs années new-yorkaises. La République dominicaine, devenue dans les années 1980 l''alternative du cigare premium à Cuba, lui offrait ce qu''il cherchait : une fabrication excellente, et la possibilité de bâtir quelque chose à son nom.

Son ami Zino Davidoff facilita la rencontre avec la manufacture MATASA, à Santiago — celle-là même où se développait la production dominicaine de Davidoff. Les premiers Avo XO parurent en 1988, immédiatement reconnaissables à une convention de nommage qu''aucun autre fabricant n''employait : les vitoles portaient des noms d''accords de jazz — Intermezzo, Maestoso, Notturno, Impromptu — plutôt que les désignations numériques ou de format en usage dans le métier. C''était une affirmation esthétique, et elle s''avéra commercialement efficace.

Le groupe Davidoff racheta Avo dans les années 1990 et a maintenu la production en République dominicaine dans le même esprit. Avo Uvezian est mort en 2017, à quatre-vingt-neuf ans. La marque continue en hommage, chaque sortie tenant le lien entre le vocabulaire du jazz et les possibilités du tabac dominicain — un lien qu''il avait établi en décidant, à un âge où la plupart des musiciens songent à s''arrêter, de devenir fabricant de cigares.'
WHERE `name` = 'Avo';

-- ── Bolivar ─────────────────────────────────────────────
UPDATE `brands` SET `history` =
'Bolívar est le cigare qui ne négocie pas. Fondée en 1902 et nommée en hommage délibéré à Simón Bolívar — le général né au Venezuela qui libéra six nations d''Amérique du Sud de la tutelle espagnole —, la marque s''est toujours comprise comme distincte des raffinements des maisons havanaises plus diplomatiques. Le portrait de la bague montre Bolívar en grand uniforme, mâchoire serrée, regard droit. Ce n''est pas un ornement : c''est une déclaration d''intention.

La marque fut créée par José F. Rocha, et se distingua vite par la seule force de sa sélection de tabac. Là où les autres maisons de La Havane cherchaient l''équilibre et l''élégance, Rocha bâtit Bolívar sur les feuilles les plus sombres et les plus mûres de la Vuelta Abajo — des tabacs qui avaient fermenté plus longtemps, vieilli plus longtemps, et développé la profondeur terreuse qui définit le style. Le résultat divisa immédiatement, et divise encore cent vingt ans plus tard. C''est le plus puissant des grands cubains, et il demande quelque chose au fumeur.

Le profil aromatique ne ressemble à aucun autre grand cubain. Sous-bois humide après la pluie. Cuir ancien et tanin sombre. Expresso sans sucre. Cacao amer. Parfois, tard dans le cigare, une vague de truffe noire que les amateurs expérimentés reconnaissent comme la signature d''un vieux Vuelta Abajo au sommet de sa fermentation. Ce ne sont pas des métaphores construites pour la réclame : elles décrivent ce que fait le cigare, et le décrivent de la même façon depuis des décennies.

Le Royal Corona — 42 × 127 mm, un petit robusto — est la proposition la plus polyvalente de la maison : trente minutes de puissance concentrée, qui donnent l''expérience Bolívar entière dans un format accessible à qui ne peut consacrer une heure et demie à un cigare. La Belicosos Finos, pyramidale, 52 × 140 mm, en est le centre de gravité : la tête effilée modère l''intensité du premier tiers et construit une montée progressive. Sa fabrication exige du savoir-faire du torcedor, et récompense la patience du fumeur.

Bolívar attire un type précis d''amateur. Non pas des collectionneurs attirés par la rareté ou des investisseurs suivant les éditions limitées, mais des fumeurs qui ont goûté toute l''étendue du tabac cubain et choisi l''option la plus exigeante en sachant ce qu''ils faisaient. Ses fidèles en parlent avec une loyauté qui confine à l''évangélisme. Le reste du marché le décrit, un peu dépité, comme un goût qui s''acquiert — ce qui est exactement ce que ses créateurs voulaient.'
WHERE `name` = 'Bolivar';
