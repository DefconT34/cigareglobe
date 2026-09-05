-- ════════════════════════════════════════════════════════
-- 162 — Les dix-huit descriptions qui en disaient trop
-- ────────────────────────────────────────────────────────
-- CE QUE RENDRE LA SOURCE VISIBLE A MONTRÉ. Tant que `lounges.source`
-- n'atteignait aucun lecteur, ces dix-huit fiches paraissaient comme les
-- 389 autres. Depuis qu'elles portent « ⚠ Information non recoupée »,
-- leur propre description contredit l'avertissement placé sous elle :
--
--   #2537 Radisson Blu Dakar
--     « Habanos premium pour la communauté d'affaires internationale
--       de Dakar et le corps diplomatique. »
--   #2538 King Fahd Palace
--     « Fréquentée par les chefs d'État lors des sommets de la CEDEAO. »
--   #2549 Hôtel Noom Conakry
--     « l'hôtel de luxe le plus moderne de Guinée […] atmosphère
--       exclusive pour les cadres du secteur minier. »
--
-- Ces phrases décrivent un assortiment, une clientèle, une ambiance —
-- c'est-à-dire exactement ce que la migration 155 a déclaré NON RECOUPÉ.
-- Elles viennent toutes de l'import du 22 mars, du même geste que les
-- 98 fiches que le chantier des quatre blocs a retirées.
--
-- ── CE QU'ON GARDE, ET POURQUOI ──────────────────────────
-- La migration 155 a établi une chose et une seule : L'HÔTEL EXISTE.
-- C'est donc tout ce que la description conserve — le nom de
-- l'établissement, sa nature, son quartier. Disparaissent :
--   · l'offre de cigares  (« Habanos premium », « sélection premium »)
--   · la clientèle        (« corps diplomatique », « chefs d'État »)
--   · les superlatifs     (« le plus ancien hôtel de luxe de Dakar »)
--   · les dates non sourcées (« depuis 1967 », « depuis 1984 »)
--
-- La phrase finale est LA MÊME pour quinze fiches, et c'est voulu :
-- elles partagent un état, pas une histoire. Elle n'est pas la redite du
-- bandeau de réserve — le bandeau est une étiquette, celle-ci est la
-- phrase que le lecteur lit.
--
-- ── TROIS CAS QUI NE SONT PAS DES HÔTELS ─────────────────
-- #745 Viña del Mar   — « établissement non recoupé » : ce n'est pas le
--                        salon qui manque, c'est le commerce lui-même.
-- #250 Barcelone      — « liste officielle non recoupée » : c'est
--                        l'appartenance au réseau franchisé qui manque.
-- #413 Tampa          — ET CELUI-CI PORTAIT UNE IMPOSSIBILITÉ. La fiche
--                        annonçait « La Casa del Habano de Tampa ». Le
--                        réseau La Casa del Habano vend des cigares
--                        cubains ; il n'a aucune adresse aux États-Unis,
--                        où ces produits ne sont pas vendus. Ce n'est
--                        pas une affirmation invérifiable, c'est une
--                        affirmation fausse — la même faute que la
--                        migration 157 a retirée du #411 Miami.
--
-- ── ET UN CHAMP QUI CONTREDISAIT LA PAGE ─────────────────
-- #250 portait `type` = « La Casa del Habano Officielle », rendu en
-- toutes lettres au-dessus de la description. Laisser ce champ pendant
-- que la description dit que la franchise n'est pas recoupée ferait une
-- page qui se contredit elle-même, à deux lignes d'intervalle. Il passe
-- à « Cave & Lounge », le terme le plus neutre du vocabulaire de
-- l'atlas. La source, elle, ne bouge pas : la réserve reste.
--
-- Aucune fiche n'est retirée. Le motif de la 155 tient toujours : ne pas
-- faire disparaître une région parce qu'elle est moins indexée.
--
-- Après cette migration :
--   php tools/contenu_dump.php
--   php tools/i18n_dump.php > sql/traductions.sql
-- ════════════════════════════════════════════════════════

-- ── Bénin ────────────────────────────────────────────────
UPDATE `lounges` SET
  `description`    = 'Hôtel du Lac, boulevard de la Marina, en bord de lagune à Cotonou. Un espace cigares y est annoncé ; aucune source publique ne le décrit.',
  `description_en` = 'Hôtel du Lac, Boulevard de la Marina, on the lagoon front in Cotonou. A cigar space is listed there; no public source describes it.',
  `description_es` = 'Hôtel du Lac, boulevard de la Marina, a orillas de la laguna en Cotonú. Se indica allí un espacio para puros; ninguna fuente pública lo describe.',
  `description_de` = 'Hôtel du Lac, Boulevard de la Marina, am Lagunenufer von Cotonou. Ein Zigarrenbereich ist dort verzeichnet; keine öffentliche Quelle beschreibt ihn.',
  `description_zh` = '杜拉克酒店（Hôtel du Lac），位于科托努滨海大道，临潟湖。该处标注设有雪茄区，但没有公开来源对其作出描述。',
  `description_ar` = 'فندق دو لاك في جادة المارينا على ضفة البحيرة الشاطئية بمدينة كوتونو. يُشار إلى وجود ركن للسيجار في المكان، لكن لا يصفه أي مصدر عام.',
  `updated_at` = NOW()
 WHERE `id` = 2546 AND `country_id` = 'benin';

UPDATE `lounges` SET
  `description`    = 'Novotel Cotonou Orisha, hôtel d''affaires du quartier de Haie Vive, à Cotonou. Un espace cigares y est annoncé ; aucune source publique ne le décrit.',
  `description_en` = 'Novotel Cotonou Orisha, a business hotel in the Haie Vive district of Cotonou. A cigar space is listed there; no public source describes it.',
  `description_es` = 'Novotel Cotonou Orisha, hotel de negocios del barrio de Haie Vive, en Cotonú. Se indica allí un espacio para puros; ninguna fuente pública lo describe.',
  `description_de` = 'Novotel Cotonou Orisha, ein Businesshotel im Viertel Haie Vive von Cotonou. Ein Zigarrenbereich ist dort verzeichnet; keine öffentliche Quelle beschreibt ihn.',
  `description_zh` = '科托努诺富特奥里沙酒店，位于科托努海维夫区的商务酒店。该处标注设有雪茄区，但没有公开来源对其作出描述。',
  `description_ar` = 'فندق نوفوتيل كوتونو أوريشا، فندق أعمال في حي هاي فيف بمدينة كوتونو. يُشار إلى وجود ركن للسيجار في المكان، لكن لا يصفه أي مصدر عام.',
  `updated_at` = NOW()
 WHERE `id` = 2547 AND `country_id` = 'benin';

-- ── Burkina Faso ─────────────────────────────────────────
UPDATE `lounges` SET
  `description`    = 'Hôtel Laïco, avenue du Président Maurice Yaméogo, à Ouagadougou. Un espace cigares y est annoncé ; aucune source publique ne le décrit.',
  `description_en` = 'Hôtel Laïco, Avenue du Président Maurice Yaméogo, Ouagadougou. A cigar space is listed there; no public source describes it.',
  `description_es` = 'Hôtel Laïco, avenida del Presidente Maurice Yaméogo, en Uagadugú. Se indica allí un espacio para puros; ninguna fuente pública lo describe.',
  `description_de` = 'Hôtel Laïco, Avenue du Président Maurice Yaméogo, Ouagadougou. Ein Zigarrenbereich ist dort verzeichnet; keine öffentliche Quelle beschreibt ihn.',
  `description_zh` = '莱科酒店（Hôtel Laïco），位于瓦加杜古莫里斯·亚梅奥果总统大道。该处标注设有雪茄区，但没有公开来源对其作出描述。',
  `description_ar` = 'فندق لايكو في جادة الرئيس موريس ياميوغو بمدينة واغادوغو. يُشار إلى وجود ركن للسيجار في المكان، لكن لا يصفه أي مصدر عام.',
  `updated_at` = NOW()
 WHERE `id` = 2552 AND `country_id` = 'burkina';

UPDATE `lounges` SET
  `description`    = 'Splendid Hôtel, avenue de l''Indépendance, dans le centre de Ouagadougou. Un espace cigares y est annoncé ; aucune source publique ne le décrit.',
  `description_en` = 'Splendid Hôtel, Avenue de l''Indépendance, in central Ouagadougou. A cigar space is listed there; no public source describes it.',
  `description_es` = 'Splendid Hôtel, avenida de la Independencia, en el centro de Uagadugú. Se indica allí un espacio para puros; ninguna fuente pública lo describe.',
  `description_de` = 'Splendid Hôtel, Avenue de l''Indépendance, im Zentrum von Ouagadougou. Ein Zigarrenbereich ist dort verzeichnet; keine öffentliche Quelle beschreibt ihn.',
  `description_zh` = '光辉酒店（Splendid Hôtel），位于瓦加杜古市中心独立大道。该处标注设有雪茄区，但没有公开来源对其作出描述。',
  `description_ar` = 'فندق سبلينديد في جادة الاستقلال بوسط واغادوغو. يُشار إلى وجود ركن للسيجار في المكان، لكن لا يصفه أي مصدر عام.',
  `updated_at` = NOW()
 WHERE `id` = 2553 AND `country_id` = 'burkina';

-- ── Chili : ce n'est pas le salon qui manque ─────────────
UPDATE `lounges` SET
  `description`    = 'Adresse répertoriée avenue San Martín, à Viña del Mar. L''établissement lui-même n''est recoupé par aucune source publique.',
  `description_en` = 'An address listed on Avenida San Martín, Viña del Mar. The establishment itself is corroborated by no public source.',
  `description_es` = 'Dirección registrada en la avenida San Martín, en Viña del Mar. El propio establecimiento no está contrastado por ninguna fuente pública.',
  `description_de` = 'Eine verzeichnete Adresse an der Avenida San Martín in Viña del Mar. Der Betrieb selbst wird von keiner öffentlichen Quelle bestätigt.',
  `description_zh` = '维尼亚德尔马圣马丁大道上的一处登记地址。该店本身没有任何公开来源可以佐证。',
  `description_ar` = 'عنوان مسجَّل في جادة سان مارتين بمدينة فينيا ديل مار. أمّا المحل نفسه فلا يؤكّده أي مصدر عام.',
  `updated_at` = NOW()
 WHERE `id` = 745 AND `country_id` = 'chile';

-- ── Guinée ───────────────────────────────────────────────
UPDATE `lounges` SET
  `description`    = 'Hôtel Noom, avenue du Port, dans la presqu''île de Kaloum à Conakry. Un espace cigares y est annoncé ; aucune source publique ne le décrit.',
  `description_en` = 'Hôtel Noom, Avenue du Port, on the Kaloum peninsula in Conakry. A cigar space is listed there; no public source describes it.',
  `description_es` = 'Hôtel Noom, avenida del Puerto, en la península de Kaloum, en Conakri. Se indica allí un espacio para puros; ninguna fuente pública lo describe.',
  `description_de` = 'Hôtel Noom, Avenue du Port, auf der Halbinsel Kaloum in Conakry. Ein Zigarrenbereich ist dort verzeichnet; keine öffentliche Quelle beschreibt ihn.',
  `description_zh` = '努姆酒店（Hôtel Noom），位于科纳克里卡卢姆半岛的港口大道。该处标注设有雪茄区，但没有公开来源对其作出描述。',
  `description_ar` = 'فندق نوم في جادة الميناء بشبه جزيرة كالوم في كوناكري. يُشار إلى وجود ركن للسيجار في المكان، لكن لا يصفه أي مصدر عام.',
  `updated_at` = NOW()
 WHERE `id` = 2549 AND `country_id` = 'guinea';

UPDATE `lounges` SET
  `description`    = 'Hôtel Palm Camayenne, dans le quartier de Camayenne, à Conakry. Un espace cigares y est annoncé ; aucune source publique ne le décrit.',
  `description_en` = 'Hôtel Palm Camayenne, in the Camayenne district of Conakry. A cigar space is listed there; no public source describes it.',
  `description_es` = 'Hôtel Palm Camayenne, en el barrio de Camayenne, en Conakri. Se indica allí un espacio para puros; ninguna fuente pública lo describe.',
  `description_de` = 'Hôtel Palm Camayenne, im Viertel Camayenne von Conakry. Ein Zigarrenbereich ist dort verzeichnet; keine öffentliche Quelle beschreibt ihn.',
  `description_zh` = '棕榈卡马耶纳酒店（Palm Camayenne），位于科纳克里卡马耶纳区。该处标注设有雪茄区，但没有公开来源对其作出描述。',
  `description_ar` = 'فندق بالم كامايين في حي كامايين بكوناكري. يُشار إلى وجود ركن للسيجار في المكان، لكن لا يصفه أي مصدر عام.',
  `updated_at` = NOW()
 WHERE `id` = 2550 AND `country_id` = 'guinea';

-- ── Mali ─────────────────────────────────────────────────
UPDATE `lounges` SET
  `description`    = 'Hôtel Salam, avenue de l''OUA à Badalabougou, sur la rive droite du Niger à Bamako. Un espace cigares y est annoncé ; aucune source publique ne le décrit.',
  `description_en` = 'Hôtel Salam, Avenue de l''OUA in Badalabougou, on the right bank of the Niger in Bamako. A cigar space is listed there; no public source describes it.',
  `description_es` = 'Hôtel Salam, avenida de la OUA en Badalabougou, en la margen derecha del Níger, en Bamako. Se indica allí un espacio para puros; ninguna fuente pública lo describe.',
  `description_de` = 'Hôtel Salam, Avenue de l''OUA in Badalabougou, am rechten Ufer des Niger in Bamako. Ein Zigarrenbereich ist dort verzeichnet; keine öffentliche Quelle beschreibt ihn.',
  `description_zh` = '萨拉姆酒店（Hôtel Salam），位于巴马科尼日尔河右岸巴达拉布古区的非统组织大道。该处标注设有雪茄区，但没有公开来源对其作出描述。',
  `description_ar` = 'فندق سلام في جادة منظمة الوحدة الأفريقية بحي بادالابوغو، على الضفة اليمنى لنهر النيجر في باماكو. يُشار إلى وجود ركن للسيجار في المكان، لكن لا يصفه أي مصدر عام.',
  `updated_at` = NOW()
 WHERE `id` = 2554 AND `country_id` = 'mali';

UPDATE `lounges` SET
  `description`    = 'Azalaï Grand Hôtel, square Lumumba, dans le centre de Bamako. Un espace cigares y est annoncé ; aucune source publique ne le décrit.',
  `description_en` = 'Azalaï Grand Hôtel, Square Lumumba, in central Bamako. A cigar space is listed there; no public source describes it.',
  `description_es` = 'Azalaï Grand Hôtel, plaza Lumumba, en el centro de Bamako. Se indica allí un espacio para puros; ninguna fuente pública lo describe.',
  `description_de` = 'Azalaï Grand Hôtel, Square Lumumba, im Zentrum von Bamako. Ein Zigarrenbereich ist dort verzeichnet; keine öffentliche Quelle beschreibt ihn.',
  `description_zh` = '阿扎莱大酒店（Azalaï Grand Hôtel），位于巴马科市中心卢蒙巴广场。该处标注设有雪茄区，但没有公开来源对其作出描述。',
  `description_ar` = 'فندق أزالاي الكبير في ساحة لومومبا بوسط باماكو. يُشار إلى وجود ركن للسيجار في المكان، لكن لا يصفه أي مصدر عام.',
  `updated_at` = NOW()
 WHERE `id` = 2555 AND `country_id` = 'mali';

-- ── Sénégal ──────────────────────────────────────────────
UPDATE `lounges` SET
  `description`    = 'Radisson Blu Hotel, route de King Fahd, dans le quartier de Ngor à Dakar. Un espace cigares y est annoncé ; aucune source publique ne le décrit.',
  `description_en` = 'Radisson Blu Hotel, Route de King Fahd, in the Ngor district of Dakar. A cigar space is listed there; no public source describes it.',
  `description_es` = 'Radisson Blu Hotel, ruta de King Fahd, en el barrio de Ngor, en Dakar. Se indica allí un espacio para puros; ninguna fuente pública lo describe.',
  `description_de` = 'Radisson Blu Hotel, Route de King Fahd, im Stadtteil Ngor von Dakar. Ein Zigarrenbereich ist dort verzeichnet; keine öffentliche Quelle beschreibt ihn.',
  `description_zh` = '达喀尔丽笙酒店（Radisson Blu），位于达喀尔恩戈尔区法赫德国王路。该处标注设有雪茄区，但没有公开来源对其作出描述。',
  `description_ar` = 'فندق راديسون بلو في طريق الملك فهد بحي نغور في داكار. يُشار إلى وجود ركن للسيجار في المكان، لكن لا يصفه أي مصدر عام.',
  `updated_at` = NOW()
 WHERE `id` = 2537 AND `country_id` = 'senegal';

UPDATE `lounges` SET
  `description`    = 'King Fahd Palace, avenue Cheikh Anta Diop, à Dakar. Un espace cigares y est annoncé ; aucune source publique ne le décrit.',
  `description_en` = 'King Fahd Palace, Avenue Cheikh Anta Diop, Dakar. A cigar space is listed there; no public source describes it.',
  `description_es` = 'King Fahd Palace, avenida Cheikh Anta Diop, en Dakar. Se indica allí un espacio para puros; ninguna fuente pública lo describe.',
  `description_de` = 'King Fahd Palace, Avenue Cheikh Anta Diop, Dakar. Ein Zigarrenbereich ist dort verzeichnet; keine öffentliche Quelle beschreibt ihn.',
  `description_zh` = '法赫德国王宫殿酒店（King Fahd Palace），位于达喀尔谢克·安塔·迪奥普大道。该处标注设有雪茄区，但没有公开来源对其作出描述。',
  `description_ar` = 'فندق قصر الملك فهد في جادة الشيخ أنتا ديوب بمدينة داكار. يُشار إلى وجود ركن للسيجار في المكان، لكن لا يصفه أي مصدر عام.',
  `updated_at` = NOW()
 WHERE `id` = 2538 AND `country_id` = 'senegal';

UPDATE `lounges` SET
  `description`    = 'Hôtel Terrou-Bi, boulevard Martin Luther King, sur la corniche de Dakar. Un espace cigares y est annoncé ; aucune source publique ne le décrit.',
  `description_en` = 'Hôtel Terrou-Bi, Boulevard Martin Luther King, on the Dakar corniche. A cigar space is listed there; no public source describes it.',
  `description_es` = 'Hôtel Terrou-Bi, bulevar Martin Luther King, en la corniche de Dakar. Se indica allí un espacio para puros; ninguna fuente pública lo describe.',
  `description_de` = 'Hôtel Terrou-Bi, Boulevard Martin Luther King, an der Corniche von Dakar. Ein Zigarrenbereich ist dort verzeichnet; keine öffentliche Quelle beschreibt ihn.',
  `description_zh` = '泰鲁比酒店（Terrou-Bi），位于达喀尔海滨大道马丁·路德·金大街。该处标注设有雪茄区，但没有公开来源对其作出描述。',
  `description_ar` = 'فندق تيرو-بي في جادة مارتن لوثر كينغ على كورنيش داكار. يُشار إلى وجود ركن للسيجار في المكان، لكن لا يصفه أي مصدر عام.',
  `updated_at` = NOW()
 WHERE `id` = 2539 AND `country_id` = 'senegal';

UPDATE `lounges` SET
  `description`    = 'Le Lagon I, restaurant de bord de mer, route de la Corniche-Ouest à Fann, Dakar. Un espace cigares y est annoncé ; aucune source publique ne le décrit.',
  `description_en` = 'Le Lagon I, a seafront restaurant on the Route de la Corniche-Ouest in Fann, Dakar. A cigar space is listed there; no public source describes it.',
  `description_es` = 'Le Lagon I, restaurante frente al mar, en la ruta de la Corniche-Ouest, en Fann, Dakar. Se indica allí un espacio para puros; ninguna fuente pública lo describe.',
  `description_de` = 'Le Lagon I, ein Restaurant am Meer an der Route de la Corniche-Ouest in Fann, Dakar. Ein Zigarrenbereich ist dort verzeichnet; keine öffentliche Quelle beschreibt ihn.',
  `description_zh` = '拉贡一号（Le Lagon I），位于达喀尔方恩区西滨海路的海边餐厅。该处标注设有雪茄区，但没有公开来源对其作出描述。',
  `description_ar` = 'مطعم لو لاغون الأول على طريق الكورنيش الغربي بحي فان في داكار. يُشار إلى وجود ركن للسيجار في المكان، لكن لا يصفه أي مصدر عام.',
  `updated_at` = NOW()
 WHERE `id` = 2540 AND `country_id` = 'senegal';

UPDATE `lounges` SET
  `description`    = 'Hôtel des Almadies, route de Ngor, à Dakar. Un espace cigares y est annoncé ; aucune source publique ne le décrit.',
  `description_en` = 'Hôtel des Almadies, Route de Ngor, Dakar. A cigar space is listed there; no public source describes it.',
  `description_es` = 'Hôtel des Almadies, ruta de Ngor, en Dakar. Se indica allí un espacio para puros; ninguna fuente pública lo describe.',
  `description_de` = 'Hôtel des Almadies, Route de Ngor, Dakar. Ein Zigarrenbereich ist dort verzeichnet; keine öffentliche Quelle beschreibt ihn.',
  `description_zh` = '阿尔马迪酒店（Hôtel des Almadies），位于达喀尔恩戈尔路。该处标注设有雪茄区，但没有公开来源对其作出描述。',
  `description_ar` = 'فندق ألمادي في طريق نغور بمدينة داكار. يُشار إلى وجود ركن للسيجار في المكان، لكن لا يصفه أي مصدر عام.',
  `updated_at` = NOW()
 WHERE `id` = 2541 AND `country_id` = 'senegal';

-- ── Espagne : c'est la franchise qui manque ──────────────
UPDATE `lounges` SET
  `type`           = 'Cave & Lounge',
  `description`    = 'Adresse répertoriée Passeig de Gràcia 84, à Barcelone. L''appartenance au réseau franchisé Habanos n''est recoupée par aucune liste officielle.',
  `description_en` = 'An address listed at Passeig de Gràcia 84, Barcelona. Membership of the Habanos franchise network is corroborated by no official list.',
  `description_es` = 'Dirección registrada en el Passeig de Gràcia 84, en Barcelona. La pertenencia a la red de franquicias de Habanos no está contrastada por ninguna lista oficial.',
  `description_de` = 'Eine verzeichnete Adresse am Passeig de Gràcia 84 in Barcelona. Die Zugehörigkeit zum Habanos-Franchisenetz wird von keiner offiziellen Liste bestätigt.',
  `description_zh` = '巴塞罗那格拉西亚大道 84 号的一处登记地址。其是否属于哈瓦那雪茄（Habanos）特许经营网络，没有任何官方名录可以佐证。',
  `description_ar` = 'عنوان مسجَّل في جادة غراسيا 84 ببرشلونة. أمّا الانتماء إلى شبكة امتيازات هابانوس فلا تؤكّده أي قائمة رسمية.',
  `updated_at` = NOW()
 WHERE `id` = 250 AND `country_id` = 'spain';

-- ── Togo ─────────────────────────────────────────────────
UPDATE `lounges` SET
  `description`    = 'Hôtel Sarakawa, boulevard du Mono, à Lomé. Un espace cigares y est annoncé ; aucune source publique ne le décrit.',
  `description_en` = 'Hôtel Sarakawa, Boulevard du Mono, Lomé. A cigar space is listed there; no public source describes it.',
  `description_es` = 'Hôtel Sarakawa, bulevar del Mono, en Lomé. Se indica allí un espacio para puros; ninguna fuente pública lo describe.',
  `description_de` = 'Hôtel Sarakawa, Boulevard du Mono, Lomé. Ein Zigarrenbereich ist dort verzeichnet; keine öffentliche Quelle beschreibt ihn.',
  `description_zh` = '萨拉卡瓦酒店（Sarakawa），位于洛美莫诺大道。该处标注设有雪茄区，但没有公开来源对其作出描述。',
  `description_ar` = 'فندق ساراكاوا في جادة مونو بمدينة لومي. يُشار إلى وجود ركن للسيجار في المكان، لكن لا يصفه أي مصدر عام.',
  `updated_at` = NOW()
 WHERE `id` = 2543 AND `country_id` = 'togo';

UPDATE `lounges` SET
  `description`    = 'Hôtel Mercure Lomé, avenue du 24 Janvier. Un espace cigares y est annoncé ; aucune source publique ne le décrit.',
  `description_en` = 'Hôtel Mercure Lomé, Avenue du 24 Janvier. A cigar space is listed there; no public source describes it.',
  `description_es` = 'Hôtel Mercure Lomé, avenida del 24 de Enero. Se indica allí un espacio para puros; ninguna fuente pública lo describe.',
  `description_de` = 'Hôtel Mercure Lomé, Avenue du 24 Janvier. Ein Zigarrenbereich ist dort verzeichnet; keine öffentliche Quelle beschreibt ihn.',
  `description_zh` = '洛美美居酒店（Mercure Lomé），位于1月24日大道。该处标注设有雪茄区，但没有公开来源对其作出描述。',
  `description_ar` = 'فندق مركيور لومي في جادة 24 يناير. يُشار إلى وجود ركن للسيجار في المكان، لكن لا يصفه أي مصدر عام.',
  `updated_at` = NOW()
 WHERE `id` = 2544 AND `country_id` = 'togo';

-- ── États-Unis : une franchise impossible ────────────────
UPDATE `lounges` SET
  `description`    = 'Adresse répertoriée sur North Dale Mabry Highway, à Tampa (Floride). La fiche la donnait pour une Casa del Habano : le réseau n''a aucune adresse aux États-Unis, où les cigares cubains ne sont pas vendus.',
  `description_en` = 'An address listed on North Dale Mabry Highway in Tampa, Florida. The entry called it a Casa del Habano: the network has no address in the United States, where Cuban cigars are not sold.',
  `description_es` = 'Dirección registrada en North Dale Mabry Highway, en Tampa (Florida). La ficha la daba por una Casa del Habano: la red no tiene ninguna dirección en Estados Unidos, donde no se venden puros cubanos.',
  `description_de` = 'Eine verzeichnete Adresse am North Dale Mabry Highway in Tampa, Florida. Der Eintrag führte sie als Casa del Habano: Das Netz hat keine Adresse in den Vereinigten Staaten, wo kubanische Zigarren nicht verkauft werden.',
  `description_zh` = '美国佛罗里达州坦帕市北戴尔马布里公路上的一处登记地址。原条目称其为 Casa del Habano：该网络在美国没有任何门店，古巴雪茄在美国不得销售。',
  `description_ar` = 'عنوان مسجَّل في طريق نورث ديل مابري السريع بمدينة تامبا في ولاية فلوريدا. كانت البطاقة تعدّه من «كازا ديل هابانو»: وليس للشبكة أي عنوان في الولايات المتحدة، حيث لا تُباع السيجار الكوبي.',
  `updated_at` = NOW()
 WHERE `id` = 413 AND `country_id` = 'usa';

-- ── Les sceaux, recalculés depuis les colonnes ───────────
UPDATE `translation_status` t
  JOIN `lounges` l ON l.`id` = t.`entite_id`
   SET t.`source_hash` = SHA1(l.`description`), t.`statut` = 'machine', t.`maj` = NOW()
 WHERE t.`entite` = 'lounges' AND t.`champ` = 'description'
   AND t.`entite_id` IN ('250','413','745','2537','2538','2539','2540','2541',
                         '2543','2544','2546','2547','2549','2550','2552',
                         '2553','2554','2555');

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 162','systeme','descriptions_ramenees_au_su','lounge',0,
   '18 fiches dont la source dit « a verifier » portaient une description affirmant un assortiment, une clientele et une ambiance — soit exactement ce que la migration 155 a declare non recoupe. Rendre la colonne source visible a rendu la contradiction visible : le bandeau de reserve et la description se dementaient'),
  (NULL,'migration 162','systeme','affiliation_retiree','lounge',413,
   'la description annoncait « La Casa del Habano de Tampa ». Le reseau vend des cigares cubains et n a aucune adresse aux Etats-Unis, ou ces produits ne sont pas vendus. Affirmation fausse, pas seulement invérifiable — meme faute que le #411 Miami de la migration 157'),
  (NULL,'migration 162','systeme','type_corrige','lounge',250,
   'type = « La Casa del Habano Officielle » etait rendu au-dessus d une description disant que la franchise n est pas recoupee : la page se contredisait a deux lignes d intervalle. Passe a « Cave & Lounge ». La source et la reserve ne bougent pas'),
  (NULL,'migration 162','systeme','superlatifs_retires','lounge',0,
   'retires des 18 fiches : « le plus ancien hotel de luxe de Dakar », « le restaurant de bord de mer le plus renomme », « l hotel de luxe le plus moderne de Guinee », et les dates non sourcees 1960, 1967, 1975, 1984'),
  (NULL,'migration 162','systeme','decision_maintenue','lounge',0,
   'AUCUNE fiche retiree. Le motif de la migration 155 tient : ne pas faire disparaitre une region de l atlas parce qu elle est moins indexee. Seule la prose change');
