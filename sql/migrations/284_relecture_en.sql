-- ════════════════════════════════════════════════════════
-- 284 — Relecture en
-- ────────────────────────────────────────────────────────
-- Relecture des traductions « en » par : expert-traduction (agent).
-- Fichier de verdicts : verdicts_p4_en.json ; generee par tools/i18n_relecture.php le 2026-10-29.
-- Un texte « corrige » est reecrit ; tout texte relu passe au statut « relu »,
-- avec le nom du relecteur. L'empreinte du francais est verifiee dans le WHERE :
-- un francais qui a change depuis l'export ne se laisse pas declarer relu.
-- ════════════════════════════════════════════════════════

UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'haiti' AND `champ` = 'region' AND `lang` = 'en' AND `source_hash` = 'fdcb24354c669d8d7ac1ad2dcb20bba418dd738d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'haiti' AND `champ` = 'production' AND `lang` = 'en' AND `source_hash` = '9b1521dcf425f552724af996923bf0e32f857f93';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'haiti' AND `champ` = 'rev_detail' AND `lang` = 'en' AND `source_hash` = '11b32cf0163227bab81ca4211b06fb2c2510324e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'haiti' AND `champ` = 'soil' AND `lang` = 'en' AND `source_hash` = 'd431192107582c0dfdc43aa4b783e74cfc332d4d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'haiti' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '28f9228759247ee7881ae9b3be6ac6d725596a22';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = '1502 Cigars' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'e81ea97c2d6e48ab8097ecc0731cdf5c37c94118';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = '262 Cigars' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '1f752d20747b70311b06321661d4a97992e64f45';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = '7-20-4' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'c71eb657916546e5e8ca12c99c20e5a0df579a42';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'A.J. Fernandez' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'd6583be5b489e8b074ec4f1874e8b48545580d21';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'ADVentura' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '9b9e3a7c132684f9022f0f12ead494ea50b38fea';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Aganorsa Leaf' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'e1dac37dbab91530f66cad5a1f984284c36cb846';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Aging Room' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '2a3548bc4cf64e918f1e08e951eb637b7848dc12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Agrotabacos' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '7ab9e58c5ed0ff0d3dd08f17b496a9c0cef35f19';
-- brands|Aladino|history|en — usine : factory, pas works
UPDATE `brands` SET `history_en` = 'Julio R. Eiroa has been growing tobacco in Danlí since 1963. He was the man behind Camacho, which he and his son Christian built into one of the great Honduran houses before selling it to Davidoff in 2008. Over the years he bought up the state tobacco farms of the Jamastran valley, where the family still grows.

He returned in 2015 with his eldest son Justo and founded JRE Tobacco, to do exactly what he had wanted to do: a cigar made entirely of corojo grown on his own land.

Corojo is a Cuban seed from before the modern hybrids, notoriously difficult — low yields, prone to disease — and abandoned by most growers in favour of more forgiving varieties. Keeping it in the ground is an expensive choice, and it is the whole argument of the house: Aladino presents itself as a cigar from before, in the agricultural sense.

The name comes from El Cine Aladino, a 1970s cinema in Danlí that the family turned into a factory — the Las Lomas factory, where the cigars are rolled. The range has grown since: a maduro in 2018, a Cameroon in 2020, a Vintage Selection.'
 WHERE `name` = 'Aladino' AND SHA1(TRIM(`history`)) = '1ac3350883d691df734fdcf849bb7e20da7472a0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Aladino' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '1ac3350883d691df734fdcf849bb7e20da7472a0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Alcazar' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '12327a5d7c782a0c811f12eb8c4cd1810d912f4c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Alec Bradley' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'e82df430f404a44722df2414111a20f4cb20a4a7';
-- brands|Alfambra|history|en — atelier : workshop, pas factory
UPDATE `brands` SET `history_en` = 'Alfambra is the brand of Alejandro Mata, a Spanish entrepreneur from Málaga, at the time a distributor of Havana Club rum. His passion for cigars took him to the Festival del Habano in 2005, where he met Cuban grower Alejandro Robaina. In 2007, Mata opened a small workshop in Estelí, where two couples of rollers worked a tobacco from Remedios, in Cuba, called La Flor de San Luis, before launching the Alfambra brand in 2015 — a name the press links to the Alhambra of Granada —, with a first medium-filler cigar with an orange band, made at 30,000 a year. The factory, Tabacalera Alfambra, is listed in Estelí in the Nicaraguan directory Páginas Amarillas. Its own land, including two estates in Pueblo Nuevo, covers more than fifty hectares in Nicaragua, and output is said to be close to 6,000 cigars a day, sold in twelve European countries.

El Brujito, a longfiller launched three years after the brand''s beginnings, has sold 840,000 units, says Alejandro Mata. A Boutique line, including a Gran Toro, completes the catalogue. Presented at Intertabac 2026 and expected on the international market in March 2027, a new line named Alejandro Mata pays tribute to the founder: colorado wrapper in five sizes, maduro wrapper in three.'
 WHERE `name` = 'Alfambra' AND SHA1(TRIM(`history`)) = '8fc3c48099592901f057eab8e2f0b890430acb6f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Alfambra' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '8fc3c48099592901f057eab8e2f0b890430acb6f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Alhambra' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'c89c7c18c4894619cc18c0e4424bfed6ceee9e64';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'All Saints Cigars' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'f4aee859db72805695bd452522eac4f87293e99b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'American Caribbean Cigars' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '7164f3c6934e7c474c056ae1b3710e7453c07b89';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ann-Eks' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '18af5a1d044e1bb55870da3137c5a3a4eb1d9ead';
-- brands|Antonius|history|en — guillemets français « » corrigés
UPDATE `brands` SET `history_en` = 'Antonius takes its name from Maurice “Antonius” Koks, of Dutch origin, who chairs and founded Intercigar S.A., a factory based in Tamboril, in the province of Santiago, in the Dominican Republic, the house says. The brand honours Maurice Koks''s grandfather and great-grandfather, both nicknamed Antonius, or Toontje, and cigar rollers in the Netherlands, says Atlantic Cigar. Intercigar rolls Antonius as its own brand, alongside Vallejuelo; it also rolls, for the Hamburg-based house German Engineered Cigars, the RVGN Rauchvergnügen line, and other private-label cigars for third-party clients, say the house and Cigar Coop. On 26 September 2022, a fire destroyed the building that Tabacalera William Ventura and Intercigar shared in the La Palma free zone, in Tamboril, says Tobacco Reporter. In September 2026, the house places Intercigar at Parque Industrial Llanos de Canca, in Tamboril, a different address from the one before the fire.

In September 2026, the range is divided into three wrappers: Connecticut (Ecuadorian Connecticut Shade), Habano (Ecuadorian wrapper of Cuban seed) and Maduro (San Andrés wrapper, from Mexico), each a medium-strength cigar rolled on an aged Dominican filler, says Atlantic Cigar. Cigarworld.de, which has carried the brand since 11 January 2011, adds a Belicoso vitola, alongside the Robusto and Toro common to all three wrappers.'
 WHERE `name` = 'Antonius' AND SHA1(TRIM(`history`)) = 'd1e7bec67fbd22f4fb675b5c4008eb59d261ed53';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Antonius' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'd1e7bec67fbd22f4fb675b5c4008eb59d261ed53';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Arnold André' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '627fd0eba57a12c7f4901b8b357285f551737e18';
-- brands|Artista Cigars|history|en — guillemets français « » corrigés
UPDATE `brands` SET `history_en` = 'Artista is the house of a family from Tamboril, in the Cibao Valley. Cigarworld.de, Premiumcigars.org and Absolutecigars.com date the opening of the factory to 1956, and Absolutecigars.com names its founder, Ramón “Pulita” Rodríguez. On the page for its factory, the house names it Tabacalera El Artista, says it has been rolling cigars in the Cibao for seventy years and speaks of a third generation of family owners; it gives no year. In September 2026, Cigarworld.de presents Radhames “Ram” Rodriguez, at its head, as the founder''s grandson; Absolutecigars.com says he is the founder''s son. According to Premiumcigars.org, he joined the family business in 2010.

On 5 July 2022, Stogie Press announces that the house, until then El Artista Cigars, adopts the Artista brand, with Ram Rodriguez as president and two new lines, Harvest and Midnight, in robusto and toro. Premiumcigars.org places the main production in Tamboril, with warehouses and other sites in Moca, La Vega and San Juan.

In September 2026, the house''s website arranges its cigars in series — Artista, Factory Classics, Rugged Country, Studio Works and a David Ortiz series — and its press page lists announcements dated from 2022 to 2025. Premiumcigars.org cites Big Papi, made for the former baseball player David Ortiz, and The Slugger, its follow-up, among the cigars the factory produces.'
 WHERE `name` = 'Artista Cigars' AND SHA1(TRIM(`history`)) = 'ae7cdbcd99c39fc7bf15bbfcc64fdd33c22d163a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Artista Cigars' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'ae7cdbcd99c39fc7bf15bbfcc64fdd33c22d163a';
-- brands|Arturo Fuente|history|en — Château : accent omis
UPDATE `brands` SET `history_en` = 'Born in Güines, Cuba, on 18 November 1887, Arturo Fuente Sr. settles in Key West in 1906, then in West Tampa in 1910, according to arturofuente.com; Wikipedia, for its part, dates his arrival in the United States to 1902. In 1912, aged twenty-four, he founds A. Fuente & Company at 813 Francis Street, West Tampa. In 1924, the factory burns down while he is in Cuba buying tobacco; he spends the following twenty-two years as general manager of a local company.

His son Carlos Fuente Sr., born in 1935, becomes sole owner of the company in 1956, buying out the share of his elder brother Arturo Oscar for one dollar; Arturo Sr., retired, dies in 1973. In the early 1970s, Carlos buys a factory in Nicaragua; according to his son, the first Don Carlos sold, in 1976, was rolled in Estelí. In 1978, the Sandinista rebellion burns down the Nicaraguan factory; in 1979, an ‘accidental’ fire destroys the one in Honduras.

Carlos Sr. goes on producing cigars from the Ybor City site, says arturofuente.com. On 4 September 1980, Carlos Sr. and his son Carlos Jr., known as Carlito, open Fuente Ltd in Santiago de los Caballeros, in the Dominican Republic. The Ybor City site, on 22nd Street, stays open only as a distribution centre: cigars are no longer rolled there by hand.

In 1992, Carlito creates what the house calls the first successful 100 per cent Dominican puro, wrapper included, the Fuente Fuente OpusX, put on sale on 18 November 1995, according to arturofuente.com, which points out that Dominican soils were judged unfit for wrapper tobacco. The wrapper grows at Château de la Fuente, in the mountainous Bonao region, about an hour south-east of Santiago: the family planted its first seeds there in the early 1990s, and the farm opens to visitors of the ProCigar festival.

Carlos Fuente Sr. dies in August 2016, aged 81. Carlito was then president of the company; his sister Cynthia Fuente-Suarez, vice-president according to arturofuente.com, and he are the founder''s grandchildren. The house notes that, four generations after the beginnings, the company remains a family business; the book Arturo Fuente: Since 1912 mentions a fourth generation waiting in the wings.'
 WHERE `name` = 'Arturo Fuente' AND SHA1(TRIM(`history`)) = 'd8be123ec46f77c26f7ef15cca0bd6fd16fdb648';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Arturo Fuente' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'd8be123ec46f77c26f7ef15cca0bd6fd16fdb648';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Arturo Fuente Hemingway' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'a2da9f37e6c65c01e7c6329357916321e40dfca0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Arturo Fuente Maduro' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '299dbd1768047acf00733bcbf771d1f0d51b01e6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Aruhiba' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '50778a7446cce6a5257b86cd439cbfa923fa75ba';
-- brands|Ashton|history|en — omission Davidoff, ajouts, régularité
UPDATE `brands` SET `history_en` = 'The Ashton story begins in Philadelphia, in 1985, in the Holt''s Cigar Company shop, which the Levin family has kept since 1957 and which Robert Levin has run since 1974, says holts.com. The Dominican Republic, which had emerged in the 1970s as the primary alternative to Cuba for American smokers, was producing cigars of widely variable quality — some excellent, many merely adequate. It was Robert Levin who created the brand: the house calls him the creator of Ashton in the early 1980s and dates its launch to 1985; he says in a 1996 interview that he presented it at the Retail Tobacco Dealers of America convention, in Washington, and that in 1992 he bought from Bill Taylor, maker of Ashton pipes, the name suggested to him by a friend, an importer of those pipes.

The first Ashton cigars were not rolled at Fuente: Levin says they were first made by Henke Kelner at Tabadom, and that he then entrusted the brand to the Fuentes in 1988, working out the blend with Carlos Fuente Jr., Carlito; the house, for its part, writes that he teamed up with the Fuentes shortly after the launch. The relationship still holds: ashtoncigar.com and holts.com say that Ashton cigars are rolled at Tabacalera A. Fuente, in the Dominican Republic, and blended by Carlito Fuente — with the exception of the San Cristobal range, below. The arrangement also means that the two houses share a quality floor — whatever the Fuente family is willing to put its name to, it also produces for Levin''s brand.

The catalogue that resulted covers the full range of Dominican expression. The classic Connecticut Shade ranges state the core proposition: refined, creamy, with a consistency of construction that few houses maintain. The VSG — Virgin Sun Grown — lines use an Ecuadorian sun-grown wrapper for a fuller character, which surprised smokers who knew Ashton only through its mild expressions. The Cabinet Selection, aged in Spanish cedar boxes after rolling, shows the house at its peak of refinement.

The brand''s identity is Philadelphian in character — understated, quality-conscious, more interested in execution than in the theatre of the cigar world. Where Davidoff is Genevan and cold, Ashton is Philadelphian and warm. It does not make headlines with extreme formats or unexpected blends; it makes cigars that experienced enthusiasts return to without disappointment, which is harder than it sounds.

Outside the United States, Ashton''s San Cristobal range, whose manufacture is entrusted in Nicaragua to the Garcia family of My Father, in Estelí, is sold under the name Paradiso: an article of December 2015 explains it for brand reasons. In October 2026, German retailers still offer it under that name, in the series Paradiso by Ashton, Revelation, Quintessence and Elegancia. Not to be confused with the Cuban brand San Cristóbal de La Habana.'
 WHERE `name` = 'Ashton' AND SHA1(TRIM(`history`)) = 'bccdf493d6fba9411367159bca921b94e5ad455c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ashton' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'bccdf493d6fba9411367159bca921b94e5ad455c';
-- brands|Ashton Cabinet|history|en — ajouts, orthographe britannique, fin ajoutée
UPDATE `brands` SET `history_en` = 'Robert Levin, of the family that keeps Holt''s in Philadelphia, launched Ashton in 1985, says holts.com. His first cigars were not rolled at Fuente: he says in a 1996 interview that they were first made by Henke Kelner at Tabadom, and that he then entrusted the brand to the Fuentes in 1988; the house, for its part, writes that he teamed up with the Fuentes shortly after the launch. The Fuentes — the family house that had just rebuilt its reputation on the island after the fire at its factory in 1980 — today roll Ashton cigars at Tabacalera A. Fuente, in the Dominican Republic.

The Cabinet Selection is the range that the house ages after rolling. It is not merely a premium cigar: it is a cigar that undergoes additional ageing — the time that the cedar boxes give it.

After rolling, Cabinet Selection cigars are placed in Spanish cedar boxes — not the decorative cedar of standard packaging, but structural cedar of the type traditionally used in the ageing of Spanish wines and spirits — and left for twelve to twenty-four months before release. During this period, the tobaccos continue fermenting in a controlled environment that softens what harshness remained and lets the components of the blend harmonise. The boxes contribute their own character: the slow transfer of resinous cedar oils over months of contact influences the wrapper and outer leaves in a way that ordinary ageing does not reproduce.

The result is a cigar of remarkable composure. The Connecticut Shade wrapper — Ecuadorian, like most wrappers of this style today — gives notes of hazelnut and mountain honey from the first puffs. The Dominican filler, built on Carlos Fuente Sr.''s personal recipe, develops through white cedar and dried fruit before a finish of unusual length and cleanness. There are no rough edges. At no point does the cigar ask anything of the smoker beyond attention.'
 WHERE `name` = 'Ashton Cabinet' AND SHA1(TRIM(`history`)) = 'a900d1a21bbd388e3ddf4bb89e5fbe1339e23d0f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ashton Cabinet' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'a900d1a21bbd388e3ddf4bb89e5fbe1339e23d0f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Asylum' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'd7f15217aef78cd43becd0e6f81f16e28259d472';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Atabey' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'a66ac83ace8ea8c3ae25f1bc29b30b1ecb9bdcae';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Atatürk' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'a6318aa47cda0afec9083e8acdef4c7a5e5b39ef';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Avo' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '9907b0453e6eb2e15525e8a381867ceb1333f6e4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Baccarat' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '85b5eb4a9cdd3d43e6bfd40d578cf4411b6a396f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bahia' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '081b9798f3d2502fb21355c7ba1aac3cae1ce51e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Balmoral' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '9587bae66253cd2bed87f09d812b1fc8e85a45ac';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bandolero' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'fdae7c20ec181ecb1ef4c940da459722acc67d1e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Baron Ullmann' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '2b52e6e899d8f6e57bc2d74ef38bfa9bac99a13f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Barrio Viejo' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '45c2179b6999664c85016ae006f71002090f02e4';
-- brands|Bauza|history|en — virgule décimale 6,75
UPDATE `brands` SET `history_en` = 'Bauza revives the name of an old Cuban brand, never exported and smoked only on the island, says Oscar Boruchin. In 1990, Boruchin bought a small distribution house in Miami linked to the Fuente family and relaunched Bauza with Carlos Fuente Sr.: the brand has since belonged to the Arturo Fuente family, who manufacture it themselves, while Boruchin handles its distribution in the United States, he says. The cigars are shaped at Tabacalera A. Fuente, the factory the Fuente family opened in September 1980 in Santiago de los Caballeros, in the Dominican Republic, after leaving Nicaragua; there they are rolled by the same torcedores as the Arturo Fuente cigars, says Holt''s Cigar.

The current range wears an Ecuador Sumatra Sun-grown wrapper on Dominican binder and filler, for a medium-full profile of cedar, grain, toasted nuts and leather, with a touch of sweetness, says Holt''s Cigar, which sells two sizes in September 2026, Petit Corona and Pyramid; a Casa Grande (6.75 x 48), with the same wrapper, has circulated at another retailer but is no longer for sale there in September 2026.'
 WHERE `name` = 'Bauza' AND SHA1(TRIM(`history`)) = '28b24af6cd24721802039164538d8aef98418ecf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bauza' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '28b24af6cd24721802039164538d8aef98418ecf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Belmore' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '836080f3e1ebed35e8638fba2558ba631b2570f4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bering' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'ceaaeb4e6bf685c9ddfe08cce865616bb8286242';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'BerlinCigarMen' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'ad3d801c0d92a9bb0571cab09d324d42e94048c7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'BIN Cigar' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '68f8f4374d3a296e3a93e61ee5b6fadc8797a1ff';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Black Label Trading Co.' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'e145f1dc6eb17cab7f157d25ab36a31432e4b2ec';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Blackbird Cigar Co.' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '2b4035353ae4798e413dff1ffd03e80423ecf301';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Blanco Cigars' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '424c5ebc4d3a0fa5acb2e15afd2afc8f993f4b0d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bock y Ca.' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '2824c5ed9be8ff7bccc88489ae2bc1647832a405';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bohekio' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'baad3d1b5e8274ea49b1ee948a63ba262d8961a5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bolivar' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '52a5ff2acd6db85d57e5de0d039269c311a8c57c';
-- brands|Bolívar Honduras|history|en — plants remplacé par factories
UPDATE `brands` SET `history_en` = 'The name comes from Cuba, where the brand was born in the early twentieth century. The non-Cuban version is Honduran: it is rolled at HATSA — Honduras American Tobacco — in Danlí, one of the two factories the Villazon family ran in the country. General Cigar bought Villazon in 1997 for 81.4 million dollars.

The Cofradia blend takes its name from the other Villazon factory. It is the work of Estélo Padrón, production manager of the HATSA factories: an Ecuadorian Sumatra-seed wrapper, a US Connecticut Broadleaf binder, Honduran and Nicaraguan filler.

In October 2024 Scandinavian Tobacco Group withdrew this brand from its price list, along with El Rico Habano and Helix. The Danlí factory still runs; the band is no longer made. This entry is now an archive entry.'
 WHERE `name` = 'Bolívar Honduras' AND SHA1(TRIM(`history`)) = '7c62edca381518734bf0a83cbb92a5060e9e6ac4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bolívar Honduras' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '7c62edca381518734bf0a83cbb92a5060e9e6ac4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bombay Tobak' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'c1a64acbe7a57c9fca124841f32ac4e2f5a6d31b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bongani' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '9ef23c6450a282f6cdc06a7f4cf3d1c85ca5f8e4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Boutique Blends' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '2829a50841eb79764311c3cb5fb078003723e1fa';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Brun del Ré' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'f2c88adb1e5753b7bafb5d155da4d3533ead3280';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bugatti' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '8d7e50cbd92af500a7d49e666886a6dcd5f287cd';
-- brands|Burger Söhne|history|en — région, pas État
UPDATE `brands` SET `history_en` = 'The Burger family entered the cigar and pipe tobacco trade in Switzerland in 1864.

In 1988 it bought Dannemann GmbH, in Lübbecke, Germany — and became the world''s third-largest cigar producer. The Dannemann name itself comes from Brazil: Gerhard Dannemann, born in Bremen in 1851, emigrated in 1872 and opened a factory at São Félix, in Bahia, in 1873 with six employees. He became one of the region''s leading industrialists; the firm went bankrupt in 1954, but the name survived.

The group today owns Dannemann, Ritmeester and Al Capone. This atlas holds Dannemann, attached to Brazil — the ground where it was born.

The group also has a factory in Jember, East Java, which the Indonesian press counts among the town''s two cigar factories of international scale, with Villiger''s. The Besuki Na-Oogst leaf, which the world buys for wrappers, is rolled there on the spot for Switzerland — this atlas says so here, and tells Jember at the BIN and Golden Djawa entries.'
 WHERE `name` = 'Burger Söhne' AND SHA1(TRIM(`history`)) = '8ee6dd2e62bb2689d8dd2318001dd190ad9cc0b7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Burger Söhne' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '8ee6dd2e62bb2689d8dd2318001dd190ad9cc0b7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Butera' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '146c8af153102f1ff6f3c1be5c42405a1c8f5b64';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Byron' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '3a9b84d98335d8291a0fa5b7382b4d7f44b1fe57';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cabal Cigars' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'ad7b5741fdba79927bf774b84e3067b30a3364a8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Caldwell Cigar Co.' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'e36800c9728c6d4687b7c30f2f1431b4562b155d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Camacho' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '88b433f3fc41eb8f46e296cb3fbfebb9fbd8fb1e';
-- brands|Canaritos|history|en — cave : cellar, pas humidor
UPDATE `brands` SET `history_en` = 'Canaritos is the only Canary house in this atlas that rolls on Tenerife. The workshop is at Güímar, on the east coast, a short way from Santa Cruz.

It accepts what the houses of La Palma refuse. Its cigars are shortfillers: the filler is made of pieces of leaf rather than whole folded leaves. And Canary tobacco makes up only about a fifth of the blend — the rest comes from the Dominican Republic.

That point is written here because the label does not say it. "Canary cigar" reads as an origin; it is first of all a place of rolling. The house makes no secret of it, and its price reflects it: it aims at the everyday smoker rather than at the cellar.

That is also what makes it useful in this atlas. Beside El Sitio, which grows its own wrapper under cloth, Canaritos shows the other Canary model — the one that survived the collapse of the plantations by importing its leaf.'
 WHERE `name` = 'Canaritos' AND SHA1(TRIM(`history`)) = 'c54ee6d4d716f9907f142538a40871cbe84e949d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Canaritos' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'c54ee6d4d716f9907f142538a40871cbe84e949d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Canned Heat' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'd3b616fb2349917779d33d42c03650978eb8f337';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '3d11a130e14af1991e5162c7ec26aa9161208ba3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO America' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'e1bb37ca2902c18a87425f059aa4e67e5f91451a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO Black' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '9ad79bcbd23b636dfbb661f1d031ef5da9827129';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO Cameroon' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '347fddff85743e67462b049e16e5cb2c09a3914a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Caoba' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '7f2da9e68f6de42f2c3224627ecf7f17ca9b3f52';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Capadura' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '9fff1d185a2a8d703528fe4cc4a42f8b2ac8f6b2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Capitol' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'dd19335efd3a0eeaaf9c977cf5f1a70a004ee7a7';
-- brands|Casa 1910|history|en — distribution générique, pas un distributeur
UPDATE `brands` SET `history_en` = 'Casa 1910 bears the year of the Mexican Revolution, and its whole catalogue descends from it: Cuchillo Parado, its first cigar, is the village in Chihuahua where the uprising began; Tierra Blanca, El Ébano are battles; the Soldaderas, women who fought. The house was born in 2021, presented at the PCA show, by three partners — Manolo Santiago, formerly in Havana cigar distribution in Mexico and a graduate of the Habanos academy, Jamie Baer and Serge Bollag. Its purpose is to change what people think of the Mexican cigar, with puros from the San Andrés valley — the country this atlas tells at the Te Amo, Casa Turrent and Santa Clara entries.

What the entry lacks is what the press lacks: the house does not say which San Andrés Tuxtla factory rolls its cigars, and the trade press wrote so in black and white in March 2026. This atlas writes no entry without a named factory; it makes here the exception it made for Jas Sum Kral — the silence is documented, not invented — and notes what is named: the Soldadera, in 2023, was rolled at Tabacalera La Isla, in the Dominican Republic, and the Cavalry elsewhere than Mexico; both were discontinued in 2026 to keep only the Mexican.

