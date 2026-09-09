-- ════════════════════════════════════════════════════════
-- 192 — Les commanditaires : sept marques, aucun atelier
-- ────────────────────────────────────────────────────────
--   Protocol              Cancel et Ives, 2015       nicaragua
--   Regius                Akhil Kapacee, 2010        nicaragua
--   Cornelius & Anthony   famille Bailey, 2015       nicaragua
--   262 Cigars            Clint Aaron, 2010          nicaragua
--   Emilio Cigars         Gary Griffith, 2010        nicaragua
--   Nomad                 Fred Rewey, 2012           nicaragua
--   7-20-4                Kurt A. Kendall, 2006      nicaragua
--
-- Les sept ont en commun de ne rien fabriquer. Elles composent, elles
-- signent, elles vendent — et elles font rouler ailleurs. C'est le
-- modele que cet atlas a deja decrit chez Crowned Heads, Dunbarton et
-- La Palina ; ce lot le montre a l'echelle d'un pays entier.
--
-- ── LA CONSIGNE « QUI FAIT QUOI », LOT PAR LOT ──────────
-- Onze ateliers nommes, dont sept ont deja leur fiche ici :
--
--   Protocol      LA ZONA, la fabrique d'ESPINOSA a Esteli, avec
--                 Hector Alfonso Sr. a la composition ; puis SAN
--                 LOTANO, celle d'A.J. FERNANDEZ
--   Regius        PLASENCIA, Esteli
--   Cornelius &   LA ZONA pour l'essentiel ; et EL TITAN DE BRONZE,
--   Anthony       a Miami, pour la ligne Cornelius
--   262           Tabacalera Carreras (Craig Cunningham) et TacaNicsa
--                 (Eradio Pichardo), toutes deux a Esteli
--   Emilio        A.J. FERNANDEZ (AF1, AF2), MY FATHER (Grimalkin de
--                 2011), puis la Fabrica OVEJA NEGRA de BLACK LABEL
--                 TRADING CO. pour le Grimalkin d'aujourd'hui
--   Nomad         Tabacalera L&V (Rep. dom.), A.J. FERNANDEZ et
--                 OVEJA NEGRA (Nicaragua)
--   7-20-4        Tabacos de Oriente, la fabrique de Nestor PLASENCIA
--                 au Honduras ; puis J. Fuego, a Esteli, depuis 2021
--
-- ── HUITIEME ET NEUVIEME ERREURS DE PAYS DU RECENSEMENT ─
-- `docs/maisons-absentes.md` classait NOMAD en Republique dominicaine
-- et 7-20-4 aux Etats-Unis. Les deux sont fausses, et pour le motif
-- habituel — l'adresse du fondateur prise pour le lieu de fabrication :
--
--   Nomad    a commence dominicaine, a la Tabacalera L&V, mais
--            l'essentiel des seize assemblages du catalogue sort du
--            Nicaragua depuis 2013
--   7-20-4   n'a jamais rien fait dans le New Hampshire. La ligne
--            d'origine et la Factory 57 sortaient du Honduras ; en
--            juillet 2021 la ligne principale est passee chez
--            J. Fuego, a Esteli
--
-- Cela porte a NEUF les erreurs de pays du recensement, apres Nicoya
-- (183), La Palina (186/189), Padilla (188), Asylum et Micallef (190),
-- Gurkha et La Barba (191).
--
-- ── UNE MAISON QUI FAIT AUSSI DE LA MACHINE ─────────────
-- Cornelius & Anthony est une filiale de S&M BRANDS, societe familiale
-- de Keysville en Virginie, qui fabrique des cigarettes et de petits
-- cigares de machine. Rien de cela n'entre dans l'atlas. La fiche porte
-- le versant roule main de la maison, et l'ecrit noir sur blanc — meme
-- partage qu'a la 187 chez J.C. Newman et qu'a la 189 chez Dannemann.
--
-- ── CE QUE CES FICHES ECRIVENT SANS L'AFFIRMER ──────────
-- Protocol a change de mains en fevrier 2026 : le detaillant floridien
-- Smoke Inn a rachete la propriete intellectuelle et les actifs de la
-- marque, mais PAS Cubariqueno Cigar Company, qui reste aux fondateurs.
-- Juan Cancel accompagne toujours la marque ; les deux fabriques n'ont
-- pas change. La fiche dit exactement cela, sans extrapoler.
--
-- ⚠ LES SEPT SONT ROULEES MAIN, et les `founded` tiennent sous 49
-- caracteres — regles 184 et 187, verifiees avant ecriture.
--
-- Sources : halfwheel.com « Smoke Inn Acquires Cubariqueno Cigar Co.'s
-- Protocol Brand », cigardojo.com et stogiepress.com (Cancel et Ives,
-- policiers, 2015, La Zona, Hector Alfonso Sr., San Lotano) ;
-- cigaraficionado.com « Q&A: Akhil Kapacee of Regius Cigars » et
-- cigar-coop.com (2010, Londres, Plasencia a Esteli) ;
-- cigarjournal.com « The Bailey Family's Tobacco History » et
-- cigaraficionado.com (S&M Brands, 2015, La Zona, El Titan de Bronze) ;
-- halfwheel.com « Portraits: Clint Aaron » et cigar-coop.com (2008,
-- Revolution Cigars, fevrier 1962, Paradigm 2010, Carreras et TacaNicsa,
-- la vente a Madison Money en juin 2019) ;
-- cigar-coop.com « Cigar Review: Emilio AF1 » et halfwheel.com
-- (Griffith, Delaware Cigars, My Father, Mousa, Oveja Negra) ;
-- halfwheel.com « Ezra Zion Buys Nomad Cigar Co. » et cigardojo.com
-- (L&V, A.J. Fernandez, Oveja Negra, la vente de septembre 2018) ;
-- cigar-coop.com « 7-20-4 Line Shifts to J. Fuego Factory in Nicaragua »
-- (juillet 2021), cigarinspector.com et thecigarauthority.com
-- (R.G. Sullivan, 724 Elm Street, 1874, la fermeture de 1962,
-- Tabacos de Oriente, Factory 57).
--
-- Apres cette migration :
--   php tools/contenu_dump.php
--   php tools/i18n_dump.php > sql/traductions.sql
-- ════════════════════════════════════════════════════════

INSERT INTO `brands`
  (`name`, `country_id`, `founded`, `factory`, `history`, `gamme`,
   `history_en`, `history_es`, `history_de`, `history_zh`, `history_ar`,
   `gamme_en`, `gamme_es`, `gamme_de`, `gamme_zh`, `gamme_ar`)
VALUES

