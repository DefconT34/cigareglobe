-- ════════════════════════════════════════════════════════
-- 199 — Les douze honduriennes : deux dates sans annee,
--       et deux reserves ecrites plutot que tranchees
-- ────────────────────────────────────────────────────────
-- Quatrieme lot du chantier ouvert par la 195.
--
-- ── DEUX CHAMPS DE DATE QUI NE PORTAIENT QU'UN LIEU ─────
-- BACCARAT disait « Danli, Honduras » et LA FLOR DE COPAN « Santa Rosa
-- de Copan, Honduras ». Un lieu dans un champ de date : l'erreur
-- corrigee chez Vargas a la 182 et chez Kolumbus a la 193. Le controle
-- ajoute a la 193 ne les voyait pas — il refuse un champ qui COMMENCE
-- PAR UN SEPARATEUR, pas un champ sans annee, et il a ete ecrit etroit
-- expres : une quinzaine de fiches n'ont pas d'annee et le DISENT.
-- Celles-ci ne le disaient pas : elles mettaient un lieu a la place.
--
--   BACCARAT          1871 revendique, relance en 1978 au Honduras
--   LA FLOR DE COPAN  1975, Santa Rosa de Copan
--
-- ── LE FIL EIROA, ENCORE ────────────────────────────────
-- BACCARAT etait fait par JULIO EIROA, pere de Christian — celui
-- d'Aladino, de CLE et d'Asylum, trois fiches de cet atlas. Davidoff a
-- rachete la marque en 2008 avec CAMACHO, et elle sort aujourd'hui de
-- la fabrique Camacho de Rancho Jamastran, a Danli. Quatre fiches de
-- l'atlas se touchent sur cette ligne.
--
-- ── ET LA FLOR DE COPAN A UN FONDATEUR ──────────────────
-- JORGE BUESO ARIAS, qui a rapporte de Cuba la semence plantee a
-- Yarguera. La manufacture nait en 1975 de Tabacos Hondurenos, societe
-- de culture fondee une dizaine d'annees plus tot. Elle est passee de
-- Consolidated a Seita, puis a Altadis USA, puis a Imperial Tobacco.
--
-- ── DEUX RESERVES ECRITES, NON TRANCHEES ────────────────
-- BERING : le champ `factory` dit « Danli, Honduras (Plasencia) ».
-- Les sources disent que Swisher, apres avoir rachete Corral-Wodiska en
-- 1985, a d'abord fait rouler AU HONDURAS SOUS CONTRAT a partir de
-- 1990, puis a BATI SA PROPRE FABRIQUE a Danli au milieu des annees
-- 1990. L'attribution a Plasencia daterait donc de la periode du
-- contrat. Aucune source consultee ne la confirme ni ne la dement pour
-- aujourd'hui : LE CHAMP RESTE, ET LA RESERVE EST ECRITE.
--
-- ⚠ Ces memes sources rappellent que le Bering DE 1905 etait un cigare
-- DE MACHINE a tripe longue. Le Bering d'aujourd'hui, hondurien, est
-- roule main — c'est celui que porte l'atlas, et la regle 187 est donc
-- respectee. La fiche gagnerait a le dire un jour ; ce lot ne fait que
-- le consigner.
--
-- EXCALIBUR : le champ dit « 1983 — Danli ». Les sources donnent la
-- ligne comme nee chez Hoyo de Monterrey DANS LES ANNEES 1970, et
-- devenue une marque distincte en 1992 selon d'autres. Trois dates,
-- aucune qui s'impose. On garde 1983 et le champ `source` porte les
-- trois — meme traitement que Fonseca a la 196 et Warped a la 197.
--
-- Sources : mikescigars.com et thecigarstore.com (Baccarat : 1871
-- revendique, relance de 1978 par Carl Upmann, Julio Eiroa, rachat par
-- Davidoff avec Camacho en 2008, Rancho Jamastran) ; cigarjournal.com
-- « The History of the Flor de Copan Cigar Factory » et frommers.com
-- (1975, Tabacos Hondurenos, Jorge Bueso Arias, la semence de Yarguera,
-- Santa Rosa de Copan a 3 700 pieds) ; jaimemontilla.com « Corral-
-- Wodiska » et tampachanging.com (Bering : 1905, Manuel Corral, rachat
-- Swisher en 1985, production hondurienne a partir de 1990, fabrique
-- propre a Danli au milieu des annees 1990) ; cigaraficionado.com
-- « Interview: Frank Llaneza of Villazon » et en.wikipedia.org
-- (Villazon, les droits Hoyo acquis en 1964, la fabrique de Danli, la
-- HATSA de Cofradia, Excalibur) ; us.davidoffgeneva.com et
-- premiumcigars.org (Zino relance par Davidoff of Geneva USA en 2002,
-- Zino Platinum Crown la meme annee, Scepter en 2003).
--
-- Apres cette migration :
--   php tools/contenu_dump.php
--   php tools/sources.php --verifier
-- ════════════════════════════════════════════════════════