For the house grew fast: price cuts and three million dollars raised in 2025, a chief executive from outside, Rob Maneson, a catalogue overhaul in March 2026 — three sizes common to every line, El Ébano expected for the summer — and Smoker Friendly, an American shop chain, taking a stake. A venture-capital house in a trade of families; this atlas says so without judging, and waits for the factory''s name.'
 WHERE `name` = 'Casa 1910' AND SHA1(TRIM(`history`)) = '4de511a6977b729297dadfa7a1bb0ca19a9579d5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa 1910' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '4de511a6977b729297dadfa7a1bb0ca19a9579d5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa Cuevas' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '32b962ae1a81c6e877b036a26245603be1176a5c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa Culinaria' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '2b4784d6714b1c4aa0fc64118d98401ae19d968b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa de Alegria' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '9c88e2a5de8a07e85b0cb79e2b04bfdbf6045ddc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa de Garcia' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '76028c1ae90536b3bb4ef5a7f5fb318382ce7d8c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa de Torres' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '47be8d21446d33cb64ab63d61ef12379aa911ba3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa Turrent' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '046090566857ea41cb78ad1ddc844b207c0a4344';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casagranda' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '4ce0ae5216d06ef8653123b34194ff21169b61b4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casdagli' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'fa5c0203d765e422b463f45bfd571483003817da';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Castillo de Reyes' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '9ab1392b2412b1da5098b9a3f29650b741229be9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cavalier Genève' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '3ca18bf7faa2df4417b078221f9f5b758304676a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Chaba' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '2e409f3f9780aea7bbfa49288c92c45fdcd28983';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Charatan' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'bb088c3d3859a6eda2831fabe17f40cf4f5ad2b4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Chateau Diadem' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '220776b3a907b9378f3956566175c42e4271c3f2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cházaro' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'fc83573e7cf1a90d47f3686341cfeb11194051be';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Chinchalero' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '2145249223475f9a4ca75479ad1e3307ddd6e5f4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Chogüí' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '3e61c441213e3ce2b0e2dbaf73c9cf36bee80f69';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Chone' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '99c5bd4ee0c6518c535f542c0d3220902aa31ac5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Christo' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'b7567056f1fa6ff017a213dddd9a93c0a88557c8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cigarkings' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '05ba62fc6de5cbbe33a86136878d869b54f040ab';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CLE Cigar Company' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '3ad328425bb4aaa6b1b3ad2119f8d454d8f6b479';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cohiba' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'aed85c64ddab0e80e288294e77b1ff6188e22045';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cohiba USA' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'ba44a7f0ecee216b866e0f177f7aa77f168f4133';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Colpuros' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '54ebf00a54e8000362b5e00458d6cf0c490880b9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Compagnia Toscana Sigari' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '7d45cb9adc01a96c0b632e6c9597d627d7e92829';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cornelius & Anthony' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '9073004cedf33b909a0178beaea136287d25902b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Corona Real' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'd378c1e7da89c88e81465c63ec7d7dd8d2ba38d4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Crowned Heads' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '4376d02f06a2d13566823aae53f72304702ed9f2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Crux Cigars' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'cfd7086237e3e3a76d24f41e89c15fe49ae78911';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CSC' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'd3ba069dd36575541b33e2894bd762c8d156b631';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuaba' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '017e6a13bcb627ee63d86ed94041961408f7cfa6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuba Aliados' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'e48ac21122136d812a1e085302ab6c4abda32c40';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuban Crafters' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '5fd8d7385bd0addcf31972f5507a87dbd5130c42';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuban Stock Cigar Co.' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'c68a2ce9699e1457bcaa0bddc80cf58f887c335d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuervo y Sobrinos' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'f722bc9d7b62e170d949bff8401073cd0a2af0d7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuesta-Rey' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '0c679e0cd8049100634af6aff89d780141f92973';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Curivari' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '4da8d428b9674751064c7fe7c2e042d7153c77d7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'D''Crossier' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '90bfe64ca3c509b2afb2c1e015eca40b24599e7d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dalay' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '974188858ec399602805e2041c18ca172b61f121';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Daniel Marshall' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '73ff092d9d419e0d87c629a89565638e6148cd9c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dannemann' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '03ed2148766fbc9ec3ac50cca833555406d0b08d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dapper' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '3bacd08d8ec7f0f302cb95f8deb9bb871222978a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Darier & Cleef' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'f9fd9faad4c99fe6d4d70f479054fbb5a59273d0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Davidoff' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '0408b14ed3f9fe7ba7c5e69876e399eb1965460f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'DBL' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '838fd1a217a22c4a88a8de358db2ed30c69e0502';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'De Los Reyes Cigars' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '089c1e96628dbd93a99e4cf901916c0a12952f8a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Debonaire House' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '266025cb335fd47c4bd827841ae6a5821aa6e5a6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Despot' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'a78f7155b80e4d5fa24bfef0f2d7a9b581d05947';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Diamond Crown' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '2d63ba79805e5ed3d0362df6776039a7db42d094';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dios del Sol' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '016f645cbcd9a3f1eefd10b056b6d20c011faa29';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Diplomáticos' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '8ec728b301db2b4738dce64e7bdcb69a43c0b4c4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Domaine de Lavalette' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '23adcc907bb54d960e1538dd6d1aadf5227a5aa7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Domenico' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '6918d1aa4a6b34b7b1c1b17af2ee11a34f3eaca3';
-- brands|Dominican Estates|history|en — cepo non traduit, terme incohérent
UPDATE `brands` SET `history_en` = 'Dominican Estates is the brand of José A. Seijas, head of production at Tabacalera de García, in La Romana, in the Dominican Republic, says Cigarworld.de, which also attributes to him the 2009 VegaFina Limitada; Halfwheel, which describes him as the longtime head of that factory, also names him founder of the Matilde brand. The launch of Dominican Estates is not dated; Cigarworld.de has had it in its catalogue since 28 September 2005.

The single blend marries a Connecticut shade wrapper, an American broadleaf binder and a filler of Colombian and Dominican tobaccos, mild in strength, says Cigarworld.de; it comes in ten vitolas, from the Petit Corona to the Churchill, with a Short Magnum and a Titan of ring gauge 60 and a Corona in a glass tube.

José A. Seijas died in 2024, aged 74, says Halfwheel; who took over the brand after him is not stated. In September 2026, Cigarworld.de still sells it.'
 WHERE `name` = 'Dominican Estates' AND SHA1(TRIM(`history`)) = '0c48704f2affd428072edb72412cfb136ec1dd48';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dominican Estates' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '0c48704f2affd428072edb72412cfb136ec1dd48';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Collins' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '8048ea30a32a9bf86fe76a939ace06cb34e7168b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Diego' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '0eb85869b0f41f30d23ad3f043d73c545d1a1c86';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Duarte' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'cbcf433e01f2d2626de9d9e106f2a15893447609';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Emmanuel' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'fb32e87f6b823a57238ebcc30f49e7569636d992';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Fidel' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '741a7134d8a368df8825688f01957ae76dd09673';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Lucas' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'dfc2c062a9824cc18d2b9585511cecb5e62c9dc8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Tomas' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '9f654253ba36a69b62c34394cbaef6de2dfcc242';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Zuarin' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '78f24a100ccbfeb4a8928083baa6a33217526a82';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dona Flor' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '7578c20f27ab4867703f74b414510597da01c651';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dos Amigos' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'f855318d4bd6590f8a26bb15e52abb565d9f0121';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dos Jotas' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '334bb1e56a1fef7681cf7a3f5aff3325fc009726';
-- brands|Dos Santos|history|en — family remplace house
UPDATE `brands` SET `history_en` = 'Dos Santos is the only Canary house in this atlas that is not from La Palma. In 1921 Joaquín Jesús Dos Santos González opened his factory at 16 calle Perojo, in Las Palmas de Gran Canaria, and named it La Regenta. European demand for tobacco was strong after the First World War, and the port of Las Palmas could meet it: German ships had lain immobilised there since 1914, Cuban leaf on board. The house dates its founding to 1921; the Canary press traces the brand back to 1919.

Four generations have followed one another. Joaquín Roberto, the son, took over in the 1940s and added cigars — machine-made, then hand-rolled — to a production that had been only cigarettes and cut tobacco. He died in 1983; the third generation succeeded him, the fourth runs the house today.

The old calle Perojo factory no longer belongs to the house. The building is listed and houses an art centre that has kept the cigar''s name: the Centro de Arte La Regenta. Production has moved to an industrial estate at Las Torres.

The figures say what this house really is. It reports over a billion cigarettes, six million machine-made cigars, thirty-eight million cigarillos — and five hundred thousand hand-rolled cigars. The premium end is its smallest volume. It exports to Germany, the Czech Republic, Chile, China, Hungary and Angola, also carries the Cónsul brand, and revived Condal in 2016.'
 WHERE `name` = 'Dos Santos' AND SHA1(TRIM(`history`)) = '37b22f195668e815d763479726d379d79ad8cb07';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dos Santos' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '37b22f195668e815d763479726d379d79ad8cb07';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Drew Estate' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '35c2f9c6ed90db9f11375e431d992cd21e7e3041';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Drunk Chicken' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '65b5b44799f9c793f443af848a1bd573bed4bc39';
-- brands|Dunbarton Tobacco & Trust|history|en — langue précisée; dark ajouté
UPDATE `brands` SET `history_en` = 'Dunbarton Tobacco & Trust has no factory, and yet its founder once ran one. Steve Saka was president of Drew Estate — which this atlas holds — before leaving to set up his own house, in the summer of 2015.

He has others roll for him: at Joya de Nicaragua, the country''s oldest factory and likewise in this atlas, and at NACSA, Nicaragua American Cigars, where Mi Querida comes out under the hand of Raul Disla. It is the Crowned Heads model, with one difference: Saka blends himself, and signs his blends with his own name.

Sobremesa opened the catalogue in 2015. In Spanish the word names the moment when people stay at the table after the meal, while the conversation goes on — and it sets the house''s register: medium to full, earth, sweet spice, leather, roasted coffee.

The ranges that followed carry names that explain nothing to anyone who does not already know them, and that is deliberate: Mi Querida, Sin Compromiso, Todos Las Dias, Triqui Traca, Muestra de Saka. The last is a series of trials — literally, Saka''s samples.'
 WHERE `name` = 'Dunbarton Tobacco & Trust' AND SHA1(TRIM(`history`)) = '9a6b5461f7f3617ecb2bccb7c58d7216ea0e6cb4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dunbarton Tobacco & Trust' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '9a6b5461f7f3617ecb2bccb7c58d7216ea0e6cb4';
-- brands|E.P. Carrillo|history|en — carefully ajouté; where->whereas
UPDATE `brands` SET `history_en` = 'Ernesto Perez-Carrillo had already had an entire career when he founded the house that bears his initials. Born in Cuba, he had taken over the small family workshop in Miami, El Crédito, and revived a sleeping brand there: La Gloria Cubana. The success was such that production, which had started in a Little Havana workshop, had to move to the Dominican Republic, and the General Cigar group bought the whole thing at the end of the 1990s.

He could have stopped there. Past sixty, he left the group and started again, with his two children, in a new factory in Santiago. It is a rare case in this trade: a recognised blender starting from nothing, with no brand name to reuse, betting that his signature would be enough.

The style of the house is recognisable — a medium to full profile, very well constructed, where you feel the work on proportions more than any demonstration of strength. Output remains modest by the standards of the big groups, and that is deliberate.

The house rolled the third edition of Black Swan, a series belonging to the American retailer CigarPage, each edition of which is entrusted to a different factory. This one comes out of the Dominican Republic, whereas the other three come from Nicaragua and Honduras. Oliva and Rocky Patel preceded it, Joya de Nicaragua followed. The name belongs to none of the four houses: it is a commission, not a brand of the house.

Two other names go through Casa Carrillo, the name that Tabacalera La Alianza has carried since February 2024, without belonging to the company. Gilbert de Montsalvat is the brand of Raymondo Bernasconi (The Royal Cigar Company, Basel), officially launched on 1 April 2008; according to Zigarren.Zone, the 15 Years edition (June 2024) is rolled there on a blend by Ernesto Perez-Carrillo, whereas the Signature line (2023) comes out of Tabacalera Diaz Cabrera, at Eladio Diaz. Conspiracy belongs to Quality Importers Trading Company; shipping began in August 2024. EPC is the abbreviation under which Cigarworld classifies the company''s catalogue.'
 WHERE `name` = 'E.P. Carrillo' AND SHA1(TRIM(`history`)) = 'ed7b2a21999f2ccb592929c1944d6a82fd99b14e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'E.P. Carrillo' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'ed7b2a21999f2ccb592929c1944d6a82fd99b14e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Galan' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'dd7eeeb4fcc3839c978668af729cb046261055a3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Gaucho' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'e856468ce274b6dbe05e4addfd61b1e43bfa15a5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Mago' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '7574c28917dfdc1f4f15abf2964c49ebb1aaf56c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Rey del Mundo' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'b12e53128e0e6ed7508ab9a8bc5bc0571d308707';
-- brands|El Rey del Mundo Honduras|history|en — plant->factory; benches->workshops
UPDATE `brands` SET `history_en` = 'The Cuban brand dates from 1848. Its Honduran namesake is the work of the Villazon family, who had it rolled at Honduras American Tobacco — the HATSA that Frank Llaneza founded in 1963, and whose Cofradía factory was the country''s first export-oriented one.

General Cigar bought Villazon in 1997. The house therefore shares its workshops and its rollers with the Honduran Punch and Hoyo de Monterrey, both already in this atlas: Villazon had obtained the American rights to those two in 1965, and Llaneza had moved their production to HATSA in 1969.'
 WHERE `name` = 'El Rey del Mundo Honduras' AND SHA1(TRIM(`history`)) = '034425602a98b31f87b937c66bcb77007b7da9d5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Rey del Mundo Honduras' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '034425602a98b31f87b937c66bcb77007b7da9d5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Septimo' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '595e0f0effc261ce941df4a3db755d49b2b73a37';
-- brands|El Titan de Bronze|history|en — sans doute = probably
UPDATE `brands` SET `history_en` = 'On Calle Ocho, in Little Havana, a handful of rollers work behind a window, by hand, a few metres from the passers-by. El Titan de Bronze is one of the last working cigar factories in Miami, and probably the most visible: you can watch the rolling.

That matters for the atlas. After 1960, Miami was the capital of the Cuban exile and the refuge of the torcedores who had left the island; dozens of workshops operated there, almost all since gone. What remains fits into a few addresses, and this one still trains rollers by Cuban methods — entirely by hand, without a mechanical mould for the most demanding shapes.

The house rolls its own lines and also produces, in very small runs, for brands that want cigars made in the United States. The volume is negligible on the scale of the trade; the heritage value is not.

Altezas Reales 1871 is the brand of Rafael Cifuentes III, great-grandson of Ramón Cifuentes Llano, former owner of the Partagás factory. Presented in September 2023 at Dadeland, in Florida, it is rolled in Miami in this factory: Ecuadorian Habano wrapper over Nicaraguan binder and filler, in Robusto, Corona and Toro, with an announced run of 1 000 boxes per size. Cifuentes says he drew his inspiration from the Partagás of the 1990s, especially the Serie D No. 4; he distributes the brand through his company, Flor de Tabacos La Lealtad. In October 2026, Luxury Cigar Club shows all sizes as sold out.'
 WHERE `name` = 'El Titan de Bronze' AND SHA1(TRIM(`history`)) = 'c0cd0a224095a2b0d1867fb0ef2675ccb06c4f7e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Titan de Bronze' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'c0cd0a224095a2b0d1867fb0ef2675ccb06c4f7e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Eladio Diaz' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'cea4c512b851d8bbbb9febbf50dbe92a118a9158';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Emilio Cigars' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'd73abddff0bd51092550a3e5a8d6031611f09525';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Emperors Cut' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '61d887251e7ea7d54a74076b61f6e1a1f0383e93';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Epic Cigars' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '1702f0224afbf9344d45369efb7559f28b6af056';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Espinosa' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'b8c9006f41a59b5497411889a49e8dae3b9a6855';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Esteban Carreras' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '2381510a3b2b0796ec2a5df993c871745985176e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Excalibur' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '037aab664d5e203968eda281d8b796bb007ba6a6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ezra Zion' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '8cba7531ea3e44b290422b4a479033919d4f8d85';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fable Cigars' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '676adaca0366de15e06f7b42c3d37eba651c84ab';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fábrica de Tabaco Estrela' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '09219a0d9759ba71337f37b4817e148a52e63d13';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ferio Tego' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '224b2a9757862cd5ee0a9b36fed635da8d35c5a1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Finca Tabaquera El Sitio' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'bf7f8a086372f569c80d690ad6fe4180267dca63';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Firecracker' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '9c9423c34c71d7e8817ca904fc7d2934ff633c81';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Flavoroute' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'ca9b842f768816862b54c7f5547967e8e9bee005';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Flor de Selva' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '182a209bf57789bbeaceffa720b731993c6f6f98';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Flor del Sol' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '8fdac7d2f6cd8ad48063321534ade26679525ed2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fonseca' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'd4be418515eb10180ed1ba88713bea944d579d1a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fonseca Nicaraguayen' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '1b0fa9cc03264f41586f9175ab8214b090b4beef';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Forged Cigar Company' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'd3becb0d40127088613e590099916e9677687a49';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fortis Cigars' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '3abd30f5575baa3c2c714049927693c01a8d7b18';
-- brands|Foundation Cigar Company|history|en — omission de « American » wrapper
UPDATE `brands` SET `history_en` = 'Nicholas Melillo spent some ten years choosing tobacco for one of the great houses of Estelí before founding his own. That background explains Foundation''s positioning: the brand does not present itself as a collector''s adventure but as the work of a man who has known the fields, the harvests and the fermentations from the inside.

El Güegüense, his founding blend of 2015, took its name from a popular Nicaraguan play, a colonial satire passed down orally for centuries and inscribed as intangible heritage of humanity. The choice says something about the ambition of the house: to root a cigar in a culture, not merely in a terroir.

Charter Oak, the other line, starts from the opposite end — the Connecticut valley, where Melillo grew up and where the most widely used American wrapper in the trade is grown. A Nicaraguan house laying claim to a northern root: that is rare, and it is deliberate.

In March 2024, Foundation announced that the name El Güegüense was fading away: The Wise Man Corojo takes the place of the first blend, remade, and production moves from Aganorsa Leaf to My Father Cigars S.A., which is run by Pepín García. The name The Wise Man dated from July 2017: it had initially been used for the Maduro variant. In October 2026, the company''s website presents The Wise Man Corojo with a Nicaraguan corojo ''99 wrapper, in four sizes, from the Corona to the Doble Corona.'
 WHERE `name` = 'Foundation Cigar Company' AND SHA1(TRIM(`history`)) = 'c7d22b0095089bc2786258b44ce4428591ef60bc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Foundation Cigar Company' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'c7d22b0095089bc2786258b44ce4428591ef60bc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fratello' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '6762001bce64ced2da8e3aff2a5b5e2b2650b83d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Freud Cigar Co.' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '892276737af4fd366633f4836ac105dba11acb26';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Gellis Family Cigars' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'a3db188a96fa30edccfcc319c9b0dc6a23c9994b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'General Cigar' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '48b02cefa436d25c4b625c8340f4751688b72eb1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'German Engineered Cigars' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'ef329f225ccb801fe9dcf7a7edee63de5b2ca5d8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Gispert' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '582da14e208aa4e922451ed3e2c12520e91bd759';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'God of Fire' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'afa5fe9bc6934d72c139833968bf5ff47562971b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Golden Djawa' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '95c80c76e02f785f4bbab55133c72a4806d4aa6d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Gran Habano' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'aae6a610346cf2098cf19d116ac06916452bd6c3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Graycliff' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '79fdb310bea9b8cac49ce9f513467fc4a84b2a24';
-- brands|Great Wall Cigars|history|en — machine-made (glossaire)
UPDATE `brands` SET `history_en` = 'Great Wall — 長城 — is the cigar brand of the Chinese state monopoly, rolled in Shifang, two hours north of Chengdu, in Sichuan. The factory was born in 1918 as Yichuan Industry Society, ahead of any other cigar factory in the country according to the trade press, in a town that has grown tobacco for four centuries. In the 1960s it rolled for Mao Zedong a cigar whose blend he approved and which was then put on the market: the 132, hand-rolled and pre-cut, remains the name every Chinese enthusiast knows, and the rollers of the 132 team are the house''s elders, in photographs on the walls.

The current site, completed in 2007, covers two hundred thousand square metres and makes mostly machine-made cigars — five hundred and sixty million a year at the time of the report, against a hundred and twenty-six million in 2003. This atlas does not carry those. It carries the hand-rolled cigar building, set apart on the site: a million and a half cigars a year, nearly a hundred rollers overseen by three masters, four hundred thousand cigars ageing, a Cuban seed introduced in the early 2000s, trials on Hainan island, leaf purchases in the Dominican Republic, Mexico and Indonesia, and technical partnerships with Altadis and Agio — a Dominican roller comes to train the teams.

The market was domestic. It is opening: after three distribution agreements in 2024, China Tobacco International (HK) signed on 23 July 2025, at the factory itself, an exclusive worldwide agreement outside mainland China. This atlas opens China as a producing country for this house, without setting a zone or a variety: the press has described the factory, not yet the fields.'
 WHERE `name` = 'Great Wall Cigars' AND SHA1(TRIM(`history`)) = 'c72d2350dbb422aa1d82f6c45c06f166780c880f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Great Wall Cigars' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'c72d2350dbb422aa1d82f6c45c06f166780c880f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Gurkha' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'a59d982eae2a8b83af20b0802ae39e88724a860b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'H. Upmann' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '5ff9e27abff78c0f1e287749fb28fc43ee9804fa';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'H. Upmann Dominicain' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'a7151b7073e05d58818dc0d0bd2cfdaecbc18540';
-- brands|H.R.|history|en — humidor à dix exemplaires
UPDATE `brands` SET `history_en` = 'Hirochi Robaina, grandson of the Cuban vegero Alejandro Robaina, took over the family estate of Cuchillas de Barbacoa, in Pinar del Río, around 2010. In late 2014, he launched his own cigar outside Cuba, HR, hand-rolled at La Corona Cigars S.A., Omar González Alemán''s factory in Estelí, Nicaragua: maduro wrapper from Ecuador of Habano 2000 seed, Nicaraguan binder and filler from Jalapa and Estelí.

In the United States, the brand was first distributed by Cubanacan. In 2015, La Corona and Cubanacan split: rolling stopped in April, the separation was made official in July and rolling resumed in September; White Hat, of Houston, has distributed the brand since February 2016.

After a pause linked to the pandemic, says Zigarren.zone, Hirochi Robaina relaunched HR at InterTabac 2024, still hand-rolled at La Corona, with a new line, HR Black, alongside the White, Signature and Blue; in Switzerland, Urs Portmann Tabakwaren imports it. In September 2026, at InterTabac, the house presented a limited run of jars of twenty-one HR Signature Belicoso, sold by pre-order, and a humidor in an edition of ten.'
 WHERE `name` = 'H.R.' AND SHA1(TRIM(`history`)) = 'd09bc4c6775348cdad7a6b6a74be1157ec1bd70a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'H.R.' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'd09bc4c6775348cdad7a6b6a74be1157ec1bd70a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Helvada' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '5bc656c91267336cc745829a5f18b53b9aa6ff10';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Hemmys' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '8b60e6b9015260e6bdc9d5625a2bd83ce41ac61a';
-- brands|Henry Clay|history|en — factory, pas plant
UPDATE `brands` SET `history_en` = 'The brand carries the name of the American statesman Henry Clay. Born in Cuba, it survives today only in its non-Cuban version — this atlas therefore holds no Havana Henry Clay opposite it, and the name needs no suffix.

Altadis U.S.A. has it rolled at the Tabacalera de García in La Romana, the same factory as the Dominican H. Upmann, Montecristo and Romeo y Julieta.'
 WHERE `name` = 'Henry Clay' AND SHA1(TRIM(`history`)) = 'e04a207b76f6d6203fafb1a0907a53f12dd60e04';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Henry Clay' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'e04a207b76f6d6203fafb1a0907a53f12dd60e04';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Herr Lehmann' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '3c1d04536bf595f2c7ea2226baa03a7a6270a2c1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Hiram & Solomon' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'f1457d87c624e183d9fa2cd962583b2db0a38d8f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Holt''s Cigar Company' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'e3ab8abd85d7a9d4eb33d5be0979211cd4df6b33';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Horacio' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'ae8e4ebb43939ac2391eb40db82f74f71d7e5986';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Hoyo de Monterrey' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'a990410a4552e412eecc823ea387211417074557';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Hoyo de Monterrey Honduras' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '597d01e31f8a4b8d97c19f3ca2afeb9f2d198b75';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'HVC Cigars' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'e3aa3fff06b3b23a0fc84dc23868621f22ca2270';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ibis' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'c2ef227b9d2b21483e8227cca6ab594cc9801cd3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'IGM Cigars' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '91538f827103fbff11c2fcea0f1e1f11bbb491f4';
-- brands|Illusione|history|en — d'avant; again ajouté
UPDATE `brands` SET `history_en` = 'Dion Giolito ran a shop in Nevada and felt that the cigars of his time were all heading in the same direction: stronger, fatter, sweeter. Illusione was born of that disagreement. The brand seeks a profile it readily calls one of an earlier time — dry, woody, spicy, without the sweet roundness that had become the Nicaraguan norm — and finds it in the tobaccos of the Jalapa valley, finer and more nervous than those of Estelí.

The bands of the house are covered in symbols, numbers and esoteric references, and the names of its cigars are often numerals. It is a game, but a game consistent with the point: the brand addresses smokers who read bands, compare formats and argue about blends.

It changed the landscape lastingly on one precise point: it made the small format respectable. At a time when the market was growing in ring gauge, Illusione defended coronas and lanceros, arguing that a slender cigar concentrates a blend instead of diluting it.'
 WHERE `name` = 'Illusione' AND SHA1(TRIM(`history`)) = '5a0ba75a9b796678596d8d2055086a632586622a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Illusione' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '5a0ba75a9b796678596d8d2055086a632586622a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'J. Fuego' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '44be2041cbe6dd7a2674afd5f8665b17e395cabb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'J.C. Newman' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '5ece0eda6f0fb41e52e5a70b1d3ee3b185e930d9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Jake Wyatt Cigar Co.' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'c0caef1d84b4957997593de3d36ef70de30b3ba4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'JAMM Cigar' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '97b80f5872fa08dcc7961856fc792f757d8d4ced';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Jas Sum Kral' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '7895e3e3d8152c55cf7266fedd4066151bca37ef';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'José L. Piedra' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '857ff0f3a83596a87e87bb6a556198c3ef2eaa0c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Joya de Nicaragua' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'de6b9de102a70fe1300cafba39839b45a7025788';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Joyas de Panamá' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'a2babc38a82bed6ba6aec64445efb6f2cee41887';
-- brands|Juan Clemente|history|en — douceur = mildness (glossaire)
UPDATE `brands` SET `history_en` = 'Juan Clemente is recognisable by an oddity nobody else has dared: its band is not placed near the head, but at the FOOT of the cigar, at the end you light.

This is no affectation. The foot is the most fragile part of a cigar: the wrapper is loose there, and the slightest knock splits it. The band, placed at that end, holds it until lighting and then comes away by itself. It is a maker''s solution, adopted out of an obsession with construction — and it became a signature you can spot from ten metres.

Its founder, Jean Clément, was French. He created the house in Santiago de los Caballeros in 1982 and hispanicised his own name, judging that it would sound better that way in this trade. A French origin at that moment is one more anomaly: the country was rising and almost every new brand came from exiled Cuban families.

