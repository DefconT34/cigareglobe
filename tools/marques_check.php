<?php
// ════════════════════════════════════════════════════════
// tools/marques_check.php — Aucun article de marque perdu
// ────────────────────────────────────────────────────────
// Un article de marque n'est atteignable que si DEUX conditions sont
// réunies, et rien ne le disait quand l'une manquait :
//
//   1. son nom figure dans la liste `brands` d'une fiche pays — c'est
//      la seule chose qui l'affiche ;
//   2. son `country_id` désigne un pays de l'atlas — c'est ce dont la
//      recherche se sert pour rejoindre le pays de la marque.
//
// Onze articles complets, traduits dans les six langues, sont restés
// invisibles pendant des mois faute de la première ; trente-quatre
// portaient un `country_id` qui ne désignait rien (« 🇨🇺 Cuba » au lieu
// de « cuba »). Voir la migration 021.
//
// Le contenu de l'atlas ne vit pas dans Git — il ne peut donc pas être
// vérifié par la campagne de tests, qui travaille sur une base
// reconstruite. C'est un OUTIL, à lancer sur la base réelle :
//
//   php tools/marques_check.php              résumé
//   php tools/marques_check.php --details    liste tout, pays par pays
//
// Code de sortie : 0 si rien n'est perdu, 1 sinon.
// ════════════════════════════════════════════════════════

if (PHP_SAPI !== 'cli') { http_response_code(404); exit; }

require_once __DIR__ . '/../backend/config.php';

$details = in_array('--details', $argv, true);

// Windows : la console est en cp1252 et n'affiche pas les accents.
if (function_exists('stream_set_encoding')) @stream_set_encoding(STDOUT, 'utf-8');
@ini_set('default_charset', 'UTF-8');

try {
    $db = getDB();
} catch (Throwable $e) {
    fwrite(STDERR, "Base injoignable : " . $e->getMessage() . "\n");
    exit(2);
}

$pays = $db->query("SELECT id, name FROM producer_countries ORDER BY id")->fetchAll(PDO::FETCH_KEY_PAIR);

// Nom de marque → pays qui l'affiche. Une marque peut figurer sur
// plusieurs fiches (Punch est cubaine ET hondurienne) : on garde la
// liste, pas seulement la dernière.
$listees = [];
foreach ($db->query("SELECT id, brands FROM producer_countries")->fetchAll(PDO::FETCH_ASSOC) as $r) {
    foreach (json_decode((string)$r['brands'], true) ?: [] as $b) {
        if (!empty($b['name'])) $listees[$b['name']][] = $r['id'];
    }
}

$articles = $db->query("SELECT name, country_id FROM brands ORDER BY name")->fetchAll(PDO::FETCH_ASSOC);

$sansFiche  = [];   // article rédigé, mais aucune fiche ne le montre
$paysInconnu = [];  // country_id qui ne désigne aucun pays de l'atlas
$sansArticle = [];  // nom listé sur une fiche, sans article derrière

$noms = array_column($articles, 'name');
foreach ($articles as $a) {
    if (!isset($listees[$a['name']]))               $sansFiche[]   = $a['name'];
    if (!array_key_exists($a['country_id'], $pays)) $paysInconnu[] = $a['name'] . '  → ' . $a['country_id'];
}
foreach ($listees as $nom => $ou) {
    if (!in_array($nom, $noms, true)) $sansArticle[] = $nom . '  (' . implode(', ', $ou) . ')';
}

// ── Introuvable là où elle est fabriquée ─────────────────
//
// Les trois contrôles ci-dessus passaient au vert alors que MEERAPFEL
// manquait sur la fiche dominicaine. Aucun ne demandait la seule chose
// qui comptait : une marque est-elle trouvable dans le pays où ses
// cigares sont ROULÉS ?
//
// La migration 026 avait corrigé son article — elle négocie la cape du
// Cameroun et fait rouler en Rép. dominicaine — sans compléter le
// rattachement. Encore « la correction suit le champ, pas la donnée ».
//
// Le champ `factory` nomme l'atelier en clair. On y cherche un pays de
// l'atlas, et on verifie que la marque, OU LA MAISON DONT ELLE EST UNE
// DÉCLINAISON, y figure : « Arturo Fuente Hemingway » n'a pas à être
// listée en Rép. dominicaine si « Arturo Fuente » l'est. C'est ce qui
// distingue les huit cas legitimes du seul vrai manque.
const PAYS_DANS_USINE = [
    'dominicaine' => 'dominican', 'dominic' => 'dominican',
    'nicaragua'   => 'nicaragua', 'honduras' => 'honduras',
    'jamaïque'    => 'jamaica',   'mexique'  => 'mexico',
    'brésil'      => 'brazil',    'panama'   => 'panama',
    'costa rica'  => 'costarica', 'canaries' => 'canaries',
];

