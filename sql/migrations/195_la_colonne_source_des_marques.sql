-- ════════════════════════════════════════════════════════
-- 195 — `brands.source` : rendre visible la seule chose que
--       cet atlas fait mieux que les autres
-- ────────────────────────────────────────────────────────
-- LE MANQUE. `lounges` porte une colonne `source` depuis toujours, et
-- 407 fiches sur 408 en remplissent une. `brands` n'en avait pas. La
-- doctrine du projet est « aucune fiche sans source » — elle etait donc
-- verifiable pour les caves et invisible pour les maisons, alors que
-- les maisons sont ce que l'atlas ecrit le plus.
--
-- ── CE QUI EST REMPLI, ET CE QUI NE L'EST PAS ───────────
-- Les sources ne sont PAS inventees. Elles sont reprises des en-tetes
-- des migrations qui ont ecrit ces fiches — 171, 173, 174, 176, 180 a
-- 194 —, ou elles etaient deja consignees, en commentaire, hors de
-- portee du lecteur. Cette migration ne fait que les deplacer du
-- commentaire vers la base.
--
-- Environ soixante marques sur 182 en recoivent une. LES AUTRES RESTENT
-- A NULL, et c'est le point. Leur source n'a jamais ete enregistree ;
-- en fabriquer une pour faire propre serait exactement la faute que
-- `tools/sources.php` a ete ecrit pour attraper — vingt-huit domaines
-- cites qui n'existaient pas. Une source absente est honnete ; une
-- source inventee donne l'apparence de la verification.
--
-- La colonne dit donc AUSSI le trou, et le trou est mesurable.
--
-- ── UN CAS QUI MERITE SA PRECISION ──────────────────────
-- OLIVA, ROCKY PATEL, E.P. CARRILLO et JOYA DE NICARAGUA n'ont recu de
-- source QUE POUR LEUR PARAGRAPHE BLACK SWAN (migration 194). Le reste
-- de leur fiche est anterieur et n'a pas de source enregistree. Le
-- champ le dit mot pour mot, plutot que de laisser croire que la
-- citation couvre la fiche entiere.
--
-- ── CE QUE LE CHAMP N'EST PAS ───────────────────────────
-- Ce n'est pas un `source_url` : c'est du TEXTE LIBRE, comme chez
-- `lounges`. Il porte des domaines, des titres d'articles, parfois une
-- mention non electronique. `tools/sources.php` en extrait les domaines
-- et verifie qu'ils resolvent — il mesure la tracabilite, pas la
-- veracite.
--
-- Le prefixe « a verifier » garde ici le sens qu'il a chez `lounges` :
-- ce n'est pas une source, c'est son absence declaree, et la page rend
-- une reserve traduite au lieu de la citation.
-- ════════════════════════════════════════════════════════

ALTER TABLE `brands`
  ADD COLUMN `source` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL
             COMMENT 'D''ou vient la fiche. Texte libre, comme lounges.source.'
             AFTER `factory`;

UPDATE `brands` SET `source` = CASE `name`

-- ── 171 ──────────────────────────────────────────────────
WHEN 'Trinidad USA' THEN 'altadisusa.com (page officielle Trinidad Santiago) ; cigaraficionado.com ; cigar-coop.com'

-- ── 173 — les marques non cubaines homonymes ─────────────
WHEN 'Bolívar Honduras' THEN 'cigaraficionado.com (Villazon, HATSA, Estélo Padrón) ; cigarjournal.com et cigar-coop.com (répartition General Cigar / Forged) ; cigar-coop.com « STG Discontinues Lines under Bolivar, El Rico Habano, and Helix Brands » (retrait du tarif, octobre 2024)'
WHEN 'El Rey del Mundo Honduras' THEN 'en.wikipedia.org (El Rey del Mundo) ; cigaraficionado.com (Villazon)'
WHEN 'Saint Luis Rey Honduras' THEN 'halfwheel.com (Saint Luis Rey Tabacales) ; cigaraficionado.com'
WHEN 'Gispert' THEN 'en.wikipedia.org (Gispert) ; cigarjournal.com'
WHEN 'La Gloria Cubana Dominicaine' THEN 'cigaraficionado.com (El Crédito, Miami 1972) ; cigarjournal.com'
WHEN 'H. Upmann Dominicain' THEN 'cigaraficionado.com (Tabacalera de García, La Romana)'
WHEN 'Henry Clay' THEN 'cigaraficionado.com (Tabacalera de García) ; cigar-coop.com'
WHEN 'Por Larrañaga Dominicain' THEN 'en.wikipedia.org (Por Larrañaga) ; cigar-coop.com'
-- ⚠ La 173 avait cree « Fonseca Dominicain » ; la 175 l'a corrigee et
-- renommee. C'est LA fiche ou une source perimee a produit une erreur,
-- et le champ le dit.
WHEN 'Fonseca Nicaraguayen' THEN 'cigaraficionado.com, fiche « Fonseca (Non-Cuban) » (reprise par la famille García en décembre 2019, roulée depuis chez My Father à Estelí) — la migration 173 l''avait donnée pour dominicaine sur la foi d''une liste Wikipédia périmée ; corrigée par la 175'