The profile is mild to medium, in the classic Dominican tradition: cedar, hay, a discreet mildness, and often slender formats. Production has stayed confidential, and the brand belongs to that category of houses one speaks of in the past tense without their ever having quite disappeared.'
 WHERE `name` = 'Juan Clemente' AND SHA1(TRIM(`history`)) = '7f034a727f72c0a663e5af9efb4b4c0c22dbdaa5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Juan Clemente' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '7f034a727f72c0a663e5af9efb4b4c0c22dbdaa5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Juan López' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'c7d8fc1ed352220c9ef05c0850a4b2f91620b69f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Kafie 1901' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '05f406d0640965b44df9725e4311e03e67dbb48f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Karen Berger Cigars' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'dc208a10bb48f4e5d7b13db513e6380d3b347b56';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Kelner Boutique Factory' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '619f3ee2dde56be1e92221266835997913ab2ea3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Kinix' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'd462bb12f55dce97bdfc8531d37247202f8ea660';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Kolumbus' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '9a7d59ac3ae9a6e95a1b3075dbc03668b3b5c738';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Kristoff' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '7ef0b769e1facec2684b1fe676f57cbf7727498d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'L''Atelier' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '3bfb04e46cb14887e0f09a675ede909f9878423c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Aroma de Cuba' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'c0aab599a4ee2262e20beb92cb18e2b0f2cd31f0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Aurora' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '12681ad871698de7abb252ca26fe7b19371aa65b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Barba' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'b0afeff4db4f3e0812ffe46149bc914171c332bc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Flor de Cano' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '46249bd9bf4b6bfee0e7ff078034a32bce954f4f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Flor de Copán' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '066a2c924805ac7eb4b611b9d974310b2208730c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Flor Dominicana' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'af35374bf82e4aae217449ccc120209dd3278e99';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Fontana' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '3d2a1879ef63820e6056990462a3b16a7600c411';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Galana' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '578a0036c9cdbe7d564608e5fd38cb13797dcdbf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Gianna' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '85d28ca4e3ad25672a62556d609b5a76c7d5791f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Gloria Cubana' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'e09e0293e7b7719473f576dd98f03ba81d256a17';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Gloria Cubana Dominicaine' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'a587d1213c1e2b8e2252eedf50b0095a4cc40285';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Palina' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '5d26ec42be22cf2141440b4954fd401694158f1d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Sirena' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'd572be5f19886bf17f628c135ab45d94662a9732';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Unica' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '808df0ef8a1dd7d45dcba87a50e266028a40241d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Las Cabrillas' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'db78103126616256888f9e9188cca4067aff4fdc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Latitude Zero' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'd2f68f39b803e0ab6e2f817edb5794b0fe7f90af';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Laura Chavin' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '243e5da845a5348ed62b6b54a89b1eabc2de100a';
-- brands|Le Fagot Cigar|history|en — glossaire : cigar cellars
UPDATE `brands` SET `history_en` = 'Le Fagot Cigar hand-rolls its cigars in Abidjan. The house claims local craft and an additive-free product, and presents itself as the work of young artisans.

Its range carries three names: the Robusto, the Aboussouan and the Fagorillos assortment. The Aboussouan appears under Ivorian place names: Le Poro, in the north, Tiébissou and Djékanou, in the centre.

The leaf is Ivorian. The Abidjan cigar cellars that sell Le Fagot describe a Tiébissou wrapper over a Didiévi binder and filler — two neighbouring departments of the Bélier region — and the local press reports that harvest, curing and fermentation all happen in the country. The variety, however, is stated nowhere.'
 WHERE `name` = 'Le Fagot Cigar' AND SHA1(TRIM(`history`)) = 'd4ac66b4ee1c2127f858778dfaccac180b486b38';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Le Fagot Cigar' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'd4ac66b4ee1c2127f858778dfaccac180b486b38';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'League of Fat Bastards' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '2c73f1c1b065a4993d986d328480f52325d2602c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Legado' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '1faaf7d138a9daf1413ae70057c9a5a57760c202';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Leite & Alves' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '24e78d471c32944cef8c91d7f4a7b6077b95de4e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Licenciados' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'd670661c3aada88b8520bedb958ea12badd8dc64';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Liga Privada' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'e49b5a4be81ca18ee5fe3bec70f95cba4b9a05c3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Loaisiga' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '39557292fdb79ff62719541dbaa791193b497e30';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Los Amigos' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'ec4beec6fa43fd3cd103c2e1f64879a4a4a2b1d5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Luciano Cigars' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '4f90738ce554277b4d33b3096d9343b6d56f40ea';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Macanudo' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'c7dcdeaf8659e7687b40ed5015414f5c28d48a5f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Malekö' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'f1400f2ea1a6e8d33f924a90bc5fb69998322ba1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Mara' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '56cf966fe06231939633f5a6b73a3adbc3e82f53';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Marca Fina' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '0a4b651c395ebee973c7abd88e788decb6d65565';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Mata Hari' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '26ab6465912172034ad8d5c7fce1ffda92b7f1fe';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Matacan' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '4fade9be3fe99980e47995d7afbe678e5f432dc3';
-- brands|Matilde|history|en — superlatif absent du français
UPDATE `brands` SET `history_en` = 'José Seijas ran for decades the La Romana factory, one of the largest in the sector — tens of millions of cigars a year, and the responsibility for a consistency few people appreciate. He founded Matilde in 2013, with his sons Ricardo and Enrique, after leaving that post.

The name does not come from the family but from the country''s history: Tabacalera La Matilde was a Dominican factory active from 1876 to 1910. The Seijas were looking for an old name that belonged to their island rather than one more family surname — and they brought that one back to life.

The contrast of scale is the very subject of the house. After spending his career guaranteeing the constancy of industrial volumes, Seijas set up a brand of short runs, where every blend is his own and where the annual production amounts to what his former plant turned out in a day.

The style carries that experience: very carefully built cigars, of a classic Dominican balance, with a consistency of manufacture that gave away the man who made them. José Seijas died in 2024; his sons keep the house.

José Seijas died in November 2024, aged seventy-four. He had been hired by Consolidated Cigar in 1974, at twenty-four, and it was he who, in the 1980s, took the La Romana factory from machine-made to hand-rolled.

This atlas owes him more than this entry: he blended or oversaw the Dominican Montecristo, the Dominican Romeo y Julieta, VegaFina, the Dominican H. Upmann and Don Diego. Five brands listed here rest, in part, on the work of the same man — and Matilde is the only one that carries his own choosing.'
 WHERE `name` = 'Matilde' AND SHA1(TRIM(`history`)) = '97aee70e16dff0fa4dfe7cc979f6027628c5615f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Matilde' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '97aee70e16dff0fa4dfe7cc979f6027628c5615f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'May''s Cigars' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'e663ea10c8b7ce0b1584d5762199505641b8b1fe';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Maya Selva Cigars' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '2e7dc979840de4fc18b42e99e1ad7d1498da1f6b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Meerapfel' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '34c160fd3609233ec06f3f759734e97fa9888291';
-- brands|Menendez Amerino|history|en — 150 employés trois ans avant
UPDATE `brands` SET `history_en` = 'This is a house born of an exile and a partnership. The Menéndez family made Montecristo and H. Upmann in Cuba; after 1960 they scattered. One of them was already buying leaf from the Bahian Recôncavo from a grower, Mário Amerino da Silva Portugal. At the end of the 1970s the two men set up a factory together.

It stands at São Gonçalo dos Campos, in Bahia — not at Cruz das Almas, where the mata fina it uses is grown. The distinction matters: a place of cultivation is not a place of manufacture.

Everything there is done by hand. The house describes its process as entirely artisanal: each leaf chosen, treated and rolled by skilled women.

Out of this workshop come Alonso Menendez, created in 1980, Dona Flor launched in 1982 — which has its own entry in this atlas — and Alonso Del Patron, out in 2018. It is the same division as between Tabacalera Palma and Aging Room in the Dominican Republic: the factory and its brand both appear here, because they are not the same thing.

Two dates for one founding: 1977 in this atlas and at the house, 1978 in a 2017 report; the entry writes both. The business press of 2012 measured the fall: fifteen thousand cigars a day in the late 1990s, fifteen hundred in 2012, plus four hundred thousand cigarillos a month; four hundred employees once, a hundred and fifty, three years earlier, seventy then, more than 90% women — and still the country''s largest factory. In 2026 its vice-president José Henrique Barreto sits on Apcab, the association carrying the designation of origin for the Recôncavo''s cigars.'
 WHERE `name` = 'Menendez Amerino' AND SHA1(TRIM(`history`)) = '6f824f644902005914638bd5ab8151c401114b56';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Menendez Amerino' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '6f824f644902005914638bd5ab8151c401114b56';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Miami Cigar & Co.' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '3a9c56a2e4eee569f41c7f1e92fcde98420828b3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Micallef' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '71b0838283eb318dd2d3e5602a355de56a3dc354';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Mombacho' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '201ddd358975bd2704b6dba9d9de7ef6d18ab0a3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Monte Pascoal' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '837eb0170353a2f11534746d023e841653d6b3b8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Montealto' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '243bcb8829c939bc5ba7596c3ae60038b3aaed58';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Montecristo' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'ad1f1b6a578baae33540526edd6ed21a1f791506';
-- brands|Montecristo Dominicain|history|en — superlatif mondial non présent en français
UPDATE `brands` SET `history_en` = 'There are two Montecristos, and many smokers do not know it. The brand, born in Havana in 1935, was nationalised in 1960; its owners left the island and took up the name outside Cuba. Since then a Cuban Montecristo and a non-Cuban Montecristo have coexisted, sold in different markets — the first everywhere except the United States, the second in the United States. Same name, near-identical band, two unrelated cigars.

The non-Cuban Montecristo is rolled in La Romana, in the La Romana factory, one of the largest in the industry. The scale changes everything: where a boutique house makes a few hundred thousand cigars a year, this factory counts them in tens of millions, with a consistency of manufacture that is in itself a technical feat.

The profile follows the Dominican tradition — mild to medium, creamy, pale wrapper — where the Cuban is fuller and earthier. It is not a failed copy: it is another reading of the same name, made for another palate.'
 WHERE `name` = 'Montecristo Dominicain' AND SHA1(TRIM(`history`)) = 'a5be5a702a89e029c75faceab310b2f8042cfee4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Montecristo Dominicain' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'a5be5a702a89e029c75faceab310b2f8042cfee4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Montecruz' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'd5e13e299385b68c7fbe053e2924c6ef02817d0b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'MOSI' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '1e7e5731240b58985d8ebd6b36f992af5674061a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Mosi Oa Tunya' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '0df041d09e027dc6a3f8f5644dd800900b050913';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Mustique' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '4901b2a86728f2c265580adc3ede1fc107311eca';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'My Father' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '460a88c8b0ca2757a19f0ca7db6e6b7780522336';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'NACSA' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '961dad913e81f517052fe284217207ca50b6abc3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Nat Sherman' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '61476950ad1cb60274c3c3af516b98a9e5c7cdb6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Nicoya' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '8bf1a13c7812bae3a4fe028fc6ca9b4849ace991';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Nomad' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '04b02f074f02382c9c8f5f9842991f2c1d180e68';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Nordlicht' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'bb8d7fe4d6425b942591fcbbeca192aa4e5c628e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Notorious' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'c45225b11bb7de556c5bb63dc49666882f5ca552';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oettinger Davidoff' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '6c4e1337b85867a832ff990e5d4a9490f33c1c05';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ohana' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'c4e1ca2ca5c4081816f117fcb8514c6d84a35215';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oliva' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'db0fae8283fe6b66aa71f230dc9ddda7334ed538';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oliva Connecticut Reserve' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '09f868f1369ada42a29df1dbca8c0b22ea03b452';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oliva Serie G' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '25622bde17b50bbbeefa9db9b4fd6465fde1ee62';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Omar Rodriguez' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'd559d976ff4f1ef94da62656995c48539e15dacb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Onyx' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'bb66385a2f513ecb363ec53a92b6f82ea18817d6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ortega Cigars' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '9d81f5e9609faf1ef88f6a7135e10b80f42abcf4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oscar Valladares' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '323c2f5185aa9a3040bf0427e62df799d0481172';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ozgener Family Cigars' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '438ddab53a459aa36992d0f1b1e39952c75e5be8';
-- brands|Padilla|history|en — intellectuels de gauche rendus par international left
UPDATE `brands` SET `history_en` = 'Padilla is a tribute to a poet. Ernesto Padilla created the brand in Miami, at the end of 2003, for his father: Heberto Padilla, whose arrest and forced recantation in 1971 entered Cuban history as the Padilla affair, and marked the break of part of the left-wing intellectuals with the regime.

The family came from Pinar del Río, where it owned land and grew tobacco. The name on the band is therefore not a commercial choice: it is the father''s, and tobacco is the other inheritance.

That is why this entry is American and not Nicaraguan. Padilla Miami, the house''s emblematic range, is rolled at El Titan de Bronze, in Little Havana — the Calle Ocho workshop this atlas already holds, where Cuban torcedores work in small numbers. The tobacco is Nicaraguan, grown by Aganorsa: this atlas files by where the cigar is MADE, not by where the leaf comes from.

Production is spread. Other ranges come from Fábrica de Tabacos Raíces Cubanas, in Honduras, and Padilla Habano from Tabacalera A.J. Fernández, in Nicaragua. This entry is American by its centre, not by the whole of its workshops, and it says so.'
 WHERE `name` = 'Padilla' AND SHA1(TRIM(`history`)) = 'c210335e9b40c11850638e91df6beac98d35937e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Padilla' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'c210335e9b40c11850638e91df6beac98d35937e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Padrón' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'bfc5e8ae7b4eac5c0f3b4313e493437debd79fda';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Partagás' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '5a273d450461fad63e1c5d00255c78880c61d13b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Partagás USA' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '0baa2557196f73476ce0116995e9a68010ee4c8a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Patina Cigars' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'bfa8f56d086fd0d184a9d005a43b4bb64040c20c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Patoro' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '2169c3738c570c5fa9cd97d4f8ed4582220d95f9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Paul Garmirian' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '0d930307235295580f82043aca64d8ac04435813';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Paul Stulac Cigars' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '762523110546366abc0fe09d4d3036cf9be3d4c6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'PDR Cigars' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '2fb04bda7ae5f99c0649188f6dc301c509c5c6cb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Perdomo' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'ba78d4576e80c6f58666d52e8c141ae1f1b808d2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Perdomo Legacy Connecticut' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'c21644d1dff2063edc8586a3541703264266cfcc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Perla de Calvano' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '48633535a42f93526a1589cf77f993e942ea41e1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Plasencia' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'c42d2ee4f4de48656611c078c4ab7a7d50b2a106';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Pogar' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'fa6f37f458af1169627fa0ab6d721e1119be04d7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Por Larrañaga' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'e14cf3c0c8e2490f749bdab472a0e91dd3fcaa7d';
-- brands|Por Larrañaga Dominicain|history|en — bench au lieu de workshop
UPDATE `brands` SET `history_en` = 'The Cuban brand dates from 1834: one of the oldest still alive.

Altadis U.S.A. holds the American rights and announced a new non-Cuban collection under the name in 2016. Depending on the line, it is rolled in the Dominican Republic or in Honduras — the house has no single workshop.'
 WHERE `name` = 'Por Larrañaga Dominicain' AND SHA1(TRIM(`history`)) = 'f20ad7035e80b730a8a216fb2e2ebaedb248b31a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Por Larrañaga Dominicain' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'f20ad7035e80b730a8a216fb2e2ebaedb248b31a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Powstanie' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'bf66a73829f04332f98550ad3aab31de4db98ede';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Principle Cigars' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '35d47a997d60ee7b712a43307f496ca535384bd1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Protocol' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'b2e78d6772665590f22a6446d650d455b058a054';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Psyko Seven' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '600d5e4fe4ec8e798868bbf52f479bc392ad9f1b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Punch' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '76fbdf4dddc84bc8a112d476051caf81eb5b03e3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Punch Honduras' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'a26e2f4939ab578472246a963c22226245855861';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Puros Artesanos Julio' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'a9efe3697c40b5cf9083fcbb88c692e2caa6b827';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Quai d''Orsay' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'b4ec2b38799732c4cf45b3242f9957a85821daa7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Quesada' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'a0b4dc551cce30479ecf5b03dedb4fd6ba11c145';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Quintero' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'f920bef5db7fa833536ca90fa0eb90529bca82f8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rafael González' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '3c1fd42e0678e9f9269c1f15d2a4b75c32add654';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ramón Allones' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '137be8938e2962b0c95b518c48d1423b465387d7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Red Anchor' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '7dd14523754092bbae2629e9913ef58fefa57064';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Regius' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '57925d6f373c207989915e5940d0aa86e74085b6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Reinado' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '40abeb06d2f6b5c2fa6ad4a72bbcc98a08062ecb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Reyes Family Cigars' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'ef753698c198e629c3d43bc1328445207c1b054e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rizona Baru' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '795261b66e46ce45d26d43c9b2bf41c9120003aa';
-- brands|Rocky Patel|history|en — texte anglais non traduit du français
UPDATE `brands` SET `history_en` = 'Rocky Patel''s trajectory is one of the most improbable in the American cigar world. He spent his twenties as an entertainment lawyer in Los Angeles, with clients whose hours made cigar lounges a natural professional habitat. He learned about tobacco the way a lawyer learns most things: by asking questions, reading a great deal, and talking to those who knew. By the early 1990s, he knew the premium cigar market better than most of his peers.

In 1995, he decided to enter it. He had no background as a grower, no relationship with a factory, and no sales network. He had legal skills, a commercial instinct and a precise thesis: the American craze of the 1990s was creating a demand that premium makers were not meeting at accessible prices. Padrón was excellent but expensive. Davidoff was beyond reproach but aimed at a different customer. Between true quality and the everyday price there was a space that nobody was treating with the seriousness he meant to bring to it.

The Vintage series, introduced in the early 2000s, turned this thesis into a product: cigars built around tobaccos aged since the vintage year shown on the band, sold at prices that allow a serious everyday cigar rather than the occasional ceremony. The Vintage 1990, 1992 and 1999 established the house''s credibility with an audience that had until then regarded the affordable cigar as a compromise.

The catalogue that followed, with more than thirty ranges spread over several price levels, answers a methodical segmentation of the market: each range targets a taste preference and a budget, with a manufacturing quality whose floor ensures that a Rocky Patel, whatever its price, never shames the brand. This consistency flows directly from the relationships Patel built with Honduran manufacturers over two decades of increasingly concerted production.

In January 2024 the house rolled the second edition of Black Swan, a series belonging to the American retailer CigarPage, each instalment of which is entrusted to a different factory. This one comes out of Honduras — Corojo wrapper, Honduran binder, Honduran and Nicaraguan filler. It is also where the atlas files this entry: the Premium Cigar Association writes in March 2024 that the largest share of Rocky Patel cigars comes out of El Paraiso, in Danlí (up to about 78 000 cigars a day, says Nish Patel, executive vice-president), against 26 000 to 28 000 at TaviCusa, in Estelí. An entry''s country designates the bulk of the production, not all of it: Emerald, Year of the Snake, Thirtieth and Sapphire are rolled at TaviCusa, says Cigar Coop, and a larger factory is announced in Nicaragua; the house''s website files, in 2025, thirty entries under Nicaragua and eighteen under Honduras. Oliva opened the series in 2023; E.P. Carrillo and Joya de Nicaragua followed.'
 WHERE `name` = 'Rocky Patel' AND SHA1(TRIM(`history`)) = '414450bf045d1dd657c218e1dbc76c287df9d40b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rocky Patel' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '414450bf045d1dd657c218e1dbc76c287df9d40b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rodrigo de Jerez' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '60d13f9d29e520ba9e15ac32912b8f065f823f0e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rojas Cigars' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '084b238322915dae620dc04e2e2a3355d1565abd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'RoMa Craft Tobac' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'c20d962ebf3c43e44182f2266c97af3d1255258f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Romeo y Julieta' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '8db9b573d4802a0e56fa8056c734005557fb8557';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Romeo y Julieta Dominicain' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '0e9f67cf4c679be9be7fa5b7aab890507b01e873';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Romeo y Julieta USA' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '85d68cd82afcf08f1ff51e6651795f42def6234a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Room101' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '3ba03bb81b45fa155519617f22786af1adf8b420';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Royal Jamaica' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '6a8a38b92e38c8f45e633bf0b3b7f1f3259e084a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Saint Luis Rey' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '8f40cb22663cd7894ea2a9e55bc5badc74789f27';
-- brands|Saint Luis Rey Honduras|history|en — glossaire factory; workshops
UPDATE `brands` SET `history_en` = 'Saint Luis Rey was born in Cuba. Its non-Cuban version belongs to the Altadis U.S.A. portfolio and is rolled in Honduras.

A more recent line breaks with that habit: the Tabacales are made in the Dominican Republic, at the Tabacalera de García in La Romana — the factory that also turns out the Dominican Montecristo, Romeo y Julieta and H. Upmann. One non-Cuban brand, two countries, two workshops.'
 WHERE `name` = 'Saint Luis Rey Honduras' AND SHA1(TRIM(`history`)) = '4cea5d8a7103144928014aacdb8e2da73e9d4985';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Saint Luis Rey Honduras' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '4cea5d8a7103144928014aacdb8e2da73e9d4985';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Samana' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'a3de2bcedbcdaa0fd257f1eea0d8a5689479432c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'San Cristóbal de La Habana' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'd17e4b1820c24f5a445163272ab2bc8b8f8e9277';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Sancho Panza' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '6ecee5d0a08a40b9917d7a1e7c3a76a9c21d58c4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Santa Bras' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '7c6322cefdeef5490ce7dc2ebfef662d5c7cfca0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Santa Clara 1830' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '7a64398b6f2f2dd1fa50fc1a54843aae3e8d9fd8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Santa Damiana' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '6d7362cb466fc6ea2d64cde1d5de1467a3ac309f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Schumacher' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'c232d4606f93f87032f4b9c7e5bc7f815cab55da';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Secret Blend of Cuba' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '96649ac7b2b8b46d335ad9368a3e1bba3d951311';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Selected Tobacco' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '22da1ab462369c3d1e335d3fa9f26b439519f193';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Serino Cigar Co.' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '523e4b2eda5a9bf6e5ed1f1331a74e2e2a4836c0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Siglo de Oro' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '362b0f59807f31832cb61d3f31a810763d4e1ab4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Simon Beltre' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'dff927cd7268aec39c9b802cb539b81bd05d38da';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Sindicato Cigar Group' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'c5ac8ff71a797b37d684230fe8c3f8a90506ad4a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Skull 77' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'af2623e8ba9513416ce29206cf3fefe5dbb61146';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Southern Draw' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '9ecb230e266c1630b2dd4b87b78c06054bd604b6';
-- brands|Spartanos|history|en — caviste = wine merchant, pas tobacconist
UPDATE `brands` SET `history_en` = 'Spartanos is the brand of the German wine merchant Jürgen Ring, owner of the Crazy Store in Bisingen; he takes the name from his years of martial arts and bodybuilding, and from the film 300, says Cigarworld.de. The first variant is made with Kurt Brandt, in Nicaragua; the cigars are rolled entirely by hand in Nicaragua, and the house does not name its factory.

A first series, in Connecticut and in Maduro, was sold until 2022. In September 2026, Cigarworld.de sells three lines, all in Robusto and of medium strength: Connecticut, a Connecticut wrapper over a Dominican binder and filler; Maduro, a Nicaraguan puro; and Limitada 2022, a Nicaraguan puro. Jürgen Ring also sells a Spartanos rum, says the same retailer.'
 WHERE `name` = 'Spartanos' AND SHA1(TRIM(`history`)) = '20f72426be5c1befdadf04a2c56346f4f7e55fcf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Spartanos' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '20f72426be5c1befdadf04a2c56346f4f7e55fcf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Stauffenberg' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'dfe322c2afe07d81b42acc1adb247b309b4df90a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Stolen Throne' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'b70c59a43007b0846f39609de92c40bb39dfa871';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Suerdieck' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'b1f7f17329cec904f408f9c629fe0878b32412fc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Swag' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '9ff091a512247d46f0213b4692ee98746505f6e1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'SYN' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '22903921f9d6a1deffec5462be928a83b0f1af4f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'T. Sonthi' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '0b8a4f49bbac51dfb25f8d69dde973dd49e5c4dc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacalera' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'f1ad2d3bce91f84fe111559ac29d083359dd1e7b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacalera del Oriente' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'a4e27680a63f4fc119da82912a01ca425e59d902';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacalera Palma' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '155ff4c91e1b2616f965d57a3ab37da4bfe5fce9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacalera R. Paxtián' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '8006a95f169417ff61af7e0e7678c2df44b2bc18';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacalera William Ventura' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '9886787e779726db01b8c3226a1876c9bdda15c5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacosta' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '7bf9eb43104265954e6feb73ea28f0fdc073d697';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabaqueria de Filipinas' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '7afc64da1ce02f8212945f1859047f97a0452bb0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tambor Essence' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '0d30de13f0de4c15f36fd538ca6ade53e92f0817';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Taru Martani' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '5f556b9b22a963eb04bb2d310076fc1984c828c1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tatuaje' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '9623bd96602d29e79eb08d514b45c05ebda0f458';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Te Amo' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '3148b8e4d9df460ef0d1a36553e70b9cf1298363';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Teatro del Mundo' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '870e51618cb9dc1c8f3ee29a2e207e05562949de';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Temple Hall' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '2b3d651271afe2a0d7e05d21f9e2ed79abdfa9a4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'The Griffin''s' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'e7221d6239e71a83035b335b792b6ccc14d02908';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Toscano' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'cf17b50fd79dc83d8126ffc994cc54066e01e9e5';
-- brands|Total Flame|history|en — bagues de motards, bands ambigu
UPDATE `brands` SET `history_en` = 'Total Flame is a Russian house without a factory, and this atlas classifies it where it is rolled: at La Aurora, in the Dominican Republic, and at Plasencia, in Nicaragua — two entries of this atlas. Maxim Privezentsev and Vladimir Roshchin met at a cigar evening in Moscow and discovered two shared passions, cigars and motorcycles; in 2010 they went to compose their blends at the two factories, and in 2011 they set off to ride around the world, documenting it. The brand followed, with cigar bands in a biker spirit — Wild One, Spokes, Off The Rails, FTW.

A Dark Line and a Bright Line, tobaccos the house says are aged six to eight years, a line in Iranian tobacco, and whims claimed as such. The American press described it in the 2010s, when it attended the IPCPR; the Russian cigar press in 2025 files it among brands with Russian roots made abroad.

It is the third Russian case in this atlas, and the only one without a factory in Russia: Siglo de Oro and Pogar roll at home, Total Flame has its cigars rolled in the Caribbean. The rule of the rolling place decides.'
 WHERE `name` = 'Total Flame' AND SHA1(TRIM(`history`)) = '6e6469b4d43040fcd02889334539f5ca3b35dc49';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Total Flame' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '6e6469b4d43040fcd02889334539f5ca3b35dc49';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Trinidad' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '881db611025e1ee33cb2d5fdaa6f9442b679fc5b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Trinidad USA' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '580e3b9165201bf9eb7bb34126fc842227c5cb96';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Umnum' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'da3b5612dd2a1710f0a371f0a15d9f2c19a214a9';
