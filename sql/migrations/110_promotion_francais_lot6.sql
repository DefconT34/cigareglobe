-- ════════════════════════════════════════════════════════
-- 110 — Promotion vers le français, lot 6
-- ────────────────────────────────────────────────────────
-- Davidoff et Joya de Nicaragua. Deux fiches de plus au cliquet des
-- rangs mondiaux, donc deux de moins après ce lot.
--
-- ── UNE DATE FAUSSE, TROUVÉE PAR L'ÉCART ────────────────
--
-- Le français disait que les Davidoff cubains furent produits « pendant
-- 25 ANS », l'anglais « for 22 YEARS ». De 1968 à la rupture de 1990, il
-- s'écoule vingt-deux ans. Le français avait tort.
--
-- `i18n_divergence` ne pouvait pas le voir : il compare les ANNÉES à
-- quatre chiffres entre les colonnes, et « 25 ans » n'en est pas une.
-- Une durée n'est pas une date, et rien ne vérifie qu'elle concorde avec
-- les dates qui l'encadrent. C'est la relecture qui l'attrape.
--
-- ── UNE DUPLICATION DANS L'ANGLAIS ──────────────────────
--
-- « the Jalapa AND JALAPA Valleys » (Joya de Nicaragua). Le second nom
-- manque. Les deux vallées de tabac du nord nicaraguayen sont Jalapa et
-- Estelí — c'est ce que dit le texte promu.
--
-- ── CE QUI PART, ET D'OÙ ────────────────────────────────
--
-- Du français :
--   « les Davidoff cubains furent LES PLUS CHERS DU MONDE » ;
--   « la rupture LA PLUS DRAMATIQUE DE L'HISTOIRE DU CIGARE » ;
--   « les cigares nicaraguayens LES PLUS CORSÉS QUI EXISTENT » ;
--   « le Dark Corojo est régulièrement décrit comme LE CIGARE LE PLUS
--     FORT DU MONDE » — une citation sans locuteur, qui met un rang
--     mondial dans une bouche anonyme pour ne pas l'assumer.
--
-- De l'anglais :
--   « positioned them ABOVE EVERY OTHER CIGAR IN THE WORLD » ;
--   « the ASPIRATIONAL PEAK of cigar culture » ;
--   « maintain the brand's position AT THE APEX of the accessible
--     premium market » ;
--   « Nicaragua's MOST CELEBRATED cigar brand » ;
--   « the MOST EXTREME expression of Nicaraguan intensity in commercial
--     production » ;
--   « ROUTINELY DESCRIBED BY REVIEWERS as the most demanding smoke they
--     had experienced » — la presse, encore, sans revue nommée ;
--   « consistently EARN SCORES BETWEEN 92 AND 96 » — quatrième note de
--     presse trouvée dans ces textes autonomes.
--
-- ── ET CE QUE J'AVAIS CRU À TORT ────────────────────────
--
-- J'ai d'abord écrit ici que `marques_check` aurait dû voir cette note,
-- « scores between 92 and 95 » figurant parmi les neuf formes citées
-- dans ses commentaires. Vérification faite avant d'appliquer : c'est
-- FAUX, et de deux façons.
--
-- Le motif anglais ne voit ni « earn scores between 92 and 96 », ni
-- « awarded it scores between 92 and 95 », ni « a 96-point score » —
-- pourtant tous trois cités dans le fichier. Il exige « scored » suivi
-- d'un nombre, ou « N points ».
--
-- Ce n'est pas un défaut : c'est la conclusion assumée du fichier.
-- Après neuf échecs, l'outil a cessé de courir après les formes du
-- chiffre pour détecter le NOM DE LA REVUE, qui vaut pour les six
-- langues d'un coup. Ces formes-là ne sont attrapées que si un magazine
-- est nommé.
--
-- « specialist publications » n'en nomme aucun. La note reste donc
-- invisible, par construction, et c'est la relecture qui la sort — la
-- quatrième de ce chantier.
-- ════════════════════════════════════════════════════════

