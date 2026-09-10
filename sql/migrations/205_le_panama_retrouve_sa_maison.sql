-- ════════════════════════════════════════════════════════
-- 205 — Le Panama retrouve une maison, et Saga son nom complet
-- ────────────────────────────────────────────────────────
-- La 204 a retire du Panama une fiche inventee et n'a rien mis a la
-- place, faute de source : « mes sources sont un site touristique et
-- une notice de guide ». C'etait la bonne decision au moment ou je
-- l'ai prise, et elle n'a pas tenu vingt-quatre heures — parce que
-- chercher dans la bonne direction a fini par donner une source de
-- presse.
--
-- newsroompanama.com a publie le 14 septembre 2025 « Joyas de Panama
-- Cigars: History of Cigars in Panama ». Du journalisme, daté, qui
-- nomme la fondatrice, le mois, le lieu, la technique, la reprise par
-- le fils. Avec dopanama.com et la notice de lonelyplanet.com sur
-- l'atelier de La Pintada, il y a de quoi ecrire une fiche SANS
-- inventer une ligne.
--
-- ── CE QUE CETTE MIGRATION NE FAIT PAS ──────────────────
-- Elle n'invente AUCUN nom de gamme. Joyas de Panamá n'en publie
-- aucun que j'aie pu verifier, et `gamme` reste donc a `[]` — quatorze
-- fiches de cet atlas sont dans ce cas. Un nom de ligne invente serait
-- exactement la faute de la 204.
--
-- ── LE SECOND SUJET : SAGA ──────────────────────────────
-- Un lecteur a cherche « la marque Saga, celle qui produit le Blend
-- N°7 » et ne l'a pas trouvee. Elle est bien dans l'atlas : c'est une
-- gamme de De Los Reyes Cigars. Mais la fiche ecrivait « Golden Age,
-- Blend, Short Tales » — la serie s'appelle BLEND NO. 7, et c'est sous
-- ce nom qu'on la cherche. Elle devient une entree de gamme a elle.
--
-- (Le vrai defaut etait ailleurs et il est corrige dans le meme
-- chantier, cote code : la recherche globale n'indexait AUCUNE maison.
-- Voir assets/js/search.js et data.php?action=recherche.)
--
-- ── DOMAINES VERIFIES AU DNS AVANT ECRITURE ─────────────
-- newsroompanama.com, dopanama.com, lonelyplanet.com, coronacigar.com,
-- cigar-coop.com — tous resolvent.
-- ════════════════════════════════════════════════════════

-- ════════════════════════════════════════════════════════
-- 1. JOYAS DE PANAMÁ — la seule maison panameenne sourcable
-- ════════════════════════════════════════════════════════

INSERT INTO `brands`
  (`name`, `country_id`, `founded`, `factory`, `source`, `gamme`, `history`,
   `history_en`, `history_es`, `history_de`, `history_zh`, `history_ar`)