-- ── Protocol ─────────────────────────────────────────────
('Protocol', 'nicaragua', '2015 — Cubariqueño Cigar Company',
 'La Zona (Espinosa) et San Lotano (A.J. Fernández), Estelí',

 'Protocol est la marque de deux policiers. Juan Cancel et Bill Ives servaient dans la police quand ils ont fondé Cubariqueño Cigar Company, au début de 2015. Le nom de la société dit leurs deux origines : cubaine pour l''un, portoricaine pour l''autre.

Toute la marque tient dans le vocabulaire de leur métier. Protocol d''abord, puis Probable Cause, Themis — la déesse grecque de la justice —, Official Misconduct, Confidential Informant. C''est un parti pris rare dans une industrie qui préfère les noms de familles et de vallées.

Ils n''ont pas d''usine, et ils n''en ont jamais cherché. Ils avaient passé des années à faire connaître Espinosa sur les réseaux avant de se lancer, et c''est chez Espinosa qu''ils sont allés : La Zona, à Estelí, avec Hector Alfonso Sr. à la composition. Une partie de la production est passée ensuite chez San Lotano, la fabrique d''A.J. Fernández. Les deux ateliers ont leur fiche dans cet atlas.

En février 2026, le détaillant floridien Smoke Inn a racheté la propriété intellectuelle et les actifs de la marque — mais pas Cubariqueño, qui reste aux fondateurs. Juan Cancel accompagne toujours Protocol, et les deux fabriques n''ont pas changé.',

 '[{"name":"Protocol","color":"#1F3A5F","force":"Medium-Full","wrapper":"Assemblage nicaraguayen, chez La Zona","vitolas":["Robusto","Toro","Lancero"],"story":"La ligne fondatrice, sortie en 2015 de La Zona. Le Lancero est venu ensuite : un format que peu de jeunes marques osent, parce qu''il ne pardonne rien au roulage."},{"name":"Probable Cause","color":"#3D2B1F","force":"Full","wrapper":"Maduro San Andrés","vitolas":["Robusto","Toro"],"story":"La cape mexicaine de San Andrés, celle que l''atlas suit jusqu''à sa vallée. Le nom est un terme de procédure : les motifs raisonnables qui autorisent une arrestation."},{"name":"Themis","color":"#C4A66B","force":"Medium","wrapper":"Connecticut d''Équateur","vitolas":["Robusto","Toro"],"story":"Le versant doux de la maison, sous cape équatorienne. Themis est la déesse grecque de la justice — celle qui tient la balance."}]',

 'Protocol is the brand of two policemen. Juan Cancel and Bill Ives were serving officers when they founded Cubariqueño Cigar Company in early 2015. The company name states their two origins: Cuban for one, Puerto Rican for the other.

The whole brand sits inside the vocabulary of their trade. Protocol first, then Probable Cause, Themis — the Greek goddess of justice — Official Misconduct, Confidential Informant. It is a rare choice in an industry that prefers family names and valleys.

They have no factory and never looked for one. They had spent years making Espinosa known on social media before starting out, and it was to Espinosa that they went: La Zona, in Estelí, with Hector Alfonso Sr. blending. Part of the production later moved to San Lotano, A.J. Fernández''s factory. Both workshops have their own entry in this atlas.

In February 2026 the Florida retailer Smoke Inn bought the brand''s intellectual property and assets — but not Cubariqueño, which stays with the founders. Juan Cancel remains with Protocol, and the two factories have not changed.',

 'Protocol es la marca de dos policías. Juan Cancel y Bill Ives eran agentes en activo cuando fundaron Cubariqueño Cigar Company, a principios de 2015. El nombre de la sociedad dice sus dos orígenes: cubano para uno, puertorriqueño para el otro.

Toda la marca cabe en el vocabulario de su oficio. Protocol primero, luego Probable Cause, Themis —la diosa griega de la justicia—, Official Misconduct, Confidential Informant. Es una elección rara en un sector que prefiere los apellidos y los valles.

No tienen fábrica y nunca la buscaron. Habían pasado años dando a conocer Espinosa en las redes antes de lanzarse, y fue a Espinosa adonde fueron: La Zona, en Estelí, con Hector Alfonso Sr. en la ligada. Parte de la producción pasó después a San Lotano, la fábrica de A.J. Fernández. Los dos talleres tienen su ficha en este atlas.

En febrero de 2026 el minorista floridano Smoke Inn compró la propiedad intelectual y los activos de la marca, pero no Cubariqueño, que sigue en manos de los fundadores. Juan Cancel continúa con Protocol, y las dos fábricas no han cambiado.',

 'Protocol ist die Marke zweier Polizisten. Juan Cancel und Bill Ives waren im Dienst, als sie Anfang 2015 die Cubariqueño Cigar Company gründeten. Der Firmenname nennt ihre beiden Herkünfte: kubanisch der eine, puerto-ricanisch der andere.

Die ganze Marke bleibt im Wortschatz ihres Berufs. Zuerst Protocol, dann Probable Cause, Themis — die griechische Göttin der Gerechtigkeit —, Official Misconduct, Confidential Informant. Das ist ungewöhnlich in einer Branche, die Familiennamen und Täler bevorzugt.

Sie haben keine Fabrik und haben nie eine gesucht. Sie hatten jahrelang Espinosa in den sozialen Netzen bekannt gemacht, bevor sie selbst begannen, und zu Espinosa gingen sie: La Zona in Estelí, mit Hector Alfonso Sr. an der Mischung. Ein Teil der Produktion wechselte später zu San Lotano, der Fabrik von A.J. Fernández. Beide Werkstätten haben in diesem Atlas ihren eigenen Eintrag.

Im Februar 2026 kaufte der Händler Smoke Inn aus Florida die Schutzrechte und die Markenwerte — nicht aber Cubariqueño, das den Gründern bleibt. Juan Cancel begleitet Protocol weiterhin, und die beiden Fabriken sind dieselben geblieben.',

 'Protocol 是两名警察的品牌。Juan Cancel 与 Bill Ives 在任警职期间，于 2015 年初创办了 Cubariqueño Cigar Company。公司名道出了两人的出身：一位是古巴裔，一位是波多黎各裔。

整个品牌都装在他们本行的词汇里。先是 Protocol，接着是 Probable Cause、Themis（希腊司法女神）、Official Misconduct、Confidential Informant。在一个偏爱姓氏与山谷的行业里，这样的取名并不多见。

他们没有工厂，也从未去找过。创业之前，他们在社交网络上为 Espinosa 做了多年推介；于是他们去的正是 Espinosa 的 La Zona 工厂，位于埃斯特利，由 Hector Alfonso Sr. 负责配方。后来部分产量转到 A.J. Fernández 的 San Lotano 工厂。两间作坊在本图集中都有各自的条目。

2026 年 2 月，佛罗里达零售商 Smoke Inn 买下了这一品牌的知识产权与资产，但没有买下 Cubariqueño——它仍归创始人所有。Juan Cancel 继续与 Protocol 同行，两间工厂也没有更换。',

 'إن «بروتوكول» علامة رجلَي شرطة. كان خوان كانسيل وبيل آيفس ضابطَين عاملَين حين أسّسا شركة «كوباريكينيو» للسيجار في مطلع عام 2015. واسم الشركة يجمع أصلَيهما: كوبيّ لأحدهما، بورتوريكيّ للآخر.

والعلامة كلّها قائمة في مفردات مهنتهما: «بروتوكول» أوّلًا، ثم «بروبابل كوز»، و«ثيميس» — ربّة العدالة عند الإغريق —، و«أوفيشال ميسكونداكت»، و«كونفيدنشال إنفورمانت». وهو اختيار نادر في صناعة تُؤثِر أسماء العائلات وأسماء الوديان.

لا مصنع لهما، ولم يبحثا عنه قطّ. فقد أمضيا سنوات في التعريف بـ«إسبينوزا» على الشبكات قبل أن يبدآ، وإلى «إسبينوزا» ذهبا: مصنع «لا زونا» في إستيلي، ومعهما هيكتور ألفونسو الأب في المزج. ثم انتقل جزء من الإنتاج إلى «سان لوتانو»، مصنع أ. ج. فرنانديز. وللورشتين بطاقتاهما في هذا الأطلس.

وفي فبراير 2026 اشترى بائع التجزئة الفلوريديّ «سموك إن» الملكية الفكرية للعلامة وأصولها — لا «كوباريكينيو» نفسها، فهي باقية لمؤسّسَيها. ولا يزال خوان كانسيل يرافق «بروتوكول»، ولم يتغيّر المصنعان.',

 '[{"name":"Protocol","color":"#1F3A5F","force":"Medium-Full","wrapper":"Nicaraguan blend, at La Zona","vitolas":["Robusto","Toro","Lancero"],"story":"The founding line, out of La Zona in 2015. The Lancero came later: a size few young brands attempt, because it forgives nothing in the rolling."},{"name":"Probable Cause","color":"#3D2B1F","force":"Full","wrapper":"San Andrés maduro","vitolas":["Robusto","Toro"],"story":"The Mexican San Andrés wrapper, the one this atlas follows back to its valley. The name is a procedural term: the reasonable grounds that permit an arrest."},{"name":"Themis","color":"#C4A66B","force":"Medium","wrapper":"Ecuadorian Connecticut","vitolas":["Robusto","Toro"],"story":"The mild side of the house, under an Ecuadorian wrapper. Themis is the Greek goddess of justice — the one who holds the scales."}]',

 '[{"name":"Protocol","color":"#1F3A5F","force":"Medium-Full","wrapper":"Ligada nicaragüense, en La Zona","vitolas":["Robusto","Toro","Lancero"],"story":"La línea fundadora, salida de La Zona en 2015. El Lancero llegó después: un formato que pocas marcas jóvenes se atreven a hacer, porque no perdona nada al liado."},{"name":"Probable Cause","color":"#3D2B1F","force":"Full","wrapper":"Maduro de San Andrés","vitolas":["Robusto","Toro"],"story":"La capa mexicana de San Andrés, la que este atlas sigue hasta su valle. El nombre es un término procesal: los motivos razonables que autorizan una detención."},{"name":"Themis","color":"#C4A66B","force":"Medium","wrapper":"Connecticut de Ecuador","vitolas":["Robusto","Toro"],"story":"La vertiente suave de la casa, bajo capa ecuatoriana. Themis es la diosa griega de la justicia, la que sostiene la balanza."}]',

 '[{"name":"Protocol","color":"#1F3A5F","force":"Medium-Full","wrapper":"Nicaraguanische Mischung, bei La Zona","vitolas":["Robusto","Toro","Lancero"],"story":"Die Gründungslinie, 2015 aus La Zona. Der Lancero kam später: ein Format, das sich wenige junge Marken zutrauen, weil es beim Rollen nichts verzeiht."},{"name":"Probable Cause","color":"#3D2B1F","force":"Full","wrapper":"San-Andrés-Maduro","vitolas":["Robusto","Toro"],"story":"Das mexikanische San-Andrés-Deckblatt, dem dieser Atlas bis in sein Tal folgt. Der Name ist ein Rechtsbegriff: der hinreichende Verdacht, der eine Festnahme erlaubt."},{"name":"Themis","color":"#C4A66B","force":"Medium","wrapper":"Ecuadorianisches Connecticut","vitolas":["Robusto","Toro"],"story":"Die milde Seite des Hauses, unter ecuadorianischem Deckblatt. Themis ist die griechische Göttin der Gerechtigkeit — die mit der Waage."}]',

 '[{"name":"Protocol","color":"#1F3A5F","force":"Medium-Full","wrapper":"尼加拉瓜配方，产自 La Zona","vitolas":["Robusto","Toro","Lancero"],"story":"奠基产品线，2015 年出自 La Zona。Lancero 是后来才有的：这个尺寸少有年轻品牌敢做，因为它对卷制毫不宽容。"},{"name":"Probable Cause","color":"#3D2B1F","force":"Full","wrapper":"San Andrés 马杜罗","vitolas":["Robusto","Toro"],"story":"墨西哥 San Andrés 茄衣，本图集一路追溯到它所在的山谷。名字取自程序法用语：允许实施逮捕的合理根据。"},{"name":"Themis","color":"#C4A66B","force":"Medium","wrapper":"厄瓜多尔 Connecticut","vitolas":["Robusto","Toro"],"story":"这家温和的一面，用厄瓜多尔茄衣。Themis 是希腊的司法女神——手持天平的那一位。"}]',

 '[{"name":"Protocol","color":"#1F3A5F","force":"Medium-Full","wrapper":"مزيج نيكاراغويّ، في لا زونا","vitolas":["Robusto","Toro","Lancero"],"story":"الخط المؤسِّس، خرج من لا زونا عام 2015. أمّا اللانسيرو فجاء لاحقًا: قياس قلّما تُقدِم عليه العلامات الفتية، لأنّه لا يغفر خطأً في اللفّ."},{"name":"Probable Cause","color":"#3D2B1F","force":"Full","wrapper":"مادورو سان أندريس","vitolas":["Robusto","Toro"],"story":"الغلاف المكسيكيّ من سان أندريس، الذي يتتبّعه هذا الأطلس إلى واديه. والاسم مصطلح إجرائيّ: الأسباب المعقولة التي تُجيز التوقيف."},{"name":"Themis","color":"#C4A66B","force":"Medium","wrapper":"كونيتيكت إكوادوريّ","vitolas":["Robusto","Toro"],"story":"الوجه اللطيف للدار، تحت غلاف إكوادوريّ. وثيميس ربّة العدالة عند الإغريق — حاملة الميزان."}]'),

-- ── Regius ───────────────────────────────────────────────
('Regius', 'nicaragua', '2010 — Akhil Kapacee, Londres',
 'Plasencia, Estelí, Nicaragua',

 'Regius est une maison londonienne. Akhil Kapacee l''a fondée en 2010 avec une intention précise : proposer au marché britannique des cigares soignés à un prix que le pays ne pratique pas. Le Royaume-Uni est l''un des marchés où la fiscalité du tabac pèse le plus lourd, et le havane y coûte davantage qu''ailleurs en Europe.

Elle a vendu chez elle d''abord, puis visé les États-Unis à partir de 2012.

Elle ne possède pas de fabrique. Ses cigares sortent d''Estelí, chez Plasencia — la famille qui a sa fiche dans cet atlas et qui roule depuis longtemps pour d''autres que pour elle-même. C''est la configuration ordinaire des maisons européennes : la signature d''un côté, l''atelier de l''autre, à huit mille kilomètres.

Une particularité anglaise mérite d''être notée : l''Orchant Seleccion, faite pour Mitchell Orchant, du détaillant londonien C.Gars. Une bague de boutique sur un cigare de marque est un usage que le continent connaît peu, et que Londres pratique depuis longtemps.',

 '[{"name":"Regius Black Label","color":"#1A1A1A","force":"Medium-Full","wrapper":"Assemblage Plasencia","vitolas":["Robusto","Toro","Corona"],"story":"La ligne que le marché britannique connaît le mieux, roulée à Estelí. L''étiquette noire est la marque de fabrique visuelle de la maison."},{"name":"Regius Sun Grown","color":"#8B4A2B","force":"Full","wrapper":"Cape de plein soleil","vitolas":["Robusto","Toro"],"story":"Le versant corsé, sous cape cultivée sans ombrière. Une feuille de plein soleil est plus épaisse et plus nourrie — elle porte davantage de goût, et supporte moins bien l''à-peu-près."},{"name":"Orchant Seleccion","color":"#5C4033","force":"Medium","wrapper":"Assemblage Plasencia","vitolas":["Robusto","Toro"],"story":"Faite pour Mitchell Orchant, du détaillant londonien C.Gars. Une bague de boutique sur un cigare de marque : un usage anglais."}]',

 'Regius is a London house. Akhil Kapacee founded it in 2010 with a precise intention: to offer the British market carefully made cigars at a price the country does not usually see. The United Kingdom is one of the markets where tobacco duty weighs heaviest, and Havanas cost more there than elsewhere in Europe.

It sold at home first, then set its sights on the United States from 2012.

It owns no factory. Its cigars come out of Estelí, at Plasencia — the family that has its own entry in this atlas and that has long rolled for others as well as for itself. This is the ordinary arrangement of European houses: the signature on one side, the workshop on the other, eight thousand kilometres away.

One English particularity is worth noting: the Orchant Seleccion, made for Mitchell Orchant of the London retailer C.Gars. A shop band on a branded cigar is a practice the continent barely knows, and that London has long followed.',

 'Regius es una casa londinense. Akhil Kapacee la fundó en 2010 con una intención precisa: ofrecer al mercado británico puros cuidados a un precio que el país no suele ver. El Reino Unido es uno de los mercados donde la fiscalidad del tabaco pesa más, y el habano cuesta allí más que en el resto de Europa.

Vendió primero en casa y apuntó a Estados Unidos a partir de 2012.

No posee fábrica. Sus puros salen de Estelí, en Plasencia: la familia que tiene su ficha en este atlas y que lía desde hace tiempo para otros además de para sí misma. Es la configuración habitual de las casas europeas: la firma por un lado, el taller por otro, a ocho mil kilómetros.

Merece nota una particularidad inglesa: la Orchant Seleccion, hecha para Mitchell Orchant, del minorista londinense C.Gars. Una vitola de tienda sobre un puro de marca es un uso que el continente apenas conoce y que Londres practica desde hace mucho.',

 'Regius ist ein Londoner Haus. Akhil Kapacee gründete es 2010 mit einer klaren Absicht: dem britischen Markt sorgfältig gemachte Zigarren zu einem Preis anzubieten, den das Land sonst nicht kennt. Grossbritannien ist einer der Märkte mit der schwersten Tabaksteuer, und Havannas kosten dort mehr als anderswo in Europa.

Zuerst wurde zu Hause verkauft, ab 2012 richtete sich der Blick auf die Vereinigten Staaten.

Eine eigene Fabrik gibt es nicht. Die Zigarren kommen aus Estelí, von Plasencia — der Familie, die in diesem Atlas ihren eigenen Eintrag hat und seit langem auch für andere rollt. Das ist die übliche Anordnung europäischer Häuser: die Signatur auf der einen Seite, die Werkstatt achttausend Kilometer entfernt auf der anderen.

Eine englische Besonderheit sei vermerkt: die Orchant Seleccion, gemacht für Mitchell Orchant vom Londoner Händler C.Gars. Ein Ladenring auf einer Markenzigarre ist auf dem Kontinent kaum üblich; London kennt ihn seit langem.',

 'Regius 是一家伦敦公司。Akhil Kapacee 于 2010 年创办它，意图很明确：以英国市场少见的价格，向本地提供做工讲究的雪茄。英国是烟草税负最重的市场之一，哈瓦那雪茄在那里比欧洲其他地方更贵。

它先在本土销售，2012 年起把目光投向美国。

它没有自己的工厂。雪茄出自埃斯特利的 Plasencia——本图集收录了这个家族，他们长期既为自己也为别人卷制。这正是欧洲公司常见的格局：签名在一端，作坊在八千公里外的另一端。

有一处英国式的做法值得一记：Orchant Seleccion，为伦敦零售商 C.Gars 的 Mitchell Orchant 而作。品牌雪茄上套一枚店铺茄标，欧陆罕见，伦敦却由来已久。',

 'إن «ريجيوس» دار لندنية. أسّسها أخيل كاباسي عام 2010 بنيّة محدّدة: أن يقدّم للسوق البريطانية سيجارًا متقنًا بسعر لا تعرفه البلاد عادةً. فالمملكة المتحدة من الأسواق التي تثقل فيها ضريبة التبغ، والسيجار الهافانيّ فيها أغلى منه في سائر أوروبا.

باعت في بلدها أوّلًا، ثم اتّجهت إلى الولايات المتحدة ابتداءً من 2012.

ولا تملك مصنعًا. سيجارها يخرج من إستيلي، عند «بلاسنسيا» — العائلة التي لها بطاقتها في هذا الأطلس، والتي تلفّ منذ زمن لغيرها كما تلفّ لنفسها. وهذا هو الترتيب المعتاد للدور الأوروبية: التوقيع في جهة، والورشة في جهة أخرى على بُعد ثمانية آلاف كيلومتر.

وثمّة خصوصية إنجليزية تستحقّ التسجيل: «أورشانت سيليكسيون»، صُنعت لميتشل أورشانت صاحب متجر «سي غارز» في لندن. فوضع حلقة متجر على سيجار علامةٍ عادةٌ لا تكاد القارّة تعرفها، وتمارسها لندن منذ زمن.',

 '[{"name":"Regius Black Label","color":"#1A1A1A","force":"Medium-Full","wrapper":"Plasencia blend","vitolas":["Robusto","Toro","Corona"],"story":"The line the British market knows best, rolled in Estelí. The black label is the house''s visual signature."},{"name":"Regius Sun Grown","color":"#8B4A2B","force":"Full","wrapper":"Sun-grown wrapper","vitolas":["Robusto","Toro"],"story":"The fuller side, under a wrapper grown without shade. A sun-grown leaf is thicker and better fed — it carries more flavour, and tolerates approximation less well."},{"name":"Orchant Seleccion","color":"#5C4033","force":"Medium","wrapper":"Plasencia blend","vitolas":["Robusto","Toro"],"story":"Made for Mitchell Orchant of the London retailer C.Gars. A shop band on a branded cigar: an English practice."}]',

 '[{"name":"Regius Black Label","color":"#1A1A1A","force":"Medium-Full","wrapper":"Ligada Plasencia","vitolas":["Robusto","Toro","Corona"],"story":"La línea que mejor conoce el mercado británico, liada en Estelí. La etiqueta negra es la firma visual de la casa."},{"name":"Regius Sun Grown","color":"#8B4A2B","force":"Full","wrapper":"Capa de sol","vitolas":["Robusto","Toro"],"story":"La vertiente fuerte, bajo capa cultivada sin sombra. Una hoja de sol es más gruesa y más nutrida: lleva más sabor y tolera peor la aproximación."},{"name":"Orchant Seleccion","color":"#5C4033","force":"Medium","wrapper":"Ligada Plasencia","vitolas":["Robusto","Toro"],"story":"Hecha para Mitchell Orchant, del minorista londinense C.Gars. Una vitola de tienda sobre un puro de marca: un uso inglés."}]',

 '[{"name":"Regius Black Label","color":"#1A1A1A","force":"Medium-Full","wrapper":"Plasencia-Mischung","vitolas":["Robusto","Toro","Corona"],"story":"Die Linie, die der britische Markt am besten kennt, gerollt in Estelí. Das schwarze Etikett ist das optische Zeichen des Hauses."},{"name":"Regius Sun Grown","color":"#8B4A2B","force":"Full","wrapper":"Sonnendeckblatt","vitolas":["Robusto","Toro"],"story":"Die kräftigere Seite, unter einem ohne Schatten gewachsenen Deckblatt. Ein Sonnenblatt ist dicker und besser genährt — es trägt mehr Geschmack und verzeiht Ungefähres weniger."},{"name":"Orchant Seleccion","color":"#5C4033","force":"Medium","wrapper":"Plasencia-Mischung","vitolas":["Robusto","Toro"],"story":"Gemacht für Mitchell Orchant vom Londoner Händler C.Gars. Ein Ladenring auf einer Markenzigarre: eine englische Gepflogenheit."}]',

 '[{"name":"Regius Black Label","color":"#1A1A1A","force":"Medium-Full","wrapper":"Plasencia 配方","vitolas":["Robusto","Toro","Corona"],"story":"英国市场最熟悉的一条线，在埃斯特利卷制。黑色标签是这家的视觉印记。"},{"name":"Regius Sun Grown","color":"#8B4A2B","force":"Full","wrapper":"日光茄衣","vitolas":["Robusto","Toro"],"story":"厚重的一面，用未遮荫栽培的茄衣。日光叶更厚、养分更足——带的味道更多，也更不容将就。"},{"name":"Orchant Seleccion","color":"#5C4033","force":"Medium","wrapper":"Plasencia 配方","vitolas":["Robusto","Toro"],"story":"为伦敦零售商 C.Gars 的 Mitchell Orchant 而作。品牌雪茄上套店铺茄标：一种英国做法。"}]',

 '[{"name":"Regius Black Label","color":"#1A1A1A","force":"Medium-Full","wrapper":"مزيج بلاسنسيا","vitolas":["Robusto","Toro","Corona"],"story":"الخطّ الذي تعرفه السوق البريطانية أكثر من سواه، ويُلَفّ في إستيلي. والملصق الأسود هو العلامة البصرية للدار."},{"name":"Regius Sun Grown","color":"#8B4A2B","force":"Full","wrapper":"غلاف شمسيّ","vitolas":["Robusto","Toro"],"story":"الوجه الأقوى، تحت غلاف نما بلا ظلّ. فالورقة الشمسية أسمك وأوفر غذاءً — تحمل نكهةً أكثر، وتحتمل التقريب أقلّ."},{"name":"Orchant Seleccion","color":"#5C4033","force":"Medium","wrapper":"مزيج بلاسنسيا","vitolas":["Robusto","Toro"],"story":"صُنعت لميتشل أورشانت صاحب متجر «سي غارز» اللندنيّ. حلقة متجر على سيجار علامة: عادة إنجليزية."}]'),

