-- ════════════════════════════════════════════════════════
-- 278 — Relecture ar
-- ────────────────────────────────────────────────────────
-- Relecture des traductions « ar » par : expert-traduction (agent).
-- Fichier de verdicts : verdicts_p3_ar.json ; generee par tools/i18n_relecture.php le 2026-10-22.
-- Un texte « corrige » est reecrit ; tout texte relu passe au statut « relu »,
-- avec le nom du relecteur. L'empreinte du francais est verifiee dans le WHERE :
-- un francais qui a change depuis l'export ne se laisse pas declarer relu.
-- ════════════════════════════════════════════════════════

-- brands|A.J. Fernandez|history|ar — تعديل صيغ المقارنة واسم المكان
UPDATE `brands` SET `history_ar` = 'وصل Abdel J. Fernández إلى إستيلي حاملاً حرفة العائلة، ودون علامة تجارية خاصة يدافع عنها: كان جدّه يزرع التبغ في كوبا، أمّا هو فبدأ باللفّ لحساب الآخرين. وهذا موقع نادر في هذه المهنة. فلسنوات، باعت علامات معروفة سيجاراً خرج من مصنعه دون أن يظهر اسمه على الشريط — بينما كان أهل الصنعة يعرفون.

بُنيت سمعته كخبير خلطات على منهج لا على أسلوب: يبحث Fernández عن توازن الخلطة لا عن قوّتها، وكان من أوائل من أعادوا غلاف San Andrés المكسيكي بكثافة إلى الخلطات النيكاراغوية، في زمن كانت تُعدّ فيه تلك الورقة خشنة. والنتيجة — داكنة، حلوة، كثيفة الدخان — صارت مدرسة إلى حدّ يصعب معه إحصاء البيوت التي سارت على خطاها.

أمّا علاماته الخاصة فجاءت لاحقاً، ومتأخرة: New World وBellas Artes وEnclave. لم تحتج إلى أن تُعرِّف بنفسها، بل ورثت سمعة قائمة. واليوم تزرع الدار حقولها الخاصة حول إستيلي، ما يضعها في الفئة النادرة من المنتجين الذين يتحكمون بالسلسلة كاملة، من الشتلة إلى الشريط.

في أكتوبر 2026، يلفّ Fernández كذلك أسماءً ليست له. أما الاسمان Diesel وMan O''War، اللذان أُطلقا عام 2009 لصالح Cigars International، فيخرجان من مصانعه؛ وانتقل Diesel عام 2021 إلى Forged Cigar Company، وخطه Uncaged، المتوفر في المتاجر منذ أغسطس 2026، يصنعه Fernández في إستيلي. ويعود الاسم Artesano del Tobacco (ويُكتب أيضًا Artesano del Tabaco) إلى الأخوين Billy وGus Fakih، اللذين أطلقا تحت هذا الاسم Viva La Vida عام 2019. ويعود Henk إلى Heiko Poerz، وقد أُنشئ بالاشتراك مع Fernández وDidier Houvenaghel؛ ويعود Nasser Cigars إلى Jeffrey Nasser من Pétion-Ville، ويلفّ Fernández The Goat الخاص به. أما Reposado فمزيج من تركيب Fernández بحسب Cigars Direct، التي لا تذكر لمن يعود الاسم.'
 WHERE `name` = 'A.J. Fernandez' AND SHA1(TRIM(`history`)) = 'd6583be5b489e8b074ec4f1874e8b48545580d21';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'A.J. Fernandez' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'd6583be5b489e8b074ec4f1874e8b48545580d21';
-- brands|Aganorsa Leaf|history|ar — صيغة التفضيل مستبدلة
UPDATE `brands` SET `history_ar` = 'من المرجّح أنك دخّنت تبغ Aganorsa من قبل دون أن تدري. أسّس Eduardo Fernández شركة زراعية — Agrícola Ganadera Norteña — قبل أن يؤسّس علامة تجارية، وهذا ترتيب معاكس لكل ما هو سائد في المهنة. فالدار مزارع قبل كل شيء، في وادي خالابا وحول إستيلي، ويظهر تبغها في خلطات عشرات البيوت التي لا حقول لها.

هذه المكانة تمنحها موقعاً خاصاً في الأطلس: فهي تمثّل شيئاً نادراً مما تملكه نيكاراغوا، لا مصنعاً إضافياً بل المادة الأولى نفسها. والبذور الكوبية التي أُعيد غرسها هنا — كوروخو 99، كريّولو 98 — صارت مرجع الذائقة النيكاراغوية الحديثة، ذلك الجمع بين قوّة صريحة وحلاوة فرضته البلاد في مواجهة الهافانا.

طويلاً باعت الدار سيجارها باسم «Casa Fernandez» قبل أن تتخذ اسم شركتها الزراعية. والتغيير يقول تماماً ما تدّعيه: ليست العلامة هي التي تضمن السيجار، بل الورقة.

تعود La Tribu إلى Atlantic Cigar Company، وهي تاجر تجزئة أمريكي: ذكرت مدونة في أغسطس 2013 أنها تُباع، على حد علم المدونة، لدى هذا التاجر وحده، بغلاف Habano من الإكوادور. وفي أكتوبر 2026، تعرض صفحة Atlantic Cigar سيجار La Tribu Robusto من جمهورية الدومينيكان، وتنسب Serie de Couleurs إلى Aganorsa Leaf. أما Noir فيها، وهو Toro 6 x 56 من تبغ نيكاراغوي، فيأتي من سيجار بقي سنة في غرفة التعتيق التابعة لـ Aganorsa Leaf، وقد صار يتيمًا إثر ما يسميه التاجر قصص سياسة السيجار.'
 WHERE `name` = 'Aganorsa Leaf' AND SHA1(TRIM(`history`)) = 'e1dac37dbab91530f66cad5a1f984284c36cb846';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Aganorsa Leaf' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'e1dac37dbab91530f66cad5a1f984284c36cb846';
-- brands|Alec Bradley|history|ar — noms de personnes latins
UPDATE `brands` SET `history_ar` = 'وُلدت Alec Bradley عام 1996 في الولايات المتحدة من قرار Alan Rubin دخول عالم السيجار بعد بيع شركة العائلة لاستيراد الخردوات، بحسب تاجر التجزئة Cigars Direct. ولم يكن له، بحسب صحافة المهنة، أي ماضٍ في التبغ.

ويعطي الشركة اسمَي ابنيه Alec وBradley.

البدايات صعبة: فالعلامة الأولى، Bogie Stogies، وهي سيجار لملاعب الغولف، لا تنجو من نهاية الازدهار، ويبدأ Rubin بإنتاج علامات لتجّار التجزئة. وفي عام 2000 ينضمّ إليه المحنّك Ralph Montero؛ ومع Henke Kelner، كبير خلّاطي Davidoff، يُصدران Occidental Reserve المصنوع في الجمهورية الدومينيكية، ثم Trilogy (Cigars Direct).

لا تملك الدار مصنعًا: فهي تُسند لفَّ خطوطها إلى جهات أخرى. ويُلفّ معظمها في Raíces Cubanas في دانلي بهندوراس؛ وبعضها لدى عائلة Plasencia في نيكاراغوا، ومنذ عام 2019 خطوط مثل Project 40 لدى J. Fuego في إستيلي (صحافة المهنة، ويكيبيديا). ولا تؤرّخ أي صفحة قُرئت صلةً بمصانع Plasencia في هندوراس.

قُدّمت Prensado في IPCPR عام 2009 بخمسة قياسات، وهي مضغوطة على شكل علبة، وهذه سابقة للدار: غلاف Corojo مزروع في تروخيس (هندوراس)، ورابط من خالابا (نيكاراغوا)، وحشوة من تبوغ هندوراسية ونيكاراغوية. وتضع صحافة المهنة قياس Churchill منها في صدارة سيجارات عام 2011، وهو منعطف تبرزه الدار نفسها.

ثم تأتي Tempus (2007 أو 2009 بحسب المصادر)، وBlack Market (2011)، وCoyol (2014)، وMagic Toast (2018)، وProject 40 (2019). وفي عام 2018 أطلق ابنا Rubin علامتهما الخاصة Alec & Bradley، ومنها جاءت Kintsugi بحسب ويكيبيديا. وفي 1 مارس 2023 تولّت Scandinavian Tobacco Group حافظة Alec Bradley؛ ويبقى Rubin مستشارًا، وترتبط الدار اليوم بـForged Cigar Co.'
 WHERE `name` = 'Alec Bradley' AND SHA1(TRIM(`history`)) = 'e82df430f404a44722df2414111a20f4cb20a4a7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Alec Bradley' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'e82df430f404a44722df2414111a20f4cb20a4a7';
-- brands|Arturo Fuente|history|ar — noms de personnes latins
UPDATE `brands` SET `history_ar` = 'وُلد Arturo Fuente Sr. في غوينيس بكوبا في 18 نوفمبر 1887، واستقرّ في كي ويست عام 1906، ثم في ويست تامبا عام 1910، بحسب arturofuente.com؛ أما ويكيبيديا فتؤرّخ وصوله إلى الولايات المتحدة بعام 1902. وفي 1912، وهو في الرابعة والعشرين من عمره، أسّس A. Fuente & Company في 813 شارع فرانسيس في ويست تامبا. وفي 1924 احترق المصنع بينما كان في كوبا لشراء التبغ؛ وقضى بعد ذلك اثنتين وعشرين سنة مديرًا عامًا لشركة محلية.

وابنه Carlos Fuente Sr.، المولود عام 1935، صار عام 1956 المالك الوحيد للشركة بشرائه مقابل دولار واحد حصة أخيه الذي يكبره سنًّا، Arturo Oscar؛ وتوفي Arturo Sr.، وهو متقاعد، عام 1973. وفي مطلع السبعينيات اشترى Carlos مصنعًا في نيكاراغوا؛ وبحسب ابنه، فإن أول سيجار Don Carlos بيع، عام 1976، لُفّ في إستيلي. وفي 1978 أحرق التمرد الساندينيستي المصنع النيكاراغوي؛ وفي 1979 دمّر حريق «عرضي» مصنع هندوراس.

واصل Carlos Sr. إنتاج السيجار من موقع إيبور سيتي، بحسب arturofuente.com. وفي 4 سبتمبر 1980 افتتح Carlos Sr. وابنه Carlos Jr.، المعروف بـCarlito، شركة Fuente Ltd في سانتياغو دي لوس كاباليروس بالجمهورية الدومينيكية. ولا يزال موقع إيبور سيتي في الشارع 22 مفتوحًا، لكن كمركز توزيع فحسب: فلا يُلفّ فيه سيجار باليد بعد الآن.

ابتكر Carlito عام 1992 ما تسمّيه الدار أول سيجار puro ناجح دومينيكي بنسبة 100%، بغلافه أيضًا، وهو Fuente Fuente OpusX الذي طُرح للبيع في 18 نوفمبر 1995، بحسب arturofuente.com؛ ويذكّر هذا الموقع بأن التربة الدومينيكية كانت تُعدّ غير صالحة لتبغ الغلاف. وينمو الغلاف في Château de la Fuente، في المنطقة الجبلية من بوناو، على بعد نحو ساعة إلى الجنوب الشرقي من سانتياغو: فقد غرست العائلة فيها أولى بذورها في مطلع التسعينيات، وتفتح المزرعة أبوابها لزوار مهرجان ProCigar.

وتوفي Carlos Fuente Sr. في أغسطس 2016 عن 81 عامًا. وكان Carlito يرأس الشركة آنذاك؛ وهو وأخته Cynthia Fuente-Suarez، نائبة الرئيس بحسب arturofuente.com، حفيدا المؤسّس. وتشير الدار إلى أنّ الشركة، بعد أربعة أجيال على البدايات، ما زالت عائلية؛ ويتحدث كتاب Arturo Fuente: Since 1912 عن جيل رابع ينتظر في الكواليس.'
 WHERE `name` = 'Arturo Fuente' AND SHA1(TRIM(`history`)) = 'd8be123ec46f77c26f7ef15cca0bd6fd16fdb648';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Arturo Fuente' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'd8be123ec46f77c26f7ef15cca0bd6fd16fdb648';
-- brands|Ashton|history|ar — صيغة التفضيل مستبدلة
UPDATE `brands` SET `history_ar` = 'تبدأ قصة Ashton في فيلادلفيا عام 1985، في متجر Holt''s Cigar Company الذي تتولّاه عائلة Levin منذ 1957 ويديره Robert Levin منذ 1974، كما يقول holts.com. فالجمهورية الدومينيكية، التي صارت في السبعينيات البديل الرئيس عن كوبا لدى المدخّنين الأمريكيين، كانت تنتج سيجارًا متفاوت الجودة إلى حدّ بعيد — بعضه ممتاز، وكثيره لا بأس به فحسب. وRobert Levin هو من أنشأ العلامة: تصفه الدار بأنه منشئ Ashton في مطلع الثمانينيات وتؤرّخ إطلاقها بسنة 1985؛ ويقول في حوار يعود إلى عام 1996 إنه قدّمها في مؤتمر Retail Tobacco Dealers of America في واشنطن، وإنه اشترى في عام 1992 من Bill Taylor، صانع غلايين Ashton، الاسم الذي اقترحه عليه صديق، مستورد لتلك الغلايين.

لم تُلفّ أولى سيجارات Ashton لدى Fuente: يقول Levin إنها صُنعت في البداية على يد Henke Kelner لدى Tabadom، ثم إنه أوكل العلامة إلى آل Fuente عام 1988، واضعًا الخلطة مع Carlos Fuente Jr.، Carlito؛ أمّا الدار فتكتب أنه تشارك مع آل Fuente بعد الإطلاق بوقت قصير. والعلاقة قائمة إلى اليوم: يقول موقعا ashtoncigar.com وholts.com إنّ سيجار Ashton يُلفّ في Tabacalera A. Fuente بالجمهورية الدومينيكية، ويتولّى Carlito Fuente مزجه — باستثناء خط San Cristobal الوارد أدناه. ويعني هذا الترتيب أيضًا أن الدارين تتقاسمان حدًّا أدنى للجودة — فما ترضى عائلة Fuente بتوقيعه باسمها، تنتجه كذلك لعلامة Levin.

ويغطّي الكتالوغ الذي خرج من ذلك مدى التعبير الدومينيكي كلّه. تقول تشكيلات كونيتيكت شيد الكلاسيكية الطرحَ الأساسي: أصالة، وقوام قشدي، وانتظام في الصناعة قلّما تحافظ عليه الدور. أما خطوط VSG — Virgin Sun Grown — فتستعمل غلافًا إكوادوريًّا مزروعًا في الشمس لطابع أكمل، فاجأ المدخّنين الذين لم يعرفوا من Ashton سوى وجهها اللطيف. وCabinet Selection، المعتَّقة في صناديق أرز إسباني بعد اللفّ، تُظهر الدار في ذروة رهافتها.

هوية العلامة آتية من فيلادلفيا: رصينة، منتبهة إلى الجودة، معنيّة بالتنفيذ لا بمسرح عالم السيجار. فحيث Davidoff جنيفية وباردة، Ashton فيلادلفية ودافئة. لا تثير الحديث بقياسات متطرّفة ولا بخلطات مفاجئة؛ بل تصنع سيجارًا يعود إليه الهواة المتمرّسون دون خيبة، وهذا أصعب مما يبدو.

خارج الولايات المتحدة، يُباع خط San Cristobal من Ashton، الذي أُوكل تصنيعه في نيكاراغوا إلى عائلة Garcia من My Father في إستيلي، باسم Paradiso: يفسّر ذلك مقال صادر في ديسمبر 2015 بأسباب تتعلق بالعلامة. وفي أكتوبر 2026، لا يزال تجار تجزئة ألمان يعرضونه بهذا الاسم، ضمن سلاسل Paradiso by Ashton وRevelation وQuintessence وElegancia. ولا ينبغي الخلط بينه وبين العلامة الكوبية San Cristóbal de La Habana.'
 WHERE `name` = 'Ashton' AND SHA1(TRIM(`history`)) = 'bccdf493d6fba9411367159bca921b94e5ad455c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ashton' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'bccdf493d6fba9411367159bca921b94e5ad455c';
-- brands|Ashton Cabinet|history|ar — تعديل لفظ الشهور
UPDATE `brands` SET `history_ar` = 'أطلق Robert Levin، من العائلة التي تتولّى Holt''s في فيلادلفيا، علامة Ashton عام 1985، كما يقول holts.com. ولم تُلفّ أولى سيجاراته لدى Fuente: يقول في حوار يعود إلى عام 1996 إنها صُنعت في البداية على يد Henke Kelner لدى Tabadom، ثم إنه أوكل العلامة إلى آل Fuente عام 1988؛ أمّا الدار فتكتب أنه تشارك مع آل Fuente بعد الإطلاق بوقت قصير. وآل Fuente — الدار العائلية التي كانت قد أعادت لتوّها بناء سمعتها في الجزيرة بعد حريق مصنعها عام 1980 — يلفّون اليوم سيجار Ashton في Tabacalera A. Fuente بالجمهورية الدومينيكية.

Cabinet Selection هي الخطّ الذي تعتّقه الدار بعد اللفّ. وهي ليست سيجارًا راقيًا فحسب: إنها سيجار يخضع لتعتيق إضافي — الوقت الذي تمنحه إياه صناديق من خشب الأرز.

بعد اللفّ، تُوضع سيجارات Cabinet Selection في صناديق من أرز إسباني — لا الأرز الزخرفي في التغليف المعتاد، بل خشب البناء الذي يُستعمل تقليديًّا لتعتيق النبيذ والمشروبات الإسبانية — وتُترك فيها من اثني عشر إلى أربعة وعشرين شهرًا قبل صدورها. وخلال هذه المدة يواصل التبغ تخمّره في وسط مضبوط يليّن ما بقي من خشونة ويدع مكوّنات الخلطة تتناغم. وتضيف الصناديق طابعها الخاص: فانتقال زيوت الأرز الراتنجية البطيء، عبر شهور من التماس، يؤثّر في الغلاف والأوراق الخارجية على نحو لا يعيده التعتيق العادي.

والنتيجة سيجار ذو تماسك لافت. فالغلاف كونيتيكت شيد — إكوادوري، كأغلب أغلفة هذا الطراز اليوم — يعطي منذ الأنفاس الأولى نكهات البندق وعسل الجبل. أما الحشوة الدومينيكية، المبنية على وصفة Carlos Fuente Sr. الشخصية، فتتطوّر نحو الأرز الأبيض والفواكه المجفّفة قبل نهاية غير معتادة في طولها وصفائها. لا خشونة في أي موضع. ولا يطلب هذا السيجار من مدخّنه، في أي لحظة، سوى الانتباه.'
 WHERE `name` = 'Ashton Cabinet' AND SHA1(TRIM(`history`)) = 'a900d1a21bbd388e3ddf4bb89e5fbe1339e23d0f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ashton Cabinet' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'a900d1a21bbd388e3ddf4bb89e5fbe1339e23d0f';
-- brands|Avo|history|ar — villes et rue à traduire
UPDATE `brands` SET `history_ar` = 'وُلد Avo Uvezian في بيروت يوم 22 مارس 1926؛ عازف بيانو وملحّن أرمني أمريكي، توفي في أورلاندو يوم 24 مارس 2017 عن 91 عامًا (Cigar Dojo، 24 مارس 2017). وتبقى أغنيته الذائعة موضع خلاف: تُنسب «Strangers in the Night» إلى Bert Kaempfert، بينما كان Uvezian يؤكد أنه ألّفها وأنه أرسل اللحن إلى Kaempfert قبل أن يسجّلها Sinatra عام 1966 (ويكيبيديا).

وللسيجار اتجه إلى Hendrik Kelner، الذي كان قد افتتح Tabacos Dominicanos (Tabadom) عام 1984. وبحسب صحافة المهنة، يعود أول طلب قدّمه Kelner لعلامة Avo، وهو 17 000 سيجار، إلى عام 1987، ويبيع متجر Davidoff في جادة ماديسون العلامة عام 1988؛ وتُؤرَّخ أولى الإصدارات بعام 1988. وتكتب ويكيبيديا أن Davidoff اشترت عام 1995 حقوق توزيع Avo، بمبلغ يقارب 10 ملايين دولار.

تُلفّ السيجارات في الجمهورية الدومينيكية، في مصنع OK Cigars التابع لـ Tabadom، وهي فرع من Oettinger Davidoff (صحافة المهنة، 2016 و2025). وفي يناير 2015 حصرت العلامة عرضها في أربعة خطوط جارية هي Classic وDomaine وHeritage وXO؛ وتوقّف إنتاج Signature وMaduro. ويحمل خط XO مصطلحات موسيقية أسماءً لقياساته: Notturno وPreludio وIntermezzo وLegato وMaestoso.

احتفلت Davidoff بمناسباتها السنوية بإصدار محدود في كل عام من 2001 إلى 2014، ثم بـ Avo 90th عام 2016. وفي مارس 2026 أفادت صحافة المهنة بأن الدار تعتزم إحياء مئوية Uvezian في معرض PCA في أبريل.'
 WHERE `name` = 'Avo' AND SHA1(TRIM(`history`)) = '9907b0453e6eb2e15525e8a381867ceb1333f6e4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Avo' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '9907b0453e6eb2e15525e8a381867ceb1333f6e4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bolivar' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '52a5ff2acd6db85d57e5de0d039269c311a8c57c';
-- brands|Camacho|history|ar — ويكيبيديا: terme incohérent
UPDATE `brands` SET `history_ar` = 'Camacho علامة أسّسها عام 1961 في ميامي Simon Camacho، المنفيّ الكوبي، بحسب بيان Oettinger Davidoff الصادر في 13 أكتوبر 2008؛ أما مقدّمة ويكيبيديا فتذكر 1962. وتوفي Simon Camacho عام 1990. وتتسلّم عائلة Eiroa، وهي أيضًا من المنفى الكوبي ويقودها Julio Eiroa، العلامة عبر شركتها Caribe Imported Cigars: عام 1994 بحسب بيان Davidoff، وحوالى 1995 بحسب مصادر أخرى. وكان التصنيع حتى ذلك الحين في نيكاراغوا، فانتقل حينئذٍ إلى هندوراس، حيث تملك عائلة Eiroa مزارع.

