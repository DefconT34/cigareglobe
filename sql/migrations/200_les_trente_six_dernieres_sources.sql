-- ════════════════════════════════════════════════════════
-- 200 — Les trente-six dernieres : le chantier des sources
--       est clos
-- ────────────────────────────────────────────────────────
-- Cinquieme et dernier lot du chantier ouvert par la 195. Les 182
-- fiches de marques portent desormais une source.
--
-- ── UNE FICHE QUI SE CONTREDISAIT, LA DEUXIEME ──────────
-- TABACALERA portait « 1782 — Manille » dans son champ `founded`. Le
-- texte de SA PROPRE FICHE dit : « En 1881, la Couronne espagnole
-- dissout la Real Compania de Filipinas [...] ». 1782 est l'annee du
-- MONOPOLE ROYAL, pas celle de la maison, qui est fondee a Barcelone le
-- 26 novembre 1881 par le marquis de Comillas.
--
-- Le controle des dates contradictoires ajoute a la 196 ne l'a pas vue :
-- il ne lit que « fondee en » et « creee en », et cette fiche ecrit
-- « la Couronne dissout ». Deuxieme fiche a se contredire sur sa date
-- apres BOLIVAR, et deuxieme fois que la sonde passe a cote.
--
-- ── UNE ERREUR DE FAIT : TEMPLE HALL ────────────────────
-- La fiche disait « L'usine n'a pas survecu a 1988 ». C'est faux, et
-- l'erreur vient d'une CONFUSION ENTRE LES DEUX HISTOIRES JAMAICAINES :
--
--   ROYAL JAMAICA  l'ouragan Gilbert detruit en 1988 la fabrique de
--                  Gore a Kingston et mille acres a May Pen
--   TEMPLE HALL    la fabrique a tenu DOUZE ANS DE PLUS : General
--                  Cigar l'a fermee en 2000 et a transfere la
--                  production en Republique dominicaine
--
-- Deux fiches voisines, deux fins differentes, et la date de l'une
-- avait glisse sur l'autre. Corrige dans les six langues.
--
-- ── DEUX AUTRES CHAMPS DE DATE SANS ANNEE ───────────────
-- CASA TURRENT disait « San Andres Tuxtla, Mexique » — un lieu a la
-- place d'une date, pour la troisieme fois du chantier apres Baccarat
-- et La Flor de Copan. La famille entre dans le tabac en 1880 ; LA
-- MARQUE, elle, parait fin 2017. Le champ dit maintenant les deux.
--
-- MATACAN disait « San Andres Tuxtla, Veracruz, Mexique ». Aucune
-- source consultable ne donne d'annee : le champ le DIT, plutot que de
-- mettre un lieu a la place — meme forme que Kolumbus et Vegas de
-- Santiago. LE FAGOT CIGAR n'avait rien du tout : meme traitement.
--
-- ── LE FIL MENENDEZ, TROISIEME OCCURRENCE ───────────────
-- MONTECRUZ est l'oeuvre de BENJAMIN MENENDEZ, fils d'Alonso — la
-- famille qui faisait Montecristo et H. Upmann a Cuba. Il ouvre la
-- Compania Insular Tabacalera a Las Palmas en 1961 et y fait un cigare
-- qui copie assumement le Montecristo, jusqu'aux epees croisees.
-- L'atlas porte deja MENENDEZ AMERINO au Bresil et MONTECRISTO a Cuba :
-- trois fiches, trois pays, une meme famille chassee de La Havane.
--
-- L'arret Menendez v. Faber, Coe and Gregg (1972) a etabli le droit des
-- fabricants exiles a commercialiser leurs versions des marques qu'ils
-- faisaient a Cuba. C'est le fondement juridique de toute une moitie de
-- cet atlas — les « homonymes non cubains » de la migration 173.
--
-- ── DEUX DOMAINES MORTS, ATTRAPES AVANT ECRITURE ────────
-- casaturrent.com et nuevamatacapan.com NE RESOLVENT PAS. Ils ont ete
-- passes au DNS AVANT d'etre cites, et non apres — apres deux lots ou
-- le controle avait du me rattraper (quesadacigars.com a la 198,
-- mayaselva.com a la 199). Les fiches concernees citent d'autres
-- sources.
--
-- ── QUATRE RESERVES ECRITES ─────────────────────────────
--   SUERDIECK        les sources datent la fin des activites de
--                    DECEMBRE 1999 ; le champ de l'atlas dit 2000
--   CARLOS TORANO    aucune source consultee ne date l'installation au
--                    Chiriqui ; le champ retient 2001 sans confirmation
--   SANTA CLARA 1830 la maison REVENDIQUE 1830, l'atlas ne l'adopte pas
--   TOSCANO          l'orage d'aout 1815 est une LEGENDE, et les
--                    sources officielles la nomment ainsi
--
-- ── LES FICHES DE CAPE ──────────────────────────────────
-- Huit fiches ne decrivent pas une maison mais une CAPE : le cigare est
-- roule ailleurs, et c'est la feuille qui le rattache au pays. Leur
-- source le dit en toutes lettres, pour qu'on ne les lise pas comme des
-- manufactures locales.
--
-- Apres cette migration :
--   php tools/contenu_dump.php
--   php tools/i18n_dump.php > sql/traductions.sql
--   php tools/sources.php --verifier
-- ════════════════════════════════════════════════════════