-- ── 174 ──────────────────────────────────────────────────
WHEN 'Bongani' THEN 'moodiedavittreport.com (entretien avec le fondateur) ; riotimesonline.com ; cigars-connect.com ; houseofgrauer.com'

-- ── 176 — trois usines mal attribuées ────────────────────
WHEN 'Davidoff' THEN 'cigaraficionado.com « Kelner — Davidoff''s Tobacco Guru » ; cigarjournal.com (campus Tabadom, Villa González)'
WHEN 'Avo' THEN 'cigaraficionado.com « Kelner — Davidoff''s Tobacco Guru » ; cigarjournal.com (O.K. Cigars, campus Tabadom)'
WHEN 'The Griffin''s' THEN 'cigaraficionado.com ; cigarjournal.com (campus Tabadom)'
WHEN 'Macanudo' THEN 'en.wikipedia.org (Macanudo) ; cigaraficionado.com « Tobacco Man » (General Cigar Dominicana, Santiago)'

-- ── 180 — les sept maisons mères ─────────────────────────
WHEN 'Oettinger Davidoff' THEN 'oettingerdavidoff.com ; cigarjournal.com'
WHEN 'Villiger Söhne' THEN 'villigercigars.com ; cigarjournal.com'
WHEN 'Burger Söhne' THEN 'de.wikipedia.org (Geraldo Dannemann, Burger Söhne) ; dannemann-group.com'
WHEN 'Selected Tobacco' THEN 'halfwheel.com et cigaraficionado.com (Selected Tobacco, Nelson Alfonso)'
WHEN 'Maya Selva Cigars' THEN 'en.wikipedia.org (Maya Selva) ; cigarjournal.com'
WHEN 'Boutique Blends' THEN 'cigarjournal.com « Rafael Nodal: From Asylum Seeker to Master of Boutique Blends » ; en.wikipedia.org (rachat de 2002, associés, marques)'
WHEN 'Forged Cigar Company' THEN 'halfwheel.com et cigaraficionado.com (Forged, Scandinavian Tobacco Group)'

-- ── 181 — les deux marques hautes de J.C. Newman ─────────
WHEN 'Cuesta-Rey' THEN 'jcnewman.com (fiches Cuesta-Rey : gammes, capes, vitoles) ; en.wikipedia.org (fondation 1884 à Ybor City, clear Havana, production dominicaine depuis les années 1980)'
WHEN 'Diamond Crown' THEN 'jcnewman.com (fiches Diamond Crown, Maximus, Julius Caeser) ; cigarjournal.com « J. C. Newman Cigar Co. — America''s Oldest Cigar Family » (diamètre uniforme de 54, rachat de 1958) ; en.wikipedia.org (Diamond Crown Maximus)'

-- ── 182 — les Canaries ───────────────────────────────────
WHEN 'Dos Santos' THEN 'dossantossa.com (histoire, générations, volumes, exportations, fiche La Regenta)'
WHEN 'Montealto' THEN 'eldiario.es « El puro palmero es un producto estrella único y espectacular » (Compañía Insular de Tabaco de La Palma : 1917, Las Vueltas, associés, marques, volumes)'
WHEN 'Puros Artesanos Julio' THEN 'purosartesanosjulio.com et lapalmabiosfera.es (1950, 2000, plantation, lignes)'
WHEN 'Finca Tabaquera El Sitio' THEN 'diariodeavisos.com « Finca El Sitio, reserva tabaquera de Europa » (surfaces, cultivo bajo telón, Antonio González)'
WHEN 'Canaritos' THEN 'cigarworld.de (Güímar, shortfiller roulé main, proportions)'
WHEN 'Kolumbus' THEN 'kolumbuscigars.ch et zigarren.zone (longfiller palmero, variété Breña, caves de cèdre, Track & Trace) — la maison ne publie ni les noms des fondateurs ni son année'
WHEN 'Vargas' THEN 'humolatino.com (1925, Santa Cruz de La Palma, Enrique Vargas de Paz et son frère Felipe) ; sources publiques sur le mildiou bleu de 1967'

