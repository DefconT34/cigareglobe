-- ════════════════════════════════════════════════════════
-- 232 — Lot 19 : les quarante-trois fiches relues, et les réseaux
-- ────────────────────────────────────────────────────────
-- SEPTIÈME RECENSEMENT, PREMIER MENÉ AVEC L'ÉQUIPE D'AGENTS. L'outil
-- tools/lounges_fraicheur.php avait désigné 43 fiches publiables dont
-- rien ne prouvait que le lieu est ouvert : source Google Maps ou
-- TripAdvisor, ou « à vérifier » depuis l'origine. Un expert-cigare par
-- lot géographique les a cherchées en langue locale et en anglais ;
-- chaque « introuvable » est passé devant un second expert chargé de le
-- réfuter avec une preuve datée. Aucun n'a été réfuté.
--
-- ── CE QUE LA RELECTURE REND ─────────────────────────────
-- Quatre sorts, et ils ne se traitent pas pareil (144, 155) :
--
--   1. DÉPUBLIÉES — `is_verified = 0`, jamais un DELETE. Deux cas :
--      · rien n'atteste le lieu, à deux lecteurs indépendants ;
--      · l'établissement PUBLIE la liste de ses bars, et aucun n'est
--        un salon cigares — ce n'est pas un silence, c'est un démenti.
--        Noom Dakar Sea Plaza (ex-Radisson Blu, renommé en janvier
--        2025), King Fahd Palace, Terrou-Bi, Le Lagon 1, Zenit Diplomatic
--        d'Andorre : chacun détaille ses espaces sur son site, sans
--        cigares. C'est le sort des onze de la migration 155.
--   2. GARDÉES « à vérifier — relu le 17 septembre 2026 » : l'hôtel
--      existe, aucune liste de bars consultable, ni confirmation ni
--      démenti. On ne retire pas sur le silence (155). La date écrite
--      compte : l'outil ne les redemandera pas avant dix-huit mois.
--   3. CORRIGÉES : l'établissement existe, la fiche se trompait.
--      · #745 « Cigar Club, San Martín 501 » → le Habanos Lounge du
--        casino Enjoy, San Martín 199, que habanos.com répertorie ;
--      · #750 « Cigar Club Bogotá, Calle 82 no 12-18 » → La Cava del
--        Puro, Calle 82 no 12-41, boutique et bar, site officiel ;
--      · #2554 l'Hôtel Salam s'appelle Azalaï Hôtel Bamako.
--   4. AJOUTÉES : La Cava del Puro publie aussi Medellín et Carthagène.
--
-- ── LES RÉSEAUX, LUS À LA MACHINE ────────────────────────
-- Les agents réseaux sont morts trois fois de la limite de session
-- avant d'avoir lu quoi que ce soit, et le localisateur habanos.com est
-- une carte JavaScript. Mais son plan de site liste 4 437 pages
-- « place », une par point de vente — nom, type, adresse, pays,
-- distributeur. Toutes lues le 17 septembre 2026, recoupées par ville
-- (l'annuaire se trompe de pays : Bahreïn en « Bahamas », Busan en
-- « República Checa »), puis par type. Le résultat, pour 135 fiches
-- La Casa del Habano et Cohiba Atmosphere :
--   · PRÉSENTES dans leur ville : la source prend la date ;
--   · ABSENTES d'un pays que l'annuaire couvre : dépubliées (135, 142)
--     — Montréal, Toronto (le Canada n'a que Windsor), Gand (c'est La
--     Casa del Tabaco), Larnaca, León, Kiev (Jytomyr seule), Séoul,
--     Madrid (aucune Casa en Espagne), Dubrovnik, Tbilissi, Phnom Penh,
--     Riyad et Khobar (La Casa Cubana a remplacé les Casas) ; les
--     Cohiba Atmosphere de Tirana, Anvers, Rio, Shanghai, Shenzhen,
--     Cancún, Busan, que l'annuaire ne connaît pas ;
--   · NOMMÉES Casa del Habano mais classées Habanos Specialist (Mascate,
--     Chiang Mai) : le nom reste, la source le dit ;
--   · CORRIGÉES : Bakou est C-Gars Lounge, Habanos Point, à la même
--     adresse ; Djeddah est La Casa Cubana, Habanos Specialist, idem ;
--   · dans un PAYS QUE L'ANNUAIRE NE COUVRE PAS (Aruba, Barbade,
--     Botswana, Caïmans, Égypte, Guatemala, Jamaïque, Mali, Paraguay,
--     Saint-Martin, Togo, Venezuela) : rien conclu, et écrit.
-- Davidoff : le localisateur de davidoff.com ne porte ni Genève rue de
-- Rive ni Londres St James's — partiel ; ses 36 fiches ne bougent pas.
--
-- ── LES TRADUCTIONS ──────────────────────────────────────
-- Les fiches corrigées et ajoutées ont leurs cinq traductions écrites
-- avec elles, scellées depuis la colonne (leçon de la 140). Les
-- dépubliées gardent les leurs : on ne réécrit pas ce qu'on retire.
--
-- Après cette migration :
--   php tools/placeholders.php --tout        (des deux côtés : les cartes de 2566 et 2567)
--   php tools/lounges_fraicheur.php --sonder
--   php tools/lounges_fraicheur.php --figer
--   php tools/sources.php --figer
--   php tools/contenu_dump.php
--   php tools/i18n_dump.php > sql/traductions.sql
-- ════════════════════════════════════════════════════════

