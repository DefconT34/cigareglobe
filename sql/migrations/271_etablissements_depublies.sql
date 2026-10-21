-- ════════════════════════════════════════════════════════
-- 271 — Vague 2, fin : quinze établissements dépubliés, aucune page ne les atteste
-- ────────────────────────────────────────────────────────
-- POURQUOI. L'audit signalait une dizaine d'offres invraisemblables (golfs, marinas,
-- hôtels, port) dont le nom d'espace à cigares ne figurait sur aucune page. Relues le
-- 21 octobre 2026 (site du lieu, presse, guides) : quinze n'ont aucune page qui
-- établisse un espace à cigares actuel. Elles sont dépubliées (`is_verified` = 0, source
-- préfixée « RETIRÉ ») : réversible, à rétablir si une page est apportée. Restent
-- publiées, à vérifier sur le site du lieu : Churchill Bar (280), One°15 Marina Club
-- (1464), Alvear Palace (2524, sans date de lecture) ; et à corriger de nom et de
-- description : Sofitel Metropole Hanoi (141, « Angelina — Habanos Lounge », 2024), Yacht
-- Club de Monaco (1614, « Hemingway Cigar Lounge », réservé aux membres, mai 2026), Hotel
-- Nacional (1564, lounge à l'étage, non le Bar Vista al Golfo), Raffles (1463, Bar &
-- Billiard Room, source faible).
-- ════════════════════════════════════════════════════════

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 21 octobre 2026 : aucune page du Norfolk ni de Fairmont ne mentionne une terrasse « Lord Delamere » à cigares ; à rétablir si une page est apportée', `updated_at` = NOW()
 WHERE `id` = 825 AND `country_id` = 'kenya';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 21 octobre 2026 : aucune page du Royal Golf de Marrakech ne mentionne un espace à cigares ; à rétablir si une page est apportée', `updated_at` = NOW()
 WHERE `id` = 1202 AND `country_id` = 'morocco';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 21 octobre 2026 : Catharina''s est le restaurant du domaine, non un salon à cigares ; à rétablir si une page est apportée', `updated_at` = NOW()
 WHERE `id` = 1209 AND `country_id` = 'southafrica';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 21 octobre 2026 : aucune page du Golf National ne mentionne un espace à cigares ; à rétablir si une page est apportée', `updated_at` = NOW()
 WHERE `id` = 1247 AND `country_id` = 'france';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 21 octobre 2026 : aucune page de Paris Yacht Marina ne mentionne un espace à cigares ; à rétablir si une page est apportée', `updated_at` = NOW()
 WHERE `id` = 1248 AND `country_id` = 'france';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 21 octobre 2026 : aucune page de Puerto Banús ne mentionne un salon à cigares sous ce nom ; à rétablir si une page est apportée', `updated_at` = NOW()
 WHERE `id` = 1267 AND `country_id` = 'spain';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 21 octobre 2026 : aucune page du club ne mentionne un salon à cigares ; à rétablir si une page est apportée', `updated_at` = NOW()
 WHERE `id` = 1278 AND `country_id` = 'germany';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 21 octobre 2026 : aucune page du Savoy ne mentionne un espace à cigares à l''American Bar ; à rétablir si une page est apportée', `updated_at` = NOW()
 WHERE `id` = 1301 AND `country_id` = 'uk';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 21 octobre 2026 : aucune page de Wentworth ne mentionne une « Cigar Terrace » : nom d''espace sans source ; à rétablir si une page est apportée', `updated_at` = NOW()
 WHERE `id` = 1302 AND `country_id` = 'uk';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 21 octobre 2026 : aucune page du port ne mentionne un « Ocean Terminal Cigars » : nom d''espace sans source ; à rétablir si une page est apportée', `updated_at` = NOW()
 WHERE `id` = 1303 AND `country_id` = 'uk';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 21 octobre 2026 : aucune page du Kansai Golf Club ne mentionne une « Cigar Terrace » : nom d''espace sans source ; à rétablir si une page est apportée', `updated_at` = NOW()
 WHERE `id` = 1429 AND `country_id` = 'japan';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 21 octobre 2026 : aucune page du club ne mentionne un « Cigar Deck » : nom d''espace sans source ; à rétablir si une page est apportée', `updated_at` = NOW()
 WHERE `id` = 1450 AND `country_id` = 'hongkong';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 21 octobre 2026 : aucune page du Sentosa Golf Club ne mentionne un bar à cigares ; à rétablir si une page est apportée', `updated_at` = NOW()
 WHERE `id` = 1466 AND `country_id` = 'singapore';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 21 octobre 2026 : les cigares ne sont attestés que pour le passé (ancienne salle Monkeyshines), non pour la Tap Room actuelle ; à rétablir si une page est apportée', `updated_at` = NOW()
 WHERE `id` = 1509 AND `country_id` = 'usa';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 21 octobre 2026 : aucune page du Royal Melbourne ne mentionne des cigares au Spike Bar ; à rétablir si une page est apportée', `updated_at` = NOW()
 WHERE `id` = 1612 AND `country_id` = 'australia';

SELECT COUNT(*) = 15 AS quinze_depubliees FROM `lounges` WHERE `is_verified` = 0 AND `source` LIKE 'RETIRÉ — relu le 21 octobre 2026%';