-- brands|Valentino Siesto|history|en — associé rendu par involved
UPDATE `brands` SET `history_en` = 'Valentino Siesto, an Italian entrepreneur born in 1967, arrived in the Dominican Republic in 1997 to open a jewellery shop and discovered cigars, says humolatino.com, which places a first partnership with a factory in Santiago de los Caballeros in 2005 and the commercial launch of his brand in 2018. The house, for its part, dates the start of its own factory in Tamboril to 2014 and production covering numerous vitolas to 2019, says valentinosiestocigars.com; Cigar Coop confirms production at the Tabacalera El Hoyito since 2014. Juan Gomez, a partner in the venture, is the house''s master blender, with forty years of experience, says humolatino.com.

Tabacalera El Hoyito, in Tamboril, traces back to the artisanal work of Marcelo Gómez from the mid-1960s; his children set up a family venture there in 1978, formalised as a company — Tabacalera El Hoyito S.R.L. — in 2011, says Tributary Cigars.

As of September 2026, the catalogue holds two regular lines and one exclusive. The Premium Series is rolled under a Mexican San Andrés Maduro wrapper, over a Dominican binder and Criollo ''98 filler, for a full body, in Robusto; a version numbered 67 is reserved for the American market, says klarocigars.com. The Black Series comes in Nero Black (Connecticut or Ecuadorian Sun Grown wrapper, Dominican filler, in Toro and Robusto) and Yellow Black (entirely Dominican filler, in 46 x 6), says Cigar Coop. In April 2025 the house presented its first exclusive for the PCA trade show, a Robusto under a Connecticut wrapper.'
 WHERE `name` = 'Valentino Siesto' AND SHA1(TRIM(`history`)) = 'a310b52371a297a717ff899da79a1e40a641cf09';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Valentino Siesto' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'a310b52371a297a717ff899da79a1e40a641cf09';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vallejuelo' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '6185639ba749a3d779b100e51cfeceb95315daa8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Van der Donk' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '2016bf35d724deef292b9c9ed8a00ed558826473';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vargas' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '6cd558e22b5d1f6523a31d0beba47753bbb10453';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'VegaFina' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '3c1af15483c42a2dc319dc542e5aabeb88d759b4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vegas de Santiago' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '87fde15c8575285065efb1e688db73100fd82989';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vegas Robaina' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'a6e537786c17cbb36f673b18fba16fefe8dbcfe3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vegueros' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'e9adeb7f89928a7263c6d5ac33dc34169ce725d6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Viaje' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '025f5f6e476f3b9c1250d0254a5611d018717b18';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Villa Vieja' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'b98b1ba135ebf703bbcc4a83cff080bbdbbc31cb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Villiger' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '73694cff55089a8118d1b5f1a0e2acac9e3bac0d';
-- brands|Villiger Söhne|history|en — plant remplacé par factory
UPDATE `brands` SET `history_en` = 'In 1888, Jean Villiger, a twenty-eight-year-old merchant, founded a cigar factory in his own home at Pfeffikon. He died early, in 1902; it was his wife, Louise Villiger, who kept the house going. In 1907 she launched the Villiger Kiel — the first cigar with a goose-quill mouthpiece.

In 1918, Hans and Max Villiger took over and gave the firm its name: Villiger Söhne. It is still family-owned, in the fourth and fifth generations; Heinrich Villiger, of the third, chaired it until his death at ninety-five.

It makes some one billion cigars and cigarillos a year, employs more than twelve hundred people and reports around one hundred and forty million Swiss francs in sales. This atlas holds its Villiger brand, attached to Nicaragua, where its premium cigars are rolled.

One factory is missing from this list, and the Indonesian press names it: Villiger has a factory in Jember, East Java — PT Villiger Tobacco Indonesia, at Ajung —, in the town of Besuki Na-Oogst tobacco where two houses with their own entries also roll, BIN and Golden Djawa. Jember has rolled for Switzerland for a long time without anyone writing it in English.'
 WHERE `name` = 'Villiger Söhne' AND SHA1(TRIM(`history`)) = '64e157bfc609d37e27f5b006d1358bb600bd1b6d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Villiger Söhne' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '64e157bfc609d37e27f5b006d1358bb600bd1b6d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Wangguan' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '17bfb58d91226fcf83bb326b2783340780186da1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Warfighter Tobacco' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '6e86b2cb8c90ba20e50f3bc99b4e1d3228673f9c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Warped' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '89f5fb83f12fae2c523fdfa053600ebb659ccf2b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'West Tampa' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'abc8e0144765e424d9a7d3ff4ce4c2b9f6ca2efc';
-- brands|Wolf & Ruhland|history|en — cigarette fine rendue cigar
UPDATE `brands` SET `history_en` = 'Wolf & Ruhland was founded in 1909 in Munich by a Mannheim merchant, Hermann Wolf, and his sister-in-law Käthe Ruhland; the Munich factory did so well that in 1917 they looked for a second site, and found it, through a friend, Karl Hilz, in a village of the Bavarian Forest, Perlesreut, where they hired a hundred and seventy people — the village called the boss "Father Wolf". In the hard years it was Karl Hilz who took over the firm; his son Hermann kept it afloat with a petrol station and a garage; his granddaughter, Cornelia Stix, has run it since his death in 2006, in the third generation, with ten people.

It is, she says, the last manufactory in Bavaria still rolling cigars by hand. A single machine helps; for some styles the women form the bunches by hand on a foot-operated device, and the wrapper is applied by hand — the entry says so precisely, because the line this atlas draws runs between hand and machine. The tobaccos come from Java, Sumatra and Mexico; the recipes, some going back to Karl Hilz, are kept by the owner''s son, Martin, with no added flavours or scents. The Virginia, a slim cigarette, is the house''s mark; the Toccata Torpedo, the largest, wears a hand-written band.

A village factory, a century and three generations old, without trade press: its source is a regional magazine. This atlas keeps it because it rolls, and has since 1909.'
 WHERE `name` = 'Wolf & Ruhland' AND SHA1(TRIM(`history`)) = '79c5c5f1200ad83399965da3e0b01ef77fd5dc8c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Wolf & Ruhland' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '79c5c5f1200ad83399965da3e0b01ef77fd5dc8c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Wolfertz' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'e55bb70ff90df722d08e0fb00c0cbf82022086f3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Xhaxhi Bobi' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = '7625e38a41de8de1749e09f214ae281e1df1b6af';
-- brands|Zigarren Manufaktur Dresden|history|en — glossaire machine-made
UPDATE `brands` SET `history_en` = 'Zigarren Manufaktur Dresden is a Cuban''s dream: Lázaro Javier Herrera Cabrera, a third-generation roller and tobacco quality inspector in his country, wanted his own manufactory, and he opened it in Saxony, in Dresden, in 2015, with a founding team including Katrin Lieberum. The concept had been written in 2013; the founders'' portrait published at the opening tells the rest — public grants that exclude tobacco, a Cuban nationality that complicates loans, and the choice to do it anyway.

The workshop rolls long-filler cigars entirely by hand, as in Cuba: whole-leaf filler, cedar moulds, a wrapper applied by the roller before the eyes of visitors, who may watch him work. The tobaccos are imported; what is Saxon is the gesture. This atlas therefore classifies the house in Germany, which it opens here as a rolling place — a first for a country known mostly for its machine-made cigars.

It is a small house, without trade press in the English-language sense; its source is a Dresden entrepreneurs'' journal. The entry keeps to what it says.'
 WHERE `name` = 'Zigarren Manufaktur Dresden' AND SHA1(TRIM(`history`)) = 'd616f19e43a9073176b0e1aa9eda066606556545';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Zigarren Manufaktur Dresden' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'd616f19e43a9073176b0e1aa9eda066606556545';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Zino Platinum' AND `champ` = 'history' AND `lang` = 'en' AND `source_hash` = 'b7ad765ab0e9dae9d02dc1e14d94a68c597b509b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = '1502 Cigars' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'aa9b943e36e45ade71f2c3b2af31bb81edfa3941';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = '262 Cigars' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '63cec9f34a17679df068880daca5e13106e5423f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = '7-20-4' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'a6bea161501ebdf5dfd75e6d50488fe74920064d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'A.J. Fernandez' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '58f1955017893b3eb31960084040d0252087a726';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'ADVentura' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'fb7eb6b5f6540fd6d310c329e6faa9ef94145706';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Aganorsa Leaf' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '0be46958362af728058d36960f3557d68e04b91f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Aging Room' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '2090f545d605732a18b4a58789c7ff6ef6d07ed7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Agrotabacos' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'a7f575f04349fd498fe949f3e4acda031147b221';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Aladino' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'fc4edef62edea293bea6333d2a9a5335ebf4ab43';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Alcazar' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'b69f5a94e97e2e193b9d47df8e10be6716b79423';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Alec Bradley' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '1ca7cccc0bb0913851b7adde06322f4ec7993f18';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Alfambra' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '391ad0dba43717f3156022016a22cfa934758710';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Alhambra' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '65435dde17d23144b257e72bb018ec75120d69bd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'All Saints Cigars' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '1296c05cced38833d811de636e6bc6b55e098538';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'American Caribbean Cigars' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '098b7332faa54be497b4c12b54e3ed13d9c6abdc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ann-Eks' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '736cf8d4ee4eb55680f64a84429a255673e305e9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Antonius' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'ad194098eb1d0a5ce65c6d34564250d0eab3f7d1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Arnold André' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '6a75b920842d3519e0c11f2daa562d0a1c46113e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Artista Cigars' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'a5526d67254bb8c716a4800f497d0e6c93799028';
-- brands|Arturo Fuente|gamme|en — Château et (RD) restitués
UPDATE `brands` SET `gamme_en` = '[{"name":"Opus X","color":"#8B0000","force":"Full","story":"Put on sale on 18 November 1995 and presented by arturofuente.com as the first Dominican puro, wrapper included. The wrapper grows at Château de la Fuente, near Bonao. Formats on the house''s list: Robusto 5¼ x 50, Double Corona 7⅝ x 49, Reserva D''Chateau 7 x 48, PerfecXion X 6¼ x 48, PerfecXion No.2 6⅜ x 52, Fuente Fuente 5⅝ x 46. Supplied in limited quantities to a handful of retailers, writes Tobacconist of Greenwich in July 2025.","vitolas":["Robusto","Double Corona","Reserva D''Chateau","PerfecXion X","PerfecXion No.2","Fuente Fuente"],"wrapper":"Château de la Fuente (DR)"},{"name":"Don Carlos","color":"#A0522D","force":"Medium-Full","story":"Takes its name from Carlos Fuente Sr., says arturofuente.com, which describes rare tobaccos aged for up to ten years under a Cameroon wrapper. According to Carlos Fuente Jr., the first Don Carlos sold, in 1976, was rolled in Estelí, Nicaragua (June 2026). Formats on the house''s list: Robusto 5 x 50, Double Robusto 5¾ x 52, Belicoso 5⅜ x 52, The Man 5¼ x 50, Presidente 6½ x 50, Personal Reserve Eye of the Shark 5¼ x 52.","vitolas":["Robusto","Double Robusto","Belicoso","The Man","Presidente","Personal Reserve Eye of the Shark"],"wrapper":"Cameroon"},{"name":"Hemingway","color":"#8B4513","force":"Medium","story":"Released in 1981 according to arturofuente.com, a year after Fuente Ltd opened; the page presents its figurado shape as a first for the industry at the time. Bespoke Unit relates that Carlos Fuente Sr. found old perfecto moulds in a Florida warehouse, and dates Carlito''s blend to 1983, in homage to the American writer. Cameroon wrapper over Dominican binder and filler, mild to medium according to that site (2017, updated in 2023). The Masterpiece, 9 x 52, is the longest format on the house''s list.","vitolas":["Classic","Short Story","Best Seller","Masterpiece","Signature"],"wrapper":"Cameroon"},{"name":"Añejo","color":"#722F37","force":"Medium-Full","story":"Introduced in 2000 with five formats, according to Cigar Coop (August 2014); the No.77 Shark follows around 2002. Cigar Coop links it to Hurricane Georges in 1998: Carlos Fuente Jr., fearing a shortage of wrapper for the OpusX, is said to have dressed the OpusX blend in a Connecticut Broadleaf. The house writes that the maduro wrapper leaves are aged in cognac casks, and presents the Shark (5⅞ x 48/64) as the first torpedo to move from a rounded parejo to a square press.","vitolas":["No.46","No.48","No.50","No.55","No.60","No.77 Shark"],"wrapper":"Connecticut Broadleaf Maduro"},{"name":"Casa Cuba","color":"#8B5A2B","force":null,"story":"Launched in late 2013 in a limited allocation to retailers, says Cigar Coop, and presented by arturofuente.com as the last blend of the late Carlos Fuente Sr., designed to recall the cigars he rolled and smoked in his youth with his father, with Cuban tobacco. Ecuadorian Havana wrapper over a Dominican binder and longfiller of Cuban seed, rolled at the Tabacalera A. Fuente y Cia. The formats carry the names of Cuban dominoes: Doble Dos 6¾ x 42, Doble Tres 5½ x 44, Doble Cinco 5 x 50, Doble Seis 6 x 52, Doble Cuatro 4½ x 54 and Divine Inspiration 6⅛ x 47. Strength described as medium, rising to medium-full over the final third, by Cigar Coop in 2014, and as medium-full by a retailer in October 2026.","vitolas":[],"wrapper":"Ecuadorian Havana"},{"name":"Fuente Fuente OpusX The Lost City","color":"#A0522D","force":"Medium-Full","story":"An edition of OpusX whose tobacco, entirely Dominican, was planted in the summer of 2004 at the Château de la Fuente for the shooting of the film The Lost City, released in 2005 and directed by Andy Garcia, then aged for five years, according to fuenteagedselection.com, which calls it medium to full. Rolled at the Tabacalera A. Fuente; a news report of June 2024 places it in the annual Aged Selection allocation delivered to retailers. Formats: Robusto 5¼ x 50, Double Robusto 5¾ x 52, Toro 6¾ x 48, Lancero 7½ x 38 and Carlito''s A 9¼ x 47.","vitolas":[],"wrapper":"Dominican Republic"}]'
 WHERE `name` = 'Arturo Fuente' AND SHA1(TRIM(`gamme`)) = 'a8262138fa7b002a4beaa497626adc1a774f589c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Arturo Fuente' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'a8262138fa7b002a4beaa497626adc1a774f589c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Arturo Fuente Hemingway' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '0c030683b6a524daa5318c24c187b4a130bb217e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Arturo Fuente Maduro' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'de0d969c686b4b18d35c581dde67311828112fb6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Aruhiba' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '304403554b6f496c50c02902d3a0215c12c24cf6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ashton' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '23d6ed6fbdb4486000e037af9cf5dc90af8dfb98';
-- brands|Ashton Cabinet|gamme|en — filler ajouté ; Fuente mal placé
UPDATE `brands` SET `gamme_en` = '[{"name":"Cabinet Selection","color":"#C9A96E","story":"Aged Ecuadorian Connecticut Shade wrapper, Dominican tobaccos aged two years in cedar at Fuente. Notes of refined hazelnut, mountain honey, white cedar. Medium-bodied, elegant. Each number (No.1 to No.10) is a different format — Ashton''s most complete range.","force":"Medium","wrapper":"Ecuadorian Connecticut Shade","vitolas":["No.1","No.2","No.3","No.6","No.7","No.8","No.10"]}]'
 WHERE `name` = 'Ashton Cabinet' AND SHA1(TRIM(`gamme`)) = 'f22d22e8a8cbabe1046377aa69d9321c397d6338';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ashton Cabinet' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'f22d22e8a8cbabe1046377aa69d9321c397d6338';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Asylum' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '161da9267b15ac5191ebabbc994359189e1d25af';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Atabey' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '4e152a442d9e274d3aeba04163d3987bfe12b224';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Atatürk' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '26557aa79d03e3ca064ba9339132cb0375c6122c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Avo' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'fc88fea23c721e9f512c8c64ce91a90a65f8c357';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Baccarat' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '117e0654c8ffb7f55a00bfbb6be9d8894f412869';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bahia' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '0bcdcf42a9109d0a1a9c64ddfd9c0a87743c17f3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Balmoral' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'd6d96d8f34ff7dea9f0a87700290aa4151ff2070';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bandolero' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'c04c52588aadec93f6e52b9118e642aea7bad1af';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Baron Ullmann' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '4adf28696d8329d918c28613af47ca7f513ac358';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Barrio Viejo' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '35b00c811ba65e42528e995273f77b78de37d59b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bauza' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '6e54596cc5bf91da089aef8bb753ca270502ee56';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Belmore' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '18a82a34b6ae5f74f522d1ca1fac70408c56c943';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bering' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '72223a4bdb9580cb76a722cd40a355fedd098046';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'BerlinCigarMen' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '8318c45eae744237f9cce10970ea423a867f9005';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'BIN Cigar' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'fc06e3e18e4d792887a6f570266a228f79d701dc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Black Label Trading Co.' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'b82bd152c8d0aba179f1abcc5850e879c1b7d49c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Blackbird Cigar Co.' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'aa4d518f7520e84a292044c4c90f6da0bf93af7d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Blanco Cigars' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '0bc11ff0b89f33b652b427249dc22ee6414075d4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bock y Ca.' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'b08c58bf87c6266652c0821b45a973095c4cbcc8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bohekio' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '3436508d76ccee5483c8643ae6a8cc6c792afea4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bolivar' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '954d48b8c3dd900c27bad19b01f2e5c1acde3ed3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bolívar Honduras' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '5ab6628d7ca51a39dd9dd969080d8026e3662150';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bombay Tobak' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '0d8ece5afb4dd0eae6c45b26d6fdf9d88844a9ca';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bongani' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '6763c9ad6159fa9fdb199c3d54001e216a9752ec';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Boutique Blends' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Brun del Ré' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '0e22d6492d03b82a6451e4e23c6b04dfe32e1c84';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bugatti' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'ff0bed0c03dc0a1472556ede52f6e8f3251475ee';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Burger Söhne' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Butera' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'fb206a3190c32d9d2138020dd6cd1c6241628b3c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Byron' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '4f3ffb6e133b57ab1b51d34798c9d23b9f1a1507';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cabal Cigars' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '659ef3c6c9db38815ff162d0419302fb2fd34c73';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Caldwell Cigar Co.' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '139ed99825d633e77da6611d778543443db36e34';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Camacho' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '3040a58787329ed50046b0ed9ed630aab0430f16';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Canaritos' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '60fc652172b39c675e266fead15b841e5a5fa073';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Canned Heat' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'f59881db2c766ba7a2b93cd8ca0039ba9a2752f6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'a8df47cf21eb455a9e05a500340079acbd49b559';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO America' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'f470333905d574b434d123231d1867c42de784f3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO Black' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'eeddeee9d337aea4295763deabe00909ef82309a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO Cameroon' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'bb3e1d05e6c465c6642baab2ce50c1301d9a1259';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Caoba' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'e7ca08c60c3c008fc63ad9f2ac6b0aa0d2485789';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Capadura' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'aa07b38bd1d898925c38fbb89d38011d178aa17f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Capitol' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '23819d777f5efbadae6bcca241a0fd9dc2523fd0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa 1910' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '1e236ca965f145eb13a3b8ed91d778cc312c9ba0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa Cuevas' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '355980d501c9adde5c6646a7c14b2bc0c04cc297';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa Culinaria' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'a7e0c078cb4d7e45094473c661376bda9445cf20';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa de Alegria' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '6e54615a9d51e45b15110073b746d274e44565bf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa de Garcia' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'ce2b5e67faaf6b88969f10b07c1cd25c7407f8cc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa de Torres' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'd14a9e590f62b73a9b86a373dc0bfc0c62913316';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa Turrent' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'b65bbc1c0deefb88440832ed69f10e4f7ba115b0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casagranda' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'eb7c216d9a6dc8f3ba025b4f20a75be9dcdc9105';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casdagli' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '9f21806a437f7aeacf3fc6baf7b67098076584d1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Castillo de Reyes' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'b2f0e19946f86c078c53ef236cba9b92b5a67e06';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cavalier Genève' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'b2230c7fc7cc69ebefdf912a550c2ba350bd96cd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Chaba' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '2029738699a27b9add62e79ee327ac5b5f6a416a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Charatan' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '45e5356be3fe6b071d90cda8d7ff5909d2e6eb5f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Chateau Diadem' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '103d6e5369984924ec2a31efe8dd5bf4d78a733f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cházaro' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '8f9e3d1bc1e179f55fcfa35aaefe5890f2c8417a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Chinchalero' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'ff45743b9486ec7c9699c666c4fa93b646df2a98';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Chogüí' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '17d2f84ad1e68f50dcc25fe13b6cc22f4e6947f4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Chone' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '55ee8327b04cf89e499899a67701d227a69b630d';
-- brands|Christo|gamme|en — virgule décimale 0,9 en 0.9
UPDATE `brands` SET `gamme_en` = '[{"name":"Sumatra","color":"#A0522D","force":"Mild-Medium","wrapper":"Sumatra","vitolas":[],"story":"Sumatra wrapper, in Petit Robusto (4 × 48) and Toro (5¾ × 50), says Cigarworld.de; mild-to-medium strength and a filler from Germany, says StarkeZigarren.de, which has them in stock in October 2026."},{"name":"Brasil","color":"#6B4226","force":"Medium","wrapper":"Brasil","vitolas":[],"story":"Brasil wrapper, in Petit Robusto and Toro; medium strength and German and Brazilian tobaccos, rolled by hand in Germany, says StarkeZigarren.de; Cigarworld.de gives a filler of Brasil and Sumatra under an Indonesian binder."},{"name":"Werkfleiß","color":"#A0522D","force":null,"wrapper":"Sumatra","vitolas":[],"story":"Toro bearing the name of the former factory''s brand; Sumatra wrapper, Java binder and a filler of German Geudertheimer and Burley, Domingo, Brasil and Sumatra, says Bor Breuer Zigarren; Cigarworld.de gives Indonesian wrapper and binder, a filler of Brasil and Sumatra."},{"name":"Zigarillos","color":"#8B5A2B","force":"Mild-Medium","wrapper":"Brasil or Sumatra","vitolas":[],"story":"Chicos and Zigarillos, in Brasil, Sumatra or assorted, in sixes or twelves, says Cigarworld.de; StarkeZigarren.de says the Zigarillos are handmade and gives the Zigarillo Brasil (9 × 0.9 cm) as mild-to-medium, temporarily unavailable in October 2026."}]'
 WHERE `name` = 'Christo' AND SHA1(TRIM(`gamme`)) = 'b7ae9182e7c41fe3c58f9e6d9dc2ea1ffab711b0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Christo' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'b7ae9182e7c41fe3c58f9e6d9dc2ea1ffab711b0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cigarkings' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '8387180b768fc31502efdaed24fc995534ae413c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CLE Cigar Company' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '11dc2dfc15ebbb2578384e79427671e8d2861971';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cohiba' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '8f686e13dfb430b8d908e6b7d3aa6012adf214e2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cohiba USA' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '9b786ec50bd17529ade08a8d256eccd155ecd9cf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Colpuros' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '65fbb0af435a4c9632e5cbba9ad41d58cace8001';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Compagnia Toscana Sigari' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'e0839d6b726c08bd55315f7522ecd0e5b3b71118';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cornelius & Anthony' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '7c360080c1b77256ec2b280c01f339b655473b06';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Corona Real' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '50dd550609f92dcdb5399a07c85254c9215dfbd6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Crowned Heads' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '03eed12d7b068068e917239515fff329aee73070';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Crux Cigars' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'fe5131d7008c9501ee3e70a9d33cd42328266fa2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CSC' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '77c6459fdecb0409092602c9bdb8b0567695be43';
-- brands|Cuaba|gamme|en — nom resté en français
UPDATE `brands` SET `gamme_en` = '[{"name":"Salomones","color":"#8B4513","force":"Medium-Full","story":"Salomón, which joined the regular portfolio in 2003 with Distinguido and Diadema, says habanos.com. Wikipedia describes it as a double perfecto of 184 mm with a cepo of 57 (Salomónes I).","vitolas":["Salomón"],"wrapper":"Vuelta Abajo"},{"name":"Divinos","color":"#A0522D","force":"Medium","story":"One of the brand''s four original sizes, with Tradicionales, Generosos and Exclusivos, says habanos.com. Wikipedia describes it as a small perfecto of 102 mm with a cepo of 43, named Petit Bouquet.","vitolas":["Petit Bouquet"],"wrapper":"Vuelta Abajo"},{"name":"Distinguidos and Diademas","color":"#7A4A2B","force":null,"wrapper":"Vuelta Abajo","vitolas":[],"story":"Distinguido and Diadema have completed the regular range since 2003, says habanos.com. Wikipedia gives 162 mm with a cepo of 52 for the Distinguido and 232 mm with a cepo of 55 for the Diadema, a perfecto of very large size."}]'
 WHERE `name` = 'Cuaba' AND SHA1(TRIM(`gamme`)) = '0136f5b71f5c4173a9e5d384cdc0b1a477880b67';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuaba' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '0136f5b71f5c4173a9e5d384cdc0b1a477880b67';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuba Aliados' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'b5563588c234e129d1fdba2292de412030f0742f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuban Crafters' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'd8534ff05360ddf16379213dfe301a033169c1cf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuban Stock Cigar Co.' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '93a304f6df4395db2db3b04a36b52b1bc70bf126';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuervo y Sobrinos' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'addc692256600912fd1aa60236f561bc8b2428e3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuesta-Rey' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '9c93c642e2290bb15f861a191edb9de2594123aa';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Curivari' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'f81dc2aa2f5050c6bd00bf974f63518a9e470059';