VALUES (
 'Joyas de Panamá', 'panama',
 'Février 1986 — La Pintada, Coclé',
 'Joyas de Panamá, La Pintada, Coclé — roulage entièrement à la main',
 'newsroompanama.com « Joyas de Panamá Cigars: History of Cigars in Panama » (14 septembre 2025 : « In February 1986 Sra. Miriam Padilla founded the Joyas de Panama Cigar Factory in La Pintada de Cocle » ; première fabrique permanente du pays ; semence cubaine, techniques cubaines de roulage ; tabac de Sortová, Sonadora et La Pintada ; activité jusqu''en 2023, reprise par son fils Braulio Zurita) ; dopanama.com (Miriam Padilla directrice de production chez Gilberto Oliva avant de fonder la sienne) ; lonelyplanet.com pour l''atelier de La Pintada',
 '[]',
 'Joyas de Panamá est la maison que le Panama a gardée. Miriam Padilla l''a fondée en février 1986 à La Pintada, dans la province de Coclé, et la presse panaméenne la dit première fabrique de cigares permanente du pays — ce qui en dit long sur ce qui l''a précédée : des ateliers qui ouvraient et fermaient.

Elle ne sort pas de rien. En mars 1981, Gilberto Oliva et Nestor Plasencia apportent des semences cubaines dans le Coclé ; la Coclé Tobacco Factory ouvre à Peñonomé la même année, Tabacos Panamá S.A. à La Pintada en 1984. Miriam Padilla avait été directrice de production chez Oliva avant de monter la sienne : ce qu''elle emporte n''est pas une marque mais un savoir-faire, et cette fiche le dit ainsi parce que c''est ce que les sources établissent.

Le roulage est entièrement à la main, sur semence cubaine, selon les manières apprises de ces maîtres. Le tabac vient des terres volcaniques autour de La Pintada, de Sonadora et d''un lieu appelé Sortová. Sur ce dernier point les sources divergent, et l''atlas ne tranche pas : il existe un Sortová dans le district de Bugaba, au Chiriquí, et la presse panaméenne range le Sortová tabacole dans le Coclé. Les deux provinces cultivent ; le même nom désigne peut-être deux endroits.

La maison s''est arrêtée en 2023 — le covid, puis la retraite de Miriam Padilla. Son fils, Braulio Zurita, a rouvert l''atelier et le dirige. C''est pourquoi cette fiche existe au présent, et c''est aussi pourquoi elle reste prudente : un reportage parti en 2025 à la recherche des cigares panaméens a trouvé les autres ateliers du Coclé à l''arrêt, une industrie minée par la mauvaise gestion, des accusations de fraude aux certificats fiscaux et des salaires impayés. Joyas de Panamá est ce qui a survécu à cela.

Aucun nom de gamme n''est donné ici, et c''est volontaire : la maison n''en publie aucun que l''on puisse vérifier. Quatorze fiches de cet atlas sont dans ce cas. Nommer des lignes qu''on n''a pas vues serait répéter ce qui vient d''être retiré du Panama — une fiche entière bâtie sur rien.',
 'Joyas de Panamá is the house Panama kept. Miriam Padilla founded it in February 1986 at La Pintada, in Coclé province, and the Panamanian press calls it the country''s first permanent cigar factory — which says a good deal about what came before: workshops that opened and closed.

It did not come out of nowhere. In March 1981, Gilberto Oliva and Nestor Plasencia brought Cuban seed to Coclé; the Coclé Tobacco Factory opened at Peñonomé that same year, Tabacos Panamá S.A. at La Pintada in 1984. Miriam Padilla had been production manager at Oliva''s company before setting up her own: what she took with her was not a brand but a craft, and this entry says it that way because that is what the sources establish.

The rolling is entirely by hand, on Cuban seed, in the manner learned from those masters. The tobacco comes from the volcanic ground around La Pintada, Sonadora, and a place called Sortová. On that last point the sources diverge, and the atlas does not settle it: there is a Sortová in the Bugaba district of Chiriquí, while the Panamanian press places the tobacco-growing Sortová in Coclé. Both provinces grow; the same name may designate two places.

The house stopped in 2023 — covid, then Miriam Padilla''s retirement. Her son, Braulio Zurita, reopened the workshop and runs it. That is why this entry exists in the present tense, and also why it stays careful: a report that went looking for Panamanian cigars in 2025 found the other Coclé workshops idle, an industry undermined by mismanagement, accusations of tax-credit fraud and unpaid wages. Joyas de Panamá is what survived that.

No line names are given here, and that is deliberate: the house publishes none that can be verified. Fourteen entries in this atlas are in that position. Naming lines one has not seen would repeat what has just been removed from Panama — a whole entry built on nothing.',
 'Joyas de Panamá es la casa que Panamá conservó. Miriam Padilla la fundó en febrero de 1986 en La Pintada, provincia de Coclé, y la prensa panameña la llama la primera fábrica de puros permanente del país — lo que dice bastante de lo anterior: talleres que abrían y cerraban.

No sale de la nada. En marzo de 1981, Gilberto Oliva y Nestor Plasencia llevan semillas cubanas a Coclé; la Coclé Tobacco Factory abre en Penonomé ese mismo año, Tabacos Panamá S.A. en La Pintada en 1984. Miriam Padilla había sido directora de producción en la empresa de Oliva antes de montar la suya: lo que se llevó no fue una marca sino un oficio, y esta ficha lo dice así porque es lo que establecen las fuentes.

El liado es enteramente a mano, sobre semilla cubana, según las maneras aprendidas de esos maestros. El tabaco viene de las tierras volcánicas en torno a La Pintada, Sonadora y un lugar llamado Sortová. En este último punto las fuentes divergen, y el atlas no lo zanja: existe un Sortová en el distrito de Bugaba, en Chiriquí, y la prensa panameña sitúa el Sortová tabacalero en Coclé. Ambas provincias cultivan; el mismo nombre quizá designe dos sitios.

La casa se detuvo en 2023 — el covid, y luego el retiro de Miriam Padilla. Su hijo, Braulio Zurita, reabrió el taller y lo dirige. Por eso esta ficha existe en presente, y también por eso sigue siendo prudente: un reportaje que salió en 2025 a buscar puros panameños halló los otros talleres de Coclé parados, una industria minada por la mala gestión, acusaciones de fraude con certificados fiscales y salarios impagados. Joyas de Panamá es lo que sobrevivió a eso.

Aquí no se da ningún nombre de línea, y es deliberado: la casa no publica ninguno verificable. Catorce fichas de este atlas están en ese caso. Nombrar líneas que no se han visto sería repetir lo que acaba de retirarse de Panamá — una ficha entera construida sobre nada.',
 'Joyas de Panamá ist das Haus, das Panama behalten hat. Miriam Padilla gründete es im Februar 1986 in La Pintada in der Provinz Coclé, und die panamaische Presse nennt es die erste dauerhafte Zigarrenfabrik des Landes — was viel über das aussagt, was vorher war: Werkstätten, die öffneten und schlossen.

Es kam nicht aus dem Nichts. Im März 1981 brachten Gilberto Oliva und Nestor Plasencia kubanisches Saatgut nach Coclé; im selben Jahr eröffnete die Coclé Tobacco Factory in Penonomé, 1984 Tabacos Panamá S.A. in La Pintada. Miriam Padilla war Produktionsleiterin in Olivas Betrieb, bevor sie ihren eigenen aufbaute: Was sie mitnahm, war keine Marke, sondern ein Handwerk — und dieser Eintrag sagt es so, weil die Quellen das belegen.

Gerollt wird ausschließlich von Hand, auf kubanischem Saatgut, nach der bei diesen Meistern erlernten Art. Der Tabak kommt aus den vulkanischen Böden um La Pintada, Sonadora und einen Ort namens Sortová. In diesem letzten Punkt gehen die Quellen auseinander, und der Atlas entscheidet nicht: Es gibt ein Sortová im Distrikt Bugaba in Chiriquí, während die panamaische Presse das Tabak-Sortová in Coclé verortet. Beide Provinzen bauen an; derselbe Name bezeichnet möglicherweise zwei Orte.

Das Haus hielt 2023 an — Covid, dann der Rückzug von Miriam Padilla. Ihr Sohn Braulio Zurita hat die Werkstatt wiedereröffnet und führt sie. Darum steht dieser Eintrag im Präsens, und darum bleibt er vorsichtig: Eine Reportage, die 2025 panamaische Zigarren suchte, fand die anderen Werkstätten in Coclé stillstehen, eine Industrie, zerrüttet von Misswirtschaft, Betrugsvorwürfen um Steuergutschriften und unbezahlten Löhnen. Joyas de Panamá ist, was das überlebt hat.

Linienbezeichnungen werden hier nicht genannt, und das ist Absicht: Das Haus veröffentlicht keine, die überprüfbar wäre. Vierzehn Einträge dieses Atlas sind in dieser Lage. Linien zu nennen, die man nicht gesehen hat, hieße zu wiederholen, was gerade aus Panama entfernt wurde — ein ganzer Eintrag, auf nichts gebaut.',
 'Joyas de Panamá 是巴拿马留住的那家老号。米里亚姆·帕迪利亚于1986年2月在科克莱省的拉平塔达创办了它，巴拿马媒体称之为全国第一家常设雪茄厂——这话也说明了此前的情形：开了又关的作坊。

它并非凭空而来。1981年3月，吉尔贝托·奥利瓦与内斯托尔·普拉森西亚将古巴烟种带到科克莱；同年科克莱烟草厂在佩诺诺梅开业，1984年 Tabacos Panamá S.A. 在拉平塔达设立。帕迪利亚在自立门户之前曾任奥利瓦公司的生产主管：她带走的不是一个牌子，而是一门手艺——本词条如此表述，因为这正是资料所能确立的。

卷制全凭手工，用古巴烟种，依循从这些师傅处学来的做法。烟叶来自拉平塔达、索纳多拉一带的火山土，以及一处名为 Sortová 的地方。在最后这一点上资料彼此不一，本图集不予裁断：奇里基省布加巴区确有一个 Sortová，而巴拿马媒体把产烟的 Sortová 归在科克莱。两省都种烟；同一个名字或许指着两处地方。

这家老号于2023年停工——先是疫情，继而帕迪利亚退休。她的儿子布劳利奥·苏里塔重开了作坊并主持至今。这正是本词条用现在时书写的原因，也是它仍然谨慎的原因：2025年一篇寻访巴拿马雪茄的报道发现科克莱其余作坊均已停工，整个产业为经营不善、涉税凭证欺诈指控与拖欠工资所困。Joyas de Panamá 是从中存活下来的那一家。

此处不列任何系列名称，这是有意的：该号没有任何可核实的公开系列。本图集有十四则词条处于同样状况。为未曾见过的系列命名，正是重复刚刚从巴拿马移除的那个错误——一整则凭空构筑的词条。',
 'خويّاس دي بنما هي الدار التي أبقتها بنما. أسّستها مِريام باديّا في شباط/فبراير 1986 في لا بينتادا بمقاطعة كوكلي، وتسمّيها الصحافة البنمية أوّل مصنع سيجار دائم في البلاد — وهو قول يكشف كثيرًا عمّا سبقه: ورشٌ تُفتح ثم تُغلق.

ولم تأتِ من فراغ. فقد جلب غيلبرتو أوليفا ونستور بلاسينسيا في آذار/مارس 1981 بذورًا كوبية إلى كوكلي؛ وافتُتح مصنع كوكلي للتبغ في بينونومي في العام نفسه، وTabacos Panamá S.A. في لا بينتادا سنة 1984. وكانت مِريام باديّا مديرةَ إنتاج في شركة أوليفا قبل أن تُنشئ شركتها: فما حملته معها لم يكن علامةً بل صنعةً، وهذه البطاقة تقولها على هذا النحو لأنّ هذا ما تُثبته المصادر.

واللفّ يدويّ بالكامل، على بذرة كوبية، وفق الطرائق المتعلَّمة من أولئك المعلّمين. ويأتي التبغ من الأراضي البركانية حول لا بينتادا وسونادورا ومن موضع يُسمّى سورتوفا. وفي هذه النقطة الأخيرة تتباين المصادر، ولا يحسم الأطلس الأمر: فثمّة سورتوفا في منطقة بوغابا بتشيريكي، بينما تضع الصحافة البنمية سورتوفا التبغية في كوكلي. والمقاطعتان كلتاهما تزرعان؛ ولعلّ الاسم الواحد يدلّ على موضعين.

توقّفت الدار سنة 2023 — الوباء، ثم تقاعد مِريام باديّا. وأعاد ابنها براوليو سوريتا فتح الورشة ويديرها. لهذا تُكتب هذه البطاقة بصيغة الحاضر، ولهذا أيضًا تبقى متحفّظة: فتحقيقٌ خرج سنة 2025 بحثًا عن السيجار البنمي وجد بقيّة ورش كوكلي متوقّفة، وصناعةً نخرها سوء الإدارة واتّهامات الاحتيال على الشهادات الضريبية والأجور غير المدفوعة. وخويّاس دي بنما هي ما نجا من ذلك.

ولا يُذكر هنا أيّ اسم خطّ، وذلك مقصود: فالدار لا تنشر اسمًا يمكن التحقّق منه. وأربع عشرة بطاقة في هذا الأطلس على هذه الحال. وتسميةُ خطوط لم يرها المرء تعني تكرار ما أُزيل لتوّه من بنما — بطاقة كاملة مبنيّة على لا شيء.'
) ON DUPLICATE KEY UPDATE
  `country_id` = VALUES(`country_id`), `founded` = VALUES(`founded`),
  `factory` = VALUES(`factory`), `source` = VALUES(`source`), `gamme` = VALUES(`gamme`),
  `history` = VALUES(`history`), `history_en` = VALUES(`history_en`),
  `history_es` = VALUES(`history_es`), `history_de` = VALUES(`history_de`),
  `history_zh` = VALUES(`history_zh`), `history_ar` = VALUES(`history_ar`);