-- ════════════════════════════════════════════════════════
-- 1. TEMPLE HALL — une date qui avait glissé d'une fiche
--    voisine
-- ════════════════════════════════════════════════════════
UPDATE `brands` SET
  `founded` = '1876 — Kingston ; fermée en 2000',
  `history`    = REPLACE(`history`,    'L''usine n''a pas survécu à 1988 ; le nom refait surface', 'L''ouragan Gilbert a ravagé le tabac de l''île en 1988, mais l''usine, elle, a tenu douze ans de plus : General Cigar l''a fermée en 2000 et a transféré sa production en République dominicaine. Le nom refait surface'),
  `history_en` = REPLACE(`history_en`, 'The factory did not survive 1988; the name resurfaces', 'Hurricane Gilbert ravaged the island''s tobacco in 1988, but the factory held on twelve years longer: General Cigar closed it in 2000 and moved its production to the Dominican Republic. The name resurfaces'),
  `history_es` = REPLACE(`history_es`, 'La fábrica no sobrevivió a 1988; el nombre reaparece', 'El huracán Gilbert arrasó el tabaco de la isla en 1988, pero la fábrica aguantó doce años más: General Cigar la cerró en 2000 y trasladó su producción a la República Dominicana. El nombre reaparece'),
  `history_de` = REPLACE(`history_de`, 'Die Fabrik überlebte 1988 nicht; der Name taucht', 'Hurrikan Gilbert verwüstete 1988 den Tabak der Insel, doch die Fabrik hielt zwölf Jahre länger durch: General Cigar schloss sie im Jahr 2000 und verlegte ihre Fertigung in die Dominikanische Republik. Der Name taucht'),
  `history_zh` = REPLACE(`history_zh`, '这座工厂没能挺过1988年；这个名字偶尔重现', '1988 年的吉尔伯特飓风摧毁了岛上的烟叶，但这座工厂又撑了十二年：General Cigar 于 2000 年将其关闭，并把生产迁往多米尼加共和国。这个名字偶尔重现'),
  `history_ar` = REPLACE(`history_ar`, 'لم يصمد المصنع بعد 1988؛ ويطفو الاسم', 'دمّر إعصار غيلبرت تبغ الجزيرة عام 1988، لكنّ المصنع صمد اثني عشر عامًا أخرى: أغلقته «جنرال سيغار» عام 2000 ونقلت إنتاجه إلى الجمهورية الدومينيكية. ويطفو الاسم'),
  `updated_at` = NOW()
 WHERE `name` = 'Temple Hall';

