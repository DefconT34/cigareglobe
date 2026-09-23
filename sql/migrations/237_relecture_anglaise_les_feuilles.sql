-- ════════════════════════════════════════════════════════
-- 237 — Relecture anglaise — les feuilles
-- ────────────────────────────────────────────────────────
-- Relecture des traductions « en » par : expert-traduction (agent).
-- Fichier de verdicts : relu3_en_feuilles.json ; generee par tools/i18n_relecture.php le 2026-09-23.
-- Un texte « corrige » est reecrit ; tout texte relu passe au statut « relu »,
-- avec le nom du relecteur. L'empreinte du francais est verifiee dans le WHERE :
-- un francais qui a change depuis l'export ne se laisse pas declarer relu.
-- ════════════════════════════════════════════════════════

UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'bresil-arapiraca' AND `champ` = 'emploi' AND `lang` = 'en' AND `source_hash` = 'c76387d6a15c013423e74d08899c1174eaf5008f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'bresil-mata-fina' AND `champ` = 'emploi' AND `lang` = 'en' AND `source_hash` = 'f5071024b20edcc599bd45374b8b1908ba6d3ae0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'bresil-mata-norte' AND `champ` = 'emploi' AND `lang` = 'en' AND `source_hash` = '0d82d8a7041792507ffc3c0d3d24387a387fbddc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'cameroun-cape' AND `champ` = 'emploi' AND `lang` = 'en' AND `source_hash` = 'd5ffb218bcae792827d5a07ccfc6cb02e6fa74aa';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'canaries-la-palma' AND `champ` = 'emploi' AND `lang` = 'en' AND `source_hash` = '4bad6f09e2465e840e57a43b94e47e6b7ad85f50';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'cote-d-ivoire-didievi' AND `champ` = 'emploi' AND `lang` = 'en' AND `source_hash` = '5d8dc758c34ee03c314272bd4d7edd79bfe57bc9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'cote-d-ivoire-tiebissou' AND `champ` = 'emploi' AND `lang` = 'en' AND `source_hash` = 'd5ffb218bcae792827d5a07ccfc6cb02e6fa74aa';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'cuba-corojo' AND `champ` = 'emploi' AND `lang` = 'en' AND `source_hash` = 'd5ffb218bcae792827d5a07ccfc6cb02e6fa74aa';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'cuba-criollo' AND `champ` = 'emploi' AND `lang` = 'en' AND `source_hash` = '0d82d8a7041792507ffc3c0d3d24387a387fbddc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'cuba-habano-2000' AND `champ` = 'emploi' AND `lang` = 'en' AND `source_hash` = 'd5ffb218bcae792827d5a07ccfc6cb02e6fa74aa';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'dominicaine-olor' AND `champ` = 'emploi' AND `lang` = 'en' AND `source_hash` = '98c6d9a5214ccacabb5863e28a6bedea826107bf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'dominicaine-piloto-cubano' AND `champ` = 'emploi' AND `lang` = 'en' AND `source_hash` = 'f1f5735b30bc8c7c9ebf1aa46a67c93808e6889d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'dominicaine-san-vicente' AND `champ` = 'emploi' AND `lang` = 'en' AND `source_hash` = '5d8dc758c34ee03c314272bd4d7edd79bfe57bc9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'equateur-connecticut' AND `champ` = 'emploi' AND `lang` = 'en' AND `source_hash` = 'd5ffb218bcae792827d5a07ccfc6cb02e6fa74aa';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'equateur-habano' AND `champ` = 'emploi' AND `lang` = 'en' AND `source_hash` = 'd5ffb218bcae792827d5a07ccfc6cb02e6fa74aa';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'equateur-sumatra' AND `champ` = 'emploi' AND `lang` = 'en' AND `source_hash` = 'd5ffb218bcae792827d5a07ccfc6cb02e6fa74aa';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'honduras-connecticut-shade' AND `champ` = 'emploi' AND `lang` = 'en' AND `source_hash` = 'd5ffb218bcae792827d5a07ccfc6cb02e6fa74aa';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'honduras-corojo' AND `champ` = 'emploi' AND `lang` = 'en' AND `source_hash` = 'd5ffb218bcae792827d5a07ccfc6cb02e6fa74aa';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'indonesie-besuki' AND `champ` = 'emploi' AND `lang` = 'en' AND `source_hash` = 'f5071024b20edcc599bd45374b8b1908ba6d3ae0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'indonesie-deli' AND `champ` = 'emploi' AND `lang` = 'en' AND `source_hash` = 'd5ffb218bcae792827d5a07ccfc6cb02e6fa74aa';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'italie-kentucky' AND `champ` = 'emploi' AND `lang` = 'en' AND `source_hash` = 'f5071024b20edcc599bd45374b8b1908ba6d3ae0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'jamaique-cow-tongue' AND `champ` = 'emploi' AND `lang` = 'en' AND `source_hash` = 'f5071024b20edcc599bd45374b8b1908ba6d3ae0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'mexique-negro-san-andres' AND `champ` = 'emploi' AND `lang` = 'en' AND `source_hash` = '0aab0042d9002165ec4e55c9151793024eb99a75';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'nicaragua-corojo-99' AND `champ` = 'emploi' AND `lang` = 'en' AND `source_hash` = 'f5071024b20edcc599bd45374b8b1908ba6d3ae0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'nicaragua-criollo-98' AND `champ` = 'emploi' AND `lang` = 'en' AND `source_hash` = '0d82d8a7041792507ffc3c0d3d24387a387fbddc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'nicaragua-habano' AND `champ` = 'emploi' AND `lang` = 'en' AND `source_hash` = 'f5071024b20edcc599bd45374b8b1908ba6d3ae0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'nicaragua-havana-92' AND `champ` = 'emploi' AND `lang` = 'en' AND `source_hash` = '0d82d8a7041792507ffc3c0d3d24387a387fbddc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'panama-corojo' AND `champ` = 'emploi' AND `lang` = 'en' AND `source_hash` = 'd5ffb218bcae792827d5a07ccfc6cb02e6fa74aa';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'panama-habano' AND `champ` = 'emploi' AND `lang` = 'en' AND `source_hash` = 'f5071024b20edcc599bd45374b8b1908ba6d3ae0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'philippines-cagayan' AND `champ` = 'emploi' AND `lang` = 'en' AND `source_hash` = '4bad6f09e2465e840e57a43b94e47e6b7ad85f50';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'usa-broadleaf' AND `champ` = 'emploi' AND `lang` = 'en' AND `source_hash` = '0aab0042d9002165ec4e55c9151793024eb99a75';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'usa-connecticut-shade' AND `champ` = 'emploi' AND `lang` = 'en' AND `source_hash` = 'd5ffb218bcae792827d5a07ccfc6cb02e6fa74aa';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'bresil-arapiraca' AND `champ` = 'genese' AND `lang` = 'en' AND `source_hash` = '59795de0f3966dc51ff27bb5b0f170aca4b022d5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'bresil-mata-fina' AND `champ` = 'genese' AND `lang` = 'en' AND `source_hash` = 'fad8fca86c479018bbbe7212c20a0e1147623623';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'bresil-mata-norte' AND `champ` = 'genese' AND `lang` = 'en' AND `source_hash` = 'b5b171ee44af01c433dfa6c44b112c6a2f107e54';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'cameroun-cape' AND `champ` = 'genese' AND `lang` = 'en' AND `source_hash` = '4bea4a6f319e82c8cfcafe9c763d551a1515c1b9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'canaries-la-palma' AND `champ` = 'genese' AND `lang` = 'en' AND `source_hash` = 'f3b4b851e786b9bff521e5eb28c6b1eab6744a18';
-- feuilles|cote-d-ivoire-didievi|genese|en — caves rendu par merchants ; le glossaire impose cigar cellars
UPDATE `feuilles` SET `genese_en` = 'A leaf from the Didiévi department, next to Tiébissou in the Bélier region. Abidjan''s cigar cellars credit it with Le Fagot''s binder and filler — the second of the two soils from which they say the cigar''s aromas come. Like its neighbour, it has no known variety.'
 WHERE `id` = 'cote-d-ivoire-didievi' AND SHA1(TRIM(`genese`)) = 'a2e5835029f9a00e965e60ed66445cf36a6789dc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'cote-d-ivoire-didievi' AND `champ` = 'genese' AND `lang` = 'en' AND `source_hash` = 'a2e5835029f9a00e965e60ed66445cf36a6789dc';
