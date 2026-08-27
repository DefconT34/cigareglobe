-- ════════════════════════════════════════════════════════
-- 117 — Promotion vers le français, lot 10
-- ────────────────────────────────────────────────────────
-- Partagás et Tabacalera. Deux entrées du cliquet, et une tension que
-- l'atlas entretenait sans le savoir.
--
-- ── DEUX FICHES QUI SE DISPUTENT LE MÊME TITRE ──────────
--
-- Partagás : « C'est LA PLUS ANCIENNE MANUFACTURE DE CIGARES ENCORE EN
--   ACTIVITÉ AU MONDE. » (1845)
-- Tabacalera : « C'est la plus ancienne manufacture encore en activité
--   en Asie du Sud-Est, et L'UNE DES PLUS VIEILLES AU MONDE. » (1881)
--
-- Prises à la lettre, elles ne se contredisent pas tout à fait — « la
-- plus ancienne » et « l'une des plus vieilles » peuvent coexister. Mais
-- l'atlas décernait un titre mondial dans une fiche et le relativisait
-- dans l'autre, sans que rien ne relie les deux. Aucun contrôle ne peut
-- voir cela : `marques_check` lit chaque fiche isolément.
--
-- L'anglais de Partagás enfonce le clou : « It is today the oldest cigar
-- factory still in active production ANYWHERE IN THE WORLD — a
-- distinction that is architectural, historical, AND ENTIRELY EARNED. »
-- Se décerner soi-même un titre en ajoutant qu'il est mérité.
--
-- Les deux rangs partent. Ce qui reste est ce qui se vérifie et qui dit
-- davantage : cent quatre-vingts ans à la même adresse, Calle Industria
-- 520, à travers la colonie espagnole, l'occupation américaine, deux
-- guerres mondiales, une révolution et un demi-siècle d'embargo.
--
-- ── TROIS AUTRES ABSOLUS ────────────────────────────────
--
--   « the GLOBAL BENCHMARK for full-body cigars » (Serie D No.4) —
--     devient « la vitole sur laquelle on juge le corsé cubain », borné
--     et éprouvable.
--   « Un terroir UNIQUE AU MONDE » (Tabacalera, français) et « NO OTHER
--     MAJOR GROWING REGION produces it » (anglais) — deviennent le fait
--     d'approvisionnement : les assembleurs qui cherchent ce caractère
--     se sont historiquement fournis aux Philippines.
--   « Les amateurs de Partagás sont fidèles JUSQU'À L'EXTRÊME : on ne
--     passe pas de Partagás à une autre marque, ON EN REVIENT TOUJOURS. »
--     Une généralisation sur des milliers de gens, dont l'anglais ne dit
--     rien.
--
-- ── ET UNE PRUDENCE À CONSERVER ─────────────────────────
--
-- « After Don Jaime's death in 1868 — MURDERED, THE LEGEND SAYS, by a
-- rival ». L'incise est exactement ce qu'il faut : elle rapporte sans
-- affirmer. Elle passe telle quelle en français.
--
-- De même « the first manufacturer in Cuba — AND POSSIBLY IN THE WORLD
-- — to employ a lector » : le « peut-être » est conservé, parce qu'il
-- est la différence entre un fait et une vantardise.
-- ════════════════════════════════════════════════════════

-- ── Partagás ────────────────────────────────────────────
UPDATE `brands` SET `history` =
'Don Jaime Partagás fonda sa manufacture en 1845 dans le Barrio de los Sitios de La Havane, sur une rue qui porterait un jour son nom. Au 520 de la Calle Industria, le bâtiment néoclassique qu''il fit construire n''a jamais déménagé, jamais fermé, jamais été transformé en autre chose. Cent quatre-vingts ans durant, il a traversé la domination coloniale espagnole, l''occupation américaine, deux guerres mondiales, une révolution, un demi-siècle d''embargo et l''effondrement lent de tout ce qui l''entourait.

Don Jaime était un innovateur inquiet, à une époque où la plupart des fabricants se contentaient d''entretenir la tradition. Il allait lui-même dans les champs. Il avait compris que le profil terreux et puissant de sa manufacture exigeait des tabacs de micro-régions précises de la Vuelta Abajo — les terres rouges profondes autour de San Luis et de San Juan y Martínez, qui donnent le cacao sombre et le sous-bois caractéristiques du style Partagás. Il payait ces feuilles plus cher que ses concurrents.

