/* traduire.js */
// _tr() — traduit les VALEURS de contenu (region, climat, sol, type
// d'etablissement...) que la base sert en francais.
//
// Ce dictionnaire vivait au sommet de data.countries.js, qui portait
// surtout une copie figee des douze pays — copie perimee et ecrasante,
// retiree par E5. La fonction, elle, est bien vivante : panels.js et
// markets.js l'appellent a chaque rendu.
// ── Dictionnaire de traduction des valeurs inline ────────
// Utilisé par _renderPanel et renderLexBody pour traduire
// les valeurs issues des données inline (climate, soil, harvest, region...)
var _TRANSLATE = {
  // Régions
  'Caraïbes':              {en:'Caribbean',      es:'Caribe',        de:'Karibik',          zh:'加勒比',     ar:'الكاريبي'},
  'Amérique Centrale':     {en:'Central America',es:'América Central',de:'Mittelamerika',   zh:'中美洲',     ar:'أمريكا الوسطى'},
  'Amérique du Sud':       {en:'South America',  es:'América del Sur',de:'Südamerika',      zh:'南美洲',     ar:'أمريكا الجنوبية'},
  'Amérique du Nord':      {en:'North America',  es:'América del Norte',de:'Nordamerika',   zh:'北美洲',     ar:'أمريكا الشمالية'},
  'Asie du Sud-Est':       {en:'Southeast Asia', es:'Asia del Sudeste',de:'Südostasien',    zh:'东南亚',     ar:'جنوب شرق آسيا'},
  'Afrique Centrale':      {en:'Central Africa', es:'África Central', de:'Zentralafrika',   zh:'中非',       ar:'أفريقيا الوسطى'},
  // Climates
  'Tropical humide':       {en:'Humid tropical',        es:'Tropical húmedo',     de:'Feuchttropen',       zh:'湿热带',       ar:'مداري رطب'},
  'Tropical montagnard':   {en:'Mountain tropical',     es:'Tropical montañoso',  de:'Bergtropen',         zh:'山地热带',     ar:'استوائي جبلي'},
  'Subtropical':           {en:'Subtropical',           es:'Subtropical',         de:'Subtropisch',        zh:'亚热带',       ar:'شبه استوائي'},
  'Subtropical montagnard':{en:'Mountain subtropical',  es:'Subtropical montañoso',de:'Bergsubtropisch',   zh:'山地亚热带',   ar:'شبه استوائي جبلي'},
  'Tropical sec':          {en:'Dry tropical',          es:'Tropical seco',       de:'Trockene Tropen',    zh:'干热带',       ar:'مداري جاف'},
  'Tempéré chaud':         {en:'Warm temperate',        es:'Templado cálido',     de:'Warmes gemäßigtes',  zh:'温暖温带',     ar:'معتدل دافئ'},
  'Équatorial':            {en:'Equatorial',            es:'Ecuatorial',          de:'Äquatorial',         zh:'赤道型',       ar:'استوائي'},
  // Sols
  'Sol volcanique rouge':  {en:'Red volcanic soil',     es:'Suelo volcánico rojo', de:'Roter Vulkanboden', zh:'红色火山土',   ar:'تربة بركانية حمراء'},
  'Sol argileux rouge':    {en:'Red clay soil',         es:'Suelo arcilloso rojo', de:'Roter Lehmboden',   zh:'红粘土',       ar:'تربة طينية حمراء'},
  'Sol sablonneux':        {en:'Sandy soil',            es:'Suelo arenoso',        de:'Sandboden',         zh:'沙土',         ar:'تربة رملية'},
  'Sol volcanique':        {en:'Volcanic soil',         es:'Suelo volcánico',      de:'Vulkanboden',       zh:'火山土',       ar:'تربة بركانية'},
  'Sol tropical riche':    {en:'Rich tropical soil',    es:'Suelo tropical rico',  de:'Reicher Tropenboden',zh:'富饶热带土',  ar:'تربة استوائية غنية'},
  'Sol alluvial':          {en:'Alluvial soil',         es:'Suelo aluvial',        de:'Alluvialboden',     zh:'冲积土',       ar:'تربة طينية نهرية'},
  'Sol argileux brun':     {en:'Brown clay soil',       es:'Suelo arcilloso marrón',de:'Brauner Lehmboden',zh:'棕色粘土',    ar:'تربة طينية بنية'},
  // Récoltes
  'Jan – Fév':             {en:'Jan – Feb',             es:'Ene – Feb',            de:'Jan – Feb',         zh:'1月–2月',      ar:'يناير – فبراير'},
  'Nov – Mar':             {en:'Nov – Mar',             es:'Nov – Mar',            de:'Nov – Mär',         zh:'11月–3月',     ar:'نوفمبر – مارس'},
  'Oct – Jan':             {en:'Oct – Jan',             es:'Oct – Ene',            de:'Okt – Jan',         zh:'10月–1月',     ar:'أكتوبر – يناير'},
  'Nov – Fév':             {en:'Nov – Feb',             es:'Nov – Feb',            de:'Nov – Feb',         zh:'11月–2月',     ar:'نوفمبر – فبراير'},
  'Sep – Jan':             {en:'Sep – Jan',             es:'Sep – Ene',            de:'Sep – Jan',         zh:'9月–1月',      ar:'سبتمبر – يناير'},
  'Mar – Avr':             {en:'Mar – Apr',             es:'Mar – Abr',            de:'Mär – Apr',         zh:'3月–4月',      ar:'مارس – أبريل'},
  // Brand descs inline
  'La marque la plus prestigieuse au monde':{en:"The world's most prestigious brand",es:"La marca más prestigiosa del mundo",de:"Die renommierteste Marke",zh:"世界最负盛名的品牌",ar:"أرقى علامة في العالم"},
  'Référence mondiale du cigare cubain':{en:"World reference of Cuban cigars",es:"Referencia mundial del cigarro cubano",de:"Weltmaßstab der kubanischen Zigarre",zh:"古巴雪茄的世界标准",ar:"المرجع العالمي للسيجار الكوبي"},
  'Fondée en 1845, full body légendaire':{en:"Founded in 1845, legendary full body",es:"Fundada en 1845, full body legendario",de:"Gegründet 1845, legendärer Full Body",zh:"创立于1845年，传奇浓郁",ar:"تأسست 1845، نكهة قوية أسطورية"},
  'Favori de Winston Churchill':{en:"Winston Churchill's favourite",es:"El favorito de Winston Churchill",de:"Churchills Liebling",zh:"丘吉尔的最爱",ar:"المفضل لدى تشرشل"},
  'Créée par un banquier hambourgeois en 1844':{en:"Created by a Hamburg banker in 1844",es:"Creada por un banquero hamburguês en 1844",de:"Von einem Hamburger Banker 1844 gegründet",zh:"1844年由汉堡银行家创立",ar:"أسسها مصرفي هامبورغي 1844"},
  'Puissant, terreux, pour connaisseurs':{en:"Powerful, earthy, for connoisseurs",es:"Poderoso, terroso, para conocedores",de:"Kraftvoll, erdig, für Kenner",zh:"浓郁、泥土气息，适合行家",ar:"قوي، ترابي، للخبراء"},
  'Jadis réservée aux cadeaux diplomatiques':{en:"Once reserved for diplomatic gifts",es:"Antes reservada para regalos diplomáticos",de:"Früher für diplomatische Geschenke",zh:"曾专为外交礼物保留",ar:"كانت حكراً على الهدايا الدبلوماسية"},
  'Marque historique cubaine depuis 1840':{en:"Historic Cuban brand since 1840",es:"Marca cubana histórica desde 1840",de:"Historische kubanische Marke seit 1840",zh:"自1840年的古巴历史品牌",ar:"علامة كوبية تاريخية منذ 1840"},
  // Tendances marchés
  'stable':                {en:'stable',                es:'estable',                de:'stabil',               zh:'稳定',       ar:'مستقر'},
  'croissance':            {en:'growth',                es:'crecimiento',            de:'Wachstum',             zh:'增长',       ar:'نمو'},
  'forte croissance':      {en:'strong growth',         es:'fuerte crecimiento',     de:'starkes Wachstum',     zh:'强劲增长',   ar:'نمو قوي'},
  'déclin':                {en:'decline',               es:'declive',                de:'Rückgang',             zh:'下降',       ar:'انحدار'},
  'déclin (sanctions)':    {en:'decline (sanctions)',   es:'declive (sanciones)',    de:'Rückgang (Sanktionen)',zh:'下降（制裁）',ar:'انحدار (عقوبات)'},
  // Statuts Habanos
  'SIÈGE SOCIAL':          {en:'HEADQUARTERS',          es:'SEDE CENTRAL',           de:'HAUPTSITZ',            zh:'总部',       ar:'المقر الرئيسي'},
  'MEMBRE HABANOS':        {en:'HABANOS MEMBER',        es:'MIEMBRO HABANOS',        de:'HABANOS MITGLIED',     zh:'哈瓦那成员', ar:'عضو هابانوس'},
  'PARTENAIRE':            {en:'PARTNER',               es:'SOCIO',                  de:'PARTNER',              zh:'合作伙伴',   ar:'شريك'},
  'FOURNISSEUR MONDIAL DE WRAPPER':{en:'GLOBAL WRAPPER SUPPLIER',es:'PROVEEDOR GLOBAL DE CAPA',de:'GLOBALER WRAPPER-LIEFERANT',zh:'全球外皮供应商',ar:'مورد غلاف عالمي'},
  'PARTENAIRE AROMATIQUE': {en:'AROMATIC PARTNER',      es:'SOCIO AROMÁTICO',        de:'AROMATISCHER PARTNER', zh:'芳香合作伙伴',ar:'شريك عطري'},
  'PARTENAIRE HISTORIQUE': {en:'HISTORICAL PARTNER',    es:'SOCIO HISTÓRICO',        de:'HISTORISCHER PARTNER', zh:'历史合作伙伴',ar:'شريك تاريخي'},


  // Notes sommelier par pays
  'Berceau du cigare premium mondial.': {
    en:'Cradle of premium cigar worldwide. Vuelta Abajo — the most prestigious tobacco terroir on earth. Cohiba, Montecristo, Partagás, Romeo y Julieta: the world\'s most celebrated names.',
    es:'Cuna del cigarro premium mundial. Vuelta Abajo — el terroir tabacalero más prestigioso del planeta.',
    de:'Wiege der Premium-Zigarre weltweit. Vuelta Abajo — das renommierteste Tabak-Terroir der Erde.',
    zh:'全球高端雪茄的摇篮。布埃尔塔阿巴霍 — 地球上最负盛名的烟草风土。',
    ar:'مهد السيجار الفاخر في العالم. فويلتا أباخو — أعرق أراضي التبغ على وجه الأرض.',
  },
  'Premier producteur mondial en volume.': {
    en:'World\'s leading producer by volume. Jalapa Valley and Estelí rival Cuban terroirs. Padrón, My Father, Oliva, Liga Privada: the New World\'s finest.',
    es:'Primer productor mundial en volumen. Los valles de Jalapa y Estelí rivalizan con los terroirs cubanos.',
    de:'Weltgrößter Produzent nach Volumen. Jalapa-Tal und Estelí konkurrieren mit kubanischen Terroirs.',
    zh:'全球产量最大的生产国。哈拉帕谷和埃斯特利可与古巴风土媲美。',
    ar:'أكبر منتج في العالم حجماً. وادي خالابا وإستيلي يضاهيان التربة الكوبية.',
  },
  'Premier exportateur mondial en valeur.': {
    en:'World\'s leading exporter by value. Arturo Fuente, Davidoff, La Flor Dominicana: the terroir of cigar diplomacy.',
    es:'Primer exportador mundial en valor. Arturo Fuente, Davidoff, La Flor Dominicana: el terroir de la diplomacia del cigarro.',
    de:'Weltgrößter Exporteur nach Wert. Arturo Fuente, Davidoff, La Flor Dominicana: das Terroir der Zigarren-Diplomatie.',
    zh:'全球出口价值最高。阿图罗·富恩特、大卫杜夫：雪茄外交的风土。',
    ar:'أكبر مُصدِّر قيمةً في العالم. أرتورو فوينتي وديفيدوف: تربة دبلوماسية السيجار.',
  },
  'Jamastran — Corojo les plus puissants hors Cuba.': {
    en:'Jamastran — the most powerful Corojo tobaccos outside Cuba. Camacho, Alec Bradley, CAO: bold blends.',
    es:'Jamastran — los Corojos más potentes fuera de Cuba. Camacho, Alec Bradley, CAO: blends contundentes.',
    de:'Jamastran — die kraftvollsten Corojo-Tabake außerhalb Kubas. Camacho, Alec Bradley, CAO.',
    zh:'哈马斯特兰 — 古巴以外最强劲的科罗霍烟叶。',
    ar:'خاماستران — أقوى تبغ الكوروخو خارج كوبا.',
  },
  'Premier producteur de wrapper Connecticut.': {
    en:'World\'s premier Connecticut shade wrapper grown at altitude. Found in Davidoff, Ashton, Perdomo.',
    es:'Primer productor mundial de wrapper Connecticut shade en altura. Presente en Davidoff, Ashton, Perdomo.',
    de:'Weltbester Connecticut-Shade-Wrapper aus Höhenlagen. In Davidoff, Ashton, Perdomo.',
    zh:'世界最优质高海拔种植康涅狄格遮阴外皮。见于大卫杜夫、阿什顿。',
    ar:'أفضل غلاف كونيكتيكت ظلي في العالم، مزروع على الارتفاعات. في ديفيدوف وأشتون.',
  },
  'Wrapper le plus recherché — café, cacao, épices.': {
    en:'Most sought-after wrapper — coffee, cocoa, spices. CAO, Arturo Fuente Hemingway, Oliva Serie G.',
    es:'Wrapper más codiciado — café, cacao, especias. CAO, Arturo Fuente Hemingway, Oliva Serie G.',
    de:'Begehrtester Wrapper — Kaffee, Kakao, Gewürze. CAO, Arturo Fuente Hemingway, Oliva Serie G.',
    zh:'最受追捧的外皮 — 咖啡、可可、香料。',
    ar:'الغلاف الأكثر طلباً — قهوة وكاكاو وتوابل.',
  },
  'Mata Fina — meilleur wrapper Maduro du monde.': {
    en:'Mata Fina — the world\'s finest Maduro wrapper, naturally fermented in Bahia. Dannemann (1873): oldest manufacturer in the Americas.',
    es:'Mata Fina — el mejor wrapper Maduro del mundo. Dannemann (1873): la manufactura más antigua de América.',
    de:'Mata Fina — weltbester Maduro-Wrapper. Dannemann (1873): ältester Hersteller Amerikas.',
    zh:'马塔菲纳 — 世界最优质的马杜罗外皮。丹纳曼（1873）：美洲最古老的制造商。',
    ar:'ماتا فينا — أفضل غلاف مادورو في العالم. دانمان (1873): أقدم مصنع في الأمريكتين.',
  },
  'Connecticut Shade — wrapper le plus doux au monde.': {
    en:'Connecticut Shade — the world\'s smoothest wrapper, grown since the 18th century. Home of General Cigar and the most demanding premium market.',
    es:'Connecticut Shade — el wrapper más suave del mundo desde el siglo XVIII. Hogar de General Cigar.',
    de:'Connecticut Shade — sanftester Wrapper seit dem 18. Jahrhundert. Heimat von General Cigar.',
    zh:'康涅狄格遮阴 — 自18世纪以来世界最柔和的外皮。通用雪茄的故乡。',
    ar:'كونيكتيكت شيد — أكثر الأغلفة نعومةً منذ القرن الثامن عشر. موطن جنرال سيجار.',
  },
  'Deli Sumatra — wrapper le plus utilisé en Europe.': {
    en:'Deli Sumatra — the most widely used wrapper in European cigars. Java and Sumatra tobaccos underpin Henri Wintermans and Café Crème.',
    es:'Deli Sumatra — el wrapper más utilizado en los cigarros europeos. Henri Wintermans y Café Crème.',
    de:'Deli Sumatra — meistgenutzter Wrapper in europäischen Zigarren. Henri Wintermans und Café Crème.',
    zh:'德里苏门答腊 — 欧洲雪茄中使用最广泛的外皮。支撑亨利·温特曼斯和咖啡奶油。',
    ar:'ديلي سومطرة — الغلاف الأكثر استخداماً في السيجار الأوروبي.',
  },
  'San Andrés — wrapper le plus noir et naturellement doux.': {
    en:'San Andrés — the darkest and naturally sweetest wrapper in the world. Volcanic Veracruz soil with pre-Columbian roots, used in premium Maduro blends worldwide.',
    es:'San Andrés — el wrapper más negro y dulce del mundo. Suelo volcánico de Veracruz con raíces precolombinas.',
    de:'San Andrés — dunkelster und natürlich süßester Wrapper. Vulkanboden von Veracruz mit präkolumbianischen Wurzeln.',
    zh:'圣安德烈斯 — 世界最黑、天然最甜的外皮。韦拉克鲁斯的火山土壤，哥伦布前文明根源。',
    ar:'سان أندريس — أكثر الأغلفة قتامةً وأحلوها طبيعياً. تربة فيراكروز البركانية.',
  },
  'Terroir volcanique de Chiriquí à surveiller.': {
    en:'The volcanic terroir of Chiriquí — an emerging tobacco region to watch. Carlos Toraño, the Cuban exile family, has cultivated these highlands since 1960.',
    es:'El terroir volcánico de Chiriquí — una región tabacalera emergente. La familia Toraño cultiva estas tierras altas desde 1960.',
    de:'Das Vulkan-Terroir von Chiriquí — eine aufstrebende Tabakregion. Familie Toraño bebaut dieses Hochland seit 1960.',
    zh:'奇里基的火山风土 — 新兴烟草产区。古巴流亡家族托拉尼奥自1960年起耕种。',
    ar:'تربة تشيريكي البركانية — منطقة تبغ ناشئة. عائلة تورانيو الكوبية تزرع هذه المرتفعات منذ 1960.',
  },

  // Types de lounges
  'La Casa del Habano Officielle':      {en:'Official La Casa del Habano',        es:'La Casa del Habano Oficial',          de:'Offizielle La Casa del Habano',         zh:'官方哈瓦那之家',               ar:'لا كاسا ديل هابانو الرسمية'},
  'La Casa del Habano Officielle (1re de Suisse)':{en:'Official La Casa del Habano (1st in Switzerland)',es:'La Casa del Habano Oficial (1ª de Suiza)',de:'Offizielle La Casa del Habano (1. der Schweiz)',zh:'官方哈瓦那之家（瑞士第一家）',ar:'لا كاسا ديل هابانو الرسمية (الأولى في سويسرا)'},
  'La Casa del Habano Officielle (depuis 1995)': {en:'Official La Casa del Habano (since 1995)',es:'La Casa del Habano Oficial (desde 1995)',de:'Offizielle La Casa del Habano (seit 1995)',zh:'官方哈瓦那之家（自1995年）',ar:'لا كاسا ديل هابانو الرسمية (منذ 1995)'},
  'La Casa del Habano dans Harrods':    {en:'La Casa del Habano at Harrods',       es:'La Casa del Habano en Harrods',       de:'La Casa del Habano in Harrods',         zh:'哈罗德百货哈瓦那之家',         ar:'لا كاسا ديل هابانو في هارودز'},
  'Davidoff Appointed Merchant':        {en:'Davidoff Appointed Merchant',         es:'Comerciante Davidoff Autorizado',     de:'Davidoff Authorized Merchant',          zh:'大卫杜夫授权经销商',           ar:'تاجر معين من ديفيدوف'},
  'Davidoff Flagship':                  {en:'Davidoff Flagship',                   es:'Davidoff Flagship',                   de:'Davidoff Flagship',                     zh:'大卫杜夫旗舰店',               ar:'ديفيدوف الرئيسية'},
  'Davidoff Flagship NYC':              {en:'Davidoff Flagship NYC',               es:'Davidoff Flagship NYC',               de:'Davidoff Flagship NYC',                 zh:'大卫杜夫纽约旗舰店',           ar:'ديفيدوف فلاغشيب نيويورك'},
  'Davidoff Premium':                   {en:'Davidoff Premium',                    es:'Davidoff Premium',                    de:'Davidoff Premium',                      zh:'大卫杜夫精选',                 ar:'ديفيدوف بريميوم'},
  'Cohiba Atmosphere Officiel':         {en:'Official Cohiba Atmosphere',          es:'Cohiba Atmosphere Oficial',           de:'Offizielle Cohiba Atmosphere',          zh:'官方科伊巴氛围店',             ar:'كوهيبا أتموسفير الرسمية'},
  'Cohiba Atmosphere Officiel (membres)':{en:'Official Cohiba Atmosphere (Members)', es:'Cohiba Atmosphere Oficial (Socios)', de:'Offizielle Cohiba Atmosphere (Mitglieder)', zh:'官方科伊巴氛围（会员）',  ar:'كوهيبا أتموسفير الرسمية (الأعضاء)'},
  'Cigar Bar (Cohiba Atmosphere)':      {en:'Cigar Bar (Cohiba Atmosphere)',       es:'Bar de Cigarros (Cohiba Atmosphere)', de:'Zigarren-Bar (Cohiba Atmosphere)',      zh:'雪茄吧（科伊巴氛围）',         ar:'بار السيجار (كوهيبا أتموسفير)'},
  'Habanos Lounge Officiel':            {en:'Official Habanos Lounge',             es:'Salón Habanos Oficial',               de:'Offizieller Habanos Lounge',            zh:'官方哈瓦那斯休息室',           ar:'صالة هابانوس الرسمية'},
  'Hotel Cigar Bar':                    {en:'Hotel Cigar Bar',                     es:'Bar de Cigarros en Hotel',            de:'Hotel Zigarren-Bar',                    zh:'酒店雪茄吧',                   ar:'بار سيجار فندقي'},
  'Hotel Cigar Lounge':                 {en:'Hotel Cigar Lounge',                  es:'Salón de Cigarros en Hotel',          de:'Hotel Zigarren-Lounge',                 zh:'酒店雪茄休息室',               ar:'صالة سيجار فندقية'},
  'Hotel Cigar Bar Historique':         {en:'Historic Hotel Cigar Bar',            es:'Bar de Cigarros Histórico en Hotel',  de:'Historische Hotel Zigarren-Bar',        zh:'历史悠久酒店雪茄吧',           ar:'بار سيجار فندق تاريخي'},
  'Hôtel Cigar Bar':                    {en:'Hotel Cigar Bar',                     es:'Bar de Cigarros en Hotel',            de:'Hotel Zigarren-Bar',                    zh:'酒店雪茄吧',                   ar:'بار سيجار فندقي'},
  'Palace Cigar Lounge':                {en:'Palace Cigar Lounge',                 es:'Salón de Cigarros de Palace',         de:'Palace Zigarren-Lounge',                zh:'宫殿雪茄休息室',               ar:'صالة سيجار القصر'},
  'Palace Cigar Bar':                   {en:'Palace Cigar Bar',                    es:'Bar de Cigarros de Palace',           de:'Palace Zigarren-Bar',                   zh:'宫殿雪茄吧',                   ar:'بار سيجار القصر'},
  'Palace Cigar Room':                  {en:'Palace Cigar Room',                   es:'Sala de Cigarros de Palace',          de:'Palace Zigarren-Raum',                  zh:'宫殿雪茄室',                   ar:'غرفة سيجار القصر'},
  'Cave & Lounge':                      {en:'Cigar Cave & Lounge',                 es:'Cave y Salón de Cigarros',            de:'Zigarren-Keller & Lounge',              zh:'雪茄酒窖与休息室',             ar:'كهف وصالة السيجار'},
  'Cave & Lounge Premium':              {en:'Premium Cigar Cave & Lounge',         es:'Cave y Salón de Cigarros Premium',    de:'Premium Zigarren-Keller & Lounge',      zh:'精品雪茄酒窖与休息室',         ar:'كهف وصالة سيجار فاخرة'},
  'Cave Premium':                       {en:'Premium Cigar Cave',                  es:'Cave de Cigarros Premium',            de:'Premium Zigarren-Keller',               zh:'精品雪茄酒窖',                 ar:'كهف سيجار فاخر'},
  'Cave & Habanos Specialist':          {en:'Cave & Habanos Specialist',           es:'Cave y Especialista Habanos',         de:'Zigarren-Keller & Habanos-Spezialist',  zh:'雪茄酒窖与哈瓦那斯专家',       ar:'كهف ومتخصص هابانوس'},
  'Cave Premium Selfridges':            {en:'Premium Cave at Selfridges',          es:'Cave Premium en Selfridges',          de:'Premium Keller in Selfridges',          zh:'塞尔福里奇精品雪茄酒窖',       ar:'كهف فاخر في سيلفريدجز'},
  'Cave Premium Hôtel Historique':      {en:'Premium Cave at Historic Hotel',      es:'Cave Premium en Hotel Histórico',     de:'Premium Keller im historischen Hotel',  zh:'历史酒店精品雪茄酒窖',         ar:'كهف فاخر في فندق تاريخي'},
  'Cigar Lounge Premium':               {en:'Premium Cigar Lounge',               es:'Salón de Cigarros Premium',           de:'Premium Zigarren-Lounge',               zh:'精品雪茄休息室',               ar:'صالة سيجار فاخرة'},
  'Flagship Lounge & Cave':             {en:'Flagship Lounge & Cave',             es:'Salón & Cave Insignia',               de:'Flagship Lounge & Keller',              zh:'旗舰休息室与酒窖',             ar:'الصالة الرئيسية والكهف'},
  'Lounge & Cave':                      {en:'Lounge & Cigar Cave',                es:'Salón y Cave de Cigarros',            de:'Lounge & Zigarren-Keller',              zh:'休息室与雪茄酒窖',             ar:'صالة وكهف السيجار'},
  'Lounge Cigares & Civette':           {en:'Cigar Lounge & Tobacconist',         es:'Salón de Cigarros y Cigarrería',      de:'Zigarren-Lounge & Tabakhandlung',       zh:'雪茄休息室与烟草店',           ar:'صالة سيجار ومحل تبغ'},
  'Civette Historique':                 {en:'Historic Tobacconist',               es:'Cigarrería Histórica',                de:'Historische Tabakhandlung',             zh:'历史悠久烟草店',               ar:'محل تبغ تاريخي'},
  "Civette Historique (fondée 1826)":  {en:'Historic Tobacconist (est. 1826)',    es:'Cigarrería Histórica (fundada 1826)', de:'Historische Tabakhandlung (gegr. 1826)',zh:'历史烟草店（创立于1826年）',  ar:'محل تبغ تاريخي (تأسس 1826)'},
  "Civette Historique (fondée 1857)":  {en:'Historic Tobacconist (est. 1857)',    es:'Cigarrería Histórica (fundada 1857)', de:'Historische Tabakhandlung (gegr. 1857)',zh:'历史烟草店（创立于1857年）',  ar:'محل تبغ تاريخي (تأسس 1857)'},
  "Civette Historique (fondée 1870)":  {en:'Historic Tobacconist (est. 1870)',    es:'Cigarrería Histórica (fundada 1870)', de:'Historische Tabakhandlung (gegr. 1870)',zh:'历史烟草店（创立于1870年）',  ar:'محل تبغ تاريخي (تأسس 1870)'},
  "Civette Historique (fondée 1920)":  {en:'Historic Tobacconist (est. 1920)',    es:'Cigarrería Histórica (fundada 1920)', de:'Historische Tabakhandlung (gegr. 1920)',zh:'历史烟草店（创立于1920年）',  ar:'محل تبغ تاريخي (تأسس 1920)'},
  "Civette Historique (plus ancienne du monde)":{en:'Historic Tobacconist (oldest in the world)',es:'Cigarrería Histórica (la más antigua del mundo)',de:'Historische Tabakhandlung (älteste der Welt)',zh:'历史烟草店（全球最古老）',ar:'محل التبغ التاريخي (الأقدم في العالم)'},
  'Civette & Cave à Cigares':          {en:'Tobacconist & Cigar Cave',           es:'Cigarrería y Cave de Cigarros',       de:'Tabakhandlung & Zigarren-Keller',       zh:'烟草店与雪茄酒窖',             ar:'محل تبغ وكهف سيجار'},
  'Boutique Manufacture':              {en:'Manufacture Boutique',               es:'Boutique Manufactura',                de:'Manufaktur-Boutique',                   zh:'制造厂精品店',                 ar:'بوتيك المصنع'},
  'Boutique Historique (fondée 1782)': {en:'Historic Boutique (est. 1782)',       es:'Boutique Histórica (fundada 1782)',   de:'Historische Boutique (gegr. 1782)',     zh:'历史精品店（创立于1782年）',  ar:'بوتيك تاريخي (تأسس 1782)'},
  'Manufacture Artisanale Ivoirienne': {en:'Ivorian Artisan Manufacture',         es:'Manufactura Artesanal Marfileña',     de:'Ivorische Handwerksmanufaktur',         zh:'科特迪瓦手工制造厂',           ar:'مصنع حرفي عاجي'},
  'Manufacture Showroom':              {en:'Manufacture Showroom',                es:'Showroom de Manufactura',             de:'Manufaktur-Showroom',                   zh:'制造厂展厅',                   ar:'صالة عرض المصنع'},
  'Factory Lounge':                    {en:'Factory Lounge',                      es:'Salón de Fábrica',                    de:'Fabrik-Lounge',                         zh:'工厂休息室',                   ar:'صالة المصنع'},
  'Plantation & Dégustation':          {en:'Plantation & Tasting',               es:'Plantación y Degustación',            de:'Plantage & Verkostung',                 zh:'种植园与品鉴',                 ar:'مزرعة وتذوق'},
  'Musée & Boutique Historique':       {en:'Museum & Historic Boutique',         es:'Museo y Boutique Histórica',          de:'Museum & Historische Boutique',         zh:'博物馆与历史精品店',           ar:'متحف وبوتيك تاريخي'},
  'Cigar Bar & Jazz Club':             {en:'Cigar Bar & Jazz Club',              es:'Bar de Cigarros y Club de Jazz',      de:'Zigarren-Bar & Jazz-Club',              zh:'雪茄吧与爵士俱乐部',           ar:'بار سيجار ونادي جاز'},
  'Cigar Bar & Live Jazz':             {en:'Cigar Bar & Live Jazz',              es:'Bar de Cigarros y Jazz en Vivo',      de:'Zigarren-Bar & Live-Jazz',              zh:'雪茄吧与现场爵士',             ar:'بار سيجار وجاز حي'},
  'Cigar Bar & Whisky Lounge':         {en:'Cigar Bar & Whisky Lounge',          es:'Bar de Cigarros y Salón de Whisky',   de:'Zigarren-Bar & Whisky-Lounge',          zh:'雪茄吧与威士忌休息室',         ar:'بار سيجار وصالة ويسكي'},
  'Cigar Bar Historique':              {en:'Historic Cigar Bar',                 es:'Bar de Cigarros Histórico',           de:'Historische Zigarren-Bar',              zh:'历史雪茄吧',                   ar:'بار سيجار تاريخي'},
  'Bar & Lounge Cigares':              {en:'Cigar Bar & Lounge',                 es:'Bar y Salón de Cigarros',             de:'Zigarren-Bar & Lounge',                 zh:'雪茄吧与休息室',               ar:'بار وصالة السيجار'},
  'Restaurant, Lounge & Cigar Shop':   {en:'Restaurant, Lounge & Cigar Shop',    es:'Restaurante, Salón y Tienda de Cigarros', de:'Restaurant, Lounge & Zigarren-Shop', zh:'餐厅、休息室与雪茄店',        ar:'مطعم وصالة ومحل سيجار'},
  'Restaurant Étoilé Cigar Lounge':    {en:'Starred Restaurant Cigar Lounge',    es:'Salón de Cigarros Restaurante con Estrella', de:'Sternerestaurant Zigarren-Lounge', zh:'米其林餐厅雪茄休息室',         ar:'صالة سيجار مطعم بنجمة'},
  'Wine Bar & Cigar Room Premium':     {en:'Premium Wine Bar & Cigar Room',      es:'Bar de Vinos y Sala de Cigarros Premium', de:'Premium Weinbar & Zigarren-Raum',   zh:'精品酒吧与雪茄室',             ar:'بار نبيذ وغرفة سيجار فاخرة'},
  'Casino Hotel Lounge':               {en:'Casino Hotel Lounge',                es:'Salón del Hotel Casino',              de:'Casino-Hotel-Lounge',                   zh:'赌场酒店休息室',               ar:'صالة فندق الكازينو'},
  'Cave & Lounge Géant (fondé 2005)':  {en:'Giant Cave & Lounge (est. 2005)',    es:'Cave y Salón Gigante (fundado 2005)', de:'Riesiger Keller & Lounge (gegr. 2005)', zh:'巨型酒窖与休息室（创立2005年）',ar:'كهف وصالة عملاقة (تأسس 2005)'},
  "Chaîne Premium (1re boutique 2010)":{en:'Premium Chain (1st store 2010)',     es:'Cadena Premium (1ª boutique 2010)',   de:'Premium-Kette (1. Boutique 2010)',     zh:'精品连锁（第一家店2010年）',    ar:'سلسلة فاخرة (أول بوتيك 2010)'},
};

// Fonction helper : traduire une valeur inline selon la langue courante
function _tr(val) {
  if (!val) return val;
  var lang = window.currentLang || 'fr';
  if (lang === 'fr') return val;
  var map = _TRANSLATE[val];
  if (map && map[lang]) return map[lang];
  return val; // fallback : valeur originale
}