SELECT 'fr' AS lang, `history`    LIKE '%fermée en 2000%'  AS ok FROM `brands` WHERE `name`='Temple Hall'
UNION ALL SELECT 'en', `history_en` LIKE '%closed it in 2000%' FROM `brands` WHERE `name`='Temple Hall'
UNION ALL SELECT 'es', `history_es` LIKE '%la cerró en 2000%'  FROM `brands` WHERE `name`='Temple Hall'
UNION ALL SELECT 'de', `history_de` LIKE '%im Jahr 2000%'      FROM `brands` WHERE `name`='Temple Hall'
UNION ALL SELECT 'zh', `history_zh` LIKE '%2000 年将其关闭%'    FROM `brands` WHERE `name`='Temple Hall'
UNION ALL SELECT 'ar', `history_ar` LIKE '%عام 2000%'           FROM `brands` WHERE `name`='Temple Hall'
UNION ALL SELECT 'plus de 1988 seul', `history` NOT LIKE '%pas survécu à 1988%' FROM `brands` WHERE `name`='Temple Hall';

-- ════════════════════════════════════════════════════════
-- 2. QUATRE CHAMPS DE DATE
-- ════════════════════════════════════════════════════════
-- Tabacalera : 1782 est le MONOPOLE, la maison est de 1881 — et son
-- propre texte le disait deja.
UPDATE `brands` SET `founded` = '1881 — Manille, Philippines', `updated_at` = NOW()
 WHERE `name` = 'Tabacalera';
UPDATE `brands` SET `founded` = '2017 — famille Turrent depuis 1880', `updated_at` = NOW()
 WHERE `name` = 'Casa Turrent';
UPDATE `brands` SET `founded` = 'Année non établie — San Andrés Tuxtla', `updated_at` = NOW()
 WHERE `name` = 'Matacan';
UPDATE `brands` SET `founded` = 'Année non publiée — Abidjan', `updated_at` = NOW()
 WHERE `name` = 'Le Fagot Cigar';

SELECT `name`, `founded`, CHAR_LENGTH(`founded`) AS lg
  FROM `brands` WHERE `name` IN ('Tabacalera','Casa Turrent','Matacan','Le Fagot Cigar','Temple Hall');

-- ════════════════════════════════════════════════════════
-- 3. LES TRENTE-SIX SOURCES
-- ════════════════════════════════════════════════════════
UPDATE `brands` SET `source` = CASE `name`

-- ── Brésil ───────────────────────────────────────────────
WHEN 'Arturo Fuente Maduro' THEN 'arturofuente.com et cigaraficionado.com — FICHE DE CAPE : le cigare est roulé à Santiago, en République dominicaine ; c''est la feuille maduro, mata fina de Bahia, qui le rattache au Brésil'
WHEN 'Suerdieck' THEN 'pt.wikipedia.org « Suerdieck Charutos » et gestoesinspiradoras.ufba.br « August Wilhelm Suerdieck » (arrivé en Bahia en 1888 pour la maison allemande F. H. Ottens ; société créée en 1892 à Cruz das Almas comme exportateur ; passage à la fabrication de cigares en 1905 à Maragojipe ; seconde fabrique à Cruz das Almas en 1935) — ⚠ ces sources datent la FIN des activités de DÉCEMBRE 1999, quand le champ de l''atlas dit 2000'

-- ── Cameroun : quatre fiches, quatre capes ───────────────
WHEN 'Arturo Fuente Hemingway' THEN 'arturofuente.com et cigaraficionado.com — FICHE DE CAPE : la Hemingway porte une cape camerounaise, le cigare est roulé à Santiago'
WHEN 'CAO Cameroon' THEN 'caocigars.com et cigaraficionado.com — FICHE DE CAPE : cape du Cameroun sur un cigare roulé chez General Cigar, à Danlí'
WHEN 'Meerapfel' THEN 'meerapfel.com et cigarjournal.com (famille marchande de tabac depuis 1876 ; sélection de la cape camerounaise ; cigares roulés en République dominicaine)'
WHEN 'Oliva Serie G' THEN 'olivacigar.com et cigaraficionado.com — FICHE DE CAPE : cape camerounaise sur un cigare roulé par Oliva à Estelí'