-- ── 1. Dépubliées : rien ne les atteste, ou l'établissement les dément ──
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : aucune trace du restaurant ni de son fumoir — nom, adresse, téléphone, en français et en anglais, deux lecteurs ; l''annuaire des restaurants d''ACI 2000 ne le cite pas ; à rétablir si une adresse est apportée', `updated_at` = NOW()
 WHERE `id` = 814 AND `country_id` = 'mali';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : aucune trace à SHS Quadra 01 ; la liste des tabacarias du Distrito Federal d''Emporium Cigars, distributeur Habanos au Brésil, en cite quatre (Aladdin Asa Norte et Asa Sul, Amerê, El Club Privado), pas celle-ci ; la Casa do Charuto active est à Salvador de Bahia', `updated_at` = NOW()
 WHERE `id` = 473 AND `country_id` = 'brazil';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : habanos.com et casadelhabanochile.cl ne connaissent qu''une Casa del Habano au Chili, à l''hôtel W de Las Condes — la fiche 159 —, rien avenue Providencia, et le téléphone n''est pas le sien', `updated_at` = NOW()
 WHERE `id` = 744 AND `country_id` = 'chile';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : aucune trace au 230 SW 2nd St ni sous ce nom à Fort Lauderdale ; le Tobacco Road de Floride était un bar de Miami, fermé et démoli en 2014', `updated_at` = NOW()
 WHERE `id` = 412 AND `country_id` = 'usa';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : havanaconnections.com, Virginia''s Humidor, n''a d''adresses qu''en Virginie ; rien à Tampa', `updated_at` = NOW()
 WHERE `id` = 413 AND `country_id` = 'usa';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : aucune trace en hébreu ni en anglais ; la liste des boutiques d''Arena Mall (arenamall.co.il) n''a pas d''enseigne de cigares', `updated_at` = NOW()
 WHERE `id` = 647 AND `country_id` = 'israel';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : aucune trace en japonais ni en anglais ; Okitayamacho n''est aucun des 262 quartiers de Higashiyama-ku, et le téléphone n''est associé à rien', `updated_at` = NOW()
 WHERE `id` = 368 AND `country_id` = 'japan';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : aucune trace en coréen ni en anglais ; Sinchon-ro 141 est le grand magasin U-PLEX Sinchon (Hyundai), qui n''annonce aucun espace cigares', `updated_at` = NOW()
 WHERE `id` = 690 AND `country_id` = 'southkorea';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : aucune trace en chinois ni en anglais sur Fuxing South Road ; le téléphone n''est associé à aucun commerce', `updated_at` = NOW()
 WHERE `id` = 685 AND `country_id` = 'taiwan';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : aucune trace en turc ni en anglais ; le 67 Meşrutiyet Caddesi abrite un restaurant et un cabinet d''architecture', `updated_at` = NOW()
 WHERE `id` = 625 AND `country_id` = 'turkey';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : le 168 Neyzen Tevfik Caddesi est le DoubleTree by Hilton Bodrum Marina Vista, qui n''annonce aucune enseigne Cigara', `updated_at` = NOW()
 WHERE `id` = 627 AND `country_id` = 'turkey';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : l''hôtel, Noom Hotel Dakar Sea Plaza depuis janvier 2025 (teyliom.com, 23 janvier 2025), publie la liste de ses bars — Onyx Bar, Rooftop Bar, Infinity Pool Bar (mangalis.com) —, aucun n''est un salon cigares ; et il est route de la Corniche Ouest, pas route de King Fahd', `updated_at` = NOW()
 WHERE `id` = 2537 AND `country_id` = 'senegal';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : l''hôtel publie la liste de ses bars et restaurants — Lounge Bar, Le Dizzy Bar, Les Jardins de l''Océan, Le Manguier (kingfahdpalacehotels.com) —, aucune terrasse cigares', `updated_at` = NOW()
 WHERE `id` = 2538 AND `country_id` = 'senegal';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : l''hôtel publie la liste de ses bars et restaurants — La Terrasse, Le Solarium, Le Grain de Sel, Le Diamono, Le Cube, le casino (terroubi.com) —, aucun espace cigares', `updated_at` = NOW()
 WHERE `id` = 2539 AND `country_id` = 'senegal';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : le restaurant publie ce qu''il offre — salle sur pilotis, ponton, plage privée, salle de fitness, ouvert de 9 h à minuit (lelagondakar.com) —, aucun fumoir', `updated_at` = NOW()
 WHERE `id` = 2540 AND `country_id` = 'senegal';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : l''hôtel est le Zenit Diplomatic, avenue de Tarragone, pas Antic Carrer Major ; il publie ses espaces (diplomatic.zenithoteles.com : restaurant Diplomatic, salles, piscine), aucun salon cigares', `updated_at` = NOW()
 WHERE `id` = 916 AND `country_id` = 'andorra';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : la page officielle Accor du Novotel Cotonou Orisha détaille ses deux bars — Pendjari, Bar Terrasse Piscine (all.accor.com) —, aucun coin cigares', `updated_at` = NOW()
 WHERE `id` = 2547 AND `country_id` = 'benin';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : aucune trace du Polo Club Cigar Lounge sur Tlokweng Road, à deux lecteurs ; seul un Nairobi Polo Club, au Kenya, répond à ce nom', `updated_at` = NOW()
 WHERE `id` = 811 AND `country_id` = 'botswana';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : plusieurs hôtels La Falaise existent à Douala — Résidence La Falaise, boulevard de la Liberté, à Akwa ; La Falaise Bonapriso, rue Njo-Njo —, aucun rue Flatters, et aucun n''annonce d''espace cigares : on ignore de quel établissement la fiche parle', `updated_at` = NOW()
 WHERE `id` = 1152 AND `country_id` = 'cameroon';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : l''hôtel publie ses bars — un Lounge Bar et un bar de piscine (mangalis.com) —, aucun salon cigares', `updated_at` = NOW()
 WHERE `id` = 2549 AND `country_id` = 'guinea';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : l''hôtel publie la liste de ses restaurants et bars — Dawa Dawa, Sika Sika, Le Mono, Le Sio (sarakawa-hotel.com) —, aucun bar à cigares', `updated_at` = NOW()
 WHERE `id` = 2543 AND `country_id` = 'togo';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : aucun hôtel Mercure distinct du Sarakawa n''est localisé à Lomé ; Wikipédia et les sites de réservation parlent d''un Mercure Sarakawa, boulevard du Mono, dont le site officiel ne mentionne ni la marque Mercure ni un salon cigares', `updated_at` = NOW()
 WHERE `id` = 2544 AND `country_id` = 'togo';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : aucune trace au 11 place de la Cathédrale, à deux lecteurs ; les caves du quartier sont La Régence, rue du 22-Novembre, et Le Comptoir du Cigare, rue du Vieux-Marché-aux-Poissons', `updated_at` = NOW()
 WHERE `id` = 237 AND `country_id` = 'france';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : aucune trace au 24 place Stanislas, à deux lecteurs ; le buraliste de la place est Le Royal, au no 1, et la cave citée de Nancy est Le Héré, rue Saint-Nicolas', `updated_at` = NOW()
 WHERE `id` = 238 AND `country_id` = 'france';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : aucune trace via degli Orefici, à deux lecteurs ; aucune tabaccheria parmi les sept boutiques historiques du Quadrilatero', `updated_at` = NOW()
 WHERE `id` = 329 AND `country_id` = 'italy';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : aucune trace au 16 Gran Vía, à deux lecteurs ; les estancos de la Gran Vía sont aux nos 50 et 59', `updated_at` = NOW()
 WHERE `id` = 249 AND `country_id` = 'spain';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : Club Pasión Habanos est un club madrilène, calle Ferraz 2 (clubpasionhabanos.com ; événements habanos.com à Madrid et Séville) ; rien au 84 Passeig de Gràcia — le Majestic Cigar''s Bar, au 68, a fermé en janvier 2011', `updated_at` = NOW()
 WHERE `id` = 250 AND `country_id` = 'spain';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : aucune trace au 65 calle Sierpes, à deux lecteurs ; les points de vente Habanos de Séville (habanos.com) sont calle Lineros 11, O''Donnell 30B, Pastor y Landero 41 et Arjona 6', `updated_at` = NOW()
 WHERE `id` = 252 AND `country_id` = 'spain';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : aucune trace calle Nueva à Málaga, à deux lecteurs ; les Tabaco & Ron homonymes sont au Panama et à Saint-Domingue', `updated_at` = NOW()
 WHERE `id` = 254 AND `country_id` = 'spain';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : aucune trace au 18 calle San Marcial, à deux lecteurs ; la cave citée de Donostia est l''Estanco 31 de Agosto', `updated_at` = NOW()
 WHERE `id` = 257 AND `country_id` = 'spain';

-- ── 2. Gardées « à vérifier », relues et datées ──────────
UPDATE `lounges` SET `source` = 'à vérifier — relu le 17 septembre 2026 : l''hôtel existe (azalai.com : restaurant Gourmet, un bar, une terrasse, une piscine), son salon cigares n''est décrit nulle part', `website` = 'https://www.azalai.com/en/grand-hotel-bamako', `updated_at` = NOW()
 WHERE `id` = 2555 AND `country_id` = 'mali';
UPDATE `lounges` SET `source` = 'à vérifier — relu le 17 septembre 2026 : l''hôtel est proposé à la réservation pour 2025-2026 sur les plateformes du voyage, aucun site officiel n''a répondu, son bar à cigares n''est décrit nulle part', `updated_at` = NOW()
 WHERE `id` = 2541 AND `country_id` = 'senegal';
UPDATE `lounges` SET `source` = 'à vérifier — relu le 17 septembre 2026 : l''hôtel existe (azadihotel.com : restaurants Parse, Kenzo, Parmin, Sarv, spa), une salle fumeurs figure parmi ses équipements en persan, aucun bar à cigares n''est décrit', `website` = 'https://azadihotel.com/', `updated_at` = NOW()
 WHERE `id` = 951 AND `country_id` = 'iran';
UPDATE `lounges` SET `source` = 'à vérifier — relu le 17 septembre 2026 : l''hôtel existe (hoteldulac-benin.com : restaurant, piscine, spa au bord du lac Nokoué), son fumoir n''est décrit nulle part ; le site donne le +229 01 21 33 19 19, la fiche portait le +229 21 31 35 00', `website` = 'https://hoteldulac-benin.com', `phone` = '+229 01 21 33 19 19', `updated_at` = NOW()
 WHERE `id` = 2546 AND `country_id` = 'benin';
UPDATE `lounges` SET `source` = 'à vérifier — relu le 17 septembre 2026 : l''hôtel Laïco existe, son site (laicohotels.com) ne se lit pas depuis un robot, aucune presse consultable ne décrit son bar à cigares', `website` = 'https://www.laicohotels.com', `updated_at` = NOW()
 WHERE `id` = 2552 AND `country_id` = 'burkina';
UPDATE `lounges` SET `source` = 'à vérifier — relu le 17 septembre 2026 : l''hôtel existe — 147 chambres, rouvert après l''attentat du 15 janvier 2016 —, un guide le place avenue Kwame N''Krumah, la fiche avenue de l''Indépendance, les deux sont écrits ; le site que la fiche annonçait ne résout plus ; aucune source ne décrit son VIP lounge', `updated_at` = NOW()
 WHERE `id` = 2553 AND `country_id` = 'burkina';
UPDATE `lounges` SET `source` = 'à vérifier — relu le 17 septembre 2026 : l''hôtel existe (ouvert en juin 2013, quartier Camayenne), son site n''a pas répondu — certificat expiré —, son fumoir n''est décrit nulle part', `website` = 'https://www.palmcamayenne.com', `updated_at` = NOW()
 WHERE `id` = 2550 AND `country_id` = 'guinea';