التبغ الرمزي للدار هو الكوروخو المزروع في وادي خاماستران في هندوراس. وبحسب BespokeUnit تُنسب بذرة الكوروخو إلى الكوبي Diego Rodriguez في أربعينيات القرن العشرين، ثم أعيدت زراعتها في خاماستران بعد تأميم الصناعة الكوبية؛ ثم زرعت Camacho بذورها الخاصة. وسلسلة Camacho Corojo مصنوعة من تبغ هندوراسي؛ وتضيف نسخة BXP منها حشوة Broadleaf من بنسلفانيا، بحسب صحافة المهنة عام 2017.

انضمت Camacho إلى مجموعة Oettinger Davidoff في 1 أكتوبر 2008؛ ولم تُنشر الشروط. وعند الإعلان ظل Christian Eiroa رئيسًا، وأُبقي على الموظفين البالغ عددهم 561 (534 في هندوراس و27 في الولايات المتحدة). وبحسب صحافة المهنة اشترت المجموعة العلامة ومصنع دانلي، فيما احتفظ آل Eiroa بمزارعهم بحسب ويكيبيديا. ومنذ يناير 2017 تُلفّ السيجارات في دانلي في مصنع Diadema Cigars de Honduras. وأضافت العلامة عام 2015 American Barrel-Aged، المُلفوفة في الجمهورية الدومينيكية، وعام 2017 نسخ box-pressed (BXP) من سلاسلها Connecticut وCorojo وEcuador.'
 WHERE `name` = 'Camacho' AND SHA1(TRIM(`history`)) = '88b433f3fc41eb8f46e296cb3fbfebb9fbd8fb1e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Camacho' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '88b433f3fc41eb8f46e296cb3fbfebb9fbd8fb1e';
-- brands|CAO|history|ar — noms de personnes latins
UPDATE `brands` SET `history_ar` = 'تبدأ قصة CAO بالغلايين لا بالسيجار. وبحسب Cigar Dojo أطلق Cano Aret Ozgener الدار في ناشفيل عام 1968 وسمّاها على أحرف اسمه الأولى؛ وكانت تصنع في البداية الغلايين وحافظات الرطوبة. وتوضّح صحافة المهنة أن Ozgener، المولود في إسطنبول عام 1937، مهندس، كان قد عمل في DuPont بولاية كارولاينا الشمالية، حيث كان يصلح غلايين زبد البحر التركية المعيبة، وأنه تفرّغ للغليون عام 1977: فالصفحتان لا تعطيان إذن نقطة الانطلاق نفسها (1968 أو 1977).

ويأتي السيجار لاحقًا. تكتب Cigar Dojo أن الدار جرّبت السيجار الفاخر عام 1980، ثم عادت إليه في منتصف التسعينيات؛ وتؤرّخ صحافة المهنة دخول Ozgener سوق السيجار بعام 1993، وأول CAO، الملفوف في هندوراس، بعام 1995. ومع مطلع الألفينات كانت العلامة قد عُرفت بخلطات جريئة ومعاصرة.

نمّت CAO نمطًا خاصًا بها، متجهًا إلى الصور الأمريكية. وتستمد تشكيلة Flathead، التي أُطلقت عام 2013 بحسب Cigar Dojo، من عالم السيارات المعدَّلة (hot rods) والـpin-up والدراجات النارية المصمَّمة حسب الطلب؛ وتحمل قياساتها أسماء قطع المحرّك (Carb وCamshaft وPiston وBig Block). وتصفها صفحة الدار، في أكتوبر 2026، بأنها مبنية على غلاف Connecticut Broadleaf، من دون أن تذكر ماركة دراجة.

في عام 2007 اشترى Henri Wintermans، وهو قسم من ST Tobacco، شركة CAO بحسب صحافة المهنة؛ وتسمّي Cigar Dojo الكيان الحالي Scandinavian Tobacco Group. وغادرت العلامة ناشفيل إلى مقرّ General Cigar في ريتشموند بولاية فيرجينيا. وبقي Tim Ozgener، ابن المؤسس، رئيسًا حتى عام 2010؛ وتُوفّي Cano Ozgener في 9 يونيو 2018 في ناشفيل عن 81 عامًا. وفي أكتوبر 2026 يحمل موقع caocigars.com عبارة General Cigar Co., Inc.؛ وبحسب الخطوط تُلفّ السيجارات في إستيلي (نيكاراغوا) أو في هندوراس أو لدى General Cigar Dominicana (الجمهورية الدومينيكية).'
 WHERE `name` = 'CAO' AND SHA1(TRIM(`history`)) = '3d11a130e14af1991e5162c7ec26aa9161208ba3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '3d11a130e14af1991e5162c7ec26aa9161208ba3';
-- brands|Casdagli|history|ar — تعديل تعبير العدد
UPDATE `brands` SET `history_ar` = 'Casdagli دار بريطانية لا تملك حقولًا. أسّسها Jeremy Casdagli سنة 1997 باسم Bespoke Cigars، ثم حملت اسم مؤسّسها في ربيع 2018. ويقول هذا التغيير شيئًا عن مقصدها: فهي ترتضي أن تكون توقيعًا لا مصنعًا، وتعمل بسلاسل قصيرة لا بكتالوج دائم.

غيّرت سيجاراتها البلد ثلاث مرات. لُفّت أولًا في كوبا على يد لافّ واحد، Carlos Valdez Mosquera، حتى انسحابه سنة 2013. ثم انتقل الإنتاج إلى مصنع Kelner Boutique Factory الذي يديره Hendrik Kelner Jr. في سانتياغو دي لوس كاباييروس بجمهورية الدومينيكان. وهو اليوم كوستاريكي، موزّع على ورشتين: IGM في سان خوسيه لخطَّي Daughters of the Wind وCypher 3311؛ وTabacos de Costa Rica في بوريسكال لخط Villa Casdagli، بإشراف كبير المزّاجين Olman Guzmán.

وهذا العنوان الثاني ليس عنوانًا كأيّ عنوان، وهو يصحّح ما كانت هذه البطاقة تؤكّده من قبل. فشركة Tabacos de Costa Rica S.A. هي، بإقرار الدار نفسها، الورشة التي كانت «تُعرف آنذاك باسم Vegas Santiago» — وهي ورشة Vegas de Santiago، التي لها بطاقتها الخاصة في هذا الأطلس، وتكتب دارها أنّها تزرع التبغ في بوريسكال منذ ما يزيد على ثمانين سنة (على ارتفاع يتجاوز ألفًا ومئة متر، بحسب Zechbauer). غير أنّ La Nación كتبت سنة 2011 أنّ إنتاج التبغ فيها توقّف في 1997-1998: تلفّ Casdagli سيجارات Villa Casdagli في بوريسكال، أيًّا كانت حال الحقول المحيطة بها.

وما يبقى صحيحًا أنّ الورقة تأتي من مكان آخر. فخط Villa Casdagli يمزج تبغ بيرو ونيكاراغوا والإكوادور وجمهورية الدومينيكان، تحت غلاف ورباط إكوادوريَّين؛ وأربعة من هذه الأتبغة تمرّ بتخمير ثانٍ يُسمّى «مِخورادو» يدوم شهرين إلى أربعة. ويروي Jeremy Casdagli أنّه اكتشف في هذه الورشة سنة 2012 التبغ البيروفي الذي صار مفضّله في المزج. لقد اختير بلد الإنتاج فعلًا من أجل الورشة — لكن من أجل ما تُحسنه هذه الورشة.

تنتمي الدار إلى ما يُسمّى فئة «البوتيك»: تلك التي يُحصى إنتاجها السنوي بعشرات الآلاف من السيجارات حيث تُحصي الدور الكبرى عشرات الملايين. وهو فرق في الحجم قبل أن يكون فرقًا في الجودة، وهو يفسّر الأساس — توافر غير منتظم، وغياب شبكة توزيع واسعة، وشهرة تدور خصوصًا بين الهواة.'
 WHERE `name` = 'Casdagli' AND SHA1(TRIM(`history`)) = 'fa5c0203d765e422b463f45bfd571483003817da';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casdagli' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'fa5c0203d765e422b463f45bfd571483003817da';
-- brands|Cohiba|history|ar — marques et personnes en latin
UPDATE `brands` SET `history_ar` = 'تؤرّخ Habanos نشأة Cohiba بعام 1966 وتكتب أنّ العلامة ظلّت طوال سنوات عديدة مخصّصة للهدايا التي تُقدَّم إلى شخصيات حكومية وإلى الرئيس Fidel Castro. وتُروى أصول السيجار على وجهين. يقول Castro عام 1994 إنّ أحد حرّاسه الشخصيين كان يدخّن سيجارًا شديد العطر، يلفّه له صديق لاستعماله الشخصي؛ فأمر بدراسة الخلطة والغلافات، وأُسّس مصنع حوله. ويروي اللافّ Eduardo Rivera عام 1995 أنّه في مطلع ستينيات القرن العشرين أهدى صديق أحد سيجاراته إلى Fidel، الذي لم يدخّن بعده شيئًا آخر؛ وكان حينها يلفّ في La Corona في هافانا قبل أن ينتقل إلى El Laguito. وتذكر الصحافة المتخصّصة بين متلقّي هذه الهدايا Tito وNasser وLuis Echeverría وOmar Torrijos، كما تذكر عام 1974 علبة سُلّمت إلى موفدين أمريكيين لـHenry Kissinger؛ ويقول Castro عام 1994 إنّه يهدي Cohiba في الغالب.

تكتب Habanos أنّ Cohiba متاحة للمدخّنين منذ 1982، وهي السنة التي قُدِّمت فيها العلامة في عدّة بلدان، بكميات محدودة. وتضع الصحافة المتخصّصة هذا الطرح الأول للبيع في إسبانيا، في وقت كأس العالم، بثلاثة مقاسات هي Lancero وCorona Especial وPanetela؛ وانضمّ إليها Robusto وExquisito وEspléndido عام 1989. وتؤرّخ بعض الروايات الاسم بعام 1968 بدل 1966. ويأتي الاسم من كلمة تاينو تدلّ على أوراق التبغ الملفوفة التي رآها كولومبوس في كوبا عام 1492؛ وترى Habanos فيه الاسم الأول للتبغ.

تكتب Habanos أنّ Cohiba هي العلامة الوحيدة بين علاماتها التي يخضع فيها نوعان من أنواع الأوراق الثلاثة المستعملة، هما seco وligero، لتخمير إضافي، ما يمنح العلامة رائحة ونكهة يمكن التعرّف عليهما. والأوراق هي، كما تقول، منتقى المنتقى من خيرة الـvegas في San Juan y Martínez وSan Luis، في Vuelta Abajo. أمّا الصحافة المتخصّصة فتتحدّث عن تخمير ثالث في براميل، قُرّر في El Laguito في 1965-1966 لتلطيف المذاق.

وظّف El Laguito لفترة لافّات فقط، كما تكتب الصحافة المتخصّصة عام 2016. والمصنع مغلق عادةً أمام عامّة الجمهور: تنظّم Habanos فيه زيارات مصحوبة بمرشدين للمشاركين في فعالياتها، كما في أيلول/سبتمبر 2022 لمناسبة مرور 55 عامًا على العلامة.

الحلقة السوداء والصفراء هي التوقيع البصري للعلامة. وقد أدخلت Habanos عام 2014 حلقة جديدة بهولوغرام، على Pirámides Extra أولًا ثم على كامل Línea Clásica وLínea 1492، لتحسين تتبّع كل سيجار؛ وكان خطّ Behike يحمل منذ 2010 حلقته الخاصة ذات إجراءات الأمان المشدّدة.

أُطلق خطّ Behike عام 2010، وتصفه Habanos بأنه الخطّ الأشدّ حصريةً بين ما أطلقته. وهو الأوّل في العلامة الذي يُدخل medio tiempo في خلطته، وهي ورقة مأخوذة من الورقتين العلويتين لنبتة التبغ المزروعة تحت الشمس المباشرة. وُلد بثلاثة مقاسات هي BHK 52 و54 و56، تُلفّ في El Laguito؛ أمّا المقاس الرابع BHK 58 (58 x 178 mm)، الذي قُدِّم في Festival del Habano في شباط/فبراير 2025، فبيع للمرة الأولى في سويسرا ابتداءً من شباط/فبراير 2026، في علبة تضمّ أربعة مقاسات تحتفي بمرور خمس عشرة سنة على الخطّ.

أين تُلفّ؟ في كوبا للسؤال جواب من طابقين. منذ 2002 لكلّ علامة من علامات Habanos مصنع أمّ، مسؤول عن اختيار الأوراق والخلطة، ويمكن أن يُلفّ سيجارها في أيّ من عشرات المصانع في الجزيرة تحت إشراف الأمّ؛ ولا تنشر Habanos هذه الخريطة، بل تعيد الصحافة المتخصّصة تركيبها. مصنعها هو El Laguito، في دار قديمة في غرب هافانا: تقول صفحة Habanos الرسمية إنّ Cohiba تُصنع هناك منذ 1966، وتتحدّث مصادر أخرى عن 1967، وتضع الصحافة الدار تارةً في كوباناكان وتارةً في سيبوني أو في ميرامار. منذ 2019 تصنّفها Habanos ضمن علاماتها العالمية الستّ، التي تُباع في كلّ أسواقها وفي كلّ Casa del Habano. تلاحظ الصحافة المتخصّصة أنّ بعض القياسات لُفّت أيضًا في مصنع H. Upmann وفي Partagás؛ ويبقى El Laguito الأمّ.

تعلن Habanos، في بيان بتاريخ 8 تشرين الأول/أكتوبر 2026، الإطلاق العالمي لـTalismán في لندن يوم 7 تشرين الأول/أكتوبر، وهو أوّل محطة في عام Cohiba احتفاءً بالذكرى الستين للعلامة: هذا الـSublimes No. 1 (54 x 154 mm)، الذي صدر عام 2017 في إصدار محدود، يصبح المقاس التاسع في Línea Clásica.'
 WHERE `name` = 'Cohiba' AND SHA1(TRIM(`history`)) = 'aed85c64ddab0e80e288294e77b1ff6188e22045';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cohiba' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'aed85c64ddab0e80e288294e77b1ff6188e22045';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cohiba USA' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'ba44a7f0ecee216b866e0f177f7aa77f168f4133';
-- brands|Cuaba|history|ar — nom de marque en latin
UPDATE `brands` SET `history_ar` = 'Cuaba علامة بَعْث. أُطلقت سنة 1996، وهي تستعيد الفيغورادو المزدوج، المدبّب من طرفيه، وهو طراز كان رائجاً في أواخر القرن التاسع عشر وتقول habanos.com إنه أُعيد إطلاقه بعد قرن، سنة 1996، في مصنع Romeo y Julieta. وتكتب ويكيبيديا أنّ Habanos أطلقتها في 19 نوفمبر 1996 في لندن، في فندق Claridge''s، وأنّ الفيغورادو، الذائعة في مطلع القرن العشرين، تراجعت ابتداءً من خمسينيات القرن الماضي.

تقدّم Habanos الفيغورادو المزدوج بوصفه قمّة فنّ لافّ السيجار. وتكتب ويكيبيديا أنّ كلّ Cuaba يلفّه يدوياً لافّون من الدرجة 7، وهي أرفع مستويات الاعتماد، وأنّ الأوائل منها، المصنوعة بلا قالب، كانت تتفاوت قليلاً في الحجم، إذ لم تصل القوالب إلا بعد نحو سنة. وكانت المقاسات الأصلية Divinos وTradicionales وGenerosos وExclusivos؛ وانضمّت إليها Distinguido وDiadema وSalomón إلى المحفظة النظامية سنة 2003، بحسب habanos.com.

تصف Habanos العلامة بأنها ذات قوة متوسطة إلى تامّة، بغلاف وحشوة من Vuelta Abajo في Pinar del Río.

الاسم، بحسب habanos.com، كلمة هندية من زمن كريستوفر كولومبوس تدلّ على شجيرة شديدة الاشتعال كانت تُستخدم لإشعال السيجار في الاحتفالات الدينية؛ أمّا الصحافة المتخصّصة فترى فيه شجيرة كان التاينو يستخدمونها لإشعال سيجارهم.

أين تُلفّ؟ في كوبا للسؤال جواب من طابقين. منذ 2002 لكلّ علامة من علامات Habanos مصنع أمّ، مسؤول عن اختيار الأوراق والخلطة، ويمكن أن يُلفّ سيجارها في أيّ من عشرات المصانع في الجزيرة تحت إشراف الأمّ؛ ولا تنشر Habanos هذه الخريطة، بل تعيد الصحافة المتخصّصة تركيبها. مصنعها الأمّ هو La Corona — مصنع Miguel Fernández Roig —، في شارع 20 de Mayo بحيّ سيرو، وهو مصنع سجائر سابق تحوّل إلى مصنع سيجار سنة 2000، بحسب الصحافة المتخصّصة (2011 و2015) التي تسمّيه أمّاً لـCuaba وHoyo de Monterrey وPunch. وفي أكتوبر 2026 تصنّف صفحة Habanos Brands Academia في habanos.com علامة Cuaba ضمن العلامات الثلاث عشرة الأخرى في محفظة من 27 علامة، خارج العلامات العالمية الستّ وعلامات القيمة الخمس وعلامات الحجم الثلاث. وتكتب Habanos أنّ أسلوب Cuaba أُعيد إطلاقه سنة 1996 في مصنع Romeo y Julieta دون أن تسمّي مصنعاً أمّاً؛ وتكتب ويكيبيديا أنّ معظم سيجار Cuaba يُصنع في مصنع Briones Montoto، مصنع Romeo y Julieta، وتضع الصحافة المتخصّصة المصنع الأمّ في La Corona: الروايتان مكتوبتان. كلّه ملفوف يدويًّا بحشوة طويلة.'
 WHERE `name` = 'Cuaba' AND SHA1(TRIM(`history`)) = '017e6a13bcb627ee63d86ed94041961408f7cfa6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuaba' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '017e6a13bcb627ee63d86ed94041961408f7cfa6';
-- brands|Dannemann|history|ar — اسم شخص بالأحرف اللاتينية؛ مفتول
UPDATE `brands` SET `history_ar` = 'تنشأ Dannemann في ساو فيليكس دا كاشويرا، في ريكونكافو بولاية باهيا بالبرازيل، مع Gerhard (الذي صار يُدعى Geraldo) Dannemann، وهو مهاجر ألماني. وتاريخ المصنع مختلف عليه: سنة 1872 بحسب الدار (dannemann-group.com، التي تسمّيه مصنعها للسيجار بحشوة طويلة)، وسنة 1873 بحسب Wikipedia، التي تنسب إليه ستة عاملين في البداية. وتُعرض الروايتان دون ترجيح.

يأتي التبغ من منطقة Mata Fina في باهيا: تقول الدار إنّ ما يزيد على 200 مزرعة شريكة تزرع فيها الحشوة، وإنّ مزرعة Fazenda San Antônio، ومساحتها 1000 هكتار، تمدّ بجميع الأغلفة الخارجية لسلاسل السيجار الفاخرة. وتُعتَّق بالات التبغ هناك قبل التصنيع.

تذكر Wikipedia أنّ Dannemann اندمجت سنة 1922 مع دار Stender لتشكّل Companhia de Charutos Dannemann؛ وفي أثناء الحرب صودر النشاط البرازيلي وأدارته Banco do Brasil؛ وفي سنة 1988 اشترت المجموعة السويسرية Burger حقوق العلامة الألمانية وتولّت Dannemann GmbH في لوبكه. وفي أكتوبر 2026 تصف مجموعة DANNEMANN نفسها بأنها عائلية وسويسرية، شركتها القابضة في Rotkreuz، وتعدّ عشرة مواقع إنتاج؛ ومصنع ساو فيليكس، الذي تسمّيه Terra Dannemann، لا يزال عاملًا.

ما يضع هذه الدار في البرازيل هو مكان اللفّ. فعلامة Dannemann المباعة في أوروبا، وهي سيجارات صغيرة (سيجارلّو) وسيجار بحشوة قصيرة، تصفها الدار بأنها مزروعة في البرازيل ومصنوعة في أوروبا؛ وتنتج لوبكه في الغالب السيجارلّو، وتنتج رايناخ خلطات وسيجارلّو، وتنتج بريساغو سيجارًا خاصًا. وعلامتا Moods وAl Capone من المجموعة نفسها علامتان أخريان؛ وسيجار Al Capone الملفوف يدويًا في دانلي بهندوراس ليس هذا. ولا يدخل هنا إلا ما لُفّ باليد من سيجار بحشوة طويلة في ساو فيليكس.

يشغل Centro Cultural Dannemann المبنى الاستعماري القديم للمصنع في ساو فيليكس. وبحسب الصحافة الاقتصادية سنة 2012 كان يعمل فيه عشرون شخصًا، وكان الدخل الأوّل للمجموعة في باهيا يأتي من Danco، معملها لمعالجة الأوراق؛ ويؤرّخ تحقيق سنة 2017 المبنى بسنة 1892. وقُدِّم خط فاخر هو Elementum، يحمل سنة الحصاد، في Festival Origem في ريكونكافو (Brazil Journal، 4 أكتوبر 2020)؛ ولا تذكر الصفحة من يصنعه.'
 WHERE `name` = 'Dannemann' AND SHA1(TRIM(`history`)) = '03ed2148766fbc9ec3ac50cca833555406d0b08d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dannemann' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '03ed2148766fbc9ec3ac50cca833555406d0b08d';
-- brands|Davidoff|history|ar — أسماء أشخاص بالأحرف اللاتينية
UPDATE `brands` SET `history_ar` = 'وُلد Zino Davidoff في 11 مارس 1906 في أوكرانيا الحالية: في كييف بحسب swissinfo (11 مارس 2006)، وفي Novhorod-Siverskyi بحسب ويكيبيديا. وبحسب التسلسل الزمني للدار، غادرت عائلته كييف عام 1911 لتستقرّ في جنيف، حيث افتتح أبوه Henri Davidoff أول متجر له للتبغ.