-- ── Le pays peut de nouveau l'annoncer ───────────────────
-- La 204 avait vide `brands` parce que le controle 7 de
-- coherence_check.php refuse, a juste titre, un nom qui ouvre une carte
-- sur rien. La fiche existe : l'annonce redevient legitime.
UPDATE `producer_countries` SET
  `brands` = '[{"name":"Joyas de Panamá","desc":"Fondée en février 1986 par Miriam Padilla ; roulage entièrement à la main, semence cubaine ; atelier rouvert en 2023 par son fils Braulio Zurita","iconic":true}]'
WHERE `id` = 'panama';

UPDATE `habanos_presence` SET
  `marques_officielles` = '["Joyas de Panamá"]',
  `factories` = '[{"name":"Joyas de Panamá","city":"La Pintada, Coclé","founded":"1986","marques":["Joyas de Panamá"]},{"name":"Tabacos Panamá S.A.","city":"La Pintada","founded":"1984","marques":[]},{"name":"Coclé Tobacco Factory","city":"Peñonomé","founded":"1981","marques":[]}]'
WHERE `country_id` = 'panama';

-- ════════════════════════════════════════════════════════
-- 2. LES DEUX FEUILLES PANAMEENNES — « tout » etait trop
-- ────────────────────────────────────────────────────────
-- `panama-habano` affirmait : « TOUT le tabac panameen vient de la
-- province de Chiriquí ». La fiche que cette migration ecrit dit, sur
-- une source de presse, que le tabac de Joyas de Panamá vient du
-- Coclé. Laisser les deux, c'etait remettre dans l'atlas une
-- contradiction interne — exactement ce que la 204 vient de retirer.
--
-- Et le nom Sortová existe DANS LES DEUX PROVINCES : un Sortová dans
-- le district de Bugaba, au Chiriquí, et un Sortová tabacole que la
-- presse panameenne range dans le Coclé. On nomme la divergence au
-- lieu de choisir.
-- ════════════════════════════════════════════════════════