-- ── Cornelius & Anthony ──────────────────────────────────
('Cornelius & Anthony', 'nicaragua', '2015 — famille Bailey, Virginie',
 'La Zona, Estelí ; et El Titan de Bronze, Miami',

 'Cornelius & Anthony vient d''une famille qui cultive du tabac en Virginie depuis plus de cent cinquante ans. Steven Bailey a lancé la marque en 2015 ; le premier cigare, le Cornelius, est sorti en 2016. Le nom joint le prénom de son arrière-arrière-grand-père — celui qui plantait et travaillait au chemin de fer — et son propre second prénom.

La maison est une filiale de S&M Brands, la société familiale de Keysville, en Virginie. Le détail compte pour cet atlas : S&M Brands fabrique des cigarettes et de petits cigares de machine, et rien de cela n''entre ici. Cornelius & Anthony est l''autre versant de la maison, celui du roulage à la main, et c''est celui-là seul que l''atlas retient.

Deux ateliers font les cigares, et aucun n''appartient à la famille. La plus grande part sort de La Zona, la fabrique d''Erik Espinosa à Estelí. Le Cornelius, lui — la ligne qui porte le prénom de l''ancêtre — est roulé à Miami, chez El Titan de Bronze. Les deux ont leur fiche dans cet atlas.

Que la ligne la plus chargée de sens soit celle qu''on fait rouler dans la Petite Havane plutôt qu''à Estelí n''est pas un hasard : El Titan de Bronze travaille en petites séries, à la commande, et c''est ce qu''il fallait pour celle-là.',

 '[{"name":"Cornelius","color":"#6B4226","force":"Medium-Full","wrapper":"Assemblage El Titan de Bronze","vitolas":["Robusto","Toro","Corona Gorda"],"story":"La première ligne, sortie en 2016, et la seule roulée à Miami. Elle porte le prénom de l''arrière-arrière-grand-père qui a commencé le tabac dans la famille."},{"name":"Daddy Mac","color":"#8B5A2B","force":"Medium","wrapper":"Assemblage nicaraguayen, chez La Zona","vitolas":["Robusto","Toro","Torpedo"],"story":"Le surnom d''un aïeul, sur un cigare fait à Estelí. C''est la ligne d''entrée de la maison, celle que l''on trouve le plus facilement."},{"name":"Aerial","color":"#4A5D3A","force":"Medium-Full","wrapper":"Assemblage nicaraguayen, chez La Zona","vitolas":["Robusto","Toro"],"story":"Sortie en 2017, roulée à La Zona. Le nom vient des câbles aériens que la famille tendait autrefois pour sécher la feuille."}]',

 'Cornelius & Anthony comes from a family that has grown tobacco in Virginia for more than a hundred and fifty years. Steven Bailey launched the brand in 2015; the first cigar, Cornelius, came out in 2016. The name joins his great-great-grandfather''s first name — the man who planted and worked on the railroad — with his own middle name.

The house is a subsidiary of S&M Brands, the family company of Keysville, Virginia. The detail matters to this atlas: S&M Brands makes cigarettes and small machine-made cigars, and none of that belongs here. Cornelius & Anthony is the house''s other side, the hand-rolled one, and that is the only side the atlas holds.

Two workshops make the cigars, and neither belongs to the family. The larger share comes out of La Zona, Erik Espinosa''s factory in Estelí. Cornelius itself — the line carrying the ancestor''s name — is rolled in Miami, at El Titan de Bronze. Both have their entry in this atlas.

That the line carrying the most meaning should be the one rolled in Little Havana rather than in Estelí is no accident: El Titan de Bronze works in small runs, to order, and that is what this one needed.',

 'Cornelius & Anthony viene de una familia que cultiva tabaco en Virginia desde hace más de ciento cincuenta años. Steven Bailey lanzó la marca en 2015; el primer puro, el Cornelius, salió en 2016. El nombre une el de su tatarabuelo —el que plantaba y trabajaba en el ferrocarril— con su propio segundo nombre.

La casa es filial de S&M Brands, la sociedad familiar de Keysville, en Virginia. El detalle importa para este atlas: S&M Brands fabrica cigarrillos y puritos de máquina, y nada de eso entra aquí. Cornelius & Anthony es la otra vertiente de la casa, la del liado a mano, y es la única que el atlas recoge.

Dos talleres hacen los puros, y ninguno pertenece a la familia. La mayor parte sale de La Zona, la fábrica de Erik Espinosa en Estelí. El Cornelius —la línea que lleva el nombre del antepasado— se lía en Miami, en El Titan de Bronze. Ambos tienen su ficha en este atlas.

Que la línea más cargada de sentido sea la que se lía en la Pequeña Habana y no en Estelí no es casual: El Titan de Bronze trabaja en series cortas, por encargo, y eso es lo que hacía falta para esta.',

 'Cornelius & Anthony stammt aus einer Familie, die seit mehr als hundertfünfzig Jahren in Virginia Tabak anbaut. Steven Bailey brachte die Marke 2015 auf den Weg; die erste Zigarre, Cornelius, erschien 2016. Der Name verbindet den Vornamen seines Ururgrossvaters — jenes Mannes, der pflanzte und bei der Eisenbahn arbeitete — mit seinem eigenen zweiten Vornamen.

Das Haus ist eine Tochter von S&M Brands, der Familiengesellschaft aus Keysville in Virginia. Diese Einzelheit zählt für den Atlas: S&M Brands stellt Zigaretten und kleine Maschinenzigarren her, und nichts davon gehört hierher. Cornelius & Anthony ist die andere Seite des Hauses, die handgerollte, und nur diese führt der Atlas.

Zwei Werkstätten machen die Zigarren, und keine gehört der Familie. Der grössere Teil kommt aus La Zona, Erik Espinosas Fabrik in Estelí. Cornelius selbst — die Linie mit dem Namen des Vorfahren — wird in Miami gerollt, bei El Titan de Bronze. Beide haben in diesem Atlas ihren Eintrag.

Dass ausgerechnet die bedeutungsvollste Linie in Little Havana und nicht in Estelí gerollt wird, ist kein Zufall: El Titan de Bronze arbeitet in kleinen Serien auf Bestellung, und genau das brauchte diese Linie.',

 'Cornelius & Anthony 出自一个在弗吉尼亚种烟一百五十多年的家族。Steven Bailey 于 2015 年创立品牌；第一支雪茄 Cornelius 在 2016 年问世。名字合了他高祖父的名——那位既种烟又在铁路上做工的人——和他自己的中间名。

这家公司是 S&M Brands 的子公司，后者是弗吉尼亚 Keysville 的家族企业。这一点对本图集很重要：S&M Brands 生产香烟和机制小雪茄，这些一概不入本图集。Cornelius & Anthony 是这个家族的另一面，手工卷制的那一面，也是图集唯一收录的那一面。

雪茄由两间作坊制作，都不属于这个家族。大部分出自 Erik Espinosa 在埃斯特利的 La Zona 工厂。而 Cornelius 这条以先祖之名命名的线，则在迈阿密的 El Titan de Bronze 卷制。两者在本图集中都有条目。

意义最重的一条线偏偏卷于小哈瓦那而非埃斯特利，并非偶然：El Titan de Bronze 按订单做小批量，这正是这条线所需要的。',

 'تنحدر «كورنيليوس آند أنتوني» من عائلة تزرع التبغ في فرجينيا منذ أكثر من مئة وخمسين سنة. أطلق ستيفن بيلي العلامة عام 2015، وخرج أوّل سيجار — «كورنيليوس» — عام 2016. والاسم يجمع اسم جدّ جدّه، ذاك الذي كان يزرع ويعمل في السكك الحديدية، إلى اسمه الأوسط.

والدار فرعٌ من «إس آند إم براندز»، شركة العائلة في كيزفيل بفرجينيا. والتفصيل مهمّ لهذا الأطلس: فـ«إس آند إم براندز» تصنع السجائر والسيجار الصغير بالآلة، ولا شيء من ذلك يدخل هنا. أمّا «كورنيليوس آند أنتوني» فهي الوجه الآخر للدار، وجه اللفّ باليد، وهو وحده ما يضمّه الأطلس.

ورشتان تصنعان السيجار، ولا واحدة منهما ملك العائلة. الحصّة الأكبر تخرج من «لا زونا»، مصنع إريك إسبينوزا في إستيلي. أمّا «كورنيليوس» نفسه — الخطّ الحامل لاسم الجدّ — فيُلَفّ في ميامي عند «إل تيتان دي برونسي». وللاثنين بطاقتاهما في هذا الأطلس.

وليس من قبيل الصدفة أن يكون الخطّ الأثقل معنًى هو الذي يُلَفّ في هافانا الصغيرة لا في إستيلي: فـ«إل تيتان دي برونسي» يعمل بدفعات صغيرة وعلى الطلب، وهذا تحديدًا ما احتاجه هذا الخطّ.',

 '[{"name":"Cornelius","color":"#6B4226","force":"Medium-Full","wrapper":"El Titan de Bronze blend","vitolas":["Robusto","Toro","Corona Gorda"],"story":"The first line, out in 2016, and the only one rolled in Miami. It carries the first name of the great-great-grandfather who began the family in tobacco."},{"name":"Daddy Mac","color":"#8B5A2B","force":"Medium","wrapper":"Nicaraguan blend, at La Zona","vitolas":["Robusto","Toro","Torpedo"],"story":"A forebear''s nickname, on a cigar made in Estelí. It is the house''s entry line, the one most easily found."},{"name":"Aerial","color":"#4A5D3A","force":"Medium-Full","wrapper":"Nicaraguan blend, at La Zona","vitolas":["Robusto","Toro"],"story":"Out in 2017, rolled at La Zona. The name comes from the overhead wires the family once strung to cure the leaf."}]',

 '[{"name":"Cornelius","color":"#6B4226","force":"Medium-Full","wrapper":"Ligada El Titan de Bronze","vitolas":["Robusto","Toro","Corona Gorda"],"story":"La primera línea, salida en 2016, y la única liada en Miami. Lleva el nombre del tatarabuelo que inició a la familia en el tabaco."},{"name":"Daddy Mac","color":"#8B5A2B","force":"Medium","wrapper":"Ligada nicaragüense, en La Zona","vitolas":["Robusto","Toro","Torpedo"],"story":"El apodo de un antepasado, sobre un puro hecho en Estelí. Es la línea de entrada de la casa, la más fácil de encontrar."},{"name":"Aerial","color":"#4A5D3A","force":"Medium-Full","wrapper":"Ligada nicaragüense, en La Zona","vitolas":["Robusto","Toro"],"story":"Salida en 2017, liada en La Zona. El nombre viene de los cables aéreos que la familia tendía antaño para secar la hoja."}]',

 '[{"name":"Cornelius","color":"#6B4226","force":"Medium-Full","wrapper":"El-Titan-de-Bronze-Mischung","vitolas":["Robusto","Toro","Corona Gorda"],"story":"Die erste Linie, 2016 erschienen, und die einzige, die in Miami gerollt wird. Sie trägt den Vornamen des Ururgrossvaters, mit dem der Tabak in die Familie kam."},{"name":"Daddy Mac","color":"#8B5A2B","force":"Medium","wrapper":"Nicaraguanische Mischung, bei La Zona","vitolas":["Robusto","Toro","Torpedo"],"story":"Der Spitzname eines Vorfahren, auf einer in Estelí gemachten Zigarre. Es ist die Einstiegslinie des Hauses, die am leichtesten zu finden ist."},{"name":"Aerial","color":"#4A5D3A","force":"Medium-Full","wrapper":"Nicaraguanische Mischung, bei La Zona","vitolas":["Robusto","Toro"],"story":"2017 erschienen, bei La Zona gerollt. Der Name stammt von den Luftdrähten, die die Familie einst zum Trocknen des Blattes spannte."}]',

 '[{"name":"Cornelius","color":"#6B4226","force":"Medium-Full","wrapper":"El Titan de Bronze 配方","vitolas":["Robusto","Toro","Corona Gorda"],"story":"第一条线，2016 年问世，也是唯一在迈阿密卷制的一条。它取自那位把家族带进烟草行当的高祖父之名。"},{"name":"Daddy Mac","color":"#8B5A2B","force":"Medium","wrapper":"尼加拉瓜配方，产自 La Zona","vitolas":["Robusto","Toro","Torpedo"],"story":"一位先辈的绰号，用在埃斯特利做的雪茄上。这是这家的入门线，也最容易买到。"},{"name":"Aerial","color":"#4A5D3A","force":"Medium-Full","wrapper":"尼加拉瓜配方，产自 La Zona","vitolas":["Robusto","Toro"],"story":"2017 年问世，在 La Zona 卷制。名字来自家族当年为晾叶架设的空中铁丝。"}]',

 '[{"name":"Cornelius","color":"#6B4226","force":"Medium-Full","wrapper":"مزيج إل تيتان دي برونسي","vitolas":["Robusto","Toro","Corona Gorda"],"story":"الخطّ الأوّل، صدر عام 2016، وهو الوحيد الذي يُلَفّ في ميامي. يحمل اسم جدّ الجدّ الذي أدخل التبغ إلى العائلة."},{"name":"Daddy Mac","color":"#8B5A2B","force":"Medium","wrapper":"مزيج نيكاراغويّ، في لا زونا","vitolas":["Robusto","Toro","Torpedo"],"story":"لقب أحد الأجداد، على سيجار مصنوع في إستيلي. وهو خطّ الدار الأيسر منالًا، وأسهلها وجودًا."},{"name":"Aerial","color":"#4A5D3A","force":"Medium-Full","wrapper":"مزيج نيكاراغويّ، في لا زونا","vitolas":["Robusto","Toro"],"story":"صدر عام 2017، ويُلَفّ في لا زونا. والاسم من الأسلاك المعلّقة التي كانت العائلة تمدّها قديمًا لتجفيف الورق."}]'),

