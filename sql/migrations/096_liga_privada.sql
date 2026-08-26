-- ════════════════════════════════════════════════════════
-- 096 — Liga Privada : deux signalements, quatre défauts
-- ────────────────────────────────────────────────────────
-- Signalé par un lecteur sur la fiche affichée :
--   1. « les humidores »
--   2. « il livre une douceur paradoxale » — du cigare ou de la feuille ?
--
-- ── 1. « HUMIDORES » ────────────────────────────────────
--
-- C'est le pluriel ESPAGNOL. Le français dit « humidors », et pour la
-- réserve d'un détaillant, « cave ». Vérifié sur toute la base : le mot
-- apparaît trois fois. Les deux autres sont dans `lounges`, colonnes
-- `description_es` et `description_de` — où « humidores » et « Humidore »
-- sont les pluriels CORRECTS de ces langues. Une seule occurrence est
-- fautive, et c'est celle du français.
--
-- ── 2. « IL LIVRE » : LA PHRASE ÉTAIT CASSÉE ────────────
--
--   « La cape Connecticut Broadleaf Habano […] est la signature de Liga
--     Privada. Sombre, huileux, presque noir, IL livre une douceur
--     paradoxale sur une puissance nicaraguayenne maximale. »
--
-- Le sujet précédent est « la cape », féminin. Les adjectifs et le
-- pronom sont masculins. La phrase n'accorde avec rien : elle décrit
-- l'aspect de la FEUILLE (sombre, huileuse, presque noire) puis
-- l'équilibre en bouche du CIGARE, sans jamais nommer le second.
--
-- La réponse à la question du lecteur est donc : les deux, et c'est
-- précisément le défaut. Les deux sujets sont maintenant nommés.
--
-- ── 3. UNE CAPE POUR DEUX, ALORS QU'IL Y EN A DEUX ──────
--
-- « La cape Connecticut Broadleaf Habano » fond en une seule deux capes
-- distinctes, alors que le texte cite lui-même les deux modules :
--   No.9 → Connecticut Broadleaf maduro
--   T52  → habano de la vallée du Connecticut, récoltée à la tige
-- « Broadleaf Habano » ne désigne aucune feuille.
--
-- ── 4. UNE DIVERGENCE ENTRE LES SIX COLONNES ────────────
--
-- Trouvée en relisant les traductions avant de corriger — le réflexe que
-- la migration 095 m'a coûté cher de ne pas avoir eu.
--
--   fr, en  : les boîtes « se vendirent en heures »
--   zh, ar  : « No.9 在第一家零售商处 45 分钟内售罄 » — quarante-cinq
--             minutes, chez le PREMIER détaillant
--
-- Deux récits d'un même épisode, et aucun des deux n'est sourçable. Le
-- texte ne s'appuie plus sur le chiffre.
--
-- L'anglais portait par ailleurs une explication que les cinq autres
-- n'avaient pas — on ne peut pas faire plus de Liga Privada sans
-- cultiver plus de cape, et il faut trois ans. Elle est juste et vaut
-- mieux que « la demande dépasse encore la production » : elle dit
-- POURQUOI. Elle passe donc dans les six.
--
-- ── ET UN SUPERLATIF DE MARCHÉ ──────────────────────────
--
-- « les cigares "sérieux" les plus recherchés du marché ». Même motif
-- que les quinze affirmations des lots 089→093 : un premier rang dit
-- sans écrire « monde ».
-- ════════════════════════════════════════════════════════

UPDATE `brands` SET
  `history` = 'Liga Privada n''était pas censé exister. Jonathan Drew composa ces cigares pour lui-même et quelques proches — « liga privada » signifie littéralement « mélange privé » en espagnol. L''assemblage No.9 fut conçu pour un cercle d''une quinzaine de personnes. Quand les premières boîtes arrivèrent, à titre d''essai, dans les caves de quelques détaillants américains, elles partirent presque aussitôt.

La liste d''attente qui suivit — parfois six à douze mois — transforma un cigare confidentiel en phénomène. Le No.9 et le T52 ont installé la gamme durablement. La rareté n''y est pas un argument de vente : on ne fait pas plus de Liga Privada sans cultiver davantage de la cape voulue, et il faut trois ans entre la plantation et le roulage. Drew Estate, maison alors connue pour ses cigares infusés Acid, montrait qu''elle savait aussi faire des cigares classiques que l''on recherche.

Chaque module a sa cape. Le No.9 porte une Connecticut Broadleaf maduro — sombre, huileuse, presque noire ; le T52, une habano de la vallée du Connecticut récoltée à la tige. Toutes deux fermentent trois ans avant le roulage. Le cigare, lui, tire de cette cape une douceur qui vient contredire la puissance nicaraguayenne de sa tripe.',

  `history_en` = 'Liga Privada was never meant to exist. Jonathan Drew put these cigars together for himself and a few close friends — liga privada is literally "private blend" in Spanish. The No.9 blend was made for a circle of about fifteen people. When the first boxes reached a handful of American retailers'' humidors as a trial, they were gone almost at once.

The waiting list that followed — sometimes six to twelve months — turned a private cigar into a phenomenon. The No.9 and the T52 established the line for good. The scarcity is not a sales pitch: you cannot make more Liga Privada without growing more of the wrapper it needs, and that takes three years from planting to rolling. Drew Estate, then known for its Acid infused cigars, was showing that it could also make classic cigars people seek out.