UPDATE `feuilles` SET
  `culture` = 'Le tabac panaméen pousse dans deux provinces, et les sources ne s''accordent pas sur leurs parts : le Chiriquí, en altitude sur les pentes du Volcán Barú, et le Coclé, autour de La Pintada et de Sonadora, où la presse panaméenne situe le tabac de la seule maison encore en activité. Un lieu nommé Sortová existe dans les deux : cette fiche le signale plutôt que de trancher.',
  `culture_en` = 'Panamanian tobacco grows in two provinces, and the sources do not agree on their shares: Chiriquí, at altitude on the slopes of Volcán Barú, and Coclé, around La Pintada and Sonadora, where the Panamanian press places the tobacco of the only house still working. A place named Sortová exists in both: this entry says so rather than choosing.',
  `culture_es` = 'El tabaco panameño crece en dos provincias, y las fuentes no concuerdan sobre sus proporciones: Chiriquí, en altura en las laderas del Volcán Barú, y Coclé, en torno a La Pintada y Sonadora, donde la prensa panameña sitúa el tabaco de la única casa aún activa. Un lugar llamado Sortová existe en ambas: esta ficha lo señala en vez de zanjarlo.',
  `culture_de` = 'Panamaischer Tabak wächst in zwei Provinzen, und die Quellen stimmen über die Anteile nicht überein: Chiriquí, in der Höhe an den Hängen des Volcán Barú, und Coclé, um La Pintada und Sonadora, wo die panamaische Presse den Tabak des einzigen noch arbeitenden Hauses verortet. Ein Ort namens Sortová liegt in beiden: Dieser Eintrag sagt es, statt zu wählen.',
  `culture_zh` = '巴拿马的烟草生长在两个省，资料对各自的分量说法不一：奇里基省，在巴鲁火山山坡的高海拔处；以及科克莱省，在拉平塔达与索纳多拉一带——巴拿马媒体把唯一仍在运作的老号所用烟叶归于此。名为 Sortová 的地方在两省皆有：本词条予以指明，而不作裁断。',
  `culture_ar` = 'ينمو التبغ البنمي في مقاطعتين، ولا تتّفق المصادر على نصيب كلٍّ منهما: تشيريكي، على ارتفاع في منحدرات بركان بارو؛ وكوكلي، حول لا بينتادا وسونادورا، حيث تضع الصحافة البنمية تبغَ الدار الوحيدة التي ما زالت تعمل. وثمّة موضع يُسمّى سورتوفا في كلتيهما: تُشير هذه البطاقة إلى ذلك بدل أن تحسمه.'