-- ── 262 Cigars ───────────────────────────────────────────
('262 Cigars', 'nicaragua', '2010 — Clint Aaron, Virginie',
 'Tabacalera Carreras et TacaNicsa, Estelí',

 'Le nom est une date : février 1962, le mois où l''embargo américain sur Cuba a été signé. Clint Aaron travaillait ses assemblages depuis 2008 et avait d''abord appelé sa maison Revolution Cigars ; un conflit de marque l''a obligé à en changer, et il a choisi le chiffre plutôt que le mot.

Le premier cigare, le Paradigm, est sorti en 2010. L''Ideology a suivi.

262 n''a jamais eu d''usine. Ses cigares sont sortis de deux ateliers d''Estelí : la Tabacalera Carreras, de Craig Cunningham, et la TacaNicsa, d''Eradio Pichardo. Choisir l''atelier selon l''assemblage est devenu courant chez les marques américaines sans manufacture ; l''atlas le note à chaque fois, parce que c''est ce qui explique qu''un même nom puisse changer de main d''une ligne à l''autre.

Clint Aaron a vendu la maison en juin 2019 à Madison Money, qui l''a rachetée avec son père. Le père s''est depuis retiré, et Gabriel Seamen est devenu associé.',

 '[{"name":"Paradigm","color":"#5C4033","force":"Medium-Full","wrapper":"Assemblage nicaraguayen","vitolas":["Robusto","Toro","Corona"],"story":"Le premier cigare de la maison, sorti en 2010, cinq ans avant que la plupart des marques boutique d''aujourd''hui existent."},{"name":"Ideology","color":"#3A2E26","force":"Full","wrapper":"Assemblage nicaraguayen","vitolas":["Robusto","Toro"],"story":"Le versant corsé, venu après le Paradigm. Le nom continue la série des mots abstraits que la maison a choisis contre l''usage du métier."},{"name":"Revere","color":"#7A3B2E","force":"Medium-Full","wrapper":"Assemblage nicaraguayen","vitolas":["Lonsdale","Toro","Box-pressed Toro"],"story":"Nommé d''après Paul Revere. La maison est américaine de nom et d''imaginaire, nicaraguayenne de fabrication — l''écart est assumé."}]',

 'The name is a date: February 1962, the month the American embargo on Cuba was signed. Clint Aaron had been working on blends since 2008 and had first called his house Revolution Cigars; a trademark conflict forced a change, and he chose the number over the word.

The first cigar, Paradigm, came out in 2010. Ideology followed.

262 has never had a factory. Its cigars have come out of two Estelí workshops: Tabacalera Carreras, Craig Cunningham''s, and TacaNicsa, Eradio Pichardo''s. Choosing the workshop to suit the blend has become common among American brands without a factory; the atlas notes it every time, because it explains how one name can change hands from line to line.

Clint Aaron sold the house in June 2019 to Madison Money, who bought it with his father. The father has since stepped back, and Gabriel Seamen has become a partner.',

 'El nombre es una fecha: febrero de 1962, el mes en que se firmó el embargo estadounidense sobre Cuba. Clint Aaron trabajaba sus ligadas desde 2008 y había llamado a su casa Revolution Cigars; un conflicto de marca le obligó a cambiar, y eligió la cifra en lugar de la palabra.

El primer puro, el Paradigm, salió en 2010. El Ideology vino después.

262 nunca ha tenido fábrica. Sus puros han salido de dos talleres de Estelí: la Tabacalera Carreras, de Craig Cunningham, y la TacaNicsa, de Eradio Pichardo. Elegir el taller según la ligada se ha vuelto corriente entre las marcas estadounidenses sin manufactura; el atlas lo anota siempre, porque explica que un mismo nombre pueda cambiar de mano de una línea a otra.

Clint Aaron vendió la casa en junio de 2019 a Madison Money, que la compró con su padre. El padre se retiró después, y Gabriel Seamen se ha hecho socio.',

 'Der Name ist ein Datum: Februar 1962, der Monat, in dem das amerikanische Embargo gegen Kuba unterzeichnet wurde. Clint Aaron arbeitete seit 2008 an seinen Mischungen und hatte sein Haus zuerst Revolution Cigars genannt; ein Markenstreit zwang zur Änderung, und er wählte die Zahl statt des Wortes.

Die erste Zigarre, Paradigm, erschien 2010. Ideology folgte.

262 hatte nie eine Fabrik. Die Zigarren kamen aus zwei Werkstätten in Estelí: der Tabacalera Carreras von Craig Cunningham und der TacaNicsa von Eradio Pichardo. Die Werkstatt nach der Mischung zu wählen, ist bei amerikanischen Marken ohne eigene Fertigung üblich geworden; der Atlas vermerkt es jedes Mal, denn es erklärt, warum ein und derselbe Name von Linie zu Linie die Hand wechseln kann.

Clint Aaron verkaufte das Haus im Juni 2019 an Madison Money, der es mit seinem Vater übernahm. Der Vater hat sich seither zurückgezogen, und Gabriel Seamen ist Teilhaber geworden.',

 '这个名字是一个日期：1962 年 2 月，美国对古巴禁运签署的那个月。Clint Aaron 自 2008 年起调配方，最初把公司叫作 Revolution Cigars；商标冲突迫使他改名，他选了数字而非词语。

第一支雪茄 Paradigm 于 2010 年问世，Ideology 随后跟上。

262 从未有过工厂。它的雪茄出自埃斯特利的两间作坊：Craig Cunningham 的 Tabacalera Carreras，和 Eradio Pichardo 的 TacaNicsa。按配方选作坊，在没有自有工厂的美国品牌中已成常态；本图集每次都记下来，因为这解释了同一个名字为何会在不同产品线间换手。

2019 年 6 月，Clint Aaron 把公司卖给 Madison Money，后者与其父亲一同买下。父亲此后退出，Gabriel Seamen 成为合伙人。',

 'الاسم تاريخ: فبراير 1962، الشهر الذي وُقّع فيه الحظر الأمريكيّ على كوبا. كان كلينت آرون يشتغل على مزائجه منذ 2008، وسمّى داره أوّلًا «ريفوليوشن سيغارز»؛ ثم اضطرّه نزاع على العلامة إلى التغيير، فاختار الرقم بدل الكلمة.

خرج أوّل سيجار، «باراديم»، عام 2010، وتبعه «آيديولوجي».

ولم يكن لـ262 مصنع قطّ. خرج سيجارها من ورشتين في إستيلي: «تاباكاليرا كاريراس» لكريغ كنينغهام، و«تاكانيكسا» لإراديو بيتشاردو. وقد صار اختيار الورشة بحسب المزيج أمرًا شائعًا عند العلامات الأمريكية بلا مصنع؛ والأطلس يسجّله في كلّ مرّة، لأنّه يفسّر كيف يتنقّل الاسم الواحد بين يدٍ ويد من خطّ إلى خطّ.

باع كلينت آرون الدار في يونيو 2019 إلى ماديسون موني، الذي اشتراها مع والده. ثم انسحب الوالد، وصار غابرييل سيمن شريكًا.',

 '[{"name":"Paradigm","color":"#5C4033","force":"Medium-Full","wrapper":"Nicaraguan blend","vitolas":["Robusto","Toro","Corona"],"story":"The house''s first cigar, out in 2010, five years before most of today''s boutique brands existed."},{"name":"Ideology","color":"#3A2E26","force":"Full","wrapper":"Nicaraguan blend","vitolas":["Robusto","Toro"],"story":"The fuller side, following Paradigm. The name continues the series of abstract words the house chose against the trade''s custom."},{"name":"Revere","color":"#7A3B2E","force":"Medium-Full","wrapper":"Nicaraguan blend","vitolas":["Lonsdale","Toro","Box-pressed Toro"],"story":"Named after Paul Revere. The house is American in name and imagery, Nicaraguan in manufacture — and does not hide the gap."}]',

 '[{"name":"Paradigm","color":"#5C4033","force":"Medium-Full","wrapper":"Ligada nicaragüense","vitolas":["Robusto","Toro","Corona"],"story":"El primer puro de la casa, salido en 2010, cinco años antes de que existieran la mayoría de las marcas boutique de hoy."},{"name":"Ideology","color":"#3A2E26","force":"Full","wrapper":"Ligada nicaragüense","vitolas":["Robusto","Toro"],"story":"La vertiente fuerte, llegada tras el Paradigm. El nombre continúa la serie de palabras abstractas que la casa eligió contra el uso del oficio."},{"name":"Revere","color":"#7A3B2E","force":"Medium-Full","wrapper":"Ligada nicaragüense","vitolas":["Lonsdale","Toro","Toro prensado"],"story":"Llamado así por Paul Revere. La casa es estadounidense de nombre e imaginario, nicaragüense de fabricación, y no oculta la distancia."}]',

 '[{"name":"Paradigm","color":"#5C4033","force":"Medium-Full","wrapper":"Nicaraguanische Mischung","vitolas":["Robusto","Toro","Corona"],"story":"Die erste Zigarre des Hauses, 2010 erschienen, fünf Jahre bevor die meisten heutigen Boutiquemarken bestanden."},{"name":"Ideology","color":"#3A2E26","force":"Full","wrapper":"Nicaraguanische Mischung","vitolas":["Robusto","Toro"],"story":"Die kräftigere Seite, nach dem Paradigm. Der Name setzt die Reihe abstrakter Wörter fort, die das Haus gegen den Brauch der Branche gewählt hat."},{"name":"Revere","color":"#7A3B2E","force":"Medium-Full","wrapper":"Nicaraguanische Mischung","vitolas":["Lonsdale","Toro","Box-pressed Toro"],"story":"Nach Paul Revere benannt. Das Haus ist amerikanisch im Namen und in der Bildwelt, nicaraguanisch in der Fertigung — und verbirgt den Abstand nicht."}]',

 '[{"name":"Paradigm","color":"#5C4033","force":"Medium-Full","wrapper":"尼加拉瓜配方","vitolas":["Robusto","Toro","Corona"],"story":"这家的第一支雪茄，2010 年问世，比今天多数精品品牌早了五年。"},{"name":"Ideology","color":"#3A2E26","force":"Full","wrapper":"尼加拉瓜配方","vitolas":["Robusto","Toro"],"story":"厚重的一面，继 Paradigm 之后。名字延续了这家逆行业惯例而取的一串抽象词。"},{"name":"Revere","color":"#7A3B2E","force":"Medium-Full","wrapper":"尼加拉瓜配方","vitolas":["Lonsdale","Toro","Box-pressed Toro"],"story":"取名自 Paul Revere。这家在名字与意象上是美国的，在制造上是尼加拉瓜的——它并不掩饰这段距离。"}]',

 '[{"name":"Paradigm","color":"#5C4033","force":"Medium-Full","wrapper":"مزيج نيكاراغويّ","vitolas":["Robusto","Toro","Corona"],"story":"أوّل سيجار للدار، صدر عام 2010، أي قبل خمس سنوات من ظهور معظم علامات البوتيك اليوم."},{"name":"Ideology","color":"#3A2E26","force":"Full","wrapper":"مزيج نيكاراغويّ","vitolas":["Robusto","Toro"],"story":"الوجه الأقوى، جاء بعد «باراديم». والاسم يواصل سلسلة الكلمات المجرّدة التي اختارتها الدار خلافًا لعُرف المهنة."},{"name":"Revere","color":"#7A3B2E","force":"Medium-Full","wrapper":"مزيج نيكاراغويّ","vitolas":["Lonsdale","Toro","Box-pressed Toro"],"story":"سُمّي على اسم بول ريفير. الدار أمريكية في الاسم والمخيال، نيكاراغوية في الصناعة — وهي لا تخفي المسافة."}]'),

