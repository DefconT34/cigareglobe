-- ════════════════════════════════════════════════════════
-- 049 — Les Canaries et la Jamaïque, et pourquoi pas le Costa Rica
-- ────────────────────────────────────────────────────────
-- Trois pays de l'atlas n'avaient AUCUNE variété listée. La migration
-- 027 les avait créés volontairement incomplets plutôt que remplis au
-- jugé — mais rien ne disait si c'était une lacune ou un fait.
--
-- Vérification faite : deux lacunes, et un fait.
--
-- ── LES CANARIES : LA BOUCLE CUBAINE, PREMIER TOUR ──────
--
-- La Palma cultive du tabac depuis le XVIIIe siècle. Mais c'est au XIXe
-- que tout se joue : l'effondrement de la cochenille ruine l'île, et
-- des palmeros partis à Cuba en rapportent les premières SEMENCES
-- CUBAINES, avec les gestes appris là-bas. Le climat subtropical
-- océanique leur convient.
--
-- L'atlas raconte déjà le second tour de cette boucle : la migration
-- 027 relate le retour des familles cubaines APRÈS 1960 — Benjamín
-- Menéndez ouvrant la Compañía Insular Tabacalera en 1961. Le premier
-- tour avait cent ans d'avance, et dans l'autre sens.
--
-- Il reste six artisans sur l'île, d'une vingtaine de fabriques qu'elle
-- a comptées. Chaque puro y est roulé du début à la fin par une seule
-- personne, comme à Cuba.
--
-- ── LA JAMAÏQUE : UNE FEUILLE D'AVANT ───────────────────
--
-- Le tabac jamaïcain porte un nom qu'on ne lit nulle part ailleurs :
-- COW TONGUE — langue de vache — aussi appelé Silver Tongue. Il était
-- cultivé par les populations autochtones de l'île bien avant que des
-- Cubains n'y bâtissent une industrie.
--
-- Cette fiche est HISTORIQUE, et c'est assumé : la migration 027 a
-- établi que l'ouragan Gilbert avait emporté l'industrie en septembre
-- 1988, et la 036 que la Jamaïque n'exporte plus rien depuis six ans.
-- Une feuille qui ne se cultive plus reste une feuille qui a existé.
--
-- ── LE COSTA RICA N'EST PAS UNE LACUNE ──────────────────
--
-- Il n'a pas de variété parce qu'il n'a pas de feuille à lui.
--
-- Les sources décrivent une MANUFACTURE — Tabacos de Costa Rica, à
-- Santiago de Puriscal, où Selected Tobacco fait rouler Atabey, Byron
-- et Bandolero depuis 2012. Aucune ne décrit une origine de feuille
-- costaricienne.
--
-- Sa liste reste donc vide, et c'est la bonne réponse. J'avais annoncé
-- « trois pays sans variété » comme trois trous : c'était une
-- inférence, et elle était fausse pour un tiers.
--
-- La migration 036 avait d'ailleurs déjà buté sur ce pays : ses
-- exportations mondiales annonçaient 100 tonnes pour une fiche qui dit
-- « un seul acteur, séries très limitées ». Un pays qui roule sans
-- cultiver expliquerait aussi cet écart.
-- ════════════════════════════════════════════════════════

INSERT INTO `feuilles`
  (`id`, `name`, `country_id`, `emploi`, `genese`, `culture`, `caracteres`, `notes`, `pairings`)
VALUES
(
  'canaries-la-palma',
  'Tabac de La Palma',
  'canaries',
  'Cape, sous-cape et tripe',
  'La Palma cultive du tabac depuis le XVIIIe siècle, pour le commerce avec l''Amérique. Mais c''est au XIXe que la feuille prend son caractère : l''effondrement de la cochenille ruine l''île, et des palmeros partis chercher fortune à Cuba en rapportent les premières semences cubaines, avec les gestes appris là-bas.',
  'Le climat subtropical océanique de l''île convient à ces semences venues des Caraïbes. Il reste six artisans, d''une vingtaine de fabriques que La Palma a comptées ; chaque puro y est roulé du début à la fin par une seule personne, comme à Cuba.',
  'Une feuille cubaine par la graine et canarienne par la terre. C''est le premier tour d''une boucle que l''atlas raconte déjà dans l''autre sens : cent ans plus tard, après 1960, ce sont les familles cubaines qui viendront s''installer ici.',
  '["Douceur","Bois","Note florale"]',
  '["Vin de Malvoisie","Café doux","Fruits secs"]'
),
(
  'jamaique-cow-tongue',
  'Cow Tongue',
  'jamaica',
  'Cape et tripe',
  'La feuille jamaïcaine porte un nom qu''on ne lit nulle part ailleurs — Cow Tongue, langue de vache, dite aussi Silver Tongue. Les populations autochtones de l''île la cultivaient bien avant que des Cubains n''y bâtissent une industrie au XIXe siècle.',
  'Elle poussait dans la plaine calcaire de May Pen et autour de Kingston. Ces terres ne sont plus cultivées : l''ouragan Gilbert a détruit l''usine de Kingston et mille acres de tabac en septembre 1988, et rien n''a redémarré depuis.',
  'Cette fiche décrit une feuille au passé, et c''est assumé. La Jamaïque fut le premier pays du cigare des Caraïbes hors de Cuba dans les années 1960-1970 ; il n''en reste que des marques, rachetées et transférées ailleurs.',
  '["Douceur","Terre","Bois clair"]',
  '["Rhum jamaïcain","Café Blue Mountain","Fruits confits"]'
);

-- ── L'étiquette doit désigner la fiche ───────────────────
-- Sans cela, la fiche existe et reste injoignable : le front apparie
-- par nom EXACT. C'est la panne que la migration 048 vient de corriger
-- sur le Mexique et les États-Unis, et `tools/coherence_check.php` la
-- surveille désormais. On ne la reproduit pas.

UPDATE `producer_countries` SET `varieties` = '["Tabac de La Palma"]' WHERE `id` = 'canaries';
UPDATE `producer_countries` SET `varieties` = '["Cow Tongue"]'        WHERE `id` = 'jamaica';