UPDATE `lounges` SET `source` = 'fourni par l''établissement — relu le 17 septembre 2026 : son compte Instagram, porté sur la fiche, donne les deux adresses, Diamond Center à Beverly Hills et rue du Docteur Blanchard en Zone 4 ; aucun site ni presse', `instagram` = '@cigarro.ci', `updated_at` = NOW()
 WHERE `id` = 4 AND `country_id` = 'ivorycoast';
UPDATE `lounges` SET `source` = 'fourni par l''établissement — relu le 17 septembre 2026 : son compte Instagram, porté sur la fiche, donne les deux adresses, Diamond Center à Beverly Hills et rue du Docteur Blanchard en Zone 4 ; aucun site ni presse', `instagram` = '@cigarro.ci', `updated_at` = NOW()
 WHERE `id` = 5 AND `country_id` = 'ivorycoast';

-- ── 3. Corrigées : l'établissement existe, la fiche se trompait ──
UPDATE `lounges` SET
  `name` = 'Enjoy Casino Viña del Mar — Habanos Lounge',
  `city` = 'Viña del Mar — Avenida San Martín 199',
  `type` = 'Habanos Lounge & Terrace',
  `phone` = NULL,
  `website` = 'https://www.habanos.com/place/enjoy-casino-vina-del-mar/',
  `hours` = NULL,
  `source` = 'habanos.com, fiche Enjoy Casino – Viña del Mar : Habanos Lounge et Habanos Terrace, distributeur exclusif Puro Tabaco S.A. (lue le 17 septembre 2026) — la fiche portait un Cigar Club au numéro 501, qu''aucune source ne connaît',
  `description` = 'Salon Habanos du casino Enjoy de Viña del Mar, avenue San Martín 199, face à la mer. Habanos S.A. le répertorie comme Habanos Lounge et Habanos Terrace, sous la distribution exclusive de Puro Tabaco S.A. La fiche portait auparavant un Cigar Club au numéro 501 de la même avenue, qu''aucune source ne connaît.',
  `description_en` = 'Habanos lounge of the Enjoy casino in Viña del Mar, Avenida San Martín 199, facing the sea. Habanos S.A. lists it as a Habanos Lounge and Habanos Terrace, under the exclusive distribution of Puro Tabaco S.A. The entry formerly gave a Cigar Club at number 501 of the same avenue, which no source knows.',
  `description_es` = 'Salón Habanos del casino Enjoy de Viña del Mar, avenida San Martín 199, frente al mar. Habanos S.A. lo registra como Habanos Lounge y Habanos Terrace, bajo la distribución exclusiva de Puro Tabaco S.A. La ficha daba antes un Cigar Club en el número 501 de la misma avenida, que ninguna fuente conoce.',
  `description_de` = 'Habanos-Lounge des Casinos Enjoy in Viña del Mar, Avenida San Martín 199, am Meer. Habanos S.A. führt sie als Habanos Lounge und Habanos Terrace, im Exklusivvertrieb von Puro Tabaco S.A. Der Eintrag nannte zuvor einen Cigar Club unter Nummer 501 derselben Avenida, den keine Quelle kennt.',
  `description_zh` = '比尼亚德尔马 Enjoy 赌场的哈瓦那雪茄廊，位于圣马丁大道199号，面朝大海。Habanos S.A. 将其列为 Habanos Lounge 与 Habanos Terrace，由 Puro Tabaco S.A. 独家经销。此前词条写的是同一条大道501号的一家 Cigar Club，没有任何来源知道它。',
  `description_ar` = 'صالة هابانوس في كازينو Enjoy بفينيا ديل مار، جادة سان مارتين 199، قبالة البحر. تدرجها Habanos S.A. بوصفها Habanos Lounge وHabanos Terrace، بتوزيع حصري من Puro Tabaco S.A. كانت البطاقة تذكر من قبل Cigar Club في الرقم 501 من الجادة نفسها، وهو ما لا يعرفه أيّ مصدر.',
  `updated_at` = NOW()
 WHERE `id` = 745 AND `country_id` = 'chile';
UPDATE `lounges` SET
  `name` = 'La Cava del Puro — Bogotá (Zona Rosa)',
  `city` = 'Bogotá — Avenida Calle 82 no 12-41, Zona Rosa, Chapinero',
  `type` = 'Cave & Bar',
  `phone` = '+57 601 522 9970',
  `website` = 'https://www.lacavadelpuro.com/',
  `hours` = 'Lun-Mar 9h-21h, Mer-Sam 9h-22h, Dim 11h-18h45',
  `source` = 'lacavadelpuro.com (lu le 17 septembre 2026 : adresses, horaires, téléphones de Bogotá, Medellín et Carthagène) — la fiche portait un Cigar Club Bogotá au numéro 12-18, qu''aucune source ne connaît',
  `description` = 'Cave à cigares de la Zona Rosa, avenida Calle 82 no 12-41, à Bogotá : boutique et bar, cigares cubains, puros colombiens et tabacs. Ouverte tous les jours, jusqu''à 22 h du mercredi au samedi. La maison a deux autres adresses, à Medellín et à Carthagène. La fiche portait auparavant un Cigar Club au numéro 12-18, qu''aucune source ne connaît.',
  `description_en` = 'Cigar shop of the Zona Rosa, Avenida Calle 82 No. 12-41, Bogotá: shop and bar, Cuban cigars, Colombian puros and tobaccos. Open every day, until 10 pm from Wednesday to Saturday. The house has two other addresses, in Medellín and Cartagena. The entry formerly gave a Cigar Club at number 12-18, which no source knows.',
  `description_es` = 'Cava de puros de la Zona Rosa, avenida Calle 82 n.º 12-41, en Bogotá: tienda y bar, puros cubanos, puros colombianos y tabacos. Abre todos los días, hasta las 22 h de miércoles a sábado. La casa tiene otras dos direcciones, en Medellín y en Cartagena. La ficha daba antes un Cigar Club en el número 12-18, que ninguna fuente conoce.',
  `description_de` = 'Zigarrengeschäft der Zona Rosa, Avenida Calle 82 Nr. 12-41, Bogotá: Laden und Bar, kubanische Zigarren, kolumbianische Puros und Tabake. Täglich geöffnet, von Mittwoch bis Samstag bis 22 Uhr. Das Haus hat zwei weitere Adressen, in Medellín und Cartagena. Der Eintrag nannte zuvor einen Cigar Club unter Nummer 12-18, den keine Quelle kennt.',
  `description_zh` = '波哥大 Zona Rosa 的雪茄店，位于第82大街12-41号：店铺与酒吧，经营古巴雪茄、哥伦比亚雪茄和烟草。每天营业，周三至周六营业至22时。该店在麦德林和卡塔赫纳另有两处地址。此前词条写的是12-18号的一家 Cigar Club，没有任何来源知道它。',
  `description_ar` = 'متجر سيجار في زونا روسا، أفينيدا كايي 82 رقم 12-41، بوغوتا: متجر وبار، سيجار كوبي وسيجار كولومبي وتبغ. يفتح كلّ يوم، وحتّى العاشرة مساءً من الأربعاء إلى السبت. وللدار عنوانان آخران في ميديين وقرطاجنة. كانت البطاقة تذكر من قبل Cigar Club في الرقم 12-18، وهو ما لا يعرفه أيّ مصدر.',
  `updated_at` = NOW()
 WHERE `id` = 750 AND `country_id` = 'colombia';