-- ── Canaries ─────────────────────────────────────────────
WHEN 'Montecruz' THEN 'cigaraficionado.com « The Making Of Montecristo » et « The Son of Montecristo » (BENJAMIN MENÉNDEZ, fils d''Alonso — la famille qui faisait Montecristo et H. Upmann à Cuba — ouvre la Compañía Insular Tabacalera à Las Palmas en 1961 et y fait Montecruz, copie assumée du Montecristo jusqu''aux épées croisées ; Dunhill importateur exclusif ; l''arrêt Menendez v. Faber, Coe and Gregg de 1972 établit le droit des exilés à reprendre leurs marques)'

-- ── Costa Rica ───────────────────────────────────────────
WHEN 'Atabey' THEN 'selectedtobacco.com et halfwheel.com (Nelson Alfonso, Selected Tobacco, production au Costa Rica) ; cigaraficionado.com — la fiche de la maison mère Selected Tobacco porte ses propres sources (migration 195)'
WHEN 'Bandolero' THEN 'selectedtobacco.com et halfwheel.com (Selected Tobacco, tabacs mûris avant roulage) ; cigaraficionado.com'
WHEN 'Byron' THEN 'selectedtobacco.com et halfwheel.com (Selected Tobacco ; le nom reprend une marque cubaine du XIXᵉ siècle, relancée en 2012)'
WHEN 'Casdagli' THEN 'casdaglicigars.com et cigarjournal.com (Jeremy Casdagli, d''abord Bespoke Cigars ; production au Costa Rica) — ⚠ TENSION SIGNALÉE À LA 193 : cette fiche dit le Costa Rica « sans terroir tabacole notable », alors que Vegas de Santiago y cultive son propre tabac depuis plus de quatre-vingts ans'

-- ── Équateur : trois fiches, trois capes ─────────────────
WHEN 'Ashton Cabinet' THEN 'ashtoncigar.com et cigaraficionado.com — FICHE DE CAPE : cape équatorienne sur un cigare roulé chez Fuente, à Santiago'
WHEN 'Oliva Connecticut Reserve' THEN 'olivacigar.com et cigaraficionado.com — FICHE DE CAPE : Connecticut d''Équateur sur un cigare roulé par Oliva'
WHEN 'Perdomo Ecuador' THEN 'perdomocigars.com et cigaraficionado.com — FICHE DE CAPE : cape équatorienne, cigare roulé à Estelí ; la maison plante en Équateur depuis 2000'

-- ── Indonésie ────────────────────────────────────────────
WHEN 'Taru Martani' THEN 'cigarindonesia.id « Company History » et id.wikipedia.org « Taru Martani » (fondée en 1918 sous le nom N.V. NEGRESCO par la maison néerlandaise Mignot & de Block d''Eindhoven, à l''initiative d''Adolphe Mignot ; quatre cents ouvriers en 1923 ; prise par l''occupant japonais en 1942 sous le nom Jawa Tobacco Kojo ; reprise en 1945 et rebaptisée Taru Martani — les feuilles qui donnent la vie — par le sultan Hamengkubuwono IX)'

-- ── Italie ───────────────────────────────────────────────
WHEN 'Toscano' THEN 'manifatturesigarotoscano.it « History » et toscanocigars.com « From legend to myth » (la LÉGENDE d''août 1815 : du kentucky trempé par un orage dans la cour de la Manifattura Tabacchi de Florence, fermenté puis vendu dans les quartiers populaires ; le surnom florentin stortignaccolo ; fabriques de Lucques et de Cava de'' Tirreni) — les sources officielles nomment elles-mêmes ce récit une légende, et l''atlas l''attribue sans l''adopter'