-- brands|D'Crossier|gamme|en — ambiguïté cape cultivée soleil
UPDATE `brands` SET `gamme_en` = '[{"name":"Golden Blend","color":"#A0522D","force":null,"wrapper":"Ecuador","vitolas":[],"story":"The company''s first line, under the Diplomacy Series in 2007; Dominican binder, Costa Rican and Dominican filler; its strength is described differently from source to source, mild according to one site, medium to full-bodied according to another depending on the vitola. Its Reserva variant is dedicated to the president''s father, Isaias Santana Crossier (1945-2020)."},{"name":"Flor de D''Crossier","color":"#A0522D","force":"Medium","wrapper":"Habano (Ecuador)","vitolas":[],"story":"Its Selección 512 opened rolling at ABAM, in the Dominican Republic, in 2017; a medium body that rises towards full-bodied in the larger formats, according to the specialist press."},{"name":"Imperium Class Vintage","color":"#6B4226","force":"Medium-Full","wrapper":"Habano Criollo Especial","vitolas":[],"story":"Sun-grown Costa Rican wrapper, Ecuadorian, Dominican and Costa Rican filler; seven formats according to retailers."},{"name":"Presidential Collection","color":"#A0522D","force":null,"wrapper":"Undisclosed","vitolas":[],"story":"A line within the Diplomacy Series; its extension Pennsylvania Avenue (2009), with a Costa Rican Habano Criollo Especial wrapper and Brazilian and Dominican filler, was rolled at Pure Aroma Cigars S.A. in Costa Rica, then aged for nineteen months in the company''s warehouse in Hialeah Gardens (Florida)."},{"name":"L''Forte","color":"#6B4226","force":"Full","wrapper":"Costa Rica","vitolas":[],"story":"Launched at the IPCPR 2014, Dominican and Nicaraguan filler; full-bodied according to retailers, produced at 2,000 boxes a year according to Cigar Coop (2016)."},{"name":"Premium Blend","color":"#C9A96E","force":"Mild","wrapper":"Connecticut (Ecuador)","vitolas":[],"story":"A fine, light, silky wrapper, for a milder profile than L''Forte according to retailers."}]'
 WHERE `name` = 'D''Crossier' AND SHA1(TRIM(`gamme`)) = 'a86fa2c0252a6d65b414a3c043445ae3c2b163be';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'D''Crossier' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'a86fa2c0252a6d65b414a3c043445ae3c2b163be';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dalay' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '518188882242ca56f68670f4f92c4b7ee3f1c0cc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Daniel Marshall' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'b5d9b84215eb3aeed8e5011ab3cb5d033f4feb10';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dannemann' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '6c27c92c28b76239227f8b3357b11ad17dfa9641';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dapper' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '935323836ebb4abf0c4c49769e50fe52691761f3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Darier & Cleef' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'cb9e5633e34d801560584e6a92179cd5933249e8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Davidoff' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'ec5bef287fa3b4c7e56e5aa820e7a8c8eb384f02';
-- brands|DBL|gamme|en — sous-cape d'Équateur mal rendue
UPDATE `brands` SET `gamme_en` = '[{"name":"Amarillo","color":"#C9A96E","force":"Mild-Medium","wrapper":"Connecticut","vitolas":[],"story":"Connecticut wrapper aged in rum barrels, with Dominican filler from Almonte''s farm in Santiago, according to retailer El Cigar Shop."},{"name":"Maduro","color":"#4A3728","force":"Medium-Full","wrapper":"Undisclosed","vitolas":[],"story":"Vitolas named after baseball players'' nicknames, says the house: Little Bull, La Maquina, La Flecha, Big Papi, El Grande."},{"name":"Mafu","color":"#6B4226","force":"Full","wrapper":"Cameroon or San Andrés","vitolas":[],"story":"Offered with a Cameroon or San Andrés wrapper, in Toro and Grande formats."},{"name":"Extra Viejo","color":"#8B5A2B","force":"Medium-Full","wrapper":"Arapiraca (Mexico)","vitolas":[],"story":"Arapiraca wrapper the house calls Mexican, over Brazilian and Dominican filler."},{"name":"La Tabla","color":"#4A2C1A","force":"Full","wrapper":"Arapiraca (Mexico)","vitolas":[],"story":"Ecuadorian Cameroon binder, with Dominican Corojo 99 and Pennsylvania broadleaf filler; presented at the PCA trade show in 2023."},{"name":"2a Generación Reserva Exclusiva","color":"#A0522D","force":null,"wrapper":"Undisclosed","vitolas":[],"story":"Limited to 500 boxes, says the house, made with tobacco from Almonte''s own crop."}]'
 WHERE `name` = 'DBL' AND SHA1(TRIM(`gamme`)) = '54c69fa70050c9bc5a1729682fc42602f6d00b00';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'DBL' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '54c69fa70050c9bc5a1729682fc42602f6d00b00';
-- brands|De Los Reyes Cigars|gamme|en — ajout « valley » supprimé
UPDATE `brands` SET `gamme_en` = '[{"name":"Saga","color":"#6B4226","force":"Medium","story":"The brand the house exports most. It runs several series — Golden Age, Blend No. 7, Short Tales — on tobacco from the fields of Leo Reyes.","vitolas":["Robusto","Toro","Corona","Lancero"],"wrapper":"Dominican blends"},{"name":"Saga Blend No. 7","color":"#5A3A24","force":"Full","story":"The Saga series most often looked up by name. A Brazilian wrapper from the family farm, a Dominican Habano binder, Dominican and Central American filler, in three sizes only.","vitolas":["Robusto","Perfecto","Toro Gordo"],"wrapper":"Brazilian Cobra wrapper from the Reyes farm"},{"name":"Don Julio","color":"#7A4A2C","force":"Medium-Full","story":"A man''s name: Don Julio Samuel Reyes Fermín, a third-generation grower. Entirely Dominican, on tobacco from the family fields in the Cibao. Two lines — Punta Espada (2014) and Sang Bleu (2024), the first new regular-production line in ten years.","vitolas":["Robusto","Toro","Churchill"],"wrapper":"Dominican tobaccos from the Cibao"},{"name":"Augusto Reyes","color":"#8B5A2B","force":"Medium-Full","story":"The founder''s name, on the line that stays closest to the house''s own tobacco.","vitolas":["Robusto","Toro","Churchill"],"wrapper":"Dominican blends"},{"name":"Arsen","color":"#4A3728","force":"Medium","story":"Conceived outside, rolled here. Arsen Gasparian launched it in 2010 — he published the Russian magazine Hecho a Mano — and it uses the wrapper from the Navarrete farm.","vitolas":["Robusto","Toro"],"wrapper":"Navarrete wrapper"}]'
 WHERE `name` = 'De Los Reyes Cigars' AND SHA1(TRIM(`gamme`)) = 'eb9f9a4f922d823796ca42e1212c399e1606d381';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'De Los Reyes Cigars' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'eb9f9a4f922d823796ca42e1212c399e1606d381';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Debonaire House' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'f810d0dba6d38196ea60ae6c9280e38b67cfc248';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Despot' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '86b353ed024492abaec96e33d67686bba0802697';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Diamond Crown' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '21abe816edff827b807123881840c890cd3c77ba';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dios del Sol' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '94efe2922e3c8793a3dba18993cf77a09bd5c473';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Diplomáticos' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '85fc6235b246af0f139cb6261c9352e7162dc1ba';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Domaine de Lavalette' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '07337f91fd52b24e4eb5f2b9247ce6c2d59d3917';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Domenico' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'ee7f7ee0b92c6a74804c64c4b650ef710ac8603a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dominican Estates' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'd884cff233ccd0cbc707c60989c4991d79253b6c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Collins' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '459c745a052c975d94d32814b2109cd5594d3087';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Diego' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'dd5e3f125cfb8d21535bd7cd0d5387c7d46a65d2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Duarte' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '596f5f9b7cd51cf1b9cbbbb12ce5536919f8cb92';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Emmanuel' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '26ccc63dfb66d95a973dd844b25b9353ff186411';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Fidel' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '2850a1b1023284b0f293a52526f10c5be29c7d0b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Lucas' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '1c667901c515f0c5998688362b682cfd020716dc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Tomas' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '682e07af79c684cff985077a6f2b5a16d01a41d5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Zuarin' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '1815d40fcae330df5069954ba07f4d4062533eb0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dona Flor' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '0f0b0a76f2f350d35441e5faef635a2591c5d8df';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dos Amigos' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'c83a73545674abafc53ecfaf7d004dd0d5da82d5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dos Jotas' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '3de15ee0bc9843618f2a9d864d3d5f4a5aea9f04';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dos Santos' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '07633e884b5f58f6173212332d1419385ca60507';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Drew Estate' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '665288b7ea1eb3e61396516f96a343212d130ee9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Drunk Chicken' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '5aafa5e64b019f3f3e91ab29210db3512563cf7e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dunbarton Tobacco & Trust' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '90e9bd1b67175900a4324347840de6e7c4ee4ad4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'E.P. Carrillo' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'd03eb491af511d3707963ce4a0d047607b79aade';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Galan' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '00883d8a2d6bd874f7cfe2145b81ebde3462c87b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Gaucho' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '31d6bd4d2c635df594872d4c0e47adba837e7e99';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Mago' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '9b782210e7902f57bfd518d69903152c13478e25';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Rey del Mundo' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '0d3161d3f7c8a1550deba1591b276189f744fe01';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Rey del Mundo Honduras' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Septimo' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'e506f35e01fa9773e1e1dfcc948644983d09d6e8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Titan de Bronze' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'f6eef082ee70dbe7a3ed278a0ad0d492d813ae8a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Eladio Diaz' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '3d7d017ce819e654c4a6e949deaf8f401517b702';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Emilio Cigars' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'e893168270dfd1ba6115af142e45794372e9c276';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Emperors Cut' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'bee5876a4f40f9b6e9a0726618dda92e8795e9b1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Epic Cigars' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '983b134f1d113e2b1adb3bfd324e5d4b85dd8f92';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Espinosa' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '1c2616888b24bf7632a518705a42fd3a9e4aab05';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Esteban Carreras' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '7e74c2e8c7a9fd6f8b75970345d5b36e4b45a805';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Excalibur' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '486fd6b70a10cc540fecceaa2cb52e6a683ccbec';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ezra Zion' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '4fb1ac5558bf1f0b92a40249226b7d75231bb05f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fable Cigars' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'e9b8cfa82c78c3d44be107da8b833d1572ea9399';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fábrica de Tabaco Estrela' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '9e36dc941d3892c084f02734e51a595d2ac1ca98';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ferio Tego' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '53b64e80a657a246ee5c29229bd39054843a6a70';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Finca Tabaquera El Sitio' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '8c006ac6b336565b2d5c23da27dba0d1f35e5570';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Firecracker' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '5abaf9c3b6a5e033638073b3d373ea3ff4a702d5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Flavoroute' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '5be37f3b5c2fb7d001a89f36af2b4c988ca27453';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Flor de Selva' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '872356a31af624eb520003dbbbe46c1ca60ab78e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Flor del Sol' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '8b581c92293917f9278e3294150f9bdf79eb6774';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fonseca' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '32a3cae0bb39c8d6aff4dda7c5212eecf99e172e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fonseca Nicaraguayen' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Forged Cigar Company' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fortis Cigars' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '0410c751aeb66935383bfd7cc3cb9bbd868cda69';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Foundation Cigar Company' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'b235f31e30b1236a9e1ea83459b111942cd43303';
-- brands|Fratello|gamme|en — Assemblage omis dans wrapper
UPDATE `brands` SET `gamme_en` = '[{"name":"Fratello Bianco","color":"#C9A96E","force":"Medium","wrapper":"Ecuadorian Connecticut","vitolas":["Robusto","Toro"],"story":"The pale side of the catalogue, under an Ecuadorian Connecticut wrapper. It is the house''s most accessible range, and the one that got it onto retailers'' shelves."},{"name":"Fratello Oro","color":"#8B5A2B","force":"Medium-Full","wrapper":"Blend rolled at Joya de Nicaragua","vitolas":["Robusto","Toro","Corona"],"story":"The golden range, denser than the Bianco. Same workshop, same family of tobaccos, a more assertive composition."},{"name":"Navetta","color":"#4A2C1A","force":"Full","wrapper":"Blend rolled at Joya de Nicaragua","vitolas":["Robusto","Toro"],"story":"\\"Shuttle\\", in Italian. The name of a former NASA engineer who makes cigars, and the fullest side of his catalogue."},{"name":"Fratello Classico","color":"#6B4226","force":"Medium-Full","wrapper":"Nicaraguan Habano","vitolas":[],"story":"The founding blend, 2013, under the Fratello name alone, renamed Classico in 2018."}]'
 WHERE `name` = 'Fratello' AND SHA1(TRIM(`gamme`)) = 'd47d7859e5497e3b43da83155b254cc13f74bf35';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fratello' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'd47d7859e5497e3b43da83155b254cc13f74bf35';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Freud Cigar Co.' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '215e25c7b056a7dba9cd3f1b752deded4b4a3d15';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Gellis Family Cigars' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'ba2d74759ce2084ab85463c45ad5971b7b174f45';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'General Cigar' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'd23f9423df2c9a895930cd73bb384a74a268b931';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'German Engineered Cigars' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'ba8d7d556965938bfe52ef2901e157f94bac801a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Gispert' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '5ac5665aef8242cb8e9f640e188fcdeabddfea42';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'God of Fire' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '5e4d21c71b5a3e3fd79289eae910153c5f1789e6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Golden Djawa' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'cad96dddec71adf056492fb65c7a7be098cbe3c8';
-- brands|Gran Habano|gamme|en — prétention rendu par ambition
UPDATE `brands` SET `gamme_en` = '[{"name":"Connecticut No. 1","color":"#C9A96E","force":"Mild","story":"The first of the three numbers of 2003: mild, Connecticut wrapper.","vitolas":[],"wrapper":"Connecticut"},{"name":"Habano No. 3","color":"#8B5A2B","force":"Medium","story":"The middle one.","vitolas":[],"wrapper":"Habano"},{"name":"Corojo No. 5","color":"#7A2E1E","force":"Full","story":"The peppery one. Corojo, as at J. Fuego, is the leaf of houses that want character.","vitolas":[],"wrapper":"Corojo"},{"name":"3 Siglos","color":"#5B3A29","force":"Medium-Full","story":"Three centuries — the name states the claim, four years after the brand.","vitolas":[],"wrapper":"Undisclosed"},{"name":"GR Specials Red Label","color":"#A0522D","force":"Full","wrapper":"Nicaraguan Corojo","vitolas":[],"story":"Bundle by George A. Rico, son of Guillermo, with whom he created Gran Habano; the band bears the words Hecho a Mano, according to ghcigars.com. According to Atlantic Cigar: Nicaraguan corojo wrapper, Honduran binder, Nicaraguan and Mexican filler, full strength, in Gran Robusto 6 x 54; Cigarplace adds a Robusto 5 x 50, made in Honduras."}]'
 WHERE `name` = 'Gran Habano' AND SHA1(TRIM(`gamme`)) = '94d456ab5b5087629b0946c00f953160f945fc37';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Gran Habano' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '94d456ab5b5087629b0946c00f953160f945fc37';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Graycliff' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'd2de4349e0e44beedcf7332595fe262f58198bf9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Great Wall Cigars' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '49d3aa1ed4dcceafe22735ce1ff34bad7a8d7bf6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Gurkha' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'df5bc88a9e47416da715146a3f0bfbca277f19fb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'H. Upmann' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'b12972ef64032d059f55af95d2898ba9b56e3225';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'H. Upmann Dominicain' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'H.R.' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'f5c8a95d4671538d4938d064fb1ad084524b5a27';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Helvada' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '8243c46d55150dfd56989a9a91715daf53774882';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Hemmys' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '5bc36be800c6c53348687df234fe065fbba9484c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Henry Clay' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Herr Lehmann' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'caf27b5638e176c59261d32bc3c75efedbb33b2c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Hiram & Solomon' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '46dc649869548476b849c4e6c69ae16a2641c1a3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Holt''s Cigar Company' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'f63fe69d31944a5a1cd6167025c1d80fba267722';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Horacio' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '905aae3cee0f297a5eb9999531b67ef7471d3f8d';
-- brands|Hoyo de Monterrey|gamme|en — vitola de galera non traduit
UPDATE `brands` SET `gamme_en` = '[{"name":"Epicure","color":"#8B4513","story":"Habanos groups the Epicure No. 1, the Epicure No. 2 and the Epicure Especial in a line with a distinct presentation, and a December 2024 press release adds the Epicure No. 3, cepo 54 x 125 mm, the brand''s first figurado. The Epicure No. 1 measures 143 mm for a cepo 46, the Epicure No. 2 124 mm for a cepo 50 (its Reserva Cosecha 2012 dates from 2016) and the Epicure Especial 141 mm for a cepo 50 (Edición Limitada in 2004, regular portfolio since 2008). Habanos describes the brand as mild in strength.","wrapper":"Vuelta Abajo","force":"Mild","vitolas":["Epicure No. 1","Epicure No. 2","Epicure Especial","Epicure No. 3"]},{"name":"Double Coronas","color":"#6B4423","force":"Mild","wrapper":"Vuelta Abajo","vitolas":[],"story":"A vitola of the Prominentes galera, cepo 49 x 194 mm according to Wikipedia; habanos.com cites the Double Coronas and the Le Hoyo series for their slim and medium gauges. Its Gran Reserva Cosecha 2013 is, the house says, the brand''s first Gran Reserva in this vitola."},{"name":"Série Le Hoyo","color":"#8C5A2B","force":"Mild","wrapper":"Vuelta Abajo","vitolas":[],"story":"A series traditionally made up of slim to medium vitolas. Le Hoyo de San Juan (2014, cepo 54 x 150 mm, galera Geniales) adds a large gauge to it, with no novelty of this kind for decades according to habanos.com, made with seco and ligero only; Le Hoyo de Río Seco (2018) measures 56 x 140 mm."},{"name":"Petit Robustos","color":"#A67B5B","force":"Mild","wrapper":"Vuelta Abajo","vitolas":[],"story":"A vitola of 102 mm for a cepo 50, added to the portfolio in 2004 for smokers short of time, says habanos.com."}]'
 WHERE `name` = 'Hoyo de Monterrey' AND SHA1(TRIM(`gamme`)) = 'a2015aef3c1dc4943ecc18d4da54622cefa6ea58';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Hoyo de Monterrey' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'a2015aef3c1dc4943ecc18d4da54622cefa6ea58';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Hoyo de Monterrey Honduras' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'f655166f297d88daaf14030fd189b271219c8ef7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'HVC Cigars' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'f023431637f55d866b9213347eecc39f5d873a53';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ibis' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '19c22d15858665a25480876602ee9ae42b124a82';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'IGM Cigars' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '6f61d62813f2730793c2be971fdc318d09948bf0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Illusione' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '2d0fcc91c12531f3799a386a9140307a0a949448';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'J. Fuego' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '32ce60a20df14376cea4f8fb95141537a55a5fed';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'J.C. Newman' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '38cff159ecc7c386cd0bce09064bdb04d2c6bccc';
-- brands|Jake Wyatt Cigar Co.|gamme|en — origine sous-cape restreinte à tort
UPDATE `brands` SET `gamme_en` = '[{"name":"Appendix II","color":"#4A3728","force":"Medium-Full","wrapper":"Undisclosed","vitolas":[],"story":"A line of the Connoisseur collection, also offered as a figurado."},{"name":"Titan Series","color":"#6B4226","force":"Medium","wrapper":"Undisclosed","vitolas":[],"story":"Goliad, Colossus, Omega — three everyday cigars, 2026, binder and fillers from Honduras and Nicaragua."}]'
 WHERE `name` = 'Jake Wyatt Cigar Co.' AND SHA1(TRIM(`gamme`)) = 'a2d29e73e7970d57d3ac6983da7727fcb03c72ce';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Jake Wyatt Cigar Co.' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'a2d29e73e7970d57d3ac6983da7727fcb03c72ce';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'JAMM Cigar' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '0f911450c1c198748d2adb44b672192602937324';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Jas Sum Kral' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'fcd4512ee2ca4e2269121f1676ea1ac1caf6b54d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'José L. Piedra' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '4f7779245e2f982151da519609ee67c212450267';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Joya de Nicaragua' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'a560061c37c6dc630e946459c1a3a0f46c2e5b5b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Joyas de Panamá' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '1904cb682f670b6bc83c2e1f082fb871119e406d';
-- brands|Juan Clemente|gamme|en — douceur : mildness (glossaire)
UPDATE `brands` SET `gamme_en` = '[{"name":"Club Selection","color":"#C9A227","force":"Light-Medium","wrapper":"Connecticut Shade","vitolas":["Corona"],"story":"Cedar, hay, a discreet mildness. And the band at the FOOT of the cigar, at the end you light: a signature you spot from ten metres and that nobody else has dared."},{"name":"Rothschild","color":"#B5651D","force":"Medium","wrapper":"Connecticut Shade","vitolas":["Robusto"],"story":"The short format of the house, in the classic Dominican tradition — balance, suppleness, no demonstration."}]'
 WHERE `name` = 'Juan Clemente' AND SHA1(TRIM(`gamme`)) = '05b4a179c97e0f2d2f5ffd036d208d6a227be729';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Juan Clemente' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '05b4a179c97e0f2d2f5ffd036d208d6a227be729';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Juan López' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'b066d6a0f094a511f287ae79e1544f829fef064c';
-- brands|Kafie 1901|gamme|en — cinquante ans : fiftieth tronqué
UPDATE `brands` SET `gamme_en` = '[{"name":"Serie L Natural","color":"#8B5A2B","force":"Medium","wrapper":"Dominican","vitolas":[],"story":"The first cigar of the Dominican life, composed with La Aurora''s Manuel Inoa. All Dominican. The L for Kafie''s fifty years."},{"name":"Don Fernando Maduro","color":"#3E2A1E","force":"Full","wrapper":"Maduro","vitolas":[],"story":"One of the four blends of the Danlí years."}]'
 WHERE `name` = 'Kafie 1901' AND SHA1(TRIM(`gamme`)) = '4628ce2e97e365a1adf9b608f492b807d3bb095e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Kafie 1901' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '4628ce2e97e365a1adf9b608f492b807d3bb095e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Karen Berger Cigars' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '1e0bf43357ba26c05166f879db6c2257caf4aa3f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Kelner Boutique Factory' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'dce081f0817656789303b477d659bb7987172184';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Kinix' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '257bebadda2b3ff3fad2052c2227cc6d1d05d118';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Kolumbus' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '6e263cf90c5d8a3a0e9f312595673a2fadaba874';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Kristoff' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '47edd1b2786394cb014d31febdc4f4704fd27365';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'L''Atelier' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '44c80bed4479c91e604591c7df4985f89b7254a6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Aroma de Cuba' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '1d669659cf821f188797d30afd525e5ba7773a46';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Aurora' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'efacce75a0cc7935f754fcc87e122069025c0eab';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Barba' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '6b7679296af955b60e038d3f6453be86323c15fc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Flor de Cano' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '3e39c86564094be781944e2f0f8593edc1e96a94';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Flor de Copán' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '1b26d305f9cdcb239f727f4560e91f60626c41b5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Flor Dominicana' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '016303408c107ed4d7bed9f04f651ebcb0ea4223';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Fontana' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'a20657aeebdd46c77f51418b57f19ed128b1210c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Galana' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '2d0ddb899add29051f8121c7cf2b676ed834e97b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Gianna' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '3a8f419b33d64c08eda74c612475de2318f8e6f2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Gloria Cubana' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'c5588ec9baec84a6e87b824a4bb3f6df979642f9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Gloria Cubana Dominicaine' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Palina' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'ac71b53072761ad25639982106d7efc91e5d8bc9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Sirena' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '493249520eff1b5e4f9caae2e074490ed03396b8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Unica' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '020aa3752d04e152928f1bb16723501382f0acbf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Las Cabrillas' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '4879c29b31046779403048a9c00d951c92d340a8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Latitude Zero' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '1ad0681a40995dc3d7ff8bac8f3081738e65a671';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Laura Chavin' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'c5d3b0f90a4ed2fe46980e02b76c2cbebc0de732';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Le Fagot Cigar' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '4b957d2d2b86ee961cf8307527e04ad6fd9856d5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'League of Fat Bastards' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '2bf3013686ebb629f13287b84c57a0f789ea23fc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Legado' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '599ca0737da0fa73bba3af5ec5e9adc2a4d9771a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Leite & Alves' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '8d8f2cc7a7841c57dcb3c89b25a9836d98cef833';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Licenciados' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'feef3f1dd794c658a42aa40cfb653bedb2ad21d4';
-- brands|Liga Privada|gamme|en — vitola omise, ordre rétabli
UPDATE `brands` SET `gamme_en` = '[{"name":"No.9","color":"#1C0A00","force":"Full","story":"The brand''s original blend. Connecticut River Valley Broadleaf No. 1 Dark wrapper, Brazilian Mata Fina binder, Honduran and Nicaraguan filler, says the house. Sizes in the house''s catalogue: Coronets, Robusto, Corona Viva, Toro (6 x 52 inches), Belicoso, Corona Doble, and the Flying Pig as a seasonal release.","vitolas":["Toro","Robusto","No.9 Perfecto","Flying Pig","Little Bigger Fish","Petit Lancero"],"wrapper":"Connecticut Broadleaf"},{"name":"T52","color":"#2D0A00","force":"Full","story":"Connecticut Habano wrapper, cut and dried on the stalk, aged 30 to 36 months according to the house; Mata Fina binder, Honduran and Nicaraguan filler. Same sizes as the No.9 in the house''s catalogue. Released in 2009 according to Cigar Coop.","vitolas":["Toro","Flying Pig","Petit Toro","Unico Serie"],"wrapper":"Connecticut Habano (stalk-cut)"},{"name":"Unico Serie","color":"#3D1C00","force":"Full","story":"A series launched in 2010 according to Cigar Coop: a unique blend per size, a variation on the No.9 and the T52. The Papas Fritas, a short corona of 115 x 44 mm (4 1/2 x 44 inches), are a short filler made of the trimmings of the other Liga Privada cigars, under a Connecticut Broadleaf maduro wrapper; the house now offers them as a separate collection.","vitolas":["Papas Fritas","Unico Serie annual"],"wrapper":"Varies by edition"}]'
 WHERE `name` = 'Liga Privada' AND SHA1(TRIM(`gamme`)) = 'a77f2a46cec9f93138087d5d2a7a7e127b0d4ba0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Liga Privada' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'a77f2a46cec9f93138087d5d2a7a7e127b0d4ba0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Loaisiga' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '75824a8089a14da9499d1ad564314437da38b459';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Los Amigos' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '53a709b2881001ec8fe80bcc00b133f98d905259';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Luciano Cigars' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'e194ee01cf362db43219ff0739e0eba9fce63e4c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Macanudo' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '0e2bc37a1129c93655bb8ef02ea6830ab84693bf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Malekö' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'a055a130c99e087f737f792a0daf214f0d218cfc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Mara' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '15e219c34daad9161d95f3fa14183351ced44d33';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Marca Fina' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '1dcd55451be68a9a64d3b9c2568ced13248ed5d4';