UPDATE `lounges` SET
  `name` = 'Azalaï Hôtel Bamako (ex-Hôtel Salam) — Espace Cigares',
  `city` = 'Bamako — Azalaï Hôtel Bamako, Avenue de l''OUA, Badalabougou',
  `type` = 'Hotel Cigar Space',
  `phone` = '+223 20 21 17 60',
  `website` = 'https://www.azalai.com/en/azalai-hotel-bamako',
  `hours` = NULL,
  `source` = 'à vérifier — relu le 17 septembre 2026 : l''hôtel existe, sous le nom Azalaï Hôtel Bamako (azalai.com : restaurant Nomad, deux bars, terrasse, piscine, spa, sans mot d''un fumoir), ex-Azalaï Hôtel Salam d''après les plateformes de réservation ; son salon cigares n''est décrit nulle part',
  `description` = 'L''ancien Hôtel Salam, avenue de l''OUA à Badalabougou, sur la rive droite du Niger à Bamako, porte aujourd''hui le nom d''Azalaï Hôtel Bamako : le groupe Azalaï le présente ainsi, avec son restaurant Nomad, deux bars, une terrasse, une piscine et un spa. Un espace cigares y est annoncé ; aucune source publique ne le décrit.',
  `description_en` = 'The former Hôtel Salam, Avenue de l''OUA in Badalabougou, on the right bank of the Niger in Bamako, now bears the name Azalaï Hôtel Bamako: the Azalaï group presents it so, with its restaurant Nomad, two bars, a terrace, a pool and a spa. A cigar space is listed there; no public source describes it.',
  `description_es` = 'El antiguo Hôtel Salam, avenida de la OUA en Badalabougou, en la orilla derecha del Níger en Bamako, lleva hoy el nombre de Azalaï Hôtel Bamako: así lo presenta el grupo Azalaï, con su restaurante Nomad, dos bares, una terraza, una piscina y un spa. Se anuncia allí un espacio de puros; ninguna fuente pública lo describe.',
  `description_de` = 'Das frühere Hôtel Salam, Avenue de l''OUA in Badalabougou, am rechten Nigerufer in Bamako, trägt heute den Namen Azalaï Hôtel Bamako: so stellt es die Azalaï-Gruppe vor, mit dem Restaurant Nomad, zwei Bars, einer Terrasse, einem Pool und einem Spa. Ein Zigarrenbereich ist dort angekündigt; keine öffentliche Quelle beschreibt ihn.',
  `description_zh` = '巴马科尼日尔河右岸巴达拉布古区非统大道上的原萨拉姆酒店，如今名为 Azalaï Hôtel Bamako：Azalaï 集团如此介绍它，设有 Nomad 餐厅、两间酒吧、露台、泳池和水疗中心。那里宣称有雪茄空间；没有任何公开来源对其作出描述。',
  `description_ar` = 'فندق سلام السابق، في جادة منظمة الوحدة الأفريقية ببادالابوغو على الضفّة اليمنى لنهر النيجر في باماكو، يحمل اليوم اسم Azalaï Hôtel Bamako: هكذا تقدّمه مجموعة أزالاي، مع مطعمه نوماد وبارين وشرفة ومسبح ومنتجع صحّي. يُعلَن فيه عن ركن للسيجار؛ ولا يصفه أيّ مصدر عامّ.',
  `updated_at` = NOW()
 WHERE `id` = 2554 AND `country_id` = 'mali';
UPDATE `lounges` SET
  `name` = 'Hotel Altamira Suites — Cigar Lounge',
  `city` = 'Caracas — Altamira Suites, Av. San Juan Bosco, Altamira',
  `type` = 'Hotel Cigar Bar',
  `phone` = '+58 212 264 5555',
  `website` = 'http://www.alsuites.com/',
  `hours` = NULL,
  `source` = 'à vérifier — relu le 17 septembre 2026 : l''hôtel existe (alsuites.com, page Restaurantes & Bar Lounge, bar sur le toit, illisible ce jour — certificat expiré), son salon cigares n''est décrit nulle part ; San Luis Cigars, sur la même avenue, est un lounge indépendant',
  `description` = 'Hôtel Altamira Suites, avenue San Juan Bosco, dans le quartier d''Altamira à Caracas. Son site annonce des restaurants et un bar-lounge sur le toit ; un espace cigares y est annoncé, aucune source publique ne le décrit. San Luis Cigars, sur la même avenue, est un lounge indépendant de l''hôtel.',
  `description_en` = 'Hotel Altamira Suites, Avenida San Juan Bosco, in the Altamira district of Caracas. Its site announces restaurants and a rooftop bar-lounge; a cigar space is listed there, no public source describes it. San Luis Cigars, on the same avenue, is a lounge independent of the hotel.',
  `description_es` = 'Hotel Altamira Suites, avenida San Juan Bosco, en el barrio de Altamira en Caracas. Su sitio anuncia restaurantes y un bar-lounge en la azotea; se anuncia allí un espacio de puros, ninguna fuente pública lo describe. San Luis Cigars, en la misma avenida, es un lounge independiente del hotel.',
  `description_de` = 'Hotel Altamira Suites, Avenida San Juan Bosco, im Viertel Altamira in Caracas. Seine Website kündigt Restaurants und eine Bar-Lounge auf dem Dach an; ein Zigarrenbereich ist dort angekündigt, keine öffentliche Quelle beschreibt ihn. San Luis Cigars, an derselben Avenida, ist eine vom Hotel unabhängige Lounge.',
  `description_zh` = '阿尔塔米拉套房酒店，位于加拉加斯阿尔塔米拉区圣胡安·博斯科大道。其网站宣布设有餐厅和一处屋顶酒吧廊；那里宣称有雪茄空间，没有任何公开来源对其作出描述。同一条大道上的 San Luis Cigars 是一家独立于酒店的雪茄廊。',
  `description_ar` = 'فندق ألتاميرا سويتس، جادة سان خوان بوسكو في حيّ ألتاميرا بكاراكاس. يعلن موقعه عن مطاعم وبار-صالة على السطح؛ ويُعلَن فيه عن ركن للسيجار، ولا يصفه أيّ مصدر عامّ. أمّا San Luis Cigars، في الجادة نفسها، فصالة مستقلّة عن الفندق.',
  `updated_at` = NOW()
 WHERE `id` = 1107 AND `country_id` = 'venezuela';
UPDATE `lounges` SET
  `name` = 'C-Gars Lounge — Bakou (Babek Avenue)',
  `city` = 'Bakou — Babek Avenue 21/99',
  `type` = 'Habanos Point',
  `phone` = '+994 12 490 62 97',
  `website` = NULL,
  `hours` = NULL,
  `source` = 'habanos.com, fiche C-Gars Lounge, Habanos Point, Babek Avenue 21/99 (lue le 17 septembre 2026) — la fiche portait une Casa del Habano à cette adresse, que l''annuaire ne connaît plus ; une seconde adresse, 6a Zarifa Aliyeva, est Habanos Specialist',
  `description` = 'Point de vente Habanos de Bakou, Babek Avenue 21/99, répertorié par Habanos S.A. sous le nom C-Gars Lounge ; une seconde adresse, 6a Zarifa Aliyeva, est classée Habanos Specialist. La fiche portait une Casa del Habano à cette adresse, que le réseau ne liste plus.',
  `description_en` = 'Habanos point of sale in Baku, Babek Avenue 21/99, listed by Habanos S.A. under the name C-Gars Lounge; a second address, 6a Zarifa Aliyeva, is classed Habanos Specialist. The entry formerly gave a Casa del Habano at this address, which the network no longer lists.',
  `description_es` = 'Punto de venta Habanos de Bakú, Babek Avenue 21/99, registrado por Habanos S.A. con el nombre C-Gars Lounge; una segunda dirección, 6a Zarifa Aliyeva, está clasificada Habanos Specialist. La ficha daba antes una Casa del Habano en esta dirección, que la red ya no registra.',
  `description_de` = 'Habanos-Verkaufsstelle in Baku, Babek Avenue 21/99, von Habanos S.A. unter dem Namen C-Gars Lounge geführt; eine zweite Adresse, 6a Zarifa Aliyeva, ist als Habanos Specialist eingestuft. Der Eintrag nannte zuvor eine Casa del Habano an dieser Adresse, die das Netz nicht mehr führt.',
  `description_zh` = '巴库的哈瓦那雪茄销售点，位于巴贝克大道21/99号，Habanos S.A. 以 C-Gars Lounge 之名将其列入名录；另一处地址 6a Zarifa Aliyeva 被归为 Habanos Specialist。此前词条写的是这一地址的一家 Casa del Habano，网络已不再列出。',
  `description_ar` = 'نقطة بيع هابانوس في باكو، جادة بابك 21/99، تدرجها Habanos S.A. باسم C-Gars Lounge؛ وعنوان ثانٍ، 6a Zarifa Aliyeva، مصنَّف Habanos Specialist. كانت البطاقة تذكر من قبل Casa del Habano في هذا العنوان، ولم تعد الشبكة تدرجها.',
  `updated_at` = NOW()
 WHERE `id` = 144 AND `country_id` = 'azerbaijan';