-- ── Emilio Cigars ────────────────────────────────────────
('Emilio Cigars', 'nicaragua', '2010 — Gary Griffith, Delaware',
 'A.J. Fernández, My Father et Oveja Negra, Estelí',

 'Emilio est né derrière un comptoir. Gary Griffith tenait les boutiques Delaware Cigars quand il a lancé sa marque, en 2010. Le passage du détaillant au propriétaire de marque est un chemin fréquent aux États-Unis, et cet atlas en compte plusieurs — Kristoff en est un autre.

Il n''a jamais eu d''usine, et il a changé d''atelier souvent. L''AF1 puis l''AF2 portent dans leur nom celui de leur fabricant : A.J. Fernández. Le Grimalkin, en 2011, était un puro nicaraguayen roulé chez My Father — grimalkin est un vieux mot anglais pour une chatte grise. Le nom et l''étiquette ont été assez critiqués pour que la maison les retire en 2012 et rebaptise l''assemblage Mousa, dans une série appelée La Musa.

Le Grimalkin est revenu depuis, sous Scott Zucca, qui possède désormais la marque : il se fait à la Fábrica Oveja Negra, l''atelier de Black Label Trading Co. à Estelí.

Trois fabriques, trois familles, un seul nom sur la bague. A.J. Fernández, My Father et Black Label Trading ont chacun leur fiche dans cet atlas — c''est la manière la plus nette de montrer ce qu''est une marque sans usine.',

 '[{"name":"AF1 et AF2","color":"#6B4226","force":"Medium-Full","wrapper":"Assemblages A.J. Fernández","vitolas":["Robusto","Toro","Torpedo"],"story":"Les deux premières lignes, sorties en 2011. Les initiales du fabricant sont dans le nom du cigare : peu de marques nomment leur rouleur aussi ouvertement."},{"name":"Grimalkin","color":"#5A5A5A","force":"Medium-Full","wrapper":"Assemblage Oveja Negra","vitolas":["Robusto","Toro"],"story":"Puro nicaraguayen de 2011, d''abord roulé chez My Father, retiré en 2012 sous le nom de Mousa, puis revenu — et fait depuis à la Fábrica Oveja Negra."},{"name":"La Musa","color":"#8B7355","force":"Medium","wrapper":"Assemblage nicaraguayen","vitolas":["Robusto","Toro"],"story":"La série où l''assemblage du Grimalkin a été replacé sous le nom de Mousa, après le retrait de 2012."}]',

 'Emilio was born behind a counter. Gary Griffith ran the Delaware Cigars shops when he launched his brand in 2010. Moving from retailer to brand owner is a common path in the United States, and this atlas holds several — Kristoff is another.

He never had a factory, and he changed workshops often. AF1 and then AF2 carry their maker''s name inside their own: A.J. Fernández. Grimalkin, in 2011, was a Nicaraguan puro rolled at My Father — grimalkin is an old English word for a grey she-cat. The name and the label drew enough criticism that the house withdrew them in 2012 and renamed the blend Mousa, in a series called La Musa.

Grimalkin has since returned, under Scott Zucca, who now owns the brand: it is made at Fábrica Oveja Negra, Black Label Trading Co.''s workshop in Estelí.

Three factories, three families, one name on the band. A.J. Fernández, My Father and Black Label Trading each have their entry in this atlas — which is the clearest way to show what a brand without a factory actually is.',

 'Emilio nació detrás de un mostrador. Gary Griffith llevaba las tiendas Delaware Cigars cuando lanzó su marca, en 2010. Pasar de minorista a propietario de marca es un camino frecuente en Estados Unidos, y este atlas recoge varios: Kristoff es otro.

Nunca tuvo fábrica, y cambió de taller a menudo. El AF1 y luego el AF2 llevan en su nombre el de su fabricante: A.J. Fernández. El Grimalkin, en 2011, era un puro nicaragüense liado en My Father; grimalkin es una vieja palabra inglesa para una gata gris. El nombre y la etiqueta recibieron bastantes críticas como para que la casa los retirara en 2012 y rebautizara la ligada como Mousa, en una serie llamada La Musa.

El Grimalkin ha vuelto desde entonces, bajo Scott Zucca, que hoy posee la marca: se hace en la Fábrica Oveja Negra, el taller de Black Label Trading Co. en Estelí.

Tres fábricas, tres familias, un solo nombre en la vitola. A.J. Fernández, My Father y Black Label Trading tienen cada uno su ficha en este atlas: es la manera más clara de mostrar qué es una marca sin fábrica.',

 'Emilio entstand hinter einem Ladentisch. Gary Griffith führte die Geschäfte von Delaware Cigars, als er 2010 seine Marke gründete. Vom Händler zum Markeninhaber zu werden ist in den Vereinigten Staaten ein häufiger Weg, und dieser Atlas führt mehrere davon — Kristoff ist ein weiterer.

Eine eigene Fabrik hatte er nie, und die Werkstatt wechselte er oft. AF1 und dann AF2 tragen den Namen ihres Herstellers im eigenen: A.J. Fernández. Grimalkin war 2011 ein nicaraguanischer Puro, gerollt bei My Father — grimalkin ist ein altes englisches Wort für eine graue Katze. Name und Etikett wurden so stark kritisiert, dass das Haus sie 2012 zurückzog und die Mischung Mousa nannte, in einer Serie namens La Musa.

Grimalkin ist seither zurückgekehrt, unter Scott Zucca, dem die Marke heute gehört: Sie wird in der Fábrica Oveja Negra gefertigt, der Werkstatt von Black Label Trading Co. in Estelí.

Drei Fabriken, drei Familien, ein Name auf dem Ring. A.J. Fernández, My Father und Black Label Trading haben je ihren Eintrag in diesem Atlas — die klarste Art zu zeigen, was eine Marke ohne Fabrik tatsächlich ist.',

 'Emilio 诞生在柜台后面。Gary Griffith 经营 Delaware Cigars 门店，2010 年创办了自己的品牌。从零售商变成品牌主，在美国是一条常见的路，本图集收了好几例——Kristoff 是另一例。

他从未有过工厂，也常换作坊。AF1 与随后的 AF2，名字里就写着制造者：A.J. Fernández。2011 年的 Grimalkin 是一支尼加拉瓜纯产雪茄，由 My Father 卷制——grimalkin 是英语中指灰母猫的旧词。名字与标识招致的批评足够多，公司在 2012 年将其撤下，把配方改名为 Mousa，归入名为 La Musa 的系列。

此后 Grimalkin 回来了，归今日的品牌拥有者 Scott Zucca：它在埃斯特利的 Fábrica Oveja Negra 制作，那是 Black Label Trading Co. 的作坊。

三家工厂，三个家族，茄标上只有一个名字。A.J. Fernández、My Father 与 Black Label Trading 在本图集中各有条目——这是说明「没有工厂的品牌」究竟为何物最清楚的方式。',

 'وُلدت «إميليو» خلف طاولة بيع. كان غاري غريفيث يدير متاجر «ديلاوير سيغارز» حين أطلق علامته عام 2010. والانتقال من بائع تجزئة إلى صاحب علامة درب شائع في الولايات المتحدة، ويضمّ هذا الأطلس منه غير مثال — و«كريستوف» واحد منها.

لم يملك مصنعًا قطّ، وكثيرًا ما بدّل الورشة. فـ«AF1» ثم «AF2» يحملان في اسمهما اسم صانعهما: أ. ج. فرنانديز. أمّا «غريمالكن» عام 2011 فكان سيجارًا نيكاراغويًّا خالصًا يُلَفّ عند «ماي فاذر» — و«غريمالكن» لفظ إنجليزيّ قديم يعني القطّة الرمادية. وقد نال الاسم والملصق من النقد ما كفى لتسحبهما الدار عام 2012 وتعيد تسمية المزيج «موسا» ضمن سلسلة تُدعى «لا موسا».

ثم عاد «غريمالكن»، في عهد سكوت زوكا مالك العلامة اليوم: يُصنع في «فابريكا أوفيخا نيغرا»، ورشة «بلاك ليبل تريدنغ» في إستيلي.

ثلاثة مصانع، وثلاث عائلات، واسم واحد على الحلقة. ولكلٍّ من أ. ج. فرنانديز و«ماي فاذر» و«بلاك ليبل تريدنغ» بطاقته في هذا الأطلس — وهي أوضح طريقة لبيان ما تكونه علامةٌ بلا مصنع.',

 '[{"name":"AF1 and AF2","color":"#6B4226","force":"Medium-Full","wrapper":"A.J. Fernández blends","vitolas":["Robusto","Toro","Torpedo"],"story":"The first two lines, out in 2011. The maker''s initials are in the cigar''s own name: few brands name their roller that openly."},{"name":"Grimalkin","color":"#5A5A5A","force":"Medium-Full","wrapper":"Oveja Negra blend","vitolas":["Robusto","Toro"],"story":"A 2011 Nicaraguan puro, first rolled at My Father, withdrawn in 2012 under the name Mousa, then brought back — and made since at Fábrica Oveja Negra."},{"name":"La Musa","color":"#8B7355","force":"Medium","wrapper":"Nicaraguan blend","vitolas":["Robusto","Toro"],"story":"The series where the Grimalkin blend was placed under the name Mousa, after the 2012 withdrawal."}]',

 '[{"name":"AF1 y AF2","color":"#6B4226","force":"Medium-Full","wrapper":"Ligadas A.J. Fernández","vitolas":["Robusto","Toro","Torpedo"],"story":"Las dos primeras líneas, salidas en 2011. Las iniciales del fabricante están en el nombre del puro: pocas marcas nombran a su liador tan abiertamente."},{"name":"Grimalkin","color":"#5A5A5A","force":"Medium-Full","wrapper":"Ligada Oveja Negra","vitolas":["Robusto","Toro"],"story":"Puro nicaragüense de 2011, liado primero en My Father, retirado en 2012 bajo el nombre de Mousa y devuelto después: se hace desde entonces en la Fábrica Oveja Negra."},{"name":"La Musa","color":"#8B7355","force":"Medium","wrapper":"Ligada nicaragüense","vitolas":["Robusto","Toro"],"story":"La serie donde la ligada del Grimalkin se colocó bajo el nombre de Mousa, tras la retirada de 2012."}]',

 '[{"name":"AF1 und AF2","color":"#6B4226","force":"Medium-Full","wrapper":"A.J.-Fernández-Mischungen","vitolas":["Robusto","Toro","Torpedo"],"story":"Die ersten beiden Linien, 2011 erschienen. Die Initialen des Herstellers stehen im Namen der Zigarre: wenige Marken nennen ihren Roller so offen."},{"name":"Grimalkin","color":"#5A5A5A","force":"Medium-Full","wrapper":"Oveja-Negra-Mischung","vitolas":["Robusto","Toro"],"story":"Ein nicaraguanischer Puro von 2011, zuerst bei My Father gerollt, 2012 unter dem Namen Mousa zurückgezogen, dann zurückgekehrt — und seither in der Fábrica Oveja Negra gefertigt."},{"name":"La Musa","color":"#8B7355","force":"Medium","wrapper":"Nicaraguanische Mischung","vitolas":["Robusto","Toro"],"story":"Die Serie, in der die Grimalkin-Mischung nach dem Rückzug von 2012 unter dem Namen Mousa geführt wurde."}]',

 '[{"name":"AF1 与 AF2","color":"#6B4226","force":"Medium-Full","wrapper":"A.J. Fernández 配方","vitolas":["Robusto","Toro","Torpedo"],"story":"最早的两条线，2011 年问世。制造者的缩写就写在雪茄名字里：这样坦白地点出卷制者的品牌并不多。"},{"name":"Grimalkin","color":"#5A5A5A","force":"Medium-Full","wrapper":"Oveja Negra 配方","vitolas":["Robusto","Toro"],"story":"2011 年的尼加拉瓜纯产雪茄，最初由 My Father 卷制，2012 年以 Mousa 之名撤下，后又回归——此后在 Fábrica Oveja Negra 制作。"},{"name":"La Musa","color":"#8B7355","force":"Medium","wrapper":"尼加拉瓜配方","vitolas":["Robusto","Toro"],"story":"2012 年撤下之后，Grimalkin 的配方被以 Mousa 之名安置在这个系列里。"}]',

 '[{"name":"AF1 و AF2","color":"#6B4226","force":"Medium-Full","wrapper":"مزائج أ. ج. فرنانديز","vitolas":["Robusto","Toro","Torpedo"],"story":"أوّل خطّين، صدرا عام 2011. وأحرف الصانع الأولى في اسم السيجار نفسه: قلّما تُسمّي علامةٌ لافَّها بهذا الوضوح."},{"name":"Grimalkin","color":"#5A5A5A","force":"Medium-Full","wrapper":"مزيج أوفيخا نيغرا","vitolas":["Robusto","Toro"],"story":"سيجار نيكاراغويّ خالص من 2011، لُفّ أوّلًا عند «ماي فاذر»، وسُحب عام 2012 باسم «موسا»، ثم عاد — ويُصنع منذئذ في «فابريكا أوفيخا نيغرا»."},{"name":"La Musa","color":"#8B7355","force":"Medium","wrapper":"مزيج نيكاراغويّ","vitolas":["Robusto","Toro"],"story":"السلسلة التي وُضع فيها مزيج «غريمالكن» باسم «موسا» بعد سحب 2012."}]'),