تؤرّخ الدار ميلاد علامة سيجار Davidoff بعام 1968: ففي ذلك العام خرج أول سيجار بحلقة بيضاء ابتكره Zino Davidoff في كوبا؛ وبحسب ويكيبيديا فإن Cubatabaco هي التي اتصلت بـ Davidoff في 1967 بعرض، وتعود الـvitolas الثلاث الأولى إلى 1968-1969. وفي 1970 تولّت مجموعة Oettinger متجر Zino Davidoff في جنيف، وشرع Ernst Schneider، الذي كان يدير المجموعة منذ 1961، في جعله علامة دولية.

منذ 1991، تقول الدار، يُلَفّ كل سيجار Davidoff يدويًا في الجمهورية الدومينيكية، في Villa González (Santiago)، حيث تُصنع أيضًا AVO وThe Griffin''s وCusano وPrivate Stock وZino Platinum. وبشأن الانفصال عن كوبا، تتباين الصفحات. فبحسب صحافة القطاع، أحرق Zino Davidoff في 1989، مع ممثلين عن Cubatabaco ورجال جمارك سويسريين، نحو 130 000 سيجار هافاني؛ وبعد خلافات مع Cubatabaco ومشكلات في السحب والاحتراق، توقّف إنتاج Davidoff في كوبا عام 1991، مع اتفاق ينص على تصريف المخزون المتبقي قبل نهاية 1992. وتكتب ويكيبيديا أن Zino Davidoff وCubatabaco قرّرا معًا إنهاء علاقتهما بعد خلافات كثيرة حول الجودة والحقوق، وأن الانفصال أُضفي عليه طابع رسمي في 1990-1991؛ ويكتب تاجر التجزئة Holt''s أن Zino كان قد فسخ العلاقة في 1991 ونقل الإنتاج كله إلى الجمهورية الدومينيكية، محتجًّا بفقدان مراقبة الجودة. ولا تؤرّخ الدار في تسلسلها الزمني إلا اللفّ الدومينيكي، ابتداءً من 1991.

ثم اتّسع الكتالوج: فقد استحوذت المجموعة في 2007 على الحقوق الحصرية لاسم Winston Churchill لسيجار، وأُطلق الخط في مايو 2008؛ وصدر Davidoff Nicaragua تحت حلقة سوداء في 2013؛ وصدر Yamasá، ثالث سيجار Davidoff بحلقة سوداء، بغلاف خارجي ورابط دومينيكيين، في 2016.

وفي 2021 احتفلت الدار بثلاثين عامًا من الإنتاج الدومينيكي (1991-2021)، وتربطها ببداية فلسفتها «Crop-to-Shop»؛ وفي 2025 يُفترض أن يتيح توسيع الموقع مضاعفة الإنتاج السنوي من السيجار الملفوف يدويًا، ويضمّ مركزًا للتوليف مساحته 1 700 متر مربع.'
 WHERE `name` = 'Davidoff' AND SHA1(TRIM(`history`)) = '0408b14ed3f9fe7ba7c5e69876e399eb1965460f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Davidoff' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '0408b14ed3f9fe7ba7c5e69876e399eb1965460f';
-- brands|Diplomáticos|history|ar — اسم مصنع بالأحرف اللاتينية
UPDATE `brands` SET `history_ar` = 'تولد Diplomáticos عام 1966، كما تكتب الصحافة المتخصّصة (2025) وويكيبيديا، بديلاً أرخص من Montecristo؛ ولا تؤرّخها Habanos إلا بالستينيات. وتعطيها ويكيبيديا خلطة ألطف قليلاً وغلافاً أفتح لوناً لإرضاء المستهلك الفرنسي. وكانت المقاسات الخمسة الأصلية (No. 1 إلى 5) تعيد مقاسات Montecristo No. 1 إلى 5؛ أمّا No. 6 وNo. 7، اللذان أُضيفا عام 1976 على مقاسات Montecristo Especial No. 1 وNo. 2، فقد أُسقطا في منتصف الثمانينيات.

تصنع المقارنة بـ Montecristo هوية العلامة: مقاسات مرقّمة مثل مقاساتها، بسعر أدنى قليلاً من سعر المقاس المماثل، كما تقول ويكيبيديا. وتكتب الصحافة المتخصّصة إنّها لم تبلغ قط سمعة Montecristo.

تصف Habanos سيجار Habano بقوة متوسطة إلى شديدة، ملفوفاً يدوياً بالكامل بحشوة طويلة، بغلاف وحشوة من منطقة Vuelta Abajo في Pinar del Río. وتعطي ويكيبيديا No. 2، وهو هرمي الشكل، بمقاس 6 1/8 بوصة على عيار 52 (156 مم).

تكتب الصحافة المتخصّصة في أكتوبر 2025 أنّ المقاسات قُلّصت مع الوقت وأنّ No. 2 وحده يبقى في التشكيلة الجارية؛ وتقدّم Cancilleres (5 1/8 بوصة على عيار 50، علبة من 25، أُطلق في صوفيا نهاية نوفمبر 2025) على أنّه أول مقاس جديد من الإنتاج المنتظم منذ عقود. وتظهر العلامة أيضاً في الإصدارات الإقليمية: Excelencia لكوبا (2015)، وReserva Especial لمنطقة الكاريبي وأمريكا الوسطى (2021)، وLeal لكوبا (2023).

أين تُلفّ؟ في كوبا للسؤال جواب من طابقين. منذ 2002 لكلّ علامة من علامات Habanos مصنع أمّ، مسؤول عن اختيار الأوراق والخلطة، ويمكن أن يُلفّ سيجارها في أيّ من عشرات المصانع في الجزيرة تحت إشراف الأمّ؛ ولا تنشر Habanos هذه الخريطة، بل تعيد الصحافة المتخصّصة تركيبها. لا تسمّي Habanos أيّ مصنع. ويكتب تقرير للصحافة المتخصّصة (2011) أنّ مصنع Romeo y Julieta / H. Upmann في بيلاسكوين مكلّف بالعلامة، لكن لم يكن يُلفّ فيه أيّ Diplomáticos في مايو؛ وتقول ويكيبيديا إنّها تُصنع في مصنع José Martí في هافانا. في أكتوبر 2026 تصنّفها habanos.com ضمن العلامات الثلاث عشرة الأخرى من محفظة السبع والعشرين، خارج العلامات العالمية الست وعلامات القيمة الخمس وعلامات الحجم الثلاث؛ وكانت الصحافة المتخصّصة تحصي عام 2019 إحدى وعشرين علامة في المحفظة، وDiplomáticos في فئة الأخرى. تصفها الصفحة الرسمية بأنها حديثة نسبياً، من الستينيات، شديدة الشبه بـ Montecristo ومقاساتها تُسمّى بأرقام لا بأسماء؛ ولا تسمّي مصنعاً ولا مقاساً.'
 WHERE `name` = 'Diplomáticos' AND SHA1(TRIM(`history`)) = '8ec728b301db2b4738dce64e7bdcb69a43c0b4c4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Diplomáticos' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '8ec728b301db2b4738dce64e7bdcb69a43c0b4c4';
-- brands|Don Diego|history|ar — صيغة التفضيل مستبدلة
UPDATE `brands` SET `history_ar` = 'ينتمي Don Diego إلى الموجة الأولى — موجة العلامات التي أُنشئت بعد 1960 لتحلّ، في السوق الأميركية، محلّ الهافانات التي صارت بعيدة المنال. أُقيم الإنتاج أولاً في جزر الكناري، ثم انتقل إلى الجمهورية الدومينيكية حيث بقي.

وهذا الأصل يفسّر طابعه. كان المطلوب سيجاراً لطيفاً منتظماً بغلاف فاتح، قادراً على طمأنة مدخّنين حُرموا من معالمهم: أُلِّف Don Diego لذلك ولم يحد عنه قطّ. أرز ولوز ونعومة قشدية واحتراق سهل — سيجار لا يطلب من أحد شيئاً.

طوال عقدين كان علامة رائجة مبيعاً في الولايات المتحدة، قبل أن تُنزله موجةُ الخلطات القوية في التسعينيات إلى مرتبة الكلاسيكي الذي عفا عليه الزمن. ومع ذلك لم يتغيّر، ما يجعله اليوم شاهداً مفيداً: يمكنك أن تتذوّق فيه ما كانت السوق تسمّيه سيجاراً جيداً قبل أن تصير القوّة حجّة.

ولا تزال العلامة تُوزَّع عبر مجموعة كبرى، بلا جهد تواصلي خاص — وهذا جيد تماماً.

اسم Playboy هو اسم المجلة، وليس اسم الشركة. أُطلق Playboy by Don Diego في عام 1996 خلال فعالية في Playboy Mansion؛ ثم صار لدى Playboy بعد ذلك سيجار باسمه الخاص، منه سلسلة، قُدّمت في 25 مايو 2009، تصنّفها Cigarworld ضمن جمهورية الدومينيكان، مصنوعة بالكامل يدويًا.'
 WHERE `name` = 'Don Diego' AND SHA1(TRIM(`history`)) = '0eb85869b0f41f30d23ad3f043d73c545d1a1c86';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Diego' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '0eb85869b0f41f30d23ad3f043d73c545d1a1c86';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Drew Estate' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '35c2f9c6ed90db9f11375e431d992cd21e7e3041';
-- brands|E.P. Carrillo|history|ar — تعديل صيغة المقارنة
UPDATE `brands` SET `history_ar` = 'كان Ernesto Perez-Carrillo قد أنهى مسيرة كاملة حين أسّس الدار التي تحمل الأحرف الأولى من اسمه. وُلد في كوبا، وتسلّم في ميامي مصنع العائلة الصغير El Crédito، وأحيا فيه علامة نائمة: La Gloria Cubana. وبلغ النجاح حدّاً اضطرّ معه الإنتاج، الذي بدأ في ورشة بهافانا الصغيرة، إلى الانتقال إلى الجمهورية الدومينيكية، فاشترت مجموعة General Cigar المشروع كلّه في أواخر التسعينيات.

كان بوسعه أن يتوقّف عند ذلك. لكنه، بعد الستين، غادر المجموعة وبدأ من جديد، مع ولديه، في مصنع حديث بسانتياغو. وهي حالة نادرة في هذه المهنة: خبير خلطات معترف به ينطلق من الصفر دون اسم علامة يعيد استخدامه، مراهناً على أن توقيعه يكفي.

أسلوب الدار قابل للتمييز — طابع متوسط إلى قوي، شديد الإحكام، تشعر فيه بالعمل على النِّسب لا باستعراض القوّة. ويبقى الإنتاج متواضعاً بمقاييس المجموعات الكبرى، وهذا مقصود.

لفّت الدار الطبعة الثالثة من Black Swan، وهي سلسلة تملكها شركة CigarPage الأمريكية للتجزئة، وتُسنَد كلّ طبعة منها إلى مصنع مختلف. وتخرج هذه الطبعة من الجمهورية الدومينيكية، بينما تأتي الثلاث الأخرى من نيكاراغوا وهندوراس. سبقتها Oliva وRocky Patel، وتبعتها Joya de Nicaragua. والاسم لا يخصّ أيًّا من الدور الأربع: إنّه طلبيّة، لا علامة للدار.

هناك اسمان آخران يمرّان عبر Casa Carrillo، وهو الاسم الذي تحمله Tabacalera La Alianza منذ فبراير 2024، دون أن يكونا من الشركة. Gilbert de Montsalvat هي علامة Raymondo Bernasconi (The Royal Cigar Company، بازل)، أُطلقت رسميًا في 1 أبريل 2008؛ وبحسب Zigarren.Zone، يُلَفّ إصدار 15 Years (يونيو 2024) هناك على توليفة Ernesto Perez-Carrillo، بينما يخرج خط Signature (2023) من Tabacalera Diaz Cabrera لدى Eladio Diaz. تعود ملكية Conspiracy إلى Quality Importers Trading Company؛ وبدأ الشحن في أغسطس 2024. EPC هو الاختصار الذي تصنّف به Cigarworld كتالوج الشركة.'
 WHERE `name` = 'E.P. Carrillo' AND SHA1(TRIM(`history`)) = 'ed7b2a21999f2ccb592929c1944d6a82fd99b14e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'E.P. Carrillo' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'ed7b2a21999f2ccb592929c1944d6a82fd99b14e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Rey del Mundo' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'b12e53128e0e6ed7508ab9a8bc5bc0571d308707';
-- brands|El Titan de Bronze|history|ar — صيغ التفضيل مستبدلة
UPDATE `brands` SET `history_ar` = 'في شارع كايي أوتشو، بهافانا الصغيرة، تعمل حفنة من اللافّين خلف واجهة زجاجية، يدوياً، على بُعد أمتار من المارّة. El Titan de Bronze من آخر مصانع السيجار العاملة في ميامي، ومن الظاهرة للعيان على الأرجح: إذ يمكنك أن ترى اللفّ يجري أمامك.

وهذا مهمّ للأطلس. فبعد 1960 كانت ميامي عاصمة المنفى الكوبي وملاذ اللافّين الذين غادروا الجزيرة؛ عملت فيها عشرات الورش، اختفى معظمها. وما تبقّى يتّسع لعناوين قليلة، وهذا العنوان ما زال يدرّب لافّين على الطرائق الكوبية — يدوياً بالكامل، دون قالب ميكانيكي للأشكال الدقيقة الصنع.

تلفّ الدار سلاسلها الخاصة، وتنتج أيضاً بدفعات صغيرة جداً لعلامات تريد سيجاراً مصنوعاً في الولايات المتحدة. الكمّية زهيدة بمقياس المهنة؛ أمّا القيمة التراثية فليست كذلك.

Altezas Reales 1871 هي علامة Rafael Cifuentes III، ابن حفيد Ramón Cifuentes Llano، المالك السابق لمصنع Partagás. قُدّمت في سبتمبر 2023 في Dadeland بولاية فلوريدا، وتُلَفّ في ميامي في هذا المصنع: غلاف خارجي Habano من الإكوادور على رابط وحشوة من نيكاراغوا، بمقاسات Robusto وCorona وToro، مع إنتاج معلن قدره 1 000 علبة لكل مقاس. يقول Cifuentes إنه استلهم Partagás من عقد 1990، وخاصةً Serie D No. 4؛ ويوزّع العلامة عبر شركته Flor de Tabacos La Lealtad. وفي أكتوبر 2026 تعرض Luxury Cigar Club جميع المقاسات على أنها نافدة.'
 WHERE `name` = 'El Titan de Bronze' AND SHA1(TRIM(`history`)) = 'c0cd0a224095a2b0d1867fb0ef2675ccb06c4f7e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Titan de Bronze' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'c0cd0a224095a2b0d1867fb0ef2675ccb06c4f7e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Excalibur' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '037aab664d5e203968eda281d8b796bb007ba6a6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fonseca' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'd4be418515eb10180ed1ba88713bea944d579d1a';
-- brands|Foundation Cigar Company|history|ar — صيغة التفضيل مستبدلة
UPDATE `brands` SET `history_ar` = 'أمضى Nicholas Melillo نحو عشر سنوات في انتقاء التبغ لأحد بيوت إستيلي الكبرى قبل أن يؤسّس بيته. وهذا المسار يفسّر موقع Foundation: فالعلامة لا تقدّم نفسها كمغامرة هاوٍ جامع، بل كعمل رجل عرف الحقول والمواسم والتخمير من الداخل.

أمّا El Güegüense، خلطته التأسيسية لعام 2015، فكانت تحمل اسم مسرحية شعبية نيكاراغوية، هجائية من زمن الاستعمار تناقلتها الأفواه قروناً وأُدرجت في التراث الثقافي غير المادي للإنسانية. والاختيار يقول شيئاً عن طموح الدار: أن تُجذِّر سيجاراً في ثقافة، لا في تربة فحسب.

وتنطلق Charter Oak، السلسلة الأخرى، من الطرف المقابل — وادي كونيتيكت، حيث نشأ Melillo وحيث ينمو غلاف شائع الاستعمال في المهنة. دار نيكاراغوية تدّعي جذراً شمالياً: أمر نادر، ومقصود.

في مارس 2024 أعلنت Foundation أن اسم El Güegüense يتوارى: تحلّ The Wise Man Corojo محل أول توليفة، بعد إعادة صنعها، وينتقل الإنتاج من Aganorsa Leaf إلى My Father Cigars S.A.، التي يديرها Pepín García. وكان اسم The Wise Man يعود إلى يوليو 2017: فقد استُخدم في البداية للنسخة Maduro. وفي أكتوبر 2026 يعرض موقع الشركة The Wise Man Corojo بغلاف خارجي corojo ''99 نيكاراغوي، بأربعة مقاسات، من Corona إلى Doble Corona.'
 WHERE `name` = 'Foundation Cigar Company' AND SHA1(TRIM(`history`)) = 'c7d22b0095089bc2786258b44ce4428591ef60bc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Foundation Cigar Company' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'c7d22b0095089bc2786258b44ce4428591ef60bc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'General Cigar' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '48b02cefa436d25c4b625c8340f4751688b72eb1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'H. Upmann' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '5ff9e27abff78c0f1e287749fb28fc43ee9804fa';
-- brands|Hoyo de Monterrey|history|ar — nom propre en alphabet latin
UPDATE `brands` SET `history_ar` = 'يعود أصل Hoyo de Monterrey إلى المزرعة التي تحمل الاسم نفسه في San Juan y Martínez بمنطقة Vuelta Abajo، بحسب habanos.com، التي لا تذكر سنة تأسيس للعلامة. وتربط ويكيبيديا الاسم بأرض مقعّرة يبحث عنها مزارعو التبغ، وتربطه الصحافة المتخصّصة بحوض Monterrey. وقد سُجّلت العلامة عام 1865 على يد José Gener، كما تقول ويكيبيديا والصحافة المتخصّصة. وتذكر ويكيبيديا أنه هاجر من إسبانيا في الثالثة عشرة، عام 1831، وفتح مصنعًا في هافانا، ثم اشترى بأرباحه ضيعة تبغ في Vuelta Abajo قبل أن يسجّل العلامة؛ وتسمّيه الصحافة المتخصّصة كوبيًّا وتؤرّخ شراء المزرعة بعام 1860.

وتكتب ويكيبيديا أنّ العلامة نالت شعبية، ولا سيما في السوق البريطانية؛ وأنّ José Gener توفي عام 1900، وأنّ ابنته Lutgarda أدارت العمل بعده نحو ثلاثين عامًا؛ وأنّ شركة Fernández, Palicio y Cía اشترت عام 1931 العلامتين Hoyo de Monterrey وLa Escepción، وضمّتهما إلى محفظة كانت تضمّ أصلًا Punch وBelinda.

وتكتب ويكيبيديا أنّ الحكومة الثورية أمّمت مصانع السيجار عام 1959، وأنّ Fernando Palicio غادر كوبا إلى فلوريدا وباع علاماته إلى عائلة Villazon؛ وتصنع General Cigar اليوم Hoyo de Monterrey هندوراسيًّا، وهو سيجار آخر. أمّا Hoyo de Monterrey الكوبي فهو سيجار Habanos S.A.، التي تصفه بأنه علامة خفيفة القوة، من أوراق Vuelta Abajo، تُلفّ يدويًّا بحشوة طويلة.

تجمع تشكيلة Epicure، بحسب habanos.com، بين Epicure No. 1 وEpicure No. 2 وEpicure Especial، بعرض مميّز؛ وكان Epicure Especial Edición Limitada سنة 2004 قبل أن يدخل المحفظة الدائمة سنة 2008، ويجعل بلاغ صدر في ديسمبر 2024 من Epicure No. 3 (cepo 54 x 125 mm، أول figurado للعلامة) القياس الرابع في التشكيلة. وفي أكتوبر 2016 كتب موقع habanos.com عن Epicure No. 2 Reserva Cosecha 2012 أنه رمز العلامة.

Epicure de Luxe إنتاج خاص من عام 2012، مخصّص لشبكة La Casa del Habano: vitola de galera Mágicos، cepo 52 x 115 mm، علبة من 10، بحسب موقع habanos.com (بلاغ 2 أكتوبر 2012). أمّا Grand Epicure، وهو Edición Limitada لعام 2013، فيبلغ طوله 130 mm بـcepo 55 (أوراق معتّقة سنتين على الأقل)، ويقول موقع habanos.com إنّ Monterreyes No. 4، وهو Edición Limitada لعام 2023 (cepo 55 x 145 mm)، هو السابع للعلامة منذ Epicure Especial لعام 2004.

أين تُلفّ؟ في كوبا للسؤال جواب من طابقين. منذ 2002 لكلّ علامة من علامات Habanos مصنع أمّ، مسؤول عن اختيار الأوراق والخلطة، ويمكن أن يُلفّ سيجارها في أيّ من عشرات المصانع في الجزيرة تحت إشراف الأمّ؛ ولا تنشر Habanos هذه الخريطة، بل تعيد الصحافة المتخصّصة تركيبها. مصنعها الأمّ هو La Corona — مصنع Miguel Fernández Roig — في شارع 20 de Mayo بحيّ سيرو، وهو مصنع سجائر سابق حُوّل إلى مصنع سيجار عام 2000، بحسب الصحافة المتخصّصة التي تجعله أيضًا المصنع الأمّ لـCuaba وPunch. وفي أكتوبر 2026 تصنّف صفحة «The Habanos Brands Academia» على habanos.com علامة Hoyo de Monterrey ضمن علامات Habanos العالمية الستّ، إلى جانب Cohiba وMontecristo وRomeo y Julieta وPartagás وH. Upmann، في محفظة من 27 علامة؛ وتؤرّخ الصحافة المتخصّصة هذا التصنيف بتاريخ 1 أغسطس 2019، وتقول إنّ هذه العلامات تُباع في جميع الأسواق التي يوجد فيها سيجار كوبي. تقول الصفحة الرسمية لـPunch إنّه في 1931 انتقلت Punch إلى المصنع الذي كانت تُصنع فيه Hoyo de Monterrey، وهي شراكة دائمة، وإنّ العلامتين تُنتجان في La Corona؛ وتكتب نسختها الإسبانية أنّه في 1931 انتقلت Punch إلى مصنع La Corona، حيث تُصنع مع Hoyo de Monterrey. ويحمل باب المزرعة الأصلية في San Juan y Martínez نقش Hoyo de Monterrey، José Gener، 1860، بحسب habanos.com — قبل تسجيل العلامة بخمس سنوات، وهو مؤرَّخ بعام 1865.'
 WHERE `name` = 'Hoyo de Monterrey' AND SHA1(TRIM(`history`)) = 'a990410a4552e412eecc823ea387211417074557';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Hoyo de Monterrey' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'a990410a4552e412eecc823ea387211417074557';