UPDATE `lounges` SET
  `name` = 'La Casa Cubana — Jeddah (Palestine Street)',
  `city` = 'Jeddah — Palestine Street, Al Hamra',
  `type` = 'Habanos Specialist',
  `phone` = '+966 12 667 2752',
  `website` = NULL,
  `hours` = NULL,
  `source` = 'habanos.com, fiche La Casa Cubana, Palestine Street, Habanos Specialist (lue le 17 septembre 2026) — la fiche portait une Casa del Habano à cette adresse ; le réseau n''en a plus en Arabie saoudite, La Casa Cubana y a sept adresses',
  `description` = 'Boutique Habanos de Djeddah, Palestine Street, dans le quartier d''Al Hamra, répertoriée par Habanos S.A. sous le nom La Casa Cubana, Habanos Specialist. La fiche portait une Casa del Habano à cette adresse ; le réseau n''en liste plus en Arabie saoudite, où La Casa Cubana a sept adresses, à Djeddah, Riyad et Khobar.',
  `description_en` = 'Habanos shop in Jeddah, Palestine Street, in the Al Hamra district, listed by Habanos S.A. under the name La Casa Cubana, Habanos Specialist. The entry formerly gave a Casa del Habano at this address; the network no longer lists any in Saudi Arabia, where La Casa Cubana has seven addresses, in Jeddah, Riyadh and Khobar.',
  `description_es` = 'Tienda Habanos de Yeda, Palestine Street, en el barrio de Al Hamra, registrada por Habanos S.A. con el nombre La Casa Cubana, Habanos Specialist. La ficha daba antes una Casa del Habano en esta dirección; la red ya no registra ninguna en Arabia Saudita, donde La Casa Cubana tiene siete direcciones, en Yeda, Riad y Khobar.',
  `description_de` = 'Habanos-Geschäft in Dschidda, Palestine Street, im Viertel Al Hamra, von Habanos S.A. unter dem Namen La Casa Cubana als Habanos Specialist geführt. Der Eintrag nannte zuvor eine Casa del Habano an dieser Adresse; das Netz führt in Saudi-Arabien keine mehr, wo La Casa Cubana sieben Adressen hat, in Dschidda, Riad und Khobar.',
  `description_zh` = '吉达的哈瓦那雪茄店，位于哈姆拉区巴勒斯坦街，Habanos S.A. 以 La Casa Cubana 之名将其列为 Habanos Specialist。此前词条写的是这一地址的一家 Casa del Habano；网络在沙特阿拉伯已不再列出任何一家，La Casa Cubana 在吉达、利雅得和胡拜尔共有七处地址。',
  `description_ar` = 'متجر هابانوس في جدّة، شارع فلسطين بحيّ الحمراء، تدرجه Habanos S.A. باسم La Casa Cubana بوصفه Habanos Specialist. كانت البطاقة تذكر من قبل Casa del Habano في هذا العنوان؛ ولم تعد الشبكة تدرج أيًّا منها في السعودية، حيث لدى La Casa Cubana سبعة عناوين في جدّة والرياض والخبر.',
  `updated_at` = NOW()
 WHERE `id` = 113 AND `country_id` = 'saudiarabia';

-- ── 4. Ajoutées : trouvées en cherchant, sourcées par le site du lieu ──
INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `hours`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2566, 'colombia', 'La Cava del Puro — Medellín (El Poblado)', 'Medellín — Carrera 38 no 10A-26, interior 101, El Poblado', 'Cave & Bar', '+57 604 423 6685', 'https://www.lacavadelpuro.com/', 'Lun-Mer 9h-21h, Jeu-Sam 9h-22h, fermé le dimanche', 'lacavadelpuro.com (lu le 17 septembre 2026 : adresse, horaires, téléphone)', 1,
  'Adresse de Medellín de la cave bogotane, carrera 38 no 10A-26, à El Poblado : boutique et bar, cigares cubains, puros colombiens et tabacs. Ouverte du lundi au samedi, fermée le dimanche.',
  'Medellín address of the Bogotá cigar house, Carrera 38 No. 10A-26, in El Poblado: shop and bar, Cuban cigars, Colombian puros and tobaccos. Open Monday to Saturday, closed on Sunday.',
  'Dirección de Medellín de la cava bogotana, carrera 38 n.º 10A-26, en El Poblado: tienda y bar, puros cubanos, puros colombianos y tabacos. Abre de lunes a sábado, cierra el domingo.',
  'Medellíner Adresse des Bogotaer Zigarrenhauses, Carrera 38 Nr. 10A-26, in El Poblado: Laden und Bar, kubanische Zigarren, kolumbianische Puros und Tabake. Montag bis Samstag geöffnet, sonntags geschlossen.',
  '波哥大雪茄店在麦德林的分店，位于埃尔波夫拉多区第38号街10A-26号：店铺与酒吧，经营古巴雪茄、哥伦比亚雪茄和烟草。周一至周六营业，周日休息。',
  'عنوان ميديين لدار السيجار البوغوتية، كاريرا 38 رقم 10A-26 في إل بوبلادو: متجر وبار، سيجار كوبي وسيجار كولومبي وتبغ. يفتح من الاثنين إلى السبت، ويغلق يوم الأحد.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2566);
INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `hours`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2567, 'colombia', 'La Cava del Puro — Cartagena (Centro Histórico)', 'Cartagena — Calle Gastelbondo, edificio Gastelbondo no 36-3, local 104, Centro Histórico', 'Cave & Bar', '+57 315 687 4444', 'https://www.lacavadelpuro.com/', 'Lun-Sam 10h-20h, Dim 10h30-19h', 'lacavadelpuro.com (lu le 17 septembre 2026 : adresse, horaires, téléphone)', 1,
  'Adresse de Carthagène de la cave bogotane, calle Gastelbondo, dans le centre historique : boutique et bar, cigares cubains, puros colombiens et tabacs. Ouverte tous les jours.',
  'Cartagena address of the Bogotá cigar house, Calle Gastelbondo, in the historic centre: shop and bar, Cuban cigars, Colombian puros and tobaccos. Open every day.',
  'Dirección de Cartagena de la cava bogotana, calle Gastelbondo, en el centro histórico: tienda y bar, puros cubanos, puros colombianos y tabacos. Abre todos los días.',
  'Cartagena-Adresse des Bogotaer Zigarrenhauses, Calle Gastelbondo, im historischen Zentrum: Laden und Bar, kubanische Zigarren, kolumbianische Puros und Tabake. Täglich geöffnet.',
  '波哥大雪茄店在卡塔赫纳的分店，位于历史中心加斯特尔邦多街：店铺与酒吧，经营古巴雪茄、哥伦比亚雪茄和烟草。每天营业。',
  'عنوان قرطاجنة لدار السيجار البوغوتية، شارع غاستلبوندو في المركز التاريخي: متجر وبار، سيجار كوبي وسيجار كولومبي وتبغ. يفتح كلّ يوم.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2567);

-- Leur carte (156) : la ligne ici, les octets par tools/placeholders.php --tout, des deux côtés
INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 476, 2566, 'placeholder_2566.jpg', 1, 1, 'admin', 1, NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2566);
INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 477, 2567, 'placeholder_2567.jpg', 1, 1, 'admin', 1, NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2567);