-- feuilles|cote-d-ivoire-tiebissou|genese|en — caves rendu par merchants ; le glossaire impose cigar cellars
UPDATE `feuilles` SET `genese_en` = 'A leaf from the Tiébissou department, in central Côte d''Ivoire. It is known only through the cigar it dresses: the cigar cellars of Abidjan that sell Le Fagot credit it with the wrapper. No agricultural record of tobacco in the Bélier has been found, and the variety is stated nowhere.'
 WHERE `id` = 'cote-d-ivoire-tiebissou' AND SHA1(TRIM(`genese`)) = 'd8cdd6900e2a4de25cfd1cc72d24fccfd37c5547';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'cote-d-ivoire-tiebissou' AND `champ` = 'genese' AND `lang` = 'en' AND `source_hash` = 'd8cdd6900e2a4de25cfd1cc72d24fccfd37c5547';
-- feuilles|cuba-corojo|genese|en — collocation non naturelle : frailty to disease → vulnerability to disease
UPDATE `feuilles` SET `genese_en` = 'A selection, not an invention: in the 1930s and 1940s Diego Rodríguez, who had rented the El Corojo vega near San Luis, in the Vuelta Abajo, since the 1920s, sorted Criollo seed until he obtained a plant apart — dark leaf, fine veins, made for wrapper — and named it after his farm. The year 1947 circulates for its coming into cultivation; the trade press does not date it so precisely, and the entry says so. He died in 1956; his son Daniel left Cuba in 1960, and the vega was nationalised. It reigned over Havana wrappers until the late 1990s, before its vulnerability to disease had it replaced by its descendants.'
 WHERE `id` = 'cuba-corojo' AND SHA1(TRIM(`genese`)) = '99436eb9cd916a8ba4203641ab7350ed79c4ebcc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'cuba-corojo' AND `champ` = 'genese' AND `lang` = 'en' AND `source_hash` = '99436eb9cd916a8ba4203641ab7350ed79c4ebcc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'cuba-criollo' AND `champ` = 'genese' AND `lang` = 'en' AND `source_hash` = 'ab06536a85569ebfaaed70a326d892b110a1d210';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'cuba-habano-2000' AND `champ` = 'genese' AND `lang` = 'en' AND `source_hash` = 'e3924a35b4e9be7c866305305b78f2dc7927d92a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'dominicaine-olor' AND `champ` = 'genese' AND `lang` = 'en' AND `source_hash` = '0a6fac6edf3e6a4ec327ac2f41c7dc9a62928594';