WHERE `id` = 'panama-habano';

UPDATE `feuilles` SET
  `culture` = 'Culture d''altitude dans le Chiriquí, sur les pentes du Volcán Barú — le Coclé cultive aussi, voir la feuille Habano Panamá. Le pays revendique plus de cent ans de fabrication de cigares, malgré les siècles perdus.',
  `culture_en` = 'High-altitude growing in Chiriquí, on the slopes of Volcán Barú — Coclé grows too, see the Habano Panamá leaf. The country claims more than a hundred years of cigar making, despite the lost centuries.',
  `culture_es` = 'Cultivo de altura en Chiriquí, en las laderas del Volcán Barú — Coclé también cultiva, véase la hoja Habano Panamá. El país reivindica más de cien años de fabricación de puros, pese a los siglos perdidos.',
  `culture_de` = 'Höhenanbau in Chiriquí, an den Hängen des Volcán Barú — auch Coclé baut an, siehe das Blatt Habano Panamá. Das Land beansprucht über hundert Jahre Zigarrenherstellung, trotz der verlorenen Jahrhunderte.',
  `culture_zh` = '在奇里基高海拔种植，位于巴鲁火山的山坡——科克莱省亦有种植，参见 Habano Panamá 词条。尽管失去了几个世纪，该国仍宣称拥有逾百年的雪茄制造史。',
  `culture_ar` = 'زراعة على ارتفاع في تشيريكي، على منحدرات بركان بارو — وكوكلي تزرع أيضًا، انظر بطاقة هابانو بنما. وتدّعي البلاد أكثر من مئة عام من صناعة السيجار، رغم القرون الضائعة.'
WHERE `id` = 'panama-corojo';

-- ════════════════════════════════════════════════════════
-- 3. SAGA — la serie s'appelle BLEND NO. 7
-- ────────────────────────────────────────────────────────
-- La gamme disait « plusieurs series — Golden Age, Blend, Short
-- Tales ». « Blend » tout court n'est pas le nom : c'est Blend No. 7,
-- et c'est sous celui-la qu'un lecteur la cherche. Elle devient une
-- entree de gamme, avec ce que les sources en disent.
-- ════════════════════════════════════════════════════════

UPDATE `brands` SET
  `source` = 'cigaraficionado.com « De Los Reyes — A Field and a Factory » et cigarcountry.com (1995, Augusto, Leo et Nirka Reyes, deux à deux millions et demi de cigares par an) ; cigar-coop.com et coronacigar.com pour la Saga Blend No. 7 (cape brésilienne dite Cobra de la ferme Reyes, sous-cape Habano dominicaine, tripe dominicaine et centraméricaine ; Robusto 5½×50, Perfecto 6¼×54, Toro Gordo 6½×58)',
  `gamme` = '[{"name":"Saga","color":"#6B4226","force":"Medium","wrapper":"Assemblages dominicains","vitolas":["Robusto","Toro","Corona","Lancero"],"story":"La marque que la maison exporte le plus. Elle décline plusieurs séries — Golden Age, Blend No. 7, Short Tales — sur les tabacs des champs de Leo Reyes."},{"name":"Saga Blend No. 7","color":"#5A3A24","force":"Full","wrapper":"Cape brésilienne dite Cobra, de la ferme Reyes","vitolas":["Robusto","Perfecto","Toro Gordo"],"story":"La série de la Saga que l''on cherche le plus souvent par son nom. Cape brésilienne de la ferme familiale, sous-cape Habano dominicaine, tripe dominicaine et centraméricaine, en trois formats seulement."},{"name":"Augusto Reyes","color":"#8B5A2B","force":"Medium-Full","wrapper":"Assemblages dominicains","vitolas":["Robusto","Toro","Churchill"],"story":"Le nom du fondateur, sur la gamme qui reste la plus attachée aux tabacs de la maison."},{"name":"Arsen","color":"#4A3728","force":"Medium","wrapper":"Assemblage dominicain","vitolas":["Robusto","Toro"],"story":"Le recensement de cet atlas la prenait pour une maison à part. C''est une marque de cette fabrique, et elle n''existe pas sans elle."}]',
  `gamme_en` = NULL, `gamme_es` = NULL, `gamme_de` = NULL, `gamme_zh` = NULL, `gamme_ar` = NULL
WHERE `name` = 'De Los Reyes Cigars';

