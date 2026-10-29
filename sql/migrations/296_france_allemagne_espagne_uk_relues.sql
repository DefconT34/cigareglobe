-- ════════════════════════════════════════════════════════
-- 296 — France, Allemagne, Espagne, Royaume-Uni : fiches relues
-- ────────────────────────────────────────────────────────
-- CE QU'ON A TROUVÉ. Relecture des fiches d'établissements du 29 octobre 2026
-- (expert-cigare, une source datée par verdict, contradicteur pour les
-- « introuvables » retirés en 294). 35 fiches reprises : adresse corrigée quand
-- une source la donne, description ramenée à ce que les sources lues établissent
-- (sans superlatif, sans parole rapportée, sans offre non sourcée, sans nommer de
-- revue : le nom va dans `source`), `source` écrite « à vérifier — relu le
-- 29 octobre 2026 : … ». Les traductions (expert-traduction) repassent en
-- « machine », sceau recalculé sur le nouveau français.
-- Pays : france, germany, spain, uk. Ids : 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 47, 48, 49, 51, 228, 231, 232, 233, 240, 276, 277, 278, 280, 1244, 1245, 1246, 1277, 1300.
-- ════════════════════════════════════════════════════════

UPDATE `lounges` SET
  `city` = 'Paris 1er — 157 rue Saint-Honoré',
  `description` = 'Tabaccaire parisien dont la maison fait remonter la fondation à 1716 (date de la maison, mois inconnu) ; installé au 157 rue Saint-Honoré depuis 1876 selon la presse spécialisée (2016). Habanos le référence comme Habanos Specialist sous le nom La Civette du Palais Royal (fiche non datée). La presse spécialisée (2016) compte environ 300 références de cigares ; le chiffre de 350 de l''ancienne fiche n''est pas retrouvé.',
  `description_en` = 'Parisian tobacconist whose house traces its foundation to 1716 (the house''s date, month unknown); at 157 rue Saint-Honoré since 1876 according to the trade press (2016). Habanos lists it as a Habanos Specialist under the name La Civette du Palais Royal (undated listing). The trade press (2016) counts about 300 cigar references; the figure of 350 in the previous listing has not been found.',
  `description_es` = 'Tabaquero parisino cuya casa hace remontar su fundación a 1716 (fecha de la casa, mes desconocido); instalado en 157 rue Saint-Honoré desde 1876 según la prensa especializada (2016). Habanos lo registra como Habanos Specialist con el nombre La Civette du Palais Royal (ficha sin fecha). La prensa especializada (2016) cuenta unas 300 referencias de puros; la cifra de 350 de la ficha anterior no se ha encontrado.',
  `description_de` = 'Pariser Tabakhändler, dessen Haus seine Gründung auf 1716 zurückführt (Datum des Hauses, Monat unbekannt); laut Fachpresse (2016) seit 1876 in der 157 rue Saint-Honoré ansässig. Habanos führt es als Habanos Specialist unter dem Namen La Civette du Palais Royal (undatierter Eintrag). Die Fachpresse (2016) zählt etwa 300 Zigarrensorten; die Zahl von 350 im früheren Eintrag wurde nicht gefunden.',
  `description_zh` = '巴黎烟草商，其商行称创立于1716年（为商行自述的日期，月份不详）；据专业媒体（2016年），自1876年起设于 157 rue Saint-Honoré。Habanos 将其列为 Habanos Specialist，名称为 La Civette du Palais Royal（条目无日期）。专业媒体（2016年）统计约有300种雪茄；原条目中的350这一数字未能找到。',
  `description_ar` = 'بائع تبغ باريسي ترجع داره تأسيسها إلى عام 1716 (تاريخ الدار، والشهر غير معروف)؛ ومقره في 157 rue Saint-Honoré منذ عام 1876 بحسب الصحافة المتخصصة (2016). تدرجه Habanos بوصفه Habanos Specialist باسم La Civette du Palais Royal (سجل غير مؤرخ). تُحصي الصحافة المتخصصة (2016) نحو 300 صنف من السيجار؛ أما رقم 350 في السجل القديم فلم يُعثر عليه.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : habanos.com (Habanos Specialist, 157 rue Saint-Honoré, fiche non datée) ; cigaraficionado.com (16 juin 2016 : 157 rue Saint-Honoré depuis 1876, environ 300 cigares) ; pariszigzag.fr (ouverture 1716, non daté). Site de la maison non lu (erreur serveur). Divergence : 1716 (maison) / 1876 pour l''adresse (CA).',
  `updated_at` = NOW()
 WHERE `id` = 25 AND `country_id` = 'france' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Paris 6e — 45 boulevard Raspail',
  `description` = 'Bar de l''hôtel Lutetia (désormais sous enseigne Mandarin Oriental), 45 boulevard Raspail. Un communiqué de l''hôtel relayé par la presse hôtelière (mars 2022) indique que deux fumoirs jouxtent le bar. Une page de l''hôtel mentionne une fermeture à l''été 2024 : l''état actuel n''est pas établi. Horaires et accès à confirmer auprès de l''hôtel.',
  `description_en` = 'Bar of the Hôtel Lutetia (now under the Mandarin Oriental banner), 45 boulevard Raspail. A hotel press release relayed by the hotel trade press (March 2022) states that two smoking rooms adjoin the bar. A hotel page mentions a closure in summer 2024: the current status is not established. Opening hours and access to be confirmed with the hotel.',
  `description_es` = 'Bar del hotel Lutetia (ahora bajo la marca Mandarin Oriental), 45 boulevard Raspail. Un comunicado del hotel difundido por la prensa hotelera (marzo de 2022) indica que dos salas de fumadores son contiguas al bar. Una página del hotel menciona un cierre en el verano de 2024: no se ha establecido el estado actual. Horarios y acceso por confirmar con el hotel.',
  `description_de` = 'Bar des Hotels Lutetia (inzwischen unter der Marke Mandarin Oriental), 45 boulevard Raspail. Eine von der Hotelfachpresse (März 2022) verbreitete Mitteilung des Hotels besagt, dass zwei Raucherzimmer an die Bar grenzen. Eine Seite des Hotels erwähnt eine Schließung im Sommer 2024: der aktuelle Stand ist nicht geklärt. Öffnungszeiten und Zugang sind beim Hotel zu bestätigen.',
  `description_zh` = 'Lutetia 酒店（现属 Mandarin Oriental 品牌）的酒吧，地址 45 boulevard Raspail。据酒店行业媒体转载的酒店声明（2022年3月），酒吧旁设有两间吸烟室。酒店的一个页面提到2024年夏季关闭：目前状态尚未确定。营业时间和入场方式须向酒店确认。',
  `description_ar` = 'بار فندق Lutetia (الذي بات يحمل علامة Mandarin Oriental)، 45 boulevard Raspail. يفيد بيان صادر عن الفندق نقلته صحافة الفنادق (مارس 2022) بأن غرفتي تدخين تجاوران البار. وتذكر صفحة للفندق إغلاقًا في صيف 2024: الوضع الحالي غير مؤكد. أوقات العمل والدخول يجب تأكيدها لدى الفندق.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : tendancehotellerie.fr (10 mars 2022 : deux fumoirs jouxtent le bar) ; timeout.fr et mandarinoriental.com (page du bar, corps non lu). Divergence : fumoirs attestés en 2022, fermeture estivale 2024 mentionnée, état actuel inconnu. Le type de cigares n''est pas établi.',
  `updated_at` = NOW()
 WHERE `id` = 26 AND `country_id` = 'france' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Paris 8e — 42 avenue Gabriel',
  `description` = 'Le Gaspard est le bar de l''hôtel La Réserve Paris (42 avenue Gabriel) ; sa page officielle ne mentionne pas de cigares. Le fumoir de l''hôtel n''est pas le Gaspard : l''hôtel présente un Smoking Room accessible par la bibliothèque Duc de Morny, avec plus de 400 cigares selon l''hôtel. La presse spécialisée (2023) décrit un salon cigares nommé Winter Garden. Appellations divergentes selon les sources ; conditions d''accès à confirmer (un guide français parle de fumoirs réservés aux abonnés ou résidents).',
  `description_en` = 'Le Gaspard is the bar of the hotel La Réserve Paris (42 avenue Gabriel); its official page does not mention cigars. The hotel''s smoking room is not the Gaspard: the hotel presents a Smoking Room accessible through the Duc de Morny library, with more than 400 cigars according to the hotel. The trade press (2023) describes a cigar lounge named Winter Garden. Names differ between sources; access conditions to be confirmed (a French guide speaks of smoking rooms reserved for subscribers or residents).',
  `description_es` = 'Le Gaspard es el bar del hotel La Réserve Paris (42 avenue Gabriel); su página oficial no menciona puros. La sala de fumadores del hotel no es el Gaspard: el hotel presenta un Smoking Room al que se accede por la biblioteca Duc de Morny, con más de 400 puros según el hotel. La prensa especializada (2023) describe un salón de puros llamado Winter Garden. Las denominaciones difieren según las fuentes; condiciones de acceso por confirmar (una guía francesa habla de salas de fumadores reservadas a abonados o residentes).',
  `description_de` = 'Le Gaspard ist die Bar des Hotels La Réserve Paris (42 avenue Gabriel); auf der offiziellen Seite sind Zigarren nicht erwähnt. Das Raucherzimmer des Hotels ist nicht das Gaspard: Das Hotel stellt einen Smoking Room vor, der über die Bibliothek Duc de Morny erreichbar ist, mit mehr als 400 Zigarren laut Hotel. Die Fachpresse (2023) beschreibt einen Zigarrensalon namens Winter Garden. Die Bezeichnungen weichen je nach Quelle voneinander ab; Zugangsbedingungen sind zu bestätigen (ein französischer Führer spricht von Raucherzimmern, die Abonnenten oder Hotelgästen vorbehalten sind).',
  `description_zh` = 'Le Gaspard 是 La Réserve Paris 酒店（42 avenue Gabriel）的酒吧；其官方页面未提及雪茄。酒店的吸烟室并非 Gaspard：酒店介绍了一间可经由 Duc de Morny 图书馆进入的 Smoking Room，据酒店称藏有400多支雪茄。专业媒体（2023年）描述了一个名为 Winter Garden 的雪茄沙龙。各来源的名称不一；入场条件须确认（一本法国指南称其为仅限会员或住客使用的吸烟室）。',
  `description_ar` = 'Le Gaspard هو بار فندق La Réserve Paris (42 avenue Gabriel)؛ ولا تذكر صفحته الرسمية السيجار. وغرفة التدخين في الفندق ليست Gaspard: يقدّم الفندق Smoking Room يُدخل إليها عبر مكتبة Duc de Morny، وتضم ما يزيد على 400 سيجار بحسب الفندق. وتصف الصحافة المتخصصة (2023) صالون سيجار يُسمى Winter Garden. تختلف التسميات بحسب المصادر؛ وشروط الدخول تحتاج إلى تأكيد (يتحدث دليل فرنسي عن غرف تدخين مخصصة للمشتركين أو النزلاء).',
  `source` = 'à vérifier — relu le 29 octobre 2026 : lareserve-paris.com (page du bar Le Gaspard : aucune mention de cigares ; page de la bibliothèque Duc de Morny : Smoking Room, plus de 400 cigares) ; cigaraficionado.com (11 août 2023 : salon Winter Garden). Divergences : nom du salon (Smoking Room / Winter Garden) ; accès (clients, membres, résidents).',
  `updated_at` = NOW()
 WHERE `id` = 27 AND `country_id` = 'france' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Paris 8e — 105 rue du Faubourg Saint-Honoré',
  `description` = 'Restaurant, bar lounge et cigar bar au 105 rue du Faubourg Saint-Honoré, installé fin 2024 dans les locaux de l''ancien Juvia selon l''annuaire LesRestos (mis à jour en octobre 2025). Cigar bar annoncé du mardi au samedi, de 15 h à 2 h, avec une cave à cigares d''une dizaine de places selon le même annuaire. Chronologie divergente chez d''autres annuaires (2025). Site de l''établissement non lu.',
  `description_en` = 'Restaurant, lounge bar and cigar bar at 105 rue du Faubourg Saint-Honoré, set up in late 2024 in the premises of the former Juvia according to the LesRestos directory (updated October 2025). Cigar bar announced Tuesday to Saturday, from 3 p.m. to 2 a.m., with a cigar cellar of about ten seats according to the same directory. Timeline differs in other directories (2025). The establishment''s website was not read.',
  `description_es` = 'Restaurante, bar lounge y cigar bar en 105 rue du Faubourg Saint-Honoré, instalado a finales de 2024 en los locales del antiguo Juvia según el directorio LesRestos (actualizado en octubre de 2025). Cigar bar anunciado de martes a sábado, de 15:00 a 2:00, con una cava de puros de unas diez plazas según el mismo directorio. Cronología divergente en otros directorios (2025). No se ha consultado el sitio web del establecimiento.',
  `description_de` = 'Restaurant, Lounge-Bar und Cigar Bar, 105 rue du Faubourg Saint-Honoré, Ende 2024 laut dem Verzeichnis LesRestos (aktualisiert im Oktober 2025) in den Räumen des früheren Juvia eröffnet. Die Cigar Bar ist laut demselben Verzeichnis von Dienstag bis Samstag, 15 bis 2 Uhr, angekündigt, mit einem Zigarrenkeller mit etwa zehn Plätzen. Andere Verzeichnisse (2025) geben einen abweichenden Ablauf an. Die Website des Betriebs wurde nicht eingesehen.',
  `description_zh` = '位于 105 rue du Faubourg Saint-Honoré 的餐厅、休闲酒吧兼雪茄吧，据 LesRestos 名录（2025年10月更新），于2024年底入驻原 Juvia 的场地。同一名录称雪茄吧周二至周六营业，15:00至次日2:00，设有约十个座位的雪茄窖。其他名录（2025年）的时间顺序不同。未查阅该场所的网站。',
  `description_ar` = 'مطعم وبار لاونج وبار سيجار في 105 rue du Faubourg Saint-Honoré، استقر في نهاية 2024 في مقر Juvia السابق بحسب دليل LesRestos (حُدّث في أكتوبر 2025). أُعلن عن بار السيجار من الثلاثاء إلى السبت، من الساعة 15:00 إلى 2:00، مع قبو للسيجار بنحو عشرة مقاعد بحسب الدليل نفسه. التسلسل الزمني مختلف في أدلة أخرى (2025). لم يُطلع على موقع المؤسسة.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : lesrestos.com (fiche mise à jour le 27 octobre 2025 et article sur les fumoirs à cigares : ouverture fin 2024, cigar bar mardi-samedi 15 h-2 h, capacité 10). Une seule source, un seul annuaire, aucune indépendante. Divergence : chronologie de l''ancien Juvia différente (2025) chez Mapstr et Privateaser. Site officiel injoignable.',
  `updated_at` = NOW()
 WHERE `id` = 28 AND `country_id` = 'france' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Paris 16e — 19 avenue Kléber (hôtel The Peninsula Paris)',
  `description` = 'Le Lounge Kléber, salon de l''hôtel The Peninsula Paris (19 avenue Kléber). Selon un extrait de la page de l''hôtel, un espace privé adapté aux cigares fonctionne sur demande ; la presse spécialisée (2016) décrit deux salons et un humidor d''environ 500 cigares. Un guide français classe le lieu parmi les fumoirs réservés aux abonnés ou résidents. Conditions d''accès à confirmer auprès de l''hôtel.',
  `description_en` = 'The Lounge Kléber, lounge of the hotel The Peninsula Paris (19 avenue Kléber). According to an extract from the hotel''s page, a private space suited to cigars operates on request; the trade press (2016) describes two lounges and a humidor of about 500 cigars. A French guide classes the venue among smoking rooms reserved for subscribers or residents. Access conditions to be confirmed with the hotel.',
  `description_es` = 'El Lounge Kléber, salón del hotel The Peninsula Paris (19 avenue Kléber). Según un extracto de la página del hotel, funciona bajo petición un espacio privado adaptado a los puros; la prensa especializada (2016) describe dos salones y un humidor de unos 500 puros. Una guía francesa clasifica el lugar entre las salas de fumadores reservadas a abonados o residentes. Condiciones de acceso por confirmar con el hotel.',
  `description_de` = 'Die Lounge Kléber, Salon des Hotels The Peninsula Paris (19 avenue Kléber). Laut einem Auszug der Hotelseite ist auf Anfrage ein für Zigarren geeigneter privater Bereich in Betrieb; die Fachpresse (2016) beschreibt zwei Salons und einen Humidor mit etwa 500 Zigarren. Ein französischer Führer zählt den Ort zu den Raucherzimmern, die Abonnenten oder Hotelgästen vorbehalten sind. Die Zugangsbedingungen sind beim Hotel zu bestätigen.',
  `description_zh` = 'Lounge Kléber 是 The Peninsula Paris 酒店（19 avenue Kléber）的沙龙。据酒店页面的摘录，设有一处适合雪茄的私人空间，须应要求开放；专业媒体（2016年）描述有两个沙龙和一个约存500支雪茄的雪茄保湿柜。一本法国指南将该处归入仅限会员或住客使用的吸烟室。入场条件须向酒店确认。',
  `description_ar` = 'Lounge Kléber صالون فندق The Peninsula Paris (19 avenue Kléber). بحسب مقتطف من صفحة الفندق، يعمل فضاء خاص مهيأ للسيجار عند الطلب؛ وتصف الصحافة المتخصصة (2016) صالونين وخزانة ترطيب (هيوميدور) تضم نحو 500 سيجار. ويصنّف دليل فرنسي المكان ضمن غرف التدخين المخصصة للمشتركين أو النزلاء. شروط الدخول تحتاج إلى تأكيد لدى الفندق.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : cigaraficionado.com (article de 2016 : deux salons, humidor d''environ 500 cigares). Page de l''hôtel (peninsula.com) refusée en lecture directe, connue seulement par extrait de recherche : non citée. Divergence : sur demande (hôtel) / réservé aux abonnés ou résidents (guide français). Source datée la plus récente : 2016.',
  `updated_at` = NOW()
 WHERE `id` = 29 AND `country_id` = 'france' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Madrid — paseo de Recoletos 1 (adresse non confirmée)',
  `description` = 'Adresse répertoriée paseo de Recoletos 1, à Madrid, pour une Casa del Habano. L''annuaire du distributeur lacasadelhabano-dl.es ne liste en Espagne que Tenerife et Gran Canaria. Adresse et existence du lieu non confirmées.',
  `description_en` = 'Address listed as paseo de Recoletos 1, in Madrid, for a Casa del Habano. The directory of the distributor lacasadelhabano-dl.es lists only Tenerife and Gran Canaria in Spain. Address and existence of the venue not confirmed.',
  `description_es` = 'Dirección registrada paseo de Recoletos 1, en Madrid, para una Casa del Habano. El directorio del distribuidor lacasadelhabano-dl.es solo lista en España Tenerife y Gran Canaria. Dirección y existencia del lugar sin confirmar.',
  `description_de` = 'Als Adresse ist paseo de Recoletos 1 in Madrid für eine Casa del Habano verzeichnet. Das Verzeichnis des Vertriebspartners lacasadelhabano-dl.es führt in Spanien nur Teneriffa und Gran Canaria auf. Adresse und Existenz des Ortes nicht bestätigt.',
  `description_zh` = '为一家 Casa del Habano 登记的地址为马德里的 paseo de Recoletos 1。经销商名录 lacasadelhabano-dl.es 在西班牙仅列出特内里费和大加那利岛。该地址及该场所是否存在均未获证实。',
  `description_ar` = 'عنوان مسجَّل هو paseo de Recoletos 1 في مدريد لـ Casa del Habano. لا يدرج دليل الموزع lacasadelhabano-dl.es في إسبانيا سوى تينيريفي وغران كناريا. العنوان ووجود المكان غير مؤكدين.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : lacasadelhabano-dl.es/boutiques ne liste en Espagne que Tenerife et Gran Canaria, aucune boutique à Madrid ; divergence avec la lecture du 18 septembre 2026, où le plan des franchises comptait une Casa à Madrid. Adresse paseo de Recoletos 1 confirmée par aucune source ; ni ouverture ni fermeture attestées.',
  `updated_at` = NOW()
 WHERE `id` = 30 AND `country_id` = 'spain' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Barcelona — La Rambla 100, près du marché de la Boqueria',
  `description` = 'Boutique de cigares de La Rambla 100, à Barcelone, fondée en 1920 par Juan Francisco Gimeno selon l''annuaire barcelona.com. Le même annuaire, non daté, répertorie à cette adresse Domingo Cigars : la fiche a peut-être changé de nom, ce qu''aucune source datée ni officielle n''établit.',
  `description_en` = 'Cigar shop at La Rambla 100, Barcelona, founded in 1920 by Juan Francisco Gimeno according to the barcelona.com directory. The same undated directory lists Domingo Cigars at this address: the listing may have changed name, which no dated or official source establishes.',
  `description_es` = 'Tienda de puros de La Rambla 100, en Barcelona, fundada en 1920 por Juan Francisco Gimeno según el directorio barcelona.com. El mismo directorio, sin fecha, registra en esta dirección Domingo Cigars: puede que la ficha haya cambiado de nombre, algo que ninguna fuente fechada ni oficial establece.',
  `description_de` = 'Zigarrengeschäft in der La Rambla 100 in Barcelona, laut Verzeichnis barcelona.com 1920 von Juan Francisco Gimeno gegründet. Dasselbe, undatierte Verzeichnis nennt an dieser Adresse Domingo Cigars: Der Eintrag hat möglicherweise den Namen gewechselt, was keine datierte oder offizielle Quelle belegt.',
  `description_zh` = '巴塞罗那 La Rambla 100 号的雪茄店，据 barcelona.com 名录由 Juan Francisco Gimeno 于1920年创立。同一份未标日期的名录在此地址列出的是 Domingo Cigars：该条目或许更改过名称，但没有任何带日期或官方的来源可证实这一点。',
  `description_ar` = 'متجر سيجار في La Rambla 100 ببرشلونة، تأسس عام 1920 على يد Juan Francisco Gimeno بحسب دليل barcelona.com. ويدرج الدليل نفسه، غير المؤرخ، Domingo Cigars في هذا العنوان: ربما غيّر السجل اسمه، وهو ما لا يثبته أي مصدر مؤرخ أو رسمي.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : barcelona.com/barcelona_directory/shops/gimeno : Gimeno, La Rambla 100, face au marché de la Boqueria ; barcelona.com/barcelona_directory/crafts/domingo_cigars : Domingo Cigars, La Rambla 100 (annuaire non daté, page peu exploitable). Renommage non recoupé, pas de site officiel trouvé. Horaires divergents entre fiches : retirés.',
  `updated_at` = NOW()
 WHERE `id` = 31 AND `country_id` = 'spain' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Barcelona — Gran Via de les Corts Catalanes 668 (hôtel El Palace)',
  `description` = 'Salon cigares signalé dans l''hôtel El Palace de Barcelone par la presse voyage (Chase, Prior World), qui évoque une ouverture saisonnière. Adresse Gran Via de les Corts Catalanes 668 vue dans un listing d''événement. Aucune source officielle ni datée n''a été lue.',
  `description_en` = 'Cigar lounge reported in the hotel El Palace in Barcelona by the travel press (Chase, Prior World), which mentions seasonal opening. Address Gran Via de les Corts Catalanes 668 seen in an event listing. No official or dated source was read.',
  `description_es` = 'Salón de puros señalado en el hotel El Palace de Barcelona por la prensa de viajes (Chase, Prior World), que menciona una apertura estacional. Dirección Gran Via de les Corts Catalanes 668 vista en un listado de eventos. No se ha consultado ninguna fuente oficial ni fechada.',
  `description_de` = 'Zigarrensalon, den die Reisepresse (Chase, Prior World) im Hotel El Palace in Barcelona nennt und der saisonal geöffnet sei. Adresse Gran Via de les Corts Catalanes 668 aus einem Veranstaltungseintrag. Keine offizielle oder datierte Quelle wurde eingesehen.',
  `description_zh` = '旅游媒体（Chase、Prior World）提到巴塞罗那 El Palace 酒店内设有雪茄沙龙，并称其季节性开放。地址 Gran Via de les Corts Catalanes 668 见于一份活动列表。未查阅任何官方或带日期的来源。',
  `description_ar` = 'صالون سيجار ورد ذكره في فندق El Palace ببرشلونة في صحافة السفر (Chase، Prior World)، التي تشير إلى افتتاح موسمي. العنوان Gran Via de les Corts Catalanes 668 ظهر في قائمة فعاليات. لم يُطلع على أي مصدر رسمي أو مؤرخ.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : chase.com/travel/guide/hotels/el-palace-barcelona-review et priorworld.com/editorial/checking-in-checking-out-el-palace-hotel-barcelona évoquent le Bluesman Cigar Lounge (résumés de recherche, pages non relues en entier, non datées) ; la page officielle du lieu ne répond pas. Ouverture saisonnière signalée ; état actuel non confirmé.',
  `updated_at` = NOW()
 WHERE `id` = 32 AND `country_id` = 'spain' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Madrid — calle de Magallanes 16, 28015',
  `description` = 'Cave à cigares de Madrid, calle de Magallanes 16, selon Time Out (page du 19 avril 2014). État actuel à confirmer auprès de la boutique.',
  `description_en` = 'Cigar cellar in Madrid, calle de Magallanes 16, according to Time Out (page of 19 April 2014). Current status to be confirmed with the shop.',
  `description_es` = 'Cava de puros de Madrid, calle de Magallanes 16, según Time Out (página del 19 de abril de 2014). Estado actual por confirmar con la tienda.',
  `description_de` = 'Zigarrenkeller in Madrid, calle de Magallanes 16, laut Time Out (Seite vom 19. April 2014). Aktueller Stand beim Geschäft zu bestätigen.',
  `description_zh` = '马德里的雪茄窖，地址 calle de Magallanes 16，据 Time Out（2014年4月19日页面）。目前状态须向店铺确认。',
  `description_ar` = 'قبو سيجار في مدريد، calle de Magallanes 16، بحسب Time Out (صفحة 19 أبريل 2014). الحالة الراهنة تحتاج إلى تأكيد لدى المتجر.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : cigarjournal.com/davidoff-recognizes-its-best-retailers-and-partners-worldwide (Cava Magallanes, Madrid, Best Performance EMEA, 30 septembre 2021) ; timeout.es/madrid/es/tiendas/la-cava-de-magallanes (Magallanes, 16, 28015, page du 19 avril 2014). Aucune source récente sur l''état du lieu.',
  `updated_at` = NOW()
 WHERE `id` = 33 AND `country_id` = 'spain' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Düsseldorf — Burghofstrasse 28, 40223',
  `description` = 'Magasin de l''enseigne Cigarworld à Düsseldorf (Burghofstraße 28). Le site de l''enseigne présente une page « Cigarworld Lounge » et des événements à Düsseldorf et Cologne. Date de fondation, nombre de références et équipement du lounge : non recoupés.',
  `description_en` = 'Store of the Cigarworld chain in Düsseldorf (Burghofstraße 28). The chain''s website presents a “Cigarworld Lounge” page and events in Düsseldorf and Cologne. Date of foundation, number of references and lounge equipment: not corroborated.',
  `description_es` = 'Tienda de la cadena Cigarworld en Düsseldorf (Burghofstraße 28). El sitio de la cadena presenta una página «Cigarworld Lounge» y eventos en Düsseldorf y Colonia. Fecha de fundación, número de referencias y equipamiento del lounge: no contrastados.',
  `description_de` = 'Geschäft der Marke Cigarworld in Düsseldorf (Burghofstraße 28). Die Website der Marke zeigt eine Seite „Cigarworld Lounge“ sowie Veranstaltungen in Düsseldorf und Köln. Gründungsdatum, Anzahl der Sorten und Ausstattung der Lounge: nicht belegt.',
  `description_zh` = 'Cigarworld 品牌在杜塞尔多夫的门店（Burghofstraße 28）。该品牌网站设有“Cigarworld Lounge”页面，并介绍杜塞尔多夫和科隆的活动。创立日期、品种数量和雪茄廊的设施：未经核实。',
  `description_ar` = 'متجر تابع لعلامة Cigarworld في دوسلدورف (Burghofstraße 28). يعرض موقع العلامة صفحة «Cigarworld Lounge» وفعاليات في دوسلدورف وكولونيا. تاريخ التأسيس وعدد الأصناف وتجهيزات الصالة: غير مؤكدة.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : cigarworld.de (adresse et page « Cigarworld Lounge », lus le 29 octobre 2026 ; seule source de l''adresse) ; cigarinspector.com (2022, cite Cigarworld à Düsseldorf). Les chiffres anciens de la fiche (2005, 3 000 références) ne figurent dans aucune source lue.',
  `updated_at` = NOW()
 WHERE `id` = 34 AND `country_id` = 'germany' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Hamburg — Burchardstrasse 15, Chilehaus C, 20095',
  `description` = 'La Casa del Habano de Hambourg, au Chilehaus (Burchardstraße 15), bâtiment de 1924 inscrit au patrimoine mondial de l''UNESCO avec le quartier des Kontorhäuser. La presse spécialisée (2024) l''attribue à Christoph Wolters. Habanos S.A. a annoncé en juin 2025 une autre Casa à Hambourg, tenue par la famille Duske ; l''état actuel de celle du Chilehaus n''est pas recoupé.',
  `description_en` = 'The Casa del Habano in Hamburg, in the Chilehaus (Burchardstraße 15), a 1924 building listed as a UNESCO World Heritage Site with the Kontorhaus district. The trade press (2024) attributes it to Christoph Wolters. Habanos S.A. announced in June 2025 another Casa in Hamburg, run by the Duske family; the current status of the Chilehaus one is not corroborated.',
  `description_es` = 'La Casa del Habano de Hamburgo, en el Chilehaus (Burchardstraße 15), edificio de 1924 inscrito en el Patrimonio Mundial de la UNESCO con el barrio de los Kontorhäuser. La prensa especializada (2024) la atribuye a Christoph Wolters. Habanos S.A. anunció en junio de 2025 otra Casa en Hamburgo, regentada por la familia Duske; el estado actual de la del Chilehaus no está contrastado.',
  `description_de` = 'Die Casa del Habano Hamburg im Chilehaus (Burchardstraße 15), einem Gebäude von 1924, das zusammen mit dem Kontorhausviertel zum UNESCO-Welterbe gehört. Die Fachpresse (2024) ordnet sie Christoph Wolters zu. Habanos S.A. kündigte im Juni 2025 eine weitere Casa in Hamburg an, die von der Familie Duske geführt wird; der aktuelle Stand der Casa im Chilehaus ist nicht belegt.',
  `description_zh` = '汉堡的 Casa del Habano，位于 Chilehaus（Burchardstraße 15），这座建于1924年的建筑与 Kontorhaus 街区一同列入联合国教科文组织世界遗产。专业媒体（2024年）将其归于 Christoph Wolters 名下。Habanos S.A. 于2025年6月宣布在汉堡另设一家 Casa，由 Duske 家族经营；Chilehaus 那家目前的状态未经核实。',
  `description_ar` = 'Casa del Habano في هامبورغ، في Chilehaus (Burchardstraße 15)، وهو مبنى يعود إلى عام 1924 ومدرج في قائمة التراث العالمي لليونسكو مع حي Kontorhäuser. تنسبها الصحافة المتخصصة (2024) إلى Christoph Wolters. أعلنت Habanos S.A. في يونيو 2025 عن Casa أخرى في هامبورغ، تديرها عائلة Duske؛ والحالة الراهنة لتلك الموجودة في Chilehaus غير مؤكدة.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : cigarjournal.com (guide d''avril 2014 : Burchardstraße 15 ; article 2024, lu par résumé de recherche seulement) ; cigaraficionado.com (5 déc. 2006 : Wolters, sans mention du Chilehaus) ; habanos.com (13 juin 2025 : nouvelle Casa à Hambourg, famille Duske). Fiche antérieure : « Walters », corrigé en Wolters.',
  `updated_at` = NOW()
 WHERE `id` = 35 AND `country_id` = 'germany' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Hamburg — Große Bleichen 36',
  `description` = 'Maison familiale de tabac de Hambourg, Duske & Duske, que Habanos S.A. a annoncée le 13 juin 2025 comme exploitant la 20e Casa del Habano d''Allemagne. L''article de zigarren.zone (3 juin 2025) la dit tenue par Christian Duske et son fils Sebastian, 3e génération. Les annuaires donnent Große Bleichen 36 pour le magasin ; ni Habanos ni zigarren.zone ne précisent l''adresse de la Casa.',
  `description_en` = 'Family tobacco house in Hamburg, Duske & Duske, which Habanos S.A. announced on 13 June 2025 as operating the 20th Casa del Habano in Germany. The zigarren.zone article (3 June 2025) says it is run by Christian Duske and his son Sebastian, 3rd generation. Directories give Große Bleichen 36 for the shop; neither Habanos nor zigarren.zone specifies the address of the Casa.',
  `description_es` = 'Casa familiar de tabaco de Hamburgo, Duske & Duske, que Habanos S.A. anunció el 13 de junio de 2025 como operadora de la 20.ª Casa del Habano de Alemania. El artículo de zigarren.zone (3 de junio de 2025) la dice regentada por Christian Duske y su hijo Sebastian, tercera generación. Los directorios dan Große Bleichen 36 para la tienda; ni Habanos ni zigarren.zone precisan la dirección de la Casa.',
  `description_de` = 'Hamburger Tabak-Familienbetrieb Duske & Duske, der laut Ankündigung von Habanos S.A. vom 13. Juni 2025 die 20. Casa del Habano Deutschlands betreibt. Laut Artikel von zigarren.zone (3. Juni 2025) wird sie von Christian Duske und seinem Sohn Sebastian in dritter Generation geführt. Verzeichnisse nennen für das Geschäft Große Bleichen 36; weder Habanos noch zigarren.zone geben die Adresse der Casa an.',
  `description_zh` = '汉堡的家族烟草商行 Duske & Duske，Habanos S.A. 于2025年6月13日宣布其经营德国第20家 Casa del Habano。zigarren.zone 的文章（2025年6月3日）称其由 Christian Duske 及其子 Sebastian 经营，为第三代。各名录给出的店铺地址为 Große Bleichen 36；Habanos 和 zigarren.zone 均未说明该 Casa 的地址。',
  `description_ar` = 'دار تبغ عائلية في هامبورغ، Duske & Duske، أعلنت Habanos S.A. في 13 يونيو 2025 أنها تشغّل Casa del Habano العشرين في ألمانيا. يقول مقال zigarren.zone (3 يونيو 2025) إنها تُدار من Christian Duske وابنه Sebastian، الجيل الثالث. تذكر الأدلة Große Bleichen 36 للمتجر؛ ولم تحدد Habanos ولا zigarren.zone عنوان الـ Casa.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : habanos.com (13 juin 2025 : famille Duske, 20e franchise allemande) ; zigarren.zone (3 juin 2025 : Christian et Sebastian Duske) ; dasoertliche.de (annuaire, adresse du magasin à titre indicatif). Adresse de la Casa non confirmée par une source officielle.',
  `updated_at` = NOW()
 WHERE `id` = 36 AND `country_id` = 'germany' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Hamburg — Europa Passage, Ballindamm 40, 20095',
  `description` = 'Carlos André Cigar Lounge, dans l''Europa Passage (Ballindamm 40), au sein du complexe Se7en Oceans, selon un guide de la presse spécialisée (2014). Un guide du même éditeur (février 2024) le signalait fermé pour travaux ; aucune source lue n''atteste une réouverture ni une fermeture définitive.',
  `description_en` = 'Carlos André Cigar Lounge, in the Europa Passage (Ballindamm 40), within the Se7en Oceans complex, according to a trade press guide (2014). A guide from the same publisher (February 2024) reported it closed for works; no source consulted attests a reopening or a permanent closure.',
  `description_es` = 'Carlos André Cigar Lounge, en la Europa Passage (Ballindamm 40), dentro del complejo Se7en Oceans, según una guía de la prensa especializada (2014). Una guía del mismo editor (febrero de 2024) lo señalaba cerrado por obras; ninguna fuente consultada acredita una reapertura ni un cierre definitivo.',
  `description_de` = 'Carlos André Cigar Lounge in der Europa Passage (Ballindamm 40), im Komplex Se7en Oceans, laut einem Führer der Fachpresse (2014). Ein Führer desselben Verlags (Februar 2024) nannte ihn wegen Bauarbeiten geschlossen; keine eingesehene Quelle belegt eine Wiedereröffnung oder eine endgültige Schließung.',
  `description_zh` = 'Carlos André Cigar Lounge，位于 Europa Passage（Ballindamm 40）内的 Se7en Oceans 综合体，据专业媒体的一本指南（2014年）。同一出版方的一本指南（2024年2月）称其因施工关闭；所查阅的来源均未证实其已重新开业或永久关闭。',
  `description_ar` = 'Carlos André Cigar Lounge، في Europa Passage (Ballindamm 40)، ضمن مجمع Se7en Oceans، بحسب دليل من الصحافة المتخصصة (2014). أشار دليل من الناشر نفسه (فبراير 2024) إلى أنه مغلق بسبب أشغال؛ ولا يؤكد أي مصدر تمت قراءته إعادة افتتاحه ولا إغلاقه النهائي.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : cigarjournal.com (guide 2014 : Ballindamm 40, Europa Passage ; guide de février 2024 : fermé pour travaux, lu par résumé de recherche). Étage divergent : 2e dans la fiche antérieure, 3e dans le résumé consulté, sans source tranchant.',
  `updated_at` = NOW()
 WHERE `id` = 37 AND `country_id` = 'germany' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Hamburg — An der Alster 72-79, 20099',
  `description` = 'Smokers'' Lounge attenant à l''Atlantic Bar de l''hôtel Atlantic (An der Alster 72-79). La presse spécialisée indique une salle reconstruite lors de la rénovation de 2019, plus petite qu''auparavant.',
  `description_en` = 'Smokers'' Lounge adjoining the Atlantic Bar of the Hotel Atlantic (An der Alster 72-79). The trade press states the room was rebuilt during the 2019 renovation, smaller than before.',
  `description_es` = 'Smokers'' Lounge contiguo al Atlantic Bar del hotel Atlantic (An der Alster 72-79). La prensa especializada indica una sala reconstruida durante la renovación de 2019, más pequeña que antes.',
  `description_de` = 'Smokers'' Lounge neben der Atlantic Bar des Hotels Atlantic (An der Alster 72-79). Die Fachpresse nennt einen bei der Renovierung 2019 neu gebauten Raum, der kleiner ist als zuvor.',
  `description_zh` = '与 Atlantic 酒店（An der Alster 72-79）的 Atlantic Bar 相邻的 Smokers'' Lounge。专业媒体指出，该厅在2019年翻新时重建，比以前更小。',
  `description_ar` = 'Smokers'' Lounge المجاور لـ Atlantic Bar في فندق Atlantic (An der Alster 72-79). تفيد الصحافة المتخصصة بأن القاعة أُعيد بناؤها خلال تجديد 2019 وأنها أصغر من ذي قبل.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : cigarjournal.com (guide 2014 : adresse ; article 2019 : salle reconstruite, lu par résumé de recherche) ; brhhh.com (horaires du bar : vendredi-samedi jusqu''à 2 h, lu par résumé). Divergence : la fiche antérieure indiquait 1 h le week-end, OpenTable aussi ; non tranché.',
  `updated_at` = NOW()
 WHERE `id` = 38 AND `country_id` = 'germany' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Frankfurt — Kleine Hochstraße 9, 60313',
  `description` = 'La Casa del Habano de Francfort-sur-le-Main, ouverte en mai 2018 au centre-ville selon Habanos S.A. L''annuaire de l''enseigne et le plan des franchises la listent dans cette ville ; le numéro 9 de la Kleine Hochstraße n''est confirmé par aucune source lue.',
  `description_en` = 'The Casa del Habano in Frankfurt am Main, opened in May 2018 in the city centre according to Habanos S.A. The chain''s directory and the franchise map list it in that city; number 9 Kleine Hochstraße is not confirmed by any source consulted.',
  `description_es` = 'La Casa del Habano de Fráncfort del Meno, abierta en mayo de 2018 en el centro de la ciudad según Habanos S.A. El directorio de la marca y el mapa de franquicias la listan en esa ciudad; el número 9 de la Kleine Hochstraße no está confirmado por ninguna fuente consultada.',
  `description_de` = 'Die Casa del Habano Frankfurt am Main, laut Habanos S.A. im Mai 2018 im Stadtzentrum eröffnet. Das Verzeichnis der Marke und die Franchise-Karte führen sie in dieser Stadt; die Adresse Kleine Hochstraße 9 wird von keiner eingesehenen Quelle bestätigt.',
  `description_zh` = '法兰克福的 Casa del Habano，据 Habanos S.A. 于2018年5月在市中心开业。该品牌的名录和特许经营店地图均将其列于该市；Kleine Hochstraße 9号未获所查阅的任何来源证实。',
  `description_ar` = 'Casa del Habano في فرانكفورت أم ماين، افتُتحت في مايو 2018 في وسط المدينة بحسب Habanos S.A. يدرجها دليل العلامة وخريطة الامتياز في هذه المدينة؛ أما الرقم 9 في Kleine Hochstraße فلم يؤكده أي مصدر تمت قراءته.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : habanos.com (23 juil. 2018 : Casa de Francfort ouverte en mai, centre-ville) ; annuaire habanos.com lu le 17 septembre 2026 et plan des franchises lacasadelhabano.com (état du 30 août 2026, lu le 18 septembre 2026) : une Casa dans cette ville. Numéro de rue non retrouvé.',
  `updated_at` = NOW()
 WHERE `id` = 39 AND `country_id` = 'germany' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Berlin — Fasanenstrasse 9-10, Hotel Savoy, 10623',
  `description` = 'La Casa del Habano installée dans l''hôtel Savoy (Fasanenstraße 9-10), dans la Times Bar, selon la presse spécialisée (2017). Habanos S.A. compte deux Casas à Berlin depuis 2020 ; laquelle est celle du Savoy n''est pas précisé par les sources lues, et rien de postérieur à 2020 n''a été lu sur ce lieu.',
  `description_en` = 'The Casa del Habano housed in the Hotel Savoy (Fasanenstraße 9-10), in the Times Bar, according to the trade press (2017). Habanos S.A. has counted two Casas in Berlin since 2020; which one is the Savoy''s is not specified by the sources read, and nothing later than 2020 has been read about this venue.',
  `description_es` = 'La Casa del Habano instalada en el hotel Savoy (Fasanenstraße 9-10), en el Times Bar, según la prensa especializada (2017). Habanos S.A. cuenta dos Casas en Berlín desde 2020; las fuentes consultadas no precisan cuál es la del Savoy, y no se ha leído nada posterior a 2020 sobre este lugar.',
  `description_de` = 'Die Casa del Habano im Hotel Savoy (Fasanenstraße 9-10), in der Times Bar, laut Fachpresse (2017). Habanos S.A. zählt seit 2020 zwei Casas in Berlin; welche davon die des Savoy ist, geht aus den eingesehenen Quellen nicht hervor, und zu diesem Ort wurde nichts nach 2020 gelesen.',
  `description_zh` = '设于 Savoy 酒店（Fasanenstraße 9-10）Times Bar 内的 Casa del Habano，据专业媒体（2017年）。Habanos S.A. 自2020年起在柏林计有两家 Casa；所查阅的来源未说明哪一家是 Savoy 的那家，且未见任何2020年之后关于此处的资料。',
  `description_ar` = 'Casa del Habano المقامة في فندق Savoy (Fasanenstraße 9-10)، في Times Bar، بحسب الصحافة المتخصصة (2017). تُحصي Habanos S.A. منذ عام 2020 اثنتين من Casa في برلين؛ ولا تحدد المصادر التي قُرئت أيّهما هي التابعة لـ Savoy، ولم يُقرأ شيء لاحق لعام 2020 عن هذا المكان.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : cigaraficionado.com (2017 : Casa dans la Times Bar de l''hôtel Savoy, Fasanenstraße 9-10) ; habanos.com (14 août 2020 : Berlin II, 15e Casa d''Allemagne, magasin de 1998 le plus ancien) ; annuaire habanos.com lu le 17 septembre 2026 et plan lacasadelhabano.com (état du 30 août 2026) : une Casa dans cette ville.',
  `updated_at` = NOW()
 WHERE `id` = 40 AND `country_id` = 'germany' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Bonn — Kaiser-Passage',
  `description` = 'La Casa del Habano de Bonn, dans la Kaiser-Passage au centre-ville, a ouvert le 16 mai 2023 ; zigarren.zone (30 mai 2023) la dit 16e Casa del Habano d''Allemagne à cette date. Numéro de rue non retrouvé.',
  `description_en` = 'The Casa del Habano in Bonn, in the Kaiser-Passage in the city centre, opened on 16 May 2023; zigarren.zone (30 May 2023) calls it Germany''s 16th Casa del Habano at that date. Street number not found.',
  `description_es` = 'La Casa del Habano de Bonn, en la Kaiser-Passage, en el centro de la ciudad, abrió el 16 de mayo de 2023; zigarren.zone (30 de mayo de 2023) la considera la 16.ª Casa del Habano de Alemania en esa fecha. Número de calle no encontrado.',
  `description_de` = 'Die Casa del Habano Bonn in der Kaiser-Passage im Stadtzentrum wurde am 16. Mai 2023 eröffnet; zigarren.zone (30. Mai 2023) nennt sie zu diesem Zeitpunkt die 16. Casa del Habano Deutschlands. Hausnummer nicht gefunden.',
  `description_zh` = '波恩的 Casa del Habano，位于市中心的 Kaiser-Passage，于2023年5月16日开业；zigarren.zone（2023年5月30日）称其为当时德国第16家 Casa del Habano。街道门牌号未找到。',
  `description_ar` = 'Casa del Habano في بون، في Kaiser-Passage وسط المدينة، افتُتحت في 16 مايو 2023؛ ويصفها zigarren.zone (30 مايو 2023) بأنها Casa del Habano السادسة عشرة في ألمانيا في ذلك التاريخ. لم يُعثر على رقم الشارع.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : zigarren.zone (30 mai 2023 : ouverture le 16 mai 2023, 16e Casa d''Allemagne) ; habanos.com (13 juin 2025 : Hambourg, 20e franchise allemande, ce qui exclut une ouverture de Bonn en 2025) ; annuaire habanos.com lu le 17 septembre 2026. Divergence : la fiche antérieure datait l''ouverture de 2025.',
  `updated_at` = NOW()
 WHERE `id` = 41 AND `country_id` = 'germany' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'London — 19 St James''s Street, SW1A 1ES',
  `description` = 'Boutique du 19 St James''s Street. La maison fait remonter son activité à 1787, quand Robert Lewis y vendait du tabac, et a repris l''entreprise de Robert Lewis le 14 septembre 1992. Elle indique un salon de dégustation de 27 places au premier étage. Selon la presse en ligne (ianVisits, 2021), un petit musée au sous-sol conserve des souvenirs de Winston Churchill, client pendant plus de soixante ans, dont la dernière commande est datée du 23 décembre 1964 ; la même source rattache la boutique à l''exemption de 2007 à l''interdiction de fumer en lieu clos, accordée aux commerces tirant au moins la moitié de leurs ventes du cigare et du tabac à pipe.',
  `description_en` = 'Shop at 19 St James''s Street. The firm traces its activity back to 1787, when Robert Lewis sold tobacco there, and took over the Robert Lewis business on 14 September 1992. It states that it has a 27-seat tasting lounge on the first floor. According to the online press (ianVisits, 2021), a small museum in the basement keeps memorabilia of Winston Churchill, a customer for more than sixty years, whose last order is dated 23 December 1964; the same source links the shop to the 2007 exemption from the ban on smoking indoors, granted to businesses deriving at least half of their sales from cigars and pipe tobacco.',
  `description_es` = 'Tienda en el 19 de St James''s Street. La casa hace remontar su actividad a 1787, cuando Robert Lewis vendía allí tabaco, y se hizo cargo del negocio de Robert Lewis el 14 de septiembre de 1992. Indica que dispone de un salón de degustación de 27 plazas en la primera planta. Según la prensa en línea (ianVisits, 2021), un pequeño museo en el sótano conserva recuerdos de Winston Churchill, cliente durante más de sesenta años, cuyo último pedido data del 23 de diciembre de 1964; la misma fuente vincula la tienda con la exención de 2007 de la prohibición de fumar en lugares cerrados, concedida a los comercios que obtienen al menos la mitad de sus ventas de puros y de tabaco de pipa.',
  `description_de` = 'Geschäft in der St James''s Street 19. Das Haus führt seine Tätigkeit auf das Jahr 1787 zurück, als Robert Lewis dort Tabak verkaufte, und übernahm das Unternehmen von Robert Lewis am 14. September 1992. Nach eigenen Angaben verfügt es im ersten Stock über einen Verkostungsraum mit 27 Plätzen. Laut der Online-Presse (ianVisits, 2021) bewahrt ein kleines Museum im Untergeschoss Erinnerungsstücke an Winston Churchill auf, der mehr als sechzig Jahre lang Kunde war; seine letzte Bestellung stammt vom 23. Dezember 1964. Dieselbe Quelle bringt das Geschäft mit der Ausnahme von 2007 vom Rauchverbot in geschlossenen Räumen in Verbindung, die Betrieben gewährt wurde, die mindestens die Hälfte ihres Umsatzes mit Zigarren und Pfeifentabak erzielen.',
  `description_zh` = '位于 St James''s Street 19号的店铺。该店称其业务可追溯至1787年，当时 Robert Lewis 在此销售烟草；1992年9月14日，该店接手了 Robert Lewis 的企业。店方称二楼设有一间27个座位的品鉴室。据网络媒体（ianVisits，2021年）报道，地下室的小型博物馆收藏有Winston Churchill 的纪念物品，他在这里做了六十多年的顾客，末次订单的日期为1964年12月23日；同一来源还将该店与2007年室内禁烟令的豁免联系起来，该豁免适用于至少一半销售额来自雪茄和烟斗烟草的商户。',
  `description_ar` = 'متجر في 19 St James''s Street. تُرجع الدار نشاطها إلى عام 1787، حين كان Robert Lewis يبيع التبغ فيه، وقد تولّت أعمال Robert Lewis في 14 سبتمبر 1992. وتذكر أن لديها صالة تذوق تتسع لـ27 مقعدًا في الطابق الأول. وبحسب الصحافة الإلكترونية (ianVisits، 2021)، يحتفظ متحف صغير في الطابق السفلي بتذكارات Winston Churchill، الذي كان زبونًا لما يزيد على ستين عامًا، وآخر طلب له مؤرَّخ في 23 ديسمبر 1964؛ وتربط المصدر نفسه المتجر باستثناء عام 2007 من حظر التدخين في الأماكن المغلقة، وقد مُنح للمحلات التي تحقق نصف مبيعاتها على الأقل من السيجار وتبغ الغليون.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : jjfox.co.uk (who-we-are : Robert Lewis, 1787, rachat du 14 septembre 1992 ; sampling-lounge : 27 places ; store : adresse) ; ianvisits.co.uk, article du 23 novembre 2021 (musée, dernière commande de Churchill, exemption de 2007 ; source unique pour la date de 1964). Le site de la maison dit « began trading », ianVisits « thought to have housed » : date de 1787 attribuée.',
  `updated_at` = NOW()
 WHERE `id` = 47 AND `country_id` = 'uk' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'London — Harrods, 87-135 Brompton Road, Knightsbridge, SW1X 7XL',
  `description` = 'La Casa del Habano de James J. Fox au sein de Harrods, à la même adresse que le grand magasin. Le site de la maison indique un salon de dégustation de 10 places ; la presse spécialisée, en 2018, parlait de 12 personnes.',
  `description_en` = 'The James J. Fox Casa del Habano inside Harrods, at the same address as the department store. The firm''s website indicates a tasting lounge with 10 seats; the trade press, in 2018, spoke of 12 people.',
  `description_es` = 'La Casa del Habano de James J. Fox dentro de Harrods, en la misma dirección que los grandes almacenes. El sitio web de la casa indica un salón de degustación de 10 plazas; la prensa especializada, en 2018, hablaba de 12 personas.',
  `description_de` = 'Das Casa del Habano von James J. Fox im Kaufhaus Harrods, unter derselben Adresse wie das Kaufhaus. Auf der Website des Hauses ist ein Verkostungsraum mit 10 Plätzen angegeben; die Fachpresse sprach 2018 von 12 Personen.',
  `description_zh` = '位于 Harrods 内的 James J. Fox 的 Casa del Habano，地址与这家百货商店相同。店方网站标明设有一间10个座位的品鉴室；专业媒体在2018年则提到12人。',
  `description_ar` = 'Casa del Habano التابعة لـ James J. Fox داخل Harrods، وعنوانها هو عنوان المتجر الكبير نفسه. يشير موقع الدار إلى صالة تذوق تتسع لـ10 مقاعد؛ أما الصحافة المتخصصة فذكرت في عام 2018 اثني عشر شخصًا.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : lacasadelhabano.com (fiche LCDH Londres/Harrods, 87-135 Brompton Road ; plan des franchises, liste officielle) ; jjfox.co.uk, page sampling-lounge (10 places) ; cigaraficionado.com, article du 22 octobre 2018 (jusqu''à 12 personnes ; la climatisation du salon est de la marque suisse Airkel). Divergence 10 / 12 places écrite.',
  `updated_at` = NOW()
 WHERE `id` = 48 AND `country_id` = 'uk' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'London — Selfridges, 400 Oxford Street, W1A 1AB',
  `description` = 'Rayon de James J. Fox dans le grand magasin Selfridges, 400 Oxford Street, au niveau inférieur (lower ground floor), à côté du Gordon''s Wine Bar, selon le site de la maison. Il s''agit d''un rayon, non d''une boutique indépendante.',
  `description_en` = 'James J. Fox counter in the Selfridges department store, 400 Oxford Street, on the lower ground floor, next to Gordon''s Wine Bar, according to the firm''s website. It is a counter, not an independent shop.',
  `description_es` = 'Sección de James J. Fox en los grandes almacenes Selfridges, 400 Oxford Street, en el nivel inferior (lower ground floor), junto al Gordon''s Wine Bar, según el sitio web de la casa. Se trata de una sección, no de una tienda independiente.',
  `description_de` = 'Abteilung von James J. Fox im Kaufhaus Selfridges, 400 Oxford Street, auf der unteren Ebene (lower ground floor), neben der Gordon''s Wine Bar, laut der Website des Hauses. Es handelt sich um eine Abteilung, nicht um ein eigenständiges Geschäft.',
  `description_zh` = 'James J. Fox 在 Selfridges 百货商店（400 Oxford Street）内的专柜，据店方网站，位于地下一层（lower ground floor），紧邻 Gordon''s Wine Bar。这是一个专柜，而非独立店铺。',
  `description_ar` = 'ركن James J. Fox في المتجر الكبير Selfridges، 400 Oxford Street، في الطابق السفلي (lower ground floor)، بجوار Gordon''s Wine Bar، بحسب موقع الدار. وهو ركن وليس متجرًا مستقلًا.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : jjfox.co.uk, page store (Selfridges, 400 Oxford Street, W1A 1AB, lower ground floor) ; thatsup.co.uk, annuaire non daté (rayon cigares de James J. Fox chez Selfridges). Seconde source faible : annuaire sans date.',
  `updated_at` = NOW()
 WHERE `id` = 49 AND `country_id` = 'uk' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'London — 23a St James''s Street',
  `description` = 'Boutique C.Gars à St James''s Street, au 23a selon la recherche, ouverte début 2021. À l''ouverture, l''enseigne était celle de C.Gars Ltd, qui a fusionné en 2021 dans le groupe Dominique London ; celui-ci a ouvert en 2026 une boutique au 26 Pall Mall, appelée à succéder à St James''s Street comme adresse principale à Londres. Aucune source lue ne dit que la boutique de St James''s Street a fermé ; son état actuel n''a pu être recoupé.',
  `description_en` = 'C.Gars shop in St James''s Street, at no. 23a according to the research, opened in early 2021. At the opening, the name was that of C.Gars Ltd, which merged in 2021 into the Dominique London group; the latter opened a shop in 2026 at 26 Pall Mall, due to succeed St James''s Street as its main address in London. No source read says that the St James''s Street shop has closed; its current status could not be cross-checked.',
  `description_es` = 'Tienda C.Gars en St James''s Street, en el número 23a según la investigación, abierta a principios de 2021. En la apertura, la enseña era la de C.Gars Ltd, que se fusionó en 2021 con el grupo Dominique London; este abrió en 2026 una tienda en el 26 de Pall Mall, destinada a suceder a St James''s Street como dirección principal en Londres. Ninguna fuente consultada dice que la tienda de St James''s Street haya cerrado; su estado actual no ha podido contrastarse.',
  `description_de` = 'C.Gars-Geschäft in der St James''s Street, nach der Recherche Nr. 23a, Anfang 2021 eröffnet. Bei der Eröffnung firmierte es unter C.Gars Ltd, die 2021 in die Dominique London Group aufging; diese eröffnete 2026 ein Geschäft in der Pall Mall 26, das die St James''s Street als Hauptadresse in London ablösen soll. Keine der gelesenen Quellen besagt, dass das Geschäft in der St James''s Street geschlossen wurde; sein aktueller Stand konnte nicht abgeglichen werden.',
  `description_zh` = '位于 St James''s Street 的 C.Gars 店铺，据调查为23a号，2021年初开业。开业时的店招属于 C.Gars Ltd，该公司于2021年并入 Dominique London 集团；后者于2026年在 26 Pall Mall 开设了一家店铺，将接替 St James''s Street 成为其在伦敦的主要地址。所查阅的资料均未说明 St James''s Street 的这家店已经关闭；其目前状况无法交叉核实。',
  `description_ar` = 'متجر C.Gars في St James''s Street، برقم 23a بحسب البحث، افتُتح في مطلع عام 2021. وقت الافتتاح كانت اللافتة تابعة لشركة C.Gars Ltd، التي اندمجت في عام 2021 في مجموعة Dominique London؛ وقد افتتحت هذه الأخيرة في عام 2026 متجرًا في 26 Pall Mall، يُنتظر أن يخلف St James''s Street بوصفه العنوان الرئيسي في لندن. لا يذكر أي مصدر مطّلع عليه أن متجر St James''s Street قد أُغلق؛ ولم يمكن التحقق من حالته الراهنة من مصادر متقاطعة.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : robbreport.com.my (Dominique London, nouvelle boutique Pall Mall, 12 mai 2026 : succédera à C.Gars St James''s comme adresse principale) ; cigar-coop.com (septembre 2026 : C.Gars Ltd et La Casa del Tabaco fusionnées en 2021 en Dominique London). Adresse 23a et ouverture de 2021 : résultats de recherche, pages de la maison en 403, non lues. Prix « Golden Band Awards » : retiré, non retrouvé.',
  `updated_at` = NOW()
 WHERE `id` = 51 AND `country_id` = 'uk' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Paris 1er — 1 place Vendôme',
  `description` = 'Hôtel Place Vendôme (1 place Vendôme, propriété de Chopard). La presse spécialisée (août 2025) décrit un salon cigares de 14 m2 dans le Grand Salon, équipé d''une ventilation Airkel depuis l''automne 2024, pour quatre personnes au plus et accessible uniquement aux résidents de l''hôtel. Ce n''est donc pas un lieu ouvert au public. Il n''existe pas de Habanos House Paris à cette adresse : Habanos ne liste à Paris que La Civette du Palais Royal (Habanos Specialist).',
  `description_en` = 'Hôtel Place Vendôme (1 place Vendôme, owned by Chopard). The trade press (August 2025) describes a 14 m2 cigar lounge in the Grand Salon, fitted with Airkel ventilation since autumn 2024, for four people at most and accessible only to hotel residents. It is therefore not a venue open to the public. There is no Habanos House Paris at this address: Habanos lists in Paris only La Civette du Palais Royal (Habanos Specialist).',
  `description_es` = 'Hôtel Place Vendôme (1 place Vendôme, propiedad de Chopard). La prensa especializada (agosto de 2025) describe un salón de puros de 14 m2 en el Grand Salon, con ventilación Airkel desde el otoño de 2024, para cuatro personas como máximo y accesible únicamente a los huéspedes del hotel. Por tanto, no es un lugar abierto al público. No existe ninguna Habanos House Paris en esta dirección: Habanos solo lista en París La Civette du Palais Royal (Habanos Specialist).',
  `description_de` = 'Hôtel Place Vendôme (1 place Vendôme, Eigentum von Chopard). Die Fachpresse (August 2025) beschreibt einen 14 m2 großen Zigarrensalon im Grand Salon, seit Herbst 2024 mit einer Airkel-Belüftung ausgestattet, für höchstens vier Personen und nur für Hotelgäste zugänglich. Es handelt sich also nicht um einen öffentlich zugänglichen Ort. Ein Habanos House Paris gibt es unter dieser Adresse nicht: Habanos führt in Paris nur La Civette du Palais Royal (Habanos Specialist).',
  `description_zh` = 'Hôtel Place Vendôme（1 place Vendôme，归 Chopard 所有）。专业媒体（2025年8月）描述其 Grand Salon 内设有一间14平方米的雪茄沙龙，自2024年秋季起配备 Airkel 通风系统，至多容纳四人，仅限酒店住客使用。因此这并非对公众开放的场所。此地址并无 Habanos House Paris：Habanos 在巴黎仅列出 La Civette du Palais Royal（Habanos Specialist）。',
  `description_ar` = 'Hôtel Place Vendôme (1 place Vendôme، ملك لـ Chopard). تصف الصحافة المتخصصة (أغسطس 2025) صالون سيجار مساحته 14 م2 في Grand Salon، مزوّدًا بتهوية Airkel منذ خريف 2024، لأربعة أشخاص كحد أقصى ولا يدخله إلا نزلاء الفندق. فهو إذًا ليس مكانًا مفتوحًا للجمهور. لا يوجد Habanos House Paris في هذا العنوان: لا تدرج Habanos في باريس سوى La Civette du Palais Royal (Habanos Specialist).',
  `source` = 'à vérifier — relu le 29 octobre 2026 : cigarjournal.com (11 août 2025 : salon de 14 m2, accessible only for residences) ; habanos.com (Paris : seul Habanos Specialist La Civette du Palais Royal, aucun lounge à cet endroit) ; en.wikipedia.org (hôtel 5 étoiles, propriété de Chopard). Site de l''hôtel non lu.',
  `updated_at` = NOW()
 WHERE `id` = 228 AND `country_id` = 'france' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Paris 8e — 19 place de la Madeleine ; rue Marbeuf (97 rue du Faubourg Saint-Honoré, adresse de la fiche, non retrouvée)',
  `description` = 'Restaurant parisien. L''adresse portée par l''ancienne fiche n''est retrouvée dans aucune source lue ; les adresses lues sont données ci-dessus. Un annuaire (LesRestos) range l''établissement dans les caves à cigares, ce qui ne confirme rien. Aucun service de cigares n''a été retrouvé.',
  `description_en` = 'Parisian restaurant. The address carried by the previous listing has not been found in any source consulted; the addresses read are given above. A directory (LesRestos) files the establishment under cigar cellars, which confirms nothing. No cigar service has been found.',
  `description_es` = 'Restaurante parisino. La dirección del registro anterior no se encuentra en ninguna fuente consultada; las direcciones leídas figuran más arriba. Un directorio (LesRestos) clasifica el establecimiento entre las bodegas de puros, lo que no confirma nada. No se ha encontrado ningún servicio de puros.',
  `description_de` = 'Pariser Restaurant. Die Adresse aus dem früheren Eintrag findet sich in keiner eingesehenen Quelle; die eingesehenen Adressen sind oben angegeben. Ein Verzeichnis (LesRestos) ordnet den Betrieb den Zigarrenkellern zu, was nichts bestätigt. Ein Zigarrenangebot wurde nicht gefunden.',
  `description_zh` = '巴黎的一家餐厅。原条目所载的地址在所查阅的来源中均未找到；所查阅的地址见上文。某名录（LesRestos）将该场所归入雪茄窖类，这并不能证实什么。未发现任何雪茄服务。',
  `description_ar` = 'مطعم باريسي. لم يُعثر على العنوان الوارد في السجل القديم في أي مصدر تمت قراءته؛ والعناوين التي اطُّلع عليها مذكورة أعلاه. يصنّف دليل (LesRestos) المؤسسة ضمن أقبية السيجار، وهذا لا يؤكد شيئًا. لم يُعثر على أي خدمة سيجار.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : lesrestos.com (Maison de la Truffe, place de la Madeleine ; liste cave à cigares, annuaire seul) ; sortiraparis.com (restaurants rue Marbeuf et place de la Madeleine, aucun 97 rue du Faubourg Saint-Honoré). Divergence : adresse de la fiche non retrouvée. Site de la maison injoignable (erreur serveur), non cité.',
  `updated_at` = NOW()
 WHERE `id` = 231 AND `country_id` = 'france' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Paris 8e — 37 avenue Hoche, 75008',
  `description` = 'Viñales Lounge, salon cigares de l''hôtel Le Royal Monceau - Raffles Paris, 37 avenue Hoche. Existence et adresse portées par la page de l''hôtel (maison mère Raffles) ; aucune seconde source indépendante trouvée. La date d''ouverture et les conditions d''accès (tarifs inclus) de l''ancienne fiche ne sont pas recoupées.',
  `description_en` = 'Viñales Lounge, cigar lounge of the hotel Le Royal Monceau - Raffles Paris, 37 avenue Hoche. Existence and address carried by the hotel''s page (parent company Raffles); no independent second source found. The opening date and the access conditions (rates included) of the previous listing are not corroborated.',
  `description_es` = 'Viñales Lounge, salón de puros del hotel Le Royal Monceau - Raffles Paris, 37 avenue Hoche. Existencia y dirección recogidas en la página del hotel (casa matriz Raffles); no se ha encontrado una segunda fuente independiente. La fecha de apertura y las condiciones de acceso (tarifas incluidas) de la ficha anterior no están contrastadas.',
  `description_de` = 'Viñales Lounge, Zigarrensalon des Hotels Le Royal Monceau - Raffles Paris, 37 avenue Hoche. Existenz und Adresse stützen sich auf die Seite des Hotels (Muttergesellschaft Raffles); eine zweite unabhängige Quelle wurde nicht gefunden. Eröffnungsdatum und Zugangsbedingungen (einschließlich Preise) aus dem früheren Eintrag sind nicht belegt.',
  `description_zh` = 'Viñales Lounge，Le Royal Monceau - Raffles Paris 酒店（37 avenue Hoche）的雪茄沙龙。其存在和地址见于酒店页面（母公司 Raffles）；未找到独立的第二来源。原条目中的开业日期和入场条件（含价格）未经核实。',
  `description_ar` = 'Viñales Lounge، صالون سيجار في فندق Le Royal Monceau - Raffles Paris، 37 avenue Hoche. ورد وجوده وعنوانه في صفحة الفندق (الشركة الأم Raffles)؛ ولم يُعثر على مصدر ثانٍ مستقل. تاريخ الافتتاح وشروط الدخول (بما فيها الأسعار) الواردة في السجل القديم غير مؤكدة.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : raffles.com (page Viñales Lounge : 37 avenue Hoche, 75008). Une seule source, celle de l''hôtel ; aucune source indépendante. Ouverture 2018, terrasse sur cour et tarifs d''accès de l''ancienne fiche non lus.',
  `updated_at` = NOW()
 WHERE `id` = 232 AND `country_id` = 'france' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Bordeaux — 20 place Gambetta',
  `description` = 'Fiche à vérifier : l''ancienne fiche indiquait un revendeur agréé Davidoff à cette adresse. Aucune source lue ne l''atteste : le localisateur de davidoff.com, lu le 18 septembre 2026, ne porte en France que les satellites d''aéroport de Roissy, et une recherche en français n''a rien trouvé. Une absence de réseau n''est pas conclue (deux listes officielles exigées). Aucune preuve de fermeture.',
  `description_en` = 'Listing to be verified: the previous listing indicated an authorised Davidoff retailer at this address. No source consulted attests it: the davidoff.com locator, read on 18 September 2026, carries in France only the Roissy airport satellites, and a search in French found nothing. An absence from the network is not concluded (two official lists required). No evidence of closure.',
  `description_es` = 'Ficha por verificar: la ficha anterior indicaba un distribuidor autorizado de Davidoff en esta dirección. Ninguna fuente consultada lo acredita: el localizador de davidoff.com, consultado el 18 de septiembre de 2026, solo recoge en Francia los satélites del aeropuerto de Roissy, y una búsqueda en francés no halló nada. No se concluye que esté ausente de la red (se exigen dos listas oficiales). Ninguna prueba de cierre.',
  `description_de` = 'Zu prüfender Eintrag: Der frühere Eintrag nannte an dieser Adresse einen autorisierten Davidoff-Händler. Keine eingesehene Quelle belegt dies: Der Händlerfinder von davidoff.com, am 18. September 2026 eingesehen, führt in Frankreich nur die Flughafen-Satelliten von Roissy auf, und eine Suche auf Französisch ergab nichts. Ein Fehlen im Netz wird nicht festgestellt (zwei offizielle Listen erforderlich). Kein Nachweis einer Schließung.',
  `description_zh` = '待核实条目：原条目称此地址有一家 Davidoff 授权经销商。所查阅的来源均未证实：davidoff.com 的门店查询工具（2026年9月18日查阅）在法国仅列出 Roissy 机场的卫星店，用法语搜索亦无所获。不能据此断定其不在销售网络内（须有两份官方名单）。没有关闭的证据。',
  `description_ar` = 'سجل قيد التحقق: أشار السجل القديم إلى وكيل معتمد لـ Davidoff في هذا العنوان. لا يؤكده أي مصدر تمت قراءته: إذ لا يدرج محدد المواقع في davidoff.com، الذي اطُّلع عليه في 18 سبتمبر 2026، في فرنسا سوى الفروع الملحقة بمطار Roissy، ولم يسفر بحث بالفرنسية عن شيء. لا يُستنتج غياب من الشبكة (يلزم قائمتان رسميتان). لا دليل على الإغلاق.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : oettingerdavidoff.com (boutiques en propre citées : Suisse seulement, extrait de recherche) ; davidoff.com (localisateur lu le 18 septembre 2026 : 56 boutiques, 14 partenaires, 1 636 dépositaires, en France seulement Roissy). Divergence : fiche ancienne ''revendeur agréé'' / aucun dépositaire français hors Roissy dans le localisateur.',
  `updated_at` = NOW()
 WHERE `id` = 233 AND `country_id` = 'france' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Marseille 1er — 56 La Canebière',
  `description` = 'Fiche à vérifier : l''ancienne fiche indiquait un revendeur agréé Davidoff sur la Canebière. Aucune source lue ne l''atteste : le localisateur de davidoff.com, lu le 18 septembre 2026, ne porte en France que les satellites d''aéroport de Roissy, et une recherche en français n''a trouvé aucun dépositaire. Une absence de réseau n''est pas conclue (deux listes officielles exigées). Aucune preuve de fermeture.',
  `description_en` = 'Listing to be verified: the previous listing indicated an authorised Davidoff retailer on the Canebière. No source consulted attests it: the davidoff.com locator, read on 18 September 2026, carries in France only the Roissy airport satellites, and a search in French found no stockist. An absence from the network is not concluded (two official lists required). No evidence of closure.',
  `description_es` = 'Ficha por verificar: la ficha anterior indicaba un distribuidor autorizado de Davidoff en la Canebière. Ninguna fuente consultada lo acredita: el localizador de davidoff.com, consultado el 18 de septiembre de 2026, solo recoge en Francia los satélites del aeropuerto de Roissy, y una búsqueda en francés no halló ningún distribuidor. No se concluye que esté ausente de la red (se exigen dos listas oficiales). Ninguna prueba de cierre.',
  `description_de` = 'Zu prüfender Eintrag: Der frühere Eintrag nannte an der Canebière einen autorisierten Davidoff-Händler. Keine eingesehene Quelle belegt dies: Der Händlerfinder von davidoff.com, am 18. September 2026 eingesehen, führt in Frankreich nur die Flughafen-Satelliten von Roissy auf, und eine Suche auf Französisch ergab keinen Händler. Ein Fehlen im Netz wird nicht festgestellt (zwei offizielle Listen erforderlich). Kein Nachweis einer Schließung.',
  `description_zh` = '待核实条目：原条目称在 Canebière 有一家 Davidoff 授权经销商。所查阅的来源均未证实：davidoff.com 的门店查询工具（2026年9月18日查阅）在法国仅列出 Roissy 机场的卫星店，用法语搜索未找到任何经销商。不能据此断定其不在销售网络内（须有两份官方名单）。没有关闭的证据。',
  `description_ar` = 'سجل قيد التحقق: أشار السجل القديم إلى وكيل معتمد لـ Davidoff في Canebière. لا يؤكده أي مصدر تمت قراءته: إذ لا يدرج محدد المواقع في davidoff.com، الذي اطُّلع عليه في 18 سبتمبر 2026، في فرنسا سوى الفروع الملحقة بمطار Roissy، ولم يسفر بحث بالفرنسية عن أي وكيل. لا يُستنتج غياب من الشبكة (يلزم قائمتان رسميتان). لا دليل على الإغلاق.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : en.wikipedia.org (La Canebière existe, entre le Vieux-Port et l''église des Réformés ; aucune mention de Davidoff) ; davidoff.com (localisateur lu le 18 septembre 2026 : 56 boutiques, 14 partenaires, 1 636 dépositaires, en France seulement Roissy). Divergence : fiche ancienne / localisateur.',
  `updated_at` = NOW()
 WHERE `id` = 240 AND `country_id` = 'france' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'London — 35 St James''s Street, SW1A 1HD',
  `description` = 'Davidoff of London, 35 St James''s Street : la boutique d''Edward Sahakian, installée dans cette rue depuis 1980 selon la presse spécialisée. Elle porte le nom de la marque ; le localisateur Davidoff la classe parmi ses dépositaires agréés, non parmi ses boutiques en propre.',
  `description_en` = 'Davidoff of London, 35 St James''s Street: the shop of Edward Sahakian, established in this street since 1980 according to the trade press. It bears the brand''s name; the Davidoff locator lists it among its authorised retailers, not among its own boutiques.',
  `description_es` = 'Davidoff of London, 35 St James''s Street: la tienda de Edward Sahakian, instalada en esta calle desde 1980 según la prensa especializada. Lleva el nombre de la marca; el localizador de Davidoff la clasifica entre sus distribuidores autorizados, no entre sus tiendas propias.',
  `description_de` = 'Davidoff of London, 35 St James''s Street: das Geschäft von Edward Sahakian, laut der Fachpresse seit 1980 in dieser Straße ansässig. Es trägt den Namen der Marke; der Davidoff-Händlerfinder führt es unter den autorisierten Fachhändlern, nicht unter den eigenen Boutiquen.',
  `description_zh` = 'Davidoff of London，35 St James''s Street：Edward Sahakian 的店铺，据专业媒体报道，自1980年起落户这条街。店名沿用品牌名称；Davidoff 的门店查询工具将其列为授权经销商，而非品牌自营门店。',
  `description_ar` = 'Davidoff of London، 35 St James''s Street: متجر Edward Sahakian، المستقر في هذا الشارع منذ عام 1980 بحسب الصحافة المتخصصة. يحمل اسم العلامة؛ ويصنّفه محدِّد المواقع التابع لـ Davidoff ضمن الموزعين المعتمدين لديها، لا ضمن متاجرها الخاصة.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : davidofflondon.com (page contact : 35 St. James''s Street, SW1A 1HD ; rubrique À propos : The Edward Sahakian Cigar Shop) ; cigaraficionado.com (rue depuis 1980, d''après un extrait de recherche, article non ouvert) ; localisateur davidoff.com (lu le 18 septembre 2026) : dépositaire agréé, non boutique en propre.',
  `updated_at` = NOW()
 WHERE `id` = 276 AND `country_id` = 'uk' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'London — 106 Mount Street, Mayfair, W1K 2TW',
  `description` = 'Maison de Mount Street qui se dit fondée il y a plus de cinquante ans. Desmond Sautter y a repris en 1979 une ancienne boutique de tabac, selon la presse spécialisée (2014), qui évoque par ailleurs une première boutique ouverte en 1961 ; une autre source de recherche donne 1963, sans que l''on tranche. Une seconde adresse est indiquée à Knightsbridge, 8 Raphael Street, SW7 1DL.',
  `description_en` = 'Mount Street house that describes itself as founded more than fifty years ago. Desmond Sautter took over a former tobacco shop there in 1979, according to the trade press (2014), which also mentions a first shop opened in 1961; another research source gives 1963, and the question is left unresolved. A second address is given in Knightsbridge, 8 Raphael Street, SW7 1DL.',
  `description_es` = 'Casa de Mount Street que se dice fundada hace más de cincuenta años. Desmond Sautter se hizo allí en 1979 con una antigua tienda de tabaco, según la prensa especializada (2014), que menciona además una primera tienda abierta en 1961; otra fuente de investigación da 1963, sin que se pueda zanjar. Se indica una segunda dirección en Knightsbridge, 8 Raphael Street, SW7 1DL.',
  `description_de` = 'Haus in der Mount Street, das sich als vor mehr als fünfzig Jahren gegründet bezeichnet. Desmond Sautter übernahm dort 1979 ein ehemaliges Tabakgeschäft, laut der Fachpresse (2014), die zudem von einem ersten, 1961 eröffneten Geschäft berichtet; eine andere Recherchequelle nennt 1963, ohne dass sich dies entscheiden ließe. Eine zweite Adresse wird in Knightsbridge angegeben, 8 Raphael Street, SW7 1DL.',
  `description_zh` = '位于 Mount Street 的商号，自称创立于五十多年前。据专业媒体（2014年）报道，Desmond Sautter 于1979年在此接手了一家旧烟草店；该报道另提到1961年开设的首家店铺；另一份调查资料给出的是1963年，尚无法定论。另标明在 Knightsbridge 设有第二处地址：8 Raphael Street, SW7 1DL。',
  `description_ar` = 'دار في Mount Street تذكر أنها تأسست قبل ما يزيد على خمسين عامًا. تولّى Desmond Sautter فيها في عام 1979 متجرًا قديمًا للتبغ، بحسب الصحافة المتخصصة (2014)، التي تذكر أيضًا متجرًا أول افتُتح في عام 1961؛ ويورد مصدر بحثي آخر عام 1963، دون إمكان الحسم. ويُشار إلى عنوان ثانٍ في Knightsbridge، 8 Raphael Street, SW7 1DL.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : sauttercigars.com (106 Mount Street, W1K 2TW ; 8 Raphael Street, SW7 1DL ; « founded over 50 years ago ») ; cigaraficionado.com, article du 21 mars 2014 (reprise de la boutique Moss Elkins de Mount Street en 1979 ; 1961). Divergence de dates : 1961 / 1963, non tranchée.',
  `updated_at` = NOW()
 WHERE `id` = 277 AND `country_id` = 'uk' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'London — 150 Piccadilly, Mayfair, W1J 9BR',
  `description` = 'Le Ritz London, au 150 Piccadilly, présente sur son site une boutique de cigares (The Cigar Shop) avec un cadre extérieur pour déguster. Un annuaire local en parle comme d''un espace de dégustation. La presse spécialisée a, par le passé, décrit un salon intérieur : les sources divergent. Conditions d''accès et horaires : à confirmer auprès de l''hôtel.',
  `description_en` = 'The Ritz London, at 150 Piccadilly, presents on its website a cigar shop (The Cigar Shop) with an outdoor setting for smoking. A local directory describes it as a tasting space. The trade press has in the past described an indoor lounge: the sources differ. Access conditions and opening hours: to be confirmed with the hotel.',
  `description_es` = 'El Ritz London, en el 150 de Piccadilly, presenta en su sitio web una tienda de puros (The Cigar Shop) con un espacio exterior para degustar. Un directorio local habla de ella como de un espacio de degustación. La prensa especializada describió en el pasado un salón interior: las fuentes divergen. Condiciones de acceso y horarios: por confirmar con el hotel.',
  `description_de` = 'Das Ritz London, 150 Piccadilly, stellt auf seiner Website ein Zigarrengeschäft (The Cigar Shop) mit einem Außenbereich zum Genießen vor. Ein lokales Verzeichnis beschreibt es als Verkostungsraum. Die Fachpresse beschrieb in der Vergangenheit einen Salon im Innenraum: Die Quellen widersprechen sich. Zugangsbedingungen und Öffnungszeiten: beim Hotel zu bestätigen.',
  `description_zh` = 'The Ritz London，位于 150 Piccadilly，其网站介绍了一家雪茄店（The Cigar Shop），并设有供品吸的室外空间。一份本地名录称其为品鉴空间。专业媒体过去曾描述过一间室内沙龙：各来源说法不一。进入条件和营业时间：请向酒店确认。',
  `description_ar` = 'فندق The Ritz London، في 150 Piccadilly، يعرض على موقعه متجرًا للسيجار (The Cigar Shop) مع فضاء خارجي للتدخين والتذوق. ويصفه دليل محلي بأنه فضاء للتذوق. وقد وصفت الصحافة المتخصصة في الماضي صالة داخلية: والمصادر متباينة. شروط الدخول وأوقات العمل: يُرجى تأكيدها لدى الفندق.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : theritzlondon.com, page rivoli (The Cigar Shop, cadre extérieur pour déguster, 150 Piccadilly, W1J 9BR ; lue via outil, extrait) ; thatsup.co.uk (annuaire, mise à jour du 13 août 2026 : sampling lounge) ; cigaraficionado.com, 2018 (salon intérieur, d''après un extrait de recherche). Divergence intérieur / extérieur écrite.',
  `updated_at` = NOW()
 WHERE `id` = 278 AND `country_id` = 'uk' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'London — 30 Portman Square, W1H 7BH',
  `description` = 'Le Churchill Bar & Terrace, dans l''hôtel Hyatt Regency London – The Churchill, au 30 Portman Square, ouvert fin 2012 d''après la presse. Le site de l''hôtel mentionne des cigares fournis par Hunters & Frankau. Le nom renvoie à Winston Churchill.',
  `description_en` = 'The Churchill Bar & Terrace, in the Hyatt Regency London – The Churchill hotel, at 30 Portman Square, opened in late 2012 according to the press. The hotel''s website mentions cigars supplied by Hunters & Frankau. The name refers to Winston Churchill.',
  `description_es` = 'El Churchill Bar & Terrace, en el hotel Hyatt Regency London – The Churchill, en el 30 de Portman Square, abierto a finales de 2012 según la prensa. El sitio web del hotel menciona puros suministrados por Hunters & Frankau. El nombre alude a Winston Churchill.',
  `description_de` = 'Die Churchill Bar & Terrace im Hotel Hyatt Regency London – The Churchill, 30 Portman Square, laut Presse Ende 2012 eröffnet. Die Website des Hotels erwähnt Zigarren, die von Hunters & Frankau geliefert werden. Der Name verweist auf Winston Churchill.',
  `description_zh` = 'The Churchill Bar & Terrace，位于 Hyatt Regency London – The Churchill 酒店内，地址为 30 Portman Square，据媒体报道于2012年底开业。酒店网站提到由 Hunters & Frankau 供应的雪茄。店名取自 Winston Churchill。',
  `description_ar` = 'The Churchill Bar & Terrace، في فندق Hyatt Regency London – The Churchill، 30 Portman Square، افتُتح في أواخر عام 2012 بحسب الصحافة. ويذكر موقع الفندق سيجارًا تورّده Hunters & Frankau. ويشير الاسم إلى Winston Churchill.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : hyatt.com, page dining de l''hôtel (Churchill Bar & Terrace ; cigares fournis par Hunters & Frankau, d''après un extrait de recherche) ; restaurantonline.co.uk, article du 9 novembre 2012 (ouverture fin novembre 2012, 30 Portman Square, terrasse chauffée, extrait de recherche). Horaires et dépense minimale : sources divergentes, omis.',
  `updated_at` = NOW()
 WHERE `id` = 280 AND `country_id` = 'uk' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Paris 8e — 15 rue Lamennais',
  `description` = 'Restaurant Taillevent, 15 rue Lamennais, fondé en 1946. Un article de la presse spécialisée de 1995 mentionnait un cigare proposé en fin de repas avec cognac ou armagnac ; le service actuel de cigares n''est pas recoupé.',
  `description_en` = 'Taillevent restaurant, 15 rue Lamennais, founded in 1946. A 1995 trade press article mentioned a cigar offered at the end of the meal with cognac or armagnac; the current cigar service is not corroborated.',
  `description_es` = 'Restaurante Taillevent, 15 rue Lamennais, fundado en 1946. Un artículo de la prensa especializada de 1995 mencionaba un puro ofrecido al final de la comida con coñac o armañac; el servicio actual de puros no está contrastado.',
  `description_de` = 'Restaurant Taillevent, 15 rue Lamennais, 1946 gegründet. Ein Artikel der Fachpresse von 1995 erwähnte eine Zigarre, die am Ende der Mahlzeit zu Cognac oder Armagnac angeboten wurde; das aktuelle Zigarrenangebot ist nicht belegt.',
  `description_zh` = 'Taillevent 餐厅，15 rue Lamennais，创立于1946年。1995年专业媒体的一篇文章提到，餐末可配干邑或雅文邑享用雪茄；目前的雪茄服务未经核实。',
  `description_ar` = 'مطعم Taillevent، 15 rue Lamennais، تأسس عام 1946. ذكر مقال في الصحافة المتخصصة عام 1995 سيجارًا يُقدَّم في نهاية الوجبة مع الكونياك أو الأرمانياك؛ وخدمة السيجار الحالية غير مؤكدة.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : guide.michelin.com (Le Taillevent, 15 rue Lamennais, fondé en 1946, deux étoiles) ; cigaraficionado.com (article de 1995, daté : cigare en fin de repas). Fumoir, chariot à cigares et marques non recoupés. Site du restaurant en erreur de certificat : non lu, non cité.',
  `updated_at` = NOW()
 WHERE `id` = 1244 AND `country_id` = 'france' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Paris 1er — 17 rue de Beaujolais, Palais-Royal',
  `description` = 'Restaurant des arcades du Palais-Royal, ouvert en 1784 sous le nom de Café de Chartres. Un article de la presse spécialisée (hiver 1995-1996) décrivait un humidor apporté à table avec des Cohiba et des Montecristo ; le service actuel n''est pas recoupé. Le nombre d''étoiles Michelin actuel est donné de façon contradictoire par les sources.',
  `description_en` = 'Restaurant under the arcades of the Palais-Royal, opened in 1784 as Café de Chartres. A trade press article (winter 1995-1996) described a humidor brought to the table with Cohiba and Montecristo; the current service is not corroborated. The current number of Michelin stars is given contradictorily by the sources.',
  `description_es` = 'Restaurante de las arcadas del Palais-Royal, abierto en 1784 con el nombre de Café de Chartres. Un artículo de la prensa especializada (invierno de 1995-1996) describía un humidor llevado a la mesa con Cohiba y Montecristo; el servicio actual no está contrastado. Las fuentes dan de forma contradictoria el número actual de estrellas Michelin.',
  `description_de` = 'Restaurant unter den Arkaden des Palais-Royal, 1784 unter dem Namen Café de Chartres eröffnet. Ein Artikel der Fachpresse (Winter 1995–1996) beschrieb einen Humidor, der mit Cohiba und Montecristo an den Tisch gebracht wurde; das aktuelle Angebot ist nicht belegt. Die aktuelle Zahl der Michelin-Sterne wird von den Quellen widersprüchlich angegeben.',
  `description_zh` = '位于 Palais-Royal 拱廊下的餐厅，1784年以 Café de Chartres 之名开业。专业媒体的一篇文章（1995至1996年冬季）描述过将装有 Cohiba 和 Montecristo 的雪茄保湿盒送至餐桌；目前的服务未经核实。各来源对当前米其林星级数量的说法互相矛盾。',
  `description_ar` = 'مطعم تحت أروقة Palais-Royal، افتُتح عام 1784 باسم Café de Chartres. وصف مقال في الصحافة المتخصصة (شتاء 1995-1996) خزانة ترطيب (هيوميدور) تُحمل إلى الطاولة وفيها سيجار Cohiba وMontecristo؛ والخدمة الحالية غير مؤكدة. وتقدّم المصادر عدد نجوم ميشلان الحالي بصورة متناقضة.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : legrandvefour.com (17 rue de Beaujolais, Palais-Royal) ; cigaraficionado.com (hiver 1995-1996, daté) ; sortiraparis.com (1784, Café de Chartres). Divergence : étoiles Michelin (2 selon l''ancienne fiche, 0 dans un résultat). Cigares en terrasse couverte et classement monument historique non lus.',
  `updated_at` = NOW()
 WHERE `id` = 1245 AND `country_id` = 'france' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Paris 8e — 33 rue du Faubourg Saint-Honoré',
  `description` = 'Cercle privé installé dans l''hôtel Perrinet de Jars, 33 rue du Faubourg Saint-Honoré, fondé en 1917 selon Wikipédia ; une fiche Mapstr donne 1914. Le site du cercle comporte des rubriques fumoir et cigares sans détail. Accès sur adhésion. Fumoir et sélection de havanes non recoupés.',
  `description_en` = 'Private club housed in the Hôtel Perrinet de Jars, 33 rue du Faubourg Saint-Honoré, founded in 1917 according to Wikipedia; a Mapstr listing gives 1914. The club''s website has smoking room and cigar sections without detail. Access by membership. Smoking room and selection of Havana cigars not corroborated.',
  `description_es` = 'Círculo privado instalado en el hôtel Perrinet de Jars, 33 rue du Faubourg Saint-Honoré, fundado en 1917 según Wikipedia; una ficha de Mapstr da 1914. El sitio del círculo incluye apartados de sala de fumadores y puros sin detalle. Acceso por afiliación. Sala de fumadores y selección de habanos no contrastadas.',
  `description_de` = 'Privater Club im Hôtel Perrinet de Jars, 33 rue du Faubourg Saint-Honoré, laut Wikipedia 1917 gegründet; ein Mapstr-Eintrag nennt 1914. Die Website des Clubs enthält Rubriken zu Raucherzimmer und Zigarren ohne Einzelheiten. Zugang nur für Mitglieder. Raucherzimmer und Auswahl an Havanna-Zigarren nicht belegt.',
  `description_zh` = '设于 Hôtel Perrinet de Jars（33 rue du Faubourg Saint-Honoré）的私人俱乐部，据 Wikipedia 创立于1917年；Mapstr 的一条记录则给出1914年。俱乐部网站设有吸烟室和雪茄栏目，但无细节。须入会方可进入。吸烟室和哈瓦那雪茄的品类未经核实。',
  `description_ar` = 'نادٍ خاص يقع في Hôtel Perrinet de Jars، 33 rue du Faubourg Saint-Honoré، تأسس عام 1917 بحسب Wikipedia؛ ويذكر سجل في Mapstr عام 1914. يتضمن موقع النادي بابين عن غرفة التدخين والسيجار دون تفاصيل. الدخول بالعضوية. غرفة التدخين ومجموعة سيجار هافانا غير مؤكدتين.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : en.wikipedia.org (33 rue du Faubourg Saint-Honoré, hôtel Perrinet de Jars, 1917) ; union-interalliee.fr (rubriques fumoir et cigares, sans contenu exploitable). Divergence : fondation 1917 (Wikipédia) / 1914 (Mapstr), non tranchée.',
  `updated_at` = NOW()
 WHERE `id` = 1246 AND `country_id` = 'france' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Baden-Baden — Schillerstrasse 4-6, 76530',
  `description` = 'Le Brenners Park-Hotel & Spa (Oetker Collection), Schillerstraße 4-6, liste une Cigar Lounge parmi les bars et restaurants de l''hôtel. Le bâtiment principal est en cours de rénovation, des clients étant accueillis à la Villa Stéphanie ; l''état du salon pendant les travaux n''est pas recoupé.',
  `description_en` = 'The Brenners Park-Hotel & Spa (Oetker Collection), Schillerstraße 4-6, lists a Cigar Lounge among the hotel''s bars and restaurants. The main building is under renovation, with guests being accommodated at the Villa Stéphanie; the status of the lounge during the works is not corroborated.',
  `description_es` = 'El Brenners Park-Hotel & Spa (Oetker Collection), Schillerstraße 4-6, lista una Cigar Lounge entre los bares y restaurantes del hotel. El edificio principal está en obras de renovación y se aloja a los clientes en la Villa Stéphanie; el estado del salón durante las obras no está contrastado.',
  `description_de` = 'Das Brenners Park-Hotel & Spa (Oetker Collection), Schillerstraße 4-6, führt eine Cigar Lounge unter den Bars und Restaurants des Hotels auf. Das Hauptgebäude wird renoviert, wobei Gäste in der Villa Stéphanie untergebracht werden; der Zustand der Lounge während der Arbeiten ist nicht belegt.',
  `description_zh` = 'Brenners Park-Hotel & Spa（Oetker Collection），Schillerstraße 4-6，在酒店的酒吧和餐厅中列有一间 Cigar Lounge。主楼正在翻新，客人安排在 Villa Stéphanie 接待；施工期间该沙龙的状态未经核实。',
  `description_ar` = 'يدرج Brenners Park-Hotel & Spa (Oetker Collection)، Schillerstraße 4-6، صالة Cigar Lounge ضمن بارات الفندق ومطاعمه. المبنى الرئيسي قيد التجديد، ويُستقبل النزلاء في Villa Stéphanie؛ وحالة الصالة أثناء الأشغال غير مؤكدة.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : oetkercollection.com (page Cigar Lounge du Brenners, lue par résumé de recherche, la page ayant répondu 429) ; reisetopia.de (mentionne la Cigar Lounge de l''hôtel). Ouverture actuelle non établie en raison des travaux.',
  `updated_at` = NOW()
 WHERE `id` = 1277 AND `country_id` = 'germany' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'London — 28 St James''s Street, SW1A 1HJ',
  `description` = 'Club privé de gentlemen fondé en 1762 et installé au 28 St James''s Street ; l''accès est réservé aux membres. Les sources lues ne documentent pas de salon fumeur ni d''offre de cigares. La date d''installation à cette adresse varie selon les sources (1782 ou 1783).',
  `description_en` = 'Private gentlemen''s club founded in 1762 and established at 28 St James''s Street; access is restricted to members. The sources read do not document a smoking lounge or any cigar offer. The date of settling at this address varies according to the sources (1782 or 1783).',
  `description_es` = 'Club privado de caballeros fundado en 1762 e instalado en el 28 de St James''s Street; el acceso está reservado a los socios. Las fuentes consultadas no documentan un salón de fumadores ni oferta de puros. La fecha de instalación en esta dirección varía según las fuentes (1782 o 1783).',
  `description_de` = 'Privater Herrenclub, 1762 gegründet und in der St James''s Street 28 ansässig; der Zutritt ist Mitgliedern vorbehalten. Die gelesenen Quellen dokumentieren weder einen Raucherraum noch ein Zigarrenangebot. Das Datum des Einzugs an dieser Adresse variiert je nach Quelle (1782 oder 1783).',
  `description_zh` = '创立于1762年、设于 St James''s Street 28号的私人绅士俱乐部；仅限会员入内。所查阅的资料均未记载吸烟室或雪茄供应。迁入该地址的年份因来源而异（1782年或1783年）。',
  `description_ar` = 'نادٍ خاص للسادة تأسس عام 1762 ويقع في 28 St James''s Street؛ والدخول مقصور على الأعضاء. لا توثّق المصادر المطّلع عليها وجود صالة للتدخين ولا عرضًا للسيجار. ويختلف تاريخ الاستقرار في هذا العنوان بحسب المصادر (1782 أو 1783).',
  `source` = 'à vérifier — relu le 29 octobre 2026 : boodles.org (club privé de membres, 28 St James''s Street, SW1A 1HJ, installé en 1782) ; en.wikipedia.org/wiki/Boodle%27s (fondé en janvier 1762 par Lord Shelburne). Divergence : 1782 selon le club, 1783 selon d''autres archives. Aucune source lue ne porte une smoking room ni une sélection de cigares.',
  `updated_at` = NOW()
 WHERE `id` = 1300 AND `country_id` = 'uk' AND `is_verified` = 1;