-- brands|J.C. Newman|history|ar — marques et noms en latin
UPDATE `brands` SET `history_ar` = 'J.C. Newman أقدم شركة سيجار عائلية لا تزال تعمل في الولايات المتحدة. لفّ Julius Caeser Newman، المهاجر المجري، أولى سيجاراته سنة 1895 في حظيرة والديه بكليفلاند. وبعد أربعة أجيال، ما زالت العائلة تمسك بالدار — حالة فريدة في صناعة اشترت فيها المجموعاتُ الكبرى كلَّ الأسماء التاريخية تقريباً.

في 1954 انتقلت الشركة إلى تامبا بفلوريدا، إلى مصنع من الآجرّ بُني سنة 1910 وتعلوه ساعة: El Reloj. والمبنى آخر ورشة سيجار كبرى لا تزال تعمل في «إيبور سيتي»، الحيّ الذي كان ينتج مطلع القرن العشرين مئات الملايين من السيجار سنوياً، والذي كان يُسمّى آنذاك عاصمة السيجار في العالم.

ويضمّ El Reloj اليوم آلات لفّ من ثلاثينيات القرن الماضي، لا تزال في الخدمة، تنتج سيجاراً بطريقة لم يعد أحد يستخدمها. وقد جعلت الدار من هذه الاستمرارية موضوعها: تفتح المصنع للزوار وتوثّق آلاتها بوصفها تراثاً صناعياً.

علامتاها الراقيتان، Diamond Crown وCuesta-Rey، تخرجان من Tabacalera A. Fuente في الجمهورية الدومينيكية؛ ولكلٍّ منهما بطاقتها في هذا الأطلس، وهي مصنّفة هناك لهذا السبب بالذات. لكنّ العائلة تلفّ بنفسها أيضًا، وكانت نسخة أولى من هذه البطاقة تقول العكس: فمنذ 2011 تملك في إستيلي مصنعًا، PENSA — Puros de Estelí Nicaragua S.A. —، افتُتح بـQuorum وEl Baton، ثم تبعتهما Perla del Mar فBrick House، ويلفّ ما يزيد على مئة ألف سيجار في اليوم. ويشارك في إدارته Omar Ortez، الذي يروي هذا الأطلس Agrotabacos الخاصة به، مع Lázaro López. أمّا El Reloj فيبقى في تامبا.'
 WHERE `name` = 'J.C. Newman' AND SHA1(TRIM(`history`)) = '5ece0eda6f0fb41e52e5a70b1d3ee3b185e930d9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'J.C. Newman' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '5ece0eda6f0fb41e52e5a70b1d3ee3b185e930d9';
-- brands|José L. Piedra|history|ar — noms propres en latin
UPDATE `brands` SET `history_ar` = 'في أكتوبر 2026 تصنّف habanos.com علامة José L. Piedra، مع Quintero وVegueros، ضمن ثلاث علامات تسمّيها علامات الحجم في محفظتها.

تربط Habanos العلامة بعائلة Piedra، التي جاءت من أستورياس في ثمانينيات القرن التاسع عشر واستقرّت قرب سانتا كلارا، في قلب منطقة ريميديوس، حيث يُزرع التبغ منذ القرن السادس عشر. بحسب habanos.com، المقاسات السبعة مصنوعة من تبغ ريميديوس، ملفوفة يدويًا بالكامل بحشوة قصيرة (tripa corta). وتقدّم الدار صورة أحدث؛ ويعتمدها Petit Caballeros بالفعل، في عبوة من اثنتي عشرة قطعة وفي حامل عرض من خمسة عشر علبة صغيرة من ثلاث سيجارات.

تذكر Habanos أن القوة متوسطة إلى شديدة.

يؤرّخ بعض تجّار التجزئة العلامة بثمانينيات القرن التاسع عشر، ويقولون إنها سُحبت في مطلع التسعينيات ثم أُعيد إطلاقها سنة 1996 (Puroexpress وCigar Keep)؛ ولا تذكر habanos.com أيًّا من هذه التواريخ.

أين تُلفّ؟ في كوبا للسؤال جواب من طابقين. منذ 2002 لكلّ علامة من علامات Habanos مصنع أمّ، مسؤول عن اختيار الأوراق والخلطة، ويمكن أن يُلفّ سيجارها في أيّ من عشرات المصانع في الجزيرة تحت إشراف الأمّ؛ ولا تنشر Habanos هذه الخريطة، بل تعيد الصحافة المتخصّصة تركيبها. لا تسمّي habanos.com أي مصنع للعلامة؛ ويضع أحد تجّار التجزئة (Puroexpress) الإنتاج في سانتا كلارا. في أكتوبر 2026 تصنّف habanos.com علامات José L. Piedra وQuintero وVegueros ضمن علامات الحجم الثلاث من علاماتها السبع والعشرين؛ وأعلنت الصحافة المتخصّصة هذه المجموعة في 1 أغسطس 2019، لمحفظة كانت حينها من إحدى وعشرين علامة. تقول الصفحة الرسمية إنّ عائلة Piedra وصلت من أستورياس في ثمانينيات القرن التاسع عشر واستقرّت قرب سانتا كلارا، وإنّ العلامة أسّسها الجيل الثاني، José Lamadrid Piedra. والمجموعة كلّها حشوة قصيرة ملفوفة يدويًّا بتبغ ريميديوس وحده.'
 WHERE `name` = 'José L. Piedra' AND SHA1(TRIM(`history`)) = '857ff0f3a83596a87e87bb6a556198c3ef2eaa0c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'José L. Piedra' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '857ff0f3a83596a87e87bb6a556198c3ef2eaa0c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Joya de Nicaragua' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'de6b9de102a70fe1300cafba39839b45a7025788';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Juan López' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'c7d8fc1ed352220c9ef05c0850a4b2f91620b69f';
-- brands|La Aurora|history|ar — marque et nom en latin
UPDATE `brands` SET `history_ar` = 'La Aurora أقدم مصنع سيجار في الجمهورية الدومينيكية، وواحدة من الدور القليلة في القطاع التي بقيت في يد العائلة التي أسّستها. افتتحها Eduardo León Jimenes عام 1903 في سانتياغو دي لوس كاباييروس، في قلب وادي سيباو — الإقليم الذي سيصير، بعد ثلاثة أرباع قرن، مركز الإنتاج الدومينيكي الفاخر.

لهذه الأسبقية وزنها. فحين حوّل نزوح الصنّاع الكوبيين بعد 1960 البلد إلى عاصمة للسيجار، كانت La Aurora هناك منذ ستين عامًا، بحقولها ومجفّفاتها ولافّيها الذين تدرّبوا في المكان. لم تكن الدار بحاجة إلى أن تحلّ: بل استقبلت.

ويظهر ذلك في الأسلوب. بينما بحث كثير من الدومينيكيين عن النعومة، حافظت La Aurora على طابع متوسط أمتن، مبنيّ غالبًا على أغلفة كاميرونية — توقيع تمسّكت به حين انصرفت عنه الموضة. نكهات خشب متبّل وبندق محمّص وجلد فاتح.

تغطي التشكيلة اليوم عدة عائلات، من سيجار كل يوم إلى سلاسل الذكرى التي تصدرها الدار مع كل عقد يكتمل. وكانت المئوية، عام 2003، منعطفًا: منذ ذلك الحين عُرفت La Aurora خارج سوقها المحلية.

Tatiana لا تعود إلى La Aurora: فهي علامة السيجارات المنكّهة لدى Miami Cigar & Co.، سُمّيت نسبةً إلى ابنة مؤسسيها وصدرت في 1998 بحسب الشركة. وفي مايو 2024 يكتب موقع أخبار السيجار أن La Aurora تنتج توليفة Tatiana Delights، دون نكهة مضافة سوى طرف محلّى، بمقاسات Robusto وToro وChurchill. وفي أغسطس 2026 كانت تُشحن إلى تجار التجزئة الأمريكيين مقاسات جديدة Cappuccino وAmaretto، بمقاس 6 x 44 وفي tins من عشرة.'
 WHERE `name` = 'La Aurora' AND SHA1(TRIM(`history`)) = '12681ad871698de7abb252ca26fe7b19371aa65b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Aurora' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '12681ad871698de7abb252ca26fe7b19371aa65b';
-- brands|La Flor de Cano|history|ar — marque en alphabet latin
UPDATE `brands` SET `history_ar` = 'La Flor de Cano هي العلامة التي يُنسى ذكرها عند تعداد المحفظة الكوبية.

تقول Habanos في بيان صدر في 26 مارس 2015 إنها علامة كوبية تاريخية يعود أصلها إلى 1884، من دون أن تسمّي مؤسِّسًا. ويقول تاجرا تجزئة بريطانيان إنها تعود إلى عام 1932 وتُنسب إلى Juan Cano، ويحدّد أحدهما أنه Juan Cano Sainz وزوجته Consuela، اللذان كانا يجعلان السيجار يُلفّ على طاولة مطبخهما: والروايتان متباينتان. ويكتب تاجر تجزئة بريطاني إنّ القياسات الجارية ظلّت مدّة طويلة تُصنع بالآلة، ثم إنّ السيجار يُصنع اليوم بالكامل باليد. وتقدّم Habanos من جهتها المجموعة على أنها ملفوفة كليًّا باليد، بحشوة قصيرة، مع قياس Elegidos، وقد أصدرت العلامة إصدارات إقليمية: Short Robusto للمملكة المتحدة (2010)، وSiboney لكندا (2015)، وSelectos No.3 للمملكة المتحدة (2023).

يقول تاجر تجزئة بريطاني إنها يصعب العثور عليها، لأنّ الإنتاج محدود. وتعطيها Habanos قوة متوسطة، بتبغ من منطقة Vuelta Abajo؛ ويذكر تجار التجزئة أيضًا تبغًا من Vuelta Abajo ومن Semi Vuelta.

يذكر تاجر تجزئة لإصدار Selectos No.3 لعام 2023 كمية إصدار قدرها 125 000 سيجار في 5 000 علبة من 25؛ وتذكر Habanos لـSiboney (2015) 2 000 علبة من 25.

أين تُلفّ؟ في كوبا للسؤال جواب من طابقين. منذ 2002 لكلّ علامة من علامات Habanos مصنع أمّ، مسؤول عن اختيار الأوراق والخلطة، ويمكن أن يُلفّ سيجارها في أيّ من عشرات المصانع في الجزيرة تحت إشراف الأمّ؛ ولا تنشر Habanos هذه الخريطة، بل تعيد الصحافة المتخصّصة تركيبها. تسمّي الصحافة المتخصّصة (2011) La Corona (مصنع Miguel Fernández Roig في حيّ سيرو) مصنعًا أمًّا لـFlor de Cano؛ ولا تسمّي Habanos أيّ مصنع. ويقول تجار تجزئة إنّ Short Robusto لعام 2010 لُفّ في La Corona، وإنّ Selectos No.3 (2023) لُفّ في مصنع El Caney في سانتياغو دي كوبا، تحت إشراف La Corona. وفي أكتوبر 2026 تدرج habanos.com العلامة ضمن 13 علامة أخرى من المحفظة (21 علامة في المحفظة، و27 في المجموع مع العلامات العالمية الـ6). لا تعطي الصفحة الرسمية للعلامة تاريخًا ولا مؤسِّسًا؛ وتقول إنّ المجموعة، بما فيها Elegidos، ملفوفة كليًّا باليد بحشوة قصيرة، متوسطة القوة، بتبغ من Vuelta Abajo. ويبقى تباين: يقول بيان Habanos لعام 2015 إنّ Siboney بحشوة طويلة.'
 WHERE `name` = 'La Flor de Cano' AND SHA1(TRIM(`history`)) = '46249bd9bf4b6bfee0e7ff078034a32bce954f4f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Flor de Cano' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '46249bd9bf4b6bfee0e7ff078034a32bce954f4f';
-- brands|La Gloria Cubana|history|ar — incohérence terme, nom latin
UPDATE `brands` SET `history_ar` = 'تقول Habanos إنّها تأسّست سنة 1885، وإنّها joya poco conocida في محفظتها، ولها ما يزيد على مئة عام من التاريخ. وبحسب ويكيبيديا أنشأتها Sociedad Cabañas y Castro؛ واشتراها José F. Rocha عام 1905 وصنعها في شارع Miguel بهافانا؛ ويتحدّث تاجر تجزئة بريطاني بالأحرى عن José Rocha وRafael García. وتكتب Habanos أنّ العلامة تتميّز بتقديم أنيق، لا سيّما في سلسلة Médaille d''Or. وتسرد ويكيبيديا أربعة من Médaille d''Or، من No. 1 (7 1/4 بوصات على cepo 36) إلى No. 4 (6 بوصات على cepo 32)، إضافة إلى Taíno (7 بوصات على cepo 47).

Médaille d''Or No. 4 هو Palmita بطول 6 بوصات على cepo 32 (152 مم)؛ أمّا Dalia فهو No. 2، بطول 6 3/4 بوصات على cepo 43 (171 مم)، وتصفه ويكيبيديا بأنه مطلوب بصورة خاصة. وتذكر Habanos قوة متوسطة وسيجاراً ملفوفاً كلّه يدوياً بحشوة طويلة، مع حشوة ورابط من منطقة Vuelta Abajo؛ ويكتب تاجر تجزئة بريطاني أنّ مذاقها يُحكم عليه غالباً بأنه مالح، لا سيّما بعد التعتيق.

بحسب ويكيبيديا، اشترت عائلة Cifuentes العلامة بعد وفاة Rocha عام 1954؛ وبعد الثورة توقّف الإنتاج سنوات عدّة، ثم استؤنف نحو 1965 في مصنع Partagás. وتوجد علامة غير كوبية بالاسم نفسه: تقول ويكيبيديا إنها تُصنع في الجمهورية الدومينيكية على يد El Credito لحساب General Cigar، وتروي الصحافة المتخصّصة (2001) أنّ عائلة Perez-Carrillo كانت تلفّ في ميامي عام 1976 تحت هذا الاسم قليل الشهرة، قبل أن تبيع عام 1999 إلى Swedish Match. ولا يتناول الأطلس هنا سوى علامة Habanos الكوبية.

تقول ويكيبيديا إنها تُنتَج بكميات صغيرة ويقدّرها العارفون؛ وتسرد أيضاً إصدارات إقليمية، منها Deliciosos لكوبا (2009)، وInmensos المخصّص لـ Casas del Habano (2010).

أين تُلفّ؟ في كوبا للسؤال جواب من طابقين. منذ 2002 لكلّ علامة من علامات Habanos مصنع أمّ، مسؤول عن اختيار الأوراق والخلطة، ويمكن أن يُلفّ سيجارها في أيّ من عشرات المصانع في الجزيرة تحت إشراف الأمّ؛ ولا تنشر Habanos هذه الخريطة، بل تعيد الصحافة المتخصّصة تركيبها. ولا تسمّي Habanos أيّ مصنع. ويضع تقرير للصحافة المتخصّصة (2011) La Gloria Cubana في مصنع Partagás، المسمّى أيضاً Francisco Pérez Germán، شارع Industria 520، في Centro Habana؛ ويكتب تقرير آخر (2016) أنّ مصنع Partagás الجديد، عند ناصية شارع San Carlos، يلفّها هو أيضاً، وأنّ القديم لم يعد يلفّها. في أكتوبر 2026 تصنّفها habanos.com ضمن العلامات الثلاث عشرة الأخرى من محفظة من سبع وعشرين علامة، خارج العلامات العالمية الستّ وعلامات القيمة الخمس وعلامات الحجم الثلاث؛ وصنّفتها الصحافة المتخصّصة عام 2019 في فئة الأخرى، من بين إحدى وعشرين علامة في المحفظة. تقول الصفحة الرسمية إنّها تأسّست سنة 1885، قليلة الشهرة ولها أتباع أوفياء، كلّها بحشوة طويلة، وتبرز تقديم سلسلة Medaille d''Or. وبحسب الصحافة المتخصّصة (2011، 2016) يلفّ مصنع Partagás أيضاً Bolívar وRamón Allones وQuai d''Orsay.'
 WHERE `name` = 'La Gloria Cubana' AND SHA1(TRIM(`history`)) = 'e09e0293e7b7719473f576dd98f03ba81d256a17';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Gloria Cubana' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'e09e0293e7b7719473f576dd98f03ba81d256a17';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Liga Privada' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'e49b5a4be81ca18ee5fe3bec70f95cba4b9a05c3';
-- brands|Macanudo|history|ar — صيغة التفضيل مستبدلة
UPDATE `brands` SET `history_ar` = 'تنحدر Macanudo من جامايكا. وبحسب صحافة القطاع، كانت علامة صغيرة تُلفّ يدويًا في مصنع Temple Hall في كينغستون للسوق البريطانية. وفي عام 1968 اشترت General Cigar Co. مصنع Temple Hall مع العلامة، وتشير صحافة القطاع إلى أن عمر Macanudo يتجاوز الخمسين عامًا التي احتُفل بها في 2018. لم يثبت تاريخ إنشاء العلامة؛ و1968 هو عام الشراء.

تُروى بقية القصة في روايتين. تكتب ويكيبيديا أنّ General Cigar أطلقت عام 1971 علامة Macanudo مستقلة، طُوّرت بإشراف Ramón Cifuentes، القادم من Partagás، لكنّ المقال نفسه يشير إلى مواضع تحتاج إلى توضيح. أمّا صحافة القطاع فتثبت أنّ General Cigar أغلقت Temple Hall عام 2000 ونقلت الإنتاج كله إلى جمهورية الدومينيكان؛ وخرج التبغ الجامايكي بعد ذلك من الخلطة. وتوفي Edgar M. Cullman Sr.، الذي أدار General Cigar عقودًا، في أغسطس 2011 عن 93 عامًا.

تبقى Café وجه العلامة: غلاف Connecticut Shade، ورابط مكسيكي من San Andrés، وحشوة مكسيكية ودومينيكية (piloto cubano)، بحسب صفحة الدار (macanudo.com، اطُّلع عليها في أكتوبر 2026). وتصفها صحافة القطاع بأنها السيجار الناعم الذي يقترن به اسم Macanudo.

تفتح Inspirado طريقًا آخر. أُطلقت التشكيلة في أوروبا عام 2014، ووصلت إلى الولايات المتحدة عام 2016 (Cigar Coop، مايو 2016) بإصدارات لونية مختلفة المنشأ: Orange ملفوفة في هندوراس، وBlack وWhite في جمهورية الدومينيكان، وRed ملفوفة في Estelí (نيكاراغوا) عام 2018، في الذكرى الخمسين للعلامة. وتقدّم الدار Inspirado بوصفها خلطة بالغة التعقيد والشدّة. وفي عام 2014 وصفت STG شركة General Cigar بأنها شركة تابعة مملوكة بالكامل لمجموعة Scandinavian Tobacco Group.'
 WHERE `name` = 'Macanudo' AND SHA1(TRIM(`history`)) = 'c7dcdeaf8659e7687b40ed5015414f5c28d48a5f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Macanudo' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'c7dcdeaf8659e7687b40ed5015414f5c28d48a5f';
-- brands|Matilde|history|ar — تعديل تعبير المقارنة
UPDATE `brands` SET `history_ar` = 'أدار José Seijas عقوداً مصنع لا رومانا، أحد أكبر مصانع القطاع — عشرات الملايين من السيجار سنوياً، ومسؤولية انتظامٍ قلّ من يقدّره. وأسّس Matilde سنة 2013، مع ولديه Ricardo وEnrique، بعد مغادرته ذلك المنصب.

ولا يأتي الاسم من العائلة بل من تاريخ البلد: فـTabacalera La Matilde كانت مصنعاً دومينيكياً عمل بين 1876 و1910. كان آل Seijas يبحثون عن اسم قديم يخصّ جزيرتهم لا عن لقب عائلي إضافي — فأحيوا ذاك.

وتباين المقياس هو موضوع الدار نفسه. فبعد أن أمضى مسيرته يضمن ثبات كميات صناعية، أنشأ Seijas علامةً ذات دفعات قصيرة، كل خلطة فيها من صنعه، ويعادل إنتاجها السنوي ما كان مصنعه السابق يُخرجه في يوم واحد.

ويحمل الأسلوب هذه الخبرة: سيجار محكم البناء، بتوازن دومينيكي كلاسيكي، وبانتظام تصنيع كان يفضح الرجل الذي يصنعه. توفّي José Seijas سنة 2024؛ ويحمل ولداه الدار.

تُوفّي José Seijas في نوفمبر 2024 عن أربعة وسبعين عامًا. كانت Consolidated Cigar قد وظّفته عام 1974 وهو ابن أربعة وعشرين، وهو الذي نقل مصنع لا رومانا في الثمانينيات من الآلة إلى اللفّ باليد.

ويدين له هذا الأطلس بما يفوق هذه البطاقة: فقد مزج أو أشرف على Montecristo الدومينيكيّ، وRomeo y Julieta الدومينيكيّ، وVegaFina، وH. Upmann الدومينيكيّ، وDon Diego. خمس علامات مُدرجة هنا تقوم، في جانب منها، على عمل الرجل نفسه — وMatilde وحدها هي التي تحمل اختياره هو.'
 WHERE `name` = 'Matilde' AND SHA1(TRIM(`history`)) = '97aee70e16dff0fa4dfe7cc979f6027628c5615f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Matilde' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '97aee70e16dff0fa4dfe7cc979f6027628c5615f';
