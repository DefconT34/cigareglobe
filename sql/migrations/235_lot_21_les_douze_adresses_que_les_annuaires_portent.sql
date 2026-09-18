-- ════════════════════════════════════════════════════════
-- 235 — Lot 21 : les douze adresses que les annuaires portent
-- ────────────────────────────────────────────────────────
-- Le lot 20 avait laissé des pistes : des lieux que les annuaires
-- officiels listent et que l'atlas n'avait pas. Un expert-cigare les a
-- cherchés un par un (site propre, presse datée), et douze entrent :
--   · cinq Casas del Habano suisses absentes de l'atlas — Genève (rue
--     de Hesse, inaugurée en octobre 2025), Montreux (mars 2026, au
--     Fairmont), Zoug (février 2024), Samnaun (janvier 2024),
--     Kreuzlingen (juin 2026) — chacune avec son site ou une presse du
--     métier de moins de trois ans, et les divergences écrites (deux
--     adresses à Genève, deux téléphones à Samnaun, deux dates à
--     Montreux) ;
--   · la Casa d'Andorre (Escaldes-Engordany), que les deux annuaires du
--     réseau portent et que rien d'autre ne décrit — dite comme telle ;
--   · quatre boutiques en propre Davidoff of Geneva : Sydney (2025, la
--     première du pays selon la presse), Bruxelles Sablon (aussi point
--     de vente Habanos), Bucarest Athénée Palace (une seule liste, dit
--     comme tel ; même adresse que la Casa de l'hôtel, fiche 76) et
--     Bucarest Băneasa (le centre commercial la liste, avec horaires) ;
--   · deux caves Zino à Abidjan — Cap Sud et rue des Jardins —,
--     dépositaires Davidoff, que leur site décrit avec horaires et
--     téléphones ; le localisateur Davidoff écrit la seconde boulevard
--     Roume, une adresse du Plateau : le site de la maison fait foi.
-- Zino publie trois autres caves (Cosmos, Sofitel, Plateau) sans rue :
-- elles attendent une adresse.
--
-- Chaque fiche a ses cinq traductions, scellées depuis la colonne, et
-- sa carte (tools/placeholders.php --tout, des deux côtés).
--
-- Après cette migration :
--   php tools/placeholders.php --tout
--   php tools/lounges_fraicheur.php --sonder ; --figer
--   php tools/sources.php --figer
--   php tools/contenu_dump.php
-- ════════════════════════════════════════════════════════

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `hours`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2568, 'switzerland', 'La Casa del Habano — Montreux (Fairmont Le Montreux Palace)', 'Montreux — Avenue Claude-Nobs 2, 1820 Montreux', 'La Casa del Habano Officielle', '+41 21 963 31 31', 'https://www.la-casa-del-habano-montreux.com/', 'Mar-Sam 9h30-18h30, fermé Dim-Lun', 'la-casa-del-habano-montreux.com (adresse, téléphone, horaires, lu le 18 septembre 2026) ; lacasadelhabano.com, actualité du 16 juin 2026 ; habanos.com, page place (annuaire lu le 17 septembre 2026) — inaugurée le 19 mars 2026 selon le réseau, ouverte au public le 20 selon son site : les deux écrits', 1,
  'Casa del Habano ouverte au printemps 2026 par le distributeur Intertabak au sein du Fairmont Le Montreux Palace, avenue Claude-Nobs : boutique et salon fumeur. Inaugurée le 19 mars 2026 selon le réseau, ouverte au public le 20 selon son site — les deux dates sont écrites. La dixième Casa de Suisse, selon la franchise.',
  'Casa del Habano opened in spring 2026 by the distributor Intertabak within the Fairmont Le Montreux Palace, Avenue Claude-Nobs: shop and smoking lounge. Inaugurated on 19 March 2026 according to the network, open to the public on the 20th according to its own site — both dates are written. The tenth Casa in Switzerland, according to the franchise.',
  'Casa del Habano abierta en la primavera de 2026 por el distribuidor Intertabak dentro del Fairmont Le Montreux Palace, avenida Claude-Nobs: tienda y salón de fumadores. Inaugurada el 19 de marzo de 2026 según la red, abierta al público el 20 según su propio sitio — se escriben las dos fechas. La décima Casa de Suiza, según la franquicia.',
  'Casa del Habano, im Frühjahr 2026 vom Distributor Intertabak im Fairmont Le Montreux Palace an der Avenue Claude-Nobs eröffnet: Laden und Raucherlounge. Eingeweiht am 19. März 2026 laut Netz, für das Publikum geöffnet am 20. laut eigener Website — beide Daten sind geschrieben. Die zehnte Casa der Schweiz, laut Franchise.',
  '2026年春由经销商 Intertabak 在克劳德·诺布斯大道的蒙特勒宫费尔蒙酒店内开设的 Casa del Habano：店铺与吸烟廊。据网络方称于2026年3月19日揭幕，据其自身网站则于20日向公众开放——两个日期都写在这里。据特许经营方称，这是瑞士的第十家 Casa。',
  'Casa del Habano افتتحها الموزّع Intertabak في ربيع 2026 داخل فندق فيرمونت لو مونترو بالاس، جادة كلود نوبس: متجر وصالة تدخين. دُشّنت في 19 مارس 2026 بحسب الشبكة، وفُتحت للجمهور في 20 بحسب موقعها — والتاريخان مكتوبان. البيت العاشر في سويسرا بحسب الامتياز.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2568);
INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 478, 2568, 'placeholder_2568.jpg', 1, 1, 'admin', 1, NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2568);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `hours`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2569, 'switzerland', 'La Casa del Habano — Genève (rue de Hesse)', 'Genève — Rue de Hesse 6, 1204 Genève', 'La Casa del Habano Officielle', '+41 22 310 54 05', 'https://www.lacasadelhabano-geneve.com/', 'Lun-Ven 10h-13h et 14h-19h, Sam 10h-14h (site) ; Lun-Ven 10h-18h30 (habanos.com)', 'lacasadelhabano-geneve.com (adresse, téléphone, horaires, lu le 18 septembre 2026) ; habanos.com, actualité du 6 novembre 2025 (inaugurée les 10 et 11 octobre 2025) et page place — le site écrit rue de Hesse 6, l''actualité boulevard Georges-Favon 17, et les horaires divergent : les deux écrits', 1,
  'Casa del Habano inaugurée les 10 et 11 octobre 2025 dans le quartier des banques de Genève, avec un fumoir privé et une salle de dégustation de vins. Son site la place rue de Hesse 6, l''actualité du réseau boulevard Georges-Favon 17 ; les horaires publiés divergent aussi — les deux sont écrits.',
  'Casa del Habano inaugurated on 10 and 11 October 2025 in Geneva''s banking district, with a private smoking room and a wine-tasting room. Its site places it at Rue de Hesse 6, the network''s news item at Boulevard Georges-Favon 17; the published opening hours differ too — both are written.',
  'Casa del Habano inaugurada los días 10 y 11 de octubre de 2025 en el barrio bancario de Ginebra, con fumador privado y sala de cata de vinos. Su sitio la sitúa en la rue de Hesse 6, la noticia de la red en el boulevard Georges-Favon 17; los horarios publicados también divergen — se escriben los dos.',
  'Casa del Habano, eingeweiht am 10. und 11. Oktober 2025 im Genfer Bankenviertel, mit privatem Raucherzimmer und Weinverkostungsraum. Ihre Website setzt sie an die Rue de Hesse 6, die Nachricht des Netzes an den Boulevard Georges-Favon 17; auch die veröffentlichten Öffnungszeiten weichen ab — beides ist geschrieben.',
  '2025年10月10日至11日在日内瓦银行区揭幕的 Casa del Habano，设有私人吸烟室和葡萄酒品鉴室。其网站将它定在黑塞街6号，网络方的新闻则写乔治-法翁大道17号；公布的营业时间也不一致——两者都写在这里。',
  'Casa del Habano دُشّنت يومي 10 و11 أكتوبر 2025 في حيّ المصارف بجنيف، مع غرفة تدخين خاصّة وقاعة لتذوّق النبيذ. يضعها موقعها في شارع هيس 6، ويضعها خبر الشبكة في جادة جورج-فافون 17؛ وتختلف أوقات العمل المنشورة أيضًا — والاثنان مكتوبان.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2569);
INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 479, 2569, 'placeholder_2569.jpg', 1, 1, 'admin', 1, NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2569);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `hours`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2570, 'switzerland', 'La Casa del Habano — Zoug', 'Zoug — Gotthardstrasse 20, 6300 Zug', 'La Casa del Habano Officielle', '+41 41 558 99 41', 'https://www.siglomundo.ch/', NULL, 'lacasadelhabano.com, actualité du 13 mars 2024 (ouverte le 3 février 2024, environ deux cents mètres carrés, boutique et salon avec bar, avec Intertabak) ; siglomundo.ch, où renvoie le domaine de la Casa (adresse, téléphone, lu le 18 septembre 2026) ; habanos.com, page place', 1,
  'Casa del Habano ouverte le 3 février 2024 près de la gare de Zoug, Gotthardstrasse 20, avec le distributeur Intertabak : boutique et salon avec service de bar, sur environ deux cents mètres carrés selon l''annonce de la franchise. Son adresse et son téléphone sont publiés sur siglomundo.ch, où renvoie le domaine de la Casa.',
  'Casa del Habano opened on 3 February 2024 near Zug railway station, Gotthardstrasse 20, with the distributor Intertabak: shop and lounge with bar service, on about two hundred square metres according to the franchise''s announcement. Its address and telephone are published on siglomundo.ch, to which the Casa''s domain redirects.',
  'Casa del Habano abierta el 3 de febrero de 2024 cerca de la estación de Zug, Gotthardstrasse 20, con el distribuidor Intertabak: tienda y salón con servicio de bar, en unos doscientos metros cuadrados según el anuncio de la franquicia. Su dirección y su teléfono se publican en siglomundo.ch, adonde remite el dominio de la Casa.',
  'Casa del Habano, eröffnet am 3. Februar 2024 nahe dem Bahnhof Zug, Gotthardstrasse 20, mit dem Distributor Intertabak: Laden und Lounge mit Barservice, auf rund zweihundert Quadratmetern laut Ankündigung der Franchise. Adresse und Telefon stehen auf siglomundo.ch, wohin die Domain der Casa weiterleitet.',
  '2024年2月3日在楚格火车站附近圣哥达街20号开设的 Casa del Habano，与经销商 Intertabak 合作：店铺与设有酒吧服务的休息厅，据特许经营方公告约两百平方米。其地址和电话公布在 siglomundo.ch 上，该 Casa 的域名即跳转至此。',
  'Casa del Habano افتُتحت في 3 فبراير 2024 قرب محطّة تسوغ، غوتهاردشتراسه 20، مع الموزّع Intertabak: متجر وصالة بخدمة بار، على نحو مئتي متر مربّع بحسب إعلان الامتياز. عنوانها وهاتفها منشوران على siglomundo.ch، الذي يحيل إليه نطاق البيت.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2570);
INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 480, 2570, 'placeholder_2570.jpg', 1, 1, 'admin', 1, NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2570);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `hours`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2571, 'switzerland', 'La Casa del Habano — Samnaun', 'Samnaun — Dorfstrasse 45, 7563 Samnaun Dorf (annuaire habanos.com ; le site de la Casa ne donne pas de rue)', 'La Casa del Habano Officielle', '+41 78 251 26 45', 'https://www.lcdh-samnaun.ch/', 'Mar-Jeu 12h30-18h30, Ven-Sam 12h30-21h, fermé Dim-Lun', 'lcdh-samnaun.ch (horaires, téléphone +41 78 251 26 45, lu le 18 septembre 2026) ; habanomag.com, 20 février 2024 (ouverte en janvier 2024, inaugurée début février ; salon au rez-de-chaussée, humidor climatisé à l''étage, dans l''hôtel AlpChalet Bellevue) ; habanos.com, page place (Dorfstrasse 45, +41 81 868 51 50) — téléphones divergents, les deux écrits', 1,
  'Casa del Habano de Samnaun, dans les Grisons, ouverte en janvier 2024 et inaugurée début février : un salon au rez-de-chaussée, un humidor climatisé à l''étage, dans l''hôtel AlpChalet Bellevue selon la presse du métier. L''annuaire du réseau la place Dorfstrasse 45 ; son site ne donne pas de rue et publie un autre téléphone — les deux sont écrits.',
  'Casa del Habano of Samnaun, in the Grisons, opened in January 2024 and inaugurated in early February: a lounge on the ground floor, a climate-controlled humidor upstairs, within the AlpChalet Bellevue hotel according to the trade press. The network''s directory places it at Dorfstrasse 45; its own site gives no street and publishes another telephone number — both are written.',
  'Casa del Habano de Samnaun, en los Grisones, abierta en enero de 2024 e inaugurada a principios de febrero: un salón en la planta baja, un humidor climatizado en el piso superior, dentro del hotel AlpChalet Bellevue según la prensa del oficio. El directorio de la red la sitúa en Dorfstrasse 45; su propio sitio no da calle y publica otro teléfono — se escriben los dos.',
  'Casa del Habano von Samnaun, in Graubünden, eröffnet im Januar 2024 und eingeweiht Anfang Februar: eine Lounge im Erdgeschoss, ein klimatisierter Humidor im Obergeschoss, im Hotel AlpChalet Bellevue laut Fachpresse. Das Verzeichnis des Netzes setzt sie an die Dorfstrasse 45; ihre eigene Website nennt keine Strasse und eine andere Telefonnummer — beides ist geschrieben.',
  '格劳宾登州萨姆瑙恩的 Casa del Habano，2024年1月开业、2月初揭幕：底层是休息厅，楼上是恒温雪茄保湿房，据行业媒体称位于 AlpChalet Bellevue 酒店内。网络名录将其定在村街45号；其自身网站未给出街道，并公布了另一个电话——两者都写在这里。',
  'Casa del Habano في سامناون بكانتون غراوبوندن، افتُتحت في يناير 2024 ودُشّنت مطلع فبراير: صالة في الطابق الأرضي وخزانة ترطيب مكيّفة في الطابق العلوي، داخل فندق AlpChalet Bellevue بحسب صحافة المهنة. يضعها دليل الشبكة في دورفشتراسه 45؛ ولا يذكر موقعها شارعًا وينشر هاتفًا آخر — والاثنان مكتوبان.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2571);
INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 481, 2571, 'placeholder_2571.jpg', 1, 1, 'admin', 1, NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2571);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `hours`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2572, 'switzerland', 'La Casa del Habano — Kreuzlingen', 'Kreuzlingen — Konstanzerstrasse 8, 8280 Kreuzlingen', 'La Casa del Habano Officielle', '+41 71 672 57 09', 'https://www.lacasadelhabanokreuzlingen.ch/', NULL, 'lacasadelhabanokreuzlingen.ch (adresse, téléphone, lu le 18 septembre 2026) ; zigarren.zone, 29 juin 2026 (inaugurée le 27 juin 2026 par la famille Portmann, à côté de sa maison de tabac Urs Portmann Tabakwaren) ; habanos.com, page place', 1,
  'Casa del Habano ouverte le 27 juin 2026 à Kreuzlingen, sur la rive suisse du lac de Constance, par la famille Portmann, à côté de sa maison de tabac Urs Portmann : cave et salon fumeur. La onzième Casa de Suisse, selon la presse du métier.',
  'Casa del Habano opened on 27 June 2026 in Kreuzlingen, on the Swiss shore of Lake Constance, by the Portmann family, next to its tobacco house Urs Portmann: cellar and smoking lounge. The eleventh Casa in Switzerland, according to the trade press.',
  'Casa del Habano abierta el 27 de junio de 2026 en Kreuzlingen, en la orilla suiza del lago de Constanza, por la familia Portmann, junto a su casa de tabaco Urs Portmann: cava y salón de fumadores. La undécima Casa de Suiza, según la prensa del oficio.',
  'Casa del Habano, eröffnet am 27. Juni 2026 in Kreuzlingen, am Schweizer Ufer des Bodensees, von der Familie Portmann neben ihrem Tabakhaus Urs Portmann: Humidor und Raucherlounge. Die elfte Casa der Schweiz, laut Fachpresse.',
  '2026年6月27日由波特曼家族在博登湖瑞士一侧的克罗伊茨林根、紧邻其烟草店 Urs Portmann 开设的 Casa del Habano：雪茄窖与吸烟廊。据行业媒体称，这是瑞士的第十一家 Casa。',
  'Casa del Habano افتتحتها عائلة بورتمان في 27 يونيو 2026 في كرويتسلينغن على الضفّة السويسرية لبحيرة كونستانس، إلى جانب دارها للتبغ Urs Portmann: قبو وصالة تدخين. البيت الحادي عشر في سويسرا بحسب صحافة المهنة.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2572);
INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 482, 2572, 'placeholder_2572.jpg', 1, 1, 'admin', 1, NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2572);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `hours`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2573, 'andorra', 'La Casa del Habano — Andorre (Escaldes-Engordany)', 'Escaldes-Engordany — Plaça Coprínceps 3', 'La Casa del Habano Officielle', '+376 869 255', NULL, NULL, 'habanos.com, page place La Casa Del Habano – Andorra (annuaire lu le 17 septembre 2026 ; distributeur Maori Tabacs S.A.) ; plan des franchises lacasadelhabano.com (30 août 2026) : une Casa en Andorre — aucun site propre, aucune presse de moins de trois ans ; cigarjournal.com sur Maori Tabacs, 15 avril 2014', 1,
  'Casa del Habano d''Andorre, plaça Coprínceps 3 à Escaldes-Engordany, tenue par le distributeur Maori Tabacs, que les deux annuaires du réseau portent. Aucun site propre, aucune presse récente ne la décrit ; un article de 2014 sur Maori Tabacs en parlait déjà.',
  'Casa del Habano of Andorra, Plaça Coprínceps 3 in Escaldes-Engordany, run by the distributor Maori Tabacs, which both of the network''s directories carry. No site of its own, no recent press describes it; a 2014 article on Maori Tabacs already mentioned it.',
  'Casa del Habano de Andorra, plaça Coprínceps 3 en Escaldes-Engordany, a cargo del distribuidor Maori Tabacs, que los dos directorios de la red recogen. Ningún sitio propio ni prensa reciente la describe; un artículo de 2014 sobre Maori Tabacs ya la mencionaba.',
  'Casa del Habano von Andorra, Plaça Coprínceps 3 in Escaldes-Engordany, geführt vom Distributor Maori Tabacs, die beide Verzeichnisse des Netzes führen. Keine eigene Website, keine aktuelle Presse beschreibt sie; ein Artikel von 2014 über Maori Tabacs erwähnte sie bereits.',
  '安道尔的 Casa del Habano，位于莱塞斯卡尔德-恩戈尔达共亲王广场3号，由经销商 Maori Tabacs 经营，网络的两份名录都将其收录。没有自有网站，也没有近期报道描述它；一篇2014年关于 Maori Tabacs 的文章已提及它。',
  'Casa del Habano في أندورا، ساحة كوبرينسبس 3 بإسكالديس-إنغوردان، يديرها الموزّع Maori Tabacs، ويدرجها دليلا الشبكة كلاهما. لا موقع خاصّ بها ولا صحافة حديثة تصفها؛ وقد ذكرها مقال من 2014 عن Maori Tabacs.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2573);
INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 483, 2573, 'placeholder_2573.jpg', 1, 1, 'admin', 1, NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2573);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `hours`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2574, 'australia', 'Davidoff of Geneva since 1911 — Sydney (The Strand Arcade)', 'Sydney — Shop 29, The Strand Arcade, 412-414 George Street, NSW 2000', 'Davidoff Flagship', '+61 2 9669 5890', NULL, 'Lun-Mer 10h-18h, Jeu-Ven 10h-19h, Sam 10h-18h, Dim 11h-17h (strandarcade.com.au)', 'davidoff.com, localisateur (boutique en propre, lu le 18 septembre 2026) ; cigarjournal.com, 7 mai 2025 (première boutique Davidoff of Geneva d''Australie, à la place du kiosque Sydney Cigar House) ; strandarcade.com.au (horaires)', 1,
  'Boutique Davidoff of Geneva since 1911 de Sydney, dans la galerie The Strand Arcade, George Street, ouverte en 2025 à la place de l''ancien kiosque Sydney Cigar House — la première boutique en propre de la marque en Australie selon la presse du métier (article du 7 mai 2025). Horaires publiés par la galerie.',
  'Davidoff of Geneva since 1911 shop in Sydney, in The Strand Arcade on George Street, opened in 2025 in place of the former Sydney Cigar House kiosk — the brand''s first own store in Australia according to the trade press (article of 7 May 2025). Opening hours published by the arcade.',
  'Tienda Davidoff of Geneva since 1911 de Sídney, en la galería The Strand Arcade, George Street, abierta en 2025 en el lugar del antiguo quiosco Sydney Cigar House — la primera tienda propia de la marca en Australia según la prensa del oficio (artículo del 7 de mayo de 2025). Horarios publicados por la galería.',
  'Davidoff-of-Geneva-since-1911-Boutique in Sydney, in der Strand Arcade an der George Street, 2025 anstelle des früheren Kiosks Sydney Cigar House eröffnet — das erste eigene Geschäft der Marke in Australien laut Fachpresse (Artikel vom 7. Mai 2025). Öffnungszeiten laut Arkade.',
  '悉尼乔治街 The Strand Arcade 拱廊内的 Davidoff of Geneva since 1911 精品店，2025年在原 Sydney Cigar House 售货亭的位置开设——据行业媒体（2025年5月7日的文章）称，这是该品牌在澳大利亚的首家自营门店。营业时间由拱廊公布。',
  'متجر Davidoff of Geneva since 1911 في سيدني، داخل رواق The Strand Arcade بشارع جورج، افتُتح في 2025 مكان كشك Sydney Cigar House السابق — أوّل متجر خاصّ للعلامة في أستراليا بحسب صحافة المهنة (مقال 7 مايو 2025). أوقات العمل ينشرها الرواق.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2574);
INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 484, 2574, 'placeholder_2574.jpg', 1, 1, 'admin', 1, NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2574);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `hours`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2575, 'belgium', 'Davidoff of Geneva since 1911 — Bruxelles (Grand Sablon)', 'Bruxelles — Place du Grand Sablon 1, 1000 Bruxelles', 'Davidoff Flagship', '+32 2 512 94 22', NULL, NULL, 'davidoff.com, localisateur (boutique en propre, lu le 18 septembre 2026) ; habanos.com, page place Davidoff of Geneva Sablon, Habanos Point (annuaire lu le 17 septembre 2026), même adresse et même téléphone — aucun site propre ; cigarjournal.com décrivait un salon à l''étage en 2018, hors fenêtre', 1,
  'Boutique Davidoff of Geneva since 1911 de la place du Grand Sablon, à Bruxelles : boutique en propre de la marque selon son localisateur, et point de vente Habanos selon habanos.com, à la même adresse. La presse du métier y décrivait un salon de dégustation à l''étage en 2018.',
  'Davidoff of Geneva since 1911 shop on the Place du Grand Sablon, Brussels: the brand''s own store according to its locator, and a Habanos point of sale according to habanos.com, at the same address. The trade press described a tasting lounge upstairs there in 2018.',
  'Tienda Davidoff of Geneva since 1911 de la place du Grand Sablon, en Bruselas: tienda propia de la marca según su localizador, y punto de venta Habanos según habanos.com, en la misma dirección. La prensa del oficio describía allí un salón de cata en el piso superior en 2018.',
  'Davidoff-of-Geneva-since-1911-Boutique am Place du Grand Sablon in Brüssel: eigenes Geschäft der Marke laut ihrem Locator und Habanos-Verkaufsstelle laut habanos.com, an derselben Adresse. Die Fachpresse beschrieb dort 2018 eine Verkostungslounge im Obergeschoss.',
  '布鲁塞尔大萨布隆广场的 Davidoff of Geneva since 1911 精品店：据品牌定位器为其自营门店，据 habanos.com 为哈瓦那雪茄销售点，地址相同。行业媒体在2018年曾描述过其楼上的品鉴休息厅。',
  'متجر Davidoff of Geneva since 1911 في ساحة غران سابلون ببروكسل: متجر خاصّ للعلامة بحسب محدّدها، ونقطة بيع هابانوس بحسب habanos.com، في العنوان نفسه. وصفت صحافة المهنة فيه صالة تذوّق في الطابق العلوي سنة 2018.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2575);
INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 485, 2575, 'placeholder_2575.jpg', 1, 1, 'admin', 1, NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2575);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `hours`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2576, 'romania', 'Davidoff of Geneva since 1911 — Bucarest (Athénée Palace)', 'Bucarest — Strada Episcopiei 1-3, Athénée Palace', 'Davidoff Flagship', '+40 720 499 583', 'http://www.trabucul.ro/', NULL, 'davidoff.com, localisateur (boutique en propre, site trabucul.ro, lu le 18 septembre 2026) — aucune page propre ni presse de moins de trois ans lue ; l''hôtel ne liste pas la boutique ; même adresse que La Casa del Habano de l''hôtel, fiche 76', 1,
  'Boutique Davidoff of Geneva since 1911 de l''Athénée Palace, Strada Episcopiei, à Bucarest, que le localisateur de la marque compte parmi ses boutiques en propre, à la même adresse que La Casa del Habano de l''hôtel. Aucune page propre ni presse récente ne la décrit ; le site de l''hôtel ne la liste pas.',
  'Davidoff of Geneva since 1911 shop at the Athénée Palace, Strada Episcopiei, Bucharest, which the brand''s locator counts among its own stores, at the same address as the hotel''s La Casa del Habano. No page of its own and no recent press describes it; the hotel''s site does not list it.',
  'Tienda Davidoff of Geneva since 1911 del Athénée Palace, Strada Episcopiei, en Bucarest, que el localizador de la marca cuenta entre sus tiendas propias, en la misma dirección que La Casa del Habano del hotel. Ninguna página propia ni prensa reciente la describe; el sitio del hotel no la incluye.',
  'Davidoff-of-Geneva-since-1911-Boutique im Athénée Palace, Strada Episcopiei, Bukarest, die der Store-Locator der Marke zu ihren eigenen Geschäften zählt, an derselben Adresse wie La Casa del Habano des Hotels. Keine eigene Seite und keine aktuelle Presse beschreibt sie; die Website des Hotels führt sie nicht.',
  '布加勒斯特主教街雅典娜宫内的 Davidoff of Geneva since 1911 精品店，品牌定位器将其计入自营门店，与该酒店的 La Casa del Habano 地址相同。没有自有页面，也没有近期报道描述它；酒店网站未列出它。',
  'متجر Davidoff of Geneva since 1911 في أثينيه بالاس، شارع إبيسكوبيي ببوخارست، يعدّه محدّد العلامة ضمن متاجرها الخاصّة، في العنوان نفسه الذي تشغله La Casa del Habano في الفندق. لا صفحة خاصّة ولا صحافة حديثة تصفه؛ ولا يدرجه موقع الفندق.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2576);
INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 486, 2576, 'placeholder_2576.jpg', 1, 1, 'admin', 1, NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2576);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `hours`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2577, 'romania', 'Davidoff of Geneva since 1911 — Bucarest (Băneasa Shopping City)', 'Bucarest — Băneasa Shopping City, Șoseaua București-Ploiești 42D, secteur 1', 'Davidoff Flagship', '+40 726 262 255', NULL, 'Tous les jours 10h-22h (baneasa.ro)', 'davidoff.com, localisateur (boutique en propre, lu le 18 septembre 2026) ; baneasa.ro, page Magazin Davidoff (adresse, téléphone, horaires) ; cigaraficionado.com, 22 janvier 2013 (boutique de trente mètres carrés ouverte en décembre 2012), hors fenêtre', 1,
  'Boutique Davidoff of Geneva since 1911 du centre commercial Băneasa Shopping City, au nord de Bucarest, ouverte en décembre 2012 selon la presse du métier — une trentaine de mètres carrés — et que le centre commercial liste toujours, avec ses horaires et son téléphone.',
  'Davidoff of Geneva since 1911 shop in the Băneasa Shopping City mall, north of Bucharest, opened in December 2012 according to the trade press — some thirty square metres — and still listed by the mall, with its hours and telephone.',
  'Tienda Davidoff of Geneva since 1911 del centro comercial Băneasa Shopping City, al norte de Bucarest, abierta en diciembre de 2012 según la prensa del oficio — una treintena de metros cuadrados — y que el centro comercial sigue listando, con sus horarios y su teléfono.',
  'Davidoff-of-Geneva-since-1911-Boutique im Einkaufszentrum Băneasa Shopping City, nördlich von Bukarest, eröffnet im Dezember 2012 laut Fachpresse — rund dreißig Quadratmeter — und vom Einkaufszentrum weiterhin geführt, mit Öffnungszeiten und Telefon.',
  '布加勒斯特北部 Băneasa Shopping City 购物中心内的 Davidoff of Geneva since 1911 精品店，据行业媒体于2012年12月开业——约三十平方米——购物中心至今仍列出它，并附营业时间和电话。',
  'متجر Davidoff of Geneva since 1911 في مركز Băneasa Shopping City التجاري شمال بوخارست، افتُتح في ديسمبر 2012 بحسب صحافة المهنة — نحو ثلاثين مترًا مربّعًا — ولا يزال المركز التجاري يدرجه مع أوقات عمله وهاتفه.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2577);
INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 487, 2577, 'placeholder_2577.jpg', 1, 1, 'admin', 1, NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2577);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `hours`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2578, 'ivorycoast', 'Zino — Cave Cap Sud (Marcory)', 'Abidjan, Marcory — Galerie commerciale Cap Sud', 'Cave à cigares', '+225 07 79 10 54 83', 'https://zino.ci/', 'Lun-Sam 9h-19h30, Dim 10h-19h', 'zino.ci, page Nos boutiques (Cave Cap Sud : téléphone, horaires, lu le 18 septembre 2026) ; davidoff.com, localisateur : Zino Cigares – Cap Sud, dépositaire Davidoff ; koaci.com, 11 décembre 2020 (inauguration de la cave)', 1,
  'Cave à cigares de la maison Zino — parfumerie, horlogerie, maroquinerie et cigares à Abidjan depuis plus de quarante ans, dit-elle — dans la galerie commerciale Cap Sud, à Marcory : Habanos et cigares du Nouveau Monde. Inaugurée le 11 décembre 2020 selon KOACI ; dépositaire Davidoff selon le localisateur de la marque.',
  'Cigar cellar of the house of Zino — perfumery, watches, leather goods and cigars in Abidjan for more than forty years, it says — in the Cap Sud shopping gallery in Marcory: Habanos and New World cigars. Inaugurated on 11 December 2020 according to KOACI; a Davidoff appointed merchant according to the brand''s locator.',
  'Cava de puros de la casa Zino — perfumería, relojería, marroquinería y puros en Abiyán desde hace más de cuarenta años, según dice — en la galería comercial Cap Sud, en Marcory: Habanos y puros del Nuevo Mundo. Inaugurada el 11 de diciembre de 2020 según KOACI; distribuidor autorizado Davidoff según el localizador de la marca.',
  'Zigarrenkeller des Hauses Zino — Parfümerie, Uhren, Lederwaren und Zigarren in Abidjan seit über vierzig Jahren, wie es sagt — in der Einkaufsgalerie Cap Sud in Marcory: Habanos und Zigarren der Neuen Welt. Eingeweiht am 11. Dezember 2020 laut KOACI; autorisierter Davidoff-Händler laut Store-Locator der Marke.',
  'Zino 公司的雪茄窖——据其自述，在阿比让经营香水、钟表、皮具和雪茄四十余年——位于马科里区的 Cap Sud 商业长廊：哈瓦那雪茄与新世界雪茄。据 KOACI 于2020年12月11日揭幕；据品牌定位器为 Davidoff 授权经销商。',
  'قبو سيجار دار Zino — عطور وساعات وجلديات وسيجار في أبيدجان منذ ما يزيد على أربعين سنة، كما تقول — في رواق Cap Sud التجاري بماركوري: هابانوس وسيجار العالم الجديد. دُشّن في 11 ديسمبر 2020 بحسب KOACI؛ ووكيل معتمد لدافيدوف بحسب محدّد العلامة.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2578);
INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 488, 2578, 'placeholder_2578.jpg', 1, 1, 'admin', 1, NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2578);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `hours`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2579, 'ivorycoast', 'Zino — Cave Rue des Jardins (II Plateaux)', 'Abidjan, Cocody, II Plateaux — Rue des Jardins', 'Cave à cigares', '+225 07 09 74 97 14', 'https://zino.ci/', 'Lun-Sam 9h-minuit, Dim 10h-18h', 'zino.ci, page Nos boutiques (Cave Rue des Jardins : téléphone, horaires, lu le 18 septembre 2026) ; davidoff.com, localisateur : Zino Cigares – II Plateaux, dépositaire Davidoff, écrit boulevard Roume 7 — une adresse du Plateau, pas des II Plateaux ; koaci.com, 11 décembre 2020 (seconde cave ouverte le même jour aux Deux-Plateaux) — les deux adresses écrites', 1,
  'Seconde cave à cigares de la maison Zino, rue des Jardins aux II Plateaux, ouverte jusqu''à minuit en semaine selon son site. Le localisateur Davidoff, qui la compte parmi ses dépositaires, l''écrit boulevard Roume 7 — une adresse du Plateau ; c''est le site de Zino qui fait foi pour la rue. Ouverte le 11 décembre 2020 selon KOACI.',
  'Second cigar cellar of the house of Zino, Rue des Jardins in II Plateaux, open until midnight on weekdays according to its site. The Davidoff locator, which counts it among its appointed merchants, writes Boulevard Roume 7 — an address in Le Plateau; Zino''s own site is the reference for the street. Opened on 11 December 2020 according to KOACI.',
  'Segunda cava de puros de la casa Zino, rue des Jardins en II Plateaux, abierta hasta medianoche entre semana según su sitio. El localizador Davidoff, que la cuenta entre sus distribuidores autorizados, escribe boulevard Roume 7 — una dirección del Plateau; el sitio de Zino es la referencia para la calle. Abierta el 11 de diciembre de 2020 según KOACI.',
  'Zweiter Zigarrenkeller des Hauses Zino, Rue des Jardins in II Plateaux, wochentags bis Mitternacht geöffnet laut seiner Website. Der Davidoff-Locator, der ihn zu seinen autorisierten Händlern zählt, schreibt Boulevard Roume 7 — eine Adresse im Plateau; für die Strasse gilt die Website von Zino. Eröffnet am 11. Dezember 2020 laut KOACI.',
  'Zino 公司的第二处雪茄窖，位于二高原区花园街，据其网站工作日营业至午夜。将其计入授权经销商的 Davidoff 定位器写的是鲁姆大道7号——那是高原区的地址；街道以 Zino 自己的网站为准。据 KOACI 于2020年12月11日开业。',
  'القبو الثاني للسيجار لدار Zino، شارع الحدائق في II Plateaux، يفتح حتّى منتصف الليل في أيام الأسبوع بحسب موقعه. يكتبه محدّد دافيدوف، الذي يعدّه ضمن وكلائه المعتمدين، في جادة روم 7 — وهو عنوان في حيّ البلاتو؛ وموقع Zino هو المرجع للشارع. افتُتح في 11 ديسمبر 2020 بحسب KOACI.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2579);
INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 489, 2579, 'placeholder_2579.jpg', 1, 1, 'admin', 1, NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2579);

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'lounges', l.`id`, 'description', g.lang, SHA1(l.`description`), 'machine', NOW()
  FROM `lounges` l
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de' UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') g
 WHERE l.`id` IN (2568, 2569, 2570, 2571, 2572, 2573, 2574, 2575, 2576, 2577, 2578, 2579)
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `statut` = 'machine', `maj` = NOW();

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 235';
INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 235','systeme','fiche_ajoutee','lounge',2568,'La Casa del Habano — Montreux (Fairmont Le Montreux Palace) — la-casa-del-habano-montreux.com (adresse, téléphone, horaires, lu le 18 septembre 2026) ; lacasadelhabano.com, actualité du 16 juin 2026 ; habanos.com, page place (annuaire lu le 1'),
  (NULL,'migration 235','systeme','fiche_ajoutee','lounge',2569,'La Casa del Habano — Genève (rue de Hesse) — lacasadelhabano-geneve.com (adresse, téléphone, horaires, lu le 18 septembre 2026) ; habanos.com, actualité du 6 novembre 2025 (inaugurée les 10 et 11 octobre 2025) et page place —'),
  (NULL,'migration 235','systeme','fiche_ajoutee','lounge',2570,'La Casa del Habano — Zoug — lacasadelhabano.com, actualité du 13 mars 2024 (ouverte le 3 février 2024, environ deux cents mètres carrés, boutique et salon avec bar, avec Intertabak) ; siglomundo.ch, où renvoi'),
  (NULL,'migration 235','systeme','fiche_ajoutee','lounge',2571,'La Casa del Habano — Samnaun — lcdh-samnaun.ch (horaires, téléphone +41 78 251 26 45, lu le 18 septembre 2026) ; habanomag.com, 20 février 2024 (ouverte en janvier 2024, inaugurée début février ; salon au rez-de'),
  (NULL,'migration 235','systeme','fiche_ajoutee','lounge',2572,'La Casa del Habano — Kreuzlingen — lacasadelhabanokreuzlingen.ch (adresse, téléphone, lu le 18 septembre 2026) ; zigarren.zone, 29 juin 2026 (inaugurée le 27 juin 2026 par la famille Portmann, à côté de sa maison de'),
  (NULL,'migration 235','systeme','fiche_ajoutee','lounge',2573,'La Casa del Habano — Andorre (Escaldes-Engordany) — habanos.com, page place La Casa Del Habano – Andorra (annuaire lu le 17 septembre 2026 ; distributeur Maori Tabacs S.A.) ; plan des franchises lacasadelhabano.com (30 août 2026) : '),
  (NULL,'migration 235','systeme','fiche_ajoutee','lounge',2574,'Davidoff of Geneva since 1911 — Sydney (The Strand Arcade) — davidoff.com, localisateur (boutique en propre, lu le 18 septembre 2026) ; cigarjournal.com, 7 mai 2025 (première boutique Davidoff of Geneva d''Australie, à la place du kiosque Syd'),
  (NULL,'migration 235','systeme','fiche_ajoutee','lounge',2575,'Davidoff of Geneva since 1911 — Bruxelles (Grand Sablon) — davidoff.com, localisateur (boutique en propre, lu le 18 septembre 2026) ; habanos.com, page place Davidoff of Geneva Sablon, Habanos Point (annuaire lu le 17 septembre 2026), même'),
  (NULL,'migration 235','systeme','fiche_ajoutee','lounge',2576,'Davidoff of Geneva since 1911 — Bucarest (Athénée Palace) — davidoff.com, localisateur (boutique en propre, site trabucul.ro, lu le 18 septembre 2026) — aucune page propre ni presse de moins de trois ans lue ; l''hôtel ne liste pas la boutiq'),
  (NULL,'migration 235','systeme','fiche_ajoutee','lounge',2577,'Davidoff of Geneva since 1911 — Bucarest (Băneasa Shopping City) — davidoff.com, localisateur (boutique en propre, lu le 18 septembre 2026) ; baneasa.ro, page Magazin Davidoff (adresse, téléphone, horaires) ; cigaraficionado.com, 22 janvier 2013 ('),
  (NULL,'migration 235','systeme','fiche_ajoutee','lounge',2578,'Zino — Cave Cap Sud (Marcory) — zino.ci, page Nos boutiques (Cave Cap Sud : téléphone, horaires, lu le 18 septembre 2026) ; davidoff.com, localisateur : Zino Cigares – Cap Sud, dépositaire Davidoff ; koaci.com, 1'),
  (NULL,'migration 235','systeme','fiche_ajoutee','lounge',2579,'Zino — Cave Rue des Jardins (II Plateaux) — zino.ci, page Nos boutiques (Cave Rue des Jardins : téléphone, horaires, lu le 18 septembre 2026) ; davidoff.com, localisateur : Zino Cigares – II Plateaux, dépositaire Davidoff, é'),
  (NULL,'migration 235','systeme','lot_21_douze_adresses','systeme',0,'Douze etablissements que les annuaires officiels portent et que l atlas n avait pas, verifies par expert-cigare : cinq Casas del Habano suisses, la Casa d Andorre, quatre boutiques Davidoff of Geneva (Sydney, Bruxelles Sablon, Bucarest x2), deux caves Zino a Abidjan. 345 -> 357 publiables');

SELECT
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (2568, 2569, 2570, 2571, 2572, 2573, 2574, 2575, 2576, 2577, 2578, 2579) AND `is_verified` = 1) = 12 AS douze_fiches,
  (SELECT COUNT(*) FROM `lounge_photos` WHERE `lounge_id` IN (2568, 2569, 2570, 2571, 2572, 2573, 2574, 2575, 2576, 2577, 2578, 2579)) = 12 AS douze_cartes,
  (SELECT COUNT(*) FROM `translation_status` t JOIN `lounges` l ON l.`id` = t.`entite_id` WHERE t.`entite` = 'lounges' AND t.`champ` = 'description' AND l.`id` IN (2568, 2569, 2570, 2571, 2572, 2573, 2574, 2575, 2576, 2577, 2578, 2579) AND t.`source_hash` = SHA1(l.`description`)) = 60 AS sceaux,
  (SELECT COUNT(*) FROM `lounges` WHERE CHAR_LENGTH(`source`) >= 495) = 0 AS aucune_source_tronquee;
SELECT COUNT(*) AS publiables FROM `lounges` WHERE `is_verified` = 1;