-- feuilles|dominicaine-piloto-cubano|genese|en — calque : differs by what one reads → differs depending on what one reads
UPDATE `feuilles` SET `genese_en` = 'A seed from the Vuelta Abajo, out of Cuba in 1962 — the year when the rupture that scattered the Cuban families also moved their seeds. Who carried it differs depending on what one reads: trade usage says Carlos Toraño senior; the cigar press, in 2015, names an émigré, Satornini, and a Cuban zone called Piloto from which the name would come. The entry writes both. Cuban seed at the origin, it is held today to be a Dominican tobacco in its own right — and, says Hendrik Kelner, present in varying doses in almost every Davidoff line.'
 WHERE `id` = 'dominicaine-piloto-cubano' AND SHA1(TRIM(`genese`)) = 'ea359e59649dc7ed33ce6254be750f5e081bcefc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'dominicaine-piloto-cubano' AND `champ` = 'genese' AND `lang` = 'en' AND `source_hash` = 'ea359e59649dc7ed33ce6254be750f5e081bcefc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'dominicaine-san-vicente' AND `champ` = 'genese' AND `lang` = 'en' AND `source_hash` = 'fc3de5f4a00309be4c57717820d2b813b5b5a961';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'equateur-connecticut' AND `champ` = 'genese' AND `lang` = 'en' AND `source_hash` = '95bd438ba40656fbebec5a8b6e6e460d3e41f13a';
-- feuilles|equateur-habano|genese|en — préposition non naturelle : planted on the foothills → planted in the foothills
UPDATE `feuilles` SET `genese_en` = 'Cuban seed planted in the Andean foothills. Ecuador has no tradition of rolling cigars: it supplies leaf to makers in Nicaragua, Honduras and the Dominican Republic.'
 WHERE `id` = 'equateur-habano' AND SHA1(TRIM(`genese`)) = '0ef15efa52963399f2206c852dda9311d50e2bd8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'equateur-habano' AND `champ` = 'genese' AND `lang` = 'en' AND `source_hash` = '0ef15efa52963399f2206c852dda9311d50e2bd8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'equateur-sumatra' AND `champ` = 'genese' AND `lang` = 'en' AND `source_hash` = 'ee43324dbcb87629cc77ef105bafd67fdc8dfe81';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'honduras-connecticut-shade' AND `champ` = 'genese' AND `lang` = 'en' AND `source_hash` = 'b4e1aa1934b4a76a58532573388fb700deff0b15';
-- feuilles|honduras-corojo|genese|en — omission de « le moho azul, ce champignon qui s'attaque aux plants » ; retouche de la session principale : this fungus (calque de « ce champignon ») → the fungus
UPDATE `feuilles` SET `genese_en` = 'The Cuban seed of 1947 reached the Jamastrán valley during the 1960s, planted by the house of Camacho — which claims to have grown there the first Corojo leaf outside Cuba. Blue mould — the moho azul, the fungus that attacks the plants — would drive the original from Cuban fields some fifteen years later: what had been an experiment became a refuge.'
 WHERE `id` = 'honduras-corojo' AND SHA1(TRIM(`genese`)) = 'c7625f59e94e908abfd18273373c6ae019b2a88f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'honduras-corojo' AND `champ` = 'genese' AND `lang` = 'en' AND `source_hash` = 'c7625f59e94e908abfd18273373c6ae019b2a88f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'indonesie-besuki' AND `champ` = 'genese' AND `lang` = 'en' AND `source_hash` = '36b7575f66ac57a3bdbbee29fa51087579525b6c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'indonesie-deli' AND `champ` = 'genese' AND `lang` = 'en' AND `source_hash` = 'd71271ea1cd378e759a14a699806b38620d19431';
-- feuilles|italie-kentucky|genese|en — siècle en chiffres (19th) au lieu des lettres, incohérent avec le reste du lot
UPDATE `feuilles` SET `genese_en` = 'The seed comes from North America and bears the name of the state that made it known. It reached Italy in the nineteenth century, in a country already growing tobacco for its state monopoly. It stayed, and it is today the only cigar leaf of continental Europe.'
 WHERE `id` = 'italie-kentucky' AND SHA1(TRIM(`genese`)) = 'ad2d60808f5ba0ed2c0fa0760cb01f9b76e79a0d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'italie-kentucky' AND `champ` = 'genese' AND `lang` = 'en' AND `source_hash` = 'ad2d60808f5ba0ed2c0fa0760cb01f9b76e79a0d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'jamaique-cow-tongue' AND `champ` = 'genese' AND `lang` = 'en' AND `source_hash` = '439f9cdbbc32fd75a2e943632aa7eb1f6f7347f4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'mexique-negro-san-andres' AND `champ` = 'genese' AND `lang` = 'en' AND `source_hash` = '7cbe9ccd99cfbeafef15bf1f6be52cc6e200890e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'nicaragua-corojo-99' AND `champ` = 'genese' AND `lang` = 'en' AND `source_hash` = '39ecc6586d849150b82cdb6a15476c60c90ca0ca';