-- ── Côte d'Ivoire ────────────────────────────────────────
WHEN 'Le Fagot Cigar' THEN 'lefagot.com officiel — la même source que celle enregistrée sur la fiche de l''établissement Fagot Cigare (#11), fournie par la maison. Aucune année de fondation n''y est publiée'

-- ── Jamaïque ─────────────────────────────────────────────
WHEN 'Royal Jamaica' THEN 'cigaraficionado.com « Jamaica''s Cigar Comeback », halfwheel.com et cigar-coop.com (fondée en 1935 à Kingston par James Frederick Gore ; l''ouragan Gilbert détruit la fabrique et mille acres de tabac à May Pen en 1988 ; production transférée en République dominicaine ; relancée en 2020 chez ABE FLORES — celui de PDR Cigars, qui a sa fiche ici — en exclusivité Casa de Montecristo)'
WHEN 'Temple Hall' THEN 'cigaraficionado.com « Jamaica''s Cigar Comeback » et « Temple Hall Estates Joins Foundry Portfolio », halfwheel.com (fabrique de 1876 ; les maîtres cubains réfugiés en Jamaïque pendant la guerre ; rachat par General Cigar en 1969 ; Macanudo, Cifuentes, Dunhill et Nat Sherman y ont été faits ; FERMETURE EN 2000 et transfert en République dominicaine) — la fiche attribuait la fin de l''usine à 1988, qui est la date de l''ouragan chez ROYAL JAMAICA ; corrigé par la migration 200'

-- ── Mexique ──────────────────────────────────────────────
WHEN 'CAO Black' THEN 'caocigars.com et cigaraficionado.com — FICHE DE CAPE : cape de San Andrés sur un cigare roulé chez General Cigar, à Danlí'
WHEN 'Casa Turrent' THEN 'cigaraficionado.com « Casa Turrent 1880 to Ship in Four Varieties », halfwheel.com et neptunecigar.com (la famille Turrent entre dans le tabac en 1880, avec Alberto Turrent, dans la vallée de San Andrés ; la MARQUE Casa Turrent paraît fin 2017, sous Alejandro Turrent) — le champ de date ne portait qu''un lieu, corrigé par la migration 200'
WHEN 'Matacan' THEN 'cigarjournal.com et cigarworld.de (puro mexicain vendu en bottes ; sort de la Nueva Matacapan Tabacos de San Andrés Tuxtla, la même usine que Te Amo) — aucune source consultable ne donne d''année de création, et le champ de date le dit désormais au lieu d''y mettre un lieu'
WHEN 'Santa Clara 1830' THEN 'cigarjournal.com et cigarworld.de (San Andrés Tuxtla, Veracruz) — la maison REVENDIQUE une fondation en 1830 ; aucune source indépendante ne l''établit, et l''atlas l''attribue sans l''adopter, comme il le fait pour Gurkha et Toscano'
WHEN 'Te Amo' THEN 'teamocigars.com et cigaraficionado.com (1963 ; Tabacos San Andrés, San Andrés Tuxtla, Veracruz)'

-- ── Panama ───────────────────────────────────────────────
WHEN 'Carlos Toraño Panama' THEN 'cigaraficionado.com « An Interview with Carlos Toraño » et cigarjournal.com « Toraño Family Celebrates 90th Continuous Year in Tobacco » (Santiago Toraño arrive à Cuba depuis l''Espagne en 1916 ; vingt-trois fermes dans les années 1930 ; l''exil de 1959 ; fermes et fabriques en République dominicaine, au Honduras, au Nicaragua, puis au Panama) — ⚠ AUCUNE SOURCE CONSULTÉE NE DATE L''INSTALLATION AU CHIRIQUÍ : le champ retient 2001 sans confirmation. cigar-coop.com rapporte la mort de Carlos Toraño en février 2022'