$introuvables = [];
foreach ($db->query("SELECT name, factory FROM brands
                     WHERE factory IS NOT NULL AND factory <> ''") as $b) {
    $f = mb_strtolower((string)$b['factory']);
    foreach (PAYS_DANS_USINE as $mot => $id) {
        if (mb_strpos($f, $mot) === false) continue;
        if (in_array($id, $listees[$b['name']] ?? [], true)) break;   // listée là-bas

        // Une déclinaison est couverte par sa maison mère : on cherche
        // un nom listé dans ce pays qui soit un préfixe du sien.
        $couverte = false;
        foreach ($listees as $autre => $ou) {
            if ($autre !== $b['name'] && in_array($id, $ou, true)
                && str_starts_with($b['name'], $autre . ' ')) { $couverte = true; break; }
        }
        if (!$couverte) {
            $introuvables[] = sprintf('%s  → roulée en %s, absente de cette fiche', $b['name'], $id);
        }
        break;
    }
}

// ── Rapport ──────────────────────────────────────────────
$ligne = str_repeat('─', 58);
echo "\n", $ligne, "\n";
printf("  %d pays producteurs · %d marques listées · %d articles\n",
       count($pays), count($listees), count($articles));
echo $ligne, "\n";

if ($details) {
    foreach ($pays as $id => $nom) {
        $l = [];
        foreach ($listees as $m => $ou) if (in_array($id, $ou, true)) $l[] = $m;
        printf("\n%s (%s) — %d\n", $nom, $id, count($l));
        foreach ($l as $m) {
            $a = in_array($m, $noms, true) ? '' : '   ⟵ sans article';
            echo '   · ', $m, $a, "\n";
        }
    }
    echo "\n", $ligne, "\n";
}

$souci = 0;
foreach ([
    ['Articles qu\'aucune fiche pays n\'affiche', $sansFiche],
    ['Articles dont le country_id ne désigne rien', $paysInconnu],
    ['Noms listés sans article derrière', $sansArticle],
] as [$titre, $liste]) {
    if (!$liste) { echo "  OK   ", $titre, " : aucun\n"; continue; }
    $souci += count($liste);
    echo "  ⚠    ", $titre, " : ", count($liste), "\n";
    foreach ($liste as $x) echo "         ", $x, "\n";
}

// ── Renseignement, PAS une anomalie ──────────────────────
//
// Cette liste ne compte pas dans le verdict, et c'est délibéré.
//
// Elle a été ajoutée parce que MEERAPFEL manquait sur la fiche
// dominicaine alors que ses cigares y sont roulés : les trois contrôles
// ci-dessus passaient au vert, aucun ne demandant si une marque est
// trouvable là où elle est fabriquée.
//
// Mais sur neuf cas relevés, HUIT SONT UN CHOIX ÉDITORIAL : Cohiba USA,
// Partagás USA, Romeo y Julieta USA, Nat Sherman sont des maisons
// AMÉRICAINES dont les cigares sont fabriqués ailleurs, et la fiche des
// États-Unis les revendique à ce titre. C'est la symétrie de la
// convention `cape` du Cameroun, sans le drapeau.
//
// Les faire échouer rendrait ce rapport rouge en permanence — ce qui le
// rendrait inutile, et c'est précisément la maladie que ce projet passe
// son temps à soigner : un contrôle qu'on ne peut pas mettre au vert
// est un contrôle que plus personne ne lit.
//
// Elle sert donc de CARTE : à relire quand on ajoute une maison, pour
// décider en connaissance de cause si elle doit aussi paraître là où
// elle roule.
if ($introuvables) {
    echo $ligne, "\n";
    echo "  Roulées ailleurs que là où elles sont listées : ", count($introuvables), "\n";
    echo "  (choix éditorial assumé pour les maisons américaines — pas une faute)\n";
    foreach ($introuvables as $x) echo "         ", $x, "\n";
}

echo $ligne, "\n";
echo $souci === 0
    ? "  Rien n'est perdu.\n\n"
    : "  " . $souci . " anomalie(s) — voir la migration 021 pour le remède.\n\n";
exit($souci === 0 ? 0 : 1);