-- ── Nomad ────────────────────────────────────────────────
('Nomad', 'nicaragua', '2012 — Fred Rewey ; vendue en 2018',
 'Tabacalera L&V (Rép. dom.) ; A.J. Fernández et Oveja Negra (Nicaragua)',

 'Le nom était un programme. Fred Rewey a lancé Nomad en 2012 sans posséder un mètre carré de fabrique, et il a fait ce que le mot annonce : il a changé d''atelier et de pays au gré des assemblages.

Les premiers cigares sont dominicains, roulés à la Tabacalera L&V. Dès 2013 il passe au Nicaragua avec l''Estelí Lot 1386, puis le S-307 — un box-pressé à cape sumatra d''Équateur — assemblé et roulé chez A.J. Fernández. La Fábrica Oveja Negra, celle de Black Label Trading, s''ajoute ensuite. Le catalogue a compté seize assemblages répartis entre les deux pays.

L''atlas classe cette fiche au Nicaragua parce que c''est de là que sort l''essentiel du catalogue. Le recensement de l''atlas la donnait pour dominicaine, sur la foi des débuts : la part dominicaine est réelle, mais elle n''est plus la principale, et la fiche écrit les deux.

En septembre 2018, Rewey a vendu la maison à Chris Kelly et Kyle Hoover, les deux propriétaires d''Ezra Zion. Nomad paraît depuis sous leur enseigne.',

 '[{"name":"S-307","color":"#4A3728","force":"Medium-Full","wrapper":"Sumatra d''Équateur","vitolas":["Robusto","Toro","Torpedo"],"story":"Le premier cigare nicaraguayen de la maison en production régulière, box-pressé, assemblé et roulé chez A.J. Fernández."},{"name":"Estelí Lot 1386","color":"#6B4226","force":"Full","wrapper":"Assemblage nicaraguayen","vitolas":["Robusto","Toro"],"story":"Le premier travail de Rewey au Nicaragua, au printemps 2013 — le numéro désigne un lot de tabac, pas un millésime."},{"name":"Connecticut Fuerte","color":"#C9A96E","force":"Medium","wrapper":"Connecticut","vitolas":["Robusto","Toro","Corona"],"story":"Le versant dominicain des débuts, roulé à la Tabacalera L&V. Une cape claire sur une tripe qui ne l''est pas — d''où le nom."}]',

 'The name was a plan. Fred Rewey launched Nomad in 2012 without owning a square metre of factory, and he did what the word announces: he changed workshop and country as the blends required.

The first cigars are Dominican, rolled at Tabacalera L&V. By 2013 he had moved to Nicaragua with Estelí Lot 1386, then the S-307 — a box-pressed cigar under an Ecuadorian Sumatra wrapper — blended and rolled at A.J. Fernández. Fábrica Oveja Negra, Black Label Trading''s workshop, was added later. The catalogue ran to sixteen blends spread across the two countries.

The atlas files this entry under Nicaragua because that is where most of the catalogue comes from. The atlas''s own census had it Dominican, on the strength of the beginnings: the Dominican share is real, but it is no longer the main one, and the entry writes both.

In September 2018 Rewey sold the house to Chris Kelly and Kyle Hoover, the two owners of Ezra Zion. Nomad has appeared under their banner since.',

 'El nombre era un programa. Fred Rewey lanzó Nomad en 2012 sin poseer un metro cuadrado de fábrica, e hizo lo que la palabra anuncia: cambió de taller y de país según las ligadas.

Los primeros puros son dominicanos, liados en la Tabacalera L&V. Ya en 2013 pasa a Nicaragua con el Estelí Lot 1386, y luego el S-307 —un prensado con capa sumatra de Ecuador— ligado y liado en A.J. Fernández. La Fábrica Oveja Negra, la de Black Label Trading, se añade después. El catálogo llegó a dieciséis ligadas repartidas entre los dos países.

El atlas clasifica esta ficha en Nicaragua porque de allí sale lo esencial del catálogo. El censo del propio atlas la daba por dominicana, fiándose de los inicios: la parte dominicana es real, pero ya no es la principal, y la ficha escribe ambas.

En septiembre de 2018 Rewey vendió la casa a Chris Kelly y Kyle Hoover, los dos propietarios de Ezra Zion. Nomad aparece desde entonces bajo su enseña.',

 'Der Name war ein Programm. Fred Rewey gründete Nomad 2012, ohne einen Quadratmeter Fabrik zu besitzen, und tat, was das Wort ankündigt: Er wechselte Werkstatt und Land, wie es die Mischungen verlangten.

Die ersten Zigarren sind dominikanisch, gerollt in der Tabacalera L&V. Schon 2013 geht er nach Nicaragua mit dem Estelí Lot 1386, dann dem S-307 — einer box-pressed Zigarre unter ecuadorianischem Sumatra-Deckblatt —, gemischt und gerollt bei A.J. Fernández. Die Fábrica Oveja Negra, die von Black Label Trading, kam später dazu. Der Katalog umfasste sechzehn Mischungen, verteilt auf beide Länder.

Der Atlas führt diesen Eintrag unter Nicaragua, weil von dort der grösste Teil des Katalogs kommt. Die eigene Bestandsaufnahme des Atlas hielt ihn für dominikanisch, gestützt auf die Anfänge: Der dominikanische Anteil ist wirklich, aber nicht mehr der grössere, und der Eintrag schreibt beides.

Im September 2018 verkaufte Rewey das Haus an Chris Kelly und Kyle Hoover, die beiden Inhaber von Ezra Zion. Nomad erscheint seither unter deren Zeichen.',

 '名字本身就是纲领。Fred Rewey 于 2012 年创办 Nomad，名下没有一平方米工厂，而他做的正是这个词所宣告的：随配方更换作坊、更换国家。

最早的雪茄是多米尼加的，在 Tabacalera L&V 卷制。2013 年他便转向尼加拉瓜，推出 Estelí Lot 1386，随后是 S-307——一支厄瓜多尔苏门答腊茄衣的方压雪茄，由 A.J. Fernández 调配并卷制。Black Label Trading 的 Fábrica Oveja Negra 后来加入。整个目录曾有十六款配方，分布在两个国家。

本图集把这一条目归入尼加拉瓜，因为目录的大部分出自那里。图集自己的清点曾据其起步把它算作多米尼加：多米尼加的那一部分确实存在，但已不是主要部分，本条目两者都写。

2018 年 9 月，Rewey 把公司卖给 Ezra Zion 的两位所有者 Chris Kelly 与 Kyle Hoover。此后 Nomad 在他们的招牌下推出。',

 'كان الاسم برنامجًا. أطلق فريد ريوي «نوماد» عام 2012 دون أن يملك مترًا واحدًا من مصنع، وفعل ما يعلنه الاسم: بدّل الورشة والبلد بحسب ما تقتضيه المزائج.

أوّل سيجاره دومينيكيّ، لُفّ في «تاباكاليرا L&V». ومنذ 2013 انتقل إلى نيكاراغوا بـ«إستيلي لوت 1386»، ثم «S-307» — سيجار مكبوس بغلاف سومطرة إكوادوريّ — مُزج ولُفّ عند أ. ج. فرنانديز. ثم أُضيفت «فابريكا أوفيخا نيغرا»، ورشة «بلاك ليبل تريدنغ». وبلغ الكتالوج ستة عشر مزيجًا موزّعة على البلدين.

ويصنّف الأطلس هذه البطاقة في نيكاراغوا لأنّ معظم الكتالوج يخرج من هناك. أمّا إحصاء الأطلس نفسه فقد عدّها دومينيكية استنادًا إلى البدايات: والحصّة الدومينيكية حقيقية، لكنّها لم تعد الأكبر، والبطاقة تكتب الاثنتين.

وفي سبتمبر 2018 باع ريوي الدار إلى كريس كيلي وكايل هوفر، مالكَي «عزرا صهيون». ومنذئذ تصدر «نوماد» تحت رايتهما.',

 '[{"name":"S-307","color":"#4A3728","force":"Medium-Full","wrapper":"Ecuadorian Sumatra","vitolas":["Robusto","Toro","Torpedo"],"story":"The house''s first Nicaraguan cigar in regular production, box-pressed, blended and rolled at A.J. Fernández."},{"name":"Estelí Lot 1386","color":"#6B4226","force":"Full","wrapper":"Nicaraguan blend","vitolas":["Robusto","Toro"],"story":"Rewey''s first work in Nicaragua, in spring 2013 — the number designates a lot of tobacco, not a vintage."},{"name":"Connecticut Fuerte","color":"#C9A96E","force":"Medium","wrapper":"Connecticut","vitolas":["Robusto","Toro","Corona"],"story":"The Dominican side of the early days, rolled at Tabacalera L&V. A pale wrapper over a filler that is not — hence the name."}]',

 '[{"name":"S-307","color":"#4A3728","force":"Medium-Full","wrapper":"Sumatra de Ecuador","vitolas":["Robusto","Toro","Torpedo"],"story":"El primer puro nicaragüense de la casa en producción regular, prensado, ligado y liado en A.J. Fernández."},{"name":"Estelí Lot 1386","color":"#6B4226","force":"Full","wrapper":"Ligada nicaragüense","vitolas":["Robusto","Toro"],"story":"El primer trabajo de Rewey en Nicaragua, en la primavera de 2013; el número designa un lote de tabaco, no una añada."},{"name":"Connecticut Fuerte","color":"#C9A96E","force":"Medium","wrapper":"Connecticut","vitolas":["Robusto","Toro","Corona"],"story":"La vertiente dominicana de los inicios, liada en la Tabacalera L&V. Una capa clara sobre una tripa que no lo es: de ahí el nombre."}]',

 '[{"name":"S-307","color":"#4A3728","force":"Medium-Full","wrapper":"Ecuadorianisches Sumatra","vitolas":["Robusto","Toro","Torpedo"],"story":"Die erste nicaraguanische Zigarre des Hauses in regulärer Fertigung, box-pressed, gemischt und gerollt bei A.J. Fernández."},{"name":"Estelí Lot 1386","color":"#6B4226","force":"Full","wrapper":"Nicaraguanische Mischung","vitolas":["Robusto","Toro"],"story":"Reweys erste Arbeit in Nicaragua, im Frühjahr 2013 — die Zahl bezeichnet ein Tabaklos, keinen Jahrgang."},{"name":"Connecticut Fuerte","color":"#C9A96E","force":"Medium","wrapper":"Connecticut","vitolas":["Robusto","Toro","Corona"],"story":"Die dominikanische Seite der Anfänge, gerollt in der Tabacalera L&V. Ein helles Deckblatt über einer Einlage, die es nicht ist — daher der Name."}]',

 '[{"name":"S-307","color":"#4A3728","force":"Medium-Full","wrapper":"厄瓜多尔苏门答腊","vitolas":["Robusto","Toro","Torpedo"],"story":"这家第一支常规生产的尼加拉瓜雪茄，方压，由 A.J. Fernández 调配并卷制。"},{"name":"Estelí Lot 1386","color":"#6B4226","force":"Full","wrapper":"尼加拉瓜配方","vitolas":["Robusto","Toro"],"story":"Rewey 在尼加拉瓜的第一件作品，2013 年春——编号指的是一批烟叶，不是年份。"},{"name":"Connecticut Fuerte","color":"#C9A96E","force":"Medium","wrapper":"Connecticut","vitolas":["Robusto","Toro","Corona"],"story":"起步阶段的多米尼加一面，在 Tabacalera L&V 卷制。浅色茄衣，芯叶却不浅——名字由此而来。"}]',

 '[{"name":"S-307","color":"#4A3728","force":"Medium-Full","wrapper":"سومطرة إكوادوريّ","vitolas":["Robusto","Toro","Torpedo"],"story":"أوّل سيجار نيكاراغويّ للدار في إنتاج منتظم، مكبوس، مُزج ولُفّ عند أ. ج. فرنانديز."},{"name":"Estelí Lot 1386","color":"#6B4226","force":"Full","wrapper":"مزيج نيكاراغويّ","vitolas":["Robusto","Toro"],"story":"أوّل عمل لريوي في نيكاراغوا، ربيع 2013 — والرقم يدلّ على دفعة تبغ لا على سنة حصاد."},{"name":"Connecticut Fuerte","color":"#C9A96E","force":"Medium","wrapper":"كونيتيكت","vitolas":["Robusto","Toro","Corona"],"story":"الوجه الدومينيكيّ للبدايات، لُفّ في «تاباكاليرا L&V». غلاف فاتح فوق حشوة ليست كذلك — ومن هنا الاسم."}]'),