-- ── 5. Réseaux : l'annuaire habanos.com, lu à la machine ──
-- 5a. Absentes de l'annuaire : dépubliées, comme en 135 et 142
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : la Géorgie y compte treize lieux, aucune Casa del Habano — et la fiche rangeait Tbilissi en Azerbaïdjan', `updated_at` = NOW()
 WHERE `id` = 145 AND `country_id` = 'azerbaijan';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : en Belgique, le réseau a Anvers, Bruxelles et Knokke ; à Gand, Limburgstraat, l''enseigne est La Casa del Tabaco, chaîne belge classée Habanos Specialist', `updated_at` = NOW()
 WHERE `id` = 54 AND `country_id` = 'belgium';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : le Cambodge y compte huit lieux, dont le Cohiba Atmosphere du Raffles, aucune Casa del Habano', `updated_at` = NOW()
 WHERE `id` = 138 AND `country_id` = 'cambodia';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : au Canada, le réseau n''a que Windsor, 358 Ouellette Avenue', `updated_at` = NOW()
 WHERE `id` = 153 AND `country_id` = 'canada';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : au Canada, le réseau n''a que Windsor, 358 Ouellette Avenue', `updated_at` = NOW()
 WHERE `id` = 154 AND `country_id` = 'canada';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : la Croatie y compte six lieux (Havana Cigar Shop à Zagreb, Split et Rovinj), aucune Casa del Habano', `updated_at` = NOW()
 WHERE `id` = 79 AND `country_id` = 'croatia';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : à Chypre, le réseau a Limassol, Nicosie et Paphos ; Larnaca y compte 75 lieux, aucune Casa del Habano', `updated_at` = NOW()
 WHERE `id` = 73 AND `country_id` = 'cyprus';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : au Mexique, le réseau a Cancún, Cozumel, Hermosillo, Loreto, Los Cabos, Mexico, Monterrey, Playa del Carmen, Saltillo, San Miguel de Allende et Tijuana — pas León', `updated_at` = NOW()
 WHERE `id` = 192 AND `country_id` = 'mexico';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : le réseau n''a plus de Casa del Habano en Arabie saoudite ; La Casa Cubana, Habanos Specialist, est à Riyad (Makkah Al Mukarramah Branch Rd, Al Olaya) et au Crowne Plaza RDC', `updated_at` = NOW()
 WHERE `id` = 114 AND `country_id` = 'saudiarabia';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : le réseau n''a plus de Casa del Habano en Arabie saoudite ; à Khobar, La Casa Cubana, Habanos Specialist, est 4733 Prince Faisal Bin Fahd Road', `updated_at` = NOW()
 WHERE `id` = 115 AND `country_id` = 'saudiarabia';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : en Corée, le réseau a quatre Habanos Specialists (Seoul Cigar Divan, Pierre Cigar Divan, The Pierre Cigar Club, Casa Habano Busan), aucune Casa del Habano', `updated_at` = NOW()
 WHERE `id` = 131 AND `country_id` = 'southkorea';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : aucune Casa del Habano parmi ses 123 lieux espagnols ; Club Pasión Habanos est calle Ferraz 2 (clubpasionhabanos.com), pas paseo de Recoletos', `updated_at` = NOW()
 WHERE `id` = 30 AND `country_id` = 'spain';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : en Ukraine, la seule Casa del Habano est à Jytomyr ; Kiev y compte des dizaines de lieux (Fortuna Cigar House), aucune Casa del Habano', `updated_at` = NOW()
 WHERE `id` = 84 AND `country_id` = 'ukraine';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : l''Albanie n''y a qu''un lieu, La Casa del Habano de Tirana ; aucun Cohiba Atmosphere', `updated_at` = NOW()
 WHERE `id` = 66 AND `country_id` = 'albania';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : aucun Cohiba Atmosphere en Belgique ; à Anvers, le réseau a La Casa del Habano, Ernest Van Dijckkaai 11', `updated_at` = NOW()
 WHERE `id` = 56 AND `country_id` = 'belgium';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : aucun Cohiba Atmosphere parmi ses 28 lieux brésiliens ; à Rio, le réseau a l''Esch Café (Leblon, Centro)', `updated_at` = NOW()
 WHERE `id` = 471 AND `country_id` = 'brazil';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : en Chine, les Cohiba Atmosphere sont à Pékin et à Chengdu', `updated_at` = NOW()
 WHERE `id` = 124 AND `country_id` = 'china';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : en Chine, les Cohiba Atmosphere sont à Pékin et à Chengdu', `updated_at` = NOW()
 WHERE `id` = 125 AND `country_id` = 'china';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : en Chine, les Cohiba Atmosphere sont à Pékin et à Chengdu', `updated_at` = NOW()
 WHERE `id` = 377 AND `country_id` = 'china';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : aucun Cohiba Atmosphere au Mexique ; à Cancún, le réseau a La Casa del Habano, Plaza Sands, Kukulcan km 12.7', `updated_at` = NOW()
 WHERE `id` = 194 AND `country_id` = 'mexico';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 17 septembre 2026 : absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : aucun Cohiba Atmosphere en Corée ; à Busan, le réseau a Casa Habano Busan, Habanos Specialist, à une autre adresse', `updated_at` = NOW()
 WHERE `id` = 689 AND `country_id` = 'southkorea';

-- 5b. Nommées Casa del Habano par l'annuaire, classées Habanos Specialist : la source le dit
UPDATE `lounges` SET `source` = 'habanos.com, fiche La Casa Del Habano – Oman, Oasis by the Sea, Shatty al Qurum, classée Habanos Specialist (lue le 17 septembre 2026) — le nom reste, la boutique n''est plus dans la liste des Casas del Habano ; type et téléphone pris à l''annuaire', `type` = 'Habanos Specialist (ex-Casa del Habano)', `phone` = '+968 24 69 31 41', `updated_at` = NOW()
 WHERE `id` = 112 AND `country_id` = 'oman';
UPDATE `lounges` SET `source` = 'habanos.com, fiche La Casa Del Habano, Chiangmai, 1/5 Soi 9 Nimmanhemin Road, classée Habanos Specialist (lue le 17 septembre 2026) — le nom reste, la boutique n''est plus dans la liste des Casas del Habano ; type et téléphone pris à l''annuaire', `type` = 'Habanos Specialist (ex-Casa del Habano)', `phone` = '+66 88 251 3691', `updated_at` = NOW()
 WHERE `id` = 2497 AND `country_id` = 'thailand';

-- 5c. Pays que l'annuaire en ligne ne couvre pas : on ne conclut rien, on l'écrit
UPDATE `lounges` SET `source` = CONCAT(`source`, ' ; l''annuaire en ligne habanos.com (4 437 lieux, lu le 17 septembre 2026) ne couvre pas ce pays'), `updated_at` = NOW()
 WHERE `id` IN (12, 13, 17, 163, 165, 166, 167, 168, 169, 170, 172, 173, 2542) AND `is_verified` = 1 AND `source` NOT LIKE '%17 septembre 2026%';

-- 5d. Présentes : 97 fiches dont le réseau a une entrée dans la ville — la source prend la date
UPDATE `lounges` SET `source` = CONCAT(`source`, ' — annuaire habanos.com lu le 17 septembre 2026 : une entrée du réseau dans cette ville'), `updated_at` = NOW()
 WHERE `id` IN (14, 15, 16, 39, 40, 41, 42, 43, 44, 45, 46, 50, 52, 53, 55, 58, 59, 60, 62, 64, 65, 67, 68, 69, 70, 71, 72, 74, 75, 76, 78, 80, 81, 82, 83, 85, 86, 87, 88, 91, 92, 94, 96, 97, 98, 99, 101, 102, 103, 104, 105, 106, 108, 109, 110, 111, 116, 118, 122, 123, 126, 127, 128, 130, 134, 136, 137, 139, 140, 155, 156, 157, 158, 161, 162, 164, 174, 175, 176, 177, 178, 185, 187, 188, 190, 191, 193, 197, 330, 366, 382, 384, 1171, 2561, 2562, 2563, 2564) AND `is_verified` = 1 AND `source` NOT LIKE '%17 septembre 2026%';