-- ── 183 ──────────────────────────────────────────────────
WHEN 'Nicoya' THEN 'cigarjournal.com « New boutique cigar line honors people of Nicaragua » (Gerard Hayes, 2016, A.J. Fernández) ; halfwheel.com « Nicoya Cigars to Make U.S. Debut at 2016 IPCPR » ; abc.net.au « Growers agree to leave Myrtleford tobacco industry » (octobre 2006)'

-- ── 185 — la scène boutique, premier lot ─────────────────
WHEN 'Dunbarton Tobacco & Trust' THEN 'dunbartoncigars.com et halfwheel.com (Steve Saka, 2015, Joya de Nicaragua et NACSA, les quatre assemblages)'
WHEN 'RoMa Craft Tobac' THEN 'halfwheel.com « Rosales and Martin Launch RoMa Craft Tobac » et tobaccobusiness.com (le garage d''Esteban Disla, NicaSueño)'
WHEN 'Viaje' THEN 'cigaraficionado.com (Andre Farkas, le tournant de 2012 : plus de gamme régulière)'
WHEN 'Room101' THEN 'halfwheel.com « Room101 Acquired by STG » et cigar-coop.com (production éclatée A.J. Fernández / Joya de Nicaragua / HATSA)'
WHEN 'L''Atelier' THEN 'cigaraficionado.com (L''Atelier Imports, Pete Johnson, My Father)'
WHEN 'La Aroma de Cuba' THEN 'holts.com (origines cubaines des années 1880, famille Levin) ; cigaraficionado.com (refaite par Pepin García en 2009)'

-- ── 186 — la scène boutique dominicaine ──────────────────
WHEN 'Tabacalera Palma' THEN 'tabacalerapalma.com et cigaraficionado.com « Touring Jochy Blanco''s Farm and the Tabacalera Palma Cigar Factory » (1936, la zone franche de 1995, les générations, les effectifs) ; procigar.org'
WHEN 'Aging Room' THEN 'cigarjournal.com « Rafael Nodal: From Asylum Seeker to Master of Boutique Blends » ; tabacalerapalma.com'
WHEN 'Swag' THEN 'en.wikipedia.org (Boutique Blends : rachat de 2002, associés, marques) ; cigarjournal.com'
WHEN 'Kristoff' THEN 'cigarjournal.com et famous-smoke.com (Glen Case, Rolando Villamil, Charles Fairmorn devenu von Eicken)'
WHEN 'Caldwell Cigar Co.' THEN 'cigar-coop.com et cigardojo.com (Robert Caldwell, 2014, la Tabacalera William Ventura)'
WHEN 'Casa Cuevas' THEN 'halfwheel.com et cigaraficionado.com (Tabacalera Las Lavas, Patrimonio, trois générations)'

-- ── 188 — la scène boutique, second lot ──────────────────
WHEN 'Southern Draw' THEN 'southerndrawcigars.com et famous-smoke.com (Robert et Sharon Holt, 2014, A.J. Fernández, Rose of Sharon)'
WHEN 'HVC Cigars' THEN 'premiumcigars.org et bestcigarprices.com (Havana City, 2011, Aganorsa, la fabrique de 2021)'
WHEN 'Fratello' THEN 'thecigarauthority.com et cigar.com (Omar de Frias, la NASA, Joya de Nicaragua)'
WHEN 'Curivari' THEN 'smokingpipes.com (Andreas Throuvalas, 2003, semence cubaine, procédé cubain)'
WHEN 'Black Label Trading Co.' THEN 'ovejanegracigars.com et premiumcigars.org (James et Angela Brown, 2013, la Fábrica Oveja Negra en 2015, roulé main)'
WHEN 'Padilla' THEN 'cigaraficionado.com « Back in the U.S.A. — Padilla Miami » et padillacigars.com (Heberto Padilla, El Titan de Bronze, Raíces Cubanas)'

-- ── 189 — qui fait quoi ──────────────────────────────────
WHEN 'La Palina' THEN 'lapalinacigars.com « About » (le modèle de négociant, les quatre pays) ; cigar-coop.com « Remembering the Rebirth of La Palina » (la carte des fabriques par gamme) ; cigaraficionado.com (Samuel Paley, la Congress Cigar Company, la relance de 2010)'
WHEN 'Dannemann' THEN 'dannemann-group.com « Our Company » (les trois sites de production et leurs rôles) ; en.wikipedia.org (Dannemann Cigars : groupe suisse, siège allemand)'