Each size has its own wrapper. The No.9 wears a Connecticut Broadleaf maduro — dark, oily, almost black; the T52, a Connecticut River Valley habano, stalk-cut. Both are fermented for three years before rolling. The cigar itself draws from that wrapper a sweetness that runs against the Nicaraguan strength of its filler.',

  `history_es` = 'Liga Privada no estaba destinada a existir. Jonathan Drew compuso estos puros para sí mismo y unos allegados: «liga privada» significa literalmente «mezcla privada». La ligada del No.9 se creó para un círculo de unas quince personas. Cuando las primeras cajas llegaron, a modo de prueba, a los humidores de unos pocos detallistas estadounidenses, se agotaron casi de inmediato.

La lista de espera que siguió —a veces de seis a doce meses— convirtió un puro confidencial en un fenómeno. El No.9 y el T52 asentaron la gama. La escasez no es un argumento de venta: no se puede hacer más Liga Privada sin cultivar más de la capa que exige, y eso lleva tres años desde la plantación hasta el torcido. Drew Estate, casa conocida entonces por sus puros infusionados Acid, demostraba que también sabía hacer puros clásicos y buscados.

Cada vitola tiene su capa. El No.9 lleva una Connecticut Broadleaf maduro —oscura, aceitosa, casi negra—; el T52, una habano del valle del Connecticut, cortada con el tallo. Ambas fermentan tres años antes del torcido. El puro, por su parte, extrae de esa capa un dulzor que contradice la potencia nicaragüense de su tripa.',

  `history_de` = 'Liga Privada war nie zum Verkauf gedacht. Jonathan Drew stellte diese Zigarren für sich und einige Vertraute zusammen — „liga privada“ heißt wörtlich „private Mischung“. Die No.9 entstand für einen Kreis von etwa fünfzehn Personen. Als die ersten Kisten versuchsweise in die Humidore einiger amerikanischer Händler kamen, waren sie fast sofort vergriffen.

Die Warteliste, die folgte — mitunter sechs bis zwölf Monate —, machte aus einer privaten Zigarre ein Phänomen. No.9 und T52 haben die Linie dauerhaft etabliert. Die Knappheit ist kein Verkaufsargument: Mehr Liga Privada gibt es nur mit mehr vom passenden Deckblatt, und das braucht drei Jahre von der Pflanzung bis zum Rollen. Drew Estate, damals für seine aromatisierten Acid-Zigarren bekannt, zeigte, dass es auch klassische, gesuchte Zigarren kann.

Jedes Format hat sein eigenes Deckblatt. Die No.9 trägt ein Connecticut Broadleaf Maduro — dunkel, ölig, fast schwarz; die T52 ein Habano aus dem Connecticut River Valley, am Stängel geerntet. Beide fermentieren drei Jahre vor dem Rollen. Die Zigarre selbst zieht aus diesem Deckblatt eine Süße, die der nicaraguanischen Kraft ihrer Einlage widerspricht.',

  `history_zh` = 'Liga Privada 本不该问世。乔纳森·德鲁最初只为自己和几位挚友调配这批雪茄——liga privada 在西班牙语中字面即「私人配方」。No.9 的配方是为大约十五人的小圈子而作。第一批木盒作为试销送到少数美国零售商的恒湿柜时，几乎立刻售罄。

随之而来的等候名单——有时长达六到十二个月——把一支私密雪茄变成了现象。No.9 与 T52 让这一系列长久立足。稀缺并非营销说辞：要做更多 Liga Privada，就得种出更多所需的茄衣，而从栽种到卷制需要三年。当时以 Acid 加味雪茄闻名的德鲁庄园，由此证明自己同样做得出受人追捧的传统雪茄。

每个规格各有其茄衣。No.9 用康涅狄格宽叶马杜罗——深色、油润、近乎全黑；T52 用产自康涅狄格河谷、连茎采收的哈瓦那种茄衣。两者在卷制前均经三年发酵。而雪茄本身，则从这层茄衣中引出一种甜润，与茄芯的尼加拉瓜劲道形成反差。',

  `history_ar` = 'لم يكن لـ«ليغا بريفادا» أن توجد أصلًا. ركّب جوناثان درو هذه السيجارات لنفسه ولبضعة مقرّبين — و«liga privada» تعني حرفيًا «الخلطة الخاصة» بالإسبانية. وُضعت خلطة No.9 لدائرة من نحو خمسة عشر شخصًا. وحين وصلت العلب الأولى على سبيل التجربة إلى مخازن الترطيب لدى قلّة من تجار التجزئة الأمريكيين، نفدت في الحال تقريبًا.

قائمة الانتظار التي تلت — ستة إلى اثني عشر شهرًا أحيانًا — حوّلت سيجارة خاصة إلى ظاهرة. ورسّخت No.9 وT52 هذه التشكيلة. والندرة هنا ليست حجّة تسويقية: لا مزيد من «ليغا بريفادا» من دون زراعة مزيد من الغلافة المطلوبة، وذلك يستغرق ثلاث سنوات من الزراعة إلى اللف. وهكذا أثبتت «درو إستيت»، المعروفة يومها بسيجاراتها المعطّرة Acid، أنها تُتقن أيضًا السيجارات الكلاسيكية المطلوبة.

لكل قياس غلافته. تحمل No.9 غلافة كونيتيكت برودليف مادورو — داكنة، زيتية، تكاد تكون سوداء؛ وتحمل T52 غلافة هابانو من وادي نهر كونيتيكت، محصودة بساقها. وتُخمَّر كلتاهما ثلاث سنوات قبل اللف. أما السيجارة نفسها فتستخلص من هذه الغلافة حلاوةً تناقض القوة النيكاراغوية في حشوتها.'

WHERE `name` = 'Liga Privada';