-- ── Philippines ──────────────────────────────────────────
WHEN 'Alhambra' THEN 'tabacalera.com.ph « Our History » ; supreme.justia.com et govinfo.gov, Compañía General v. Alhambra Cigar Co., 249 U.S. 72 (1919) — maison suisse fondée en 1898 dans le quartier du port de Manille ; le litige porté en 1919 devant la Cour suprême des États-Unis atteste son existence et sa rivalité avec la Tabacalera'
WHEN 'La Flor de la Isabela' THEN 'tabacalera.com.ph « Our History » et philstar.com « A hidden historical landmark echoes Philippine cigar » (la Compañía General de Tabacos de Filipinas est fondée le 26 novembre 1881 à Barcelone par le marquis de Comillas, Antonio López y López ; la manufacture La Flor de la Isabela est établie ensuite à Manille — les sources donnent 1885 ou 1887 — et nommée d''après la variété de la vallée de Cagayan)'
WHEN 'Tabacalera' THEN 'tabacalera.com.ph « Our History » et philstar.com (la Couronne espagnole dissout le monopole en 1881, et la Compañía General de Tabacos de Filipinas est fondée la même année à Barcelone par le marquis de Comillas ; cinq mille employés en 1925) — ⚠ le champ de date portait 1782, qui est l''année du MONOPOLE ROYAL et non de la maison, alors que le texte de la fiche disait déjà 1881 ; corrigé par la migration 200'

-- ── États-Unis ───────────────────────────────────────────
WHEN 'CAO America' THEN 'caocigars.com et cigaraficionado.com (2004 ; un assemblage bâti sur des tabacs américains, Connecticut et Virginie)'
WHEN 'Cohiba USA' THEN 'generalcigar.com, cigaraficionado.com et en.wikipedia.org (la version non cubaine du nom, faite par General Cigar à Santiago ; le litige de marque avec Cubatabaco)'
WHEN 'El Titan de Bronze' THEN 'eltitandebronze.com et cigaraficionado.com (1995, Calle Ocho, Petite Havane ; roulage à la commande en très petites séries, pour d''autres marques autant que pour elle-même)'
WHEN 'General Cigar' THEN 'generalcigar.com et en.wikipedia.org « General Cigar Company » (1906 ; Macanudo, Punch et Partagás non cubains ; Santiago, Danlí et Estelí ; propriété de Scandinavian Tobacco Group depuis 2005)'
WHEN 'J.C. Newman' THEN 'jcnewman.com et cigarjournal.com « J. C. Newman Cigar Co. — America''s Oldest Cigar Family » (Julius Caeser Newman, 1895 à Cleveland puis Tampa ; la fabrique El Reloj) — ⚠ le champ GAMME de cette fiche a été vidé de ses cigares de machine par la migration 187 : El Reloj en fabrique, l''atlas ne les porte pas'
WHEN 'Nat Sherman' THEN 'cigaraficionado.com et cigar-coop.com (1930, New York, l''adresse de la Cinquième Avenue ; fermeture de la division cigare par Altria en 2020) — les marques ont été reprises par FERIO TEGO, qui a sa fiche ici depuis la migration 191'
WHEN 'Partagás USA' THEN 'generalcigar.com, cigaraficionado.com et en.wikipedia.org (la version non cubaine du nom, faite par General Cigar à Santiago)'
WHEN 'Romeo y Julieta USA' THEN 'altadisusa.com et cigaraficionado.com (la version américaine, chez Altadis ; Tabacalera de García à La Romana)'

ELSE `source` END,
`updated_at` = NOW();

-- ════════════════════════════════════════════════════════
-- LE CHIFFRE QUI CLÔT LE CHANTIER
-- ════════════════════════════════════════════════════════
SELECT COUNT(*)                                       AS marques,
       SUM(`source` IS NOT NULL AND `source` <> '')   AS sourcees,
       SUM(`source` IS NULL OR `source` = '')         AS sans_source
  FROM `brands`;