-- ── 190 — le cercle Eiroa ────────────────────────────────
WHEN 'CLE Cigar Company' THEN 'cigarjournal.com « Christian Eiroa: The Corojo King » (les trois générations, la vente de Camacho en 2008, CLE en juillet 2012) ; cigaraficionado.com « CLE Cigar Co. »'
WHEN 'Asylum' THEN 'cigarjournal.com « Christian Eiroa: The Corojo King » (Asylum avec Tom Lazuka) ; famous-smoke.com (le partage NACSA / Aladino, l''ancien cinéma du grand-père)'
WHEN 'Oscar Valladares' THEN 'jrcigars.com et cigars.com (2012, Danlí, Hector Valladares et Bayron Duarte, le Leaf by Oscar)'
WHEN 'Micallef' THEN 'micallefcigars.com et cigaraficionado.com « Texas Businessman Sets His Sights On Cigars » (Al Micallef, les frères Gómez Sánchez, la fabrique 1934)'

-- ── 191 ──────────────────────────────────────────────────
WHEN 'Ferio Tego' THEN 'cigar-coop.com et feriotego.com (Herklots, Scott, le rachat des marques Nat Sherman à Altria début 2021) ; cigaraficionado.com « Ferio Tego Metropolitan Selection Shipping Now » et halfwheel.com (le partage Quesada / Plasencia ligne par ligne)'
WHEN 'Paul Garmirian' THEN 'en.wikipedia.org et halfwheel.com (1990, The Gourmet Guide to Cigars, O.K. Cigars et l''Occidental sur le campus Tabadom)'
WHEN 'Gurkha' THEN 'tobaccobusiness.com « Gurkha Cigars Gains Its Own Factory » (mai 2017, American Caribbean Cigars, les volumes de 2012 à 2016) — l''origine de 1887 est un récit de la maison, sans source indépendante'
WHEN 'La Barba' THEN 'tobaccobusiness.com « Rite of Passage » et cigardojo.com (Bellatto et Rossi, le Red de 2013 chez Aladino, le passage chez Ventura)'

-- ── 192 — les commanditaires ─────────────────────────────
WHEN 'Protocol' THEN 'halfwheel.com « Smoke Inn Acquires Cubariqueño Cigar Co.''s Protocol Brand », cigardojo.com et stogiepress.com (Cancel et Ives, policiers, 2015, La Zona, Hector Alfonso Sr., San Lotano)'
WHEN 'Regius' THEN 'cigaraficionado.com « Q&A: Akhil Kapacee of Regius Cigars » et cigar-coop.com (2010, Londres, Plasencia à Estelí)'
WHEN 'Cornelius & Anthony' THEN 'cigarjournal.com « The Bailey Family''s Tobacco History » et cigaraficionado.com (S&M Brands, 2015, La Zona, El Titan de Bronze)'
WHEN '262 Cigars' THEN 'halfwheel.com « Portraits: Clint Aaron » et cigar-coop.com (2008, Revolution Cigars, février 1962, Paradigm en 2010, Carreras et TacaNicsa, la vente à Madison Money en juin 2019)'
WHEN 'Emilio Cigars' THEN 'cigar-coop.com « Cigar Review: Emilio AF1 » et halfwheel.com (Gary Griffith, Delaware Cigars, My Father, Mousa, la Fábrica Oveja Negra)'
WHEN 'Nomad' THEN 'halfwheel.com « Ezra Zion Buys Nomad Cigar Co. » et cigardojo.com (Tabacalera L&V, A.J. Fernández, Oveja Negra, la vente de septembre 2018)'
WHEN '7-20-4' THEN 'cigar-coop.com « 7-20-4 Line Shifts to J. Fuego Factory in Nicaragua » (juillet 2021) ; cigarinspector.com et thecigarauthority.com (R.G. Sullivan, 724 Elm Street, 1874, la fermeture de 1962, Tabacos de Oriente, Factory 57)'