UPDATE `translation_status` t
  JOIN `lounges` l ON l.`id` = t.`entite_id`
   SET t.`source_hash` = SHA1(l.`description`), t.`statut` = 'machine', t.`maj` = NOW()
 WHERE t.`entite` = 'lounges' AND t.`champ` = 'description' AND t.`entite_id` IN ('25','26','27','28','29','30','31','32','33','34','35','36','37','38','39','40','41','47','48','49','51','228','231','232','233','240','276','277','278','280','1244','1245','1246','1277','1300');

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 296';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 296', 'systeme', 'fiches_relues', 'systeme', 0,
        'France, Allemagne, Espagne, Royaume-Uni : fiches relues : 35 fiches reprises (adresse, description, source datee), traductions remises en machine');

-- Contrôle : des 1 partout.
SELECT
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,47,48,49,51,228,231,232,233,240,276,277,278,280,1244,1245,1246,1277,1300) AND `source` LIKE 'à vérifier — relu le 29 octobre 2026%') = 35 AS `fiches_relues`,
  (SELECT COUNT(*) FROM `translation_status` WHERE `entite` = 'lounges' AND `champ` = 'description' AND `entite_id` IN ('25','26','27','28','29','30','31','32','33','34','35','36','37','38','39','40','41','47','48','49','51','228','231','232','233','240','276','277','278','280','1244','1245','1246','1277','1300') AND `statut` = 'machine') = 175 AS `sceaux_remis`;