-- brands|Mombacho|history|ar — noms latins, Granada, cohérence
UPDATE `brands` SET `history_ar` = 'تكاد كل مصانع نيكاراغوا تكون في إستيلي، في الشمال التبغي. أمّا Mombacho فاختارت العكس واستقرّت في غرانادا، المدينة الاستعمارية على ضفة بحيرة نيكاراغوا، عند سفح البركان الذي منحها اسمها. وليست هذه تفصيلة جغرافية: فالدار تلفّ حيث يمرّ المسافرون، في منزل قديم مفتوح للزوار، وقد جعلت من هذا الانفتاح جزءاً من خطابها.

أمّا التبغ فيأتي من الشمال كما عند الجميع — إذ لا أرض تبغية حول غرانادا. وما تدّعيه الدار في مكان آخر: دفعات قصيرة، ومصنع بمقياس إنساني، وعلاقة مباشرة بين المدخّن والورشة، على عكس مهنة لا يزور فيها المرء تقريباً المكان الذي وُلد فيه سيجاره.

وهي في هذا الأطلس المثال الأوضح على دارٍ تكمن أهمّيتها في المكان بقدر ما تكمن في المنتج.

لا بدّ من تسجيل ما جرى بعد ذلك. في 9 يونيو 2023 أعلن Cameron Heaps، مؤسّس Mombacho، وJared Michaeli، رئيس Favilli، الإغلاق النهائيّ للدار وانسحابهما من المهنة. وكان Claudio Sgroi، الرئيس وكبير المازجين، قد غادر عام 2021؛ أمّا المنزل الذي اشتُري عام 2014 فقد تحوّل إلى مكان ضيافة فاخر، ولم تستعد العلامة سوقها.

وهذه البطاقة إذن بطاقة أرشيف. فما تصفه — ورشة غرانادا، والزيارات، والدفعات القصيرة — قد وُجد، ولم يعد موجودًا.'
 WHERE `name` = 'Mombacho' AND SHA1(TRIM(`history`)) = '201ddd358975bd2704b6dba9d9de7ef6d18ab0a3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Mombacho' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '201ddd358975bd2704b6dba9d9de7ef6d18ab0a3';
-- brands|Montecristo|history|ar — سيجارات، La Romana، شارع
UPDATE `brands` SET `history_ar` = 'بحسب habanos.com، وُلدت Montecristo عام 1935 في مصنع H. Upmann في هافانا، بأوراق من فويلتا أباخو؛ ولا تذكر الصفحة مؤسسًا. وتختلف الروايات التي تذكر مؤسسين: فبحسب تقرير صحفي من 2004 اشترى Alonso Menéndez وJosé García González مصنع Particulares في يوليو 1935، ثم مصنع H. Upmann في 1936؛ وبحسب الصحافة المتخصّصة (2013) خرج أول سيجار Montecristo من مبنى في الشارع 23 في Vedado، وتؤرّخ ترخيص H. Upmann بسنة 1937؛ وتضع ويكيبيديا شراء مصنع H. Upmann في 1937. ويأتي الاسم من رواية «الكونت دي مونت كريستو» لـAlexandre Dumas: كان قارئ في tabaquería يقرؤها على لفّافي مصنع H. Upmann، بحسب habanos.com، ولقيت الرواية قبولًا حسنًا إلى حدّ أن اسم بطلها أُعطي للعلامة الجديدة. وكان الـlector، الذي يدفع له اللفّافون أنفسهم، مؤسسة من مؤسسات المصانع الكوبية، كما تكتب Mental Floss عام 2015. وتكتب ويكيبيديا أن الشعار، ستة سيوف حول زهرة الزنبق، صمّمه الموزّع البريطاني للعلامة.

تكتب Habanos أن العلامة كانت في الأصل تضم خمسة قياسات مرقّمة من 1 إلى 5. أما No. 4 فهو petit corona بـcepo 42 x 129 مم؛ ويشير تقرير صحفي من 2004 إلى أنه يُلفّ في عشرات المصانع الكوبية.

تكتب ويكيبيديا أنه بعد تأميم صناعة التبغ الكوبية غادر Menéndez وGarcía كوبا: فأُعيد إطلاق العلامة في جزر الكناري، حيث وضعتها نزاعات العلامة التجارية في مواجهة Cubatabaco، ثم صُنعت نحو منتصف سنوات 1970 في لا رومانا بالجمهورية الدومينيكية (نقاط بلا مصدر في ويكيبيديا). وهذا الـMontecristo، الذي تتحكم Altadis، فرع Imperial Brands، في توزيعه في الولايات المتحدة، سيجار آخر غير Montecristo الكوبي التابع لـHabanos. وفي الولايات المتحدة لا يمكن بيع العلامة الكوبية بسبب الحظر، وتكتب ويكيبيديا أن حقوق الحكومة الكوبية غير معترف بها هناك.

في هافانا تستمرّ Montecristo في ملكية الدولة. تسمّي Habanos مصنع H. Upmann مهدًا لها وتقول إنه المصنع الذي لُفّت فيه Gran Reserva No. 2 لعام 2011؛ وترى الصحافة المتخصّصة سيجار Montecristo يُلفّ هناك (2011، 2015)، وترصد Tobacco Reporter بعضه أيضًا في La Corona (2024). ولا تضع المصادر Montecristo في مصنع Romeo y Julieta: وما كان لـRomeo y Julieta إلا مبنى Belascoaín، الذي يشغله H. Upmann منذ 2011. وNo. 2 هو pirámide (torpedo) بـcepo 52 x 156 مم. وفي 2011 استخرجت الدار منه أول Gran Reserva لها، Cosecha 2005، التي تقول إن كثيرين يعدّونها مرجع النكهة في الـHabano؛ وكتب تقرير صحفي من 2004 أن No. 2 كان يُصنع في Partagás أو H. Upmann في الغالب.

ويفتتح Edmundo (cepo 52 x 135 مم)، الذي قُدِّم في باريس في 13 مايو 2004، وPetit Edmundo (2007) خطًّا ذا نكهة متوسطة إلى كاملة، بحسب الدار؛ وتربط ويكيبيديا الاسم ببطل الرواية Edmond Dantès، من دون مصدر. أما Línea Montecristo Open، التي قُدِّمت في Festival del Habano عام 2009، فتضم أربعة قياسات هي Eagle وMaster وRegata وJunior، متوسطة القوة. وLínea 1935 (Maltés وDumas وLeyenda)، المعلن عنها في مارس 2018، هي، بحسب habanos.com، أول خلطة كاملة القوة في العلامة. ومن الإصدارات الحديثة 80 Aniversario (2015) وDantés (2016) وSupremos (2019) وElba (2025، بمناسبة تسعين عامًا على العلامة).

ومن أحدثها Brillantes (cepo 53 x 128 مم)، الذي أُطلق في هونغ كونغ في فبراير 2024 بمناسبة عام التنين، وFragata (cepo 54 x 140 مم)، وهو صندوق ترطيب للسفر يتسع لعشرين سيجارًا، قُدِّم في 1 أكتوبر 2026 لقناتي duty free وtravel retail وحدهما.

أين تُلفّ؟ في كوبا للسؤال جواب من طابقين. منذ 2002 لكلّ علامة من علامات Habanos مصنع أمّ، مسؤول عن اختيار الأوراق والخلطة، ويمكن أن يُلفّ سيجارها في أيّ من عشرات المصانع في الجزيرة تحت إشراف الأمّ؛ ولا تنشر Habanos هذه الخريطة، بل تعيد الصحافة المتخصّصة تركيبها. ومصنعها الأمّ هو H. Upmann — مصنع José Martí، وهو اسم تؤرّخه بوّابة مدينة هافانا بسنة 1960 — الذي غيّر عنوانه مرارًا ويشغل منذ فبراير 2011، بحسب الصحافة المتخصّصة، مبنى Romeo y Julieta السابق في Belascoaín في Centro Habana (852 بحسب الصحافة، و853 بحسب بوّابة هافانا). وفي أكتوبر 2026 تضع صفحة «The Habanos Brands Academia» على habanos.com علامة Montecristo ضمن العلامات العالمية الست لـHabanos، مع Cohiba وRomeo y Julieta وPartagás وHoyo de Monterrey وH. Upmann؛ وتؤرّخ الصحافة المتخصّصة هذا التصنيف بتاريخ 1 أغسطس 2019 وتقول إن هذه العلامات تُباع في جميع الأسواق التي يوجد فيها سيجار كوبي. وتجعلها الصفحة الرسمية تولد سنة 1935 في مصنع H. Upmann، حيث كان قارئ يقرأ Dumas على اللفّافين؛ وترى الصحافة المتخصّصة Montecristo يُلفّ هناك (2011، 2015، 2024)، وترصد بعضه أيضًا في La Corona (2024)، وكتبت عام 2004 أن No. 2 كان يخرج في الغالب من Partagás أو من H. Upmann.'
 WHERE `name` = 'Montecristo' AND SHA1(TRIM(`history`)) = 'ad1f1b6a578baae33540526edd6ed21a1f791506';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Montecristo' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'ad1f1b6a578baae33540526edd6ed21a1f791506';
-- brands|My Father|history|ar — ملفّفي، سيجارات، Estelí
UPDATE `brands` SET `history_ar` = 'وُلد José ''Pepín'' García في كوبا عام 1950، كما تقول الدار، التي تقدّمه بوصفه صانع خلطات رئيسيًا من الجيل الثالث، وتقول إنه لفّ أول سيجار له وهو في الحادية عشرة. وبحسب الصحافة المتخصصة، تغادر العائلة كوبا عام 2001 وتتجه إلى نيكاراغوا؛ وفي عام 2003 تفتح في ميامي، في Little Havana، El Rey de los Habanos، وهو مصنع صغير يشترك في ملكيته Eduardo Fernández (Aganorsa). وتتباين تواريخ هذه الفترة بحسب المصادر.

تعود La Tabacalera Cubana de Estelí إلى عام 2006. وأنشأ ابنه Jaime علامة My Father عام 2008، إهداءً إلى أبيه، وافتُتح المصنع الحالي عام 2009، بحسب الصحافة المتخصصة. واليوم تقول الدار إنها تدير ثلاثة مصانع (إستيلي، وEl Paraíso في هندوراس، وDoral في فلوريدا) و24 علامة.

تظل إستيلي قلب الإنتاج: إذ تصف صفحة الدار مجمعًا صناعيًا عائليًا في تلك المدينة، وتقول إن لفّافي مصنع ميامي يتدرّبون هناك على يد Don Pepín.

Old Henry Cigars ليست علامة تابعة لـ My Father: فهي تُباع لدى Holt''s، التي تقول إن الاسم هو اسم كلب، صديق قديم للدار، وإن السيجار مُوَلّف في إستيلي على يد José Pepin García وابنه Jaime. وفي أبريل 2007 تصفها مراجعة بالفعل بأنها توليفة من Don Pepin أُنتجت لحساب Holt''s وتُباع لديها وحدها. وفي أكتوبر 2026 تذكر صفحة Holt''s غلافًا خارجيًا Habano من الإكوادور فوق longfillers نيكاراغوية، وستة مقاسات من 5,5 x 50 إلى 6,5 x 64، وصنفًا كلاسيكيًا منذ عشرين عامًا.'
 WHERE `name` = 'My Father' AND SHA1(TRIM(`history`)) = '460a88c8b0ca2757a19f0ca7db6e6b7780522336';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'My Father' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '460a88c8b0ca2757a19f0ca7db6e6b7780522336';
-- brands|Oliva|history|ar — marques latines، دومينيكي
UPDATE `brands` SET `history_ar` = 'يبدأ تاريخ عائلة Oliva في بينار ديل ريو بكوبا: فبحسب الدار، زرع Melanio Oliva التبغ هناك لأول مرة عام 1886، وأوقف زراعته بسبب حرب الاستقلال الكوبية ثم استأنفها. وتقول الدار إن ابنه Facundo تولّى الأمر في مطلع عشرينيات القرن الماضي (وتسمّي ويكيبيديا Hipolito).

عندما تغيّر النظام في كوبا، انتقل الحفيد Gilberto Oliva من الزراعة إلى سمسرة التبغ. وبحسب الدار، غادر الجزيرة في مطلع ستينيات القرن الماضي، وبحث في هندوراس وبنما والمكسيك والفلبين عن شروط قريبة من الذوق الكوبي، قبل أن يستقر في نيكاراغوا. وتتباين التواريخ: فتجعله ويكيبيديا يغادر إلى إسبانيا عام 1964، ويزرع في نيكاراغوا عام 1969، ثم يترك البلد عام 1979 ليعود إليه عام 1995.

ظلّت العائلة سنوات مزارعة وسمسارة، من دون علامة تحمل اسمها. ويروي ابنه José أن Gilberto الأب كان يزرع التبغ كل سنة ويدّخره (الصحافة المتخصصة، كانون الأول/ديسمبر 2017). ولا تذكر أي صفحة مقروءة أسماء المصنّعين المشترين.

في عام 1995 صنع Gilberto Oliva وابنه Gilberto Jr. سيجارًا في مصنع Néstor Plasencia الأب في هندوراس، وسمّياه Gilberto Oliva؛ وبعد عام افتتحا مصنعهما الخاص في نيكاراغوا واختصرا الاسم إلى Oliva. والـSerie V هي الخط الرئيسي للدار؛ وتختلف سنة إطلاقها بحسب المصادر (2004 في البطاقة السابقة، و2006 بحسب ويكيبيديا، وحزيران/يونيو 2007 بحسب Halfwheel).

تزرع العائلة في نيكاراغوا تبغًا من بذور كوبية، بحسب الدار. وفي تموز/يوليو 2016 اشترت المجموعة البلجيكية J. Cortès شركة Oliva Cigar Co.؛ وفي عام 2021 تصفها الصحافة المتخصصة بأنها شركتها التابعة، مع بقاء العائلة على رأس الشركة في Miami Lakes (فلوريدا).

في عام 2023 افتتحت Oliva سلسلة Black Swan. والاسم ملك لبائع التجزئة الأمريكيّ CigarPage لا للدار: فكلّ طبعة من السلسلة تُسنَد إلى مصنع مختلف، وتُبنى على دفعة تبغ خاصّة وُجدت عنده. وتُلَفّ طبعة Oliva في نيكاراغوا، تحت غلاف Connecticut Broadleaf، فوق رابط إكوادوريّ وحشوة نيكاراغوية. أمّا الطبعات الثلاث التالية فصنعتها Rocky Patel وE.P. Carrillo وJoya de Nicaragua — وثلاثتها في هذا الأطلس.

تلفّ Oliva أيضًا، لخط واحد فقط، Rustico، التي يبيعها تاجر التجزئة Atlantic Cigar Company، الذي انطلق في أواخر عقد 1990، باسم Rustico Habano. وفي أكتوبر 2026 لا يُذكر هناك سوى خط Reserve على أنه من صنع Oliva في نيكاراغوا: غلاف خارجي Habano من الإكوادور، ورابط وحشوة نيكاراغويين، longfiller مُلَفّ يدويًا، بمقاس Gordo 4 x 60. ويُذكر خط Habano هناك على أنه دومينيكي، دون ذكر اسم المصنع.'
 WHERE `name` = 'Oliva' AND SHA1(TRIM(`history`)) = 'db0fae8283fe6b66aa71f230dc9ddda7334ed538';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oliva' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'db0fae8283fe6b66aa71f230dc9ddda7334ed538';
-- brands|Ozgener Family Cigars|history|ar — noms latins، سيجارات، جبل
UPDATE `brands` SET `history_ar` = 'Ozgener هو أيضًا اسم CAO، دار ناشفيل التي أسّسها Cano Ozgener، مهندس تركي صار صانع سيجار. وكان Tim، ابنه، رئيسها قبل بيعها لـGeneral Cigar. عاد إلى المهنة في مطلع 2022 باسمه، بمزجتين — Bosphorus، مضيق إسطنبول، وPi Synesthesia، سيجار يلعب على اللون والإدراك.

ليس لها مصنع. أُعلن عن Bosphorus في حزيران/يونيو 2022، ولُفّ أولًا في إستيلي لدى Luciano، المعروف سابقًا باسم Tabacalera Pichardo — وهو مصنع Eradio Pichardo الذي يحمل هذا الأطلس بطاقته —، ثم أُوكل في تشرين الثاني/نوفمبر 2022 إلى Tabacalera La Alianza، مصنع E.P. Carrillo في جمهورية الدومينيكان، الذي أُعيدت تسميته Casa Carrillo في 2024، وفيه يُلفّ أيضًا Aramas، الخطّ الثاني، المعلن عنه في آذار/مارس 2023 والمسمّى باسم جبل أرارات، وFirsat في 2024. ويأتي Karatoba (2025) من NACSA في إستيلي؛ وMaracana (آذار/مارس 2026) من My Father في هندوراس؛ والإصدار المحدود World Cup 2026 من My Father في نيكاراغوا. ويصنّف الأطلس البطاقة في جمهورية الدومينيكان، حيث يُلفّ ثلاثة من الخطوط الخمسة الجارية، ومنها Bosphorus، الخطّ الأوّل؛ ولا تذكر أيّ صفحة حجم الإنتاج لكل مصنع. وفي تشرين الأول/أكتوبر 2026 لا يزال smokingpipes.com يقول إنّ Bosphorus يُلفّ لدى Pichardo في نيكاراغوا، في حين تقول الدار إنه يُصنع لدى Tabacalera La Alianza.

إنّها شبكة أشخاص كما التقاها هذا الأطلس عند آل Seijas وآل Eiroa: أبٌ يؤسّس CAO، وابنٌ يديرها ويبيعها، ثم يعود بأسماء عائلته — البوسفور وأرارات — على سيجار يصنعه غيره.

تُكتب الشركة أيضًا Oz Family Cigars. أُطلقت في 2022 باسم Ozgener Family Cigars ثم اختصرته: يكتب تقرير عن معرض PCA في أبريل 2024 أن الاختيار وقع على قول Oz Family Cigars، وفي مارس 2026 يحمل إصداراها المعلنان، Maracana وWorld Cup 2026، هذا الاسم. وفي أكتوبر 2026 يُدرج smokingpipes.com سيجارها تحت اسم OZ Family. وتوزّعها Crowned Heads، التي أصبح Tim Ozgener مستثمرًا فيها في 2022 ثم مديرًا عامًّا لها في أبريل 2025، وما زالت تفعل ذلك في مارس 2026.'
 WHERE `name` = 'Ozgener Family Cigars' AND SHA1(TRIM(`history`)) = '438ddab53a459aa36992d0f1b1e39952c75e5be8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ozgener Family Cigars' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '438ddab53a459aa36992d0f1b1e39952c75e5be8';
-- brands|Padrón|history|ar — noms de personnes en latin
UPDATE `brands` SET `history_ar` = 'وُلد José Orlando Padrón في 10 يونيو 1926 في منطقة بينار ديل ريو بكوبا، لأسرة كانت تزرع التبغ هناك، وغادر هافانا في أبريل 1961، ومرّ بإسبانيا، ووصل إلى ميامي في فبراير 1962، بحسب padron.com. وعمل في قصّ العشب وفي النجارة، فكسب هناك 600 دولار مكّنته من افتتاح Padrón Cigars في سبتمبر 1964 بلافّ واحد فقط. وجذبته تربة منطقة إستيلي في نيكاراغوا ومناخها المحلي، القريبان من تربة بينار ديل ريو ومناخها، فأرسل إليها تبغًا منذ 1967، بحسب الدار، ونقل إليها إنتاجه عام 1970.

وفي 1978 شارك José Orlando في محادثات مع الحكومة الكوبية أدّت إلى الإفراج عن سجناء سياسيين؛ وتكتب Holt''s أن الجالية المناهضة لكاسترو في ميامي صارت منذ ذلك الحين تعدّه خائنًا. وبحسب Holt''s، تعرّضت منشآته في ميامي لثلاثة تفجيرات بالقنابل بين 26 يوليو 1979 و1983، بعد قنبلة أولى لم تنفجر في مارس 1979؛ وتعلن Omega 7، وهي جماعة مناهضة لكاسترو، مسؤوليتها عن انفجار يناير 1983 في مصنع Padrón في هافانا الصغيرة (UPI)، بينما يشير padron.com إلى محاولات اعتداء من مجموعة صغيرة من المبتزّين المحليين. وفي نيكاراغوا دمّرت الحرب الأهلية مصنع إستيلي عام 1978، ودفع الحظر الأمريكي من 1985 إلى 1990 العائلة إلى الإنتاج في دانلي بهندوراس، حيث توقف لفّ السيجار عام 2007.

وفي 1994 أطلقت الدار 1964 Anniversary بمناسبة عامها الثلاثين، ثم Serie 1926 بمناسبة بلوغ José Orlando الخامسة والسبعين. وتقع مزارعها حول إستيلي. وتوفي José Orlando في ديسمبر 2017 عن 91 عامًا؛ وكان ابنه Jorge، الذي دخل الشركة عام 1991، يديرها في نوفمبر 2021، بحسب صحافة المهنة.'
 WHERE `name` = 'Padrón' AND SHA1(TRIM(`history`)) = 'bfc5e8ae7b4eac5c0f3b4313e493437debd79fda';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Padrón' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'bfc5e8ae7b4eac5c0f3b4313e493437debd79fda';
-- brands|Partagás|history|ar — صيغ التفضيل مستبدلة
UPDATE `brands` SET `history_ar` = 'أُنشئ مصنع Partagás عام 1845 على يد Don Jaime Partagás، كما تقول صفحة Habanos الرسمية. وُلد في Arenys de Mar (كتالونيا) في 7 ديسمبر 1816 واستقرّ في كوبا عام 1831، وأسّس هناك La Flor de Tabacos Partagás، التي كانت امتدادًا لمصنع سابق لها، هو مصنع Joan Conill i Pi، كما تقول Gran Enciclopèdia Catalana. وبحسب Habanos أيضًا، ظلّ المصنع سنوات عديدة في شارع إندوستريا رقم 520، خلف الكابيتول في هافانا، وهو اليوم في شارع سان كارلوس رقم 806؛ ولا تؤرّخ الصفحة هذا التغيير. وتضع ويكيبيديا وEcuRed عنوان عام 1845 في شارع كريستينا، المبنى 1، قبل شارع إندوستريا (عام 1850 بحسب EcuRed، التي تؤرّخ التأسيس بعام 1838).