-- feuilles|nicaragua-criollo-98|genese|en — omission de « le moho azul » (terme espagnol du glossaire)
UPDATE `feuilles` SET `genese_en` = 'A Cuban answer to blue mould, the moho azul: a cross of Havana 92 and Habana P.R., selected to resist the fungus that had destroyed the harvests of the late 1970s. Nicaragua adopted it and made it one of its two main seeds.'
 WHERE `id` = 'nicaragua-criollo-98' AND SHA1(TRIM(`genese`)) = 'c50c62328cf459d218d67601c7fa2ed7933f526d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'nicaragua-criollo-98' AND `champ` = 'genese' AND `lang` = 'en' AND `source_hash` = 'c50c62328cf459d218d67601c7fa2ed7933f526d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'nicaragua-habano' AND `champ` = 'genese' AND `lang` = 'en' AND `source_hash` = 'f1ce430f506cdcefccb21ddcc0e108f5c83f4a61';
-- feuilles|nicaragua-havana-92|genese|en — tournure grammaticalement bancale : found it only a few acres → found only a few acres of it
UPDATE `feuilles` SET `genese_en` = 'The generation before, and the mother of the two that followed: the Cuban encyclopaedia says it came from crossing Corojo with a Polish line, R × T, which gave it resistance to blue mould and black shank; crossed then with Habana P.R., it gave Criollo 98 and Corojo 99, which Nicaragua adopted. The three Nicaraguan leaves are thus three stages of one lineage born of the fight against moho azul. In 2015 the trade press still gave it as Cuba''s main variety, and found only a few acres of it in Nicaragua.'
 WHERE `id` = 'nicaragua-havana-92' AND SHA1(TRIM(`genese`)) = '5fccc82330d707061d80142d3f62aefd42da5716';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'nicaragua-havana-92' AND `champ` = 'genese' AND `lang` = 'en' AND `source_hash` = '5fccc82330d707061d80142d3f62aefd42da5716';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'panama-corojo' AND `champ` = 'genese' AND `lang` = 'en' AND `source_hash` = '7cadf80cd2fb382e5480ff2eb70fe5ba305c8989';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'panama-habano' AND `champ` = 'genese' AND `lang` = 'en' AND `source_hash` = 'd5b767363a8cbc655d8eb592bfec00b08bffc3f8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'philippines-cagayan' AND `champ` = 'genese' AND `lang` = 'en' AND `source_hash` = '59e31d99622ad76c0d3efc1da7baebbd0b6da86d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'usa-broadleaf' AND `champ` = 'genese' AND `lang` = 'en' AND `source_hash` = '18fd6b5f3d6dc0ca358e6db11e64896b66d32f13';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'usa-connecticut-shade' AND `champ` = 'genese' AND `lang` = 'en' AND `source_hash` = 'a9660e58123e8c0ba436c70a803fad55f0e70669';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'bresil-arapiraca' AND `champ` = 'culture' AND `lang` = 'en' AND `source_hash` = '607600085a514880ecc10b498a089dc9f1d86eee';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'bresil-mata-fina' AND `champ` = 'culture' AND `lang` = 'en' AND `source_hash` = 'cfed17ce817b0609efdc3d2b5d927ff2d66e7039';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'bresil-mata-norte' AND `champ` = 'culture' AND `lang` = 'en' AND `source_hash` = 'd4c0a15ee224b7443835afe0ec995df2ee11d200';
-- feuilles|cameroun-cape|culture|en — plein soleil rendu par full sun ; le glossaire impose sun-grown
UPDATE `feuilles` SET `culture_en` = 'SUN-GROWN — rare for a wrapper: the season''s steady cloud cover makes shade cloth unnecessary. The soils here are so rich they need no fertiliser. The wrapper region straddles eastern Cameroon, around Batouri, and neighbouring Central African Republic, where the processing plants stand.'
 WHERE `id` = 'cameroun-cape' AND SHA1(TRIM(`culture`)) = '5f3060ad8729fe7ee79232adacd9ef4fb619805a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'cameroun-cape' AND `champ` = 'culture' AND `lang` = 'en' AND `source_hash` = '5f3060ad8729fe7ee79232adacd9ef4fb619805a';
-- feuilles|canaries-la-palma|culture|en — fabriques rendu par workshops ; le glossaire impose factory (jamais workshop)
UPDATE `feuilles` SET `culture_en` = 'The island''s subtropical oceanic climate suits these Caribbean seeds. Six artisans remain, of some twenty factories La Palma once counted; each cigar is rolled from start to finish by a single person, as in Cuba.'
 WHERE `id` = 'canaries-la-palma' AND SHA1(TRIM(`culture`)) = '640775ca07fc1cb9b4d98bb7e324a9f69971d43a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'canaries-la-palma' AND `champ` = 'culture' AND `lang` = 'en' AND `source_hash` = '640775ca07fc1cb9b4d98bb7e324a9f69971d43a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'cote-d-ivoire-didievi' AND `champ` = 'culture' AND `lang` = 'en' AND `source_hash` = '762fa12cbbe8bbd8fe486a5eb41f8ac4ac4d3a32';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'cote-d-ivoire-tiebissou' AND `champ` = 'culture' AND `lang` = 'en' AND `source_hash` = '762fa12cbbe8bbd8fe486a5eb41f8ac4ac4d3a32';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'cuba-corojo' AND `champ` = 'culture' AND `lang` = 'en' AND `source_hash` = '2bb11dd8b23158ad011bcc0f501c3e510b92a2e7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'cuba-criollo' AND `champ` = 'culture' AND `lang` = 'en' AND `source_hash` = '1b5cc977f9b04e51b2422ab50a255ddee94c9b95';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'cuba-habano-2000' AND `champ` = 'culture' AND `lang` = 'en' AND `source_hash` = '9c92f5a5bf8a92effd84f85663b24364844e8471';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'dominicaine-olor' AND `champ` = 'culture' AND `lang` = 'en' AND `source_hash` = '1c522535c94e9dfe307dfbab1123a949c3753adc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'dominicaine-piloto-cubano' AND `champ` = 'culture' AND `lang` = 'en' AND `source_hash` = '3cd88c8f947ef739231a55bedef448c849e36699';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'dominicaine-san-vicente' AND `champ` = 'culture' AND `lang` = 'en' AND `source_hash` = 'bf95519558aa5e6ac7a027a4ddfd5c1ff3d12833';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'equateur-connecticut' AND `champ` = 'culture' AND `lang` = 'en' AND `source_hash` = '1eddd331056fb89235ff4909bbfc9b8215ce6482';
