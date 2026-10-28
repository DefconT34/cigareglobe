-- ════════════════════════════════════════════════════════
-- 280 — Relecture ar
-- ────────────────────────────────────────────────────────
-- Relecture des traductions « ar » par : expert-traduction (agent).
-- Fichier de verdicts : verdicts_p2_ar.json ; generee par tools/i18n_relecture.php le 2026-10-28.
-- Un texte « corrige » est reecrit ; tout texte relu passe au statut « relu »,
-- avec le nom du relecteur. L'empreinte du francais est verifiee dans le WHERE :
-- un francais qui a change depuis l'export ne se laisse pas declarer relu.
-- ════════════════════════════════════════════════════════

-- brands|1502 Cigars|history|ar — noms propres en latin
UPDATE `brands` SET `history_ar` = '1502 هي السنة التي لامس فيها كريستوفر كولومبوس ساحل نيكاراغوا، واتّخذها Enrique Sánchez Icaza اسمًا لأنّه نيكاراغوي ويريد قول ذلك. تعود شركته، Global Premium Cigars، إلى 2011 بحسب موقعها وإلى 2012 بحسب صحافة المهنة — فارق سنة تتركه هذه البطاقة مفتوحًا.

ليس لها مصنع، ولا تخفي ذلك: يُلفّ سيجارها لدى Plasencia في إستيلي، المصنع الذي يحمل هذا الأطلس بطاقته والذي يلفّ أيضًا Crux وBlanco. دارٌ من كلّ ثلاث في هذه القائمة تمرّ عبر Plasencia؛ وذلك مقياس دور هذه العائلة في مشهد البوتيك.

الكتالوج مرتّب بالأحجار والمعادن — Emerald وRuby وBlack Gold — مع XO فوقها وNicaragua بسيط. والتصنيف في نيكاراغوا لا جدال فيه: المؤسّس والورقة والورشة كلّها هناك.'
 WHERE `name` = '1502 Cigars' AND SHA1(TRIM(`history`)) = 'e81ea97c2d6e48ab8097ecc0731cdf5c37c94118';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = '1502 Cigars' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'e81ea97c2d6e48ab8097ecc0731cdf5c37c94118';
-- brands|262 Cigars|history|ar — noms propres en latin
UPDATE `brands` SET `history_ar` = 'الاسم تاريخ: فبراير 1962، الشهر الذي وُقّع فيه الحظر الأمريكيّ على كوبا. كان Clint Aaron يشتغل على مزائجه منذ 2008، وسمّى داره أوّلًا Revolution Cigars؛ ثم اضطرّه نزاع على العلامة إلى التغيير، فاختار الرقم بدل الكلمة.

خرج أوّل سيجار، Paradigm، عام 2010، وتبعه Ideology.

ولم يكن لـ262 مصنع قطّ. خرج سيجارها من ورشتين في إستيلي: Tabacalera Carreras لـCraig Cunningham، وTacaNicsa لـEradio Pichardo. وقد صار اختيار الورشة بحسب المزيج أمرًا شائعًا عند العلامات الأمريكية بلا مصنع؛ والأطلس يسجّله في كلّ مرّة، لأنّه يفسّر كيف يتنقّل الاسم الواحد بين يدٍ ويد من خطّ إلى خطّ.

باع Clint Aaron الدار في يونيو 2019 إلى Madison Money، الذي اشتراها مع والده. ثم انسحب الوالد، وصار Gabriel Seamen شريكًا.'
 WHERE `name` = '262 Cigars' AND SHA1(TRIM(`history`)) = '1f752d20747b70311b06321661d4a97992e64f45';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = '262 Cigars' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '1f752d20747b70311b06321661d4a97992e64f45';
-- brands|7-20-4|history|ar — noms latins, سيجارات
UPDATE `brands` SET `history_ar` = 'الاسم عنوان: 724 شارع إلم، في مانشستر بولاية نيوهامبشير. هناك كان R.G. Sullivan يصنع، ابتداءً من 1874، واحدًا من سيجار العشرة سنتات الأوسع انتشارًا في الولايات المتحدة. وأُغلق المصنع عام 1962 حين قطع الحظرُ التبغَ الكوبيّ.

استعاد Kurt A. Kendall، صاحب متجر Twin Smoke Shoppe في الولاية نفسها، الاسمَ عام 2006. ويحمل خطّ Factory 57 رقم التسجيل الذي كانت الإدارة الأمريكية قد منحته للمصنع — من التفاصيل التي لا تُلتقط إلّا من أرشيف الضرائب.

العلامة أمريكية، والسيجار ليس كذلك. فالخطّ الأصليّ وFactory 57 لُفّا أوّلًا في هندوراس عند Tabacos de Oriente، مصنع Néstor Plasencia. وفي يوليو 2021 انتقل الخطّ الرئيس إلى نيكاراغوا، إلى J. Fuego، ورشة Jesús Fuego في إستيلي.'
 WHERE `name` = '7-20-4' AND SHA1(TRIM(`history`)) = 'c71eb657916546e5e8ca12c99c20e5a0df579a42';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = '7-20-4' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'c71eb657916546e5e8ca12c99c20e5a0df579a42';
-- brands|ADVentura|history|ar — noms latins, accord حشوة
UPDATE `brands` SET `history_ar` = 'ADVentura تعاونٌ، واسمها يكتب ذلك بالحروف الكبيرة: ADV للشريك، وVentura للمصنع. Henderson Ventura كبير مزّاجين مشارك وابن William Ventura الذي يحمل هذا الأطلس بطاقته؛ وMarcel Knobel سويسريّ، ساقي نبيذ ومنتج قهوة وتاجرها، جاء إلى السيجار من باب الذوق. أنشآ العلامة سنة 2016، وكلّ شيء يُلفّ في Tabacalera William Ventura بتامبوريل.

يروي الكتالوج رحلاتٍ وقراصنة: The Explorer وThe Navigator وThe Conqueror — غلاف هابانو 2000 إكوادوري، ورباط سومطرة إكوادوري، وحشوة دومينيكية ونيكاراغوية — ثم The Royal Return وBarbarroja''s Invasion وBlue Eyed Jack''s Revenge. وفي الولايات المتحدة دخلت الدار معرض 2019 باسم ADV & McKay Cigars Co.

علامةٌ تصوّرها سويسريّ ودومينيكي، ولفّها الثاني: يسمّي هذا الأطلس الاثنين، والبلد بلد الورشة.'
 WHERE `name` = 'ADVentura' AND SHA1(TRIM(`history`)) = '9b9e3a7c132684f9022f0f12ead494ea50b38fea';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'ADVentura' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '9b9e3a7c132684f9022f0f12ead494ea50b38fea';
-- brands|Aging Room|history|ar — noms latins, نودال
UPDATE `brands` SET `history_ar` = 'وُلدت Aging Room من لقاء رجلين: Rafael Nodal الذي يمزج، وJosé « Jochy » Blanco الذي يصنع. وظهرت العلامة عام 2011.

نودال كوبيّ من مواليد 1964، وصل إلى الولايات المتحدة طالبَ لجوء. وفي 2002 اشترى مع زوجته Alina Cordoves Nodal وHank Bischoff شركة Habana Cuba Cigar Company في ميامي وأعاد تسميتها Boutique Blends. وJochy Blanco شريك في الدار كذلك — فالصانع وصاحب الطلب شريكان، وليست تلك قاعدة هذه المهنة.

وما زالت Tabacalera Palma في تامبوريل تلفّ خطوطًا دومينيكية، مثل Core Habano (بحسب Cigars Direct، تاجر التجزئة، في تشرين الأول/أكتوبر 2026)؛ أمّا Quattro Nicaragua وPelo de Oro من 2016 وLa Bohème منذ كانون الثاني/يناير 2025 فتُلفّ في نيكاراغوا لدى A.J. Fernandez، بحسب Cigar Coop والصحافة في كانون الثاني/يناير 2025. واسم العلامة يقول الموقف: غرفة التعتيق. أمّا Bin No. 1 فمبنيّ على أتبغة من 1999 و2001 احتُفِظ بها من وادي سيباو، وهو ما يفترض توافر المكان والصبر والمال للاحتفاظ بها.

وأُعيد تكوين المجموعة بالكامل عام 2018. أمّا Nodal فانتقل إلى Tabacalera USA، وبهذه الصفة أعاد تركيب مزيج Trinidad Santiago لـAltadis — من صنع Jochy Blanco، مرّة أخرى.'
 WHERE `name` = 'Aging Room' AND SHA1(TRIM(`history`)) = '2a3548bc4cf64e918f1e08e951eb637b7848dc12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Aging Room' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '2a3548bc4cf64e918f1e08e951eb637b7848dc12';
-- brands|Agrotabacos|history|ar — noms latins, سيجارات
UPDATE `brands` SET `history_ar` = 'Agrotabacos هو الاسم المختصر لاسم تجاري يقول كلّ شيء: Agroindustrial Nicaragüense de Tabacos. أسّسها Omar Ortez سنة 1995 في كونديغا مشروعًا عائليًّا، وبقيت كذلك. المصنع في كونديغا — المدينة الوسطى بين إستيلي وخالابا — ويدّعي مزج الثلاث: حلاوة خالابا، وروائح كونديغا، وقوّة إستيلي.

ما تفعله مقسوم إلى قسمين، وهي تقوله بالأرقام. أربعون بالمئة من إنتاجها يخرج تحت علاماتها الخاصة، Omar Ortez Originals وOmar Ortez Maduro. وستّون بالمئة يُلفّ لغيرها — والقائمة تقول مع من نتعامل: Altadis USA وZander-Greg وFlor de González وKretek International. ومصنعٌ يلفّ لمجموعة مثل Altadis ليس ورشة.

Indiana Ortez ابنة Omar، ووجه الدار. دخلت المصنع في الثانية والعشرين، ودرّبها مشرفٌ اسمه Fausto ستّة شهور، وتتولّى منذ ذلك الحين مراقبة الجودة والتسويق. وباسمها صدرت التعاونات الأخيرة: Fathers, Friends and Fire مع Ventura Cigar Co.، ثم Psyko Seven Nicaragua؛ وCasa de Ortez، العلامة التي قدّمتها مع La Malinche في معرض 2023.

هنا تُصنع Edición Verde لـLampert وسيجار Small Batch.'
 WHERE `name` = 'Agrotabacos' AND SHA1(TRIM(`history`)) = '7ab9e58c5ed0ff0d3dd08f17b496a9c0cef35f19';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Agrotabacos' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '7ab9e58c5ed0ff0d3dd08f17b496a9c0cef35f19';
-- brands|Aladino|history|ar — noms propres en latin
UPDATE `brands` SET `history_ar` = 'يزرع Julio R. Eiroa التبغ في دانلي منذ عام 1963. كان الرجل الذي يقف خلف Camacho، وقد جعلها مع ابنه Christian من كبرى الدور الهندوراسية قبل أن يبيعها لـDavidoff عام 2008. وعلى مرّ السنين اشترى مزارع التبغ الحكومية في وادي خاماستران، حيث ما تزال العائلة تزرع.

عاد عام 2015 مع ابنه البكر Justo وأسّس JRE Tobacco ليفعل تحديدًا ما أراده: سيجار مصنوع بالكامل من تبغ الكوروخو المزروع في أرضه.

الكوروخو بذرة كوبية سابقة للهجائن الحديثة، معروفة بصعوبتها — محصول ضعيف وقابلية للأمراض — وقد هجرها معظم المزارعين لصالح أصناف أطوع. الاستمرار في زراعتها خيار مكلف، وهو كامل حجّة الدار: يقدّم Aladino نفسه سيجارًا من زمن مضى، بالمعنى الزراعي.

الاسم مأخوذ من El Cine Aladino، دار سينما في دانلي من سبعينيات القرن الماضي حوّلتها العائلة إلى مصنع — مصنع Las Lomas حيث يُلفّ السيجار اليوم. وقد اتّسعت التشكيلة منذ ذلك الحين: مادورو عام 2018، وكاميرون عام 2020، وسلسلة Vintage Selection.'
 WHERE `name` = 'Aladino' AND SHA1(TRIM(`history`)) = '1ac3350883d691df734fdcf849bb7e20da7472a0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Aladino' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '1ac3350883d691df734fdcf849bb7e20da7472a0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Alcazar' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '12327a5d7c782a0c811f12eb8c4cd1810d912f4c';
-- brands|Alfambra|history|ar — noms de personnes en latin
UPDATE `brands` SET `history_ar` = 'Alfambra هي علامة Alejandro Mata، رجل الأعمال الإسباني من مالقة، الذي كان آنذاك موزّعًا لرَم Havana Club. وقادَه شغفه بالسيجار إلى Festival del Habano سنة 2005، حيث التقى المزارع الكوبي Alejandro Robaina. وفي 2007 افتتح Mata مصنعًا صغيرًا في إستيلي، حيث عمل زوجان من اللفّافين على تبغ من ريميديوس بكوبا يُدعى La Flor de San Luis، قبل أن يُطلق سنة 2015 علامة Alfambra — وهو اسم تربطه الصحافة بقصر الحمراء في غرناطة — بسيجار أوّل من فئة medium-filler بشريط برتقالي، يُنتَج بمعدّل 30000 قطعة سنويًا. ويظهر المصنع، Tabacalera Alfambra، في إستيلي ضمن دليل Páginas Amarillas النيكاراغوي. وتتجاوز أراضيه الخاصة، ومنها ضيعتان في بويبلو نويبو، خمسين هكتارًا في نيكاراغوا، ويُقال إنّ الإنتاج يقترب من 6000 سيجار يوميًا، تُباع في اثنتي عشرة دولة أوروبية.

أمّا El Brujito، وهو longfiller أُطلق بعد ثلاث سنوات من انطلاقة العلامة، فقد بِيع منه 840000 قطعة، بحسب ما قاله Alejandro Mata. ويكمل الكتالوجَ خطّ Boutique، ومنه طراز Gran Toro. وقُدّم في Intertabac 2026 خطّ جديد يحمل اسم Alejandro Mata يُنتظر طرحه في السوق الدولية في مارس 2027، تكريمًا للمؤسّس: غلاف colorado بخمسة مقاسات، وغلاف maduro بثلاثة مقاسات.'
 WHERE `name` = 'Alfambra' AND SHA1(TRIM(`history`)) = '8fc3c48099592901f057eab8e2f0b890430acb6f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Alfambra' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '8fc3c48099592901f057eab8e2f0b890430acb6f';
-- brands|Alhambra|history|ar — ajout inventé supprimé
UPDATE `brands` SET `history_ar` = 'تحت الإدارة الإسبانية، كانت الفلبين البلد الكبير الآخر للسيجار: إذ كان وادي كاغايان يمدّ مانيلا بتبغ تلفّه بكمّيات صناعية لآسيا كلّها ولجزء من أوروبا. وُلدت Alhambra في ذلك العهد، إلى جانب Tabacalera.

الاسم من قصر غرناطة، لكنه لا يقول شيئاً عن أصل رأس المال: فالشركة التي تأسّست في مانيلا سنة 1898 كانت سويسرية، لا إسبانية. وفي 1912 أقامت مصنعها في توندو شمالي المدينة، وصارت لـTabacalera منافساً جدّياً وودّياً — وسيتقاسم البيتان السوق عقوداً.

تراجع الإنتاج الفلبيني في القرن العشرين دون أن يختفي، وتحتفظ Alhambra بجمهور في أوروبا، وفي سويسرا خاصة — ارتدادُ بندولٍ كادت شهادةُ ميلادها تجعله متوقَّعاً.

وإدراج العلامة في الأطلس تذكيرٌ بأن جغرافيا السيجار لم تقتصر دوماً على الكاريبي.'
 WHERE `name` = 'Alhambra' AND SHA1(TRIM(`history`)) = 'c89c7c18c4894619cc18c0e4424bfed6ceee9e64';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Alhambra' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'c89c7c18c4894619cc18c0e4424bfed6ceee9e64';
-- brands|All Saints Cigars|history|ar — marque et noms en latin
UPDATE `brands` SET `history_ar` = 'All Saints دارٌ من 2018، أسّسها Micky Pegg مع صديقين، Frank Layo وMartin Corboy. ليس لها مصنع: كلّ سيجار يُلفّ في TAVICUSA، مصنع Rocky Patel في إستيلي الذي يحمل هذا الأطلس بطاقته — ثمرةُ علاقة طويلة مع Patel، كما يقول Pegg. والتصنيف في نيكاراغوا يتبع الورشة.

يعد الاسم بقدّيسين، واستغرق الكتالوج وقتًا ليقدّم واحدًا. كان Solamente، النجاح الأوّل، إصدارًا محدودًا بقياس واحد، 5 × 58 — سيجار واحد فقط، كما يقول الاسم. وتبعه Dedicación، أوّل خطّ إنتاج منتظم، ويقدّمه Pegg تحيّةً لمن يشعر بالامتنان لهم. ثم، في 2021، كان Saint Francis — فرنسيس الأسيزي — أوّل سيجار للدار يحمل اسم قدّيس حقًّا.

ثلاثة خطوط، ومصنع واحد، ومؤسّس يروي: إنّها دار من مشهد البوتيك، وبطاقتها تقف عند ما تسمّيه.'
 WHERE `name` = 'All Saints Cigars' AND SHA1(TRIM(`history`)) = 'f4aee859db72805695bd452522eac4f87293e99b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'All Saints Cigars' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'f4aee859db72805695bd452522eac4f87293e99b';
-- brands|American Caribbean Cigars|history|ar — villes traduites, date
UPDATE `brands` SET `history_ar` = 'يمتلك Emiliano Lagos مصنع Tabacalera American Caribbean في إستيلي، وكان هذا المصنع يلفّ سيجارًا لأطراف أخرى قبل أن يطوّر علاماته الخاصة. وأعلنت Gurkha في مايو 2017 عزمها الاستحواذ عليه، ثم تراجعت في العام نفسه لبناء مصنعها الخاص (بحسب Tobacco Business)؛ وبقيت American Caribbean مستقلة واستمرت في اللف لصالح Gurkha. وفي عام 2018، بحسب Cigar Coop، كانت تلفّ أيضًا لصالح Toraño وLeccia Tobacco وVintage Rock-A-Feller Cigar Group.

أطلقت الشركة علامتها الخاصة الأولى، La Rosa de Sandiego، عام 2015. وتلتها The Bouncer وBella Mundo، اللتان قُدِّمتا في معرض IPCPR عام 2018: الأولى بغلاف San Andrés مكسيكي فوق حشوة نيكاراغوية من إستيلي وخالابا وأوميتيبي، والثانية بغلاف برازيلي يُعرف باسم Cubra، ورباط من Sumatra وحشوة criollo نيكاراغوية. ووُلدت El Viejo Continente من لقاء بين Emiliano Lagos وDaniel Guerrero، خبير التبغ من برشلونة الذي كانت عائلته تدير محل تبغ؛ وتُقدَّم التشكيلة بعدة أشكال وتضم سلسلتين شقيقتين، Mare Nostrum وThe Circus.

ويلفّ Lagos أيضًا علامته الشخصية، The Traveler، التي أُطلقت عام 2017 في أوروبا ثم في الولايات المتحدة، بمقاسات سُمّيت بأسماء مطارات دولية، بنسختين طبيعية وmaduro. وتضم إصدار Maradona Tribute، خمسمائة صندوق تكريمًا لـ Diego Maradona، بحشوة نيكاراغوية وهندوراسية ورباط San Andrés وغلاف إكوادوري. وEl Copey، السلسلة الوحيدة التي تُلف خارج نيكاراغوا، تُصنع يدويًا في جمهورية الدومينيكان، في مصنع لم تُسمِّه أي من المصادر المُطالَعة. وحضور الشركة في المعارض موثَّق حتى معرض PCA لعام 2021 (بحسب halfwheel)؛ ولا تزال The Bouncer وEl Copey ضمن قائمة Cigarworld.de في عام 2026.

The Circus خط من El Viejo Continente، وهي علامة تعود إلى Daniel Guerrero؛ وفي أكتوبر 2026، يدرجه موقع العلامة ضمن عائلاتها، إلى جانب Mare Nostrum. وذكرت مدونة في أكتوبر 2021 أن إنتاج العلامة، ومنه The Circus Petit (3 1/2 x 44)، كان يتم في مصنع American Caribbean Cigars في إستيلي. ويصف مقال من سبتمبر 2023 المصنع الخاص بالعلامة في كونديغا، دون أن يذكر The Circus هناك؛ وفي أكتوبر 2026، تكتب Cigarworld.de أن Guerrero ينتج سيجاره في tabacalera الخاصة به في نيكاراغوا.'
 WHERE `name` = 'American Caribbean Cigars' AND SHA1(TRIM(`history`)) = '7164f3c6934e7c474c056ae1b3710e7453c07b89';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'American Caribbean Cigars' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '7164f3c6934e7c474c056ae1b3710e7453c07b89';
-- brands|Ann-Eks|history|ar — cigarillos, ville, puro
UPDATE `brands` SET `history_ar` = 'Ann-Eks علامة تابعة لشركة August Schuster GmbH & Co. KG، دار تبغ من بوندة في شمال الراين-وستفاليا. تحت هذا الاسم، تبيع الدار الروم، وسيجاريلو من أصل برازيلي هما Karla وKurt، وسلسلة سيجار longfiller يُلَفّ بالكامل يدويًا في نيكاراغوا، هي سلسلة X، التي تدرجها Cigarworld.de في كتالوجها منذ 28 ديسمبر 2018. وتضم هذه السلسلة مقاسين هما Gerda بمقاس Robusto وGünther بمقاس Toro، بحشوة نيكاراغوية وغلاف داخلي دومينيكي تحت غلاف San Andrés claro مكسيكي، بحسب Cigarworld.de.

لا تكشف الدار عن اسم المصنع الذي يلفّ سلسلة X، ولا عن المدينة التي يقع فيها. كما تبيع الدار Canned Heat، وهو سيجار puro نيكاراغوي يُباع في علبة معدنية فردية. وحتى سبتمبر 2026، سلسلة X معروضة للبيع لدى Zigarre.de وCigarworld.de وPaul-Bugge.com.'
 WHERE `name` = 'Ann-Eks' AND SHA1(TRIM(`history`)) = '18af5a1d044e1bb55870da3137c5a3a4eb1d9ead';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ann-Eks' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '18af5a1d044e1bb55870da3137c5a3a4eb1d9ead';
-- brands|Antonius|history|ar — arrière-grand-père, pluriel
UPDATE `brands` SET `history_ar` = 'يحمل Antonius اسم Maurice « Antonius » Koks، الهولندي الأصل، الذي يرأس شركة Intercigar S.A. وأسّسها، وهي مصنع يقع في تامبوريل، في مقاطعة سانتياغو، في جمهورية الدومينيكان، بحسب ما تقوله الدار. وتكرّم العلامة جدّ Maurice Koks ووالد جدّه، وكلاهما كان يُلقَّب بـAntonius، أو Toontje، وعمل كلاهما لفّافًا للسيجار في هولندا، بحسب Atlantic Cigar. وتقوم Intercigar بلف Antonius بصفتها علامتها الخاصة، إلى جانب Vallejuelo؛ كما تلف، لصالح دار German Engineered Cigars ومقرّها هامبورغ، خط RVGN Rauchvergnügen، وأنواعًا أخرى من السيجار بعلامات خاصة لعملاء آخرين، بحسب الدار وCigar Coop. وفي 26 سبتمبر 2022، دمّر حريق المبنى الذي كانت تتشاركه Tabacalera William Ventura وIntercigar في المنطقة الحرة La Palma، في تامبوريل، بحسب Tobacco Reporter. وفي سبتمبر 2026، تحدّد الدار عنوان Intercigar في Parque Industrial Llanos de Canca، في تامبوريل، وهو عنوان مختلف عن العنوان الذي كان قائمًا قبل الحريق.

وفي سبتمبر 2026، تنقسم التشكيلة إلى ثلاثة أغلفة: Connecticut (غلاف Connecticut Shade إكوادوري)، وHabano (غلاف إكوادوري من بذور كوبية)، وMaduro (غلاف San Andrés، من المكسيك)، وكل منها سيجار متوسط القوة يُلف على حشوة دومينيكية معتَّقة، بحسب Atlantic Cigar. وتضيف Cigarworld.de، التي تُدرج العلامة في كتالوجها منذ 11 يناير 2011، مقاسًا من طراز Belicoso، إلى جانب Robusto وToro المشتركَين بين الأغلفة الثلاثة.'
 WHERE `name` = 'Antonius' AND SHA1(TRIM(`history`)) = 'd1e7bec67fbd22f4fb675b5c4008eb59d261ed53';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Antonius' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'd1e7bec67fbd22f4fb675b5c4008eb59d261ed53';
-- brands|Arnold André|history|ar — villes traduites
UPDATE `brands` SET `history_ar` = 'شركة Arnold André شركة عائلية ألمانية أسّسها Johann Friedrich Christian André عام 1817 في مدينة أوسنابروك لإنتاج تبغ التدخين؛ وانتقلت عائلة André إلى مدينة بوندة (شمال الراين-وستفاليا) عام 1851، حيث لا يزال مقر الشركة قائمًا هناك بعد سبعة أجيال. ومن أجل سيجارها الملفوف يدويًا، افتتحت الشركة عام 2011 مصنعًا خاصًا بها هو Arnold André Dominicana S.R.L.، في المنطقة الحرة الصناعية بمدينة سانتياغو دي لوس كاباييروس؛ واكتمل عام 2015 النقل الكامل لعملية لف السيجار طويل الحشوة إلى هذا المصنع. وفي بوندة، تنتج الشركة أيضًا سيجارًا وسيجاريلو بالآلة.

تضم التشكيلة الخاصة التي بُنيت في سانتياغو خمس علامات من السيجار طويل الحشوة. أُطلقت Carlos André عام 2009 تكريمًا للابن الأصغر لصاحب الشركة Axel-Georg André، وتُلف بغلاف Connecticut Shade Desflorado إكوادوري. وتجمع Buena Vista (2013)، بحسب الشركة، بين تبغ دومينيكاني وبرازيلي وبيروفي ونيكاراغوي، من بينه تبغ Araperique برازيلي نادر مُعالَج بطريقة Perique. أما Beast (2016)، وهو مشروع شخصي لـ Axel-Georg André، فيجمع بين غلاف San Andrés مكسيكي ورباط من Sumatra وحشوة برازيلية ونيكاراغوية. ووصلت Montosa إلى الولايات المتحدة عام 2022، وتُقدَّم بنسختين: Natural (بغلاف Connecticut Shade إكوادوري) وMaduro (بغلاف San Andrés مكسيكي). أما Parcero، فبدأت في ربيع 2021 بنسخة Dominicano بغلاف مكسيكي، وانضمت إليها عام 2022 نسخة Brasil بغلاف Mata Fina.'
 WHERE `name` = 'Arnold André' AND SHA1(TRIM(`history`)) = '627fd0eba57a12c7f4901b8b357285f551737e18';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Arnold André' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '627fd0eba57a12c7f4901b8b357285f551737e18';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Artista Cigars' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'ae7cdbcd99c39fc7bf15bbfcc64fdd33c22d163a';
-- brands|Arturo Fuente Hemingway|history|ar — ville traduite
UPDATE `brands` SET `history_ar` = 'خط Hemingway هو خط من Arturo Fuente يُلفّ يدويًا في Tabacalera A. Fuente y Cía في سانتياغو بالجمهورية الدومينيكية، وهو مصنع تقول الدار إنه افتُتح عام 1980. وتاريخ صدوره مختلف عليه: 1981 بحسب الجدول الزمني للدار (arturofuente.com)، و1983 بحسب الملف الصحفي للدار والصحافة المتخصصة.

يُعرف الخط بطرازاته المدبّبة (figurados)، وهي حرفة يقول الملف الصحفي للدار إنها ضاعت منذ كوبا. وبحسب ملفه الصحفي، وجد Carlito Fuente القوالب من جديد في مستودع يبور سيتي، ودرّب Carlos Fuente لافًّا ماهرًا نقل الحرفة إلى بقية الفريق.

بالنسبة إلى Work of Art وShort Story وClassic، تذكر الصحافة المتخصصة غلافًا من الكاميرون فوق غلاف داخلي وحشوة دومينيكيين، بقوة من المتوسطة إلى ما فوق المتوسطة بحسب الطراز (الحالة كما قُرئت في أكتوبر 2026). ويتبع تصنيف الموقع بلد اللفّ، أي الجمهورية الدومينيكية؛ والكاميرون هو أصل الغلاف.

يسرد كتالوغ الدار (أكتوبر 2026) ثمانية طرازات: Short Story وBest Seller وBetween The Lines وWork of Art وSignature وClassic وUntold Story وMasterpiece، وهذا الأخير بطول تسع بوصات، وهو الذي يتصدّر القائمة طولًا. ورموز الغلاف في الصفحة (N وM وS) غير معرَّفة فيها.'
 WHERE `name` = 'Arturo Fuente Hemingway' AND SHA1(TRIM(`history`)) = 'a2da9f37e6c65c01e7c6329357916321e40dfca0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Arturo Fuente Hemingway' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'a2da9f37e6c65c01e7c6329357916321e40dfca0';
-- brands|Arturo Fuente Maduro|history|ar — سيجارات تعني سجائر
UPDATE `brands` SET `history_ar` = 'Arturo Fuente Maduro هو النسخة ذات غلاف المادورو من الخط الرئيسي لـ Arturo Fuente، ويُلفّ في الجمهورية الدومينيكية. وبحسب الصحافة المتخصصة (بطاقة Churchill Maduro، أكتوبر 2017)، الغلاف من Connecticut broadleaf القادم من الولايات المتحدة، فوق غلاف داخلي وحشوة دومينيكيين؛ ويصف أحد تجار التجزئة (Neptune Cigar، أكتوبر 2026) التركيبة نفسها. ولم يكن غلاف المادورو من Fuente دائمًا بهذا المصدر: فبطاقة من الصحافة نفسها تعود إلى 2001 تذكر غلافًا من الكاميرون لـ Rothschild Maduro. أما الرواية السابقة عن غلاف برازيلي (Bahia وArapiraca) فلا صفحة تسندها، وهي مسحوبة. ويبلغ طول Churchill Maduro ‏7 ¼ بوصات بقياس حلقة 48 (البطاقة نفسها). وتُذكر القوة متوسطة لدى أحد تجار التجزئة، ومتوسطة إلى كاملة لدى آخرين (أكتوبر 2026). وتعرض صفحة الدار عن سيجارها ذي الحشوة القصيرة (Medium Filler) سيجارًا مصغّرًا (minis) بغلاف طبيعي وبغلاف مادورو، دون غلاف برازيلي (أكتوبر 2026). ولا تثبت أي من صفحات الدار المقروءة بقية طرازات الخط.'
 WHERE `name` = 'Arturo Fuente Maduro' AND SHA1(TRIM(`history`)) = '299dbd1768047acf00733bcbf771d1f0d51b01e6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Arturo Fuente Maduro' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '299dbd1768047acf00733bcbf771d1f0d51b01e6';
-- brands|Aruhiba|history|ar — nom de personne en latin
UPDATE `brands` SET `history_ar` = 'Aruhiba سيجار أروبا، ولا سيجار غيره: Benjamin Petrocchi، ابن عائلة كانت تزرع الفاصولياء، وضع التبغ في الأرض نفسها وشرع يلفّه. منذ 2005، يقول دليل سفر، ويعدّ زوّار 2026 إحدى وعشرين سنة؛ ولم تؤرّخه صحافة السيجار ولا الصحافة المحلية على نحو آخر. الورشة في نورد، قرب الطاحونة الهولندية في بالم بيتش، بمحاذاة الفنادق؛ ومتجر ثانٍ في أورانييستاد.

يصف دليل هولندي فترة ما بعد الظهر: امرأتان فرزتا الأوراق في الصباح تلفّان، نحو أربعين سيجارًا في الساعة، أوراقًا فاتحة وداكنة؛ ويضيف مكتب السياحة أنّ النبتات تُحمى بمستخلص النيم بدل مبيد صناعي. مزروع ومجفّف وملفوف في جزيرة قاحلة مساحتها مئة وثمانون كيلومترًا مربّعًا، صبّار وريح — لا يُعرف إن كان الغلاف من مكان آخر: لم تكتبه الدار قطّ، كما لاحظ متذوّق منذ 2014.

هذه بطاقة من مصادر سياحية، بالإنجليزية والهولندية، وتقول ذلك؛ أمّا نطاق الدار القديم فيخدم اليوم متجرًا في أوكرانيا لا صلة له بها. تدخل أروبا مكانَ لفّ وزراعة، على مقياس متجر.'
 WHERE `name` = 'Aruhiba' AND SHA1(TRIM(`history`)) = '50778a7446cce6a5257b86cd439cbfa923fa75ba';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Aruhiba' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '50778a7446cce6a5257b86cd439cbfa923fa75ba';
-- brands|Asylum|history|ar — marques et noms en latin
UPDATE `brands` SET `history_ar` = 'Asylum هي النصف الآخر من CLE. أنشأها Tom Lazuka عام 2012 مع صديقه القديم Christian Eiroa، في السنة نفسها التي أسّس فيها هذا الأخير CLE بأحرفه الأولى.

والإنتاج موزّع على بلدين. فمعظمه يخرج من NACSA — Nicaragua American Cigars — في إستيلي؛ والباقي من مصنع Aladino في دانلي بهندوراس. وهذه البطاقة نيكاراغوية لأنّ الأطلس يصنّف بالمكان الرئيسي، وهو يكتب الثاني بدل أن يكتمه.

ويستحقّ مصنع دانلي جملةً خاصة به: فقد كان دار سينما، وكان يملكه جدّ Christian Eiroa. وهو أيضًا من أوائل المنشآت التبغية التي اعتمدتها Bayer CropScience.

وقد عُرفت العلامة بمقاساتها المفرطة — إذ يصل Asylum 13 إلى أقطار قلّ أن تجرؤ عليها الدور — وبسعر لا يجاري هذا الإفراط. إنّه موقف مقصود، نقيض النبرة التراثية لـCLE، مع أنّ الاثنتين تخرجان من اليدين نفسيهما.'
 WHERE `name` = 'Asylum' AND SHA1(TRIM(`history`)) = 'd7f15217aef78cd43becd0e6f81f16e28259d472';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Asylum' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'd7f15217aef78cd43becd0e6f81f16e28259d472';
-- brands|Atabey|history|ar — marques et noms en latin
UPDATE `brands` SET `history_ar` = 'يحمل Atabey اسم الإلهة الأمّ لدى التاينو، أوائل سكّان جزر الأنتيل الكبرى — إلهة المياه العذبة والخصب. والاختيار يعلن الطموح: الصعود إلى ما قبل كوبا، وما قبل إسبانيا، إلى الأصل المفترض للتبغ.

مبتكره، Nelson Alfonso، فنّان كوبي أمضى سنوات يرسم لـHabanos S.A.: فهو من صمّم الهوية البصرية لـCohiba Behike، السيجار الذي شكّل سعره قطيعة في الصناعة الكوبية. وفي 2012 أسّس Selected Tobacco في كوستاريكا وانتقل إلى الضفّة الأخرى: لم يعد يكسو سيجار الآخرين، بل صار يصنع سيجاره.

يُنتَج Atabey بكميات محدودة جداً، بمقاسات ذات أسماء طقسية — Divinos وBrujos وDelirios وRitos. الطابع لطيف إلى متوسط، محكم البناء إلى أقصى حدّ، برهافة قلّ أن تُصادَف خارج هافانا: أرز وقشدة وزهور بيضاء، وطول لا يدين بشيء للقوّة.

إنه أغلى سيجار في هذا الأطلس، وأحد القلائل الذين جاء صانعهم من الرسم لا من الحقل.'
 WHERE `name` = 'Atabey' AND SHA1(TRIM(`history`)) = 'a66ac83ace8ea8c3ae25f1bc29b30b1ecb9bdcae';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Atabey' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'a66ac83ace8ea8c3ae25f1bc29b30b1ecb9bdcae';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Atatürk' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'a6318aa47cda0afec9083e8acdef4c7a5e5b39ef';
-- brands|Baccarat|history|ar — marque en latin, القطعة
UPDATE `brands` SET `history_ar` = 'Baccarat حالة دراسية: سيجار ينظر إليه الخبراء من عَلٍ، وأحبّته أجيال من المدخّنين. خصوصيّته في الرأس المحلّى — عملية يُطلى فيها موضع القطع بصمغ لطيف. يراها المتشدّدون خيانة؛ أمّا الباعة فيعرفون أنها غالباً أوّل سيجار في حياة أحدهم.

والخلطة نفسها لطيفة، بغلاف فاتح واحتراق شديد الانتظام، مصمَّمة كي لا تصدم أحداً. وهذا بناء مقصود لا عيب تصنيع: فالدار تقرّ منذ زمن بأنها تصنع سيجار بداية، في مهنة تفضّل مخاطبة أهل الاختصاص.

ويكسب الأطلس حين يقول ذلك بوضوح بدل تجاهله. فقسم وافر من مدخّني السيجار في القارة الأميركية بدأوا بهذا تحديداً، ووظيفة المدخل هذه تساوي، في تاريخ الذائقة، ما تساويه الخلطات الفاخرة.'
 WHERE `name` = 'Baccarat' AND SHA1(TRIM(`history`)) = '85b5eb4a9cdd3d43e6bfd40d578cf4411b6a396f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Baccarat' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '85b5eb4a9cdd3d43e6bfd40d578cf4411b6a396f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bahia' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '081b9798f3d2502fb21355c7ba1aac3cae1ce51e';
-- brands|Balmoral|history|ar — marque, noms latins, سيجارات
UPDATE `brands` SET `history_ar` = 'Balmoral اسمٌ هولندي على سيجار دومينيكي. تصنع Royal Agio، دار دويزل، منذ قرن سيجارًا آليًّا — Panter وMehari''s — لا يحمله هذا الأطلس؛ لكنّها افتتحت سنة 1990 مصنعًا في سان بيدرو دي ماكوريس بجمهورية الدومينيكان، وهناك انتهت إلى اللفّ اليدوي. جاء الخطّ الفاخر متأخّرًا: Añejo 18 سنة 2014، ثم Añejo XO في تموز/يوليو 2015 — غلاف برازيلي مزروع تحت الشمس، ورقة رابطة olor دومينيكية، حشوة من البرازيل وجمهورية الدومينيكان ونيكاراغوا — وكانت توزّعها آنذاك في الولايات المتحدة Drew Estate. ثم وقّع Boris Wintermans، رئيس Agio، سلسلة Serie Signaturas بأربع أيدٍ: Dueto مع Ernesto Perez-Carrillo سنة 2018، وPaso Doble مع Litto Gomez سنة 2019 — داران من هذا الأطلس.

في كانون الثاني/يناير 2020 اشترت Scandinavian Tobacco Group شركة Agio، من أجل سيجارها الآلي في المقام الأوّل. وفي الأوّل من أيّار/مايو التالي سحبت STG Balmoral من السوق الأمريكية — مبيعات ضعيفة، وشكٌّ في أن يكون أيّ خطّ منها موجودًا قبل 15 شباط/فبراير 2007، التاريخ الذي يعفي السيجار من قواعد FDA — وحوّلت مصنع سان بيدرو دي ماكوريس إلى السيجار الآلي وحده. وتستمرّ Balmoral في أماكن أخرى، في أوروبا أوّلًا، وتُلفّ منذئذٍ في General Cigar Dominicana في سانتياغو.

يصنّف هذا الأطلس هنا إذن علامة مجموعة، مثل Bolívar Honduras: دومينيكية باللفّ، هولندية بالاسم، دنماركية بالمالك، وغائبة عن البلد الذي وصفتها فيه صحافة المهنة. ولا تحمل البطاقة سوى المُلفوف يدويًّا.'
 WHERE `name` = 'Balmoral' AND SHA1(TRIM(`history`)) = '9587bae66253cd2bed87f09d812b1fc8e85a45ac';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Balmoral' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '9587bae66253cd2bed87f09d812b1fc8e85a45ac';
-- brands|Bandolero|history|ar — أسماء لاتينية، عبارة ممنوعة
UPDATE `brands` SET `history_ar` = 'Bandolero هي العلامة الثالثة لـSelected Tobacco، وأصرحها. وتتلخّص حجّتها في معطى واحد: يُعتَّق التبغ خمس سنوات أو ما يزيد قبل اللفّ.

هذا التعتيق الطويل هو المعلومة الوحيدة التي تفصح عنها الدار بشأن الخلطة — أمّا التركيب فيبقى مكتوماً، وهو ما يزعج قسماً من الهواة ويشكّل جزءاً من اللعبة. وفي مهنة تُفصَّل فيها عادةً أصولُ كل ورقة، يكون هذا الصمت خياراً.

والنتيجة سيجار مستدير بلا حواف، تبحث فيه عبثاً عن مرارة التبغ الفتيّ أو فلفله الأخضر: فقد أدّى الزمن عمله. نفحات فواكه مجفّفة وخشب مصقول وشوكولاتة بالحليب، باحتراق شديد الانتظام.

ومثل شقيقتيها، تصدر Bandolero بكميات ضئيلة وتُوجد في حفنة عناوين لكل بلد. إنها سيجار جامعٍ بقدر ما هي سيجار مدخّن.'
 WHERE `name` = 'Bandolero' AND SHA1(TRIM(`history`)) = 'fdae7c20ec181ecb1ef4c940da459722acc67d1e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bandolero' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'fdae7c20ec181ecb1ef4c940da459722acc67d1e';
-- brands|Baron Ullmann|history|ar — أسماء الأشخاص بالحرف اللاتيني
UPDATE `brands` SET `history_ar` = 'Georg Baron von Ullmann junior، وريث أسرة المصرفيين الألمانية Sal. Oppenheim (بحسب موقع cigarworld.de)، وشريكه Francisco Diaz Suarez، اشتريا مصنعًا في جمهورية الدومينيكان ليُلفّ فيه باليد سيجار وُلد، بحسب الدار، من فكرة شخصية قبل أن يصير مشروعًا تجاريًا. والشركة مسجَّلة في جمهورية الدومينيكان باسم Baron Von Ullmann & Frandisuarez Corp., S.A. (بحسب Justia Trademarks وopencorporates.com)، وتبيع سيجارها منذ، بحسب تاجر سيجار ألماني، نحو عشرين عامًا — كانت طويلًا مخصَّصة للهدايا قبل أن تدخل التجارة. ولا تحدّد أيٌّ من المصادر التي عُثر عليها مدينة المصنع.

يجمع الكتالوج الحالي بين غلاف كاميروني ورباط وحشوة من جمهورية الدومينيكان ونيكاراغوا (cigarworld.de). وثمّة خطّان موثَّقان: Corona وGran Robusto Edición Limitada. وتُوزَّع العلامة في ألمانيا عبر عدّة تجّار مستقلّين.'
 WHERE `name` = 'Baron Ullmann' AND SHA1(TRIM(`history`)) = '2b52e6e899d8f6e57bc2d74ef38bfa9bac99a13f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Baron Ullmann' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '2b52e6e899d8f6e57bc2d74ef38bfa9bac99a13f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Barrio Viejo' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '45c2179b6999664c85016ae006f71002090f02e4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bauza' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '28b24af6cd24721802039164538d8aef98418ecf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Belmore' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '836080f3e1ebed35e8638fba2558ba631b2570f4';
-- brands|Bering|history|ar — أسماء لاتينية، عبارة ممنوعة
UPDATE `brands` SET `history_ar` = 'Bering اسم من تامبا. وُلدت العلامة سنة 1905 لدى Corral, Wodiska y Ca.، في فلوريدا مصانع «إيبور سيتي» الكبرى، في زمن كان الحيّ ينتج فيه مئات الملايين من السيجار سنوياً وتعمل فيه الشركات الكوبية المنفيّة إلى جانب البيوت الإسبانية.

أنتجت دار تامبا حتى 1985. عندها اشترت مجموعة Swisher العلامة، ونقلت التصنيع إلى هندوراس سنة 1990، وبنت هناك مصنعاً في دانلي، ثم باعت الكلّ — العلامة والمصنع — إلى Nestor Plasencia سنة 2002. وهكذا صارت Bering اليوم ملكاً لعائلة حاضرة أصلاً في هذا الأطلس، من الجهة النيكاراغوية.

ولهذا تربطها هذه الصفحة بهندوراس لا بالولايات المتحدة: فهي تُصنع هناك منذ ما يزيد على ثلاثين عاماً، وهذا ما يفسّر مذاقها.

الطابع هندوراسي كلاسيكي، في أيسر مستوياته منالاً: خشب وتراب واحتراق صريح، بلا قوّة خلطات خاماستران. وتغطّي التشكيلة مقاسات كثيرة ونحيلة غالباً، إرثاً مباشراً للعادات الأميركية في منتصف القرن.'
 WHERE `name` = 'Bering' AND SHA1(TRIM(`history`)) = 'ceaaeb4e6bf685c9ddfe08cce865616bb8286242';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bering' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'ceaaeb4e6bf685c9ddfe08cce865616bb8286242';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'BerlinCigarMen' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'ad3d801c0d92a9bb0571cab09d324d42e94048c7';
-- brands|BIN Cigar|history|ar — اسم شخص بالحرف اللاتيني
UPDATE `brands` SET `history_ar` = 'وُلدت BIN Cigar — PT Boss Image Nusantara — سنة 2013 في جمبر، مدينة التبغ في جاوة الشرقية، بمبادرة Abdul Kahar Muzakir، رجلٍ من خمسين سنة في التبغ توفّي منذ ذلك الحين، أراد أن يحمل السيجار الإندونيسي إلى العالم. كان رهانه زراعيًّا قبل أن يكون تجاريًّا: أقلمة صنف من بذور كوبية، الهافانا، في جمبر، وزراعته في تربة جاوة الشرقية — وتقول الصحافة المحلية إنّه نجح محتفظًا بطابعه.

كانت جمبر حتى ذلك الحين تصدّر ورقتها الخام في الغالب، تبغ Besuki Na-Oogst الذي يشتريه العالم كلّه للأغلفة؛ أمّا BIN فتلفّ ورقتها يدويًّا وتبيعها باسمها. تقول الدار إنّها تصدّر إلى اثني عشر بلدًا وتستند إلى سبع وعشرين سفارة إندونيسية لتعريف نفسها؛ وفي 2025 كانت تستهدف الولايات المتحدة. تنسب البطاقة هذه الأرقام إلى الصحافة الإندونيسية التي تنشرها، وإلى الدار.

BIN من جمبر، كما Golden Djawa ومصانع Villiger وBurger Söhne التي تسمّيها بطاقاتها السويسرية.'
 WHERE `name` = 'BIN Cigar' AND SHA1(TRIM(`history`)) = '68f8f4374d3a296e3a93e61ee5b6fadc8797a1ff';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'BIN Cigar' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '68f8f4374d3a296e3a93e61ee5b6fadc8797a1ff';
-- brands|Black Label Trading Co.|history|ar — أسماء لاتينية
UPDATE `brands` SET `history_ar` = 'Black Label Trading دار فنّانين بقدر ما هي دار تبغ. أسّسها James وAngela Brown في نيكاراغوا عام 2013، ويرسم James كلّ الأحزمة بنفسه.

وفي 2015، بعد عامين من البداية، افتتحا مصنعهما الخاص في إستيلي: Fábrica Oveja Negra — الخروف الأسود. وقد صُمّم ليشبه مرسم فنّان لا خطّ إنتاج، وليست تلك عبارة دعائية: فالخيار يُرى في الحجم وفي الإيقاع.

ويُلَفّ كلّ شيء باليد. وتأتي الأوراق من نيكاراغوا وهندوراس وSan Andrés في المكسيك والإكوادور.

وتشكّل أسماء السلاسل سجلًّا متّصلًا: Last Rites وBishops Blend وBenediction وSanta Muerte وSalvation وDeliverance وRoyalty. إنّها أيقونوغرافيا جنائزية وطقسية، مُتابَعة حتى آخر خطّ في الرسم — وهي ما يميّز هذه الدار قبل أن يُشعَل أيّ شيء بوقت طويل.'
 WHERE `name` = 'Black Label Trading Co.' AND SHA1(TRIM(`history`)) = 'e145f1dc6eb17cab7f157d25ab36a31432e4b2ec';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Black Label Trading Co.' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'e145f1dc6eb17cab7f157d25ab36a31432e4b2ec';
-- brands|Blackbird Cigar Co.|history|ar — أسماء لاتينية، جملة ركيكة
UPDATE `brands` SET `history_ar` = 'Blackbird مصنعٌ دومينيكي اختار أن يسمّي كلّ شيء بأسماء الطيور، وهذا نظامٌ قبل أن يكون تأنّقًا: فكلّ مزجة تحمل اسم نوع — Crow وRook وJackdaw وFinch وCuco وUnkind وNest وSuperb وCactus Wren — والاسم يقول الطبع قبل الطوق.

أسّسه Jonas Santana سنة 2016 مع أخيه. وهو يأتي من Tabacalera El Artista، مصنعٍ في تامبوريل تعلّم فيه الحرفة وما شغله منذ ذلك الحين، أي مراقبة الجودة. يُسمّى المصنع Blackbird Dominicana؛ والشركة في هياليا بفلوريدا، ومنها تتولّى توزيعها بنفسها — نموذجٌ كثيرًا ما يراه هذا الأطلس معكوسًا، العلامة في ميامي والصنع موكولٌ إلى غيرها.

وما يربطه ببقيّة هذا الأطلس هو الورقة. فـSantana لا يشتري من السوق: تبغه كلّه يأتي من Jochy Blanco، مزارعٍ من الجيل الرابع ورئيس Tabacalera Palma التي يحمل هذا الأطلس بطاقتها. مصنعٌ يلفّ وآخر يزرع — التقسيم نفسه عند آل Reyes في سانتياغو، بين عائلتين بدل واحدة.'
 WHERE `name` = 'Blackbird Cigar Co.' AND SHA1(TRIM(`history`)) = '2b4035353ae4798e413dff1ffd03e80423ecf301';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Blackbird Cigar Co.' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '2b4035353ae4798e413dff1ffd03e80423ecf301';
-- brands|Blanco Cigars|history|ar — عبارة ممنوعة، أسماء لاتينية
UPDATE `brands` SET `history_ar` = 'Blanco شأنُ أبناء عمومة. تأتي العائلة من بينار ديل ريو، مقاطعة التبغ الكوبية، حيث كانت جارةً لآل Plasencia — تتعارف العائلتان منذ ثمانين سنة، كما يقول آل Blanco، وآل Plasencia هم اليوم من يلفّون سيجاراتهم في إستيلي. لذلك يصنّفها هذا الأطلس في نيكاراغوا، حيث تصير الورقة سيجارًا؛ أمّا المنضدة ففي سيمينول بفلوريدا.

تعود الشركة إلى 1998. أسّسها Cesar A. Blanco مع أخيه Francisco وابنه David، مستأنفًا ما أرساه Cesar Sr. في مطلع القرن العشرين. وDavid Blanco هو المزّاج: هو يركّب، وعند أبناء العمومة يُلفّ، في مصانع تمسك الزراعة والصنع من طرف إلى طرف، في دانلي كما في إستيلي.

والخطّ الذي يعبّر عن الدار خير تعبير اسمه Liga Exclusiva de Familia — مزجة العائلة الحصرية. كانت الاحتياطي الخاص للأخوين قبل أن تُباع، وهي بنسختين هما مزاجان: يفضّل Cesar الـConnecticut Shade الكريمي؛ ويفضّل David الـPennsylvania Broadleaf Maduro الأخشن. وBlanco Nine هو الاسم الآخر الذي يعرفه الهواة.'
 WHERE `name` = 'Blanco Cigars' AND SHA1(TRIM(`history`)) = '424c5ebc4d3a0fa5acb2e15afd2afc8f993f4b0d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Blanco Cigars' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '424c5ebc4d3a0fa5acb2e15afd2afc8f993f4b0d';
-- brands|Bock y Ca.|history|ar — أسماء الأشخاص بالحرف اللاتيني
UPDATE `brands` SET `history_ar` = 'بحسب مدوّنة Villiger، أسّس الألماني Gustav Bock Müller (1837-1910)، الذي هاجر إلى كوبا، مصنع El Águila de Oro في هافانا سنة 1865؛ وظلّ اسم Bock، الموثَّق على علامة منذ 1888، مرتبطًا به، وتنسب إليه Villiger اختراع حلقة السيجار سنة 1880. تراجعت العلامة بعد وفاة Bock سنة 1910 وانطفأت كدار كوبية. وأعاد Heinrich Villiger اكتشافها فأطلقها من جديد سنة 1999 سيجارًا دومينيكيًا، عبر فرعه El Mundo De Tabaco، وتضع الدار تحديثًا للعلامة سنة 2008. ومنذ ذلك الحين تُلفّ Bock y Ca. في ABAM Cigars S.R.L.، وهو مصنع يديره الكوبي المنفيّ Matías Maragoto، المقيم في جمهورية الدومينيكان منذ 1996 مع أخيه José وزوجته Aidee، في المنطقة الحرة الصناعية بفيّا ميّا، في سانتو دومينغو نورتي — وهو المصنع الذي يُلفّ أيضًا لصالح Villiger كلًّا من La Flor de Ynclan و1888 وCorrida؛ أمّا La Libertad فقد لُفّت فيه قبل انتقالها إلى إستيلي، حيث عُرضت خلطة جديدة في كانون الثاني/يناير 2022.

في 2024، احتفلت Villiger بمرور خمسة وعشرين عامًا على إعادة الإطلاق بإصدار محدود هو Bock Renacimiento 25 Años، لفّته ABAM (halfwheel). ويضمّ الكتالوج الحالي، بحسب cigarworld.de، قياسات Corona Tubo وRobusto وPanetela وChurchill، برباط إندونيسي وحشوة دومينيكية ونيكاراغوية، تُوصَف بأنها سيجار متوسط القوة بحلاوة كريمية معهودة في جمهورية الدومينيكان (Villiger).'
 WHERE `name` = 'Bock y Ca.' AND SHA1(TRIM(`history`)) = '2824c5ed9be8ff7bccc88489ae2bc1647832a405';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bock y Ca.' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '2824c5ed9be8ff7bccc88489ae2bc1647832a405';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bohekio' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'baad3d1b5e8274ea49b1ee948a63ba262d8961a5';
-- brands|Bolívar Honduras|history|ar — أسماء لاتينية
UPDATE `brands` SET `history_ar` = 'يأتي الاسم من كوبا حيث وُلدت العلامة في مطلع القرن العشرين. أمّا النسخة غير الكوبية فهندوراسية: تُلفّ في مصنع HATSA — Honduras American Tobacco — بمدينة دانلي، وهو أحد مصنعَين كانت تديرهما عائلة Villazon في البلد. وقد اشترت General Cigar شركة Villazon عام 1997 بمبلغ 81.4 مليون دولار.

وتحمل خلطة Cofradia اسم مصنع Villazon الآخر، وهي من عمل Estélo Padrón، مدير الإنتاج في مصانع HATSA: غلاف إكوادوري من بذرة سومطرة، وغلاف داخلي من Connecticut Broadleaf الأمريكي، وحشوة هندوراسية ونيكاراغوية.

وفي أكتوبر 2024 سحبت مجموعة Scandinavian Tobacco Group هذه العلامة من قائمة أسعارها، مع El Rico Habano وHelix. ولا يزال مصنع دانلي يعمل؛ أمّا الحلقة فلم تعد تُصنع. وهذه البطاقة صارت من الآن بطاقة أرشيف.'
 WHERE `name` = 'Bolívar Honduras' AND SHA1(TRIM(`history`)) = '7c62edca381518734bf0a83cbb92a5060e9e6ac4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bolívar Honduras' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '7c62edca381518734bf0a83cbb92a5060e9e6ac4';
-- brands|Bombay Tobak|history|ar — أسماء لاتينية
UPDATE `brands` SET `history_ar` = 'Bombay Tobak دارُ Mel Shah، صاحب Fame Lounge في بالم سبرينغز بكاليفورنيا — حانةُ سيجار ونبيذ وجعة. أسّس الشركة في أيّار/مايو 2014 ليوزّع في البلاد كلّها السيجارات التي كان يصنعها لصالونه، تحت علامة MBombay. يقول الاسم الأصل الهندي للمؤسّس، وتقوله الخطوط أيضًا: Gaaja، في تموز/يوليو 2016، من gaja، فيل الثقافة الهندوسية؛ وKēsara هو الزعفران؛ وMōra الطاووس.

كلّ شيء يُلفّ في كوستاريكا، في بوريسكال، لدى Tabacos de Costa Rica — المصنع الذي يصفه هذا الأطلس في بطاقة Vegas de Santiago (تكتب Casdagli أنّه كان معروفًا آنذاك بهذا الاسم) والذي يلفّ أيضًا Selected Tobacco وVilla Casdagli وMalekö وSkull 77 وZechbauer Royales. ويسمّي Cigar Coop Andrés León مالكًا له ومشغّلًا، ويعدّ Bombay Tobak، مع Selected Tobacco، من العلامات الخارجة منه. وتبقى كوستاريكا، هنا أيضًا، بلدَ ورش: الأتبغة تأتي من مكان آخر — الإكوادور وجمهورية الدومينيكان وبيرو ونيكاراغوا.

خطّ Classic بـConnecticut إكوادوري هو الألطف؛ وM.Estelí سنة 2019 الأقوى في الدار، بـHabano 2000 إكوادوري على حشوة نيكاراغوية في معظمها. اسم إستيلي على سيجار مُلفوف في كوستاريكا دَينٌ للتبغ لا للورشة — تنصّ البطاقة على ذلك لأنّ قاعدة الأطلس هي مكان اللفّ.'
 WHERE `name` = 'Bombay Tobak' AND SHA1(TRIM(`history`)) = 'c1a64acbe7a57c9fca124841f32ac4e2f5a6d31b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bombay Tobak' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'c1a64acbe7a57c9fca124841f32ac4e2f5a6d31b';
-- brands|Bongani|history|ar — أسماء لاتينية
UPDATE `brands` SET `history_ar` = 'Kamal Moukheiber، لبناني المولد وخرّيج مدرسة HEC باريس، أمضى خمسة عشر عامًا في الصيرفة الاستثمارية بلندن — Credit Suisse وLehman Brothers — قبل أن يستقرّ في مابوتو عام 2013 من أجل مشروع عقاري. وجاءته الفكرة في مقهى بالعاصمة، وهو يرى الزبائن يدخّنون: أفريقيا تزرع التبغ ولا تلفّه.

خرج أول سيجار في ديسمبر 2016. واستقدم Moukheiber معلّم سيجار دومينيكيًّا، عمل سابقًا لدى General Cigar على Macanudo، ليدرّب لافّات موزمبيقيات؛ تخرّجت الدفعة الأولى عام 2017، وثانية قيد التدريب. وتُنتج الورشة في حي بايشا بمابوتو نحو عشرة آلاف سيجار شهريًا، فيما يُبنى مصنع جديد في منطقة حرة.

يُزرع التبغ في موزمبيق على يد مزارعين بعقود، من بذور دومينيكية. ويأتي الغلاف من الكاميرون — التي يضمّها هذا الأطلس بوصفها بلد غلاف — وتُعتَّق السيجار في صفائح خشب الأرز من غانا. وتُباع الدار في موزمبيق وجنوب أفريقيا وكينيا ونيجيريا والكونغو وساحل العاج، التي يضمّ هذا الأطلس عناوينها.

كثيرًا ما يُقال إنّ Bongani أول سيجار «أفريقي بالكامل». غير أنّ مؤسّسها لا يقول ذلك: فهو يعلن انتقاءً تقوده الجودة، من أفريقيا ومن غيرها، والحشوة تمزج تبغًا أفريقيًّا وغير أفريقي. أمّا الاسم فيعني «كن شاكرًا» بلغة الزولو.'
 WHERE `name` = 'Bongani' AND SHA1(TRIM(`history`)) = '9ef23c6450a282f6cdc06a7f4cf3d1c85ca5f8e4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bongani' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '9ef23c6450a282f6cdc06a7f4cf3d1c85ca5f8e4';
-- brands|Boutique Blends|history|ar — أسماء لاتينية
UPDATE `brands` SET `history_ar` = 'أنشأ Rafael Nodal علامة Aging Room عام 2011. ويصنع السيجار José «Jochy» Blanco في مصنع Tabacalera La Palma بتامبوريل في جمهورية الدومينيكان، باستثناء La Bohème وQuattro Nicaragua وPelo de Oro، التي تُلفّ في نيكاراغوا لدى A.J. Fernandez. وتضمّ الدار أيضًا علامة Swag.

واسم Nodal وارد في موضع آخر من هذا الأطلس: فهو من أعاد ضبط خلطة Trinidad Santiago لصالح Altadis — وهي أيضًا من صنع Jochy Blanco.'
 WHERE `name` = 'Boutique Blends' AND SHA1(TRIM(`history`)) = '2829a50841eb79764311c3cb5fb078003723e1fa';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Boutique Blends' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '2829a50841eb79764311c3cb5fb078003723e1fa';
-- brands|Brun del Ré|history|ar — أسماء لاتينية
UPDATE `brands` SET `history_ar` = 'Brun del Ré دارُ صانع ساعات سويسري صار صانع سيجار في كوستاريكا. Carlo Corazza، المقيم في البلد منذ زمن طويل، ترك السجائر سنة 1999، واكتشف السيجار في كوبا سنة 2001 مع صديق، وافتتح صالونًا، وفي 2006 قرّر مع شريكه Sam Capuano أن يصنع بنفسه — ويروي أنّه أعلن ذلك لشريكه كتحدٍّ من الرسوم المتحرّكة. وفي 2007 وجد مصنعًا في سان خوسيه؛ وهو اليوم في إسكاسو، في العائلة، بنحو خمسة عشر موظّفًا وخمسة وعشرين إلى ثلاثين ألف سيجار في الشهر. الاسم اسم جدّته، واسم شعارِ نبالة سويسري عمره قرنان.

إنّها، مع بوريسكال، الموقد الآخر للسيجار الكوستاريكي، وتقدّمها صحافة المهنة دارَ البلد المعروفة. تُسمّى خطوطها Gold وPremium وColonial و1638، وقبل كلّ شيء 1787 Libertad — أوّل سيجار صنعه Corazza كلّه من تبغ كوستاريكي، من مزارع في جنوب البلاد؛ والتاريخ يحيل إلى الزمن الذي كانت فيه كوستاريكا، في مملكة غواتيمالا، تورّد تبغًا مطلوبًا. تبيع الدار في اثنين وعشرين بلدًا، في أوروبا خصوصًا، وتقول إنّها لا تريد النموّ في الكمّية.

يصنّف هذا الأطلس هنا دارًا تلفّ، وتستخدم لخطٍّ واحد تبغًا كوستاريكيًّا بالكامل، جاءها من مزارعٍ في جنوب البلاد — استثناءٌ في بلد الورش، تقول Vegas de Santiago في بوريسكال إنّها تشترك فيه بالنسبة إلى جزء من أوراقها.'
 WHERE `name` = 'Brun del Ré' AND SHA1(TRIM(`history`)) = 'f2c88adb1e5753b7bafb5d155da4d3533ead3280';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Brun del Ré' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'f2c88adb1e5753b7bafb5d155da4d3533ead3280';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bugatti' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '8d7e50cbd92af500a7d49e666886a6dcd5f287cd';
-- brands|Burger Söhne|history|ar — فقرة مكررة، أسماء لاتينية
UPDATE `brands` SET `history_ar` = 'دخلت عائلة Burger تجارة السيجار وتبغ الغليون في سويسرا عام 1864.

وفي 1988 اشترت شركة Dannemann GmbH في لوبِكه بألمانيا، فصارت في المرتبة الثالثة بين منتجي السيجار في العالم. أمّا اسم Dannemann نفسه فيأتي من البرازيل: فقد هاجر Gerhard Dannemann، المولود في بريمن عام 1851، سنة 1872، وافتتح عام 1873 مصنعًا في ساو فيليكس بولاية باهيا بستة عمّال. وصار من كبار صناعيّي الولاية؛ ثم أفلست الشركة عام 1954، وبقي الاسم.

وتملك المجموعة اليوم Dannemann وRitmeester وAl Capone. ويضمّ هذا الأطلس Dannemann، منسوبة إلى البرازيل، أرض مولدها.

للمجموعة أيضًا مصنعٌ في جمبر بجاوة الشرقية، تعدّه الصحافة الإندونيسية بين مصنعَي السيجار ذوَي الحجم الدولي في المدينة، مع مصنع Villiger. تُلفّ ورقة Besuki Na-Oogst، التي يشتريها العالم للأغلفة، هناك في الموقع لسويسرا — يقول هذا الأطلس ذلك هنا، ويروي جمبر في بطاقتَي BIN وGolden Djawa.'
 WHERE `name` = 'Burger Söhne' AND SHA1(TRIM(`history`)) = '8ee6dd2e62bb2689d8dd2318001dd190ad9cc0b7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Burger Söhne' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '8ee6dd2e62bb2689d8dd2318001dd190ad9cc0b7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Butera' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '146c8af153102f1ff6f3c1be5c42405a1c8f5b64';
-- brands|Byron|history|ar — أسماء لاتينية
UPDATE `brands` SET `history_ar` = 'Byron هو الوجه الكلاسيكي لـSelected Tobacco، واسمه مأخوذ من علامة قديمة اختار Nelson Alfonso إحياءها بدل ابتكار اسم جديد — ممارسة صارت شائعة بين البيوت التي تسعى إلى الانخراط في استمرارية.

حيث يلعب Atabey على الرهافة، يلعب Byron على السعة: مقاسات عريضة، وخلطات أكثف، وعطرية من جلد وكاكاو وأخشاب ثمينة. والتشكيلة منظَّمة بحسب «العصور» — كل سلسلة تحيل إلى قرن من تاريخ السيجار، بتبغ وطرائق يُفترض أن تناسبه.

هذا الخيار الإخراجي متّسق مع مسار صاحبه: فـAlfonso جاء من الصورة والسرد لا من علم الزراعة، وعلاماته تروي شيئاً قبل أن تُدخَّن. ومع ذلك، المضمون يواكب — البناء لا تشوبه شائبة، والكميات تبقى ضئيلة.

ومثل Atabey، يُباع Byron بأسعار تضعه في أعلى السوق، في حفنة متاجر لكل بلد.'
 WHERE `name` = 'Byron' AND SHA1(TRIM(`history`)) = '3a9b84d98335d8291a0fa5b7382b4d7f44b1fe57';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Byron' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '3a9b84d98335d8291a0fa5b7382b4d7f44b1fe57';
-- brands|Cabal Cigars|history|ar — عبارة ممنوعة، أسماء لاتينية
UPDATE `brands` SET `history_ar` = 'Cabal — عصبة، كما يقول المؤسّس، بمعنى أناس يجمعهم غرض واحد — علامةُ Chris Arolfo، الذي كان يدير صالون The Smoke Ring في ويبستر بتكساس قبل أن يؤسّسها سنة 2013. قصد Hendrik Kelner Jr.، ابن معلّم التبغ عند Davidoff، في Kelner Boutique Factory في سانتياغو التي يحمل هذا الأطلس بطاقتها: قرابة سنتين من التجارب، إحدى وعشرون مزجة، لسيجار بغلاف Bonao — ورقة دومينيكية نادرة على حزام — على ورقتين رابطتين من بيرو وجمهورية الدومينيكان وحشوة من نيكاراغوا وبنسلفانيا وجمهورية الدومينيكان. والمزجة رقم 19، لفرط اختلافها عن أن تكون Cabal، صارت Esoteric بسلاسل صغيرة.

وهكذا Cabal هي العلامة الرابعة في هذا الأطلس الخارجة من KBF، بعد Casdagli وPrinciple وThe 73 للمصنع نفسه. أمّا جديدها، Initiative، فخرج من مصنع دومينيكي آخر، Tabacalera La Isla، مصنع Hostos Fernández Quesada — غلاف Corojo Colorado إكوادوري، ورقة رابطة نيكاراغوية — ويقدّمه تاجر تجزئة إصدارَ الدار الأوّل منذ ما يزيد على ست سنوات.

ست سنوات من الصمت إذن بين سيجارين: لم تصف صحافة المهنة الدار منذ 2015، وما تعرفه البطاقة عمّا تلا ذلك يأتي من تجّارها وموقعها. يكتبها هذا الأطلس لأنّ المصنعين مسمّيان، ويقول ما لا يعرفه.'
 WHERE `name` = 'Cabal Cigars' AND SHA1(TRIM(`history`)) = 'ad7b5741fdba79927bf774b84e3067b30a3364a8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cabal Cigars' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'ad7b5741fdba79927bf774b84e3067b30a3364a8';
-- brands|Caldwell Cigar Co.|history|ar — أسماء لاتينية، اتساق الأسماء
UPDATE `brands` SET `history_ar` = 'وُلدت Caldwell Cigar Co. من قطيعة. غادر Robert Caldwell شركة Wynwood Cigars وعاد إلى المهنة عام 2014 باسمه الخاص، في معرض IPCPR.

واشترك مع William وHenderson Ventura في Tabacalera William Ventura بجمهورية الدومينيكان. وهي دار أخرى بلا مصنع — النموذج الذي أظهرته الدفعة النيكاراغوية — لكن بخصوصيّة: يبني Caldwell مزائجه حول أتبغة نادرة وسنوات حصاد قديمة، لا حول وصفة قابلة للتكرار.

وضمّت مجموعة الإطلاق ثلاثة مزائج تتجاوب أسماؤها: The King is Dead وLong Live the King. أمّا الثالث، Eastern Standard، فلم يكن مقرّرًا — إذ وُضع بين يدي Caldwell ورق Connecticut خاصّ، فنجحت التجربة، ودخل الخطّ الكتالوج.

وهي طريقة عمل تفسّر حجم الدار: ما لا يمكن الحصول عليه مرّتين لا يمكن إنتاجه بكثرة.

في 26 أيلول/سبتمبر 2022 دمّر حريقٌ Tabacalera William Ventura؛ واستُؤنف الإنتاج في ورش فرعية وفي El Maestro، وأعاد المصنع الجديد فتح أبوابه في آذار/مارس 2024 بالاسم نفسه. وللمصنع بطاقته الخاصة: Tabacalera William Ventura.'
 WHERE `name` = 'Caldwell Cigar Co.' AND SHA1(TRIM(`history`)) = 'e36800c9728c6d4687b7c30f2f1431b4562b155d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Caldwell Cigar Co.' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'e36800c9728c6d4687b7c30f2f1431b4562b155d';
-- brands|Canaritos|history|ar — ملصق، جزر الكناري، أسماء
UPDATE `brands` SET `history_ar` = 'Canaritos هي الدار الكناريّة الوحيدة في هذا الأطلس التي تلفّ في تينيريفي. تقع الورشة في غويمار على الساحل الشرقي، غير بعيد عن سانتا كروث.

وهي تتبنّى ما ترفضه دور لا بالما. فسيجارها من نوع الحشوة القصيرة: الحشوة من قطع الورق لا من أوراق كاملة مطويّة. ولا يدخل التبغ الكناري إلا بنحو الخُمس — والباقي من جمهورية الدومينيكان.

وهذا مكتوب هنا لأنّ الملصق لا يقوله. فعبارة «سيجار جزر الكناري» تُقرأ كأنّها منشأ، وهي قبل كلّ شيء مكان لفّ. والدار لا تخفي ذلك، وسعرها يعكسه: فهي تقصد مدخّن كلّ يوم لا خزانة الترطيب.

وهذا أيضًا ما يجعلها مفيدة في هذا الأطلس. فإلى جانب El Sitio التي تزرع غلافها تحت الأغطية، تُظهر Canaritos النموذج الكناري الآخر — ذاك الذي نجا من انهيار المزارع باستيراد ورقه.'
 WHERE `name` = 'Canaritos' AND SHA1(TRIM(`history`)) = 'c54ee6d4d716f9907f142538a40871cbe84e949d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Canaritos' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'c54ee6d4d716f9907f142538a40871cbe84e949d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Canned Heat' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'd3b616fb2349917779d33d42c03650978eb8f337';
-- brands|CAO America|history|ar — fiche de notation: تقييم
UPDATE `brands` SET `history_ar` = 'CAO America خط من دار CAO، قُدِّم عام 2007 في معرض تجّار التجزئة (RTDA) في هيوستن. وبحسب الصحافة المتخصصة في القطاع (سبتمبر 2007)، كان يُلَفّ في مصنع C.A.O. في هندوراس، بغلافين مزروعين في الولايات المتحدة: Connecticut Shade بني ذهبي وbroadleaf بني شوكولاتي.

التركيبة ليست أمريكية بالكامل: الغلاف الداخلي برازيلي، والحشوة تجمع تبغًا أمريكيًا مع أوراق من نيكاراغوا وإيطاليا والجمهورية الدومينيكية (المصدر نفسه، 2007). وتعطي بطاقة تقييم من 2021-2022 البنية نفسها، مع نيكاراغوا بلدًا للمنشأ؛ وتحتفظ هذه الصفحة بالنسختين. ويأتي أثر pinstripe من غلاف Shade المتروك ظاهرًا تحت أوراق broadleaf (التاجر cigarsdirect.com، أكتوبر 2026).

يصفها تجّار التجزئة بأنها متوسطة القوة إلى قوية (cigarsdirect.com، أكتوبر 2026). والطرازات الأصلية هي Potomac (5 × 56) وLandmark (6 × 60) وMonument، وهو torpedo بطول 6 ¼ بوصة.

تعود ملكية CAO منذ عام 2007 إلى مجموعة Scandinavian Tobacco (Henri Wintermans)، ثم أُدمجت في General Cigar التي مقرها ريتشموند (فرجينيا) نحو 2010-2011.'
 WHERE `name` = 'CAO America' AND SHA1(TRIM(`history`)) = 'e1bb37ca2902c18a87425f059aa4e67e5f91451a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO America' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'e1bb37ca2902c18a87425f059aa4e67e5f91451a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO Black' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '9ad79bcbd23b636dfbb661f1d031ef5da9827129';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO Cameroon' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '347fddff85743e67462b049e16e5cb2c09a3914a';
-- brands|Caoba|history|ar — villes traduites
UPDATE `brands` SET `history_ar` = 'وُلدت Caoba عام 1992 في سانتو دومينغو على يد Don Julio Pérez González، وهو إسباني تزوج من دومينيكانية وكان قد أدار حتى ذلك الحين ورشة لنحت خشب الماهوغني — caoba بالإسبانية، وهو أيضًا الشجرة الوطنية للبلاد: ومن هناك، بحسب الشركة، استُمد اسم العلامة. أُقيم المصنع الأصلي في Villa Faro، شرق العاصمة؛ ثم نقله الجيل التالي إلى المنطقة الاستعمارية من سانتو دومينغو (Ciudad Colonial)، حيث يقع اليوم (بحسب humoytabaco.com، بالإسبانية). وتصف Stogiepress المصنع بأنه متكامل رأسيًا، وله حقوله الخاصة في تامبوريل، في وادي سيباو.

تضم التشكيلة نحو عشر سلاسل بحسب Humo y Tabaco؛ اثنتان منها وصفتهما الصحافة المتخصصة. أما Diamante، وهي قوية بحسب Stogiepress، فتجمع بين غلاف San Andrés مكسيكي ورباط وحشوة دومينيكانيين بالكامل. وعلى النقيض، تحمل Oro غلاف Connecticut Shade إكوادوري فوق رباط وحشوة دومينيكانيين، لملمح أخف (بحسب Leaf Enthusiast). وقُدِّمت العلامة في معرض IPCPR عام 2019 (بحسب halfwheel) ولا تزال متوفرة للبيع.'
 WHERE `name` = 'Caoba' AND SHA1(TRIM(`history`)) = '7f2da9e68f6de42f2c3224627ecf7f17ca9b3f52';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Caoba' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '7f2da9e68f6de42f2c3224627ecf7f17ca9b3f52';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Capadura' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '9fff1d185a2a8d703528fe4cc4a42f8b2ac8f6b2';
-- brands|Capitol|history|ar — marques et noms en latin
UPDATE `brands` SET `history_ar` = 'ليست Capitol دارًا بالمعنى الذي يعطيه هذا الأطلس للكلمة. إنّها علامة لمجموعة Tabacalera، وصناعتها موزّعة على ثلاثة أطراف متمايزة — وهو ما يجعلها مثالًا مدرسيًّا على المهنة كما هي اليوم.

المزيج لـRafael Nodal، صاحب Aging Room وBoutique Blends، والمسؤول أيضًا عن المنتج في Altadis USA. والصناعة لـPlasencia في إستيلي، في مصنع Nestor Plasencia. أمّا الملكية والتوزيع فلـTabacalera. وللأوّلَين بطاقتاهما في هذا الأطلس؛ والثالث مجموعة لا مصنع.

والسيجار نيكاراغويّ من أوّله إلى آخره: الغلاف والرابط والحشوة. ويتّسع الكتالوج لثلاثة قياسات — Jack وCasino وGala — ولا غير.

أمّا الاسم والتقديم فمن عشرينيات القرن الماضي. يقول Nodal إنّه وضع فيهما ولعه بالجاز، وبـDuke Ellington خاصّةً: علامة مبنيّة على عقد وعلى موسيقى، حيث تُبنى غيرها على عائلة أو على أرض.

وأمّا سنة الإطلاق فلا يُثبتها أيّ مصدر متاح، وتؤثر هذه البطاقة قول ذلك.'
 WHERE `name` = 'Capitol' AND SHA1(TRIM(`history`)) = 'dd19335efd3a0eeaaf9c977cf5f1a70a004ee7a7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Capitol' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'dd19335efd3a0eeaaf9c977cf5f1a70a004ee7a7';
-- brands|Casa 1910|history|ar — marques et personnes en latin
UPDATE `brands` SET `history_ar` = 'تحمل Casa 1910 سنة الثورة المكسيكية، وينحدر كتالوجها كلّه منها: Cuchillo Parado، سيجارها الأوّل، هو قرية تشيواوا التي بدأت فيها الانتفاضة؛ وTierra Blanca وEl Ébano معارك؛ والـSoldaderas نساءٌ قاتلن. وُلدت الدار سنة 2021، وقُدّمت في معرض PCA، على يد ثلاثة شركاء — Manolo Santiago، الذي عمل في توزيع الهافانا في المكسيك وتخرّج في أكاديمية Habanos، وJamie Baer وSerge Bollag. غرضها تغيير ما يُظنّ بالسيجار المكسيكي، بسيجارات خالصة من وادي San Andrés — البلد الذي يرويه هذا الأطلس في بطاقات Te Amo وCasa Turrent وSanta Clara.

ما ينقص البطاقة هو ما ينقص الصحافة: لا تقول الدار أيّ مصنع في San Andrés توكستلا يلفّ سيجاراتها، وكتبت صحافة المهنة ذلك بوضوح في آذار/مارس 2026. لا يكتب هذا الأطلس بطاقة من دون مصنع مسمًّى؛ ويستثني هنا كما استثنى Jas Sum Kral — الصمت موثّق لا مختلَق — ويسجّل ما هو مسمًّى: كانت Soldadera سنة 2023 تُلفّ في Tabacalera La Isla بجمهورية الدومينيكان، وCavalry خارج المكسيك؛ وأُوقفتا سنة 2026 للاحتفاظ بالمكسيكي وحده.

فقد كبرت الدار بسرعة: تخفيضات في الأسعار وثلاثة ملايين دولار جُمعت سنة 2025، ومدير عام من الخارج، Rob Maneson، وإعادة صياغة للكتالوج في آذار/مارس 2026 — ثلاثة قياسات مشتركة لكلّ الخطوط، وEl Ébano منتظر للصيف — ودخول Smoker Friendly، سلسلة متاجر أمريكية، في رأس المال. دارُ رأس مال مخاطر في مهنة عائلات؛ يقول هذا الأطلس ذلك من دون حكم، وينتظر اسم المصنع.'
 WHERE `name` = 'Casa 1910' AND SHA1(TRIM(`history`)) = '4de511a6977b729297dadfa7a1bb0ca19a9579d5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa 1910' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '4de511a6977b729297dadfa7a1bb0ca19a9579d5';
-- brands|Casa Cuevas|history|ar — marques et noms en latin
UPDATE `brands` SET `history_ar` = 'Casa Cuevas علامة خاصة بمصنع، والمصنع لعائلة تزرع التبغ منذ ما يزيد على مئة عام.

غادر Juan Cuevas، وهو إسباني من سانتاندير، بلادَه في منتصف القرن التاسع عشر وشرع في زراعة التبغ في مقاطعة بينار دل ريو بكوبا. ثم استقرّت العائلة من بعده في الجمهورية الدومينيكية، في وادي سيباو، حيث بنت Tabacalera Las Lavas.

يديره Luis Cuevas الأب، ومعه ابنه Luis الابن. وفي 2021 مزج Luis الابن وابنُه هو Alec سلسلة Patrimonio معًا وأهدياها إلى Luis الأب — ثلاثة أجيال على مزيج واحد، وهي طريقة مباشرة إلى حدّ بعيد لقول ما تعنيه الكلمة.

ولا يعمل المصنع لنفسه وحده: فهو يصنع أيضًا لـGurkha وSam Leccia وVeritas. وهو ثالث مصنع دومينيكي يسمّيه هذا الأطلس، إلى جانب Tabacalera Palma وvon Eicken — ثلاثة عناوين وراء جانب كبير من الكتالوج الدومينيكي.'
 WHERE `name` = 'Casa Cuevas' AND SHA1(TRIM(`history`)) = '32b962ae1a81c6e877b036a26245603be1176a5c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa Cuevas' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '32b962ae1a81c6e877b036a26245603be1176a5c';
-- brands|Casa Culinaria|history|ar — ville traduite, adjectif corrigé
UPDATE `brands` SET `history_ar` = 'Casa Culinaria علامة تابعة لـPaul Bugge، تاجر سيجار من فيلينغن-شفينينغن في الغابة السوداء؛ ولا تحدد الدار تاريخ تأسيسها. وكانت سلاسلها تحمل في الأصل أسماء ألوان، بحسب Cigarworld.de؛ وحتى سبتمبر 2026، يضم الكتالوج ثلاث سلاسل. أما Connecticut، وهو خفيف القوة بحسب الدار، فيحمل غلافًا أمريكيًا ذهبي اللون فوق قلب من تبغ نيكاراغوي؛ وقد خلف سلسلة سابقة تحمل اسم Orange. أما Jalapa، فمتوسط القوة، ويأخذ اسمه من منطقة في نيكاراغوا يأتي منها معظم تبغه، بما في ذلك الغلاف. أما Esteli، فشديد القوة، بغلاف زيتي داكن، ويواصل مسيرة سلسلة سابقة تحمل اسم Red Fort.

تُصنع جميع السلاسل يدويًا في نيكاراغوا؛ ولا تكشف الدار عن اسم المصنع الذي يلفّها، ولا عن المدينة التي يقع فيها. وحتى سبتمبر 2026، Casa Culinaria معروضة للبيع لدى Paul-Bugge.com وCigarworld.de.'
 WHERE `name` = 'Casa Culinaria' AND SHA1(TRIM(`history`)) = '2b4784d6714b1c4aa0fc64118d98401ae19d968b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa Culinaria' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '2b4784d6714b1c4aa0fc64118d98401ae19d968b';
-- brands|Casa de Alegria|history|ar — personnes en latin, villes traduites
UPDATE `brands` SET `history_ar` = 'تأسّست Casa de Alegria S.A. في أكتوبر 2004 في إستيلي على يد Maritza Molina، أخصائية نفسية بالتكوين أصبحت مديرة عامة، وRalf Westerwick، جغرافي من غومرسباخ بألمانيا أصبح كبير الخلّاطين — وهو تحوّل مهني مشترك، وفق الموزّع الألماني Cigarworld. وتُلفّ الدار في تاباكاليرا خاصة بها في إستيلي ما يصفه هذا الموزّع بأنّه longfiller فاخر مصنوع يدويًا. ولا يزال خطّا Edición Limitada Rico وEdición Limitada Suave ضمن كتالوجات عدّة متاجر تبغ ألمانية سنة 2026.

وفي المصنع نفسه، أطلق Ralf Westerwick أيضًا، باسمه الخاص، علامة Rosa Nicaragua — وهي غير مملوكة لـCasa de Alegria نفسها، كما توضّح Cigarworld، التي تشير إلى صلة شخصية بين Westerwick وإدارة الموزّع، الذي يشتري بانتظام كمّية ثابتة من الإنتاج. وتتألّف من ثلاثة خطوط: Jalapa، بغلاف إندونيسي وتوصف بأنّها لطيفة؛ وEstelí، أشدّ حدّة بتبغ نيكاراغوي؛ وConnecticut، بغلاف ذهبي وقوام كريمي. وتدّعي العلامة اتّباع ممارسات تجارة عادلة — شراء فوري للمحصول، وأجور يُقال إنّها أعلى من المتوسط.

في أكتوبر 2026، تلفّ Tabacalera Casa de Alegria أيضًا La Chaveta، وهي علامة تعود إلى Patricia وMarc Benden، اللذين يديران Cigarworld: ظهرت في نهاية صيف عام 2025 وتُباع، بحسب Cigarworld، حصرًا في متجرها الإلكتروني، ويلفّها في إستيلي Ralf Westerwick، بحسب Smokersplanet.de. أما خطها White، الخفيف، فبغلاف Connecticut Shade؛ وخطها Black، وهو أقوى من White، بغلاف داكن من نوع Criollo؛ وكلاهما على حشوة من تبغ نيكاراغوي من إستيلي وخالابا وكونديغا، بمقاسات Minuto وPerla وRobusto وToro.'
 WHERE `name` = 'Casa de Alegria' AND SHA1(TRIM(`history`)) = '9c88e2a5de8a07e85b0cb79e2b04bfdbf6045ddc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa de Alegria' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '9c88e2a5de8a07e85b0cb79e2b04bfdbf6045ddc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa de Garcia' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '76028c1ae90536b3bb4ef5a7f5fb318382ce7d8c';
-- brands|Casa de Torres|history|ar — ville traduite
UPDATE `brands` SET `history_ar` = 'Casa de Torres علامة تابعة لعائلة Schuster من بوندِه في وستفاليا. وقد قُيّدت شركة August Schuster في السجل التجاري في 27 سبتمبر 1909، امتدادًا لمصنع افتتحه Hermann Schuster عام 1897، بحسب ما تقوله الدار على موقعها الإلكتروني. وتقدّم Cigarworld.de علامة Casa de Torres بوصفها أول علامة خاصة بالعائلة، أُنشئت عام 1998 مع جهة مصنِّعة نيكاراغوية، وتُنتَج للعائلة وحدها في مصنع صغير في نيكاراغوا لا تسمّيه.

لا تسمّي الدار المصنع. وبالنسبة إلى شريك عام 1998، يكتب Dalay، بالإنجليزية، إن Toraño أنتجت لصالح Schuster أولى سيجارات longfiller للعلامة، وتسمّي Onlineshop Helgoland، بالألمانية، Fabrica de Tabacos NicaSueño S.A. في إستيلي. وفي أكتوبر 2026، يقول Dalay أيضًا إن Esteban Disla، الذي كان حينها في Toraño، شريك Skip Martin والمسؤول عن إنتاج RoMa Craft Tobac لدى Nica Sueño في إستيلي، وإن Schuster هي مستورد RoMa Craft Tobac في أوروبا. وفي 2018، وضع كلٌّ من Blind Man''s Puff وCigarslover تصنيع 20 Años، إصدار الذكرى العشرين للعلامة، في Nica Sueño.

وفي أكتوبر 2026، تُدرج Cigarworld.de ست سلاسل في كتالوجها: Classic وEdición Especial وMaduro Selection وEdición Famoso وسيجاريلو وتشكيلة متنوعة. وفي 2025، قدّم Wolsdorff، وهو تاجر تجزئة، إصدارًا محدودًا بمقاس Toro، طُوِّر بالتعاون مع Schuster ويُباع لدى Wolsdorff وحده. وتأتي Ann-Eks وIbis من الدار نفسها، بحسب Cigarworld.de، وCanned Heat بحسب Zigarrennewsblog.ch، وTeatro del Mundo بحسب Smokersplanet.de.'
 WHERE `name` = 'Casa de Torres' AND SHA1(TRIM(`history`)) = '47be8d21446d33cb64ab63d61ef12379aa911ba3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa de Torres' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '47be8d21446d33cb64ab63d61ef12379aa911ba3';
-- brands|Casa Turrent|history|ar — marque en latin
UPDATE `brands` SET `history_ar` = 'يزرع آل Turrent تبغ San Andrés منذ مطلع القرن العشرين، وطويلاً ما فاقت شهرتُهم كمزارعين شهرتَهم كصنّاع: فغلافهم يكسو سيجاراً في العالم كلّه، وغالباً تحت أشرطة أخرى. وCasa Turrent هي السلسلة التي توقّع بها العائلة أخيراً عملها هي.

تلعب الدار على هذه الميزة النادرة — أن تملك أوراقها، وعدّة مواسم في المخزون، وإمكان بناء خلطات حول تبغ تتحكّم به من أوّله إلى آخره. وسلاسلها المؤرَّخة، المبنية على سنوات حصاد محدّدة، من الأمثلة القليلة على هذا التمرين خارج كوبا.

تبقى المكسيك منتجاً متحفّظاً على مقياس القارّة، تسحقها كمّيات جيرانها. لكنها تعوّض ذلك بالخصوصية: لا بلد آخر ينتج هذا الغلاف، وكل قيمة الأرض المكسيكية تكمن في هذه الورقة.'
 WHERE `name` = 'Casa Turrent' AND SHA1(TRIM(`history`)) = '046090566857ea41cb78ad1ddc844b207c0a4344';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa Turrent' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '046090566857ea41cb78ad1ddc844b207c0a4344';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casagranda' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '4ce0ae5216d06ef8653123b34194ff21169b61b4';
-- brands|Castillo de Reyes|history|ar — villes traduites
UPDATE `brands` SET `history_ar` = 'Castillo de Reyes علامة دومينيكانية صغيرة تُلف في تامبوريل، في وادي سيباو، حول master blender يُدعى Felix Reyes. ويُقال إن مصنعها، الذي يسميه تجار التجزئة Garage Workshop، يوظف نحو عشرة من الـtorcedores، يُقال إن عددًا منهم سبق أن عملوا لدى Arturo Fuente؛ ويُقال إن التبغ يُخمَّر في الموقع نفسه. ولم يُنشر أي تاريخ للتأسيس، ولا يستند هذا السرد إلا إلى نصوص تجار التجزئة، وفي مقدمتهم Cigarworld.de، وتتكرر بصيغة شبه متطابقة من موقع إلى آخر: ولا تذكر الصحافة المتخصصة هذه العلامة.

هناك سيجاران موثَّقان، يُباعان في علبة زرقاء وعلبة حمراء: 3F (Toro Blue)، من تبغ وادي سيباو، وEl Mejor Sabor (Toro Red). وحتى سبتمبر 2026، لا تزال Cigarworld.de تُدرج العلامة في قائمتها.'
 WHERE `name` = 'Castillo de Reyes' AND SHA1(TRIM(`history`)) = '9ab1392b2412b1da5098b9a3f29650b741229be9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Castillo de Reyes' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '9ab1392b2412b1da5098b9a3f29650b741229be9';
-- brands|Cavalier Genève|history|ar — marque et personnes en latin
UPDATE `brands` SET `history_ar` = 'تحمل Cavalier Genève اسم مدينةٍ لم تصنع فيها شيئًا قطّ، ويصنّفها هذا الأطلس حيث تلفّ: دانلي. نشأ Sébastien Decoppet في جنيف على مقربة من مقرّ Davidoff، وفي متجر لـDavidoff دخّن سيجاره الأوّل في نحو العشرين. يقول عن نفسه إنّه ليس مخلوقًا لمكتب؛ فرحل إلى هندوراس ليتعلّم الحرفة قبل أن يتكلّم لغتها.

تعود الدار إلى 2016، ولها ما ليس لمعظم العلامات المولودة من الرغبة نفسها: مصنعٌ خاص، Fábrica Centroamericana de Tabaco في دانلي. والتفصيل الذي تُعرف به معيّنٌ من رقائق الذهب، أربعة وعشرون قيراطًا، موضوعٌ على كلّ سيجار — توقيعٌ يسبق الطوق.

الكتالوج مرتّب في ثلاث عائلات. Original Diamond Series وقلبها White Series؛ والحصريّات الإقليمية — Black II وViso وProspektor؛ وخطوط أحدث: Inner Circle، وDomaine Rouge التي تكرّم أبا المؤسّس المولود سنة 1956، وTres Delincuentes بثلاثة أغلفة وثلاثة قياسات وملصقٍ من فنّ الشارع. ويقرّ Decoppet بخطأٍ في البداية: دخول الولايات المتحدة عبر موزّع من غير فهم لتلك السوق. وصحّحه بإدارة عملياته بنفسه من أمريكا الوسطى.

وكان للذكرى العاشرة سنة 2026 سيجاراها. يتحدّث المؤسّس عن الحلم الأمريكي؛ إنّه جنيفيّ يقول ذلك عن مصنع هندوراسي، وهذه البطاقة تنقله من غير أن تتبنّاه.'
 WHERE `name` = 'Cavalier Genève' AND SHA1(TRIM(`history`)) = '3ca18bf7faa2df4417b078221f9f5b758304676a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cavalier Genève' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '3ca18bf7faa2df4417b078221f9f5b758304676a';
-- brands|Chaba|history|ar — nom propre latin, formule interdite
UPDATE `brands` SET `history_ar` = 'Chaba — Charutos da Bahia — دار Fernando Fraga في ألاغوينياس شمال باهيا، وهي قطعة من Suerdieck عاشت بعد Suerdieck. صنع Fraga مسيرته هناك؛ وحين أغلق مصنع ماراغوجيبي الكبير، الذي كان يشغّل ما يزيد على ألفي شخص، وحدته الأخيرة سنة 2000، ورث بعض علاماته وأحياها في شركته الخاصّة المسجّلة في 28 أكتوبر 1998.

تروي الصحافة الاقتصادية سنة 2012 البقية: ثمانون موظّفًا، ثمّ سنة 2010 حجزٌ للإنتاج من هيئة الرقابة الصحية بسبب مخالفات في التسجيل، فالإغلاق، ثمّ إعادة الفتح في السنة التالية بخمسة وعشرين شخصًا. وكان Fraga حينها في الثالثة والسبعين. وما زالت قوائم مصانع باهيا لسنة 2017 تعدّها في ألاغوينياس.

ومنذ ذلك الحين لا شيء: لا يُستشهد بأيّ مقال بعد 2012، ويقول سجلّ الشركات إنّها نشطة سنة 2026 في العنوان نفسه وتحت المدير نفسه. كُتبت البطاقة بصيغة الماضي حيث يجب، ولا تدّعي معرفة ما إذا كان اللفّ ما زال جاريًا هناك — تلك قاعدة الأطلس للدور التي لا يمكن التحقّق منها.'
 WHERE `name` = 'Chaba' AND SHA1(TRIM(`history`)) = '2e409f3f9780aea7bbfa49288c92c45fdcd28983';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Chaba' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '2e409f3f9780aea7bbfa49288c92c45fdcd28983';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Charatan' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'bb088c3d3859a6eda2831fabe17f40cf4f5ad2b4';
-- brands|Chateau Diadem|history|ar — cousins, noms en latin
UPDATE `brands` SET `history_ar` = 'بحسب مقال أول لموقع halfwheel، تأسّست Chateau Diadem سنة 2020 على يد ابنَي العمّ السويسريين Thierry Farah وEmily Sahakian، المقيمَين في جمهورية الدومينيكان؛ في حين يضع مقال أحدث من الموقع نفسه، خُصِّص لإطلاق خطّ Certitude، التأسيس سنة 2022 بدلًا من ذلك، من دون أن توفّق المصادر المُراجَعة بين الروايتين. وتملك الدار مصنعها الخاص في نافاريتي، ضمن المنطقة الحرة الصناعية PISANO شمال سانتياغو (halfwheel)، حيث تُلفّ سيجارها بالكامل يدويًا (havanahouse.co.uk).

يضمّ الكتالوج عدّة خطوط: Splendor، من إبداع اللافّ Eladio Díaz، بغلاف كوروخو إكوادوري ورباط San Andrés مكسيكي وحشوة دومينيكية، معروض للبيع في أوروبا منذ 2024، وكانت halfwheel تُعلن عن وصوله إلى الولايات المتحدة في ربيع 2026؛ وAlisio، المصمَّم ليكون أخفّ وأقرب منالًا، بغلاف كوروخو إكوادوري وحشوة دومينيكية ونيكاراغوية؛ وMidnight Wonder، بغلاف كونيتيكت برودليف، جرى تطويره على مدى نحو ثلاث سنوات. كما أُعيدت تسمية خطّ Conviction إلى Certitude من أجل السوق الأمريكية، وأُطلق في معرض PCA 2025 (halfwheel)؛ ويذكر موقع الدار أيضًا خطًّا باسم Monkey Business، من دون تفاصيل عن الغلاف أو القوة.'
 WHERE `name` = 'Chateau Diadem' AND SHA1(TRIM(`history`)) = '220776b3a907b9378f3956566175c42e4271c3f2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Chateau Diadem' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '220776b3a907b9378f3956566175c42e4271c3f2';
-- brands|Cházaro|history|ar — noms propres en latin
UPDATE `brands` SET `history_ar` = 'Cházaro هي الدار الوحيدة في هذا الأطلس التي تلفّ في المكسيك خارج فيراكروز: في إسيكييل مونتيس بولاية كيريتارو، على طريق النبيذ والجبن، فتحت عائلة من أصل فيراكروزي نحو 2015 مصنعًا سمّته Real Fábrica de Tabacos تخليدًا لمصنع سان فرناندو الذي أقامه التاج في كيريتارو سنة 1779 — الثاني في إسبانيا الجديدة — والذي أُغلق في النصف الأوّل من القرن التاسع عشر. ولا تتّفق الصحيفتان اللتان زارتاه على السنة: أُسّس قبل 2018 بثلاث سنوات عند إحداهما، وأُنشئت العلامة سنة 2016 عند الأخرى؛ تكتب البطاقة الاثنتين. مفتوح للجمهور منذ 2017.

يأتي التبغ من San Andrés توكستلا، والحرفيون أيضًا: Antonio «Toto» Pucheta، Don Toño، معلّم اللفّ ذو الأربعين عامًا في المهنة، يقود الإنتاج مع لفّافين قادمين من الوادي، كلّ منهم بسبعين إلى تسعين سيجارًا في اليوم. ثلاثة خطوط — Black، أربعة أخماسه تبغ فاتح؛ Habano، نصفًا بنصف؛ Peña Blanca، بعرق قصب السكّر وعصير الفاكهة. وتختلف الأرقام بحسب السنة: خمسة عشر ألف سيجار في الشهر وسبعة أعشارها تُصدَّر إلى الولايات المتحدة سنة 2018، وخمسة عشر شخصًا ونحو ثلاثمئة سيجار في اليوم سنة 2022؛ تكتب البطاقة الاثنين بدل أن تختار.

يفتح لها هذا الأطلس منطقة لفّ، إسيكييل مونتيس، بلا حقول: مكان تُلفّ فيه ورقة منطقة أخرى، مثل درسدن أو موسكو.'
 WHERE `name` = 'Cházaro' AND SHA1(TRIM(`history`)) = 'fc83573e7cf1a90d47f3686341cfeb11194051be';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cházaro' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'fc83573e7cf1a90d47f3686341cfeb11194051be';
-- brands|Chinchalero|history|ar — سجائر au lieu de سيجار
UPDATE `brands` SET `history_ar` = 'تأسست Chinchalero عام 2011 على يد John Atherton، الذي أمضى عدة سنوات في القسم الدولي لشركة General Cigar، بحسب Cigarworld.de. يشير اسم العلامة إلى مصطلح chinchales، وهو تسمية للورش الصغيرة التي يُلفّ فيها السيجار تقليديًا.

يُلفّ السيجار، وهو من نوع longfiller، يدويًا بالكامل في نيكاراغوا؛ ولا تكشف الدار عن اسم المصنع ولا عن المدينة التي يقع فيها.

حتى سبتمبر 2026، يضمّ الكتالوج ثلاثة خطوط، بحسب Cigarworld.de: Classic، الذي يوصف بأنه أخف قوةً، بطوق أزرق؛ وTorcidos، بغلاف مزدوج من Connecticut الفاتح وMaduro الداكن؛ وMezcla 40، بغلاف Connecticut إكوادوري، بنكهات حلوة وحارة. أما الخط الرابع، Reserva de Oro، بطوق أحمر، فلم يعد مدرجًا فيه.'
 WHERE `name` = 'Chinchalero' AND SHA1(TRIM(`history`)) = '2145249223475f9a4ca75479ad1e3307ddd6e5f4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Chinchalero' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '2145249223475f9a4ca75479ad1e3307ddd6e5f4';
-- brands|Chogüí|history|ar — noms propres en latin
UPDATE `brands` SET `history_ar` = 'Chogüí طائرٌ من جمهورية الدومينيكان، والعلامة التي تحمل اسمه هي علامة هاوٍ من البلد، Víctor Nicolás، أراد أن يصنع سيجاراته بنفسه. التقى Francisco «Chico» Rivas في أواخر 2013 وراح يزور مصنعه الصغير كلّ شهر — Manufactura Rivas، الذي لقّبته الدار بالعشّ السرّي نسبةً إلى الطائر. وجاءت الأتبغة من Leo Reyes، مزارع نافاريتي الذي يروي هذا الأطلس مزرعته في بطاقة De Los Reyes. صدرت Primera Edición في تشرين الثاني/نوفمبر 2014، مقصورةً على تجّار التجزئة الدومينيكيين، بستّة آلاف سيجار.

يصنّفها هذا الأطلس هنا على ما هي: سيجار دومينيكي خالص، أتبغة ومصنع ومؤسّس من البلد نفسه. وذلك نادرٌ خلافًا لما يُظنّ في بلد يلفّ للآخرين في الغالب.

في 2018 ترك Nicolás المهنة بلا ضجيج، وحتى موزّعه الأمريكي لم يكن يعرف ما يحلّ بالعلامة. عادت في شباط/فبراير 2022 بسيجار Dos77 معاد الصنع — الغلاف الدومينيكي الأصلي لم يُعثر عليه، فاستُبدل به كوروخو دومينيكي مزروع تحت الشمس، مع piloto mejorado في الحشوة — وتوزيعٍ عُهد به إلى Venture 1492، شركة Kyle Gellis، مؤسّس Warped التي يحمل هذا الأطلس بطاقتها. علامةٌ نامت ثم عادت، كما كانت Mombacho في الاتجاه المعاكس: تكتبها البطاقة بصيغة الحاضر لأنّ العودة موثّقة.'
 WHERE `name` = 'Chogüí' AND SHA1(TRIM(`history`)) = '3e61c441213e3ce2b0e2dbaf73c9cf36bee80f69';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Chogüí' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '3e61c441213e3ce2b0e2dbaf73c9cf36bee80f69';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Chone' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '99c5bd4ee0c6518c535f542c0d3220902aa31ac5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Christo' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'b7567056f1fa6ff017a213dddd9a93c0a88557c8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cigarkings' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '05ba62fc6de5cbbe33a86136878d869b54f040ab';
-- brands|CLE Cigar Company|history|ar — أسماء أشخاص وعلامات بالحروف اللاتينية
UPDATE `brands` SET `history_ar` = 'CLE ثلاثة أحرف أولى: Christian Luis Eiroa. أسّس الدار في يوليو 2012، وهو لم يدخل المهنة، بل عاد إليها.

فجدّه Generoso J. Eiroa غادر إسبانيا إلى كوبا وامتلك هناك مزرعة تبغ في بينار دل ريو. وأبوه Julio Eiroa عمل مع Angel Oliva ثم أسّس مزرعته الخاصة في وادي خاماستران بهندوراس — وهو صاحب Aladino الذي يضمّه هذا الأطلس. وُلد Christian في دانلي.

وكان الأب والابن يملكان Camacho، فباعاها لمجموعة Davidoff عام 2008: والداران كلتاهما في هذا الأطلس، وهي القصة نفسها منظورًا إليها من طرفيها. وقضى Christian أربع سنوات خارج المهنة قبل أن يعود باسمه.

تلفّ CLE في دانلي، في مصنع تابع للدار تسمّيه Cigar Coop «CLE Factory» في آذار/مارس 2025، وHavano S.A. في أيلول/سبتمبر 2026. وقد أنشأ Christian Eiroa بالتوازي علامة Asylum مع صديقه Tom Lazuka — النصف الآخر من المجموعة نفسها، والبطاقة الأخرى في هذه الدفعة.'
 WHERE `name` = 'CLE Cigar Company' AND SHA1(TRIM(`history`)) = '3ad328425bb4aaa6b1b3ad2119f8d454d8f6b479';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CLE Cigar Company' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '3ad328425bb4aaa6b1b3ad2119f8d454d8f6b479';
-- brands|Colpuros|history|ar — أسماء لاتينية وإضافة الفاخر
UPDATE `brands` SET `history_ar` = 'Colpuros — Compañía Colombiana de Puros — وُلدت في 5 أغسطس 2009 في بييديكويستا بسانتاندير، وهي دار سلالة: كان Agustín Correa يصنع التبغ الشعبي في زاباتوكا قبل مئة وخمسين سنة، وحسّن ابنه José Correa الورقة والبيع، وأراد الحفيد Yorgan Correa Rodríguez، الاقتصادي المولود سنة 1974، الانتقال من التبغ الشعبي إلى سيجار (puro) التصدير. أسّس الشركة مع Laura Victoria Heredia Portillo، التي تتولّى الإدارة والموظّفين، وسمّى خطّه الرفيع Don José Correa على اسم أبيه؛ أمّا Mosqueteros فخطّ التبغ الشعبي ونصف الرفيع.

الورشة في حيّ كينتا غرانادا. اللفّافات، وكلّهنّ نساء يعُلن أسرهنّ كما تقول الدار، درّبهنّ كوبيون ودومينيكيون؛ والتبغ من بذور كوبية تُزرع في كولومبيا، تكمّله أوراق من الإكوادور ونيكاراغوا وهندوراس وجمهورية الدومينيكان. وعدد العاملين غير منشور.

في سبتمبر 2018 كتبت صحيفة بوكارامانغا أنّ Colpuros وضعت للتوّ سيجارًا فاخرًا في ألمانيا، بعد أربع سنوات لم تصدّر فيها أيّ دار من بييديكويستا — في مدينة يعيل فيها مئتا صانع، 78 % منهم نساء، 6500 أسرة بالتبغ الذي يزن 40 % من ناتج البلدية. وكانت بلجيكا وروسيا وإسبانيا والسويد هي التالية؛ ولا تعرف البطاقة ما آل إليه الأمر. وأمّا قول الدار إنّها الوحيدة المعتمدة للتصدير فادّعاؤها هي؛ ويتركه الأطلس لها.'
 WHERE `name` = 'Colpuros' AND SHA1(TRIM(`history`)) = '54ebf00a54e8000362b5e00458d6cf0c490880b9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Colpuros' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '54ebf00a54e8000362b5e00458d6cf0c490880b9';
-- brands|Compagnia Toscana Sigari|history|ar — اسم شخص مشوّه وغير لاتيني
UPDATE `brands` SET `history_ar` = 'وُلدت Compagnia Toscana Sigari سنة 2015 في سانسيبولكرو، في فالتيبيرينا التوسكانية، على يد مهندس زراعي ومزارع، Gabriele Zippilli — خارج الاحتكار الذي صنع Toscano طوال قرن ونصف، والذي يروي هذا الأطلس تاريخه في بطاقة Toscano. إنّه السيجار نفسه، كنتاكي مجفَّف بالنار مزروع ومعالج في توسكانا؛ لكنّها دار أخرى، خاصّة.

تُدرَّب صانعات السيجار — المهنة مؤنّثة في إيطاليا كما في كوبا — داخل الشركة على يد معلّمتين تزيد خبرتهما على ثلاثين سنة. والخطّ الفاخر، Mastro Tornabuoni، يُصنع يدويًّا بالكامل وبحشوة طويلة — تقولها الدار بالإسبانية، totalmente a mano، كالصيغة الكوبية — وهو ما يميّزه عن Toscano العادي ذي الحشوة المفرومة. تتّخذ الدار الحفاظ على التقليد التوسكاني رسالةً، وتقدّم نفسها للأجانب بالإنجليزية.

دارٌ فتيّة بلا صحافة أنجلوفونية؛ مصادرها باعة تبغ إيطاليون وموقعها. تقول البطاقة ذلك.'
 WHERE `name` = 'Compagnia Toscana Sigari' AND SHA1(TRIM(`history`)) = '7d45cb9adc01a96c0b632e6c9597d627d7e92829';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Compagnia Toscana Sigari' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '7d45cb9adc01a96c0b632e6c9597d627d7e92829';
-- brands|Cornelius & Anthony|history|ar — علامات لاتينية وصياغة العدد
UPDATE `brands` SET `history_ar` = 'تنحدر Cornelius & Anthony من عائلة تزرع التبغ في فرجينيا منذ ما يزيد على مئة وخمسين سنة. أطلق Steven Bailey العلامة عام 2015، وخرج أوّل سيجار — Cornelius — عام 2016. والاسم يجمع اسم جدّ جدّه، ذاك الذي كان يزرع ويعمل في السكك الحديدية، إلى اسمه الأوسط.

والدار فرعٌ من S&M Brands، شركة العائلة في كيزفيل بفرجينيا. والتفصيل مهمّ لهذا الأطلس: فـS&M Brands تصنع السجائر والسيجار الصغير بالآلة، ولا شيء من ذلك يدخل هنا. أمّا Cornelius & Anthony فهي الوجه الآخر للدار، وجه اللفّ باليد، وهو وحده ما يضمّه الأطلس.

ورشتان تصنعان السيجار، ولا واحدة منهما ملك العائلة. الحصّة الأكبر تخرج من La Zona، مصنع Erik Espinosa في إستيلي. أمّا Cornelius نفسه — الخطّ الحامل لاسم الجدّ — فيُلَفّ في ميامي عند El Titan de Bronze. وللاثنين بطاقتاهما في هذا الأطلس.

وليس من قبيل الصدفة أن يكون الخطّ الأثقل معنًى هو الذي يُلَفّ في هافانا الصغيرة لا في إستيلي: فـEl Titan de Bronze يعمل بدفعات صغيرة وعلى الطلب، وهذا تحديدًا ما احتاجه هذا الخطّ.'
 WHERE `name` = 'Cornelius & Anthony' AND SHA1(TRIM(`history`)) = '9073004cedf33b909a0178beaea136287d25902b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cornelius & Anthony' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '9073004cedf33b909a0178beaea136287d25902b';
-- brands|Corona Real|history|ar — اسم شخص بحروف لاتينية
UPDATE `brands` SET `history_ar` = 'Corona Real دار Gabriel Pico Gutiérrez في بييديكويستا، مدينة التبغ في سانتاندير جنوب بوكارامانغا. دخلها في الثانية عشرة، يربط الأوراق ويوزّع التبغ مع أبيه، ثمّ يعمل في مصنع صغير في الرابط والتعبئة؛ ودرس الإدارة في الجامعة الصناعية في سانتاندير — انقطعت في الفصل السابع بحسب صحيفة، وأُتمّت بحسب أخرى؛ تكتب البطاقة الاثنتين — وذهب إلى كوبا ليتعلّم صنع التبغ على نحو آخر. سُمّيت علامته أوّلًا Cigarros Chicamocha سنة 2000، على اسم الأخدود المجاور، ثمّ Corona Real سنة 2006.

تلفّ بييديكويستا منذ تأسيسها، ويقول إنّ 95 % من التبغ الكولومبي يُصنع فيها — لكنّه التبغ الشعبي، السيجار العامّ الذي يعيل آلاف الأسر ببضع مئات من البيزو للقطعة. تصنع Corona Real شيئًا آخر: سيجارًا فاخرًا، كلّه باليد، بنحو ثمانية أشخاص، على تبغ كولومبي بنسبة 90 % يأتي من خيرون وسيبيتا وميسا دي لوس سانتوس وكابيتانيخو وكوكوتا ومونتيس دي ماريا، وعلى أغلفة سومطرة من الإكوادور من 2005-2006 يحتفظ بها للتعتيق. ثلاثة أصناف محلية: Costeña وGuane وCubita.

يبيع في كولومبيا كلّها ولم ينجح في التصدير — كلّما حاول أوقفته القيود، كما قال سنة 2021؛ أمّا أنّ سيجاره وصل إلى مشاهير فحكاية يرويها ولا يعيدها الأطلس. بطاقة من الصحافة الكولومبية، بالإسبانية، لدار لم تكتبها صحافة السيجار قطّ.'
 WHERE `name` = 'Corona Real' AND SHA1(TRIM(`history`)) = 'd378c1e7da89c88e81465c63ec7d7dd8d2ba38d4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Corona Real' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'd378c1e7da89c88e81465c63ec7d7dd8d2ba38d4';
-- brands|Crowned Heads|history|ar — علامات لاتينية وخطأ المصنع
UPDATE `brands` SET `history_ar` = 'لا مصنع لـCrowned Heads، وهذا هو الموضوع. أسّس Jon Huber وشركاؤه الدار في ناشڤيل بعد شراء مجموعة كبرى لـCAO، بنموذج انتشر منذ ذلك الحين: تأليف الخلطات، ثم لفّها في مصانع قائمة — My Father في إستيلي، وLa Alianza de Perez-Carrillo في سانتياغو، وغيرهما بحسب السلاسل.

على الأطلس أن يقول هذه العلاقة، لأنها صارت شائعة وتُشوّش قراءة الأعلام: فقد تكون العلامة من بلد دون أن تصنع فيه شيئاً، وقد يخرج السيجار الذي تمسكه من ورشة لا يظهر اسمها في أي مكان على الصندوق.

ولهذا النموذج نتيجة سعيدة: تختار الدار من يلفّ لها تبعاً للخلطة لا العكس. فـFour Kicks، سلسلتها التأسيسية، نيكاراغوية وقوية؛ وLe Carême، المولودة من تعاون مع Ernesto Perez-Carrillo، دومينيكية وأشدّ استدارة. سيجاران لا يجمعهما شيء سوى الدار التي فكّرت بهما.

الأسماء مأخوذة من أغنيات وإحالات أدبية، ونصوص الصناديق مكتوبة بعناية نادرة في المهنة — تفصيلة، لكنها تقول لمن تتوجّه العلامة.'
 WHERE `name` = 'Crowned Heads' AND SHA1(TRIM(`history`)) = '4376d02f06a2d13566823aae53f72304702ed9f2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Crowned Heads' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '4376d02f06a2d13566823aae53f72304702ed9f2';
-- brands|Crux Cigars|history|ar — أسماء أشخاص وعلامات لاتينية
UPDATE `brands` SET `history_ar` = 'وُلدت Crux في متجر سيجار بولاية مينيسوتا، لا في مزرعة. كان Joel Rodgers وJeff Haugen شريكين في ملكيّته؛ وفي 2014 عبرا إلى الجانب الآخر من المنضدة وأنشآ علامتهما. وهي طريق كثيرًا ما يراها هذا الأطلس — سلكتها Sindicato جماعةً، وسلكتها Crux اثنين.

تُلفّ السيجارات لدى Plasencia في إستيلي، تحت عين Nestor Plasencia الذي يحمل هذا الأطلس بطاقته. لم يكن لـCrux مصنع قطّ ولا تدّعيه: ما تجلبه هو اختيار المزجات وعادة المنضدة — معرفة ما يطلبه الهاوي، لأنّه بِيع له سنوات.

والكتالوج واسع لدارٍ بهذا الحجم: Epicure وتنويعاته Habano وMaduro، وBull & Bear وGuild وPassport وLimitada وDu Connoisseur وMarblehead. علامةُ تجّار صارت علامة، تُلفّ في أحد مصانع نيكاراغوا الكبرى.'
 WHERE `name` = 'Crux Cigars' AND SHA1(TRIM(`history`)) = 'cfd7086237e3e3a76d24f41e89c15fe49ae78911';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Crux Cigars' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'cfd7086237e3e3a76d24f41e89c15fe49ae78911';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CSC' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'd3ba069dd36575541b33e2894bd762c8d156b631';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuba Aliados' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'e48ac21122136d812a1e085302ab6c4abda32c40';
-- brands|Cuban Crafters|history|ar — فقرة مضافة وأسماء لاتينية
UPDATE `brands` SET `history_ar` = 'كان Max Berger قد غادر بولندا في أثناء الحرب إلى كوبا، فصار فيها مزارعًا وصانع سيجار — مزارع ومصنع. ثم أخذت الثورة كلّ شيء، فرحل إلى الولايات المتحدة مع ابنه Henry.

دخل Henry Berger، الذي كانت المهنة تدعوه Don Kiki، عالم السيجار عام 1996 في ذروة الرواج. وأقام مصنعه في نيكاراغوا على الطريق السريع بين الأمريكيتين عند إستيلي، على بُعد مئات الأمتار من Padrón: Tabacalera Estelí، وإلى جانبها مباشرةً حظيرة تجفيف بسقف من القشّ بُنيت على الطريقة القديمة.

أمّا ما تعرفه ميامي من الدار فشيء آخر: متجر هافانا الصغيرة، أحد تلك الأماكن التي يشتري فيها المرء ويشرب كأسًا ويدخّن في مكانه. والبطاقة نيكاراغوية لأنّ السيجار يُصنع في إستيلي.

تُوفّي Don Kiki عام 2014، وتولّت الدار زوجته Karen Berger.'
 WHERE `name` = 'Cuban Crafters' AND SHA1(TRIM(`history`)) = '5fd8d7385bd0addcf31972f5507a87dbd5130c42';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuban Crafters' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '5fd8d7385bd0addcf31972f5507a87dbd5130c42';
-- brands|Cuban Stock Cigar Co.|history|ar — أسماء لاتينية وبضع مئة
UPDATE `brands` SET `history_ar` = 'Cuban Stock دارٌ من سانتياغو غيّرت حجمها لتوّها بعد عشرين سنة من وجودها. أسّسها Yaniv Levy سنة 1996، في ذروة الحمّى الأمريكية للسيجار، وأبقاها حيّة عقدين في مصنعين متعاقبين لم تتجاوز مساحتهما مجتمعتين عشرة آلاف قدم مربّعة.

في شباط/فبراير 2016 افتتحت مصنعًا بمساحة عشرين ألف قدم مربّعة في المنطقة الحرة بتامبوريل — غرفتان للتخمير والتعتيق بمساحة ألف ومئتي قدم مربّعة لكلّ منهما، وأربعون عاملًا عند الافتتاح، ومئة وبضعة بعد أسابيع قليلة. وارتفعت الطاقة النظرية من 1,8 مليون سيجار في السنة إلى عشرة ملايين؛ وكان Levy يستهدف ثلاثة ملايين على المدى القريب، وتحتفظ هذه البطاقة بالهدف لا بالطاقة، لأنّه الرقم الذي أعطاه.

وما تصنعه يسعه قائمةٌ لا توقيع: ما يزيد على عشرين علامة نشطة — Chubbys وDelicioso وEveryday Joe وLimitado وReserve وTriumph و231 — تُباع للتجّار ولا تُباع مباشرة أبدًا. إنّه مصنع كمّيّات على الطريقة الدومينيكية، بلا الحكاية العائلية التي يحملها جيرانه، ويحتفظ به هذا الأطلس على ما هو عليه: مصنعٌ آخر في تامبوريل، اسمه على الباب.'
 WHERE `name` = 'Cuban Stock Cigar Co.' AND SHA1(TRIM(`history`)) = 'c68a2ce9699e1457bcaa0bddc80cf58f887c335d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuban Stock Cigar Co.' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'c68a2ce9699e1457bcaa0bddc80cf58f887c335d';
-- brands|Cuervo y Sobrinos|history|ar — أسماء لاتينية وإصلاح الإحالة
UPDATE `brands` SET `history_ar` = 'تقول Cuervo y Sobrinos إنها تعود إلى هافانا، حيث افتتح الأستوري Ramón Fernández Cuervo محل مجوهرات سنة 1862؛ والتحق به أبناء إخوته الستة سنة 1882، وهي السنة التي تعتبرها الدار تاريخ تأسيسها الرسمي. وتضع عصرها الذهبي في خمسينيات القرن العشرين، وتقول إنها ضمّت Caruso وChurchill وEinstein وGable وHemingway وNeruda إلى عملائها. والدار اليوم بيت لصناعة الساعات، ومقرّها وورشتها في كابولاغو بسويسرا.

في 2023، أطلقت Cuervo y Sobrinos خط سيجار عهدت به إلى Cigar Conexion، التي يديرها Fernando Navarro، بشراكة مع Tabacalera Pages: ويُلفّ السيجار، المصنوع من تبغ بذرة كوبية، يدويًا في إستيلي بنيكاراغوا. ولا تقول الدار كيف يتقاسم الشريكان التصنيع. وجاء الإطلاق على مراحل: اليابان في يونيو 2024، ثم سويسرا في يوليو، ثم أوروبا التي أُعلن عنها في 25 سبتمبر 2024.

وفي سبتمبر 2026، يعرض موقع الدار أربعة أصناف — Toro وMareva وPerfecto Press وRobusto — وسلسلة منفصلة باسم Historiador.'
 WHERE `name` = 'Cuervo y Sobrinos' AND SHA1(TRIM(`history`)) = 'f722bc9d7b62e170d949bff8401073cd0a2af0d7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuervo y Sobrinos' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'f722bc9d7b62e170d949bff8401073cd0a2af0d7';
-- brands|Cuesta-Rey|history|ar — ترتيب الجملة وأسماء لاتينية
UPDATE `brands` SET `history_ar` = 'Cuesta-Rey أقدم من الدار التي تملكها. أسّسها عام 1884 في إيبور سيتي بتامبا — الحيّ الذي استقرّت فيه صناعة السيجار بعد مغادرتها هافانا — كلٌّ من Angel LaMadrid Cuesta، وهو إسباني تعلّم الحرفة في كوبا، وPeregrino Rey. وكانا يلفّان فيه سيجار clear Havana: سيجار يُصنع في الولايات المتحدة من تبغ كوبي مستورد.

وكانت الورشة تعمل كذلك لعلامات أخرى، منها Nat Sherman التي يضمّها هذا الأطلس. كما تدّعي الدار لنفسها لقب السيجار الرسمي لملك إسبانيا ألفونسو الثالث عشر — وهو قول الدار نفسها، ولا تثبته أيّ مصادر مستقلّة.

وفي عام 1958، وهو عام وفاة Julius Caeser Newman، اشترى ابنه Stanford العلامة من عائلة Karl Cuesta. ومنذ ذلك الحين تصنع J.C. Newman سيجار Cuesta-Rey. ومنذ ثمانينيات القرن الماضي لم يعد السيجار الملفوف يدويًا يخرج من تامبا، بل من Tabacalera A. Fuente في سانتياغو دي لوس كاباييروس — المصنع نفسه الذي يصنع Arturo Fuente وAshton. ولهذا صُنّفت هذه البطاقة في الجمهورية الدومينيكية بينما بقيت بطاقة J.C. Newman أمريكية.

ويقوم الكتالوج على ثلاث سلاسل. تحمل Cabinet Selection غلافًا كاميرونيًا فوق حشوة دومينيكية وبرازيلية؛ وCentenario غلاف Connecticut Shade في النسخة الفاتحة أو Connecticut Broadleaf في نسخة المادورو؛ وCentro Fino غلافًا إكوادوريًا مزروعًا في الشمس. وتحتفظ المقاسات بأرقام الكتالوج بدل الأسماء — Cabinet No. 898، وNo. 95.'
 WHERE `name` = 'Cuesta-Rey' AND SHA1(TRIM(`history`)) = '0c679e0cd8049100634af6aff89d780141f92973';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuesta-Rey' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '0c679e0cd8049100634af6aff89d780141f92973';
-- brands|Curivari|history|ar — أسماء وعلامات بحروف لاتينية
UPDATE `brands` SET `history_ar` = 'Curivari علامة يونانية لسيجار نيكاراغوي. أسّسها Andreas Throuvalas، وهو تاجر تجزئة في اليونان، عام 2003 في أوروبا؛ ولم تدخل الولايات المتحدة إلا في 2010.

والمشروع معلَن وصعب: إعادة إنتاج مزاج الهافانا من دون تبغ كوبي. الأوراق كريولو وكوروخو من بذرة كوبية مزروعة في نيكاراغوا، تُعالَج بالطريقة الكوبية التقليدية، ويُختَم كلّ سيجار بغطاء ثلاثيّ على الطراز الكوبي.

ولا تنشر الدار اسم المصنع الذي يلفّ لها.

وتحمل السلاسل الحديثة أسماءً يونانية — Achilles وSocrates وAristoteles وCentauro — تحيّةً لأصل المؤسّس. أمّا الأقدم فتحتفظ بالإسبانية: Buenaventura وSelección Privada وGloria de León. وتتعايش السلسلتان في الكتالوج نفسه، وهو ما يقول جيّدًا ما هي هذه الدار: يونانية الرأس، كوبية القصد، نيكاراغوية المادّة.'
 WHERE `name` = 'Curivari' AND SHA1(TRIM(`history`)) = '4da8d428b9674751064c7fe7c2e042d7153c77d7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Curivari' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '4da8d428b9674751064c7fe7c2e042d7153c77d7';
-- brands|D'Crossier|history|ar — مدن وبلدان بحروف لاتينية، خطأ إملائي
UPDATE `brands` SET `history_ar` = 'تأسست D''Crossier عام 2006 في ميامي على يد Isaias Santana Diaz، الذي يدير شركة الاستيراد Pure Aroma Cigars Inc.؛ ويأتي الاسم، بحسب الشركة، من لقب جده، تكريمًا لجده الأكبر Francisco Crossier، وهو فرنسي قدِم إلى كوبا لزراعة الكروم قبل أن يتجه إلى التبغ. وصدرت السلسلة الأولى، Golden Blend، عام 2007 ضمن Diplomacy Series؛ وخُصصت سلسلة لاحقة، Golden Blend Reserva، لوالد رئيس الشركة، Isaias Santana Crossier (1945-2020).

لُفّت أولى سيجارات D''Crossier في كوستاريكا، لدى Pure Aroma Cigars S.A.؛ وهناك صُنعت عام 2009 سلسلة Pennsylvania Avenue، وهي امتداد لـPresidential Collection ضمن Diplomacy Series، وعُتِّقت تسعة عشر شهرًا في مستودع الشركة بهيالياه غاردنز (فلوريدا) قبل شحنها. واستمر الإنتاج في كوستاريكا حتى عام 2016؛ ومنذ عام 2017، تلفّ D''Crossier سيجارها في جمهورية الدومينيكان، لدى ABAM Cigars S.R.L. في فيلا ميلا (سانتو دومينغو الشمالية) — وهو مصنع أسّسه عام 1996 José Matias Maragoto وعمّه Adalberto Ruizcalderon. وافتتحت Flor de D''Crossier، بسلسلتها Selección 512 ذات الغلاف الإكوادوري من نوع Habano، هذه المرحلة الدومينيكانية.

وتضم التشكيلة أيضًا Imperium Class Vintage (بغلاف Habano Criollo Especial من كوستاريكا)، وL''Forte (أُطلقت عام 2014، بغلاف من كوستاريكا وحشوة دومينيكانية ونيكاراغوية، وهي قوية بحسب تجار التجزئة)، وPremium Blend الأخف، بغلاف Connecticut إكوادوري رقيق وفاتح اللون.'
 WHERE `name` = 'D''Crossier' AND SHA1(TRIM(`history`)) = '90bfe64ca3c509b2afb2c1e015eca40b24599e7d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'D''Crossier' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '90bfe64ca3c509b2afb2c1e015eca40b24599e7d';
-- brands|Dalay|history|ar — micropeintre مترجم خطأً
UPDATE `brands` SET `history_ar` = 'وُلد Salih Dalay في إسطنبول، وأسّس في زاربروكن Dalay Zigarren؛ وتقول الدار إنها تبلغ في عام 2026 ما يزيد على خمسة وعشرين عامًا. وتُلفّ خطوطها الخاصة في Tabacalera Zauberberg، في سانتياغو دي لوس كاباييروس بجمهورية الدومينيكان، وهي التي تقول الدار إنها مصنعها؛ ويصف Halfwheel Zauberberg بأنها مشروع مشترك مع شركاء دومينيكيين على صلة بـDalay منذ قرابة ثلاثة عقود، ويؤرّخ Cigarworld.de تأسيس Salih Dalay لها بعام 2017.

في سبتمبر 2026، يضمّ الكتالوج نسخة فاتحة ونسخة داكنة تُلفّان في جمهورية الدومينيكان، هما Hell وDunkel؛ ونسخة هندوراسية، فاتحة أو داكنة هي الأخرى، على تبغ Corojo؛ وخط Istanbul، الذي صدر في 8 يوليو 2023، بحشوة من التبغ التركي، وتحمل حلقته منمنمة لرسّام المنمنمات الإسطنبولي Hasan Kale، تكريمًا لمسقط رأس Salih Dalay، بحسب الدار؛ وخط Oase، الذي أُطلق في 15 مايو 2026 في زاربروكن، مستوحى من حكايات Nasreddin Hodja التي كان Salih Dalay يسمعها في طفولته، بحسب Smokersplanet.de؛ وFerruh Karakasli، مع مصمم الأزياء التركي Ferruh Karakaşlı، المولود عام 1967 في إسطنبول، بحسب Cigarworld.de.

ومنذ عام 2023، يُلفّ خط Dalay Nicaragua على يد Luciano Meirelles في مصنع Luciano Cigars في إستيلي؛ كما تستورد Dalay Luciano Cigars إلى ألمانيا، بحسب Cigar Coop وHalfwheel.'
 WHERE `name` = 'Dalay' AND SHA1(TRIM(`history`)) = '974188858ec399602805e2041c18ca172b61f121';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dalay' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '974188858ec399602805e2041c18ca172b61f121';
-- brands|Daniel Marshall|history|ar — مدن لاتينية وترجمة habillages
UPDATE `brands` SET `history_ar` = 'أسّس Daniel Marshall عام 1982 دار علب وصناديق ترطيب (هيوميدور) فاخرة — بعقود مع Dunhill وCartier منذ العام الأول، وصناديق ترطيب لـNeiman Marcus وللملك الحسن الثاني ملك المغرب، بحسب موقع الشركة. ومنذ عام 1992، بدأ اسمه يرتبط بعالم السيجار، وهو العام الذي شارك فيه في معرض Big Smoke، ثم توجّه بعدها ابتداءً من عام 1995 إلى جمهورية الدومينيكان لتعتيق تبغه الخاص وتطوير تغليف سلسلته، دائمًا بحسب الشركة.

تتمحور التشكيلة الحالية حول DM Red Label، وهو تبغ نيكاراغوي من إستيلي ووادي خالابا يُعتَّق خمس سنوات ثم اثني عشر شهرًا إضافيًا داخل العلبة، وُلد من تعاون بين Manuel Quesada وNestor Plasencia ويُلف اليوم لدى Plasencia في نيكاراغوا، بحسب Corona Cigar والموقع الرسمي. أما السلسلة السابقة، DM2، التي قُدِّمت بثلاثة أثواب (White وBlack وRed)، فكانت تُلف لدى Quesada في جمهورية الدومينيكان؛ وتناولتها الصحافة بين عامي 2018 و2021، ولم تعد موجودة في متجر الشركة عام 2026.

يعرض متجر الشركة أيضًا سيجار 24KT Golden Cigar المُغطى بورق ذهب صالح للأكل، وعلبة-هيوميدور 38th Anniversary المصمَّمة بالتعاون مع Carlos Fuente.'
 WHERE `name` = 'Daniel Marshall' AND SHA1(TRIM(`history`)) = '73ff092d9d419e0d87c629a89565638e6148cd9c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Daniel Marshall' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '73ff092d9d419e0d87c629a89565638e6148cd9c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dapper' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '3bacd08d8ec7f0f302cb95f8deb9bb871222978a';
-- brands|Darier & Cleef|history|ar — مقاطعة Chiriquí لم تُترجم
UPDATE `brands` SET `history_ar` = 'يقول تجار تجزئة ألمان (noblego.de وsmokersplanet.de) إن Tabacalera Darier & Cleef تأسست عام 1881 على يد Alfons Darier وJean van Cleef؛ وتضيف smokersplanet.de أن إنتاجها توقف مرات عدة بين عامي 1903 و1999. أما الصحافة البنمية (Newsroom Panama، 2025) فتعتبر أن Joyas de Panamá، المؤسَّسة في فبراير 1986، هي أول مصنع سيجار دائم في البلاد: والروايتان متباينتان.

بحسب noblego.de، يلفّ المصنع سيجاره كله يدويًا وبحشوة طويلة، من تبغ بنمي يُعتَّق ثلاث إلى أربع سنوات قبل اللف. وتذكر المصادر المُطالَعة إقليم التبغ، تشيريكي، لكن لا يذكر أي منها المدينة التي تقع فيها الورشة.

تضم التشكيلة سلسلتين. تُقدَّم Colón في سلسلة Vintage 2001، التي أُطلقت في 16 نوفمبر 2007 وتُعتَّق ستة شهور إضافية في الخزانة بعد اللف، وفي سلسلة Especiales؛ والغلاف والرباط والحشوة كلها بنمية بالكامل، بحسب cigarworld.de. أما Cruzero de Panamá، التي يُنسب أصلها إلى عام 1881، فقد أُعيد إطلاقها نحو عام 2000 بإشراف كبير خبراء المزج Ramón، وأُضيفت إليها عام 2010 مقاسات Sportivos ذات القطر الكبير، بحسب noblego.de وcigar-wiki.com.'
 WHERE `name` = 'Darier & Cleef' AND SHA1(TRIM(`history`)) = 'f9fd9faad4c99fe6d4d70f479054fbb5a59273d0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Darier & Cleef' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'f9fd9faad4c99fe6d4d70f479054fbb5a59273d0';
-- brands|DBL|history|ar — أسماء لاتينية وصياغة العدد
UPDATE `brands` SET `history_ar` = 'أسّس Francisco Almonte دار DBL Cigars — Dominican Big Leaguer — سنة 2013. يقول إنه نشأ وسط التبغ: منذ سن السابعة كان يُجرّد أوراق التبغ من عروقها لحساب والده، الذي كانت له علامته الخاصة El Rey، وفي الثانية عشرة كان يلفّ السيجار بنفسه؛ ويُحصي، بحسب قوله، ما يزيد على ثمانية وستين فردًا من عائلته يعملون في هذه المهنة. ويذكر معلمَيه: Carlos Fuente من Arturo Fuente، وLitto Gomez من La Flor Dominicana، اللذين تتلمذ على يديهما.

اشترى Almonte سنة 2018 قطعة أرض تزيد قليلًا على فدان واحد في تامبوريل، بجمهورية الدومينيكان؛ وبدأ البناء سنة 2020، وافتُتح المجمّع بأكمله — مصنع سيجار ومصنع علب، بمساحة 32000 قدم مربع موزّعة على مبنيين — في 4 مارس 2023، بمناسبة الذكرى العاشرة لتأسيس الدار. وكان المصنع يشغّل حينها نحو مئة شخص؛ ولديه غرف تعتيق تتّسع لـ300000 سيجار، وقدرة على تخمير ما يزيد على 200000 رطل من التبغ. أمّا مصنع العلب، الذي أُقيم بالتعاون مع Kedwin Estrella وMiguel A. Martinez من Artesania Estrella، فيُعلَن عن طاقة إنتاجية تفوق 200000 علبة سنويًا.

في يونيو 2023، قدّمت DBL في معرض PCA خط La Tabla، بغلاف أرابيراكا الذي تصفه الدار بأنه مكسيكي. وفي سبتمبر 2026، يعرض الموقع الإسباني Pasión Puro كتالوجًا من سبعة خطوط: Amarillo وMaduro وMafu وFormula وExtra Viejo و2a Generación وEl Final.'
 WHERE `name` = 'DBL' AND SHA1(TRIM(`history`)) = '838fd1a217a22c4a88a8de358db2ed30c69e0502';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'DBL' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '838fd1a217a22c4a88a8de358db2ed30c69e0502';
-- brands|De Los Reyes Cigars|history|ar — أسماء لاتينية وأتبغة وورق
UPDATE `brands` SET `history_ar` = 'عائلة Reyes في التبغ الدومينيكي منذ القرن التاسع عشر. أمّا المصنع فحديث: افتتحه Augusto Reyes سنة 1995 في سانتياغو دي لوس كاباييروس.

وتوزيع الأدوار فيه واضح، وهو ما يجعل الدار جديرة بالاهتمام. فـLeo Reyes، شقيق Augusto، يزرع. وNirka Reyes، ابنة Augusto، تدير المصنع. ويأتي جزء كبير من الأوراق الداخلة إلى الورشة من حقول Leo — وأقدم هذه الحقول يستحقّ وقفة، لأنّه يعود في كلّ فصل من تاريخ الدار.

تحمل مزرعة Navarrete اسم بلدة إلى الشمال الغربي من سانتياغو. أنشأها Leo Reyes سنة 1961 على عشرين إلى ثلاثين فدّانًا — نحو عشرة هكتارات، وهي مساحة صغيرة. وتصفها مجلة Cigar Aficionado بأنّها أوّل مزرعة في جمهورية الدومينيكان زُرع فيها Piloto Cubano، وهو الصنف الذي أخذته الجزيرة عن كوبا بعد 1959 والذي يشكّل اليوم عمود معظم الحشوات الدومينيكية. ويُجنى فيها أيضًا Negrito، وهو غلاف داكن. ومن هنا يأتي غلاف Arsen، وهذا هو الحقل الذي وسّعته الدار لاحقًا بمزارع أخرى. وقليل من الدور الدومينيكية تمسك الطرفين هكذا، من المشتل إلى طاولة اللفّ.

تُخرج الورشة بين مليونين ومليونين ونصف من السيجارات في السنة. وعلاماتها الخاصة هي Saga — بسلاسلها Golden Age وBlend No. 7 وShort Tales — وDon Julio، والخطّ الذي يحمل اسم المؤسّس. وتلفّ أيضًا لغيرها: تُصنع هنا Debonaire وFittipaldi وPatoro وIndian Motorcycle.

وDon Julio ليس اسمًا مُختلَقًا. إنّه يشير إلى Don Julio Samuel Reyes Fermín، وهو مزارع من الجيل الثالث في العائلة، والعلامة تُصنع بالكامل من تبغ دومينيكي من حقول آل Reyes في وادي سيباو. ولها خطّان رئيسان: Punta Espada الصادر سنة 2014، وSang Bleu، أوّل جديد في الإنتاج المنتظم منذ عشر سنوات، وقد ظهر سنة 2024.

Arsen علامة لهذا المصنع — غير أنّها لم تُولد فيه. أطلقها Arsen Gasparian سنة 2010: كان سكرتيرًا صحفيًّا سابقًا في وزارة الخارجية الأرمينية، ودخل عالم السيجار ناشرًا للمجلة الروسية Hecho a Mano قبل أن يُصنّع علامته الخاصة في جمهورية الدومينيكان. وهي تستعمل غلاف Navarrete. لهذا ترد هنا: علامةٌ يتصوّرها طرفٌ ثالث وتُلفّ في هذه الدار — كحال Zino لدى Oettinger Davidoff، وOliveros لدى Boutique Blends.'
 WHERE `name` = 'De Los Reyes Cigars' AND SHA1(TRIM(`history`)) = '089c1e96628dbd93a99e4cf901916c0a12952f8a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'De Los Reyes Cigars' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '089c1e96628dbd93a99e4cf901916c0a12952f8a';
-- brands|Debonaire House|history|ar — أسماء أشخاص وعلامات لاتينية
UPDATE `brands` SET `history_ar` = 'Debonaire House دارٌ بعلامتين وبلا مصنع. أسّسها Phil Zanghi سنة 2012 مع Daniel Sinclair، من علاقة قديمة مع Emilio Reyes ومصنع De Los Reyes في سانتياغو الذي له بطاقته الخاصة: هناك يُلفّ كلّ شيء، تحت إشراف Zanghi.

العلامتان هما Debonaire — اسم الدار — وIndian Motorcycle Cigars، بترخيص من صانع الدرّاجات النارية. جاءت كلٌّ منهما بغلافين، Habano وMaduro؛ وفي 2018 أضاف Daybreak كونيتيكت إكوادوريًّا تحت اسم Debonaire، المزجة الخامسة في الكتالوج، وُزّعت مع Drew Estate.

النموذج هو نموذج مشهد البوتيك: توقيع أمريكي، ومصنع دومينيكي، وهذا الأطلس يسمّي الاثنين.'
 WHERE `name` = 'Debonaire House' AND SHA1(TRIM(`history`)) = '266025cb335fd47c4bd827841ae6a5821aa6e5a6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Debonaire House' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '266025cb335fd47c4bd827841ae6a5821aa6e5a6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Despot' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'a78f7155b80e4d5fa24bfef0f2d7a9b581d05947';
-- brands|Diamond Crown|history|ar — أسماء وعلامات بحروف لاتينية
UPDATE `brands` SET `history_ar` = 'وُلدت Diamond Crown من طلبٍ وجّهته عائلة إلى أخرى. ففي عام 1995، بمناسبة مرور مئة عام على الدار التي أسّسها والده في كليفلاند، طلب Stanford Newman من Carlos Fuente Sr. أن يؤلّف سيجارًا استثنائيًا.

واستقرّ الرجلان على قياسٍ لم يكن أحد يصنعه آنذاك: سلسلة كاملة بقُطر 54، في وقتٍ كان أغلظ سيجار في السوق يقف عند 52. ويُعتَّق غلاف Connecticut Shade خمس سنوات قبل اللفّ. وقد كسرت المقاسات المضافة لاحقًا هذا التوحيد — إذ يرتفع No. 6 إلى 64، ويعود No. 9 إلى 50 — غير أنّ قلب السلسلة بقي عند الـ54 الأصلي.

ويخرج السيجار من Tabacalera A. Fuente في سانتياغو دي لوس كاباييروس: الورش نفسها التي تصنع Arturo Fuente وAshton، وكلاهما في هذا الأطلس. إنّه تركيب Ashton معادًا بعد عشر سنوات — علامة أمريكية، وتبغ وأيدٍ دومينيكية — ولهذا صُنّفت البطاقة هنا لا في الولايات المتحدة مع دارها الأم.

ووسّعت العائلة السلسلة منذ ذلك الحين. فظهرت Maximus في مطلع الألفية بغلاف إكوادوري من نوع El Bajo مزروع في الشمس ومعتَّق خمس سنوات أيضًا، في مزاج أشدّ قوّة بوضوح. ثم تلتها Julius Caeser عام 2010، إحياءً لمئة وخمسة وثلاثين عامًا على مولد Julius Caeser Newman ومئة وخمسة عشر عامًا على شركته، بغلاف إكوادوري من بذرة هافانية. أمّا Diamond Crown Tampa، وهي الأحدث، فتأخذ رابطًا من نوع Florida Sun Grown — تبغ مزروع في فلوريدا، وهو لدارٍ من تامبا ليس مجرّد تفصيل في المزيج.'
 WHERE `name` = 'Diamond Crown' AND SHA1(TRIM(`history`)) = '2d63ba79805e5ed3d0362df6776039a7db42d094';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Diamond Crown' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '2d63ba79805e5ed3d0362df6776039a7db42d094';
-- brands|Dios del Sol|history|ar — إعلان لا دخول؛ حفيد؛ مقاسات
UPDATE `brands` SET `history_ar` = 'شركة Kopp Tobaccos موزّع ألماني عائلي يقع بالقرب من هامبورغ، ويعود تاريخه إلى نشاط تجاري أسسه Martin Wess في 15 أبريل 1919؛ وبحسب halfwheel، فإن Oliver وThilo Kopp، وهما من أبناء أحفاده، المالكان الوحيدان لها منذ عام 2023. توزّع الشركة في ألمانيا علامات مثل My Father، ومنذ عام 2026 علامة Perdomo، كما تبيع تبغ الغليون تحت اسمها الخاص.

أُعلن عن Dios del Sol في 15 أكتوبر 2025، وهو أول سيجار خاص بالشركة، طوّره Oliver Kopp. يجمع هذا السيجار، الملفوف في هندوراس، بين غلاف Connecticut هندوراسي، وغلاف داخلي broadleaf هندوراسي أيضاً، وحشوة تمزج تبغ Jamastrán (هندوراس) وJalapa (نيكاراغوا)؛ ويُطرح في ستة مقاسات، من Half Corona إلى Churchill، تحت اسم فئة El Principio، أي «البداية».

لم يُكشف عن المصنع الذي يلفّه، بحسب halfwheel: إذ تصفه Kopp Tobaccos بأنه عائلة عريقة ومعروفة في صناعة السيجار، من دون تسميتها. ولم يذكر أي إعلام تفاصيل إضافية، حتى عند وصول السيجار إلى الولايات المتحدة عبر الموزّع Arango Cigar Co. عام 2026.'
 WHERE `name` = 'Dios del Sol' AND SHA1(TRIM(`history`)) = '016f645cbcd9a3f1eefd10b056b6d20c011faa29';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dios del Sol' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '016f645cbcd9a3f1eefd10b056b6d20c011faa29';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Domaine de Lavalette' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '23adcc907bb54d960e1538dd6d1aadf5227a5aa7';
-- brands|Domenico|history|ar — مدينة Oberhasli لم تُترجم
UPDATE `brands` SET `history_ar` = 'تعرّف Domenico Cigars نفسها، على موقعها الإلكتروني، بأنها مصنع صغير في بونتا كانا، تأسس عام 2001 وتحت إدارة سويسرية. وتذكر الدار عنوانًا لمصنعها هو جادة Estados Unidos في بافارو، وتذكر لإدارتها السويسرية Matthias Richner في أوبرهازلي، مع صالة عرض في ريغنسدورف. ولا تسمّي مؤسِّستها في صفحة التعريف بموقعها. ويقول Cigarworld.de إن Michaela Ströml وُلدت في النمسا؛ ويقول Smokersplanet.de (29 نوفمبر 2021) إنها قدمت من ألمانيا وإنها مالكة ألمانية؛ وفي سبتمبر 2026، يتحدث Starke Zigarren عن نمساوية مغتربة كانت تدير المصنع، ويقول إن سويسريًا يقف وراء Domenico.

وبحسب الدار، يتطلب كل سيجار ما يزيد على 40 مرحلة يدوية، ويلفّ tabaquero نحو 120 سيجارًا في اليوم، بينما تطلب المصانع الكبيرة من 170 إلى 250 بالقطعة؛ وتقول إنها لا توظّف سوى tabaqueros معلّمين تدرّبوا لمدة لا تقلّ عن ثلاث سنوات. وتقول إن تبغها يُزرع في وادي سيباو، شمال سانتياغو، وإن لفّافيها يزاوجون بين تبغ دومينيكي وتبغ كوبي مزروع في تربة دومينيكية. ويُحصي Smokersplanet.de أحد عشر موظفًا في نوفمبر 2021.

وفي سبتمبر 2026، يقول موقع الدار إن المصنع يتيح الزيارات، ويضم متجرها خمسة وأربعين صنفًا. وتصنّف الدار سيجارها في خطوط: Suave، الذي تصفه بأنه خفيف، بغلاف Connecticut/Ecuador Shade؛ وFuerte، بغلاف Broadleaf؛ وإصدارات محدودة بغلاف Sumatra. ويؤرّخ Cigarworld.de دخول العلامة إلى كتالوجه بيوم 10 سبتمبر 2012.'
 WHERE `name` = 'Domenico' AND SHA1(TRIM(`history`)) = '6918d1aa4a6b34b7b1c1b17af2ee11a34f3eaca3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Domenico' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '6918d1aa4a6b34b7b1c1b17af2ee11a34f3eaca3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dominican Estates' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '0c48704f2affd428072edb72412cfb136ec1dd48';
-- brands|Don Collins|history|ar — علامة لاتينية؛ سيجارات؛ تعبير
UPDATE `brands` SET `history_ar` = 'Don Collins علامةُ ورشة-متجر في سان خوان القديمة، في شارع الكريستو، حيث يُرى السيجار يُلفّ من الشارع. تصنعها Puerto Rico Tobacco Corporation منذ 1991 — التاريخ الذي يحتفظ به هذا الأطلس، والوحيد الذي تعطيه الدار من دون حاجة إلى نقاش.

لأنّ الدار تروي أبعد من ذلك. تقول إنّها منحدرة من Porto Rico Leaf Company زعمت أنّ إسبانيا رخّصتها نحو 1506، وتقدّم نفسها مصنع السيجار الأقدم في الكاريبي؛ وينسب هذا الأطلس ذلك القول إلى قائله، ولم يجده في أيّ مكان آخر. أمّا الثابت فأشدّ تواضعًا وأمتن: في 1899 نظّمت American Tobacco Company شركة Porto Rican-American Tobacco Company التي استوعبت Rucabado y Portela، صانع السيجار والسجائر في الجزيرة — وهذا مكتوب في حكم 1911 الذي فكّكت به المحكمة العليا الأمريكية الاحتكار. وتقول Puerto Rico Tobacco Corporation اليوم إنّها وريثة تلك الشركة؛ الصلة معقولة، ويتركها هذا الأطلس بصيغة الاحتمال.

كانت بورتوريكو بلدًا كبيرًا للتبغ حتى عشرينيات القرن الماضي. ولم يبقَ لها من اللفّ اليدوي سوى هذه الورشة، ويفتح هذا الأطلس الجزيرة من أجلها — بلدُ لفٍّ توثّقه واجهته، وهو ما تقوله البطاقة بدلًا من إخفائه.'
 WHERE `name` = 'Don Collins' AND SHA1(TRIM(`history`)) = '8048ea30a32a9bf86fe76a939ace06cb34e7168b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Collins' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '8048ea30a32a9bf86fe76a939ace06cb34e7168b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Duarte' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'cbcf433e01f2d2626de9d9e106f2a15893447609';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Emmanuel' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'fb32e87f6b823a57238ebcc30f49e7569636d992';
-- brands|Don Fidel|history|ar — اسم شخص؛ revendeur؛ اسم مكان
UPDATE `brands` SET `history_ar` = 'Don Fidel هي علامة تاجر التجزئة البرشلوني Justo Rico، مالك عدّة متاجر تبغ في كتالونيا، الذي عهد بلفّها إلى تاباكاليرا عائلة Fidel Olivas في إستيلي — وكبير الخلّاطين، وفق متجر التبغ الألماني Cigarworld، هو Don Fidel Olivas شخصيًا. ولا تغطّي الصحافةُ المتخصّصةُ المستقلّةُ العلامةَ؛ وما يُعرف عنها يأتي من تاجرَي بيع اثنين، Cigarworld وNoblego، يصفانها بأنّها مُلفوفة يدويًا بالكامل. ويجمع خطّ El Legado، بأربعة مقاسات — Robusto وToro وGordo وToro Grande —، حشوة نيكاراغوية معتّقة ثلاث سنوات على الأقلّ، تحت غلاف H2000 إكوادوري وورقة رابطة نيكاراغوية وفق Noblego، أو تحت غلاف وورقة رابطة من habano مع حشوة تمزج نيكاراغوا وجمهورية الدومينيكان وفق تاجر هندي، بملمح حارّ وخشبي يصفه الاثنان بأنّه متوسط القوة.

وفي المصنع نفسه، يُلفّ Justo Rico أيضًا علامة أخرى تقدّمها Cigarworld بوصفها منفصلة عن Don Fidel: Vedado Flat Black، بغلاف San Andrés مكسيكي، وحشوة من إستيلي وكونديغا وخالابا، معتّقة ثمانية وأربعين شهرًا على الأقلّ. ولم يُعثر على تاريخ تأسيس لعلامة Don Fidel نفسها؛ ولا يزال خطّ El Legado يُباع لدى عدّة متاجر تبغ أوروبية سنة 2026، من دون أخبار صحفية مؤرّخة.'
 WHERE `name` = 'Don Fidel' AND SHA1(TRIM(`history`)) = '741a7134d8a368df8825688f01957ae76dd09673';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Fidel' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '741a7134d8a368df8825688f01957ae76dd09673';
-- brands|Don Lucas|history|ar — عبارة عدد؛ أسماء لاتينية؛ سيجارات
UPDATE `brands` SET `history_ar` = 'Don Lucas مصنعٌ على الساحل السياحي، وتبدأ البطاقة بقول ذلك لأنّه ما يميّزه عن دور سانتياغو: يقع في مجمّع Mundo Auténtico في بونتا كانا، بين القهوة والشوكولاتة والروم، وتُنزل حافلات الفنادق زوّارها هناك. أسّسه بلجيكي، Philippe Gillet — سنة 1992 كما تقول الدار، بلفّافَين ومئة وخمسين سيجارًا في اليوم؛ وما يزيد على خمسة وأربعين موظّفًا اليوم. وتوحي سلسلة «20th Anniversary» في الكتالوج نحو 2017 بتاريخ انطلاق آخر؛ ويكتب هذا الأطلس الاثنين بدلًا من الحسم.

ليس ديكورًا مع ذلك. يأتي التبغ من المزارع حول سانتياغو، في الطرف الآخر من الجزيرة، ومن أماكن أخرى؛ وتصف الصحافة التي زارت المكان بالاتٍ وقاعة فرز وورشة لفّ وعلبًا من الأرز تُصنع في الموقع، من دون حصّة إنتاج — يلفّ المصنع ما تسمح به الورقة الجاهزة. ويُباع نحو ستين في المئة من السيجار في متجر المجمّع؛ والباقي يذهب إلى نحو عشرين متجرًا أمريكيًّا وبضعة متاجر في كولومبيا.

يُقرأ الكتالوج بالأغلفة: Classic بكونيتيكت إكوادوري، وHS بسومطرة، وAL ببرودليف أمريكي، وسيجار دومينيكي خالص للذكرى، وFamily Reserve. يحتفظ هذا الأطلس بالدار على ما هي — مصنعٌ مسمًّى يمكن زيارته ويلفّ يدويًّا — ويقول أين هو.'
 WHERE `name` = 'Don Lucas' AND SHA1(TRIM(`history`)) = 'dfc2c062a9824cc18d2b9585511cecb5e62c9dc8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Lucas' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'dfc2c062a9824cc18d2b9585511cecb5e62c9dc8';
-- brands|Don Tomas|history|ar — علامات لاتينية؛ ازدواج؛ سلسلة الملكية
UPDATE `brands` SET `history_ar` = 'وُلد Don Tomas عام 1975 في دانلي، ولا يدين بشيء لهندوراسيّ: أنشأته شركة أمريكية هي U.S. Tobacco. وقد أسبغ أحد مديريها صيغة إسبانية على اسم أبيه ليسمّي بها العلامة.

خرج السيجار من HATSA — Honduras American Tobacco — بإدارة Estélo Padrón، معلّم الورشة الذي يسمّيه هذا الأطلس أصلًا في بطاقة Bolívar الهندوراسي. وكان المزيج الأصليّ يزاوج ورق هندوراس من تالانغا بورق نيكاراغوا من خالابا.

ثم شوّهه رواج التسعينيات. تجاوز الطلبُ ما يقدر عليه الحصاد، فأُعيد بناء المزيج بأتبغة كولومبية ودومينيكية وبرازيلية تحت غلاف إكوادوريّ. وقلّة من العلامات تروي هذه الواقعة؛ وهي مع ذلك تفسّر ما وجده جيل كامل من المدخّنين في العلبة.

انتقلت العلامة أربع مرّات بين الأيدي دون أن تغادر دانلي قطّ: U.S. Tobacco، ثم General Cigar، ثم Swedish Match عام 2004، ثم المجموعة الدنماركية Scandinavian Tobacco المالكة لـGeneral Cigar منذ 2005. وهي سلسلة الملكية عينها التي يتتبّعها الأطلس عند Punch وHoyo de Monterrey وEl Rey del Mundo الهندوراسيّة.'
 WHERE `name` = 'Don Tomas' AND SHA1(TRIM(`history`)) = '9f654253ba36a69b62c34394cbaef6de2dfcc242';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Tomas' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '9f654253ba36a69b62c34394cbaef6de2dfcc242';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Zuarin' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '78f24a100ccbfeb4a8928083baa6a33217526a82';
-- brands|Dona Flor|history|ar — تعبير؛ أسماء لاتينية؛ تقليد
UPDATE `brands` SET `history_ar` = 'وُلدت Dona Flor من لقاء دراية كوبية بتبغ باهيا. استقرّت دار Menendez Amerino في ريكونكاڤو بفكرة تطبيق طرائق اللفّ الهافانية على ورقة برازيلية، وهو ما لم يجرّبه أحد فعلاً بهذه الصرامة.

والنتيجة واحد من أشدّ أنواع السيجار تفرّداً في القارّة: البناء كوبي — مقاسات كلاسيكية، ولفّ متقن، واحتراق مضبوط — لكن المذاق يبقى برازيلياً، فاكهياً حامضاً، بحلاوة mata fina التي لا يمنحها شيء آخر. إنه جسر بين تقليدين، لا محاكاة.

أمّا الاسم فمن رواية لـJorge Amado، كاتب باهيا. وليس هذا تصنّعاً: فالدار تتمسّك بتجذّرها المحلي بقدر تمسّكها بمنهجها المستورد، وهذا تحديداً ما يسعى الأطلس إلى إظهاره — أرضٌ وتقنية، وما يولد من لقائهما.'
 WHERE `name` = 'Dona Flor' AND SHA1(TRIM(`history`)) = '7578c20f27ab4867703f74b414510597da01c651';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dona Flor' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '7578c20f27ab4867703f74b414510597da01c651';
-- brands|Dos Amigos|history|ar — سيجارات بدل سيجار
UPDATE `brands` SET `history_ar` = 'وُلدت Dos Amigos في برشلونة من صداقة جمعت بين مؤسسَين اجتمعا حول شغف السيجار والموسيقى وحب مشاركة اللحظات الكبيرة، بحسب موقع الشركة. وأطلق Jordi Llorens وIsidre Pineda العلامة في أكتوبر 2025، وقدّما تشكيلتها في معرض Intertabac عام 2026.

يُلَفّ السيجار يدويًا في نيكاراغوا، بحسب الشركة، من تبغ Jalapa وEstelí وOmetepe؛ ولا موقع الشركة ولا الصحافة يُسمّيان المصنع.

تضم التشكيلة أربع سلاسل: Paster وSidecar، بغلاف Ecuador Rosado فوق حشوة نيكاراغوية؛ وPaladium، بالمزيج نفسه في شكل double figurado يُعتَّق اثني عشر شهرًا؛ وZwoa Spezln، إصدار من ميونخ بغلاف إكوادوري، تصفه الشركة بأنه متوسط الشدة.'
 WHERE `name` = 'Dos Amigos' AND SHA1(TRIM(`history`)) = 'f855318d4bd6590f8a26bb15e52abb565d9f0121';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dos Amigos' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'f855318d4bd6590f8a26bb15e52abb565d9f0121';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dos Jotas' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '334bb1e56a1fef7681cf7a3f5aff3325fc009726';
-- brands|Dos Santos|history|ar — عبارة عدد؛ أسماء لاتينية؛ حرف جر
UPDATE `brands` SET `history_ar` = 'Dos Santos هي الدار الكناريّة الوحيدة في هذا الأطلس التي لا تنتمي إلى جزيرة لا بالما. ففي عام 1921 افتتح Joaquín Jesús Dos Santos González مصنعه في شارع بيروخو رقم 16 في لاس بالماس دي غران كناريا، وسمّاه La Regenta. كان الطلب الأوروبي على التبغ قويًا بعد الحرب العالمية الأولى، وكان ميناء لاس بالماس قادرًا على تلبيته: فقد رست فيه سفن ألمانية عالقة منذ 1914 تحمل على متنها ورق تبغ كوبيًا. تؤرّخ الدار تأسيسها بعام 1921، بينما تُرجع الصحافة الكناريّة العلامة إلى 1919.

وتعاقبت أربعة أجيال. تسلّم الابن Joaquín Roberto في أربعينيات القرن الماضي فأضاف السيجار — آليًا ثم ملفوفًا باليد — إلى إنتاج لم يكن يضمّ سوى السجائر والتبغ المفروم. وتوفّي عام 1983، فخلفه الجيل الثالث، ويدير الدار اليوم جيلها الرابع.

ولم يعد مصنع شارع بيروخو القديم ملكًا للدار. فالمبنى مصنّف أثريًا ويضمّ اليوم مركزًا للفنون احتفظ باسم السيجار: Centro de Arte La Regenta. أمّا الإنتاج فقد انتقل إلى منطقة صناعية في لاس توريس.

والأرقام تقول ما هي هذه الدار حقًّا. فهي تعلن ما يزيد على مليار سيجارة، وستة ملايين سيجار آليّ، وثمانية وثلاثين مليون سيجار صغير — وخمسمئة ألف سيجار ملفوف يدويًا. فالفاخر هو أصغر أحجامها. وتصدّر إلى ألمانيا وتشيكيا وتشيلي والصين والمجر وأنغولا، وتحمل كذلك علامة Cónsul، وأعادت إطلاق Condal عام 2016.'
 WHERE `name` = 'Dos Santos' AND SHA1(TRIM(`history`)) = '37b22f195668e815d763479726d379d79ad8cb07';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dos Santos' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '37b22f195668e815d763479726d379d79ad8cb07';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Drunk Chicken' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '65b5b44799f9c793f443af848a1bd573bed4bc39';
-- brands|Dunbarton Tobacco & Trust|history|ar — أسماء لاتينية؛ حذف داكنًا
UPDATE `brands` SET `history_ar` = 'Dunbarton Tobacco & Trust بلا مصنع، مع أنّ مؤسّسها أدار مصنعًا يومًا. فقد كان Steve Saka رئيسًا لـDrew Estate — التي يضمّها هذا الأطلس — قبل أن يرحل ليؤسّس داره الخاصة في صيف 2015.

وهو يوكِل اللفّ إلى غيره: إلى Joya de Nicaragua، أقدم مصانع البلاد وهي أيضًا في هذا الأطلس، وإلى NACSA (Nicaragua American Cigars) حيث تخرج Mi Querida على يد Raul Disla. إنّه نموذج Crowned Heads، مع فارق واحد: Saka يمزج بنفسه ويوقّع مزائجه باسمه.

وافتتحت Sobremesa الكتالوج عام 2015. والكلمة تسمّي في الإسبانية اللحظة التي يبقى فيها المرء إلى المائدة بعد الطعام والحديث مستمرّ — وهي التي تحدّد مزاج الدار: متوسط إلى قويّ، بالتراب والتوابل الحلوة والجلد والقهوة المحمّصة.

أمّا السلاسل التالية فتحمل أسماء لا تشرح شيئًا لمن لا يعرفها، وذلك مقصود: Mi Querida، وSin Compromiso، وTodos Las Dias، وTriqui Traca، وMuestra de Saka. والأخيرة سلسلة تجارب — حرفيًا: عيّنات Saka.'
 WHERE `name` = 'Dunbarton Tobacco & Trust' AND SHA1(TRIM(`history`)) = '9a6b5461f7f3617ecb2bccb7c58d7216ea0e6cb4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dunbarton Tobacco & Trust' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '9a6b5461f7f3617ecb2bccb7c58d7216ea0e6cb4';
-- brands|El Galan|history|ar — إضافة سنوات؛ شديدة؛ سيجارات
UPDATE `brands` SET `history_ar` = 'كان جدّا Felix A. Mesa لأبيه، Felipe وCaridad Mesa، يزرعان التبغ في مقاطعة لاس بياس الكوبية. أسّس Mesa شركة El Galan Cigars عام 2013، وأطلق عليها اللقب الذي كان يحمله جدّه في كوبا وكان دائم الأناقة في ملبسه؛ ويُلَفّ سيجاره في مصنعه الخاص El Galan Cigars S.A. في إستيلي بنيكاراغوا. وفي أكتوبر 2018 أطلق خط Vegas del Purial، بغلاف Sumatra إكوادوري على رباط وحشوة نيكاراغويين.

في يناير 2018، وخلال مهرجان Puro Sabor، أعلنت Arturo Fuente عن مصنع جديد في إستيلي هو Gran Fabrica de Tabacos La Bella y La Bestia، وأسندت إدارته إلى Felix Mesa. وفي 2023، ترك Mesa عمليات Fuente في نيكاراغوا وعاد إلى El Galan، بحسب Halfwheel.

بحلول سبتمبر 2026، تبيع Cigarworld.de أربعة خطوط من El Galan: Reserva Especial، بغلاف oscuro، وهي قوية؛ وConnecticut، وهو puro نيكاراغوي بطابع خفيف؛ وMaduro، بغلاف برازيلي؛ وTabaco de la Casa، التي تُقدَّم بوصفها خط الفئة الأساسية. وفي يناير 2016، قدّمت Cuenca Cigars أيضًا خط Doña Nieves، بنسختي Gran Reserva وSentimiento.'
 WHERE `name` = 'El Galan' AND SHA1(TRIM(`history`)) = 'dd7eeeb4fcc3839c978668af729cb046261055a3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Galan' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'dd7eeeb4fcc3839c978668af729cb046261055a3';
-- brands|El Gaucho|history|ar — اسم شخص بحروف لاتينية
UPDATE `brands` SET `history_ar` = 'El Gaucho هي العلامة الفاخرة الرائدة لشركة Besuki Raya Cigars (PT Besuki Raya Cigar)، الكائنة في جمبر، شرق جاوة. وتزرع BRC، وهي شركة تابعة مستقلة منذ 2020 لمجموعة Mangli Djaya Raya الإندونيسية (MDR، ويرأسها Christian A. Njoto Njoo)، التبغَ في منطقة بيسوكي وجمبر منذ 2009، قبل أن تتّجه إلى السيجار الفاخر، وفق الصحافة المهنية Tobacco Asia وملف العارض في معرض Intertabac. وEl Gaucho، الذي أُطلق سنة 2022 بعد، وفق العلامة، ثلاث سنوات من تخزين التبغ، هو أوّل منتجاتها الراقية، وسبقته لدى BRC علامات Rojo Blanco (2020) ثم My Lockdown وLauk Daun (2021). وتقول El Gaucho إنّ سيجارها مُلفوف يدويًا بالكامل؛ ولا يؤكّد أيّ من المصدرين المستقلّين ذلك صراحةً، ولا يذكر أيّهما آلة.

يضمّ الكتالوج خطّين، كلاهما في علبة مضغوطة بقياس 54 حلقة وبثلاثة مقاسات — Square وToro وChiquitos. ويجمع خطّ Premium بين غلاف إكوادوري وورقة رابطة برازيلية من أرابيراكا وحشوة دومينيكية، بنكهات الشوكولاتة والقرفة والقهوة التي تصفها العلامة بأنّها متوسطة إلى ممتلئة القوة. أمّا Fantastico، بغلاف إكوادوري من صنف habano، فتجمع الورقة الرابطة البرازيلية نفسها مع حشوة دومينيكية وإندونيسية، بقوام متوسط ونكهات الزبدة والحمضيات. وفي المصنع نفسه، تُلفّ Besuki Raya أيضًا، بالشراكة مع Monsoon Cigar، علامة Mata Hari.'
 WHERE `name` = 'El Gaucho' AND SHA1(TRIM(`history`)) = 'e856468ce274b6dbe05e4addfd61b1e43bfa15a5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Gaucho' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'e856468ce274b6dbe05e4addfd61b1e43bfa15a5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Mago' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '7574c28917dfdc1f4f15abf2964c49ebb1aaf56c';
-- brands|El Rey del Mundo Honduras|history|ar — أسماء أشخاص وعلامات لاتينية
UPDATE `brands` SET `history_ar` = 'يعود تاريخ العلامة الكوبية إلى 1848. أمّا شبيهتها الهندوراسية فمن عمل عائلة Villazon، التي عهدت بلفّها إلى Honduras American Tobacco — تلك HATSA التي أسّسها Frank Llaneza عام 1963، وكان مصنعها في كوفراديا أول مصنع سيجار في البلد موجَّه إلى التصدير.

اشترت General Cigar شركة Villazon عام 1997. فالدار تتقاسم إذًا ورشها ولافّيها مع Punch وHoyo de Monterrey الهندوراسيّين، وكلاهما في هذا الأطلس: فقد نالت Villazon الحقوق الأمريكية لهما عام 1965، ونقل Llaneza إنتاجهما إلى HATSA عام 1969.'
 WHERE `name` = 'El Rey del Mundo Honduras' AND SHA1(TRIM(`history`)) = '034425602a98b31f87b937c66bcb77007b7da9d5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Rey del Mundo Honduras' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '034425602a98b31f87b937c66bcb77007b7da9d5';
-- brands|El Septimo|history|ar — أسماء لاتينية؛ سيجارات
UPDATE `brands` SET `history_ar` = 'El Septimo علامةُ رفاهية وُلدت في جنيف — أُسّست، كما تقول، سنة 2005، وعُرفت أوّلًا في أوروبا والشرق الأوسط — ويصنّفها هذا الأطلس في كوستاريكا حيث يُلَفّ سيجارها في مصنع تقول إنّه لها. في آذار/مارس 2019 اشتراها Zaya Younan، المموّل ذو الأصل العراقي على رأس Younan Company، مجموعة رفاهية تملك قصورًا وكروم عنب في بوردو وسانت إميليون؛ وتدير ابنته Alexandra التسويق، والمجموعة التي تحمل اسمها، المطلقة في حزيران/يونيو 2019، مصمَّمة للنساء.

تدّعي الدار الكثير، وينقل هذا الأطلس: أنّ الغلاف والورقة الرابطة والحشوة كوستاريكية بالكامل، مزروعة ومُلفوفة في كوستاريكا؛ وأنّها تطبّق على حقولها أساليب كرومها؛ وأنّ تبغها ينمو فوق ألفين وثمانمئة متر — هذا الرقم الأخير تتركه البطاقة للدار، إذ لم يتحقّق منه أيّ مصدر خارجي. أمّا ما يُرى بلا نقاش: أسعارٌ مرتفعة جدًّا، وعلب ثقيلة، وكتالوج يتقدّم بسرعة — مجموعة Sacred Arts لسنة 2021، سبعة أنواع من السيجار بأسماء فنّانين وأيّام الخلق السبعة، ومئة وثلاثون متجرًا أمريكيًّا في السنة نفسها بطموح بلوغ الألف.

دارٌ تبيع الرفاهية قبل أن تبيع التبغ، وهو ما يقوله هذا الأطلس من دون حكم، لأنّ هنا أخريات — Atabey، على بُعد كيلومترات قليلة، إحداها.'
 WHERE `name` = 'El Septimo' AND SHA1(TRIM(`history`)) = '595e0f0effc261ce941df4a3db755d49b2b73a37';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Septimo' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '595e0f0effc261ce941df4a3db755d49b2b73a37';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Eladio Diaz' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'cea4c512b851d8bbbb9febbf50dbe92a118a9158';
-- brands|Emilio Cigars|history|ar — أسماء وعلامات لاتينية
UPDATE `brands` SET `history_ar` = 'وُلدت Emilio خلف طاولة بيع. كان Gary Griffith يدير متاجر Delaware Cigars حين أطلق علامته عام 2010. والانتقال من بائع تجزئة إلى صاحب علامة درب شائع في الولايات المتحدة، ويضمّ هذا الأطلس منه غير مثال — وKristoff واحد منها.

لم يملك مصنعًا قطّ، وكثيرًا ما بدّل الورشة. فـAF1 ثم AF2 يحملان في اسمهما اسم صانعهما: A.J. Fernández. أمّا Grimalkin عام 2011 فكان سيجارًا نيكاراغويًّا خالصًا يُلَفّ عند My Father — وgrimalkin لفظ إنجليزيّ قديم يعني القطّة الرمادية. وقد نال الاسم والملصق من النقد ما كفى لتسحبهما الدار عام 2012 وتعيد تسمية المزيج Mousa ضمن سلسلة تُدعى La Musa.

ثم عاد Grimalkin، في عهد Scott Zucca مالك العلامة اليوم: يُصنع في Fábrica Oveja Negra، ورشة Black Label Trading Co. في إستيلي.

ثلاثة مصانع، وثلاث عائلات، واسم واحد على الحلقة. ولكلٍّ من A.J. Fernández وMy Father وBlack Label Trading بطاقته في هذا الأطلس — وهي أوضح طريقة لبيان ما تكونه علامةٌ بلا مصنع.'
 WHERE `name` = 'Emilio Cigars' AND SHA1(TRIM(`history`)) = 'd73abddff0bd51092550a3e5a8d6031611f09525';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Emilio Cigars' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'd73abddff0bd51092550a3e5a8d6031611f09525';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Emperors Cut' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '61d887251e7ea7d54a74076b61f6e1a1f0383e93';
-- brands|Epic Cigars|history|ar — noms propres en latin
UPDATE `brands` SET `history_ar` = 'وُلدت Epic من شرطي كندي صار وكيل عقارات في الكاريبي. ترك Dean Parsons عشر سنوات من الشرطة سنة 2005 إلى جزر تركس وكايكوس حيث يصعب إيجاد سيجار جيّد؛ فكان يذهب لشرائه من جمهورية الدومينيكان هديّةً لزبائنه، وتعرّف هناك إلى مصانع صغيرة، وأطلق علامة أولى مقصورة على الجزر، Turks Select، من 2006 إلى 2010. وبعد استقراره في سانتياغو سنة 2009 أسّس Epic سنة 2010 بسيجارين، Maduro وCorojo، ما زالا في الكتالوج.

المصنع هو الذي يلفّ Kristoff التي يحمل هذا الأطلس بطاقتها: Charles Fairmorn في سانتياغو، الذي صار Tabacalera von Eicken. يحمل Corojo Reserva غلاف كوروخو إكوادوريًّا، وMaduro Reserva غلاف أرابيراكا برازيليًّا. وفي أواخر 2019 اشترت Zander-Greg، الموزّع الكاليفورني الذي يملك Nat Cicco منذ 2007، Epic وأبقت Parsons على رأسها — ويقول إنّ قليلًا تغيّر بالنسبة إليه، سوى الكمّيات والأسواق.

علامةٌ أسّسها أجنبي، ولفّها مصنع مسمّى، واشتراها موزّع: ثلاثة أشياء يكتبها هذا الأطلس كما هي، من دون ترجمتها إلى رومانسية.'
 WHERE `name` = 'Epic Cigars' AND SHA1(TRIM(`history`)) = '1702f0224afbf9344d45369efb7559f28b6af056';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Epic Cigars' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '1702f0224afbf9344d45369efb7559f28b6af056';
-- brands|Espinosa|history|ar — رتبة مفقودة، ندرة، أسماء لاتينية
UPDATE `brands` SET `history_ar` = 'كان Erik Espinosa قد عرّف بعلامتين — 601 وMurcielago — تحت شركة كان يديرها مع شريك، قبل أن يستعيد وحده الاسم الذي هو اسمه. ثم فعل ما يفعله قليل من مؤسّسي العلامات: افتتح مصنعه الخاص، La Zona، في إستيلي، بدل أن يواصل اللفّ عند الآخرين.

هذا الانتقال من صفة العلامة إلى صفة الصانع يغيّر كل شيء. فالدار تتحكّم الآن بخلطاتها من اللفّ حتى خروجها، وتنتج لنفسها بقدر ما تنتج لعلامات أخرى، ويمكنها تحمّل دفعات قصيرة لا يقبلها أي مقاول من الباطن.

الأسلوب نيكاراغوي بلا التفاف: قويّ، فلفلي، بمادة صريحة لا تطلب الرهافة الكوبية. وLaranja Reserva، المبنيّة حول غلاف برازيلي، تعبيرها الأبرز وأحد النجاحات البرازيلية القليلة خارج البرازيل.

وفي الأثناء صنعت La Zona لنفسها مكانة كمصنع قائم بذاته: تلفّ فيه علامات صغيرة عدّة، وهذه خير توصية يمكن أن تنالها ورشة.'
 WHERE `name` = 'Espinosa' AND SHA1(TRIM(`history`)) = 'b8c9006f41a59b5497411889a49e8dae3b9a6855';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Espinosa' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'b8c9006f41a59b5497411889a49e8dae3b9a6855';
-- brands|Esteban Carreras|history|ar — أسماء العلامة والأشخاص لاتينية
UPDATE `brands` SET `history_ar` = 'Esteban Carreras اسمٌ لا يعرف أحد حقًّا من يعنيه، وصحافة المهنة من الأمانة بحيث تقول ذلك: يُقال إنّ العلامة أُطلقت في التسعينيات على يد لفّاف كوبي بقي مجهولًا، وإنّ الاسم جاء من مهرّب ساعد كوبيين على الفرار بعد الثورة — أو، بحسب ما روى المالك لتاجر تجزئة سنة 2024، من حكاية بذور كوروخو أُخرجت من الجزيرة. ينسب هذا الأطلس هذه الروايات إلى رواتها ولا يحتفظ بأيّ منها تاريخَ تأسيس.

الثابت يبدأ في مطلع الألفية أو منتصف عقدها الأوّل: Craig Cunningham، رجل أعمال أمريكي، يملك الدار ويديرها منذ ذلك الحين، وأقام في إستيلي مصنعه الخاص، Tabacalera Carreras، حيث يُزرع كلّ شيء أو يُشترى ويُمزج ويُلفّ. مقرّ الدار في كاليفورنيا وسوقها في الولايات المتحدة؛ وفي 2024، في معرض Inter-tabac في دورتموند، أعلنت توزيعها العالمي مع Kopp Tobaccos. ويلفّ المصنع أيضًا لعلامات أخرى لا يسمّيها.

يضمّ الكتالوج ثلاثة عشر خطًّا — Cashmere وDictator''s Hand وHellcat وChupacabra وUnforsaken وBlack Cross وBrown Cross وBloodline وMr Brownstone — وتقول الدار إنّ معظمها سيجارات نيكاراغوية خالصة. وChupacabra، بنسخه الثلاث، هو ما صنع سمعتها.'
 WHERE `name` = 'Esteban Carreras' AND SHA1(TRIM(`history`)) = '2381510a3b2b0796ec2a5df993c871745985176e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Esteban Carreras' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '2381510a3b2b0796ec2a5df993c871745985176e';
-- brands|Ezra Zion|history|ar — أسماء علامة وأشخاص لاتينية
UPDATE `brands` SET `history_ar` = 'Ezra Zion دارٌ تكساسية أسّسها هاويان، Chris Kelly وKyle Hoover، بدآ في تموز/يوليو 2012 بخطّين — Honor Series Reagan وInception التي أُعيدت تسميتها منذ ذلك الحين Jamais Vu — ثم Tantrum. كانت المزجات الثلاث الأولى سيجارات نيكاراغوية خالصة، وصنعها نيكاراغوي بالتبنّي: Noel Rojas، المزّاج الكوبي في إستيلي الذي يحمل هذا الأطلس بطاقته، وكان آنذاك في ورشته Aromas de Jalapa. لذلك يصنّفها هذا الأطلس في نيكاراغوا حيث تُلفّ سيجاراتها، لا في تكساس حيث تُتصوَّر.

تبيع الدار بسلاسل صغيرة، بأسماء هي جُمل — All My EX''s وFHK Truth — وبطريقةٍ تروي كلّ سيجار قصّةً. إنّه نموذج نشرٍ أقرب منه إلى نموذج صنع، وقد وجد جمهوره.

وفي أيلول/سبتمبر 2018 باعها Fred Rewey شركة Nomad Cigar Company التي يحمل هذا الأطلس بطاقتها: فـEzra Zion تملك إذن علامتين من هذا الأطلس، وNomad أيضًا تمرّ بيدي Rojas. واشترت كذلك Cigar Federation، منتدى هواة — دارٌ تملك المكان الذي يُتحدَّث فيه عنها.'
 WHERE `name` = 'Ezra Zion' AND SHA1(TRIM(`history`)) = '8cba7531ea3e44b290422b4a479033919d4f8d85';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ezra Zion' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '8cba7531ea3e44b290422b4a479033919d4f8d85';
-- brands|Fable Cigars|history|ar — أسماء علامة وأشخاص لاتينية
UPDATE `brands` SET `history_ar` = 'Fable دارٌ من 2016، أسّسها Sean Kremenetski وMitul Shah، وهو تاجر تجزئة، وقصّتها تتّسع لها كسوفٌ واحد: غابت عن السوق نحو نصف الوقت منذ ولادتها، وعادت في تشرين الأوّل/أكتوبر 2025.

خطّها الوحيد، Fourth Prime، يروي الرقم 7 — العدد الأوّلي الرابع — وتشرح الدار أنّ قياساتها تحمل اسمه وأنّ مثلّث شعارها مصنوع من سبعة خطوط. خرجت السيجارات الأولى من Fábrica de Tabacos Nica Sueño، ورشة RoMa Craft في إستيلي التي يحمل هذا الأطلس بطاقتها. وعند العودة انتقل الإنتاج إلى Córdoba & Morales، في إستيلي أيضًا، مصنعٌ يسمّيه هذا الأطلس هنا ولم يصفه بعد. وتُعطى المزجة على أنّها نفسها: غلاف برودليف من بنسلفانيا، ورقة رابطة هابانو ليخيرو إكوادورية، حشوة دومينيكية ونيكاراغوية.

ما تغيّر يُعدّ: سبع فيتولات قبل الكسوف، وأربع عند العودة؛ علب الستّ والخمسين صارت علب الواحد والعشرين؛ والأسعار ارتفعت. دارٌ تعود بالوصفة نفسها ومصنع آخر — هذه بالضبط الحالة التي صُنعت قاعدة الأطلس لكتابتها: البلد هو حيث يُلفّ السيجار اليوم، والمصنع يُسمّى.'
 WHERE `name` = 'Fable Cigars' AND SHA1(TRIM(`history`)) = '676adaca0366de15e06f7b42c3d37eba651c84ab';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fable Cigars' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '676adaca0366de15e06f7b42c3d37eba651c84ab';
-- brands|Fábrica de Tabaco Estrela|history|ar — أسماء أشخاص لاتينية
UPDATE `brands` SET `history_ar` = 'كان للأزور صناعة تبغ في القرن التاسع عشر — افتتح José Bensaúde مصنع Fábrica de Tabaco Micaelense سنة 1866 — وEstrela هي المصنع الثاني في بونتا ديلغادا، أسّسه سنة 1882 José Medeiros Cogumbreiro، في أبرشية ساو جوزيه. وهي ملك Empresa Madeirense de Tabacos، EMT، وتصنع ما تصنعه مصانع الأطلسي: السجائر والسيجاريلو، بالكمّيات.

السيجار هناك تكملةٌ صغيرة مفصولة، وهو ما يستحقّ البطاقة: ورشةٌ تلفّ فيها عاملات يدويًّا بالكامل، على حشوات من البرازيل وكوبا وجمهورية الدومينيكان، تحت غلاف أمريكي أو إندونيسي. يمضي السيجار يومين في القالب، ويجفّ في حرارة منخفضة، ثم يتلقّى غلافه — Meia Coroa وCoroa وRobusto Estrela، في علب خشبية. يصنّف هذا الأطلس الدار في الأزور لأنّ اليد تعمل هناك؛ والتبغ يأتي من مكان آخر، كما في جزر الكناري المجاورة.

وفي نيسان/أبريل 2025 أسّست EMT وLuciano Cigars، التي يحمل هذا الأطلس بطاقتها، Constella Group التي تصير الشركة الأمّ لـLuciano: مصنعُ سجائر أزوري صار شريكًا لمصنع سيجار في إستيلي. وبهذه الصلة، بقدر ورشتها، تدخل Estrela هنا.'
 WHERE `name` = 'Fábrica de Tabaco Estrela' AND SHA1(TRIM(`history`)) = '09219a0d9759ba71337f37b4817e148a52e63d13';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fábrica de Tabaco Estrela' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '09219a0d9759ba71337f37b4817e148a52e63d13';
-- brands|Ferio Tego|history|ar — contresens défendre، أسماء لاتينية
UPDATE `brands` SET `history_ar` = 'وُلدت Ferio Tego من نهاية دارٍ أخرى. ففي 2020 أغلقت Altria قسم السيجار في Nat Sherman بعد تسعين عامًا — ذلك العنوان في الجادة الخامسة الذي ما زال هذا الأطلس يضمّه. عندئذٍ اشترى اثنان من قدامى الدار العلامات وحقوقها الفكرية من المجموعة: Michael Herklots، وكان نائب رئيسها، وBrendon Scott. وظهرت Ferio Tego في مطلع 2021.

والاسم مأخوذ من شعار عائلة Herklots، ويُترجم بـ«اضرب ودافع».

وما اشترياه كان مزائج يلفّها آخرون سلفًا — فأبقيا على الأيدي نفسها. فقد ألّفت عائلة Quesada مزيج Metropolitan في منتصف التسعينيات لـNat Sherman، وما زال يخرج من مصنعها Tabacos de Exportación في ليسي. أمّا مجموعة Timeless فمقسومة نصفين: Prestige وSterling عند Quesada، وPanamericana وSupreme عند Plasencia في إستيلي.

وQuesada وPlasencia كلتاهما في هذا الأطلس، وNat Sherman كذلك. وهذه البطاقة دومينيكية لأنّ حصّة Quesada هي الغالبة — Metropolitan ونصف Timeless — غير أنّ الأطلس يكتب القسمة بدل أن يكتمها.'
 WHERE `name` = 'Ferio Tego' AND SHA1(TRIM(`history`)) = '224b2a9757862cd5ee0a9b36fed635da8d35c5a1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ferio Tego' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '224b2a9757862cd5ee0a9b36fed635da8d35c5a1';
-- brands|Finca Tabaquera El Sitio|history|ar — اسم شخص وعلامة لاتينيان
UPDATE `brands` SET `history_ar` = 'El Sitio ليست علامة في المقام الأول، بل حقل. تزرع المزرعة، في لا لومادا ببريينيا ألتا، ما يزيد على خمسة وعشرين ألف متر مربّع، منها خمسة آلاف تحت أغطية للغلاف وحده — أي الزراعة تحت الستائر، وهي ممارسة لا تعرفها أيّ مزرعة أخرى في الأرخبيل.

Antonio González، الذي يديرها، يزرع التبغ منذ كان في الحادية عشرة. والموقف هنا هو الأشدّ تطرّفًا في الكناري: الورق كلّه من لا بالما، بما فيه الغلاف، في حين تُلَفّ معظم ما يُسمّى بالسيجار الكناري بتبغ أمريكي مستورد. وتنتقي المزرعة بذورًا محلّية موروثة عن مزارع القرن الثامن عشر.

افتُتحت عام 2005، ويمكن زيارتها من الاثنين إلى الجمعة. وفيها تُتابَع النبتة من الحقل إلى طاولة اللفّ، مرورًا بالمجفّف والتخمير — وهو تسلسل لا يعرضه أيّ مكان آخر في الأرخبيل دفعةً واحدة.'
 WHERE `name` = 'Finca Tabaquera El Sitio' AND SHA1(TRIM(`history`)) = 'bf7f8a086372f569c80d690ad6fe4180267dca63';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Finca Tabaquera El Sitio' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'bf7f8a086372f569c80d690ad6fe4180267dca63';
-- brands|Firecracker|history|ar — Red Anchor seulement، pas deux
UPDATE `brands` SET `history_ar` = 'Firecracker علامة سيجار قصير بمقاس 3 1/2 x 50، رأسه ممتد على هيئة فتيل، وُلدت على يد David Garofalo، مالك سلسلة متاجر Two Guys Smoke Shop في ولاية نيوهامبشاير، وشركة التوزيع United Cigars. وتؤرّخ الدار إطلاقها بعام 2006؛ أما Cigar Coop فتضع بداية السلسلة في عام 2007، مع أول Firecracker لفّته My Father Cigars لمتاجر Two Guys بمناسبة يوم الاستقلال. ثم أصبحت السلسلة إصدارًا سنويًا يُسنَد إلى مصنّعين مختلفين وتوزّعه United Cigars في أنحاء البلاد، بحسب Cigar Coop.

لا تسمّي الدار مصنع سيجار Firecracker ضمن الإنتاج المعتاد؛ وتقول إنه يُصنع يدويًا في جمهورية الدومينيكان. وتنسب Cigar Coop إنتاجه إلى Tabacalera Magia Cubana، المملوكة لـJosé Dominguez، وتنسبه Cigars Daily، شأنها شأن Atlantic Cigar، إلى سانتياغو. وفي أكتوبر 2026، تعرض الدار ثلاثة خطوط هي Sun Grown وMaduro وConnecticut، وقد عُرض الأخير في معرض TPE 2024 بوصفه خطًا دائمًا، بحسب Cigars Daily؛ ويضم فهرسها أيضًا La Gianna وRed Anchor، وتذكّر بالأخير مرساة حمراء صغيرة على حلقة Maduro.

أما إصدار Independence Firecracker السنوي، بمناسبة الذكرى الـ250 للولايات المتحدة، فيُصنع في 2026 لدى Arnold André Dominicana لا في Magia Cubana: غلاف Habano مكسيكي، ورباط دومينيكي، وligero دومينيكي ونيكاراغوي، في tins من اثني عشر، بحسب Cigar Coop. وتقول Premium Cigar Association إنه قيد الشحن إلى تجار التجزئة في 24 يونيو 2026.'
 WHERE `name` = 'Firecracker' AND SHA1(TRIM(`history`)) = '9c9423c34c71d7e8817ca904fc7d2934ff633c81';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Firecracker' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '9c9423c34c71d7e8817ca904fc7d2934ff633c81';
-- brands|Flavoroute|history|ar — liant traduit رباط
UPDATE `brands` SET `history_ar` = 'Flavoroute علامة تابعة لشركة Flavoroute GmbH، ومقرّها في شفايغ (Schwaig) قرب نورنبرغ. ويقول مديرا الشركة Oliver Breiter وOliver Pickl إنهما لم يجدا، أيام دراستهما، صنفًا إقليميًا مميّزًا من التبغ في فرانكونيا، وإنهما قرّرا عام 2015 تأسيس الشركة. ومنتجهما الأول، Wildkirsch #1، وُلد من تعاون مع مقطرة Ziegler في فرويدنبرغ (Freudenberg) بماينفرانكن: سيجار صُقل بالكرز البرّي، بحسب الدار.

وتقول الدار إن سيجارها يُلفّ في قلب ألمانيا، وإن Wildkirsch #1 يُلفّ يدويًا ويُصنع حصريًا لها وبالكامل في ألمانيا؛ ولا تذكر اسم مصنعها. وتوصف حشوته بأنها mediumfiller، وهي تمزج تبغ Burley وDark Air Cured القادم في الغالب من جمهورية الدومينيكان بتبغ فرانكوني، تحت غلاف داخلي من جاوة وغلاف Connecticut Shade؛ ويبلغ مقاس هذا الـtorpedo نحو 156 mm × 22 mm. وفي سبتمبر 2026، لا يزال متجر الدار يعرضه.

ويصنّف Cigarworld.de ضمن جمهورية الدومينيكان اثنين من سيجار longfiller لدى Flavoroute يوصفان بأنهما مصنوعان يدويًا بالكامل، بغلاف Connecticut ورباط من جمهورية الدومينيكان: Tubo مدرج في الكتالوج منذ 23 أغسطس 2016، بحشوة من هندوراس، وToro مدرج في الكتالوج منذ 30 نوفمبر 2020. وفي سبتمبر 2026، يعرضهما غير متاحين؛ ولا تذكر الدار أين لُفّا.'
 WHERE `name` = 'Flavoroute' AND SHA1(TRIM(`history`)) = 'ca9b842f768816862b54c7f5547967e8e9bee005';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Flavoroute' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'ca9b842f768816862b54c7f5547967e8e9bee005';
-- brands|Flor de Selva|history|ar — أسماء لاتينية، أكبر محذوف
UPDATE `brands` SET `history_ar` = 'Maya Selva هندوراسية، مهندسة بالتكوين، وأسّست دارها انطلاقاً من باريس — ترتيب غير مألوف في مهنة نادراً ما ينطلق فيها المرء من أوروبا لينتج في أميركا الوسطى. بُنيت Flor de Selva منذ البداية للسوق الفرنسية والأوروبية، بطابع صُمِّم لذائقة اعتادت الهافانا: متوسط، خشبي، بلا ذلك الفيض الحلو الذي كانت السوق الأميركية تفضّله آنذاك.

تقع الدار في دانلي، بوادي خاماستران، إحدى منطقتَي التبغ الكبريين في هندوراس. تعمل هناك بكميات محسوبة وتؤكد ثباتاً نادراً في الوصفة — إذ تتغيّر الخلطات قليلاً من سنة إلى أخرى، وهو ما يتطلّب، في منتج زراعي، عملاً دائماً على الانتقاء.

وهي أيضاً من البيوت القليلة جداً التي أسّستها وتديرها امرأة، في مهنة يديرها الرجال حصراً تقريباً. يستحق الأمر الذكر دون أن يصير حجّة: فالعلامة فرضت نفسها بخلطاتها.'
 WHERE `name` = 'Flor de Selva' AND SHA1(TRIM(`history`)) = '182a209bf57789bbeaceffa720b731993c6f6f98';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Flor de Selva' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '182a209bf57789bbeaceffa720b731993c6f6f98';
-- brands|Flor del Sol|history|ar — المدن تُترجم
UPDATE `brands` SET `history_ar` = 'تنتمي Flor del Sol، التي يعني اسمها «زهرة الشمس»، إلى المجموعة الدنماركية Scandinavian Tobacco Group (STG)، التي تملك أيضاً Macanudo وDon Tomas. وهي سيجار (puro) هندوراسي من فئة medium filler، ملفوف بالكامل يدوياً، بحسب Cigarworld؛ ولم يذكر أي مصدر تم العثور عليه، بما في ذلك موقع المجموعة نفسه، اسم المصنع الهندوراسي الذي يلفّه. وتملك المجموعة منذ عام 2009 مصانع في دانلي بهندوراس وإستيلي بنيكاراغوا، بحسب Scandinavian Tobacco Group؛ ولا يربط أي مصدر Flor del Sol بأي منهما.

طُرح السيجار للبيع في الولايات المتحدة منذ يناير 2014، حين وصفته مدونة تذوق بأنه ملفوف يدوياً من فئة medium filler؛ وأضافته Cigarworld.de إلى فهرسها في 28 مايو 2018. ولا يضم الفهرس الحالي سوى مقاس واحد، وهو Robusto متوسط القوة، بحسب Cigarworld.'
 WHERE `name` = 'Flor del Sol' AND SHA1(TRIM(`history`)) = '8fdac7d2f6cd8ad48063321534ade26679525ed2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Flor del Sol' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '8fdac7d2f6cd8ad48063321534ade26679525ed2';
-- brands|Fonseca Nicaraguayen|history|ar — أسماء علامة وعائلات لاتينية
UPDATE `brands` SET `history_ar` = 'يحمل Fonseca الكوبي ونظيره غير الكوبي الاسم نفسه دون أن يجمعهما مالك — غير أنّ هذا الأخير غيّر عائلته وبلده.

فقد صنعته عائلة Quesada خمسة وأربعين عامًا في مصنعها MATASA بسانتياغو دي لوس كاباييروس في جمهورية الدومينيكان. ويضمّ هذا الأطلس دار Quesada باسمها.

وفي ديسمبر 2019 تسلّمته عائلة García، فصار يُلفّ لدى My Father Cigars في إستيلي بنيكاراغوا — وهي الدار التي يضمّها هذا الأطلس باسم My Father.'
 WHERE `name` = 'Fonseca Nicaraguayen' AND SHA1(TRIM(`history`)) = '1b0fa9cc03264f41586f9175ab8214b090b4beef';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fonseca Nicaraguayen' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '1b0fa9cc03264f41586f9175ab8214b090b4beef';
-- brands|Forged Cigar Company|history|ar — علامات لاتينية، نجمتان محذوفتان
UPDATE `brands` SET `history_ar` = 'ليست مصنعًا، وتقول البطاقة ذلك منذ البداية: Forged شركة توزيع، أنشأتها Scandinavian Tobacco Group في 13 يناير 2021 بفريق مبيعات خاص بها، وبدأت العمل في الأول من فبراير.

وتسلّمت عند نشأتها Partagás وLa Gloria Cubana وBolívar Cofradia وDiesel وChillin'' Moose، بينما احتفظت General Cigar بـMacanudo وCAO وCohiba وPunch وHoyo de Monterrey.

وفي فبراير 2026 أعادت المجموعة توزيع الأوراق: انتقلت Cohiba وPunch وHavana Honeys إلى Forged، وPartagás وRoom101 إلى General. والحركة نفسها شطبت Sancho Panza وLos Statos Deluxe من قائمة الأسعار — ولهذا لا يضمّ هذا الأطلس Sancho Panza غير كوبي.'
 WHERE `name` = 'Forged Cigar Company' AND SHA1(TRIM(`history`)) = 'd3becb0d40127088613e590099916e9677687a49';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Forged Cigar Company' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'd3becb0d40127088613e590099916e9677687a49';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fortis Cigars' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '3abd30f5575baa3c2c714049927693c01a8d7b18';
-- brands|Fratello|history|ar — أسماء وعلامات لاتينية
UPDATE `brands` SET `history_ar` = 'كان Omar de Frias مهندسًا في NASA. وُلد في جمهورية الدومينيكان ونشأ في الولايات المتحدة، ولعب كرة السلة الجامعية ثم نال ماجستيرًا في الهندسة، وكان يعمل في برامج فضائية حين قرّر إنشاء علامة سيجار.

سنتان من التحضير، ثم ظهرت Fratello في معرض IPCPR عام 2013. والاسم يعني «أخ» بالإيطالية.

ويُلَفّ كلّ شيء في Fábrica de Tabacos Joya de Nicaragua بإستيلي — أقدم مصانع البلاد، ويضمّه هذا الأطلس، وهو نفسه الذي يلفّ لـDunbarton ولـRoom101.

ويقوم الكتالوج على أربع سلاسل: Bianco وOro وBoxer وNavetta. وNavetta تعني «المكوك» بالإيطالية، وهو على الأرجح ليس محض مصادفة عند مهندس فضاء سابق.'
 WHERE `name` = 'Fratello' AND SHA1(TRIM(`history`)) = '6762001bce64ced2da8e3aff2a5b5e2b2650b83d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fratello' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '6762001bce64ced2da8e3aff2a5b5e2b2650b83d';
-- brands|Freud Cigar Co.|history|ar — أسماء لاتينية، juge: يحاكم
UPDATE `brands` SET `history_ar` = 'Freud دارٌ من 2022، وقد نعمت بخمسة شهور من الهدوء. أطلقها Luis Torres وDavid Stadnyk في نيويورك في الربيع، شركةً تابعة لـAgape Lifestyle Inc.، بسيجار أوّل اسمه SuperEgo — الأنا العليا، الجزء من نظرية Freud الذي يحاكم. يُلفّ في Tabacalera William Ventura بتامبوريل التي يحمل هذا الأطلس بطاقتها. وفي 26 أيلول/سبتمبر من السنة نفسها احترق المصنع.

فلهذه البطاقة إذن سببان. الأوّل عادي: علامة تُصوّرت في نيويورك ولُفّت في جمهورية الدومينيكان، وهذا الأطلس يسمّي المصنع. والثاني في التاريخ: Freud أصغرُ الدور التي مسّها حريق 2022، وخطّها الثاني، AlterEgo، صدر سنة 2023، أثناء إعادة البناء، من الورش الفرعية وEl Maestro.

تتبع الأسماء النظرية — SuperEgo وAlterEgo — ويُنتظر الـEgo. ولا تقول الدار بعدُ إن كان سيأتي.'
 WHERE `name` = 'Freud Cigar Co.' AND SHA1(TRIM(`history`)) = '892276737af4fd366633f4836ac105dba11acb26';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Freud Cigar Co.' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '892276737af4fd366633f4836ac105dba11acb26';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Gellis Family Cigars' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'a3db188a96fa30edccfcc319c9b0dc6a23c9994b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'German Engineered Cigars' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'ef329f225ccb801fe9dcf7a7edee63de5b2ca5d8';
-- brands|Gispert|history|ar — أسماء لاتينية، قياسات ناقصة
UPDATE `brands` SET `history_ar` = 'هذه الحالة تختلف عن سواها: فهنا كوبا هي التي تخلّت عن الاسم.

أنشأ Simón Veja Peláez علامة Gispert عام 1940 في بينار دل ريو، من تبغ Vuelta Arriba، وقد اشتُهرت بسيجارها الخفيف — وهو أمر نادر في التشكيلة الكوبية. وبعد 1959 أنتجتها Cubatabaco ثم Habanos S.A. في مصنع Carlos Balio، غير أنّ المبيعات تراجعت وهبطت التشكيلة من أحد عشر قياسًا إلى بضعة قياسات. وأوقفتها Habanos عام 2005.

أمّا Altadis فكانت قد أعادت إطلاق العلامة منذ 2003 في هندوراس. وهي تخرج اليوم من مصنع La Flor de Copán، الذي يضمّه هذا الأطلس أصلًا، في نسختين: غلاف إكوادوري من بذرة Connecticut، أو غلاف maduro من San Andrés في المكسيك.'
 WHERE `name` = 'Gispert' AND SHA1(TRIM(`history`)) = '582da14e208aa4e922451ed3e2c12520e91bd759';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Gispert' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '582da14e208aa4e922451ed3e2c12520e91bd759';
-- brands|God of Fire|history|ar — liant: رباط لا غلاف داخلي
UPDATE `brands` SET `history_ar` = 'God of Fire هي علامة السيجار التابعة لـKeith K. Park، مؤسس Prometheus ورئيسها، وهي دار للولّاعات ومنافض السجائر وصناديق الترطيب (هيوميدور) كانت تحلم بخط سيجار خاص بها، بحسب الدار. وُلد الاسم في ربيع 2002، أثناء تصوير الفيلم الوثائقي The Fuente Family: An American Dream في جمهورية الدومينيكان، وقد كان Park منتجه: كانوا يلقّبونه هناك God of Fire، في إشارة إلى Prometheus، واقترح عليه Carlito Fuente أن يجعله اسم علامة. وسنحت الفرصة في ربيع 2003، خلال عشاء جمع Park وCarlito Fuente في جمهورية الدومينيكان؛ وظهرت أولى السيجار في 2004، مع صناديق ترطيب من Prometheus بإصدار محدود.

تُصنع السيجار يدويًا في Tabacalera A. Fuente y Cia.، على رباط وحشوة دومينيكيَّين، ويتغيّر الغلاف تبعًا للخلطة، كما تقول الدار؛ والمصنع ملك لعائلة Fuente التي افتتحته في سانتياغو دي لوس كاباييروس في سبتمبر 1980، بحسب Wikipedia؛ أما العلامة فهي لـPark. وتحمل الحلقة الثانية سنة الصنع.

وفي سبتمبر 2026، تضم الدار ست خلطات: KKP Never Back Down وKKP Special Reserve وSerie B وSerie Aniversario وBy Don Carlos وBy Carlito. وقد وُلدت Special Reserve عام 2022 بمناسبة الذكرى الثلاثين لـPrometheus، وNever Back Down عام 2024 بمناسبة الذكرى العشرين للعلامة؛ وتعلن الدار لعام 2026 عن Diademas Selection لكل منهما، قبل الذكرى الخامسة والثلاثين لـPrometheus في 2027.'
 WHERE `name` = 'God of Fire' AND SHA1(TRIM(`history`)) = 'afa5fe9bc6934d72c139833968bf5ff47562971b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'God of Fire' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'afa5fe9bc6934d72c139833968bf5ff47562971b';
-- brands|Golden Djawa|history|ar — اسم العلامة بالحروف اللاتينية
UPDATE `brands` SET `history_ar` = 'Golden Djawa سيجارُ مزارعٍ حكومي. قرّرت PTPN X، شركة المزارع العامّة التي تزرع في جمبر تبغ Besuki Na-Oogst — ورقة جاوة الشرقية التي يشتريها العالم للأغلفة — أن تلفّ جزءًا من محصولها بدلًا من بيعه كلّه خامًا: بدأ الإنتاج في كانون الأوّل/ديسمبر 2019 وأُطلقت العلامة سنة 2020. وعُهد باللفّ إلى تعاونية منتجين، Koperasi Produsen Kertanegara، تعدّها الصحافة الإندونيسية بين مصانع جمبر الأربعة ذات الحجم الوطني.

يُلفّ السيجار يدويًّا ويُوجَّه للتصدير، إلى أوروبا أوّلًا؛ وفي تشرين الثاني/نوفمبر 2022 قُدّم لوفود مجموعة العشرين في بالي، في قرية للمشاريع الصغيرة، منتجًا إندونيسيًّا فاخرًا قادرًا على الصمود أمام أمريكا اللاتينية — الكلمات كلمات الدار، والبطاقة تتركها لها. إنّها طريقة عمل التقاها هذا الأطلس في أماكن أخرى، في كوبا أو الصين: التبغ للدولة، والسيجار أيضًا.

تلفّ جمبر للآخرين، ومنذ زمن طويل: لـVilliger وBurger Söhne مصانع فيها تقولها بطاقاتهما. وGolden Djawa وBIN هما الدارتان من المدينة اللتان لهما بطاقة باسميهما.'
 WHERE `name` = 'Golden Djawa' AND SHA1(TRIM(`history`)) = '95c80c76e02f785f4bbab55133c72a4806d4aa6d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Golden Djawa' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '95c80c76e02f785f4bbab55133c72a4806d4aa6d';
-- brands|Gran Habano|history|ar — أسماء لاتينية، دانلي
UPDATE `brands` SET `history_ar` = 'Gran Habano دارٌ كولومبية بالعائلة وهندوراسية بالمصنع، ويصنّفها هذا الأطلس بالمصنع. تزرع عائلة Rico التبغ الداكن في كولومبيا منذ 1920، حين بدأ جدّ Guillermo Rico؛ وفي 1946 تولّى أبوه الحقول. أمّا Guillermo فرحل إلى ميامي سنة 1995، لحظةَ اشتعال السيجار الأمريكي — ولم يبقَ هناك تاجرًا.

في 1998 فتح مصنعًا في دانلي بهندوراس: G.R. Tabacaleras Unidas. وبعد خمس سنوات، في 2003، أطلق الأب والابن — وGeorge Rico هو من يديرها اليوم — علامة Gran Habano. يسع الكتالوج الأوّل ثلاثة أرقام: Connecticut No. 1 الخفيف، وHabano No. 3 المتوسّط، وCorojo No. 5 الفلفليّ القويّ. وما زالت هناك، مع ما جاء بعدها: 3 Siglos، وGran Reserva، و20th Aniversario، وBlue in Green.

وما يميّز الدار عن جيرانها في دانلي هو الأرض: تزرع G.R. Tabacaleras Unidas معظم ورقتها بنفسها، في مزارع ملاصقة، بدل أن تشتريها. وقليلٌ من الدور بهذا الحجم تمسك الطرفين، وهذه هي النقطة التي تحتفظ بها البطاقة. أمّا الشركة فهي في ميامي — المدينة التي يُباع منها السيجار الهندوراسي منذ ثلاثين سنة.

في أكتوبر 2026 تعرض صفحة تاجر التجزئة الألماني Cigarworld تحت اسم G.H. سيجارات من Guillermo Rico، تُلَفّ في دانلي بهندوراس وتُباع في أوروبا: فالقانون الأوروبي يمنع هناك، كما يكتب التاجر، التمسك بمؤشر جغرافي لمنتج لا يأتي من ذلك المكان، ويوحي الاسم الأصلي بهافانا. وتستعيد خطوط G.H.، Connecticut No. 1 وCriollo No. 3 وCorojo No. 5، الأرقام الثلاثة الخاصة بـ Gran Habano، حيث يُسمّى No. 3 باسم Habano. ويذكر تاجر التجزئة نفسه Gran Honduras وGuillermo Rico بوصفهما اسمين آخرين لن تجدهما، كما يقول، في المتاجر الأمريكية.'
 WHERE `name` = 'Gran Habano' AND SHA1(TRIM(`history`)) = 'aae6a610346cf2098cf19d116ac06916452bd6c3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Gran Habano' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'aae6a610346cf2098cf19d116ac06916452bd6c3';
-- brands|Graycliff|history|ar — أسماء لاتينية، bétune ليس بيتون
UPDATE `brands` SET `history_ar` = 'Graycliff أوّلًا فندقٌ ومطعم في ناساو، على تلّة تراقب دخول السفن إلى الميناء، وكان صاحبه Enrico Garzaroli يبيع فيه الهافانا منذ عشرين سنة حين أراد سيجاراته الخاصة. استقدم Avelino Lara — الرئيس السابق لـEl Laguito، رجل Cohiba — الذي رتّب خروجه من كوبا سنة 1993، سائحًا أوّلًا، ثم بإذن بالبقاء. وركّبا معًا مزجةً من أتبغة مستوردة: البرازيل ونيكاراغوا وهندوراس، وأحيانًا الإكوادور والكاميرون، تحت غلاف إندونيسي كان Lara يصقله بـ«bétune»، نقيعٍ من الكحول والتوابل لا يكشف Garzaroli منه سوى مكوّن واحد، نبيذ سوتيرن.

بدأ الإنتاج في كانون الثاني/يناير 1997 بلفّاف واحد يجلس في مدخل المطعم — تقول الدار ذلك، ووصفت صحافة المهنة طاولة اللفّ التي يراها الزبائن عند الدخول. وذهبت السيجارات إلى الولايات المتحدة في تشرين الأوّل/أكتوبر 1997. وكانت الورشة، على خمسين خطوة من المطعم، مأهولةً بلفّافين كوبيين متقاعدين استقدمهم Garzaroli، بمتوسّط عمر أربع وستين سنة، أربعة منهم قرب الثمانين؛ وأعلن ستمئة وخمسين ألف سيجار مُلفوف سنة 1999. اعتزل Lara سنة 2000؛ ومنذئذٍ يمزج Enrico وابنه Paolo، مع ستة عشر لفّافًا.

لا تزرع البهاما شيئًا: إنّها بلدُ لفّ، ويفتحه هذا الأطلس لهذه الدار وحدها، كما فتح سويسرا. وهنا أُعيد إطلاق La Palina، التي يحمل هذا الأطلس بطاقتها، سنة 2010 قبل أن تنتقل إلى مكان آخر.'
 WHERE `name` = 'Graycliff' AND SHA1(TRIM(`history`)) = '79fdb310bea9b8cac49ce9f513467fc4a84b2a24';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Graycliff' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '79fdb310bea9b8cac49ce9f513467fc4a84b2a24';
-- brands|Great Wall Cigars|history|ar — أسماء علامة وشخص لاتينية
UPDATE `brands` SET `history_ar` = 'Great Wall — 長城، السور العظيم — علامةُ السيجار لاحتكار الدولة الصيني، تُلفّ في شيفانغ، على بُعد ساعتين شمال تشنغدو، في سيتشوان. وُلد المصنع سنة 1918 باسم Yichuan Industry Society، قبل أيّ مصنع سيجار آخر في البلاد بحسب صحافة المهنة، في مدينة تزرع التبغ منذ أربعة قرون. وفي الستينيات لفّ لـMao Zedong سيجارًا وافق على مزجته ثم طُرح في السوق: الـ132، المُلفوف يدويًّا والمقطوع مسبقًا، ما زال الاسم الذي يعرفه كلّ هاوٍ صيني، ولفّافات فريق 132 هنّ قدامى الدار، في صور على الجدران.

الموقع الحالي، المكتمل سنة 2007، يمتدّ على مئتي ألف متر مربّع ويصنع في الغالب سيجارات آلية — خمسمئة وستين مليونًا في السنة وقت التحقيق، مقابل مئة وستة وعشرين مليونًا سنة 2003. لا يحمل هذا الأطلس تلك. بل يحمل مبنى السيجار اليدوي، المنفصل في الموقع: مليون ونصف مليون سيجار في السنة، وقرابة مئة لفّافة تشرف عليهنّ ثلاث معلّمات، وأربعمئة ألف سيجار في التعتيق، وبذرة كوبية أُدخلت في مطلع الألفية، وتجارب في جزيرة هاينان، ومشتريات أوراق من جمهورية الدومينيكان والمكسيك وإندونيسيا، وشراكات تقنية مع Altadis وAgio — تأتي لفّافة دومينيكية لتدريب الفرق.

كانت السوق داخلية. وها هي تنفتح: بعد ثلاثة اتفاقات توزيع سنة 2024، وقّعت China Tobacco International (HK) في 23 تموز/يوليو 2025، في المصنع نفسه، اتفاقًا عالميًّا حصريًّا خارج الصين القارية. يفتح هذا الأطلس الصين بلدًا منتجًا لهذه الدار، من دون تحديد منطقة ولا صنف: وصفت الصحافة المصنع، ولم تصف الحقول بعد.'
 WHERE `name` = 'Great Wall Cigars' AND SHA1(TRIM(`history`)) = 'c72d2350dbb422aa1d82f6c45c06f166780c880f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Great Wall Cigars' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'c72d2350dbb422aa1d82f6c45c06f166780c880f';
-- brands|Gurkha|history|ar — أسماء لاتينية، جمهورية الدومينيكان
UPDATE `brands` SET `history_ar` = 'ترجع Gurkha باسمها إلى عام 1887 في الهند البريطانية، وإلى سيجار يُقال إنّ جنود الغوركا الذين تحمل اسمهم كانوا يدخّنونه. تلك رواية الدار؛ ولا تثبتها أيّ مصادر مستقلّة، وينقلها هذا الأطلس من دون أن يتبنّاها.

أمّا الثابت فيبدأ في التسعينيات، حين أعاد Kaizad Hansotia إحياء الاسم وجعل منه علامة عُرفت بعلبها وإصداراتها وأسعارها المرتفعة.

وظلّت طويلًا بلا مصنع. فمنذ 2012 كانت تعمل مع American Caribbean Cigars في إستيلي باتفاق خمسيّ: مئة وخمسون ألف سيجار في السنة الأولى، وخمسة ملايين في 2016. وفي مايو 2017 اشترت المصنع — فكفّت عن كونها دارًا بلا جدران.

ولهذا صُنّفت هذه البطاقة نيكاراغوية. فـTabacalera Las Lavas في جمهورية الدومينيكان — مصنع عائلة Cuevas الذي يضمّه هذا الأطلس — تنتج لها أيضًا؛ غير أنّ الورشة التي تملكها هي في إستيلي، وهي التي تحدّدها.'
 WHERE `name` = 'Gurkha' AND SHA1(TRIM(`history`)) = 'a59d982eae2a8b83af20b0802ae39e88724a860b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Gurkha' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'a59d982eae2a8b83af20b0802ae39e88724a860b';
-- brands|H. Upmann Dominicain|history|ar — لا رومانا، أسماء لاتينية
UPDATE `brands` SET `history_ar` = 'بعد الثورة، انتقلت عائلة Menéndez، التي كانت تدير H. Upmann في هافانا، إلى جمهورية الدومينيكان. وهناك وُلد H. Upmann ثانٍ، دون صلة ملكية بالكوبي.

ويُلفّ في مصنع Tabacalera de García في لا رومانا، الذي أُسّس عام 1971 في أول منطقة حرة بالبلد. ويعمل فيه ما يزيد على ألفَي شخص، لإنتاج نحو أربعين مليون سيجار سنويًا، تُلفّ كلّها باليد. ومنه يخرج أيضًا Montecristo وRomeo y Julieta وDon Diego وHenry Clay الدومينيكيّون.'
 WHERE `name` = 'H. Upmann Dominicain' AND SHA1(TRIM(`history`)) = 'a7151b7073e05d58818dc0d0bd2cfdaecbc18540';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'H. Upmann Dominicain' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'a7151b7073e05d58818dc0d0bd2cfdaecbc18540';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'H.R.' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'd09bc4c6775348cdad7a6b6a74be1157ec1bd70a';
-- brands|Helvada|history|ar — سيجارات تعني سجائر
UPDATE `brands` SET `history_ar` = 'حدّد Daniel Schwizer وAndrea Moor لنفسيهما عام 2015 هدف أن يجعلا السيجار مهنتهما، بحسب موقعهما؛ وفيه تذكر Schwizer Trade GmbH في أكتوبر 2026 عنوانًا في Ammerswil بكانتون أرغاو (سويسرا). ويروي Daniel Schwizer على موقعه أنّ الـmaster blender Kurt Brandt نفّذ فكرتهما للعلامة Helvada، وأنّ جمعًا صغيرًا تذوّق سيجار العلامة للمرة الأولى في 23 مايو 2018. وتعرّف Cigarworld.de بـKurt Brandt بوصفه blender سبق أن ترك بصمته في Flor Real وIsthmus، بعد أن عمل طويلًا في كوستاريكا ثم في نيكاراغوا.

لا تُسمّي الدار مصنعها؛ وصفحاتها تذكر نيكاراغوا بلدًا للمنشأ ولا تقول كيف يُلَفّ السيجار. أما سيجارها 51، بمقاس Gran Robusto، فيحمل غلاف Habano maduro من الإكوادور فوق رباط من خالابا وحشوة من كونديغا بنيكاراغوا وligero دومينيكي، بحسب الدار. وتصنّف Cigarworld.de خط Helvada وDark Line على أنهما «totalmente a mano»، من نوع longfiller، وتصنّف Medio Filler على أنه «totalmente a mano» بحشوة ممزّقة؛ وتقول إنّ سيجار longfiller في خط Dark Line Hearth يُلَفّ في إستيلي. ويقرأ أحد قرّاء Cigarworld.de، في 16 أغسطس 2020، حلقة Hecho a mano في سيجار 51 على أنها حشوة مصنوعة آليًا تحت غلاف ملفوف يدويًا، من دون أن يكون متأكدًا من ذلك، وتعيد صفحة 51 لدى الدار نشر هذا النص، باسم «schwizertrade»، في 25 ديسمبر 2020.

بحلول سبتمبر 2026، يضمّ الكتالوج خط Helvada بمقاسات 51، و70 Gordo، و02 Salomones، و04 Salomones Oscuro، و91 Gigante، بحسب Fumar.ch، وDark Line، بحسب Zigarren-online.ch، وMedio Filler Medio Tiempo، وهي Short Robusto مدرجة في كتالوج Cigarworld.de منذ 24 مارس 2025.'
 WHERE `name` = 'Helvada' AND SHA1(TRIM(`history`)) = '5bc656c91267336cc745829a5f18b53b9aa6ff10';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Helvada' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '5bc656c91267336cc745829a5f18b53b9aa6ff10';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Hemmys' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '8b60e6b9015260e6bdc9d5625a2bd83ce41ac61a';
-- brands|Henry Clay|history|ar — أسماء لاتينية، صياغة الإسناد
UPDATE `brands` SET `history_ar` = 'تحمل العلامة اسم رجل الدولة الأمريكي Henry Clay. وُلدت في كوبا، ولا تبقى اليوم إلّا في نسختها غير الكوبية — ولذلك لا يضمّ هذا الأطلس Henry Clay هافانيًّا يقابلها، ولا يحتاج الاسم إلى لاحقة.

وتُلفّ بتكليف من Altadis U.S.A. في مصنع Tabacalera de García في لا رومانا، وهو المصنع نفسه الذي يخرج منه H. Upmann وMontecristo وRomeo y Julieta الدومينيكيّون.'
 WHERE `name` = 'Henry Clay' AND SHA1(TRIM(`history`)) = 'e04a207b76f6d6203fafb1a0907a53f12dd60e04';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Henry Clay' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'e04a207b76f6d6203fafb1a0907a53f12dd60e04';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Herr Lehmann' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '3c1d04536bf595f2c7ea2226baa03a7a6270a2c1';
-- brands|Hiram & Solomon|history|ar — أسماء أعلام بالأحرف اللاتينية
UPDATE `brands` SET `history_ar` = 'Hiram & Solomon علامةٌ كُتبت للماسونيين، بأيدي ماسونيين: Hiram Abiff، المهندس الأسطوري للهيكل، وسليمان، الملك الذي أمر ببنائه. أسّسها Fouad Kashouty وGeorge Dakrat سنة 2015، والخطوط تحمل أسماء درجات المحفل ومناصبه — Entered Apprentice وFellow Craft وMaster Mason وGrand Architect وShriner وVeiled Prophet وTraveling Man. الفكرة، كما تقول الدار، أن يجتمع الإخوة حول سيجار. لا تحكم البطاقة على الفكرة؛ بل تسجّل أنّها صمدت عشر سنين.

ما على هذا الأطلس إثباته هو مَن يلفّ. بدأت الدار في جمهورية الدومينيكان، ثم عهدت بقسط كبير من إنتاجها إلى Plasencia. وفي 2021 بدأ Fouad وRomy Kashouty التركيب مع Abe Flores، المزّاج الرئيسي في PDR Cigars في تامبوريل — Curamus في شباط/فبراير 2021، ثم Châbal وRevival وSublime Prince 32 في مطلع 2022. وفي حزيران/يونيو 2022، بعد أسبوعين من انتهاء اتفاق التنفيذ مع Blanco Cigars، أعلنت الدار أنّ محفظتها كلّها تنتقل إلى PDR. وقال Flores لصحافة المهنة إنّهم أرادوا العمل معه وحده من دون مصنع آخر.

بطاقة PDR في هذا الأطلس تسمّيها من قبل؛ وهذه تُغلق الحلقة. ولِـEntered Apprentice وVeiled Prophet خصوصيةٌ قلّما تستطيع بطاقة كتابتها: تبغ باراغوياني في المزجة.'
 WHERE `name` = 'Hiram & Solomon' AND SHA1(TRIM(`history`)) = 'f1457d87c624e183d9fa2cd962583b2db0a38d8f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Hiram & Solomon' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'f1457d87c624e183d9fa2cd962583b2db0a38d8f';
-- brands|Holt's Cigar Company|history|ar — سيجارة بدل سيجارًا
UPDATE `brands` SET `history_ar` = 'Holt''s Cigar Company بائع تجزئة للسيجار في فيلادلفيا، وتؤرخ الدار تأسيسها بعام 1898. ويؤرخ تاريخ الشركة الذي نشره موقع encyclopedia.com هذا التأسيس بعام 1911، ويذكر أن H.A. Tint & Sons، التي اشتراها Robert Levin عام 1980، تأسست عام 1898. واشترى Albert وJean Levin شركة Holt''s عام 1957؛ وتولى ابنهما Robert إدارتها عام 1974 وأطلق Ashton عام 1985، بحسب الدار. وبعد إدراجها في البورصة في نوفمبر 1997، أعلنت الشركة في نوفمبر 2000 عودتها إلى الملكية الخاصة: كان Robert Levin يملك حينذاك نحو 45% وFuente Investment Partnership نحو 29%، بحسب encyclopedia.com.

وفي أكتوبر 2026، تصف الدار نفسها بأنها تحت إدارة عائلة Levin منذ خمسينيات القرن العشرين: Sathya Levin، ابن Robert، هو رئيس مجلس الإدارة والمدير العام، وشقيقته Meera Levin نائبة الرئيس لشؤون المبيعات الدولية. ويعرض موقعها متجرين في فيلادلفيا هما Holt''s Center City وHolt''s Northeast (حافظة سيجار مرطّبة وبار وصالة)، والبيع عبر الإنترنت. ويُلَفّ كلٌّ من Ashton وHolt''s House Selection لدى Arturo Fuente، في Tabacalera A. Fuente y Cia في جمهورية الدومينيكان، بحسب الدار، التي تضيف أن العائلة أعادت إطلاق La Aroma de Cuba في مطلع سنوات 2000، وهي تُلَفّ في إستيلي لدى My Father Cigars S.A.

عشرون علامة من كتالوجها، منها All In! وArgyle وBabalu وCastano، تُباع في bundles أو في علب من عشرين سيجارًا. وتقول الدار إنها صُنعت يدويًا في جمهورية الدومينيكان، باستثناء Benchmade التي تُصنع يدويًا في إستيلي بنيكاراغوا (أما في Bella Cuba وAngry Elf فآراء موظفيها هي التي تقول ذلك)؛ وتتحدث عن مصانع بوتيك وعن لفّافين حرفيين، دون أن تسمّي أي مصنع.'
 WHERE `name` = 'Holt''s Cigar Company' AND SHA1(TRIM(`history`)) = 'e3ab8abd85d7a9d4eb33d5be0979211cd4df6b33';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Holt''s Cigar Company' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'e3ab8abd85d7a9d4eb33d5be0979211cd4df6b33';
-- brands|Horacio|history|ar — السيجارات تعني سجائر
UPDATE `brands` SET `history_ar` = 'أسّس Christophe Leroy وFabien Gil وSylvain Toaldo، وهم ثلاثة أصدقاء، علامة Horacio عام 2008 بحسب الدار وCigarworld.de وCasagranda (وعام 2006 بحسب House of Grauer): وُلد المشروع من رحلة إلى كوستاريكا، حيث لُفّ السيجار الأول هناك، قبل أن ينتقل الإنتاج إلى إستيلي في نيكاراغوا. يقع مقر شركة Horacio Distribution SA في جنيف بسويسرا؛ ويتولى Christophe Leroy وFabien Gil متابعة الإنتاج في نيكاراغوا، بينما يتولى Sylvain Toaldo التوزيع، بحسب House of Grauer. وفي ألمانيا، تتولى Casagranda توزيع العلامة. ولا تكشف الدار عن اسم مصنع إستيلي الذي يلفّ سيجارها.

حتى سبتمبر 2026، تضم التشكيلة نحو عشر سلسلات بنظام longfiller، تُلفّ يدويًا في إستيلي. تحمل سلسلة Classic، بتسعة مقاسات مرقّمة من 0 إلى VIII، غلافًا إكوادوريًا من نوع colorado فوق غلاف داخلي من كوستاريكا وحشوة نيكاراغوية، بحسب House of Grauer؛ أما Heritage فتجمع بين غلاف إكوادوري من نوع maduro وحشوة تمزج بين نيكاراغوا وكوستاريكا. وتتنوع سلسلتا Maduro Series وEdición Especial بين غلاف إكوادوري أو colorado maduro بحسب المقاس — إذ يتراوح منشأ هذا الأخير، بحسب Zigarrenversand.ch، بين المكسيك ونيكاراغوا تبعًا للمقاس. وتجمع سلسلة OX، التي أُطلقت عام 2017، أربع وحدات — Black Angel وBlue Velvet وPurple Rain وRed Rock — بغلاف إكوادوري من نوع maduro وغلاف داخلي وحشوة من نيكاراغوا. وتكمل سلسلة Esteli Club، بنظام mixed-filler، هذه التشكيلة.'
 WHERE `name` = 'Horacio' AND SHA1(TRIM(`history`)) = 'ae8e4ebb43939ac2391eb40db82f74f71d7e5986';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Horacio' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'ae8e4ebb43939ac2391eb40db82f74f71d7e5986';
-- brands|Hoyo de Monterrey Honduras|history|ar — أسماء العلامات بأحرف لاتينية
UPDATE `brands` SET `history_ar` = '«Hoyo de Monterrey» اسم كوبي — علامة من 1865، وُلدت في ڤويلتا أباخو. وبعد 1960، كما جرى مع Punch وMontecristo وRomeo y Julieta، استُؤنف الاسم خارج كوبا، وصارت نسخته غير الكوبية تُصنع في هندوراس منذ ذلك الحين. ولا يجمع السيجارين شيء سوى الشريط.

بل إن «Hoyo» الهندوراسي سلك عكس مسار الكوبي تماماً. فحيث يشتهر الهافانا بالاسم نفسه بلطفه — إنها علامة «Épicure»، علامة السيجار الخفيف الرفيع — بنت النسخة الهندوراسية سمعتها على القوّة، حتى صارت من مراجع الطابع القويّ في السوق الأميركية.

أمّا سلسلتها «Excalibur»، الحاضرة أصلاً في هذا الأطلس، فهي أبرز تعبير عنها؛ وقد بِيعت طويلاً كعلامة قائمة بذاتها، حتى إن كثيراً من المدخّنين يجهلون أنها تابعة لـ«Hoyo».'
 WHERE `name` = 'Hoyo de Monterrey Honduras' AND SHA1(TRIM(`history`)) = '597d01e31f8a4b8d97c19f3ca2afeb9f2d198b75';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Hoyo de Monterrey Honduras' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '597d01e31f8a4b8d97c19f3ca2afeb9f2d198b75';
-- brands|HVC Cigars|history|ar — أسماء لاتينية، صيغة تفضيل
UPDATE `brands` SET `history_ar` = 'HVC اختصار، وهو يقول من أين جاء مؤسّسها: Havana City. Reinier Lorenzo كوبي من هافانا، وقد أسّس الدار عام 2011.

وطوال عشر سنوات لم يملك شيئًا. كان سيجاره يُلَفّ عند Aganorsa في إستيلي — الدار التي يضمّها هذا الأطلس باسم Aganorsa Leaf، والتي تزرع ورقها بنفسها. ويقوم الكتالوج كلّه على هذا التبغ.

وفي 2021 افتتح مصنعه الخاص، في إستيلي أيضًا. وهي الخطوة التي قلّ أن تخطوها دور البوتيك: بدأت صغيرة جدًا، وتنتج اليوم قرابة مليون سيجار سنويًا. فالنموذج بلا مصنع ليس دائمًا حالةً نهائية — بل قد يكون مرحلة.

والأسماء تقول ما يقوله الاختصار. تُمزَج «Serie A» حصرًا من ورق نيكاراغوي من الفئة أ. أمّا «Pan Caliente» فتستعيد التعبير الكوبي لما يُباع كالخبز الساخن، وهي السلسلة الأعلى مبيعًا في الدار.'
 WHERE `name` = 'HVC Cigars' AND SHA1(TRIM(`history`)) = 'e3aa3fff06b3b23a0fc84dc23868621f22ca2270';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'HVC Cigars' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'e3aa3fff06b3b23a0fc84dc23868621f22ca2270';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ibis' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'c2ef227b9d2b21483e8227cca6ab594cc9801cd3';
-- brands|IGM Cigars|history|ar — أسماء أشخاص بأحرف لاتينية
UPDATE `brands` SET `history_ar` = 'IGM — Inversiones González Martínez — مصنع صغير في سان خوسيه يقدّم نفسه بوصفه بوتيك: قياسات وخلطات لا تُوجد في مكان آخر، تُصنع يدويًّا وغالبًا حسب الطلب للزبون الذي يختار خلطته. تقول الدار إنّها تأسّست سنة 1997 على يد عائلة ذات جذور كوبية، آل González Ferrer، ومنهم José González Ferrer، مهندس زراعي تدرّب في كوبا؛ وتزرع في سانتا مارتا دي بوريسكال، في الجبال فوق تسعمئة متر، وتشتري أيضًا الأوراق من جمهورية الدومينيكان ونيكاراغوا وبيرو والإكوادور.

تُعرف بزبائنها: فـCasdagli، الدار البريطانية الموجودة في هذا الأطلس، تعهد إليها منذ 2013 بسيجارها للسعودية، ثمّ بخطّها Daughters of the Wind سنة 2018 وCypher 3311 سنة 2022 — حشوة دومينيكية وبيروفية، ورابط وغلاف كوستاريكيان، ولفّاف اسمه Luis لصنف Cremellos. ويفتح المصنع مزرعته للزوّار، من البذرة إلى السيجار.

لم تصفها أيّ صحيفة مستقلّة؛ البطاقة من الدار وزبونتها، وتقول ذلك. ولها بطاقة لأنّ IGM مصنع Casdagli — المنطق نفسه بين Tabacalera Palma وAging Room.'
 WHERE `name` = 'IGM Cigars' AND SHA1(TRIM(`history`)) = '91538f827103fbff11c2fcea0f1e1f11bbb491f4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'IGM Cigars' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '91538f827103fbff11c2fcea0f1e1f11bbb491f4';
-- brands|Illusione|history|ar — أسماء لاتينية، صيغة محظورة
UPDATE `brands` SET `history_ar` = 'كان Dion Giolito يدير متجراً في نيڤادا، ورأى أن سيجار زمنه يسير كلّه في الاتجاه ذاته: أقوى، أضخم، أحلى. من هذا الخلاف وُلدت «Illusione». تبحث العلامة عن طابع تسمّيه بلا تردّد «قديم» — جافّ، خشبي، متبَّل، بلا تلك الاستدارة الحلوة التي صارت عُرفاً نيكاراغوياً — وتجده في تبغ وادي خالابا، الأدقّ والأشدّ توتّراً من تبغ إستيلي.

أشرطة الدار مغطّاة بالرموز والأرقام والإحالات الباطنية، وأسماء سيجارها كثيراً ما تكون أعداداً. إنها لعبة، لكنها متّسقة مع المقصد: العلامة تخاطب مدخّنين يقرأون الأشرطة، ويقارنون المقاسات، ويتجادلون في الخلطات.

وقد غيّرت المشهد على نحو دائم في نقطة واحدة بعينها: أعادت الاعتبار للمقاس الصغير. ففي زمن كانت السوق ترفع فيه سماكة السيجار، دافعت «Illusione» عن الكورونا واللانسيرو، بحجّة أن السيجار النحيل يركّز الخلطة بدل أن يخفّفها.'
 WHERE `name` = 'Illusione' AND SHA1(TRIM(`history`)) = '5a0ba75a9b796678596d8d2055086a632586622a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Illusione' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '5a0ba75a9b796678596d8d2055086a632586622a';
-- brands|J. Fuego|history|ar — أسماء لاتينية، سيجارات
UPDATE `brands` SET `history_ar` = 'J. Fuego مصنعٌ في إستيلي: تقول بطاقة 7-20-4 إنّ سيجارها يُلفّ فيه منذ تموز/يوليو 2021. وهذا من يلفّه.

Jesús Fuego كوبيّ من بينار ديل ريو، من الجيل الخامس لعائلة تزرع التبغ منذ اقتنت مزرعة في منطقة إل كوروخو — وهو اسم الصنف نفسه. مهندس زراعي، خصّص أطروحته للتخمير، وليس ذلك تفصيلًا: فهي المرحلة التي تحرسها الدور بأشدّ الغيرة، والتي يُحسم فيها الطعم. عمل في هندوراس ونيكاراغوا، وزرع لغيره، وصنع اسمه إلى جانب Rocky Patel وNestor Plasencia — داران في هذا الأطلس.

في 2006 أسّس شركته الخاصة. والسيجار الأوّل، Gran Reserva Corojo No.1، أعلن البرنامج منذ البداية: الكوروخو، ورقة عائلته، في قلب كلّ شيء. Origen سيجار كوروخو خالص؛ وتبعه 777 وHeat، ثم Sangre de Toro.

عشر سنوات وهو يُلفّ عند غيره. وفي 2016 فتح مصنعه الخاص في إستيلي، قبالة Tabacalera Perdomo، وصار يقضي فيه جُلّ وقته. وإلى هناك انتقلت 7-20-4 سنة 2021، تاركةً Tabacos de Oriente في هندوراس.

كلمة عن 777: هي علامة لـJ. Fuego، وليست دارًا هندوراسية مستقلّة.'
 WHERE `name` = 'J. Fuego' AND SHA1(TRIM(`history`)) = '44be2041cbe6dd7a2674afd5f8665b17e395cabb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'J. Fuego' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '44be2041cbe6dd7a2674afd5f8665b17e395cabb';
-- brands|Jake Wyatt Cigar Co.|history|ar — أسماء لاتينية، سيجارات، أشرطة
UPDATE `brands` SET `history_ar` = 'يحمل Jake Wyatt اسمَي طفلين: Jake، ابن Neil Garcia، وWyatt، ابن Gerard Abajian. أطلق الشريكان الدار في شباط/فبراير 2020 — Abajian بعد عشر سنوات إطفائيًّا وشبابٍ خلف طاولة متجر أبيه في كاليفورنيا؛ وGarcia بعد البيسبول، وعلبة الاثنين والعشرين سيجارًا هي رقم قميصه.

بدأت الدار في جمهورية الدومينيكان، حيث طاف الرجلان على المصانع التي عرضت عليهما عيّنات. ثم قالت إنّها تملك ورشتها الخاصة، كيانًا منفصلًا اسمه Casamorabo بمساحة عشرين ألف قدم مربّع؛ هذا القول هو قول الدار، من دون صفحة أخرى تؤكّده. أمّا ما تثبته صحافة المهنة في نيسان/أبريل 2026 فهو العكس: نُقل الإنتاج كلّه للتوّ إلى Tabacalera San Jerónimo في دانلي بهندوراس، بعد حفنة من المصانع الدومينيكية، وأُعيدت صياغة التشكيلة كلّها على أتبغة هندوراسية ونيكاراغوية. فالبطاقة إذن هندوراسية، بقاعدة مكان اللفّ.

يُقرأ الكتالوج مجموعاتٍ — Gourmet بأشرطة مشغولة صُنعت للتصوير، وConnoisseur الأشدّ رصانة — أضافت إليها سلسلة Titan سنة 2026 ثلاثة أصناف من السيجار اليومي: Goliad وColossus وOmega.'
 WHERE `name` = 'Jake Wyatt Cigar Co.' AND SHA1(TRIM(`history`)) = 'c0caef1d84b4957997593de3d36ef70de30b3ba4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Jake Wyatt Cigar Co.' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'c0caef1d84b4957997593de3d36ef70de30b3ba4';
-- brands|JAMM Cigar|history|ar — أسماء أشخاص، Mata Fina
UPDATE `brands` SET `history_ar` = 'وُلدت JAMM Cigar من سيجار قُدّم في كازينو قرب شلالات نياغارا: José Antônio Martins Monteiro، مزارع البرتقال والليمون واليوسفي في شمال باهيا، التقى هناك Joaquim Alfredo Mesquita Moreira الذي ناوله سيجاره الثمين الأوّل. والأحرف الأولى من اسمي الصديقين تصنع اسم العلامة. لفّ أوّلًا لنفسه وللإهداء، كما يروي، حتّى أراه محاسبه يومًا ما يكلّفه ذلك؛ فجعل منه شركة. وتحمل مزرعة FEANBE، المشتراة سنة 2016 في ألاغوينياس على 124 كم من سلفادور، المصنعَ على طريق BR-110، المؤسَّس سنة 2020 بحسب صحافة 2022 وفي إنتاج تجاري منذ 2021.

وُسّع المصنع ثلاث مرّات في سنتين. يعيش منه نحو مئة شخص، مباشرة أو لا، كما قالت الصحافة سنة 2022؛ وسنة 2024 كان يُخرج 4500 سيجار في اليوم، 2500 منها بحشوة طويلة — والباقي بحشوة متوسّطة وقصيرة يتركه هذا الأطلس. تزاوج الخلطة Mata Fina من منطقة ريكونكافو مع تبغ من بذور كوبية يُزرع في البرازيل؛ وتُسمّى الخطوط الطويلة Super Premium وRobusto Premium وPetit Lonsdale وChurchill وGordito.

هي أحدث دار برازيلية في هذا الأطلس، وهي بالفعل إحدى الدور الأربع التي تعدّها Apcab لمعظم القطاع الحرفي في البلاد؛ ويجلس مؤسّسها في مشروع تسمية المنشأ لسنة 2026. وألاغوينياس ليست ريكونكافو — فهي أبعد شمالًا، خارج وادي باراغواسو — ويفتح لها هذا الأطلس منطقة.'
 WHERE `name` = 'JAMM Cigar' AND SHA1(TRIM(`history`)) = '97b80f5872fa08dcc7961856fc792f757d8d4ced';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'JAMM Cigar' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '97b80f5872fa08dcc7961856fc792f757d8d4ced';
-- brands|Jas Sum Kral|history|ar — أسماء لاتينية، مدة بالشهور
UPDATE `brands` SET `history_ar` = 'Jas Sum Kral تعني «أنا ملك» بالمقدونية، وهي علامةُ مقدوني رحل ليبني مسيرة في تقنية المعلومات بالولايات المتحدة، Riste Ristevski، الذي قرّر سنة 2015 أن يصنع سيجاره بدلًا من أن يدخّن سيجار الآخرين. تستعير الأشرطة من منسوجات بلده — أحد الزخارف مأخوذ من صورة ابنته في ثوب زفاف قروي — ونبرة الدار هي نبرة مؤسّسها: مباشرة، عدوّةٌ معلنة للتنظيم الفدرالي.

تنشر الدار بنفسها تاريخ مصانعها، وقلّة تفعل ذلك. من 2015 إلى 2017 خرج السيجار من NOA — New Order of the Ages — ورشة إستيلي التي كان يديرها آنذاك Noel Rojas، المزّاج الكوبي الذي يحمل هذا الأطلس بطاقته: Jas Sum Kral هي الدار الخامسة في هذا الأطلس التي مرّت بيديه. ومن 2018 إلى تشرين الأوّل/أكتوبر 2024 خرج من Tabacalera Aragón، مصنع الأخوين Roniel وRoidel Aragón، الذي لا بطاقة له هنا لغياب علامة خاصة به. وفي 11 تشرين الأوّل/أكتوبر 2024، بعد ستة شهور من إعادة مزج خطوطه، ترك Ristevski Aragón إلى مصنع ثالث في إستيلي — واختار ألّا يسمّيه. وهذا الأطلس، الذي لا يكتب بطاقة من دون مصنع مسمًّى، يستثني هنا عن قصد: رفضُ التسمية موثّق من الدار نفسها، ومصنعان من ثلاثة مسمّيان.

الكتالوج نيكاراغوي ومباشر — Red Knight وCrna Nok (الليل الأسود) وTyrannical Buc وNuggs وZlatno Sonce (الشمس الذهبية) — وتبيع الدار مباشرةً، من طاولة المصنع كما تقول، إلى باب الزبون.'
 WHERE `name` = 'Jas Sum Kral' AND SHA1(TRIM(`history`)) = '7895e3e3d8152c55cf7266fedd4066151bca37ef';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Jas Sum Kral' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '7895e3e3d8152c55cf7266fedd4066151bca37ef';
-- brands|Joyas de Panamá|history|ar — أسماء أعلام وشركات لاتينية
UPDATE `brands` SET `history_ar` = 'Joyas de Panamá هي الدار التي أبقتها بنما. أسّستها Miriam Padilla في شباط/فبراير 1986 في لا بينتادا بمقاطعة كوكلي، وتسمّيها الصحافة البنمية أوّل مصنع سيجار دائم في البلاد — وهو قول يكشف كثيرًا عمّا سبقه: ورشٌ تُفتح ثم تُغلق.

ولم تأتِ من فراغ. فقد جلب Gilberto Oliva وNestor Plasencia في آذار/مارس 1981 بذورًا كوبية إلى كوكلي؛ وافتُتحت Coclé Tobacco Factory في بينونومي في العام نفسه، وTabacos Panamá S.A. في لا بينتادا سنة 1984. وكانت Miriam Padilla مديرةَ إنتاج في شركة Oliva قبل أن تُنشئ شركتها: فما حملته معها لم يكن علامةً بل صنعةً، وهذه البطاقة تقولها على هذا النحو لأنّ هذا ما تُثبته المصادر.

واللفّ يدويّ بالكامل، على بذرة كوبية، وفق الطرائق المتعلَّمة من أولئك المعلّمين. ويأتي التبغ من الأراضي البركانية حول لا بينتادا وسونادورا ومن موضع يُسمّى سورتوفا. وفي هذه النقطة الأخيرة تتباين المصادر، ولا يحسم الأطلس الأمر: فثمّة سورتوفا في منطقة بوغابا بتشيريكي، بينما تضع الصحافة البنمية سورتوفا التبغية في كوكلي. والمقاطعتان كلتاهما تزرعان؛ ولعلّ الاسم الواحد يدلّ على موضعين.

توقّفت الدار سنة 2023 — الوباء، ثم تقاعد Miriam Padilla. وأعاد ابنها Braulio Zurita فتح الورشة ويديرها. لهذا تُكتب هذه البطاقة بصيغة الحاضر، ولهذا أيضًا تبقى متحفّظة: فتحقيقٌ خرج سنة 2025 بحثًا عن السيجار البنمي وجد بقيّة ورش كوكلي متوقّفة، وصناعةً نخرها سوء الإدارة واتّهامات الاحتيال على الشهادات الضريبية والأجور غير المدفوعة. وJoyas de Panamá هي ما نجا من ذلك.

ولا يُذكر هنا أيّ اسم خطّ، وذلك مقصود: فالدار لا تنشر اسمًا يمكن التحقّق منه. وأربع عشرة بطاقة في هذا الأطلس على هذه الحال. وتسميةُ خطوط لم يرها المرء تعني تكرار ما أُزيل لتوّه من بنما — بطاقة كاملة مبنيّة على لا شيء.'
 WHERE `name` = 'Joyas de Panamá' AND SHA1(TRIM(`history`)) = 'a2babc38a82bed6ba6aec64445efb6f2cee41887';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Joyas de Panamá' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'a2babc38a82bed6ba6aec64445efb6f2cee41887';
-- brands|Juan Clemente|history|ar — صيغة تفضيل زائدة، أسماء لاتينية
UPDATE `brands` SET `history_ar` = 'تُعرَف «Juan Clemente» بغرابة لم يجرؤ عليها سواها: فشريطها لا يوضع قرب الرأس، بل عند **قدم** السيجار، في الطرف الذي يُشعَل.

وليست هذه غنجاً. فالقدم أهشّ أجزاء السيجار: الغلاف هناك طليق، وأدنى ارتطام يشقّه. والشريط، موضوعاً في ذلك الطرف، يمسكه حتى الإشعال ثم ينحلّ من تلقائه. إنه حلّ صانعٍ، اعتُمد هوساً بالبناء — وصار توقيعاً يُلمح من عشرة أمتار.

أمّا مؤسّسها، Jean Clément، فكان فرنسياً. أنشأ الدار في سانتياغو دي لوس كاباييروس سنة 1982، وأسبَنَ اسمه لأنه رأى أن وقعه أحسن هكذا في هذه المهنة. وأصلٌ فرنسي في تلك اللحظة شذوذ إضافي: فالبلاد كانت صاعدة، وكانت كل العلامات الجديدة تقريباً تأتي من عائلات كوبية منفيّة.

الطابع لطيف إلى متوسط، في التقليد الدومينيكي الكلاسيكي: أرز وقشّ ونعومة متحفّظة، ومقاسات نحيلة غالباً. وبقي الإنتاج محدوداً، وتنتمي العلامة إلى فئة الدور التي يُتحدَّث عنها بصيغة الماضي دون أن تكون قد اختفت فعلاً.'
 WHERE `name` = 'Juan Clemente' AND SHA1(TRIM(`history`)) = '7f034a727f72c0a663e5af9efb4b4c0c22dbdaa5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Juan Clemente' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '7f034a727f72c0a663e5af9efb4b4c0c22dbdaa5';
-- brands|Kafie 1901|history|ar — صياغة المقارنة، أسماء لاتينية
UPDATE `brands` SET `history_ar` = 'Kafie 1901 علامةٌ هندوراسية بالاسم ودومينيكية بالمكان، ويصنّفها هذا الأطلس بالثاني. والرقم هو السنة التي استقرّت فيها عائلة Kafie في تيغوسيغالبا. أمّا Gaby Kafie فكان جرّاحًا — جراحة عظام القدم والكاحل، والطبّ الرياضي — إلى أن أجبره مرضٌ نادر في العينين على الاعتزال سنة 2007، في الثامنة والثلاثين. والسيجار هو ما فعله بعد ذلك.

وُلدت الشركة سنة 2013 في فلوريدا، وكانت تلفّ سيجارها لدى Puros Aliados، مصنع عائلة Reyes في دانلي، الذي يحمل هذا الأطلس بطاقته. وفي 2017 فتح Kafie مصنعه الخاص في المدينة نفسها: Tabacalera G. Kafie y Cía، ألفا قدم مربّعة، عشرون شخصًا منهم اثنا عشر لافًّا ومزّاجان رئيسان ومشترٍ للورق ومسؤولٌ عن التخمير، لمئة وخمسين ألف سيجار في السنة موزّعة على أربع مزجات — Don Fernando Maduro وConnecticut وSumatra وSan Andrés.

صمد أربع سنوات. في تشرين الثاني/نوفمبر 2021 قضت عليه الأعاصير التي اجتاحت المنطقة وسلسلة التوريد التي كسرتها الجائحة: أغلق Kafie دانلي ونقل إنتاجه كلّه إلى La Aurora، أقدم مصنع في جمهورية الدومينيكان، الذي يحمل هذا الأطلس بطاقته أيضًا. وأوّل سيجار في هذه الحياة الجديدة، Serie L Natural، مزجةٌ دومينيكية بالكامل رُكّبت مع Manuel Inoa، كبير مزّاجي La Aurora؛ والحرف L هو الرقم الروماني لعيد ميلاد Kafie الخمسين في تموز/يوليو 2021، ووصل السيجار متأخّرًا ما يزيد على سنة، في أيلول/سبتمبر 2022.

دارٌ كان لها مصنعها ثم فقدته هي عكس المسار المعتاد في مشهد البوتيك. وهذه البطاقة تقول ذلك كما هو.'
 WHERE `name` = 'Kafie 1901' AND SHA1(TRIM(`history`)) = '05f406d0640965b44df9725e4311e03e67dbb48f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Kafie 1901' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '05f406d0640965b44df9725e4311e03e67dbb48f';
-- brands|Karen Berger Cigars|history|ar — فدان بدل أكر، أسماء لاتينية
UPDATE `brands` SET `history_ar` = 'ثلاثة أجيال وثلاثة بلدان، وفي كلّ مرّة يكون التبغ هو ما يبقى. فرّ Max Berger من بولندا أمام هتلر في الأربعينيات وتوقّف في كوبا، حيث أقام مصنعًا في بينار ديل ريو. وطردته الثورة بدورها؛ فرحل إلى الولايات المتحدة في الستينيات مع ابنه، وقرّر أن يقطع مع التبغ. غير أنّ الابن، Enrique — Kiki — لم يأخذ بتلك النصيحة.

في التسعينيات، حين انتعش السيجار الأمريكي، ذهب Kiki Berger إلى نيكاراغوا، فاشترى أرضًا وفتح مصنعًا في إستيلي، Tabacalera Estelí، ومزرعةً بمئتي أكر إلى جانبه، هي «Vegas». وهناك ما زالت الدار. وهو أيضًا مصنع Cuban Crafters، المتجر والعلامة في هافانا الصغيرة بميامي اللذين كان Kiki شريكًا في ملكيّتهما، ويحمل هذا الأطلس بطاقتهما: فالداران تخرجان من الورشة نفسها.

Karen نيكاراغوية، من إستيلي نفسها. في الثامنة عشرة، وهي طالبة إدارة أعمال، أخذت عملًا لافّةً في مصنع بالمدينة لتدفع نفقات دراستها. كان المصنع مصنعَ Kiki Berger. تزوّجا وعملا معًا، ولمّا توفّي سنة 2014 عن ستّ وخمسين سنة، كانت هي من تولّت — المصنع والمزرعة ومتجر دايتونا بيتش. ويُقال عنها في المهنة إنّها المرأة الوحيدة التي تملك وتدير دار سيجار من طرفها إلى طرفها، من الأرض إلى المنضدة.

وسّعت أوّلًا سلسلة Don Kiki من أربع مزجات إلى ستّ. ثم وقّعت سلسلتها سنة 2016: K by Karen Berger، على أتبغة مزرعتها. وسمّتها المهنة سيّدة أعمال التبغ لسنة 2021.'
 WHERE `name` = 'Karen Berger Cigars' AND SHA1(TRIM(`history`)) = 'dc208a10bb48f4e5d7b13db513e6380d3b347b56';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Karen Berger Cigars' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'dc208a10bb48f4e5d7b13db513e6380d3b347b56';
-- brands|Kelner Boutique Factory|history|ar — أسماء لاتينية؛ صياغة العدد
UPDATE `brands` SET `history_ar` = 'Kelner اسمٌ يعرفه عالم السيجار الدومينيكي كلّه، ولسبب محدّد: Hendrik «Henke» Kelner هو معلّم التبغ الذي أسّس وأدار Tabadom، مصنعَ Davidoff في جمهورية الدومينيكان، ما يزيد على ثلاثين سنة. وعمل ابنه Hendrik Kelner Jr. هناك ثماني عشرة سنة إلى جانبه قبل أن يفتح مصنعه الخاص سنة 2012 في سانتياغو دي لوس كاباييروس: Kelner Boutique Factory، التي تسمّيها المهنة KBF.

وكلمة «بوتيك» تُؤخذ بحرفيّتها. إنّه مصنع صغير جدًّا، وقد صُمّم على هذا النحو — لا ملحقًا لـDavidoff، بل المكان الذي يصنع فيه مزّاجٌ تدرّب في أكبر دار دومينيكية سيجارات لا تصنعها أكبر دار. يلفّ لغيره: صنعت Casdagli سيجاراتها هناك من 2013 إلى 2016، بين كوبا وكوستاريكا؛ وتصنع Principle سيجاراتها هناك.

علاماته الخاصة قليلة وموقّعة. Smoking Jacket تحمل اسم الدار. وThe 73 — سنة ميلاد Kelner Jr. — تعاونٌ مع Privada Cigar Club، وهو نادي اشتراك أمريكي.

وسلك Kelner آخر الطريقَ نفسها: فتح Klaas Pieter Kelner، من العائلة نفسها، مصنعه الخاص في المنطقة الحرة بسانتياغو سنة 2023. مصانع عدّة، عائلة واحدة، مدرسة واحدة — مدرسة Davidoff، التي يحمل هذا الأطلس بطاقتها.

Centaur Cigars علامة أخرى يلفّها المصنع لحساب طرف ثالث: الاسم يخص Tobias Forst، الذي اتخذ الميثولوجيا اليونانية موضوعًا. وفي أكتوبر 2026 تحمل سيجاراتها، المجمّعة في Hero Series، أسماء أبطال، Cheiron وAchilles وOdysseus وJason وPerseus وKronos، ويبيعها تجار تجزئة ألمان بمقاس Toro، مع Toro Grande لـKronos. وهي تُلَفّ يدويًا لدى Hendrik Kelner Jr.، في Kelner Boutique Factory، في سانتياغو دي لوس كاباييروس.'
 WHERE `name` = 'Kelner Boutique Factory' AND SHA1(TRIM(`history`)) = '619f3ee2dde56be1e92221266835997913ab2ea3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Kelner Boutique Factory' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '619f3ee2dde56be1e92221266835997913ab2ea3';
-- brands|Kinix|history|ar — سجائر؛ شبه حصري؛ خطوط
UPDATE `brands` SET `history_ar` = 'وُلدت Kinix في ألمانيا عام 2019 من لقاء صديقين: Jurandi Santos، وهو هندوراسي الأصل وهاوٍ قديم للسيجار، أقنع Philipp Noack بإطلاق علامة خاصة معه؛ أسّس الاثنان شركة P. Santos Cigars، ووصلت أولى سيجارات Kinix إلى السوق بعد نحو ثمانية شهور، بحسب موقع الشركة. ويعني الاسم «الملك» بلغة المايا، ويهدف إلى التأكيد على معيار جودة عالٍ، بحسب المصدر نفسه.

يُصنع السيجار بالكامل يدويًا في هندوراس، من تبغ هندوراسي بشكل شبه حصري، بحسب الشركة؛ ولم يذكر أي مصدر تم العثور عليه، بما في ذلك موقعها الخاص، اسم المصنع. ويضم الكتالوج أربعة خطوط — Manik وCaban وEB وIk — لكل منها خلطة مختلفة.

لم يعد موقع Kinix يذكر أي تاريخ جديد منذ مارس 2021 — حين جرى تجديد تصميم شريط السيجار وأُبرمت شراكة مع الشركة الأمريكية Boveda؛ وحتى سبتمبر 2026، لا يزال عدد من الموزّعين الألمان (La Casa del Tabaco وNoblego) يعرضونها في فهارسهم.'
 WHERE `name` = 'Kinix' AND SHA1(TRIM(`history`)) = 'd462bb12f55dce97bdfc8531d37247202f8ea660';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Kinix' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'd462bb12f55dce97bdfc8531d37247202f8ea660';
-- brands|Kolumbus|history|ar — أسماء لاتينية؛ ملصقات ونحو مضافة
UPDATE `brands` SET `history_ar` = 'Kolumbus دار صغيرة في لا بالما تلفّ بالحشوة الطويلة — أوراقًا كاملة — من تبغ بالميّ خالص: صنف بريينيا، المولود في التربة البركانية شرقيّ الجزيرة، حيث تقع حقولها أيضًا. ويُعتَّق الورق سنوات عدّة في أقبية من خشب الأرز الإسباني قبل اللفّ.

أسّسها ثلاثة أصدقاء. ولا تنشر الدار أسماءهم ولا سنة تأسيسها، وهذا الأطلس لا يخترعهما. ويتولّى تسويقها من سويسرا Stefan Baltisberger.

وتاريخها القريب يقول شيئًا عن المشهد الكناري كلّه. فلائحة «التتبّع والاقتفاء» الأوروبية، التي كُتبت لمكافحة تهريب السجائر، وُسّعت لتشمل السيجار: على كلّ قطعة أن تحمل معرّفًا فريدًا وعلامات أمان، وهو ما يستلزم طابعات معتمدة وبرمجيات خاصة ورخصة شهرية. وتقدّر المجلّة الإلكترونية zigarren.zone الاستثمار بما يزيد على سبعين ألف فرنك سويسري، إضافةً إلى ألفين شهريًا، وتفيد بمرور سنة كاملة من دون أيّ تصدير.

وبالنسبة إلى ورشة تلفّ باليد بضعة آلاف من السيجار، فهذا عبء لا صلة له بأحجامها. لم تُكتب القاعدة ضدّ دور كهذه؛ لكنّها تصيبها على أيّ حال، وهذا من ذلك الضرب من الأسباب التي يختفي بها مشهد كامل من دون أن يقرّر ذلك أحد.'
 WHERE `name` = 'Kolumbus' AND SHA1(TRIM(`history`)) = '9a7d59ac3ae9a6e95a1b3075dbc03668b3b5c738';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Kolumbus' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '9a7d59ac3ae9a6e95a1b3075dbc03668b3b5c738';
-- brands|Kristoff|history|ar — عرض التمثيل؛ أسماء لاتينية
UPDATE `brands` SET `history_ar` = 'وُلدت Kristoff من زيارة لم يطلبها مؤسّسها. ففي 2004 قصد Rolando Villamil، من مصنع Charles Fairmorn في الجمهورية الدومينيكية، مدينة شيكاغو ليعرض على Glen Case وزوجته أن يمثّلا في الولايات المتحدة سيجارًا كان ينوي صنعه.

كان Case يعمل في المال. وقبِل الدعوة لزيارة المصنع، وذهب — ثمّ عاد بفكرة أخرى: أن يمزج تركيباته الخاصة هناك، على أن يتولّى Villamil الإنتاج. فترك المال وأسّس Kristoff في العام نفسه.

وقد غيّر المصنع اسمه منذ ذلك الحين: صار Charles Fairmorn هو Tabacalera von Eicken في سانتياغو. أمّا العلامة فبقيت.

أمّا التبغ فيأتي من كلّ مكان — هندوراس، ونيكاراغوا، والجمهورية الدومينيكية، والبرازيل، والإكوادور، وكونيتيكت، وبنسلفانيا، وأفريقيا. إنّه نقيض منطق الأرض، وهو مقصود: فما يحدّد سيجار Kristoff ليس منشأً بل تركيبة.

لا تقتصر Tabacalera von Eicken، في سانتياغو، على لفّ Kristoff. فقد كانت تُسمّى Charles Fairmorn، ولا يزال هذا الاسم هو اسم المصنّع على علامات أخرى. وفي أكتوبر 2026 يعرض تاجر التجزئة الألماني Cigarworld ثلاث علامات لا تخص Kristoff: Dominican Santiago Selection، وهي سلسلة تؤرّخها صفحتها بعام 2003، من نوع longfiller؛ وQuisqueya وR.A. Villamil، من نوع medium-filler، علمًا أن تاريخ Clasico من R.A. Villamil يعود إلى 2007. ويُذكر Kleinlagel، في Bruchsal، موزّعًا للأوليين.'
 WHERE `name` = 'Kristoff' AND SHA1(TRIM(`history`)) = '7ef0b769e1facec2684b1fe676f57cbf7727498d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Kristoff' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '7ef0b769e1facec2684b1fe676f57cbf7727498d';
-- brands|L'Atelier|history|ar — Pete مترجم بيتًا؛ أسماء لاتينية
UPDATE `brands` SET `history_ar` = 'L''Atelier هي الدار الثانية لـPete Johnson، الذي يضمّ هذا الأطلس داره الأولى باسم Tatuaje. أسّسها عام 2012 مع Dan Welsh وK.C. Johnson وSean Johnson، تحت السقف نفسه مع Tatuaje.

والمقصد المعلَن غير مألوف وهو مزدوج: صنع سيجار فاخر بسعر يستطيع المدخّن مجاراته، ورفع ما يُنتظر من السيجار عند كلّ مستوى سعر. أصدرت الدار علامتين فاخرتين في عامها الأول، L''Atelier وSurrogates، وخطّين بسعر مضبوط.

ويُلَفّ كلّ شيء عند عائلة García في My Father Cigars بإستيلي — المصنع الذي يضمّه الأطلس باسم My Father، وهو نفسه الذي تستعمله Tatuaje. داران ومؤسّس واحد وورشة واحدة: من أوضح التشكيلات في مشهد البوتيك، ومن القليلة التي تُعلَن فيها الصلة.

وهذا أيضًا ما يميّز L''Atelier عن سائر الدور التي لا مصنع لها. فحيث توزّع Crowned Heads أو Dunbarton إنتاجها على مصانع عدّة، لا يستعمل Johnson سوى واحد، وهو مصنع علامته الأولى.'
 WHERE `name` = 'L''Atelier' AND SHA1(TRIM(`history`)) = '3bfb04e46cb14887e0f09a675ede909f9878423c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'L''Atelier' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '3bfb04e46cb14887e0f09a675ede909f9878423c';
-- brands|La Aroma de Cuba|history|ar — أسماء علم بالحروف اللاتينية
UPDATE `brands` SET `history_ar` = 'La Aroma de Cuba اسم كوبي من القرن التاسع عشر لم يعد يصنع شيئًا في كوبا منذ ما يزيد على قرن. تعود العلامة إلى ثمانينيات القرن التاسع عشر؛ وضاعت تسجيلاتها بعد مطلع القرن، كما ضاعت تسجيلات عشرات الدور الكوبية التي بيعت أو تبودلت أو نُسيت ببساطة.

واستعادت عائلة Levin، مالكة Ashton — التي يضمّها هذا الأطلس — الحقوق في التسعينيات، وأعادت إطلاق العلامة في مطلع الألفية بتصنيع هندوراسي.

والمنعطف هو عام 2009. أعاد José «Pepin» García تركيب المزيج بالكامل، وانتقل الإنتاج إلى My Father في إستيلي: غلاف Connecticut Broadleaf، وحشوة نيكاراغوية خالصة. وهذه النسخة هي التي صنعت نجاح العلامة، وهي التي تبرّر مكانها في نيكاراغوا لا في هندوراس ولا في كوبا.

كما تعدّ الدار Winston Churchill بين أوائل مدخّنيها في الحقبة الكوبية. وهي حجّة تجارية قديمة لا تثبتها أيّ مصادر مستقلّة — الحجّة نفسها التي تسوقها Vargas في الكناري. ويردّ هذا الأطلس القول إلى قائله ولا يتبنّاه.

في ألمانيا كما في سويسرا تُباع العلامة باسم La Aroma del Caribe. وفي أكتوبر 2026 يعرضها تاجر التجزئة الألماني Cigarworld بهذا الاسم، مع My Father Cigars S.A. بوصفها الصانع وM. K. & Söhne، في Rellingen، بوصفها المستورد، ضمن سلاسل منها Mi Amor. وتربطها صفحة تحليل لسيجار بـAshton، علمًا أن العلامة معروفة في الولايات المتحدة باسم La Aroma de Cuba. وفي سويسرا تُذكر Pasion Churchill متاحةً ابتداءً من مارس 2023 لدى المستورد The Royal Cigar Company.'
 WHERE `name` = 'La Aroma de Cuba' AND SHA1(TRIM(`history`)) = 'c0aab599a4ee2262e20beb92cb18e2b0f2cd31f0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Aroma de Cuba' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'c0aab599a4ee2262e20beb92cb18e2b0f2cd31f0';
-- brands|La Barba|history|ar — أسماء علم بالحروف اللاتينية
UPDATE `brands` SET `history_ar` = 'غيّرت La Barba بلدها ولم تغيّر اسمها. أسّس Tony Bellatto وCraig Rossi الدار في مطلع العقد الثاني من الألفية؛ وظهر أوّل سيجار لها، La Barba Red، عام 2013.

كان يُلَفّ حينها في هندوراس، في مصنع Aladino بدانلي — مصنع عائلة Eiroa، تلك السينما القديمة التي يرويها هذا الأطلس في بطاقة Asylum.

وفي 2014 صدر Purple بأتبغة دومينيكية، وارتبطت الدار بـTabacalera William Ventura. ثم تبعه Red: غادر هندوراس إلى الورشة نفسها. وهي المصنع الذي يُعِدّ فيه Robert Caldwell مزائجه، والأطلس يضمّ الدارين معًا.

وتُسمّى السلاسل بالألوان لا بالأسماء — Red وPurple — وتلك طريقة في ألّا تَعِد بشيء قبل أن ينطق السيجار.

في 26 أيلول/سبتمبر 2022 دمّر حريقٌ Tabacalera William Ventura؛ واستُؤنف الإنتاج في ورش فرعية وفي El Maestro، وأعاد المصنع الجديد فتح أبوابه في آذار/مارس 2024 بالاسم نفسه. وللمصنع بطاقته الخاصة: Tabacalera William Ventura.'
 WHERE `name` = 'La Barba' AND SHA1(TRIM(`history`)) = 'b0afeff4db4f3e0812ffe46149bc914171c332bc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Barba' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'b0afeff4db4f3e0812ffe46149bc914171c332bc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Flor de Copán' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '066a2c924805ac7eb4b611b9d974310b2208730c';
-- brands|La Flor Dominicana|history|ar — أسماء المدن تُترجم
UPDATE `brands` SET `history_ar` = 'La Flor Dominicana من صنع Litto Gómez، وهو صائغ سابق في ميامي، وزوجته Ines Lorenzo. وبحسب صحافة المهنة، دخل الزوجان عالم السيجار عام 1994 بعلامة Los Libertadores، في ورشة صغيرة في فيلا غونزاليس فيها أربعة مواقع للّف. وفي عام 1996، إثر خلاف، تولّى Litto Gómez وInes Lorenzo الشركة دون علامة Los Libertadores، وأُعيدت تسمية السيجار إلى La Flor Dominicana. وبحسب ويكيبيديا، أُنتجت أولى السيجارات في سانتياغو عام 1996؛ والمصنع اليوم في تامبوريل (الوضع في أكتوبر 2026، وهذا المصدر وحده).

يصدر «Chisel»، وهو فيغورادو برأس مائل كالإسفين، عام 2003 بحسب صحافة المهنة: يُقال إن الفكرة خطرت لـLitto Gómez وهو في طريقه إلى المصنع، وإن الشكل احتاج عشرة شهور من الضبط، وإنه طلب من لافّي السيجار لديه أن يعيدوا صنعه. ويأتي ضمن خط Double Ligero، الذي تصفه الدار بأنه ملفوف بأوراق Sumatra الداكنة من الإكوادور المزروعة تحت الشمس، فوق حشوة وغلاف داخلي دومينيكيين من أرض الدار.

ذُكر في صحافة المهنة عام 2007 أن José «Jochi» Blanco، صانع السيجار، يتقاسم مع La Flor Dominicana مزرعة مساحتها 120 أكرًا؛ وهو ليس مؤسس الدار.'
 WHERE `name` = 'La Flor Dominicana' AND SHA1(TRIM(`history`)) = 'af35374bf82e4aae217449ccc120209dd3278e99';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Flor Dominicana' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'af35374bf82e4aae217449ccc120209dd3278e99';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Fontana' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '3d2a1879ef63820e6056990462a3b16a7600c411';
-- brands|La Galana|history|ar — أسماء علم بالحروف اللاتينية
UPDATE `brands` SET `history_ar` = 'La Galana مصنعُ Annette Meisl، الكولونيّة التي كانت وكيلة فنّانين وكاتبة وموسيقية قبل أن تقع، في كوبا، فيما تسمّيه سحر التبغ. طلبت من معلّمة كوبية، Silvia Hernández، أن تعلّمها اللفّ، ثم تعلّمت لسنوات، من المصدر الأوّل، الطريقتين النيكاراغوية والهندوراسية. وُلدت La Galana سنة 2005؛ وبعد أربع سنين افتتحت في إيرنفلد متجرًا مؤثّثًا على الطراز القديم مع صالون.

السيجارات طويلة الحشوة من أتبغة كاريبية مستوردة، تلفّها يدويًّا لفّافات — صيغة التأنيث من الدار التي توظّف نساءً — بحسب ما تسمّيه معايير الجودة الألمانية. يصنّفها هذا الأطلس في ألمانيا، البلد الذي يفتحه مكانَ لفّ مع درسدن وبرليسرويت: ثلاث ورش، ثلاث قصص مختلفة، حركة واحدة.

دارُ شخص واحد في مدينة لا تقليد للسيجار فيها؛ مصدرها مجلّة المدينة. تقول البطاقة ذلك ولا تخترع أرقامًا.'
 WHERE `name` = 'La Galana' AND SHA1(TRIM(`history`)) = '578a0036c9cdbe7d564608e5fd38cb13797dcdbf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Galana' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '578a0036c9cdbe7d564608e5fd38cb13797dcdbf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Gianna' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '85d28ca4e3ad25672a62556d609b5a76c7d5791f';
-- brands|La Gloria Cubana Dominicaine|history|ar — أسماء علم بالحروف اللاتينية
UPDATE `brands` SET `history_ar` = 'لم تُولد هذه من تسجيل علامة، بل من ورشة.

فتح Ernesto Perez-Carrillo الأب، الذي وصل من كوبا عام 1959، مصنع El Credito عام 1968 في شارع كايي أوتشو بحي هافانا الصغيرة في ميامي. وهناك وُلدت La Gloria Cubana غير الكوبية عام 1972. ثمّ تولّى ابنه Ernesto Perez-Carrillo الأمر عام 1980 وجعلها علامة الدار.

وفي 1996 كان لدى El Credito ثلاثون لافًّا، وأنتج نحو 1.2 مليون سيجار، أربعة أخماسها من Gloria Cubana. وتجاوز الطلبُ الورشةَ: فانتقل الإنتاج إلى جمهورية الدومينيكان، واشترت General Cigar العلامة عام 1999. وقد أسّس Ernesto Perez-Carrillo نفسه بعدها داره الخاصة، التي يضمّها هذا الأطلس باسم E.P. Carrillo.'
 WHERE `name` = 'La Gloria Cubana Dominicaine' AND SHA1(TRIM(`history`)) = 'a587d1213c1e2b8e2252eedf50b0095a4cc40285';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Gloria Cubana Dominicaine' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'a587d1213c1e2b8e2252eedf50b0095a4cc40285';
-- brands|La Palina|history|ar — négociant مترجم خطأً؛ أسماء لاتينية
UPDATE `brands` SET `history_ar` = 'La Palina اسم من عام 1896 أعاده حفيد إلى الحياة. ففي تلك السنة افتتح Samuel Paley، وهو مهاجر أوكراني، متجر سيجار في شيكاغو وأسّس Congress Cigar Company؛ وسمّى علامته باسم زوجته Goldie Drell Paley. وبحلول 1910 صار له مصنع في فيلادلفيا.

أمّا ابنه William S. Paley فباع السيجار عبر الإذاعة — وكان البرنامج يُسمّى La Palina Hour — وأولع بذلك حتى استولى عام 1928 على الشبكة التي كانت تبثّه. ترك السيجار وصنع من CBS ما صارت إليه. وصُفِّيت Congress Cigar Company بعد اعتزال Samuel عام 1926، فانطفأ الاسم.

ثم أعاده William Paley Jr.، المعروف بـBill، إلى الحياة عام 2010. وخرجت أولى السيجارات من الباهاما، بكميات صغيرة.

وتصف الدار نفسها بأنها négociant، أي تاجر، وهذا مفتاح بطاقتها: لا تملك أيّ مصنع، لكنّها تملك تبغها ومنتجاتها النهائية وعلاماتها. فهي تُوكِل اللفّ إلى غيرها، والتقسيم معلَن — Goldie وMr. Sam في El Titan de Bronze بهافانا الصغيرة في ميامي، وGoldie على يد لافٍّ واحد؛ وClassic في PDR Cigars بالجمهورية الدومينيكية؛ وEl Diario وMaduro في Raíces Cubanas بهندوراس؛ وNicaragua Oscuro عند A.J. Fernández؛ و1896 في Graycliff بالباهاما. وثلاثة من هؤلاء الشركاء الخمسة لهم بطاقاتهم في هذا الأطلس.

ولهذا صُنّفت هذه البطاقة أمريكية: فـGoldie، الخطّ الأعلى للدار، وخطّان آخران يخرجان من ميامي. والأطلس يصنّف بالمكان الرئيسي — ويكتب الباقي بدل أن يكتمه.'
 WHERE `name` = 'La Palina' AND SHA1(TRIM(`history`)) = '5d26ec42be22cf2141440b4954fd401694158f1d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Palina' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '5d26ec42be22cf2141440b4954fd401694158f1d';
-- brands|La Sirena|history|ar — أسماء علم بالحروف اللاتينية
UPDATE `brands` SET `history_ar` = 'La Sirena علامةُ Arielle Ditkowich، أُطلقت سنة 2009 بالشراكة مع Nestor Miranda — مؤسّس Miami Cigar & Co. التي يحمل هذا الأطلس بطاقتها. حوريّة الحزام هي حوريّة الأساطير، وخرج الخطّ الأوّل، La Sirena Original، من My Father، مصنع عائلة García، قبل أن ينتقل سنة 2014 إلى La Zona، مصنع Erik Espinosa، حيث يُلفّ منذئذٍ بغلاف هابانو أوسكورو نيكاراغوي. واشترت الدار Old School Cigars في السنة نفسها. يصنّفها هذا الأطلس في نيكاراغوا حيث يخرج الخطّ الذي يحمل الاسم.

ثم تفرّق الكتالوج بين ثلاثة بلدان، وتسجّل البطاقة ذلك لأنّه نادر في دار بهذا الصغر: خطّ في El Paraíso، مصنع Plasencia في هندوراس؛ وOceano يُمزج في MATASA لدى Quesada بجمهورية الدومينيكان؛ وبعد السنوات العشر التي احتُفل بها في أيّار/مايو 2019 بـAniversario Especial، جاءت Mexican Mermaid بألوان العلم المكسيكي.

آخر أثر علني من 2022: إصدار محدود من ألف سيجار لُفّت تلك السنة، تقول الدار إنّها تفرج عنها ألفًا في كلّ سنة طوال أربع سنين، حتى 2025. ولم تصفها صحافة المهنة منذئذٍ؛ أمّا موقع الدار فما زال قائمًا. كُتبت البطاقة بصيغة الحاضر لأنّ الخطّة المعلنة ما زالت جارية، وهي تقول ذلك.'
 WHERE `name` = 'La Sirena' AND SHA1(TRIM(`history`)) = 'd572be5f19886bf17f628c135ab45d94662a9732';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Sirena' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'd572be5f19886bf17f628c135ab45d94662a9732';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Unica' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '808df0ef8a1dd7d45dcba87a50e266028a40241d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Las Cabrillas' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'db78103126616256888f9e9188cca4067aff4fdc';
-- brands|Latitude Zero|history|ar — سيجارة بدل سيجار
UPDATE `brands` SET `history_ar` = 'Latitude Zero علامة ضمن محفظة Scandinavian Tobacco Group (STG)، بحسب Cigar Coop في 29 يونيو 2022؛ وتنسبها Blind Man''s Puff في الشهر نفسه إلى قسم STG للبيع عبر الإنترنت وبالتجزئة، وتكتب أنها لم تكن تُباع قبل ذلك إلا لدى Cigars International. ويُكرِّم اسمها مناطق زراعة التبغ في الإكوادور. ويتناول تقرير من يوليو 2014 سيجار Robusto بالفعل؛ ويقدّمها تقرير آخر، من مارس 2021، بوصفها وافدة جديدة إلى السوق.

وتُلَفّ لدى NACSA في إستيلي، بحسب Blind Man''s Puff، التي تسمّي Raul Disla مديرًا للمصنع ومبتكرًا لخط Signature؛ وتذكر Cigar Coop أن التبغ من Oliva Tobacco Company. وتوسّع Signature، المتاحة منذ 24 يونيو 2022 بحسب Stogiepress، الخط الأصلي: غلاف Sumatra من الإكوادور، ورباط habano نيكاراغوي، وحشوة من Habano نيكاراغوي وHabano دومينيكي وConnecticut Broadleaf، في Robusto وToro وGordo، مع Meier & Dutch للتوزيع الوطني.

وآخر إصدار لها هو Signature في يونيو 2022. وفي أكتوبر 2026، لا تزال CheapHumidors تعرض Latitude Zero Robusto، في علبة من عشرين سيجارًا، متاحة للشراء، وتصفها بقوة من متوسطة إلى كاملة.'
 WHERE `name` = 'Latitude Zero' AND SHA1(TRIM(`history`)) = 'd2f68f39b803e0ab6e2f817edb5794b0fe7f90af';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Latitude Zero' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'd2f68f39b803e0ab6e2f817edb5794b0fe7f90af';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Laura Chavin' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '243e5da845a5348ed62b6b54a89b1eabc2de100a';
-- brands|Le Fagot Cigar|history|ar — اسم العلامة مبتور؛ أسماء لاتينية
UPDATE `brands` SET `history_ar` = 'يلفّ Fagot Cigar سيجاره يدويًا في أبيدجان. تعلن الدار عن حرفة محلّية ومنتج خالٍ من أي إضافات، وتقدّم نفسها بوصفها عمل حرفيين شبّان.

تحمل التشكيلة ثلاثة أسماء: Robusto، وAboussouan، ومجموعة Fagorillos. ويصدر Aboussouan بأسماء أماكن إيفوارية: Le Poro في الشمال، وتييبيسو وجيكانو في الوسط.

الورقة إيفوارية. فمتاجر أبيدجان التي توزّع Fagot تصفه بغلاف من تييبيسو فوق غلاف داخلي وحشوة من ديدييفي، وهما مقاطعتان متجاورتان في منطقة بيلييه، وتفيد الصحافة المحلّية بأنّ الجني والتجفيف والتخمير تجري كلّها داخل البلد. أمّا الصنف فلا يُذكر في أي موضع.'
 WHERE `name` = 'Le Fagot Cigar' AND SHA1(TRIM(`history`)) = 'd4ac66b4ee1c2127f858778dfaccac180b486b38';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Le Fagot Cigar' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'd4ac66b4ee1c2127f858778dfaccac180b486b38';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'League of Fat Bastards' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '2c73f1c1b065a4993d986d328480f52325d2602c';
-- brands|Legado|history|ar — sous-cape لا رباط
UPDATE `brands` SET `history_ar` = 'Legado هي علامة Rorrey Fenty، شقيق المغنية Rihanna، أُسِّست في بربادوس، بحسب Square Mile؛ ويؤرّخها Neptune Cigars بعام 2017. ويُلفّ السيجار باليد في هندوراس، لدى CLE Cigar Company في دانلي، بحسب Neptune Cigars.

تجمع الخلطة بين غلاف كاميروني معتَّق لمدة عشر سنوات، وغلاف داخلي نيكاراغوي، وحشوة من جمهورية الدومينيكان مستمدة من وصفة عائلية، بحسب The Hollywood Reporter. وأُقيم الإطلاق الدولي في 10 أكتوبر 2019 في لندن، مع Fabergé وRome de Bellegarde، حول صناديق للمقتنين؛ وعُرض فيه إصداران مخصّصان لهذه المناسبة، هما El Unico وRenaissance، بحسب Square Mile.

وفي سبتمبر 2026، لا تزال Neptune Cigars تبيع العلامة، وتحدّد الدار موقع أنشطتها في هندوراس وبربادوس.'
 WHERE `name` = 'Legado' AND SHA1(TRIM(`history`)) = '1faaf7d138a9daf1413ae70057c9a5a57760c202';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Legado' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '1faaf7d138a9daf1413ae70057c9a5a57760c202';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Leite & Alves' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '24e78d471c32944cef8c91d7f4a7b6077b95de4e';
-- brands|Licenciados|history|ar — سيجارة بدل سيجار
UPDATE `brands` SET `history_ar` = 'Licenciados علامة يقول Oscar Boruchin، مالك Mike''s Cigars، وهو تاجر تجزئة في ميامي بيتش افتُتح عام 1950، في مقابلة من مارس-أبريل 1997، إنه مالكها. ويقول Boruchin إنه بدأ صنعها عام 1987 مع MATASA وManuel Quesada، وإنه ابتكر الاسم، وابتكر العلامة مع Quesada، وإنه أراد سيجارًا خفيفًا. وتتباين التواريخ: 1988 بحسب Premium Cigar of the Month Club، و1989 بحسب تاجر التجزئة jpb.ro؛ وتؤرّخ Wikipedia عقدًا لإنتاج العلامة بعام 1984، ويقول Manuel Quesada في 1998 إن Oscar وصل في 1984 أو 1985 وإنهم بدأوا يصنعون له السيجار.

المصنع هو MATASA، أي Manufactura de Tabacos S.A.، التي افتتحها Manuel Quesada ووالده وأخوه Alvaro في يونيو 1974 في سانتياغو، بحسب Premium Cigar Association في ديسمبر 2024: يُدرج مقال من شتاء 1994-1995 علامة Licenciados بين العلامات التي تنتجها MATASA، ويقول Manuel Quesada في 1998 إنه يصنعها لـMike''s، ويقول Premium Cigar of the Month Club إنها تُصنع في سانتياغو على يد Manuel Quesada.

يكتب Premium Cigar of the Month Club، دون تاريخ، إن العلامة موجودة بغلاف Connecticut shade وبغلاف broadleaf maduro، في أربعة عشر مقاسًا. وفي أكتوبر 2026، تُدرج Holt''s Cigar Co. علامة Licenciados في كتالوجها: غلاف Connecticut Shade بني فاتح فوق حشوة longfiller دومينيكية، بقوة خفيفة، في مقاسين هما Churchill (7 x 50) وToro (6 x 50)، في علب من خمسة وعشرين سيجارًا؛ ولدى Neptune Cigars صفحة Licenciados Cameroon. وفي أبريل 2013، أعلنت Mike''s Cigars عن مقاس صغير هو Licenciados Espresso.'
 WHERE `name` = 'Licenciados' AND SHA1(TRIM(`history`)) = 'd670661c3aada88b8520bedb958ea12badd8dc64';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Licenciados' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'd670661c3aada88b8520bedb958ea12badd8dc64';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Loaisiga' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '39557292fdb79ff62719541dbaa791193b497e30';
-- brands|Los Amigos|history|ar — amitié entre Saes et Lahsen
UPDATE `brands` SET `history_ar` = 'وُلدت Los Amigos عام 2024 من صداقة جمعت ثلاثة رجال قرّبهم التبغ خلال رحلات عمل: Pedro Ramos، وهو جنوب أفريقي يعمل في صناعة السيجار إلى جانب والده منذ سبعة عشر عامًا، والبرازيلي Walter Saes، والتشيلي Eduardo Lahsen، وهما صديقان منذ نحو عشر سنوات، كما تقول Wanted Online. أمضى الثلاثة نحو عام في زيارة المصانع قبل أن يستقروا على مصنع نيكاراغوي صغير، بحسب Ramos.

هذا المصنع هو Tabacalera Familia Disla S.A.، في إستيلي، الذي أسسه في العام نفسه Esteban Disla — العامل في التبغ منذ طفولته في جمهورية الدومينيكان — وDaniel Lance، كما تقول Cigar Coop. ويزرع مصنعهما ثمانين هكتارًا من الأراضي، ويلف أيضًا، من ضمن علامات أخرى، Domain Cigars، بحسب موقع المصنع.

في أغسطس 2026، دخلت Los Amigos السوق الأمريكية لأول مرة عبر Domain Distribution، وهي خدمة أطلقتها Domain Cigars، دار Disla وLance، مع مجموعة Small Batch 2025، كما تقول Cigar Dojo: Epiphany، غلاف Habano إكوادوري، بقياس Robusto (5 x 50)؛ The Sacred Blend، الغلاف نفسه، بقياس Grand Robusto (5 x 56)؛ Legacy of the Leaf، غلاف San Andrés مكسيكي، Box-pressed (4½ x 60)؛ وHedonism، غلاف Connecticut Broadleaf، بقياس Toro (6 x 52).'
 WHERE `name` = 'Los Amigos' AND SHA1(TRIM(`history`)) = 'ec4beec6fa43fd3cd103c2e1f64879a4a4a2b1d5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Los Amigos' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'ec4beec6fa43fd3cd103c2e1f64879a4a4a2b1d5';
-- brands|Luciano Cigars|history|ar — noms propres latins; tient=dirige
UPDATE `brands` SET `history_ar` = 'Luciano اسمُ برازيلي، والمصنع الذي يحمله كان أوّلًا مصنعَ كوبي. غادر Eradio Pichardo كوبا سنة 2005 بعد أن عمل لدى Habanos S.A.، وفتح في شباط/فبراير من السنة نفسها ورشة صغيرة في إستيلي، Dhatuey Tabacos. أمّا Luciano Meirelles فيأتي من ساو باولو ومن عالم المال — التأمين، وصندوق استثماري في الثانية والعشرين، ثم شركة استشارات سياسية في أمريكا اللاتينية. وErnesto Perez-Carrillo، الذي يحمل هذا الأطلس بطاقته، هو من عرّف أحدهما بالآخر سنة 2008. وفي كانون الثاني/يناير 2009 صار Meirelles شريكَ Pichardo، وأخذت الورشة اسم Tabacalera Pichardo.

كبُر المصنع دون أن تتغيّر طبيعته. في 2020 كان يضمّ أربعة وستين لافًّا وحازمًا، ومئة وثلاثة وعشرين موظّفًا مع الحقول، ويُخرج ما يزيد قليلًا على ثلاثة ملايين سيجار في السنة. ويلفّ لغيره، وليسوا بالصغار: فـCrowned Heads تصنع فيه سيجار Juarez، وOzgener Family Cigars — دار ابن مؤسّس CAO — صنعت فيه أولى سيجاراتها في عام 2022، قبل أن توكلها إلى Tabacalera La Alianza في تشرين الثاني/نوفمبر 2022.

جاءت العلامات الخاصة متأخّرة. وُلدت ACE Prime في كانون الثاني/يناير 2018 مع شريك ثالث من خارج المهنة: Tiago Splitter، لاعب كرة السلة البرازيلي الذي مرّ بدوري NBA وصار مدرّبًا. وصدرت الخطوط الأولى في تموز/يوليو 2019 — Pichardo Reserva Familiar وClassico باسم العائلة، وLuciano The Traveler وThe Dreamer باسم الشريك، وMXS لتوقيعات الرياضيين.

وفي أيلول/سبتمبر 2022 صارت ACE Prime هي Luciano Cigars، وأُعيدت تسمية المصنع نفسه Luciano Cigar Factory. حلّ اسم رجل المال محلّ اسم صانع السيجار على الباب. وتحتفظ هذه البطاقة بالاسمين، لأنّ هذه هي القصّة.

وفي نيسان/أبريل 2025 أسّست Luciano وEmpresa Madeirense de Tabacos — الشركة الأزورية التي تدير Fábrica de Tabaco Estrela التي يحمل هذا الأطلس بطاقتها — Constella Group التي تصير الشركة الأمّ لـLuciano؛ ويرأس Luciano Meirelles شركة Constella USA. وتلفّ Luciano Tabacos S.A. في إستيلي أيضًا لـPeter James Cigars وDalay Zigarren.'
 WHERE `name` = 'Luciano Cigars' AND SHA1(TRIM(`history`)) = '4f90738ce554277b4d33b3096d9343b6d56f40ea';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Luciano Cigars' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '4f90738ce554277b4d33b3096d9343b6d56f40ea';
-- brands|Malekö|history|ar — villes non traduites
UPDATE `brands` SET `history_ar` = 'Malekö علامة كوستاريكية يُكرّم اسمها شعب ماليكو (Maleku)، وهو مجموعة من السكان الأصليين لغابات كوستاريكا المدارية، كما تقول Casagranda. وقد حقق خطها الأول، Malekö Classic، نجاحًا في الشرق الأوسط، ولا سيما في لبنان؛ وتخلفه Custom Blend في عام 2015، بغلاف خارجي مائل إلى الحمرة ومقاسات جديدة وأشكال حديثة، كما تقول Casagranda و Smokersplanet.de.

صاحبة العلامة هي Tabacos de Costa Rica S.A.، وعنوانها في سانتياغو دي بوريسكال: وبحسب Trademarkia، يسجّل السجل الأمريكي للعلامات التجارية هناك إيداعًا في 25 مارس 2020، وتسجيلًا في 17 أغسطس 2021، وأول استخدام مُصرَّح به في 27 يوليو 2016. ويذكر Cigarworld.de الشركة نفسها بوصفها الجهة المصنِّعة، وتصنّف Casagranda علامة Malekö تحت قسم Tabacos de Costa Rica الخاص بها، وتصفه بأنه مصنع عائلي أُسّس عام 1997 في منطقة بوريسكال الجبلية. ويسمّي Cigar Coop في عام 2019 Andrés León مالكًا ومشغّلًا لمصنع Tabacos de Costa Rica في سانتياغو دي بوريسكال؛ وتكتب Casdagli أن تعاونها مع Tabacos de Costa Rica SA، التي كانت تُعرف حينها باسم Vegas Santiago، بدأ في عام 2012.

في أكتوبر 2026، تعرض Casagranda تشكيلة Custom Blend في ثلاثة مقاسات وفي علب من الخشب المطلي بالورنيش؛ أما Cigarworld.de، الذي يسمّي Casagranda Cigars GmbH في إيسلينغن مستوردًا، فيُدرجها في كتالوجه، ملفوفة Totalmente a mano باستخدام longfiller، ويظهر فيه Emperador منذ 11 أغسطس 2025. ويخصص Smokersplanet.de لها مقالًا في 26 أغسطس 2025.'
 WHERE `name` = 'Malekö' AND SHA1(TRIM(`history`)) = 'f1400f2ea1a6e8d33f924a90bc5fb69998322ba1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Malekö' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'f1400f2ea1a6e8d33f924a90bc5fb69998322ba1';
-- brands|Mara|history|ar — سيجارة au lieu de cigare; حتى
UPDATE `brands` SET `history_ar` = 'وُلد Ricardo Vasquez في كوبا، ونشأ بين حقول التبغ، وتعلّم المهنة على يد مزارعي البلاد قبل أن يؤسّس Mara Cigars، بحسب Cigarworld.de؛ ولا تحدّد الدار تاريخ هذا التأسيس. تُلفّ العلامة سيجارها في نيكاراغوا. وتنسب Cigarworld.de سلسلة Marabunta إلى مصنع Oveja Negra في إستيلي، الذي يديره James وAngela Brown؛ غير أن Oveja Negra لا تذكر Mara ضمن العلامات التي تلفّها، كما أن الدار لا تكشف عن اسم مصنعها.

في سبتمبر 2026، تضم التشكيلة أربع سلسلات: Marabunta، بغلاف وغلاف داخلي وحشوة من نيكاراغوا؛ وEl Sicario، بغلاف نيكاراغوي من نوع maduro، ويُدخَّن box-pressed؛ وEl Corrupto، بغلاف Connecticut مزروع في نيكاراغوا فوق حشوة نيكاراغوية؛ وEl Hurón، التي وصلت إلى ألمانيا في 28 مايو 2024، بغلاف إكوادوري من نوع sungrown. وتستعير أسماء هذه التشكيلة مفردات من عالم العصابات المنظمة، بحسب Cigarworld.de.'
 WHERE `name` = 'Mara' AND SHA1(TRIM(`history`)) = '56cf966fe06231939633f5a6b73a3adbc3e82f53';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Mara' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '56cf966fe06231939633f5a6b73a3adbc3e82f53';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Marca Fina' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '0a4b651c395ebee973c7abd88e788decb6d65565';
-- brands|Mata Hari|history|ar — سجائر; noms latins; San Andrés
UPDATE `brands` SET `history_ar` = 'وُلدت Monsoon Cigar Company، بحسب الدار، من لقاء بين Sonny Suciawan وSebastian في مزرعة بمقاطعة براندنبورغ الألمانية؛ وأطلقت علامتها الأولى، Mata Hari، سنة 2024، في ألمانيا أولًا. والاسم مأخوذ من الراقصة الهولندية التي أُعدمت سنة 1917 بتهمة التجسس؛ ويقول Suciawan إنه يريد التعريف بالسيجار الإندونيسي في الأسواق الدولية، بما فيها ألمانيا والولايات المتحدة.

لا تملك Monsoon مصنعًا خاصًا بها، ولا تكشف عن اسم المصنع الذي يُلفّ سيجارها. وتُعَدّ خلطاتها في جيمبر، شرق جاوة، بالتعاون مع PT Besuki Raya Cigar — الدار التي تقف خلف El Gaucho، الفرع التابع لمجموعة Mangli Djaya Raya منذ 2020 — حيث يقول Suciawan إنه أشرف على جلسات تذوّق واختيار للورق. ويضمّ الكتالوج ثلاثة أصناف: Courtisane، المصنوعة بالكامل من تبغ إندونيسي بحسب الدار؛ وJava Exotica، من تبغ دومينيكي وبرازيلي تحت غلاف جاوي يعود أول قطاف له إلى 2020؛ وLimited Edition 2024، من تبغ برازيلي ودومينيكي وإندونيسي تحت غلاف San Andrés مكسيكي.

قُدِّمت العلامة في برلين في يونيو 2024، ثم في جاكرتا وباندونغ في نوفمبر 2024؛ وما زال Suciawan يتحدّث عنها في مقابلة أُجريت في فبراير 2025. وفي سبتمبر 2026، لا يزال موقع Cigarworld.de يعرض الأصناف الثلاثة في كتالوجه.'
 WHERE `name` = 'Mata Hari' AND SHA1(TRIM(`history`)) = '26ab6465912172034ad8d5c7fce1ffda92b7f1fe';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Mata Hari' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '26ab6465912172034ad8d5c7fce1ffda92b7f1fe';
-- brands|Matacan|history|ar — marques en latin; markdown ajouté
UPDATE `brands` SET `history_ar` = 'Matacan هو السيجار الذي يدخّنه وادي San Andrés نفسه. مصنوع بالكامل من تبغ مكسيكي — حشوة ورابطة وغلاف — وهو «بورو» بالمعنى الحرفي، يُباع في حِزَم لا في صناديق، وبسعر يضعه خارج منافسة العلامات الكبرى.

ويخرج من المصنع نفسه الذي يخرج منه Te Amo: Nueva Matacapan Tabacos، المملوك لعائلة Turrent، العائلة التي تهيمن على التبغ المكسيكي منذ أربعة أجيال. وهكذا تضمّ صفحة المكسيك أربعة مداخل مرتبطة بهذه العائلة وحدها — Te Amo وSanta Clara 1830 وCasa Turrent وMatacan. وليس هذا عيباً في الأطلس: إنه واقع بلد تمسك فيه عائلة واحدة بالأرض.

مراجعه تحمل أرقاماً لا أسماء، وهذا يقول ما يكفي عن غايته: ليست علامة وجاهة بل تشكيلة مقاسات، تختار فيها رقماً بحسب الوقت المتاح لك. والعرض في حدّه الأدنى، وغالباً بلا شريط.

أمّا المذاق فمفيد: غلاف San Andrés دون التبغ النيكاراغوي أو الدومينيكي الذي يرافقه عادةً — أي الأرض المكسيكية وحدها، صريحة وخشنة قليلاً. ولفهم ما تقدّمه المكسيك فعلاً لخلطات القارّة، فهذه أوضح عيّنة ممكنة.'
 WHERE `name` = 'Matacan' AND SHA1(TRIM(`history`)) = '4fade9be3fe99980e47995d7afbe678e5f432dc3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Matacan' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '4fade9be3fe99980e47995d7afbe678e5f432dc3';
-- brands|May's Cigars|history|ar — سيجارات; torcedora non traduit
UPDATE `brands` SET `history_ar` = 'وُلدت Maykelis Ketnath في كوبا، وتدرّبت هناك في تسعينيات القرن العشرين لتصبح لافّة سيجار في مصنع Partagás بهافانا، بحسب Berichteaktuell.de؛ وتحسب لها Noblego.de ما يزيد على عشرين عامًا من الخبرة في عالم السيجار. استقرت في أوروبا في مطلع الألفينيات، وتعاونت مع دار Villiger، حيث قدّمت خبرتها في عدد من الفعاليات، قبل أن تؤسّس May''s Cigars عام 2018 في شتوتغارت؛ وفي الوقت نفسه، نالت شهادة في صياغة الذهب من مدرسة بفورتسهايم، وأطلقت خط مجوهرات باسم MANDORO. يُلفّ سيجار May''s في نيكاراغوا؛ ولا تكشف الدار عن اسم مصنعها.

حتى سبتمبر 2026، يضم الكتالوج طرازين. تبلغ Short Corona طول 114 mm بمقاس cepo 44، وتحمل غلافًا إكوادوريًا من صنف Habano 2000 فوق غلاف داخلي وحشوة من نيكاراغوا. أما Liga 1، بمقاس Robusto (127 mm، cepo 50)، فتستخدم الغلاف الإكوادوري نفسه فوق غلاف داخلي من بيرو وحشوة نيكاراغوية. وتُقدَّم كلتاهما بقوة mild-medium، بحسب La Casa del Tabaco.'
 WHERE `name` = 'May''s Cigars' AND SHA1(TRIM(`history`)) = 'e663ea10c8b7ce0b1584d5762199505641b8b1fe';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'May''s Cigars' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'e663ea10c8b7ce0b1584d5762199505641b8b1fe';
-- brands|Maya Selva Cigars|history|ar — noms propres en latin
UPDATE `brands` SET `history_ar` = 'نشأت Maya Selva في هندوراس لأمّ فرنسية وأب هندوراسي. غادرت للدراسة في فرنسا في السادسة عشرة، وصارت مهندسة، ونالت الماجستير في الولايات المتحدة.

وفي 1993 التقت Nestor Plasencia — المزارع والصانع — وأخبرته بفكرتها: أن تحمل سيجارًا هندوراسيًّا جيّدًا إلى السوق الفرنسية. فصار معلّمها. وأسّست دارها عام 1995 وأنشأت Flor de Selva، التي أُطلقت في فرنسا قبل أن تنتشر.

وقد أسّست دارها في صناعة تُعدّ فيها الدور التي أسّستها نساء على الأصابع.'
 WHERE `name` = 'Maya Selva Cigars' AND SHA1(TRIM(`history`)) = '2e7dc979840de4fc18b42e99e1ad7d1498da1f6b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Maya Selva Cigars' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '2e7dc979840de4fc18b42e99e1ad7d1498da1f6b';
-- brands|Meerapfel|history|ar — formes interdites; noms latins
UPDATE `brands` SET `history_ar` = 'غلاف الكاميرون من الأوراق الأشدّ طلباً في المهنة، والكاميرون لا توجد في عالم السيجار إلا به: مادة أوّلية تُباع لبيوت تلفّها في مكان آخر. وMeerapfel ليست استثناءً.

تقف عائلة Meerapfel في قلب هذه الحكاية. فهم تجّار تبغ منذ 1876، من أصل ألماني، بنوا سمعتهم على انتقاء الورقة الكاميرونية والمتاجرة بها حتى صاروا اسمها المرجعي. ويُنسب إلى Richard Meerapfel، المتوفّى سنة 2003، أنه أنقذ هذا التبغ من الاندثار في زمن لم يعد أحد يريده.

وحين أطلقت العائلة سيجارها الخاص، فعلت ذلك بأمتن حجّة ممكنة — لا أحد أدرى بهذا الغلاف منها — لكنها تلفّه في الجمهورية الدومينيكية. وما تقدّمه الكاميرون هنا هو إذاً أبرز ورقة في الخلطة، ولا شيء غير ذلك.

لذلك تظهر الدار بين السيجار ذي الغلاف الكاميروني، إلى جانب CAO Cameroon وغيره. لا إنتاج فاخر في الكاميرون، ولا يستطيع الأطلس أن يخترع لها واحداً.'
 WHERE `name` = 'Meerapfel' AND SHA1(TRIM(`history`)) = '34c160fd3609233ec06f3f759734e97fa9888291';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Meerapfel' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '34c160fd3609233ec06f3f759734e97fa9888291';
-- brands|Menendez Amerino|history|ar — nom altéré; noms latins
UPDATE `brands` SET `history_ar` = 'دارٌ وُلدت من منفًى ومن شراكة. كانت عائلة Menéndez تصنع في كوبا Montecristo وH. Upmann؛ ثم تفرّقت بعد 1960. وكان أحد أفرادها يشتري ورق ريكونكافو باهيا من مزارع، هو Mário Amerino da Silva Portugal. وفي أواخر السبعينيات أقام الرجلان مصنعًا معًا.

يقع المصنع في ساو غونسالو دوس كامبوس بولاية باهيا — لا في كروز داس ألماس حيث تنمو «ماتا فينا» التي يستعملها. والتمييز مهمّ: فمكان الزراعة ليس مكان الصناعة.

وكلّ شيء هناك يُصنع باليد. تصف الدار طريقتها بأنّها حرفية بالكامل: كلّ ورقة تُنتقى وتُعالَج وتُلَفّ بأيدي حِرَفيّات.

ومن هذه الورشة يخرج Alonso Menendez المُنشأ عام 1980، وDona Flor التي أُطلقت عام 1982 — ولها بطاقتها في هذا الأطلس — وAlonso Del Patron الصادر عام 2018. وهو التقسيم نفسه القائم بين Tabacalera Palma وAging Room في الجمهورية الدومينيكية: المصنع وعلامته كلاهما هنا، لأنّهما ليسا شيئًا واحدًا.

تاريخان لتأسيس واحد: 1977 في هذا الأطلس وعند الدار، و1978 في تحقيق سنة 2017؛ تكتب البطاقة الاثنين. قاست الصحافة الاقتصادية سنة 2012 الهبوط: خمسة عشر ألف سيجار في اليوم أواخر التسعينيات، وألف وخمسمئة سنة 2012، مع أربعمئة ألف سيجار صغير في الشهر؛ أربعمئة موظّف يومًا ما، ومئة وخمسون قبل ثلاث سنوات، وسبعون حينها، ما يزيد على 90 % منهم نساء — وما زالت كبرى مصانع البلاد. وسنة 2026 يجلس نائب رئيسها José Henrique Barreto في Apcab، الجمعية التي تحمل تسمية منشأ سيجار ريكونكافو.'
 WHERE `name` = 'Menendez Amerino' AND SHA1(TRIM(`history`)) = '6f824f644902005914638bd5ab8151c401114b56';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Menendez Amerino' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '6f824f644902005914638bd5ab8151c401114b56';
-- brands|Miami Cigar & Co.|history|ar — forme interdite; noms latins
UPDATE `brands` SET `history_ar` = 'Miami Cigar & Co. تاجرٌ لم يملك مصنعًا قطّ، ويصنّفه هذا الأطلس حيث يُلفّ الخطّ الذي يحمل اسم المؤسّس، Nestor Miranda: إستيلي، لدى My Father. والعدد لا يحسم الأمر: فمن بين العلامات الأربع التي تقدّمها الدار في تشرين الأول/أكتوبر 2026، يُلفّ Nestor Miranda وDon Lino (سلسلة Africa، لدى A.J. Fernandez) في نيكاراغوا، وTatiana وOutcast في جمهورية الدومينيكان — وTatiana، التي تصفها Cigar Coop في تموز/يوليو 2023 بأنها العلامة الأساسية للدار، لدى La Aurora، بحسب ما تقول Cigar Coop عن Delights في أيار/مايو 2024 وNeptune Cigar عن البقية؛ أمّا Outcast فلا مصنع مسمّى لها — ولا تعطي أي صفحة حجمًا للإنتاج بحسب المصنع. أمّا بقيّة القصّة فتجري بين هندوراس وجمهورية الدومينيكان، ولا بدّ من روايتها لأنّها تفسّر السبب.

Nestor Miranda كوبي. قضى خمسًا وعشرين سنة في المشروبات الروحية — خمس عشرة في Southern Wine & Spirits وعشرًا في Seagram — وزوجته Mariana هي التي أدارت شركة السيجار في بداياتها سنة 1989 بينما كان لا يزال يبيع الكحول. السنة الأولى: أربعون ألف سيجار وُزّعت، وثمانون ألفًا صُنعت في مصنع U.S. Tobacco بهندوراس — المصنع الذي كان يصنع Don Tomás، الذي يحمل هذا الأطلس بطاقته. كانت العلامة تُسمّى Don Lino، على اسم رجل في المصنع. وقفزت من مليون ونصف سيجار سنة 1994 إلى اثني عشر مليونًا سنة 1996، تحملها الحمّى الأمريكية.

ثم توقّفت UST عن التوريد في تشرين الثاني/نوفمبر 1996. واختفت Don Lino من السوق سنتين. وGuillermo León، من La Aurora، هو من أنقذها: استُؤنف الإنتاج في مصنعه بجمهورية الدومينيكان في مطلع 1999. وكانت Miami Cigar توزّع La Aurora في الولايات المتحدة منذ أواخر الثمانينيات — جاءت العلاقة عبر لافّ — حتى آذار/مارس 2023: ففي تشرين الثاني/نوفمبر 2022 أعلنت La Aurora أنها ستتولّى بنفسها توزيعها في الولايات المتحدة عبر شركة تابعة، La Aurora USA، اعتبارًا من 1 نيسان/أبريل 2023، ولم تعد Miami Cigar موزّعها. وترك Miranda المشروبات الروحية سنة 1995 ليتفرّغ لذلك وحده.

أمّا Nestor Miranda Collection، الخطّ الذي يحمل اسم المؤسّس، فيُصنع في مكان آخر: لدى My Father، مصنع عائلة García في إستيلي. وخرجت الذكرى الخامسة والعشرون، سنة 2014، من المصنعين معًا، La Aurora وMy Father. وقالت الدار إنها توزّع ما يزيد على عشرين مليون سيجار في السنة لمجموعة من الصانعين، ويحملها هذا الأطلس على ما هي: دارٌ من ميامي نجت من فقدان مصنعها بأن وجدت مصنعين آخرين — وتسمّيهما كليهما.'
 WHERE `name` = 'Miami Cigar & Co.' AND SHA1(TRIM(`history`)) = '3a9c56a2e4eee569f41c7f1e92fcde98420828b3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Miami Cigar & Co.' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '3a9c56a2e4eee569f41c7f1e92fcde98420828b3';
-- brands|Micallef|history|ar — Al/آل confusion; noms latins; San Andrés
UPDATE `brands` SET `history_ar` = 'تبدأ Micallef بعطل سيارة. فقد التقى Al Micallef، وهو رجل أعمال من تكساس، بالأخوين Joel وEdel Gómez Sánchez في صالة سيجار بتكساس كانا قد توقّفا فيها بعد أن تعطّلت سيارتهما. ذاق ما يلفّانه، فطلب إليهما أن يؤلّفا له سيجارًا.

ومن هناك وُلدت عام 2016 دار برأسين: الاسم والإمكانات من جهة، وثلاثة أجيال من الحرفة من جهة أخرى.

فعائلة Gómez Sánchez من كوبا، ومسارها يُقرأ في هذا الأطلس. كان Pedro F. Gómez يلفّ في مصنع H. Upmann بهافانا. وعملت كنّته في Partagás. وتعلّم حفيداه Joel وEdel في مصانع كوبية قبل أن يديرا مصنعهما في إستيلي — مصنع 1934، حيث يُصنع كلّ سيجار Micallef.

ولهذا أيضًا صُنّفت هذه البطاقة نيكاراغوية لا هندوراسية كما تُصنَّف أحيانًا: فهندوراس لا تظهر إلا في الحشوة. تحمل La Leyenda غلاف Habano إكوادوريًا ورابطًا نيكاراغويًا وحشوة من الجمهورية الدومينيكية وهندوراس ونيكاراغوا؛ أمّا Reserva Limitada Privada فتأخذ غلاف San Andrés المكسيكي وتذهب في طلب التبغ حتى البيرو.'
 WHERE `name` = 'Micallef' AND SHA1(TRIM(`history`)) = '71b0838283eb318dd2d3e5602a355de56a3dc354';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Micallef' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '71b0838283eb318dd2d3e5602a355de56a3dc354';
-- brands|Monte Pascoal|history|ar — noms de personnes en latin
UPDATE `brands` SET `history_ar` = 'Monte Pascoal علامة Tabacos Mata Fina، المصنع الذي أسّسه Lorenzo Orsi سنة 2007 في كروز داس ألماس، في قلب ريكونكافو، بفكرة سيجار برازيلي راقٍ لا يشبه شيئًا آخر لأنّه لا يأتي إلّا من هنا: تبغ وطني مئة بالمئة، ماتا فينا للعطر وماتا نورتي للقوّة، ولكلّ قياس جرعته الخاصّة من الاثنين. الاسم اسم الجبل الذي أبصره Cabral سنة 1500، والعلب تروي اكتشاف البرازيل؛ أمّا المواد المطبوعة فتُطبع في هولندا، كما تقول صحافة السيجار.

كلّ شيء يُلفّ يدويًّا بأوراق كاملة؛ ويجتاز كلّ سيجار فحصًا للسحب والإتقان ولون الغلاف، ثمّ ينتظر ثلاثة شهور على الأقلّ قبل البيع. ستّة قياسات، في علب من خمسة وعشرين ومن عشرة.

يرأس Lorenzo Orsi جمعية Apcab، جمعية منتجي السيجار الحرفي في البرازيل، التي كانت في يوليو 2026 تحمل إلى معهد INPI تسمية منشأ لتبغ ماتا فينا والسيجار الحرفي في ريكونكافو — أربعة صانعين، يقول المشروع، لنحو 85 % من القطاع الحرفي في البلاد.'
 WHERE `name` = 'Monte Pascoal' AND SHA1(TRIM(`history`)) = '837eb0170353a2f11534746d023e841653d6b3b8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Monte Pascoal' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '837eb0170353a2f11534746d023e841653d6b3b8';
-- brands|Montealto|history|ar — noms latins; glose ajoutée
UPDATE `brands` SET `history_ar` = 'Montealto هي العلامة الفاخرة لأقدم مصنع سيجار لا يزال يعمل في جزر الكناري. أنشأه Ernesto González Pérez في لاس بويلتاس ببلدية بريينيا ألتا. تؤرّخ الصحافة الكناريّة التأسيس بعام 1917، بينما تعلن الدار 1918؛ والفارق لم يُحسم. وفي الجزيرة لا يسمّيه أحد إلا «la Fábrica».

كان González يلفّ سيجاره خلال الأسبوع، ثم يربط حزمه على حمّالة درّاجته ويبيعها في أنحاء الجزيرة يومَي السبت والأحد. وفي خمسينيات القرن الماضي كانت الورشة تضمّ ستّين عاملًا.

أمّا اليوم فنحو عشرة. ينتج فيها Fabrizio Gentile وMiguel Ángel Pérez González يدويًا وآليًا — قرابة ثلاثمئة سيجار ملفوف يوميًا — تحت علامات Montealto، وDe Lucía، وPremium، وCasa Vieja، وRica Hoja، وPrimorosa. وتزرع الدار خمسة آلاف شتلة وتكمّل الباقي بتبغ من كوبا والجمهورية الدومينيكية ونيكاراغوا.

وانتبه إلى تشابه الاسمين، فهو يضلّل حتى أدلّة الشركات: Compañía Insular de Tabaco de La Palma ليست Compañía Insular Tabacalera التي افتتحها Benjamín Menéndez عام 1961 في لاس بالماس دي غران كناريا لصناعة Montecruz. شركتان، وجزيرتان، وأربعون عامًا من الفارق.'
 WHERE `name` = 'Montealto' AND SHA1(TRIM(`history`)) = '243bcb8829c939bc5ba7596c3ae60038b3aaed58';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Montealto' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '243bcb8829c939bc5ba7596c3ae60038b3aaed58';
-- brands|Montecristo Dominicain|history|ar — forme interdite; marque latine
UPDATE `brands` SET `history_ar` = 'هناك Montecristo اثنان، ولا يدري كثير من المدخّنين بذلك. فالعلامة التي وُلدت في هافانا سنة 1935 جرى تأميمها سنة 1960؛ فغادر أصحابها الجزيرة واستأنفوا الاسم خارج كوبا. ومنذ ذلك الحين يتعايش Montecristo كوبي وآخر غير كوبي، يُباعان في سوقين مختلفتين — الأول في كل مكان عدا الولايات المتحدة، والثاني في الولايات المتحدة. الاسم نفسه، والشريط يكاد يكون نفسه، وسيجاران لا صلة بينهما.

يُلفّ Montecristo غير الكوبي في لا رومانا، داخل مصنع لا رومانا، أحد أكبر مصانع القطاع. والحجم يغيّر كل شيء: فحيث ينتج بيت صغير بضع مئات الآلاف سنوياً، يعدّها هذا المصنع بعشرات الملايين، بانتظام تصنيعٍ هو بحدّ ذاته إنجاز تقني.

أمّا الطابع فيتبع التقليد الدومينيكي — خفيف إلى متوسط، قشدي، بغلاف فاتح — حيث الكوبي أقوى وأشدّ ترابية. وليست هذه نسخة فاشلة: بل قراءة أخرى للاسم نفسه، صُنعت لذائقة أخرى.'
 WHERE `name` = 'Montecristo Dominicain' AND SHA1(TRIM(`history`)) = 'a5be5a702a89e029c75faceab310b2f8042cfee4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Montecristo Dominicain' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'a5be5a702a89e029c75faceab310b2f8042cfee4';
-- brands|Montecruz|history|ar — marques et personnes en latin
UPDATE `brands` SET `history_ar` = 'Montecruz سيجار رجل يبدأ من جديد بعد أن فقد كل شيء. ففي أيلول/سبتمبر 1960، انتزع التأميم الكوبي من عائلة Menéndez علامة Montecristo التي أوصلوها إلى القمّة. وغادرت العائلة الجزيرة بلا شيء.

اختارت جزر الكناري — وليس هذا الاختيار مصادفة جغرافية. فالأرخبيل موطن قسم كبير من الفلّاحين الذين زرعوا التبغ الكوبي: إذ استوطن الكناريون Vuelta Abajo، وحافظت العائلات التبغية في كوبا على صلات هناك قرنين من الزمن. والعودة إلى الكناري كانت عودة إلى البيت.

افتتح Benjamín Menéndez سنة 1961 Compañía Insular Tabacalera في لاس بالماس وأطلق Montecruz — اسمٌ قريب إلى هذا الحدّ من الاسم الذي فقده للتوّ، فلا شكّ في النيّة. كُسي السيجار بغلاف كاميروني داكن خشن الملمس، أثبت أنه بديل مقنع لورقة الهافانا وأسهم في ترسيخها في الذائقة الأميركية.

عاشت Montecruz أزهى أيامها في السوق الأميركية في الستينيات والسبعينيات. وانتقل الإنتاج في النهاية إلى الجمهورية الدومينيكية، كما جرى لكل ما وُلد تقريباً في الكناري.'
 WHERE `name` = 'Montecruz' AND SHA1(TRIM(`history`)) = 'd5e13e299385b68c7fbe053e2924c6ef02817d0b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Montecruz' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'd5e13e299385b68c7fbe053e2924c6ef02817d0b';
-- brands|MOSI|history|ar — سيجارات; nom en latin
UPDATE `brands` SET `history_ar` = 'MOSI — Moderno Opificio del Sigaro Italiano — الدار التي كسرت، في فينيتو، الاحتكار التوسكاني للسيجار الإيطالي. أسّسها Cesare Pietrella سنة 2013؛ وبدأ مصنع أورساغو، في مقاطعة تريفيزو، الإنتاج في 3 شباط/فبراير 2014 بعد اجتياز الإجراءات — لأنّ التبغ في إيطاليا شأنُ دولة، وصنع سيجار خارج Toscano ليس بديهيًّا. علامتها، Ambasciator Italico، من كنتاكي إيطالي وأمريكي.

لا يحمل هذا الأطلس ما تصنعه الدار في الغالب: سيجار آلي الصنع على التقليد الإيطالي. بل يحمل Ambasciator Italico Storico، المُلفوف يدويًّا، بحشوة طويلة من كنتاكي إيطالي من فينيتو وتوسكانا، تُنزع عروق أوراقه باليد — هذا الخطّ، وحده، يستحقّ البطاقة، كما يستحقّ المُلفوف يدويًّا بطاقة Villiger أو Pogar.

وفي تشرين الثاني/نوفمبر 2021 أخذت Scandinavian Tobacco Group أغلبية MOSI: المجموعة الدنماركية التي تملك في هذا الأطلس General Cigar وBolívar Honduras وBalmoral وAgio اشترت لنفسها السيجار الإيطالي خارج الاحتكار. تقول البطاقة ذلك لأنّها صارت الآن الشركة الأمّ نفسها لنصف آلات أوروبا.'
 WHERE `name` = 'MOSI' AND SHA1(TRIM(`history`)) = '1e7e5731240b58985d8ebd6b36f992af5674061a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'MOSI' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '1e7e5731240b58985d8ebd6b36f992af5674061a';
-- brands|Mosi Oa Tunya|history|ar — noms de personnes en latin
UPDATE `brands` SET `history_ar` = 'Mosi Oa Tunya — اسم شلالات فيكتوريا بلغة اللوزي، الدخان الذي يرعد — أوّل مصنع سيجار ملفوف يدويًّا في زيمبابوي، كما تقول الدار وصحافة البلد. وُلد من حديث بين قارّتين: Shepherd Mafundikwa، وهو لا يدخّن، قضى خمسة عشر عامًا في شركة طيران أمريكية ولاحظ كم من صالونات السيجار تُفتح في الولايات المتحدة، في بلد لا يلفّ شيئًا بينما بلده يزرع التبغ منذ قرن. عاد، وأسّس الشركة سنة 2019 مع Loy Veal، وذهب ليرى مصانع في كوبا وجمهورية الدومينيكان، وعاد منها بمعلّم دومينيكي، Elias López.

المصنع في غرانيتسايد، المنطقة الصناعية في هراري. سبع نساء تعلّمن اللفّ هناك بحلول يوليو 2020، وعشر سنة 2022؛ جعلته الدار مشروع عمل نسائي، وقالت إحداهنّ للصحافة إنّها كانت بلا عمل من قبل. التبغ بيرلي مجفّف بالهواء — الحصّة الداكنة الصغيرة من بلد ينتج فرجينيا السجائر في المقام الأوّل — والغلاف مستورد لأنّ الورقة المحلية تنكسر: 95 % محلي، 5 % من الخارج، وهدف معلن بالوصول إلى الكلّ. مئتا سيجار في اليوم في البداية، خمسة قياسات، وأغلفة هابانو أو سومطرة أو كونيكتيكت بحسب الخط.

تختلف التواريخ من صحيفة إلى أخرى — انطلاق في مارس 2020 عند واحدة، وفي مايو عند أخرى، وإنتاج معلن في يوليو؛ تكتب البطاقة الثلاثة. سنة 2022 قالت الدار إنّها تصدّر إلى البرازيل ورومانيا وجنوب أفريقيا والولايات المتحدة وأنغولا والكونغو ودبي.'
 WHERE `name` = 'Mosi Oa Tunya' AND SHA1(TRIM(`history`)) = '0df041d09e027dc6a3f8f5644dd800900b050913';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Mosi Oa Tunya' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '0df041d09e027dc6a3f8f5644dd800900b050913';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Mustique' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '4901b2a86728f2c265580adc3ede1fc107311eca';
-- brands|NACSA|history|ar — réassembler≠مزج; noms latins
UPDATE `brands` SET `history_ar` = 'NACSA مصنعٌ قبل أن تكون علامة، وهكذا يكتبها هذا الأطلس. وُلدت سنة 1995 في إستيلي باسم Nicaragua American Tobacco S.A. — NATSA — أطلقها Juan Francisco Bermejo مع شركاء منهم Lew Rothman، صاحب JR Cigar: لسنوات لفّت حصرًا لهذا التاجر سيجارات رخيصة، منها Quorum، إلى أن فتحت J.C. Newman مصنع PENSA سنة 2011 واستعادت الخطّ. يروي هذا الأطلس PENSA في بطاقة J.C. Newman.

جاء المنعطف نحو 2015: مبنًى جديد أسفل الشارع نفسه، وقرارُ صنع الفاخر. استقدم المصنع Raúl Disla للإنتاج واجتذب زبائن — Asylum التي يحمل هذا الأطلس بطاقتها، وMi Querida لـSteve Saka، ثم Patina سنة 2019. وهو مملوك جزئيًّا لـOliva Tobacco Company، سمسار الأوراق في تامبا الذي أسّسه Angel Oliva Sr. في الثلاثينيات ويزرع في Finca Guadalupe المجاورة — دارٌ لا صلة لها بـOliva Cigars، والخلط شائع بما يكفي لتنبّه إليه الصحافة في كلّ مرّة.

وفي كانون الثاني/يناير 2016 جاء Larry Palombo، أربع وأربعون سنة في المهنة ونائب رئيس سابق للتبغ في Altadis USA، ليجمع من جديد العلامات المسجّلة التي كان المصنع يحتفظ بها في درج — Red Dot وVillar y Villar وLa Rosa Especial وAristoff — لطرحها في السوق بأتبغة أوليفا. من أجل هذه العلامات لـNACSA بطاقةٌ هنا، لا مجرّد مكان في بطاقات الآخرين.'
 WHERE `name` = 'NACSA' AND SHA1(TRIM(`history`)) = '961dad913e81f517052fe284217207ca50b6abc3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'NACSA' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '961dad913e81f517052fe284217207ca50b6abc3';
-- brands|Nat Sherman|history|ar — noms latins, ajout, superlatif
UPDATE `brands` SET `history_ar` = 'كانت Nat Sherman عنوانًا قبل أن تكون علامة. افتتح Nathan Sherman متجر تبغ في نيويورك سنة 1930؛ ثم أقام خلفاؤه الدار في الجادة الخامسة، في مبنى من ثلاثة طوابق بصالونات تدخين، صار عقودًا ملتقى مدخّني مانهاتن.

أمّا السيجار نفسه فلم يُلفّ يومًا في نيويورك: كانت الدار تؤلّف سلاسلها في الجمهورية الدومينيكية ونيكاراغوا، باسمها ووفق مواصفاتها. إنه نموذج تاجر التجزئة الذي صار علامة، وقد أنتج بعضًا من أدقّ السلاسل صنعًا في السوق الأمريكية — Timeless وMetropolitan وSterling.

أُغلق متجر الجادة الخامسة سنة 2020، وأوقفت المجموعة المالكة العلامة بعد ذلك بقليل. وأعاد جزء من الفريق إطلاق الخلطات باسم آخر، وهو أمر نادر الحدوث: فالعادة أن تختفي العلامة المهجورة ومعها وصفاتها.

يحتفظ بها الأطلس لِما تمثّله — دار أمريكية كان مكانها يساوي منتجها، في مهنة يجري فيها كل شيء تقريبًا في مكان آخر.'
 WHERE `name` = 'Nat Sherman' AND SHA1(TRIM(`history`)) = '61476950ad1cb60274c3c3af516b98a9e5c7cdb6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Nat Sherman' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '61476950ad1cb60274c3c3af516b98a9e5c7cdb6';
-- brands|Nicoya|history|ar — noms propres en latin
UPDATE `brands` SET `history_ar` = 'Nicoya علامة أسترالية لا تحتوي غرامًا واحدًا من التبغ الأسترالي — ولا يمكن أن تحتوي. فقد توقّفت الزراعة التجارية للتبغ في أستراليا في أكتوبر 2006، في ميرتلفورد شمال شرقي فيكتوريا، حيث كان يأتي منها خمسة وتسعون في المئة من المحصول الوطني. وهي محظورة هناك منذ ذلك الحين، ولم يعد ثمّة مزارع مرخَّص واحد.

أطلق الأسترالي Gerard Hayes العلامة عام 2016 ومَوّلها بنفسه. ذهب إلى إستيلي وعاد بمُصنِّع: A.J. Fernández، الذي يضمّه هذا الأطلس أصلًا. والاسم الذي اختاره يقول ما كان يدين به — فـ«nicoya» تشير إلى أهل نيكاراغوا، ولهم أُهديت العلامة. وقد ظهرت في الولايات المتحدة العام نفسه، في معرض IPCPR.

ولهذا صُنّفت هذه البطاقة نيكاراغوية لا أسترالية. فالأطلس يصنّف العلامة بمكان صنع السيجار، لا بجنسية بائعه: Casdagli دار بريطانية تُلَفّ في كوستاريكا، وDiamond Crown علامة أمريكية تُلَفّ في الجمهورية الدومينيكية. أمّا أستراليا فتبقى في الأطلس ما هي عليه أصلًا: بلد عناوين. فيها يُدخَّن، ولا يُزرَع.

مزيجان، ومقاس واحد: Robusto بخمس بوصات في اثنين وخمسين. ويستحقّ السعر الأسترالي أن يُذكر لأنّه لا يعود إلى السيجار: القطعة بنحو خمسين دولارًا أستراليًا، وعلبة العشرين بنحو ألف. هنا تتكلّم الضريبة، لا المصنع.'
 WHERE `name` = 'Nicoya' AND SHA1(TRIM(`history`)) = '8bf1a13c7812bae3a4fe028fc6ca9b4849ace991';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Nicoya' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '8bf1a13c7812bae3a4fe028fc6ca9b4849ace991';
-- brands|Nomad|history|ar — noms propres en latin
UPDATE `brands` SET `history_ar` = 'كان الاسم برنامجًا. أطلق Fred Rewey علامة Nomad عام 2012 دون أن يملك مترًا واحدًا من مصنع، وفعل ما يعلنه الاسم: بدّل الورشة والبلد بحسب ما تقتضيه الخلطات.

أوّل سيجار لها دومينيكيّ، لُفّ في Tabacalera L&V. ومنذ 2013 انتقل إلى نيكاراغوا بـEstelí Lot 1386، ثم S-307 — سيجار مكبوس بغلاف سومطرة إكوادوريّ — مُزج ولُفّ عند A.J. Fernández. ثم أُضيفت Fábrica Oveja Negra، ورشة Black Label Trading. وبلغ الكتالوج ستة عشر مزيجًا موزّعة على البلدين.

ويصنّف الأطلس هذه البطاقة في نيكاراغوا لأنّ معظم الكتالوج يخرج من هناك. والحصّة الدومينيكية، الموروثة من البدايات، حقيقية، لكنّها لم تعد الرئيسة، فالبطاقة تكتب الاثنتين.

وفي سبتمبر 2018 باع Rewey الدار إلى Chris Kelly وKyle Hoover، مالكَي Ezra Zion. ومنذئذ تصدر Nomad تحت رايتهما.'
 WHERE `name` = 'Nomad' AND SHA1(TRIM(`history`)) = '04b02f074f02382c9c8f5f9842991f2c1d180e68';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Nomad' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '04b02f074f02382c9c8f5f9842991f2c1d180e68';
-- brands|Nordlicht|history|ar — cigarettes pour cigares
UPDATE `brands` SET `history_ar` = 'أسّس Sascha Prieser وHolger Prieser وDenis Stute شركة Nordlicht Prieser GbR في أوسترهولتس-شارمبيك بشمال ألمانيا، وطوّروا علامة Nordlicht حول الحانة الشاطئية التي يديرها Sascha Prieser في زاندهاوزن قرب بريمن. ظهرت أولى قطع السيجار عام 2017 لمجموعة صغيرة من الهواة، بحسب Starke Zigarren؛ وتبلورت الخلطة عام 2018 (Nordlicht Toro Limitada 2018)، التي أعدّها Sascha Prieser بالتعاون مع Kurt Brandt، الألماني المقيم في كوستاريكا ومؤسّس علامة Isthmus، بحسب Zigarren.zone. توقّف الإنتاج، ثم استؤنف عام 2025 بخلطة جديدة، بحسب Starke Zigarren. ولا تكشف الدار عن اسم المصنع الذي يلفّ سيجارها.

يجمع puro Nordlicht النيكاراغوي بين غلاف colorado من خالابا وغلاف داخلي من خالابا يُوضع بسماكة مضاعفة وحشوة تمزج بين خالابا وإستيلي وكونديغا، وتُترك لتنضج أربع سنوات قبل اللف، بحسب Noblego.de؛ وتنطلق النكهة شبه معتدلة لتشتدّ ثلثًا بعد ثلث، بمقاسات Robusto وGordo وMagnum وShort Torpedo. أما Nordlicht Perfecto Maduro، المصمَّمة للسوق الألماني، فتحمل غلاف maduro داكنًا فوق حشوة من إستيلي وكونديغا، بقوة medium.'
 WHERE `name` = 'Nordlicht' AND SHA1(TRIM(`history`)) = 'bb8d7fe4d6425b942591fcbbeca192aa4e5c628e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Nordlicht' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'bb8d7fe4d6425b942591fcbbeca192aa4e5c628e';
-- brands|Notorious|history|ar — noms latins; mot interdit
UPDATE `brands` SET `history_ar` = 'أُطلقت علامة Notorious في مارس 2025، وفق Cigar Dojo، على يد المقاتل الإيرلندي في الفنون القتالية المختلطة Conor McGregor. وتُلفّ العلامة يدويًا في MJ Frias Cigars، في تامبوريل بمقاطعة سانتياغو، جمهورية الدومينيكان — وهو مصنع افتتحه Miguel Frias سنة 1991 في سانتياغو، ثم نُقل إلى تامبوريل سنة 2002، وينتج وفق تاجر التجزئة Corona Cigar سيجارًا مُلفوفًا يدويًا بأسعار معقولة.

أمّا الخلطة الأصلية فتمزج تبغًا من نيكاراغوا وجمهورية الدومينيكان والمكسيك، بمقاسات Toro وDouble Robusto وCorona Gorda؛ وينسب إليها بعض الموزّعين غلاف Habano 2000 Rosado Oscura إكوادوري معتّق نحو أربع سنوات. وتقول الدار إنها بلغت ما يزيد على عشرين بلدًا في ما يزيد قليلًا على سنة. وفي معرض PCA بنيو أورلينز، في أبريل 2026، قدّمت خلطتين جديدتين، تُشحنان منذ ذلك الحين وفق halfwheel: Crème de la Crème، وهي ألطف، بغلاف إكوادوري فاتح وورقة رابطة برازيلية من أرابيراكا وحشوة من نيكاراغوا وجمهورية الدومينيكان وكولومبيا؛ وUnapologetic، وهي أشدّ قوةً، بغلاف Connecticut Broadleaf أمريكي وورقة رابطة سومطرة إكوادورية وحشوة من نيكاراغوا والولايات المتحدة وجمهورية الدومينيكان، بأربعة مقاسات — Corona Larga وToro وSublime وSixty.'
 WHERE `name` = 'Notorious' AND SHA1(TRIM(`history`)) = 'c45225b11bb7de556c5bb63dc49666882f5ca552';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Notorious' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'c45225b11bb7de556c5bb63dc49666882f5ca552';
-- brands|Oettinger Davidoff|history|ar — noms de personnes en latin
UPDATE `brands` SET `history_ar` = 'في مايو 1875 افتتح Max Oettinger متجر سيجار في شارع آيزنغاسه 9 ببازل، حيث كان يبيع السيجار المستورد والتبغ بالبرميل والغلايين ولوازم المدخّنين.

في جنيف، وصلت عائلة Davidoff من كييف عام 1911، وافتتح Henri Davidoff فيها أول متجر له للتبغ. وصدر عام 1968 أول سيجار بحلقة بيضاء ابتكره Zino Davidoff في كوبا؛ وفي 1970 تولّت مجموعة Oettinger متجر Zino Davidoff في جنيف، وشرع Ernst Schneider، الذي كان يدير المجموعة منذ 1961، في جعله علامة دولية.

ثم جاءت عمليات الاستحواذ: Camacho (Danlí، هندوراس، وميامي) في 1 أكتوبر 2008، وقد منحت المجموعة منشأً ثانيًا هو هندوراس، ثم Cusano في 2009، التي فتحت لها قنوات توزيع جديدة في الولايات المتحدة. ومنذ 1991 يُلَفّ كل سيجار Davidoff يدويًا في الجمهورية الدومينيكية، في Villa González (Santiago)، حيث تصنع الدار أيضًا AVO وThe Griffin''s وCusano وPrivate Stock وZino Platinum؛ أما Zino، التي أُطلقت في 1978 وكانت تُلَفّ حينها في هندوراس، فأُعيد إطلاقها في 2021 بطابع نيكاراغوي. وتبقى المجموعة عائلية؛ ويعمل فيها ما يزيد على 4 000 موظف حول العالم (بيان صحفي بتاريخ 11 يونيو 2025)، ويديرها Beat Hauenstein، الرئيس التنفيذي منذ 2017، وقد احتفلت بمرور 150 عامًا في مايو 2025. ومقرّها، Maison Davidoff، في Nauenstrasse 73 ببازل.'
 WHERE `name` = 'Oettinger Davidoff' AND SHA1(TRIM(`history`)) = '6c4e1337b85867a832ff990e5d4a9490f33c1c05';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oettinger Davidoff' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '6c4e1337b85867a832ff990e5d4a9490f33c1c05';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ohana' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'c4e1ca2ca5c4081816f117fcb8514c6d84a35215';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oliva Connecticut Reserve' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '09f868f1369ada42a29df1dbca8c0b22ea03b452';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oliva Serie G' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '25622bde17b50bbbeefa9db9b4fd6465fde1ee62';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Omar Rodriguez' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'd559d976ff4f1ef94da62656995c48539e15dacb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Onyx' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'bb66385a2f513ecb363ec53a92b6f82ea18817d6';
-- brands|Ortega Cigars|history|ar — noms de personnes en latin
UPDATE `brands` SET `history_ar` = 'Eddie Ortega نصفُ EO Brands — E لـEspinosa وO لـOrtega — الدار التي أطلقت 601 وCubao لدى Don Pepín García في الألفينيات. افترق الشريكان في شباط/فبراير 2012: احتفظ Erik Espinosa بـ601 وMurcielago وMi Barrio، ويرويه هذا الأطلس في بطاقته؛ واحتفظ Ortega بـCubao وREO وVibe، وأسّس Ortega Premium Cigars. خرج خطّه الأوّل، Serie D، في السنة نفسها من My Father، مصنع عائلة García الذي يحمل هذا الأطلس بطاقته؛ وتبعته Wild Bunch سنة 2013، اثنا عشر سيجارًا في سنة، شخصيّة في كلّ شهر.

في 2016 تولّت Quality Importers — موزّع عمل لديه Ortega لفترة قصيرة — التوزيع، وخرجت الخطوط التالية من TACASA، مصنع Carlos Sánchez في إستيلي، الذي يصنع أيضًا علامتهم Cult. هناك عاد Cubao بالمزجة نفسها التي كانت للأصل — غلاف سومطرة إكوادوري، حشوة من إستيلي وخالابا — مع Jalapa وM3.

بعد ذلك صمتت صحافة المهنة. ما يستطيع هذا الأطلس قوله من 2021 إلى اليوم يتّسع له كتالوجات تجّار التجزئة ومدوّنة هاوٍ: السيجار يُباع، والمصنع مسمًّى، والدار لم تعد تثير الحديث. البطاقة موجودة من أجل قصّة EO Brands التي لم تروها بطاقة أخرى من جهة Ortega، وتقول أين ينتهي ما تعرفه.'
 WHERE `name` = 'Ortega Cigars' AND SHA1(TRIM(`history`)) = '9d81f5e9609faf1ef88f6a7135e10b80f42abcf4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ortega Cigars' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '9d81f5e9609faf1ef88f6a7135e10b80f42abcf4';
-- brands|Oscar Valladares|history|ar — noms latins, Hector mal écrit
UPDATE `brands` SET `history_ar` = 'ثلاثة رجال تدرّبوا في أماكن أخرى افتتحوا عام 2012 مصنعًا صغيرًا في دانلي: Oscar Valladares، وأخوه Hector، وصديقهما Bayron Duarte.

وما جلبوه جاء من خارج، وهذا ما يفسّر الدار. فقد أمضى Oscar تسع سنوات في Rocky Patel؛ وجمع Bayron نحو عشرين عامًا بين General Cigar وOliva. والدور الثلاث كلّها في هذا الأطلس — ويتّضح المشهد الهندوراسي حين نعرف أين تعلّم أهله.

و Leaf by Oscar هو ما عرّف بها، والحيلة تُرى قبل أن تُدخَّن: فالسيجار ملفوف بورقة تبغ كاملة مجفّفة تُنزَع قبل الإشعال. ليست غلافًا، بل تبغًا.

أمّا ما تلا فيعود إلى بائع تجزئة. زار Island Jim من بيتسبرغ المصنع وعاد بألف سيجار، فنفد في أسبوع. وحافظت الدار على عادة هذه الشراكات مع المتاجر، وتحمل سلاسل عدّة أسماءها.'
 WHERE `name` = 'Oscar Valladares' AND SHA1(TRIM(`history`)) = '323c2f5185aa9a3040bf0427e62df799d0481172';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oscar Valladares' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '323c2f5185aa9a3040bf0427e62df799d0481172';
-- brands|Padilla|history|ar — contresens gauche; noms latins
UPDATE `brands` SET `history_ar` = 'Padilla تحيّة لشاعر. أنشأ Ernesto Padilla العلامة في ميامي أواخر 2003 إكرامًا لأبيه: Heberto Padilla، الذي دخل اعتقاله وتراجعه القسري عام 1971 تاريخَ كوبا باسم «قضية Padilla»، وكان علامةً على قطيعة جزء من المثقفين اليساريين مع النظام.

جاءت العائلة من بينار دل ريو، حيث كانت تملك أرضًا وتزرع التبغ. فالاسم على الحزام ليس خيارًا تجاريًا: إنّه اسم الأب، والتبغ هو الميراث الآخر.

ولهذا صُنّفت هذه البطاقة أمريكية لا نيكاراغوية. فسلسلة Padilla Miami، وهي واجهة الدار، تُلَفّ في El Titan de Bronze بهافانا الصغيرة — ورشة Calle Ocho التي يضمّها هذا الأطلس، حيث يعمل عدد قليل من اللافّين الكوبيين. أمّا التبغ فنيكاراغوي تزرعه Aganorsa: والأطلس يصنّف بالمكان الذي يُصنع فيه السيجار، لا بمنشأ الورقة.

والإنتاج موزّع. فسلاسل أخرى تأتي من Fábrica de Tabacos Raíces Cubanas في هندوراس، وPadilla Habano من Tabacalera A.J. Fernández في نيكاراغوا. هذه البطاقة أمريكية بمركزها لا بمجموع ورشها، وهي تقول ذلك.'
 WHERE `name` = 'Padilla' AND SHA1(TRIM(`history`)) = 'c210335e9b40c11850638e91df6beac98d35937e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Padilla' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'c210335e9b40c11850638e91df6beac98d35937e';
-- brands|Patina Cigars|history|ar — noms propres en latin
UPDATE `brands` SET `history_ar` = 'Patina — الصدأ النبيل الذي يكسو النحاس والأشياء التي طال إمساكها — دارٌ من شيكاغو أسّسها Mo Maali سنة 2015، ويصنّفها هذا الأطلس في نيكاراغوا حيث تُلفّ. بدأت لدى Mombacho، مصنع غرناطة الذي يروي هذا الأطلس إغلاقه: خرجت المزجات الأولى سنة 2017 من ذلك البيت الاستعماري عند سفح البركان. وفي 2019 انفصل عنه Maali ونقل إنتاجه إلى NACSA في إستيلي، المصنع الذي له بطاقته الخاصة — الطريق نفسه، بالاتجاه المعاكس، الذي سلكته دار Mombacho نفسها بعد سنوات قليلة نحو الإغلاق.

ومنذئذٍ يُكتب الكتالوج في إستيلي: Oro de Nicaragua، خطّ منتظم، وAnniversary، وفي 2025 إصداران — Verdigris، الزنجار، بالتعاون مع Viso Horny لـTyler Jeffery، ثلاثة آلاف سيجار لعشرة متاجر، وRed Pill الذي شُحن في 28 تشرين الأوّل/أكتوبر. دارُ سلاسل صغيرة تُسمّى كالألوان والموادّ، على طريقة مشهد البوتيك الأمريكي.

البطاقة موجودة لأنّ المصنع مسمًّى في كلّ مرحلة — هذه هي القاعدة — ولأنّ صحافة المهنة تابعت الدار حتى هذه السنة.'
 WHERE `name` = 'Patina Cigars' AND SHA1(TRIM(`history`)) = 'bfa8f56d086fd0d184a9d005a43b4bb64040c20c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Patina Cigars' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'bfa8f56d086fd0d184a9d005a43b4bb64040c20c';
-- brands|Patoro|history|ar — noms latins; pluriel cigarettes
UPDATE `brands` SET `history_ar` = 'Patoro دارٌ سويسرية تُلفّ سيجارها في جمهورية الدومينيكان، وتصنّفها البطاقة حيث يُلفّ — مثل بطاقات Villiger ودور سويسرية أخرى. أنشأها Patrick J. Martin وتبيع في أوروبا منذ 2001؛ اختار جمهورية الدومينيكان للأرض، وDe Los Reyes، مصنعَ Augusto Reyes في سانتياغو الذي يحمل هذا الأطلس بطاقته، للورشة.

كبر الكتالوج خطًّا فخطًّا: Gran Añejo Reserva سنة 2001، وPlatino سنة 2003، ثم Vintage وVA وBrasil وSerie P. والتفصيل الذي يقول المهنة أنّ Serie P المباعة في الولايات المتحدة ليست المباعة في أوروبا — غلاف ورباط برازيليان على حشوة دومينيكية لأمريكا، ومزجة أخرى للقارّة القديمة. حزامٌ واحد وسيجاران، والدار تقول ذلك.

وفي الولايات المتحدة، C.L.E. — دار Christian Eiroa، هو مجدّدًا — هي التي توزّع الإصدار الأمريكي من Serie P. وهكذا يظهر اسم Eiroa على بطاقة سابعة في هذا الأطلس ليست بطاقته.'
 WHERE `name` = 'Patoro' AND SHA1(TRIM(`history`)) = '2169c3738c570c5fa9cd97d4f8ed4582220d95f9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Patoro' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '2169c3738c570c5fa9cd97d4f8ed4582220d95f9';
-- brands|Paul Garmirian|history|ar — noms latins; mot interdit
UPDATE `brands` SET `history_ar` = 'كتب Paul Garmirian كتابًا قبل أن يصنع سيجارًا. صدر The Gourmet Guide to Cigars عام 1990؛ وأسّس داره في السنة نفسها، وسمّى سلسلته الأولى Gourmet Series.

كان المقصد دقيقًا، وهو من باب الذاكرة: أن يستعيد مذاق السيجار الهافاني الذي كان يدخّنه في أواخر الخمسينيات. وليست تلك وقفة استعراض، بل دفتر شروط — وهو يفسّر تحفّظ دارٍ لم تجارِ قطّ موضة القوّة.

ويُصنع السيجار في الجمهورية الدومينيكية عند O.K. Cigars — مصنع مجموعة Davidoff المعروف قبل كلّ شيء بصناعة Avo. وكان يخرج قبلها من Occidental Cigar Factory المجاورة. والورش الثلاث تنتمي إلى المجمّع نفسه، مجمّع Tabadom، الذي يسمّيه هذا الأطلس أصلًا في بطاقتَي Davidoff وThe Griffin''s.

فهي إذن دار مؤلِّف تُلَفّ عند صانع صناعيّ — نقيض النموذج البوتيكي اليوم الذي يقصد الورشة الصغيرة. المطلوب هنا هو الثبات، ويوفّره المصنع الكبير بصورة أجود من الصغير.'
 WHERE `name` = 'Paul Garmirian' AND SHA1(TRIM(`history`)) = '0d930307235295580f82043aca64d8ac04435813';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Paul Garmirian' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '0d930307235295580f82043aca64d8ac04435813';
-- brands|Paul Stulac Cigars|history|ar — noms latins; cigarettes pour cigares
UPDATE `brands` SET `history_ar` = 'Paul Stulac دارٌ كندية، ويصنّفها هذا الأطلس في نيكاراغوا لأنّ سيجارها يُلفّ في إستيلي لدى Las Villas Cigars، بإشراف Guillermo Peña، مزّاجها الرئيسي — مصنعٌ يسمّيه هذا الأطلس هنا ولم يصفه بعد. أُطلقت العلامة في معرض IPCPR سنة 2011، كما يقول تجّار التجزئة الذين يحملونها؛ أمّا الدار نفسها فلا تؤرّخ شيئًا على موقعها، ويأخذ هذا الأطلس سنة التجّار في غياب مصدر آخر، قائلًا ذلك.

الطراز يُعرف من بعيد: أحزمة سوداء، وأسماء من الروك والليل — Black Phantom وRed Screaming Sun وMiami Style — وسيجار قويّ نسبيًّا. جماليّةٌ لا أرض، وليس ذلك عيبًا: فهذا نصف مشهد البوتيك في أمريكا الشمالية.

تقف البطاقة عند ما تستطيع تسميته: المصنع، والمزّاج، وسنة دخول السوق. أمّا الباقي — الأتبغة والكمّيات — فغير منشور.'
 WHERE `name` = 'Paul Stulac Cigars' AND SHA1(TRIM(`history`)) = '762523110546366abc0fe09d4d3036cf9be3d4c6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Paul Stulac Cigars' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '762523110546366abc0fe09d4d3036cf9be3d4c6';
-- brands|PDR Cigars|history|ar — noms de personnes en latin
UPDATE `brands` SET `history_ar` = 'PDR هي بينار ديل ريو — اسم مقاطعة التبغ الكوبية، اتّخذه مصنعٌ دومينيكي في تامبوريل. وُلد Abe Flores سنة 1975 في كوينز، ونشأ في جمهورية الدومينيكان منذ الثالثة، وقضى أواخر التسعينيات في المعلوماتية قبل أن يعود إلى التبغ. صدرت العلامة في معرض 2008: اثنا عشر حسابًا في اليوم الأوّل، وخمسون بعد ستّة شهور. تبعتها PDR 1878 سنة 2009 — مئة ألف سيجار بيعت في شهور قليلة — وفي 2011 انتقل المصنع إلى مبنى مساحته أربعون ألف قدم مربّعة لم يشغل منه أوّلًا سوى الربع.

في 2015 كان يستغلّ ثلاثين ألفًا، بستّين لافًّا، ويُخرج ما بين أربعة ملايين ونصف وخمسة ملايين سيجار في السنة. النصف تحت علاماته الخاصة: PDR 1878، وSmall Batch Reserve، وA. Flores 1975 — سنة ميلاد المؤسّس — وFlores y Rodríguez بالشراكة مع شريك اسمه Luis.

والنصف الآخر يُلفّ لغيره، والقائمة تتقاطع مع ثلاث بطاقات في هذا الأطلس: La Palina لخطَّيها Black وClassic؛ وGurkha لسيجار 125th؛ وViaje لِـTNT وC4؛ وKristoff. ونقلت Hiram & Solomon إنتاجها كلّه إليه في حزيران/يونيو 2022. ومصنعٌ يلفّ لِـLa Palina وGurkha ليس ورشة حيّ، وهذا ما يُدخله هنا قبل العلامات التي يصنعها.'
 WHERE `name` = 'PDR Cigars' AND SHA1(TRIM(`history`)) = '2fb04bda7ae5f99c0649188f6dc301c509c5c6cb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'PDR Cigars' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '2fb04bda7ae5f99c0649188f6dc301c509c5c6cb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Perdomo Legacy Connecticut' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'c21644d1dff2063edc8586a3541703264266cfcc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Perla de Calvano' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '48633535a42f93526a1589cf77f993e942ea41e1';
-- brands|Pogar|history|ar — contresens du détaillant; marque
UPDATE `brands` SET `history_ar` = 'بوغار مدينةٌ صغيرة في أوبلاست بريانسك غرب روسيا، ومصنع التبغ فيها من أقدم مصانع البلاد: افتُتحت فيها مؤسّسة سنة 1839، ومصنع تبغ بوغار قائم بهذا الاسم منذ 1915. كان التبغ آنذاك يُزرع في الإمبراطورية الروسية. وبعد الثورة ثم الحرب اختفت المزارع ونجا المصنع بصنع الرخيص؛ ثم عاد إلى السيجار لاحقًا بأوراق تُشترى من كوبا وجمهورية الدومينيكان والبرازيل ونيكاراغوا، وكلّ شيء يُصنع في الموقع عدا الزراعة.

لا يحمل هذا الأطلس ما تصنعه Pogar بالكمّية — سيجار آلي ومنكّه وتشكيلة رخيصة — بل ما تصنعه باليد: سيجار يلفّه لفّافوها، ويعدّه تاجر تجزئة روسي أكبر إنتاج مُلفوف يدويًّا في البلاد. تنسب البطاقة ذلك إلى التاجر. وتقول العلامات العصر والمكان: XO وAroma Cubana وDostoïevski، مكتوبًا بإملاء ما قبل 1918.

مع Siglo de Oro، إنّه المصنع الثاني الذي يُدخل روسيا في هذا الأطلس مكانَ لفّ. لا صحافة أنجلوفونية له؛ له قرن.'
 WHERE `name` = 'Pogar' AND SHA1(TRIM(`history`)) = 'fa6f37f458af1169627fa0ab6d721e1119be04d7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Pogar' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'fa6f37f458af1169627fa0ab6d721e1119be04d7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Por Larrañaga Dominicain' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'f20ad7035e80b730a8a216fb2e2ebaedb248b31a';
-- brands|Powstanie|history|ar — noms de personnes en latin
UPDATE `brands` SET `history_ar` = 'Powstanie — تُلفظ بو-شا-نيِه، «انتفاضة» بالبولندية — علامةُ أخوين تاجرَي تجزئة من فلوريدا، Mike وGreg Szczepankewicz، صاحبَي متجر Cigar Hustler في دلتونا. وُلدت سنة 2015 بطريقة رأت الصحافة أنّها تستحقّ الرواية: ركّب كلّ أخ مزجته الخاصة مع Esteban Disla وSkip Martin في Fábrica de Tabacos Nica Sueño في إستيلي — مصنع RoMa Craft الذي يحمل هذا الأطلس بطاقته — ثم تذوّق زبائن المتجر الاثنتين معصوبي الأعين. خرج Habano الخاص بـMike في أيّار/مايو، وMaduro الخاص بـGreg في آب/أغسطس؛ وكانت أوّل علامة من خارج RoMa Craft يقبل المصنع بيعها لعدّة تجّار.

يستعير الشعار رموز المقاومة البولندية في الحرب العالمية الثانية، ويقول الاسم أصل العائلة. ونما الكتالوج منذئذٍ حول الأغلفة: Habano وMaduro برودليف وConnecticut وSan Andrés — بقياسات perfecto وcorona gorda، في علب من واحد وعشرين، كما يحبّها المصنع.

وصارت شركة الأخوين، Pospiech، موزّعًا أيضًا: هي التي تحمل Fable وChogüí، بطاقتين من هذا الأطلس. علامةُ تاجر تجزئة إذن — لكن بمصنع مسمًّى وكتالوج دائم وعشر سنوات من الصحافة، وهو بالضبط الخطّ الذي رسمه هذا الأطلس بين Sindicato وBlack Swan.'
 WHERE `name` = 'Powstanie' AND SHA1(TRIM(`history`)) = 'bf66a73829f04332f98550ad3aab31de4db98ede';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Powstanie' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'bf66a73829f04332f98550ad3aab31de4db98ede';
-- brands|Principle Cigars|history|ar — noms latins; cigarettes pour cigares
UPDATE `brands` SET `history_ar` = 'Principle دارُ جامعِ تحف. قضى Darren Cioffi، من لونغ آيلاند، سنواتٍ يتداول ملصقات علب قديمة وطبعات حجرية للتبغ، وكوّن مكتبة سيجار تعود إلى سبعينيات القرن التاسع عشر؛ ودخّن نماذج معتّقة ومن قبل الحظر. العلامة التي أسّسها سنة 2013 — وشعارها يؤرّخها — وُلدت من هذا الهوس: السيجار بوصفه شيئًا كاملًا، العلبة والحزام والقياس والتبغ معًا.

التقى Hendrik Kelner Jr.، ابن معلّم التبغ عند Davidoff، الذي كان قد افتتح للتوّ ورشته الخاصة في سانتياغو — Kelner Boutique Factory التي يحمل هذا الأطلس بطاقتها. قضيا سنة ونصفًا في اختيار أتبغة معتّقة، وهناك يُلفّ كلّ شيء، بأيدي أربعة لفّافين، بمعدّل عشر قطع من السيجار في اليوم للقياسات الأبطأ. وكان Time To Burn، مشروع السنوات العشر سنة 2023، الاستثناء: خرج من Casa Carrillo.

الخطوط حِقَب: Aviator، الآرت ديكو الصناعي الأمريكي لأواخر الأربعينيات؛ Accomplice، الطراز الفرنسي للثلاثينيات؛ Martinique، الطراز الاستعماري للقرن الثامن عشر. دارٌ تفكّر في أحزمتها كما في المطبوعات — وهذا ما كان المؤسّس يجمعه قبل أن ينتج.'
 WHERE `name` = 'Principle Cigars' AND SHA1(TRIM(`history`)) = '35d47a997d60ee7b712a43307f496ca535384bd1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Principle Cigars' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '35d47a997d60ee7b712a43307f496ca535384bd1';
-- brands|Protocol|history|ar — noms propres en alphabet latin
UPDATE `brands` SET `history_ar` = 'Protocol علامة رجلَي شرطة. كان Juan Cancel وBill Ives ضابطَين عاملَين حين أسّسا شركة Cubariqueño Cigar Company في مطلع عام 2015. واسم الشركة يجمع أصلَيهما: كوبيّ لأحدهما، بورتوريكيّ للآخر.

والعلامة كلّها قائمة في مفردات مهنتهما: Protocol أوّلًا، ثم Probable Cause، وThemis — ربّة العدالة عند الإغريق —، وOfficial Misconduct، وConfidential Informant. وهو اختيار نادر في صناعة تُؤثِر أسماء العائلات وأسماء الوديان.

لا مصنع لهما، ولم يبحثا عنه قطّ. فقد أمضيا سنوات في التعريف بـEspinosa على الشبكات قبل أن يبدآ، وإلى Espinosa ذهبا: مصنع La Zona في إستيلي، ومعهما Hector Alfonso Sr. في المزج. ثم انتقل جزء من الإنتاج إلى San Lotano، مصنع A.J. Fernández. وللورشتين بطاقتاهما في هذا الأطلس.

وفي فبراير 2026 اشترى بائع التجزئة الفلوريديّ Smoke Inn الملكية الفكرية للعلامة وأصولها — لا Cubariqueño نفسها، فهي باقية لمؤسّسَيها. ولا يزال Juan Cancel يرافق Protocol، ولم يتغيّر المصنعان.'
 WHERE `name` = 'Protocol' AND SHA1(TRIM(`history`)) = 'b2e78d6772665590f22a6446d650d455b058a054';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Protocol' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'b2e78d6772665590f22a6446d650d455b058a054';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Psyko Seven' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '600d5e4fe4ec8e798868bbf52f479bc392ad9f1b';
-- brands|Punch Honduras|history|ar — marques en alphabet latin
UPDATE `brands` SET `history_ar` = 'كانت صفحة هندوراس تعلن Punch، بينما يقود الرابط إلى المقالة الكوبية — مقالة علامة تأسّست في هافانا سنة 1840 للسوق الإنكليزية، بدميتها Mr. Punch على الغطاء. فكان القارئ يقرأ تاريخ سيجار لن يجده في هندوراس. وهذه المقالة تصحّح ذلك الالتباس.

وُلد Punch الهندوراسي من التأميم الكوبي: فالاسم، الذي استُؤنف خارج الجزيرة، يُصنع في هندوراس منذ الستينيات وبِيع في الولايات المتحدة طوال فترة الحصار. وهناك بنى جمهوره الخاص، بطابع أشدّ ترابية وقوّة من الهافانا، وبأسعار بقيت في المتناول بينما صار الكوبي سلعة نادرة.

علامتان وبلدان واسم واحد موروث عن القرن التاسع عشر ذاته — إحدى الندوب التي خلّفها عام 1960 في جغرافيا السيجار، والأطلس يُظهرها بدل أن يطمسها.'
 WHERE `name` = 'Punch Honduras' AND SHA1(TRIM(`history`)) = 'a26e2f4939ab578472246a963c22226245855861';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Punch Honduras' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'a26e2f4939ab578472246a963c22226245855861';
-- brands|Puros Artesanos Julio|history|ar — prénom en alphabet latin
UPDATE `brands` SET `history_ar` = 'العائلة في التبغ منذ عام 1950؛ أمّا الشركة نفسها فتحمل اسمًا شخصيًا وتعود إلى عام 2000. أسّسها آنذاك Julio وأخوه، بحرفةٍ تعلّماها عن أبيهما.

الورشة في بريينيا ألتا، والمزرعة قبالتها على الجانب الآخر من الطريق. وهذا ما يميّز الدار: نصف ورقها من حقلها الخاص، والنصف الآخر من سومطرة وكوبا والبرازيل. الزراعة والتجفيف والتخمير واللفّ — كلّه يجري في هذه المئات القليلة من الأمتار.

ولم تُختَر بريينيا ألتا اعتباطًا: فللبلدة تقليد تبغيّ طويل تدين به لمناخ محلّي خاص، وللبالميّين العائدين من أمريكا الجنوبية بالحرفة معهم. وقد افتتحت الدار فيها متجرًا موضوعيًا وتستقبل الزوّار في ورشتها.

ويقوم الكتالوج على خطّين، يفرّق بينهما الغلاف لا المقاس: كونيتيكت لطيف متّزن الاحتراق، وبرازيلي داكن بلمحات حمراء، بين المتوسط والقويّ.'
 WHERE `name` = 'Puros Artesanos Julio' AND SHA1(TRIM(`history`)) = 'a9efe3697c40b5cf9083fcbb88c692e2caa6b827';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Puros Artesanos Julio' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'a9efe3697c40b5cf9083fcbb88c692e2caa6b827';
-- brands|Quesada|history|ar — noms en alphabet latin
UPDATE `brands` SET `history_ar` = 'تعمل عائلة Quesada في التبغ منذ أواخر القرن التاسع عشر، في كوبا أولاً ثم في الجمهورية الدومينيكية حيث استقرّت في السبعينيات — قبل الموجة التي جعلت البلاد الوجهة الأولى للسيجار الفاخر. وهذه الأسبقية مهمّة: فحين وصلت البيوت الكبرى، كانت عائلة Quesada هناك بالفعل، بمصنعها في سانتياغو.

عملت الدار طويلاً في الظلّ، تنتج لعلامات أخرى بقدر ما تنتج لنفسها، وتحافظ على تحفّظ يناقض الصخب التجاري في المهنة. ويقودها اليوم الجيل التالي، وتبقى من البيوت الدومينيكية الكبرى القليلة التي لا تزال مستقلّة وعائلية.

أسلوبها يتبع المزاج الدومينيكي الكلاسيكي: توازن ومرونة وأناقة لا تبحث عن الأثر. أمّا Casa Magna، خلطتها الأوسع شهرة، فهي الاستثناء إذ تذهب إلى القوّة النيكاراغوية — طريقة لتقول إن الدار تُحسن غير ما يُنتظَر منها.'
 WHERE `name` = 'Quesada' AND SHA1(TRIM(`history`)) = 'a0b4dc551cce30479ecf5b03dedb4fd6ba11c145';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Quesada' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'a0b4dc551cce30479ecf5b03dedb4fd6ba11c145';
-- brands|Red Anchor|history|ar — سيجارة au lieu de cigare
UPDATE `brands` SET `history_ar` = 'Red Anchor علامة من دلفت في هولندا، تقول الدار، وهي United Cigars، إنها تأسست عام 1772. وتؤرّخ Cigar Coop بعام 1770 تسجيل العلامة من قبل متجر سيجار، وبتاريخ 22 فبراير 1772 الإذن الذي منحه أعضاء المجلس البلدي في دلفت لـAlbertus Hillen ببيع سيجاره تحت اسم Red Anchor، وبمارس 1937 إغلاق الشركة.

اشترت United Cigars العلامة التي ظلّت خاملة، وأعادت إطلاقها بمناسبة ذكراها الـ250، بحسب الدار؛ وحصل David Garofalo، الذي تولّى United Cigars، على حقوقها، بحسب Cigar Coop. ويعود الإعلان إلى 20 مايو 2022، لمعرض PCA في لاس فيغاس، من 9 إلى 12 يوليو 2022، مع مقاس واحد هو Admiral. وتقول الدار إنها أقامت شراكة مع عائلة Kelner، ذات الجذور الهولندية والدراية الدومينيكية؛ ويقول مقال من أغسطس 2023 إن جميع المقاسات تُلَفّ في Kelner Boutique Factory، في سانتياغو بجمهورية الدومينيكان.

وفي أكتوبر 2026، تُدرج الدار العلامة في كتالوجها، في علب من خمسٍ وعشرين سيجارًا، في خمسة مقاسات: Gunner (6 1/2 x 43) وCaptain (5 x 50) وAdmiral (6 x 52) وCommodore (7 x 55، مخصص للفعاليات) وCooper (4 1/2 x 43). وتذكر غلاف Habano من الإكوادور، ورباطًا دومينيكيًا من مونتي بلاتا، وحشوة من Habano ''92 دومينيكي ومن الولايات المتحدة، بقوة من متوسطة إلى كاملة. وتندرج Red Anchor ضمن العلامات التي تبرزها الدار، إلى جانب Firecracker وLa Gianna.'
 WHERE `name` = 'Red Anchor' AND SHA1(TRIM(`history`)) = '7dd14523754092bbae2629e9913ef58fefa57064';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Red Anchor' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '7dd14523754092bbae2629e9913ef58fefa57064';
-- brands|Regius|history|ar — noms latins; صاحب ajouté
UPDATE `brands` SET `history_ar` = 'Regius دار لندنية. أسّسها Akhil Kapacee عام 2010 بنيّة محدّدة: أن يقدّم للسوق البريطانية سيجارًا متقنًا بسعر لا تعرفه البلاد عادةً. فالمملكة المتحدة من الأسواق التي تثقل فيها ضريبة التبغ، والسيجار الهافانيّ فيها أغلى منه في سائر أوروبا.

باعت في بلدها أوّلًا، ثم اتّجهت إلى الولايات المتحدة ابتداءً من 2012.

ولا تملك مصنعًا. سيجارها يخرج من إستيلي، عند Plasencia — العائلة التي لها بطاقتها في هذا الأطلس، والتي تلفّ منذ زمن لغيرها كما تلفّ لنفسها. وهذا هو الترتيب المعتاد للدور الأوروبية: التوقيع في جهة، والورشة في جهة أخرى على بُعد ثمانية آلاف كيلومتر.

وثمّة خصوصية إنجليزية تستحقّ التسجيل: Orchant Seleccion، صُنعت لـMitchell Orchant من بائع التجزئة اللندني C.Gars. فوضع حلقة متجر على سيجار علامةٍ عادةٌ لا تكاد القارّة تعرفها، وتمارسها لندن منذ زمن.'
 WHERE `name` = 'Regius' AND SHA1(TRIM(`history`)) = '57925d6f373c207989915e5940d0aa86e74085b6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Regius' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '57925d6f373c207989915e5940d0aa86e74085b6';
-- brands|Reinado|history|ar — noms en alphabet latin
UPDATE `brands` SET `history_ar` = 'Reinado — الحُكم — دارُ Antonio Lam، أُسّست سنة 2009، وخرج خطّها الأوّل في معرض IPCPR سنة 2010، لفّته Agros Tabacos Industriales، مصنعٌ في إستيلي يسمّيه هذا الأطلس هنا من دون أن يكون قد وصفه. كانت لها ساعتها — Grand Empire Reserve، وجمهور — ثم غادرت السوق، وخصّتها صحافة المهنة في كانون الأوّل/ديسمبر 2018 بمقال ذكرى.

عادت في آب/أغسطس 2021 لدى مصنع آخر: TABSA، مصنع Aganorsa Leaf الذي يحمل هذا الأطلس بطاقته. يُسمّى خطّ العودة Grand Apex، ويهديه Lam إلى أبيه، المهاجر الكوبي الذي وصل بلا شيء وصار نائب رئيس Chase Manhattan Bank في نيويورك — القمّة، apex، التي يعنيها العنوان. وتبعه قياس 6 × 60 وC29 سنة 2022.

ثم صمتت الصحافة من جديد، ولم ينشر موقع الدار شيئًا منذ 2023. دارٌ اختفت مرّة، ولا يُعرف إن كانت تختفي مرّة ثانية: يكتبها هذا الأطلس بهذا التحفّظ لأنّ المصنع مسمًّى وعودة 2021 موثّقة — ويفضّل أن يصحّح على أن يكون قد سكت.'
 WHERE `name` = 'Reinado' AND SHA1(TRIM(`history`)) = '40abeb06d2f6b5c2fa6ad4a72bbcc98a08062ecb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Reinado' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '40abeb06d2f6b5c2fa6ad4a72bbcc98a08062ecb';
-- brands|Reyes Family Cigars|history|ar — noms de personnes en latin
UPDATE `brands` SET `history_ar` = 'كان لـRolando Reyes Sr. مصنعٌ في كوبا. كان اسمه Cuba Aliados، وصودر منه. رحل، وفي سبعينيات القرن الماضي بدأ من جديد — في نيوجيرسي أوّلًا، ثم في ميامي وجمهورية الدومينيكان، قبل أن يجمع كلّ شيء في دانلي بهندوراس سنة 1990. توفّي سنة 2012 عن تسع وثمانين سنة، ويدير حفيده Carlos Diez الدار.

ما تصنعه: نحو خمسة ملايين سيجار في السنة، نصف مليون منها تحت علامة Puros Indios التي أُطلقت سنة 1995. ومنذ أيلول/سبتمبر 2016 تتولّى C.L.E. — دار Christian Eiroa، التي لها بطاقتها — توزيعها من ميامي. وهكذا يعود اسم Eiroa مرّة أخرى في هذا الأطلس، على دار ليست داره.

ثم منعطف، في آب/أغسطس 2021: باعت العائلة علاماتها التاريخية الثلاث — Cuba Aliados وPuros Indios وRoly — إلى Oliva. العلامات فقط: لم يكن مصنع دانلي ضمن الصفقة، وانتقل إنتاجها إلى نيكاراغوا، عند Oliva. ولهذا تحملها بطاقة Oliva، ولهذا لا تُسمّى هذه البطاقة Cuba Aliados ولا Puros Indios.

يستمرّ المصنع باسم العائلة، مع Premier وClassic وVintage وCienfuegos، ومع العمل بالوكالة الذي طالما أعاش ورش دانلي: فقد لفّت Kafie سيجارها فيه من 2013 إلى 2017، قبل أن تفتح مصنعها.

دارٌ تبيع علاماتها وتحتفظ بمصنعها هي عكس ما يُرى عادةً — وهذا بالضبط ما يجعل هذا الأطلس، الذي يصنّف بحسب مكان الصنع، يُبقيها في هندوراس.'
 WHERE `name` = 'Reyes Family Cigars' AND SHA1(TRIM(`history`)) = 'ef753698c198e629c3d43bc1328445207c1b054e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Reyes Family Cigars' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'ef753698c198e629c3d43bc1328445207c1b054e';
-- brands|Rizona Baru|history|ar — noms en alphabet latin
UPDATE `brands` SET `history_ar` = 'Rizona مصنعٌ في تيمانغونغ، في جبال وسط جاوة، يصنع السيجار منذ 1910 — من أقدم مصانع إندونيسيا التي ما زالت تعمل. تعلّم مؤسّسه، Hoo Tjong An، المهنة على يد صانع سيجار فلبيني، ويسجّل هذا الأطلس التفصيل لأنّه يربط بلدين من بلدانه: كانت مانيلا آنذاك تلفّ لآسيا كلّها، ومن هناك جاءت الطريقة إلى جاوة. أقام مصنعًا صغيرًا ووظّف أهل الجوار.

تولّى ابنه، Sunardi Hartono، المصنع — سنة 1934 بحسب مصدر، و1940 بحسب آخر؛ تكتب البطاقة الاثنين — وأعطاه اسم Rizona ورفع الجودة باستيراد أغلفة من هافانا والبرازيل. وبعد خمسين سنة تولّى ابنه Mulyadi Hartono، وهو الذي يدير الدار في الجيل الثالث. يعمل فيه ثمانية وثلاثون شخصًا، معظمهم نساء، من تنظيف الأوراق إلى التعليب، بلا أداة حديثة؛ ويأتي التبغ من جمبر في الطرف الآخر من الجزيرة. ثلاث علامات: Kenner Ballero وKenner King وExtra Fine.

تزوره الصحافة الإندونيسية كأثرٍ — قرنٌ وما يزيد، تقول العناوين.'
 WHERE `name` = 'Rizona Baru' AND SHA1(TRIM(`history`)) = '795261b66e46ce45d26d43c9b2bf41c9120003aa';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rizona Baru' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '795261b66e46ce45d26d43c9b2bf41c9120003aa';
-- brands|Rodrigo de Jerez|history|ar — douce rendu par خفيفة
UPDATE `brands` SET `history_ar` = 'شركة August Schuster GmbH & Co. KG تاجر سيجار عائلي مقره في مدينة Bünde بألمانيا، ويعود تاريخها إلى مصنع أسسه Hermann Schuster في تلك المدينة عام 1897؛ أما الشركة الحالية فقد سُجّلت في السجل التجاري باسم August Schuster في 27 سبتمبر 1909، بحسب fahr-im-kreis.de — والتاريخان يتداولان بحسب المصدر، فيما تعتمد الشركة نفسها سنة 1909.

ابتكرت الشركة Rodrigo de Jerez، وهو سيجار يُذكّر اسمه ببحّار من طاقم كريستوفر كولومبوس يُنسب إليه أنه أعاد التبغ إلى أوروبا عام 1492، بحسب Cigarworld. وتُطرح العلامة في ثلاث فئات بحسب منشأ التبغ: فئة خضراء، ملفوفة بطريقة Totalmente a Mano (TAM) ومن تبغ هندوراسي بالكامل، بغلاف بنّي داكن وزيتي؛ وفئة حمراء، بغلاف Connecticut Shade فوق حشوة وغلاف داخلي من الجمهورية الدومينيكية، بقوة توصف بأنها قوية؛ وفئة زرقاء، ملفوفة في نيكاراغوا، بغلاف Connecticut (الإكوادور) رقيق وفاتح اللون، فوق حشوة تمزج تبغ بنما ونيكاراغوا وكوستاريكا، توصف بأنها لطيفة بحسب Cigarworld.

لا تذكر المصادر التي تم العثور عليها اسم أي مصنع، في أي من المنابت الثلاثة. وحتى سبتمبر 2026، تُباع الفئات الثلاث لدى عدة تجار تجزئة ألمان (Cigarworld وNoblego وCigarmaxx).'
 WHERE `name` = 'Rodrigo de Jerez' AND SHA1(TRIM(`history`)) = '60d13f9d29e520ba9e15ac32912b8f065f823f0e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rodrigo de Jerez' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '60d13f9d29e520ba9e15ac32912b8f065f823f0e';
-- brands|Rojas Cigars|history|ar — مزّاج, سيجارات, noms latins
UPDATE `brands` SET `history_ar` = 'وُلد Noel Rojas في كوبا وغادرها في نحو العشرين، إلى ميامي ثم إلى نيكاراغوا. وهناك كان أوّلًا مازجًا لغيره: فهو من صنع Draig Cayuquero لـEmilio، وNomad LE Estelí Lot 1386، وسيجار Ezra Zion، وسيجار Stolen Throne. للدور الأربع بطاقاتها.

علامته الخاصة، Guayacan، تعود إلى 2012؛ ومعرضه الأوّل إلى 2013. وبين ذلك واليوم سلسلةُ ورش لم تصمد — Aromas de Jalapa وTabacalera New Order of the Ages وSabor de Estelí، كلّها في إستيلي، وكلّها أُغلقت بعد وقت قصير — ثم، في 2019، تقاربٌ مع Tabacalera Flor de San Luis لثلاثة أصناف من السيجار: KSG وBluebonnets وStatement. تروي هذه البطاقة الإخفاقات لأنّها تفسّر ما يليها.

وما يليها مصنعٌ له، والمكان يقول شيئًا عن الرجل: اشترى Rojas دارَ سينما قديمة في إستيلي، تزيد قليلًا على سبعة آلاف قدم مربّعة، وجعل منها Rojas Cigar Factory. ويعيش بين تكساس — دالاس–فورت وورث، حيث الشركة — ونيكاراغوا، حيث العمل.

وتحمل الخطوط أسماءً ترفض الجدّية: Street Tacos وBluebonnets وStatement. وكان للذكرى العاشرة، سنة 2023، سيجارها.'
 WHERE `name` = 'Rojas Cigars' AND SHA1(TRIM(`history`)) = '084b238322915dae620dc04e2e2a3355d1565abd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rojas Cigars' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '084b238322915dae620dc04e2e2a3355d1565abd';
-- brands|RoMa Craft Tobac|history|ar — noms en alphabet latin
UPDATE `brands` SET `history_ar` = 'RoMa Craft ترفض كلمة «بوتيك» وتفضّل عليها كلمة «حِرَفية». والاسم مأخوذ من مؤسّسيها — RO من Rosales، وMA من Martin — وقد تأسّست الدار رسميًا في 24 يناير 2012.

بدأت في مرآب، وليست هذه استعارة. ففي 2010 ذهب Mike Rosales وSkip Martin إلى إستيلي، والتقيا هناك المازج Esteban Disla، وصنع الثلاثة أوّل سيجار CroMagnon في بيته، في مرآبه. وفي العام التالي بنى Rosales وMartin ورشتهما الخاصة: Fábrica de Tabacos NicaSueño، بمساحة مئتين وعشرين مترًا مربّعًا.

ومنذ ذلك الحين يخرج كلّ شيء من هناك، وهذا ما يميّزها عن معظم دور البوتيك: لها جدران. ويُقرأ الكتالوج كأنّه تاريخ ما قبل التاريخ — CroMagnon وAquitaine وNeanderthal — والمزائج أشدّ تركيبًا ممّا يوحي به حجم الورشة: رابط كاميروني في الأوّلين، وليغيرو مزدوج من بنسلفانيا في الثالث.

أمّا التمييز الذي تتمسّك به الدار — حِرَفية لا بوتيك — فيتعلّق بالمقياس وبالتحكّم: دفعات صغيرة، وتعامل مباشر مع بائعي التجزئة، وورق يُنتقى ورقةً ورقة.'
 WHERE `name` = 'RoMa Craft Tobac' AND SHA1(TRIM(`history`)) = 'c20d962ebf3c43e44182f2266c97af3d1255258f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'RoMa Craft Tobac' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'c20d962ebf3c43e44182f2266c97af3d1255258f';
-- brands|Romeo y Julieta Dominicain|history|ar — بلا رومانا; marques en latin
UPDATE `brands` SET `history_ar` = 'مثل Montecristo، ومثل Punch، ومثل Hoyo de Monterrey، Romeo y Julieta اسمٌ شطره عام 1960. بقيت العلامة الكوبية في هافانا؛ أمّا الاسم خارج كوبا فاستعاده مالكوه السابقون، ويُصنع اليوم في الجمهورية الدومينيكية، في المصنع الضخم نفسه في لا رومانا.

ابتعدت النسخة الدومينيكية عن النموذج الكوبي بصراحة أكبر من غيرها. فحيث يزرع الهافانا المسمّى بالاسم ذاته طابعاً متوسطاً زهرياً، جرّبت الدومينيكية عبر العقود مساحات متنوّعة، من شديد اللطف إلى القويّ، وكثّرت سلاسلها. وذاك امتياز اسمٍ بلا استمرارية وصفة — ومخاطرته أيضاً.

أمّا شكسبير على الشريط فبقي على الجانبين: قصة الحبّ الڤيرونية كانت تزيّن الصناديق منذ القرن التاسع عشر، قبل أن تشطر السياسةُ العلامةَ بوقت طويل.'
 WHERE `name` = 'Romeo y Julieta Dominicain' AND SHA1(TRIM(`history`)) = '0e9f67cf4c679be9be7fa5b7aab890507b01e873';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Romeo y Julieta Dominicain' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '0e9f67cf4c679be9be7fa5b7aab890507b01e873';
-- brands|Room101|history|ar — artistique rendu إبداعيًا; latin
UPDATE `brands` SET `history_ar` = 'وُلدت Room101 من صائغ. أطلق Matt Booth تحت هذا الاسم علامة مجوهرات فضّية عام 2003 في لوس أنجلوس، ثم دخل عالم السيجار عام 2009 باتفاق مع Camacho. إنّه المسار المعتاد معكوسًا: التصميم أوّلًا والورق ثانيًا — ويظهر ذلك على الأحزمة.

ووزّعت Davidoff de Genève العلامة من 2009 إلى 2017. ثم غادر Booth المهنة وقطع صلته بالمجموعة السويسرية التي يضمّها هذا الأطلس باسم Oettinger Davidoff.

واشترت Scandinavian Tobacco Group علامة Room101 عام 2022 وأبقت Booth مديرًا فنيًا. وفي فبراير 2026 أعادت المجموعة توزيع الأوراق: انتقلت العلامة إلى جانب General Cigar، بينما ذهبت Cohiba USA وPunch Honduras إلى Forged. ويضمّ هذا الأطلس الشركتين، وهي الحركة نفسها.

والإنتاج موزّع، وتقول البطاقة ذلك بدل أن تكتمه. فمعظمه يخرج من Tabacalera A.J. Fernández في إستيلي؛ أمّا Farce Nicaragua فمن Joya de Nicaragua، وBig Payback من HATSA في هندوراس. وهذه البطاقة نيكاراغوية لأنّ الأطلس يصنّف بالمكان الرئيسي، لا لأنّ كلّ شيء يُصنع هناك.'
 WHERE `name` = 'Room101' AND SHA1(TRIM(`history`)) = '3ba03bb81b45fa155519617f22786af1adf8b420';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Room101' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '3ba03bb81b45fa155519617f22786af1adf8b420';
-- brands|Royal Jamaica|history|ar — acres; noms en latin
UPDATE `brands` SET `history_ar` = 'Royal Jamaica علامة بلدٍ فقد صناعته في ليلة واحدة. أسّسها James Frederick Gore في كينغستون سنة 1935، وأمسكت بها عائلته ثلاثة أجيال. وحين قطع الحصار الأميركي سنة 1962 الولاياتِ المتحدة عن الهافانا، صارت جامايكا بلد السيجار الأول في الكاريبي خارج كوبا — وصارت Royal Jamaica من العلامات القليلة التي قبلها المدخّنون الأميركيون بديلاً جدّياً.

قام الأسلوب على الورقة المحلّية، الألطف والأجفّ من الكوبية، وعلى مقاسات نحيلة موروثة عن الذائقة البريطانية. نفحات أرز وقشّ وشاي أسود، باحتراق سريع يستدعي سحباً بطيئاً.

في 12 أيلول/سبتمبر 1988، عبر إعصار غيلبرت الجزيرة بكامل قوّته. دمّر مصنع كينغستون الذي بناه جدّ المؤسّس، وأتلف ألف أكر من التبغ في ماي بن. اشتُريت العلامة في العام نفسه ونُقل إنتاجها إلى الجمهورية الدومينيكية، حيث يستمرّ بالاسم ذاته.

إنها من الحالات النادرة التي يمكن فيها تأريخ نهاية صناعة وطنية باليوم.'
 WHERE `name` = 'Royal Jamaica' AND SHA1(TRIM(`history`)) = '6a8a38b92e38c8f45e633bf0b3b7f1f3259e084a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Royal Jamaica' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '6a8a38b92e38c8f45e633bf0b3b7f1f3259e084a';
-- brands|Saint Luis Rey Honduras|history|ar — بلا رومانا; marques latines
UPDATE `brands` SET `history_ar` = 'وُلد Saint Luis Rey في كوبا. أمّا نسخته غير الكوبية فتنتمي إلى تشكيلة Altadis USA وتُلفّ في هندوراس.

غير أنّ خطًّا أحدث يخرج عن هذه العادة: إذ تُصنع Tabacales في جمهورية الدومينيكان، في مصنع Tabacalera de García في لا رومانا — وهو المصنع نفسه الذي يخرج منه Montecristo وRomeo y Julieta وH. Upmann الدومينيكيّون. علامة واحدة غير كوبية، وبلدان، وورشتان.'
 WHERE `name` = 'Saint Luis Rey Honduras' AND SHA1(TRIM(`history`)) = '4cea5d8a7103144928014aacdb8e2da73e9d4985';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Saint Luis Rey Honduras' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '4cea5d8a7103144928014aacdb8e2da73e9d4985';
-- brands|Samana|history|ar — Cibao Valley: ajout
UPDATE `brands` SET `history_ar` = 'يقول cigarworld.de إن Oskar Nausch، وهو طبيب ألماني من فوبرتال متخصص في طب البلدان النامية، هو مالك ومدير Tabacalera Don Esteban في سانتياغو دي لوس كاباييروس بالجمهورية الدومينيكية. ويقول cigar.ch إن المصنع نفسه أسسه Peter Rohner سنة 1997 لحساب دار Wellauer AG السويسرية؛ وقد باءت محاولة أولى بالفشل قبل أن يتولى Nausch إدارته، وتقدّر cigar.ch إنتاجه بنحو 1.2 مليون سيجار سنويًا. ويصنع Nausch هناك أيضًا علامة أخرى هي Capadura. ولا تحدد الدار تاريخ تأسيس Samana.

تُلف Samana يدويًا بالكامل في Don Esteban، ضمن عدة خطوط. يحمل الخط الكلاسيكي غلافًا أمريكيًا من نوع Connecticut Shade Claro ورباطًا دومينيكيًا، في نحو خمسة عشر مقاسًا، من Chico إلى Piramide، بقوة خفيفة، وفق cigarworld.de. ويعتمد خط 1756 غلاف Connecticut من الإكوادور فوق حشوة من Cibao، بقوة متوسطة، وفق noblego.de. أما Nicaragua Line، الأحدث عهدًا، فيجمع بين غلاف Habano 2000 من الإكوادور وحشوة من ligero وseco من إستيلي، بقوة كاملة، في علبة زرقاء وبيضاء، وفق zigarrenversand.ch. وخط Flair مزيج ابتكره Nausch وابنه Adrian، تحت غلاف Connecticut، وفق smokersplanet.de.

تُوزَّع العلامة أساسًا في سويسرا والنمسا، بعلاقة تمتد عشرين عامًا مع تاجر السيجار cigarworld.de، الذي يعرضها في كتالوجه إلى جانب noblego.de وfumar.ch وzigarrenversand.ch في سبتمبر 2026.'
 WHERE `name` = 'Samana' AND SHA1(TRIM(`history`)) = 'a3de2bcedbcdaa0fd257f1eea0d8a5689479432c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Samana' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'a3de2bcedbcdaa0fd257f1eea0d8a5689479432c';
-- brands|Santa Bras|history|ar — noms de personnes en latin
UPDATE `brands` SET `history_ar` = 'Santa Bras ورشة في جورج، على الساحل الجنوبي لجنوب أفريقيا، تقدّم نفسها الصانعَ الوحيد للسيجار في البلاد — وتعيد الصحافة الزراعية سنة 2023 الجملة من فم لفّافها. تبدأ الحكاية، كما ترويها الدار، في التسعينيات هوايةً: يجرّب المؤسّس تبغًا محليًّا، ويخفق بتبغ اللوفلد في الشمال الشرقي، ثمّ يجد واديًا في الكيب الغربية، بين سوارتبرغ وأوتنيكوا، يأخذ منه غلافه ورابطه؛ وتأتي الحشوة من مزارع الكيب الشرقية. ولا تؤرّخ الدار الانتقال من الهواية إلى الشركة، ولا تسمّي المؤسّس؛ وتقف البطاقة عند ذلك.

وما يُعرف فوق ذلك يتّسع له اسمان: Jaco Snyman، المالك، الذي يلفّ بنفسه وتسمّيه الصحافة لفّافًا، وAnnerie Snyman، المقدَّمة بوصفها صاحبة المشروع وراء الدار في برنامج إذاعي اقتصادي. تُعتَّق الأوراق سنتين، كما يقول؛ ولا يشكّل المجفّف بالهواء سوى خُمس التبغ الجنوب أفريقي، الذي يعيش منه ثلاثمئة إلى أربعمئة مزارع، وتلك الحصّة هي التي تصنع السيجار.

سلسلة Navigator — Escobar وGoncalves وDe Coimbra وDe Alenquer، أسماء ملّاحين برتغاليين داروا حول الرأس — هي الخطّ الفاخر، بتبغ محلي كامل؛ أمّا Nonnie المنكّهة وDe La Rey فحشوتها قصيرة، ويتركها الأطلس. وادٍ واحد، ودار واحدة، ومصدر هو في معظمه الدار نفسها: يفتح هذا الأطلس جنوب أفريقيا بما لديه، ويقول ذلك.'
 WHERE `name` = 'Santa Bras' AND SHA1(TRIM(`history`)) = '7c6322cefdeef5490ce7dc2ebfef662d5c7cfca0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Santa Bras' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '7c6322cefdeef5490ce7dc2ebfef662d5c7cfca0';
-- brands|Santa Clara 1830|history|ar — conditionnel perdu; latin
UPDATE `brands` SET `history_ar` = 'ينتج وادي San Andrés، في ڤيراكروس، تبغاً يستخدمه العالم كلّه دون أن يعرف دائماً من أين يأتي: فالغلاف المكسيكي San Andrés، الداكن الحلو، صار في عشرين سنة من أشدّ الأغلفة طلباً في المهنة، حتى داخل الخلطات النيكاراغوية.

تدّعي Santa Clara عام 1830 تاريخاً لتأسيسها، وهو ما يجعلها، لو صحّ، أقدم مصنع في البلاد وأحد أقدم مصانع القارّة. والدار مملوكة لعائلة Turrent التي تزرع الوادي منذ أجيال، وهي اليوم المورّد الرئيسي لغلاف San Andrés خارج المكسيك.

هذا الدور المزدوج هو ما يجعل الدار مثيرة للاهتمام: تبيع ورقتها لمنافسيها وتلفّ بها سيجارها. ولم تكن صفحة المكسيك تضمّ حتى الآن سوى مدخلين، أحدهما ليس علامة مكسيكية أصلاً — وهذا المدخل يصحّح اختلالاً صارخاً.'
 WHERE `name` = 'Santa Clara 1830' AND SHA1(TRIM(`history`)) = '7a64398b6f2f2dd1fa50fc1a54843aae3e8d9fd8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Santa Clara 1830' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '7a64398b6f2f2dd1fa50fc1a54843aae3e8d9fd8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Santa Damiana' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '6d7362cb466fc6ea2d64cde1d5de1467a3ac309f';
-- brands|Schumacher|history|ar — accord verbal السيجار
UPDATE `brands` SET `history_ar` = 'تجمع سلسلة Schumacher Selection بين سائق الفورمولا 1 السابق Ralf Schumacher — الذي لا ينبغي الخلط بينه وبين Michael Schumacher — وشركة Paul Bugge GmbH، دار سيجار من فيلينغن-شفينينغن بألمانيا، التي توزّعها حصريًا، كما تقول Cigarworld.de. وتعلن دار Paul Bugge، المؤسَّسة عام 1951، عن هذه الشراكة في أغسطس 2025 بوصفها تعاونًا بُني حول أذواق السائق؛ ويتولى فرعها Paul Bugge Vertrieb، الذي ينتج ويوزّع سيجاراته الخاصة، مهمة التوزيع، كما تقول MyNewsChannel.

يُلَفّ السيجار بالكامل يدويًا في نيكاراغوا، من حشوة نيكاراغوية مخمَّرة وغلاف Connecticut Shade فاتح، كما تقول Paul Bugge GmbH التي لا تسمي مصنعها. وحتى سبتمبر 2026، تبيعه Cigarworld.de بقياس Double Toro (6 x 60) وبقياس Robusto، بقوة تصفها بأنها خفيفة إلى متوسطة.

تبيع Paul Bugge أيضًا علامتها الخاصة Casa Culinaria، التي تُلَفّ هي الأخرى في نيكاراغوا.'
 WHERE `name` = 'Schumacher' AND SHA1(TRIM(`history`)) = 'c232d4606f93f87032f4b9c7e5bc7f815cab55da';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Schumacher' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'c232d4606f93f87032f4b9c7e5bc7f815cab55da';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Secret Blend of Cuba' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '96649ac7b2b8b46d335ad9368a3e1bba3d951311';
-- brands|Selected Tobacco|history|ar — noms en alphabet latin
UPDATE `brands` SET `history_ar` = 'أطلق Nelson Alfonso شركة Selected Tobacco من كوستاريكا عام 2012، وقدّم منذ البداية Atabey وBandolero، ثم تبعتهما Byron.

ويُلفّ السيجار لدى Tabacos de Costa Rica في سانتياغو دي بوريسكال. والعلامات الثلاث — Atabey وByron وBandolero — لها بطاقاتها. وللدار أيضًا خطّ باسمه، Alfonso.'
 WHERE `name` = 'Selected Tobacco' AND SHA1(TRIM(`history`)) = '22da1ab462369c3d1e335d3fa9f26b439519f193';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Selected Tobacco' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '22da1ab462369c3d1e335d3fa9f26b439519f193';
-- brands|Serino Cigar Co.|history|ar — noms en alphabet latin
UPDATE `brands` SET `history_ar` = 'Serino شأنُ أبٍ وابنه، Tony وCarson، أُطلق سنة 2016 بعد لقاء: لقاء Omar González-Alemán، صاحب La Corona Cigars S.A.، مصنعٍ في إستيلي. هناك ركّبا معًا خطّهما الأوّل، Serino Royale، وهناك يُلفّ كلّ شيء تقريبًا منذ ذلك الحين. ليس لِـLa Corona بطاقة في هذا الأطلس؛ تُسمّى هنا، وستبقى كذلك ما لم تُبرّر علامةٌ خاصة بطاقتها.

وتولّى Carson، الابن، زمام الخطوط التالية: Wayfarer سنة 2017، ثم Taíno — على اسم شعب الكاريبي من قبل كولومبوس. دارٌ تبدأ بمزجة بأربع أيدٍ وتستمرّ بمزجات الابن: تمّ الانتقال في ثلاث سنوات.

يصنّفها هذا الأطلس في نيكاراغوا حيث يُلفّ ما تبيعه، ويحتفظ باسم المصنع وصاحبه، لأنّ هذه هي القاعدة.'
 WHERE `name` = 'Serino Cigar Co.' AND SHA1(TRIM(`history`)) = '523e4b2eda5a9bf6e5ed1f1331a74e2e2a4836c0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Serino Cigar Co.' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '523e4b2eda5a9bf6e5ed1f1331a74e2e2a4836c0';
-- brands|Siglo de Oro|history|ar — nom de marque omis; latin
UPDATE `brands` SET `history_ar` = 'Siglo de Oro مصنعُ سيجار في موسكو — تكفي الجملة لتقول لِمَ توجد البطاقة. افتتحه سنة 2011 Artur Chiliaev، الذي كان يدير شركة بناء و«وُلد والسيجار في فمه» كما يقول شريكه، مع Andreï Ivanov. يعمل فيه خمسة إلى ستّة لفّافين، كلّهم من كوبا ونيكاراغوا؛ ويذهب Chiliaev بنفسه لشراء التبغ في كوبا ونيكاراغوا وجمهورية الدومينيكان، ويركّب خطوط الدار الخمسة ومقاساتها الثلاثة والثلاثين. ويحفظ قبوٌ كبير السيجار مدّة أربعة شهور على الأقلّ، وأطول إن رآه فتيًّا.

يدور الإنتاج حول ثلاثمئة وخمسين ألف سيجار في السنة، تُباع في روسيا وحدها — سوقٌ دخّنت نحو مليونين ونصف مليون سيجار سنة 2020. تروي العلامات البلد: Evgueni Onéguine، بطل بوشكين، في المقدّمة؛ وSiglo de Oro وPelo de Oro وHidalgo بالإسبانية؛ وTchortova Dioujina، دزّينة الشيطان. يفتح هذا الأطلس روسيا مكانَ لفّ لهذه الدار ولـPogar، بلا حقول ولا صنف: كلّ التبغ يأتي من مكان آخر.

تتجاهلها صحافة المهنة الأنجلوفونية؛ وتتابعها صحافة السيجار الروسية منذ عشر سنين، وإيّاها تستشهد البطاقة.'
 WHERE `name` = 'Siglo de Oro' AND SHA1(TRIM(`history`)) = '362b0f59807f31832cb61d3f31a810763d4e1ab4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Siglo de Oro' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '362b0f59807f31832cb61d3f31a810763d4e1ab4';
-- brands|Simon Beltre|history|ar — noms latins; San Vicente
UPDATE `brands` SET `history_ar` = 'Simon Beltre علامة دومينيكية تحملها عائلة Beltré، التي تزرع التبغ في أزوا منذ أجيال عدة. ووفق عدد من الموزّعين الأوروبيين، بدأ المؤسّس Simón Beltré صلته بالتبغ منذ 1976، وهو في الخامسة من عمره، على يد جدّه Andrés Beltré، الملقّب «Don Titi»، ووالده Alcibiades Beltré، في أراضي العائلة. وُلدت علامة SB من هذه القصة سنة 2017.

تُصنع السيجارات يدويًا في المزرعة العائلية، في أزوا؛ ولا يذكر أيّ مصدر رجعنا إليه مصنعًا منفصلًا ولا يحدّد المدينة بدقة أبعد من المقاطعة. ويضمّ الكتالوج الخاص بشكل خاص CSZ، التي يسمّيها موزّع روماني Swiss Chocolate، بغلاف Habano H-2000 إكوادوري وورقة رابطة Olor Dominicano وحشوة من Semilla 2020 وSan Vicente وNegrito وSVM؛ وandullo، المعتّقة في أغلفة سعف النخيل الملكي وفق التقليد الدومينيكي الذي يحمل الاسم نفسه، بحسب مستورد بريطاني. ولا يزال الخطّان مُدرجين في كتالوجات عدة موزّعين أوروبيين.'
 WHERE `name` = 'Simon Beltre' AND SHA1(TRIM(`history`)) = 'dff927cd7268aec39c9b802cb539b81bd05d38da';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Simon Beltre' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'dff927cd7268aec39c9b802cb539b81bd05d38da';
-- brands|Sindicato Cigar Group|history|ar — noms de personnes en latin
UPDATE `brands` SET `history_ar` = 'سينديكاتو علامةُ تجّار، ويجب أن يُقال فورًا فيمَ تختلف عن Black Swan: ليست سلسلةً يطلبها بائع واحد من مصانع متناوبة، بل شركة — Sindicato Cigar Group — أسّسها سنة 2013 مجموعةٌ من أصحاب المتاجر أرادوا امتلاك علامتهم، بكتالوج دائم ورئيس من أهل المهنة، Jim Colucci، نائب الرئيس السابق في Altadis USA. والاسم يقول نمط الملكية.

كلّ شيء يُلفّ لدى Casa Fernández في إستيلي — Aganorsa Leaf اليوم، التي يحمل هذا الأطلس بطاقتها — على أتبغة مزارع Fernández. جرى الإطلاق بثلاث مزجات: Hex بغلاف هابانو إكوادوري، وكونيتيكت إكوادوريان، Affinity وCasa Bella، على حشوتين نيكاراغوية ودومينيكية. وجاء السيجار الذي يحمل اسم المجموعة، Sindicato، بعد ذلك، ثم Particulares، اسمُ علامة كوبية قديمة أُعيد استعماله.

علامةٌ تصوّرها من يبيعونها ولفّها مصنعٌ مسمّى: يحتفظ بها هذا الأطلس، ويقول لماذا.'
 WHERE `name` = 'Sindicato Cigar Group' AND SHA1(TRIM(`history`)) = 'c5ac8ff71a797b37d684230fe8c3f8a90506ad4a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Sindicato Cigar Group' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'c5ac8ff71a797b37d684230fe8c3f8a90506ad4a';
-- brands|Skull 77|history|ar — formule interdite remplacée
UPDATE `brands` SET `history_ar` = 'Skull 77 هي علامة Laurent Taha، الذي يقدّمه Zigarrenversand.ch بوصفه الرجل الذي يقف وراءها، ويكتب rauchr.de اسمه Tahla. ويقول Zigarrenversand.ch إنها تأسست في 7 يوليو 2014، وهو التاريخ الذي جاء منه الرقم 77. وبحسب rauchr.de، فإن Tahla، الذي يعمل في مجال السيجار والذوق منذ ما يزيد على عشرين عامًا، يتعرّف في عام 2014، خلال جلسة تذوق، إلى Marc Niehaus، الذي يقدّمه بوصفه مالك Vegas de Santiago Cigars؛ ويصبح الاثنان صديقين ويطوّران الخلطة مع blendmaster في مصنع سيجار فاخر في كوستاريكا.

يذكر Cigarworld.de و rauchr.de أن الجهة المصنِّعة هي Tabacos de Costa Rica S.A.، وأن المستورد هو Casagranda Cigars GmbH في Esslingen؛ ويتحدث Zigarrenversand.ch عن مصنع Vegas de Santiago في كوستاريكا. وتكتب Casdagli أن تعاونها مع Tabacos de Costa Rica SA، التي كانت تُعرف حينها باسم Vegas Santiago، بدأ في عام 2012؛ ويضع Cigar Coop مصنع Tabacos de Costa Rica في Santiago de Puriscal.

تضم العلامة أربعة مقاسات، ملفوفة يدويًا باستخدام longfiller، بغلاف خارجي H-2000 من الإكوادور. وفي أكتوبر 2026، يُدرج Zigarrenversand.ch و Humidor.ch هذه المقاسات في كتالوجهما، بينما يُبقي Cigarworld.de و rauchr.de على Unicos، المدرجة في الكتالوج منذ 27 يونيو 2018، بوصفها أصنافًا من نهاية السلسلة، مع ثلاث عشرة قطعة في المخزون؛ ويشير Zigarrenwelt.de كذلك إلى Niños، المدرجة في الكتالوج منذ 20 ديسمبر 2019.'
 WHERE `name` = 'Skull 77' AND SHA1(TRIM(`history`)) = 'af2623e8ba9513416ce29206cf3fefe5dbb61146';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Skull 77' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'af2623e8ba9513416ce29206cf3fefe5dbb61146';
-- brands|Southern Draw|history|ar — marques et noms en latin
UPDATE `brands` SET `history_ar` = 'Southern Draw دار زوجين. أسّسها Robert وSharon Holt عام 2014؛ وهو من قدامى محاربي الجيش الأمريكي، وتقول الدار ذلك بدل أن تسكت عنه.

ولا تلفّ إلا في مكان واحد: Tabacalera A.J. Fernández في إستيلي. وهذا نادر بين الدور التي لا مصنع لها — فـCrowned Heads وDunbarton وRoom101 تستعمل كلٌّ منها عدّة مصانع، وقد صار هذا التشتّت قاعدة مشهد البوتيك.

وتحمل سلسلتها الأوسع شهرة اسم زوجته. Rose of Sharon نبتة، لكنّها قبل ذلك Sharon Holt؛ وتجعل الدار من ذلك محور خطابها — ما تسمّيه ثقافة الشرف، القائمة على الأسرة والإيمان والصحبة.

أمّا بقية السلاسل فتحمل أسماء نباتات وتضاريس من الجنوب الأمريكي: Kudzu وCedrus وJacobs Ladder وManzanita. إنّه انتماء إقليمي مُعلَن، لعلامة يأتي تبغها كلّه من أمريكا الوسطى.'
 WHERE `name` = 'Southern Draw' AND SHA1(TRIM(`history`)) = '9ecb230e266c1630b2dd4b87b78c06054bd604b6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Southern Draw' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '9ecb230e266c1630b2dd4b87b78c06054bd604b6';
-- brands|Spartanos|history|ar — caviste mal traduit
UPDATE `brands` SET `history_ar` = 'Spartanos هي علامة بائع الخمور الألماني Jürgen Ring، مالك Crazy Store في بيزينغن؛ وهو يستمد اسمها من سنوات ممارسته الفنون القتالية وكمال الأجسام ومن فيلم 300، بحسب Cigarworld.de. وأُنجزت النسخة الأولى مع Kurt Brandt في نيكاراغوا؛ ويُلفّ السيجار بالكامل باليد في نيكاراغوا، ولا تسمّي الدار مصنعها.

وقد بيعت سلسلة أولى، بغلافَي Connecticut وMaduro، حتى عام 2022. وفي سبتمبر 2026، يبيع Cigarworld.de ثلاثة خطوط، جميعها بقياس Robusto وبقوة متوسطة: Connecticut، بغلاف Connecticut فوق رباط وحشوة دومينيكيين؛ وMaduro، puro نيكاراغوي؛ وLimitada 2022، puro نيكاراغوي. ويبيع Jürgen Ring أيضًا رُم Spartanos، بحسب تاجر التجزئة نفسه.'
 WHERE `name` = 'Spartanos' AND SHA1(TRIM(`history`)) = '20f72426be5c1befdadf04a2c56346f4f7e55fcf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Spartanos' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '20f72426be5c1befdadf04a2c56346f4f7e55fcf';
-- brands|Stauffenberg|history|ar — noms de personnes en latin
UPDATE `brands` SET `history_ar` = 'Stauffenberg علامة ألمانية يحملها Maik Neubauer، الذي أراد ابتكار سيجاره الهندوراسي الخاص. تُلفّ يدويًا في La Pequeña Vega، وهو مصنع عائلي في دانلي بهندوراس. وصلت الطبعة الأولى إلى ألمانيا في مايو 2025، بإصدار محدود من 3000 قطعة، قبل أن تتوسّع شبكة البيع لتشمل النمسا وسويسرا.

يُكتب الكتالوج بطبعات مرقّمة بدل خطوط تحمل أسماء. فالطبعة Edition 1 هي Pyramides من puro Criollo 98 هندوراسي خالص: غلاف وورقة رابطة وحشوة من التبغ نفسه. والطبعة Edition 2، وهي أيضًا Robusto من puro Criollo هندوراسي، تُباع منذ سبتمبر 2025. والطبعة Edition 3، وهي Toro قوية تُلفّ في دانلي، أُعلن عن طرحها في نوفمبر 2025. وكانت هناك طبعة Edition 4، بغلاف candela، أُعلن عنها من أجل 2026. ووفق الدار، يكرّم اسمها Claus Schenk Graf von Stauffenberg والمقاومين الألمان للنازية.'
 WHERE `name` = 'Stauffenberg' AND SHA1(TRIM(`history`)) = 'dfe322c2afe07d81b42acc1adb247b309b4df90a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Stauffenberg' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'dfe322c2afe07d81b42acc1adb247b309b4df90a';
-- brands|Stolen Throne|history|ar — latin، سيجارات = cigarettes
UPDATE `brands` SET `history_ar` = 'Stolen Throne — العرش المسروق — دارٌ من فرجينيا لم تلفّ سيجارًا بنفسها قطّ، وتقول ذلك. أطلقها Richard «Lee» Marsh سنة 2019 بالشراكة مع Noel Rojas، المزّاج الكوبي في إستيلي الذي يحمل هذا الأطلس بطاقته: خرج السيجار الأول من Tabacalera Flor de San Luis، حيث كان Rojas يعمل آنذاك، قبل Rojas Cigar Factory. واختارت Ezra Zion وNomad وEmilio الاختيار نفسه؛ فـRojas يلفّ لأربع دور في هذا الأطلس.

صنع الخطّان الأوّلان السمعة: Crook of the Crown، المغتصب، وCall to Arms، النداء إلى السلاح. وتبعهما Three Kingdoms وYorktown Fleet — الثاني باسم من حرب الاستقلال، وفرجينيا تُلزم. وكان للذكرى الخامسة سنة 2024 سيجارها Corona.

اسمُ علامة يروي قصّة، ومزّاجٌ مسمّى، ومصنعٌ مسمّى: ذلك ما يطلبه هذا الأطلس، وليس للبطاقة ما تضيفه.'
 WHERE `name` = 'Stolen Throne' AND SHA1(TRIM(`history`)) = 'b70c59a43007b0846f39609de92c40bb39dfa871';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Stolen Throne' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'b70c59a43007b0846f39609de92c40bb39dfa871';
-- brands|Suerdieck|history|ar — عبارات محظورة، رتبة، latin
UPDATE `brands` SET `history_ar` = 'غذّى تبغ باهيا، المزروع في «ريكونكاڤو» حول كروز داس ألماس، ما يزيد على قرن صناعةَ سيجار كانت تصدّر إلى أوروبا قبل أن تهيمن أميركا الوسطى على السوق بزمن طويل. وكانت Suerdieck الأوسع شهرة بين بيوتها — ولم تعد موجودة.

وصل August Suerdieck، وهو ألماني، إلى باهيا سنة 1888 موظفاً لدى شركة من هامبورغ، مكلّفاً بالإشراف على رزم التبغ. وبعد أربع سنوات اشترى مستودع مُشغّله وأسّس داره الخاصة. ثم تبع ذلك صنع السيجار، في ماراغوجيبي ثم في كروز داس ألماس، وصارت Suerdieck المنتج الأول في البلاد.

وتبغها — mata fina، الداكن الحلو ذو الحموضة الخاصة — لا نظير له في أي مكان. مذاق يجده المدخّنون المعتادون على الطابع الكوبي مربكاً عند النفس الأول: أشدّ فاكهية، يكاد يكون خمرياً، باحتراق سريع يستدعي سحباً أبطأ.

في سنة 2000، بعد مئة وثماني سنوات، أغلقت الدار مصنعها الأخير. ويحتفظ بها الأطلس لِما تمثّله: ذاكرة بلد منتج همّشته جغرافيا السيجار الفاخر — ومحته هذه المرّة.'
 WHERE `name` = 'Suerdieck' AND SHA1(TRIM(`history`)) = 'b1f7f17329cec904f408f9c629fe0878b32412fc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Suerdieck' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'b1f7f17329cec904f408f9c629fe0878b32412fc';
-- brands|Swag|history|ar — marques et personnes en latin
UPDATE `brands` SET `history_ar` = 'Swag هي العلامة الثانية لـBoutique Blends، دار Rafael Nodal التي يضمّها هذا الأطلس. وتخرج من الورشة نفسها التي تخرج منها Aging Room: Tabacalera Palma لـJochy Blanco في تامبوريل.

ولا تقصد العلامتان المدخّن نفسه، وهنا تحديدًا تكمن فائدة وضعهما جنبًا إلى جنب. تتحدّث Aging Room عن التعتيق والخانات والمواسم؛ أمّا Swag فتأخذ اسمًا من العاميّة الأمريكية وهويّة بصرية صريحة. الأولى تخاطب الجامع، والثانية من يريد سيجارًا جيّدًا بلا مراسم.

وتحمل Boutique Blends أيضًا King Havano والسيجار المباع تحت علامة Oliveros — وهذا يفسّر لماذا لا بطاقة منفصلة لـOliveros في هذا الأطلس: فهي ليست دارًا، بل علامة تابعة لتلك الدار.'
 WHERE `name` = 'Swag' AND SHA1(TRIM(`history`)) = '9ff091a512247d46f0213b4692ee98746505f6e1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Swag' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '9ff091a512247d46f0213b4692ee98746505f6e1';
-- brands|SYN|history|ar — accord, date, formule
UPDATE `brands` SET `history_ar` = 'يقول synbrands.com إن Joseph Casimir أسس Tabacalera SYN في تامبوريل، بمقاطعة سانتياغو، في الجمهورية الدومينيكية. ويعود شغفه بالسيجار إلى سنة 1990، أي أسبوعه الجامعي الأول؛ وأسس الدار بعد ذلك بثلاثة عقود، عقب مغامرات تجارية متنوعة؛ ولا تحدد الدار تاريخ هذا التأسيس.

تقول الدار إن Juan Rodriguez يدير المصنع بصفته كبير خبراء المزج، وله ما يزيد على خمسة وثلاثين عامًا من الخبرة اكتسبها لدى علامات أخرى قبل انضمامه إلى SYN. ويعمل عن كثب مع Leo Reyes، المالك الحالي لـDe Los Reyes Cigars، في اختيار التبوغ.

في سبتمبر 2026، يضم الكتالوج خطين. يُلف The Original SYN بنسختين من الغلاف، إحداهما من Habano HVA معتّق خمس سنوات، والأخرى من Corojo Maduro معتّق خمس سنوات، فوق رباط دومينيكي وحشوة من Corojo كوبي الأصل مزروع في الجمهورية الدومينيكية، بمقاسي Petit Robusto وSalomon. ويجمع The Seven Syns سبعة مزائج تحمل أسماء الخطايا السبع — GULA وIRA وACEDIA وAVARITIA وLUXURIA وSUPERBIA وINVIDIA — من تبغ معتّق خمس سنوات، معظمه دومينيكي، وفق الدار.

تُباع SYN عبر كيانات خاصة بها: SYN Cigars, Inc. (ميامي)، وSYN Europe GmbH (ألمانيا)، وSYN Asia, Ltd. (فيتنام)، وOlmaq Trading NV لمنطقة الكاريبي، مع ممثلين في إسرائيل وأفريقيا والهند.'
 WHERE `name` = 'SYN' AND SHA1(TRIM(`history`)) = '22903921f9d6a1deffec5462be928a83b0f1af4f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'SYN' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '22903921f9d6a1deffec5462be928a83b0f1af4f';
-- brands|T. Sonthi|history|ar — villes non traduites
UPDATE `brands` SET `history_ar` = 'يدير Thomas Sontheimer في مدينة لاوبهايم بألمانيا دار T. Sonthi Rum & Cigars: روم منذ عام 2020، ثم سيجار نيكاراغوي مصنوع يدويًا ابتداءً من عام 2022، بحسب موقع الشركة، الذي يقدّم النشاطين باعتبارهما وجهين لولع واحد بالمشروبات الروحية والتبغ المُعتَّقين.

لا هذا الموقع ولا تاجر التجزئة Cigarworld.de، الذي يصنّف العلامة ضمن سيجار نيكاراغوا، يُسمّي المصنع الذي يلفّه.

تضم التشكيلة أربع سلاسل بحشوة طويلة، كلها برباط وحشوة من كونديغا، على بعد أربعين كيلومترًا شمال إستيلي، بحسب Cigarworld.de: Anne Bonny، بغلاف إكوادوري من نوع claro مُجفَّف أربعة شهور؛ وBlackbeard، بغلاف إكوادوري من نوع viso مُخمَّر ثمانية شهور ليصبح maduro؛ وTortuga، بمظهر طبيعي ومقاس قصير؛ وLuxury-Edition، بمقاس طويل وبلونين. وتستعيد الأسماء طابعًا قرصانيًا: فAnne Bonny وBlackbeard قرصانان تاريخيان، وTortuga الجزيرة الكاريبية التي كانت ملاذًا للقراصنة.'
 WHERE `name` = 'T. Sonthi' AND SHA1(TRIM(`history`)) = '0b8a4f49bbac51dfb25f8d69dde973dd49e5c4dc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'T. Sonthi' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '0b8a4f49bbac51dfb25f8d69dde973dd49e5c4dc';
-- brands|Tabacalera|history|ar — nom latin، accord السيجار
UPDATE `brands` SET `history_ar` = 'تنشأ Tabacalera من قرار إداري استعماري. فالاحتكار الإسباني للتبغ في الفلبين، الذي فُرض سنة 1780 بحسب Philstar (2011)، يُلغى في 5 حزيران/يونيو 1881؛ وتُؤسَّس Compañía General de Tabacos de Filipinas في السنة نفسها على يد ماركيز كوميّاس Antonio López y López، في 11 تشرين الثاني/نوفمبر بحسب Philstar، وفي 26 تشرين الثاني/نوفمبر بحسب Verafiles (2014). وتشتري مصانع سيجار، وتوحّد الجودة، وتصدّر «سيجار مانيلا».

تقدّم دار Tabacalera Incorporada نفسها اليوم بوصفها مصنع سيجار في آسيا يؤرّخ عمله اليدوي بسنة 1881 (tabacalera.com.ph، تشرين الأول/أكتوبر 2026)، بتبغ من إيزابيلا ومن مواضع أخرى. أما العلامة الرائدة للشركة، La Flor de la Isabela، فقد أُعيدت تسميتها Tabacalera تكريمًا للشركة المؤسِّسة (Philstar، 2011).

عرفت المجموعة عدة مالكين. تصف Verafiles (2014) شركة إسبانية بيعت قطعةً قطعةً من خمسينيات القرن الماضي إلى تسعينياته، بما فيها علامة La Flor de la Isabela، ثم سلسلة من عمليات الشراء الأجنبية من 1997 إلى 2007 حتى CDF International، وهي شركة هولندية. وتكتب Philstar (2011) أنّه بعد قرن تبيع الـCompañía نشاطها في السيجار وأنّ المصنع ينتقل إلى أيدٍ فلبينية. ويقع المصنع في داسماريناس بمقاطعة كافيتي على نحو 2700 متر مربع، حيث يُصنع السيجار يدويًّا، بمكابس خشبية يزيد عمرها على قرن (Philstar، 2011).

أسماء مشابهة: هذه البطاقة هي بطاقة Tabacalera Incorporada (الفلبين). ولا صلة لها بـTabacalera, S.A.، الشركة الإسبانية (الاحتكار الإسباني، وAltadis، الشريكة في ملكية Habanos)، ولا بـTabacalera del Oriente أو Palma أو Paxtián أو William Ventura.'
 WHERE `name` = 'Tabacalera' AND SHA1(TRIM(`history`)) = 'f1ad2d3bce91f84fe111559ac29d083359dd1e7b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacalera' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'f1ad2d3bce91f84fe111559ac29d083359dd1e7b';
-- brands|Tabacalera del Oriente|history|ar — puros الوحيد، أسماء latin
UPDATE `brands` SET `history_ar` = 'Tabacalera del Oriente مصنع تارابوتو، في مقاطعة سان مارتين الأمازونية، وتسمّيه وكالة الأنباء البيروفية مصنع puros الوحيد في البلاد. تواريخه لا تتّفق: مزرعة أُقيمت في منتصف القرن العشرين، تقول الوكالة نفسها؛ شركة تأسّست سنة 1997، يقول كاتب عمود أمريكي؛ مؤسّسة عمرها نحو عشر سنوات في 2011، يكتب مدوّن من ليما — تكتبها البطاقة كلّها. وما يتقاطع: بدأت باستيراد البذور والأوراق واللفّافين من كوبا، وتصنع منذ 2004 سيجارًا بتبغ بيروفي كامل. تمسكها عائلة Lettieri — Salvatore، العميد، وGennaro، المدير —؛ وشركاء غادروا قبل 2011 أسّسوا من جانبهم علامة، Café del Mundo.

الحقول في خوان غيرا، على خمسة عشر كيلومترًا من المدينة على طريق يوريماغواس: 90 هكتارًا سنة 2016، ثلاثة أصناف — Negro وPelo de Oro وCriollo — وإمكانية لا يملكها الكاريبي، هي الزراعة على مدار السنة. يُباع التبغ أوّلًا ورقًا، 80 إلى 100 طن في السنة إلى أمريكا الوسطى، سبعة أعشار الرقم؛ أمّا السيجار، 500 ألف في السنة عام 2016 ومليون بحسب صحافة 2023، فيذهب 80 % منه إلى التصدير في أوروبا وآسيا. اللفّافات نساء في معظمهنّ، أدارهنّ نحو 2011 معلّمان كوبيان؛ وحمل عقد إيطالي سنة 2011، 220 ألف دولار، علامة الموزّع.

ثلاث علامات خاصّة — Señor de Sipán تحت قناع الموتشيكا لسيّد سيبان، وMiguel Grau، وSan Martín — وخطّ من السيجار الصغير. وجد متذوّق سنة 2017 أنّ Señor de Sipán قصير الحشوة؛ تقول البطاقة ذلك من دون أن تحسم للمجموعة كلّها. تدخل بيرو الأطلس عبر هذا المصنع، بمنطقتها خوان غيرا.

Inca ليست علامة للمصنع: فهي ملك Mitchell Orchant، مدير تاجر التجزئة البريطاني C.Gars Ltd، الذي أطلقها في 2012 في المملكة المتحدة باسم Inka Secret Blend. وهي puros من بيرو تُلَفّ في تارابوتو لدى Tabacalera del Oriente. وتُكتب النسخة الأمريكية Inca؛ وفي 2015 كانت Alec Bradley تتولى توزيعها. وفي أكتوبر 2026 يبيع المتجر الألماني Tabak Träber النسخة Inca Tambo، التي توزعها Kopp Tobaccos، وتعرض متاجر بريطانية Inka Secret Blend.'
 WHERE `name` = 'Tabacalera del Oriente' AND SHA1(TRIM(`history`)) = 'a4e27680a63f4fc119da82912a01ca425e59d902';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacalera del Oriente' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'a4e27680a63f4fc119da82912a01ca425e59d902';
-- brands|Tabacalera Palma|history|ar — formule, noms latins
UPDATE `brands` SET `history_ar` = 'Tabacalera Palma ليست علامة، بل المصنع الذي تخرج منه أربع من علامات هذا الأطلس. أقامه José Arnaldo Blanco II عام 1925 وأودع تسجيله الصناعي عام 1936، بحسب الدار في صفحتها التعريفية؛ وصفحتها الرئيسية وCigar Coop، الذي يذكر في مارس 2026 أنّ عمره تسعون سنة، تحسبان النشاط منذ 1936، ويكتب مقال لـ Premium Cigar Association في أبريل 2024 التاريخين معًا. وكان أبوه، José Manuel Blanco Lozada، إسبانيًا وصل إلى الجمهورية الدومينيكية — في منتصف القرن التاسع عشر بحسب الدار، التي تضع هناك أصول الشركة؛ وفي أواخر ثمانينيات القرن التاسع عشر بحسب مقال لـ Premium Cigar Association في أبريل 2024.

ويديره اليوم José «Jochy» Blanco. وهو الجيل الرابع من مزارعي العائلة والثالث على رأس الدار — وهو تواصل نادر في مهنة بدّل فيها كلّ اسم تقريبًا أصحابه.

وفي 1995 نقل المصنع إلى منطقة حرّة أنشأها بنفسه، في تامبوريل بضواحي سانتياغو. واسمها La Palma، ومن هنا يأتي الخلط المتكرّر بين اسم المنطقة واسم الشركة. ويعمل فيه ما يزيد على ثلاثمئة وخمسين شخصًا، يزيد عدد النساء بينهم على سبعة من كلّ عشرة.

يلفّ المصنع علامته الخاصة La Galera، ويصنع لغيره: Aging Room وSwag لـRafael Nodal — غير أنّ La Bohème وQuattro Nicaragua من Aging Room تُصنعان منذ 2025 لدى A.J. Fernandez في نيكاراغوا —، وMatilde التي يضمّها هذا الأطلس. وهو أيضًا الذي يمزج Trinidad Santiago لـAltadis — مصنع دومينيكي يصنع سيجارًا باسم كوبي، وهو ما يلخّص هذا البلد تلخيصًا لا بأس به.'
 WHERE `name` = 'Tabacalera Palma' AND SHA1(TRIM(`history`)) = '155ff4c91e1b2616f965d57a3ab37da4bfe5fce9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacalera Palma' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '155ff4c91e1b2616f965d57a3ab37da4bfe5fce9';
-- brands|Tabacalera R. Paxtián|history|ar — cigarettes, San Andrés, latin
UPDATE `brands` SET `history_ar` = 'Tabacalera R. Paxtián دار مزارعين قبل أن تكون دار سيجار. دخل Don Juan Rodríguez López، من سيواپان في وادي San Andrés Tuxtla، حقول التبغ في الرابعة عشرة، وتزوّج في الخامسة عشرة، وزرع حتّى سبعة هكتارات على أرض مستأجرة منذ 1910، وكان يلفّ لنفسه سيجار jolochitos، وعمل حتّى السادسة والتسعين قبل أن يموت في الثانية بعد المئة؛ لم يترك شركة، تقول صحافة السيجار المكسيكية، بل معرفة. وابنه Víctor، في الحقول في السنّ نفسها، صار ينسّق حتّى ثلاثمئة هكتار، بطنّين للهكتار، وما زال ينهض قبل الفجر بعد الثالثة والثمانين.

أمّا الشركة فمن سنة 1990: Víctor وابنه Francisco — Paco، المهندس الصناعي المتخرّج سنة 1994 الذي رسم كلّ العلامات — وأخ، على أرض هذه المرّة لهم. يبدأ السيجار الفاخر سنة 1994 بـLos Puros del Paraíso؛ ثمّ Privilegios وR. Paxtián والقياسات الصغيرة TabaRicos، كلّها ملفوفة يدويًّا في سيواپان على تبغ Negro San Andrés الذي تعدّه الدار أجود غلاف ناضج — والدار هي القائلة. ووصل جيل رابع، الأحفاد، في السنوات الخمس الأخيرة.

هذا مصنع في San Andrés: إلى جانب آل Turrent وSanta Clara، عائلة من الوادي احتاجت قرنًا لتوقّع أوراقها باسمها.'
 WHERE `name` = 'Tabacalera R. Paxtián' AND SHA1(TRIM(`history`)) = '8006a95f169417ff61af7e0e7678c2df44b2bc18';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacalera R. Paxtián' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '8006a95f169417ff61af7e0e7678c2df44b2bc18';
-- brands|Tabacalera William Ventura|history|ar — noms latins، سيجارات
UPDATE `brands` SET `history_ar` = 'Tabacalera William Ventura مصنعٌ في تامبوريل، في المنطقة الحرة بسانتياغو، وهو يلفّ لعدّة دور: هناك تُركَّب مزجات Caldwell، وهناك انتهى الأمر بـLa Barba إلى تركيب مزجاتها، وهناك تُلفّ ADVentura وFreud.

يأتي William Ventura من Davidoff، حيث أدار الإنتاج سنوات طويلة — وكان هناك أصلًا حين وصل سيجار Davidoff إلى الولايات المتحدة سنة 1991. فتح مصنعه الخاص نحو 2007؛ وتختلف المصادر بسنة واحدة، وهذه البطاقة تقول ذلك بدل أن تختار. والتحق به أبناؤه: Henderson Ventura، المزّاج، الذي يتكرّر اسمه في التعاونات؛ وWiber، عشرون سنة في Davidoff قبل أن يغادر سنة 2019 ليبني شيئًا مع أبيه؛ وNataly، في اللوجستيات والتغليف والمالية، وفي المزج أيضًا.

في 26 أيلول/سبتمبر 2022، قبل الثالثة فجرًا، شبّ حريق في المبنى الذي كان المصنع يتقاسمه مع Intercigar. احترق كلّ شيء: نحو 800 ألف سيجار في انتظار التغليف أو التعتيق لـVentura، و700 ألف سيجار جاهز لـIntercigar، والمادّة الخام. نحو مئة موظّف، وأقلّ من أربعين لافًّا، ولا مصابين. وأعلن Robert Caldwell في الأسبوع نفسه أنّ الإنتاج سيُستأنف في ورش فرعية وفي El Maestro، المصنع الصغير الذي احتفظت به العائلة لعلاماتها الخاصة.

أعاد المصنع الجديد، بالاسم نفسه، فتح أبوابه في آذار/مارس 2024، والمصنعان يعملان اليوم. ومنذ ذلك الحين عهدت إليه Scandinavian Tobacco Group بسيجار Partagás Y Nada Más Santiago — علامة مجموعة في مصنع عائلي، وهو ما يقول رأي المهنة فيه.

علامتاه الخاصتان هما William Ventura وEl Maestro. لكنّ البطاقة موجودة أوّلًا من أجل الآخرين: إنّه مصنع يلفّ لدور بلا مصانع، وهذا الأطلس يُلزم نفسه بتسمية من يصنع ماذا.'
 WHERE `name` = 'Tabacalera William Ventura' AND SHA1(TRIM(`history`)) = '9886787e779726db01b8c3226a1876c9bdda15c5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacalera William Ventura' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '9886787e779726db01b8c3226a1876c9bdda15c5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacosta' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '7bf9eb43104265954e6feb73ea28f0fdc073d697';
-- brands|Tabaqueria de Filipinas|history|ar — formule, contresens, noms
UPDATE `brands` SET `history_ar` = 'Tabaqueria de Filipinas دارُ متقاعد. أمضى Gabriel Ripoll Jr. — «El Magnifico» كما تسمّيه شركته — حياته المهنية مديرًا ومستشارًا في السيجار منذ الستينيات، من هونغ كونغ إلى الجمهورية الدومينيكية، حين تقاعد سنة 1993 وافتتح ورشة صغيرة في جادّة تافت بمانيلا: أربعة موظّفين سابقين، وابنه الأصغر، واسمٌ أخذه من أبيه. وتتحدّث صحافة المهنة عن خمسة لفّافين في بيت يعود إلى ما قبل الحرب، مستأجر في مانيلا القديمة.

صارت الورشة مصنعًا في سان بيدرو، في لاغونا، بما يزيد على مئتي شخص — تقول الدار مئتين وخمسين — وخمسة عشر ألف سيجار في اليوم، وعلب نارّا من صنعها. يأتي التبغ من مزارع الدار في وادي توباو شمال لوزون، ومن إيسابيلا، المقاطعة التاريخية للسيجار الفلبيني؛ والغلاف وحده إندونيسي — جاوة، كما جرت العادة في مانيلا منذ قرن. ثلاث علامات: Antonio Gimenez، وIndependencia 1898 — سنة الجمهورية —، وFlor de Filipinas. ويدير الدار أبناء المؤسّس الثلاثة.

الدور الفلبينية الثلاث الأخرى كلّها وريثة Tabacalera الإسبانية لسنة 1881. وهذه أولاها تأسيسًا منذ ذلك الحين، وتلفّ للآخرين: تسجّل البطاقة ذلك من دون أن تعرف لمن.

أحدث مصدر هو صحافة التبغ الآسيوية سنة 2016، التي جعلتها كبرى مصانع السيجار في البلاد رغم حداثتها: ما يزيد على مئتي شخص، وخمسة عشر ألف سيجار ملفوف يدويًّا في اليوم، تحت علامات Antonio Gimenez وIndependencia 1898 وFlor de Filipinas.'
 WHERE `name` = 'Tabaqueria de Filipinas' AND SHA1(TRIM(`history`)) = '7afc64da1ce02f8212945f1859047f97a0452bb0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabaqueria de Filipinas' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '7afc64da1ce02f8212945f1859047f97a0452bb0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tambor Essence' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '0d30de13f0de4c15f36fd538ca6ade53e92f0817';
-- brands|Taru Martani|history|ar — noms en alphabet latin
UPDATE `brands` SET `history_ar` = 'تمدّ جاوة وسومطرة منذ القرن التاسع عشر أوروبا بتبغ استخدمته على نطاق واسع: فغلاف سومطرة كسا أجيالاً من السيجار الهولندي والألماني والبلجيكي. لكن إندونيسيا، في مخيال السيجار، تبقى مورّداً — لا بلد بيوت.

و Taru Martani تصحّح ذلك. تأسّست سنة 1918 على يد الهولندي N.V. Negresco واستقرّت في يوغياكارتا بعد ثلاث سنوات، وتبدّل مالكو المصنع مع الاحتلالات — الهولندي ثم الياباني — قبل أن يعود إلى إندونيسيا سنة 1949.

حينها منحه السلطان Hamengkubuwono IX اسمه الحالي: Taru Martani، أي «الورقة التي تمنح الحياة» بالجاوية. الاسم نفسه يروي استعادةً، ويصعب أن تجد في مكان آخر سيجاراً تقول تسميتُه استقلالاً بهذا الوضوح.

والدار، أقدم دور البلاد، لا تزال تلفّ معظم إنتاجها يدوياً وتصدّر إلى أوروبا وآسيا. وهي اليوم الدار الإندونيسية الوحيدة في هذا الأطلس: فالبطاقتان الأخريان للبلد كانتا تحملان علامتين هولنديتين آليّتَي الصنع، والسيجار الآلي لا مكان له هنا.'
 WHERE `name` = 'Taru Martani' AND SHA1(TRIM(`history`)) = '5f556b9b22a963eb04bb2d310076fc1984c828c1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Taru Martani' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '5f556b9b22a963eb04bb2d310076fc1984c828c1';
-- brands|Tatuaje|history|ar — formule, noms latins
UPDATE `brands` SET `history_ar` = 'وُلدت Tatuaje من لقاء بين كاليفورني شغوف وعائلة كوبية من اللافّين. كان Pete Johnson يبيع السيجار في متجر بلوس أنجلوس حين أقنع José Pepín García، الذي كان يلفّ آنذاك في ميامي، بأن يركّب له خلطة. خرج أول Tatuaje من ورشة صغيرة جداً؛ ثم تبع الإنتاجُ آلَ García إلى إستيلي، حيث صار مصنعهم من المصانع الأعلى سمعةً في البلاد.

أهمّية العلامة أنها جاءت في اللحظة المناسبة بالفكرة المناسبة: سيجار يُصنع بالطرائق الكوبية، من تبغ نيكاراغوي، ويُباع لمدخّن أميركي محروم من الهافانا. إنها لا تقلّد الكوبي، بل تستعير قواعده — المقاسات، البناء، إيقاع الاحتراق — وتملؤها بمادة أشدّ صراحة.

الاسم يعني «الوشم»، ومؤسّسها يحمل بعضه. علامة تبنّت مبكراً جماليّة شخصية، على عكس مهنة كانت آنذاك شديدة التعلّق بالشعارات والتيجان. وجزء من التعلّق الذي تثيره نابع من ذلك: أنت تعرف من يقف خلفها.'
 WHERE `name` = 'Tatuaje' AND SHA1(TRIM(`history`)) = '9623bd96602d29e79eb08d514b45c05ebda0f458';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tatuaje' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '9623bd96602d29e79eb08d514b45c05ebda0f458';
-- brands|Teatro del Mundo|history|ar — ville non traduite
UPDATE `brands` SET `history_ar` = 'Teatro del Mundo من ابتكار دار August Schuster في بونده، في شمال الراين-وستفاليا، بحسب Tabakhaus Schall في يونيو 2023؛ ويذكر Cigarworld.de وFalkum.de أن المستورد هو Schuster. وأُنشئت الشركة في 27 سبتمبر 1909 على يد August Schuster، امتدادًا لمصنع افتتحه Hermann Schuster عام 1897، بحسب ما تقوله على موقعها الإلكتروني. ولا تسمّي الدار المصنع النيكاراغوي الذي يلفّ Teatro del Mundo.

يقتصر الخط على سيجار واحد، هو puro نيكاراغوي مُلفوف بالكامل يدويًا ومنكَّه، يُباع بمقاس Robusto طوله خمس بوصات وcepo 50، بقوة متوسطة، بحسب Cigarworld.de. ويصفه Falkum.de بأنه تغلب عليه نكهات الشوكولاتة، ويربط مظهره بكرنفال البندقية: تزيّن أقنعة البندقية الحلقة الثانية والعلبة.

وفي سبتمبر 2026، لا يزال يبيعه Cigarworld.de وFalkum.de وPeterheinrichs.de.'
 WHERE `name` = 'Teatro del Mundo' AND SHA1(TRIM(`history`)) = '870e51618cb9dc1c8f3ee29a2e207e05562949de';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Teatro del Mundo' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '870e51618cb9dc1c8f3ee29a2e207e05562949de';
-- brands|Temple Hall|history|ar — marques et sociétés en latin
UPDATE `brands` SET `history_ar` = 'Temple Hall اسم مصنع صار اسم علامة، وفيه وُلد Macanudo.

كان مصنع كينغستون ملكاً لـGradiaz, Annis & Co. حين اشترته General Cigar سنة 1969 — ومنحتها الصفقةُ في الوقت نفسه حقوق اسم Macanudo خارج كوبا. وعيّنت المجموعة فيه Alfons Mayer، أحد كبار خبراء الخلطات في عصره، ومن ذلك المصنع الجامايكي تحديداً تألّف Macanudo الذي سيدخّنه العالم لاحقاً، بعد أن انتقل الإنتاج إلى الجمهورية الدومينيكية.

أمّا اسم Macanudo فقد جاء من طريق آخر: عائلة Palicio، التي كانت تصنع Punch في كوبا، لجأت إلى جامايكا إبّان الحرب العالمية الثانية ومنحت هذا الاسم لأحد مقاساتها قبل أن تجعله علامة.

ووُجدت Temple Hall علامةً قائمة بذاتها، بخلطة جامايكية أقوى من Macanudo الذي كانت تؤويه. دمّر إعصار غيلبرت تبغ الجزيرة عام 1988، لكنّ المصنع صمد اثني عشر عامًا أخرى: أغلقته General Cigar عام 2000 ونقلت إنتاجه إلى الجمهورية الدومينيكية. ويطفو الاسم بين حين وآخر، كذكرى لما كانته كينغستون.'
 WHERE `name` = 'Temple Hall' AND SHA1(TRIM(`history`)) = '2b3d651271afe2a0d7e05d21f9e2ed79abdfa9a4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Temple Hall' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '2b3d651271afe2a0d7e05d21f9e2ed79abdfa9a4';
-- brands|The Griffin's|history|ar — نبرة، سيجارات، latin
UPDATE `brands` SET `history_ar` = 'تدين The Griffin''s باسمها لملهى ليلي في جنيف، وهو على الأرجح أغرب أصل في الكتالوغ. افتتح Bernard Grobet النادي سنة 1964 واستقبل فيه زبائن من كل مكان؛ وبعد عشرين عاماً أراد سيجاراً يقدّمه على طاولاته، فطلب صنعه له في الجمهورية الدومينيكية. وخرج أول Griffin''s سنة 1984، مخصَّصاً للنادي وحده.

وقد أعجب إلى ما هو أبعد من أي نيّة. فسرعان ما ظهر السيجار في متاجر التبغ السويسرية، ثم في الولايات المتحدة اعتباراً من 1989. حينها توجّه Grobet إلى مؤسسة Davidoff لتتولّى التصدير، وباعها العلامة بعد ثلاث سنوات — فدخلت الدار السويسرية الحكايةَ لاحقاً إذاً، لا عند النشأة كما يُقرأ أحياناً.

وتحمل النتيجة بصمة صاحب الطلب: سيجار صالون، أنيق، بلا خشونة، مصمَّم ليرافق حديثاً لا ليهيمن عليه. غلاف فاتح، وقوة خفيفة إلى متوسطة، ونفحات أرز وبندق وزهور بيضاء.

وهو في هذا الأطلس من قلّة السيجار الذي تكون شهادة ميلاده سهرةً لا مزرعة.'
 WHERE `name` = 'The Griffin''s' AND SHA1(TRIM(`history`)) = 'e7221d6239e71a83035b335b792b6ccc14d02908';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'The Griffin''s' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'e7221d6239e71a83035b335b792b6ccc14d02908';
-- brands|Toscano|history|ar — société en alphabet latin
UPDATE `brands` SET `history_ar` = 'تروي الدار أن عاصفة صيفية بلّلت مخزونًا من الكنتاكي في مصنع التبغ بفلورنسا. وبدل أن يُرمى، تُرك الورق التالف ليتخمّر ثم لُفّ وبيع بثمن بخس. فوجد ذلك المذاق اللاذع المدخَّن جمهوره، وصار ما كان ينبغي أن يكون خسارة طريقةً في الصنع.

والسيجار الذي خرج من ذلك لا يشبه غيره: مدبّب الطرفين، منتفخ الوسط، ويُقطع تقليديًا إلى نصفين قبل تدخينه. نصفان من سيجار واحد، تدخينتان قصيرتان بدل واحدة طويلة — عادة وُلدت من التوفير بقدر ما وُلدت من الذوق.

ظلّ التصنيع احتكارًا للدولة حتى نهاية القرن العشرين. استعادته شركة Manifatture Sigaro Toscano عام 2006، وما تزال تلفّ الأصناف الراقية يدويًا في لوكّا وكافا دي تيرّيني.'
 WHERE `name` = 'Toscano' AND SHA1(TRIM(`history`)) = 'cf17b50fd79dc83d8126ffc994cc54066e01e9e5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Toscano' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'cf17b50fd79dc83d8126ffc994cc54066e01e9e5';
-- brands|Total Flame|history|ar — أسماء علامات وأشخاص لاتينية
UPDATE `brands` SET `history_ar` = 'Total Flame دارٌ روسية بلا مصنع، ويصنّفها هذا الأطلس حيث تُلفّ: لدى La Aurora في جمهورية الدومينيكان ولدى Plasencia في نيكاراغوا — بطاقتان من هذا الأطلس. التقى Maxim Privezentsev وVladimir Roshchin في أمسية سيجار بموسكو واكتشفا شغفين مشتركين، السيجار والدرّاجة النارية؛ وفي 2010 ذهبا لتركيب مزجاتهما في المصنعين، وفي 2011 انطلقا للدوران حول العالم على الدرّاجة موثّقَين ذلك. وتبعت العلامة، بأحزمة راكبي الدرّاجات — Wild One وSpokes وOff The Rails وFTW.

خطّ Dark Line وآخر Bright Line، وأتبغة تقول الدار إنّها معتّقة ستّ إلى ثماني سنين، وخطّ من تبغ إيراني، ونزوات معلنة بوصفها كذلك. وصفتها الصحافة الأمريكية في العقد الثاني من الألفية حين كانت تحضر IPCPR؛ وتضعها صحافة السيجار الروسية سنة 2025 بين العلامات ذات الجذور الروسية المصنوعة في الخارج.

إنّها الحالة الروسية الثالثة في هذا الأطلس، والوحيدة بلا مصنع في روسيا: Siglo de Oro وPogar يلفّان في الديار، وTotal Flame تُلفّ في الكاريبي. وقاعدة مكان اللفّ تحسم.'
 WHERE `name` = 'Total Flame' AND SHA1(TRIM(`history`)) = '6e6469b4d43040fcd02889334539f5ca3b35dc49';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Total Flame' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '6e6469b4d43040fcd02889334539f5ca3b35dc49';
-- brands|Trinidad USA|history|ar — أسماء لاتينية
UPDATE `brands` SET `history_ar` = 'أسّست عائلة Trinidad شركة Trinidad y Hermanos في كوبا عام 1905. تولّى Diego Trinidad Jr. الإدارة عام 1920 وسجّلها عام 1958 باسم TTT Trinidad، ثم صادرتها الثورة.

وفي المنفى، عهدت العائلة إلى عائلة Fuente بلفّ سيجار Trinidad غير كوبي في تامبا ابتداءً من 1968. توقّف الإنتاج بعد نحو عشر سنوات حين انتقلت عائلة Fuente. وجرت محاولة ثانية في الدومينيكان عام 1997، مع عائلة Fuente أيضًا، ولم تدُم طويلًا هي الأخرى.

رفعت العائلة القضية أمام المحاكم الأمريكية ونالت عام 2001 حقوق البيع في الولايات المتحدة، ثم باعت عام 2002 العلامة وهذه الحقوق إلى Altadis U.S.A.

وهذا ما يميّز هذه الدار عن Cohiba USA وPartagás USA: فهاتان اسمان كوبيّان سجّلتهما General Cigar في الولايات المتحدة، في الفراغ الذي خلّفه الحظر. أمّا هنا فالدار الأصلية هي التي استعادت اسمها قبل أن تتنازل عنه.

أمّا كتالوغ 2003 — Coloniales وFundadores وReyes وRobusto Extra وRobusto T — فكان دومينيكيًّا بالكامل. ولم يعد الصانع يعرضه اليوم، دون أن يقول إنّه أُوقف.'
 WHERE `name` = 'Trinidad USA' AND SHA1(TRIM(`history`)) = '580e3b9165201bf9eb7bb34126fc842227c5cb96';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Trinidad USA' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '580e3b9165201bf9eb7bb34126fc842227c5cb96';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Umnum' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'da3b5612dd2a1710f0a371f0a15d9f2c19a214a9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Valentino Siesto' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'a310b52371a297a717ff899da79a1e40a641cf09';
-- brands|Vallejuelo|history|ar — اسم شخص وSan Andrés لاتينيان
UPDATE `brands` SET `history_ar` = 'علامة Vallejuelo أُنشئت سنة 2008، بطلب من موزّع سويسري ولذلك السوق، وفق الصانع. ويعني اسمها الوادي الصغير. وتعود ملكيتها إلى Maurice Antonius Koks، القادم من هولندا، وهو أيضًا خبير مزجها وفق الصانع، وتُلفّ يدويًا في Intercigar S.A.، بالمنطقة الحرة لا بالما، في تامبوريل بمقاطعة سانتياغو.

تقدّم الدار خلطتين. فـClassic Vallejuelo، الذي أُطلق سنة 2008، يجمع بين غلاف Habano rosado إكوادوري وحشوة دومينيكية ونيكاراغوية، تحت ورقة رابطة نيكاراغوية؛ ويُباع بعدّة مقاسات — Robusto وRobusto Gordo وGran Toro وGordo — بعلب من عشرين قطعة. أمّا Vallejuelo Medio Tiempo، وهو حسب الصانع أشدّ قوةً، فيستخدم ورق medio tiempo تحت غلاف San Andrés مكسيكي، بعلب من ثماني عشرة قطعة. وفي سبتمبر 2022، دمّر حريق في تامبوريل المبنى الذي كانت Intercigar تتقاسمه مع Tabacalera William Ventura. ولا يزال موقع Intercigar، الذي جرت زيارته في سبتمبر 2026، يُدرج كلا اسمي Vallejuelo ضمن علاماته؛ أمّا أين تُلفّ منذ الحريق فلا يذكر ذلك أيّ مصدر رجعنا إليه.'
 WHERE `name` = 'Vallejuelo' AND SHA1(TRIM(`history`)) = '6185639ba749a3d779b100e51cfeceb95315daa8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vallejuelo' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '6185639ba749a3d779b100e51cfeceb95315daa8';
-- brands|Van der Donk|history|ar — أسماء لاتينية، تسعة أشكال
UPDATE `brands` SET `history_ar` = 'Van der Donk آخر مصنع في هولندا ما زالت تُصنع فيه السيجارات يدويًّا — هكذا يقدّمه تحقيقٌ مرسوم، وهذا ما تحتفظ به البطاقة أوّلًا. وُلد سنة 1919 في كولمبورغ باسم Sigarenfabriek Havana، أسّسه A.W. Smits؛ ودخله فتًى في الرابعة عشرة، J. van der Donk، للعمل، ثم استلمه في الستينيات وأعطاه اسمه في السبعينيات. ويديره اليوم ابنه Richard، الجيل الثالث، مع زوجته Gerda، في شارع زاندسترات، وسط آلات قديمة توحي بمتحف وكلّها مستعملة.

الحركة حركة السيجار الهولندي: أتبغة من كوبا والبرازيل وإندونيسيا تُنزع عروقها باليد؛ وورقة رابطة توضع باليد في آلة بدوّاسة يديرها Richard بقدمه؛ وغلافٌ — أغلى الأوراق، يُسلَّم مسطّحًا — يوضع باليد. تصف البطاقة هذا التقسيم بدقّة لأنّ حدّ هذا الأطلس يمرّ بين اليد والآلة، وهنا تصنع اليد الجوهر. تسعة أشكال، أطول أو أقصر، أغلظ أو أرفع، تُباع في نحو أربعين متجرًا في البلاد.

لا خليفة: حين يتوقّف Richard وGerda تتوقّف الدار. يفتح هذا الأطلس هولندا مكانَ لفّ لهذا المصنع بعينه، ويفعل ذلك قبل أن يُغلق.'
 WHERE `name` = 'Van der Donk' AND SHA1(TRIM(`history`)) = '2016bf35d724deef292b9c9ed8a00ed558826473';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Van der Donk' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '2016bf35d724deef292b9c9ed8a00ed558826473';
-- brands|Vargas|history|ar — اسم علامة لاتيني، كلمات ممنوعة
UPDATE `brands` SET `history_ar` = 'في لا بالما، يُلفّ السيجار منذ زمن طويل إلى حدّ أن الكلمة المحلّية — «بالميرو» — تدلّ على السيجار وعلى ابن الجزيرة معاً. ينمو التبغ هناك على تربة بركانية، في مناخ رياح تجارية دائمة، ويُعالَج في ورش عائلية لا في مصانع.

ودار Vargas هي الأوسع شهرة بين تلك الورش. تلفّ باسم العائلة، وبنسبة وافرة من ورقة لا بالما — وهذا نادر: فمعظم ما يُسمّى سيجاراً كنارياً يستخدم تبغاً مستورداً من الأميركتين.

وهذا الأصل يفسّر المذاق. «البالميرو» جافّ، عشبي، خشن قليلاً، بقوّة معتدلة واحتراق صريح. لا يسعى إلى مشابهة الهافانا ولم يطمح إلى ذلك يوماً؛ إنه سيجار أرضٍ جزرية، يُدخَّن في مكانه بما يفوق كثيراً ما يُصدَّر.

وفي أطلس يهيمن عليه الكاريبي وأميركا الوسطى، هو أحد المواضع الأوروبية النادرة التي تجري فيها الزراعة واللفّ في المكان نفسه.'
 WHERE `name` = 'Vargas' AND SHA1(TRIM(`history`)) = '6cd558e22b5d1f6523a31d0beba47753bbb10453';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vargas' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '6cd558e22b5d1f6523a31d0beba47753bbb10453';
-- brands|VegaFina|history|ar — اسم علامة لاتيني
UPDATE `brands` SET `history_ar` = 'VegaFina من العلامات الأعلى مبيعاً في أوروبا القارية: مدخّن فرنسي أو إسباني يصادفها في كل متجر تبغ تقريباً.

وُلدت في التسعينيات داخل المجموعة التي تملك مصنع لا رومانا الكبير، بنيّة واضحة: تقديم سيجار دومينيكي منتظم ولطيف، متوفّر في كل مكان وبسعر ثابت. وهذا تحديداً ما تفعله، ويجلب لها هذا الموقع ازدراء جزء من الهواة — الازدراء نفسه الذي تناله كل علامة تنجح على نطاق واسع.

الطابع لطيف إلى متوسط: غلاف فاتح، ونفحات أرز ولوز وقشدة، واحتراق بلا مفاجآت. وقد اتّسعت التشكيلة مع السنين نحو سلاسل أقوى، تُنتَج بكميات أقلّ، رفعت العلامة في تقدير الخبراء دون أن تغيّر ما هي عليه.

ويكسب الأطلس حين يذكرها كما هي: السيجار الذي يدخّنه فعلاً عشرات الآلاف، لا ذاك الذي يُتحدَّث عنه.'
 WHERE `name` = 'VegaFina' AND SHA1(TRIM(`history`)) = '3c1af15483c42a2dc319dc542e5aabeb88d759b4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'VegaFina' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '3c1af15483c42a2dc319dc542e5aabeb88d759b4';
-- brands|Vegas de Santiago|history|ar — أسماء لاتينية، عبارة ممنوعة
UPDATE `brands` SET `history_ar` = 'تمرّ كوستاريكا في الأذهان بوصفها بلد ورشٍ لا بلد حقول: فشركة Selected Tobacco تلفّ فيها ورقًا آتيًا من غيرها، وكذلك تفعل Casdagli. تكتب دار Vegas de Santiago أنّها تزرع جزءًا من أوراقها وتستورد الباقي.

تكتب الدار أنّ عائلاتها تزرع التبغ في الجبال البركانية من سانتياغو دي بوريسكال، جنوب غربي سان خوسيه، منذ ما يزيد على ثمانين سنة (على ارتفاع يتجاوز ألفًا ومئة متر، بحسب Zechbauer)، وأنّها تستغني عن المبيدات عند هذا الارتفاع. وكتبت La Nación سنة 2011 أنّ إنتاج التبغ توقّف في بوريسكال عند حصاد 1997-1998، وأنّ الورشة كانت تستقدم مادتها الأولية من بيرو والإكوادور ونيكاراغوا، ولا يُشترى من Pérez Zeledón سوى 15%.

مَن أسّسها يُقرأ على وجهين: Marc Niehaus وحده، تكتب Casagranda، موزّعها الألماني؛ وعائلتا Niehaus وGuzmán معًا، تكتب Cigarrspecialisten، تاجر تجزئة سويدي. أمّا الدار فمن دون أن تسمّي مؤسّسًا تقدّم Marc Niehaus شريكًا ومسؤولًا عن المبيعات الدولية. وتؤرّخ Casagranda المصنع العائلي Tabacos de Costa Rica بسنة 1997؛ ويضع حوار مع Marc Niehaus، نُشر على vdg-cigars.com، افتتاح المصنع في سنة 1998؛ ولا يذكر أيّ مصدر مستشهَد به سنة العلامة.

تصنع خطوطها الخاصة — Chaman وReserva وDon Luis وSecretos del Maestro وEl Puro — وتلفّ الورشة أيضًا لغيرها، ومنها Zechbauer Royales التابعة للدار الميونيخية. وChaman أحد خطوطها.

تعمل الورشة باسم Tabacos de Costa Rica S.A.: سمّت La Nación سنة 2011 Olman León مالكًا للمصنع، وتسمّي Cigar Coop سنة 2019 Andrés León مالكًا ومشغّلًا. ويقدّم Zechbauer Olman León Guzmán بوصفه رئيس المصنع؛ وتسمّيه Casdagli كبير المزّاجين وتكتب أنّ تعاونها مع «Tabacos de Costa Rica S.A.، المعروفة آنذاك باسم Vegas Santiago» بدأ سنة 2012. ويُلفّ في هذه الورشة خط Villa Casdagli.

علاماتٌ أخرى من هذا الأطلس تخرج من الورشة نفسها: Selected Tobacco (Atabey وBandolero وByron) وBombay Tobak، بحسب Cigar Coop؛ أمّا Malekö وSkull 77 فيقول بعض تجّار التجزئة إنّ Tabacos de Costa Rica S.A. تصنعهما.'
 WHERE `name` = 'Vegas de Santiago' AND SHA1(TRIM(`history`)) = '87fde15c8575285065efb1e688db73100fd82989';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vegas de Santiago' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '87fde15c8575285065efb1e688db73100fd82989';
-- brands|Viaje|history|ar — أسماء لاتينية، كلمة ممنوعة
UPDATE `brands` SET `history_ar` = 'جعلت Viaje من النُّدرة قاعدة، ثم جعلتها طريقتها الوحيدة في العمل. أسّس Andre Farkas العلامة عام 2008 على سلسلتين ثابتتين: Platino وOro.

وأطلق إلى جانبهما دفعات صغيرة — Stuffed Turkey وSkull and Bones وDaisy Cutter — فوجد أنّ زبائنه يُقبلون عليها إقبالًا يفوق إقبالهم على الكتالوج الجاري. وفي 2012 استخلص النتيجة، وكانت جذرية: تخلّى عن السلاسل الثابتة ولم يعد يصنع سوى إصدارات محدودة.

وهو خيار له ثمنه. فالدار بلا كتالوج دائم لا يستطيع بائع التجزئة أن يعتمدها بثبات، ولا يمكن الحكم عليها من سنة إلى أخرى، وتترك المدخّن أمام سيجار لن يجده مرّة ثانية. تقبل Viaje ذلك، وهو ما يحدّدها في هذا الأطلس.

ويُلَفّ كلّ شيء عند Aganorsa في إستيلي — الدار التي يضمّها هذا الأطلس باسم Aganorsa Leaf، والتي تزرع ورقها بنفسها. ومن هنا يُستنتج المذاق: التبغ نيكاراغوي، والعلامة لا تخفي ذلك.'
 WHERE `name` = 'Viaje' AND SHA1(TRIM(`history`)) = '025f5f6e476f3b9c1250d0254a5611d018717b18';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Viaje' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '025f5f6e476f3b9c1250d0254a5611d018717b18';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Villa Vieja' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'b98b1ba135ebf703bbcc4a83cff080bbdbbc31cb';
-- brands|Villiger Söhne|history|ar — فقرة مكررة، أسماء لاتينية
UPDATE `brands` SET `history_ar` = 'في عام 1888 أسّس Jean Villiger، وهو تاجر في الثامنة والعشرين، مصنعًا للسيجار في منزله في بفيفيكون. ثمّ توفّي مبكرًا عام 1902، فتولّت زوجته Louise Villiger إدارة الدار. وفي 1907 أطلقت Villiger Kiel، أول سيجار بمبسم من ريشة إوزّ.

وفي 1918 تسلّم Hans وMax Villiger العمل وأعطياه اسمه: Villiger Söhne. ولا تزال الدار عائلية في جيلها الرابع والخامس؛ وقد ترأّسها Heinrich Villiger، من الجيل الثالث، حتى وفاته عن خمسة وتسعين عامًا.

تُنتج الدار نحو مليار سيجار وسيجار صغير سنويًا، وتشغّل ما يزيد على ألف ومئتَي شخص، وتعلن نحو مئة وأربعين مليون فرنك سويسري من المبيعات. ويضمّ هذا الأطلس علامتها Villiger، منسوبة إلى نيكاراغوا حيث تُلفّ سيجارها الفاخر.

ينقص هذه القائمة مصنعٌ تسمّيه الصحافة الإندونيسية: لـVilliger معملٌ في جمبر بجاوة الشرقية — PT Villiger Tobacco Indonesia في أجونغ — في مدينة تبغ Besuki Na-Oogst حيث تلفّ أيضًا داران لهما صفحة خاصة، BIN وGolden Djawa. تلفّ جمبر لسويسرا منذ زمن طويل من دون أن يكتب ذلك أحد بالإنجليزية.'
 WHERE `name` = 'Villiger Söhne' AND SHA1(TRIM(`history`)) = '64e157bfc609d37e27f5b006d1358bb600bd1b6d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Villiger Söhne' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '64e157bfc609d37e27f5b006d1358bb600bd1b6d';
-- brands|Wangguan|history|ar — أسماء لاتينية
UPDATE `brands` SET `history_ar` = 'Wangguan — 王冠، التاج — سيجارُ احتكار آنهوي، يُلفّ في مينغتشنغ، مدينةٍ في شمال المقاطعة تقدّم نفسها موطنَ Zhuangzi. للصين أربع قواعد للسيجار، واحدة لكلّ احتكار إقليمي: شيفانغ في سيتشوان لـGreat Wall التي يحمل هذا الأطلس بطاقتها؛ ويتشانغ في هوبي؛ وجينان في شاندونغ؛ ومينغتشنغ التي تقدّمها صحافة السيجار الصينية واحدًا من ممثّلي السيجار الصيني المُلفوف يدويًّا.

تعود أسطورة الدار إلى 1896: يُقال إنّ Li Hongzhang، الوزير الكبير في أواخر أسرة تشينغ، عاد من أوروبا بسيجارات أهدتها بلاطات ملكية، واكتشف أنّ في مينغتشنغ ورشات لفّ يدوي كثيرة، فطلب منها بعضًا — ويُقال إنّ «سيجار طراز آنهوي» اجتاح امتيازات شنغهاي. ينسب هذا الأطلس الرواية إلى رواتها. أمّا المؤرَّخ فأحدث: مصنع سيجار أقرّه مجلس الدولة بعد 1978، ملحق بمصنع سجائر بينغبو، وفي 1997 شراكة مع شركة دومينيكية لإنتاج Wangguan بورقة كاملة، ما رفع مستوى الطريقة الصينية.

بعد Great Wall، إنّها البطاقة الصينية الثانية في هذا الأطلس، والثانية التي لا مصادر لها إلا بالصينية. تقول البطاقة ذلك، ولا تضع حقلًا ولا صنفًا.'
 WHERE `name` = 'Wangguan' AND SHA1(TRIM(`history`)) = '17bfb58d91226fcf83bb326b2783340780186da1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Wangguan' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '17bfb58d91226fcf83bb326b2783340780186da1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Warfighter Tobacco' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '6e86b2cb8c90ba20e50f3bc99b4e1d3228673f9c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'West Tampa' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'abc8e0144765e424d9a7d3ff4ce4c2b9f6ca2efc';
-- brands|Wolf & Ruhland|history|ar — أسماء أشخاص، سيجارة رفيعة
UPDATE `brands` SET `history_ar` = 'أُسّست Wolf & Ruhland سنة 1909 في ميونيخ على يد تاجر من مانهايم، Hermann Wolf، وشقيقة زوجته Käthe Ruhland؛ ونجح مصنع ميونيخ حتى بحثا سنة 1917 عن موقع ثانٍ، ووجداه بفضل صديق، Karl Hilz، في قرية من غابة بافاريا، برليسرويت، حيث وظّفا مئة وسبعين شخصًا — وكانت القرية تسمّي الرئيس «الأب فولف». في السنوات الصعبة تولّى Karl Hilz الشركة؛ وأبقاها ابنه Hermann طافيةً بمحطّة وقود وورشة سيّارات؛ وتديرها حفيدته Cornelia Stix منذ وفاته سنة 2006، في الجيل الثالث، بعشرة أشخاص.

إنّه، كما تقول، آخر مصنع في بافاريا ما زال يلفّ السيجار يدويًّا. آلة واحدة تساعد؛ ولبعض الطُرز تشكّل النساء اللفائف يدويًّا على جهاز يُدار بالقدم، ويوضع الغلاف باليد — تقول البطاقة ذلك بدقّة لأنّ الحدّ الذي يرسمه هذا الأطلس يمرّ بين اليد والآلة. تأتي الأتبغة من جاوة وسومطرة والمكسيك؛ والوصفات، وبعضها يعود إلى Karl Hilz، يحفظها ابن المالكة Martin، بلا نكهات ولا عطور مضافة. وVirginia، سيجارة رفيعة، هي علامة الدار؛ وToccata Torpedo، الأكبر، يحمل حزامًا مكتوبًا بخطّ اليد.

مصنعُ قرية، عمره قرن وثلاثة أجيال، بلا صحافة مهنة: مصدره مجلّة إقليمية. يحتفظ به هذا الأطلس لأنّه يلفّ، ومنذ 1909.'
 WHERE `name` = 'Wolf & Ruhland' AND SHA1(TRIM(`history`)) = '79c5c5f1200ad83399965da3e0b01ef77fd5dc8c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Wolf & Ruhland' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '79c5c5f1200ad83399965da3e0b01ef77fd5dc8c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Wolfertz' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'e55bb70ff90df722d08e0fb00c0cbf82022086f3';
-- brands|Xhaxhi Bobi|history|ar — medium plus مترجم خطأ
UPDATE `brands` SET `history_ar` = 'يقول cigarspartan.com إن Bob de Goede، الهولندي، صنع علب سيجار في الجمهورية الدومينيكية لما يزيد على عشرين عامًا قبل أن يطلق فيها علامته الخاصة؛ ولقبه Xhaxhi (وتعني العم بالألبانية) يعود إلى عمله في منجم في ألبانيا. ولا يملك أيًّا من المصانع التي تُلف خطوطه.

تقول racccigars.com إن أولى المزائج، ومنها Mi Hermano، وُلدت في Kelner Boutique Factory، التي يديرها Hendrik Kelner Jr.؛ ويقول cigarworld.de إن Mi Hermano يُلف هناك بغلاف ورباط وحشوة دومينيكية بالكامل، بمقاس Petit Corona، بقوة فوق المتوسطة. وتقول racccigars.com إن خطوطًا أخرى تُلف في أماكن أخرى، لا سيما في Tabacalera El Artista. أما خط Grey فيلفه Junior Torres في مصنع Torres & Garcia، في سانتياغو، وفق Small Batch Cigar. ويحمل خط Sunset غلاف Connecticut من الإكوادور فوق رباط وحشوة Habano دومينيكية، بقوة خفيفة إلى متوسطة، بمقاس Robusto، وفق Sir Louis Cigars.

وحتى سبتمبر 2026، يضم الكتالوج أيضًا Baba Jan وBlack وEl Ingeniero وEl Licenciado وRed و7 Vikings، وفق Cigarworld.de وSir Louis Cigars.'
 WHERE `name` = 'Xhaxhi Bobi' AND SHA1(TRIM(`history`)) = '7625e38a41de8de1749e09f214ae281e1df1b6af';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Xhaxhi Bobi' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = '7625e38a41de8de1749e09f214ae281e1df1b6af';
-- brands|Zigarren Manufaktur Dresden|history|ar — أسماء أشخاص لاتينية
UPDATE `brands` SET `history_ar` = 'Zigarren Manufaktur Dresden حلمُ كوبي: Lázaro Javier Herrera Cabrera، لفّافٌ من الجيل الثالث ومراقب جودة التبغ في بلده، أراد مصنعه الخاص، فافتتحه في ساكسونيا، في درسدن، سنة 2015، مع فريق مؤسّس فيه Katrin Lieberum. كُتب التصوّر سنة 2013؛ ويروي بورتريه المؤسّسين المنشور عند الافتتاح الباقي — الإعانات العامّة التي تستثني التبغ، والجنسية الكوبية التي تعقّد القروض، واختيار الفعل رغم ذلك.

تلفّ الورشة سيجارات طويلة الحشوة يدويًّا بالكامل كما في كوبا: حشوة من أوراق كاملة، وقوالب أرز، وغلاف يضعه اللفّاف أمام أعين الزوّار الذين يستطيعون مشاهدته يعمل. الأتبغة مستوردة؛ والساكسوني فيها هو الحركة. لذلك يصنّف هذا الأطلس الدار في ألمانيا التي يفتحها هنا مكانَ لفّ — سابقةٌ لبلد يُعرف أساسًا بسيجاره الآلي.

دارٌ صغيرة، بلا صحافة مهنة بالمعنى الأنجلوفوني؛ مصدرها صحيفة روّاد أعمال في درسدن. وتقف البطاقة عند ما تقوله.'
 WHERE `name` = 'Zigarren Manufaktur Dresden' AND SHA1(TRIM(`history`)) = 'd616f19e43a9073176b0e1aa9eda066606556545';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Zigarren Manufaktur Dresden' AND `champ` = 'history' AND `lang` = 'ar' AND `source_hash` = 'd616f19e43a9073176b0e1aa9eda066606556545';
-- brands|1502 Cigars|gamme|ar — رباط وإستيلي
UPDATE `brands` SET `gamme_ar` = '[{"name":"1502 Emerald","color":"#2E6B4A","force":"Medium","story":"الزمرّد — خطّ الدخول، باللون.","vitolas":[],"wrapper":"غير معلن"},{"name":"1502 Ruby","color":"#8B1A1A","force":"Medium-Full","story":"الياقوت.","vitolas":[],"wrapper":"غير معلن"},{"name":"1502 Black Gold","color":"#2E2E2E","force":"Full","story":"الذهب الأسود — الأقوى بين الثلاثة.","vitolas":[],"wrapper":"غير معلن"},{"name":"Cachitos","color":"#8B5A2B","force":null,"wrapper":"نيكاراغوا، Connecticut Shade","vitolas":[],"story":"خط من Global Premium Cigars يقول Enrique Sánchez Icaza إنه منفصل عن علامة 1502: petit-robusto بمقاس 4½ x 50، غلافه نيكاراغوي فوق رباط هندوراسي، عُرض في IPCPR لعام 2018، لكنّ cigarandspirits.com أرّخه بعام 2019 في أبريل 2025. وصدرت نسخة ثانية بغلاف Connecticut Shade (4 x 50)، لُفّت لدى Barreda Cigars في إستيلي، في أبريل 2025؛ وكان المصنع الذي ذُكر اسمه عام 2018 هو Plasencia."}]'
 WHERE `name` = '1502 Cigars' AND SHA1(TRIM(`gamme`)) = 'aa9b943e36e45ade71f2c3b2af31bb81edfa3941';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = '1502 Cigars' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'aa9b943e36e45ade71f2c3b2af31bb81edfa3941';
-- brands|262 Cigars|gamme|ar — أسماء لاتينية
UPDATE `brands` SET `gamme_ar` = '[{"name":"Paradigm","color":"#5C4033","force":"Medium-Full","wrapper":"مزيج نيكاراغويّ","vitolas":["Robusto","Toro","Corona"],"story":"أوّل سيجار للدار، صدر عام 2010، أي قبل خمس سنوات من ظهور معظم علامات البوتيك اليوم."},{"name":"Ideology","color":"#3A2E26","force":"Full","wrapper":"مزيج نيكاراغويّ","vitolas":["Robusto","Toro"],"story":"الوجه الأقوى، جاء بعد Paradigm. والاسم يواصل سلسلة الكلمات المجرّدة التي اختارتها الدار خلافًا لعُرف المهنة."},{"name":"Revere","color":"#7A3B2E","force":"Medium-Full","wrapper":"مزيج نيكاراغويّ","vitolas":["Lonsdale","Toro","Box-pressed Toro"],"story":"سُمّي على اسم Paul Revere. الدار أمريكية في الاسم والمخيال، نيكاراغوية في الصناعة — وهي لا تخفي المسافة."},{"name":"Allegiance","color":"#3E4A6B","force":"Medium-Full","wrapper":"هابانو إكوادوري","vitolas":[],"story":"2014 — الولاء، غلاف هابانو إكوادوري."}]'
 WHERE `name` = '262 Cigars' AND SHA1(TRIM(`gamme`)) = '63cec9f34a17679df068880daca5e13106e5423f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = '262 Cigars' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '63cec9f34a17679df068880daca5e13106e5423f';
-- brands|7-20-4|gamme|ar — أسماء شركات لاتينية
UPDATE `brands` SET `gamme_ar` = '[{"name":"7-20-4 (الخطّ الأصليّ)","color":"#6B4226","force":"Medium-Full","wrapper":"مزيج نيكاراغويّ، عند J. Fuego","vitolas":["Robusto","Toro","Corona","Dog Walker"],"story":"الخطّ الذي أحيا الاسم عام 2006. لُفّ في هندوراس أوّلًا، ثم انتقل إلى J. Fuego في إستيلي في يوليو 2021."},{"name":"Factory 57","color":"#3E2723","force":"Medium-Full","wrapper":"هابانو من خالابا","vitolas":["Robusto","Toro","Corona Gorda","Dog Walker"],"story":"رقم تسجيل المصنع القديم في مانشستر. غلاف هابانو من خالابا فوق رابط من كوستاريكا — مصدر قلّما تستعمله الدور."},{"name":"1874 Series","color":"#8B5A2B","force":"Medium","wrapper":"مزيج من أمريكا الوسطى","vitolas":["Robusto","Toro"],"story":"السنة التي بدأ فيها R.G. Sullivan الصناعة في شارع إلم. وهذه السلسلة تحمل التاريخ بدل العنوان."}]'
 WHERE `name` = '7-20-4' AND SHA1(TRIM(`gamme`)) = 'a6bea161501ebdf5dfd75e6d50488fe74920064d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = '7-20-4' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'a6bea161501ebdf5dfd75e6d50488fe74920064d';
-- brands|A.J. Fernandez|gamme|ar — أسماء لاتينية، كلمة ممنوعة
UPDATE `brands` SET `gamme_ar` = '[{"name":"New World","color":"#5C4033","force":"Full","story":"الخلطة التي عرّفت بالدار باسمها هي. غلاف مكسيكي داكن، دخان كثيف، ونفحات قهوة محروقة وفلفل أسود — قوّة دون عدوانية، وهذا تحديداً توقيع الدار.","vitolas":["Robusto","Toro"],"wrapper":"San Andrés Maduro"},{"name":"Bellas Artes","color":"#8B6914","force":"Medium","story":"المستوى المتوسط للدار، أشدّ جفافاً وخشبية. يُقدَّم لمن يجد New World ثقيلاً، ويثبت أن القوّة لم تكن يوماً هي الغاية.","vitolas":["Toro"],"wrapper":"Habano Rosado"},{"name":"Enclave","color":"#8B3A1E","force":"Medium-Full","story":"2016 — خطّ من خطوط الدار.","vitolas":[],"wrapper":"هابانو إكوادوري"},{"name":"Días de Gloria","color":"#4A3728","force":"Full","story":"2020 — أيّام المجد: سيجار نيكاراغوي خالص من مزارع الدار.","vitolas":[],"wrapper":"نيكاراغوي خالص"},{"name":"Sosa","color":"#6B4226","force":"Medium-Full","story":"علامات عائلة سوسا — Sosa Classic وImperio Cubano — اشتُريت في كانون الأوّل/ديسمبر 2016 وتُلفّ في نيكاراغوا منذ كانون الثاني/يناير 2017. كانت تخرج حتى ذلك الحين من مصنع Arturo Fuente رقم 4، حيث يمزج Juan Sosa منذ 1997.","vitolas":[],"wrapper":"غير معلن"},{"name":"San Lotano","color":"#8B5A2B","force":"Medium-Full","story":"أُعيد إطلاقه في صيف 2010 بحسب Wikipedia، بالاسم الذي يقول Fernández إنه اسم علامة كانت لعائلته في كوبا قبل الثورة. وفي أكتوبر 2022، تضم العلامة أربعة خطوط — Requiem Habano وRequiem Connecticut وRequiem Maduro وThe Bull — تصنّفها Cuenca Cigars من متوسط-قوي إلى قوي.","vitolas":[],"wrapper":"Habano، Connecticut أو Maduro"}]'
 WHERE `name` = 'A.J. Fernandez' AND SHA1(TRIM(`gamme`)) = '58f1955017893b3eb31960084040d0252087a726';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'A.J. Fernandez' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '58f1955017893b3eb31960084040d0252087a726';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'ADVentura' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'fb7eb6b5f6540fd6d310c329e6faa9ef94145706';
-- brands|Aganorsa Leaf|gamme|ar — pied brosse, formulation
UPDATE `brands` SET `gamme_ar` = '[{"name":"Aganorsa Leaf Original","color":"#7B3F00","force":"Full","story":"تبغ الدار مئة في المئة، من الحشوة إلى الغلاف. وهذه حجّة العلامة كاملةً: تذوّق أرض خالابا دون وسيط، وبكامل القوّة.","vitolas":["Robusto"],"wrapper":"Corojo 99"},{"name":"Signature Selection","color":"#A0522D","force":"Medium","story":"التبغ نفسه في خلطة أشدّ تحفّظاً، تتقدّم فيها حلاوة الورقة على القوّة. وهو خير مدخل إلى أسلوب الدار.","vitolas":["Toro"],"wrapper":"Corojo 99"},{"name":"Condega","color":"#6B4226","force":"Medium","story":"علامةٌ اشتُريت سنة 2002 مع Tropical Tobacco من بيدرو مارتين — اسم بلدة وأرضٍ بين إستيلي وخالابا.","vitolas":[],"wrapper":"نيكاراغوي خالص"},{"name":"Lunatic","color":"#A0522D","force":null,"story":"امتداد لـ JFR ظهر عام 2015، وفقًا لمقالين (يونيو 2019، نوفمبر 2023). وفي أكتوبر 2026، يعرض موقع الشركة Lunatic Torch، بغلاف Corojo من Aganorsa وقدم على شكل فرشاة، وبقوة 3.5 من 5 بحسب الشركة، بمقاسات Imagine (5 1/2 x 50) وVisionaries (6 1/2 x 52) وDreamlands (6 1/2 x 60) وMad Folk (4 3/4 x 70)؛ أما نسخة Maduro بغلاف San Andrés فقد حصلت على مقاس 10 x 100 أُعلن عنه قبل PCA 2023، ويعود سيجار Loco من نوع perfecto إلى عام 2019.","vitolas":[],"wrapper":"Corojo Aganorsa، San Andrés"},{"name":"JFR","color":"#6B4226","force":null,"story":"يختصر الاسم عبارة Just for Retailers؛ والخط قائم منذ عام 2011، بحسب مقال بتاريخ 12 يونيو 2019. وفي أكتوبر 2026، يعرض موقع الشركة نسختين على حشوة الشركة: JFR Maduro بغلاف San Andrés من المكسيك، وقوة 4 من 5 بحسب الشركة، من Robusto إلى 770 L.E. بمقاس 7 x 70، وJFR Connecticut بغلاف Connecticut من الإكوادور، يُعرض منه Junior بمقاس 4 1/2 x 46 في أبريل 2024.","vitolas":[],"wrapper":"San Andrés، Connecticut"}]'
 WHERE `name` = 'Aganorsa Leaf' AND SHA1(TRIM(`gamme`)) = '0be46958362af728058d36960f3557d68e04b91f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Aganorsa Leaf' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '0be46958362af728058d36960f3557d68e04b91f';
-- brands|Aging Room|gamme|ar — اسم الشخص بالحروف اللاتينية
UPDATE `brands` SET `gamme_ar` = '[{"name":"Quattro","color":"#8B4513","force":"Medium-Full","story":"أوسع السلاسل، ومقاساتها مسمّاة بمفردات موسيقية — Nodal موسيقيّ التكوين. وشكلها الأساسي مكبوس مربّع، وهو قليل.","vitolas":["Maestro","Concerto","Espressivo"],"wrapper":"هابانو"},{"name":"Small Batch","color":"#6B4226","force":"Full","story":"دفعات الدار القصيرة، تُسمّى برمز لا باسم. وهي السلسلة التي عرّفت بالعلامة.","vitolas":["M356","F55"],"wrapper":"هابانو"},{"name":"Bin No. 1","color":"#4A2C1A","force":"Medium-Full","story":"مبنيّ على أتبغة من 1999 و2001 احتُفِظ بها من وادي سيباو. والاسم يعني خانة التعتيق — والعلامة كلّها في هذه الفكرة.","vitolas":["Bin No. 1"],"wrapper":"دومينيكي"},{"name":"Pelo de Oro","color":"#A0522D","force":"Medium","story":"باسم صنف كوبي قديم صعب الزراعة، ولهذا هُجر طويلًا. أُطلقت عام 2016، وتُلفّ لدى A.J. Fernandez في نيكاراغوا: غلاف من بذرة كوبية من نيكاراغوا، ورباط نيكاراغوي، وحشوة Pelo de Oro نيكاراغوية.","vitolas":["Rondo","Mezzo"],"wrapper":"بذرة كوبية من نيكاراغوا"},{"name":"La Bohème","color":"#6B4226","force":"Medium-Full","story":"أُطلقت عام 2014 لدى Boutique Blends ولُفّت آنذاك في Tabacalera Palma، وتعود في يناير 2025 تحت اسم Aging Room La Bohème، بخلطة جديدة صنعها A.J. Fernandez في نيكاراغوا، قُدّمت في ديسمبر 2024 على أنها من المتوسط إلى القوي. غلافها هجين من بذور Broadleaf وHabano المزروعة في وادي Connecticut، واللفافة الداخلية والحشوة من نيكاراغوا: أربعة مقاسات سُمّيت نسبةً إلى أوبرا Puccini، وهي Mimi (3 1/2 x 46) وPittore (5 1/8 x 52) وPoeta (5 3/4 x 54) وMusico (6 1/4 x 60).","vitolas":[],"wrapper":"Connecticut هجين"}]'
 WHERE `name` = 'Aging Room' AND SHA1(TRIM(`gamme`)) = '2090f545d605732a18b4a58789c7ff6ef6d07ed7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Aging Room' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '2090f545d605732a18b4a58789c7ff6ef6d07ed7';
-- brands|Agrotabacos|gamme|ar — اسم الشخص بالحروف اللاتينية
UPDATE `brands` SET `gamme_ar` = '[{"name":"Omar Ortez Originals","color":"#6B4226","force":"Medium-Full","wrapper":"غير معلن","vitolas":[],"story":"علامة المؤسّس — مع المادورو، أربعون بالمئة ممّا يلفّه المصنع."},{"name":"Casa de Ortez","color":"#8B5A2B","force":"Medium","wrapper":"غير معلن","vitolas":[],"story":"علامة Indiana Ortez، قُدّمت مع La Malinche في معرض 2023."}]'
 WHERE `name` = 'Agrotabacos' AND SHA1(TRIM(`gamme`)) = 'a7f575f04349fd498fe949f3e4acda031147b221';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Agrotabacos' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'a7f575f04349fd498fe949f3e4acda031147b221';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Aladino' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'fc4edef62edea293bea6333d2a9a5335ebf4ab43';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Alcazar' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'b69f5a94e97e2e193b9d47df8e10be6716b79423';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Alec Bradley' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '1ca7cccc0bb0913851b7adde06322f4ec7993f18';
-- brands|Alfambra|gamme|ar — اسم الشخص بالحروف اللاتينية
UPDATE `brands` SET `gamme_ar` = '[{"name":"El Brujito","color":"#8B5A2B","force":null,"wrapper":"غير معلن","vitolas":[],"story":"longfiller أُطلق بعد ثلاث سنوات من انطلاقة العلامة؛ بِيع منه 840000 سيجار، بحسب ما قاله Alejandro Mata."},{"name":"Alfambra Boutique","color":"#8B5A2B","force":null,"wrapper":"غير معلن","vitolas":[],"story":"خطّ ضمن الكتالوج، ومنه طراز Gran Toro."},{"name":"Alejandro Mata Colorado","color":"#A0522D","force":"Medium-Full","wrapper":"Colorado","vitolas":[],"story":"خمسة مقاسات، من Amanecer إلى Alba، كُشف عنها في Intertabac 2026 تكريمًا للمؤسّس."},{"name":"Alejandro Mata Maduro","color":"#4A3728","force":"Medium-Full","wrapper":"Maduro","vitolas":[],"story":"ثلاثة مقاسات، من Legado إلى Linaje، يُنتظر طرحها في السوق الدولية في مارس 2027."}]'
 WHERE `name` = 'Alfambra' AND SHA1(TRIM(`gamme`)) = '391ad0dba43717f3156022016a22cfa934758710';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Alfambra' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '391ad0dba43717f3156022016a22cfa934758710';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Alhambra' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '65435dde17d23144b257e72bb018ec75120d69bd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'All Saints Cigars' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '1296c05cced38833d811de636e6bc6b55e098538';
-- brands|American Caribbean Cigars|gamme|ar — مدن بالعربية
UPDATE `brands` SET `gamme_ar` = '[{"name":"The Bouncer","color":"#4A3728","force":null,"story":"غلاف San Andrés مكسيكي ورباط من Sumatra فوق حشوة نيكاراغوية من إستيلي وخالابا وأومتيبي، قُدِّمت في معرض IPCPR عام 2018، بحسب cigarworld.de وhalfwheel.","vitolas":[],"wrapper":"San Andrés (المكسيك)"},{"name":"El Viejo Continente","color":"#A0522D","force":null,"story":"وُلدت من لقاء بين Emiliano Lagos وخبير التبغ البرشلوني Daniel Guerrero، وتُقدَّم بعدة أشكال (Classic وMaduro وEdición Estelí) دون غلاف واحد محدَّد بوضوح، وضمن سلسلتين شقيقتين، Mare Nostrum وThe Circus، بحسب Neptune Cigars.","vitolas":[],"wrapper":"غير معلن"},{"name":"Maradona Tribute","color":"#A0522D","force":null,"story":"إصدار من خمسمائة صندوق تكريمًا لـ Diego Maradona، بحشوة نيكاراغوية وهندوراسية ورباط San Andrés تحت الغلاف الإكوادوري.","vitolas":[],"wrapper":"الإكوادور"},{"name":"The Traveler","color":"#A0522D","force":null,"story":"علامة شخصية لـ Emiliano Lagos، أُطلقت عام 2017 في أوروبا ثم في الولايات المتحدة، بمقاسات سُمّيت بأسماء مطارات دولية، بنسختين طبيعية وmaduro، بحسب Cigar Coop.","vitolas":[],"wrapper":"غير معلن"},{"name":"El Copey","color":"#C9A96E","force":null,"story":"السلسلة الوحيدة التي تُلف خارج نيكاراغوا: تُصنع يدويًا في جمهورية الدومينيكان، في مصنع لم تُسمِّه أي من المصادر المُطالَعة (cigarworld.de، hacico.de)؛ بغلاف Connecticut إكوادوري فوق رباط وحشوة دومينيكانيين، بحسب cigarworld.de.","vitolas":[],"wrapper":"Connecticut (الإكوادور)"},{"name":"Bella Mundo","color":"#6B4226","force":null,"story":"غلاف برازيلي يُعرف باسم Cubra، ورباط من Sumatra وحشوة criollo نيكاراغوية، قُدِّمت في معرض IPCPR عام 2018، بحسب Cigar Coop.","vitolas":[],"wrapper":"البرازيل (Cubra)"},{"name":"La Rosa de Sandiego","color":"#6B4226","force":null,"wrapper":"Connecticut، Habano، Maduro","vitolas":[],"story":"ثلاث نسخ عند الإطلاق، وفقًا لمقال من أغسطس 2015: Connecticut من الإكوادور (حشوة من نيكاراغوا وبنسلفانيا)، وHabano من الإكوادور (Piloto Cubano وأومتيبي وإستيلي)، وMaduro بغلاف San Andrés (حشوة دومينيكانية، من إستيلي ومن خالابا)، بمقاسات Robusto 5 x 52 وToro Gordo 6 x 54 وImmensio XO 6 x 60. ويُكرّم الاسم سان دييغو دي لوس بانيوس في كوبا؛ وعُرضت خمس خلطات في IPCPR 2018، وفقًا لمقال من أغسطس 2018."}]'
 WHERE `name` = 'American Caribbean Cigars' AND SHA1(TRIM(`gamme`)) = '098b7332faa54be497b4c12b54e3ed13d9c6abdc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'American Caribbean Cigars' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '098b7332faa54be497b4c12b54e3ed13d9c6abdc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ann-Eks' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '736cf8d4ee4eb55680f64a84429a255673e305e9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Antonius' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'ad194098eb1d0a5ce65c6d34564250d0eab3f7d1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Arnold André' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '6a75b920842d3519e0c11f2daa562d0a1c46113e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Artista Cigars' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'a5526d67254bb8c716a4800f497d0e6c93799028';
-- brands|Arturo Fuente|gamme|ar — أسماء أشخاص، The Man
UPDATE `brands` SET `gamme_ar` = '[{"name":"Opus X","color":"#8B0000","force":"Full","story":"طُرح للبيع في 18 نوفمبر 1995، وتقدّمه arturofuente.com بوصفه أول سيجار puro دومينيكي، بغلافه أيضًا. ينمو الغلاف في Château de la Fuente قرب بوناو. القياسات في قائمة الدار: Robusto 5¼ x 50، Double Corona 7⅝ x 49، Reserva D''Chateau 7 x 48، PerfecXion X 6¼ x 48، PerfecXion No.2 6⅜ x 52، Fuente Fuente 5⅝ x 46. يُسلَّم بكميات محدودة إلى حفنة من تجار التجزئة، كما كتب Tobacconist of Greenwich في يوليو 2025.","vitolas":["Robusto","Double Corona","Reserva D''Chateau","PerfecXion X","PerfecXion No.2","Fuente Fuente"],"wrapper":"Château de la Fuente (الجمهورية الدومينيكية)"},{"name":"Don Carlos","color":"#A0522D","force":"Medium-Full","story":"تحمل اسم Carlos Fuente Sr.، بحسب arturofuente.com؛ ويصف هذا الموقع تبغًا نادرًا معتَّقًا حتى عشر سنوات تحت غلاف من الكاميرون. وبحسب Carlos Fuente Jr.، فإن أول Don Carlos بِيع، عام 1976، لُفّ في إستيلي بنيكاراغوا (يونيو 2026). القياسات في قائمة الدار: Robusto 5 x 50، Double Robusto 5¾ x 52، Belicoso 5⅜ x 52، The Man 5¼ x 50، Presidente 6½ x 50، Personal Reserve Eye of the Shark 5¼ x 52.","vitolas":["Robusto","Double Robusto","Belicoso","The Man","Presidente","Personal Reserve Eye of the Shark"],"wrapper":"كاميروني"},{"name":"Hemingway","color":"#8B4513","force":"Medium","story":"أُطلقت عام 1981 بحسب arturofuente.com، أي بعد سنة من افتتاح Fuente Ltd؛ وتقدّم الصفحة شكلها الفيغورادو بوصفه سابقة في الصناعة آنذاك. ويروي Bespoke Unit أنّ Carlos Fuente Sr. عثر على قوالب قديمة للبيرفكتو في مستودع بفلوريدا، ويؤرّخ مزيج كارليتو بعام 1983، تحيةً للكاتب الأمريكي. غلاف من الكاميرون فوق رابط وحشوة دومينيكيين، خفيفة إلى متوسطة بحسب هذا الموقع (2017، وحُدّثت عام 2023). والـMasterpiece، 9 x 52، هو أطول قياس في قائمة الدار.","vitolas":["Classic","Short Story","Best Seller","Masterpiece","Signature"],"wrapper":"كاميروني"},{"name":"Añejo","color":"#722F37","force":"Medium-Full","story":"قُدّمت عام 2000 بخمسة قياسات، بحسب Cigar Coop (أغسطس 2014)؛ ويأتي No.77 Shark نحو عام 2002. ويربطها Cigar Coop بإعصار جورج عام 1998: فيُقال إن Carlos Fuente Jr.، خشية أن ينفد الغلاف الخاص بـOpusX، ألبس مزيج OpusX غلافًا من Connecticut Broadleaf. وتكتب الدار أن أوراق غلاف المادورو تُعتَّق في براميل كونياك، وتقدّم Shark (5⅞ x 48/64) على أنه أول طوربيد ينتقل من باريخو مستدير إلى كبس مربّع.","vitolas":["No.46","No.48","No.50","No.55","No.60","No.77 Shark"],"wrapper":"Connecticut Broadleaf Maduro"},{"name":"Casa Cuba","color":"#8B5A2B","force":null,"story":"أُطلقت في أواخر عام 2013 بحصة محدودة لتجار التجزئة، بحسب Cigar Coop، وتقدّمها arturofuente.com بوصفها آخر خلطة للراحل Carlos Fuente Sr.، صُمّمت لتستحضر السيجار الذي كان يلفّه ويدخّنه في شبابه مع والده، بتبغ كوبي. غلافها Havana من الإكوادور، على لفافة داخلية وlongfiller دومينيكانيين من بذور كوبية، لُفّت في Tabacalera A. Fuente y Cia. وتحمل المقاسات أسماء قطع الدومينو الكوبية: Doble Dos 6¾ x 42 وDoble Tres 5½ x 44 وDoble Cinco 5 x 50 وDoble Seis 6 x 52 وDoble Cuatro 4½ x 54 وDivine Inspiration 6⅛ x 47. وتُوصف القوة بأنها medium، وترتفع إلى medium-full في الثلث الأخير، لدى Cigar Coop عام 2014، وبأنها medium-full لدى تاجر تجزئة في أكتوبر 2026.","vitolas":[],"wrapper":"Havana من الإكوادور"},{"name":"Fuente Fuente OpusX The Lost City","color":"#A0522D","force":"Medium-Full","story":"إصدار من OpusX، تبغه كله دومينيكاني، زُرع في صيف عام 2004 في Château de la Fuente لتصوير فيلم «المدينة المفقودة»، الذي صدر عام 2005 وأخرجه Andy Garcia، ثم عُتّق خمس سنوات، بحسب fuenteagedselection.com، التي تصفه بأنه من medium إلى قوي. لُفّ في Tabacalera A. Fuente؛ وتضعه برقية إخبارية صادرة في يونيو 2024 ضمن الحصة السنوية Aged Selection التي تُسلَّم إلى تجار التجزئة. المقاسات: Robusto 5¼ x 50 وDouble Robusto 5¾ x 52 وToro 6¾ x 48 وLancero 7½ x 38 وCarlito''s A 9¼ x 47.","vitolas":[],"wrapper":"جمهورية الدومينيكان"}]'
 WHERE `name` = 'Arturo Fuente' AND SHA1(TRIM(`gamme`)) = 'a8262138fa7b002a4beaa497626adc1a774f589c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Arturo Fuente' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'a8262138fa7b002a4beaa497626adc1a774f589c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Arturo Fuente Hemingway' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '0c030683b6a524daa5318c24c187b4a130bb217e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Arturo Fuente Maduro' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'de0d969c686b4b18d35c581dde67311828112fb6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Aruhiba' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '304403554b6f496c50c02902d3a0215c12c24cf6';
-- brands|Ashton|gamme|ar — marques en latin, formulation
UPDATE `brands` SET `gamme_ar` = '[{"name":"Ashton Classic","color":"#C9A96E","force":"Light-Medium","story":"المجموعة المؤسِّسة. غلاف كونيتيكت شيد فوق خلطة دومينيكية، تُلفّ عند Fuente. قشدة، فانيليا، حبوب محمّصة. ثابتة، أنيقة، بلا مفاجآت. والقياس Magnum (52 × 127 مم) هو الأعلى طلبًا. الـAshton Classic هو السيجار الذي تُقدّمه حين لا تعرف ذوق ضيفك.","vitolas":["No.1","No.2","Magnum","Churchill","Cordial","Panetela"],"wrapper":"Connecticut Shade"},{"name":"VSG — Virgin Sun Grown","color":"#8B0000","force":"Full","story":"أُطلقت عام 1999 — وجه آخر لـAshton. غلاف إكوادوري مزروع تحت الشمس فوق خلطة نيكاراغوية-دومينيكية. ممتلئة الجسم: قهوة سوداء، شوكولاتة، فلفل كايين. تكشف الـVSG عن دار قادرة على القوّة متى شاءت.","vitolas":["Torpedo","Robusto","Toro","Illuminado","Enchantment","Conquistador","Hero"],"wrapper":"مزروع في الشمس من الإكوادور"},{"name":"Cabinet Selection","color":"#A0522D","force":"Medium","story":"مجموعة المقام الرفيع — تُعتَّق بعد اللفّ من اثني عشر إلى أربعة وعشرين شهرًا إضافية في علب من الأرز الإسباني. غلاف كونيتيكت شيد. بندق مصفّى، عسل جبلي، أرز أبيض. معقّدة دون أن تكون متطلّبة: وهذا بالضبط ما تريد أن تكونه.","vitolas":["No.1","No.2","No.3","No.6","No.7","No.8","No.10"],"wrapper":"Connecticut Shade"},{"name":"San Cristobal","color":"#6B4226","force":null,"wrapper":"الإكوادور، بحسب الخط","vitolas":[],"story":"خط نيكاراغوي أُطلق عام 2007 مع José « Pepin » Garcia، صنعته عائلة Garcia في مصنع My Father في إستيلي. أما Quintessence، بغلاف Habano Rosado من الإكوادور على longfiller نيكاراغوي، فتصفها Ashton Distributors بأنها medium-full، بستة مقاسات؛ وGolden Hour، التي أُعلن عنها لتجار التجزئة في أبريل 2026 وعُرضت في PCA، تضيف ستة مقاسات بغلاف Habano من الإكوادور، على لفافة داخلية من نيكاراغوا وحشوة من مزارع Garcia، بحسب Cigar Coop."}]'
 WHERE `name` = 'Ashton' AND SHA1(TRIM(`gamme`)) = '23d6ed6fbdb4486000e037af9cf5dc90af8dfb98';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ashton' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '23d6ed6fbdb4486000e037af9cf5dc90af8dfb98';
-- brands|Ashton Cabinet|gamme|ar — Dominican Fuente خطأ في الترجمة
UPDATE `brands` SET `gamme_ar` = '[{"name":"Cabinet Selection","color":"#C9A96E","force":"Medium","story":"غلاف Connecticut Shade إكوادوري معتَّق، وتبغ دومينيكاني معتَّق سنتين في خشب الأرز لدى Fuente. لمسات من البندق المكرَّر وعسل الجبال والأرز الفاتح. متوسطة القوة، أنيقة. وكل رقم (من No.1 إلى No.10) يقابل طرازاً مختلفاً — وهي أشمل تشكيلات Ashton.","vitolas":["No.1","No.2","No.3","No.6","No.7","No.8","No.10"],"wrapper":"Connecticut Shade من الإكوادور"}]'
 WHERE `name` = 'Ashton Cabinet' AND SHA1(TRIM(`gamme`)) = 'f22d22e8a8cbabe1046377aa69d9321c397d6338';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ashton Cabinet' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'f22d22e8a8cbabe1046377aa69d9321c397d6338';
-- brands|Asylum|gamme|ar — شركات بالحروف اللاتينية
UPDATE `brands` SET `gamme_ar` = '[{"name":"Asylum 13","color":"#4A2C1A","force":"Full","wrapper":"مزيج نيكاراغوي","vitolas":["Robusto","Toro","Sixty","Seventy","Eighty"],"story":"السلسلة المؤسِّسة، وسلسلة المقاسات المفرطة: تحمل المقاسات أقطارها أسماءً، حتى الثمانين. تُلَفّ في NACSA بإستيلي."},{"name":"Asylum Insidious","color":"#6B4226","force":"Medium-Full","wrapper":"مزيج نيكاراغوي","vitolas":["Corona","Robusto","Toro"],"story":"الوجه الأشدّ اتّزانًا في الكتالوج، بمقاسات كلاسيكية. الورشة نفسها والموقف نفسه من السعر."},{"name":"Asylum Straight Jacket","color":"#3A2A20","force":"Full","wrapper":"مزيج نيكاراغوي","vitolas":["Robusto","Toro"],"story":"«سترة التقييد»، بحروفها. تمضي الدار بموضوعها إلى آخر الأسماء، كما تفعل Black Label Trading بموضوعها."}]'
 WHERE `name` = 'Asylum' AND SHA1(TRIM(`gamme`)) = '161da9267b15ac5191ebabbc994359189e1d25af';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Asylum' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '161da9267b15ac5191ebabbc994359189e1d25af';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Atabey' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '4e152a442d9e274d3aeba04163d3987bfe12b224';
-- brands|Atatürk|gamme|ar — اسم الشخص بالحروف اللاتينية
UPDATE `brands` SET `gamme_ar` = '[{"name":"Atatürk 1923","color":"#A0522D","force":"Mild-Medium","wrapper":"Javano (إندونيسيا)","vitolas":[],"story":"puro إندونيسي بالكامل، برباط Besuki Na-Oogst، تكريمًا لـMustafa Kemal Atatürk."}]'
 WHERE `name` = 'Atatürk' AND SHA1(TRIM(`gamme`)) = '26557aa79d03e3ca064ba9339132cb0375c6122c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Atatürk' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '26557aa79d03e3ca064ba9339132cb0375c6122c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Avo' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'fc88fea23c721e9f512c8c64ce91a90a65f8c357';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Baccarat' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '117e0654c8ffb7f55a00bfbb6be9d8894f412869';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bahia' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '0bcdcf42a9109d0a1a9c64ddfd9c0a87743c17f3';
-- brands|Balmoral|gamme|ar — noms de personnes en latin
UPDATE `brands` SET `gamme_ar` = '[{"name":"Añejo XO","color":"#6B4226","force":"Medium-Full","wrapper":"برازيلي مزروع تحت الشمس","vitolas":[],"story":"تموز/يوليو 2015 — ورقة رابطة أولور دومينيكية، حشوة من البرازيل وجمهورية الدومينيكان ونيكاراغوا. Rothschild Masivo وMK52 وPetit Robusto FT."},{"name":"Añejo 18","color":"#4A3728","force":"Medium","wrapper":"غير معلن","vitolas":[],"story":"2014 — الخطّ الفاخر الأوّل لـRoyal Agio."},{"name":"Serie Signaturas","color":"#8B5A2B","force":"Medium-Full","wrapper":"غير معلن","vitolas":[],"story":"بأربع أيدٍ مع Boris Wintermans: Dueto (Ernesto Perez-Carrillo، 2018)، وPaso Doble (Litto Gomez، 2019)."}]'
 WHERE `name` = 'Balmoral' AND SHA1(TRIM(`gamme`)) = 'd6d96d8f34ff7dea9f0a87700290aa4151ff2070';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Balmoral' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'd6d96d8f34ff7dea9f0a87700290aa4151ff2070';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bandolero' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'c04c52588aadec93f6e52b9118e642aea7bad1af';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Baron Ullmann' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '4adf28696d8329d918c28613af47ca7f513ac358';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Barrio Viejo' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '35b00c811ba65e42528e995273f77b78de37d59b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bauza' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '6e54596cc5bf91da089aef8bb753ca270502ee56';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Belmore' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '18a82a34b6ae5f74f522d1ca1fac70408c56c943';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bering' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '72223a4bdb9580cb76a722cd40a355fedd098046';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'BerlinCigarMen' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '8318c45eae744237f9cce10970ea423a867f9005';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'BIN Cigar' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'fc06e3e18e4d792887a6f570266a228f79d701dc';
-- brands|Black Label Trading Co.|gamme|ar — noms latins, San Andrés
UPDATE `brands` SET `gamme_ar` = '[{"name":"Last Rites","color":"#2E2018","force":"Full","story":"«الطقوس الأخيرة» — السلسلة المؤسِّسة، وهي التي أعطت نبرتها لكامل أيقونوغرافيا الدار. قويّة، وملفوفة في Oveja Negra.","vitolas":["Robusto","Toro","Petit Lancero"],"wrapper":"مزيج Oveja Negra"},{"name":"Salvation","color":"#4A2C1A","force":"Medium-Full","story":"نظيرة Last Rites، في السجلّ الطقسي نفسه. أوراق من نيكاراغوا وهندوراس وSan Andrés والإكوادور.","vitolas":["Robusto","Toro"],"wrapper":"مزيج Oveja Negra"},{"name":"Santa Muerte","color":"#3A2A20","force":"Full","story":"«الموت المقدّس» في التديّن الشعبي المكسيكي، من رسم James Brown نفسه. تمضي الدار بصورها إلى منتهاها بدل الاكتفاء بالتلميح.","vitolas":["Robusto","Toro"],"wrapper":"مزيج Oveja Negra"},{"name":"Black Works Studio","color":"#1F1F1F","force":"Full","story":"الاسم الثاني لـJames Brown، تشرين الثاني/نوفمبر 2015، المصنع نفسه — Oveja Negra — للمزجات الأقلّ تقليديةً. افتتحها NBK وKiller Bee وRorschach.","vitolas":[],"wrapper":"هابانو إكوادوري"}]'
 WHERE `name` = 'Black Label Trading Co.' AND SHA1(TRIM(`gamme`)) = 'b82bd152c8d0aba179f1abcc5850e879c1b7d49c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Black Label Trading Co.' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'b82bd152c8d0aba179f1abcc5850e879c1b7d49c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Blackbird Cigar Co.' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'aa4d518f7520e84a292044c4c90f6da0bf93af7d';
-- brands|Blanco Cigars|gamme|ar — prénoms latins, Broadleaf omis
UPDATE `brands` SET `gamme_ar` = '[{"name":"Liga Exclusiva de Familia","color":"#6B4226","force":"Medium","wrapper":"Connecticut Shade أو Pennsylvania Broadleaf Maduro","vitolas":[],"story":"الاحتياطي الخاص السابق للأخوين، بمزاجين — كونيتيكت Cesar، ومادورو David."},{"name":"Blanco Nine","color":"#4A3728","force":"Full","wrapper":"غير معلن","vitolas":[],"story":"الاسم الآخر الذي يعرفه الهواة."}]'
 WHERE `name` = 'Blanco Cigars' AND SHA1(TRIM(`gamme`)) = '0bc11ff0b89f33b652b427249dc22ee6414075d4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Blanco Cigars' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '0bc11ff0b89f33b652b427249dc22ee6414075d4';
-- brands|Bock y Ca.|gamme|ar — douce, pas sucrée
UPDATE `brands` SET `gamme_ar` = '[{"name":"Bock y Ca.","color":"#A0522D","force":"Medium","wrapper":"غير معلن","vitolas":[],"story":"رباط إندونيسي وحشوة دومينيكية ونيكاراغوية، تصفها Villiger بأنها ناعمة وكريمية."},{"name":"Bock Renacimiento 25 Años","color":"#A0522D","force":null,"wrapper":"غير معلن","vitolas":[],"story":"إصدار محدود بقياس Toro Gordo بمناسبة مرور خمسة وعشرين عامًا على إعادة الإطلاق، سنة 2024 (halfwheel)."}]'
 WHERE `name` = 'Bock y Ca.' AND SHA1(TRIM(`gamme`)) = 'b08c58bf87c6266652c0821b45a973095c4cbcc8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bock y Ca.' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'b08c58bf87c6266652c0821b45a973095c4cbcc8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bohekio' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '3436508d76ccee5483c8643ae6a8cc6c792afea4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bolivar' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '954d48b8c3dd900c27bad19b01f2e5c1acde3ed3';
-- brands|Bolívar Honduras|gamme|ar — nom de personne en latin
UPDATE `brands` SET `gamme_ar` = '[{"name":"Cofradia","color":"#6B3A1F","wrapper":"إكوادور، بذرة سومطرة","story":"خلطها Estélo Padrón، مدير الإنتاج في مصانع HATSA. رباط من Connecticut Broadleaf الأمريكي، وحشوة هندوراسية ونيكاراغوية."}]'
 WHERE `name` = 'Bolívar Honduras' AND SHA1(TRIM(`gamme`)) = '5ab6628d7ca51a39dd9dd969080d8026e3662150';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bolívar Honduras' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '5ab6628d7ca51a39dd9dd969080d8026e3662150';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bombay Tobak' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '0d8ece5afb4dd0eae6c45b26d6fdf9d88844a9ca';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bongani' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '6763c9ad6159fa9fdb199c3d54001e216a9752ec';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Boutique Blends' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
-- brands|Brun del Ré|gamme|ar — planteur, non fermes
UPDATE `brands` SET `gamme_ar` = '[{"name":"1787 Libertad","color":"#8B5A2B","force":"Medium-Full","wrapper":"كوستاريكي، كما تقول الدار","vitolas":[],"story":"أوّل سيجار للدار كلّه من تبغ كوستاريكي، لدى أحد مزارعي الجنوب. التاريخ: كوستاريكا في مملكة غواتيمالا."},{"name":"Premium","color":"#6B4226","force":"Medium","wrapper":"غير معلن","vitolas":[],"story":"الخطّ الأساس، مع Gold وColonial."},{"name":"1638","color":"#4A3728","force":"Medium-Full","wrapper":"غير معلن","vitolas":[],"story":"تاريخٌ آخر اسمًا."}]'
 WHERE `name` = 'Brun del Ré' AND SHA1(TRIM(`gamme`)) = '0e22d6492d03b82a6451e4e23c6b04dfe32e1c84';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Brun del Ré' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '0e22d6492d03b82a6451e4e23c6b04dfe32e1c84';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bugatti' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'ff0bed0c03dc0a1472556ede52f6e8f3251475ee';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Burger Söhne' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Butera' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'fb206a3190c32d9d2138020dd6cd1c6241628b3c';
-- brands|Byron|gamme|ar — marque latine, contresens
UPDATE `brands` SET `gamme_ar` = '[{"name":"Byron Siglo XIX","color":"#6B4226","force":"Medium-Full","wrapper":"خلطة غير مُفصح عنها","vitolas":["Toro"],"story":"السلسلة التي تحيل إلى القرن التاسع عشر. جلد وكاكاو وأخشاب ثمينة — سعةٌ حيث يلعب Atabey على الدانتيل."},{"name":"Byron Siglo XVIII","color":"#8B4513","force":"Medium","wrapper":"خلطة غير مُفصح عنها","vitolas":["Corona Gorda"],"story":"مزاج أقدم من ذلك، بمقاسات أبسط. التشكيلة منظَّمة بحسب العصور، وهذا مقصد بقدر ما هو مذاق."}]'
 WHERE `name` = 'Byron' AND SHA1(TRIM(`gamme`)) = '4f3ffb6e133b57ab1b51d34798c9d23b9f1a1507';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Byron' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '4f3ffb6e133b57ab1b51d34798c9d23b9f1a1507';
-- brands|Cabal Cigars|gamme|ar — nom latin, mot interdit
UPDATE `brands` SET `gamme_ar` = '[{"name":"Cabal","color":"#4A3728","force":"Medium-Full","wrapper":"بوناو (جمهورية الدومينيكان)","vitolas":[],"story":"2013 — إحدى وعشرون تجربة في KBF مع Hendrik Kelner Jr.؛ غلاف بوناو، ورقة دومينيكية نادرة."},{"name":"Esoteric","color":"#8B1A6B","force":"Medium","wrapper":"غير معلن","vitolas":[],"story":"المزجة رقم 19 من التجارب — أشدّ اختلافًا من أن تكون Cabal، أُبقيت بسلاسل صغيرة."},{"name":"Initiative","color":"#C9A96E","force":"Medium","wrapper":"كوروخو كولورادو إكوادوري","vitolas":[],"story":"الجديد، في Tabacalera La Isla — الإصدار الأوّل منذ ما يزيد على ست سنوات، كما يقول تاجر تجزئة."}]'
 WHERE `name` = 'Cabal Cigars' AND SHA1(TRIM(`gamme`)) = '659ef3c6c9db38815ff162d0419302fb2fd34c73';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cabal Cigars' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '659ef3c6c9db38815ff162d0419302fb2fd34c73';
-- brands|Caldwell Cigar Co.|gamme|ar — démesurés, nom latin
UPDATE `brands` SET `gamme_ar` = '[{"name":"Long Live the King","color":"#6B4226","force":"Medium-Full","wrapper":"دومينيكي","vitolas":["Petit Double Wide Short Churchill","Robusto"],"story":"أحد خطوط الإطلاق الثلاثة عام 2014، وهو الذي دام. وأسماء المقاسات مبالغ فيها عن قصد — تلعب الدار على التوكيد لا على الاقتضاب."},{"name":"The King is Dead","color":"#4A2C1A","force":"Full","wrapper":"دومينيكي","vitolas":["Premier Regalos"],"story":"النصف الآخر من ثنائية الإطلاق. يُقرأ الخطّان معًا، ولا معنى لأحدهما إلا بالنسبة إلى الآخر."},{"name":"Eastern Standard","color":"#C9A96E","force":"Medium","wrapper":"كونيتيكت","vitolas":["Sungrown","Euro Cut"],"story":"الخطّ الذي لم يكن مقرّرًا. وُضع بين يدي Caldwell ورق كونيتيكت خاصّ، فنجحت التجربة ودخل الكتالوج."}]'
 WHERE `name` = 'Caldwell Cigar Co.' AND SHA1(TRIM(`gamme`)) = '139ed99825d633e77da6611d778543443db36e34';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Caldwell Cigar Co.' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '139ed99825d633e77da6611d778543443db36e34';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Camacho' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '3040a58787329ed50046b0ed9ed630aab0430f16';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Canaritos' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '60fc652172b39c675e266fead15b841e5a5fa073';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Canned Heat' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'f59881db2c766ba7a2b93cd8ca0039ba9a2752f6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'a8df47cf21eb455a9e05a500340079acbd49b559';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO America' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'f470333905d574b434d123231d1867c42de784f3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO Black' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'eeddeee9d337aea4295763deabe00909ef82309a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO Cameroon' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'bb3e1d05e6c465c6642baab2ce50c1301d9a1259';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Caoba' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'e7ca08c60c3c008fc63ad9f2ac6b0aa0d2485789';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Capadura' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'aa07b38bd1d898925c38fbb89d38011d178aa17f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Capitol' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '23819d777f5efbadae6bcca241a0fd9dc2523fd0';
-- brands|Casa 1910|gamme|ar — San Andrés en latin
UPDATE `brands` SET `gamme_ar` = '[{"name":"Cuchillo Parado","color":"#8B3A1E","force":"Medium-Full","wrapper":"مكسيكي خالص","vitolas":[],"story":"السيجار الأوّل، 2021 — قرية تشيواوا التي بدأت فيها الثورة. وتبعه Reserva 2020 سنة 2023."},{"name":"Tierra Blanca","color":"#C9A96E","force":"Medium","wrapper":"مكسيكي خالص","vitolas":[],"story":"معركة من الثورة — الخطّ الأساس الثاني."},{"name":"El Ébano","color":"#3A2A1E","force":"Medium-Full","wrapper":"San Andrés (المكسيك)","vitolas":[],"story":"أُعلن سنة 2024، ومنتظر لصيف 2026 — غلاف San Andrés مادورو كولورادو، أتبغة معتّقة خمس سنين كما تقول الدار. معركة إيبانو، 1915."}]'
 WHERE `name` = 'Casa 1910' AND SHA1(TRIM(`gamme`)) = '1e236ca965f145eb13a3b8ed91d778cc312c9ba0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa 1910' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '1e236ca965f145eb13a3b8ed91d778cc312c9ba0';
-- brands|Casa Cuevas|gamme|ar — noms propres en latin
UPDATE `brands` SET `gamme_ar` = '[{"name":"Casa Cuevas","color":"#8B5A2B","force":"Medium","wrapper":"هابانو أو كونيتيكت أو مادورو بحسب السلسلة","vitolas":["Robusto","Toro","Belicoso"],"story":"السلسلة الأساسية، بحشوة طويلة وملفوفة كاملةً في Tabacalera Las Lavas. ويأتي جزء من التبغ من حقول العائلة في وادي سيباو."},{"name":"Patrimonio","color":"#4A2C1A","force":"Medium-Full","wrapper":"مزيج دومينيكي","vitolas":["Toro","Robusto"],"story":"مزجها عام 2021 Luis Cuevas الابن وابنُه Alec، وأهدياها إلى Luis Cuevas الأب. ثلاثة أجيال على مزيج واحد."},{"name":"Sangre Nueva","color":"#6B4226","force":"Medium-Full","wrapper":"مزيج دومينيكي","vitolas":["Toro"],"story":"«دم جديد» — السلسلة التي أعلن بها الجيل التالي عن نفسه. الورشة نفسها والوادي نفسه، بتركيبة حازمة."}]'
 WHERE `name` = 'Casa Cuevas' AND SHA1(TRIM(`gamme`)) = '355980d501c9adde5c6646a7c14b2bc0c04cc297';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa Cuevas' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '355980d501c9adde5c6646a7c14b2bc0c04cc297';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa Culinaria' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'a7e0c078cb4d7e45094473c661376bda9445cf20';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa de Alegria' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '6e54615a9d51e45b15110073b746d274e44565bf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa de Garcia' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'ce2b5e67faaf6b88969f10b07c1cd25c7407f8cc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa de Torres' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'd14a9e590f62b73a9b86a373dc0bfc0c62913316';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa Turrent' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'b65bbc1c0deefb88440832ed69f10e4f7ba115b0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casagranda' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'eb7c216d9a6dc8f3ba025b4f20a75be9dcdc9105';
-- brands|Casdagli|gamme|ar — formulation comparative reformulée
UPDATE `brands` SET `gamme_ar` = '[{"name":"Villa Casdagli","color":"#7B3F2E","force":"Medium-Full","story":"المجموعة التي تحمل اسم الدار. تبقى الخلطة سرّية، كما هو الحال غالبًا لدى الدور بهذا الحجم — والتحفّظ على المصادر اختيار لا سهو.","wrapper":"خلطة غير مُفصح عنها"},{"name":"Daughters of the Wind","color":"#8B5A3C","force":"Medium","story":"يأتي الاسم من الطريقة التي يُتحدّث بها عن الأوراق المجفَّفة بالهواء. مقام أشدّ تحفّظًا من الـVilla Casdagli.","wrapper":"خلطة غير مُفصح عنها"},{"name":"Cigarrus Basilica","color":"#6B4226","force":"Medium-Full","story":"سلسلة قصيرة تُنتَج على دفعات. ويفوق وزنُ صيغة الإصدار وزنَ طابعها في تحديد هذه المجموعة.","wrapper":"خلطة غير مُفصح عنها"}]'
 WHERE `name` = 'Casdagli' AND SHA1(TRIM(`gamme`)) = '9f21806a437f7aeacf3fc6baf7b67098076584d1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casdagli' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '9f21806a437f7aeacf3fc6baf7b67098076584d1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Castillo de Reyes' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'b2f0e19946f86c078c53ef236cba9b92b5a67e06';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cavalier Genève' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'b2230c7fc7cc69ebefdf912a550c2ba350bd96cd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Chaba' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '2029738699a27b9add62e79ee327ac5b5f6a416a';
-- brands|Charatan|gamme|ar — سيجارة بدل سيجار
UPDATE `brands` SET `gamme_ar` = '[{"name":"Claro","color":"#C9A96E","force":"Mild","wrapper":"Connecticut (الإكوادور)","vitolas":[],"story":"غلاف Connecticut من الإكوادور، ورباط وحشوة من نيكاراغوا، بقوة خفيفة، بحسب الدار، في Half Churchill (3 1/2 x 46، في علب من 24 سيجارًا) وRobusto (5 x 52) وToro (6 x 50)، في علب من 12 سيجارًا."},{"name":"Colorado","color":"#A0522D","force":"Mild-Medium","wrapper":"Habano (الإكوادور)","vitolas":[],"story":"غلاف ببذور Habano مزروع تحت الظل في الإكوادور، ورباط وحشوة من نيكاراغوا، بقوة من خفيفة إلى متوسطة، بحسب الدار، في المقاسات الثلاثة نفسها."},{"name":"Maduro","color":"#4A3728","force":"Medium-Full","wrapper":"San Andrés (المكسيك)","vitolas":[],"story":"غلاف San Andrés من المكسيك، ورباط وحشوة من نيكاراغوا، وتصف الدار قوته بأنها medium-plus، في المقاسات الثلاثة نفسها."},{"name":"160th Anniversary","color":"#C9A96E","force":null,"wrapper":"Connecticut (الإكوادور)","vitolas":[],"story":"Lonsdale بمقاس 6 1/2 x 44، بغلاف Connecticut من الإكوادور، ورباط San Andrés مكسيكي، وحشوة من خالابا، في علب من 16 سيجارًا؛ أُصدرت في 2023 بكمية محدودة قدرها 250 علبة للمملكة المتحدة، وتعود إلى الإنتاج المنتظم في 2026."}]'
 WHERE `name` = 'Charatan' AND SHA1(TRIM(`gamme`)) = '45e5356be3fe6b071d90cda8d7ff5909d2e6eb5f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Charatan' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '45e5356be3fe6b071d90cda8d7ff5909d2e6eb5f';
-- brands|Chateau Diadem|gamme|ar — أسماء لاتينية
UPDATE `brands` SET `gamme_ar` = '[{"name":"Splendor","color":"#A0522D","force":null,"wrapper":"كوروخو إكوادوري","vitolas":[],"story":"من إبداع اللافّ Eladio Díaz، برباط San Andrés مكسيكي، معروض للبيع في أوروبا منذ 2024، بحسب halfwheel."},{"name":"Alisio","color":"#A0522D","force":"Mild-Medium","wrapper":"كوروخو إكوادوري","vitolas":[],"story":"صُمِّم ليكون سيجارًا أخفّ وأقرب منالًا، سُمّي على اسم ريح دومينيكية."},{"name":"Midnight Wonder","color":"#4A3728","force":"Full","wrapper":"كونيتيكت برودليف","vitolas":[],"story":"خلطة جرى تطويرها على مدى نحو ثلاث سنوات حول غلاف كونيتيكت برودليف."}]'
 WHERE `name` = 'Chateau Diadem' AND SHA1(TRIM(`gamme`)) = '103d6e5369984924ec2a31efe8dd5bf4d78a733f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Chateau Diadem' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '103d6e5369984924ec2a31efe8dd5bf4d78a733f';
-- brands|Cházaro|gamme|ar — San Andrés لاتيني
UPDATE `brands` SET `gamme_ar` = '[{"name":"Black Cházaro","color":"#1C1C1C","force":"Mild-Medium","wrapper":"Negro San Andrés (فيراكروز)","vitolas":[],"story":"أربعة أخماس تبغ فاتح وخُمس داكن — قهوة ورم وفاكهة، كما تقول الدار."},{"name":"Habano","color":"#8B4513","force":"Medium","wrapper":"Negro San Andrés (فيراكروز)","vitolas":[],"story":"نصف داكن ونصف فاتح؛ أوراق مرطّبة بالرم والعسل، كما تقول الدار."}]'
 WHERE `name` = 'Cházaro' AND SHA1(TRIM(`gamme`)) = '8f9e3d1bc1e179f55fcfa35aaefe5890f2c8417a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cházaro' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '8f9e3d1bc1e179f55fcfa35aaefe5890f2c8417a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Chinchalero' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'ff45743b9486ec7c9699c666c4fa93b646df2a98';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Chogüí' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '17d2f84ad1e68f50dcc25fe13b6cc22f4e6947f4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Chone' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '55ee8327b04cf89e499899a67701d227a69b630d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Christo' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'b7ae9182e7c41fe3c58f9e6d9dc2ea1ffab711b0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cigarkings' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '8387180b768fc31502efdaed24fc995534ae413c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CLE Cigar Company' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '11dc2dfc15ebbb2578384e79427671e8d2861971';
-- brands|Cohiba|gamme|ar — خطأ نحوي غلافة
UPDATE `brands` SET `gamme_ar` = '[{"name":"Behike BHK","color":"#8B0000","force":"Full","story":"أُطلق خطّ Behike عام 2010، وتصفه Habanos بأنه الخطّ الأشدّ حصريةً بين ما أطلقته، والأوّل الذي يُدخل medio tiempo في خلطته. ويُلفّ BHK 52 و54 و56 في El Laguito؛ أمّا BHK 58 (58 x 178 mm)، الذي قُدِّم في شباط/فبراير 2025، فانضمّ إلى الخطّ مع أوّل طرح للبيع في سويسرا في شباط/فبراير 2026.","vitolas":["BHK 52","BHK 54","BHK 56","BHK 58"],"wrapper":"كوبا (Vuelta Abajo)"},{"name":"Línea Clásica","color":"#C04000","force":"Medium-Full","story":"التشكيلة الأصلية، التي طُوّرت من 1966 إلى 1989 بحسب Habanos، بقوة تتراوح من المتوسطة إلى القوية. وعند طرحها للبيع لم تكن العلامة تضمّ سوى ثلاثة مقاسات: Lancero (Laguito No. 1) وCorona Especial وPanetela؛ وانضمّ إليها Robusto وExquisito وEspléndido عام 1989. ويستعيد Lancero شكل السيجار الأصلي، طويلًا ورفيعًا برأس مفتول، كما تكتب Newsweek عام 2016. أمّا Pirámides Extra (54 x 160 mm)، أوّل figurado في التشكيلة الدائمة، فقد أُضيف عام 2012 ثم أُضيف Talismán (54 x 154 mm) في تشرين الأول/أكتوبر 2026.","vitolas":["Lancero","Coronas Especiales","Panetelas","Robustos","Exquisitos","Espléndidos","Pirámides Extra","Talismán"],"wrapper":"كوبا (Vuelta Abajo)"},{"name":"Línea 1492","color":"#8B6914","force":"Medium","story":"أُطلقت عام 1992 في الذكرى المئوية الخامسة لوصول كولومبوس إلى كوبا، بقوة متوسطة بحسب Habanos. ويحمل كل Siglo اسم قرن منذ 1492: ظهرت Siglo I إلى V في الأصل، وأُضيف Siglo VI (52 x 150 mm) عام 2002.","vitolas":["Siglo I","Siglo II","Siglo III","Siglo IV","Siglo V","Siglo VI"],"wrapper":"كوبا (Vuelta Abajo)"},{"name":"Maduro 5","color":"#3D1C00","force":"Medium-Full","story":"قدّمت Habanos خطّ Maduro 5 في شباط/فبراير 2007 في Festival del Habano، وهو يضمّ ثلاثة مقاسات: Genios (140 x 52 mm) وMágicos (115 x 52 mm) وSecretos (100 x 40 mm). وغلافه مأخوذ من الأوراق العلوية للنبتة؛ ويعود لونه الداكن إلى تخمير طبيعي طويل وخمس سنوات من التعتيق، بحسب Habanos. وتحمل الحلقة حاشية سوداء كُتب عليها Maduro 5.","vitolas":["Genios","Mágicos","Secretos"],"wrapper":"كوبا، maduro معتّق 5 سنوات"}]'
 WHERE `name` = 'Cohiba' AND SHA1(TRIM(`gamme`)) = '8f686e13dfb430b8d908e6b7d3aa6012adf214e2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cohiba' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '8f686e13dfb430b8d908e6b7d3aa6012adf214e2';
-- brands|Cohiba USA|gamme|ar — رابط بدل رباط
UPDATE `brands` SET `gamme_ar` = '[{"name":"Cohiba Blue","color":"#1A3A6B","story":"أُطلقت في أبريل 2017: غلاف ورباط من هندوراس (Olancho San Agustín)، وحشوة من هندوراس (Jamastrán) ونيكاراغوا (Ometepe) وجمهورية الدومينيكان (Piloto Cubano)، تُلفّ لدى General Cigar Dominicana في سانتياغو. وتصفها الدار في 2026 بعبارة «Luxury without the pretense».","wrapper":"هندوراس (OSA)"},{"name":"Cohiba Red Dot","color":"#8B0000","story":"غلاف من الكاميرون على رباط إندونيسي (Jember) وحشوة دومينيكية، تُلفّ في جمهورية الدومينيكان على يد General Cigar، بحسب تاجر التجزئة Corona Cigar Co. وتصفها الدار في 2026 بعبارة «A modern classic».","wrapper":"الكاميرون"},{"name":"Cohiba Macassar","color":"#2C1A0E","story":"قُدّمت في IPCPR 2016: غلاف كونيتيكت من بذور هافانا، ورباط Broadleaf من كونيتيكت معتّق ست سنوات، وحشوة من جمهورية الدومينيكان (Mao) ونيكاراغوا (Jalapa)؛ وتُعتّق أنواع التبغ مدة لا تقل عن أربع سنوات، وآخرها في برميل روم، كما كتبت Cigar Coop. وتشتق خلطتها من خلطة Comador، التي تحل Macassar محلها.","wrapper":"كونيتيكت (بذور هافانا)"},{"name":"Cohiba Nicaragua","color":"#3D5C1A","story":"قُدّمت في IPCPR 2014 بوصفها أول Cohiba تُصنع في نيكاراغوا، لدى STG Estelí: غلاف من هندوراس (ورقة Colorado oscuro المزروعة تحت أشعة الشمس الكاملة)، ورباط من Jalapa، وحشوة من Estelí (ومن Jalapa أيضاً بحسب Cigar Coop).","wrapper":"هندوراس (Colorado oscuro)"},{"name":"Cohiba Riviera","color":"#0F6B6B","force":null,"wrapper":"المكسيك (San Andrés)","vitolas":[],"story":"أُطلقت في 2023، وهي أول Cohiba مضغوطة على شكل صندوق وأول Cohiba بغلاف San Andrés (المكسيك): رباط من كونيتيكت مزروع في هندوراس، وحشوة من هندوراس (Jamastrán وLa Entrada) ونيكاراغوا (Condega وEstelí)، تُلفّ لدى STG Estelí. وأُضيف Lancero (7 x 38) في PCA 2024."}]'
 WHERE `name` = 'Cohiba USA' AND SHA1(TRIM(`gamme`)) = '9b786ec50bd17529ade08a8d256eccd155ecd9cf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cohiba USA' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '9b786ec50bd17529ade08a8d256eccd155ecd9cf';
-- brands|Colpuros|gamme|ar — popularّ، tabaco
UPDATE `brands` SET `gamme_ar` = '[{"name":"Don José Correa","color":"#5C2E1E","force":"Medium-Full","wrapper":"كولومبية أو مستوردة","vitolas":[],"story":"الخطّ الرفيع باسم الأب — كلّه باليد، بذور كوبية تُزرع في كولومبيا؛ وُضع في ألمانيا سنة 2018."},{"name":"Mosqueteros","color":"#A0522D","force":"Medium","wrapper":"كولومبية أو مستوردة","vitolas":[],"story":"خطّ tabaco والسيجار نصف الرفيع — سيجار سانتاندير الشعبي، خارج قلب هذا الأطلس."}]'
 WHERE `name` = 'Colpuros' AND SHA1(TRIM(`gamme`)) = '65fbb0af435a4c9632e5cbba9ad41d58cace8001';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Colpuros' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '65fbb0af435a4c9632e5cbba9ad41d58cace8001';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Compagnia Toscana Sigari' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'e0839d6b726c08bd55315f7522ecd0e5b3b71118';
-- brands|Cornelius & Anthony|gamme|ar — أسماء لاتينية
UPDATE `brands` SET `gamme_ar` = '[{"name":"Cornelius","color":"#6B4226","force":"Medium-Full","wrapper":"مزيج El Titan de Bronze","vitolas":["Robusto","Toro","Corona Gorda"],"story":"الخطّ الأوّل، صدر عام 2016، وهو الوحيد الذي يُلَفّ في ميامي. يحمل اسم جدّ الجدّ الذي أدخل التبغ إلى العائلة."},{"name":"Daddy Mac","color":"#8B5A2B","force":"Medium","wrapper":"مزيج نيكاراغويّ، في La Zona","vitolas":["Robusto","Toro","Torpedo"],"story":"لقب أحد الأجداد، على سيجار مصنوع في إستيلي. وهو خطّ الدار الأيسر منالًا، وأسهلها وجودًا."},{"name":"Aerial","color":"#4A5D3A","force":"Medium-Full","wrapper":"مزيج نيكاراغويّ، في La Zona","vitolas":["Robusto","Toro"],"story":"صدر عام 2017، ويُلَفّ في La Zona. والاسم من الأسلاك المعلّقة التي كانت العائلة تمدّها قديمًا لتجفيف الورق."},{"name":"Meridian","color":"#3E4A6B","force":"Medium","wrapper":"غير معلن","vitolas":[],"story":"IPCPR 2016 — مع Venganza، لدى La Zona."},{"name":"Venganza","color":"#7A2E1E","force":"Full","wrapper":"غير معلن","vitolas":[],"story":"IPCPR 2016 — الانتقام، القويّ في الدار."},{"name":"The Gent","color":"#C9A96E","force":"Medium","wrapper":"غير معلن","vitolas":[],"story":"IPCPR 2018 — الجنتلمان، مع Mistress، لدى La Zona."}]'
 WHERE `name` = 'Cornelius & Anthony' AND SHA1(TRIM(`gamme`)) = '7c360080c1b77256ec2b280c01f339b655473b06';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cornelius & Anthony' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '7c360080c1b77256ec2b280c01f339b655473b06';
-- brands|Corona Real|gamme|ar — إضافة معنى فاخر
UPDATE `brands` SET `gamme_ar` = '[{"name":"Corona Real","color":"#8B6914","force":"Medium","wrapper":"سومطرة من الإكوادور أو كولومبية","vitolas":[],"story":"سيجار الدار puro، كلّه باليد، على تبغ سانتاندير وغلاف سومطرة من الإكوادور معتَّق منذ 2005-2006."}]'
 WHERE `name` = 'Corona Real' AND SHA1(TRIM(`gamme`)) = '50dd550609f92dcdb5399a07c85254c9215dfbd6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Corona Real' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '50dd550609f92dcdb5399a07c85254c9215dfbd6';
-- brands|Crowned Heads|gamme|ar — أسماء لاتينية، حلقة
UPDATE `brands` SET `gamme_ar` = '[{"name":"Four Kicks","color":"#8B4513","force":"Medium-Full","wrapper":"هابانو إكوادوري","vitolas":["Corona Gorda","Robusto"],"story":"السلسلة التأسيسية، ملفوفة في إستيلي عند My Father. قوية، فلفلية، محكمة البناء — الأسلوب النيكاراغوي كما تراه دار بلا مصنع، ولذلك تختار ملفّها."},{"name":"Le Carême","color":"#4A3728","force":"Full","wrapper":"Connecticut Broadleaf","vitolas":["Toro"],"story":"وُلدت من تعاون مع Ernesto Perez-Carrillo وتُلفّ عنده، في الجمهورية الدومينيكية. غلاف برودليف داكن، كاكاو وقهوة — لا صلة لها بـFour Kicks، وهذا هو المقصد."},{"name":"Headley Grange","color":"#8B5A2B","force":"Medium","wrapper":"سومطرة إكوادوري","vitolas":[],"story":"2013 — القصر الذي سجّلت فيه Led Zeppelin؛ لدى My Father."},{"name":"Jericho Hill","color":"#4A3728","force":"Medium-Full","wrapper":"San Andrés (المكسيك)","vitolas":[],"story":"2014 — بيتٌ لـJohnny Cash، غلاف San Andrés؛ لدى My Father."},{"name":"Las Calaveras","color":"#1F1F1F","force":"Full","wrapper":"غير معلن","vitolas":[],"story":"إصدار سنوي منذ 2014، حلقةٌ لموتى السنة."},{"name":"La Imperiosa","color":"#7A2E1E","force":"Medium-Full","wrapper":"هابانو إكوادوري","vitolas":[],"story":"2015 — الخطّ المنتظم المستخلَص من Las Calaveras؛ لدى My Father."},{"name":"Mil Días","color":"#6B4226","force":"Medium","wrapper":"هابانو إكوادوري","vitolas":[],"story":"2020 — ألف يوم من التطوير، في La Alianza لدى E.P. Carrillo."}]'
 WHERE `name` = 'Crowned Heads' AND SHA1(TRIM(`gamme`)) = '03eed12d7b068068e917239515fff329aee73070';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Crowned Heads' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '03eed12d7b068068e917239515fff329aee73070';
-- brands|Crux Cigars|gamme|ar — أسماء لاتينية
UPDATE `brands` SET `gamme_ar` = '[{"name":"Epicure","color":"#6B4226","force":"Medium","wrapper":"غير معلن","vitolas":[],"story":"الخطّ المركزي، بثلاثة أغلفة — طبيعي، وهابانو، ومادورو."},{"name":"Bull & Bear","color":"#4A3728","force":"Medium-Full","wrapper":"غير معلن","vitolas":[],"story":"ثور البورصة ودبّها — يُلفّ لدى Plasencia."},{"name":"Guild","color":"#8B5A2B","force":"Full","wrapper":"غير معلن","vitolas":[],"story":"النقابة — تحت عين Nestor Plasencia."}]'
 WHERE `name` = 'Crux Cigars' AND SHA1(TRIM(`gamme`)) = 'fe5131d7008c9501ee3e70a9d33cd42328266fa2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Crux Cigars' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'fe5131d7008c9501ee3e70a9d33cd42328266fa2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CSC' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '77c6459fdecb0409092602c9bdb8b0567695be43';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuaba' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '0136f5b71f5c4173a9e5d384cdc0b1a477880b67';
-- brands|Cuba Aliados|gamme|ar — إضافة فريق
UPDATE `brands` SET `gamme_ar` = '[{"name":"Original Blend","color":"#A0522D","force":"Medium","wrapper":"هندوراس (puro)","vitolas":[],"story":"رباط وحشوة هندوراسية، بخمسة مقاسات، من Robusto إلى Churchill، تُلف في Fábrica de Puros Aladino، وفق Cigar Coop."},{"name":"by Ernesto Perez-Carrillo","color":"#A0522D","force":"Medium","wrapper":"Sumatra (الإكوادور)","vitolas":[],"story":"رباط نيكاراغوي، وحشوة نيكاراغوية ودومينيكية، بخمسة مقاسات، مُزجت في Tabacalera La Alianza، وفق Cigar Coop."}]'
 WHERE `name` = 'Cuba Aliados' AND SHA1(TRIM(`gamme`)) = 'b5563588c234e129d1fdba2292de412030f0742f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuba Aliados' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'b5563588c234e129d1fdba2292de412030f0742f';
-- brands|Cuban Crafters|gamme|ar — اسم شركة لاتيني
UPDATE `brands` SET `gamme_ar` = '[{"name":"Don Kiki Brown Label","color":"#5A3A22","force":"Medium-Full","wrapper":"هابانو نيكاراغويّ","vitolas":["Robusto","Toro","Churchill"],"story":"الخطّ الحامل للقب المؤسّس. وهو الذي عرّف بالدار خارج ميامي."},{"name":"Cuban Crafters Cabinet","color":"#3E2723","force":"Full","wrapper":"مزيج نيكاراغويّ","vitolas":["Robusto","Toro","Torpedo"],"story":"يُلَفّ في Tabacalera Estelí كسائر الإنتاج. وتبيع الدار في صناديق كابينيت لا في علب مسطّحة — عادة موروثة من التجارة الكوبية قبل 1960."},{"name":"Don Kiki Vintage","color":"#7B4B2A","force":"Medium","wrapper":"غلاف معتّق","vitolas":["Robusto","Toro"],"story":"الوجه الهادئ للدار، على أوراق حُفظت مدّة أطول قبل اللفّ."}]'
 WHERE `name` = 'Cuban Crafters' AND SHA1(TRIM(`gamme`)) = 'd8534ff05360ddf16379213dfe301a033169c1cf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuban Crafters' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'd8534ff05360ddf16379213dfe301a033169c1cf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuban Stock Cigar Co.' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '93a304f6df4395db2db3b04a36b52b1bc70bf126';
-- brands|Cuervo y Sobrinos|gamme|ar — vitolas مقاسات
UPDATE `brands` SET `gamme_ar` = '[{"name":"Cuervo y Sobrinos","color":"#A0522D","force":null,"wrapper":"غير معلن","vitolas":[],"story":"تبغ بذرة كوبية يُلفّ يدويًا في إستيلي، بأربعة مقاسات: Toro وMareva وPerfecto Press وRobusto."},{"name":"Historiador","color":"#6B4226","force":null,"wrapper":"غير معلن","vitolas":[],"story":"سلسلة منفصلة في كتالوج الدار، لا تُعلن عن غلافها ولا عن قوّتها."}]'
 WHERE `name` = 'Cuervo y Sobrinos' AND SHA1(TRIM(`gamme`)) = 'addc692256600912fd1aa60236f561bc8b2428e3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuervo y Sobrinos' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'addc692256600912fd1aa60236f561bc8b2428e3';
-- brands|Cuesta-Rey|gamme|ar — رابط، أقوى زائد
UPDATE `brands` SET `gamme_ar` = '[{"name":"Cabinet Selection","color":"#8B5A2B","force":"Medium","wrapper":"الكاميرون","vitolas":["Cabinet No. 898","Cabinet No. 95"],"story":"أرقى السلاسل الثلاث: غلاف كاميروني، ورباط دومينيكي، وحشوة دومينيكية وبرازيلية. مقاسان اثنان فقط، طويلان نحيلان — وهو خيار نادر اليوم."},{"name":"Centenario","color":"#C9A96E","force":"Light-Medium","wrapper":"كونيتيكت شيد أو كونيتيكت برودليف","vitolas":["Aristocrat","Pyramid No. 9","Dominican No. 60","Dominican No. 5","Robusto No. 7"],"story":"أوسع السلاسل مقاسًا، فاتحة بغلاف كونيتيكت شيد ومادورو بغلاف كونيتيكت برودليف. مزاج لطيف، وما تحت الغلاف دومينيكي بالكامل."},{"name":"Centro Fino Sungrown","color":"#A0522D","force":"Medium","wrapper":"سنترو فينو إكوادوري مزروع في الشمس","vitolas":["Pyramid No. 9","Centro Fino No. 60","Robusto No. 7"],"story":"الوجه القويّ في الكتالوج. الغلاف الإكوادوري المزروع في الشمس الكاملة يمنحه كثافة تفوق بقية العلامة، من دون أن يخرج عنها."}]'
 WHERE `name` = 'Cuesta-Rey' AND SHA1(TRIM(`gamme`)) = '9c93c642e2290bb15f861a191edb9de2594123aa';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuesta-Rey' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '9c93c642e2290bb15f861a191edb9de2594123aa';
-- brands|Curivari|gamme|ar — bague: حلقات
UPDATE `brands` SET `gamme_ar` = '[{"name":"Buenaventura","color":"#8B5A2B","force":"Medium","wrapper":"بذرة كوبية مزروعة في نيكاراغوا","vitolas":["BV500","BV560","BV560 Torpedo"],"story":"من أولى السلاسل وأوسعها انتشارًا. وتُسمّى مقاساتها بأبعادها لا باسم شكل."},{"name":"Selección Privada","color":"#A0522D","force":"Medium","wrapper":"بذرة كوبية مزروعة في نيكاراغوا","vitolas":["Corona","Robusto"],"story":"الطابع الكريمي الخشبي في الكتالوج. وفي هذه السلسلة يُسمع قصد الدار الكوبي على نحو أشدّ مباشرة."},{"name":"Achilles","color":"#6B4226","force":"Medium-Full","wrapper":"بذرة كوبية مزروعة في نيكاراغوا","vitolas":["Mirmidones","Gloriosos","Heroicos","Eternos"],"story":"السلسلة اليونانية، ومقاساتها مسمّاة من الإلياذة. المؤسّس يوناني، وقد انتهى به الأمر إلى وضع ذلك على الحلقات."}]'
 WHERE `name` = 'Curivari' AND SHA1(TRIM(`gamme`)) = 'f81dc2aa2f5050c6bd00bf974f63518a9e470059';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Curivari' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'f81dc2aa2f5050c6bd00bf974f63518a9e470059';
-- brands|D'Crossier|gamme|ar — Costa Rica وdominicain
UPDATE `brands` SET `gamme_ar` = '[{"name":"Golden Blend","color":"#A0522D","force":null,"wrapper":"الإكوادور","vitolas":[],"story":"أولى سلاسل الشركة، ضمن Diplomacy Series عام 2007؛ برباط دومينيكي وحشوة من كوستاريكا وجمهورية الدومينيكان؛ وتختلف الأوصاف الخاصة بقوتها من مصدر لآخر، فهي خفيفة بحسب موقع، ومتوسطة إلى قوية بحسب موقع آخر تبعًا لمقاس السيجار. وخُصصت نسختها Reserva لوالد رئيس الشركة، Isaias Santana Crossier (1945-2020)."},{"name":"Flor de D''Crossier","color":"#A0522D","force":"Medium","wrapper":"Habano (الإكوادور)","vitolas":[],"story":"افتتحت سلسلتها Selección 512 عام 2017 عملية اللف لدى ABAM في جمهورية الدومينيكان؛ وقوتها متوسطة تميل إلى القوة في المقاسات الكبيرة، بحسب الصحافة المتخصصة."},{"name":"Imperium Class Vintage","color":"#6B4226","force":"Medium-Full","wrapper":"Habano Criollo Especial","vitolas":[],"story":"غلاف من كوستاريكا مزروع تحت الشمس الكاملة، وحشوة إكوادورية ودومينيكية وكوستاريكية؛ سبعة مقاسات بحسب تجار التجزئة."},{"name":"Presidential Collection","color":"#A0522D","force":null,"wrapper":"غير معلن","vitolas":[],"story":"سلسلة ضمن Diplomacy Series؛ وامتدادها Pennsylvania Avenue (2009)، بغلاف Habano Criollo Especial من كوستاريكا وحشوة برازيلية ودومينيكية، كان يُلف لدى Pure Aroma Cigars S.A. في كوستاريكا ثم يُعتَّق تسعة عشر شهرًا في مستودع الشركة بـ Hialeah Gardens (فلوريدا)."},{"name":"L''Forte","color":"#6B4226","force":"Full","wrapper":"كوستاريكا","vitolas":[],"story":"أُطلقت في معرض IPCPR عام 2014، بحشوة دومينيكية ونيكاراغوية؛ وهي قوية بحسب تجار التجزئة، ويبلغ إنتاجها ألفي صندوق سنويًا بحسب Cigar Coop (2016)."},{"name":"Premium Blend","color":"#C9A96E","force":"Mild","wrapper":"Connecticut (الإكوادور)","vitolas":[],"story":"غلاف رقيق وفاتح اللون وحريري الملمس، لملمح أخف من L''Forte بحسب تجار التجزئة."}]'
 WHERE `name` = 'D''Crossier' AND SHA1(TRIM(`gamme`)) = 'a86fa2c0252a6d65b414a3c043445ae3c2b163be';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'D''Crossier' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'a86fa2c0252a6d65b414a3c043445ae3c2b163be';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dalay' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '518188882242ca56f68670f4f92c4b7ee3f1c0cc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Daniel Marshall' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'b5d9b84215eb3aeed8e5011ab3cb5d033f4feb10';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dannemann' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '6c27c92c28b76239227f8b3357b11ad17dfa9641';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dapper' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '935323836ebb4abf0c4c49769e50fe52691761f3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Darier & Cleef' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'cb9e5633e34d801560584e6a92179cd5933249e8';
-- brands|Davidoff|gamme|ar — nom propre en latin
UPDATE `brands` SET `gamme_ar` = '[{"name":"Signature","color":"#C9A96E","force":"Mild","story":"خطّ من White Band Collection. ظهر Signature 2000، وهو corona بعيار 43 وطول 12.9 سم، عام 1976 في Mille Series (zigarren.zone، 12 فبراير 2026)؛ ويصادف 2026 ذكراه الخمسين، مع ملصق للذكرى على خمس عبوات، تقول الدار. وبالنسبة إلى هذا Signature 2000، تذكر الدار تبغًا من الجمهورية الدومينيكية ومن الإكوادور وشدّة قدرها 1.5 من 5 على مقياسها؛ والغلاف الخارجي من الإكوادور، والرابط والحشوة من الجمهورية الدومينيكية، بحسب zigarren.zone (وتكتب CigarSense رابطًا إكوادوريًا هجينًا). يُلَفّ يدويًا في Villa González (Santiago)، مثل كل سيجار Davidoff منذ 1991، تقول الدار. أما Aniversario فتشكّل خطًّا مستقلًّا من White Band Collection، أُطلق عام 1986 بمناسبة بلوغ Zino Davidoff عامه الثمانين.","vitolas":["Anniversario No.1","Anniversario No.2","2000","3000","4000","5000"],"wrapper":"الإكوادور"},{"name":"Winston Churchill","color":"#8B6914","force":"Medium-Full","story":"إطلاق عالمي في مايو 2008، تقول الدار، بعد أن استحوذت المجموعة في 2007 على الحقوق الحصرية لإنتاج السيجار وتسويقه وبيعه باسم Winston Churchill. سلسلتان: The Original Series (شدّة 4 من 5 على مقياس الدار) وThe Late Hour Series (شدّة 4.5 من 5)، قُدّمت في 12 يونيو 2017، وقد عُتِّق فيها تبغ من Condega نحو ستة شهور في براميل ويسكي اسكتلندي سينغل مالت (Cigar Dojo). وتذكر الدار للسلسلتين تبغًا من المكسيك والجمهورية الدومينيكية ونيكاراغوا والإكوادور؛ أما في Late Hour فتصف Cigar Dojo غلافًا خارجيًا Habano من الإكوادور فوق رابط مكسيكي Negro San Andrés.","vitolas":["Toro","Robusto","Churchill","The Original","The Late Hour","The Statesman"],"wrapper":"الإكوادور (Habano، Late Hour)"},{"name":"Nicaragua","color":"#8B2500","force":"Full","story":"أُطلقت عام 2013 تحت حلقة سوداء، تقول الدار، ويوضّح مدخلها أن Davidoff علامة تجارية وليست إقليمًا. وتجمع نسخة Box Pressed، المعلن عنها في فبراير 2016 (Cigar Coop، 22 فبراير 2016)، بين غلاف خارجي Habana Oscuro من نيكاراغوا، ورابط Habana Jalapa، وحشوة من Ometepe وCondega وEstelí، مع قطفة ligero معزَّزة؛ بمقاسي Robusto 5 x 48 وToro 6 x 52. ويصف متجر الدار Toro المكبوس في العلبة بأنه مصنوع من تبغ نيكاراغوي 100 %، وشدّته 4.5 من 5 على مقياسها. وتذكر Cigar Coop الجمهورية الدومينيكية (Tabadom) بلدًا للّف، وهو ما يتوافق مع التسلسل الزمني للدار (كل سيجار Davidoff يُلَفّ في Villa González منذ 1991).","vitolas":["Box Pressed Toro","Box Pressed Robusto","Box Pressed Torpedo"],"wrapper":"نيكاراغوا (Habana Oscuro)"},{"name":"Back2Back","color":"#C9A96E","force":"Mild-Medium","story":"استئناف لـ Room101 Big Payback: بحسب Cigar Coop (27 يوليو 2018)، فإن Back2Back هو إحياؤه من جديد، إذ احتفظ Matt Booth بأسماء Room101 واحتفظت Davidoff بالتوليفات؛ ويوقّع العلب الفنانان النيويوركيان UR NY (Fernando Romero وMike Baca). أطلقتها Davidoff في IPCPR في يوليو 2018 بحسب Cigar Coop؛ وصدرت في أكتوبر 2018 بحسب Corona Cigar Co. وBlind Man''s Puff (17 يوليو 2020)، وكلاهما يصنّفها ضمن قوة خفيفة إلى متوسطة. نسختان: Connecticut (الغلاف الخارجي Connecticut Shade من الإكوادور، رابط مكسيكي، حشوة دومينيكانية) وNicaragua (puro)، بمقاسات 5 x 50 و6 x 60 و7 x 70. تُلَفّ يدويًا في هندوراس، لدى Diadema Cigars de Honduras بحسب Cigar Coop (2018)؛ وتذكر Blind Man''s Puff (2020) أن المصنع هو Tabadom. وقُدّم إصدار محدود لعام 2019 في IPCPR في يوليو 2019 (Cigar Coop). وفي أكتوبر 2026 لا يظهر الخط على صفحة العلامة في davidoff.com.","vitolas":[],"wrapper":"Connecticut Shade، Nicaragua"}]'
 WHERE `name` = 'Davidoff' AND SHA1(TRIM(`gamme`)) = 'ec5bef287fa3b4c7e56e5aa820e7a8c8eb384f02';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Davidoff' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'ec5bef287fa3b4c7e56e5aa820e7a8c8eb384f02';
-- brands|DBL|gamme|ar — San Andrés en latin
UPDATE `brands` SET `gamme_ar` = '[{"name":"Amarillo","color":"#C9A96E","force":"Mild-Medium","wrapper":"كونيتيكت","vitolas":[],"story":"غلاف كونيتيكت معتَّق في براميل روم، وحشوة دومينيكية من مزرعة ألمونتي في سانتياغو، بحسب تاجر التجزئة El Cigar Shop."},{"name":"Maduro","color":"#4A3728","force":"Medium-Full","wrapper":"غير معلن","vitolas":[],"story":"أصناف سُمّيت تيمّنًا بألقاب لاعبي بيسبول، تقول الدار: Little Bull وLa Maquina وLa Flecha وBig Papi وEl Grande."},{"name":"Mafu","color":"#6B4226","force":"Full","wrapper":"الكاميرون أو San Andrés","vitolas":[],"story":"تُقدَّم بغلاف من الكاميرون أو من San Andrés، بمقاسَي Toro وGrande."},{"name":"Extra Viejo","color":"#8B5A2B","force":"Medium-Full","wrapper":"أرابيراكا (المكسيك)","vitolas":[],"story":"غلاف أرابيراكا الذي تصفه الدار بأنه مكسيكي، فوق حشوة برازيلية ودومينيكية."},{"name":"La Tabla","color":"#4A2C1A","force":"Full","wrapper":"أرابيراكا (المكسيك)","vitolas":[],"story":"رباط كاميروني إكوادوري، وحشوة من Corojo 99 دومينيكي وتبغ بنسلفانيا عريض الورق؛ قُدِّم في معرض PCA سنة 2023."},{"name":"2a Generación Reserva Exclusiva","color":"#A0522D","force":null,"wrapper":"غير معلن","vitolas":[],"story":"بإصدار محدود من 500 علبة، تقول الدار، بتبغ من زراعة ألمونتي الخاصة."}]'
 WHERE `name` = 'DBL' AND SHA1(TRIM(`gamme`)) = '54c69fa70050c9bc5a1729682fc42602f6d00b00';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'DBL' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '54c69fa70050c9bc5a1729682fc42602f6d00b00';
-- brands|De Los Reyes Cigars|gamme|ar — comparatif ajouté; noms latins
UPDATE `brands` SET `gamme_ar` = '[{"name":"Saga","color":"#6B4226","force":"Medium","story":"العلامة التي تتصدّر صادرات الدار. وتتفرّع إلى سلاسل عدّة — Golden Age وBlend No. 7 وShort Tales — على أتبغة حقول Leo Reyes.","vitolas":["Robusto","Toro","Corona","Lancero"],"wrapper":"مزجات دومينيكية"},{"name":"Saga Blend No. 7","color":"#5A3A24","force":"Full","story":"سلسلة Saga التي يُبحث عنها باسمها في أغلب الأحيان. غلاف برازيلي من مزرعة العائلة، ورباط هابانو دومينيكي، وحشوة دومينيكية ومن أمريكا الوسطى، في ثلاثة قياسات فقط.","vitolas":["Robusto","Perfecto","Toro Gordo"],"wrapper":"غلاف برازيلي يُسمّى كوبرا، من مزرعة Reyes"},{"name":"Don Julio","color":"#7A4A2C","force":"Medium-Full","story":"اسم رجل: Don Julio Samuel Reyes Fermín، مزارع من الجيل الثالث. دومينيكية بالكامل، على أتبغة حقول العائلة في وادي سيباو. ولها خطّان — Punta Espada (2014) وSang Bleu (2024)، أوّل جديد في الإنتاج المنتظم منذ عشر سنوات.","vitolas":["Robusto","Toro","Churchill"],"wrapper":"أتبغة دومينيكية من سيباو"},{"name":"Augusto Reyes","color":"#8B5A2B","force":"Medium-Full","story":"اسم المؤسّس، على الخطّ الأوثق صلة بأتبغة الدار نفسها.","vitolas":["Robusto","Toro","Churchill"],"wrapper":"مزجات دومينيكية"},{"name":"Arsen","color":"#4A3728","force":"Medium","story":"صُمِّمت في الخارج وتُلفّ هنا. أطلقها Arsen Gasparian سنة 2010 — وكان ينشر المجلة الروسية Hecho a Mano — وهي تستعمل غلاف مزرعة نافاريتي.","vitolas":["Robusto","Toro"],"wrapper":"غلاف من نافاريتي"}]'
 WHERE `name` = 'De Los Reyes Cigars' AND SHA1(TRIM(`gamme`)) = 'eb9f9a4f922d823796ca42e1212c399e1606d381';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'De Los Reyes Cigars' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'eb9f9a4f922d823796ca42e1212c399e1606d381';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Debonaire House' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'f810d0dba6d38196ea60ae6c9280e38b67cfc248';
-- brands|Despot|gamme|ar — comparatif ajouté; arôme
UPDATE `brands` SET `gamme_ar` = '[{"name":"Series J","color":"#A0522D","force":"Medium","wrapper":"Habano إكوادوري","vitolas":[],"story":"أول سلسلة للعلامة، تكريمًا للمقاسات الكلاسيكية؛ حشوة نيكاراغوية من إستيلي، في مقاسات Corona وLancero وPirámides وRobusto."},{"name":"Series U","color":"#8B5A2B","force":"Medium","wrapper":"Habano إكوادوري","vitolas":[],"story":"تركّز على الأريج بدلًا من القوة، بحسب البيت؛ حشوة من بنسلفانيا (الولايات المتحدة) وخالابا وإستيلي، في مقاسات منها Salomone وDouble Corona."},{"name":"Series Z","color":"#6B4226","force":"Medium-Full","wrapper":"غير معلن","vitolas":[],"story":"غلاف إكوادوري يوصف تارة بأنه Rosado وتارة بأنه Claro بحسب البائعين؛ حشوة من خالابا وأوميتيبي، في مقاسات R54 وT54 وPiramides Grande وA Size."}]'
 WHERE `name` = 'Despot' AND SHA1(TRIM(`gamme`)) = '86b353ed024492abaec96e33d67686bba0802697';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Despot' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '86b353ed024492abaec96e33d67686bba0802697';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Diamond Crown' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '21abe816edff827b807123881840c890cd3c77ba';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dios del Sol' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '94efe2922e3c8793a3dba18993cf77a09bd5c473';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Diplomáticos' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '85fc6235b246af0f139cb6261c9352e7162dc1ba';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Domaine de Lavalette' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '07337f91fd52b24e4eb5f2b9247ce6c2d59d3917';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Domenico' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'ee7f7ee0b92c6a74804c64c4b650ef710ac8603a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dominican Estates' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'd884cff233ccd0cbc707c60989c4991d79253b6c';
-- brands|Don Collins|gamme|ar — affirme n'est pas تزعم
UPDATE `brands` SET `gamme_ar` = '[{"name":"Don Collins","color":"#6B4226","force":"Medium","wrapper":"بورتوريكي، كما تقول الدار","vitolas":[],"story":"يُلفّ يدويًّا في ورشة شارع الكريستو منذ 1991؛ تبغ بورتوريكي بلا مبيدات، كما تؤكد الدار."}]'
 WHERE `name` = 'Don Collins' AND SHA1(TRIM(`gamme`)) = '459c745a052c975d94d32814b2109cd5594d3087';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Collins' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '459c745a052c975d94d32814b2109cd5594d3087';
-- brands|Don Diego|gamme|ar — أرز ambigu (riz)
UPDATE `brands` SET `gamme_ar` = '[{"name":"Don Diego Classic","color":"#D9C7A7","force":"Light","wrapper":"Connecticut Shade","vitolas":["Corona","Lonsdale"],"story":"خشب الأرز ولوز ونعومة قشدية. أُلِّف بعد 1960 لطمأنة مدخّنين حُرموا من الهافانا، ولم يُعدَّل منذئذ — تتذوّق فيه ما كانت السوق تسمّيه سيجاراً جيداً قبل موضة القوّة."},{"name":"Don Diego Aniversario","color":"#B5651D","force":"Medium","wrapper":"Connecticut Shade","vitolas":["Robusto"],"story":"تبغ معتَّق مدّة أطول، وجسم أوفر قليلاً. تنازل العلامة الوحيد لعصرها."}]'
 WHERE `name` = 'Don Diego' AND SHA1(TRIM(`gamme`)) = 'dd5e3f125cfb8d21535bd7cd0d5387c7d46a65d2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Diego' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'dd5e3f125cfb8d21535bd7cd0d5387c7d46a65d2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Duarte' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '596f5f9b7cd51cf1b9cbbbb12ce5536919f8cb92';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Emmanuel' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '26ccc63dfb66d95a973dd844b25b9353ff186411';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Fidel' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '2850a1b1023284b0f293a52526f10c5be29c7d0b';
-- brands|Don Lucas|gamme|ar — contresens sur 1992 de la maison
UPDATE `brands` SET `gamme_ar` = '[{"name":"Classic","color":"#C9A96E","force":"Mild-Medium","wrapper":"كونيتيكت إكوادوري","vitolas":[],"story":"ورقة رابطة وحشوة دومينيكيتان؛ الخطّ اللطيف."},{"name":"AL Series","color":"#3A2A1E","force":"Full","wrapper":"برودليف أمريكي","vitolas":[],"story":"الخطّ القويّ في الدار."},{"name":"20th Anniversary","color":"#6B4226","force":"Medium-Full","wrapper":"دومينيكي خالص","vitolas":[],"story":"سيجار دومينيكي خالص للذكرى — تاريخه لا يتوافق مع عام 1992 الخاص بالدار؛ والبطاقة تذكر ذلك."}]'
 WHERE `name` = 'Don Lucas' AND SHA1(TRIM(`gamme`)) = '1c667901c515f0c5998688362b682cfd020716dc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Lucas' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '1c667901c515f0c5998688362b682cfd020716dc';
-- brands|Don Tomas|gamme|ar — superlatif ajouté; société latin
UPDATE `brands` SET `gamme_ar` = '[{"name":"Don Tomas Clasico","color":"#8B5A2B","force":"Medium","wrapper":"كونيتيكت إكوادوريّ","vitolas":["Robusto","Toro","Churchill","Presidente"],"story":"أوسع السلاسل انتشارًا، وهي حاملة المزيج الذي أُعيد بناؤه في التسعينيات: حشوة كولومبية ودومينيكية وبرازيلية تحت غلاف إكوادوريّ."},{"name":"Don Tomas Sun Grown","color":"#6B4226","force":"Medium-Full","wrapper":"غلاف شمسيّ","vitolas":["Robusto","Toro","Corona"],"story":"الوجه القويّ، وهو أقرب إلى ما كانته العلامة في البداية حين كانت تجمع تالانغا إلى خالابا."},{"name":"Don Tomas Maduro","color":"#3E2723","force":"Medium-Full","wrapper":"مادورو","vitolas":["Robusto","Toro"],"story":"يُلَفّ في HATSA كسائر الإنتاج، تحت غلاف طويل التخمير. ولم يتوقّف مصنع دانلي عن صنع هذه العلامة منذ 1975."}]'
 WHERE `name` = 'Don Tomas' AND SHA1(TRIM(`gamme`)) = '682e07af79c684cff985077a6f2b5a16d01a41d5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Tomas' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '682e07af79c684cff985077a6f2b5a16d01a41d5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Zuarin' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '1815d40fcae330df5069954ba07f4d4062533eb0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dona Flor' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '0f0b0a76f2f350d35441e5faef635a2591c5d8df';
-- brands|Dos Amigos|gamme|ar — سيجارة = cigarette, pas cigare
UPDATE `brands` SET `gamme_ar` = '[{"name":"Paster","color":"#A0522D","force":null,"wrapper":"الإكوادور Rosado","vitolas":[],"story":"غلاف Rosado إكوادوري، ورباط وحشوة من نيكاراغوا (Jalapa وEstelí وOmetepe)، بقياس حلقي 52 في علب من أربعة وعشرين سيجارًا، بحسب موقع الشركة."},{"name":"Sidecar","color":"#A0522D","force":null,"wrapper":"الإكوادور Rosado","vitolas":[],"story":"المزيج نفسه المستخدم في Paster، بقياس حلقي 54 وطول ست بوصات، بحسب موقع الشركة."},{"name":"Paladium","color":"#A0522D","force":"Medium","wrapper":"الإكوادور Rosado","vitolas":[],"story":"شكل double figurado بقياس حلقي 58، يُعتَّق اثني عشر شهرًا بعد اللف؛ وتصفه الشركة بأنه متوسط القوة ومركّب النكهة."},{"name":"Zwoa Spezln","color":"#C9A96E","force":"Medium","wrapper":"الإكوادور","vitolas":[],"story":"إصدار من ميونخ، بغلاف إكوادوري وحشوة viso من Jalapa وEstelí، تصفه الشركة بأنه متوسط الشدة."}]'
 WHERE `name` = 'Dos Amigos' AND SHA1(TRIM(`gamme`)) = 'c83a73545674abafc53ecfaf7d004dd0d5da82d5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dos Amigos' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'c83a73545674abafc53ecfaf7d004dd0d5da82d5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dos Jotas' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '3de15ee0bc9843618f2a9d864d3d5f4a5aea9f04';
-- brands|Dos Santos|gamme|ar — San Andrés et marque en latin
UPDATE `brands` SET `gamme_ar` = '[{"name":"La Regenta — Línea Clásica","color":"#C9A96E","force":"Medium","wrapper":"كونيتيكت فاتح؛ وSan Andrés أو إكوادور في بعض المقاسات","vitolas":["Nº1","Nº3","Nº4","Nº5"],"story":"العلامة التي أعطت مصنع 1921 اسمه. غلاف كونيتيكت فاتح، وحشوة من بذرة كوبية قادمة من الجمهورية الدومينيكية والبرازيل: التبغ الكناري لا يدخل هذا المزيج، وهذا بالذات ما يفصل Dos Santos عن دور لا بالما."},{"name":"La Regenta — Gama 1921","color":"#8B5A2B","force":"Medium","wrapper":"كونيتيكت فاتح، أو مادورو في بعض المقاسات","vitolas":["Half Corona","Robusto","Gran Toro","Maduro Titan"],"story":"الخطّ الحديث، بمقاسات قصيرة غليظة تخلو منها السلسلة الكلاسيكية. ويحمل اسمه بالأرقام سنة مصنع شارع بيروخو."}]'
 WHERE `name` = 'Dos Santos' AND SHA1(TRIM(`gamme`)) = '07633e884b5f58f6173212332d1419385ca60507';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dos Santos' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '07633e884b5f58f6173212332d1419385ca60507';
-- brands|Drew Estate|gamme|ar — nom propre, San Andrés, bottes
UPDATE `brands` SET `gamme_ar` = '[{"name":"ACID Kuba Kuba","color":"#7B1FA2","force":"Medium","story":"تشكيلة منقوعة من الدار؛ وصفحة ACID في drewestate.com (أكتوبر 2026) لا تذكر Kuba Kuba إلا في تعليق صورة ولا تفصّل غلافًا ولا نقعًا. بحسب تجار التجزئة: روبوستو 5 × 54 بوصة (127 مم، قطر 54)، غلاف سومطرة، ورابط وحشوات من نيكاراغوا، منقوع بالأعشاب والنباتات؛ قوة متوسطة بحسب هؤلاء التجار.","vitolas":["Kuba Kuba","Blondie","Dirty Rat","Deep Dish","Krush"],"wrapper":"سومطرة (بحسب التجار)"},{"name":"Liga Privada No.9","color":"#1C0A00","force":"Full","story":"Liga Privada علامة تؤرّخها الدار بعام 2007؛ وتضع صحافة المهنة ظهور No. 9 في العام نفسه، بغلاف كونيتيكت برودليف وخلطة من أربعة بلدان. وتصفه الدار في صفحتها بالإسبريسّو والتراب. أما Flying Pig، وهو بيرفيكتو بطرف مدبّب (3 15/16 × 60 بوصة عام 2018)، فيُصنع أيضًا بإصداري T52 وUndercrown؛ وتذكر صحافة المهنة إنتاجًا عام 2018 محدودًا بـ2 500 علبة من 12 لكل إصدار.","vitolas":["Toro","Robusto","Flying Pig","Petit Lancero","No.9 Perfecto"],"wrapper":"Connecticut Broadleaf"},{"name":"Undercrown","color":"#8B4513","force":"Full","story":"أُطلقت عام 2010 بحسب الدار: كان الطلب على Liga Privada من الارتفاع بحيث طُلب من اللافّين التوقف عن تدخينها، فابتكرت الورشة خلطة جديدة هي اليوم Undercrown Maduro. وتوضح صحافة المهنة (2018) أن هذا السيجار الخاص باللافّين استخدم الرابط والحشوات الخاصة بـLiga Privada. وتسرد الدار Maduro وShade وUC 10 وEl Tigre Dominicano؛ ويتفاوت الغلاف بحسب الإصدار.","vitolas":["Toro","Robusto","Corona Viva","Flying Pig","Shade","Sun Grown"],"wrapper":"تختلف بحسب الإصدار"},{"name":"Herrera Estelí","color":"#8B5A2B","force":"Medium","story":"سيجار Willy Herrera، مزّاج El Titan de Bronze في ميامي الذي استُقدم سنة 2011، أُطلق في مطلع 2013 على وصفة رُكّبت في زيارته الأولى لإستيلي.","vitolas":[],"wrapper":"هابانو إكوادوري"},{"name":"Kentucky Fire Cured","color":"#3A2A1E","force":"Medium-Full","story":"تبغ كنتاكي مجفَّف على دخان الخشب كتبغ الغليون، في سيجار يُلفّ في إستيلي. خطٌّ لا دار.","vitolas":[],"wrapper":"كنتاكي مجفَّف بالنار"},{"name":"Nica Rustica","color":"#3A2A1E","force":"Full","story":"2013 — السيجار الذي يصنعه اللفّافون لأنفسهم، كما تقول الدار: برودليف، خشن، قياس واحد في البداية.","vitolas":[],"wrapper":"برودليف كونيتيكت"},{"name":"Herrera Estelí Norteño","color":"#4A3728","force":"Full","story":"2015 — النسخة القويّة من Herrera Estelí، غلاف San Andrés.","vitolas":[],"wrapper":"San Andrés (المكسيك)"},{"name":"Ambrosia","color":"#C9A96E","force":"Medium","story":"خط مُنقَع: بحسب Corona Cigar Co.، توابل من أوروبا وجنوب شرق آسيا ونبيذ ورم على أنواع تبغ من هندوراس ونيكاراغوا، مع أربعة شهور من النقع ثم تعتيق في خزائن من خشب الأرز بحسب CigarPlace. وفي أكتوبر 2026 تعرض Corona Cigar Co. سبعة إصدارات منه (Kaya وMother Earth وNectar وSpice Torpedo وSpice Triple Corona وVann Reef وClove Tiki) بأغلفة خارجية Connecticut Shade أو Habano أو Sumatra أو Cameroun، وتذكر Cigars Direct أن سيجاريلو Clove Tiki ملفوف يدويًا، ولا يدرجه فهرس Drew Estate على الإنترنت.","vitolas":[],"wrapper":"غير معلن"},{"name":"Blackened","color":"#4A3728","force":null,"story":"تعاون بين Drew Estate وJames Hetfield (Metallica) وRob Dietrich (ويسكي Blackened)، كما تقول الشركة. أما M81، التي صدرت في 18 أكتوبر 2022 بحسب مقال صحفي، فتجمع بين غلاف خارجي San Andrés maduro ورابط Connecticut Broadleaf maduro، بمقاسات Corona وRobusto وToro وCorona Doble؛ وتنتقل S84 Shade to Black، في مطلع 2024 بحسب Corona Cigar Co.، إلى غلاف خارجي Connecticut Shade من الإكوادور، ويعرض drewestate.com هذين الإصدارين في أكتوبر 2026.","vitolas":[],"wrapper":"San Andrés، Connecticut Shade"},{"name":"Chateau Real","color":"#C9A96E","force":null,"story":"أُطلقت في 2006، حين كانت الشركة في بداياتها مع السيجار غير المنقوع، ثم تُركت، ثم أُعلن عن عودتها في 9 نوفمبر 2023 بغلاف Connecticut Shade على رابط وحشوة من نيكاراغوا، لتجار التجزئة عبر الإنترنت في شبكة Drew Diplomat. وأضافت Drew Estate إليها Habano لصالح Cigars International في أغسطس 2024 وMaduro San Andrés لحسابات DDDP لديها في 1 نوفمبر 2024، وكلها ملفوفة في La Gran Fabrica بمقاسات Robusto وToro وChurchill؛ وفي أكتوبر 2026 لا تدرجها صفحة المنتجات في drewestate.com ضمن خطوطها.","vitolas":[],"wrapper":"Connecticut Shade"},{"name":"Factory Smokes","color":"#8B5A2B","force":null,"story":"سيجار يُباع في حُزَم من 20 أو 25: بيان صحفي من الشركة بتاريخ 29 يونيو 2018، وعرض في IPCPR في يوليو 2018، وأربعة إصدارات (Sweet بغلاف Habano وMaduro وShade وSun Grown) على رابط وحشوة من إندونيسيا، ملفوفة في La Gran Fabrica بمقاسات Robusto وToro وChurchill وGordito. وفي أكتوبر 2026 يعرضها drewestate.com مع Maduro وSweet وShade وSun Grown.","vitolas":[],"wrapper":"غير معلن"}]'
 WHERE `name` = 'Drew Estate' AND SHA1(TRIM(`gamme`)) = '665288b7ea1eb3e61396516f96a343212d130ee9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Drew Estate' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '665288b7ea1eb3e61396516f96a343212d130ee9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Drunk Chicken' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '5aafa5e64b019f3f3e91ab29210db3512563cf7e';
-- brands|Dunbarton Tobacco & Trust|gamme|ar — noms propres et sociétés en latin
UPDATE `brands` SET `gamme_ar` = '[{"name":"Sobremesa","color":"#8B5A2B","force":"Medium-Full","wrapper":"هابانو إكوادوري","vitolas":["Robusto","Toro","Corona","Elegante"],"story":"السلسلة الأولى، صدرت عام 2015. غلاف هابانو إكوادوري، ورابط San Andrés مكسيكي، وحشوة نيكاراغوية مكمَّلة بليغيرو من بنسلفانيا — وهو ورق قلّ أن تستعمله الدور."},{"name":"Mi Querida","color":"#4A2C1A","force":"Full","wrapper":"كونيتيكت برودليف","vitolas":["Fino Largo","Triqui Traca"],"story":"غلاف كونيتيكت برودليف داكن فوق قلب نيكاراغوي بالكامل. وهي السلسلة الملفوفة في NACSA بإشراف Raul Disla."},{"name":"Sin Compromiso","color":"#3A2A20","force":"Full","wrapper":"San Andrés Negro","vitolas":["Selección No. 5","Parejo No. 2"],"story":"تُلَفّ في Joya de Nicaragua. غلاف San Andrés Negro يُدعى «Cultivo Tonto»، ورابط من ليغيرو هابانو إكوادوري رفيع، وحشوات نيكاراغوية من مزارع منتقاة واحدة واحدة."},{"name":"Todos Las Dias","color":"#6B4226","force":"Full","wrapper":"نيكاراغوا","vitolas":["Robusto","Toro"],"story":"سيجار الدار النيكاراغوي الخالص — غلافًا ورابطًا وحشوة من بلد واحد — ملفوف في Joya de Nicaragua. والاسم يقول المقصد: سيجار كلّ يوم، بقوّة ليست كذلك."},{"name":"Umbagog","color":"#3A2A1E","force":"Full","wrapper":"برودليف كونيتيكت","vitolas":[],"story":"2017 — أوراق البرودليف الأخشن من أن تصلح لـMi Querida، تُلفّ على حدة وتُباع أرخص؛ باسم بحيرة في نيوهامبشير."},{"name":"Muestra de Saka","color":"#7A2E1E","force":"Medium-Full","wrapper":"غير معلن","vitolas":[],"story":"منذ 2016 — سلسلة تجارب Steve Saka، مزجة في كلّ مرّة، في علب صغيرة."}]'
 WHERE `name` = 'Dunbarton Tobacco & Trust' AND SHA1(TRIM(`gamme`)) = '90e9bd1b67175900a4324347840de6e7c4ee4ad4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dunbarton Tobacco & Trust' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '90e9bd1b67175900a4324347840de6e7c4ee4ad4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'E.P. Carrillo' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'd03eb491af511d3707963ce4a0d047607b79aade';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Galan' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '00883d8a2d6bd874f7cfe2145b81ebde3462c87b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Gaucho' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '31d6bd4d2c635df594872d4c0e47adba837e7e99';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Mago' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '9b782210e7902f57bfd518d69903152c13478e25';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Rey del Mundo' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '0d3161d3f7c8a1550deba1591b276189f744fe01';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Rey del Mundo Honduras' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
-- brands|El Septimo|gamme|ar — سيجارات (لفائف) بدل السيجار
UPDATE `brands` SET `gamme_ar` = '[{"name":"Sacred Arts Collection","color":"#8B1A6B","force":"Medium-Full","wrapper":"كوستاريكي، كما تقول الدار","vitolas":[],"story":"PCA 2021 — سبعة أنواع من السيجار بأسماء فنّانين وأيّام الخلق السبعة."},{"name":"Alexandra Collection","color":"#C9A96E","force":"Medium","wrapper":"كوستاريكي، كما تقول الدار","vitolas":[],"story":"حزيران/يونيو 2019 — خطّان مصمَّمان للنساء، أتبغة معتّقة عشر سنين، كما تقول الدار."}]'
 WHERE `name` = 'El Septimo' AND SHA1(TRIM(`gamme`)) = 'e506f35e01fa9773e1e1dfcc948644983d09d6e8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Septimo' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'e506f35e01fa9773e1e1dfcc948644983d09d6e8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Titan de Bronze' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'f6eef082ee70dbe7a3ed278a0ad0d492d813ae8a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Eladio Diaz' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '3d7d017ce819e654c4a6e949deaf8f401517b702';
-- brands|Emilio Cigars|gamme|ar — أسماء علامات وشركات بحروف لاتينية
UPDATE `brands` SET `gamme_ar` = '[{"name":"AF1 و AF2","color":"#6B4226","force":"Medium-Full","wrapper":"مزائج A.J. Fernández","vitolas":["Robusto","Toro","Torpedo"],"story":"أوّل خطّين، صدرا عام 2011. وأحرف الصانع الأولى في اسم السيجار نفسه: قلّما تُسمّي علامةٌ لافَّها بهذا الوضوح."},{"name":"Grimalkin","color":"#5A5A5A","force":"Medium-Full","wrapper":"مزيج Oveja Negra","vitolas":["Robusto","Toro"],"story":"سيجار نيكاراغويّ خالص من 2011، لُفّ أوّلًا عند My Father، وسُحب عام 2012 باسم Mousa، ثم عاد — ويُصنع منذئذ في Fábrica Oveja Negra."},{"name":"La Musa","color":"#8B7355","force":"Medium","wrapper":"مزيج نيكاراغويّ","vitolas":["Robusto","Toro"],"story":"السلسلة التي وُضع فيها مزيج Grimalkin باسم Mousa بعد سحب 2012."}]'
 WHERE `name` = 'Emilio Cigars' AND SHA1(TRIM(`gamme`)) = 'e893168270dfd1ba6115af142e45794372e9c276';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Emilio Cigars' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'e893168270dfd1ba6115af142e45794372e9c276';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Emperors Cut' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'bee5876a4f40f9b6e9a0726618dda92e8795e9b1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Epic Cigars' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '983b134f1d113e2b1adb3bfd324e5d4b85dd8f92';
-- brands|Espinosa|gamme|ar — معنى نادرة، أسماء لاتينية
UPDATE `brands` SET `gamme_ar` = '[{"name":"Laranja Reserva","color":"#B8663A","force":"Medium-Full","story":"غلاف برازيلي فوق حشوة نيكاراغوية — أحد النجاحات القليلة لورقة باهيا خارج البرازيل. فواكه مجفّفة وفلفل وحموضة تأتي من الغلاف.","vitolas":["Toro"],"wrapper":"غلاف برازيلي"},{"name":"Espinosa Habano","color":"#8B4513","force":"Full","story":"أسلوب الدار بلا التفاف: قويّ، فلفلي، صريح. ملفوف في La Zona، المصنع الذي افتتحه المؤسّس ليكفّ عن الاعتماد على غيره.","vitolas":["Robusto"],"wrapper":"هابانو نيكاراغوي"},{"name":"601","color":"#7A2E1E","force":"Full","story":"الخطّ الذي وُلد في زمن EO Brands، واحتفظ به Erik Espinosa بعد الانفصال عن Eddie Ortega.","vitolas":[],"wrapper":"هابانو إكوادوري"}]'
 WHERE `name` = 'Espinosa' AND SHA1(TRIM(`gamme`)) = '1c2616888b24bf7632a518705a42fd3a9e4aab05';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Espinosa' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '1c2616888b24bf7632a518705a42fd3a9e4aab05';
-- brands|Esteban Carreras|gamme|ar — سيجارات، رأس السيجار
UPDATE `brands` SET `gamme_ar` = '[{"name":"Chupacabra","color":"#4A3728","force":"Full","wrapper":"نيكاراغوي؛ San Andrés للـ10 Años","vitolas":[],"story":"الخطّ الذي صنع السمعة — Natural وMaduro و10 Años، برأس على شكل ذيل الخنزير."},{"name":"Cashmere","color":"#C9A96E","force":"Medium","wrapper":"غير معلن","vitolas":[],"story":"أحد الخطوط الثلاثة عشر؛ تقول الدار إنّ معظمها من السيجار النيكاراغوي الخالص (puro)."}]'
 WHERE `name` = 'Esteban Carreras' AND SHA1(TRIM(`gamme`)) = '7e74c2e8c7a9fd6f8b75970345d5b36e4b45a805';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Esteban Carreras' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '7e74c2e8c7a9fd6f8b75970345d5b36e4b45a805';
-- brands|Excalibur|gamme|ar — liant يعني رباط لا غلاف داخلي
UPDATE `brands` SET `gamme_ar` = '[{"name":"Excalibur No. I","color":"#5C3317","story":"الحجم الكبير في الخط؛ وفي Excalibur Black يبلغ 7¼ × 54 بوصة (الصحافة المتخصصة، أيار/مايو 2021). والخط الأصلي بغلاف Connecticut shade.","wrapper":"Connecticut shade","force":null},{"name":"Excalibur Robusto","color":"#7A4520","story":"Robusto، بقياس 5 × 50 بوصة في خط Black (الصحافة المتخصصة، أيار/مايو 2021)؛ والخط الأصلي بغلاف Connecticut shade.","wrapper":"Connecticut shade","force":null},{"name":"Excalibur Dark Knight","color":"#2C1A0E","story":"غلاف Connecticut Broadleaf maduro (Stogie Review، 2007؛ Cigar Coop، 2012)، لا San Andrés. خرج من مجموعة 1066 سنة 2010 بحسب Cigar Coop، بأربعة أحجام منها Dark Knight I بقياس 5,75 × 54 بوصة.","wrapper":"Connecticut Broadleaf maduro","force":null},{"name":"Excalibur Black","color":"#1F1A17","force":"Medium","wrapper":"Connecticut broadleaf","vitolas":[],"story":"أُطلق في حزيران/يونيو 2021 بمناسبة مرور 40 سنة على العلامة: غلاف Connecticut broadleaf، ورباط Sumatra من الإكوادور، وحشوة هندوراسية ونيكاراغوية، ويُقدَّم على أنه متوسط وأشدّ قوةً من الخلطة الأساسية. Robusto 5 × 50 وToro 6 × 52 وNo. 1 7¼ × 54 بوصة."}]'
 WHERE `name` = 'Excalibur' AND SHA1(TRIM(`gamme`)) = '486fd6b70a10cc540fecceaa2cb52e6a683ccbec';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Excalibur' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '486fd6b70a10cc540fecceaa2cb52e6a683ccbec';
-- brands|Ezra Zion|gamme|ar — سيجارات؛ اسم شخص لاتيني
UPDATE `brands` SET `gamme_ar` = '[{"name":"Jamais Vu","color":"#5B3A29","force":"Medium-Full","wrapper":"نيكاراغوي خالص","vitolas":[],"story":"وُلدت باسم Inception في تموز/يوليو 2012 ثم أُعيدت تسميتها. أحد أنواع السيجار الخالص الثلاثة الأولى."},{"name":"Honor Series","color":"#4A3728","force":"Full","wrapper":"غير معلن","vitolas":[],"story":"سيجار يكرّم أشخاصًا — Reagan أوّلًا، ثم FHK."},{"name":"Tantrum","color":"#7A2E1E","force":"Full","wrapper":"غير معلن","vitolas":[],"story":"الثالث من أنواع السيجار الخالص الأولى."}]'
 WHERE `name` = 'Ezra Zion' AND SHA1(TRIM(`gamme`)) = '4fb1ac5558bf1f0b92a40249226b7d75231bb05f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ezra Zion' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '4fb1ac5558bf1f0b92a40249226b7d75231bb05f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fable Cigars' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'e9b8cfa82c78c3d44be107da8b833d1572ea9399';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fábrica de Tabaco Estrela' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '9e36dc941d3892c084f02734e51a595d2ac1ca98';
-- brands|Ferio Tego|gamme|ar — أسماء عائلات وشركات لاتينية
UPDATE `brands` SET `gamme_ar` = '[{"name":"Timeless — Prestige و Sterling","color":"#8B5A2B","force":"Medium-Full","wrapper":"مزيج Quesada","vitolas":["Robusto","Toro","Corona"],"story":"النصف الدومينيكي من المجموعة، تلفّه عائلة Quesada في Tabacos de Exportación de Licey. وكانت Timeless أصلًا خطًّا لـNat Sherman: المزيج نفسه، بحزامٍ آخر."},{"name":"Timeless — Panamericana و Supreme","color":"#6B4226","force":"Full","wrapper":"مزيج Plasencia","vitolas":["Robusto","Toro"],"story":"النصف الآخر، تلفّه عائلة Plasencia في إستيلي. مجموعة واحدة تحملها عائلتان في بلدين — أمر نادر، والدار لا تخفيه."},{"name":"Metropolitan","color":"#C9A96E","force":"Medium","wrapper":"كونيتيكت أو مادورو بحسب النسخة","vitolas":["Host","Connecticut","Maduro"],"story":"ألّفه آل Quesada في منتصف التسعينيات لـNat Sherman، وما زالوا يصنعونه. وهو أقدم خطوط الكتالوج، وقد جاوز الثلاثين عامًا."}]'
 WHERE `name` = 'Ferio Tego' AND SHA1(TRIM(`gamme`)) = '53b64e80a657a246ee5c29229bd39054843a6a70';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ferio Tego' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '53b64e80a657a246ee5c29229bd39054843a6a70';
-- brands|Finca Tabaquera El Sitio|gamme|ar — bâches، figurado، جزر الكناري
UPDATE `brands` SET `gamme_ar` = '[{"name":"El Sitio Robusto","color":"#8B5A2B","force":"Medium","wrapper":"ورق بالميّ مزروع تحت الأغطية","vitolas":["Robusto"],"story":"السيجار الذي عرّف بالمزرعة: بالميّ بالكامل، بما فيه الغلاف، وهو أمر نادر في جزر الكناري. وهو المقاس الذي ترتضي المزرعة أن تُحاكَم عليه."},{"name":"El Sitio Corona","color":"#A0522D","force":"Medium","wrapper":"ورق بالميّ مزروع تحت الأغطية","vitolas":["Corona","Nº 1"],"story":"المقاسات الطويلة للدار، على التبغ الجزريّ الخالص نفسه. ويأتي الغلاف من الخمسة آلاف متر مربّع المزروعة تحت الأغطية (telones)."},{"name":"El Sitio Pirámides","color":"#6B4226","force":"Medium","wrapper":"ورق بالميّ مزروع تحت الأغطية","vitolas":["Pirámide"],"story":"الـ figurado في الكتالوج. تنتج المزرعة غلافها ورابطها بنفسها، ما يتيح لها أشكالًا قلّ أن تجرؤ عليها الورش الكناريّة."}]'
 WHERE `name` = 'Finca Tabaquera El Sitio' AND SHA1(TRIM(`gamme`)) = '8c006ac6b336565b2d5c23da27dba0d1f35e5570';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Finca Tabaquera El Sitio' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '8c006ac6b336565b2d5c23da27dba0d1f35e5570';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Firecracker' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '5abaf9c3b6a5e033638073b3d373ea3ff4a702d5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Flavoroute' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '5be37f3b5c2fb7d001a89f36af2b4c988ca27453';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Flor de Selva' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '872356a31af624eb520003dbbbe46c1ca60ab78e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Flor del Sol' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '8b581c92293917f9278e3294150f9bdf79eb6774';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fonseca' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '32a3cae0bb39c8d6aff4dda7c5212eecf99e172e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fonseca Nicaraguayen' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Forged Cigar Company' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fortis Cigars' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '0410c751aeb66935383bfd7cc3cb9bbd868cda69';
-- brands|Foundation Cigar Company|gamme|ar — سان أندريس بحروف لاتينية
UPDATE `brands` SET `gamme_ar` = '[{"name":"El Güegüense","color":"#8B4513","force":"Medium","story":"الخلطة التأسيسية لعام 2015، التي تحمل اسم هجائية استعمارية تناقلتها الأفواه قروناً، وكانت تُلفّ حينذاك في مصنع TABSA، وهو اليوم Aganorsa Leaf. وفي آذار/مارس 2024 أعلنت Foundation وقف إنتاج El Güegüense، وكذلك وقف إنتاج Wise Man Maduro السابق، لصالح خلطتين جديدتين، The Wise Man Corojo وMaduro، تُصنعان لدى My Father Cigars. وكانت تقدّم خشبًا وجلدًا ولمسة سكر بنّي، مع تطوّر واضح بين الثلث الأول والأخير.","vitolas":["Corona Gorda","Toro"],"wrapper":"كوروخو 99 من خالابا"},{"name":"Charter Oak","color":"#3B2F2F","force":"Medium","story":"الجذر الشمالي للدار: غلاف كونيتيكت على حشوة نيكاراغوية. داكن، ترابي، بلا مرارة — وموضوع عمداً في نطاق سعري في المتناول.","vitolas":["Robusto"],"wrapper":"Connecticut Broadleaf"},{"name":"The Tabernacle","color":"#3A2A1E","force":"Full","story":"2016 — الخطّ القويّ، غلاف برودليف، لدى A.J. Fernández.","vitolas":[],"wrapper":"برودليف كونيتيكت"},{"name":"Highclere Castle","color":"#C9A96E","force":"Mild-Medium","story":"2017 — قصر داونتون آبي على حزام، كونيتيكت إكوادوري.","vitolas":[],"wrapper":"كونيتيكت إكوادوري"},{"name":"Olmec","color":"#6B4226","force":"Medium-Full","story":"PCA 2022 — تحيّة للمكسيك وأولميكها، غلاف San Andrés، Claro وMaduro.","vitolas":[],"wrapper":"San Andrés (المكسيك)"},{"name":"Aksum","color":"#8B5A2B","force":"Medium-Full","story":"كان سابقًا Metapa، وأُعيدت تسميته في فبراير 2024 لمسألة تتعلق بالعلامة التجارية المسجّلة، بحسب Foundation التي يكتب مؤسسها أن التوليفة تبقى نفسها؛ Claro وMaduro، بحسب Cigar Coop. رابط Connecticut Broadleaf، وحشوة من Estelí وJalapa، وقوة معلنة بين medium وقوية، بمقاسات Robusto 5 x 50 وCorona Gorda 5½ x 48 وToro 6 x 52 وDoble Corona 7 x 54، يُلَفّ لدى A.J. Fernández بحسب Cigar Coop في أبريل 2024.","vitolas":[],"wrapper":"Sumatra من الإكوادور"},{"name":"The Wise Man Maduro","color":"#4A3728","force":"Medium","story":"قُدّم في IPCPR 2017 بوصفه النسخة Maduro من El Güegüense، بغلاف خارجي San Andrés مكسيكي؛ وأُعيد صنعه في 2024 لدى My Father Cigars، بالغلاف نفسه فوق رابط من Estelí وJalapa وحشوة من Estelí وCondega وJalapa. قوة medium بحسب الشركة، بمقاسات Corona 5 x 48 وRobusto 5½ x 50 وToro 6 x 52 وDoble Corona 7 x 54، بواقع عشرين في العلبة.","vitolas":[],"wrapper":"San Andrés (المكسيك)"}]'
 WHERE `name` = 'Foundation Cigar Company' AND SHA1(TRIM(`gamme`)) = 'b235f31e30b1236a9e1ea83459b111942cd43303';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Foundation Cigar Company' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'b235f31e30b1236a9e1ea83459b111942cd43303';
-- brands|Fratello|gamme|ar — Joya de Nicaragua وNASA لاتينية
UPDATE `brands` SET `gamme_ar` = '[{"name":"Fratello Bianco","color":"#C9A96E","force":"Medium","wrapper":"كونيتيكت إكوادوري","vitolas":["Robusto","Toro"],"story":"الوجه الفاتح في الكتالوج، تحت غلاف كونيتيكت إكوادوري. وهي أيسر سلاسل الدار منالًا، وبها دخلت المتاجر."},{"name":"Fratello Oro","color":"#8B5A2B","force":"Medium-Full","wrapper":"ملفوف في Joya de Nicaragua","vitolas":["Robusto","Toro","Corona"],"story":"السلسلة الذهبية، أكثف من «بيانكو». الورشة نفسها وعائلة التبغ نفسها، بتركيبة أوضح."},{"name":"Navetta","color":"#4A2C1A","force":"Full","wrapper":"ملفوف في Joya de Nicaragua","vitolas":["Robusto","Toro"],"story":"«المكوك» بالإيطالية. اسم اختاره مهندس NASA سابق صار يصنع السيجار، وهو الوجه الأقوى في كتالوجه."},{"name":"Fratello Classico","color":"#6B4226","force":"Medium-Full","wrapper":"هابانو نيكاراغوي","vitolas":[],"story":"مزجة البدايات، 2013، باسم Fratello وحده، أُعيدت تسميتها Classico سنة 2018."}]'
 WHERE `name` = 'Fratello' AND SHA1(TRIM(`gamme`)) = 'd47d7859e5497e3b43da83155b254cc13f74bf35';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fratello' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'd47d7859e5497e3b43da83155b254cc13f74bf35';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Freud Cigar Co.' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '215e25c7b056a7dba9cd3f1b752deded4b4a3d15';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Gellis Family Cigars' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'ba2d74759ce2084ab85463c45ad5971b7b174f45';
-- brands|General Cigar|gamme|ar — liant رباط؛ أسماء أشخاص لاتينية
UPDATE `brands` SET `gamme_ar` = '[{"name":"Macanudo Café","color":"#C9A96E","force":"Mild","story":"خط من Macanudo يُلَفّ يدويًا في الجمهورية الدومينيكية (انتهى الإنتاج الجامايكي عام 2000). غلاف Connecticut Shade claro، فاتح ولطيف؛ والرباط مكسيكي بحسب بائع تجزئة، ودومينيكي بحسب آخر. القياسات المسجَّلة لدى بائعي التجزئة: Hyde Park (5 1/2 x 49) وDuke of York (5 1/4 x 54) وDuke of Devon (5 1/2 x 42).","vitolas":["Café","Baron de Rothschild","Hyde Park","Hampton Court","Prince Philip"],"wrapper":"Connecticut Shade"},{"name":"CAO Flathead","color":"#8B4513","force":null,"story":"سلسلة CAO التي تحمل Speed Shop Habano، الصادرة عام 2026، غلافًا من Habano الإكوادور ورباطًا San Andrés مكسيكيًا وحشوة نيكاراغوية ودومينيكية؛ وتُلَفّ في STG Estelí بنيكاراغوا. ثلاثة قياسات: V654 Crankshaft (6 1/2 x 54) وV660 Carb (6 x 60) وV770 Big Block (7 x 70). وتعود Flathead Steel Horse إلى عام 2015، بحسب Cigar Coop.","vitolas":["V660 Carb","V554 Piston","V770 Engine","V507 Spark"],"wrapper":"Habano إكوادوري"},{"name":"Toraño","color":"#8B3A1E","force":"Medium-Full","story":"محفظة عائلة Toraño، اشتُريت في أيلول/سبتمبر 2014 — العلامات فقط؛ توقّفت شركة Toraño Family Cigar، وبقي Charlie Toraño مستشارًا. وتوفّي Carlos Toraño في شباط/فبراير 2022.","vitolas":[],"wrapper":"غير معلن"},{"name":"Odyssey","color":"#8B5A2B","force":null,"story":"علامة bundles منخفضة السعر قدّمتها General Cigar في IPCPR 2016، بلد المنشأ نيكاراغوا، تضم Habano (غلاف خارجي habano نيكاراغوي) وConnecticut (غلاف خارجي Connecticut Shade من هندوراس)؛ ست نسخ في 2025، منها Full (سبتمبر 2021)، تُلَفّ يدويًا في STG Estelí. ومنذ 1 أغسطس 2025 تُسندها STG إلى فريق المبيعات في Forged Cigar Company، دون تغيير في المنتج.","vitolas":[],"wrapper":"غير معلن"}]'
 WHERE `name` = 'General Cigar' AND SHA1(TRIM(`gamme`)) = 'd23f9423df2c9a895930cd73bb384a74a268b931';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'General Cigar' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'd23f9423df2c9a895930cd73bb384a74a268b931';
-- brands|German Engineered Cigars|gamme|ar — حشوة Piloto نيكاراغوية/دومينيكية
UPDATE `brands` SET `gamme_ar` = '[{"name":"RVGN","color":"#A0522D","force":"Medium","wrapper":"هجين (الإكوادور)","vitolas":[],"story":"غلاف هجين من الإكوادور، ورباط دومينيكي من Criollo 98، وحشوة من Piloto Cubano دومينيكي وتبغ نيكاراغوي وتبغ من بنسلفانيا، بحسب Cigar Coop عام 2016؛ يُلَفّ في Intercigar S.A. بتامبوريل."},{"name":"RVGN Extrem","color":"#6B4226","force":"Medium","wrapper":"المكسيك (معتَّق)","vitolas":[],"story":"صدر عام 2026 بمناسبة مرور عشر سنوات على تأسيس الدار؛ غلاف مكسيكي معتَّق، ورباط دومينيكي من Olor de Jacagua، وحشوة من Piloto Cubano وCriollo 98 دومينيكيين ونيكاراغويين؛ يُلَفّ في Intercigar S.A. بتامبوريل."},{"name":"Raumzeit","color":"#C9A96E","force":"Mild-Medium","wrapper":"Connecticut (نيكاراغوا)","vitolas":[],"story":"غلاف Connecticut من نيكاراغوا، ورباط Sumatra إندونيسي، وحشوة نيكاراغوية من خالابا ودومينيكية من Piloto؛ يُلَفّ في Tabacalera Tambor بإستيلي، بحسب Cigar Coop."},{"name":"Weltschmerz","color":"#4A2C1A","force":"Medium","wrapper":"Habano oscuro (الإكوادور)","vitolas":[],"story":"غلاف Habano oscuro من الإكوادور، ورباط من خالابا، وحشوة من إستيلي وخالابا؛ يُلَفّ في Tabacalera Tambor بإستيلي."},{"name":"Kraftwerk","color":"#4A2C1A","force":"Full","wrapper":"غير معلن","vitolas":[],"story":"يُلَفّ في جمهورية الدومينيكان، وهو شديد القوة، بحسب الدار."}]'
 WHERE `name` = 'German Engineered Cigars' AND SHA1(TRIM(`gamme`)) = 'ba8d7d556965938bfe52ef2901e157f94bac801a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'German Engineered Cigars' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'ba8d7d556965938bfe52ef2901e157f94bac801a';
-- brands|Gispert|gamme|ar — سان أندريس بحروف لاتينية
UPDATE `brands` SET `gamme_ar` = '[{"name":"Gispert","color":"#8A5A2B","wrapper":"إكوادور (بذرة كونيتيكت) أو San Andrés مادورو","story":"نسختان، فاتحة ومادورو. حشوة هندوراسية ونيكاراغوية، وقوام خفيف إلى متوسط."}]'
 WHERE `name` = 'Gispert' AND SHA1(TRIM(`gamme`)) = '5ac5665aef8242cb8e9f640e188fcdeabddfea42';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Gispert' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '5ac5665aef8242cb8e9f640e188fcdeabddfea42';
-- brands|God of Fire|gamme|ar — liant رباط لا غلاف داخلي
UPDATE `brands` SET `gamme_ar` = '[{"name":"KKP Never Back Down","color":"#8B5A2B","force":null,"wrapper":"VSW، Château de la Fuente","vitolas":[],"story":"قُدِّم Gran Toro 56 وPiramide 58 في 2024 بمناسبة مرور عشرين عامًا على العلامة، وشُحن Toro Extra 54 في صيف 2025، وأُعلن عن Diademas Selection (54، 56، 60) لعام 2026؛ بغلاف VSW من الطبقة العليا من النبتة على رباط وحشوة دومينيكيَّين، بحسب الدار."},{"name":"KKP Special Reserve","color":"#8B5A2B","force":null,"wrapper":"VSW، Château de la Fuente","vitolas":[],"story":"أُطلقت في 2022 بمناسبة مرور ثلاثين عامًا على Prometheus، بمقاسات Toro Extra 54 وGran Toro 56 وPiramide 58، مع Diademas Selection (54، 56، 60) أُعلن عنها لعام 2026؛ بغلاف VSW من الطبقة السفلى من النبتة على رباط وحشوة دومينيكيَّين، بحسب الدار."},{"name":"Serie B","color":"#4A3728","force":null,"wrapper":"غير معلن","vitolas":[],"story":"غلاف Sun Grown من الإكوادور على Robusto وRobusto Tubo وRobusto Gordo 54، وغلاف Connecticut Broadleaf Maduro على Double Robusto وDouble Robusto Tubo وDiademas 56 وGran Toro، على رباط وحشوة دومينيكيَّين؛ خط بغلاف داكن، بحسب الدار."},{"name":"Serie Aniversario","color":"#A0522D","force":"Medium","wrapper":"الإكوادور","vitolas":[],"story":"Aniversario 54 و56 و60، على رباط وحشوة دومينيكيَّين؛ بجسم متوسط لمقاسَي 54 و56، ومذاق أميل إلى الحلاوة والتوابل لمقاس 60، بحسب الدار."},{"name":"By Don Carlos","color":"#A0522D","force":"Medium","wrapper":"الإكوادور","vitolas":[],"story":"Robusto وRobusto Tubo وRobusto Gordo 54 وToro، على رباط وحشوة دومينيكيَّين؛ بجسم متوسط وطعم حلو وفلفلي بدرجة خفيفة، بحسب الدار."},{"name":"By Carlito","color":"#8B5A2B","force":"Medium-Full","wrapper":"الكاميرون","vitolas":[],"story":"Double Robusto (وفي أنبوب أيضًا) وPiramide وDiademas 56 وChurchill وDouble Corona، على رباط وحشوة دومينيكيَّين؛ بقوة متوسطة إلى قوية، بحسب الدار."}]'
 WHERE `name` = 'God of Fire' AND SHA1(TRIM(`gamme`)) = '5e4d21c71b5a3e3fd79289eae910153c5f1789e6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'God of Fire' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '5e4d21c71b5a3e3fd79289eae910153c5f1789e6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Golden Djawa' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'cad96dddec71adf056492fb65c7a7be098cbe3c8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Gran Habano' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '94d456ab5b5087629b0946c00f953160f945fc37';
-- brands|Graycliff|gamme|ar — nom propre en latin
UPDATE `brands` SET `gamme_ar` = '[{"name":"Graycliff","color":"#6B4226","force":"Medium","wrapper":"إندونيسي","vitolas":[],"story":"مزجة Avelino Lara، 1997 — البرازيل ونيكاراغوا وهندوراس تحت غلاف إندونيسي مصقول بالبيتون."},{"name":"Bahiba","color":"#8B5A2B","force":"Medium-Full","wrapper":"غير معلن","vitolas":[],"story":"اختصارٌ من البهاما وCohiba — أُطلقت في آب/أغسطس 2000، كما يقول المؤسّس."}]'
 WHERE `name` = 'Graycliff' AND SHA1(TRIM(`gamme`)) = 'd2de4349e0e44beedcf7332595fe262f58198bf9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Graycliff' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'd2de4349e0e44beedcf7332595fe262f58198bf9';
-- brands|Great Wall Cigars|gamme|ar — nom propre, accord du nombre
UPDATE `brands` SET `gamme_ar` = '[{"name":"132","color":"#B22222","force":"Medium","wrapper":"صيني","vitolas":[],"story":"السيجار الذي لُفّ لـMao في الستينيات، يدويًّا ومقطوعًا مسبقًا — الاسم الذي يعرفه كلّ هاوٍ صيني."},{"name":"Great Wall","color":"#8B1A1A","force":"Medium-Full","wrapper":"غير معلن","vitolas":[],"story":"الخطوط المُلفوفة يدويًّا في المبنى المنفصل — بذور كوبية من سيتشوان، وأوراق مشتراة من جمهورية الدومينيكان والمكسيك وإندونيسيا. ستة إصدارات جديدة عُرضت في Inter-tabac 2025."}]'
 WHERE `name` = 'Great Wall Cigars' AND SHA1(TRIM(`gamme`)) = '49d3aa1ed4dcceafe22735ce1ff34bad7a8d7bf6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Great Wall Cigars' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '49d3aa1ed4dcceafe22735ce1ff34bad7a8d7bf6';
-- brands|Gurkha|gamme|ar — société en alphabet latin
UPDATE `brands` SET `gamme_ar` = '[{"name":"Gurkha Cellar Reserve","color":"#4A2C1A","force":"Medium-Full","wrapper":"مزيج نيكاراغوي","vitolas":["Robusto","Toro","Churchill"],"story":"السلسلة التي تسند إليها الدار حجّتها في التعتيق. وهي أيضًا التي رسّخت سمعتها بالأسعار المرتفعة، قبل أن تملك مصنعًا بزمن."},{"name":"Gurkha Nicaragua Series","color":"#6B4226","force":"Full","wrapper":"نيكاراغوا","vitolas":["Robusto","Toro"],"story":"السلسلة التي وُلدت بعد شراء American Caribbean Cigars: سيجار نيكاراغوي خالص يُصنع في مصنعها الخاص بإستيلي. وهي تقول تغيّر وضع الدار."},{"name":"Gurkha Heritage","color":"#8B5A2B","force":"Medium","wrapper":"مزيج نيكاراغوي","vitolas":["Robusto","Toro"],"story":"يحيل الاسم إلى رواية 1887 التي تحملها الدار ولا يثبتها شيء. أمّا السيجار فمعاصر، ويخرج من إستيلي."}]'
 WHERE `name` = 'Gurkha' AND SHA1(TRIM(`gamme`)) = 'df5bc88a9e47416da715146a3f0bfbca277f19fb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Gurkha' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'df5bc88a9e47416da715146a3f0bfbca277f19fb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'H. Upmann' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'b12972ef64032d059f55af95d2898ba9b56e3225';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'H. Upmann Dominicain' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
-- brands|H.R.|gamme|ar — nuancée mal rendu
UPDATE `brands` SET `gamme_ar` = '[{"name":"HR White","color":"#C9A96E","force":"Mild","wrapper":"غير معلن","vitolas":[],"story":"من خطوط الإطلاق عام 2014، خفيفة ومتدرّجة النكهات، بحسب House of Grauer."},{"name":"HR Signature","color":"#A0522D","force":"Medium","wrapper":"Colorado (الإكوادور)","vitolas":[],"story":"من خطوط الإطلاق عام 2014، بقوة medium، بحسب House of Grauer؛ غلاف colorado داكن من الإكوادور، ورباط وحشوة من نيكاراغوا، ملفوفة يدويًا بالكامل في La Corona، بحسب Cigarworld.de."},{"name":"HR Blue","color":"#4A3728","force":"Full","wrapper":"غير معلن","vitolas":[],"story":"من خطوط الإطلاق عام 2014، ممتلئة القوام وقوية المذاق، بحسب House of Grauer."},{"name":"HR Black","color":"#6B4226","force":null,"wrapper":"Habano (الإكوادور)","vitolas":[],"story":"أُضيفت مع عودة 2024؛ غلاف Habano من الإكوادور فوق رباط وحشوة من نيكاراغوا، تُلَفّ في La Corona، بحسب Dojoverse."}]'
 WHERE `name` = 'H.R.' AND SHA1(TRIM(`gamme`)) = 'f5c8a95d4671538d4938d064fb1ad084524b5a27';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'H.R.' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'f5c8a95d4671538d4938d064fb1ad084524b5a27';
-- brands|Helvada|gamme|ar — bague=شريط ; سيجارات
UPDATE `brands` SET `gamme_ar` = '[{"name":"Helvada","color":"#A0522D","force":"Mild","story":"51، بمقاس Gran Robusto: غلاف Habano maduro من الإكوادور، ورباط من خالابا، وحشوة من كونديغا وligero دومينيكي، بحسب الدار؛ ومتوفر أيضًا بمقاسات 70 Gordo، و02 Salomones، و04 Salomones Oscuro، و91 Gigante، بحسب Fumar.ch. وتصنّف Cigarworld.de المقاسات 51 و70 و04 و91 على أنها «totalmente a mano»، من نوع longfiller؛ ولا تقول الدار كيف يُلَفّ الخط، ويقرأ أحد قرّاء Cigarworld.de في أغسطس 2020 شريط Hecho a mano في 51 على أنه حشوة مصنوعة آليًا تحت غلاف ملفوف يدويًا، من دون أن يكون متأكدًا من ذلك.","vitolas":[],"wrapper":"غير معلن"},{"name":"Helvada Dark Line","color":"#4A3728","force":null,"story":"خط ضمن الكتالوج، بحسب Zigarren-online.ch؛ وتعرض الدار في 2026 ثلاث سلاسل، Brain وHeart وSkull، بمقاسات Gordo أو Robusto أو Torpedo، من دون أن تقول كيف تُلَفّ. وتصنّف Cigarworld.de سلاسل Brain وSkull وHearth على أنها «totalmente a mano»، من نوع longfiller، وتقول إنّ سيجار longfiller في سلسلة Hearth يُلَفّ في إستيلي.","vitolas":[],"wrapper":"غير معلن"},{"name":"Medio Filler Medio Tiempo","color":"#6B4226","force":null,"story":"Short Robusto 4 x 50، غلاف إندونيسي، ورباط وحشوة نيكاراغويان، في كتالوج Cigarworld.de منذ 24 مارس 2025، الذي يصنّفها على أنها «totalmente a mano (mediumfiller)»، أي مصنوعة يدويًا بحشوة ممزّقة. Medio Tiempo هو اسم الـvitola: لا تصف الصفحة تبغ الحشوة.","vitolas":[],"wrapper":"إندونيسيا"}]'
 WHERE `name` = 'Helvada' AND SHA1(TRIM(`gamme`)) = '8243c46d55150dfd56989a9a91715daf53774882';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Helvada' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '8243c46d55150dfd56989a9a91715daf53774882';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Hemmys' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '5bc36be800c6c53348687df234fe065fbba9484c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Henry Clay' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Herr Lehmann' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'caf27b5638e176c59261d32bc3c75efedbb33b2c';
-- brands|Hiram & Solomon|gamme|ar — nom de personne en latin
UPDATE `brands` SET `gamme_ar` = '[{"name":"Master Mason","color":"#4A3728","force":"Full","wrapper":"غير معلن","vitolas":[],"story":"درجة المعلّم — الخطّ الرئيسي، يُلفّ لدى PDR منذ 2022."},{"name":"Entered Apprentice","color":"#C9A96E","force":"Medium","wrapper":"غير معلن","vitolas":[],"story":"المتدرّب الداخل — تبغ باراغوياني في المزجة."},{"name":"Curamus","color":"#7A2E1E","force":"Medium-Full","wrapper":"غير معلن","vitolas":[],"story":"شباط/فبراير 2021 — أوّل سيجار رُكّب مع Abe Flores."}]'
 WHERE `name` = 'Hiram & Solomon' AND SHA1(TRIM(`gamme`)) = '46dc649869548476b849c4e6c69ae16a2641c1a3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Hiram & Solomon' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '46dc649869548476b849c4e6c69ae16a2641c1a3';
-- brands|Holt's Cigar Company|gamme|ar — سيجارة/سيجارات pour cigare
UPDATE `brands` SET `gamme_ar` = '[{"name":"All In!","color":"#C9A96E","force":"Mild","story":"غلاف Connecticut Shade فوق تبوغ دومينيكية في Cuban sandwich تمزج longfiller وshortfiller بحسب رأي لموظفي Holt''s في أبريل 2025، بقوة خفيفة بحسب Holt''s التي تقول إنها مصنوعة يدويًا في جمهورية الدومينيكان؛ ثلاثة مقاسات مستوحاة أسماؤها من البوكر، في bundles من عشرين سيجارًا: The Flop (5 x 50) وThe River (7 x 50) وThe Turn (6 x 50)؛ في كتالوج Holt''s في أكتوبر 2026.","vitolas":[],"wrapper":"Connecticut Shade"},{"name":"Amante","color":"#A0522D","force":"Mild-Medium","story":"غلاف Sun Grown من الإكوادور فوق longfiller من تبوغ دومينيكية، بقوة من خفيفة إلى متوسطة بحسب Holt''s التي تقول إنها ممزوجة ومصنوعة يدويًا في جمهورية الدومينيكان على أيدي لفّافين حرفيين؛ مقاس واحد فقط هو Toro 6 x 50، في bundle من عشرين سيجارًا؛ في كتالوج Holt''s في أكتوبر 2026، نافد.","vitolas":[],"wrapper":"Sun Grown (الإكوادور)"},{"name":"Angry Elf","color":"#C9A96E","force":"Mild","story":"غلاف Candela فوق longfiller من تبوغ دومينيكية ونيكاراغوية، بقوة خفيفة بحسب Holt''s، التي تذكر جمهورية الدومينيكان بلدًا وتصف العلامة بأنها مصنوعة يدويًا، longfiller بالكامل، في رأي لموظفيها في مارس 2023؛ في bundles من عشرين سيجارًا: Churchill (7 x 50) وRobusto (5 x 50) وToro (6 x 50)؛ وللعلامة أيضًا نسخ Connecticut وMaduro وSun Grown، وتُوصف الأخيرة بأنها مصنوعة يدويًا في رأي للموظفين في نوفمبر 2023، وبقوة متوسطة بحسب الصفحة؛ في كتالوج Holt''s في أكتوبر 2026، نافد.","vitolas":[],"wrapper":"Candela"},{"name":"Argyle Cigars","color":"#C9A96E","force":"Mild","story":"مصنوعة يدويًا في جمهورية الدومينيكان بحسب Holt''s، غلاف Connecticut Shade فوق longfiller من تبوغ دومينيكية، بقوة خفيفة، في علب من خشب الأرز من عشرين سيجارًا، في سبعة مقاسات من Corona (5½ x 46) إلى Mayor (8 x 54)؛ وتحيل الصفحة أيضًا إلى Argyle Maduro وDark Corojo وConundrum وWhite Glove؛ في كتالوج Holt''s في أكتوبر 2026، ستة مقاسات من أصل سبعة متوافرة.","vitolas":[],"wrapper":"Connecticut Shade"},{"name":"Babalu","color":"#8B5A2B","force":"Medium","story":"غلاف Sun Grown بلون خبز الزنجبيل فوق longfiller من تبوغ دومينيكية ونيكاراغوية، بقوة متوسطة بحسب Holt''s التي تقول إنها مصنوعة يدويًا في جمهورية الدومينيكان، في bundles من عشرين سيجارًا بأربعة مقاسات: Churchill (7 x 50) وGordo (6 x 60) وRobusto (5 x 50) وToro (6 x 50)؛ في كتالوج Holt''s في أكتوبر 2026، نافد.","vitolas":[],"wrapper":"Sun Grown"},{"name":"Bella Cuba","color":"#A0522D","force":"Medium","story":"غلاف Sumatra فوق حشوة من تبوغ دومينيكية في Cuban sandwich، بقوة متوسطة بحسب Holt''s، ومنها رأي لموظفيها عن نسخة Connecticut (5 أغسطس 2021، وحُدّث في 30 سبتمبر 2025) يقول إنّ سيجار Bella Cuba مصنوع يدويًا في جمهورية الدومينيكان، وتصفه صفحة Sumatra بأنه ذو صناعة دومينيكية؛ في bundles من عشرين سيجارًا بأربعة مقاسات: Churchill (7 x 50) وMedia Noche (6½ x 46) وRobusto (5 x 50) وToro (6½ x 52)؛ في كتالوج Holt''s في أكتوبر 2026، نافد.","vitolas":[],"wrapper":"Sumatra"},{"name":"Belleza","color":"#8B5A2B","force":"Mild-Medium","story":"غلاف Sun Grown بلون خبز الزنجبيل فوق longfiller دومينيكي معتّق، بقوة من خفيفة إلى متوسطة بحسب Holt''s التي تقول إنها مصنوعة يدويًا في جمهورية الدومينيكان على أيدي حرفيين؛ مقاس واحد فقط هو Toro 6 x 50، في bundle من عشرين سيجارًا؛ في كتالوج Holt''s في أكتوبر 2026، نافد.","vitolas":[],"wrapper":"Sun Grown"},{"name":"Benchmade","color":"#8B5A2B","force":"Medium","story":"ثلاثة أغلفة للاختيار هي Natural وMaduro وSun Grown، فوق longfiller من تبوغ دومينيكية وهندوراسية ونيكاراغوية، بقوة متوسطة بحسب Holt''s التي تقول إنها تُلَفّ في إستيلي بنيكاراغوا في مصنع لا تسمّيه، في bundles من عشرين سيجارًا بخمسة مقاسات: Churchill وGordo وRobusto وToro وTorpedo؛ في كتالوج Holt''s في أكتوبر 2026، نافد.","vitolas":[],"wrapper":"Natural، Maduro أو Sun Grown"},{"name":"Blenders Clearing House","color":"#8B5A2B","force":"Mild-Medium","story":"غلاف Connecticut (Natural) أو Habano (Maduro) من الإكوادور فوق longfiller من تبوغ دومينيكية ونيكاراغوية، بقوة من خفيفة إلى متوسطة بحسب Holt''s التي تقول إنها مصنوعة يدويًا في جمهورية الدومينيكان، في bundles من عشرين سيجارًا بستة مقاسات، من Robusto (5 x 50) إلى President (8 x 54)، لكل منها غلافان؛ في كتالوج Holt''s في أكتوبر 2026، نافد.","vitolas":[],"wrapper":"الإكوادور: Connecticut، Habano"},{"name":"Boardwalk","color":"#6B4226","force":"Medium","story":"غلاف برازيلي فوق حشوة من تبوغ دومينيكية ونيكاراغوية في Cuban sandwich، بقوة متوسطة بحسب Holt''s التي تقول إنها مصنوعة يدويًا في جمهورية الدومينيكان، في bundles من عشرين سيجارًا بمقاسين هما Robusto (5 x 50) وToro (6 x 50)؛ في كتالوج Holt''s في أكتوبر 2026، نافد.","vitolas":[],"wrapper":"البرازيل"},{"name":"Casa Royale","color":"#C9A96E","force":"Mild-Medium","story":"غلاف Connecticut Shade فوق longfiller من تبوغ دومينيكية ونيكاراغوية، بقوة من خفيفة إلى متوسطة بحسب Holt''s التي تقول إنها مصنوعة يدويًا في جمهورية الدومينيكان، في علب من عشرين سيجارًا بأربعة مقاسات: Churchill (7 x 50) وImperial (6 x 50) وKing (6 x 60) وRobusto (5 x 50)؛ في كتالوج Holt''s في أكتوبر 2026، نافد.","vitolas":[],"wrapper":"Connecticut Shade"},{"name":"Castano","color":"#A0522D","force":"Medium","story":"غلاف Sun Grown بلون القرفة فوق longfiller، بقوة متوسطة بحسب Holt''s التي تقول إنها مصنوعة يدويًا في جمهورية الدومينيكان؛ مقاس واحد فقط هو Churchill 7 x 50، في bundle من عشرين سيجارًا؛ في كتالوج Holt''s في أكتوبر 2026، نافد.","vitolas":[],"wrapper":"Sun Grown"},{"name":"Cortesia","color":"#A0522D","force":"Medium","story":"غلاف Sumatra بني زيتي فوق longfiller معتّق، بقوة متوسطة بحسب Holt''s التي تقول إنها مصنوعة يدويًا في جمهورية الدومينيكان؛ مقاس واحد فقط هو Churchill 7 x 50، في bundle من عشرين سيجارًا؛ في كتالوج Holt''s في أكتوبر 2026، نافد.","vitolas":[],"wrapper":"Sumatra"},{"name":"Fine Catch","color":"#8B5A2B","force":"Mild","story":"غلاف Connecticut (Natural) أو Habano (Maduro) من الإكوادور فوق خلطة من longfiller دومينيكي يُوصف بأنه vintage، بقوة خفيفة بحسب Holt''s التي تقول إنها مصنوعة يدويًا في جمهورية الدومينيكان، في bundles من عشرين سيجارًا بخمسة مقاسات مستوحاة أسماؤها من الأسماك: Trout (5 x 50) وBass (6 x 50) وMarlin (6½ x 52) وPike (7 x 50) وGrouper (5½ x 60)، لكل منها غلافان؛ في كتالوج Holt''s في أكتوبر 2026، نافد.","vitolas":[],"wrapper":"الإكوادور: Connecticut، Habano"},{"name":"Rainmaker","color":"#C9A96E","force":"Mild","story":"غلاف Connecticut من الإكوادور فوق حشوة من تبوغ دومينيكية في Cuban sandwich، بقوة خفيفة بحسب Holt''s التي تقول إنها مصنوعة يدويًا في جمهورية الدومينيكان على أيدي حرفيين؛ مقاس واحد فقط هو Toro 6 x 50، في bundle من عشرين سيجارًا؛ في كتالوج Holt''s في أكتوبر 2026، نافد.","vitolas":[],"wrapper":"Connecticut (الإكوادور)"},{"name":"Royal Symbols","color":"#A0522D","force":"Medium","story":"غلاف Habano من الإكوادور فوق longfiller من تبوغ دومينيكية توصف بأنها vintage، بقوة متوسطة بحسب Holt''s التي تقول إنها مصنوعة يدويًا في جمهورية الدومينيكان على أيدي حرفيين؛ مقاس واحد فقط هو Churchill 7 x 50، في bundle من عشرين سيجارًا؛ في كتالوج Holt''s في أكتوبر 2026، نافد.","vitolas":[],"wrapper":"Habano (الإكوادور)"},{"name":"Savoy","color":"#C9A96E","force":"Medium","story":"غلاف Connecticut Shade أشقر داكن فوق longfiller من تبوغ دومينيكية، بقوة متوسطة بحسب Holt''s التي تقول إنها مصنوعة يدويًا في جمهورية الدومينيكان على أيدي لفّافين حرفيين، في bundles من عشرين سيجارًا بخمسة مقاسات: Churchill (7 x 50) وGordo (6 x 60) وRobusto (5 x 50) وToro (6 x 50) وTorpedo (6½ x 52)؛ في كتالوج Holt''s في أكتوبر 2026، نافد.","vitolas":[],"wrapper":"Connecticut Shade"},{"name":"Top Hat","color":"#C9A96E","force":"Mild-Medium","story":"غلاف Connecticut Shade أشقر داكن فوق حشوة من تبوغ في Cuban sandwich، بقوة من خفيفة إلى متوسطة بحسب Holt''s التي تقول إنها مصنوعة يدويًا في جمهورية الدومينيكان، في bundles من عشرين سيجارًا بمقاسين هما Ritz (6 x 50) وWaldorf (7 x 50)؛ في كتالوج Holt''s في أكتوبر 2026، نافد.","vitolas":[],"wrapper":"Connecticut Shade"},{"name":"Utopia","color":"#A0522D","force":"Medium","story":"غلاف Habano من الإكوادور فوق longfiller من تبوغ دومينيكية توصف بأنها vintage، بقوة متوسطة بحسب Holt''s التي تقول إنها مصنوعة يدويًا في جمهورية الدومينيكان على أيدي حرفيين في مصنع بوتيك؛ مقاس واحد فقط هو Churchill 7 x 50، في bundle من عشرين سيجارًا؛ في كتالوج Holt''s في أكتوبر 2026، نافد.","vitolas":[],"wrapper":"Habano (الإكوادور)"},{"name":"Viking Village","color":"#C9A96E","force":"Medium","story":"غلاف Connecticut Shade بني فاتح فوق حشوة من تبوغ دومينيكية، بقوة متوسطة بحسب Holt''s التي تقول إنها مصنوعة يدويًا في جمهورية الدومينيكان، في bundles من عشرين سيجارًا بمقاسين هما Berserker (6 x 50) وThor (5 x 50)؛ في كتالوج Holt''s في أكتوبر 2026، نافد.","vitolas":[],"wrapper":"Connecticut Shade"}]'
 WHERE `name` = 'Holt''s Cigar Company' AND SHA1(TRIM(`gamme`)) = 'f63fe69d31944a5a1cd6167025c1d80fba267722';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Holt''s Cigar Company' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'f63fe69d31944a5a1cd6167025c1d80fba267722';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Horacio' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '905aae3cee0f297a5eb9999531b67ef7471d3f8d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Hoyo de Monterrey' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'a2015aef3c1dc4943ecc18d4da54622cefa6ea58';
-- brands|Hoyo de Monterrey Honduras|gamme|ar — chaîne interdite، comparatif
UPDATE `brands` SET `gamme_ar` = '[{"name":"Hoyo de Monterrey Honduras","color":"#6B4226","force":"Full","wrapper":"Habano","vitolas":["Robusto","Toro"],"story":"النقيض التامّ للهافانا ذات الاسم نفسه: حيث يزرع الكوبي الخفّة، بنى الهندوراسي سمعته على القوّة. تراب وفلفل وجلد."},{"name":"Excalibur","color":"#C9A227","force":"Medium","wrapper":"Connecticut Shade","vitolas":["Churchill"],"story":"السلسلة التي تجاوزت دارها: كثيرون يحسبونها علامة مستقلة. غلاف فاتح، ومزاج أشدّ تحفّظًا، وانتظام تصنيع لافت عند هذه الكميات."}]'
 WHERE `name` = 'Hoyo de Monterrey Honduras' AND SHA1(TRIM(`gamme`)) = 'f655166f297d88daaf14030fd189b271219c8ef7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Hoyo de Monterrey Honduras' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'f655166f297d88daaf14030fd189b271219c8ef7';
-- brands|HVC Cigars|gamme|ar — marques latines, superlatif, bague
UPDATE `brands` SET `gamme_ar` = '[{"name":"Serie A","color":"#8B5A2B","force":"Medium-Full","wrapper":"نيكاراغوا (Aganorsa)","vitolas":["Perlas","Robusto","Toro"],"story":"تُمزَج حصرًا من ورق نيكاراغوي من الفئة أ تزرعه Aganorsa. والحرف ليس زخرفًا: إنّه تصنيف الورقة."},{"name":"Pan Caliente","color":"#A0522D","force":"Medium-Full","wrapper":"نيكاراغوا (Aganorsa)","vitolas":["Robusto","Toro"],"story":"«الخبز الساخن» — التعبير الكوبي لما يُباع فور وضعه. وهي السلسلة التي تتصدّر مبيعات الدار، وكان الاسم رهانًا على نفسه."},{"name":"Hot Cake","color":"#6B4226","force":"Full","wrapper":"نيكاراغوا (Aganorsa)","vitolas":["Robusto","Toro"],"story":"تكملة Pan Caliente، وتترجم اسمها إلى الإنجليزية. تبغ Aganorsa نفسه، بمزاج أقوى."},{"name":"La Rosa 520","color":"#7A2E1E","force":"Medium-Full","wrapper":"غير معلن","vitolas":[],"story":"2015 — العنوان القديم للمؤسّس في هافانا؛ احتُفل بعشر سنوات في PCA 2025."},{"name":"San Isidro","color":"#8B5A2B","force":"Medium","wrapper":"غير معلن","vitolas":[],"story":"حيٌّ في هافانا، على شريط."},{"name":"Cerro","color":"#4A3728","force":"Medium-Full","wrapper":"غير معلن","vitolas":[],"story":"الحيّ الذي وُلد فيه المؤسّس ونشأ."}]'
 WHERE `name` = 'HVC Cigars' AND SHA1(TRIM(`gamme`)) = 'f023431637f55d866b9213347eecc39f5d873a53';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'HVC Cigars' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'f023431637f55d866b9213347eecc39f5d873a53';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ibis' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '19c22d15858665a25480876602ee9ae42b124a82';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'IGM Cigars' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '6f61d62813f2730793c2be971fdc318d09948bf0';
-- brands|Illusione|gamme|ar — nom propre latin, chaîne interdite
UPDATE `brands` SET `gamme_ar` = '[{"name":"Epernay","color":"#C2B280","force":"Medium","wrapper":"كوروخو خالابا","vitolas":["Corona","Robusto"],"story":"الوجه القشدي للدار، مسمّى على اسم مدينة الشمبانيا. خبز محمّص وزبدة وقشّ — سيجار منتصف النهار، تجعله نحافته أطول في الفم مما يوحي به حجمه."},{"name":"Illusione Original Documents","color":"#8B7355","force":"Full","wrapper":"Corojo 99","vitolas":["Lancero"],"story":"المقاس النحيل الذي دافعت عنه العلامة بينما كانت السوق كلّها تزداد سماكة. جافّ، فلفلي، بلا مساومة: برهان على أن النحافة تركّز ولا تخفّف."},{"name":"Cruzado","color":"#8B5A2B","force":"Medium-Full","wrapper":"غير معلن","vitolas":[],"story":"2007 — العلامة الثانية لـDion Giolito، على أتبغة Aganorsa."},{"name":"Rothchildes","color":"#4A3728","force":"Medium-Full","wrapper":"San Andrés (المكسيك)","vitolas":[],"story":"2013 — قياس قصير واحد، غلاف San Andrés، ثمن معتدل."},{"name":"Fume d''Amour","color":"#C9A96E","force":"Medium","wrapper":"غير معلن","vitolas":[],"story":"2015 — فيتولات بأسماء أماكن نيكاراغوية."},{"name":"OneOff","color":"#3E4A6B","force":"Medium","wrapper":"غير معلن","vitolas":[],"story":"علامة إيطالية من الألفينيات، اشترتها Illusione سنة 2018 وتُلفّ لدى Aganorsa."},{"name":"Garagiste","color":"#6B4226","force":"Full","wrapper":"غير معلن","vitolas":[],"story":"2019 — كلمة صغار الكرّامين، لسيجار قويّ."}]'
 WHERE `name` = 'Illusione' AND SHA1(TRIM(`gamme`)) = '2d0fcc91c12531f3799a386a9140307a0a949448';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Illusione' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '2d0fcc91c12531f3799a386a9140307a0a949448';
-- brands|J. Fuego|gamme|ar — nom de marque en latin
UPDATE `brands` SET `gamme_ar` = '[{"name":"Gran Reserva Corojo No.1","color":"#7A2E1E","force":"Medium-Full","story":"أوّل سيجار للدار، سنة 2006 — وبرنامجها: الكوروخو في قلب كلّ شيء.","vitolas":[],"wrapper":"كوروخو"},{"name":"Origen","color":"#8B4A2B","force":"Medium-Full","story":"سيجار كوروخو خالص، ورقة عائلة Fuego.","vitolas":[],"wrapper":"كوروخو"},{"name":"777","color":"#4A3728","force":"Full","story":"علامة لـJ. Fuego.","vitolas":[],"wrapper":"غير معلن"},{"name":"Sangre de Toro","color":"#6B1F1F","force":"Full","story":"أحدث خطوط الكوروخو.","vitolas":[],"wrapper":"كوروخو"}]'
 WHERE `name` = 'J. Fuego' AND SHA1(TRIM(`gamme`)) = '32ce60a20df14376cea4f8fb95141537a55a5fed';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'J. Fuego' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '32ce60a20df14376cea4f8fb95141537a55a5fed';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'J.C. Newman' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '38cff159ecc7c386cd0bce09064bdb04d2c6bccc';
-- brands|Jake Wyatt Cigar Co.|gamme|ar — sous-cape et tripe mal rendues
UPDATE `brands` SET `gamme_ar` = '[{"name":"Appendix II","color":"#4A3728","force":"Medium-Full","wrapper":"غير معلن","vitolas":[],"story":"خطّ من مجموعة Connoisseur، يُقدَّم أيضًا بشكل figurado."},{"name":"Titan Series","color":"#6B4226","force":"Medium","wrapper":"غير معلن","vitolas":[],"story":"Goliad وColossus وOmega — ثلاثة سيجارات يومية، 2026، رابط وحشوة من هندوراس ونيكاراغوا."}]'
 WHERE `name` = 'Jake Wyatt Cigar Co.' AND SHA1(TRIM(`gamme`)) = 'a2d29e73e7970d57d3ac6983da7727fcb03c72ce';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Jake Wyatt Cigar Co.' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'a2d29e73e7970d57d3ac6983da7727fcb03c72ce';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'JAMM Cigar' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '0f911450c1c198748d2adb44b672192602937324';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Jas Sum Kral' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'fcd4512ee2ca4e2269121f1676ea1ac1caf6b54d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'José L. Piedra' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '4f7779245e2f982151da519609ee67c212450267';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Joya de Nicaragua' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'a560061c37c6dc630e946459c1a3a0f46c2e5b5b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Joyas de Panamá' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '1904cb682f670b6bc83c2e1f082fb871119e406d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Juan Clemente' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '05b4a179c97e0f2d2f5ffd036d208d6a227be729';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Juan López' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'b066d6a0f094a511f287ae79e1544f829fef064c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Kafie 1901' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '4628ce2e97e365a1adf9b608f492b807d3bb095e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Karen Berger Cigars' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '1e0bf43357ba26c05166f879db6c2257caf4aa3f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Kelner Boutique Factory' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'dce081f0817656789303b477d659bb7987172184';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Kinix' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '257bebadda2b3ff3fad2052c2227cc6d1d05d118';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Kolumbus' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '6e263cf90c5d8a3a0e9f312595673a2fadaba874';
-- brands|Kristoff|gamme|ar — nom propre latin, terme interdit
UPDATE `brands` SET `gamme_ar` = '[{"name":"Kristoff Sumatra","color":"#8B5A2B","force":"Medium","wrapper":"سومطرة","vitolas":["Robusto","Torpedo","Churchill"],"story":"من أولى سلاسل الدار. غلاف سومطري فوق مزيج مستقًى من بلدان عدّة — وهو مبدأ العلامة منذ البداية."},{"name":"Kristoff San Andrés","color":"#3A2A20","force":"Full","wrapper":"San Andrés المكسيكي","vitolas":["Robusto","Toro"],"story":"الوجه الأقوى، تحت غلاف مكسيكي. وهي السلسلة التي وسّعت جمهور العلامة بما يفوق سائر السلاسل."},{"name":"Kristoff Nicaragua","color":"#6B4226","force":"Medium-Full","wrapper":"نيكاراغوا","vitolas":["Robusto","Toro"],"story":"سلسلة نيكاراغوية تُصنع في مصنع دومينيكي: تمزج العلامة من حيث تشاء، ولا تخفي ذلك."},{"name":"685 Woodlawn","color":"#4A2C1A","force":"Medium","wrapper":"مزيج متعدّد المنشأ","vitolas":["Robusto","Toro"],"story":"الاسم عنوان — عنوان بيت طفولة Glen Case. وهي من السلاسل القليلة في العلامة التي تحمل إشارة شخصية."}]'
 WHERE `name` = 'Kristoff' AND SHA1(TRIM(`gamme`)) = '47edd1b2786394cb014d31febdc4f4704fd27365';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Kristoff' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '47edd1b2786394cb014d31febdc4f4704fd27365';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'L''Atelier' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '44c80bed4479c91e604591c7df4985f89b7254a6';
-- brands|La Aroma de Cuba|gamme|ar — noms latins, terme interdit
UPDATE `brands` SET `gamme_ar` = '[{"name":"La Aroma de Cuba","color":"#4A2C1A","force":"Medium-Full","wrapper":"Connecticut Broadleaf","vitolas":["Robusto","Churchill","Belicoso"],"story":"المزيج الذي أعاد Pepin García تركيبه عام 2009: غلاف Connecticut Broadleaf، وكلّ ما عداه نيكاراغوي. هي النسخة التي رسّخت العلامة، وهي المتوافرة اليوم."},{"name":"Mi Amor","color":"#3A2A20","force":"Full","wrapper":"San Andrés المكسيكي","vitolas":["Belicoso","Robusto","Magnifico"],"story":"الفرع الأقوى، تحت غلاف San Andrés مكسيكي. وله Reserva خاصّة به أشدّ كثافة — وهو ما جعل La Aroma de Cuba تتجاوز سلسلة واحدة."}]'
 WHERE `name` = 'La Aroma de Cuba' AND SHA1(TRIM(`gamme`)) = '1d669659cf821f188797d30afd525e5ba7773a46';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Aroma de Cuba' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '1d669659cf821f188797d30afd525e5ba7773a46';
-- brands|La Aurora|gamme|ar — marque et personne en latin
UPDATE `brands` SET `gamme_ar` = '[{"name":"1903 Preferidos","color":"#8B4513","force":"Medium","story":"السلسلة التي تحمل سنة التأسيس، والغلاف الكاميروني الذي هو توقيع الدار: خشب متبَّل وبندق محمّص وجلد فاتح. «فيغورادو»، وهو شكل تلفّه La Aurora منذ زمن بعيد.","vitolas":["Figurado"],"wrapper":"كاميرون"},{"name":"107","color":"#A0522D","force":"Medium","story":"سلسلة تذكارية صارت دائمة. أحدث طابعًا من «1903» وأشدّ استدارة، ومصمَّمة لمن يكتشف الدار حديثًا.","vitolas":["Robusto"],"wrapper":"هابانو إكوادوري"},{"name":"León Jimenes","color":"#8B5A2B","force":"Mild-Medium","story":"اسم المؤسّس، Eduardo León Jimenes، على خطّ من خطوط الدار.","vitolas":[],"wrapper":"كونيتيكت إكوادوري"}]'
 WHERE `name` = 'La Aurora' AND SHA1(TRIM(`gamme`)) = 'efacce75a0cc7935f754fcc87e122069025c0eab';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Aurora' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'efacce75a0cc7935f754fcc87e122069025c0eab';
-- brands|La Barba|gamme|ar — sociétés et noms en latin
UPDATE `brands` SET `gamme_ar` = '[{"name":"La Barba Red","color":"#8B2222","force":"Medium-Full","wrapper":"مزيج Ventura","vitolas":["Robusto","Toro","Corona"],"story":"أوّل سيجار للدار، صدر عام 2013. كان يُصنع حينها في مصنع Aladino بهندوراس، ثم انتقل إلى Tabacalera William Ventura في الجمهورية الدومينيكية."},{"name":"La Barba Purple","color":"#5B3A6E","force":"Medium","wrapper":"مزيج دومينيكي، عند Ventura","vitolas":["Robusto","Toro"],"story":"صدر عام 2014، وبُني على أتبغة دومينيكية. وهو الذي أمال الدار كلّها نحو ورشة آل Ventura."}]'
 WHERE `name` = 'La Barba' AND SHA1(TRIM(`gamme`)) = '6b7679296af955b60e038d3f6453be86323c15fc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Barba' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '6b7679296af955b60e038d3f6453be86323c15fc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Flor de Cano' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '3e39c86564094be781944e2f0f8593edc1e96a94';
-- brands|La Flor de Copán|gamme|ar — terme interdit remplacé
UPDATE `brands` SET `gamme_ar` = '[{"name":"La Flor de Copán Classic","color":"#8B5A2B","force":"Medium","wrapper":"هابانو هندوراسي","vitolas":["Corona","Robusto"],"story":"الطابع الهندوراسي كما يُنتظَر: تراب وخشب وجلد، واحتراق صريح. سيجار يومي بأجمل معاني الكلمة."},{"name":"Reserva","color":"#6B4226","force":"Full","wrapper":"Habano Maduro","vitolas":["Toro"],"story":"تبغ معتَّق مدّة أطول، وغلاف أدكن، ومزيد من الكاكاو والقهوة. صعود الدار إلى الفئة الأعلى، دون تغيير في الأسلوب."}]'
 WHERE `name` = 'La Flor de Copán' AND SHA1(TRIM(`gamme`)) = '1b26d305f9cdcb239f727f4560e91f60626c41b5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Flor de Copán' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '1b26d305f9cdcb239f727f4560e91f60626c41b5';
-- brands|La Flor Dominicana|gamme|ar — « le plus connu » omis
UPDATE `brands` SET `gamme_ar` = '[{"name":"Double Ligero","color":"#8B0000","force":"Full","story":"الخط الرمزي للدار. غلاف Sumatra إكوادوري داكن مزروع تحت الشمس، فوق حشوة وغلاف داخلي دومينيكيين من أرض الدار، بدرجتي natural وmaduro (بحسب الدار، laflordominicana.com/double-ligero). و«Chisel»، وهو فيغورادو برأس إسفيني صدر عام 2003، هو القياس الأبرز للخط.","vitolas":["Chisel","Missile","Torpedo"],"wrapper":"Sumatra إكوادوري"},{"name":"Air Bender","color":"#722F37","force":"Full","story":"خلطة كاملة الجسم، بحسب الدار، من حشوة وغلاف داخلي دومينيكيين من أرض الدار تحت غلاف Habano، متوافرة بدرجتي natural وmaduro (laflordominicana.com/air-bender).","vitolas":["Robusto","Toro","Chisel","Lancero"],"wrapper":"Habano"},{"name":"Litto Gómez","color":"#8B4513","force":null,"wrapper":"دومينيكي 100 %","vitolas":[],"story":"الخط الذي يحمل اسم المؤسس، وتقدّمه الدار على أنه دومينيكي بالكامل (laflordominicana.com/our-cigars)."}]'
 WHERE `name` = 'La Flor Dominicana' AND SHA1(TRIM(`gamme`)) = '016303408c107ed4d7bed9f04f651ebcb0ea4223';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Flor Dominicana' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '016303408c107ed4d7bed9f04f651ebcb0ea4223';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Fontana' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'a20657aeebdd46c77f51418b57f19ed128b1210c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Galana' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '2d0ddb899add29051f8121c7cf2b676ed834e97b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Gianna' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '3a8f419b33d64c08eda74c612475de2318f8e6f2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Gloria Cubana' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'c5588ec9baec84a6e87b824a4bb3f6df979642f9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Gloria Cubana Dominicaine' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
-- brands|La Palina|gamme|ar — noms propres et sociétés latins
UPDATE `brands` SET `gamme_ar` = '[{"name":"Goldie","color":"#C9A227","force":"Medium","wrapper":"هابانو إكوادوري","vitolas":["Laguito No. 2","Laguito No. 5","Dalia"],"story":"الخطّ الأعلى، يُلَفّ في El Titan de Bronze بهافانا الصغيرة — وعلى يد لافٍّ واحد. ويحمل اسم Goldie Drell Paley، جدّة Bill وزوجة Samuel: وهي من كان اسم العلامة يعنيها منذ 1896."},{"name":"Mr. Sam","color":"#8B5A2B","force":"Medium-Full","wrapper":"مزيج El Titan de Bronze","vitolas":["Robusto","Toro"],"story":"الخطّ الميامي الآخر، يُصنع بدفعات صغيرة في El Titan de Bronze. والاسم اسم Samuel Paley، مؤسّس 1896."},{"name":"El Diario","color":"#6B4226","force":"Medium-Full","wrapper":"مزيج Raíces Cubanas","vitolas":["Robusto","Toro","Corona"],"story":"يُلَفّ في Fábrica de Tabacos Raíces Cubanas بهندوراس. وهو الخطّ الذي وُلد من الشراكة مع ذلك المصنع، وله مزاجه الخاص."},{"name":"Black Label","color":"#3A2A20","force":"Full","wrapper":"البرازيل","vitolas":["Robusto","Toro"],"story":"يُصنع في الجمهورية الدومينيكية، تحت غلاف برازيلي زيتيّ، فوق رابط وحشوة من نيكاراغوا والجمهورية الدومينيكية. الوجه الأقوى في الكتالوج: جلد، وتراب، وأرز."},{"name":"Classic","color":"#A0522D","force":"Medium","wrapper":"كونيتيكت أو روسادو أو مادورو أو غلاف هندوراسي بحسب النسخة","vitolas":["Robusto","Toro","Churchill"],"story":"خطّ الإنتاج الواسع، يُلَفّ في PDR Cigars بالجمهورية الدومينيكية — مصنع تامبوريل الذي يضمّه هذا الأطلس. وهو مدخل الدار."}]'
 WHERE `name` = 'La Palina' AND SHA1(TRIM(`gamme`)) = 'ac71b53072761ad25639982106d7efc91e5d8bc9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Palina' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'ac71b53072761ad25639982106d7efc91e5d8bc9';
-- brands|La Sirena|gamme|ar — dix ans de 2019 contresens
UPDATE `brands` SET `gamme_ar` = '[{"name":"La Sirena Original","color":"#3E4A6B","force":"Medium-Full","wrapper":"هابانو أوسكورو نيكاراغوي","vitolas":[],"story":"2009 لدى My Father، ولدى La Zona منذ 2014 — الخطّ الذي يحمل الاسم."},{"name":"Mexican Mermaid","color":"#3E8B6B","force":"Medium-Full","wrapper":"San Andrés (المكسيك)","vitolas":[],"story":"بعد الذكرى العاشرة عام 2019 — الحزام الأصلي بألوان المكسيك."},{"name":"Oceano","color":"#2B6CB0","force":"Medium","wrapper":"غير معلن","vitolas":[],"story":"تُمزج في MATASA لدى Quesada بجمهورية الدومينيكان."}]'
 WHERE `name` = 'La Sirena' AND SHA1(TRIM(`gamme`)) = '493249520eff1b5e4f9caae2e074490ed03396b8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Sirena' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '493249520eff1b5e4f9caae2e074490ed03396b8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Unica' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '020aa3752d04e152928f1bb16723501382f0acbf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Las Cabrillas' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '4879c29b31046779403048a9c00d951c92d340a8';
-- brands|Latitude Zero|gamme|ar — سيجارة au lieu de سيجار
UPDATE `brands` SET `gamme_ar` = '[{"name":"Original","color":"#A0522D","force":"Medium-Full","wrapper":"Habano (الإكوادور)","vitolas":[],"story":"غلاف Habano من الإكوادور وحشوة نيكاراغوية من مزرعة في إستيلي، بقوة من متوسطة إلى كاملة، بحسب CheapHumidors في أكتوبر 2026، التي لا تعرض إلا Robusto (5 x 54)؛ وتذكر التقارير خمسة مقاسات في 2015 (من Robusto 5 x 52 إلى Torpedo) وأربعة في 2021، ورباطًا نيكاراغويًا (2014، 2021) أو Connecticut Broadleaf (2015)."},{"name":"Signature","color":"#8B5A2B","force":null,"wrapper":"Sumatra (الإكوادور)","vitolas":[],"story":"غلاف Sumatra من الإكوادور، ورباط habano نيكاراغوي، وحشوة من Habano نيكاراغوي وHabano دومينيكي وConnecticut Broadleaf، في Robusto (5 x 54) وToro (6 x 52) وGordo (6 x 60)، في علب من عشرين سيجارًا، متاحة منذ 24 يونيو 2022، بحسب Stogiepress."}]'
 WHERE `name` = 'Latitude Zero' AND SHA1(TRIM(`gamme`)) = '1ad0681a40995dc3d7ff8bac8f3081738e65a671';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Latitude Zero' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '1ad0681a40995dc3d7ff8bac8f3081738e65a671';
-- brands|Laura Chavin|gamme|ar — liant rendu غلاف داخلي
UPDATE `brands` SET `gamme_ar` = '[{"name":"Classic","color":"#C9A96E","force":null,"wrapper":"Connecticut (الإكوادور)","vitolas":[],"story":"غلاف من صنف Connecticut من الإكوادور على رباط وحشوة دومينيكيَّين، وستة أنواع من التبغ في الحشوة تُحفظ أربع إلى خمس سنوات على الأقل؛ وثمانية مقاسات، من No. 33 Corona إلى No. 99 Fino Largo، بحسب الدار."},{"name":"Concours","color":"#8B5A2B","force":null,"wrapper":"دومينيكي","vitolas":[],"story":"puro دومينيكي بخلطة تُحفظ سرًّا، صُمّم بمناسبة مرور عشر سنوات على العلامة استنادًا إلى خلطة Concours السابق؛ بمقاسات Robusto وPerfecto وCorona وDiadema، بحسب الدار."},{"name":"Terre de Mythe","color":"#8B5A2B","force":null,"wrapper":"دومينيكي","vitolas":[],"story":"puro دومينيكي بمقاسات Petit Corona وGrand Robusto وCorona Gorda وPerfecto، بأوجه حسّية متغيّرة، بحسب الدار."},{"name":"Virginy","color":"#A0522D","force":null,"wrapper":"الإكوادور","vitolas":[],"story":"غلاف من الإكوادور على رباط وحشوة دومينيكيَّين، مع تبغ Olor Dominican Virgen de Carbonell؛ بمقاسات Toro (No. 1) وBelicoso (No. 2) وLonsdale (No. 3)، بحسب الدار."},{"name":"La Ligue des Divins","color":"#8B5A2B","force":null,"wrapper":"غير معلن","vitolas":[],"story":"تبغ يُزرع على ارتفاع نحو 800 m في سيباو؛ وإصدار 2020 بمقاسات Toro وShort Churchill وGran Corona، بحسب الدار."},{"name":"La Tentation","color":"#A0522D","force":null,"wrapper":"الإكوادور","vitolas":[],"story":"سيجار longfiller مصغّر يُلفّ يدويًا، بقياس 10 mm × 60 mm، بغلاف من الإكوادور على رباط وحشوة دومينيكيَّين، بحسب الدار."}]'
 WHERE `name` = 'Laura Chavin' AND SHA1(TRIM(`gamme`)) = 'c5d3b0f90a4ed2fe46980e02b76c2cbebc0de732';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Laura Chavin' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'c5d3b0f90a4ed2fe46980e02b76c2cbebc0de732';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Le Fagot Cigar' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '4b957d2d2b86ee961cf8307527e04ad6fd9856d5';
-- brands|League of Fat Bastards|gamme|ar — سيجارة au lieu de سيجار
UPDATE `brands` SET `gamme_ar` = '[{"name":"Serie L","color":"#A0522D","force":"Medium","wrapper":"Habano (الإكوادور)","vitolas":[],"story":"مزيج أصلي، كريمي وترابي، بحسب الدار؛ غلاف Habano من الإكوادور، ورباط من خالابا، وحشوة من خالابا وإستيلي، بقوة متوسطة بحسب Cigar World، في Robusto (5 x 50) وToro (6 x 54) وChurchill (7 x 50)، بحسب مقال مارس 2024."},{"name":"Serie O","color":"#4A2C1A","force":"Full","wrapper":"San Andrés oscuro (المكسيك)","vitolas":[],"story":"غلاف San Andrés مكسيكي negro oscuro، ورباط دومينيكي، وحشوة من كونديغا، seco وligero، ومن خالابا، viso، بقوة كاملة، بحسب الدار، في Corona (5 1/2 x 46) وRobusto (5 x 50) وToro (6 x 54) و6 x 60 box-pressed وGiggly Piggly (4 x 60 مع pigtail)، في علب من 13 سيجارًا، بحسب Cigar Coop."},{"name":"Skinny Bastarda","color":"#8B5A2B","force":null,"wrapper":"غير معلن","vitolas":[],"story":"Corona بمقاس 5 1/4 x 42 في عبوات من خمسة سيجار، بمزيج يُحتفظ بسريته، من ابتكار Raquel وPatricia Quesada، وتُلَفّ في مصنع Quesada في جمهورية الدومينيكان، بحسب Stogiepress؛ وتقول الدار إنها صُنعت على يد نساء لنساء."},{"name":"Wingman","color":"#A0522D","force":null,"wrapper":"Habano (الإكوادور)","vitolas":[],"story":"أول إصدار محدود، أُعلن عنه في 6 نوفمبر 2025، Toro بمقاس 6 x 52، بغلاف Habano من الإكوادور فوق رباط Sumatra من إندونيسيا وحشوة من تبوغ نيكاراغوية؛ ولا تقول الدار من يلفّه، بحسب ما تكتب Cigar Coop."},{"name":"Department of Honor","color":"#8B5A2B","force":null,"wrapper":"غير معلن","vitolas":[],"story":"إصدار محدود مخصص للمستجيبين الأوائل وللفروع الستة للقوات المسلحة للولايات المتحدة: أربعة سيجار corona، اثنان من كل مزيج، أحد المزيجين، بغلاف Habano، أخفّ من الآخر، بغلاف San Andrés، في 400 عبوة مخصصة لتجار التجزئة في PCA 2026 وتُشحن اعتبارًا من منتصف مايو 2026؛ مصنوعة في نيكاراغوا، والمصنع غير مسمّى، بحسب Premium Cigar Association."}]'
 WHERE `name` = 'League of Fat Bastards' AND SHA1(TRIM(`gamme`)) = '2bf3013686ebb629f13287b84c57a0f789ea23fc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'League of Fat Bastards' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '2bf3013686ebb629f13287b84c57a0f789ea23fc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Legado' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '599ca0737da0fa73bba3af5ec5e9adc2a4d9771a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Leite & Alves' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '8d8f2cc7a7841c57dcb3c89b25a9836d98cef833';
-- brands|Licenciados|gamme|ar — سيجارة au lieu de سيجار
UPDATE `brands` SET `gamme_ar` = '[{"name":"Licenciados","color":"#C9A96E","force":"Mild","wrapper":"Connecticut Shade","vitolas":[],"story":"غلاف Connecticut Shade بني فاتح فوق حشوة longfiller دومينيكية، بقوة خفيفة، في مقاسين هما Churchill (7 x 50) وToro (6 x 50)، في علب من خمسة وعشرين سيجارًا، بحسب Holt''s Cigar Co.؛ ويضيف Premium Cigar of the Month Club، دون تاريخ، غلاف broadleaf maduro."}]'
 WHERE `name` = 'Licenciados' AND SHA1(TRIM(`gamme`)) = 'feef3f1dd794c658a42aa40cfb653bedb2ad21d4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Licenciados' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'feef3f1dd794c658a42aa40cfb653bedb2ad21d4';
-- brands|Liga Privada|gamme|ar — vitola omise, listes altérées
UPDATE `brands` SET `gamme_ar` = '[{"name":"No.9","color":"#1C0A00","force":"Full","story":"الخلطة الأصلية للعلامة. غلاف Connecticut River Valley Broadleaf No. 1 Dark، ورابط Mata Fina من البرازيل، وحشوة من هندوراس ونيكاراغوا، بحسب الدار. القياسات في كتالوج الدار: Coronets وRobusto وCorona Viva وToro (6 × 52 بوصة) وBelicoso وCorona Doble، وFlying Pig إصدارًا موسميًّا.","vitolas":["Toro","Robusto","No.9 Perfecto","Flying Pig","Little Bigger Fish","Petit Lancero"],"wrapper":"Connecticut Broadleaf"},{"name":"T52","color":"#2D0A00","force":"Full","story":"غلاف هابانو من كونيتيكت، مقطوع ومجفَّف على الساق، معتَّق من 30 إلى 36 شهرًا بحسب الدار؛ ورابط Mata Fina، وحشوة من هندوراس ونيكاراغوا. القياسات نفسها كما في No.9 في كتالوج الدار. صدرت عام 2009 بحسب Cigar Coop.","vitolas":["Toro","Flying Pig","Petit Toro","Unico Serie"],"wrapper":"Connecticut Habano (stalk-cut)"},{"name":"Unico Serie","color":"#3D1C00","force":"Full","story":"سلسلة أُطلقت عام 2010 بحسب Cigar Coop: خلطة فريدة لكل قياس، وهي تفريع من No.9 وT52. أما Papas Fritas، وهي كورونا قصيرة بقياس 115 × 44 مم (4 1/2 × 44 بوصة)، فحشوتها قصيرة مصنوعة من قصاصات سيجارات Liga Privada الأخرى، تحت غلاف Connecticut Broadleaf مادورو؛ وتعرضها الدار اليوم في مجموعة مستقلة.","vitolas":["Papas Fritas","Unico Serie annuel"],"wrapper":"تختلف بحسب الإصدار"}]'
 WHERE `name` = 'Liga Privada' AND SHA1(TRIM(`gamme`)) = 'a77f2a46cec9f93138087d5d2a7a7e127b0d4ba0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Liga Privada' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'a77f2a46cec9f93138087d5d2a7a7e127b0d4ba0';
-- brands|Loaisiga|gamme|ar — سيجارة au lieu de سيجار
UPDATE `brands` SET `gamme_ar` = '[{"name":"Infiel Connecticut","color":"#C9A96E","force":"Medium","wrapper":"Connecticut (الإكوادور)","vitolas":[],"story":"غلاف Connecticut إكوادوري، بقوة متوسطة، بحسب الدار التي تقدّم Infiel في ستة مقاسات، من Corona (5 1/2 x 42) إلى Toro Gordo (6 x 60)؛ وتذكر رباط San Andrés من المكسيك وحشوة من نيكاراغوا، بينما يذكر مقال 24 يوليو 2024 رباطًا وحشوة من نيكاراغوا."},{"name":"Infiel Sun Grown","color":"#A0522D","force":"Medium-Full","wrapper":"Habano sun grown (الإكوادور)","vitolas":[],"story":"غلاف Habano sungrown من الإكوادور، بقوة من متوسطة إلى كاملة، بحسب الدار؛ ويتوفر الإصدار المحدود Box Press Toro (6 x 54، علب من عشرة سيجار) في هذه الخلطة أيضًا."},{"name":"Infiel Maduro","color":"#4A3728","force":"Medium-Full","wrapper":"San Andrés maduro (المكسيك)","vitolas":[],"story":"غلاف San Andrés maduro مكسيكي، بقوة من متوسطة إلى كاملة، بحسب الدار؛ ويتوفر الإصدار المحدود Box Press Toro (6 x 54، علب من عشرة سيجار) في هذه الخلطة أيضًا."},{"name":"El Cadejo","color":"#C9A96E","force":"Medium","wrapper":"Habano claro (خالابا)","vitolas":[],"story":"White Cadejo، وهو الوحيد من بين Cadejo الاثنين المُدرج في الكتالوج: غلاف Habano claro من خالابا، ورباط وحشوة من نيكاراغوا، بقوة متوسطة، بحسب الدار، في علب بيضاء من عشرين سيجارًا وفي أربعة مقاسات، من Short Robusto (3 1/2 x 52) إلى Toro Gordo (6 x 60)؛ أما Black Cadejo فمعلَن عنه."}]'
 WHERE `name` = 'Loaisiga' AND SHA1(TRIM(`gamme`)) = '75824a8089a14da9499d1ad564314437da38b459';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Loaisiga' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '75824a8089a14da9499d1ad564314437da38b459';
-- brands|Los Amigos|gamme|ar — قصة au lieu de format
UPDATE `brands` SET `gamme_ar` = '[{"name":"Epiphany","color":"#A0522D","force":"Mild-Medium","wrapper":"Habano إكوادوري","vitolas":[],"story":"رباط Besuki إندونيسي، وحشوة دومينيكية ونيكاراغوية، بقياس Robusto (5 x 50)، كما تقول Cigar Dojo."},{"name":"The Sacred Blend","color":"#A0522D","force":"Medium","wrapper":"Habano إكوادوري","vitolas":[],"story":"الغلاف والرباط نفسهما كما في Epiphany، بقياس Grand Robusto (5 x 56)، كما تقول Cigar Dojo."},{"name":"Legacy of the Leaf","color":"#4A3728","force":"Medium-Full","wrapper":"San Andrés (المكسيك)","vitolas":[],"story":"حشوة نيكاراغوية بالكامل، بقياس box-pressed (4½ x 60)، كما تقول Cigar Dojo."},{"name":"Hedonism","color":"#4A2C1A","force":"Medium-Full","wrapper":"Connecticut Broadleaf","vitolas":[],"story":"رباط من كونديغا، وحشوة من تبغ Broadleaf من بنسلفانيا إضافة إلى تبغ دومينيكي ونيكاراغوي، بقياس Toro (6 x 52)، كما تقول Cigar Dojo."}]'
 WHERE `name` = 'Los Amigos' AND SHA1(TRIM(`gamme`)) = '53a709b2881001ec8fe80bcc00b133f98d905259';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Los Amigos' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '53a709b2881001ec8fe80bcc00b133f98d905259';
-- brands|Luciano Cigars|gamme|ar — nom propre en latin
UPDATE `brands` SET `gamme_ar` = '[{"name":"Pichardo Reserva Familiar","color":"#5B3A29","force":"Medium-Full","wrapper":"غير معلن","vitolas":[],"story":"باسم عائلة مؤسّس المصنع. صدر في تموز/يوليو 2019."},{"name":"Luciano The Dreamer","color":"#7A4A2C","force":"Medium","wrapper":"غير معلن","vitolas":[],"story":"باسم الشريك. مع The Traveler، الخطّ الذي أعطى الدار اسمها سنة 2022."},{"name":"MXS","color":"#4A3728","force":"Medium-Full","wrapper":"غير معلن","vitolas":[],"story":"توقيعات رياضيين — نصيب Tiago Splitter في المشروع."}]'
 WHERE `name` = 'Luciano Cigars' AND SHA1(TRIM(`gamme`)) = 'e194ee01cf362db43219ff0739e0eba9fce63e4c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Luciano Cigars' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'e194ee01cf362db43219ff0739e0eba9fce63e4c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Macanudo' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '0e2bc37a1129c93655bb8ef02ea6830ab84693bf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Malekö' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'a055a130c99e087f737f792a0daf214f0d218cfc';
-- brands|Mara|gamme|ar — سجائر au lieu de سيجار
UPDATE `brands` SET `gamme_ar` = '[{"name":"Marabunta","color":"#6B4226","force":"Full","wrapper":"نيكاراغوا","vitolas":[],"story":"غلاف وغلاف داخلي وحشوة من نيكاراغوا؛ قوي ومتين منذ الثلث الأول، بحسب Cigarworld.de."},{"name":"El Sicario","color":"#4A3728","force":"Medium","wrapper":"نيكاراغوا، Maduro","vitolas":[],"story":"غلاف نيكاراغوي من نوع maduro، وغلاف داخلي وحشوة من نيكاراغوا، سيجار box-pressed، بقوة medium، بحسب Cigarworld.de."},{"name":"El Corrupto","color":"#C9A96E","force":"Medium","wrapper":"نيكاراغوا، Connecticut","vitolas":[],"story":"غلاف Connecticut مزروع في نيكاراغوا، وغلاف داخلي وحشوة نيكاراغويان، بقوة medium، بحسب Cigarworld.de."},{"name":"El Hurón","color":"#A0522D","force":null,"wrapper":"الإكوادور، Sungrown","vitolas":[],"story":"غلاف إكوادوري من نوع Sungrown، وغلاف داخلي وحشوة من نيكاراغوا، وصلت إلى ألمانيا في 28 مايو 2024، بحسب Cigarworld.de."}]'
 WHERE `name` = 'Mara' AND SHA1(TRIM(`gamme`)) = '15e219c34daad9161d95f3fa14183351ced44d33';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Mara' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '15e219c34daad9161d95f3fa14183351ced44d33';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Marca Fina' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '1dcd55451be68a9a64d3b9c2568ced13248ed5d4';
-- brands|Mata Hari|gamme|ar — San Andrés en latin
UPDATE `brands` SET `gamme_ar` = '[{"name":"Courtisane","color":"#C9A96E","force":"Mild-Medium","wrapper":"غير معلن","vitolas":[],"story":"مصنوعة بالكامل من تبغ إندونيسي بحسب الدار، التي تصف نكهاتها بالخشب والجلد والفانيليا والقهوة."},{"name":"Java Exotica","color":"#A0522D","force":"Medium","wrapper":"جاوة (كولورادو)","vitolas":[],"story":"تبغ دومينيكي وبرازيلي تحت غلاف جاوي يعود أول قطاف له إلى 2020، بحسب الدار."},{"name":"Limited Edition 2024","color":"#4A3728","force":null,"wrapper":"San Andrés (المكسيك)","vitolas":[],"story":"تبغ برازيلي ودومينيكي وإندونيسي تحت غلاف San Andrés مكسيكي؛ نكهات من التراب والشوكولاتة بحسب الدار."}]'
 WHERE `name` = 'Mata Hari' AND SHA1(TRIM(`gamme`)) = '92808dda9314b55fec43fde19c366a4b0a54b82e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Mata Hari' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '92808dda9314b55fec43fde19c366a4b0a54b82e';
-- brands|Matacan|gamme|ar — San Andrés, comparatif interdit
UPDATE `brands` SET `gamme_ar` = '[{"name":"Matacan No.2","color":"#5D4037","force":"Medium","wrapper":"San Andrés","vitolas":["Robusto"],"story":"«بورو» مكسيكي بالمعنى الحرفي: حشوة ورابطة وغلاف من البلد. أرض San Andrés وحدها، دون التبغ الذي يرافقها عادةً — كاكاو وتراب وحلاوة طبيعية."},{"name":"Matacan No.4","color":"#4A2C2A","force":"Medium","wrapper":"San Andrés Maduro","vitolas":["Toro"],"story":"المقاس الطويل في التشكيلة، تحت غلاف أدكن. الصراحة نفسها، ومزيد من الكاكاو، واحتراق سريع يستدعي سحباً بطيئاً."}]'
 WHERE `name` = 'Matacan' AND SHA1(TRIM(`gamme`)) = 'ffecc8a983ccec7b10061ffc4a90a140ee150590';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Matacan' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'ffecc8a983ccec7b10061ffc4a90a140ee150590';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Matilde' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '459b004a5fbd1d34a0155ad3caa260ab116d91be';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'May''s Cigars' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'd55d0390731a252d2828bb879e507800db10b4d9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Maya Selva Cigars' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '86bbb79d9577d8ea42c634793971c6daed97fad5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Meerapfel' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'ee7d73a5ae5b675f5f7c81f02a785643872dff6a';
-- brands|Menendez Amerino|gamme|ar — marque en latin
UPDATE `brands` SET `gamme_ar` = '[{"name":"Alonso Menendez","color":"#4A3728","force":"Medium-Full","wrapper":"ماتا فينا من باهيا","vitolas":["Robusto","Toro","Corona"],"story":"أُنشئ عام 1980، قبل Dona Flor نفسها. ويحمل الاسم الأوّل للعائلة الكوبية التي جلبت الطريقة."},{"name":"Alonso Del Patron","color":"#6B4226","force":"Medium","wrapper":"ماتا فينا من باهيا","vitolas":["Robusto","Toro"],"story":"صدر عام 2018، بعد أربعين سنة من تأسيس المصنع. وقلّما تُخرج دارٌ في هذا العمر سلسلة جديدة في البرازيل."},{"name":"Dona Flor","color":"#8B5A2B","force":"Medium","wrapper":"ماتا فينا من باهيا","vitolas":["Robusto","Toro","Corona","Lonsdale"],"story":"أُطلقت عام 1982 وصارت علامة الدار. ولها بطاقتها في هذا الأطلس: لفٌّ كوبيّ وورقة برازيلية."}]'
 WHERE `name` = 'Menendez Amerino' AND SHA1(TRIM(`gamme`)) = 'acbdc092579b265f0b0edf6abd211f59966e778f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Menendez Amerino' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'acbdc092579b265f0b0edf6abd211f59966e778f';
-- brands|Miami Cigar & Co.|gamme|ar — liant = رابط ; cohérence
UPDATE `brands` SET `gamme_ar` = '[{"name":"Nestor Miranda Collection","color":"#6B4226","force":"Medium-Full","story":"الخطّ الذي يحمل اسم المؤسّس، أُطلق عام 2014 ويُصنع لدى My Father في إستيلي، بحسب Cigar Coop — سبب تصنيف هذه البطاقة. ويُلفّ هناك أيضًا Grand Reserve 2024 للعلامة (My Father Cigars S.A.، حزيران/يونيو 2025)؛ أمّا Private Reserve Lancero، المعلَن عنه في آذار/مارس 2026، فيُلفّ لدى La Aurora في الجمهورية الدومينيكية.","vitolas":[],"wrapper":"غير معلن"},{"name":"Don Lino","color":"#8B5A2B","force":"Medium","story":"علامة البدايات، 1989، على اسم رجل في مصنع UST بهندوراس. اثنا عشر مليون سيجار سنة 1996، وسنتان خارج السوق، واستُؤنف صنعها لدى La Aurora سنة 1999. ومنذ 2021 تضمّ العلامة أيضًا سلسلة دومينيكية، Connecticut وMaduro: تكتب Cigar Coop أنّ المصنع غير معلن في تموز/يوليو 2021، ثم تسمّي Tabacalera El Artista في آب/أغسطس 2021.","vitolas":[],"wrapper":"غير معلن"},{"name":"Don Lino Africa","color":"#4A3728","force":"Full","story":"التنويع الأدكن لعلامة البدايات، أُعيد إطلاقه سنة 2019: يلفّه A.J. Fernandez في إستيلي، بغلاف Habano 2000 من الإكوادور ورابط من الكاميرون، بحسب Cigar Dojo وCigar Coop في أيار/مايو 2019؛ ولا تزال Cigar Coop تعدّه في آب/أغسطس 2021 بين خطوط A.J. Fernandez.","vitolas":[],"wrapper":"Habano 2000 من الإكوادور"},{"name":"Outcast","color":"#8B5A2B","force":"Mild-Medium","story":"خط قُدّم في معرض PCA 2025 وشُحن إلى تجار التجزئة في يونيو 2025، صُنع في الجمهورية الدومينيكية؛ وفي أكتوبر 2026 لا تسمّي الشركة المصنع. غلاف خارجي Cubra برازيلي، هجين من Corojo من بذور كوبية، ورابط Sumatra من الإكوادور، وحشوة دومينيكية، بمقاسات Robusto وCorona Gorda وToro وGran Toro بحسب إعلان أبريل 2025.","vitolas":[],"wrapper":"Cubra من البرازيل"}]'
 WHERE `name` = 'Miami Cigar & Co.' AND SHA1(TRIM(`gamme`)) = '3766250b1955df0f7795563b0d8c198abd20ea8e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Miami Cigar & Co.' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '3766250b1955df0f7795563b0d8c198abd20ea8e';
-- brands|Micallef|gamme|ar — San Andrés en latin
UPDATE `brands` SET `gamme_ar` = '[{"name":"Leyenda","color":"#8B5A2B","force":"Medium-Full","wrapper":"هابانو إكوادوري","vitolas":["Robusto","Toro","Corona"],"story":"غلاف هابانو إكوادوري، ورابط نيكاراغوي، وحشوة من الجمهورية الدومينيكية وهندوراس ونيكاراغوا. وهي السلسلة التي رسّخت الدار."},{"name":"Reserva Limitada Privada","color":"#3A2A20","force":"Full","wrapper":"San Andrés Habano من المكسيك","vitolas":["Robusto","Toro"],"story":"غلاف San Andrés Habano، ورابط نيكاراغوي، وحشوة تذهب في طلب التبغ حتى بيرو — بلد قلّ أن تستعمله المزائج."}]'
 WHERE `name` = 'Micallef' AND SHA1(TRIM(`gamme`)) = '926063232e7b2030cb84aef5158e7b4282b153bd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Micallef' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '926063232e7b2030cb84aef5158e7b4282b153bd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Mombacho' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'e723cd2491e075b136a4f6c2bd2c610b2c7cd310';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Monte Pascoal' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '464e5ba85aec44a5dea4a6e721d779109ff97ef3';
-- brands|Montealto|gamme|ar — سيجارة au lieu de سيجار
UPDATE `brands` SET `gamme_ar` = '[{"name":"Serie Oro","color":"#C9A227","force":"Medium","wrapper":"ورق لا بالما، مكمَّلًا بأتبغة مستوردة","vitolas":["Toro","Robusto"],"story":"الخطّ الأعلى في المصنع، ملفوف باليد. يحتلّ تبغ لا بالما الآتي من شتلاتها الخمسة آلاف المكانة الأولى، مكمَّلًا بورق من كوبا والجمهورية الدومينيكية ونيكاراغوا."},{"name":"Serie Plata","color":"#B0B7BC","force":"Medium","wrapper":"ورق لا بالما، مكمَّلًا بأتبغة مستوردة","vitolas":["Toro"],"story":"الوجه الأيسر منالًا في الكتالوج، على المزيج الأساسي نفسه. يخرج من الورشة نحو ثلاثمئة سيجار يوميًا، بجميع العلامات مجتمعة."}]'
 WHERE `name` = 'Montealto' AND SHA1(TRIM(`gamme`)) = 'd15f17135a6c36b7bf85512f6015e141e48b2d80';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Montealto' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'd15f17135a6c36b7bf85512f6015e141e48b2d80';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Montecristo' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '16d0e3775457212b88110a229c91ea267b1821a3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Montecristo Dominicain' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '3425e18150c2eb7c5f1f0f34209860da99498512';
-- brands|Montecruz|gamme|ar — pays Cameroun mal rendu
UPDATE `brands` SET `gamme_ar` = '[{"name":"Montecruz Sun Grown","color":"#6B4226","force":"Medium-Full","wrapper":"كاميروني","vitolas":["Lonsdale","Corona"],"story":"الغلاف الكاميروني الداكن الذي عمل بديلاً للهافانا في السوق الأميركية. جلد وبندق محمّص وفلفل لطيف — وجزء من تاريخ الذائقة الأميركية بعد 1962."},{"name":"Montecruz Claro","color":"#C9A227","force":"Medium","wrapper":"كاميروني Claro","vitolas":["Corona"],"story":"النسخة الفاتحة من الخلطة نفسها، أجفّ وأقصر في الفم. تلك التي كانت تُقدَّم لمن جاؤوا من الهافانا اللطيف."}]'
 WHERE `name` = 'Montecruz' AND SHA1(TRIM(`gamme`)) = 'b68e4f4c02e1932884a9e3ea8c030390820fb8bb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Montecruz' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'b68e4f4c02e1932884a9e3ea8c030390820fb8bb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'MOSI' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '702d6b704ce24197412312bcb4564bf4b8fe1da4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Mosi Oa Tunya' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '4ba489290b280110fc4275fb25b2c4cb3042c014';
-- brands|Mustique|gamme|ar — liant = رابط
UPDATE `brands` SET `gamme_ar` = '[{"name":"Blue","color":"#C9A96E","force":"Mild","wrapper":"Connecticut Shade","vitolas":[],"story":"غلاف ذهبي على رابط وحشوة دومينيكيَّين؛ بمقاسات Churchill وCorona وLonsdale وPetit Corona وRobusto وSlim Panetella، في bundles من عشرة؛ خط خفيف، بحسب Cigarworld.de."},{"name":"Red","color":"#A0522D","force":null,"wrapper":"Sun Grown (الإكوادور)","vitolas":[],"story":"رابط من نيكاراغوا، وحشوة من تبغ دومينيكي وأوراق برازيلية؛ بمقاسات Churchill وCorona وRobusto وToro، في bundles من عشرة؛ بقوة متوسطة بحسب Cigarworld.de، وخفيفة بحسب Noblego."},{"name":"Amber","color":"#C9A96E","force":null,"wrapper":"Connecticut (هندوراس)","vitolas":[],"story":"نسخة من هندوراس: رابط من خاماستران (Jamastrán) وحشوة من إستيلي وخالابا، في نيكاراغوا؛ بمقاسات Churchill وCorona وCorona Blanco وPetit Corona وRobusto؛ بقوة خفيفة بحسب Cigarworld.de، ومتوسطة بحسب Noblego."}]'
 WHERE `name` = 'Mustique' AND SHA1(TRIM(`gamme`)) = '7744f5485b61ebdb644641ddfb9c33258370e0c9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Mustique' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '7744f5485b61ebdb644641ddfb9c33258370e0c9';
-- brands|My Father|gamme|ar — noms propres en latin
UPDATE `brands` SET `gamme_ar` = '[{"name":"Le Bijou 1922","color":"#8B0000","force":null,"story":"توربيدو (52 × 152 مم). خلطة نيكاراغوية، وغلاف هابانو داكن من الإكوادور، وقوة كاملة. نفحات من الأرز الأحمر وقهوة الماكياتو وفلفل الكبابة. أما 1922 في الاسم فيُقال إنه سنة ولادة والد Pepín، بحسب أحد بائعي التجزئة (Cigarsdirect)؛ ولا توضح الدار ذلك في صفحتها الرئيسية.","vitolas":["Torpedo","Toro","Robusto","Petit Robusto","Churchill","Magnum"],"wrapper":"Habano Oscuro من الإكوادور"},{"name":"My Father No.1","color":"#722F37","force":null,"story":"غلاف كونيتيكت طبيعي من الإكوادور فوق حشوة نيكاراغوية. نفحات من القشدة والبندق والتوابل الخفيفة. يرد اسم الخط في صفحة الدار؛ ولا يُذكر فيها عام إطلاقه.","vitolas":["Toro","Robusto","Torpedo","Belicoso","Churchill","Juniors"],"wrapper":"Connecticut من الإكوادور"},{"name":"La Antigüedad","color":"#A0522D","force":null,"story":"غلاف مادورو كونيتيكت برودليف فوق حشوة نيكاراغوية. نفحات من الشوكولاتة الداكنة والقهوة الباردة والدبس. يحيل الاسم (ومعناه العراقة)، بحسب أحد بائعي التجزئة، إلى علامة كوبية قديمة جرى البحث عن تصميمها الفني؛ وهي أنعم من Le Bijou 1922.","vitolas":["Robusto","Toro","Torpedo","Churchill"],"wrapper":"Connecticut Broadleaf Maduro"},{"name":"Jaime García Reserva Especial","color":"#4A3728","force":null,"story":"خط باسم ابن Pepín، غلاف برودليف كونيتيكت.","vitolas":[],"wrapper":"برودليف كونيتيكت"},{"name":"Flor de las Antillas","color":"#8B5A2B","force":null,"story":"سيجار نيكاراغوي خالص، غلاف مزروع تحت الشمس؛ وتدرجه الدار بين علاماتها الأخرى، ومعه نسخته مادورو.","vitolas":[],"wrapper":"نيكاراغوي خالص"},{"name":"La Dueña","color":"#8B1A6B","force":null,"story":"خط تربطه البطاقة بـJanny García، ابنة الدار؛ غلاف برودليف كونيتيكت.","vitolas":[],"wrapper":"برودليف كونيتيكت"},{"name":"El Centurión","color":"#7A2E1E","force":null,"story":"خط تدرجه الدار (بما في ذلك نسختا H-2K-CT وMaduro)؛ غلاف هابانو نيكاراغوي.","vitolas":[],"wrapper":"هابانو نيكاراغوي"},{"name":"Tabacos Baez","color":"#8B5A2B","force":"Medium","story":"في أكتوبر 2026 يصفها تاجر التجزئة Cigarsdaily بأنها أول علامة خاصة لدى My Father من نوع short filler، ويُرمز إليه بـ S.F.، غير أن مراجعة تعود إلى 2010 تصف حشوة مختلطة، نحو 70% منها longfiller من بذور كوبية، مصنوعة من بقايا إنتاج Pepin García. غلاف خارجي Habano من نيكاراغوا فوق رابط وحشوة نيكاراغويين، بمقاس Robusto 5 x 50 المعروض للبيع في ذلك التاريخ، وبمقاس Corona 6 x 46 في 2010.","vitolas":[],"wrapper":"Habano من نيكاراغوا"}]'
 WHERE `name` = 'My Father' AND SHA1(TRIM(`gamme`)) = '70ee8e6f847849e3d11b7ef36c84822061f223b5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'My Father' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '70ee8e6f847849e3d11b7ef36c84822061f223b5';
-- brands|NACSA|gamme|ar — nom propre en latin
UPDATE `brands` SET `gamme_ar` = '[{"name":"Red Dot","color":"#B22222","force":"Medium","wrapper":"غير معلن","vitolas":[],"story":"إحدى العلامات المسجّلة للمصنع، أعاد مزجها Larry Palombo سنة 2016 على أتبغة أوليفا."},{"name":"Villar y Villar","color":"#6B4226","force":"Medium-Full","wrapper":"غير معلن","vitolas":[],"story":"اسمُ علامة قديمة، أُخرج من الدرج مع La Rosa Especial وAristoff."}]'
 WHERE `name` = 'NACSA' AND SHA1(TRIM(`gamme`)) = '87ee05ba5b2bfcb68510cca428b7b63422c6d8ab';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'NACSA' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '87ee05ba5b2bfcb68510cca428b7b63422c6d8ab';
-- brands|Nat Sherman|gamme|ar — comparatif à reformuler
UPDATE `brands` SET `gamme_ar` = '[{"name":"Timeless","color":"#8B4513","force":"Medium-Full","wrapper":"هابانو إكوادوري","vitolas":["Robusto","Toro"],"story":"أدقّ سلاسل الدار صنعًا: محكمة البناء، فلفلية، بطول يفسّر وفاء جمهورها النيويوركي."},{"name":"Metropolitan","color":"#C9A227","force":"Medium","wrapper":"Connecticut Shade","vitolas":["Corona"],"story":"مزاج الصالون، على صورة مبنى الجادة الخامسة حيث كانت الدار تستقبل: أرز وبندق، ولا شيء يرفع صوته."}]'
 WHERE `name` = 'Nat Sherman' AND SHA1(TRIM(`gamme`)) = '097cafb1f7993ac0ef898dbf8388112d0d8a0ad8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Nat Sherman' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '097cafb1f7993ac0ef898dbf8388112d0d8a0ad8';
-- brands|Nicoya|gamme|ar — sous-cape, Valle Criollo, douceur
UPDATE `brands` SET `gamme_ar` = '[{"name":"Nicoya Medios","color":"#A0522D","force":"Medium","wrapper":"هابانو روسادو إكوادوري","vitolas":["Robusto"],"story":"الألطف بين الاثنين، روبوستو بخمس بوصات في اثنين وخمسين. غلاف هابانو روسادو إكوادوري، وغلاف داخلي مكسيكي، وحشوة من هابانو 2000 دومينيكي ومن فيسو إستيلي وأوميتيبي وخالابا — وتنسب الدار اللطافة التي تعلنها إلى فيسو خالابا."},{"name":"Nicoya Fuertes","color":"#8B0000","force":"Full","wrapper":"هابانو إكوادوري","vitolas":["Robusto"],"story":"الوجه الأقوى، بالمقاس نفسه. تحت الغلاف الإكوادوري تكون الحشوة نيكاراغوية بالكامل: ليغيرو من Valle Criollo في إستيلي، وفيسو من أوميتيبي وخالابا، وسيكو من كونديغا."}]'
 WHERE `name` = 'Nicoya' AND SHA1(TRIM(`gamme`)) = '65dad592473b81014b75e4620c15127052d54772';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Nicoya' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '65dad592473b81014b75e4620c15127052d54772';
-- brands|Nomad|gamme|ar — noms propres en latin
UPDATE `brands` SET `gamme_ar` = '[{"name":"S-307","color":"#4A3728","force":"Medium-Full","wrapper":"سومطرة إكوادوريّ","vitolas":["Robusto","Toro","Torpedo"],"story":"أوّل سيجار نيكاراغويّ للدار في إنتاج منتظم، مكبوس، مُزج ولُفّ عند A.J. Fernández."},{"name":"Estelí Lot 1386","color":"#6B4226","force":"Full","wrapper":"مزيج نيكاراغويّ","vitolas":["Robusto","Toro"],"story":"أوّل عمل لـRewey في نيكاراغوا، ربيع 2013 — والرقم يدلّ على دفعة تبغ لا على سنة حصاد."},{"name":"Connecticut Fuerte","color":"#C9A96E","force":"Medium","wrapper":"كونيتيكت","vitolas":["Robusto","Toro","Corona"],"story":"الوجه الدومينيكيّ للبدايات، لُفّ في Tabacalera L&V. غلاف فاتح فوق حشوة ليست كذلك — ومن هنا الاسم."}]'
 WHERE `name` = 'Nomad' AND SHA1(TRIM(`gamme`)) = '080fb9b9c3300456a08d1448ed9ec4a628933cdc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Nomad' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '080fb9b9c3300456a08d1448ed9ec4a628933cdc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Nordlicht' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '4bb5e11f5198eb925bf6aae0c3a00274faadcfc4';
-- brands|Notorious|gamme|ar — sous-cape rendue رابطة ; San Andrés
UPDATE `brands` SET `gamme_ar` = '[{"name":"Notorious","color":"#8B5A2B","force":"Medium","wrapper":"إكوادور Habano 2000","vitolas":[],"story":"الخلطة الأصلية: غلاف Habano 2000 Rosado Oscura معتّق نحو أربع سنوات وغلاف داخلي San Andrés، وفق بعض الموزّعين."},{"name":"Crème de la Crème","color":"#C9A96E","force":null,"wrapper":"إكوادور، غلاف فاتح","vitolas":[],"story":"غلاف داخلي برازيلي من أرابيراكا، وحشوة من نيكاراغوا وجمهورية الدومينيكان وكولومبيا."},{"name":"Unapologetic","color":"#4A3728","force":null,"wrapper":"كونيتيكت برودليف","vitolas":[],"story":"غلاف داخلي سومطرة إكوادوري، وحشوة من نيكاراغوا والولايات المتحدة وجمهورية الدومينيكان؛ بمقاسات Corona Larga وToro وSublime وSixty، بعلب من عشر قطع."}]'
 WHERE `name` = 'Notorious' AND SHA1(TRIM(`gamme`)) = '832c7aab01ca776c3c6209f8f84ca7e801416c15';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Notorious' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '832c7aab01ca776c3c6209f8f84ca7e801416c15';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oettinger Davidoff' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
-- brands|Ohana|gamme|ar — liant = رابط, pas رباط
UPDATE `brands` SET `gamme_ar` = '[{"name":"Pulse Maduro","color":"#4A3728","force":"Medium-Full","wrapper":"San Andrés (المكسيك)","vitolas":[],"story":"غلاف San Andrés مكسيكي، ورابط وحشوة من نيكاراغوا، بقوة من متوسطة إلى كاملة، بحسب موقع Ohana Nui، في Robusto (5 x 50) وفي Toro box press (6 x 52)؛ ويعود إصدار maduro box press إلى تقديم عام 2016، بحسب Cigar Coop."},{"name":"Pulse Habano","color":"#8B5A2B","force":"Medium","wrapper":"Habano (الإكوادور)","vitolas":[],"story":"النسخة الأصلية من Pulse، التي قُدّمت عام 2016: غلاف Habano إكوادوري، ورابط وحشوة من نيكاراغوا (كونديغا وخالابا وأوميتيبي)، وRobusto (5 x 50) وToro (6 x 52)، بقوة متوسطة، بحسب Cigar Coop؛ ولم تعد مدرجة على موقع Ohana Nui في أكتوبر 2026، وتذكر Cigar Federation أنها نافدة."},{"name":"M13","color":"#A0522D","force":"Medium","wrapper":"Habano rosado","vitolas":[],"story":"غلاف Habano rosado، بقوة متوسطة، بحسب موقع Ohana Nui، في Toro (6 x 52)؛ والخط مدرج بالفعل ضمن تشكيلة العلامة في يوليو 2016، بحسب Cigar Coop، واسمه تكريم لجدة المالك، بحسب Stogiepress؛ ورابط نيكاراغوي بحسب الموقع، وSan Andrés مكسيكي بحسب Stogiepress في يناير 2026."},{"name":"Toasted Marshmallows","color":"#4A3728","force":"Medium","wrapper":"San Andrés (المكسيك)","vitolas":[],"story":"غلاف San Andrés مكسيكي، ورابط وحشوة من نيكاراغوا، بقوة متوسطة، بحسب موقع Ohana Nui، بمقاس 4 x 44؛ وتوجد نسخة Connecticut، ويعلن halfwheel عن إصدار 2024 في 30 أغسطس، ويضيف إصدار 2026 Super Exclusive 5 x 54 box press belicoso، محدودة بمئة علبة وخمسين bundles، بحسب Stogiepress."}]'
 WHERE `name` = 'Ohana' AND SHA1(TRIM(`gamme`)) = '8cddc511d02b0bbfd6d70ae4a7596291c5f07bed';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ohana' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '8cddc511d02b0bbfd6d70ae4a7596291c5f07bed';
-- brands|Oliva|gamme|ar — liant = رابط ; noms latins
UPDATE `brands` SET `gamme_ar` = '[{"name":"Serie V","color":"#8B0000","force":"Full","story":"الخط الرئيسي للدار؛ وتختلف سنة إطلاقه بحسب المصادر. غلاف من الإكوادور مزروع تحت الشمس، ورابط نيكاراغوي، وحشوة longfiller نيكاراغوية تتضمن ligero من خالابا، بحسب الدار؛ قهوة وشوكولاتة داكنة وتوابل رقيقة. وMelanio خط مستقل في صفحة الدار.","vitolas":["Robusto","Torpedo","Toro","Churchill","Double Toro","Melanio","Figurado"],"wrapper":"الإكوادور، مزروع تحت الشمس"},{"name":"Serie G","color":"#722F37","force":"Medium","story":"غلاف كاميروني فوق رابط وحشوة نيكاراغويين؛ وتصفها الدار بأنها متوسطة الجسم.","vitolas":["No.4","No.5","No.7","Belicoso","Torpedo"],"wrapper":"كاميروني"},{"name":"Nub","color":"#A0522D","force":"Medium","story":"فكرة سيجار قصير وعريض (نحو عشرة سنتيمترات، بقياسات حلقية تصل إلى 60)، وُلدت في مختبر الأفكار Studio Tobac التابع لأوليفا؛ وبحسب موقع متخصص، كانت الفكرة أن يُعطى السيجار كله النكهة التي تُوجد عادةً في الثلث الأخير (ويُنسب مصدر آخر الفكرة إلى Sam Leccia). سنة الإطلاق: 2008 بحسب مصدر واحد فقط.","vitolas":["358","460","464","Habano","Connecticut","Cameroon"],"wrapper":"Variable"},{"name":"Cuba Aliados","color":"#7A2E1E","force":"Medium-Full","story":"علامة لعائلة Reyes (هندوراس)؛ اشترت أوليفا العلامة المسجّلة في آب/أغسطس 2021 مع Puros Indios وRoly، وتحتفظ عائلة Reyes بنشاطها ومصنعها. وتقول أوليفا إنها تنقل الإنتاج من هندوراس إلى نيكاراغوا. انظر Reyes Family Cigars.","vitolas":[],"wrapper":"غير معلن"},{"name":"Puros Indios","color":"#6B4226","force":"Medium","story":"علامة لعائلة Reyes، ظهرت عام 1995 بحسب تعريف في الصحافة المتخصصة؛ واشترت أوليفا العلامة المسجّلة في آب/أغسطس 2021.","vitolas":[],"wrapper":"غير معلن"},{"name":"Roly","color":"#5B3A29","force":"Medium","story":"العلامة الثالثة في صفقة آب/أغسطس 2021.","vitolas":[],"wrapper":"غير معلن"}]'
 WHERE `name` = 'Oliva' AND SHA1(TRIM(`gamme`)) = '9c5f50d758befe5b930bd07d98a005f0d6622e93';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oliva' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '9c5f50d758befe5b930bd07d98a005f0d6622e93';
-- brands|Oliva Connecticut Reserve|gamme|ar — liant = رابط
UPDATE `brands` SET `gamme_ar` = '[{"name":"Connecticut Reserve","color":"#C9A96E","force":"Medium","story":"غلاف Connecticut إكوادوري، ورابط وحشوة من نيكاراغوا، بحسب صفحة الدار. جسم متوسط بحسب الدار؛ ومن لطيف إلى متوسط بحسب Stogie Review (2009). الأحجام التي ذكرتها Stogie Review عام 2009: Lonsdale وRobusto وToro وTorpedo وChurchill؛ وتعرض صفحة الدار أيضًا Toro Tubo 6 x 50.","vitolas":["Robusto","Toro","Churchill","Torpedo","Corona"],"wrapper":"Connecticut من الإكوادور"}]'
 WHERE `name` = 'Oliva Connecticut Reserve' AND SHA1(TRIM(`gamme`)) = '4679ec1e284286b7d1bce58709002a299d6e9c36';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oliva Connecticut Reserve' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '4679ec1e284286b7d1bce58709002a299d6e9c36';
-- brands|Oliva Serie G|gamme|ar — liant mal rendu
UPDATE `brands` SET `gamme_ar` = '[{"name":"Serie G","color":"#8B6914","force":"Medium","story":"غلاف من الكاميرون فوق رباط وحشوة من نيكاراغوا؛ جسم متوسط بحسب الدار، ونفحات من خشب الأرز والقهوة. تسعة مقاسات في أكتوبر 2026، من Special G إلى Churchill، منها Robusto 4.5 x 50 وTorpedo وBelicoso وFigurado وTubo.","vitolas":["No.4","No.5","No.7","Belicoso"],"wrapper":"كاميروني"}]'
 WHERE `name` = 'Oliva Serie G' AND SHA1(TRIM(`gamme`)) = '18da7f02b077a78a102f222f2678f48b4183473d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oliva Serie G' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '18da7f02b077a78a102f222f2678f48b4183473d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Omar Rodriguez' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '0904b24493d70b8c3f16dd2a2aaea20c46b213c8';
-- brands|Onyx|gamme|ar — سيجارة au lieu de سيجار
UPDATE `brands` SET `gamme_ar` = '[{"name":"Reserve","color":"#4A2C1A","force":"Medium-Full","wrapper":"Connecticut Broadleaf مُسوَّد","vitolas":[],"story":"غلاف Connecticut Broadleaf مُسوَّد فوق رباط نيكاراغوي وحشوة دومينيكية ونيكاراغوية وبيروية، بقوة من متوسطة إلى كاملة، بحسب الدار، في خمسة مقاسات: Robusto (5 x 50) وToro (6 x 50) وChurchill (7 x 50) وNo. 2 Belicoso (6 1/8 x 52) وTorbusto (5 1/2 x 60)."},{"name":"Bold Nicaragua","color":"#4A3728","force":"Full","wrapper":"San Andrés (المكسيك)","vitolas":[],"story":"غلاف San Andrés داكن فوق رباط نيكاراغوي وحشوة نيكاراغوية ودومينيكية، بحسب الدار التي تتحدث عن تبوغ نيكاراغوية معتّقة ما يزيد على أربع سنوات؛ في ثلاثة مقاسات هي Robusto (5 x 50) وToro (6 x 54) وMagnum (6 x 60)؛ وبقوة كاملة بحسب Payless Cigars and Pipes."},{"name":"Vintage Nicaragua","color":"#8B5A2B","force":"Medium-Full","wrapper":"Habano (نيكاراغوا، 2019)","vitolas":[],"story":"غلاف ورباط وحشوة من نيكاراغوا، بحسب الدار التي تقول إن الخط صُنع لدى A.J. Fernandez؛ وغلاف Habano من محصول 2019 بحسب Cigar Coop؛ في ثلاثة مقاسات هي Robusto (5 x 50) وToro (6 x 54) وMagnum (6 x 60)، في علب من عشرين سيجارًا؛ وبقوة من متوسطة إلى كاملة بحسب Cigars Direct."}]'
 WHERE `name` = 'Onyx' AND SHA1(TRIM(`gamme`)) = 'df4aa5f6c10257cb43647f8b5a76c7e2ccbe4968';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Onyx' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'df4aa5f6c10257cb43647f8b5a76c7e2ccbe4968';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ortega Cigars' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '2f7dc7957edab54605a09d7d3372d85246f704a6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oscar Valladares' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '0785f7ce1e99d3de3e3cf752ff9456bb1e75f4ab';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ozgener Family Cigars' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '5e3562191b237f197c9f83920f9a5dce830e6f47';
-- brands|Padilla|gamme|ar — noms propres en latin
UPDATE `brands` SET `gamme_ar` = '[{"name":"Padilla Miami","color":"#8B0000","force":"Full","wrapper":"هابانو إكوادوري","vitolas":["Robusto","Toro","Torpedo","Segundo"],"story":"السلسلة الواجهة، تُلَفّ في El Titan de Bronze بهافانا الصغيرة. غلاف هابانو إكوادوري فوق مزيج نيكاراغوي تزرعه Aganorsa."},{"name":"Padilla Signature 1932","color":"#4A2C1A","force":"Medium-Full","wrapper":"مزيج Padilla","vitolas":["Robusto","Toro"],"story":"السنة هي سنة مولد الشاعر Heberto Padilla. وهي من السلاسل التي أُعيد إنتاجها إلى ميامي."},{"name":"Padilla Habano","color":"#6B4226","force":"Medium-Full","wrapper":"هابانو","vitolas":["Robusto","Toro"],"story":"تلك الآتية من نيكاراغوا، ملفوفة في Tabacalera A.J. Fernández. الدار لا تعمل في ورشة واحدة، وبطاقتها لا توهم بغير ذلك."}]'
 WHERE `name` = 'Padilla' AND SHA1(TRIM(`gamme`)) = '163718322cdf4df4c1d2c8c2736e1aa3240ff861';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Padilla' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '163718322cdf4df4c1d2c8c2736e1aa3240ff861';
-- brands|Padrón|gamme|ar — noms de personnes en latin
UPDATE `brands` SET `gamme_ar` = '[{"name":"1964 Anniversary Series","color":"#8B0000","force":"Medium-Full","story":"أُطلقت عام 1994 بمناسبة مرور ثلاثين عامًا على الدار، بحسب padron.com، وكانت في البداية مكبوسة في الصندوق وفق التقليد الكوبي. غلاف مزروع تحت الشمس الكاملة، طبيعي أو مادورو، وتبغ معتَّق أربع سنوات. ستة عشر قياسًا (الطول بالبوصات x القطر)، منها Exclusivo 5½ x 50 وMonarca 6½ x 46 وTorpedo 6 x 52 وPresidente 6 x 50 وDiplomatico 7 x 50.","vitolas":["Exclusivo","Monarca","Torpedo","Presidente","Diplomatico"],"wrapper":"تحت الشمس، طبيعي/مادورو"},{"name":"Serie 1926","color":"#722F37","force":"Full","story":"أُطلقت عام 2002 بمناسبة عيد ميلاد José O. Padrón الخامس والسبعين، بحسب padron.com؛ ويؤرّخها مقال تعريفي نُشر عام 2014 بعام 2001، وهو العام الذي بلغ فيه الخامسة والسبعين (وُلد في يونيو 1926). وتحمل المجموعة سنة ميلاد José Orlando، كما تكتب Holt''s. تبغ معتَّق خمس سنوات، وغلاف مزروع تحت الشمس الكاملة، طبيعي أو مادورو، وعشرة قياسات: No.1 (6¾ x 54، الطول بالبوصات x القطر)، وNo.2 وNo.6 وNo.9 وNo.35 وNo.40 وNo.47 وNo.48 وNo.80 وNo.90.","vitolas":["No.1","No.2","No.6","No.9","No.35","No.40","No.47","No.48","No.80","No.90"],"wrapper":"تحت الشمس، طبيعي/مادورو"},{"name":"Padrón Series","color":"#A0522D","force":"Medium-Full","story":"Padrón Series، بحسب padron.com: خمسة عشر قياسًا بحشوة طويلة، توصف بأنها من متوسطة إلى قوية، من Cortico إلى Magnum، من تبغ مزروع تحت الشمس الكاملة معتَّق سنتين ونصفًا على الأقل. ومنها 2000 (5 x 50) و3000 (5½ x 52) و4000 (6½ x 54) و5000 (5½ x 56) و7000 (6¼ x 60).","vitolas":["2000","3000","4000","5000","6000","7000"],"wrapper":"تحت الشمس الكاملة"},{"name":"Dámaso","color":"#C04000","force":"Mild-Medium","story":"قُدّمت في IPCPR في يوليو 2015، بحسب Cigar Coop: وهي أول سيجار Connecticut من Padrón، ملفوف دائريًا وغير مكبوس، برابط وحشوة من نيكاراغوا. وتقول الدار إنها بغلاف Connecticut من الإكوادور، بطابع خفيف إلى متوسط، وتسمّي التشكيلة على اسم Dámaso Padrón، أول من وصل إلى كوبا من عائلة Padrón، من جزر الكناري، في أواخر القرن التاسع عشر؛ ويجعله Cigar Coop جدَّ José O. Padrón. القياسات: No.8 (5½ x 46) وNo.12 (5 x 50) وNo.15 (6 x 52) وNo.17 (7 x 54)، وقياسان من Red Label أشدّ قوةً هما No.32 وNo.34.","vitolas":["No.8","No.12","No.15","No.17","No.32","No.34"],"wrapper":"Connecticut من الإكوادور"}]'
 WHERE `name` = 'Padrón' AND SHA1(TRIM(`gamme`)) = 'b82bfd2ee3c22d313f75549540d0d8bfb253a575';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Padrón' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'b82bfd2ee3c22d313f75549540d0d8bfb253a575';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Partagás' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'ce290a06568c58f7c033e585a9ae75d936587d5a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Partagás USA' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '8851b6375c246e11eacd76855c1e7806a18ac70d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Patina Cigars' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'a72fa81972ba690ff74e47a30668d60cc8a65aa4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Patoro' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'd68f8d5a98daf9343651ee28938f5a05ab5b7550';
-- brands|Paul Garmirian|gamme|ar — société en latin
UPDATE `brands` SET `gamme_ar` = '[{"name":"PG Gourmet Series","color":"#8B5A2B","force":"Medium","wrapper":"مزيج دومينيكي، عند O.K. Cigars","vitolas":["Corona","Robusto","Churchill","Bombones"],"story":"سلسلة عام 1990، وُلدت مع الكتاب نفسه. كانت تقصد هافانا أواخر الخمسينيات، ومن هناك يأتي تحفّظها."},{"name":"PG Gourmet Series III","color":"#6B4226","force":"Medium-Full","wrapper":"مزيج دومينيكي، عند O.K. Cigars","vitolas":["Short Robusto","Toro"],"story":"الدورة الثالثة من السلسلة، أكثف من الأصل. وقد أحيت الدار ذكراها الثلاثين والخامسة والثلاثين بإصدارات من هذا الخطّ."}]'
 WHERE `name` = 'Paul Garmirian' AND SHA1(TRIM(`gamme`)) = 'eab3e8acc87453db05553b3e1c5d4e00f2084921';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Paul Garmirian' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'eab3e8acc87453db05553b3e1c5d4e00f2084921';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Paul Stulac Cigars' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'f4c93d81ceaf34297f9a8a841b2e40d0b91abacd';
-- brands|PDR Cigars|gamme|ar — sens omis, nom latin
UPDATE `brands` SET `gamme_ar` = '[{"name":"PDR 1878","color":"#6B4226","force":"Medium","wrapper":"غير معلن","vitolas":[],"story":"العلامة الأساس، سنة 2009 — أربعة أنواع، ومئة ألف سيجار بيعت في شهور قليلة."},{"name":"A. Flores 1975","color":"#7A2E1E","force":"Medium-Full","wrapper":"غير معلن","vitolas":[],"story":"سنة ميلاد المؤسّس، على الخطّ الموقّع باسمه — Serie Privada وGran Reserve."},{"name":"Flores y Rodríguez","color":"#8B5A2B","force":"Medium-Full","wrapper":"غير معلن","vitolas":[],"story":"بالشراكة مع شريك اسمه Luis. الاسم الذي تعرفه أدلّة التجّار خير معرفة."}]'
 WHERE `name` = 'PDR Cigars' AND SHA1(TRIM(`gamme`)) = '26b9179738f30e338770c30b94b0846b9bac7ae0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'PDR Cigars' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '26b9179738f30e338770c30b94b0846b9bac7ae0';
-- brands|Perdomo|gamme|ar — liant rendu غلاف داخلي
UPDATE `brands` SET `gamme_ar` = '[{"name":"Perdomo 20th Anniversary","color":"#1C0A00","force":"Medium-Full","story":"قُدِّمت في IPCPR 2012. سيجار نيكاراغوي خالص (puro) من بذرة كوبية، بغلافين Sun Grown وMaduro (وتضيف الدار اليوم نسخة Connecticut إكوادورية). تبغ معتَّق ثماني سنوات على الأقل، وتقضي الأغلفة 10 شهور (Sun Grown) أو 14 شهرًا (Maduro) في براميل البوربون؛ والقوة من متوسطة إلى قوية بحسب الدار في أكتوبر 2026. نهاية من خشب البلوط والأرز (Sun Grown)، ومن الشوكولاتة والإسبريسو (Maduro)، بحسب الدار أيضًا. القياسات: Robusto 5 x 56، وEpicure 6 x 56، وGordo 6 x 60، وTorpedo 6 1/2 x 54، وCorona Grande 6 1/2 x 48، وChurchill 7 x 56 (بالبوصة).","vitolas":["Robusto","Epicure","Gordo","Torpedo","Corona Grande","Churchill"],"wrapper":"Connecticut, Sun Grown, Maduro"},{"name":"Perdomo Habano Bourbon Barrel-Aged","color":"#8B4513","force":null,"story":"تشكيلة الدار بثلاثة أغلفة: Connecticut إكوادوري، وSun Grown وMaduro نيكاراغويان، فوق رباط وحشوة نيكاراغويين من بذرة كوبية. تبغ معتَّق ست سنوات على الأقل قبل المرور ببراميل البوربون: 8 شهور (Connecticut) و10 شهور (Sun Grown) و14 شهرًا (Maduro). القوة من خفيفة إلى متوسطة للـConnecticut، ومن متوسطة إلى قوية للغلافين الآخرين، بحسب الدار في أكتوبر 2026. القياسات من Habanito 4 x 38 إلى Churchill 7 x 54 (بالبوصة).","vitolas":["Habanito","Robusto","Epicure","Gordo","Torpedo","Churchill"],"wrapper":"Connecticut, Sun Grown, Maduro"},{"name":"Perdomo Reserve 10th Anniversary","color":"#6B3A1E","force":null,"wrapper":"Champagne, Sun Grown, Maduro","vitolas":[],"story":"تشكيلة بثلاث نسخ بحسب الدار في أكتوبر 2026: Champagne (غلاف Connecticut إكوادوري)، وSun Grown (10 شهور في براميل البوربون)، وMaduro (14 شهرًا)، فوق رباط وحشوة نيكاراغويين من بذرة كوبية، وتبغ معتَّق ست سنوات على الأقل. تسعة قياسات لـChampagne وستة للنسختين الأخريين."}]'
 WHERE `name` = 'Perdomo' AND SHA1(TRIM(`gamme`)) = '480cb5eb144b3ff115a457abdc7448f3afa3fd4b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Perdomo' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '480cb5eb144b3ff115a457abdc7448f3afa3fd4b';
-- brands|Perdomo Legacy Connecticut|gamme|ar — liant rendu غلاف داخلي
UPDATE `brands` SET `gamme_ar` = '[{"name":"Perdomo Legacy Ecuadorian Connecticut","color":"#C9A96E","force":"Medium","story":"خط الدار (perdomocigars.com، أكتوبر 2026): غلاف Ecuadorian Connecticut معتّق عشر سنوات ومرّ ثمانية شهور على الأقل في برميل بوربون، ورباط Nicaraguan Shade Grown، وحشوة نيكاراغوية من بذرة كوبية؛ والقوة Medium بحسب الدار. الأحجام: Robusto 5x54 وEpicure 6x54 وGran Belicoso 6x60 وGordo 6x60 وChurchill 7x54.","vitolas":["Robusto","Toro","Churchill","Torpedo"],"wrapper":"Connecticut من الإكوادور"}]'
 WHERE `name` = 'Perdomo Legacy Connecticut' AND SHA1(TRIM(`gamme`)) = '618670b7a469a0c5cf6b07e05657c577aa8e7a4d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Perdomo Legacy Connecticut' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '618670b7a469a0c5cf6b07e05657c577aa8e7a4d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Perla de Calvano' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '508aef1671ef4020332465f2bde167070f830c1f';
-- brands|Plasencia|gamme|ar — orthographe أوميتبي
UPDATE `brands` SET `gamme_ar` = '[{"name":"Alma Fuerte","color":"#8B0000","force":null,"story":"أول سيجار في سلسلة Alma، أُطلق عام 2016. سيجار نيكاراغوي خالص (puro) مبني على Criollo ''98، بتبغ من كونديغا وإستيلي وخالابا وأوميتيبي، صُنع لدى Plasencia S.A. في إستيلي (Cigar Coop، 2018). القياسات الموصوفة: Nestor IV (تورو مضغوط الشكل، 6 1/4 x 54)، وGeneración V (سالومون مضغوط الشكل)، وSixto II (سداسي)؛ وأُضيف قياس Robustus I (5 1/4 x 52) عام 2019. وتقدّم الدار هذه التشكيلة بغلافي colorado claro وoscuro.","vitolas":["Robustus Magnus","Toro Largo","Nestor IV","Generacion V","Sixto I"],"wrapper":"Colorado Claro أو Oscuro"},{"name":"Cosecha 146","color":"#722F37","force":null,"story":"أولى سلسلة Cosecha، وصلت إلى تجار التجزئة الأمريكيين في نوفمبر 2017 (Cigar Coop). يشير الاسم إلى الحصاد السادس والأربعين بعد المائة للعائلة، حصاد 2011-2012، محسوبًا منذ 1865؛ وهي ليست خلطة سنوية. خمسة قياسات: La Música (5 x 50)، وLa Vega (5 1/4 x 52)، وSan Luis (5 3/4 x 54)، وSan Agustín (تورنيدو، 6 1/4 x 52)، وMonte Carlo (6 x 58). وتقدّم الدار في أكتوبر 2026 Cosecha 149 وCosecha 151.","vitolas":["Robusto","Toro","Churchill","Torpedo"],"wrapper":"هندوراسي"},{"name":"Alma del Campo","color":"#A0522D","force":null,"story":"ثاني سيجار في سلسلة Alma، قُدِّم في IPCPR 2017، من تبغ نيكاراغوي تزرعه Plasencia؛ وتربطه الدار بوادي خالابا. القياس المذكور: Travesía (6 1/2 x 56).","vitolas":["Travesía","Candela","Toro"],"wrapper":"نيكاراغوا (خالابا)"}]'
 WHERE `name` = 'Plasencia' AND SHA1(TRIM(`gamme`)) = 'dced305a41240d1e3740d722c47f11787c62e015';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Plasencia' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'dced305a41240d1e3740d722c47f11787c62e015';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Pogar' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '7806ba128f1dbcb36024fd676095c73e0c8cac16';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Por Larrañaga' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '751aadd259f84dc8f3006baa7fde52db73bf6a25';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Por Larrañaga Dominicain' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
-- brands|Powstanie|gamme|ar — noms propres en latin
UPDATE `brands` SET `gamme_ar` = '[{"name":"Powstanie Habano","color":"#8B5A2B","force":"Medium-Full","wrapper":"هابانو إكوادوري","vitolas":[],"story":"مزجة Mike، اختارها الزبائن معصوبي الأعين — صدرت في أيّار/مايو 2015."},{"name":"Powstanie Maduro","color":"#3A2A1E","force":"Full","wrapper":"Broadleaf مادورو","vitolas":[],"story":"مزجة Greg — آب/أغسطس 2015."},{"name":"Powstanie San Andrés","color":"#4A3728","force":"Full","wrapper":"San Andrés (المكسيك)","vitolas":[],"story":"الغلاف المكسيكي، بقياس corona gorda خصوصًا."}]'
 WHERE `name` = 'Powstanie' AND SHA1(TRIM(`gamme`)) = 'a95ad8fab036f661bffb9f45dcc822a7b58e190a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Powstanie' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'a95ad8fab036f661bffb9f45dcc822a7b58e190a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Principle Cigars' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '851c07755f11ad1b6a2d64552fd428553344f558';
-- brands|Protocol|gamme|ar — société en latin
UPDATE `brands` SET `gamme_ar` = '[{"name":"Protocol","color":"#1F3A5F","force":"Medium-Full","wrapper":"مزيج نيكاراغويّ، في La Zona","vitolas":["Robusto","Toro","Lancero"],"story":"الخط المؤسِّس، خرج من La Zona عام 2015. أمّا اللانسيرو فجاء لاحقًا: قياس قلّما تُقدِم عليه العلامات الفتية، لأنّه لا يغفر خطأً في اللفّ."},{"name":"Probable Cause","color":"#3D2B1F","force":"Full","wrapper":"مادورو San Andrés","vitolas":["Robusto","Toro"],"story":"الغلاف المكسيكيّ من San Andrés، الذي يتتبّعه هذا الأطلس إلى واديه. والاسم مصطلح إجرائيّ: الأسباب المعقولة التي تُجيز التوقيف."},{"name":"Themis","color":"#C4A66B","force":"Medium","wrapper":"كونيتيكت إكوادوريّ","vitolas":["Robusto","Toro"],"story":"الوجه اللطيف للدار، تحت غلاف إكوادوريّ. وثيميس ربّة العدالة عند الإغريق — حاملة الميزان."}]'
 WHERE `name` = 'Protocol' AND SHA1(TRIM(`gamme`)) = '7ccb03fdc266ba263631115068a80ac59394117b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Protocol' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '7ccb03fdc266ba263631115068a80ac59394117b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Psyko Seven' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'f0f1cc9019af6cbc42e055263bb3ea44d6222438';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Punch' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '2d22b1708c99a8876ec8e7fbf3ce3ada07ad8a1e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Punch Honduras' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'f1088408c2bb779c46cddc1b27af232d2c9df6bb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Puros Artesanos Julio' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'ccd3595f359065c8934f29b338b72248b4f45422';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Quai d''Orsay' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '9de292369edb5e053c68039ac7dd806b70163887';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Quesada' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '73f002cf9f90539f40c356727fd9875b63e25a09';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Quintero' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '68e813536ad06905b4a5d9041d4b91b8b39cbf00';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rafael González' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '673a84dc178b3f34c2df9c5df51867d7fbce395b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ramón Allones' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'a2dd2e63956d8cffa2519a7d5a465d02c0533edc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Red Anchor' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'd470655d1479a29dc96b5bb95bd44ed1958b64d2';
-- brands|Regius|gamme|ar — كلمة محظورة، أسماء لاتينية
UPDATE `brands` SET `gamme_ar` = '[{"name":"Regius Black Label","color":"#1A1A1A","force":"Medium-Full","wrapper":"مزيج Plasencia","vitolas":["Robusto","Toro","Corona"],"story":"الخطّ الذي تعرف به السوق البريطانية هذه الدار، ويُلَفّ في إستيلي. والملصق الأسود هو علامتها البصرية."},{"name":"Regius Sun Grown","color":"#8B4A2B","force":"Full","wrapper":"غلاف شمسيّ","vitolas":["Robusto","Toro"],"story":"الوجه الأقوى، تحت غلاف نما بلا ظلّ. فالورقة الشمسية أسمك وأوفر غذاءً — تحمل نكهةً أوفر، وتحتمل التقريب أقلّ."},{"name":"Orchant Seleccion","color":"#5C4033","force":"Medium","wrapper":"مزيج Plasencia","vitolas":["Robusto","Toro"],"story":"صُنعت لـMitchell Orchant، من تاجر التجزئة اللندني C.Gars. حلقة متجر على سيجار علامة: عادة إنجليزية."}]'
 WHERE `name` = 'Regius' AND SHA1(TRIM(`gamme`)) = '2030f1fafc3ae17bc47b89828b073bfc7efa5ac1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Regius' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '2030f1fafc3ae17bc47b89828b073bfc7efa5ac1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Reinado' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '2b3d915446045bfb7481e652674d57ab80faff2f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Reyes Family Cigars' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '44d8f67c7b88e7336c17ed1d7d0b33e6dcc24fce';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rizona Baru' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '6c82fee336a88601aaf60d67a1691921ed13bfe0';
-- brands|Rocky Patel|gamme|ar — محظورات، سيجارات، أسماء لاتينية
UPDATE `brands` SET `gamme_ar` = '[{"name":"Vintage 1992","color":"#8B4513","force":"Medium-Full","story":"يشير الاسم إلى أصل أغلفة الخلطة الأولى، وقد جُنيت عام 1992 — لا إلى عمر التبغ المُباع اليوم. غلاف إكوادور كونيتيكت فوق تبغ هندوراسي ونيكاراغوي. بندق محمّص، كراميل، خشب فاتح. قوّة متوسطة-عالية متوازنة، وتبقى سلسلة Vintage من الطروحات الأشدّ سرديّةً في السوق: كل سنة تروي حصادًا.","vitolas":["Toro","Torpedo","Churchill","Robusto","Corona"],"wrapper":"Ecuador Connecticut"},{"name":"Fifty Years","color":"#722F37","force":"Full","story":"أُطلقت بمناسبة بلوغ Rocky Patel الخمسين — الرجل لا العلامة. خلطة هندوراسية-نيكاراغوية معقّدة، وغلاف إكوادوري مزروع في الشمس الكاملة. قهوة، توابل شرقية، أرض غابة. قياس تورو، 50 × 152 مم. مجموعة تبقى في ظلّ سلاسل Vintage، مع أنها تقول عن الدار قدر ما تقوله تلك.","vitolas":["Toro","Robusto","Churchill","Torpedo"],"wrapper":"مزروع في الشمس من الإكوادور"},{"name":"The Edge","color":"#A0522D","force":"Medium","story":"المجموعة السهلة لدى الدار. قياسا روبوستو وتورو، غلاف كونيتيكت، وتبغ هندوراسي ونيكاراغوي. نفحات ناعمة من القشدة والبندق. أول Rocky Patel للمبتدئ — سهل التناول، ثابت، مُجزٍ. وسعره في متناول الجميع.","vitolas":["Robusto","Toro","Torpedo","Corona","Gordo"],"wrapper":"Connecticut Shade"},{"name":"Hamlet","color":"#4A3728","force":"Medium-Full","story":"سيجار Hamlet Paredes، لفّاف Partagás السابق وسفير Habanos، الذي استُقدم سنة 2015 — Tabaquero أوّلًا، ثم Liberation و25th Year. غادر Paredes في آب/أغسطس 2022؛ وتحتفظ الدار بالاسم والخطوط، وأوقفت Tabaquero.","vitolas":[],"wrapper":"San Andrés (المكسيك)"},{"name":"Indian Tabac","color":"#8B5A2B","force":"Medium","story":"أوّل علامة لـRocky Patel، في التسعينيات، قبل أن تتّخذ الدار اسمه.","vitolas":[],"wrapper":"غير معلن"},{"name":"Bold by Nish Patel","color":"#4A3728","force":"Medium-Full","story":"أُطلق في 2013 على يد Nish Patel، شقيق Rocky Patel ونائب الرئيس التنفيذي في الشركة، في أعقاب إصداره الأول عام 2011؛ وفي مارس 2024 يذكر مقال لـ Premium Cigar Association أنه يتولى قيادة الخط، الذي يُنتَج في نيكاراغوا. تبغ من San Andrés ومن مزارع الشركة في نيكاراغوا تحت الغلاف الخارجي، بمقاسات Robusto (5½ x 50) وToro (6 x 52) وTorpedo (6⅛ x 52) وSixty (6 x 60)، بحسب rockypatel.com.","vitolas":[],"wrapper":"Connecticut Broadleaf Maduro"}]'
 WHERE `name` = 'Rocky Patel' AND SHA1(TRIM(`gamme`)) = '80e1b0795eac46ebf9a8d5c8573bb0a4c561ef17';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rocky Patel' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '80e1b0795eac46ebf9a8d5c8573bb0a4c561ef17';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rodrigo de Jerez' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'f1be98c7717ae0e0eb2d18236f302cebd9b70852';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rojas Cigars' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'e1c8563d44af939d61216160c5154d4658996b52';
-- brands|RoMa Craft Tobac|gamme|ar — كلمة محظورة، أسماء لاتينية
UPDATE `brands` SET `gamme_ar` = '[{"name":"CroMagnon","color":"#4A2C1A","force":"Full","wrapper":"كونيتيكت برودليف مادورو","vitolas":["Anthropology","Mandible","EMH"],"story":"السلسلة الأولى، وُلدت في مرآب Esteban Disla عام 2010. غلاف كونيتيكت برودليف مادورو، ورابط كاميروني، وحشوة نيكاراغوية."},{"name":"Aquitaine","color":"#8B4513","force":"Full","wrapper":"ليغيرو هابانو إكوادوري","vitolas":["Gran Perfecto","Mode 5","Knuckle Dragger"],"story":"نظيرة CroMagnon تحت غلاف من ليغيرو هابانو إكوادوري سميك زيتيّ. الرابط الكاميروني نفسه، مع فيسو وسيكو من ثلاث مزارع نيكاراغوية."},{"name":"Intemperance","color":"#A0522D","force":"Medium","wrapper":"كونيتيكت إكوادوري (EC XVIII) أو أرابيراكا برازيلي (BA XXI)","vitolas":["Virtue","Charity","Justice"],"story":"أيسر السلاسل منالًا، بغلافين للاختيار. رابط إندونيسي، وحشوات نيكاراغوية ودومينيكية — أشدّ مزائج الدار عالميّةً."},{"name":"Neanderthal","color":"#2E2018","force":"Full","wrapper":"San Andrés المكسيكي","vitolas":["HN","SGP","LH"],"story":"الأقوى في الكتالوج. غلاف San Andrés، ورابط كونيتيكت برودليف، وحشوات من كونديغا وإستيلي وخالابا وبويبلو نويفو، وأولور ليغيرو دومينيكي، وليغيرو مزدوج من بنسلفانيا يُدعى Green River Sucker One."},{"name":"Baka","color":"#6B4226","force":"Medium-Full","wrapper":"الكاميرون","vitolas":[],"story":"2019 — غلاف من الكاميرون، واسم شعب من غابات جنوب شرق ذلك البلد. نحو ألف علبة لكلّ قياس في السنة."}]'
 WHERE `name` = 'RoMa Craft Tobac' AND SHA1(TRIM(`gamme`)) = 'e42be00358a5e00fbff759b9a3cacfbb5c0ec583';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'RoMa Craft Tobac' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'e42be00358a5e00fbff759b9a3cacfbb5c0ec583';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Romeo y Julieta' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '3cf55eaedbae012b4218895dce7f56d4c5f41565';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Romeo y Julieta Dominicain' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '716a94f117e1f93b6a42466e1eaf853b3a36a490';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Romeo y Julieta USA' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '27f07418b3fb5f0a86107e7a4df5787670ee57ec';
-- brands|Room101|gamme|ar — أسماء شركات بالأحرف اللاتينية
UPDATE `brands` SET `gamme_ar` = '[{"name":"Johnny Tobacconaut","color":"#6B4226","force":"Medium-Full","wrapper":"مزيج A.J. Fernández","vitolas":["Robusto","Toro"],"story":"الخطّ المنتَج في Tabacalera A.J. Fernández بإستيلي، وله نسخة مادورو. وهو الذي يحمل الكتالوج منذ شراء Scandinavian Tobacco Group للعلامة."},{"name":"Farce Nicaragua","color":"#8B4513","force":"Medium","wrapper":"نيكاراغوا","vitolas":["Robusto"],"story":"يُلَفّ في Joya de Nicaragua، بخلاف Farce الأصلي الذي يخرج من ورشة أخرى. سيجاران واسم واحد ومصنعان: خلاصة طريقة عمل الدار."},{"name":"Big Payback","color":"#4A2C1A","force":"Medium","wrapper":"هندوراس","vitolas":["70s"],"story":"الخطّ الهندوراسي، يُصنع في HATSA — مصنع مجموعة Scandinavian Tobacco في هندوراس، وهو نفسه الذي وراء Bolívar Honduras."}]'
 WHERE `name` = 'Room101' AND SHA1(TRIM(`gamme`)) = '69a4a1b5c7d546eb33d8575fb17023572e9b3cbe';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Room101' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '69a4a1b5c7d546eb33d8575fb17023572e9b3cbe';
-- brands|Royal Jamaica|gamme|ar — اسم بلد مترجم
UPDATE `brands` SET `gamme_ar` = '[{"name":"Royal Jamaica Corona","color":"#8B7355","force":"Light-Medium","wrapper":"الكاميرون","vitolas":["Corona"],"story":"أرز وقشّ ونفحة شاي أسود. مقاس نحيل موروث عن الذائقة البريطانية، واحتراق سريع يستدعي سحباً بطيئاً — الطابع الذي تبنّاه المدخّنون الأميركيون المحرومون من الهافانا."},{"name":"Royal Jamaica Churchill","color":"#A0522D","force":"Medium","wrapper":"الكاميرون","vitolas":["Churchill"],"story":"المقاس الكبير للدار. اللطف نفسه، ممدوداً على ساعة ونصف — ذاك الذي كان يُقدَّم في فنادق مونتيغو باي."}]'
 WHERE `name` = 'Royal Jamaica' AND SHA1(TRIM(`gamme`)) = '0ac1ab9d3169347794d75f8e798217f2776504e9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Royal Jamaica' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '0ac1ab9d3169347794d75f8e798217f2776504e9';
-- brands|Saint Luis Rey|gamme|ar — توحيد وحدة مم
UPDATE `brands` SET `gamme_ar` = '[{"name":"Regios","color":"#8B0000","force":"Full","story":"Hermoso No. 4: 5 بوصات على cepo 48 (127 مم)، بحسب تاجر بريطاني يعدّه من المستوى 5 من 5، حشوة طويلة، totalmente a mano، من 40 إلى 50 دقيقة تدخين. قوة شديدة بالنسبة إلى العلامة (habanos.com).","vitolas":["Regios"],"wrapper":"Vuelta Abajo"}]'
 WHERE `name` = 'Saint Luis Rey' AND SHA1(TRIM(`gamme`)) = 'aebd0d138ea93eb4c24a0891981a0eaf77645e37';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Saint Luis Rey' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'aebd0d138ea93eb4c24a0891981a0eaf77645e37';
-- brands|Saint Luis Rey Honduras|gamme|ar — اسم شركة بحروف لاتينية
UPDATE `brands` SET `gamme_ar` = '[{"name":"Tabacales","color":"#7A4B2A","story":"تُصنع في جمهورية الدومينيكان في Tabacalera de García، خلافًا لعادة العلامة الهندوراسية."}]'
 WHERE `name` = 'Saint Luis Rey Honduras' AND SHA1(TRIM(`gamme`)) = 'ea5ba341ba512da7b994b7e68be90e1ce24fbef1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Saint Luis Rey Honduras' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'ea5ba341ba512da7b994b7e68be90e1ce24fbef1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Samana' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '94355366a5a73bd987b0c6473b1cf27f7366b261';
-- brands|San Cristóbal de La Habana|gamme|ar — توحيد وحدة مم
UPDATE `brands` SET `gamme_ar` = '[{"name":"El Príncipe","color":"#C9A227","force":"Mild-Medium","story":"الأقصر بين القياسات الأربعة لسنة 1999: 4 3/8 بوصة على cepo 42 (111 مم، واسم الـ galera هو Minuto)، بحسب ويكيبيديا. قوّة خفيفة إلى متوسطة للعلامة (habanos.com).","vitolas":["Minuto"],"wrapper":"Vuelta Abajo"},{"name":"El Morro","color":"#A0522D","force":"Mild-Medium","story":"7 1/4 بوصة على cepo 49 (184 مم، واسم الـ galera هو Paco)، بحسب ويكيبيديا؛ ويكتب أحد تجّار التجزئة أنّ هذا القياس أُوقف سنة 2013. قوّة خفيفة إلى متوسطة للعلامة (habanos.com).","vitolas":["Paco"],"wrapper":"Vuelta Abajo"},{"name":"La Fuerza","color":"#8B5A2B","force":"Mild-Medium","wrapper":"Vuelta Abajo","vitolas":[],"story":"5 1/2 بوصة على cepo 50 (140 مم، واسم الـ galera هو Gordito) بحسب ويكيبيديا؛ قياس خاصّ بالعلامة بحسب habanos.com."},{"name":"La Punta","color":"#9A6B3A","force":"Mild-Medium","wrapper":"Vuelta Abajo","vitolas":[],"story":"5 1/2 بوصة على cepo 52 (140 مم، واسم الـ galera هو Campana)، بحسب ويكيبيديا."}]'
 WHERE `name` = 'San Cristóbal de La Habana' AND SHA1(TRIM(`gamme`)) = 'e133722ef455296edd3b216888c7ac4d1e31ad3d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'San Cristóbal de La Habana' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'e133722ef455296edd3b216888c7ac4d1e31ad3d';
-- brands|Sancho Panza|gamme|ar — سيجارات خطأ، وحدة مم
UPDATE `brands` SET `gamme_ar` = '[{"name":"Belicosos","color":"#8B4513","force":"Medium-Full","story":"5 1/2 بوصة على cepo 52 (نحو 140 مم)، المقاس الإنتاجي المنتظم الوحيد للعلامة بحسب الصحافة المتخصصة (2025)، التي تصفه بأنه متوسط إلى شديد، بنكهات قريبة من الحلوى؛ ويصفه تاجر بريطاني بأنه متوسط إلى لطيف.","vitolas":["Belicoso"],"wrapper":"Vuelta Abajo"},{"name":"Molinos","color":"#C9A227","force":"Medium","story":"Molino، تذكره habanos.com واحداً من ثلاثة أصناف هافانية للعلامة وتصفه بأنه شهير؛ vitola الـgalera هي Cervantes. ولا تعطي صفحة الدار مقاسات ولا غلافاً.","vitolas":["Molino"],"wrapper":"Vuelta Abajo"}]'
 WHERE `name` = 'Sancho Panza' AND SHA1(TRIM(`gamme`)) = 'ddf92b7662036356fefccce558f72730fa6896c8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Sancho Panza' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'ddf92b7662036356fefccce558f72730fa6896c8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Santa Bras' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '4a5e2ee9dd808e7996efb94c9c1f59d8fe199f68';
-- brands|Santa Clara 1830|gamme|ar — كلمات محظورة، اسم لاتيني
UPDATE `brands` SET `gamme_ar` = '[{"name":"Santa Clara 1830","color":"#4A2C2A","force":"Medium","wrapper":"San Andrés Maduro","vitolas":["Robusto","Toro"],"story":"غلاف الوادي الداكن فوق حشوة مكسيكية: كاكاو وتراب وحلاوة تأتي من الورقة لا من معالجة. San Andrés من منبعه."},{"name":"Santa Clara Premier","color":"#5D4037","force":"Medium","wrapper":"San Andrés","vitolas":["Corona"],"story":"مقاس قصير ومزاج أجفّ، لمن يجد «المادورو» مفرطاً في التسكير. الأرض نفسها، باستدارة أقلّ."}]'
 WHERE `name` = 'Santa Clara 1830' AND SHA1(TRIM(`gamme`)) = '601f716fa9decc3efef0d8061f24f1ab988c3d2d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Santa Clara 1830' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '601f716fa9decc3efef0d8061f24f1ab988c3d2d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Santa Damiana' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '48a841eefbc489cb7218b1340a193330638bf8ca';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Schumacher' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '4c666691499457d47b392f913b3df9922156c0c5';
-- brands|Secret Blend of Cuba|gamme|ar — سيجارة بدل سيجارًا
UPDATE `brands` SET `gamme_ar` = '[{"name":"Secret Blend of Cuba","color":"#C9A96E","force":"Mild","wrapper":"Connecticut Shade (الإكوادور)","vitolas":[],"story":"غلاف Connecticut Shade من الإكوادور فوق رباط من إندونيسيا وحشوة دومينيكية مختلطة، تُلَفّ يدويًا لدى ABAM، بحسب Neptune Cigars، الذي يصفها بقوة خفيفة في بطاقته التقنية وبقوة من خفيفة إلى متوسطة في وصفه؛ في عبوات من عشرين سيجارًا أو بالوحدة، في أربعة مقاسات هي Churchill (6 3/4 x 48) وRobusto (5 x 48) وMareva (5 x 40) وCorona (6 x 46)، وكلها نافدة في أكتوبر 2026."}]'
 WHERE `name` = 'Secret Blend of Cuba' AND SHA1(TRIM(`gamme`)) = '25ce8f120b2c90e9f499566aed1e63822046f43e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Secret Blend of Cuba' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '25ce8f120b2c90e9f499566aed1e63822046f43e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Selected Tobacco' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
-- brands|Serino Cigar Co.|gamme|ar — اسم شخص بحروف لاتينية
UPDATE `brands` SET `gamme_ar` = '[{"name":"Serino Royale","color":"#6B4226","force":"Medium-Full","wrapper":"غير معلن","vitolas":[],"story":"الخطّ الأوّل، 2016، رُكّب بأربع أيدٍ لدى La Corona."},{"name":"Wayfarer","color":"#5B3A29","force":"Medium","wrapper":"غير معلن","vitolas":[],"story":"خطّ Carson، 2017."},{"name":"Taíno","color":"#8B5A2B","force":"Medium-Full","wrapper":"غير معلن","vitolas":[],"story":"شعب الكاريبي من قبل كولومبوس."}]'
 WHERE `name` = 'Serino Cigar Co.' AND SHA1(TRIM(`gamme`)) = 'f8a1710d6365e0177787665b81c42f739b247805';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Serino Cigar Co.' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'f8a1710d6365e0177787665b81c42f739b247805';
-- brands|Siglo de Oro|gamme|ar — اسم شخص بحروف لاتينية
UPDATE `brands` SET `gamme_ar` = '[{"name":"Evgueni Onéguine","color":"#8B2323","force":"Medium-Full","wrapper":"غير معلن","vitolas":[],"story":"بطل Pushkin على حزام — الخطّ الرئيسي للمصنع."},{"name":"Siglo de Oro","color":"#C9A96E","force":"Medium","wrapper":"غير معلن","vitolas":[],"story":"القرن الذهبي، بالإسبانية، على سيجار موسكوفي."}]'
 WHERE `name` = 'Siglo de Oro' AND SHA1(TRIM(`gamme`)) = '54bb03e3b7cd60bb82c9231709edb30e99a29de6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Siglo de Oro' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '54bb03e3b7cd60bb82c9231709edb30e99a29de6';
-- brands|Simon Beltre|gamme|ar — اسم صنف بحروف لاتينية
UPDATE `brands` SET `gamme_ar` = '[{"name":"CSZ","color":"#8B5A2B","force":"Full","wrapper":"إكوادور Habano H-2000","vitolas":[],"story":"ورقة رابطة Olor Dominicano، وحشوة من Semilla 2020 وSan Vicente وNegrito وSVM، يسمّيها موزّع روماني Swiss Chocolate؛ أشدّ قوةً وتماسكًا في البنية، وفق مستورد بريطاني."},{"name":"Andullo","color":"#4A2C1A","force":"Full","wrapper":"غير معلن","vitolas":[],"story":"معتّقة في أغلفة سعف النخيل الملكي وفق تقليد andullo الدومينيكي، بحسب مستورد بريطاني."}]'
 WHERE `name` = 'Simon Beltre' AND SHA1(TRIM(`gamme`)) = '62efc1b6b1a171bf056985ad5069cd3400f55a4d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Simon Beltre' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '62efc1b6b1a171bf056985ad5069cd3400f55a4d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Sindicato Cigar Group' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '81f7d9c47a8c5b62396ffbf670a8335b9d344363';
-- brands|Skull 77|gamme|ar — توحيد وحدة مم
UPDATE `brands` SET `gamme_ar` = '[{"name":"Colorado","color":"#8B5A2B","force":"Medium","wrapper":"الإكوادور H-2000","vitolas":[],"story":"الغلاف الخارجي H-2000 من الإكوادور، وهو colorado بحسب Cigarworld.de و rauchr.de، و colorado maduro بحسب Zigarrenversand.ch، والغلاف الداخلي من الإكوادور، والحشوة من جمهورية الدومينيكان ونيكاراغوا وبيرو، ملفوفة يدويًا باستخدام longfiller، في أربعة مقاسات: El Niño (83 مم × 58) و El Unico (140 مم × 58) و El Diablo (152 مم) و El Volcano (belicoso بمقاس 158 مم)؛ قوتها من المستوى 4 من 8 على مقياس Cigarworld.de، ومن المستوى 3 من 5 على مقياس Zigarrenversand.ch."}]'
 WHERE `name` = 'Skull 77' AND SHA1(TRIM(`gamme`)) = '98e8b43843698c94def6cb05d7a1f26087838b45';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Skull 77' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '98e8b43843698c94def6cb05d7a1f26087838b45';
-- brands|Southern Draw|gamme|ar — أسماء أشخاص، بيراكانثا
UPDATE `brands` SET `gamme_ar` = '[{"name":"Rose of Sharon","color":"#C9A96E","force":"Light-Medium","wrapper":"كونيتيكت إكوادوري","vitolas":["Robusto","Toro","Corona"],"story":"السلسلة التي تحمل اسم Sharon Holt. غلاف كونيتيكت إكوادوري ومزاج لطيف — وهي مدخل الكتالوج، وبها عُرفت الدار."},{"name":"Kudzu","color":"#4A2C1A","force":"Full","wrapper":"ملفوف عند A.J. Fernández","vitolas":["Robusto","Toro"],"story":"الكودزو نبتة متسلّقة غازية في جنوب الولايات المتحدة تغطّي كلّ ما تلمسه. وهو الوجه القويّ في الكتالوج، والاسم ليس محايدًا."},{"name":"Jacobs Ladder","color":"#3A2A20","force":"Full","wrapper":"ملفوف عند A.J. Fernández","vitolas":["Brimstone","Robusto"],"story":"أكثف السلاسل، ومقاساتها مسمّاة بمفردات توراتية — «برِمستون»، أي الكبريت. والدار تتبنّى هذه الصور."},{"name":"Quickdraw","color":"#8B5A2B","force":"Medium","wrapper":"غير معلن","vitolas":[],"story":"2015 — القياسات الصغيرة للدار، بعدّة أغلفة."},{"name":"Firethorn","color":"#B22222","force":"Medium-Full","wrapper":"هابانو إكوادوري","vitolas":[],"story":"2016 — شجيرة البيراكانثا في الجنوب الأمريكي، بغلاف هابانو إكوادوري."},{"name":"Desert Rose","color":"#8B1A6B","force":"Medium","wrapper":"غير معلن","vitolas":[],"story":"2018 — مهدًى لنساء عائلة Holt، كما تقول الدار."},{"name":"Fraternal Order","color":"#3E4A6B","force":"Medium-Full","wrapper":"غير معلن","vitolas":[],"story":"2019، لـCigars International أوّلًا، ثم وطنيًّا منذ 2020 — الأخويات، بحسب لون الحزام."}]'
 WHERE `name` = 'Southern Draw' AND SHA1(TRIM(`gamme`)) = '6c43e2a4dce5a79fcf3258371e30c9a2014a8826';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Southern Draw' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '6c43e2a4dce5a79fcf3258371e30c9a2014a8826';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Spartanos' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'eaf0831cb2fd4c6e7451d0cad9e443fb6d26d450';
-- brands|Stauffenberg|gamme|ar — caviste: بائع نبيذ
UPDATE `brands` SET `gamme_ar` = '[{"name":"Edition 1 (Pyramides)","color":"#A0522D","force":"Mild-Medium","wrapper":"Criollo 98 هندوراسي","vitolas":[],"story":"puro هندوراسي خالص — غلاف وورقة رابطة وحشوة من التبغ نفسه — بإصدار من 3000 سيجار، وصل إلى ألمانيا في مايو 2025."},{"name":"Edition 2 (Robusto)","color":"#A0522D","force":null,"wrapper":"Criollo هندوراسي","vitolas":[],"story":"puro هندوراسي بمقاس 5x54، متوفّر لدى بائع نبيذ ألماني منذ سبتمبر 2025."},{"name":"Edition 3 (Toro)","color":"#6B4226","force":"Full","wrapper":"غير معلن","vitolas":[],"story":"تُلفّ في دانلي، وأُعلن عن طرحها في نوفمبر 2025."}]'
 WHERE `name` = 'Stauffenberg' AND SHA1(TRIM(`gamme`)) = 'ad03669dca497674010cdcb931d3f96a983c287d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Stauffenberg' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'ad03669dca497674010cdcb931d3f96a983c287d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Stolen Throne' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '20a2f5294986e5ad31ae900a70404a57c3fe495c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Suerdieck' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '79220bf963e010c8f92b36eabc1458fb44b1fd65';
-- brands|Swag|gamme|ar — اسم علامة بحروف لاتينية
UPDATE `brands` SET `gamme_ar` = '[{"name":"Swag","color":"#3A3A3A","force":"Medium","wrapper":"مزائج دومينيكية بأغلفة متنوّعة","vitolas":["Robusto","Toro","Belicoso"],"story":"تُقدَّم في سلاسل يفرّق بينها اللون لا اسم الخطّ. الورشة نفسها التي لـAging Room، وعائلة التبغ نفسها، بمزاج مباشر وسعر أدنى."}]'
 WHERE `name` = 'Swag' AND SHA1(TRIM(`gamme`)) = '7844cdc8cd5578df23e52863c5ade76e5397abf6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Swag' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '7844cdc8cd5578df23e52863c5ade76e5397abf6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'SYN' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'b574cf78c4a921adefeb4fa339dc169655cf10ca';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'T. Sonthi' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '9ee2eeed2743f768fc2d8b65a1b56099b2f12d9c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacalera' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '29f6a44887fc15b9cea58ecef80bd44e828b4882';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacalera del Oriente' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '513d31c778383c43f97d191317585316078f9996';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacalera Palma' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '6ba4fe71141c6e5c79141299885a21cf97c916b4';
-- brands|Tabacalera R. Paxtián|gamme|ar — San Andrés en latin
UPDATE `brands` SET `gamme_ar` = '[{"name":"Del Paraíso","color":"#8B1A1A","force":"Medium","wrapper":"Negro San Andrés (فيراكروز)","vitolas":[],"story":"العلامة الأولى، 1994 — Elemental وEspecial وPremium وMexike، وFusión مكسيكية-نيكاراغوية."},{"name":"Privilegios","color":"#5C2E1E","force":"Medium-Full","wrapper":"Negro San Andrés (فيراكروز)","vitolas":[],"story":"Especial وPremium وSelecta — قمّة الدار."},{"name":"R. Paxtián","color":"#6B4226","force":"Medium","wrapper":"Negro San Andrés (فيراكروز)","vitolas":[],"story":"Premium وSecrets، باسم العائلة."}]'
 WHERE `name` = 'Tabacalera R. Paxtián' AND SHA1(TRIM(`gamme`)) = 'c27c024f816419fbc975a7ed5995d0a829eafb4c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacalera R. Paxtián' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'c27c024f816419fbc975a7ed5995d0a829eafb4c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacalera William Ventura' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '5c5b5299be2cf3d6528fb9d603b482e2dd371d96';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacosta' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'e2255fa1ee5b9975a3d9cccac2bdafa2a10f2d1a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabaqueria de Filipinas' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '84155020e95322919df3b3c003888dc448cd3a3a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tambor Essence' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'dc859a19568aee123191acf0c1dafc67f1d5cd64';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Taru Martani' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '10acbdb2046214f85bed08f0e8cb1d6304ed423a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tatuaje' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'b4228c3d7ca22842ae1c04c75a1a0bb874667ba2';
-- brands|Te Amo|gamme|ar — San Andrés en latin
UPDATE `brands` SET `gamme_ar` = '[{"name":"The Original San Andrés Valley Cigar","color":"#4A6B3A","force":"Medium","story":"إعادة الإطلاق في شباط/فبراير 2024: ثلاثة قياسات (Robusto وToro وMagnum)، وأطواق ذهبية وبيضاء وخضراء، سيجار مكسيكي خالص، وغلاف Habano Mexico San Andrés عمره ثلاث سنوات.","vitolas":[],"wrapper":"San Andrés"},{"name":"Te-Amo Revolution","color":"#7A2E1E","force":null,"story":"محاولة إعادة الإطلاق السابقة للعلامة، وآخر إصدار لها يعود إلى 2012.","vitolas":[],"wrapper":"غير معلن"}]'
 WHERE `name` = 'Te Amo' AND SHA1(TRIM(`gamme`)) = 'ecf4de623ea0f9f3e9ab6be2a5fbcc6605e3e377';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Te Amo' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'ecf4de623ea0f9f3e9ab6be2a5fbcc6605e3e377';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Teatro del Mundo' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'c3ee094fcd076a76b3e3ace1c377c85d9cf46dcd';
-- brands|Temple Hall|gamme|ar — marque Macanudo en latin
UPDATE `brands` SET `gamme_ar` = '[{"name":"Temple Hall Estate","color":"#8B4513","force":"Medium","wrapper":"كاميرون","vitolas":["Corona","Lonsdale"],"story":"خلطة المصنع الجامايكية الخاصة، أقوى من Macanudo الذي كان ينتجه في الورشة نفسها. خشب وجلد ولمسة تراب."},{"name":"Temple Hall No.625","color":"#A0522D","force":"Medium","wrapper":"كاميرون","vitolas":["Robusto"],"story":"مقاس قصير يُعاد إصداره بين حين وآخر، كذكرى لما كانته كينغستون."}]'
 WHERE `name` = 'Temple Hall' AND SHA1(TRIM(`gamme`)) = 'f25adcbbd50adc490b602738c6f3a198d419eddf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Temple Hall' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'f25adcbbd50adc490b602738c6f3a198d419eddf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'The Griffin''s' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '1f57a62d0d8d9e2df7a4d2183447d6ce153550e0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Toscano' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'e4471bb3132c03364e061333f722a5cb6c37fe25';
-- brands|Total Flame|gamme|ar — motard : دراجة نارية
UPDATE `brands` SET `gamme_ar` = '[{"name":"Dark Line","color":"#1F1F1F","force":"Full","wrapper":"غير معلن","vitolas":[],"story":"الخطّ الداكن — Old School وWorld Trip — لدى La Aurora."},{"name":"Bright Line","color":"#C9A96E","force":"Medium","wrapper":"غير معلن","vitolas":[],"story":"الخطّ الفاتح — 8 Ball وSpokes."},{"name":"Wild One","color":"#7A2E1E","force":"Medium-Full","wrapper":"غير معلن","vitolas":[],"story":"المتوحّش — اسمُ راكب دراجة نارية، مثل Off The Rails وFTW."}]'
 WHERE `name` = 'Total Flame' AND SHA1(TRIM(`gamme`)) = '110e0ebfd0f9f287195f1b002e8e69ab7c98ce64';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Total Flame' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '110e0ebfd0f9f287195f1b002e8e69ab7c98ce64';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Trinidad' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '61a7a895ef896836d712aa4678a24e4e4fbb1294';
-- brands|Trinidad USA|gamme|ar — noms propres en latin
UPDATE `brands` SET `gamme_ar` = '[{"name":"Trinidad Santiago","color":"#7B3F00","wrapper":"جمهورية الدومينيكان (نقي)","story":"سيجار دومينيكي نقي، خلطه José «Jochy» Blanco في مصنعه Tabacalera Palma بجمهورية الدومينيكان، من تبغ وادي سيباو. وقد أعاد Rafael Nodal ضبط الخلطة لصالح Altadis."},{"name":"Trinidad Espiritu No. 1","color":"#5D4037","wrapper":"نيكاراغوا (نقي)","story":"سيجار نيكاراغوي نقي، يُلفّ لدى A.J. Fernandez في إستيلي. وهو أول أجزاء سلسلة يستلهم كلّ جزء منها منطقة إنتاج مختلفة."},{"name":"Trinidad Espiritu No. 2","color":"#6D4C41","story":"الجزء التالي من السلسلة. يعلن الصانع عن غلاف وحشوة مختلفين عن الأول، دون أن يفصّلهما."},{"name":"Trinidad Espiritu No. 3","color":"#4E342E","story":"صدر عام 2024 من تبغ مكسيكي ونيكاراغوي، وهو الجزء المكسيكي من السلسلة."},{"name":"Trinidad x Tommy Bahama Island Collection","color":"#8D6E63","story":"سلسلة وُلدت من تعاون مع علامة الملابس Tommy Bahama."}]'
 WHERE `name` = 'Trinidad USA' AND SHA1(TRIM(`gamme`)) = '839d679ea926f2779824ceb94e246c33c42c0ff6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Trinidad USA' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '839d679ea926f2779824ceb94e246c33c42c0ff6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Umnum' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '9398ad2efe9734be4378baf3aae242ec54d1b8e8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Valentino Siesto' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '513d375f6955e36ddf809514d3a2c24fb2fb33ab';
-- brands|Vallejuelo|gamme|ar — San Andrés en latin
UPDATE `brands` SET `gamme_ar` = '[{"name":"Classic Vallejuelo","color":"#A0522D","force":"Medium-Full","wrapper":"Habano rosado إكوادوري","vitolas":[],"story":"الخلطة الأصلية، أُطلقت سنة 2008 من أجل السوق السويسرية، وفق الصانع."},{"name":"Vallejuelo Medio Tiempo","color":"#6B4226","force":"Full","wrapper":"San Andrés مكسيكي","vitolas":[],"story":"أقوى من Classic، بورق medio tiempo، وفق الصانع؛ بعلب من ثماني عشرة قطعة."}]'
 WHERE `name` = 'Vallejuelo' AND SHA1(TRIM(`gamme`)) = '987725b3a26af0e3583a97af339dd4337fb300a7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vallejuelo' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '987725b3a26af0e3583a97af339dd4337fb300a7';
-- brands|Van der Donk|gamme|ar — accord du nombre : تسعة
UPDATE `brands` SET `gamme_ar` = '[{"name":"Van der Donk","color":"#8B5A2B","force":"Mild-Medium","wrapper":"سومطرة أو البرازيل","vitolas":[],"story":"تسعة أشكال من السيجار الهولندي — أتبغة من كوبا والبرازيل وإندونيسيا."}]'
 WHERE `name` = 'Van der Donk' AND SHA1(TRIM(`gamme`)) = 'b2221fb5b3142d1e343b12b9a79cbac63ff51a7d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Van der Donk' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'b2221fb5b3142d1e343b12b9a79cbac63ff51a7d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vargas' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '3dfb9ab8d6e2507a7795a739694d6a5b9195e1f8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'VegaFina' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'a9b91b3497cea4350267ecb9f887b8e4fa5b3299';
-- brands|Vegas de Santiago|gamme|ar — nom de personne en latin
UPDATE `brands` SET `gamme_ar` = '[{"name":"Chaman","color":"#4A5D3A","force":"Medium-Full","story":"الاسم يعني الشامان؛ ويسمّيها موقع الدار أيضًا El Mystico. ويذكر الموقع غلافًا Connecticut من الإكوادور، ورباطًا من نيكاراغوا، وحشوة من كوستاريكا ونيكاراغوا؛ وتنسب صفحة أخرى من الدار الرباط إلى كوستاريكا ونيكاراغوا.","vitolas":["Robusto","Toro","Corona"],"wrapper":"Connecticut من الإكوادور"},{"name":"Reserva","color":"#6B4226","force":"Medium","story":"تكتب الدار أنّ أتبغتها تنضج ثلاث سنوات على الأقلّ قبل اللفّ، وأنّ سيجاراتها تستريح ثلاثة شهور في مخزن مكيَّف الهواء، ويحدّد Zechbauer أنّه غرفة أرز؛ وهذه الآجال سارية على جميع خطوطها، ولا تذكر صفحاتها أصول Reserva.","vitolas":["Robusto","Toro"],"wrapper":"غير معلنة"},{"name":"Don Luis","color":"#8B5A2B","force":"Medium-Full","story":"Gold Label على موقع الدار، الذي يذكر غلافًا Connecticut من الإكوادور ورباطًا من الإكوادور وحشوة من الكاريبي. وتسمّي Casagranda دون Luis Santana Lamas، الرئيس السابق للإنتاج في مصنع H. Upmann بكوبا، ويكتب Zechbauer أنّه عمل في الورشة حتى وفاته.","vitolas":["Robusto","Toro","Churchill"],"wrapper":"Connecticut من الإكوادور"},{"name":"El Puro (Red Label)","color":"#6B4423","force":null,"story":"إصدار خاص تقول الدار إنّه مصنوع بالكامل من تبغ مزروع في حقولها الخاصة، في الجبال البركانية من سانتياغو دي بوريسكال: غلاف ورباط وحشوة من كوستاريكا.","vitolas":[],"wrapper":"كوستاريكا، تقول الدار"}]'
 WHERE `name` = 'Vegas de Santiago' AND SHA1(TRIM(`gamme`)) = '0fd23656d6d40b4e45bfed721763754bde7ef310';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vegas de Santiago' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '0fd23656d6d40b4e45bfed721763754bde7ef310';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vegas Robaina' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'dc2427feb19ae0436fed1d649546bd584fd8a209';
-- brands|Vegueros|gamme|ar — Vuelta Abajo latin, مم cohérent
UPDATE `brands` SET `gamme_ar` = '[{"name":"Tapados","color":"#8B4513","force":"Medium-Full","story":"مقاس 46 x 120 مم بحسب habanos.com (تذكره الصحافة المتخصّصة 4 3/4 بوصة سنة 2014 و122 مم سنة 2018). تصف Habanos العلامة بقوة متوسطة إلى شديدة.","vitolas":["Tapados"],"wrapper":"Vuelta Abajo (بينار ديل ريو)"},{"name":"Mañanitas","color":"#A0522D","force":"Medium-Full","story":"الأقصر في المجموعة الحالية: 46 x 100 مم بحسب habanos.com. وتُباع سيجارات العلامة في علب معدنية من ستّ عشرة.","vitolas":["Mañanitas"],"wrapper":"Vuelta Abajo (بينار ديل ريو)"},{"name":"Entretiempos","color":"#6B4423","force":"Medium-Full","wrapper":"Vuelta Abajo (بينار ديل ريو)","vitolas":[],"story":"مقاس 52 x 110 مم بحسب habanos.com، أحد المقاسات الثلاثة في إعادة الإطلاق سنة 2013-2014."},{"name":"Centrofinos","color":"#4E3524","force":"Medium-Full","wrapper":"Vuelta Abajo (بينار ديل ريو)","vitolas":[],"story":"مقاس 50 x 130 مم، أعلنت عنه habanos.com في 25 مارس 2019 بوصفه قياس قطر كبيرًا للعلامة، بقوة متوسطة إلى شديدة، في علبة معدنية من ستّ عشرة."}]'
 WHERE `name` = 'Vegueros' AND SHA1(TRIM(`gamme`)) = 'd3808241d767dfd75cdd2acfba25ea2fcedab4f2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vegueros' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'd3808241d767dfd75cdd2acfba25ea2fcedab4f2';
-- brands|Viaje|gamme|ar — Aganorsa latin, sans أكثر
UPDATE `brands` SET `gamme_ar` = '[{"name":"Skull and Bones","color":"#2E2018","force":"Full","wrapper":"نيكاراغوا (Aganorsa)","vitolas":["Daisy Cutter","«؟»"],"story":"السلسلة الأوسع متابعةً في الدار، تُستأنف عامًا بعد عام بعناوين فرعية مختلفة. كلّ إصدار محدود ولا يُعاد طرحه كما هو."},{"name":"Oro وPlatino","color":"#8B7355","force":"Medium","wrapper":"نيكاراغوا (Aganorsa)","vitolas":["Reserva VOR"],"story":"السلسلتان الثابتتان الأصليّتان، من عام 2008. تُركتا في 2012 حين اختارت الدار الاقتصار على الإصدارات المحدودة — ولا تعودان إلا متقطّعتين."}]'
 WHERE `name` = 'Viaje' AND SHA1(TRIM(`gamme`)) = '0ededa02736204639c77ef53f1f764235f6ed483';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Viaje' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '0ededa02736204639c77ef53f1f764235f6ed483';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Villa Vieja' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '40fa5948182e419e932e163095f5bd0f0af9148e';
-- brands|Villiger|gamme|ar — villes traduites, Estelí etc.
UPDATE `brands` SET `gamme_ar` = '[{"name":"Villiger La Meridiana","color":"#2C1A0E","story":"سيجار puro نيكاراغوي بالكامل صدر في أوروبا عام 1998، ويستعيد اسم مصنع هافاني من القرن التاسع عشر، بحسب Cigar Coop وBlind Man''s Puff في مارس 2019؛ وتقول Cigar Coop حينئذٍ إنه يُلفّ لدى Joya de Nicaragua في إستيلي. ويذكر Cigarworld.de، وهو تاجر تجزئة ألماني، في أكتوبر 2026 غلافًا H-2000 ورباطًا Connecticut وحشوة، كلّها من نيكاراغوا، من نوع longfiller. وتعدّه Villiger من علامات مصنعها في إستيلي، الذي اكتمل بناؤه في نهاية سبتمبر 2021.","wrapper":"نيكاراغوا (H-2000)","force":null},{"name":"Cuéllar","color":"#5C3317","story":"سلسلة من ثلاث سيجارات دومينيكية، Connecticut Krēmē وBlack Forest وCaribe، تنتجها Tabacalera Palma، مصنع Jochy Blanco في جمهورية الدومينيكان، بحسب Cigar Coop في 2019 وفي يناير 2025 وفي مايو 2025. وBlack Forest، المعلن عنه في أكتوبر 2019، له غلاف maduro على رباط وحشوة دومينيكيين؛ وCaribe، المعلن عنه في 31 يناير 2025، له غلاف habano من الإكوادور على رباط وحشوة دومينيكيين، ويقول تاجر التجزئة Neptune Cigar في أكتوبر 2026 إنه يُصنع لدى Tabacalera La Palma.","wrapper":"Connecticut وMaduro وHabano","force":null},{"name":"Havana Club","color":"#7A2E1E","force":"Medium","story":"اسمُ علامة كوبية قديمة، أعادت Villiger إطلاقه سنة 2007 سيجارًا دومينيكيًّا، يُلفّ في ABAM، مصنع سانتو دومينغو الذي تقول Cigar Coop في مارس 2018 إنه مملوك لـJosé «Matias» Maragoto ومكلَّف بلفّ سيجارات Villiger الدومينيكية.","vitolas":[],"wrapper":"غير معلن"},{"name":"Dominico","color":"#C9A96E","force":"Mild-Medium","story":"خط من جمهورية الدومينيكان، تصفه صفحة الشركة في أكتوبر 2026 بأنه خفيف إلى متوسط وبسعر ميسور، عند المستوى 2 من 5 على سلّم Villiger، بخمسة مقاسات: Perla وCorona وRobusto وTorpedo وChurchill. ويذكر Cigarworld.de، وهو تاجر تجزئة ألماني، أنه ملفوف يدويًا من نوع longfiller لدى ABAM Cigars، ضمن bundles، بغلاف خارجي Connecticut Shade من إكوادور ورابط من إندونيسيا وحشوة Piloto من جمهورية الدومينيكان ومن نيكاراغوا؛ وتعود العلامة إلى مطلع سنوات 2000 بحسب هذا التاجر، الذي يُدرجها في فهرسه، بالنسبة إلى Corona، منذ 7 ديسمبر 2010.","vitolas":[],"wrapper":"Connecticut Shade (إكوادور)"},{"name":"Casa de Nicaragua","color":"#8B5A2B","force":"Medium-Full","story":"قُدّمت في 2014 على يد Villiger بحسب Cigarworld.de، الذي يُدرجها في فهرسه منذ 12 أغسطس 2014 ويقول إنها ملفوفة يدويًا من نوع mediumfiller، بغلاف خارجي H-2000 من إكوادور ورابط من إندونيسيا وحشوة من نيكاراغوا. وتعدّها Villiger من علامات مصنعها في إستيلي، الذي اكتمل في أواخر سبتمبر 2021؛ وفي أكتوبر 2026 تذكر صفحة الشركة خمسة مقاسات من أصل نيكاراغوا (Perla وCorona وRobusto وTorpedo وChurchill)، عند المستوى 4 من 5 على سلّمها.","vitolas":[],"wrapper":"إكوادور (H-2000)"},{"name":"La Libertad","color":"#8B5A2B","force":"Medium-Full","story":"ظهرت في مطلع سنوات 2000 لدى Liberty Cigar Company في ألمانيا، ثم انضمّت إلى مجموعة Villiger، وغادرت هندوراس، حيث كانت Plasencia تلفّها، ثم جمهورية الدومينيكان، حيث كانت ABAM تلفّها، إلى إستيلي: مزيج جديد بغلاف خارجي criollo من نيكاراغوا ورابط من سيباو الدومينيكي وحشوة نيكاراغوية من خالابا وإستيلي عُرض في يناير 2022 في معرض TPE في لاس فيغاس بمقاسات Corona وRobusto وGran Toro. وفي أكتوبر 2026 تُدرجها صفحة الشركة ضمن سيجاراتها المصنوعة يدويًا، بأربعة مقاسات (Gordito وRobusto وCorona وGran Toro)، عند المستوى 4 من 5 على سلّمها.","vitolas":[],"wrapper":"Criollo (نيكاراغوا)"},{"name":"La Capitana","color":"#C9A96E","force":"Mild-Medium","story":"أُعيد إطلاقها في 2025 بمزيج جديد، بغلاف خارجي Connecticut Shade من إكوادور ورباط من نيكاراغوا وحشوة من نيكاراغوا ومن جمهورية الدومينيكان، وأُعلن عنها في معرض PCA في أبريل 2025 بمقاسات Lonsdale (6 x 43) وRobusto (5 x 50) وToro (6 x 50) وChurchill (7 x 50)؛ وكانت النسخة السابقة بغلاف خارجي habano، بحسب تقرير في يوليو 2026. ويقول Cigarworld.de إنها ملفوفة يدويًا من نوع longfiller في إستيلي لدى Tabacalera Villiger de Nicaragua، في مباني Joya de Nicaragua، ويُدرجها في فهرسه منذ 28 أغسطس 2025؛ وفي أكتوبر 2026 تذكر صفحة الشركة Robusto وToro وChurchill، عند المستوى 2 من 5 على سلّمها.","vitolas":[],"wrapper":"Connecticut (إكوادور)"},{"name":"Corrida","color":"#8B5A2B","force":null,"story":"أُطلقت في أوروبا في مايو 2017 بنسختين: هندوراس (ملفوفة في دانلي على يد Nestor A. Plasencia، بحسب تقرير عن الإطلاق) وجمهورية الدومينيكان (صُنعت لدى ABAM، بحسب تقرير آخر)، بمقاسي Robusto+ (5 x 56) وToro+ (6 x 52). وفي أكتوبر 2026 تعرضها صفحة الشركة بأربعة بلدان منشأ هي هندوراس وجمهورية الدومينيكان ونيكاراغوا والبرازيل، عند المستويات 4 و2,5 و5 و3,5 من 5 على سلّمها، وتوجّهها إلى هواة السيجار الملفوف يدويًا؛ وتعدّ Villiger علامة Corrida من علامات مصنعها في إستيلي، الذي اكتمل في أواخر سبتمبر 2021.","vitolas":[],"wrapper":"غير معلن"},{"name":"Nicaroma","color":"#8B5A2B","force":"Medium-Full","story":"سلسلة قُدّمت في InterTabac 2023 في دورتموند بحسب Cigarworld.de، الذي يقول إنها ملفوفة يدويًا من نوع longfiller في إستيلي بالشراكة مع Joya de Nicaragua، بغلاف خارجي وحشوة من نيكاراغوا ورابط من إندونيسيا، ويُدرجها في فهرسه منذ 25 سبتمبر 2023 للمقاس 5 x 52. وفي أكتوبر 2026 تذكر صفحة الشركة ثلاثة مقاسات مسمّاة بأبعادها: 4 x 56 و5 x 52 و6 x 54، عند المستوى 4 من 5 على سلّمها؛ وكان عرض تمهيدي في أبريل 2013 قد قدّم بالفعل تحت هذا الاسم خطًا بثلاثة أغلفة خارجية.","vitolas":[],"wrapper":"نيكاراغوا"}]'
 WHERE `name` = 'Villiger' AND SHA1(TRIM(`gamme`)) = 'ba88f47fbf28493e52d4060456beff08e371efd5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Villiger' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'ba88f47fbf28493e52d4060456beff08e371efd5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Villiger Söhne' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Wangguan' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '28b73700d56314a7537f1a9242967b6a64ee806c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Warfighter Tobacco' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '1bab23a0ceea7ebd84d1271013dc4961ab7ba0c8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Warped' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '7f4ddb7032b5fd2de9b444bb1cd5fe996a455b78';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'West Tampa' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '2bfa65c376c98d555b63303e5f56ebe469f65d7a';
-- brands|Wolf & Ruhland|gamme|ar — bague : حلقة، pas حزام
UPDATE `brands` SET `gamme_ar` = '[{"name":"Virginia","color":"#C9A96E","force":"Mild","wrapper":"غير معلن","vitolas":[],"story":"السيجار الرفيع، علامة الدار — تقول المالكة إنّ رائحته كرائحة غابة بافاريا."},{"name":"Toccata Torpedo","color":"#6B4226","force":"Medium","wrapper":"غير معلن","vitolas":[],"story":"أكبر قياس، حلقته مكتوبة بخطّ اليد."}]'
 WHERE `name` = 'Wolf & Ruhland' AND SHA1(TRIM(`gamme`)) = '08f9ff9f36e03f39a12bd2ec3c8aedb646ff0e00';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Wolf & Ruhland' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '08f9ff9f36e03f39a12bd2ec3c8aedb646ff0e00';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Wolfertz' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '3f66687a9dce19034b688bce607ba1b3ba41075b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Xhaxhi Bobi' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '5982e297fdfbfcab7734973876dabe2d05cb0601';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Zigarren Manufaktur Dresden' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = '1a2fe2123131652661fd6e04254f71298a74a8ae';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Zino Platinum' AND `champ` = 'gamme' AND `lang` = 'ar' AND `source_hash` = 'bb6e126dd7d7fb388536220706a6158ae83a9a4e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Alec Bradley' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
-- brands|Arturo Fuente|celebrities|ar — noms de personnes en latin
UPDATE `brands` SET `celebrities_ar` = '[{"name":"Carlos Fuente Sr.","anecdote":"وُلد عام 1935، وصار المالك الوحيد للدار عام 1956، وافتتح مع ابنه، في 4 سبتمبر 1980، Fuente Ltd في سانتياغو بالجمهورية الدومينيكية، بعد الحريقين اللذين أصابا مصنعَي نيكاراغوا (1978) وهندوراس (1979)، بحسب arturofuente.com. توفي في أغسطس 2016 عن 81 عامًا؛ وتحمل تشكيلة Don Carlos اسمه."},{"name":"Carlos Fuente Jr.","anecdote":"المُلقَّب Carlito، ابتكر عام 1992 OpusX، وهو سيجار puro دومينيكي ينمو غلافه في Château de la Fuente قرب بوناو، وهي مزرعة غرست فيها العائلة أولى بذورها في مطلع التسعينيات. وأخته Cynthia Fuente-Suarez نائبة رئيس الدار."}]'
 WHERE `name` = 'Arturo Fuente' AND SHA1(TRIM(`celebrities`)) = '0cfaa9068d023975b9b810f8671705536337bb11';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Arturo Fuente' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '0cfaa9068d023975b9b810f8671705536337bb11';
-- brands|Ashton|celebrities|ar — سيجارات = cigarettes ; noms latins
UPDATE `brands` SET `celebrities_ar` = '[{"name":"Robert Levin","anecdote":"Levin تاجر تجزئة صار منشئ علامة: تتولّى عائلته Holt''s في فيلادلفيا منذ 1957، ويدير شؤونه منذ 1974، وأنشأ Ashton عام 1985، كما يقول holts.com. صُنع أول ما أنتجه من السيجار لدى Tabadom، ثم لدى Fuente، ابتداءً من 1988 بحسب قوله أو بعد الإطلاق بوقت قصير بحسب الدار؛ ويُلفّ سيجار Ashton اليوم في Tabacalera A. Fuente بالجمهورية الدومينيكية، عدا خط San Cristobal. علامة قائمة بالكامل على علاقة بطرف آخر، وهي لا تخفي ذلك."}]'
 WHERE `name` = 'Ashton' AND SHA1(TRIM(`celebrities`)) = '42f9869244041dedc9f4263acd460dfbfd6d8fc4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ashton' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '42f9869244041dedc9f4263acd460dfbfd6d8fc4';
-- brands|Avo|celebrities|ar — ville Beyrouth à traduire
UPDATE `brands` SET `celebrities_ar` = '[{"name":"Avo Uvezian","anecdote":"عازف بيانو وملحّن وُلد في بيروت عام 1926 وتوفي عام 2017 عن 91 عامًا. كان يؤكد أنه ألّف «Strangers in the Night»، المنسوبة إلى Bert Kaempfert (ويكيبيديا). وتروي Armenpress، نقلًا عن Men''s Journal، أنه عزف عام 1966 لحنًا أمام Sinatra، فطلب منه هذا الأخير تغيير العنوان والكلمات."}]'
 WHERE `name` = 'Avo' AND SHA1(TRIM(`celebrities`)) = '5d763ecbb141e7a576fc508d9c9a825719287629';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Avo' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '5d763ecbb141e7a576fc508d9c9a825719287629';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bolivar' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Camacho' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '4d1d8e0fda69d1c14229e2706b1d030580825ef6';
-- brands|Cohiba|celebrities|ar — marque et noms en latin
UPDATE `brands` SET `celebrities_ar` = '[{"name":"Fidel Castro","anecdote":"وُلدت Cohiba من أجل Castro، الذي قدّمها هديةً: ففي مقابلة عام 1994 يقول إنّه يهدي Cohiba في الغالب. وأقلع عن التدخين في 26 آب/أغسطس 1985، خلال حملة وطنية ضدّ التدخين، ليكون قدوة، كما أوضح."},{"name":"Che Guevara","anecdote":"يرتبط Che Guevara بالسيجار الكوبي، ولا سيّما بالصورة التي التقطها له René Burri عام 1963 لمجلة Look. وكان ذلك السيجار سيجارًا هافانيًا سابقًا للعلامة: Cohiba تعود إلى 1966، وكان Guevara قد غادر كوبا عام 1965 وأُعدم في بوليفيا في 9 تشرين الأول/أكتوبر 1967. وتكتب تقارير صحفية أنّ Castro أهدى أولى ما صُنع من السيجار مما صار Cohiba إلى مساعديه، ومنهم Che؛ ولا تقول صفحة Habanos الرسمية شيئًا عن ذلك."}]'
 WHERE `name` = 'Cohiba' AND SHA1(TRIM(`celebrities`)) = '03588b1e7af9f6f3bc2de78bd6dde1152bac230d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cohiba' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '03588b1e7af9f6f3bc2de78bd6dde1152bac230d';
-- brands|Cohiba USA|celebrities|ar — marque Cohiba en latin
UPDATE `brands` SET `celebrities_ar` = '[{"name":"المعركة القضائية حول Cohiba","anecdote":"يمتد النزاع بين Cubatabaco وGeneral Cigar منذ 1997: مكتب العلامات التجارية وTTAB، ومحكمة نيويورك (2004 و2009)، ومحكمة الاستئناف للدائرة الثانية (2005 و2010)، ومحكمة الاستئناف للدائرة الفيدرالية (2014)، والمحكمة العليا (رفض عام 2015)، ومحكمة شرق ولاية فيرجينيا (2025)، ثم محكمة الاستئناف للدائرة الرابعة."},{"name":"Jay-Z","anecdote":"عمل مغني الراب Shawn Carter، المعروف باسم Jay-Z، نحو عامين مع فريق مزج Cohiba على Comador، وهو toro بمقاس 6 x 52 بغلاف كونيتيكت من بذور هافانا، يُلفّ في جمهورية الدومينيكان وأُطلق في ديسمبر 2013؛ وسحبته Cohiba في 2016 مع صدور Macassar."}]'
 WHERE `name` = 'Cohiba USA' AND SHA1(TRIM(`celebrities`)) = '7b962f1d48e08c07b24b199195997515b5ca5daf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cohiba USA' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '7b962f1d48e08c07b24b199195997515b5ca5daf';
-- brands|Cuaba|celebrities|ar — titre resté en français
UPDATE `brands` SET `celebrities_ar` = '[{"name":"التاينو","anecdote":"Cuaba، بحسب الصحافة المتخصّصة، اسم تاينوي لشجيرة كان سكان الجزيرة يستخدمونها لإشعال سيجارهم؛ أمّا habanos.com فترى فيه كلمة هندية من زمن كريستوفر كولومبوس، شجيرة شديدة الاشتعال استُخدمت في الاحتفالات الدينية. استعادت علامة 1996 الكلمة للفيغورادو المزدوج."},{"name":"Carlos Izquierdo González","anecdote":"تذكره ويكيبيديا بوصفه مبتكر العلامة التي أُطلقت في 19 نوفمبر 1996 في لندن؛ ويُقال إنه صاغ الخلطة على غرار خلطة Montecristo، وهو ادّعاء تنقله الصفحة نفسها دون أن تؤكّده."}]'
 WHERE `name` = 'Cuaba' AND SHA1(TRIM(`celebrities`)) = 'd0288273f2dfc277b45088a03058e75645eb62f1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuaba' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = 'd0288273f2dfc277b45088a03058e75645eb62f1';
-- brands|Dannemann|celebrities|ar — nom de personne en latin
UPDATE `brands` SET `celebrities_ar` = '[{"name":"Gerhard Dannemann","anecdote":"مهاجر ألماني، مؤسس الدار في ساو فيليكس دا كاشويرا (سنة 1872 بحسب الدار، وسنة 1873 بحسب Wikipedia). وتذكر Wikipedia أنّ بلدية ساو فيليكس القديمة، Paço Municipal، اشتراها Geraldo Dannemann ثم هُيّئت للاستعمال البلدي."}]'
 WHERE `name` = 'Dannemann' AND SHA1(TRIM(`celebrities`)) = '5932bad9139da2cb0fc69e6491ceb741067eae89';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dannemann' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '5932bad9139da2cb0fc69e6491ceb741067eae89';
-- brands|Davidoff|celebrities|ar — noms de personnes en latin
UPDATE `brands` SET `celebrities_ar` = '[{"name":"Zino Davidoff","anecdote":"غادرت عائلته كييف إلى جنيف عام 1911، حيث افتتح Henri Davidoff متجرًا للتبغ. وابتكر Zino Davidoff عام 1968 في كوبا أول سيجار بحلقة بيضاء؛ وفي 1970 تولّت مجموعة Oettinger متجره في جنيف، تقول الدار. تُوفّي عام 1994."},{"name":"Winston Churchill (تحية)","anecdote":"استحوذت مجموعة Oettinger Davidoff في 2007 على الحقوق الحصرية لاسم Winston Churchill لسيجار، وأُطلق الخط في مايو 2008، تقول الدار."}]'
 WHERE `name` = 'Davidoff' AND SHA1(TRIM(`celebrities`)) = '7d8fa4067b1ee35805c3e0ce8e4a0fcc19673477';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Davidoff' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '7d8fa4067b1ee35805c3e0ce8e4a0fcc19673477';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Diplomáticos' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Drew Estate' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = 'bf54dbd74d91c89d0e1555e248ec5de10f6aa12b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Rey del Mundo' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '95ae8d240b382c8b2981fb5c178dee51bb46537d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Excalibur' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '6bb28ba9ff1c1e702754db29073db26b51f89670';
-- brands|Fonseca|celebrities|ar — ville Manzanillo à traduire
UPDATE `brands` SET `celebrities_ar` = '[{"name":"Francisco E. Fonseca","anecdote":"تسمّيه Habanos Don Francisco Fonseca، مؤسِّس العلامة في العقد الأخير من القرن التاسع عشر، أنيقًا يعنى بمظهره، وهو ما يُقال إنه نقله إلى تقديم Habanos التي يصنعها. وتقول ويكيبيديا، التي تستشهد بجريدة New York Times في 26 أكتوبر 1929، إنه وُلد في مانزانيو وتوفي في هافانا عام 1929."}]'
 WHERE `name` = 'Fonseca' AND SHA1(TRIM(`celebrities`)) = '5340c1e3a54138fb52ea9af1313f4d2985d5617e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fonseca' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '5340c1e3a54138fb52ea9af1313f4d2985d5617e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'General Cigar' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'H. Upmann' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '65b95cfdd7d1c1d01ced1a1d00d136375ab1aa99';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Hoyo de Monterrey' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = 'bcd23c2ce00902f7f6a433b09978fe031bf89e86';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Joya de Nicaragua' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = 'c2d230a082b813679d7595681cf14a985ea7068a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Flor Dominicana' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Gloria Cubana' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '6a8368b58323510764a6bc82a2a4b7e06cdfe2db';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Liga Privada' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '8e511add512ef54543b597148e7e24265cfae9bf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Macanudo' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '0be807a85e820020e07eab7bc42b7bef49c75b05';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Montecristo' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = 'ef78d8b23419876591a8bfab73293d1ce4706dd3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'My Father' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '1c811375200ae103abba812b0d8b96460979282e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oliva' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '2e24aa414d51b423774d80f9a19147811116cc87';
-- brands|Padrón|celebrities|ar — nom de personne en latin
UPDATE `brands` SET `celebrities_ar` = '[{"name":"José Orlando Padrón","anecdote":"وُلد في 10 يونيو 1926 في منطقة بينار ديل ريو، وغادر هافانا في أبريل 1961، ووصل إلى ميامي في فبراير 1962، وافتتح Padrón Cigars في سبتمبر 1964، بحسب padron.com. وظل المقرّ في ميامي، فيما انتقل الإنتاج إلى إستيلي في نيكاراغوا عام 1970. وتوفي في ديسمبر 2017 عن 91 عامًا؛ وكان ابنه Jorge، الذي دخل الشركة عام 1991، يديرها في نوفمبر 2021، بحسب صحافة المهنة."}]'
 WHERE `name` = 'Padrón' AND SHA1(TRIM(`celebrities`)) = 'f4be1e42e8cfe4078a6a272813641bf4f925c592';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Padrón' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = 'f4be1e42e8cfe4078a6a272813641bf4f925c592';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Partagás' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Partagás USA' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
-- brands|Perdomo|celebrities|ar — nom de personne en latin
UPDATE `brands` SET `celebrities_ar` = '[{"name":"Nick Perdomo","anecdote":"كان Nick Perdomo Jr. مراقبًا جويًّا في مطار ميامي حين افتتح Nick''s Cigar Co. في أغسطس 1992 دون أن يترك عمله، بحسب الصحافة المتخصصة (2001) وويكيبيديا."}]'
 WHERE `name` = 'Perdomo' AND SHA1(TRIM(`celebrities`)) = 'afaaa1487e24cda378a813ea45b073737a731df5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Perdomo' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = 'afaaa1487e24cda378a813ea45b073737a731df5';
-- brands|Plasencia|celebrities|ar — noms de personnes en latin
UPDATE `brands` SET `celebrities_ar` = '[{"name":"Néstor Plasencia","anecdote":"تقدّمه الدار بوصفه الجيل الرابع (Néstor Plasencia Fernández)، وقد تولّى عام 1986 عمليات التبغ للعائلة (Cigars Direct، 2020). وتقدّم الدار José Luis وGustavo وAlina وNéstor Andrés Plasencia بوصفهم الجيل الخامس. وتقول إنها تراقب الجودة بالزراعة وبالتصنيع معًا."}]'
 WHERE `name` = 'Plasencia' AND SHA1(TRIM(`celebrities`)) = '8883ec2cfff1cd7103be23f7c8e87791e85abc44';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Plasencia' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '8883ec2cfff1cd7103be23f7c8e87791e85abc44';
-- brands|Por Larrañaga|celebrities|ar — rue San Miguel à traduire
UPDATE `brands` SET `celebrities_ar` = '[{"name":"Rudyard Kipling","anecdote":"تذكر قصيدته The Betrothed علامتي Larrañaga وHenry Clay: There''s peace in a Larranaga, there''s calm in a Henry Clay. ويختلف تاريخ أول نشر بين الصفحات (1886 في مجلّد، و21 نوفمبر 1888 في صحيفة يومية هندية)."},{"name":"Ignacio Larrañaga","anecdote":"إسباني وصل إلى هافانا عام 1825، وسجّل الاسم عام 1834، بحسب ويكيبيديا وتاجر تجزئة بريطاني؛ وكان مصنعه الأول في شارع سان ميغيل."}]'
 WHERE `name` = 'Por Larrañaga' AND SHA1(TRIM(`celebrities`)) = '76cac516952f69294b3282c41cfcbd42fbb250a5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Por Larrañaga' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '76cac516952f69294b3282c41cfcbd42fbb250a5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Punch' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = 'd331d314beef4c02ab087b114c79d8fc7ef5f2a2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Quai d''Orsay' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '3817b52830ea8e9a7748357ea6e32fe0f58e206e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Quintero' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rafael González' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '9f22b9115cb05112212461452aef7d7082e7f9a9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ramón Allones' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = 'ef3e67d58e3c935c207ecac706f87c164f6c9f68';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rocky Patel' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
-- brands|Romeo y Julieta|celebrities|ar — سجائر : cigarettes ; nom latin
UPDATE `brands` SET `celebrities_ar` = '[{"name":"Winston Churchill","anecdote":"تكتب Habanos أنّ Winston Churchill كان من أشدّ مدخّني العلامة وفاءً: فمنذ زيارته هافانا عام 1946 استُعمل اسمه على بعض الحلقات، وأعطى اسمه لقياس Churchills، الذي يتصدّر قياسات العلامة شهرةً. وبحسب الصحافة المتخصّصة (1995) وصل إلى هافانا في نوفمبر 1895، وفي منطقة الكاريبي بدأ شغفه بالسيجار فعلًا، وكانت Romeo y Julieta من علاماته المفضّلة، وكان يدخّن عادةً من ثماني إلى عشر قطع سيجار في اليوم. وتتباين المصادر في تاريخ اسم القياس: أواخر عقد 1940 بحسب بعضها، وعقد 1950 بحسب بعضها الآخر (الصحافة المتخصّصة، 2018)."}]'
 WHERE `name` = 'Romeo y Julieta' AND SHA1(TRIM(`celebrities`)) = 'fd2fbab8ae38255dafa0b9a4337d4806e384a63b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Romeo y Julieta' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = 'fd2fbab8ae38255dafa0b9a4337d4806e384a63b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Romeo y Julieta USA' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
-- brands|San Cristóbal de La Habana|celebrities|ar — titre resté en français
UPDATE `brands` SET `celebrities_ar` = '[{"name":"هافانا نفسها","anecdote":"تستعيد علامة 1999 الاسم الأصلي للمدينة، الذي يعود إلى سنة 1519 بحسب صفحة الدار، وتحمل قياساتها الأربعة الأولى أسماء قلاع من هافانا: El Morro وLa Fuerza وLa Punta وEl Príncipe."}]'
 WHERE `name` = 'San Cristóbal de La Habana' AND SHA1(TRIM(`celebrities`)) = '4e111824b8b96193437afc128450cd235ff16711';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'San Cristóbal de La Habana' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '4e111824b8b96193437afc128450cd235ff16711';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Sancho Panza' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Santa Damiana' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacalera' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
-- brands|Te Amo|celebrities|ar — mot interdit : San Andrés latin
UPDATE `brands` SET `celebrities_ar` = '[{"name":"الأزتيك والتوتوناك","anecdote":"للتبغ تاريخ طويل في منطقة San Andrés Tuxtla؛ ولا تربط أي صفحة قُرئت بين الطقوس الأزتيكية والعلامة، ولذلك حُصرت الحكاية في المنطقة."}]'
 WHERE `name` = 'Te Amo' AND SHA1(TRIM(`celebrities`)) = '50e50d1ba379bcf888a9cd31bbef18c7b107badc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Te Amo' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '50e50d1ba379bcf888a9cd31bbef18c7b107badc';
-- brands|Trinidad|celebrities|ar — noms de personnes en latin
UPDATE `brands` SET `celebrities_ar` = '[{"name":"Fidel Castro","anecdote":"لا تذكره صفحة العلامة لدى Habanos بالاسم: فهي تكتب فقط أنّ Trinidad لم تُستعمل طويلًا إلا هدايا دولة لكبار الشخصيات الأجنبية. وتكتب الصحافة المتخصّصة (2019) أنّ السيجار لم يكن مصنوعًا للبيع بل ليهديه Fidel Castro. وبحسب ويكيبيديا، كان Avelino Lara، المسؤول السابق عن El Laguito، يقول عام 1992 إنّ Castro وحده كان مأذونًا له بإهدائه؛ وقال Castro إنه لم يُهدِ إلا Cohiba، وإنه، في سيرته الذاتية، لا يعرف Trinidad إلا قليلًا جدًّا."}]'
 WHERE `name` = 'Trinidad' AND SHA1(TRIM(`celebrities`)) = 'f2f0cd6900f0bf53b9f6316f4e75188e8cdb5df2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Trinidad' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = 'f2f0cd6900f0bf53b9f6316f4e75188e8cdb5df2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vegas Robaina' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = 'a496c07f9b279e1c4e307aab5f3660c908c7d3b3';
-- brands|Villiger|celebrities|ar — nom de personne en latin
UPDATE `brands` SET `celebrities_ar` = '[{"name":"Heinrich Villiger","anecdote":"انضم إلى الدار العائلية عام 1950، وخلف Hans عام 1954، وترأس مجلس إدارة Villiger Söhne حتى وفاته في 25 يوليو 2025 عن 95 عامًا (صفحة تاريخ الدار؛ zigarren.zone)."}]'
 WHERE `name` = 'Villiger' AND SHA1(TRIM(`celebrities`)) = '74ca6e37da814ec9cc9fbb7e283164c507ed95e4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Villiger' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '74ca6e37da814ec9cc9fbb7e283164c507ed95e4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Zino Platinum' AND `champ` = 'celebrities' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'A.J. Fernandez' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'd82e7ef776cd7010280c1a86703e68a60807fc82';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Aganorsa Leaf' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'd7f9bb831b2f920044bc34ee1b7ac4a5c708d515';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Aladino' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'cea6b19f4bd8a9bc730a6e999a627724aba84512';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Alec Bradley' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '52107d27435a7aaa176deee91adf6259893c05be';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Alhambra' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '709c1142bedea6e9cc84dc9038251d2c3586cf51';
-- brands|Arturo Fuente|pairings|ar — noms laissés en anglais
UPDATE `brands` SET `pairings_ar` = '[{"type":"مشروبات روحية","name":"كونياك Remy Martin XO","notes":"كونياك XO يردّد صدى مجموعة Añejo، التي تكتب الدار أن غلاف المادورو فيها يُعتَّق في براميل كونياك: توافق قائم على التشابه لا على التباين."},{"type":"النبيذ","name":"كابيرنيه Napa Valley، 10 سنوات","notes":"قوّة الكابيرنيه الكاليفورني تصمد أمام الـOpus X دون أن تطغى عليه. توافق بين ندّين."},{"type":"القهوة","name":"غيشا بنما","notes":"الطابع الزهري لغيشا بنما، حين تُقدَّم دون سكر، يمنح تباينًا في الخفّة مع OpusX."}]'
 WHERE `name` = 'Arturo Fuente' AND SHA1(TRIM(`pairings`)) = 'c457ac10e435e338ce87ad6264088927888d9ae0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Arturo Fuente' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'c457ac10e435e338ce87ad6264088927888d9ae0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Arturo Fuente Hemingway' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Arturo Fuente Maduro' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
-- brands|Ashton|pairings|ar — marques en latin ; 18 ans
UPDATE `brands` SET `pairings_ar` = '[{"type":"الشامبانيا","name":"Perrier-Jouët Belle Époque","notes":"رقّة Perrier-Jouët الزهرية ترافق أناقة الـCabinet Selection القشدية في توافق بالغ الرهافة."},{"type":"الويسكي","name":"Glenfiddich 18 سنة","notes":"نفحات الكمّثرى والجوز في Glenfiddich تتجاوب مع نعومة البندق في الـAshton Classic."}]'
 WHERE `name` = 'Ashton' AND SHA1(TRIM(`pairings`)) = 'e420a1bdb1031b68a5545b2c513e6fe316360216';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ashton' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'e420a1bdb1031b68a5545b2c513e6fe316360216';
-- brands|Ashton Cabinet|pairings|ar — marques en alphabet latin
UPDATE `brands` SET `pairings_ar` = '[{"type":"شمبانيا","name":"Billecart-Salmon Blanc de Blancs","notes":"نقاء شاردونيه الشمبانيا يرافق رهافة Ashton Cabinet الإكوادورية في تناغم بالغ الأناقة."}]'
 WHERE `name` = 'Ashton Cabinet' AND SHA1(TRIM(`pairings`)) = '829ef160562f7f67d2052c53185c1370eb29d943';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ashton Cabinet' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '829ef160562f7f67d2052c53185c1370eb29d943';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Atabey' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '9e5627f13de93a55ceb8c2dd3a2b8d52539d62df';
-- brands|Avo|pairings|ar — type resté en français
UPDATE `brands` SET `pairings_ar` = '[{"type":"الجاز","name":"Miles Davis, Kind of Blue","notes":"اقتراح للأجواء مع خط Classic، دون صلة موثّقة بالعلامة."},{"type":"القهوة","name":"قهوة دومينيكية من باراهونا","notes":"اقتراح: قهوة لطيفة ترافق خطًا خفيف القوام إلى متوسطه دون أن تغطي عليه."},{"type":"مشروبات روحية","name":"كونياك فتي","notes":"اقتراح: كونياك سلس لخط XO."}]'
 WHERE `name` = 'Avo' AND SHA1(TRIM(`pairings`)) = 'db02ba814963d87e6f9643ef742d0caa84e67b8b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Avo' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'db02ba814963d87e6f9643ef742d0caa84e67b8b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Baccarat' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '3f2a16ebf48b7e8856be55ba07ff74c772ccb4cd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bandolero' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '176ceefda33e8b8883e7ee414f63d72b73b3d71a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bering' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'fe813355a68aa64409237efefd9afc4b574845b6';
-- brands|Bolivar|pairings|ar — nom en anglais ; المسكرات
UPDATE `brands` SET `pairings_ar` = '[{"type":"مشروبات روحية","name":"مسكال حرفي من أواخاكا","notes":"دخان المسكال وترابه يترددان مع طابع Bolívar الأرضي. مرافقة جريئة، لمدخّنين محنّكين."},{"type":"القهوة","name":"قهوة إثيوبية بالمعالجة الطبيعية","notes":"النفحات الفاكهية المخمَّرة في قهوة المعالجة الطبيعية تلطّف قوّة Bolívar الخام. مرافقة غير متوقّعة."},{"type":"البيرة","name":"Imperial Stout 12%","notes":"شدّة الستاوت الإمبراطوري تجاري Belicosos Finos. مرافقة للموسم البارد."}]'
 WHERE `name` = 'Bolivar' AND SHA1(TRIM(`pairings`)) = '5f89666cb85a9badcc84c3d02fcee9c47809d9c2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Bolivar' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '5f89666cb85a9badcc84c3d02fcee9c47809d9c2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Byron' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'a89a46482814c8a88881300d3f0a1e447b40a6d1';
-- brands|Camacho|pairings|ar — nom laissé en anglais
UPDATE `brands` SET `pairings_ar` = '[{"type":"البوربون","name":"Bulleit Bourbon","notes":"البوربون عالي نسبة الشيلم، المتبَّل الجاف، ينسجم بطبيعته مع الكوروخو الهندوراسي. نفحات فلفل مشتركة بينهما."},{"type":"البيرة","name":"بورتر حرفي","notes":"عمق البورتر الأمريكي الشوكولاتي يكمّل نفحات القهوة المحروقة في الـCamacho Corojo."}]'
 WHERE `name` = 'Camacho' AND SHA1(TRIM(`pairings`)) = '3ea08238ca0a9c876946f51d761a1c3bc48ff15e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Camacho' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '3ea08238ca0a9c876946f51d761a1c3bc48ff15e';
-- brands|CAO|pairings|ar — nom laissé en anglais
UPDATE `brands` SET `pairings_ar` = '[{"type":"القهوة","name":"قهوة تركية","notes":"تحية إلى أصل المؤسِّس الإسطنبولي: قهوة كثيفة قوية، تنسجم مع سيجار شديد القوة."}]'
 WHERE `name` = 'CAO' AND SHA1(TRIM(`pairings`)) = '7573edd93163544f5e4c20b645de0c9f770a5bc3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '7573edd93163544f5e4c20b645de0c9f770a5bc3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO America' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO Black' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'CAO Cameroon' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Capitol' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
-- brands|Casa Turrent|pairings|ar — mot interdit retiré
UPDATE `brands` SET `pairings_ar` = '[{"type":"مشروبات روحية","name":"تكيلا ريبوسادو","notes":"أغاف «الريبوسادو» الخشبي يصمد أمام قوّة «1880» دون أن يحجبها."},{"type":"قهوة","name":"قهوة فيراكروس","notes":"تُزرع على المنحدرات ذاتها التي ينمو فيها التبغ: أشدّ التناغمات محلّيةً."}]'
 WHERE `name` = 'Casa Turrent' AND SHA1(TRIM(`pairings`)) = 'db1283f2678906e8b4a73e9b08afc99344090bc6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casa Turrent' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'db1283f2678906e8b4a73e9b08afc99344090bc6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Casdagli' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'd28bc5b356d2d2ba03c5ee58bc549a728dbd4ca9';
-- brands|Cohiba|pairings|ar — مصطلح موحد، علامة لاتينية
UPDATE `brands` SET `pairings_ar` = '[{"type":"مشروبات روحية","name":"Cognac Hennessy XO","notes":"نعومة الكونياك ترافق قوة Behike، الذي تقول الصفحة الرسمية لـHabanos إنّ قوته شديدة. مرافقة كلاسيكية للمناسبات الكبرى."},{"type":"الروم","name":"Ron Santiago de Cuba 12 سنة","notes":"المرافقة الطبيعية — منتجان كوبيان. نكهات القصب والتبغ في تناغم."},{"type":"القهوة","name":"قهوة كورتاديتو الكوبية","notes":"المرارة الناعمة للقهوة الكوبية ترافق جيدًا Siglo III بعد الطعام."}]'
 WHERE `name` = 'Cohiba' AND SHA1(TRIM(`pairings`)) = '074f1ece254c04bddebed59bcc6cace8b19d4f95';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cohiba' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '074f1ece254c04bddebed59bcc6cace8b19d4f95';
-- brands|Cohiba USA|pairings|ar — علامة تجارية بحروف لاتينية
UPDATE `brands` SET `pairings_ar` = '[{"type":"مشروب روحي","name":"Bourbon Maker''s Mark","notes":"المزاوجة الأمريكية الأصيلة لـ Red Dot. الفانيلا والكراميل في بوربون كنتاكي يُبرزان حلاوة الغلاف الكاميروني دون أن يطغيا على طابع متوسط القوة."},{"type":"بيرة","name":"آي بي إيه من شمال غرب المحيط الهادئ","notes":"مع Cohiba Blue، تمنح المرارة الزهرية لبيرة آي بي إيه المُضاف إليها الجنجل متأخرًا تباينًا لافتًا مع الجانب الكريمي للخلطة الهندوراسية."}]'
 WHERE `name` = 'Cohiba USA' AND SHA1(TRIM(`pairings`)) = 'fec3226cae5468f95181397ad39a0bb111a47858';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cohiba USA' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'fec3226cae5468f95181397ad39a0bb111a47858';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Crowned Heads' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '446e224d80be8c2ed5d45ea5f025fc138cf3c742';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Cuaba' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'b708999b636e1a8562ff209d0218b2e95e180298';
-- brands|Dannemann|pairings|ar — نوع واسم غير معرّبين
UPDATE `brands` SET `pairings_ar` = '[{"type":"كايبيرينيا","name":"كايبيرينيا كلاسيكية","notes":"مرافقة بالذوق، دون صفحة: قصب السكر في الكايبيرينيا لتبغ من باهيا."},{"type":"القهوة","name":"قهوة برازيلية مُرشَّحة (coado)","notes":"مرافقة بالذوق: قهوة ترشيح برازيلية، خفيفة."}]'
 WHERE `name` = 'Dannemann' AND SHA1(TRIM(`pairings`)) = 'dfe477fcd264c164245963eb69628e60da63fad8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dannemann' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'dfe477fcd264c164245963eb69628e60da63fad8';
-- brands|Davidoff|pairings|ar — أسماء علامات وأشخاص لاتينية
UPDATE `brands` SET `pairings_ar` = '[{"type":"الشامبانيا","name":"Dom Pérignon 2013","notes":"رهافة Dom Pérignon وتعقيده يرافقان مجموعات Davidoff الخفيفة في اقتران متكافئ الأناقة."},{"type":"الويسكي","name":"Dalmore King Alexander III","notes":"غنى Dalmore المشبَّع بالشيري ينسجم مع مجموعة Winston Churchill — تحيّتان للعظمة البريطانية."},{"type":"القهوة","name":"إسبريسو قصير قليل الحموضة","notes":"يرافق الإسبريسو القصير قليل الحموضة السيجار في ختام الوجبة عن طيب خاطر، بما في ذلك الخطوط الأشدّ قوةً مثل Nicaragua."}]'
 WHERE `name` = 'Davidoff' AND SHA1(TRIM(`pairings`)) = '16ba524a1026573b06d2d8a75d23e8d0f9ffe3de';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Davidoff' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '16ba524a1026573b06d2d8a75d23e8d0f9ffe3de';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Diplomáticos' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '52014876e5b9397dff6a103f73c6e2f1074dfbf7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Don Diego' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '4ff0ea66bde36e60f90d27e09b68afd6ad4735ef';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Dona Flor' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '7c20b602061d913499a6ef6a1bce5e96ec4a892c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Drew Estate' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '7ed7a97b369de2a590acc2c373aab65ee5363f17';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'E.P. Carrillo' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '68991e77a25288c404bbee25036bcf952c162651';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Rey del Mundo' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '872a7af861292ce3d595814a5ab62b1f7b790799';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'El Titan de Bronze' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '42b92cd5f8fd393c7080b8dee2c07fa73fd79c65';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Espinosa' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '25bbfdb1411908d1fed9206460d295f045d330c3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Excalibur' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Flor de Selva' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'a5718fce46cc771c2bff39a31896a07ab5ab1f8c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Fonseca' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'a92a3f9e833cfa0adeeed5339ffe7a6fd1ea1c13';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Foundation Cigar Company' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '87a816a9c5ecb3c139fb2aef7c1fa0e59f3987f0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'General Cigar' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'H. Upmann' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'd5630d5c17197c62a49d116b7069b9f5c1b1037f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Hoyo de Monterrey' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '13ee4c899778f66f1cb59ebc7e91eaf3f9949faa';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Hoyo de Monterrey Honduras' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'b22af74c5fce305f17ccd415eb60349b4d78657e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Illusione' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '6a04bd541a1152784815ae4db8aea71f7d0f5b3e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'J.C. Newman' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'e70cc0583ede440eb764e76ec0557aca0866e143';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'José L. Piedra' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '242b0d5520d1be0b50b0f31af4d4031b78f35664';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Joya de Nicaragua' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '622668e5055d6c669b1412fa7a394dc0b7df1b63';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Juan Clemente' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '999dfdde018ff3db30ecc2b1aa93f21189300b5d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Juan López' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '6788401e246653abfc05a5781256bb026e5d14f0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Aurora' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '701dd2838911362c63eeb197ffaf2743dedb63f3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Flor de Cano' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'c8e72b79bcd140b27858e4545d5fc5d4efe0cfab';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Flor de Copán' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '6c7bf9f62bb3e471c38196d4109458a55dc6df65';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Flor Dominicana' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'La Gloria Cubana' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'a6bb522880498401144ddfab60cef308c01caa1b';
-- brands|Liga Privada|pairings|ar — أسماء منتجات وأرقام خاطئة
UPDATE `brands` SET `pairings_ar` = '[{"type":"البيرة","name":"ستاوت إمبريال أمريكي","notes":"المرافقة الطبيعية — نفحات القهوة والشوكولاتة الداكنة في ستاوت إمبريال تلتحم بطابع الـNo.9. توافق من بارات أمريكا."},{"type":"الويسكي","name":"Pappy Van Winkle 15 سنة","notes":"البوربون الأمريكي الأعزّ منالًا مع السيجار الأمريكي الأعزّ منالًا. مرافقة هواة الجمع — منتجان لكلٍّ منهما قائمة انتظار."},{"type":"القهوة","name":"Cold Brew 24 ساعة","notes":"القهوة الباردة، وهي أقلّ حموضة من الإسبريسّو، تكشف في الـNo.9 نفحات فاكهية تحجبها عادةً عطور القهوة المحمّصة."}]'
 WHERE `name` = 'Liga Privada' AND SHA1(TRIM(`pairings`)) = '935a09c5daf44e6fa200bdbc2e17d55f12b999c4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Liga Privada' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '935a09c5daf44e6fa200bdbc2e17d55f12b999c4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Macanudo' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'e2ccaf8e748020e4996fac9c44becca49e7d5cd6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Matacan' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '0633ab577e7783e800ed40c91860594e20308479';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Matilde' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '4867501c32367daec13489345c5248158f305c17';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Meerapfel' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '527cb0396127dfa5b0017dc81f6118eb802e76cd';
-- brands|Mombacho|pairings|ar — غرناطة خطأ، ارتفاع القهوة
UPDATE `brands` SET `pairings_ar` = '[{"type":"مشروبات روحية","name":"روم غرانادا","notes":"تناغم محليّ بالمعنى الحرفي: المدينة والبحيرة والبركان والبرميل."},{"type":"قهوة","name":"قهوة نيكاراغوية من المرتفعات","notes":"حموضة قهوة المرتفعات ترفع ترابية الحشوة."}]'
 WHERE `name` = 'Mombacho' AND SHA1(TRIM(`pairings`)) = '33fc99eb90ae3e19908da0018e69133094725210';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Mombacho' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '33fc99eb90ae3e19908da0018e69133094725210';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Montecristo' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '78cd9b4a4ae21454eb256e958af3947a1ca10e48';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Montecristo Dominicain' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'bbc46832a377040ad4e11371a6d9176a9f5bc978';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Montecruz' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '84d39aeccb8bc50822ba0cc8bb63607b6a4c4f76';
-- brands|My Father|pairings|ar — العمر بالإنجليزية
UPDATE `brands` SET `pairings_ar` = '[{"type":"الروم","name":"Ron Flor de Caña Centenario 25 سنة","notes":"روم نيكاراغوي معتَّق: توافق تربة واحدة مع سيجار إستيلي، على نفحات من الكاكاو وقصب السكر."},{"type":"القهوة","name":"Nicaraguan Jinotega single origin","notes":"قهوة من خينوتيغا، في شمال البلاد؛ وتتوافق نفحاتها من الفواكه الداكنة والكاكاو مع الخلطات القوية."}]'
 WHERE `name` = 'My Father' AND SHA1(TRIM(`pairings`)) = '0d5edd5be188c0478c526b4f8b0f32010aea783d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'My Father' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '0d5edd5be188c0478c526b4f8b0f32010aea783d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Nat Sherman' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '3a5717cfa4cb26ece6d8a6b1e3871ba6851b2f3f';
-- brands|Oliva|pairings|ar — مصطلح البيرة، صيغة التفضيل
UPDATE `brands` SET `pairings_ar` = '[{"type":"الويسكي","name":"Buffalo Trace Bourbon","notes":"البوربون الأمريكي، بنفحات الفانيليا والبلوط المحمّص، يكمّل تمامًا القوّة الفلفلية في الـSerie V Melanio."},{"type":"البيرة","name":"Nicaraguan Toña Cerveza","notes":"البيرة المحلية، خفيفة ومنعشة، هي التوافق الأقرب إلى الحياة اليومية في نيكاراغوا — توافق نهاية النهار، في مناطق الزراعة نفسها."}]'
 WHERE `name` = 'Oliva' AND SHA1(TRIM(`pairings`)) = '18242ba5e6489a5bddeb7d6dd8e154092cebed95';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oliva' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '18242ba5e6489a5bddeb7d6dd8e154092cebed95';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oliva Connecticut Reserve' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'faa2c67041af561606e2a63cfaf33eeb3b53cc82';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Oliva Serie G' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
-- brands|Padrón|pairings|ar — مصطلح موحد وأعمار بالعربية
UPDATE `brands` SET `pairings_ar` = '[{"type":"مشروبات روحية","name":"Ron Flor de Caña 18 سنة","notes":"يرافق روم نيكاراغوي معتَّق سيجارًا لُفّ بتبغ من نيكاراغوا: توافق بلدٍ واحد، يُقدَّم صافيًا أو مع مكعّب ثلج."},{"type":"الويسكي","name":"Macallan Sherry Oak 18 سنة","notes":"يُطيل شيري Macallan نفحات الحلاوة في غلاف المادورو: توافق مقترح مع 1964 Anniversary مادورو."},{"type":"القهوة","name":"Nicaragua Single Origin","notes":"قهوة أحادية المنشأ من نيكاراغوا، قليلة المرارة، ترافق سيجارًا من المنشأ نفسه: توافق بلدٍ واحد، أخفّ من المشروبات الروحية."}]'
 WHERE `name` = 'Padrón' AND SHA1(TRIM(`pairings`)) = '78bc8b86a13eef9d711a16dae55c1a120c7d5fde';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Padrón' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '78bc8b86a13eef9d711a16dae55c1a120c7d5fde';
-- brands|Partagás|pairings|ar — أسماء المنتجات بالإنجليزية
UPDATE `brands` SET `pairings_ar` = '[{"type":"مشروبات روحية","name":"Armagnac Bas-Armagnac 20 سنة","notes":"العمق الترابي في الأرمانياك المعتَّق يتجاوب مع الجانب الريفي القوي في الـSerie D. توافق لأهل المعرفة."},{"type":"البيرة","name":"بورتر أيرلندي","notes":"مفاجئ لكنه فعّال — الحبوب المحمّصة في الستاوت الأيرلندي تضاعف نفحات الكاكاو في الـSerie D."},{"type":"الشاي","name":"بوإر معتّق 10 سنوات","notes":"شاي البوإر المخمَّر، الترابي العميق، توافق شاي ممكن مع Partagás: كلاهما يلعب على سجلّ ترابي."}]'
 WHERE `name` = 'Partagás' AND SHA1(TRIM(`pairings`)) = 'ca7f2f61681f737e8e1bffbce24541135bbf7c34';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Partagás' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'ca7f2f61681f737e8e1bffbce24541135bbf7c34';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Partagás USA' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'e7c6f3a7c930172fb9adcd2290bef27276bf0150';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'PDR Cigars' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'b2f2a5f511482ccda20ccde5cf83aa19054b7853';
-- brands|Perdomo|pairings|ar — تناول بدل توافق
UPDATE `brands` SET `pairings_ar` = '[{"type":"الويسكي","name":"سكوتش وبوربون","notes":"توافق مقترح من الدار مع 20th Anniversary Sun Grown (perdomocigars.com، أكتوبر 2026)."},{"type":"النبيذ","name":"كابيرنيه سوفينيون","notes":"توافق مقترح من الدار مع 20th Anniversary Maduro (perdomocigars.com، أكتوبر 2026)."},{"type":"القهوة","name":"قهوة ساخنة","notes":"توافق مقترح من الدار مع 20th Anniversary Connecticut (perdomocigars.com، أكتوبر 2026)."}]'
 WHERE `name` = 'Perdomo' AND SHA1(TRIM(`pairings`)) = 'e045115ae01c04e2f2b81a29206fc5b3e1f0e119';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Perdomo' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'e045115ae01c04e2f2b81a29206fc5b3e1f0e119';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Perdomo Legacy Connecticut' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
-- brands|Plasencia|pairings|ar — تناول بدل توافق
UPDATE `brands` SET `pairings_ar` = '[{"type":"الروم","name":"Flor de Caña 25 سنة","notes":"اقتراح توافق: روم نيكاراغوي معتَّق، مع Alma Fuerte، وهو سيجار نيكاراغوي."},{"type":"القهوة","name":"قهوة ماركالا (هندوراس)","notes":"اقتراح توافق: قهوة هندوراسية من ماركالا، مع Cosecha، وهو سيجار من هندوراس."}]'
 WHERE `name` = 'Plasencia' AND SHA1(TRIM(`pairings`)) = '7e487853b0fbae9e98b80a62d41f2fa492d3d55a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Plasencia' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '7e487853b0fbae9e98b80a62d41f2fa492d3d55a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Por Larrañaga' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'cb23d1d194fa2965541bd37d147f77087e8b366c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Punch' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '069ae1621f8dfd2f7f7603b17590d5e1865466ff';
-- brands|Punch Honduras|pairings|ar — يدّعي بدل يعتزّ
UPDATE `brands` SET `pairings_ar` = '[{"type":"مشروبات روحية","name":"روم هندوراسي","notes":"تناغم بلد واحد، مع سيجار يعتزّ بأرضه حتى في حشوته."},{"type":"قهوة","name":"قهوة سوداء","notes":"فلفل الخلطة يحتمل تحميصاً صريحاً."}]'
 WHERE `name` = 'Punch Honduras' AND SHA1(TRIM(`pairings`)) = 'f3577aa51ddaa5cd8f51b8f708b37cb9b15e9f52';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Punch Honduras' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'f3577aa51ddaa5cd8f51b8f708b37cb9b15e9f52';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Quai d''Orsay' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '130f90f456287a7b2a3176bac667c45fa69dca61';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Quesada' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '7c4132c9a6522c228e003f420da88af8853cb25f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Quintero' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'a8cd15e0c28597dc08fe41ad972a6e648478a49b';
-- brands|Rafael González|pairings|ar — ترجمة خاطئة لـ flush
UPDATE `brands` SET `pairings_ar` = '[{"type":"شاي","name":"دارجيلينغ Second Flush","notes":"اقتراح: شاي خفيف لعلامة مصنّفة في القوة الخفيفة."},{"type":"مشروبات روحية","name":"شيري أمونتيادو","notes":"اقتراح: شيري جاف لا يطغى على سيجار خفيف."}]'
 WHERE `name` = 'Rafael González' AND SHA1(TRIM(`pairings`)) = 'bac6ed00d0f8aebb9393d6819f506407cb2700ae';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rafael González' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'bac6ed00d0f8aebb9393d6819f506407cb2700ae';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Ramón Allones' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'b826f016c90f1ca8f3432d9abf60f1a2794dd8b2';
-- brands|Rocky Patel|pairings|ar — اسم بالإنجليزية بدل العربية
UPDATE `brands` SET `pairings_ar` = '[{"type":"البوربون","name":"Maker''s Mark","notes":"بوربون Maker''s Mark، الناعم ذو طابع الفانيليا، يرافق سلسلة Vintage على أتمّ وجه — منتجان يُبرزان التعتيق دون أن يرهبا أحدًا."},{"type":"النبيذ","name":"مالبيك أرجنتيني","notes":"بنية المالبيك الفاكهية المتبَّلة تكمّل طابع الـFifty Years جيدًا. توافق من الأمريكتين."}]'
 WHERE `name` = 'Rocky Patel' AND SHA1(TRIM(`pairings`)) = 'b1f7b4da318ec028bee3c7d36758dcd928380931';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Rocky Patel' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'b1f7b4da318ec028bee3c7d36758dcd928380931';
-- brands|Romeo y Julieta|pairings|ar — العمر بالإنجليزية
UPDATE `brands` SET `pairings_ar` = '[{"type":"الشامبانيا","name":"Bollinger R.D.","notes":"اقتراح توافق مع Churchills (47 x 178 مم)، من علامة تصفها Habanos بأنها الـHabano الكلاسيكي ذو النكهة المتوسطة."},{"type":"الويسكي","name":"Springbank 12 سنة","notes":"اقتراح توافق مع Wide Churchills (قياس حلقي 55 x 130 مم)، من علامة تصفها Habanos بأنها ذات نكهة متوسطة."},{"type":"الشاي","name":"Darjeeling First Flush","notes":"اقتراح توافق مع Petit Churchills (قياس حلقي 50 x 102 مم)، نحو عشرين دقيقة من الدخان بحسب Habanos."}]'
 WHERE `name` = 'Romeo y Julieta' AND SHA1(TRIM(`pairings`)) = 'ae60a97cc30201e8cf00bc806e85b8ff69eb9c31';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Romeo y Julieta' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'ae60a97cc30201e8cf00bc806e85b8ff69eb9c31';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Romeo y Julieta Dominicain' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '253da7fb51d8a3784672a5a5f2a25f3c3b8f3456';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Romeo y Julieta USA' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Royal Jamaica' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '27fe0f7602991efff6018b8d2543f6abde1db19c';
-- brands|Saint Luis Rey|pairings|ar — مخثّث خطأ لغوي
UPDATE `brands` SET `pairings_ar` = '[{"type":"مشروبات روحية","name":"ويسكي آيلا الغني بالخثّ","notes":"اقتراح: مشروب روحي ذو شخصية لسيجار شديد القوة."},{"type":"بيرة","name":"ستاوت جافّ","notes":"اقتراح: بيرة محمّصة قليلة الحلاوة لسيجار شديد القوة."}]'
 WHERE `name` = 'Saint Luis Rey' AND SHA1(TRIM(`pairings`)) = '1ded2d9b4018042b2cabe901d4f0cc5c1b99f789';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Saint Luis Rey' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '1ded2d9b4018042b2cabe901d4f0cc5c1b99f789';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'San Cristóbal de La Habana' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '5daa50f6c7ace1a6c03f828e02dec464bbae9aba';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Sancho Panza' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '55c30ff7119d4a5d6463f7e7dc142fd1ab7c490b';
-- brands|Santa Clara 1830|pairings|ar — اسم مكان واللفظ الممنوع
UPDATE `brands` SET `pairings_ar` = '[{"type":"مشروبات روحية","name":"ميسكال","notes":"دخانية الميسكال وترابية San Andrés تأتيان من المشهد البركاني نفسه."},{"type":"أخرى","name":"شوكولاتة مكسيكية بالقرفة","notes":"كاكاو الغلاف يجد هنا امتداده الأشدّ مباشرةً."}]'
 WHERE `name` = 'Santa Clara 1830' AND SHA1(TRIM(`pairings`)) = '709f843efc1ddffe4425148d3a0ee103a1107de8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Santa Clara 1830' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '709f843efc1ddffe4425148d3a0ee103a1107de8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Santa Damiana' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Suerdieck' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '367ec3b9a2e5bc29726af2de62b9bba0c36b56b9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tabacalera' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Taru Martani' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '8139f3fd1fb0c7b9ae0f4d67af07756cbbf49e3e';
-- brands|Tatuaje|pairings|ar — contrepoint ليس نقيضا
UPDATE `brands` SET `pairings_ar` = '[{"type":"مشروبات روحية","name":"ويسكي الجاودار","notes":"توابل الجاودار تنضمّ إلى فلفل الخلطة بدل أن تناقضه."},{"type":"قهوة","name":"قهوة كوبية","notes":"قصيرة، مركّزة، حلوة: الموازن التقليدي للطابع الذي تتبنّاه العلامة."}]'
 WHERE `name` = 'Tatuaje' AND SHA1(TRIM(`pairings`)) = 'f53402fd65aacbf06394ab9d7e7d5c3b047eecd6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Tatuaje' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'f53402fd65aacbf06394ab9d7e7d5c3b047eecd6';
-- brands|Te Amo|pairings|ar — أسماء بالإنجليزية والفرنسية
UPDATE `brands` SET `pairings_ar` = '[{"type":"ميسكال","name":"ميسكال حرفي من أواكساكا","notes":"منتجان مكسيكيان استثنائيان — الميسكال المصنوع من الأغاف، وتبغ فيراكروس البركاني. نفحات ترابية مشتركة."},{"type":"القهوة","name":"قهوة فيراكروس","notes":"قهوة من المنطقة نفسها التي ينبت فيها التبغ — نفحات شوكولاتية تتقاسمها تربتا فيراكروس الجبليتان."}]'
 WHERE `name` = 'Te Amo' AND SHA1(TRIM(`pairings`)) = 'e57e648c2cee668658420ebe030a92bb9d88e922';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Te Amo' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'e57e648c2cee668658420ebe030a92bb9d88e922';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Temple Hall' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '0ecf39332f0dea0517e6a55a58be7d4f396ff7ab';
-- brands|The Griffin's|pairings|ar — millésimé ترجمة خاطئة
UPDATE `brands` SET `pairings_ar` = '[{"type":"نبيذ","name":"شمبانيا مُعلَّمة بسنة الحصاد","notes":"التناغم الذي كان مؤسّسها يقدّمه: لتلك الطاولة أُلِّف السيجار."},{"type":"قهوة","name":"قهوة مرشَّحة خفيفة","notes":"بندق السيجار يستدعي قهوة لا تسحقه."}]'
 WHERE `name` = 'The Griffin''s' AND SHA1(TRIM(`pairings`)) = '3a9ab9332ed7ecc47d5a206ae05dbde7f04abc68';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'The Griffin''s' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '3a9ab9332ed7ecc47d5a206ae05dbde7f04abc68';
-- brands|Toscano|pairings|ar — نص بقي بالفرنسية
UPDATE `brands` SET `pairings_ar` = '[{"type":"مشروبات روحية","name":"غرابا","notes":"مرافقة البلد، وأصوبها: الغرابا تملك صراحة السيجار نفسها، بلا سكر يهذّب الحواف. غرابا معتّقة في البرميل لا بيضاء، فالبيضاء تقطع بحدّة زائدة."},{"type":"قهوة","name":"إسبريسو","notes":"ما تفعله إيطاليا عند المشرب: Toscanello وإسبريسّو. مرارة القهوة تصمد أمام الدخان بدل أن تخضع له."}]'
 WHERE `name` = 'Toscano' AND SHA1(TRIM(`pairings`)) = '657eabf9d6600a14bc0aa6443704461bedb0246e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Toscano' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '657eabf9d6600a14bc0aa6443704461bedb0246e';
-- brands|Trinidad|pairings|ar — مصطلح موحد، hors d'âge
UPDATE `brands` SET `pairings_ar` = '[{"type":"النبيذ","name":"Chambolle-Musigny Premier Cru","notes":"اقتراح توافق مع Fundadores (قياس حلقي 40 x 192 مم)، وهو قياس طويل، من علامة تصنّفها Habanos بقوة متوسطة."},{"type":"الشامبانيا","name":"Krug Grande Cuvée","notes":"اقتراح توافق مع Reyes (قياس حلقي 40 x 110 مم)، وهو قياس قصير في العلامة."},{"type":"مشروبات روحية","name":"أرمانياك Hors d''Âge","notes":"اقتراح توافق مع Fundadores: سيجار طويل (192 مم) وأرمانياك معتَّق طويلًا يتطلّب كلٌّ منهما وقتًا."}]'
 WHERE `name` = 'Trinidad' AND SHA1(TRIM(`pairings`)) = 'a6f65cd5fd7589d603cfb49112145ea74e353142';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Trinidad' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'a6f65cd5fd7589d603cfb49112145ea74e353142';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vargas' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '41f14657a092c4f961659b019c4031d54aab7c73';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'VegaFina' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'eb38b0f782235b9755ca3f568bfad2c2fc09e871';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vegas Robaina' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '949f2c0b21752ab05b6e862338de3ed7fe8b2c83';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Vegueros' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '32388cbdf7618d317f8ac3bc679871bfe609ded8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Villiger' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '97d170e1550eee4afc0af065b78cda302a97674c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Warped' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = '844393b57f515e5d87ec666c512fdda68398dc19';
-- brands|Zino Platinum|pairings|ar — تهجئة أرمانياك موحدة
UPDATE `brands` SET `pairings_ar` = '[{"type":"مشروب روحي","name":"أرمانياك","notes":"اقتراح تذوّق بلا مصدر: يمكن أن يرافق أرمانياك معتّق سيجارًا متوسط القوام."},{"type":"نبيذ","name":"ريسلينغ ألزاس","notes":"اقتراح تذوّق بلا مصدر: يقدّم ريسلينغ جاف تباينًا حيًّا مع سيجار ناعم."}]'
 WHERE `name` = 'Zino Platinum' AND SHA1(TRIM(`pairings`)) = 'a5f6c9bd0c68c8dffecf86ad592762ba0c0aed2f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'brands' AND `entite_id` = 'Zino Platinum' AND `champ` = 'pairings' AND `lang` = 'ar' AND `source_hash` = 'a5f6c9bd0c68c8dffecf86ad592762ba0c0aed2f';

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 280';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 280', 'systeme', 'traductions_relues', 'systeme', 0, 'Relecture « ar » par expert-traduction (agent) : 859 traduction(s) relue(s) — 447 corrigee(s), 412 validee(s) telles quelles ; brands 859');

SELECT
  (SELECT COUNT(*) FROM `translation_status` WHERE `lang` = 'ar' AND `statut` = 'relu' AND `relecteur` = 'expert-traduction (agent)') >= 859 AS relues,
  (SELECT COUNT(*) FROM `translation_status` WHERE `statut` = 'relu' AND (`relecteur` IS NULL OR `relecteur` = '')) = 0 AS chaque_relecture_a_son_relecteur;
SELECT `lang`, SUM(`statut` = 'relu') AS relues, COUNT(*) AS total FROM `translation_status` GROUP BY `lang`;