-- ── 7-20-4 ───────────────────────────────────────────────
('7-20-4', 'nicaragua', '2006 — Kurt A. Kendall, New Hampshire',
 'J. Fuego, Estelí ; et Tabacos de Oriente, Danlí (Factory 57)',

 'Le nom est une adresse : 724 Elm Street, à Manchester, dans le New Hampshire. C''est là que R.G. Sullivan fabriquait, à partir de 1874, l''un des cigares à dix cents les plus répandus des États-Unis. L''usine a fermé en 1962, quand l''embargo a coupé l''accès au tabac cubain.

Kurt A. Kendall, qui tient le magasin Twin Smoke Shoppe dans le même État, a repris le nom en 2006. La ligne Factory 57 porte le numéro d''enregistrement que l''administration américaine avait attribué à la fabrique — le genre de détail qu''on ne trouve que dans les archives fiscales.

La marque est américaine, les cigares ne le sont pas. La ligne d''origine et la Factory 57 ont d''abord été roulées au Honduras, chez Tabacos de Oriente, la fabrique de Néstor Plasencia. En juillet 2021, la ligne principale est passée au Nicaragua, chez J. Fuego, la manufacture de Jesús Fuego à Estelí.

Le recensement de cet atlas la classait aux États-Unis, sur la foi de l''adresse du fondateur. C''est la neuvième fois qu''il commet cette erreur, et toujours la même : le pays d''une fiche est celui où le cigare est fait, pas celui où le nom a été déposé.',

 '[{"name":"7-20-4 (ligne d''origine)","color":"#6B4226","force":"Medium-Full","wrapper":"Assemblage nicaraguayen, chez J. Fuego","vitolas":["Robusto","Toro","Corona","Dog Walker"],"story":"La ligne qui a relancé le nom en 2006. Roulée au Honduras d''abord, passée chez J. Fuego à Estelí en juillet 2021."},{"name":"Factory 57","color":"#3E2723","force":"Medium-Full","wrapper":"Habano de Jalapa","vitolas":["Robusto","Toro","Corona Gorda","Dog Walker"],"story":"Le numéro d''enregistrement de l''ancienne fabrique de Manchester. Cape habano de Jalapa, sous-cape du Costa Rica — une provenance que peu de maisons emploient."},{"name":"1874 Series","color":"#8B5A2B","force":"Medium","wrapper":"Assemblage d''Amérique centrale","vitolas":["Robusto","Toro"],"story":"L''année où R.G. Sullivan a commencé à fabriquer sur Elm Street. La série porte la date plutôt que l''adresse."}]',

 'The name is an address: 724 Elm Street, in Manchester, New Hampshire. It was there that R.G. Sullivan made, from 1874, one of the most widespread ten-cent cigars in the United States. The factory closed in 1962, when the embargo cut off Cuban tobacco.

Kurt A. Kendall, who runs the Twin Smoke Shoppe in the same state, took the name back in 2006. The Factory 57 line carries the registration number the American administration had assigned to the factory — the sort of detail found only in tax archives.

The brand is American; the cigars are not. The original line and Factory 57 were first rolled in Honduras, at Tabacos de Oriente, Néstor Plasencia''s factory. In July 2021 the main line moved to Nicaragua, to J. Fuego, Jesús Fuego''s workshop in Estelí.

This atlas''s census filed it under the United States, on the strength of the founder''s address. That is the ninth time it has made this mistake, and always the same one: an entry''s country is where the cigar is made, not where the name was registered.',

 'El nombre es una dirección: 724 Elm Street, en Manchester, Nuevo Hampshire. Allí fabricaba R.G. Sullivan, desde 1874, uno de los puros de diez centavos más extendidos de Estados Unidos. La fábrica cerró en 1962, cuando el embargo cortó el acceso al tabaco cubano.

Kurt A. Kendall, que regenta la tienda Twin Smoke Shoppe en el mismo estado, recuperó el nombre en 2006. La línea Factory 57 lleva el número de registro que la administración estadounidense había asignado a la fábrica: la clase de detalle que solo se halla en los archivos fiscales.

La marca es estadounidense; los puros no. La línea original y la Factory 57 se liaron primero en Honduras, en Tabacos de Oriente, la fábrica de Néstor Plasencia. En julio de 2021 la línea principal pasó a Nicaragua, a J. Fuego, el taller de Jesús Fuego en Estelí.

El censo de este atlas la clasificaba en Estados Unidos, fiándose de la dirección del fundador. Es la novena vez que comete este error, y siempre el mismo: el país de una ficha es aquel donde se hace el puro, no donde se registró el nombre.',

 'Der Name ist eine Adresse: 724 Elm Street in Manchester, New Hampshire. Dort fertigte R.G. Sullivan ab 1874 eine der verbreitetsten Zehn-Cent-Zigarren der Vereinigten Staaten. Die Fabrik schloss 1962, als das Embargo den kubanischen Tabak abschnitt.

Kurt A. Kendall, der im selben Bundesstaat den Twin Smoke Shoppe führt, nahm den Namen 2006 wieder auf. Die Linie Factory 57 trägt die Registriernummer, die die amerikanische Verwaltung der Fabrik zugeteilt hatte — jene Art Einzelheit, die nur in Steuerarchiven zu finden ist.

Die Marke ist amerikanisch, die Zigarren sind es nicht. Die ursprüngliche Linie und Factory 57 wurden zuerst in Honduras gerollt, bei Tabacos de Oriente, der Fabrik von Néstor Plasencia. Im Juli 2021 wechselte die Hauptlinie nach Nicaragua, zu J. Fuego, der Werkstatt von Jesús Fuego in Estelí.

Die Bestandsaufnahme dieses Atlas führte sie unter den Vereinigten Staaten, gestützt auf die Adresse des Gründers. Es ist das neunte Mal, dass ihr dieser Fehler unterläuft, und stets derselbe: Das Land eines Eintrags ist jenes, in dem die Zigarre gemacht wird, nicht jenes, in dem der Name eingetragen wurde.',

 '这个名字是一个地址：新罕布什尔州曼彻斯特市 Elm 街 724 号。R.G. Sullivan 自 1874 年起在那里制作全美流传最广的十美分雪茄之一。1962 年禁运切断古巴烟叶，工厂关闭。

在同一个州经营 Twin Smoke Shoppe 门店的 Kurt A. Kendall 于 2006 年重拾这个名字。Factory 57 这条线用的是美国当局当年给那家工厂的登记编号——这类细节只在税务档案里找得到。

品牌是美国的，雪茄不是。原始产品线与 Factory 57 最早在洪都拉斯卷制，出自 Néstor Plasencia 的 Tabacos de Oriente 工厂。2021 年 7 月，主线转到尼加拉瓜，进了 Jesús Fuego 在埃斯特利的 J. Fuego 作坊。

本图集的清点曾依创始人的地址把它归入美国。这是它第九次犯下同一个错误：一条条目的国别，取决于雪茄在哪里做成，而不是名字在哪里注册。',

 'الاسم عنوان: 724 شارع إلم، في مانشستر بولاية نيوهامبشير. هناك كان ر. ج. سوليفان يصنع، ابتداءً من 1874، واحدًا من أوسع سيجارات العشرة سنتات انتشارًا في الولايات المتحدة. وأُغلق المصنع عام 1962 حين قطع الحظرُ التبغَ الكوبيّ.

استعاد كورت أ. كندال، صاحب متجر «توين سموك شوب» في الولاية نفسها، الاسمَ عام 2006. ويحمل خطّ «فاكتوري 57» رقم التسجيل الذي كانت الإدارة الأمريكية قد منحته للمصنع — من التفاصيل التي لا تُلتقط إلّا من أرشيف الضرائب.

العلامة أمريكية، والسيجار ليس كذلك. فالخطّ الأصليّ و«فاكتوري 57» لُفّا أوّلًا في هندوراس عند «تاباكوس دي أورينتي»، مصنع نيستور بلاسنسيا. وفي يوليو 2021 انتقل الخطّ الرئيس إلى نيكاراغوا، إلى «ج. فويغو»، ورشة خيسوس فويغو في إستيلي.

وكان إحصاء هذا الأطلس قد صنّفها في الولايات المتحدة اعتمادًا على عنوان المؤسّس. وهي المرّة التاسعة التي يقع فيها هذا الخطأ نفسه: بلد البطاقة هو حيث يُصنع السيجار، لا حيث سُجّل الاسم.',

 '[{"name":"7-20-4 (original line)","color":"#6B4226","force":"Medium-Full","wrapper":"Nicaraguan blend, at J. Fuego","vitolas":["Robusto","Toro","Corona","Dog Walker"],"story":"The line that revived the name in 2006. Rolled in Honduras first, moved to J. Fuego in Estelí in July 2021."},{"name":"Factory 57","color":"#3E2723","force":"Medium-Full","wrapper":"Jalapa Habano","vitolas":["Robusto","Toro","Corona Gorda","Dog Walker"],"story":"The registration number of the old Manchester factory. Jalapa Habano wrapper over a Costa Rican binder — a provenance few houses use."},{"name":"1874 Series","color":"#8B5A2B","force":"Medium","wrapper":"Central American blend","vitolas":["Robusto","Toro"],"story":"The year R.G. Sullivan began manufacturing on Elm Street. This series carries the date rather than the address."}]',

 '[{"name":"7-20-4 (línea original)","color":"#6B4226","force":"Medium-Full","wrapper":"Ligada nicaragüense, en J. Fuego","vitolas":["Robusto","Toro","Corona","Dog Walker"],"story":"La línea que relanzó el nombre en 2006. Liada primero en Honduras, pasada a J. Fuego en Estelí en julio de 2021."},{"name":"Factory 57","color":"#3E2723","force":"Medium-Full","wrapper":"Habano de Jalapa","vitolas":["Robusto","Toro","Corona Gorda","Dog Walker"],"story":"El número de registro de la vieja fábrica de Manchester. Capa habano de Jalapa sobre capote de Costa Rica: una procedencia que pocas casas emplean."},{"name":"Serie 1874","color":"#8B5A2B","force":"Medium","wrapper":"Ligada centroamericana","vitolas":["Robusto","Toro"],"story":"El año en que R.G. Sullivan empezó a fabricar en Elm Street. Esta serie lleva la fecha en lugar de la dirección."}]',

 '[{"name":"7-20-4 (Ursprungslinie)","color":"#6B4226","force":"Medium-Full","wrapper":"Nicaraguanische Mischung, bei J. Fuego","vitolas":["Robusto","Toro","Corona","Dog Walker"],"story":"Die Linie, die den Namen 2006 wiederbelebte. Zuerst in Honduras gerollt, im Juli 2021 zu J. Fuego nach Estelí gewechselt."},{"name":"Factory 57","color":"#3E2723","force":"Medium-Full","wrapper":"Jalapa-Habano","vitolas":["Robusto","Toro","Corona Gorda","Dog Walker"],"story":"Die Registriernummer der alten Fabrik in Manchester. Jalapa-Habano-Deckblatt über einem Umblatt aus Costa Rica — eine Herkunft, die wenige Häuser verwenden."},{"name":"1874 Series","color":"#8B5A2B","force":"Medium","wrapper":"Zentralamerikanische Mischung","vitolas":["Robusto","Toro"],"story":"Das Jahr, in dem R.G. Sullivan an der Elm Street zu fertigen begann. Diese Serie trägt das Datum statt der Adresse."}]',

 '[{"name":"7-20-4（原始产品线）","color":"#6B4226","force":"Medium-Full","wrapper":"尼加拉瓜配方，产自 J. Fuego","vitolas":["Robusto","Toro","Corona","Dog Walker"],"story":"2006 年让这个名字复活的一条线。最初在洪都拉斯卷制，2021 年 7 月转到埃斯特利的 J. Fuego。"},{"name":"Factory 57","color":"#3E2723","force":"Medium-Full","wrapper":"Jalapa Habano","vitolas":["Robusto","Toro","Corona Gorda","Dog Walker"],"story":"曼彻斯特旧工厂的登记编号。Jalapa 的 Habano 茄衣，配哥斯达黎加茄套——这一产地少有人用。"},{"name":"1874 Series","color":"#8B5A2B","force":"Medium","wrapper":"中美洲配方","vitolas":["Robusto","Toro"],"story":"R.G. Sullivan 在 Elm 街开始制造的那一年。这个系列取的是年份，不是门牌。"}]',

 '[{"name":"7-20-4 (الخطّ الأصليّ)","color":"#6B4226","force":"Medium-Full","wrapper":"مزيج نيكاراغويّ، عند ج. فويغو","vitolas":["Robusto","Toro","Corona","Dog Walker"],"story":"الخطّ الذي أحيا الاسم عام 2006. لُفّ في هندوراس أوّلًا، ثم انتقل إلى «ج. فويغو» في إستيلي في يوليو 2021."},{"name":"Factory 57","color":"#3E2723","force":"Medium-Full","wrapper":"هابانو من خالابا","vitolas":["Robusto","Toro","Corona Gorda","Dog Walker"],"story":"رقم تسجيل المصنع القديم في مانشستر. غلاف هابانو من خالابا فوق رابط من كوستاريكا — مصدر قلّما تستعمله الدور."},{"name":"1874 Series","color":"#8B5A2B","force":"Medium","wrapper":"مزيج من أمريكا الوسطى","vitolas":["Robusto","Toro"],"story":"السنة التي بدأ فيها ر. ج. سوليفان الصناعة في شارع إلم. وهذه السلسلة تحمل التاريخ بدل العنوان."}]');