-- feuilles|equateur-habano|culture|en — temps : « fait » (présent, fait actuel) rendu par made (passé) ; retouche de la session principale : makes the country's name n'est pas idiomatique au présent → has made
UPDATE `feuilles` SET `culture_en` = 'Grown WITHOUT SHADE CLOTH, the exception in the trade: the season''s cloud cover filters the sun continuously and makes tenting unnecessary. It is this even light that has made the country''s name.'
 WHERE `id` = 'equateur-habano' AND SHA1(TRIM(`culture`)) = 'e3e005d76eaa7cc0066d13febf497480097d7901';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'equateur-habano' AND `champ` = 'culture' AND `lang` = 'en' AND `source_hash` = 'e3e005d76eaa7cc0066d13febf497480097d7901';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'equateur-sumatra' AND `champ` = 'culture' AND `lang` = 'en' AND `source_hash` = '9360c40b42511c335f9c5fe97f182845d632e381';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'honduras-connecticut-shade' AND `champ` = 'culture' AND `lang` = 'en' AND `source_hash` = 'f8909a043160a8870ef4b1cc92c5606d1b1bcfb1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'honduras-corojo' AND `champ` = 'culture' AND `lang` = 'en' AND `source_hash` = '5c121dc4003e2130c7f034a8ec3b224afe25310b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'indonesie-besuki' AND `champ` = 'culture' AND `lang` = 'en' AND `source_hash` = 'a89395ff1abf0bfa2c8989218a65f66c81ac2692';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'indonesie-deli' AND `champ` = 'culture' AND `lang` = 'en' AND `source_hash` = 'eafe7099bdbc32e6e32522e636be49263ce1b39a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'italie-kentucky' AND `champ` = 'culture' AND `lang` = 'en' AND `source_hash` = '5d02dd3a0e53f2a99eb1ef16a2e3dc1ff0d539e1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'jamaique-cow-tongue' AND `champ` = 'culture' AND `lang` = 'en' AND `source_hash` = 'd05db77ffbfe94bef999285edeba0884c0b9d43b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'mexique-negro-san-andres' AND `champ` = 'culture' AND `lang` = 'en' AND `source_hash` = '0c41c0b29fad9dbaab37fca0f2cfe1a84afea8e1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'nicaragua-corojo-99' AND `champ` = 'culture' AND `lang` = 'en' AND `source_hash` = '03c28a823ffeb7005d30832bad252540661a71bd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'nicaragua-criollo-98' AND `champ` = 'culture' AND `lang` = 'en' AND `source_hash` = '608f82e804ea1ee9b9d557c981efb00446e30d9b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'nicaragua-habano' AND `champ` = 'culture' AND `lang` = 'en' AND `source_hash` = '538d4bb1dfa2af5549d79207c6056bc00a653204';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'nicaragua-havana-92' AND `champ` = 'culture' AND `lang` = 'en' AND `source_hash` = 'c7d802ff733d4792d8bcace51e82b00f875166a3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'panama-corojo' AND `champ` = 'culture' AND `lang` = 'en' AND `source_hash` = '340cf67b1c4db44db1192e7f9f8907b7a996050e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'panama-habano' AND `champ` = 'culture' AND `lang` = 'en' AND `source_hash` = '37d45e7918cb88724fd207278c28c0681b0e495f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'philippines-cagayan' AND `champ` = 'culture' AND `lang` = 'en' AND `source_hash` = '22a3d510952b72e0837aeb4b37e7eb2f49d7da48';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'usa-broadleaf' AND `champ` = 'culture' AND `lang` = 'en' AND `source_hash` = '3fb7d55de0a7bb6859301405e7acd9178ed4a384';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'usa-connecticut-shade' AND `champ` = 'culture' AND `lang` = 'en' AND `source_hash` = 'e43d0fe7328b9d69e0182479bd1a3d45106c73d1';
