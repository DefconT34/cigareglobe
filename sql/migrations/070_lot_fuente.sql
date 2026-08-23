-- ════════════════════════════════════════════════════════
-- 070 — Deux dates de marque collées à une gamme
-- ────────────────────────────────────────────────────────
-- Romeo y Julieta annonçait l'Exhibición No.4 comme « lancée en 1875 ».
-- 1875 est la date de fondation de la MARQUE ; aucun format ne remonte
-- à cette année-là sous ce nom. C'est le même glissement que Trinidad
-- et son millésime 1985 (migration 062) et que Rocky Patel et son
-- « tabac vieilli depuis 1992 » (migration 068) : une date qui
-- appartient à la maison migre vers une gamme, où elle devient fausse.
--
-- Troisième occurrence, trois marques différentes. Ce n'est pas une
-- coïncidence : une fiche de gamme veut une date, et la seule date
-- disponible est celle de la marque.
--
-- ── HEMINGWAY « AIMAIT LES GRANDS CIGARES » ─────────────
--
-- Arturo Fuente justifiait le nom de sa gamme Hemingway ainsi :
-- « nommée en hommage à l'auteur qui vécut à Cuba et aimait les grands
-- cigares ». Le séjour cubain est établi. Le goût pour les cigares ne
-- l'est pas — Hemingway est documenté pour bien d'autres choses, et
-- rien ici ne renvoie à une source.
--
-- C'est la même mécanique que Nixon sur Joya de Nicaragua (065) et
-- Kennedy sur Montecristo : on prête à un mort une habitude qui sert la
-- marque. Le nom de la gamme est un hommage — la fiche le dit
-- désormais, et s'arrête là.
--
-- ── UNE HEURE POUR UN 55 x 178mm ────────────────────────
--
-- Le Wide Churchill était donné « fumé en 60 minutes ». À ce module,
-- c'est irréaliste : la durée annoncée était celle d'un format bien
-- plus mince. Corrigé à une heure et demie, et « l'un des plus larges
-- jamais produits à Cuba » ramené à « l'un des plus épais du
-- catalogue » — des calibres supérieurs existent.
--
-- ── LES AFFIRMATIONS DE VENTE ───────────────────────────
--
-- « Épuisé en heures lors de chaque lancement » (Don Carlos), « le
-- best-seller américain depuis 30 ans » (Macanudo Café), « le café le
-- plus rare du monde » (Gesha). Aucune n'est vérifiable, et les deux
-- premières empruntent l'autorité du chiffre exactement comme les
-- classements de presse déjà retirés. Elles partent.
--
-- Le « depuis 30 ans » avait en plus le défaut de vieillir tout seul :
-- écrit une fois, il devient faux chaque année.
--
-- ── ET LE COCKTAIL DE WALL STREET ───────────────────────
--
-- « Il distribuait des boîtes de Café lors des cocktails de Wall
-- Street » : détail pittoresque, attribué nommément à un homme réel,
-- sans rien pour l'étayer. Ce qui est structurel — Cullman a placé la
-- marque dans les réseaux du nord-est américain — suffit à dire la
-- même chose sans inventer la scène.
-- ════════════════════════════════════════════════════════

-- ── Arturo Fuente ───────────────────────────────────────
UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[1].story',
  'Hommage au père, Carlos Fuente Sr. Mi-corsée à corsée, cape camerounaise sur dominicain. L''équilibre de la maison — moins rare que l''Opus X, plus accessible, d''une constance que les amateurs suivent depuis les années 1970. Notes de café, cuir, épices douces. Le format Eye of the Shark, un figurado, est celui que la maison réserve à ses sorties les plus attendues.')
WHERE `name` = 'Arturo Fuente';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[2].story',
  'Lancée dans les années 1980, en formats Perfectos et Classicos. Elle porte le nom de l''écrivain qui vécut à Cuba — un hommage de la maison, sans qu''un goût particulier pour le cigare lui soit attesté. C''est le point d''entrée Arturo Fuente : douce, crémeuse, sans agressivité. Le Masterpiece, neuf pouces, est le plus long cigare de la gamme.')
WHERE `name` = 'Arturo Fuente';

UPDATE `brands` SET `pairings` = JSON_SET(`pairings`, '$[2].notes',
  'Le Gesha du Panama, l''un des cafés les plus floraux et les plus chers qui soient, avec l''Opus X. Deux produits que l''on attend plus qu''on ne les achète.')
WHERE `name` = 'Arturo Fuente';

-- ── Romeo y Julieta ─────────────────────────────────────
UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[1].story',
  'Petit Corona (42 x 127mm), l''un des plus anciens formats du catalogue — la marque, elle, date de 1875. L''entrée en matière dans l''univers Romeo y Julieta : douce, florale, légèrement crémeuse. C''est par ce format qu''on aborde la maison avant de s''attaquer au Churchill.')
WHERE `name` = 'Romeo y Julieta';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[2].story',
  'Même longueur que le Churchill (178mm), mais un calibre 55 — l''un des formats les plus épais du catalogue cubain. La surface de cape accrue intensifie les notes crémeuses et vanillées. Comptez une heure et demie. Réservé aux amateurs qui ne transigent pas sur l''épaisseur.')
WHERE `name` = 'Romeo y Julieta';

-- ── Macanudo ────────────────────────────────────────────
UPDATE `brands` SET `celebrities` = JSON_SET(`celebrities`, '$[0].anecdote',
  'C''est Cullman qui fit de Macanudo une marque nationale américaine dans les années 1960 et 1970, en la plaçant méthodiquement dans les réseaux de distribution du nord-est. Le cigare y a gagné une image précise : celle d''une réussite tranquille, jamais ostentatoire.')
WHERE `name` = 'Macanudo';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'La gamme la plus vendue de la maison aux États-Unis. Cape Connecticut Shade sur assemblage dominicain et jamaïcain. Notes de crème, cèdre léger, noisette blanche. Format Café (42 x 140mm). Douce, régulière, prévisible — et c''est exactement ce que ses amateurs cherchent. Le cigare des terrasses de golf et des salons d''attente.')
WHERE `name` = 'Macanudo';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[2].story',
  'La gamme haut de catalogue de Macanudo. Cape Connecticut Shade sélectionnée, tabacs dominicains vieillis. Notes de crème riche, pain au beurre, noisette grillée. La signature de la maison à son meilleur — toujours douce, mais d''une complexité que la Café standard n''atteint pas.')
WHERE `name` = 'Macanudo';
