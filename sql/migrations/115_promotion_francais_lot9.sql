-- ════════════════════════════════════════════════════════
-- 115 — Promotion vers le français, lot 9
-- ────────────────────────────────────────────────────────
-- Dannemann et Te Amo.
--
-- ── UN FAIT QUE LE FRANÇAIS TAISAIT ─────────────────────
--
-- L'anglais dit que le tabac bahianais est cultivé dans les vallées du
-- Recôncavo depuis le XVIIe siècle, « ORIGINALLY BY ENSLAVED AFRICAN
-- LABOR under Portuguese colonial administration ». Le français passait
-- directement du sol fertile à la manufacture allemande de 1873.
--
-- Ce n'est pas un détail de style. Un atlas qui raconte l'origine d'un
-- tabac et saute la main-d'œuvre qui l'a fait pousser raconte une
-- histoire fausse par omission. Le fait est promu.
--
-- ── ET L'ANGLAIS, ENCORE PLUS PRUDENT ───────────────────
--
-- Le français affirmait : « Dannemann est LA PLUS ANCIENNE MANUFACTURE
-- DE CIGARES DES AMÉRIQUES encore en activité. » L'anglais ne dit rien
-- de tel — il dit que peu de produits soignés peuvent se prévaloir d'un
-- contexte de fabrication inchangé depuis un siècle et demi.
--
-- Quatrième fois du chantier où c'est la version anglaise qui est la
-- plus rigoureuse, après Avo (105), Café Crème (107) et Punch (112).
-- Le français, colonne source, est celui qui affirme le plus — et c'est
-- précisément lui que les contrôles lisaient le moins (migration 098).
--
-- ── DEUX ABSOLUS ADOUCIS ────────────────────────────────
--
--   « une douceur chocolatée UNIQUE » (français) et « a chocolate
--     complexity FOUND IN NO OTHER WRAPPER VARIETY at comparable
--     consistency » (anglais) — deviennent « d'une régularité rare ».
--   « SOME OF THE MOST SIGNIFICANT NAMES in the American market » —
--     devient « plusieurs grands noms ». La liste qui suit — Fuente,
--     My Father, Perdomo — est le fait ; le superlatif, l'ornement.
--
-- Retirée aussi : « the serious premium range that HAS EARNED THE BRAND
-- ATTENTION IN THE SPECIALIST PRESS ». Aucune revue nommée, aucune note,
-- mais l'appel à la caution de la presse est le même geste.
-- ════════════════════════════════════════════════════════

-- ── Dannemann ───────────────────────────────────────────
UPDATE `brands` SET `history` =
'Gerhard Dannemann arriva au Brésil en 1873, à vingt-trois ans, parmi des milliers d''immigrants allemands installés dans les États du sud au cours du XIXe siècle. À la différence de la plupart, venus pour l''agriculture ou la petite industrie, Dannemann visait le tabac : il en connaissait le commerce par ses origines allemandes, et celui qu''il découvrit dans le bassin du Recôncavo, à Bahia, ne ressemblait à rien de ce qu''il attendait.

Le tabac bahianais se cultive dans les vallées fertiles au sud du Rio Paraguaçu depuis le XVIIe siècle — d''abord par le travail d''esclaves africains, sous administration coloniale portugaise. Le sol y est sombre, alluvial, enrichi par des siècles de crues et de dépôts, et il donne une feuille d''une douceur naturelle qui n''a rien du caractère abrupt du tabac cubain ni de l''intensité poivrée du nicaraguayen. Elle est plus proche d''un bon Sumatra indonésien que d''aucune variété caribéenne : souple, légèrement épicée, avec une finale de noix de cajou et de miel qui la destine aux petits formats accessibles.

Dannemann comprit le potentiel commercial de ce tabac pour le marché européen, à un moment où la classe moyenne allemande prenait goût aux petits cigares et aux cigarillos comme habitude quotidienne abordable. Il fonda sa manufacture à São Félix da Cachoeira — bourg colonial situé sur l''autre rive du Rio Paraguaçu, face au marché plus important de Cachoeira — et consacra sa première décennie à établir à la fois son approvisionnement et ses réseaux de distribution européens.

L''entreprise est restée à São Félix pendant cent cinquante ans. L''entrepôt colonial que Dannemann fit convertir en 1873 a été agrandi et modernisé, jamais déplacé. La maison demeura dans la famille pendant quatre générations avant son rachat par le groupe Swisher International — mais le lieu de production, l''approvisionnement auprès des fermes bahianaises voisines et la proposition même du produit n''ont pas bougé. Peu de produits de consommation soignés peuvent en dire autant sur un siècle et demi.'
WHERE `name` = 'Dannemann';

-- ── Te Amo ──────────────────────────────────────────────
UPDATE `brands` SET `history` =
'La culture du tabac dans l''État mexicain de Veracruz précède l''arrivée des Européens de plusieurs millénaires. Les Totonaques, qui habitaient les versants côtiers de la Sierra Madre orientale, cultivaient, traitaient et fumaient le tabac dans des contextes cérémoniels et sociaux que les observateurs coloniaux espagnols ont décrits avec perplexité. Quand l''Espagne organisa formellement la culture dans la région au XVIe siècle, elle ne faisait que régulariser une pratique que la terre et les hommes avaient déjà portée loin.

La sous-région de San Andrés Tuxtla, où pousse le tabac de Te Amo, produit deux variétés d''importance commerciale. La première est une cape naturellement sombre — non pas foncée artificiellement par une fermentation prolongée, mais poussée dans des conditions d''altitude et d''humidité qui produisent naturellement cette pigmentation. Le San Andrés Natural offre l''aspect et le parfum d''un maduro sans les mois de traitement supplémentaire qu''exigent les tabacs plus clairs. La seconde est le San Andrés Maduro proprement dit : la même feuille, soumise à une fermentation contrôlée qui transforme sa douceur propre en une complexité chocolatée d''une régularité rare.

Les deux variétés entrent dans la production de Te Amo, qui va des formats accessibles de tous les jours à une gamme premium plus exigeante. La position commerciale de la maison est inhabituelle : elle est à la fois fabricant de cigares et fournisseur de tabac pour plusieurs grands noms du marché américain. Arturo Fuente, My Father, Perdomo et d''autres ont bâti des gammes maduro spécifiquement autour de la feuille de San Andrés — ce qui dit les qualités de la variété autant que la capacité de Te Amo à tenir la régularité sur des relations de plusieurs années.

Fondée en 1963 par une coopérative de planteurs de San Andrés qui comprenaient le potentiel de leur tabac mieux que leurs intermédiaires commerciaux, Te Amo représente un moment précis de l''industrialisation agricole mexicaine : celui où des producteurs primaires ont vu qu''il était possible, et nécessaire, de s''approprier l''étape de transformation de leur propre chaîne de valeur.'
WHERE `name` = 'Te Amo';
