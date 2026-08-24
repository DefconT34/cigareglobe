<?php
// ════════════════════════════════════════════════════════
// backend/aromes.php — les familles d'arômes, en un seul endroit
// ────────────────────────────────────────────────────────
// Extrait de data.php pour que tools/coherence_check.php puisse
// vérifier les listes de notes SANS charger le routeur de l'API.
//
// La première version de ce contrôle testait `function_exists` et se
// sautait elle-même quand la fonction manquait : elle ne pouvait pas
// échouer, donc elle ne protégeait de rien. Deuxième fois dans ce
// chantier — après le test du lexique — qu'un contrôle mesure sa
// propre disponibilité au lieu de la propriété voulue.
// ════════════════════════════════════════════════════════

/**
 * Famille d'illustration d'une note ou d'un accord, deduite du FRANCAIS.
 *
 * Soixante-quatre libelles distincts se ramenent a une quinzaine de
 * familles : sept variantes de cafe, huit de rhum, quatre de bois. On
 * illustre la famille, pas le libelle — sinon il faudrait dessiner
 * « Cafe Blue Mountain » et « Cafe allonge » separement pour un
 * resultat identique.
 *
 * L'ORDRE DES REGLES COMPTE. « The noir fume » doit tomber dans « the »
 * et non dans « fumee » ; « Note boisee » dans « bois ». Les regles les
 * plus specifiques passent donc devant.
 *
 * Rend une chaine vide quand rien ne correspond : le front n'affiche
 * alors pas d'icone plutot qu'un point d'interrogation. Un libelle
 * nouveau degrade proprement.
 */
function famille_arome(string $terme): string {
    $t = mb_strtolower($terme);
    // Accents retires pour que « cafe », « the » et « epices » matchent
    // quelle que soit la saisie.
    //
    // ATTENTION : la translitteration d'iconv ne rend PAS « cafe » mais
    // « caf'e » — elle remplace l'accent par le signe diacritique isole.
    // « cedre » devient « c`edre », « patisserie » devient « p^atisserie ».
    // Sans le nettoyage qui suit, la moitie des regles rataient en
    // silence et les libelles accentues n'avaient pas d'icone.
    $t = (string)iconv('UTF-8', 'ASCII//TRANSLIT//IGNORE', $t);
    $t = (string)preg_replace('/[^a-z0-9 ]/', '', $t);

    $regles = [
        'the'         => ['the '],            // AVANT « fumee » : « the noir fume »
        'cafe'        => ['cafe'],
        'cacao'       => ['cacao', 'chocolat'],
        // « grappa » ajoutee avec l'Italie (053) : sans elle, l'accord
        // le plus evident du Toscano ne tombait dans aucune famille et
        // s'affichait sans icone ni glose — muet, comme avant 051.
        'spiritueux'  => ['rhum', 'bourbon', 'mezcal', 'cachaca', 'grappa'],
        'vin'         => ['vin', 'champagne', 'porto', 'malvoisie'],
        'biere'       => ['biere', 'stout'],
        'fruits'      => ['fruit', 'amande'],
        'patisserie'  => ['patisserie'],
        'bois'        => ['bois', 'cedre'],
        'epices'      => ['epice', 'poivre'],
        'foin'        => ['foin', 'pain grille', 'grille'],
        'fleur'       => ['fleur', 'floral', 'aromatique', 'arome'],
        // « terre » AVANT « douceur » : dans « Terre sucree », c'est la
        // terre qui domine, pas le sucre.
        'terre'       => ['terre'],
        'douceur'     => ['douceur', 'creme', 'sucre'],
        'cuir'        => ['cuir'],
        'force'       => ['corps', 'force'],
        'fumee'       => ['fumee'],
    ];
    foreach ($regles as $famille => $motifs) {
        foreach ($motifs as $m) if (mb_strpos($t, $m) !== false) return $famille;
    }
    return '';
}

/** @param string[] $termes @return string[] */
function familles_aromes(array $termes): array {
    return array_map(fn($t) => famille_arome((string)$t), $termes);
}