-- brands|Mata Hari|gamme|en — colorado nuance de couleur
UPDATE `brands` SET `gamme_en` = '[{"name":"Courtisane","color":"#C9A96E","force":"Mild-Medium","wrapper":"Undisclosed","vitolas":[],"story":"Entirely Indonesian tobacco according to the house, which gives it notes of wood, leather, vanilla and coffee."},{"name":"Java Exotica","color":"#A0522D","force":"Medium","wrapper":"Java (colorado)","vitolas":[],"story":"Dominican and Brazilian tobacco under a Java wrapper whose first harvest dates back to 2020, says the house."},{"name":"Limited Edition 2024","color":"#4A3728","force":null,"wrapper":"San Andrés (Mexico)","vitolas":[],"story":"Brazilian, Dominican and Indonesian tobacco under a Mexican San Andrés wrapper; notes of earth and chocolate according to the house."}]'
 WHERE `name` = 'Mata Hari' AND SHA1(TRIM(`gamme`)) = '92808dda9314b55fec43fde19c366a4b0a54b82e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Mata Hari' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '92808dda9314b55fec43fde19c366a4b0a54b82e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Matacan' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'ffecc8a983ccec7b10061ffc4a90a140ee150590';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Matilde' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '459b004a5fbd1d34a0155ad3caa260ab116d91be';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'May''s Cigars' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'd55d0390731a252d2828bb879e507800db10b4d9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Maya Selva Cigars' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '86bbb79d9577d8ea42c634793971c6daed97fad5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Meerapfel' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'ee7d73a5ae5b675f5f7c81f02a785643872dff6a';
-- brands|Menendez Amerino|gamme|en — grammaire: become -> became
UPDATE `brands` SET `gamme_en` = '[{"name":"Alonso Menendez","color":"#4A3728","force":"Medium-Full","wrapper":"Bahian mata fina","vitolas":["Robusto","Toro","Corona"],"story":"Created in 1980, before Dona Flor itself. It carries the first name of the Cuban family that brought the method."},{"name":"Alonso Del Patron","color":"#6B4226","force":"Medium","wrapper":"Bahian mata fina","vitolas":["Robusto","Toro"],"story":"Out in 2018, forty years after the factory was founded. A house bringing out a new line at that age is rare in Brazil."},{"name":"Dona Flor","color":"#8B5A2B","force":"Medium","wrapper":"Bahian mata fina","vitolas":["Robusto","Toro","Corona","Lonsdale"],"story":"Launched in 1982 and became the house''s brand. It has its own entry in this atlas: Cuban rolling, Brazilian leaf."}]'
 WHERE `name` = 'Menendez Amerino' AND SHA1(TRIM(`gamme`)) = 'acbdc092579b265f0b0edf6abd211f59966e778f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Menendez Amerino' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'acbdc092579b265f0b0edf6abd211f59966e778f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Miami Cigar & Co.' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '3766250b1955df0f7795563b0d8c198abd20ea8e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Micallef' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '926063232e7b2030cb84aef5158e7b4282b153bd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Mombacho' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'e723cd2491e075b136a4f6c2bd2c610b2c7cd310';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Monte Pascoal' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '464e5ba85aec44a5dea4a6e721d779109ff97ef3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Montealto' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'd15f17135a6c36b7bf85512f6015e141e48b2d80';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Montecristo' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '16d0e3775457212b88110a229c91ea267b1821a3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Montecristo Dominicain' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '3425e18150c2eb7c5f1f0f34209860da99498512';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Montecruz' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'b68e4f4c02e1932884a9e3ea8c030390820fb8bb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'MOSI' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '702d6b704ce24197412312bcb4564bf4b8fe1da4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Mosi Oa Tunya' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '4ba489290b280110fc4275fb25b2c4cb3042c014';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Mustique' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '7744f5485b61ebdb644641ddfb9c33258370e0c9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'My Father' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '70ee8e6f847849e3d11b7ef36c84822061f223b5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'NACSA' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '87ee05ba5b2bfcb68510cca428b7b63422c6d8ab';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Nat Sherman' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '097cafb1f7993ac0ef898dbf8388112d0d8a0ad8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Nicoya' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '65dad592473b81014b75e4620c15127052d54772';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Nomad' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '080fb9b9c3300456a08d1448ed9ec4a628933cdc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Nordlicht' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '4bb5e11f5198eb925bf6aae0c3a00274faadcfc4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Notorious' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '832c7aab01ca776c3c6209f8f84ca7e801416c15';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oettinger Davidoff' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ohana' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '8cddc511d02b0bbfd6d70ae4a7596291c5f07bed';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oliva' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '9c5f50d758befe5b930bd07d98a005f0d6622e93';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oliva Connecticut Reserve' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '4679ec1e284286b7d1bce58709002a299d6e9c36';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oliva Serie G' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '18da7f02b077a78a102f222f2678f48b4183473d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Omar Rodriguez' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '0904b24493d70b8c3f16dd2a2aaea20c46b213c8';
-- brands|Onyx|gamme|en — noircie: blackened, pas black
UPDATE `brands` SET `gamme_en` = '[{"name":"Reserve","color":"#4A2C1A","force":"Medium-Full","wrapper":"Blackened Connecticut Broadleaf","vitolas":[],"story":"Blackened Connecticut Broadleaf wrapper over a Nicaraguan binder and a Dominican, Nicaraguan and Peruvian filler, medium-to-full strength, says the house, in five vitolas: Robusto (5 x 50), Toro (6 x 50), Churchill (7 x 50), No. 2 Belicoso (6 1/8 x 52) and Torbusto (5 1/2 x 60)."},{"name":"Bold Nicaragua","color":"#4A3728","force":"Full","wrapper":"San Andrés (Mexico)","vitolas":[],"story":"Dark San Andrés wrapper over a Nicaraguan binder, with a Nicaraguan and Dominican filler, says the house, which speaks of Nicaraguan tobaccos aged more than four years; in three vitolas, Robusto (5 x 50), Toro (6 x 54) and Magnum (6 x 60); full strength, says Payless Cigars and Pipes."},{"name":"Vintage Nicaragua","color":"#8B5A2B","force":"Medium-Full","wrapper":"Habano (Nicaragua, 2019)","vitolas":[],"story":"Wrapper, binder and filler from Nicaragua, says the house, which says the line is crafted at A.J. Fernandez; Habano wrapper from the 2019 crop, says Cigar Coop; in three vitolas, Robusto (5 x 50), Toro (6 x 54) and Magnum (6 x 60), in boxes of twenty; medium-to-full strength, says Cigars Direct."}]'
 WHERE `name` = 'Onyx' AND SHA1(TRIM(`gamme`)) = 'df4aa5f6c10257cb43647f8b5a76c7e2ccbe4968';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Onyx' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'df4aa5f6c10257cb43647f8b5a76c7e2ccbe4968';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ortega Cigars' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '2f7dc7957edab54605a09d7d3372d85246f704a6';
-- brands|Oscar Valladares|gamme|en — de loin: from afar
UPDATE `brands` SET `gamme_en` = '[{"name":"Leaf by Oscar","color":"#6B4226","force":"Medium","story":"The cigar wrapped in a whole tobacco leaf, to be removed before lighting. It is what made the house known, and what makes it recognisable from afar.","vitolas":["Robusto","Toro","Sixty"],"wrapper":"Corojo, Connecticut, Maduro or Sumatra depending on the version"},{"name":"Oscar Valladares 2012","color":"#8B5A2B","force":"Medium-Full","story":"The founding year for a name. The house''s classic range, without the leaf sleeve — the one by which the tobacco is judged rather than the idea.","vitolas":["Robusto","Toro"],"wrapper":"Honduran blend"},{"name":"Super Fly","color":"#3A2A20","force":"Full","story":"The fuller side, in short runs. The house works a great deal with retailers, and this register suits that.","vitolas":["Robusto","Toro"],"wrapper":"Honduran blend"},{"name":"Island Jim","color":"#4A3728","force":"Medium","wrapper":"San Andrés from Jalapa","vitolas":[],"story":"Line named after Jim Robinson, a Pittsburgh retailer, presented at IPCPR 2014 in a No. 2 size with a frayed foot; in May 2025, its cigars are part of the company''s portfolio. In October 2026, an online retailer describes a San Andrés de Jalapa wrapper with a Connecticut band and an Oscuro tip over Nicaraguan longfillers, of medium strength; the 2025 Barber Pole, in 6 x 52, interlaces Connecticut and Corojo wrappers."}]'
 WHERE `name` = 'Oscar Valladares' AND SHA1(TRIM(`gamme`)) = '0785f7ce1e99d3de3e3cf752ff9456bb1e75f4ab';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oscar Valladares' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '0785f7ce1e99d3de3e3cf752ff9456bb1e75f4ab';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ozgener Family Cigars' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '5e3562191b237f197c9f83920f9a5dce830e6f47';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Padilla' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '163718322cdf4df4c1d2c8c2736e1aa3240ff861';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Padrón' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'b82bfd2ee3c22d313f75549540d0d8bfb253a575';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Partagás' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'ce290a06568c58f7c033e585a9ae75d936587d5a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Partagás USA' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '8851b6375c246e11eacd76855c1e7806a18ac70d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Patina Cigars' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'a72fa81972ba690ff74e47a30668d60cc8a65aa4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Patoro' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'd68f8d5a98daf9343651ee28938f5a05ab5b7550';
-- brands|Paul Garmirian|gamme|en — déclinaison mal rendue (turn)
UPDATE `brands` SET `gamme_en` = '[{"name":"PG Gourmet Series","color":"#8B5A2B","force":"Medium","wrapper":"Dominican blend, at O.K. Cigars","vitolas":["Corona","Robusto","Churchill","Bombones"],"story":"The 1990 range, born at the same time as the book. It was after the Havana of the late 1950s, and its restraint comes from that."},{"name":"PG Gourmet Series III","color":"#6B4226","force":"Medium-Full","wrapper":"Dominican blend, at O.K. Cigars","vitolas":["Short Robusto","Toro"],"story":"The third variation of the series, denser than the original. The house marked its thirtieth and thirty-fifth anniversaries with editions of this range."}]'
 WHERE `name` = 'Paul Garmirian' AND SHA1(TRIM(`gamme`)) = 'eab3e8acc87453db05553b3e1c5d4e00f2084921';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Paul Garmirian' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'eab3e8acc87453db05553b3e1c5d4e00f2084921';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Paul Stulac Cigars' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'f4c93d81ceaf34297f9a8a841b2e40d0b91abacd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'PDR Cigars' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '26b9179738f30e338770c30b94b0846b9bac7ae0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Perdomo' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '480cb5eb144b3ff115a457abdc7448f3afa3fd4b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Perdomo Legacy Connecticut' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '618670b7a469a0c5cf6b07e05657c577aa8e7a4d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Perla de Calvano' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '508aef1671ef4020332465f2bde167070f830c1f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Plasencia' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'dced305a41240d1e3740d722c47f11787c62e015';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Pogar' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '7806ba128f1dbcb36024fd676095c73e0c8cac16';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Por Larrañaga' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '751aadd259f84dc8f3006baa7fde52db73bf6a25';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Por Larrañaga Dominicain' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Powstanie' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'a95ad8fab036f661bffb9f45dcc822a7b58e190a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Principle Cigars' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '851c07755f11ad1b6a2d64552fd428553344f558';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Protocol' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '7ccb03fdc266ba263631115068a80ac59394117b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Psyko Seven' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'f0f1cc9019af6cbc42e055263bb3ea44d6222438';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Punch' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '2d22b1708c99a8876ec8e7fbf3ce3ada07ad8a1e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Punch Honduras' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'f1088408c2bb779c46cddc1b27af232d2c9df6bb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Puros Artesanos Julio' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'ccd3595f359065c8934f29b338b72248b4f45422';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Quai d''Orsay' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '9de292369edb5e053c68039ac7dd806b70163887';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Quesada' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '73f002cf9f90539f40c356727fd9875b63e25a09';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Quintero' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '68e813536ad06905b4a5d9041d4b91b8b39cbf00';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rafael González' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '673a84dc178b3f34c2df9c5df51867d7fbce395b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ramón Allones' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'a2dd2e63956d8cffa2519a7d5a465d02c0533edc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Red Anchor' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'd470655d1479a29dc96b5bb95bd44ed1958b64d2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Regius' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '2030f1fafc3ae17bc47b89828b073bfc7efa5ac1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Reinado' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '2b3d915446045bfb7481e652674d57ab80faff2f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Reyes Family Cigars' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '44d8f67c7b88e7336c17ed1d7d0b33e6dcc24fce';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rizona Baru' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '6c82fee336a88601aaf60d67a1691921ed13bfe0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rocky Patel' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '80e1b0795eac46ebf9a8d5c8573bb0a4c561ef17';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rodrigo de Jerez' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'f1be98c7717ae0e0eb2d18236f302cebd9b70852';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rojas Cigars' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'e1c8563d44af939d61216160c5154d4658996b52';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'RoMa Craft Tobac' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'e42be00358a5e00fbff759b9a3cacfbb5c0ec583';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Romeo y Julieta' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '3cf55eaedbae012b4218895dce7f56d4c5f41565';
-- brands|Romeo y Julieta Dominicain|gamme|en — douceur = mildness (glossaire)
UPDATE `brands` SET `gamme_en` = '[{"name":"Romeo y Julieta Reserva Real","color":"#C68642","force":"Medium","wrapper":"Ecuadorian Connecticut Shade","vitolas":["Robusto"],"story":"The medium register of the Dominican house: cedar, hazelnut, a mildness kept in check. The proposition closest to what the name suggests."},{"name":"Romeo 505 Nicaragua","color":"#7B3F00","force":"Full","wrapper":"Nicaraguan Habano","vitolas":["Toro"],"story":"The sharpest departure from the Cuban model: Nicaraguan filler, pepper and earth. A cigar with nothing to connect it to the Havana of the same name but the band."}]'
 WHERE `name` = 'Romeo y Julieta Dominicain' AND SHA1(TRIM(`gamme`)) = '716a94f117e1f93b6a42466e1eaf853b3a36a490';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Romeo y Julieta Dominicain' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '716a94f117e1f93b6a42466e1eaf853b3a36a490';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Romeo y Julieta USA' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '27f07418b3fb5f0a86107e7a4df5787670ee57ec';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Room101' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '69a4a1b5c7d546eb33d8575fb17023572e9b3cbe';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Royal Jamaica' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '0ac1ab9d3169347794d75f8e798217f2776504e9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Saint Luis Rey' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'aebd0d138ea93eb4c24a0891981a0eaf77645e37';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Saint Luis Rey Honduras' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'ea5ba341ba512da7b994b7e68be90e1ce24fbef1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Samana' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '94355366a5a73bd987b0c6473b1cf27f7366b261';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'San Cristóbal de La Habana' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'e133722ef455296edd3b216888c7ac4d1e31ad3d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Sancho Panza' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'ddf92b7662036356fefccce558f72730fa6896c8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Santa Bras' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '4a5e2ee9dd808e7996efb94c9c1f59d8fe199f68';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Santa Clara 1830' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '601f716fa9decc3efef0d8061f24f1ab988c3d2d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Santa Damiana' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '48a841eefbc489cb7218b1340a193330638bf8ca';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Schumacher' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '4c666691499457d47b392f913b3df9922156c0c5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Secret Blend of Cuba' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '25ce8f120b2c90e9f499566aed1e63822046f43e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Selected Tobacco' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Serino Cigar Co.' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'f8a1710d6365e0177787665b81c42f739b247805';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Siglo de Oro' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '54bb03e3b7cd60bb82c9231709edb30e99a29de6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Simon Beltre' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '62efc1b6b1a171bf056985ad5069cd3400f55a4d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Sindicato Cigar Group' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '81f7d9c47a8c5b62396ffbf670a8335b9d344363';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Skull 77' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '98e8b43843698c94def6cb05d7a1f26087838b45';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Southern Draw' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '6c43e2a4dce5a79fcf3258371e30c9a2014a8826';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Spartanos' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'eaf0831cb2fd4c6e7451d0cad9e443fb6d26d450';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Stauffenberg' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'ad03669dca497674010cdcb931d3f96a983c287d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Stolen Throne' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '20a2f5294986e5ad31ae900a70404a57c3fe495c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Suerdieck' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '79220bf963e010c8f92b36eabc1458fb44b1fd65';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Swag' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '7844cdc8cd5578df23e52863c5ade76e5397abf6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'SYN' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'b574cf78c4a921adefeb4fa339dc169655cf10ca';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'T. Sonthi' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '9ee2eeed2743f768fc2d8b65a1b56099b2f12d9c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacalera' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '29f6a44887fc15b9cea58ecef80bd44e828b4882';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacalera del Oriente' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '513d31c778383c43f97d191317585316078f9996';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacalera Palma' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '6ba4fe71141c6e5c79141299885a21cf97c916b4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacalera R. Paxtián' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'c27c024f816419fbc975a7ed5995d0a829eafb4c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacalera William Ventura' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '5c5b5299be2cf3d6528fb9d603b482e2dd371d96';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacosta' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'e2255fa1ee5b9975a3d9cccac2bdafa2a10f2d1a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabaqueria de Filipinas' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '84155020e95322919df3b3c003888dc448cd3a3a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tambor Essence' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'dc859a19568aee123191acf0c1dafc67f1d5cd64';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Taru Martani' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '10acbdb2046214f85bed08f0e8cb1d6304ed423a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tatuaje' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'b4228c3d7ca22842ae1c04c75a1a0bb874667ba2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Te Amo' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'ecf4de623ea0f9f3e9ab6be2a5fbcc6605e3e377';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Teatro del Mundo' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'c3ee094fcd076a76b3e3ace1c377c85d9cf46dcd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Temple Hall' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'f25adcbbd50adc490b602738c6f3a198d419eddf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'The Griffin''s' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '1f57a62d0d8d9e2df7a4d2183447d6ce153550e0';
-- brands|Toscano|gamme|en — phrase Toscanello mal construite
UPDATE `brands` SET `gamme_en` = '[{"name":"Toscano Classico","color":"#5B3A29","story":"The reference format, smoked as it has been since the 19th century. Wood smoke, leather, black pepper, with that frank acridity that throws you on the first draw and that you come back for afterwards. Cut in two: each half lasts half an hour.","force":"Full","wrapper":"Kentucky","vitolas":["Toscano"]},{"name":"Toscanello","color":"#8B5A2B","story":"Half a Toscano, sold as such. Twenty minutes, the format Italy smokes at the counter with a coffee. Offered in flavoured versions — coffee, anise — that took the house to smokers whom the Classico had put off.","force":"Medium","wrapper":"Kentucky","vitolas":["Toscanello"]},{"name":"Toscano Originale","color":"#4A2C1A","story":"Hand-rolled, aged longer than the Classico. The smoke rounds out without losing any of its strength: leather takes over from pepper, and a dried-fruit sweetness appears towards the end.","force":"Full","wrapper":"Kentucky","vitolas":["Toscano"]}]'
 WHERE `name` = 'Toscano' AND SHA1(TRIM(`gamme`)) = 'e4471bb3132c03364e061333f722a5cb6c37fe25';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Toscano' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'e4471bb3132c03364e061333f722a5cb6c37fe25';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Total Flame' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '110e0ebfd0f9f287195f1b002e8e69ab7c98ce64';
-- brands|Trinidad|gamme|en — « et » resté en français
UPDATE `brands` SET `gamme_en` = '[{"name":"Fundadores","color":"#8B6914","force":"Medium","story":"The brand''s only vitola at its start, says habanos.com, which gives it as ring gauge 40 and 192 mm long (press release of 7 October 2003); it then remains in the range, in varnished boxes of 12 and 24 and in packs of 5. The trade press notes it as 7 1/2 inches x 40 (2019). Habanos classes the brand as medium in strength.","vitolas":["Fundadores"],"wrapper":"Vuelta Abajo"},{"name":"Reyes","color":"#A0522D","force":"Medium","story":"A vitola of ring gauge 40 x 110 mm, presented in London on 10 November 2003 with the Coloniales and the Robustos Extra, in boxes of 12 and 24 and in packs of 5, says habanos.com.","vitolas":["Reyes"],"wrapper":"Vuelta Abajo"},{"name":"Coloniales","color":"#8B4513","force":"Medium","story":"A vitola of ring gauge 44 x 132 mm, presented in 2003 at the same time as the Reyes and the Robustos Extra, in boxes of 12 and 24 and in packs of 5, says habanos.com.","vitolas":["Coloniales"],"wrapper":"Vuelta Abajo"},{"name":"Robustos Extra","color":"#722F37","force":"Medium","story":"A vitola of ring gauge 50 x 155 mm, presented in 2003, in boxes of 12 and 24 and in packs of 3, says habanos.com, whose brand page also dates the Robustos T to 2009 (without giving their dimensions; Wikipedia lists them at 4 7/8 inches x 50). The Robustos Extra, discontinued earlier according to the trade press, returned to regular production in February 2024 for the brand''s 55th anniversary (6 1/8 inches x cepo 50, boxes of 12 and of 3, new presentation). The current status of the Robustos T is not established by any page read.","vitolas":["Robustos Extra","Robustos T"],"wrapper":"Vuelta Abajo"},{"name":"Vigía, Topes, Esmeralda and Media Luna","color":"#6B8E23","force":"Medium","story":"Vigía: vitola de galera Torres, ring gauge 54 (21.43 mm) x 110 mm, presented in April 2014. Topes: ring gauge 56 (22.23 mm) x 125 mm, Edición Limitada 2016 then regular range in 2019. Esmeralda (ring gauge 53 x 145 mm) and Media Luna (ring gauge 50 x 115 mm): 2019. All according to habanos.com, which gives the brand as medium in strength.","vitolas":[],"wrapper":"Vuelta Abajo"}]'
 WHERE `name` = 'Trinidad' AND SHA1(TRIM(`gamme`)) = '61a7a895ef896836d712aa4678a24e4e4fbb1294';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Trinidad' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '61a7a895ef896836d712aa4678a24e4e4fbb1294';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Trinidad USA' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '839d679ea926f2779824ceb94e246c33c42c0ff6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Umnum' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '9398ad2efe9734be4378baf3aae242ec54d1b8e8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Valentino Siesto' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '513d375f6955e36ddf809514d3a2c24fb2fb33ab';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vallejuelo' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '987725b3a26af0e3583a97af339dd4337fb300a7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Van der Donk' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'b2221fb5b3142d1e343b12b9a79cbac63ff51a7d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vargas' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '3dfb9ab8d6e2507a7795a739694d6a5b9195e1f8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'VegaFina' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'a9b91b3497cea4350267ecb9f887b8e4fa5b3299';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vegas de Santiago' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '0fd23656d6d40b4e45bfed721763754bde7ef310';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vegas Robaina' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'dc2427feb19ae0436fed1d649546bd584fd8a209';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vegueros' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'd3808241d767dfd75cdd2acfba25ea2fcedab4f2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Viaje' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '0ededa02736204639c77ef53f1f764235f6ed483';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Villa Vieja' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '40fa5948182e419e932e163095f5bd0f0af9148e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Villiger' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'ba88f47fbf28493e52d4060456beff08e371efd5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Villiger Söhne' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Wangguan' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '28b73700d56314a7537f1a9242967b6a64ee806c';
-- brands|Warfighter Tobacco|gamme|en — medium-bold pour moyenne-corsée
UPDATE `brands` SET `gamme_en` = '[{"name":"Field","color":"#8B5A2B","force":null,"wrapper":"Undisclosed","vitolas":[],"story":"Three blends, with a Connecticut Shade wrapper from Honduras (5.56 MM), Sumatra from Indonesia (7.62 MM) and Habano maduro from Nicaragua (.50 Cal), over a Habano binder from Nicaragua, which the house says are lighter and milder than those of the Garrison, in six vitolas, from the Minutemen (4 x 44) to the Lancero (7 x 38); the .50 Cal is called full on its page."},{"name":"Garrison","color":"#6B4226","force":"Medium-Full","wrapper":"Undisclosed","vitolas":[],"story":"Three blends, with a Corojo wrapper from Nicaragua, Habano rosado from Nicaragua and Habano oscuro maduro from Honduras, of medium body, medium to medium-full and full, says the house, which says they are more full-bodied than those of the Field; six vitolas, from the Minutemen (4 x 44) to the Lancero (7 x 38)."},{"name":"Night Shift","color":"#4A2C1A","force":"Medium","wrapper":"Habano oscuro (Ecuador)","vitolas":[],"story":"Habano oscuro wrapper from Ecuador, binder from Indonesia, longfiller from Nicaragua, candela band, in Toro 6 x 50 only, of medium body, says the house, which also writes it as medium to medium-plus in body; released at the PCA 2023."},{"name":"Victory","color":"#4A3728","force":null,"wrapper":"Mata Fina (Brazil)","vitolas":[],"story":"Mata Fina wrapper from Brazil, Habano binder from Jalapa, Habano filler from Jalapa and Estelí with ligero from Estelí, in 6 x 54 with a shaggy foot, fifth edition in a small series, boxes of ten signed and numbered, says the house; Cigar Coop shows the fourth edition at the PCA 2022."},{"name":"10th Anniversary","color":"#A0522D","force":"Medium","wrapper":"Sumatra (Ecuador)","vitolas":[],"story":"Sumatra wrapper from Ecuador, binder from Honduras and filler from Nicaragua according to Tobacco Reporter, in Toro 6 x 52 of medium body, says the house; a regular release in the catalogue and not a limited edition, introduced at the PCA 2026."},{"name":"San Andres","color":"#4A3728","force":"Medium","wrapper":"San Andrés (Mexico)","vitolas":[],"story":"San Andrés wrapper from Mexico, binder and filler from Nicaragua according to Tobacco Reporter, in Toro 6 x 52, of medium to medium-full strength, says the house; Tobacco Reporter says it was born in 2022 under the name Heroes Sports and introduced at the PCA 2026."}]'
 WHERE `name` = 'Warfighter Tobacco' AND SHA1(TRIM(`gamme`)) = '1bab23a0ceea7ebd84d1271013dc4961ab7ba0c8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Warfighter Tobacco' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '1bab23a0ceea7ebd84d1271013dc4961ab7ba0c8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Warped' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '7f4ddb7032b5fd2de9b444bb1cd5fe996a455b78';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'West Tampa' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '2bfa65c376c98d555b63303e5f56ebe469f65d7a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Wolf & Ruhland' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '08f9ff9f36e03f39a12bd2ec3c8aedb646ff0e00';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Wolfertz' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '3f66687a9dce19034b688bce607ba1b3ba41075b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Xhaxhi Bobi' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '5982e297fdfbfcab7734973876dabe2d05cb0601';
-- brands|Zigarren Manufaktur Dresden|gamme|en — terme longfiller incohérent
UPDATE `brands` SET `gamme_en` = '[{"name":"Longfiller Dresden","color":"#4A4A4A","force":"Medium","wrapper":"Undisclosed","vitolas":[],"story":"The house''s longfiller, rolled before visitors'' eyes."}]'
 WHERE `name` = 'Zigarren Manufaktur Dresden' AND SHA1(TRIM(`gamme`)) = '1a2fe2123131652661fd6e04254f71298a74a8ae';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Zigarren Manufaktur Dresden' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = '1a2fe2123131652661fd6e04254f71298a74a8ae';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Zino Platinum' AND `champ` = 'gamme' AND `lang` = 'en' AND `source_hash` = 'bb6e126dd7d7fb388536220706a6158ae83a9a4e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Alec Bradley' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