-- ── Le sceau de Temple Hall, recalculé depuis la colonne ─
INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'brands', b.`name`, 'history', l.lang, SHA1(b.`history`), 'machine', NOW()
  FROM `brands` b
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE b.`name` = 'Temple Hall'
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 200','systeme','le_chantier_des_sources_est_clos','marque',0,
   'Cinquieme et dernier lot du chantier ouvert par la 195. LES 182 FICHES DE MARQUES PORTENT DESORMAIS UNE SOURCE, comme les 508 fiches d etablissements. La doctrine « aucune fiche sans source » est verifiable des deux cotes de l atlas pour la premiere fois'),
  (NULL,'migration 200','systeme','une_deuxieme_fiche_qui_se_contredisait','marque',0,
   'TABACALERA portait « 1782 — Manille » dans son champ founded, alors que le texte de SA PROPRE FICHE dit « En 1881, la Couronne espagnole dissout la Real Compania de Filipinas ». 1782 est l annee du MONOPOLE ROYAL, pas celle de la maison, fondee a Barcelone le 26 novembre 1881 par le marquis de Comillas. Deuxieme fiche a se contredire sur sa date apres BOLIVAR (196) — et deuxieme fois que la sonde des dates contradictoires passe a cote, parce qu elle ne lit que « fondee en » et « creee en » et que cette fiche ecrit « la Couronne dissout »'),
  (NULL,'migration 200','systeme','une_date_qui_avait_glisse_d_une_fiche_a_l_autre','marque',0,
   'TEMPLE HALL disait « L usine n a pas survecu a 1988 ». FAUX, et l erreur vient d une confusion entre les DEUX HISTOIRES JAMAICAINES : c est chez ROYAL JAMAICA que l ouragan Gilbert detruit en 1988 la fabrique de Gore et mille acres a May Pen. La fabrique de Temple Hall a tenu DOUZE ANS DE PLUS : General Cigar l a fermee en 2000 et a transfere la production en Republique dominicaine. Deux fiches voisines, deux fins differentes, et la date de l une avait glisse sur l autre. Corrige dans les six langues'),
  (NULL,'migration 200','systeme','le_fil_menendez','marque',0,
   'MONTECRUZ est l oeuvre de BENJAMIN MENENDEZ, fils d Alonso — la famille qui faisait Montecristo et H. Upmann a Cuba. Il ouvre la Compania Insular Tabacalera a Las Palmas en 1961 et y fait un cigare qui copie assumement le Montecristo, jusqu aux epees croisees. L atlas porte deja MENENDEZ AMERINO au Bresil et MONTECRISTO a Cuba : trois fiches, trois pays, une meme famille chassee de La Havane. Et l arret Menendez v. Faber, Coe and Gregg de 1972 a etabli le droit des fabricants exiles a commercialiser leurs versions — c est le fondement juridique des « homonymes non cubains » de la migration 173'),
  (NULL,'migration 200','systeme','deux_domaines_morts_attrapes_avant_ecriture','marque',0,
   'casaturrent.com et nuevamatacapan.com NE RESOLVENT PAS. Ils ont ete passes au DNS AVANT d etre cites, et non apres — apres deux lots ou le controle avait du me rattraper : quesadacigars.com a la 198, mayaselva.com a la 199. Les fiches concernees citent d autres sources'),
  (NULL,'migration 200','systeme','quatre_reserves_et_huit_fiches_de_cape','marque',0,
   'RESERVES ECRITES : SUERDIECK — les sources datent la fin des activites de DECEMBRE 1999 quand le champ dit 2000 ; CARLOS TORANO — aucune source consultee ne date l installation au Chiriqui, le champ retient 2001 sans confirmation, et Carlos Torano est mort en fevrier 2022 ; SANTA CLARA 1830 et TOSCANO — 1830 et l orage d aout 1815 sont revendiques ou legendaires, l atlas les attribue sans les adopter. HUIT FICHES DE CAPE (Arturo Fuente Maduro et Hemingway, CAO Cameroon et Black, Oliva Serie G et Connecticut Reserve, Ashton Cabinet, Perdomo Ecuador) ne decrivent pas une maison mais une FEUILLE : leur source le dit en toutes lettres, pour qu on ne les lise pas comme des manufactures locales');
