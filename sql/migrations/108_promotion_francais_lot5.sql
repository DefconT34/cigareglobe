-- ════════════════════════════════════════════════════════
-- 108 — Promotion vers le français, lot 5 : Cohiba et Montecristo
-- ────────────────────────────────────────────────────────
-- Ces deux fiches concentrent les rangs mondiaux mis au cliquet par la
-- migration 098 — et elles en portaient dans les DEUX textes, le
-- français comme l'anglais. Les promouvoir, c'est donc les traiter.
-- Le compteur du cliquet doit baisser, pas monter.
--
-- ── CE QUI PART DU FRANÇAIS ─────────────────────────────
--
--   « la marque de cigares LA PLUS RECONNUE, LA PLUS COPIÉE et LA PLUS
--     CONVOITÉE DU MONDE » (Cohiba) — trois rangs mondiaux en une
--     phrase. Ce qui reste dit la même chose et se vérifie : les
--     contrefaçons de bagues circulent largement, ce qui en dit plus
--     long sur la diffusion de la marque qu'aucun chiffre de vente.
--
--   « le cigare LE PLUS VENDU DU MONDE » (Montecristo No.4) — personne
--     ne publie de classement mondial des ventes de cigares. Le fait qui
--     le remplace est vérifiable et plus intéressant : dès la fin des
--     années 1940, le No.4 s'était imposé comme la définition du cigare
--     de tous les jours.
--
--   « CONSIDÉRÉ PAR LES CONNAISSEURS comme le cigare LE PLUS
--     PARFAITEMENT ÉQUILIBRÉ JAMAIS ROULÉ » (Montecristo No.2) — la
--     forme française de « many experts consider », doublée d'un
--     superlatif absolu. Troisième occurrence du chantier, après
--     Bolívar (migration 105) et Camacho (106).
--
--   « une troisième fermentation supplémentaire QUI N'EXISTE NULLE PART
--     AILLEURS » — devient « le procédé, tenu secret ». On sait qu'il
--     est gardé ; on ne sait pas ce que font toutes les manufactures du
--     monde.
--
-- ── ET DE L'ANGLAIS ─────────────────────────────────────
--
--   « Cohiba stands as THE UNDISPUTED APEX of Cuban tobacco ».
--   « more quality control checkpoints THAN ANY OTHER CUBAN BRAND ».
--   « they have never stopped being THE REFERENCE AGAINST WHICH EVERY
--     OTHER PREMIUM CIGAR IS MEASURED » (Montecristo).
--   « a Double Corona that CONNOISSEURS COMPARE to great Burgundy ».
--   « The waiting lists are longer than the cigar itself » — jolie
--     formule, mais c'est une mesure sans mesure.
--
-- ── CE QUI EST GARDÉ ────────────────────────────────────
--
-- Les rangs bornés à Cuba, vérifiables sur place : « la Vuelta Abajo, la
-- région la plus prestigieuse de Cuba » et « les torcedoras les mieux
-- payées de Cuba ». Même ligne qu'aux migrations 100, 103, 105 et 106.
--
-- Et les faits chiffrés que l'anglais apportait : un rebut sur cinq
-- détruit à El Laguito, moins de trois mille boîtes de Behike par an,
-- Mandela ajouté à la liste des chefs d'État — le français n'en citait
-- que trois.
-- ════════════════════════════════════════════════════════

-- ── Cohiba ──────────────────────────────────────────────
UPDATE `brands` SET `history` =
'Cohiba naquit dans le secret absolu, en 1966. Eduardo Rivera, torcedor dont les cigares personnels avaient attiré l''œil d''un garde du corps présidentiel, fut convoqué à La Havane et discrètement installé à El Laguito — un ancien hôtel particulier du quartier de Miramar. Pendant seize ans, Cohiba ne fut jamais vendue. Elle existait comme instrument diplomatique : des boîtes sans prix, offertes par Fidel Castro à des chefs d''État qui comprenaient aussitôt ce qu''ils tenaient. Willy Brandt à Bonn. François Mitterrand à Paris. Mouammar Kadhafi à Tripoli. Nelson Mandela à Johannesburg. Tous reçurent des boîtes de ce cigare sans nom.

En 1982, devant la curiosité internationale et un marché noir grandissant, Cuba ouvrit Cohiba à la distribution commerciale — hors de l''île seulement, et par les canaux les plus fermés de Cubatabaco. Le nom vient du taïno, la langue des premiers habitants de Cuba : il signifie simplement tabac. L''ironie est parfaite — un cigare enveloppé de protocole porte le nom le plus ancien et le plus nu de ce qu''il est.