Son apport le plus durable ne fut pas commercial mais culturel. Partagás fut la première manufacture de Cuba — et peut-être du monde — à employer un lector : un lecteur professionnel installé sur une estrade dans la galerie de roulage, qui faisait la lecture aux torcedores toute la journée. La pratique transforma l''atelier en salon improbable. Les ouvriers entendirent Zola, Dickens, Victor Hugo, Marx. Ils débattaient de ce qu''ils entendaient et réclamaient des textes précis. Don Jaime croyait que des esprits cultivés font de meilleurs cigares. La lectura gagna ensuite toutes les manufactures cubaines, puis les communautés de torcedores en exil à Tampa, Key West et New York, où elle survécut jusqu''au XXe siècle avancé.

Après la mort de Don Jaime en 1868 — assassiné par un rival, dit la légende —, la manufacture passa entre plusieurs mains avant d''être nationalisée en 1960. L''État maintint l''adresse, les équipes, et surtout l''approvisionnement. La Serie D No.4, robusto de 50 × 124 mm, est devenue sous gestion cubaine ce qu''elle reste aujourd''hui : la vitole sur laquelle on juge le corsé cubain. Ses notes de cacao amer, de poivre noir, de sous-bois humide et de cèdre vieilli arrivent par vagues, sur quarante-cinq minutes d''une complexité croissante. Elle a gardé le même caractère à travers les décennies, ce qui est plus rare qu''une bonne année.

La Lusitanias — double corona de 49 × 194 mm — est l''un des derniers grands formats encore produits régulièrement à Cuba : quatre-vingt-dix minutes, cinq phases aromatiques distinctes. La 8-9-8 Varnished, vendue en caisses de cèdre où les cigares sont rangés selon le motif qui lui donne son nom, est la proposition la plus élégante de la maison — une panetela si fine qu''elle paraît fragile, et qui concentre pourtant les arômes avec une intensité qui surprend qui l''aborde en attendant de la légèreté.'
WHERE `name` = 'Partagás';

-- ── Tabacalera ──────────────────────────────────────────
UPDATE `brands` SET `history` =
'L''histoire de Tabacalera de Filipinas commence non par une décision d''entrepreneur mais par une décision administrative coloniale. En 1881, la Couronne espagnole dissout la Real Compañía de Filipinas — le monopole d''État qui contrôlait la production, la distribution et l''exportation du tabac philippin depuis le XVIIIe siècle — et autorise la création de manufactures privées pour lui succéder. Le passage du monopole à la production concurrentielle visait à moderniser une industrie devenue bureaucratiquement rigide ; Tabacalera sortit de cette réorganisation comme la plus grande et la mieux capitalisée des nouvelles maisons privées.

L''administration coloniale espagnole avait cultivé le tabac philippin pour l''exportation vers l''Espagne pendant plus de deux siècles avant ce moment. La vallée de Cagayan, dans le nord de Luzon — région de culture principale alors comme aujourd''hui — avait été cartographiée, ses tabacs classés, ses pratiques systématisées par des décennies de gestion monopolistique. La feuille de la région d''Ilocos, cultivée dans d''autres conditions sur la côte nord-ouest, fournissait une variété complémentaire dont les assembleurs se servaient pour ajuster les profils. Le savoir technique accumulé était considérable, même s''il restait contraint par la bureaucratie.

Ce qui distingue vraiment le tabac philippin est difficile à dire sans le vocabulaire de la dégustation, mais c''est réel et constant. La rétro-olfaction — le retour aromatique par les fosses nasales à l''expiration — porte des notes que les dégustateurs expérimentés décrivent comme mentholées, fraîches, légèrement florales. Ce n''est ni une caractéristique variétale ni un artefact de fermentation, mais l''expression de la chimie du sol de Cagayan et de la façon particulière dont ce tabac métabolise ses alcaloïdes. Les assembleurs qui cherchent ce caractère se sont historiquement fournis aux Philippines.

La propriété a changé plusieurs fois depuis l''indépendance : les intérêts espagnols ont cédé la place à des actionnaires philippins après 1946, et la structure a continué d''évoluer. La matière première de Cagayan et les pratiques de fabrication d''origine, à Agoo dans la province de La Union, sont restées continues à travers ces transitions. Tabacalera est un livre d''histoire fumable.'
WHERE `name` = 'Tabacalera';
