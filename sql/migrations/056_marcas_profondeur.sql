-- ════════════════════════════════════════════════════════
-- 056 — Profondeur des marcas cubaines, là où elle est sourçable
-- ────────────────────────────────────────────────────────
-- Quarante-trois marques portent `scores`, `celebrities` et
-- `limited_eds` ; soixante-treize ne les ont pas. Ce n'est pas un hasard
-- de remplissage : ces rubriques n'existent que pour les maisons dont
-- quelqu'un a écrit l'histoire.
--
-- ── LA RÈGLE DE CE LOT ──────────────────────────────────
--
-- On remplit ce qui est DOCUMENTÉ. On laisse vide ce qui ne l'est pas.
-- Une rubrique absente n'a jamais trompé personne ; une rubrique
-- plausible et fausse, si.
--
-- ── ET ON N'ÉCRIT AUCUNE NOTE CHIFFRÉE ──────────────────
--
-- `scores` reste vide sur tout ce lot, volontairement. Une entrée du
-- type « Cigar Aficionado, 94, 2020, Belicosos Finos » porte le maximum
-- d'autorité — source nommée, année précise, vitole précise — et rien
-- dans ce projet ne permet d'en vérifier une seule. C'est la forme
-- exacte que prenait l'erreur du lot R1 : le chiffre précis qu'on ne
-- peut pas sourcer et que personne ne remet en cause.
--
-- Les notes de la presse spécialisée demandent une source consultable.
-- Tant qu'elle n'existe pas dans le projet, la rubrique reste vide.
--
-- ── CE QUI EST SOURÇABLE, LUI ───────────────────────────
--
-- L'origine du nom, le fondateur, le trait qui distingue la maison :
-- ce sont des faits d'histoire, pas des appréciations. Ils suivent la
-- convention déjà posée par H. Upmann, dont la fiche cite Hermann
-- Upmann lui-même à côté de Kennedy — la rubrique accueille la personne
-- DERRIÈRE la marque autant que celle qui l'a fumée.
-- ════════════════════════════════════════════════════════

-- ── Por Larrañaga — la plus ancienne encore produite ─────
-- Le vers de Kipling est le plus célèbre jamais écrit sur un havane.
UPDATE `brands` SET `celebrities` = '[
  {"name":"Rudyard Kipling","anecdote":"Dans « The Betrothed » (1885), Kipling oppose une fiancée à une boîte de cigares et tranche en faveur du tabac. Le poème contient le vers le plus cité de toute la littérature cigarière : « there''s peace in a Larranaga ». La maison n''a jamais eu besoin d''autre publicité."},
  {"name":"Ignacio Larrañaga","anecdote":"Fondateur en 1834. Sa marque est la plus ancienne des havanes encore produites sans interruption — plus ancienne que Partagás, que H. Upmann et que Romeo y Julieta."}
]' WHERE `name` = 'Por Larrañaga';

-- ── Ramón Allones — l'invention de la boîte illustrée ────
UPDATE `brands` SET `celebrities` = '[
  {"name":"Ramón Allones","anecdote":"Galicien installé à La Havane en 1837. On lui attribue l''usage de la boîte de cèdre ornée d''une étiquette chromolithographiée — l''ancêtre direct de toutes les boîtes de cigares depuis. Avant lui, le cigare voyageait en vrac."}
]' WHERE `name` = 'Ramón Allones';

-- ── Fonseca — le papier de soie ─────────────────────────
UPDATE `brands` SET `celebrities` = '[
  {"name":"Francisco E. Fonseca","anecdote":"Fondateur en 1892. Sa maison est la seule de La Havane à emballer chaque cigare dans un papier de soie blanc, usage qu''elle n''a jamais abandonné. On reconnaît une boîte de Fonseca ouverte avant d''en avoir lu l''étiquette."}
]' WHERE `name` = 'Fonseca';

