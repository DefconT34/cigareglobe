<?php
// ════════════════════════════════════════════════════════
// carte_lib.php — Le lien de carte, construit et non stocké
// ────────────────────────────────────────────────────────
// CE QUI A OUVERT CE FICHIER. La colonne `maps_url` contenait un lien
// Google Maps FABRIQUÉ, au moment de la saisie, à partir du nom et de
// la ville de la fiche. Quatre cent dix-neuf fiches en portaient un ;
// aucun ne contenait de coordonnées, tous étaient des RECHERCHES.
//
// Une valeur dérivée qu'on range dans une colonne ne se met pas à jour
// toute seule. Les migrations 143 à 148 ont corrigé des noms et des
// adresses — Bertie, Sautter, le Royal Monceau, Dakar, Bogotá — sans
// toucher à `maps_url` : la fiche affichait la bonne adresse, et le
// bouton « Google Maps ↗ » envoyait à l'ancienne.
//
// C'est le pire endroit où se tromper. Le lien de carte n'est pas lu,
// il est SUIVI : quelqu'un le clique pour s'y rendre.
//
// LA SORTIE N'EST PAS DE METTRE À JOUR LA COLONNE. Elle serait à
// remettre à jour au prochain changement de nom, et le défaut
// reviendrait le jour où on oublierait — c'est-à-dire un jour. On
// CONSTRUIT le lien au moment de l'afficher, depuis les valeurs que la
// fiche porte à cet instant. Il ne peut alors plus être en retard.
//
// La colonne est vidée par la migration 149. Une colonne qu'on ne lit
// plus mais qui garde d'anciennes valeurs est un piège pour le suivant.
//
// USAGE
//   php backend/carte_lib.php --autotest    les cas construits
// ════════════════════════════════════════════════════════

if (PHP_SAPI !== 'cli' && !defined('CARTE_INCLUDE')) { http_response_code(404); exit; }

/**
 * La requête envoyée à Google Maps : « nom, ville, rue ».
 *
 * Les fiches écrivent leur adresse avec un tiret cadratin — « Dakar —
 * 40 rue Jules Ferry », « Bertie's — The Fleming ». Ce tiret sépare
 * deux informations ; pour une recherche, une virgule fait le même
 * travail et se comprend mieux.
 *
 * LE DOUBLON EST RETIRÉ. « El Fumador — Dakar » et « Dakar — 40 rue
 * Jules Ferry » donneraient « El Fumador, Dakar, Dakar, 40 rue Jules
 * Ferry ». Répéter la ville ne trompe pas Google, mais le lien est lu
 * par des humains quand ils le survolent.
 */
function carte_requete(string $nom, string $ville): string {
    $brut = trim($nom) . ' — ' . trim($ville);
    // Tirets cadratin et demi-cadratin entourés d'espaces : des séparateurs.
    $brut = str_replace([' — ', ' – '], ', ', $brut);

    $vus = [];
    foreach (explode(',', $brut) as $bout) {
        $bout = trim($bout);
        if ($bout === '') continue;
        // Un segment identique au précédent ne dit rien de plus.
        if ($vus && mb_strtolower(end($vus)) === mb_strtolower($bout)) continue;
        $vus[] = $bout;
    }
    return implode(', ', $vus);
}

/**
 * Le lien de carte d'une fiche, ou null s'il n'y a rien à désigner.
 *
 * Les COORDONNÉES l'emportent quand elles existent : elles désignent un
 * point, là où une recherche par nom peut tomber sur un homonyme à
 * l'autre bout de la ville.
 */
function carte_lien(string $nom, string $ville, $lat = null, $lon = null): ?string {
    if ($lat !== null && $lon !== null && $lat !== '' && $lon !== '') {
        return 'https://www.google.com/maps/search/?api=1&query=' . rawurlencode($lat . ',' . $lon);
    }
    $q = carte_requete($nom, $ville);
    if ($q === '') return null;
    return 'https://www.google.com/maps/search/?api=1&query=' . rawurlencode($q);
}

