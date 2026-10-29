-- ════════════════════════════════════════════════════════
-- 293 — États-Unis : seize fiches relues
-- ────────────────────────────────────────────────────────
-- CE QU'ON A TROUVÉ. Relecture des fiches d'établissements du 29 octobre 2026
-- (expert-cigare, une source datée par verdict, contradicteur pour les
-- « introuvables » retirés en 294). 16 fiches reprises : adresse corrigée quand
-- une source la donne, description ramenée à ce que les sources lues établissent
-- (sans superlatif, sans parole rapportée, sans offre non sourcée, sans nommer de
-- revue : le nom va dans `source`), `source` écrite « à vérifier — relu le
-- 29 octobre 2026 : … ». Les traductions (expert-traduction) repassent en
-- « machine », sceau recalculé sur le nouveau français.
-- Pays : usa. Ids : 146, 147, 148, 149, 151, 152, 411, 414, 415, 417, 418, 420, 424, 426, 1506, 1507.
-- ════════════════════════════════════════════════════════

UPDATE `lounges` SET
  `city` = 'New York — 515 Madison Avenue (angle de la 53e Rue)',
  `description` = 'Boutique de Davidoff of Geneva à New York, au 515 Madison Avenue, rouverte en août 2025 après rénovation, selon la presse spécialisée. L''ancienne adresse du 535 Madison Avenue est celle d''avant le déménagement de 2010.',
  `description_en` = 'Davidoff of Geneva boutique in New York, at 515 Madison Avenue, reopened in August 2025 after renovation, according to the trade press. The former address at 535 Madison Avenue is the one from before the 2010 move.',
  `description_es` = 'Tienda de Davidoff of Geneva en Nueva York, en 515 Madison Avenue, reabierta en agosto de 2025 tras una renovación, según la prensa especializada. La antigua dirección, 535 Madison Avenue, es la anterior al traslado de 2010.',
  `description_de` = 'Boutique von Davidoff of Geneva in New York, 515 Madison Avenue, laut Fachpresse im August 2025 nach einer Renovierung wiedereröffnet. Die frühere Adresse 535 Madison Avenue ist die von vor dem Umzug im Jahr 2010.',
  `description_zh` = 'Davidoff of Geneva 在纽约的专卖店，位于 515 Madison Avenue，据专业媒体报道，经翻新后于2025年8月重新开业。此前的地址 535 Madison Avenue 是2010年搬迁之前的地址。',
  `description_ar` = 'متجر Davidoff of Geneva في نيويورك، في 515 Madison Avenue، أُعيد افتتاحه في أغسطس 2025 بعد التجديد، بحسب الصحافة المتخصصة. العنوان القديم 535 Madison Avenue هو العنوان السابق لانتقال عام 2010.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : cigaraficionado.com (article du 19 août 2025 lu : flagship au 515 Madison Avenue, réouverture après rénovation ; article de 2010 sur le déménagement du 535 au 515, vu en résultat de recherche seulement). Site de la marque non relu. Divergence : un magazine de pipes cite encore le 535.',
  `updated_at` = NOW()
 WHERE `id` = 146 AND `country_id` = 'usa' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'New York — 156 West 56th Street, Midtown',
  `description` = 'Bar à cigares de Midtown au 156 West 56th Street, au décor de bibliothèque gothique selon la presse spécialisée (2012). Une soirée « Sinatra Saturdays » y a fêté son vingtième anniversaire en novembre 2024, d''après New Jersey Stage ; Time Out (fiche de 2010) la situe le samedi avec un orchestre de onze musiciens.',
  `description_en` = 'Midtown cigar bar at 156 West 56th Street, with a gothic library décor according to the trade press (2012). A “Sinatra Saturdays” evening celebrated its twentieth anniversary there in November 2024, according to New Jersey Stage; Time Out (2010 listing) places it on Saturdays with an eleven-piece orchestra.',
  `description_es` = 'Bar de puros de Midtown en 156 West 56th Street, con decoración de biblioteca gótica según la prensa especializada (2012). Una velada «Sinatra Saturdays» celebró allí su vigésimo aniversario en noviembre de 2024, según New Jersey Stage; Time Out (ficha de 2010) la sitúa en sábado, con una orquesta de once músicos.',
  `description_de` = 'Zigarrenbar in Midtown, 156 West 56th Street, laut Fachpresse (2012) im Dekor einer gotischen Bibliothek. Ein Abend namens „Sinatra Saturdays“ feierte dort im November 2024 sein zwanzigjähriges Jubiläum, laut New Jersey Stage; Time Out (Eintrag von 2010) verortet ihn samstags mit einem Orchester aus elf Musikern.',
  `description_zh` = '位于 Midtown 的雪茄吧，地址 156 West 56th Street，据专业媒体（2012年）报道，装潢为哥特式图书馆风格。据 New Jersey Stage 报道，“Sinatra Saturdays”之夜于2024年11月在此庆祝20周年；Time Out（2010年条目）称其在周六举行，并有一支十一人的乐队。',
  `description_ar` = 'بار سيجار في Midtown، في 156 West 56th Street، بديكور مكتبة قوطية بحسب الصحافة المتخصصة (2012). احتفلت أمسية «Sinatra Saturdays» هناك بذكراها العشرين في نوفمبر 2024، وفقًا لـ New Jersey Stage؛ وتضعها Time Out (سجل 2010) يوم السبت مع أوركسترا من أحد عشر موسيقيًا.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : cigaraficionado.com (24 septembre 2012 : adresse, décor gothique), newjerseystage.com (6 novembre 2024 : vingtième anniversaire de Sinatra Saturdays), timeout.com (fiche de 2010). Site officiel illisible (connexion coupée) : ouverture en 2026 non établie. Les sources divergent sur le début de la soirée (2000 ou 2004-2005).',
  `updated_at` = NOW()
 WHERE `id` = 147 AND `country_id` = 'usa' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'New York — 26 East 63rd Street, Upper East Side',
  `description` = 'Lounge à cigares de l''Upper East Side, au 26 East 63rd Street, rattaché à la marque Club Macanudo selon la page de l''enseigne.',
  `description_en` = 'Cigar lounge on the Upper East Side, at 26 East 63rd Street, linked to the Club Macanudo brand according to the chain''s page.',
  `description_es` = 'Lounge de puros del Upper East Side, en 26 East 63rd Street, vinculado a la marca Club Macanudo según la página de la cadena.',
  `description_de` = 'Zigarrenlounge an der Upper East Side, 26 East 63rd Street, laut der Seite der Ladenkette mit der Marke Club Macanudo verbunden.',
  `description_zh` = '位于 Upper East Side 的雪茄廊，地址 26 East 63rd Street，据该连锁品牌的页面，隶属于 Club Macanudo 品牌。',
  `description_ar` = 'صالة سيجار في Upper East Side، في 26 East 63rd Street، مرتبطة بعلامة Club Macanudo بحسب صفحة المتجر.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : clubmacanudo.com (page New York : 26 E 63rd St, New York, NY 10065 ; horaires listés, page non datée). Billet de 2018 sur la scène cigare de New York vu en résultat de recherche seulement, même adresse. Aucune preuve de fermeture ni de réouverture récente.',
  `updated_at` = NOW()
 WHERE `id` = 148 AND `country_id` = 'usa' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'New York — 636 Hudson Street, West Village',
  `description` = 'Bar à cigares du West Village, au 636 Hudson Street. La presse spécialisée (29 octobre 1998) indique que l''on peut y apporter son cigare ; Time Out le décrit comme un bar à cigares légal (vu en résultat de recherche seulement).',
  `description_en` = 'Cigar bar in the West Village, at 636 Hudson Street. The trade press (29 October 1998) states that one can bring one''s own cigar there; Time Out describes it as a legal cigar bar (seen in a search result only).',
  `description_es` = 'Bar de puros del West Village, en 636 Hudson Street. La prensa especializada (29 de octubre de 1998) indica que se puede llevar el propio puro; Time Out lo describe como un bar de puros legal (visto solo en un resultado de búsqueda).',
  `description_de` = 'Zigarrenbar im West Village, 636 Hudson Street. Laut Fachpresse (29. Oktober 1998) kann man dort die eigene Zigarre mitbringen; Time Out beschreibt sie als legale Zigarrenbar (nur in einem Suchergebnis gesehen).',
  `description_zh` = '位于 West Village 的雪茄吧，地址 636 Hudson Street。专业媒体（1998年10月29日）指出，顾客可自带雪茄前往；Time Out 称其为合法的雪茄吧（仅见于搜索结果）。',
  `description_ar` = 'بار سيجار في West Village، في 636 Hudson Street. تفيد الصحافة المتخصصة (29 أكتوبر 1998) بإمكانية إحضار السيجار الخاص إليه؛ وتصفه Time Out بأنه بار سيجار قانوني (ظهر في نتيجة بحث فقط).',
  `source` = 'à vérifier — relu le 29 octobre 2026 : cigaraficionado.com (article du 29 octobre 1998 : 636 Hudson Street, cigare personnel accepté), timeout.com (vu en résultat de recherche, non daté). Aucune source de 2025-2026 trouvée ; site de l''établissement illisible (connexion coupée).',
  `updated_at` = NOW()
 WHERE `id` = 149 AND `country_id` = 'usa' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'New York — 1016 Second Avenue (10022), adresse à relire à la main',
  `description` = 'Boutique-salon de l''enseigne Casa de Montecristo à New York. Une adresse au 1016 Second Avenue ressort d''un résumé de recherche de la page de l''enseigne ; l''adresse 401 Park Avenue South de l''ancienne fiche n''a pas été retrouvée.',
  `description_en` = 'Boutique-lounge of the Casa de Montecristo brand in New York. An address at 1016 Second Avenue emerges from a search summary of the brand''s page; the address 401 Park Avenue South from the previous listing was not found.',
  `description_es` = 'Tienda-salón de la marca Casa de Montecristo en Nueva York. Una dirección en 1016 Second Avenue figura en un resumen de búsqueda de la página de la marca; la dirección 401 Park Avenue South de la ficha anterior no se ha encontrado.',
  `description_de` = 'Boutique mit Lounge der Marke Casa de Montecristo in New York. Eine Adresse in der 1016 Second Avenue geht aus einer Suchzusammenfassung der Seite der Marke hervor; die Adresse 401 Park Avenue South des früheren Eintrags wurde nicht gefunden.',
  `description_zh` = '纽约 Casa de Montecristo 品牌的专卖店兼雪茄廊。从该品牌页面的搜索摘要中可见一个地址：1016 Second Avenue；原条目中的地址 401 Park Avenue South 未能找到。',
  `description_ar` = 'متجر وصالة تابعان لعلامة Casa de Montecristo في نيويورك. يظهر عنوان في 1016 Second Avenue في ملخص بحث لصفحة العلامة؛ أما عنوان 401 Park Avenue South الوارد في السجل القديم فلم يُعثر عليه.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : page de l''enseigne refusée (403), adresse 1016 2nd Ave, New York, NY 10022 vue seulement dans un résumé de recherche. thegentlemansjournal.com cite l''enseigne à New York sans adresse ni date. Divergence : 401 Park Avenue South (ancienne fiche), introuvable.',
  `updated_at` = NOW()
 WHERE `id` = 151 AND `country_id` = 'usa' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Naples, Florida — adresse à confirmer (9110 Strada Place d''après un listing non daté ; 698 4th Avenue South dans l''ancienne fiche)',
  `description` = 'Lounge BURN by Rocky Patel à Naples (Floride), dont l''ouverture était annoncée pour le 6 novembre 2010 par la presse spécialisée, qui le présente comme le premier cigar bar de la marque.',
  `description_en` = 'BURN by Rocky Patel lounge in Naples (Florida), whose opening was announced for 6 November 2010 by the trade press, which presents it as the brand''s first cigar bar.',
  `description_es` = 'Lounge BURN by Rocky Patel en Naples (Florida), cuya apertura la prensa especializada anunció para el 6 de noviembre de 2010 y que lo presenta como el primer cigar bar de la marca.',
  `description_de` = 'Lounge BURN by Rocky Patel in Naples (Florida), dessen Eröffnung die Fachpresse für den 6. November 2010 ankündigte und das sie als die erste Cigar Bar der Marke bezeichnet.',
  `description_zh` = '位于佛罗里达州 Naples 的 BURN by Rocky Patel 雪茄廊，专业媒体曾宣布其将于2010年11月6日开业，并称其为该品牌的首家雪茄吧。',
  `description_ar` = 'صالة BURN by Rocky Patel في نابولي (فلوريدا)، أعلنت الصحافة المتخصصة عن افتتاحها في 6 نوفمبر 2010، وقدّمتها بوصفها أول بار سيجار للعلامة.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : cigaraficionado.com (article du 27 octobre 2010 : ouverture à Naples le 6 novembre). cigarjournal.com : listing 9110 Strada Pl vu en résultat de recherche seulement, article non retrouvé. Divergence d''adresse : 698 4th Avenue South (ancienne fiche), sans source. Statut en 2026 non établi.',
  `updated_at` = NOW()
 WHERE `id` = 152 AND `country_id` = 'usa' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Miami, FL — 1535 NW 79th Ave, Doral (adresse non retrouvée)',
  `description` = 'Fiche placée à Doral, près de Miami. Aucune source lue n''atteste un Casa de Montecristo à cette adresse ; la presse spécialisée documente un Casa de Montecristo à Brickell (Miami) en 2016, devenu Empire Social Lounge selon Halfwheel.',
  `description_en` = 'Listing placed in Doral, near Miami. No source consulted attests a Casa de Montecristo at this address; the trade press documents a Casa de Montecristo in Brickell (Miami) in 2016, which became Empire Social Lounge according to Halfwheel.',
  `description_es` = 'Ficha situada en Doral, cerca de Miami. Ninguna fuente consultada acredita una Casa de Montecristo en esta dirección; la prensa especializada documenta una Casa de Montecristo en Brickell (Miami) en 2016, convertida en Empire Social Lounge según Halfwheel.',
  `description_de` = 'Eintrag in Doral bei Miami. Keine eingesehene Quelle belegt ein Casa de Montecristo an dieser Adresse; die Fachpresse dokumentiert 2016 ein Casa de Montecristo in Brickell (Miami), das laut Halfwheel zum Empire Social Lounge wurde.',
  `description_zh` = '该条目位于迈阿密附近的 Doral。所查阅的来源均未证实此地址设有 Casa de Montecristo；专业媒体记录2016年在迈阿密 Brickell 有一家 Casa de Montecristo，据 Halfwheel 报道，其后改为 Empire Social Lounge。',
  `description_ar` = 'سجل موضوع في Doral قرب ميامي. لا يؤكد أي مصدر تمت قراءته وجود Casa de Montecristo في هذا العنوان؛ وتوثّق الصحافة المتخصصة وجود Casa de Montecristo في Brickell (ميامي) عام 2016، تحوّل إلى Empire Social Lounge بحسب Halfwheel.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : cigaraficionado.com (2016 : Casa de Montecristo à Brickell), halfwheel.com (titre : devenu Empire Social Lounge), cigardojo.com (liste de septembre 2025 : Tampa, Boca Raton, Boynton Beach, West Palm Beach ; ni Doral ni Miami). Localisateur de l''enseigne refusé (403). Requêtes en anglais seulement.',
  `updated_at` = NOW()
 WHERE `id` = 411 AND `country_id` = 'usa' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Orlando, FL — 7339 W Sand Lake Rd (adresse non retrouvée)',
  `description` = 'Fiche placée sur West Sand Lake Road, à Orlando. Aucune source lue ne mentionne un Casa de Montecristo à Orlando.',
  `description_en` = 'Listing placed on West Sand Lake Road, in Orlando. No source consulted mentions a Casa de Montecristo in Orlando.',
  `description_es` = 'Ficha situada en West Sand Lake Road, en Orlando. Ninguna fuente consultada menciona una Casa de Montecristo en Orlando.',
  `description_de` = 'Eintrag an der West Sand Lake Road in Orlando. Keine eingesehene Quelle erwähnt ein Casa de Montecristo in Orlando.',
  `description_zh` = '该条目位于奥兰多的 West Sand Lake Road。所查阅的来源均未提及奥兰多设有 Casa de Montecristo。',
  `description_ar` = 'سجل موضوع في West Sand Lake Road في أورلاندو. لا يذكر أي مصدر تمت قراءته وجود Casa de Montecristo في أورلاندو.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : cigardojo.com (liste de septembre 2025 des Casa de Montecristo : aucun Orlando), cigaraficionado.com (lounges de l''éditeur : Chicago, Boynton Beach, New York ; pas Orlando). Localisateur de l''enseigne refusé (403) ; aucune source pour 7339 W Sand Lake Rd.',
  `updated_at` = NOW()
 WHERE `id` = 414 AND `country_id` = 'usa' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Las Vegas, NV — 3200 S Las Vegas Blvd, suite 1245',
  `description` = 'Boutique Davidoff of Geneva since 1911 de Las Vegas, au 3200 South Las Vegas Boulevard, suite 1245, selon le site de l''établissement. Le localisateur de la marque, lu le 18 septembre 2026, la liste parmi ses boutiques en propre ; il ne connaît pas l''adresse antérieure du Palazzo (3325 Las Vegas Boulevard).',
  `description_en` = 'Davidoff of Geneva since 1911 boutique in Las Vegas, at 3200 South Las Vegas Boulevard, suite 1245, according to the establishment''s website. The brand''s locator, read on 18 September 2026, lists it among its own boutiques; it does not know the earlier Palazzo address (3325 Las Vegas Boulevard).',
  `description_es` = 'Tienda Davidoff of Geneva since 1911 de Las Vegas, en 3200 South Las Vegas Boulevard, suite 1245, según el sitio web del establecimiento. El localizador de la marca, consultado el 18 de septiembre de 2026, la incluye entre sus tiendas propias; no recoge la dirección anterior del Palazzo (3325 Las Vegas Boulevard).',
  `description_de` = 'Boutique Davidoff of Geneva since 1911 in Las Vegas, 3200 South Las Vegas Boulevard, Suite 1245, laut Website des Geschäfts. Der Händlerfinder der Marke, am 18. September 2026 eingesehen, führt sie unter den eigenen Boutiquen auf; die frühere Adresse im Palazzo (3325 Las Vegas Boulevard) kennt er nicht.',
  `description_zh` = '拉斯维加斯的 Davidoff of Geneva since 1911 专卖店，地址 3200 South Las Vegas Boulevard, suite 1245，据该店网站。该品牌的门店查询工具（2026年9月18日查阅）将其列为自营专卖店之一；其中没有 Palazzo 的旧地址（3325 Las Vegas Boulevard）。',
  `description_ar` = 'متجر Davidoff of Geneva since 1911 في لاس فيغاس، في 3200 South Las Vegas Boulevard, suite 1245، بحسب موقع المؤسسة. يدرجه محدد المواقع التابع للعلامة، الذي اطُّلع عليه في 18 سبتمبر 2026، ضمن متاجرها الخاصة؛ ولا يعرف العنوان السابق في Palazzo (3325 Las Vegas Boulevard).',
  `source` = 'à vérifier — relu le 29 octobre 2026 : davidoffcigarbarlv.com (3200 Las Vegas Blvd. #1245, Las Vegas, NV 89109 ; page non datée). Localisateur davidoff.com lu le 18 septembre 2026 (56 boutiques en propre), non relu ce jour. Divergence : la fiche la plaçait au Palazzo, 3325 Las Vegas Blvd.',
  `updated_at` = NOW()
 WHERE `id` = 415 AND `country_id` = 'usa' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Las Vegas, NV — Venetian ou Palazzo (adresse non établie)',
  `description` = 'Fiche d''un Club Macanudo à Las Vegas, située tantôt aux Grand Canal Shoppes du Venetian, tantôt aux Shoppes at Palazzo selon l''intitulé. Aucune source lue n''atteste un Club Macanudo à cet endroit.',
  `description_en` = 'Listing for a Club Macanudo in Las Vegas, located sometimes at the Grand Canal Shoppes at the Venetian, sometimes at the Shoppes at Palazzo depending on the title. No source consulted attests a Club Macanudo at this location.',
  `description_es` = 'Ficha de un Club Macanudo en Las Vegas, situado unas veces en las Grand Canal Shoppes del Venetian y otras en las Shoppes at Palazzo según el título. Ninguna fuente consultada acredita un Club Macanudo en ese lugar.',
  `description_de` = 'Eintrag eines Club Macanudo in Las Vegas, je nach Bezeichnung mal in den Grand Canal Shoppes des Venetian, mal in den Shoppes at Palazzo verortet. Keine eingesehene Quelle belegt einen Club Macanudo an diesem Ort.',
  `description_zh` = '拉斯维加斯 Club Macanudo 的条目，按标题所示，时而位于 Venetian 的 Grand Canal Shoppes，时而位于 Shoppes at Palazzo。所查阅的来源均未证实此处设有 Club Macanudo。',
  `description_ar` = 'سجل لـ Club Macanudo في لاس فيغاس، يقع تارةً في Grand Canal Shoppes في Venetian وتارةً في Shoppes at Palazzo بحسب العنوان. لا يؤكد أي مصدر تمت قراءته وجود Club Macanudo في هذا المكان.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : lasvegassun.com (2002 : promotion Club Macanudo à Las Vegas, lieu non précisé), lasvegasadvisor.com (résultat de recherche, Venetian non confirmé). clubmacanudo.com et la liste du Venetian non lus. Divergence : intitulé « Shoppes at Palazzo », adresse « Venetian ».',
  `updated_at` = NOW()
 WHERE `id` = 417 AND `country_id` = 'usa' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Chicago, IL — 19 S Wabash Ave (2e étage)',
  `description` = 'Maison de tabac de Chicago, au 19 South Wabash Avenue, au deuxième étage selon Wikipédia (anglais). Son site désigne un magasin et un salon, la Front Room, sans indiquer l''étage.',
  `description_en` = 'Tobacco house in Chicago, at 19 South Wabash Avenue, on the second floor according to Wikipedia (English). Its website describes a shop and a lounge, the Front Room, without stating the floor.',
  `description_es` = 'Casa de tabaco de Chicago, en 19 South Wabash Avenue, en la segunda planta según Wikipedia (en inglés). Su sitio web habla de una tienda y un salón, la Front Room, sin indicar la planta.',
  `description_de` = 'Tabakhaus in Chicago, 19 South Wabash Avenue, laut Wikipedia (englisch) im zweiten Stock. Auf der Website werden ein Geschäft und ein Salon, der Front Room, genannt, ohne das Stockwerk anzugeben.',
  `description_zh` = '芝加哥的烟草商行，地址 19 South Wabash Avenue，据 Wikipedia（英文版）位于二楼。其网站列出一家商店和一个名为 Front Room 的沙龙，未注明楼层。',
  `description_ar` = 'دار تبغ في شيكاغو، في 19 South Wabash Avenue، في الطابق الثاني بحسب Wikipedia (بالإنجليزية). يذكر موقعها متجرًا وصالة هي Front Room دون تحديد الطابق.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : en.wikipedia.org (19 S Wabash, deuxième étage), iwanries.com (magasin et salon Front Room, pas d''étage indiqué), timeout.com (étage 2, vu en résultat de recherche seulement). Divergence : la fiche indiquait le 7e étage, non retrouvé.',
  `updated_at` = NOW()
 WHERE `id` = 418 AND `country_id` = 'usa' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Beverly Hills, CA — 301 N Canon Dr (à l''étage, angle Dayton Way)',
  `description` = 'Club de cigares privé de Beverly Hills, au 301 North Canon Drive, à l''angle de Dayton Way, un étage au-dessus du rez-de-chaussée selon son site, qui le présente comme un club sur adhésion.',
  `description_en` = 'Private cigar club in Beverly Hills, at 301 North Canon Drive, at the corner of Dayton Way, one floor above ground level according to its website, which presents it as a membership club.',
  `description_es` = 'Club de puros privado de Beverly Hills, en 301 North Canon Drive, esquina con Dayton Way, un piso por encima de la planta baja según su sitio web, que lo presenta como un club de socios.',
  `description_de` = 'Privater Zigarrenclub in Beverly Hills, 301 North Canon Drive, Ecke Dayton Way, laut Website eine Etage über dem Erdgeschoss; er wird dort als Mitgliederclub dargestellt.',
  `description_zh` = '比弗利山庄的私人雪茄俱乐部，地址 301 North Canon Drive，位于 Dayton Way 转角，据其网站在底层之上一层，并称其为会员制俱乐部。',
  `description_ar` = 'نادي سيجار خاص في بيفرلي هيلز، في 301 North Canon Drive، عند تقاطع Dayton Way، في الطابق الذي يعلو الطابق الأرضي بحسب موقعه، الذي يقدّمه بوصفه ناديًا بالعضوية.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : grandhavana.com (page Beverly Hills : 301 N Canon Dr, angle Dayton Way, un étage au-dessus ; accueil : club sur adhésion). Pas de seconde source indépendante ; statut non daté. Divergence : la fiche indiquait le 2e étage, non prouvé.',
  `updated_at` = NOW()
 WHERE `id` = 420 AND `country_id` = 'usa' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Boston, MA — 2½ Park Square',
  `description` = 'Maison fondée en 1870 à Boston d''après son site, qui indique que l''activité se poursuit à Park Square et qu''une fabrique de cigares y a ouvert en 1892.',
  `description_en` = 'House founded in 1870 in Boston according to its website, which states that the business continues at Park Square and that a cigar factory opened there in 1892.',
  `description_es` = 'Casa fundada en 1870 en Boston según su sitio web, que indica que la actividad continúa en Park Square y que allí abrió una fábrica de puros en 1892.',
  `description_de` = 'Haus, laut Website 1870 in Boston gegründet; dort heißt es, der Betrieb werde am Park Square fortgeführt und dort sei 1892 eine Zigarrenfabrik eröffnet worden.',
  `description_zh` = '据其网站，该商行于1870年在波士顿创立，网站称业务仍在 Park Square 延续，并于1892年在此开设了一家雪茄工厂。',
  `description_ar` = 'دار تأسست عام 1870 في بوسطن بحسب موقعها، الذي يفيد باستمرار النشاط في Park Square وبافتتاح مصنع سيجار هناك عام 1892.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : ljperetti.com (2 1/2 Park Square, Boston ; fondée en 1870 ; activité poursuivie à Park Square ; fabrique de cigares ouverte en 1892). Source unique, celle de la maison ; aucune seconde source indépendante trouvée. Divergence : l''ancienne fiche citait Harvard Square, non retrouvé.',
  `updated_at` = NOW()
 WHERE `id` = 424 AND `country_id` = 'usa' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Washington, DC — 3144 M Street NW',
  `description` = 'Boutique de tabac de Georgetown, au 3144 M Street NW. David Berkebile en est le propriétaire et l''exploitant depuis plus de soixante ans, d''après la presse spécialisée (2025) ; la boutique a ouvert en 1964 selon la presse locale.',
  `description_en` = 'Tobacco shop in Georgetown, at 3144 M Street NW. David Berkebile has been its owner and operator for over sixty years, according to the trade press (2025); the shop opened in 1964 according to the local press.',
  `description_es` = 'Tienda de tabaco de Georgetown, en 3144 M Street NW. David Berkebile es su propietario y gestor desde hace más de sesenta años, según la prensa especializada (2025); la tienda abrió en 1964 según la prensa local.',
  `description_de` = 'Tabakgeschäft in Georgetown, 3144 M Street NW. David Berkebile ist laut Fachpresse (2025) seit mehr als sechzig Jahren Inhaber und Betreiber; das Geschäft wurde laut lokaler Presse 1964 eröffnet.',
  `description_zh` = '乔治城的烟草店，地址 3144 M Street NW。据专业媒体（2025年），David Berkebile 担任店主和经营者已六十多年；据本地媒体，该店于1964年开业。',
  `description_ar` = 'متجر تبغ في جورجتاون، في 3144 M Street NW. David Berkebile هو مالكه ومشغّله منذ ما يزيد على ستين عامًا، بحسب الصحافة المتخصصة (2025)؛ وافتُتح المتجر عام 1964 بحسب الصحافة المحلية.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : thegeorgetowndish.com (3144 M Street, vu en extrait de recherche), cigaraficionado.com (entretien 2025 avec David Berkebile, vu en extrait de recherche). Site officiel illisible (erreur de certificat). Pages à relire en direct.',
  `updated_at` = NOW()
 WHERE `id` = 426 AND `country_id` = 'usa' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Palm Beach, FL — 1 South County Road',
  `description` = 'Hôtel de Palm Beach, au 1 South County Road. Son site ne mentionne aucun salon cigares ; la presse spécialisée (1996) citait le bar Club Alcazar comme lieu où fumer un cigare. Aucune source lue ne mentionne un « Cigar & Spirits Lounge ».',
  `description_en` = 'Hotel in Palm Beach, at 1 South County Road. Its website mentions no cigar lounge; the trade press (1996) cited the Club Alcazar bar as a place to smoke a cigar. No source consulted mentions a “Cigar & Spirits Lounge”.',
  `description_es` = 'Hotel de Palm Beach, en 1 South County Road. Su sitio web no menciona ningún salón de puros; la prensa especializada (1996) citaba el bar Club Alcazar como lugar donde fumar un puro. Ninguna fuente consultada menciona un «Cigar & Spirits Lounge».',
  `description_de` = 'Hotel in Palm Beach, 1 South County Road. Auf seiner Website ist kein Zigarrensalon erwähnt; die Fachpresse (1996) nannte die Bar Club Alcazar als Ort, um eine Zigarre zu rauchen. Keine eingesehene Quelle erwähnt eine „Cigar & Spirits Lounge“.',
  `description_zh` = '棕榈滩的酒店，地址 1 South County Road。其网站未提及任何雪茄沙龙；专业媒体（1996年）曾提到 Club Alcazar 酒吧可供吸雪茄。所查阅的来源均未提及“Cigar & Spirits Lounge”。',
  `description_ar` = 'فندق في بالم بيتش، في 1 South County Road. لا يذكر موقعه أي صالون سيجار؛ وكانت الصحافة المتخصصة (1996) تشير إلى بار Club Alcazar بوصفه مكانًا لتدخين السيجار. لا يذكر أي مصدر تمت قراءته «Cigar & Spirits Lounge».',
  `source` = 'à vérifier — relu le 29 octobre 2026 : thebreakers.com (accueil : 1 S County Rd, Palm Beach, FL 33480 ; aucun salon cigares cité ; données structurées « smoke-free »), cigaraficionado.com (article de 1996, extrait de recherche : Club Alcazar). Liste des bars de l''hôtel non lue. Date d''ouverture 1896 non lue.',
  `updated_at` = NOW()
 WHERE `id` = 1506 AND `country_id` = 'usa' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Augusta, GA — 2604 Washington Road, 30904',
  `description` = 'Club de golf privé d''Augusta, hôte du Masters. La presse spécialisée (2019) indique qu''il est légal de fumer sur le parcours pendant le tournoi ; aucune source lue ne mentionne un salon des membres où l''on fume.',
  `description_en` = 'Private golf club in Augusta, host of the Masters. The trade press (2019) states that smoking on the course is legal during the tournament; no source consulted mentions a members'' lounge where smoking is allowed.',
  `description_es` = 'Club de golf privado de Augusta, anfitrión del Masters. La prensa especializada (2019) indica que es legal fumar en el campo durante el torneo; ninguna fuente consultada menciona un salón de socios donde se fume.',
  `description_de` = 'Privater Golfclub in Augusta, Gastgeber des Masters. Laut Fachpresse (2019) ist das Rauchen auf dem Platz während des Turniers legal; keine eingesehene Quelle erwähnt einen Mitgliedersalon, in dem geraucht wird.',
  `description_zh` = '奥古斯塔的私人高尔夫俱乐部，大师赛的主办方。专业媒体（2019年）指出，比赛期间在球场内吸烟是合法的；所查阅的来源均未提及可吸烟的会员沙龙。',
  `description_ar` = 'نادي غولف خاص في أوغوستا، مضيف بطولة الماسترز. تفيد الصحافة المتخصصة (2019) بأن التدخين في الملعب قانوني خلال البطولة؛ ولا يذكر أي مصدر تمت قراءته صالونًا للأعضاء يُسمح فيه بالتدخين.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : cigaraficionado.com (article Masters 2019 : fumer permis sur le parcours ; extrait de recherche : Verandah et Champions Dining Room, accès par un membre). Aucun salon cigares attesté. Adresse non relue sur la page officielle du club.',
  `updated_at` = NOW()
 WHERE `id` = 1507 AND `country_id` = 'usa' AND `is_verified` = 1;

UPDATE `translation_status` t
  JOIN `lounges` l ON l.`id` = t.`entite_id`
   SET t.`source_hash` = SHA1(l.`description`), t.`statut` = 'machine', t.`maj` = NOW()
 WHERE t.`entite` = 'lounges' AND t.`champ` = 'description' AND t.`entite_id` IN ('146','147','148','149','151','152','411','414','415','417','418','420','424','426','1506','1507');

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 293';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 293', 'systeme', 'fiches_relues', 'systeme', 0,
        'États-Unis : seize fiches relues : 16 fiches reprises (adresse, description, source datee), traductions remises en machine');

-- Contrôle : des 1 partout.
SELECT
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (146,147,148,149,151,152,411,414,415,417,418,420,424,426,1506,1507) AND `source` LIKE 'à vérifier — relu le 29 octobre 2026%') = 16 AS `fiches_relues`,
  (SELECT COUNT(*) FROM `translation_status` WHERE `entite` = 'lounges' AND `champ` = 'description' AND `entite_id` IN ('146','147','148','149','151','152','411','414','415','417','418','420','424','426','1506','1507') AND `statut` = 'machine') = 80 AS `sceaux_remis`;