-- ── Davidoff ────────────────────────────────────────────
UPDATE `brands` SET `history` =
'Zino Davidoff a grandi derrière un comptoir de tabac. Son père Henrion avait fui les pogroms russes et gagné Genève en 1911, avec le savoir-faire d''un marchand de tabac de Kiev et la détermination d''en faire quelque chose. La boutique familiale de la rue de Rive devint l''une des adresses les plus respectées de la ville, un lieu où les acheteurs sérieux venaient chercher un conseil sérieux. Zino apprit le métier dès l''enfance, et y absorba quelque chose de plus important encore : qu''une expertise du tabac ne vaut rien si l''on ne sait pas la transmettre.

En 1968, il lança sous son propre nom la gamme qui allait transformer la culture européenne du cigare. Son génie fut commercial autant que tabacole : il convainquit le monopole cubain de produire des assemblages exclusifs portant le nom Davidoff, à des prix et dans des emballages qui les plaçaient délibérément à part. « Davidoff de La Havane » fut, pendant vingt-deux ans, l''objet de désir de qui prétendait savoir ce qu''est un cigare.

La rupture de 1990 fit l''effet d''un séisme. Davidoff s''inquiétait depuis quelque temps de la régularité de la production havanaise — des feuilles qui ne correspondaient pas aux spécifications, des cigares au tirage difficile, des lots qui variaient trop d''une boîte à l''autre. Les négociations privées ayant échoué, Zino annonça publiquement qu''il mettait fin à la relation cubaine et transférait sa production en République dominicaine.

Le monde du cigare en resta sidéré. Les Davidoff cubains d''époque — que des collectionneurs pressentant la suite avaient déjà mis en cave — prirent aussitôt de la valeur. Ils comptent aujourd''hui parmi les pièces les plus recherchées du marché secondaire, vendues en ventes spécialisées à des prix qui disent la fin d''une époque.

Les Davidoff dominicains sont d''autres cigares. Plus doux, plus floraux, d''un accès plus immédiat que les cubains d''origine, ils portent l''argument de la maison : le tabac dominicain, choisi et assemblé avec la rigueur que Zino appliquait à ses relations cubaines, peut produire des cigares d''une sophistication équivalente. Le marché a largement accepté cet argument.'
WHERE `name` = 'Davidoff';

-- ── Joya de Nicaragua ───────────────────────────────────
UPDATE `brands` SET `history` =
'L''histoire de Joya de Nicaragua contient une ironie que ses propres historiens relèvent avec gourmandise : la marque fut créée par le gouvernement que la plupart des administrations américaines de l''époque soutenaient. Anastasio Somoza, dont Washington appuyait le régime comme rempart à l''influence communiste en Amérique centrale, fonda Joya de Nicaragua en 1968 comme entreprise d''État destinée à développer l''industrie du tabac à l''exportation.

Le moment était bien choisi. La culture américaine du cigare entrait à la fin des années 1960 dans une phase d''expansion et de montée en gamme, et l''embargo contre Cuba avait créé une demande d''alternatives que les centres de production existants — République dominicaine, Honduras — ne pouvaient pas entièrement satisfaire. Le tabac nicaraguayen des vallées de Jalapa et d''Estelí offrait un profil distinct : plus terreux et plus poivré que le dominicain, avec une intensité que les dégustateurs expérimentés reconnaissaient comme une autre expression du tabac du Nouveau Monde.

Joya de Nicaragua approvisionna les administrations Nixon, Ford et Carter. Les préférences présidentielles étaient connues et servies en conséquence. La marque tint brièvement un rôle diplomatique : un cigare nicaraguayen respectable que des responsables américains pouvaient accepter et fumer sans difficulté politique.

La révolution sandiniste de 1979 referma ce chapitre. La manufacture fut nationalisée, l''encadrement dispersé, et les années 1980 apportèrent crise économique, embargo américain et guerre civile à un pays qui essayait en même temps de cultiver du tabac et de survivre. L''usine tourna par intermittence, à capacité réduite, maintenant une continuité que la plupart des outils industriels n''auraient pas supportée.

L''investissement privé revint en 1994. La reconstruction fut graduelle et délibérée — la nouvelle direction avait compris que l''identité de la marque devait se regagner par la qualité du produit, non par le récit historique. L''Antaño 1970, assemblage conçu pour retrouver la formule de la production de 1970 à partir de tabacs nicaraguayens vieillis six ans, annonça la renaissance. Le Dark Corojo qui suivit pousse l''intensité nicaraguayenne aussi loin que la maison sait la porter.'
WHERE `name` = 'Joya de Nicaragua';