تصف Habanos سيجار Partagás بأنه يُعرف فورًا من نكهته المكثّفة، وبقوة «Fuerte»، مع خلطة من تبغ Vuelta Abajo في Pinar del Río.

لم تولد «اللكتورا»، أي القراءة بصوت عالٍ على اللافّين أثناء العمل، في Partagás: تؤرّخ EcuRed أول قراءة في مصنع بيوم 21 ديسمبر 1865، في tabaquería El Fígaro بهافانا، وقراءة مصنع Partagás بيوم 9 يناير 1866. وقبل Jaime Partagás الطلب بشرط واحد هو رقابة مسبقة على المؤلفات، كما تقول EcuRed وMental Floss؛ وترى الأخيرة في Saturnino Martínez، عامل التبغ وناشر صحيفة La Aurora، شخصًا ربما كان أول من قرأ الصحف والكتب بين أوراق التبغ. وتضيف Mental Floss أن العمّال كانوا يصوّتون على النصوص ويستحسنون Alexandre Dumas وVictor Hugo. ومُنعت «اللكتورا» عام 1866 بأمر القائد العام Francisco Lersundi، ثم استؤنفت بعد حرب السنوات العشر (1878)؛ وتُظهرها Mental Floss بعد ذلك تتبع اللافّين الكوبيين إلى فلوريدا، إلى تامبا وكي ويست.

توفي Jaime Partagás عام 1868: تقول Gran Enciclopèdia Catalana إنه مات في Pinar del Río في 17 يوليو 1868 برصاصة أصابته في عراك نشأ عن منافسات تجارية؛ وتتحدث EcuRed عن نزاع على الأرض مع جار، قيل إنه تسبّب في إصابته إصابة قاتلة في يونيو، قبل وفاته بشهر؛ وتقول ويكيبيديا إنه اغتيل في إحدى مزارعه. وتولّى ابنه José العمل، ثم انتقل المصنع إلى المصرفي José A. Bances وإلى عائلة Cifuentes التي أعادت تسميته Cifuentes y Cía، بحسب ويكيبيديا؛ وصادرت الحكومة الكوبية المصنع، مع خمسة عشر مصنعًا آخر، في 15 سبتمبر 1960. وتُعدّ Serie D No. 4، وهي روبوستو بقياس 50 × 124 مم بحسب قائمة ويكيبيديا، من القياسات التي تقول Habanos إنها معروفة على نحو خاص في العلامة، مع Lusitanias و8-9-8 وPirámide Serie P No. 2؛ وكانت Reserva الخاصة بـSerie D No. 4، كما تكتب Habanos، أول Reserva أنجزتها الدار.

تُعدّ Lusitanias (49 × 194 مم) قياسَ أول Gran Reserva في العلامة، وهي Cosecha 2007، التي قدّمتها Habanos في 23 ديسمبر 2013 في خمسة آلاف صندوق مرقّم من خمسة عشر؛ وتصف Habanos هذا القياس بأنه مهيب. أما 8-9-8 Varnished فهي dalia (lonsdale) بطول نحو 171 مم وبقياس حلقي 43 بحسب قائمة ويكيبيديا؛ واسمها يأتي من ترتيب السيجار الخمسة والعشرين في العلبة المطلية بالورنيش: ثمانية، فتسعة، فثمانية، كما يوضح تاجر التجزئة Cigars Unlimited، الذي يذكرها بـ6 ¾ بوصة.

أين تُلفّ؟ في كوبا للسؤال جواب من طابقين. منذ 2002 لكلّ علامة من علامات Habanos مصنع أمّ، مسؤول عن اختيار الأوراق والخلطة، ويمكن أن يُلفّ سيجارها في أيّ من عشرات المصانع في الجزيرة تحت إشراف الأمّ؛ ولا تنشر Habanos هذه الخريطة، بل تعيد الصحافة المتخصّصة تركيبها. مصنعها الأمّ هو Partagás. وفي أواخر 2011 كتبت الصحافة المتخصّصة أن مصنع إندوستريا، أمّ Partagás وBolívar وLa Gloria Cubana وRamón Allones وQuai d''Orsay، سيُغلق لأعمال الترميم وأن إنتاجه سينتقل إلى مصنع El Rey del Mundo السابق؛ وتكتب سنة 2020 أن المصنع أُغلق للتجديد سنة 2011، بينما تعطي ويكيبيديا 2 يناير 2012 تاريخًا للانتقال. وفي أكتوبر 2026 تُحصي صفحة «Brands Academia» على habanos.com 27 علامة، منها ست علامات عالمية — Cohiba وMontecristo وRomeo y Julieta وPartagás وHoyo de Monterrey وH. Upmann —، تقدّمها Habanos بوصفها العلامات الوثيقة الصلة بالهاوي والشهيرة لديه؛ وفي 2019 أرّخت الصحافة المتخصّصة هذا التصنيف وكتبت أن العلامات العالمية تُباع حيثما وُجد السيجار الكوبي وفي كل Casas del Habano. وكانت الصحافة المتخصّصة تحصي 209 لفّافين في الموقع مطلع 2016 لنحو 240 مكانًا، وتلاحظ أنه ما زال بالإمكان شراء السيجار في المصنع القديم، الذي لم يعد يُلفّ فيه؛ وفي يوليو 2020 انهار سقف من هذا المبنى، دون إصابات بحسب مصادر في Habanos، وأُغلق المبنى مع Casa del Habano عند المدخل.'
 WHERE `name` = 'Partagás' AND SHA1(TRIM(`history`)) = '5a273d450461fad63e1c5d00255c78880c61d13b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Partagás' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '5a273d450461fad63e1c5d00255c78880c61d13b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Partagás USA' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '0baa2557196f73476ce0116995e9a68010ee4c8a';
-- brands|Perdomo|history|ar — noms de personnes en latin
UPDATE `brands` SET `history_ar` = 'أطلق Nick Perdomo Jr. شركة Nick''s Cigar Co. في ميامي في أغسطس 1992 (في مرآبه، بحسب ويكيبيديا)، دون أن يترك عمله مراقبًا جويًّا في مطار ميامي. وللعائلة جذور كوبية: تربطها ويكيبيديا بسان خوسيه دي لاس لاخاس، التي جاء منها جدّه Silvio، وقد عمل أبوه Nick Sr. في Partagás ثم في H. Upmann قبل أن يغادر كوبا بعد الثورة. وتتباين المصادر في بدايات نيكاراغوا: فالصحافة المتخصصة عام 2001 تضع مصنعًا أول في إستيلي عام 1995 ومصنعًا أوسع منه عام 1999، وتذكر ويكيبيديا منشأة عام 1997 حلّت محلها أخرى عام 1999.

في أكتوبر 2026 تعرّف الدار نفسها بأنها شركة عائلية متكاملة رأسيًّا، من زراعة التبغ إلى التوزيع: المقر في ميامي، والتصنيع في إستيلي، والأراضي في إستيلي وكونديغا وخالابا. ولم يكن الأمر كذلك عام 2001، حين كتبت الصحافة المتخصصة أن Perdomo لا يملك حقولًا ويشتري تبغه من موردين، منهم عائلة Perez من ASP Enterprises في إستيلي.

قُدِّمت 20th Anniversary في IPCPR 2012 في الذكرى العشرين للدار: سيجار نيكاراغوي خالص (puro) من بذرة كوبية، بغلافين Sun Grown أو Maduro، وبتبغ من مزارع إستيلي وكونديغا وخالابا. وتقدّمها الدار اليوم أيضًا بغلاف Connecticut إكوادوري؛ ويُعتَّق تبغها ثماني سنوات على الأقل، ثم تدخل الأغلفة براميل البوربون.'
 WHERE `name` = 'Perdomo' AND SHA1(TRIM(`history`)) = 'ba78d4576e80c6f58666d52e8c141ae1f1b808d2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Perdomo' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'ba78d4576e80c6f58666d52e8c141ae1f1b808d2';
-- brands|Plasencia|history|ar — noms de personnes en latin
UPDATE `brands` SET `history_ar` = 'تزرع عائلة Plasencia التبغ منذ 1865، بحسب الدار (plasenciacigars.com، أكتوبر 2026)، وهي تعدّ خمسة أجيال. وبحسب مدونة Cigars Direct (2020)، يبدأ كل شيء مع Eduardo Plasencia، الذي جاء من جزر الكناري إلى فويلتا أباخو في كوبا.

وتتباين المصادر في ما تلا ذلك. فبحسب Cigars Direct (2020)، صادرت الحكومة الكوبية المزرعة عام 1963، ومرّ Don Sixto بالمكسيك ثم بنيكاراغوا، حيث زرع نحو عام 1965؛ وأحرق متمرّدون ساندينيون مزارعه عام 1978، فرحلت العائلة إلى هندوراس. وبحسب الصحافة المتخصصة، فإن استيلاء الساندينيين على الحكم عام 1979 هو الذي صادر المزارع؛ أما ويكيبيديا فتتحدث عن مطلع الثمانينيات. وتولّى Néstor Plasencia عمليات التبغ عام 1986 (Cigars Direct)؛ وافتُتح مصنع أوكوتال في نيكاراغوا عام 1992 بحسب ويكيبيديا، وعام 1994 بحسب الصحافة المتخصصة.

ظلّت العائلة زمنًا طويلًا معروفة قبل كل شيء بوصفها مزارعة ومصنِّعة لحساب الغير. وبحسب الصحافة المتخصصة، تورّد الورقة إلى Davidoff وتصنع سيجارًا لحساب Rocky Patel وAlec Bradley، من بين آخرين؛ وتضيف ويكيبيديا Swisher.

في عام 2016 أنشأت العائلة Plasencia 1865، شركة التوزيع، وأطلقت باسمها سلسلة Alma، التي Alma Fuerte (الروح القوية) أول سيجار فيها. وبحسب Cigar Coop (2018)، هو سيجار نيكاراغوي خالص (puro) مبني على Criollo ''98، بتبغ من كونديغا وإستيلي وخالابا وأوميتبي. وتلتها سلسلة Cosecha، من هندوراس، في أواخر 2017 مع Cosecha 146.

في أكتوبر 2026 تعلن الدار أنها تملك مزارع في سبع مناطق زراعية من نيكاراغوا وهندوراس (كونديغا وإستيلي ووادي خالابا وأوميتبي؛ وJamastrán وTalanga وAzacualpa)، على ما يزيد على 4900 أكر.

بحسب cigarworld.de، تلفّ Plasencia أيضًا Astoria de Nicaragua، وهي علامة تُباع في ألمانيا. وفي أكتوبر 2026 يعرضها تاجر التجزئة مع Tabac Benden GmbH (Düsseldorf) مستوردًا وTabacalera Plasencia في Estelí مصنّعًا: ملفوفة يدويًا، بحشوة mediumfiller، كلها من تبغ نيكاراغوي. وهو يدرجها في فهرسه منذ 1 أكتوبر 2010 بالنسبة إلى Classic، ومنذ 23 أبريل 2025 بالنسبة إلى سلسلة Crimez (Hate وKidnapping وManslaughter)، ويستوردها مباشرة منذ 2024، بعد أن توقف مستورده السابق عن نشاطه.'
 WHERE `name` = 'Plasencia' AND SHA1(TRIM(`history`)) = 'c42d2ee4f4de48656611c078c4ab7a7d50b2a106';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Plasencia' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'c42d2ee4f4de48656611c078c4ab7a7d50b2a106';
-- brands|Por Larrañaga|history|ar — cepo mal rendu en محيط
UPDATE `brands` SET `history_ar` = 'تؤرّخ Habanos العلامة بعام 1834؛ وبحسب ويكيبيديا وتاجر تجزئة بريطاني، سُجّل الاسم في تلك السنة على يد Ignacio Larrañaga، مهاجر إسباني وصل إلى هافانا عام 1825. وبحسب ويكيبيديا، انتقلت الدار عام 1920 إلى مصنع أوسع في شارع Carlos III؛ وفي 1925 تسبّبت آلات جاءت من الولايات المتحدة في إضرابات ومقاطعة، فأُعيدت؛ ويعود التأميم إلى 1960 وانتقل الإنتاج عندئذٍ إلى La Corona؛ وتراجع الإنتاج في الثمانينيات، وقلّصت نزاعات العلامة التصديرَ في التسعينيات.

يذكر Rudyard Kipling العلامة في قصيدة The Betrothed، إلى جانب Henry Clay؛ ويختلف تاريخ أول نشر: 1886 في مجلّد بحسب ويكيبيديا، و21 نوفمبر 1888 في صحيفة يومية هندية بحسب Kipling Society. تضع القصيدة خطيبةً وسيجاراً في كفّتي ميزان، وتسمّي عدّة علامات؛ وتذكّر ملاحظات Kipling Society بأن علامة Larrañaga سُجّلت عام 1834.

تذكر Habanos قوة خفيفة إلى متوسطة، وأغلفة وحشوات من منطقة Vuelta Abajo في Pinar del Río. وتسرد ويكيبيديا سلاسل مخصّصة لأسواق بعينها: Lonsdale لألمانيا (2006)، وMagnifico للمملكة المتحدة (2007-2008)، وValioso لسويسرا (2009)، وOpera لفرنسا (2015)؛ ويذكر موقع سويسري أيضاً Robusto Asia Pacifique من عام 2007.

تقدّم Habanos مقاس Galanes (52 x 120 mm) بوصفه آخر مقاس أُضيف إلى العلامة، وقد طُرح للبيع في سويسرا في أبريل 2021 بحسب المستورد.

أين تُلفّ؟ في كوبا للسؤال جواب من طابقين. منذ 2002 لكلّ علامة من علامات Habanos مصنع أمّ، مسؤول عن اختيار الأوراق والخلطة، ويمكن أن يُلفّ سيجارها في أيّ من عشرات المصانع في الجزيرة تحت إشراف الأمّ؛ ولا تنشر Habanos هذه الخريطة، بل تعيد الصحافة المتخصّصة تركيبها. ولا تسمّي Habanos أيّ مصنع. ويذكر تقرير للصحافة المتخصّصة (2011) أنّ La Corona (Miguel Fernández Roig)، في جادة 20 de Mayo وLínea de Ferrocarril بحيّ سيرو، هي المصنع الأمّ للعلامة Por Larrañaga، وكذلك للعلامات Cuaba وHoyo de Monterrey وPunch وSan Cristóbal de La Habana وLa Flor de Cano؛ وتضع ويكيبيديا الإنتاج في La Corona منذ 1960. في أكتوبر 2026 تصنّفها habanos.com ضمن العلامات الثلاث عشرة الأخرى من محفظة من سبع وعشرين علامة، خارج العلامات العالمية الستّ وعلامات القيمة الخمس وعلامات الحجم الثلاث؛ وكانت الصحافة المتخصّصة قد صنّفتها عام 2019 في فئة الأخرى، من بين إحدى وعشرين علامة في المحفظة. تقول الصفحة الرسمية إنّها تأسّست سنة 1834 وتُلفّ يدويًّا بحشوة طويلة في بعض القياسات وقصيرة في أخرى؛ وGalanes، بقياس حلقي 52 وطول 120 مم، هي أول مقاس لها من العيار الغليظ. يقول هذا الأطلس ذلك، كما مع كلّ علامة تمزج الحشوتين.'
 WHERE `name` = 'Por Larrañaga' AND SHA1(TRIM(`history`)) = 'e14cf3c0c8e2490f749bdab472a0e91dd3fcaa7d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Por Larrañaga' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'e14cf3c0c8e2490f749bdab472a0e91dd3fcaa7d';
-- brands|Punch|history|ar — nom propre en lettres latines
UPDATE `brands` SET `history_ar` = 'تكتب Habanos، في بلاغها الصادر في ديسمبر 2025 احتفاءً بمرور 185 عامًا على العلامة، أنّ Punch سُجّلت ثم أُسّست عام 1840 لخدمة السوق البريطانية المتنامية؛ أمّا صفحة علامتها فتكتفي بذكر منتصف القرن التاسع عشر وتنسب تأسيسها إلى Don Manuel López de Juan Valle y Cía الذي أراد دخول السوق الإنجليزية، حيث كانت مطبوعة فكاهية تحمل الاسم نفسه تحظى بالشعبية. وتكتب ويكيبيديا أنّ العلامة سُجّلت عام 1840 على يد ألماني يُدعى Stockmann، ثم اشتراها Luis Corujo عام 1874 وManuel López Fernández عام 1884، وأنّها تدين باسمها إلى الدمية Mr. Punch؛ أمّا مجلة Punch فقد صدرت للمرة الأولى في 17 يوليو 1841.

ولا يزال المهرّج Mr. Punch، رمز المطبوعة التي تحمل الاسم نفسه، يظهر على كل علبة وفي يده Habano، بحسب habanos.com، التي يربط بلاغها لعام 2025 العلامة بشعار Punch & Judy.

تكتب ويكيبيديا أنّ شركة Fernández, Palicio y Cía اشترت العلامة عام 1930، بينما يقول habanos.com إنّ Punch انتقلت عام 1931 إلى مصنع Hoyo de Monterrey؛ وأنّه بعد الحظر الأمريكي باع Fernando Palicio علاماته إلى Frank Llaneza وDan Blumenthal من Villazon & Co.، اللذين يصنعان Punch بتبغ هندوراسي للسوق الأمريكية؛ وأنّ كوبا أمّمت الصناعة بعد ذلك، واستمر إنتاج Punch. وهذه Punch الهندوراسية سيجار آخر غير Punch الكوبية التي تنتجها Habanos.

تصنّف Habanos علامة Punch ضمن علاماتها متوسطة القوة («Medium»)، من أوراق Vuelta Abajo، وتُلفّ يدويًّا بحشوة طويلة.

طول Double Corona هو 194 mm بـcepo 49 (vitola de galera Prominentes)، وطول Punch هو 143 mm بـcepo 46 (Corona Gorda)، بحسب قائمة القياسات في ويكيبيديا.

أين تُلفّ؟ في كوبا للسؤال جواب من طابقين. منذ 2002 لكلّ علامة من علامات Habanos مصنع أمّ، مسؤول عن اختيار الأوراق والخلطة، ويمكن أن يُلفّ سيجارها في أيّ من عشرات المصانع في الجزيرة تحت إشراف الأمّ؛ ولا تنشر Habanos هذه الخريطة، بل تعيد الصحافة المتخصّصة تركيبها. مصنعها الأمّ هو La Corona — مصنع Miguel Fernández Roig — في شارع 20 de Mayo بحيّ سيرو، وهو مصنع سجائر سابق حُوّل إلى مصنع سيجار عام 2000، بحسب الصحافة المتخصّصة التي تجعله أيضًا المصنع الأمّ لـHoyo de Monterrey وCuaba. وفي أكتوبر 2026 تصنّف صفحة «The Habanos Brands Academia» على habanos.com علامة Punch ضمن علاماتها الخمس «High Value Brands» (ذات التوزيع الواسع والمحافظ المثيرة للاهتمام، بحسب قولها)، إلى جانب Trinidad وBolívar وQuai d''Orsay وRamón Allones، في محفظة من 27 علامة؛ وكانت الصحافة المتخصّصة قد أعلنت في 1 أغسطس 2019 تصنيفًا في إحدى وعشرين علامة محفظة، منها مجموعة من أربع تُسمّى عالية القيمة — Bolívar وPunch وRamón Allones وTrinidad. تقول الصفحة الرسمية ذلك: سنة 1931 انضمّت Punch إلى المصنع الذي كانت تُصنع فيه Hoyo de Monterrey، والعلامتان تُنتجان في La Corona. وقد أعطاها Short de Punch، الذي عُرض للمرة الأولى عالميًّا في زيورخ في 12 يوليو 2019، أول cepo 50 لها (50 x 120 mm، علبة من 10)، بحسب habanos.com.'
 WHERE `name` = 'Punch' AND SHA1(TRIM(`history`)) = '76fbdf4dddc84bc8a112d476051caf81eb5b03e3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Punch' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '76fbdf4dddc84bc8a112d476051caf81eb5b03e3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Quai d''Orsay' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'b4ec2b38799732c4cf45b3242f9957a85821daa7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Quintero' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'f920bef5db7fa833536ca90fa0eb90529bca82f8';
-- brands|Rafael González|history|ar — liant mal rendu; سيجارات
UPDATE `brands` SET `history_ar` = 'تقول habanos.com إن Rafael González علامة أُنشئت في ثلاثينيات القرن العشرين، وتحمل صناديقها نقشًا بالإنجليزية: يُدخَّن السيجار في غضون شهر من تاريخ شحنه من هافانا، وإلا فيُترك لينضج بعناية نحو سنة. وتكتب الصحافة المتخصّصة سنة 2023 أن صناديق العلامة البيضاء القديمة كانت تحمل نصًا على الغطاء. وتكتب Habanos أيضًا أن قياس مصنعها يُسمّى Cervantes وسُمّي في البدء Lonsdale، نسبةً إلى Lord Lonsdale.

تصنّفها Habanos في القوة الخفيفة؛ وسيجارها يُلفّ كلّه باليد، بحشوة طويلة باستثناء مقاس واحد بحشوة قصيرة، بحشوة ورابط من Vuelta Abajo، في مقاطعة Pinar del Río. وتصفها الصحافة المتخصّصة سنة 2023 بأنها علامة صغيرة جدًا، أُنشئت في ثلاثينيات القرن العشرين، لا يلتفت إليها كثير من المدخّنين.

تمنحها الصحافة المتخصّصة سنة 2023 أربعة مقاسات: Perla (4 x 40، أُطلقت قبل نحو عشر سنوات)، وPanetelas Extra (5 x 37)، وPetit Corona (5 1/8 x 44)، والجديد Coronas de Lonsdales (5 x 48). وقد قُدّم Coronas de Lonsdales، المسمّى Hermosos No. 4 في المصانع الكوبية، في البرتغال أولًا، خلال فعالية للموزّع EMPOR، في علبة من 10 (الصحافة المتخصّصة، 2023).

في أكتوبر 2026 تدرجها habanos.com ضمن العلامات «الأخرى» الثلاث عشرة من محفظتها البالغة 27 علامة.