-- ── Rafael González — l'avis sous le couvercle ──────────
-- Cet avis est déjà cité dans la fiche de vitole « Perlas » posée par
-- la migration 022 : les deux textes doivent dire la même chose.
UPDATE `brands` SET `celebrities` = '[
  {"name":"Marquis de Lonsdale","anecdote":"L''étiquette porte depuis 1928 une mention en anglais dédiant la marque au marquis, et un conseil : fumer ces cigares dans l''année de leur livraison, ou les laisser vieillir un an de plus. Jamais entre les deux. C''est l''un des rares havanes qui prescrit son propre usage."}
]' WHERE `name` = 'Rafael González';

-- ── Sancho Panza et El Rey del Mundo — deux promesses ────
UPDATE `brands` SET `celebrities` = '[
  {"name":"Miguel de Cervantes","anecdote":"La marque de 1848 emprunte à l''écuyer de Don Quichotte, et ses vitoles à son univers : Sanchos, Quijote, Belicosos. Le choix dit le registre — un havane doux, terrien, sans grandiloquence, à l''image du personnage."}
]' WHERE `name` = 'Sancho Panza';

UPDATE `brands` SET `celebrities` = '[
  {"name":"Antonio Allones","anecdote":"Fondateur en 1848, frère de Ramón. Il baptise sa maison « le roi du monde » et fait imprimer sur ses boîtes qu''elle produit le meilleur cigare de la terre. La réclame la plus immodeste du XIXe siècle havanais lui a survécu de cent soixante-dix ans."}
]' WHERE `name` = 'El Rey del Mundo';

-- ── Quai d'Orsay et Diplomáticos — deux marques francaises ─
-- Faites à Cuba, pensées pour la France : la SEITA détenait le monopole
-- d'importation et voulait des havanes accordés au goût français.
UPDATE `brands` SET `celebrities` = '[
  {"name":"La SEITA","anecdote":"La marque naît en 1973 à la demande du monopole français des tabacs, qui voulait un havane accordé au goût de ses clients : plus clair, plus tempéré que les cubains d''alors. Le nom est celui de l''adresse du ministère français des Affaires étrangères — un havane baptisé par la diplomatie."}
]' WHERE `name` = 'Quai d''Orsay';

UPDATE `brands` SET `celebrities` = '[
  {"name":"Le marché français","anecdote":"Créée en 1966 pour la France, la marque partage les vitoles et l''esprit de Montecristo, dont elle est la cadette. Longtemps introuvable ailleurs, elle a fait le voyage inverse des autres havanes : connue à Paris avant de l''être à La Havane."}
]' WHERE `name` = 'Diplomáticos';

-- ── San Cristóbal — les quatre forteresses ──────────────
-- Les vitoles El Príncipe et El Morro sont déjà décrites par la
-- migration 022 ; on nomme ici le principe qui les relie.
UPDATE `brands` SET `celebrities` = '[
  {"name":"La Havane elle-même","anecdote":"La marque de 1999 porte le nom d''origine de la ville — San Cristóbal de La Habana — et ses quatre vitoles fondatrices celui des forteresses qui en gardaient la baie : El Morro, La Fuerza, La Punta, El Príncipe. La gamme se lit comme un plan de la ville."}
]' WHERE `name` = 'San Cristóbal de La Habana';

-- ── Cuaba — le mot taïno, et la forme ressuscitée ───────
UPDATE `brands` SET `celebrities` = '[
  {"name":"Les Taïnos","anecdote":"« Cuaba » est le nom taïno d''un arbuste dont les branches résineuses servaient de torche — c''est avec elles que les habitants de l''île allumaient leur tabac. La marque de 1996 a repris le mot et, avec lui, une forme oubliée : toutes ses vitoles sont des figurados effilés aux deux bouts, une manière de rouler que La Havane avait presque abandonnée."}
]' WHERE `name` = 'Cuaba';

-- ── La Gloria Cubana — la maison et son homonyme ────────
UPDATE `brands` SET `celebrities` = '[
  {"name":"Ernesto Perez-Carrillo","anecdote":"Le nom cubain de 1885 a une doublure américaine : Perez-Carrillo l''a fait renaître à Miami dans les années 1970, puis en République dominicaine. Deux maisons portent donc le même nom sans aucun lien de production — l''un des cas les plus nets de la partition des marques cubaines par l''embargo."}
]' WHERE `name` = 'La Gloria Cubana';