-- ── Les sceaux, calculés depuis les colonnes ─────────────
INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'brands', b.`name`, c.champ, l.lang,
       SHA1(CASE c.champ WHEN 'history' THEN b.`history` ELSE b.`gamme` END),
       'machine', NOW()
  FROM `brands` b
  JOIN (SELECT 'history' champ UNION ALL SELECT 'gamme') c
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE b.`name` IN ('Protocol','Regius','Cornelius & Anthony','262 Cigars',
                    'Emilio Cigars','Nomad','7-20-4')
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 192','systeme','sept_maisons_ajoutees','marque',0,
   'Protocol (Cancel et Ives, 2015), Regius (Kapacee, 2010), Cornelius & Anthony (famille Bailey, 2015), 262 Cigars (Clint Aaron, 2010), Emilio Cigars (Gary Griffith, 2010), Nomad (Fred Rewey, 2012) et 7-20-4 (Kurt A. Kendall, 2006) — les sept sous nicaragua, et les sept sans usine'),
  (NULL,'migration 192','systeme','huitieme_et_neuvieme_erreur_de_pays','marque',0,
   'docs/maisons-absentes.md classait NOMAD en Republique dominicaine et 7-20-4 aux Etats-Unis. Nomad a commence dominicaine a la Tabacalera L&V mais l essentiel de ses seize assemblages sort du Nicaragua depuis 2013. 7-20-4 n a jamais rien fabrique dans le New Hampshire : ligne d origine et Factory 57 au Honduras chez Tabacos de Oriente (Nestor Plasencia), puis passage de la ligne principale chez J. Fuego a Esteli en juillet 2021. NEUF erreurs de pays au total, apres Nicoya, La Palina, Padilla, Asylum, Micallef, Gurkha et La Barba'),
  (NULL,'migration 192','systeme','qui_fait_quoi','marque',0,
   'ONZE ATELIERS NOMMES, dont sept ont deja leur fiche. PROTOCOL : La Zona (Espinosa) avec Hector Alfonso Sr., puis San Lotano (A.J. Fernandez). REGIUS : Plasencia, Esteli. CORNELIUS & ANTHONY : La Zona pour l essentiel, El Titan de Bronze a Miami pour la ligne Cornelius. 262 : Tabacalera Carreras (Craig Cunningham) et TacaNicsa (Eradio Pichardo). EMILIO : A.J. Fernandez pour AF1 et AF2, My Father pour le Grimalkin de 2011, Fabrica Oveja Negra (Black Label Trading) pour celui d aujourd hui. NOMAD : Tabacalera L&V en Rep. dominicaine, A.J. Fernandez et Oveja Negra au Nicaragua. 7-20-4 : Tabacos de Oriente (Nestor Plasencia) puis J. Fuego'),
  (NULL,'migration 192','systeme','une_maison_qui_fait_aussi_de_la_machine','marque',0,
   'CORNELIUS & ANTHONY est une filiale de S&M BRANDS, societe familiale de Keysville en Virginie, qui fabrique des cigarettes et de PETITS CIGARES DE MACHINE. Rien de cela n entre dans l atlas : la fiche porte le seul versant roule main, et l ecrit. Meme partage qu a la 187 chez J.C. Newman et qu a la 189 chez Dannemann'),
  (NULL,'migration 192','systeme','changement_de_mains_recent','marque',0,
   'PROTOCOL : en fevrier 2026 le detaillant floridien Smoke Inn a rachete la propriete intellectuelle et les actifs de la marque, mais PAS Cubariqueno Cigar Company, qui reste aux fondateurs ; Juan Cancel accompagne toujours la marque et les deux fabriques n ont pas change. 262 : vendue par Clint Aaron en juin 2019 a Madison Money. NOMAD : vendue par Fred Rewey en septembre 2018 a Chris Kelly et Kyle Hoover, d Ezra Zion. EMILIO : appartient a Scott Zucca');

-- ════════════════════════════════════════════════════════
-- LE TABLEAU DE PAYS, EN TOUTES LETTRES
-- ════════════════════════════════════════════════════════
-- nicaragua : 36 → 43 entrées
UPDATE `producer_countries`
   SET `brands` = '[{"desc":"Référence absolue du Nicaragua premium","name":"Padrón","iconic":true},{"desc":"Pepin Garcia, maître torcedor légendaire","name":"My Father","iconic":true},{"desc":"Serie V mondialement reconnue","name":"Oliva","iconic":true},{"desc":"Liga Privada, révolution moderne","name":"Drew Estate","iconic":true},{"desc":"Plus grand producteur familial","name":"Plasencia","iconic":false},{"desc":"Élégance et puissance fusionnées","name":"Rocky Patel","iconic":false},{"desc":"Maître du Connecticut nicaraguayen","name":"Perdomo","iconic":false},{"desc":"Plus ancienne manufacture du pays","name":"Joya de Nicaragua","iconic":false},{"desc":"Le mélange privé de Jonathan Drew, devenu culte","name":"Liga Privada","iconic":false},{"desc":"Maison suisse de 1888, roulée à Estelí","name":"Villiger","iconic":false},{"desc":"Le rouleur que les autres marques employaient sans le nommer","name":"A.J. Fernandez","iconic":true},{"desc":"D''abord un planteur de Jalapa, ensuite une marque","name":"Aganorsa Leaf","iconic":true},{"desc":"La grammaire cubaine, la matière nicaraguayenne","name":"Tatuaje","iconic":false},{"desc":"Celle qui a rendu le petit format respectable","name":"Illusione","iconic":false},{"desc":"Un cigare ancré dans une culture, pas seulement un terroir","name":"Foundation Cigar Company","iconic":false},{"desc":"Granada plutôt qu''Estelí, et l''atelier ouvert aux visiteurs","name":"Mombacho","iconic":false},{"desc":"Une marque qui s''est offert sa propre manufacture","name":"Espinosa","iconic":true},{"desc":"Pas d''usine : elle choisit son rouleur selon l''assemblage","name":"Crowned Heads","iconic":true},{"desc":"Des noms cubains d''avant 1960, des assemblages d''aujourd''hui","name":"Warped","iconic":false},{"desc":"Maison nicaraguayenne, encore peu documentée ici","name":"Capitol","iconic":false},{"desc":"Repris par la famille García en décembre 2019, après quarante-cinq ans chez Quesada","name":"Fonseca Nicaraguayen","iconic":false},{"name":"Nicoya","desc":"Maison australienne roulée à Estelí — l''Australie ne cultive plus depuis 2006","iconic":false},{"name":"Dunbarton Tobacco & Trust","desc":"Steve Saka, ex-Drew Estate, parti monter sa maison sans usine","iconic":true},{"name":"RoMa Craft Tobac","desc":"Commencée dans un garage, puis son propre atelier à Estelí","iconic":true},{"name":"Viaje","desc":"Plus de gamme régulière depuis 2012 : rien que des séries limitées","iconic":false},{"name":"Room101","desc":"D''un bijoutier au cigare ; trois manufactures, deux pays","iconic":false},{"name":"L''Atelier","desc":"La seconde maison de Pete Johnson, chez My Father comme Tatuaje","iconic":false},{"name":"La Aroma de Cuba","desc":"Nom cubain des années 1880, refait par Pepin García en 2009","iconic":false},{"name":"Southern Draw","desc":"Robert et Sharon Holt — un seul atelier, ce qui est rare","iconic":false},{"name":"HVC Cigars","desc":"Havana City ; dix ans sans usine, puis la sienne en 2021","iconic":true},{"name":"Fratello","desc":"Un ingénieur de la NASA passé au cigare","iconic":false},{"name":"Curivari","desc":"Grecque de tête, cubaine d''intention, nicaraguayenne de matière","iconic":false},{"name":"Black Label Trading Co.","desc":"Une fabrique conçue comme un atelier d''artiste","iconic":false},{"name":"Asylum","desc":"L''autre moitié de CLE — et une fabrique qui fut un cinéma","iconic":false},{"name":"Micallef","desc":"Une panne de voiture, un Texan, et trois générations cubaines","iconic":false},{"name":"Gurkha","desc":"Sans usine jusqu''en 2017, puis propriétaire de la sienne à Estelí","iconic":false},{"name":"Protocol","desc":"Deux policiers, aucune usine — La Zona puis San Lotano","iconic":false},{"name":"Regius","desc":"Maison londonienne de 2010, roulée chez Plasencia","iconic":false},{"name":"Cornelius & Anthony","desc":"Cent cinquante ans de tabac en Virginie, roulés à Estelí","iconic":false},{"name":"262 Cigars","desc":"Le nom est une date : février 1962, la signature de l''embargo","iconic":false},{"name":"Emilio Cigars","desc":"Trois fabriques, trois familles, un seul nom sur la bague","iconic":false},{"name":"Nomad","desc":"Le nom était un programme : elle a changé d''atelier et de pays","iconic":false},{"name":"7-20-4","desc":"Une adresse de Manchester fermée en 1962, reprise en 2006","iconic":false}]',
       `updated_at` = NOW()
 WHERE `id` = 'nicaragua';

