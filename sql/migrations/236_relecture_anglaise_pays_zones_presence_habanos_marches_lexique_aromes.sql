-- ════════════════════════════════════════════════════════
-- 236 — Relecture anglaise — pays, zones, présence Habanos, marchés, lexique, arômes
-- ────────────────────────────────────────────────────────
-- Relecture des traductions en en par : expert-traduction (agent).
-- Fichier de verdicts : relu_en_lot1.json ; generee par tools/i18n_relecture.php le 2026-09-18.
-- Un texte « corrige » est reecrit ; tout texte relu passe au statut « relu »,
-- avec le nom du relecteur. L'empreinte du francais est verifiee dans le WHERE :
-- un francais qui a change depuis l'export ne se laisse pas declarer relu.
-- ════════════════════════════════════════════════════════

UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'aruba' AND `champ` = 'region' AND `lang` = 'en' AND `source_hash` = 'fdcb24354c669d8d7ac1ad2dcb20bba418dd738d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'azores' AND `champ` = 'region' AND `lang` = 'en' AND `source_hash` = 'c539d8e600d9d8e7b907af447e8d607098f5b5f6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'bahamas' AND `champ` = 'region' AND `lang` = 'en' AND `source_hash` = 'fdcb24354c669d8d7ac1ad2dcb20bba418dd738d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'brazil' AND `champ` = 'region' AND `lang` = 'en' AND `source_hash` = 'cadb3b507a381193a88c0f18fad8e8f3063795ca';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'cameroon' AND `champ` = 'region' AND `lang` = 'en' AND `source_hash` = '2282ff9be789726586ecc6d55346b4bf49d16009';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'canaries' AND `champ` = 'region' AND `lang` = 'en' AND `source_hash` = 'c539d8e600d9d8e7b907af447e8d607098f5b5f6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'china' AND `champ` = 'region' AND `lang` = 'en' AND `source_hash` = '5e215966593b168dc2e1519382e88d01a5e325f8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'colombia' AND `champ` = 'region' AND `lang` = 'en' AND `source_hash` = 'cadb3b507a381193a88c0f18fad8e8f3063795ca';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'costarica' AND `champ` = 'region' AND `lang` = 'en' AND `source_hash` = '64b9698432ba991a9faa9f56e703a08fc178a8be';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'cuba' AND `champ` = 'region' AND `lang` = 'en' AND `source_hash` = 'fdcb24354c669d8d7ac1ad2dcb20bba418dd738d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'dominican' AND `champ` = 'region' AND `lang` = 'en' AND `source_hash` = 'fdcb24354c669d8d7ac1ad2dcb20bba418dd738d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'ecuador' AND `champ` = 'region' AND `lang` = 'en' AND `source_hash` = 'cadb3b507a381193a88c0f18fad8e8f3063795ca';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'germany' AND `champ` = 'region' AND `lang` = 'en' AND `source_hash` = 'd3c24531e45fceb79994a6f230b52fe8ab9d9970';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'honduras' AND `champ` = 'region' AND `lang` = 'en' AND `source_hash` = '64b9698432ba991a9faa9f56e703a08fc178a8be';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'indonesia' AND `champ` = 'region' AND `lang` = 'en' AND `source_hash` = '0aac951d6c93d3a8928a89d31be17b7cf41f529c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'italy' AND `champ` = 'region' AND `lang` = 'en' AND `source_hash` = 'f3dc38505c664adc23f7487eb6f7984aebee5f68';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'ivorycoast' AND `champ` = 'region' AND `lang` = 'en' AND `source_hash` = '3e0b94eda1d0e6f5c1d65b5f489a4a1280d533ca';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'jamaica' AND `champ` = 'region' AND `lang` = 'en' AND `source_hash` = 'fdcb24354c669d8d7ac1ad2dcb20bba418dd738d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'mexico' AND `champ` = 'region' AND `lang` = 'en' AND `source_hash` = 'cbc38fc521255f39c25e5ddb9b888754366a7b72';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'mozambique' AND `champ` = 'region' AND `lang` = 'en' AND `source_hash` = 'a11ba77de307fc5f7041c73440d5d2ab51f01da1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'netherlands' AND `champ` = 'region' AND `lang` = 'en' AND `source_hash` = 'd3c24531e45fceb79994a6f230b52fe8ab9d9970';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'nicaragua' AND `champ` = 'region' AND `lang` = 'en' AND `source_hash` = '64b9698432ba991a9faa9f56e703a08fc178a8be';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'panama' AND `champ` = 'region' AND `lang` = 'en' AND `source_hash` = '64b9698432ba991a9faa9f56e703a08fc178a8be';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'peru' AND `champ` = 'region' AND `lang` = 'en' AND `source_hash` = 'cadb3b507a381193a88c0f18fad8e8f3063795ca';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'philippines' AND `champ` = 'region' AND `lang` = 'en' AND `source_hash` = '0aac951d6c93d3a8928a89d31be17b7cf41f529c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'puertorico' AND `champ` = 'region' AND `lang` = 'en' AND `source_hash` = 'fdcb24354c669d8d7ac1ad2dcb20bba418dd738d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'russia' AND `champ` = 'region' AND `lang` = 'en' AND `source_hash` = '55095e00c1501fa3787a65d3e82ec83e5ac1b658';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'southafrica' AND `champ` = 'region' AND `lang` = 'en' AND `source_hash` = 'a11ba77de307fc5f7041c73440d5d2ab51f01da1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'usa' AND `champ` = 'region' AND `lang` = 'en' AND `source_hash` = 'cbc38fc521255f39c25e5ddb9b888754366a7b72';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'zimbabwe' AND `champ` = 'region' AND `lang` = 'en' AND `source_hash` = 'a11ba77de307fc5f7041c73440d5d2ab51f01da1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'aruba' AND `champ` = 'production' AND `lang` = 'en' AND `source_hash` = '0ac2c77b24c80cdec17f0f6be24c1f6d7c0b6b30';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'azores' AND `champ` = 'production' AND `lang` = 'en' AND `source_hash` = 'add6421dc68da2b52942be54f5ae4b3a1757b24f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'bahamas' AND `champ` = 'production' AND `lang` = 'en' AND `source_hash` = '7ab24bb8ff864a0da32f0daf39b880b5abc152d1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'brazil' AND `champ` = 'production' AND `lang` = 'en' AND `source_hash` = 'c530465e2244ab5e57999f4d09ecb6e6bbf134b1';
-- producer_countries|cameroon|production|en — intensificateur « très » omis (sought-after seul)
UPDATE `producer_countries` SET `production_en` = 'Highly sought-after niche wrapper'
 WHERE `id` = 'cameroon' AND SHA1(TRIM(`production`)) = '94384f71cdcfe61561add49bb7403936a4798a38';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'cameroon' AND `champ` = 'production' AND `lang` = 'en' AND `source_hash` = '94384f71cdcfe61561add49bb7403936a4798a38';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'canaries' AND `champ` = 'production' AND `lang` = 'en' AND `source_hash` = '3131089d9dc369878cf283b200c780e574dea338';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'china' AND `champ` = 'production' AND `lang` = 'en' AND `source_hash` = 'd14a32fba6b4925211b0c78ef847d465c04316c1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'colombia' AND `champ` = 'production' AND `lang` = 'en' AND `source_hash` = 'cf1e00547d4801637f7c4e90cbbaefb71035bfba';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'costarica' AND `champ` = 'production' AND `lang` = 'en' AND `source_hash` = 'be051bc0700c8f378b7060e2520a1a254dd28aa7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'cuba' AND `champ` = 'production' AND `lang` = 'en' AND `source_hash` = 'b24c3b24313d37a34957cb79d6c7d1fb58dc5eef';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'dominican' AND `champ` = 'production' AND `lang` = 'en' AND `source_hash` = '64e0385c8c81ad748e7c7081849366fd08986e2a';