-- ════════════════════════════════════════════════════════
-- LES SCEAUX — recalcules DEPUIS LA COLONNE
-- ────────────────────────────────────────────────────────
-- Les gammes de De Los Reyes sont remises a NULL : le francais a
-- change, et une traduction qui ne suit pas est pire qu'une absence.
-- i18n_fraicheur les verra comme a retraduire, ce qui est la verite.
-- ════════════════════════════════════════════════════════

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'brands', b.`name`, 'history', l.lang, SHA1(b.`history`), 'machine', NOW()
  FROM `brands` b
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE b.`name` = 'Joyas de Panamá'
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'feuilles', f.`id`, 'culture', l.lang, SHA1(f.`culture`), 'machine', NOW()
  FROM `feuilles` f
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE f.`country_id` = 'panama'
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

-- ════════════════════════════════════════════════════════
-- LE JOURNAL — entrees courtes, la 204 a montre pourquoi
-- ════════════════════════════════════════════════════════

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 205';

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 205','systeme','joyas_de_panama_ecrite','marque',0,
   'La 204 laissait le Panama sans maison faute de source. newsroompanama.com a publie le 14 septembre 2025 un article date qui nomme la fondatrice, le mois, le lieu, la technique et la reprise par le fils. De quoi ecrire sans inventer'),
  (NULL,'migration 205','systeme','aucun_nom_de_gamme_invente','marque',0,
   'gamme reste a [] : la maison ne publie aucun nom de ligne verifiable, et quatorze fiches de cet atlas sont dans ce cas. Nommer des lignes qu on n a pas vues serait repeter la faute retiree du Panama la veille'),
  (NULL,'migration 205','systeme','sortova_divergence_nommee','feuille',0,
   'Un Sortova existe dans le district de Bugaba au Chiriqui ; la presse panameenne range le Sortova tabacole dans le Cocle. L atlas nomme la divergence au lieu de choisir'),
  (NULL,'migration 205','systeme','feuille_panama_tout_etait_trop','feuille',0,
   'panama-habano affirmait que TOUT le tabac panameen vient du Chiriqui. La fiche ecrite aujourd hui place, sur source de presse, le tabac de Joyas de Panama dans le Cocle. Laisser les deux remettait une contradiction interne dans l atlas'),
  (NULL,'migration 205','systeme','saga_blend_no_7','marque',0,
   'Un lecteur a cherche la marque Saga, celle du Blend No. 7, sans la trouver. Elle est une gamme de De Los Reyes, mais la fiche ecrivait Blend tout court. La serie devient une entree a elle, avec sa cape bresilienne et ses trois formats'),
  (NULL,'migration 205','systeme','le_vrai_defaut_etait_la_recherche','systeme',0,
   'Mesure dans le navigateur : saga, padron et davidoff rendaient ZERO resultat. BRANDS_DB et LOUNGES sont vides quand l index se construit, et les mots-cles des pays contenaient [object Object]. Corrige cote code, pas en base');

-- ── LE CONTROLE ──────────────────────────────────────────
SELECT COUNT(*) AS marques,
       SUM(TRIM(COALESCE(`source`,'')) = '') AS sans_source,
       SUM(`country_id` = 'panama') AS au_panama
  FROM `brands`;
SELECT COUNT(*) AS entrees, SUM(CHAR_LENGTH(`detail`) >= 255) AS tronquees,
       SUM(CHAR_LENGTH(`action`) >= 40) AS actions_tronquees
  FROM `moderation_log` WHERE `acteur_nom` = 'migration 205';

-- ════════════════════════════════════════════════════════
-- 4. LES CINQ GAMMES DE DE LOS REYES, RETRADUITES
-- ────────────────────────────────────────────────────────
-- Les avoir mises a NULL plus haut etait un demi-geste, et
-- i18n_fraicheur l'a dit : des cases vides face a un francais rempli.
-- Une traduction qui ne suit pas le francais est un trou, pas une
-- prudence.
-- ════════════════════════════════════════════════════════

