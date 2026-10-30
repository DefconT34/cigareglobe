-- ════════════════════════════════════════════════════════
-- 297 — Relecture des lieux restants : 89 fiches reprises, 15 retirées
-- ────────────────────────────────────────────────────────
-- CE QU'ON A TROUVÉ. Relecture du 29 octobre 2026 (expert-cigare, contradicteur
-- pour les « introuvables ») des 275 fiches vérifiées restantes. 89 fiches reprises :
-- adresse corrigée quand une source la donne, description ramenée à ce que les
-- sources lues établissent (sans superlatif, offre, revue ni parole rapportée),
-- `source` écrite « à vérifier — relu le 29 octobre 2026 : … ». Traductions
-- (expert-traduction) remises en « machine », sceau recalculé.
-- 15 fiches retirées (`is_verified = 0`, motif dans `source`) : fermeture datée
-- (#96, #153, #154, #1465) ou hôtel dont la page officielle liste ses bars sans
-- salon cigares (règle 155 : #107, #121, #820, #830, #837, #938, #948, #968,
-- #1113, #1393, #1426). Les autres « introuvables » restent à vérifier : le silence
-- seul ne retire rien. Enrichissements, doublons et renommages : migration suivante.
-- ════════════════════════════════════════════════════════

UPDATE `lounges` SET
  `city` = 'Abidjan, Zone 4 (Marcory) — Galerie commerciale Cap Sud, boulevard Valéry Giscard d''Estaing',
  `description` = 'Boutique de cigares Zino dans la galerie commerciale Cap Sud, inaugurée le 10 décembre 2020 selon la presse ivoirienne (Koaci). Référencée comme Habanos Specialist par Cigar Inspector.',
  `description_en` = 'Zino cigar shop in the Cap Sud shopping arcade, opened on 10 December 2020 according to the Ivorian press (Koaci). Listed as a Habanos Specialist by Cigar Inspector.',
  `description_es` = 'Tienda de puros Zino en la galería comercial Cap Sud, inaugurada el 10 de diciembre de 2020 según la prensa marfileña (Koaci). Figura como Habanos Specialist en Cigar Inspector.',
  `description_de` = 'Zino-Zigarrengeschäft in der Einkaufsgalerie Cap Sud, laut der ivorischen Presse (Koaci) am 10. Dezember 2020 eröffnet. Bei Cigar Inspector als Habanos Specialist geführt.',
  `description_zh` = '位于 Cap Sud 购物长廊内的 Zino 雪茄店，据科特迪瓦媒体（Koaci）报道，于 2020 年 12 月 10 日开业。Cigar Inspector 将其列为 Habanos Specialist。',
  `description_ar` = 'متجر سيجار Zino في المعرض التجاري Cap Sud، افتُتح في 10 ديسمبر 2020 بحسب الصحافة الإيفوارية (Koaci). مدرج لدى Cigar Inspector بصفة Habanos Specialist.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : koaci.com (nouvelle boutique « dans la galerie commerciale de CAP SUD », inaugurée le 10 déc. 2020) ; cigarinspector.com (C.C. CAP SUD – Boulevard VGE – Zone 4 (extrait de recherche ; page 403, non ouverte)) ; cigars-connect.com (Zino Cigares : sept boutiques à Abidjan en mai 2026 (existence du réseau))',
  `updated_at` = NOW()
 WHERE `id` = 2 AND `country_id` = 'ivorycoast' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Zürich — Bleicherweg 18, 8002',
  `description` = 'La Casa del Habano de Zürich, franchise du réseau Habanos S.A., Bleicherweg 18. Propriétaire : Samuel Menzi. Selon Habanos S.A., il a reçu le titre d''Habano Man of the Year (catégorie affaires) en 2004 ; année non recoupée par une seconde source lisible.',
  `description_en` = 'La Casa del Habano in Zürich, a franchise of the Habanos S.A. network, Bleicherweg 18. Owner: Samuel Menzi. According to Habanos S.A., he received the title of Habano Man of the Year (business category) in 2004; the year has not been confirmed by a second readable source.',
  `description_es` = 'La Casa del Habano de Zúrich, franquicia de la red Habanos S.A., Bleicherweg 18. Propietario: Samuel Menzi. Según Habanos S.A., recibió el título de Habano Man of the Year (categoría de negocios) en 2004; el año no ha sido contrastado con una segunda fuente legible.',
  `description_de` = 'La Casa del Habano in Zürich, Franchise des Habanos-S.A.-Netzwerks, Bleicherweg 18. Inhaber: Samuel Menzi. Laut Habanos S.A. erhielt er 2004 den Titel Habano Man of the Year (Kategorie Wirtschaft); das Jahr wurde durch keine zweite lesbare Quelle bestätigt.',
  `description_zh` = '苏黎世的 La Casa del Habano，属于 Habanos S.A. 网络的特许经营店，地址 Bleicherweg 18。店主：Samuel Menzi。据 Habanos S.A. 称，他于2004年获得 Habano Man of the Year（商业类）称号；该年份未获得另一可读来源的印证。',
  `description_ar` = 'لا كاسا ديل هابانو في زيورخ، امتياز ضمن شبكة Habanos S.A.، العنوان Bleicherweg 18. المالك: Samuel Menzi. وفق Habanos S.A.، حصل على لقب Habano Man of the Year (فئة الأعمال) عام 2004؛ ولم يتم التحقق من السنة عبر مصدر ثانٍ مقروء.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : lacasadelhabano.com (Bleicherweg 18, 8002 Zürich (fiche officielle du réseau)) ; habanos.com (actualité Habanos S.A. sur le réseau suisse (4 sept. 2024))',
  `updated_at` = NOW()
 WHERE `id` = 42 AND `country_id` = 'switzerland' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Nyon — Rue de Rive 34, 1260',
  `description` = 'La Casa del Habano de Nyon (canton de Vaud), franchise du réseau Habanos S.A., Rue de Rive 34. Ouverture annoncée par Habanos S.A. le 15 juin 2021.',
  `description_en` = 'The Casa del Habano in Nyon (canton of Vaud), a franchise of the Habanos S.A. network, Rue de Rive 34. Opening announced by Habanos S.A. on 15 June 2021.',
  `description_es` = 'La Casa del Habano de Nyon (cantón de Vaud), franquicia de la red Habanos S.A., Rue de Rive 34. Apertura anunciada por Habanos S.A. el 15 de junio de 2021.',
  `description_de` = 'Die Casa del Habano in Nyon (Kanton Waadt), ein Franchise des Habanos-S.A.-Netzwerks, Rue de Rive 34. Die Eröffnung wurde von Habanos S.A. am 15. Juni 2021 angekündigt.',
  `description_zh` = '位于尼翁(沃州)的 Casa del Habano,属于 Habanos S.A. 网络的特许经营店,地址:Rue de Rive 34。Habanos S.A. 于2021年6月15日宣布开业。',
  `description_ar` = 'Casa del Habano في نيون (كانتون فو)، امتياز تجاري ضمن شبكة Habanos S.A.، العنوان: Rue de Rive 34. أعلنت Habanos S.A. عن افتتاحه في 15 يونيو 2021.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : habanos.com (Rue de Rive 34, 1260 Nyon ; ''only La Casa del Habano in Suisse Romandie'' (15 juin 2021)) ; habanos.com (titre : dixième LCDH de Suisse à Montreux (donc ''seule'' caduc)) ; lacasadelhabano.com (Rue de Rive 34, 1260 Nyon, Vaud)',
  `updated_at` = NOW()
 WHERE `id` = 45 AND `country_id` = 'switzerland' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Mendrisio — Via Angelo Maspoli 11 (près de FoxTown)',
  `description` = 'La Casa del Habano de Mendrisio (Tessin), franchise du réseau Habanos S.A., Via Angelo Maspoli 11, près du centre FoxTown. Propriétaires : Alain Proietto et Sofia Belfasto, qui tiennent aussi la boutique de Lugano. Habanos S.A. annonce l''ouverture le 26 avril 2024 et la qualifie de neuvième de Suisse ; un autre article du même éditeur (nov. 2025) numérote Genève neuvième : la numérotation diverge.',
  `description_en` = 'La Casa del Habano in Mendrisio (Ticino), a franchise of the Habanos S.A. network, Via Angelo Maspoli 11, near the FoxTown centre. Owners: Alain Proietto and Sofia Belfasto, who also run the Lugano shop. Habanos S.A. announces the opening on 26 April 2024 and describes it as the ninth in Switzerland; another article from the same publisher (Nov. 2025) numbers Geneva as ninth: the numbering differs.',
  `description_es` = 'La Casa del Habano de Mendrisio (Tesino), franquicia de la red Habanos S.A., Via Angelo Maspoli 11, cerca del centro FoxTown. Propietarios: Alain Proietto y Sofia Belfasto, que también regentan la tienda de Lugano. Habanos S.A. anuncia la apertura el 26 de abril de 2024 y la califica como la novena de Suiza; otro artículo del mismo editor (nov. de 2025) numera Ginebra como novena: la numeración no coincide.',
  `description_de` = 'La Casa del Habano in Mendrisio (Tessin), Franchise des Netzwerks Habanos S.A., Via Angelo Maspoli 11, in der Nähe des Centers FoxTown. Inhaber: Alain Proietto und Sofia Belfasto, die auch das Geschäft in Lugano führen. Habanos S.A. gibt die Eröffnung am 26. April 2024 bekannt und bezeichnet sie als neunte der Schweiz; ein anderer Artikel desselben Herausgebers (Nov. 2025) nummeriert Genf als neunte: Die Nummerierung weicht ab.',
  `description_zh` = '位于门德里西奥（提契诺州）的 La Casa del Habano，属 Habanos S.A. 网络的特许经营店，地址 Via Angelo Maspoli 11，靠近 FoxTown 购物中心。店主：Alain Proietto 与 Sofia Belfasto，二人亦经营卢加诺的店铺。Habanos S.A. 宣布其于 2024 年 4 月 26 日开业，并称其为瑞士第九家；同一发布方的另一篇文章（2025 年 11 月）将日内瓦列为第九家：编号不一致。',
  `description_ar` = 'La Casa del Habano في مندريزيو (كانتون تيتشينو)، امتياز ضمن شبكة Habanos S.A.، العنوان Via Angelo Maspoli 11، قرب مركز FoxTown. المالكان: Alain Proietto وSofia Belfasto، وهما يديران أيضًا متجر لوغانو. تعلن Habanos S.A. افتتاحه في 26 أبريل 2024 وتصفه بأنه التاسع في سويسرا؛ ويرقّم مقال آخر للناشر نفسه (نوفمبر 2025) جنيف بالتاسع: الترقيم غير متطابق.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : habanos.com (Via Angelo Maspoli 11, next to FoxTown ; ninth in Switzerland ; ouverture 26 avril (4 sept. 2024)) ; lacasadelhabano.com (fiche officielle LCDH Mendrisio, Via Angelo Maspoli) ; habanos.com (Genève ''ninth'' en nov. 2025 et Mendrisio dans les huit existantes : divergence de numérotation)',
  `updated_at` = NOW()
 WHERE `id` = 46 AND `country_id` = 'switzerland' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Genk',
  `description` = 'Point de vente de cigares et de tabac à Genk, en Belgique, exploité sous le nom de Vandevenne.',
  `description_en` = 'Cigar and tobacco retail outlet in Genk, Belgium, operating under the name Vandevenne.',
  `description_es` = 'Punto de venta de cigarros y tabaco en Genk, Bélgica, que opera bajo el nombre de Vandevenne.',
  `description_de` = 'Verkaufsstelle für Zigarren und Tabak in Genk, Belgien, betrieben unter dem Namen Vandevenne.',
  `description_zh` = '位于比利时亨克的雪茄和烟草销售点，以 Vandevenne 的名称经营。',
  `description_ar` = 'نقطة بيع للسيجار والتبغ في خينك ببلجيكا، تعمل باسم Vandevenne.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : cigarjournal.com (Dagbladhandel Vandevenne, Genk: Davidoff Best Performance EMEA, Belgique (palmares 2021))',
  `updated_at` = NOW()
 WHERE `id` = 57 AND `country_id` = 'belgium' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Amsterdam — Rokin 96, 1012 KZ',
  `description` = 'Tabagie amstellodamoise, selon le site de la maison fondée en 1826 par Pantaleon Gerhard Coenraad Hajenius et installée au Rokin 96 depuis 1914.',
  `description_en` = 'Tobacconist in Amsterdam, according to the website of the house founded in 1826 by Pantaleon Gerhard Coenraad Hajenius and located at Rokin 96 since 1914.',
  `description_es` = 'Estanco de Ámsterdam, según el sitio web de la casa fundada en 1826 por Pantaleon Gerhard Coenraad Hajenius e instalada en Rokin 96 desde 1914.',
  `description_de` = 'Tabakwarengeschäft in Amsterdam, laut der Website des Hauses, das 1826 von Pantaleon Gerhard Coenraad Hajenius gegründet wurde und seit 1914 am Rokin 96 ansässig ist.',
  `description_zh` = '阿姆斯特丹的烟草店。据该店网站介绍,店铺由 Pantaleon Gerhard Coenraad Hajenius 于1826年创立,自1914年起设在 Rokin 96。',
  `description_ar` = 'متجر تبغ في أمستردام، بحسب موقع المتجر الذي أسسه Pantaleon Gerhard Coenraad Hajenius عام 1826 ويقع في Rokin 96 منذ عام 1914.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : hajenius.com (P.G.C. Hajenius, Rokin 96, 1012 KZ Amsterdam ; commerce depuis 1826, au Rokin 96 depuis 1914)',
  `updated_at` = NOW()
 WHERE `id` = 61 AND `country_id` = 'netherlands' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Rruga Asim Zeneli, Tirana',
  `description` = 'Franchise La Casa del Habano de Tirana, rue Asim Zeneli ; ouverture annoncée par Habanos S.A. le 27 octobre 2021 (ouverte le 7 octobre 2021).',
  `description_en` = 'La Casa del Habano franchise in Tirana, Asim Zeneli street; opening announced by Habanos S.A. on 27 October 2021 (opened on 7 October 2021).',
  `description_es` = 'Franquicia La Casa del Habano de Tirana, calle Asim Zeneli; apertura anunciada por Habanos S.A. el 27 de octubre de 2021 (abierta el 7 de octubre de 2021).',
  `description_de` = 'Franchise La Casa del Habano in Tirana, Asim-Zeneli-Straße; Eröffnung von Habanos S.A. am 27. Oktober 2021 angekündigt (eröffnet am 7. Oktober 2021).',
  `description_zh` = '位于地拉那的 La Casa del Habano 特许经营店，Asim Zeneli 街；Habanos S.A. 于 2021 年 10 月 27 日宣布开业（实际于 2021 年 10 月 7 日开业）。',
  `description_ar` = 'امتياز La Casa del Habano في تيرانا، شارع Asim Zeneli؛ أعلنت Habanos S.A. افتتاحه في 27 أكتوبر 2021 (افتُتح في 7 أكتوبر 2021).',
  `source` = 'à vérifier — relu le 29 octobre 2026 : habanos.com (located at ''Asim Zeneli'' in Tirana (ouverture 7 octobre 2021) ; aucune mention de Sheraton) ; lacasadelhabano.com (Albania : LCDH Tirana (nom seul, sans adresse))',
  `updated_at` = NOW()
 WHERE `id` = 65 AND `country_id` = 'albania' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Sofia — Intercontinental Sofia Hotel, 4 Narodno Sabranie Square',
  `description` = 'La Casa del Habano de Sofia, dans l''hôtel situé au 4 place Narodno Sabranie, répertoriée sur lacasadelhabano.com sous l''intitulé Intercontinental ; opérateur du réseau en Bulgarie : Kaliman Caribe.',
  `description_en` = 'La Casa del Habano in Sofia, in the hotel located at 4 Narodno Sabranie Square, listed on lacasadelhabano.com under the name Intercontinental; network operator in Bulgaria: Kaliman Caribe.',
  `description_es` = 'La Casa del Habano de Sofía, en el hotel situado en el 4 de la plaza Narodno Sabranie, registrada en lacasadelhabano.com con el nombre Intercontinental; operador de la red en Bulgaria: Kaliman Caribe.',
  `description_de` = 'La Casa del Habano in Sofia, im Hotel am Narodno-Sabranie-Platz 4, auf lacasadelhabano.com unter der Bezeichnung Intercontinental aufgeführt; Betreiber des Netzwerks in Bulgarien: Kaliman Caribe.',
  `description_zh` = '索非亚的 La Casa del Habano，位于 Narodno Sabranie 广场4号的酒店内，在 lacasadelhabano.com 上登记的名称为 Intercontinental；该网络在保加利亚的运营商：Kaliman Caribe。',
  `description_ar` = 'لا كاسا ديل هابانو في صوفيا، داخل الفندق الواقع في 4 ساحة Narodno Sabranie، وهي مدرجة على lacasadelhabano.com تحت اسم Intercontinental؛ مشغّل الشبكة في بلغاريا: Kaliman Caribe.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : lacasadelhabano.com (LCDH Sofia/Intercontinental : 4 Narodno Sabranie Square, 1169 Sofia) ; habanos.com (Kaliman Caribe, licence Habanos S.A. en Bulgarie (opérateur du réseau))',
  `updated_at` = NOW()
 WHERE `id` = 67 AND `country_id` = 'bulgaria' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Cracovie - ul. Sławkowska 26, 31-014',
  `description` = 'La Casa del Habano de Cracovie, du réseau Habanos S.A., ul. Sławkowska 26.',
  `description_en` = 'The Casa del Habano in Kraków, part of the Habanos S.A. network, ul. Sławkowska 26.',
  `description_es` = 'La Casa del Habano de Cracovia, de la red Habanos S.A., ul. Sławkowska 26.',
  `description_de` = 'Die Casa del Habano in Krakau, Teil des Habanos-S.A.-Netzwerks, ul. Sławkowska 26.',
  `description_zh` = '位于克拉科夫的 Casa del Habano,属于 Habanos S.A. 网络,地址:ul. Sławkowska 26。',
  `description_ar` = 'Casa del Habano في كراكوف، ضمن شبكة Habanos S.A.، العنوان: ul. Sławkowska 26.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : lacasadelhabano.com (La Casa Del Habano KRAKÓW, Sławkowska 26, 31-014 Kraków) ; krakow.lcdh.pl (ul. Sławkowska 26, 31-014 Kraków ; lun-sam 12:00-00:00, dim 13:00-22:00)',
  `updated_at` = NOW()
 WHERE `id` = 75 AND `country_id` = 'poland' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Bucarest — Șoseaua Odăi 379-381, secteur 1',
  `description` = 'Lerida International SRL, importateur et distributeur de vins, spiritueux et cigares fondé en 1993 à Bucarest ; la page de la société ne mentionne pas Davidoff.',
  `description_en` = 'Lerida International SRL, importer and distributor of wines, spirits and cigars founded in 1993 in Bucharest; the company''s page does not mention Davidoff.',
  `description_es` = 'Lerida International SRL, importador y distribuidor de vinos, licores y puros fundado en 1993 en Bucarest; la página de la empresa no menciona Davidoff.',
  `description_de` = 'Lerida International SRL, Importeur und Händler von Weinen, Spirituosen und Zigarren, 1993 in Bukarest gegründet; die Seite des Unternehmens erwähnt Davidoff nicht.',
  `description_zh` = 'Lerida International SRL，1993 年在布加勒斯特成立的葡萄酒、烈酒和雪茄进口商兼经销商；该公司页面未提及 Davidoff。',
  `description_ar` = 'Lerida International SRL، مستورد وموزّع للنبيذ والمشروبات الروحية والسيجار تأسس عام 1993 في بوخارست؛ ولا تذكر صفحة الشركة Davidoff.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : cigarjournal.com (30 sept. 2021 : « Best Partner of the Year EMEA: Lerida International Srl, Bucharest (Romania) ») ; lerida.ro (importateur-distributeur de vins, spiritueux et cigares, fondé en 1993 ; Sos Odai 379-381, secteur 1, Bucarest)',
  `updated_at` = NOW()
 WHERE `id` = 77 AND `country_id` = 'romania' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Prague — Dlouhá 35, Praha 1',
  `description` = 'La Casa del Habano de Prague, franchise du réseau La Casa del Habano, située rue Dlouhá.',
  `description_en` = 'La Casa del Habano in Prague, a franchise of the La Casa del Habano network, located on Dlouhá street.',
  `description_es` = 'La Casa del Habano de Praga, franquicia de la red La Casa del Habano, situada en la calle Dlouhá.',
  `description_de` = 'La Casa del Habano in Prag, Franchise des Netzwerks La Casa del Habano, in der Straße Dlouhá.',
  `description_zh` = '布拉格的 La Casa del Habano，属于 La Casa del Habano 网络的特许经营店，位于 Dlouhá 街。',
  `description_ar` = 'لا كاسا ديل هابانو في براغ، امتياز ضمن شبكة لا كاسا ديل هابانو، تقع في شارع Dlouhá.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : lacasadelhabano.com (LCDH Praga, Dlouhá 35, Praha 1, 11000 Praha) ; cigaraficionado.com (Dlouhá 35/730, Prague 1 ; official La Casa del Habano (5 sept. 2017))',
  `updated_at` = NOW()
 WHERE `id` = 80 AND `country_id` = 'czech' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Saint-Pétersbourg — Bolshoï prospekt (Petrogradskaïa storona), 37A',
  `description` = 'La Casa del Habano installée dans le Vvedensky Hotel, ancien bâtiment de la Vvedenskaya Gymnasium, sur la Petrogradskaïa storona. Selon Habanos S.A., elle a ouvert le 20 octobre 2022 ; elle a une entrée sur l''avenue et une autre depuis l''hôtel.',
  `description_en` = 'The Casa del Habano located in the Vvedensky Hotel, the former Vvedenskaya Gymnasium building, on the Petrogradskaya storona. According to Habanos S.A., it opened on 20 October 2022; it has one entrance on the avenue and another from the hotel.',
  `description_es` = 'La Casa del Habano situada en el Vvedensky Hotel, antiguo edificio de la Vvedenskaya Gymnasium, en la Petrogradskaya storona. Según Habanos S.A., abrió el 20 de octubre de 2022; tiene una entrada por la avenida y otra desde el hotel.',
  `description_de` = 'Die Casa del Habano im Vvedensky Hotel, dem ehemaligen Gebäude der Vvedenskaya Gymnasium, auf der Petrogradskaya storona. Laut Habanos S.A. wurde sie am 20. Oktober 2022 eröffnet; sie hat einen Eingang zur Avenue und einen weiteren vom Hotel aus.',
  `description_zh` = 'Casa del Habano 位于 Vvedensky Hotel 内,该酒店所在建筑原为 Vvedenskaya Gymnasium,位于 Petrogradskaya storona。据 Habanos S.A. 称,该店于2022年10月20日开业;一个入口朝向大道,另一个入口通往酒店。',
  `description_ar` = 'Casa del Habano الواقعة في Vvedensky Hotel، المبنى السابق لـ Vvedenskaya Gymnasium، في Petrogradskaya storona. بحسب Habanos S.A.، افتتحت في 20 أكتوبر 2022؛ ولها مدخل على الشارع الرئيسي ومدخل آخر من الفندق.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : habanos.com (franchise inside the Vvedensky Hotel, Petrogradskaya Side ; ouverte le 20 octobre (annonce 2 nov. 2022) ; deux entrées) ; vedenskyhotel.ru (37A Bolshoy Prospekt Petrogradskaya Side, St. Petersburg) ; cigarjournal.com (Ligovsky Avenue 9/31 : adresse de La Casa del Habano et Davidoff (article du 30 avril 2019) = autre établissement)',
  `updated_at` = NOW()
 WHERE `id` = 83 AND `country_id` = 'russia' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Milano — Viale Luigi Majno 26 (angle Via Giovanni Morelli)',
  `description` = 'Bar à vins et spiritueux de Milan. Son site officiel présente, au rez-de-chaussée, une cigar room avec fauteuils et service de bar.',
  `description_en` = 'Wine and spirits bar in Milan. Its official website describes a cigar room on the ground floor, with armchairs and bar service.',
  `description_es` = 'Bar de vinos y licores de Milán. Su sitio web oficial presenta, en la planta baja, una cigar room con sillones y servicio de bar.',
  `description_de` = 'Wein- und Spirituosenbar in Mailand. Auf der offiziellen Website wird im Erdgeschoss ein Cigar Room mit Sesseln und Barservice beschrieben.',
  `description_zh` = '米兰的葡萄酒与烈酒吧。其官方网站介绍，一层设有雪茄室（cigar room），配有扶手椅和吧台服务。',
  `description_ar` = 'بار للنبيذ والمشروبات الروحية في ميلانو. يعرض موقعه الرسمي في الطابق الأرضي cigar room مزودة بمقاعد مريحة وخدمة بار.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : remedymilano.it (Viale Luigi Majno 26 angle Via Morelli ; cigar room avec quatre fauteuils ; lun-sam 18h-1h) ; gamberorosso.it (Presse (résultat de recherche, page non lue en entier) : cigar room, 18h-1h)',
  `updated_at` = NOW()
 WHERE `id` = 89 AND `country_id` = 'italy' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Roma — Via della Barchetta 14, 00186',
  `description` = 'Hôtel de Rome dont le site officiel présente un Cigar Lounge et le bar Charade, qualifié de bar à cigare.',
  `description_en` = 'Hotel de Rome, whose official website presents a Cigar Lounge and the Charade bar, described as a cigar bar.',
  `description_es` = 'Hotel de Rome, cuyo sitio web oficial presenta un Cigar Lounge y el bar Charade, descrito como bar de cigarros.',
  `description_de` = 'Hotel de Rome, dessen offizielle Website eine Cigar Lounge und die Charade Bar vorstellt, die als Zigarrenbar bezeichnet wird.',
  `description_zh` = '罗马酒店 Hotel de Rome，其官方网站介绍了 Cigar Lounge 和 Charade 酒吧，后者被称为雪茄吧。',
  `description_ar` = 'فندق Hotel de Rome، ويعرض موقعه الرسمي Cigar Lounge وبار Charade الموصوف بأنه بار للسيجار.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : hoteldericci.com (Site officiel : Via della Barchetta 14, 00186 Roma ; liste Cellier, Charade (bar à cigare), Cigar Lounge)',
  `updated_at` = NOW()
 WHERE `id` = 90 AND `country_id` = 'italy' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Porto — Loja 016, Edifício Trindade Domus, Rua dos Heróis e Mártires de Angola 81, 4000-285',
  `description` = 'La Casa del Habano de Porto, inaugurée le 28 septembre 2019 près de l''avenue des Aliados, dans l''immeuble Trindade Domus. Distribuée par Empor S.A., distributeur exclusif des Habanos au Portugal.',
  `description_en` = 'The Casa del Habano in Porto, inaugurated on 28 September 2019 near Avenida dos Aliados, in the Trindade Domus building. Distributed by Empor S.A., the exclusive distributor of Habanos in Portugal.',
  `description_es` = 'La Casa del Habano de Oporto, inaugurada el 28 de septiembre de 2019 cerca de la avenida dos Aliados, en el edificio Trindade Domus. Distribuida por Empor S.A., distribuidor exclusivo de Habanos en Portugal.',
  `description_de` = 'Die Casa del Habano in Porto, eröffnet am 28. September 2019 nahe der Avenida dos Aliados im Gebäude Trindade Domus. Vertrieben von Empor S.A., dem exklusiven Habanos-Distributor in Portugal.',
  `description_zh` = '位于波尔图的 Casa del Habano,于2019年9月28日在 Avenida dos Aliados 附近的 Trindade Domus 大楼内落成。由 Empor S.A. 经销,该公司是 Habanos 在葡萄牙的独家经销商。',
  `description_ar` = 'Casa del Habano في بورتو، افتتحت في 28 سبتمبر 2019 قرب Avenida dos Aliados، في مبنى Trindade Domus. توزعها Empor S.A.، الموزع الحصري لمنتجات Habanos في البرتغال.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : habanos.com (Loja 016, Edificio Trindade Domus, Rua dos Heróis e Mártires de Angola 81, 4000-285 Porto ; ouverture 28 septembre 2019) ; habanos.com (article du 15 oct. 2025 : sixième anniversaire, Empor S.A. distributeur exclusif des Habanos au Portugal)',
  `updated_at` = NOW()
 WHERE `id` = 92 AND `country_id` = 'portugal' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Vienne — Kohlmarkt 6, 1010 Wien',
  `description` = 'Maison de tabac (Tabakspezialitätengeschäft) de la famille Mohilla, Kohlmarkt, Vienne ; immatriculée sous le nom Mohilla Tabakspezialitätengeschäft e.U.',
  `description_en` = 'Tobacconist (Tabakspezialitätengeschäft) of the Mohilla family, Kohlmarkt, Vienna; registered as Mohilla Tabakspezialitätengeschäft e.U.',
  `description_es` = 'Estanco (Tabakspezialitätengeschäft) de la familia Mohilla, Kohlmarkt, Viena; inscrito como Mohilla Tabakspezialitätengeschäft e.U.',
  `description_de` = 'Tabakspezialitätengeschäft der Familie Mohilla, Kohlmarkt, Wien; eingetragen als Mohilla Tabakspezialitätengeschäft e.U.',
  `description_zh` = '维也纳 Kohlmarkt 的 Mohilla 家族烟草专卖店（Tabakspezialitätengeschäft）；注册名称为 Mohilla Tabakspezialitätengeschäft e.U.。',
  `description_ar` = 'محل تبغ (Tabakspezialitätengeschäft) لعائلة Mohilla في Kohlmarkt بفيينا؛ مسجّل باسم Mohilla Tabakspezialitätengeschäft e.U.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : derstandard.at (Interview de Maria Mohilla, gérante de la maison de tabac) ; quintessentially.com (Mohilla, Kohlmarkt 6, 1010 Vienna (lu via extrait de recherche))',
  `updated_at` = NOW()
 WHERE `id` = 93 AND `country_id` = 'austria' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Athènes — K. Varnali 42, Nea Erythraia 14671',
  `description` = 'Magasin de cigares Puro Accessori à Nea Erythraia (Athènes). Le site du magasin ne l''identifie pas comme La Casa del Habano ; son statut de franchise reste à établir.',
  `description_en` = 'Cigar shop Puro Accessori in Nea Erythraia (Athens). The shop''s website does not identify it as La Casa del Habano; its franchise status remains to be established.',
  `description_es` = 'Tienda de cigarros Puro Accessori en Nea Erythraia (Atenas). El sitio web de la tienda no la identifica como La Casa del Habano; su condición de franquicia está por establecer.',
  `description_de` = 'Zigarrengeschäft Puro Accessori in Nea Erythraia (Athen). Die Website des Geschäfts weist es nicht als La Casa del Habano aus; sein Franchise-Status ist noch zu klären.',
  `description_zh` = '位于雅典 Nea Erythraia 的雪茄店 Puro Accessori。该店网站未将其标示为 La Casa del Habano；其是否为特许经营店有待确认。',
  `description_ar` = 'متجر السيجار Puro Accessori في Nea Erythraia (أثينا). لا يعرّفه موقع المتجر بوصفه لا كاسا ديل هابانو؛ ولا يزال وضعه كامتياز بحاجة إلى التثبيت.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : puroaccessori.gr (Puro Accessori, K. Varnali 42, Nea Erythraia 14671 ; rubrique « HABANOS SPECIALIST »)',
  `updated_at` = NOW()
 WHERE `id` = 94 AND `country_id` = 'greece' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Kuwait City — Al Khaleej Building, Al Sawani Center, rez-de-chaussée, Abu Baker Street, Salhiya',
  `description` = 'La Casa del Habano de Kuwait City, répertoriée sur lacasadelhabano.com (franchise de Habanos S.A.).',
  `description_en` = 'The Casa del Habano in Kuwait City, listed on lacasadelhabano.com (a Habanos S.A. franchise).',
  `description_es` = 'La Casa del Habano de Kuwait City, incluida en lacasadelhabano.com (franquicia de Habanos S.A.).',
  `description_de` = 'Die Casa del Habano in Kuwait City, auf lacasadelhabano.com verzeichnet (ein Franchise von Habanos S.A.).',
  `description_zh` = '位于科威特城的 Casa del Habano,列于 lacasadelhabano.com(Habanos S.A. 的特许经营店)。',
  `description_ar` = 'Casa del Habano في مدينة الكويت، مدرجة على lacasadelhabano.com (امتياز تجاري تابع لـ Habanos S.A.).',
  `source` = 'à vérifier — relu le 29 octobre 2026 : lacasadelhabano.com (Al Khaleej Building, Al Sawani Center, Ground Floor, Abu Baker Street, Salhiya, Kuwait City) ; lacasadelhabano.com (Koweït : « LA CASA DEL HABANO-KUWAIT CITY » (3 entrées Koweït au total))',
  `updated_at` = NOW()
 WHERE `id` = 103 AND `country_id` = 'kuwait' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Aéroport international du Koweït — Departure, Shop FF-09',
  `description` = 'Point de vente La Casa del Habano à l''aéroport international du Koweït (enseigne Airport Duty Paid au répertoire de lacasadelhabano.com), boutique FF-09, zone Departure.',
  `description_en` = 'La Casa del Habano outlet at Kuwait International Airport (listed as Airport Duty Paid in the lacasadelhabano.com directory), shop FF-09, Departure area.',
  `description_es` = 'Punto de venta La Casa del Habano en el aeropuerto internacional de Kuwait (figura como Airport Duty Paid en el directorio de lacasadelhabano.com), tienda FF-09, zona Departure.',
  `description_de` = 'Verkaufsstelle La Casa del Habano am Internationalen Flughafen Kuwait (im Verzeichnis von lacasadelhabano.com als Airport Duty Paid geführt), Geschäft FF-09, Bereich Departure.',
  `description_zh` = '位于科威特国际机场的 La Casa del Habano 销售点（在 lacasadelhabano.com 名录中以 Airport Duty Paid 为名），店铺 FF-09，Departure 区。',
  `description_ar` = 'نقطة بيع La Casa del Habano في مطار الكويت الدولي (مدرجة باسم Airport Duty Paid في دليل lacasadelhabano.com)، المحل FF-09، منطقة Departure.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : lacasadelhabano.com (Airport Duty Paid — Shop No. FF-09, Kuwait International Airport, Departure) ; lacasadelhabano.com (Koweït : entrées « AIRPORT DUTY PAID » et « KUWAIT DUTY FREE-T 4 TERMINAL »)',
  `updated_at` = NOW()
 WHERE `id` = 104 AND `country_id` = 'kuwait' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Manama — Aéroport international de Bahreïn (zone des départs)',
  `description` = 'Habanos Specialist et Habanos Lounge exploités par Bahrain Duty Free, dans la zone des départs de l''aéroport international de Bahreïn. Les pages de Habanos S.A. ne le désignent pas comme une La Casa del Habano.',
  `description_en` = 'Habanos Specialist and Habanos Lounge operated by Bahrain Duty Free, in the departures area of Bahrain International Airport. The Habanos S.A. pages do not designate it as a La Casa del Habano.',
  `description_es` = 'Habanos Specialist y Habanos Lounge explotados por Bahrain Duty Free, en la zona de salidas del Aeropuerto Internacional de Baréin. Las páginas de Habanos S.A. no lo designan como una La Casa del Habano.',
  `description_de` = 'Habanos Specialist und Habanos Lounge, betrieben von Bahrain Duty Free, im Abflugbereich des Bahrain International Airport. Die Seiten von Habanos S.A. bezeichnen ihn nicht als La Casa del Habano.',
  `description_zh` = 'Habanos Specialist 和 Habanos Lounge，由 Bahrain Duty Free 运营，位于巴林国际机场出发区。Habanos S.A. 的页面未将其列为 La Casa del Habano。',
  `description_ar` = 'Habanos Specialist وHabanos Lounge، تشغّلهما Bahrain Duty Free، في منطقة المغادرة بمطار البحرين الدولي. ولا تصنّفه صفحات Habanos S.A. على أنه لا كاسا ديل هابانو.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : habanos.com (Habanos Specialist and Habanos Lounge, Bahrain Duty Free, Departures Area (article du 30 sept. 2021)) ; habanos.com (Bahrain Duty Free, Departure Area; statut Habanos Specialist (16 déc. 2019); pas de mention La Casa del Habano)',
  `updated_at` = NOW()
 WHERE `id` = 106 AND `country_id` = 'bahrain' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Beyrouth — Aéroport international Rafic Hariri, Terminal Building, Beirut Duty Free',
  `description` = 'La Casa del Habano en duty free de l''aéroport international Rafic Hariri de Beyrouth ; le plan des franchises la classe en Departures (Duty Free).',
  `description_en` = 'The Casa del Habano in the duty free area of Beirut''s Rafic Hariri International Airport; the franchise map classifies it under Departures (Duty Free).',
  `description_es` = 'La Casa del Habano en la zona libre de impuestos del aeropuerto internacional Rafic Hariri de Beirut; el mapa de franquicias la clasifica en Departures (Duty Free).',
  `description_de` = 'Die Casa del Habano im Duty-free-Bereich des Rafic-Hariri-Flughafens in Beirut; der Franchise-Plan führt sie unter Departures (Duty Free).',
  `description_zh` = 'Casa del Habano 位于贝鲁特拉斐克·哈里里国际机场的免税区;特许经营店地图将其归入 Departures (Duty Free)。',
  `description_ar` = 'Casa del Habano في منطقة السوق الحرة بمطار رفيق الحريري الدولي في بيروت؛ وتصنفها خريطة الامتيازات ضمن Departures (Duty Free).',
  `source` = 'à vérifier — relu le 29 octobre 2026 : lacasadelhabano.com (La Casa del Habano, Departures (Duty Free), Beirut ; Rafic Hariri International Airport, Terminal Building) ; lacasadelhabano.com (Liban : 2 entrées seulement (aéroport Departures, Verdun Down Town)) ; cigars.beirutdutyfree.com (Beirut Duty Free, Main Terminal Building ; pas de distinction arrivées/est)',
  `updated_at` = NOW()
 WHERE `id` = 108 AND `country_id` = 'lebanon' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Beyrouth — Verdun, RC Saab Building, Verdun Main Street',
  `description` = 'La Casa del Habano à Verdun, Beyrouth, selon le plan des franchises lacasadelhabano.com.',
  `description_en` = 'La Casa del Habano in Verdun, Beirut, according to the franchise map on lacasadelhabano.com.',
  `description_es` = 'La Casa del Habano en Verdun, Beirut, según el mapa de franquicias de lacasadelhabano.com.',
  `description_de` = 'La Casa del Habano in Verdun, Beirut, laut der Franchise-Karte auf lacasadelhabano.com.',
  `description_zh` = '位于贝鲁特 Verdun 的 La Casa del Habano，依据 lacasadelhabano.com 的特许经营店地图。',
  `description_ar` = 'La Casa del Habano في فردان، بيروت، بحسب خريطة الامتيازات على lacasadelhabano.com.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : lacasadelhabano.com (La Casa del Habano, Verdun, Down Town, Beirut ; RC Saab Building, Verdun Main Street) ; lacasadelhabano.com (La Casa del Habano, Verdun, Down Town, Beirut)',
  `updated_at` = NOW()
 WHERE `id` = 109 AND `country_id` = 'lebanon' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Tokyo — 1-9-5 Nishiazabu, Minato-ku (ARISTO Nishiazabu II, 1F)',
  `description` = 'Boutique et lounge Cigar Club Tokyo, exploités par Cigar Club (TT Japan G.K.) selon son site officiel ; l''adresse d''Azabudai (2-3-9) provient de sources de 2009 et n''apparaît plus sur le site officiel.',
  `description_en` = 'Cigar Club Tokyo boutique and lounge, operated by Cigar Club (TT Japan G.K.) according to its official website; the Azabudai address (2-3-9) comes from 2009 sources and no longer appears on the official website.',
  `description_es` = 'Boutique y lounge Cigar Club Tokyo, explotados por Cigar Club (TT Japan G.K.) según su sitio web oficial; la dirección de Azabudai (2-3-9) procede de fuentes de 2009 y ya no figura en el sitio oficial.',
  `description_de` = 'Boutique und Lounge Cigar Club Tokyo, laut offizieller Website betrieben von Cigar Club (TT Japan G.K.); die Adresse in Azabudai (2-3-9) stammt aus Quellen von 2009 und erscheint nicht mehr auf der offiziellen Website.',
  `description_zh` = 'Cigar Club Tokyo 精品店和雪茄厅，据其官方网站，由 Cigar Club（TT Japan G.K.）运营；麻布台（2-3-9）的地址来自2009年的资料，官方网站上已不再出现。',
  `description_ar` = 'بوتيك وصالة Cigar Club Tokyo، تشغّلهما Cigar Club (TT Japan G.K.) وفق موقعها الرسمي؛ وعنوان Azabudai (2-3-9) مأخوذ من مصادر عام 2009 ولم يعد يظهر على الموقع الرسمي.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : cigarclub.co.jp (CIGAR CLUB TOKYO: 東京都港区西麻布1-9-5 ARISTO西麻布Ⅱ 1F ; exploitant TT Japan G.K. (pied de page)) ; cigarclub.co.jp (Actualités: 2026-10-03 fermeture de CIGAR CLUB THE WESTIN TOKYO ; aucune mention de Azabudai) ; lacasadelhabano.com (Seule entrée Japon: ''LCDH Tokio Lcdh By Le Connaisseur Roppongi'' (pas Cigar Club))',
  `updated_at` = NOW()
 WHERE `id` = 116 AND `country_id` = 'japan' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Tokyo — 8-5-6 Ginza, Chuo-ku',
  `description` = 'Boutique Davidoff de Ginza (Chuo-ku), exploitée par Bluebell Japan d''après un communiqué de 2013 ; statut actuel non confirmé par une page officielle.',
  `description_en` = 'Davidoff boutique in Ginza (Chuo-ku), operated by Bluebell Japan according to a 2013 press release; current status not confirmed by an official page.',
  `description_es` = 'Tienda Davidoff de Ginza (Chuo-ku), operada por Bluebell Japan según un comunicado de 2013; estado actual no confirmado por una página oficial.',
  `description_de` = 'Davidoff-Boutique in Ginza (Chuo-ku), laut einer Mitteilung von 2013 von Bluebell Japan betrieben; der aktuelle Status ist durch keine offizielle Seite bestätigt.',
  `description_zh` = '位于银座(中央区)的 Davidoff 精品店,据2013年的一份新闻稿称由 Bluebell Japan 运营;目前的状态尚无官方页面确认。',
  `description_ar` = 'متجر Davidoff في غينزا (Chuo-ku)، تديره Bluebell Japan بحسب بيان صحفي صدر عام 2013؛ ولم تؤكد أي صفحة رسمية وضعه الحالي.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : halfwheel.com (Davidoff of Geneva Ginza, 8-5-6 Ginza, Chuo-ku ; gere par Bluebell Japan (communique 2013)) ; bluebellgroup.com (Communiqué Bluebell de déc. 2023 (satellite KIX) ; ne mentionne pas Ginza, ne la dément pas)',
  `updated_at` = NOW()
 WHERE `id` = 117 AND `country_id` = 'japan' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Tokyo — DM Bldg., 7-18-11 Roppongi, Minato-ku',
  `description` = 'Boutique-lounge Le Connaisseur Roppongi, répertoriée comme La Casa del Habano de Tokyo dans le répertoire des franchises de lacasadelhabano.com ; l''adresse est celle de ce répertoire.',
  `description_en` = 'Le Connaisseur Roppongi shop-lounge, listed as La Casa del Habano Tokyo in the franchise directory of lacasadelhabano.com; the address is the one given in that directory.',
  `description_es` = 'Tienda-salón Le Connaisseur Roppongi, registrada como La Casa del Habano de Tokio en el directorio de franquicias de lacasadelhabano.com; la dirección es la de ese directorio.',
  `description_de` = 'Shop-Lounge Le Connaisseur Roppongi, im Franchise-Verzeichnis von lacasadelhabano.com als La Casa del Habano Tokio geführt; die Adresse stammt aus diesem Verzeichnis.',
  `description_zh` = 'Le Connaisseur Roppongi 店铺兼休息室，在 lacasadelhabano.com 的特许经营店名录中被列为东京的 La Casa del Habano；地址取自该名录。',
  `description_ar` = 'متجر وصالة Le Connaisseur Roppongi، مدرج بصفته La Casa del Habano طوكيو في دليل الامتيازات على lacasadelhabano.com؛ والعنوان هو الوارد في هذا الدليل.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : lacasadelhabano.com (LCDH Tokio by Le Connaisseur Roppongi, DM Bldg. 18-11, Roppongi 7, Minato-ku ; +81 3 37463636) ; lacasadelhabano.com (Répertoire officiel des franchises: entrée Tokyo ''LCDH Tokio Lcdh By Le Connaisseur Roppongi'') ; cigarclub.co.jp (Cigar Club (même contact e-mail cigarclub.co.jp que la fiche LCDH) ne liste pas Le Connaisseur parmi ses 3 boutiques)',
  `updated_at` = NOW()
 WHERE `id` = 118 AND `country_id` = 'japan' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Tokyo — B1F Sunroser Daikanyama, 11-6 Sarugaku-cho, Shibuya-ku',
  `description` = 'Cigar bar Tableaux Lounge, au sous-sol du Sunroser Daikanyama (Sarugaku-cho, Shibuya-ku), géré par Global Dining d''après son site.',
  `description_en` = 'Cigar bar Tableaux Lounge, in the basement of the Sunroser Daikanyama (Sarugaku-cho, Shibuya-ku), managed by Global Dining according to its website.',
  `description_es` = 'Bar de cigarros Tableaux Lounge, en el sótano del Sunroser Daikanyama (Sarugaku-cho, Shibuya-ku), gestionado por Global Dining según su sitio web.',
  `description_de` = 'Zigarrenbar Tableaux Lounge im Untergeschoss des Sunroser Daikanyama (Sarugaku-cho, Shibuya-ku), laut ihrer Website von Global Dining geführt.',
  `description_zh` = '雪茄吧 Tableaux Lounge，位于 Sunroser Daikanyama（涩谷区猿乐町）的地下一层，据其网站，由 Global Dining 管理。',
  `description_ar` = 'بار السيجار Tableaux Lounge، في الطابق السفلي من Sunroser Daikanyama (Sarugaku-cho، Shibuya-ku)، تديره Global Dining بحسب موقعه.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : tableauxlounge.jp (東京都渋谷区猿楽町11-6 サンローゼ代官山 B1F ; 厳選されたシガー ; 20:00～26:00) ; global-dining.com (Maison mère: ''タブローズラウンジ (Tableaux Lounge)'' genre シガーバー, lien vers tableauxlounge.jp)',
  `updated_at` = NOW()
 WHERE `id` = 119 AND `country_id` = 'japan' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Tokyo — Cerulean Tower Tokyu Hotel, 26-1 Sakuragaokacho, Shibuya-ku (2e étage Tower Side Terrace)',
  `description` = 'Bar à cigares de l''hôtel Cerulean Tower Tokyu, au 2e étage du Tower Side Terrace ; entrée par la terrasse extérieure autour de l''entrée de l''hôtel (site de l''hôtel).',
  `description_en` = 'Cigar bar of the Cerulean Tower Tokyu Hotel, on the 2nd floor of the Tower Side Terrace; entrance via the outdoor terrace around the hotel entrance (hotel website).',
  `description_es` = 'Bar de cigarros del hotel Cerulean Tower Tokyu, en la 2.ª planta del Tower Side Terrace; entrada por la terraza exterior alrededor de la entrada del hotel (sitio web del hotel).',
  `description_de` = 'Zigarrenbar des Hotels Cerulean Tower Tokyu im 2. Obergeschoss der Tower Side Terrace; Zugang über die Außenterrasse rund um den Hoteleingang (Website des Hotels).',
  `description_zh` = 'Cerulean Tower Tokyu 酒店的雪茄吧,位于 Tower Side Terrace 的2楼;入口经由酒店入口周围的室外露台(来自酒店网站)。',
  `description_ar` = 'بار السيجار في فندق Cerulean Tower Tokyu، في الطابق الثاني من Tower Side Terrace؛ والدخول عبر الشرفة الخارجية المحيطة بمدخل الفندق (موقع الفندق).',
  `source` = 'à vérifier — relu le 29 octobre 2026 : tokyuhotels.co.jp (Shibuya R261 CIGAR & ROCK, 26-1 Sakuragaokacho, 2F Tower Side Terrace ; aucun avis de fermeture) ; tokyuhotels.co.jp (L''hôtel publie ses bars: Bellovisto, R261 Cigar & Rock, JZ Brat, Zabou (R261 y figure)) ; j-hotel.or.jp (R261 CIGAR & ROCK ; 16h-24h lun-sam (association hôtelière))',
  `updated_at` = NOW()
 WHERE `id` = 120 AND `country_id` = 'japan' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Beijing — North Entrance, The Westin Beijing, 9B Financial Street, Xicheng District',
  `description` = 'La Casa del Habano de Beijing, répertoriée sur le plan des franchises de lacasadelhabano.com à l''entrée nord du Westin Beijing Financial Street, 9B Financial Street, Xicheng.',
  `description_en` = 'La Casa del Habano in Beijing, listed on the franchise map of lacasadelhabano.com at the north entrance of the Westin Beijing Financial Street, 9B Financial Street, Xicheng.',
  `description_es` = 'La Casa del Habano de Pekín, registrada en el mapa de franquicias de lacasadelhabano.com en la entrada norte del Westin Beijing Financial Street, 9B Financial Street, Xicheng.',
  `description_de` = 'La Casa del Habano in Peking, auf der Franchise-Karte von lacasadelhabano.com am Nordeingang des Westin Beijing Financial Street, 9B Financial Street, Xicheng, verzeichnet.',
  `description_zh` = '北京的 La Casa del Habano，在 lacasadelhabano.com 的特许经营店地图上登记于北京金融街威斯汀酒店（Westin Beijing Financial Street）北入口，西城区金融街 9B（9B Financial Street, Xicheng）。',
  `description_ar` = 'La Casa del Habano في بكين، مدرجة على خريطة الامتيازات في lacasadelhabano.com عند المدخل الشمالي لفندق Westin Beijing Financial Street، 9B Financial Street، Xicheng.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : lacasadelhabano.com (North Entrance, The Westin Beijing, 9B Financial Street, Xicheng District, 100032)',
  `updated_at` = NOW()
 WHERE `id` = 122 AND `country_id` = 'china' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Beijing — Shop F1163, The St. Regis Beijing, 21 Jianguomen Outer Street',
  `description` = 'La Casa del Habano de Beijing, répertoriée sur le plan des franchises de lacasadelhabano.com dans la boutique F1163 du St. Regis Beijing, 21 Jianguomenwai Dajie.',
  `description_en` = 'La Casa del Habano in Beijing, listed on the franchise map of lacasadelhabano.com in shop F1163 of the St. Regis Beijing, 21 Jianguomenwai Dajie.',
  `description_es` = 'La Casa del Habano de Pekín, registrada en el mapa de franquicias de lacasadelhabano.com en la tienda F1163 del St. Regis Beijing, 21 Jianguomenwai Dajie.',
  `description_de` = 'La Casa del Habano in Peking, auf der Franchise-Karte von lacasadelhabano.com im Geschäft F1163 des St. Regis Beijing, 21 Jianguomenwai Dajie, aufgeführt.',
  `description_zh` = '北京的 La Casa del Habano，在 lacasadelhabano.com 的特许经营店地图上登记于北京瑞吉酒店 St. Regis Beijing 的 F1163 号店铺，地址 21 Jianguomenwai Dajie。',
  `description_ar` = 'لا كاسا ديل هابانو في بكين، مدرجة على خريطة الامتيازات في lacasadelhabano.com في المحل F1163 بفندق St. Regis Beijing، 21 Jianguomenwai Dajie.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : lacasadelhabano.com (Shop No.F1163, The St. Regis Hotel, 21 Jianguomen Outer St. 100020 Beijing)',
  `updated_at` = NOW()
 WHERE `id` = 123 AND `country_id` = 'china' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Bangkok — Mandarin Oriental Bangkok, 48 Oriental Avenue, Bang Rak',
  `description` = 'Franchise La Casa del Habano installée dans l''hôtel Mandarin Oriental de Bangkok. Le répertoire des franchises de lacasadelhabano.com liste deux autres Casas à Bangkok, dans des hôtels Kempinski.',
  `description_en` = 'La Casa del Habano franchise located in the Mandarin Oriental hotel in Bangkok. The franchise directory on lacasadelhabano.com lists two other Casas in Bangkok, in Kempinski hotels.',
  `description_es` = 'Franquicia La Casa del Habano instalada en el hotel Mandarin Oriental de Bangkok. El directorio de franquicias de lacasadelhabano.com incluye otras dos Casas en Bangkok, en hoteles Kempinski.',
  `description_de` = 'Franchise der Casa del Habano im Hotel Mandarin Oriental in Bangkok. Das Franchise-Verzeichnis von lacasadelhabano.com führt zwei weitere Casas in Bangkok auf, in Kempinski-Hotels.',
  `description_zh` = 'La Casa del Habano 特许经营店,设在曼谷文华东方酒店(Mandarin Oriental)内。lacasadelhabano.com 的特许经营店名录还列出曼谷另外两家 Casa,均位于 Kempinski 酒店。',
  `description_ar` = 'امتياز La Casa del Habano في فندق Mandarin Oriental في بانكوك. ويدرج دليل الامتيازات على lacasadelhabano.com فرعين آخرين من Casa في بانكوك، في فندقي Kempinski.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : lacasadelhabano.com (Thailand : LCDH Bangkok/Mandarin Oriental ; Kempinski Siam Paragon ; Kempinski Sindhorn) ; bkmagazine.com (Mandarin Oriental Hotel, 48 Oriental Avenue ; 02-267-1596 ; 12pm-1am (article du 15 nov. 2018))',
  `updated_at` = NOW()
 WHERE `id` = 136 AND `country_id` = 'thailand' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Phnom Penh — Raffles Hotel Le Royal, 92 Rukhak Vithei Daun Penh',
  `description` = 'Cohiba Atmosphere, point de vente et salon Habanos situé dans le Raffles Hotel Le Royal de Phnom Penh ; exploitant indiqué : Pacific Cigar Company.',
  `description_en` = 'Cohiba Atmosphere, Habanos outlet and lounge located in the Raffles Hotel Le Royal in Phnom Penh; operator stated: Pacific Cigar Company.',
  `description_es` = 'Cohiba Atmosphere, punto de venta y salón Habanos situado en el Raffles Hotel Le Royal de Phnom Penh; operador indicado: Pacific Cigar Company.',
  `description_de` = 'Cohiba Atmosphere, Habanos-Verkaufsstelle und -Lounge im Raffles Hotel Le Royal in Phnom Penh; angegebener Betreiber: Pacific Cigar Company.',
  `description_zh` = 'Cohiba Atmosphere，位于金边 Raffles Hotel Le Royal 内的 Habanos 销售点和雪茄厅；所注明的运营方：Pacific Cigar Company。',
  `description_ar` = 'Cohiba Atmosphere، نقطة بيع وصالة Habanos تقع في فندق Raffles Hotel Le Royal في بنوم بنه؛ الجهة المشغّلة المذكورة: Pacific Cigar Company.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : habanos.com (Cohiba Atmosphere à l''intérieur du Raffles Hotel Le Royal, 92 Rukhak Vithei Daun Penh (article du 28 mars 2018)) ; cambodgemag.com (Cohiba Atmosphere located at the Raffles Hotel Le Royal (ouverture du festival le 23 octobre 2025)) ; cigarjournal.com (exploitant Pacific Cigar Company, article du 17 janvier 2022)',
  `updated_at` = NOW()
 WHERE `id` = 139 AND `country_id` = 'cambodia' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Ho Chi Minh-Ville — 74B Hai Ba Trung St., Ben Nghe Ward, D1',
  `description` = 'La Casa del Habano de Ho Chi Minh-Ville, boutique et salon du réseau La Casa del Habano, au 74B Hai Ba Trung, quartier de Bến Nghé, 1er arrondissement. Habanos S.A. annonçait une préouverture le 1er août 2021 ; une autre source situe l''ouverture en décembre 2021 : les dates divergent. Exploitée par Avanti Group avec Golden Phoenix, distributeur des Habanos au Vietnam.',
  `description_en` = 'La Casa del Habano in Ho Chi Minh City, a shop and lounge of the La Casa del Habano network, at 74B Hai Ba Trung, Bến Nghé ward, District 1. Habanos S.A. announced a pre-opening on 1 August 2021; another source places the opening in December 2021: the dates differ. Operated by Avanti Group with Golden Phoenix, distributor of Habanos in Vietnam.',
  `description_es` = 'La Casa del Habano de Ho Chi Minh, tienda y salón de la red La Casa del Habano, en 74B Hai Ba Trung, barrio de Bến Nghé, distrito 1. Habanos S.A. anunciaba una preapertura el 1 de agosto de 2021; otra fuente sitúa la apertura en diciembre de 2021: las fechas difieren. Explotada por Avanti Group con Golden Phoenix, distribuidor de Habanos en Vietnam.',
  `description_de` = 'La Casa del Habano in Ho-Chi-Minh-Stadt, Geschäft und Lounge des Netzwerks La Casa del Habano, 74B Hai Ba Trung, Bezirk Bến Nghé, 1. Bezirk. Habanos S.A. kündigte eine Voreröffnung am 1. August 2021 an; eine andere Quelle nennt die Eröffnung im Dezember 2021: die Daten weichen voneinander ab. Betrieben von Avanti Group mit Golden Phoenix, dem Habanos-Distributeur in Vietnam.',
  `description_zh` = '胡志明市的 La Casa del Habano，属于 La Casa del Habano 网络的店铺和雪茄厅，地址 74B Hai Ba Trung，Bến Nghé 坊，第1郡。Habanos S.A. 曾宣布2021年8月1日试营业；另一来源称开业时间为2021年12月：两者日期不一致。由 Avanti Group 与 Golden Phoenix（Habanos 在越南的经销商）共同运营。',
  `description_ar` = 'لا كاسا ديل هابانو في مدينة هو تشي منه، متجر وصالة ضمن شبكة لا كاسا ديل هابانو، في 74B Hai Ba Trung، حي Bến Nghé، المنطقة 1. أعلنت Habanos S.A. افتتاحاً تمهيدياً في 1 أغسطس 2021؛ ويضع مصدر آخر الافتتاح في ديسمبر 2021: التواريخ متباينة. تشغّلها Avanti Group مع Golden Phoenix، موزّع Habanos في فيتنام.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : habanos.com (set for Soft Opening on 1st of August 2021 ; 74B Hai Ba Trung St., Ben Nghe Ward, District 1) ; lacasadelhabano.vn (74B Đường Hai Bà Trưng, phường Bến Nghé, Quận 1 ; ouverture 9:00-00:00) ; cigarjournal.com (via résultat de recherche (page non lue directement) : ouverture décembre 2021, Avanti Group + Golden Phoenix)',
  `updated_at` = NOW()
 WHERE `id` = 140 AND `country_id` = 'vietnam' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Windsor, Ontario',
  `description` = 'La Casa del Habano de Windsor, franchise Habanos de l''Ontario. Habanos a rapporté en août 2025 un dîner tenu le 15 juillet pour les 30 ans de l''enseigne à Windsor, réunissant plus de 50 passionnés.',
  `description_en` = 'The Casa del Habano in Windsor, a Habanos franchise in Ontario. In August 2025 Habanos reported a dinner held on 15 July for the brand''s 30 years in Windsor, bringing together more than 50 enthusiasts.',
  `description_es` = 'La Casa del Habano de Windsor, franquicia Habanos de Ontario. En agosto de 2025, Habanos informó de una cena celebrada el 15 de julio por los 30 años de la enseña en Windsor, que reunió a más de 50 aficionados.',
  `description_de` = 'Die Casa del Habano in Windsor, ein Habanos-Franchise in Ontario. Habanos berichtete im August 2025 von einem Abendessen am 15. Juli zum 30-jährigen Bestehen der Marke in Windsor, bei dem mehr als 50 Liebhaber zusammenkamen.',
  `description_zh` = '位于温莎的 Casa del Habano,是安大略省的 Habanos 特许经营店。Habanos 于2025年8月报道,7月15日为该品牌在温莎开业30周年举办了一场晚宴,50多位爱好者出席。',
  `description_ar` = 'Casa del Habano في وندسور، امتياز Habanos في أونتاريو. أفادت Habanos في أغسطس 2025 بإقامة عشاء في 15 يوليو بمناسبة مرور 30 عامًا على العلامة في وندسور، جمع أكثر من 50 من المهتمين.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : habanos.com (article du 11 août 2025 : dîner du 15 juillet, plus de 50 passionnés, 30 ans de franchise à Windsor) ; lacasadelhabano.com (LCDH Windsor listée (Canada : Edmonton, Windsor)) ; cigaraficionado.com (2020 : Windsor fermée près de trois ans après un incendie voisin de 2017, réouverture envisagée)',
  `updated_at` = NOW()
 WHERE `id` = 155 AND `country_id` = 'canada' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Santiago — Isidora Goyenechea 3000, Local S-104 (niveau -1), Hotel W, Las Condes',
  `description` = 'La Casa del Habano de Santiago, au niveau -1 de l''hôtel W, Las Condes. Le site de la boutique et le plan des franchises lacasadelhabano.com la répertorient à cette adresse ; habanos.com cite Intercigar Comercial Limitada comme exploitant et Puro Tabaco S.A. comme distributeur (annonce de 2012).',
  `description_en` = 'La Casa del Habano in Santiago, on level -1 of the W hotel, Las Condes. The shop''s website and the franchise map on lacasadelhabano.com list it at this address; habanos.com names Intercigar Comercial Limitada as operator and Puro Tabaco S.A. as distributor (2012 announcement).',
  `description_es` = 'La Casa del Habano de Santiago, en el nivel -1 del hotel W, Las Condes. El sitio de la tienda y el mapa de franquicias de lacasadelhabano.com la registran en esta dirección; habanos.com cita a Intercigar Comercial Limitada como operador y a Puro Tabaco S.A. como distribuidor (anuncio de 2012).',
  `description_de` = 'La Casa del Habano in Santiago, auf Ebene -1 des Hotels W, Las Condes. Die Website des Geschäfts und die Franchise-Karte von lacasadelhabano.com führen sie unter dieser Adresse; habanos.com nennt Intercigar Comercial Limitada als Betreiber und Puro Tabaco S.A. als Vertriebspartner (Meldung von 2012).',
  `description_zh` = '圣地亚哥的 La Casa del Habano，位于 W 酒店（Las Condes）负一层。该店网站及 lacasadelhabano.com 的特许经营店地图均将其登记在此地址；habanos.com 称 Intercigar Comercial Limitada 为运营方、Puro Tabaco S.A. 为经销商（2012 年公告）。',
  `description_ar` = 'La Casa del Habano في سانتياغو، في المستوى -1 من فندق W، Las Condes. يدرجها موقع المتجر وخريطة الامتيازات على lacasadelhabano.com في هذا العنوان؛ وتذكر habanos.com أن Intercigar Comercial Limitada هي المشغّلة وأن Puro Tabaco S.A. هي الموزّعة (إعلان عام 2012).',
  `source` = 'à vérifier — relu le 29 octobre 2026 : casadelhabanochile.cl (Hotel W, Isidora Goyenechea 3000, S-104 (nivel -1), Las Condes) ; lacasadelhabano.com (Hotel W, Ave. Isidora Goyenechea 3000, Local S104, Santiago de Chile) ; habanos.com (article du 19 sept. 2016 ; Intercigar Comercial Limitada / Puro Tabaco S.A. (résultat de recherche habanos.com, 2012))',
  `updated_at` = NOW()
 WHERE `id` = 159 AND `country_id` = 'chile' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Lima - Malecón Bajada Balta 650 (C.C. Balta Shopping), Miraflores',
  `description` = 'La Casa del Habano de Miraflores, à Lima, dans le centre commercial Balta Shopping (Malecón Bajada Balta 650).',
  `description_en` = 'La Casa del Habano in Miraflores, Lima, in the Balta Shopping mall (Malecón Bajada Balta 650).',
  `description_es` = 'La Casa del Habano de Miraflores, en Lima, en el centro comercial Balta Shopping (Malecón Bajada Balta 650).',
  `description_de` = 'La Casa del Habano in Miraflores, Lima, im Einkaufszentrum Balta Shopping (Malecón Bajada Balta 650).',
  `description_zh` = '利马米拉弗洛雷斯的 La Casa del Habano，位于 Balta Shopping 购物中心内（Malecón Bajada Balta 650）。',
  `description_ar` = 'لا كاسا ديل هابانو في ميرافلوريس بليما، داخل مركز Balta Shopping التجاري (Malecón Bajada Balta 650).',
  `source` = 'à vérifier — relu le 29 octobre 2026 : lacasadelhabano.pe (C.C. Balta Shopping, Miraflores ; 10 a. m. a 10 p. m. ; deux tiendas, Larcomar absent) ; lacasadelhabano.com (LCDH Miraflores - Malecón Bajada Balta No 650, Miraflores, Lima)',
  `updated_at` = NOW()
 WHERE `id` = 161 AND `country_id` = 'peru' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Lima - Av. La Encalada 1601, Santiago de Surco',
  `description` = 'La Casa del Habano de Santiago de Surco, à Lima (Av. La Encalada 1601).',
  `description_en` = 'The Casa del Habano in Santiago de Surco, Lima (Av. La Encalada 1601).',
  `description_es` = 'La Casa del Habano de Santiago de Surco, en Lima (Av. La Encalada 1601).',
  `description_de` = 'Die Casa del Habano in Santiago de Surco, Lima (Av. La Encalada 1601).',
  `description_zh` = '位于利马圣地亚哥-德苏尔科(Santiago de Surco)的 Casa del Habano(Av. La Encalada 1601)。',
  `description_ar` = 'Casa del Habano في Santiago de Surco بمدينة ليما (Av. La Encalada 1601).',
  `source` = 'à vérifier — relu le 29 octobre 2026 : lacasadelhabano.com (Av. Encalada N°1601, Santiago de Surco, Lima, Perú) ; lacasadelhabano.pe (Av. La Encalada 1601 ; 10:30 a. m. a 6:30 p. m)',
  `updated_at` = NOW()
 WHERE `id` = 162 AND `country_id` = 'peru' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'San José — 300 m à l''ouest de Plaza Mayor, face au Boulevard Pavas (Rohrmoser)',
  `description` = 'La Casa del Habano de San José, franchise du réseau La Casa del Habano. Selon Habanos S.A., de nouvelles installations de plus de 450 m² ont été inaugurées le 9 mars 2022 sur le boulevard Rohrmoser.',
  `description_en` = 'La Casa del Habano in San José, a franchise of the La Casa del Habano network. According to Habanos S.A., new premises of more than 450 m² were inaugurated on 9 March 2022 on Rohrmoser boulevard.',
  `description_es` = 'La Casa del Habano de San José, franquicia de la red La Casa del Habano. Según Habanos S.A., el 9 de marzo de 2022 se inauguraron nuevas instalaciones de más de 450 m² en el bulevar Rohrmoser.',
  `description_de` = 'La Casa del Habano in San José, Franchise des Netzwerks La Casa del Habano. Laut Habanos S.A. wurden am 9. März 2022 neue Räumlichkeiten von mehr als 450 m² am Boulevard Rohrmoser eingeweiht.',
  `description_zh` = '圣何塞的 La Casa del Habano，属 La Casa del Habano 网络的特许经营店。据 Habanos S.A. 称，2022 年 3 月 9 日在 Rohrmoser 大道启用了面积超过 450 平方米的新场地。',
  `description_ar` = 'La Casa del Habano في سان خوسيه، امتياز ضمن شبكة La Casa del Habano. بحسب Habanos S.A.، دُشّنت في 9 مارس 2022 منشآت جديدة تزيد مساحتها على 450 م² في جادة Rohrmoser.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : habanos.com (Inaugurée le 9 mars 2022 ; ''over 450m2'' ; ''the elegant Rohrmoser Boulevard'' (article du 18 mars 2022)) ; lacasadelhabano.com (Adresse : 300 metros Oeste de Plaza Mayor, frente a Boulevard Pavas, San José) ; habanos.com (Activités au ''La Casa del Habano in San José'', 15-17 mai 2025 (article du 2 juin 2025))',
  `updated_at` = NOW()
 WHERE `id` = 164 AND `country_id` = 'costarica' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Montego Bay — Jimmy Cliff Boulevard',
  `description` = 'La Casa del Habano de Montego Bay, répertoriée sur lacasadelhabano.com sous l''intitulé LCDH Montego Bay / Jimmy Cliff, Jimmy Cliff Boulevard. Le répertoire ne la rattache pas au resort Half Moon.',
  `description_en` = 'La Casa del Habano in Montego Bay, listed on lacasadelhabano.com as LCDH Montego Bay / Jimmy Cliff, Jimmy Cliff Boulevard. The directory does not link it to the Half Moon resort.',
  `description_es` = 'La Casa del Habano de Montego Bay, registrada en lacasadelhabano.com como LCDH Montego Bay / Jimmy Cliff, Jimmy Cliff Boulevard. El directorio no la vincula con el resort Half Moon.',
  `description_de` = 'La Casa del Habano in Montego Bay, auf lacasadelhabano.com als LCDH Montego Bay / Jimmy Cliff, Jimmy Cliff Boulevard, aufgeführt. Das Verzeichnis bringt sie nicht mit dem Half Moon Resort in Verbindung.',
  `description_zh` = '蒙特哥贝的 La Casa del Habano，在 lacasadelhabano.com 上登记为 LCDH Montego Bay / Jimmy Cliff，地址 Jimmy Cliff Boulevard。该名录未将其与 Half Moon 度假村关联。',
  `description_ar` = 'لا كاسا ديل هابانو في مونتيغو باي، مدرجة على lacasadelhabano.com باسم LCDH Montego Bay / Jimmy Cliff، Jimmy Cliff Boulevard. ولا يربطها الدليل بمنتجع Half Moon.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : lacasadelhabano.com (LCDH Montego Bay / Jimmy Cliff — Address: Jimmy Cliff Boulevard, Montego Bay) ; lacasadelhabano.com (Jamaïque : seule entrée Montego Bay / Jimmy Cliff ; pas de Half Moon) ; halfmoon.com (Liste de 6 bars/cafés (Lester''s, North Pointe, Maakit, Ital Café, Hammock, 19th Hole) : aucun cigare)',
  `updated_at` = NOW()
 WHERE `id` = 167 AND `country_id` = 'jamaica' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'George Town, Grand Cayman — 7 Shedden Road, KY1-1106',
  `description` = 'La Casa del Habano de Grand Cayman, répertoriée sur le plan des franchises de lacasadelhabano.com au 7 Shedden Road, George Town.',
  `description_en` = 'The Casa del Habano in Grand Cayman, listed on the franchise map of lacasadelhabano.com at 7 Shedden Road, George Town.',
  `description_es` = 'La Casa del Habano de Gran Caimán, incluida en el mapa de franquicias de lacasadelhabano.com en 7 Shedden Road, George Town.',
  `description_de` = 'Die Casa del Habano auf Grand Cayman, im Franchise-Plan von lacasadelhabano.com verzeichnet unter 7 Shedden Road, George Town.',
  `description_zh` = '位于大开曼岛的 Casa del Habano,列于 lacasadelhabano.com 的特许经营店地图,地址:7 Shedden Road, George Town。',
  `description_ar` = 'Casa del Habano في جراند كايمان، مدرجة على خريطة الامتيازات في lacasadelhabano.com، العنوان: 7 Shedden Road, George Town.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : lacasadelhabano.com (LCDH Grand Cayman — 7 Shedden Road, Georgetown, KY1-1106; +1 345 946 4666) ; caribjournal.com (hidden down a long corridor off Harbour Drive (article du 4 déc. 2016, sans adresse))',
  `updated_at` = NOW()
 WHERE `id` = 173 AND `country_id` = 'caymanisles' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Calle 21 y O, Vedado, La Havane',
  `description` = 'La Casa del Habano de l''Hotel Nacional de Cuba, hôtel situé calle 21 y O, dans le quartier du Vedado, à La Havane.',
  `description_en` = 'La Casa del Habano at the Hotel Nacional de Cuba, a hotel located on calle 21 y O, in the Vedado district, Havana.',
  `description_es` = 'La Casa del Habano del Hotel Nacional de Cuba, hotel situado en la calle 21 y O, en el barrio del Vedado, La Habana.',
  `description_de` = 'La Casa del Habano im Hotel Nacional de Cuba, einem Hotel in der calle 21 y O im Stadtteil Vedado, Havanna.',
  `description_zh` = '位于哈瓦那 Vedado 区 calle 21 y O 的 Hotel Nacional de Cuba 内的 La Casa del Habano。',
  `description_ar` = 'La Casa del Habano في فندق Hotel Nacional de Cuba، الواقع في calle 21 y O بحي Vedado في هافانا.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : lacasadelhabano.com (Hotel Nacional de Cuba, Calle 21 y O, Vedado, Plaza, La Habana) ; cigaraficionado.com (La Casa del Habano, Hotel Nacional, Calle 21 y O, Vedado (guide 2011))',
  `updated_at` = NOW()
 WHERE `id` = 175 AND `country_id` = 'cuba' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Calle Mercaderes esq. Amargura, Habana Vieja, La Havane',
  `description` = 'La Casa del Habano de l''hôtel Conde de Villanueva, calle Mercaderes, dans la Vieille Havane (La Habana Vieja), à La Havane.',
  `description_en` = 'La Casa del Habano in the Conde de Villanueva hotel, calle Mercaderes, in Old Havana (La Habana Vieja), Havana.',
  `description_es` = 'La Casa del Habano del hotel Conde de Villanueva, calle Mercaderes, en La Habana Vieja, La Habana.',
  `description_de` = 'La Casa del Habano im Hotel Conde de Villanueva, calle Mercaderes, in der Altstadt von Havanna (La Habana Vieja), Havanna.',
  `description_zh` = '哈瓦那的 La Casa del Habano，位于老哈瓦那（La Habana Vieja）Mercaderes 街的 Conde de Villanueva 酒店内。',
  `description_ar` = 'لا كاسا ديل هابانو في فندق Conde de Villanueva، شارع Mercaderes، في هافانا القديمة (La Habana Vieja)، هافانا.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : lacasadelhabano.com (Calle Mercaderes, esq. Amargura, Habana Vieja, La Habana) ; cubaplusmagazine.com (corner of Lamparilla and Mercaderes) ; cigaraficionado.com (Hotel Conde de Villanueva, Mercaderes, esquina Lamparilla (guide 2011))',
  `updated_at` = NOW()
 WHERE `id` = 176 AND `country_id` = 'cuba' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Calle Bernaza no 1, entre Obispo et O''Reilly, Habana Vieja, La Havane',
  `description` = 'La Casa del Habano Partagás, boutique de La Havane installée calle Bernaza no 1, dans la Vieille Havane. Elle occupait auparavant le rez-de-chaussée de la manufacture Partagás, calle Industria 520, fermée en juillet 2020 selon cigars-connect.com.',
  `description_en` = 'La Casa del Habano Partagás, a shop in Havana located at calle Bernaza no. 1, in Old Havana. It previously occupied the ground floor of the Partagás factory, calle Industria 520, closed in July 2020 according to cigars-connect.com.',
  `description_es` = 'La Casa del Habano Partagás, tienda de La Habana situada en calle Bernaza n.º 1, en La Habana Vieja. Ocupaba antes la planta baja de la fábrica Partagás, calle Industria 520, cerrada en julio de 2020 según cigars-connect.com.',
  `description_de` = 'La Casa del Habano Partagás, ein Geschäft in Havanna in der calle Bernaza Nr. 1 in der Altstadt (Habana Vieja). Zuvor befand es sich im Erdgeschoss der Partagás-Manufaktur, calle Industria 520, die laut cigars-connect.com im Juli 2020 geschlossen wurde.',
  `description_zh` = 'La Casa del Habano Partagás,哈瓦那的一家商店,位于老哈瓦那的 calle Bernaza no. 1。此前设在 Partagás 工厂(calle Industria 520)的底层,该工厂据 cigars-connect.com 称已于2020年7月关闭。',
  `description_ar` = 'La Casa del Habano Partagás، متجر في هافانا يقع في calle Bernaza no. 1 في هافانا القديمة. كان يشغل سابقًا الطابق الأرضي من مصنع Partagás في calle Industria 520، الذي أُغلق في يوليو 2020 بحسب cigars-connect.com.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : lacasadelhabano.com (Calle Bernaza No.1, between Obispo and O''Reilly, Habana Vieja) ; cigars-connect.com (Now located at 1 Bernaza Street, very close to El Floridita) ; cigaraficionado.com (Store closed after partial roof collapse at Partagás factory (2020))',
  `updated_at` = NOW()
 WHERE `id` = 177 AND `country_id` = 'cuba' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Calle Neptuno entre Zulueta y Monserrate (Gran Hotel Manzana Kempinski), Habana Vieja, La Havane',
  `description` = 'Cohiba Atmosphere, espace de Habanos S.A. situé dans la galerie commerciale du Gran Hotel Manzana Kempinski, calle Neptuno, entre Zulueta et Monserrate, à La Havane. Ouvert en juillet 2017 selon Habanos S.A.',
  `description_en` = 'Cohiba Atmosphere, a Habanos S.A. space located in the shopping arcade of the Gran Hotel Manzana Kempinski, calle Neptuno, between Zulueta and Monserrate, Havana. Opened in July 2017 according to Habanos S.A.',
  `description_es` = 'Cohiba Atmosphere, espacio de Habanos S.A. situado en la galería comercial del Gran Hotel Manzana Kempinski, calle Neptuno, entre Zulueta y Monserrate, La Habana. Abierto en julio de 2017 según Habanos S.A.',
  `description_de` = 'Cohiba Atmosphere, ein Raum von Habanos S.A. in der Einkaufsgalerie des Gran Hotel Manzana Kempinski, calle Neptuno, zwischen Zulueta und Monserrate, Havanna. Laut Habanos S.A. im Juli 2017 eröffnet.',
  `description_zh` = 'Cohiba Atmosphere，Habanos S.A. 的场所，位于哈瓦那 Gran Hotel Manzana Kempinski 的购物长廊内，calle Neptuno，Zulueta 与 Monserrate 之间。据 Habanos S.A. 称，于 2017 年 7 月开业。',
  `description_ar` = 'Cohiba Atmosphere، فضاء تابع لـ Habanos S.A. يقع في المعرض التجاري لفندق Gran Hotel Manzana Kempinski، calle Neptuno، بين Zulueta وMonserrate في هافانا. افتُتح في يوليو 2017 بحسب Habanos S.A.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : habanos.com (Neptuno Street, between Zulueta and Monserrate; Habanos S.A., 11 July 2017) ; cigaraficionado.com (Cohiba Atmosphere, Gran Hotel Manzana Kempinski, San Rafael Street (2017))',
  `updated_at` = NOW()
 WHERE `id` = 178 AND `country_id` = 'cuba' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Santiago de los Caballeros — Hotel Santiago (Curio Collection by Hilton), Av. Juan Pablo Duarte',
  `description` = 'Arturo Fuente Cigar Club de Santiago : salon et humidor installés dans l''hôtel Hotel Santiago (Curio Collection by Hilton), second club de la maison après celui de Santo Domingo, selon Cigar Coop (18 février 2026).',
  `description_en` = 'Arturo Fuente Cigar Club in Santiago: lounge and humidor located in the Hotel Santiago (Curio Collection by Hilton), the house''s second club after the one in Santo Domingo, according to Cigar Coop (18 February 2026).',
  `description_es` = 'Arturo Fuente Cigar Club de Santiago: salón y humidor instalados en el Hotel Santiago (Curio Collection by Hilton), segundo club de la casa tras el de Santo Domingo, según Cigar Coop (18 de febrero de 2026).',
  `description_de` = 'Arturo Fuente Cigar Club in Santiago: Lounge und Humidor im Hotel Santiago (Curio Collection by Hilton), zweiter Club des Hauses nach dem in Santo Domingo, laut Cigar Coop (18. Februar 2026).',
  `description_zh` = '圣地亚哥的 Arturo Fuente Cigar Club：雪茄厅和保湿柜设于 Hotel Santiago（Curio Collection by Hilton）内，据 Cigar Coop（2026年2月18日），是该品牌继圣多明各之后的第二家俱乐部。',
  `description_ar` = 'Arturo Fuente Cigar Club في سانتياغو: صالة وخزانة ترطيب داخل Hotel Santiago (Curio Collection by Hilton)، وهو النادي الثاني للدار بعد نادي سانتو دومينغو، وفق Cigar Coop (18 فبراير 2026).',
  `source` = 'à vérifier — relu le 29 octobre 2026 : cigar-coop.com (Cigar Club au Hotel Santiago (Curio Collection by Hilton), centre de Santiago ; article du 18 février 2026 ; humidor walk-in) ; arturofuente.com (Page officielle : logo renvoyant au site du Arturo Fuente Cigar Club (aucune adresse))',
  `updated_at` = NOW()
 WHERE `id` = 182 AND `country_id` = 'dominican' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Santiago de los Caballeros (chaque année en février)',
  `description` = 'Festival annuel organisé en février par Procigar, association des producteurs de cigares de la République dominicaine : visites de manufactures et de champs de tabac, dîners et vente aux enchères caritative. L''édition 2026 (XVIII) s''est tenue à Santiago de los Caballeros.',
  `description_en` = 'Annual festival held in February by Procigar, the association of cigar producers of the Dominican Republic: visits to factories and tobacco fields, dinners and a charity auction. The 2026 edition (XVIII) was held in Santiago de los Caballeros.',
  `description_es` = 'Festival anual organizado en febrero por Procigar, asociación de productores de cigarros de la República Dominicana: visitas a fábricas y campos de tabaco, cenas y una subasta benéfica. La edición de 2026 (XVIII) se celebró en Santiago de los Caballeros.',
  `description_de` = 'Jährliches Festival im Februar, veranstaltet von Procigar, dem Verband der Zigarrenproduzenten der Dominikanischen Republik: Besuche von Manufakturen und Tabakfeldern, Abendessen und eine Wohltätigkeitsauktion. Die Ausgabe 2026 (XVIII.) fand in Santiago de los Caballeros statt.',
  `description_zh` = '由多米尼加共和国雪茄生产商协会 Procigar 每年2月举办的节庆:参观工厂和烟草田、晚宴及慈善拍卖。2026年(第十八届,XVIII)在圣地亚哥-德洛斯卡瓦列罗斯(Santiago de los Caballeros)举行。',
  `description_ar` = 'مهرجان سنوي تنظمه في فبراير Procigar، رابطة منتجي السيجار في جمهورية الدومينيكان: زيارات للمصانع وحقول التبغ وعشاءات ومزاد خيري. أقيمت نسخة 2026 (الثامنة عشرة، XVIII) في Santiago de los Caballeros.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : cigar-coop.com (18th edition, 17-20 février 2026, Santiago ; ''that portion of the festival has been cancelled for 2026'' (La Romana)) ; diariolibre.com (Procigar organise l''événement ; visites de fabriques et de champs ; dîners d''environ 1000 invités)',
  `updated_at` = NOW()
 WHERE `id` = 183 AND `country_id` = 'dominican' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Danlí (Festival del Puro y del Café ; 6e édition les 15-16 mai 2026)',
  `description` = 'Festival du puro et du café organisé à Danlí (département d''El Paraíso, Honduras). La 6e édition était annoncée pour les 15 et 16 mai 2026 au centre commercial Ciudad Casa Blanca ; la 5e s''est tenue du 27 février au 1er mars 2025. Un Honduras Cigar Festival national, distinct, est annoncé pour janvier 2027.',
  `description_en` = 'Puro and coffee festival held in Danlí (El Paraíso department, Honduras). The 6th edition was announced for 15 and 16 May 2026 at the Ciudad Casa Blanca shopping centre; the 5th was held from 27 February to 1 March 2025. A separate national Honduras Cigar Festival is announced for January 2027.',
  `description_es` = 'Festival del puro y del café organizado en Danlí (departamento de El Paraíso, Honduras). La 6.ª edición se anunció para los días 15 y 16 de mayo de 2026 en el centro comercial Ciudad Casa Blanca; la 5.ª se celebró del 27 de febrero al 1 de marzo de 2025. Se anuncia, aparte, un Honduras Cigar Festival de ámbito nacional para enero de 2027.',
  `description_de` = 'Festival für Puros und Kaffee in Danlí (Departamento El Paraíso, Honduras). Die 6. Ausgabe wurde für den 15. und 16. Mai 2026 im Einkaufszentrum Ciudad Casa Blanca angekündigt; die 5. fand vom 27. Februar bis 1. März 2025 statt. Ein davon getrenntes nationales Honduras Cigar Festival ist für Januar 2027 angekündigt.',
  `description_zh` = '在洪都拉斯埃尔帕拉伊索省丹利（Danlí）举办的雪茄与咖啡节。第 6 届已宣布于 2026 年 5 月 15 日至 16 日在 Ciudad Casa Blanca 购物中心举行；第 5 届于 2025 年 2 月 27 日至 3 月 1 日举行。另有一个独立的全国性 Honduras Cigar Festival，宣布于 2027 年 1 月举办。',
  `description_ar` = 'مهرجان للسيجار والقهوة يُنظَّم في دانلي (محافظة إل باراييسو، هندوراس). أُعلن عن النسخة السادسة يومي 15 و16 مايو 2026 في مركز Ciudad Casa Blanca التجاري؛ وأُقيمت الخامسة من 27 فبراير إلى 1 مارس 2025. ويُعلن عن مهرجان وطني منفصل هو Honduras Cigar Festival في يناير 2027.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : newsinamerica.com (6e édition du Festival del Puro y del Café, « los días 15 y 16 de mayo », Ciudad Casa Blanca, Danlí) ; cigardojo.com (Ve édition 27 février-1er mars 2025 (titre/extrait de recherche, page non relue en entier))',
  `updated_at` = NOW()
 WHERE `id` = 184 AND `country_id` = 'honduras' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Quito — Av. González Suárez 120 y Orellana, Hotel Quito',
  `description` = 'La Casa del Habano de Quito, franchise du réseau Habanos S.A., répertoriée par habanos.com et lacasadelhabano.com à l''Av. González Suárez 120 y Orellana (Hotel Quito). Distributeur indiqué : Vegas del Caribe S.A.C.',
  `description_en` = 'La Casa del Habano in Quito, a franchise of the Habanos S.A. network, listed by habanos.com and lacasadelhabano.com at Av. González Suárez 120 y Orellana (Hotel Quito). Distributor indicated: Vegas del Caribe S.A.C.',
  `description_es` = 'La Casa del Habano de Quito, franquicia de la red Habanos S.A., registrada por habanos.com y lacasadelhabano.com en Av. González Suárez 120 y Orellana (Hotel Quito). Distribuidor indicado: Vegas del Caribe S.A.C.',
  `description_de` = 'La Casa del Habano in Quito, Franchise des Habanos-S.A.-Netzwerks, von habanos.com und lacasadelhabano.com unter Av. González Suárez 120 y Orellana (Hotel Quito) aufgeführt. Angegebener Distributeur: Vegas del Caribe S.A.C.',
  `description_zh` = '基多的 La Casa del Habano，属于 Habanos S.A. 网络的特许经营店，habanos.com 和 lacasadelhabano.com 登记地址为 Av. González Suárez 120 y Orellana（Hotel Quito）。所列经销商：Vegas del Caribe S.A.C.',
  `description_ar` = 'لا كاسا ديل هابانو في كيتو، امتياز ضمن شبكة Habanos S.A.، مدرجة على habanos.com وlacasadelhabano.com في Av. González Suárez 120 y Orellana (Hotel Quito). الموزّع المذكور: Vegas del Caribe S.A.C.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : habanos.com (La Casa del Habano Quito : Av. Gonzalez Suarez 120 y Orellana, Hotel Quito ; distributeur Vegas del Caribe S.A.C) ; lacasadelhabano.com (LCDH Quito, Avenida González Suárez, 170109 Quito ; répertoire lacasadelhabano.com/directorio liste LCDH Quito sous Ecuador)',
  `updated_at` = NOW()
 WHERE `id` = 185 AND `country_id` = 'ecuador' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'São Paulo — Rua Oscar Freire 450, Jardins (Cerqueira César)',
  `description` = 'La Casa del Habano de São Paulo, exploitée dans l''enseigne Esch Café, rua Oscar Freire, dans le quartier des Jardins.',
  `description_en` = 'The Casa del Habano in São Paulo, operated within the Esch Café brand, rua Oscar Freire, in the Jardins district.',
  `description_es` = 'La Casa del Habano de São Paulo, explotada dentro de la enseña Esch Café, rua Oscar Freire, en el barrio de Jardins.',
  `description_de` = 'Die Casa del Habano in São Paulo, betrieben innerhalb der Marke Esch Café, rua Oscar Freire, im Stadtteil Jardins.',
  `description_zh` = '位于圣保罗的 Casa del Habano,设在 Esch Café 品牌门店内,地址:rua Oscar Freire,Jardins 街区。',
  `description_ar` = 'Casa del Habano في ساو باولو، تعمل ضمن علامة Esch Café، في rua Oscar Freire بحي Jardins.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : lacasadelhabano.com (LCDH Sao Paulo/Jardins : Rua Oscar Freire, Nº 450, Bairro Cerqueira César) ; eschcafe.com.br (Esch Oscar : R. Oscar Freire, 450, Jardim Paulista ; La Casa del Habano officielle) ; habanos.com (Article du 13 oct. 2022 : La Casa del Habano Esch Café, 15 ans, São Paulo)',
  `updated_at` = NOW()
 WHERE `id` = 187 AND `country_id` = 'brazil' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Rio de Janeiro — Rua Dias Ferreira 78A, Leblon',
  `description` = 'La Casa del Habano de Rio de Janeiro, exploitée dans l''enseigne Esch Café, rua Dias Ferreira, dans le quartier de Leblon.',
  `description_en` = 'La Casa del Habano in Rio de Janeiro, operated within the Esch Café brand, rua Dias Ferreira, in the Leblon district.',
  `description_es` = 'La Casa del Habano de Río de Janeiro, explotada dentro de la marca Esch Café, rua Dias Ferreira, en el barrio de Leblon.',
  `description_de` = 'La Casa del Habano in Rio de Janeiro, betrieben innerhalb der Marke Esch Café, rua Dias Ferreira, im Stadtteil Leblon.',
  `description_zh` = '里约热内卢的 La Casa del Habano，设在 Esch Café 门店内运营，rua Dias Ferreira，位于 Leblon 区。',
  `description_ar` = 'La Casa del Habano في ريو دي جانيرو، تُدار داخل علامة Esch Café، rua Dias Ferreira، في حي Leblon.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : lacasadelhabano.com (LCDH Río de Janeiro/Leblon : Rua Dias Ferreira 78A, Leblon) ; eschcafe.com.br (Esch Leblon : Rua Dias Ferreira, 78, Leblon, Rio de Janeiro)',
  `updated_at` = NOW()
 WHERE `id` = 188 AND `country_id` = 'brazil' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Jalan Dewi Sri IIA No. 168E, Legian, Bali 80361',
  `description` = 'La Casa del Habano Bali, franchise La Casa del Habano à Legian (Bali, Indonésie), ouverte en novembre 2024 (ouverture officielle le 15 novembre). Comprend un lounge et un salon privé.',
  `description_en` = 'La Casa del Habano Bali, a La Casa del Habano franchise in Legian (Bali, Indonesia), opened in November 2024 (official opening on 15 November). Includes a lounge and a private room.',
  `description_es` = 'La Casa del Habano Bali, franquicia La Casa del Habano en Legian (Bali, Indonesia), abierta en noviembre de 2024 (inauguración oficial el 15 de noviembre). Incluye un lounge y un salón privado.',
  `description_de` = 'La Casa del Habano Bali, Franchise von La Casa del Habano in Legian (Bali, Indonesien), im November 2024 eröffnet (offizielle Eröffnung am 15. November). Umfasst eine Lounge und einen privaten Raum.',
  `description_zh` = 'La Casa del Habano Bali，位于印度尼西亚巴厘岛勒吉安的 La Casa del Habano 特许经营店，2024年11月开业（11月15日正式开幕）。设有雪茄厅和私人包间。',
  `description_ar` = 'La Casa del Habano Bali، امتياز لا كاسا ديل هابانو في ليغيان (بالي، إندونيسيا)، افتُتحت في نوفمبر 2024 (الافتتاح الرسمي في 15 نوفمبر). تضم صالة وغرفة خاصة.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : cigarjournal.com (Jalan Dewi Sri IIA No. 168E, Legian, Bali 80361 ; ouverture officielle mi-novembre 2024, 15 novembre) ; lacasadelhabano.com (Page d''accueil lue : aucune mention de Bali ; annuaire /directorio/ non lu)',
  `updated_at` = NOW()
 WHERE `id` = 189 AND `country_id` = 'indonesia' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Cancún — Boulevard Kukulkán km 12,7, Zona Hotelera, 77500',
  `description` = 'Franchise La Casa del Habano de Cancún, dans la zone hôtelière, boulevard Kukulkán.',
  `description_en` = 'La Casa del Habano franchise in Cancún, in the hotel zone, Boulevard Kukulkán.',
  `description_es` = 'Franquicia La Casa del Habano de Cancún, en la zona hotelera, boulevard Kukulkán.',
  `description_de` = 'Franchise der Casa del Habano in Cancún, in der Hotelzone, Boulevard Kukulkán.',
  `description_zh` = '位于坎昆酒店区的 La Casa del Habano 特许经营店,地址:Boulevard Kukulkán。',
  `description_ar` = 'امتياز La Casa del Habano في كانكون، في المنطقة الفندقية، Boulevard Kukulkán.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : lacasadelhabano.com (Boulevard Kukulkán km.12.7, Zona Hotelera, 77500 Cancún)',
  `updated_at` = NOW()
 WHERE `id` = 191 AND `country_id` = 'mexico' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'San Miguel de Allende — Diez de Sollano y Dávalos 4, int. 3, 37700 Guanajuato',
  `description` = 'Franchise La Casa del Habano de San Miguel de Allende, dans l''État de Guanajuato.',
  `description_en` = 'La Casa del Habano franchise in San Miguel de Allende, in the State of Guanajuato.',
  `description_es` = 'Franquicia La Casa del Habano de San Miguel de Allende, en el estado de Guanajuato.',
  `description_de` = 'Franchise La Casa del Habano in San Miguel de Allende, im Bundesstaat Guanajuato.',
  `description_zh` = '位于瓜纳华托州圣米格尔-德阿连德的 La Casa del Habano 特许经营店。',
  `description_ar` = 'امتياز La Casa del Habano في سان ميغيل دي أليندي، في ولاية غواناخواتو.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : lacasadelhabano.com (Diez de Sollano y Dávalos, No.4 Int.3, San Miguel de Allende, 37700 Guanajuato)',
  `updated_at` = NOW()
 WHERE `id` = 193 AND `country_id` = 'mexico' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Melbourne — Ground Floor, Grand Hyatt Melbourne, 123 Collins Street, VIC 3000',
  `description` = 'La Casa del Habano de Melbourne, au rez-de-chaussée du Grand Hyatt Melbourne, 123 Collins Street ; adresse répertoriée par le plan des franchises lacasadelhabano.com et par l''annuaire habanos.com.',
  `description_en` = 'La Casa del Habano in Melbourne, on the ground floor of the Grand Hyatt Melbourne, 123 Collins Street; address listed by the lacasadelhabano.com franchise map and by the habanos.com directory.',
  `description_es` = 'La Casa del Habano de Melbourne, en la planta baja del Grand Hyatt Melbourne, 123 Collins Street; dirección registrada en el mapa de franquicias de lacasadelhabano.com y en el directorio de habanos.com.',
  `description_de` = 'La Casa del Habano in Melbourne, im Erdgeschoss des Grand Hyatt Melbourne, 123 Collins Street; Adresse auf der Franchise-Karte von lacasadelhabano.com und im Verzeichnis von habanos.com aufgeführt.',
  `description_zh` = '墨尔本的 La Casa del Habano，位于墨尔本君悦酒店 Grand Hyatt Melbourne 一层，地址 123 Collins Street；该地址见于 lacasadelhabano.com 的特许经营店地图和 habanos.com 的名录。',
  `description_ar` = 'لا كاسا ديل هابانو في ملبورن، في الطابق الأرضي من Grand Hyatt Melbourne، 123 Collins Street؛ العنوان مدرج على خريطة الامتيازات في lacasadelhabano.com وفي دليل habanos.com.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : lacasadelhabano.com (LCDH Melbourne: Ground Floor Grand Hyatt Melbourne, 123 Collins Street, 3000 Victoria) ; lacasadelhabano.com (Australie: LCDH Melbourne et LCDH Sydney) ; cigarjournal.com (LCDH Sydney, 75 King St, lancée le 19 novembre 2025)',
  `updated_at` = NOW()
 WHERE `id` = 197 AND `country_id` = 'australia' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Sydney — Shop 29, The Strand Arcade, 412-414 George Street, NSW 2000',
  `description` = 'Boutique Davidoff of Geneva de Sydney, dans la galerie The Strand Arcade, George Street.',
  `description_en` = 'Davidoff of Geneva boutique in Sydney, in The Strand Arcade, George Street.',
  `description_es` = 'Tienda Davidoff of Geneva de Sídney, en la galería The Strand Arcade, George Street.',
  `description_de` = 'Boutique Davidoff of Geneva in Sydney, in der Galerie The Strand Arcade, George Street.',
  `description_zh` = '位于悉尼的 Davidoff of Geneva 精品店,设在 George Street 的 The Strand Arcade 购物廊内。',
  `description_ar` = 'متجر Davidoff of Geneva في سيدني، داخل The Strand Arcade في George Street.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : cigarjournal.com (Davidoff of Geneva, Shop 29, 412-414 George St, Sydney; 7 mai 2025) ; strandarcade.com.au (Strand Arcade, 412-414A George St, Sydney NSW 2000 (Davidoff non cité))',
  `updated_at` = NOW()
 WHERE `id` = 198 AND `country_id` = 'australia' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Edinburgh — Unit 2, 11 Lister Square, EH3 9GL',
  `description` = 'La Casa del Habano de C.Gars Ltd à Édimbourg, au 11 Lister Square (Quartermile), ouverte le 12 septembre 2023 : cave où l''on entre et terrasse chauffée. Le bar Puffin Rooms y est attenant.',
  `description_en` = 'La Casa del Habano of C.Gars Ltd in Edinburgh, at 11 Lister Square (Quartermile), opened on 12 September 2023: a walk-in humidor and a heated terrace. The Puffin Rooms bar adjoins it.',
  `description_es` = 'La Casa del Habano de C.Gars Ltd en Edimburgo, en 11 Lister Square (Quartermile), abierta el 12 de septiembre de 2023: humidor en el que se puede entrar y terraza calefactada. El bar Puffin Rooms es contiguo.',
  `description_de` = 'La Casa del Habano von C.Gars Ltd in Edinburgh, 11 Lister Square (Quartermile), am 12. September 2023 eröffnet: begehbares Humidor und beheizte Terrasse. Die Bar Puffin Rooms grenzt daran an.',
  `description_zh` = 'C.Gars Ltd 在爱丁堡的 La Casa del Habano，位于 11 Lister Square（Quartermile），2023 年 9 月 12 日开业：设有可步入的雪茄保湿室和带暖气的露台。Puffin Rooms 酒吧与之相邻。',
  `description_ar` = 'La Casa del Habano التابعة لـ C.Gars Ltd في إدنبرة، 11 Lister Square (Quartermile)، افتُتحت في 12 سبتمبر 2023: غرفة ترطيب يمكن دخولها وشرفة مدفأة. ويجاورها بار Puffin Rooms.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : lcdhcigars.uk (Edinburgh : Unit 2, 11 Lister Square, EH3 9GL, +44 (0) 131 285 8082) ; cigar-coop.com (Grand opening 12 septembre 2023, 11 Lister Square ; terrasse chauffée ; bar avec Puffin Rooms) ; puffinrooms.co.uk (Edinburgh : "Whisky & Cigars")',
  `updated_at` = NOW()
 WHERE `id` = 282 AND `country_id` = 'uk' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Tokyo — Nishi-Azabu 1-14-1, Minato-ku',
  `description` = 'Cohiba Atmosphere Tokyo, bar à cigares du réseau Cohiba Atmosphere de Habanos S.A., situé au rez-de-chaussée du bâtiment Ikado Nishiazabu, à Nishi-Azabu (arrondissement de Minato).',
  `description_en` = 'Cohiba Atmosphere Tokyo, a cigar bar of the Habanos S.A. Cohiba Atmosphere network, located on the ground floor of the Ikado Nishiazabu building, in Nishi-Azabu (Minato ward).',
  `description_es` = 'Cohiba Atmosphere Tokyo, bar de cigarros de la red Cohiba Atmosphere de Habanos S.A., situado en la planta baja del edificio Ikado Nishiazabu, en Nishi-Azabu (distrito de Minato).',
  `description_de` = 'Cohiba Atmosphere Tokyo, Zigarrenbar des Cohiba-Atmosphere-Netzwerks von Habanos S.A., im Erdgeschoss des Gebäudes Ikado Nishiazabu in Nishi-Azabu (Bezirk Minato).',
  `description_zh` = 'Cohiba Atmosphere Tokyo，Habanos S.A. 旗下 Cohiba Atmosphere 网络的雪茄吧，位于港区西麻布 Ikado Nishiazabu 大楼一层。',
  `description_ar` = 'Cohiba Atmosphere Tokyo، بار سيجار ضمن شبكة Cohiba Atmosphere التابعة لـ Habanos S.A.، في الطابق الأرضي من مبنى Ikado Nishiazabu في Nishi-Azabu (حي Minato).',
  `source` = 'à vérifier — relu le 29 octobre 2026 : cohiba-atmosphere.jp (Cohiba Atmosphere Tokyo : 東京都港区西麻布1-14-1 井門西麻布ビル1F) ; habanos.com (Asie : Bangkok, Tokyo, Hong Kong, and Shanghai (6 nov. 2019)) ; news.mynavi.jp (Cigar bar de Nishi-Azabu, franchise officielle Habanos (24 nov. 2022))',
  `updated_at` = NOW()
 WHERE `id` = 366 AND `country_id` = 'japan' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Hong Kong — Duke Wellington House, 14-24 Wellington Street, 4/F, Central',
  `description` = 'Salon de cigares situé au 4e étage de Duke Wellington House, à Central. D''après son site, il comprend un salon principal, un salon privé, une terrasse et un humidor où sont conservés des cigares ; seuls les produits achetés sur place peuvent y être fumés.',
  `description_en` = 'Cigar lounge on the 4th floor of Duke Wellington House, in Central. According to its website, it comprises a main lounge, a private lounge, a terrace and a humidor where cigars are stored; only products purchased on site may be smoked there.',
  `description_es` = 'Salón de cigarros situado en la 4.ª planta de Duke Wellington House, en Central. Según su sitio web, cuenta con un salón principal, un salón privado, una terraza y un humidor donde se conservan cigarros; solo se pueden fumar allí los productos comprados en el local.',
  `description_de` = 'Zigarrenlounge im 4. Stock des Duke Wellington House in Central. Laut ihrer Website umfasst sie einen Hauptsalon, einen privaten Salon, eine Terrasse und einen Humidor, in dem Zigarren aufbewahrt werden; geraucht werden dürfen dort nur vor Ort gekaufte Produkte.',
  `description_zh` = '雪茄酒廊位于中环 Duke Wellington House 的4楼。据其网站介绍,设有主厅、私人厅、露台和存放雪茄的雪茄保湿柜;只能吸食在店内购买的产品。',
  `description_ar` = 'صالون سيجار في الطابق الرابع من Duke Wellington House في Central. بحسب موقعه، يضم صالونًا رئيسيًا وصالونًا خاصًا وشرفة وخزانة ترطيب (humidor) تحفظ فيها السيجار؛ ولا يجوز التدخين فيه إلا للمنتجات المشتراة في المكان.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : bertie-hk.com (4/F, Duke Wellington House, 14-24 Wellington Street, Central ; lun-sam 12h-0h) ; cigarjournal.com (Cigar Journal (extrait de recherche) : Bertie Cigar Lounge, deux ans a Hong Kong ; adresse 2/F chez Time Out (Attire House))',
  `updated_at` = NOW()
 WHERE `id` = 385 AND `country_id` = 'hongkong' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Jerusalem — Mamilla Hotel, Mamilla Avenue',
  `description` = 'Salon cigares (Cigar Lounge) attenant au Mirror Bar du Mamilla Hotel, à Jérusalem. La page officielle du bar indique, sans date, que le Mirror Bar est actuellement fermé.',
  `description_en` = 'Cigar lounge adjoining the Mirror Bar of the Mamilla Hotel, in Jerusalem. The bar''s official page states, without a date, that the Mirror Bar is currently closed.',
  `description_es` = 'Salón de puros contiguo al Mirror Bar del Mamilla Hotel, en Jerusalén. La página oficial del bar indica, sin fecha, que el Mirror Bar está actualmente cerrado.',
  `description_de` = 'Zigarrenlounge neben der Mirror Bar des Mamilla Hotel in Jerusalem. Die offizielle Seite der Bar gibt ohne Datum an, dass die Mirror Bar derzeit geschlossen ist.',
  `description_zh` = '耶路撒冷 Mamilla Hotel 内 Mirror Bar 旁的雪茄厅（Cigar Lounge）。该酒吧官方页面未注明日期，称 Mirror Bar 目前关闭。',
  `description_ar` = 'صالة سيجار (Cigar Lounge) ملاصقة لـ Mirror Bar في فندق Mamilla Hotel بالقدس. تشير الصفحة الرسمية للبار، دون ذكر تاريخ، إلى أن Mirror Bar مغلق حاليًا.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : mamillahotel.com (separate and intimate Cigar Lounge ; the Mirror Bar is currently closed) ; mamillahotel.com (Bars : Mirror Bar, The Winery, Executive Lounge, Espresso Bar ; aucun ''Havana'')',
  `updated_at` = NOW()
 WHERE `id` = 646 AND `country_id` = 'israel' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Taipei — No. 90, Songren Road, Xinyi District',
  `description` = 'Club Macanudo de Taipei, lounge de la marque Macanudo (Scandinavian Tobacco Group), ouvert en 2024 dans le quartier de Xinyi.',
  `description_en` = 'Club Macanudo in Taipei, a lounge of the Macanudo brand (Scandinavian Tobacco Group), opened in 2024 in the Xinyi district.',
  `description_es` = 'Club Macanudo de Taipéi, lounge de la marca Macanudo (Scandinavian Tobacco Group), abierto en 2024 en el distrito de Xinyi.',
  `description_de` = 'Club Macanudo in Taipeh, Lounge der Marke Macanudo (Scandinavian Tobacco Group), 2024 im Bezirk Xinyi eröffnet.',
  `description_zh` = '台北的 Club Macanudo，Macanudo 品牌（Scandinavian Tobacco Group）的雪茄厅，2024年在信义区开业。',
  `description_ar` = 'Club Macanudo في تايبيه، صالة تابعة لعلامة Macanudo (Scandinavian Tobacco Group)، افتُتحت عام 2024 في حي Xinyi.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : clubmacanudo.com (No. 90, Songren Road, Xinyi Dist., Taipei, Taiwan) ; cigardojo.com (Xinyi, central business district; ouverture publique le 27 février (2024))',
  `updated_at` = NOW()
 WHERE `id` = 683 AND `country_id` = 'taiwan' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Viña del Mar — Avenida San Martín 199',
  `description` = 'Habanos Lounge et Habanos Terrace répertoriés par habanos.com dans le casino Enjoy de Viña del Mar, avenue San Martín 199 ; distributeur indiqué : Puro Tabaco S.A. Le permis d''exploitation du casino, détenu par Enjoy, court jusqu''en 2028 selon Focus Gaming News (19 août 2025).',
  `description_en` = 'Habanos Lounge and Habanos Terrace listed by habanos.com in the Enjoy casino in Viña del Mar, avenida San Martín 199; distributor indicated: Puro Tabaco S.A. The casino''s operating licence, held by Enjoy, runs until 2028 according to Focus Gaming News (19 August 2025).',
  `description_es` = 'Habanos Lounge y Habanos Terrace incluidos por habanos.com en el casino Enjoy de Viña del Mar, avenida San Martín 199; distribuidor indicado: Puro Tabaco S.A. La licencia de explotación del casino, en manos de Enjoy, vence en 2028 según Focus Gaming News (19 de agosto de 2025).',
  `description_de` = 'Habanos Lounge und Habanos Terrace, von habanos.com im Casino Enjoy in Viña del Mar, avenida San Martín 199, verzeichnet; angegebener Distributor: Puro Tabaco S.A. Die Betriebslizenz des Casinos, die Enjoy innehat, läuft laut Focus Gaming News (19. August 2025) bis 2028.',
  `description_zh` = 'habanos.com 列出的 Habanos Lounge 和 Habanos Terrace,位于比尼亚德尔马的 Enjoy 赌场内,地址:avenida San Martín 199;所标注的经销商:Puro Tabaco S.A.。据 Focus Gaming News(2025年8月19日)报道,Enjoy 持有的该赌场经营许可有效期至2028年。',
  `description_ar` = 'Habanos Lounge وHabanos Terrace المدرجان على habanos.com في كازينو Enjoy في فينيا ديل مار، avenida San Martín 199؛ الموزع المذكور: Puro Tabaco S.A. ترخيص تشغيل الكازينو، الذي تحتفظ به Enjoy، ساري حتى عام 2028 بحسب Focus Gaming News (19 أغسطس 2025).',
  `source` = 'à vérifier — relu le 29 octobre 2026 : habanos.com (Enjoy Casino – Viña Del Mar, Habanos Lounge/Terrace ; Avenida San Martín 199 ; Puro Tabaco S.A. (page non datée)) ; focusgn.com (19 août 2025 : Casino del Mar (Enjoy) exploite le casino jusqu''en 2028, puis nouvel appel d''offres)',
  `updated_at` = NOW()
 WHERE `id` = 745 AND `country_id` = 'chile' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Lagos — The Wheatbaker, 4 Onitolo Road, Ikoyi',
  `description` = 'Hôtel d''Ikoyi, à Lagos. Son site présente le restaurant The GrillRoom et le café Kofí ; il ne mentionne aucun bar à cigares.',
  `description_en` = 'Hotel in Ikoyi, Lagos. Its website presents the restaurant The GrillRoom and the café Kofí; it mentions no cigar bar.',
  `description_es` = 'Hotel de Ikoyi, en Lagos. Su sitio web presenta el restaurante The GrillRoom y la cafetería Kofí; no menciona ningún bar de puros.',
  `description_de` = 'Hotel in Ikoyi, Lagos. Auf der Website werden das Restaurant The GrillRoom und das Café Kofí vorgestellt; eine Zigarrenbar wird nicht erwähnt.',
  `description_zh` = '位于拉各斯伊科伊（Ikoyi）的酒店。其网站介绍了餐厅 The GrillRoom 和咖啡馆 Kofí；未提及任何雪茄吧。',
  `description_ar` = 'فندق في إيكوي، لاغوس. يعرض موقعه مطعم The GrillRoom ومقهى Kofí؛ ولا يذكر أي بار سيجار.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : thewheatbakerlagos.com (Lieux listes : ''The GrillRoom'' (Food, Drinks & Lounge) et Kofi (cafe) ; aucun cigare)',
  `updated_at` = NOW()
 WHERE `id` = 828 AND `country_id` = 'nigeria' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Luxembourg-Ville — Le Royal Hotels & Resorts, 12 Boulevard Royal, L-2449',
  `description` = 'Royal Lounge de l''hôtel Le Royal Hotels & Resorts Luxembourg, qui comprend un salon cigares d''après le site de l''hôtel.',
  `description_en` = 'Royal Lounge of the hotel Le Royal Hotels & Resorts Luxembourg, which includes a cigar lounge according to the hotel''s website.',
  `description_es` = 'Royal Lounge del hotel Le Royal Hotels & Resorts Luxembourg, que incluye un salón de cigarros según el sitio web del hotel.',
  `description_de` = 'Royal Lounge des Hotels Le Royal Hotels & Resorts Luxembourg, die laut Website des Hotels einen Zigarrensalon umfasst.',
  `description_zh` = 'Le Royal Hotels & Resorts Luxembourg 酒店的 Royal Lounge，据酒店网站，其中设有雪茄厅。',
  `description_ar` = 'Royal Lounge في فندق Le Royal Hotels & Resorts Luxembourg، ويضم صالة للسيجار وفق موقع الفندق.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : luxembourg.leroyal.com (Royal Lounge ; The Royal Lounge includes a cigar lounge ; aucun Churchill Bar) ; guide.michelin.com (The Royal Lounge keeps a cigar room. Boulevard Royal 12)',
  `updated_at` = NOW()
 WHERE `id` = 913 AND `country_id` = 'luxembourg' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Belgrade — Đure Jakšića 11, 11000 Beograd',
  `description` = 'Boutique Davidoff de Belgrade, Đure Jakšića 11, exploitée par Julieta Plus d.o.o. selon le site davidoffshop.rs ; le localisateur de la marque la liste parmi ses boutiques en propre.',
  `description_en` = 'Davidoff boutique in Belgrade, Đure Jakšića 11, operated by Julieta Plus d.o.o. according to the davidoffshop.rs website; the brand''s locator lists it among its own boutiques.',
  `description_es` = 'Tienda Davidoff de Belgrado, Đure Jakšića 11, operada por Julieta Plus d.o.o. según el sitio davidoffshop.rs; el localizador de la marca la incluye entre sus tiendas propias.',
  `description_de` = 'Davidoff-Boutique in Belgrad, Đure Jakšića 11, laut der Website davidoffshop.rs von Julieta Plus d.o.o. betrieben; der Store-Locator der Marke führt sie unter ihren eigenen Boutiquen.',
  `description_zh` = '位于贝尔格莱德的 Davidoff 精品店,地址:Đure Jakšića 11。据 davidoffshop.rs 网站称由 Julieta Plus d.o.o. 运营;该品牌的门店查询工具将其列为自营精品店。',
  `description_ar` = 'متجر Davidoff في بلغراد، Đure Jakšića 11، تديره Julieta Plus d.o.o. بحسب موقع davidoffshop.rs؛ ويدرجه محدد المواقع الخاص بالعلامة ضمن متاجرها الخاصة.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : davidoffshop.rs (Davidoff Shop Belgrade, Đure Jakšića 11, 11000 Beograd; opérateur Julieta Plus d.o.o)',
  `updated_at` = NOW()
 WHERE `id` = 934 AND `country_id` = 'serbia' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Kiev — Fairmont Grand Hotel Kyiv, 1 Naberezhno-Khreshchatytska Street, 04070',
  `description` = 'Hôtel Fairmont Grand Hotel Kyiv. Son site publie ses lieux de restauration et de bar : restaurant Marigold, SWEETBOOK et Vintage Cocktail Bar ; aucun bar à cigares n''y figure. La page du Vintage Bar mentionne des frais de coupe pour un cigare apporté par le client.',
  `description_en` = 'Fairmont Grand Hotel Kyiv. Its website lists its dining and bar venues: restaurant Marigold, SWEETBOOK and Vintage Cocktail Bar; no cigar bar appears there. The Vintage Bar page mentions a cutting fee for a cigar brought in by the guest.',
  `description_es` = 'Hotel Fairmont Grand Hotel Kyiv. Su sitio web publica sus espacios de restauración y de bar: restaurante Marigold, SWEETBOOK y Vintage Cocktail Bar; no figura ningún bar de puros. La página del Vintage Bar menciona un cargo por corte de un puro traído por el cliente.',
  `description_de` = 'Hotel Fairmont Grand Hotel Kyiv. Auf der Website sind die Gastronomie- und Barbereiche aufgeführt: Restaurant Marigold, SWEETBOOK und Vintage Cocktail Bar; eine Zigarrenbar ist nicht darunter. Die Seite der Vintage Bar erwähnt eine Schneidgebühr für eine vom Gast mitgebrachte Zigarre.',
  `description_zh` = 'Fairmont Grand Hotel Kyiv 酒店。其网站列出了餐饮和酒吧场所：餐厅 Marigold、SWEETBOOK 和 Vintage Cocktail Bar；其中没有雪茄吧。Vintage Bar 页面提到，客人自带雪茄需支付开切费。',
  `description_ar` = 'فندق Fairmont Grand Hotel Kyiv. ينشر موقعه أماكن الطعام والبارات: مطعم Marigold وSWEETBOOK وVintage Cocktail Bar؛ ولا يرد فيها أي بار سيجار. وتذكر صفحة Vintage Bar رسومًا على قصّ سيجارة يحضرها الضيف.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : fairmont.com (Dining : Marigold, SWEETBOOK, Vintage Cocktail Bar ; aucun salon cigares) ; fairmont.com (Vintage Bar ; cigare apporté : "a cutting fee applies" ; 1 Naberezhno, Khreshchatytska Str, 04070)',
  `updated_at` = NOW()
 WHERE `id` = 944 AND `country_id` = 'ukraine' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Muscat - Kempinski Hotel Muscat, Al Mouj',
  `description` = 'Hôtel Kempinski à Al Mouj, Mascate. Le site de l''hôtel liste un bar nommé 1897 Cocktail Lounge ; aucune page officielle actuelle ne mentionne de salon cigares.',
  `description_en` = 'Kempinski Hotel in Al Mouj, Muscat. The hotel''s website lists a bar named 1897 Cocktail Lounge; no current official page mentions a cigar lounge.',
  `description_es` = 'Hotel Kempinski en Al Mouj, Mascate. El sitio web del hotel enumera un bar llamado 1897 Cocktail Lounge; ninguna página oficial actual menciona un salón de cigarros.',
  `description_de` = 'Hotel Kempinski in Al Mouj, Maskat. Die Website des Hotels führt eine Bar namens 1897 Cocktail Lounge auf; keine aktuelle offizielle Seite erwähnt einen Zigarrensalon.',
  `description_zh` = '位于马斯喀特 Al Mouj 的 Kempinski 酒店。酒店网站列有一家名为 1897 Cocktail Lounge 的酒吧；目前没有任何官方页面提及雪茄厅。',
  `description_ar` = 'فندق Kempinski في الموج بمسقط. يدرج موقع الفندق بارًا باسم 1897 Cocktail Lounge؛ ولا تذكر أي صفحة رسمية حالية صالة للسيجار.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : kempinski.com (Liste 11 lieux dont ''1897 Cocktail Lounge'' ; aucun cigar lounge) ; kempinski.com (classic malt whiskies and cocktails ... European-style lounge ; 17:00-01:00) ; kempinski.com (the modern community of Al Mouj, Muscat (pas Shatti Al Qurum))',
  `updated_at` = NOW()
 WHERE `id` = 1000 AND `country_id` = 'oman' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Caracas — Altamira Suites, 1ra Avenida con 1ra Transversal, Los Palos Grandes',
  `description` = 'Hôtel Altamira Suites, à Los Palos Grandes (Caracas). Son site publie ses lieux de restauration : 360 Caracas (bar-lounge au 19e étage), Magnolia et Otokam by Makoto ; aucun espace cigares n''y figure.',
  `description_en` = 'Altamira Suites hotel, in Los Palos Grandes (Caracas). Its website lists its dining venues: 360 Caracas (lounge bar on the 19th floor), Magnolia and Otokam by Makoto; no cigar space appears there.',
  `description_es` = 'Hotel Altamira Suites, en Los Palos Grandes (Caracas). Su sitio web publica sus espacios de restauración: 360 Caracas (bar-lounge en la planta 19), Magnolia y Otokam by Makoto; no figura ningún espacio de cigarros.',
  `description_de` = 'Hotel Altamira Suites in Los Palos Grandes (Caracas). Seine Website nennt die Gastronomiebetriebe: 360 Caracas (Lounge-Bar im 19. Stock), Magnolia und Otokam by Makoto; ein Zigarrenbereich ist dort nicht aufgeführt.',
  `description_zh` = 'Altamira Suites 酒店,位于加拉加斯的 Los Palos Grandes。其网站列出的餐饮场所有:360 Caracas(19楼酒廊吧)、Magnolia 和 Otokam by Makoto;其中未见雪茄空间。',
  `description_ar` = 'فندق Altamira Suites في Los Palos Grandes (كاراكاس). ينشر موقعه أماكن تقديم الطعام فيه: 360 Caracas (بار صالة في الطابق 19) وMagnolia وOtokam by Makoto؛ ولا يرد فيه أي فضاء للسيجار.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : alsuites.com (Restaurants & Bar Lounge : 360 Caracas, Magnolia, Otokam ; aucune mention de cigares) ; alsuites.com (Adresse : 1era Avenida con 1era Transversal de Los Palos Grandes)',
  `updated_at` = NOW()
 WHERE `id` = 1107 AND `country_id` = 'venezuela' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Ciudad de Panamá - Calle Primera, Casco Antiguo, Paseo de las Bóvedas',
  `description` = 'La Casa del Habano de Panamá, dans le Casco Antiguo (Calle Primera, Paseo de las Bóvedas). Habanos S.A. annonce son ouverture le 28 novembre 2019, par Tropical Cigars, sous-distributeur de Caribbean Cigars Corporation.',
  `description_en` = 'La Casa del Habano in Panama, in the Casco Antiguo (Calle Primera, Paseo de las Bóvedas). Habanos S.A. announces its opening on 28 November 2019, by Tropical Cigars, sub-distributor of Caribbean Cigars Corporation.',
  `description_es` = 'La Casa del Habano de Panamá, en el Casco Antiguo (Calle Primera, Paseo de las Bóvedas). Habanos S.A. anuncia su apertura el 28 de noviembre de 2019, a cargo de Tropical Cigars, subdistribuidor de Caribbean Cigars Corporation.',
  `description_de` = 'La Casa del Habano in Panama, im Casco Antiguo (Calle Primera, Paseo de las Bóvedas). Habanos S.A. gibt ihre Eröffnung am 28. November 2019 bekannt, durch Tropical Cigars, Unterverteiler von Caribbean Cigars Corporation.',
  `description_zh` = '巴拿马城的 La Casa del Habano，位于旧城区 Casco Antiguo（Calle Primera, Paseo de las Bóvedas）。Habanos S.A. 宣布其于 2019 年 11 月 28 日由 Tropical Cigars 开业，后者是 Caribbean Cigars Corporation 的分销商下属的次级经销商。',
  `description_ar` = 'La Casa del Habano في بنما، في Casco Antiguo (Calle Primera, Paseo de las Bóvedas). تعلن Habanos S.A. افتتاحها في 28 نوفمبر 2019 على يد Tropical Cigars، الموزّع الفرعي لـ Caribbean Cigars Corporation.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : lacasadelhabano.com (Calle Primera, Casco Antiguo, Paseo de las Bóvedas, Ciudad Panamá) ; habanos.com (opened Nov 28, 2019 ''In the center of the Old Town of Panama City'') ; lacasadelhabanopanama.com (boutique en ligne La Casa del Habano Panamá (sans adresse))',
  `updated_at` = NOW()
 WHERE `id` = 1171 AND `country_id` = 'panama' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Abidjan, Cocody — Boulevard Hassan II',
  `description` = 'Hôtel Sofitel Abidjan Hôtel Ivoire, boulevard Hassan II à Cocody. La liste officielle de ses bars (Cacao Lounge, Link Bar, Oasis Pool Bar, Le Jardin Pool Bar) ne mentionne ni fumoir ni cigares ; la présence d''un espace cigares n''est pas établie.',
  `description_en` = 'Sofitel Abidjan Hôtel Ivoire, boulevard Hassan II in Cocody. The official list of its bars (Cacao Lounge, Link Bar, Oasis Pool Bar, Le Jardin Pool Bar) mentions neither a smoking room nor cigars; the presence of a cigar space has not been established.',
  `description_es` = 'Hotel Sofitel Abidjan Hôtel Ivoire, boulevard Hassan II, en Cocody. La lista oficial de sus bares (Cacao Lounge, Link Bar, Oasis Pool Bar, Le Jardin Pool Bar) no menciona ni fumadero ni cigarros; la presencia de un espacio de cigarros no está establecida.',
  `description_de` = 'Hotel Sofitel Abidjan Hôtel Ivoire, boulevard Hassan II in Cocody. Die offizielle Liste seiner Bars (Cacao Lounge, Link Bar, Oasis Pool Bar, Le Jardin Pool Bar) erwähnt weder einen Raucherraum noch Zigarren; das Vorhandensein eines Zigarrenbereichs ist nicht belegt.',
  `description_zh` = 'Sofitel Abidjan Hôtel Ivoire 酒店，位于科科迪的 boulevard Hassan II。其酒吧官方清单（Cacao Lounge、Link Bar、Oasis Pool Bar、Le Jardin Pool Bar）未提及吸烟室或雪茄；是否设有雪茄区域尚未确认。',
  `description_ar` = 'فندق Sofitel Abidjan Hôtel Ivoire، boulevard Hassan II في كوكودي. لا تذكر القائمة الرسمية لحاناته (Cacao Lounge وLink Bar وOasis Pool Bar وLe Jardin Pool Bar) غرفة تدخين ولا سيجارًا؛ ولم يثبت وجود مساحة للسيجار.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : sofitel.accor.com (Bars : Cacao Lounge, Le Jardin Pool Bar, Link Bar, Oasis Pool Bar ; aucun fumoir) ; sofitel.accor.com (via recherche : Link Bar, bar du lobby (champagne, cocktails) ; pas de cigares)',
  `updated_at` = NOW()
 WHERE `id` = 1191 AND `country_id` = 'ivorycoast' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Marrakech',
  `description` = 'Le Churchill est l''un des quatre bars de l''hôtel La Mamounia, à Marrakech. La page officielle du bar, lue le 29 octobre 2026, ne mentionne ni fumoir ni cigares : l''existence d''un fumoir ou d''une carte de cigares n''est pas établie.',
  `description_en` = 'Le Churchill is one of the four bars of the La Mamounia hotel in Marrakech. The bar''s official page, read on 29 October 2026, mentions neither a smoking room nor cigars: the existence of a smoking room or a cigar menu is not established.',
  `description_es` = 'Le Churchill es uno de los cuatro bares del hotel La Mamounia, en Marrakech. La página oficial del bar, consultada el 29 de octubre de 2026, no menciona ni fumadero ni cigarros: no se ha establecido la existencia de un fumadero ni de una carta de cigarros.',
  `description_de` = 'Le Churchill ist eine der vier Bars des Hotels La Mamounia in Marrakesch. Die offizielle Seite der Bar, am 29. Oktober 2026 gelesen, erwähnt weder einen Raucherraum noch Zigarren: Ob es einen Raucherraum oder eine Zigarrenkarte gibt, ist nicht belegt.',
  `description_zh` = 'Le Churchill 是马拉喀什 La Mamounia 酒店的四间酒吧之一。该酒吧的官方页面(2026年10月29日查阅)未提及吸烟室或雪茄:是否设有吸烟室或雪茄酒单,尚无依据。',
  `description_ar` = 'Le Churchill هو أحد البارات الأربعة في فندق La Mamounia في مراكش. لا تذكر الصفحة الرسمية للبار، التي اطُّلع عليها في 29 أكتوبر 2026، غرفة تدخين ولا سيجارًا: ولم يثبت وجود غرفة تدخين أو قائمة سيجار.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : mamounia.com (« Les 4 bars de la Mamounia » : Majorelle, Le Club, Piscine, Le Churchill ; aucun fumoir ni salon cigares liste) ; mamounia.com (Le Churchill : bar, decor wagon Pullman, champagnes, spiritueux, cocktails ; ni cigares ni fumoir mentionnes)',
  `updated_at` = NOW()
 WHERE `id` = 1201 AND `country_id` = 'morocco' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Milano — Via Manzoni 45',
  `description` = 'Club privé de Milan, installé Via Manzoni 45, fondé en 1841 selon son site officiel. Le site ne mentionne ni salle fumeurs ni cigares.',
  `description_en` = 'Private club in Milan, located at Via Manzoni 45, founded in 1841 according to its official website. The website mentions neither a smoking room nor cigars.',
  `description_es` = 'Club privado de Milán, situado en Via Manzoni 45, fundado en 1841 según su sitio web oficial. El sitio no menciona ni sala de fumadores ni puros.',
  `description_de` = 'Privatclub in Mailand, Via Manzoni 45, laut seiner offiziellen Website 1841 gegründet. Die Website erwähnt weder einen Raucherraum noch Zigarren.',
  `description_zh` = '米兰的私人俱乐部，位于 Via Manzoni 45，据其官方网站称创立于 1841 年。该网站未提及吸烟室或雪茄。',
  `description_ar` = 'نادٍ خاص في ميلانو، يقع في Via Manzoni 45، تأسس عام 1841 بحسب موقعه الرسمي. ولا يذكر الموقع غرفة للتدخين ولا السيجار.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : circolodellunione.it (Circolo dell''Unione di Milano, Via Manzoni 45, fondé le 28 mai 1841 ; ni cigares ni salle fumeurs)',
  `updated_at` = NOW()
 WHERE `id` = 1368 AND `country_id` = 'italy' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'La Havane — Calle San Carlos 806 (usine Partagás) ; ancien site Industria 520, Centro Habana (bâtiment fermé depuis 2020)',
  `description` = 'Manufacture Partagás, marque fondée en 1845. L''ancien bâtiment de la Calle Industria 520 (derrière le Capitole) a cessé d''être l''usine après 2011 ; Habanos S.A. indique que l''usine se trouve aujourd''hui Calle San Carlos 806. La boutique La Casa del Habano Partagás, installée dans l''ancien bâtiment, a fermé en 2020 après un effondrement de toit et a rouvert au 1 Calle Bernaza. À vérifier : visites et existence d''un showroom, non établis par les sources lues.',
  `description_en` = 'Partagás factory, a brand founded in 1845. The former building at Calle Industria 520 (behind the Capitolio) ceased to be the factory after 2011; Habanos S.A. states that the factory is now at Calle San Carlos 806. The La Casa del Habano Partagás shop, housed in the former building, closed in 2020 after a roof collapse and reopened at 1 Calle Bernaza. To be verified: tours and the existence of a showroom, not established by the sources read.',
  `description_es` = 'Manufactura Partagás, marca fundada en 1845. El antiguo edificio de la Calle Industria 520 (detrás del Capitolio) dejó de ser la fábrica después de 2011; Habanos S.A. indica que la fábrica se encuentra hoy en la Calle San Carlos 806. La tienda La Casa del Habano Partagás, instalada en el antiguo edificio, cerró en 2020 tras el derrumbe de un techo y reabrió en el 1 de la Calle Bernaza. Por verificar: visitas y existencia de un showroom, no establecidos por las fuentes consultadas.',
  `description_de` = 'Manufaktur Partagás, Marke gegründet 1845. Das ehemalige Gebäude in der Calle Industria 520 (hinter dem Capitolio) war nach 2011 nicht mehr die Fabrik; Habanos S.A. gibt an, dass sich die Fabrik heute in der Calle San Carlos 806 befindet. Das im ehemaligen Gebäude untergebrachte Geschäft La Casa del Habano Partagás schloss 2020 nach einem Dacheinsturz und eröffnete in der Calle Bernaza 1 wieder. Zu prüfen: Besichtigungen und das Vorhandensein eines Showrooms, durch die gesichteten Quellen nicht belegt.',
  `description_zh` = 'Partagás 制造厂，该品牌创立于1845年。Calle Industria 520 号（国会大厦后方）的旧建筑在2011年后不再作为工厂；Habanos S.A. 称工厂现位于 Calle San Carlos 806。设在旧建筑内的 La Casa del Habano Partagás 店铺于2020年因屋顶坍塌关闭，后在 Calle Bernaza 1 号重新开业。待核实：参观以及是否设有展厅，所查阅来源均未确认。',
  `description_ar` = 'مصنع Partagás، علامة تأسست عام 1845. لم يعد المبنى القديم في Calle Industria 520 (خلف الكابيتوليو) مصنعًا بعد 2011؛ وتفيد Habanos S.A. بأن المصنع يقع اليوم في Calle San Carlos 806. أُغلق متجر La Casa del Habano Partagás، الذي كان في المبنى القديم، عام 2020 إثر انهيار سقف، وأُعيد افتتاحه في 1 Calle Bernaza. يجب التحقق: الزيارات ووجود صالة عرض، لم تثبتها المصادر المطّلع عليها.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : habanos.com (Today, the Factory is located at 806 San Carlos Street) ; habanos.com (Located at No. 520 Industria Street, behind Havana''s Capitol Building (article de 2003)) ; cigaraficionado.com (entire building has now been closed until its structural integrity can be checked (1er juillet 2020))',
  `updated_at` = NOW()
 WHERE `id` = 1563 AND `country_id` = 'cuba' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'La Havane — Empedrado 207 (entre Cuba et San Ignacio), Habana Vieja',
  `description` = 'Bar-restaurant de la Habana Vieja, Calle Empedrado 207, repris sous ce nom depuis 1942 selon la presse cubaine. Aucune source lue n''atteste une terrasse cigares ni une vente de cigares sur place.',
  `description_en` = 'Bar-restaurant in Habana Vieja, Calle Empedrado 207, operating under this name since 1942 according to the Cuban press. No source read attests a cigar terrace or the sale of cigars on site.',
  `description_es` = 'Bar-restaurante de La Habana Vieja, Calle Empedrado 207, con este nombre desde 1942 según la prensa cubana. Ninguna fuente consultada acredita una terraza de cigarros ni la venta de cigarros en el local.',
  `description_de` = 'Bar-Restaurant in Habana Vieja, Calle Empedrado 207, laut der kubanischen Presse seit 1942 unter diesem Namen geführt. Keine gelesene Quelle belegt eine Zigarrenterrasse oder einen Zigarrenverkauf vor Ort.',
  `description_zh` = '哈瓦那老城(Habana Vieja)的酒吧餐厅,地址:Calle Empedrado 207;据古巴媒体报道,自1942年起以此名称经营。已查阅的资料均未证明设有雪茄露台或在店内出售雪茄。',
  `description_ar` = 'بار ومطعم في هافانا القديمة (Habana Vieja)، Calle Empedrado 207، يعمل بهذا الاسم منذ عام 1942 بحسب الصحافة الكوبية. لا يثبت أي مصدر اطُّلع عليه وجود شرفة للسيجار أو بيع السيجار في المكان.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : cubanet.org (Empedrado no.207, entre Cuba y San Ignacio (extrait de recherche ; page non lisible, 403)) ; diffordsguide.com (fiche bar La Bodeguita del Medio, La Havane (extrait de recherche ; page non lue))',
  `updated_at` = NOW()
 WHERE `id` = 1565 AND `country_id` = 'cuba' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'La Havane — Palacio de Convenciones, Calle 146, Playa (édition annuelle, février)',
  `description` = 'Festival del Habano, rendez-vous organisé par Habanos S.A. depuis 1999. L''édition XXVI, prévue du 23 au 27 février 2026, a d''abord été reportée puis, selon une annonce du comité organisateur du 20 juillet 2026, ne se tiendra pas cette année. Aucune nouvelle date n''est annoncée.',
  `description_en` = 'Festival del Habano, an event organised by Habanos S.A. since 1999. The XXVI edition, scheduled for 23 to 27 February 2026, was first postponed and then, according to an announcement by the organising committee on 20 July 2026, will not be held this year. No new date has been announced.',
  `description_es` = 'Festival del Habano, encuentro organizado por Habanos S.A. desde 1999. La edición XXVI, prevista del 23 al 27 de febrero de 2026, fue aplazada primero y, según un anuncio del comité organizador del 20 de julio de 2026, no se celebrará este año. No se ha anunciado ninguna nueva fecha.',
  `description_de` = 'Festival del Habano, eine von Habanos S.A. seit 1999 veranstaltete Zusammenkunft. Die XXVI. Ausgabe, geplant vom 23. bis 27. Februar 2026, wurde zunächst verschoben und findet laut einer Mitteilung des Organisationskomitees vom 20. Juli 2026 in diesem Jahr nicht statt. Ein neuer Termin wurde nicht bekannt gegeben.',
  `description_zh` = 'Festival del Habano，自 1999 年起由 Habanos S.A. 举办的活动。原定于 2026 年 2 月 23 日至 27 日举行的第 XXVI 届先被推迟，据组委会 2026 年 7 月 20 日的公告，今年将不再举行。目前未公布新的日期。',
  `description_ar` = 'Festival del Habano، فعالية تنظمها Habanos S.A. منذ عام 1999. النسخة السادسة والعشرون، المقررة من 23 إلى 27 فبراير 2026، أُجّلت أولًا ثم لن تُقام هذا العام بحسب إعلان للجنة المنظمة في 20 يوليو 2026. ولم يُعلن عن أي موعد جديد.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : cigaraficionado.com (the 26th Habano Festival will not be held this year (20 juillet 2026)) ; habanos.com (annonce de report du festival (page issue de la recherche, non lue en détail)) ; halfwheel.com (XXVI prévu du 23 au 27 février 2026 (extrait de recherche))',
  `updated_at` = NOW()
 WHERE `id` = 1566 AND `country_id` = 'cuba' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Santiago de los Caballeros (chaque février) ; volet La Romana annulé en 2026',
  `description` = 'Festival annuel d''une association de fabricants dominicains (Procigar), en février : visites de manufactures et de champs de tabac, dîners et vente aux enchères caritative. Édition 2026 tenue à Santiago de los Caballeros, son volet à La Romana ayant été annulé (Cigar Coop, février 2026).',
  `description_en` = 'Annual festival of a Dominican manufacturers'' association (Procigar), in February: visits to factories and tobacco fields, dinners and a charity auction. The 2026 edition was held in Santiago de los Caballeros, its La Romana leg having been cancelled (Cigar Coop, February 2026).',
  `description_es` = 'Festival anual de una asociación de fabricantes dominicanos (Procigar), en febrero: visitas a fábricas y campos de tabaco, cenas y subasta benéfica. La edición de 2026 se celebró en Santiago de los Caballeros, con su parte en La Romana cancelada (Cigar Coop, febrero de 2026).',
  `description_de` = 'Jährliches Festival eines Verbands dominikanischer Hersteller (Procigar), im Februar: Besichtigungen von Manufakturen und Tabakfeldern, Abendessen und eine Wohltätigkeitsauktion. Die Ausgabe 2026 fand in Santiago de los Caballeros statt, der Teil in La Romana wurde abgesagt (Cigar Coop, Februar 2026).',
  `description_zh` = '多米尼加制造商协会（Procigar）每年2月举办的节庆：参观工厂和烟田、晚宴及慈善拍卖。2026年一届在圣地亚哥-德洛斯卡瓦列罗斯举行，其在拉罗马纳的部分已被取消（Cigar Coop，2026年2月）。',
  `description_ar` = 'مهرجان سنوي لجمعية مصنّعين دومينيكيين (Procigar)، في فبراير: زيارات للمصانع وحقول التبغ، وعشاءات ومزاد خيري. أُقيمت دورة 2026 في سانتياغو دي لوس كاباييروس، مع إلغاء فقرتها في لا رومانا (Cigar Coop، فبراير 2026).',
  `source` = 'à vérifier — relu le 29 octobre 2026 : cigar-coop.com (''that portion of the festival has been cancelled for 2026'' ; festival à Santiago du 17 au 20 février 2026) ; diariolibre.com (Asociación de Productores de Cigarros de la República Dominicana (Procigar) organise ; visites fabriques et champs)',
  `updated_at` = NOW()
 WHERE `id` = 1572 AND `country_id` = 'dominican' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'La Romana — Casa de Campo Resort',
  `description` = 'Casa de Campo est un resort de La Romana ; la manufacture Tabacalera de García se trouve dans la zone franche voisine, hors du resort. Un salon-boutique Casa Montecristo, centre visiteurs de la manufacture, est signalé à Altos de Chavón (billet du blog du resort, 2009, mis à jour en 2022).',
  `description_en` = 'Casa de Campo is a resort in La Romana; the Tabacalera de García factory is located in the neighbouring free-trade zone, outside the resort. A Casa Montecristo lounge-shop, the factory''s visitor centre, is reported at Altos de Chavón (resort blog post, 2009, updated in 2022).',
  `description_es` = 'Casa de Campo es un resort de La Romana; la fábrica Tabacalera de García se encuentra en la zona franca vecina, fuera del resort. Se señala un salón-tienda Casa Montecristo, centro de visitantes de la fábrica, en Altos de Chavón (entrada del blog del resort, 2009, actualizada en 2022).',
  `description_de` = 'Casa de Campo ist ein Resort in La Romana; die Manufaktur Tabacalera de García liegt in der benachbarten Freihandelszone, außerhalb des Resorts. Ein Salon mit Geschäft Casa Montecristo, das Besucherzentrum der Manufaktur, wird in Altos de Chavón gemeldet (Beitrag im Blog des Resorts, 2009, 2022 aktualisiert).',
  `description_zh` = 'Casa de Campo 是拉罗马纳(La Romana)的度假村;Tabacalera de García 工厂位于邻近的自由贸易区,不在度假村内。据报道,Altos de Chavón 设有 Casa Montecristo 雪茄厅兼商店,即该工厂的访客中心(度假村博客文章,2009年,2022年更新)。',
  `description_ar` = 'Casa de Campo منتجع في La Romana؛ ويقع مصنع Tabacalera de García في المنطقة الحرة المجاورة، خارج المنتجع. ويُشار إلى صالون ومتجر Casa Montecristo، مركز زوار المصنع، في Altos de Chavón (تدوينة من مدونة المنتجع، 2009، حُدّثت في 2022).',
  `source` = 'à vérifier — relu le 29 octobre 2026 : casadecampo.com.do (Site officiel : Polo Fields, rubrique Bars & Nightlife ; ni salon cigares ni manufacture mentionnés) ; casadecampoliving.com (Casa Montecristo, Altos de Chavón : salon, boutique et centre visiteurs de Tabacalera de García, à la zone franche hors du resort ) ; cigaraficionado.com (Tabacalera de Garcia next to the resort ; Cigar Country Megastore et salon (nov-déc 2018))',
  `updated_at` = NOW()
 WHERE `id` = 1575 AND `country_id` = 'dominican' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Monaco — Place du Casino, MC 98000',
  `description` = 'Bar Américain de l''Hôtel de Paris Monte-Carlo (Société des Bains de Mer), Place du Casino ; le site de la SBM le range parmi ses bars proposant des cigares.',
  `description_en` = 'Bar Américain of the Hôtel de Paris Monte-Carlo (Société des Bains de Mer), Place du Casino; the SBM website lists it among its bars offering cigars.',
  `description_es` = 'Bar Américain del Hôtel de Paris Monte-Carlo (Société des Bains de Mer), Place du Casino; el sitio de la SBM lo incluye entre sus bares que ofrecen puros.',
  `description_de` = 'Bar Américain des Hôtel de Paris Monte-Carlo (Société des Bains de Mer), Place du Casino; die Website der SBM führt sie unter ihren Bars mit Zigarrenangebot auf.',
  `description_zh` = '巴黎大酒店 Hôtel de Paris Monte-Carlo（Société des Bains de Mer）内的 Bar Américain，位于 Place du Casino；SBM 网站将其列入提供雪茄的酒吧之中。',
  `description_ar` = 'Bar Américain في فندق Hôtel de Paris Monte-Carlo (Société des Bains de Mer)، Place du Casino؛ ويدرجه موقع SBM ضمن باراته التي تقدّم السيجار.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : montecarlosbm.com (Bar Américain : « Cigare » listé parmi les services ; velours, cuir, musique live)',
  `updated_at` = NOW()
 WHERE `id` = 1613 AND `country_id` = 'monaco' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Monaco — Place du Casino, MC 98000',
  `description` = 'Monte-Carlo Cigar Club, dans le Casino de Monte-Carlo (Société des Bains de Mer, avec Dominique London) : fumoir, bar et humidor walk-in ; accès sur parrainage selon la SBM.',
  `description_en` = 'Monte-Carlo Cigar Club, in the Casino de Monte-Carlo (Société des Bains de Mer, with Dominique London): smoking room, bar and walk-in humidor; access by sponsorship according to the SBM.',
  `description_es` = 'Monte-Carlo Cigar Club, en el Casino de Monte-Carlo (Société des Bains de Mer, con Dominique London): fumadero, bar y humidor walk-in; acceso por patrocinio según la SBM.',
  `description_de` = 'Monte-Carlo Cigar Club im Casino de Monte-Carlo (Société des Bains de Mer, mit Dominique London): Raucherraum, Bar und begehbarer Humidor; Zugang auf Empfehlung eines Mitglieds laut SBM.',
  `description_zh` = 'Monte-Carlo Cigar Club，位于蒙特卡洛赌场（Société des Bains de Mer，与 Dominique London 合作）：吸烟室、酒吧和步入式雪茄保湿室；据 SBM，需经担保人推荐方可入内。',
  `description_ar` = 'Monte-Carlo Cigar Club، داخل كازينو Monte-Carlo (Société des Bains de Mer، بالتعاون مع Dominique London): غرفة تدخين وبار وغرفة ترطيب يمكن دخولها؛ الدخول بتزكية وفق SBM.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : montecarlosbm.com (Monte-Carlo Cigar Club au Casino, ancien bureau de François Blanc ; « membres parrainés ») ; hellomonaco.com (Article du 11 oct. 2024 : club dans le Casino, ouverture annoncée printemps 2025, accès réservé aux membres)',
  `updated_at` = NOW()
 WHERE `id` = 1615 AND `country_id` = 'monaco' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Monaco — 4 avenue de la Madone, MC 98000',
  `description` = 'Lobby Bar de l''Hôtel Métropole Monte-Carlo ; la page du site de l''hôtel consacrée aux cigares (octobre 2026) mentionne des cigares au Lobby Bar et deux terrasses où fumer (jardins du Casino, piscine Odyssey).',
  `description_en` = 'Lobby Bar of the Hôtel Métropole Monte-Carlo; the hotel website''s page on cigars (October 2026) mentions cigars at the Lobby Bar and two terraces where smoking is possible (Casino gardens, Odyssey pool).',
  `description_es` = 'Lobby Bar del Hôtel Métropole Monte-Carlo; la página del sitio web del hotel dedicada a los cigarros (octubre de 2026) menciona cigarros en el Lobby Bar y dos terrazas donde fumar (jardines del Casino, piscina Odyssey).',
  `description_de` = 'Lobby Bar des Hôtel Métropole Monte-Carlo; die den Zigarren gewidmete Seite der Hotel-Website (Oktober 2026) nennt Zigarren in der Lobby Bar und zwei Terrassen zum Rauchen (Casino-Gärten, Odyssey-Pool).',
  `description_zh` = 'Hôtel Métropole Monte-Carlo 的 Lobby Bar;酒店网站上介绍雪茄的页面(2026年10月)提到 Lobby Bar 供应雪茄,另有两处可吸烟的露台(赌场花园、Odyssey 泳池)。',
  `description_ar` = 'Lobby Bar في Hôtel Métropole Monte-Carlo؛ وتذكر صفحة موقع الفندق المخصصة للسيجار (أكتوبر 2026) السيجار في Lobby Bar وشرفتين يمكن التدخين فيهما (حدائق الكازينو، مسبح Odyssey).',
  `source` = 'à vérifier — relu le 29 octobre 2026 : metropole.com (Cigares au Lobby Bar ; fumer sur deux terrasses (jardins du Casino, piscine Odyssey) ; daté octobre 2026) ; metropole.com (Restauration : Lobby Bar, Les Ambassadeurs, Yoshi ; piscine Odyssey ; 4 avenue de la Madone, +377 93 15 15 15)',
  `updated_at` = NOW()
 WHERE `id` = 1616 AND `country_id` = 'monaco' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Bangkok — InterContinental Bangkok, 973 Phloen Chit Road, Lumpini, Pathum Wan, 10330',
  `description` = 'Bar à cigares et whiskies de l''hôtel InterContinental Bangkok. Selon la page de l''hôtel, la carte propose des cigares de Cuba et d''ailleurs, avec une carte cigares et whiskies distincte.',
  `description_en` = 'Cigar and whisky bar of the InterContinental Bangkok hotel. According to the hotel''s page, the menu offers cigars from Cuba and elsewhere, with a separate cigar and whisky list.',
  `description_es` = 'Bar de puros y whiskies del hotel InterContinental Bangkok. Según la página del hotel, la carta ofrece puros de Cuba y de otros orígenes, con una carta de puros y whiskies aparte.',
  `description_de` = 'Zigarren- und Whiskybar des Hotels InterContinental Bangkok. Laut der Seite des Hotels bietet die Karte Zigarren aus Kuba und anderen Herkunftsländern, mit einer gesonderten Zigarren- und Whiskykarte.',
  `description_zh` = '曼谷洲际酒店（InterContinental Bangkok）的雪茄与威士忌吧。据酒店页面，酒单提供古巴及其他产地的雪茄，另有单独的雪茄与威士忌酒单。',
  `description_ar` = 'بار للسيجار والويسكي في فندق InterContinental Bangkok. بحسب صفحة الفندق، تقدّم القائمة سيجارًا من كوبا ومن بلدان أخرى، مع قائمة منفصلة للسيجار والويسكي.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : bangkok.intercontinental.com (973 Phloen Chit Road, Lumpini, Pathum Wan, Bangkok 10330 ; ouvert 08.00 à 24.00) ; ihgplc.com (Humidor, élément nouveau du Balcony Lounge rénové (communiqué IHG, 26 mai 2009, via recherche))',
  `updated_at` = NOW()
 WHERE `id` = 2498 AND `country_id` = 'thailand' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Kuala Lumpur — Pavilion KL, Lot 2.33.02, niveau 2, Couture Pavilion, 168 Jalan Bukit Bintang',
  `description` = 'Boutique Davidoff du centre commercial Pavilion KL, niveau 2 (Couture Pavilion), lot 2.33.02 ; 42,5 m² selon la page du centre.',
  `description_en` = 'Davidoff boutique in the Pavilion KL shopping centre, level 2 (Couture Pavilion), lot 2.33.02; 42.5 m² according to the centre''s page.',
  `description_es` = 'Boutique Davidoff del centro comercial Pavilion KL, nivel 2 (Couture Pavilion), local 2.33.02; 42,5 m² según la página del centro.',
  `description_de` = 'Davidoff-Boutique im Einkaufszentrum Pavilion KL, Ebene 2 (Couture Pavilion), Einheit 2.33.02; 42,5 m² laut Seite des Zentrums.',
  `description_zh` = 'Davidoff 精品店，位于 Pavilion KL 购物中心2层（Couture Pavilion），2.33.02 号铺位；据购物中心页面，面积42.5平方米。',
  `description_ar` = 'بوتيك Davidoff في مركز Pavilion KL التجاري، الطابق 2 (Couture Pavilion)، الوحدة 2.33.02؛ مساحته 42.5 م² وفق صفحة المركز.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : pavilion-kl.com (Davidoff, Niveau 2 Couture Pavilion, lot 2.33.02, 42,5 m², 10h-22h) ; en.worldtempus.com (2009 : premier flagship de KL au Starhill Gallery (UG 12), 70 m² : autre adresse, ancienne)',
  `updated_at` = NOW()
 WHERE `id` = 2509 AND `country_id` = 'malaysia' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Dakar — 40 rue Jules Ferry',
  `description` = 'Boutique désignée Habanos Specialist, 40 rue Jules Ferry à Dakar. Selon l''annonce de Habanos S.A. du 10 décembre 2019 : 60 m² au total, dont un walk-in humidor d''environ 12 m² ; statut accordé par Phoenicia Company T.A.A Cyprus, distributeur exclusif de Habanos pour le Moyen-Orient, l''Afrique et l''Europe.',
  `description_en` = 'Shop designated Habanos Specialist, 40 rue Jules Ferry in Dakar. According to the Habanos S.A. announcement of 10 December 2019: 60 m² in total, including a walk-in humidor of about 12 m²; status granted by Phoenicia Company T.A.A Cyprus, exclusive distributor of Habanos for the Middle East, Africa and Europe.',
  `description_es` = 'Tienda designada Habanos Specialist, 40 rue Jules Ferry, en Dakar. Según el anuncio de Habanos S.A. del 10 de diciembre de 2019: 60 m² en total, incluido un walk-in humidor de unos 12 m²; estatus concedido por Phoenicia Company T.A.A Cyprus, distribuidor exclusivo de Habanos para Oriente Medio, África y Europa.',
  `description_de` = 'Als Habanos Specialist ausgewiesenes Geschäft, 40 rue Jules Ferry in Dakar. Laut der Ankündigung von Habanos S.A. vom 10. Dezember 2019: insgesamt 60 m², darunter ein begehbarer Humidor von etwa 12 m²; der Status wurde von Phoenicia Company T.A.A Cyprus verliehen, dem exklusiven Habanos-Distributor für den Nahen Osten, Afrika und Europa.',
  `description_zh` = '被认定为 Habanos Specialist 的商店,地址:达喀尔 40 rue Jules Ferry。据 Habanos S.A. 2019年12月10日的公告:总面积60平方米,其中包括约12平方米的可步入式雪茄保湿室(walk-in humidor);该资格由 Phoenicia Company T.A.A Cyprus 授予,该公司是 Habanos 在中东、非洲和欧洲的独家经销商。',
  `description_ar` = 'متجر مصنف Habanos Specialist، 40 rue Jules Ferry في داكار. بحسب إعلان Habanos S.A. في 10 ديسمبر 2019: مساحته 60 م² في المجموع، منها غرفة ترطيب (walk-in humidor) بمساحة نحو 12 م²؛ ومُنحت هذه الصفة من Phoenicia Company T.A.A Cyprus، الموزع الحصري لمنتجات Habanos في الشرق الأوسط وأفريقيا وأوروبا.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : habanos.com (El Fumador, 40 Rue Jules Ferry, Dakar ; 60 m2, walk-in humidor 12 m2 ; annonce du 10 décembre 2019) ; habanos.com (Phoenicia Company T.A.A Cyprus, exclusive distributor ... Middle East, Africa and Europe, has granted the status)',
  `updated_at` = NOW()
 WHERE `id` = 2536 AND `country_id` = 'senegal' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Lomé — B6 Immeuble Marina, à côté de Total Marina, BP 1003',
  `description` = 'La Casa del Habano Togo, franchise ouverte à Lomé selon l''annonce de Habanos S.A. du 9 septembre 2021 ; exploitée par LCDC – LCDT La Casa de Cigares, approvisionnée par Phoenicia T.A.A.',
  `description_en` = 'La Casa del Habano Togo, a franchise opened in Lomé according to the Habanos S.A. announcement of 9 September 2021; operated by LCDC – LCDT La Casa de Cigares, supplied by Phoenicia T.A.A.',
  `description_es` = 'La Casa del Habano Togo, franquicia abierta en Lomé según el anuncio de Habanos S.A. del 9 de septiembre de 2021; explotada por LCDC – LCDT La Casa de Cigares, abastecida por Phoenicia T.A.A.',
  `description_de` = 'La Casa del Habano Togo, Franchise, die laut der Mitteilung von Habanos S.A. vom 9. September 2021 in Lomé eröffnet wurde; betrieben von LCDC – LCDT La Casa de Cigares, beliefert von Phoenicia T.A.A.',
  `description_zh` = 'La Casa del Habano Togo，据 Habanos S.A. 2021 年 9 月 9 日的公告在洛美开业的特许经营店；由 LCDC – LCDT La Casa de Cigares 运营，由 Phoenicia T.A.A. 供货。',
  `description_ar` = 'La Casa del Habano Togo، امتياز افتُتح في لومي بحسب إعلان Habanos S.A. في 9 سبتمبر 2021؛ تديره LCDC – LCDT La Casa de Cigares ويموّنه Phoenicia T.A.A.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : habanos.com (B6, Imneuble Marina, a cote de Total Marina, BP:1003, Lomé ; 9 septembre 2021)',
  `updated_at` = NOW()
 WHERE `id` = 2542 AND `country_id` = 'togo' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Petaling Jaya — 20 Jalan Teknologi 3/4, Pusat Teknologi Sinar, Damansara PJU 5, Kota Damansara',
  `description` = 'Salon Cohiba Atmosphere de Kota Damansara (Petaling Jaya), concept créé par Habanos S.A. et mis en oeuvre en Malaisie sous licence ; ouverture annoncée par Habanos en novembre 2019. Exploitant indiqué sur le site du salon : Mighty Milestone Sdn. Bhd.',
  `description_en` = 'Cohiba Atmosphere lounge in Kota Damansara (Petaling Jaya), a concept created by Habanos S.A. and implemented in Malaysia under licence; opening announced by Habanos in November 2019. Operator indicated on the lounge''s website: Mighty Milestone Sdn. Bhd.',
  `description_es` = 'Salón Cohiba Atmosphere de Kota Damansara (Petaling Jaya), concepto creado por Habanos S.A. e implantado en Malasia bajo licencia; apertura anunciada por Habanos en noviembre de 2019. Operador indicado en el sitio web del salón: Mighty Milestone Sdn. Bhd.',
  `description_de` = 'Cohiba-Atmosphere-Lounge in Kota Damansara (Petaling Jaya), ein von Habanos S.A. entwickeltes Konzept, das in Malaysia in Lizenz umgesetzt wird; Eröffnung von Habanos im November 2019 angekündigt. Auf der Website der Lounge angegebener Betreiber: Mighty Milestone Sdn. Bhd.',
  `description_zh` = '位于八打灵再也 Kota Damansara 的 Cohiba Atmosphere 雪茄厅，该概念由 Habanos S.A. 创立，在马来西亚以授权方式运营；Habanos 于2019年11月宣布开业。雪茄厅网站所列运营方：Mighty Milestone Sdn. Bhd.',
  `description_ar` = 'صالة Cohiba Atmosphere في Kota Damansara (Petaling Jaya)، مفهوم ابتكرته Habanos S.A. ويُنفَّذ في ماليزيا بترخيص؛ أعلنت Habanos عن افتتاحها في نوفمبر 2019. المشغّل المذكور على موقع الصالة: Mighty Milestone Sdn. Bhd.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : cohibaatmosphere.com.my (20 Jalan Teknologi 3/4, Kota Damansara ; lundi-samedi 13h-minuit ; exploitant Mighty Milestone Sdn. Bhd) ; habanos.com (Habanos, 6 nov. 2019 : Pacific Cigar Company a le droit d''implanter le concept à KL) ; robbreport.com.my (Robb Report 21 sept. 2020 : Asiaeuro (Jonathan Chow) ; aucun lien avec La Casa del Habano cité)',
  `updated_at` = NOW()
 WHERE `id` = 2558 AND `country_id` = 'malaysia' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Rio de Janeiro — Rua do Rosário 107, Centro',
  `description` = 'Esch Café, rua do Rosário 107, au centre de Rio de Janeiro, recensé comme café par un guide de mai 2016. Il ne figure ni sur le site de la maison ni parmi les Casas del Habano du Brésil listées par lacasadelhabano.com.',
  `description_en` = 'Esch Café, rua do Rosário 107, in central Rio de Janeiro, listed as a café by a May 2016 guide. It appears neither on the company''s website nor among the Casas del Habano of Brazil listed by lacasadelhabano.com.',
  `description_es` = 'Esch Café, rua do Rosário 107, en el centro de Río de Janeiro, catalogado como café por una guía de mayo de 2016. No figura ni en el sitio web de la casa ni entre las Casas del Habano de Brasil incluidas en lacasadelhabano.com.',
  `description_de` = 'Esch Café, rua do Rosário 107, im Zentrum von Rio de Janeiro, von einem Reiseführer vom Mai 2016 als Café verzeichnet. Es erscheint weder auf der Website des Hauses noch unter den Casas del Habano Brasiliens, die lacasadelhabano.com auflistet.',
  `description_zh` = 'Esch Café,地址:里约热内卢市中心 rua do Rosário 107,2016年5月的一本指南将其列为咖啡馆。它既未出现在该品牌网站上,也不在 lacasadelhabano.com 所列的巴西 Casa del Habano 之中。',
  `description_ar` = 'Esch Café، rua do Rosário 107، في وسط ريو دي جانيرو، مصنف كمقهى في دليل صدر في مايو 2016. ولا يرد في موقع الشركة ولا ضمن Casas del Habano في البرازيل المدرجة على lacasadelhabano.com.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : eschcafe.com.br (Deux unités seulement : Esch Oscar (São Paulo) et Esch Leblon (Rio)) ; lacasadelhabano.com (Brésil : LCDH Río de Janeiro/Leblon ; LCDH Sao Paulo/Jardins) ; diariodorio.com (Esch café, Rua do Rosário, 107 ; article du 19/05/16, sans mention de charutos)',
  `updated_at` = NOW()
 WHERE `id` = 2562 AND `country_id` = 'brazil' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Rishon LeZion — rue Yaldei Teheran (n° 3 selon lacasadelhabano.com, n° 6 selon Walla, décembre 2020)',
  `description` = 'Casa del Habano de Rishon LeZion, rayon cigares du magasin Hermitage (Hermitage – Beyond Spirit). Le répertoire lacasadelhabano.com la liste sous le nom LCDH Rishon Le-Zion.',
  `description_en` = 'Casa del Habano in Rishon LeZion, the cigar section of the Hermitage store (Hermitage – Beyond Spirit). The lacasadelhabano.com directory lists it as LCDH Rishon Le-Zion.',
  `description_es` = 'Casa del Habano de Rishon LeZion, sección de puros de la tienda Hermitage (Hermitage – Beyond Spirit). El directorio de lacasadelhabano.com la registra como LCDH Rishon Le-Zion.',
  `description_de` = 'Casa del Habano in Rishon LeZion, Zigarrenabteilung des Geschäfts Hermitage (Hermitage – Beyond Spirit). Das Verzeichnis von lacasadelhabano.com führt sie als LCDH Rishon Le-Zion.',
  `description_zh` = '位于里雄莱锡安（Rishon LeZion）的 Casa del Habano，设在 Hermitage 商店（Hermitage – Beyond Spirit）的雪茄专区。lacasadelhabano.com 名录将其列为 LCDH Rishon Le-Zion。',
  `description_ar` = 'Casa del Habano في ريشون لتسيون، قسم السيجار في متجر Hermitage (Hermitage – Beyond Spirit). يدرجها دليل lacasadelhabano.com باسم LCDH Rishon Le-Zion.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : lacasadelhabano.com (LCDH Rishon Le – Zion, 3 Yaldei Teheran St., Rishon Le-Zion) ; finance.walla.co.il (ילדי טהרן 6 ; מתחם הסיגרים יפעל תחת המותג La Casa del Habano (1.12.2020))',
  `updated_at` = NOW()
 WHERE `id` = 2563 AND `country_id` = 'israel' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Haïfa — 2 Kedoshei Yassi Street (Haifa Congress Center)',
  `description` = 'Casa del Habano de Haïfa, dans le magasin Hermitage – Beyond Spirit du centre des congrès de Haïfa. Le répertoire lacasadelhabano.com la liste sous le nom LCDH Haifa.',
  `description_en` = 'Casa del Habano in Haifa, in the Hermitage – Beyond Spirit shop at the Haifa convention centre. The lacasadelhabano.com directory lists it as LCDH Haifa.',
  `description_es` = 'Casa del Habano de Haifa, en la tienda Hermitage – Beyond Spirit del centro de congresos de Haifa. El directorio lacasadelhabano.com la registra como LCDH Haifa.',
  `description_de` = 'Casa del Habano in Haifa, im Geschäft Hermitage – Beyond Spirit im Kongresszentrum von Haifa. Das Verzeichnis lacasadelhabano.com führt sie unter dem Namen LCDH Haifa.',
  `description_zh` = '海法的 Casa del Habano，位于海法会议中心内的 Hermitage – Beyond Spirit 商店。lacasadelhabano.com 名录将其列为 LCDH Haifa。',
  `description_ar` = 'كاسا ديل هابانو في حيفا، داخل متجر Hermitage – Beyond Spirit في مركز المؤتمرات بحيفا. يدرجها دليل lacasadelhabano.com باسم LCDH Haifa.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : lacasadelhabano.com (LCDH Haifa, 2 Kedoshei Yassi Street, Haifa) ; finance.walla.co.il (Billetterie au Kedoshei Yassi 2, Haïfa ; magasin phare Hermitage (7.5.2023)) ; finance.walla.co.il (Magasin phare au Haifa Congress Center ; Ein Hamifratz = premier magasin de la chaîne)',
  `updated_at` = NOW()
 WHERE `id` = 2564 AND `country_id` = 'israel' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Kreuzlingen — Konstanzerstrasse 8, 8280 Kreuzlingen',
  `description` = 'Casa del Habano ouverte au public le 27 juin 2026 à Kreuzlingen, sur la rive suisse du lac de Constance, par la famille Portmann (Urs Portmann Tabakwaren AG), dans le même bâtiment que sa maison de tabac : humidor accessible à pied et espace salon.',
  `description_en` = 'Casa del Habano opened to the public on 27 June 2026 in Kreuzlingen, on the Swiss shore of Lake Constance, by the Portmann family (Urs Portmann Tabakwaren AG), in the same building as its tobacco shop: a walk-in humidor and a lounge area.',
  `description_es` = 'Casa del Habano abierta al público el 27 de junio de 2026 en Kreuzlingen, en la orilla suiza del lago de Constanza, por la familia Portmann (Urs Portmann Tabakwaren AG), en el mismo edificio que su estanco: humidor accesible a pie y espacio salón.',
  `description_de` = 'Casa del Habano, am 27. Juni 2026 in Kreuzlingen am Schweizer Ufer des Bodensees von der Familie Portmann (Urs Portmann Tabakwaren AG) für die Öffentlichkeit eröffnet, im selben Gebäude wie ihr Tabakwarengeschäft: begehbarer Humidor und Lounge-Bereich.',
  `description_zh` = 'Casa del Habano 于2026年6月27日在博登湖瑞士一侧的克罗伊茨林根(Kreuzlingen)向公众开放,由 Portmann 家族(Urs Portmann Tabakwaren AG)经营,与其烟草店位于同一栋楼内:设有可步入式雪茄保湿室和休息厅。',
  `description_ar` = 'Casa del Habano فُتحت للجمهور في 27 يونيو 2026 في Kreuzlingen، على الضفة السويسرية لبحيرة كونستانس، من قبل عائلة Portmann (Urs Portmann Tabakwaren AG)، في المبنى نفسه الذي يضم متجرها للتبغ: غرفة ترطيب يمكن دخولها سيرًا على الأقدام وفضاء صالون.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : zigarren.zone (On Saturday, 27 June 2026, the new Casa del Habano officially opened its doors) ; lacasadelhabanokreuzlingen.ch (Urs Portmann Tabakwaren AG, Konstanzerstrasse 8, CH-8280 Kreuzlingen)',
  `updated_at` = NOW()
 WHERE `id` = 2572 AND `country_id` = 'switzerland' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Sydney — Shop 29, The Strand Arcade, 412-414 George Street, NSW 2000',
  `description` = 'Boutique Davidoff of Geneva de Sydney, dans la galerie The Strand Arcade, George Street, ouverte en 2025 à la place de l''ancien kiosque Sydney Cigar House ; décrite comme la première boutique Davidoff of Geneva d''Australie (7 mai 2025).',
  `description_en` = 'Davidoff of Geneva shop in Sydney, in The Strand Arcade, George Street, opened in 2025 in place of the former Sydney Cigar House kiosk; described as the first Davidoff of Geneva shop in Australia (7 May 2025).',
  `description_es` = 'Tienda Davidoff of Geneva de Sídney, en la galería The Strand Arcade, George Street, abierta en 2025 en lugar del antiguo quiosco Sydney Cigar House; descrita como la primera tienda Davidoff of Geneva de Australia (7 de mayo de 2025).',
  `description_de` = 'Davidoff-of-Geneva-Geschäft in Sydney, in der The Strand Arcade, George Street, 2025 anstelle des früheren Kiosks Sydney Cigar House eröffnet; beschrieben als erstes Davidoff-of-Geneva-Geschäft in Australien (7. Mai 2025).',
  `description_zh` = '悉尼的 Davidoff of Geneva 店，位于 George Street 的 The Strand Arcade，2025 年开业，取代原 Sydney Cigar House 售货亭；被描述为 Davidoff of Geneva 在澳大利亚的首家店铺（2025 年 5 月 7 日）。',
  `description_ar` = 'متجر Davidoff of Geneva في سيدني، في The Strand Arcade، George Street، افتُتح عام 2025 بدلًا من كشك Sydney Cigar House السابق؛ وُصف بأنه أول متجر Davidoff of Geneva في أستراليا (7 مايو 2025).',
  `source` = 'à vérifier — relu le 29 octobre 2026 : cigarjournal.com (Australia''s first official Davidoff of Geneva store; Shop 29, 412-414 George St; 7 mai 2025) ; strandarcade.com.au (Strand Arcade, 412-414A George St; horaires de la galerie seulement)',
  `updated_at` = NOW()
 WHERE `id` = 2574 AND `country_id` = 'australia' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Bucarest — Băneasa Shopping City, Șoseaua București-Ploiești 42D, secteur 1 (rez-de-chaussée)',
  `description` = 'Boutique Davidoff of Geneva since 1911 du centre commercial Băneasa Shopping City, au nord de Bucarest, ouverte en décembre 2012 (22 janvier 2013) ; le centre commercial la liste toujours, avec téléphone et horaires.',
  `description_en` = 'Davidoff of Geneva since 1911 boutique in the Băneasa Shopping City mall, north of Bucharest, opened in December 2012 (22 January 2013); the mall still lists it, with telephone and opening hours.',
  `description_es` = 'Boutique Davidoff of Geneva since 1911 del centro comercial Băneasa Shopping City, al norte de Bucarest, abierta en diciembre de 2012 (22 de enero de 2013); el centro comercial sigue registrándola, con teléfono y horarios.',
  `description_de` = 'Boutique Davidoff of Geneva since 1911 im Einkaufszentrum Băneasa Shopping City, nördlich von Bukarest, im Dezember 2012 eröffnet (22. Januar 2013); das Einkaufszentrum führt sie weiterhin auf, mit Telefonnummer und Öffnungszeiten.',
  `description_zh` = 'Davidoff of Geneva since 1911 精品店，位于布加勒斯特北部的 Băneasa Shopping City 购物中心，2012年12月开业（2013年1月22日）；该购物中心仍列有该店，并附电话和营业时间。',
  `description_ar` = 'بوتيك Davidoff of Geneva since 1911 في مركز Băneasa Shopping City التجاري، شمال بوخارست، افتُتح في ديسمبر 2012 (22 يناير 2013)؛ ولا يزال المركز التجاري يدرجه مع الهاتف وساعات العمل.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : baneasa.ro (page Magasin Davidoff du centre : Parter ; 0726 262 255 ; « Luni-Duminică, 10:00 - 22:00 » ; Șoseaua București-Ploiești 42D) ; cigaraficionado.com (22 janv. 2013 : ouverte « last month », dans Băneasa Shopping City ; gérant Bogdan Ciocarlan)',
  `updated_at` = NOW()
 WHERE `id` = 2577 AND `country_id` = 'romania' AND `is_verified` = 1;

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 29 octobre 2026 : la boutique des Emirates Towers a été remplacée en 2018 par celle de City Walk (Boulevard 1, ouverte le 22 novembre 2018) selon habanos.com ; la liste d''octobre 2018 la décrit comme ancien site ; à rétablir si une page la dit rouverte', `updated_at` = NOW()
 WHERE `id` = 96 AND `country_id` = 'uae';

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 29 octobre 2026 : fermeture du magasin de Sherbrooke Ouest au 31 mai 2020 (Cigar Aficionado, 21 mai 2020) ; le répertoire lacasadelhabano.com ne compte au Canada qu''Edmonton et Windsor ; à rétablir si une page la dit rouverte', `updated_at` = NOW()
 WHERE `id` = 153 AND `country_id` = 'canada';

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 29 octobre 2026 : fermeture fin 2019 du magasin de Yorkville (Cigar Aficionado, 21 mai 2020) ; le répertoire lacasadelhabano.com ne compte au Canada qu''Edmonton et Windsor ; à rétablir si une page la dit rouverte', `updated_at` = NOW()
 WHERE `id` = 154 AND `country_id` = 'canada';

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 29 octobre 2026 : le Tippling Club de Singapour a fermé le 31 décembre 2024 (Drinks International, 5 décembre 2024 ; Broadsheet, septembre 2025) ; aucun menu d''accords cigares trouvé ; à rétablir si une page le dit rouvert', `updated_at` = NOW()
 WHERE `id` = 1465 AND `country_id` = 'singapore';

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 29 octobre 2026 : la fiche de presse officielle de l''hôtel liste ses bars (Bay-View Lounge, Blue Moon Lounge, CUT Bar & Lounge) sans cigar bar ; quatre requêtes en anglais et en arabe sans trace, un contradicteur ; à rétablir si une page apporte le lieu', `updated_at` = NOW()
 WHERE `id` = 107 AND `country_id` = 'bahrain';

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 29 octobre 2026 : la page officielle de restauration de l''hôtel liste ses bars sans salon cigares ; trois requêtes en anglais et en japonais, un contradicteur ; à rétablir si une page apporte le lieu', `updated_at` = NOW()
 WHERE `id` = 121 AND `country_id` = 'japan';

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 29 octobre 2026 : la liste officielle de l''hôtel (Blue, Jazz Bar, Chocolate Lounge, Osmanly, The Rooftop) ne compte aucun salon cigares ; trois requêtes en anglais et en arabe, un contradicteur ; à rétablir si une page apporte le lieu', `updated_at` = NOW()
 WHERE `id` = 820 AND `country_id` = 'egypt';

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 29 octobre 2026 : la liste officielle de huit lieux de l''hôtel ne compte aucun salon cigares ; trois requêtes, un contradicteur ; à rétablir si une page apporte le lieu', `updated_at` = NOW()
 WHERE `id` = 830 AND `country_id` = 'ghana';

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 29 octobre 2026 : la page officielle de restauration de l''hôtel (Serengeti, Jahazi, Kibo Bar, Pool Bar, Bakers Basket) ne compte aucun salon cigares ; le Cigar Lounge de Dar es Salaam est attribué au Johari Rotana ; trois requêtes, un contradicteur ; à rétablir si une page apporte le lieu', `updated_at` = NOW()
 WHERE `id` = 837 AND `country_id` = 'tanzania';

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 29 octobre 2026 : la page officielle de l''hôtel (Prora, Salin, Abakus Piano Bar, Sensus) et la brochure du groupe ne comptent aucun salon cigares ; seul un agrégateur non daté en cite un ; trois requêtes, un contradicteur ; à rétablir si une page officielle le dit', `updated_at` = NOW()
 WHERE `id` = 938 AND `country_id` = 'croatia';

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 29 octobre 2026 : la page officielle de restauration de l''hôtel (The Square, Armenia Brasserie) ne compte aucun salon cigares ; trois requêtes, un contradicteur ; l''adresse de l''hôtel diffère selon les sources ; à rétablir si une page apporte le lieu', `updated_at` = NOW()
 WHERE `id` = 948 AND `country_id` = 'armenia';

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 29 octobre 2026 : le site de l''hôtel présente la Rote Bar comme un restaurant et la Blaue Bar sans mention de cigares ; trois requêtes en anglais et en allemand, un contradicteur ; à rétablir si une page apporte le lieu', `updated_at` = NOW()
 WHERE `id` = 968 AND `country_id` = 'austria';

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 29 octobre 2026 : la page officielle de l''hôtel ne compte que El Cafetal et Sportsbar Biltmore, sans bar à cigares ; requêtes en anglais et en espagnol, un contradicteur ; à rétablir si une page apporte le lieu', `updated_at` = NOW()
 WHERE `id` = 1113 AND `country_id` = 'guatemala';

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 29 octobre 2026 : la liste officielle des lieux de l''hôtel (Oak Room, Alba Terrace, Library Bar, Market, Lobby) ne compte ni rooftop ni cigares ; quatre requêtes en anglais et en arabe, un contradicteur ; à rétablir si une page apporte le lieu', `updated_at` = NOW()
 WHERE `id` = 1393 AND `country_id` = 'uae';

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 29 octobre 2026 : rien ne relie Sukiyabashi Jiro au Capitol Hotel Tokyu ni à un fumoir : la liste officielle de l''hôtel (Suiren, Hoshigaoka, ORIGAMI, Capitol Bar) et le site du restaurant (Ginza, Roppongi) concordent ; trois requêtes, un contradicteur ; à rétablir si une page apporte le lieu', `updated_at` = NOW()
 WHERE `id` = 1426 AND `country_id` = 'japan';

UPDATE `translation_status` t
  JOIN `lounges` l ON l.`id` = t.`entite_id`
   SET t.`source_hash` = SHA1(l.`description`), t.`statut` = 'machine', t.`maj` = NOW()
 WHERE t.`entite` = 'lounges' AND t.`champ` = 'description' AND t.`entite_id` IN ('2','42','45','46','57','61','65','67','75','77','80','83','89','90','92','93','94','103','104','106','108','109','116','117','118','119','120','122','123','136','139','140','155','159','161','162','164','167','173','175','176','177','178','182','183','184','185','187','188','189','191','193','197','198','282','366','385','646','683','745','828','913','934','944','1000','1107','1171','1191','1201','1368','1563','1565','1566','1572','1575','1613','1615','1616','2498','2509','2536','2542','2558','2562','2563','2564','2572','2574','2577');

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 297';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 297', 'systeme', 'fiches_relues', 'systeme', 0, 'Relecture des lieux restants : 89 fiches reprises, 15 retirees, traductions remises en machine'),
  (NULL,'migration 297','systeme','fiche_retiree','lounge',96,'habanos.com : Casa del Habano Emirates Towers remplacee par City Walk (decembre 2018)'),
  (NULL,'migration 297','systeme','fiche_retiree','lounge',153,'cigaraficionado.com : fermeture mai 2020 ; lacasadelhabano.com : pas de Montreal'),
  (NULL,'migration 297','systeme','fiche_retiree','lounge',154,'cigaraficionado.com : Toronto ferme fin 2019 ; lacasadelhabano.com : pas de Toronto'),
  (NULL,'migration 297','systeme','fiche_retiree','lounge',1465,'drinksint.com : dernier service le 31 decembre 2024 ; broadsheet.com.au : closed'),
  (NULL,'migration 297','systeme','fiche_retiree','lounge',107,'press.fourseasons.com : liste des bars sans cigar bar (regle de la fiche 155)'),
  (NULL,'migration 297','systeme','fiche_retiree','lounge',121,'ritzcarlton.com : liste de la restauration sans salon cigares (regle de la fiche 155)'),
  (NULL,'migration 297','systeme','fiche_retiree','lounge',820,'kempinski.com : liste des bars sans salon cigares (regle de la fiche 155)'),
  (NULL,'migration 297','systeme','fiche_retiree','lounge',830,'kempinski.com : liste des lieux sans salon cigares (regle de la fiche 155)'),
  (NULL,'migration 297','systeme','fiche_retiree','lounge',837,'serenahotels.com : liste de la restauration sans salon cigares (regle de la fiche 155)'),
  (NULL,'migration 297','systeme','fiche_retiree','lounge',938,'adriaticluxuryhotels.com : liste des lieux sans salon cigares (regle de la fiche 155)'),
  (NULL,'migration 297','systeme','fiche_retiree','lounge',948,'marriott.com : restauration sans salon cigares (regle de la fiche 155)'),
  (NULL,'migration 297','systeme','fiche_retiree','lounge',968,'sacher.com : restaurants et bars sans salon cigares (regle de la fiche 155)'),
  (NULL,'migration 297','systeme','fiche_retiree','lounge',1113,'marriott.com : restauration sans bar a cigares (regle de la fiche 155)'),
  (NULL,'migration 297','systeme','fiche_retiree','lounge',1393,'editionhotels.com : restaurants et bars sans rooftop cigares (regle de la fiche 155)'),
  (NULL,'migration 297','systeme','fiche_retiree','lounge',1426,'tokyuhotels.co.jp : restaurants sans Jiro ni fumoir ; sushi-jiro.jp : deux adresses hors hotel');

-- Contrôle : des 1 partout.
SELECT
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (2,42,45,46,57,61,65,67,75,77,80,83,89,90,92,93,94,103,104,106,108,109,116,117,118,119,120,122,123,136,139,140,155,159,161,162,164,167,173,175,176,177,178,182,183,184,185,187,188,189,191,193,197,198,282,366,385,646,683,745,828,913,934,944,1000,1107,1171,1191,1201,1368,1563,1565,1566,1572,1575,1613,1615,1616,2498,2509,2536,2542,2558,2562,2563,2564,2572,2574,2577) AND `source` LIKE 'à vérifier — relu le 29 octobre 2026%') = 89 AS `fiches_relues`,
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (96,153,154,1465,107,121,820,830,837,938,948,968,1113,1393,1426) AND `is_verified` = 0 AND `source` LIKE 'RETIRÉ%') = 15 AS `fiches_retirees`,
  (SELECT COUNT(*) FROM `translation_status` WHERE `entite` = 'lounges' AND `champ` = 'description' AND `entite_id` IN ('2','42','45','46','57','61','65','67','75','77','80','83','89','90','92','93','94','103','104','106','108','109','116','117','118','119','120','122','123','136','139','140','155','159','161','162','164','167','173','175','176','177','178','182','183','184','185','187','188','189','191','193','197','198','282','366','385','646','683','745','828','913','934','944','1000','1107','1171','1191','1201','1368','1563','1565','1566','1572','1575','1613','1615','1616','2498','2509','2536','2542','2558','2562','2563','2564','2572','2574','2577') AND `statut` = 'machine') = 445 AS `sceaux_remis`;
