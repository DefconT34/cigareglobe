-- ════════════════════════════════════════════════════════
-- 222 — Lot 11 du quatrieme recensement : Java et la Chine
-- ────────────────────────────────────────────────────────
-- QUATRE MAISONS, deux pays deja ouverts :
--   INDONESIE  Rizona Baru (Temanggung, 1910), BIN Cigar (Jember, 2013),
--              Golden Djawa (Jember, 2019 — PTPN X, planteur d'Etat)
--   CHINE      Wangguan (Mengcheng, Anhui — le monopole provincial)
-- L'Indonesie ne portait qu'une fiche (Taru Martani), la Chine une
-- (Great Wall). Les sources sont indonesiennes et chinoises, et chaque
-- fiche le dit.
--
-- DEUX FICHES SUISSES COMPLETEES : Villiger Sohne et Burger Sohne ont
-- des fabriques a Jember, que la presse indonesienne nomme parmi les
-- deux fabriques internationales de la ville. Leurs fiches ne le
-- disaient pas ; un paragraphe l'ajoute, six langues.
--
-- ATTRIBUE SANS ETRE ADOPTE : Li Hongzhang et 1896 pour Wangguan (une
-- legende de maison), « douze pays » et « vingt-sept ambassades » pour
-- BIN (la maison et la presse indonesienne), « capable de tenir sa
-- place face a l'Amerique latine » pour Golden Djawa (la maison).
-- Rizona : 1934 ou 1940 pour la reprise par le fils — les deux ecrits.
--
-- NON ECRITES : Taishan (Shandong) — cigarettes surtout, roulage main
-- non etabli ; Mangli Djaya Raya et Dwipa Nusantara — nommees, sans
-- date ni source propre.
--
-- `producer_countries.brands` lu dans la base et reecrit en litteral.
-- ════════════════════════════════════════════════════════

-- ── Rizona Baru ──

INSERT INTO `brands` (`name`, `country_id`, `founded`, `factory`, `source`, `history`, `gamme`, `history_en`, `gamme_en`, `history_es`, `gamme_es`, `history_de`, `gamme_de`, `history_zh`, `gamme_zh`, `history_ar`, `gamme_ar`)
VALUES ('Rizona Baru',
        'indonesia',
        '1910 — Temanggung (Java central) ; Hoo Tjong An',
        'Fabrique propre — Jalan Diponegoro 27, Temanggung ; 38 personnes (2018), surtout des femmes',
        'tribunnews.com « Berdiri Sejak Tahun 1910, Pabrik Cerutu Rizona di Temanggung Hasilkan Ribuan Cerutu Perhari » (21 novembre 2018 : fondée en 1910 par Hoo Tjong An, qui avait appris le cigare auprès d''un cigarier philippin ; en 1940 son fils Sunardi Hartono ; cinquante ans plus tard Mulyadi Hartono ; 38 employés, surtout des femmes ; tabac de Jember ; marques Kenner Ballero, Kenner King, Extra Fine) ; suaramerdeka.com « Mengenal Rizona, Cerutu Legendaris Asli Temanggung » (1934 pour la reprise par Sunardi, qui rebaptise Rizona et fait venir des capes de La Havane et du Brésil — divergence de date avec 1940, écrite) ; merdeka.com (un siècle et plus) ; radarmagelang.jawapos.com « 8 Pabrik Cerutu di Indonesia »',
        'Rizona est une fabrique de Temanggung, dans les montagnes du centre de Java, qui fait des cigares depuis 1910 — l''une des plus anciennes d''Indonésie encore en activité. Son fondateur, Hoo Tjong An, avait appris le métier auprès d''un cigarier philippin, et l''atlas note ce détail parce qu''il relie deux de ses pays : Manille roulait alors pour toute l''Asie, et c''est de là que la manière est venue à Java. Il a monté une petite fabrique et embauché les gens du voisinage.

Son fils, Sunardi Hartono, a repris — en 1934 selon une source, en 1940 selon une autre ; la fiche écrit les deux —, a donné à la fabrique le nom de Rizona et relevé la qualité en faisant venir des capes de La Havane et du Brésil. Cinquante ans plus tard, son propre fils, Mulyadi Hartono, a pris la suite, et c''est lui qui tient la maison en troisième génération. Trente-huit personnes y travaillent, surtout des femmes, du nettoyage des feuilles à la mise en boîte, sans outil moderne ; le tabac vient de Jember, à l''autre bout de l''île. Trois marques : Kenner Ballero, Kenner King, Extra Fine.

La presse indonésienne la visite comme un monument — un siècle et plus, disent les titres. L''atlas, qui ne portait qu''une maison indonésienne, Taru Martani, en ajoute ici une seconde du même âge, et deux de Jember.',
        '[{"name":"Kenner King","color":"#6B4226","force":"Medium","wrapper":"Java","vitolas":[],"story":"L''une des trois marques de la fabrique, sur tabac de Jember."},{"name":"Kenner Ballero","color":"#8B5A2B","force":"Mild-Medium","wrapper":"Java","vitolas":[],"story":"Le format fin de la maison."}]',
        'Rizona is a factory in Temanggung, in the mountains of central Java, that has made cigars since 1910 — one of the oldest in Indonesia still in operation. Its founder, Hoo Tjong An, had learned the trade from a Filipino cigar maker, and this atlas notes the detail because it links two of its countries: Manila then rolled for all of Asia, and that is where the manner came to Java from. He set up a small factory and hired the neighbourhood.

His son, Sunardi Hartono, took over — in 1934 according to one source, 1940 according to another; the entry writes both —, gave the factory the name Rizona and raised quality by bringing wrappers from Havana and Brazil. Fifty years later his own son, Mulyadi Hartono, took the reins, and it is he who runs the house in the third generation. Thirty-eight people work there, mostly women, from cleaning the leaves to boxing, with no modern tools; the tobacco comes from Jember, at the other end of the island. Three brands: Kenner Ballero, Kenner King, Extra Fine.

The Indonesian press visits it as a monument — a century and more, say the headlines. This atlas, which carried only one Indonesian house, Taru Martani, adds here a second of the same age, and two from Jember.',
        '[{"name":"Kenner King","color":"#6B4226","force":"Medium","wrapper":"Java","vitolas":[],"story":"One of the factory''s three brands, on Jember tobacco."},{"name":"Kenner Ballero","color":"#8B5A2B","force":"Mild-Medium","wrapper":"Java","vitolas":[],"story":"The house''s slim size."}]',
        'Rizona es una fábrica de Temanggung, en las montañas del centro de Java, que hace puros desde 1910 — una de las más antiguas de Indonesia aún en actividad. Su fundador, Hoo Tjong An, había aprendido el oficio con un tabaquero filipino, y este atlas anota el detalle porque une dos de sus países: Manila liaba entonces para toda Asia, y de allí vino la manera a Java. Montó una pequeña fábrica y contrató a la gente del vecindario.

Su hijo, Sunardi Hartono, tomó el relevo — en 1934 según una fuente, en 1940 según otra; la ficha escribe las dos —, dio a la fábrica el nombre de Rizona y subió la calidad trayendo capas de La Habana y de Brasil. Cincuenta años después, su propio hijo, Mulyadi Hartono, siguió, y es él quien lleva la casa en tercera generación. Treinta y ocho personas trabajan allí, sobre todo mujeres, de la limpieza de las hojas al encajado, sin herramienta moderna; el tabaco viene de Jember, al otro extremo de la isla. Tres marcas: Kenner Ballero, Kenner King, Extra Fine.

La prensa indonesia la visita como un monumento — un siglo y más, dicen los titulares. Este atlas, que solo recogía una casa indonesia, Taru Martani, añade aquí una segunda de la misma edad, y dos de Jember.',
        '[{"name":"Kenner King","color":"#6B4226","force":"Medium","wrapper":"Java","vitolas":[],"story":"Una de las tres marcas de la fábrica, con tabaco de Jember."},{"name":"Kenner Ballero","color":"#8B5A2B","force":"Mild-Medium","wrapper":"Java","vitolas":[],"story":"El formato fino de la casa."}]',
        'Rizona ist eine Fabrik in Temanggung, in den Bergen Zentraljavas, die seit 1910 Zigarren macht — eine der ältesten Indonesiens, die noch in Betrieb ist. Ihr Gründer, Hoo Tjong An, hatte das Handwerk bei einem philippinischen Zigarrenmacher gelernt, und dieser Atlas vermerkt das Detail, weil es zwei seiner Länder verbindet: Manila rollte damals für ganz Asien, und von dort kam die Art nach Java. Er richtete eine kleine Fabrik ein und stellte die Nachbarschaft ein.

Sein Sohn, Sunardi Hartono, übernahm — 1934 nach einer Quelle, 1940 nach einer anderen; der Eintrag schreibt beide —, gab der Fabrik den Namen Rizona und hob die Qualität, indem er Deckblätter aus Havanna und Brasilien kommen ließ. Fünfzig Jahre später übernahm sein eigener Sohn, Mulyadi Hartono, und er führt das Haus in dritter Generation. Achtunddreißig Menschen arbeiten dort, meist Frauen, vom Reinigen der Blätter bis zum Verpacken, ohne modernes Werkzeug; der Tabak kommt aus Jember am anderen Ende der Insel. Drei Marken: Kenner Ballero, Kenner King, Extra Fine.

Die indonesische Presse besucht sie wie ein Denkmal — ein Jahrhundert und mehr, sagen die Schlagzeilen. Dieser Atlas, der nur ein indonesisches Haus führte, Taru Martani, fügt hier ein zweites gleichen Alters hinzu, und zwei aus Jember.',
        '[{"name":"Kenner King","color":"#6B4226","force":"Medium","wrapper":"Java","vitolas":[],"story":"Eine der drei Marken der Fabrik, auf Jember-Tabak."},{"name":"Kenner Ballero","color":"#8B5A2B","force":"Mild-Medium","wrapper":"Java","vitolas":[],"story":"Das schlanke Format des Hauses."}]',
        'Rizona 是中爪哇山区特曼贡的一家工厂，自1910年起制作雪茄——印尼仍在运营的老厂之一。创始人胡宗安向一位菲律宾雪茄匠学艺，本图集记下这个细节，因为它连接了图集中的两个国家：当时马尼拉为全亚洲卷制雪茄，手艺正是从那里传到爪哇。他建起小厂，雇用邻里。

其子苏纳尔迪·哈托诺接手——一份来源说1934年，另一份说1940年；词条两者都写——给工厂取名 Rizona，并从哈瓦那和巴西进口茄衣以提升品质。五十年后，他自己的儿子穆利亚迪·哈托诺接班，如今以第三代身份执掌。三十八人在此工作，多为女性，从清洗烟叶到装盒，不用现代工具；烟叶来自岛另一端的任抹。三个品牌：Kenner Ballero、Kenner King、Extra Fine。

印尼媒体把它当作古迹造访——标题写着「一个多世纪」。本图集原本只有一家印尼公司 Taru Martani，在此添加同龄的第二家，以及任抹的两家。',
        '[{"name":"Kenner King","color":"#6B4226","force":"Medium","wrapper":"爪哇","vitolas":[],"story":"工厂三个品牌之一，用任抹烟叶。"},{"name":"Kenner Ballero","color":"#8B5A2B","force":"Mild-Medium","wrapper":"爪哇","vitolas":[],"story":"公司的细长尺寸。"}]',
        'ريزونا مصنعٌ في تيمانغونغ، في جبال وسط جاوة، يصنع السيجار منذ 1910 — من أقدم مصانع إندونيسيا التي ما زالت تعمل. تعلّم مؤسّسه، هو تشونغ آن، المهنة على يد صانع سيجار فلبيني، ويسجّل هذا الأطلس التفصيل لأنّه يربط بلدين من بلدانه: كانت مانيلا آنذاك تلفّ لآسيا كلّها، ومن هناك جاءت الطريقة إلى جاوة. أقام مصنعًا صغيرًا ووظّف أهل الجوار.

تولّى ابنه، سوناردي هارتونو — سنة 1934 بحسب مصدر، و1940 بحسب آخر؛ تكتب البطاقة الاثنين — وأعطى المصنع اسم ريزونا ورفع الجودة باستيراد أغلفة من هافانا والبرازيل. وبعد خمسين سنة تولّى ابنه موليادي هارتونو، وهو الذي يدير الدار في الجيل الثالث. يعمل فيه ثمانية وثلاثون شخصًا، معظمهم نساء، من تنظيف الأوراق إلى التعليب، بلا أداة حديثة؛ ويأتي التبغ من جمبر في الطرف الآخر من الجزيرة. ثلاث علامات: Kenner Ballero وKenner King وExtra Fine.

تزوره الصحافة الإندونيسية كأثرٍ — قرنٌ وأكثر، تقول العناوين. وهذا الأطلس الذي لم يكن يحمل سوى دار إندونيسية واحدة، Taru Martani، يضيف هنا ثانيةً من العمر نفسه، واثنتين من جمبر.',
        '[{"name":"Kenner King","color":"#6B4226","force":"Medium","wrapper":"جاوة","vitolas":[],"story":"إحدى علامات المصنع الثلاث، على تبغ جمبر."},{"name":"Kenner Ballero","color":"#8B5A2B","force":"Mild-Medium","wrapper":"جاوة","vitolas":[],"story":"القياس الرفيع للدار."}]')
ON DUPLICATE KEY UPDATE `country_id` = VALUES(`country_id`), `founded` = VALUES(`founded`), `factory` = VALUES(`factory`), `source` = VALUES(`source`), `history` = VALUES(`history`), `gamme` = VALUES(`gamme`), `history_en` = VALUES(`history_en`), `gamme_en` = VALUES(`gamme_en`), `history_es` = VALUES(`history_es`), `gamme_es` = VALUES(`gamme_es`), `history_de` = VALUES(`history_de`), `gamme_de` = VALUES(`gamme_de`), `history_zh` = VALUES(`history_zh`), `gamme_zh` = VALUES(`gamme_zh`), `history_ar` = VALUES(`history_ar`), `gamme_ar` = VALUES(`gamme_ar`);

-- ── BIN Cigar ──

INSERT INTO `brands` (`name`, `country_id`, `founded`, `factory`, `source`, `history`, `gamme`, `history_en`, `gamme_en`, `history_es`, `gamme_es`, `history_de`, `gamme_de`, `history_zh`, `gamme_zh`, `history_ar`, `gamme_ar`)
VALUES ('BIN Cigar',
        'indonesia',
        '2013 — Jember ; Abdul Kahar Muzakir',
        'Fabrique propre — PT Boss Image Nusantara, Jember ; tabac de semence cubaine cultivé sur place',
        'tugujatim.id « Kisah Sukses Cerutu Jember Taklukkan 12 Negara » et jatimtimes.com « Cerutu Jember: Warisan Tembakau yang Terjaga Eksistensinya di Dunia » (3 octobre 2025 : fondée en 2013 à l''initiative d''Abdul Kahar Muzakir, aujourd''hui décédé, cinquante ans de tabac ; il a acclimaté à Jember une variété de semence cubaine ; cigares roulés main ; douze pays d''export, vingt-sept ambassades indonésiennes en relais) ; jatim.times.co.id « BIN Cigar Sasar Amerika Serikat jadi Pasar Baru » (2025 : les États-Unis visés) ; bincigar.com (PT Boss Image Nusantara ; production certifiée ISO 9001:2015)',
        'BIN Cigar — PT Boss Image Nusantara — est née en 2013 à Jember, la ville du tabac de Java oriental, à l''initiative d''Abdul Kahar Muzakir, un homme de cinquante ans de tabac aujourd''hui décédé, qui voulait porter le cigare indonésien à l''international. Son pari fut agricole avant d''être commercial : acclimater à Jember une variété de semence cubaine, la Havana, et la faire pousser dans la terre de Java oriental — la presse locale dit qu''elle y a pris en gardant son caractère.

Jember exportait jusque-là surtout sa feuille brute, le tabac Besuki Na-Oogst que le monde entier achète pour ses capes ; BIN roule la sienne, à la main, et la vend sous son nom. La maison dit exporter vers douze pays et s''appuyer sur vingt-sept ambassades indonésiennes pour se faire connaître ; en 2025 elle visait les États-Unis. La fiche rapporte ces chiffres à la presse indonésienne qui les publie, et à la maison.

C''est la première fiche de Jember dans cet atlas, qui ne portait de l''Indonésie que Taru Martani, à Yogyakarta. Il y en a d''autres — Golden Djawa dans ce même lot, et les fabriques de Villiger et de Burger Söhne, que leurs fiches suisses nomment désormais.',
        '[{"name":"BIN Havana","color":"#7A2E1E","force":"Medium-Full","wrapper":"Jember (Java oriental)","vitolas":[],"story":"Du tabac de semence cubaine acclimaté à Jember, roulé main sur place — le pari du fondateur."}]',
        'BIN Cigar — PT Boss Image Nusantara — was born in 2013 in Jember, the tobacco town of East Java, on the initiative of Abdul Kahar Muzakir, a man of fifty years in tobacco, now deceased, who wanted to take the Indonesian cigar international. His bet was agricultural before it was commercial: to acclimatise in Jember a Cuban-seed variety, the Havana, and grow it in East Javanese soil — the local press says it took, keeping its character.

Until then Jember exported mostly its raw leaf, the Besuki Na-Oogst tobacco the whole world buys for wrappers; BIN rolls its own, by hand, and sells it under its name. The house says it exports to twelve countries and relies on twenty-seven Indonesian embassies to make itself known; in 2025 it was aiming at the United States. The entry attributes these figures to the Indonesian press that publishes them, and to the house.

It is the first Jember entry in this atlas, which carried of Indonesia only Taru Martani, in Yogyakarta. There are others — Golden Djawa in this same lot, and the factories of Villiger and Burger Söhne, which their Swiss entries now name.',
        '[{"name":"BIN Havana","color":"#7A2E1E","force":"Medium-Full","wrapper":"Jember (East Java)","vitolas":[],"story":"Cuban-seed tobacco acclimatised in Jember, hand-rolled on site — the founder''s bet."}]',
        'BIN Cigar — PT Boss Image Nusantara — nació en 2013 en Jember, la ciudad del tabaco de Java Oriental, por iniciativa de Abdul Kahar Muzakir, un hombre de cincuenta años de tabaco, hoy fallecido, que quería llevar el puro indonesio a lo internacional. Su apuesta fue agrícola antes que comercial: aclimatar en Jember una variedad de semilla cubana, la Havana, y hacerla crecer en la tierra de Java Oriental — la prensa local dice que prendió conservando su carácter.

Jember exportaba hasta entonces sobre todo su hoja bruta, el tabaco Besuki Na-Oogst que el mundo entero compra para sus capas; BIN lía la suya, a mano, y la vende con su nombre. La casa dice exportar a doce países y apoyarse en veintisiete embajadas indonesias para darse a conocer; en 2025 apuntaba a Estados Unidos. La ficha atribuye esas cifras a la prensa indonesia que las publica, y a la casa.

Es la primera ficha de Jember en este atlas, que solo recogía de Indonesia a Taru Martani, en Yogyakarta. Hay otras — Golden Djawa en este mismo lote, y las fábricas de Villiger y de Burger Söhne, que sus fichas suizas nombran desde ahora.',
        '[{"name":"BIN Havana","color":"#7A2E1E","force":"Medium-Full","wrapper":"Jember (Java Oriental)","vitolas":[],"story":"Tabaco de semilla cubana aclimatado en Jember, liado a mano allí mismo — la apuesta del fundador."}]',
        'BIN Cigar — PT Boss Image Nusantara — entstand 2013 in Jember, der Tabakstadt Ostjavas, auf Initiative von Abdul Kahar Muzakir, einem Mann mit fünfzig Jahren im Tabak, inzwischen verstorben, der die indonesische Zigarre international machen wollte. Sein Einsatz war landwirtschaftlich, bevor er kommerziell war: in Jember eine Sorte aus kubanischem Saatgut, die Havana, zu akklimatisieren und sie im Boden Ostjavas wachsen zu lassen — die lokale Presse sagt, sie habe angeschlagen und ihren Charakter behalten.

Bis dahin exportierte Jember vor allem sein Rohblatt, den Besuki-Na-Oogst-Tabak, den die ganze Welt für Deckblätter kauft; BIN rollt sein eigenes, von Hand, und verkauft es unter seinem Namen. Das Haus sagt, es exportiere in zwölf Länder und stütze sich auf siebenundzwanzig indonesische Botschaften, um bekannt zu werden; 2025 zielte es auf die Vereinigten Staaten. Der Eintrag schreibt diese Zahlen der indonesischen Presse zu, die sie veröffentlicht, und dem Haus.

Es ist der erste Jember-Eintrag in diesem Atlas, der von Indonesien nur Taru Martani in Yogyakarta führte. Es gibt weitere — Golden Djawa in diesem Los, und die Fabriken von Villiger und Burger Söhne, die ihre Schweizer Einträge nun nennen.',
        '[{"name":"BIN Havana","color":"#7A2E1E","force":"Medium-Full","wrapper":"Jember (Ostjava)","vitolas":[],"story":"Tabak aus kubanischem Saatgut, in Jember akklimatisiert, vor Ort handgerollt — der Einsatz des Gründers."}]',
        'BIN Cigar——PT Boss Image Nusantara——2013年诞生于东爪哇的烟草之城任抹，由已故的阿卜杜勒·卡哈尔·穆扎基尔发起，他从事烟草五十年，想把印尼雪茄推向国际。他的赌注先是农业的，然后才是商业的：在任抹驯化一种古巴种子的品种——哈瓦那——让它在东爪哇的土地上生长，当地媒体说它扎了根并保留了本色。

此前任抹主要出口原叶，即全世界买来做茄衣的 Besuki Na-Oogst 烟叶；BIN 自己手工卷制，以自己的名字销售。公司称出口十二个国家，并依靠二十七个印尼使馆推广；2025年瞄准美国。词条把这些数字归于发布它们的印尼媒体和公司本身。

这是本图集第一个任抹词条，此前印尼只有日惹的 Taru Martani。还有别的——同一批次的 Golden Djawa，以及 Villiger 和 Burger Söhne 的工厂，它们的瑞士词条如今已点名。',
        '[{"name":"BIN Havana","color":"#7A2E1E","force":"Medium-Full","wrapper":"任抹（东爪哇）","vitolas":[],"story":"在任抹驯化的古巴种烟叶，就地手工卷制——创始人的赌注。"}]',
        'وُلدت BIN Cigar — PT Boss Image Nusantara — سنة 2013 في جمبر، مدينة التبغ في جاوة الشرقية، بمبادرة عبد القهار مزكّر، رجلٍ من خمسين سنة في التبغ توفّي منذ ذلك الحين، أراد أن يحمل السيجار الإندونيسي إلى العالم. كان رهانه زراعيًّا قبل أن يكون تجاريًّا: أقلمة صنف من بذور كوبية، الهافانا، في جمبر، وزراعته في تربة جاوة الشرقية — وتقول الصحافة المحلية إنّه نجح محتفظًا بطابعه.

كانت جمبر حتى ذلك الحين تصدّر ورقتها الخام في الغالب، تبغ Besuki Na-Oogst الذي يشتريه العالم كلّه للأغلفة؛ أمّا BIN فتلفّ ورقتها يدويًّا وتبيعها باسمها. تقول الدار إنّها تصدّر إلى اثني عشر بلدًا وتستند إلى سبع وعشرين سفارة إندونيسية لتعريف نفسها؛ وفي 2025 كانت تستهدف الولايات المتحدة. تنسب البطاقة هذه الأرقام إلى الصحافة الإندونيسية التي تنشرها، وإلى الدار.

إنّها بطاقة جمبر الأولى في هذا الأطلس الذي لم يكن يحمل من إندونيسيا سوى Taru Martani في يوغياكارتا. وثمّة غيرها — Golden Djawa في هذه الدفعة نفسها، ومصانع Villiger وBurger Söhne التي تسمّيها الآن بطاقاتها السويسرية.',
        '[{"name":"BIN Havana","color":"#7A2E1E","force":"Medium-Full","wrapper":"جمبر (جاوة الشرقية)","vitolas":[],"story":"تبغ من بذور كوبية أُقلم في جمبر، يُلفّ يدويًّا في الموقع — رهان المؤسّس."}]')
ON DUPLICATE KEY UPDATE `country_id` = VALUES(`country_id`), `founded` = VALUES(`founded`), `factory` = VALUES(`factory`), `source` = VALUES(`source`), `history` = VALUES(`history`), `gamme` = VALUES(`gamme`), `history_en` = VALUES(`history_en`), `gamme_en` = VALUES(`gamme_en`), `history_es` = VALUES(`history_es`), `gamme_es` = VALUES(`gamme_es`), `history_de` = VALUES(`history_de`), `gamme_de` = VALUES(`gamme_de`), `history_zh` = VALUES(`history_zh`), `gamme_zh` = VALUES(`gamme_zh`), `history_ar` = VALUES(`history_ar`), `gamme_ar` = VALUES(`gamme_ar`);

-- ── Golden Djawa ──

INSERT INTO `brands` (`name`, `country_id`, `founded`, `factory`, `source`, `history`, `gamme`, `history_en`, `gamme_en`, `history_es`, `gamme_es`, `history_de`, `gamme_de`, `history_zh`, `gamme_zh`, `history_ar`, `gamme_ar`)
VALUES ('Golden Djawa',
        'indonesia',
        'Décembre 2019 — Jember ; PTPN X',
        'Fabrique propre — Jember ; production par la Koperasi Produsen Kertanegara, coopérative de PTPN X',
        'umkm.kompas.com « Kisah Cerutu Jember yang Mendunia Lewat Ajang G20 » (22 novembre 2022 : Golden Djawa, filiale de PTPN X, l''entreprise de plantations d''État ; roulé main ; production confiée à la Koperasi Produsen Kertanegara ; présentée aux délégations du G20 au Future SMEs Village, 10–19 novembre 2022, sous la bannière d''un produit premium indonésien ; export vers l''Europe) ; detik.com « Mengintip Produksi Cerutu Kualitas Dunia di Jember » (4 mars 2022 : quatre fabriques nationales à Jember — Mangli Djaya Raya, Kopkar Kartanegara, Dwipa Nusantara Tobacco, BIN Cigar — et deux internationales, Burger Söhne et Villiger ; tabac Besuki Na-Oogst) ; ptpn10.co.id (Golden Djawa lancée en 2020, production commencée en décembre 2019)',
        'Golden Djawa est le cigare d''un planteur d''État. PTPN X, l''entreprise publique de plantations qui cultive à Jember le tabac Besuki Na-Oogst — la feuille de Java oriental que le monde achète pour ses capes —, a décidé de rouler une partie de sa récolte plutôt que de tout vendre brut : la production a commencé en décembre 2019 et la marque a été lancée en 2020. Le roulage est confié à une coopérative de producteurs, la Koperasi Produsen Kertanegara, que la presse indonésienne nomme parmi les quatre fabriques de Jember d''envergure nationale.

Le cigare est roulé à la main et destiné à l''export, vers l''Europe d''abord ; en novembre 2022, il a été présenté aux délégations du G20, à Bali, dans un village de petites entreprises, comme un produit premium indonésien capable de tenir sa place face à l''Amérique latine — les mots sont ceux de la maison, la fiche les lui laisse. C''est une manière de faire que l''atlas a rencontrée ailleurs, à Cuba ou en Chine : le tabac est à l''État, le cigare aussi.

Jember roule pour d''autres, et depuis longtemps : Villiger et Burger Söhne y ont leurs fabriques, que leurs fiches disent désormais. Golden Djawa et BIN sont les deux premières maisons de la ville à entrer ici sous leur propre nom.',
        '[{"name":"Golden Djawa","color":"#C9A96E","force":"Medium","wrapper":"Jember (Java oriental)","vitolas":[],"story":"Le Besuki Na-Oogst de PTPN X, roulé main par la coopérative Kertanegara — présenté au G20 de 2022."}]',
        'Golden Djawa is a state planter''s cigar. PTPN X, the public plantation company that grows in Jember the Besuki Na-Oogst tobacco — the East Javanese leaf the world buys for wrappers —, decided to roll part of its crop rather than sell it all raw: production began in December 2019 and the brand was launched in 2020. Rolling is entrusted to a producers'' cooperative, the Koperasi Produsen Kertanegara, which the Indonesian press names among Jember''s four factories of national scale.

The cigar is hand-rolled and meant for export, to Europe first; in November 2022 it was presented to the G20 delegations, in Bali, in a village of small enterprises, as an Indonesian premium product able to hold its own against Latin America — the words are the house''s, and the entry leaves them to it. It is a way of doing things this atlas has met elsewhere, in Cuba or China: the tobacco belongs to the state, so does the cigar.

Jember rolls for others, and has for a long time: Villiger and Burger Söhne have their factories there, which their entries now say. Golden Djawa and BIN are the first two houses of the town to enter here under their own names.',
        '[{"name":"Golden Djawa","color":"#C9A96E","force":"Medium","wrapper":"Jember (East Java)","vitolas":[],"story":"PTPN X''s Besuki Na-Oogst, hand-rolled by the Kertanegara cooperative — shown at the 2022 G20."}]',
        'Golden Djawa es el puro de un plantador de Estado. PTPN X, la empresa pública de plantaciones que cultiva en Jember el tabaco Besuki Na-Oogst — la hoja de Java Oriental que el mundo compra para sus capas —, decidió liar parte de su cosecha en vez de venderla toda en bruto: la producción empezó en diciembre de 2019 y la marca se lanzó en 2020. El liado se confía a una cooperativa de productores, la Koperasi Produsen Kertanegara, que la prensa indonesia nombra entre las cuatro fábricas de Jember de alcance nacional.

El puro se lía a mano y se destina a la exportación, a Europa primero; en noviembre de 2022 se presentó a las delegaciones del G20, en Bali, en un pueblo de pequeñas empresas, como producto premium indonesio capaz de sostenerse frente a América Latina — las palabras son de la casa, y la ficha se las deja. Es una manera de hacer que este atlas ha encontrado en otras partes, en Cuba o en China: el tabaco es del Estado, el puro también.

Jember lía para otros, y desde hace mucho: Villiger y Burger Söhne tienen allí sus fábricas, que sus fichas dicen desde ahora. Golden Djawa y BIN son las dos primeras casas de la ciudad en entrar aquí con su propio nombre.',
        '[{"name":"Golden Djawa","color":"#C9A96E","force":"Medium","wrapper":"Jember (Java Oriental)","vitolas":[],"story":"El Besuki Na-Oogst de PTPN X, liado a mano por la cooperativa Kertanegara — presentado en el G20 de 2022."}]',
        'Golden Djawa ist die Zigarre eines staatlichen Pflanzers. PTPN X, das öffentliche Plantagenunternehmen, das in Jember den Tabak Besuki Na-Oogst anbaut — das ostjavanische Blatt, das die Welt für Deckblätter kauft —, beschloss, einen Teil seiner Ernte zu rollen, statt alles roh zu verkaufen: Die Produktion begann im Dezember 2019, und die Marke wurde 2020 lanciert. Das Rollen ist einer Erzeugergenossenschaft anvertraut, der Koperasi Produsen Kertanegara, die die indonesische Presse zu den vier Fabriken Jembers von nationaler Bedeutung zählt.

Die Zigarre wird von Hand gerollt und ist für den Export bestimmt, zuerst nach Europa; im November 2022 wurde sie den G20-Delegationen auf Bali in einem Dorf kleiner Unternehmen als indonesisches Premiumprodukt vorgestellt, das sich gegen Lateinamerika behaupten könne — die Worte sind die des Hauses, und der Eintrag überlässt sie ihm. Es ist eine Art zu arbeiten, die dieser Atlas anderswo traf, auf Kuba oder in China: Der Tabak gehört dem Staat, die Zigarre auch.

Jember rollt für andere, und das seit Langem: Villiger und Burger Söhne haben dort ihre Fabriken, die ihre Einträge nun nennen. Golden Djawa und BIN sind die ersten beiden Häuser der Stadt, die hier unter eigenem Namen eintreten.',
        '[{"name":"Golden Djawa","color":"#C9A96E","force":"Medium","wrapper":"Jember (Ostjava)","vitolas":[],"story":"PTPN X'' Besuki Na-Oogst, von der Genossenschaft Kertanegara handgerollt — auf dem G20 2022 gezeigt."}]',
        'Golden Djawa 是一家国营种植公司的雪茄。国有种植企业 PTPN X 在任抹种植 Besuki Na-Oogst 烟叶——全世界买来做茄衣的东爪哇烟叶——决定把一部分收成卷成雪茄而不全部原叶出售：2019年12月投产，2020年推出品牌。卷制交给一家生产者合作社 Koperasi Produsen Kertanegara，印尼媒体把它列为任抹四家全国级工厂之一。

雪茄手工卷制，面向出口，首先是欧洲；2022年11月在巴厘岛的小企业村向 G20 代表团展示，自称能与拉丁美洲比肩的印尼优质产品——这是公司自己的话，词条留给它。这种做法本图集在别处见过，在古巴或中国：烟草归国家，雪茄也归国家。

任抹早就为他人卷制：Villiger 和 Burger Söhne 在此设有工厂，它们的词条如今已写明。Golden Djawa 和 BIN 是这座城市头两家以自己名字进入本图集的公司。',
        '[{"name":"Golden Djawa","color":"#C9A96E","force":"Medium","wrapper":"任抹（东爪哇）","vitolas":[],"story":"PTPN X 的 Besuki Na-Oogst，由 Kertanegara 合作社手工卷制——2022年 G20 上展示。"}]',
        'غولدن جاوا سيجارُ مزارعٍ حكومي. قرّرت PTPN X، شركة المزارع العامّة التي تزرع في جمبر تبغ Besuki Na-Oogst — ورقة جاوة الشرقية التي يشتريها العالم للأغلفة — أن تلفّ جزءًا من محصولها بدلًا من بيعه كلّه خامًا: بدأ الإنتاج في كانون الأوّل/ديسمبر 2019 وأُطلقت العلامة سنة 2020. وعُهد باللفّ إلى تعاونية منتجين، Koperasi Produsen Kertanegara، تعدّها الصحافة الإندونيسية بين مصانع جمبر الأربعة ذات الحجم الوطني.

يُلفّ السيجار يدويًّا ويُوجَّه للتصدير، إلى أوروبا أوّلًا؛ وفي تشرين الثاني/نوفمبر 2022 قُدّم لوفود مجموعة العشرين في بالي، في قرية للمشاريع الصغيرة، منتجًا إندونيسيًّا فاخرًا قادرًا على الصمود أمام أمريكا اللاتينية — الكلمات كلمات الدار، والبطاقة تتركها لها. إنّها طريقة عمل التقاها هذا الأطلس في أماكن أخرى، في كوبا أو الصين: التبغ للدولة، والسيجار أيضًا.

تلفّ جمبر للآخرين، ومنذ زمن طويل: لـVilliger وBurger Söhne مصانع فيها تقولها بطاقاتهما الآن. وغولدن جاوا وBIN أوّل دارين من المدينة تدخلان هنا باسميهما.',
        '[{"name":"Golden Djawa","color":"#C9A96E","force":"Medium","wrapper":"جمبر (جاوة الشرقية)","vitolas":[],"story":"Besuki Na-Oogst من PTPN X، تلفّه تعاونية Kertanegara يدويًّا — عُرض في مجموعة العشرين 2022."}]')
ON DUPLICATE KEY UPDATE `country_id` = VALUES(`country_id`), `founded` = VALUES(`founded`), `factory` = VALUES(`factory`), `source` = VALUES(`source`), `history` = VALUES(`history`), `gamme` = VALUES(`gamme`), `history_en` = VALUES(`history_en`), `gamme_en` = VALUES(`gamme_en`), `history_es` = VALUES(`history_es`), `gamme_es` = VALUES(`gamme_es`), `history_de` = VALUES(`history_de`), `gamme_de` = VALUES(`gamme_de`), `history_zh` = VALUES(`history_zh`), `gamme_zh` = VALUES(`gamme_zh`), `history_ar` = VALUES(`history_ar`), `gamme_ar` = VALUES(`gamme_ar`);

-- ── Wangguan ──

INSERT INTO `brands` (`name`, `country_id`, `founded`, `factory`, `source`, `history`, `gamme`, `history_en`, `gamme_en`, `history_es`, `gamme_es`, `history_de`, `gamme_de`, `history_zh`, `gamme_zh`, `history_ar`, `gamme_ar`)
VALUES ('Wangguan',
        'china',
        'Après 1978 — Mengcheng (Anhui) ; racines en 1896',
        'Fabrique de cigares de Mengcheng — China Tobacco Anhui, rattachée à la fabrique de Bengbu',
        'zhuanlan.zhihu.com « 雪茄篇101：中式雪茄 » (les quatre bases du cigare chinois — Shifang, Yichang, Mengcheng, Jinan — et les quatre marques des monopoles provinciaux : Great Wall, Huanghelou, Wangguan, Taishan ; Wangguan, à Mengcheng dans le nord de l''Anhui, « l''un des représentants du cigare chinois roulé main » ; l''origine attribuée à Li Hongzhang en 1896, revenu d''Europe et faisant faire des cigares par les ateliers de roulage main de Mengcheng ; fabrique de cigares approuvée par le Conseil d''État après 1978, rattachée à la fabrique de cigarettes de Bengbu ; en 1997, partenariat avec une société dominicaine pour le cigare feuille entière Wangguan) ; baike.baidu.com « 王冠雪茄烟 »',
        'Wangguan — 王冠, la couronne — est le cigare du monopole de l''Anhui, roulé à Mengcheng, une ville du nord de la province qui se donne pour patrie de Zhuangzi. La Chine compte quatre bases du cigare, une par monopole provincial : Shifang au Sichuan pour Great Wall, dont l''atlas porte la fiche ; Yichang au Hubei ; Jinan au Shandong ; et Mengcheng, que la presse chinoise du cigare donne pour l''un des représentants du cigare chinois roulé à la main.

La légende de la maison remonte à 1896 : Li Hongzhang, le grand ministre de la fin des Qing, serait revenu d''Europe avec des cigares offerts par des cours royales, aurait découvert que Mengcheng comptait beaucoup d''ateliers de roulage à la main, et leur en aurait commandé — le « cigare à la manière de l''Anhui » aurait fait fureur dans les concessions de Shanghai. L''atlas rapporte le récit à ceux qui le font. Ce qui est daté est plus récent : une fabrique de cigares approuvée par le Conseil d''État après 1978, rattachée à la fabrique de cigarettes de Bengbu, et en 1997 un partenariat avec une société dominicaine pour produire un Wangguan à feuille entière, qui a remis à niveau la manière chinoise.

Après Great Wall, c''est la seconde fiche chinoise de cet atlas, et la seconde qui n''a de sources qu''en chinois. La fiche le dit, et ne pose ni champ ni variété.',
        '[{"name":"Wangguan","color":"#B22222","force":"Medium","wrapper":"Chinoise","vitolas":[],"story":"Le cigare feuille entière de Mengcheng, né du partenariat dominicain de 1997."}]',
        'Wangguan — 王冠, the crown — is the cigar of the Anhui monopoly, rolled in Mengcheng, a town in the north of the province that claims to be Zhuangzi''s home. China has four cigar bases, one per provincial monopoly: Shifang in Sichuan for Great Wall, whose entry this atlas carries; Yichang in Hubei; Jinan in Shandong; and Mengcheng, which the Chinese cigar press gives as one of the representatives of the hand-rolled Chinese cigar.

The house''s legend goes back to 1896: Li Hongzhang, the great minister of the late Qing, is said to have returned from Europe with cigars given by royal courts, discovered that Mengcheng had many hand-rolling workshops, and commissioned some — the "Anhui-style cigar" is said to have been all the rage in the Shanghai concessions. This atlas attributes the tale to those who tell it. What is dated is more recent: a cigar factory approved by the State Council after 1978, attached to the Bengbu cigarette factory, and in 1997 a partnership with a Dominican company to produce a whole-leaf Wangguan, which upgraded the Chinese manner.

After Great Wall, it is the second Chinese entry in this atlas, and the second with sources only in Chinese. The entry says so, and sets neither field nor variety.',
        '[{"name":"Wangguan","color":"#B22222","force":"Medium","wrapper":"Chinese","vitolas":[],"story":"Mengcheng''s whole-leaf cigar, born of the 1997 Dominican partnership."}]',
        'Wangguan — 王冠, la corona — es el puro del monopolio de Anhui, liado en Mengcheng, una ciudad del norte de la provincia que se da por patria de Zhuangzi. China cuenta cuatro bases del puro, una por monopolio provincial: Shifang en Sichuan para Great Wall, cuya ficha lleva este atlas; Yichang en Hubei; Jinan en Shandong; y Mengcheng, que la prensa china del puro da como uno de los representantes del puro chino liado a mano.

La leyenda de la casa se remonta a 1896: Li Hongzhang, el gran ministro del final de los Qing, habría vuelto de Europa con puros ofrecidos por cortes reales, habría descubierto que Mengcheng contaba muchos talleres de liado a mano, y les habría encargado — el «puro a la manera de Anhui» habría hecho furor en las concesiones de Shanghái. Este atlas atribuye el relato a quienes lo cuentan. Lo fechado es más reciente: una fábrica de puros aprobada por el Consejo de Estado después de 1978, adscrita a la fábrica de cigarrillos de Bengbu, y en 1997 una asociación con una sociedad dominicana para producir un Wangguan de hoja entera, que puso al día la manera china.

Tras Great Wall, es la segunda ficha china de este atlas, y la segunda con fuentes solo en chino. La ficha lo dice, y no fija ni campo ni variedad.',
        '[{"name":"Wangguan","color":"#B22222","force":"Medium","wrapper":"China","vitolas":[],"story":"El puro de hoja entera de Mengcheng, nacido de la asociación dominicana de 1997."}]',
        'Wangguan — 王冠, die Krone — ist die Zigarre des Monopols von Anhui, gerollt in Mengcheng, einer Stadt im Norden der Provinz, die sich als Heimat Zhuangzis ausgibt. China zählt vier Zigarrenbasen, eine je Provinzmonopol: Shifang in Sichuan für Great Wall, deren Eintrag dieser Atlas führt; Yichang in Hubei; Jinan in Shandong; und Mengcheng, das die chinesische Zigarrenpresse als einen der Vertreter der handgerollten chinesischen Zigarre nennt.

Die Legende des Hauses reicht bis 1896 zurück: Li Hongzhang, der große Minister der späten Qing, soll aus Europa mit von Königshöfen geschenkten Zigarren zurückgekehrt sein, entdeckt haben, dass Mengcheng viele Handrollwerkstätten zählte, und dort welche bestellt haben — die „Zigarre nach Anhui-Art" soll in den Konzessionen Shanghais Furore gemacht haben. Dieser Atlas schreibt die Erzählung denen zu, die sie erzählen. Datiert ist Jüngeres: eine nach 1978 vom Staatsrat genehmigte Zigarrenfabrik, der Zigarettenfabrik Bengbu angegliedert, und 1997 eine Partnerschaft mit einem dominikanischen Unternehmen zur Produktion einer Ganzblatt-Wangguan, die die chinesische Art auf den neuen Stand brachte.

Nach Great Wall ist es der zweite chinesische Eintrag dieses Atlas und der zweite mit nur chinesischen Quellen. Der Eintrag sagt es und setzt weder Feld noch Sorte.',
        '[{"name":"Wangguan","color":"#B22222","force":"Medium","wrapper":"Chinesisch","vitolas":[],"story":"Die Ganzblatt-Zigarre aus Mengcheng, entstanden aus der dominikanischen Partnerschaft von 1997."}]',
        '王冠是安徽中烟的雪茄，在皖北的蒙城卷制，那座自称庄子故里的城市。中国有四大雪茄产地，每省一家专卖：四川什邡的长城——本图集载有其词条；湖北宜昌；山东济南；以及蒙城，中国雪茄媒体称之为中式手卷雪茄的代表之一。

公司的传说追溯到1896年：晚清重臣李鸿章据说从欧洲带回各国王室所赠雪茄，得知蒙城手工卷烟作坊甚多，遂责成定制——「徽派雪茄」据说风靡上海租界。本图集把这段叙述归于讲述者。有确切年份的更近：1978年后经国务院批准建立的雪茄烟厂，隶属蚌埠卷烟厂；1997年与一家多米尼加公司合作生产全叶卷王冠，令中式工艺全面升级。

继长城之后，这是本图集第二个中国词条，也是第二个只有中文来源的词条。词条如实说明，不设田地与品种。',
        '[{"name":"Wangguan","color":"#B22222","force":"Medium","wrapper":"中国","vitolas":[],"story":"蒙城的全叶卷雪茄，诞生于1997年的多米尼加合作。"}]',
        'وانغوان — 王冠، التاج — سيجارُ احتكار آنهوي، يُلفّ في مينغتشنغ، مدينةٍ في شمال المقاطعة تقدّم نفسها موطنَ تشوانغزي. للصين أربع قواعد للسيجار، واحدة لكلّ احتكار إقليمي: شيفانغ في سيتشوان لـGreat Wall التي يحمل هذا الأطلس بطاقتها؛ ويتشانغ في هوبي؛ وجينان في شاندونغ؛ ومينغتشنغ التي تقدّمها صحافة السيجار الصينية واحدًا من ممثّلي السيجار الصيني المُلفوف يدويًّا.

تعود أسطورة الدار إلى 1896: يُقال إنّ لي هونغتشانغ، الوزير الكبير في أواخر أسرة تشينغ، عاد من أوروبا بسيجارات أهدتها بلاطات ملكية، واكتشف أنّ في مينغتشنغ ورشات لفّ يدوي كثيرة، فطلب منها بعضًا — ويُقال إنّ «سيجار طراز آنهوي» اجتاح امتيازات شنغهاي. ينسب هذا الأطلس الرواية إلى رواتها. أمّا المؤرَّخ فأحدث: مصنع سيجار أقرّه مجلس الدولة بعد 1978، ملحق بمصنع سجائر بينغبو، وفي 1997 شراكة مع شركة دومينيكية لإنتاج وانغوان بورقة كاملة، ما رفع مستوى الطريقة الصينية.

بعد Great Wall، إنّها البطاقة الصينية الثانية في هذا الأطلس، والثانية التي لا مصادر لها إلا بالصينية. تقول البطاقة ذلك، ولا تضع حقلًا ولا صنفًا.',
        '[{"name":"Wangguan","color":"#B22222","force":"Medium","wrapper":"صيني","vitolas":[],"story":"سيجار مينغتشنغ بالورقة الكاملة، وُلد من الشراكة الدومينيكية لسنة 1997."}]')
ON DUPLICATE KEY UPDATE `country_id` = VALUES(`country_id`), `founded` = VALUES(`founded`), `factory` = VALUES(`factory`), `source` = VALUES(`source`), `history` = VALUES(`history`), `gamme` = VALUES(`gamme`), `history_en` = VALUES(`history_en`), `gamme_en` = VALUES(`gamme_en`), `history_es` = VALUES(`history_es`), `gamme_es` = VALUES(`gamme_es`), `history_de` = VALUES(`history_de`), `gamme_de` = VALUES(`gamme_de`), `history_zh` = VALUES(`history_zh`), `gamme_zh` = VALUES(`gamme_zh`), `history_ar` = VALUES(`history_ar`), `gamme_ar` = VALUES(`gamme_ar`);

-- ── Villiger Sohne et Burger Sohne : Jember, six langues ──
UPDATE `brands` SET `history` = CONCAT(`history`, '\n\n', 'Une fabrique manque à cette liste, et la presse indonésienne la nomme : Villiger a une usine à Jember, en Java oriental — PT Villiger Tobacco Indonesia, à Ajung —, dans la ville du tabac Besuki Na-Oogst dont l''atlas porte désormais deux maisons, BIN et Golden Djawa. Jember roule pour la Suisse depuis longtemps sans que personne ne l''écrive en anglais.') WHERE `name` = 'Villiger Söhne' AND `history` NOT LIKE '%Jember%';
UPDATE `brands` SET `history_en` = CONCAT(`history_en`, '\n\n', 'One factory is missing from this list, and the Indonesian press names it: Villiger has a plant in Jember, East Java — PT Villiger Tobacco Indonesia, at Ajung —, in the town of Besuki Na-Oogst tobacco of which this atlas now carries two houses, BIN and Golden Djawa. Jember has rolled for Switzerland for a long time without anyone writing it in English.') WHERE `name` = 'Villiger Söhne' AND `history_en` NOT LIKE '%Jember%';
UPDATE `brands` SET `history_es` = CONCAT(`history_es`, '\n\n', 'Una fábrica falta en esta lista, y la prensa indonesia la nombra: Villiger tiene una planta en Jember, Java Oriental — PT Villiger Tobacco Indonesia, en Ajung —, en la ciudad del tabaco Besuki Na-Oogst de la que este atlas recoge ahora dos casas, BIN y Golden Djawa. Jember lía para Suiza desde hace mucho sin que nadie lo escriba en inglés.') WHERE `name` = 'Villiger Söhne' AND `history_es` NOT LIKE '%Jember%';
UPDATE `brands` SET `history_de` = CONCAT(`history_de`, '\n\n', 'Eine Fabrik fehlt in dieser Liste, und die indonesische Presse nennt sie: Villiger hat ein Werk in Jember, Ostjava — PT Villiger Tobacco Indonesia, in Ajung —, in der Stadt des Besuki-Na-Oogst-Tabaks, von der dieser Atlas nun zwei Häuser führt, BIN und Golden Djawa. Jember rollt seit Langem für die Schweiz, ohne dass es jemand auf Englisch schriebe.') WHERE `name` = 'Villiger Söhne' AND `history_de` NOT LIKE '%Jember%';
UPDATE `brands` SET `history_zh` = CONCAT(`history_zh`, '\n\n', '这份名单缺了一家工厂，印尼媒体点了它的名：Villiger 在东爪哇任抹有一座工厂——PT Villiger Tobacco Indonesia，在阿戎——就在 Besuki Na-Oogst 烟叶之城，本图集如今载有该城两家公司：BIN 和 Golden Djawa。任抹为瑞士卷制已久，只是无人用英语写下。') WHERE `name` = 'Villiger Söhne' AND `history_zh` NOT LIKE '%Jember%';
UPDATE `brands` SET `history_ar` = CONCAT(`history_ar`, '\n\n', 'ينقص هذه القائمة مصنعٌ تسمّيه الصحافة الإندونيسية: لـVilliger معملٌ في جمبر بجاوة الشرقية — PT Villiger Tobacco Indonesia في أجونغ — في مدينة تبغ Besuki Na-Oogst التي يحمل هذا الأطلس الآن دارين منها، BIN وGolden Djawa. تلفّ جمبر لسويسرا منذ زمن طويل من دون أن يكتب ذلك أحد بالإنجليزية.') WHERE `name` = 'Villiger Söhne' AND `history_ar` NOT LIKE '%Jember%';
UPDATE `brands` SET `history` = CONCAT(`history`, '\n\n', 'Le groupe a aussi une fabrique à Jember, en Java oriental, que la presse indonésienne compte parmi les deux fabriques de cigares d''envergure internationale de la ville, avec celle de Villiger. La feuille Besuki Na-Oogst, que le monde achète pour ses capes, y est roulée sur place pour la Suisse — l''atlas le dit ici, et raconte Jember aux fiches BIN et Golden Djawa.') WHERE `name` = 'Burger Söhne' AND `history` NOT LIKE '%Jember%';
UPDATE `brands` SET `history_en` = CONCAT(`history_en`, '\n\n', 'The group also has a factory in Jember, East Java, which the Indonesian press counts among the town''s two cigar factories of international scale, with Villiger''s. The Besuki Na-Oogst leaf, which the world buys for wrappers, is rolled there on the spot for Switzerland — this atlas says so here, and tells Jember at the BIN and Golden Djawa entries.') WHERE `name` = 'Burger Söhne' AND `history_en` NOT LIKE '%Jember%';
UPDATE `brands` SET `history_es` = CONCAT(`history_es`, '\n\n', 'El grupo tiene también una fábrica en Jember, Java Oriental, que la prensa indonesia cuenta entre las dos fábricas de puros de alcance internacional de la ciudad, con la de Villiger. La hoja Besuki Na-Oogst, que el mundo compra para sus capas, se lía allí mismo para Suiza — este atlas lo dice aquí, y cuenta Jember en las fichas BIN y Golden Djawa.') WHERE `name` = 'Burger Söhne' AND `history_es` NOT LIKE '%Jember%';
UPDATE `brands` SET `history_de` = CONCAT(`history_de`, '\n\n', 'Der Konzern hat auch eine Fabrik in Jember, Ostjava, die die indonesische Presse zu den zwei Zigarrenfabriken internationaler Größe der Stadt zählt, mit der von Villiger. Das Besuki-Na-Oogst-Blatt, das die Welt für Deckblätter kauft, wird dort an Ort und Stelle für die Schweiz gerollt — dieser Atlas sagt es hier und erzählt Jember in den Einträgen BIN und Golden Djawa.') WHERE `name` = 'Burger Söhne' AND `history_de` NOT LIKE '%Jember%';
UPDATE `brands` SET `history_zh` = CONCAT(`history_zh`, '\n\n', '集团在东爪哇任抹也有一座工厂，印尼媒体把它与 Villiger 的工厂并列为该城两家国际级雪茄厂。全世界买来做茄衣的 Besuki Na-Oogst 烟叶就在当地为瑞士卷制——本图集在此说明，并在 BIN 和 Golden Djawa 词条讲述任抹。') WHERE `name` = 'Burger Söhne' AND `history_zh` NOT LIKE '%Jember%';
UPDATE `brands` SET `history_ar` = CONCAT(`history_ar`, '\n\n', 'للمجموعة أيضًا مصنعٌ في جمبر بجاوة الشرقية، تعدّه الصحافة الإندونيسية بين مصنعَي السيجار ذوَي الحجم الدولي في المدينة، مع مصنع Villiger. تُلفّ ورقة Besuki Na-Oogst، التي يشتريها العالم للأغلفة، هناك في الموقع لسويسرا — يقول هذا الأطلس ذلك هنا، ويروي جمبر في بطاقتَي BIN وGolden Djawa.') WHERE `name` = 'Burger Söhne' AND `history_ar` NOT LIKE '%Jember%';

-- ── INDONESIA : `brands` reecrit en litteral complet (4 entrees) ──
UPDATE `producer_countries` SET `brands` = '[{"desc":"Cultivé, roulé et signé à Java","name":"Taru Martani","iconic":true},{"name":"Rizona Baru","desc":"Temanggung, 1910 — trois générations, une manière apprise d''un Philippin","iconic":false},{"name":"BIN Cigar","desc":"Jember, 2013 — de la semence cubaine acclimatée à Java oriental","iconic":false},{"name":"Golden Djawa","desc":"Jember, 2019 — le cigare du planteur d''État PTPN X","iconic":false}]' WHERE `id` = 'indonesia';

-- ── CHINA : `brands` reecrit en litteral complet (2 entrees) ──
UPDATE `producer_countries` SET `brands` = '[{"name":"Great Wall Cigars","desc":"Shifang, Sichuan, 1918 — le 132, roulé main, et 1,5 million de cigares main par an","iconic":true},{"name":"Wangguan","desc":"Mengcheng (Anhui) — la couronne, roulée main dans la seconde base du cigare chinois","iconic":false}]' WHERE `id` = 'china';

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'brands', b.`name`, c.champ, l.lang,
       SHA1(CASE c.champ WHEN 'history' THEN b.`history` ELSE b.`gamme` END), 'machine', NOW()
  FROM `brands` b
  JOIN (SELECT 'history' champ UNION ALL SELECT 'gamme') c
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de' UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE b.`name` IN ('Rizona Baru','BIN Cigar','Golden Djawa','Wangguan','Villiger Söhne','Burger Söhne')
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 222';
INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 222','systeme','lot_11_java_et_la_chine','marque',0,
   'Rizona Baru (Temanggung, 1910), BIN Cigar et Golden Djawa (Jember), Wangguan (Mengcheng, Anhui). Sources indonesiennes et chinoises, dites dans chaque fiche. Legende de Li Hongzhang attribuee ; 1934 ou 1940 ecrits pour Rizona'),
  (NULL,'migration 222','systeme','jember_dans_les_fiches_suisses','marque',0,
   'Villiger Sohne et Burger Sohne ont des fabriques a Jember, comptees par la presse indonesienne parmi les deux fabriques internationales de la ville ; leurs fiches ne le disaient pas. Paragraphe ajoute, six langues'),
  (NULL,'migration 222','systeme','non_ecrites','marque',0,
   'Taishan (Shandong) : cigarettes surtout, roulage main non etabli. Mangli Djaya Raya, Dwipa Nusantara Tobacco : nommees par la presse, sans date ni source propre');

SELECT
  (SELECT COUNT(*) FROM `brands` WHERE `name` IN ('Rizona Baru','BIN Cigar','Golden Djawa','Wangguan')) = 4 AS quatre_fiches,
  (SELECT `history` LIKE '%Jember%' AND `history_ar` LIKE '%جمبر%' FROM `brands` WHERE `name` = 'Villiger Söhne') AS villiger_jember,
  (SELECT `history_zh` LIKE '%Jember%' OR `history_zh` LIKE '%任抹%' FROM `brands` WHERE `name` = 'Burger Söhne') AS burger_jember,
  (SELECT `brands` LIKE '%Rizona%' AND `brands` LIKE '%Golden Djawa%' FROM `producer_countries` WHERE `id` = 'indonesia') AS indonesie_annonce,
  (SELECT `brands` LIKE '%Wangguan%' FROM `producer_countries` WHERE `id` = 'china') AS chine_annonce,
  (SELECT SUM(CHAR_LENGTH(`detail`) >= 255) = 0 FROM `moderation_log` WHERE `acteur_nom` = 'migration 222') AS journal_non_tronque;
SELECT COUNT(*) AS marques, SUM(TRIM(COALESCE(`source`,'')) = '') AS sans_source FROM `brands`;