-- producer_countries|ecuador|production|en — ajout de « natural », absent du français
UPDATE `producer_countries` SET `production_en` = 'Shade wrapper grown without cloth, under cloud cover'
 WHERE `id` = 'ecuador' AND SHA1(TRIM(`production`)) = '9583e56d0019c942c4aa36ede0a9c89aa1acae6c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'ecuador' AND `champ` = 'production' AND `lang` = 'en' AND `source_hash` = '9583e56d0019c942c4aa36ede0a9c89aa1acae6c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'germany' AND `champ` = 'production' AND `lang` = 'en' AND `source_hash` = '671298e2fd4a3f6e35b0e152e93b5bff74305026';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'honduras' AND `champ` = 'production' AND `lang` = 'en' AND `source_hash` = '535a8731eb71bbd22aaf650eca22dc25b0ba53c0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'indonesia' AND `champ` = 'production' AND `lang` = 'en' AND `source_hash` = '4e23300b89cf91a0f44b422e05b7c50ed87828e6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'italy' AND `champ` = 'production' AND `lang` = 'en' AND `source_hash` = '245209dd3b0618515a68f86235a9d924e4f6e592';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'ivorycoast' AND `champ` = 'production' AND `lang` = 'en' AND `source_hash` = '3ce8e19ab83922a4f2b6046cc7573515f3e6f9bd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'jamaica' AND `champ` = 'production' AND `lang` = 'en' AND `source_hash` = '23ab16f632d2735af484c319f4426592f85a04bf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'mexico' AND `champ` = 'production' AND `lang` = 'en' AND `source_hash` = '1dfe23d70e4dd16a06014af1e8007137068c6d6f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'mozambique' AND `champ` = 'production' AND `lang` = 'en' AND `source_hash` = 'a401eb657d2835615130df74bce34fa6773c9682';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'netherlands' AND `champ` = 'production' AND `lang` = 'en' AND `source_hash` = '858516d01dc582f28ba057c932c8506119698692';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'nicaragua' AND `champ` = 'production' AND `lang` = 'en' AND `source_hash` = '21ee2250475cb399d7ed6a8e5288e41dea266ed0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'panama' AND `champ` = 'production' AND `lang` = 'en' AND `source_hash` = 'ff62bd71927f375b01744e249fbd4e79cc0f41a5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'peru' AND `champ` = 'production' AND `lang` = 'en' AND `source_hash` = '8c3168ad27083db8c6ebe983899bb699a833249e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'philippines' AND `champ` = 'production' AND `lang` = 'en' AND `source_hash` = 'fc1d7ffdcc6f2672eba283a588e04988718ba898';
-- producer_countries|puertorico|production|en — calque lourd « workshop-shop » (répétition de shop)
UPDATE `producer_countries` SET `production_en` = 'A workshop-boutique in Old San Juan — hand-rolled'
 WHERE `id` = 'puertorico' AND SHA1(TRIM(`production`)) = '72d38636427f93f422605d73c34d0b9c55fcb611';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'puertorico' AND `champ` = 'production' AND `lang` = 'en' AND `source_hash` = '72d38636427f93f422605d73c34d0b9c55fcb611';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'russia' AND `champ` = 'production' AND `lang` = 'en' AND `source_hash` = 'd4199a469f828bc6a0add7f397537bd2ea958130';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'southafrica' AND `champ` = 'production' AND `lang` = 'en' AND `source_hash` = 'ce9e3f263f2d117e85646aba5492ee672052f1d8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'usa' AND `champ` = 'production' AND `lang` = 'en' AND `source_hash` = '6857393209f4c93ba3118848bdb9beb008b63266';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'zimbabwe' AND `champ` = 'production' AND `lang` = 'en' AND `source_hash` = 'ebd6ca6d19e7ecd5de0d0b4d9e4c060581e49dbe';
-- producer_countries|aruba|rev_detail|en — tournures calquées : tourism island, land that gave beans
UPDATE `producer_countries` SET `rev_detail_en` = 'No figures. Aruba is a tourist island — a hundred thousand inhabitants, hotels along Palm Beach — and the cigar there is a shop near the Dutch windmill, selling visitors what it rolls in the afternoon. The tobacco grows on the island, on land that once yielded beans.'
 WHERE `id` = 'aruba' AND SHA1(TRIM(`rev_detail`)) = '82fc7df563fcc492854ae67261650bcece2ffc60';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'aruba' AND `champ` = 'rev_detail' AND `lang` = 'en' AND `source_hash` = '82fc7df563fcc492854ae67261650bcece2ffc60';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'azores' AND `champ` = 'rev_detail' AND `lang` = 'en' AND `source_hash` = 'aa99340b9a3feb1186b03de153ed7f3cc909b990';
-- producer_countries|bahamas|rev_detail|en — calque du français : présent + since au lieu du present perfect
UPDATE `producer_countries` SET `rev_detail_en` = 'There is no export line for Bahamian cigars. Graycliff sells in its hotel, to visitors, and has sold in the United States since October 1997; the house reported 650,000 cigars rolled in 1999.'
 WHERE `id` = 'bahamas' AND SHA1(TRIM(`rev_detail`)) = '40c425374504df2c937c69fcd0b14d5bafef8a75';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'bahamas' AND `champ` = 'rev_detail' AND `lang` = 'en' AND `source_hash` = '40c425374504df2c937c69fcd0b14d5bafef8a75';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'brazil' AND `champ` = 'rev_detail' AND `lang` = 'en' AND `source_hash` = '82f6144203ca138e0278168c92949420fa940cd4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'cameroon' AND `champ` = 'rev_detail' AND `lang` = 'en' AND `source_hash` = '11c36395f2acb404c1d0e2808e94ef9e09076c75';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'canaries' AND `champ` = 'rev_detail' AND `lang` = 'en' AND `source_hash` = '77b6955d1753d6a141a37119fcb6bd52b4d8e39e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'china' AND `champ` = 'rev_detail' AND `lang` = 'en' AND `source_hash` = '3371cacb6ea391972f9e53e66deb0cf706445764';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'colombia' AND `champ` = 'rev_detail' AND `lang` = 'en' AND `source_hash` = '207c34c0060b60dc85473f4b38473a72706ff5d7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'costarica' AND `champ` = 'rev_detail' AND `lang` = 'en' AND `source_hash` = '3a58f0bc4b0e0802e8b55c360506b79fd92b8c20';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'cuba' AND `champ` = 'rev_detail' AND `lang` = 'en' AND `source_hash` = 'f29831db8fabe4bdfc766dfe188dfa0118644aa3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'dominican' AND `champ` = 'rev_detail' AND `lang` = 'en' AND `source_hash` = '2e616a1b1031c1f32d0a0994cfb1c043628f1271';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'ecuador' AND `champ` = 'rev_detail' AND `lang` = 'en' AND `source_hash` = '11c36395f2acb404c1d0e2808e94ef9e09076c75';
-- producer_countries|germany|rev_detail|en — « machine cigars » incohérent avec machine-made établi ailleurs (Chine) ; tournure lourde
UPDATE `producer_countries` SET `rev_detail_en` = 'No aggregate figure: Germany is a major country for machine-made cigars — Bünde, Lübbecke — which this atlas does not carry, and for three hand-rolling workshops counting in tens of thousands of pieces a year. The tobacco is imported.'
 WHERE `id` = 'germany' AND SHA1(TRIM(`rev_detail`)) = '54be453cb536f06a20c8c574d47bfdb63474ecee';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'germany' AND `champ` = 'rev_detail' AND `lang` = 'en' AND `source_hash` = '54be453cb536f06a20c8c574d47bfdb63474ecee';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'honduras' AND `champ` = 'rev_detail' AND `lang` = 'en' AND `source_hash` = '3a58f0bc4b0e0802e8b55c360506b79fd92b8c20';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'indonesia' AND `champ` = 'rev_detail' AND `lang` = 'en' AND `source_hash` = '3a58f0bc4b0e0802e8b55c360506b79fd92b8c20';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'italy' AND `champ` = 'rev_detail' AND `lang` = 'en' AND `source_hash` = '8089eb52c7e84c101c232a9d1b5f2ff8470c0fed';
-- producer_countries|ivorycoast|rev_detail|en — collocation peu naturelle « varieties together »
UPDATE `producer_countries` SET `rev_detail_en` = 'About 8,071 t of tobacco leaf a year, ranking first in West Africa (FAO) — all varieties combined. No statistic isolates the share that goes to cigars, and there is no export line for Ivorian cigars.'
 WHERE `id` = 'ivorycoast' AND SHA1(TRIM(`rev_detail`)) = '46e3c18ee59118c8094407386d7cf47394fba110';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'ivorycoast' AND `champ` = 'rev_detail' AND `lang` = 'en' AND `source_hash` = '46e3c18ee59118c8094407386d7cf47394fba110';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'jamaica' AND `champ` = 'rev_detail' AND `lang` = 'en' AND `source_hash` = 'c27655d0f23cec0f7f4a43d25ec7d0705549c877';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'mexico' AND `champ` = 'rev_detail' AND `lang` = 'en' AND `source_hash` = '11c36395f2acb404c1d0e2808e94ef9e09076c75';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'mozambique' AND `champ` = 'rev_detail' AND `lang` = 'en' AND `source_hash` = 'c820b5a1a634ab5190f4dbcb42d3378283639526';