-- feuilles|bresil-arapiraca|caracteres|en — renforcement injustifié : « très blanche » rendu par « strikingly white » au lieu de « very white »
UPDATE `feuilles` SET `caracteres_en` = 'Dark and oily, it burns evenly and leaves a very white ash. Where Mata Fina goes towards flowers, it goes towards chocolate and spice — hence its use as a maduro wrapper.'
 WHERE `id` = 'bresil-arapiraca' AND SHA1(TRIM(`caracteres`)) = 'a44c1346cdf8db4e9d2acbae15bf86c4cf4cc536';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'bresil-arapiraca' AND `champ` = 'caracteres' AND `lang` = 'en' AND `source_hash` = 'a44c1346cdf8db4e9d2acbae15bf86c4cf4cc536';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'bresil-mata-fina' AND `champ` = 'caracteres' AND `lang` = 'en' AND `source_hash` = 'edc775cd5fd891eb05b813cd4294e2be24a97f7a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'bresil-mata-norte' AND `champ` = 'caracteres' AND `lang` = 'en' AND `source_hash` = 'db19b7d844012c15174b38cc96a902dc0db617cd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'cameroun-cape' AND `champ` = 'caracteres' AND `lang` = 'en' AND `source_hash` = '761e4a8344fb3d2e07e39e3bb54c56af437c3f32';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'canaries-la-palma' AND `champ` = 'caracteres' AND `lang` = 'en' AND `source_hash` = '63d2489b6b1d463cbe50536ef52db844e603e3d6';
-- feuilles|cuba-corojo|caracteres|en — ajout : « disease-resistant » précise ce que le français ne précise pas (« résistante » seule)
UPDATE `feuilles` SET `caracteres_en` = 'A fine, even wrapper whose name outlived the plant: it turns up in Honduras and in Cuba''s Corojo 99, its resistant offspring.'
 WHERE `id` = 'cuba-corojo' AND SHA1(TRIM(`caracteres`)) = '48c5c1b1624d631a12ed7478d021078d95d18cca';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'cuba-corojo' AND `champ` = 'caracteres' AND `lang` = 'en' AND `source_hash` = '48c5c1b1624d631a12ed7478d021078d95d18cca';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'cuba-criollo' AND `champ` = 'caracteres' AND `lang` = 'en' AND `source_hash` = '92e4082b1811cf2e80d9c165e71f461b7685f5e3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'cuba-habano-2000' AND `champ` = 'caracteres' AND `lang` = 'en' AND `source_hash` = '849281ea358475c62561ca653576abd039719744';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'dominicaine-olor' AND `champ` = 'caracteres' AND `lang` = 'en' AND `source_hash` = 'd11f26394318f53df6a13a77d68d054b45ffb780';
-- feuilles|dominicaine-piloto-cubano|caracteres|en — calque : « s'entend » rendu par « can be heard » (sens auditif erroné) ; sens réel = perceptible
UPDATE `feuilles` SET `caracteres_en` = 'It is the strength leaf of Dominican blends, the one mixed in for taste rather than structure. Its Cuban lineage comes through.'
 WHERE `id` = 'dominicaine-piloto-cubano' AND SHA1(TRIM(`caracteres`)) = 'edc087fc001738ae0c550fe339dbf20792032ce4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'dominicaine-piloto-cubano' AND `champ` = 'caracteres' AND `lang` = 'en' AND `source_hash` = 'edc087fc001738ae0c550fe339dbf20792032ce4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'dominicaine-san-vicente' AND `champ` = 'caracteres' AND `lang` = 'en' AND `source_hash` = '846f6fea030f28721b8c99894a7191e709339b30';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'equateur-connecticut' AND `champ` = 'caracteres' AND `lang` = 'en' AND `source_hash` = 'f52049230d0e9e884eccbeab86637c8a5f524c01';
-- feuilles|equateur-habano|caracteres|en — incohérence : « douceur » du Connecticut équatorien traduit par sweetness ici, alors que sa propre fiche (equateur-connecticut) dit mildness pour la même caractéristique
UPDATE `feuilles` SET `caracteres_en` = 'A supple, even wrapper, among the most widespread on premium cigars today. It brings body and spice where its Connecticut neighbour brings mildness.'
 WHERE `id` = 'equateur-habano' AND SHA1(TRIM(`caracteres`)) = '315eb7ffe95799457e7367a55913a8dff409969e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'equateur-habano' AND `champ` = 'caracteres' AND `lang` = 'en' AND `source_hash` = '315eb7ffe95799457e7367a55913a8dff409969e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'equateur-sumatra' AND `champ` = 'caracteres' AND `lang` = 'en' AND `source_hash` = 'd3f97d545ef0b1eca588d9e6cb1efcb124d49efc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'honduras-connecticut-shade' AND `champ` = 'caracteres' AND `lang` = 'en' AND `source_hash` = 'eda65d1f05e2018a427da5afaec386339fa46336';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'honduras-corojo' AND `champ` = 'caracteres' AND `lang` = 'en' AND `source_hash` = 'a7444bdf3c9730cadc14a5daa51e7a98a44c23c6';
-- feuilles|indonesie-besuki|caracteres|en — incohérence : « douce » traduit par sweet ici, alors que mild/mildness partout ailleurs dans le lot pour l'intensité d'une feuille
UPDATE `feuilles` SET `caracteres_en` = 'A mild, aromatic leaf, supple enough to serve as a wrapper and neutral enough to go into the filler. It is this double calling that sets it apart.'
 WHERE `id` = 'indonesie-besuki' AND SHA1(TRIM(`caracteres`)) = 'ed6f7337b04d552a63a0a0025c2d7a2682918a80';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'indonesie-besuki' AND `champ` = 'caracteres' AND `lang` = 'en' AND `source_hash` = 'ed6f7337b04d552a63a0a0025c2d7a2682918a80';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'indonesie-deli' AND `champ` = 'caracteres' AND `lang` = 'en' AND `source_hash` = 'c529f5987aa4305e5be4eaccc1e3125bcb18e820';