-- ── 193 — ceux qui possèdent leur atelier ────────────────
WHEN 'Cuban Crafters' THEN 'cigaraficionado.com « Kiki Berger of Cuban Crafters, 56, Dies » et cigarinspector.com (Max Berger, 1996, la Tabacalera Estelí, Karen Berger)'
WHEN 'Vegas de Santiago' THEN 'vegassantiago.com, cigars-vegasantiago.biz et casagranda-cigars.de (Marc Niehaus, Puriscal, 1 100 m, Luis Santana Lamas, Chaman, les bagues privées) — aucune de ces sources ne donne l''année de fondation'
WHEN 'De Los Reyes Cigars' THEN 'cigaraficionado.com « De Los Reyes — A Field and a Factory » et cigarcountry.com (1995, Augusto, Leo et Nirka Reyes, deux à deux millions et demi de cigares par an)'
WHEN 'Menendez Amerino' THEN 'menendezamerino.com et correiobraziliense.com.br (1977, São Gonçalo dos Campos, Alonso Menendez en 1980, Dona Flor en 1982, roulage intégralement artisanal)'
WHEN 'Don Tomas' THEN 'cigars-connect.com « What''s new at Don Tomas », neptunecigar.com et en.wikipedia.org (1975, U.S. Tobacco, HATSA, Estélo Padrón, Swedish Match en 2004, Scandinavian Tobacco Group)'
WHEN 'Dona Flor' THEN 'menendezamerino.com et correiobraziliense.com.br (la fabrique de São Gonçalo dos Campos, le lancement de 1982) — la fiche a été corrigée par la migration 193'

-- ── 194 — Black Swan : SOURCE PARTIELLE, ET LE CHAMP LE DIT
WHEN 'Joya de Nicaragua' THEN 'stogiephile.blog et cigarpage.com (édition Black Swan de 2025 UNIQUEMENT) — le reste de la fiche est antérieur et n''a pas de source enregistrée'
WHEN 'Oliva' THEN 'stogiephile.blog « Oliva Black Swan? Rocky Patel Black Swan? WTF? » (édition Black Swan de 2023 UNIQUEMENT) — le reste de la fiche est antérieur et n''a pas de source enregistrée'
WHEN 'Rocky Patel' THEN 'stogiephile.blog « Oliva Black Swan? Rocky Patel Black Swan? WTF? » (édition Black Swan de janvier 2024 UNIQUEMENT) — le reste de la fiche est antérieur et n''a pas de source enregistrée'
WHEN 'E.P. Carrillo' THEN 'cigarpage.com et stogiephile.blog (édition Black Swan UNIQUEMENT) — le reste de la fiche est antérieur et n''a pas de source enregistrée'

ELSE `source` END,
`updated_at` = NOW();

-- ── Le compte, qui dit autant le rempli que le trou ──────
-- Un UPDATE ... CASE qui rate un nom ne dit rien et sort en succes.
SELECT COUNT(*)                                               AS marques,
       SUM(`source` IS NOT NULL AND `source` <> '')           AS sourcees,
       SUM(`source` IS NULL OR `source` = '')                 AS sans_source
  FROM `brands`;

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 195','systeme','colonne_source_ajoutee_aux_marques','marque',0,
   'brands.source varchar(500), meme forme et meme role que lounges.source, qui existe depuis toujours et que 407 fiches sur 408 remplissent. La doctrine « aucune fiche sans source » etait donc verifiable pour les caves et INVISIBLE pour les maisons, alors que les maisons sont ce que l atlas ecrit le plus'),
  (NULL,'migration 195','systeme','sources_deplacees_du_commentaire_vers_la_base','marque',0,
   'AUCUNE SOURCE N EST INVENTEE. Toutes sont reprises des en-tetes des migrations qui ont ecrit ces fiches — 171, 173, 174, 176, 180 a 194 — ou elles etaient deja consignees en commentaire, hors de portee du lecteur. Cette migration ne fait que les deplacer du commentaire vers la base'),
  (NULL,'migration 195','systeme','le_trou_est_assume_et_mesurable','marque',0,
   'Environ soixante marques sur 182 recoivent une source ; LES AUTRES RESTENT A NULL. Leur source n a jamais ete enregistree, et en fabriquer une pour faire propre serait exactement la faute que tools/sources.php a ete ecrit pour attraper — vingt-huit domaines cites qui n existaient pas, par soixante-quinze fiches. Une source absente est honnete, une source inventee donne l apparence de la verification'),
  (NULL,'migration 195','systeme','quatre_sources_partielles_et_le_champ_le_dit','marque',0,
   'OLIVA, ROCKY PATEL, E.P. CARRILLO et JOYA DE NICARAGUA ne recoivent une source QUE POUR LEUR PARAGRAPHE BLACK SWAN (migration 194). Le reste de leur fiche est anterieur et sans source enregistree. Le champ l ecrit mot pour mot plutot que de laisser croire que la citation couvre la fiche entiere');