-- brands|Arturo Fuente|celebrities|en — nom propre accent altéré
UPDATE `brands` SET `celebrities_en` = '[{"name":"Carlos Fuente Sr.","anecdote":"Born in 1935, he becomes sole owner of the house in 1956 and, with his son, opens Fuente Ltd in Santiago, in the Dominican Republic, on 4 September 1980, after the fires at the factories in Nicaragua (1978) and Honduras (1979), says arturofuente.com. He died in August 2016, aged 81; the Don Carlos range bears his name."},{"name":"Carlos Fuente Jr.","anecdote":"Nicknamed Carlito, he creates the OpusX in 1992, a Dominican puro whose wrapper grows at Château de la Fuente, near Bonao, a farm where the family planted its first seeds in the early 1990s. His sister Cynthia Fuente-Suarez is vice-president of the house."}]'
 WHERE `name` = 'Arturo Fuente' AND SHA1(TRIM(`celebrities`)) = '0cfaa9068d023975b9b810f8671705536337bb11';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Arturo Fuente' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '0cfaa9068d023975b9b810f8671705536337bb11';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ashton' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '42f9869244041dedc9f4263acd460dfbfd6d8fc4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Avo' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '5d763ecbb141e7a576fc508d9c9a825719287629';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bolivar' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Camacho' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '4d1d8e0fda69d1c14229e2706b1d030580825ef6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cohiba' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '03588b1e7af9f6f3bc2de78bd6dde1152bac230d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cohiba USA' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '7b962f1d48e08c07b24b199195997515b5ca5daf';
-- brands|Cuaba|celebrities|en — nom resté en français
UPDATE `brands` SET `celebrities_en` = '[{"name":"The Taínos","anecdote":"Cuaba is, says the trade press, the Taíno name of a bush that the island''s inhabitants used to light their cigars; habanos.com sees in it an Indian word from the time of Christopher Columbus, a highly combustible bush used in religious ceremonies. The 1996 brand took the word back for double figurados."},{"name":"Carlos Izquierdo González","anecdote":"Wikipedia names him as the creator of the brand, launched on 19 November 1996 in London; he is said to have modelled the blend on that of Montecristo, a claim the same page reports without confirming it."}]'
 WHERE `name` = 'Cuaba' AND SHA1(TRIM(`celebrities`)) = 'd0288273f2dfc277b45088a03058e75645eb62f1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuaba' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = 'd0288273f2dfc277b45088a03058e75645eb62f1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dannemann' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '5932bad9139da2cb0fc69e6491ceb741067eae89';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Davidoff' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '7d8fa4067b1ee35805c3e0ce8e4a0fcc19673477';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Diplomáticos' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Drew Estate' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = 'bf54dbd74d91c89d0e1555e248ec5de10f6aa12b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Rey del Mundo' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '95ae8d240b382c8b2981fb5c178dee51bb46537d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Excalibur' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '6bb28ba9ff1c1e702754db29073db26b51f89670';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fonseca' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '5340c1e3a54138fb52ea9af1313f4d2985d5617e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'General Cigar' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'H. Upmann' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '65b95cfdd7d1c1d01ced1a1d00d136375ab1aa99';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Hoyo de Monterrey' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = 'bcd23c2ce00902f7f6a433b09978fe031bf89e86';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Joya de Nicaragua' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = 'c2d230a082b813679d7595681cf14a985ea7068a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Flor Dominicana' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Gloria Cubana' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '6a8368b58323510764a6bc82a2a4b7e06cdfe2db';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Liga Privada' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '8e511add512ef54543b597148e7e24265cfae9bf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Macanudo' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '0be807a85e820020e07eab7bc42b7bef49c75b05';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Montecristo' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = 'ef78d8b23419876591a8bfab73293d1ce4706dd3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'My Father' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '1c811375200ae103abba812b0d8b96460979282e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oliva' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '2e24aa414d51b423774d80f9a19147811116cc87';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Padrón' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = 'f4be1e42e8cfe4078a6a272813641bf4f925c592';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Partagás' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Partagás USA' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Perdomo' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = 'afaaa1487e24cda378a813ea45b073737a731df5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Plasencia' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '8883ec2cfff1cd7103be23f7c8e87791e85abc44';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Por Larrañaga' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '76cac516952f69294b3282c41cfcbd42fbb250a5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Punch' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = 'd331d314beef4c02ab087b114c79d8fc7ef5f2a2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Quai d''Orsay' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '3817b52830ea8e9a7748357ea6e32fe0f58e206e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Quintero' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rafael González' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '9f22b9115cb05112212461452aef7d7082e7f9a9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ramón Allones' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = 'ef3e67d58e3c935c207ecac706f87c164f6c9f68';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rocky Patel' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Romeo y Julieta' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = 'fd2fbab8ae38255dafa0b9a4337d4806e384a63b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Romeo y Julieta USA' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
-- brands|San Cristóbal de La Habana|celebrities|en — nom resté en français
UPDATE `brands` SET `celebrities_en` = '[{"name":"Havana itself","anecdote":"The 1999 brand takes up the city''s original name, going back to 1519 according to the house''s page, and its first four formats bear the names of Havana fortresses: El Morro, La Fuerza, La Punta, El Príncipe."}]'
 WHERE `name` = 'San Cristóbal de La Habana' AND SHA1(TRIM(`celebrities`)) = '4e111824b8b96193437afc128450cd235ff16711';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'San Cristóbal de La Habana' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '4e111824b8b96193437afc128450cd235ff16711';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Sancho Panza' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Santa Damiana' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacalera' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Te Amo' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '50e50d1ba379bcf888a9cd31bbef18c7b107badc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Trinidad' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = 'f2f0cd6900f0bf53b9f6316f4e75188e8cdb5df2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vegas Robaina' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = 'a496c07f9b279e1c4e307aab5f3660c908c7d3b3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Villiger' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '74ca6e37da814ec9cc9fbb7e283164c507ed95e4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Zino Platinum' AND `champ` = 'celebrities' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'A.J. Fernandez' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'd82e7ef776cd7010280c1a86703e68a60807fc82';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Aganorsa Leaf' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'd7f9bb831b2f920044bc34ee1b7ac4a5c708d515';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Aladino' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'cea6b19f4bd8a9bc730a6e999a627724aba84512';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Alec Bradley' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '52107d27435a7aaa176deee91adf6259893c05be';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Alhambra' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '709c1142bedea6e9cc84dc9038251d2c3586cf51';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Arturo Fuente' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'c457ac10e435e338ce87ad6264088927888d9ae0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Arturo Fuente Hemingway' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Arturo Fuente Maduro' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ashton' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'e420a1bdb1031b68a5545b2c513e6fe316360216';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ashton Cabinet' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '829ef160562f7f67d2052c53185c1370eb29d943';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Atabey' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '9e5627f13de93a55ceb8c2dd3a2b8d52539d62df';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Avo' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'db02ba814963d87e6f9643ef742d0caa84e67b8b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Baccarat' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '3f2a16ebf48b7e8856be55ba07ff74c772ccb4cd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bandolero' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '176ceefda33e8b8883e7ee414f63d72b73b3d71a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bering' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'fe813355a68aa64409237efefd9afc4b574845b6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bolivar' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '5f89666cb85a9badcc84c3d02fcee9c47809d9c2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Byron' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'a89a46482814c8a88881300d3f0a1e447b40a6d1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Camacho' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '3ea08238ca0a9c876946f51d761a1c3bc48ff15e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '7573edd93163544f5e4c20b645de0c9f770a5bc3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO America' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO Black' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO Cameroon' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Capitol' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa Turrent' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'db1283f2678906e8b4a73e9b08afc99344090bc6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casdagli' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'd28bc5b356d2d2ba03c5ee58bc549a728dbd4ca9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cohiba' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '074f1ece254c04bddebed59bcc6cace8b19d4f95';
-- brands|Cohiba USA|pairings|en — authentic : contresens par excellence
UPDATE `brands` SET `pairings_en` = '[{"type":"Spirits","name":"Maker''s Mark Bourbon","notes":"The American pairing par excellence for the Red Dot. The vanilla and caramel of Kentucky bourbon amplify the sweetness of the Cameroon wrapper without overwhelming a medium-strength profile."},{"type":"Beer","name":"Pacific Northwest IPA","notes":"For the Cohiba Blue, the floral bitterness of a late-hopped IPA offers an interesting contrast with the creamy side of the Honduran blend."}]'
 WHERE `name` = 'Cohiba USA' AND SHA1(TRIM(`pairings`)) = 'fec3226cae5468f95181397ad39a0bb111a47858';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cohiba USA' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'fec3226cae5468f95181397ad39a0bb111a47858';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Crowned Heads' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '446e224d80be8c2ed5d45ea5f025fc138cf3c742';
-- brands|Cuaba|pairings|en — serré mal rendu
UPDATE `brands` SET `pairings_en` = '[{"type":"Spirits","name":"12-year-old amber rum","notes":"A pairing suggestion, with no page behind it, for a brand that Habanos describes as medium to full in strength."},{"type":"Coffee","name":"Strong espresso","notes":"A pairing suggestion, with no page behind it, for one of the brand''s double figurados."}]'
 WHERE `name` = 'Cuaba' AND SHA1(TRIM(`pairings`)) = 'b708999b636e1a8562ff209d0218b2e95e180298';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuaba' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'b708999b636e1a8562ff209d0218b2e95e180298';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dannemann' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'dfe477fcd264c164245963eb69628e60da63fad8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Davidoff' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '16ba524a1026573b06d2d8a75d23e8d0f9ffe3de';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Diplomáticos' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '52014876e5b9397dff6a103f73c6e2f1074dfbf7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Diego' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '4ff0ea66bde36e60f90d27e09b68afd6ad4735ef';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dona Flor' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '7c20b602061d913499a6ef6a1bce5e96ec4a892c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Drew Estate' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '7ed7a97b369de2a590acc2c373aab65ee5363f17';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'E.P. Carrillo' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '68991e77a25288c404bbee25036bcf952c162651';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Rey del Mundo' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '872a7af861292ce3d595814a5ab62b1f7b790799';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Titan de Bronze' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '42b92cd5f8fd393c7080b8dee2c07fa73fd79c65';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Espinosa' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '25bbfdb1411908d1fed9206460d295f045d330c3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Excalibur' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Flor de Selva' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'a5718fce46cc771c2bff39a31896a07ab5ab1f8c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fonseca' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'a92a3f9e833cfa0adeeed5339ffe7a6fd1ea1c13';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Foundation Cigar Company' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '87a816a9c5ecb3c139fb2aef7c1fa0e59f3987f0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'General Cigar' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'H. Upmann' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'd5630d5c17197c62a49d116b7069b9f5c1b1037f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Hoyo de Monterrey' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '13ee4c899778f66f1cb59ebc7e91eaf3f9949faa';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Hoyo de Monterrey Honduras' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'b22af74c5fce305f17ccd415eb60349b4d78657e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Illusione' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '6a04bd541a1152784815ae4db8aea71f7d0f5b3e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'J.C. Newman' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'e70cc0583ede440eb764e76ec0557aca0866e143';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'José L. Piedra' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '242b0d5520d1be0b50b0f31af4d4031b78f35664';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Joya de Nicaragua' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '622668e5055d6c669b1412fa7a394dc0b7df1b63';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Juan Clemente' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '999dfdde018ff3db30ecc2b1aa93f21189300b5d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Juan López' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '6788401e246653abfc05a5781256bb026e5d14f0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Aurora' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '701dd2838911362c63eeb197ffaf2743dedb63f3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Flor de Cano' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'c8e72b79bcd140b27858e4545d5fc5d4efe0cfab';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Flor de Copán' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '6c7bf9f62bb3e471c38196d4109458a55dc6df65';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Flor Dominicana' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Gloria Cubana' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'a6bb522880498401144ddfab60cef308c01caa1b';
-- brands|Liga Privada|pairings|en — contenu différent du français
UPDATE `brands` SET `pairings_en` = '[{"type": "Beer", "name": "American Imperial Stout", "notes": "The natural pairing — the coffee and dark chocolate notes of an Imperial Stout match the profile of the No.9 perfectly. An American bar pairing."}, {"type": "Whisky", "name": "Pappy Van Winkle 15 Years", "notes": "The rarest American bourbon with the rarest American cigar. A collectors'' pairing — two products with a waiting list, brought together."}, {"type": "Coffee", "name": "24-hour cold brew", "notes": "Cold brew, less acidic than espresso, reveals fruity notes in the No.9 that are usually masked by the aromas of roasted coffee."}]'
 WHERE `name` = 'Liga Privada' AND SHA1(TRIM(`pairings`)) = '935a09c5daf44e6fa200bdbc2e17d55f12b999c4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Liga Privada' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '935a09c5daf44e6fa200bdbc2e17d55f12b999c4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Macanudo' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'e2ccaf8e748020e4996fac9c44becca49e7d5cd6';
-- brands|Matacan|pairings|en — calque assumée owned
UPDATE `brands` SET `pairings_en` = '[{"type":"Spirits","name":"Young mezcal","notes":"Two products of the same region, and the same acknowledged roughness."},{"type":"Coffee","name":"Veracruz coffee","notes":"Grown on the neighbouring slopes: the shortest pairing possible."}]'
 WHERE `name` = 'Matacan' AND SHA1(TRIM(`pairings`)) = '0633ab577e7783e800ed40c91860594e20308479';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Matacan' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '0633ab577e7783e800ed40c91860594e20308479';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Matilde' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '4867501c32367daec13489345c5248158f305c17';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Meerapfel' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '527cb0396127dfa5b0017dc81f6118eb802e76cd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Mombacho' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '33fc99eb90ae3e19908da0018e69133094725210';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Montecristo' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '78cd9b4a4ae21454eb256e958af3947a1ca10e48';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Montecristo Dominicain' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'bbc46832a377040ad4e11371a6d9176a9f5bc978';
-- brands|Montecruz|pairings|en — péninsule, café serré
UPDATE `brands` SET `pairings_en` = '[{"type":"Spirits","name":"Spanish brandy","notes":"The pairing of exile: a spirit from the peninsula with a cigar made by Cubans in the Canaries."},{"type":"Coffee","name":"Strong espresso","notes":"The hazelnut of the Cameroon wrapper takes a frank roast."}]'
 WHERE `name` = 'Montecruz' AND SHA1(TRIM(`pairings`)) = '84d39aeccb8bc50822ba0cc8bb63607b6a4c4f76';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Montecruz' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '84d39aeccb8bc50822ba0cc8bb63607b6a4c4f76';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'My Father' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '0d5edd5be188c0478c526b4f8b0f32010aea783d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Nat Sherman' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '3a5717cfa4cb26ece6d8a6b1e3871ba6851b2f3f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oliva' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '18242ba5e6489a5bddeb7d6dd8e154092cebed95';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oliva Connecticut Reserve' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'faa2c67041af561606e2a63cfaf33eeb3b53cc82';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oliva Serie G' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Padrón' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '78bc8b86a13eef9d711a16dae55c1a120c7d5fde';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Partagás' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'ca7f2f61681f737e8e1bffbce24541135bbf7c34';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Partagás USA' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'e7c6f3a7c930172fb9adcd2290bef27276bf0150';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'PDR Cigars' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'b2f2a5f511482ccda20ccde5cf83aa19054b7853';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Perdomo' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'e045115ae01c04e2f2b81a29206fc5b3e1f0e119';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Perdomo Legacy Connecticut' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Plasencia' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '7e487853b0fbae9e98b80a62d41f2fa492d3d55a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Por Larrañaga' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'cb23d1d194fa2965541bd37d147f77087e8b366c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Punch' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '069ae1621f8dfd2f7f7603b17590d5e1865466ff';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Punch Honduras' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'f3577aa51ddaa5cd8f51b8f708b37cb9b15e9f52';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Quai d''Orsay' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '130f90f456287a7b2a3176bac667c45fa69dca61';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Quesada' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '7c4132c9a6522c228e003f420da88af8853cb25f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Quintero' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'a8cd15e0c28597dc08fe41ad972a6e648478a49b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rafael González' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'bac6ed00d0f8aebb9393d6819f506407cb2700ae';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ramón Allones' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'b826f016c90f1ca8f3432d9abf60f1a2794dd8b2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rocky Patel' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'b1f7b4da318ec028bee3c7d36758dcd928380931';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Romeo y Julieta' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'ae60a97cc30201e8cf00bc806e85b8ff69eb9c31';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Romeo y Julieta Dominicain' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '253da7fb51d8a3784672a5a5f2a25f3c3b8f3456';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Romeo y Julieta USA' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Royal Jamaica' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '27fe0f7602991efff6018b8d2543f6abde1db19c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Saint Luis Rey' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '1ded2d9b4018042b2cabe901d4f0cc5c1b99f789';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'San Cristóbal de La Habana' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '5daa50f6c7ace1a6c03f828e02dec464bbae9aba';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Sancho Panza' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '55c30ff7119d4a5d6463f7e7dc142fd1ab7c490b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Santa Clara 1830' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '709f843efc1ddffe4425148d3a0ee103a1107de8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Santa Damiana' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Suerdieck' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '367ec3b9a2e5bc29726af2de62b9bba0c36b56b9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacalera' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Taru Martani' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '8139f3fd1fb0c7b9ae0f4d67af07756cbbf49e3e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tatuaje' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'f53402fd65aacbf06394ab9d7e7d5c3b047eecd6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Te Amo' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'e57e648c2cee668658420ebe030a92bb9d88e922';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Temple Hall' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '0ecf39332f0dea0517e6a55a58be7d4f396ff7ab';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'The Griffin''s' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '3a9ab9332ed7ecc47d5a206ae05dbde7f04abc68';
-- brands|Toscano|pairings|en — types restés en français
UPDATE `brands` SET `pairings_en` = '[{"type":"Spirits","name":"Grappa","notes":"The country''s own pairing, and the truest: grappa has the same frankness as the cigar, with no sugar to round off the edges. A cask-aged grappa rather than a white one, which would cut too sharply."},{"type":"Coffee","name":"Espresso","notes":"What Italy does at the counter: a Toscanello and an espresso. The coffee''s bitterness stands up to the smoke instead of submitting to it."}]'
 WHERE `name` = 'Toscano' AND SHA1(TRIM(`pairings`)) = '657eabf9d6600a14bc0aa6443704461bedb0246e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Toscano' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '657eabf9d6600a14bc0aa6443704461bedb0246e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Trinidad' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'a6f65cd5fd7589d603cfb49112145ea74e353142';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vargas' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '41f14657a092c4f961659b019c4031d54aab7c73';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'VegaFina' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'eb38b0f782235b9755ca3f568bfad2c2fc09e871';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vegas Robaina' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '949f2c0b21752ab05b6e862338de3ed7fe8b2c83';
-- brands|Vegueros|pairings|en — faux ami tight
UPDATE `brands` SET `pairings_en` = '[{"type":"Coffee","name":"Strong black coffee","notes":"Tasting suggestion, no page."},{"type":"Spirits","name":"Young white rum","notes":"Tasting suggestion, no page."}]'
 WHERE `name` = 'Vegueros' AND SHA1(TRIM(`pairings`)) = '32388cbdf7618d317f8ac3bc679871bfe609ded8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vegueros' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '32388cbdf7618d317f8ac3bc679871bfe609ded8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Villiger' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Warped' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '844393b57f515e5d87ec666c512fdda68398dc19';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Zino Platinum' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'a5f6c9bd0c68c8dffecf86ad592762ba0c0aed2f';
-- lounges|1|description|en — ajout first shop
UPDATE `lounges` SET `description_en` = 'Opened on 6 January 2025 by the brothers Kamal and Charan Daswani. One hundred and sixty square metres: a 120 m² walk-in humidor holding over 450 Habanos references, and a 120 m² smoking lounge seating 150. Open 10am to 2am. The group has been present since 1980, opened by Zino Davidoff himself.'
 WHERE `id` = '1' AND SHA1(TRIM(`description`)) = 'd86cb4aaa4fed70545f6e75ad34d4a48da9f8dfd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'd86cb4aaa4fed70545f6e75ad34d4a48da9f8dfd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '58121196359c53fe2f7eef494233ec7a62708725';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '3' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '64b180e10dcadfc02c498559605d7deeb1e79f11';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '4' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'bef61f740e00e1ac6ba3e9b3ce0171abac04410a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '5' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'f03145b07d825f65f449801bd0c527b0ba175897';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '6' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'fa00d4689357b0ab4c474a608a72a6a9c210206a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '7' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '58822b0a8ae5eff3b47638c8f53a8eaa10abf249';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '8' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '7e52baa7a03cb4c674943da8f509aa6efa7bf6b8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '9' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '9253ad34f27b1e462c9798b213763b6f0205561c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '10' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '3cfbad63f24ebd3524f83daa18d86370297a5254';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '11' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'f9bf70c6150be2cdec22eafbce3f14f252af0d80';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '14' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '95b558e728be099d0736a01361cd5880ec408031';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '15' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'ea67eb61793a17e250d497811e5fb123a3a03552';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '16' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '5e7d6e02e6ea85ed8fe45bf57a89d29ad3e212c5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '18' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '824a1428c667e1e62a76bfc70819e8a1acebf68a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '19' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '8cbae51bf23e70769a6fe7210ae0083f4ac15fbf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '20' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'df9d33e860eb2008bd459720121a5f348771361f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '21' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '5b3db8f2e0d0da718e32ee329fdbf748673f4c00';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '22' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '9b117044403f50f1a2f283ec42e4ff846da2824a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '23' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'd2d6b5a822d0c561fc7809fca2a6e180cb22b756';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '24' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '7ca4169babe8b1fd1b86d69345c471971827c583';
-- lounges|25|description|en — ajout de fine
UPDATE `lounges` SET `description_en` = 'Founded in 1716 and trading without interruption ever since. Historic patrons: Danton, Napoleon, Robespierre, Mirabeau, Degas, George Sand. Over 350 references from Cuba, Honduras, Nicaragua and the Dominican Republic. Pipes and spirits.'
 WHERE `id` = '25' AND SHA1(TRIM(`description`)) = '9add4375115d51ed75270ee164f73bd14562bc92';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '25' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '9add4375115d51ed75270ee164f73bd14562bc92';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '26' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '308b9d0cef59be939df491d60f9346a1ed35e188';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '27' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '2bcf1f1a9999647c033682af96f199be9b08470c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '28' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '30e8b372372ba26ecbee7ccfeec8e209f9d473df';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '29' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '1f3b9f14df9d568890d828d7a33e64f329ec4da9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '30' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '9f1b1d894619404cc0442af50c8ab38411e3bdf2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '31' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'cedda1a118dd084c1a7c545019f892244553ef74';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '32' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '47e70e36f8fbb4bee20c2b3c1d8c8401759e090e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '33' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'be17f550a8d670b92ede95eaa36de14c119a9f51';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '34' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '119ebc47799861d1ca4e705dbdedea8c1f3c1476';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '35' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'e7bcec908b69d7f9d98e015d449467b127406a0a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '36' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'c0f7fd015b6db96de42ba3d02ffbdd43ac38629f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '37' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '3699082eedb9f0c0c729a7f12877f4f5fd942921';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '38' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'f4c8d674bb26434f1da2193c2e69ce7ed5d90f3a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '39' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'e0ea678e545996a409c739447158228da012d96e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '40' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '6e377a7eafe883b0d1b65c4e5972b0671a958e36';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '41' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '19f1a92b41fbc9fac072655188f858bcf01061fc';
-- lounges|42|description|en — resté en français
UPDATE `lounges` SET `description_en` = 'Switzerland''s first La Casa del Habano. Owner Samuel Menzi, Habano Man of the Year 2004.'
 WHERE `id` = '42' AND SHA1(TRIM(`description`)) = '613bee7381718d5d49fcd5b60b6cf2d8bb813227';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '42' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '613bee7381718d5d49fcd5b60b6cf2d8bb813227';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '43' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '062f01d080083b9c0fad1c435b7cb0844d83d811';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '44' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '68c1de8610b4e40b85c0d764aeb1380aaafd5186';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '45' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '9ba090faed2c28339846503a0c51cbe20753dd5d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '46' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '1648fb8d29b61809814033da3b92d65d81c1e510';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '47' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '52c6f211d33a538240fbb8e0af0a030ec7ab140a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '48' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'caf45279d165e032ccd2d23a0a206126ce033d7a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '49' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'a5b2ac24da598c438a0063ae3052c6100c09a436';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '50' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'cefa790c539e424e7bad849014c2ed8411e456f4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '51' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '35cd91c9354cfae593f7fc90a784569d6a8adeb8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '52' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '2f4d140e3933defbf2c1c25ff82d660a8fecc73f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '53' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '711023ab2c67358020abf1cd200cc67861f70c95';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '55' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '185deb9a47590814af1985ff8ee8fc1566a427a4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '57' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '1f6f747e956ed448d88b93ad51ab636d4849a46e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '58' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '5b0c9f42d4750871f9332028e754587880d84731';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '59' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '967e75f585007b2bd366ea2f8dcae94efa86e269';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '60' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'e13eaf709be7a88d4aee2c28a5dd4c3596a65c06';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '61' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '2a55b39b9784032d8cd8f52bba38c7c36a116fe6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '62' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '5eb434b841e1866abceca79e6d77f25ae3201923';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '63' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '9226f2671afa491a2cd5241a40e631246fbc445a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '64' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '3105cd969b72c0b311850b56d0e92d7715b156cf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '65' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '8aa074cbce1991241f724388a6989d87dea359eb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '67' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '098455fc15430570a43807f632df64397fd7763d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '68' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '2b5f957c65a94ee8c143368fc3dee7f597f41e4e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '69' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '6ac0f45ac84b23e871e1a9174b78cea6f7c3d555';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '70' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '775e7d920c2efe39b5db14f15ab911d47851248d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '71' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '9c504e9f18af776cb71b4d5eb473523784a6ed24';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '72' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '384ead530243abc1db75204b21235b2febe49f08';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '74' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '451b161939d49868401661f7bc5248a021a2fd06';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '75' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '6fc306df60ffb33e4c75a330ac91ee769a69c9a4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '76' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '0d75c0cdc6ff05fafd3a09e4edd49c976df4fc69';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '77' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '2e5b7ecf3b94f3e6c2a9de504f28754edca18d6d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '78' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '79036edb00e29d99024f9a6ee231f1d61219548f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '80' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '1cd8e2f54296cc8b33a0027aaf86e5890ad75ea2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '81' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'd051c1800687c71de8eb0f956a5363ecef1e47ff';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '82' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '048dd30af34525e56581f44f4ee2c34e3694f78f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '83' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '6f52fb90833517973267d7982c2af2ad8c2514a3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '85' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '80f2080a4c5008051e66b0486f76cf824f185c9e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '86' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '064590130b9aa9ae0041c938c60f929a829840eb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '87' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '2e426c0de077261df5169d33d91c04d02b4ad112';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '88' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '269716fba8af4e7b04e5b877c54038d85c167237';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '89' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '4622923ef612546bb40448d6000054bbd9895ed8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '90' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'c28a371a7a8dcb1177b95107f063d40335d16ffb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '91' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'a40677196afc9b2c0ccb28515a4dcd81c9dadb48';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '92' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '3e580cc9eccc7724c370741455885c14a44e41b3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '93' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '31e76f776220bc7968602bdb19356d8fa9e9e9b1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '94' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '9ed971f3246f7145519bb8996b7b1da3db3076f2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '95' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '1efac6089d67b7bc23e96b0e0d83d19cfc155ee0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '96' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'ef037058a2893f28a63691424df7ea8f44920613';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '97' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '115265ee0d64c9cc7f8b6df6782630564f1b8674';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '98' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '0db21c616b2a918d0fea646f2608d3fa36a3b706';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '99' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'ecda7fcda95f4b35cc7b8feb7e813f622400a605';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '100' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'ce874f264fc0e8e3ac9b4fee1e0382061427c4c8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '101' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'd8c22dbe093f9ae8d3236fdd20475101a68e6f0b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '102' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'd9b9fe9900cc939621cd92cedae2bbd8a27bdfbc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '103' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '6ee0e919b2307d38ad4238abdb691b6638cf7244';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '104' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'cbec53e9aa1b890a11ff94fad0b6fa01c5aaeb00';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '105' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '82023425ba7c5eb99a1f2473a3e1044a37d35991';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '106' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '125727a4e3abd5409c7e5d4c03b6d1494962c18d';