أين تُلفّ؟ في كوبا للسؤال جواب من طابقين. منذ 2002 لكلّ علامة من علامات Habanos مصنع أمّ، مسؤول عن اختيار الأوراق والخلطة، ويمكن أن يُلفّ سيجارها في أيّ من عشرات المصانع في الجزيرة تحت إشراف الأمّ؛ ولا تنشر Habanos هذه الخريطة، بل تعيد الصحافة المتخصّصة تركيبها. لا تسمّي habanos.com ولا الصحافة المتخصّصة التي رجعنا إليها (لمحة عن المصانع لسنة 2011، ومقال لسنة 2023) مصنعها الأمّ. وكان تصنيف 1 أغسطس 2019 (الصحافة المتخصّصة، 21 علامة محفظة) يضعها في فئة «other»؛ وفي أكتوبر 2026 تدرجها habanos.com ضمن علاماتها الـ27، خارج العلامات العالمية الستّ وعلامات القيمة الخمس وعلامات الحجم الثلاث. وتؤرّخها الصفحة الرسمية في الثلاثينيات، وتذكّر بأنّ قياس مصنعها يُسمّى Cervantes وكان أوّلًا Lonsdale على اسم اللورد، وتقول إنّ المجموعة بحشوة طويلة باستثناء واحد بحشوة قصيرة.'
 WHERE `name` = 'Rafael González' AND SHA1(TRIM(`history`)) = '3c1fd42e0678e9f9269c1f15d2a4b75c32add654';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rafael González' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '3c1fd42e0678e9f9269c1f15d2a4b75c32add654';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ramón Allones' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '137be8938e2962b0c95b518c48d1423b465387d7';
-- brands|Rocky Patel|history|ar — تعديل صيغتين للمقارنة
UPDATE `brands` SET `history_ar` = 'مسار Rocky Patel من أبعد المسارات احتمالًا في تاريخ السيجار الأمريكي. أمضى عشرينيّاته محاميًا لقطاع الترفيه في لوس أنجلوس، بزبائن جعلت أوقاتُ عملهم من صالات السيجار موئلًا مهنيًّا طبيعيًّا. وتعلّم التبغ كما يتعلّم المحامي معظم الأشياء: بطرح الأسئلة، والقراءة الكثيرة، والحديث إلى من يعرفون. وفي مطلع التسعينيات كان يعرف سوق السيجار الفاخر معرفة تفوق معرفة معظم زملائه.

في 1995 قرّر أن يدخلها. لم يكن له ماضٍ في الزراعة، ولا صلة بمصنع، ولا شبكة تجارية. كانت لديه كفاءة قانونية، وحدس تجاري، وأطروحة دقيقة: الحماسة الأمريكية في التسعينيات تخلق طلبًا لا يلبّيه المصنّعون الفاخرون بأسعار في المتناول. Padrón ممتاز لكنه غالٍ. وDavidoff لا غبار عليه لكنه يقصد زبونًا آخر. وبين الجودة الحقيقية والسعر اليومي كانت هناك مساحة لم يعالجها أحد بالجدّية التي نوى أن يضعها فيها.

وقد حوّلت سلسلة «Vintage»، التي قُدّمت في مطلع الألفينات، هذه الأطروحة إلى منتج: سيجار مبنيّ حول تبغ يعتّق منذ السنة المدوّنة على الحلقة، ويُباع بأسعار تسمح بسيجار جادّ كل يوم بدل الطقس العَرَضي. وقد أرست «Vintage 1990» و«1992» و«1999» مصداقية الدار لدى جمهور كان يرى في السيجار الميسور تنازلًا.

أما الكتالوغ الذي تلا — ما يزيد على ثلاثين تشكيلة موزّعة على عدة مستويات سعرية — فيستجيب لتقسيم منهجي للسوق: كل تشكيلة تقصد ذوقًا وميزانية، بجودة صناعة لها حدّ أدنى يمنع أيّ Rocky Patel، مهما كان سعره، من أن يخجل العلامة. وهذا الانتظام ناتج مباشرةً عن العلاقات التي نسجها Patel مع مصنّعين هندوراسيين عبر عقدين من إنتاج متزايد التنسيق.

في يناير 2024 لفّت الدار الطبعة الثانية من «Black Swan»، وهي سلسلة تملكها شركة «CigarPage» الأمريكية للتجزئة، وتُسنَد كلّ دفعة منها إلى مصنع مختلف. وهذه الطبعة تخرج من هندوراس — غلاف كوروخو، ورابط هندوراسيّ، وحشوة هندوراسية ونيكاراغوية. وهناك أيضًا يصنّف الأطلس هذه البطاقة: تكتب Premium Cigar Association في مارس 2024 أنّ الحصّة الكبرى من سيجار Rocky Patel تخرج من El Paraiso في دانلي (حتى نحو 78 000 سيجار في اليوم، بحسب Nish Patel، نائب الرئيس التنفيذي)، مقابل 26 000 إلى 28 000 في TaviCusa في إستيلي. وبلد البطاقة يدلّ على معظم الإنتاج لا على كلّه: تُلفّ Emerald وYear of the Snake وThirtieth وSapphire في TaviCusa، بحسب Cigar Coop، ويُعلَن عن مصنع أضخم في نيكاراغوا؛ ويصنّف موقع الدار في 2025 ثلاثين بندًا في نيكاراغوا وثمانية عشر في هندوراس. وقد افتتحت «Oliva» السلسلة عام 2023، وتبعتها «E.P. Carrillo» و«Joya de Nicaragua».'
 WHERE `name` = 'Rocky Patel' AND SHA1(TRIM(`history`)) = '414450bf045d1dd657c218e1dbc76c287df9d40b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rocky Patel' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '414450bf045d1dd657c218e1dbc76c287df9d40b';
-- brands|Romeo y Julieta|history|ar — سيجارات بدل سيجار
UPDATE `brands` SET `history_ar` = 'تكتب Habanos أنّ اسم Romeo y Julieta أُنشئ بوصفه علامة من علامات Habanos عام 1875 وأنّ جذوره في مأساة شكسبير، من دون أن تسمّي مؤسِّسًا. وتكتب OnCuba (2013) أنّ إسبانيَّين هما Inocencio Álvarez وJosé García أطلقا العلامة عام 1875؛ وتكتب ويكيبيديا Inocencio Alvarez وManin García؛ وتعطي صفحات أخرى 1873 (Origin of Cigar، 2025) أو 1870 (CubaMemorias، 2022). وتكتب Habanos أنّ العلامة نالت شهرة دولية في السنوات الأولى من القرن العشرين؛ وتكتب ويكيبيديا أنّها نالت تكريمات كثيرة بين عامي 1885 و1900 من دون أن تسمّي معرضًا، وتذكر CubaMemorias ميداليات وشهادات في معارض بروكسل وباريس وشيكاغو وبنما. وتورد Habanos اسم Don «Pepín» Rodríguez بين أوائل من أدركوا أهمية الحلقات عاملًا من عوامل النجاح؛ وتكتب OnCuba وويكيبيديا أنّ José Rodríguez Fernández، المعروف بـDon Pepín، اشترى العلامة عام 1903.

تكتب Habanos أنّ ونستون تشرشل كان من أشدّ مدخّني العلامة وفاءً: فمنذ زيارته هافانا عام 1946 استُعمل اسمه على بعض الحلقات، وأعطى اسمه للقياس الذي يتصدّر قياسات العلامة شهرةً، وهو Churchills. وبحسب الصحافة المتخصّصة (1995) وصل تشرشل إلى هافانا في نوفمبر 1895، وفي منطقة الكاريبي بدأ شغفه بالسيجار فعلًا؛ وكان من علاماته المفضّلة، كما تكتب، Romeo y Julieta وLa Aroma de Cuba. ويكتب المصدر نفسه أنّ تشرشل كان يدخّن عادةً من ثمانية إلى عشرة سيجار في اليوم. ويبلغ قياس Churchills 47 x 178 مم (قياس حلقي 47)، واسمه في galera هو Julieta No 2، بحسب habanos.com.

ويُروى أصل اسم هذا القياس على وجهين: تربطه Habanos بزيارة تشرشل إلى هافانا عام 1946؛ وتكتب الصحافة المتخصّصة (2018) أنّ كثيرين يقولون إنه ابتُكر في مصنع Romeo y Julieta في أواخر عقد 1940 بعد زيارة قام بها السير ونستون، وأنّ آخرين يرون أنّ اسم Churchill لم يظهر على سيجار Romeo y Julieta إلا في عقد 1950.

في يونيو 2019 قدّمت Habanos سيجار Churchills Añejados في أنابيب، داخل غلاف واقٍ يغطّي العلبة الأصلية المؤلفة من 25 سيجارًا؛ وتقول الدار إنها أطلقت مفهوم Añejados بقياس Pirámides. كما تدرج Habanos ضمن العلامة Short Churchills (2006، بطول 124 مم) وPetit Churchills (2012، قياس حلقي 50 x 102 مم، نحو عشرين دقيقة من الدخان بحسب الدار).

تصف Habanos علامة Romeo y Julieta بأنها الـHabano الكلاسيكي ذو النكهة المتوسطة، من تبغ Vuelta Abajo. أما Línea de Oro، وهي ثلاثة أقيسة قُدّمت في حفل الدورة الثانية والعشرين من Festival del Habano (بيان 2 مارس 2020) لمناسبة مرور 145 عامًا على العلامة، فتعطيها Habanos قوةً متوسطة إلى شديدة، في حين أنّ قلب العلامة متوسط القوة.

قدّمت Habanos عام 2012 سيجار Churchills Reserva Cosecha 2008، وهو تبغ من Vuelta Abajo معتَّق ثلاث سنوات على الأقل، ثم قدّمت في يونيو 2015 Gran Reserva Cosecha 2009 بقياس Wide Churchills: سلسلة خاصة من 5000 علبة مطلية بطلاء اللّك ومرقّمة، في كل منها 15 سيجارًا، من أوراق محصول 2009 معتَّقة خمس سنوات. وقياس Wide Churchills، الذي قُدّم في بيان صدر في 3 يونيو 2010، هو vitola de galera باسم Montesco، بقياس حلقي 55 (21.83 مم) وطول 130 مم؛ وتكتب Habanos أنه يفتتح القياس الحلقي 55 ويصف خلطة متوازنة وعطرية. وفي سبتمبر 2023 قدّمت Habanos في ألمانيا سيجار Cupidos (قياس حلقي 55 x 148 مم، علبة من 20)، الذي يُباع في Casas del Habano وحدها ولدى Habanos Specialists، كما يقول البيان؛ وفي فبراير 2025، لمناسبة الذكرى الـ150 للعلامة، كُشف عن قياس Amantes (53 x 153 مم) في الدورة الخامسة والعشرين من Festival del Habano.

أين تُلفّ؟ في كوبا للسؤال جواب من طابقين. منذ 2002 لكلّ علامة من علامات Habanos مصنع أمّ، مسؤول عن اختيار الأوراق والخلطة، ويمكن أن يُلفّ سيجارها في أيّ من عشرات المصانع في الجزيرة تحت إشراف الأمّ؛ ولا تنشر Habanos هذه الخريطة، بل تعيد الصحافة المتخصّصة تركيبها. ولا تسمّي Habanos مصنع Romeo y Julieta، بينما تقدّم الصحافة روايات متعاقبة تتباين فيما بينها. وفي مارس 2006 تنقل الصحافة المتخصّصة خبر إغلاق مصنع Romeo y Julieta القديم في هافانا، الذي عُدّ شديد التهالك فلا يصلح للترميم، على أن ينتقل عمّاله إلى مصنع جديد على أبواب المدينة. وفي 2011 تصف مصنعًا باسم Romeo y Julieta / H. Upmann في 852 شارع بيلاسكوين بحيّ Centro Habana، انتقل إليه فريق H. Upmann في فبراير 2011؛ وفي 2014 تكتب أنّ العلامة أُسكنت في ذلك المبنى حتى نحو عام 2000، ثم صار الإنتاج فيه يُسنَد بصورة متزايدة إلى جهات خارجية. وفي فبراير 2024 تقدّم Prensa Latina مصنع Carlos Baliño في مارياناو، المقام في دير قديم مجدَّد يعود إلى مطلع القرن العشرين، على أنه مصنع Romeo y Julieta الجديد؛ وتكتب Origin of Cigar عام 2025 أنّ العلامة مستقرّة فيه منذ 2015، في موقع كان من نحو 1950 إلى 2013 مصنع José L. Piedra. وتكتب الصحافة المتخصّصة أيضًا عام 2011 أنّ مصنع Francisco Donatién في بينار ديل ريو يلفّ بعضًا من سيجار Romeo y Julieta. وفي أكتوبر 2026 تدرج صفحة «The Habanos Brands Academia» على موقع habanos.com علامة Romeo y Julieta ضمن العلامات العالمية الست من محفظة تضم 27 علامة، مع Cohiba وMontecristo وPartagás وHoyo de Monterrey وH. Upmann؛ وقد أعلنت الصحافة المتخصّصة هذا التصنيف في 1 أغسطس 2019، وتقول إنّ هذه العلامات تُباع في جميع الأسواق التي يوجد فيها السيجار الكوبي وإنها حاضرة في جميع Casas del Habano.'
 WHERE `name` = 'Romeo y Julieta' AND SHA1(TRIM(`history`)) = '8db9b573d4802a0e56fa8056c734005557fb8557';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Romeo y Julieta' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '8db9b573d4802a0e56fa8056c734005557fb8557';
-- brands|Romeo y Julieta USA|history|ar — مصطلح «الصحافة المتخصّصة» موحّد
UPDATE `brands` SET `history_ar` = 'Romeo y Julieta علامة تعود إلى 1875؛ وتذكر صفحة Altadis U.S.A. أنها تأسست في تلك السنة، وتسمّي ويكيبيديا Inocencio Alvarez وManin García. وبعد الثورة الكوبية والتأميم نُقلت العلامة إلى لا رومانا في جمهورية الدومينيكان بحسب ويكيبيديا؛ والنسخة المباعة في الولايات المتحدة تديرها هناك Altadis U.S.A. وهي ليست العلامة نفسها مثل Romeo y Julieta الكوبية التي توزّعها Habanos S.A.: فالاسم مشترك، أما التبغ والمصانع فمختلفة.

تملك Altadis U.S.A. العلامة في الولايات المتحدة (الصحافة المتخصّصة، 3 فبراير 2025). وهي جزء من Tabacalera USA التي باعتها Imperial Brands إلى Gemstone Investment Holding (إغلاق الصفقة مقرر في 29 أكتوبر 2020، Cigar Coop)؛ وكان مصنع Tabacalera de García في جمهورية الدومينيكان داخلاً في بيع بقية العالم إلى Allied Cigar Corporation. فلم يعد للتشكيلة الأمريكية أصل واحد: إذ تسرد صفحة الدار (altadisusa.com، أكتوبر 2026) تشكيلات من جمهورية الدومينيكان وهندوراس ونيكاراغوا.

تُلَفّ Reserve يدوياً في هندوراس، في La Flor de Copán (الغلاف والربّاط نيكاراغويان، والحشوة من هندوراس ونيكاراغوا)؛ أما 1875 Nicaragua فسيجار puro نيكاراغوي صنعته Plasencia يدوياً؛ وتُصنع 150th Anniversary لسنة 2025 في Tabacalera de García. ولا تقول صفحة الدار إن 1875 (غلاف Indonesian Shade Grown) ولا 1875 Reserve Maduro (غلاف Connecticut Broadleaf) تُلَفّان يدوياً؛ فهما ليستا في التشكيلة.'
 WHERE `name` = 'Romeo y Julieta USA' AND SHA1(TRIM(`history`)) = '85d68cd82afcf08f1ff51e6651795f42def6234a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Romeo y Julieta USA' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '85d68cd82afcf08f1ff51e6651795f42def6234a';
-- brands|Saint Luis Rey|history|ar — السيجارات بدل السيجار
UPDATE `brands` SET `history_ar` = 'ربما تحمل Saint Luis Rey اسم San Luis، بلدة في Vuelta Abajo معروفة بأغلفتها: وهذا هو التفسير الذي ترجّحه habanos.com، في مقابل رواية Thornton Wilder التي يربطها بها بعضهم. بحسب ويكيبيديا، سُجّل الاسم أولاً لدى Zamora y Guerra Co. في هافانا، ثم سنة 1940 لدى مستوردَين إنكليزيَّين هما Nathan Silverstone وMichael De Keyser؛ ومن 1960 إلى 1992 لا تُباع العلامة إلا في المملكة المتحدة.

تصفها الدار بأنها قوية، يستحسنها المدخّنون الباحثون عن نكهات مكثّفة، وكثيراً ما تُستخدم في الإصدارات الإقليمية. يُلفّ السيجار بأوراق من منطقة Vuelta Abajo في Pinar del Río، للغلاف والحشوة والرابط.

تعطي J.J. Fox سيجار Regios على أنه Hermoso No. 4 بطول 5 بوصات على cepo 48 (127 mm)، أطول قليلاً من الروبوستو لكنه أضيق، بحشوة طويلة، totalmente a mano، من المستوى 5 من 5 على سلّم التاجر. ويكتب التاجر نفسه أن العلامة سحبت خطوطها الأخرى سنة 2010 وأن Regios هو سيجارها الجاري الوحيد؛ ولا تسرد habanos.com أي vitola، وتبقى هذه الرواية بحاجة إلى تأكيد.

ويستحق التباسٌ أن يُذكر: في الولايات المتحدة، تعود ملكية تسجيل العلامة إلى Altadis، بحسب ويكيبيديا، ما يجعلها اسماً مماثلاً غير كوبي في تلك السوق. وهنا أيضاً، الصندوق هو ما ينبغي قراءته.

أين تُلفّ؟ في كوبا للسؤال جواب من طابقين. منذ 2002 لكلّ علامة من علامات Habanos مصنع أمّ، مسؤول عن اختيار الأوراق والخلطة، ويمكن أن يُلفّ سيجارها في أيّ من عشرات المصانع في الجزيرة تحت إشراف الأمّ؛ ولا تنشر Habanos هذه الخريطة، بل تعيد الصحافة المتخصّصة تركيبها. لا تسمّي Habanos أي مصنع لـSaint Luis Rey. تضعها ويكيبيديا في مصنع Briones Montoto بهافانا، حيث يُصنع أيضاً Romeo y Julieta؛ ولا يذكرها تحقيق صحفي من 2011 عن مصانع هافانا. في أكتوبر 2026 تصنّفها habanos.com ضمن العلامات الثلاث عشرة الأخرى من محفظة السبع والعشرين، خارج العلامات العالمية الستّ وعلامات القيمة الخمس وعلامات الحجم الثلاث؛ وكانت الصحافة المتخصّصة تصنّفها سنة 2019 في فئة العلامات الأخرى. لا تؤرّخها الصفحة الرسمية إلّا بما قبل الحرب العالمية الثانية، بينما تضع ويكيبيديا سنة 1940 لتسجيل الاسم من المستوردين الإنكليز، بعد تسجيل أوّل بلا تاريخ: فالروايتان متباينتان. لا تسمّي أيّ صفحة قُرئت مصنعها الأمّ؛ والمصانع المذكورة متباينة بحسب المصادر.'
 WHERE `name` = 'Saint Luis Rey' AND SHA1(TRIM(`history`)) = '8f40cb22663cd7894ea2a9e55bc5badc74789f27';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Saint Luis Rey' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '8f40cb22663cd7894ea2a9e55bc5badc74789f27';
-- brands|San Cristóbal de La Habana|history|ar — capote = رابط، لا غلاف داخلي
UPDATE `brands` SET `history_ar` = 'تستعيد العلامة الاسم الأصلي لهافانا، الذي تُرجعه صفحة الدار إلى سنة 1519: San Cristóbal de La Habana. أُطلقت سنة 1999 تكريماً لتاريخ المدينة (في 20 نوفمبر في هافانا، كما تقول ويكيبيديا)، وسمّت قياساتها الأربعة الأولى على قلاع من هافانا تعود إلى القرون من السادس عشر إلى الثامن عشر: El Morro وLa Fuerza وLa Punta وEl Príncipe.

تصنّف Habanos العلامة بقوّة خفيفة إلى متوسطة، ملفوفة يدويًّا بالكامل بحشوة طويلة، مع الرابط والحشوة من منطقة Vuelta Abajo؛ ولا تصف الصفحة أيّ نفحة طعم. وتضيف ويكيبيديا أنّ علامة بالاسم نفسه كانت موجودة قبل الثورة، ولا صلة لها بالجديدة.

بحسب ويكيبيديا، El Príncipe هو الأقصر بين الأربعة (4 3/8 بوصة على cepo 42، أي 111 mm، واسم الـ galera هو Minuto) وEl Morro هو الأطول (7 1/4 بوصة على cepo 49، أي 184 mm، Paco)؛ ويكتب أحد تجّار التجزئة أنّ El Morro أُوقف سنة 2013. وبينهما يبلغ طول كلّ من La Fuerza (5 1/2 بوصة على cepo 50، Gordito) وLa Punta (5 1/2 بوصة على cepo 52، Campana) 140 mm، دائماً بحسب ويكيبيديا.

تقدّم Habanos العلامة على أنّها من العلامات المصمَّمة لشبكة La Casa del Habano، مع إنتاجات سنوية حصرية لهذه الشبكة ولـ Habanos Specialists.