Ce qui distingue techniquement Cohiba, c''est la troisième fermentation. Après les deux que subit tout tabac cubain, ses feuilles passent par une fermentation prolongée supplémentaire, en fûts de cèdre. Le procédé, tenu secret, retire une dernière couche d''âpreté et développe cet équilibre complexe, presque crémeux, qui définit le profil de la marque. Les feuilles viennent exclusivement de la Vuelta Abajo, la région la plus prestigieuse de Cuba, et sont choisies par les maîtres assembleurs de la manufacture.

El Laguito est le monde de Cohiba. Son personnel est majoritairement féminin — les torcedoras qui roulent Cohiba sont les artisanes du cigare les mieux payées de Cuba. La manufacture ne reçoit pas de visiteurs. Chaque cigare qui en sort passe par une série de points de contrôle, et les rebuts — environ un sur cinq — sont détruits, jamais redistribués.

La bague noir et jaune est devenue un signe de statut bien au-delà du monde du tabac. Elle apparaît au cinéma, en littérature, dans la photographie politique, comme raccourci de pouvoir. Les contrefaçons de bagues circulent largement, ce qui en dit plus long sur la diffusion de la marque qu''aucun chiffre de vente.

La ligne Behike BHK, lancée en 2010 pour les quarante-quatre ans de la marque, a poussé le principe plus loin : elle emploie le medio tiempo, une feuille qui ne pousse qu''à la cime du plant, en quantités trop faibles pour une récolte à grande échelle. Moins de trois mille boîtes existent chaque année.'
WHERE `name` = 'Cohiba';

-- ── Montecristo ─────────────────────────────────────────
UPDATE `brands` SET `history` =
'Montecristo naquit dans la manufacture H. Upmann en 1935, créée par Alonso Menéndez et Pepe García à partir des meilleurs tabacs de la Vuelta Abajo. Le nom fut choisi par les torcedors eux-mêmes : pendant les heures de roulage, un lector lisait à voix haute, et le roman préféré de l''atelier était Le Comte de Monte-Cristo d''Alexandre Dumas. Le choix disait quelque chose de ceux qui faisaient ces cigares et de ce à quoi ils aspiraient — une épopée de justice, de fortune et de résurrection. Le nom resta, la bague fut dessinée.

Les premiers Montecristo attirèrent vite l''attention en Grande-Bretagne, où les réseaux Dunhill et Hunters & Frankau les distribuaient dans les clubs londoniens. À la fin des années 1940, le No.4 — un petit corona de 42 × 129 mm — s''était imposé comme la définition du cigare de tous les jours : ni trop puissant ni trop délicat, impeccablement construit, et régulier d''une boîte à l''autre. Il est resté au centre de la gamme depuis.

La révolution de 1959 scinda la marque en deux dynasties permanentes. Alonso Menéndez partit avec ses semences, ses maîtres torcedores et son savoir. Il s''établit en République dominicaine, où un Montecristo fut créé dans des conditions aussi proches de l''original qu''il put les reconstituer. Deux maisons, un nom, deux terroirs — et des décennies de litiges sur le marché américain, où la marque cubaine ne peut être vendue en raison de l''embargo.

À La Havane, Montecristo continua sous propriété d''État, à la manufacture Romeo y Julieta. Le No.2, en format torpedo pyramidal, s''imposa comme la pièce maîtresse de la maison : la tête effilée concentre la chaleur et conduit les arômes en un crescendo qui culmine à mi-parcours avant de s''ouvrir sur le cèdre, l''épice noire et une finale d''une longueur remarquable. C''est la vitole sur laquelle on juge le plus souvent la maison.

L''Edmundo, lancé en 2004, a ajouté un profil plus rond et plus immédiat. La série Open a porté la marque vers de plus jeunes fumeurs qui trouvaient les classiques un peu exigeants. La Línea 1492, créée pour le cinquième centenaire du voyage de Colomb, a donné le Sublimes — un double corona qui évolue différemment d''une boîte à l''autre.

Ce qui unit tous les Montecristo, à travers les formats et les décennies, est une même philosophie de construction : l''équilibre avant tout. Ce ne sont pas des cigares qui s''annoncent par la puissance. Ils séduisent par la précision, et demandent de la patience.'
WHERE `name` = 'Montecristo';