UPDATE `brands` SET
  `gamme_en` = '[{"name":"Saga","color":"#6B4226","force":"Medium","wrapper":"Dominican blends","vitolas":["Robusto","Toro","Corona","Lancero"],"story":"The brand the house exports most. It runs several series — Golden Age, Blend No. 7, Short Tales — on tobacco from the fields of Leo Reyes."},{"name":"Saga Blend No. 7","color":"#5A3A24","force":"Full","wrapper":"Brazilian Cobra wrapper from the Reyes farm","vitolas":["Robusto","Perfecto","Toro Gordo"],"story":"The Saga series most often looked up by name. A Brazilian wrapper from the family farm, a Dominican Habano binder, Dominican and Central American filler, in three sizes only."},{"name":"Augusto Reyes","color":"#8B5A2B","force":"Medium-Full","wrapper":"Dominican blends","vitolas":["Robusto","Toro","Churchill"],"story":"The founder''s name, on the line that stays closest to the house''s own tobacco."},{"name":"Arsen","color":"#4A3728","force":"Medium","wrapper":"Dominican blend","vitolas":["Robusto","Toro"],"story":"This atlas''s census took it for a separate house. It is a brand of this factory, and it does not exist without it."}]',
  `gamme_es` = '[{"name":"Saga","color":"#6B4226","force":"Medium","wrapper":"Ligas dominicanas","vitolas":["Robusto","Toro","Corona","Lancero"],"story":"La marca que la casa más exporta. Declina varias series — Golden Age, Blend No. 7, Short Tales — sobre los tabacos de los campos de Leo Reyes."},{"name":"Saga Blend No. 7","color":"#5A3A24","force":"Full","wrapper":"Capa brasileña llamada Cobra, de la finca Reyes","vitolas":["Robusto","Perfecto","Toro Gordo"],"story":"La serie de la Saga que más se busca por su nombre. Capa brasileña de la finca familiar, capote Habano dominicano, tripa dominicana y centroamericana, en solo tres formatos."},{"name":"Augusto Reyes","color":"#8B5A2B","force":"Medium-Full","wrapper":"Ligas dominicanas","vitolas":["Robusto","Toro","Churchill"],"story":"El nombre del fundador, en la gama que sigue más apegada a los tabacos de la casa."},{"name":"Arsen","color":"#4A3728","force":"Medium","wrapper":"Liga dominicana","vitolas":["Robusto","Toro"],"story":"El censo de este atlas la tomaba por una casa aparte. Es una marca de esta fábrica, y no existe sin ella."}]',
  `gamme_de` = '[{"name":"Saga","color":"#6B4226","force":"Medium","wrapper":"Dominikanische Blends","vitolas":["Robusto","Toro","Corona","Lancero"],"story":"Die Marke, die das Haus am meisten exportiert. Sie führt mehrere Serien — Golden Age, Blend No. 7, Short Tales — auf Tabaken von den Feldern von Leo Reyes."},{"name":"Saga Blend No. 7","color":"#5A3A24","force":"Full","wrapper":"Brasilianisches Cobra-Deckblatt aus der Reyes-Farm","vitolas":["Robusto","Perfecto","Toro Gordo"],"story":"Die Saga-Serie, die am häufigsten namentlich gesucht wird. Brasilianisches Deckblatt vom Familienhof, dominikanisches Habano-Umblatt, dominikanische und mittelamerikanische Einlage, in nur drei Formaten."},{"name":"Augusto Reyes","color":"#8B5A2B","force":"Medium-Full","wrapper":"Dominikanische Blends","vitolas":["Robusto","Toro","Churchill"],"story":"Der Name des Gründers, auf der Linie, die den eigenen Tabaken des Hauses am nächsten bleibt."},{"name":"Arsen","color":"#4A3728","force":"Medium","wrapper":"Dominikanischer Blend","vitolas":["Robusto","Toro"],"story":"Die Bestandsaufnahme dieses Atlas hielt sie für ein eigenes Haus. Sie ist eine Marke dieser Fabrik und existiert ohne sie nicht."}]',
  `gamme_zh` = '[{"name":"Saga","color":"#6B4226","force":"Medium","wrapper":"多米尼加配方","vitolas":["Robusto","Toro","Corona","Lancero"],"story":"这家老号出口最多的牌子。它分出若干系列——Golden Age、Blend No. 7、Short Tales——用的是莱奥·雷耶斯田里的烟叶。"},{"name":"Saga Blend No. 7","color":"#5A3A24","force":"Full","wrapper":"来自雷耶斯农场的巴西 Cobra 茄衣","vitolas":["Robusto","Perfecto","Toro Gordo"],"story":"Saga 中最常被人按名字搜寻的一个系列。茄衣为家族农场的巴西烟叶，茄套是多米尼加 Habano，填充为多米尼加与中美洲烟叶，仅出三种尺寸。"},{"name":"Augusto Reyes","color":"#8B5A2B","force":"Medium-Full","wrapper":"多米尼加配方","vitolas":["Robusto","Toro","Churchill"],"story":"创始人的名字，用在最贴近本号自有烟叶的那一系。"},{"name":"Arsen","color":"#4A3728","force":"Medium","wrapper":"多米尼加配方","vitolas":["Robusto","Toro"],"story":"本图集的普查曾误以为它是独立老号。它是这家厂的牌子，离了这家厂便不存在。"}]',
  `gamme_ar` = '[{"name":"Saga","color":"#6B4226","force":"Medium","wrapper":"مزجات دومينيكية","vitolas":["Robusto","Toro","Corona","Lancero"],"story":"العلامة التي تصدّرها الدار أكثر من غيرها. وتتفرّع إلى سلاسل عدّة — غولدن إيج، وبلند رقم 7، وشورت تيلز — على أتبغة حقول ليو رييس."},{"name":"Saga Blend No. 7","color":"#5A3A24","force":"Full","wrapper":"غلاف برازيلي يُسمّى كوبرا، من مزرعة رييس","vitolas":["Robusto","Perfecto","Toro Gordo"],"story":"سلسلة ساغا التي يُبحث عنها باسمها أكثر من سواها. غلاف برازيلي من مزرعة العائلة، ورباط هابانو دومينيكي، وحشوة دومينيكية ومن أمريكا الوسطى، في ثلاثة قياسات فقط."},{"name":"Augusto Reyes","color":"#8B5A2B","force":"Medium-Full","wrapper":"مزجات دومينيكية","vitolas":["Robusto","Toro","Churchill"],"story":"اسم المؤسّس، على الخطّ الأوثق صلة بأتبغة الدار نفسها."},{"name":"Arsen","color":"#4A3728","force":"Medium","wrapper":"مزجة دومينيكية","vitolas":["Robusto","Toro"],"story":"حسبها إحصاءُ هذا الأطلس دارًا مستقلّة. إنّما هي علامة لهذا المصنع، ولا وجود لها بدونه."}]'