أين تُلفّ؟ في كوبا للسؤال جواب من طابقين. منذ 2002 لكلّ علامة من علامات Habanos مصنع أمّ، مسؤول عن اختيار الأوراق والخلطة، ويمكن أن يُلفّ سيجارها في أيّ من عشرات المصانع في الجزيرة تحت إشراف الأمّ؛ ولا تنشر Habanos هذه الخريطة، بل تعيد الصحافة المتخصّصة تركيبها. مصنعها الأمّ هو La Corona، أي Miguel Fernández Roig، بحسب الصحافة المتخصّصة (2011)، وكان مبناه مصنع سجائر حتى سنة 2000 قبل أن يُحوَّل إلى مصنع سيجار؛ ولا تسمّي habanos.com أيّ مصنع للعلامة. وفي أكتوبر 2026 تصنّفها habanos.com ضمن العلامات الثلاث عشرة الأخرى من محفظة من سبع وعشرين علامة، خارج العلامات العالمية الستّ، وعلامات «القيمة» الخمس، وعلامات «الحجم» الثلاث؛ وكانت الصحافة المتخصّصة تضعها في 1 أغسطس 2019 ضمن العلامات الأربع عشرة الأخرى من محفظة الإحدى والعشرين. وتقول الصفحة الرسمية إنّها أُطلقت سنة 1999 تكريماً لتاريخ المدينة، بأربعة قياسات بأسماء قلاع — El Morro وLa Fuerza وLa Punta وEl Príncipe — ووُسّعت سنة 2004 بـ Mercaderes وOficios وMurallas، وهي أسماء شوارع في هافانا القديمة، ومُنحت إنتاجات سنوية حصرية لشبكة Casas del Habano؛ وتذكر عامها العشرين سنة 2019 في إطار خمسمئة عام لهافانا، مع 20 Aniversario (cepo 52، 162 mm). وتوضح ويكيبيديا أنّ القياسات الثلاثة لسنة 2004 وحدها كانت تحمل حلقة La Casa del Habano. وتسمّي الصحافة المتخصّصة (2011) La Corona مصنعاً أمّاً للعلامة؛ وتبقى صفحة الدار صامتة في هذه النقطة.'
 WHERE `name` = 'San Cristóbal de La Habana' AND SHA1(TRIM(`history`)) = 'd17e4b1820c24f5a445163272ab2bc8b8f8e9277';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'San Cristóbal de La Habana' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'd17e4b1820c24f5a445163272ab2bc8b8f8e9277';
-- brands|Sancho Panza|history|ar — cote = تقييم, pas مقاسات
UPDATE `brands` SET `history_ar` = 'اختيار الاسم يقول كل شيء: لا دون كيخوته، بل حامل سلاحه — الشخصية الواقعية، تلك التي تأكل وتنام ولا تطارد طواحين الهواء. والعلامة، التي تؤرّخ habanos.com أول تسجيل لها بسنة 1848، تُقدَّم اليوم بقوة متوسطة، ملفوفة كلها يدوياً بحشوة طويلة.

بحسب ويكيبيديا، سجّل Emilio Ohmsted الاسم سنة 1848 لمصنع في شارع Angeles بهافانا؛ واشترى Ramón Allones العلامة في ثمانينيات القرن التاسع عشر، واشترتها Rey del Mundo Cigar Co. سنة 1940، قبل التأميم في 15 سبتمبر 1960. أما في الطعم فتتباين الصفحات: يصفه تاجر بريطاني بأنه متوسط إلى لطيف، خشبي، بلمسات من الكراميل والبندق؛ وتقول الصحافة المتخصصة (2025) إنه متوسط إلى شديد، قوي الحضور، قريب جداً من الحلوى.

يبلغ Belicoso مقاس 5 1/2 بوصة على cepo 52 (نحو 140 mm)، وهو، بحسب ما تكتب الصحافة المتخصصة سنة 2025، المقاس الإنتاجي المنتظم الوحيد للعلامة. وتقدّم الصفحة نفسها Sancho Panza علامةً صغيرة جداً في محفظة Habanos، أقلّ شهرة من Cohiba أو Montecristo، بسعر في المتناول.

تقلّصت التشكيلة: أوقفت Habanos إنتاج Non Plus (Mareva، 42 x 129 mm) سنة 2019، في إطار ترشيد محفظة العلامة. ولا ينبغي الخلط بينها وبين الاسم المماثل الأمريكي: فالسيجار الهندوراسي المباع بهذا الاسم في الولايات المتحدة يعود إلى General Cigar، التي استلمت تسجيل 1981.

أين تُلفّ؟ في كوبا للسؤال جواب من طابقين. منذ 2002 لكلّ علامة من علامات Habanos مصنع أمّ، مسؤول عن اختيار الأوراق والخلطة، ويمكن أن يُلفّ سيجارها في أيّ من عشرات المصانع في الجزيرة تحت إشراف الأمّ؛ ولا تنشر Habanos هذه الخريطة، بل تعيد الصحافة المتخصّصة تركيبها. لا يسمّي أيّ مصدر راجعناه — لا Habanos ولا الصحافة المتخصّصة — مصنعها الأمّ؛ وتقول البطاقة ذلك بدل أن تختار. في أكتوبر 2026 تصنّفها habanos.com ضمن العلامات الثلاث عشرة الأخرى من محفظة السبع والعشرين، خارج العلامات العالمية الستّ وعلامات القيمة الخمس وعلامات الحجم الثلاث؛ وكانت الصحافة المتخصّصة تصنّفها سنة 2019 في فئة العلامات الأخرى. تؤكّد الصفحة الرسمية التسجيل الأوّل سنة 1848 وثلاثة سيجارات هافانية اليوم، منها Molino، الموصوف بأنه شهير، واسم galera الخاص به Cervantes؛ ولا تعطي أي تقييم. أما الصحافة المتخصّصة (2025) فلا تذكر مع ذلك سوى Belicoso مقاساً إنتاجياً منتظماً: فالروايتان متباينتان. كل شيء يُلفّ يدوياً بحشوة طويلة، بأوراق من منطقة Vuelta Abajo، بقوة متوسطة.'
 WHERE `name` = 'Sancho Panza' AND SHA1(TRIM(`history`)) = '6ecee5d0a08a40b9917d7a1e7c3a76a9c21d58c4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Sancho Panza' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '6ecee5d0a08a40b9917d7a1e7c3a76a9c21d58c4';
-- brands|Te Amo|history|ar — تعديل صيغة المقارنة واسم المكان
UPDATE `brands` SET `history_ar` = 'Te-Amo هو السيجار المكسيكي الذي دخّنته أمريكا قبل أن تعرف أنّه مكسيكي. في السبعينيات كان في كلّ مكان — سيجار عامل، كان يُباع، بحسب Alberto Turrent (2009)، بثمانين سنتًا، وله مئة وسبعون نقطة بيع حول نيويورك، وكان يحقّق هناك نحو ستين في المئة من مبيعات العلامة في السبعينيات.

العائلة التي تصنعه في تبغ San Andrés منذ 1880. دخل Alberto Turrent العمل سنة 1960، في الثانية والعشرين، سائقَ شاحنة. وُلدت العلامة سنة 1966 بحسب Alberto Turrent؛ وتذكر مصادر أخرى 1963 أو 1964، والتاريخ لم يُحسم. وبدأت بإخفاق: مليونا سيجار مُعبّأة لم تُبَع، ومحاولة في ميامي لم تنجح، ثم نيويورك. وفي 1972، عند وفاة الشريك النيويوركي، اشترت العائلة شركة Te-Amo.

في شباط/فبراير 2024، تكتب الصحافة المتخصصة أنّ Altadis U.S.A. تملك العلامة في الولايات المتحدة وأنّ عائلة Turrent تملكها في بقية العالم. ولا يزال السيجار يُصنع في المكسيك على يد عائلة Turrent؛ ويذكر Alberto Turrent (2009) أنّ Nueva Matacapan de Tabacos في San Andrés Tuxtla هي مصنعهم، ويصفها بأنها منتج لتبغ السيجار في البلاد. ويحمل الأطلس بطاقة العائلة باسم Casa Turrent؛ و Te-Amo (المكسيك) ليست اسمًا مماثلًا لعلامة New World ولا علامة دومينيكانية.

حاولت Altadis إعادة إطلاقها مرّتين. Te-Amo Revolution، قبل ما يزيد على عشر سنوات، انطلق جيّدًا ثم عادت المجموعة إلى طاولة العمل. وفي شباط/فبراير 2024 صدر Te-Amo The Original San Andrés Valley Cigar — أطواق ذهبية وبيضاء وخضراء، وثلاثة قياسات، وثلاث سنوات من التطوير خلال الجائحة. Alejandro Turrent، الابن، في العمل منذ 1998؛ وابنه هو، من الجيل السادس، يحمل الاسم نفسه.'
 WHERE `name` = 'Te Amo' AND SHA1(TRIM(`history`)) = '3148b8e4d9df460ef0d1a36553e70b9cf1298363';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Te Amo' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '3148b8e4d9df460ef0d1a36553e70b9cf1298363';
-- brands|Trinidad|history|ar — Fidel Castro بالحروف اللاتينية
UPDATE `brands` SET `history_ar` = 'تكتب Habanos أنّ أصول Trinidad بوصفها علامة من علامات Habanos تعود إلى 1969، وأنّها ظلّت سنوات طويلة، مثل Cohiba، لا تُستعمل إلا هدايا دولة لكبار الشخصيات الأجنبية؛ ولا تذكر صفحة الدار Fidel Castro. وتكتب الصحافة المتخصّصة (2019) أنّ أول سيجار Trinidad لُفّ عام 1969، بحسب أرشيف Habanos، وأنّ السيجار لم يكن مصنوعًا للبيع بل ليهديه Fidel Castro، وأنّ Trinidad وCohiba كانتا تُستعملان هدايا دولة لكبار الشخصيات الأجنبية؛ وتضيف أنّ عائلة Trinidad تردّ العلامة إلى شركة تبغ لـDiego Trinidad تعود إلى عام 1905. وبحسب ويكيبيديا، كان Avelino Lara، الذي أدار الإنتاج في El Laguito، يقول عام 1992 إنّ Fidel Castro وحده كان مأذونًا له بإهدائه هديةً دبلوماسية؛ وقال Castro إنه لم يُهدِ إلا Cohiba، وإنه، في سيرته الذاتية، لا يعرف عن Trinidad إلا القليل جدًّا؛ ويصف Adriano Martínez، المدير السابق في Habanos، Trinidad بأنها هدية أدنى رتبةً من Cohiba.

تكتب Habanos أنّ العلامة أُتيحت لمدخّني العالم أجمع في عام 1998. وتكتب الصحافة المتخصّصة عام 2003 أنّ العلامة أُطلقت تجاريًّا في مطلع 1998 بقياس Fundadores، وأنّ سيجار Trinidad كان قد استُعمل هدايا دبلوماسية من Fidel Castro وغيره من كبار رجال الحكومة.

تكتب Habanos أنّ العلامة لم يكن لها في بداياتها سوى قياس واحد هو Fundadores، بقياس حلقي 40 وطول 192 مم، من أوراق Vuelta Abajo.

وتتباين المصادر في شأن الكشف العلني: فالصحافة المتخصّصة (2019) تضع في أكتوبر 1994، في باريس، عشاءً أقامته مجلة أمريكية للسيجار كان فيه Trinidad أول سيجار يُقدَّم خارج الأوساط الدبلوماسية (وتقول ويكيبيديا 1995)؛ وتؤرّخ طرحه للبيع بفبراير 1998، أولًا في كوبا ثم في المكسيك وكندا، وتتحدث ويكيبيديا عن حفل افتتاح في فندق Habana Libre في هافانا في السنة نفسها.

تصف Habanos حشوة وغلافًا داخليًّا شديدَي العطر والأريج، بنكهة متوسطة، من أوراق Vuelta Abajo، وتصنّف العلامة بقوة متوسطة؛ وبحسب ويكيبيديا يقول Adriano Martínez إنّ الخلطة قريبة من خلطة أقيسة Cohiba، من دون التخمير الثالث في البرميل. وفي 2003 وسّعت Habanos المجموعة بثلاثة أقيسة قُدّمت في لندن في 10 نوفمبر: Reyes (قياس حلقي 40 x 110 مم) وColoniales (قياس حلقي 44 x 132 مم) وRobustos Extra (قياس حلقي 50 x 155 مم)؛ ثم جاء Robustos T عام 2009، وفي 2019 جاء Esmeralda (قياس حلقي 53 x 145 مم) وMedia Luna (قياس حلقي 50 x 115 مم)، وانضمّ عندئذ Topes (قياس حلقي 56 x 125 مم) إلى المجموعة العادية. أما Vigía (vitola de galera باسم Torres، قياس حلقي 54 x 110 مم)، الذي قُدّم في أبريل 2014، فيسدّ بحسب Habanos الفراغ الذي خلّفه قياسان اختفيا من العلامة؛ وكان Topes قد ظهر أولًا بوصفه Edición Limitada عام 2016. وفي فبراير 2024، بمناسبة مرور 55 عامًا على العلامة، عاد Robustos Extra، الذي توقّف قبل ذلك بحسب الصحافة المتخصّصة، إلى الإنتاج المنتظم (6 1/8 بوصة x cepo 50، علب من 12 ومن 3، بحسب الصحافة المتخصّصة في 26 فبراير 2024)؛ وتكتب Prensa Latina في 27 فبراير 2024 أنّ هذه الأقيسة توسّع المحفظة القياسية.

في 2024 قدّمت Habanos إصدارًا محدودًا Edición Limitada باسم Trinidad Cabildos (vitola de galera باسم Ilustres، قياس حلقي 46 x 162 مم، علبة من 12)، أُطلق في Habanos World Days في لندن. وفي 19 سبتمبر 2026، في مونترو، كشفت Habanos عن Trinidad Vigía Reserva Cosecha 2022، وتقدّمها بوصفها أول Reserva في تاريخ العلامة: أوراق محصول 2022 مع تعتيق إضافي لا يقلّ عن ثلاث سنوات، و5000 علبة مرقّمة من 20 و5000 علبة هدايا من 3 (بيان 22 سبتمبر 2026).

أين تُلفّ؟ في كوبا للسؤال جواب من طابقين. منذ 2002 لكلّ علامة من علامات Habanos مصنع أمّ، مسؤول عن اختيار الأوراق والخلطة، ويمكن أن يُلفّ سيجارها في أيّ من عشرات المصانع في الجزيرة تحت إشراف الأمّ؛ ولا تنشر Habanos هذه الخريطة، بل تعيد الصحافة المتخصّصة تركيبها. ولا تسمّي صفحة العلامة مصنع Trinidad، لكنّ بيان Habanos في 14 نوفمبر 2017 عن Trinidad La Trova يكتب أنّ هذا السيجار يُصنع اليوم في مصنع Francisco Donatién في بينار ديل ريو، وتقول الصحافة المتخصّصة (15 نوفمبر 2017) إنه يُعرف أيضًا باسم مصنع Vegueros. وتكتب الصحافة المتخصّصة عام 2011 أنّ 90% من السيجار في مصنع Francisco Donatién في بينار ديل ريو (58 لفّافًا) هو Trinidad، وهي علامة نُقلت من El Laguito في هافانا، وأنّ المبنى سجن سابق حُوّل إلى مصنع سيجار في عقد 1960. وتتباين تواريخ المبنى: يقول دليل سفر إنه بُني سجنًا عام 1859 وافتُتح المصنع عام 1961؛ ويكتب تاجر تجزئة بريطاني إنّ السجن بُني عام 1868 وحُوّل إلى مصنع عام 1961. وفي أكتوبر 2026 تدرج صفحة «The Habanos Brands Academia» على موقع habanos.com علامة Trinidad ضمن العلامات الخمس ذات القيمة من محفظة تضم 27 علامة، مع Bolívar وPunch وQuai d''Orsay وRamón Allones، بعد العلامات العالمية الست. وكانت الصحافة المتخصّصة قد أعلنت هذا التصنيف في 1 أغسطس 2019: 21 علامة في المحفظة ومجموعة من أربع علامات عالية القيمة (Bolívar وPunch وRamón Allones وTrinidad)، وكانت Quai d''Orsay آنذاك بين العلامات الأخرى. تقول الصفحة الرسمية ذلك: لسنوات عدّة صُنعت Trinidad في El Laguito، مصنع Cohiba؛ واليوم تُصنع في بينار ديل ريو. وكتبت الصحافة المتخصّصة في أكتوبر 2003 أنّ جميع سيجار Trinidad، بما فيها الأحجام الجديدة، ستُصنع على ما يبدو في El Laguito، وفي 2011 أنّ العلامة نُقلت من El Laguito إلى بينار ديل ريو. ويكتب تاجر تجزئة بريطاني أنّه في 2004، أمام طلب متزايد، نُقل الإنتاج إلى بينار ديل ريو؛ ولا تؤرّخ أي صفحة أخرى مقروءة النقل، الذي لا يثبت إلا بوصفه لاحقًا لأكتوبر 2003 وسابقًا لعام 2011.'
 WHERE `name` = 'Trinidad' AND SHA1(TRIM(`history`)) = '881db611025e1ee33cb2d5fdaa6f9442b679fc5b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Trinidad' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '881db611025e1ee33cb2d5fdaa6f9442b679fc5b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vegas Robaina' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'a6e537786c17cbb36f673b18fba16fefe8dbcfe3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vegueros' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'e9adeb7f89928a7263c6d5ac33dc34169ce725d6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Villiger' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '73694cff55089a8118d1b5f1a0e2acac9e3bac0d';
-- brands|Warped|history|ar — أسماء علامات وأشخاص بالحروف اللاتينية
UPDATE `brands` SET `history_ar` = 'وُلدت Warped من رغبة في إحياء أسماء علامات كوبية من قبل 1960 طواها النسيان، وملئها بخلطات معاصرة. اكتشف مؤسّسها Kyle Gellis المهنةَ وهو يعبر ميامي كل أسبوع أيام دراسته ليراقب لافّي هافانا الصغيرة؛ وعند El Titan de Bronze صنع أول سيجاره.

وهو يعمل بلا مصنع خاص. تخرج سلاسله من ورشتين شديدتَي الاختلاف — TABSA في إستيلي، وEl Titan de Bronze في ميامي — وتستخدم ورقة Aganorsa. هذا الرسوّ المزدوج يمنح العلامة تنوّعاً غير معتاد بالنسبة إلى حجمها.

ويفضّل الأسلوب المقاسات النحيلة وطريقة «إنتوبادو» في حزم الحشوة، وهي طريقة قديمة تُلفّ فيها كل ورقة حشوة على نفسها قبل التجميع: أبطأ وأغلى، لكنها تفتح السحب وتطيل الدخان. خيار تقني متّسق مع ما تنشده الدار — الطول في الفم لا القوّة الفورية.

السلاسل قصيرة، وغالباً ما يُعلَن عنها دون سابق إنذار، وتنفد في أسابيع. إنها علامة لمدخّنين مطّلعين — تلك التي تكتشفها بمحادثة لا بواجهة متجر.

Edition One هو اسم Edition One, Inc.، وهي شركة تعود إلى Kyle Gellis، مؤسس Warped، وإلى شقيقه Devin الذي يصغره سنًا. وسيجارها الوحيد Cloud Hopper أُطلق بهدوء في 2016 ثم عُرف لدى الجمهور في صيف 2017، بحسب Cigar Wars. وفي أكتوبر 2026 يعرضه warpedcigars.com ضمن علامات Warped، مصنوعًا في TABSA، مع Kyle Gellis بصفته خبير المزج، من دون اسم Edition One؛ ويبيعه Neptune Cigar، مصنوعًا يدويًا في نيكاراغوا، باسم Edition One Cloud Hopper، ويبيعه Cigars Direct باسم Warped Cloud Hopper.'
 WHERE `name` = 'Warped' AND SHA1(TRIM(`history`)) = '89f5fb83f12fae2c523fdfa053600ebb659ccf2b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Warped' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '89f5fb83f12fae2c523fdfa053600ebb659ccf2b';
-- brands|Zino Platinum|history|ar — سجائر بدل سيجار
UPDATE `brands` SET `history_ar` = 'اسم Zino هو الاسم الأول لـZino Davidoff نفسه. وبحسب موقع العلامة (zino.oettingerdavidoff.com)، أطلق عام 1978، مع الدكتور Ernst Schneider، علامة تحمل اسمه الأول؛ وكان أول سيجار يُلفّ في هندوراس، في زمن الحظر الأمريكي على كوبا، لسوق أمريكية لم يعد لها منفذ إلى التبغ الكوبي.

وبحسب الدار أيضًا، مرّ الإنتاج بعد ذلك بعدة مناطق زراعة: جمهورية الدومينيكان وهندوراس ونيكاراغوا.

أُطلق خط Zino Platinum الفاخر، بسلسلتيه Crown وScepter، في العالم عام 2003 (موقع العلامة). ويصفه Cigar Coop بأنه موجَّه إلى السوق الشابة التي وُلدت من طفرة التسعينيات. وأغلفته إكوادورية بحسب بطاقات صحافة القطاع وتجّار التجزئة؛ أما Z-Class (مايو 2011) فتجمع، بحسب Cigar Coop، غلافًا دومينيكيًا ورابطًا بيروفيًا وحشوة من ligeros نيكاراغوية وهندوراسية. ومنذ عام 2013 مدّدت الخط سلسلة من إصدارات المقتنيات بتغليف من فنّ الشارع (نيويورك ولوس أنجلوس وتكساس).

أُعيد إطلاق علامة Zino عام 2021 على خلطة نيكاراغوية. وفي أكتوبر 2026 تقدّم الدار خطًا جديدًا هو Honduras، بتبغ من Jamastrán وCopán وحلقة حمراء (يحمل خط Nicaragua حلقة ذهبية)؛ وتكتب أنها تعود بذلك إلى حيث بدأ كل شيء عام 1978. وغلاف الخطين من الإكوادور.'
 WHERE `name` = 'Zino Platinum' AND SHA1(TRIM(`history`)) = 'b7ad765ab0e9dae9d02dc1e14d94a68c597b509b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Zino Platinum' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'b7ad765ab0e9dae9d02dc1e14d94a68c597b509b';

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 278';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 278', 'systeme', 'traductions_relues', 'systeme', 0, 'Relecture « ar » par expert-traduction (agent) : 67 traduction(s) relue(s) — 49 corrigee(s), 18 validee(s) telles quelles ; brands 67');

SELECT
  (SELECT COUNT(*) FROM `translation_status` WHERE `lang` = 'ar' AND `statut` = 'relu' AND `relecteur` = 'expert-traduction (agent)') >= 67 AS relues,
  (SELECT COUNT(*) FROM `translation_status` WHERE `statut` = 'relu' AND (`relecteur` IS NULL OR `relecteur` = '')) = 0 AS chaque_relecture_a_son_relecteur;
SELECT `lang`, SUM(`statut` = 'relu') AS relues, COUNT(*) AS total FROM `translation_status` GROUP BY `lang`;