-- producer_countries|netherlands|rev_detail|en — « machine cigars » incohérent avec machine-made établi ailleurs (Chine)
UPDATE `producer_countries` SET `rev_detail_en` = 'No figures: Van der Donk sells to some forty Dutch shops. The rest of the country — Kampen, Eindhoven, Agio, De Olifant — is machine-made cigars, outside this atlas.'
 WHERE `id` = 'netherlands' AND SHA1(TRIM(`rev_detail`)) = '490f8beef3e20dc75405ba61834b3e6ec765f2a6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'netherlands' AND `champ` = 'rev_detail' AND `lang` = 'en' AND `source_hash` = '490f8beef3e20dc75405ba61834b3e6ec765f2a6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'nicaragua' AND `champ` = 'rev_detail' AND `lang` = 'en' AND `source_hash` = '04a613ac526f6020bbf418c8f5dbe910e0bed347';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'panama' AND `champ` = 'rev_detail' AND `lang` = 'en' AND `source_hash` = '3a58f0bc4b0e0802e8b55c360506b79fd92b8c20';
-- producer_countries|peru|rev_detail|en — calque « go to export » au lieu de « for export »
UPDATE `producer_countries` SET `rev_detail_en` = 'Tarapoto tobacco sells first as leaf: 80 to 100 tonnes exported a year to Central America (2016), 70% of turnover against 30% for finished cigars — the house wants to reverse the proportion. 80% of the cigars go for export, to Europe and Asia; an Italian contract of 2011 was worth 220,000 dollars.'
 WHERE `id` = 'peru' AND SHA1(TRIM(`rev_detail`)) = 'bdb9169f22ac46da816ae220c9afe7e32c78e6a2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'peru' AND `champ` = 'rev_detail' AND `lang` = 'en' AND `source_hash` = 'bdb9169f22ac46da816ae220c9afe7e32c78e6a2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'philippines' AND `champ` = 'rev_detail' AND `lang` = 'en' AND `source_hash` = '3a58f0bc4b0e0802e8b55c360506b79fd92b8c20';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'puertorico' AND `champ` = 'rev_detail' AND `lang` = 'en' AND `source_hash` = '217a9781bdbdc5da0e8904e664f72a2455285b18';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'russia' AND `champ` = 'rev_detail' AND `lang` = 'en' AND `source_hash` = '73c4a1bf41a0af03b186e9a69f4753560a44f7e8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'southafrica' AND `champ` = 'rev_detail' AND `lang` = 'en' AND `source_hash` = '2bdf9976fc3c2517cd25f2ba489231ee53878070';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'usa' AND `champ` = 'rev_detail' AND `lang` = 'en' AND `source_hash` = '04a613ac526f6020bbf418c8f5dbe910e0bed347';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'zimbabwe' AND `champ` = 'rev_detail' AND `lang` = 'en' AND `source_hash` = 'e09c79cb68a0e80dd98b2f079aae81f38185310e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'brazil' AND `champ` = 'harvest' AND `lang` = 'en' AND `source_hash` = '203e6dec7b7220e9a4337ff4a30e9b56b3f8e591';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'cameroon' AND `champ` = 'harvest' AND `lang` = 'en' AND `source_hash` = '0a9321ef61ee70761bf71632ede74f3b5b1b0249';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'cuba' AND `champ` = 'harvest' AND `lang` = 'en' AND `source_hash` = 'ca49fe5ab49e6a7aa427ee798651d9b253bd51a4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'dominican' AND `champ` = 'harvest' AND `lang` = 'en' AND `source_hash` = 'eb335f14df05360f634890c58e1e4a8c8ace149f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'ecuador' AND `champ` = 'harvest' AND `lang` = 'en' AND `source_hash` = 'e8253829a7b0122b156e63cfadde84d14b30c013';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'honduras' AND `champ` = 'harvest' AND `lang` = 'en' AND `source_hash` = '47233791547652fc7e4e19b051a223056ba3b1aa';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'indonesia' AND `champ` = 'harvest' AND `lang` = 'en' AND `source_hash` = 'e8253829a7b0122b156e63cfadde84d14b30c013';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'italy' AND `champ` = 'harvest' AND `lang` = 'en' AND `source_hash` = '5e5236ec60ec23ef1c010494f6f2726e01f93e5b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'mexico' AND `champ` = 'harvest' AND `lang` = 'en' AND `source_hash` = '84b91b0d31a14881a2d652bbdf3ecdfa5fc5a4e6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'nicaragua' AND `champ` = 'harvest' AND `lang` = 'en' AND `source_hash` = '47233791547652fc7e4e19b051a223056ba3b1aa';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'panama' AND `champ` = 'harvest' AND `lang` = 'en' AND `source_hash` = '47233791547652fc7e4e19b051a223056ba3b1aa';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'philippines' AND `champ` = 'harvest' AND `lang` = 'en' AND `source_hash` = '0ff2dbb0d37b92fcaccc6f969ba4930024b5fbc8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'usa' AND `champ` = 'harvest' AND `lang` = 'en' AND `source_hash` = 'd9876626f5b5ef7da8630e48c91fa069b4fce3bb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'brazil' AND `champ` = 'climate' AND `lang` = 'en' AND `source_hash` = '4d5d27dc442b79b2903c2977309aafffafede1f0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'cameroon' AND `champ` = 'climate' AND `lang` = 'en' AND `source_hash` = 'b1112730c8b19d7166320aefc33a2197f5595cc3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'canaries' AND `champ` = 'climate' AND `lang` = 'en' AND `source_hash` = 'cb29c8affed75accf36ca2b92946cabcc507529e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'costarica' AND `champ` = 'climate' AND `lang` = 'en' AND `source_hash` = '7258d168083865b25bff59a5431f53cf4ca3015e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'cuba' AND `champ` = 'climate' AND `lang` = 'en' AND `source_hash` = '566ad3b93a3414e1b8105b98d3180ced9f0fb527';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'dominican' AND `champ` = 'climate' AND `lang` = 'en' AND `source_hash` = 'a716dd707b8e15209d67bd4dbb8e1aadaeb7cea9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'ecuador' AND `champ` = 'climate' AND `lang` = 'en' AND `source_hash` = '2e6b72e8f02d89403c83c299b3f50a6ec571adfe';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'honduras' AND `champ` = 'climate' AND `lang` = 'en' AND `source_hash` = '0d05570f8dc8df957cf55b8c896aabb547f02d9c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'indonesia' AND `champ` = 'climate' AND `lang` = 'en' AND `source_hash` = '3c7b1e540bfa288e4f5f598febf747329e3f3dcf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'italy' AND `champ` = 'climate' AND `lang` = 'en' AND `source_hash` = '49f4bb1d2e49e022004132677dbba74d71e34de5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'ivorycoast' AND `champ` = 'climate' AND `lang` = 'en' AND `source_hash` = '26dfc04a32ba08ea6a40159c15d4717b89f98291';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'jamaica' AND `champ` = 'climate' AND `lang` = 'en' AND `source_hash` = 'b739b4e3d75c14bd814bf14a6c976b8ae8bc3e40';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'mexico' AND `champ` = 'climate' AND `lang` = 'en' AND `source_hash` = '433abb04a2b985daf56ca04a85a7edaab1a5af7a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'nicaragua' AND `champ` = 'climate' AND `lang` = 'en' AND `source_hash` = '45b86ea009db9a94b429d203eb60a905ba81a51c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'panama' AND `champ` = 'climate' AND `lang` = 'en' AND `source_hash` = '433abb04a2b985daf56ca04a85a7edaab1a5af7a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'philippines' AND `champ` = 'climate' AND `lang` = 'en' AND `source_hash` = '1a11c4c4f6d8a6aa464a17c6ee14209b32e7e647';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'usa' AND `champ` = 'climate' AND `lang` = 'en' AND `source_hash` = 'cd2ba3919b0409523b10ded247777288eac2629f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'brazil' AND `champ` = 'soil' AND `lang` = 'en' AND `source_hash` = '1962a52d53c118eb3b76d9eaa5ce7fbef8529ffb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'cameroon' AND `champ` = 'soil' AND `lang` = 'en' AND `source_hash` = '4693eab23d0194fe6201dc8c2fee8392a3c307fd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'canaries' AND `champ` = 'soil' AND `lang` = 'en' AND `source_hash` = 'c4c6cb449144c662086f1e6b9e6dd5ab4e49e37c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'costarica' AND `champ` = 'soil' AND `lang` = 'en' AND `source_hash` = 'effdb0a5a5aeadf1e8cf1804b53a6ea5d04f4b1e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'cuba' AND `champ` = 'soil' AND `lang` = 'en' AND `source_hash` = 'c6037fc2eb2b1028bb3f495fac917650b4928c2f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'dominican' AND `champ` = 'soil' AND `lang` = 'en' AND `source_hash` = '16abb774c5d47082799623e4414cf059f6e18502';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'ecuador' AND `champ` = 'soil' AND `lang` = 'en' AND `source_hash` = '3316c396d86a18097c25acda5c79e3995017b680';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'honduras' AND `champ` = 'soil' AND `lang` = 'en' AND `source_hash` = '1c837a8a11aed1bc6aece60e874930af8afbdfd8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'indonesia' AND `champ` = 'soil' AND `lang` = 'en' AND `source_hash` = '7a2d70c19ce303aa049d4217f1df7c2b370c9128';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'italy' AND `champ` = 'soil' AND `lang` = 'en' AND `source_hash` = 'c772620e8cfe617e1a8aeeecfdf9a175d3379c03';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'ivorycoast' AND `champ` = 'soil' AND `lang` = 'en' AND `source_hash` = 'a816026eb9e71769fce2f8ee9382878ee3d44cac';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'jamaica' AND `champ` = 'soil' AND `lang` = 'en' AND `source_hash` = '673029a145dd94d44859e0870388858f38f8cd83';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'mexico' AND `champ` = 'soil' AND `lang` = 'en' AND `source_hash` = '2d9e2a130d1d0d58b403ec7039379f281b58dd1f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'nicaragua' AND `champ` = 'soil' AND `lang` = 'en' AND `source_hash` = 'd955814712b9896c09c54e5382cabe70e8bb7a30';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'panama' AND `champ` = 'soil' AND `lang` = 'en' AND `source_hash` = '2ec7179bd83c6684bb4cf734a2ad7f687a49470b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'philippines' AND `champ` = 'soil' AND `lang` = 'en' AND `source_hash` = '061562029353d381b9bd92269ac51667fa8f9cff';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'usa' AND `champ` = 'soil' AND `lang` = 'en' AND `source_hash` = '8372d36e2d55fb8b189b6cd614f0e942c681ac80';