-- feuilles|italie-kentucky|caracteres|en — calque : « depending on the case » pour « selon les cas » ; plus naturel : « as the case may be »
UPDATE `feuilles` SET `caracteres_en` = 'A thick, veined, dark leaf. It serves as both wrapper and filler, which is rare: the Toscano is made of a single kind of leaf, where a Caribbean cigar blends three or four. Italian Kentucky supplies mainly the filler, the wrapper coming from Italy or the United States, as the case may be.'
 WHERE `id` = 'italie-kentucky' AND SHA1(TRIM(`caracteres`)) = '68999019402e9a076e50c786b1cc40f1373a4e1d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'italie-kentucky' AND `champ` = 'caracteres' AND `lang` = 'en' AND `source_hash` = '68999019402e9a076e50c786b1cc40f1373a4e1d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'jamaique-cow-tongue' AND `champ` = 'caracteres' AND `lang` = 'en' AND `source_hash` = '742e54c12c03ebf956e9e42bf2ebd58b4c89c751';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'mexique-negro-san-andres' AND `champ` = 'caracteres' AND `lang` = 'en' AND `source_hash` = '930e9cfb8b270dd71656eaf30e568fa7b794dab0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'nicaragua-corojo-99' AND `champ` = 'caracteres' AND `lang` = 'en' AND `source_hash` = '41fca0baaefa826ff3e91d0dbbea18352131ee13';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'nicaragua-criollo-98' AND `champ` = 'caracteres' AND `lang` = 'en' AND `source_hash` = '69173f08b594313e07b296e95b939aaf50a66409';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'nicaragua-habano' AND `champ` = 'caracteres' AND `lang` = 'en' AND `source_hash` = 'eaec1276efc5da82666bbade8b1c982e1d68c9f6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'nicaragua-havana-92' AND `champ` = 'caracteres' AND `lang` = 'en' AND `source_hash` = '92e2bc70f071f26f2a4cf95ca4db0ec558bbd33c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'panama-corojo' AND `champ` = 'caracteres' AND `lang` = 'en' AND `source_hash` = '6423a774fda313dc5d4addd4f8ffd0ef010099d4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'panama-habano' AND `champ` = 'caracteres' AND `lang` = 'en' AND `source_hash` = '5bf67594cd99392d0fab2aa685ab1f8bbf20bf3f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'philippines-cagayan' AND `champ` = 'caracteres' AND `lang` = 'en' AND `source_hash` = '7370837c60f4e2979000c0f0aca7c250e59d05c4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'usa-broadleaf' AND `champ` = 'caracteres' AND `lang` = 'en' AND `source_hash` = 'a522cc1fd7127804f9f07b277b0311a0ef079026';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'usa-connecticut-shade' AND `champ` = 'caracteres' AND `lang` = 'en' AND `source_hash` = 'c2c7c7cd6f7052fe299a8ee7543ea341050c2dab';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'bresil-arapiraca' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '052f850aeb7b8d7a5aae07f0fac433ebfdf3b1e7';
-- feuilles|bresil-mata-fina|notes|en — incohérence : Douceur → Sweetness ici, alors que Mildness partout ailleurs dans le lot pour ce terme
UPDATE `feuilles` SET `notes_en` = '["Mildness","Flowers","Pale wood"]'
 WHERE `id` = 'bresil-mata-fina' AND SHA1(TRIM(`notes`)) = 'a2f471853767884316c0bf92e3cdc7979f59350e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'bresil-mata-fina' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = 'a2f471853767884316c0bf92e3cdc7979f59350e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'bresil-mata-norte' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '8678ef9bf522c2911cf7af30d9387df8a6957bc4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'cameroun-cape' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '7806a4a1352ddf1f91124e7e6db933d6777e68b3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'canaries-la-palma' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '4689b600e429ccae75731103cbd0c9ead3b641d7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'cuba-corojo' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '8062b68dd3baf1a54ed121039b9d412b608d403b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'cuba-criollo' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '04325868f376d12eb06ece2c1246aa47fb34554c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'cuba-habano-2000' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '83fb6ee1d646e7426e98a2fde1068c80f6eca861';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'dominicaine-olor' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '57324d40894c9571ced926d055a1a063028800aa';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'dominicaine-piloto-cubano' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '8678ef9bf522c2911cf7af30d9387df8a6957bc4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'dominicaine-san-vicente' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = 'c5980e76502f5d3be374c74f115997b432ae1319';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'equateur-connecticut' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '8ea97b93543b8fb3bfc3a85e46252b4f452315c0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'equateur-habano' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '7f0bd6e40f4898f71df3f0f2c646fba94d8e380f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'equateur-sumatra' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = 'c8bad560889582e43ae4d354e0cb7a81de154df2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'honduras-connecticut-shade' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '1875d405daffdc0d291b94555a82789bb67d1557';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'honduras-corojo' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '00c0c5f439fd8ce175337dfaa1b09718df5c06ec';