-- ── Les sceaux des traductions réécrites, depuis la colonne ──
INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'lounges', l.`id`, 'description', g.lang, SHA1(l.`description`), 'machine', NOW()
  FROM `lounges` l
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de' UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') g
 WHERE l.`id` IN (745, 750, 2554, 1107, 144, 113, 2566, 2567)
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `statut` = 'machine', `maj` = NOW();

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 232';
INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',814,'aucune trace du restaurant ni de son fumoir — nom, adresse, téléphone, en français et en anglais, deux lecteurs ; l''annuaire des restaurants d''ACI 2000 ne le cite pas ; à rétablir si une adresse est apportée'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',473,'aucune trace à SHS Quadra 01 ; la liste des tabacarias du Distrito Federal d''Emporium Cigars, distributeur Habanos au Brésil, en cite quatre (Aladdin Asa Norte et Asa Sul, Amerê, El Club Privado), pas celle-ci ; la Casa do Charuto active est à Salvador de Bahia'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',744,'habanos.com et casadelhabanochile.cl ne connaissent qu''une Casa del Habano au Chili, à l''hôtel W de Las Condes — la fiche 159 —, rien avenue Providencia, et le téléphone n''est pas le sien'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',412,'aucune trace au 230 SW 2nd St ni sous ce nom à Fort Lauderdale ; le Tobacco Road de Floride était un bar de Miami, fermé et démoli en 2014'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',413,'havanaconnections.com, Virginia''s Humidor, n''a d''adresses qu''en Virginie ; rien à Tampa'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',647,'aucune trace en hébreu ni en anglais ; la liste des boutiques d''Arena Mall (arenamall.co.il) n''a pas d''enseigne de cigares'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',368,'aucune trace en japonais ni en anglais ; Okitayamacho n''est aucun des 262 quartiers de Higashiyama-ku, et le téléphone n''est associé à rien'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',690,'aucune trace en coréen ni en anglais ; Sinchon-ro 141 est le grand magasin U-PLEX Sinchon (Hyundai), qui n''annonce aucun espace cigares'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',685,'aucune trace en chinois ni en anglais sur Fuxing South Road ; le téléphone n''est associé à aucun commerce'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',625,'aucune trace en turc ni en anglais ; le 67 Meşrutiyet Caddesi abrite un restaurant et un cabinet d''architecture'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',627,'le 168 Neyzen Tevfik Caddesi est le DoubleTree by Hilton Bodrum Marina Vista, qui n''annonce aucune enseigne Cigara'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',2537,'l''hôtel, Noom Hotel Dakar Sea Plaza depuis janvier 2025 (teyliom.com, 23 janvier 2025), publie la liste de ses bars — Onyx Bar, Rooftop Bar, Infinity Pool Bar (mangalis.com) —, aucun n''est un salon cigares ; et il est route de la Corniche Ouest, pas route de King Fahd'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',2538,'l''hôtel publie la liste de ses bars et restaurants — Lounge Bar, Le Dizzy Bar, Les Jardins de l''Océan, Le Manguier (kingfahdpalacehotels.com) —, aucune terrasse cigares'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',2539,'l''hôtel publie la liste de ses bars et restaurants — La Terrasse, Le Solarium, Le Grain de Sel, Le Diamono, Le Cube, le casino (terroubi.com) —, aucun espace cigares'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',2540,'le restaurant publie ce qu''il offre — salle sur pilotis, ponton, plage privée, salle de fitness, ouvert de 9 h à minuit (lelagondakar.com) —, aucun fumoir'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',916,'l''hôtel est le Zenit Diplomatic, avenue de Tarragone, pas Antic Carrer Major ; il publie ses espaces (diplomatic.zenithoteles.com : restaurant Diplomatic, salles, piscine), aucun salon cigares'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',2547,'la page officielle Accor du Novotel Cotonou Orisha détaille ses deux bars — Pendjari, Bar Terrasse Piscine (all.accor.com) —, aucun coin cigares'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',811,'aucune trace du Polo Club Cigar Lounge sur Tlokweng Road, à deux lecteurs ; seul un Nairobi Polo Club, au Kenya, répond à ce nom'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',1152,'plusieurs hôtels La Falaise existent à Douala — Résidence La Falaise, boulevard de la Liberté, à Akwa ; La Falaise Bonapriso, rue Njo-Njo —, aucun rue Flatters, et aucun n''annonce d''espace cigares : on ignore de quel établissement la fiche parle'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',2549,'l''hôtel publie ses bars — un Lounge Bar et un bar de piscine (mangalis.com) —, aucun salon cigares'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',2543,'l''hôtel publie la liste de ses restaurants et bars — Dawa Dawa, Sika Sika, Le Mono, Le Sio (sarakawa-hotel.com) —, aucun bar à cigares'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',2544,'aucun hôtel Mercure distinct du Sarakawa n''est localisé à Lomé ; Wikipédia et les sites de réservation parlent d''un Mercure Sarakawa, boulevard du Mono, dont le site officiel ne mentionne ni la marque Mercure ni un salon cigares'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',237,'aucune trace au 11 place de la Cathédrale, à deux lecteurs ; les caves du quartier sont La Régence, rue du 22-Novembre, et Le Comptoir du Cigare, rue du Vieux-Marché-aux-Poissons'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',238,'aucune trace au 24 place Stanislas, à deux lecteurs ; le buraliste de la place est Le Royal, au no 1, et la cave citée de Nancy est Le Héré, rue Saint-Nicolas'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',329,'aucune trace via degli Orefici, à deux lecteurs ; aucune tabaccheria parmi les sept boutiques historiques du Quadrilatero'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',249,'aucune trace au 16 Gran Vía, à deux lecteurs ; les estancos de la Gran Vía sont aux nos 50 et 59'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',250,'Club Pasión Habanos est un club madrilène, calle Ferraz 2 (clubpasionhabanos.com ; événements habanos.com à Madrid et Séville) ; rien au 84 Passeig de Gràcia — le Majestic Cigar''s Bar, au 68, a fermé en janvier 2011'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',252,'aucune trace au 65 calle Sierpes, à deux lecteurs ; les points de vente Habanos de Séville (habanos.com) sont calle Lineros 11, O''Donnell 30B, Pastor y Landero 41 et Arjona 6'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',254,'aucune trace calle Nueva à Málaga, à deux lecteurs ; les Tabaco & Ron homonymes sont au Panama et à Saint-Domingue'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',257,'aucune trace au 18 calle San Marcial, à deux lecteurs ; la cave citée de Donostia est l''Estanco 31 de Agosto'),
  (NULL,'migration 232','systeme','fiche_relue_gardee','lounge',2555,'l''hôtel existe (azalai.com : restaurant Gourmet, un bar, une terrasse, une piscine), son salon cigares n''est décrit nulle part'),
  (NULL,'migration 232','systeme','fiche_relue_gardee','lounge',2541,'l''hôtel est proposé à la réservation pour 2025-2026 sur les plateformes du voyage, aucun site officiel n''a répondu, son bar à cigares n''est décrit nulle part'),
  (NULL,'migration 232','systeme','fiche_relue_gardee','lounge',951,'l''hôtel existe (azadihotel.com : restaurants Parse, Kenzo, Parmin, Sarv, spa), une salle fumeurs figure parmi ses équipements en persan, aucun bar à cigares n''est décrit'),
  (NULL,'migration 232','systeme','fiche_relue_gardee','lounge',2546,'l''hôtel existe (hoteldulac-benin.com : restaurant, piscine, spa au bord du lac Nokoué), son fumoir n''est décrit nulle part ; le site donne le +229 01 21 33 19 19, la fiche portait le +229 21 31 35 00'),
  (NULL,'migration 232','systeme','fiche_relue_gardee','lounge',2552,'l''hôtel Laïco existe, son site (laicohotels.com) ne se lit pas depuis un robot, aucune presse consultable ne décrit son bar à cigares'),
  (NULL,'migration 232','systeme','fiche_relue_gardee','lounge',2553,'l''hôtel existe — 147 chambres, rouvert après l''attentat du 15 janvier 2016 —, un guide le place avenue Kwame N''Krumah, la fiche avenue de l''Indépendance, les deux sont écrits ; le site que la fiche annonçait ne résout plus ; aucune source ne décrit son VIP lounge'),
  (NULL,'migration 232','systeme','fiche_relue_gardee','lounge',2550,'l''hôtel existe (ouvert en juin 2013, quartier Camayenne), son site n''a pas répondu — certificat expiré —, son fumoir n''est décrit nulle part'),
  (NULL,'migration 232','systeme','fiche_relue_gardee','lounge',4,'son compte Instagram, porté sur la fiche, donne les deux adresses, Diamond Center à Beverly Hills et rue du Docteur Blanchard en Zone 4 ; aucun site ni presse'),
  (NULL,'migration 232','systeme','fiche_relue_gardee','lounge',5,'son compte Instagram, porté sur la fiche, donne les deux adresses, Diamond Center à Beverly Hills et rue du Docteur Blanchard en Zone 4 ; aucun site ni presse'),
  (NULL,'migration 232','systeme','fiche_corrigee','lounge',745,'Enjoy Casino Viña del Mar — Habanos Lounge — habanos.com, fiche Enjoy Casino – Viña del Mar : Habanos Lounge et Habanos Terrace, distributeur exclusif Puro Tabaco S.A. (lue le 17 septembre 2026) '),
  (NULL,'migration 232','systeme','fiche_corrigee','lounge',750,'La Cava del Puro — Bogotá (Zona Rosa) — lacavadelpuro.com (lu le 17 septembre 2026 : adresses, horaires, téléphones de Bogotá, Medellín et Carthagène) — la fiche portait un Cigar Club Bogotá'),
  (NULL,'migration 232','systeme','fiche_corrigee','lounge',2554,'Azalaï Hôtel Bamako (ex-Hôtel Salam) — Espace Cigares — à vérifier — relu le 17 septembre 2026 : l''hôtel existe, sous le nom Azalaï Hôtel Bamako (azalai.com : restaurant Nomad, deux bars, terrasse, piscine,'),
  (NULL,'migration 232','systeme','fiche_corrigee','lounge',1107,'Hotel Altamira Suites — Cigar Lounge — à vérifier — relu le 17 septembre 2026 : l''hôtel existe (alsuites.com, page Restaurantes & Bar Lounge, bar sur le toit, illisible ce jour — certificat'),
  (NULL,'migration 232','systeme','fiche_corrigee','lounge',144,'C-Gars Lounge — Bakou (Babek Avenue) — habanos.com, fiche C-Gars Lounge, Habanos Point, Babek Avenue 21/99 (lue le 17 septembre 2026) — la fiche portait une Casa del Habano à cette adresse,'),
  (NULL,'migration 232','systeme','fiche_corrigee','lounge',113,'La Casa Cubana — Jeddah (Palestine Street) — habanos.com, fiche La Casa Cubana, Palestine Street, Habanos Specialist (lue le 17 septembre 2026) — la fiche portait une Casa del Habano à cette adre'),
  (NULL,'migration 232','systeme','fiche_ajoutee','lounge',2566,'La Cava del Puro — Medellín (El Poblado) — lacavadelpuro.com (lu le 17 septembre 2026 : adresse, horaires, téléphone)'),
  (NULL,'migration 232','systeme','fiche_ajoutee','lounge',2567,'La Cava del Puro — Cartagena (Centro Histórico) — lacavadelpuro.com (lu le 17 septembre 2026 : adresse, horaires, téléphone)'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',145,'absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : la Géorgie y compte treize lieux, aucune Casa del Habano — et la fiche rangeait Tbilissi en Azerbaïdjan'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',54,'absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : en Belgique, le réseau a Anvers, Bruxelles et Knokke ; à Gand, Limburgstraat, l''enseigne est La Casa del Tabaco, chaîne belge classée Habanos Specialist'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',138,'absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : le Cambodge y compte huit lieux, dont le Cohiba Atmosphere du Raffles, aucune Casa del Habano'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',153,'absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : au Canada, le réseau n''a que Windsor, 358 Ouellette Avenue'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',154,'absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : au Canada, le réseau n''a que Windsor, 358 Ouellette Avenue'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',79,'absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : la Croatie y compte six lieux (Havana Cigar Shop à Zagreb, Split et Rovinj), aucune Casa del Habano'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',73,'absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : à Chypre, le réseau a Limassol, Nicosie et Paphos ; Larnaca y compte 75 lieux, aucune Casa del Habano'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',192,'absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : au Mexique, le réseau a Cancún, Cozumel, Hermosillo, Loreto, Los Cabos, Mexico, Monterrey, Playa del Carmen, Saltillo, San Miguel de Allende et Tijuana — pas León'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',114,'absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : le réseau n''a plus de Casa del Habano en Arabie saoudite ; La Casa Cubana, Habanos Specialist, est à Riyad (Makkah Al Mukarramah Branch Rd, Al Olaya) et au Crowne Plaza RDC'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',115,'absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : le réseau n''a plus de Casa del Habano en Arabie saoudite ; à Khobar, La Casa Cubana, Habanos Specialist, est 4733 Prince Faisal Bin Fahd Road'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',131,'absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : en Corée, le réseau a quatre Habanos Specialists (Seoul Cigar Divan, Pierre Cigar Divan, The Pierre Cigar Club, Casa Habano Busan), aucune Casa del Habano'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',30,'absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : aucune Casa del Habano parmi ses 123 lieux espagnols ; Club Pasión Habanos est calle Ferraz 2 (clubpasionhabanos.com), pas paseo de Recoletos'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',84,'absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : en Ukraine, la seule Casa del Habano est à Jytomyr ; Kiev y compte des dizaines de lieux (Fortuna Cigar House), aucune Casa del Habano'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',66,'absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : l''Albanie n''y a qu''un lieu, La Casa del Habano de Tirana ; aucun Cohiba Atmosphere'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',56,'absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : aucun Cohiba Atmosphere en Belgique ; à Anvers, le réseau a La Casa del Habano, Ernest Van Dijckkaai 11'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',471,'absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : aucun Cohiba Atmosphere parmi ses 28 lieux brésiliens ; à Rio, le réseau a l''Esch Café (Leblon, Centro)'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',124,'absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : en Chine, les Cohiba Atmosphere sont à Pékin et à Chengdu'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',125,'absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : en Chine, les Cohiba Atmosphere sont à Pékin et à Chengdu'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',377,'absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : en Chine, les Cohiba Atmosphere sont à Pékin et à Chengdu'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',194,'absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : aucun Cohiba Atmosphere au Mexique ; à Cancún, le réseau a La Casa del Habano, Plaza Sands, Kukulcan km 12.7'),
  (NULL,'migration 232','systeme','fiche_depubliee','lounge',689,'absente de l''annuaire officiel Habanos S.A. (habanos.com, 4 437 lieux, lu le 17 septembre 2026) : aucun Cohiba Atmosphere en Corée ; à Busan, le réseau a Casa Habano Busan, Habanos Specialist, à une autre adresse'),
  (NULL,'migration 232','systeme','fiche_reseau_requalifiee','lounge',112,'habanos.com, fiche La Casa Del Habano – Oman, Oasis by the Sea, Shatty al Qurum, classée Habanos Specialist (lue le 17 septembre 2026) — le nom reste, la boutique n''est plus dans la liste des Casas del Habano ; type et téléphone pris à l''annuaire'),
  (NULL,'migration 232','systeme','fiche_reseau_requalifiee','lounge',2497,'habanos.com, fiche La Casa Del Habano, Chiangmai, 1/5 Soi 9 Nimmanhemin Road, classée Habanos Specialist (lue le 17 septembre 2026) — le nom reste, la boutique n''est plus dans la liste des Casas del Habano ; type et téléphone pris à l''annuaire'),
  (NULL,'migration 232','systeme','septieme_recensement_lot_19','systeme',0,'43 fiches relues par l''equipe d''agents (expert-cigare, relecteur puis contradicteur) : 30 depubliees, 9 gardees a verifier et datees, 2 corrigees, 2 ajoutees. Reseaux : l''annuaire habanos.com (4 437 lieux) lu a la machine — 97 fiches presentes et datees, 21 absentes depubliees, 2 requalifiees Habanos Specialist, 13 dans des pays non couverts, 2 corrigees ; Davidoff : localisateur partiel, rien conclu');