-- producer_countries|aruba|notes|en — calque de « tenir de » (obtenir une information d'une source) rendu par hold au lieu de have
UPDATE `producer_countries` SET `notes_en` = 'An arid island, cactus and wind, where a bean farmers'' son planted tobacco and began rolling it around 2005. No cigar press has written it; this atlas has the story from a tourism office, a Dutch guide and a travel directory, and says so. The house''s former domain now serves a shop in Ukraine unrelated to it — the atlas does not cite it.'
 WHERE `id` = 'aruba' AND SHA1(TRIM(`notes`)) = 'ffdd7f71bc1d69cf69f85604003e5fb95c09a015';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'aruba' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = 'ffdd7f71bc1d69cf69f85604003e5fb95c09a015';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'azores' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '1d02484617dc8a0e8530aeb5ad9e12a54ea9aa8e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'bahamas' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = 'd6a4ebabce73af43ea3b4cd337c35bf12d2a7aea';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'brazil' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '8343f9bafd6274a788c509dd89acab2109a9f4ca';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'cameroon' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '35fc5b9cc0e72e0902fb4a78b59a998503e8dc85';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'canaries' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '81aa5d54ae99c052aa634513fd5b4dee627fff18';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'china' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = 'b54ea1df4c9bea07b3c2b82fc13c9ac1248e2cac';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'colombia' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '4e1b28d16fbce4f42016f0c4179b9e92b98bf518';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'costarica' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = 'bfed2bcc28391f8f37f74f87172ce07cf9257508';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'cuba' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '9a015ccab5b8af6460de297e35a150e9aaaba869';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'dominican' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = 'fb742839fc2609fe084247cf70f5e8a416b24d10';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'ecuador' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = 'a029f45b538c0fcd497ca06628c3bdecfe687c55';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'germany' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '9ddcac755882ac3141f550572c2a719d564a9d97';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'honduras' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '00b81dcabab90a18ef4eceeadf99be8523ca57a2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'indonesia' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '010750e3a69acbcdd087a0685c705da2f0be2bab';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'italy' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '637180d0f0ee24ecc19f6d943c786746eff528f6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'ivorycoast' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '8da3b3d03f659e096a24a3a76f1a0c93fdb10465';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'jamaica' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '161c87ec32ce075da792836def478ccb0eb9468d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'mexico' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '995efdc0aefdb750fd1d4e202bbec2c7403b5c55';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'mozambique' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = 'ff92dc1b3b268610eff5b4c424df11419114d1db';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'netherlands' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '10a45310c3cfc40a4474f11f737a540e7d1792d1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'nicaragua' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '34b308651c77c9eccd9f865b4f6baade58ee1c7d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'panama' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '0d8ac91dc2dea2c42d59cee84e3253cb901a8643';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'peru' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '64c4b6cba83f0b0594f06d3c28b797fccf1c3c23';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'philippines' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = 'a4c8b5ec157edfff4d908e3c018aaa7cb2217a07';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'puertorico' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '75b3458052271fd9aa43d3fe3cba6880c32f0b77';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'russia' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = 'bf5228cb74f6b8f61740dbe35ad9312a41acad67';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'southafrica' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '302a4a13b57d0cacd77eb60b1d804e30e37a7928';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'usa' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '8afc63b8218dfc53ca9909619abe02e5ef978567';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_countries' AND `entite_id` = 'zimbabwe' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '74fdc8eb88484647e6a3133446b4ab8e66b204ce';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'canada_mkt' AND `champ` = 'consumption' AND `lang` = 'en' AND `source_hash` = '0d661a712f0d376855e23755bcac3c9bb7c75a9a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'china_mkt' AND `champ` = 'consumption' AND `lang` = 'en' AND `source_hash` = '23d12c2bc7a9f3238d303869d655a04e02c945de';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'eu_mkt' AND `champ` = 'consumption' AND `lang` = 'en' AND `source_hash` = 'd2d3abb88ad4a352804fded2e2e0e2835ad5b67d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'france_mkt' AND `champ` = 'consumption' AND `lang` = 'en' AND `source_hash` = '1112ec82d1fc5c104dc520781dbe5ca46a25292a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'japan_mkt' AND `champ` = 'consumption' AND `lang` = 'en' AND `source_hash` = 'b6f3bb6f70b4fa26f5d9fdae13d38202417d6606';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'russia_mkt' AND `champ` = 'consumption' AND `lang` = 'en' AND `source_hash` = 'ecfc7fcf6076480e3f05f77f1ed0e61265873144';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'switz_mkt' AND `champ` = 'consumption' AND `lang` = 'en' AND `source_hash` = '47ad65477d64f0b0fb15ac1f04df43ba6e93ecbd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'uae_mkt' AND `champ` = 'consumption' AND `lang` = 'en' AND `source_hash` = 'a7886b158f43c4c04395ae91c807f579a251181d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'uk_mkt' AND `champ` = 'consumption' AND `lang` = 'en' AND `source_hash` = '929465ca64d51c6958c04fb50825281678649e31';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'usa_mkt' AND `champ` = 'consumption' AND `lang` = 'en' AND `source_hash` = '62f803c09b8a1710bc2fa6271f09cbe812750552';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'canada_mkt' AND `champ` = 'cigars' AND `lang` = 'en' AND `source_hash` = '53c7047d7f8794d22718b8f8fd4aff16173fce67';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'china_mkt' AND `champ` = 'cigars' AND `lang` = 'en' AND `source_hash` = '1243a6a30e3979a8f77bd9e065d3e49add19da95';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'eu_mkt' AND `champ` = 'cigars' AND `lang` = 'en' AND `source_hash` = 'e13c50d55fe6b3046881636129656d8ac56b8766';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'france_mkt' AND `champ` = 'cigars' AND `lang` = 'en' AND `source_hash` = '6c56e827a846d9b03952e6df0252086cb06f33e6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'japan_mkt' AND `champ` = 'cigars' AND `lang` = 'en' AND `source_hash` = '6b3d4ae55353cabdd50227e8e17fd4e5ac02c858';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'russia_mkt' AND `champ` = 'cigars' AND `lang` = 'en' AND `source_hash` = 'a5cf0154d9631631dd023bc868e7a49ab54c4ff0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'switz_mkt' AND `champ` = 'cigars' AND `lang` = 'en' AND `source_hash` = '1b858e30a1e342900584b7720f29553821c401ee';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'uae_mkt' AND `champ` = 'cigars' AND `lang` = 'en' AND `source_hash` = '3ea0b9c38b93b60894112860ec5cc424699c2793';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'uk_mkt' AND `champ` = 'cigars' AND `lang` = 'en' AND `source_hash` = '4253b731ed3a5f924148da7daea55dc9d6f8c777';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'usa_mkt' AND `champ` = 'cigars' AND `lang` = 'en' AND `source_hash` = '16af2ce8483ac7ea865ed7a66db2fbbdea58a52d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'canada_mkt' AND `champ` = 'trend' AND `lang` = 'en' AND `source_hash` = '4fbacc2fa0ffdbb11bf1ad6925b886ebd08dd15f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'china_mkt' AND `champ` = 'trend' AND `lang` = 'en' AND `source_hash` = '66823cdb61a918766e74935baad133e01cf3d8bb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'eu_mkt' AND `champ` = 'trend' AND `lang` = 'en' AND `source_hash` = 'b78a41fe55abede7a5757ec354f52a7575e9163f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'france_mkt' AND `champ` = 'trend' AND `lang` = 'en' AND `source_hash` = '4fbacc2fa0ffdbb11bf1ad6925b886ebd08dd15f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'japan_mkt' AND `champ` = 'trend' AND `lang` = 'en' AND `source_hash` = '4fbacc2fa0ffdbb11bf1ad6925b886ebd08dd15f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'russia_mkt' AND `champ` = 'trend' AND `lang` = 'en' AND `source_hash` = '98f109dcb139d6e60d8019dc22be37d8bafd6e3f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'switz_mkt' AND `champ` = 'trend' AND `lang` = 'en' AND `source_hash` = 'b78a41fe55abede7a5757ec354f52a7575e9163f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'uae_mkt' AND `champ` = 'trend' AND `lang` = 'en' AND `source_hash` = '66823cdb61a918766e74935baad133e01cf3d8bb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'uk_mkt' AND `champ` = 'trend' AND `lang` = 'en' AND `source_hash` = '4fbacc2fa0ffdbb11bf1ad6925b886ebd08dd15f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'usa_mkt' AND `champ` = 'trend' AND `lang` = 'en' AND `source_hash` = '4fbacc2fa0ffdbb11bf1ad6925b886ebd08dd15f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'canada_mkt' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '0bdce935b5d9dfa3cd793b1aa3b6f0c9adcd04ec';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'china_mkt' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '1499472d999d76fad02913b5f1711b9cd58dd47c';
-- markets|eu_mkt|note|en — Préposition fautive et fragments mal recollés (« lead, on a strong cigar culture ») ; restitués séparément comme en français
UPDATE `markets` SET `note_en` = 'The only market where Cuban Habanos are freely sold. France, Germany, Switzerland and Spain lead. A strong cigar culture.'
 WHERE `id` = 'eu_mkt' AND SHA1(TRIM(`note`)) = 'c959c33de011b23d783f197abe12bea2d8ba85cc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'eu_mkt' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = 'c959c33de011b23d783f197abe12bea2d8ba85cc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'france_mkt' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '781c1cdc297119e21a6db8e92339af9469525546';
-- markets|japan_mkt|note|en — « caves à cigares » rendu par « cellars » seul, ambigu (cave à vin) ; précision « cigar » restituée
UPDATE `markets` SET `note_en` = 'A highly developed cigar culture. Habanos Japan is the official distributor, with a network of premium cigar cellars in the major cities.'
 WHERE `id` = 'japan_mkt' AND SHA1(TRIM(`note`)) = '03ab0e0ef93f9878a338956035140ba2819f1f9a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'japan_mkt' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '03ab0e0ef93f9878a338956035140ba2819f1f9a';
-- markets|russia_mkt|note|en — « marchés parallèles » rendu par « channels », imprécis, et rattaché à tort à la demande plutôt qu'à la redistribution
UPDATE `markets` SET `note_en` = 'A traditional market in decline since 2022. Historically strong demand for Cuban cigars. Redistribution through parallel markets.'
 WHERE `id` = 'russia_mkt' AND SHA1(TRIM(`note`)) = '4635d7a0bdcb1ebc0b1525d840efe01a46284425';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'russia_mkt' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '4635d7a0bdcb1ebc0b1525d840efe01a46284425';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'switz_mkt' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '06b96f11043a5b5c92dc6cae6867da9371698379';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'uae_mkt' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '40db602b9cd550f7a2f95441b2e8d84e4e6d0f09';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'uk_mkt' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = 'a350046e48ded78c7bda4c0e12b3c19e6c0eff5d';
-- markets|usa_mkt|note|en — Singulier générique calqué (« the specialist shop ») pour un pluriel français (« boutiques »)
UPDATE `markets` SET `note_en` = 'The world''s largest market. The Cuban embargo since 1962 allows non-Cuban cigars only. Heartland of specialist shops.'
 WHERE `id` = 'usa_mkt' AND SHA1(TRIM(`note`)) = '1f86e877932c4f388dcc687f0f634c733a49784b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'markets' AND `entite_id` = 'usa_mkt' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '1f86e877932c4f388dcc687f0f634c733a49784b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '1' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '6d66b1bf0a8ebfe6ff3d18b83c62912fd47926c0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '2' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '810c6fc8855da46e094de1ba4dfe0fd2c361e5b8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '3' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '4a6b7433af1546bc65f15d06069bc090c89154b9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '4' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '186ab0f149eedeb61e199effdca37af570a85946';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '5' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = 'd2b024f33ab2faae54435ce5ba2065081b3367bd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '6' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = 'a8e4cb49c6e90c287c26d350d1a5b31898ad42ad';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '7' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '7cb3376f515ceeb59f958c225f0dad75700ded6b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '8' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '685430c965e4f3034e96cbc7ef27abc2c14b8613';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '9' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '0d27f7381252951dbbcc794e53b6a95027ca5bb4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '10' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '5bf53ede42aae7738621caaec474dceafe03aa28';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '11' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '8e6a5ea956981b8d2992c25a3a41a48f28f4051e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '12' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = 'c1b3b25b070a36387ef6ed216642647ce4b61cf7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '13' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '123284bc6abf494ce6b5e6b0113fee2b610af8e1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '14' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '322a215845e2da12549bdbd0e41d1ddbe9c6deff';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '15' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = 'd420950ad9779c54734293043b898879a5aec4a5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '16' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '8566451853b2b386b065b2b57e26d6bdf00d1476';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '17' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '34ccac45ceb83a350880a09b3c92867479ce83b1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '18' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '9ab00e73e53b712bfd05e9df55e6c6d033aaccb9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '19' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '0db78c653c29f7b237d58c7f9b27c1bc41d9a857';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '22' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '62da2446c7d0ec5aab7af1d5d72d2ec7a8cbdecd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '23' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = 'e918a7646973ebb9f4eb710270d718865d7959cb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '24' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '9bc229f734686b11be8909435973337de1897062';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '25' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '05b94eac20161c30b822dbd7984102ac7904747c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '26' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '1f0fd7e221bcc60fb06032db2ec6bfe69134f335';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '27' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '89113489106cfe7628ba808c929ae1d6e970a82f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '28' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = 'b9b5b3037c849c52739435c3511a921736988d26';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '29' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '49522e1492932097339dd0b12572fda77d847ec6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '30' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = 'e732b3476377583969c339c558adba97c8b8a418';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '31' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = 'cdbbb4bb43be3c6ee9ff7526a60a76af95f03087';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '32' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = 'eef0c059951550b2c6c4cb156d91c4bf0f693836';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '33' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '8fc813443a1cef6ff1e869f69f3807b8da19995a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '34' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '4497f121b77719898b206a27e2af64d4b9d405c6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '35' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '1e88b9fcb5334fe2aebdeaf144f31698fd934cb1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '36' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '233fba32f9c1cd84d6855f3623b5fd088e54f396';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '37' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = 'ea180ad87ff759d9b458dd55946199d388273dbf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '38' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = 'e6b854bbacff4067e6c617083c75a055315f9732';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '39' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '53ac464e13d9a195bf3f42241b04b56fe56cbac8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '40' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = 'f3274dcf4eadc1fa86d4360d9deb1e0286e5e98e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '41' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = 'f527daa2ec8c508466806a7c5e3d2d4a4ec4d2b3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '44' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = 'fcf7ec8c2c72666b3d0c9c7be5baa0db80bc4cfe';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '45' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '9f77df682694418390320ed1d8ddb2eedb2cdf66';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '46' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = 'd2262df49f393c0fcedd8b7c2acf2535df8e36cf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '47' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = 'ad99aeda8833a2b4aa936b253d25b4019f6176d0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '48' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '49aa729704bbdf47d26cc86a1334bcff9813bf5e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '49' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '35f7e9fbfa1f57be9b7ae933deb10dded9b7f236';
-- production_zones|50|note|en — Intensif « très » affaibli (« largely » au lieu de « overwhelmingly »)
UPDATE `production_zones` SET `note_en` = 'The east coast of Tenerife, where Canaritos rolls shortfillers from overwhelmingly imported leaf.'
 WHERE `id` = '50' AND SHA1(TRIM(`note`)) = '2b401f862ff3e7fd37305cfeb288558c3278916e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '50' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '2b401f862ff3e7fd37305cfeb288558c3278916e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '51' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '0f87129c27aafa75902e413f1f4df8c471c3867e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '52' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '9def90085a1ba8bae52add59227fa778d0426789';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '53' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = 'aa1ce4339159b0d35b96d5d6d9d1993839dfcb8c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '54' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '8ee2eceb61869495ebbaf63b34a0f9b308f8340d';
-- production_zones|55|note|en — Calque agrammatical du participe français (« artisans come from » pour « venus de »)
UPDATE `production_zones` SET `note_en` = 'A rolling place, not fields: the Cházaro family''s Real Fábrica de Tabacos, on the wine and cheese road, rolls San Andrés Tuxtla''s black tobacco with artisans from Veracruz.'
 WHERE `id` = '55' AND SHA1(TRIM(`note`)) = '3494de8555af7a7312823919a7877e630f843f29';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'production_zones' AND `entite_id` = '55' AND `champ` = 'note' AND `lang` = 'en' AND `source_hash` = '3494de8555af7a7312823919a7877e630f843f29';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'brazil' AND `champ` = 'status' AND `lang` = 'en' AND `source_hash` = '1378e9193921c6f1fdfcf46eec4c6983c6b0fe08';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'cameroon' AND `champ` = 'status' AND `lang` = 'en' AND `source_hash` = 'a28d56bbd984dbd7f16ac63a267fc956fbbbf487';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'cuba' AND `champ` = 'status' AND `lang` = 'en' AND `source_hash` = 'e4dcab9397da108eb6d8d0fb3e7663a335eacf22';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'dominican' AND `champ` = 'status' AND `lang` = 'en' AND `source_hash` = '4de27364fee7f59975d5857b1ac3f28a08f1ed30';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'ecuador' AND `champ` = 'status' AND `lang` = 'en' AND `source_hash` = '50603373356e9598f9f326d4ffbc62cbe69eaf13';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'honduras' AND `champ` = 'status' AND `lang` = 'en' AND `source_hash` = '996664ae8d2b53670a0dde4fad7c572ff3d24fd7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'indonesia' AND `champ` = 'status' AND `lang` = 'en' AND `source_hash` = 'a1e627061682eb4ed776f05bd9ce4431d5800adf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'ivorycoast' AND `champ` = 'status' AND `lang` = 'en' AND `source_hash` = 'ae5a6ffb5c7fc60a04ca56335900631062886da8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'mexico' AND `champ` = 'status' AND `lang` = 'en' AND `source_hash` = '4e1bae24bbbbc358397f701f5e2dfd683b576e34';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'nicaragua' AND `champ` = 'status' AND `lang` = 'en' AND `source_hash` = 'dd9aa82d4bbe7ecfb7d43be2ca70c9816e4ee9d1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'panama' AND `champ` = 'status' AND `lang` = 'en' AND `source_hash` = '4744290035b35d37ea551ea6fe02dc1db3d6466d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'philippines' AND `champ` = 'status' AND `lang` = 'en' AND `source_hash` = '1633847122724b4de0d872e07e4eac5c1ae53db2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'usa' AND `champ` = 'status' AND `lang` = 'en' AND `source_hash` = 'd80a77b26936d8f823eab618ff3eace79a3da12b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'brazil' AND `champ` = 'ownership' AND `lang` = 'en' AND `source_hash` = 'e6c6de8eaa1b99cc5ffa936353efd8e0d61cf047';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'cameroon' AND `champ` = 'ownership' AND `lang` = 'en' AND `source_hash` = '4472ef3d81c42a5d59e8771fb8e7a30e069eff85';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'cuba' AND `champ` = 'ownership' AND `lang` = 'en' AND `source_hash` = '40f98faf938e936d0c2c75618745f9a73a745d8a';
-- habanos_presence|dominican|ownership|en — manufacture traduit par workshop au lieu de factory, terme retenu par le glossaire
UPDATE `habanos_presence` SET `ownership_en` = 'Family factories and international groups'
 WHERE `country_id` = 'dominican' AND SHA1(TRIM(`ownership`)) = '4899b8ca9cf484264cd02fae3529c88f5b1ca092';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'dominican' AND `champ` = 'ownership' AND `lang` = 'en' AND `source_hash` = '4899b8ca9cf484264cd02fae3529c88f5b1ca092';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'ecuador' AND `champ` = 'ownership' AND `lang` = 'en' AND `source_hash` = 'dfda777f8abe5989a66cda2b5dbcb7c0eaf044e4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'honduras' AND `champ` = 'ownership' AND `lang` = 'en' AND `source_hash` = '70c556cb73310b3c37756362983ccb02102770ee';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'indonesia' AND `champ` = 'ownership' AND `lang` = 'en' AND `source_hash` = '7e358a4c3746f0f316cb0bd71c641622b620c8aa';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'ivorycoast' AND `champ` = 'ownership' AND `lang` = 'en' AND `source_hash` = '7aff0f8d25a567b32cf11607ada181585723b676';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'mexico' AND `champ` = 'ownership' AND `lang` = 'en' AND `source_hash` = '2658faf3121c03aa833620ebe47689c79fc892f7';
-- habanos_presence|nicaragua|ownership|en — manufacture traduit par workshop au lieu de factory, terme retenu par le glossaire
UPDATE `habanos_presence` SET `ownership_en` = 'Mainly independent family factories'
 WHERE `country_id` = 'nicaragua' AND SHA1(TRIM(`ownership`)) = '1e05e95768bd0e9b8007b5f9ae9cc3eebee175b2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'nicaragua' AND `champ` = 'ownership' AND `lang` = 'en' AND `source_hash` = '1e05e95768bd0e9b8007b5f9ae9cc3eebee175b2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'panama' AND `champ` = 'ownership' AND `lang` = 'en' AND `source_hash` = 'b3f1ec02f649cee0a67108e21caf1089b69d609d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'philippines' AND `champ` = 'ownership' AND `lang` = 'en' AND `source_hash` = 'fa189cb99ef585d21601644516c8b39d6634af7d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'usa' AND `champ` = 'ownership' AND `lang` = 'en' AND `source_hash` = 'c5efade090a7283cf7d4181dc9009b6b3578705c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'brazil' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'e27a15b795ccf2b79ad0559e3194cc60bc223ad4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'cameroon' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '36fbadb28568c6ed588dadc4d3ec508522b39349';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'cuba' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'b3decce8ff5ebb795f262023fcb4dbba64aff528';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'dominican' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'b883a2def76f07539c169fac5c9a323f1880889f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'ecuador' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'b380e52736fa4d81cbe3a1827b7d71dc1e577a23';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'honduras' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '5635c2ef1d76939b615842db840a510c79706325';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'indonesia' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '8bd15d466d4cc27d5fd3b2169a7fbbfc7069e152';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'ivorycoast' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'ff9804997d0aa8371b2485827d5550d0b685fa51';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'mexico' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '54853c00efdf352465831da82bd6ff2397cfba15';
-- habanos_presence|nicaragua|description|en — manufacture traduit par workshop au lieu de factory, incohérent avec ecuador|description dans le même lot
UPDATE `habanos_presence` SET `description_en` = 'Nicaragua has become the world''s largest producer of premium cigars by volume, ahead of Cuba and the Dominican Republic. The industry clusters around Estelí — the “Cigar Capital” — home to the factories of the greatest houses. Unlike Cuba''s, the Nicaraguan industry is entirely private and fiercely competitive.'
 WHERE `country_id` = 'nicaragua' AND SHA1(TRIM(`description`)) = 'f56557cc545ce9bae28ab30d7c8bbe917f145c84';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'nicaragua' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'f56557cc545ce9bae28ab30d7c8bbe917f145c84';
-- habanos_presence|panama|description|en — représentation traduite par office (incohérent avec les 5 autres fiches) ; fiche omise, l'anglais disait no Panamanian house au lieu de no profile of a Panamanian house
UPDATE `habanos_presence` SET `description_en` = 'Panama has no Habanos representation. Its premium cigar industry began in March 1981, when Gilberto Oliva and Nestor Plasencia brought Cuban seed to Coclé province: the Coclé Tobacco Factory opened at Peñonomé that year, Tabacos Panamá S.A. at La Pintada in 1984, and Miriam Padilla founded Joyas de Panamá in February 1986. Tobacco is grown in Chiriquí. That industry has largely collapsed — mismanagement, accusations of tax-credit fraud, unpaid wages — and a 2025 report that went looking for Panamanian cigars found the workshops idle. This atlas therefore carries no profile of a Panamanian house: it has no source solid enough to write one.'
 WHERE `country_id` = 'panama' AND SHA1(TRIM(`description`)) = '1e3d2831bf397234da1e959f1be0f9ba00df0c67';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'panama' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '1e3d2831bf397234da1e959f1be0f9ba00df0c67';
-- habanos_presence|philippines|description|en — représentation traduite par office, incohérent avec les 5 autres fiches qui disent representation
UPDATE `habanos_presence` SET `description_en` = 'The Philippines has no Habanos representation. One of the oldest tobacco industries in the world — a Spanish monopoly from 1782 — it is under-exploited internationally today. The Cagayan Valley terroir holds real premium potential that remains largely untapped. The market is mainly domestic.'
 WHERE `country_id` = 'philippines' AND SHA1(TRIM(`description`)) = 'ab88b00fa40c863e3ab2d69fb8f2cba8d39dac53';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'philippines' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = 'ab88b00fa40c863e3ab2d69fb8f2cba8d39dac53';
-- habanos_presence|usa|description|en — accord sujet-verbe : wrappers there is au lieu de there are
UPDATE `habanos_presence` SET `description_en` = 'The United States is the largest premium cigar consumer market in the world. Connecticut Shade — grown under cloth in the Connecticut Valley since 1900 — is among the mildest wrappers there are, used by Macanudo, Davidoff, Ashton and dozens of other houses. The embargo on Cuba (1962) paradoxically stimulated the Nicaraguan and Dominican industries, which absorbed the exiled Cuban master torcedores.'
 WHERE `country_id` = 'usa' AND SHA1(TRIM(`description`)) = '62c68dfb394ee86f88938a6cabd41898062f47da';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'usa' AND `champ` = 'description' AND `lang` = 'en' AND `source_hash` = '62c68dfb394ee86f88938a6cabd41898062f47da';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'brazil' AND `champ` = 'festival' AND `lang` = 'en' AND `source_hash` = '60ee61bf9101b06347536f9cd9ee1c06c7d22747';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'cameroon' AND `champ` = 'festival' AND `lang` = 'en' AND `source_hash` = '56b7e51424d0ca0c8e3cb75df77afa48a7705d0d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'cuba' AND `champ` = 'festival' AND `lang` = 'en' AND `source_hash` = 'dce8d83cd0de3d24a070cd756130114e138d876d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'dominican' AND `champ` = 'festival' AND `lang` = 'en' AND `source_hash` = '0cc544666c24707479e690c58406e698ef60e5a7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'ecuador' AND `champ` = 'festival' AND `lang` = 'en' AND `source_hash` = '56b7e51424d0ca0c8e3cb75df77afa48a7705d0d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'honduras' AND `champ` = 'festival' AND `lang` = 'en' AND `source_hash` = 'a93bb2a36136eb5328dacae88ad6dc5783b5265e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'indonesia' AND `champ` = 'festival' AND `lang` = 'en' AND `source_hash` = '36fc119856850dd79c38375ba6830dbdc8ea7f9b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'ivorycoast' AND `champ` = 'festival' AND `lang` = 'en' AND `source_hash` = 'dc2dad37d1dfe75f472bb65ee933203e7d120f6a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'mexico' AND `champ` = 'festival' AND `lang` = 'en' AND `source_hash` = '36fc119856850dd79c38375ba6830dbdc8ea7f9b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'nicaragua' AND `champ` = 'festival' AND `lang` = 'en' AND `source_hash` = 'd8a8fbb39ba8b40245c98a4cefc7e45b745728c8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'panama' AND `champ` = 'festival' AND `lang` = 'en' AND `source_hash` = '56b7e51424d0ca0c8e3cb75df77afa48a7705d0d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'philippines' AND `champ` = 'festival' AND `lang` = 'en' AND `source_hash` = '36fc119856850dd79c38375ba6830dbdc8ea7f9b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'usa' AND `champ` = 'festival' AND `lang` = 'en' AND `source_hash` = 'a29bde8a3fe0b80df453f0157a02643a8ba5c4a7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'aromes' AND `entite_id` = 'biere|accord' AND `champ` = 'texte' AND `lang` = 'en' AND `source_hash` = '9450b38bf3a9492c39c138b034453a7cf3b078b2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'aromes' AND `entite_id` = 'bois|note' AND `champ` = 'texte' AND `lang` = 'en' AND `source_hash` = '06d713c6e5395c390af78f1d6586dcbca0b24b49';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'aromes' AND `entite_id` = 'cacao|note' AND `champ` = 'texte' AND `lang` = 'en' AND `source_hash` = '842e15647549b7f2dd9c170f938af23b764ca428';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'aromes' AND `entite_id` = 'cacao|accord' AND `champ` = 'texte' AND `lang` = 'en' AND `source_hash` = 'd6243123cf9e4c4d7f1d25cfa4da706f86c38209';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'aromes' AND `entite_id` = 'cafe|note' AND `champ` = 'texte' AND `lang` = 'en' AND `source_hash` = '10ae81bc5722074cfca9aa3f50ef2f64eb13b239';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'aromes' AND `entite_id` = 'cafe|accord' AND `champ` = 'texte' AND `lang` = 'en' AND `source_hash` = '9f1fdd9c5cd9b6ffbf574febd33d42bca42ef8bf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'aromes' AND `entite_id` = 'cuir|note' AND `champ` = 'texte' AND `lang` = 'en' AND `source_hash` = 'db145c4de49eada5bbf18775e3c924996354e3b3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'aromes' AND `entite_id` = 'douceur|note' AND `champ` = 'texte' AND `lang` = 'en' AND `source_hash` = '33b82a2eb3400a60a61bf70302e7acb8e8d32d43';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'aromes' AND `entite_id` = 'epices|note' AND `champ` = 'texte' AND `lang` = 'en' AND `source_hash` = '3d2a8917cfd9bac268a42b17f623c0398ef23158';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'aromes' AND `entite_id` = 'fleur|note' AND `champ` = 'texte' AND `lang` = 'en' AND `source_hash` = '041b0b82a696003343b2bbe2942b79a67d529136';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'aromes' AND `entite_id` = 'foin|note' AND `champ` = 'texte' AND `lang` = 'en' AND `source_hash` = '49d5951308d0a205a5ac68290a7990059582f4b9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'aromes' AND `entite_id` = 'force|note' AND `champ` = 'texte' AND `lang` = 'en' AND `source_hash` = '58f4aa47bf072f559b3e031f5d8076ccf656174f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'aromes' AND `entite_id` = 'fruits|note' AND `champ` = 'texte' AND `lang` = 'en' AND `source_hash` = 'c5a097964ae913a9c14dabb1a9303e99df3c15ad';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'aromes' AND `entite_id` = 'fruits|accord' AND `champ` = 'texte' AND `lang` = 'en' AND `source_hash` = '8a5cd76503a2391a12e09bb172d980884e8456f3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'aromes' AND `entite_id` = 'fumee|note' AND `champ` = 'texte' AND `lang` = 'en' AND `source_hash` = '1154d14ff8f300952453f5640bbf63032f51912e';
-- aromes|patisserie|accord|texte|en — calque du français (what the tobacco has of dryness), tournure non naturelle
UPDATE `aromes` SET `texte_en` = 'A lightly sweetened pastry, for pale morning cigars: the butter rounds off the tobacco''s dryness.'
 WHERE `famille` = 'patisserie' AND `contexte` = 'accord' AND SHA1(TRIM(`texte`)) = '2e5593f14f507f2a48e2c294f9cb66a0909472ca';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'aromes' AND `entite_id` = 'patisserie|accord' AND `champ` = 'texte' AND `lang` = 'en' AND `source_hash` = '2e5593f14f507f2a48e2c294f9cb66a0909472ca';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'aromes' AND `entite_id` = 'spiritueux|accord' AND `champ` = 'texte' AND `lang` = 'en' AND `source_hash` = '69fd1344e527979ff32da465f342b2a3140a9151';
-- aromes|terre|note|texte|en — sous-bois affaibli en woodland ; undergrowth est le terme de dégustation attendu
UPDATE `aromes` SET `texte_en` = 'The humus of undergrowth after rain. Nothing dirty about it: this is the smell of living soil, the one that rises when you lift a fallen leaf.'
 WHERE `famille` = 'terre' AND `contexte` = 'note' AND SHA1(TRIM(`texte`)) = '20367cd2cddc23aad3d1c558689d975562975419';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'aromes' AND `entite_id` = 'terre|note' AND `champ` = 'texte' AND `lang` = 'en' AND `source_hash` = '20367cd2cddc23aad3d1c558689d975562975419';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'aromes' AND `entite_id` = 'the|accord' AND `champ` = 'texte' AND `lang` = 'en' AND `source_hash` = '12865a1658c138ec7cf929f3530ec17673b18bc2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'aromes' AND `entite_id` = 'vin|accord' AND `champ` = 'texte' AND `lang` = 'en' AND `source_hash` = '4e3fc8742b5ddccf4c05c7a0cd59aeb5b43c140c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'box-press' AND `champ` = 'terme' AND `lang` = 'en' AND `source_hash` = 'aa26d2c2bba70639a1aaf5fc4647830cd09d6398';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'cape' AND `champ` = 'terme' AND `lang` = 'en' AND `source_hash` = 'd5ffb218bcae792827d5a07ccfc6cb02e6fa74aa';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'claro' AND `champ` = 'terme' AND `lang` = 'en' AND `source_hash` = '21f72c3cc4b91c3c3576338b4137fa61cd084d3e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'entubado' AND `champ` = 'terme' AND `lang` = 'en' AND `source_hash` = '229cb6ea0b42b8ef7810127b8ee6c717d780ce59';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'figurado' AND `champ` = 'terme' AND `lang` = 'en' AND `source_hash` = '0cde6e1e1ed5d4b1a39df5a64134c75d92337fb6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'galera' AND `champ` = 'terme' AND `lang` = 'en' AND `source_hash` = '862a1e03c6f3d56a94b6d59e14239e3552e72b65';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'lector' AND `champ` = 'terme' AND `lang` = 'en' AND `source_hash` = '423eea19980caeb7e78c2c981c0b9f1b00d7969c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'ligero' AND `champ` = 'terme' AND `lang` = 'en' AND `source_hash` = 'b7d7ab2dd738a7fee7465918b8561dc34279c79a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'maduro' AND `champ` = 'terme' AND `lang` = 'en' AND `source_hash` = 'a01e23d908798ff820aeb9d9ad09a8ca35ee7f20';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'medio-tiempo' AND `champ` = 'terme' AND `lang` = 'en' AND `source_hash` = '007b46377a66e835467fdc938766eb4eafcb3dfc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'oscuro' AND `champ` = 'terme' AND `lang` = 'en' AND `source_hash` = '36c9b4bb25e99a8bd3975d9d3deb08392207f69d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'perfecto' AND `champ` = 'terme' AND `lang` = 'en' AND `source_hash` = '2bf543c5ad7c67101ed36c435cdd0bff20d436dc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'pilon' AND `champ` = 'terme' AND `lang` = 'en' AND `source_hash` = 'c4f3f201a789b658321159b582ba67784d35660a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'seco' AND `champ` = 'terme' AND `lang` = 'en' AND `source_hash` = 'd2b06657688b46bb93fb5308d12cc600e0105e63';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'sous-cape' AND `champ` = 'terme' AND `lang` = 'en' AND `source_hash` = '98c6d9a5214ccacabb5863e28a6bedea826107bf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'torcedor' AND `champ` = 'terme' AND `lang` = 'en' AND `source_hash` = '32dd9f228fbcd42f8f8040fb5248ba336a545d2b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'tripe' AND `champ` = 'terme' AND `lang` = 'en' AND `source_hash` = 'f1f5735b30bc8c7c9ebf1aa46a67c93808e6889d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'viso' AND `champ` = 'terme' AND `lang` = 'en' AND `source_hash` = '7124b9f33f935427d262e198f17ef787fec45dd4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'vitole' AND `champ` = 'terme' AND `lang` = 'en' AND `source_hash` = 'fe63ea976bb0bc978246fd70754a67c99be2a468';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'volado' AND `champ` = 'terme' AND `lang` = 'en' AND `source_hash` = '59bbecd68063dc06be8809973a9d871d45c24c9a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'box-press' AND `champ` = 'definition' AND `lang` = 'en' AND `source_hash` = '4bed155fe2068a74177b8179d53081b486592b68';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'cape' AND `champ` = 'definition' AND `lang` = 'en' AND `source_hash` = '558186cf220e5aa7310e280bade0610bfaa64417';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'claro' AND `champ` = 'definition' AND `lang` = 'en' AND `source_hash` = 'ed635ce2b5def7935eabebec2cfdcb136cfe9d43';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'entubado' AND `champ` = 'definition' AND `lang` = 'en' AND `source_hash` = '998478f3f2f32e69931a4f1525102d42b251dfe7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'figurado' AND `champ` = 'definition' AND `lang` = 'en' AND `source_hash` = 'b74306a701230709cd378eaa1fa8af264d20fc9a';
-- lexique|galera|definition|en — pupitre (l'estrade du lecteur) traduit par bench, contresens qui coupe le lien avec le lector
UPDATE `lexique` SET `definition_en` = 'The rolling room, where the torcedores work in rows facing one and the same lectern.'
 WHERE `id` = 'galera' AND SHA1(TRIM(`definition`)) = '73846a22f06958326f85e6a08e5eed7881d928d3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'galera' AND `champ` = 'definition' AND `lang` = 'en' AND `source_hash` = '73846a22f06958326f85e6a08e5eed7881d928d3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'lector' AND `champ` = 'definition' AND `lang` = 'en' AND `source_hash` = 'd92f9c3e26f092e5113efa482d420bea4253daff';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'ligero' AND `champ` = 'definition' AND `lang` = 'en' AND `source_hash` = '655367c7bc3b115f62ae22c70f2d0f52643a8fbd';
-- lexique|maduro|definition|en — got from trop familier pour obtenue par, registre soigné attendu
UPDATE `lexique` SET `definition_en` = 'A dark wrapper shade, obtained from a longer or hotter fermentation. The word says “ripe”, not “strong”: the colour comes from the process, not the power.'
 WHERE `id` = 'maduro' AND SHA1(TRIM(`definition`)) = 'c99963b492c1e59d9db0f2739b883d0829146c47';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'maduro' AND `champ` = 'definition' AND `lang` = 'en' AND `source_hash` = 'c99963b492c1e59d9db0f2739b883d0829146c47';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'medio-tiempo' AND `champ` = 'definition' AND `lang` = 'en' AND `source_hash` = 'aa8a9ec0fde789153d619d4a808404374620a7ed';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'oscuro' AND `champ` = 'definition' AND `lang` = 'en' AND `source_hash` = '168fee99a5e389f3fe7a8fd5cd7acaa6f958f44d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'perfecto' AND `champ` = 'definition' AND `lang` = 'en' AND `source_hash` = 'd9efa03dac71c589abf6d051cc966c4762b2d9a8';
-- lexique|pilon|definition|en — wanted temperature peu naturel pour la température voulue, desired est l'usage
UPDATE `lexique` SET `definition_en` = 'The stack of leaves piled up to ferment. Its heat rises on its own; it is turned when it reaches the desired temperature.'
 WHERE `id` = 'pilon' AND SHA1(TRIM(`definition`)) = '4f3a88d8aee0bc4c26d0fa4573460f6581cdb2a4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'pilon' AND `champ` = 'definition' AND `lang` = 'en' AND `source_hash` = '4f3a88d8aee0bc4c26d0fa4573460f6581cdb2a4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'seco' AND `champ` = 'definition' AND `lang` = 'en' AND `source_hash` = 'bb586259a01e766af94232e0133e23d9dfa59fc5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'sous-cape' AND `champ` = 'definition' AND `lang` = 'en' AND `source_hash` = '4a28df1ea5c96132c7a5b63808b42522f3fd366a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'torcedor' AND `champ` = 'definition' AND `lang` = 'en' AND `source_hash` = '05a7e342af948ef29633a5b89dc7bc2af7278154';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'tripe' AND `champ` = 'definition' AND `lang` = 'en' AND `source_hash` = '9f9a4a6ee860dfdf714e661d572e0f56a400f180';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'viso' AND `champ` = 'definition' AND `lang` = 'en' AND `source_hash` = '661c26bbf2670f62cd583b6e34778c83909c4302';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'vitole' AND `champ` = 'definition' AND `lang` = 'en' AND `source_hash` = '288ab8b2b152e45f7705a1a4b1d851ca1153f42e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lexique' AND `entite_id` = 'volado' AND `champ` = 'definition' AND `lang` = 'en' AND `source_hash` = '96215c39d0c197a0f1607446d99965adc8bab5b1';

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 236';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 236', 'systeme', 'traductions_relues', 'systeme', 0, 'Relecture en par expert-traduction (agent) : 370 traduction(s) relue(s) — 27 corrigee(s), 343 validee(s) telles quelles ; producer_countries 167, markets 40, production_zones 51, habanos_presence 52, aromes 20, lexique 40');

SELECT
  (SELECT COUNT(*) FROM `translation_status` WHERE `lang` = 'en' AND `statut` = 'relu' AND `relecteur` = 'expert-traduction (agent)') >= 370 AS relues,
  (SELECT COUNT(*) FROM `translation_status` WHERE `statut` = 'relu' AND (`relecteur` IS NULL OR `relecteur` = '')) = 0 AS chaque_relecture_a_son_relecteur;
SELECT `lang`, SUM(`statut` = 'relu') AS relues, COUNT(*) AS total FROM `translation_status` GROUP BY `lang`;