-- lounges|107|description|en — Golfe Persique omis
UPDATE `lounges` SET `description_en` = 'Cigar bar at the Four Seasons Bahrain, overlooking the Persian Gulf.'
 WHERE `id` = '107' AND SHA1(TRIM(`description`)) = '1a531fa267b88f3061239822d1288d5b417cd89b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '107' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '1a531fa267b88f3061239822d1288d5b417cd89b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '108' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '0ca254db318f4394ac145bd06fab163e43df59b7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '109' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'c01511ef50d4c4a55ef5c96b661954604533e8b8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '110' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '741a720eeab0330fb95c3811bc7dcb1d93d1d6ea';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '111' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '8b6b704a220328012243eebb582fc2427e9a52de';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '112' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'd4135a524ed30eeef76b57a11093eeaeeb153f88';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '113' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'e2b202a4e9071de61d012d98aeed1150aa956db0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '114' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'e8c4ae5ee14963ff52b17e390f5fea0978ad29de';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '115' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '6079c1472615633784f8cf7e94d0f278c51880f3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '116' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'a4dc54cf557953f0b0b6b33af09a2bc600a435a0';
-- lounges|117|description|en — superlatif ajouté favourites
UPDATE `lounges` SET `description_en` = 'Davidoff''s Tokyo flagship in Ginza. A refuge for executives since smoking was banned in offices. The Davidoff Signature 2000 and the Aniversario Special R are popular.'
 WHERE `id` = '117' AND SHA1(TRIM(`description`)) = '3d8a5459394c5cf677310357636a317811d0677d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '117' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '3d8a5459394c5cf677310357636a317811d0677d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '118' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '7e266e4a6a3d616a323307452345652b7513d8bd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '119' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '121a0856ddb78e8e0ab834f9b024eed2ded0cc23';
-- lounges|120|description|en — variétés pas vitolas
UPDATE `lounges` SET `description_en` = 'A rock-themed cigar bar in the Cerulean Tower Hotel. Two hundred and seventy cigars across forty-five varieties, from Cuba and the Dominican Republic: Davidoff, Cohiba, Montecristo, Partagás. Japanese single malts and cognacs. Open from 4pm to midnight.'
 WHERE `id` = '120' AND SHA1(TRIM(`description`)) = 'dcc4374d5ed3932291c407d4631b7707c1ece49e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '120' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'dcc4374d5ed3932291c407d4631b7707c1ece49e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '121' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '0d8759bf5680046b3797991df60135cc42808cba';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '122' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '966f5353586df7c54c009b7f9cc5dc93d471cd46';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '123' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '36d2b7302a1dcc41f175cbc096a65887540ca444';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '126' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'd1aa1fb1d37433bbb1e928388f4a60a47c420bd4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '127' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'c2581f8837989757d7e626953a1220c691ac23cf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '128' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '425ee419904bbb0401944c8417f0099feb81862f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '129' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'bf1ee0ae85c0f796fc5885ac73d5e9fd8c8d1638';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '130' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'b6fbd4c12ce26b2a8abb44c03c55973a700012cd';
-- lounges|132|description|en — cave omise
UPDATE `lounges` SET `description_en` = 'Davidoff''s Singapore flagship in the premium ION Orchard mall. Humidor with over 1,000 references.'
 WHERE `id` = '132' AND SHA1(TRIM(`description`)) = 'c48192d58ab670591d761d2232c1351748c3f880';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '132' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'c48192d58ab670591d761d2232c1351748c3f880';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '133' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '640096563add4e15c9e08c26af844b34a35333dc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '134' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'ea3df5d7e3370df6e4ca5f91fcf2851b3a6259d0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '135' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'ba0100ebe4ae2cb5527fd06d3217ae5d9fea7117';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '136' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '7b0fd9660516d383d0ef49ea9ff9dbafaa06b9e4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '137' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'ccee7b5d4191f05b3aafd79956f13e76c0a1a661';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '139' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'a7425e26fae8cfc90af2114fdca9282034a57c20';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '140' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '6782644531449291b83ffac385dda32291af41f7';
-- lounges|141|description|en — orthographe britannique recognised
UPDATE `lounges` SET `description_en` = 'Angelina, the whisky lounge and restaurant of the Sofitel Legend Metropole Hanoi, has been recognised as a "Habanos Lounge"; Habanos presents it as the first in the Vietnamese capital. Its humidor holds Habanos brands including Cohiba, Montecristo, Romeo y Julieta, Partagás, Hoyo de Monterrey and H. Upmann.'
 WHERE `id` = '141' AND SHA1(TRIM(`description`)) = 'bcf82cc76e3071de8a09aec88d3c04b7e718f2a2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '141' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'bcf82cc76e3071de8a09aec88d3c04b7e718f2a2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '142' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'b66f8d1f0fb708ee8a98107076a5796855398502';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '143' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '320d1cf2c4e672bd3bc1b829e0c5b8d48f06c84e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '144' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'd1d6a4f7e11d3dce2994fd3a14d1cbe8b99c77c5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '145' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '2103621c41815a7777be60cebfd069480ea842c4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '146' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '4f5da91bc9684b9d3fc2fb44bfc70ddeb05c58b1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '147' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '4c228c14d9dfed89bdf58c1569780cf08849f5e0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '148' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'd0b4dff667d726ceacb75b1b95863457206a54ea';
-- lounges|149|description|en — formulation fautive
UPDATE `lounges` SET `description_en` = 'Copper tones, luxurious leather, the occasional celebrity sighting. A slim but distinctive cigar selection. The whisky list is among the best in New York. Own cigar accepted (fee applies).'
 WHERE `id` = '149' AND SHA1(TRIM(`description`)) = 'ae0a2b4c666e1f35c078c8e6133b3dfecfa5e9b5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '149' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'ae0a2b4c666e1f35c078c8e6133b3dfecfa5e9b5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '150' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '8163581f087aa37b124036acf56d10161402ddbe';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '151' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '10007f5277b834241de524d0cc6150ed4089d2a1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '152' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'ac7c1f202ddbaa0df081cdba45003cd45922b4b5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '153' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'defab8d71fd4e89a5dca7968b2dd3836bb26e0d1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '154' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '118898d2844670edcd6e2902baa73bdb068936bf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '155' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '1c5ed89bb28aee63e3e287bfbbc6ec6a818305f0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '156' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '57ce272f57492a7cdc6342eff9ee6ae086479784';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '157' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '81a86eab66a92939aad7efae0f371fac744cdc9a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '158' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'cb3bffe22d2da2060c90e2fcc5e1049be48162f1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '159' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '6fa9f9fbd51710008ba8c7220c1344544c93c7c6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '160' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'f78c0ca37358b83493e84e850991780277f4dc4f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '161' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '4f6de9299af5b9269688515c0ac7f46a6cc61611';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '162' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '7be936337c8b06beecd3bef664935023d1bab767';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '164' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '393a0e1b94f05d6af454490cc386cbf05ed6d534';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '165' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'bd04dfe14412ff895cc55d8cb72072ef278dbae3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '167' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '831c215660a2309816a25c0db7946cb48aa3e3d8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '168' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '53ed8f841eef93ec38e85ec21f5361657e7661aa';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '169' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '48696fc180efcd1d7ffd5b9f0f50fa0643e40d31';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '171' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '86a2e81afe945b7a3f31ccda71b311e7ec5d9483';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '172' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '6bccc30dfbcbc6a8ee2fa05e7adea2e329aa7094';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '173' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'bb277e88484f96c6e10bcbca6b0448d93fe9b55d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '174' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '88057bc315c086fa8b45a5650099af6bd3e5ffc6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '175' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '8f84adb9b69164648732f66645e2856529a9e8fe';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '176' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '0e2789f17033b716bffc4220144416efec254258';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '177' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'bf80c610984697a14c41ba46ef098d1d32460d2b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '178' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '359ffead85fffb59084792522a18dc22c153c0e8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '179' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '378ef27f5b9506b1b659dbd1be0be3f79d2a973f';
-- lounges|180|description|en — texte source altéré
UPDATE `lounges` SET `description_en` = 'Drew Estate''s lounge at the factory. Liga Privada fresh from the factory. Booking required.'
 WHERE `id` = '180' AND SHA1(TRIM(`description`)) = '2412ef9d54496934897d9e4f40f1641a80ef387e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '180' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '2412ef9d54496934897d9e4f40f1641a80ef387e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '181' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '93d8206930645392f853ec7333b1a49fd3f28984';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '182' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '3f398a62546a062a773de33cc2fc5d42e8e4abaa';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '183' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '3e3e3205e9052a4fe4a2b0e5c0e75b56e2cc3bb9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '184' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '4e2ffec9c44f1966a081fb0c83b85f1ac426e309';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '185' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '8775d8716116c2ffcd296a9ad6f0fbf4c1d1f180';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '186' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'b554021e9ae8bda54ffdf9d72e942edeede87577';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '187' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '8b8c6d11375dbcf3d1d06dd0ad967d6865aaaaa6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '188' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '724b46e1cab5cc43e53490dd5e9fa79de62d39bb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '189' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'c92f7dbf90286f37241cdd5f5dfba7e1801af8a4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '190' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '0fc74c2c0874383a0d06cd773ad016d35a3fb8fc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '191' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '0ecb4d1216ae4e7c33c02cdc04f9b9f09af1f20b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '192' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'f72dea7871248d81f9d1e9ac7dfdce5cec5a35fb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '193' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '60cfe4fb00304c170094b8581997ee8687e686aa';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '196' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'b08e23dee24c0007bce49dd091e94d3be0e9082b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '197' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '24b88e7c8ece536c8e8541d7b4c1b570db0da4fa';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '198' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '73233525b8bc816ad4b54832b70cc433026738e9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '228' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '38bd0fe3ed9ee8c2c02d937378b317d6260b8bbc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '229' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'ce83db95a3d42835fcccaa59947eae55db41e21f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '230' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'df4d1bb5fb5b5d262c5c6741f17e3c0fd5ceebf5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '231' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '85e3f4c19b69fcf1748ce55afc893d422e2ba793';
-- lounges|232|description|en — ajout one of
UPDATE `lounges` SET `description_en` = 'Cigar lounge of Le Royal Monceau, opened in 2018. Leather club armchairs, art books and a terrace opening onto a private courtyard of the hotel. Paid day access, for hotel guests and outside visitors alike.'
 WHERE `id` = '232' AND SHA1(TRIM(`description`)) = 'f9ffb8138f100bdf1e62789d401dd9fbe589760e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '232' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'f9ffb8138f100bdf1e62789d401dd9fbe589760e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '233' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'cd22adea7b80c78301fd0ad8b97d8e5a3beb1568';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '240' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '03bd1257b477efd69181bf9a7231f6d8ea6b7be0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '241' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '560806e2d32bd0f0152711234194f423f53ab8a7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '276' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '4c967b72644e6a9bfdef210eb9de96a662be25c8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '277' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '89769506a96b9a45306c88f0c82d2de54513df21';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '278' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '06d65a309e7fa9e6abd9957d3a005208923c20f4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '279' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'aa25edce540c87211cc65f8f0e777220109bc1db';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '280' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'a49325d68a2f6c16d1798b6dd9d278297e5e384c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '281' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '0f112b55832c9eabbacfa00ca95b0f872aeeeb48';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '282' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '4d43e298f42a1db0338984a2c41bbce445070466';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '283' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'c8e93c1af58c657fecd2ddd677bcb52d6a0343ba';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '330' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'cc9f418d2c82c0004b9b883f7d0d4bfca26ae51b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '365' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'f4c34a7efd180d9ef0292613006620d6535de74c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '366' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '7f9619d5e4a8e4f0c38571a3268eafceb790ff45';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '382' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '1c86a429c4516dbd0b5226d44e7034c84bad9a60';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '384' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '0409f9328f5b464641d4abb3b8609f8d22813032';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '385' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '569ffa698ffd5d02bd53fc15b663797ae901e78b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '386' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '97f4c89fedca99d7297647ac3aee5cc45b0f0718';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '411' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '810174205a11e7c45191f9fb4332ea51706e7c63';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '414' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '6b810c188d07a487967a62149a042af6806cb0fb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '415' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '24fd55215a41b758b46c5cd2d0d3583d047ca971';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '416' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '5fa7b2807789973ce9d7d336b73aec529a09d29a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '417' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '1296c930f36d4ec60b769feb94986d6567646021';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '418' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '283cc52e851854db5c97ebbef02eb0ed00a8168a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '420' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '8fa2d6483f1dbc9ceb9b40622934ff599877967c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '424' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '246d98fc3b6e1ee567d4323a3d99a32f0b670c47';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '425' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'ab05a51061639e02b611b0c5ad5225a773e41df9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '426' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'b812232d3605ef91f556bb213b99eec7b54fd0f7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '624' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '9ba9e35c89cd05b0816a3a31b19617ee14145a23';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '645' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'be55a9e2810b23d21464c389713e9b4d9da25e24';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '646' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '5fb8f86b3fc0409ca111ee1845a00cd9bcf08b68';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '683' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'fde0fee9deb2de9c3c23782973f2c4362df410fb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '687' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '9df940f4e425b35e2499ac85bc5db6ce5faccdbc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '745' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '9eefac3f62cef94a9a5cab799c57517029a87f5c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '747' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '1b12fbb34333dcf2de24a897b2256403b355deba';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '750' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '73e7c6011886c87cd909e19dfc12c3f7236fd2a2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '786' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '88878e9e70bf24c70cffcd53a511fd8ac14a5264';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '787' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'e39c3eb2fc8eeae7973295af4ec4da99cc9fd7d9';
-- lounges|813|description|en — répétition supprimée
UPDATE `lounges` SET `description_en` = 'Premium cigar lounge at the Radisson Blu Hotel, Bamako. Curated Habanos selection, fine spirits, refined atmosphere.'
 WHERE `id` = '813' AND SHA1(TRIM(`description`)) = '7b2917182a803558ab4b86d46fca914bc53009e3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '813' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '7b2917182a803558ab4b86d46fca914bc53009e3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '820' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '6a125f99548693907f908ce05eb6fe9ad63551c7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '827' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'b887558cf61916c1a29e463888ea7cd055e3e28a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '828' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '32d157cdc71528a885bb84f87cfb3810ac631ca3';
-- lounges|830|description|en — répétition supprimée
UPDATE `lounges` SET `description_en` = 'Premium cigar lounge at the Kempinski Hotel Gold Coast City, Accra. Curated Habanos selection, fine spirits, refined atmosphere.'
 WHERE `id` = '830' AND SHA1(TRIM(`description`)) = 'dc1218863abe99acb3df2314f380d2b07fbe64c3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '830' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'dc1218863abe99acb3df2314f380d2b07fbe64c3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '833' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '08ab81804a35b666be585226977446d2455718ec';
-- lounges|834|description|en — français résiduel
UPDATE `lounges` SET `description_en` = 'Premium cigar lounge at the Bole International terminal, Addis Ababa. Curated Habanos selection, fine spirits, refined atmosphere.'
 WHERE `id` = '834' AND SHA1(TRIM(`description`)) = '12fcab51aa84a7429b587c5225e3dc60820d450d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '834' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '12fcab51aa84a7429b587c5225e3dc60820d450d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '837' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '41f9be4ec90e23c08fe82404ad327c9bf3307b9e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '913' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'c915da80b81f893f1fd498ac2ce0f67153af6be9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '915' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'dbc8f28f60ebdd89ff291dd47dd53d09dfa623f3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '918' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '31d8609d8ce898328163b839b778187b8680f5e8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '919' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'e8f705cdbf55462c32e57237e253841345259ecf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '934' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '50867a0c47bb0d79b71f93378a8d7010489b07f3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '935' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '13990c6b9aff9826a5130f75df33815459394ee4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '938' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'baac6743f0fa29b5d64126ef6daff5ba90ae240b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '944' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '243e33d01d64ca6d07679970e70647d05686ad45';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '947' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '3c10c60201aae767bb7196f7bfd1c86fb40db5f1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '948' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '6da96f8c544b1b6bb08b3646df4944a7fb5bff67';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '951' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'fa571cf354ac4a86c8413bffa27371db56ca76fb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '968' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'db0a9cb155e8c529456db89346110c7fd9928c1c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '970' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'fe23b445b41a51bc0b5712bfb37dcbe9b617253f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1000' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'be6be0b7fa6da1cbb90297be8f851da4b99b7a44';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1107' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '014dd5e102ff465f1ca1ca049c76d8cdb9d8d41b';
-- lounges|1110|description|en — répétition supprimée
UPDATE `lounges` SET `description_en` = 'Premium cigar lounge at the Costa Rica Marriott Hotel, San José. Curated Habanos selection, fine spirits, refined atmosphere.'
 WHERE `id` = '1110' AND SHA1(TRIM(`description`)) = '89eea3268e61c534c639efaa2f2c8e7a5db249a8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1110' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '89eea3268e61c534c639efaa2f2c8e7a5db249a8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1113' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '96448053c3171de22b7b53b1fd6471fa03b29c98';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1120' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'd394954662bff827b86d09b4e961534f4c2bd3f0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1121' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '91233311bf3ef5eb7f3b498ab16c01824e0d50f1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1123' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'f0c90d2616e969f78971d46e4570434314254444';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1124' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '1fbfab18a9e4ad793444502d7703e0e874439204';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1126' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'afcfa0db146fa5d581c51c96aba26f64940ace72';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1127' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'ece9af4c610ad60c05417b8b2afe18e9ebbf58d0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1129' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '3572d7865fa01651645c3747beafc1fad9cc74c8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1130' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'cecd70279f5fd3ba8f9054d3a257cd74d446ab99';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1132' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'fc716b56f2bf6f81ebd293a09c5e771b95268752';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1133' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '96ea78705edc9bcff1f7a309aeeeec66c5273743';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1146' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'c597a6464519fc908a0e60d593bb8045bfc6a693';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1149' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '828ffe24de2ee938db792918357f0c10059692d4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1151' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'b230bf4908381588392fe75eb30c7508bc3ee455';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1171' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '3af128b7906e5150faec0f53fadefdd9893b423a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1189' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'c15d7d65678f52d69269336eb2a0485755fb0d7b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1191' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'd1f51c7704876ac9aa3d0aa9586bebca7b7fee93';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1201' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'd0655a2f6aaef3e2f6092b99defdcdf5db264e27';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1208' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '0f73e1845b2532bb508e656cfb4bc97e664b30c9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1244' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '3d3c007efa15fb1dd85a61bb970d15b9233629b1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1245' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'c1e55750775799483d6f1f3c5a7806ecafae4a57';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1246' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '1fad0a571620bd44cb92abaab2d5953bde1e90a9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1265' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '2676745fefc7965420bff826a0b38e5e6fad641f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1268' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '28da3c3babb716890b6f5d959d93079ee668d1aa';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1277' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '3455c58776547edde25cae7bba4b2846522e0d3d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1300' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '807d4c94c807e641a7a25df67867a3ae29279922';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1367' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '3c452302ccb607ea982ca7b5af716c99e243875f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1368' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '3dc192f64de3f72d010baf0b591c1741cffa5891';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1390' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '3569455e92286052b7c33abbd084c8e73ee2ecc3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1392' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'e5c2e7c4e0532a32337d27a960f18e3951615dd5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1393' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '341138c7acaa07277dc3d02aac473d90fab95584';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1426' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '214c46b9e0112687ad6821c64e6f2455a29fed85';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1427' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '9c1546997137ca394c0dd1bdd53367b1a4da603f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1448' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '658ace0502920eadf3092e7a55d74fb7987330f1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1449' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '25147da2f51fcc80994a289b5078b6a58adb0ad2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1465' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'cd7c0a2419e2c2adae68f1ccdeb2fef134174ef5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1504' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'abc880de069bfc4b8f53f4794ddb0f4678dafb00';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1506' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'f04fa6f426008194ca38ea2248d99189b6fe83ab';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1507' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'f7232ffcae869818d3781675d2a6183a15343c59';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1508' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'ea09ff7f4fe6502a24f150387725e6c602a62814';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1563' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'fcad63157909642bc8e31bd3bc31fea5deae1302';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1564' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '8c996e627648b9c6a9b2bbb9c268d5f0205af450';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1565' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'afe5e94aa8cfe4ad171495364ce87d971e595894';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1566' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '79a5474e344a223718f7465195e0c8530ce35f38';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1570' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'e11646368ab299b75261f47641fb32f6a78e215d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1571' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '8629d9f66a957aa1409d090938b0c1127ea42b31';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1572' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'f2690e714aa68a8fbca424ad140a88167cc18514';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1575' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'ca987d6a00c5233617f14652b35af75777251975';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1611' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '72d3dbe44d7a5ed74e3f7c0e155254e9e72bfe48';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1613' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'ef781f7f4bf3950c8d69ed153024fdd23f185237';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1614' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '6f687632582a1605309c7bdaa432b3061a8ff50c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1615' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '1dc5c0183aef771cfb091e307fddcd326e405865';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1616' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'd8300f3bc78ada0faa66b3f8ddd6a053eecfa135';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2497' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '6c79635099001b1ec623568e20659c8c646b0c3c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2498' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '56364bc10932b1e8919aa0fe8bad0f8c87453a4b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2505' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'c49dcd77ab6af4558735cfa005c9ef6ab47f89c7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2509' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '45c1167386f8171acb06ab17ef46eabf37fcd245';
-- lounges|2515|description|en — ajout brands, sens
UPDATE `lounges` SET `description_en` = 'Davidoff boutique at The Shoppes at Marina Bay Sands. Walk-in humidor, accessories and a dedicated spirits corner; the brand also presents other premium cigars there.'
 WHERE `id` = '2515' AND SHA1(TRIM(`description`)) = 'cf642fc440ba780d264cd90e9e313def186c5714';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2515' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'cf642fc440ba780d264cd90e9e313def186c5714';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2517' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '7353e2686a77a5aed638a465f2e32e167d12039b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2536' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'be8917f19d27697670b7377b052b3775ff71adee';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2541' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '636e910745b791335114b2a1f80bab8ddbe63ade';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2542' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'd7fa970cdf872b31f70f963971bde213d8974fae';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2546' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '20734a8e4b92fa67f3f9db9609e2903cf1d81b8b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2550' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'be2898159132892f2e7c974596eaa07e640c3ab0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2552' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '5ad6979a9825e59fe078bdd48ca239b71e0db594';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2553' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '65036eb98cdbf6f7a0259e6a72effdd20e3473d0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2554' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '97a3e791369e13e04c4add0672d0eaed8438b9ae';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2555' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'c7e94ea62244f969e22550e34736cc687197b962';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2557' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '7191a74facd1acb9a074b81c17f69048129b0eac';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2558' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '62a57fc67587adb53c34d9b18b9fc5b02bfb628b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2559' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '77936de286d3f439f1bd28f25c13d939487f7c1a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2560' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'cfd3844f8cd5abf275515b7f18687f930593f17a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2561' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'd4fdae2d9beddd0f33745178c17bff4a3a62ee12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2562' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '3bfa7b1ff026d4cea1a7b0b774304f3f485820e1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2563' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'ae97d0bfdd51804cd9f9a1780a8c1227522b52a7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2564' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '4104da21e7c839d28f91777bdd52a1d4b4c40506';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2565' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'a0d263e3b358e7e5ba774f1892c0fbbde671a0ad';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2566' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '73b803660031ce34f067ac3dcbd48df5fafe90c9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2567' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '1b9d2d117890f1b739a5baaa2e6f8c40d4281308';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2568' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '7d88506bec8ade1dce12fa1d13af117f17b8f5b9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2569' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '264c06a70da8e024641779ee1213322248840da2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2570' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '2735cd7866bc663f8b5c9ed4ab8211915584346c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2571' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '4a3c585d4990aaf7625ff443d3f4d31f594eff9d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2572' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'e0d2404e70c64378cb237924091c57fb2f291a7b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2573' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '66aff93d65156d5c17ce5ffdd4916e936d8d0690';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2574' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'cdc67070f74f7c41075c4c79df0dd482ca9b436f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2575' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '250c2f822e11226d8de05ac1d35068bee329371f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2576' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'fc2fc6e8e621be9a331d29fc51104ca03167d805';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2577' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'bdc2f26dca61850a9b1a1104abffc44c1315d60a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2578' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'e9b2f5a836042bf98e78fc5f2d4e80272cccd5b2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2579' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '9ff7ca3de6f4c83c82ef5570f2721e478af3ea75';

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 284';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 284', 'systeme', 'traductions_relues', 'systeme', 0, 'Relecture « en » par expert-traduction (agent) : 1269 traduction(s) relue(s) — 88 corrigee(s), 1181 validee(s) telles quelles ; producer_countries 5, brands 926, lounges 338');

SELECT
  (SELECT COUNT(*) FROM `translation_status` WHERE `lang` = 'en' AND `statut` = 'relu' AND `relecteur` = 'expert-traduction (agent)') >= 1269 AS relues,
  (SELECT COUNT(*) FROM `translation_status` WHERE `statut` = 'relu' AND (`relecteur` IS NULL OR `relecteur` = '')) = 0 AS chaque_relecture_a_son_relecteur;
SELECT `lang`, SUM(`statut` = 'relu') AS relues, COUNT(*) AS total FROM `translation_status` GROUP BY `lang`;