-- feuilles|indonesie-besuki|notes|en — incohérence : Douceur → Sweetness ici, alors que Mildness partout ailleurs dans le lot pour ce terme
UPDATE `feuilles` SET `notes_en` = '["Mildness","Aromatic","Dry hay"]'
 WHERE `id` = 'indonesie-besuki' AND SHA1(TRIM(`notes`)) = '2868daa9ef5c4c98705ab33168554738ea946b01';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'indonesie-besuki' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '2868daa9ef5c4c98705ab33168554738ea946b01';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'indonesie-deli' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = 'c83d63468c20a352ab3ffd579a80c972016a5926';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'italie-kentucky' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '8b5370761ac7a8bd4f71adf0b2ee14dffb616511';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'jamaique-cow-tongue' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '54f6b02891b1b058b2fd0a9ff324e0eac03bd6b7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'mexique-negro-san-andres' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '52a7ee94f1f9ba76b3d4455f70230dbb17a8b0fc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'nicaragua-corojo-99' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = 'b6149b0117e0fe4b96b7f9d85acbaf82870120cf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'nicaragua-criollo-98' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = 'd72f2357877e13cf2878ac1a9e400e65f72f040d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'nicaragua-habano' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '56bc7f5e9cdf2488bc1a9a5f9c2218b761c9b2d7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'nicaragua-havana-92' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '56bc7f5e9cdf2488bc1a9a5f9c2218b761c9b2d7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'panama-corojo' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '7bf643e68046b26ffb000c682fefda63b6e475d2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'panama-habano' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '56bc7f5e9cdf2488bc1a9a5f9c2218b761c9b2d7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'philippines-cagayan' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = 'b6c703ccf4ec1ff17fd05d29161d4c44c80ba596';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'usa-broadleaf' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '59c11d1e68a2e54c8c58fec95b7381881632d73e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'usa-connecticut-shade' AND `champ` = 'notes' AND `lang` = 'en' AND `source_hash` = '1875d405daffdc0d291b94555a82789bb67d1557';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'bresil-arapiraca' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '5448e6678dbf92a4afc5dbdab59f5237bc5844fa';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'bresil-mata-fina' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '92f0124b1562e83a90fb3b158868fadadf89a1b3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'bresil-mata-norte' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'f445fc5c8387b079b7a13535468f57a5625710d3';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'cameroun-cape' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '4faf3f9717cb6c6236b4f499eade54eebe1eb5d9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'canaries-la-palma' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '47c6af21efe45053ed4e4cdf86d306d5859a92ba';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'cuba-corojo' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '0b5c51596a227780ac214c9a2a14824a501444ca';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'cuba-criollo' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '81399d43bccbf92d76b2a66d71ce32016797f264';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'cuba-habano-2000' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '3fb7bea481b550f343abd39591e4a31ee697b35a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'dominicaine-olor' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '79fea25e6239b4d9e14c4dba6bd2a4dbae07b723';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'dominicaine-piloto-cubano' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '078bc21479b846b52dd4fa033f919526f8ce1515';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'dominicaine-san-vicente' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '4526f280e4a46bee262bfcb61e7d17f7b916d1b4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'equateur-connecticut' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '03add230c3318c88d13514ae1ae57bd6649dbd73';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'equateur-habano' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '9fe4315ccc865de347d1690514821c1cb9b449c2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'equateur-sumatra' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'b8d1529a680837fb832ea0cbd07a1695832dcddd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'honduras-connecticut-shade' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '54ad983a26d31772abb6191a386459e73965871a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'honduras-corojo' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '0b5c51596a227780ac214c9a2a14824a501444ca';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'indonesie-besuki' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '1ad2d1026fcbb37361305e3af28c9ebac86caac8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'indonesie-deli' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '42adc447f5ee20903e7a07a3295f73cc6726a615';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'italie-kentucky' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = 'b598d5af5d6ffe9f876955de9f4fccbc13e966d7';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'jamaique-cow-tongue' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '089566bf61336a21f1d274c8e91a72c97bbfef25';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'mexique-negro-san-andres' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '981ca7b8148a8188128a54bd4fab22973ce758b4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'nicaragua-corojo-99' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '0b5c51596a227780ac214c9a2a14824a501444ca';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'nicaragua-criollo-98' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '2c245b92c21072bbb80339c1a584091ed9f01655';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'nicaragua-habano' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '9fe4315ccc865de347d1690514821c1cb9b449c2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'nicaragua-havana-92' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '9fe4315ccc865de347d1690514821c1cb9b449c2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'panama-corojo' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '0b5c51596a227780ac214c9a2a14824a501444ca';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'panama-habano' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '9fe4315ccc865de347d1690514821c1cb9b449c2';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'philippines-cagayan' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '2dea8852b41437e0810a235fadac33fcdeba7628';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'usa-broadleaf' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '23219f8c04cbefe53799e0c6dbe1a6e9087b9b4f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'feuilles' AND `entite_id` = 'usa-connecticut-shade' AND `champ` = 'pairings' AND `lang` = 'en' AND `source_hash` = '54ad983a26d31772abb6191a386459e73965871a';

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 237';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 237', 'systeme', 'traductions_relues', 'systeme', 0, 'Relecture « en » par expert-traduction (agent) : 186 traduction(s) relue(s) — 20 corrigee(s), 166 validee(s) telles quelles ; feuilles 186');

SELECT
  (SELECT COUNT(*) FROM `translation_status` WHERE `lang` = 'en' AND `statut` = 'relu' AND `relecteur` = 'expert-traduction (agent)') >= 186 AS relues,
  (SELECT COUNT(*) FROM `translation_status` WHERE `statut` = 'relu' AND (`relecteur` IS NULL OR `relecteur` = '')) = 0 AS chaque_relecture_a_son_relecteur;
SELECT `lang`, SUM(`statut` = 'relu') AS relues, COUNT(*) AS total FROM `translation_status` GROUP BY `lang`;