SELECT
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (814, 473, 744, 412, 413, 647, 368, 690, 685, 625, 627, 2537, 2538, 2539, 2540, 916, 2547, 811, 1152, 2549, 2543, 2544, 237, 238, 329, 249, 250, 252, 254, 257, 145, 54, 138, 153, 154, 79, 73, 192, 114, 115, 131, 30, 84, 66, 56, 471, 124, 125, 377, 194, 689) AND `is_verified` = 0 AND `source` LIKE 'RETIRÉ — relu le 17 septembre 2026%') = 51 AS depubliees,
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (2555, 2541, 951, 2546, 2552, 2553, 2550, 4, 5, 2554, 1107) AND `is_verified` = 1 AND `source` LIKE '%— relu le 17 septembre 2026 : %') = 11 AS gardees_datees,
  (SELECT `name` = 'Enjoy Casino Viña del Mar — Habanos Lounge' AND `city` LIKE '%%199%%' FROM `lounges` WHERE `id` = 745) AS enjoy_corrigee,
  (SELECT `name` LIKE 'La Cava del Puro%%' AND `website` = 'https://www.lacavadelpuro.com/' FROM `lounges` WHERE `id` = 750) AS cava_corrigee,
  (SELECT `name` LIKE 'Azalaï Hôtel Bamako%%' FROM `lounges` WHERE `id` = 2554) AS salam_renomme,
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (2566, 2567) AND `country_id` = 'colombia' AND `is_verified` = 1) = 2 AS deux_ajoutees,
  (SELECT COUNT(*) FROM `translation_status` t JOIN `lounges` l ON l.`id` = t.`entite_id` WHERE t.`entite` = 'lounges' AND t.`champ` = 'description' AND l.`id` IN (745, 750, 2554, 1107, 144, 113, 2566, 2567) AND t.`source_hash` = SHA1(l.`description`)) = 40 AS sceaux_a_jour,
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (12, 13, 14, 15, 16, 17, 39, 40, 41, 42, 43, 44, 45, 46, 50, 52, 53, 55, 58, 59, 60, 62, 64, 65, 67, 68, 69, 70, 71, 72, 74, 75, 76, 78, 80, 81, 82, 83, 85, 86, 87, 88, 91, 92, 94, 96, 97, 98, 99, 101, 102, 103, 104, 105, 106, 108, 109, 110, 111, 112, 116, 118, 122, 123, 126, 127, 128, 130, 134, 136, 137, 139, 140, 155, 156, 157, 158, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 172, 173, 174, 175, 176, 177, 178, 185, 187, 188, 190, 191, 193, 197, 330, 366, 382, 384, 1171, 2497, 2542, 2561, 2562, 2563, 2564) AND `is_verified` = 1 AND `source` LIKE '%le 17 septembre 2026%') = 112 AS reseaux_dates,
  (SELECT COUNT(*) FROM `lounges` WHERE CHAR_LENGTH(`source`) >= 495) = 0 AS aucune_source_tronquee,
  (SELECT COUNT(*) FROM `lounge_photos` WHERE `lounge_id` IN (2566, 2567)) = 2 AS deux_cartes;
SELECT COUNT(*) AS publiables FROM `lounges` WHERE `is_verified` = 1;