// ════════════════════════════════════════════════════════
// AUTOTEST
// ════════════════════════════════════════════════════════
function carte_autotest(): int {
    $echecs = 0;
    $dire = function (bool $ok, string $titre, string $obtenu = '') use (&$echecs) {
        printf("  [%s] %s%s\n", $ok ? 'ok' : 'KO', $titre, $ok || $obtenu === '' ? '' : "  ($obtenu)");
        if (!$ok) $echecs++;
    };

    $cas = [
        // Le cas qui a ouvert le fichier : la ville est repetee.
        ['El Fumador — Dakar', 'Dakar — 40 rue Jules Ferry',
         'El Fumador, Dakar, 40 rue Jules Ferry', 'le doublon de ville saute'],
        // Un nom sans tiret, une ville avec adresse.
        ['Sautter of Mayfair', 'London — 106 Mount Street, Mayfair, W1K 2TW',
         'Sautter of Mayfair, London, 106 Mount Street, Mayfair, W1K 2TW', 'nom simple'],
        // Deux informations differentes ne se dedupliquent pas.
        ['Davidoff — Kuala Lumpur (Pavilion KL)', 'Kuala Lumpur — Lot 2.33.02',
         'Davidoff, Kuala Lumpur (Pavilion KL), Kuala Lumpur, Lot 2.33.02', 'ville proche mais differente'],
        // Espaces et virgules en trop.
        ['  Cave  ', '  Paris ,, 8e  ', 'Cave, Paris, 8e', 'blancs et virgules vides'],
        // Tiret demi-cadratin.
        ['A – B', 'C', 'A, B, C', 'tiret demi-cadratin'],
        // CONTRE-EPREUVE : un tiret SANS espaces n'est pas un separateur,
        // c'est un trait d'union — « Jean-Paul », « Rhode-Saint-Genese ».
        ['Bar Jean-Paul', 'Cotonou—Centre', 'Bar Jean-Paul, Cotonou—Centre', 'trait d union preserve'],
    ];
    foreach ($cas as [$n, $v, $attendu, $titre]) {
        $got = carte_requete($n, $v);
        $dire($got === $attendu, 'requete : ' . $titre, $got);
    }

    // ── Le lien ─────────────────────────────────────────
    $l = carte_lien('El Fumador — Dakar', 'Dakar — 40 rue Jules Ferry');
    $dire(is_string($l) && str_contains($l, 'El%20Fumador%2C%20Dakar%2C%2040%20rue'),
          'lien : la requete est encodee', (string)$l);

    // Les coordonnees l'emportent, et ne sont pas noyees dans le nom.
    $l = carte_lien('El Fumador — Dakar', 'Dakar — 40 rue Jules Ferry', '14.6928', '-17.4467');
    $dire($l === 'https://www.google.com/maps/search/?api=1&query=14.6928%2C-17.4467',
          'lien : les coordonnees l emportent', (string)$l);

    // CONTRE-EPREUVE : une seule des deux ne suffit pas — une latitude
    // sans longitude ne designe rien, et retomber sur elle seule mettrait
    // le point sur l equateur.
    $l = carte_lien('X', 'Y', '14.6928', null);
    $dire(is_string($l) && str_contains($l, 'X%2C%20Y'),
          'lien : une latitude seule ne suffit pas', (string)$l);

    // Rien a designer : pas de lien plutot qu un lien vide.
    $dire(carte_lien('', '') === null, 'lien : rien a designer, pas de lien');

    printf("carte --autotest : %d cas, %d echec(s)\n", count($cas) + 4, $echecs);
    return $echecs === 0 ? 0 : 1;
}

if (PHP_SAPI === 'cli' && !defined('CARTE_INCLUDE')
    && in_array('--autotest', $argv ?? [], true)) {
    exit(carte_autotest());
}