-- ── Deux champs de date qui ne portaient qu'un lieu ─────
UPDATE `brands` SET `founded` = '1871 revendiqué ; relancé en 1978', `updated_at` = NOW()
 WHERE `name` = 'Baccarat';
UPDATE `brands` SET `founded` = '1975 — Santa Rosa de Copán, Honduras', `updated_at` = NOW()
 WHERE `name` = 'La Flor de Copán';

SELECT `name`, `founded`, CHAR_LENGTH(`founded`) AS lg,
       `founded` REGEXP '[0-9]{4}' AS porte_une_annee
  FROM `brands` WHERE `name` IN ('Baccarat','La Flor de Copán');

-- ── Les douze sources ───────────────────────────────────
UPDATE `brands` SET `source` = CASE `name`

WHEN 'Aladino' THEN 'aladinocigars.com et cigarjournal.com « Christian Eiroa: The Corojo King » (Julio et Christian Eiroa, 2015, JRE Tobacco à Danlí, le corojo cultivé par la famille)'
WHEN 'Alec Bradley' THEN 'alecbradley.com et cigaraficionado.com (Alan Rubin, 1996, Fort Lauderdale ; Prensado, Cigare de l''Année 2011 ; production hondurienne et nicaraguayenne)'
WHEN 'Baccarat' THEN 'mikescigars.com et thecigarstore.com (origine cubaine REVENDIQUÉE à 1871 ; relance de 1978 par Carl Upmann ; fabrication par JULIO EIROA, père de Christian ; rachat par Davidoff avec Camacho en 2008 ; fabrique Camacho de Rancho Jamastran, Danlí) — le champ de date ne portait qu''un lieu, corrigé par la migration 199'
WHEN 'Bering' THEN 'jaimemontilla.com « Corral-Wodiska » et tampachanging.com (1905, Manuel Corral et Edward Wodiska à Tampa ; rachat par Swisher International en 1985 ; production hondurienne sous contrat à partir de 1990, puis fabrique propre à Danlí au milieu des années 1990) — ⚠ RÉSERVE : l''attribution « (Plasencia) » du champ factory daterait de la période du contrat ; aucune source consultée ne la confirme pour aujourd''hui'
WHEN 'Camacho' THEN 'camachocigars.com et cigarjournal.com « Christian Eiroa: The Corojo King » (origine cubaine de 1962, la reprise par les Eiroa, le rancho Jamastran de Danlí, la vente au groupe Oettinger Davidoff en 2008)'
WHEN 'CAO' THEN 'caocigars.com et cigaraficionado.com (Cano A. Ozgener, 1968 à Nashville ; le passage des accessoires au cigare ; rachat par Scandinavian Tobacco Group, production General Cigar à Danlí et Estelí)'
WHEN 'Excalibur' THEN 'cigaraficionado.com « Interview: Frank Llaneza of Villazon » et en.wikipedia.org (Villazon, les droits Hoyo de Monterrey acquis en 1964, la fabrique de Danlí) — ⚠ LA DATE DIVERGE : les sources donnent la ligne comme née chez Hoyo DANS LES ANNÉES 1970, et devenue marque distincte en 1992 selon d''autres ; l''atlas retient 1983'
-- ⚠ mayaselva.com N'EXISTE PAS — le controle l'a passe au DNS. Le
-- domaine de la maison est mayaselvacigars.com. Deuxieme domaine mort
-- attrape en deux lots, apres quesadacigars.com a la 198.
WHEN 'Flor de Selva' THEN 'mayaselvacigars.com et en.wikipedia.org « Maya Selva » (1995, une Hondurienne installée à Paris, la vallée du Jamastran) ; cigarjournal.com'
WHEN 'Hoyo de Monterrey Honduras' THEN 'cigaraficionado.com « Interview: Frank Llaneza of Villazon » et en.wikipedia.org « Hoyo de Monterrey » (les droits acquis par Villazon en 1964, la HATSA de Cofradía où sont nés les Hoyo d''après l''embargo)'
WHEN 'La Flor de Copán' THEN 'cigarjournal.com « The History of the Flor de Copan Cigar Factory » et frommers.com (fondée en 1975 par des membres de Tabacos Hondureños ; JORGE BUESO ARIAS, qui rapporta de Cuba la semence plantée à Yarguera ; Santa Rosa de Copán à 3 700 pieds ; passage de Consolidated à Seita, puis Altadis USA, puis Imperial Tobacco) — le champ de date ne portait qu''un lieu, corrigé par la migration 199'
WHEN 'Punch Honduras' THEN 'cigaraficionado.com « Interview: Frank Llaneza of Villazon » et en.wikipedia.org (Villazon, la fabrique de Danlí où Llaneza faisait déjà les Punch d''après la révolution)'
WHEN 'Zino Platinum' THEN 'us.davidoffgeneva.com et premiumcigars.org (Zino relancée par Davidoff of Geneva USA en 2002, Zino Platinum Crown la même année, Scepter en 2003 ; collaboration avec Peter Arnell et Steve Stout sous Reto Cina)'