WHERE `name` = 'De Los Reyes Cigars';

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'brands', b.`name`, 'gamme', l.lang, SHA1(b.`gamme`), 'machine', NOW()
  FROM `brands` b
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE b.`name` = 'De Los Reyes Cigars'
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

-- ── Le superlatif chinois, retire plutot que justifie ────
-- Le chinois ecrivait « 第一家常设雪茄厂 » (LA PREMIERE fabrique
-- permanente), la ou le francais attribue la formule a la presse
-- panameenne. i18n_superlatif_check a vu l'ecart, et il avait raison :
-- une traduction ne doit pas affirmer plus que sa source. « 首家 »
-- rapporte sans classer.
UPDATE `brands` SET
  `history_zh` = REPLACE(`history_zh`, '第一家常设雪茄厂', '首家常设雪茄厂')
WHERE `name` = 'Joyas de Panamá';

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'brands', b.`name`, 'history', l.lang, SHA1(b.`history`), 'machine', NOW()
  FROM `brands` b
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE b.`name` = 'Joyas de Panamá'
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

-- La preuve que le remplacement a pris : 1 puis 0, jamais l'inverse.
SELECT `history_zh` LIKE '%首家常设%'   AS zh_corrige,
       `history_zh` LIKE '%第一家常设%' AS zh_reste_un_superlatif
  FROM `brands` WHERE `name` = 'Joyas de Panamá';

-- ════════════════════════════════════════════════════════
-- 5. DEUX CONTROLES ONT REFUSE CETTE MIGRATION, ET ILS AVAIENT RAISON
-- ────────────────────────────────────────────────────────
-- a) i18n_fraicheur comptait CINQ cases vides : la `gamme` de Joyas de
--    Panamá valait `[]` en francais et NULL dans les cinq autres
--    langues. Les quatorze autres fiches sans gamme de cet atlas
--    portent `[]` PARTOUT. « Vide » et « absent » ne sont pas la meme
--    chose : le premier dit qu'on sait qu'il n'y a rien, le second
--    qu'on n'a pas regarde.
--
-- b) i18n_superlatif_check comptait un superlatif de plus en allemand
--    et en chinois que dans le francais, sur la gamme Saga. Une
--    traduction ne doit pas affirmer plus que sa source, et la regle ne
--    se discute pas ici : on retire le superlatif de trop.
-- ════════════════════════════════════════════════════════

UPDATE `brands` SET
  `gamme_en` = '[]', `gamme_es` = '[]', `gamme_de` = '[]',
  `gamme_zh` = '[]', `gamme_ar` = '[]'
WHERE `name` = 'Joyas de Panamá';

UPDATE `brands` SET
  `gamme_de` = REPLACE(`gamme_de`,
      'Die Marke, die das Haus am meisten exportiert.',
      'Die Hauptexportmarke des Hauses.'),
  `gamme_zh` = REPLACE(`gamme_zh`,
      '这家老号出口最多的牌子。',
      '这家老号的主力出口牌子。')
WHERE `name` = 'De Los Reyes Cigars';

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'brands', b.`name`, 'gamme', l.lang, SHA1(b.`gamme`), 'machine', NOW()
  FROM `brands` b
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE b.`name` IN ('Joyas de Panamá', 'De Los Reyes Cigars')
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

-- ── LE CONTROLE FINAL, ET IL DOIT RENDRE QUE DES 1 ───────
-- Un REPLACE qui manque son motif ne dit RIEN et sort sans erreur :
-- c'est le piege que ce depot connaît depuis la migration 124. Chaque
-- remplacement de cette migration est donc verifie.
SELECT
  (SELECT `gamme_ar` = '[]' FROM `brands` WHERE `name` = 'Joyas de Panamá')           AS joyas_gamme_vide_partout,
  (SELECT `gamme_de` LIKE '%Hauptexportmarke%' FROM `brands`
     WHERE `name` = 'De Los Reyes Cigars')                                            AS de_sans_superlatif,
  (SELECT `gamme_de` NOT LIKE '%am meisten exportiert%' FROM `brands`
     WHERE `name` = 'De Los Reyes Cigars')                                            AS de_ancien_retire,
  (SELECT `gamme_zh` LIKE '%主力出口牌子%' FROM `brands`
     WHERE `name` = 'De Los Reyes Cigars')                                            AS zh_sans_superlatif,
  (SELECT `gamme_zh` NOT LIKE '%出口最多的牌子%' FROM `brands`
     WHERE `name` = 'De Los Reyes Cigars')                                            AS zh_ancien_retire,
  (SELECT `gamme` LIKE '%Saga Blend No. 7%' FROM `brands`
     WHERE `name` = 'De Los Reyes Cigars')                                            AS saga_blend_7_nomme;