ELSE `source` END,
`updated_at` = NOW()
 WHERE `country_id` = 'honduras';

SELECT COUNT(*) AS honduriennes,
       SUM(`source` IS NOT NULL AND `source` <> '') AS sourcees,
       SUM(`source` IS NULL OR `source` = '')       AS sans_source
  FROM `brands` WHERE `country_id` = 'honduras';

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 199','systeme','douze_sources_honduriennes','marque',0,
   'Quatrieme lot du chantier ouvert par la 195. Les douze fiches honduriennes sans source en recoivent une. Sources : 146 / 182'),
  (NULL,'migration 199','systeme','deux_lieux_dans_un_champ_de_date','marque',0,
   'BACCARAT disait « Danli, Honduras » et LA FLOR DE COPAN « Santa Rosa de Copan, Honduras » dans leur champ FOUNDED : un lieu a la place d une date, l erreur corrigee chez Vargas a la 182 et chez Kolumbus a la 193. Le controle ajoute a la 193 ne les voyait pas — il refuse un champ qui COMMENCE PAR UN SEPARATEUR, pas un champ sans annee, et il a ete ecrit etroit expres parce qu une quinzaine de fiches n ont pas d annee et le DISENT. Celles-ci ne le disaient pas : elles mettaient un lieu a la place. Baccarat devient « 1871 revendique ; relance en 1978 », La Flor de Copan « 1975 — Santa Rosa de Copan »'),
  (NULL,'migration 199','systeme','le_fil_eiroa','marque',0,
   'BACCARAT etait fait par JULIO EIROA, pere de Christian — celui d ALADINO, de CLE et d ASYLUM, trois fiches de cet atlas. Davidoff a rachete la marque en 2008 avec CAMACHO, et elle sort aujourd hui de la fabrique Camacho de Rancho Jamastran a Danli. Quatre fiches de l atlas se touchent sur cette ligne. Et LA FLOR DE COPAN a un fondateur : JORGE BUESO ARIAS, qui a rapporte de Cuba la semence plantee a Yarguera'),
  (NULL,'migration 199','systeme','deux_reserves_ecrites_non_tranchees','marque',0,
   'BERING : le champ factory dit « Danli, Honduras (Plasencia) ». Les sources disent que Swisher, apres avoir rachete Corral-Wodiska en 1985, a d abord fait rouler au Honduras SOUS CONTRAT a partir de 1990, puis a BATI SA PROPRE FABRIQUE a Danli au milieu des annees 1990 ; l attribution a Plasencia daterait de la periode du contrat. Aucune source consultee ne la confirme ni ne la dement pour aujourd hui : LE CHAMP RESTE ET LA RESERVE EST ECRITE. EXCALIBUR : le champ dit 1983, les sources donnent les annees 1970 chez Hoyo puis 1992 pour la marque distincte ; trois dates, aucune qui s impose, l ecart est ecrit'),
  (NULL,'migration 199','systeme','bering_etait_de_machine_en_1905','marque',0,
   'Les sources rappellent que le BERING DE 1905 etait un cigare DE MACHINE a tripe longue, chez Corral Wodiska a Tampa. Le Bering d aujourd hui, hondurien, est ROULE MAIN — c est celui que porte l atlas, et la regle 187 est donc respectee. La fiche gagnerait a ecrire cette bascule un jour ; ce lot ne fait que la consigner');
